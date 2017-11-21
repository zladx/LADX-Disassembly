section "bank24",romx,bank[$18]
    ld   a, [$C116]
    and  a
    jr   nz, label_6000F
    inc  a
    ld   [$C116], a
    ld   a, $14
    ld   [$D6FF], a

label_6000F::
    ld   a, [$FFEE]
    cp   $48
    jp   nz, label_60373
    call label_6035A
    call label_63D36
    ld   a, [$FFF0]
    rst  0
    dec  l
    ld   b, b
    sub  a, a
    ld   b, b
    rst  $10
    ld   b, b
    call z, label_61241
    ld   b, d
    ld   l, e
    ld   b, d
    and  l
    ld   b, d
    xor  a
    ld   [$D201], a
    ld   a, [$DB49]
    and  $01
    jr   z, label_6004A
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $28
    cp   $50
    call label_63DA0
    jr   nc, label_6007C
    jp   label_602B2

label_6004A::
    ld   a, [$FF99]
    cp   $4C
    jr   nc, label_6007C
    ld   a, $4C
    ld   [$FF99], a
    call label_178E
    call label_CAF
    ld   e, $0B
    ld   hl, $DB00

label_6005F::
    ld   a, [hli]
    cp   $09
    jr   z, label_60074
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_6005F
    ld   a, $DB
    call label_60087
    call label_3B12
    ld   [hl], b
    ret

label_60074::
    ld   a, $DC
    call label_60087
    call label_3B12

label_6007C::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_60087::
    ld   e, a
    ld   a, [$FF99]
    push af
    ld   a, $10
    ld   [$FF99], a
    ld   a, e
    call label_2385
    pop  af
    ld   [$FF99], a
    ret
    call label_6007C
    ld   a, [$C19F]
    and  a
    jr   nz, label_600D6
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   z, label_600AF

label_600A9::
    ld   [hl], b
    ld   a, $DE
    jp   label_60087

label_600AF::
    ld   a, [$DB5D]
    cp   $03
    jr   c, label_600A9
    ld   a, [$DB92]
    add  a, $2C
    ld   [$DB92], a
    ld   a, [$DB91]
    adc  a, $01
    ld   [$DB91], a
    call label_C05
    ld   [hl], $FF
    call label_27F2
    call label_605A0
    ld   a, $01
    ld   [$C500], a

label_600D6::
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    jr   nz, label_600F0
    ld   a, $35
    ld   [$D368], a
    ld   a, $01
    ld   [$D215], a
    jp   label_3B12

label_600F0::
    ret

label_600F1::
    ld   a, $30
    ld   [$FFCD], a
    ld   a, $18
    ld   [$FFCE], a
    jp   label_6049D

label_600FC::
    ld   a, $30
    ld   [$FFCD], a
    ld   a, $68
    ld   [$FFCE], a
    jp   label_6049D

label_60107::
    ld   a, $38
    ld   [$FFCE], a
    ld   a, $08
    ld   [$FFCD], a
    jp   label_60402

label_60112::
    ld   a, $38
    ld   [$FFCE], a
    ld   a, $08
    ld   [$FFCD], a
    jp   label_6044E
    ret

label_6011E::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_402
    inc  bc
    ld   bc, label_402
    inc  bc
    ld   bc, label_402
    inc  bc
    ld   bc, label_402
    inc  bc
    ld   bc, label_402
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  bc
    ld   bc, label_402
    inc  bc
    ld   bc, label_402
    inc  bc
    ld   bc, label_402
    inc  bc
    ld   bc, label_402
    inc  bc
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a

label_60158::
    ld   bc, label_501
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   bc, label_401
    ld   bc, $0105
    inc  b
    ld   bc, $0105

label_6016A::
    inc  b
    ld   bc, $0105
    inc  b
    ld   bc, $0105
    inc  b
    ld   bc, label_505
    dec  b
    dec  b
    ld   bc, label_501
    ld   bc, $0104
    dec  b
    ld   bc, $0104
    dec  b
    ld   bc, $0104
    dec  b
    ld   bc, $0104
    dec  b
    ld   bc, label_404
    inc  b
    inc  b
    inc  b
    inc  b

label_60192::
    ld   bc, $0101
    ld   bc, label_505
    dec  b
    dec  b
    ld   bc, $0101
    ld   bc, $0104
    dec  b
    ld   bc, $0104
    dec  b
    ld   bc, $0104
    dec  b
    ld   bc, $0104
    dec  b
    ld   bc, $0104
    dec  b
    dec  b
    ld   bc, $0101
    ld   bc, $0105
    inc  b
    ld   bc, $0105
    inc  b
    ld   bc, $0105
    inc  b
    ld   bc, $0105
    inc  b
    ld   bc, $0105
    inc  b
    inc  b
    inc  b
    inc  b
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$D211]
    and  a
    jr   nz, label_601F9
    ld   a, [$D210]
    cp   $00
    call z, label_60107
    ld   a, [$D210]
    cp   $01
    call z, label_60112
    ld   a, [$D210]
    cp   $38
    call z, label_600F1
    ld   a, [$D210]
    cp   $70
    call z, label_600FC

label_601F9::
    ld   a, [$D210]
    add  a, $01
    ld   [$D210], a
    ld   e, a
    ld   a, [$D211]
    adc  a, $00
    ld   [$D211], a
    ld   d, a
    cp   $06
    jr   nz, label_60220
    ld   a, e
    cp   $20
    jr   nz, label_60220
    ld   a, $DD
    call label_60087
    xor  a
    ld   [$C500], a
    jp   label_3B12

label_60220::
    ld   a, [$D212]
    inc  a
    cp   $1C
    jr   nz, label_60230
    ld   a, [$D213]
    inc  a
    ld   [$D213], a
    xor  a

label_60230::
    ld   [$D212], a
    ld   a, [$D213]
    ld   e, a
    ld   d, b
    ld   hl, label_6011E
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, label_60158
    add  hl, de
    ld   a, [hl]
    ld   [$C3B1], a
    ld   hl, label_60192
    add  hl, de
    ld   a, [hl]
    ld   [$C3B2], a
    ret
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_60268
    ld   [$D215], a
    call label_C05
    ld   [hl], $70
    ld   a, $10
    ld   [$D368], a
    call label_3B12

label_60268::
    jp   label_6007C
    call label_C05
    jr   nz, label_6027D
    ld   a, $02
    ld   [$DB4A], a
    ld   hl, $DB49
    set  0, [hl]
    jp   label_3B12

label_6027D::
    cp   $08
    jr   nz, label_60287
    dec  [hl]
    ld   a, $DF
    call label_60087

label_60287::
    ld   a, $6C
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, [$FF98]
    ld   [$FFEE], a
    ld   a, [$FF99]
    sub  a, $0C
    ld   [$FFEC], a
    ld   de, label_6074D
    xor  a
    ld   [$FFF1], a
    call label_3C77
    jp   label_6007C
    ld   a, [$C19F]
    and  a
    jr   nz, label_602B7
    ld   [$C167], a
    call label_3B12
    ld   [hl], b

label_602B2::
    ld   a, $E0
    call label_60087

label_602B7::
    jp   label_6007C

label_602BA::
    nop
    nop
    ld   h, b
    nop
    nop
    ld   [$0062], sp
    nop
    db   $10
    db   $64
    nop
    nop
    jr   label_6032F
    nop
    stop
    ld   l, b
    nop
    db   $10
    db   $08
    ld   l, d
    nop
    db   $10
    db   $10
    ld   l, h
    nop
    db   $10
    db   $18
    ld   l, [hl]
    nop
    nop
    nop
    ld   [hl], b
    nop
    nop
    ld   [$0072], sp
    nop
    db   $10
    db   $74
    nop
    nop
    jr   label_6035F
    nop
    stop
    ld   l, b
    nop
    db   $10
    db   $08
    ld   l, d
    nop
    db   $10
    db   $10
    ld   l, h
    nop
    db   $10
    db   $18
    ld   l, [hl]
    nop
    nop
    nop
    ld   a, b
    nop
    nop
    ld   [$007A], sp
    nop
    db   $10
    db   $7C
    nop
    nop
    jr   label_60387
    nop
    stop
    ld   l, b
    nop
    db   $10
    db   $08
    ld   l, d
    nop
    db   $10
    db   $10
    ld   l, h
    nop
    db   $10
    db   $18
    ld   l, [hl]
    nop
    nop
    nop
    ld   a, [hl]
    jr   nz, label_6031F

label_6031F::
    ld   [label_207C], sp
    nop
    db   $10
    db   $7A
    jr   nz, label_60327

label_60327::
    jr   label_603A1
    jr   nz, label_6033B
    nop
    ld   l, [hl]
    jr   nz, label_6033F

label_6032F::
    ld   [label_206C], sp
    db   $10
    db   $10
    ld   l, d
    jr   nz, label_60347
    jr   label_603A1
    jr   nz, label_6033B

label_6033B::
    nop
    db   $76 ; Halt
    jr   nz, label_6033F

label_6033F::
    ld   [label_2074], sp
    nop
    db   $10
    db   $72
    jr   nz, label_60347

label_60347::
    jr   label_603B9
    jr   nz, label_6035B

label_6034B::
    nop
    ld   l, [hl]
    jr   nz, label_6035F
    ld   [label_206C], sp
    db   $10
    db   $10
    ld   l, d
    jr   nz, label_60367
    jr   label_603C1
    jr   nz, label_6034B

label_6035B::
    pop  af
    rla
    rla
    rla

label_6035F::
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_602BA
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   a, $04
    jp   label_3DA0

label_60373::
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $4A
    ld   hl, $C350
    add  hl, bc
    ld   [hl], $98
    call label_3AEA
    call label_603E3
    call label_63D36
    ld   a, [$FFF0]
    rst  0
    adc  a, a
    ld   b, e
    sbc  a, d
    ld   b, e
    call label_280D
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], a
    call label_3B12
    ld   a, [$D215]
    and  a
    jp   nz, label_603B2

label_603A1::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    ld   e, $00
    and  $30
    jr   z, label_603AE
    inc  e

label_603AE::
    ld   a, e
    jp   label_3B0C

label_603B2::
    ret

label_603B3::
    ld   e, b

label_603B4::
    nop
    ld   e, b
    jr   nz, label_60412
    nop

label_603B9::
    ld   e, d
    jr   nz, label_60418
    nop
    ld   e, [hl]
    nop
    ld   e, [hl]
    jr   nz, label_6041E
    jr   nz, label_603B4
    nop
    ld   d, b
    nop
    ld   a, [$FF08]
    ld   d, d
    nop
    nop
    nop
    ld   d, h
    nop
    nop
    ld   [$0056], sp
    ld   a, [$FF00]
    ld   d, d
    jr   nz, label_603C8
    ld   [label_2050], sp
    nop
    nop
    ld   d, [hl]
    jr   nz, label_603E0

label_603E0::
    ld   [label_2054], sp

label_603E3::
    ld   a, [$FFF1]
    cp   $04
    jr   nc, label_603EF
    ld   de, label_603B3
    jp   label_3BC0

label_603EF::
    sub  a, $04
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_603C3
    add  hl, de
    ld   c, $04
    jp   label_3CE6

label_60402::
    call label_2887
    ld   a, $1B
    ld   [$D600], a
    ld   hl, $D601
    ld   a, [$FFCF]
    add  a, $02
    ld   e, a

label_60412::
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $85

label_60418::
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a

label_6041E::
    ld   a, $7F
    ldi  [hl], a
    ldi  [hl], a
    ld   a, $06
    ldi  [hl], a
    ld   a, $0C
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $01
    ldi  [hl], a
    ld   a, $85
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ld   a, $0D
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $02
    ldi  [hl], a
    ld   a, $C5
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ld   [hl], $00
    ret

label_6044E::
    call label_2887
    ld   a, $1B
    ld   [$D600], a
    ld   hl, $D601
    ld   a, [$FFCF]
    add  a, $02
    ld   e, a
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $03
    ldi  [hl], a
    ld   a, $C5
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $04
    ldi  [hl], a
    ld   a, $85
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ld   a, $0E
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $05
    ldi  [hl], a
    ld   a, $85
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   a, $05
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ldi  [hl], a
    ld   a, $07
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    ld   [hl], $00
    ret

label_6049D::
    call label_2887
    ld   a, $15
    ld   [$D600], a
    ld   hl, $D601
    ld   a, [$FFCF]
    add  a, $02
    ld   e, a
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ld   a, $04
    ldi  [hl], a
    ld   a, $06
    ldi  [hl], a
    ld   a, $0C
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $01
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ldi  [hl], a
    ld   a, $0D
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $02
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    ldi  [hl], a
    ld   a, $0E
    ldi  [hl], a
    ld   a, e
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $03
    ldi  [hl], a
    ld   a, $83
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   a, $05
    ldi  [hl], a
    ld   a, $07
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    ld   [hl], $00
    ret
    ld   a, [$FFEC]
    cp   $50
    jp   nc, label_608C8
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $3E
    ld   a, [$D214]
    and  a
    jr   z, label_60517
    dec  a
    ld   [$D214], a

label_60517::
    ld   a, [$D218]
    and  a
    jr   z, label_60521
    dec  a
    ld   [$D218], a

label_60521::
    call label_60833
    call label_63D36
    ld   a, [$FFF0]
    rst  0
    ld   [hl], $45
    ld   h, [hl]
    ld   b, l
    sub  a, d
    ld   b, l
    and  c
    ld   b, [hl]
    inc  [hl]
    ld   b, a
    ld   c, a
    ld   b, a
    ld   a, [$DB49]
    and  $02
    jr   z, label_60547
    call label_63D7C
    jr   nc, label_6055C
    ld   a, $89
    jp   label_2373

label_60547::
    ld   a, [$FF98]
    cp   $30
    jr   c, label_6055C
    ld   a, $2F
    ld   [$FF98], a
    call label_178E
    ld   a, $85
    call label_2373
    call label_3B12

label_6055C::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C177]
    and  a
    jr   nz, label_60581
    ld   e, $0B
    ld   hl, $DB00

label_60576::
    ld   a, [hli]
    cp   $09
    jr   z, label_6058A
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_60576

label_60581::
    call label_3B12
    ld   [hl], b
    ld   a, $8A
    jp   label_2373

label_6058A::
    call label_3B12
    ld   a, $87
    jp   label_2373
    ld   a, [$C19F]
    and  a
    jr   nz, label_605B6
    ld   a, $30
    ld   [$D368], a
    call label_3B12

label_605A0::
    xor  a
    ld   [$D210], a
    ld   [$D211], a
    ld   [$D212], a
    ld   [$D213], a
    ld   [$D217], a
    ld   [$D214], a
    ld   [$D218], a

label_605B6::
    ret

label_605B7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_302
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
    ld   bc, label_302
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
    ld   bc, label_302
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_302
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop

label_60605::
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a

label_60653::
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
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  b
    dec  b
    ld   b, $05
    ld   b, $05
    ld   b, $05
    ld   b, $05
    ld   b, $05
    ld   b, $05
    ld   b, $05
    ld   b, $04
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  b
    dec  b
    inc  b
    dec  b
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    nop
    nop
    nop
    nop
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$D210]
    add  a, $01
    ld   [$D210], a
    ld   a, [$D211]
    adc  a, $00
    ld   [$D211], a
    ld   a, [$D211]
    cp   $05
    jr   nz, label_606CF
    ld   a, [$D210]
    cp   $F0
    jr   nz, label_606CF
    call label_3B12
    call label_C05
    ld   [hl], $20
    ret

label_606CF::
    ld   a, [$D212]
    inc  a
    cp   $14
    jr   nz, label_606DF
    ld   a, [$D213]
    inc  a
    ld   [$D213], a
    xor  a

label_606DF::
    ld   [$D212], a
    ld   a, [$D213]
    ld   e, a
    ld   d, b
    ld   hl, label_60605
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, label_605B7
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   hl, label_60653
    add  hl, de
    ld   a, [hl]
    ld   [$D215], a
    ld   a, [$D211]
    ld   d, a
    ld   a, [$D210]
    ld   e, a
    cp   $CC
    jr   nz, label_60712
    ld   a, d
    cp   $00
    jr   z, label_60722

label_60712::
    ld   a, e
    cp   $BE
    jr   nz, label_6071C
    ld   a, d
    cp   $05
    jr   z, label_6071D

label_6071C::
    ret

label_6071D::
    ld   a, $28
    ld   [$D214], a

label_60722::
    call label_C00
    ld   [hl], $28
    ret

label_60728::
    nop
    nop
    ld   b, b
    nop
    nop
    ld   [$0042], sp
    nop
    db   $10
    db   $44
    nop
    call label_C05
    jr   nz, label_60746
    ld   [hl], $70
    ld   a, $10
    ld   [$D368], a
    ld   [$C167], a
    call label_3B12

label_60746::
    ld   a, $02
    ld   [$FFA1], a
    jp   label_6055C

label_6074D::
    sub  a, b
    rla
    call label_6055C
    call label_C05
    jr   nz, label_6076A
    ld   a, $01
    ld   [$DB4A], a
    ld   hl, $DB49
    set  1, [hl]
    xor  a
    ld   [$C167], a
    call label_3B12
    ld   [hl], b
    ret

label_6076A::
    cp   $08
    jr   nz, label_60774
    dec  [hl]
    ld   a, $88
    call label_2373

label_60774::
    ld   a, $6C
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, [$FF98]
    ld   [$FFEE], a
    ld   a, [$FF99]
    sub  a, $0C
    ld   [$FFEC], a
    ld   de, label_6074D
    xor  a
    ld   [$FFF1], a
    jp   label_3C77

label_6078F::
    nop
    nop
    ld   d, b
    nop
    nop
    ld   [$0052], sp
    stop
    ld   d, h
    nop
    db   $10
    db   $08
    ld   d, [hl]
    nop
    ld    hl, sp+$10
    ld   e, b
    nop
    ld   [label_61A10], sp
    nop
    jr   label_607B9
    ld   e, h
    nop
    nop
    jr   label_6080C
    nop
    db   $10
    db   $18
    ld   e, [hl]
    ld   b, b
    nop
    nop
    ld   d, b
    nop
    nop
    ld   [$0052], sp
    stop
    ld   c, d
    nop
    db   $10
    db   $08
    ld   c, h
    nop
    ld    hl, sp+$10
    ld   e, b
    nop
    ld   [label_60E10], sp
    nop
    jr   label_607DD
    ld   e, h
    nop
    nop
    jr   label_60830
    nop
    db   $10
    db   $18
    ld   e, [hl]
    ld   b, b
    nop
    nop
    ld   d, b
    nop
    nop
    ld   [$0052], sp
    stop
    ld   d, h
    nop
    db   $10
    db   $08
    ld   d, [hl]
    nop
    ld    hl, sp+$10
    ld   h, b
    nop
    ld   [label_61A10], sp
    nop
    jr   label_60801
    ld   h, d
    nop
    nop
    jr   label_60854
    nop
    db   $10
    db   $18
    ld   e, [hl]
    ld   b, b
    nop
    nop
    ld   b, [hl]
    nop
    nop
    ld   [$0048], sp
    stop
    ld   c, d
    nop
    db   $10
    db   $08
    ld   c, h
    nop
    ld    hl, sp+$10
    ld   h, b
    nop
    ld   [label_60E10], sp
    nop
    jr   label_60825
    ld   h, d
    nop
    nop
    jr   label_60878
    nop
    db   $10
    db   $18
    ld   e, [hl]
    ld   b, b

label_6081F::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   h, h
    nop

label_60825::
    ld   h, [hl]
    nop
    ld   h, h
    ld   b, b
    ld   h, [hl]
    ld   b, b
    ld   h, [hl]
    ld   h, b
    ld   h, h
    ld   h, b
    ld   h, [hl]

label_60830::
    jr   nz, label_60896
    jr   nz, label_60855
    or   b
    jp   nz, label_63E09
    ld   [$FFF1], a
    ld   a, [$FFEC]
    add  a, $03
    ld   [$FFEC], a
    ld   de, label_6081F
    call label_3BC0
    ld   a, $02
    call label_3DA0
    call label_3D8A
    call label_C00
    jr   z, label_60857
    ld   a, $03

label_60855::
    jr   label_6085C

label_60857::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]

label_6085C::
    rla
    rla
    and  $FC
    ld   e, a
    rla
    rla
    rla
    and  $E0
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_6078F
    add  hl, de
    ld   c, $09
    call label_3CE6
    ld   a, $09
    call label_3DA0
    call label_C00
    ret  z
    ld   a, [$FFEE]
    sub  a, $18
    ld   [$FFEE], a
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFEC], a
    ld   hl, label_60728
    ld   c, $03
    call label_3CE6
    ld   a, $03
    jp   label_3DA0

label_60894::
    nop
    db   $FC ; Undefined instruction

label_60896::
    db   $76 ; Halt
    nop
    nop
    inc  b
    ld   a, b
    nop
    nop
    inc  c
    ld   a, d
    nop

label_608A0::
    nop
    db   $FC ; Undefined instruction
    ld   a, h
    nop

label_608A4::
    nop
    inc  b
    ld   a, b
    nop
    nop
    inc  c
    ld   a, [hl]
    nop
    ld   l, b
    nop
    ld   l, d
    nop
    ld   l, h
    nop
    ld   l, [hl]
    nop
    ld   [hl], b
    nop
    ld   [hl], b
    jr   nz, label_60923
    jr   nz, label_60923
    jr   nz, label_6092B
    jr   nz, label_6092B
    jr   nz, label_60933
    nop
    ld   [hl], h
    nop
    ld   [hl], h
    jr   nz, label_60939
    jr   nz, label_60896
    sbc  a, $48
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$D215]
    and  a
    ret  z
    jp   label_3B0C
    ld   a, [$D214]
    and  a
    jr   z, label_60904
    ld   a, [$FFEE]
    sub  a, $18
    ld   [$FFEE], a
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFEC], a
    ld   hl, label_60728
    ld   c, $03
    call label_3CE6
    ld   a, $03
    call label_3DA0
    call label_3D8A
    ld   a, $07
    ld   [$FFF1], a

label_60904::
    ld   a, [$FFF1]
    cp   $02
    jr   nc, label_6091D
    ld   hl, label_60894
    dec  a
    jr   nz, label_60913
    ld   hl, label_608A0

label_60913::
    ld   c, $03
    call label_3CE6
    ld   a, $03
    jp   label_3DA0

label_6091D::
    ld   de, label_608A4
    call label_3BC0

label_60923::
    ld   a, $02
    jp   label_3DA0
    ld   a, [$FF00]
    ld   [hl], b

label_6092B::
    ld   bc, label_8F0
    ld   [hl], d
    ld   bc, $0000
    ld   [hl], h

label_60933::
    ld   bc, label_800
    db   $76 ; Halt
    ld   bc, label_2821
    ld   c, c
    ld   c, $04
    call label_3CE6
    ld   a, [$FFF0]
    rst  0
    ld   c, c
    ld   c, c
    ld   e, d
    ld   c, c
    sub  a, e
    ld   c, c
    ld   a, [$FFF8]
    and  $20
    jr   z, label_60957
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    ld   [hl], a

label_60957::
    jp   label_3B12
    call label_63D36
    ld   a, [$DB7F]
    and  a
    ret  nz
    call label_63D95
    ret  nc
    ld   a, [$DB0E]
    cp   $0E
    ret  z
    cp   $0D
    jr   nz, label_6098E
    ld   a, $0E
    ld   [$DB0E], a
    ld   a, $01
    ld   [$DB7F], a
    ld   a, $04
    ld   [$FFF4], a
    call label_C05
    ld   [hl], $60
    call label_63FB9
    ld   a, $16
    call label_2373
    jp   label_3B12

label_6098E::
    ld   a, $9C
    jp   label_2373
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    jr   nz, label_609AD
    call label_3B12
    ld   [hl], $01
    ld   a, $02
    ld   [$FFF2], a
    xor  a
    ld   [$C167], a
    ret

label_609AD::
    cp   $40
    jr   nz, label_609B6
    ld   hl, $FFF4
    ld   [hl], $11

label_609B6::
    ret  nc
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $FC
    jp   label_63E6C

label_609C0::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   d, h
    ld   [bc], a
    ld   d, h
    ld   h, d
    ld   d, h
    ld   b, d
    ld   d, h
    ldi  [hl], a
    ld   d, [hl]
    ld   [bc], a
    ld   d, [hl]
    ldi  [hl], a
    ld   d, d
    ld   [bc], a
    ld   d, d
    ldi  [hl], a
    ld   de, label_609C0
    call label_3BC0
    ld   a, [$DBA5]
    and  a
    jr   z, label_60A2A
    ld   a, [$FFF6]
    cp   $DA
    jr   nz, label_60A2A
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$DC0C]
    and  $01
    jp   z, label_63F08
    ld   a, [$DB0E]
    cp   $0E
    jp   nz, label_63F08
    ld   a, [$DB7F]
    and  a
    jp   nz, label_63F08
    ld   a, [$DC0D]
    and  $01
    jr   nz, label_60A0E
    ld   a, $18
    jp   label_ADE

label_60A0E::
    call label_63D95
    jr   nc, label_60A18
    ld   a, $26
    call label_2373

label_60A18::
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    or   $80
    ld   [hl], a
    call label_3B5A
    ret  nc
    call label_CBE
    jp   label_CB6

label_60A2A::
    call label_63DE8
    call label_63E15
    ld   a, [$FFF0]
    rst  0
    dec  sp
    ld   c, d
    ld   [hl], d
    ld   c, d
    ld   a, e
    ld   c, d
    and  d
    ld   c, d
    ld   hl, $C340
    add  hl, bc
    set  6, [hl]
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_62385
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_6237D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    call label_62493
    ld   a, [$FFDA]
    cp   $07
    ret  nz
    call label_C05
    call label_280D
    and  $7F
    or   $40
    ld   [hl], a
    jp   label_3B12
    call label_C05
    ret  nz
    ld   [hl], $60
    jp   label_3B12
    call label_C05
    jr   nz, label_60A90
    ld   [hl], $60
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C340
    add  hl, bc
    res  6, [hl]
    jp   label_3B12

label_60A90::
    and  $04
    ld   a, $01
    jr   z, label_60A97
    inc  a

label_60A97::
    jp   label_3B0C

label_60A9A::
    nop
    nop
    ld   bc, label_202
    ld   [bc], a
    ld   bc, label_2100
    ret  nc
    jp   label_63E09
    inc  [hl]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_60A9A
    add  hl, de
    ld   a, [hl]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    call label_3B39
    call label_C05
    jr   nz, label_60ADC
    call label_3B12
    ld   [hl], b
    xor  a
    call label_3B0C
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    add  a, $00
    ld   [$FFD8], a
    ld   a, $01
    jp   label_CC7

label_60ADC::
    cp   $30
    jr   nz, label_60B03
    ld   a, $7D
    call label_3B86
    jr   c, label_60B03
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

label_60B03::
    call label_C05
    ld   e, $03
    cp   $50
    jr   nc, label_60B11
    cp   $20
    jr   c, label_60B11
    inc  e

label_60B11::
    ld   a, e
    jp   label_3B0C

label_60B15::
    nop
    nop
    ld   [hl], b
    ld   bc, label_800
    ld   [hl], d
    ld   bc, $0010
    ld   [hl], h
    ld   bc, label_810
    ld   [hl], h
    ld   hl, $0000
    ld   [hl], d
    ld   hl, label_800
    ld   [hl], b
    ld   hl, $0010
    ld   [hl], h
    ld   bc, label_810
    ld   [hl], h
    ld   hl, $0000
    ld   a, b
    ld   hl, label_800
    db   $76 ; Halt
    ld   hl, $0010
    ld   [hl], h
    ld   bc, label_810
    ld   [hl], h
    ld   hl, $0000
    db   $76 ; Halt
    ld   bc, label_800
    ld   a, b
    ld   bc, $0010
    ld   [hl], h
    ld   bc, label_810
    ld   [hl], h
    ld   hl, $0000
    ld   [hl], b
    nop
    nop
    ld   [$0072], sp
    stop
    ld   [hl], h
    nop
    db   $10
    db   $08
    ld   [hl], h
    jr   nz, label_60B66

label_60B66::
    nop
    ld   [hl], d
    jr   nz, label_60B6A

label_60B6A::
    ld   [label_2070], sp
    stop
    ld   [hl], h
    nop
    db   $10
    db   $08
    ld   [hl], h
    jr   nz, label_60B76

label_60B76::
    nop
    ld   a, b
    jr   nz, label_60B7A

label_60B7A::
    ld   [label_2076], sp
    stop
    ld   [hl], h
    nop
    db   $10
    db   $08
    ld   [hl], h
    jr   nz, label_60B86

label_60B86::
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [$0078], sp
    stop
    ld   [hl], h
    nop
    db   $10
    db   $08
    ld   [hl], h
    jr   nz, label_60C10
    ld   [bc], a
    ld   a, h
    ld   [bc], a

label_60B99::
    ld   a, [hl]
    ld   [bc], a
    ld   a, [hl]
    ldi  [hl], a
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   a, [$FFF6]
    cp   $A8
    jr   nz, label_60BB2
    ld   hl, label_60B55
    jr   label_60BB5

label_60BB2::
    ld   hl, label_60B15

label_60BB5::
    add  hl, de
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_63EC2
    add  a, $0C
    cp   $18
    jr   nc, label_60BE4
    call label_63EB2
    add  a, $10
    cp   $20
    jr   nc, label_60BE4
    ld   a, e
    add  a, $02
    call label_3B0C

label_60BE4::
    call label_63D36
    ld   a, [$FFF6]
    cp   $A8
    jp   z, label_60C75
    ld   de, label_60B95
    ld   a, [$DB0E]
    cp   $09
    jr   nc, label_60BFB
    ld   de, label_60B99

label_60BFB::
    xor  a
    ld   [$FFF1], a
    ld   a, [$FFEE]
    add  a, $18
    ld   [$FFEE], a
    ld   a, [$FFEC]
    add  a, $08
    ld   [$FFEC], a
    call label_3BC0
    call label_3D8A

label_60C10::
    call label_63DE8
    ld   a, [$FFF0]
    rst  0
    inc  e
    ld   c, h
    ld   b, h
    ld   c, h
    ld   e, [hl]
    ld   c, h
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    call label_63D89
    ret  nc
    ld   a, [$DB0E]
    cp   $08
    jr   nz, label_60C3B
    ld   a, $67
    call label_2373
    jp   label_3B12

label_60C3B::
    ld   a, $66
    jr   c, label_60C41
    ld   a, $6B

label_60C41::
    jp   label_2373
    ld   a, [$C19F]
    and  a
    jr   nz, label_60C58
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_60C58
    ld   a, $68
    jp   label_2373

label_60C58::
    ld   [hl], b
    ld   a, $69
    jp   label_2373
    ld   a, [$C19F]
    and  a
    jr   nz, label_60C74
    call label_3B12
    ld   [hl], b
    call label_C0C
    ld   a, $09
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a

label_60C74::
    ret

label_60C75::
    call label_63DE8
    ld   a, [$FFF0]
    rst  0
    add  a, a
    ld   c, h
    and  e
    ld   c, h
    xor  e
    ld   c, h
    cp   [hl]
    ld   c, h
    pop  de
    ld   c, h
    ld   a, [$FF00+C]
    call label_63D89
    ret  nc
    ld   a, [$DB0E]
    cp   $09
    jr   nz, label_60C9A
    ld   a, $34
    call label_2373
    jp   label_3B12

label_60C9A::
    ld   a, $33
    jr   c, label_60CA0
    ld   a, $39

label_60CA0::
    jp   label_2373
    ld   a, [$C19F]
    and  a
    ret  nz
    jp   label_3B12
    call label_3B12
    ld   a, $08

label_60CB0::
    ld   [$DB95], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    ret
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, $35
    jp   label_2373
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_60CEC
    call label_C0C
    ld   a, $0A
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    ret

label_60CEC::
    dec  [hl]
    ld   a, $37
    jp   label_2373
    call label_63D89
    ret  nc
    ld   a, $38
    jp   label_2373

label_60CFB::
    ld   h, d
    ld   hl, label_2160
    ld   h, [hl]
    ld   hl, label_2164
    ld   l, h
    ld   bc, label_16E

label_60D07::
    ld   l, b
    ld   bc, label_16A
    ld   l, d
    ld   hl, label_2168
    ld   l, h
    ld   bc, label_16E

label_60D13::
    sbc  a, d
    inc  d
    sbc  a, h
    inc  d
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_60D36
    inc  [hl]
    ld   a, $18
    call label_AF6
    ld   a, [$DB69]
    ld   d, $B1
    and  $02
    jr   z, label_60D30
    ld   d, $CD

label_60D30::
    ld   a, [$FFF6]
    cp   d
    jp   nz, label_63F08

label_60D36::
    ld   de, label_60CFB
    xor  a
    ld   [$FFE8], a
    ld   a, [$DB0E]
    cp   $0B
    jr   nc, label_60D58
    ld   a, [$DB69]
    and  $02
    jr   nz, label_60D51
    ld   a, [$DB0E]
    cp   $0A
    jr   c, label_60D58

label_60D51::
    ld   a, $01
    ld   [$FFE8], a
    ld   de, label_60D07

label_60D58::
    call label_3BC0
    call label_63DE8
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_63D36
    ld   a, [$FFF0]
    rst  0
    ld   [hl], a
    ld   c, l
    cp   d
    ld   c, l
    db   $4D
    ld   c, l
    rla
    ld   c, [hl]
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    call label_63D95
    ret  nc
    ld   a, [$DB56]
    cp   $80
    ld   a, $78
    jr   z, label_60DA0
    ld   a, [$FFE8]
    and  a
    jr   nz, label_60DA3
    ld   a, [$DB0E]
    cp   $0B
    ld   a, $5A
    jr   c, label_60DA0
    ld   a, $5F

label_60DA0::
    jp   label_2373

label_60DA3::
    ld   a, [$DB0E]
    cp   $0A
    jr   nz, label_60DB5
    ld   [$C167], a
    ld   a, $5C
    call label_2373
    jp   label_3B12

label_60DB5::
    ld   a, $5B
    jp   label_2373
    ld   a, [$C177]
    and  a
    jr   nz, label_60DCF
    ld   a, $01
    ld   [$FFF2], a
    ld   [$DB7F], a
    call label_C05
    ld   [hl], $80
    jp   label_3B12

label_60DCF::
    xor  a
    ld   [$C167], a
    ld   a, $59
    call label_2373
    call label_3B12
    ld   [hl], b
    ret
    call label_C05
    jr   nz, label_60DF3
    ld   a, $0B
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    ld   a, $5D
    call label_2373
    jp   label_3B12

label_60DF3::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    xor  a
    ld   [$FFF1], a
    ld   a, [$FFEC]
    sub  a, $0E
    ld   [$FFEC], a
    ld   a, [$FFEE]
    sub  a, $04
    ld   [$FFEE], a
    ld   de, label_60D13
    call label_3BC0
    call label_3D8A
    ld   a, $02
    jp   label_3B0C
    ld   a, [$C19F]
    and  a
    jr   nz, label_60E2A
    ld   [$DB7F], a
    ld   [$C167], a
    call label_C0C
    call label_3B12
    ld   [hl], b

label_60E2A::
    ret

label_60E2B::
    nop
    ld    hl, sp+$60
    ld   bc, $0000
    ld   h, d
    ld   bc, label_800
    ld   h, h
    ld   bc, $F800
    ld   h, [hl]
    ld   bc, $0000
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $0002
    ld   b, $04
    ld   a, [$FFF1]
    sla  a
    sla  a
    ld   e, a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_60E2B
    add  hl, de
    ld   c, $03
    call label_3CE6
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    call label_3B0C
    call label_63DE8
    call label_63D36
    ld   a, [$FFF0]
    rst  0
    db   $76 ; Halt
    ld   c, [hl]
    xor  b
    ld   c, [hl]
    rst  8
    ld   c, [hl]
    call label_63D95
    ret  nc
    ld   a, [$DB0E]
    cp   $08
    jr   nc, label_60E91
    cp   $01
    jr   z, label_60E9F
    ld   a, [$DB67]
    and  $02
    jp   z, label_60E91
    ld   e, $EE
    jr   label_60EA4

label_60E91::
    ld   a, [$DB0E]
    and  a
    ld   e, $2A
    jr   z, label_60EA4
    ld   e, $2C
    cp   $01
    jr   nz, label_60EA4

label_60E9F::
    call label_3B12
    ld   e, $2B

label_60EA4::
    ld   a, e
    jp   label_2373
    ld   a, [$C19F]
    and  a
    jr   nz, label_60ECE
    ld   a, [$C177]
    and  a
    jr   nz, label_60EC5
    ld   a, $02
    ld   [$DB0E], a
    ld   a, $0D
    ld   [$FFA5], a
    ld   a, $28
    call label_2373
    jp   label_3B12

label_60EC5::
    ld   a, $27
    call label_2373
    call label_3B12
    ld   [hl], b

label_60ECE::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_60EDC
    call label_C0C
    call label_3B12
    ld   [hl], b

label_60EDC::
    ret
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_610E2
    ld   a, [$FFF8]
    and  $20
    jp   nz, label_63F08
    call label_C56
    ld   a, [$FFF0]
    rst  0
    dec  b
    ld   c, a
    ld   e, $4F
    scf
    ld   c, a
    ld   e, h
    ld   c, a
    add  a, c
    ld   c, a
    sub  a, [hl]
    ld   c, a
    rst  0
    ld   c, a
    inc  b
    ld   d, b
    ld   d, d
    ld   d, b
    ld   a, [$DB76]
    ld   hl, label_60F90
    cp   [hl]
    jr   nz, label_60F1D
    inc  hl
    ld   a, [$DB77]
    cp   [hl]
    jr   nz, label_60F1D
    inc  hl
    ld   a, [$DB78]
    cp   [hl]
    jp   z, label_63F08

label_60F1D::
    ret
    call label_C05
    ld   [hl], $90
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $06
    ld   [$FFF2], a
    jp   label_3B12
    call label_610C3
    call label_C05
    jr   nz, label_60F44
    ld   [hl], $60
    jp   label_3B12

label_60F44::
    ld   e, $FC
    sub  a, $08
    and  $10
    jr   z, label_60F4E
    ld   e, $04

label_60F4E::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $FC
    jp   label_63E5F
    call label_610C3
    call label_C05
    ret  nz
    ld   [hl], $48
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
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20
    jp   label_3B12
    call label_610A8
    call label_C05
    ret  nz
    ld   a, $E1
    call label_61080
    jp   label_3B12

label_60F90::
    ld   b, b
    ld   h, b
    ld   h, b

label_60F93::
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    call label_610A8
    ld   a, [$C19F]
    and  a
    ret  nz

label_60F9E::
    ld   hl, $C2B0
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   a, e
    ld   [$D201], a
    inc  a
    cp   $03
    jr   nz, label_60FAF
    xor  a

label_60FAF::
    ld   [hl], a
    ld   hl, label_60F90
    add  hl, de
    ld   a, [hl]
    ld   hl, $DB76
    add  hl, de
    cp   [hl]
    jr   z, label_60F9E
    ld   hl, label_60F93
    add  hl, de
    ld   a, [hl]
    call label_61080
    jp   label_3B12
    call label_610A8
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_61001
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
    ret

label_61001::
    dec  [hl]
    dec  [hl]
    ret
    ld   hl, label_61090
    ld   c, $03
    call label_3CE6
    call label_610D2
    call label_C05
    ret  nz
    call label_3D7F
    ld   a, $E5
    call label_61080
    call label_3B12
    ld   a, [$D201]
    ld   e, a
    ld   d, b
    ld   hl, label_60F90
    add  hl, de
    ld   a, [hl]
    ld   hl, $DB76
    add  hl, de
    ld   [hl], a
    ld   d, a
    ld   a, e
    and  a
    jr   nz, label_61044
    ld   hl, $DB4C
    ld   [hl], d
    ld   d, $0C
    call label_3E6B
    xor  a
    ld   [$DB4B], a
    ld   a, $0B
    ld   [$FFA5], a
    ret

label_61044::
    cp   $01
    jr   nz, label_6104D
    ld   hl, $DB4D
    ld   [hl], d
    ret

label_6104D::
    ld   hl, $DB45
    ld   [hl], d
    ret
    call label_610A8
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_61067
    inc  [hl]
    ld   a, $3B
    ld   [$FFF2], a

label_61067::
    call label_63E62
    ld   hl, $C250
    add  hl, bc
    dec  [hl]
    dec  [hl]
    dec  [hl]
    ld   a, [$FFEC]
    cp   $F0
    ret  c
    call label_63FB9
    xor  a
    ld   [$C167], a
    jp   label_63F08

label_61080::
    ld   e, a
    ld   a, [$FF99]
    push af
    ld   a, $20
    ld   [$FF99], a
    ld   a, e
    call label_2385
    pop  af
    ld   [$FF99], a
    ret

label_61090::
    nop
    db   $FC ; Undefined instruction
    ld   [hl], b
    inc  bc
    nop
    inc  b
    ld   [hl], d
    inc  bc
    nop
    inc  c
    ld   [hl], b
    inc  hl

label_6109C::
    nop
    db   $FC ; Undefined instruction
    ld   [hl], h
    inc  bc
    nop
    inc  b
    db   $76 ; Halt
    inc  bc
    nop
    inc  c
    ld   [hl], h
    inc  hl

label_610A8::
    ld   hl, label_61090
    ld   a, [$FFE7]
    and  $08
    jr   z, label_610B4
    ld   hl, label_6109C

label_610B4::
    ld   c, $03
    call label_3CE6
    jr   label_610D2

label_610BB::
    ld   a, [hl]
    inc  bc
    ld   a, [hl]
    inc  hl
    ld   a, [hl]
    ld   b, e
    ld   a, [hl]
    ld   h, e

label_610C3::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    ld   [$FFF1], a
    ld   de, label_610BB
    call label_3BC0

label_610D2::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, $04
    ld   [$FF9D], a
    xor  a
    ld   [$C19B], a
    ret

label_610E2::
    call label_61174
    call label_C05
    jp   z, label_63F08
    ld   d, a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_610FE
    ld   a, d
    bit  1, a
    ld   a, $E4
    jr   z, label_610FA
    ld   a, $44

label_610FA::
    ld   [$DB97], a
    ret

label_610FE::
    ld   hl, $DE01
    ld   a, $24
    ldi  [hl], a
    ld   a, $7B
    ldi  [hl], a
    ld   a, $77
    ldi  [hl], a
    ld   a, $18
    ld   [hl], a
    jp   label_BD7

label_61110::
    stop
    ld   a, h
    rlca
    db   $10
    db   $08
    ld   a, h
    ld   h, a
    jr   nz, label_6111A

label_6111A::
    ld   a, h
    rlca
    jr   nz, label_61126
    ld   a, h
    ld   h, a
    jr   nc, label_6111A
    ld   a, b
    rlca
    jr   nc, label_61126

label_61126::
    ld   a, d
    rlca
    jr   nc, label_61132
    ld   a, d
    daa
    jr   nc, label_6113E
    ld   a, b
    daa
    ld   b, b
    ld    hl, sp+$78
    ld   b, a
    ld   b, b
    nop
    ld   a, d
    ld   b, a
    ld   b, b
    ld   [label_6277A], sp
    ld   b, b
    db   $10
    db   $78
    ld   h, a

label_61140::
    stop
    ld   a, h
    ld   d, h
    db   $10
    db   $08
    ld   a, h
    inc  [hl]
    jr   nz, label_6114A

label_6114A::
    ld   a, h
    ld   d, h
    jr   nz, label_61156
    ld   a, h
    inc  [hl]
    jr   nc, label_6114A
    ld   a, b
    inc  d
    jr   nc, label_61156

label_61156::
    ld   a, d
    inc  d
    jr   nc, label_61162
    ld   a, d
    inc  [hl]
    jr   nc, label_6116E
    ld   a, b
    inc  [hl]
    ld   b, b
    ld    hl, sp+$78
    ld   d, h
    ld   b, b
    nop
    ld   a, d
    ld   d, h
    ld   b, b
    ld   [label_6347A], sp
    ld   b, b
    db   $10
    db   $78
    ld   [hl], h

label_61170::
    inc  c
    inc  c
    inc  b
    ld   [bc], a

label_61174::
    ld   a, [$FFEC]
    sub  a, $05
    ld   [$FFEC], a
    call label_C05
    ld   c, $0C
    cp   $B0
    jr   c, label_61190
    sub  a, $B0
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_61170
    add  hl, de
    ld   c, [hl]

label_61190::
    ld   hl, label_61110
    ld   a, [$FFE7]
    and  $04
    jr   z, label_6119C
    ld   hl, label_61140

label_6119C::
    call label_3CE6
    ld   a, $04
    jp   label_3DA0

label_611A4::
    call label_63D36
    call label_63D95
    ret  nc
    ld   a, $96
    jp   label_2373

label_611B0::
    ld   a, [$DB74]
    and  a
    jp   z, label_63F08
    ret

label_611B8::
    ld   d, b
    ld   bc, label_152
    ld   d, d
    ld   hl, label_2150
    ld   d, h
    ld   bc, label_156
    ld   d, [hl]
    ld   hl, label_2154
    ld   e, b
    ld   bc, label_15A
    ld   e, b
    ld   bc, label_15A
    ld   e, d
    ld   hl, label_2158
    ld   e, d
    ld   hl, label_2158
    ld   a, [$DB74]
    and  a
    jp   nz, label_63F08
    ld   de, label_611B8
    call label_3BC0
    ld   a, [$FFE7]
    and  $3F
    jr   nz, label_611F3
    call label_63EE1
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e

label_611F3::
    call label_63D60
    call label_63DE8
    call label_63E98
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_6120E
    and  $80
    jr   z, label_6121C

label_6120E::
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_6121C
    ld   [hl], $0C

label_6121C::
    ld   a, [$FFEF]
    ld   [$FFEC], a
    call label_63D36
    call label_3D8A
    call label_63D95
    ret  nc
    ld   e, $00
    ld   a, [$DBA5]
    and  a
    jr   nz, label_6123F
    inc  e
    ld   a, [$FFF6]
    cp   $CC
    jr   z, label_6123F
    inc  e
    cp   $CD
    jr   z, label_6123F
    inc  e

label_6123F::
    ld   a, [$DB6A]
    and  $02
    jr   z, label_6124A
    ld   a, e
    add  a, $04
    ld   e, a

label_6124A::
    ld   a, [$DB73]
    and  a
    jr   z, label_61255
    ld   a, $52
    jp   label_237C

label_61255::
    ld   a, e
    add  a, $4A
    jp   label_237C

label_6125B::
    ld   a, b
    ld   bc, label_17A
    ld   a, h
    ld   bc, label_17E
    ld   a, d
    ld   hl, label_2178
    ld   a, [hl]
    ld   hl, label_217C
    call label_611B0
    ld   de, label_6125B
    call label_3BC0
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    ld   e, $00
    cp   [hl]
    jr   nc, label_61286
    ld   e, $02

label_61286::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $01
    add  a, e
    call label_3B0C
    jp   label_611A4

label_61296::
    ld   e, d
    ld   hl, label_2158
    ld   e, [hl]
    ld   hl, label_215C
    ld   e, b
    ld   bc, label_15A
    ld   e, h
    ld   bc, label_15E
    ld   de, label_61296
    call label_3BC0
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_63E98
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    ld   [$FFE8], a
    jr   z, label_612D7
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_612D7::
    ld   a, [$FFF0]
    rst  0
    ld  [$FF00+C], a
    ld   d, d
    rrca
    ld   d, e
    jr   c, label_61333
    ld   e, e
    ld   d, e
    call label_C05
    ret  nz
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $0C
    call label_63E6C
    ld   a, [$FFEE]
    cp   $20
    jr   nz, label_61304
    ld   a, $01
    call label_619AE
    ld   a, $01
    ld   [$FF9E], a
    push bc
    call label_BF0
    pop  bc
    ret

label_61304::
    cp   $48
    ret  nz
    call label_C05
    ld   [hl], $40
    jp   label_3B12
    call label_C05
    jr   nz, label_61321
    ld   a, $E3
    call label_2373
    call label_C05
    ld   [hl], $10
    call label_3B12

label_61321::
    ld   a, [$FFE8]
    and  a
    jr   z, label_61337
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    dec  [hl]
    and  a
    jr   nz, label_61337
    ld   [hl], $08
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $12

label_61337::
    ret
    call label_61321
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C05
    jr   nz, label_6134F
    ld   [hl], $10
    ld   a, $E5
    call label_2373
    jp   label_3B12

label_6134F::
    ld   e, $02
    cp   $08
    jr   nc, label_61357
    ld   e, $00

label_61357::
    ld   a, e
    jp   label_619AE
    call label_61321
    ld   a, [$C19F]
    and  a
    jr   nz, label_613CD
    call label_C05
    jr   z, label_61375
    ld   e, $01
    cp   $08
    jr   c, label_61371
    ld   e, $02

label_61371::
    ld   a, e
    jp   label_619AE

label_61375::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $02
    call label_3B0C
    ld   hl, $DB74
    ld   [hl], $01
    ld   a, [$FFEE]
    and  $FC
    cp   $E0
    jr   z, label_61397
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $EC
    call label_63E6C

label_61397::
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C240
    add  hl, de
    ld   [hl], $F4
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    add  a, $04
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    push de
    push bc
    ld   c, e
    ld   b, d
    call label_63E6C
    pop  bc
    pop  de
    ld   hl, $C200
    add  hl, de
    ld   a, [hl]
    cp   $F0
    jr   nz, label_613CD
    call label_63F08
    xor  a
    ld   [$DB73], a
    xor  a
    ld   [$C167], a

label_613CD::
    ret
    call label_6148A
    call label_63DE8
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $04
    cp   $08
    jr   nc, label_613ED
    ld   hl, $FF99
    ld   a, [$FFEC]
    add  a, $04
    sub  a, [hl]
    jr   c, label_613ED
    call label_63D3B

label_613ED::
    ld   hl, $FF98
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $06
    cp   $0C
    jr   nc, label_61466
    ld   hl, $FF99
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $08
    cp   $04
    jr   nc, label_61466
    ld   e, $20
    ld   a, [$DB00]
    cp   $03
    jr   z, label_61417
    ld   e, $10
    ld   a, [$DB01]
    cp   $03
    jr   nz, label_61466

label_61417::
    ld   a, [$FFCB]
    and  e
    jr   z, label_61466
    ld   a, $02
    ld   [$FFBA], a
    ld   a, $3A
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FF9E], a
    ld   a, $01
    ld   [$FFA1], a
    call label_CAF
    ld   a, [$FFEE]
    ld   [$FF98], a
    ld   a, [$FFEC]
    add  a, $08
    ld   [$FF99], a
    cp   $50
    jr   nc, label_6145F
    ld   a, [$FFCB]
    and  $08
    jr   z, label_6145F
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    and  $18
    jr   z, label_6145E
    ld   hl, $FF9D
    inc  [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $04
    call label_63E62
    ld   a, $01
    ld   [$FFBA], a

label_6145E::
    ret

label_6145F::
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], $08
    ret

label_61466::
    ld   a, [$FFEC]
    cp   $1B
    jr   c, label_61479
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $FD
    call label_63E62
    ld   a, $00
    ld   [$FFBA], a

label_61479::
    ret

label_6147A::
    ld   b, h
    ld   bc, label_2144
    ld   [hl], h
    ld   bc, label_2174

label_61482::
    ld   b, [hl]
    ld   bc, label_2146
    db   $76 ; Halt
    ld   bc, label_2176

label_6148A::
    ld   a, [$FFF7]
    cp   $01
    jr   nz, label_61492
    ld   [$FFF1], a

label_61492::
    ld   de, label_6147A
    call label_3BC0
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    add  a, $FC
    cp   $F0
    ret  nc
    ld   [$FFEC], a

label_614A4::
    ld   de, label_61482
    call label_3BC0
    ld   a, [$FFEC]
    add  a, $10
    ld   [$FFEC], a
    ld   hl, $FFEF
    cp   [hl]
    jr   c, label_614A4
    jp   label_3D8A

label_614B9::
    inc  h
    nop
    ld   a, $00

label_614BD::
    ld   de, label_614B9
    call label_3C77
    call label_63DE8
    call label_C05
    jp   z, label_63F08
    ld   e, $01
    cp   $40
    jr   c, label_614DF
    jr   nz, label_614DE
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $04
    ld   [hl], a
    jr   label_614DF

label_614DE::
    dec  e

label_614DF::
    ld   a, e
    call label_3B0C
    call label_C05
    ld   e, $FE
    and  $20
    jr   z, label_614EE
    ld   e, $FC

label_614EE::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], e
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $FF
    ld   a, [$FFE7]
    and  $03
    ret  nz
    jp   label_63E5F
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_614BD
    ld   a, [$D8FD]
    and  $20
    jp   nz, label_6189A
    call label_6186B
    call label_63DE8
    call label_63E98
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   z, label_6152F
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_6152F::
    call label_63D36
    ld   a, [$FFF0]
    rst  0
    ld   b, a
    ld   d, l
    cp   h
    ld   d, l
    rst  $18
    ld   d, l
    db   $76 ; Halt
    ld   d, [hl]
    ld   [label_1B56], a
    ld   d, a
    ld   d, d
    ld   d, a
    ld   a, l
    ld   d, a
    sbc  a, d
    ld   d, a
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, $7F
    and  [hl]
    jr   nz, label_6157B
    ld   a, $C4
    call label_3B86
    jr   c, label_6157B
    ld   a, [$FFD7]
    sub  a, $08
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    add  a, $02
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $60
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C1
    ld   hl, $C2B0
    add  hl, de
    inc  [hl]

label_6157B::
    ld   a, [$DB73]
    and  a
    jr   nz, label_6158A
    call label_63D7C
    ret  nc
    ld   a, $E0
    jp   label_2373

label_6158A::
    call label_63EB2
    add  a, $13
    cp   $26
    ret  nc
    call label_63EC2
    add  a, $20
    cp   $40
    ret  nc
    call label_CAF
    call label_178E
    ld   a, [$C146]
    and  a
    ret  nz
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C310
    add  hl, de
    ld   a, [hl]
    and  a
    ret  nz
    call label_3B12
    ld   a, $E1
    call label_2373
    jp   label_619AC
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_615D8
    ld   a, $2F
    ld   [$D368], a
    ld   [$C3C8], a
    call label_BFB
    ld   [hl], $50
    ret

label_615D8::
    ld   [hl], $08
    ld   a, $E4
    jp   label_2373
    ld   a, $01
    ld   [$C167], a
    ld   a, $02
    ld   [$FFA1], a
    call label_BFB
    jr   nz, label_615F2
    ld   [hl], $C0
    jp   label_3B12

label_615F2::
    ld   e, $00
    cp   $40
    jr   nc, label_61612
    ld   e, $02
    cp   $10
    jr   c, label_61612
    ld   e, $00
    cp   $3C
    jr   nc, label_61610
    cp   $20
    jr   z, label_61612
    cp   $21
    jr   z, label_61612
    cp   $22
    jr   z, label_61612

label_61610::
    ld   e, $01

label_61612::
    ld   a, e
    jp   label_3B0C

label_61616::
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, label_201
    ld   [bc], a
    ld   a, $01
    ld   [$C167], a
    ld   a, $02
    ld   [$FFA1], a
    call label_BFB
    jr   nz, label_61698
    ld   [$C3C8], a
    ld   a, $11
    ld   [$FFF4], a
    call label_C05
    ld   [hl], $08
    ld   a, $02
    call label_3B0C
    jp   label_3B12

label_61698::
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_616B8
    inc  [hl]
    ld   a, [hl]
    cp   $60
    jr   nc, label_616B8
    and  $0F
    jr   nz, label_616B8
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10
    ld   a, $24
    ld   [$FFF2], a

label_616B8::
    ld   hl, label_61616
    add  hl, de
    ld   a, [hl]
    cp   $02
    jr   nz, label_616CE
    ld   a, [$FFE7]
    and  $3F
    jr   nz, label_616CC
    ld   hl, $FFF2
    ld   [hl], $27

label_616CC::
    ld   a, $02

label_616CE::
    call label_3B0C
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   e, $01
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    sub  a, $F8
    and  $80
    jr   nz, label_616E6
    inc  e

label_616E6::
    ld   a, e
    jp   label_3B0C
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    ret  nz
    ld   [hl], $10
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $04
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    cp   $04
    ret  nz
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $18
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $18
    ld   [hl], a
    ld   a, $08
    ld   [$FFF2], a
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    call label_3B12
    call label_C05
    ld   [hl], $08

label_6172E::
    ld   a, $24
    ld   [$FFF4], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    add  a, $10
    ld   [$FFD8], a
    ld   a, $01
    call label_CC7
    ld   a, [$FFEE]
    add  a, $10
    ld   [$FFD7], a
    ld   a, [$FFEC]
    add  a, $10
    ld   [$FFD8], a
    ld   a, $01
    jp   label_CC7
    call label_C05
    jr   nz, label_61778
    call label_3B12
    ld   a, [$FFB0]
    ld   [$D368], a
    ld   a, $FF
    call label_3B0C
    ld   a, $E2
    call label_2373
    ld   a, $03
    call label_619AE
    ld   a, $03
    ld   [$FF9E], a
    push bc
    call label_BF0
    pop  bc
    ret

label_61778::
    ld   a, $05
    jp   label_3B0C
    ld   a, $C8
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $F8
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20
    ld   hl, $C210
    add  hl, de
    ld   [hl], $48
    call label_63F08
    jp   label_63FB9
    ret

label_6179B::
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, label_1000
    ld   h, h
    ld   bc, label_1800
    ld   h, [hl]
    ld   bc, $0010
    ld   l, b
    ld   bc, label_810
    ld   l, d
    ld   bc, label_1010
    ld   l, h
    ld   bc, label_1810
    ld   l, [hl]
    ld   bc, $0000
    ld   h, b
    ld   bc, label_800
    ld   [hl], b
    ld   bc, label_1000
    ld   h, h
    ld   bc, label_1800
    ld   h, [hl]
    ld   bc, $0010
    ld   l, b
    ld   bc, label_810
    ld   l, d
    ld   bc, label_1010
    ld   l, h
    ld   bc, label_1810
    ld   l, [hl]
    ld   bc, $0000
    ld   [hl], d
    ld   bc, label_800
    ld   [hl], h
    ld   bc, label_1000
    ld   h, h
    ld   bc, label_1800
    ld   h, [hl]
    ld   bc, $0010
    db   $76 ; Halt
    ld   bc, label_810
    ld   l, d
    ld   bc, label_1010
    ld   l, h
    ld   bc, label_1810
    ld   l, [hl]
    ld   bc, $0000
    ld   a, b
    ld   bc, label_800
    ld   a, d
    ld   bc, label_1000
    ld   a, h
    ld   bc, label_1800
    ld   a, [hl]
    ld   bc, $0010
    ld   a, b
    ld   b, c
    db   $10
    db   $08
    ld   a, d
    ld   b, c
    db   $10
    db   $10
    ld   a, h
    ld   b, c
    db   $10
    db   $18
    ld   a, [hl]
    ld   b, c
    nop
    nop
    ld   l, b
    ld   b, c
    nop
    ld   [label_6016A], sp
    nop
    db   $10
    db   $6C
    ld   b, c
    nop
    jr   label_61898
    ld   b, c
    stop
    ld   h, b
    ld   b, c
    db   $10
    db   $08
    ld   h, d
    ld   b, c
    db   $10
    db   $10
    ld   h, h
    ld   b, c
    db   $10
    db   $18
    ld   h, [hl]
    ld   b, c
    ld   c, $00
    ld   l, b
    ld   b, c
    ld   c, $08
    ld   l, d
    ld   b, c
    ld   c, $10
    ld   l, h
    ld   b, c
    ld   c, $18
    ld   l, [hl]
    ld   b, c
    stop
    rst  $38
    ld   b, c
    db   $10
    db   $08
    rst  $38
    ld   b, c
    db   $10
    db   $10
    rst  $38
    ld   b, c
    db   $10
    db   $18
    rst  $38
    ld   b, c

label_6185B::
    rla
    inc  bc
    ld   h, $00
    rla
    add  hl, bc
    ld   h, $00
    rla
    rrca
    ld   h, $00
    rla
    dec  d
    ld   h, $00

label_6186B::
    ld   a, [$FFF1]
    rla
    rla
    rla
    rla
    rla
    and  $E0
    ld   e, a
    ld   d, b
    ld   hl, label_6179B
    add  hl, de
    ld   c, $08
    call label_3CE6
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$FFEF]
    ld   [$FFEC], a
    ld   hl, label_6185B
    ld   c, $04
    call label_3CE6
    ld   a, $04
    call label_3DA0
    jp   label_3D8A

label_6189A::
    call label_6196B
    ld   a, [$C124]
    and  a
    ret  nz
    ld   a, [$FFF0]
    rst  0
    xor  l
    ld   e, b
    pop  bc
    ld   e, b
    db   $58
    ld   e, b
    pop  af
    ld   e, b
    ld   hl, $C210
    add  hl, bc
    ld   [hl], $68
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $80
    call label_C05
    ld   [hl], $20
    jp   label_3B12
    call label_C05
    ret  nz
    ld   a, [$DB4A]
    cp   $00
    ret  nz
    ld   a, [$C166]
    and  a
    cp   $40
    ret  nz
    call label_3B12
    call label_C05
    ld   [hl], $20
    jp   label_6172E
    call label_C05
    jr   nz, label_618E7
    ld   [hl], $C8
    jp   label_3B12

label_618E7::
    cp   $10
    ld   a, $01
    jr   c, label_618EE
    inc  a

label_618EE::
    jp   label_3B0C
    call label_C05
    jr   nz, label_618FC
    call label_6172E
    jp   label_63F08

label_618FC::
    cp   $B0
    jr   nz, label_61900

label_61900::
    call label_C05
    cp   $80
    jr   nz, label_6190D
    dec  [hl]
    ld   a, $E6
    call label_2373

label_6190D::
    call label_C05
    ld   d, $00
    cp   $10
    ld   e, $02
    jr   c, label_6191E
    dec  e
    cp   $20
    jr   c, label_6191E
    inc  d

label_6191E::
    ld   hl, $C390
    add  hl, bc
    ld   [hl], d
    ld   a, e
    jp   label_3B0C

label_61927::
    rst  $38
    inc  b
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    nop
    rst  $38
    inc  d
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  b
    ld   [hl], b
    ld   bc, label_CFC
    ld   [hl], d
    ld   bc, label_40C
    ld   [hl], h
    ld   bc, label_C0C
    db   $76 ; Halt
    ld   bc, label_140C
    ld   a, b
    ld   bc, label_40C
    ld   a, d
    ld   bc, label_C0C
    ld   a, h
    ld   bc, label_140C
    ld   a, [hl]
    ld   bc, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_61963::
    nop
    nop
    ld   bc, label_302
    inc  bc
    ld   [bc], a
    ld   bc, $E7F0
    rra
    rra
    rra
    rra
    nop
    nop
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_61963
    add  hl, de
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [$FFEC], a
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_61995
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    rra
    and  $01
    inc  a
    ld   [$FFF1], a

label_61995::
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
    ld   hl, label_61927
    add  hl, de
    ld   c, $05
    jp   label_3CE6

label_619AC::
    ld   a, $00

label_619AE::
    ld   e, $10
    ld   hl, $D1B5

label_619B3::
    ldi  [hl], a
    dec  e
    jr   nz, label_619B3
    ret

label_619B8::
    ld   b, d
    ld   hl, label_2140
    ld   b, b
    ld   bc, $0142
    ld   b, h
    ld   bc, $0146
    ld   b, [hl]
    ld   hl, label_2144
    ld   c, b
    ld   bc, $014A
    ld   c, h
    ld   bc, $014E
    ld   c, d
    ld   hl, label_2148
    ld   c, [hl]
    ld   hl, label_214C
    ld   d, b
    ld   bc, label_152
    ld   d, h
    ld   bc, label_2154
    ld   d, d
    ld   hl, label_2150

label_619E4::
    ld   b, $04
    ld   [bc], a
    nop

label_619E8::
    ld   a, c
    ld   [$C50F], a
    call label_C05
    jr   z, label_61A3F
    cp   $10
    jr   nz, label_61A07
    dec  [hl]
    ld   a, [$FF99]
    push af
    ld   a, $28
    ld   [$FF99], a
    ld   a, $1F
    call label_2385
    pop  af
    ld   [$FF99], a
    ld   a, $0F

label_61A07::
    cp   $01
    jr   nz, label_61A18
    xor  a
    ld   [$C167], a
    ld   a, $31
    ld   [$D368], a
    ld   a, $05
    ld   [$FFB0], a

label_61A18::
    xor  a
    ld   [$C3B0], a
    ld   de, label_619B8
    call label_3BC0
    ld   a, $6C
    ld   [$FF9D], a
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $03
    ld   [$FF9E], a
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   a, [$FF99]
    sub  a, $10
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ret

label_61A3F::
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_61A8C
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_61A7F
    inc  [hl]
    call label_C05
    ld   [hl], $70
    ld   a, $10
    ld   [$D368], a
    ld   a, $FF
    ld   [$FFBF], a
    ld   a, [$FF98]
    ld   hl, $D155
    call label_61A79
    ld   a, [$FF99]
    ld   hl, $D175
    call label_61A79
    xor  a
    ld   hl, $D195
    call label_61A79
    ld   a, [$FF9E]
    ld   hl, $D1B5

label_61A79::
    ld   e, $10

label_61A7B::
    ldi  [hl], a
    dec  e
    jr   nz, label_61A7B

label_61A7F::
    ret

label_61A80::
    ld   [label_808], sp
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    add  hl, bc

label_61A88::
    ld   [label_6F8], sp
    ld   bc, $C8FA
    jp   label_28A7
    ld   d, l
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_61A80
    add  hl, de
    ld   a, [hl]
    ld   [$FFF1], a
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_61AE7
    ld   a, $C9
    call label_3B86
    jr   c, label_61AE7
    ld   a, [$FFD8]
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
    ld   hl, label_61A88
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_61A8A
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

label_61AE7::
    ld   de, label_619B8
    call label_3BC0
    ld   a, [$C14F]
    and  a
    ret  nz
    ld   hl, $C480
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_61B03
    dec  a
    jr   nz, label_61B03
    dec  [hl]
    ld   a, $7A
    call label_237C

label_61B03::
    ld   hl, $C300
    add  hl, bc
    ld   a, [$C16B]
    cp   $04
    jr   z, label_61B13
    ld   a, [hl]
    and  a
    jr   z, label_61B13
    dec  [hl]

label_61B13::
    ld   a, [hl]
    and  a
    jr   z, label_61B6A
    cp   $30
    jr   nz, label_61B55
    xor  a
    ld   [$C167], a
    ld   a, [$FF98]
    sub  a, $58
    add  a, $03
    cp   $06
    jr   nc, label_61B33
    ld   a, [$FF99]
    sub  a, $50
    add  a, $03
    cp   $06
    jr   c, label_61B3B

label_61B33::
    ld   [hl], b
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $1C
    ret

label_61B3B::
    ld   hl, $FFF2
    ld   [hl], $0B
    ld   hl, $FFF3
    ld   [hl], $03
    ld   hl, $C157
    ld   [hl], $18
    ld   hl, $C158
    ld   [hl], $04
    ld   hl, $FF98
    inc  [hl]
    jr   label_61B61

label_61B55::
    jr   nc, label_61B6A
    cp   $10
    jr   nz, label_61B61
    dec  [hl]
    ld   a, $7B
    call label_237C

label_61B61::
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $6A
    ld   [$FF9D], a
    ret

label_61B6A::
    ld   a, [$DB74]
    ld   hl, $C1BC
    or   [hl]
    ret  nz
    ld   a, [$DB10]
    and  a
    jp   z, label_61C6A
    call label_3B23
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_63DE8
    ld   a, [$D468]
    and  a
    jr   z, label_61B90
    dec  a
    ld   [$D468], a

label_61B90::
    ld   a, [$FFF0]
    rst  0
    sbc  a, l
    ld   e, e
    or   h
    ld   e, e
    ret  nc
    ld   e, e
    rlca
    ld   e, h
    add  hl, sp
    ld   e, h
    ld   a, [$C11C]
    cp   $03
    ret  z
    ld   a, $40
    ld   [$D468], a
    ld   a, $0F
    ld   [$FFA5], a
    ld   a, $01
    call label_3B0C
    jp   label_3B12
    ld   a, [$D468]
    and  a
    ret  nz
    ld   a, $18
    ld   [$D468], a
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $01
    ld   a, $04
    call label_3B0C
    ld   a, $10
    ld   [$FFA5], a
    jp   label_3B12
    ld   a, [$D468]
    and  a
    ret  nz
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $F4
    call label_63E6C
    ld   a, [$FFE7]
    and  $08
    ld   e, $04
    jr   z, label_61BE7
    inc  e

label_61BE7::
    ld   a, e
    call label_3B0C
    call label_63EB2
    add  a, $02
    cp   $04
    ret  nc
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], $02
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $02
    ld   a, $10
    ld   [$D468], a
    jp   label_3B12
    ld   a, [$D468]
    and  a
    ret  nz
    ld   a, [$DB10]
    dec  a
    ld   e, a
    ld   a, [$C163]
    cp   e
    jr   z, label_61C27
    and  a
    jr   z, label_61C27
    ld   e, $1C
    call label_280D
    and  $3F
    jr   nz, label_61C32
    ld   e, $1E
    jr   label_61C32

label_61C27::
    ld   e, $1B
    ld   a, [$DB47]
    cp   $80
    jr   nc, label_61C32
    ld   e, $1D

label_61C32::
    ld   a, e
    call label_237C
    jp   label_3B12
    xor  a
    ld   [$DB10], a
    ld   [$C167], a
    call label_3B12
    ld   [hl], b
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], $FF
    ld   a, [$FFEE]
    ld   hl, $D155
    call label_61C63
    ld   hl, $D175
    ld   a, [$FFEC]
    ld   e, $10

label_61C59::
    ldi  [hl], a
    dec  a
    dec  e
    jr   nz, label_61C59
    ld   a, $02
    ld   hl, $D1B5

label_61C63::
    ld   e, $10

label_61C65::
    ldi  [hl], a
    dec  e
    jr   nz, label_61C65
    ret

label_61C6A::
    ld   a, [$C16B]
    cp   $04
    ret  nz
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
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_619E4
    add  hl, de
    push hl
    ld   a, [$C120]
    rra
    rra
    rra
    pop  hl
    and  $01
    or   [hl]
    call label_3B0C
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE8], a
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, $D155
    add  hl, de
    ld   a, [$FF9F]
    ld   [hl], a
    ld   a, [$FFA0]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $D175
    add  hl, de
    ld   [hl], a
    ld   hl, $D1B5
    add  hl, de
    ld   a, [$FF9E]
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE9], a
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, $D195
    add  hl, de
    ld   a, [$FFA2]
    ld   [hl], a
    ld   a, [$C11C]
    cp   $02
    jr   z, label_61CEA
    ld   a, [$C124]
    and  a
    jr   nz, label_61CEA
    ld   a, [$C19F]
    and  a
    jr   nz, label_61CEF
    ld   hl, $FF9A
    ld   a, [$FF9B]
    or   [hl]
    jr   z, label_61CEF

label_61CEA::
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]

label_61CEF::
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [$FFE8]
    inc  a
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, $D155
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, $D175
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   hl, $D1B5
    add  hl, de
    ld   a, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFE9]
    inc  a
    and  $0F
    ld   e, a
    ld   d, b
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    push af
    ld   hl, $D195
    add  hl, de
    ld   e, [hl]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], e
    call label_C00
    ld   hl, $C124
    or   [hl]
    jr   nz, label_61D7D
    pop  af
    cp   e
    jr   z, label_61D7A
    and  a
    jr   z, label_61D6F
    ld   a, e
    and  a
    jr   nz, label_61D7A
    call label_3B23
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    cp   $02
    ret  z
    ld   hl, $C470
    add  hl, bc
    ld   a, [hl]
    dec  a
    cp   $02
    jr   c, label_61D5E
    ld   a, $07
    ld   [$FFF4], a
    ret

label_61D5E::
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, $0C
    jp   label_CC7

label_61D6F::
    ld   a, e
    cp   $08
    ld   a, $08
    jr   nc, label_61D78
    ld   a, $24

label_61D78::
    ld   [$FFF2], a

label_61D7A::
    jp   label_3B23

label_61D7D::
    pop  af
    ret

label_61D7F::
    nop
    ld   bc, $00FF
    db   $10
    db   $F0
    call label_63DE8
    ld   a, $01
    ld   [$FFA4], a
    inc  a
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$FFCC]
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_61D7F
    add  hl, de
    ld   a, [$C109]
    push af
    add  a, [hl]
    and  $0F
    ld   e, a
    pop  af
    and  $F0
    or   e
    ld   [$C109], a
    ld   a, [$FFCC]
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_61D82
    add  hl, de
    ld   a, [$C109]
    add  a, [hl]
    ld   [$C109], a
    ld   a, [$C19F]
    and  a
    jr   nz, label_61DDC
    ld   a, [$FFCC]
    and  $10
    jr   z, label_61DD0
    ld   a, [$C109]
    jp   label_2385

label_61DD0::
    ld   a, [$FFCC]
    and  $20
    jr   z, label_61DDC
    ld   a, [$C109]
    jp   label_2373

label_61DDC::
    ld   a, [$FFCC]
    and  $40
    jr   z, label_61DE8
    ld   a, [$C109]
    jp   label_237C

label_61DE8::
    ret
    call label_63DE8
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_61DF6
    ld   hl, $C1BF
    inc  [hl]

label_61DF6::
    ret

label_61DF7::
    ld   e, [hl]
    ld   bc, label_215E

label_61DFB::
    nop
    ld    hl, sp+$50
    ld   b, $00
    nop
    ld   d, d
    ld   b, $00
    ld   [label_654], sp
    nop
    db   $10
    db   $56
    ld   b, $00
    ld    hl, sp+$50
    inc  bc
    nop
    nop
    ld   d, d
    inc  bc
    nop
    ld   [label_354], sp
    nop
    db   $10
    db   $56
    inc  bc

label_61E1B::
    ld   hl, label_61DFB
    ld   a, [$C3CC]
    and  a
    jr   nz, label_61E27
    ld   hl, label_61E0B

label_61E27::
    ld   c, $04
    call label_3CE6
    ld   a, $02
    call label_3DA0
    ld   a, [$FFF0]
    rst  0
    db   $3A ; ldd  a, [hl]
    ld   e, [hl]
    ld   b, e
    ld   e, [hl]
    ld   e, l
    ld   e, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], $50
    jp   label_3B12
    call label_63DE8
    call label_C05
    ret  nz
    call label_63D95
    ret  nc
    ld   a, [$DB97]
    cp   $E4
    jr   nz, label_61E58
    jp   label_3B12

label_61E58::
    ld   a, $E6
    jp   label_2385
    call label_63DE8
    ld   a, [$C19F]
    and  a
    jr   nz, label_61E79
    ld   a, $0A
    call label_60CB0
    call label_C05
    ld   [hl], $20
    call label_3B12
    ld   [hl], b
    ld   hl, $D8AC
    set  4, [hl]

label_61E79::
    ret
    ld   a, [$FFF7]
    cp   $16
    jp   z, label_61E1B
    ld   a, [$FFEC]
    add  a, $01
    ld   [$FFEC], a
    ld   de, label_61DF7
    call label_3BC0
    call label_63D36
    call label_63DE8
    call label_63D95
    ret  nc
    ld   a, [$DBCE]
    and  a
    ld   a, $10
    jr   nz, label_61EA2
    jp   label_2373

label_61EA2::
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_61EAD
    ld   a, $63
    jp   label_237C

label_61EAD::
    ld   a, $18
    call label_AEA
    ld   a, [$FFD7]
    jp   label_237C

label_61EB7::
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
    ld   a, [$DB6B]
    and  $02
    jp   z, label_63F08
    ld   a, [$DB7B]
    and  a
    jp   nz, label_63F08
    ld   a, [$FFF8]
    and  $10
    jp   nz, label_63F08
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_620F5
    ld   a, c
    ld   [$C50F], a
    ld   de, label_61EB7
    call label_3BC0
    call label_63D60
    call label_63E98
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  a
    ld   [$FFE8], a
    jr   z, label_61F1A
    and  $80
    jr   z, label_61F20

label_61F1A::
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b

label_61F20::
    ld   a, [$FFF0]
    rst  0
    ld   b, e
    ld   e, a
    ld   [hl], e
    ld   e, a
    add  a, c
    ld   e, a
    sbc  a, d
    ld   e, a
    bit  3, a
    db   $ED ; Undefined instruction
    ld   e, a
    rst  $38
    ld   e, a
    ld   d, $60
    inc  l
    ld   h, b
    ld   c, a
    ld   h, b
    ld   d, a
    ld   h, b
    ld   [hl], e
    ld   h, b
    sub  a, e
    ld   h, b

label_61F3D::
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b
    ret
    call label_61F5E
    call label_63DE8
    call label_63EB2
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   a, [$FF98]
    cp   $90
    ret  nc
    ld   a, $35
    call label_237C
    jp   label_3B12

label_61F5E::
    ld   a, [$FFE8]
    and  a
    jr   z, label_61F66
    and  $80
    ret  z

label_61F66::
    ld   a, [$FFE7]
    and  $3F
    jr   nz, label_61F72
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10

label_61F72::
    ret
    call label_61F5E
    call label_63DE8
    ld   a, $36
    call label_237C
    jp   label_3B12
    call label_61F5E
    call label_63DE8
    call label_63EB2
    add  a, $08
    cp   $10
    ret  nc
    call label_63EC2
    add  a, $10
    cp   $20
    ret  nc
    jp   label_3B12
    call label_61F3D
    call label_63DE8
    call label_63EB2
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    ld   a, [$C1A4]
    and  a
    jr   z, label_61FBF
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    add  a, $10
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ret

label_61FBF::
    xor  a
    ld   [$C19B], a
    call label_C05
    ld   [hl], $10
    jp   label_3B12
    call label_61F3D
    call label_63DE8
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, $00
    ld   [$FF9E], a
    push bc
    call label_BF0
    pop  bc
    call label_C05
    ret  nz
    ld   a, $37
    call label_237C
    jp   label_3B12
    call label_61F3D
    call label_63DE8
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $38
    call label_237C
    jp   label_3B12
    call label_61F3D
    ld   a, $02
    ld   [$FFA1], a
    call label_63DE8
    ld   a, $39
    call label_237C
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], b
    jp   label_3B12
    call label_61F3D
    ld   a, $02
    ld   [$FFA1], a
    call label_63DE8
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $A0
    ret  nz
    jp   label_3B12
    call label_61F3D
    ld   a, $02
    ld   [$FFA1], a
    call label_63DE8
    ld   a, $C2
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $12
    ld   hl, $C210
    add  hl, de
    ld   [hl], $88
    ld   hl, $C2C0
    add  hl, de
    inc  [hl]
    jp   label_3B12
    call label_61F3D
    ld   a, $02
    ld   [$FFA1], a
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   a, [$FFEC]
    cp   $3E
    jr   c, label_62064
    jp   label_3B12

label_62064::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $06
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $03
    jp   label_63E62
    ld   a, $02
    ld   [$FFA1], a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $FA
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $01
    call label_63E6C
    ld   a, [$FFEE]
    cp   $18
    ret  nc
    call label_C05
    ld   [hl], $60
    jp   label_3B12
    ld   a, $02
    ld   [$FFA1], a
    call label_C05
    jr   z, label_620A3
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $02
    ret

label_620A3::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $F4
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $01
    call label_63E6C
    ld   a, [$FFEE]
    cp   $F0
    jr   nz, label_620C7
    xor  a
    ld   [$C167], a
    ld   hl, $D808
    set  4, [hl]
    ld   a, [hl]
    ld   [$FFF8], a
    jp   label_63F08

label_620C7::
    call label_63EB2
    ld   a, e
    xor  $01
    ld   [$FF9E], a
    push bc
    call label_BF0
    pop  bc
    ret

label_620D5::
    ld   d, b
    ld   [bc], a
    ld   d, d
    ld   [bc], a
    ld   d, d
    ldi  [hl], a
    ld   d, b
    ldi  [hl], a
    ld   d, h
    ld   [bc], a
    ld   d, [hl]
    ld   [bc], a
    ld   d, [hl]
    ldi  [hl], a
    ld   d, h
    ldi  [hl], a
    ld   e, b
    ld   [bc], a
    ld   e, d
    ld   [bc], a
    ld   e, h
    ld   [bc], a
    ld   e, [hl]
    ld   [bc], a
    ld   e, d
    ldi  [hl], a
    ld   e, b
    ldi  [hl], a
    ld   e, [hl]
    ldi  [hl], a
    ld   e, h
    ldi  [hl], a

label_620F5::
    ld   de, label_620D5
    call label_3BC0
    call label_63D60
    ld   a, [$FFF0]
    rst  0
    add  hl, bc
    ld   h, c
    add  hl, sp
    ld   h, c
    ld   c, a
    ld   h, c
    ld   [hl], e
    ld   h, c
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $02
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F4
    call label_63E62
    ld   a, [$FFEC]
    cp   $70
    ret  nc
    ld   a, $3B
    call label_237C
    ld   a, $03
    ld   [$FF9E], a
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C380
    add  hl, de
    ld   [hl], $03
    push bc
    call label_BF0
    pop  bc
    jp   label_3B12
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C380
    add  hl, de
    ld   [hl], $03
    call label_63DE8
    ld   a, $3A
    call label_237C
    jp   label_3B12
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C380
    add  hl, de
    ld   [hl], $03
    ld   a, [$C170]
    cp   $22
    jr   c, label_62163
    ld   [hl], $01

label_62163::
    call label_63DE8
    ld   a, [$C50F]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    inc  [hl]
    jp   label_3B12
    ld   hl, $C380
    add  hl, bc
    ld   [hl], $01
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $F8
    call label_63E6C
    ld   a, [$FFEE]
    cp   $E0
    ret  nz
    jp   label_63F08
    ld   a, [$DB73]
    and  a
    jp   nz, label_619E8
    ld   a, [$DB74]
    and  a
    ret  nz
    ld   a, [$D8FD]
    and  $20
    jp   nz, label_63F08
    ld   a, [$DB0E]
    cp   $07
    jp  c, label_63F08
    ld   de, label_61EB7
    call label_3BC0
    ld   a, [$C124]
    and  a
    ret  nz
    call label_63D36
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFF0]
    rst  0
    pop  de
    ld   h, c
    db   $61
    ld   h, c
    rst  $30
    ld   h, c
    dec  d
    ld   h, d
    ld   b, [hl]
    ld   h, d
    ld   d, e
    ld   h, d
    ld   h, a
    ld   h, d
    ld   a, $4D
    ld   [$D368], a
    ld   [$FFB0], a
    ld   [$FFBD], a
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_63EC2
    add  a, $14
    cp   $28
    ret  nc
    ld   a, $01
    ld   [$C167], a
    call label_C05
    ld   [hl], $18
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C05
    jr   nz, label_62209
    ld   a, $D5
    call label_2373
    call label_3B12

label_62209::
    ld   e, $02
    cp   $0C
    jr   c, label_62211
    ld   e, $04

label_62211::
    ld   a, e
    jp   label_3B0C
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_6223D
    ld   [hl], $06
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$D47C], a
    ld   [$DB96], a
    ld   a, $09
    ld   [$DB95], a
    ld   a, $4E
    ld   [$D368], a
    ret

label_6223D::
    xor  a
    ld   [$C167], a
    ld   a, $D6
    jp   label_2373
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_C05
    ld   [hl], $60
    jp   label_3B12
    call label_C05
    jr   nz, label_6225B
    call label_3B12

label_6225B::
    ld   e, $00
    cp   $54
    jr   c, label_62263
    ld   e, $04

label_62263::
    ld   a, e
    jp   label_3B0C
    ret

label_62268::
    ld   h, l
    ld   h, h
    ld   d, h
    ld   d, d
    ldi  [hl], a
    ldi  [hl], a
    ldd  [hl], a
    scf
    scf
    scf
    ld   d, a
    ld   d, [hl]
    ld   h, $21

label_62276::
    call nz, label_D5C5
    call nc, label_C5C4
    push de
    push de
    push bc
    call nz, label_C5C4
    push de
    call nc, label_A9AB
    xor  h
    xor  d
    xor  e
    xor  c
    xor  e
    xor  d
    xor  h
    xor  c
    xor  e
    xor  c
    xor  h
    xor  [hl]
    call label_63DE8
    ld   a, [$FFF6]
    cp   $B4
    jr   nz, label_622A2
    xor  a
    ld   [$D472], a
    ld   [$D473], a

label_622A2::
    ld   a, [$D473]
    and  a
    jr   z, label_622F4
    ld   a, [$D472]
    ld   e, a
    ld   d, b
    ld   hl, label_62268
    add  hl, de
    ld   a, [$D473]
    cp   [hl]
    jr   nz, label_622E4
    ld   hl, label_62276
    add  hl, de
    ld   a, [$FFF6]
    cp   [hl]
    jr   nz, label_622E4
    xor  a
    ld   [$D473], a
    ld   a, [$D472]
    inc  a
    ld   [$D472], a
    cp   $0E
    jr   nz, label_622DC
    xor  a
    ld   [$D472], a
    ld   a, $02
    ld   [$FFF2], a
    push de
    call label_622F5
    pop  de

label_622DC::
    ld   hl, label_62284
    add  hl, de
    ld   a, [hl]
    jp   label_2373

label_622E4::
    xor  a
    ld   [$D472], a
    ld   [$D473], a
    ld   a, $1D
    ld   [$FFF2], a
    ld   a, $AD
    call label_2373

label_622F4::
    ret

label_622F5::
    ld   hl, $D739
    ld   [hl], $C6
    ld   a, $98
    call label_B2F
    ld   a, $28
    ld   [$D416], a
    ld   a, $20
    ld   [$FFCD], a
    add  a, $10
    ld   [$FFD8], a
    ld   a, $80
    ld   [$FFCE], a
    add  a, $08
    ld   [$FFD7], a
    ld   a, $02
    call label_CC7
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_6232D
    push bc
    ld   a, $C6
    ld   [$DDD8], a
    ld   a, $18
    call label_91D
    pop  bc

label_6232D::
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
    ld   a, $68
    ldi  [hl], a
    ld   a, $77
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $69
    ldi  [hl], a
    ld   a, $4B
    ldi  [hl], a
    ld   [hl], $00
    ld   a, $01
    ld   [$FFAC], a
    ld   a, [$FFCD]
    and  $F0
    add  a, $10
    ld   [$FFAE], a
    ld   a, [$FFCE]
    and  $F0
    add  a, $08
    ld   [$FFAD], a
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, $D800
    add  hl, de
    set  4, [hl]
    ret

label_6237D::
    db   $10
    db   $20
    jr   nc, label_623C1
    ld   d, b
    ld   h, b
    ld   [hl], b
    add  a, b

label_62385::
    jr   label_623AF
    jr   c, label_623D1
    ld   e, b
    ld   l, b
    ld   a, b
    adc  a, b
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_6240C
    call label_63DE8
    call label_C05
    jr   nz, label_623F7
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_62385
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a

label_623AF::
    ld   hl, label_6237D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    call label_62493
    ld   a, [$FFDA]
    cp   $00
    jr   z, label_623C9
    cp   $06
    jr   z, label_623C9
    cp   $09
    ret  nz

label_623C9::
    call label_C05
    call label_280D
    and  $3F

label_623D1::
    add  a, $40
    ld   [hl], a
    ld   a, $BF
    ld   e, $05
    call label_3B98
    jr   c, label_623F7
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
    ld   hl, $C340
    add  hl, de
    res  6, [hl]

label_623F7::
    ret

label_623F8::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   l, h
    ld   [bc], a
    ld   l, h
    ldi  [hl], a
    ld   l, b
    ld   [bc], a
    ld   l, d
    ld   [bc], a
    ld   h, b
    ld   [bc], a
    ld   h, d
    ld   [bc], a
    ld   h, h
    ld   [bc], a
    ld   h, [hl]
    ld   [bc], a

label_6240C::
    ld   de, label_623F8
    call label_3BC0
    call label_63DE8
    call label_63E15
    ld   a, [$FFF0]
    rst  0
    inc  hl
    ld   h, h
    dec  hl
    ld   h, h
    ld   d, b
    ld   h, h
    add  a, d
    ld   h, h
    call label_C05
    ld   [hl], $30
    jp   label_3B12
    call label_C05
    jr   nz, label_62445
    call label_280D
    and  $3F
    add  a, $70
    ld   [hl], a
    call label_280D
    and  $07
    add  a, $05
    call label_3BAA
    call label_3B12

label_62445::
    ld   e, $01
    cp   $18
    jr   nc, label_6244C
    inc  e

label_6244C::
    ld   a, e
    jp   label_3B0C
    call label_63E5F
    call label_3B23
    call label_3B39
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $0F
    jr   nz, label_62467
    call label_C05
    jr   nz, label_62475

label_62467::
    call label_C05
    ld   [hl], $30
    call label_3B12
    ld   hl, $C340
    add  hl, bc
    set  6, [hl]

label_62475::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    add  a, $03
    jp   label_3B0C
    call label_C05
    jp   z, label_63F08
    ld   e, $01
    cp   $18
    jr   c, label_6248F
    inc  e

label_6248F::
    ld   a, e
    jp   label_3B0C

label_62493::
    push bc
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    sub  a, $01
    ld   [$FFDB], a
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   hl, $C210
    add  hl, bc
    ld   c, a
    ld   a, [hl]
    sub  a, $07
    ld   [$FFDC], a
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   c, a
    ld   b, $00
    ld   hl, $D711
    ld   a, h
    add  hl, bc
    ld   h, a
    pop  bc
    ld   a, [hl]
    ld   [$FFAF], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A26
    ld   [$FFDA], a
    ret
    db   $EC ; Undefined instruction
    inc  d
    call label_628EA
    ld   a, [$FFEA]
    cp   $01
    jp   z, label_63F0F
    call label_63DE8
    call label_3EE8
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_624EA
    inc  [hl]
    call label_BFB
    ld   [hl], $20

label_624EA::
    call label_C00
    jr   z, label_6250A
    ld   a, [$C13E]
    and  a
    cp   $01
    jr   nz, label_624FC
    ld   hl, $FFF2
    ld   [hl], $33

label_624FC::
    and  a
    jr   nz, label_6250A
    ld   a, $02
    ld   [$FFA1], a
    ld   a, $6A
    ld   [$FF9D], a
    call label_629C5

label_6250A::
    call label_63E15
    call label_3B65
    ld   a, [$C13E]
    and  a
    jr   nz, label_62519
    call label_3B39

label_62519::
    call label_63E5F
    call label_3B23
    call label_63E98
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
    and  a
    jr   z, label_6253E
    ld   [hl], b
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    call label_3D7F

label_6253E::
    call label_625CF
    call label_63EB2
    ld   hl, $C380
    add  hl, bc
    ld   [hl], e
    call label_63EC2
    cp   $00
    jr   z, label_6255B
    ld   d, b
    ld   hl, label_624C8
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_6255B::
    ld   a, [$FFE8]
    and  a
    jr   z, label_62588
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $10
    call label_280D
    and  $0F
    sub  a, $08
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    call label_63EB2
    add  a, $28
    cp   $50
    jr   c, label_62588
    ld   a, $08
    call label_3BB5
    ld   a, [$FFD8]
    ld   hl, $C240
    add  hl, bc
    add  a, [hl]
    ld   [hl], a

label_62588::
    call label_62596
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_62596::
    call label_C00
    jr   z, label_6259F
    ld   a, $03
    jr   label_625B8

label_6259F::
    call label_BFB
    jr   nz, label_625CE
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   nc, label_625B2
    inc  [hl]
    ld   a, $01
    jr   label_625B8

label_625B2::
    call label_280D
    and  $03
    inc  a

label_625B8::
    ld   [$D205], a
    cp   $01
    jr   nz, label_625C3
    ld   a, $0A
    ld   [$FFF4], a

label_625C3::
    call label_C05
    ld   [hl], $00
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], $00

label_625CE::
    ret

label_625CF::
    ld   a, [$D205]
    and  a
    ret  z
    pop  de
    dec  a
    rst  0
    db   $EC ; Undefined instruction
    ld   h, l
    ld   b, e
    ld   h, [hl]
    call label_EC66
    ld   h, l

label_625DF::
    ld   bc, $0101
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   bc, label_5CD
    inc  c
    jr   nz, label_6260B
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $0D
    jp   z, label_6260C
    inc  [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_625DF
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    call label_C05
    ld   [hl], $01

label_6260B::
    ret

label_6260C::
    call label_280D
    and  $03
    jp   z, label_6272A
    ld   a, $01
    jp   label_625B8

label_62619::
    inc  b
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
    ld   b, $07
    ld   [label_808], sp
    ld   [label_708], sp
    ld   b, $01

label_6262E::
    ld   [label_810], sp
    ld   [$0002], sp
    nop
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$F0
    ld    hl, sp+$E0
    sub  a, b
    and  b
    nop
    nop
    nop
    nop
    nop
    nop
    call label_C05
    jr   nz, label_62678
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $15
    jp   z, label_6272A
    inc  [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_62619
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, label_6262E
    add  hl, de
    ld   e, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_6266E
    ld   a, e
    cpl
    inc  a
    ld   e, a

label_6266E::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    call label_C05
    ld   [hl], $03

label_62678::
    ret

label_62679::
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    inc  c
    inc  c
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    inc  c
    inc  c
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    inc  c
    inc  c
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
    dec  c
    ld   c, $0F
    db   $10
    db   $11
    ld   de, $0111

label_626A3::
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [$0008], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FFE0]
    ret  nc
    ret  nz
    ret  nz
    ld   [$FFF0], a
    nop
    nop
    nop
    call label_C05
    jr   nz, label_62729
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $2A
    jp   z, label_6272A
    ld   e, a
    cp   $28
    jr   nz, label_626E8
    ld   a, [$C11C]
    cp   $0A
    jr   z, label_626E9

label_626E8::
    inc  [hl]

label_626E9::
    ld   d, b
    ld   hl, label_62679
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, label_626A3
    add  hl, de
    ld   e, [hl]
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_62703
    ld   a, e
    cpl
    inc  a
    ld   e, a

label_62703::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    call label_C00
    jr   z, label_62724
    call label_63EB2
    add  a, $30
    cp   $60
    jr   c, label_62724
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $18
    jr   nc, label_62724
    ld   a, $10
    call label_3BAA

label_62724::
    call label_C05
    ld   [hl], $03

label_62729::
    ret

label_6272A::
    xor  a
    ld   [$D205], a
    call label_BFB
    call label_280D
    and  $0F
    add  a, $0C
    ld   [hl], a
    ret

label_6273A::
    nop
    ld    hl, sp+$6C
    inc  bc
    nop
    nop
    ld   l, [hl]
    inc  bc
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    rst  $38
    ld    hl, sp+$6C
    inc  bc
    rst  $38
    nop
    ld   l, [hl]
    inc  bc
    nop
    nop
    ld   h, h
    ld   bc, label_800
    ld   h, [hl]
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    nop
    ld    hl, sp+$6E
    inc  hl
    nop
    nop
    ld   l, h
    inc  hl
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $F8FD
    ld   l, h
    inc  bc
    db   $FD ; Undefined instruction
    nop
    ld   l, [hl]
    inc  bc
    db   $FD ; Undefined instruction
    ld   a, [$FF6C]
    inc  bc
    db   $FD ; Undefined instruction
    ld    hl, sp+$6E
    inc  bc
    nop
    ld    hl, sp+$6E
    inc  hl
    nop
    nop
    ld   l, h
    inc  hl
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $0000
    ld   l, [hl]
    inc  hl
    nop
    ld   [label_236C], sp
    nop
    nop
    ld   h, h
    ld   bc, label_800
    ld   h, [hl]
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    db   $FD ; Undefined instruction
    ld   [label_236E], sp
    db   $FD ; Undefined instruction
    db   $10
    db   $6C
    inc  hl
    nop
    nop
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    nop
    ld    hl, sp+$6C
    inc  bc
    nop
    nop
    ld   l, [hl]
    inc  bc
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $0000
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    nop
    ld   a, [$FF6C]
    inc  bc
    nop
    ld    hl, sp+$6E
    inc  bc
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $0000
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    nop
    db   $E8 ; add  sp, d
    ld   l, h
    inc  bc
    nop
    ld   a, [$FF6E]
    inc  bc
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $0000
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    ld    hl, sp+$10
    ld   l, h
    inc  bc
    ld    hl, sp+$18
    ld   l, [hl]
    inc  bc
    nop
    nop
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    ld   a, [$FF08]
    ld   l, h
    inc  bc
    ld   a, [$FF10]
    ld   l, [hl]
    inc  bc
    nop
    nop
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    db   $FC ; Undefined instruction
    ld   [label_236E], sp
    db   $FC ; Undefined instruction
    db   $10
    db   $6C
    inc  hl
    nop
    nop
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    nop
    db   $10
    db   $6E
    inc  hl
    nop
    jr   label_628CD
    inc  hl
    nop
    nop
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    inc  b
    ld   [label_236E], sp
    inc  b
    db   $10
    db   $6C
    inc  hl
    nop
    nop
    ld   l, b
    ld   bc, label_800
    ld   l, d
    ld   bc, $F8FD
    ld   l, [hl]
    inc  hl
    db   $FD ; Undefined instruction
    nop
    ld   l, h
    inc  hl
    ld   [label_62C00], sp
    inc  bc
    ld   [label_62E08], sp
    inc  bc
    nop
    nop
    ld   h, h
    ld   bc, label_800
    ld   h, [hl]
    ld   bc, $0000
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    ld   [label_62CF8], sp
    inc  bc
    ld   [label_62E00], sp
    inc  bc
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $0000
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    dec  b
    ld   a, [$FF6C]
    inc  bc
    dec  b
    ld    hl, sp+$6E
    inc  bc
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $0000
    rst  $38

label_628CD::
    nop
    nop
    nop
    rst  $38
    nop
    db   $F4 ; Undefined instruction
    ld   a, [$FF6E]
    inc  hl
    db   $F4 ; Undefined instruction
    ld    hl, sp+$6C
    inc  hl
    nop
    nop
    ld   h, b
    ld   bc, label_800
    ld   h, d
    ld   bc, $0000
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop

label_628EA::
    ld   a, $80
    ld   [$D5C0], a
    ld   [$D5C2], a
    ld   a, [$FFF1]
    sla  a
    sla  a
    ld   d, b
    sla  a
    ld   e, a
    rl   d
    sla  a
    rl   d
    add  a, e
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    xor  a
    ld   [$FFE8], a
    ld   hl, $C380
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_6291B
    inc  a
    ld   [$FFE8], a
    ld   hl, $FFED
    set  5, [hl]

label_6291B::
    ld   hl, label_6273A
    add  hl, de
    ld   c, $06
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    ld   a, c
    ld   [$FFD7], a
    ld   a, [$C123]
    ld   c, a
    call label_3D57
    ld   a, [$FFD7]
    ld   c, a

label_6293C::
    ld   a, [$D5C2]
    cp   $80
    jr   nz, label_62949
    ld   a, [hl]
    add  a, $08
    ld   [$D5C2], a

label_62949::
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [de], a
    inc  hl
    inc  de
    push bc
    ld   a, [$C155]
    ld   c, a
    ld   b, [hl]
    ld   a, [$FFE8]
    and  a
    jr   z, label_62960
    ld   a, b
    cpl
    inc  a
    add  a, $08
    ld   b, a

label_62960::
    ld   a, [$D5C0]
    cp   $80
    jr   nz, label_62972
    ld   a, [$FFE8]
    and  a
    ld   a, b
    jr   nz, label_6296F
    add  a, $08

label_6296F::
    ld   [$D5C0], a

label_62972::
    ld   a, [$FFEE]
    add  a, b
    sub  a, c
    ld   [de], a
    inc  hl
    inc  de
    pop  bc
    ld   a, [hli]
    ld   [de], a
    cp   $FF
    jr   nz, label_62984
    dec  de
    xor  a
    ld   [de], a
    inc  de

label_62984::
    inc  de
    ld   a, [$FFED]
    xor  [hl]
    ld   [de], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_6299A
    ld   a, [$FFED]
    bit  4, a
    jr   z, label_6299A
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

label_6299A::
    inc  hl
    inc  de
    dec  c
    jr   nz, label_6293C
    ld   a, $08
    ld   [$D5C1], a
    ld   a, $04
    ld   [$D5C3], a
    ld   a, [$C123]
    ld   c, a
    ld   a, $06
    call label_3DA0
    jp   label_3CD9

label_629B5::
    nop
    cp   $FD
    cp   $00
    ld   [bc], a
    inc  bc
    ld   [bc], a

label_629BD::
    nop
    inc  b
    ld   [label_100C], sp
    inc  c
    ld   [label_2104], sp
    db   $10
    db   $C0
    ld   a, [$FFE7]
    rra
    rra
    rra
    push af
    and  $07
    call label_629D8
    pop  af
    add  a, $04
    and  $07

label_629D8::
    push bc
    push hl
    ld   e, a
    ld   d, $00
    ld   hl, label_629B5
    add  hl, de
    ld   b, [hl]
    ld   hl, label_629BD
    add  hl, de
    ld   c, [hl]
    pop  hl
    ld   a, [$FF99]
    add  a, b
    add  a, $F6
    ldi  [hl], a
    ld   a, [$FF98]
    add  a, c
    add  a, $FC
    ldi  [hl], a
    ld   [hl], $24
    inc  hl
    ld   [hl], $00
    inc  hl
    pop  bc
    ret
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $02
    jp   z, label_62F1F
    and  a
    jp   nz, label_62F70
    ld   a, [$FFEA]
    cp   $01
    jr   nz, label_62A71
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $0C
    ld   [$FFE8], a
    call label_62A31
    ld   a, $F4
    ld   [$FFE8], a
    call label_62A31
    call label_3F5E
    jp   label_63F08

label_62A31::
    ld   a, $BD
    call label_3B86
    jr   c, label_62A70
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C460
    add  hl, de
    ld   [hl], a
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
    ld   [hl], $01
    ld   a, [$FFE8]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20
    ld   hl, $C360
    add  hl, de
    ld   [hl], $01

label_62A70::
    ret

label_62A71::
    call label_62EFB
    ld   a, [$FFF6]
    ld   hl, $C3E0
    add  hl, bc
    cp   [hl]
    jr   z, label_62A8B
    ld   a, [$FFEE]
    cp   $98
    jp   nc, label_63F08
    ld   a, [$FFEC]
    cp   $70
    jp   nc, label_63F08

label_62A8B::
    call label_63DE8
    call label_63E15
    call label_63E5F
    call label_63E98
    ld   a, [$FFF0]
    rst  0
    xor  d
    ld   l, d
    bit  5, d
    sbc  a, h
    ld   l, e
    call c, label_EC6B
    ld   l, h
    jr   label_62B13
    ld   l, c
    ld   l, l
    add  a, d
    ld   l, l
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $03
    call label_C05
    ld   [hl], $C0
    ld   hl, $C450
    add  hl, bc
    ld   [hl], $80
    call label_3D7F
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $08
    jp   label_3B12
    ld   [label_8F8], sp
    ld    hl, sp+$CD
    dec  sp
    ld   l, [hl]
    call label_63EB2
    add  a, $1C
    cp   $38
    jr   nc, label_62B02
    call label_63ED2
    add  a, $20
    cp   $40
    jr   nc, label_62B02
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
    call label_3B12
    ld   [hl], $03
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $FF

label_62B02::
    ld   hl, $C450
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_62B15
    call label_3B12
    ld   [hl], $02
    call label_C05
    ld   [hl], $20
    ret

label_62B15::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    sub  a, $28
    jr   z, label_62B30
    ld   e, $08
    and  $80
    jr   nz, label_62B2B
    ld   e, $F8

label_62B2B::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], e

label_62B30::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  $03
    jr   z, label_62B4B
    ld   e, a
    ld   d, b
    ld   hl, label_62AC8
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $00

label_62B4B::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    rra
    rra
    and  $03
    jr   z, label_62B68
    ld   e, a
    ld   d, b
    ld   hl, label_62AC6
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $00

label_62B68::
    call label_C05
    jr   nz, label_62B7B
    call label_280D
    and  $7F
    add  a, $40
    ld   [hl], a
    ld   hl, $C2F0
    add  hl, bc
    ld   [hl], $10

label_62B7B::
    ld   hl, $C2F0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_62B8F
    cp   $08
    jr   nz, label_62B8A
    call label_62D98

label_62B8A::
    ld   a, $02
    jp   label_3B0C

label_62B8F::
    call label_62E57

label_62B92::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    call label_C05
    jr   nz, label_62BD4
    call label_3B12
    ld   [hl], $03
    ld   a, [$FF99]
    push af
    sub  a, $14
    ld   [$FF99], a
    ld   a, $20
    call label_3BAA
    pop  af
    ld   [$FF99], a
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $EC
    ld   hl, $C450
    add  hl, bc
    ld   [hl], $30
    call label_280D
    and  $03
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    and  a
    jr   nz, label_62BD3
    call label_C05
    ld   [hl], $10

label_62BD3::
    ret

label_62BD4::
    call label_62CD3
    ld   a, $02
    jp   label_3B0C
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, label_62C27
    call label_63EB2
    add  a, $18
    cp   $30
    jr   nc, label_62C27
    call label_63ED2
    add  a, $18
    cp   $30
    jr   nc, label_62C27
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_62C27
    ld   a, [$C137]
    and  a
    jr   z, label_62C27
    ld   a, $20
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
    ld   [hl], $0B
    call label_3B12
    ld   [hl], $06
    ret

label_62C27::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, label_62C38
    and  a
    jr   nz, label_62C63
    call label_C05
    jr   nz, label_62C63

label_62C38::
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD7]
    cpl
    inc  a
    ld   hl, $C250
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_62C4E
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_62C4E::
    dec  [hl]
    dec  [hl]
    ld   a, [$FFD8]
    cpl
    inc  a
    ld   hl, $C240
    add  hl, bc
    sub  a, [hl]
    and  $80
    jr   nz, label_62C61
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_62C61::
    dec  [hl]
    dec  [hl]

label_62C63::
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $40
    jr   c, label_62C78
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   nz, label_62C78
    ld   [hl], b
    jr   label_62C88

label_62C78::
    ld   hl, $C320
    add  hl, bc
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_62C83
    inc  [hl]

label_62C83::
    ld   a, [hl]
    and  $80
    jr   nz, label_62CB8

label_62C88::
    ld   hl, $C450
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_62CA0
    ld   a, [$FFEE]
    cp   $A8
    jr   nc, label_62CA0
    ld   a, [$FFEC]
    cp   $90
    jr   c, label_62CB8
    cp   $C0
    jr   nc, label_62CB8

label_62CA0::
    call label_3B12
    ld   [hl], $04
    call label_62CD3
    call label_C05
    call label_280D
    and  $3F
    add  a, $20
    ld   [hl], a
    ld   a, $FF
    jp   label_3B0C

label_62CB8::
    call label_3B39
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_62CCD
    call label_3D7F
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $FF
    ret

label_62CCD::
    call label_62E57
    jp   label_62B92

label_62CD3::
    call label_3D7F
    ld   hl, $C320
    add  hl, bc
    ld   [hl], b
    ret

label_62CDC::
    nop
    nop
    ret  nc
    ret  nc
    ld   b, b
    ld   b, b
    add  a, b
    add  a, b

label_62CE4::
    ld   [label_3898], sp
    ld   a, b
    ld    hl, sp+$A8
    ld    hl, sp+$A8
    call label_C05
    jr   nz, label_62D17
    ld   hl, $C310
    add  hl, bc
    ld   [hl], $28
    call label_3B12
    ld   [hl], $05
    call label_280D
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_62CDC
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ld   hl, label_62CE4
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a

label_62D17::
    ret
    ld   a, $08
    call label_3BAA
    ld   a, [$FFEE]
    cp   $09
    jr   c, label_62D52
    cp   $97
    jr   nc, label_62D52
    ld   a, [$FFEC]
    cp   $20
    jr   c, label_62D52
    cp   $70
    jr   nc, label_62D52
    call label_3B12
    ld   [hl], $01
    ld   hl, $C450
    add  hl, bc
    call label_280D
    and  $3F
    add  a, $20
    ld   [hl], a
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

label_62D52::
    jp   label_62B92

label_62D55::
    nop
    add  hl, bc
    ld   [de], a
    dec  d

label_62D59::
    jr   label_62D70
    ld   [de], a
    add  hl, bc
    nop
    rst  $30
    xor  $EB
    db   $E8 ; add  sp, d
    db   $EB ; Undefined instruction
    xor  $F7
    nop
    add  hl, bc
    ld   [de], a
    dec  d
    call label_C05
    jr   nz, label_62D78
    ld   [hl], $20

label_62D70::
    call label_3B12
    ld   [hl], $07
    jp   label_62CD3

label_62D78::
    cp   $08
    jr   c, label_62D7F
    call label_62CB8

label_62D7F::
    jp   label_62B92
    call label_C05
    jr   nz, label_62D93
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $FF
    call label_3B12
    ld   [hl], $03
    ret

label_62D93::
    cp   $08
    jp   nz, label_62E36

label_62D98::
    ld   a, $0D
    ld   [$FFF4], a
    ld   a, [$FF99]
    push af
    sub  a, $08
    ld   [$FF99], a
    ld   a, $1F
    call label_3BB5
    pop  af
    ld   [$FF99], a
    call label_63B9D
    and  $0F
    ld   [$FFE8], a
    ld   e, $00
    call label_62DB9
    ld   e, $01

label_62DB9::
    ld   a, [$FFE8]
    add  a, e
    and  $0F
    ld   [$FFE8], a
    ld   e, $0F
    ld   d, b

label_62DC3::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_62DDE
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $BD
    jr   nz, label_62DDE
    ld   hl, $C2B0
    add  hl, de
    ld   a, [hl]
    cp   $02
    jr   nz, label_62DDE
    inc  b

label_62DDE::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_62DC3
    ld   a, b
    ld   b, $00
    cp   $03
    jr   nc, label_62E35
    ld   a, $BD
    call label_3B86
    jr   c, label_62E35
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $FFDA
    sub  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de

label_62E08::
    ld   [hl], $02
    ld   hl, $C340
    add  hl, de
    ld   [hl], $02
    ld   hl, $C360
    add  hl, de
    ld   [hl], $4C
    push bc
    ld   a, [$FFE8]
    ld   c, a
    ld   hl, label_62D59
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_62D55
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20
    pop  bc

label_62E35::
    ret

label_62E36::
    ld   a, $02
    jp   label_3B0C
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    sub  a, $28
    ld   [hl], a
    ld   a, [$FFEF]
    sub  a, $28
    ld   [$FFEF], a
    call label_3B23
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    add  a, $28
    ld   [hl], a
    jp   label_3D8A

label_62E57::
    ld   e, $0F

label_62E59::
    ld   d, b
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $05
    jr   nz, label_62ED0
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   z, label_62E74
    cp   $00
    jr   z, label_62E74
    cp   $02
    jr   nz, label_62ED0

label_62E74::
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFEE]
    sub  a, [hl]
    add  a, $18
    cp   $30
    jr   nc, label_62ED0
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFEC]
    sub  a, [hl]
    add  a, $20
    cp   $40
    jr   nc, label_62ED0
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
    push de
    ld   a, $20
    call label_3BB5
    pop  de
    ld   a, [$FFD8]
    cpl
    inc  a
    jr   nz, label_62EAD
    ld   a, $20

label_62EAD::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFD7]
    cpl
    inc  a
    jr   nz, label_62EBA
    ld   a, $20

label_62EBA::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    pop  af
    ld   [$FF98], a
    pop  af
    ld   [$FF99], a
    call label_3B12
    ld   [hl], $03
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $01

label_62ED0::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_62E59
    ret

label_62ED7::
    nop
    db   $FC ; Undefined instruction
    ld   h, b
    ld   [bc], a
    nop
    inc  b
    ld   h, d
    ld   [bc], a
    nop
    inc  c
    ld   h, b
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   h, h
    ld   [bc], a
    nop
    inc  b
    ld   h, [hl]
    ld   [bc], a
    nop
    inc  c
    ld   h, h
    ldi  [hl], a
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

label_62EFB::
    ld   a, [$FFF1]
    cp   $FF
    ret  z
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_62ED7
    add  hl, de
    ld   c, $03
    call label_3CE6
    jp   label_3CD9

label_62F17::
    ld   e, $03
    ld   e, $63
    ld   e, $43
    ld   e, $23

label_62F1F::
    ld   de, label_62F17
    call label_3BC0
    call label_63DE8
    call label_C56
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    call label_3B0C
    call label_3B70
    call label_3B44
    jr   c, label_62F51
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_62F54
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7

label_62F51::
    jp   label_63F08

label_62F54::
    call label_63E5F
    call label_C05
    ret  nz
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_63F08
    ret
    ld   l, h
    nop
    ld   l, h
    jr   nz, label_62FDB
    nop
    ld   l, [hl]
    jr   nz, label_62F82
    ld   l, b
    ld   l, a
    call label_3BC0
    call label_63DE8
    call label_63E15
    call label_63E5F
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_62F95
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    jr   z, label_62F95
    and  $80
    jr   z, label_62F94
    inc  [hl]
    inc  [hl]

label_62F94::
    dec  [hl]

label_62F95::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    call label_3B0C
    ld   a, [$FFF0]
    rst  0
    xor  b
    ld   l, a
    or   h
    ld   l, a
    jp   nz, label_CD6F
    dec  b
    inc  c
    ret  nz
    ld   [hl], $20
    call label_3D7F
    jp   label_3B12
    call label_C05
    ret  nz
    ld   [hl], $20
    ld   a, $20
    call label_3BAA
    jp   label_3B12
    call label_3B39
    call label_C05
    ret  nz
    call label_3B23
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jp   nz, label_63F08
    ret
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]

label_62FDB::
    and  a
    jp   nz, label_631A3
    ld   hl, $C340
    add  hl, bc
    set  6, [hl]
    call label_63181
    call label_394D
    call label_3EE8
    call label_63DE8
    ld   a, [$C18F]
    and  a
    jr   z, label_63028
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_63008
    inc  [hl]
    ld   a, $25
    call label_2385
    jp   label_63FB9

label_63008::
    cp   $01
    jr   nz, label_63011
    ld   a, $3F
    ld   [$FFF4], a
    inc  [hl]

label_63011::
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $20
    call label_63E98
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    cp   $78
    ret  c
    call label_27DD
    jp   label_63F08

label_63028::
    ld   a, [$FFF0]
    rst  0
    add  hl, sp
    ld   [hl], b
    ld   b, c
    ld   [hl], b
    ld   e, c
    ld   [hl], b
    sub  a, l
    ld   [hl], b
    add  hl, bc
    ld   [hl], c
    inc  h
    ld   [hl], c
    ld   [hl], $71
    ld   a, $07
    ld   [$D205], a
    jp   label_3B12
    call label_C05
    ld   [hl], $80
    xor  a
    ld   [$D201], a
    ld   [$D202], a
    ld   a, [$D205]
    inc  a
    and  $07
    ld   [$D205], a
    jp   label_3B12
    call label_C05
    jr   nz, label_63088
    ld   [hl], $FF
    ld   hl, $C430
    add  hl, bc
    res  1, [hl]
    ld   e, $0F
    ld   d, b

label_63069::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $BC
    jr   nz, label_6307F
    ld   hl, $C2B0
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_6307F
    ld   hl, $C280
    add  hl, de
    ld   [hl], b

label_6307F::
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_63069
    jp   label_3B12

label_63088::
    ret

label_63089::
    ld   a, b
    ld   l, b
    ld   e, b
    ld   c, b
    jr   c, label_630B7

label_6308F::
    nop
    nop
    nop
    nop
    nop
    nop
    call label_C05
    jr   nz, label_630A4
    ld   hl, $C430
    add  hl, bc
    set  1, [hl]
    call label_3B12
    xor  a

label_630A4::
    and  $1F
    jr   nz, label_630FD
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $06
    jr   nc, label_630FD
    ld   a, $BC
    call label_3B86
    jr   c, label_630FD
    ld   a, $31
    ld   [$FFF2], a
    ld   hl, $C3D0
    add  hl, bc
    push bc
    ld   c, [hl]
    inc  [hl]
    ld   hl, label_63089
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_6308F
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C310
    add  hl, de
    ld   [hl], $1C
    ld   hl, $C3D0
    add  hl, de
    ld   [hl], c
    ld   hl, $C430
    add  hl, de
    ld   a, [hl]
    and  $7B
    ld   [hl], a
    ld   hl, $C360
    add  hl, de
    ld   [hl], $01
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    ld   hl, $C340
    add  hl, de
    set  6, [hl]
    pop  bc

label_630FD::
    ld   a, [$FFE7]
    rra
    rra
    rra
    rra
    rra
    and  $01
    jp   label_3B0C
    ld   a, [$D201]
    cp   $06
    jr   nz, label_63121
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b
    xor  a
    ld   [$D201], a
    call label_C05
    ld   [hl], $40
    call label_3B12

label_63121::
    jp   label_630FD
    call label_C05
    ret  nz
    ld   a, $FF
    ld   [$D201], a
    ld   hl, $C450
    add  hl, bc
    ld   [hl], $40
    jp   label_3B12
    ld   hl, $C450
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_63157
    ld   a, [$C18F]
    and  a
    jr   nz, label_63152
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_63152
    inc  [hl]
    ld   a, $DF
    call label_2373

label_63152::
    call label_3B12
    ld   [hl], $01

label_63157::
    ld   a, $02
    jp   label_3B0C
    ret

label_6315D::
    nop
    ld    hl, sp+$60
    ld   [bc], a
    nop
    nop
    ld   h, d
    ld   [bc], a
    nop
    ld   [label_264], sp
    nop
    ld    hl, sp+$66
    ld   [bc], a
    nop
    nop
    ld   h, d
    ld   [bc], a
    nop
    ld   [label_264], sp
    stop
    ld   l, b
    ld   [bc], a
    nop
    nop
    ld   h, d
    ld   [bc], a
    nop
    ld   [label_264], sp

label_63181::
    ld   a, [$FFF1]
    rla
    rla
    and  $FC
    ld   e, a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_6315D
    add  hl, de
    ld   c, $03
    call label_3CE6
    ld   a, $01
    jp   label_3DA0

label_6319B::
    ld   l, [hl]
    nop
    ld   l, [hl]
    jr   nz, label_6320E
    ld   b, b
    ld   l, [hl]
    ld   h, b

label_631A3::
    ld   de, label_6319B
    call label_3BC0
    call label_63DE8
    call label_C56
    ld   a, [$FFF0]
    rst  0
    inc  e
    ld   [hl], d
    adc  a, b
    ld   [hl], d
    and  l
    ld   [hl], d
    ret  z
    ld   [hl], d
    db   $F4 ; Undefined instruction
    ld   [hl], d

label_631BC::
    jr   z, label_631F6
    ld   c, b
    ld   e, b
    ld   l, b
    ld   a, b
    jr   c, label_6322C
    ld   c, b
    ld   e, b
    ld   c, b
    ld   e, b
    jr   label_63152
    jr   z, label_63244
    ld   h, b
    ld   b, b
    jr   z, label_63248
    ld   a, b
    jr   z, label_63233
    ld   b, b
    jr   z, label_6324E
    jr   z, label_63250
    ld   d, b
    ld   d, b
    jr   c, label_63244
    ld   d, b
    ld   d, b
    jr   c, label_63248
    jr   c, label_6324A
    jr   c, label_6324C
    jr   c, label_6324E
    jr   z, label_63260
    jr   c, label_63232
    ld   l, b
    ld   e, b

label_631EC::
    jr   nz, label_6321E
    ld   b, b
    ld   b, b
    jr   nc, label_63212
    ld   h, b
    ld   h, b
    ld   d, b
    ld   [hl], b

label_631F6::
    ld   [hl], b
    ld   d, b
    jr   c, label_63232
    ld   e, b
    ld   e, b
    ld   [hl], b
    ld   [hl], b
    jr   nc, label_63230
    ld   [hl], b
    ld   [hl], b
    ld   d, b
    ld   d, b
    jr   nc, label_63276
    ld   [hl], b
    jr   nc, label_63239
    ld   [hl], b
    ld   b, b
    ld   h, b
    ld   [hl], b
    jr   nc, label_6326F
    ld   b, b
    jr   nc, label_63242

label_63212::
    ld   d, b
    ld   d, b
    ld   [hl], b
    ld   [hl], b
    ld   b, b
    ld   b, b
    ld   d, b
    ld   b, b
    ld   d, b
    ld   b, b
    ld   a, [$FF98]

label_6321E::
    push af
    ld   a, [$FF99]
    push af
    ld   a, [$D205]
    rla
    and  $FE
    ld   e, a
    rla
    and  $FC

label_6322C::
    add  a, e
    ld   hl, $C3D0

label_63230::
    add  hl, bc
    add  a, [hl]

label_63232::
    ld   e, a

label_63233::
    ld   d, b
    ld   hl, label_631BC
    add  hl, de
    ld   a, [hl]

label_63239::
    ld   [$FF98], a
    ld   hl, label_631EC
    add  hl, de
    ld   a, [hl]
    ld   [$FF99], a

label_63242::
    ld   a, [$FFE7]

label_63244::
    xor  c
    and  $03
    jr   nz, label_6324E
    ld   a, $10
    call label_3BAA

label_6324E::
    ld   hl, $FFEE
    ld   a, [$FF98]
    sub  a, [hl]
    add  a, $03
    cp   $06
    jr   nc, label_6326D
    ld   hl, $FFEC
    ld   a, [$FF99]
    sub  a, [hl]

label_63260::
    add  a, $03
    cp   $06
    jr   nc, label_6326D
    ld   hl, $D201
    inc  [hl]
    call label_3B12

label_6326D::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a

label_63273::
    call label_63E5F

label_63276::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $01
    jp   label_3B0C

label_63280::
    inc  b
    inc  c
    inc  d
    inc  e
    inc  h
    inc  l
    inc  [hl]
    inc  a
    ld   a, [$D201]
    cp   $FF
    jr   nz, label_632A2
    ld   hl, $C3D0
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_63280
    add  hl, de
    ld   a, [hl]
    ld   hl, $C450
    add  hl, bc
    ld   [hl], a
    call label_3B12

label_632A2::
    jp   label_63276
    ld   hl, $C450
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_632C5
    ld   hl, $C340
    add  hl, bc
    res  6, [hl]
    ld   a, $20
    call label_3BAA
    ld   hl, $C320
    add  hl, bc
    ld   [hl], $F4
    ld   a, $31
    ld   [$FFF2], a
    call label_3B12

label_632C5::
    jp   label_63276

label_632C8::
    call label_3B39
    call label_63273
    call label_63E98
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_632E1
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    cp   $0C
    jr   z, label_632E1
    inc  [hl]

label_632E1::
    ld   a, [$FFEC]
    cp   $88
    jr   nc, label_632EC
    ld   a, [$FFEE]
    cp   $A8
    ret  c

label_632EC::
    call label_3B12
    ld   a, $FF
    jp   label_3B0C
    ret

label_632F5::
    ld   a, d
    ld   d, $7E
    ld   [hl], $7A
    ld   [hl], $7E
    ld   d, $7C
    ld   d, $7C
    ld   [hl], $F0
    ld    hl, sp+$E6
    jr   nz, label_632C8
    ld   [label_217F], sp
    or   b
    jp   nz, label_63E09
    and  a
    jr   z, label_63330
    ld   de, label_632F5
    call label_3C77
    call label_63DE8
    call label_63E5F
    call label_63E98
    ld   hl, $C320
    add  hl, bc
    dec  [hl]
    dec  [hl]
    ld   hl, $C310
    add  hl, bc
    ld   a, [hl]
    and  $80
    jp   nz, label_63F08
    ret

label_63330::
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_6333C
    ld   a, $07
    ld   [$FFF1], a

label_6333C::
    call label_6366A
    ld   a, [$FFF0]
    and  a
    jr   nz, label_63363
    ld   a, [$DB4A]
    cp   $02
    jr   nz, label_63363
    ld   a, [$C166]
    and  a
    jr   z, label_63363
    call label_3B12
    ld   hl, $C430
    add  hl, bc
    set  7, [hl]
    set  2, [hl]
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $10
    ret

label_63363::
    ld   a, [$FFEA]
    cp   $05
    jr   z, label_6337E
    call label_63F0F
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_6337D
    ld   hl, $D810
    set  5, [hl]
    ld   a, $02
    ld   [$FFF2], a

label_6337D::
    ret

label_6337E::
    call label_63DE8
    call label_C56
    call label_3B70
    ld   a, [$FFF0]
    cp   $05
    jr   nc, label_63392
    call label_63D36
    jr   label_63395

label_63392::
    call label_3B44

label_63395::
    ld   a, [$FFF0]
    rst  0
    or   b
    ld   [hl], e
    or   c
    ld   [hl], e
    call nz, label_C73
    ld   [hl], h
    ld   a, d
    ld   [hl], h
    sbc  a, e
    ld   [hl], h
    push bc
    ld   [hl], h
    call nc, label_EA74
    ld   [hl], h
    rra
    ld   [hl], l
    add  hl, sp
    ld   [hl], l
    ld   c, h
    ld   [hl], l
    ret
    call label_C05
    ld   [hl], $80
    ld   a, $39
    ld   [$D368], a
    ld   [$FFB0], a
    ld   [$FFBD], a
    ld   [$FFBF], a
    jp   label_3B12
    ld   a, [$FFEE]
    ld   hl, $C440
    add  hl, bc
    ld   [hl], a
    ld   a, [$FFEC]
    ld   hl, $C2D0
    add  hl, bc
    sub  a, $14
    ld   [hl], a
    call label_C05
    jr   nz, label_633DE
    ld   [hl], $FF
    jp   label_3B12

label_633DE::
    ld   e, $08
    and  $04
    jr   z, label_633E6
    ld   e, $F8

label_633E6::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], e
    jp   label_63E6C

label_633EE::
    ld    hl, sp+$08
    stop
    nop
    ld   [$00F0], sp
    ld   a, [$FF00]
    ld   a, [$FFF0]

label_633FA::
    ld    hl, sp+$08
    ld   [$F8F8], sp
    ld   [label_2FC], sp
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction

label_63406::
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    call label_C05
    jr   nz, label_63416
    ld   [hl], $80
    jp   label_3B12

label_63416::
    and  $1F
    jr   nz, label_63479
    ld   a, [$FFF1]
    cp   $06
    jr   z, label_6346E
    ld   a, $13
    ld   [$FFF4], a
    ld   a, $7F
    call label_3B86
    push bc
    ld   a, [$FFF1]
    ld   c, a
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, label_633EE
    add  hl, bc
    ld   a, [$FFD7]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_633F4
    add  hl, bc
    ld   a, [$FFD8]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, label_633FA
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_63400
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   hl, label_63406
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C320
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], a
    pop  bc

label_6346E::
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    cp   $07
    jr   z, label_63479
    inc  a
    ld   [hl], a

label_63479::
    ret

label_6347A::
    call label_C05
    jr   nz, label_63484
    ld   [hl], $80
    jp   label_3B12

label_63484::
    ld   e, $07
    cp   $60
    jr   nc, label_63496
    cp   $40
    jr   nc, label_63497
    cp   $30
    jr   c, label_63496
    cp   $20
    jr   c, label_63497

label_63496::
    inc  e

label_63497::
    ld   a, e
    jp   label_3B0C
    call label_C05
    jr   nz, label_634BC
    ld   [hl], $40
    ld   hl, $C340
    add  hl, bc
    res  7, [hl]
    ld   hl, $C430
    add  hl, bc
    res  6, [hl]
    call label_3B12
    ld   a, [$FFEE]
    ld   [$D201], a
    ld   a, [$FFEC]
    ld   [$D202], a
    ret

label_634BC::
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $04
    jp   label_63E62
    call label_C05
    ret  nz
    ld   [hl], $20
    ld   hl, $C240
    add  hl, bc
    ld   [hl], $08
    jp   label_3B12
    call label_C05
    jr   nz, label_634E7
    call label_C05
    call label_280D
    and  $1F
    add  a, $08
    ld   [hl], a
    call label_3B12

label_634E7::
    jp   label_63E6C
    call label_C05
    jr   nz, label_6351E
    ld   hl, $C390
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $03
    jr   c, label_6350C
    call label_280D
    and  $01
    jr   nz, label_6350C
    call label_3B12
    ld   a, $09
    ld   [hl], a
    call label_C05
    ld   [hl], $20
    ret

label_6350C::
    call label_C05
    ld   [hl], $40
    call label_3B12
    dec  [hl]
    dec  [hl]
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_6351E::
    ret
    call label_C05
    ret  nz
    ld   [hl], $20
    ld   a, $18
    call label_3BAA
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    bit  7, [hl]
    jr   z, label_63536
    cpl
    inc  a
    ld   [hl], a

label_63536::
    jp   label_3B12
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_63546
    call label_C05
    jr   nz, label_63549

label_63546::
    call label_3B12

label_63549::
    jp   label_63E5F
    ld   a, [$FF98]
    push af
    ld   a, [$FF99]
    push af
    ld   a, [$D201]
    ld   [$FF98], a
    ld   a, [$D202]
    ld   [$FF99], a
    ld   a, $08
    call label_3BAA
    ld   a, [$D201]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $01
    cp   $02
    jr   nc, label_63585
    ld   a, [$D202]
    ld   hl, $FFEC
    sub  a, [hl]
    add  a, $01
    cp   $02
    jr   nc, label_63585
    call label_3B12
    ld   [hl], $06
    call label_C05
    ld   [hl], $20

label_63585::
    pop  af
    ld   [$FF99], a
    pop  af
    ld   [$FF98], a
    jp   label_63E5F

label_6358E::
    ld   a, [$FFF8]
    ld   a, d
    ld   d, $F0
    nop
    ld   a, h
    ld   d, $F0
    ld   [label_367C], sp
    ld   a, [$FF10]
    ld   a, d
    ld   [hl], $00
    nop
    ld   a, [hl]
    ld   d, $00
    ld   [label_367E], sp
    ld   a, [$FFF8]
    ld   [hl], b
    rlca
    ld   a, [$FF00]
    ld   a, h
    ld   d, $F0
    ld   [label_367C], sp
    ld   a, [$FF10]
    ld   a, d
    ld   [hl], $00
    nop
    ld   a, [hl]
    ld   d, $00
    ld   [label_367E], sp
    ld   a, [$FFF8]
    ld   [hl], b
    rlca
    ld   a, [$FF00]
    ld   a, h
    ld   d, $F0
    ld   [label_367C], sp
    ld   a, [$FF10]
    ld   a, d
    ld   [hl], $00
    nop
    ld   a, [hl]
    ld   d, $00
    ld   [label_2774], sp
    ld   a, [$FFF8]
    ld   [hl], b
    rlca
    ld   a, [$FF00]
    ld   a, h
    ld   d, $F0
    ld   [label_367C], sp
    ld   a, [$FF10]
    ld   [hl], b
    daa
    nop
    nop
    ld   a, [hl]
    ld   d, $00
    ld   [label_2774], sp
    ld   a, [$FFF8]
    ld   [hl], b
    rlca
    ld   a, [$FF00]
    ld   a, h
    ld   d, $F0
    ld   [label_367C], sp
    ld   a, [$FF10]
    ld   [hl], b
    daa
    nop
    nop
    ld   [hl], h
    rlca
    nop
    ld   [label_2774], sp
    ld   a, [$FFF8]
    ld   [hl], b
    rlca
    ld   a, [$FF00]
    ld   a, b
    rlca
    ld   a, [$FF08]
    ld   a, h
    ld   [hl], $F0
    db   $10
    db   $70
    daa
    nop
    nop
    ld   [hl], h
    rlca
    nop
    ld   [label_2774], sp
    ld   a, [$FFF8]
    ld   [hl], b
    rlca
    ld   a, [$FF00]
    ld   a, b
    rlca
    ld   a, [$FF08]
    ld   a, b
    daa
    ld   a, [$FF10]
    ld   [hl], b
    daa
    nop
    nop
    ld   [hl], h
    rlca
    nop
    ld   [label_2774], sp
    ld   a, [$FFF8]
    ld   [hl], b
    rlca
    ld   a, [$FF00]
    ld   a, b
    rlca
    ld   a, [$FF08]
    ld   a, b
    daa
    ld   a, [$FF10]
    ld   [hl], b
    daa
    nop
    nop
    ld   [hl], h
    rlca
    nop
    ld   [label_2774], sp
    ld   a, [$FFF8]
    ld   [hl], b
    rlca
    ld   a, [$FF00]
    ld   [hl], d
    rlca
    ld   a, [$FF08]
    ld   [hl], d
    daa
    ld   a, [$FF10]
    ld   [hl], b
    daa
    nop
    nop
    ld   [hl], h
    rlca
    nop
    ld   [label_2774], sp

label_63666::
    db   $76 ; Halt
    rlca
    db   $76 ; Halt
    daa

label_6366A::
    ld   a, [$FFF1]
    rla
    rla
    rla
    and  $F8
    ld   e, a
    rla
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_6358E
    add  hl, de
    ld   c, $06
    call label_3CE6
    ld   a, $06
    call label_3DA0
    ld   a, [$FFEA]
    cp   $01
    jr   z, label_63691
    ld   a, [$FFF0]
    cp   $05
    jp  c, label_63726

label_63691::
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE8], a
    ld   a, [$FFEE]
    sub  a, [hl]
    sra  a
    ld   [$FFE1], a
    sra  a
    ld   [$FFE2], a
    sra  a
    ld   [$FFE3], a
    sra  a
    ld   [$FFE4], a
    sra  a
    ld   [$FFE5], a
    sra  a
    ld   [$FFE6], a
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFE9], a
    ld   a, [$FFEC]
    sub  a, $20
    cp   [hl]
    jr   c, label_63726
    ld   [$FFEC], a
    xor  a
    ld   [$FFF1], a
    ld   hl, $FFE1

label_636C9::
    ld   a, [$FFE8]
    add  a, [hl]
    ld   [$FFEE], a
    inc  hl
    push hl
    ld   de, label_63666
    call label_3BC0
    ld   a, [$DBC7]
    and  a
    jr   nz, label_63717
    ld   hl, $FFEC
    ld   a, [$FF99]
    sub  a, [hl]
    add  a, $0C
    cp   $18
    jr   nc, label_63717
    ld   hl, $FFEE
    ld   a, [$FF98]
    sub  a, [hl]
    ld   e, a
    add  a, $0C
    cp   $18
    jr   nc, label_63717
    ld   a, e
    ld   e, $20
    and  $80
    jr   z, label_636FE
    ld   e, $E0

label_636FE::
    ld   a, e
    ld   [$FF9A], a
    xor  a
    ld   [$FF9B], a
    ld   a, $18
    ld   [$C13E], a
    ld   a, $10
    ld   [$DBC7], a
    ld   a, $08
    ld   [$DB94], a
    ld   a, $03
    ld   [$FFF3], a

label_63717::
    pop  hl
    ld   a, [$FFE9]
    ld   e, a
    ld   a, [$FFEC]
    sub  a, $10
    ld   [$FFEC], a
    sub  a, e
    and  $80
    jr   z, label_636C9

label_63726::
    jp   label_3D8A

label_63729::
    ld   h, d
    nop
    ld   h, h
    nop
    ld   h, b
    nop
    ld   h, b
    jr   nz, label_63796
    jr   nz, label_63796
    jr   nz, label_6379C
    nop
    ld   l, b
    nop
    ld   h, b
    nop
    ld   h, b
    jr   nz, label_637A6
    jr   nz, label_637A6
    jr   nz, label_637AE
    nop
    ld   l, [hl]
    nop
    ld   l, d
    nop
    ld   l, d
    jr   nz, label_637B8
    jr   nz, label_637B8
    jr   nz, label_6374E

label_6374E::
    ld   bc, $0102

label_63751::
    inc  bc
    inc  b
    dec  b
    inc  b

label_63755::
    ld   b, $07
    ld   [$F007], sp
    rst  $30
    cp   $FF
    jr   nz, label_63764
    ld   a, $18
    jp   label_A77

label_63764::
    ld   de, label_63729
    call label_3BC0
    call label_63DE8
    call label_63E15
    call label_3B39
    ld   a, [$FFF0]
    rst  0
    add  a, h
    ld   [hl], a
    db   $77
    ld   [hl], a

label_6377A::
    ld   a, [$00FC]
    inc  b
    ld   b, $04
    nop
    db   $FC ; Undefined instruction
    ld   a, [$CDFC]
    dec  b
    inc  c
    jr   nz, label_637A9
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_6377C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_6377A
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a

label_637A9::
    call label_63E5F
    call label_3B23
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   hl, label_6374D
    and  a

label_637B8::
    jr   z, label_637CF
    call label_63D95
    jr   nc, label_637CC
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  $03
    add  a, $7C
    inc  [hl]
    call label_237C

label_637CC::
    ld   hl, label_63755

label_637CF::
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    add  hl, de
    ld   a, [hl]
    jp   label_3B0C
    call label_C05
    jr   nz, label_637E7
    call label_3B12
    ld   [hl], b
    ret

label_637E7::
    ld   hl, label_63751
    jp   label_637CF

label_637ED::
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
    ld   [hl], b
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   [hl], h
    ld   [bc], a
    nop
    inc  b
    ld   [hl], d
    ld   [bc], a
    nop
    inc  c
    ld   [hl], h
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    db   $76 ; Halt
    ld   [bc], a
    nop
    inc  b
    ld   [hl], d
    ld   [bc], a
    nop
    inc  c
    db   $76 ; Halt
    ldi  [hl], a
    nop
    db   $FC ; Undefined instruction
    ld   [hl], h
    ld   [bc], a
    nop
    inc  b
    ld   [hl], d
    ld   [bc], a
    nop
    inc  c
    ld   [hl], h
    ldi  [hl], a

label_6381D::
    db   $10
    db   $11
    ld   [de], a
    ld   de, $F1F0
    rla
    rla
    and  $FC
    ld   e, a
    rla
    and  $F8
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_637ED
    add  hl, de
    ld   c, $03
    call label_3CE6
    call label_63DE8
    call label_3CD9
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    rra
    rra
    rra
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_6381D
    add  hl, de
    ld   a, [hl]
    ld   hl, $C310
    add  hl, bc
    ld   [hl], a
    call label_63E15
    call label_63E5F
    call label_3B23
    ld   a, [$FFF0]
    rst  0
    ld   l, a
    ld   a, b
    ld   b, c
    ld   a, c
    ld   d, d
    ld   a, c

label_63865::
    ld    hl, sp+$FA

label_63867::
    nop
    ld   b, $08
    ld   b, $00
    ld   a, [$FAF8]
    call label_C05
    jr   nz, label_638A6
    call label_280D
    and  $1F
    add  a, $20
    ld   [hl], a
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_63867
    add  hl, de
    ld   a, [hl]
    ld   hl, $C240
    add  hl, bc
    ld   [hl], a
    ld   hl, label_63865
    add  hl, de
    ld   a, [hl]
    ld   hl, $C250
    add  hl, bc
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $07
    jr   nz, label_638A3
    ld   a, $0A
    call label_3BAA

label_638A3::
    call label_3B12

label_638A6::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    and  $7F
    jr   nz, label_638F1
    ld   a, $02
    call label_3B86
    jr   c, label_638F1
    ld   hl, $C430
    add  hl, de
    res  0, [hl]
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
    ld   hl, $C320
    add  hl, de
    ld   [hl], $08
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

label_638F1::
    call label_63EE1
    ld   a, [$FF9E]
    xor  $01
    cp   e
    jr   nz, label_63935
    call label_63EB2
    add  a, $20
    cp   $40
    jr   nc, label_63935
    call label_63ED2
    add  a, $20
    cp   $40
    jr   nc, label_63935
    ld   a, [$C137]
    and  a
    jr   z, label_63935
    call label_3B12
    ld   [hl], $02
    call label_C05
    ld   [hl], $12
    ld   a, $20
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
    ret

label_63935::
    call label_3B39

label_63938::
    ld   a, [$FFE7]
    rra
    rra
    and  $03
    jp   label_3B0C
    call label_C05
    jr   nz, label_6394F
    ld   [hl], $20
    call label_3B12
    ld   [hl], b
    call label_3D7F

label_6394F::
    jp   label_638A6
    call label_C05
    jr   nz, label_6395B
    call label_3B12
    ld   [hl], b

label_6395B::
    jp   label_63938

label_6395E::
    ld   l, h
    ld   [hl], h
    ld   l, l
    ld   [hl], l

label_63962::
    ld   h, h
    ld   [hl], h
    ld   h, l
    ld   [hl], l
    call label_63B02
    call label_63DE8
    ld   a, [$FFF0]
    and  a
    jp   nz, label_63A5D
    call label_C05
    jp   z, label_63A48
    cp   $07
    jp   nz, label_63A4B
    push bc
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    add  a, $07
    sub  a, $08
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   hl, $C210
    add  hl, bc
    ld   c, a
    ld   a, [hl]
    add  a, $07
    sub  a, $10
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   c, a
    ld   b, $00
    ld   hl, $D711
    ld   a, h
    add  hl, bc
    ld   e, c
    ld   d, b
    ld   h, a
    pop  bc
    ld   a, [hl]
    ld   [$FFAF], a
    cp   $D3
    jr   z, label_639B3
    cp   $5C
    jr   nz, label_639CF

label_639B3::
    ld   a, [$DBA5]
    and  a
    jr   nz, label_639CF
    call label_2178
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $2F
    ld   [$FFF2], a
    jr   label_63A48

label_639CF::
    ld   a, [$DBA5]
    and  a
    jp   z, label_63A4B
    ld   a, [$FFAF]
    cp   $AB
    ret  nz
    ld   a, [$FFFE]
    and  a
    jr   z, label_639F0
    ld   a, [$C11C]
    cp   $05
    ret  z
    ld   a, [$DDD6]
    and  a
    ret  nz
    ld   a, [$C124]
    and  a
    ret  nz

label_639F0::
    ld   a, $AC
    ld   [hl], a
    ld   [$DDD8], a
    ld   d, h
    ld   e, l
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], d
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], e
    ld   hl, $C290
    add  hl, bc
    ld   [hl], $01
    call label_BFB
    ld   [hl], $80
    ld   hl, $C200
    add  hl, bc
    ld   a, [$FFCE]
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [$FFCD]
    ld   [hl], a
    ld   hl, $C1A2
    inc  [hl]
    ld   a, [$C3CD]
    and  a
    jr   z, label_63A39
    sub  a, $04
    ld   [$C3CD], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_63A39
    ld   a, $40
    ld   [$DDD6], a
    ld   a, $0B
    ld   [$DDD7], a

label_63A39::
    call label_C05
    ld   [hl], b
    ld   a, $12
    ld   [$FFF4], a
    ld   de, label_6395E
    push de
    jp   label_63B1D

label_63A48::
    jp   label_63F08

label_63A4B::
    cp   $10
    ret  nc
    ld   hl, $C440
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    ld   a, $09
    ld   [$C19E], a
    jp   label_3B7B

label_63A5D::
    call label_BFB
    jr   nz, label_63AB9
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$FFCE], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   [$FFCD], a
    ld   hl, $C2B0
    add  hl, bc
    ld   d, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   e, [hl]
    ld   a, $AB
    ld   [de], a
    ld   [$DDD8], a
    call label_63F08
    ld   a, [$FFF6]
    cp   $74
    ret  z
    ld   hl, $C1A2
    dec  [hl]
    ld   a, [$C3CD]
    cp   $0C
    jr   nc, label_63AB2
    add  a, $04
    ld   [$C3CD], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_63AB2
    ld   a, [$C11C]
    cp   $05
    ret  z
    ld   a, [$C124]
    and  a
    ret  nz
    ld   a, $80
    ld   [$DDD6], a
    ld   a, $0B
    ld   [$DDD7], a

label_63AB2::
    ld   de, label_63962
    push de
    jp   label_63B1D

label_63AB9::
    ret

label_63ABA::
    ld   b, $FE
    inc  h
    inc  bc
    inc  bc
    inc  b
    inc  h
    inc  de
    dec  b
    ld   a, [bc]
    inc  h
    inc  bc
    dec  b
    cp   $24
    inc  de
    ld   [bc], a
    inc  b
    inc  h
    inc  bc
    inc  b
    ld   a, [bc]
    inc  h
    inc  de
    inc  bc
    rst  $38
    inc  h
    inc  bc
    ld   bc, label_2404
    inc  de
    ld   [bc], a
    add  hl, bc
    inc  h
    inc  bc
    ld   bc, label_2400
    inc  de
    rst  $38
    inc  b
    inc  h
    inc  bc
    nop
    ld   b, $24
    inc  de
    nop
    ld   bc, label_324
    cp   $03
    inc  h
    inc  de
    rst  $38
    dec  b
    inc  h
    inc  bc
    rst  $38
    ld   bc, label_1324
    db   $FD ; Undefined instruction
    inc  bc
    inc  h
    inc  bc
    cp   $05
    inc  h
    inc  de

label_63B02::
    call label_C05
    ret  z
    rra
    rra
    and  $07
    sla  a
    sla  a
    ld   e, a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, label_63ABA
    add  hl, de
    ld   c, $03
    jp   label_3CE6

label_63B1D::
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_63B2C
    push bc
    ld   a, $18
    call label_91D
    pop  bc

label_63B2C::
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

label_63B5D::
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

label_63B7D::
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

label_63B9D::
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
    jr   z, label_63BB8
    cpl
    inc  a

label_63BB8::
    ld   d, a
    ld   a, [$FFD7]
    bit  7, a
    jr   z, label_63BC1
    cpl
    inc  a

label_63BC1::
    cp   d
    jr   nc, label_63BD1
    sra  a
    sra  a
    add  a, h
    ld   e, a
    ld   d, b
    ld   hl, label_63B5D
    add  hl, de
    ld   a, [hl]
    ret

label_63BD1::
    ld   a, d
    sra  a
    sra  a
    add  a, h
    ld   e, a
    ld   d, b
    ld   hl, label_63B7D
    add  hl, de
    ld   a, [hl]
    ret

label_63BDF::
    ld   de, label_F10
    ld   c, $FA
    ld   h, [hl]
    pop  bc
    and  a
    jp   nz, label_63F08
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C1A4], a
    ld   [$C1C6], a
    ld   a, c
    inc  a
    ld   [$C1A6], a
    xor  a
    call label_CAF
    ld   [$C13E], a
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, label_63BDF
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    call label_63CC8
    call label_63DE8
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_63C1C
    ld   a, $0B
    ld   [$FFF4], a

label_63C1C::
    ld   a, [$FFF0]
    and  a
    jr   z, label_63C39
    ld   a, $30
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
    jr   label_63C46

label_63C39::
    call label_63E5F
    call label_C05
    jr   nz, label_63C54
    ld   a, $30
    call label_3BAA

label_63C46::
    call label_3B5A
    jr   nc, label_63CAE
    xor  a
    ld   [$C1C6], a
    call label_63F08
    jr   label_63CAE

label_63C54::
    ld   a, $06
    ld   [$C19E], a
    call label_3B7B
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_63CAF
    call label_3B23
    ld   a, [$DBA5]
    and  a
    jr   z, label_63CAE
    call label_62493
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_63CAE
    ld   e, $9E
    bit  7, a
    jr   nz, label_63C80
    ld   e, $9F

label_63C80::
    ld   a, [$FFAF]
    cp   e
    jr   nz, label_63CAE
    ld   a, $68
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFCE]
    add  a, $08
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFCD]
    add  a, $10
    ld   [hl], a
    ld   a, [$FFAF]
    cp   $9E
    ld   a, $00
    jr   z, label_63CA5
    inc  a

label_63CA5::
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    call label_C05
    ld   [hl], b

label_63CAE::
    ret

label_63CAF::
    call label_C05
    ld   [hl], b
    ld   a, $07
    ld   [$FFF2], a
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $05
    jp   label_CC7

label_63CC4::
    ld   [hl], $00
    ld   [hl], $20

label_63CC8::
    ld   de, label_63CC4
    call label_3BC0
    ld   a, [$FFEE]
    ld   hl, $FF98
    sub  a, [hl]
    sra  a
    sra  a
    ld   [$FFD7], a
    ld   [$FFD9], a
    ld   a, [$FFEF]
    ld   hl, $FF99
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

label_63CF8::
    ld   [$FFDB], a
    ld   hl, $FFE7
    xor  [hl]
    and  $01
    jr   nz, label_63D09
    ld   a, [$FF99]
    ld   hl, $FFD8
    add  a, [hl]
    ld   [de], a

label_63D09::
    inc  de
    ld   a, [$FF98]
    ld   hl, $FFD7
    add  a, [hl]
    add  a, $04
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
    jr   nz, label_63CF8
    ld   a, $03
    jp   label_3DA0

label_63D36::
    call label_3B5A
    jr   nc, label_63D5A

label_63D3B::
    call label_CBE
    call label_CB6
    ld   a, [$C1A6]
    and  a
    jr   z, label_63D58
    ld   e, a
    ld   d, b
    ld   hl, $C39F
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_63D58
    ld   hl, $C28F
    add  hl, de
    ld   [hl], $00

label_63D58::
    scf
    ret

label_63D5A::
    and  a
    ret

label_63D5C::
    ld   b, $04
    ld   [bc], a
    nop

label_63D60::
    ld   hl, $C380
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_63D5C
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

label_63D7C::
    ld   e, b
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $18
    cp   $38
    jr   label_63DA0

label_63D89::
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $38
    jr   label_63DA0

label_63D95::
    ld   e, b
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $14
    cp   $28

label_63DA0::
    jr   nc, label_63DE6
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_63DE6
    inc  e
    ld   a, [$FFEB]
    cp   $C4
    jr   z, label_63DC1
    push de
    call label_63EE1
    ld   a, [$FF9E]
    xor  $01
    cp   e
    pop  de
    jr   nz, label_63DE6

label_63DC1::
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ld   hl, $C134
    or   [hl]
    jr   nz, label_63DE6
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_63DE6
    ld   a, [$FFCC]
    and  $10
    jr   z, label_63DE6
    scf
    ret

label_63DE6::
    and  a
    ret

label_63DE8::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_63E13

label_63DEE::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_63E13
    cp   $0B
    jr   nz, label_63E13
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_63E13
    ld   hl, $C1A8
    ld   a, [$C19F]
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_63E13
    ld   a, [$C124]
    and  a
    jr   z, label_63E14

label_63E13::
    pop  af

label_63E14::
    ret

label_63E15::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_63E5E
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
    call label_63E5F
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_63E51
    call label_3B23

label_63E51::
    ld   hl, $C250
    add  hl, bc
    pop  af
    ld   [hl], a
    ld   hl, $C240
    add  hl, bc
    pop  af
    ld   [hl], a
    pop  af

label_63E5E::
    ret

label_63E5F::
    call label_63E6C

label_63E62::
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_63E6C
    pop  bc
    ret

label_63E6C::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_63E97
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200

label_63E84::
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_63E8E
    ld   e, $F0

label_63E8E::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_63E97::
    ret

label_63E98::
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_63E97
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C310
    jr   label_63E84

label_63EB2::
    ld   e, $00
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   z, label_63EC0
    inc  e

label_63EC0::
    ld   d, a
    ret

label_63EC2::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, bc
    sub  a, [hl]
    bit  7, a
    jr   nz, label_63ED0
    inc  e

label_63ED0::
    ld   d, a
    ret

label_63ED2::
    ld   e, $02
    ld   a, [$FF99]
    ld   hl, $FFEC
    sub  a, [hl]
    bit  7, a
    jr   nz, label_63EDF
    inc  e

label_63EDF::
    ld   d, a
    ret

label_63EE1::
    call label_63EB2
    ld   a, e
    ld   [$FFD7], a
    ld   a, d
    bit  7, a
    jr   z, label_63EEE
    cpl
    inc  a

label_63EEE::
    push af
    call label_63EC2
    ld   a, e
    ld   [$FFD8], a
    ld   a, d
    bit  7, a
    jr   z, label_63EFC
    cpl
    inc  a

label_63EFC::
    pop  de
    cp   d
    jr   nc, label_63F04
    ld   a, [$FFD7]
    jr   label_63F06

label_63F04::
    ld   a, [$FFD8]

label_63F06::
    ld   e, a
    ret

label_63F08::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $00
    ret

label_63F0F::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    rst  0
    dec  de
    ld   a, a
    inc  l
    ld   a, a
    dec  sp
    ld   a, a
    call label_C05
    ld   [hl], $A0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF

label_63F26::
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
    jp   label_63F26
    call label_C05
    jr   nz, label_63F4C
    call label_C4B
    call label_27DD
    call label_63FB9
    jp   label_3F50

label_63F4C::
    jp   label_63F4F

label_63F4F::
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
    jp   label_63F6F

label_63F6F::
    call label_63DEE
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
    jr   z, label_63FA4
    ld   hl, $C250
    add  hl, bc
    ld   [hl], $F0
    jr   label_63FB0

label_63FA4::
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ld   hl, $C310
    add  hl, de
    ld   [hl], $08

label_63FB0::
    call label_63F08
    ld   hl, $FFF4
    ld   [hl], $1A
    ret

label_63FB9::
    ld   hl, $D800
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    ld   a, [$FFF7]
    cp   $1A
    jr   nc, label_63FCE
    cp   $06
    jr   c, label_63FCE
    inc  d

label_63FCE::
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
