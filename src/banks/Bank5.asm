section "bank5",romx,bank[$05]

label_14000::
    ld   [hl], b
    inc  bc
    ld   [hl], b
    inc  hl
    ld   [hl], d
    inc  bc
    ld   [hl], d
    inc  hl
    ld   [hl], h
    inc  bc
    halt
    ld   a, b
    inc  bc
    ld   a, d
    inc  bc
    halt
    ld   [hl], h
    inc  hl
    ld   a, d
    inc  hl
    ld   a, b
    inc  hl
    ld   a, h
    inc  bc
    ld   a, h
    inc  hl

label_1401C::
    ld   b, b
    inc  bc
    ld   b, b
    inc  hl
    ld   b, d
    inc  bc
    ld   b, d
    inc  hl
    ld   b, h
    inc  bc
    ld   b, [hl]
    inc  bc
    ld   c, b
    inc  bc
    ld   c, d
    inc  bc
    ld   b, [hl]
    inc  hl
    ld   b, h
    inc  hl
    ld   c, d
    inc  hl
    ld   c, b
    inc  hl
    ld   c, h
    inc  bc
    ld   c, h
    inc  hl
    ld   a, c
    ld   [$D154], a
    ld   a, [$DB56]
    cp   $01
    jr   nz, label_14054
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

label_14054::
    ld   de, label_1401C
    ld   a, [$DB56]
    and  a
    jr   nz, label_14060
    ld   de, label_14000

label_14060::
    call label_3BC0
    ld   a, [$C124]
    and  a
    jr   z, label_1407C
    ld   a, [$DB56]
    cp   $01
    jp   z, label_140A2
    ld   hl, $C3E0
    add  hl, bc
    ld   a, [$FFF6]
    cp   [hl]
    ret  z
    jp   label_140A2

label_1407C::
    ld   a, [$C1A8]
    ld   hl, $C19F
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jp   nz, label_140A2
    ld   a, [$C16B]
    cp   $04
    ret  nz
    call label_144CB
    call label_C56
    ld   a, [$DB56]
    and  a
    jr   nz, label_1409F
    call label_3B70

label_1409F::
    call label_140A5

label_140A2::
    jp   label_14253

label_140A5::
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    rst  0
    xor  a
    ld   b, b
    and  $40
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    add  a, $04
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   e, $10
    ld   hl, $D100

label_140C1::
    ldi  [hl], a
    dec  e
    jr   nz, label_140C1
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    sub  a, [hl]
    ld   e, $10
    ld   hl, $D110

label_140DC::
    ldi  [hl], a
    dec  e
    jr   nz, label_140DC
    ld   hl, $C440
    add  hl, bc
    inc  [hl]
    ret
    ld   a, [$DB56]
    and  a
    jr   z, label_14137
    cp   $80
    jr   z, label_140FA
    ld   a, [$FF98]
    ld   [$FFD7], a
    ld   a, [$FFB3]
    ld   [$FFD8], a
    jr   label_14129

label_140FA::
    ld   a, [$FF99]
    sub  a, $40
    add  a, $10
    cp   $20
    jr   nc, label_14127
    ld   a, [$FF98]
    sub  a, $88
    add  a, $10
    cp   $20
    jr   nc, label_14127
    ld   a, [$C133]
    and  a
    jr   z, label_14127
    ld   a, $10
    ld   [$D368], a
    ld   a, $6C
    call label_2373
    ld   a, $18
    ld   [$FFF3], a
    ld   a, $01
    ld   [$DB56], a

label_14127::
    jr   label_14137

label_14129::
    ld   a, [$FFD7]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a

label_14137::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$D150], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   [$D151], a
    call label_17AEA
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   e, l
    ld   d, h
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_14160
    xor  a
    ld   [hl], a
    ld   [de], a

label_14160::
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    add  a, b
    ld   b, c
    rst  8
    ld   b, c
    db   $EB ; Undefined instruction
    ld   b, c
    ld   c, $42
    db   $EB ; Undefined instruction
    ld   b, c

label_14170::
    inc  b
    ld   [label_80C], sp
    db   $FC ; Undefined instruction
    ld    hl, sp+$F4
    ld    hl, sp+$F4
    ld    hl, sp+$04
    ld   [label_80C], sp
    db   $FC ; Undefined instruction
    ld    hl, sp+$CD
    dec  b
    inc  c
    jr   z, label_141B1
    call label_C00
    jr   nz, label_141B0
    call label_280D
    and  $3F
    add  a, $20
    ld   [hl], a
    call label_3B12
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_14170
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_14178
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_141B0::
    ret

label_141B1::
    call label_C05
    ld   [hl], $28
    ld   a, [$DB56]
    and  a
    jr   z, label_141BF
    jp   label_14297

label_141BF::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    call label_3B12
    ld   [hl], $02
    ld   a, $20
    jp   label_3BAA
    call label_C00
    jr   nz, label_141DA
    ld   [hl], $20
    call label_3B12
    ld   [hl], b

label_141DA::
    ld   a, [$FFE8]
    and  a
    jr   z, label_141E5
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10

label_141E5::
    call label_17AB1
    jp   label_14228
    call label_C05
    jr   z, label_141F9
    call label_17AB1
    call label_14228
    dec  e
    jr   z, label_14206

label_141F9::
    call label_3D7F
    call label_3B12
    ld   [hl], $03
    call label_C05
    ld   [hl], $10

label_14206::
    ld   a, [$DB56]
    and  a
    ret  z
    jp   label_14335
    call label_C05
    jr   nz, label_14227
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a
    ld   a, [$DB56]
    and  a
    jr   z, label_14223
    ld   [hl], $10

label_14223::
    call label_3B12
    ld   [hl], b

label_14227::
    ret

label_14228::
    ld   e, $01
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    add  a, $20
    cp   $40
    jr   c, label_1423E
    ld   a, [$FFEE]
    ld   [hl], a
    inc  e

label_1423E::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    add  a, $20
    cp   $40
    jr   c, label_14252
    ld   a, [$FFEF]
    ld   [hl], a
    inc  e

label_14252::
    ret

label_14253::
    call label_143A8
    call label_143FE
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   e, l
    ld   d, h
    push bc
    ld   c, $05

label_14268::
    ld   a, [$FFE7]
    xor  c
    rra
    jr   c, label_1428E
    ld   hl, $D110
    add  hl, bc
    ld   a, [hl]
    ld   [de], a
    inc  de
    ld   hl, $D100
    add  hl, bc
    ld   a, [hl]
    add  a, $04
    ld   [de], a
    inc  de
    ld   a, [$DB56]
    and  a
    ld   a, $4E
    jr   nz, label_14288
    ld   a, $7E

label_14288::
    ld   [de], a
    inc  de
    ld   a, $00
    ld   [de], a
    inc  de

label_1428E::
    dec  c
    jr   nz, label_14268
    pop  bc
    ld   a, $03
    jp   label_3DA0

label_14297::
    ld   a, [$DB56]
    cp   $80
    jp   z, label_1432F
    call label_280D
    ld   d, b
    and  $01
    jr   nz, label_142AF
    ld   e, $0F
    ld   a, $FF
    ld   [$FFD7], a
    jr   label_142B7

label_142AF::
    ld   e, $00
    ld   a, $01
    ld   [$FFD7], a
    ld   a, $10

label_142B7::
    ld   [$FFD8], a

label_142B9::
    ld   a, e
    cp   c
    jr   z, label_14323
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_14323
    cp   $01
    jr   z, label_14323
    ld   hl, $C3B0
    add  hl, de
    ld   a, [hl]
    dec  a
    jr   z, label_14323
    push de
    ld   hl, $C3A0
    add  hl, de
    ld   e, [hl]
    call label_3925
    pop  de
    and  a
    jr   z, label_14323
    ld   hl, $C200
    add  hl, de
    ld   a, [$FF98]
    sub  a, [hl]
    add  a, $2F
    cp   $5E
    jr   nc, label_14323
    ld   hl, $C210
    add  hl, de
    ld   a, [$FF99]
    sub  a, [hl]
    add  a, $2F
    cp   $5E
    jr   nc, label_14323
    ld   a, e
    ld   [$D152], a
    ld   a, [$FF99]
    push af
    ld   a, [$FF98]
    push af
    ld   a, [hl]
    ld   [$FF99], a
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    ld   [$FF98], a
    ld   a, $30
    call label_3BAA
    pop  af
    ld   [$FF98], a
    pop  af
    ld   [$FF99], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10
    call label_3B12
    ld   [hl], $04
    ret

label_14323::
    ld   hl, $FFD7
    ld   a, e
    add  a, [hl]
    ld   e, a
    ld   hl, $FFD8
    cp   [hl]
    jr   nz, label_142B9

label_1432F::
    call label_C05
    ld   [hl], $10
    ret

label_14335::
    ld   a, [$D152]
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $0E
    cp   $1A
    ret  nc
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $10
    cp   $20
    ret  nc
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $3D
    jr   nz, label_14380
    ld   hl, $C440
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C05
    ld   [hl], b
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    ld   [hl], $80
    ld   a, $15
    jp   label_2373

label_14380::
    ld   hl, $C420
    add  hl, de
    ld   a, [hl]
    and  a
    ret  nz
    ld   a, $03
    ld   [$FFF2], a
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $AD
    jr   nz, label_143A0
    ld   hl, $C420
    add  hl, de
    ld   [hl], $18
    ld   hl, $C3D0
    add  hl, de
    inc  [hl]
    ret

label_143A0::
    push bc
    ld   c, e
    ld   b, d
    call label_3F50
    pop  bc
    ret

label_143A8::
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$D100], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C310
    add  hl, bc
    sub  a, [hl]
    ld   [$D110], a
    ld   de, $D100
    ld   hl, $D101
    push bc
    ld   c, $05

label_143C6::
    ld   a, [de]
    sub  a, [hl]
    add  a, $07
    cp   $0E
    jr   c, label_143D8
    bit  7, a
    jr   nz, label_143D6
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_143D6::
    dec  [hl]
    dec  [hl]

label_143D8::
    inc  hl
    inc  de
    dec  c
    jr   nz, label_143C6
    ld   de, $D110
    ld   hl, $D111
    ld   c, $05

label_143E5::
    ld   a, [de]
    sub  a, [hl]
    add  a, $07
    cp   $0E
    jr   c, label_143F7
    bit  7, a
    jr   nz, label_143F5
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_143F5::
    dec  [hl]
    dec  [hl]

label_143F7::
    inc  hl
    inc  de
    dec  c
    jr   nz, label_143E5
    pop  bc
    ret

label_143FE::
    ld   a, [$DB56]
    and  a
    ret  z
    cp   $80
    ret  z
    ld   a, [$FF9B]
    ld   hl, $FF9A
    or   [hl]
    ld   hl, $FFA3
    or   [hl]
    jp   z, label_144CA
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$D106], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   [$D116], a
    ld   de, $D106
    ld   hl, $D105
    push bc
    ld   bc, $0006

label_1442D::
    ld   a, [de]
    sub  a, [hl]
    add  a, $07
    cp   $0E
    jr   c, label_14448
    bit  7, a
    jr   nz, label_1443F
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_1443F::
    dec  [hl]
    dec  [hl]
    dec  [hl]
    ld   a, c
    cp   $01
    jr   nz, label_14448
    inc  b

label_14448::
    dec  hl
    dec  de
    dec  c
    jr   nz, label_1442D
    ld   de, $D116
    ld   hl, $D115
    ld   c, $06

label_14455::
    ld   a, [de]
    sub  a, [hl]
    add  a, $07
    cp   $0E
    jr   c, label_14473
    bit  7, a
    jr   nz, label_14467
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_14467::
    dec  [hl]
    dec  [hl]
    dec  [hl]
    ld   a, c
    cp   $01
    jr   nz, label_14473
    ld   a, b
    or   $02
    ld   b, a

label_14473::
    dec  hl
    dec  de
    dec  c
    jr   nz, label_14455
    ld   a, b
    ld   [$FFD7], a
    pop  bc
    and  $01
    jr   z, label_14499
    ld   hl, $D110
    ld   e, $06

label_14485::
    ld   a, [$D151]
    sub  a, [hl]
    jr   z, label_14492
    bit  7, a
    jr   nz, label_14491
    inc  [hl]
    inc  [hl]

label_14491::
    dec  [hl]

label_14492::
    inc  hl
    dec  e
    jr   nz, label_14485
    call label_144B5

label_14499::
    ld   a, [$FFD7]
    and  $02
    jr   z, label_144CA
    ld   hl, $D100
    ld   e, $06

label_144A4::
    ld   a, [$D150]
    sub  a, [hl]
    jr   z, label_144B1
    bit  7, a
    jr   nz, label_144B0
    inc  [hl]
    inc  [hl]

label_144B0::
    dec  [hl]

label_144B1::
    inc  hl
    dec  e
    jr   nz, label_144A4

label_144B5::
    ld   a, [$D110]
    ld   hl, $C310
    add  hl, bc
    add  a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   a, [$D100]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a

label_144CA::
    ret

label_144CB::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    or   [hl]
    ret  z
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    ld   d, a
    bit  7, a
    jr   z, label_144E2
    cpl
    inc  a

label_144E2::
    ld   e, a
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, label_144EE
    cpl
    inc  a

label_144EE::
    cp   e
    jr   nc, label_144FE
    bit  7, d
    jr   nz, label_144F9
    ld   e, $04
    jr   label_14509

label_144F9::
    ld   e, $02
    jp   label_14509

label_144FE::
    bit  7, [hl]
    jr   z, label_14507
    ld   a, $06
    jp   label_3B0C

label_14507::
    ld   e, $00

label_14509::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, e
    jp   label_3B0C

label_14514::
    ld   d, b
    ld   bc, label_152
    ld   d, h
    ld   bc, label_156
    ld   d, d
    ld   hl, label_2150
    ld   d, [hl]
    ld   hl, label_2154
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $4C
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_14538
    ld   a, [$FFF1]
    add  a, $02
    ld   [$FFF1], a

label_14538::
    ld   de, label_14514
    call label_3BC0
    ld   a, [$FFEA]
    cp   $07
    jr   nz, label_14557
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_1454E
    ld   a, $13
    ld   [$FFF3], a

label_1454E::
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    jp   label_3B0C

label_14557::
    call label_17A3A
    call label_3B70
    call label_C56
    ld   a, [$FFF0]
    cp   $03
    jr   z, label_14580
    call label_17AEA
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_14580
    xor  a
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], a

label_14580::
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_145BF
    cp   $08
    jr   nz, label_145B7
    ld   a, [$DB73]
    and  a
    jr   z, label_145AD
    dec  [hl]
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_145AD
    call label_280D
    and  $3F
    jr   nz, label_145A8
    ld   a, $76
    call label_237C
    jr   label_145AD

label_145A8::
    ld   a, $8F
    call label_2385

label_145AD::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $23
    jr   z, label_145B7
    inc  [hl]

label_145B7::
    call label_3B12
    ld   a, $02
    ld   [hl], a
    ld   [$FFF0], a

label_145BF::
    call label_3B5A
    jr   nc, label_14611
    ld   a, [$FFF0]
    cp   $03
    jr   z, label_14611
    ld   a, [$C19B]
    and  a
    jr   nz, label_14611
    ld   a, [$DB00]
    cp   $03
    jr   nz, label_145DF
    ld   a, [$FFCC]
    and  $20
    jr   nz, label_145EC
    jr   label_14611

label_145DF::
    ld   a, [$DB01]
    cp   $03
    jr   nz, label_14611
    ld   a, [$FFCC]
    and  $10
    jr   z, label_14611

label_145EC::
    ld   a, [$C3CF]
    and  a
    jr   nz, label_14611
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
    call label_C05
    ld   [hl], $02
    ld   hl, $FFF3
    ld   [hl], $02
    ret

label_14611::
    ld   a, [$FFF0]
    rst  0
    inc  h
    ld   b, [hl]
    ld   h, e
    ld   b, [hl]
    xor  a
    ld   b, [hl]
    ld   c, [hl]
    ld   b, a

label_1461C::
    nop
    inc  b
    ld   b, $04
    nop
    db   $FC ; Undefined instruction
    ld   a, [$AFFC]
    call label_3B0C
    call label_C05
    ret  nz
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_1461C
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
    ld   hl, label_1461C
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
    call label_17AB1
    call label_3B23
    ld   a, [$FFE8]
    and  a
    jr   z, label_14685
    call label_C05
    jr   nz, label_1467A
    ld   [hl], $30
    call label_3B12
    ld   [hl], b
    ret

label_1467A::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $05
    ld   hl, $C310
    add  hl, bc
    inc  [hl]

label_14685::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_1468F::
    jr   z, label_146D9
    ld   l, b
    adc  a, b
    jr   label_146CD
    ld   e, b
    ld   a, b
    nop
    nop
    nop
    nop
    and  b
    and  b
    and  b
    and  b

label_1469F::
    nop
    nop
    nop
    nop
    sub  a, b
    sub  a, b
    sub  a, b
    sub  a, b
    jr   nz, label_146E9
    ld   h, b
    add  a, b
    jr   nz, label_146ED
    ld   h, b
    add  a, b
    ld   hl, $C310
    add  hl, bc
    ld   a, [$FFE7]
    xor  c
    and  $1F
    or   [hl]
    jr   nz, label_146D2
    ld   a, $0C
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

label_146CD::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a

label_146D2::
    call label_17AB1
    call label_3B23
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    call label_3B0C
    call label_17B04
    ld   hl, $C380
    add  hl, bc
    ld   a, e

label_146E9::
    xor  $01
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $23
    jr   nz, label_1474D
    ld   hl, $DBA5
    ld   a, [$FFE7]
    and  $0F
    or   [hl]
    jr   nz, label_1474D
    ld   a, $6C
    ld   e, $07
    call label_3B98
    jr   c, label_1474D
    ld   a, $13
    ld   [$FFF3], a
    ld   hl, $C290
    add  hl, de
    ld   [hl], $03
    ld   hl, $C310
    add  hl, de
    ld   [hl], $10
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C350
    add  hl, de
    ld   [hl], $80
    ld   hl, $C430
    add  hl, de
    ld   [hl], $40
    push bc
    call label_280D
    and  $0F
    ld   c, a
    ld   hl, label_1468F
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_1469F
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   c, e
    ld   b, d
    ld   a, $18
    call label_3BAA
    pop  bc

label_1474D::
    ret
    call label_3B44
    call label_17AB1
    ld   a, [$FFEE]
    cp   $A9
    jp   nc, label_17B4B
    ld   a, [$FFEC]
    cp   $91
    jp   nc, label_17B4B
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    call label_3B0C
    ld   e, $00
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_14777
    inc  e

label_14777::
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    jp   label_29F8
    ret

label_14780::
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $0010
    ld   h, h
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, [hl]
    ld   [bc], a
    nop
    nop
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $0010
    ld   l, h
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   l, [hl]
    ld   [bc], a
    nop
    nop
    ld   h, d
    ld   hl, label_800
    ld   h, b
    ld   hl, $0010
    ld   h, [hl]
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   h, h
    ldi  [hl], a
    nop
    nop
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $0010
    ld   l, h
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   l, [hl]
    ld   [bc], a

label_147C0::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_14780
    add  hl, de
    ld   c, $04
    jp   label_3CE6
    push bc
    sla  c
    sla  c
    ld   a, $0C
    ld   hl, $D580
    add  hl, bc
    inc  hl
    inc  hl
    ld   [hl], a
    ld   a, $0E
    inc  hl
    ld   [hl], a
    pop  bc
    ld   hl, $C210
    add  hl, bc
    ld   a, $40
    ld   [hl], a
    call label_147C0
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra
    rra
    and  $03
    call label_3B0C
    call label_154C3
    ld   a, [$FFF0]
    rst  0
    dec  d
    ld   c, b
    ld   e, a
    ld   c, b
    ld   a, l
    ld   c, b
    sub  a, [hl]
    ld   c, b
    rst  8
    ld   c, b
    rst  $30
    ld   c, b
    add  hl, bc
    ld   c, c
    ld   de, $FA49
    sbc  a, a
    pop  bc
    and  a
    ret  nz
    ld   a, [$DB4B]
    and  a
    jr   z, label_1484A
    call label_15506
    ld   a, e
    and  a
    ret  z
    ld   hl, $DB00
    ld   a, [hl]
    cp   $0C
    jr   nz, label_1483C
    ld   a, [$FFCC]
    and  $20
    ret  z
    xor  a
    ld   [$C1A9], a
    ld   [$C1A8], a
    jr   label_14847

label_1483C::
    inc  hl
    ld   a, [hl]
    cp   $0C
    jr   nz, label_1484A
    ld   a, [$FFCC]
    and  $10
    ret  z

label_14847::
    ld   [hl], b
    jr   label_14853

label_1484A::
    call label_15506
    ret  nc
    ld   a, $0C
    jp   label_2385

label_14853::
    xor  a
    ld   [$DB4B], a
    call label_C05
    ld   [hl], $08
    jp   label_3B12
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    ret  nz
    xor  a
    ld   [$C167], a
    jp   label_3B12
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, $09
    call label_2385
    call label_C05
    ld   [hl], $C0
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C10B]
    and  a
    jr   nz, label_148AE
    ld   a, [$FFB0]
    ld   [$D368], a
    ld   a, $01
    ld   [$C10B], a
    ld   [$C167], a

label_148AE::
    ld   [$FFA1], a
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]
    call label_C05
    ret  nz
    ld   [$C10B], a
    ld   [$C167], a
    ld   a, [$FFB0]
    ld   [$D368], a
    ld   a, $FE
    call label_2385
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $2A
    ld   [$C1AA], a
    ld   a, $03
    ld   [$C1A9], a
    ld   d, $0C
    call label_15321
    ld   a, [$DB4C]
    add  a, $20
    daa
    ld   [$DB4C], a
    ld   a, $0B
    ld   [$FFA5], a
    ld   a, $01
    ld   [$FFF2], a
    call label_3B12
    ld   a, [$C1A2]
    and  a
    ret  z
    ld   a, [$C3CC]
    and  a
    ret  nz
    ld   a, [$DDD1]
    and  a
    ret  nz
    jp   label_3B12
    ld   a, $7E
    call label_2373
    jp   label_3B12
    ret

label_14912::
    ld   a, b
    ld   [bc], a
    ld   a, d
    ld   [bc], a
    ld   a, d
    ldi  [hl], a
    ld   a, b
    ldi  [hl], a
    ld   a, h
    ld   [bc], a
    ld   a, [hl]
    ld   [bc], a
    ld   a, b
    ld   [bc], a
    ld   a, d
    ld   [bc], a
    ld   [hl], b
    ld   [bc], a
    ld   [hl], d
    ld   [bc], a
    ld   [hl], h
    ld   [bc], a
    halt
    halt
    ld   [hl], h
    ldi  [hl], a
    ld   [hl], d
    ldi  [hl], a
    ld   [hl], b
    ldi  [hl], a

label_14932::
    ld   e, d
    ldi  [hl], a
    ld   e, b
    ldi  [hl], a
    ld   e, b
    ld   [bc], a
    ld   e, d
    ld   [bc], a
    ld   d, b
    ld   [bc], a
    ld   d, d
    ld   [bc], a
    ld   d, b
    ld   [bc], a
    ld   d, d
    ld   [bc], a

label_14942::
    ld   d, h
    ld   [bc], a
    ld   d, [hl]
    ld   [bc], a

label_14946::
    ld   a, d
    rlca
    ld   a, h
    rlca

label_1494A::
    nop
    nop
    jr   nz, label_14950
    nop
    ld   [label_222], sp
    nop
    nop
    jr   nz, label_14958
    nop
    ld   [label_222], sp

label_1495A::
    pop  af
    ld   a, [label_22A]
    pop  af
    ld   [bc], a
    ld   a, [hli]
    ldi  [hl], a
    nop
    nop
    inc  h
    ld   [bc], a
    nop
    ld   [label_228], sp
    ld   a, [$DB95]
    cp   $01
    jr   nz, label_14995
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C4
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   hl, label_1494A
    cp   $70
    jr   nz, label_14986
    ld   hl, label_1495A

label_14986::
    ld   c, $04
    call label_3CE6
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $70
    ret  z
    inc  [hl]
    ret

label_14995::
    ld   a, [$DBA5]
    and  a
    jp   nz, label_14BC1
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_17B4B
    ld   a, [$FFF0]
    and  a
    jr   nz, label_149D1
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FF99]
    cp   $30
    jr   nc, label_149CC
    ld   a, $01
    ld   [$C10C], a
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $02
    call label_3B0C
    jr   label_149D1

label_149CC::
    ld   hl, $C440
    add  hl, bc
    ld   [hl], b

label_149D1::
    ld   de, label_14912
    call label_3BC0
    call label_17A3A
    ld   a, [$FFF0]
    rst  0
    push hl
    ld   c, c
    rla
    ld   c, d
    ld   b, c
    ld   c, e
    adc  a, c
    ld   c, e
    call label_154C3
    ld   a, [$FF99]
    cp   $20
    jr   nc, label_149FD
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_149FD
    ld   [hl], $01
    ld   a, $21
    jp   label_2385

label_149FD::
    call label_15506
    jr   nc, label_14A0C
    ld   a, [$C19B]
    and  a
    ret  nz
    ld   a, $0D
    jp   label_2385

label_14A0C::
    ld   hl, $C1AD
    ld   [hl], b
    ret

label_14A11::
    nop
    inc  b
    dec  b
    ld   b, $07
    ld   bc, label_23E
    ld   [$FFA1], a
    xor  a
    ld   [$C19B], a
    call label_17B24
    ld   a, e
    xor  $01
    ld   [$FF9E], a
    push bc
    call label_BF0
    pop  bc
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    jr   nc, label_14A46
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    inc  a
    cp   $06
    jr   nz, label_14A45
    xor  a

label_14A45::
    ld   [hl], a

label_14A46::
    ld   hl, $C390
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_14A11
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    call label_BFB
    jr   nz, label_14A9E
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
    ld   a, [$FFDA]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $C440
    add  hl, de
    ld   [hl], $4C
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20
    ld   a, $09
    call label_3B0C
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    call label_3B12
    ld   a, [$FFF6]
    ld   e, a
    ld   d, b
    ld   hl, $D800
    add  hl, de
    ld   a, [hl]
    or   $10
    ld   [hl], a
    ld   a, $01
    ld   [$DB48], a
    ret

label_14A9E::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_14AAE
    ld   a, [hl]
    cp   $F0
    jr   nc, label_14AAE
    inc  [hl]

label_14AAE::
    call label_17AB1
    call label_3B23
    call label_BFB
    cp   $06
    jr   nc, label_14AEC
    ld   a, [$FFEF]
    cp   $30
    jr   nc, label_14AC5
    ld   [hl], $08
    jr   label_14AEC

label_14AC5::
    ld   hl, $C320
    add  hl, bc
    inc  [hl]
    nop
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_14ADA
    and  $80
    jr   z, label_14AD9
    inc  [hl]
    inc  [hl]

label_14AD9::
    dec  [hl]

label_14ADA::
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_14AE9
    and  $80
    jr   z, label_14AE8
    inc  [hl]
    inc  [hl]

label_14AE8::
    dec  [hl]

label_14AE9::
    jp   label_17AEA

label_14AEC::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_14B01
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   a, $09
    ld   [$FFF2], a

label_14B01::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0C
    jr   z, label_14B16
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   a, $09
    ld   [$FFF2], a

label_14B16::
    call label_BFB
    cp   $60
    jr   nc, label_14B40
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_14B40
    ld   hl, $C240
    call label_14B2C
    ld   hl, $C250

label_14B2C::
    add  hl, bc
    ld   a, [hl]
    cp   $30
    jr   z, label_14B40
    cp   $D0
    jr   z, label_14B40
    ld   e, $01
    bit  7, a
    jr   z, label_14B3E
    ld   e, $FF

label_14B3E::
    add  a, e
    ld   [hl], a

label_14B40::
    ret
    ld   a, $02
    ld   [$FFA1], a
    call label_17AEA
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    ld   [hl], b
    xor  a
    ld   [$C167], a
    ld   a, $23
    ld   [$FFF2], a
    call label_27DD
    call label_C05
    ld   [hl], $40
    call label_17B24
    add  a, $08
    call label_3B0C
    call label_17B04
    add  a, $12
    cp   $24
    jr   nc, label_14B86
    call label_17B14
    add  a, $12
    cp   $24
    jr   nc, label_14B86
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $80

label_14B86::
    jp   label_3B12
    call label_C05
    cp   $01
    jr   nz, label_14B95
    ld   a, $0A
    jp   label_2385

label_14B95::
    and  a
    jr   z, label_14B9D
    ld   a, $02
    ld   [$FFA1], a
    ret

label_14B9D::
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_14BAB
    call label_17B24
    add  a, $08
    call label_3B0C

label_14BAB::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_14BB6
    call label_154C3

label_14BB6::
    call label_15506
    ret  nc
    ld   a, $0B
    jp   label_2385

label_14BBF::
    ld   a, b
    nop

label_14BC1::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_14BF1
    ld   de, label_14BBF
    call label_3C77
    call label_17A3A
    call label_17AB1
    call label_C05
    jp   z, label_17B4B
    and  $10
    ld   e, $01
    jr   z, label_14BE3
    ld   e, $FF

label_14BE3::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_14BF0
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    add  a, e
    ld   [hl], a

label_14BF0::
    ret

label_14BF1::
    ld   a, [$DB73]
    and  a
    jr   nz, label_14C07
    ld   a, [$DB67]
    and  $02
    jp   nz, label_17B4B
    ld   a, [$DB0E]
    cp   $04
    jp   nc, label_17B4B

label_14C07::
    ld   a, [$DB48]
    and  a
    jr   nz, label_14C14
    ld   a, [$DB4E]
    and  a
    jp   nz, label_17B4B

label_14C14::
    ld   a, [$DB73]
    and  a

label_14C18::
    jr   nz, label_14C24
    ld   a, [$DB48]
    and  a
    jr   z, label_14C43
    cp   $01
    jr   nz, label_14C43

label_14C24::
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $18
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $34
    call label_3D8A
    ld   a, [$FFFE]
    and  a
    jr   z, label_14C3E
    ld   de, label_14946
    call label_3BC0

label_14C3E::
    ld   de, label_14942
    jr   label_14C57

label_14C43::
    call label_14DCF
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_14C54
    call label_17B24
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], e

label_14C54::
    ld   de, label_14932

label_14C57::
    call label_3BC0
    call label_17A3A
    call label_154C3
    ld   a, [$FFF0]
    rst  0
    ld   l, l
    ld   c, h
    sbc  a, h
    ld   c, h
    ret  z
    ld   c, h
    add  hl, bc
    ld   c, l
    and  e
    ld   c, l
    ld   a, [$DB44]
    and  a
    jr   z, label_14C79
    call label_3B12
    ld   [hl], $03
    ret

label_14C79::
    ld   a, [$FF99]
    cp   $7B
    jr   c, label_14C88
    sub  a, $02
    ld   [$FF99], a
    ld   a, $00
    jp   label_2385

label_14C88::
    call label_15506
    ret  nc
    ld   a, $54
    call label_2385
    jp   label_3B12

label_14C94::
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_14C9B

label_14C9B::
    nop
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C05
    ld   [hl], $80
    ld   a, $10
    ld   [$D368], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_14CC3
    ld   hl, $DC88
    ld   de, label_14C94

label_14CB6::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $07
    jr   nz, label_14CB6
    ld   a, $02
    ld   [$DDD1], a

label_14CC3::
    jp   label_3B12

label_14CC6::
    add  a, [hl]
    rla
    call label_C05
    jr   nz, label_14CE6
    ld   [$C167], a
    ld   d, $04
    call label_15321
    ld   a, $01
    ld   [$DB44], a
    ld   a, $22
    ld   [$FF9D], a
    ld   a, $91
    call label_2385
    jp   label_3B12

label_14CE6::
    ld   a, [$FF98]
    ld   [$FFEE], a
    ld   a, [$FF99]
    sub  a, $0C
    ld   [$FFEC], a

label_14CF0::
    xor  a
    ld   [$FFF1], a
    ld   de, label_14CC6
    call label_3C77
    call label_3D8A
    ld   a, $6C
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $03
    ld   [$FF9E], a
    ret
    ld   a, [$DB48]
    and  a
    jr   z, label_14D4D
    cp   $01
    jr   z, label_14D38
    call label_15506
    jr   nc, label_14D2C
    ld   a, [$DB73]
    and  a
    ld   a, $DD
    jr   nz, label_14D35
    ld   a, [$DB0E]
    cp   $03
    jr   nz, label_14D33
    ld   a, $C5
    call label_2373

label_14D2C::
    ld   a, [$DB73]
    and  a
    jr   nz, label_14D5D
    ret

label_14D33::
    ld   a, $C5

label_14D35::
    jp   label_2373

label_14D38::
    call label_15506
    jr   nc, label_14D4B
    ld   a, [$DB65]
    bit  1, a
    ld   a, $11
    jr   z, label_14D48
    ld   a, $10

label_14D48::
    call label_2385

label_14D4B::
    jr   label_14D56

label_14D4D::
    call label_15506
    ret  nc
    ld   a, $55
    jp   label_2385

label_14D56::
    ld   a, [$DB48]
    cp   $01
    jr   nz, label_14DA2

label_14D5D::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    add  a, $07
    ld   [hl], a
    jr   nc, label_14DA2
    ld   a, $3F
    call label_3B86
    ld   a, [$FFD7]
    add  a, $06
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    sub  a, $03
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C240
    add  hl, de
    ld   [hl], $FF
    ld   hl, $C250
    add  hl, de
    ld   [hl], $FD
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $30
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C1
    ld   hl, $C350
    add  hl, de
    ld   [hl], $00

label_14DA2::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_14DC6
    ld   a, [$C177]
    and  a
    jr   nz, label_14DBD
    ld   a, $04
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    call label_C0C
    jr   label_14DC2

label_14DBD::
    ld   a, $C9
    call label_2373

label_14DC2::
    call label_3B12
    ld   [hl], b

label_14DC6::
    ret

label_14DC7::
    ld   [hl], h
    rlca
    halt

label_14DCB::
    ld   [hl], b
    nop
    ld   [hl], d
    nop

label_14DCF::
    ld   a, [$DB48]
    cp   $02
    ret  nz
    ld   a, [$DB0E]
    cp   $04
    jr   nc, label_14DE3
    ld   a, $78
    ld   de, label_14DC7
    jr   label_14DF3

label_14DE3::
    ld   a, [$FFF8]
    and  $20
    ret  z
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $4B
    ld   de, label_14DCB
    ld   a, $7C

label_14DF3::
    ld   [$FFEE], a
    ld   a, $5C
    ld   [$FFEC], a
    xor  a
    ld   [$FFF1], a
    call label_3BC0
    call label_3D8A
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF1], a
    ret

label_14E0A::
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

label_14E2A::
    ld   l, b
    ld   bc, label_16A
    ld   l, d
    ld   hl, label_2168
    ld   h, [hl]
    ld   bc, label_2166
    ld   h, [hl]
    ld   bc, label_2166
    ld   l, h
    ld   bc, label_16E
    ld   l, h
    ld   bc, label_16E
    ld   l, [hl]
    ld   hl, label_216C
    ld   l, [hl]
    ld   hl, label_216C
    ld   h, b
    ld   bc, label_162
    ld   h, h
    ld   bc, label_2164
    ld   h, d
    ld   hl, label_2160

label_14E56::
    ld   [label_808], sp
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    add  hl, bc

label_14E5E::
    ld   [label_6F8], sp
    ld   bc, $95FA
    db   $DB
    cp   $01
    jp   z, label_14EE0
    ld   a, [$DB73]
    and  a
    jp   nz, label_17B4B
    ld   a, [$DBA5]
    and  a
    jp   nz, label_151CE
    ld   a, [$DB4E]
    and  a
    jp   z, label_17B4B
    ld   a, [$FFF6]
    cp   $C0
    jr   c, label_14E87
    jr   label_14E96

label_14E87::
    ld   a, [$D808]
    and  $10
    jr   nz, label_14E96
    ld   a, [$DB0E]
    cp   $07
    jp   nc, label_17B4B

label_14E96::
    push bc
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, $D580
    add  hl, bc
    inc  hl
    inc  hl
    ld   [hl], $08
    inc  hl
    ld   [hl], $0B
    pop  bc
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_14ED1
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $03
    call label_17B04
    add  a, $14
    cp   $28
    jr   nc, label_14ED1
    call label_17B14
    add  a, $14
    cp   $28
    jr   nc, label_14ED1
    call label_17B24
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_14ED1::
    call label_154EA
    ld   a, [$C3C8]
    cp   $01
    jr   nz, label_14F39
    call label_C00
    jr   nz, label_14F39

label_14EE0::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $07

label_14EE8::
    ld   e, a
    ld   d, b
    ld   hl, label_14E56
    add  hl, de
    ld   a, [hl]
    ld   [$FFF1], a
    ld   a, [$FFE7]
    add  a, $10
    and  $1F
    jr   nz, label_14F39
    ld   a, $C9
    call label_3B86
    jr   c, label_14F39
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    sub  a, $08
    ld   [hl], a
    push bc
    ld   a, [$FFE7]
    add  a, $10
    rra
    rra
    rra
    rra
    rra
    and  $01
    ld   c, a
    ld   hl, label_14E5E
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_14E60
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, de
    ld   [hl], $FC
    ld   hl, $C3D0
    add  hl, de
    ld   [hl], $40
    pop  bc

label_14F39::
    ld   a, c
    ld   [$C50F], a
    ld   de, label_14E2A
    call label_3BC0
    call label_154C3
    ld   a, [$DB95]
    cp   $07
    ret  z
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFF0]
    rst  0
    ld   h, h
    ld   c, a
    jr   nz, label_14FAC
    ld   e, c
    ld   d, b
    dec  hl
    ld   d, c
    ld   h, c
    ld   d, c
    cp   h
    ld   d, c
    ld   a, [$FFF6]
    cp   $C0
    jr   nc, label_14F6F
    ld   a, [$C3C8]
    and  a
    ret  nz

label_14F6F::
    call label_15506
    ret  nc
    ld   a, [$D808]
    and  $10
    jr   z, label_14FA7
    ld   hl, $D892
    ld   a, [hl]
    and  $40
    jr   nz, label_14F89
    set  6, [hl]
    ld   a, $94
    jp   label_2373

label_14F89::
    ld   a, [$DB49]
    and  $04
    jr   z, label_14F95

label_14F90::
    ld   a, $95
    jp   label_2373

label_14F95::
    ld   e, $0B
    ld   hl, $DB00

label_14F9A::
    ld   a, [hli]
    cp   $09
    jr   z, label_14FA7
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_14F9A
    jr   label_14F90

label_14FA7::
    call label_C00
    ld   [hl], $10

label_14FAC::
    ld   d, $2F
    ld   e, $03
    ld   a, [$DB48]
    and  a
    jr   z, label_14FFB
    ld   e, $06
    cp   $02
    jr   nz, label_14FD0
    ld   e, $05
    ld   a, [$FFF6]
    cp   $C0
    jr   c, label_14FD0
    push de
    call label_27DD
    pop  de
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], b
    ld   e, $92

label_14FD0::
    push bc
    ld   c, $0B
    ld   hl, $DB00

label_14FD6::
    ld   a, [hli]
    cp   $09
    jr   nz, label_14FF4
    ld   e, $04
    ld   d, $4A
    ld   a, [$DB49]
    and  $04
    jr   z, label_14FFA
    ld   e, $05
    ld   d, $2F
    ld   a, [$FFF6]
    cp   $C0
    jr   c, label_14FFA
    ld   e, $92
    jr   label_14FFA

label_14FF4::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_14FD6

label_14FFA::
    pop  bc

label_14FFB::
    ld   a, e
    cp   $80
    jr   c, label_15005
    call label_2373
    jr   label_15008

label_15005::
    call label_2385

label_15008::
    ld   a, [$FFF6]
    cp   $C0
    jr   c, label_15018
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], b
    push de
    call label_27DD
    pop  de

label_15018::
    ld   hl, $C440
    add  hl, bc
    ld   [hl], d
    jp   label_3B12
    call label_17A3A
    ld   hl, $C440
    add  hl, bc
    ld   d, [hl]

label_15028::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   a, d
    jr   nz, label_1503E
    inc  [hl]
    ld   [$D368], a
    ld   [$FFB0], a
    ld   [$FFBD], a
    ld   hl, $C3C8
    ld   [hl], $01

label_1503E::
    cp   $4A
    jr   nz, label_15054
    ld   a, [$DB49]
    and  $04
    jr   nz, label_15054
    call label_3B12
    xor  a
    ld   [$D210], a
    ld   [$D211], a
    ret

label_15054::
    call label_3B12
    ld   [hl], b
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    push bc
    call label_BF0
    pop  bc
    ld   a, [$D211]
    cp   $07
    jr   nz, label_1508A
    ld   a, [$D210]
    cp   $E8
    jr   nz, label_1508A
    ld   a, $16
    call label_2385
    push bc
    call label_BF0
    pop  bc
    xor  a
    ld   [$D210], a
    ld   [$D211], a
    call label_27F2
    jp   label_3B12

label_1508A::
    call label_17B24
    ld   a, e
    xor  $01
    ld   [$FF9E], a
    ld   a, [$D210]
    add  a, $01
    ld   [$D210], a
    ld   e, a
    ld   a, [$D211]
    adc  a, $00
    ld   [$D211], a
    ld   d, a
    ld   a, [$D211]
    cp   $07
    jr   nz, label_150B7
    ld   a, [$D210]
    cp   $E0
    jr   c, label_150B7
    xor  a
    ld   [$C3C8], a
    ret

label_150B7::
    ld   hl, $C3C8
    ld   [hl], $01
    ld   a, e
    srl  d
    rra
    srl  d
    rra
    srl  d
    rra
    srl  d
    rra
    cp   $1D
    jr   c, label_150D2
    cp   $3B
    jr   nc, label_150D2
    inc  [hl]

label_150D2::
    cp   $1D
    ret  c
    ld   a, $00
    ld   [$FF9D], a
    ld   a, [$FFE7]
    ld   e, $75
    and  $40
    jr   z, label_150E2
    inc  e

label_150E2::
    ld   a, e
    ld   [$FF9D], a
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_1512A
    ld   a, $C9
    call label_3B86
    jr   c, label_1512A
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, de
    sub  a, $08
    ld   [hl], a
    push bc
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $01
    ld   c, a
    ld   b, d
    ld   hl, label_14E5E
    add  hl, bc
    ld   a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_14E60
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    pop  bc
    ld   hl, $C250
    add  hl, de
    ld   [hl], $FC
    ld   hl, $C3D0
    add  hl, de
    ld   [hl], $40

label_1512A::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_1515E
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_1514F
    ld   a, $01
    ld   [$DE00], a
    ld   a, $10
    ld   [$D368], a
    ld   a, $05
    call label_AC6
    call label_C05
    ld   [hl], $80
    ret

label_1514F::
    ld   a, $15
    call label_2385
    call label_3B12
    ld   [hl], $01
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], b

label_1515E::
    ret

label_1515F::
    sub  a, b
    rla
    ld   a, $01
    ld   [$DE00], a
    call label_C05
    jr   nz, label_15197
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   hl, $DB49
    set  2, [hl]
    xor  a
    ld   [$DB4A], a
    call label_3B12
    ld   a, [$FFF6]
    cp   $C0
    jr   c, label_15183
    ld   [hl], b

label_15183::
    xor  a
    ld   [$C167], a
    ld   a, [$FFF6]
    cp   $C0
    jr   nc, label_15192
    ld   a, $14
    jp   label_2385

label_15192::
    ld   a, $93
    jp   label_2373

label_15197::
    cp   $08
    jr   nz, label_151A1
    dec  [hl]
    ld   a, $13
    call label_2385

label_151A1::
    ld   a, $6C
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, [$FF98]
    ld   [$FFEE], a
    ld   a, [$FF99]
    sub  a, $0C
    ld   [$FFEC], a
    ld   de, label_1515F
    xor  a
    ld   [$FFF1], a
    jp   label_3C77
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_15506
    ret  nc
    ld   a, $97
    jp   label_2373

label_151CA::
    ld   e, h
    nop
    ld   e, h
    jr   nz, label_151C9
    ld   c, $DB
    cp   $07
    jr   c, label_151FB
    ld   a, [$D8FD]
    and  $30
    jp   nz, label_17B4B
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $60
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $7A
    ld   de, label_151CA
    call label_3BC0
    call label_17A3A
    call label_15506
    ret  nc
    ld   a, $D7
    jp   label_2373

label_151FB::
    ld   a, [$DB4E]
    and  a
    jp   nz, label_17B4B
    ld   a, [$DB44]
    and  a
    jr   z, label_15211
    ld   hl, $C290
    add  hl, bc
    ld   a, $03
    ld   [hl], a
    ld   [$FFF0], a

label_15211::
    ld   a, [$FFF0]
    and  a
    jr   nz, label_15237
    call label_BFB
    ld   [hl], $7F
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   [hl], a
    ld   [$C167], a
    jp   label_3B12

label_15237::
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_15245
    call label_17B24
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_15245::
    call label_154EA
    ld   de, label_14E0A
    call label_3BC0
    ld   a, [$FFF0]
    dec  a
    rst  0
    sub  a, h
    ld   d, d
    db   $DB
    ld   d, d
    ld   [de], a
    ld   d, e

label_15258::
    ld   b, b
    rlca
    ld   b, d
    rlca
    ld   b, d
    daa
    ld   b, b
    daa
    ld   b, h
    nop
    ld   b, [hl]
    nop
    ld   c, b
    nop
    ld   c, d
    nop
    ld   c, b
    nop
    ld   c, h
    nop

label_1526C::
    nop
    nop
    ld   c, [hl]
    ld   b, $00
    ld   [label_264E], sp

label_15274::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    ld   bc, $0001
    nop
    ld   bc, $0001
    nop
    ld   bc, $0001
    nop
    ld   bc, $CD01
    ei
    dec  bc
    jr   nz, label_152A4
    ld   a, $01
    call label_2385
    ld   [hl], $40
    call label_3B12
    xor  a

label_152A4::
    rra
    rra
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, label_15274
    add  hl, de
    ld   a, [hl]

label_152AF::
    ld   [$FFF1], a
    ld   a, $38
    ld   [$FFEE], a
    ld   [$FF98], a
    ld   a, $34
    ld   [$FFEC], a
    ld   [$FF99], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $FF
    ld   [$FF9D], a
    ld   de, label_15258
    call label_3BC0
    ld   a, [$FFFE]
    and  a
    jr   z, label_152D8
    ld   hl, label_1526C
    ld   c, $02
    call label_3CE6

label_152D8::
    jp   label_3D8A
    ld   a, $03
    call label_152AF
    call label_C05
    ld   hl, $C19F
    or   [hl]
    jr   nz, label_15311
    ld   a, [$FFCB]
    and  $0F
    jr   z, label_15311
    call label_3B12
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
    ld   [$FFA1], a
    ld   a, $01
    ld   [$C10A], a

label_15311::
    ret
    call label_17A3A
    call label_154C3
    call label_15506
    ret  nc
    ld   a, $02
    jp   label_2385

label_15321::
    ld   hl, $DB00
    ld   e, $0C

label_15326::
    ld   a, [hli]
    cp   d
    jr   z, label_1533D
    dec  e
    jr   nz, label_15326
    ld   hl, $DB00

label_15330::
    ld   a, [hl]
    and  a
    jr   nz, label_15336
    ld   [hl], d
    ret

label_15336::
    inc  hl
    inc  e
    ld   a, e
    cp   $0C
    jr   nz, label_15330

label_1533D::
    ret

label_1533E::
    ld   h, b
    nop
    ld   h, d
    nop
    ld   h, d
    jr   nz, label_153A5
    jr   nz, label_153AB
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    jr   nz, label_153B1
    jr   nz, label_153B7
    nop
    ld   l, d
    nop
    ld   l, h
    nop
    ld   l, [hl]
    nop
    ld   l, d
    jr   nz, label_153C1

label_15359::
    jr   nz, label_153C9
    jr   nz, label_153C9
    jr   nz, label_15359
    and  l
    db   $DB
    and  a
    jr   z, label_153DC
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_15372
    call label_17B24
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_15372::
    call label_154EA
    ld   de, label_1533E
    call label_3BC0
    call label_17A3A
    call label_154C3
    ld   a, [$FFF0]
    rst  0
    adc  a, d
    ld   d, e
    sbc  a, h
    ld   d, e
    bit  2, e
    ld   a, [$D477]
    and  a
    jr   nz, label_153CB
    call label_15506
    ret  nc
    ld   a, $F0
    call label_2385
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   z, label_153AC
    ld   [hl], b

label_153AB::
    ret

label_153AC::
    ld   a, [$DB5E]
    sub  a, $00

label_153B1::
    ld   a, [$DB5D]
    sbc  a, $01
    jr   c, label_153C5
    ld   a, $64
    ld   [$DB92], a
    ld   a, $F1
    ld   [$D477], a
    jp   label_2385

label_153C5::
    ld   [hl], b
    ld   a, $4E
    jp   label_2385

label_153CB::
    call label_15506
    ret  nc
    ld   a, $F1
    jp   label_2385

label_153D4::
    ld   e, h
    ld   bc, label_215C
    ld   e, [hl]
    ld   bc, label_215E

label_153DC::
    ld   hl, $C440
    add  hl, bc
    ld   a, [$D477]
    or   [hl]
    jr   nz, label_15411
    ld   e, $0F
    ld   d, b

label_153E9::
    ld   a, e
    cp   c
    jr   z, label_153FF
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_153FF
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $6A
    jp   z, label_17B4B

label_153FF::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_153E9
    ld   de, label_153D4
    call label_3BC0
    call label_17A3A
    jp   label_154C3

label_15411::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_15440
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $1C
    jr   nc, label_15440
    ld   a, $80
    ld   [$C1AD], a
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a

label_15440::
    ld   a, [$C11F]
    and  a
    jr   z, label_1544C
    call label_3B12
    ld   [hl], b
    jr   label_15487

label_1544C::
    ld   a, [$FFF0]
    rst  0
    ld   d, l
    ld   d, h
    ld   l, h
    ld   d, h
    sub  a, b
    ld   d, h
    call label_17B04
    add  a, $08
    cp   $10
    jr   nc, label_1546A
    call label_17B14
    add  a, $09
    cp   $12
    jr   nc, label_1546A
    call label_3B12

label_1546A::
    jr   label_15487
    ld   a, [$FFEE]
    ld   [$FF98], a
    ld   a, [$FFEC]
    sub  a, $05
    ld   [$FF99], a
    call label_3B12
    ld   hl, $C440
    add  hl, bc
    ld   [hl], $01
    xor  a
    ld   [$D477], a

label_15483::
    ld   a, $01
    ld   [$FFB2], a

label_15487::
    call label_3D8A
    ld   de, label_153D4
    jp   label_3BC0
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    ld   [$C13B], a
    ld   a, [$FFF6]
    ld   hl, $C3E0
    add  hl, bc
    ld   [hl], a
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    add  a, $05
    ld   [hl], a
    ld   hl, $C310
    add  hl, bc
    ld   [hl], b
    ld   a, [$C11C]
    cp   $02
    jr   nz, label_154C1
    ld   a, [$FFA2]
    ld   [hl], a

label_154C1::
    jr   label_15483

label_154C3::
    call label_3B5A
    jr   nc, label_154E5
    call label_CBE
    call label_CB6
    ld   a, [$C1A6]
    and  a
    jr   z, label_154E5
    ld   e, a
    ld   d, b
    ld   hl, $C39F
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_154E5
    ld   hl, $C28F
    add  hl, de
    ld   [hl], $00

label_154E5::
    ret

label_154E6::
    ld   b, $04
    ld   [bc], a
    nop

label_154EA::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_154E6
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

label_15506::
    ld   e, b
    ld   a, [$FFEB]
    cp   $40
    jr   nz, label_15519
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $2B
    jr   label_15523

label_15519::
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $28

label_15523::
    jr   nc, label_15569
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_15569
    inc  e
    ld   a, [$FFEB]
    cp   $6D
    jr   z, label_15544
    push de
    call label_17B24
    ld   a, [$FF9E]
    xor  $01
    cp   e
    pop  de
    jr   nz, label_15569

label_15544::
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ld   hl, $C134
    or   [hl]
    jr   nz, label_15569
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_15569
    ld   a, [$FFCC]
    and  $10
    jr   z, label_15569
    scf
    ret

label_15569::
    and  a
    ret
    call label_BFB
    ld   [hl], $C0
    ld   a, $18
    ld   [$D202], a
    ret
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    rst  0
    add  a, h
    ld   d, l
    db   $3A ; ldd  a, [hl]
    ld   e, c
    ld   bc, $8459
    ld   e, c
    call label_3EE8
    call label_158D4
    ld   a, [$FFEA]
    cp   $05
    jr   z, label_155CA
    ld   [$C1C6], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    sbc  a, l
    ld   d, l
    xor  e
    ld   d, l
    call label_C05
    ld   [hl], $FF
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    jp   label_16347
    call label_C05
    jp   z, label_155BC
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    cp   $80
    ret  nc
    jp   label_17550

label_155BC::
    call label_17585
    ld   hl, $C480
    add  hl, de
    ld   [hl], $08
    ret

label_155C6::
    ld    hl, sp+$A8

label_155C8::
    ld   [$CDF8], sp
    db   $3A ; ldd  a, [hl]
    ld   a, d
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1561E
    and  $3F
    jr   nz, label_1561E
    ld   a, $65
    ld   e, $04
    call label_3B98
    jr   c, label_15650
    ld   hl, $C340
    add  hl, de
    ld   [hl], $02
    ld   hl, $C350
    add  hl, de
    ld   [hl], $80
    ld   hl, $C430
    add  hl, de
    ld   [hl], $40
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C200
    add  hl, de
    ld   a, [$D202]
    ld   [hl], a
    add  a, $20
    ld   [$D202], a
    cp   $A8
    jr   c, label_15610
    ld   a, $08
    ld   [$D202], a

label_15610::
    call label_280D
    ld   hl, $C3D0
    add  hl, de
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   [hl], $00

label_1561E::
    ld   a, [$D201]
    inc  a
    ld   [$D201], a
    and  $7F
    jr   nz, label_15650
    ld   a, $65
    ld   e, $04
    call label_3B98
    jr   c, label_15650
    ld   hl, $C340
    add  hl, de
    ld   [hl], $41
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $02
    ld   a, [$FFD7]
    sub  a, $14
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    sub  a, $04
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_15650::
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $0A
    jr   nc, label_156B1
    ld   a, [$D201]
    add  a, $40
    and  $FF
    jr   nz, label_156B1
    ld   a, $65
    ld   e, $04
    call label_3B98
    jr   c, label_156B1
    ld   hl, $C4D0
    add  hl, de
    ld   [hl], d
    ld   hl, $C340
    add  hl, de
    ld   [hl], $02
    ld   hl, $C430
    add  hl, de
    ld   [hl], d
    ld   hl, $C360
    add  hl, de
    ld   [hl], d
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], $03
    call label_280D
    and  $3F
    add  a, $20
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    push bc
    and  $01
    ld   c, a
    ld   hl, label_155C6
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_155C8
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $40
    pop  bc

label_156B1::
    call label_C56
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    rra
    rra
    rra
    rra
    and  $01
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFEE]

label_156C7::
    sub  a, $10
    ld   [$FFEE], a
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFEC], a
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $00
    call label_3AEA
    call label_3B70
    call label_3D8A
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $14
    call label_3AEA
    call label_3B44
    ld   a, [$FFF0]
    rst  0
    ld   sp, hl
    ld   d, [hl]
    scf
    ld   d, a
    ld   l, [hl]
    ld   d, a

label_156F5::
    ld   [label_160F8], sp
    jr   label_156C7
    ei
    dec  bc
    jr   nz, label_15713
    call label_C05
    ld   [hl], $80
    call label_3B12
    call label_280D
    and  $1F
    add  a, $60
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ret

label_15713::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_156F7
    add  hl, de
    ld   a, [$FFEC]
    cp   [hl]
    jr   nz, label_1572A
    ld   a, e
    xor  $01
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a

label_1572A::
    ld   hl, label_156F5
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    jp   label_17AB4
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    inc  [hl]
    call label_C05
    cp   $60
    jr   nz, label_1574A
    ld   hl, $FFF3
    ld   [hl], $0D

label_1574A::
    ret  nc
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $D0
    call label_17ABE
    ld   a, [$FFEE]
    cp   $18
    ret  nc
    ld   a, $30
    ld   [$C157], a
    xor  a
    ld   [$C158], a
    call label_C4B
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $FF
    jp   label_3B12
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    ld   a, [$C157]
    and  a
    jr   nz, label_1579B
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $20
    call label_17ABE
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFEE]
    cp   [hl]
    jr   c, label_1579B
    call label_BFB
    call label_280D
    and  $1F
    add  a, $40
    ld   [hl], a
    call label_3B12
    ld   [hl], b

label_1579B::
    ret

label_1579C::
    ld   a, [$FFF0]
    ld   b, b
    rlca
    ld   a, [$FFF8]
    ld   b, d
    rlca
    ld   a, [$FF00]
    ld   b, h
    rlca
    ld   a, [$FF08]
    ld   b, [hl]
    ld   d, $F0
    db   $10 ; Undefined instruction
    ld   d, $F0
    jr   label_157FD
    ld   d, $00
    ld   a, [$FF4C]
    rlca
    nop
    ld    hl, sp+$4E
    rlca
    nop
    nop
    ld   d, b
    ld   d, $00
    ld   [label_1652], sp
    nop
    db   $10 ; Undefined instruction
    ld   d, $00
    jr   label_15821
    ld   d, $00
    jr   nz, label_15827
    ld   d, $10
    ld    hl, sp+$5A
    ld   d, $10
    nop
    ld   e, h
    ld   d, $10
    ld   [label_165E], sp
    db   $10 ; Undefined instruction
    ld   h, b
    ld   d, $10
    jr   label_15845
    ld   d, $10
    jr   nz, label_1584B
    ld   d, $00
    nop
    rst  $38
    nop
    ld   a, [$FFF0]
    ld   h, [hl]
    rlca
    ld   a, [$FFF8]
    ld   b, d
    rlca
    ld   a, [$FF00]
    ld   b, h
    rlca
    ld   a, [$FF08]
    ld   b, [hl]
    ld   d, $F0

label_157FD::
    db   $10 ; Undefined instruction
    ld   d, $F0
    jr   label_1584D
    ld   d, $00
    ld   a, [$FF68]
    rlca
    nop
    ld    hl, sp+$4E
    rlca
    nop
    nop
    ld   d, b
    ld   d, $00
    ld   [label_1652], sp
    nop
    db   $10 ; Undefined instruction
    ld   d, $00
    jr   label_15871
    ld   d, $00
    jr   nz, label_15889
    ld   d, $10

label_15821::
    ld    hl, sp+$5A
    ld   d, $10
    nop
    ld   e, h

label_15827::
    ld   d, $10
    ld   [label_165E], sp
    db   $10 ; Undefined instruction
    ld   h, b
    ld   d, $10
    jr   label_15895
    ld   d, $10
    jr   nz, label_158A3
    ld   d, $F0
    jr   label_15885
    ld   d, $F0
    ld   [label_1646], sp
    ld   a, [$FF10]
    ld   c, b
    ld   d, $F0

label_15845::
    ld    hl, sp+$42
    rlca
    ld   a, [$FF00]
    ld   b, h

label_1584B::
    rlca
    ld   a, [$FFF0]
    ld   b, b
    rlca
    nop
    jr   nz, label_158AB
    ld   d, $00
    ld   [label_1652], sp
    nop
    db   $10 ; Undefined instruction
    ld   d, $00
    jr   label_158B5
    ld   d, $00
    ld    hl, sp+$4E
    rlca
    nop
    nop
    ld   d, b
    ld   d, $00
    ld   a, [$FF4C]
    rlca
    db   $10 ; Undefined instruction
    ld   h, h
    ld   d, $10

label_15871::
    db   $10 ; Undefined instruction
    ld   d, $10
    jr   label_158D9
    ld   d, $10
    nop
    ld   e, h
    ld   d, $10
    ld   [label_165E], sp
    db   $10 ; Undefined instruction
    ld   e, d
    ld   d, $00

label_15885::
    nop
    rst  $38
    nop
    ld   a, [$FF18]
    ld   c, d
    ld   d, $F0
    ld   [label_1646], sp
    ld   a, [$FF10]
    ld   c, b
    ld   d, $F0

label_15895::
    ld    hl, sp+$42
    rlca
    ld   a, [$FF00]
    ld   b, h
    rlca
    ld   a, [$FFF0]
    ld   h, [hl]
    rlca
    nop
    jr   nz, label_1590D

label_158A3::
    ld   d, $00
    ld   [label_1652], sp
    nop
    db   $10 ; Undefined instruction

label_158AB::
    ld   d, $00
    jr   label_15905
    ld   d, $00
    ld    hl, sp+$4E
    rlca
    nop

label_158B5::
    nop
    ld   d, b
    ld   d, $00
    ld   a, [$FF68]
    rlca
    db   $10 ; Undefined instruction
    ld   l, h
    ld   d, $10
    db   $10 ; Undefined instruction
    ld   d, $10
    jr   label_15929
    ld   d, $10
    nop
    ld   e, h
    ld   d, $10
    ld   [label_165E], sp
    db   $10 ; Undefined instruction
    ld   e, d
    ld   d, $F0
    pop  af
    sla  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_1579C
    ld   a, [$FFE7]
    and  $01
    jr   z, label_158F2
    ld   hl, label_15838

label_158F2::
    add  hl, de
    ld   c, $13
    call label_3CE6
    ld   a, $13
    jp   label_3DA0
    ld   [hl], d
    nop
    ld   [hl], d
    jr   nz, label_15913
    db   $FD ; Undefined instruction
    ld   e, b
    call label_3C77
    call label_17A3A
    ld   hl, $C3D0

label_1590D::
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra

label_15913::
    and  $01
    call label_3B0C
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    and  $30
    jr   z, label_1592A
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F8
    call label_17AB4

label_1592A::
    ld   a, [$FFEC]
    cp   $10
    jp  c, label_17B4B
    ret

label_15932::
    ld   [hl], h
    dec  b
    halt
    halt
    ld   [hl], h
    dec  h
    ld   de, label_15932
    call label_3BC0
    call label_17A3A
    call label_C56
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    push af
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_3B39
    pop  af
    ld   e, $FC
    and  $10
    jr   z, label_15962
    ld   e, $04

label_15962::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $0C
    call label_17AB1
    ld   a, [$FFEC]
    cp   $8B
    jp   nc, label_17B4B
    ret

label_15978::
    ld   a, b
    inc  bc
    ld   a, d
    inc  bc
    ld   a, h
    inc  bc
    ld   a, [hl]
    inc  bc

label_15980::
    ld   bc, label_8FF
    ld    hl, sp+$21
    ld   b, b
    jp   nz, label_17E09
    cpl
    rra
    rra
    and  $20
    ld   [$FFED], a
    ld   de, label_15978
    call label_3BC0
    call label_17A3A
    call label_C56
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_3B39
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_159CE
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    and  $01
    ld   e, a
    ld   d, b
    ld   hl, label_15980
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_15982
    add  hl, de
    cp   [hl]
    jr   nz, label_159CE
    call label_3B12

label_159CE::
    call label_17AB1
    call label_C05
    jr   nz, label_159DD
    ld   a, [$FFEE]
    cp   $A8
    jp   nc, label_17B4B

label_159DD::
    ret
    rlca
    nop
    rrca
    rlca
    ld   e, $0F

label_159E4::
    ccf
    jr   label_15A26
    db   $10 ; Undefined instruction
    inc  d
    ccf
    db   $10 ; Undefined instruction
    dec  de
    ld   [rJOYP], a
    ld   a, [$FFE0]
    jr   label_159E4
    adc  a, h
    ld   a, b
    adc  a, h
    ld   [hl], b
    ccf
    ret  nz
    rst  $38
    ld   a, $EF
    pop  af
    nop
    nop
    nop
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
    ccf
    nop
    rst  $38
    ld   a, $EF
    pop  af
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $7F
    ld   [hl], a

label_15A26::
    ld   e, $0F
    ld   d, b

label_15A29::
    ld   hl, $C280
    add  hl, de
    ld   [hl], b
    dec  e
    ld   a, e
    cp   $01
    jr   nz, label_15A29
    ld   a, [$D478]
    and  a
    jr   z, label_15A5D
    ld   a, $05
    call label_80C
    call label_15B03
    ld   hl, $C290
    add  hl, de
    ld   [hl], $07
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $60
    ld   a, $01
    ld   [$FFA5], a
    call label_3B12
    ld   [hl], $04
    ld   a, $C0
    ld   [$C210], a
    ret

label_15A5D::
    ld   a, $02
    ld   [$FFA5], a
    ld   [$D478], a
    call label_C05
    ld   [hl], $80
    ld   e, $0C
    xor  a
    ld   hl, $D790

label_15A6F::
    ldi  [hl], a
    dec  e
    jr   nz, label_15A6F
    ld   a, $02
    ld   [$D205], a
    ld   a, $5C
    ld   [$D368], a

label_15A7D::
    ret
    db   $10 ; Undefined instruction
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rst  0
    adc  a, [hl]
    ld   e, d
    ld   l, e
    ld   e, e
    ld   d, [hl]
    ld   h, d
    ret  z
    ld   h, d
    ld   a, [$FFF0]
    rst  0
    sbc  a, h
    ld   e, d
    db   $DB
    ld   e, d
    jr   c, label_15AF2
    dec  sp
    ld   e, e
    ld   c, e
    ld   e, e

label_15A9B::
    ret
    call label_15B5A
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_15A9B
    ld   a, $02

label_15AA7::
    ld   [$FFE8], a
    ld   a, $63
    call label_3B86
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_15A7D
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    sub  a, $10
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    pop  bc
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    ld   a, [$FFE8]
    dec  a
    jr   nz, label_15AA7
    call label_C05
    ld   [hl], $43
    jp   label_3B12
    call label_15B5A
    call label_17A3A
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    and  a
    jr   z, label_15AFE
    cp   $20
    ret  nz
    ld   a, [$FF99]
    push af
    ld   a, $10
    ld   [$FF99], a
    ld   a, $BA
    call label_2385
    pop  af
    ld   [$FF99], a
    ret

label_15AFE::
    ld   a, $54
    ld   [$D368], a

label_15B03::
    ld   a, $63
    call label_3B86
    ld   hl, $C360
    add  hl, de
    ld   [hl], $0C
    ld   hl, $C200
    add  hl, de
    ld   [hl], $D0
    ld   hl, $C210
    add  hl, de
    ld   [hl], $18
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C240
    add  hl, de
    ld   [hl], $E0
    ld   hl, $C380
    add  hl, de
    ld   [hl], $00
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $80
    call label_15C20
    jp   label_3B12
    jp   label_15B5A
    call label_15B5A
    call label_17A3A
    call label_17AB1
    ld   hl, $C250
    add  hl, bc
    inc  [hl]
    inc  [hl]
    ret
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $C2
    ret

label_15B52::
    ld   a, [hl]
    ld   [bc], a
    ld   a, [hl]
    ldi  [hl], a
    ld   a, [hl]
    ld   b, d
    ld   a, [hl]
    ld   h, d

label_15B5A::
    ld   de, label_15B52
    jp   label_3BC0

label_15B60::
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $0100
    inc  b
    inc  b
    inc  b
    inc  b
    call label_161F2
    ld   a, [$FFEA]
    cp   $05
    jp   nz, label_17E6C
    call label_17A3A
    call label_C56
    ld   a, [$FFF0]
    cp   $0E
    jr   z, label_15BB7
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_15BB7
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $50
    call label_3D7F
    call label_3B12
    ld   [hl], $0E
    ld   a, $31
    ld   [$FFF4], a
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $42
    ld   hl, $C2D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   nz, label_15BAC
    dec  [hl]

label_15BAC::
    ld   e, a
    ld   d, b
    ld   hl, label_15B60
    add  hl, de
    ld   a, [hl]
    ld   [$D205], a
    ret

label_15BB7::
    ld   a, [$FFF0]
    rst  0
    ret  c
    ld   e, e
    db   $EC ; Undefined instruction
    ld   e, e
    ldd  [hl], a
    ld   e, h
    ld   e, e
    ld   e, h
    adc  a, e
    ld   e, h
    xor  l
    ld   e, h
    rst  8
    ld   e, h
    inc  d
    ld   e, l
    db   $EC ; Undefined instruction
    ld   e, l
    dec  a
    ld   e, [hl]
    dec  sp
    ld   e, a
    sub  a, e
    ld   e, a
    xor  b
    ld   e, a
    rla
    ld   h, b
    jr   z, label_15C38
    call label_17AB1
    call label_C05
    ret  nz
    call label_3B12
    call label_C05
    ld   [hl], $20
    ld   a, $FF
    jp   label_3B0C
    call label_C05
    jr   nz, label_15C24
    xor  a
    call label_3B0C
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $14
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    xor  $04
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $02
    jr   z, label_15C25
    call label_3B12
    ld   [hl], b
    call label_C05
    ld   [hl], $80

label_15C20::
    ld   a, $22
    ld   [$FFF4], a

label_15C24::
    ret

label_15C25::
    call label_3B12
    call label_C05
    ld   [hl], $30
    ld   a, $30
    ld   [$FFF4], a
    ret
    call label_17AB1
    call label_C05

label_15C38::
    cp   $01
    jr   nz, label_15C41
    ld   hl, $FFF2
    ld   [hl], $30

label_15C41::
    and  a
    ret  nz
    ld   hl, $C240
    add  hl, bc
    inc  [hl]
    jr   nz, label_15C58
    call label_3B12
    call label_C05
    ld   [hl], $40
    ld   hl, $C29E
    inc  [hl]
    inc  hl
    inc  [hl]

label_15C58::
    jp   label_15C7B
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    jr   nz, label_15C7B
    ld   [hl], $28
    ld   a, $D0
    ld   [$C250], a
    ld   a, $24
    ld   [$FFF2], a
    ld   a, $12
    ld   [$C240], a
    ld   hl, $C290
    inc  [hl]
    call label_3B12

label_15C7B::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $04
    ld   a, $01
    jr   z, label_15C88
    inc  a

label_15C88::
    jp   label_3B0C
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    jr   nz, label_15CA6
    ld   a, $01
    ld   [$FFA5], a
    ld   [hl], $20
    call label_3B12
    ld   hl, $C290
    inc  [hl]
    ld   a, $C0
    ld   [$C210], a

label_15CA6::
    jp   label_15C7B

label_15CA9::
    ld   bc, label_302
    ld   [bc], a
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    jr   nz, label_15CB9
    call label_3B12

label_15CB9::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    rra
    nop
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_15CA9
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    call label_17AB1
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cp   $D4
    jr   nz, label_15CFB
    ld   a, [$FFEE]
    and  $F8
    cp   $C0
    jr   nz, label_15CEC
    call label_3B12
    call label_C05
    ld   [hl], $80
    ret

label_15CEC::
    ld   a, [$FFE7]
    and  $00
    jr   nz, label_15CF7

label_15CF2::
    ld   hl, $C250
    add  hl, bc
    dec  [hl]

label_15CF7::
    xor  a
    jp   label_3B0C

label_15CFB::
    dec  [hl]
    dec  [hl]
    call label_15CB9
    call label_15CB9
    jp   label_15CB9

label_15D06::
    ld    hl, sp+$A8

label_15D08::
    jr   nc, label_15CDA

label_15D0A::
    jr   nc, label_15D7C

label_15D0C::
    call c, label_F824
    xor  b

label_15D10::
    jr   nz, label_15CF2

label_15D12::
    inc  b
    nop
    call label_C05
    jr   nz, label_15D68
    ld   a, [$D205]
    rst  0
    daa
    ld   e, l
    ld   l, c
    ld   e, l
    and  e
    ld   e, l
    and  e
    ld   e, l
    ld   l, c
    ld   e, l
    call label_280D
    and  $03
    ld   [$D205], a
    ld   e, $00
    ld   a, [$FF98]
    cp   $50
    jr   nc, label_15D38
    inc  e

label_15D38::
    ld   d, b
    ld   hl, label_15D06
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_15D08
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_15D12
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $00
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $20
    call label_3B12
    ld   [hl], $08

label_15D68::
    ret
    ld   e, $00
    ld   a, [$FF98]
    cp   $50
    jr   nc, label_15D72
    inc  e

label_15D72::
    ld   d, b
    ld   hl, label_15D0A
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc

label_15D7C::
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], b
    ld   hl, label_15D12
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $F0
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $10
    call label_3B12
    ld   [hl], $0B
    call label_C05
    ld   [hl], $30
    ret
    call label_280D
    and  $01
    ld   e, a
    ld   d, b
    ld   hl, label_15D0E
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_15D10
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    ld   hl, label_15D12
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $3F
    add  a, $18
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   a, [$FF9C]
    and  a
    jr   z, label_15DE1
    ld   a, [$FF99]
    ld   [hl], a

label_15DE1::
    call label_3B12
    ld   [hl], $0D
    call label_C05
    ld   [hl], $70
    ret
    ld   a, $01
    call label_3B0C
    call label_17AB1
    ld   hl, $C250
    call label_15E01
    ld   a, [hl]
    and  a
    jr   z, label_15E0E
    ld   hl, $C240

label_15E01::
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_15E0D
    and  $80
    jr   nz, label_15E0C
    dec  [hl]
    dec  [hl]

label_15E0C::
    inc  [hl]

label_15E0D::
    ret

label_15E0E::
    call label_3B12
    call label_C05
    ld   [hl], $FF
    ret

label_15E17::
    xor  $12

label_15E19::
    ret  nc
    jr   nc, label_15E2C
    ld   a, [$FFD8]
    call nc, label_CCD0
    ret  z
    call nz, label_BCC0
    jr   z, label_15E53
    jr   nc, label_15E5D
    jr   c, label_15E67
    ld   b, b

label_15E2C::
    ld   b, h

label_15E2D::
    jr   nc, label_15E5D
    inc  l
    ld   a, [hli]
    jr   z, label_15E59
    inc  h
    ldi  [hl], a
    jr   nc, label_15E65
    inc  l
    ld   a, [hli]
    jr   z, label_15E61
    inc  h
    ldi  [hl], a
    call label_C05
    jp   z, label_15F30
    ld   hl, $C210
    add  hl, bc
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_15E56
    ld   a, [$FFE7]
    and  $20
    jr   z, label_15E55

label_15E53::
    inc  [hl]
    inc  [hl]

label_15E55::
    dec  [hl]

label_15E56::
    call label_15CB9

label_15E59::
    call label_15CB9
    ld   a, [$FF9C]
    and  a
    jr   nz, label_15E8A

label_15E61::
    ld   a, [$C146]
    and  a

label_15E65::
    jr   z, label_15E8A

label_15E67::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    rra
    rra
    and  $01
    ld   e, a
    ld   d, b
    ld   hl, label_15E19
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF9A
    sub  a, [hl]
    and  a
    jr   z, label_15EA3
    and  $80
    jr   nz, label_15E86
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_15E86::
    dec  [hl]
    dec  [hl]
    jr   label_15EA3

label_15E8A::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    srl  e
    srl  e
    ld   d, b
    ld   hl, label_15E17
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    push bc
    call label_21B2
    call label_3E19
    pop  bc

label_15EA3::
    ld   a, [$D210]
    inc  a
    cp   $22
    jr   c, label_15EB0
    ld   a, $32
    ld   [$FFF4], a
    xor  a

label_15EB0::
    ld   [$D210], a
    call label_C05
    cp   $C0
    jr   nc, label_15F2F
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_15F2F
    ld   a, $63
    ld   e, $03
    call label_3B98
    jr   c, label_15F2F
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $03
    push bc
    ld   hl, $C380
    add  hl, bc
    ld   c, [hl]
    srl  c
    srl  c
    ld   hl, label_15E1B
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    add  a, $0C
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   a, c
    xor  $01
    ld   [hl], a
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    sla  c
    sla  c
    sla  c
    call label_280D
    and  $07
    add  a, c
    ld   c, a
    ld   hl, label_15E2D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   hl, label_15E1D
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    pop  bc
    ld   hl, $C340
    add  hl, de
    ld   [hl], $02
    ld   hl, $C430
    add  hl, de
    ld   [hl], $00
    ld   hl, $C4D0
    add  hl, de
    ld   [hl], $02

label_15F2F::
    ret

label_15F30::
    call label_3B12
    call label_C05
    ld   [hl], $50
    ret

label_15F39::
    ld   [rNR41], a
    call label_17AB1
    call label_C05
    jr   z, label_15F78
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    rra
    rra
    and  $01
    ld   e, a
    ld   d, b
    ld   hl, label_15F39
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    and  a
    jr   z, label_15F68
    and  $80
    jr   nz, label_15F61
    inc  [hl]
    inc  [hl]

label_15F61::
    dec  [hl]
    call label_15CB9
    jp   label_15CB9

label_15F68::
    xor  a
    call label_3B0C
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_15F77
    ld   hl, $C250
    add  hl, bc
    dec  [hl]

label_15F77::
    ret

label_15F78::
    ld   hl, $C340
    add  hl, bc
    ld   [hl], $02
    call label_3B12
    ld   [hl], $07
    call label_C05
    ld   a, [$D205]
    cp   $04
    jr   nz, label_15F90
    ld   [hl], $10
    ret

label_15F90::
    ld   [hl], $80
    ret
    call label_17AB1
    call label_C05
    jr   nz, label_15FA3
    ld   [hl], $30
    call label_3B12
    call label_3D7F

label_15FA3::
    jp   label_15CB9

label_15FA6::
    ld   [rNR41], a
    call label_17AB1
    call label_C05
    jr   nz, label_15FEA
    ld   a, [$FFEC]
    cp   $B0
    jp   nc, label_15F78
    ld   a, $01
    call label_3B0C
    ld   a, [$C13E]
    and  a
    jr   nz, label_15FE9
    call label_3B39
    ld   a, [$C13E]
    and  a
    jr   z, label_15FE9
    ld   a, $10
    ld   [$C13E], a
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    srl  e
    srl  e
    ld   d, b
    ld   hl, label_15FA6
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   a, $F0
    ld   [$FF9B], a
    ld   hl, $FF99
    dec  [hl]

label_15FE9::
    ret

label_15FEA::
    cp   $01
    jr   nz, label_16008
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    srl  e
    srl  e
    ld   d, b
    ld   hl, label_15D0C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $34

label_16008::
    call label_15CB9
    call label_C05
    cp   $40

label_16010::
    ret  nc
    call label_15CB9
    jp   label_15CB9
    xor  a
    call label_3B0C
    call label_17AB1
    call label_3B39
    call label_C05
    jp   z, label_15F78
    ret
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_16040
    cp   $30
    ret  nc
    dec  a
    jr   nz, label_1603A
    ld   a, $31
    ld   [$FFF4], a

label_1603A::
    call label_15CB9
    jp   label_15CB9

label_16040::
    call label_15CB9
    call label_15CB9
    call label_15CB9
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $D0
    jr   z, label_16053
    dec  [hl]

label_16053::
    call label_17AB1
    ld   a, [$FFEC]
    and  $F0
    cp   $C0
    jr   nz, label_16061
    jp   label_15F78

label_16061::
    ret

label_16062::
    nop
    nop
    ld   b, b
    ld   bc, label_800
    ld   b, d
    ld   bc, label_1000

label_1606C::
    ld   b, h
    ld   [bc], a

label_1606E::
    ld    hl, sp+$18
    ld   b, [hl]
    ld   [bc], a
    ld    hl, sp+$20
    ld   c, b
    ld   [bc], a
    ld    hl, sp+$28
    ld   c, d
    ld   [bc], a
    ld   [label_14C18], sp
    ld   [bc], a
    ld   [label_14E20], sp
    ld   [bc], a
    ld   [label_15028], sp
    ld   [bc], a
    nop
    jr   nc, label_160DB
    ld   [bc], a
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
    ld   b, b
    ld   bc, label_800
    ld   b, d
    ld   bc, label_1000
    ld   e, d
    ld   [bc], a
    nop
    jr   label_160FD
    ld   [bc], a
    nop
    jr   nz, label_16103
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, b
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, d
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, h
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, [hl]
    ld   [bc], a
    ld   a, [$FF18]
    ld   d, h
    ld   [bc], a
    ld   a, [$FF20]
    ld   d, [hl]
    ld   [bc], a
    ld   a, [$FF28]
    ld   e, b
    ld   [bc], a
    nop
    nop
    ld   b, b
    ld   bc, label_800
    ld   b, d
    ld   bc, label_1000
    ld   e, d
    ld   [bc], a
    nop
    jr   label_16139
    ld   [bc], a
    nop
    jr   nz, label_1613F
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, b
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, d
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, h
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, [hl]
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
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
    ld   b, b
    ld   bc, label_800

label_160F8::
    ld   b, d
    ld   bc, label_1000
    ld   l, h

label_160FD::
    ld   [bc], a
    nop
    jr   label_1616F
    ld   [bc], a
    nop

label_16103::
    jr   nz, label_16175
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   h, b
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   [hl], d
    ld   [bc], a
    db   $10 ; Undefined instruction
    ld   [hl], h
    ld   [bc], a
    db   $10 ; Undefined instruction
    halt
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_16122::
    nop
    ld   [label_2140], sp
    nop
    nop
    ld   b, d
    ld   hl, $F800
    ld   b, h
    ldi  [hl], a
    ld    hl, sp+$F0
    ld   b, [hl]
    ldi  [hl], a
    ld    hl, sp+$E8
    ld   c, b
    ldi  [hl], a
    ld    hl, sp+$E0
    ld   c, d

label_16139::
    ldi  [hl], a
    ld   [label_14CF0], sp
    ldi  [hl], a
    ld   [label_14EE8], sp
    ldi  [hl], a
    ld   [label_150E0], sp
    ldi  [hl], a
    nop
    ret  c
    ld   d, d
    ldi  [hl], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   [label_2140], sp
    nop
    nop
    ld   b, d
    ld   hl, $F800
    ld   e, d
    ldi  [hl], a
    nop
    ld   a, [$FF5C]
    ldi  [hl], a
    nop
    db   $E8 ; add  sp, d
    ld   e, [hl]
    ldi  [hl], a
    stop
    ld   h, b
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   h, d
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   h, h
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   h, [hl]

label_16175::
    ldi  [hl], a
    ld   a, [$FFF0]
    ld   d, h
    ldi  [hl], a
    ld   a, [$FFE8]
    ld   d, [hl]
    ldi  [hl], a
    ld   a, [$FFE0]
    ld   e, b
    ldi  [hl], a
    nop
    ld   [label_2140], sp
    nop
    nop
    ld   b, d
    ld   hl, $F800
    ld   e, d
    ldi  [hl], a
    nop
    ld   a, [$FF68]
    ldi  [hl], a
    nop
    db   $E8 ; add  sp, d
    ld   l, d
    ldi  [hl], a
    stop
    ld   h, b
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   h, d
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   h, h
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   h, [hl]
    ldi  [hl], a
    rst  $38
    rst  $38
    rst  $38
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
    ld   [label_2140], sp
    nop
    nop
    ld   b, d
    ld   hl, $F800
    ld   l, h
    ldi  [hl], a
    nop
    ld   a, [$FF6E]
    ldi  [hl], a
    nop
    db   $E8 ; add  sp, d
    ld   [hl], b
    ldi  [hl], a
    stop
    ld   h, b
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   [hl], d
    ldi  [hl], a
    db   $10 ; Undefined instruction
    ld   [hl], h
    ldi  [hl], a
    db   $10 ; Undefined instruction
    halt
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_161E2::
    inc  e
    inc  e
    ld   [label_140C], sp
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  e
    ld   [$FC0C], sp
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    add  a, b
    jp   label_F009
    pop  af
    add  a, [hl]
    ld   hl, label_16062
    cp   $04
    jr   c, label_16205

label_16200::
    sub  a, $04
    ld   hl, label_16122

label_16205::
    ld   e, a
    ld   d, b
    sla  e
    sla  e
    sla  e
    sla  e
    ld   a, e
    sla  e
    add  a, e
    ld   e, a
    add  hl, de
    ld   c, $0C
    call label_3CE6
    ld   a, $0A
    call label_3DA0
    ld   e, $00
    ld   a, [$FFF1]
    and  a
    jr   z, label_16228
    ld   e, $04

label_16228::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_16234
    ld   a, e
    add  a, $08
    ld   e, a

label_16234::
    ld   d, b
    ld   hl, label_161E2
    add  hl, de
    ld   e, l
    ld   d, h
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    ld   c, $04

label_16246::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_16246
    pop  bc
    ret

label_1624E::
    ld   a, h
    nop
    ld   a, h
    jr   nz, label_162CF
    ld   b, b
    ld   a, h
    ld   h, b
    ld   a, $02
    ld   [$FFA1], a
    ld   de, label_1624E
    call label_3BC0
    call label_17A3A
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFF0]
    rst  0
    ld   [hl], h
    ld   h, d
    sbc  a, c
    ld   h, d
    ld   hl, $C210
    add  hl, bc
    ld   e, $07
    call label_16283
    ld   hl, $C200
    add  hl, bc
    ld   e, $00

label_16283::
    ld   a, [$FFE7]
    add  a, e
    ld   d, a
    and  $03
    jr   nz, label_16298
    ld   a, d
    rra
    rra
    rra
    rra
    xor  c
    and  $01
    jr   z, label_16297
    inc  [hl]
    inc  [hl]

label_16297::
    dec  [hl]

label_16298::
    ret
    call label_17AB1
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cp   $C0
    jr   z, label_162A6
    dec  [hl]

label_162A6::
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $F0
    jr   z, label_162B0
    dec  [hl]

label_162B0::
    ld   a, [$FFEE]
    cp   $E0
    jp   nc, label_17B4B
    ret

label_162B8::
    ld   a, d
    ldi  [hl], a
    ld   a, b
    ldi  [hl], a
    ld   a, b
    ld   [bc], a
    ld   a, d
    ld   [bc], a
    ld   a, d
    ld   h, d
    ld   a, b
    ld   h, d
    ld   a, b
    ld   b, d
    ld   a, d
    ld   b, d
    ld   de, label_162B8
    call label_3BC0
    call label_17A3A
    call label_17AB1
    ld   a, [$FFF0]
    rst  0
    db   $DB
    ld   h, d
    ld   a, [$CD62]
    ld   c, a
    dec  sp
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_162F5
    call label_3B12
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $E0
    ld   hl, $C3B0
    add  hl, bc
    inc  [hl]
    inc  [hl]

label_162F5::
    ld   hl, $C250
    add  hl, bc
    dec  [hl]
    ld   a, [$FFEE]
    cp   $A8
    jp   nc, label_17B4B
    ret
    call label_C05
    ld   [hl], $40
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], $FF
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $FF
    ret
    call label_394D
    call label_3EE8
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1632F
    cp   $01
    jp   z, label_16776
    cp   $02
    jp   z, label_16798
    jp   label_167EA

label_1632F::
    call label_16705
    ld   a, [$FFEA]
    cp   $01
    jr   nz, label_16375
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   b, d
    ld   h, e
    ld   c, l
    ld   h, e
    call label_C05
    ld   [hl], $FF

label_16347::
    ld   hl, $C2C0
    add  hl, bc
    inc  [hl]
    ret
    call label_C05
    jp   z, label_1635E
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    cp   $80
    ret  nc
    jp   label_17550

label_1635E::
    call label_17585
    ld   hl, $C200
    add  hl, de
    ld   a, [$FF98]
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   [hl], $70
    ld   hl, $C310
    add  hl, de
    ld   [hl], $70
    ret

label_16375::
    call label_17A3A
    call label_C56
    ld   a, [$FFF0]
    rst  0
    xor  b
    ld   h, e
    db   $EB ; Undefined instruction
    ld   h, e
    adc  a, [hl]
    ld   h, h
    inc  [hl]
    ld   h, l
    ld   a, c
    ld   h, l

label_16388::
    jr   z, label_163C2
    ld   e, b
    ld   l, b
    jr   z, label_163C6
    ld   e, b
    ld   l, b

label_16390::
    jr   c, label_163C2
    jr   nc, label_163CC
    ld   d, b
    ld   e, b
    ld   e, b
    ld   d, b

label_16398::
    db   $10 ; Undefined instruction
    ld   a, [$FFF0]
    db   $10 ; Undefined instruction
    ld   a, [$FFF0]

label_163A0::
    db   $FD ; Undefined instruction
    inc  bc
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    inc  bc
    call label_C05
    ret  nz
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_16388
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_16390
    add  hl, de
    ld   a, [hl]

label_163C2::
    ld   hl, $C210
    add  hl, bc

label_163C6::
    ld   [hl], a
    ld   hl, label_16398
    add  hl, de
    ld   a, [hl]

label_163CC::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_163A0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $18
    ld   a, $16
    ld   [$FFF3], a
    call label_165D9
    jp   label_3B12
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_16444
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $0B
    jr   c, label_16444
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   nc, label_16443
    call label_3B12
    call label_C05
    ld   [hl], $40
    ld   hl, $C240

label_16410::
    add  hl, bc
    ld   [hl], $18
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $18
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    call label_BFB
    ld   [hl], $40
    ld   a, [$FFEE]
    add  a, $F8
    ld   [$FFD7], a
    call label_16432
    ld   a, [$FFEE]
    add  a, $08
    ld   [$FFD7], a

label_16432::
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   hl, $C520
    add  hl, de
    ld   [hl], $0F

label_16443::
    ret

label_16444::
    call label_17AB1
    call label_17AEA
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_16471
    ld   [hl], b
    call label_C05
    ld   [hl], $40
    call label_3B12
    ld   [hl], b
    call label_16611
    call label_165D9
    ld   a, $32
    ld   [$FFF2], a
    ld   a, $FF
    jp   label_3B0C

label_16471::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jp   nc, label_1656D
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1648D
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_1648D::
    ret
    ld   a, $02
    call label_3B0C
    call label_C05
    jr   z, label_164AF
    and  $02
    ld   e, $08
    jr   z, label_164A0
    ld   e, $F8

label_164A0::
    ld   hl, $C240
    add  hl, bc
    push hl
    ld   a, [hl]
    push af
    ld   [hl], e
    call label_17ABE
    pop  af
    pop  hl
    ld   [hl], a
    ret

label_164AF::
    call label_3B39
    call label_BFB
    jr   nz, label_164CC
    ld   a, [$FFEE]
    cp   $70
    jr   nc, label_164CC
    ld   a, [$FFEC]
    cp   $50
    jr   nc, label_164CC
    call label_3D7F
    call label_3B12
    ld   [hl], $01
    ret

label_164CC::
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   nz, label_164F7
    ld   a, [$FFEE]
    cp   $70
    jr   nc, label_164F7
    ld   a, [$FFEC]
    cp   $50
    jr   nc, label_164F7
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $05
    jr   c, label_164F7
    call label_3B12
    call label_3D7F
    call label_C05
    ld   [hl], $80
    ret

label_164F7::
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $0B
    ret  nc
    call label_17AB1
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    push af
    and  $03
    jr   z, label_16515
    ld   hl, $C240
    call label_1651D

label_16515::
    pop  af
    and  $0C
    jr   z, label_16522
    ld   hl, $C250

label_1651D::
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_16522::
    ld   a, [$FFE7]
    and  $07
    ret  nz
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $0A
    jp   label_CC7
    call label_C05
    cp   $40
    jr   c, label_1655B
    jr   nz, label_16544
    ld   a, $29
    ld   [$FFF4], a
    call label_1657F

label_16544::
    and  $02
    ld   e, $10
    jr   z, label_1654C
    ld   e, $F0

label_1654C::
    ld   hl, $C240
    add  hl, bc
    push hl
    ld   a, [hl]
    push af
    ld   [hl], e
    call label_17ABE
    pop  af
    pop  hl
    ld   [hl], a
    ret

label_1655B::
    and  a
    jr   nz, label_1656D
    call label_3B12
    ld   [hl], $01
    call label_3D7F
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $08
    ret

label_1656D::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $03
    jp   label_3B0C
    ret

label_1657A::
    ret
    ld    hl, sp+$08
    ld    hl, sp+$08

label_1657F::
    ld   a, $02

label_16581::
    ld   [$FFE8], a
    ld   a, $62
    call label_3B86
    jr   c, label_165D3
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $03
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_1657A
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
    ld   a, [$FFDA]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   a, [$FFE8]
    dec  a
    ld   [hl], a
    ld   hl, label_1657C
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C250
    add  hl, de
    ld   [hl], $04
    pop  bc
    ld   hl, $C320
    add  hl, de
    ld   [hl], $08
    ld   hl, $C340
    add  hl, de
    ld   [hl], $42

label_165D3::
    ld   a, [$FFE8]
    dec  a
    jr   nz, label_16581
    ret

label_165D9::
    ld   a, $62
    call label_3B86
    jr   c, label_16600
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
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
    ld   [hl], $14
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C4

label_16600::
    ret
    ld    hl, sp+$08
    ld    hl, sp+$08
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  b

label_16608::
    inc  b
    db   $F4 ; Undefined instruction
    inc  c
    db   $F4 ; Undefined instruction

label_1660C::
    inc  c
    db   $F4 ; Undefined instruction
    db   $F4 ; Undefined instruction
    inc  c
    inc  c

label_16611::
    ld   a, $04

label_16613::
    ld   [$FFE8], a
    ld   a, $62
    call label_3B86
    jr   c, label_1665F
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $02
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_16600
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_16604
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_16608
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_1660C
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    pop  bc
    ld   hl, $C320
    add  hl, de
    ld   [hl], $13
    ld   hl, $C340
    add  hl, de
    ld   [hl], $42

label_1665F::
    ld   a, [$FFE8]
    dec  a
    jr   nz, label_16613
    ret

label_16665::
    ld   a, [$FFF8]
    ld   h, b
    ld   [bc], a
    ld   a, [$FF00]
    ld   h, d
    ld   [bc], a
    ld   a, [$FF08]
    ld   h, h
    ld   [bc], a
    ld   a, [$FF10]
    ld   h, [hl]
    ld   [bc], a
    nop
    ld    hl, sp+$68
    ld   [bc], a
    nop
    nop
    ld   l, d
    ld   [bc], a
    nop
    ld   [label_226A], sp
    nop
    db   $10 ; Undefined instruction
    ldi  [hl], a
    ld   a, [$FFF8]
    ld   h, [hl]
    ld   hl, $00F0
    ld   h, h
    ld   hl, label_8F0
    ld   h, d
    ld   hl, label_10F0
    ld   h, b
    ld   hl, $F800
    ld   l, b
    ld   bc, $0000
    ld   l, d
    ld   bc, label_800
    ld   l, d
    ld   hl, label_1000
    ld   l, b
    ld   hl, $F800
    ld   l, h
    ld   [bc], a
    nop
    nop
    ld   l, [hl]
    ld   [bc], a
    nop
    ld   [label_226E], sp
    nop
    db   $10 ; Undefined instruction
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   a, h
    ld   [bc], a
    nop
    inc  b
    ld   a, [hl]
    ld   [bc], a
    nop
    inc  c
    ld   a, h
    ldi  [hl], a
    nop
    nop
    rst  $38
    nop
    nop
    db   $FC ; Undefined instruction
    ld   a, h
    ld   [bc], a
    nop
    inc  b
    ld   a, [hl]
    ldi  [hl], a
    nop
    inc  c
    ld   a, h
    ldi  [hl], a
    nop
    nop
    rst  $38
    nop
    nop
    ld    hl, sp+$74
    ld   [bc], a
    nop
    nop
    halt
    nop
    ld   [label_2276], sp
    nop
    db   $10 ; Undefined instruction
    ldi  [hl], a
    nop
    ld    hl, sp+$70
    ld   [bc], a
    nop
    nop
    ld   [hl], d
    ld   [bc], a
    nop
    ld   [label_2272], sp
    nop
    db   $10 ; Undefined instruction
    ldi  [hl], a

label_166F5::
    ld   a, [bc]
    ei
    ld   h, $02
    ld   a, [bc]
    ld   bc, label_226
    ld   a, [bc]
    ld   b, $26
    ld   [bc], a
    ld   a, [bc]
    inc  c
    ld   h, $02

label_16705::
    ld   a, [$FFF1]
    cp   $02
    jr   nc, label_16754
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $F0
    or   $08
    ld   [hl], a
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_16665
    add  hl, de
    ld   c, $08
    call label_3CE6
    nop

label_1672A::
    ld   a, [$FFF1]
    cp   $05
    ret  nc
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    dec  a
    cp   $08
    ret  c
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $F0
    or   $04
    ld   [hl], a
    ld   a, [$FFEF]
    ld   [$FFEC], a
    xor  a
    ld   [$FFF1], a
    ld   hl, label_166F5
    ld   c, $04
    call label_3CE6
    jp   label_3D8A

label_16754::
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $F0
    or   $04
    ld   [hl], a
    ld   a, [$FFF1]
    dec  a
    dec  a
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_166A5
    add  hl, de
    ld   c, $04
    call label_3CE6
    jp   label_1672A

label_16776::
    call label_C05
    jp   z, label_17B4B
    cp   $0A
    ld   a, $05
    jr   c, label_16783
    inc  a

label_16783::
    ld   [$FFF1], a
    jp   label_16754

label_16788::
    ld   e, $02
    ld   e, $62
    ld   e, $42
    ld   e, $22
    ld   a, d
    ld   [bc], a
    ld   a, d
    ldi  [hl], a
    ld   a, b
    ld   [bc], a
    ld   a, b
    ldi  [hl], a

label_16798::
    ld   de, label_16788
    call label_3BC0
    call label_17A3A
    call label_3B44
    ld   a, [$FFF0]
    rst  0
    xor  e
    ld   h, a
    jp   nc, label_CD67
    or   c
    ld   a, d
    call label_17AEA
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_167C8
    ld   [hl], b
    call label_3B12
    call label_C05
    ld   [hl], $0F

label_167C8::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_C05
    jp   z, label_17B4B
    rra
    rra
    rra
    and  $01
    inc  a
    inc  a
    jp   label_3B0C

label_167E2::
    ld   l, h
    ld   [bc], a
    ld   l, [hl]
    ld   [bc], a
    ld   l, [hl]
    ldi  [hl], a
    ld   l, h
    ldi  [hl], a

label_167EA::
    ld   de, label_167E2
    call label_3BC0
    call label_17A3A
    call label_17AB1
    call label_17AEA
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
    call label_C05
    ld   [hl], $0F
    ld   hl, $C2B0

label_16810::
    add  hl, bc
    ld   [hl], $02
    ld   a, $FF
    jp   label_3B0C
    ld   hl, $C460
    add  hl, bc
    ld   e, [hl]
    sla  e
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

label_16831::
    xor  a
    ldi  [hl], a
    dec  e
    ld   a, e
    cp   $00
    jr   nz, label_16831
    pop  de
    ld   hl, $D100
    add  hl, de
    ld   e, $20

label_16840::
    xor  a
    ldi  [hl], a
    dec  e
    ld   a, e
    cp   $00
    jr   nz, label_16840
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $06
    call label_C05
    ld   [hl], $40
    call label_C00
    ld   [hl], $40
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], $03
    ret

label_1685F::
    ld   b, $FA
    nop
    nop

label_16863::
    nop
    nop
    ld   a, [label_206]
    ld   bc, $0100

label_1686B::
    ld   hl, label_2322
    ldi  [hl], a
    ld   a, [$FFF7]
    cp   $07
    jr   nz, label_16879
    ld   a, $10
    ld   [$FFF5], a

label_16879::
    call label_16A38
    call label_17A3A
    call label_3EE8
    call label_C56
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    sub  a, c
    ld   l, b
    ld   d, a
    ld   l, c
    or   c
    ld   l, c
    call label_C05
    jr   nz, label_1689B
    ld   [hl], $00
    call label_3B12

label_1689B::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $3F
    ld   [hl], a
    ld   [$FFD7], a
    rra
    rra
    nop
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_16867
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   hl, label_1686B
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    ld   hl, $C460
    add  hl, bc
    ld   e, [hl]
    sla  e
    sla  e
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
    add  hl, de
    ld   a, [$FFEE]
    ld   [hl], a
    pop  de
    ld   hl, $D100
    add  hl, de
    ld   a, [$FFD7]
    ld   e, a
    add  hl, de
    ld   a, [$FFEC]
    ld   [hl], a
    call label_17AB1
    call label_3B23
    ld   e, $0F
    ld   d, b

label_168F6::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   nz, label_16953
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $02
    jr   nz, label_16953
    ld   hl, $C2E0
    add  hl, de
    ld   a, [hl]
    cp   $38
    jr   c, label_16953
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $06
    cp   $0C
    jr   nc, label_16953
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $06
    cp   $0C
    jr   nc, label_16953
    ld   hl, $C310
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_16953
    ld   hl, $C280
    add  hl, de
    ld   [hl], b
    call label_3B12
    ld   [hl], $02
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $60
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $0C
    ld   hl, $C440
    add  hl, bc
    inc  [hl]
    ld   a, $2A
    ld   [$FFF2], a
    ret

label_16953::
    dec  e
    jr   nz, label_168F6
    ret
    call label_C05
    jr   nz, label_169A0
    call label_280D
    and  $1F
    add  a, $40
    ld   [hl], a
    call label_3B12
    ld   [hl], b
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a
    jr   nz, label_16978
    call label_17B24
    jr   label_1697E

label_16978::
    call label_280D
    and  $03
    ld   e, a

label_1697E::
    ld   hl, $FFF1
    xor  [hl]
    and  $02
    jr   z, label_16978
    ld   d, b
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], e
    ld   hl, label_1685F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_16863
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_169A0::
    ret

label_169A1::
    di
    dec  c
    nop
    nop

label_169A5::
    nop
    nop
    dec  c
    di

label_169A9::
    inc  c
    db   $F4 ; Undefined instruction
    nop
    nop

label_169AD::
    nop
    nop
    db   $F4 ; Undefined instruction
    inc  c
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_169C4
    call label_C05
    ld   [hl], $30
    call label_3B12
    ld   [hl], $01
    ret

label_169C4::
    cp   $24
    jr   nz, label_169CB
    call label_C4B

label_169CB::
    cp   $04
    jr   nz, label_169EB
    ld   a, [$FFF1]
    ld   e, a
    ld   d, b
    ld   hl, label_169A9
    add  hl, de
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [$FFD7], a
    ld   hl, label_169AD
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    xor  a

label_169EB::
    cp   $20
    ret  nz
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    cp   $03
    ret  nz
    ld   a, $02
    call label_3B86
    ret  c
    ld   hl, $C2E0
    add  hl, de

label_16A00::
    ld   [hl], $17
    push bc
    ld   hl, $C3B0
    add  hl, bc
    ld   c, [hl]

label_16A08::
    ld   hl, label_169A1
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_169A5
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    pop  bc
    jp   label_17E9D

label_16A24::
    ld   h, [hl]
    inc  hl
    ld   h, h
    inc  hl
    ld   h, h
    inc  bc
    ld   h, [hl]
    inc  bc
    ld   h, d
    inc  bc
    ld   h, d
    inc  hl
    ld   h, b
    inc  bc
    ld   h, b
    inc  hl
    ld   l, b
    inc  bc
    ld   l, b
    inc  hl

label_16A38::
    call label_C00
    ld   hl, $C124
    or   [hl]
    ld   hl, $C300
    add  hl, bc
    or   [hl]
    jp   nz, label_16C77
    ld   a, [$FFF1]
    cp   $02
    jr   nz, label_16A56
    call label_16AA5
    call label_16A5F
    jp   label_3D8A

label_16A56::
    call label_16A5F
    call label_16AA5
    jp   label_3D8A

label_16A5F::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    push bc
    ld   hl, $C460
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C2B0
    add  hl, bc
    ld   c, [hl]
    sla  e
    sla  e
    sla  e
    sla  e
    sla  e
    sla  e
    ld   d, b
    push de
    ld   hl, $D000
    add  hl, de
    ld   a, [$FFD7]
    sub  a, c
    and  $3F
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    pop  de
    ld   hl, $D100
    add  hl, de
    ld   a, [$FFD7]
    sub  a, c
    and  $3F
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    pop  bc
    ld   de, label_16A24
    jp   label_3BC0

label_16AA5::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    push bc
    ld   hl, $C460
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   c, [hl]
    sla  e
    sla  e
    sla  e
    sla  e
    sla  e
    sla  e
    ld   d, b
    push de
    ld   hl, $D000
    add  hl, de
    ld   a, [$FFD7]
    sub  a, c
    and  $3F
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    pop  de
    ld   hl, $D100
    add  hl, de
    ld   a, [$FFD7]
    sub  a, c
    and  $3F
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    pop  bc
    ld   a, $04
    ld   [$FFF1], a
    ld   de, label_16A24
    call label_3BC0
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF1], a
    ret

label_16AF7::
    nop
    nop
    ld   h, [hl]
    jr   nz, label_16AFC

label_16AFC::
    ld   [label_2064], sp
    nop
    di
    ld   l, b
    nop
    nop
    ei
    ld   l, b
    jr   nz, label_16B08

label_16B08::
    nop
    ld   h, h
    nop
    nop
    ld   [$0066], sp
    nop
    dec  c
    ld   l, b
    nop
    nop
    dec  d
    ld   l, b
    jr   nz, label_16B18

label_16B18::
    nop
    ld   h, d
    nop
    nop
    ld   [label_2062], sp
    dec  c
    nop
    ld   l, b
    nop
    dec  c
    ld   [label_2068], sp
    nop
    nop
    ld   h, b
    nop
    nop
    ld   [label_2060], sp
    di
    nop
    ld   l, b
    nop
    di
    ld   [label_2068], sp

label_16B37::
    nop

label_16B38::
    inc  b
    ld   h, [hl]
    jr   nz, label_16B3C

label_16B3C::
    inc  c
    ld   h, h
    jr   nz, label_16B38
    db   $EC ; Undefined instruction
    ld   l, h
    nop
    ld    hl, sp+$F4
    ld   l, d
    nop
    ld    hl, sp+$FC
    ld   l, d
    jr   nz, label_16B44
    inc  b
    ld   l, h
    jr   nz, label_16B58
    db   $EC ; Undefined instruction
    ld   l, h
    ld   b, b
    ld   [label_16EF4], sp
    ld   b, b
    ld   [label_16EFC], sp
    ld   h, b
    ld   [label_16C04], sp
    ld   h, b
    nop
    db   $FC ; Undefined instruction
    ld   h, h
    nop
    nop
    inc  b
    ld   h, [hl]
    nop
    ld    hl, sp+$04
    ld   l, h
    nop
    ld    hl, sp+$0C
    ld   l, d
    nop
    ld    hl, sp+$14
    ld   l, d
    jr   nz, label_16B6C
    inc  e
    ld   l, h
    jr   nz, label_16B80
    inc  b
    ld   l, h
    ld   b, b
    ld   [label_16E0C], sp
    ld   b, b
    ld   [label_16E14], sp
    ld   h, b
    ld   [label_16C1C], sp
    ld   h, b
    inc  b
    ld    hl, sp+$6C
    nop
    inc  b
    nop
    ld   l, d
    nop
    inc  b
    ld   [label_206A], sp
    inc  b
    db   $10 ; Undefined instruction
    jr   nz, label_16BAC
    ld    hl, sp+$6C
    ld   b, b
    inc  d
    nop
    ld   l, [hl]
    ld   b, b
    inc  d
    ld   [label_1606E], sp
    inc  d
    db   $10 ; Undefined instruction
    ld   h, b
    db   $FC ; Undefined instruction
    nop
    ld   h, d
    nop
    db   $FC ; Undefined instruction

label_16BAC::
    ld   [label_2062], sp
    inc  b
    nop
    ld   h, b
    nop
    inc  b
    ld   [label_2060], sp
    db   $EC ; Undefined instruction
    ld    hl, sp+$6C
    nop
    db   $EC ; Undefined instruction
    nop
    ld   l, d
    nop
    db   $EC ; Undefined instruction
    ld   [label_206A], sp
    db   $EC ; Undefined instruction

label_16BC4::
    db   $10 ; Undefined instruction
    jr   nz, label_16BC4
    ld    hl, sp+$6C
    ld   b, b
    db   $FC ; Undefined instruction
    nop
    ld   l, [hl]
    ld   b, b
    db   $FC ; Undefined instruction
    ld   [label_1606E], sp
    db   $FC ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   h, b

label_16BD7::
    nop
    ld   [bc], a
    ld   h, [hl]
    jr   nz, label_16BDC

label_16BDC::
    ld   a, [bc]
    ld   h, h
    jr   nz, label_16BDB
    rst  $28
    ld   l, h
    nop
    ei
    rst  $30
    ld   l, [hl]
    nop

label_16BE7::
    ei
    ld   sp, hl
    ld   l, [hl]
    jr   nz, label_16BE7
    ld   bc, label_206C
    dec  b
    rst  $28
    ld   l, h
    ld   b, b
    dec  b
    rst  $30
    ld   l, [hl]
    ld   b, b
    dec  b
    ld   sp, hl
    ld   l, [hl]
    ld   h, b
    dec  b
    ld   bc, label_1606C
    nop
    cp   $64
    nop
    nop

label_16C04::
    ld   [bc], a
    ld   h, [hl]
    nop
    ei
    rlca
    ld   l, h
    nop
    ei
    rrca

label_16C0D::
    ld   l, [hl]
    nop
    ei

label_16C10::
    ld   de, label_206E
    ei
    add  hl, de
    ld   l, h
    jr   nz, label_16C1D
    rlca
    ld   l, h
    ld   b, b
    dec  b

label_16C1C::
    rrca

label_16C1D::
    ld   l, [hl]
    ld   b, b
    dec  b
    ld   de, label_1606E
    dec  b
    add  hl, de
    ld   l, h
    ld   h, b
    rlca
    ei
    ld   l, h
    nop
    rlca
    inc  bc
    ld   l, [hl]
    nop
    rlca
    dec  b
    ld   l, [hl]
    jr   nz, label_16C3B
    dec  c
    ld   l, h
    jr   nz, label_16C49
    ei
    ld   l, h
    ld   b, b

label_16C3B::
    ld   de, label_16E03
    ld   b, b
    ld   de, label_16E05
    ld   h, b
    ld   de, label_16C0D
    ld   h, b
    cp   $00

label_16C49::
    ld   h, d
    nop
    cp   $08
    ld   h, d
    jr   nz, label_16C52
    nop
    ld   h, b

label_16C52::
    nop

label_16C53::
    ld   [bc], a
    ld   [label_2060], sp
    rst  $28
    ei
    ld   l, h
    nop
    rst  $28
    inc  bc
    ld   l, [hl]
    nop
    rst  $28
    dec  b

label_16C61::
    ld   l, [hl]
    jr   nz, label_16C53
    dec  c
    ld   l, h
    jr   nz, label_16C61
    ei
    ld   l, h
    ld   b, b
    ld   sp, hl
    inc  bc
    ld   l, [hl]
    ld   b, b
    ld   sp, hl
    dec  b
    ld   l, [hl]
    ld   h, b
    ld   sp, hl
    dec  c
    ld   l, h
    ld   h, b

label_16C77::
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   c, label_16CAE
    cp   $28
    jr   nc, label_16CAE
    ld   hl, label_16BD7
    cp   $0E
    jr   c, label_16C92
    cp   $22
    jr   nc, label_16C92
    ld   hl, label_16B37

label_16C92::
    ld   a, [$FFF1]
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
    add  hl, de
    ld   c, $0A
    call label_3CE6
    ld   a, $08
    jp   label_3DA0

label_16CAE::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_16AF7
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $02
    jp   label_3DA0
    call label_C05
    ld   [hl], $80
    xor  a
    ld   [$D200], a
    ld   [$D203], a
    ld   [$D204], a
    ld   hl, $C390
    add  hl, bc
    ld   [hl], $01
    ret
    call label_394D
    call label_3EE8
    call label_C56
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    rst  0
    pop  af
    ld   l, h
    and  $72
    pop  de
    ld   [hl], l
    ld   a, c
    ld   [$D201], a
    ld   a, [$FFF0]
    rst  0

label_16CF8::
    nop
    ld   l, l
    ld   b, d
    ld   l, l
    ld   a, l
    ld   l, [hl]
    db   $EB ; Undefined instruction
    ld   [hl], b
    call label_C05
    ret  nz
    ld   [hl], $80
    ld   a, $FF
    ld   [$C157], a
    ld   a, $3E
    ld   [$FFF4], a
    ld   [$D3E8], a
    ld   a, $04
    ld   [$C158], a
    jp   label_3B12

label_16D1A::
    jr   nz, label_16D7C
    jr   nz, label_16D7E

label_16D1E::
    nop
    nop
    ld   [hl], b
    ld   [hl], b

label_16D22::
    ld   [label_808], sp
    ld   [label_B09], sp
    dec  bc
    ld   a, [bc]
    ld   [label_808], sp
    ld   [label_B09], sp
    dec  bc
    ld   a, [bc]
    dec  b
    rlca
    rlca
    ld   b, $04
    inc  b
    inc  b
    inc  b
    dec  b
    rlca
    rlca
    ld   b, $04
    inc  b
    inc  b
    inc  b
    ld   a, $38
    ld   [$FFCE], a
    add  a, $10
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   a, $30
    ld   [$FFCD], a
    add  a, $18
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    call label_C05
    jp   nz, label_16E30
    ld   [hl], $FF
    xor  a
    ld   [$D3E8], a
    call label_3B12
    ld   a, $AF
    ld   [$D745], a
    ld   a, $AF
    ld   [$D746], a
    ld   a, $B0
    ld   [$D755], a
    ld   a, $B0
    ld   [$D756], a
    call label_C00

label_16D7E::
    ld   [hl], $1F
    call label_BFB
    ld   [hl], $B0
    call label_3E34
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    add  a, $10
    ld   [hl], a
    call label_3E34
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    call label_3E34
    call label_C4B
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_16DFD
    push bc
    ld   a, [$FFCF]
    ld   h, a
    ld   a, [$FFD0]
    ld   l, a
    push hl
    inc  l
    ld   a, l
    ld   [$FFD0], a
    push hl
    ld   a, $AF
    ld   [$DDD8], a
    ld   a, $05
    call label_91D
    ld   a, [$FFD0]
    inc  a
    inc  a
    ld   [$FFD0], a
    ld   a, $05
    call label_91D
    pop  hl
    ld   de, $0040
    add  hl, de
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    ld   a, $B0
    ld   [$DDD8], a
    ld   a, $05
    call label_91D
    ld   a, [$FFD0]
    inc  a
    inc  a
    ld   [$FFD0], a
    ld   a, $05
    call label_91D
    pop  hl
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    pop  bc

label_16DFD::
    ld   a, [$D600]

label_16E00::
    ld   e, a
    ld   d, $00

label_16E03::
    ld   hl, $D601
    add  hl, de
    add  a, $1C
    ld   [$D600], a

label_16E0C::
    call label_16E15
    call label_16E15
    call label_16E15

label_16E15::
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ld   [$FFD0], a
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $76
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   a, $7E
    ldi  [hl], a
    ld   a, $77
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_16E30::
    cp   $40
    jp   nz, label_16E7C
    call label_2887
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $1C
    ld   [$D600], a
    call label_16E4A

label_16E4A::
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ld   [$FFD0], a
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   a, $1E
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   a, $1E
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ld   [$FFD0], a
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $1D
    ldi  [hl], a
    ld   a, $1F
    ldi  [hl], a
    ld   a, $1D
    ldi  [hl], a
    ld   a, $1F
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_16E7C::
    ret
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    push af
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    push af
    call label_170EB
    pop  af
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    pop  af
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    call label_3D8A
    call label_C05
    jp   z, label_3B12
    cp   $98
    jr   z, label_16EB0
    cp   $68
    jr   z, label_16EB0
    cp   $38
    jr   z, label_16EB0
    cp   $08
    ret  nz

label_16EB0::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    ret  z
    inc  [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_16D1A
    add  hl, de
    ld   a, [hl]
    ld   [$FFCE], a
    ld   hl, label_16D1E
    add  hl, de
    ld   a, [hl]
    ld   [$FFCD], a
    sla  e
    sla  e
    sla  e
    ld   hl, label_16D22
    add  hl, de
    push hl
    call label_2887
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $0E
    ld   [$D600], a
    pop  de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]

label_16EF4::
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a

label_16EFC::
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $20
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ld   a, $D5
    ld   [$D713], a
    ld   [$D717], a
    ld   a, $D6
    ld   [$D714], a
    ld   [$D718], a
    ld   a, $D7
    ld   [$D783], a
    ld   [$D787], a
    ld   a, $D8
    ld   [$D784], a
    ld   [$D788], a
    ld   a, $5D
    call label_3B86
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFCE]
    add  a, $10
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFCD]
    add  a, $10
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    add  a, $08
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $2F
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $03
    ld   a, $00
    jr   c, label_16F78
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   [hl], a
    ld   a, $01

label_16F78::
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    call label_3E34
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    jp   label_C4B
    ret  nc
    pop  de
    call nc, label_DFD9
    and  $EE
    rst  $30
    nop
    add  hl, bc
    ld   [de], a
    ld   a, [de]
    ld   hl, label_2C27
    cpl
    jr   nc, label_16FCA
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
    jp  c, label_DDDB
    pop  hl
    and  $EB
    db   $F2 ; Undefined instruction
    ld   sp, hl
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

label_16FCA::
    ld   sp, hl
    db   $F2 ; Undefined instruction
    db   $EB ; Undefined instruction
    and  $E1
    db   $DB
    db   $DB
    jp  c, label_DDDB
    pop  hl
    and  $EB
    db   $F2 ; Undefined instruction
    ld   sp, hl
    db   $E4 ; Undefined instruction
    push hl
    rst  $20
    jp   [hl]
    db   $ED ; Undefined instruction
    pop  af
    or   $FB
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
    xor  $EF
    ld   a, [$FFF2]
    db   $F4 ; Undefined instruction
    or   $FA
    db   $FD ; Undefined instruction
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
    db   $F2 ; Undefined instruction
    ld   a, [$FFEF]
    xor  $EF
    ld   a, [$FFF2]
    db   $F4 ; Undefined instruction
    or   $FA
    db   $FD ; Undefined instruction
    ld    hl, sp+$F9
    ld   a, [$FBFB]
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction

label_17030::
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

label_17051::
    nop
    nop
    ld   bc, label_302
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    rst  $38
    cp   $FD
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    nop
    nop

label_17071::
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    rst  $38
    rst  $38
    cp   $FE
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FE
    rst  $38
    rst  $38
    nop

label_17091::
    nop
    nop
    ld   bc, $0101
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    cp   $FE
    cp   $FE
    cp   $FE
    cp   $FF
    rst  $38
    rst  $38
    nop

label_170B1::
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
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
    nop
    nop

label_170D1::
    add  hl, hl
    ld   [hl], b
    ld   bc, $D970
    ld   l, a
    or   c
    ld   l, a
    adc  a, c
    ld   l, a

label_170DB::
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, label_17030
    jr   nc, label_17153

label_170E3::
    db   $10 ; Undefined instruction
    add  a, b
    add  a, b

label_170E7::
    nop
    nop
    ld   bc, $CD01
    ei
    dec  bc
    ld   a, [$D200]
    and  a
    jr   z, label_170F6
    ld   [hl], $20

label_170F6::
    ld   a, [hl]
    and  a
    jr   nz, label_17151
    ld   [hl], $2C
    ld   a, $5D
    call label_3B86
    jr   c, label_17151
    ld   hl, $C360
    add  hl, de
    ld   [hl], $FF
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $FF
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    push bc
    call label_280D
    and  $03
    ld   c, a
    ld   hl, label_170DF
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, de
    ld   [hl], a
    ld   hl, label_170E3
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2D0
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $5F
    ld   hl, label_170E7
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    pop  bc

label_17151::
    call label_C00
    jr   z, label_17167
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_170DB
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], a

label_17167::
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  $07
    ld   hl, $D200
    or   [hl]
    jr   nz, label_17188
    ld   a, [$FFF0]
    cp   $03
    jr   nz, label_17188
    ld   hl, $C390
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    add  a, e
    and  $1F
    ld   [hl], a

label_17188::
    ld   a, [$D200]
    and  a
    ld   a, $00
    jr   nz, label_1719A
    ld   hl, $C440
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    rra
    rra
    and  $1F

label_1719A::
    ld   [$FFE8], a
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $50
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $48
    ld   a, [$FFE8]
    ld   e, a
    ld   d, b
    ld   hl, label_17051
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    and  $1F
    ld   e, a
    ld   d, b
    push de
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    sla  e
    ld   d, b
    ld   hl, label_170D1
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    pop  de
    ld   a, $02
    call label_17283
    ld   a, [$FFE8]
    ld   e, a
    ld   d, b
    ld   hl, label_17071
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    and  $1F
    ld   e, a
    ld   d, b
    push de
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    dec  e
    ld   a, e
    cp   $F0
    jp   nc, label_172CA
    sla  e
    ld   d, b
    ld   hl, label_170D1
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    pop  de
    ld   a, $01
    call label_17283
    ld   a, [$FFE8]
    ld   e, a
    ld   d, b
    ld   hl, label_17091
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    and  $1F
    ld   e, a
    ld   d, b
    push de
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    dec  e
    dec  e
    ld   a, e
    cp   $F0
    jp   nc, label_172CA
    sla  e
    ld   d, b
    ld   hl, label_170D1
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    pop  de
    ld   a, $01
    call label_17283
    ld   a, [$FFE8]
    ld   e, a
    ld   d, b
    ld   hl, label_170B1
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    add  a, [hl]
    and  $1F
    ld   e, a
    ld   d, b
    push de
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    dec  e
    dec  e
    dec  e
    ld   a, e
    cp   $F0
    jp   nc, label_172CA
    sla  e
    ld   d, b
    ld   hl, label_170D1
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    pop  de
    ld   a, $01
    call label_17283
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    push de
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    dec  e
    dec  e
    dec  e
    dec  e
    ld   a, e
    cp   $F0
    jp   nc, label_172CA
    sla  e
    ld   d, b
    ld   hl, label_170D1
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    pop  de
    ld   a, $00

label_17283::
    ld   [$FFF1], a
    add  hl, de
    ld   a, $48
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, l
    add  a, $08
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a
    ld   a, $50
    add  a, [hl]
    ld   [$FFEE], a
    call label_172E0
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $08
    cp   $10
    jr   nc, label_172C9
    ld   a, [$FF99]
    ld   hl, $FFEC
    sub  a, [hl]
    add  a, $08
    cp   $10
    jr   nc, label_172C9
    ld   a, [$C11C]
    and  a
    jr   nz, label_172C9
    call label_3B18
    ld   a, $18
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a

label_172C9::
    ret

label_172CA::
    pop  de
    ret

label_172CC::
    ld   [hl], b
    rlca
    ld   [hl], b
    daa
    ld   [hl], d
    rlca
    ld   [hl], d
    daa
    ld   [hl], h
    rlca
    ld   [hl], h
    daa
    ld   a, h
    ld   b, $7C
    ld   h, $7E
    ld   b, $7E
    ld   h, $11
    call z, label_C372
    ret  nz
    dec  sp
    call label_17982
    call label_17A3A
    ld   a, [$FFF0]
    rst  0
    dec  b
    ld   [hl], e
    ld   h, e
    ld   [hl], e
    dec  h
    ld   [hl], h
    or   c
    ld   [hl], h
    inc  a
    ld   [hl], l

label_172F9::
    add  hl, bc
    ld   a, [bc]
    dec  bc
    dec  bc
    dec  bc
    dec  bc

label_172FF::
    inc  c
    dec  c
    ld   c, $0E
    ld   c, $0E
    call label_C05
    jp   z, label_17535
    ld   e, a
    cp   $18
    jr   nz, label_17314
    ld   a, $16
    ld   [$FFF3], a

label_17314::
    ld   a, e
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   hl, label_172F9
    jr   z, label_1732A
    ld   hl, label_172FF

label_1732A::
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_1732F::
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc

label_17339::
    dec  bc
    dec  bc
    ld   a, [bc]
    ld   a, [bc]
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc

label_17347::
    inc  c
    inc  c
    dec  c
    dec  c
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    dec  c
    dec  c
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

label_1735F::
    jr   label_17339

label_17361::
    inc  b
    inc  c
    call label_C05
    jp   z, label_17535
    ld   e, a
    cp   $20
    jr   nz, label_17372
    ld   a, $16
    ld   [$FFF3], a

label_17372::
    ld   a, e
    rra
    rra
    and  $1F
    ld   e, a
    ld   d, b
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   hl, label_1732F
    jr   z, label_17387
    ld   hl, label_17347

label_17387::
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    cp   $0B
    jr   z, label_17395
    cp   $0E
    jp   nz, label_17424

label_17395::
    ld   a, [$FF9E]
    and  $02
    jp   z, label_17424
    ld   a, [$C1A6]
    and  a
    jp   z, label_17424
    dec  a
    ld   [$D202], a
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_17424
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_17424
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $08
    cp   $10
    jr   nc, label_17424
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jr   nc, label_17424
    ld   a, [$D203]
    inc  a
    ld   [$D203], a
    cp   $04
    jr   c, label_17414
    call label_280D
    and  $01
    jr   nz, label_17414
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $02
    call label_BFB
    ld   [hl], $30
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $20
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_1735F
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, label_17361
    add  hl, de
    ld   a, [hl]
    ld   hl, $C290
    add  hl, bc
    ld   [hl], a
    jp   label_17777

label_17414::
    call label_3B12
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C390
    add  hl, de
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_17424::
    ret
    call label_179A7
    ld   a, $01
    ld   [$D200], a
    ld   a, [$D202]
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_17478
    ld   a, [$DBC7]
    and  a
    jr   nz, label_17478
    ld   hl, $C210
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C2D0
    add  hl, de
    ld   a, [hl]
    cp   $00
    jr   z, label_1745F
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_1745F
    dec  [hl]

label_1745F::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_17469
    ld   a, $29
    ld   [$FFF2], a

label_17469::
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   a, $00
    jr   z, label_17475
    ld   a, $01

label_17475::
    jp   label_3B0C

label_17478::
    call label_3B12
    call label_C05
    ld   [hl], $5F
    ret

label_17481::
    db   $10 ; Undefined instruction
    inc  c
    ld   [label_304], sp
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_301
    rra
    rra
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    call label_179A7
    ld   a, $01
    ld   [$D200], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   a, $08
    jr   z, label_174C5
    ld   a, $0F

label_174C5::
    call label_3B0C
    ld   a, [$FF98]
    push af
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF98], a
    ld   a, [$FF99]
    push af
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FF99], a
    call label_C05
    rra
    rra
    and  $3F
    ld   e, a
    ld   d, b
    ld   hl, label_17481
    add  hl, de
    ld   a, [hl]
    call label_3BB5
    ld   a, [$FFD8]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD7]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    call label_17AB1
    ld   a, [$FF99]
    ld   hl, $FFEC
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_1750D
    call label_17535

label_1750D::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    call label_C05
    rra
    rra
    and  $3F
    ld   e, a
    ld   d, b
    ld   hl, label_17499
    add  hl, de
    ld   a, [$FFE7]
    and  [hl]
    jr   nz, label_17534
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C2D0
    add  hl, de
    ld   a, [hl]
    cp   $04
    jr   z, label_17534
    inc  [hl]

label_17534::
    ret

label_17535::
    xor  a
    ld   [$D200], a
    jp   label_17B4B
    call label_179A7
    call label_C05
    jp   z, label_17585
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    cp   $80
    ret  nc
    jp   label_17550

label_17550::
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
    jp   label_17570

label_17570::
    call label_17A40
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $13
    ld   [$FFF4], a
    ret

label_17585::
    ld   a, $36
    call label_3B86
    jr   label_17599

label_1758C::
    ld   a, $36
    call label_3B86
    ld   a, $48
    ld   [$FFD7], a
    ld   a, $10
    ld   [$FFD8], a

label_17599::
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFF9]
    and  a
    jr   z, label_175B4
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F0
    jr   label_175C0

label_175B4::
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   hl, $C310
    add  hl, de
    ld   [hl], $08

label_175C0::
    call label_17B4B
    ld   hl, $FFF4
    ld   [hl], $1A
    ret

label_175C9::
    inc  bc
    dec  b
    nop
    inc  b
    ld   [bc], a
    ld   b, $01
    rlca
    call label_1766E
    call label_3D8A
    call label_17A3A
    ld   a, $01
    ld   [$D200], a
    call label_BFB
    cp   $10
    jr   nc, label_17621
    and  a
    jr   nz, label_17619
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $1F
    ld   a, $02
    call label_3B86
    call label_C4B
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210

label_17608::
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $17
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01
    jp   label_17535

label_17619::
    ld   a, [$FFE7]
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    ret

label_17621::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_17635
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C2D0
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_17635
    dec  [hl]

label_17635::
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
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_1765B
    call label_17AB1
    jr   label_1765E

label_1765B::
    call label_17702

label_1765E::
    ld   hl, $C290
    add  hl, bc
    ld   e, [hl]
    srl  e
    ld   d, b
    ld   hl, label_175C9
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C

label_1766E::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_17782
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $08
    call label_3DA0
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
    ld   de, label_172CC
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
    ld   de, label_172CC
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
    ld   a, $02
    ld   [$FFF1], a
    ld   de, label_172CC
    jp   label_3BC0

label_176EE::
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
    or   c
    ld   a, d
    call label_3B44
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_17730
    call label_280D
    rra
    jr   c, label_17721
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_17721::
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    and  $0F
    ld   [hl], a
    call label_C05
    ld   [hl], $10

label_17730::
    call label_C00
    jr   nz, label_1775E
    ld   [hl], $04
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C290
    add  hl, bc
    add  a, [hl]
    and  $0F
    ld   [hl], a
    ld   hl, $C290
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_176EE
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, label_176F2
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a

label_1775E::
    call label_C05
    jr   nz, label_17776
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

label_17776::
    ret

label_17777::
    ld   e, $80
    ld   hl, $D100

label_1777C::
    xor  a
    ldi  [hl], a
    dec  e
    jr   nz, label_1777C
    ret

label_17782::
    ld    hl, sp+$F8
    ld   h, b
    rlca
    ld    hl, sp+$00
    ld   h, d
    rlca
    ld    hl, sp+$08
    ld   h, d
    daa
    ld    hl, sp+$10
    ld   h, b
    daa
    ld   [label_164F8], sp
    rlca
    ld   [label_16600], sp
    rlca
    ld   [label_16608], sp
    daa
    ld   [label_16410], sp
    daa
    ld    hl, sp+$F8
    ld   h, h
    ld   b, a
    ld    hl, sp+$00
    ld   h, [hl]
    ld   b, a
    ld    hl, sp+$08
    ld   h, [hl]
    ld   h, a
    ld    hl, sp+$10
    ld   h, h
    ld   h, a
    ld   [label_160F8], sp
    ld   b, a
    ld   [label_16200], sp
    ld   b, a
    ld   [label_16208], sp
    ld   h, a
    ld   [label_16010], sp
    ld   h, a
    ld    hl, sp+$F8
    ld   l, b
    rlca
    ld    hl, sp+$00
    ld   l, d
    rlca
    ld    hl, sp+$08
    ld   h, d
    daa
    ld    hl, sp+$10
    ld   h, b
    daa
    ld   [label_168F8], sp
    ld   b, a
    ld   [label_16A00], sp
    ld   b, a
    ld   [label_16208], sp
    ld   h, a
    ld   [label_16010], sp
    ld   h, a
    ld    hl, sp+$F8
    ld   h, b
    rlca
    ld    hl, sp+$00
    ld   h, d
    rlca
    ld    hl, sp+$08
    ld   l, d
    daa
    ld    hl, sp+$10
    ld   l, b
    daa
    ld   [label_160F8], sp
    ld   b, a
    ld   [label_16200], sp
    ld   b, a
    ld   [label_16A08], sp
    ld   h, a
    ld   [label_16810], sp
    ld   h, a
    ld    hl, sp+$F8
    ld   h, b
    rlca
    ld    hl, sp+$00
    ld   h, d
    rlca
    ld    hl, sp+$08
    ld   h, d
    daa
    ld    hl, sp+$10

label_17810::
    ld   h, b
    daa
    ld   [label_16CF8], sp
    rlca
    ld   [label_16E00], sp
    rlca
    ld   [label_16208], sp
    ld   h, a
    ld   [label_16010], sp
    ld   h, a
    ld    hl, sp+$F8
    ld   h, b
    rlca
    ld    hl, sp+$00
    ld   h, d
    rlca
    ld    hl, sp+$08
    ld   h, d
    daa
    ld    hl, sp+$10
    ld   h, b
    daa
    ld   [label_160F8], sp
    ld   b, a
    ld   [label_16200], sp
    ld   b, a
    ld   [label_16E08], sp
    daa
    ld   [label_16C10], sp
    daa
    ld    hl, sp+$F8
    ld   l, h
    ld   b, a
    ld    hl, sp+$00
    ld   l, [hl]
    ld   b, a
    ld    hl, sp+$08
    ld   h, d
    daa
    ld    hl, sp+$10
    ld   h, b
    daa
    ld   [label_160F8], sp
    ld   b, a
    ld   [label_16200], sp
    ld   b, a
    ld   [label_16208], sp
    ld   h, a
    ld   [label_16010], sp
    ld   h, a
    ld    hl, sp+$F8
    ld   h, b
    rlca
    ld    hl, sp+$00
    ld   h, d
    rlca
    ld    hl, sp+$08
    ld   l, [hl]
    ld   h, a
    ld    hl, sp+$10
    ld   l, h
    ld   h, a
    ld   [label_160F8], sp
    ld   b, a
    ld   [label_16200], sp
    ld   b, a
    ld   [label_16208], sp
    ld   h, a
    ld   [label_16010], sp
    ld   h, a
    ld    hl, sp+$F8
    ld   h, b
    rlca
    ld    hl, sp+$00
    ld   h, d
    rlca
    ld    hl, sp+$08
    ld   h, d
    daa
    ld    hl, sp+$10
    ld   h, b
    daa
    ld   [label_178F8], sp
    rlca
    ld   [label_17A00], sp
    rlca
    ld   [label_17A08], sp
    daa
    ld   [label_17810], sp
    daa
    ld   [label_17600], sp
    rlca
    ld   [label_17608], sp
    daa
    ld   [label_17608], sp
    daa
    ld   [label_17608], sp
    daa
    ld   [label_17608], sp
    daa
    ld   [label_17608], sp
    daa
    ld   [label_17608], sp
    daa
    ld   [label_17608], sp
    daa
    ld   [label_164F8], sp
    rlca
    ld   [label_16600], sp
    rlca
    ld   [label_16608], sp
    daa
    ld   [label_16410], sp
    daa
    ld   [label_164F8], sp
    rlca
    ld   [label_16600], sp
    rlca
    ld   [label_16608], sp
    daa
    ld   [label_16410], sp
    daa
    ld   [label_178F8], sp
    rlca
    ld   [label_17A00], sp
    rlca
    ld   [label_17A08], sp
    daa
    ld   [label_17810], sp
    daa
    ld   [label_178F8], sp
    rlca
    ld   [label_17A00], sp
    rlca
    ld   [label_17A08], sp
    daa
    ld   [label_17810], sp
    daa
    ld    hl, sp+$00
    halt
    ld    hl, sp+$08
    halt
    ld    hl, sp+$08
    halt
    ld    hl, sp+$08
    halt
    ld    hl, sp+$08
    halt
    ld    hl, sp+$08
    halt
    ld    hl, sp+$08
    halt
    ld    hl, sp+$08
    halt
    ld    hl, sp+$F8
    ld   h, h
    ld   b, a
    ld    hl, sp+$00
    ld   h, [hl]
    ld   b, a
    ld    hl, sp+$08
    ld   h, [hl]
    ld   h, a
    ld    hl, sp+$10
    ld   h, h
    ld   h, a
    ld    hl, sp+$F8
    ld   h, h
    ld   b, a
    ld    hl, sp+$00
    ld   h, [hl]
    ld   b, a
    ld    hl, sp+$08
    ld   h, [hl]
    ld   h, a
    ld    hl, sp+$10
    ld   h, h
    ld   h, a
    ld    hl, sp+$F8
    ld   a, b
    ld   b, a
    ld    hl, sp+$00
    ld   a, d
    ld   b, a
    ld    hl, sp+$08
    ld   a, d
    ld   h, a
    ld    hl, sp+$10
    ld   a, b
    ld   h, a
    ld    hl, sp+$F8
    ld   a, b
    ld   b, a
    ld    hl, sp+$00
    ld   a, d
    ld   b, a
    ld    hl, sp+$08
    ld   a, d
    ld   h, a
    ld    hl, sp+$10
    ld   a, b
    ld   h, a
    ld   [label_160F8], sp
    ld   b, a
    ld   [label_16200], sp
    ld   b, a
    ld   [label_16208], sp
    ld   h, a
    ld   [label_16010], sp
    ld   h, a
    ld    hl, sp+$F8
    ld   a, b
    ld   b, a
    ld    hl, sp+$00
    ld   a, d
    ld   b, a
    ld    hl, sp+$08
    ld   a, d
    ld   h, a
    ld    hl, sp+$10
    ld   a, b
    ld   h, a

label_17982::
    ld   a, [$FFF1]
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
    ld   hl, label_17782
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $08
    jp   label_3DA0

label_179A5::
    db   $F2 ; Undefined instruction
    ld   c, $F0
    rst  $20
    and  $10
    ld   a, $03
    jr   z, label_179B0
    inc  a

label_179B0::
    ld   [$FFF1], a
    nop

label_179B3::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_179A5
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    cp   $14
    jr   c, label_17A1F
    cp   $7C
    jr   nc, label_17A1F
    ld   de, label_172CC
    call label_3BC0
    ld   a, [$FFF0]
    cp   $04
    jr   nc, label_17A1D
    ld   a, [$FFF1]
    and  a
    jr   z, label_17A1A
    xor  a
    ld   [$FFF1], a
    call label_3B70
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    cp   $16
    jr   nz, label_17A1A
    ld   hl, $D204
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   nz, label_17A1A
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   [hl], b
    call label_3B12
    ld   [hl], $04
    call label_C05
    ld   [hl], $FF

label_17A08::
    call label_27F2
    ld   a, $03
    ld   [$C5A7], a
    ld   a, $5E
    ld   [$D368], a
    ld   a, $B5
    call label_2385

label_17A1A::
    call label_3B44

label_17A1D::
    jr   label_179B3

label_17A1F::
    call label_3D8A
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_17A39
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $C0
    call label_3B70
    ld   hl, $C430
    add  hl, bc
    ld   [hl], $80

label_17A39::
    ret

label_17A3A::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_17A65

label_17A40::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_17A65
    cp   $0B
    jr   nz, label_17A65
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_17A65
    ld   hl, $C1A8
    ld   a, [$C19F]
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_17A65
    ld   a, [$C124]
    and  a
    jr   z, label_17A66

label_17A65::
    pop  af

label_17A66::
    ret
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_17AB0
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
    call label_17AB1
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_17AA3
    call label_3B23

label_17AA3::
    ld   hl, $C250
    add  hl, bc
    pop  af
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    pop  af
    ld   [hl], a
    pop  af

label_17AB0::
    ret

label_17AB1::
    call label_17ABE

label_17AB4::
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_17ABE
    pop  bc
    ret

label_17ABE::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_17AE9
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_17AD6::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_17AE0
    ld   e, $F0

label_17AE0::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_17AE9::
    ret

label_17AEA::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_17AE9
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310
    jr   label_17AD6

label_17B04::
    ld   e, $00
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   z, label_17B12
    inc  e

label_17B12::
    ld   d, a
    ret

label_17B14::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   nz, label_17B22
    inc  e

label_17B22::
    ld   d, a
    ret

label_17B24::
    call label_17B04
    ld   a, e
    ld   [$FFD7], a
    ld   a, d
    bit  7, a
    jr   z, label_17B31
    cpl
    inc  a

label_17B31::
    push af
    call label_17B14
    ld   a, e
    ld   [$FFD8], a
    ld   a, d
    bit  7, a
    jr   z, label_17B3F

label_17B3D::
    cpl
    inc  a

label_17B3F::
    pop  de
    cp   d
    jr   nc, label_17B47
    ld   a, [$FFD7]
    jr   label_17B49

label_17B47::
    ld   a, [$FFD8]

label_17B49::
    ld   e, a
    ret

label_17B4B::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_17B51::
    db   $10 ; Undefined instruction

label_17B53::
    jr   label_17B3D

label_17B55::
    nop
    ld   a, [$FF64]
    nop
    nop
    ld    hl, sp+$66
    nop
    nop
    nop
    ld   h, b
    nop
    nop
    ld   [label_2060], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_17B6A

label_17B6A::
    jr   label_17BD4
    jr   nz, label_17B6E

label_17B6E::
    ld   a, [$FF6C]
    nop
    nop
    ld    hl, sp+$6E
    nop
    nop
    nop
    ld   h, b
    nop
    nop
    ld   [label_2060], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_17B82

label_17B82::
    jr   label_17BF0
    jr   nz, label_17B86

label_17B86::
    ld   a, [$FF68]
    nop
    nop
    ld    hl, sp+$6A
    nop
    nop
    nop
    ld   h, b
    nop
    nop
    ld   [label_2060], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_17B9A

label_17B9A::
    jr   label_17C00
    jr   nz, label_17B9E

label_17B9E::
    ld   a, [$FF64]
    nop
    nop
    ld    hl, sp+$66
    nop
    nop
    nop
    ld   h, d
    nop
    nop
    ld   [label_2062], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_17BB2

label_17BB2::
    jr   label_17C1C
    jr   nz, label_17BB6

label_17BB6::
    ld   a, [$FF6C]
    nop
    nop
    ld    hl, sp+$6E
    nop
    nop
    nop
    ld   h, d
    nop
    nop
    ld   [label_2062], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_17BCA

label_17BCA::
    jr   label_17C38
    jr   nz, label_17BCE

label_17BCE::
    ld   a, [$FF68]
    nop
    nop
    ld    hl, sp+$6A

label_17BD4::
    nop
    nop
    nop
    ld   h, d
    nop
    nop
    ld   [label_2062], sp
    nop
    db   $10 ; Undefined instruction

label_17BE0::
    jr   nz, label_17BE2

label_17BE2::
    jr   label_17C48
    jr   nz, label_17BE0
    ld   h, [hl]
    pop  bc
    cp   $01
    jr   nz, label_17BF6
    call label_17CD5
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF0], a

label_17BF6::
    ld   a, [$FFF1]
    rla
    rla
    rla
    and  $F8
    ld   c, a
    rla
    and  $F0
    add  a, c
    ld   e, a
    ld   d, b
    ld   hl, label_17B55
    add  hl, de
    ld   c, $06
    call label_3CE6
    ld   a, $06
    call label_3DA0
    ld   a, [$FFEA]
    cp   $05
    jp   nz, label_17E6C
    call label_17A3A

label_17C1C::
    call label_3EE8
    call label_3B39
    call label_17AB1
    call label_3B23
    call label_C56
    ld   a, [$FFF0]
    rst  0
    ld   [hl], $7C
    ld   d, d
    ld   a, h
    ld   h, d
    ld   a, l
    ld   a, [bc]
    ld   a, [hl]
    call label_280D
    and  $01
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   e, a
    ld   d, b
    ld   hl, label_17B51
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_3B12
    ld   [hl], $01
    ret
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    call label_C00
    jp   nz, label_17CE8
    call label_C05
    jr   z, label_17C89
    cp   $01
    jr   nz, label_17C9C
    call label_17B04
    ld   d, b
    ld   hl, label_17B53
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    call label_C00
    call label_280D
    and  $3F
    add  a, $60
    ld   [hl], a
    jp   label_17CE8

label_17C89::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   hl, $FF99
    cp   [hl]
    jp  c, label_17CB3
    call label_C05
    ld   [hl], $60

label_17C9C::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    ld   hl, $C240
    add  hl, bc
    and  $04
    jr   nz, label_17CAE
    ld   [hl], $08
    jp   label_17D40

label_17CAE::
    ld   [hl], $F8
    jp   label_17D40

label_17CB3::
    ld   hl, $C210
    add  hl, bc
    ld   a, [$FF99]
    sub  a, [hl]
    cp   $28
    jr   nc, label_17CE8
    ld   hl, $C480
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_17CE8
    call label_280D
    and  $7F
    add  a, $40
    ld   [hl], a
    and  $03
    jr   z, label_17D21
    dec  a
    jr   nz, label_17CE8

label_17CD5::
    call label_3B12
    ld   [hl], $03
    call label_3D7F
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $40
    ld   a, $01
    jp   label_17D5F

label_17CE8::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_17D09
    call label_C00
    jr   z, label_17D01
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    xor  $F0
    ld   [hl], a
    jp   label_17D40

label_17D01::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_17D09::
    call label_C00
    jr   nz, label_17D40
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_17B51
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    jr   label_17D48

label_17D21::
    call label_C05
    ld   [hl], $60
    call label_C00
    ld   [hl], b
    call label_3B12
    ld   [hl], $02
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], a
    jr   label_17D48

label_17D40::
    ld   a, [$FFE7]
    and  $07
    jr   z, label_17D4E
    jr   label_17D5A

label_17D48::
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_17D5A

label_17D4E::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $03
    jr   nz, label_17D5A
    ld   [hl], $00

label_17D5A::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]

label_17D5F::
    jp   label_3B0C
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_17DDC
    call label_C05
    cp   $02
    jr   nc, label_17DCC
    cp   $00
    jr   z, label_17DA8
    ld   hl, $FF99
    ld   a, [hl]
    ld   hl, $C390
    add  hl, bc
    ld   [hl], a
    call label_280D
    and  $02
    jr   z, label_17D92
    call label_3D7F
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $10
    jp   label_17D97

label_17D92::
    ld   a, $10
    call label_3BAA

label_17D97::
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   hl, $FF99
    cp   [hl]
    jp   nc, label_17DE8
    jp   label_17DF0

label_17DA8::
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    sub  a, $08
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    jp   nc, label_17DF0
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    call label_3D7F
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F0
    ld   a, $16
    ld   [$FFF3], a
    jp   label_17DF0

label_17DCC::
    ld   hl, $C240
    add  hl, bc
    and  $04
    jr   nz, label_17DD8
    ld   [hl], $08
    jr   label_17DF0

label_17DD8::
    ld   [hl], $F8
    jr   label_17DF0

label_17DDC::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    cp   [hl]
    jr   c, label_17DF0

label_17DE8::
    call label_3D7F
    call label_3B12
    ld   [hl], $01

label_17DF0::
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_17E02
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $03
    jr   nz, label_17E02
    ld   [hl], $00

label_17E02::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    jp   label_3B0C
    ld   hl, $C300
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_17E13
    ret

label_17E13::
    call label_C00
    cp   $02
    jr   nc, label_17E3A
    cp   $00
    jr   z, label_17E35
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $80
    ld   a, $01
    call label_3B0C
    call label_3B12
    ld   [hl], $01
    ld   hl, $C300
    add  hl, bc
    ld   [hl], $40
    ret

label_17E35::
    call label_C00
    ld   [hl], $30

label_17E3A::
    cp   $18
    jr   nz, label_17E61
    ld   a, $7D
    call label_3B86
    jr   c, label_17E61
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
    ld   a, $18
    call label_3BAA
    pop  bc

label_17E61::
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $00
    ld   a, $04
    jp   label_3B0C

label_17E6C::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   a, b
    ld   a, [hl]
    adc  a, c
    ld   a, [hl]
    sbc  a, b
    ld   a, [hl]
    call label_C05
    ld   [hl], $A0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF

label_17E83::
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
    jp   label_17E83
    call label_C05
    jr   nz, label_17ED4

label_17E9D::
    ld   a, $1A
    ld   [$FFF4], a
    ld   a, [$FFEB]
    cp   $63
    jp   z, label_1758C
    call label_3F50
    ld   e, $0F
    ld   d, b

label_17EAE::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_17EBF
    ld   hl, $C430
    add  hl, de
    ld   a, [hl]
    and  $80
    jr   nz, label_17ECC

label_17EBF::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_17EAE
    xor  a
    ld   [$C1CF], a
    jp   label_27DD

label_17ECC::
    ld   a, [$FFF7]
    cp   $05
    ret  nc
    jp   label_17ED7

label_17ED4::
    jp   label_17550

label_17ED7::
    ld   hl, $D900
    ld   a, [$FFF6]
    ld   e, a
    ld   d, b
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_17EE9
    ld   hl, $DDE0
    jr   label_17EF2

label_17EE9::
    cp   $1A
    jr   nc, label_17EF2
    cp   $06
    jr   c, label_17EF2
    inc  d

label_17EF2::
    add  hl, de
    set  5, [hl]
    ret

label_17EF6::
    ld   c, $03
    ld   de, label_17EF6
    call label_3C77
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    dec  a
    ld   [hl], a
    jp   z, label_17B4B
    bit  4, a
    ld   e, $01
    jr   z, label_17F10
    ld   e, $FF

label_17F10::
    bit  0, a
    jr   nz, label_17F1B
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    add  a, e
    ld   [hl], a

label_17F1B::
    jp   label_17AB1

label_17F1E::
    ld   d, b
    ld   bc, label_152
    ld   d, d
    ld   hl, label_2150
    ld   d, h
    ld   bc, label_156
    ld   d, [hl]
    ld   hl, label_2154
    ld   a, [$DB74]
    and  a
    jp   z, label_17B4B
    ld   de, label_17F1E
    call label_3BC0
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEF]
    ld   e, $00
    cp   [hl]
    jr   c, label_17F4D
    ld   e, $02

label_17F4D::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $01
    add  a, e
    call label_3B0C
    call label_154C3
    call label_15506
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
