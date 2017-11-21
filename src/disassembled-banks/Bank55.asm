section "bank55",romx,bank[$37]
    ld   a, [$DB95]
    sub  a, $0E
    rst  0
    jr   nz, label_DC048
    jr   nz, label_DC04A
    ldd  [hl], a
    ld   b, b
    nop
    nop
    ld   b, [hl]
    ld   b, b
    ld   e, d
    ld   b, b
    ld   l, [hl]
    ld   b, b
    nop
    nop
    add  a, b
    ld   b, b
    sub  a, h
    ld   b, b
    and  [hl]
    ld   b, b
    cp   d
    ld   b, b
    adc  a, $40
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b

label_DC026::
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    cpl
    ld   b, [hl]
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b
    ld   a, a
    ld   b, c
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    ld   e, c
    ld   b, [hl]
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0

label_DC04A::
    db   $EC ; Undefined instruction
    ld   b, b
    ld   a, a
    ld   b, c
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    add  a, c
    ld   b, a
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b
    ld   a, a
    ld   b, c
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    db   $E8 ; add  sp, d
    ld   c, d
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    dec  b
    ld   c, e
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b
    ld   a, a
    ld   b, c
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    ld   e, e
    ld   c, a
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    sbc  a, e
    ld   c, a
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b
    ld   a, a
    ld   b, c
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    or   a
    ld   c, a
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b
    ld   a, a
    ld   b, c
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    db   $F4 ; Undefined instruction
    ld   d, c
    sub  a, e
    ld   d, e
    ld   a, [$DB96]
    rst  0
    db   $EC ; Undefined instruction
    ld   b, b
    add  a, l
    ld   b, c
    add  hl, hl
    ld   b, d
    ld   [bc], a
    dec  bc
    cp   $42
    ld   e, [hl]
    ld   d, e
    sub  a, e
    ld   d, e

label_DC0E0::
    and  d
    ldi  [hl], a
    rst  $38
    ld   b, [hl]
    ccf
    inc  d
    rst  $38
    ld   b, [hl]
    inc  bc
    ld   a, [hl]
    rst  $38
    ld   b, [hl]
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_DC108
    ld   hl, $FFA9
    dec  [hl]
    ld   a, [hl]
    bit  7, a
    jr   z, label_DC0FC
    xor  a

label_DC0FC::
    ld   [hl], a
    ld   a, [$FFAA]
    sub  a, $10
    bit  7, a
    jr   z, label_DC106
    xor  a

label_DC106::
    ld   [$FFAA], a

label_DC108::
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, $90
    ld   [$DB9A], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_DC174
    ld   hl, label_DD70D
    ld   a, [$DB95]
    sub  a, $0E
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $DC10
    ld   bc, $0080
    ld   a, $02
    ld   [rSVBK], a
    call label_2914
    xor  a
    ld   [rSVBK], a
    ld   a, [$DC0F]
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_DC0E0
    add  hl, de
    push hl
    ld   de, $DC54
    ld   a, $02
    ld   [rSVBK], a

label_DC152::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, e
    and  $07
    jr   nz, label_DC152
    xor  a
    ld   [rSVBK], a
    pop  hl
    ld   a, [$DB95]
    cp   $10
    jr   nz, label_DC174
    ld   de, $DC34
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hl]
    ld   [de], a
    xor  a
    ld   [rSVBK], a

label_DC174::
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$C124], a
    jp   label_DD3FE
    call label_27F2
    jp   label_DD3FE
    call label_29C6
    jp   label_DD3FE

label_DC18B::
    ld   h, $37
    ld   de, $0008

label_DC190::
    push af

label_DC191::
    pop  af
    push af
    push bc
    push de
    push hl
    call label_A13
    pop  hl
    pop  de
    pop  bc
    pop  af
    push af
    inc  b
    inc  c
    dec  de
    ld   a, e
    and  a
    jr   nz, label_DC191
    pop  af
    ret

label_DC1A7::
    nop
    nop
    nop
    nop
    ld   h, b
    dec  sp
    nop
    nop
    ld   b, b
    add  hl, sp
    nop
    nop
    ld   [hl], b
    add  hl, sp
    nop
    nop
    nop
    nop
    ld   b, b
    dec  hl
    ld   h, b
    add  hl, sp
    ld   l, b
    db   $3A ; ldd  a, [hl]
    nop
    nop

label_DC1C1::
    ld   [hl], b
    dec  sp
    ld   b, b
    add  hl, hl
    ld   l, b
    dec  sp
    nop
    nop
    ld   c, b
    add  hl, sp
    ld   b, b
    ld   a, [hli]
    ld   a, b
    add  hl, sp
    nop
    nop
    ld   [hl], b
    ld   a, [hli]
    ld   b, b
    dec  hl
    ld   l, b
    add  hl, sp
    ld   h, b
    db   $3A ; ldd  a, [hl]
    ld   [hl], b
    dec  hl

label_DC1DB::
    nop
    nop
    nop
    nop
    ld   d, b
    db   $3A ; ldd  a, [hl]
    nop
    nop
    ld   b, b
    db   $3A ; ldd  a, [hl]
    nop
    nop
    ld   [hl], b
    db   $3A ; ldd  a, [hl]
    nop
    nop
    nop
    nop
    ld   b, b
    dec  hl
    ld   d, b
    dec  sp
    ld   c, b
    dec  sp
    nop
    nop

label_DC1F5::
    ld   [hl], b
    dec  sp
    ld   b, b
    add  hl, hl
    ld   e, b
    db   $3A ; ldd  a, [hl]
    nop
    nop
    ld   c, b
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   a, [hli]
    ld   a, b
    db   $3A ; ldd  a, [hl]
    nop
    nop
    ld   [hl], b
    ld   a, [hli]
    ld   b, b
    dec  hl
    ld   e, b
    dec  sp
    ld   b, b
    dec  sp
    ld   [hl], b
    dec  hl

label_DC20F::
    nop
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

label_DC21C::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$0000], sp
    call label_28CF
    ld   c, $00
    ld   a, [$DB95]
    sub  a, $0E
    sla  a
    ld   e, a
    ld   d, $00
    push de
    push de
    ld   hl, label_DC1A7
    ld   a, [$FFFE]
    and  a
    jr   z, label_DC245
    ld   hl, label_DC1DB

label_DC245::
    add  hl, de
    ld   b, [hl]
    inc  hl
    ld   a, [hl]
    and  a
    jr   z, label_DC24F
    call label_DC18B

label_DC24F::
    pop  de
    ld   c, $10
    ld   hl, label_DC1C1
    ld   a, [$FFFE]
    and  a
    jr   z, label_DC25D
    ld   hl, label_DC1F5

label_DC25D::
    add  hl, de
    ld   b, [hl]
    inc  hl
    ld   a, [hl]
    and  a
    jr   z, label_DC267
    call label_DC18B

label_DC267::
    pop  de
    ld   a, [$DB95]
    cp   $19
    jr   nz, label_DC288
    ld   a, [$FFFE]
    and  a
    jr   nz, label_DC27A
    ld   a, $3A
    ld   b, $68
    jr   label_DC27E

label_DC27A::
    ld   a, $3B
    ld   b, $48

label_DC27E::
    ld   c, $08
    ld   h, $37
    ld   de, $0004
    call label_DC190

label_DC288::
    ld   a, [$DB95]
    sub  a, $0E
    ld   e, a
    ld   d, $00
    ld   hl, label_DC20F
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_DC2AB
    ld   hl, label_DC21C
    add  hl, de
    ld   c, [hl]
    ld   h, $37
    ld   a, $38
    ld   b, $40
    ld   de, $0002
    call label_DC190
    jr   label_DC2F4

label_DC2AB::
    ld   c, $08
    ld   de, $0008
    ld   a, [$DB95]
    cp   $17
    jr   nz, label_DC2BD
    ld   a, $2B
    ld   b, $48
    jr   label_DC2ED

label_DC2BD::
    cp   $16
    jr   nz, label_DC2C7
    ld   a, $2A
    ld   b, $78
    jr   label_DC2ED

label_DC2C7::
    cp   $13
    jr   nz, label_DC2D1
    ld   a, $2A
    ld   b, $48
    jr   label_DC2ED

label_DC2D1::
    cp   $1A
    jr   nz, label_DC2DB
    ld   a, $2B
    ld   b, $78
    jr   label_DC2ED

label_DC2DB::
    cp   $0F
    jr   nz, label_DC2E5
    ld   a, $29
    ld   b, $48
    jr   label_DC2ED

label_DC2E5::
    cp   $0E
    jr   nz, label_DC2F4
    ld   a, $3B
    ld   b, $78

label_DC2ED::
    ld   h, $37
    call label_DC190
    jr   label_DC2F4

label_DC2F4::
    ld   a, $C7
    ld   [$D6FD], a
    ld   [rLCDC], a
    jp   label_DD3FE
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_DC31B
    ld   a, [$FFA9]
    inc  a
    cp   $07
    jr   c, label_DC30D
    ld   a, $07

label_DC30D::
    ld   [$FFA9], a
    ld   a, [$FFAA]
    add  a, $10
    cp   $70
    jr   c, label_DC319
    ld   a, $70

label_DC319::
    ld   [$FFAA], a

label_DC31B::
    xor  a
    ld   [$C200], a
    call label_DC351
    call label_DC331
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    ret  nz
    jp   label_DD3FE

label_DC331::
    ld   a, [$DB95]
    sub  a, $0E
    rst  0
    jr   nc, label_DC384
    jr   nc, label_DC386
    and  h
    ld   b, [hl]
    nop
    nop
    jp   label_3047
    ld   c, e
    ld   e, $4B
    nop
    nop
    ld   l, a
    ld   c, a
    or   [hl]
    ld   c, a
    ret  nc
    ld   c, a
    ld   l, $53
    jr   nc, label_DC39C

label_DC351::
    ld   a, [$DB95]
    sub  a, $0E
    rst  0
    ld   b, b
    ld   b, h
    ld   b, b
    ld   b, h
    ld   [hl], c
    ld   b, e
    nop
    nop
    and  [hl]
    ld   b, e
    ld   b, b
    ld   b, h
    ld   a, [bc]
    ld   b, h
    nop
    nop
    ld   b, b
    ld   b, h
    ld   b, b
    ld   b, h
    ld   b, c
    ld   b, h
    ld   l, h
    ld   b, h
    ld   b, b
    ld   b, h
    ld   a, $68
    ld   [$C202], a
    ld   a, $38
    ld   [$C203], a
    ld   [$FF99], a
    ld   a, $58
    ld   [$C208], a
    ld   a, $40

label_DC384::
    ld   [$C209], a
    ld   hl, $C22D
    ld   [hl], $10
    ld   hl, $C240
    ld   bc, $92C0
    ld   [hl], c
    inc  hl
    ld   [hl], b
    ld   hl, $C238
    ld   [hl], $70
    inc  hl
    ld   a, [$FFFE]
    and  a
    jr   nz, label_DC3A3
    ld   [hl], $75
    ret

label_DC3A3::
    ld   [hl], $71
    ret
    call label_DCA8E
    ld   a, $E0
    ld   [$C202], a
    ld   a, $68
    ld   [$C203], a
    ld   a, $58
    ld   [$C206], a
    ld   a, $C8
    ld   [$C208], a
    ld   a, $B0
    ld   [$C211], a
    ld   hl, $C22A
    ld   [hl], $40
    inc  hl
    ld   [hl], $30
    inc  hl
    ld   [hl], $20
    ld   hl, $C23A
    ld   bc, $9000
    ld   [hl], c
    inc  hl
    ld   [hl], b
    inc  hl
    ld   bc, $9500
    ld   [hl], c
    inc  hl
    ld   [hl], b
    inc  hl
    ld   bc, $9530
    ld   [hl], c
    inc  hl
    ld   [hl], b
    ld   hl, $C232
    ld   a, [$FFFE]
    and  a
    jr   nz, label_DC3FB
    xor  a
    ldi  [hl], a
    ld   [hl], $74
    inc  hl
    ldi  [hl], a
    ld   [hl], $75
    inc  hl
    ld   [hl], $30
    inc  hl
    ld   [hl], $75
    ret

label_DC3FB::
    xor  a
    ldi  [hl], a
    ld   [hl], $70
    inc  hl
    ldi  [hl], a
    ld   [hl], $71
    inc  hl
    ld   [hl], $30
    inc  hl
    ld   [hl], $71
    ret
    ld   a, $80
    ld   [$C202], a
    ld   a, $58
    ld   [$C203], a
    ld   a, $66
    ld   [$C223], a
    ld   e, $10
    ld   hl, $C251

label_DC41E::
    ldi  [hl], a
    dec  e
    jr   nz, label_DC41E
    ld   a, $70
    ld   [$C222], a
    ld   e, $10
    ld   hl, $C261

label_DC42C::
    ldi  [hl], a
    dec  e
    jr   nz, label_DC42C
    xor  a
    ld   [$C221], a
    ld   a, $20
    ld   [$C213], a
    call label_DCB31
    call label_DCF37
    ret
    ret
    ld   a, $D6
    ld   [$C202], a
    ld   a, $8A
    ld   [$C203], a
    ld   [$FF99], a
    ld   a, $20
    ld   [$C206], a
    ld   a, $88
    ld   [$C216], a
    ld   a, $B6
    ld   [$C217], a
    ld   a, $88
    ld   [$C218], a
    ld   a, $5A
    ld   [$C21C], a
    ld   a, $77
    ld   [$C21D], a
    ret
    ld   a, $4C
    ld   [$C202], a
    ld   a, $5A
    ld   [$C203], a
    ld   [$FF99], a
    ld   a, $B0
    ld   [$C250], a
    ld   a, $66
    ld   [$C24F], a
    ret
    nop
    ld   [hl], b
    ld   b, b
    ld   [hl], b
    add  a, b
    ld   [hl], b
    nop
    ld   [hl], b
    ld   b, b
    ld   [hl], b
    add  a, b
    ld   [hl], b
    nop
    ld   [hl], b
    ld   b, b
    ld   [hl], b
    add  a, b
    ld   [hl], b
    nop
    ld   [hl], b
    ld   b, b
    ld   [hl], b
    add  a, b
    ld   [hl], b
    nop
    ld   [hl], c
    nop
    ld   [hl], d
    nop
    ld   [hl], e
    nop
    ld   [hl], c
    nop
    ld   [hl], d
    nop
    ld   [hl], e
    nop
    ld   [hl], c
    nop
    ld   [hl], d
    nop
    ld   [hl], e
    nop
    ld   [hl], c
    nop
    ld   [hl], d
    nop
    ld   [hl], e
    jr   nc, label_DC526
    jr   nc, label_DC529
    jr   nc, label_DC52C
    jr   nc, label_DC52C
    jr   nc, label_DC52F
    jr   nc, label_DC532
    jr   nc, label_DC532
    jr   nc, label_DC535
    jr   nc, label_DC538
    jr   nc, label_DC538
    jr   nc, label_DC53B
    jr   nc, label_DC53E
    ld   [hl], b
    ld   [hl], c
    add  a, b
    ld   [hl], c
    sub  a, b
    ld   [hl], c
    and  b
    ld   [hl], c
    ld   [hl], b
    ld   [hl], c
    add  a, b
    ld   [hl], c
    sub  a, b
    ld   [hl], c
    and  b
    ld   [hl], c
    ld   [hl], b
    ld   [hl], c
    add  a, b
    ld   [hl], c
    sub  a, b
    ld   [hl], c
    and  b
    ld   [hl], c

label_DC4E3::
    add  a, e
    ld   b, h
    sbc  a, e
    ld   b, h
    or   e
    ld   b, h
    bit  0, h

label_DC4EB::
    jr   nz, label_DC505
    db   $10 ; Undefined instruction

label_DC4EF::
    ld   bc, $0000

label_DC4F2::
    ld   hl, $C242
    add  hl, bc
    ld   e, l
    ld   d, h
    xor  a
    ld   [de], a
    ld   hl, label_DC4EB
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C246
    add  hl, bc
    inc  [hl]
    cp   [hl]

label_DC505::
    jr   nc, label_DC543
    ld   a, [de]
    and  a
    jr   nz, label_DC543
    ld   a, $39
    ld   [de], a
    xor  a
    ld   [hl], a
    ld   hl, $C24A
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $0C
    jr   nz, label_DC51C
    xor  a
    ld   [hl], a

label_DC51C::
    sla  a
    ld   e, a
    ld   d, $00
    push bc
    sla  c
    ld   hl, label_DC4E3
    add  hl, bc
    ld   a, [hli]

label_DC529::
    ld   h, [hl]
    ld   l, a
    add  hl, de

label_DC52C::
    push hl
    ld   hl, $C232
    add  hl, bc
    push hl

label_DC532::
    pop  de
    pop  hl
    pop  bc

label_DC535::
    ld   a, [hli]
    ld   [de], a
    inc  de

label_DC538::
    ld   a, [hl]
    ld   [de], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_DC543
    ld   a, [de]
    add  a, $04
    ld   [de], a

label_DC543::
    inc  bc
    ld   a, c
    and  $03
    jr   nz, label_DC4F2
    ret

label_DC54A::
    ld   a, a
    ld   e, e
    inc  d
    ld   l, $4E
    add  hl, de
    xor  c
    ld   [label_14FA], sp
    jp   nz, label_C8A7
    cp   $01
    jr   nz, label_DC58A
    inc  a
    ld   [$C214], a
    ld   a, $40
    ld   [$FFF4], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_DC570
    ld   hl, $DB97
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    ld   [hl], a
    ret

label_DC570::
    ld   hl, rSVBK
    ld   de, $DC10

label_DC576::
    ld   a, [de]
    ld   [hl], $03
    ld   [de], a
    xor  a
    ld   [hl], a
    dec  a
    ld   [de], a
    inc  de
    ld   a, e
    cp   $90
    jr   nz, label_DC576
    ld   a, $01
    ld   [$DDD1], a
    ret

label_DC58A::
    cp   $0F
    jr   z, label_DC592
    cp   $02
    jr   nz, label_DC5B5

label_DC592::
    inc  a
    and  $0F
    ld   [$C214], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_DC5AF
    ld   a, [$C214]
    and  a
    ret  nz
    ld   hl, $DB97
    ld   a, $E4
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   a, $E4
    ld   [hl], a
    ret

label_DC5AF::
    ld   a, $02
    ld   [$DDD1], a
    ret

label_DC5B5::
    cp   $0E
    jr   nz, label_DC5D3
    ld   hl, rSVBK
    ld   de, $DC10

label_DC5BF::
    ld   [hl], $03
    ld   a, [de]
    ld   [hl], $00
    ld   [de], a
    inc  de
    ld   a, e
    cp   $90
    jr   nz, label_DC5BF
    ld   a, $01
    ld   [$DDD1], a
    ld   a, [$C214]

label_DC5D3::
    inc  a
    ld   [$C214], a
    cp   $04
    ret  nz
    ld   a, [$DB95]
    sub  a, $0E
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_DD727
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    push hl
    push hl
    call label_28CF
    pop  hl
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    inc  hl
    ld   a, [hl]
    call label_DC18B
    pop  hl
    ld   a, [hli]
    add  a, $08
    ld   c, a
    ld   a, [hli]
    sub  a, $08
    ld   b, a
    ld   a, [hl]
    call label_DC18B
    ld   a, $E5
    ld   [$D6FD], a
    ld   [rLCDC], a
    xor  a
    ld   [$DB9A], a
    ld   a, [$FFFE]
    and  a
    ret  z
    di
    ld   a, $03
    ld   [rSVBK], a
    ld   de, $DC10
    ld   hl, label_DC54A

label_DC622::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, e
    and  $07
    jr   nz, label_DC622
    xor  a
    ld   [rSVBK], a
    ei
    ret
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $50
    ret  nz
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    ld   a, [$DC0C]
    or   $01
    ld   [$DC0C], a
    ld   a, [$DB95]
    cp   $0E
    jr   nz, label_DC655
    ld   a, [$DC0D]
    or   $80
    ld   [$DC0D], a

label_DC655::
    call label_DD3FE
    ret
    call label_DC4EF
    ld   hl, $C242
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    ld   [hl], a
    ld   a, $1C
    ld   [$C200], a
    call label_DC6A4
    call label_DC6AF
    call label_DC552
    ld   a, [$C114]
    inc  a
    cp   $A0
    jr   nz, label_DC67E
    ld   a, $0F
    ld   [$FFF4], a
    xor  a

label_DC67E::
    ld   [$C114], a
    ld   a, [$D466]
    and  a
    jr   nz, label_DC695
    ld   a, $21
    ld   [$FFF2], a
    call label_280D
    and  $7F
    add  a, $60
    ld   [$D466], a

label_DC695::
    dec  a
    ld   [$D466], a
    ld   a, $37
    call label_A9B
    ld   a, $37
    call label_80C
    ret

label_DC6A4::
    call label_DC779
    call label_DC771
    ret

label_DC6AB::
    ld   [label_812], sp
    ld   [de], a

label_DC6AF::
    ld   hl, $C20A
    dec  [hl]
    ld   a, [hl]
    and  a
    jr   nz, label_DC6D7
    push hl
    call label_280D
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_DC6AB
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a
    ld   a, [$C207]
    xor  $01
    ld   [$C207], a
    ld   a, [$C201]
    xor  $01
    ld   [$C201], a

label_DC6D7::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C20B]
    rst  0
    or   $46
    ld   a, [bc]
    ld   b, a
    ld   c, $47
    ld   a, [bc]
    ld   b, a
    ld   [de], a
    ld   b, a
    ld   a, [bc]
    ld   b, a
    ld   d, $47
    inc  h
    ld   b, a
    dec  sp
    ld   b, a
    ld   d, e
    ld   b, a
    call label_2149
    inc  de
    jp   nz, label_DFE34
    cp   $20
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, $55

label_DC702::
    call label_237C

label_DC705::
    ld   hl, $C20B
    inc  [hl]
    ret
    ld   a, $56
    jr   label_DC702
    ld   a, $57
    jr   label_DC702
    ld   a, $58
    jr   label_DC702
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $50
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, $59
    jr   label_DC702
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $20
    ret  nz
    xor  a
    ld   [hl], a
    ld   hl, $C214
    inc  [hl]
    ld   a, $60
    ld   [$C213], a
    call label_DC705
    ret
    ld   a, [$C214]
    and  a
    ret  nz
    ld   hl, $C213
    dec  [hl]
    ld   a, [hl]
    bit  7, a
    ret  z
    xor  a
    ld   [hl], a
    ld   a, $0B
    call label_2373
    call label_DC705
    ret
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $30
    ret  nz
    ld   a, [$DC0C]
    or   $02
    ld   [$DC0C], a
    call label_DC705
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    call label_DD3FE
    ret

label_DC771::
    ld   c, $18
    ld   hl, label_DDA8B
    jp   label_DCA45

label_DC779::
    ld   hl, label_DD7E2
    ld   c, $10
    jp   label_DC9E1
    call label_DC4EF
    ld   hl, $C245
    ld   [hl], $00
    ld   a, $1C
    ld   [$C200], a
    ld   a, [$C20E]
    cp   $04
    jr   nc, label_DC7A3
    call label_DCA37
    call label_DC9D3
    call label_DC972
    call label_DCA8E
    jr   label_DC7A6

label_DC7A3::
    call label_DC7C3

label_DC7A6::
    call label_DC7D0
    call label_DC994
    call label_DC9FB
    call label_DC552
    ld   a, [$C200]
    call label_3DA0
    ld   a, $37
    call label_A9B
    ld   a, $37
    call label_80C
    ret

label_DC7C3::
    call label_DC972
    call label_DCA37
    call label_DC9D3
    call label_DCA8E
    ret

label_DC7D0::
    ld   a, [$C20E]
    rst  0
    jp   hl
    ld   b, a
    add  hl, hl
    ld   c, b
    inc  [hl]
    ld   c, b
    ld   e, [hl]
    ld   c, b
    add  a, h
    ld   c, b
    and  b
    ld   c, b
    cp   b
    ld   c, b
    bit  1, b

label_DC7E4::
    ld   hl, $C20E
    inc  [hl]
    ret
    ld   a, $68
    ld   [$C212], a
    ld   a, [$C202]
    bit  7, a
    ret  nz
    cp   $58
    ret  c
    ld   hl, $C20F
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C210]
    inc  a
    and  $03
    ld   [$C210], a
    ld   a, [$C211]
    sub  a, $04
    bit  7, a
    jr   nz, label_DC825
    cp   $88
    jr   nc, label_DC825
    xor  a
    ld   [$C210], a
    ld   a, $3D
    call label_237C
    call label_DC7E4
    ld   a, $80

label_DC825::
    ld   [$C211], a
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    xor  a
    ld   [$C210], a
    jr   label_DC7E4
    ld   hl, $C20F
    inc  [hl]
    ld   a, [hl]
    cp   $05
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C210]
    inc  a
    and  $03
    ld   [$C210], a
    ld   a, [$C211]
    sub  a, $04
    cp   $54
    jr   nc, label_DC85A
    call label_DC7E4
    ld   a, $04
    ld   [$C210], a
    ld   a, $51

label_DC85A::
    ld   [$C211], a
    ret
    ld   a, [$C202]
    cp   $60
    jr   nc, label_DC86A
    inc  a
    ld   [$C202], a
    ret

label_DC86A::
    ld   a, [$C208]
    cp   $3F
    jr   c, label_DC876
    dec  a
    ld   [$C208], a
    ret

label_DC876::
    ld   a, $3E
    call label_237C
    ld   a, $10
    ld   [$C213], a
    call label_DC7E4
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   hl, $C213
    dec  [hl]
    ld   a, [hl]
    bit  7, a
    ret  z
    xor  a
    ld   [hl], a
    ld   hl, $C214
    inc  [hl]
    ld   a, $20
    ld   [$C213], a
    call label_DC7E4
    ret
    ld   a, [$C214]
    and  a
    ret  nz
    ld   hl, $C213
    dec  [hl]
    ld   a, [hl]
    bit  7, a
    ret  z
    xor  a
    ld   [hl], a
    ld   a, $3F
    call label_237C
    call label_DC7E4
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    xor  a
    ld   [$C210], a
    ld   [$C16C], a
    ld   [$C16B], a
    call label_DC7E4
    ret
    ld   a, [$C211]
    cp   $28
    jr   nc, label_DC8E7
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_DC8E7
    call label_DD3FE
    ld   a, [$DC0C]
    or   $08
    ld   [$DC0C], a

label_DC8E7::
    ld   hl, $C20F
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C210]
    inc  a
    and  $03
    ld   [$C210], a
    ld   a, [$C211]
    sub  a, $04
    ld   [$C211], a
    ret
    nop
    nop
    ld   l, h
    ld   b, $00
    ld   [label_66E], sp
    nop
    db   $10 ; Undefined instruction
    ld   b, $10
    nop
    ld   a, b
    ld   b, $10
    ld   [label_67A], sp
    db   $10 ; Undefined instruction
    ld   a, h
    ld   b, $F8
    nop
    ld   c, h
    ld   b, $F8
    ld   [label_64E], sp
    ld    hl, sp+$10
    ld   d, b
    ld   b, $08
    nop
    ld   d, d
    ld   b, $08
    ld   [label_654], sp
    ld   [label_DD610], sp
    ld   b, $F8
    nop
    ld   c, h
    ld   b, $F8
    ld   [label_64E], sp
    ld    hl, sp+$10
    ld   d, b
    ld   b, $08
    nop
    ld   e, b
    ld   b, $08
    ld   [label_65A], sp
    ld   [label_DEA10], sp
    ld   b, $00
    nop
    ld   b, b
    ld   b, $00
    ld   [label_642], sp
    nop
    db   $10 ; Undefined instruction
    ld   b, $10
    nop
    ld   b, [hl]
    ld   b, $10
    ld   [label_648], sp
    db   $10 ; Undefined instruction
    ld   c, d
    ld   b, $03
    ld   c, c
    dec  de
    ld   c, c
    inc  bc
    ld   c, c
    inc  sp
    ld   c, c
    ld   c, e
    ld   c, c
    jr   label_DC987
    jr   label_DC989
    jr   label_DC994
    ld   l, l
    ld   c, c
    ld   a, [$C210]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   c, [hl]
    sla  e
    ld   hl, label_DC963
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, [$C212]

label_DC989::
    ld   [$FFD7], a
    ld   a, [$C211]
    ld   [$FFD8], a
    call label_DCAB8
    ret

label_DC994::
    ld   a, [$C205]
    rst  0
    sbc  a, h
    ld   c, c
    call label_2149
    inc  b
    jp   nz, label_DFE34
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C201]
    inc  a
    and  $03
    ld   [$C201], a
    ld   hl, $C206
    ld   a, [$C202]
    add  a, $04
    bit  7, a
    jr   nz, label_DC9C9
    cp   [hl]
    jr   c, label_DC9C9
    call label_DC9CE
    ld   a, $04
    ld   [$C201], a
    ld   a, [$C206]

label_DC9C9::
    ld   [$C202], a
    ret
    ret

label_DC9CE::
    ld   hl, $C205
    inc  [hl]
    ret

label_DC9D3::
    ld   hl, label_DD7BD
    ld   a, [$C201]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   c, [hl]
    ld   hl, label_DD7B3

label_DC9E1::
    ld   a, [$C201]
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, [$C203]
    ld   [$FFD7], a
    ld   a, [$C202]
    ld   [$FFD8], a
    call label_DCAB8
    ret

label_DC9FB::
    ld   a, [$C20B]
    rst  0
    inc  bc
    ld   c, d
    call label_3E49
    ld   l, b
    ld   [$C209], a
    ld   hl, $C20A
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C207]
    inc  a
    and  $03
    ld   [$C207], a
    ld   a, [$C208]
    add  a, $04
    bit  7, a
    jr   nz, label_DCA33
    cp   $40
    jr   c, label_DCA33
    ld   hl, $C20B
    inc  [hl]
    ld   a, $04
    ld   [$C207], a
    ld   a, $40

label_DCA33::
    ld   [$C208], a
    ret

label_DCA37::
    ld   hl, label_DDA56
    ld   a, [$C207]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   c, [hl]
    ld   hl, label_DDA4C

label_DCA45::
    ld   a, [$C207]
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, [$C209]
    ld   [$FFD7], a
    ld   a, [$C208]
    ld   [$FFD8], a
    call label_DCAB8
    ret
    ld   c, $08
    ld   hl, label_DDAA7

label_DCA64::
    ld   a, [$C21B]
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, [$C21D]
    ld   [$FFD7], a
    ld   a, [$C21C]
    ld   [$FFD8], a
    call label_DCAB8
    ret

label_DCA7E::
    ld   c, b
    ld   l, b
    ld   e, h
    inc  bc
    ld   e, b
    ld   l, b
    ld   e, [hl]
    inc  bc

label_DCA86::
    ld   c, b
    ld   l, b
    ld   h, b
    inc  bc
    ld   e, b
    ld   l, b
    ld   h, d
    inc  bc

label_DCA8E::
    ld   hl, $C20C
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    jr   c, label_DCAA1
    xor  a
    ld   [hl], a
    ld   a, [$C20D]
    xor  $01
    ld   [$C20D], a

label_DCAA1::
    ld   hl, label_DCA7E
    ld   a, [$C20D]
    and  a
    jr   z, label_DCAAD
    ld   hl, label_DCA86

label_DCAAD::
    xor  a
    ld   [$FFD7], a
    ld   [$FFD8], a
    ld   c, $08
    call label_DCAB8
    ret

label_DCAB8::
    push hl
    ld   a, [$C200]
    ld   e, a
    add  a, c
    ld   [$C200], a
    ld   d, $00
    ld   hl, $C000
    add  hl, de
    push hl
    pop  de
    pop  hl
    srl  c
    srl  c

label_DCACE::
    ld   a, [$FFD7]
    add  a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [$FFD8]
    add  a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    dec  c
    ld   a, c
    and  a
    jr   nz, label_DCACE
    ret
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $50
    ret  nz
    ld   a, [$DC0C]
    or   $10
    ld   [$DC0C], a
    xor  a
    ld   [hl], a
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    call label_DD3FE
    ret
    ld   a, $1C
    ld   [$C200], a
    call label_DCB1E
    call label_DCB55
    call label_DC552
    ld   a, $37
    call label_A9B
    ld   a, $37
    call label_80C
    ret

label_DCB1E::
    call label_DCF1B
    call label_DCB31
    call label_DCF37
    ld   a, [$C275]
    and  $02
    ret  nz
    call label_DCE7F
    ret

label_DCB31::
    ld   hl, label_DD870
    ld   a, [$C201]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   c, [hl]
    ld   hl, label_DD866
    sla  e
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, [$C203]
    ld   [$FFD7], a
    ld   a, [$C202]
    ld   [$FFD8], a
    call label_DCAB8
    ret

label_DCB55::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C214]
    and  a
    ret  nz
    ld   a, [$C275]
    and  $02
    call z, label_DCBAC
    ld   a, [$C224]
    rst  0
    ld   [hl], $4C
    ld   [hl], l
    ld   c, h
    ld   sp, hl
    ld   c, h
    ld   l, $4D
    ld   [hl], l
    ld   c, h
    ld   b, e
    ld   c, l
    ld   [hl], l
    ld   c, h
    ld   a, e
    ld   c, l
    or   l
    ld   c, l
    jp   nz, label_D84D
    ld   c, l
    db   $EC ; Undefined instruction
    ld   c, l
    ld   b, c
    ld   c, [hl]
    ld   e, a
    ld   c, [hl]

label_DCB87::
    ld   a, [$C276]
    push af
    swap a
    and  $F0
    ld   hl, $C277
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C202
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_DCBA2
    ld   e, $F0

label_DCBA2::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

label_DCBAC::
    ld   a, [$C271]
    push af
    swap a
    and  $F0
    ld   hl, $C272
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C222
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_DCBC7
    ld   e, $F0

label_DCBC7::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    cp   $70
    jr   c, label_DCBD5
    ld   a, $70

label_DCBD5::
    ld   [hl], a
    ld   hl, $C271
    ld   a, [hl]
    add  a, $04
    ld   [hl], a
    ld   a, [$C275]
    and  a
    jr   z, label_DCBF0
    ld   a, [$C222]
    cp   $70
    jr   c, label_DCC05
    xor  a
    ld   [$C271], a
    jr   label_DCC31

label_DCBF0::
    ld   a, [$C222]
    cp   $70
    jr   c, label_DCC05
    call label_280D
    and  $0C
    sla  a
    sla  a
    cpl
    inc  a
    ld   [$C271], a

label_DCC05::
    ld   hl, $C223
    ld   a, [$C273]
    and  a
    jr   nz, label_DCC18
    dec  [hl]
    ld   a, [hl]
    cp   $40
    jr   nc, label_DCC31
    ld   a, $40
    jr   label_DCC20

label_DCC18::
    inc  [hl]
    ld   a, [hl]
    cp   $70
    jr   c, label_DCC31
    ld   a, $70

label_DCC20::
    ld   [hl], a
    ld   a, [$C273]
    xor  $01
    ld   [$C273], a
    ld   a, [$C221]
    xor  $02
    ld   [$C221], a

label_DCC31::
    xor  a
    ld   [$C275], a
    ret
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $50
    ret  c
    xor  a
    ld   [hl], a
    ld   [$C204], a
    ld   a, $70
    call label_237C

label_DCC48::
    ld   hl, $C224
    inc  [hl]
    ret

label_DCC4D::
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   bc, $0102
    inc  bc
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $08
    ret  c
    xor  a
    ld   [hl], a
    ld   hl, $C204
    inc  [hl]
    ld   e, [hl]
    ld   d, $00
    ld   hl, label_DCC4D
    add  hl, de
    ld   a, [hl]
    ld   [$C201], a
    ld   a, [$C202]
    sub  a, $03
    ld   [$C202], a
    ld   a, [$C202]
    ld   hl, $C223
    sub  a, [hl]
    bit  7, a
    jr   nz, label_DCCA4
    cp   $08
    ret  nc

label_DCCA4::
    xor  a
    ld   [$C213], a
    ld   a, $02
    ld   [$C201], a
    ld   a, [$C202]
    sub  a, $04
    ld   [$C202], a
    ld   a, $10
    ld   [$C225], a
    ld   a, $07
    ld   [$FFF2], a
    ld   a, $28
    ld   [$C276], a
    ld   a, [$C203]
    add  a, $03
    ld   [$C279], a
    ld   a, [$C202]
    sub  a, $0C
    ld   [$C278], a
    jp   label_DCC48

label_DCCD6::
    call label_DCB87
    ld   a, [$C276]
    and  a
    ret  z
    sub  a, $03
    bit  7, a
    jr   z, label_DCCE5
    xor  a

label_DCCE5::
    ld   [$C276], a
    ret

label_DCCE9::
    nop
    ld   bc, $0100
    nop
    ld   bc, $0001
    nop
    ld   bc, $0100
    nop
    ld   bc, $0001
    ld   a, $01
    ld   [$C275], a
    call label_DCCD6
    ld   a, [$C225]
    and  a
    ret  nz
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    and  $30
    cp   $30
    jr   nz, label_DCD1B
    xor  a
    ld   [hl], a
    ld   a, $71
    call label_237C
    jp   label_DCC48

label_DCD1B::
    swap a
    ld   e, a
    ld   d, $00
    ld   hl, label_DCCE9
    add  hl, de
    ld   a, [$C221]
    and  $FE
    or   [hl]
    ld   [$C221], a
    ret
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $20
    ret  nz
    xor  a
    ld   [hl], a
    ld   [$C204], a
    ld   a, $72
    call label_237C
    jp   label_DCC48
    ld   a, $01
    ld   [$C275], a
    call label_DCCD6
    ld   a, [$C225]
    and  a
    ret  nz
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $4F
    jr   nz, label_DCD66
    xor  a
    ld   [hl], a
    ld   [$C204], a
    ld   a, $73
    call label_237C
    jp   label_DCC48

label_DCD66::
    and  $70
    swap a
    ld   e, a
    ld   d, $00
    ld   hl, label_DCCE9
    add  hl, de
    ld   a, [$C221]
    and  $FE
    or   [hl]
    ld   [$C221], a
    ret
    ld   a, $01
    ld   [$C275], a
    call label_DCCD6
    ld   a, [$C225]
    and  a
    ret  nz
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $68
    jr   nz, label_DCDA0
    ld   a, $02
    ld   [$C275], a
    xor  a
    ld   [hl], a
    ld   a, $75
    call label_237C
    jp   label_DCC48

label_DCDA0::
    and  $70
    swap a
    ld   e, a
    ld   d, $00
    ld   hl, label_DCCE9
    add  hl, de
    ld   a, [$C221]
    and  $FE
    or   [hl]
    ld   [$C221], a
    ret
    ld   a, $02
    ld   [$C275], a
    ld   a, $74
    call label_237C
    jp   label_DCC48
    xor  a
    ld   [$C201], a
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $40
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, $04
    ld   [$C201], a
    jp   label_DCC48
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $30
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, $04
    ld   [$C221], a
    jp   label_DCC48

label_DCDEA::
    ld   [bc], a
    cp   $21
    inc  de
    jp   nz, label_DFE34
    and  $07
    jr   nz, label_DCDFD
    ld   a, [$C221]
    xor  $01
    ld   [$C221], a

label_DCDFD::
    ld   a, $02
    ld   [$C275], a
    ld   a, [hl]
    and  $03
    jr   nz, label_DCE23
    ld   a, [hl]
    srl  a
    srl  a
    and  $01
    ld   e, a
    ld   d, $00
    push hl
    ld   hl, label_DCDEA
    add  hl, de
    ld   a, [hl]
    ld   hl, $C223
    add  a, [hl]
    ld   [$C223], a
    ld   hl, $C222
    dec  [hl]
    pop  hl

label_DCE23::
    ld   a, [hl]
    cp   $30
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, $06
    ld   [$C221], a
    ld   a, [$C223]
    add  a, $03
    ld   [$C223], a
    ld   a, [$C222]
    sub  a, $03
    ld   [$C222], a
    jp   label_DCC48
    ld   a, $02
    ld   [$C275], a
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $10
    ret  c
    ld   a, $07
    ld   [$C221], a
    ld   a, [hl]
    cp   $20
    ret  nz
    ld   a, $01
    ld   [$C214], a
    jp   label_DCC48
    ld   a, [$C214]
    and  a
    ret  nz
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $50
    ret  nz
    ld   a, [$DC0C]
    or   $20
    ld   [$DC0C], a
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    call label_DD3FE
    ret

label_DCE7F::
    ld   a, [$C223]
    ld   [$C251], a
    ld   a, [$C222]
    ld   [$C261], a
    ld   de, $C251
    ld   hl, $C252
    ld   c, $05

label_DCE93::
    ld   a, [de]
    sub  a, [hl]
    add  a, $07
    cp   $0E
    jr   c, label_DCEA5
    bit  7, a
    jr   nz, label_DCEA3
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_DCEA3::
    dec  [hl]
    dec  [hl]

label_DCEA5::
    inc  hl
    inc  de
    dec  c
    jr   nz, label_DCE93
    ld   de, $C261
    ld   hl, $C262
    ld   c, $05

label_DCEB2::
    ld   a, [de]
    sub  a, [hl]
    add  a, $07
    cp   $0E
    jr   c, label_DCEC4
    bit  7, a
    jr   nz, label_DCEC2
    inc  [hl]
    inc  [hl]
    inc  [hl]
    inc  [hl]

label_DCEC2::
    dec  [hl]
    dec  [hl]

label_DCEC4::
    inc  hl
    inc  de
    dec  c
    jr   nz, label_DCEB2
    ld   a, [$FFE7]
    and  $01
    jr   z, label_DCEDE
    ld   hl, $C261

label_DCED2::
    ld   a, [hl]
    cp   $70
    jr   z, label_DCED8
    inc  [hl]

label_DCED8::
    inc  hl
    ld   a, l
    and  $0F
    jr   nz, label_DCED2

label_DCEDE::
    ld   a, [$C200]
    ld   e, a
    add  a, $0C
    ld   [$C200], a
    ld   d, $00
    ld   hl, $C000
    add  hl, de
    push hl
    pop  de
    ld   c, $05

label_DCEF1::
    ld   a, [$FFE7]
    xor  c
    rra
    jr   c, label_DCF0F
    ld   hl, $C261
    add  hl, bc
    ld   a, [hl]
    ld   [de], a
    inc  de
    ld   hl, $C251
    add  hl, bc
    ld   a, [hl]
    add  a, $04
    ld   [de], a
    inc  de
    ld   a, $7E
    ld   [de], a
    inc  de
    ld   a, $00
    ld   [de], a
    inc  de

label_DCF0F::
    dec  c
    jr   nz, label_DCEF1
    ret

label_DCF13::
    nop
    nop
    ld   e, [hl]
    jr   nz, label_DCF18

label_DCF18::
    ld   [$005E], sp

label_DCF1B::
    ld   a, [$C225]
    and  a
    ret  z
    dec  a
    ld   [$C225], a
    ld   hl, label_DCF13
    ld   a, [$C279]
    ld   [$FFD7], a
    ld   a, [$C278]
    ld   [$FFD8], a
    ld   c, $08
    call label_DCAB8
    ret

label_DCF37::
    ld   hl, label_DDC7F
    ld   a, [$C221]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   c, [hl]
    ld   hl, label_DDC6F
    sla  e
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, [$C222]
    ld   [$FFD7], a
    ld   a, [$C223]
    ld   [$FFD8], a
    call label_DCAB8
    ret
    ld   a, [$FFCC]
    and  $80
    jr   z, label_DCF6B
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    call label_DD3FE

label_DCF6B::
    call label_DCF70
    ret
    ret

label_DCF70::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C205]
    rst  0
    ld   a, l
    ld   c, a
    call label_2149
    inc  de
    jp   nz, label_DFE34
    cp   $70
    ret  nz
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    ld   a, [$DC0C]
    or   $80
    ld   [$DC0C], a
    call label_DD3FE
    call label_DC9CE
    ret
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $50
    ret  nz
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    ld   a, [$DC0D]
    or   $01
    ld   [$DC0D], a
    call label_DD3FE
    ret
    ret
    ld   a, $1C
    ld   [$C200], a
    call label_DCFD0
    call label_DD00B
    call label_DC552
    ld   a, $37
    call label_A9B
    ld   a, $37
    call label_80C
    ret

label_DCFD0::
    ld   hl, label_DDB69
    ld   a, [$C219]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   c, [hl]
    ld   hl, label_DDB5D
    sla  e
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, [$C216]
    ld   [$FFD7], a
    ld   a, [$C217]
    ld   [$FFD8], a
    call label_DCAB8
    ld   hl, label_DD941
    ld   a, [$C201]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   c, [hl]
    ld   hl, label_DD935
    call label_DC9E1
    ld   c, $08
    ld   hl, label_DDADD
    call label_DCA64
    ret

label_DD00B::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C215]
    rst  0
    ld   l, a
    ld   d, b
    add  a, c
    ld   d, b
    ld   l, a
    ld   d, b
    xor  d
    ld   d, b
    push de
    ld   d, b
    ld   a, [bc]
    ld   d, c
    ld   h, l
    ld   d, c
    ld   [hl], a
    ld   d, c
    sub  a, d
    ld   d, c
    xor  e
    ld   d, c

label_DD028::
    ld   a, [$C202]
    cp   $3E
    jr   nz, label_DD040
    ld   a, [$C21C]
    cp   $52
    ret  nz
    ld   a, $2E
    call label_237C
    call label_DD07C
    ld   [hl], $04
    ret

label_DD040::
    ld   hl, $C204
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C201]
    xor  $01
    ld   [$C201], a
    ld   hl, $C203
    dec  [hl]
    ld   a, [$C202]
    add  a, $04
    ld   [$C202], a
    bit  7, a
    ret  nz
    cp   $3E
    ret  c
    ld   a, $02
    ld   [$C201], a
    ld   a, $3E
    ld   [$C202], a
    ret
    call label_DD028
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $30
    ret  nz
    xor  a
    ld   [hl], a

label_DD07C::
    ld   hl, $C215
    inc  [hl]
    ret
    call label_DD028
    ld   hl, $C21F
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C21B]
    and  $01
    xor  $01
    ld   [$C21B], a
    ld   a, [$C21C]
    add  a, $04
    cp   $70
    jr   c, label_DD0A6
    call label_DD07C
    ld   a, $70

label_DD0A6::
    ld   [$C21C], a
    ret
    call label_DD028
    ld   hl, $C21F
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C21B]
    or   $02
    xor  $01
    ld   [$C21B], a
    ld   a, [$C21C]
    sub  a, $04
    cp   $54
    jr   nc, label_DD0D1
    call label_DD07C
    ld   [hl], $00
    ld   a, $52

label_DD0D1::
    ld   [$C21C], a
    ret
    ld   hl, $C21A
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C219]
    xor  $01
    ld   [$C219], a
    ld   a, [$C217]
    sub  a, $04
    ld   [$C217], a
    cp   $80
    jr   c, label_DD0F8
    ld   hl, $C216
    dec  [hl]
    ret

label_DD0F8::
    ld   a, $80
    ld   [$C217], a
    xor  a
    ld   [$C219], a
    ld   a, $3C
    call label_237C
    call label_DD07C
    ret
    ld   a, $04
    ld   [$C201], a
    ld   a, [$C21B]
    and  $01
    or   $04
    ld   [$C21B], a
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_DD127
    ld   a, [$C21B]
    xor  $01
    ld   [$C21B], a

label_DD127::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_DD131
    ld   hl, $C21D
    inc  [hl]

label_DD131::
    ld   hl, $C21A
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C219]
    xor  $01
    ld   [$C219], a
    ld   hl, $C216
    dec  [hl]
    ld   a, [$C217]
    sub  a, $04
    ld   [$C217], a
    cp   $58
    ret  nc
    ld   a, $56
    ld   [$C217], a
    ld   a, $04
    ld   [$C219], a
    ld   a, $49
    call label_237C
    call label_DD07C
    ret
    ld   a, $04
    ld   [$C201], a
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $40
    ret  nz
    xor  a
    ld   [hl], a
    jp   label_DD07C
    ld   a, $05
    ld   [$C201], a
    ld   a, $05
    ld   [$C219], a
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $40
    ret  nz
    xor  a
    ld   [hl], a
    ld   hl, $C214
    inc  [hl]
    jp   label_DD07C
    ld   a, [$C214]
    and  a
    ret  nz
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $20
    ret  nz
    xor  a
    ld   [$C219], a
    ld   a, $54
    call label_237C
    jp   label_DD07C
    ld   a, $04
    ld   [$C201], a
    ld   a, [$C217]
    cp   $28
    jr   nc, label_DD1CE
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_DD1D5
    call label_DD3FE
    ld   a, [$DC0D]
    or   $02
    ld   [$DC0D], a
    jr   label_DD1D5

label_DD1CE::
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a

label_DD1D5::
    ld   hl, $C21A
    inc  [hl]
    ld   a, [hl]
    cp   $06
    ret  c
    xor  a
    ld   [hl], a
    ld   a, [$C219]
    xor  $01
    ld   [$C219], a
    ld   a, [$C217]
    sub  a, $04
    ld   [$C217], a
    ld   hl, $C216
    inc  [hl]
    ret
    ld   a, $1C
    ld   [$C200], a
    ld   a, [$FFCC]
    and  $80
    jr   z, label_DD1FF

label_DD1FF::
    call label_DD32E
    call label_DD33F
    call label_DD216
    call label_DC552
    ld   a, $37
    call label_A9B
    ld   a, $37
    call label_80C
    ret

label_DD216::
    ld   a, [$C205]
    rst  0
    jr   z, label_DD26E
    ld   d, a
    ld   d, d
    ld   l, a
    ld   d, d
    ld   a, l
    ld   d, d
    xor  $52
    ei
    ld   d, d
    dec  c
    ld   d, e
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $08
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, [$C24E]
    xor  $01
    ld   [$C24E], a
    ld   a, [$C250]
    sub  a, $03
    ld   [$C250], a
    cp   $6C
    ret  nc
    ld   a, $6E
    ld   [$C250], a
    xor  a
    ld   [$C24E], a
    call label_DC9CE
    ld   a, $AF
    call label_237C
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $2E
    call label_2373
    ld   a, $01
    ld   [$C201], a
    ld   hl, $C202
    dec  [hl]
    dec  [hl]
    call label_DC9CE

label_DD26E::
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $01
    ld   [$C24E], a
    call label_DC9CE
    ret
    call label_DD2B0
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $08
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, [$C24E]
    xor  $01
    ld   [$C24E], a
    ld   a, [$C24F]
    add  a, $02
    ld   [$C24F], a
    push af
    and  $03
    jr   nz, label_DD2A3
    ld   hl, $C250
    dec  [hl]

label_DD2A3::
    pop  af
    cp   $B0
    ret  c
    call label_DC9CE
    ld   a, $F6
    call label_2373
    ret

label_DD2B0::
    ld   a, [$C201]
    cp   $05
    ret  z
    ld   hl, $C204
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  nz
    xor  a
    ld   [hl], a
    ld   hl, $C201
    inc  [hl]
    ld   a, [hl]
    cp   $05
    jr   nz, label_DD2CC
    ld   a, $01
    ld   [hl], a

label_DD2CC::
    ld   a, [$C202]
    add  a, $04
    cp   $61
    jr   c, label_DD2D7
    ld   a, $61

label_DD2D7::
    ld   [$C202], a
    ld   a, [$C203]
    sub  a, $01
    cp   $55
    jr   nc, label_DD2EA
    ld   a, $05
    ld   [$C201], a
    ld   a, $55

label_DD2EA::
    ld   [$C203], a
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $06
    ld   [$C201], a
    jp   label_DC9CE
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $30
    ret  nz
    xor  a
    ld   [hl], a
    inc  a
    ld   [$C214], a
    call label_DC9CE
    ret
    ld   a, [$C214]
    and  a
    ret  nz
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $50
    ret  nz
    xor  a
    ld   [hl], a
    ld   [$C16C], a
    ld   [$C16B], a
    call label_DD3FE
    ld   a, [$DC0D]
    or   $04
    ld   [$DC0D], a
    ret

label_DD32E::
    ld   hl, label_DD9DD
    ld   a, [$C201]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   c, [hl]
    ld   hl, label_DD9CF
    jp   label_DC9E1

label_DD33F::
    ld   c, $08
    ld   hl, label_DDCDB
    ld   a, [$C24E]
    sla  a
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, [$C24F]
    ld   [$FFD7], a
    ld   a, [$C250]
    ld   [$FFD8], a
    call label_DCAB8
    ret
    ld   hl, $C213
    inc  [hl]
    ld   a, [hl]
    cp   $40
    ret  nz
    ld   a, [$DC0D]
    or   $08
    ld   [$DC0D], a
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    call label_DD3FE
    ret

label_DD379::
    ld   d, b
    ld   d, b
    jr   z, label_DD37D

label_DD37D::
    ld   e, b
    ld   e, c
    ld   d, b
    nop
    ld   h, b
    ld   a, b
    ld   e, b
    jr   z, label_DD3C9

label_DD386::
    inc  h
    inc  h
    ld   d, b
    nop
    ld   [hl], b
    ld   [hl], b
    ld   [hl], b
    nop
    inc  a
    ld   b, b
    ld   b, b
    ld   [hl], d
    ld   d, b
    ld   a, [$DB95]
    cp   $10
    jr   nz, label_DD39D
    call label_DC331

label_DD39D::
    call label_1A22
    ld   a, [$C16B]
    cp   $04
    ret  nz
    call label_28CF
    ld   a, $37
    call label_BBE
    ld   a, [$DB95]
    cp   $19
    jr   nz, label_DD3C9
    ld   a, [$FFFE]
    and  a
    jr   nz, label_DD3BE
    ld   a, $0E
    jr   label_DD3C0

label_DD3BE::
    ld   a, $2E

label_DD3C0::
    ld   b, $42
    ld   c, $06
    ld   h, $37
    call label_A13

label_DD3C9::
    ld   a, $C7
    ld   [$D6FD], a
    ld   [rLCDC], a
    ld   hl, label_DD379
    ld   a, [$DB95]
    sub  a, $0E
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    ld   [$DB9D], a
    ld   hl, label_DD386
    add  hl, de
    ld   a, [hl]
    ld   [$DB9E], a
    xor  a
    ld   [$FF9D], a
    ld   a, $03
    ld   [$FF9E], a
    ld   a, $0B
    ld   [$DB95], a
    xor  a
    ld   [$DB96], a
    ld   a, $02
    ld   [$D6FF], a
    ret

label_DD3FE::
    ld   hl, $DB96
    inc  [hl]
    ret
    ld   hl, $C3B0
    add  hl, bc
    ret
    ld   hl, $C240
    add  hl, bc
    ret
    rst  $38
    ld   b, a
    jp   z, label_2226
    ld   c, l
    nop
    nop
    rst  $18
    ld   e, e
    sub  a, a
    ld   l, [hl]
    ld   l, $6D
    nop
    nop
    rst  $38
    ld   b, a
    rst  $18
    db   $3A ; ldd  a, [hl]
    db   $DB
    ld   bc, $0000
    rst  $38
    ld   b, a
    nop
    db   $76 ; Halt
    ldi  [hl], a
    ld   c, l
    nop
    nop
    rst  $38
    ld   b, a
    cp   h
    ld   b, $83
    ld   h, $00
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, $002D
    ld   l, b
    inc  b
    rst  $38
    ld   b, a
    adc  a, $10
    dec  h
    nop
    nop
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    cp   $63
    nop
    nop
    add  a, e
    ld   h, $DF
    db   $3A ; ldd  a, [hl]
    cp   $63
    nop
    nop
    rst  $38
    ld   bc, label_3ADF
    cp   $63
    nop
    nop
    ld   a, l
    inc  b
    ld   e, a
    ld   e, e
    cp   $63
    nop
    nop
    db   $3A ; ldd  a, [hl]
    nop
    rst  $38
    ld   bc, label_1CC7
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  $38
    ld   b, a
    jp   z, label_DC026
    ld   bc, $0000
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  $38
    ld   b, a
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $18
    ld   e, e
    sub  a, a
    ld   l, [hl]
    ld   l, $6D
    nop
    nop
    rra
    ld   b, b
    call nz, label_2126
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_DD4AC

label_DD4AC::
    nop
    call nz, label_2126
    dec  d
    ld   sp, $0046
    nop
    rst  $38
    ld   b, a
    ld   l, b
    ld   a, l
    push bc
    ld   c, h
    nop
    nop
    ret  c
    ld   d, d
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
    cp   $63
    nop
    nop
    nop
    inc  bc
    rst  $18
    db   $3A ; ldd  a, [hl]
    cp   $63
    nop
    nop
    rst  $38
    ld   bc, label_3ADF
    cp   $63
    nop
    nop
    ld   a, l
    inc  b
    ld   e, a
    ld   e, e
    cp   $63
    nop
    nop
    ld   sp, $FE46
    ld   h, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $63
    nop
    nop
    rst  $18
    db   $3A ; ldd  a, [hl]
    ld   a, l
    inc  b
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
    di
    ld   d, c
    ld   h, a
    jr   z, label_DD514

label_DD514::
    nop
    rst  $18
    ld   e, e
    sub  a, a
    ld   l, [hl]
    ld   l, $6D
    nop
    nop
    rst  $38
    ld   b, a
    jp   z, label_2126
    dec  d
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
    jp   label_7C
    inc  l
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
    ld   [hl], l
    ld   a, h
    jp   z, label_26
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    ld   [$0010], sp
    nop
    cp   $63
    ld   h, l
    inc  d
    nop
    inc  bc
    ccf
    ld   d, e
    rst  $18
    ld   a, l
    nop
    nop
    ld   sp, $FE46
    ld   h, e
    cp   $63
    nop
    nop
    ld   a, l
    inc  b
    ld   e, a
    ld   e, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    ld   e, e
    inc  d
    ld   l, $4E
    add  hl, de
    xor  c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    db   $F4 ; Undefined instruction

label_DD610::
    ld   b, c
    ld   l, b
    ld   a, l
    rst  0
    inc  e
    rst  $18
    ld   e, e
    sub  a, a
    ld   l, [hl]
    ld   l, $6D
    nop
    nop
    rrca
    ld   c, e
    nop
    nop
    ld   b, $00
    adc  a, b
    nop
    ld   l, b
    ld   a, l
    di
    ld   d, c
    add  a, $18
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_DD634

label_DD634::
    nop
    rst  $38
    ld   b, a
    dec  d
    ld   [hl], $0C
    stop
    nop
    rrca
    ld   c, e
    reti
    ld   de, label_10CE
    nop
    nop
    di
    ld   d, c
    dec  d
    ld   [hl], $0C
    stop
    nop
    cp   $63
    ld   h, l
    inc  d
    nop
    inc  bc
    rst  $38
    ld   b, [hl]
    cp   $63
    ld   h, l
    inc  d
    push hl
    ld   a, l
    rst  $38
    ld   b, [hl]
    cp   $63
    nop
    nop
    ld   a, l
    inc  b
    ld   e, a
    ld   e, e
    rst  $38
    ld   a, a
    nop
    nop
    ld   [hl], c
    ld   b, h
    ld   a, a
    ld   a, l
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    sbc  a, $73
    rst  $18
    ld   e, $34
    ld   bc, label_1CC7
    cp   $63
    sub  a, h
    ld   e, d
    ld   l, d
    add  hl, sp
    rst  0
    inc  e
    rst  $38
    ld   b, a
    jp   z, label_DC026
    ld   bc, $0000
    rst  $18
    ld   e, e
    sub  a, a
    ld   l, [hl]
    ld   l, $6D
    nop
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_DD6A4

label_DD6A4::
    nop
    rst  $38
    ld   b, a
    reti
    ld   de, label_10CE
    nop
    nop
    rst  $38
    ld   b, a
    rla
    inc  d
    rst  $18
    ld   bc, $0000
    rst  $38
    ld   b, a
    rst  $38
    ld   a, a
    rst  $18
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
    cp   $63
    ld   b, $00
    add  a, e
    ld   h, $DF
    db   $3A ; ldd  a, [hl]
    rst  0
    inc  e
    add  a, e
    ld   h, $40
    ld   bc, label_1CC7
    cp   $63
    nop
    nop
    ld   a, l
    inc  b
    ld   e, a
    ld   e, e
    rst  $38
    ld   a, a
    nop
    nop
    ld   [hl], c
    ld   b, h
    ld   a, a
    ld   a, l
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    rst  0
    inc  e
    sbc  a, $73
    rst  $18
    ld   e, $34
    ld   bc, label_1CC7
    cp   $63
    sub  a, h
    ld   e, d
    ld   l, d
    add  hl, sp
    rst  0
    inc  e

label_DD70D::
    adc  a, l
    ld   d, l
    adc  a, l
    ld   d, l
    dec  c
    ld   d, h
    nop
    nop
    adc  a, l
    ld   d, h
    adc  a, l
    ld   d, l
    dec  c
    ld   d, l
    nop
    nop
    adc  a, l
    ld   d, l
    adc  a, l
    ld   d, l
    dec  c
    ld   d, [hl]
    adc  a, l
    ld   d, [hl]
    adc  a, l
    ld   d, l

label_DD727::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_2A58], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_2B48], sp
    nop
    nop
    nop
    nop
    nop
    ld   [label_2B68], sp
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    jr   nz, label_DD760

label_DD760::
    ld   [label_2002], sp
    nop
    nop
    inc  b
    jr   nz, label_DD778
    ld   [label_2006], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_DD770

label_DD770::
    ld   [label_200A], sp
    nop
    nop
    inc  c
    jr   nz, label_DD788

label_DD778::
    db   $10 ; Undefined instruction
    jr   nz, label_DD78C
    ld   [label_2010], sp
    stop
    ld   [de], a
    jr   nz, label_DD784

label_DD784::
    db   $10 ; Undefined instruction
    jr   nz, label_DD788

label_DD788::
    ld   [label_200A], sp
    nop

label_DD78C::
    nop
    inc  c
    jr   nz, label_DD7A0
    db   $10 ; Undefined instruction
    jr   nz, label_DD7A4
    ld   [label_2066], sp
    stop
    ld   l, b
    jr   nz, label_DD79C

label_DD79C::
    db   $FC ; Undefined instruction
    inc  d
    nop
    nop

label_DD7A0::
    inc  b
    ld   d, $00
    nop

label_DD7A4::
    inc  c
    jr   label_DD7A7

label_DD7A7::
    db   $10 ; Undefined instruction
    ld   a, [de]
    nop
    db   $10 ; Undefined instruction
    inc  e
    nop
    db   $10 ; Undefined instruction
    ld   e, $00

label_DD7B3::
    ld   e, e
    ld   d, a
    ld   l, e
    ld   d, a
    ld   e, e
    ld   d, a
    add  a, e
    ld   d, a
    sbc  a, e
    ld   d, a

label_DD7BD::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   label_DD7C3

label_DD7C3::
    nop
    ld   a, [bc]
    nop
    db   $10 ; Undefined instruction
    inc  c
    nop
    ld   [label_E10], sp
    nop
    ld   [label_1018], sp
    nop
    nop
    nop
    inc  e
    nop
    db   $10 ; Undefined instruction
    ld   e, $00
    ld   [label_2010], sp
    nop
    ld   [label_2218], sp
    nop

label_DD7E2::
    jp   nz, label_D257
    ld   d, a
    nop
    nop
    ld   e, $00
    nop
    ld   [$0020], sp
    nop
    db   $10 ; Undefined instruction
    nop
    stop
    inc  h
    nop
    db   $10 ; Undefined instruction
    ld   h, $00
    db   $10 ; Undefined instruction
    jr   z, label_DD7FE

label_DD7FE::
    db   $10 ; Undefined instruction
    ld   a, [hli]
    nop
    ld   [$0000], sp
    nop
    ld   [label_208], sp
    nop
    ld   [label_410], sp
    nop
    jr   label_DD810

label_DD810::
    ld   b, $00
    jr   label_DD81C
    ld   [$0000], sp
    nop
    inc  c
    nop
    nop
    ld   [$000E], sp
    nop
    db   $10 ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    ld   a, [bc]
    nop
    stop
    ld   [de], a
    nop
    db   $10 ; Undefined instruction
    inc  d
    nop
    db   $10 ; Undefined instruction
    ld   d, $00
    nop
    nop
    inc  c
    nop
    nop
    ld   [$000E], sp
    nop
    db   $10 ; Undefined instruction
    nop
    stop
    jr   label_DD842

label_DD842::
    db   $10 ; Undefined instruction
    ld   a, [de]
    nop
    db   $10 ; Undefined instruction
    inc  e
    nop
    nop
    nop
    ld   e, $00
    nop
    ld   [$0020], sp
    nop
    db   $10 ; Undefined instruction
    nop
    stop
    inc  l
    nop
    db   $10 ; Undefined instruction
    ld   h, b
    nop
    db   $10 ; Undefined instruction
    jr   z, label_DD862

label_DD862::
    db   $10 ; Undefined instruction
    ld   a, [hli]
    nop

label_DD866::
    and  $57
    ld   [bc], a
    ld   e, b
    ld   d, $58
    ldd  [hl], a
    ld   e, b
    ld   c, d
    ld   e, b

label_DD870::
    inc  e
    inc  d
    inc  e
    jr   label_DD891
    nop
    nop
    nop
    nop
    nop
    ld   [$0002], sp
    stop
    inc  b
    nop
    db   $10 ; Undefined instruction
    ld   b, $00
    nop
    nop
    ld   [$0000], sp
    ld   [$000A], sp
    stop
    inc  c
    nop

label_DD891::
    db   $10 ; Undefined instruction
    ld   c, $00
    nop
    nop
    stop
    nop
    ld   [$0012], sp
    stop
    inc  d
    nop
    db   $10 ; Undefined instruction
    ld   d, $00
    nop
    nop
    jr   nc, label_DD8A9

label_DD8A9::
    nop
    ld   [$0032], sp
    nop
    db   $10 ; Undefined instruction
    nop
    stop
    ld   [hl], $00
    db   $10 ; Undefined instruction
    jr   c, label_DD8B9

label_DD8B9::
    db   $10 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    nop
    ld   [hl], l
    ld   e, b
    add  a, l
    ld   e, b
    sub  a, l
    ld   e, b
    and  l
    ld   e, b
    nop
    stop
    jr   nz, label_DD8CA

label_DD8CA::
    ld   [label_2002], sp
    nop
    nop
    inc  b
    jr   nz, label_DD8E2
    ld   [label_2006], sp
    nop
    db   $10 ; Undefined instruction
    jr   nz, label_DD8DA

label_DD8DA::
    ld   [label_200A], sp
    nop
    nop
    inc  c
    jr   nz, label_DD8F2

label_DD8E2::
    db   $10 ; Undefined instruction
    jr   nz, label_DD8F6
    ld   [label_2010], sp
    stop
    ld   [de], a
    jr   nz, label_DD8EE

label_DD8EE::
    db   $10 ; Undefined instruction
    jr   nz, label_DD8F2

label_DD8F2::
    ld   [label_200A], sp
    nop

label_DD8F6::
    nop
    inc  c
    jr   nz, label_DD90A
    db   $10 ; Undefined instruction
    jr   nz, label_DD90E
    ld   [label_207C], sp
    stop
    ld   a, [hl]
    jr   nz, label_DD906

label_DD906::
    nop
    inc  d
    nop
    nop

label_DD90A::
    ld   [$0016], sp
    nop

label_DD90E::
    db   $10 ; Undefined instruction
    nop
    stop
    ld   a, [de]
    nop
    db   $10 ; Undefined instruction
    inc  e
    nop
    db   $10 ; Undefined instruction
    ld   e, $00
    nop
    nop
    jr   nz, label_DD921

label_DD921::
    nop
    ld   [$0022], sp
    nop
    db   $10 ; Undefined instruction
    nop
    stop
    ld   h, $00
    db   $10 ; Undefined instruction
    ld   d, d
    nop
    db   $10 ; Undefined instruction
    ld   d, h
    nop

label_DD935::
    push bc
    ld   e, b
    push de
    ld   e, b
    push bc
    ld   e, b
    db   $ED ; Undefined instruction
    ld   e, b
    dec  b
    ld   e, c
    dec  e
    ld   e, c

label_DD941::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   label_DD95F
    nop
    cp   $54
    nop
    nop
    ld   b, $56
    nop
    nop
    ld   c, $58
    nop
    rrca
    nop
    ld   e, d
    nop

label_DD957::
    rrca
    rlca
    ld   e, d
    jr   nz, label_DD957
    nop
    ld   e, h
    nop

label_DD95F::
    ei
    ld   [$005E], sp
    ei
    db   $10 ; Undefined instruction
    nop
    dec  bc
    nop
    ld   h, d
    nop
    dec  bc
    ld   [$0064], sp
    dec  bc
    db   $10 ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   b, b
    nop
    db   $FC ; Undefined instruction
    ld   [$0042], sp
    db   $FC ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    inc  c
    nop
    ld   b, [hl]
    nop
    inc  c
    ld   [$0048], sp
    inc  c
    db   $10 ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    ld   l, b
    nop
    db   $FC ; Undefined instruction
    ld   [$006A], sp
    db   $FC ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    inc  c
    nop
    ld   l, [hl]
    nop
    inc  c
    ld   [$0070], sp
    inc  c
    db   $10 ; Undefined instruction
    nop
    nop
    ld   [bc], a
    ld   c, h
    nop
    nop
    ld   a, [bc]
    ld   c, [hl]
    nop
    nop
    ld   [de], a
    ld   d, b
    nop
    db   $10 ; Undefined instruction
    ld   d, d
    nop

label_DD9B3::
    db   $10 ; Undefined instruction
    ld   d, d
    jr   nz, label_DD9B3
    rst  $38
    ld   [hl], h
    nop
    ei
    rlca
    db   $76 ; Halt
    nop
    ei
    rrca
    ld   a, b
    nop
    dec  bc
    rst  $38
    ld   a, d
    nop
    dec  bc
    rlca
    ld   a, h
    nop
    dec  bc
    rrca
    ld   a, [hl]
    nop

label_DD9CF::
    ld   b, a
    ld   e, c
    ld   e, e
    ld   e, c
    ld   [hl], e
    ld   e, c
    ld   e, e
    ld   e, c
    adc  a, e
    ld   e, c
    and  e
    ld   e, c
    or   a
    ld   e, c

label_DD9DD::
    inc  d
    jr   label_DD9F8
    jr   label_DD9FA
    inc  d
    jr   label_DD9E5

label_DD9E5::
    db   $10 ; Undefined instruction
    ld   hl, label_800
    ld   [hl], $21
    nop
    nop
    jr   c, label_DDA11
    db   $10 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    ld   hl, label_810
    inc  a
    ld   hl, $0010

label_DD9FA::
    ld   a, $21
    nop
    db   $10 ; Undefined instruction
    ld   hl, label_800
    ld   a, [hli]
    ld   hl, $0000
    inc  l
    ld   hl, label_1010
    ld   l, $21
    db   $10 ; Undefined instruction
    jr   nc, label_DDA31
    stop
    ldd  [hl], a
    ld   hl, label_1000
    jr   z, label_DDA39
    nop
    ld   [label_212A], sp
    nop
    nop
    inc  l
    ld   hl, label_1010
    ld   [hl], b
    ld   hl, label_810
    ld   [hl], d
    ld   hl, $0010
    ld   [hl], h
    ld   hl, $0000
    jr   nz, label_DDA31
    nop

label_DDA31::
    ld   [$0122], sp
    nop
    rrca
    ldi  [hl], a
    ld   hl, label_1700
    jr   nz, label_DDA5D
    stop
    inc  h
    ld   bc, label_810
    ld   h, $01
    db   $10 ; Undefined instruction
    ld   h, $21
    db   $10 ; Undefined instruction
    inc  h
    ld   hl, label_DD9E4
    db   $FC ; Undefined instruction
    ld   e, c
    db   $E4 ; Undefined instruction
    ld   e, c
    inc  d
    ld   e, d
    inc  l
    ld   e, d

label_DDA56::
    jr   label_DDA70
    jr   label_DDA72
    jr   nz, label_DDA5C

label_DDA5C::
    nop

label_DDA5D::
    nop
    ld   bc, label_800
    ld   [bc], a
    inc  bc
    nop
    db   $10 ; Undefined instruction
    inc  bc
    stop
    ld   b, $01
    db   $10 ; Undefined instruction
    ld   [label_1001], sp

label_DDA70::
    ld   [$0124], sp
    nop
    nop
    ld   [de], a
    ld   bc, label_800
    inc  d
    inc  bc
    nop
    db   $10 ; Undefined instruction
    inc  bc
    stop
    jr   label_DDA84
    db   $10 ; Undefined instruction
    ld   a, [de]
    ld   bc, label_810
    ld   h, $01

label_DDA8B::
    ld   e, e
    ld   e, d
    ld   [hl], e
    ld   e, d
    nop
    nop
    adc  a, h
    inc  bc
    nop
    ld   [label_38E], sp
    nop
    ld   [label_2388], sp
    nop
    nop
    adc  a, d
    inc  hl
    nop
    ld   [label_238C], sp
    nop
    nop
    adc  a, [hl]
    inc  hl

label_DDAA7::
    adc  a, a
    ld   e, d
    sub  a, a
    ld   e, d
    sbc  a, a
    ld   e, d
    nop
    nop
    adc  a, [hl]
    inc  hl
    nop
    ld   [label_238C], sp
    nop
    nop
    adc  a, d
    inc  hl
    nop
    ld   [label_2388], sp
    nop
    nop
    adc  a, h
    inc  bc
    nop
    ld   [label_38E], sp
    nop
    nop
    adc  a, b
    inc  bc
    nop
    ld   [label_38A], sp
    nop
    nop
    add  a, b
    inc  bc
    nop
    ld   [label_382], sp
    nop
    nop
    add  a, h
    inc  bc
    nop
    ld   [label_386], sp

label_DDADD::
    xor  l
    ld   e, d
    or   l
    ld   e, d
    cp   l
    ld   e, d
    push bc
    ld   e, d
    call label_D55A
    ld   e, d

label_DDAE9::
    nop
    nop
    ld   h, h
    ld   bc, label_800
    ld   h, [hl]
    ld   bc, label_1000
    ld   l, b
    ld   bc, label_810
    ld   l, d
    ld   bc, label_1010
    ld   l, h
    ld   bc, $0000
    inc  [hl]
    ld   bc, label_800
    ld   [hl], $01
    nop
    db   $10 ; Undefined instruction
    ld   bc, $0010
    db   $3A ; ldd  a, [hl]
    ld   bc, label_810
    inc  a
    ld   bc, label_1010
    ld   a, $01
    nop
    nop
    inc  [hl]
    ld   bc, label_800
    ld   [hl], $01
    nop
    db   $10 ; Undefined instruction
    ld   bc, $0010
    ld   c, h
    ld   bc, label_810
    ld   c, [hl]
    ld   bc, label_1010
    ld   d, b
    ld   bc, $0000
    ld   e, b
    ld   bc, label_800
    ld   e, d
    ld   bc, label_1000
    ld   e, h
    ld   bc, $0010
    ld   e, [hl]
    ld   bc, label_810
    ld   h, b
    ld   bc, label_1010
    ld   h, d
    ld   bc, $0000
    ld   l, [hl]
    ld   bc, label_800
    ld   [hl], b
    ld   bc, label_1000
    ld   [hl], d
    ld   bc, $0010
    ld   [hl], h
    ld   bc, label_810
    db   $76 ; Halt
    ld   bc, label_1010
    ld   a, b
    ld   bc, label_DDAE9
    db   $FD ; Undefined instruction

label_DDB60::
    ld   e, d
    jp   hl
    ld   e, d
    dec  d
    ld   e, e
    dec  l
    ld   e, e
    ld   b, l
    ld   e, e

label_DDB69::
    inc  d
    jr   label_DDB80
    jr   label_DDB86
    jr   label_DDB60
    db   $F4 ; Undefined instruction
    ld   a, $01
    ld   a, [$FFFC]
    ld   b, b
    ld   bc, label_4F0
    ld   b, d
    ld   bc, $F400
    ld   b, h
    ld   bc, $FC00
    ld   b, [hl]
    ld   bc, label_400
    ld   c, b

label_DDB86::
    ld   bc, $F4F0
    ld   c, d
    ld   bc, $FCF0
    ld   c, h
    ld   bc, label_4F0
    ld   c, [hl]
    ld   bc, $F400
    ld   d, b
    ld   bc, $FC00
    ld   d, d
    ld   bc, label_400
    ld   d, h
    ld   bc, $F4F0
    ld   b, d
    ld   hl, $FCF0
    ld   b, b
    ld   hl, label_4F0
    ld   a, $21
    nop
    db   $F4 ; Undefined instruction
    ld   c, b
    ld   hl, $FC00
    ld   b, [hl]
    ld   hl, label_400
    ld   b, h
    ld   hl, $F4F0
    ld   c, [hl]
    ld   hl, $FCF0
    ld   c, h
    ld   hl, label_4F0
    ld   c, d
    ld   hl, $F400
    ld   d, h
    ld   hl, $FC00
    ld   d, d
    ld   hl, label_400
    ld   d, b
    ld   hl, $F0F0
    ld   l, $01
    ld   a, [$FFF8]
    jr   nc, label_DDBD8
    ld   a, [$FF00]
    jr   nc, label_DDBFC
    ld   a, [$FF08]
    ld   l, $21
    nop
    ld   a, [$FF32]
    ld   bc, $F800
    inc  [hl]
    ld   bc, $0000
    inc  [hl]
    ld   hl, label_800
    ldd  [hl], a
    ld   hl, $F0F0
    ld   [hl], $01
    ld   a, [$FFF8]
    jr   c, label_DDBF8
    ld   a, [$FF00]
    jr   c, label_DDC1C
    ld   a, [$FF08]
    ld   [hl], $21
    nop
    ld   a, [$FF3A]
    ld   bc, $F800
    inc  a
    ld   bc, $0000
    inc  a
    ld   hl, label_800
    db   $3A ; ldd  a, [hl]
    ld   hl, $F0F0
    ld   d, [hl]
    ld   bc, $F8F0
    ld   e, b
    ld   bc, $00F0
    ld   e, b
    ld   hl, label_8F0
    ld   d, [hl]
    ld   hl, $F000
    ld   e, d
    ld   bc, $F800
    ld   e, h
    ld   bc, $0000
    ld   e, h
    ld   hl, label_800
    ld   e, d
    ld   hl, $E6E4
    ld   a, h
    jr   nz, label_DDC18
    xor  $7A
    jr   nz, label_DDC1C
    ld   a, [bc]
    ld   a, d
    nop
    db   $E4 ; Undefined instruction
    ld   [de], a
    ld   a, h
    nop
    ld   a, [$FFF0]
    ld   d, [hl]
    ld   bc, $F8F0
    ld   e, b

label_DDC46::
    ld   bc, $00F0
    ld   e, b

label_DDC4A::
    ld   hl, label_8F0
    ld   d, [hl]
    ld   hl, $F000
    ld   e, d
    ld   bc, $F800
    ld   e, h
    ld   bc, $0000
    ld   e, h
    ld   hl, label_800
    ld   e, d
    ld   hl, $E4E2
    ld   a, h
    jr   nz, label_DDC46
    db   $EC ; Undefined instruction
    ld   a, d
    jr   nz, label_DDC4A
    inc  c
    ld   a, d
    nop
    ld  [$FF00+C], a
    inc  d
    ld   a, h
    nop

label_DDC6F::
    ld   l, a
    ld   e, e
    add  a, a
    ld   e, e
    sbc  a, a
    ld   e, e
    or   a
    ld   e, e
    rst  8
    ld   e, e
    rst  $28
    ld   e, e
    rrca
    ld   e, h
    ccf
    ld   e, h

label_DDC7F::
    jr   label_DDC99
    jr   label_DDC9B
    jr   nz, label_DDCA5
    jr   nc, label_DDCB7
    nop
    nop
    jr   label_DDC8C
    nop

label_DDC8C::
    ld   [$011A], sp
    nop
    db   $10 ; Undefined instruction
    ld   bc, $0010
    ld   e, $01
    db   $10 ; Undefined instruction

label_DDC99::
    jr   nz, label_DDC9C

label_DDC9B::
    db   $10 ; Undefined instruction
    ldi  [hl], a
    ld   bc, $00F8
    inc  h
    ld   bc, label_8F8

label_DDCA5::
    ld   h, $01
    ld    hl, sp+$10
    jr   z, label_DDCAC
    ld   [label_2A00], sp
    ld   bc, label_808
    inc  l
    ld   bc, label_1008
    ld   l, $01

label_DDCB7::
    add  a, a
    ld   e, h
    sbc  a, a
    ld   e, h
    nop
    nop
    inc  c
    inc  bc
    nop
    ld   [label_30E], sp
    nop
    nop
    ld   [$0003], sp
    ld   [label_30B], sp
    nop
    nop
    nop
    inc  bc
    nop
    ld   [label_302], sp
    nop
    nop
    inc  b
    inc  bc
    nop
    ld   [label_306], sp

label_DDCDB::
    cp   e
    ld   e, h
    jp   label_CB5C
    ld   e, h
    db   $D3 ; Undefined instruction
    ld   e, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_DEA10::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_DFE34::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
