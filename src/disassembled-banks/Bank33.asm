section "bank33",romx,bank[$21]
    ld   a, [$DDD1]
    and  a
    ret  z
    bit  7, a
    jr   nz, label_8402B
    and  $01
    jr   z, label_84016
    ld   hl, $DC10
    ld   de, rBGPI
    call label_84062

label_84016::
    ld   a, [$DDD1]
    and  $02
    jr   z, label_84026
    ld   hl, $DC50
    ld   de, rOBPI
    call label_84062

label_84026::
    xor  a
    ld   [$DDD1], a
    ret

label_8402B::
    ld   a, $80
    ld   hl, $DDD3
    ld   e, [hl]
    sla  e
    or   e
    ld   b, a
    ld   a, [$DDD1]
    and  $01
    ld   a, b
    jr   z, label_84047
    ld   [rBGPI], a
    ld   bc, rBGPD
    ld   hl, $DC10
    jr   label_8404F

label_84047::
    ld   [rOBPI], a
    ld   bc, rOBPD
    ld   hl, $DC50

label_8404F::
    ld   d, $00
    add  hl, de
    ld   e, c
    ld   d, b
    ld   a, [$DDD4]
    sla  a
    ld   b, a
    call label_84068
    xor  a
    ld   [$DDD1], a
    ret

label_84062::
    ld   b, $40
    ld   a, $80
    ld   [de], a
    inc  de

label_84068::
    ld   a, [hli]
    ld   [de], a
    dec  b
    jr   nz, label_84068
    ret
    ld   a, [$DDD2]
    and  a
    ret  z
    bit  7, a
    jp   nz, label_8425E
    ld   hl, label_874F0
    ld   b, $00
    dec  a
    sla  a
    ld   c, a
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   b, [hl]
    or   b
    jr   z, label_840AE
    ld   h, b
    ld   l, c
    ld   de, $DC10
    ld   bc, $0080
    ld   a, [$DDD5]
    and  a
    jr   nz, label_8409F
    push bc
    push de
    push hl
    call label_2914
    pop  hl
    pop  de
    pop  bc

label_8409F::
    ld   a, $02
    ld   [rSVBK], a
    call label_2914
    xor  a
    ld   [rSVBK], a
    ld   a, $03
    ld   [$DDD1], a

label_840AE::
    xor  a
    ld   [$DDD2], a
    ret
    call label_85185
    ld   a, [$DDD1]
    ld   b, a
    ld   a, [$DDD2]
    or   b
    ret  nz
    call label_85318
    ld   a, [$DDD6]
    and  a
    ret  nz
    ld   a, [$DB96]
    cp   $07
    jr   z, label_840D3
    ld   a, $01
    ld   [$DDD5], a

label_840D3::
    call label_840DB
    xor  a
    ld   [$DDD5], a
    ret

label_840DB::
    ld   a, [$DBA5]
    and  a
    jr   nz, label_8411A
    ld   a, [$FFF6]
    ld   c, a
    ld   b, $00
    ld   hl, label_842EF
    add  hl, bc
    ld   a, [hl]
    sla  a
    ld   c, a
    ld   hl, label_842B1
    add  hl, bc
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a
    call label_841B4
    ld   a, [$FFF6]
    cp   $92
    ret  nz
    ld   hl, $DC8A
    ld   a, [label_856CE]
    ldi  [hl], a
    ld   a, [label_856CF]
    ldi  [hl], a
    ld   a, [label_856CA]
    ldi  [hl], a
    ld   a, [label_856CB]
    ldi  [hl], a
    ld   a, [label_856C8]
    ldi  [hl], a
    ld   a, [label_856C9]
    ld   [hl], a
    ret

label_8411A::
    ld   a, [$C125]
    cp   $04
    ret  nz
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_8412C
    ld   hl, label_867D0
    jp   label_841B4

label_8412C::
    cp   $0A
    jr   nc, label_8416C
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_843EF
    ld   a, [$FFF9]
    and  a
    jr   z, label_84165
    ld   a, [$FFF7]
    cp   $07
    jr   nz, label_84162
    ld   a, [$FFF6]
    cp   $64
    jr   z, label_8415D
    cp   $65
    jr   z, label_8415D
    cp   $66
    jr   z, label_8415D
    cp   $67
    jr   z, label_8415D
    cp   $6A
    jr   z, label_8415D
    cp   $6B
    jr   nz, label_84162

label_8415D::
    ld   hl, label_86750
    jr   label_8416A

label_84162::
    ld   hl, label_84401

label_84165::
    add  hl, de
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a

label_8416A::
    jr   label_841B4

label_8416C::
    cp   $10
    jr   nz, label_84191
    ld   a, [$FFF6]
    cp   $A3
    jr   nz, label_84191
    ld   a, [$DB48]
    cp   $01
    jr   z, label_8418C
    cp   $02
    jr   z, label_8418C
    ld   a, [$DB44]
    and  a
    jr   nz, label_84191
    ld   hl, label_873B0
    jr   label_841B4

label_8418C::
    ld   hl, label_874A0
    jr   label_841B4

label_84191::
    ld   a, [$FFF7]
    sub  a, $0A
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_84413
    add  hl, de
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    sla  a
    ld   e, a
    ld   hl, label_8443F
    add  hl, de
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a

label_841B4::
    ld   a, [$DDD5]
    and  a
    jr   nz, label_841D6
    push hl
    ld   bc, $0040
    ld   de, $DC10
    call label_2914
    push hl
    ld   hl, label_85518
    ld   bc, $0030
    call label_2914
    pop  hl
    ld   bc, $0010
    call label_2914
    pop  hl

label_841D6::
    ld   bc, $0040
    ld   de, $DC10
    ld   a, $02
    ld   [rSVBK], a
    call label_2914
    push hl
    ld   hl, label_85518
    ld   bc, $0030
    call label_2914
    pop  hl
    ld   bc, $0010
    call label_2914
    xor  a
    ld   [rSVBK], a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_84222
    ld   a, [$FFF6]
    cp   $0E
    jr   nz, label_84254
    ld   hl, label_85548
    ld   de, $DC78
    ld   c, $08

label_8420B::
    ld   a, [$DDD5]
    and  a
    jr   nz, label_84213
    ld   a, [hl]
    ld   [de], a

label_84213::
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hli]
    ld   [de], a
    inc  de
    xor  a
    ld   [rSVBK], a
    dec  c
    jr   nz, label_8420B
    jr   label_84254

label_84222::
    ld   a, [$FFF6]
    cp   $AA
    jr   nz, label_84254
    ld   a, [$DC0F]
    and  a
    jr   z, label_84254
    ld   hl, label_8552C
    cp   $01
    jr   z, label_84238
    ld   hl, label_85534

label_84238::
    ld   c, $02
    ld   de, $DC8C

label_8423D::
    ld   a, [$DDD5]
    and  a
    jr   nz, label_84247
    ld   a, [hl]
    ld   [$DC8C], a

label_84247::
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hli]
    ld   [de], a
    inc  de
    xor  a
    ld   [rSVBK], a
    dec  c
    jr   nz, label_8423D

label_84254::
    ld   a, $03
    ld   [$DDD1], a
    xor  a
    ld   [$DDD2], a
    ret

label_8425E::
    ld   a, $01
    ld   [$DDD1], a
    ld   hl, label_851F6
    ld   a, [$DDD2]
    and  $3F
    sla  a
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a
    ld   de, $DC10
    ld   bc, $0040
    ld   a, [$DB95]
    cp   $01
    jr   z, label_8429D
    ld   a, [$DDD2]
    bit  6, a
    jr   z, label_84295
    add  hl, bc
    ld   bc, $0010
    ld   de, $DC80
    ld   a, $02
    ld   [$DDD1], a

label_84295::
    call label_2914
    xor  a
    ld   [$DDD2], a
    ret

label_8429D::
    ld   a, $02
    ld   [rSVBK], a
    call label_2914
    xor  a
    ld   [rSVBK], a
    ld   a, $01
    ld   [$DDD1], a
    xor  a
    ld   [$DDD2], a
    ret

label_842B1::
    ld   d, b
    ld   d, l
    and  b
    ld   d, l
    ld   b, b
    ld   d, [hl]
    sub  a, b
    ld   d, [hl]
    ld   [rRP], a
    jr   nc, label_84314
    add  a, b
    ld   d, a
    jr   nz, label_84319
    ld   [hl], b
    ld   e, b
    ret  nz
    ld   e, b
    ld   h, b
    ld   e, c
    or   b
    ld   e, c
    and  b
    ld   e, d
    ld   a, [$FF5A]
    ld   b, b
    ld   e, e
    sub  a, b
    ld   e, e
    ld   [$FF5B], a
    add  a, b
    ld   e, h
    ret  nc
    ld   e, h
    db   $10 ; Undefined instruction
    and  b
    ld   e, [hl]
    ld   a, [$FF5E]
    ld   b, b
    ld   e, a
    sub  a, b
    ld   e, a
    ld   a, [$FF55]
    jr   nc, label_84341
    ret  nc
    ld   d, a
    nop
    ld   e, d
    db   $10 ; Undefined instruction
    jr   nz, label_8434A
    ld   d, b
    ld   e, d

label_842EF::
    rrca
    rrca
    rrca
    rrca
    rrca
    rrca
    inc  de
    inc  d
    inc  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    ld   d, $16
    add  hl, de
    add  hl, de
    rrca
    rrca
    rrca
    rrca
    inc  de
    inc  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    dec  d
    ld   d, $16
    rlca
    db   $10 ; Undefined instruction
    ld   c, $0E

label_84314::
    ld   c, $0E
    ld   [label_808], sp

label_84319::
    ld   [label_1117], sp
    ld   de, label_808
    inc  bc
    ld   c, $0E
    ld   c, $0E
    ld   c, $07
    rlca
    ld   b, $08
    ld   [label_1108], sp
    ld   de, label_808
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
    ld   b, $06
    ld   de, label_1111
    ld   de, $0000

label_84341::
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
    ld   b, $06
    ld   de, label_1111
    ld   de, $0000
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
    ld   b, $06
    ld   de, label_1111
    ld   de, $0000
    nop
    nop
    ld   [label_708], sp
    rlca
    ld   b, $06
    ld   b, $1A
    ld   de, label_1111
    ld   de, label_300
    inc  bc
    inc  bc
    inc  bc
    ld   [label_505], sp
    add  hl, bc
    ld   b, $0A
    ld   a, [bc]
    dec  e
    dec  e
    dec  bc
    ld   de, label_303
    inc  bc
    inc  bc
    inc  b
    inc  b
    dec  b
    dec  b
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  e
    dec  e
    dec  bc
    dec  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    inc  bc
    ld   e, $03
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    inc  b
    inc  b
    inc  b
    inc  b
    add  hl, bc
    inc  e
    add  hl, bc
    add  hl, bc
    dec  bc
    dec  de
    inc  c
    inc  c
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    inc  b
    inc  b
    inc  b
    inc  b
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    dec  bc
    dec  bc
    inc  c
    inc  c
    ld   bc, $0101
    jr   label_843EC
    ld   bc, label_909
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    dec  bc
    dec  bc
    dec  c
    dec  c
    ld   bc, $0101
    ld   bc, $0101
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    dec  bc

label_843EC::
    dec  c
    dec  c
    dec  c

label_843EF::
    ld   [$FF5F], a
    jr   nz, label_84454
    ret  nc
    ld   h, c
    ret  nz
    ld   h, d
    or   b
    ld   h, e
    nop
    ld   h, l
    ld   d, b
    ld   h, [hl]
    or   b
    ld   h, [hl]
    jr   nz, label_84469

label_84401::
    jr   nc, label_84463
    ld   [hl], b
    ld   h, c
    jr   nz, label_84469
    db   $10 ; Undefined instruction
    nop
    ld   h, h
    ld   h, b
    ld   h, l
    nop
    ld   h, [hl]
    nop
    ld   h, a
    jr   nz, label_8447B

label_84413::
    add  a, l
    ld   b, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, l
    ld   b, l
    add  a, l
    ld   b, [hl]
    add  a, l
    ld   b, a
    add  a, l
    ld   c, b
    add  a, l
    ld   c, c
    add  a, l
    ld   c, d
    add  a, l
    ld   c, e
    add  a, l
    ld   c, h
    add  a, l
    ld   c, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, l
    ld   c, [hl]
    add  a, l
    ld   c, a
    add  a, l
    ld   d, b

label_8443F::
    ld   [hl], b
    ld   l, b
    or   b
    ld   l, c
    nop
    ld   l, d
    ld   d, b
    ld   l, d
    ld   a, [$FF6A]
    ld   [rOBPD], a
    jr   nc, label_844B9
    add  a, b
    ld   l, h
    ret  nc
    ld   l, h
    jr   nz, label_844C0
    ld   [hl], b

label_84454::
    ld   l, l
    ret  nz
    ld   l, l
    db   $10 ; Undefined instruction
    ld   h, b
    ld   l, [hl]
    or   b
    ld   l, [hl]
    nop
    ld   l, a
    ld   d, b
    ld   l, a
    and  b
    ld   l, a

label_84463::
    ld   a, [$FF6F]
    ld   b, b
    ld   [hl], b
    sub  a, b
    ld   [hl], b

label_84469::
    ld   [rSVBK], a
    jr   nc, label_844DE
    add  a, b
    ld   [hl], c
    jr   nz, label_844E3
    db   $10 ; Undefined instruction
    nop
    ld   h, l
    ld   h, b
    ld   [hl], e
    ret  nz
    ld   l, b
    ld   b, b
    ld   l, e

label_8447B::
    sub  a, b
    ld   l, e
    and  b
    ld   l, d
    ret  nc
    ld   [hl], c
    db   $10 ; Undefined instruction
    ld   h, b
    ld   l, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_844B9::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_844C0::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_844DE::
    nop
    nop
    nop
    nop
    nop

label_844E3::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_1E1E
    nop
    ld   bc, $0000
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
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $0001
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   bc, label_202
    ld   bc, $0101
    ld   bc, label_201
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    inc  b
    nop
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0101
    ld   bc, $0101
    inc  b
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   hl, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$000F], sp
    ld   bc, $0000
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   c, $01
    ld   bc, $0000
    nop
    ld   bc, $0100
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
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    inc  b
    nop
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0100
    ld   bc, $0101
    inc  b
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  hl, bc
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $0001

label_84736::
    nop
    nop
    ld   bc, $0100
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
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    inc  b
    nop
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0100
    ld   bc, $0101
    inc  b
    ld   bc, $0001
    ld   bc, $011C
    ld   bc, $0101
    nop
    ld   bc, $0101
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_847FF::
    ld   bc, $0101
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   a, [bc]
    nop
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    nop
    dec  c
    nop
    nop
    nop
    ld   b, $01
    ld   [de], a
    ld   [de], a
    inc  c
    dec  c
    dec  bc
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, label_A01
    nop
    inc  de
    ld   bc, label_1B0A
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
    nop
    ld   b, $01
    ld   bc, label_A01
    ld   a, [bc]
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    ld   de, label_1501
    dec  c
    rlca
    rlca
    db   $10 ; Undefined instruction
    ld   bc, label_303
    inc  b
    ld   a, [bc]
    ld   bc, $0101
    ld   bc, label_1900
    ld   bc, $0100
    ld   bc, $0101
    inc  b
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
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
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $0001
    nop
    nop
    ld   bc, $0100
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
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    inc  b
    nop
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0100
    ld   bc, $0101
    inc  b
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    nop
    ldi  [hl], a
    ld   bc, $0101
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
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
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $0001
    nop
    inc  de
    ld   bc, $0100
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
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    inc  b
    nop
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0100
    ld   bc, $0101
    inc  b
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_84B1F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_84B31

label_84B31::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_84B65
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_84B75
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_84B65::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_84B75::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   d, $16
    nop
    ld   d, $16
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   d, $16
    nop
    ld   d, $16
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
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
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $0001
    nop
    nop
    ld   bc, $0100
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
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_501
    dec  b
    dec  b
    nop
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0100
    ld   bc, $0101
    dec  b
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [de]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [de]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [de]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
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
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $0001
    nop
    nop
    ld   bc, $0100
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
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    inc  b
    nop
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0100
    ld   bc, $0101
    inc  b
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   a, [bc]
    ld   bc, $0101
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
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
    ld   [bc], a
    ld   [bc], a
    nop
    ld   bc, $0001
    nop
    nop
    ld   bc, $0100
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
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    inc  b
    ld   b, $01
    ld   bc, $0101
    nop
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0104
    ld   bc, $0100
    ld   bc, $0101
    ld   bc, label_A01
    ld   bc, $0101
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
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
    ld   [bc], a
    inc  b
    nop
    ld   bc, $0001
    nop
    nop
    ld   bc, $0100
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
    nop
    nop
    ld   bc, $0101
    nop
    nop
    ld   bc, $0000
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, label_1F01
    rra
    rra
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_1717
    ld   bc, $0101
    inc  b
    ld   bc, label_401
    dec  e
    ld   bc, $0101
    ld   bc, $0001
    inc  b
    ld   bc, $0101
    nop

label_85185::
    ld   a, [$DBA5]
    and  a
    jr   z, label_851D6
    ld   b, $2D
    ld   hl, label_8523A

label_85190::
    ld   a, [$FFF7]
    ld   e, a
    ld   a, [hli]
    cp   e
    jr   nz, label_851CF
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [hli]
    cp   e
    jr   nz, label_851D0
    ld   a, [$C125]
    ld   e, a
    ld   a, [hli]
    cp   e
    jr   nz, label_851D1
    ld   a, [hli]
    ld   [$DDD2], a
    ld   a, e
    cp   $04
    jr   nz, label_851D5
    ld   a, $01
    ld   [$DDD5], a
    ld   hl, label_851F6
    ld   a, [$DDD2]
    and  $3F
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a
    call label_841B4
    xor  a
    ld   [$DDD5], a
    jr   label_851D5

label_851CF::
    inc  hl

label_851D0::
    inc  hl

label_851D1::
    inc  hl
    dec  b
    jr   nz, label_85190

label_851D5::
    ret

label_851D6::
    ld   b, $0E
    ld   hl, label_852EE

label_851DB::
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [hli]
    cp   e
    jr   nz, label_851F0
    ld   a, [$C125]
    ld   e, a
    ld   a, [hli]
    cp   e
    jr   nz, label_851F1
    ld   a, [hli]
    ld   [$DDD2], a
    jr   label_851F5

label_851F0::
    inc  hl

label_851F1::
    inc  hl
    dec  b
    jr   nz, label_851DB

label_851F5::
    ret

label_851F6::
    ld   [$FF5F], a
    add  a, b
    ld   h, b
    ret  nc
    ld   h, c
    ld   [hl], b
    ld   h, d
    or   b
    ld   h, e
    ld   d, b
    ld   h, h
    and  b
    ld   h, h
    or   b
    ld   h, l
    nop
    ld   h, [hl]
    ld   d, b
    ld   h, [hl]
    ret  nc
    ld   h, b
    ret  nz
    ld   h, d
    ld   h, b
    ld   h, e
    ld   h, b
    ld   h, e
    or   b
    ld   h, h
    or   b
    ld   h, [hl]
    add  a, b
    ld   h, c
    nop
    ld   h, l
    db   $10 ; Undefined instruction
    ld   h, b
    ld   h, [hl]
    ld   b, b
    ld   e, e
    ld   h, b
    ld   e, [hl]
    ld   h, b
    ld   e, c
    ret  nz
    ld   e, l
    ld   [hl], b
    ld   e, b
    ld   [$FF5B], a
    ld   [hl], b
    ld   e, l
    ld   a, [$FF5E]
    ld   h, b
    ld   h, a
    ld   [hl], b
    ld   h, a
    add  a, b
    ld   h, a
    and  b
    ld   d, l
    ld   d, b
    ld   d, l
    sub  a, b
    ld   d, [hl]

label_8523A::
    nop
    rla
    inc  b
    add  a, c
    nop
    inc  de
    ld   bc, $0080
    inc  de
    nop
    add  a, b
    nop
    inc  de
    inc  bc
    add  a, c
    nop
    stop
    jp   z, label_1C00
    ld   [bc], a
    jp   nz, label_2D01
    ld   [bc], a
    ret  nc
    ld   [bc], a
    ld   d, d
    inc  b
    add  a, e
    ld   [bc], a
    ld   d, c
    ld   [bc], a
    add  a, d
    ld   [bc], a
    ld   d, c
    inc  bc
    add  a, e
    inc  bc
    ld   a, b
    ld   bc, label_38B
    ld   a, b
    nop
    adc  a, e
    inc  bc
    ld   a, b
    inc  bc
    adc  a, h
    inc  bc
    rst  $28
    inc  bc
    call label_A104
    inc  b
    add  a, l
    inc  b
    sbc  a, a
    ld   [bc], a
    add  a, [hl]
    inc  b
    sbc  a, a
    nop
    add  a, l
    inc  b
    sbc  a, h
    ld   [bc], a
    add  a, h
    inc  b
    sbc  a, h
    ld   bc, label_484
    sbc  a, h
    nop
    add  a, [hl]
    inc  b
    sub  a, l
    nop
    add  a, h
    inc  b
    sub  a, l
    inc  bc
    add  a, [hl]
    inc  b
    add  a, c
    inc  b
    add  a, [hl]
    inc  b
    adc  a, e
    ld   [bc], a
    adc  a, $04
    add  a, l
    inc  bc
    call nz, label_D205
    ld   [bc], a
    jp   nc, label_CE05
    ld   [bc], a
    pop  de
    ld   b, $2E
    inc  b
    adc  a, c
    ld   b, $F8
    inc  b
    adc  a, b
    ld   b, $0E
    inc  b
    add  a, a
    ld   b, $0D
    ld   [bc], a
    adc  a, c
    ld   b, $0D
    nop
    add  a, a
    ld   b, $0F
    ld   [bc], a
    adc  a, c
    ld   b, $0F
    nop
    adc  a, c
    ld   b, $0F
    ld   bc, label_687
    rla
    ld   [bc], a
    db   $D3 ; Undefined instruction
    ld   b, $14
    ld   bc, label_6D3
    inc  de
    nop
    rst  0
    rlca
    ld   d, l
    ld   bc, label_7CA
    ld   d, h
    nop
    rst  8
    rlca
    ld   d, h
    inc  bc
    rst  8
    rlca
    ld   d, h
    ld   [bc], a
    rst  8
    ld   d, $6F
    ld   [bc], a
    call c, label_87F16
    ld   [bc], a
    db   $16
    ld   d, $8F
    inc  bc
    sbc  a, $44
    inc  bc
    sub  a, h
    ld   [hl], $00
    sub  a, h
    ld   d, $02
    sub  a, l
    ld   h, $03
    sub  a, l
    rla
    ld   [bc], a
    sub  a, l
    daa
    inc  bc
    sub  a, l
    ld   [$9B02], sp
    rla
    ld   bc, $9C9B
    nop
    sub  a, [hl]
    sbc  a, a
    ld   [bc], a
    rst  $10
    sbc  a, [hl]
    nop
    jp  c, label_2C
    sbc  a, b
    ld   [de], a
    nop
    sbc  a, c
    ld   h, l
    ld   [bc], a
    sbc  a, b

label_85318::
    ld   a, [$DBA5]
    and  a
    jr   nz, label_85342
    ld   b, $06
    ld   hl, label_85343

label_85323::
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [hli]
    cp   e
    jr   nz, label_8533D
    ld   a, [$C125]
    ld   e, a
    ld   a, [hli]
    cp   e
    jr   nz, label_8533E
    ld   a, [hli]
    ld   [$DDD6], a
    ld   a, $0B
    ld   [$DDD7], a
    jr   label_85342

label_8533D::
    inc  hl

label_8533E::
    inc  hl
    dec  b
    jr   nz, label_85323

label_85342::
    ret

label_85343::
    ld   b, b
    inc  bc
    ld   b, b
    jr   nc, label_8534A
    add  a, b
    ld   b, h

label_8534A::
    nop
    add  a, b
    ld   b, e
    ld   bc, $9040
    inc  bc
    add  a, b
    add  a, b
    ld   [bc], a
    ld   b, b
    call label_85366
    ld   a, [$C3CC]
    and  $0E
    ret  z
    ld   a, $01
    ld   [$FFE1], a
    call label_85432
    ret

label_85366::
    ld   a, [$FFF7]
    cp   $0A
    jr   nc, label_8537B
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_843EF
    add  hl, de
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a
    jr   label_8539C

label_8537B::
    sub  a, $0A
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_84413
    add  hl, de
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    sla  a
    ld   e, a
    ld   hl, label_8443F
    add  hl, de
    ld   a, [hli]
    ld   b, [hl]
    ld   h, b
    ld   l, a

label_8539C::
    ld   de, $DC10
    ld   bc, $0040
    push bc
    push de
    push hl
    call label_2914
    pop  hl
    pop  de
    pop  bc
    ld   a, $02
    ld   [rSVBK], a
    call label_2914
    xor  a
    ld   [rSVBK], a
    ret
    call label_85366
    ld   a, $01
    ld   [$FFE1], a
    call label_85440

label_853C0::
    xor  a
    ld   [$DDD3], a
    ld   a, $20
    ld   [$DDD4], a
    ld   a, $81
    ld   [$DDD1], a
    ret
    call label_85366
    ld   a, $01
    ld   [$FFE1], a
    call label_85432
    jr   label_853C0

label_853DB::
    dec  bc
    dec  c
    dec  c
    dec  c
    dec  bc
    dec  bc
    dec  bc
    dec  bc

label_853E3::
    rlca
    add  hl, bc
    add  hl, bc
    add  hl, bc
    rlca
    rlca
    rlca
    rlca

label_853EB::
    inc  b
    dec  b
    dec  b
    dec  b
    inc  b
    inc  b
    inc  b
    inc  b
    xor  a
    ld   [$FFE1], a
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$DBA5]
    and  a
    ret  z
    ld   hl, $C3CC
    ld   a, [$C3CD]
    cp   [hl]
    ret  z
    ld   a, [$C124]
    and  a
    ld   a, [$C3CD]
    jr   z, label_85435
    ld   hl, $C3CC
    ld   a, [$C3CD]
    cp   [hl]
    jr   nc, label_8541D
    ld   a, $40
    jr   label_8541F

label_8541D::
    ld   a, $80

label_8541F::
    ld   [$DDD6], a
    ld   a, [$FFF7]
    cp   $07
    jr   nz, label_8542C
    ld   a, $17
    jr   label_8542E

label_8542C::
    ld   a, $0B

label_8542E::
    ld   [$DDD7], a
    ret

label_85432::
    ld   a, [$C3CC]

label_85435::
    ld   hl, label_853EB
    cp   $08
    jr   z, label_85448
    cp   $02
    jr   z, label_85445

label_85440::
    ld   hl, label_853E3
    jr   label_85448

label_85445::
    ld   hl, label_853DB

label_85448::
    ld   b, $00

label_8544A::
    ld   a, [hli]
    ld   c, a
    call label_85466
    inc  b
    ld   a, b
    cp   $08
    jr   nz, label_8544A
    ld   a, [$FFE1]
    and  a
    jr   nz, label_85460
    ld   a, [$C124]
    and  a
    jr   z, label_85465

label_85460::
    ld   a, $01
    ld   [$DDD1], a

label_85465::
    ret

label_85466::
    push bc
    push hl
    ld   hl, $DC10
    ld   a, b
    sla  a
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de

label_85476::
    push hl
    ld   a, [$FFE1]
    and  a
    jr   nz, label_8548E
    ld   a, [$C124]
    and  a
    jr   nz, label_8548E
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hli]
    ld   e, a
    ld   d, [hl]
    xor  a
    ld   [rSVBK], a
    jr   label_85491

label_8548E::
    ld   a, [hli]
    ld   e, a
    ld   d, [hl]

label_85491::
    ld   a, e
    and  $1F
    call label_854F9
    ld   [$FFDF], a
    ld   a, e
    and  $E0
    swap a
    srl  a
    ld   b, a
    ld   a, d
    and  $03
    swap a
    srl  a
    or   b
    call label_854F9
    ld   [$FFE0], a
    ld   a, d
    and  $7C
    srl  a
    srl  a
    call label_854F9
    sla  a
    sla  a
    ld   d, a
    ld   a, [$FFE0]
    sla  a
    swap a
    and  $03
    or   d
    ld   d, a
    ld   a, [$FFE0]
    and  $07
    swap a
    sla  a
    ld   e, a
    ld   a, [$FFDF]
    or   e
    ld   e, a
    pop  hl
    ld   a, [$FFE1]
    and  a
    jr   nz, label_854ED
    ld   a, [$C124]
    and  a
    jr   nz, label_854ED
    ld   a, $02
    ld   [rSVBK], a
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldi  [hl], a
    xor  a
    ld   [rSVBK], a
    jr   label_854F1

label_854ED::
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldi  [hl], a

label_854F1::
    ld   a, l
    and  $07
    jr   nz, label_85476
    pop  hl
    pop  bc
    ret

label_854F9::
    push de
    ld   b, a
    and  $0F
    swap a
    ld   e, a
    ld   a, b
    swap a
    and  $01
    ld   d, a
    xor  a
    ld   h, a
    ld   l, a
    ld   b, c

label_8550A::
    ld   a, l
    add  a, e
    ld   l, a
    ld   a, h
    adc  a, $00
    add  a, d
    ld   h, a
    dec  b
    jr   nz, label_8550A
    ld   a, h
    pop  de
    ret

label_85518::
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop

label_8552C::
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop

label_85534::
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    rst  $18
    ld   a, [de]
    dec  de
    nop
    nop
    nop
    rst  $38
    ld   a, a
    xor  [hl]
    ld   a, [hl]
    nop
    ld   a, h
    nop
    nop

label_85548::
    rst  $38
    ld   a, a
    inc  c
    ld   e, $04
    ld   bc, $0000
    di
    halt
    add  hl, bc
    xor  c
    inc  c
    nop
    nop
    di
    halt
    ld   d, c
    ld   h, [hl]
    jr   nz, label_8555F

label_8555F::
    nop
    di
    halt
    inc  d
    inc  c
    stop
    nop
    di
    halt
    add  hl, bc
    adc  a, e
    ld   [$0000], sp
    di
    halt
    jr   nc, label_85576
    jr   label_85577

label_85577::
    nop
    ld   c, a
    add  hl, bc
    adc  a, l
    add  hl, bc
    xor  c
    inc  c
    nop
    nop
    di
    halt
    ld   [hl], $63
    add  hl, de
    nop
    nop
    rst  $38
    ld   b, a
    di
    halt
    dec  h
    nop
    nop
    di
    halt
    ld   [hl], $63
    add  hl, de
    nop
    nop
    di
    halt
    ld   d, c
    ld   h, [hl]
    jr   nz, label_8559F

label_8559F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_855AF

label_855AF::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    dec  de
    ld   a, [de]
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_1521
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_855EF

label_855EF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_855FF

label_855FF::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    dec  de
    ld   a, [de]
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_1521
    nop
    nop
    nop
    nop
    call nz, label_2126
    dec  d
    nop
    nop
    nop
    nop
    nop
    nop
    dec  sp
    ld   c, $9F
    dec  hl
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8564F

label_8564F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    jp   label_7C
    inc  l
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   d, d
    ld   e, $E5
    inc  c
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8568F

label_8568F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8569F

label_8569F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    jp   label_7C
    inc  l
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop

label_856C8::
    rst  $38

label_856C9::
    ld   b, a

label_856CA::
    ld   [hl], l

label_856CB::
    ld   a, h
    rlca
    inc  a

label_856CE::
    nop

label_856CF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_856DF

label_856DF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_856EF

label_856EF::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   l, b
    ld   a, l
    ld   a, c
    ld   a, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rra
    inc  d
    rst  $38
    ld   b, a
    ld   a, a
    ld   [bc], a
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8572F

label_8572F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8573F

label_8573F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    jp   label_7C

label_85755::
    inc  l
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   a, a
    db   $EC ; Undefined instruction
    ld   [de], a
    dec  c
    ld   [hl], h
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8577F

label_8577F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8578F

label_8578F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   a, a
    dec  d
    ld   [hl], $0C
    stop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_857CF

label_857CF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_857DF

label_857DF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   a, a
    dec  d
    ld   [hl], $0C
    stop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    cp   [hl]
    rrca
    inc  de
    ld   [bc], a
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8582F

label_8582F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   d, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    xor  a
    add  hl, bc
    and  $04
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8586F

label_8586F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8587F

label_8587F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    dec  de
    ld   a, [de]
    di
    ld   d, c
    ld   h, a
    jr   z, label_858AF

label_858AF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_858BF

label_858BF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_858CF

label_858CF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   a, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_858FF

label_858FF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8590F

label_8590F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8591F

label_8591F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   a, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8594F

label_8594F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8596F

label_8596F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    xor  a
    add  hl, bc
    and  $04
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_859AF

label_859AF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_859BF

label_859BF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    rra
    ld   d, b
    rrca
    jr   nz, label_859EF

label_859EF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_859FF

label_859FF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85A0F

label_85A0F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    rra
    ld   d, b
    rrca
    jr   nz, label_85A3F

label_85A3F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_85A4F

label_85A4F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85A5F

label_85A5F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    jp   label_7C
    inc  l
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   [hl], l
    ld   a, h
    rlca
    inc  a
    nop
    nop
    rst  $38
    ld   a, a
    nop
    nop
    ld   [hl], c
    ld   b, h
    ld   a, a
    ld   a, l
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_85A9F

label_85A9F::
    nop
    sbc  a, l
    rra
    cp   $01
    nop
    ld   a, h
    nop
    ld   a, h
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85AAF

label_85AAF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, de
    rra
    sbc  a, d
    ld   bc, label_87C00
    nop
    ld   a, h
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    sub  a, [hl]
    ld   a, [de]
    ld   [hl], $01
    nop
    ld   a, h
    nop
    ld   a, h
    rst  $38
    ld   a, a
    sub  a, $31
    add  a, l
    ld   de, $0000
    sbc  a, l
    rra
    cp   $01
    nop
    ld   a, h
    nop
    ld   a, h
    rst  $38
    ld   b, a
    cp   e
    ld   [de], a
    ld   d, c
    ld   bc, $0000
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85AFF

label_85AFF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   a, a
    sub  a, $31
    add  a, l
    ld   de, $0000
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85B3F

label_85B3F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85B4F

label_85B4F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   d, d
    ld   e, $CE
    stop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   a, a
    call nz, label_1F26
    ld   bc, $0069
    di
    halt
    add  hl, bc
    xor  c
    inc  c
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85B8F

label_85B8F::
    nop
    ld   l, b
    ld   a, l
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85B9F

label_85B9F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    push bc
    ld   c, h
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85BCF

label_85BCF::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85BD7

label_85BD7::
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85BDF

label_85BDF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85BEF

label_85BEF::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    sbc  a, e
    ld   h, $C4
    ld   h, $21
    dec  d
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85C1F

label_85C1F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85C2F

label_85C2F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85C3F

label_85C3F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    sbc  a, e
    ld   h, $C4
    ld   h, $21
    dec  d
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85C6F

label_85C6F::
    nop
    reti
    ld   de, label_86233
    ret  z
    jr   c, label_85C77

label_85C77::
    nop
    reti
    ld   de, $0000
    xor  d
    ld   d, $FF
    ld   a, a
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85C8F

label_85C8F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    ld   l, b
    ld   a, l
    ld   l, $13
    ld   h, $09
    ld   b, h
    db   $10 ; Undefined instruction
    ld   d, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85CCF

label_85CCF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85CDF

label_85CDF::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   d, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    db   $FC ; Undefined instruction
    ld   c, a
    ld   h, l
    ld   [hl], $C2
    ld   b, b
    inc  a
    ld   a, [de]
    inc  a
    ld   a, [de]
    ld   d, a
    ld   h, [hl]
    inc  c
    dec  [hl]
    ld   b, h
    inc  d
    inc  a
    ld   a, [de]
    rst  $38
    ld   b, a
    rst  $28
    add  hl, bc
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85D17

label_85D17::
    nop
    rst  $38
    ld   a, a
    rst  $38
    ld   b, a
    rst  $28
    add  hl, bc
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85D2F

label_85D2F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   d, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    db   $FC ; Undefined instruction
    ld   c, a
    ld   h, l
    ld   [hl], $C2
    ld   b, b
    inc  a
    ld   a, [de]
    inc  a
    ld   a, [de]
    ld   d, a
    ld   h, [hl]
    inc  c
    dec  [hl]
    ld   b, h
    inc  d
    inc  a
    ld   a, [de]
    di
    ld   d, c
    ld   h, a
    jr   z, label_85D5F

label_85D5F::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85D67

label_85D67::
    nop
    inc  a
    ld   a, [de]
    di
    ld   d, c
    ld   h, a
    jr   z, label_85D6F

label_85D6F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85D7F

label_85D7F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   d, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    db   $FC ; Undefined instruction
    ld   c, a
    ld   h, l
    ld   [hl], $C2
    ld   b, b
    inc  a
    ld   a, [de]
    inc  a
    ld   a, [de]
    ld   d, a
    ld   h, [hl]
    inc  c
    dec  [hl]
    ld   b, h
    inc  d
    inc  a
    ld   a, [de]
    nop
    nop
    rst  $28
    add  hl, bc
    rst  $38
    ld   b, a
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85DBF

label_85DBF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85DCF

label_85DCF::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   d, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    db   $FC ; Undefined instruction
    ld   c, a
    ld   h, l
    ld   [hl], $C2
    ld   b, b
    inc  a
    ld   a, [de]
    inc  a
    ld   a, [de]
    ld   d, a
    ld   h, [hl]
    inc  c
    dec  [hl]
    ld   b, h
    inc  d
    inc  a
    ld   a, [de]
    nop
    nop
    rst  $28
    add  hl, bc
    rst  $38
    ld   b, a
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85E0F

label_85E0F::
    nop
    ld   l, b
    ld   a, l
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85E1F

label_85E1F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    push bc
    ld   c, h
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    sbc  a, l
    ld   c, h
    ld   l, b
    ld   a, l
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85E4F

label_85E4F::
    nop
    rst  $38
    ld   b, a
    nop
    nop
    ld   h, a
    jr   z, label_85E57

label_85E57::
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85E5F

label_85E5F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85E6F

label_85E6F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    push bc
    ld   c, h
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85E9F

label_85E9F::
    nop
    ld   l, b
    ld   a, l
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85EAF

label_85EAF::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    push bc
    ld   c, h
    reti
    ld   de, label_10CE
    nop
    nop
    dec  de
    ld   a, [de]
    call nz, label_2126
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85EDF

label_85EDF::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85EE7

label_85EE7::
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85EEF

label_85EEF::
    nop
    ld   l, b
    ld   a, l
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85EFF

label_85EFF::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    push bc
    ld   c, h
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85F2F

label_85F2F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85F3F

label_85F3F::
    nop
    ld   e, e
    ldi  [hl], a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85F4F

label_85F4F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    push bc
    ld   c, h
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    inc  c
    ld   e, $04
    ld   bc, $0000
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85F7F

label_85F7F::
    nop
    rst  $38
    ld   a, a
    nop
    nop
    inc  c
    ld   e, $FF
    ld   b, a
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85F8F

label_85F8F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85F9F

label_85F9F::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85FCF

label_85FCF::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85FD7

label_85FD7::
    nop
    ld   e, e
    ldi  [hl], a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85FDF

label_85FDF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_85FEF

label_85FEF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    ld   e, d
    rst  $18
    jr   c, label_86017
    inc  c
    nop
    nop
    add  a, a
    ld   a, l
    and  $44
    dec  c
    halt
    nop

label_86010::
    add  a, a
    ld   a, l
    ld   d, $7E
    adc  a, l
    jr   c, label_86017

label_86017::
    nop
    ld   d, d
    ld   c, d
    adc  a, $39
    add  hl, hl
    dec  h
    nop
    nop
    add  a, a
    ld   a, l
    ld   d, $7E
    ld   l, h
    ld   h, b
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8602F

label_8602F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8603F

label_8603F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    ld   e, d
    rst  $18
    jr   c, label_86067
    inc  c
    nop
    nop
    rst  $38
    ld   b, a
    ld   [label_57D], a
    ld   b, c
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  $44
    nop

label_86067::
    nop
    ld   d, d
    ld   c, d
    adc  a, $39
    add  hl, hl
    dec  h
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  $44
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8607F

label_8607F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8608F

label_8608F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    ld   e, d
    rst  $18
    jr   c, label_860B7
    inc  c
    nop
    nop
    add  a, a
    ld   a, l
    and  $44
    dec  c
    halt
    nop
    rst  $38
    ld   b, a
    call nz, label_E226
    add  hl, de
    ld   [$FF0C], a
    ld   d, d
    ld   c, d
    adc  a, $39
    add  hl, hl
    dec  h
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_E226
    add  hl, de
    ld   [$FF0C], a
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_860CF

label_860CF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_860DF

label_860DF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    ld   e, d
    rst  $18
    jr   c, label_86107
    inc  c
    nop
    nop
    add  a, a
    ld   a, l
    and  $44
    dec  c
    halt
    nop
    add  a, a
    ld   a, l
    ld   d, $7E
    ld   l, h
    ld   h, b
    nop

label_86107::
    nop
    ld   d, d
    ld   c, d
    adc  a, $39
    add  hl, hl
    dec  h
    nop
    nop
    rst  $38
    ld   a, a
    nop
    nop
    ld   a, [de]
    inc  [hl]
    cp   a
    ld   l, l
    ld   a, a
    ld   l, a
    nop
    nop
    adc  a, e
    ld   b, c
    rla
    ld   l, e
    sub  a, h
    ld   a, [hl]
    call label_8657D
    inc  [hl]
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8612F

label_8612F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [de], a
    ld   a, a
    rst  $20
    ld   a, h
    nop
    inc  [hl]
    nop
    nop
    cp   d
    db   $3A ; ldd  a, [hl]
    ld   [hl], b
    add  hl, bc
    ret
    ld   [$0000], sp
    ld   d, a
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    jr   label_861B5
    ld   a, [bc]
    ld   e, [hl]
    ld   [$FF5C], a
    nop
    nop
    ld   d, a
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8616F

label_8616F::
    nop
    sub  a, h
    ld   a, [hl]
    call label_8657D
    inc  [hl]
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8617F

label_8617F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [de], a
    ld   a, a
    rst  $20
    ld   a, h
    nop
    inc  [hl]
    nop
    nop
    cp   d
    db   $3A ; ldd  a, [hl]
    ld   [hl], b
    add  hl, bc
    ret
    ld   [$0000], sp
    ld   d, a
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    jr   label_86205
    ld   a, [bc]
    ld   e, [hl]
    ld   [$FF5C], a
    nop
    nop
    inc  sp
    ld   h, d
    ccf
    ld   [bc], a
    inc  sp

label_861B5::
    dec  b
    nop
    nop
    inc  sp
    ld   h, d
    jr   label_86207
    ld   c, l
    dec  l
    nop
    nop
    inc  sp
    ld   h, d
    nop
    nop
    inc  sp
    dec  b
    ccf
    ld   [bc], a
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_861CF

label_861CF::
    nop
    db   $10 ; Undefined instruction
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_861DF

label_861DF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [hl], $47
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   bc, label_1A72
    nop
    nop
    db   $10 ; Undefined instruction
    reti
    ld   de, label_10CE
    nop

label_86207::
    nop
    ld   c, a
    ld   d, d
    ld   h, a
    add  hl, sp
    jp   nz, label_2C
    nop
    db   $10 ; Undefined instruction
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8621F

label_8621F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8622F

label_8622F::
    nop
    rst  $38
    ld   b, a
    rla

label_86233::
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    ld   e, d
    rst  $18
    jr   c, label_86257
    inc  c
    nop
    nop
    rst  $38
    ld   b, a
    ld   [label_57D], a
    ld   b, c
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  $44
    nop

label_86257::
    nop
    ld   d, d
    ld   c, d
    adc  a, $39
    add  hl, hl
    dec  h
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  $44
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8626F

label_8626F::
    nop
    rst  $38
    ld   b, a
    ld   b, l
    ld   a, l
    and  h
    inc  a
    ld   h, d
    jr   nz, label_86278
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8627F

label_8627F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [hl], $47
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   bc, label_1A72
    nop
    nop
    db   $10 ; Undefined instruction
    reti
    ld   de, label_10CE
    nop
    nop
    ld   c, a
    ld   d, d
    ld   h, a
    add  hl, sp
    jp   nz, label_2C
    nop
    db   $10 ; Undefined instruction
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_862BF

label_862BF::
    nop
    ld   d, d
    ld   d, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_862CF

label_862CF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    sbc  a, $73
    and  b
    db   $3A ; ldd  a, [hl]
    ld   b, b
    dec  d
    nop
    nop
    ld   d, d
    ld   d, $6B
    dec  d
    and  l
    inc  b
    nop
    nop
    ld   [rUNKN7], a
    nop
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   hl, $0000
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    ld   d, d
    ld   d, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8630F

label_8630F::
    nop
    ld   d, d
    ld   d, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8631F

label_8631F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    sbc  a, $73
    and  b
    db   $3A ; ldd  a, [hl]
    ld   b, b
    dec  d
    nop
    nop
    ld   d, d
    ld   d, $6B
    dec  d
    and  l
    inc  b
    nop
    nop
    ld   [rUNKN7], a
    nop
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   hl, $0000
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    inc  sp
    ld   h, d
    ccf
    ld   [bc], a
    inc  sp
    dec  b
    nop
    nop
    inc  sp
    ld   h, d
    jr   label_863A7
    ld   c, l
    dec  l
    nop
    nop
    ld   d, d
    ld   d, $16
    ld   a, [hl]
    ld   l, h
    ld   h, b
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8636F

label_8636F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    sbc  a, $73
    and  b
    db   $3A ; ldd  a, [hl]
    ld   b, b
    dec  d
    nop
    nop
    ld   d, d
    ld   d, $6B
    dec  d
    and  l
    inc  b
    nop
    nop
    ld   [rUNKN7], a
    nop
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   hl, $0000
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    nop
    nop
    rst  $18
    ld   a, [de]
    xor  l
    ld   a, b
    nop

label_863A7::
    nop
    nop
    nop
    nop
    nop
    rst  $18
    ld   a, [de]
    rst  $38
    ld   a, a
    ld   [hl], h
    ld   [bc], a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_863BF

label_863BF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $10
    ld   d, d
    sub  a, c
    add  hl, hl
    db   $EC ; Undefined instruction
    inc  d
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    ld   l, e
    ld   bc, label_2319
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    reti
    ld   de, label_10CE
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_863FF

label_863FF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8640F

label_8640F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    ld   e, d
    rst  $18
    jr   c, label_86437
    inc  c
    nop
    nop
    db   $D3 ; Undefined instruction
    ld   a, [hl]
    add  a, a
    ld   a, l
    and  $44
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    and  $44
    nop

label_86437::
    nop
    sbc  a, e
    ld   b, a
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    inc  sp
    ld   h, d
    ccf
    ld   [bc], a
    inc  sp
    dec  b
    nop
    nop
    inc  sp
    ld   h, d
    jr   label_86497
    ld   c, l
    dec  l
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8645F

label_8645F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $10
    ld   d, d
    sub  a, c
    add  hl, hl
    db   $EC ; Undefined instruction
    inc  d
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    ld   l, e
    ld   bc, label_2319
    nop
    nop
    rst  $38
    ld   b, a
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   bc, $00A5
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    reti
    ld   de, label_10CE
    nop

label_86497::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8649F

label_8649F::
    nop
    ld   [hl], h
    ld   [bc], a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_864AF

label_864AF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $10
    ld   d, d
    sub  a, c
    add  hl, hl
    db   $EC ; Undefined instruction
    inc  d
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    ld   l, e
    ld   bc, label_2319
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    ld   d, $7E
    ld   l, h
    ld   h, b
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    ld   [hl], h
    ld   [bc], a
    ld   d, $7E
    ld   l, h
    ld   h, b
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_864EF

label_864EF::
    nop
    ld   [hl], h
    ld   [bc], a
    nop
    nop
    rra
    inc  d
    rst  $38
    ld   a, a
    rst  $38
    ld   b, a
    nop
    nop
    ld   c, [hl]
    ld   d, c
    rst  $38
    ld   a, a
    ld   d, d
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8650F

label_8650F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    sbc  a, $73
    cp   [hl]
    ld   d, c
    inc  d
    jr   nc, label_86527

label_86527::
    nop
    ld   d, d
    ld   l, $AD
    ld   bc, $00C6
    nop
    nop
    ccf
    ld   [hl], $5A
    dec  h
    xor  a
    inc  d
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    ld   d, d
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8654F

label_8654F::
    nop
    ld   d, d
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    jp   z, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8656F

label_8656F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    sbc  a, $73
    cp   [hl]
    ld   d, c
    inc  d
    jr   nc, label_86587

label_86587::
    nop
    ld   d, d
    ld   l, $AD
    ld   bc, $00C6
    nop
    nop
    ccf
    ld   [hl], $5A
    dec  h
    xor  a
    inc  d
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    ccf
    ld   [hl], $5A
    dec  h
    xor  a
    inc  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_865AF

label_865AF::
    nop
    and  a
    ld   bc, label_871EC
    and  h
    inc  a
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_865BF

label_865BF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, sp
    ld   h, a
    ld   d, d
    ld   c, d
    add  hl, hl
    dec  h
    nop
    nop
    and  a
    ld   bc, $0102
    dec  hl
    ld   [bc], a
    nop
    nop
    and  a
    ld   bc, label_11D9
    adc  a, $10
    nop
    nop
    rst  $38
    ld   b, a
    sub  a, $29
    ld   l, $1D
    add  a, [hl]
    inc  c
    and  a
    ld   bc, label_11D9
    adc  a, $10
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_865FF

label_865FF::
    nop
    rst  $38
    ld   b, a
    halt
    add  hl, hl
    nop
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8660F

label_8660F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    adc  a, l
    ld   a, l
    rst  $38
    ld   a, a
    nop
    nop
    rst  $38
    ld   b, a
    inc  c
    ld   e, $04
    ld   bc, $0000
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    inc  b
    ld   bc, $0000
    rst  $38
    ld   b, a
    inc  c
    ld   e, $D9
    ld   de, $0000
    cp   $63
    db   $DB
    ldd  [hl], a
    db   $D3 ; Undefined instruction
    dec  h
    rst  0
    inc  e
    cp   $63
    sub  a, h
    ld   e, d
    ld   l, d
    add  hl, sp
    rst  0
    inc  e
    and  a
    ld   bc, label_871EC
    and  h
    inc  a
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8665F

label_8665F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, sp
    ld   h, a
    ld   d, d
    ld   c, d
    add  hl, hl
    dec  h
    nop
    nop
    and  a
    ld   bc, $0102
    dec  hl
    ld   [bc], a
    nop
    nop
    and  a
    ld   bc, label_11D9
    adc  a, $10
    nop
    nop
    rst  $38
    ld   b, a
    dec  hl
    ld   c, c
    ld   h, a
    jr   z, label_8668F

label_8668F::
    nop
    and  a
    ld   bc, label_11D9
    adc  a, $10
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8669F

label_8669F::
    nop
    and  a
    ld   bc, label_11D9
    adc  a, $10
    nop
    nop
    rst  $38
    ld   b, a
    ld   d, d
    ld   c, d
    add  hl, hl
    dec  h
    nop
    nop
    sbc  a, a
    ld   [bc], a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_866BF

label_866BF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rra
    ld   sp, $0015
    dec  bc
    nop
    nop
    nop
    sbc  a, a
    ld   [bc], a
    rst  $18
    nop
    ld   d, e
    nop
    nop
    nop
    rst  $38
    ld   b, a
    ccf
    add  hl, bc
    add  hl, bc
    nop
    nop
    nop
    cp   $63
    ld   [de], a
    ld   a, a
    push hl
    ld   a, l
    nop
    nop
    sbc  a, a
    ld   [bc], a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_866FF

label_866FF::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_86707

label_86707::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8670F

label_8670F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rra
    ld   sp, $0015
    dec  bc
    nop
    nop
    nop
    sbc  a, a
    ld   [bc], a
    rst  $18
    nop
    ld   d, e
    nop
    nop
    nop
    rst  $38
    ld   b, a
    ccf
    add  hl, bc
    add  hl, bc
    nop
    nop
    nop
    cp   $63
    ld   [de], a
    ld   a, a
    push hl
    ld   a, l
    nop
    nop
    inc  sp
    ld   h, d
    ccf
    ld   [bc], a
    inc  sp
    dec  b
    nop
    nop
    inc  sp
    ld   h, d
    jr   label_86797
    ld   c, l
    dec  l
    nop
    nop

label_86750::
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8675F

label_8675F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rra
    ld   sp, $0015
    dec  bc
    nop
    nop
    nop
    sbc  a, a
    ld   [bc], a
    rst  $18
    nop
    ld   d, e
    nop
    nop
    nop
    rst  $38
    ld   b, a
    ccf
    add  hl, bc
    add  hl, bc
    nop
    nop
    nop
    cp   $63
    ld   [de], a
    ld   a, a
    push hl
    ld   a, l
    nop
    nop
    inc  sp
    ld   h, d
    ccf
    ld   [bc], a
    inc  sp
    dec  b
    nop

label_86797::
    nop
    inc  sp
    ld   h, d
    jr   label_867E7
    ld   c, l
    dec  l
    nop
    nop
    ld   d, d
    ld   l, $00
    nop
    push bc
    inc  h
    rst  $10
    ld   [hl], $FF
    ld   b, a
    cp   e
    ld   [de], a
    ld   d, c
    ld   bc, $0000
    ld   d, d
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    cp   e
    ld   [de], a
    ld   d, c
    ld   bc, $0000
    ld   d, d
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    cp   e
    ld   [de], a
    ld   d, c
    ld   bc, $0000

label_867D0::
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_867DF

label_867DF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp

label_867E7::
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [hl], $47
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    adc  a, h
    ld   sp, label_2108
    db   $10 ; Undefined instruction
    nop
    nop
    adc  a, h
    ld   sp, label_11D9
    adc  a, $10
    nop
    nop
    rst  $38
    ld   b, a
    add  hl, sp
    ld   c, $C7
    nop
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8681F

label_8681F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8682F

label_8682F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    sub  a, [hl]
    ld   h, [hl]
    or   c
    ld   d, l
    xor  c
    jr   c, label_86847

label_86847::
    nop
    ld   h, a
    add  hl, sp
    jp   nz, label_D2C
    ld   c, d
    nop
    nop
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    nop
    nop
    add  a, a
    ld   a, l
    ld   a, h
    inc  l
    rrca
    nop
    ld   [$FF08], sp
    ld   b, a
    ccf
    add  hl, bc
    add  hl, bc
    nop
    nop
    nop
    nop
    nop
    sbc  a, e
    dec  de
    sub  a, b
    ld   b, l
    nop
    nop
    cp   $63
    ld   l, a
    ld   a, [hl]
    inc  b
    ld   a, l
    ldi  [hl], a
    ld   [label_847FF], sp
    di
    ld   d, c
    ld   h, a
    jr   z, label_8687F

label_8687F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   a, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   a, a
    add  a, e
    inc  sp
    dec  h
    ld   [de], a
    ldi  [hl], a
    ld   [label_85755], sp
    adc  a, e
    ld   b, d
    inc  b
    ld   a, l
    ldi  [hl], a
    ld   [label_863FE], sp
    ld   e, b
    ld   l, $04
    ld   a, l
    ldi  [hl], a
    ld   [label_863FE], sp
    cp   d
    ld   l, $50
    dec  d
    ldi  [hl], a
    ld   [label_86F7F], sp
    ld   d, d
    ld   e, $E5
    inc  c
    nop
    nop
    cp   $63
    ld   l, a
    ld   a, [hl]
    inc  b
    ld   a, l
    ldi  [hl], a
    ld   [label_847FF], sp
    di
    ld   d, c
    ld   h, a
    jr   z, label_868CF

label_868CF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   a, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   a, a
    add  a, e
    inc  sp
    dec  h
    ld   [de], a
    ldi  [hl], a
    ld   [label_85755], sp
    adc  a, e
    ld   b, d
    inc  b
    ld   a, l
    ldi  [hl], a
    ld   [label_863FE], sp
    ld   e, b
    ld   l, $04
    ld   a, l
    ldi  [hl], a
    ld   [label_847FF], sp
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   a, a
    nop
    nop
    ld   [hl], c
    ld   b, h
    ld   a, a
    ld   a, l
    cp   $63
    ld   l, a
    ld   a, [hl]
    inc  b
    ld   a, l
    ldi  [hl], a
    ld   [label_847FF], sp
    di
    ld   d, c
    ld   h, a
    jr   z, label_8691F

label_8691F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   a, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   a, a
    add  a, e
    inc  sp
    dec  h
    ld   [de], a
    ldi  [hl], a
    ld   [label_85755], sp
    adc  a, e
    ld   b, d
    inc  b
    ld   a, l
    ldi  [hl], a
    ld   [label_863FE], sp
    ld   e, b
    ld   l, $04
    ld   a, l
    ldi  [hl], a
    ld   [label_863FE], sp
    cp   d
    ld   l, $50
    dec  d
    ldi  [hl], a
    ld   [label_847FF], sp
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86967

label_86967::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8696F

label_8696F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    dec  sp
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, sp
    ld   c, $11
    add  hl, de
    cp   $63
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_869B7

label_869B7::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_869BF

label_869BF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    dec  sp
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, sp
    ld   c, $11
    add  hl, de
    cp   $63
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_869FF

label_869FF::
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86A07

label_86A07::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_86A0F

label_86A0F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    dec  sp
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, sp
    ld   c, $11
    add  hl, de
    cp   $63
    nop
    nop
    add  hl, sp
    ld   c, $B5
    ld   a, [hl]
    ld   b, a
    ld   a, l
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86A4F

label_86A4F::
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86A57

label_86A57::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_86A5F

label_86A5F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    dec  sp
    rst  $38
    ld   a, h
    db   $10 ; Undefined instruction
    nop
    nop
    add  hl, sp
    ld   c, $11
    add  hl, de
    cp   $63
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86A9F

label_86A9F::
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86AA7

label_86AA7::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_86AAF

label_86AAF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    dec  sp
    rst  $38
    ld   a, h
    db   $10 ; Undefined instruction
    nop
    nop
    add  hl, sp
    ld   c, $11
    add  hl, de
    cp   $63
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    inc  sp
    ld   h, d
    ld   a, [de]
    ld   bc, label_FFF
    rst  $38
    ld   a, a
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86AF7

label_86AF7::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_86AFF

label_86AFF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    dec  sp
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, sp
    ld   c, $11
    add  hl, de
    cp   $63
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    add  hl, sp
    ld   c, $F7
    inc  bc
    rst  0
    nop
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86B3F

label_86B3F::
    nop
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86B47

label_86B47::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_86B4F

label_86B4F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    dec  sp
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, sp
    ld   c, $11
    add  hl, de
    cp   $63
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    nop
    nop
    rlca
    ld   e, h
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   a, a
    add  hl, sp
    ld   c, $F3
    ld   d, c
    ld   h, a
    jr   z, label_86B97

label_86B97::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_86B9F

label_86B9F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, a
    dec  sp
    reti
    ld   de, label_10CE
    nop
    nop
    add  hl, sp
    ld   c, $11
    add  hl, de
    cp   $63
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $C4
    ld   h, $21
    dec  d
    nop
    nop
    add  hl, sp
    ld   c, $AE
    ld   a, [hl]
    nop
    ld   a, h
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_86BEF

label_86BEF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [hl], $47
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   bc, label_1A72
    nop
    nop
    db   $10 ; Undefined instruction
    di
    ld   d, c
    ld   h, a
    jr   z, label_86C17

label_86C17::
    nop
    ld   c, [hl]
    ld   h, $46
    ld   bc, label_84736
    nop
    nop
    ld   c, [hl]
    ld   h, $46
    ld   bc, label_84736
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86C3F

label_86C3F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    cp   $45
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86C7F

label_86C7F::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86C8F

label_86C8F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86CCF

label_86CCF::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86CDF

label_86CDF::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    cp   $63
    cp   $63
    cp   $63
    cp   $63
    db   $FD ; Undefined instruction
    ld   l, $36
    ld   a, a
    ld   b, l
    ld   a, l
    nop
    nop
    cp   $63
    call nz, label_2126
    dec  d
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $36
    ld   a, a
    ld   b, l
    ld   a, l
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86D1F

label_86D1F::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86D2F

label_86D2F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a

label_86D3A::
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, [de]
    jr   z, label_86D42
    ld   a, a
    ld   a, [de]
    jr   z, label_86D47

label_86D47::
    nop
    ld   c, a
    ccf
    call nz, label_2126
    dec  d
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    cp   $63
    call nz, label_2126
    dec  d
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    rst  $38
    ld   a, a
    ld   b, d
    ld   b, $00
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86D7F

label_86D7F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   b, l
    ld   a, l
    rst  $38
    ld   a, a
    ld   b, l
    ld   a, l
    nop
    nop
    cp   $45
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86DBF

label_86DBF::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86DCF

label_86DCF::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    ld   c, a
    ccf
    call nz, label_2126
    dec  d
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86E0F

label_86E0F::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86E1F

label_86E1F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, [de]
    jr   z, label_86E32
    ld   a, a
    ld   a, [de]
    jr   z, label_86E37

label_86E37::
    nop
    ld   e, b
    ld   c, $30
    add  hl, de
    cp   $63
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86E5F

label_86E5F::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86E6F

label_86E6F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    inc  bc
    ld   [bc], a
    rst  $38
    ld   a, a
    inc  bc
    ld   [bc], a
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86EAF

label_86EAF::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86EBF

label_86EBF::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, [de]
    jr   z, label_86ED2
    ld   a, a
    ld   a, [de]
    jr   z, label_86ED7

label_86ED7::
    nop
    cp   $45
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86EFF

label_86EFF::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86F0F

label_86F0F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    dec  d
    inc  a
    rst  $38
    ld   a, a
    dec  d
    inc  a
    nop
    nop
    cp   a
    ld   a, l
    rla
    ld   e, h
    inc  c
    jr   nc, label_86F2F

label_86F2F::
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86F4F

label_86F4F::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86F5F

label_86F5F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, [de]
    jr   z, label_86F72
    ld   a, a
    ld   a, [de]
    jr   z, label_86F77

label_86F77::
    nop
    cp   a
    ld   a, l
    rla
    ld   e, h
    inc  c
    jr   nc, label_86F7F

label_86F7F::
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86F9F

label_86F9F::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86FAF

label_86FAF::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    cp   $45
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    rst  $38
    dec  b
    and  d
    ldi  [hl], a
    nop
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_86FFF

label_86FFF::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_8704F

label_8704F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   a, [de]
    jr   z, label_87062
    ld   a, a
    ld   a, [de]
    jr   z, label_87067

label_87067::
    nop
    ld   e, b
    ld   c, $30
    add  hl, de
    cp   $63
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    rst  $38
    ld   a, a
    ld   sp, $0052
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_8709F

label_8709F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    cp   [hl]
    rrca
    inc  de
    ld   [bc], a
    nop
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_870EF

label_870EF::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    dec  c
    halt
    ld   a, l
    and  h
    inc  a
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    rst  $38
    ld   a, a
    dec  a
    ld   [$0000], sp
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8713F

label_8713F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   e, d
    inc  bc
    ld   d, d
    ld   [bc], a
    ld   c, d
    ld   bc, $0000
    add  a, a
    ld   a, l
    and  $44
    dec  c
    halt
    nop
    add  a, a
    ld   a, l
    reti
    ld   de, label_10CE
    nop
    nop
    add  a, a
    ld   a, l
    rst  $18
    jr   c, label_8717F
    inc  c
    nop
    nop
    add  a, a
    ld   a, l
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8717F

label_8717F::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8718F

label_8718F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    ld   a, a
    add  a, e
    inc  sp
    ld   hl, label_2215
    ld   [label_87FFF], sp
    dec  d
    ld   [hl], $0C
    stop
    nop
    rst  $38
    ld   b, a
    ld   d, d
    ld   e, $E5
    inc  c
    nop
    nop
    add  a, e
    inc  sp
    reti
    ld   de, label_10CE
    ldi  [hl], a
    ld   [label_847FF], sp
    ld   d, d
    ld   e, $E5
    inc  c
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_871CF

label_871CF::
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_871DF

label_871DF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [hl], $47
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   bc, label_1A72
    nop
    nop
    ld   c, a
    ld   d, d
    ld   h, a
    add  hl, sp
    jp   nz, label_2C
    nop
    db   $10 ; Undefined instruction
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    ld   sp, rHDMA2
    ld   b, a
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8722F

label_8722F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [hl], $47
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   bc, label_1A72
    nop
    nop
    ld   c, a
    ld   d, d
    ld   h, a
    add  hl, sp
    jp   nz, label_2C
    nop
    db   $10 ; Undefined instruction
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    ld   sp, rHDMA2
    ld   b, a
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, a
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8727F

label_8727F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [hl], $47
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   bc, label_1A72
    nop
    nop
    ld   c, a
    ld   d, d
    ld   h, a
    add  hl, sp
    jp   nz, label_2C
    nop
    db   $10 ; Undefined instruction
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    ld   sp, rHDMA2
    ld   b, a
    rst  $38
    ld   b, a

label_872BA::
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, a
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_872CF

label_872CF::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   [hl], $47
    ld   c, [hl]
    ld   h, $46
    ld   bc, $0000
    db   $10 ; Undefined instruction
    add  hl, hl
    ld   bc, label_1A72
    nop
    nop
    ld   c, a
    ld   d, d
    ld   h, a
    add  hl, sp
    jp   nz, label_2C
    nop
    db   $10 ; Undefined instruction
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    ld   sp, rHDMA2

label_87307::
    ld   b, a
    rst  $38
    ld   b, a
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, a
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop

label_87317::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8731F

label_8731F::
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    ld   h, a
    jr   z, label_872BA
    ld   a, l
    and  $44
    nop
    nop
    ld   h, a
    jr   z, label_8733F
    inc  e
    rra
    jr   nz, label_8733F

label_8733F::
    nop
    ld   h, a
    jr   z, label_87307
    ld   h, $62
    dec  d
    nop
    nop
    ld   h, a
    jr   z, label_8734A
    inc  bc
    xor  l
    ld   bc, $0000
    ld   h, a
    jr   z, label_87317
    ld   h, $62
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8735F

label_8735F::
    nop
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    cp   $63
    ld   sp, $C552
    jr   z, label_8736F

label_8736F::
    nop
    cp   $63
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    cp   $63
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    ld   c, a
    ccf
    call nz, label_2126
    dec  d
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $36
    ld   a, a
    ld   b, l
    ld   a, l
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    nop
    nop
    ld   [hl], c
    ld   b, h
    ld   a, a
    ld   a, l
    rst  $38
    ld   a, a
    nop
    nop
    ld   sp, $FE52
    ld   h, e

label_873B0::
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_873BF

label_873BF::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    cp   $45
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    rst  $38
    ld   b, a
    nop
    nop
    ld   sp, rHDMA2
    ld   b, a
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a

label_873FE::
    rst  $38
    ld   b, a
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_8740F

label_8740F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    cp   $45
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    rst  $38
    ld   b, a
    nop
    nop
    ld   sp, rHDMA2
    ld   b, a
    rst  $38
    ld   b, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, a
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_8745F

label_8745F::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    cp   $45
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    rst  $38
    ld   b, a
    nop
    nop
    ld   sp, rHDMA2
    ld   b, a
    rst  $38
    ld   b, a
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, a

label_874A0::
    rst  $38
    ld   b, a
    db   $FD ; Undefined instruction
    ld   l, $B5
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   sp, $C552
    jr   z, label_874AF

label_874AF::
    nop
    rst  $38
    ld   b, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    db   $F4 ; Undefined instruction
    add  hl, bc
    rst  $38
    ld   a, a
    db   $F4 ; Undefined instruction
    add  hl, bc
    nop
    nop
    cp   $45
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    db   $FD ; Undefined instruction
    ld   l, $FF
    inc  bc
    db   $D3 ; Undefined instruction
    ld   bc, $0000
    db   $FD ; Undefined instruction
    ld   l, $D9
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    ld   sp, rHDMA2
    ld   b, a

label_874F0::
    nop
    nop
    nop
    nop
    ld   [hl], $75
    ld   [hl], $75
    nop
    nop
    nop
    nop
    nop
    nop
    or   [hl]
    ld   [hl], l
    nop
    nop
    ld   [hl], $75
    ld   l, [hl]
    ld   a, b
    ld   [hl], $75
    or   [hl]
    ld   [hl], l
    nop
    nop
    nop
    nop
    ld   [hl], $75
    xor  $7D
    sub  a, [hl]
    halt
    halt
    halt
    ld   a, b
    ld   l, [hl]
    ld   a, c
    xor  $79
    ld   l, [hl]
    ld   a, d
    xor  $7A
    ld   l, [hl]
    ld   a, e
    xor  $7B
    ld   l, [hl]
    ld   a, h
    ld   l, [hl]
    ld   a, h
    xor  $7C
    ld   l, [hl]
    ld   a, l
    ld   l, $77
    ld   l, [hl]
    ld   [hl], a
    nop
    nop
    nop
    nop
    jr   z, label_8756A
    cp   [hl]
    inc  de
    nop
    ld   sp, $0000
    dec  d
    add  hl, de
    and  d
    ld   sp, label_8480A
    nop
    nop
    dec  d
    add  hl, de
    rra
    ld   c, e
    ld   a, [bc]
    ld   c, b
    nop
    nop
    dec  d
    add  hl, de
    rra
    ld   c, e
    and  d
    ld   sp, $0000
    rra
    ld   [de], a
    cp   $27
    ld   a, [bc]
    ld   c, b
    nop
    nop
    cp   a
    ld   hl, label_84B1F
    ld   a, [bc]
    ld   c, b
    nop
    nop
    add  a, b
    ld   d, h
    xor  d
    add  hl, sp

label_8756A::
    ld   b, a
    add  hl, hl
    db   $E3 ; Undefined instruction
    inc  d
    db   $E3 ; Undefined instruction
    ld   h, c
    rst  $38
    ld   a, a
    add  a, e
    ld   e, h
    ld   [bc], a
    inc  [hl]
    ld   b, b
    ld   a, [hl]
    nop
    nop
    ld   b, d
    ld   b, $FF
    ld   c, [hl]
    ld   b, b
    ld   a, [hl]
    sub  a, h
    ld   e, d
    ld   e, a
    rla
    ld   [$FF7E], a
    ld   b, b
    ld   a, [hl]
    add  a, [hl]
    ld   c, c
    jr   c, label_875FB
    jr   nz, label_875B6
    ld   b, b
    ld   a, [hl]
    nop
    nop
    add  hl, sp
    ld   a, [de]
    rst  $38
    ld   c, [hl]
    rst  $38
    ld   a, a
    db   $F2 ; Undefined instruction
    nop
    add  hl, de
    ld   a, [hli]
    ld   e, a
    rla
    rst  $38
    ld   a, a
    adc  a, e
    db   $10 ; Undefined instruction
    ld   a, [hli]
    ld   e, a
    rla
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_875B6::
    rst  $38
    ld   a, a
    ld   l, e
    ccf
    add  a, h
    dec  c
    nop
    nop
    rst  $38
    ld   a, a
    ld   c, [hl]
    ld   l, [hl]
    dec  b
    ld   b, c
    nop
    nop
    rst  $38
    ld   a, a
    ld   e, a
    jr   c, label_8763D
    jr   label_875CD

label_875CD::
    nop
    rst  $38
    ld   a, a
    sbc  a, a
    dec  hl
    ld   d, b
    ld   bc, $0000
    rst  $38
    ld   a, a
    ccf
    ld   l, $71
    nop
    nop
    nop
    rst  $38
    ld   a, a
    sub  a, h
    ld   b, [hl]
    ld   h, [hl]
    ld   bc, $0000
    rst  $38
    ld   a, a
    ld   d, l
    ld   b, d
    dec  c
    ld   [$0000], sp
    rst  $38
    ld   a, a
    xor  [hl]
    dec  c
    inc  h
    dec  c
    nop
    nop
    ld   b, b
    ld   a, [hl]
    nop
    nop
    ld   b, d

label_875FB::
    ld   b, $FF
    ld   c, [hl]
    ld   b, b
    ld   a, [hl]
    sub  a, h
    ld   e, d
    ld   e, a
    rla
    ld   [$FF7E], a
    ld   b, b
    ld   a, [hl]
    add  a, [hl]
    ld   c, c
    jr   c, label_8767B
    jr   nz, label_87636
    ld   b, b
    ld   a, [hl]
    nop
    nop
    add  hl, sp
    ld   a, [de]
    rst  $38
    ld   c, [hl]
    rst  $38
    ld   a, a
    db   $F2 ; Undefined instruction
    nop
    add  hl, de
    ld   a, [hli]
    ld   e, a
    rla
    rst  $38
    ld   a, a
    adc  a, e
    db   $10 ; Undefined instruction
    ld   a, [hli]
    ld   e, a
    rla
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_87636::
    rst  $38
    ld   a, a
    pop  af
    ld   [hl], d
    ld   h, c
    ld   h, [hl]
    nop

label_8763D::
    nop
    rst  $38
    ld   b, a
    ld   e, c
    ld   d, $2D
    ld   de, $0000
    rst  $38
    ld   a, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    and  [hl]
    dec  d
    nop
    nop
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    ld   h, c
    ld   h, [hl]
    nop
    nop
    sbc  a, c
    ld   [hl], e
    sub  a, c
    ld   d, d
    rlca
    ld   e, [hl]
    inc  bc
    dec  [hl]
    ld   e, c
    ld   d, $2D
    ld   de, label_15A6
    nop
    nop
    rst  $38
    ld   b, a
    cp   h
    ldi  [hl], a
    nop
    nop
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    and  d

label_8767B::
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, [hl]
    rra
    ld   c, e
    ld   e, [hl]
    add  hl, sp
    inc  d
    inc  e
    ld   b, h
    inc  b
    rra
    ld   c, e
    call c, label_F72D
    db   $10 ; Undefined instruction
    inc  b
    rst  $38
    ld   a, a
    db   $0E
    ld   c, $14
    inc  e
    ld   b, h
    inc  b
    rra
    ld   c, e
    db   $0E
    ld   c, $F7
    db   $10 ; Undefined instruction
    inc  b
    rra
    ld   c, e
    ld   e, [hl]
    add  hl, sp
    adc  a, h
    ld   h, b
    ld   b, h
    inc  b
    rra
    ld   c, e
    ld   e, [hl]
    add  hl, sp
    rst  $30
    db   $10 ; Undefined instruction
    inc  b
    rst  $38
    ld   a, a
    db   $0E
    ld   c, $8C
    ld   h, b
    ld   b, h
    inc  b
    rra
    ld   c, e
    call c, label_CE2D
    inc  hl
    ld   b, h
    inc  b
    rst  $38
    ld   a, e
    ld   sp, $C53A
    inc  h
    ld   hl, label_87B0C
    ld   c, a
    rst  8
    ld   de, label_4C5
    nop
    nop
    rst  $38
    ld   a, e
    ld   sp, label_86D3A
    inc  d
    ld   hl, $000C
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, h
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   e, e
    dec  e
    ld   e, $31
    ld   d, $64
    inc  e
    rst  $38
    ld   e, e
    cp   l
    ld   a, [hli]
    ld   de, label_86415
    inc  e
    rst  $38
    ld   e, e
    dec  sp
    scf
    ld   c, c
    ld   b, l
    ld   h, h
    inc  e
    rst  $38
    ld   e, e
    sbc  a, h
    dec  a
    ld   c, c
    ld   b, l
    ld   h, h
    inc  e
    rst  $38
    ld   e, e
    xor  a
    ccf
    ld   c, c
    ld   b, l
    ld   h, h
    inc  e
    rst  $38
    ld   e, e
    xor  a
    ccf
    db   $D3 ; Undefined instruction
    ld   h, l
    ld   h, h
    inc  e
    rst  $38
    ld   e, e
    sbc  a, h
    dec  a
    ld   e, b
    inc  h
    ld   h, h
    inc  e
    rst  $38
    ld   e, e
    dec  sp
    scf
    dec  e
    ld   e, $64
    inc  e
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    nop
    nop
    nop
    nop
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
    rst  $38
    ld   b, a
    inc  c
    ld   e, $04
    ld   bc, $0000
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    inc  c
    ld   e, $FF
    ld   b, a
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    add  a, e
    ld   c, h
    nop
    nop
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
    rst  $38
    ld   a, a
    inc  c
    ld   e, $04
    ld   bc, $0000
    rst  $38
    ld   a, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    nop
    nop
    inc  c
    ld   e, $FF
    ld   b, a
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_877FD

label_877FD::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_1521
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    rst  $18
    ld   a, [de]
    ld   a, l
    jr   label_87855

label_87855::
    nop
    rst  $38
    ld   a, a
    xor  [hl]
    ld   a, [hl]
    nop
    ld   a, h
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_8786D

label_8786D::
    nop
    rst  $38
    ld   b, a
    call nz, label_A526
    inc  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    and  l
    inc  d
    nop
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    and  l
    inc  d
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_88C
    nop
    nop
    rst  $38
    ld   b, a
    ld   l, b
    ld   a, l
    adc  a, h
    ld   [$0000], sp
    rst  $38
    ld   b, a
    rla
    inc  d
    adc  a, h
    ld   [$0000], sp
    rst  $38
    ld   b, a
    adc  a, h
    ld   [label_14A5], sp
    nop
    nop
    rst  $38
    ld   b, a
    ld   l, b
    ld   a, l
    and  l
    inc  d
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   c, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   c, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   b, a
    adc  a, h
    ld   bc, label_22A2
    nop
    nop
    rst  $38
    ld   b, a
    ccf
    inc  d
    ccf
    inc  d
    rst  $38
    ld   a, a
    rst  $38
    ld   b, a
    nop
    nop
    ld   d, e
    ld   de, label_2ADC
    rst  $38
    ld   b, a
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   a, a
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
    jr   nz, label_87903

label_87903::
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
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, [hl]
    nop
    nop
    cp   $6F
    cp   $6F
    cp   $6F
    nop
    nop
    cp   $6F
    cp   $6F
    cp   $6F
    nop
    nop
    rst  $38
    inc  bc
    ld   [hl], e
    ld   [bc], a
    adc  a, $01
    nop
    nop
    sbc  a, e
    dec  de
    sub  a, b
    ld   b, l
    xor  c
    jr   nc, label_879D7
    ld   a, l
    ld   d, d
    ld   e, [hl]
    ld   d, d
    ld   e, [hl]
    rst  $38
    ld   a, a
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    ld   h, $7D
    ld   [hl], c
    ld   a, [hl]
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, b
    ld   a, l
    add  hl, sp
    ld   c, $FF
    inc  sp
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    nop
    nop
    ld   l, b
    ld   a, l
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    nop
    nop
    jr   z, label_879EE
    rra
    ld   [de], a
    or   e
    ld   a, [hl]
    nop
    nop
    dec  d
    add  hl, de
    rra
    ld   c, e
    or   e
    ld   a, [hl]
    nop
    nop
    dec  d
    add  hl, de
    ld   l, e
    inc  b
    or   e
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    or   e

label_879D7::
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a

label_879EE::
    ld   l, b
    ld   a, l
    ld   d, d
    ld   e, [hl]
    ld   d, d
    ld   e, [hl]
    rst  $38
    ld   a, a
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    ld   h, $7D
    ld   [hl], c
    ld   a, [hl]
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, b
    ld   a, l
    add  hl, sp
    ld   c, $FF
    inc  sp
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    adc  a, b
    inc  l
    inc  sp
    rra
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
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    nop
    nop
    cp   $27
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    ld   d, d
    ld   e, [hl]
    ld   d, d
    ld   e, [hl]
    rst  $38
    ld   a, a
    add  a, e
    ld   c, h
    nop
    nop
    rra
    ld   [de], a
    dec  d
    add  hl, de
    ld   l, e
    inc  b
    nop
    nop
    dec  d
    add  hl, de
    rra
    ld   c, e
    add  a, e
    ld   c, h
    nop
    nop
    jr   z, label_87ABE
    rra
    ld   c, e
    add  a, e
    ld   c, h
    nop
    nop
    ld   h, $7D
    ld   [hl], c
    ld   a, [hl]
    dec  d
    add  hl, de
    nop
    nop
    cp   a
    ld   hl, label_84B1F
    add  a, e
    ld   c, h
    nop
    nop
    ld   l, e
    inc  b
    dec  d
    add  hl, de
    add  a, e
    ld   c, h
    nop
    nop
    dec  d
    add  hl, de
    rra
    ld   c, e
    ld   [rJOYP], a
    nop
    nop
    ld   l, b
    ld   a, l
    rst  $38
    ld   a, a
    ld   [rJOYP], a
    nop
    ld   sp, label_121F
    jr   z, label_87AF0

label_87ABE::
    ld   [rJOYP], a
    jr   z, label_87AF4
    rra
    ld   [de], a
    cp   $27
    ld   [rJOYP], a
    add  a, e
    ld   c, h
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    ld   [rJOYP], a
    nop
    nop
    dec  d
    add  hl, de
    rra
    ld   c, e
    ld   [rJOYP], a
    cp   a
    ld   hl, label_121F
    rst  $38
    ld   a, a
    ld   [rJOYP], a
    dec  d
    add  hl, de
    rra
    ld   [de], a
    cp   $27
    ld   [rJOYP], a
    nop
    ld   sp, label_21BF
    jr   z, label_87B20
    ld   l, b
    ld   a, l

label_87AF0::
    ld   d, d
    ld   e, [hl]
    ld   d, d
    ld   e, [hl]

label_87AF4::
    rst  $38

label_87AF5::
    ld   a, a
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop

label_87B0C::
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    ld   h, $7D
    ld   [hl], c
    ld   a, [hl]
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h

label_87B20::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, b
    ld   a, l
    add  hl, sp
    ld   c, $FF
    inc  sp
    rst  $38
    ld   a, a
    push bc
    ld   c, h
    rst  $38
    ld   a, a
    xor  e
    ld   d, [hl]
    ld   [rSTAT], a
    or   e
    ld   a, [hl]
    nop
    nop
    nop
    ld   sp, label_3228
    or   e
    ld   a, [hl]
    nop
    nop
    rra
    ld   [de], a
    cp   $27
    or   e
    ld   a, [hl]
    nop
    nop
    cp   a
    ld   hl, label_84B1F
    or   e
    ld   a, [hl]
    nop
    nop
    ld   l, e
    inc  b
    dec  d
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    dec  d
    add  hl, de
    rra
    ld   c, e
    or   e
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    nop
    nop
    cp   $27
    rst  $38
    ld   a, a
    ld   l, b
    ld   a, l
    ld   d, d
    ld   e, [hl]
    ld   d, d
    ld   e, [hl]
    rst  $38
    ld   a, a
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    ld   h, $7D
    ld   [hl], c
    ld   a, [hl]
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, b
    ld   a, l
    add  hl, sp
    ld   c, $FF
    inc  sp
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    nop
    nop
    jp   label_B10
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    rrc  b
    ld   h, a
    ld   [label_87EB3], sp
    nop
    nop
    ld   h, a
    ld   [label_424], sp
    or   e
    ld   a, [hl]
    nop
    nop
    jp   label_86010
    db   $10 ; Undefined instruction
    ld   a, [hl]
    nop
    nop
    xor  e
    inc  c
    dec  bc
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    ld   h, a
    ld   [label_10C3], sp
    or   e
    ld   a, [hl]
    nop
    nop
    ld   h, b
    db   $10 ; Undefined instruction
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    ld   h, b
    db   $10 ; Undefined instruction
    ld   [label_87D68], sp
    ld   d, d
    ld   e, [hl]
    ld   d, d
    ld   e, [hl]
    rst  $38
    ld   a, a
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h

label_87C00::
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    ld   h, $7D
    ld   [hl], c
    ld   a, [hl]
    add  a, e
    ld   c, h
    nop
    nop

label_87C1A::
    nop
    nop
    nop
    nop
    add  a, e
    ld   c, h
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, b
    ld   a, l
    add  hl, sp
    ld   c, $FF
    inc  sp
    rst  $38
    ld   a, a
    push bc
    ld   c, h
    nop
    nop
    jr   z, label_87C66
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    rra
    ld   c, e
    nop
    ld   sp, label_3228
    or   e
    ld   a, [hl]
    nop
    nop
    rra
    ld   [de], a
    dec  d
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    rra
    ld   c, e
    dec  d
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    ld   l, e
    inc  b
    dec  d
    add  hl, de
    or   e
    ld   a, [hl]
    nop
    nop
    ld   [rSTAT], a
    rst  $38
    ld   a, a
    or   e
    ld   a, [hl]
    rrca
    ld   a, h
    rst  $18
    jr   c, label_87C1A
    ld   [bc], a

label_87C66::
    or   e
    ld   a, [hl]
    nop
    nop
    ld   l, b
    ld   a, l
    rst  $38
    ld   a, a
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_87C7D

label_87C7D::
    nop
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    jp   label_7C
    inc  l
    nop
    nop
    reti
    ld   de, label_26C4
    ld   hl, $0015
    nop
    rst  $38
    ld   b, a
    db   $EC ; Undefined instruction
    ld   [de], a
    and  [hl]
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    ld   [hl], l
    ld   a, h
    rlca
    inc  a
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    rst  $18
    ld   a, [de]
    ld   a, l
    jr   label_87CD5

label_87CD5::
    nop
    rst  $38
    ld   a, a
    xor  [hl]
    ld   a, [hl]
    nop
    ld   a, h
    nop
    nop
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_87CED

label_87CED::
    nop
    ld   l, a
    ld   a, [hl]
    ld   d, d
    ld   e, [hl]
    ld   d, d
    ld   e, [hl]
    rst  $38
    ld   a, a
    ld   l, a
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, a
    ld   a, [hl]
    dec  bc
    ld   c, [hl]
    cp   [hl]
    ld   e, [hl]
    rst  $38
    ld   a, a
    ld   l, a
    ld   a, [hl]
    add  a, [hl]
    dec  e
    dec  bc
    ld   c, [hl]
    cp   [hl]
    ld   e, [hl]
    add  a, e
    ld   c, h
    nop
    nop
    ld   h, $7D
    ld   [hl], c
    ld   a, [hl]
    ld   l, a
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, a
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, a
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    nop
    nop
    cp   $6F
    cp   $6F
    cp   $6F
    nop
    nop
    cp   $6F
    cp   $6F
    cp   $6F
    nop
    nop
    cp   $6F
    cp   $6F
    cp   $6F
    nop
    nop
    rst  $38
    inc  bc
    ld   [hl], e
    ld   [bc], a
    adc  a, $01
    nop
    nop

label_87D68::
    sbc  a, e
    dec  de
    sub  a, b
    ld   b, l
    xor  c
    jr   nc, label_87D6F

label_87D6F::
    nop
    db   $E8 ; add  sp, d
    ld   h, d
    db   $E8 ; add  sp, d
    ld   b, c
    cp   $73
    nop
    nop
    ld   b, $2F
    ld   h, c
    ld   a, [de]
    cp   $73
    nop
    nop
    or   l
    ld   [bc], a
    rst  $28
    dec  d
    cp   $73
    nop
    nop
    sbc  a, a
    ld   d, c
    dec  d
    ld   sp, label_873FE
    nop
    nop
    jp  c, label_D044
    inc  l
    cp   $73
    nop
    nop
    ld   d, [hl]
    ld   h, l
    rst  8
    ld   b, h
    cp   $73
    nop
    nop
    sub  a, b
    ld   [hl], c
    add  hl, bc
    ld   a, l
    cp   $73
    nop
    nop
    ccf
    ld   a, [de]
    sub  a, e
    ld   de, label_873FE
    rst  $38
    ld   b, a
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    rst  $38
    dec  b
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, [hl]
    nop
    nop
    cp   $6F
    cp   $6F
    cp   $6F
    nop
    nop
    cp   $6F
    cp   $6F
    cp   $6F
    nop
    nop
    rst  $38
    inc  bc
    ld   [hl], e
    ld   [bc], a
    adc  a, $01
    nop
    nop
    sbc  a, e
    dec  de
    sub  a, b
    ld   b, l
    xor  c
    jr   nc, label_87DEE
    ld   a, a
    ccf
    ld   hl, label_1417
    nop
    nop
    adc  a, c
    nop
    push bc
    dec  c
    and  b
    inc  e
    nop
    nop
    rst  $38
    ld   a, a
    inc  l
    dec  hl
    ld   d, c
    ld   [$0000], sp
    rst  $38
    ld   a, a
    adc  a, l
    ld   a, l
    and  b
    inc  e
    sbc  a, l
    ld   c, h
    rst  $38
    ld   c, e
    call c, label_8C12
    ld   bc, $0000
    rst  $38
    ld   c, e
    inc  l
    dec  hl
    and  b
    inc  e
    nop
    nop
    rst  $38
    ld   a, a
    ld   e, e
    ld   h, $34
    ld   b, c
    adc  a, l
    ld   a, l
    rst  $38
    ld   a, a
    adc  a, l
    ld   a, l
    and  b
    inc  e
    nop
    nop
    ld   b, b
    ld   a, [hl]
    nop
    nop
    ld   b, d
    ld   b, $FF
    ld   c, [hl]
    ld   b, b
    ld   a, [hl]
    sub  a, h
    ld   e, d
    ld   e, a
    rla
    ld   [$FF7E], a
    ld   b, b
    ld   a, [hl]
    add  a, [hl]
    ld   c, c
    jr   c, label_87EB3
    jr   nz, label_87E6E
    ld   b, b
    ld   a, [hl]
    nop
    nop
    add  hl, sp
    ld   a, [de]
    rst  $38
    ld   c, [hl]
    ld   [hl], l
    ld   a, c
    ld   a, [hl]
    ld   c, e
    or   l
    ld   b, d
    rst  $28
    ld   hl, label_87AF5
    nop
    nop
    or   c
    ld   hl, label_3F5F
    push af
    ld   a, d
    nop
    nop
    or   c
    ld   hl, label_3F5F
    push af
    ld   a, d
    rst  $38
    ld   a, a
    and  l
    nop
    rst  $38
    ld   a, a

label_87E6E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_87EB3::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_87F16::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_87FFF::
    nop
