
label_4000::
    ld   a, [WR1_GameplaySubtype]
    rst  0
    ld   [de], a
    ld   b, b
    ld   b, d
    ld   b, b
    ld   [hl], e
    ld   b, b
    ld   a, a
    ld   b, b
    sbc  a, h
    ld   b, b
    xor  d
    ld   b, b
    dec  h
    ld   e, b
    call label_44D6
    ld   a, [hIsGBC]
    and  a
    jr   z, label_4042
    ld   hl, $DC10
    ld   c, $80
    di
    ld   a, $03
    ld   [rSVBK], a
    ld   a, [$D000]
    and  a
    jr   nz, label_403E

label_402A::
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
    jr   nz, label_402A
    ld   a, $01
    ld   [$D000], a

label_403E::
    xor  a
    ld   [rSVBK], a
    ei

label_4042::
    call label_1D2E
    call label_EFC
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_4072
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a
    call label_44D6
    xor  a
    ld   [$C1BF], a
    ld   [$C14F], a
    ld   [$C1B8], a
    ld   [$C1B9], a
    ld   [$C1B5], a
    ld   a, $0F
    ld   [$D6FE], a

label_4072::
    ret
    ld   a, $0D
    ld   [$D6FE], a
    xor  a
    ld   [$C13F], a
    jp   label_44D6
    ld   a, $0D
    ld   [$D6FF], a
    ld   a, $FF
    ld   [$DB9A], a
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $01
    ld   [$DDD5], a
    jp   label_44D6
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_40A9
    call label_44D6

label_40A9::
    ret
    call label_412A
    ld   a, [$FFCC]
    and  $B0
    jr   z, label_4127
    ld   a, $13
    ld   [$FFF2], a
    ld   a, [$C13F]
    cp   $01
    jr   z, label_40F9
    call label_44D6
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_40D5
    xor  a
    ld   [$C50A], a
    ld   [$C116], a

label_40D5::
    ret
    xor  a
    ld   [$DB98], a
    ld   [$DB99], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   [$DB97], a
    ld   [rBGP], a
    ld   a, [$FF98]
    ld   [$DB9D], a
    ld   a, [$FF99]
    ld   [$DB9E], a
    call label_52A4
    ld   a, $80
    ld   [$DBC7], a
    ret

label_40F9::
    call label_27F2
    call label_5DE6
    call label_29CB
    xor  a
    ld   [$FFF5], a
    ld   a, $01
    ld   [$DBAF], a
    call label_6162
    ld   a, $C7
    ld   [rLCDC], a
    ld   [$D6FD], a
    ld   a, $07
    ld   [rWX], a
    ld   a, $80
    ld   [$DB9A], a
    ld   [rWY], a
    ld   a, $07
    ld   [$FFA9], a
    ld   a, $70
    ld   [$FFAA], a

label_4127::
    ret

label_4128::
    ld   c, b
    ld   e, b

label_412A::
    ld   hl, $C13F
    call label_6BA8
    ld   a, [$FFCC]
    and  $0C
    jr   z, label_413B
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a

label_413B::
    ld   e, [hl]
    ld   d, $00
    ld   hl, label_4128
    add  hl, de
    ld   a, [hl]
    ld   hl, $C018
    ldi  [hl], a
    ld   a, $24
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   [hl], $00
    ret
    ld   a, [$FFB7]
    and  a
    jp   nz, label_41BB
    ld   e, $70

label_4158::
    xor  a
    ld   [rBGP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  e
    jr   nz, label_4158
    ld   e, $30

label_417E::
    ld   a, $40
    ld   [rBGP], a
    dec  e
    jr   nz, label_417E
    ld   e, $30

label_4187::
    ld   a, $80
    ld   [rBGP], a
    dec  e
    jr   nz, label_4187
    ld   e, $FF

label_4190::
    ld   a, $C0
    ld   [rBGP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  e
    jr   nz, label_4190
    ld   e, $30

label_41AB::
    ld   a, $80
    ld   [rBGP], a
    dec  e
    jr   nz, label_41AB
    ld   e, $30

label_41B4::
    ld   a, $40
    ld   [rBGP], a
    dec  e
    jr   nz, label_41B4

label_41BB::
    xor  a
    ld   [$DB97], a
    ld   [rBGP], a
    ret


    db $f0, $9c, $c7, $03, $42, $91, $42, $9b
    db $42, $ca, $42, $d9, $42


label_41CF::
    db $6a, $6a, $6a, $6a, $6a, $6a, $6a, $6a
    db $6a, $6a, $00, $00, $00, $0a, $04, $06
    db $00, $0a, $04, $06, $00, $0a, $04, $06


label_41E7::
    db $1c, $1c, $1c, $1c, $1c, $1c, $1c, $1c
    db $1c, $1c

    dec  de
    ld   a, [de]
    add  hl, de
    jr   label_420D
    ld   d, $15
    inc  d
    inc  de
    ld   [de], a
    db   $11
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $af ; Undefined instruction
    ld   [$C155], a
    ld   [$C156], a
    ld   a, [$FFB7]
    and  a

label_420D::
    jr   nz, label_4259
    ld   a, $10
    ld   [$FFB7], a
    ld   a, $01
    ld   [$FF9C], a
    ld   a, $0F
    ld   [$D6FE], a
    ld   a, $FF
    ld   [$FF9D], a
    ld   a, [$DB57]
    add  a, $01
    daa
    ld   [$DB57], a
    ld   a, [$DB58]
    adc  a, $00
    daa
    ld   [$DB58], a
    cp   $10
    jr   c, label_4240
    ld   a, $99
    ld   [$DB57], a
    ld   a, $09
    ld   [$DB58], a

label_4240::
    xor  a
    ld   [$C1BF], a
    ld   [$D415], a
    ld   [$D47C], a
    ld   [$D47A], a
    ld   [$C3CB], a
    ld   [$C3CC], a
    ld   [$C3CD], a
    ld   [rOBP0], a
    ret

label_4259::
    rra
    rra
    rra
    and  $3F
    ld   e, a
    ld   d, $00
    ld   hl, label_41CF
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    ld   a, [$FFB7]
    rra
    rra
    rra
    and  $1F
    ld   e, a
    ld   hl, label_41E7
    add  hl, de
    ld   a, [hl]
    ld   [$C3CD], a
    ld   a, $01
    ld   [$C3CB], a
    ld   a, $1C
    ld   [$DB98], a
    ld   a, [$DB97]
    ld   [$DB99], a
    ld   e, $08
    call label_8D7
    call label_90F
    ret
    ld   a, $0D
    ld   [$D6FE], a
    ld   hl, $FF9C
    inc  [hl]
    ret
    ld   a, $E4
    ld   [$DB97], a
    ld   a, $0A
    ld   [$D6FF], a
    ld   a, $FF
    ld   [$DB9A], a
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   hl, $FF9C
    inc  [hl]
    call label_905
    call label_2802
    ret
    nop
    cp   $FD
    cp   $00
    ld   [bc], a
    inc  bc
    ld   [bc], a
    nop
    inc  b
    ld   [$100C], sp
    inc  c
    ld   [$F004], sp
    or   a
    and  a
    jr   nz, label_42D8
    ld   hl, $FF9C
    inc  [hl]
    ld   a, $03
    ld   [$D368], a

label_42D8::
    ret
    call label_4339
    ld   a, [$FFCC]
    and  $B0
    jr   z, label_4335
    ld   a, [$C13F]
    cp   $01
    jr   z, label_432C
    cp   $00
    jr   z, label_42F2
    ld   [$DBD1], a
    jr   label_42F5

label_42F2::
    call label_5DE6

label_42F5::
    xor  a
    ld   hl, $C280
    ld   e, $10

label_42FB::
    ldi  [hl], a
    dec  e
    jr   nz, label_42FB
    ld   [$DB98], a
    ld   [$DB99], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   [$DB97], a
    ld   [rBGP], a
    ld   [$D6FB], a
    ld   [$D475], a
    ld   a, [$FF98]
    ld   [$DB9D], a
    ld   a, [$FF99]
    ld   [$DB9E], a
    call label_52A4
    ld   a, $01
    call label_8FA
    ld   a, $80
    ld   [$DBC7], a
    ret

label_432C::
    call label_5DE6
    xor  a
    ld   [$FFF5], a
    call label_6162

label_4335::
    ret

label_4336::
    ld   d, b
    ld   h, b
    ld   [hl], b

label_4339::
    ld   hl, $C13F
    call label_6BA8
    ld   a, [$FFCC]
    and  $08
    jr   z, label_434D
    ld   a, [hl]
    inc  a
    cp   $03
    jr   nz, label_434C
    xor  a

label_434C::
    ld   [hl], a

label_434D::
    ld   a, [$FFCC]
    and  $04
    jr   z, label_435C
    ld   a, [hl]
    dec  a
    cp   $FF
    jr   nz, label_435B
    ld   a, $02

label_435B::
    ld   [hl], a

label_435C::
    ld   e, [hl]
    ld   d, $00
    ld   hl, label_4336
    add  hl, de
    ld   a, [hl]
    ld   hl, $C018
    ldi  [hl], a
    ld   a, $24
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   [hl], $00
    ret
    ld   a, [WR1_GameplaySubtype]
    rst  0
    sub  a, l
    ld   b, e
    dec  hl
    ld   b, h
    or   h
    ld   b, h
    db   $DB
    ld   b, h
    ld   sp, hl
    ld   b, h
    nop
    ld   b, l
    rlca
    ld   b, l
    ld   c, b
    rrca

label_4385::
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_438D

label_438D::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call label_27F2
    call label_44D6
    ld   a, [$0004]
    and  a
    jr   z, label_43A7
    ld   a, $0B
    ld   [$D6FF], a
    ret

label_43A7::
    ld   a, [$DBA5]
    and  a
    jr   z, label_4414
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_43B8
    ld   hl, $DDDA
    jr   label_43C5

label_43B8::
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, $DB16
    add  hl, de

label_43C5::
    ld   de, $DBCC
    ld   c, $05

label_43CA::
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_43DB
    cp   $08
    jr   z, label_43D8
    cp   $0A
    jr   c, label_43DB

label_43D8::
    xor  a
    jr   z, label_43DC

label_43DB::
    ld   a, [hli]

label_43DC::
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_43CA
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_43E9
    ld   a, $0F

label_43E9::
    ld   e, a
    ld   d, $00
    ld   hl, label_4385
    add  hl, de
    ld   a, [hl]
    ld   [$DBB0], a
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_440B
    cp   $08
    jr   z, label_4425
    cp   $0A
    jr   nc, label_4425
    cp   $06
    jr   nz, label_440B
    ld   a, [$FFF9]
    and  a
    jr   nz, label_4425

label_440B::
    call label_5511
    ld   a, $07
    ld   [$D6FF], a
    ret

label_4414::
    ld   a, $02
    ld   [$D6FF], a
    call GetRandomByte
    ld   hl, hFrameCounter
    or   [hl]
    and  $03
    ld   [$FFB9], a
    ret

label_4425::
    ld   a, $09
    ld   [$D6FF], a
    ret
    call label_29C6
    xor  a
    ld   [$C11C], a
    call label_44D6
    ld   a, [$DB9D]
    ld   [$FF98], a
    ld   [$DBB1], a
    ld   a, [$DB9E]
    ld   [$FF99], a
    ld   [$DBB2], a
    ld   a, [$DBC8]
    ld   [$FFA2], a
    and  a
    jr   z, label_4452
    ld   a, $02
    ld   [$C146], a

label_4452::
    ld   a, $04
    ld   [$C125], a
    call label_30F4
    call label_37FE
    call label_5FB3
    ld   a, $FF
    ld   [$FFA6], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_44A6
    ld   d, a
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_4475
    ld   d, $00
    jr   label_447E

label_4475::
    cp   $1A
    jr   nc, label_447E
    cp   $06
    jr   c, label_447E
    inc  d

label_447E::
    ld   a, [$FFF6]
    ld   e, a
    call label_29ED
    cp   $1A
    jr   z, label_4495
    cp   $19
    jr   z, label_4495
    ld   a, [$C18E]
    and  $E0
    cp   $80
    jr   nz, label_44A6

label_4495::
    ld   a, [$DBCD]
    and  a
    jr   z, label_44A6
    ld   a, [$FFF8]
    and  $10
    jr   nz, label_44A6
    ld   a, $0C
    ld   [$D462], a

label_44A6::
    ld   a, [$DBA5]
    and  a
    ld   a, $06
    jr   nz, label_44B0
    ld   a, $07

label_44B0::
    ld   [$D6FE], a
    ret
    ld   a, $0F
    ld   [$FF94], a
    ld   a, [hIsGBC]
    and  a
    jr   z, label_44C9
    di
    ld   a, $03
    ld   [rSVBK], a
    xor  a
    ld   [$D000], a
    ld   [rSVBK], a
    ei

label_44C9::
    call label_D1E
    xor  a
    ld   [$FF90], a
    ld   [$FF91], a
    ld   a, $09
    ld   [$D6FE], a

label_44D6::
    ld   hl, WR1_GameplaySubtype
    inc  [hl]
    ret
    ld   a, $01
    ld   [$D6FE], a
    ld   a, [$D6FA]
    and  a
    jr   z, label_44F5
    ld   a, $05
    ld   [$D6F8], a
    ld   a, [$C1CB]
    and  a
    jr   z, label_44F5
    ld   a, $03
    ld   [$FFA5], a

label_44F5::
    call label_44D6
    ret
    call label_3E3F
    call label_44D6
    ret
    call label_3E5A
    call label_44D6
    ret
    call label_5895
    ld   a, [$FF40]
    or   $20
    ld   [$D6FD], a
    ld   [rLCDC], a
    call label_44D6
    ld   a, [$C11C]
    ld   [$D463], a
    ld   a, $04
    ld   [$C11C], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, [$C3CB]
    and  a
    jr   z, label_4548
    ld   a, [$C5AD]
    ld   [$DB97], a
    ld   a, $1C
    ld   [$DB98], a
    ld   a, $E4
    ld   [$DB99], a
    ld   a, [hIsGBC]
    and  a
    jr   nz, label_4548
    ld   a, $04
    ld   [$C16B], a

label_4548::
    jp   label_27DD
    ld   a, [$FFCC]
    and  $90
    jp   z, label_4666

label_4552::
    ld   [$D47B], a

label_4555::
    call label_27D0
    ld   a, [$A454]
    ld   [$DB80], a
    call label_27D0
    ld   a, [$A455]
    ld   [$DB81], a
    call label_27D0
    ld   a, [$A456]
    ld   [$DB82], a
    call label_27D0
    ld   a, [$A457]
    ld   [$DB83], a
    call label_27D0
    ld   a, [$A458]
    ld   [$DB84], a
    call label_27D0
    ld   a, [$A45F]
    ld   [$DC06], a
    call label_27D0
    ld   a, [$A460]
    ld   [$DC09], a
    call label_27D0
    ld   a, [$A45C]
    ld   [$DC00], a
    call label_27D0
    ld   a, [$A45D]
    ld   [$DC01], a
    call label_27D0
    ld   a, [$A801]
    ld   [$DB85], a
    call label_27D0
    ld   a, [$A802]
    ld   [$DB86], a
    call label_27D0
    ld   a, [$A803]
    ld   [$DB87], a
    call label_27D0
    ld   a, [$A804]
    ld   [$DB88], a
    call label_27D0
    ld   a, [$A805]
    ld   [$DB89], a
    call label_27D0
    ld   a, [$A80C]
    ld   [$DC07], a
    call label_27D0
    ld   a, [$A80D]
    ld   [$DC0A], a
    call label_27D0
    ld   a, [$A809]
    ld   [$DC02], a
    call label_27D0
    ld   a, [$A80A]
    ld   [$DC03], a
    call label_27D0
    ld   a, [$ABAE]
    ld   [$DB8A], a
    call label_27D0
    ld   a, [$ABAF]
    ld   [$DB8B], a
    call label_27D0
    ld   a, [$ABB0]
    ld   [$DB8C], a
    call label_27D0
    ld   a, [$ABB1]
    ld   [$DB8D], a
    call label_27D0
    ld   a, [$ABB2]
    ld   [$DB8E], a
    call label_27D0
    ld   a, [$ABB9]
    ld   [$DC08], a
    call label_27D0
    ld   a, [$ABBA]
    ld   [$DC0B], a
    call label_27D0
    ld   a, [$ABB6]
    ld   [$DC04], a
    call label_27D0
    ld   a, [$ABB7]
    ld   [$DC05], a
    ld   a, GAMEPLAY_FILE_SELECT
    ld   [WR1_GameplayType], a
    xor  a
    ld   [WR1_GameplaySubtype], a
    xor  a
    ld   [$FF97], a
    ld   [$FF96], a
    ld   a, $00
    ld   [$DB97], a
    ld   [$DB98], a
    ld   [$DB99], a
    ld   a, $01
    call label_8FA

label_4666::
    ret

label_4667::
    db 4, 1, 2, 3, 5, 6, 7, 8, 9, $A, $B, $C, 1, 1, 1, 0
    db 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2
    db 1, 1, 1, 1, 3, 1, 1, 1, 1, 4, 1, 1, 1, 1, 5, 1
    db 1, 1, 1, 6, 1, 1, 1, 1, 7, 1, 1, 1, 1, 8, 1, 1
    db 1, 1, 9

label_46AA::
    ld   de, $0000
    call label_4794
    ld   de, $3AD
    call label_4794
    ld   de, $75A
    call label_4794
    ld   a, [$0003]
    and  a
    jp   z, label_4793
    ld   e, $00
    ld   d, $00
    ld   bc, $A405

label_46CA::
    ld   hl, label_4667
    add  hl, de
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    inc  e
    ld   a, e
    cp   $43
    jr   nz, label_46CA
    ld   a, $01
    ld   [$A453], a
    ld   a, $01
    ld   [$A449], a
    ld   a, $02
    ld   [$A448], a
    ld   hl, $A46A
    ld   e, $09
    ld   a, $02

label_46ED::
    ldi  [hl], a
    dec  e
    jr   nz, label_46ED
    ld   a, $60
    ld   [$A452], a
    ld   [$A47D], a
    ld   [$A47C], a
    ld   [$A44A], a
    ld   a, $40
    ld   [$A47B], a
    ld   [$A451], a
    ld   a, $89
    ld   [$A44C], a
    xor  a
    ld   [$A414], a
    ld   a, $07
    ld   [$A44E], a
    ld   a, $05
    ld   [$A462], a
    ld   a, $09
    ld   [$A463], a
    ld   a, $01
    ld   [$A44D], a
    ld   a, $50
    ld   [$A45F], a
    ld   a, $0A
    ld   [$A460], a
    ld   a, [WR1_GameplayType]
    cp   GAMEPLAY_FILE_NEW
    jr   z, label_474E
    ld   a, $5B
    ld   [$A454], a
    ld   a, $46
    ld   [$A455], a
    ld   a, $4D
    ld   [$A456], a
    ld   a, $45
    ld   [$A457], a
    ld   a, $42
    ld   [$A458], a

label_474E::
    xor  a
    ld   [$A45C], a
    ld   [$A45D], a
    ld   [$A45B], a
    ld   [$A464], a
    ld   [$A465], a
    ld   a, $92
    ld   [$A466], a
    ld   a, $48
    ld   [$A467], a
    ld   a, $62
    ld   [$A468], a
    ld   hl, $A105
    ld   a, $80
    ld   e, $00

label_4774::
    ldi  [hl], a
    dec  e
    jr   nz, label_4774
    ld   a, $01
    ld   [$DDDA], a
    ld   [$DDDB], a
    ld   [$DDDC], a
    ld   [$DDDD], a
    ld   [$DDDE], a
    ld   a, $FF
    ld   [$DC0C], a
    ld   a, $0F
    ld   [$DC0D], a

label_4793::
    ret

label_4794::
    ld   c, $01
    ld   b, $05
    ld   hl, $A100
    add  hl, de

label_479C::
    call label_27D0
    ld   a, [hli]
    cp   c
    jr   nz, label_47AA
    inc  c
    inc  c
    dec  b
    jr   nz, label_479C
    jr   label_47CD

label_47AA::
    push de
    ld   hl, $A105
    add  hl, de
    ld   de, label_3A8

label_47B2::
    call label_27D0
    xor  a
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_47B2
    pop  de
    ld   hl, $A100
    add  hl, de
    ld   a, $01

label_47C3::
    call label_27D0
    ldi  [hl], a
    inc  a
    inc  a
    cp   $0B
    jr   c, label_47C3

label_47CD::
    ret
    call label_5DC0
    ld   a, [WR1_GameplaySubtype]
    rst  0
    jp   [hl]
    ld   b, a
    push af
    ld   b, a
    db   $FD ; Undefined instruction
    ld   b, a
    ld   b, $48
    inc  c
    ld   c, b
    ld   c, a
    ld   c, b
    or   e
    ld   c, b
    db   $E8 ; add  sp, d
    ld   c, b
    sub  a, l
    ld   c, c
    inc  b
    ld   c, d
    ld   a, $04
    ld   [$D6FE], a
    xor  a
    ld   [$D000], a
    jp   label_44D6
    ld   a, $08
    ld   [$D6FE], a
    jp   label_44D6
    call label_4DA6
    call label_4DBE
    jp   label_44D6
    call label_4DD6
    jp   label_44D6

label_480C::
    ld   a, [$DBA7]
    and  $01
    jr   z, label_4821
    ld   a, [$DC00]
    ld   h, a
    ld   a, [$DC01]
    ld   l, a
    ld   de, $98E7
    call label_4F45

label_4821::
    ld   a, [$DBA7]
    and  $02
    jr   z, label_4836
    ld   a, [$DC02]
    ld   h, a
    ld   a, [$DC03]
    ld   l, a
    ld   de, $9947
    call label_4F45

label_4836::
    ld   a, [$DBA7]
    and  $04
    jr   z, label_484B
    ld   a, [$DC04]
    ld   h, a
    ld   a, [$DC05]
    ld   l, a
    ld   de, $99A7
    call label_4F45

label_484B::
    jp   label_44D6
    ret
    jp   label_4D6D

label_4852::
    push de
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $10
    ld   [$D600], a
    ld   a, b
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    pop  de
    push de
    ld   a, $05

label_486D::
    ld   [$FFD7], a
    ld   a, [de]
    and  a
    ld   a, $7E
    jr   z, label_4881
    ld   a, [de]
    dec  a
    push bc
    push hl
    ld   c, a
    ld   b, $00
    call label_C25
    pop  hl
    pop  bc

label_4881::
    ldi  [hl], a
    inc  de
    ld   a, [$FFD7]
    dec  a
    jr   nz, label_486D
    ld   a, b
    ldi  [hl], a
    ld   a, c
    sub  a, $20
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    pop  de
    ld   a, $05

label_4894::
    ld   [$FFD7], a
    ld   a, [de]
    and  a
    jr   label_489D
    dec  a
    and  $C0

label_489D::
    ld   a, $7E
    jr   label_48A9
    ld   a, [de]
    and  $80
    ld   a, $C8
    jr   z, label_48A9
    inc  a

label_48A9::
    ldi  [hl], a
    inc  de
    ld   a, [$FFD7]
    dec  a
    jr   nz, label_4894
    xor  a
    ld   [hl], a
    ret
    ld   a, [$D47B]
    and  a
    jr   z, label_48C2
    xor  a
    ld   [$D47B], a
    ld   a, $11
    ld   [$D368], a

label_48C2::
    ld   a, [$DBA7]
    and  a
    ld   a, $03
    jr   z, label_48CC
    ld   a, $04

label_48CC::
    ld   [$D6FF], a
    ld   a, $E4
    ld   [$DB97], a
    ld   a, $1C
    ld   [$DB98], a
    ld   a, $E4
    ld   [$DB99], a
    call label_905
    jp   label_44D6

label_48E4::
    dec  sp
    ld   d, e
    ld   l, e
    add  a, e
    call label_6BA8
    ld   a, [$FFCC]
    and  $90
    jr   z, label_48F4
    jp   label_44D6

label_48F4::
    ld   a, [$FFCC]
    and  $0C
    jr   z, label_4920
    ld   c, $02
    ld   a, [$DBA7]
    and  a
    jr   z, label_4903
    inc  c

label_4903::
    ld   a, [$FFCC]
    bit  2, a
    jr   nz, label_4915
    ld   a, [$DBA6]
    add  a, $01
    inc  c
    cp   c
    jr   c, label_491D
    xor  a
    jr   label_491D

label_4915::
    ld   a, [$DBA6]
    sub  a, $01
    jr   nc, label_491D
    ld   a, c

label_491D::
    ld   [$DBA6], a

label_4920::
    ld   a, [$DBA6]
    cp   $03
    jr   nz, label_4954
    ld   a, [$FFCC]
    and  $03
    jr   z, label_4938
    call label_6BAE
    ld   a, [$D000]
    xor  $01
    ld   [$D000], a

label_4938::
    ld   a, [hFrameCounter]
    and  $10
    jr   nz, label_4954
    ld   a, [$D000]
    and  a
    ld   a, $2C
    jr   z, label_4948
    ld   a, $64

label_4948::
    ld   hl, $C008
    ld   [hl], $88
    inc  hl
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_4954::
    ld   a, [$DBA6]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [hFrameCounter]
    and  $08
    jr   z, label_497B
    ld   a, [hl]
    ld   hl, $C000
    push af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_497B::
    ld   a, [hl]
    ld   hl, $C000
    push af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ld   a, $20
    ld   [hl], a
    ret
    ld   a, [$DBA6]
    cp   $03
    jr   z, label_49DE
    ld   a, [$DBA6]
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   c, $05
    ld   hl, $DB80
    add  hl, de

label_49AE::
    ld   a, [hli]
    and  a
    jr   nz, label_49C3
    dec  c
    jr   nz, label_49AE
    xor  a
    ld   [WR1_GameplaySubtype], a
    ld   a, GAMEPLAY_FILE_NEW
    ld   [WR1_GameplayType], a

label_49BE::
    ld   a, $13
    ld   [$FFF2], a
    ret

label_49C3::
    call label_49BE
    ld   a, $00
    ld   [$DB97], a
    ld   [$DB98], a
    ld   [$DB99], a
    ld   a, $01
    call label_8FA
    ld   a, $05
    ld   [$D6FE], a
    jp   label_44D6

label_49DE::
    xor  a
    ld   [WR1_GameplaySubtype], a
    ld   a, [$D000]
    and  a
    ld   a, $04
    jr   z, label_49EC
    ld   a, GAMEPLAY_FILE_COPY

label_49EC::
    ld   [WR1_GameplayType], a
    jp   label_49BE

label_49F2::
    dec  b
    and  h
    or   d
    and  a
    ld   e, a
    xor  e

label_49F8::
    dec  b
    and  c
    or   d
    and  h
    ld   e, a
    xor  b

label_49FE::
    db 0, $A1, $AD, $A4, $5A, $A8, $C3, $A4, $52

label_4A07::
    ld   a, [WR1_GameplaySubtype]
    rst  0
    ld   de, label_244A
    ld   c, d
    sbc  a, e
    ld   c, d
    call label_44D6
    ld   a, $08
    ld   [$D6FE], a
    xor  a
    ld   [$DBA8], a
    ld   [$DBA9], a
    ld   [$DBAA], a
    ret
    ld   a, $05
    ld   [$D6FF], a
    ld   hl, $D601
    ld   a, $98
    ldi  [hl], a
    ld   a, $49
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ld   a, [$DBA6]
    add  a, $AB
    ldi  [hl], a
    xor  a
    ld   [hl], a
    jp   label_44D6

label_4A3F::
    push hl
    add  hl, bc
    call label_27D0
    ld   [hl], a
    pop  hl
    ret
    ld   bc, label_4667
    ld   e, $43
    push hl

label_4A4D::
    call label_27D0
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    dec  e
    ld   a, e
    and  a
    jr   nz, label_4A4D
    pop  hl
    ld   bc, $004E
    ld   a, $01
    call label_4A3F
    ld   bc, $0044
    call label_4A3F
    ld   bc, $0043
    ld   a, $02
    call label_4A3F
    ld   bc, $004D
    ld   a, $59
    call label_4A3F
    ld   bc, $0077
    call label_4A3F
    ld   bc, $0078
    call label_4A3F
    ld   bc, $0045
    call label_4A3F
    ld   bc, $0076
    ld   a, $39
    call label_4A3F
    ld   bc, $004C
    call label_4A3F
    ret

label_4A98::
    nop
    dec  b
    ld   a, [bc]
    ld   a, [$DBA6]
    ld   e, a
    ld   d, $00
    ld   hl, label_4A98
    add  hl, de
    ld   e, [hl]
    ld   hl, $DB80
    add  hl, de
    ld   e, l
    ld   d, h
    ld   bc, $984A
    call label_4852
    ld   a, [$FFCC]
    and  $80
    jr   z, label_4B29
    call label_49BE
    ld   a, [$DBA6]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F2
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    push hl
    ld   de, $004F
    add  hl, de
    push hl
    ld   a, [$DBA6]
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, $DB80
    add  hl, de
    ld   a, [hli]
    cp   $5B
    jr   nz, label_4AFE
    ld   a, [hli]
    cp   $46
    jr   nz, label_4AFE
    ld   a, [hli]
    cp   $4D
    jr   nz, label_4AFE
    ld   a, [hli]
    cp   $45
    jr   nz, label_4AFE
    ld   a, [hli]
    cp   $42
    jr   nz, label_4AFE
    ld   a, $60
    ld   [$D368], a

label_4AFE::
    ld   hl, $DB80
    add  hl, de
    pop  bc
    ld   e, $05

label_4B05::
    call label_27D0
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    dec  e
    jr   nz, label_4B05
    pop  hl
    push hl
    ld   de, $005A
    add  hl, de
    ld   [hl], $18
    pop  hl
    push hl
    ld   de, $005B
    add  hl, de

label_4B1C::
    ld   [hl], $03
    pop  hl
    ld   de, $0057
    add  hl, de
    xor  a
    ldi  [hl], a
    ld   [hl], a
    jp   label_4555

label_4B29::
    call label_4BF5
    call label_4C8A
    ret

label_4B30::
    jr   c, label_4B6A
    jr   c, label_4B6C
    jr   c, label_4B6E
    jr   c, label_4B70
    jr   c, label_4B72
    jr   c, label_4B74
    jr   c, label_4B76
    jr   c, label_4B78
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   e, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, b

label_4B6A::
    ld   l, b
    ld   l, b

label_4B6C::
    ld   l, b
    ld   l, b

label_4B6E::
    ld   l, b
    ld   l, b

label_4B70::
    inc  d
    inc  e

label_4B72::
    inc  h
    inc  l

label_4B74::
    inc  [hl]
    inc  a

label_4B76::
    ld   b, h
    ld   c, h

label_4B78::
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h
    ld   [hl], h
    ld   a, h
    add  a, h
    adc  a, h
    inc  d
    inc  e
    inc  h
    inc  l
    inc  [hl]
    inc  a
    ld   b, h
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h
    ld   [hl], h
    ld   a, h
    add  a, h
    adc  a, h
    inc  d
    inc  e
    inc  h
    inc  l
    inc  [hl]
    inc  a
    ld   b, h
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h
    ld   [hl], h
    ld   a, h
    add  a, h
    adc  a, h
    inc  d
    inc  e
    inc  h
    inc  l
    inc  [hl]
    inc  a
    ld   b, h
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h
    ld   [hl], h
    ld   a, h
    add  a, h
    adc  a, h

label_4BB0::
    ld   c, h
    ld   d, h
    ld   e, h
    ld   h, h
    ld   l, h

label_4BB5::
    db $42, $43, $44, $45, $46, $47, $48, $00
    db $00, $62, $63, $64, $65, $66, $67, $68
    db $49, $4a, $4b, $4c, $4d, $4e, $4f, $00
    db $00, $69, $6a, $6b, $6c, $6d, $6e, $6f
    db $50, $51, $52, $53, $54, $55, $56, $00
    db $00, $70, $71, $72, $73, $74, $75, $76
    db $57, $58, $59, $5a, $5b, $00, $00, $00
    db $00, $77, $78, $79, $7a, $7b, $00, $00


label_4BF5::
    ld   a, [$FFCC]

label_4BF7::
    ld   [$FFD7], a
    ld   a, [$FFD7]
    and  $0C
    jr   nz, label_4C41
    ld   a, [$FFD7]
    and  $03
    jr   nz, label_4C21
    ld   a, [$FFCB]
    ld   hl, $C182
    and  $0F
    jr   nz, label_4C12
    xor  a
    ld   [hl], a
    jr   label_4C1F

label_4C12::
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $18
    jr   nz, label_4C1F
    ld   [hl], $15
    ld   a, [$FFCB]
    jr   label_4BF7

label_4C1F::
    jr   label_4C63

label_4C21::
    call label_6BAE
    bit  1, a
    jr   nz, label_4C34
    ld   a, [$DBA9]
    add  a, $01
    cp   $40
    jr   c, label_4C5E
    xor  a
    jr   label_4C5E

label_4C34::
    ld   a, [$DBA9]
    sub  a, $01
    cp   $FF
    jr   nz, label_4C5E
    ld   a, $3F
    jr   label_4C5E

label_4C41::
    call label_6BAE
    bit  2, a
    jr   z, label_4C53
    ld   a, [$DBA9]
    sub  a, $10
    jr   nc, label_4C5E
    add  a, $40
    jr   label_4C5E

label_4C53::
    ld   a, [$DBA9]
    add  a, $10
    cp   $40
    jr   c, label_4C5E
    sub  a, $40

label_4C5E::
    ld   [$DBA9], a
    jr   label_4C63

label_4C63::
    ld   a, [$DBA9]
    ld   hl, label_4B70
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   e, [hl]
    ld   a, [$DBA9]
    ld   hl, label_4B30
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   d, [hl]
    ld   hl, $C000
    ld   a, d
    add  a, $0B
    ldi  [hl], a
    ld   a, e
    add  a, $04
    ldi  [hl], a
    ld   a, $E0
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_4C8A::
    ld   a, [$FFCC]
    and  $30
    jr   z, label_4CB7
    bit  5, a
    jr   nz, label_4CA7
    call label_49BE
    call label_4CDA
    ld   a, [$DBAA]
    add  a, $01
    cp   $05
    jr   c, label_4CB4
    ld   a, $04
    jr   label_4CB4

label_4CA7::
    call label_49BE
    ld   a, [$DBAA]
    sub  a, $01
    cp   $FF
    jr   nz, label_4CB4
    xor  a

label_4CB4::
    ld   [$DBAA], a

label_4CB7::
    ld   a, [$DBAA]
    ld   hl, label_4BB0
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   e, [hl]
    ld   a, [hFrameCounter]
    and  $10
    jr   z, label_4CD9
    ld   hl, $C004
    ld   a, $18
    add  a, $0B
    ldi  [hl], a
    ld   a, e
    add  a, $0C
    ldi  [hl], a
    ld   a, $E0
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_4CD9::
    ret

label_4CDA::
    ld   a, [$DBA9]
    ld   c, a
    ld   b, $00
    ld   hl, label_4BB5
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   a, [$DBA6]
    ld   c, a
    sla  a
    sla  a
    add  a, c
    ld   c, a
    ld   hl, $DB80
    add  hl, bc
    ld   a, [$DBAA]
    ld   c, a
    add  hl, bc
    ld   [hl], e
    ret
    call label_5DC0
    ld   a, [WR1_GameplaySubtype]
    rst  0
    ld   a, [de]
    ld   c, l
    inc  l
    ld   c, l
    ld   d, [hl]
    ld   c, l
    ld   h, l
    ld   c, l
    ld   l, l
    ld   c, l
    ld   a, c
    ld   c, l
    add  a, d
    ld   c, l
    adc  a, b
    ld   c, l
    add  hl, sp
    ld   c, l
    ld   c, c
    ld   c, l
    ld   b, $4E
    ld   l, e
    ld   c, [hl]
    ld   a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $01
    call label_8FA
    ld   a, $01
    ld   [$DDD1], a
    jp   label_44D6
    ld   a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $02
    ld   [$DDD1], a
    jp   label_44D6
    ld   a, [hIsGBC]
    and  a
    jr   z, label_4D53
    call label_905
    ld   a, $01
    ld   [$DDD1], a
    jp   label_44D6
    ld   a, [hIsGBC]
    and  a
    jr   z, label_4D53
    ld   a, $02
    ld   [$DDD1], a

label_4D53::
    jp   label_44D6
    ld   a, $08
    ld   [$D6FE], a
    xor  a
    ld   [$DBA6], a
    ld   [$D000], a
    jp   label_44D6
    ld   a, $06
    ld   [$D6FF], a
    jp   label_44D6

label_4D6D::
    call label_4D8B
    call label_4D94
    call label_4D9D

label_4D79::
    jp   label_44D6

label_4D7A::
    call label_4DA6
    call label_4DBE
    jp   label_44D6
    call label_4DD6
    jp   label_44D6
    jp   label_480C

label_4D8B::
    ld   bc, $98C5
    ld   de, $DB80
    jp   label_4852

label_4D94::
    ld   bc, $9925
    ld   de, $DB85
    jp   label_4852

label_4D9D::
    ld   bc, $9985
    ld   de, $DB8A
    jp   label_4852

label_4DA6::
    ld   a, [$DBA7]
    and  $01
    jr   z, label_4DBD
    xor  a
    ld   [$FFDB], a
    ld   a, [$DC06]
    ld   [$FFD9], a
    ld   a, [$DC09]
    ld   [$FFDA], a
    jp   label_5D53

label_4DBD::
    ret

label_4DBE::
    ld   a, [$DBA7]
    and  $02
    jr   z, label_4DBD
    ld   a, $01
    ld   [$FFDB], a
    ld   a, [$DC07]
    ld   [$FFD9], a
    ld   a, [$DC0A]
    ld   [$FFDA], a
    jp   label_5D53

label_4DD6::
    ld   a, [$DBA7]
    and  $04
    jr   z, label_4DBD
    ld   a, $02
    ld   [$FFDB], a
    ld   a, [$DC08]
    ld   [$FFD9], a
    ld   a, [$DC0B]
    ld   [$FFDA], a
    jp   label_5D53

label_4DEE::
    sbc  a, b
    and  l
    ld   b, h
    ld   a, [hl]
    sbc  a, b
    push bc
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    dec  b
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    dec  h
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    ld   h, l
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    add  a, l
    ld   b, h
    ld   a, [hl]
    call label_6BA8
    ld   a, [$FFCC]
    and  $08
    jr   z, label_4E18
    ld   a, [$DBA6]
    inc  a
    and  $03
    ld   [$DBA6], a

label_4E18::
    ld   a, [$FFCC]
    and  $04
    jr   z, label_4E2B
    ld   a, [$DBA6]
    dec  a
    cp   $FF
    jr   nz, label_4E28
    ld   a, $03

label_4E28::
    ld   [$DBA6], a

label_4E2B::
    ld   a, [$FFCC]
    and  $90
    jr   z, label_4E67
    ld   a, [$DBA6]
    cp   $03
    jr   nz, label_4E3B
    jp   label_4555

label_4E3B::
    call label_49BE
    call label_44D6
    jr   label_4E55

label_4E43::
    db $99, $E4, $D, $7E, $7E, $10, $14, 8, $13, $7E, $7E, $7E, $7E, $E, $A, $7E, $7E, $00

label_4E55::
    ld   hl, $D601
    ld   de, label_4E43
    ld   c, $11

label_4E5D::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_4E5D
    ret

label_4E67::
    call label_4954
    ret
    ld   a, [$FFCC]
    bit  5, a
    jr   nz, label_4E9E
    and  $90
    jr   z, label_4ED9
    ld   a, [$D000]
    and  a
    jp   z, label_4555
    call label_49BE
    ld   a, [$DBA6]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F8
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, label_3A8

label_4E91::
    call label_27D0
    xor  a
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_4E91
    jp   label_4555

label_4E9E::
    call label_4EE5
    call label_4EBB
    ld   hl, WR1_GameplaySubtype
    dec  [hl]
    ret

label_4EA9::
    db $99, $E4, $D, $11, 4, $13, $14, $11, $D, $7E, $13, $E, $7E, $C, 4, $D
    db $14, 0

label_4EBB::
    ld   a, [$D600]
    ld   e, a
    add  a, $11
    ld   [$D600], a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    ld   de, label_4EA9
    ld   c, $11

label_4ECF::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_4ECF
    ret

label_4ED9::
    call label_4F0C
    call label_4954
    ld   a, [hFrameCounter]
    and  $10
    jr   z, label_4EEF

label_4EE5::
    ld   a, [$DBA6]
    rst  0
    adc  a, e
    ld   c, l
    sub  a, h
    ld   c, l
    sbc  a, l
    ld   c, l

label_4EEF::
    ld   a, [$DBA6]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, label_4DEE
    add  hl, de
    ld   de, $D601
    ld   c, $08

label_4F03::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_4F03
    xor  a
    ld   [de], a
    ret

label_4F0C::
    ld   a, [$FFCC]
    and  $03
    jr   z, label_4F1D
    call label_6BAE
    ld   a, [$D000]
    xor  $01
    ld   [$D000], a

label_4F1D::
    ld   a, [hFrameCounter]
    and  $10
    jr   nz, label_4F3A
    ld   a, [$D000]
    ld   e, a
    ld   a, $28
    dec  e
    jr   nz, label_4F2E
    ld   a, $6C

label_4F2E::
    ld   hl, $C00C
    ld   [hl], $88
    inc  hl
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    xor  a
    ld   [hl], a

label_4F3A::
    ret

label_4F3B::
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c

label_4F45::
    push hl
    ld   a, [$D600]
    ld   c, a
    add  a, $06
    ld   [$D600], a
    ld   b, $00
    ld   hl, $D601
    add  hl, bc
    ld   a, d
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    pop  bc
    push hl
    ld   a, c
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push hl
    ld   a, b
    and  $F0
    swap a
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push hl
    ld   a, b
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_4F3B
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

    db $fa, $96, $db, $c7, $1a, $4d, $2c, $4d
    db $a6, $4f, $bb, $4f, $c3, $4f, $e1, $4f
    db $39, $4d, $49, $4d, $ff, $4f, $df, $50
    db $e9, $51


    ld   a, $08
    ld   [$D6FE], a
    xor  a
    ld   [$DBA6], a
    ld   [$D000], a
    ld   [$D001], a
    ld   [$D002], a
    jp   label_44D6
    ld   a, $0C
    ld   [$D6FF], a
    jp   label_44D6
    ld   bc, $98C4
    ld   de, $DB80
    call label_4852
    ld   bc, $9924
    ld   de, $DB85
    call label_4852
    ld   bc, $9984
    ld   de, $DB8A
    call label_4852
    jp   label_44D6
    ld   bc, $98CD
    ld   de, $DB80
    call label_4852
    ld   bc, $992D
    ld   de, $DB85
    call label_4852
    ld   bc, $998D
    ld   de, $DB8A
    call label_4852
    jp   label_44D6
    call label_6BA8
    ld   a, [$FFCC]
    and  $08
    jr   z, label_500E
    ld   a, [$D001]
    inc  a
    jr   label_5018

label_500E::
    ld   a, [$FFCC]
    and  $04
    jr   z, label_501D
    ld   a, [$D001]
    dec  a

label_5018::
    and  $03
    ld   [$D001], a

label_501D::
    ld   a, [$FFCC]
    and  $90
    jr   z, label_5055
    ld   a, [$D001]
    cp   $03
    jp   z, label_4555
    ld   hl, $DB80
    ld   b, $00
    ld   a, [$D001]
    and  a
    jr   z, label_5042
    cp   $01
    jr   z, label_503F
    ld   hl, $DB8A
    jr   label_5042

label_503F::
    ld   hl, $DB85

label_5042::
    xor  a
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    inc  hl
    add  a, [hl]
    and  a
    jr   z, label_5055
    call label_44D6
    call label_49BE

label_5055::
    ld   a, [$D001]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [hFrameCounter]
    and  $08
    ld   a, [hl]
    ld   hl, $C000

label_5067::
    jr   z, label_507D
    push af
    ldi  [hl], a
    ld   a, $10
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

label_507D::
    push af
    ldi  [hl], a
    ld   a, $10
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $18
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $20
    ld   [hl], a
    ret

label_5094::
    ld   a, [$D001]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C000
    add  a, $05
    ldi  [hl], a
    ld   a, $14
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

label_50AF::
    sbc  a, b
    and  h
    ld   b, h
    ld   a, [hl]
    sbc  a, b
    call nz, label_7E44
    sbc  a, c
    inc  b
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    inc  h
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    ld   h, h
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    add  a, h
    ld   b, h
    ld   a, [hl]

label_50C7::
    sbc  a, b
    xor  l
    ld   b, h
    ld   a, [hl]
    sbc  a, b
    call label_7E44
    sbc  a, c
    dec  c
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    dec  l
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    ld   l, l
    ld   b, h
    ld   a, [hl]
    sbc  a, c
    adc  a, l
    ld   b, h
    ld   a, [hl]
    call label_6BA8
    ld   a, [$FFCC]
    and  $08
    jr   z, label_50F1
    ld   a, [$D002]
    inc  a
    and  $03
    ld   [$D002], a

label_50F1::
    ld   a, [$FFCC]
    and  $04
    jr   z, label_5104
    ld   a, [$D002]
    dec  a
    cp   $FF
    jr   nz, label_5101
    ld   a, $03

label_5101::
    ld   [$D002], a

label_5104::
    call label_5094
    ld   a, [$FFCC]
    bit  5, a
    jr   z, label_5114
    ld   hl, WR1_GameplaySubtype
    dec  [hl]
    jp   label_514F

label_5114::
    and  $90
    jr   z, label_5129
    ld   a, [$D002]
    cp   $03
    jp   z, label_4555
    call label_49BE
    call label_44D6
    jp   label_4E55

label_5129::
    call label_5175

label_512C::
    ld   a, [hFrameCounter]
    and  $10
    jr   z, label_514F
    ld   a, [$D001]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, label_50AF
    add  hl, de
    ld   de, $D601
    ld   c, $08

label_5146::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5146
    xor  a
    ld   [de], a
    ret

label_514F::
    ld   a, [$D001]
    cp   $01
    jr   z, label_5163
    cp   $02
    jr   z, label_516C
    ld   bc, $98C4
    ld   de, $DB80
    jp   label_4852

label_5163::
    ld   bc, $9924
    ld   de, $DB85
    jp   label_4852

label_516C::
    ld   bc, $9984
    ld   de, $DB8A
    jp   label_4852

label_5175::
    ld   a, [$D002]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [$D002]
    cp   $03
    jp   z, label_51C3
    ld   a, [hFrameCounter]
    and  $08
    jr   z, label_51A8
    ld   a, [hl]
    ld   hl, $C008
    push af
    ldi  [hl], a
    ld   a, $58
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret

label_51A8::
    ld   a, [hl]
    ld   hl, $C008
    push af
    ldi  [hl], a
    ld   a, $58
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    pop  af
    ldi  [hl], a
    ld   a, $60
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $20
    ld   [hl], a
    ret

label_51C3::
    ld   a, [hFrameCounter]
    and  $08
    ld   a, [hl]
    ld   hl, $C008
    jp   label_5067

label_51CE::
    ld   a, [$D002]
    ld   e, a
    ld   d, $00
    ld   hl, label_48E4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C008
    add  a, $05
    ldi  [hl], a
    ld   a, $5C
    ldi  [hl], a
    ld   a, $BE
    ldi  [hl], a
    ld   a, $00
    ld   [hl], a
    ret
    call label_5094
    call label_51CE
    call label_4F0C
    ld   a, [$FFCC]
    and  $90
    jr   z, label_5235
    ld   a, [$D000]
    and  a
    jp   z, label_4555
    call label_49BE
    ld   a, [$D001]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49FE
    add  hl, de
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49FE
    add  hl, de
    ld   a, [hl]
    inc  hl
    ld   h, [hl]
    ld   l, a
    ld   de, label_3AD

label_5224::
    call label_27D0
    ld   a, [bc]
    inc  bc
    call label_27D0
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5224
    jp   label_4555

label_5235::
    ld   a, [$FFCC]
    bit  5, a
    jr   z, label_5249
    ld   hl, WR1_GameplaySubtype
    dec  [hl]
    xor  a
    ld   [$D000], a
    call label_4EBB
    jp   label_526F

label_5249::
    call label_512C
    ld   a, [hFrameCounter]
    and  $10
    jr   z, label_526F
    ld   a, [$D002]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    ld   d, $00
    ld   hl, label_50C7
    add  hl, de
    ld   de, $D609
    ld   c, $08

label_5266::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_5266
    xor  a
    ld   [de], a
    ret

label_526F::
    ld   a, [$D002]
    cp   $01
    jr   z, label_5283
    cp   $02
    jr   z, label_528C
    ld   bc, $98CD
    ld   de, $DB80
    jp   label_4852

label_5283::
    ld   bc, $992D
    ld   de, $DB85
    jp   label_4852

label_528C::
    ld   bc, $998D
    ld   de, $DB8A
    jp   label_4852

label_5295::
    db $18, $18, $18, $18, $18, $18, $28, $28, $28, $28, $38, $38, $38, $38, $50

label_52A4::
    xor  a
    ld   [$FFF9], a
    ld   a, [$DB5A]
    and  a
    jr   nz, label_52BB
    ld   a, [$DB5B]
    ld   e, a

label_52B1::
    ld   d, $00

label_52B3::
    ld   hl, label_5295
    add  hl, de
    ld   a, [hl]
    ld   [$DB5A], a

label_52BB::
    ld   hl, $DBD1
    ld   a, [hl]
    ld   [hl], $00
    and  a
    jr   nz, label_531D
    ld   a, [$DBA6]

label_52C7::
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F8
    add  hl, de
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    ld   hl, $D800
    ld   de, data_380

label_52D9::
    call label_27D0
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_52D9
    ld   hl, $DDDA
    ld   de, $0005

label_52EA::
    call label_27D0
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_52EA
    ld   hl, $DDE0
    ld   de, $0020

label_52FB::
    call label_27D0
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_52FB
    call label_27D0
    ld   a, [bc]
    ld   [$DC0F], a
    inc  bc
    call label_27D0
    ld   a, [bc]
    ld   [$DC0C], a
    inc  bc
    call label_27D0
    ld   a, [bc]
    ld   [$DC0D], a

label_531D::
    ld   a, GAMEPLAY_OVERWORLD
    ld   [WR1_GameplayType], a
    xor  a
    ld   [WR1_GameplaySubtype], a
    xor  a
    ld   [$C11C], a
    ld   [$FF9C], a
    ld   [$DB93], a
    ld   [$DB94], a
    ld   [$DB90], a
    ld   [$DB8F], a
    ld   [$DB92], a
    ld   [$DB91], a
    ld   a, [$DB6F]
    and  a
    jr   nz, label_5353
    ld   a, $16
    ld   [$DB6F], a
    ld   a, $50
    ld   [$DB70], a
    ld   a, $27
    ld   [$DB71], a

label_5353::
    ld   a, [$DB62]
    and  a
    jr   z, label_5394
    ld   [$DB9D], a
    ld   a, [$DB63]
    ld   [$DB9E], a
    ld   a, [$DB61]
    ld   [$FFF6], a
    ld   [$DB9C], a
    ld   a, [$DB60]
    ld   [$FFF7], a
    ld   a, [$DB64]
    ld   [$DBAE], a
    xor  a
    ld   [$FFF9], a
    ld   a, $03
    ld   [$FF9E], a
    ld   a, [$DB5F]
    and  $01
    ld   [$DBA5], a
    jr   z, label_538E
    ld   a, $04
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FF9E], a

label_538E::
    ld   a, $02
    ld   [$D6FF], a
    ret

label_5394::
    ld   a, $30
    ld   [$DB78], a
    ld   a, $30
    ld   [$DB77], a
    ld   a, $20
    ld   [$DB76], a
    ld   a, $A3
    ld   [$DB9C], a
    ld   [$FFF6], a
    ld   [$DB54], a
    ld   a, $01
    ld   [$DBA5], a
    ld   a, $10
    ld   [$FFF7], a
    ld   a, $50
    ld   [$DB9D], a
    ld   a, $60
    ld   [$DB9E], a
    xor  a
    ld   [$FF9D], a
    ld   a, $03
    ld   [$FF9E], a
    ld   a, $16
    ld   [$DB6F], a
    ld   a, $50
    ld   [$DB70], a
    ld   a, $27
    ld   [$DB71], a
    jr   label_538E

label_53D8::
    sbc  a, l
    sbc  a, l
    sbc  a, l
    rst  $38
    sbc  a, l
    sbc  a, l
    sbc  a, l
    rst  $38
    sbc  a, l
    sbc  a, l
    sbc  a, h
    rst  $38
    sbc  a, l
    sbc  a, l
    sbc  a, h
    rst  $38

label_53E8::
    ldd  [hl], a
    ldd  [hl], a
    add  hl, bc
    rst  $38
    ld   l, $2E
    add  hl, bc
    rst  $38
    adc  a, d
    ldd  [hl], a
    jp   [hl]
    rst  $38
    adc  a, d
    ld   l, $E9
    rst  $38

label_53F8::
    ret  z
    ret  z
    nop
    rst  $38
    ret  z
    ret  z
    nop
    rst  $38
    ld   c, b
    ret  z
    nop
    rst  $38
    ld   c, b
    ret  z
    nop
    rst  $38

label_5408::
    ld   a, a
    ld   a, a
    cp   d
    rst  $38
    ld   a, a
    ld   a, a
    cp   d
    rst  $38
    ld   a, a
    ld   a, a
    cp   d
    rst  $38
    ld   a, a
    ld   a, a
    cp   d
    rst  $38

label_5418::
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    sbc  a, l
    sbc  a, l
    rst  $38
    nop
    sbc  a, l
    sbc  a, l
    sbc  a, l
    rst  $38
    sbc  a, l
    sbc  a, h
    rst  $38
    nop
    sbc  a, l
    sbc  a, h
    sbc  a, h
    rst  $38
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    rst  $38
    nop
    nop
    nop
    nop
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    rst  $38
    nop
    nop
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    sbc  a, l
    sbc  a, l
    sbc  a, h
    sbc  a, h
    sbc  a, h
    sbc  a, h
    rst  $38

label_545C::
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    dec  c
    ld   [de], a
    rst  $38
    nop
    dec  c
    ld   de, rNR12
    sub  a, d
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    sub  a, d
    pop  af
    db   $F2 ; Undefined instruction
    rst  $38
    adc  a, l
    sub  a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, l
    sub  a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    pop  af
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    nop
    nop
    nop
    adc  a, l
    sub  a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    sub  a, c
    sub  a, d
    pop  af
    db   $F2 ; Undefined instruction
    rst  $38
    nop
    nop
    adc  a, l
    sub  a, d
    db   $ED ; Undefined instruction
    db   $F2 ; Undefined instruction
    sub  a, c
    sub  a, d
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    pop  af
    db   $F2 ; Undefined instruction
    rst  $38

label_54A0::
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    db   $E8 ; add  sp, d
    jp   [hl]
    rst  $38
    nop
    db   $E8 ; add  sp, d
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    rst  $38
    db   $E8 ; add  sp, d
    jp   [hl]
    rst  $38
    nop
    db   $E8 ; add  sp, d
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    rst  $38
    db   $E8 ; add  sp, d
    ld   [$EBE9], a
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    db   $E8 ; add  sp, d
    ld   [$EBE9], a
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    rst  $38
    nop
    nop
    nop
    nop
    db   $E8 ; add  sp, d
    ld   [$EBE9], a
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    db   $EC ; Undefined instruction
    jp   [hl]
    rst  $38
    nop
    nop
    db   $E8 ; add  sp, d
    ld   [$EBE9], a
    db   $EC ; Undefined instruction
    db   $E8 ; add  sp, d
    db   $EC ; Undefined instruction
    ld   [$E9EC], a
    rst  $38

label_54E4::
    sbc  a, l
    sbc  a, h

label_54E6::
    db $A, $EA

label_54E8::
    db $9C, $E9, $49, $7F, $9D, 9, $49, $7F, $9D, $29, $49, $7F, $9D, $49, $49, $7F
    db $9D, $69, $49, $7F, $9D, $89, $49, $7F, $9D, $A9, $49, $7F, $9D, $C9, $49, $7F
    db $9D, $E9, $49, $7F, $9E, 9, $49, $7F, 0

label_5511::
    ld   hl, label_54E8
    ld   de, $D650
    ld   c, $29

label_5519::
    ld   a, [hli]
    inc  de
    ld   [de], a
    dec  c
    jr   nz, label_5519
    push de
    xor  a
    ld   [$FFD7], a
    ld   [$FFD8], a
    ld   [$FFD9], a
    ld   [$FFDA], a
    ld   c, a
    ld   b, a
    ld   e, a
    ld   d, a
    ld   a, [$DBB0]
    swap a
    and  $03
    ld   e, a
    and  a
    jr   z, label_5543

label_5538::
    ld   a, c
    add  a, $04
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, label_5538
    ld   b, $00

label_5543::
    pop  hl

label_5544::
    push hl
    ld   hl, label_53D8
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, label_53E8
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    ld   hl, label_53F8
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD9], a
    ld   hl, label_5408
    add  hl, bc
    ld   a, [hl]
    ld   [$FFDA], a
    pop  hl
    call label_5619
    push hl
    ld   hl, label_53D8
    inc  bc
    add  hl, bc
    ld   a, [hl]
    pop  hl
    inc  hl
    cp   $FF
    jr   nz, label_5544
    xor  a
    ld   [hl], a
    xor  a
    ld   [$FFD7], a
    ld   [$FFD8], a
    ld   [$FFD9], a
    ld   [$FFDA], a
    ld   c, a
    ld   b, a
    ld   e, a
    ld   d, a
    ld   a, [$DBB0]
    swap a
    and  $03
    ld   e, a
    and  a
    jr   z, label_55EA

label_558C::
    ld   b, $00
    ld   a, c
    add  a, $08
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, label_558C
    ld   a, [$DBB0]
    and  $03
    jr   z, label_55C0
    ld   a, [$DBB0]
    and  $30
    cp   $30
    jr   z, label_55AF
    ld   a, c
    add  a, $04
    ld   c, a
    ld   b, $00
    jr   label_55C0

label_55AF::
    ld   a, [$DBB0]
    and  $03
    ld   e, a

label_55B5::
    ld   b, $00
    ld   a, c
    add  a, $0B
    ld   c, a
    dec  e
    ld   a, e
    and  a
    jr   nz, label_55B5

label_55C0::
    push hl
    ld   hl, label_5418
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, label_545C
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    xor  a
    ld   [$FFD9], a
    ld   hl, label_54A0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFDA], a
    pop  hl
    call label_5619
    push hl
    ld   hl, label_5418
    inc  bc
    add  hl, bc
    ld   a, [hl]
    pop  hl
    inc  hl
    cp   $FF
    jr   nz, label_55C0

label_55EA::
    xor  a
    ld   b, a
    ld   c, a
    ld   a, [$DBB0]
    bit  5, a
    jr   z, label_55F5
    inc  bc

label_55F5::
    push hl
    ld   hl, label_54E4
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, label_54E6

label_5600::
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    ld   a, $01
    ld   [$FFD9], a
    ld   a, [$FFF7]
    add  a, $B1
    ld   [$FFDA], a
    pop  hl
    call label_5619
    inc  hl
    ld   a, $7F
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_5619::
    ld   a, [$FFD7]
    ldi  [hl], a
    ld   a, [$FFD8]
    ldi  [hl], a
    ld   a, [$FFD9]
    ldi  [hl], a
    ld   a, [$FFDA]
    ld   [hl], a
    ret
    xor  a
    ld   [$C3C0], a
    ld   a, [WR1_GameplaySubtype]
    cp   $05
    jr   z, label_5639
    xor  a
    ld   [$FFCB], a
    ld   [$FFCC], a
    ld   a, [WR1_GameplaySubtype]

label_5639::
    rst  0
    ld   c, b
    ld   d, [hl]
    ld   a, b
    ld   d, [hl]
    db   $F4 ; Undefined instruction
    ld   d, [hl]
    db   $FD ; Undefined instruction
    ld   d, [hl]
    dec  bc
    ld   d, a
    inc  e
    ld   d, a
    dec  h
    ld   e, b
    call label_44D6
    ld   a, [hIsGBC]
    and  a
    jr   z, label_5678
    ld   hl, $DC10
    ld   c, $80
    di
    ld   a, $03
    ld   [rSVBK], a
    ld   a, [$D000]
    and  a
    jr   nz, label_5674

label_5660::
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
    jr   nz, label_5660
    ld   a, $01
    ld   [$D000], a

label_5674::
    xor  a
    ld   [rSVBK], a
    ei

label_5678::
    call label_1D2E
    call label_EFC
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_56F3
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a
    call label_44D6
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$FF96], a
    ld   [$C1BF], a
    ld   [$FF97], a
    ld   [$C14F], a
    ld   [$C1B2], a
    ld   [$C1B3], a
    ld   a, [$DB54]
    ld   [$DBB4], a
    ld   e, a
    ld   d, $00
    ld   hl, label_5959
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_56D9
    swap a
    and  $07
    inc  a
    cp   $01
    jr   nz, label_56D9
    ld   a, [$C5A2]
    and  a
    ld   a, $00
    jr   nz, label_56D9
    ld   hl, $D800
    add  hl, de
    ld   a, [hl]
    and  $20
    ld   a, $00
    jr   z, label_56D9
    ld   a, $01

label_56D9::
    ld   [$C1B1], a
    ld   a, [$DBB4]
    ld   [$C1B4], a
    ld   a, [$FF40]
    and  $DF
    ld   [$D6FD], a
    ld   [rLCDC], a
    call label_5888
    ld   a, $08
    ld   [$D6FF], a

label_56F3::
    ret
    ld   a, $0B
    ld   [$D6FE], a
    call label_44D6
    ret
    ld   a, $0E
    ld   [$D6FE], a
    ld   a, $01
    ld   [$DDD5], a
    call label_44D6
    ret
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_571B
    call label_44D6
    call label_49BE

label_571B::
    ret
    ld   a, [$0005]
    and  a
    jr   z, label_5731
    ld   a, [$FFCC]
    bit  7, a
    jr   z, label_5731
    xor  a
    ld   [WR1_GameplaySubtype], a
    inc  a
    ld   [WR1_GameplayType], a
    ret

label_5731::
    ld   a, [$C19F]
    and  a
    jp   nz, label_5818
    ld   a, [$FFCC]
    and  $10
    jr   z, label_57B7
    ld   a, [$DBB4]
    ld   e, a
    ld   d, $00
    ld   hl, label_5959
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_576F
    ld   e, a
    and  $F0
    jr   nz, label_5766
    ld   a, [$C5A2]
    and  a
    jr   nz, label_576F
    push de
    ld   a, [$DBB4]
    ld   e, a
    ld   hl, $D800
    add  hl, de
    pop  de
    ld   a, [hl]
    and  $20
    jr   z, label_576F

label_5766::
    ld   d, $00
    ld   hl, label_5909
    add  hl, de
    ld   a, [hl]
    jr   label_5792

label_576F::
    ld   a, [$DBB4]
    cp   $24
    jr   z, label_577A
    cp   $34
    jr   nz, label_577E

label_577A::
    ld   a, $76
    jr   label_5792

label_577E::
    rra
    and  $07
    ld   e, a
    ld   a, [$DBB4]
    rra
    rra
    and  $38
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, label_58C9
    add  hl, de
    ld   a, [hl]

label_5792::
    call label_2385
    ld   a, [$C173]
    cp   $A7
    jr   z, label_57A3
    ld   a, [$DBB4]
    cp   $37
    jr   nz, label_57A8

label_57A3::
    ld   a, $01
    ld   [$C112], a

label_57A8::
    ld   a, [$DBB4]
    cp   $70
    ld   a, $01
    jr   nc, label_57B3
    ld   a, $81

label_57B3::
    ld   [$C19F], a
    ret

label_57B7::
    ld   a, [$0003]
    and  a
    jr   z, label_57FA
    ld   a, [$FFCB]
    cp   $60
    jr   nz, label_57FA
    ld   a, GAMEPLAY_OVERWORLD
    ld   [WR1_GameplayType], a
    call label_C7D
    ld   a, $00
    ld   [$D401], a
    ld   [$D402], a
    ld   a, [$DBB4]
    ld   [$D403], a
    ld   a, $48
    ld   [$D404], a
    ld   a, $52
    ld   [$D405], a
    ld   a, [$FF98]
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FF99]
    sub  a, $08
    and  $F0
    or   e
    ld   [$D416], a
    ld   a, $07
    ld   [WR1_GameplaySubtype], a
    ret

label_57FA::
    ld   e, $40
    ld   a, [$0003]
    and  a
    jr   nz, label_5804
    ld   e, $60

label_5804::
    ld   a, [$FFCC]
    and  e
    jr   z, label_5818
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $01
    ld   [$DDD5], a
    call label_44D6

label_5818::
    call label_58A8
    call label_5A71
    call label_5C49
    ret
    call label_6A7C
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_58A7
    ld   a, [hIsGBC]
    and  a
    jr   z, label_5854
    ld   hl, $DC10
    ld   c, $80
    di

label_583A::
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
    jr   nz, label_583A
    ld   a, $03
    ld   [rSVBK], a
    xor  a
    ld   [$D000], a
    ld   [rSVBK], a
    ei

label_5854::
    ld   a, $01
    ld   [$DDD5], a
    xor  a
    ld   [$C50A], a
    ld   [$C116], a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$C167], a
    ld   a, $07
    ld   [$FFA9], a
    ld   a, $70
    ld   [$FFAA], a
    ld   a, GAMEPLAY_OVERWORLD
    ld   [WR1_GameplayType], a
    ld   [$FFBC], a
    ld   a, $02
    ld   [WR1_GameplaySubtype], a
    ld   a, [$DBA5]
    and  a
    ld   a, $06
    jr   nz, label_5885
    ld   a, $07

label_5885::
    ld   [$D6FE], a

label_5888::
    ld   hl, $C124
    ld   e, $00

label_588D::
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $0C
    jr   nz, label_588D

label_5895::
    ld   a, $80
    ld   [$DB9A], a
    ld   a, $07
    ld   [rWX], a
    ld   a, $08
    ld   [$C150], a
    xor  a
    ld   [$C14F], a

label_58A7::
    ret

label_58A8::
    ld   hl, $C09C
    ld   a, [$DB54]
    rra
    and  $78
    add  a, $18
    ldi  [hl], a
    ld   a, [$DB54]
    swap a
    rra
    and  $78
    add  a, $18
    ldi  [hl], a
    ld   [hl], $3E
    inc  hl
    ld   a, [hFrameCounter]
    rla
    and  $10
    ld   [hl], a
    ret

label_58C9::
    db $6C, $6C, $6C, $6B, $6C, $6C, $6C, $6C, $76, $76, $79, $79, $79, $79, $79, $79
    db $6A, $6A, $72, $7A, $78, $78, $71, $71, $6A, $6A, $72, $70, $78, $78, $71, $71
    db $6A, $6E, $69, $69, $69, $69, $77, $71, $6E, $6E, $69, $69, $69, $69, $77, $77
    db $7B, $7B, $6D, $62, $74, $74, $6F, $68, $73, $73, $73, $74, $74, $74, $75, $68

label_5909::
    db 0, $D9, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD
    db 0, $56, $57, $58, $59, $5A, $5B, $5C, $5D, 0, 0, 0, 0, 0, 0, 0
    db 0, $7C, $67, 0, 0, $80, $65, 0, $64, $88, $7D, 0, 0, 0, 0, 0
    db 0, $5E, $5F, $7F, $7E, $7D, $82, $84, $85, $86, $87, $81, $66, $A7, $5E, $63
    db 0, $61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

label_5959::
    db 0, 0, 0, 0, 0, 0, $3E, 0, $E, 0, $39, 0, 0, 0, $17, 0
    db $18, $3D, 0, 0, 0, 0, 6, $C, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, $12, 0, 0, 0, 7, 0, 0, $14, 0, 0, 0, 0
    db $33, $3D, 0, 0, 0, 0, 5, $2A, 0, 0, 0, 0, 0, 0, 0, $29
    db 0, 3, 0, 0, 0, $25, 0, 0, 0, 0, 0, $3D, 0, 0, 0

label_59A8::
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, $D, $22, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 2, $21, $3B, $36, 0, 0, 0, 0, $3D, 0, $37, 0, $16, 0, 0
    db 0, 0, 0, 0, $26, 0, 0, 0, 0, 0, 0, 0, 9, $B, 9, 0
    db 0, 0, $35, $3C, 0, $3D, 0, 0, 0, 0, 0, 0, 0, $A, 0, 0
    db 0, $3A, $34, $3D, $28, 0

label_5A0E::
    db $13, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, $11, 0
    db 0, $38, 0

label_5A31::
    db 0, $15, 0, $3D, 0, 0, 0, 0, 0, 0, 0, $41, 0, 0, 0, 0
    db $3D, 0, 0, 0, 0, 0, 8, 0, 0, 0, 1, 0, 0, 0, $3F, 0
    db 0, 0, 0, 0, 0, 0, 0, 0

label_5A59::
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, label_5959
    add  hl, de
    ld   e, [hl]
    ld   hl, label_5909
    add  hl, de
    ld   a, [hl]
    jp   label_2385

label_5A6B::
    db 0, 1, $FF

label_5A6E::
    db 0, $F0, $10

label_5A71::
    ld   a, [$DBB4]
    ld   [$FFD7], a
    ld   a, [$C1B3]
    ld   hl, $C1B2
    or   [hl]
    ld   hl, $C19F
    or   [hl]
    jp   nz, label_5B3F
    ld   a, [$FFCB]
    ld   c, a
    ld   hl, $C182
    and  $0F
    jr   nz, label_5A92
    xor  a
    ld   [hl], a
    jr   label_5A9D

label_5A92::
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $18
    jr   nz, label_5A9D
    ld   [hl], $15
    jr   label_5AA0

label_5A9D::
    ld   a, [$FFCC]
    ld   c, a

label_5AA0::
    ld   a, c
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_5A6B
    add  hl, de
    ld   a, [$DBB4]
    ld   d, a
    and  $F0
    ld   e, a
    ld   a, d
    add  a, [hl]
    and  $0F
    or   e
    ld   [$DBB4], a
    ld   a, c
    rra
    rra
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_5A6E
    add  hl, de
    ld   a, [$DBB4]
    add  a, [hl]
    ld   hl, $FFD7
    ld   [$DBB4], a
    cp   [hl]
    jr   z, label_5B3F
    ld   e, a
    ld   d, $00
    ld   hl, $D800
    add  hl, de
    ld   a, [$C5A2]
    and  a
    jr   nz, label_5AF5
    ld   a, [hl]
    and  $FF
    jr   nz, label_5AF5
    ld   a, [$C17B]
    and  a
    jr   nz, label_5AF5
    ld   a, $09
    ld   [$FFF2], a
    ld   a, [$FFD7]
    ld   [$DBB4], a
    jr   label_5B3F

label_5AF5::
    call label_6BAE
    ld   hl, label_5959
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_5B30
    swap a
    and  $07
    inc  a
    ld   c, a
    cp   $01
    jr   nz, label_5B19
    ld   a, [$C5A2]
    and  a
    jr   nz, label_5B30
    ld   hl, $D800
    add  hl, de
    ld   a, [hl]
    and  $20
    jr   z, label_5B30

label_5B19::
    ld   a, [$C1B1]
    and  a
    jr   nz, label_5B24
    ld   a, $10
    ld   [$C1B2], a

label_5B24::
    ld   a, c
    ld   [$C1B1], a
    ld   a, [$DBB4]
    ld   [$C1B4], a
    jr   label_5B3F

label_5B30::
    ld   a, [$C1B1]
    and  a
    jr   z, label_5B3F
    xor  a
    ld   [$C1B1], a
    ld   a, $10
    ld   [$C1B3], a

label_5B3F::
    ld   hl, $C080
    ld   a, [$DBB4]
    rra
    and  $78
    add  a, $14
    ld   e, a
    ld   a, [$DBB4]
    swap a
    rra
    and  $78
    add  a, $14
    ld   d, a
    ld   a, e
    ldi  [hl], a
    ld   a, d
    ldi  [hl], a
    ld   [hl], $F0
    inc  hl
    ld   [hl], $00
    inc  hl
    ld   a, e
    ldi  [hl], a
    ld   a, d
    add  a, $08
    ldi  [hl], a
    ld   [hl], $F0
    inc  hl
    ld   [hl], $20
    ld   a, [hFrameCounter]
    and  $10
    jr   nz, label_5BAC
    ld   hl, $C088
    ld   a, e
    add  a, $04
    ldi  [hl], a
    ld   a, d
    add  a, $F6
    ldi  [hl], a
    ld   a, $F6
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, e
    add  a, $04
    ldi  [hl], a
    ld   a, d
    add  a, $13
    ldi  [hl], a
    ld   a, $F6
    ldi  [hl], a
    ld   a, $20
    ldi  [hl], a
    ld   a, e
    add  a, $F6
    ldi  [hl], a
    ld   a, d
    add  a, $04
    ldi  [hl], a
    ld   a, $F8
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, e
    add  a, $0B
    ldi  [hl], a
    ld   a, d
    add  a, $04
    ldi  [hl], a
    ld   a, $F8
    ldi  [hl], a
    ld   a, $40
    ldi  [hl], a

label_5BAC::
    ret

label_5BAD::
    db $F8, $F8, $F2, 4, $F8, 0, $F4, 4, $F8, 8, $F4, $24, $F8, $10, $F2, $24
    db 8, $F8, $F2, $44, 8, 0, $F4, $44, 8, 8, $F4, $64, 8, $10, $F2, $64
    db $FA, $FA, $F2, 4, $FA, 2, $F4, 4, $FA, 6, $F4, $24, $FA, $E, $F2, $24
    db 6, $FA, $F2, $44, 6, 2, $F4, $44, 6, 6, $F4, $64, 6, $E, $F2, $64
    db $FC, $FC, $F2, 4, $FC, 4, $F4, 4, $FC, 4, $F4, $24, $FC, $C, $F2, $24
    db 4, $FC, $F2, $44, 4, 4, $F4, $44, 4, 4, $F4, $64, 4, $C, $F2, $64
    db $FE, $FE, $F2, 4, $FE, 4, $F4, 4, $FE, 4, $F4, $24, $FE, $A, $F2, $24
    db 2, $FE, $F2, $44, 2, 4, $F4, $44, 2, 4, $F4, $64, 2, $A, $F2, $64

label_5C2D::
    db $20, 1, $22

label_5C30::
    db 1, $24, 6, $26, 6, $28, 7, $2A, 7, $2C, 5, $2E, 5, $2C

label_5C3E::
    db 5, $2E, 5

label_5C41::
    db $28, $78, $28, $78

label_5C45::
    db $28, $28, $78, $78

label_5C49::
    ld   a, [$C340]
    push af
    call label_5C55
    pop  af
    ld   [$C340], a
    ret

label_5C55::
    ld   a, [$C1B3]
    and  a
    jr   z, label_5C62
    dec  a
    ld   [$C1B3], a
    cpl
    jr   label_5C6C

label_5C62::
    ld   a, [$C1B2]
    and  a
    jr   z, label_5C72
    dec  a
    ld   [$C1B2], a

label_5C6C::
    rra
    rra
    and  $03
    jr   label_5C7B

label_5C72::
    ld   a, [$C1B1]
    and  a
    jp   z, label_5D13
    ld   a, $00

label_5C7B::
    ld   [$C1B0], a
    ld   [$FFF1], a
    ld   a, $00
    ld   [$C3C0], a
    ld   a, $08
    ld   [$C340], a
    ld   a, $00
    ld   [$C123], a
    ld   [$FFED], a
    ld   e, $00
    ld   a, [$C1B4]
    cp   $70
    jr   c, label_5C9C
    ld   e, $02

label_5C9C::
    and  $0F
    cp   $08
    jr   nc, label_5CA3
    inc  e

label_5CA3::
    ld   d, $00
    ld   hl, label_5C41
    add  hl, de
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, label_5C45
    add  hl, de
    ld   a, [hl]
    ld   [$FFEC], a
    ld   a, [$C1B0]
    rla
    rla
    rla
    rla
    rla

label_5CBB::
    and  $E0

label_5CBD::
    ld   e, a
    ld   d, $00
    ld   hl, label_5BAD
    add  hl, de
    ld   a, $08
    ld   [$C3C0], a
    xor  a
    ld   [$FFF5], a
    ld   c, $08
    call label_3CE6
    ld   a, [$C1B0]
    cp   $00
    jr   nz, label_5D13
    ld   a, [$C1B1]
    dec  a
    cp   $80
    jr   nc, label_5D13
    ld   [$FFF1], a
    ld   de, $C030
    ld   a, [$FFEC]
    ld   [de], a
    inc  de
    ld   a, [$FFEE]
    ld   [de], a
    inc  de
    ld   a, [$FFF1]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, label_5C2D
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [$FFEC]
    ld   [de], a
    inc  de
    ld   a, [$FFEE]
    add  a, $08
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hl]
    ld   [de], a

label_5D13::
    ret

label_5D14::
    sbc  a, b
    rlc  [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, b
    db   $EB ; Undefined instruction
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    nop

label_5D29::
    sbc  a, c
    dec  hl
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, c
    ld   c, e
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    nop

label_5D3E::
    sbc  a, c
    adc  a, e
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    sbc  a, c
    xor  e
    ld   b, $7E
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    nop

label_5D53::
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    add  a, $14
    ld   [$D600], a
    ld   hl, $D601
    add  hl, de
    push de
    ld   bc, label_5D14
    ld   a, [$FFDB]
    and  a
    jr   z, label_5D75
    ld   bc, label_5D29
    cp   $01
    jr   z, label_5D75
    ld   bc, label_5D3E

label_5D75::
    ld   e, $15

label_5D77::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_5D77
    pop  de
    ld   hl, $D604
    add  hl, de
    ld   c, $00
    ld   a, [$FFD9]
    and  a
    jr   z, label_5DAB
    ld   [$FFD7], a

label_5D8B::
    ld   a, [$FFD7]
    sub  a, $08
    ld   [$FFD7], a
    jr   c, label_5DA2
    ld   a, $AE
    ldi  [hl], a
    inc  c
    ld   a, c
    cp   $07
    jr   nz, label_5DA0
    ld   a, l
    add  a, $03
    ld   l, a

label_5DA0::
    jr   label_5D8B

label_5DA2::
    add  a, $08
    jr   z, label_5DAB
    ld   a, $AE
    ldi  [hl], a
    jr   label_5DB3

label_5DAB::
    ld   a, [$FFDA]
    cp   c
    jr   z, label_5DBF
    ld   a, $AE
    ldi  [hl], a

label_5DB3::
    inc  c
    ld   a, c
    cp   $07
    jr   nz, label_5DBD
    ld   a, l
    add  a, $03
    ld   l, a

label_5DBD::
    jr   label_5DAB

label_5DBF::
    ret

label_5DC0::
    xor  a
    ld   de, $DBA7
    ld   [de], a
    ld   b, $01
    ld   c, $00
    ld   hl, $DB80

label_5DCC::
    ld   a, [hli]
    and  a
    jr   z, label_5DD3
    ld   a, [de]
    or   b
    ld   [de], a

label_5DD3::
    inc  c
    ld   a, c
    cp   $05
    jr   nz, label_5DDB
    ld   b, $02

label_5DDB::
    cp   $0A
    jr   nz, label_5DE1
    ld   b, $04

label_5DE1::
    cp   $0F
    jr   nz, label_5DCC
    ret

label_5DE6::
    ld   a, [$DB5A]
    and  a
    jr   nz, label_5DFA
    ld   a, [$DB5B]
    ld   e, a
    ld   d, $00
    ld   hl, label_5295
    add  hl, de
    ld   a, [hl]
    ld   [$DB5A], a

label_5DFA::
    call label_2802
    ld   a, [$DBA6]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_49F8
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   bc, $D800
    ld   de, data_380

label_5E12::
    call label_27D0
    ld   a, [bc]
    inc  bc
    call label_27D0
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5E12
    ld   bc, $DDDA
    ld   de, $0005

label_5E26::
    call label_27D0
    ld   a, [bc]
    inc  bc
    call label_27D0
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5E26
    ld   bc, $DDE0
    ld   de, $0020

label_5E3A::
    call label_27D0
    ld   a, [bc]
    inc  bc
    call label_27D0
    ldi  [hl], a
    dec  de
    ld   a, e
    or   d
    jr   nz, label_5E3A
    call label_27D0
    ld   a, [$DC0F]
    call label_27D0
    ldi  [hl], a
    call label_27D0
    ld   a, [$DC0C]
    call label_27D0
    ldi  [hl], a
    call label_27D0
    ld   a, [$DC0D]
    call label_27D0
    ldi  [hl], a
    ret
    push bc
    ld   a, [$DBA5]
    and  a
    jr   z, label_5E95
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_5E79
    ld   hl, $DDDA
    jr   label_5E8A

label_5E79::
    cp   $0A
    jr   nc, label_5E95
    ld   hl, $DB16
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    add  hl, de

label_5E8A::
    ld   de, $DBCC
    ld   c, $05

label_5E8F::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_5E8F

label_5E95::
    pop  bc
    ret

label_5E97::
    and  b
    ld   h, b
    nop
    nop
    nop

label_5E9C::
    nop
    rst  $38
    nop
    nop
    nop

label_5EA1::
    nop
    nop
    add  a, b
    add  a, b
    nop

label_5EA6::
    nop
    nop
    rst  $38
    nop
    nop
    ld   hl, $C460
    add  hl, de
    ld   a, [$FFE4]
    ld   [hl], a
    inc  a
    ld   [$FFE4], a
    push bc
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    ld   hl, label_5E97
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, label_5E9C
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    ld   hl, label_5EA1
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD9], a
    ld   hl, label_5EA6
    add  hl, bc
    ld   a, [hl]
    ld   [$FFDA], a
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFD7]
    add  a, [hl]
    ld   [hl], a
    rr   c
    ld   hl, $C220
    add  hl, de
    ld   a, [$FFD8]
    rl   c
    adc  a, [hl]
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFD9]
    add  a, [hl]
    ld   [hl], a
    rr   c
    ld   hl, $C230
    add  hl, de
    ld   a, [$FFDA]
    rl   c
    adc  a, [hl]
    ld   [hl], a
    pop  bc
    ret
    ld   c, $06
    ld   a, [$FFF6]
    ld   hl, $CE81

label_5F09::
    cp   [hl]
    jr   z, label_5F2D
    inc  hl
    dec  c
    jr   nz, label_5F09
    ld   a, [$CE80]
    inc  a
    cp   $06
    jr   nz, label_5F19
    xor  a

label_5F19::
    ld   [$CE80], a
    ld   e, a
    ld   d, $00
    ld   hl, $CE81
    add  hl, de
    ld   e, [hl]
    ld   a, [$FFF6]
    ld   [hl], a
    ld   hl, $CF00
    add  hl, de
    ld   [hl], $00

label_5F2D::
    ret
    ld   hl, $0000
    ld   a, [hIsGBC]
    and  a
    jr   z, label_5F3A
    ld   [hl], $00
    jr   label_5F3C

label_5F3A::
    ld   [hl], $FF

label_5F3C::
    ld   b, $28
    ld   a, $F4
    ld   hl, $C000

label_5F43::
    ldi  [hl], a
    inc  hl
    inc  hl
    inc  hl
    dec  b
    jr   nz, label_5F43
    ret
    ld   a, [$C14F]
    and  a
    jr   z, label_5F6A
    ld   hl, $C000
    ld   a, [$DB9A]
    add  a, $08
    ld   d, a
    ld   e, $28

label_5F5C::
    ld   a, [hl]
    cp   d
    jr   c, label_5F62
    ld   [hl], $00

label_5F62::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    dec  e
    jr   nz, label_5F5C
    ret

label_5F6A::
    ld   a, [$DB9A]
    and  a
    ret  z
    ld   a, [$C19F]
    and  a
    ret  z
    ld   d, $3E
    ld   a, [$C19F]
    and  $80
    jr   z, label_5F7F
    ld   d, $58

label_5F7F::
    ld   e, $1F
    ld   hl, $C024

label_5F84::
    ld   a, [hl]
    cp   d
    ld   a, [$C19F]
    bit  7, a
    jr   nz, label_5F8E
    ccf

label_5F8E::
    jr   c, label_5FAB
    ld   a, [$C173]
    cp   $4F
    jr   nz, label_5FA9
    ld   a, [$C112]
    and  a
    jr   nz, label_5FA9
    inc  hl
    inc  hl
    db   $3A ; ldd  a, [hl]
    dec  hl
    cp   $9A
    jr   c, label_5FA9
    cp   $A0
    jr   c, label_5FAB

label_5FA9::
    ld   [hl], $00

label_5FAB::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    dec  e
    jr   nz, label_5F84
    ret

label_5FB3::
    ld   a, [$DBA5]
    and  a
    jr   z, label_5FD3
    ld   a, [$FFF9]
    and  a
    ret  nz
    ld   a, [$FFF7]
    cp   $16
    ret  z
    cp   $14
    ret  z
    cp   $13
    ret  z
    cp   $0A
    ret  c
    ld   a, [$FFF6]
    cp   $FD
    ret  z
    cp   $B1
    ret  z

label_5FD3::
    ld   a, [$DB7B]
    cp   $01
    jr   nz, label_6014
    ld   e, $0F
    ld   d, $00

label_5FDE::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $D5
    jr   nz, label_5FF0
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_5FF0
    ld   [hl], d

label_5FF0::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_5FDE
    ld   a, $D5
    call label_3B86
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_6014::
    ld   a, [$DB79]
    cp   $01
    jr   z, label_6043
    cp   $02
    jr   nz, label_607F
    ld   a, [$DBA5]
    and  a
    jr   nz, label_607F
    ld   a, [$FFF6]
    cp   $40
    jr   c, label_607F
    ld   a, [$DB68]
    and  $02
    jr   z, label_607F
    ld   a, [$DB43]
    cp   $02
    jr   c, label_603C
    xor  a
    jr   label_603E

label_603C::
    ld   a, $01

label_603E::
    ld   [$DB79], a
    jr   label_607F

label_6043::
    ld   e, $0F
    ld   d, $00

label_6047::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $D4
    jr   nz, label_6059
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_6059
    ld   [hl], d

label_6059::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_6047
    ld   a, $D4
    call label_3B86
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]
    ld   a, $2D
    ld   [$FFF2], a

label_607F::
    ld   a, [$DB73]
    and  a
    jp   z, label_611F
    ld   e, $0F
    ld   d, $00

label_608A::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $C1
    jr   nz, label_609C
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_609C
    ld   [hl], d

label_609C::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_608A
    ld   a, $C1
    call label_3B86
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $D155
    call label_6118
    ld   a, [$FF99]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $D175
    call label_6118
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $D195
    call label_6118
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $0C
    ld   a, [$FFF6]
    cp   $A4
    jr   nz, label_60F7
    ld   a, [$FFF7]
    cp   $11
    jr   nz, label_60F7
    ld   a, $08
    ld   [$FFF2], a
    ld   [$C167], a
    ld   hl, $C300
    add  hl, de
    ld   [hl], $79

label_60F7::
    ld   a, [$FF9E]
    ld   hl, $D1B5
    call label_6118
    ld   a, [$DB10]
    and  a
    jr   z, label_6117
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    add  a, $20
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, de
    add  a, $10
    ld   [hl], a

label_6117::
    ret

label_6118::
    ld   c, $10

label_611A::
    ldi  [hl], a
    dec  c
    jr   nz, label_611A
    ret

label_611F::
    ld   a, [$FFF6]
    cp   $A7
    ret  z
    ld   a, [$DB56]
    cp   $01
    jr   nz, label_6161
    ld   e, $0F
    ld   d, $00

label_612F::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $6D
    jr   nz, label_6141
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_6141
    ld   [hl], d

label_6141::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_612F
    ld   a, $6D
    call label_3B86
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFA2]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a

label_6161::
    ret

label_6162::
    call label_27F2
    xor  a
    ld   [WR1_GameplayType], a
    ld   [WR1_GameplaySubtype], a
    ld   [$DB98], a
    ld   [$DB99], a
    ld   [$DB97], a
    ld   [rBGP], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   [$FF97], a
    ld   [$FF96], a
    ld   [$D6FB], a
    ld   [$D6F8], a
    ld   a, $18
    ld   [$FFB5], a
    ret

label_618A::
    db 0, $57, $10, $57, $20, $57, $30, $57, $40, $57, $50, $57, $60, $57, $70, $57
    db $80, $57, $90, $57, 0, $58, $10, $58, $20, $58, $30, $58, $40, $58, $50, $58

label_61AA::
    ld   a, [$C109]
    and  $0F
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_618A
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $96D0  ; destination
    ld   bc, $0010  ; count
    ld   a, $0F     ; bank
    call CopyDataFromBank
    ld   a, [$C109]
    swap a
    and  $0F
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_618A
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $96C0 ; destination
    ld   bc, $0010 ; count
    ld   a, $0F    ; bank
    call CopyDataFromBank
    ld   a, $6C
    ld   [$9909], a

label_61E9::
    inc  a
    ld   [$990A], a
    ret
    ld   a, [$C11C]
    cp   $00
    jr   nz, label_6202
    ld   a, [$C17B]
    and  a
    jr   nz, label_6202
    ld   a, [$FFF7]
    add  a, $56
    call label_2385

label_6202::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_6213
    ld   a, [$C3C7]
    and  a
    jr   z, label_6213
    dec  a
    ld   [$C3C7], a

label_6213::
    ld   a, [$C3C4]
    and  a
    jr   z, label_621D
    dec  a
    ld   [$C3C4], a

label_621D::
    db $FA, $96, $DB, $C7, $3F, $62, $60, $62, $82, $62, $8E, $62, $CA, $63, $17, $64
    db $32, $64, $50, $64, $67, $64, $79, $64, $90, $64, $A2, $64, $D0, $64, $E7, $64
    db $25, $58, $CD, $D6, $44, $F0, $FE, $A7, $28, $19, $21, $10, $DC, $E, $80, $F3

label_624D::
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
    jr   nz, label_624D
    xor  a
    ld   [rSVBK], a
    ei

label_6260::
    ld   a, $01
    ld   [$C167], a
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6281
    call label_44D6
    xor  a
    ld   [$C1BF], a
    call label_5888
    call label_64FF
    ld   a, $0F
    ld   [$D6FE], a

label_6281::
    ret
    ld   a, $13
    ld   [$D6FE], a
    xor  a
    ld   [$C13F], a
    jp   label_44D6
    ld   a, $13
    ld   [$D6FF], a
    ld   a, $FF
    ld   [$DB9A], a
    xor  a
    ld   [$FF96], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $90
    ld   [$FF97], a
    ld   a, $40
    ld   [$C114], a
    ld   a, $A0
    ld   [$D466], a
    ld   a, $01
    ld   [$DDD5], a
    ld   a, $E0
    ld   [$C540], a
    ld   a, $00
    ld   [$C530], a
    ld   a, $01
    ld   [$C510], a
    ld   a, $0C
    ld   [$C560], a
    ld   a, $08
    ld   [$C550], a
    ld   a, $00
    ld   [$C520], a
    ld   [$D200], a
    ld   a, $20
    ld   [$C541], a
    ld   a, $A0
    ld   [$C531], a
    ld   a, $01
    ld   [$C511], a
    ld   a, $08
    ld   [$C561], a
    ld   a, $F8
    ld   [$C551], a
    ld   a, $40
    ld   [$C521], a
    ld   a, $24
    ld   [$D201], a
    ld   a, $48
    ld   [$C542], a
    ld   a, $30
    ld   [$C532], a
    ld   a, $02
    ld   [$C512], a
    ld   a, $00
    ld   [$C562], a
    ld   a, $00
    ld   [$C552], a
    ld   a, $00
    ld   [$C522], a
    ld   a, $02
    ld   [$D202], a
    ld   a, $3C
    ld   [$C543], a
    ld   a, $40
    ld   [$C533], a
    ld   a, $02
    ld   [$C513], a
    ld   a, $00
    ld   [$C563], a
    ld   a, $00
    ld   [$C553], a
    ld   a, $00
    ld   [$C523], a
    ld   a, $00
    ld   [$D203], a
    ld   a, $40
    ld   [$C544], a
    ld   a, $50
    ld   [$C534], a
    ld   a, $02
    ld   [$C514], a
    ld   a, $00
    ld   [$C564], a
    ld   a, $00
    ld   [$C554], a
    ld   a, $00
    ld   [$C524], a
    ld   a, $00
    ld   [$D204], a
    ld   a, $3C
    ld   [$C545], a
    ld   a, $60
    ld   [$C535], a
    ld   a, $02
    ld   [$C515], a
    ld   a, $00
    ld   [$C565], a
    ld   a, $00
    ld   [$C555], a
    ld   a, $00
    ld   [$C525], a
    ld   a, $00
    ld   [$D205], a
    ld   a, $44
    ld   [$C546], a
    ld   a, $68
    ld   [$C536], a
    ld   a, $02
    ld   [$C516], a
    ld   a, $00
    ld   [$C566], a
    ld   a, $00
    ld   [$C556], a
    ld   a, $00
    ld   [$C526], a
    ld   a, $00
    ld   [$D206], a
    jp   label_44D6

label_63AA::
    db 0, 0, 0, 0, $40, $40, $40, $40, $94, $94, $94, $94, $E4, $E4, $E4, $E4

label_63BA::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C

label_6C3A::
    ld   a, [hIsGBC]
    and  a
    jr   z, label_63E4
    ld   a, [hFrameCounter]
    and  $07
    jr   nz, label_6417
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6417
    call label_44D6
    jr   label_6417

label_63E4::
    ld   a, [hFrameCounter]
    and  $07
    jr   nz, label_63F8
    ld   a, [$C3C5]
    inc  a
    ld   [$C3C5], a
    cp   $0C
    jr   nz, label_63F8
    call label_44D6

label_63F8::
    ld   a, [hFrameCounter]
    and  $03
    ld   e, a
    ld   a, [$C3C5]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_63AA
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   [$DB99], a
    ld   hl, label_63BA
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a

label_6417::
    ld   a, [hFrameCounter]
    and  $03
    jr   nz, label_642E
    ld   a, [$FF97]
    inc  a
    ld   [$FF97], a
    cp   $00
    jr   nz, label_642E
    ld   a, $80
    ld   [$C3C7], a
    call label_44D6

label_642E::
    call label_651E
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_644A
    ld   a, [$C3C7]
    and  a
    jr   nz, label_6449
    ld   a, $D8
    call label_67DE
    call label_44D6

label_6449::
    ret

label_644A::
    ld   a, $02
    ld   [$C3C4], a
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_6466
    ld   a, $80
    ld   [$C3C4], a
    ld   a, $C0
    ld   [$C3C7], a
    call label_44D6

label_6466::
    ret
    call label_651E
    ld   a, [$C3C7]
    and  a
    jr   nz, label_6478
    ld   a, $D9
    call label_67DE
    jp   label_44D6

label_6478::
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_648F
    ld   a, $80
    ld   [$C3C4], a
    ld   a, $C0
    ld   [$C3C7], a
    call label_44D6

label_648F::
    ret
    call label_651E
    ld   a, [$C3C7]
    and  a
    jr   nz, label_64A1
    ld   a, $DA
    call label_67DE
    jp   label_44D6

label_64A1::
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_64CA
    ld   a, [$C177]
    and  a
    jr   nz, label_64BA
    ld   a, $DB
    call label_67DE
    call label_44D6
    ret

label_64BA::
    ld   a, $DE
    call label_67DE
    ld   a, $06
    ld   [WR1_GameplaySubtype], a
    ld   a, $05
    ld   [$C3C7], a
    ret

label_64CA::
    ld   a, $02
    ld   [$C3C4], a
    ret
    call label_651E
    ld   a, [$C19F]
    and  a
    jr   nz, label_64E6
    ld   a, $DC
    call label_67DE
    ld   a, $30
    ld   [$C3C7], a
    call label_44D6

label_64E6::
    ret
    call label_651E
    ld   a, $02
    ld   [$C3C4], a
    ld   a, [$C3C7]
    and  a
    ret  nz
    call label_27F2
    call label_68D9
    ld   a, $01
    ld   [$DB73], a

label_64FF::
    ld   e, $10
    ld   hl, $C510
    xor  a

label_6505::
    ldi  [hl], a
    dec  e
    jr   nz, label_6505
    ret

label_650A::
    db $40, 1, $40, $21

label_650E::
    db $46, 1, $48, 1

label_6512::
    db $42, 0, $44, 0

label_6516::
    db $42, 2, $44, 2

label_651A::
    db $42, 3, $44, 3

label_651E::
    call label_65AE
    ld   a, [$C114]
    inc  a
    cp   $A0
    jr   nz, label_652E
    ld   a, $0F
    ld   [$FFF4], a
    xor  a

label_652E::
    ld   [$C114], a
    ld   a, [$D466]
    and  a
    jr   nz, label_6545
    ld   a, $21
    ld   [$FFF2], a
    call GetRandomByte
    and  $7F
    add  a, $60
    ld   [$D466], a

label_6545::
    dec  a
    ld   [$D466], a
    ld   a, [$FF97]
    dec  a
    cp   $C0
    ret  c
    ld   de, label_650A
    ld   a, [$C3C4]
    and  a
    jr   z, label_655F
    cp   $60
    jr   nc, label_655F
    ld   de, label_650E

label_655F::
    ld   a, $7C
    ld   [$FFEC], a
    ld   a, $58
    ld   [$FFEE], a
    ld   hl, $C030
    call label_658B
    ld   a, $48
    ld   [$FFEE], a
    ld   de, label_6512
    ld   a, [$DC0F]
    and  a
    jr   z, label_6584
    ld   de, label_6516
    cp   $01
    jr   z, label_6584
    ld   de, label_651A

label_6584::
    ld   hl, $C038
    call label_658B
    ret

label_658B::
    push bc
    ld   a, [$FF97]
    ld   c, a
    ld   a, [$FFEC]
    sub  a, c
    ld   [$FFE8], a
    ldi  [hl], a
    ld   a, [$FFEE]
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [$FFEC]
    sub  a, c
    ldi  [hl], a
    ld   a, [$FFEE]
    add  a, $08
    ldi  [hl], a
    ld   a, [de]
    inc  de
    ldi  [hl], a
    ld   a, [de]
    ld   [hl], a
    pop  bc
    ret

label_65AE::
    ld   c, $08
    ld   b, $00

label_65B2::
    ld   hl, $C510
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_65D6
    push af
    ld   hl, $C530
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $C540
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEC], a
    ld   hl, $C520
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_65D2
    dec  [hl]

label_65D2::
    pop  af
    call label_65DD

label_65D6::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_65B2
    ret

label_65DD::
    db $3D, $C7, $73, $66, $FD, $66

label_65E3::
    db $EF, $65, $F3, $65, $F7, $65, $FB, $65, $FF, $65, 3, $66, $50, 0, $50, $20
    db $52, 0, $52, $20, $54, 0, $54, $20, $56, 0, $56, $20, $58, 0, $58, $20
    db $5A, 0, $5A, $20

label_6607::
    db 3, 3, 3, 3

label_660B::
    db 3, 3, 3, 3, 3, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1
    db 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5
    db 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3
    db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3

label_6646::
    db 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0
    db 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4
    db 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5

label_6673::
    ld   hl, $C520
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    ld   hl, $D210
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $06
    jr   c, label_668B
    ld   [hl], b
    ld   hl, $D200
    add  hl, bc
    inc  [hl]

label_668B::
    ld   hl, $D200
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_6607
    add  hl, de
    ld   e, [hl]
    sla  e
    ld   d, b
    ld   hl, label_65E3
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    push de
    ld   hl, $C040
    ld   a, c
    rla
    rla
    rla
    and  $78
    ld   e, a
    ld   d, b
    add  hl, de
    pop  de
    call label_658B
    call label_67A8
    ld   a, [hFrameCounter]
    and  $07
    jr   nz, label_66C4
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    cp   $FB
    jr   z, label_66C4
    dec  [hl]

label_66C4::
    ld   a, [$FFE8]
    cp   $F0
    jr   c, label_66D7
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    and  $80
    ret  z
    ld   hl, $C510
    add  hl, bc
    ld   [hl], b

label_66D7::
    ret

label_66D8::
    db $E0, $66, $E4, $66, $E8, $66, $EC, $66, $4C, 0, $4C, $20, $4E, 0, $4E, $20
    db $5C, 0, $5C, $20, $5E, 0, $5E, $20
    
label_66F0::
    db 1, $FF

label_66F2::
    db 1, $FF, $FE, 2

label_66F6::
    db 1, $FF, $4C, $52, $58, $5C, $60

label_66FD::
    ld   hl, $C560
    add  hl, bc
    ld   a, [hl]
    ld   e, $03
    and  $80
    jr   z, label_6718
    ld   hl, $D200
    add  hl, bc
    ld   a, [hFrameCounter]
    and  $07
    jr   nz, label_6717
    ld   a, [hl]
    inc  a
    and  $03
    ld   [hl], a

label_6717::
    ld   e, [hl]

label_6718::
    sla  e
    ld   d, b
    ld   hl, label_66D8
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    push de
    ld   hl, $C040
    ld   a, c
    rla
    rla
    rla
    and  $78
    ld   e, a
    ld   d, b
    add  hl, de
    pop  de
    call label_658B

label_6733::
    call label_67A8
    ld   a, c
    sla  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    ld   a, [hFrameCounter]
    add  a, e
    ld   [$FFE9], a

label_6745::
    and  $3F
    jr   nz, label_675A
    call GetRandomByte
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_66F0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C550
    add  hl, bc
    ld   [hl], a

label_675A::
    ld   a, [$FFE9]
    add  a, $40
    and  $3F
    jr   nz, label_6773
    call GetRandomByte
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_66F0
    add  hl, de
    ld   a, [hl]
    ld   hl, $C560
    add  hl, bc
    ld   [hl], a

label_6773::
    ld   hl, $C590
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $13
    jr   c, label_67A7
    ld   [hl], b
    ld   hl, label_66F6
    add  hl, bc
    ld   d, [hl]
    ld   hl, $C530
    add  hl, bc
    ld   a, [hl]
    sub  a, d
    ld   e, $01
    and  $80
    jr   nz, label_6792
    ld   e, $FF

label_6792::
    ld   a, [hl]
    add  a, e
    ld   [hl], a
    ld   hl, $C540
    add  hl, bc
    ld   a, [hl]
    sub  a, $48
    ld   e, $01
    and  $80
    jr   nz, label_67A4
    ld   e, $FF

label_67A4::
    ld   a, [hl]
    add  a, e
    ld   [hl], a

label_67A7::
    ret

label_67A8::
    call label_67B5
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_67B5
    pop  bc
    ret

label_67B5::
    ld   hl, $C550
    add  hl, bc
    ld   a, [hl]
    push af
    swap a
    and  $F0
    ld   hl, $C570
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C530
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_67D4
    ld   e, $F0

label_67D4::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

label_67DE::
    ld   e, a
    ld   a, [$FF99]
    push af
    ld   a, $60
    ld   [$FF99], a
    ld   a, e
    call label_2373
    pop  af
    ld   [$FF99], a
    ret

label_67EE::
    db $FA, $96, $DB, $C7, 8, $68, $29, $68, $56, $68, $73, $68, $AA, $68, $C0, $68
    db $25, $58, $E4, $68, 8, $69, $45, $69, $22, $58, $CD, $D6, $44

label_680B::
    ld   a, [hIsGBC]
    and  a
    jr   z, label_6829
    ld   hl, $DC10
    ld   c, $80
    di

label_6816::
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
    jr   nz, label_6816
    xor  a
    ld   [rSVBK], a
    ei

label_6829::
    ld   a, $01
    ld   [$C167], a
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6855
    call label_5888
    ld   a, [$FFF7]
    cp   $06
    jr   z, label_6849
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a

label_6849::
    call label_44D6
    xor  a
    ld   [$C1BF], a
    ld   a, $0F
    ld   [$D6FE], a

label_6855::
    ret
    ld   e, $21
    ld   a, [$FFF7]
    cp   $06
    jr   z, label_6868
    ld   a, [$FFF6]
    cp   $DD
    ld   e, $12
    jr   nz, label_6868
    ld   e, $20

label_6868::
    ld   a, e
    ld   [$D6FE], a
    xor  a
    ld   [$C13F], a
    jp   label_44D6
    ld   e, $24
    ld   a, [$FFF7]
    cp   $06
    jr   z, label_6885
    ld   a, [$FFF6]
    cp   $DD
    ld   e, $12
    jr   nz, label_6885
    ld   e, $23

label_6885::
    ld   a, e
    ld   [$D6FF], a
    ld   a, $FF
    ld   [$DB9A], a
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   e, $08
    ld   hl, $D210

label_689E::
    ldi  [hl], a
    dec  e
    jr   nz, label_689E
    ld   a, $01
    ld   [$DDD5], a
    jp   label_44D6
    call label_6A7C
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_68BF
    call label_44D6
    ld   a, $80
    ld   [$D210], a

label_68BF::
    ret
    ld   a, [$FFF7]
    cp   $06
    jr   nz, label_68CF
    call label_6A7C
    ld   a, $07
    ld   [WR1_GameplaySubtype], a
    ret

label_68CF::
    ld   a, [$FFCC]
    and  $B0
    jr   z, label_68E3
    ld   a, $13
    ld   [$FFF2], a

label_68D9::
    call label_44D6
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a

label_68E3::
    ret
    call label_6A7C
    ld   a, [$D210]
    dec  a
    ld   [$D210], a
    jr   nz, label_68FB
    ld   [$C156], a
    ld   a, $20
    ld   [$D210], a
    jp   label_44D6

label_68FB::
    ld   e, $00
    and  $04
    jr   z, label_6903
    ld   e, $FE

label_6903::
    ld   a, e
    ld   [$C156], a
    ret
    call label_6A7C
    call label_695B
    ld   a, [$D210]
    dec  a
    ld   [$D210], a
    jr   nz, label_6944
    call label_C4B
    ld   a, $30
    ld   [$D210], a
    ld   a, $30
    ld   [$D214], a
    ld   a, $18
    ld   [$D215], a
    ld   a, [$D211]
    add  a, $08
    ld   [$D211], a
    ld   a, [$D213]
    inc  a
    ld   [$D213], a
    cp   $04
    jr   nz, label_6944
    ld   a, $80
    ld   [$D210], a
    call label_44D6

label_6944::
    ret
    call label_6A7C
    call label_695B
    ld   hl, $D210
    dec  [hl]
    ret  nz
    call label_44D6
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ret

label_695B::
    xor  a
    ld   [$C156], a
    ld   a, [$D215]
    and  a
    jr   z, label_6975
    dec  a
    ld   [$D215], a
    ld   e, $FE
    and  $04
    jr   z, label_6971
    ld   e, $00

label_6971::
    ld   a, e
    ld   [$C156], a

label_6975::
    ret

label_6976::
    db $14, $14, $10, $10, $0c, $0c

label_697C::
    db $17, $17, $13

label_697F::
    db $13, $0f, $0f

label_6982::
    db 0, 0, $CC, $10, 0, 8, $CE, $10, 0, $10, $DC, $10, 0, $18, $CC, $30
    db $10, 0, $DE, $10, $10, 8, $E0, $10, $10, $10, $E2, $10, $10, $18, $DE, $30
    db $20

label_69A3::
    db 0, $E4, $10, $20, 8, $E6, $10, $20, $10, $E8, $10, $20

label_69AF::
    db $18, $E4, $30, $30, 0, $DE, $10, $30, 8, $E0, $10, $30, $10

label_69BC::
    db $E0, $30, $30, $18

label_69C0::
    db $DE, $30, $40

label_69C3::
    db 0, $DE, $10, $40, 8, $E0, $10, $40, $10, $E0, $30, $40, $18, $DE, $30
    
label_69D2::
    db 0

label_69D3::
    db $10, $DC, $16, $10, $10, $E2, $16, $20, $10, $E8, $16, 0, 0, $CC, $15, 0

label_69E3::
    db 8, $CE, $15, 0, $10, $CE, $35, 0, $18, $CC, $35, $10, 0, $DE, $15, $10
    db 8, $E0, $15, $10, $10, $E0, $35, $10, $18, $DE, $35, $20, 0

label_6A00::
    db $E4, $15, $20, 8, $E6, $15, $20, $10, $E6, $35, $20, $18

label_6A0C::
    db $E4, $35, $30, 0

label_6A10::
    db $DE, $15, $30, 8, $E0, $15, $30, $10

label_6A18::
    db $E0, $35, $30, $18

label_6A1C::
    db $DE, $35, $40, 0, $DE, $15, $40, 8, $E0, $15, $40, $10, $E0, $35, $40, $18
    db $DE

label_6A2D::
    db $35, $48, 8, $F0, 7, $48

label_6A33::
    db $10, $F2, 7, $48, $18, $F4, 7, $48, $20, $F4, $27, $48, $28, $F2, $27, $48
    db $30, $F0, $27, $48, 8, $F6, 7, $48

label_6A4B::
    db $10, $F8, 7, $48

label_6A4F::
    db $18, $FA

label_6A51::
    db $07, $48

label_6A53::
    db $20, $FA, $27, $48

label_6A57::
    db $28, $F8, $27, $48

label_6A5B::
    db $30, $F6, $27, $48, 8, $FC, 7, $48, $10, $FE, 7, $48, $18, $EE, 7, $48
    db $20, $EE, $27, $48

label_6A6F::
    db $28, $FE

label_6A71::
    daa
    ld   c, b
    jr   nc, label_6A71
    daa

label_6A76::
    ld   l, $6A
    ld   b, [hl]
    ld   l, d
    ld   e, [hl]
    ld   l, d

label_6A7C::
    ld   a, [$FFF7]
    cp   $06
    ret  nz
    xor  a
    ld   [$FFF1], a
    ld   [$FFED], a
    ld   [$FFF5], a
    ld   a, $38
    ld   [$FFEE], a
    ld   a, [$C156]
    ld   e, a
    ld   a, $20
    sub  a, e
    ld   [$FFEC], a
    ld   a, [$D214]
    and  a
    jr   z, label_6AC2
    dec  a
    ld   [$D214], a
    ld   a, [hFrameCounter]
    and  $07
    ld   a, [$D212]
    jr   nz, label_6AAE
    inc  a
    cp   $03
    jr   nz, label_6AAE
    xor  a

label_6AAE::
    ld   [$D212], a
    rla
    and  $06
    ld   e, a
    ld   d, b
    ld   hl, label_6A76
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   c, $06
    call label_3CE0

label_6AC2::
    ld   a, $48
    ld   [$FFEE], a
    ld   a, [$C156]
    ld   e, a
    ld   a, [$D211]
    add  a, $20
    sub  a, e
    ld   [$FFEC], a
    ld   a, [$D213]
    ld   e, a
    ld   d, $00
    ld   hl, label_6976
    ld   a, [hIsGBC]
    and  a
    jr   z, label_6AE3
    ld   hl, label_697C

label_6AE3::
    add  hl, de
    ld   c, [hl]
    xor  a
    ld   [$C3C0], a
    ld   hl, label_6982
    ld   a, [hIsGBC]
    and  a
    jr   z, label_6AF4
    ld   hl, label_69D2

label_6AF4::
    call label_3CE6
    ret


    ld   a, [WR1_GameplaySubtype]
    rst  0
    ld   a, [bc]
    ld   l, e
    dec  hl
    ld   l, e
    ld   d, d
    ld   l, e
    ld   l, a
    ld   l, e
    add  a, c
    ld   l, e
    sbc  a, d
    ld   l, e
    dec  h
    ld   e, b
    call label_44D6
    ld   a, [hIsGBC]
    and  a
    jr   z, label_6B2B
    ld   hl, $DC10
    ld   c, $80
    di

label_6B18::
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
    jr   nz, label_6B18
    xor  a
    ld   [rSVBK], a
    ei

label_6B2B::
    ld   a, $01
    ld   [$C167], a
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6B51
    call label_5888
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a
    call label_44D6
    xor  a
    ld   [$C1BF], a
    ld   a, $14
    ld   [$D6FE], a

label_6B51::
    ret
    ld   a, $15
    ld   [$D6FF], a
    ld   a, $FF
    ld   [$DB9A], a
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $01
    ld   [$DDD5], a
    jp   label_44D6
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_6B80
    call label_44D6
    xor  a
    ld   [$C3C4], a

label_6B80::
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C3C4]
    inc  a
    ld   [$C3C4], a
    jp   z, label_44D6
    cp   $80
    jr   nz, label_6B99
    ld   a, $E7
    call label_2385

label_6B99::
    ret
    ld   a, [$FFCC]
    and  $B0
    jr   z, label_6BA7
    ld   a, $13
    ld   [$FFF2], a
    call label_68D9

label_6BA7::
    ret

label_6BA8::
    ld   a, [$FFCC]
    and  $0C
    jr   z, label_6BB4

label_6BAE::
    push af
    ld   a, $0A
    ld   [$FFF2], a
    pop  af

label_6BB4::
    ret
    ld   a, [$FF92]
    cp   $08
    jp  c, label_6C77
    jr   nz, label_6BC6
    call label_6BF0
    ld   hl, $FF92
    inc  [hl]
    ret

label_6BC6::
    call label_6BEA
    xor  a
    ld   [$FF90], a
    ld   [$FF92], a
    ret

label_6BCF::
    db $F, $51, $B1, $EF, $EC, $AA, $4A, $C

label_6BD7::
    db $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8

label_6BDF::
    db $D0, $D2, $D4, $D6, $D8, $DA, $DC, $DE

label_6BE7::
    db 1, $1F, 1

label_6BEA::
    db $E, 8, $1E, 4, $18, 4

label_6BF0::
    db $E, 4, $1E, 0

label_6BF4::
    ld   a, c
    ld   [$FFE0], a
    ld   d, $00

label_6BF9::
    xor  a
    ld   [$FFD7], a
    ld   [$FFD8], a
    ld   [$FFD9], a
    ld   [$FFDA], a
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    bit  1, a
    jp   nz, label_6C2A
    ld   c, $00
    ld   b, c
    ld   hl, label_6BCF
    add  hl, de
    ld   a, [hl]
    ld   l, a
    ld   h, $9D
    push hl
    ld   a, $7C
    ld   [$FFD7], a
    ld   [$FFD8], a
    ld   [$FFD9], a
    ld   hl, label_6BD7
    add  hl, de
    ld   a, [hl]
    ld   [$FFDA], a
    pop  hl
    jr   label_6C48

label_6C2A::
    ld   c, $00
    ld   b, c
    ld   hl, label_6BCF
    add  hl, de
    ld   a, [hl]
    ld   l, a
    ld   h, $9D
    push hl
    ld   hl, label_6BDF
    add  hl, de
    ld   a, [hl]
    ld   [$FFD7], a
    inc  a
    ld   [$FFD8], a
    add  a, $0F
    ld   [$FFD9], a
    inc  a
    ld   [$FFDA], a
    pop  hl

label_6C48::
    ld   a, [$FFD7]
    ld   [hl], a
    call label_6C69
    ld   a, [$FFD8]
    ld   [hl], a
    inc  c
    call label_6C69
    ld   a, [$FFD9]
    ld   [hl], a
    inc  c
    call label_6C69
    ld   a, [$FFDA]
    ld   [hl], a
    inc  e
    ld   a, e
    ld   hl, $FFE0
    cp   [hl]
    jp   nz, label_6BF9
    ret

label_6C69::
    push hl
    ld   hl, label_6BE7
    add  hl, bc
    ld   a, [hl]
    pop  hl
    add  a, l
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a
    ret

label_6C77::
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, $8D00
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   hl, label_4D00
    add  hl, bc
    call label_C3A
    ld   a, [$FF92]
    inc  a
    ld   [$FF92], a
    ret

label_6CA5::
    db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, $A, $B, $10, $1B, $20, $2B
    db $30, $3B, $40, $4B, $50, $5B, $60, $6B, $70, $7B, $80, $8B, $90, $91, $92, $93
    db $94, $95, $96, $97, $98, $99, $9A, $9B, $FF, 1, $A5, $6C

label_6CD1::
    ld   a, [bc]
    cp   $FF
    jr   z, label_6CE2
    ld   e, a
    ld   d, $00
    ld   hl, $D700
    add  hl, de
    ld   [hl], $FF
    inc  bc

label_6CE0::
    jr   label_6CD1

label_6CE2::
    ret
    ld   bc, label_400
    ld   hl, $9800

label_6CE9::
    ld   e, $00
    ld   a, l
    and  $20
    jr   z, label_6CF1
    inc  e

label_6CF1::
    ld   d, $AE
    ld   a, l
    and  $01
    xor  e
    jr   z, label_6CFA
    inc  d

label_6CFA::
    ld   a, l
    and  $1F
    cp   $14
    jr   nc, label_6D02
    ld   [hl], d

label_6D02::
    inc  hl
    dec  bc
    ld   a, b
    or   c
    jr   nz, label_6CE9
    ld   a, [hIsGBC]
    and  a
    jr   z, label_6D10
    call label_6D11

label_6D10::
    ret

label_6D11::
    ld   d, $05
    ld   a, [WR1_GameplayType]
    cp   GAMEPLAY_OVERWORLD
    jr   z, label_6D1C
    ld   d, $06

label_6D1C::
    ld   a, $01
    ld   [rVBK], a
    ld   hl, $9800
    ld   bc, label_400

label_6D26::
    ld   a, d
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, label_6D26
    ld   a, $00
    ld   [rVBK], a
    ret
    ld   c, $C0
    ld   b, $0A
    ld   hl, label_6D40

label_6D39::
    ld   a, [hli]
    ld   [$FF00+C], a
    inc  c
    dec  b
    jr   nz, label_6D39
    ret

label_6D40::
    ld   a, $C0
    ld   [rDMA], a
    ld   a, $28

label_6D46::
    dec  a
    jr   nz, label_6D46
    ret

label_6D4A::
    db $80, $80, $40, $40, $20, $20, $10, $10, 8, 8, 4, 4, 2, 2, 1, 1
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db $80, $80, $40, $40, $20, $20

label_6D70::
    db $10, $10, 8, 8, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $80, $80, $40, $40, $20, $20

label_6D90::
    db $10, $10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $80, $80, $40, $40, $20, $20

label_6DB0::
    db $10, $10, 8, 8, 4, 4, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

label_6DCA::
    db $E, $9E, $D, $9E, $C, $9E

label_6DD0::
    db $E, $9E, $12, $9E, $E, $9E, $C, $9E, $E, $9E, 0, 0, 0, 0, 0, 0
    db 0, 0, 0, 0, 0, 0, 0, 0, $D, $9E

label_6DEA::
    ld   a, [$0004]
    and  a
    ret  nz
    ld   a, [$DBA5]
    and  a
    jr   z, label_6E18
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_6DFF
    ld   a, $0F
    jr   label_6E03

label_6DFF::
    cp   $08
    jr   nc, label_6E18

label_6E03::
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_6DCA
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   [hl], $A3
    ld   a, [$FFF9]
    and  a
    jr   z, label_6E18
    ld   [hl], $7F

label_6E18::
    ret

label_6E19::
    db $C6, $C2, $C0, $C2, $F0, $B5, $A7, $28, 6, $3D, $E0, $B5, $C3, $B1, $6E

label_6E28::
    ld   a, [$FFCC]
    and  $80
    jp   z, label_6EB1
    call label_27F2
    ld   a, [WR1_GameplaySubtype]
    cp   $0B
    jr   z, label_6E94
    ld   a, $28
    ld   [$FFB5], a
    ld   a, $11
    ld   [$D6FF], a
    ld   a, [hIsGBC]
    and  a
    jr   nz, label_6E57
    ld   a, [label_789B]
    ld   [$DB98], a
    ld   a, [label_789F]
    ld   [$DB99], a
    ld   a, $04
    jr   label_6E62

label_6E57::
    ld   a, $01
    call label_8FA
    xor  a
    ld   [$DDD5], a
    ld   a, $08

label_6E62::
    ld   [$D013], a
    ld   a, $0D
    ld   [WR1_GameplaySubtype], a
    xor  a
    ld   [$C280], a
    ld   [$C281], a
    ld   [$C282], a
    ld   [$C283], a
    ld   [$C284], a
    ld   [rBGP], a
    ld   [$DB97], a
    ld   a, $10
    ld   [$C17E], a
    call label_739D
    ld   a, $0D
    ld   [$D368], a
    ld   [$D00F], a
    call label_7D4E
    jr   label_6EA8

label_6E94::
    jp   label_4552
    xor  a
    ld   [WR1_GameplaySubtype], a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [rBGP], a
    ld   [$DB97], a
    ld   hl, WR1_GameplayType
    inc  [hl]

label_6EA8::
    ld   a, $01
    ld   [rIE], a
    ld   a, $4F
    ld   [rLYC], a
    ret

label_6EB1::
    ld   a, [WR1_GameplaySubtype]
    cp   $03
    jr   c, label_6ED8
    cp   $05
    jr   nc, label_6ED8
    ld   a, [$D000]
    and  a
    jr   z, label_6EC6
    dec  a
    ld   [$D000], a

label_6EC6::
    rra
    nop
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_6E19
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    call label_8F0

label_6ED8::
    ld   a, [WR1_GameplaySubtype]
    rst  0
    ld    hl, sp+$6E
    ld   a, [hli]
    ld   l, a
    ld   [hl], $6F
    and  l
    ld   l, a
    or   d
    ld   [hl], b
    ld   a, [de]
    ld   [hl], c
    ld   e, b
    ld   [hl], c
    jp   label_7271

    db $72, $55, $73, $76, $73, $d0, $73, $3a
    db $74, $48, $74

    call label_29C1
    call label_27F2
    ld   a, $01
    call label_8FA
    ld   a, $1A
    call label_27C3
    ld   a, $02
    ld   [$D6FE], a
    xor  a
    ld   [$FFE7], a
    ld   a, $A2
    ld   [$C13D], a
    ld   a, [$FF40]
    and  $DF
    ld   [$D6FD], a
    ld   [rLCDC], a
    ld   a, $B4
    ld   [$D016], a
    xor  a
    ld   [$D017], a
    jp   label_44D6
    ld   a, $10
    ld   [$D6FE], a
    xor  a
    ld   [$DDD5], a
    jp   label_44D6
    call label_7D01
    ld   a, [hIsGBC]
    and  a
    jr   z, label_6F42
    ld   a, $25
    jr   label_6F44

label_6F42::
    ld   a, $0E

label_6F44::
    ld   [$D6FF], a
    ld   a, $1C
    ld   [$DB98], a
    ld   a, $E0
    ld   [$DB99], a
    ld   a, $03
    ld   [rIE], a
    ld   a, $00
    ld   [rLYC], a
    ld   e, $11
    ld   hl, $D000
    xor  a

label_6F5F::
    ldi  [hl], a
    dec  e
    jr   nz, label_6F5F
    ld   [$C280], a
    ld   [$C281], a
    ld   [$C3B0], a
    ld   [$C3B1], a
    ld   [$C3B2], a
    ld   [$FFED], a
    ld   a, $05
    ld   [$C282], a
    ld   a, $C0
    ld   [$C202], a
    ld   a, $4E
    ld   [$C212], a
    xor  a
    ld   [$C340], a
    ld   [$C341], a
    ld   [$C342], a
    ld   [$C343], a
    jp   label_44D6

label_6F93::
    add  a, c
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_6F9C::
    ld   [label_808], sp
    inc  b
    nop
    nop
    nop
    nop
    nop
    call label_7466
    call label_74D6
    ld   a, [$D002]
    and  a
    jr   z, label_7014
    inc  a
    ld   [$D002], a
    cp   $18
    jr   c, label_7013
    sub  a, $18
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_6F93
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_6F9C
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    call label_8D7
    ld   a, e
    cp   $08
    jp   nz, label_7013
    xor  a
    ld   [$C280], a
    ld   [$C281], a
    ld   [$C282], a
    ld   [$C290], a
    ld   a, $05
    ld   [WR1_GameplaySubtype], a
    ld   [$D00F], a
    call label_7D4E
    ld   a, $11
    ld   [$D6FE], a
    ld   a, $FF
    ld   [$D001], a
    xor  a
    ld   [$FF96], a
    ld   [$C100], a
    ld   [$C102], a
    ld   [$C103], a
    ld   a, $92
    ld   [$C101], a
    ld   a, $03
    ld   [rIE], a

label_7013::
    ret

label_7014::
    ld   a, [$C202]
    cp   $50
    jr   nz, label_7031
    ld   a, $FF
    ld   [rBGP], a
    ld   a, $04
    ld   [WR1_GameplaySubtype], a
    ld   a, $0F
    ld   [$D6FF], a
    ld   a, $01
    ld   [rIE], a
    xor  a
    ld   [$FF96], a
    ret

label_7031::
    call label_7D01
    ld   a, [hFrameCounter]
    and  $07
    jp   nz, label_70B1
    ld   hl, $FF96
    inc  [hl]
    ld   hl, $C200
    dec  [hl]
    inc  hl
    dec  [hl]
    inc  hl
    dec  [hl]
    ld   c, $00
    ld   a, [$FF96]
    cp   $10
    jr   z, label_7068
    inc  c
    cp   $30
    jr   z, label_7068
    inc  c
    cp   $38
    jr   z, label_7068
    inc  c
    cp   $58
    jr   z, label_7068
    inc  c
    cp   $5A
    jr   z, label_7068
    inc  c
    cp   $69
    jr   nz, label_70B1

label_7068::
    ld   e, $01
    ld   d, $00

label_706C::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_7087
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_706C
    ret

label_707B::
    db $28, $78, $60, $38, $68
    db $58 ; X

label_7081::
    db 4, 2, 1, 4, 3, 1

label_7087::
    ld   b, 0
    ld   hl, label_7081
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C280
    add  hl, de
    ld   [hl], a
    ld   hl, label_707B
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   [hl], $30
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20

label_70A9::
    ld   a, $1C
    ld   [$D000], a
    call label_C4B

label_70B1::
    ret
    call label_7466
    ld   a, [$D001]
    inc  a
    ld   [$D001], a
    cp   $80
    jr   nz, label_70C5
    push af
    call label_74C7
    pop  af

label_70C5::
    cp   $90
    jr   nz, label_70CC
    call label_70A9

label_70CC::
    cp   $A0
    jr   nz, label_70F7
    ld   a, $03
    ld   [WR1_GameplaySubtype], a ; Move back to sea sequence
    ld   a, [hIsGBC]
    and  a
    jr   z, label_70DE
    ld   a, $25
    jr   label_70E0

label_70DE::
    ld   a, $0E

label_70E0::
    ld   [$D6FF], a
    call label_7108
    ld   a, $03

label_70E8::
    ld   [rIE], a
    xor  a
    ld   [$C280], a
    ld   [$C281], a
    ld   a, $01
    ld   [$D002], a
    ret

label_70F7::
    ld   a, [hFrameCounter]
    and  $7F
    jr   nz, label_7107
    call GetRandomByte
    and  $00
    jr   nz, label_7107
    call label_70A9

label_7107::
    ret

label_7108::
    ld   hl, $DE01
    ld   a, $00
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    ld   a, $3A
    ldi  [hl], a
    ld   a, $01
    ld   [hl], a
    jp   label_BD7
    ld   a, $10
    ld   [$D6FF], a
    ld   a, $01
    ld   [$DDD5], a
    call label_44D6
    ret

label_7128::
    db 0, 0, 0, 0, $40, $40, $40, $80, $85, $85, $85, $C5, $C9, $C9, $C9, $C9

label_7138::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C

label_7148::
    db 0, 0, 0, 0, $40, $40, $40, $40, $90, $90, $90, $90

label_7154::
    ld   [$FFE0], a
    ld   [$FFE0], a
    call label_71C7
    ld   a, [$D001]
    cp   $A0
    jr   nz, label_7168
    push af
    ld   a, $02
    ld   [rLYC], a
    pop  af

label_7168::
    dec  a
    ld   [$D001], a
    jr   nz, label_7188
    ld   a, $07
    ld   [WR1_GameplaySubtype], a
    ld   a, $06
    ld   [$C280], a
    ld   a, $B0
    ld   [$C200], a
    ld   a, $68
    ld   [$C210], a
    ld   a, $01
    ld   [$C3D0], a
    ret

label_7188::
    cp   $34
    jr   nc, label_71C2
    and  $03
    jr   nz, label_719B
    ld   a, [$D010]
    cp   $0C
    jr   z, label_719B
    inc  a
    ld   [$D010], a

label_719B::
    ld   a, [hFrameCounter]
    and  $03
    ld   e, a
    ld   a, [$D010]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_7128
    add  hl, de
    ld   a, [hl]
    ld   [$DB97], a
    ld   hl, label_7138
    add  hl, de
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_7148
    add  hl, de
    ld   a, [hl]
    ld   [$DB99], a
    call label_8E6

label_71C2::
    ret
    call label_74D6
    ret

label_71C7::
    ld   a, [$C291]
    cp   $02
    jr   nc, label_71DE
    ld   a, [$C114]
    inc  a
    cp   $A0
    jr   nz, label_71DB
    ld   a, $0F
    ld   [$FFF4], a
    xor  a

label_71DB::
    ld   [$C114], a

label_71DE::
    ret

label_71DF::
    db $9A, $16, $F, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C
    db $8D, $8E, $8F, $9A, $36, $F, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99
    db $9A, $9B, $9C, $9D, $9E, $9F, $9A, $56, $F, $A0, $A1, $A2, $A3, $A4, $A5, $A6
    db $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF, $9A, $76, $F, $B0, $B1, $B2, $B3
    db $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, $9A, $96, $F, $C0
    db $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, $9A
    db $B6, $F, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD
    db $DE, $DF, $9A, $D6, $F, $E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA
    db $EB, $EC, $ED, $EE, $EF

label_7264::
    db $18, $72

label_7266::
    db 5, $72, $2B, $72, $F2, $71, $3E, $72, $DF, $71, $51

label_7271::
    ld   [hl], d
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_7264
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   hl, $D601
    ld   c, $13

label_7286::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_7286
    ld   [hl], $00
    ld   a, [hIsGBC]
    and  a
    jr   z, label_7296
    call label_7338

label_7296::
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    cp   $07
    jr   nz, label_72A4
    call label_44D6

label_72A4::
    ret
    sbc  a, d
    ld   d, $0F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    ld   [hl], $0F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    ld   d, [hl]
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_72D8::
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    db $76, $0f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    sub  a, [hl]
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    or   [hl]
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    sub  a, $0F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_732A::
    sbc  a, $72
    bit  6, d
    pop  af
    ld   [hl], d
    cp   b
    ld   [hl], d
    inc  b
    ld   [hl], e
    and  l
    ld   [hl], d
    rla
    ld   [hl], e

label_7338::
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_732A
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   hl, $DC91
    ld   c, $13

label_734C::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_734C
    ld   [hl], $00
    ret
    ld   a, [$C17E]
    cp   $10
    jr   c, label_7363
    ld   a, $19
    ld   [$FFF4], a
    call label_44D6

label_7363::
    ret

label_7364::
    sbc  a, e
    or   a
    dec  c
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    nop
    ld   de, label_7364
    ld   hl, $D601
    ld   c, $12

label_737E::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_737E
    ld   a, [hIsGBC]
    and  a
    jr   nz, label_738E
    call label_79AE
    jr   label_7395

label_738E::
    xor  a
    call label_79C2
    call label_73B1

label_7395::
    ld   a, $3C
    ld   [$D015], a
    call label_44D6

label_739D::
    ld   a, $A0
    ld   [$D001], a
    xor  a
    ld   [$D002], a
    ld   a, $FF
    ld   [$D003], a
    ret

label_73AC::
    sbc  a, e
    or   a
    ld   c, l
    rlca
    nop

label_73B1::
    ld   de, label_73AC
    ld   hl, $DC91
    ld   c, $12

label_73B9::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_73B9
    ret

label_73C0::
    db $18, $18, $38, $40, $58, $60, $80, $88

label_73C8::
    db $20, $48, $44, $28, $44, $28, $28, $40

label_73D0::
    call label_74D6
    call label_7920
    ld   a, [hFrameCounter]
    and  $3F

label_73DA::
    jr   nz, label_7418
    ld   e, $01
    ld   d, $00

label_73E0::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_73F0
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_73E0
    jr   label_7418

label_73F0::
    ld   [hl], $08
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $3F
    ld   a, [$D003]
    inc  a
    ld   [$D003], a
    and  $07
    ld   c, a
    ld   b, $00

label_7404::
    ld   hl, label_73C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_73C8

label_7411::
    add  hl, bc

label_7412::
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_7418::
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    and  $0F
    jr   nz, label_7439
    ld   a, [$D001]
    dec  a
    ld   [$D001], a
    jr   nz, label_7439
    call label_44D6
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    call label_27EA

label_7439::
    ret
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_7447
    jp   label_6162

label_7447::
    ret
    ld   a, $11
    ld   [$D6FE], a
    ld   a, $0B
    ld   [WR1_GameplaySubtype], a
    ld   a, $C9
    ld   [$DB97], a
    ld   a, $1C
    ld   [$DB98], a
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    dec  a
    ld   [$D018], a
    ret

label_7466::
    call GetRandomByte
    and  $18
    add  a, $10
    ld   [$FFD8], a
    call GetRandomByte
    and  $18
    add  a, $10
    ld   [$FFD7], a
    ld   hl, $C04C
    ld   c, $10
    ld   a, [WR1_GameplaySubtype]
    cp   $04
    jr   nz, label_7486
    ld   c, $15

label_7486::
    ld   a, [$FFD8]
    ldi  [hl], a
    ld   a, [$FFD7]
    ldi  [hl], a
    call GetRandomByte
    and  $01
    ld   a, $28
    jr   z, label_749C
    call GetRandomByte
    and  $06
    add  a, $70

label_749C::
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, [$FFD7]
    add  a, $1C
    ld   [$FFD7], a
    cp   $A0
    jr   c, label_74B4
    sub  a, $98
    ld   [$FFD7], a
    ld   a, [$FFD8]
    add  a, $25
    ld   [$FFD8], a

label_74B4::
    dec  c
    jr   nz, label_7486
    ret

label_74B8::
    db $99, $2B, $83, $1E, $20, $22, $24, $99, $2C, $83, $1F, $21, $23, $25, 0

label_74C7::
    ld   de, $D601
    ld   hl, label_74B8
    ld   c, $0F

label_74CF::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_74CF
    ret

label_74D6::
    xor  a
    ld   [$C3C0], a
    ld   c, $02
    ld   b, $00

label_74DE::
    ld   a, c
    ld   [$C123], a
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_7509
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEC], a
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF1], a
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF0], a
    call label_7510

label_7509::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_74DE
    ret

label_7510::
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   z, label_7568
    cp   $06
    jp   z, label_765F
    cp   $07
    jp   z, label_7A2F
    cp   $08
    jp   z, label_77DD
    call label_C05
    jr   nz, label_7533
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_7533::
    dec  [hl]
    call label_762B
    ret

label_7538::
    db 0, 0

label_753A::
    db $1C, 2, 0, 8, $1E, 2, $10, $F8, $20, 2, $10, 0

label_7546::
    db $22, 2, $10, 8, $24, 2, $10, $10, $26, 2

label_7550::
    db $F8, 4, $32, 1, $E8, 4, $32, 1, $D8, 4, $32, 1, $C8, 4, $32, 1

label_7560::
    db 2, 1, 0, 0, 0, 1, 2, 2

label_7568::
    ld   a, [$D002]
    and  a
    ld   a, $00
    jr   nz, label_757A
    ld   a, [hFrameCounter]
    add  a, $D0
    rra
    rra
    rra
    rra
    and  $07

label_757A::
    ld   e, a
    ld   d, $00
    ld   hl, label_7560
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_7538
    ld   de, $C000
    push bc
    ld   c, $06

label_7590::
    ld   a, [$FFEC]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ld   a, [$FFEE]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_7590
    ld   a, [$D002]
    cp   $10
    jr   c, label_75C9
    ld   hl, label_7550
    ld   de, $C018
    ld   c, $04

label_75B4::
    ld   a, [$FFEC]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ld   a, [$FFEE]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_75B4

label_75C9::
    pop  bc
    ret

label_75CB::
    db 0, 0, $34, 1, 0, 8

label_75D1::
    db $36, 1, $10, 0, $2C, 1, $20, $F8, $2C, 1, $28, 0, $2E, $21, $30, $F0
    db $2E, 1, 8, 0, $36, $21, 8, 8, $34, $21, $18, 0, $30, 1, $18, 8
    db $2C, $21, $28, $10, $2E, $21, $28, $10

label_75F9::
    db $2E, $21, 0, 8, $34, $21, 0, 0, $36, $21, $10, 8, $2C, $21, $20, $10
    db $2C

label_7609::
    db $21, $28, 8, $2E, 1, $30, $18, $2E, $21, 8, 8, $36, 1, 8, 0, $34
    db 1, $18, 8, $30, $21, $18, 0

label_7621::
    inc  l
    ld   bc, $F828
    ld   l, $01
    jr   z, label_7621

label_7629::
    ld   l, $01

label_762B::
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    dec  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_75CB

label_7640::
    add  hl, de
    ld   c, $06
    call label_3CE6
    ld   a, [$C3C0]
    add  a, $18
    ld   [$C3C0], a
    ret

label_764F::
    db 0, 3, 2, 3, 4, 3, 6, 3, 8, 3, $A, 3, $C, 3, $E, 3

label_765F::
    call label_71C7
    xor  a
    ld   [$C340], a
    ld   de, label_764F
    call label_3BC0
    ld   a, [$C3C0]
    add  a, $08
    ld   [$C3C0], a
    ld   a, [$FFF0]
    rst  0
    dw $7681
    dw $76ab
    dw $76d6
    dw $7711
    dw $7781

    call label_7D9C
    ld   a, [hFrameCounter]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFEE]
    cp   $48
    jr   nc, label_769C
    call label_C05
    ld   [hl], $40
    call label_3B12

label_769C::
    ld   hl, $C3D0
    add  hl, bc
    dec  [hl]
    jr   nz, label_76AA
    ld   [hl], $04
    ld   hl, $C200
    add  hl, bc
    dec  [hl]

label_76AA::
    ret
    call label_7D46
    ld   a, $01
    call label_3B0C
    call label_C05
    jr   nz, label_76D4
    call label_3B12
    ld   a, $07
    ld   [$C281], a
    ld   a, $FE
    ld   [$C201], a
    ld   a, $6E
    ld   [$C211], a
    xor  a
    ld   [$C291], a
    ld   [$C2E1], a
    ld   [hFrameCounter], a
    ret

label_76D4::
    dec  [hl]
    ret
    call label_7D9C
    ld   a, [$C201]
    dec  a
    ld   [$C201], a
    ld   a, [hFrameCounter]
    and  $01
    jr   nz, label_7707
    ld   hl, $FF96
    inc  [hl]
    ld   a, [hl]
    cp   $30
    jr   nz, label_76F7
    call label_C05
    ld   [hl], $40
    jp   label_3B12

label_76F7::
    cp   $20
    jr   nz, label_76FF
    call label_7A16
    xor  a

label_76FF::
    cp   $22
    jr   nz, label_7707
    call label_7A11
    xor  a

label_7707::
    ld   a, [hFrameCounter]
    rra
    rra
    and  $01
    call label_3B0C
    ret
    call label_C05
    jr   nz, label_7778
    call label_7DCF
    ld   a, [hFrameCounter]
    and  $01
    jr   nz, label_776C
    ld   a, [$C201]
    dec  a
    ld   [$C201], a
    ld   a, [hFrameCounter]
    and  $03
    jr   nz, label_776C
    ld   hl, $FF96
    inc  [hl]
    ld   a, [hl]
    cp   $40
    jr   z, label_7740
    cp   $3A
    jr   nz, label_7745
    call label_C05
    ld   [hl], $30
    jr   label_7745

label_7740::
    call label_C05
    ld   [hl], $50

label_7745::
    ld   a, [$FF96]
    cp   $56
    jr   nz, label_775C
    ld   a, $A0
    ld   [hl], a
    ld   [rSCX], a
    ld   a, $01
    ld   [rIE], a
    call label_C05
    ld   [hl], $E0
    jp   label_3B12

label_775C::
    cp   $20
    jr   nz, label_7764
    call label_7A16
    xor  a

label_7764::
    cp   $22
    jr   nz, label_776C
    call label_7A11
    xor  a

label_776C::
    ld   a, [hFrameCounter]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ret

label_7778::
    dec  [hl]
    call label_7D46
    ld   a, $01
    jp   label_3B0C
    call label_7D46
    ld   a, [hFrameCounter]
    and  $01
    jr   nz, label_77BC
    ld   a, $02
    call label_3B0C
    ld   a, $00
    ld   [$C3B1], a
    call label_C05
    jr   z, label_779A
    dec  [hl]

label_779A::
    cp   $A0
    jr   nc, label_77BC
    cp   $90
    jr   nc, label_77B2
    cp   $50
    jr   nc, label_77BC
    cp   $4A
    jr   nc, label_77B2
    cp   $3C
    jr   nc, label_77BC
    cp   $36
    jr   c, label_77BC

label_77B2::
    ld   a, $03
    call label_3B0C
    ld   a, $01
    ld   [$C3B1], a

label_77BC::
    ret

label_77BD::
    jr   c, label_77BF

label_77BF::
    db $38, $20, $3a, $00, $3a, $20, $3a, $00
    db $3a, $20, $3c, $00, $3e, $00, $3c, $00
    db $3e, $00, $3a, $00, $3a, $20, $3a, $00
    db $3a, $20, $38, $00, $38, $20


label_77DD::
    xor  a
    ld   [$C3C1], a

label_77E1::
    call label_C05
    dec  [hl]
    jr   nz, label_77ED
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_77ED::
    ld   a, [hl]
    rra
    rra
    rra
    and  $07
    ld   [$FFF1], a
    xor  a
    ld   [$C340], a
    ld   de, label_77BD
    call label_3BC0
    ld   a, [$C3C0]
    add  a, $08
    ld   [$C3C0], a
    ret

label_7808::
    db   $10, $18, $2e, $05, $00, $18, $2c, $05

label_7810::
    db   $10, $10

label_7812::
    db $2A, 5, 0, $10, $28, 5, $10, 8, $26, 5, 0, 8, $24, 5, $10, 0
    db $22, 5, 0, 0, $20, 5

label_7828::
    db 0, $28, $52, $16, 0

label_782D::
    db $20, $50, $16, $10, $18, $4E, $16, 0, $18, $4C, $16, $10, $10, $4A

label_783B::
    db $16, 0, $10, $48, $16, $10, 8, $46, $16, 0, 8, $44, $16, $10, 0, $42
    db $16, 0, 0, $40, $16

label_7850::
    db $10, $18, $2E, 5, 0, $18, $2C, 5, $10, $10, $2A, 5, 0, $10, $28, 5
    db $10, 8, $26, 5, 0, 8, $24, 5, $10, 0, $22, 5, 0, 0, $20, 5

label_7870::
    db 0, $28, $52, $16, 0

label_7875::
    db $20, $50, $16, $10, $18, $4E, $16, 0

label_787D::
    db $18, $4C

label_787F::
    db $16, $10

label_7881::
    db   $10, $4A ; Undefined instruction

label_7883::
    db $16, 0, $10, $48, $16, $10, 8, $46, $16, 0, 8, $44, $16, $10, 0, $42
    db $16, 0, 0, $40, $16

label_7898::
    db $54, $58, $68

label_789B::
    db $1C

label_789C::
    db 0, 4

label_789E::
    db $18

label_789F::
    db $6C ; l

label_78A0::
    db $f5, $7a, $8d, $7d, $8d, $7d, $8d, $7d
    db $f5, $7a, $ff, $7f, $ff, $7f, $ff, $7f
    db $f5, $7a, $6c, $6d, $8d, $71, $cf, $75
    db $f5, $7a, $7b, $6f, $bd, $73, $ff, $77
    db $f5, $7a, $2a, $5d, $8e

label_78C5::
    ld   h, l
    ld   [de], a

label_78C7::
    ld   l, [hl]
    push af

label_78C9::
    ld   a, d
    rst  $30

label_78CB::
    db $5E, $5B, $67, $DF, $6F, $F5, $7A, $E8, $48, $8E, $59, $54, $66, $F5, $7A, $52
    db $4A, $19, $5B, $BF, $67, $F5, $7A, $C6, $38, $8F, $49, $97, $5A, $F5, $7A, $CE
    db $39, $B7, $4A, $BF, $5B, $F5, $7A, $84, $24, $8F, $3D, $D9, $52, $F5, $7A, $29
    db $25, $75, $3E, $9F, $53, $F5, $7A, $42, $14, $90, $31, $1C, $4B, $F5, $7A, $A5
    db $14

label_790C::
    db $13, $32, $7F, $4B, $F5, $7A, 0, 0, $B1, $21, $5F, $3F, $F5, $7A, 0, 0
    db $B1, $21, $5F, $3F

label_7920::
    ld   hl, $D015
    ld   a, [hl]
    and  a
    jr   z, label_7929
    dec  [hl]
    ret

label_7929::
    ld   a, $78
    ld   [$FFEE], a
    ld   hl, $D018
    ld   a, $59
    add  a, [hl]
    ld   [$FFEC], a
    ld   a, [hIsGBC]
    and  a
    jr   nz, label_795D
    ld   a, [$D013]
    cp   $04
    jr   z, label_797D
    ld   hl, $D014
    inc  [hl]
    ld   a, [hl]
    cp   $0C
    jp   nz, label_7997
    xor  a
    ld   [hl], a
    ld   hl, $D013
    inc  [hl]
    ld   a, [hl]
    cp   $04
    jp   z, label_7997
    call label_79AE
    jp   label_7997

label_795D::
    ld   a, [$D013]
    cp   $08
    jr   z, label_797D
    ld   hl, $D014
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   nz, label_797D
    xor  a
    ld   [hl], a
    ld   hl, $D013
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   z, label_797D
    call label_79C2
    jr   label_797D

label_797D::
    ld   a, [hIsGBC]
    and  a
    jr   z, label_7997
    ld   a, [$D013]
    cp   $08
    jr   z, label_7990
    ld   hl, label_7850
    ld   c, $12
    jr   label_79AA

label_7990::
    ld   hl, label_7870
    ld   c, $0A
    jr   label_79AA

label_7997::
    ld   a, [$D013]
    cp   $03
    jr   nc, label_79A5
    ld   hl, label_7808
    ld   c, $12
    jr   label_79AA

label_79A5::
    ld   hl, label_7828
    ld   c, $0A

label_79AA::
    call label_3CE6
    ret

label_79AE::
    ld   b, $00
    ld   c, a
    ld   hl, label_7898
    add  hl, bc
    ld   a, [hl]
    ld   [$DB98], a
    ld   hl, label_789C
    add  hl, bc
    ld   a, [hl]
    ld   [$DB99], a
    ret

label_79C2::
    sla  a
    sla  a
    sla  a
    sla  a
    ld   b, $00
    ld   c, a
    ld   hl, label_78A0
    add  hl, bc
    ld   bc, $DC78
    ld   e, $10

label_79D6::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    dec  e
    jr   nz, label_79D6
    ld   a, $14
    ld   [$DDD3], a
    ld   a, $08
    ld   [$DDD4], a
    ld   a, $82
    ld   [$DDD1], a
    ret

label_79EC::
    sbc  a, b
    nop
    ld   b, e
    ld   a, l
    sbc  a, b
    jr   nz, label_7A36
    ld   a, l
    sbc  a, b
    ld   b, b
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   h, b
    ld   b, e
    ld   a, l
    nop

label_79FD::
    sbc  a, b
    inc  b
    inc  bc
    ld   a, l
    ld   a, l
    ld   c, h
    ld   c, l
    sbc  a, b
    inc  h
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   b, h
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   h, h
    ld   b, e
    ld   a, l
    nop

label_7A11::
    ld   hl, label_79FD
    jr   label_7A19

label_7A16::
    ld   hl, label_79EC

label_7A19::
    ld   de, $D601
    push bc
    ld   c, $18

label_7A1F::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_7A1F
    pop  bc
    ret

label_7A27::
    stop
    ld   [de], a
    nop
    inc  d
    nop
    ld   d, $00

label_7A2F::
    ld   a, [$FFEE]
    cp   $F0
    jr   nc, label_7A47
    xor  a

label_7A36::
    ld   [$C340], a
    ld   de, label_7A27
    call label_3BC0
    ld   a, [$C3C0]
    add  a, $08
    ld   [$C3C0], a

label_7A47::
    ld   a, [$FFF0]
    rst  0
    dw $7a52
    dw $7a5e
    dw $7a6e
    dw $7ac4

    call label_C05
    dec  [hl]
    jr   nz, label_7A5D
    ld   [hl], $90
    call label_3B12

label_7A5D::
    ret
    ld   a, [hFrameCounter]
    and  $03
    jr   nz, label_7A6A
    call label_C05
    dec  [hl]
    jr   z, label_7A6B

label_7A6A::
    ret

label_7A6B::
    jp   label_3B12
    ld   a, [$D00A]
    cp   $13
    jr   z, label_7AB3
    ld   a, [$D00E]
    inc  a
    ld   [$D00E], a
    and  $03
    jr   nz, label_7AB2
    ld   a, [$C210]
    cp   $A0
    jr   nc, label_7A8B
    inc  a
    ld   [$C210], a

label_7A8B::
    ld   a, [$C211]
    cp   $A0
    jr   nc, label_7A96
    inc  a
    ld   [$C211], a

label_7A96::
    ld   a, [$FF97]
    push af
    dec  a
    ld   [$FF97], a
    pop  af
    and  $07
    jr   nz, label_7AB2
    push bc
    call label_7C60
    pop  bc
    ld   a, [$D00A]
    cp   $0B
    jr   nz, label_7AB2
    ld   a, $01
    ld   [$D368], a

label_7AB2::
    ret

label_7AB3::
    call label_3B12
    call label_C05
    ld   [hl], $17
    ld   a, $07
    ld   [$FFA9], a
    ld   a, $70
    ld   [$FFAA], a
    ret
    ld   a, [hFrameCounter]
    and  $03
    jr   nz, label_7AE3
    call label_C05
    dec  [hl]
    jr   nz, label_7AE3
    call label_44D6
    xor  a
    ld   [$D002], a
    ld   [$D003], a
    ld   [$D004], a
    ld   [$C280], a
    ld   [$C281], a

label_7AE3::
    ret

label_7AE4::
    db $7c, $7c, $44, $45, $7d, $7d, $7d, $7d
    db $7d, $7d, $7d, $7d, $7d, $7d, $7d, $7d
    db $4c, $4d, $7c, $7c, $7c, $7c, $7c, $7c
    db $44, $45, $7d, $2d, $2e, $2d, $2e, $2d
    db $2e, $7d, $4c, $4d, $7c, $7c, $7c, $7c
    db $7c, $7c, $7c, $7c, $7c, $77, $46, $7e
    db $7e, $7e, $7e, $7e, $7e, $4b, $79, $7c
    db $7c, $7c, $7c, $7c, $7c, $7c, $7c, $77
    db $75, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $75, $78, $7c, $7c, $7c
    db $7c, $7c, $77, $7a, $7a, $74, $73, $74
    db $5c, $5d, $5e, $5f, $73, $74, $73, $7a
    db $7e, $78, $7c, $7c, $7c, $7c, $73, $75
    db $78, $77, $78, $79, $58, $59, $5a, $5b
    db $79, $79, $77, $75, $7e, $74, $7c, $7c
    db $7c, $7c, $7c, $73, $74, $76, $73, $7a
    db $54, $55, $56, $57, $7a, $74, $76, $73
    db $74, $7c, $7c, $7c, $77, $78, $7c, $79
    db $7c, $7c, $7c, $7c, $50, $51, $52, $53
    db $7c, $7c, $7c, $7c, $7c, $7c, $77, $78
    db $7e, $7e, $75, $7e, $78, $77, $75, $78
    db $79, $2b, $2c, $79, $79, $77, $75, $78
    db $77, $75, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e


label_7C60::
    ld   a, [$D00A]
    and  a
    jr   nz, label_7C70
    ld   a, $F4
    ld   [$D00B], a
    ld   a, $9B
    ld   [$D00C], a

label_7C70::
    ld   a, [$D00A]
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   a, e
    sla  e
    rl   d
    sla  e
    rl   d
    add  a, e
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ld   c, $00
    ld   hl, $D601
    ld   a, [$D00C]
    ldi  [hl], a
    ld   a, [$D00B]
    ldi  [hl], a
    ld   a, $13
    ldi  [hl], a

label_7C9D::
    push hl
    ld   hl, label_7AE4
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    inc  de
    inc  c
    ld   a, c
    cp   $14
    jr   nz, label_7C9D
    ld   [hl], $00
    ld   a, [hIsGBC]
    and  a
    jr   z, label_7CB6
    call label_7CCB

label_7CB6::
    ld   hl, $D00A
    inc  [hl]
    ld   a, [$D00B]
    sub  a, $20
    ld   [$D00B], a
    ld   a, [$D00C]
    sbc  a, $00
    ld   [$D00C], a
    ret

label_7CCB::
    ld   hl, $DC91
    ld   a, [$D00C]
    ldi  [hl], a
    ld   a, [$D00B]
    sub  a, $14
    ldi  [hl], a
    ld   a, $5F
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   [hl], $00
    ret

label_7CE1::
    db 0, $50, $80, $50, 0, $51, $80, $51

label_7CE9::
    db 0, $52, $80, $52, 0, $53, $80, $53

label_7CF1::
    db 0, 2, 4, 6, 6, 4, 2, 0

label_7CF9::
    db 3, 2, 1, 0, 0, 1, 2, 3

label_7D01::
    ld   hl, $C100
    ld   a, [hFrameCounter]
    and  $07
    jr   nz, label_7D0B
    inc  [hl]

label_7D0B::
    inc  hl
    ld   a, [hFrameCounter]
    and  $0F
    jr   nz, label_7D13
    inc  [hl]

label_7D13::
    inc  hl
    ld   a, [hFrameCounter]
    and  $1F
    jr   nz, label_7D1B
    inc  [hl]

label_7D1B::
    inc  hl
    ld   a, [hFrameCounter]
    and  $0F
    jr   nz, label_7D23
    inc  [hl]

label_7D23::
    inc  hl
    ld   a, [$D004]
    add  a, $28
    ld   [$D004], a
    jr   nc, label_7D2F
    inc  [hl]

label_7D2F::
    ld   a, [hFrameCounter]
    add  a, $FC
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, label_7CF9
    add  hl, de
    ld   a, $00
    sub  a, [hl]
    ld   [$C106], a

label_7D46::
    ld   a, [hFrameCounter]
    and  $0F
    cp   $04
    jr   c, label_7D9B

label_7D4E::
    ld   a, [hFrameCounter]
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, label_7CF1
    add  hl, de
    ld   e, [hl]
    ld   hl, label_7CE1
    ld   a, [$D00F]
    and  a
    jr   z, label_7D6A
    ld   hl, label_7CE9

label_7D6A::
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $8900
    ld   a, [$D00F]
    and  a
    jr   z, label_7D7A
    ld   de, $9300

label_7D7A::
    ld   a, [hFrameCounter]
    and  $03
    sla  a
    sla  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    add  a, l
    ld   l, a
    ld   a, l
    ld   [$D006], a
    ld   a, h
    ld   [$D007], a
    ld   a, e
    ld   [$D008], a
    ld   a, d
    ld   [$D009], a

label_7D9B::
    ret

label_7D9C::
    ld   hl, $C100
    ld   a, [hFrameCounter]
    and  $07
    jr   nz, label_7DA6
    inc  [hl]

label_7DA6::
    ld   hl, $C101
    ld   a, [$D004]
    add  a, $50
    ld   [$D004], a
    jr   nc, label_7DB4
    inc  [hl]

label_7DB4::
    inc  hl
    ld   a, [$D005]
    add  a, $58
    ld   [$D005], a
    jr   nc, label_7DC0
    inc  [hl]

label_7DC0::
    inc  hl
    ld   a, [$D00D]
    add  a, $B0
    ld   [$D00D], a
    jr   nc, label_7DCC
    inc  [hl]

label_7DCC::
    jp   label_7D46

label_7DCF::
    ld   hl, $C100
    ld   a, [hFrameCounter]
    and  $0F
    jr   nz, label_7DD9
    inc  [hl]

label_7DD9::
    ld   hl, $C101
    ld   a, [$D004]
    add  a, $28
    ld   [$D004], a
    jr   nc, label_7DE7
    inc  [hl]

label_7DE7::
    inc  hl
    ld   a, [$D005]
    add  a, $2C
    ld   [$D005], a
    jr   nc, label_7DF3
    inc  [hl]

label_7DF3::
    inc  hl
    ld   a, [$D00D]
    add  a, $58
    ld   [$D00D], a
    jr   nc, label_7DFF
    inc  [hl]

label_7DFF::
    jp   label_7D46

