section "bank40",romx,bank[$28]
    call label_A0033
    ld   a, [$DB96]
    rst  0
    and  a
    ld   b, b
    reti
    ld   b, b
    adc  a, a
    ld   b, b
    ei
    ld   b, b
    sbc  a, e
    ld   b, b
    jr   label_A0055
    ldd  [hl], a
    ld   b, d
    adc  a, a
    ld   b, b
    or   d
    ld   b, e
    sbc  a, e
    ld   b, b
    ld   l, c
    ld   b, h
    ld   a, [hl]
    ld   b, l
    ld   c, $4C
    jr   c, label_A006F
    ld   l, h
    ld   c, h
    xor  l
    ld   c, h
    adc  a, $4C
    adc  a, h
    ld   c, l
    adc  a, a
    ld   b, b
    xor  d
    ld   b, h

label_A002F::
    ld   b, b
    nop

label_A0031::
    ld   bc, $FAFF
    sub  a, [hl]
    db   $DB
    cp   $0D
    jr   c, label_A008E
    cp   $11
    jr   nc, label_A008E
    ld   b, $00
    ld   a, [$D1C8]
    and  $01
    jr   nz, label_A0064
    ld   a, [$D1CA]
    ld   c, a
    ld   hl, label_A0031
    add  hl, bc
    ld   a, [$D1C9]
    add  a, [hl]
    ld   [$D1C9], a
    ld   hl, label_A002F
    add  hl, bc
    cp   [hl]
    jr   nz, label_A0064
    inc  c
    ld   a, c
    and  $01
    ld   [$D1CA], a

label_A0064::
    ld   hl, $D1C8
    inc  [hl]
    ld   a, [hl]
    and  $18
    ld   c, a
    sla  a
    sla  a
    add  a, c
    ld   c, a
    ld   hl, label_A0DD1
    add  hl, bc
    ld   de, $C000
    ld   c, $0A

label_A007B::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [$D1C9]
    add  a, [hl]
    ld   [de], a
    inc  hl
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_A007B

label_A008E::
    ret
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    ret  nz
    jp   label_A04DB
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    ret  nz
    jp   label_A04DB
    ld   bc, $006B
    ld   hl, $D168

label_A00AD::
    xor  a
    ldi  [hl], a
    dec  bc
    ld   a, c
    or   b
    jr   nz, label_A00AD
    ld   hl, label_A0241
    ld   a, [hl]
    ld   [$D1CD], a
    ld   hl, label_A024D
    ld   a, [hl]
    ld   [$D1CE], a
    ld   a, $01
    ld   [$D1D1], a
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a
    call label_A07CB
    ld   a, $09
    ld   [rIE], a
    jp   label_A04DB
    xor  a
    ld   [$C16B], a
    call label_A05CD
    jp   label_A04DB

label_A00E3::
    pop  hl
    sbc  a, b
    push hl
    sbc  a, b
    db   $EC ; Undefined instruction
    sbc  a, b
    ld   a, [$FF98]
    ld   h, c
    sbc  a, c
    ld   h, l
    sbc  a, c
    ld   l, h
    sbc  a, c
    ld   [hl], b
    sbc  a, c
    pop  hl
    sbc  a, c
    push hl
    sbc  a, c
    db   $EC ; Undefined instruction
    sbc  a, c
    ld   a, [$FF99]
    call label_28CF
    ld   a, $35
    ld   bc, label_200
    ld   hl, label_A1700
    ld   de, $9000
    call label_B5D
    ld   a, $0C
    call label_B0B
    ld   bc, $0040
    ld   hl, label_A17C0
    ld   de, $97C0
    call label_B5D
    ld   a, $0C
    call label_B0B
    ld   bc, label_300
    ld   hl, label_A0A00
    ld   de, $8A00
    call label_B5D
    ld   a, $35
    ld   bc, label_200
    ld   hl, label_A2B00
    ld   de, $8D00
    call label_B5D
    ld   a, $35
    ld   bc, label_500
    ld   hl, label_A1200
    ld   de, $8000
    call label_B5D
    ld   a, $28
    ld   [$FFE6], a
    ld   a, $28
    ld   hl, label_A39E0
    call label_B69
    call label_A0185
    call label_A01FC
    ld   bc, $0080
    ld   hl, label_A3CB0
    ld   de, $DC10
    call label_A0176
    ld   a, $C7
    ld   [$D6FD], a
    ld   [rLCDC], a
    xor  a
    ld   [$C16B], a
    jp   label_A04DB

label_A0176::
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, $02
    ld   [rSVBK], a
    call label_2914
    xor  a
    ld   [rSVBK], a
    ret

label_A0185::
    ld   a, [$0005]
    and  a
    jr   z, label_A0195
    ld   a, $FF
    ld   [$DC0C], a
    ld   a, $0F
    ld   [$DC0D], a

label_A0195::
    ld   bc, $0001

label_A0198::
    ld   hl, label_A0265
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    ld   d, $00
    ld   hl, $DC0C
    add  hl, de
    ld   a, [hl]
    ld   hl, label_A0259
    add  hl, bc
    and  [hl]
    jr   z, label_A01F5
    ld   d, $00
    ld   hl, label_A00E3
    ld   a, c
    sla  a
    ld   e, a
    add  hl, de
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    ld   h, a
    ld   l, e
    push hl
    ld   a, $02
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   a, $04
    ld   [hl], a
    ld   a, l
    add  a, $1E
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a
    ld   a, $0A
    ldi  [hl], a
    ld   a, $0B
    ldi  [hl], a
    ld   a, $0C
    ld   [hl], a
    pop  hl
    ld   a, [$FFFE]
    and  a
    jr   z, label_A01F5
    ld   a, $01
    ld   [rVBK], a
    ld   a, $02
    ldi  [hl], a
    ldi  [hl], a
    ld   [hl], a
    ld   a, l
    add  a, $1E
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a
    ld   a, $02
    ldi  [hl], a
    ldi  [hl], a
    ld   [hl], a
    xor  a
    ld   [rVBK], a

label_A01F5::
    inc  c
    ld   a, c
    cp   $0C
    jr   nz, label_A0198
    ret

label_A01FC::
    ld   a, [$D1D1]
    and  a
    ret  z
    ld   hl, $9822
    ld   d, $7E

label_A0206::
    ld   a, d
    ldi  [hl], a
    ld   a, l

label_A0209::
    and  $1F
    cp   $12
    jr   nz, label_A0206
    ld   a, l
    cp   $92
    ret  z
    add  a, $10
    ld   l, a
    jr   label_A0206
    ld   a, [$D1D1]
    and  a
    jr   z, label_A022F
    xor  a
    ld   [$D1D1], a
    ld   a, $2C
    ld   [$C173], a
    call label_237C
    ld   a, $01
    ld   [$C19F], a

label_A022F::
    jp   label_A04DB
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_A027D
    call label_A033A
    call label_A0385
    ret

label_A0241::
    jr   nz, label_A0283
    ld   a, b
    sbc  a, b
    jr   nz, label_A0287
    ld   a, b
    sbc  a, b
    jr   nz, label_A028B
    ld   a, b
    sbc  a, b

label_A024D::
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   [hl], b
    ld   [hl], b
    ld   [hl], b
    ld   [hl], b
    sub  a, b
    sub  a, b
    sub  a, b
    sub  a, b

label_A0259::
    ld   bc, label_A0002
    add  a, b
    inc  b
    ld   [label_201], sp
    db   $10 ; Undefined instruction
    inc  b
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    ld   bc, $0001
    nop
    ld   bc, $0001
    ld   bc, label_706
    ld   [bc], a
    inc  bc
    ld   [label_409], sp
    dec  b
    ld   a, [bc]
    dec  bc

label_A027D::
    ld   a, [$D1CF]
    and  a
    ret  nz
    ld   a, [$FFCC]
    and  a
    ret  z
    bit  5, a
    jr   z, label_A0298
    ld   a, $13
    ld   [$FFF2], a
    ld   a, $12
    ld   [$DB96], a
    xor  a
    ld   [$C16B], a
    ret

label_A0298::
    bit  1, a
    jr   z, label_A02A9
    ld   a, [$D1CC]
    and  a
    jr   z, label_A02A5
    dec  a
    jr   label_A02E0

label_A02A5::
    ld   a, $0B
    jr   label_A02E0

label_A02A9::
    bit  0, a
    jr   z, label_A02BA
    ld   a, [$D1CC]
    cp   $0B
    jr   z, label_A02B7
    inc  a
    jr   label_A02E0

label_A02B7::
    xor  a
    jr   label_A02E0

label_A02BA::
    bit  2, a
    jr   z, label_A02CD
    ld   a, [$D1CC]
    cp   $04
    jr   c, label_A02C9
    sub  a, $04
    jr   label_A02E0

label_A02C9::
    add  a, $08
    jr   label_A02E0

label_A02CD::
    bit  3, a
    jr   z, label_A02FB
    ld   a, [$D1CC]
    cp   $08
    jr   nc, label_A02DC
    add  a, $04
    jr   label_A02E0

label_A02DC::
    sub  a, $08
    jr   label_A02E0

label_A02E0::
    ld   [$D1CC], a
    ld   d, $00
    ld   e, a
    ld   hl, label_A0241
    add  hl, de
    ld   a, [hl]
    ld   [$D1CD], a
    ld   hl, label_A024D
    add  hl, de
    ld   a, [hl]
    ld   [$D1CE], a
    ld   a, $0A
    ld   [$FFF2], a
    ret

label_A02FB::
    ld   a, [$FFCC]
    bit  4, a
    ret  z
    ld   b, $00
    ld   a, [$D1CC]
    ld   c, a
    ld   d, a
    ld   hl, label_A0265
    add  hl, bc
    ld   a, [hl]
    ld   c, a
    ld   hl, $DC0C
    add  hl, bc
    ld   a, [hl]
    ld   c, d
    ld   hl, label_A0259
    add  hl, bc
    and  [hl]
    jr   nz, label_A0322
    ld   a, $1D
    ld   [$FFF2], a
    ld   a, $FF
    jr   label_A032B

label_A0322::
    ld   a, $13
    ld   [$FFF2], a
    ld   hl, label_A0271
    add  hl, bc
    ld   a, [hl]

label_A032B::
    ld   [$D1CB], a
    ld   hl, $D1CF
    inc  [hl]
    xor  a
    ld   [$D1D0], a
    ret

label_A0337::
    ld   a, [bc]
    ld   [$FA08], sp
    rst  8
    pop  de
    and  a
    ret  z
    ld   d, $00
    ld   e, a
    ld   hl, label_A0337
    add  hl, de
    ld   a, [$D1D0]
    cp   [hl]
    jr   z, label_A0351
    inc  a
    ld   [$D1D0], a
    ret

label_A0351::
    xor  a
    ld   [$D1D0], a
    ld   hl, $D1CF
    inc  [hl]
    ld   a, [hl]
    cp   $03
    ret  nz
    xor  a
    ld   [$D1CF], a
    ld   [$C16B], a
    ld   a, [$D1CB]
    cp   $FF
    ret  z
    jp   label_A04DB

label_A036D::
    nop
    nop
    ld   b, b
    inc  b
    nop
    ld   [label_442], sp
    ld   bc, label_A0001
    inc  b
    ld   bc, label_A0209
    inc  b
    inc  bc
    ld   [bc], a
    ld   b, b
    inc  b
    inc  bc
    ld   a, [bc]
    ld   b, d
    inc  b

label_A0385::
    ld   a, [$D1CF]
    sla  a
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_A036D
    add  hl, de
    ld   de, $C000
    ld   c, $02

label_A039A::
    ld   a, [$D1CE]
    add  a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [$D1CD]
    add  a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_A039A
    ret
    call label_28CF
    call label_A03CC
    call label_A0411
    call label_A042C
    ld   a, $C7
    ld   [$D6FD], a
    ld   [rLCDC], a
    xor  a
    ld   [$C16B], a
    jp   label_A04DB

label_A03CC::
    ld   a, [$D1CB]
    and  a
    jr   nz, label_A03DB
    ld   a, [$DC0D]
    and  $80
    jr   z, label_A03DB
    ld   a, $0C

label_A03DB::
    ld   b, a
    sla  a
    add  a, b
    ld   d, $00
    ld   e, a
    ld   hl, label_A04E0
    add  hl, de
    push de
    ld   a, [hli]
    ld   c, a
    ld   [$D168], a
    ld   a, [hli]
    ld   b, a
    ld   [$D169], a
    ld   a, [hl]
    ld   [$D16A], a
    ld   h, b
    ld   l, c
    push hl
    ld   bc, label_800
    ld   de, $9000
    call label_B5D
    pop  hl
    ld   bc, label_800
    add  hl, bc
    ld   de, $8800
    ld   a, [$D16A]
    call label_B5D
    pop  de
    ret

label_A0411::
    ld   hl, label_A0507
    add  hl, de
    ld   a, [hli]
    ld   c, a
    ld   a, [hli]
    ld   b, a
    ld   a, $28
    ld   [$FFE6], a
    ld   a, [hl]
    ld   h, b
    ld   l, c
    call label_B69
    ret
    ld   a, a
    ld   e, e
    inc  d
    ld   l, $4E
    add  hl, de
    xor  c
    ld   [label_2421], sp
    ld   b, h
    ld   bc, $0008
    ld   de, $DC10
    call label_A0176
    ret

label_A0439::
    ld   a, b
    ld   [hl], b
    ld   c, $03
    ld   a, b
    ld   a, b
    ld   c, $23
    ld   a, b
    add  a, b
    inc  d
    inc  bc
    ld   a, b
    adc  a, b
    ld   d, $03
    ld   a, b
    sub  a, b
    jr   label_A0450
    ld   a, b
    sbc  a, b
    ld   a, [de]

label_A0450::
    inc  bc
    adc  a, b
    ld   [hl], b
    db   $10 ; Undefined instruction
    adc  a, b
    ld   a, b
    ld   [de], a
    inc  b
    adc  a, b
    add  a, b
    nop
    inc  b
    adc  a, b
    adc  a, b
    ld   [bc], a
    inc  b
    adc  a, b
    sub  a, b
    inc  b
    inc  b
    adc  a, b
    sbc  a, b
    ld   b, $04
    ld   a, [$FFCC]
    bit  5, a
    jr   z, label_A047D
    ld   a, $13
    ld   [$FFF2], a
    ld   a, $01
    ld   [$DB96], a
    xor  a
    ld   [$C16B], a
    ret

label_A047D::
    ld   a, [$FFCC]
    bit  4, a
    jr   z, label_A0492
    ld   a, $13
    ld   [$FFF2], a
    xor  a
    ld   [$D181], a
    ld   a, $10
    ld   [$FFE7], a
    call label_A04DB

label_A0492::
    ld   hl, label_A0439
    ld   de, $C000
    ld   c, $0C

label_A049A::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]

label_A04A1::
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_A049A
    ret
    call label_28CF
    ld   a, $28
    call label_BBE
    ld   a, [$FF98]
    ld   [$DB9D], a
    ld   a, [$FF99]
    ld   [$DB9E], a
    ld   a, $0B
    ld   [$DB95], a
    xor  a
    ld   [$DB96], a
    ld   a, $18
    ld   [$DE05], a
    ld   a, $07
    ld   [$FFA9], a

label_A04CE::
    ld   a, $70
    ld   [$FFAA], a
    ld   a, [$D6FD]
    ld   [$D6FD], a
    ld   [rLCDC], a
    ret

label_A04DB::
    ld   hl, $DB96
    inc  [hl]
    ret

label_A04E0::
    nop
    ld   b, b
    add  hl, hl
    nop
    ld   d, b
    add  hl, hl
    nop
    ld   h, b
    add  hl, hl
    nop
    ld   [hl], b
    add  hl, hl
    nop

label_A04ED::
    ld   b, b
    ld   a, [hli]
    nop
    ld   d, b
    ld   a, [hli]
    nop
    ld   h, b
    ld   a, [hli]
    nop
    ld   [hl], b
    ld   a, [hli]
    nop
    ld   b, b
    dec  hl

label_A04FB::
    nop
    ld   d, b
    dec  hl
    nop
    ld   h, b
    dec  hl
    nop
    ld   [hl], b
    dec  hl
    nop
    ld   [hl], b
    dec  sp

label_A0507::
    jr   nz, label_A0561
    jr   z, label_A04FB
    ld   e, d
    jr   z, label_A04CE
    ld   e, l
    jr   z, label_A04A1
    ld   h, b
    jr   z, label_A0574
    ld   h, e
    jr   z, label_A0547
    ld   h, [hl]
    jr   z, label_A051A

label_A051A::
    ld   l, c
    jr   z, label_A04ED
    ld   l, e
    jr   z, label_A04C0
    ld   l, [hl]
    jr   z, label_A0593
    ld   [hl], c
    jr   z, label_A0566
    ld   [hl], h
    jr   z, label_A0539
    ld   [hl], a
    jr   z, label_A057C
    ld   d, l
    jr   z, label_A057F
    jr   c, label_A0545
    nop
    ld   d, b
    ld   b, b
    ld   d, $00
    ld   d, b
    ld   c, b
    jr   label_A053A

label_A053A::
    ld   d, b
    ld   d, b
    ld   a, [de]
    nop
    ld   d, b
    ld   e, b
    ld   [label_A1000], sp
    ld   h, b

label_A0544::
    ld   a, [bc]

label_A0545::
    nop
    ld   d, b

label_A0547::
    ld   l, b
    ld   b, h
    nop
    ld   d, b
    ld   [hl], b
    inc  c
    nop

label_A054E::
    ld   a, b
    ld   [hl], b
    ld   c, $03
    ld   a, b
    ld   a, b
    ld   c, $23
    ld   a, b
    add  a, b
    ld   [label_A3803], sp
    adc  a, b
    ld   a, [bc]
    inc  bc
    ld   a, b
    sub  a, b
    ld   b, h

label_A0561::
    inc  bc
    ld   a, b
    sbc  a, b
    ld   l, $03

label_A0566::
    adc  a, b
    ld   [hl], b
    db   $10 ; Undefined instruction
    adc  a, b
    ld   a, b
    ld   [de], a
    inc  b
    adc  a, b
    add  a, b
    nop
    inc  b
    adc  a, b
    adc  a, b

label_A0574::
    ld   [bc], a
    inc  b
    adc  a, b
    sub  a, b
    inc  b
    inc  b
    adc  a, b
    sbc  a, b

label_A057C::
    ld   b, $04
    ld   a, [$FFCC]
    bit  4, a
    jr   z, label_A059A
    xor  a
    ld   [$D1C8], a
    ld   [$D1CA], a
    ld   a, $20
    ld   [$D1C9], a
    ld   a, $22
    ld   [$D368], a
    call label_A04DB
    jr   label_A05A3

label_A059A::
    bit  5, a
    jr   z, label_A05A7
    ld   a, $0A
    ld   [$DB96], a

label_A05A3::
    ld   a, $13
    ld   [$FFF2], a

label_A05A7::
    ld   de, $C000
    ld   hl, label_A052E
    ld   c, $14
    ld   a, [$FFE7]
    inc  a
    ld   [$FFE7], a
    and  $30
    jr   nz, label_A05BD
    ld   hl, label_A054E
    ld   c, $0C

label_A05BD::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_A05BD
    ret

label_A05CD::
    xor  a
    ld   [$D16D], a
    ld   [$D16E], a
    ld   a, $13
    ld   [$D17E], a
    ld   a, $01
    ld   [$D17F], a
    ld   a, $E4
    ld   [$D180], a
    ld   a, $80
    ld   [$D16F], a
    ret

label_A05E9::
    ld   a, $00
    ld   [$D16B], a
    ld   a, $1D
    ld   [$FFF2], a
    ld   a, $10
    ld   [$FFE7], a
    ld   a, $11
    ld   [$D1C6], a
    ld   a, $10
    ld   [$DB96], a
    ret
    ld   a, [$FF02]
    bit  7, a
    jr   nz, label_A0615
    push bc
    push de
    push hl
    ld   a, $01
    ld   [$D171], a
    call label_A0638
    pop  hl
    pop  de
    pop  bc

label_A0615::
    ret
    ld   a, [$D16B]
    cp   $01
    ret  nz
    ld   a, [$D16D]
    cp   $FF
    ret  z
    ld   a, [$D172]
    and  a
    ret  nz
    ld   hl, $D182
    inc  [hl]
    ld   a, [hl]
    cp   $06
    ret  c
    xor  a
    ld   [hl], a
    ld   [$D17D], a
    call label_A0A27
    ret

label_A0638::
    ld   a, [$D17C]
    and  a
    jp   nz, label_A07C5
    ld   a, [$D16B]
    cp   $07
    jp   z, label_A077F
    ld   a, [$D173]
    and  a
    jr   nz, label_A0651
    call label_A0670
    ret

label_A0651::
    ld   a, [$D174]
    and  a
    jr   z, label_A066C
    ld   a, [$D175]
    and  a
    jr   z, label_A066C
    ld   a, [$D176]
    cp   $02
    jr   z, label_A0668
    call label_A074E
    ret

label_A0668::
    call label_A0765
    ret

label_A066C::
    call label_A0695
    ret

label_A0670::
    ld   hl, $D17A
    ld   c, [hl]
    inc  [hl]
    ld   b, $00
    ld   hl, label_A0A7C
    add  hl, bc
    ld   a, [hl]
    ld   [rSB], a
    ld   a, $01
    ld   [rSC], a
    ld   a, $81
    ld   [rSC], a
    ld   a, [$D17A]
    cp   $02
    ret  nz
    xor  a
    ld   [$D17A], a
    inc  a
    ld   [$D173], a
    ret

label_A0695::
    ld   a, [$D17A]
    ld   c, a
    ld   a, [$D17B]
    ld   b, a
    ld   a, [$D183]
    ld   l, a
    ld   a, [$D184]
    ld   h, a
    add  hl, bc
    ld   a, [$FF01]
    ld   [$D18F], a
    ld   a, [hl]
    ld   [rSB], a
    ld   l, a
    ld   a, [$D178]
    add  a, l
    ld   [$D178], a
    ld   a, [$D179]
    adc  a, $00
    ld   [$D179], a
    ld   a, $01
    ld   [rSC], a
    ld   a, $81
    ld   [rSC], a
    ld   hl, $D17A
    inc  [hl]
    jr   nz, label_A06CE
    inc  hl
    inc  [hl]

label_A06CE::
    ld   hl, $D17A
    ld   a, [$D189]
    cp   [hl]
    jr   nz, label_A06DE
    inc  hl
    ld   a, [$D18A]
    cp   [hl]
    jr   z, label_A06DF

label_A06DE::
    ret

label_A06DF::
    ld   hl, $D174
    ld   a, [hl]
    and  a
    jr   z, label_A06E9
    ld   hl, $D175

label_A06E9::
    inc  [hl]
    ld   a, [$D190]
    and  a
    jr   z, label_A0722
    ld   a, [$D16B]
    cp   $06
    jr   z, label_A0722
    ld   hl, $D175
    ld   a, [hl]
    and  a
    jr   nz, label_A071E
    xor  a
    ld   [$D17A], a
    ld   [$D17B], a
    ld   a, [$D187]
    ld   [$D183], a
    ld   a, [$D188]
    ld   [$D184], a
    ld   a, [$D18D]
    ld   [$D189], a
    ld   a, [$D18E]
    ld   [$D18A], a
    ret

label_A071E::
    call label_A0735
    ret

label_A0722::
    ld   a, [$D18F]
    ld   [$D16E], a

label_A0728::
    ld   a, $07
    ld   [$D16B], a
    ld   a, $01
    ld   [$D170], a
    call label_A07F0

label_A0735::
    ld   a, [$D18B]
    ld   [$D189], a
    ld   a, [$D18C]
    ld   [$D18A], a
    ld   a, [$D185]
    ld   [$D183], a
    ld   a, [$D186]
    ld   [$D184], a
    ret

label_A074E::
    ld   c, a
    ld   b, $00
    ld   hl, $D178
    add  hl, bc
    ld   a, [hl]
    ld   [rSB], a
    ld   a, $01
    ld   [rSC], a
    ld   a, $81
    ld   [rSC], a
    ld   hl, $D176
    inc  [hl]
    ret

label_A0765::
    ld   a, [$FF01]
    ld   [$D16E], a
    xor  a
    ld   [rSB], a
    ld   a, $01
    ld   [rSC], a
    ld   a, $81
    ld   [rSC], a
    ld   hl, $D177
    inc  [hl]
    ld   a, [hl]
    cp   $02
    jr   z, label_A0728
    ret

label_A077F::
    ld   a, [$D191]
    ld   [$D192], a
    ld   a, [$D16D]
    ld   [$D193], a
    ld   a, [$FF01]
    ld   [$D16D], a
    cp   $FF
    jr   nz, label_A07A0
    ld   a, $00
    ld   [$D172], a
    ld   [$D16B], a
    ld   a, $02
    jr   label_A07B8

label_A07A0::
    bit  1, a
    jr   z, label_A07A9
    ld   a, $01
    ld   [$D17D], a

label_A07A9::
    bit  4, a
    ld   a, $00
    ld   [$D16B], a
    ld   a, $01
    jr   nz, label_A07B7
    ld   [$D16B], a

label_A07B7::
    inc  a

label_A07B8::
    ld   [$D170], a
    ld   a, [$D190]
    and  a
    jr   nz, label_A07C5
    xor  a
    ld   [$D172], a

label_A07C5::
    ret
    xor  a
    ld   [rSC], a
    ld   [rSB], a

label_A07CB::
    xor  a
    ld   [rSB], a
    ld   [rSC], a
    ld   [$D16B], a
    ld   [$D16C], a
    dec  a
    ld   [$D16D], a
    ld   [$D16E], a
    ld   a, $80
    ld   [$D16F], a
    call label_A07E6
    ret

label_A07E6::
    xor  a
    ld   [$D170], a
    ld   [$D171], a
    ld   [$D172], a

label_A07F0::
    xor  a
    ld   [$D173], a
    ld   [$D174], a
    ld   [$D175], a
    ld   [$D176], a
    ld   [$D177], a
    ld   [$D178], a
    ld   [$D179], a
    ld   [$D17A], a
    ld   [$D17B], a
    ld   [$D17C], a
    ld   [$D17D], a
    ret

label_A0813::
    ld   a, [$D172]
    and  a
    jr   z, label_A081D
    call label_A082E
    ret  nc

label_A081D::
    ld   a, [$D192]
    cp   $01
    jr   nz, label_A0828
    call label_A082E
    ret  nc

label_A0828::
    call label_A0AA2
    jp   label_A0B6B

label_A082E::
    ld   a, [$D170]
    cp   $02
    jr   c, label_A0878
    call label_A087C
    jr   nz, label_A0878
    xor  a
    ld   [$D182], a
    ld   [$D192], a
    inc  a
    ld   [$D16B], a
    ld   a, [$D16D]
    cp   $FF
    jr   z, label_A086E
    bit  0, a
    jr   nz, label_A0867

label_A0850::
    bit  1, a
    jr   nz, label_A0867
    and  $F0
    jr   z, label_A0876
    xor  a
    ld   [$D16B], a
    ld   [$D192], a
    ld   a, [$D16D]
    call label_A0BA7
    jr   label_A0876

label_A0867::
    scf
    ret
    xor  a
    ld   [$D192], a
    dec  a

label_A086E::
    inc  a
    ld   [$D16B], a
    dec  a
    call label_A0BA7

label_A0876::
    and  a
    ret

label_A0878::
    xor  a
    ld   a, $F0
    ret

label_A087C::
    ld   hl, $D170
    ld   a, [hl]
    cp   $03
    ret  z
    inc  a
    ld   [hl], a
    ret

label_A0886::
    ld   a, [$D16B]
    cp   $01
    jr   z, label_A0898
    cp   $02
    jr   z, label_A0898
    and  a
    ld   a, $FF
    ret  z

label_A0895::
    ld   a, $F0
    ret

label_A0898::
    ld   a, [$D17D]
    and  a
    jr   nz, label_A0895
    ld   a, [$D172]
    and  a
    jr   z, label_A08A8
    call label_A082E
    ret  nc

label_A08A8::
    ld   a, [$D192]
    cp   $02
    jr   nz, label_A08B3
    call label_A082E
    ret  nc

label_A08B3::
    ld   a, [$D16D]
    cp   $FF
    jp   z, label_A0BA7
    call label_A0AAF
    jp   label_A0B6B

label_A08C1::
    ld   c, a
    ld   a, [$D16B]
    and  a
    ld   a, [$D16D]
    jp   z, label_A0BA7
    ld   a, [$D16B]
    cp   $01
    jr   z, label_A08DA
    cp   $03
    jr   z, label_A08DA
    ld   a, $F0
    ret

label_A08DA::
    ld   a, [$D172]
    and  a
    jr   nz, label_A0934
    ld   a, c
    inc  a
    ld   [$D194], a
    ld   a, l
    ld   [$D195], a
    ld   a, h
    ld   [$D196], a
    ld   a, $00
    ld   [$D197], a
    ld   a, $D0
    ld   [$D198], a
    ld   a, [$D16D]
    cp   $FF
    jp   z, label_A0BA7
    ld   a, [$D199]
    ld   [$D1B5], a
    and  a
    jr   z, label_A0928
    ld   a, [$D194]
    dec  a
    dec  a
    ld   c, a
    ld   b, $00
    push hl
    ld   hl, $D1AC
    add  hl, bc
    ld   a, [hl]
    ld   [$D1B5], a
    sla  c
    ld   b, $00
    ld   hl, $D19A
    add  hl, bc
    ld   a, [hli]
    ld   b, [hl]
    pop  hl
    ld   c, a
    jp   label_A092B

label_A0928::
    ld   bc, label_280

label_A092B::
    call label_A0BD9
    call label_A0B0F
    jp   label_A0B6B

label_A0934::
    ld   a, [$D170]
    cp   $02
    ld   a, $F0
    jp  c, label_A09E1
    call label_A087C
    ld   a, $F0
    jp   nz, label_A09E1
    ld   hl, $D194
    ld   a, [$D16D]
    ld   c, a
    and  $F0
    ld   a, c
    jp   nz, label_A09CE
    bit  1, a
    jp   nz, label_A0970
    bit  0, a
    jp   nz, label_A0970
    ld   a, [hl]
    and  a
    ld   a, [$D16D]
    jr   z, label_A09D8
    ld   a, [hl]
    cp   $01
    jp   z, label_A09E2
    dec  [hl]
    ld   a, [$D16D]
    jr   z, label_A09D8

label_A0970::
    ld   a, [hl]
    cp   $01
    ld   a, $F0
    jp   z, label_A09E1
    ld   bc, label_280
    ld   a, [$D199]
    ld   [$D1B5], a
    and  a
    jr   z, label_A09A1
    ld   a, [$D194]
    dec  a
    dec  a
    ld   c, a
    ld   b, $00
    push hl
    ld   hl, $D1AC
    add  hl, bc
    ld   a, [hl]
    ld   [$D1B5], a
    sla  c
    ld   b, $00
    ld   hl, $D19A
    add  hl, bc
    ld   a, [hli]
    ld   b, [hl]
    pop  hl
    ld   c, a

label_A09A1::
    ld   a, [$D16D]
    bit  1, a
    jp   nz, label_A09C3
    ld   a, [$D197]
    add  a, $28
    ld   [$D197], a
    ld   a, [$D198]
    adc  a, $00
    ld   [$D198], a
    ld   a, $00
    ld   [$D187], a
    ld   a, $C2
    ld   [$D188], a

label_A09C3::
    ld   a, [$D187]
    ld   l, a
    ld   a, [$D188]
    ld   h, a
    jp   label_A092B

label_A09CE::
    push af
    ld   a, $01
    ld   [$D17C], a
    pop  af
    call label_A0BA7

label_A09D8::
    push af
    xor  a
    ld   [$D190], a
    ld   [$D172], a
    pop  af

label_A09E1::
    ret

label_A09E2::
    ld   a, [$D1B6]
    and  a
    ld   a, [$D16D]
    jr   z, label_A09D8
    dec  [hl]
    call label_A0B5D
    jp   label_A0B6B
    ld   a, [$D16B]
    cp   $01
    jr   z, label_A0A04
    cp   $03
    jr   z, label_A0A04
    and  a
    ld   a, $FF

label_A0A00::
    ret  z
    ld   a, $F0
    ret

label_A0A04::
    ld   a, [$D172]
    and  a
    jr   z, label_A0A0E
    call label_A082E
    ret  nc

label_A0A0E::
    ld   a, [$D192]
    cp   $04
    jr   nz, label_A0A19
    call label_A082E
    ret  nc

label_A0A19::
    ld   a, [$D16D]
    cp   $FF
    jp   z, label_A0BA7
    call label_A0B43
    jp   label_A0B6B

label_A0A27::
    ld   a, [$D16B]
    cp   $01
    jr   z, label_A0A39
    cp   $03
    jr   z, label_A0A39
    and  a
    ld   a, $FF
    ret  z
    ld   a, $F0
    ret

label_A0A39::
    ld   a, [$D172]
    and  a
    jr   z, label_A0A43
    call label_A082E
    ret  nc

label_A0A43::
    ld   a, [$D16D]
    cp   $FF
    jp   z, label_A0BA7
    call label_A0B50
    jp   label_A0B6B

label_A0A51::
    ld   [$D191], a
    ld   a, d
    ld   [$D190], a
    ld   a, l
    ld   [$D183], a
    ld   [$D185], a
    ld   a, h
    ld   [$D184], a
    ld   [$D186], a
    ld   a, c
    ld   [$D189], a
    ld   [$D18B], a
    ld   a, b
    ld   [$D18A], a
    ld   [$D18C], a
    xor  a
    ld   [$D170], a
    call label_A07F0
    ret

label_A0A7C::
    adc  a, b
    inc  sp

label_A0A7E::
    ld   bc, $0000
    nop
    ld   bc, $0000
    nop

label_A0A86::
    ld   [bc], a
    nop
    inc  b
    nop

label_A0A8A::
    inc  b
    nop
    nop
    nop
    inc  b
    nop
    nop
    nop

label_A0A92::
    ld   [$0000], sp
    nop
    ld   [$0000], sp
    nop

label_A0A9A::
    rrca
    nop
    nop
    nop
    rrca
    nop
    nop
    nop

label_A0AA2::
    ld   a, $01
    ld   d, $00
    ld   hl, label_A0A7E
    ld   bc, $0008
    jp   label_A0A51

label_A0AAF::
    ld   a, $02
    ld   d, $00
    ld   hl, $D1B7
    ld   bc, $000C
    call label_A0A51
    ld   hl, label_A0A86
    ld   de, $D1B7
    ld   bc, $0004
    call label_A0B06
    ld   de, $0006
    ld   a, [$D17F]
    ld   [$D1BB], a
    call label_A0AFF
    ld   a, [$D17E]
    ld   [$D1BC], a
    call label_A0AFF
    ld   a, [$D180]
    ld   [$D1BD], a
    call label_A0AFF
    ld   a, [$D16F]
    ld   [$D1BE], a
    call label_A0AFF
    ld   a, e
    ld   [$D1BF], a
    ld   a, d
    ld   [$D1C0], a
    xor  a
    ld   [$D1C1], a
    ld   [$D1C2], a
    ret

label_A0AFF::
    add  a, e
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ret

label_A0B06::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  bc
    ld   a, c
    or   b
    jr   nz, label_A0B06
    ret

label_A0B0F::
    ld   a, l
    ld   [$D187], a
    ld   a, h
    ld   [$D188], a
    ld   a, c
    ld   [$D18D], a
    ld   a, b
    ld   [$D18E], a
    push bc
    ld   a, $03
    ld   d, $01
    ld   hl, $D1B7
    ld   bc, $0004
    call label_A0A51
    ld   a, [label_A0A8A]
    ld   [$D1B7], a
    ld   a, [$D1B5]
    ld   [$D1B8], a
    pop  bc
    ld   a, c
    ld   [$D1B9], a
    ld   a, b
    ld   [$D1BA], a
    ret

label_A0B43::
    ld   a, $04
    ld   d, $00
    ld   hl, label_A0A92
    ld   bc, $0008
    jp   label_A0A51

label_A0B50::
    ld   a, $05
    ld   d, $00
    ld   hl, label_A0A9A
    ld   bc, $0008
    jp   label_A0A51

label_A0B5D::
    ld   a, $06
    ld   d, $01
    ld   hl, label_A0A8A
    ld   bc, $0008
    jp   label_A0A51
    ret

label_A0B6B::
    ld   a, [$D16B]
    cp   $01
    jr   z, label_A0B7E
    and  a
    jr   nz, label_A0B7C
    ld   a, [$D191]
    cp   $01
    jr   z, label_A0B88

label_A0B7C::
    scf
    ret

label_A0B7E::
    ld   a, [$D191]
    cp   $01
    jr   z, label_A0B7C
    ld   [$D16B], a

label_A0B88::
    xor  a
    ld   [$D170], a
    ld   [$D192], a
    ld   a, $01
    ld   [$D17A], a
    ld   [$D172], a
    ld   a, [label_A0A7C]
    ld   [rSB], a
    ld   a, $01
    ld   [rSC], a
    ld   a, $81
    ld   [rSC], a
    ld   a, $F0
    ret

label_A0BA7::
    push af
    ld   a, [$D16D]
    cp   $FF
    jr   z, label_A0BC7
    bit  7, a
    jr   z, label_A0BB7
    ld   a, $00
    jr   label_A0BD4

label_A0BB7::
    bit  6, a
    jr   z, label_A0BBF
    ld   a, $03
    jr   label_A0BD4

label_A0BBF::
    bit  5, a
    jr   z, label_A0BC7
    ld   a, $02
    jr   label_A0BD4

label_A0BC7::
    ld   a, [$D16E]
    cp   $81
    jr   z, label_A0BD2
    ld   a, $01
    jr   label_A0BD4

label_A0BD2::
    ld   a, $01

label_A0BD4::
    ld   [$D1C5], a
    pop  af
    ret

label_A0BD9::
    push hl
    push bc
    ld   a, [$D197]
    ld   l, a
    ld   a, [$D198]
    ld   h, a
    ld   de, $C200
    ld   c, $28

label_A0BE8::
    ld   a, [hli]
    push hl
    ld   h, $00
    sla  a
    rl   h
    sla  a
    rl   h
    sla  a
    rl   h
    sla  a
    rl   h
    ld   l, a
    ld   a, [$D169]
    adc  a, h
    ld   h, a
    ld   b, $10
    call label_BC5
    pop  hl
    dec  c
    jr   nz, label_A0BE8
    pop  bc
    pop  hl
    ret
    call label_A0813
    cp   $F0
    jr   z, label_A0C29
    cp   $FF
    jr   z, label_A0C2A
    ld   a, [$DB96]
    inc  a
    ld   [$D1C6], a
    xor  a
    ld   [$D1C7], a
    ld   a, $10
    ld   [$DB96], a

label_A0C29::
    ret

label_A0C2A::
    ld   a, $1D
    ld   [$FFF2], a
    ld   a, $10
    ld   [$FFE7], a
    ld   a, $11
    ld   [$DB96], a
    ret
    ld   a, [$D16D]
    cp   $FF
    jp   z, label_A05E9
    ld   a, [$D172]
    and  a
    jr   z, label_A0C54
    ld   a, [$D16B]
    cp   $03
    jr   z, label_A0C54
    cp   $01
    jr   z, label_A0C54
    jp   label_A05E9

label_A0C54::
    ld   a, $01
    ld   [$D1B6], a
    ld   hl, $C200
    ld   a, $09
    call label_A08C1
    cp   $FF
    jp   z, label_A05E9
    cp   $F0
    ret  z
    jp   label_A04DB
    ld   a, [$D16D]
    cp   $FF
    jp   z, label_A05E9
    ld   a, [$D172]
    and  a
    jr   z, label_A0C87
    ld   a, [$D16B]
    cp   $02
    jr   z, label_A0C87
    cp   $01
    jr   z, label_A0C87
    jr   label_A0CAC

label_A0C87::
    ld   a, [$D16D]
    bit  1, a
    jr   nz, label_A0CAC
    call label_A0886
    cp   $FF
    jp   z, label_A05E9
    cp   $F0
    ret  z
    ld   a, $03
    ld   [$D182], a
    xor  a
    ld   [$D1C7], a
    ld   a, $10
    ld   [$DB96], a
    ld   a, $0F
    ld   [$D1C6], a

label_A0CAC::
    ret
    ld   a, [$D16D]
    cp   $FF
    jp   z, label_A05E9
    bit  3, a
    jp   nz, label_A0CCD
    bit  1, a
    jp   nz, label_A0CCD
    ld   a, $01
    ld   [$DB96], a
    ld   a, $02
    ld   [$D368], a
    xor  a
    ld   [$D16B], a

label_A0CCD::
    ret
    ld   hl, $D1C7
    inc  [hl]
    ld   a, [hl]
    cp   $06
    jr   c, label_A0CDF
    xor  a
    ld   [hl], a
    ld   a, [$D1C6]
    ld   [$DB96], a

label_A0CDF::
    ret
    ld   d, b
    jr   nc, label_A0CF7
    nop
    ld   d, b
    jr   c, label_A0CFD
    nop
    ld   d, b
    ld   b, b
    jr   label_A0CEC

label_A0CEC::
    ld   d, b
    ld   c, b
    ld   a, [de]
    nop
    ld   d, b
    ld   d, b
    inc  h
    nop
    ld   d, b
    ld   e, b
    ld   h, $00
    ld   d, b
    ld   h, b
    jr   z, label_A0CFC

label_A0CFC::
    ld   d, b

label_A0CFD::
    ld   l, b
    ld   a, [hli]
    nop
    ld   d, b
    ld   [hl], b
    inc  l
    nop
    ld   d, b
    ld   a, b
    jr   nc, label_A0D08

label_A0D08::
    rst  $38
    ld   d, b
    jr   nc, label_A0D20
    nop
    ld   d, b
    jr   c, label_A0D26
    nop
    ld   d, b
    ld   b, b
    jr   label_A0D15

label_A0D15::
    ld   d, b
    ld   c, b
    ld   a, [de]
    nop
    ld   d, b
    ld   d, b
    inc  h
    nop
    ld   d, b
    ld   e, b
    ld   h, $00
    ld   d, b
    ld   h, b
    jr   z, label_A0D25

label_A0D25::
    ld   d, b

label_A0D26::
    ld   l, b
    ld   a, [hli]
    nop
    ld   d, b
    ld   [hl], b
    inc  l
    nop
    ld   d, b
    ld   a, b
    ldd  [hl], a
    nop
    rst  $38
    ld   d, b
    jr   nc, label_A0D49
    nop
    ld   d, b
    jr   c, label_A0D4F
    nop
    ld   d, b
    ld   b, b
    jr   label_A0D3E

label_A0D3E::
    ld   d, b
    ld   c, b
    ld   a, [de]
    nop
    ld   d, b
    ld   d, b
    inc  h
    nop
    ld   d, b
    ld   e, b
    ld   h, $00
    ld   d, b
    ld   h, b
    jr   z, label_A0D4E

label_A0D4E::
    ld   d, b

label_A0D4F::
    ld   l, b
    ld   a, [hli]
    nop
    ld   d, b
    ld   [hl], b
    inc  l
    nop
    ld   d, b
    ld   a, b
    inc  [hl]
    nop
    rst  $38
    ld   d, b
    jr   nc, label_A0D72
    nop
    ld   d, b
    jr   c, label_A0D78
    nop
    ld   d, b
    ld   b, b
    jr   label_A0D67

label_A0D67::
    ld   d, b
    ld   c, b
    ld   a, [de]
    nop
    ld   d, b
    ld   d, b
    inc  h
    nop
    ld   d, b
    ld   e, b
    ld   h, $00
    ld   d, b
    ld   h, b
    jr   z, label_A0D77

label_A0D77::
    ld   d, b

label_A0D78::
    ld   l, b
    ld   a, [hli]
    nop
    ld   d, b
    ld   [hl], b
    inc  l
    nop
    ld   d, b
    ld   a, b
    ld   [hl], $00
    rst  $38
    ld   [$FF4C], a
    add  hl, bc
    ld   c, l
    ldd  [hl], a
    ld   c, l
    ld   e, e
    ld   c, l
    ld   a, [$FFCC]
    and  a
    jr   z, label_A0D9F
    ld   a, $01
    ld   [$DB96], a
    ld   a, $02
    ld   [$D368], a
    xor  a
    ld   [$C16B], a

label_A0D9F::
    ld   a, [$FFE7]
    inc  a
    ld   [$FFE7], a
    and  $30
    jr   nz, label_A0DAD
    ld   a, $1D
    ld   [$FFF2], a
    ret

label_A0DAD::
    ld   a, [$D1C5]
    sla  a
    add  a, $84
    ld   l, a
    ld   a, $4D
    adc  a, $00
    ld   h, a
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    ld   hl, $C000

label_A0DC0::
    ld   a, [de]
    cp   $FF
    ret  z
    ldi  [hl], a
    inc  de
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, [de]
    ldi  [hl], a
    inc  de
    jr   label_A0DC0

label_A0DD1::
    ld   d, b
    db   $10 ; Undefined instruction
    ld   bc, label_1850
    ld   d, $01
    ld   d, b
    jr   nz, label_A0DF4
    ld   bc, label_2850
    ld   a, [de]
    ld   bc, label_3053
    inc  e
    ld   bc, label_3853
    ld   e, $01
    ld   d, b
    ld   b, b
    jr   nz, label_A0DEE
    ld   d, b

label_A0DEE::
    ld   c, b
    jr   nz, label_A0E12
    ld   d, b
    ld   d, b
    jr   c, label_A0DF6
    ld   d, b

label_A0DF6::
    ld   e, b
    db   $3A ; ldd  a, [hl]
    ld   bc, label_E50
    inc  d
    ld   bc, label_1650
    ld   d, $01
    ld   d, b
    ld   e, $18
    ld   bc, label_2650
    ld   a, [de]
    ld   bc, label_3053
    ld   b, [hl]
    ld   bc, label_3853
    ld   c, b
    ld   bc, label_A0050
    jr   nz, label_A0E16
    ld   d, b

label_A0E16::
    ld   c, b
    ldi  [hl], a
    ld   bc, label_A124E
    inc  a
    ld   bc, label_A1A4E
    ld   a, $01
    ld   d, b
    db   $10 ; Undefined instruction
    ld   bc, label_1850
    ld   d, $01
    ld   d, b
    jr   nz, label_A0E44
    ld   bc, label_2850
    ld   a, [de]
    ld   bc, label_3053
    inc  e
    ld   bc, label_3853
    ld   e, $01
    ld   d, c
    ld   b, b
    ldi  [hl], a
    ld   hl, label_A0851
    ldi  [hl], a
    ld   bc, label_A1150
    inc  a

label_A0E44::
    ld   bc, label_A1950
    ld   a, $01
    ld   d, b
    ld   de, $0114
    ld   d, b
    add  hl, de
    ld   d, $01
    ld   d, b
    ld   hl, $0118
    ld   d, b
    add  hl, hl
    ld   a, [de]
    ld   bc, label_304F
    inc  e
    ld   bc, label_384F
    ld   e, $01
    ld   d, b
    ld   b, b
    ldi  [hl], a
    ld   hl, label_A0850
    jr   nz, label_A0E8A
    ld   d, b
    ld   d, b
    jr   c, label_A0E6E
    ld   d, b

label_A0E6E::
    ld   e, b
    db   $3A ; ldd  a, [hl]
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

label_A0E8A::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A1000::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A1150::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A1200::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A124E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and  e
    and  e
    ld   bc, label_302
    ld   b, h
    dec  b
    ld   b, $07
    ld   [label_1A09], sp
    dec  bc
    inc  c
    ld   a, [de]
    ld   c, $0F
    rst  $18
    and  e
    and  e
    and  e
    and  e
    ld   de, label_1344
    inc  d
    dec  d
    ld   d, $17
    jr   label_A1588
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    rst  $28
    and  e
    and  e
    ld   l, a
    and  e
    ld   hl, label_A0422
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_A15AC
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $2F
    rst  $38
    and  e
    and  e
    and  e
    and  e
    and  e
    ldd  [hl], a
    ld   b, h
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    jr   c, label_A15D0
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a
    dec  a
    ld   a, $3F
    xor  $A3
    and  e
    and  e
    and  e
    and  e
    ld   b, d
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d

label_A15AC::
    ld   c, e
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    and  e
    ld   l, a
    and  e
    and  e
    and  e
    and  e
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    and  e
    and  e
    and  e
    ld   l, a
    and  e
    and  e
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]

label_A15D0::
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    and  e
    and  e
    and  e
    and  e
    and  e
    and  e
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    and  e
    and  e
    and  e
    and  e
    and  e
    and  e
    and  e
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    and  e
    and  e
    and  e
    ld   [de], a
    inc  b
    ld   [de], a
    sub  a, d
    sub  a, e
    sub  a, h
    sub  a, l
    sub  a, [hl]

label_A160C::
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
    ld   [de], a
    inc  b
    ld   a, [bc]
    dec  c
    ld   a, [bc]
    and  d
    ld   b, h
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    xor  d
    xor  e
    xor  h
    xor  l
    xor  [hl]
    xor  a
    or   b
    ld   a, [bc]
    dec  c
    ld   [de], a
    inc  b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    ld   [de], a
    inc  b
    ld   [de], a
    inc  b
    ld   a, [bc]
    dec  c
    ld   a, [bc]
    jp   nz, label_C4C3
    push bc
    add  a, $C7
    ret  z
    ret
    jp   z, label_CCCB
    call label_ACE
    dec  c
    ld   a, [bc]
    dec  c
    db   $10 ; Undefined instruction
    pop  de
    jp   nc, label_D4D3
    push de
    sub  a, $D7
    ret  c
    reti
    jp  c, label_DCDB
    ld   b, b
    ld   [hl], d
    ld   h, b
    ld   h, c
    db   $10 ; Undefined instruction
    nop
    ld   [$FFE1], a
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    ld   b, h
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$ECEB], a
    ld   b, h
    ld   b, c
    ld   [hl], b
    ld   [hl], c
    jr   nz, label_A160C
    nop
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$FD
    cp   $30
    ld   sp, label_A1150
    add  a, b
    add  a, c
    add  a, d
    nop
    ld   sp, hl
    ld   a, [$FAF9]
    ld   sp, hl
    ld   a, [$FAF9]
    ld   sp, hl
    ld   a, [$FAF9]
    ld   sp, hl
    ld   a, [$FAF9]
    ld   sp, hl
    ld   a, [$FAF9]
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A1700::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A17C0::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    or   c
    or   d
    or   e
    sub  a, h
    dec  [hl]
    ld   d, $17
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  e
    ld   e, $B2
    cp   a
    ld   b, d
    ld   b, d
    ld   b, d
    ld   b, d
    or   c
    or   d
    or   e
    add  a, h
    dec  [hl]
    ld   d, $17
    jr   label_A1858
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $B2
    cp   a
    ld   b, d
    ld   b, d
    dec  c
    ld   b, d
    or   c
    or   d
    or   e
    add  a, h
    dec  [hl]
    ld   h, $27
    jr   z, label_A187C
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $B2
    cp   a
    ld   b, d
    ld   b, d
    ld   b, d
    ld   b, d
    or   c
    or   d
    or   e
    add  a, h
    dec  [hl]
    ld   [hl], $37
    jr   c, label_A18A0
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a
    dec  a
    ld   a, $B2
    cp   a
    ld   b, d
    ld   b, d
    ld   b, d
    ld   b, d
    or   c
    or   d
    or   e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d

label_A187C::
    ld   c, e
    ld   c, h
    ld   c, l
    ld   c, [hl]
    or   d
    cp   a
    dec  c
    ld   b, d
    ld   b, d
    ld   b, d
    or   c
    or   d
    or   e
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    or   d
    cp   a
    ld   b, d
    ld   b, d
    dec  c
    ld   b, d
    or   c
    or   d
    or   e
    ld   h, h
    ld   h, l
    ld   h, [hl]

label_A18A0::
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   e, $B2
    cp   a
    ld   b, d
    ld   b, d
    ld   b, d
    ld   b, d
    or   c
    or   d
    or   e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    dec  e
    ld   e, $B2
    cp   a
    ld   b, d
    ld   b, d
    ld   b, d
    ld   b, d
    or   c
    or   d
    or   e
    add  a, h
    dec  [hl]
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    dec  e
    ld   e, $B2
    cp   a
    ld   b, d
    ld   b, d
    ld   d, e
    ld   d, d
    or   c
    or   d
    or   e
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, h
    dec  e
    ld   e, $B2
    cp   a
    ld   d, d
    ld   d, e
    ld   h, e
    ld   h, d
    or   c
    or   d
    or   e
    sub  a, h
    dec  [hl]
    and  [hl]
    and  a
    xor  b
    xor  c
    xor  d
    xor  e
    xor  h
    dec  e
    ld   e, $B2
    cp   a
    ld   h, d
    ld   h, e
    ld   d, e
    ld   d, d
    or   c
    or   d
    or   e

label_A1901::
    sub  a, h
    dec  [hl]
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    sbc  a, h
    dec  e
    ld   e, $B2
    cp   a
    ld   d, d
    ld   d, e
    ld   h, e
    ld   h, d
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    add  a, b
    add  a, c
    add  a, d
    rst  0
    ret  z
    ret
    jp   z, label_9190
    sub  a, d
    sbc  a, l
    sbc  a, [hl]
    sbc  a, a
    ld   h, d
    ld   h, e
    and  b
    ret  nc
    pop  de
    jp   nc, label_D4D3
    push de
    sub  a, $D7
    ret  c
    reti
    jp  c, label_DCDB
    nop
    ld   bc, $D102
    and  b
    ret  nc
    and  c
    ld   [$FFE1], a
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$ECEB], a
    db   $E4 ; Undefined instruction
    ld   de, label_1312
    inc  d
    and  c
    and  c
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$C0
    pop  bc
    jp   nz, label_20C3
    ld   hl, label_2322
    jr   nc, label_A1901
    ld   a, [$FAFA]
    ld   a, [$FAFA]
    ld   a, [$FAFA]
    ld   a, [$FAFA]
    ld   a, [$FAFA]
    ld   a, [$FAFA]
    ld   a, [$FBFA]
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A1A4E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_A1A9F

label_A1A9F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    sbc  a, d
    sbc  a, e
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, h
    adc  a, l
    sbc  a, a
    sbc  a, a
    sbc  a, l
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    sbc  a, h
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, [hl]
    sbc  a, d
    sbc  a, e
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, h
    adc  a, l
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    sbc  a, h
    sbc  a, a
    sbc  a, a
    sbc  a, a
    inc  b
    dec  b
    ld   b, $07
    sbc  a, a
    sbc  a, a
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, h
    adc  a, l
    sbc  a, a
    ld   de, label_1312
    inc  d
    dec  d
    ld   d, $17
    sbc  a, a
    sbc  a, a
    adc  a, b
    sbc  a, d
    sbc  a, e
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    adc  a, c
    sbc  a, h
    sbc  a, a
    jr   nz, label_A1BA9
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, l
    adc  a, c
    adc  a, c
    adc  a, h
    sbc  a, b
    sbc  a, a
    sbc  a, a
    jr   nc, label_A1BCD
    ldd  [hl], a
    xor  c
    xor  d
    xor  e
    xor  d
    xor  e
    xor  d
    xor  e
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, [hl]
    sbc  a, d

label_A1BA9::
    sbc  a, e
    sbc  a, h
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   d
    cp   e
    cp   d
    cp   e
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, l
    add  a, [hl]
    add  a, l
    add  a, [hl]
    sbc  a, a

label_A1BCD::
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    sub  a, l
    sub  a, [hl]
    sub  a, l
    sub  a, [hl]
    sub  a, l
    sub  a, [hl]
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    and  b
    and  c
    and  d
    and  e
    and  h
    and  l
    and  [hl]
    and  l
    and  [hl]
    and  l
    and  [hl]
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    or   l
    or   [hl]
    or   l
    or   [hl]
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    sbc  a, a
    ld   bc, $C1C0
    jp   nz, label_C4C3
    push bc
    add  a, $49
    ld   c, d
    ld   c, e
    ld   c, h
    sbc  a, a
    db   $10 ; Undefined instruction
    nop
    sbc  a, a
    ld   bc, $9F9F
    ld   e, b
    ret  nc
    pop  de
    jp   nc, label_A0544
    ld   b, [hl]
    ld   b, a
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   h, b
    ld   bc, label_109F
    sbc  a, a
    sbc  a, a
    nop
    sbc  a, a
    ld   l, b
    ld   [$FFE1], a
    ld  [$FF00+C], a
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [bc]
    dec  bc
    inc  c
    ld   a, [bc]
    dec  bc
    inc  c
    ld   a, [bc]
    dec  bc
    inc  c
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_A1DF9
    ld   a, [hli]
    dec  hl
    ld   a, [bc]
    dec  bc
    dec  c
    ld   c, $0F
    dec  c
    ld   c, $0F
    dec  c
    ld   c, $2C
    dec  l
    ld   l, $2F
    jr   nc, label_A1E13
    ldd  [hl], a
    inc  sp
    inc  [hl]
    dec  [hl]
    dec  c
    ld   c, $10
    ld   de, label_1012
    ld   de, label_1012
    ld   d, a
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    ld   h, b

label_A1DF9::
    ld   h, c
    db   $10 ; Undefined instruction
    inc  de
    inc  d
    dec  d
    inc  de
    inc  d
    dec  d
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    inc  d
    dec  d
    inc  de
    inc  d
    ld   d, $17
    jr   label_A1E2A
    rla
    jr   label_A1E83
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    rla
    jr   label_A1E39
    rla
    add  hl, de
    ld   a, [de]
    dec  de
    add  hl, de
    ld   a, [de]
    dec  de

label_A1E2A::
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    ld   e, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    dec  de
    add  hl, de
    ld   a, [de]
    inc  e

label_A1E39::
    dec  e
    ld   e, $1C
    dec  e
    ld   e, $1C
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    ld   e, $1C
    dec  e
    rra
    jr   nz, label_A1E70
    rra
    jr   nz, label_A1E73
    rra
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    rra
    jr   nz, label_A1E61

label_A1E61::
    nop
    nop
    nop
    nop
    nop
    nop
    sub  a, l
    sub  a, [hl]
    sub  a, a
    sbc  a, b
    sbc  a, c
    sbc  a, d
    sbc  a, e
    sbc  a, h
    sbc  a, l

label_A1E70::
    sbc  a, [hl]
    sbc  a, a
    nop

label_A1E73::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], $A0
    and  c
    and  d
    and  e
    and  h
    and  l
    and  [hl]
    and  a
    xor  b

label_A1E83::
    xor  c
    xor  d
    xor  e
    nop
    nop
    scf
    jr   c, label_A1EC4
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a
    xor  h
    xor  l
    xor  [hl]
    xor  a
    or   b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    nop
    nop
    nop
    dec  a
    ld   a, $3F
    ld   b, b
    ld   b, c
    ld   b, d
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    cp   a
    ret  nz
    nop
    nop
    nop
    nop
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   c, b
    pop  bc
    jp   nz, label_C4C3
    push bc
    add  a, $C7
    ret  z
    ret
    nop
    nop
    nop
    nop
    nop

label_A1EC4::
    nop
    nop
    ld   c, c
    ld   c, d
    ld   c, e
    ld   c, h
    jp   z, label_CCCB
    call label_CFCE
    ret  nc
    pop  de
    jp   nc, label_0
    nop
    nop
    nop
    nop
    nop
    ld   c, l
    ld   c, [hl]
    ld   c, a
    ld   d, b
    db   $D3 ; Undefined instruction
    call nc, label_D6D5
    rst  $10
    ret  c
    reti
    jp  c, label_DCDB
    db   $DE
    sbc  a, $00
    nop
    nop
    nop
    nop
    ld   d, c
    ld   d, d
    ld   d, e
    rst  $18
    ld   [$FFE1], a
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    jp   [hl]
    nop
    nop
    nop
    nop
    nop
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    xor  $EF
    ld   a, [$FF01]
    nop
    ld   [bc], a
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    dec  b
    ld   b, $07
    ld   [label_906], sp
    nop

label_A1F21::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [bc], a
    and  d
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [bc], a
    and  e
    and  d
    ld   [de], a
    ld   [de], a
    ld   [de], a
    nop
    ld   bc, $C1C1
    and  d
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    nop
    pop  bc
    pop  bc
    pop  bc
    and  h
    ld   [de], a
    ld   [de], a
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    and  h
    ld   [bc], a
    and  e
    and  h
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [bc], a
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    and  c
    ld   [bc], a
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    inc  de
    pop  bc
    pop  bc
    pop  bc
    and  h
    ld   [de], a
    ld   [bc], a
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    inc  de
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    and  e
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    inc  de
    inc  de
    inc  de
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    inc  de
    db   $10 ; Undefined instruction
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    inc  de
    jr   nz, label_A2147
    ldi  [hl], a
    inc  hl
    inc  h
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    jr   nc, label_A216B
    ldd  [hl], a
    inc  sp
    inc  [hl]
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc

label_A2147::
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, h
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    ld   d, c
    ld   d, d
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc

label_A216B::
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $07
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    jr   label_A21A2
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $17
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    jr   z, label_A21C6
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $C1
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    pop  bc
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, b
    sub  a, c
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    or   b
    or   c
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a

label_A21C6::
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    or   b
    or   c
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    or   d
    or   e
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    or   b
    or   c
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    ld   [de], a
    or   d
    or   e
    ret  nc
    pop  de
    jp   nc, label_D0D3
    pop  de
    jp   nc, label_D0D3
    pop  de
    jp   nc, label_D0D3
    pop  de
    jp   nc, label_D0D3
    pop  de
    jp   nc, label_D3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_A2244
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_A2250
    jr   nz, label_A2232

label_A2232::
    nop
    nop
    jr   nz, label_A2256
    jr   nz, label_A2258
    jr   nz, label_A223A

label_A223A::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_A2263
    jr   nz, label_A2265
    jr   nz, label_A2247

label_A2247::
    nop
    jr   nz, label_A226A
    jr   nz, label_A226C
    jr   nz, label_A224E

label_A224E::
    jr   nz, label_A2270

label_A2250::
    jr   nz, label_A2252

label_A2252::
    nop
    nop
    jr   nz, label_A2276

label_A2256::
    jr   nz, label_A2278

label_A2258::
    jr   nz, label_A225A

label_A225A::
    jr   nz, label_A227C
    jr   nz, label_A227E
    jr   nz, label_A2280
    jr   nz, label_A2282
    jr   nz, label_A2284
    jr   nz, label_A2286
    nop
    jr   nz, label_A2289
    jr   nz, label_A228B
    jr   nz, label_A228D
    nop
    nop
    nop

label_A2270::
    jr   nz, label_A2292
    jr   nz, label_A2294
    jr   nz, label_A2296

label_A2276::
    jr   nz, label_A2278

label_A2278::
    nop
    nop
    jr   nz, label_A229C

label_A227C::
    jr   nz, label_A229E

label_A227E::
    jr   nz, label_A22A0

label_A2280::
    jr   nz, label_A22A2

label_A2282::
    jr   nz, label_A22A4

label_A2284::
    jr   nz, label_A22A6

label_A2286::
    jr   nz, label_A22A8
    jr   nz, label_A22AA
    jr   nz, label_A228C

label_A228C::
    nop

label_A228D::
    nop
    nop
    nop
    nop
    jr   nz, label_A22B3
    jr   nz, label_A22B5
    jr   nz, label_A22B7
    jr   nz, label_A22B9
    jr   nz, label_A22BB
    jr   nz, label_A22BD
    jr   nz, label_A22BF
    jr   nz, label_A22A1

label_A22A1::
    nop

label_A22A2::
    nop
    nop

label_A22A4::
    nop
    jr   nz, label_A22C7
    jr   nz, label_A22C9
    jr   nz, label_A22CB
    jr   nz, label_A22CD
    jr   nz, label_A22CF
    jr   nz, label_A22D1
    jr   nz, label_A22D3

label_A22B3::
    jr   nz, label_A22B5

label_A22B5::
    nop
    nop

label_A22B7::
    nop
    nop

label_A22B9::
    jr   nz, label_A22DB

label_A22BB::
    jr   nz, label_A22DD

label_A22BD::
    jr   nz, label_A22DF

label_A22BF::
    jr   nz, label_A22E1
    jr   nz, label_A22E3
    jr   nz, label_A22E5
    jr   nz, label_A22E7

label_A22C7::
    jr   nz, label_A22E9

label_A22C9::
    nop
    nop

label_A22CB::
    jr   nz, label_A22ED

label_A22CD::
    jr   nz, label_A22EF

label_A22CF::
    jr   nz, label_A22F1

label_A22D1::
    jr   nz, label_A22F3

label_A22D3::
    jr   nz, label_A22F5
    jr   nz, label_A22F7
    jr   nz, label_A22F9
    jr   nz, label_A22FB

label_A22DB::
    nop
    nop

label_A22DD::
    nop
    nop

label_A22DF::
    nop
    nop

label_A22E1::
    nop
    nop

label_A22E3::
    jr   nz, label_A2305

label_A22E5::
    jr   nz, label_A2307

label_A22E7::
    jr   nz, label_A2309

label_A22E9::
    jr   nz, label_A230B
    jr   nz, label_A230D

label_A22ED::
    jr   nz, label_A230F

label_A22EF::
    nop
    nop

label_A22F1::
    nop
    nop

label_A22F3::
    nop
    nop

label_A22F5::
    nop
    nop

label_A22F7::
    jr   nz, label_A2319

label_A22F9::
    jr   nz, label_A231B

label_A22FB::
    jr   nz, label_A231D
    jr   nz, label_A231F
    jr   nz, label_A2321
    jr   nz, label_A2323
    nop
    nop

label_A2305::
    nop
    nop

label_A2307::
    nop
    nop

label_A2309::
    nop
    jr   nz, label_A232C
    jr   nz, label_A232E
    jr   nz, label_A2330
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A2319::
    nop
    nop

label_A231B::
    nop
    nop

label_A231D::
    nop
    nop

label_A231F::
    nop
    nop

label_A2321::
    nop
    nop

label_A2323::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A232C::
    nop
    nop

label_A232E::
    nop
    nop

label_A2330::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_202
    inc  bc
    inc  b
    dec  b
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    dec  b
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    rlca
    ld   [label_A09], sp
    cp   $0B
    rlca
    cp   $09
    ld   a, [bc]
    cp   $0B
    inc  c
    dec  c
    inc  c
    dec  c
    inc  c
    dec  c
    inc  c
    dec  c
    ld   c, $FE
    cp   $FE
    rrca
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    cp   $08
    inc  d
    dec  d
    ld   d, $15
    ld   d, $15
    ld   d, $15
    ld   d, $17
    jr   label_A23BF
    add  hl, de
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $18
    jr   label_A23CF
    inc  c
    dec  c
    inc  c
    dec  c
    inc  c
    dec  c
    inc  c
    dec  c
    jr   nz, label_A23DB
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_A23EB
    cp   $0B
    ld   a, [hli]
    dec  hl
    inc  l
    ld   d, $15
    ld   d, $15
    ld   d, $2E
    cpl
    jr   nc, label_A2401
    ldd  [hl], a
    inc  sp
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    jr   c, label_A2411
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a

label_A23DB::
    ld   d, $0C
    dec  c
    inc  c
    dec  a
    dec  l
    ld   a, $3F
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a

label_A23EB::
    ld   c, b
    ld   c, c
    ld   c, d
    ld   c, e
    ld   c, h
    dec  d
    ld   d, $15
    ld   c, l
    ld   c, [hl]
    ld   c, a
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   e, b
    ld   e, c
    ld   e, d

label_A2401::
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d

label_A2411::
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    add  a, b
    rra
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    dec  bc
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
    inc  d
    and  a
    xor  b
    db   $FD ; Undefined instruction
    xor  c
    and  a
    xor  d
    xor  e
    xor  h
    xor  l
    xor  [hl]
    xor  a
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
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    cp   a
    ret  nz
    pop  bc
    jp   nz, label_C4C3
    push bc
    add  a, $C7
    ret  z
    ret
    jp   z, label_BDB9
    set  1, h
    call label_CBCE
    rst  8
    ret  nc
    pop  de
    jp   nc, label_D4D3
    push de
    sub  a, $D7
    ret  c
    reti
    jp  c, label_DCDB
    db   $DE
    sbc  a, $DF
    ld   [$FFE1], a
    sbc  a, $E2
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    sbc  a, $E5
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    xor  $EF
    ld   a, [$FFF1]
    xor  $EF
    ld   a, [$FFF1]
    xor  $EF
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$EF
    ld   a, [$FFF1]
    ld   sp, hl
    ld   a, [$FCFB]
    ld   sp, hl
    ld   a, [$FCFB]
    ld   sp, hl
    ld   a, [$FCFB]
    ld   sp, hl
    ld   a, [$FCFB]
    ld   sp, hl
    ld   a, [$FCFB]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra

label_A2631::
    inc  e
    inc  e
    inc  e
    jr   nz, label_A2657
    dec  e
    dec  e
    dec  e
    dec  e
    ldi  [hl], a
    inc  hl
    inc  e
    inc  e
    inc  h
    dec  h
    jp  c, label_25DB
    jp  c, label_1C26
    inc  e
    daa
    jr   z, label_A2667
    add  hl, hl
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $23
    inc  e
    cpl
    jr   nc, label_A2631
    db   $DE
    sbc  a, $DC
    ld   sp, label_321C
    inc  sp
    dec  e
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    jr   c, label_A269C
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  e
    inc  a

label_A2667::
    dec  a
    rst  $18
    ld   [$FFE1], a
    rst  $18
    ld   a, $3F
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d
    ld   c, e
    ld   c, h
    ld   c, l
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    push hl
    ld   c, [hl]
    ld   c, a
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   e, b
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   e, l
    ld   e, [hl]
    ld   e, a
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h

label_A269C::
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   [$ECEB], a
    ld   l, h
    ld   e, l
    ld   l, l
    ld   l, [hl]
    ld   l, a
    inc  e
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    ld   e, $1E
    db   $76 ; Halt
    ld   [hl], a
    ld   l, h
    db   $ED ; Undefined instruction
    xor  $1D
    ld   l, h
    ld   e, l
    ld   a, b
    ld   a, c
    dec  e
    ld   a, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    rst  $28
    ld   a, [$FF1D]
    ld   l, h
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    sub  a, b
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    sub  a, l
    pop  af
    ld   a, [$FF00+C]
    db   $F4 ; Undefined instruction
    sub  a, [hl]
    sub  a, a
    sub  a, [hl]
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
    push af
    nop
    ld   bc, $9602
    sub  a, a
    sub  a, [hl]
    sub  a, a
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    xor  d
    xor  e
    xor  h
    xor  l
    xor  [hl]
    xor  a
    or   b
    or   $F7
    ld    hl, sp+$F9
    or   c
    or   d
    ld   e, $1E
    or   e
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    ld   a, [$FCFB]
    db   $FD ; Undefined instruction
    cp   a
    ret  nz
    pop  bc
    jp   nz, label_C4C3
    nop
    inc  bc
    push bc
    add  a, $C7
    ret  z
    ret
    jp   z, label_201
    inc  b
    nop
    ld   bc, label_1E02
    ld   e, $B1
    or   d
    ld   e, $CB
    ld   b, $07
    call z, label_CECD
    rst  8
    ret  nc
    pop  de
    cp   $08
    dec  b
    ld   b, $FE
    ld   [$D3D2], sp
    cp   a
    ret  nz
    ld   e, $1E
    ld   e, $1E
    call nc, label_D6D5
    rst  $10
    ret  c
    reti
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    add  hl, bc
    ld   a, [bc]
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    db   $10 ; Undefined instruction
    ld   e, $1E
    ld   e, $1E
    ld   de, label_1E12
    ld   e, $1E
    ld   e, $13
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  e
    inc  d
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $11
    ld   [de], a
    ld   e, $1E
    dec  d
    ld   d, $17
    jr   label_A27A9
    add  hl, de
    ld   a, [de]
    dec  de
    ld   e, $1E
    ld   de, $0012
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A27A9::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    ld   [hl], c
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    adc  a, d
    inc  h
    ld   [hl], c
    adc  a, e
    adc  a, h
    adc  a, l
    inc  h
    inc  h
    inc  h
    dec  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    ld   b, $07
    inc  h
    inc  h
    ld   [hl], c
    adc  a, d
    inc  h
    inc  h
    sbc  a, e
    sbc  a, h
    sbc  a, l
    ld   c, $0F
    dec  l
    ld   l, $2F
    inc  h
    dec  bc
    inc  c
    inc  h
    ld   d, $17
    inc  h
    inc  h
    inc  h
    jr   z, label_A2961
    ld   a, [hli]
    xor  e
    xor  h
    xor  l
    ld   e, $1F
    dec  a
    ld   a, $3F
    inc  h
    dec  de
    inc  e
    inc  h
    ld   h, $27
    inc  h
    inc  h
    inc  h
    jr   c, label_A2985
    db   $3A ; ldd  a, [hl]
    xor  e
    xor  h
    xor  l
    ld   c, [hl]
    ld   c, a
    ld   l, l
    ld   l, [hl]
    ld   l, a
    inc  h
    dec  hl
    inc  l
    inc  h
    ld   [hl], $37
    inc  h
    inc  h
    inc  h
    ld   c, b
    ld   c, c
    ld   c, d

label_A2961::
    cp   e
    cp   h
    cp   l
    ld   e, [hl]
    ld   e, a
    ld   a, l
    ld   a, [hl]
    ld   a, a
    inc  h
    dec  sp
    inc  a
    inc  h
    ld   b, [hl]
    ld   b, a
    inc  h
    inc  h
    inc  h
    ld   e, b
    ld   e, c
    ld   e, d
    sbc  a, e
    sbc  a, h
    sbc  a, l
    inc  h
    inc  h
    ld   [hl], c
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    ld   d, [hl]
    ld   d, a
    inc  h
    inc  h

label_A2985::
    inc  h
    ld   l, b
    ld   l, c
    ld   l, d
    xor  e
    xor  h
    xor  l
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    ld   h, [hl]
    ld   h, a
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, d
    ld   a, c
    ld   a, d
    adc  a, e
    adc  a, h
    adc  a, l
    nop
    ld   bc, label_302
    ld   [hl], c
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
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
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    and  h
    and  l
    and  [hl]
    and  a
    xor  b
    xor  c
    xor  d
    xor  e
    xor  h
    xor  l
    jr   nz, label_A29EB
    ldi  [hl], a
    inc  hl
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    jr   nc, label_A2A0F
    ldd  [hl], a
    inc  sp
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    add  a, c
    add  a, b
    call nz, label_C6C5
    rst  0
    ret  z

label_A29EB::
    ret
    jp   z, label_CCCB
    call label_A0140
    ld   b, d
    ld   b, e
    ld   b, h
    sub  a, b
    sub  a, c
    sub  a, b
    sub  a, c
    sub  a, b
    call nc, label_D6D5
    rst  $10
    ret  c
    reti
    jp  c, label_DCDB
    db   $50
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    and  c
    and  d
    and  e
    db   $E4 ; Undefined instruction

label_A2A0F::
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    ld   a, [$FF00+C]
    di
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    or   c
    or   d
    or   e
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$F9
    ld   a, [$FCFB]
    db   $FD ; Undefined instruction
    ret  nc
    pop  de
    ret  nc
    pop  de
    ret  nc
    pop  de
    ret  nc
    pop  de
    jp   nz, label_B0C3
    pop  de
    ret  nc
    pop  de
    ret  nc
    pop  de
    ret  nc
    pop  de
    ret  nc
    pop  de
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    ld   a, [$FFF1]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A2B00::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  b
    nop
    nop
    nop
    add  hl, bc
    ld   a, [bc]
    nop
    nop
    nop
    ld   c, $0F
    nop
    nop
    ld   [bc], a
    nop
    db   $10 ; Undefined instruction
    ld   [de], a
    db   $10 ; Undefined instruction
    dec  d
    ld   d, $10
    db   $10 ; Undefined instruction
    ld   a, [de]
    db   $10 ; Undefined instruction
    dec  e
    ld   e, $10
    db   $10 ; Undefined instruction
    inc  b
    db   $10 ; Undefined instruction
    jr   nz, label_A2C1D
    inc  hl
    jr   nz, label_A2C1E
    ld   h, $20
    jr   z, label_A2C2B
    ld   a, [hli]
    dec  hl
    jr   nz, label_A2C33
    jr   nz, label_A2C28
    ld   b, $07
    jr   nz, label_A2C2C
    jr   nc, label_A2C3F
    ldd  [hl], a
    inc  sp
    ld   sp, label_3631
    scf
    jr   c, label_A2C4F
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a
    dec  a
    ld   sp, label_831

label_A2C1D::
    ld   sp, label_B31
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de

label_A2C28::
    ld   c, b
    ld   c, c
    ld   c, d

label_A2C2B::
    ld   c, e

label_A2C2C::
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de

label_A2C33::
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    ld   e, b
    ld   e, c
    ld   e, d

label_A2C3F::
    ld   e, e
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]

label_A2C4F::
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   b, b
    ld   b, c
    ld   b, d
    inc  de
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    add  a, b
    add  a, b
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
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
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
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
    xor  e
    xor  h
    xor  l
    xor  [hl]
    xor  a
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
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
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    cp   a
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    xor  l
    xor  [hl]
    jp   nz, label_C4C3
    push bc
    add  a, $C7
    ret  z
    ret
    jp   z, label_CCCB
    call label_CFCE
    ret  nc
    ld   [$FFF0], a
    add  a, b
    ld   [$C2D1], a
    db   $D3 ; Undefined instruction
    call nc, label_D6D5
    rst  $10
    ret  c
    reti
    jp  c, label_DCDB
    db   $DE
    sbc  a, $DF
    pop  hl
    pop  af
    cp   $80
    cp   [hl]
    cp   a
    jp   nc, label_E4E3
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    xor  $EF
    rst  $38
    ld   l, $80
    add  a, b
    add  a, c
    ld   [$F3EA], a
    db   $F4 ; Undefined instruction
    push af
    or   $F7
    ld    hl, sp+$F9
    ld   a, [$FCFB]
    db   $FD ; Undefined instruction
    cpl
    ld   [label_3F3E], a
    add  a, b
    add  a, b
    ld   [label_2FEA], a
    ld   [$F8EA], a
    ld   sp, hl
    ld   a, [$EAFC]
    ld   [$EAEA], a
    ld   [label_A1F21], a
    ccf
    add  a, b
    add  a, b
    add  a, b
    ld   [$F8EA], a
    ld   sp, hl
    ld   a, [$EAFC]
    ld   [$EAEA], a
    cpl
    ld   [$EA1F], a
    ld   a, [$FF80]
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    ld   bc, label_707
    rlca
    rlca
    rlca
    jr   nc, label_A2EE7
    rlca
    ld   bc, label_707
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    db   $10 ; Undefined instruction
    rlca
    rlca
    rlca
    rlca
    ld   b, b
    ld   b, c
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    ld   d, b
    ld   d, c
    rrca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca

label_A2EE7::
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    ld   h, b
    ld   h, c
    rra
    rlca
    rlca
    rlca
    rlca
    dec  b
    ld   b, $07
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    db   $10 ; Undefined instruction
    rlca
    rlca
    rlca
    rlca
    ld   [de], a
    inc  de
    inc  d
    dec  d
    ld   d, $17
    jr   label_A2F29
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $07
    rlca
    rlca
    ld   bc, label_707
    rlca
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_A2F4D
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $07
    rlca
    rlca
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    ldd  [hl], a
    inc  sp
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    jr   c, label_A2F71
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a
    dec  a
    ld   a, $3F
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   b, d
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d

label_A2F4D::
    ld   c, e
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]

label_A2F71::
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld   [hl], b
    ld   [hl], b
    ld   [hl], b
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   [hl], b
    ld   [hl], b
    ld   [hl], b
    pop  hl
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    db   $E4 ; Undefined instruction
    push hl
    and  $80
    add  a, b
    add  a, b
    add  a, b
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
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
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
    xor  e
    xor  h
    xor  l
    xor  [hl]
    xor  a
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    or   c
    or   d
    or   e
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    cp   a
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    jp   label_C5C4
    add  a, $C7
    ret  z
    ret
    jp   z, label_CCCB
    call label_CFCE
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    sub  a, [hl]
    sbc  a, d
    sub  a, l
    sub  a, [hl]
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    xor  b
    xor  c
    and  [hl]
    and  h
    and  l
    and  [hl]
    xor  c
    xor  d
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    reti
    reti
    reti
    jp   z, label_9BFC
    sbc  a, h
    cp   h
    cp   h
    cp   h
    cp   h
    cp   h
    cp   h
    xor  e
    xor  h
    db   $FC ; Undefined instruction
    ret  z
    reti
    reti
    reti
    cp   c
    cp   c
    cp   c
    jp  c, label_E0E0
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [$FFE0], a
    ld   [$FFE0], a
    ret  c
    cp   d
    cp   d
    cp   d
    cp   c
    cp   c
    cp   c
    ld   [$CECD], a
    call label_CDCE
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    adc  a, $E8
    cp   d
    cp   d
    cp   d
    cp   c
    cp   c
    cp   c
    ld   [$DCDB], a
    db   $DB
    call c, label_DCDB
    db   $DB
    call c, label_DCDB
    db   $DB
    call c, label_BAED
    cp   d
    cp   d
    cp   c
    cp   c
    cp   c
    ld   [$E2E2], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    db   $ED ; Undefined instruction
    cp   d
    cp   d
    cp   d
    cp   c
    cp   c
    cp   c
    ld   [$CCCB], a
    set  1, h
    set  1, h
    set  1, h
    set  1, h
    set  1, h
    db   $ED ; Undefined instruction
    cp   d
    cp   d
    cp   d
    cp   c
    cp   c
    cp   c
    ld   [$DCDB], a
    db   $DB
    call c, label_DCDB
    db   $DB
    call c, label_DCDB
    db   $DB
    call c, label_BAED
    cp   d
    cp   d
    sub  a, b
    sub  a, c
    cp   c
    rst  $10
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    pop  hl
    db   $ED ; Undefined instruction
    cp   d
    push bc
    add  a, $A0
    and  c
    cp   c
    rst  $10
    set  1, h
    bit  4, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    call z, label_CCCB
    db   $ED ; Undefined instruction
    cp   d
    push de
    sub  a, $B0
    or   c
    cp   c
    db   $EC ; Undefined instruction
    db   $DE
    sbc  a, $DD
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    sbc  a, $DD
    sbc  a, $ED
    cp   d
    push hl
    and  $F4
    xor  [hl]
    reti
    rst  $20
    pop  hl
    pop  hl
    pop  hl
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    add  a, l
    pop  hl
    pop  hl
    pop  hl
    ld    hl, sp+$D9
    di
    db   $F4 ; Undefined instruction
    cp   l
    cp   [hl]
    or   h
    or   e
    or   h
    or   e
    or   h
    ld   l, d
    ld   l, e
    ld   a, b
    ld   a, c
    ld   a, e
    ld   a, h
    jp   nz, label_C2C3
    jp   label_F5C2
    or   $B2
    or   e
    or   d
    or   e
    or   h
    ld   l, d
    ld   l, e
    ld   l, b
    ld   a, b
    or   a
    or   a
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    jp   nz, label_C2C3
    jp   label_B2C2
    or   e
    or   h
    ld   l, d
    ld   l, e
    ld   l, c
    ld   l, b
    ld   a, b
    or   a
    or   a
    or   a
    or   a
    ld   a, c
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    jp   nz, label_C2C3
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  b
    ld   b, $07
    ld   [label_A09], sp
    dec  bc
    inc  c
    dec  c
    ld   c, $0F
    ret  nz
    pop  bc
    jp   nz, label_10C2
    ld   de, label_1312
    inc  d
    dec  d
    ld   d, $17
    jr   label_A3477
    ld   a, [de]
    dec  de
    inc  e
    dec  e
    ld   e, $1F
    ret  nc
    pop  de
    jp   nc, label_20D2
    ld   hl, label_2322
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_A349B
    ld   a, [hli]
    dec  hl
    inc  l
    dec  l
    ld   l, $2F
    ld   [$FFE1], a
    ld  [$FF00+C], a
    ld  [$FF00+C], a
    jr   nc, label_A34AF
    ldd  [hl], a
    inc  sp
    inc  [hl]
    dec  [hl]
    ld   [hl], $37
    jr   c, label_A34BF
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  a
    dec  a
    ld   a, $3F
    ld   a, [$FFF1]
    ld   a, [$FF00+C]
    ld   b, b
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, h
    ld   b, l
    ld   b, [hl]
    ld   b, a
    ld   c, b
    ld   c, c
    ld   c, d

label_A349B::
    ld   c, e
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    jp   label_C5C4
    push bc
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   e, b
    ld   e, c
    ld   e, d

label_A34AF::
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    db   $D3 ; Undefined instruction
    call nc, label_D5D5
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]

label_A34BF::
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    push hl
    push hl
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    and  d
    and  e
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    di
    db   $F4 ; Undefined instruction
    push af
    push af
    and  b
    and  c
    cp   a
    cp   a
    or   d
    or   e
    add  a, [hl]
    add  a, a
    adc  a, b
    adc  a, c
    adc  a, d
    adc  a, e
    adc  a, h
    adc  a, l
    adc  a, [hl]
    adc  a, a
    add  a, $C7
    ret  z
    ret
    or   b
    or   c
    cp   a
    cp   a
    cp   a
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
    sub  a, $D7
    ret  c
    reti
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
    xor  e
    xor  h
    xor  l
    xor  [hl]
    xor  a
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
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
    cp   d
    cp   e
    cp   h
    cp   l
    cp   [hl]
    cp   a
    or   $F7
    ld    hl, sp+$F9
    add  a, b
    add  a, c
    or   $F6
    or   $F6
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    set  1, h
    call label_F6F6
    or   $F6
    and  h
    and  h
    inc  de
    sub  a, c
    sub  a, b
    or   $F6
    and  d
    and  e
    or   $F6
    or   $F6
    or   $F6
    or   $F6
    or   $F6
    or   $B4
    or   $13
    inc  de
    add  a, d
    or   $F6
    or   d
    or   e
    or   $F6
    or   $F6
    or   $A0
    and  c
    or   $F6
    or   $F6
    or   $F6
    inc  de
    inc  de
    sub  a, d
    add  a, b
    add  a, c
    or   $F6
    or   $A0
    and  c
    or   $F6
    or   b
    or   c
    or   $A2
    and  e
    or   $A0
    and  c
    inc  de
    inc  de
    inc  de
    inc  de
    sub  a, c
    sub  a, b
    cp   [hl]
    or   $B0
    or   c
    or   $F6
    or   $F6
    or   $B2
    or   e
    or   $B0
    or   c
    inc  de
    inc  de
    inc  de
    inc  de
    inc  de
    add  a, b
    add  a, c
    or   $B4
    or   $F6
    and  b
    and  c
    or   $F6
    or   $F6
    or   $F6
    or   $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    inc  bc
    nop
    nop
    nop
    rlca
    ld   [label_A0D4D], sp
    ld   c, l
    ld   c, l
    dec  c
    ld   c, $00
    inc  b
    dec  b
    ld   b, $07
    nop
    ld   de, label_1312
    nop
    nop
    nop
    nop
    jr   label_A377B
    ld   c, l
    ld   c, l
    inc  e
    dec  e
    ld   e, $1F
    inc  d
    dec  d
    ld   d, $17
    jr   nz, label_A375B
    ldi  [hl], a
    inc  hl
    inc  h
    dec  h
    ld   h, $27
    jr   z, label_A376B
    ld   a, [hli]
    ld   c, l
    inc  l
    dec  l
    ld   l, $00
    add  hl, bc
    nop
    nop
    nop
    ld   c, l
    ld   sp, label_3332
    inc  [hl]
    ld   c, l
    ld   c, l
    ld   c, l
    jr   c, label_A378F
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, l
    dec  a
    ld   a, $3F
    add  hl, de
    ld   a, [de]
    nop
    nop
    ld   c, l
    ld   b, c
    ld   b, d
    ld   b, e
    ld   b, h
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, b
    ld   c, c
    ld   c, d

label_A376B::
    ld   c, e
    ld   c, l
    ld   c, l
    ld   c, [hl]
    ld   c, a
    dec  [hl]
    ld   [hl], $37
    nop
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, h
    ld   d, l
    ld   d, [hl]

label_A377B::
    ld   d, a
    ld   e, b
    ld   e, c
    ld   e, d
    ld   e, e
    ld   e, h
    ld   e, l
    ld   e, [hl]
    ld   e, a
    ld   b, l
    ld   b, [hl]
    ld   b, a
    nop
    ld   h, b
    ld   h, c
    ld   h, d
    ld   h, e
    ld   h, h
    ld   h, l
    ld   h, [hl]

label_A378F::
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    nop
    add  a, l
    add  a, [hl]
    add  a, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   [hl], l
    db   $76 ; Halt
    ld   [hl], a
    ld   a, b
    ld   a, c
    ld   a, d
    ld   a, e
    ld   a, h
    ld   a, l
    ld   a, [hl]
    ld   a, a
    nop
    sub  a, l
    sub  a, [hl]
    sub  a, a
    add  a, b
    add  a, c
    add  a, d
    add  a, e
    add  a, h
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    adc  a, [hl]
    adc  a, a
    adc  a, l
    nop
    call label_90DC
    sub  a, c
    sub  a, d
    sub  a, e
    sub  a, h
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    sbc  a, [hl]
    sbc  a, a
    sbc  a, l
    adc  a, h
    db   $EC
    db   $EC ; Undefined instruction
    and  b
    and  c
    and  d
    and  e
    and  h
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    xor  [hl]
    xor  a
    xor  l
    sbc  a, h
    db   $ED ; Undefined instruction
    db   $FC ; Undefined instruction
    or   b
    or   c
    or   d
    or   e
    or   h
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    cp   l
    cp   [hl]
    cp   a
    ld   c, l
    xor  h
    db   $FD ; Undefined instruction
    jp  c, label_C1C0
    jp   nz, label_C4C3
    ld   c, l
    ld   bc, label_104D
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    adc  a, $CF
    adc  a, e
    ld   c, l
    db   $DB
    ld   [$D1D0], a
    jp   nc, label_D4D3
    ret  c
    and  a
    xor  b
    xor  c
    xor  d
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    sbc  a, $DF
    sbc  a, e
    ld   c, l
    db   $EB ; Undefined instruction
    ld   a, [$E1E0]
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    ld   c, l
    sbc  a, d
    ld   c, l
    ld   c, l
    xor  $EF
    xor  e
    ld   c, l
    ei
    ld   a, [$F1F0]
    ld   a, [$FF00+C]
    ld   c, l
    di
    db   $F4 ; Undefined instruction
    set  1, e
    push af
    and  l
    and  [hl]
    ld   a, [bc]
    dec  bc
    ld   c, l
    rst  $38
    adc  a, d
    ld   c, l
    rst  0
    cp   $F1
    ld   a, [$FF00+C]
    ld   c, l
    ld   c, l
    or   $F7
    set  1, e
    ld    hl, sp+$D9
    adc  a, b
    adc  a, c
    ld   c, l
    ld   c, l
    ld   c, l
    rst  $38
    dec  hl
    rst  0
    ret  z
    ld   a, [$FF00+C]
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   sp, hl
    sra  a
    rrca
    sbc  a, b
    sbc  a, c
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    inc  a
    ld   c, h
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A39E0::
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   de, label_A3F7F
    ld   a, a
    ld   de, $0100
    ld   de, label_A3F7F
    ld   a, a
    ld   de, label_A3F7F
    ld   a, a
    ld   a, a
    db   $10 ; Undefined instruction
    ld   a, [hl]
    ret
    ld   a, [hl]
    ld   a, [hl]
    ret
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    db   $10 ; Undefined instruction
    ld   a, [hl]
    ret  nc
    pop  de
    jp   nc, label_D4D3
    push de
    sub  a, $D7
    ret  c
    reti
    jp  c, label_DCDB
    db   $DE
    sbc  a, $DF
    ld   a, [hl]
    ld   a, a
    ld   a, a
    ld   a, [hl]
    ld   a, [hl]
    ret
    ld   a, [hl]
    ld   a, [hl]
    ret
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ret
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, a
    ld   a, a
    ld   a, [hl]
    ld   [$FFE1], a
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    db   $E4 ; Undefined instruction
    push hl
    and  $E7
    db   $E8 ; add  sp, d
    jp   [hl]
    ld   [$ECEB], a
    db   $ED ; Undefined instruction
    xor  $EF
    ld   a, [hl]
    ld   a, a
    db   $10 ; Undefined instruction
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    ld   a, [hl]
    db   $10 ; Undefined instruction
    or   c
    ld   a, a
    ld   a, a
    ld   de, label_A3FB2
    ld   a, a
    ld   de, $0100
    ld   de, label_A3FB7
    ld   a, a
    ld   de, label_A3FB8
    ld   a, a
    ld   a, a
    ld   a, a
    ld   [bc], a
    inc  bc
    inc  b
    ld   de, label_605
    rlca
    ld   de, label_908
    ld   de, label_605
    rlca
    ld   de, label_605
    rlca
    ld   a, a
    ld   a, a
    ld   a, [bc]
    dec  bc
    inc  c
    ld   de, label_E0D
    rrca
    ld   de, $0100
    ld   de, label_E0D
    rrca
    ld   de, label_E0D
    rrca
    ld   a, a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [de], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    ld   bc, label_1012
    db   $10 ; Undefined instruction
    ld   [de], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   a, a
    or   e
    ld   a, a
    ld   a, a
    ld   de, label_A3FB4
    ld   a, a
    ld   de, label_908
    ld   de, label_A3FB9
    ld   a, a
    ld   de, $B0B1
    ld   a, a
    ld   a, a
    ld   a, a
    dec  b
    ld   b, $07
    ld   de, label_605
    rlca
    ld   de, $0100
    ld   de, label_605
    rlca
    ld   de, label_605
    rlca
    ld   a, a
    ld   a, a
    dec  c
    ld   c, $0F
    ld   de, label_E0D
    rrca
    ld   de, $0100
    ld   de, label_E0D
    rrca
    ld   de, label_E0D
    rrca
    ld   a, a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [de], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_1209], sp
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   a, a
    or   l
    ld   a, a
    ld   a, a
    ld   de, label_A3FB6
    ld   a, a
    ld   de, $0100
    ld   de, $B1B1
    ld   a, a
    ld   de, $B2B1
    ld   a, a
    ld   a, a
    ld   a, a
    dec  b
    ld   b, $07
    ld   de, label_605
    rlca
    ld   de, $0100
    ld   de, label_605
    rlca
    ld   de, label_605
    rlca
    ld   a, a
    ld   a, a
    dec  c
    ld   c, $0F
    ld   de, label_E0D
    rrca
    ld   de, label_908
    ld   de, label_E0D
    rrca
    ld   de, label_E0D
    rrca
    ld   a, a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [de], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    ld   bc, label_1012
    db   $10 ; Undefined instruction
    ld   [de], a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    ld   bc, $0001
    inc  bc
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    ld   bc, $0001
    inc  bc
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
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
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0001
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
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    ld   bc, $0001
    inc  bc
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    ld   bc, $0001
    inc  bc
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
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
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0001
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
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    ld   bc, $0001
    inc  bc
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
    inc  bc
    nop
    ld   bc, $0001
    inc  bc
    inc  bc
    inc  bc
    nop
    inc  bc
    inc  bc
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
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A3CB0::
    rst  $38
    ld   d, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   d, a
    ld   sp, $C552
    jr   z, label_A3CBF

label_A3CBF::
    nop
    rst  $38
    ld   d, a
    rst  8
    add  hl, sp
    adc  a, b
    jr   label_A3CC7

label_A3CC7::
    nop
    rst  $38
    ld   d, a
    cp   e
    ld   [de], a
    adc  a, $10
    nop
    nop
    rst  $38
    ld   d, a
    db   $EB ; Undefined instruction
    ld   a, h
    and  h
    inc  a
    nop
    nop
    rst  $38
    ld   d, a
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   d, a
    ld   a, a
    inc  l
    ld   c, $14
    nop
    nop
    db   $EB ; Undefined instruction
    ld   a, h
    nop
    nop
    nop
    nop
    nop
    nop
    db   $EB ; Undefined instruction
    ld   a, h
    nop
    nop
    and  d
    ldi  [hl], a
    rst  $38
    ld   a, a
    nop
    ld   a, h
    nop
    nop
    ld   sp, rHDMA2
    ld   a, a
    rst  $38
    ld   a, a
    nop
    nop
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    nop
    ld   a, h
    nop
    nop
    rra
    nop
    rst  $38
    ld   a, a
    nop
    ld   a, h
    nop
    nop
    rra
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A3F7F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_A3FB2::
    nop
    nop

label_A3FB4::
    nop
    nop

label_A3FB6::
    nop

label_A3FB7::
    nop

label_A3FB8::
    nop

label_A3FB9::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
