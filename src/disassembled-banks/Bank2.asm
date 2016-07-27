section "bank2",romx,bank[$02]

label_8000::
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
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
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   [label_808], sp
    ld   [label_909], sp
    add  hl, bc
    add  hl, bc
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   [label_808], sp
    ld   [label_909], sp
    add  hl, bc
    add  hl, bc
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   [label_808], sp
    ld   [label_909], sp
    add  hl, bc
    add  hl, bc
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   [label_808], sp
    ld   [label_409], sp
    inc  b
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
    dec  b
    dec  b
    inc  b
    inc  b
    inc  b
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
    dec  b
    dec  b
    inc  b
    inc  b
    inc  b
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
    dec  b
    dec  b
    inc  b
    inc  b
    inc  b
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
    dec  bc
    dec  bc
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
    dec  bc
    dec  bc
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
    dec  b
    dec  b

label_8100::
    inc  d
    dec  d
    ld   d, $17
    ld   c, e
    ld   e, b
    ld   e, e
    ld   e, d
    ld   [de], a
    ld   h, c
    ld   h, $26
    ld   h, $26
    rlca
    ld   [bc], a
    ld   a, [bc]
    ld   h, $0A
    ld   d, e
    inc  de
    ld   a, $1F
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [bc]
    ld   c, b
    ld   h, $00
    nop
    ld   bc, $0100
    nop
    nop
    ld   bc, $0000
    ld   bc, $0101
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
    ld   bc, $0100
    nop
    ld   a, [$FFBC]
    and  a
    jr   z, label_814F
    xor  a
    ld   [$FFBC], a
    ret

label_814F::
    ld   d, $1D
    ld   a, [$DB4E]
    and  a
    jp   z, label_81A2
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, label_8000
    add  hl, de
    ld   d, [hl]
    ld   a, d
    xor  a
    ld   [$FFB1], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_81A2
    ld   d, $18
    ld   a, [$D46C]
    and  a
    jr   nz, label_81A6
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_817E
    ld   a, $09
    jr   label_818C

label_817E::
    cp   $10
    jr   nz, label_818C
    ld   d, a
    ld   a, [$FFF6]
    cp   $B5
    ld   a, d
    jr   nz, label_818C
    ld   a, $0F

label_818C::
    ld   e, a
    ld   d, $00
    ld   hl, label_8100
    add  hl, de
    ld   d, [hl]
    ld   a, [$FFF9]
    and  a
    jr   z, label_81A6
    ld   a, e
    cp   $0A
    jr   nc, label_81A6
    ld   a, $21
    jr   label_81A7

label_81A2::
    xor  a
    ld   [$D46C], a

label_81A6::
    ld   a, d

label_81A7::
    ld   e, a
    ld   d, $00
    ld   [$FFB0], a
    call label_27C3
    ld   a, e
    cp   $25
    jr   nc, label_81BC
    ld   hl, label_8120
    add  hl, de
    ld   a, [hl]
    and  a
    jr   nz, label_81CF

label_81BC::
    ld   a, [$D47C]
    and  a
    jr   z, label_81CF
    ld   a, $49
    ld   [$D368], a
    ld   [$FFBD], a
    ld   [$FFBF], a
    xor  a
    ld   [$C1CF], a

label_81CF::
    ret
    push bc
    ld   a, $07
    call label_3B86
    jr   c, label_81FA
    ld   hl, $C280
    add  hl, de
    dec  [hl]
    ld   a, [$FFCE]
    and  $F0
    add  a, $08
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFCD]
    and  $F0
    add  a, $10
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   a, [$FFDF]
    ld   [hl], a

label_81FA::
    pop  bc
    ret
    ld   hl, $C146
    ld   a, [$C166]
    or   [hl]
    ld   hl, $C1A4
    or   [hl]
    ret  nz
    ld   [$C5A4], a
    ld   [$C5A5], a
    call label_CBE
    ld   a, [$DB49]
    and  $07
    jr   z, label_8241
    ld   a, [$DB4A]
    cp   $01
    jr   z, label_822D
    cp   $02
    jr   z, label_8237
    ld   a, $DC
    ld   [$C166], a
    ld   a, $09
    ld   [$FFF3], a
    ret

label_822D::
    ld   a, $D0
    ld   [$C166], a
    ld   a, $0B
    ld   [$FFF3], a
    ret

label_8237::
    ld   a, $BB
    ld   [$C166], a
    ld   a, $0A
    ld   [$FFF3], a
    ret

label_8241::
    ld   a, $D0
    ld   [$C166], a
    ld   a, $15
    ld   [$FFF3], a
    ret
    ret

label_824C::
    jr   nc, label_821E
    nop

label_824F::
    nop

label_8250::
    nop
    nop
    ret  nc
    jr   nc, label_824F
    ld   b, [hl]
    pop  bc
    and  a
    jr   nz, label_8286
    ld   a, $03
    call label_142F
    jr   c, label_8286
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $2A
    ld   hl, $C3B0
    add  hl, de
    xor  a
    ld   [hl], a
    ld   a, [$FF9E]
    ld   c, a
    ld   b, $00
    ld   hl, label_824C
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, label_8250
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a

label_8286::
    ret
    ld   a, [$C14C]
    and  a
    jr   z, label_8291
    dec  a
    ld   [$C14C], a

label_8291::
    ld   a, [$C1C4]
    and  a
    jr   z, label_829B
    dec  a
    ld   [$C1C4], a

label_829B::
    ld   a, [$C1C0]
    and  a
    jr   z, label_82A5
    dec  a
    ld   [$C1C0], a

label_82A5::
    call label_836C
    ld   a, [$C16E]
    and  a
    jr   z, label_82B2
    dec  a
    ld   [$C16E], a

label_82B2::
    ld   a, [$FFA1]
    cp   $02
    jr   nz, label_82C7
    xor  a
    ld   [$FFA1], a
    ld   [$FF9A], a
    ld   [$FF9B], a
    ld   [$FFA3], a
    call label_8A16
    jp   label_B53A

label_82C7::
    call label_1A50
    xor  a
    ld   [$FFA1], a
    call label_1F61
    call label_1177
    call label_84ED
    call label_834A
    call label_878C
    call label_8B49
    call label_1794
    call label_8338
    call label_8A16
    ld   a, [$C124]
    and  a
    jr   nz, label_8315
    ld   a, [$C137]
    ld   [$C16A], a
    cp   $05
    jr   nz, label_8316
    ld   a, [$C14A]
    and  a
    jr   nz, label_8333
    xor  a
    ld   [$C137], a
    ld   a, [$C122]
    cp   $28
    jr   z, label_8315
    inc  a
    ld   [$C122], a
    cp   $28
    jr   nz, label_8315
    ld   a, $04
    ld   [$FFF2], a

label_8315::
    ret

label_8316::
    ld   a, [$C1AD]
    cp   $01
    jr   z, label_8333
    ld   a, [$C122]
    cp   $28
    jr   nz, label_8333
    ld   a, [$C16E]
    and  a
    jr   nz, label_8337
    ld   a, $20
    ld   [$C121], a
    ld   a, $03
    ld   [$FFF4], a

label_8333::
    xor  a
    ld   [$C122], a

label_8337::
    ret

label_8338::
    ld   a, [$C15C]
    cp   $02
    jr   c, label_8345
    ld   [$FF9D], a
    ld   a, $01
    ld   [$FFA1], a

label_8345::
    ret

label_8346::
    ld   de, label_F10
    ld   c, $FA
    sbc  a, e
    pop  bc
    and  $7F
    jr   z, label_8367
    ld   a, [$C19B]
    dec  a
    ld   [$C19B], a
    and  $7F
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, label_8346
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    ret

label_8367::
    xor  a
    ld   [$C19B], a
    ret

label_836C::
    ld   a, [$FFF9]
    and  a
    jr   z, label_83BA
    ld   a, [$C17B]
    and  a
    jr   nz, label_83BA
    jp   label_A8B7

label_837A::
    ld   a, [$FFCB]
    and  $0F
    or   e
    ld   e, a
    ld   hl, label_88C5
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, label_88E5
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a
    ret

label_838F::
    ld   a, [$FFCB]
    and  $0F
    or   e
    ld   e, a
    ld   hl, label_88C5
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF9A
    sub  a, [hl]
    jr   z, label_83A7
    inc  [hl]
    bit  7, a
    jr   z, label_83A7
    dec  [hl]
    dec  [hl]

label_83A7::
    ld   hl, label_88E5
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF9B
    sub  a, [hl]
    jr   z, label_83B9
    inc  [hl]
    bit  7, a
    jr   z, label_83B9
    dec  [hl]
    dec  [hl]

label_83B9::
    ret

label_83BA::
    ld   a, [$DBAE]
    ld   [$D46B], a
    call label_84C2
    ld   a, [$FFA2]
    and  a
    jr   nz, label_83CE
    ld   a, [$FFA1]
    and  a
    jp   nz, label_84B5

label_83CE::
    ld   a, [$C14A]
    and  a
    jr   z, label_8402
    ld   a, [$FFCC]
    and  $0F
    jr   z, label_83E6
    ld   e, a
    ld   d, $00
    ld   hl, label_8905
    add  hl, de
    ld   a, [$FF9E]
    cp   [hl]
    jr   nz, label_83F4

label_83E6::
    ld   a, [$C120]
    add  a, $02
    ld   [$C120], a
    call label_1756
    jp   label_8464

label_83F4::
    ld   [$C19A], a
    ld   a, [$C199]
    add  a, $0C
    ld   [$C199], a
    call label_CAF

label_8402::
    ld   a, [$C146]
    and  a
    jp   nz, label_8464
    ld   e, $00
    ld   d, $00
    ld   a, [$D47C]
    cp   $01
    jr   nz, label_8416
    ld   e, $10

label_8416::
    ld   a, [$C17B]
    and  a
    jr   label_8427
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_8427
    call label_838F
    jr   label_842A

label_8427::
    call label_837A

label_842A::
    ld   a, [$C17B]
    and  a
    jr   z, label_843A
    ld   hl, $FF9A
    sla  [hl]
    ld   hl, $FF9B
    sla  [hl]

label_843A::
    ld   a, e
    and  $0F
    ld   e, a
    jr   z, label_8459
    ld   hl, $C120
    inc  [hl]
    ld   hl, label_8905
    add  hl, de
    ld   a, [hl]
    cp   $0F
    jr   z, label_8464
    ld   e, a
    ld   a, [$C16E]
    and  a
    ld   a, e
    jr   nz, label_8457
    ld   [$FF9E], a

label_8457::
    jr   label_8464

label_8459::
    ld   a, [$C14B]
    and  a
    jr   nz, label_8464
    ld   a, $07
    ld   [$C120], a

label_8464::
    ld   e, $03
    ld   a, [$C117]
    and  a
    jr   nz, label_84A2
    ld   e, $01
    ld   a, [$C15C]
    and  a
    jr   z, label_8481
    ld   a, [$C5A8]
    cp   $D5
    jr   nz, label_8481
    ld   a, [$C146]
    and  a
    jr   nz, label_84A2

label_8481::
    ld   a, [$FFB2]
    and  a
    jr   nz, label_84A2
    ld   hl, $C11F
    ld   a, [hl]
    and  a
    jr   z, label_84AD
    cp   $07
    jr   nz, label_84A9
    ld   a, [$C17B]
    and  a
    jr   nz, label_84AD
    ld   e, $01
    ld   a, [$C1BB]
    cp   $18
    jr   c, label_84A2
    ld   e, $07

label_84A2::
    ld   a, [$FFE7]
    and  e
    jr   nz, label_84B5
    jr   label_84AD

label_84A9::
    ld   a, [$FFE7]
    and  [hl]
    ret  z

label_84AD::
    ld   a, [$C14F]
    and  a
    ret  nz
    call label_21A8

label_84B5::
    ld   a, [$C11F]
    ld   [$C130], a
    xor  a
    ld   [$C11F], a
    jp   label_AC75

label_84C2::
    ld   a, [$C13E]
    and  a
    ret  z
    dec  a
    ld   [$C13E], a
    call label_21A8
    call label_AC75
    ld   a, [$C133]
    and  a
    jr   z, label_84E3
    and  $03
    jr   z, label_84E0
    xor  a
    ld   [$FF9B], a
    jr   label_84E3

label_84E0::
    xor  a
    ld   [$FF9A], a

label_84E3::
    pop  af
    jp   label_1794

label_84E7::
    nop
    ld   a, [$FF10]
    nop
    rst  $38
    ld   bc, label_86FA
    pop  bc
    and  a
    jp   z, label_85AC
    ld   a, [$FFF9]
    and  a
    jp   nz, label_85AC

label_84FA::
    call label_21E1
    ld   a, [$FFA3]
    sub  a, $02
    ld   [$FFA3], a
    ld   a, $FF
    ld   [$C120], a
    ld   a, [$C10A]
    ld   hl, $C14A
    or   [hl]
    jr   nz, label_8563
    ld   a, [$D475]
    and  a
    jr   nz, label_851E
    ld   a, [$C1AD]
    cp   $80
    jr   nz, label_8523

label_851E::
    call label_178E
    jr   label_8563

label_8523::
    ld   a, [$FFCB]
    and  $03
    jr   z, label_8542
    ld   e, a
    ld   d, $00
    ld   hl, label_A8B1
    add  hl, de
    ld   a, [$FF9A]
    sub  a, [hl]
    jr   z, label_8542
    ld   e, $01
    bit  7, a
    jr   nz, label_853D
    ld   e, $FF

label_853D::
    ld   a, [$FF9A]
    add  a, e
    ld   [$FF9A], a

label_8542::
    ld   a, [$FFCB]
    rra
    rra
    and  $03
    jr   z, label_8563
    ld   e, a
    ld   d, $00
    ld   hl, label_84E7
    add  hl, de
    ld   a, [$FF9B]
    sub  a, [hl]
    jr   z, label_8563
    ld   e, $01
    bit  7, a
    jr   nz, label_855E
    ld   e, $FF

label_855E::
    ld   a, [$FF9B]
    add  a, e
    ld   [$FF9B], a

label_8563::
    ld   a, [$FFA2]
    and  a
    jr   z, label_856C
    and  $80
    jr   z, label_85AC

label_856C::
    call label_CB6
    ld   [$FFA2], a
    ld   [$C149], a
    ld   [$FFA3], a
    ld   [$C146], a
    ld   [$C152], a
    ld   [$C153], a
    ld   [$C10A], a
    ld   a, [$FF99]
    cp   $88
    jr   nc, label_85AC
    call label_B5BD
    ld   a, [$FFB8]
    cp   $61
    jr   z, label_85AC
    ld   a, [$C181]
    cp   $05
    jr   z, label_85AD
    cp   $07
    jr   z, label_85AC
    cp   $0B
    jr   z, label_85AC
    cp   $50
    jr   z, label_85AC
    cp   $51
    jr   z, label_85AC
    ld   a, $07
    ld   [$FFF4], a

label_85AC::
    ret

label_85AD::
    ld   a, [$FF99]
    ld   [$FFD8], a
    ld   a, [$FF98]
    ld   [$FFD7], a
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, $0C
    jp   label_CC7

label_85BE::
    nop
    nop
    ld   [$0006], sp
    ld   b, $00
    nop
    ld   [$000A], sp
    ld   a, [bc]
    nop
    nop
    ld   [$0010], sp
    stop
    nop
    ld   [$0008], sp
    ld   [$0000], sp
    dec  b
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    nop
    dec  b
    ld   a, [bc]
    nop
    ld   a, [bc]
    nop
    nop
    dec  b
    ld   [label_800], sp
    nop
    nop
    dec  b
    ld   [label_800], sp

label_85EE::
    nop
    nop
    ld   [$0008], sp
    ld   [$0000], sp
    ld   [$0008], sp
    ld   [$0000], sp
    ld   [$0008], sp
    ld   [$0000], sp
    ld   [$0008], sp
    ld   [$0000], sp
    dec  b
    ld   [label_800], sp
    nop
    nop
    dec  b
    ld   [label_800], sp

label_8612::
    nop
    nop
    dec  b
    ld   [label_800], sp
    nop
    nop
    dec  b
    ld   [label_800], sp

label_861E::
    nop
    ld   b, $07
    nop
    ld   bc, $0000
    ld   b, $05
    inc  b
    inc  bc
    inc  b
    nop
    nop
    rlca
    ld   b, $05
    ld   b, $00
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0002
    jr   label_8652
    ld   de, rNR11
    nop
    ld   d, $17
    db   $10 ; Undefined instruction
    rst  $38
    nop
    inc  d
    dec  d
    rrca
    rrca
    rst  $38
    nop
    ld   [de], a
    inc  de
    ld   c, $0E
    rst  $38

label_864E::
    nop
    nop
    dec  c
    inc  de

label_8652::
    db   $10 ; Undefined instruction
    nop
    ld    hl, sp+$F3
    db   $ED ; Undefined instruction
    ld   a, [$FFF5]
    nop
    db   $10 ; Undefined instruction
    ld    hl, sp+$F5
    ld    hl, sp+$00
    ld   a, [$FFF3]
    nop
    inc  c
    nop

label_8666::
    nop
    ld   a, [$FFF3]
    nop
    inc  c
    nop
    nop
    ld   a, [$FFF3]
    nop
    inc  c
    nop
    nop
    ld    hl, sp+$F3
    ld   a, [$FFF3]
    push af
    nop
    nop
    dec  c
    db   $10 ; Undefined instruction
    dec  c

label_867E::
    nop
    nop
    nop
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_8696::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc

label_86AD::
    nop
    inc  bc
    inc  bc
    ld   [$0101], sp
    ld   bc, label_A101
    ld   h, d
    ld   h, e
    nop
    ld   e, [hl]
    ld   e, a
    ld   h, b
    nop
    ld   h, a
    ld   l, b
    ld   l, c
    nop
    ld   h, h
    ld   h, l
    ld   h, [hl]
    nop

label_86C5::
    nop
    inc  bc
    ld   bc, label_302
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    inc  bc
    inc  b

label_86E9::
    nop
    ld   [bc], a
    ld   [bc], a
    ld   bc, label_301
    inc  bc
    nop
    ld   bc, label_202
    nop
    nop
    inc  bc
    inc  bc
    ld   bc, $0002
    nop
    inc  bc
    inc  bc
    ld   bc, label_201
    inc  bc
    ld   bc, label_201
    ld   [bc], a
    nop
    nop
    inc  bc

label_8709::
    dec  a
    ld   [$C121], a
    ld   hl, $FFA1
    ld   [hl], $01
    srl  a
    srl  a
    ld   e, a
    ld   d, $00
    ld   a, [$FF9E]
    sla  a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   hl, label_86C9
    add  hl, de
    ld   a, [hl]
    ld   [$C137], a
    ld   hl, label_86E9
    add  hl, de
    ld   a, [$FF9E]
    push af
    ld   a, [hl]
    ld   [$FF9E], a
    call label_8827
    pop  af
    ld   [$FF9E], a
    ld   a, [$FFE7]
    and  $03
    jr   nz, label_8745
    ld   hl, $C121
    dec  [hl]

label_8745::
    ld   a, [$C121]
    and  a
    jp   z, label_88B0
    rla
    jp  c, label_88B0
    ld   a, [$FF98]
    add  a, $08
    ld   [$C140], a
    ld   a, $18
    ld   [$C141], a
    ld   [$C143], a
    ld   a, [$C145]
    add  a, $08
    ld   [$C142], a
    ld   [$C5B0], a
    ret

label_876B::
    dec  a
    ld   [$C16D], a
    jp   z, label_88B0
    ld   hl, $C16E
    ld   [hl], $04
    ld   a, [$C14A]
    and  a
    jr   nz, label_8781
    ld   a, $01
    ld   [$FFA1], a

label_8781::
    ld   a, $03
    ld   [$C137], a
    jp   label_8827

label_8789::
    jp   label_8827

label_878C::
    ld   a, [$D475]
    and  a
    jr   z, label_87A3
    ld   a, [$FFE7]
    rra
    rra
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_86C5
    add  hl, de
    ld   a, [hl]
    ld   [$FF9E], a
    ret

label_87A3::
    ld   a, [$C146]
    cp   $01
    jr   nz, label_87E0
    ld   a, [$C3CF]
    ld   hl, $C137
    or   [hl]
    jr   nz, label_87E0
    ld   a, [$FF9E]
    rla
    rla
    and  $0C
    ld   c, a
    ld   b, $00
    ld   a, [$C152]
    cp   $03
    jr   nc, label_87E0
    ld   e, a
    ld   d, $00
    ld   hl, label_86B5
    add  hl, de
    add  hl, bc
    ld   a, [hl]
    ld   [$FF9D], a
    ld   a, [$C153]
    inc  a
    ld   [$C153], a
    and  $07
    jr   nz, label_87E0
    ld   a, [$C152]
    inc  a
    ld   [$C152], a

label_87E0::
    ld   a, [$C121]
    and  a
    jp   nz, label_8709
    ld   a, [$C16D]
    and  a
    jp   nz, label_876B
    ld   a, [$C137]
    and  a
    ret  z
    ld   hl, $C16E
    ld   [hl], $04
    ld   a, [$C137]
    cp   $05
    jr   nc, label_8789
    ld   a, [$C14A]
    and  a
    jr   nz, label_8809
    ld   a, $01
    ld   [$FFA1], a

label_8809::
    ld   a, [$C138]
    and  a
    jr   nz, label_8823
    ld   a, [$C137]
    inc  a
    ld   [$C137], a
    cp   $04
    jp   z, label_88B0
    ld   c, a
    ld   b, $00
    ld   hl, label_86AD
    add  hl, bc
    ld   a, [hl]

label_8823::
    dec  a
    ld   [$C138], a

label_8827::
    ld   hl, $C137
    ld   a, [$FF9E]
    ld   e, a
    sla  a
    sla  a
    add  a, e
    add  a, e
    add  a, [hl]
    ld   c, a
    ld   b, $00
    ld   hl, label_861E
    add  hl, bc
    ld   a, [hl]
    ld   [$C136], a
    ld   hl, label_8636
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, label_884A
    ld   [$FF9D], a

label_884A::
    ld   hl, label_864E
    add  hl, bc
    ld   a, [hl]
    ld   [$C13A], a
    ld   hl, label_8666
    add  hl, bc
    ld   a, [hl]
    ld   [$C139], a
    ld   hl, label_867E
    add  hl, bc
    ld   a, [hl]
    ld   [$C13C], a
    ld   hl, label_8696
    add  hl, bc
    ld   a, [hl]
    ld   [$C13B], a
    ld   hl, label_85BE
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_88AD
    ld   a, [$C15B]
    and  a
    jr   z, label_887E
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_88AD

label_887E::
    ld   a, [$C13A]
    add  a, [hl]
    ld   hl, $FF98
    add  a, [hl]
    ld   [$C140], a
    ld   hl, label_85D6
    add  hl, bc
    ld   a, [hl]
    ld   [$C141], a
    ld   a, [$C139]
    ld   hl, label_85EE
    add  hl, bc
    add  a, [hl]
    ld   hl, $C145
    add  a, [hl]
    ld   [$C142], a
    ld   hl, label_8606
    add  hl, bc
    ld   a, [hl]
    ld   [$C143], a
    ld   a, $01
    ld   [$C5B0], a

label_88AD::
    jp   label_15A7

label_88B0::
    xor  a
    ld   [$C1AC], a
    ld   a, [$C14A]
    and  a
    jr   nz, label_88C4
    xor  a
    ld   [$C137], a
    ld   [$C16A], a
    ld   [$C121], a

label_88C4::
    ret

label_88C5::
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    inc  c
    db   $F4 ; Undefined instruction
    nop
    nop
    inc  c
    db   $F4 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    inc  d
    db   $EC ; Undefined instruction
    nop
    nop
    rrca
    pop  af
    nop
    nop
    rrca
    pop  af
    nop
    nop
    nop
    nop
    nop

label_88E5::
    nop
    nop
    nop
    nop
    ld   a, [$FFF4]
    db   $F4 ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    inc  c
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
    pop  af
    pop  af
    nop
    inc  d
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop

label_8905::
    rrca
    nop
    ld   bc, label_20F
    rrca
    rrca
    rrca
    inc  bc
    rrca
    rrca
    ld   a, [bc]
    dec  bc
    ld   b, $07
    inc  b
    dec  b
    nop
    ld   bc, label_2D2C
    ld   b, $07
    inc  [hl]
    dec  [hl]
    ldi  [hl], a
    inc  hl
    ld   a, [hli]
    dec  hl
    jr   z, label_894D
    jr   nc, label_8957
    inc  h
    dec  h
    ld   l, $2F
    ld   b, $07
    inc  [hl]
    dec  [hl]
    ldi  [hl], a
    inc  hl
    ld   a, [hli]
    dec  hl
    jr   z, label_895D
    ldd  [hl], a
    inc  sp
    ld   h, $27
    jr   nz, label_895B
    ld   e, $1F
    inc  e
    dec  e
    ld   a, [de]
    dec  de
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

label_894D::
    ld   c, e
    ld   c, h
    ld   c, l
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]
    ld   c, a
    ld   c, [hl]

label_8957::
    ld   c, a
    ld   e, e
    ld   e, h
    ld   e, b

label_895B::
    ld   e, c
    ld   e, e

label_895D::
    ld   e, h
    ld   e, b
    ld   e, c
    ld   a, $02
    ld   [$C1C4], a
    ld   a, [$FF9C]
    and  a
    jr   nz, label_89AA
    ld   a, [$FF99]
    add  a, $10
    ld   [$FF99], a
    ld   [$FFA0], a
    ld   a, [$FFA2]
    add  a, $10
    ld   [$FFA2], a

label_8978::
    ld   a, $FF
    ld   [$FF9B], a
    xor  a
    ld   [$FF9A], a
    ld   a, [$FF99]
    add  a, $08
    ld   [$FF99], a
    ld   [$FFA0], a
    ld   a, [$FFA2]
    add  a, $08
    ld   [$FFA2], a
    call label_AE45
    ld   a, [$FFAF]
    cp   $E1
    jr   z, label_8978
    cp   $61
    jr   z, label_89A0
    ld   a, [$C133]
    and  a
    jr   nz, label_8978

label_89A0::
    ld   a, $01
    ld   [$FF9C], a
    ld   a, [$FF99]
    sub  a, $03
    ld   [$FF99], a

label_89AA::
    call label_84FA
    ld   a, [$FFA2]
    and  a
    jr   nz, label_89B6
    xor  a
    ld   [$C11C], a

label_89B6::
    ld   a, $01
    ld   [$C146], a
    call label_1177
    call label_878C
    ld   a, [$C137]
    ld   [$C16A], a
    jp   label_1794

label_89CA::
    ld   bc, $0100
    nop
    nop
    ld   bc, $0100
    ld   bc, $0001
    nop
    nop
    nop
    ld   bc, $0101
    nop
    ld   bc, $0000
    ld   bc, $0100
    ld   bc, $0001
    nop
    nop
    nop
    ld   bc, $0001
    ld   bc, $0101
    ld   bc, $0100
    ld   bc, $0101
    nop
    ld   bc, $0101
    ld   bc, $0100
    nop
    nop
    nop
    nop
    ld   bc, $0000
    nop
    nop
    ld   bc, $0000
    nop
    nop
    ld   bc, $0100
    ld   bc, $0100
    nop

label_8A10::
    nop
    ld   bc, $F808

label_8A14::
    ld   b, $01

label_8A16::
    ld   a, [$C166]
    and  a
    ret  z
    ld   hl, $FFA1
    ld   [hl], $02
    cp   $FF
    jr   nz, label_8A7C
    ld   a, [$D210]
    add  a, $01
    ld   [$D210], a
    ld   a, [$D211]
    adc  a, $00
    ld   [$D211], a
    cp   $08
    jr   nz, label_8A53
    ld   a, [$D210]
    cp   $D0
    jr   nz, label_8A53
    xor  a
    ld   [$C166], a
    ld   [$C167], a
    ld   a, $03
    ld   [$C5A3], a
    ld   a, [$D465]
    cp   $47
    ret  z
    jr   label_8A6C

label_8A53::
    ld   a, [$D465]
    cp   $47
    jr   z, label_8A7A
    ld   a, [$FFCC]
    and  $30
    jr   z, label_8A7A
    xor  a
    ld   [$C166], a
    ld   [$C167], a
    ld   a, $03
    ld   [$C5A3], a

label_8A6C::
    ld   a, [$D461]
    ld   e, a
    ld   d, b
    ld   hl, $C290
    add  hl, de
    ld   [hl], $00
    jp   label_27DD

label_8A7A::
    jr   label_8AD1

label_8A7C::
    call label_178E
    call label_CAF
    ld   hl, $C166
    dec  [hl]
    jr   nz, label_8AD1
    ld   a, [$DB73]
    and  a
    jr   z, label_8AA2
    ld   a, [$DB4A]
    cp   $01
    jr   z, label_8AB2
    ld   a, [$DBA5]
    and  a
    jr   nz, label_8AB2
    ld   a, $77
    call label_237C
    jr   label_8AB2

label_8AA2::
    ld   a, [$DB49]
    and  a
    jr   nz, label_8AB2
    ld   a, $8E
    call label_2385
    xor  a
    ld   [$C167], a
    ret

label_8AB2::
    xor  a
    ld   [$C167], a
    ld   a, [$DB4A]
    cp   $01
    jr   nz, label_8AD0
    ld   a, $02
    ld   [$C17F], a
    xor  a
    ld   [$C180], a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   a, $2C
    ld   [$FFF2], a

label_8AD0::
    ret

label_8AD1::
    ld   a, [$C5A4]
    inc  a
    ld   [$C5A4], a
    cp   $38
    jr   c, label_8AE8
    xor  a
    ld   [$C5A4], a
    ld   a, [$C5A5]
    xor  $01
    ld   [$C5A5], a

label_8AE8::
    ld   a, [$C5A5]
    ld   e, $75
    and  a
    jr   nz, label_8AF1
    inc  e

label_8AF1::
    ld   a, e
    ld   [$FF9D], a
    ld   a, $02
    ld   [$C167], a
    ld   [$C111], a
    ld   a, [$C166]
    cp   $10
    ret  c
    ld   a, [$C5A4]
    cp   $14
    jr   nz, label_8B40
    ld   a, $C9
    call label_3B86
    jr   c, label_8B40
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, de
    sub  a, $08
    ld   [hl], a
    ld   a, [$C5A5]
    ld   c, a
    ld   b, d
    ld   hl, label_8A12
    add  hl, bc
    ld   a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_8A14
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

label_8B40::
    ret

label_8B41::
    ld   [hl], c
    ld   [hl], d
    ld   l, a
    ld   [hl], b
    ld   [hl], e
    ld   [hl], h
    ld   l, l
    ld   l, [hl]

label_8B49::
    ld   a, [$C1C7]
    and  a
    jr   z, label_8BBF
    ld   a, [$FFF7]
    cp   $08
    jr   nz, label_8B64
    ld   a, [$D219]
    cp   $02
    jr   nz, label_8B64
    call label_134B
    ld   a, $01
    ld   [$C5B0], a

label_8B64::
    ld   hl, $FFA1
    ld   [hl], $01
    call label_178E
    ld   [$C137], a
    ld   [$C121], a
    ld   [$C122], a
    ld   a, [$C1C8]
    inc  a
    ld   [$C1C8], a
    cp   $10
    jr   nz, label_8B85
    push af
    call label_8BC8
    pop  af

label_8B85::
    cp   $18
    jr   nz, label_8BA9
    ld   a, [$C1C7]
    cp   $02
    jr   nz, label_8BA1
    ld   a, [$DB73]
    and  a
    jr   z, label_8BA1
    ld   a, [$C19F]
    and  a
    jr   nz, label_8BA1
    ld   a, $79
    call label_237C

label_8BA1::
    xor  a
    ld   [$C1C7], a
    ld   [$C1AC], a
    ret

label_8BA9::
    rra
    rra
    rra
    rra
    and  $01
    ld   e, a
    ld   a, [$FF9E]
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_8B41
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a

label_8BBF::
    ret

label_8BC0::
    inc  d
    db   $FC ; Undefined instruction
    ld   [label_A08], sp
    ld   a, [bc]
    db   $FC ; Undefined instruction
    inc  d

label_8BC8::
    call label_8D20
    ret  c
    ld   a, $02
    ld   [$C1C7], a
    jp   label_8C92

label_8BD4::
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_8BFA
    ld   a, $04
    ldi  [hl], a
    ld   a, $06
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
    ld   a, $07
    jr   label_8C0F

label_8BFA::
    ld   a, $6A
    ldi  [hl], a
    ld   a, $7A
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, $6B
    ldi  [hl], a
    ld   a, $7B

label_8C0F::
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ret

label_8C14::
    push de
    push hl
    ld   hl, $DC91
    ld   a, [$DC90]
    ld   e, a
    add  a, $0A
    ld   [$DC90], a
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, $81
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, [$DBA5]
    and  a
    jr   z, label_8C64
    ld   a, $04
    ldi  [hl], a
    ld   a, $06
    ldi  [hl], a
    ld   a, $05
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, $81
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, $05
    ldi  [hl], a
    ld   a, $05
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   a, $07
    jr   label_8C8B

label_8C64::
    ld   a, $6A
    ldi  [hl], a
    ld   a, $7A
    ldi  [hl], a
    ld   a, $03
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, $81
    ldi  [hl], a
    ld   [de], a
    inc  de
    ld   a, $6B
    ldi  [hl], a
    ld   a, $03
    ld   [de], a
    inc  de
    ld   [de], a
    inc  de
    ld   a, $7B

label_8C8B::
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   [de], a
    pop  de
    ret

label_8C92::
    ld   a, [$FFD8]
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    add  hl, de
    ld   [hl], $CC
    ld   a, $82
    call label_B2F
    call label_2887
    ld   hl, $D601
    ld   a, [$D600]
    ld   e, a
    add  a, $0A
    ld   [$D600], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFFE]
    and  a
    jr   nz, label_8CBE
    call label_8BD4
    jr   label_8CC1

label_8CBE::
    call label_8C14

label_8CC1::
    call label_280D
    and  $07
    jr   nz, label_8D1F
    ld   a, [$DBA5]
    and  a
    jr   nz, label_8CD3
    ld   a, [$FFF6]
    cp   $0E
    ret  z

label_8CD3::
    call label_280D
    rra
    ld   a, $2E
    jr   nc, label_8CDD
    ld   a, $2D

label_8CDD::
    call label_3B86
    jr   c, label_8D1F
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
    ld   hl, $C450
    add  hl, de
    ld   [hl], $80
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $18
    ld   hl, $C320
    add  hl, de
    ld   [hl], $20
    ld   c, e
    ld   b, d
    ld   a, $0C
    call label_3BAA
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

label_8D1F::
    ret

label_8D20::
    ld   a, [$C15C]
    ld   hl, $FFA2
    or   [hl]
    ld   hl, $C11C
    or   [hl]
    ld   hl, $FFF9
    or   [hl]
    jp   nz, label_8D95
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, label_8BC0
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   c, a
    ld   hl, label_8BC4
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   e, a
    ld   [$FFD8], a
    ld   hl, $D711
    add  hl, de
    ld   a, h
    cp   $D7
    jp   nz, label_8D95
    ld   a, [hl]
    ld   [$FFD7], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A26
    cp   $00
    jr   nz, label_8D95
    ld   a, d
    and  a
    jr   nz, label_8D8D
    ld   a, [$FFD7]
    cp   $0C
    jr   z, label_8D95
    cp   $0D
    jr   z, label_8D95
    cp   $0C
    jr   z, label_8D95
    cp   $0D
    jr   z, label_8D95
    cp   $B9
    jr   z, label_8D95
    jr   label_8D93

label_8D8D::
    ld   a, [$FFD7]
    cp   $05
    jr   nz, label_8D95

label_8D93::
    and  a
    ret

label_8D95::
    scf
    ret

label_8D97::
    ld   a, [$FFD7]
    ld   [$FFCE], a
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FFD8]
    ld   [$FFCD], a
    and  $F0
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    add  hl, de
    ld   [hl], $AE
    call label_2887
    ld   a, [$FFFE]
    and  a
    jr   z, label_8DCB
    push bc
    ld   c, $AE
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   a, $02
    call label_92E
    pop  bc

label_8DCB::
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
    ld   a, $76
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
    ld   a, $76
    ldi  [hl], a
    ld   a, $77
    ldi  [hl], a
    ld   [hl], $00
    ret

label_8DFC::
    push bc
    push de
    ld   hl, $DC50
    ld   c, $00
    di

label_8E04::
    xor  a
    ld   [rSVBK], a
    ld   b, [hl]
    ld   a, $02
    ld   [rSVBK], a
    ld   a, b
    ld   [hl], a
    inc  hl
    inc  c
    ld   a, c
    cp   $08
    jr   c, label_8E04
    xor  a
    ld   [rSVBK], a
    ei
    pop  de
    pop  bc
    ret

label_8E1C::
    rst  $38
    ld   b, a
    nop
    nop
    inc  c
    add  hl, sp
    db   $76 ; Halt
    ld   e, [hl]
    rst  $38
    ld   b, a
    nop
    nop
    ld   h, a
    jr   z, label_8EA1
    ld   e, [hl]

label_8E2C::
    push bc
    di
    ld   hl, label_8E1C
    add  hl, de
    ld   de, $DC88
    ld   c, $00

label_8E37::
    ld   a, [hli]
    ld   [de], a
    inc  de
    inc  c
    ld   a, c
    cp   $08
    jr   c, label_8E37
    ei
    ld   a, $02
    ld   [$DDD1], a
    pop  bc
    ret

label_8E48::
    di
    ld   hl, $DC88
    ld   e, $00

label_8E4E::
    ld   a, $02
    ld   [rSVBK], a
    ld   b, [hl]
    xor  a
    ld   [rSVBK], a
    ld   a, b
    ld   [hl], a
    inc  hl
    inc  e
    ld   a, e
    cp   $08
    jr   c, label_8E4E
    ei
    ld   a, $02
    ld   [$DDD1], a
    ret

label_8E66::
    ld   d, b
    ld   d, c
    ld   d, d
    ld   d, e
    ld   d, e
    ld   d, h
    ld   d, d
    ld   a, $10
    ld   [$FF99], a
    ld   a, $50
    ld   [$FF98], a
    ld   [$C167], a
    ld   a, [$C198]
    push af
    ld   d, $00
    ld   e, $08
    cp   $18
    jr   z, label_8E95
    ld   e, $00
    cp   $28
    jr   z, label_8E95
    and  a
    jr   nz, label_8E9D
    ld   a, [$FFFE]
    and  a
    jr   z, label_8E9D
    call label_8DFC

label_8E95::
    ld   a, [$FFFE]
    and  a
    jr   z, label_8E9D
    call label_8E2C

label_8E9D::
    pop  af
    rra
    rra
    rra

label_8EA1::
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, label_8E66
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    ld   a, [$C198]
    inc  a
    ld   [$C198], a
    cp   $38
    jr   c, label_8EC4
    ld   a, $FB
    ld   [$FF99], a
    ld   a, $02
    ld   [$FF9E], a
    ld   a, $04
    ld   [$FF9D], a

label_8EC4::
    ld   a, [$C198]
    cp   $48
    jr   nz, label_8EEF
    ld   a, [$FFFE]
    and  a
    jr   z, label_8ED3
    call label_8E48

label_8ED3::
    ld   a, $02
    ld   [$C125], a
    ld   a, $01
    ld   [$C124], a

label_8EDD::
    xor  a
    ld   [$C198], a
    ld   [$C167], a
    ld   [$DDD6], a
    ld   [$DDD7], a
    ld   a, $00
    ld   [$C11C], a

label_8EEF::
    ret

label_8EF0::
    nop
    ld   [$00F8], sp
    nop
    ld   b, $FA
    nop
    nop
    ld   b, $FA
    nop
    nop
    nop
    nop
    nop

label_8F00::
    nop
    db   $10 ; Undefined instruction
    nop
    nop
    inc  c
    db   $F4 ; Undefined instruction
    nop
    nop
    inc  c
    db   $F4 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop

label_8F10::
    nop
    nop
    nop
    nop
    ld    hl, sp+$FA
    ld   a, [label_800]
    ld   b, $06
    nop
    nop
    nop
    nop
    nop

label_8F20::
    nop
    nop
    nop
    nop
    ld   a, [$FFF4]
    db   $F4 ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    inc  c
    nop
    nop
    nop
    nop
    nop
    ld   a, [$C17B]
    and  a
    jr   z, label_8F3C
    ld   a, $00
    ld   [$C11C], a
    ret

label_8F3C::
    call label_CAF
    ld   [$FFA2], a
    ld   [$C146], a
    ld   [$C19B], a
    ld   [$C137], a
    ld   [$C16A], a
    ld   [$C16D], a
    ld   a, [$DBAE]
    ld   [$D46B], a
    ld   hl, $C19F
    ld   a, [$FFA1]
    or   [hl]
    jp   z, label_8F6D
    call label_178E
    ld   a, [$FFA1]
    and  a
    jr   z, label_8F6A
    xor  a
    ld   [$FFA1], a

label_8F6A::
    jp   label_1A50

label_8F6D::
    ld   a, [$FFCC]
    and  $20
    jr   z, label_8F86
    ld   a, [$FF9C]
    xor  $01
    ld   [$FF9C], a
    jr   z, label_8F86
    ld   a, $A0
    ld   [$FFB7], a
    ld   a, [$FF99]
    sub  a, $03
    call label_9928

label_8F86::
    ld   a, [$C183]
    and  a
    jr   z, label_8F92
    dec  a
    ld   [$C183], a
    jr   label_8FA1

label_8F92::
    ld   a, [$FFCC]
    and  $10
    jr   z, label_8FA1
    ld   a, $0F
    ld   [$FFF2], a
    ld   a, $20
    ld   [$C183], a

label_8FA1::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_9005
    ld   a, [$FFCB]
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_8EF0
    ld   a, [$C183]
    cp   $10
    jr   c, label_8FBB
    ld   hl, label_8F00

label_8FBB::
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF9A
    sub  a, [hl]
    jr   z, label_8FCA
    inc  [hl]
    bit  7, a
    jr   z, label_8FCA
    dec  [hl]
    dec  [hl]

label_8FCA::
    ld   hl, label_8F10
    ld   a, [$C183]
    cp   $10
    jr   c, label_8FD7
    ld   hl, label_8F20

label_8FD7::
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF9B
    sub  a, [hl]
    jr   z, label_8FE6
    inc  [hl]
    bit  7, a
    jr   z, label_8FE6
    dec  [hl]
    dec  [hl]

label_8FE6::
    ld   a, [$FF9A]
    or   [hl]
    ld   hl, $FF9C
    or   [hl]
    jr   z, label_8FF5
    ld   hl, $C120
    inc  [hl]
    jr   label_8FFA

label_8FF5::
    ld   a, $03
    ld   [$C120], a

label_8FFA::
    ld   hl, label_8905
    add  hl, de
    ld   a, [hl]
    cp   $0F
    jr   z, label_9005
    ld   [$FF9E], a

label_9005::
    call label_1A50
    ld   a, [$FFA1]
    and  a
    jr   z, label_9012
    xor  a
    ld   [$FFA1], a
    jr   label_9015

label_9012::
    call label_84AD

label_9015::
    call label_B53A
    ld   a, [$FF9C]
    and  a
    jr   z, label_9079
    ld   a, [$FFB7]
    and  a
    jr   nz, label_9024
    ld   [$FF9C], a

label_9024::
    ld   a, [$FFF7]
    and  a
    jr   z, label_9035
    cp   $1F
    jr   nz, label_907A
    ld   a, [$FFF6]
    cp   $F2
    jr   nz, label_9079
    jr   label_903B

label_9035::
    ld   a, [$FFF6]
    cp   $78
    jr   nz, label_9079

label_903B::
    ld   a, [$FF99]
    sub  a, $50
    add  a, $08
    cp   $10
    jr   nc, label_90A2
    ld   a, [$FF98]
    sub  a, $58
    add  a, $08
    cp   $10
    jr   nc, label_90A2
    ld   hl, $FFF8
    bit  5, [hl]
    jr   nz, label_9079
    set  5, [hl]
    ld   a, $35
    call label_3B86
    jr   c, label_9079
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C310
    add  hl, de
    ld   [hl], $03
    ld   hl, $C340
    add  hl, de
    res  4, [hl]

label_9079::
    ret

label_907A::
    ld   a, [$FFF6]
    cp   $8D
    jr   nz, label_90A2
    ld   a, [$FF99]
    sub  a, $50
    add  a, $08
    cp   $10
    jr   nc, label_90A2
    ld   a, [$FF98]
    sub  a, $58
    add  a, $08
    cp   $10
    jr   nc, label_90A2
    ld   a, [$FF98]
    ld   [$D404], a
    ld   a, [$C11C]
    ld   [$D463], a
    jp   label_C7D

label_90A2::
    ret
    ld   a, $01
    ld   [$FFA1], a
    call label_21A8
    call label_21E1
    ld   a, [$FF98]
    and  $F0
    cp   $E0
    jr   z, label_90BA
    ld   a, [$FFA2]
    cp   $78
    ret  c

label_90BA::
    call label_C83
    call label_178E
    ld   [$FFA2], a
    ld   [$FFA3], a
    ld   a, $70
    ld   [$DBC8], a
    ret

label_90CA::
    ld   d, l
    ld   d, [hl]
    ld   d, a
    ld   d, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, $01
    ld   [$C167], a
    ld   a, [$C198]
    inc  a
    ld   [$C198], a
    rra
    rra
    rra
    rra
    nop
    and  $0F
    cp   $06
    jr   z, label_90F6
    ld   e, a
    ld   d, $00
    ld   hl, label_90CA
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    ret

label_90F6::
    xor  a
    ld   [$C13E], a
    ld   [$C121], a
    ld   [$C122], a
    call label_92D6
    ld   a, [$DBA5]
    and  a
    jr   nz, label_912B
    ld   a, [$FFF6]
    cp   $01
    jr   z, label_911B
    cp   $95
    jr   z, label_911B
    cp   $2C
    jr   z, label_911B
    cp   $EC
    jr   nz, label_912B

label_911B::
    ld   a, $09
    ld   [$C11C], a
    ld   a, $40
    ld   [$FFB7], a
    xor  a
    ld   [$FF9C], a
    dec  a
    ld   [$FF9D], a
    ret

label_912B::
    ld   a, [$DBCB]
    cp   $50
    jr   z, label_916A
    cp   $FF
    jr   z, label_9155
    ld   a, [$D401]
    cp   $02
    jr   nz, label_9145
    ld   a, [$FF99]
    ld   [$D404], a
    xor  a
    jr   label_915C

label_9145::
    ld   a, [$FF98]
    and  $F0
    add  a, $08
    ld   [$D404], a
    ld   a, [$FF99]
    and  $F0
    ld   [$D405], a

label_9155::
    ld   a, $01
    ld   [$D475], a
    ld   a, $70

label_915C::
    ld   [$DBC8], a
    call label_178E
    ld   [$FFA3], a
    ld   [$C146], a
    jp   label_C83

label_916A::
    ld   a, [$DBA5]
    and  a
    jr   nz, label_9176
    ld   a, [$FFF6]
    cp   $1E
    jr   z, label_9155

label_9176::
    ld   a, [$FFF7]
    cp   $0A
    jr   nz, label_91AC
    ld   a, [$FFF6]
    cp   $7A
    jr   z, label_918E
    cp   $7B
    jr   z, label_918E
    cp   $7C
    jr   z, label_918E
    cp   $7D
    jr   nz, label_91AC

label_918E::
    ld   a, $00
    ld   hl, $D401
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $1A
    ldi  [hl], a
    ld   a, $68
    ldi  [hl], a
    ld   a, $56
    ldi  [hl], a
    ld   a, $24
    ld   [$DBC8], a
    ld   a, $03
    ld   [$FF9E], a
    jp   label_C83

label_91AC::
    call label_92B9
    ld   a, [$DB94]
    add  a, $04
    ld   [$DB94], a
    xor  a
    ld   [$C167], a
    ret
    ld   a, [$C1AA]
    cp   $2E
    jr   nz, label_91C7
    ld   a, $17
    ld   [$FFF2], a

label_91C7::
    call label_CAF
    ld   [$C16A], a
    ld   [$C137], a
    ld   [$C13E], a
    call label_1794
    call label_21E1
    ld   a, [$FFA3]
    sub  a, $02
    ld   [$FFA3], a
    ld   a, [$FFA2]
    and  $80
    jr   z, label_91ED
    xor  a
    ld   [$FFA2], a
    ld   [$C149], a
    ld   [$FFA3], a

label_91ED::
    ld   a, $6B
    ld   [$FF9D], a
    ld   bc, $C010
    ld   a, [$FF99]
    ld   hl, $FFA2
    sub  a, [hl]
    ld   hl, $C13B
    add  a, [hl]
    sub  a, $10
    ld   [$FFD7], a
    ld   a, [$C1A9]
    cp   $01
    jr   z, label_924F
    ld   a, [$FFD7]
    add  a, $02
    ld   [bc], a
    inc  bc
    ld   a, [$FF98]
    add  a, $00
    ld   [bc], a
    inc  bc
    ld   a, [$C1A9]
    ld   e, $AE
    cp   $05
    jr   z, label_922F
    ld   e, $8E
    cp   $03
    jr   z, label_9244
    cp   $04
    jr   nz, label_9234
    ld   e, $8C
    call label_924A
    jr   label_9237

label_922F::
    call label_923A
    jr   label_9237

label_9234::
    call label_923F

label_9237::
    inc  bc
    ld   [bc], a
    ret

label_923A::
    ld   a, e
    ld   [bc], a
    ld   a, $14
    ret

label_923F::
    ld   a, e
    ld   [bc], a
    ld   a, $14
    ret

label_9244::
    ld   a, e
    ld   [bc], a
    ld   a, $16
    jr   label_9237

label_924A::
    ld   a, e
    ld   [bc], a
    ld   a, $10
    ret

label_924F::
    ld   a, [$FF98]
    sub  a, $08
    ld   [$FFD8], a
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   [$FFDA], a
    xor  a
    ld   h, a
    ld   l, a
    ld   a, $06
    ld   [$FFD9], a
    jp   label_1819
    call label_CAF
    call label_178E
    ld   a, [$FFB7]
    and  a
    jr   nz, label_929F
    ld   [$C167], a
    ld   a, [$FF9C]
    cp   $06
    jr   nz, label_9283
    ld   a, [$DB94]
    add  a, $04
    ld   [$DB94], a

label_9283::
    xor  a
    ld   [$FF9C], a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_929C
    ld   a, [$FFF6]
    cp   $2B
    jr   nz, label_929C
    ld   a, $48
    ld   [$DBB1], a
    ld   a, $30
    ld   [$DBB2], a

label_929C::
    jp   label_92B9

label_929F::
    ld   e, $FF
    ld   a, [$FFB7]
    cp   $30
    jr   c, label_92B5
    ld   e, $4E
    cp   $40
    jr   c, label_92B5
    jr   nz, label_92B3
    ld   a, $03
    ld   [$FFF3], a

label_92B3::
    ld   e, $4C

label_92B5::
    ld   a, e
    ld   [$FF9D], a
    ret

label_92B9::
    ld   a, $40
    ld   [$DBC7], a
    ld   a, [$DBB1]
    ld   [$FF98], a
    ld   [$FF9F], a
    ld   a, [$DBB2]
    ld   [$FF99], a
    ld   [$FFA0], a
    ld   hl, $FFA2
    sub  a, [hl]
    ld   [$C145], a
    call label_8EDD

label_92D6::
    ld   a, [$FFAC]
    and  a
    jr   z, label_92DF
    ld   a, $01
    ld   [$FFAC], a

label_92DF::
    ret

label_92E0::
    dec  c
    di
    nop
    rst  $38
    ld   [label_CF8], sp
    push af

label_92E8::
    nop
    nop
    di
    ld   c, $F3
    di
    db   $FC ; Undefined instruction
    nop

label_92F0::
    ld   b, $08
    ld   [label_406], sp
    rst  $38
    rst  $38
    inc  b
    inc  b
    rst  $38
    rst  $38
    inc  b
    ld   b, $08
    ld   [label_206], sp
    ld   [bc], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ld   [bc], a
    ld   [bc], a
    ld   b, d
    ldi  [hl], a
    ld   [bc], a
    ld   [bc], a
    ldi  [hl], a
    ld   [bc], a
    ld   [bc], a
    ldi  [hl], a
    ldi  [hl], a
    ld   a, [$C19B]
    and  $7F
    cp   $08
    ld   a, [$FF9E]
    jr   c, label_931D
    add  a, $04

label_931D::
    ld   e, a
    ld   d, $00
    ld   hl, label_92E8
    add  hl, de
    ld   a, [hl]
    ld   [$FFD7], a
    ld   hl, label_92E0
    add  hl, de
    ld   a, [hl]
    ld   [$FFD8], a
    sla  e
    ld   hl, label_92F0
    add  hl, de
    ld   a, [hli]
    ld   [$FFD9], a
    ld   a, [hl]
    ld   [$FFDA], a
    ld   hl, label_9300
    add  hl, de
    ld   a, [hli]
    ld   [$FFDB], a
    ld   a, [hl]
    ld   [$FFDC], a
    ld   de, $C010
    ld   bc, $C014
    ld   a, [$C145]
    ld   hl, $C13B
    add  a, [hl]
    ld   hl, $FFD7
    add  a, [hl]
    ld   [hl], a
    ld   a, [$FFD9]
    cp   $FF
    jr   z, label_935E
    ld   a, [hl]
    ld   [de], a

label_935E::
    ld   a, [$FFDA]
    cp   $FF
    jr   z, label_9366
    ld   a, [hl]
    ld   [bc], a

label_9366::
    inc  de
    inc  bc
    ld   a, [$FFD8]
    ld   hl, $FF98
    add  a, [hl]
    ld   [de], a
    add  a, $08
    ld   [bc], a
    inc  de
    inc  bc
    ld   a, [$FFD9]
    ld   [de], a
    ld   a, [$FFDA]
    ld   [bc], a
    inc  de
    inc  bc
    ld   a, [$FFDB]
    ld   [de], a
    ld   a, [$FFDC]
    ld   [bc], a
    ret

label_9383::
    inc  b
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  b

label_9387::
    inc  b
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    ld   a, [$FF9E]
    ld   c, a
    ld   b, $00
    ld   hl, label_9383
    add  hl, bc
    ld   a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, label_9387
    add  hl, bc
    ld   a, [$FF99]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], d
    jp   label_140F

label_93B0::
    push bc
    push de
    ld   a, [$FFE8]
    cp   $40
    jr   z, label_93FB
    ld   a, [$DBD0]
    and  a
    jr   z, label_941D
    dec  a
    ld   [$DBD0], a
    call label_2802
    call label_9420
    call label_9B9F
    ld   a, [hl]
    or   $40
    ld   [hl], a
    ld   [$FFF8], a
    ld   a, [$FFDB]
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   e, a
    ld   a, [$FFDC]
    and  $F0
    ld   [$FFCD], a
    or   e
    ld   e, a
    ld   d, $00
    call label_2178
    ld   a, [$FFCE]
    add  a, $08
    ld   [$FFD7], a
    ld   a, [$FFCD]
    add  a, $10
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    jp   label_941D

label_93FB::
    ld   a, $06
    call label_3B86
    jr   c, label_941D
    ld   hl, $C280
    add  hl, de
    dec  [hl]
    ld   a, [$FFDB]
    and  $F0
    add  a, $08
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFDC]
    and  $F0
    add  a, $10
    ld   hl, $C210
    add  hl, de
    ld   [hl], a

label_941D::
    pop  de
    pop  bc
    ret

label_9420::
    ld   a, $04
    ld   [$FFF4], a
    ret

label_9425::
    push bc
    ld   a, [$FFF7]
    cp   $FF
    ld   a, $30
    jr   z, label_9438
    ld   a, [$FFF7]
    cp   $0A
    ld   a, $30
    jr   c, label_9438
    ld   a, $3C

label_9438::
    call label_3B86
    jr   c, label_946F
    ld   hl, $C200
    add  hl, de
    ld   [hl], $28
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_9453
    ld   [hl], $48
    ld   a, [$FFF6]
    cp   $08
    jr   nz, label_9453
    ld   [hl], $58

label_9453::
    ld   hl, $C210
    add  hl, de
    ld   [hl], $3C
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_9469
    ld   [hl], $3C
    ld   a, [$FFF6]
    cp   $08
    jr   nz, label_9469
    ld   [hl], $3C

label_9469::
    ld   hl, $C310
    add  hl, de
    ld   [hl], $70

label_946F::
    pop  bc
    ret

label_9471::
    jr   nc, label_94A6
    add  a, c
    ld   bc, label_9628
    ld   l, b
    add  a, a
    or   e
    and  $0A

label_947C::
    ld   bc, label_401
    nop
    ld   bc, label_302
    inc  b
    dec  b
    ld   b, $07
    xor  a
    ld   [$D900], a
    ld   [$DA00], a
    ld   a, [$C134]
    and  a
    jr   z, label_9498
    dec  a
    ld   [$C134], a

label_9498::
    ld   a, [$DE05]
    and  a
    jr   z, label_94A2
    dec  a
    ld   [$DE05], a

label_94A2::
    ld   a, [$FFCB]
    and  $20

label_94A6::
    jr   z, label_94E4
    ld   a, [$FFCC]
    and  $40
    jr   label_94E4
    ld   a, $01
    ld   [$D401], a
    ld   a, [$D479]
    ld   e, a
    inc  a
    cp   $0B
    jr   c, label_94BD
    xor  a

label_94BD::
    ld   [$D479], a
    ld   d, $00
    ld   hl, label_9471
    add  hl, de
    ld   a, [hl]
    ld   [$D403], a
    ld   hl, label_947C
    add  hl, de
    ld   a, [hl]
    ld   [$D402], a
    ld   a, $50
    ld   [$D404], a
    ld   a, $70
    ld   [$D405], a
    ld   hl, $FFF2
    ld   [hl], $02
    jp   label_C7D

label_94E4::
    ld   b, $00
    ld   c, $0F

label_94E8::
    ld   a, c
    ld   [$C123], a
    ld   hl, $C510
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_94F7
    call label_9567

label_94F7::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_94E8
    ld   a, [$C124]
    and  a
    jr   nz, label_9529
    ld   a, [$FFAC]
    and  a
    jr   z, label_9529
    cp   $01
    jr   nz, label_952A
    ld   hl, $FFAD
    ld   a, [$FF98]
    sub  a, [hl]
    add  a, $06
    cp   $0C
    jr   nc, label_9524
    ld   hl, $FFAE
    ld   a, [$FF99]
    sub  a, [hl]
    add  a, $06
    cp   $0C
    jr   c, label_9529

label_9524::
    ld   a, [$FFAC]
    inc  a
    ld   [$FFAC], a

label_9529::
    ret

label_952A::
    ld   a, [$FFA2]
    and  a
    jr   nz, label_9566
    ld   hl, $FFAD
    ld   a, [$FF98]
    sub  a, [hl]
    add  a, $05
    cp   $0A
    jr   nc, label_9566
    ld   hl, $FFAE
    ld   a, [$FF99]
    sub  a, [hl]
    add  a, $05
    cp   $0A
    jr   nc, label_9566
    ld   a, [$C15C]
    and  a
    jr   nz, label_9566
    ld   a, [$FFF6]
    cp   $77
    jr   nz, label_9560
    ld   a, [$DBA5]
    and  a
    jr   nz, label_9560
    ld   a, [$DDD9]
    cp   $80
    jr   nz, label_9566

label_9560::
    call label_C89
    xor  a
    ld   [$FFAC], a

label_9566::
    ret

label_9567::
    push af
    ld   a, [$C124]
    and  a
    jr   nz, label_957C
    ld   hl, $C520
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_957F
    dec  a
    ld   [hl], a
    ld   [$FFD7], a
    jr   nz, label_957F

label_957C::
    call label_98E6

label_957F::
    pop  af
    dec  a
    rst  0
    dec  h
    ld   e, b
    and  h
    ld   e, b
    and  h
    ld   e, b
    and  h
    ld   e, b
    db   $ED ; Undefined instruction
    ld   d, a
    or   h
    ld   d, a
    ld   e, [hl]
    ld   d, a
    ld   b, [hl]
    ld   d, a
    ld   b, [hl]
    ld   d, [hl]
    inc  c
    ld   d, [hl]
    jr   label_95EF
    dec  e
    ld   e, b
    call c, label_55
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
    nop
    inc  b
    inc  b
    ld   b, b
    nop
    inc  b
    inc  b
    nop
    nop
    inc  b
    inc  b
    nop

label_95BC::
    nop
    nop
    ld   [$0030], sp
    ld   [label_3006], sp
    nop
    nop
    ld   b, $10
    nop
    ld   [label_1008], sp
    nop
    inc  b
    inc  b
    ld   d, b
    nop
    inc  b
    inc  b
    ld   d, b
    nop
    inc  b
    inc  b
    stop
    inc  b
    inc  b
    db   $10 ; Undefined instruction
    rst  $20
    xor  c
    and  $01
    ret  z
    call label_98D0
    ld   hl, $C590
    add  hl, bc
    ld   a, [hl]
    rla
    rla
    rla
    and  $F8

label_95EF::
    ld   e, a
    ld   d, b
    ld   hl, label_959C
    ld   a, [$FFE7]
    and  $02
    jr   z, label_95FD
    ld   hl, label_95BC

label_95FD::
    jp   label_983A
    ld    hl, sp+$00
    ld   [label_AC10], sp
    ld   l, [hl]
    ld   l, [hl]

label_9607::
    ld   l, h
    nop
    nop
    jr   nz, label_962C
    call label_98D0
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   e, l
    ld   d, h
    push bc
    ld   c, $04

label_961E::
    ld   a, [$FFD8]
    ld   [de], a
    inc  de
    ld   a, [$FFD9]
    ld   hl, label_95FF
    add  hl, bc

label_9628::
    add  a, [hl]
    ld   [de], a
    inc  de
    ld   hl, label_9603
    add  hl, bc
    ld   a, [hl]
    ld   [de], a
    inc  de
    ld   hl, label_9607
    add  hl, bc
    ld   a, [hl]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_961E
    pop  bc
    ld   a, $04
    jp   label_98F5

label_9642::
    ld   a, [hl]
    rra
    inc  c
    rra
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    xor  a
    ld   [$C155], a
    ld   a, [$FFD7]
    cp   $02
    jr   nc, label_965B
    ld   hl, $C167
    ld   [hl], b

label_965B::
    cp   $DE
    jr   nz, label_9664
    call label_9420
    ld   a, $DE

label_9664::
    cp   $A0
    jr   nz, label_966D
    ld   hl, $FFF4
    ld   [hl], $2A

label_966D::
    cp   $0A
    jr   nz, label_9678
    ld   a, $50
    ld   [$C5AF], a
    ld   a, $0A

label_9678::
    cp   $20
    jr   c, label_968C
    cp   $9C
    ret  nc
    ld   e, $01
    and  $04
    jr   z, label_9687
    ld   e, $FE

label_9687::
    ld   a, e
    ld   [$C155], a
    ret

label_968C::
    and  $0F
    cp   $08
    jp   nz, label_9707
    ld   a, [$FFD7]
    rra
    rra
    rra
    and  $02
    ld   e, a
    ld   d, b
    ld   hl, label_9642
    add  hl, de
    ld   a, [hli]
    ld   [$FFD7], a
    ld   a, [hl]
    ld   [$FFD8], a
    ld   a, $60
    ld   [$FFCE], a
    ld   a, [$FFF6]
    cp   $B5
    ld   a, $10
    jr   nz, label_96B8
    ld   a, $60
    ld   [$FFCE], a
    ld   a, $10

label_96B8::
    ld   [$FFCD], a
    call label_2887
    ld   a, [$D600]
    ld   e, a
    ld   d, b
    ld   hl, $D601
    add  hl, de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $41
    ldi  [hl], a
    ld   a, [$FFD7]
    ldi  [hl], a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    add  a, $20
    ldi  [hl], a
    ld   a, $41
    ldi  [hl], a
    ld   a, [$FFD8]
    ldi  [hl], a
    ld   [hl], b
    ld   a, e
    add  a, $08
    ld   [$D600], a
    ld   hl, $C520
    add  hl, bc
    ld   a, [hl]
    cp   $08
    jr   nz, label_9707
    ld   hl, $D727
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, label_96FC
    ld   hl, $D727

label_96FC::
    ld   [hl], $E3
    ld   a, $82
    call label_B2F
    ld   a, $23
    ld   [$FFF2], a

label_9707::
    ret

label_9708::
    nop
    inc  b
    inc  h
    ld   bc, label_400
    inc  h
    ld   bc, $0000
    ld   e, $01
    nop
    ld   [label_A11E], sp
    call label_98D0
    ld   a, [$FFD7]
    and  $08
    ld   d, $00
    ld   e, a
    ld   hl, label_9708
    ld   a, [$C14A]
    and  a
    jp   nz, label_983A
    add  hl, de
    ld   de, $C000
    call label_9854
    jp   label_9854

label_9736::
    nop
    nop
    ld   e, $01
    nop
    ld   [label_A11E], sp
    nop
    nop
    jr   nc, label_9743
    nop

label_9743::
    ld   [label_A130], sp
    call label_98D0
    ld   a, [$FFD7]
    and  $08
    ld   d, $00
    ld   e, a
    ld   hl, label_9736
    jp   label_983A

label_9756::
    ld   bc, label_1FF
    rst  $38

label_975A::
    ld   bc, rSB
    rst  $38
    ld   a, [$FFD7]
    cp   $0A
    jr   c, label_9780
    ld   hl, $C590
    add  hl, bc
    ld   e, [hl]
    ld   d, b
    ld   hl, label_9756
    add  hl, de
    ld   a, [hl]
    ld   hl, $C530
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    ld   hl, label_975A
    add  hl, de
    ld   a, [hl]
    ld   hl, $C540
    add  hl, bc
    add  a, [hl]
    ld   [hl], a

label_9780::
    call label_98D0
    push bc
    ld   c, $3A
    ld   a, [$FFD7]
    cp   $07
    jr   nc, label_978E
    ld   c, $3C

label_978E::
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   a, [$FFD8]
    ldi  [hl], a
    ld   a, [$FFD9]
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    ld   a, [$FFD8]
    ldi  [hl], a
    ld   a, [$FFD9]
    add  a, $08
    ldi  [hl], a
    ld   a, c
    ldi  [hl], a
    ld   [hl], $20
    pop  bc
    ld   a, $02
    jp   label_98F5
    call label_98D0
    ld   a, [$C3C0]
    ld   e, a

label_97BB::
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   a, [$FFD8]
    ldi  [hl], a
    ld   a, [$FFD9]
    ldi  [hl], a
    ld   a, $24
    ldi  [hl], a
    ld   a, [$FFE7]
    xor  c
    rl   a
    rl   a
    rl   a
    rl   a
    and  $10
    ld   [hl], a
    ld   a, $01
    jp   label_98F5

label_97DD::
    nop
    rst  $38
    inc  a
    nop
    nop
    rlca
    inc  a
    jr   nz, label_97E6

label_97E6::
    rst  $38
    db   $3A ; ldd  a, [hl]
    nop
    nop
    rlca
    db   $3A ; ldd  a, [hl]
    jr   nz, label_97BB
    ret  nc
    ld   e, b
    ld   a, [$FFD7]
    and  $08
    ld   d, $00
    ld   e, a
    ld   hl, label_97DD
    jp   label_983A

label_97FD::
    or   $FE
    jr   label_9801

label_9801::
    ld    hl, sp+$0A
    jr   label_9825
    db   $FC ; Undefined instruction
    nop
    jr   label_9809

label_9809::
    cp   $08
    jr   label_982D

label_980D::
    nop
    ld   a, [$0018]
    nop
    ld   c, $18
    jr   nz, label_9818
    db   $FC ; Undefined instruction
    jr   label_9819

label_9819::
    ld   [bc], a
    inc  c
    jr   label_983D
    call label_98D0
    ld   hl, label_980D
    jr   label_9833

label_9825::
    call label_98D0
    ld   a, [$C1A7]
    cp   $02

label_982D::
    jp   z, label_9877
    ld   hl, label_97FD

label_9833::
    ld   a, [$FFD7]
    and  $08
    ld   e, a
    ld   d, $00

label_983A::
    add  hl, de
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    call label_9854
    call label_9854
    ld   a, $02
    jp   label_98F5

label_9854::
    ld   a, [$FFD8]
    add  a, [hl]
    ld   [de], a
    inc  hl
    inc  de
    ld   a, [$FFD9]
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
    ret

label_9867::
    nop
    nop
    ld   a, d
    nop
    nop
    ld   [label_207A], sp
    nop
    nop
    ld   a, b
    nop
    nop
    ld   [label_2078], sp

label_9877::
    ld   a, [$FFD7]
    and  $08
    ld   d, $00
    ld   e, a
    ld   hl, label_9867
    jp   label_983A

label_9884::
    nop
    nop
    ldd  [hl], a
    ld   bc, label_800
    ldd  [hl], a
    ld   hl, $0000
    ldd  [hl], a
    ld   bc, label_800
    ldd  [hl], a
    ld   hl, $0000
    jr   nc, label_9899
    nop

label_9899::
    ld   [label_2130], sp
    nop
    nop
    jr   nc, label_98A1
    nop

label_98A1::
    ld   [label_2130], sp
    call label_98D0
    ld   a, [$FFD7]
    cp   $04
    jr   nz, label_98BB
    ld   hl, $C510
    add  hl, bc
    ld   a, [hl]
    cp   $03
    jr   nz, label_98BB
    call label_9ED3
    jr   label_98C2

label_98BB::
    cp   $04
    jr   nz, label_98C2
    call label_9F5C

label_98C2::
    ld   a, [$FFD7]
    rla
    and  $18
    ld   d, $00
    ld   e, a
    ld   hl, label_9884
    jp   label_983A

label_98D0::
    ld   hl, $C540
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD8], a
    cp   $88
    jr   nc, label_98E6
    ld   hl, $C530
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD9], a
    cp   $A8
    jr   c, label_98EC

label_98E6::
    ld   hl, $C510
    add  hl, bc
    xor  a
    ld   [hl], a

label_98EC::
    ret

label_98ED::
    nop
    ld   [label_1810], sp
    jr   nz, label_991B
    jr   nc, label_992D

label_98F5::
    sla  a
    sla  a
    ld   e, a
    ld   a, [$C3C0]
    add  a, e
    cp   $60
    jr   c, label_9904
    sub  a, $60

label_9904::
    ld   [$C3C0], a
    ld   a, [$C3C1]
    add  a, e
    ld   [$C3C1], a
    cp   $60
    jr   c, label_9925
    ld   a, [$FFE7]
    ld   hl, $C123
    add  a, [hl]
    and  $07
    ld   e, a

label_991B::
    ld   d, $00
    ld   hl, label_98ED
    add  hl, de
    ld   a, [hl]
    ld   [$C3C0], a

label_9925::
    ret

label_9926::
    ld   a, [$FF99]

label_9928::
    ld   [$FFD8], a
    ld   a, [$FF98]
    ld   [$FFD7], a
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, $01
    jp   label_CC7
    cp   $FD
    ei
    rst  $30
    ld   hl, $C19F
    ld   a, [$C124]
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_9967
    ld   a, [$DBA5]
    and  a
    jr   z, label_9967
    call label_9D4F
    ld   a, [$C188]
    and  a
    jr   z, label_9968
    cp   $02
    ld   a, $01
    ld   [$FFA1], a
    jr   z, label_9964
    call label_9A7B
    jr   label_9967

label_9964::
    call label_9C04

label_9967::
    ret

label_9968::
    ld   a, [$C18C]
    and  a
    jr   z, label_999D
    ld   e, $03
    ld   a, [$C18A]
    ld   c, a

label_9974::
    inc  e
    ld   a, e
    cp   $08
    jr   z, label_9998
    srl  c
    jr   nc, label_9974
    ld   d, $00
    ld   hl, label_9933
    add  hl, de
    ld   a, [$C18A]
    and  [hl]
    ld   [$C18A], a
    ld   a, e
    ld   [$C189], a
    xor  a
    ld   [$DBAC], a
    inc  a
    ld   [$C188], a
    ret

label_9998::
    xor  a
    ld   [$C18C], a
    ret

label_999D::
    ld   a, [$C18D]
    and  a
    jr   nz, label_99A4
    ret

label_99A4::
    ld   e, $03
    ld   a, [$C18B]
    ld   c, a

label_99AA::
    inc  e
    ld   a, e
    cp   $08
    jr   z, label_99CF
    srl  c
    jr   nc, label_99AA
    ld   d, $00
    ld   hl, label_9933
    add  hl, de
    ld   a, [$C18B]
    and  [hl]
    ld   [$C18B], a
    ld   a, e
    ld   [$C189], a
    ld   a, $02
    ld   [$C188], a
    xor  a
    ld   [$DBAC], a
    ret

label_99CF::
    xor  a
    ld   [$C18D], a
    ret

label_99D4::
    ld   d, b

label_99D5::
    ld   d, c
    inc  de
    ld   [de], a
    ld   de, label_8210
    ld   b, e
    ld   b, l
    inc  de
    ld   d, l
    ld   de, label_8612
    db   $10 ; Undefined instruction
    ld   e, b
    ld   e, c
    inc  de
    ld   [de], a
    ld   de, label_8A10
    ld   c, e
    ld   c, l
    inc  de
    ld   e, l
    ld   de, label_8E12
    db   $10 ; Undefined instruction
    ld   [bc], a
    inc  bc
    inc  de
    ld   [de], a
    ld   de, label_1310
    ld   [de], a
    ld   de, label_1310
    ld   [de], a
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   de, label_1310
    ld   [de], a
    ld   de, label_1310
    ld   [de], a
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   [de], a
    inc  de
    db   $10 ; Undefined instruction
    ld   de, label_1310
    ld   [de], a

label_9A1C::
    ld   [$0008], sp
    nop
    ld   [$0008], sp
    nop
    ld   [label_808], sp
    nop
    nop
    ld   [$0008], sp
    nop
    ld   [$0000], sp
    ld   [$0008], sp
    nop
    ld   [$0008], sp
    ld   [label_1008], sp
    db   $10 ; Undefined instruction
    ld   [label_1010], sp
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_1001
    db   $10 ; Undefined instruction
    ld   bc, label_1010

label_9A50::
    ld   b, e
    adc  a, h
    add  hl, bc
    dec  bc
    ld   b, e
    adc  a, h
    add  hl, bc
    dec  bc
    ld   b, h
    ld   [label_C0A], sp
    ld   b, h
    ld   [label_C0A], sp

label_9A60::
    inc  b
    ld   [$0102], sp
    inc  b
    ld   [$0102], sp
    inc  b

label_9A69::
    ld    hl, sp+$08
    rst  $38
    ld   bc, label_8F8
    rst  $38
    ld   bc, label_8F8
    inc  b
    ld   bc, label_802
    inc  b
    ld   bc, label_802

label_9A7B::
    ld   e, $00
    ld   d, e
    ld   c, e
    ld   b, e
    xor  a
    ld   [$FFE3], a
    ld   [$FFE5], a
    ld   a, [$C189]
    ld   c, a
    and  a
    jr   z, label_9A95
    xor  a

label_9A8D::
    add  a, $04
    ld   e, a
    ld   d, $00
    dec  c
    jr   nz, label_9A8D

label_9A95::
    ld   hl, label_9A1C
    ld   a, [$C189]
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C1D0
    add  hl, bc
    add  a, [hl]
    ld   [$FFCE], a

label_9AA7::
    ld   hl, label_9A2E
    ld   a, [$FFE3]
    ld   c, a
    add  hl, bc
    ld   a, [$C189]
    ld   c, a
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C1E0
    add  hl, bc
    add  a, [hl]
    ld   [$FFCD], a
    push de
    call label_2887
    pop  de
    ld   a, [$FFE3]
    and  a
    jr   z, label_9AC7
    inc  de
    inc  de

label_9AC7::
    ld   a, [$FFFE]
    and  a
    jr   z, label_9AD5
    push de
    ld   a, $02
    ld   b, $00
    call label_999
    pop  de

label_9AD5::
    ld   a, [$D600]
    ld   c, a
    ld   b, $00
    add  a, $05
    ld   [$D600], a
    ld   hl, $D601
    add  hl, bc
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    push hl
    ld   hl, label_99D4
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push hl
    ld   hl, label_99D5
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a
    ld   a, [$FFE3]
    and  a
    jr   nz, label_9B09
    ld   a, $09
    ld   [$FFE3], a
    jp   label_9AA7

label_9B09::
    xor  a
    inc  hl
    ld   [hl], a
    ld   a, [$DBAC]
    add  a, $01
    ld   [$DBAC], a
    ld   a, [$DBAC]
    cp   $08
    jr   nc, label_9B1C
    ret

label_9B1C::
    ld   a, [$FFE5]
    and  a
    jr   nz, label_9B31
    xor  a
    ld   [$FFE3], a
    ld   a, e
    add  a, $24
    ld   e, a
    ld   d, $00
    ld   [$FFE5], a
    dec  de
    dec  de
    jp   label_9AA7

label_9B31::
    xor  a
    ld   [$C188], a
    ld   [$C1A8], a
    xor  a
    ld   [$FFE5], a
    ld   a, [$C189]
    ld   c, a
    ld   b, $00
    ld   hl, $C1F0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    ld   a, c
    and  $07
    ld   c, a

label_9B4C::
    ld   hl, label_9A40
    add  hl, bc
    ld   a, [hl]
    ld   hl, $FFD7
    add  a, [hl]
    ld   e, a
    ld   d, $00
    ld   hl, label_9A50
    add  hl, bc
    ld   a, [hl]
    ld   hl, $D711
    add  hl, de
    ld   [hl], a
    ld   a, [$FFE5]
    and  a
    jr   nz, label_9B6F
    ld   a, c
    add  a, $08
    ld   [$FFE5], a
    ld   c, a
    jr   label_9B4C

label_9B6F::
    call label_9B9F
    ld   c, l
    ld   b, h
    ld   a, [$C189]
    ld   e, a
    ld   d, $00
    ld   hl, label_9A60
    add  hl, de
    ld   a, [bc]
    or   [hl]
    ld   [bc], a
    ld   [$FFF8], a
    ld   hl, label_9A69
    add  hl, de
    ld   a, [$DBAE]
    add  a, [hl]
    ld   e, a
    call label_2BC1
    ld   c, l
    ld   b, h
    ld   a, [$C189]
    ld   e, a
    ld   d, $00
    ld   hl, label_9A72
    add  hl, de
    ld   a, [bc]
    or   [hl]
    ld   [bc], a
    ret

label_9B9F::
    ld   hl, $D800
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    and  a
    jr   z, label_9BC2
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_9BB9
    ld   d, $00
    ld   hl, $DDE0
    jr   label_9BC2

label_9BB9::
    cp   $1A
    jr   nc, label_9BC2
    cp   $06
    jr   c, label_9BC2
    inc  d

label_9BC2::
    add  hl, de
    ret

label_9BC4::
    ld   e, b

label_9BC5::
    ld   e, c
    inc  de
    ld   [de], a
    ld   de, label_8A10
    ld   c, e
    ld   c, l
    inc  de
    ld   e, l
    ld   de, label_8E12
    db   $10 ; Undefined instruction
    ld   b, b
    ld   b, c
    ld   e, b
    ld   e, c
    ld   c, d
    ld   c, e
    ld   d, d
    ld   d, e
    ld   b, h
    ld   c, l
    ld   d, h
    ld   e, l

label_9BE0::
    ld   c, [hl]
    ld   b, a
    ld   e, [hl]
    ld   d, a
    ld   [$0008], sp
    nop

label_9BE8::
    ld   [$0008], sp
    nop
    nop
    nop
    ld   [label_808], sp
    ld   [label_1010], sp

label_9BF4::
    nop
    nop
    nop
    nop
    ld   bc, label_1001
    db   $10 ; Undefined instruction
    scf
    add  hl, sp
    dec  sp
    ld   [hl], $38
    db   $3A ; ldd  a, [hl]
    inc  a

label_9C04::
    ld   e, $00
    ld   d, e
    ld   c, e
    ld   b, e
    xor  a
    ld   [$FFE3], a
    ld   [$FFE4], a
    ld   [$FFE5], a
    ld   a, [$C189]
    sub  a, $04
    jr   z, label_9C21
    ld   c, a
    xor  a

label_9C19::
    add  a, $04
    ld   e, a
    ld   d, $00
    dec  c
    jr   nz, label_9C19

label_9C21::
    ld   hl, label_9BE0
    ld   a, [$C189]
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C1D0
    add  hl, bc
    add  a, [hl]
    ld   [$FFCE], a

label_9C33::
    ld   hl, label_9BE8
    ld   a, [$FFE3]
    ld   c, a
    add  hl, bc
    ld   a, [$C189]
    ld   c, a
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C1E0
    add  hl, bc
    add  a, [hl]
    ld   [$FFCD], a
    ld   a, [$DBB2]
    sub  a, $10
    ld   hl, $FFCD
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_9C6F
    ld   a, [$DBB1]
    sub  a, $08
    ld   hl, $FFCE
    sub  a, [hl]
    add  a, $10
    cp   $20
    jr   nc, label_9C6F
    ld   a, [$FF98]
    ld   [$DBB1], a
    ld   a, [$FF99]
    ld   [$DBB2], a

label_9C6F::
    push de
    call label_2887
    pop  de
    ld   a, [$FFE3]
    and  a
    jr   z, label_9C7B
    inc  de
    inc  de

label_9C7B::
    ld   a, [$FFFE]
    and  a
    jr   z, label_9C89
    push de
    ld   a, $02
    ld   b, $01
    call label_999
    pop  de

label_9C89::
    ld   a, [$D600]
    ld   c, a
    ld   b, $00
    add  a, $05
    ld   [$D600], a
    ld   hl, $D601
    add  hl, bc
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    push hl
    ld   hl, label_9BC4
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    push hl
    ld   hl, label_9BC5
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a
    ld   a, [$FFE3]
    and  a
    jr   nz, label_9CBD
    ld   a, $04
    ld   [$FFE3], a
    jp   label_9C33

label_9CBD::
    xor  a
    inc  hl
    ld   [hl], a
    ld   a, [$DBAC]
    add  a, $01
    ld   [$DBAC], a
    ld   a, [$DBAC]
    cp   $08
    jr   nc, label_9CD0
    ret

label_9CD0::
    ld   a, [$FFE5]
    and  a
    jr   nz, label_9CE5
    xor  a
    ld   [$FFE3], a
    ld   a, e
    add  a, $10
    ld   e, a
    ld   d, $00
    ld   [$FFE5], a
    dec  de
    dec  de
    jp   label_9C33

label_9CE5::
    xor  a
    ld   [$C188], a
    ld   [$C1A8], a
    xor  a
    ld   [$FFE5], a
    ld   a, [$C189]
    sub  a, $04
    ld   c, a
    ld   b, $00
    ld   hl, $C1F4
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a

label_9CFE::
    ld   hl, label_9BF4
    add  hl, bc
    ld   a, [hl]
    ld   hl, $FFD7
    add  a, [hl]
    ld   e, a
    ld   d, $00
    ld   hl, label_9BFC
    add  hl, bc
    ld   a, [hl]
    ld   hl, $D711
    add  hl, de
    ld   [hl], a
    ld   a, [$FFE5]
    and  a
    jr   nz, label_9D21
    ld   a, c
    add  a, $04
    ld   [$FFE5], a
    ld   c, a
    jr   label_9CFE

label_9D21::
    ld   hl, $D800
    ld   a, [$DBA5]
    and  a
    jr   z, label_9D36
    ld   hl, $D900
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_9D36
    ld   hl, $DDE0

label_9D36::
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    add  hl, de
    push hl
    ld   a, [$C189]
    ld   e, a
    ld   d, $00
    ld   hl, label_9A60
    add  hl, de
    ld   a, [hl]
    cpl
    pop  hl
    and  [hl]
    ld   [hl], a
    ld   [$FFF8], a
    ret

label_9D4F::
    ld   a, [$C18E]
    and  a
    jp   z, label_9E02
    call label_9F9F
    ld   a, [$C18E]
    and  $E0
    srl  a
    srl  a
    srl  a
    srl  a
    srl  a
    rst  0
    push bc
    ld   e, a
    dec  h
    ld   e, [hl]
    ld   a, c
    ld   e, l
    xor  e
    ld   e, [hl]
    inc  bc
    ld   e, [hl]
    jp   [hl]
    ld   e, l
    jr   label_9DD5
    jp   nz, label_CD5D
    xor  a
    ld   e, l
    ld   c, $0F
    ld   b, $00

label_9D80::
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $80
    jr   nz, label_9DA8
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   c, label_9DA8
    ld   [hl], $01
    ld   hl, $C480
    add  hl, bc
    ld   [hl], $1F
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $F0
    or   $02
    ld   [hl], a
    ld   a, $13
    ld   [$FFF4], a

label_9DA8::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_9D80
    ret

label_9DAF::
    ld   a, [$FFF8]
    and  $10
    jr   nz, label_9DC0
    ld   a, [$C18F]
    and  a
    jr   z, label_9DC0
    xor  a
    ld   [$C18E], a
    ret

label_9DC0::
    pop  af
    ret
    call label_9DAF
    ld   a, $2F
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $88
    ld   hl, $C210
    add  hl, de
    ld   [hl], $30
    ld   hl, $C450
    add  hl, de
    ld   [hl], $80
    ld   a, $88
    ld   [$FFD7], a
    ld   a, $30
    ld   [$FFD8], a
    ld   a, $02
    jp   label_9DF6
    call label_9DAF
    ld   a, $88
    ld   [$FFD7], a
    ld   a, $20
    ld   [$FFD8], a
    ld   a, $04

label_9DF6::
    call label_CC7
    call label_9B9F
    ld   a, [hl]
    or   $10
    ld   [hl], a
    ld   [$FFF8], a

label_9E02::
    ret
    call label_9DAF
    ld   a, [$FFF6]
    cp   $69
    jr   nz, label_9E15
    call label_9B9F
    ld   a, [hl]
    or   $10
    ld   [hl], a
    ld   [$FFF8], a

label_9E15::
    jp   label_9425
    ld   a, [$FFF7]
    ld   e, a
    ld   d, $00
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    and  $01
    ret  nz

label_9E25::
    ld   a, [$C190]
    and  a
    jr   nz, label_9E2E
    call label_9E7B

label_9E2E::
    ld   a, [$C18F]
    and  a
    ret  z
    ld   a, [$C18E]
    cp   $C1
    jr   nz, label_9E6A
    ld   a, [$FFF7]
    ld   e, a
    ld   d, $00
    ld   hl, $DB65
    add  hl, de
    ld   a, [hl]
    or   $01
    ld   [hl], a
    ld   d, $00
    ld   a, [$FFF6]
    ld   e, a
    ld   hl, $D900
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_9E5A
    ld   hl, $DDE0
    jr   label_9E63

label_9E5A::
    cp   $1A
    jr   nc, label_9E63
    cp   $06
    jr   c, label_9E63
    inc  d

label_9E63::
    add  hl, de
    set  5, [hl]
    ld   a, $1B
    ld   [$FFF2], a

label_9E6A::
    ld   a, [$C190]
    and  a
    ret  z
    xor  a
    ld   [$C18E], a
    ld   a, $01
    ld   [$C18C], a
    jp   label_9420

label_9E7B::
    ld   a, [$FF98]
    sub  a, $11
    cp   $7E
    jr   nc, label_9EA2
    ld   a, [$FF99]
    sub  a, $16
    cp   $5E
    jr   nc, label_9EA2
    ld   a, [$C18F]
    and  a
    jr   nz, label_9EA2
    ld   a, $01
    ld   [$C18D], a
    ld   [$C190], a
    ld   a, $04
    ld   [$C111], a
    ld   a, $10
    ld   [$FFF4], a

label_9EA2::
    ret

label_9EA3::
    ld   h, b
    ld   [hl], b
    ld   h, c
    ld   [hl], c

label_9EA7::
    ld   h, b
    ld   [hl], b
    ld   h, b
    ld   [hl], b

label_9EAB::
    call label_9DAF
    ld   a, $88
    ld   [$FFD7], a
    ld   a, [$FF99]
    sub  a, $30
    add  a, $08
    cp   $10
    jr   nc, label_9ECA
    ld   a, [$FF98]
    sub  a, $88
    add  a, $10
    cp   $20
    jr   nc, label_9ECA
    ld   a, $40
    jr   label_9ECC

label_9ECA::
    ld   a, $30

label_9ECC::
    ld   [$FFD8], a
    ld   a, $03
    jp   label_CC7

label_9ED3::
    ld   a, [$FF99]
    sub  a, $30
    add  a, $08
    cp   $10
    jr   nc, label_9EEB
    ld   a, [$FF98]
    sub  a, $88
    add  a, $10
    cp   $20
    jr   nc, label_9EEB
    ld   a, $30
    jr   label_9EED

label_9EEB::
    ld   a, $20

label_9EED::
    ld   [$FFCD], a
    ld   a, $80
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
    ld   a, $A0
    ld   [hl], a
    ld   [$DDD8], a
    call label_2887
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $0A
    ld   [$D600], a
    ld   de, label_9EA3
    ld   a, [$FFFE]
    and  a
    jr   z, label_9F27
    ld   de, label_9EA7

label_9F27::
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
    ld   a, [$FFFE]
    and  a
    jr   z, label_9F53
    push bc
    ld   a, $02
    call label_91D
    pop  bc

label_9F53::
    ret

label_9F54::
    ld   l, d
    ld   a, d
    ld   l, e
    ld   a, e
    nop
    nop
    nop
    nop

label_9F5C::
    ld   a, $01
    ld   [$FFAC], a
    ld   a, $10
    ld   [$FFCD], a
    add  a, $10
    ld   [$FFAE], a
    ld   a, $80
    ld   [$FFCE], a
    add  a, $08
    ld   [$FFAD], a
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
    ld   a, $BE
    ld   [hl], a
    ld   [$DDD8], a
    call label_2887
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    add  a, $0A
    ld   [$D600], a
    ld   de, label_9F54
    jp   label_9F27

label_9F9F::
    and  $1F
    ld   [$FFD7], a
    dec  a
    rst  0
    db   $FC ; Undefined instruction
    ld   e, a
    push bc
    ld   e, a
    db   $E3 ; Undefined instruction
    ld   e, a
    push bc
    ld   e, a
    jp  c, label_EB5F
    ld   e, a
    push bc
    ld   e, a
    db   $FC ; Undefined instruction
    ld   e, a
    push bc
    ld   e, a
    add  a, $5F
    push bc
    ld   e, a
    push bc
    ld   e, a
    push bc
    ld   e, a
    push bc
    ld   e, a
    push bc
    ld   e, a
    dec  l
    ld   h, b
    ret
    ld   a, [$FFF7]
    cp   $06
    jr   nz, label_9FD1
    ld   a, [$DAE8]
    jr   label_9FD4

label_9FD1::
    ld   a, [$D9FF]

label_9FD4::
    and  $20
    jp   nz, label_C60
    ret
    ld   a, [$C1A2]
    cp   $02
    jp   z, label_C60
    ret
    ld   a, [$C1CB]
    and  a
    jp   nz, label_C60
    ret
    ld   c, $00
    ld   hl, $DBB6

label_9FF0::
    ld   a, [hli]
    cp   c
    ret  nz
    inc  c
    ld   a, c
    cp   $03
    jr   nz, label_9FF0
    jp   label_C60
    ld   c, $0F
    ld   b, $00

label_A000::
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_A011
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $02
    jr   z, label_A02C

label_A011::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_A000
    ld   a, [$FFD7]
    cp   $08
    jr   nz, label_A029
    ld   a, [$D460]
    and  a
    jr   z, label_A02C
    ld   a, [$C113]
    and  a
    jr   nz, label_A02C

label_A029::
    jp   label_C60

label_A02C::
    ret
    ld   a, [$C18F]
    and  a
    ret  nz
    xor  a
    ld   [$FFD7], a
    ld   de, $0000
    ld   a, [$FFF6]
    cp   $12
    jr   z, label_A09B

label_A03E::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $EF
    jr   z, label_A04F
    cp   $F0
    jr   z, label_A04F
    cp   $F1
    jr   nz, label_A064

label_A04F::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_A064
    ld   hl, $C3B0
    add  hl, de
    ld   a, [hl]
    cp   $08
    jr   nz, label_A064
    ld   hl, $FFD7
    inc  [hl]

label_A064::
    inc  e
    ld   a, e
    and  $0F
    jr   nz, label_A03E
    ld   e, $09
    ld   a, [$FFF6]
    cp   $0A
    jr   z, label_A074
    ld   e, $04

label_A074::
    ld   a, [$FFD7]
    cp   e
    ret  nz
    call label_C60
    ld   a, [$FFF6]
    cp   $08
    ret  z
    cp   $0A
    jr   nz, label_A098
    call label_9DAF
    call label_9E25
    ld   hl, $DDE0
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    or   $10
    ld   [hl], a
    ret

label_A098::
    jp   label_9EAB

label_A09B::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $F6
    jr   z, label_A0A8
    cp   $F7
    jr   nz, label_A0BD

label_A0A8::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_A0BD
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $04
    jr   nz, label_A0BD
    ld   hl, $FFD7
    inc  [hl]

label_A0BD::
    inc  e
    ld   a, e
    and  $0F
    jr   nz, label_A09B
    ld   a, [$FFD7]
    cp   $02
    ret  nz
    call label_C60
    call label_9DAF
    call label_9B9F
    ld   a, [hl]
    or   $10
    ld   [hl], a
    ld   [$FFF8], a
    ret

label_A0D8::
    ld   a, [de]
    cp   [hl]
    jr   c, label_A0DE
    ld   a, [hl]
    ld   [de], a

label_A0DE::
    inc  hl
    ret
    ld   hl, $DB76
    ld   de, $DB4C
    call label_A0D8
    ld   de, $DB4D
    call label_A0D8
    ld   de, $DB45
    call label_A0D8
    ld   a, [$C11C]
    cp   $02
    ret  nc
    ld   a, [$C19F]
    and  a
    jp   nz, label_A1F5
    ld   a, [$C124]
    and  a
    ret  nz
    ld   a, [$C14F]
    and  a
    jp   nz, label_A1A9
    ld   a, [$FFCB]
    and  $40
    jp   nz, label_A1E7
    ld   a, [$FFCC]
    and  $80
    jp   z, label_A1E7
    ld   a, [$DB9A]
    and  a
    jr   z, label_A13D
    ld   a, [$D464]
    and  a
    jp   nz, label_A1E7
    ld   a, [$C167]
    and  a
    jp   nz, label_A1E7

label_A130::
    ld   a, [$FFA1]
    cp   $02
    jp   z, label_A1E7
    ld   a, [$FF9D]
    inc  a
    jp   z, label_A1E7

label_A13D::
    ld   a, [$C1B5]
    ld   hl, $C1B8
    or   [hl]
    ld   hl, $C1B9
    or   [hl]
    jp   nz, label_A1E7
    ld   a, $01
    ld   [$C14F], a
    ld   [$C151], a
    ld   a, $12
    ld   [$FFF2], a
    ld   a, [$C150]
    cpl
    inc  a
    ld   [$C150], a
    and  $80
    jr   z, label_A19F
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$FFCB], a
    ld   [$FFCC], a
    ld   [$DB96], a
    ld   a, $0C
    ld   [$DB95], a
    ld   a, $11
    ld   [$FFF2], a
    xor  a
    ld   [$C151], a
    ld   a, $0B
    ld   [$C154], a
    ld   a, [$DBA5]
    and  a
    ld   a, $07
    jr   z, label_A19C
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_A197
    cp   $08
    ld   a, $07
    jr   nc, label_A19C

label_A197::
    call label_A709
    ld   a, $02

label_A19C::
    ld   [$FF90], a
    ret

label_A19F::
    ld   a, $07
    ld   [$FFA9], a
    ld   a, $70
    ld   [$FFAA], a
    pop  af
    ret

label_A1A9::
    ld   a, [$C151]
    and  a
    jr   nz, label_A1C6
    ld   a, [$D601]
    and  a
    jr   nz, label_A1B9
    ld   hl, $C151
    inc  [hl]

label_A1B9::
    pop  af

label_A1BA::
    call label_B55B
    call label_1797
    call label_1D2E
    jp   label_F05

label_A1C6::
    ld   a, [$C150]
    ld   hl, $DB9A
    add  a, [hl]
    ld   [hl], a
    cp   $80
    jr   z, label_A1DE
    cp   $00
    jr   nz, label_A1E4
    ld   a, $03
    ld   [$FFA9], a
    ld   a, $30
    ld   [$FFAA], a

label_A1DE::
    xor  a
    ld   [$C14F], a
    jr   label_A1E7

label_A1E4::
    call label_A1BA

label_A1E7::
    ld   a, [$DB9A]
    cp   $80
    jr   z, label_A1F5
    ld   a, [$C14F]
    and  a
    jr   nz, label_A1F4

label_A1F4::
    pop  af

label_A1F5::
    ld   a, [$C19F]
    and  $7F
    jr   z, label_A203
    cp   $0C
    jr   z, label_A203
    cp   $0D
    ret  nz

label_A203::
    call label_A209
    jp   label_A317

label_A209::
    ld   hl, $D600
    ld   a, [$FFE7]
    and  $01
    or   [hl]
    ret  nz
    ld   hl, $C3CE
    ld   a, [hl]
    and  a
    jr   z, label_A21B
    dec  [hl]
    ret

label_A21B::
    ld   hl, $DB8F
    ld   a, [$DB90]
    or   [hl]
    jr   z, label_A274
    ld   a, $05
    ld   [$FFF3], a
    ld   a, [$DB90]
    ld   e, a
    ld   a, [$DB8F]
    sla  e
    rla
    sla  e
    rla
    sla  e
    rla
    inc  a
    cp   $0A
    jr   c, label_A23F
    ld   a, $09

label_A23F::
    ld   e, a
    ld   a, [$DB90]
    sub  a, e
    ld   [$DB90], a
    ld   a, [hl]
    sbc  a, $00
    ld   [hl], a
    ld   a, [$DB5E]
    add  a, e
    daa
    ld   [$DB5E], a
    ld   a, [$DB5D]
    adc  a, $00
    daa
    ld   [$DB5D], a
    cp   $10
    jr   c, label_A271
    ld   a, $09
    ld   [$DB5D], a
    ld   a, $99
    ld   [$DB5E], a
    xor  a
    ld   [$DB8F], a
    ld   [$DB90], a

label_A271::
    call label_A2CE

label_A274::
    ld   hl, $DB91
    ld   a, [$DB92]
    or   [hl]
    ret  z
    ld   a, $05
    ld   [$FFF3], a
    ld   a, [$DB92]
    ld   e, a
    ld   a, [$DB91]
    sla  e
    rla
    sla  e
    rla
    sla  e
    rla
    inc  a
    cp   $0A
    jr   c, label_A297
    ld   a, $09

label_A297::
    ld   e, a
    ld   a, [$DB92]
    sub  a, e
    ld   [$DB92], a
    ld   a, [hl]
    sbc  a, $00
    ld   [hl], a
    ld   a, [$DB5E]
    ld   hl, $DB5D
    or   [hl]
    ret  z
    ld   a, [$DB5E]
    sub  a, e
    daa
    ld   [$DB5E], a
    ld   a, [$DB5D]
    sbc  a, $00
    daa
    ld   [$DB5D], a
    jr   nc, label_A2CB
    xor  a
    ld   [$DB5D], a
    ld   [$DB5E], a
    ld   [$DB91], a
    ld   [$DB92], a

label_A2CB::
    jp   label_A2CE

label_A2CE::
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    add  a, $06
    ld   [$D600], a
    ld   hl, $D601
    add  hl, de
    ld   a, $9C
    ldi  [hl], a
    ld   a, $2A
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    push hl
    ld   a, [$DB5D]
    and  $0F
    ld   e, a
    add  a, $B0
    pop  hl
    ldi  [hl], a
    push hl
    ld   a, [$DB5E]
    swap a
    and  $0F
    add  a, $B0
    pop  hl
    ldi  [hl], a
    push hl
    ld   a, [$DB5E]
    and  $0F
    add  a, $B0
    pop  hl
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ret
    dec  b
    dec  b
    dec  b
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   de, label_1111
    add  hl, de
    add  hl, de
    add  hl, de

label_A317::
    xor  a
    ld   [$C163], a
    ld   a, [$DB5B]
    ld   e, a
    ld   d, $00
    ld   hl, label_A308
    add  hl, de
    ld   a, [$DB5A]
    cp   [hl]
    jr   nc, label_A342
    ld   a, $01
    ld   [$C163], a
    ld   a, [$C110]
    dec  a
    cp   $FF
    jr   nz, label_A33F
    ld   a, $30
    ld   hl, $FFF3
    ld   [hl], $04

label_A33F::
    ld   [$C110], a

label_A342::
    ld   a, [$FFE7]
    and  $01
    jr   z, label_A3A2
    ld   a, [$D600]
    and  a
    jr   nz, label_A3A2
    ld   a, [$DB93]
    and  a
    jr   z, label_A385
    dec  a
    ld   [$DB93], a
    ld   a, [$DB5B]
    cp   $0F
    jr   c, label_A361
    ld   a, $0E

label_A361::
    sla  a
    sla  a
    sla  a
    ld   e, a
    ld   a, [$DB5A]
    cp   e
    jr   nz, label_A374
    xor  a
    ld   [$DB93], a
    jr   label_A385

label_A374::
    inc  a
    ld   [$DB5A], a
    and  $07
    cp   $06
    jr   nz, label_A382
    ld   a, $06
    ld   [$FFF3], a

label_A382::
    jp   label_A414

label_A385::
    ld   a, [$DB94]
    and  a
    jr   z, label_A3A2
    dec  a
    ld   [$DB94], a
    ld   a, [$DB5A]
    and  a
    jr   z, label_A399
    dec  a
    ld   [$DB5A], a

label_A399::
    call label_A414
    ld   a, [$DB5A]
    and  a
    jr   z, label_A3A3

label_A3A2::
    ret

label_A3A3::
    ld   a, [$DB0D]
    and  a
    jr   z, label_A3FE
    dec  a
    ld   [$DB0D], a
    ld   a, $08
    ld   [$DB5A], a
    ld   a, [$DB93]
    add  a, $80
    ld   [$DB93], a
    ld   a, $A0
    ld   [$DBC7], a
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    add  a, $04
    ld   [$D600], a
    ld   hl, $D601
    add  hl, de
    ld   a, $9C
    ldi  [hl], a
    ld   a, $93
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, [$DB0D]
    add  a, $B0
    cp   $B0
    jr   z, label_A3E4
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ret

label_A3E4::
    ld   a, $7F
    ldi  [hl], a
    ld   a, $9C
    ldi  [hl], a
    ld   a, $72
    ldi  [hl], a
    ld   a, $C1
    ldi  [hl], a
    ld   a, $7F
    ldi  [hl], a
    xor  a
    ld   [hl], a
    ld   a, [$D600]
    add  a, $04
    ld   [$D600], a
    ret

label_A3FE::
    ret

label_A3FF::
    sbc  a, h
    dec  c
    ld   b, $7F
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    sbc  a, h
    dec  l
    ld   b, $7F
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    nop

label_A414::
    ld   a, [$D600]
    ld   e, a
    ld   d, $00
    add  a, $14
    ld   [$D600], a
    ld   hl, $D601
    add  hl, de
    push de
    ld   bc, label_A3FF
    ld   e, $15

label_A429::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_A429
    nop
    nop
    nop
    nop
    pop  de
    ld   hl, $D604
    add  hl, de
    ld   c, $00
    ld   a, [$DB5A]
    and  a
    jr   z, label_A462
    ld   [$FFD7], a

label_A442::
    ld   a, [$FFD7]
    sub  a, $08
    ld   [$FFD7], a
    jr   c, label_A459
    ld   a, $A9
    ldi  [hl], a
    inc  c
    ld   a, c
    cp   $07
    jr   nz, label_A457
    ld   a, l
    add  a, $03
    ld   l, a

label_A457::
    jr   label_A442

label_A459::
    add  a, $08
    jr   z, label_A462
    ld   a, $CE
    ldi  [hl], a
    jr   label_A46B

label_A462::
    ld   a, [$DB5B]
    cp   c
    jr   z, label_A477
    ld   a, $CD
    ldi  [hl], a

label_A46B::
    inc  c
    ld   a, c
    cp   $07
    jr   nz, label_A475
    ld   a, l
    add  a, $03
    ld   l, a

label_A475::
    jr   label_A462

label_A477::
    ret
    and  a

label_A479::
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    xor  $7D
    db   $ED ; Undefined instruction
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    rst  $28
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    rst  $28
    xor  $7D
    ld   a, l
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    rst  $28
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    xor  $7D
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    xor  $EF
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    xor  $7D
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    xor  $EF
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    rst  $28
    xor  $7D
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    xor  $ED
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction

label_A679::
    ld   a, l
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    xor  $EF
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    rst  $28
    rst  $28
    ld   a, l

label_A6B9::
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    xor  $EF
    ld   a, l
    ld   a, l
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    db   $ED ; Undefined instruction
    ld   a, l
    ld   a, l
    ld   a, l
    ld   a, l
    rst  $28
    rst  $28
    db   $ED ; Undefined instruction
    rst  $28
    ld   a, l
    ld   a, l

label_A6F9::
    nop
    ld   [bc], a
    inc  bc
    rlca
    dec  b
    ld   a, [bc]
    dec  bc
    rrca
    inc  b
    ld   [label_E09], sp
    ld   b, $0C
    dec  c
    ld   bc, $F6F0
    cp   $E8
    ret  z
    ld   hl, label_A479
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_A71C
    ld   hl, label_A6B9
    jr   label_A72A

label_A71C::
    swap a
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    add  hl, de

label_A72A::
    ld   a, [$FFF7]
    cp   $06
    jr   nz, label_A73A
    ld   a, [$DB6B]
    and  $04
    jr   z, label_A73A
    ld   hl, label_A679

label_A73A::
    ld   de, $D480
    ld   bc, $0040
    call label_2914
    ld   d, $00
    ld   e, $00

label_A747::
    ld   hl, $D480
    add  hl, de
    ld   a, [hl]
    cp   $7D
    jr   z, label_A7B5
    cp   $ED
    jr   z, label_A758
    cp   $EE
    jr   nz, label_A760

label_A758::
    ld   a, [$DBCD]
    and  a
    jr   nz, label_A76B
    ld   [hl], $EF

label_A760::
    ld   a, [$DBCC]
    and  a
    jr   nz, label_A76B
    ld   [hl], $7D
    jp   label_A7B5

label_A76B::
    push de
    call label_2BC1
    ld   c, e
    ld   b, d
    pop  de
    ld   a, [hl]
    bit  7, a
    jr   z, label_A7B5
    ld   a, [hl]
    and  $0F
    ld   c, a
    ld   b, $00
    ld   hl, label_A6F9
    add  hl, bc
    ld   a, [hl]
    inc  a
    add  a, $CF
    ld   c, a
    ld   hl, $D480
    add  hl, de
    ld   a, [hl]
    cp   $EE
    jr   z, label_A793
    cp   $ED
    jr   nz, label_A7A8

label_A793::
    push de
    push af
    call label_2BC1
    pop  af
    ld   e, $20
    cp   $ED
    jr   nz, label_A7A1
    ld   e, $10

label_A7A1::
    ld   a, [hl]
    and  e
    pop  de
    cp   $00
    jr   z, label_A7B5

label_A7A8::
    ld   hl, $D480
    add  hl, de
    ld   [hl], c
    ld   a, [$DBCC]
    and  a
    jr   nz, label_A7B5
    ld   [hl], $7D

label_A7B5::
    inc  e
    ld   a, e
    cp   $40
    jp   nz, label_A747
    ld   a, [$FFFE]
    and  a
    jr   z, label_A7E4
    di
    ld   e, $00
    ld   hl, $D480

label_A7C7::
    ld   d, $01
    xor  a
    ld   [rSVBK], a
    ld   a, [hl]
    cp   $ED
    jr   nz, label_A7D3
    ld   d, $06

label_A7D3::
    ld   a, $02
    ld   [rSVBK], a
    ld   a, d
    ld   [hl], a
    inc  hl
    inc  e
    ld   a, e
    cp   $40
    jr   nz, label_A7C7
    xor  a
    ld   [rSVBK], a
    ei

label_A7E4::
    ret
    ld   a, [$DBB0]
    and  $30
    swap a
    rst  0
    push af
    ld   h, a
    ld   a, [$FF67]
    ld   h, a
    inc  b
    ld   l, b
    ld   hl, $9D0F
    jr   label_A807
    ld   hl, $9D10
    jr   label_A807
    ld   hl, $9CEF
    jr   label_A807
    ld   hl, $9CF0

label_A807::
    ld   e, $04
    jr   label_A848
    ld   a, [$DBB0]
    and  $30
    swap a
    rst  0
    dec  de
    ld   l, b
    jr   nz, label_A87F
    dec  de
    ld   l, b
    jr   nz, label_A883
    ld   hl, $9D8F
    jr   label_A823
    ld   hl, $9D90

label_A823::
    ld   e, $24
    jr   label_A848
    ld   a, [$DBB0]
    and  $30
    swap a
    rst  0
    scf
    ld   l, b
    scf
    ld   l, b
    inc  a
    ld   l, b
    inc  a
    ld   l, b
    ld   hl, $9D0B
    jr   label_A83F
    ld   hl, $9CEB

label_A83F::
    ld   e, $00
    jr   label_A848
    ld   hl, $9D8B
    ld   e, $20

label_A848::
    ld   a, [$FFFE]
    and  a
    jr   z, label_A885
    push de
    push hl
    di
    ld   a, $02
    ld   [rSVBK], a
    ld   a, $01
    ld   [rVBK], a
    ld   c, $00
    ld   d, c

label_A85B::
    push hl
    ld   hl, $D480
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a
    inc  e
    inc  c
    ld   a, c
    cp   $10
    jr   z, label_A87D
    inc  hl
    and  $03
    jr   nz, label_A85B
    ld   a, e
    add  a, $04
    ld   e, a
    ld   a, l
    add  a, $1C
    ld   l, a
    ld   a, $00
    adc  a, h
    ld   h, a
    jr   label_A85B

label_A87D::
    xor  a
    ld   [rSVBK], a
    ld   [rVBK], a
    ei

label_A883::
    pop  hl
    pop  de

label_A885::
    ld   c, $00
    ld   d, c

label_A888::
    push hl
    ld   hl, $D480
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a
    inc  e
    inc  c
    ld   a, c
    cp   $10
    jr   z, label_A8AA
    inc  hl
    and  $03
    jr   nz, label_A888
    ld   a, e
    add  a, $04
    ld   e, a
    ld   a, l
    add  a, $1C
    ld   l, a
    ld   a, $00
    adc  a, h
    ld   h, a
    jr   label_A888

label_A8AA::
    ret

label_A8AB::
    nop
    ld   [$00F8], sp
    ld   a, [$FF10]

label_A8B1::
    nop
    db   $10 ; Undefined instruction

label_A8B4::
    rst  $38
    nop
    ld   bc, label_86FA
    pop  bc
    and  a
    jr   nz, label_A8C7
    ld   a, [$FFA1]
    cp   $01
    jr   z, label_A8E3
    cp   $02
    jr   z, label_A8E3

label_A8C7::
    ld   a, [$C13E]
    and  a
    jr   z, label_A8E4
    dec  a
    ld   [$C13E], a
    call label_21A8
    call label_AC75
    ld   a, [$FF9C]
    cp   $02
    jr   z, label_A8E3
    ld   a, [$FF9B]
    add  a, $03
    ld   [$FF9B], a

label_A8E3::
    ret

label_A8E4::
    ld   a, [$FF9C]
    rst  0
    ld   bc, $A16A
    ld   l, c
    db   $10 ; Undefined instruction

label_A8ED::
    nop
    ld   [$00F8], sp
    nop
    ld   b, $FA
    nop
    nop
    ld   b, $FA
    nop
    nop
    nop
    nop
    nop

label_A8FD::
    nop
    nop
    nop
    nop
    ld    hl, sp+$FA
    ld   a, [label_800]
    ld   b, $06
    nop
    nop
    nop
    nop
    nop

label_A90D::
    nop
    nop
    ld   bc, $F7F0
    cp   $07
    jr   nz, label_A92B
    call label_B719
    ld   a, [$DB94]
    add  a, $04
    ld   [$DB94], a
    ld   a, $03
    ld   [$FFF3], a
    ld   a, $80
    ld   [$DBC7], a
    ret

label_A92B::
    ld   a, [$DB0C]
    and  a
    jp   z, label_B719
    ld   hl, $FF9E
    res  1, [hl]
    call label_CB6
    ld   [$C146], a
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_A96E
    ld   a, [$FFCB]
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, label_A8ED
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF9A
    sub  a, [hl]
    jr   z, label_A95C
    inc  [hl]
    bit  7, a
    jr   z, label_A95C
    dec  [hl]
    dec  [hl]

label_A95C::
    ld   hl, label_A8FD
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF9B
    sub  a, [hl]
    jr   z, label_A96E
    inc  [hl]
    bit  7, a
    jr   z, label_A96E
    dec  [hl]
    dec  [hl]

label_A96E::
    ld   hl, $C120
    inc  [hl]
    ld   a, [$FFCB]
    and  $03
    jr   z, label_A982
    ld   e, a
    ld   d, $00
    ld   hl, label_A90D
    add  hl, de
    ld   a, [hl]
    ld   [$FF9E], a

label_A982::
    call label_21A8
    call label_AC75
    ld   a, [$C14F]
    and  a
    ret  nz
    ld   a, [$FFD7]
    cp   $B0
    jr   z, label_A99E
    cp   $B1
    jr   nz, label_A99B
    ld   a, $01
    jr   label_A99C

label_A99B::
    xor  a

label_A99C::
    ld   [$FF9C], a

label_A99E::
    jp   label_AB56
    call label_CB6
    ld   [$C146], a
    ld   [$C153], a
    ld   [$C152], a
    ld   a, [$FFCB]
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_A8AB
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   a, [$FFCB]
    rra
    rra
    and  $03
    ld   e, a
    ld   hl, label_A8AE
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a
    ld   a, $02
    ld   [$FF9E], a
    ld   a, [$FFCB]
    and  $0F
    jr   z, label_A9D7
    ld   hl, $C120
    inc  [hl]

label_A9D7::
    call label_21A8
    call label_AC75
    ld   a, [$C14F]
    and  a
    ret  nz
    ld   a, [$FFD7]
    cp   $B1
    jr   z, label_A9F3
    cp   $B0
    jr   nz, label_A9F0
    ld   a, $02
    jr   label_A9F1

label_A9F0::
    xor  a

label_A9F1::
    ld   [$FF9C], a

label_A9F3::
    call label_AB56
    ld   a, [$C133]
    and  $08
    jr   z, label_AA00
    xor  a
    ld   [$FF9C], a

label_AA00::
    ret
    ld   a, [$FFF7]
    cp   $06
    jr   nz, label_AA24
    ld   a, [$FFF6]
    cp   $F8
    jr   nz, label_AA24
    ld   a, [$C146]
    and  a
    jr   nz, label_AA24
    ld   a, [$FF98]
    sub  a, $46
    add  a, $04
    cp   $08
    jr   nc, label_AA24
    ld   a, [$FFCC]
    and  $04
    jp   nz, label_C7D

label_AA24::
    ld   a, [$C14A]
    and  a
    jr   z, label_AA4C
    ld   a, [$FFCC]
    and  $0F
    jr   nz, label_AA3E
    ld   a, [$C120]
    add  a, $02
    ld   [$C120], a
    call label_1756
    jp   label_AADB

label_AA3E::
    ld   [$C19A], a
    ld   a, [$C199]
    add  a, $0C
    ld   [$C199], a
    call label_CAF

label_AA4C::
    ld   a, [$C147]
    and  a
    jr   nz, label_AA94
    ld   a, [$C133]
    and  $08
    jr   nz, label_AA94
    ld   a, [$C146]
    and  a
    jr   nz, label_AA64
    ld   a, $01
    ld   [$C146], a

label_AA64::
    ld   a, $0A
    ld   [$C120], a
    ld   a, [$FF9A]
    and  a
    jr   z, label_AA73
    rlca
    and  $01
    ld   [$FF9E], a

label_AA73::
    ld   a, [$FFCB]
    and  $03
    jr   z, label_AA92
    ld   e, a
    ld   d, $00
    ld   hl, label_A8B1
    add  hl, de
    ld   a, [$FF9A]
    sub  a, [hl]
    jr   z, label_AA92
    ld   e, $01
    bit  7, a
    jr   nz, label_AA8D
    ld   e, $FF

label_AA8D::
    ld   a, [$FF9A]
    add  a, e
    ld   [$FF9A], a

label_AA92::
    jr   label_AADB

label_AA94::
    ld   a, [$C146]
    and  a
    jr   z, label_AAAA
    ld   a, $07
    ld   [$FFF4], a
    call label_CB6
    ld   [$C146], a
    ld   [$C152], a
    ld   [$C153], a

label_AAAA::
    ld   a, [$FFCB]
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, label_A8B1
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, label_A8B4
    add  hl, de
    ld   a, [hl]
    cp   $FF
    jr   z, label_AAD1
    ld   e, a
    ld   a, [$C16E]
    and  a
    jr   nz, label_AACB
    ld   a, e
    ld   [$FF9E], a

label_AACB::
    ld   hl, $C120
    inc  [hl]
    jr   label_AADB

label_AAD1::
    ld   a, [$C14B]
    and  a
    jr   nz, label_AADB
    xor  a
    ld   [$C120], a

label_AADB::
    ld   a, [$C137]
    and  a
    jr   nz, label_AAE6
    ld   a, [$FFA1]
    and  a
    jr   nz, label_AAFC

label_AAE6::
    call label_21A8
    ld   hl, $FF9E
    ld   a, [$FFCB]
    and  $0F
    cp   $04
    jr   nz, label_AAF6
    ld   [hl], $02

label_AAF6::
    cp   $08
    jr   nz, label_AAFC
    ld   [hl], $03

label_AAFC::
    call label_AC75
    ld   a, [$C14F]
    and  a
    ret  nz
    ld   a, [$FFD7]
    cp   $B1
    jr   z, label_AB2A
    cp   $B0
    jr   nz, label_AB34
    ld   a, [$C133]
    and  a
    jr   nz, label_AB26
    ld   a, [$DBC7]
    and  a
    jr   nz, label_AB1F
    ld   a, $02
    call label_9926

label_AB1F::
    ld   a, $04
    ld   [$FF9B], a
    xor  a
    ld   [$FF9A], a

label_AB26::
    ld   a, $02
    jr   label_AB32

label_AB2A::
    ld   a, [$FFCB]
    and  $0C
    jr   z, label_AB34
    ld   a, $01

label_AB32::
    ld   [$FF9C], a

label_AB34::
    ld   hl, $FF9B
    ld   a, [hl]
    sub  a, $40
    and  $80
    jr   z, label_AB56
    inc  [hl]
    ld   a, [$FF9B]
    and  $80
    jr   z, label_AB55
    ld   e, $20
    ld   a, [$DB00]
    cp   $0A
    jr   z, label_AB50
    ld   e, $10

label_AB50::
    ld   a, [$FFCB]
    and  e
    jr   nz, label_AB56

label_AB55::
    inc  [hl]

label_AB56::
    ret

label_AB57::
    ld   bc, label_402
    ld   [label_B10], sp
    dec  b
    ld   [label_808], sp

label_AB61::
    ld   [label_408], sp
    db   $10 ; Undefined instruction

label_AB66::
    ld   c, $04
    ld   b, $00
    call label_AC2F
    ld   a, [$FFD8]
    ld   [$FFD7], a
    xor  a
    ld   [$C133], a
    ld   c, $00
    ld   a, [$FF9A]
    and  a
    jr   z, label_ABA2
    and  $80
    jr   z, label_AB81
    inc  c

label_AB81::
    call label_AC2F
    ld   a, [$FFAF]
    cp   $8A
    jr   nz, label_AB99
    ld   a, [$C5A6]
    and  a
    jr   nz, label_AB99
    inc  a
    ld   [$C5A6], a
    ld   a, $51
    call label_2385

label_AB99::
    ld   a, [$FFAF]
    cp   $FF
    jr   nz, label_ABA2
    call label_AC69

label_ABA2::
    ld   c, $02
    ld   a, [$FF9B]
    and  a
    and  $80
    jr   nz, label_ABAC
    inc  c

label_ABAC::
    call label_AC2F
    ld   a, [$FF9B]
    and  $80
    jr   nz, label_ABD1
    ld   a, [$FFCB]
    and  $08
    jr   nz, label_ABD1
    ld   a, [$FFE9]
    and  $0F
    cp   $03
    jr   nc, label_ABD1
    ld   a, [$FFAF]
    cp   $62
    jr   z, label_ABD8
    cp   $64
    jr   z, label_ABD8
    cp   $66
    jr   z, label_ABD8

label_ABD1::
    ld   a, [$C133]
    and  $08
    jr   z, label_ABEB

label_ABD8::
    ld   a, [$C133]
    or   $08
    ld   [$C133], a
    xor  a
    ld   [$FF9B], a
    ld   a, [$FF99]
    and  $F0
    add  a, $00
    ld   [$FF99], a

label_ABEB::
    ld   a, [$C133]
    and  $04
    jr   z, label_ABF6
    ld   a, [$FFA0]
    ld   [$FF99], a

label_ABF6::
    ld   a, [$C133]
    and  $03
    ret  z
    ld   a, [$FF9F]
    ld   [$FF98], a
    ld   a, [$C14A]
    and  a
    ret  z
    call label_CAF
    ld   a, [$FF9A]
    cpl
    inc  a
    sra  a
    sra  a

label_AC10::
    ld   [$FF9A], a
    ld   a, $E8
    ld   [$FF9B], a
    call label_21A8
    call label_AC75
    ld   a, $20
    ld   [$C157], a
    ld   a, [$FF9E]
    and  $02
    sla  a
    ld   [$C158], a
    ld   a, $0B
    ld   [$FFF2], a
    ret

label_AC2F::
    ld   hl, label_AB5C
    add  hl, bc
    ld   a, [$FF98]
    sub  a, $08
    add  a, [hl]
    swap a
    and  $0F
    ld   e, a
    ld   hl, label_AB61
    add  hl, bc
    ld   a, [$FF99]
    add  a, [hl]
    sub  a, $10
    ld   [$FFE9], a
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
    ld   [$FFD8], a
    cp   $60
    jr   z, label_AC69
    cp   $01
    jr   nz, label_AC74

label_AC69::
    ld   hl, label_AB57
    add  hl, bc
    ld   a, [$C133]
    or   [hl]
    ld   [$C133], a

label_AC74::
    ret

label_AC75::
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ret  nz
    ld   a, [$FFF7]
    cp   $1F
    jr   nz, label_AC99
    ld   a, [$FFF9]
    and  a
    jr   z, label_AC99
    ld   a, [$FFF6]
    cp   $EB
    jr   z, label_AC92
    cp   $EC
    jr   nz, label_AC99

label_AC92::
    ld   a, [$FF99]
    cp   $2C
    jp  c, label_C7D

label_AC99::
    ld   e, $02
    ld   a, [$FF99]
    cp   $0C
    jr   c, label_ACB6
    inc  e
    cp   $84
    jr   nc, label_ACB6
    ld   e, $01
    ld   a, [$FF98]
    cp   $04
    jr   c, label_AD13
    dec  e
    cp   $9C
    jr   nc, label_AD13
    jp   label_AE09

label_ACB6::
    ld   a, [$FFF9]
    and  a
    jr   nz, label_ACD1
    ld   a, [$FFF7]
    cp   $1F
    jp   nz, label_AD5C
    ld   a, [$FFF6]
    cp   $F5
    jp   z, label_C7D
    cp   $F2
    jp   nz, label_AD5C
    jp   label_C7D

label_ACD1::
    ld   a, [$FFF6]
    cp   $E8
    jp   z, label_AD5C
    cp   $F8
    jp   z, label_AD5C
    cp   $FD
    jr   z, label_AD00
    cp   $A3
    jp   z, label_C7D
    cp   $C0
    jp   z, label_C7D
    cp   $C1
    jp   z, label_C7D
    cp   $FF
    jr   nz, label_AD0A
    ld   a, [$FF99]
    cp   $50
    jr   nc, label_AD00
    ld   a, [$C280]
    and  a
    jr   z, label_AD5C

label_AD00::
    ld   a, [$FFA0]
    ld   [$FF99], a
    xor  a
    ld   [$FF9B], a
    jp   label_AE09

label_AD0A::
    ld   a, [$FF9C]
    cp   $02
    jr   z, label_AD5C
    jp   label_C7D

label_AD13::
    ld   a, [$FF9F]
    ld   [$FF98], a
    xor  a
    ld   [$FF9A], a
    ld   a, [$FFF9]
    and  a
    jr   z, label_AD5C
    ld   a, [$FFF6]
    cp   $F5
    jp   z, label_C83
    cp   $FD
    jp   z, label_C83
    cp   $E9
    jp   z, label_C7D
    cp   $E8
    jp   z, label_AE09
    cp   $F8
    jp   z, label_AE09
    cp   $EF
    jp   z, label_AE09
    cp   $FF
    jp   z, label_AE09
    cp   $C0
    jr   nz, label_AD51
    ld   a, [$FF98]
    cp   $30
    jp  c, label_AE09
    jr   label_AD5C

label_AD51::
    cp   $C1
    jr   nz, label_AD5C
    ld   a, [$FF98]
    cp   $50
    jp   nc, label_AE09

label_AD5C::
    call label_CBE
    ld   a, [$C181]
    cp   $50
    jp   z, label_AE0C
    cp   $51
    jp   z, label_AE0C
    ld   a, [$C11F]
    cp   $07
    jp   z, label_AE0C
    ld   a, [$C11C]
    cp   $06
    jp   z, label_AE0C
    ld   a, [$FFF9]
    and  a
    jr   nz, label_AD88
    ld   a, [$C146]
    and  a
    jp   nz, label_AE0C

label_AD88::
    ld   a, [$C14A]
    and  a
    jr   nz, label_AD94
    ld   a, [$C16D]
    and  a
    jr   nz, label_AE0C

label_AD94::
    ld   a, [$C13E]
    ld   hl, $C157
    or   [hl]
    jr   nz, label_AE0C
    ld   a, [$FF99]
    cp   $88
    jr   nc, label_ADCC
    ld   a, [$C14A]
    ld   hl, $FFF9
    or   [hl]
    ld   hl, $FFB2
    or   [hl]
    jr   nz, label_ADCC
    ld   a, [$FFCB]
    and  $0F
    jr   z, label_AE0C
    and  $03
    jr   z, label_ADBE
    dec  a
    cp   e
    jr   z, label_ADCC

label_ADBE::
    ld   a, [$FFCB]
    rra
    rra
    and  $03
    jr   z, label_AE0C
    dec  a
    add  a, $02
    cp   e
    jr   nz, label_AE0C

label_ADCC::
    ld   a, [$FFF6]
    cp   $E8
    jr   nz, label_ADE4
    ld   a, [$FFF7]
    cp   $1F
    jr   z, label_ADE4
    ld   a, [$DBA5]
    and  a
    jr   z, label_ADE4
    xor  a
    ld   [$C1BF], a
    ld   [rSCX], a

label_ADE4::
    ld   a, e
    ld   [$C125], a
    ld   a, $01
    ld   [$C124], a
    xor  a
    ld   [$C14B], a
    ld   [$C121], a
    ld   [$C14A], a
    ld   [$C188], a
    ld   a, [$FF99]
    cp   $88
    jr   c, label_AE09
    ld   a, $02
    ld   [$C146], a
    ld   a, $08
    ld   [$FFA2], a

label_AE09::
    jp   label_AE45

label_AE0C::
    call label_178E
    ld   [$C13E], a
    jp   label_AE45
    ld   b, $09
    dec  bc
    dec  bc
    ld   b, $09
    inc  b
    inc  b

label_AE1D::
    ld   b, $06
    add  hl, bc
    inc  c
    rrca
    rrca
    add  hl, bc
    inc  c

label_AE25::
    inc  b
    nop

label_AE27::
    ld   [bc], a
    ld   b, $01
    ld   [bc], a
    inc  b
    ld   [label_201], sp
    inc  b
    ld   [label_202], sp
    nop
    nop
    inc  bc
    inc  bc
    ld   bc, $0001
    ld   bc, $00FF

label_AE3D::
    db   $10 ; Undefined instruction
    nop
    nop

label_AE41::
    nop
    nop
    ld   a, [$FF10]

label_AE45::
    ld   hl, $C10A
    ld   a, [$C17B]
    or   [hl]
    ret  nz
    ld   a, [$FFF9]
    and  a
    jr   z, label_AE55
    jp   label_AB66

label_AE55::
    xor  a
    ld   [$C133], a
    ld   a, [$FF9B]
    cp   $00
    jr   z, label_AEDD
    ld   e, $03
    rla
    ld   bc, label_AE25
    jr   nc, label_AE69
    dec  e
    inc  bc

label_AE69::
    ld   a, e
    ld   [$FFE3], a
    ld   e, $02
    ld   a, [bc]
    ld   c, a
    ld   b, $00

label_AE72::
    push de
    push bc
    call label_AF2C
    pop  bc
    pop  de
    inc  bc
    dec  e
    jr   nz, label_AE72
    ld   a, [$FF9B]
    and  $80
    jr   nz, label_AEC6
    ld   a, [$DBA5]
    and  a
    jr   nz, label_AEC6
    ld   a, [$FFAF]
    cp   $E9
    jr   nz, label_AEC6
    ld   a, [$DB0C]
    and  a
    jr   z, label_AEC6
    ld   a, [$C5A8]
    cp   $D5
    jr   z, label_AEC6
    ld   a, [$C11C]
    cp   $02
    jr   z, label_AEDD
    ld   a, $08
    ld   [$FFF2], a
    jr   label_AEB5

label_AEA9::
    ld   a, $08
    ld   [$FFF2], a

label_AEAD::
    ld   a, [$FF98]
    and  $F0
    add  a, $08
    ld   [$FF98], a

label_AEB5::
    ld   a, $02
    ld   [$C11C], a
    xor  a
    ld   [$FF9C], a
    ld   a, [$FF99]
    sub  a, $08
    ld   [$FF99], a
    jp   label_CB6

label_AEC6::
    ld   a, [$C133]
    and  $03
    jr   z, label_AEDD
    ld   e, a
    ld   d, $00
    ld   hl, label_AE39
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$FF98], a
    ld   a, [$FFA0]
    ld   [$FF99], a

label_AEDD::
    ld   a, [$FF9A]
    cp   $00
    jr   z, label_AF1C
    ld   e, $00
    rla
    ld   bc, label_AE27
    jr   nc, label_AEED
    inc  e
    inc  bc

label_AEED::
    ld   a, e
    ld   [$FFE3], a
    ld   e, $02
    ld   a, [bc]
    ld   c, a
    ld   b, $00

label_AEF6::
    push de
    push bc
    call label_AF2C
    pop  bc
    pop  de
    inc  bc
    dec  e
    jr   nz, label_AEF6
    ld   a, [$C133]
    and  $0C
    jr   z, label_AF1C
    srl  a
    srl  a
    ld   e, a
    ld   d, $00
    ld   hl, label_AE39
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   [$FF99], a
    ld   a, [$FF9F]
    ld   [$FF98], a

label_AF1C::
    ld   a, [$C133]
    and  a
    jr   nz, label_AF25
    ld   [$C1C3], a

label_AF25::
    jp   label_B4AD

label_AF28::
    ld   bc, label_402
    ld   [label_1521], sp
    ld   l, [hl]
    add  hl, bc
    ld   a, [$FF98]
    sub  a, $08
    add  a, [hl]
    ld   [$FFDB], a
    swap a
    and  $0F
    ld   e, a
    ld   hl, label_AE1D
    add  hl, bc
    ld   a, [$FF99]
    add  a, [hl]
    sub  a, $10
    ld   [$FFDC], a
    and  $F0
    or   e
    ld   e, a
    ld   [$FFE9], a
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
    ld   [$FFE4], a
    and  a
    jp   z, label_B461
    cp   $01
    jp   z, label_B277
    cp   $02
    jp   z, label_B260
    cp   $03
    jp   z, label_B1BB
    cp   $10
    jp   z, label_B19C
    cp   $04
    jp   z, label_B23D
    cp   $30
    jp   z, label_B277
    cp   $60
    jp   z, label_B277
    cp   $0A
    jp   z, label_B260
    cp   $FF
    jp   z, label_B461
    cp   $E0
    jp   z, label_B461
    cp   $F0
    jp   nc, label_B461
    cp   $C0
    jp   nz, label_B045
    ld   a, [$FF9E]
    cp   $02
    jp   nz, label_B03B
    ld   a, [$FFF8]
    bit  4, a
    jp   nz, label_B03B
    ld   a, [$FFF6]
    cp   $0E
    jr   nz, label_AFBD
    ld   a, [$DB14]
    ld   e, $33
    jr   label_AFC6

label_AFBD::
    cp   $8C
    jr   nz, label_AFE3
    ld   a, [$DB13]
    ld   e, $34

label_AFC6::
    and  a
    jr   z, label_B03E
    ld   a, [$FFF6]
    cp   $8C
    jr   nz, label_AFD4
    call label_27F2
    jr   label_AFD7

label_AFD4::
    call label_9420

label_AFD7::
    ld   a, $28
    call label_3B86
    ld   hl, $C2C0
    add  hl, de
    inc  [hl]
    jr   label_B02C

label_AFE3::
    cp   $2B
    jr   nz, label_AFFE
    ld   a, [$DB12]
    and  a
    ld   e, $32
    jr   z, label_B03E
    call label_27F2
    ld   a, $5F
    call label_3B86
    ld   hl, $C440
    add  hl, de
    dec  [hl]
    jr   label_B02C

label_AFFE::
    cp   $B5
    jr   nz, label_B00D
    ld   a, [$DB15]
    cp   $06
    ld   e, $31
    jr   nz, label_B03E
    jr   label_B015

label_B00D::
    ld   a, [$DB11]
    and  a
    ld   e, $30
    jr   z, label_B03E

label_B015::
    ld   a, [$FF99]
    ld   [$FFD8], a
    ld   a, [$FF98]
    ld   [$FFD7], a
    ld   a, $09
    call label_CC7
    ld   [hl], $DF
    ld   a, $DF
    ld   [$C111], a
    call label_27F2

label_B02C::
    ld   hl, $D800
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    or   $10
    ld   [hl], a
    ld   [$FFF8], a

label_B03B::
    jp   label_B277

label_B03E::
    ld   a, e
    call label_B504
    jp   label_B277

label_B045::
    ld   a, [$FFAF]
    cp   $DB
    jr   nz, label_B053
    ld   a, [$C11C]
    cp   $01
    jp   z, label_B277

label_B053::
    ld   a, [$FFE4]
    cp   $D0
    jp  c, label_B0DF
    cp   $D4
    jp   nc, label_B0DF
    sub  a, $D0
    ld   e, a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_B085
    ld   a, e
    cp   $00
    jr   nz, label_B078
    ld   a, [$FFDB]
    and  $0F
    cp   $08
    jp  c, label_B461
    jr   label_B085

label_B078::
    cp   $01
    jr   nz, label_B085
    ld   a, [$FFDB]
    and  $0F
    cp   $08
    jp   nc, label_B461

label_B085::
    ld   d, $00
    ld   a, [$FF9E]
    cp   e
    jp   nz, label_B0D8
    ld   a, [$C13E]
    ld   hl, $C121
    or   [hl]
    ld   hl, $D45E
    or   [hl]
    jr   nz, label_B0D8
    ld   a, [$C14A]
    and  a
    jr   nz, label_B0B5
    ld   hl, label_AF28
    add  hl, de
    ld   a, [$FFCB]
    and  [hl]
    jr   z, label_B0D8
    ld   a, [$C191]
    inc  a
    ld   [$C191], a
    cp   $0C
    jp  c, label_B277

label_B0B5::
    call label_CB6
    ld   hl, label_AE3D
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, label_AE41
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a
    ld   a, $1C
    ld   [$FFA3], a
    ld   a, $01
    ld   [$C146], a
    ld   a, $01
    ld   [$C10A], a
    ld   a, $08
    ld   [$FFF2], a

label_B0D8::
    xor  a
    ld   [$C191], a
    jp   label_B277

label_B0DF::
    cp   $90
    jp  c, label_B15F
    cp   $99
    jp   nc, label_B277
    sub  a, $90
    ld   e, a
    ld   d, $00
    bit  1, a
    jr   nz, label_B103
    ld   hl, $C1D0
    add  hl, de
    ld   e, [hl]
    ld   a, [$FF98]
    sub  a, e
    sub  a, $0C
    cp   $08
    jp   nc, label_B277
    jr   label_B112

label_B103::
    ld   hl, $C1E0
    add  hl, de
    ld   e, [hl]
    ld   a, [$FF99]
    sub  a, e
    sub  a, $14
    cp   $08
    jp   nc, label_B277

label_B112::
    ld   a, [$C188]
    and  a
    jp   nz, label_B277
    ld   a, [$FFE4]
    cp   $94
    jr   nc, label_B12C
    ld   a, [$DBD0]
    and  a
    jp   z, label_B277
    dec  a
    ld   [$DBD0], a
    jr   label_B147

label_B12C::
    cp   $98
    jr   z, label_B139
    ld   a, [$C18E]
    and  a
    jr   z, label_B147
    jp   label_B277

label_B139::
    ld   a, [$DBCF]
    and  a
    jr   nz, label_B147
    ld   a, $07
    call label_B4FE
    jp   label_B277

label_B147::
    ld   a, [$FFE4]
    sub  a, $90
    ld   [$C189], a
    xor  a
    ld   [$DBAC], a
    inc  a
    ld   [$C188], a
    call label_2802
    call label_9420
    jp   label_B277

label_B15F::
    cp   $7C
    jp  c, label_B461
    push af
    jr   z, label_B16B
    cp   $7D
    jr   nz, label_B16E

label_B16B::
    call label_B468

label_B16E::
    pop  af
    cp   $90
    jp   nc, label_B461
    sub  a, $7C
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_89CA
    add  hl, de
    ld   a, [$FFDB]
    rra
    rra
    rra
    and  $01
    ld   e, a
    ld   a, [$FFDC]
    rra
    rra
    and  $02
    or   e
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    and  a
    jp   nz, label_B277
    jp   label_B461

label_B19C::
    ld   a, [$C11C]
    cp   $02
    jp   z, label_B454
    ld   a, [$C5A8]
    cp   $D5
    jp   z, label_B454
    ld   a, [$FFDC]
    and  $0F
    cp   $08
    jp  c, label_B461
    call label_AEA9
    jp   label_B454

label_B1BB::
    ld   a, [$C15C]
    and  a
    jp   nz, label_B454
    ld   a, [$FFDC]
    and  $0F
    cp   $06
    jp   nc, label_B26A
    ld   a, [$DBA5]
    and  a
    jr   nz, label_B22C
    ld   a, [$DB79]
    cp   $01
    jr   z, label_B1DE
    ld   a, [$DB73]
    and  a
    jr   z, label_B22C

label_B1DE::
    ld   a, [$FFF6]
    cp   $77
    jr   z, label_B204
    cp   $D3
    jr   z, label_B204
    cp   $24
    jr   z, label_B204
    cp   $B5
    jr   z, label_B204
    cp   $2B
    jr   z, label_B204
    cp   $D9
    jr   z, label_B204
    cp   $AC
    jr   z, label_B204
    cp   $8C
    jr   z, label_B204
    cp   $0E
    jr   nz, label_B22C

label_B204::
    ld   a, [$DB79]
    cp   $01
    jr   nz, label_B213
    ld   a, $12
    call label_B504
    jp   label_B454

label_B213::
    xor  a
    ld   [$DB47], a
    ld   a, $98
    ld   [$C3C9], a
    call label_2373
    ld   a, [$C163]
    inc  a
    ld   [$DB10], a
    call label_C9E
    jp   label_B454

label_B22C::
    ld   a, [$C13E]
    and  a
    jp   nz, label_B454
    ld   a, [$DBA5]
    and  a
    jp   nz, label_C89
    jp   label_C7D

label_B23D::
    ld   a, [$D6F9]
    and  a
    jp   nz, label_B461
    ld   a, [$FFAF]
    cp   $DB
    jr   c, label_B277
    cp   $DD
    jr   nc, label_B277
    sub  a, $DB
    ld   e, a
    ld   d, $00
    ld   hl, label_B87B
    add  hl, de
    ld   a, [$D6FB]
    xor  [hl]
    jr   nz, label_B277
    jp   label_B461

label_B260::
    ld   hl, $C11F
    ld   [hl], $01
    cp   $0A
    jp   z, label_B461

label_B26A::
    ld   a, [$FFDB]
    and  $0F
    cp   $06
    jr   c, label_B277
    cp   $0B
    jp  c, label_B461

label_B277::
    ld   a, [$FFAF]
    cp   $69
    jr   nz, label_B28E
    ld   hl, $FFE3
    ld   a, [$FF9E]
    cp   [hl]
    jr   nz, label_B28B
    ld   a, [$C15B]
    and  a
    jr   nz, label_B28E

label_B28B::
    call label_B5F5

label_B28E::
    ld   hl, $FFE3
    ld   a, [$FF9E]
    cp   [hl]
    jr   nz, label_B2FA
    ld   a, [$C13E]
    ld   hl, $C146
    or   [hl]
    jr   nz, label_B2FA
    ld   a, [$DBA5]
    and  a
    ld   a, [$FFAF]
    jr   z, label_B2D1
    ld   e, $8A
    cp   $A9
    jr   z, label_B2EC
    ld   e, $8B
    cp   $4F
    jr   z, label_B2BB
    cp   $4E
    jr   z, label_B2BB
    cp   $88
    jr   nz, label_B2C3

label_B2BB::
    ld   a, [$C14A]
    and  a
    jr   nz, label_B2FA
    jr   label_B2EC

label_B2C3::
    cp   $DE
    jr   nz, label_B2D1
    ld   a, [$DBD0]
    and  a
    jr   nz, label_B2FA
    ld   e, $8C
    jr   label_B2EC

label_B2D1::
    cp   $20
    jr   nz, label_B2FA
    ld   a, [$DB01]
    cp   $03
    jr   z, label_B2FA
    ld   a, [$DB00]
    cp   $03
    jr   z, label_B2FA
    ld   a, [$DB66]
    and  $02
    jr   nz, label_B2FA
    ld   e, $8D

label_B2EC::
    ld   a, [$C5A6]
    and  a
    jr   nz, label_B2FA
    inc  a
    ld   [$C5A6], a
    ld   a, e
    call label_B4FE

label_B2FA::
    ld   a, [$C14A]
    and  a
    jr   nz, label_B330
    ld   a, [$C16A]
    cp   $05
    jr   nz, label_B330
    ld   hl, label_AE31
    add  hl, bc
    ld   a, [$FF9E]
    cp   [hl]
    jp   nz, label_B454
    ld   a, [$C1C3]
    inc  a
    ld   [$C1C3], a
    cp   $0C
    jp  c, label_B454
    xor  a
    ld   [$C1C3], a
    xor  a
    ld   [$C121], a
    ld   [$C122], a
    ld   a, $0C
    ld   [$C16D], a
    jp   label_B454

label_B330::
    ld   a, [$C15B]
    and  a
    jr   nz, label_B33B
    ld   a, $03
    ld   [$C144], a

label_B33B::
    ld   a, [$FFF7]
    and  a
    ld   a, [$FFAF]
    jr   z, label_B3AD
    cp   $88
    jr   z, label_B34F
    cp   $4E
    jr   z, label_B34F
    cp   $4F
    jp   nz, label_B3AD

label_B34F::
    ld   a, [$C14A]
    and  a
    jp   z, label_B454
    ld   a, [$FFDB]
    and  $F0
    ld   [$FFCE], a
    ld   a, [$FFDC]
    and  $F0
    ld   [$FFCD], a
    ld   a, [$FFE9]
    ld   e, a
    ld   d, $00
    call label_2178
    ld   a, $05
    call label_3B86
    jp  c, label_B454
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFE9]
    swap a
    and  $F0
    add  a, $08
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFE9]
    and  $F0
    add  a, $10
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], d
    ld   hl, $FFF4
    ld   [hl], $09
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $0F
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C4
    jp   label_B461

label_B3A3::
    dec  [hl]
    ld   b, h
    inc  hl
    inc  d
    daa

label_B3A8::
    inc  bc
    ld   bc, $0002
    ld   [bc], a

label_B3AD::
    ld   e, $20
    cp   $C5
    jr   nz, label_B41D
    ld   a, [$DBA5]
    and  a
    jp   nz, label_B454
    ld   a, [$FFF6]
    cp   $77
    jr   nz, label_B42D
    ld   a, [$DDD9]
    ld   a, [$FF98]
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FF99]
    and  $F0
    or   e
    ld   [$FFD7], a
    ld   e, $00
    ld   d, e

label_B3D4::
    ld   hl, label_B3A3
    add  hl, de
    ld   a, [$FFD7]
    cp   [hl]
    jr   nz, label_B3E6
    ld   a, [$FF9E]
    ld   hl, label_B3A8
    add  hl, de
    cp   [hl]
    jr   z, label_B3EE

label_B3E6::
    inc  de
    ld   a, e
    cp   $05
    jr   nz, label_B3D4
    jr   label_B454

label_B3EE::
    ld   a, e
    cp   $04
    jr   c, label_B42D
    ld   hl, $DB00

label_B3F6::
    ld   a, [hli]
    cp   $03
    jr   z, label_B402
    ld   a, l
    cp   $0C
    jr   nz, label_B3F6
    jr   label_B415

label_B402::
    ld   a, [$DB73]
    ld   hl, $DB79
    or   [hl]
    ld   hl, $DB7B
    or   [hl]
    ld   hl, $DB56
    or   [hl]
    and  $7F
    jr   z, label_B42D

label_B415::
    ld   a, $53
    call label_237C
    jp   label_B454

label_B41D::
    ld   a, [$DBA5]
    and  a
    jr   z, label_B454
    ld   a, [$FFAF]
    cp   $DE
    jr   z, label_B42F
    cp   $A7
    jr   nz, label_B454

label_B42D::
    ld   e, $40

label_B42F::
    ld   a, [$C191]
    inc  a
    ld   [$C191], a
    cp   e
    jr   c, label_B454
    ld   a, e
    ld   [$FFE8], a
    xor  a
    ld   [$C191], a
    call label_93B0
    ld   a, [$DBA5]
    and  a
    jr   nz, label_B454
    ld   a, [$FFF6]
    cp   $77
    jr   nz, label_B454
    ld   a, $02
    call label_9C8

label_B454::
    ld   hl, label_AE29
    add  hl, bc
    ld   a, [$C133]
    or   [hl]
    ld   [$C133], a
    scf
    ret

label_B461::
    xor  a
    ld   [$C191], a
    scf
    ccf
    ret

label_B468::
    ld   a, [$FFAF]
    cp   $B1
    jr   z, label_B472
    cp   $B2
    jr   nz, label_B493

label_B472::
    ld   a, [$FFDC]
    and  $0F
    cp   $06
    jr   nc, label_B4AC
    ld   a, $0C
    ld   [$FFF2], a
    ld   a, $05
    ld   [$C11C], a
    call label_178E
    ld   [$DBC7], a
    ld   [$C198], a
    ld   [$FFA2], a
    ld   [$FFA3], a
    jp   label_CAF

label_B493::
    cp   $C1
    jr   z, label_B4A3
    cp   $C2
    jr   z, label_B4A3
    cp   $BB
    jr   z, label_B4A3
    cp   $BC
    jr   nz, label_B4AC

label_B4A3::
    ld   a, [$FFDC]
    and  $0F
    cp   $0C
    jp   nc, label_C7D

label_B4AC::
    ret

label_B4AD::
    ld   a, [$C14A]
    and  a
    ret  z
    ld   a, [$DBAF]
    cp   $02
    ret  nz
    ld   a, [$C133]
    and  $03
    cp   $03
    jr   z, label_B4C9
    ld   a, [$C133]
    and  $0C
    cp   $0C
    ret  nz

label_B4C9::
    call label_CAF
    ld   a, [$FF9A]
    cpl
    inc  a
    sra  a
    sra  a
    ld   [$FF9A], a
    ld   a, [$FF9B]
    cpl
    inc  a
    sra  a
    sra  a
    ld   [$FF9B], a
    ld   a, $18
    ld   [$FFA3], a
    ld   a, $02
    ld   [$C146], a
    ld   a, $20
    ld   [$C157], a
    ld   a, [$FF9E]
    and  $02
    sla  a
    ld   [$C158], a
    ld   a, $0B
    ld   [$FFF2], a
    jp   label_1828

label_B4FE::
    call label_2385
    jp   label_178E

label_B504::
    call label_237C
    jp   label_178E

label_B50A::
    ld   [$00F8], sp
    nop

label_B50E::
    nop
    nop
    ld    hl, sp+$08

label_B512::
    ld   a, [$FF98]
    and  $F0
    ld   [$FFD7], a
    swap a
    ld   e, a
    ld   a, [$FF99]
    sub  a, $04
    and  $F0
    ld   [$FFD8], a
    or   e
    ld   e, a
    ld   [$FFFA], a
    ld   d, $00
    ld   hl, $D711
    ld   a, h
    add  hl, de
    ld   h, a
    ld   a, [$DBA5]
    ld   d, a
    ld   a, [hl]
    ld   [$FFB8], a
    ld   [$FFAF], a
    ld   e, a
    ret

label_B53A::
    ld   a, [$C11C]
    cp   $01
    jr   nz, label_B549
    ld   a, [$C13B]
    add  a, $04
    ld   [$C13B], a

label_B549::
    ld   a, [$C1A4]
    and  a
    jr   z, label_B587
    ld   hl, $C146
    ld   a, [$C14A]
    or   [hl]
    jr   nz, label_B55B
    call label_178E

label_B55B::
    call label_B512
    ld   c, $04
    ld   a, [$D463]
    cp   $01
    jr   z, label_B582
    ld   c, $FC
    ld   a, [$D6F9]
    and  a
    jr   nz, label_B582
    call label_2A26
    ld   c, $02
    cp   $05
    jr   z, label_B582
    cp   $09
    jr   z, label_B582
    cp   $08
    jr   nz, label_B586
    ld   c, $FD

label_B582::
    ld   a, c
    ld   [$C13B], a

label_B586::
    ret

label_B587::
    ld   a, [$FFFA]
    ld   [$FFFB], a
    ld   a, [$C17B]
    and  a
    ret  nz
    ld   a, [$FFA2]
    and  a
    jr   z, label_B5B2
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_B5B1
    ld   hl, $C000
    ld   a, [$FF99]
    add  a, $0B
    cp   $88
    jr   nc, label_B5B1
    ldi  [hl], a
    ld   a, [$FF98]
    add  a, $04
    ldi  [hl], a
    ld   a, $26
    ldi  [hl], a
    ld   [hl], $00

label_B5B1::
    ret

label_B5B2::
    xor  a
    ld   [$D475], a
    ld   a, [$C11C]
    cp   $02
    jr   z, label_B5B1

label_B5BD::
    ld   a, [$C124]
    ld   hl, $C19F
    or   [hl]
    jp   nz, label_B6C0
    call label_B512
    ld   c, a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_B5D9
    ld   a, c
    cp   $61
    jp   z, label_B6AA
    jr   label_B5E7

label_B5D9::
    ld   a, c
    cp   $4C
    jr   nz, label_B5E7
    ld   a, [$FF99]
    dec  a
    and  $0F
    cp   $0C
    jr   nc, label_B5F5

label_B5E7::
    call label_2A26
    ld   [$C181], a
    and  a
    jp   z, label_B7A2
    cp   $E0
    jr   nz, label_B635

label_B5F5::
    ld   a, [$DBC7]
    and  a
    jr   nz, label_B634
    call label_CAF
    ld   a, [$FF9A]
    cpl
    inc  a
    ld   [$FF9A], a
    ld   a, [$FF9B]
    cpl
    inc  a
    ld   [$FF9B], a
    ld   a, $02
    ld   [$C146], a
    ld   a, [$FFF9]
    and  a
    jr   nz, label_B61E
    ld   a, $10
    ld   [$FFA3], a
    ld   a, [$FFA2]
    add  a, $02
    ld   [$FFA2], a

label_B61E::
    ld   a, $10
    ld   [$C13E], a
    ld   a, $30
    ld   [$DBC7], a
    ld   a, [$DB94]
    add  a, $04
    ld   [$DB94], a
    ld   a, $03
    ld   [$FFF3], a

label_B634::
    ret

label_B635::
    ld   a, [$C181]
    cp   $FF
    jp   z, label_B7A2
    cp   $F0
    jr   c, label_B644
    jp   label_BC14

label_B644::
    cp   $51
    jr   z, label_B64C
    cp   $50
    jr   nz, label_B6C0

label_B64C::
    call label_CAF
    ld   a, $07
    ld   [$C11F], a
    ld   hl, $C1BB
    inc  [hl]
    ld   hl, $C17B
    ld   a, [$FFE7]
    and  $03
    or   [hl]
    jr   nz, label_B6BF
    ld   a, [$FF98]
    sub  a, $08
    ld   hl, $FFD7
    sub  a, [hl]
    bit  7, a
    ld   a, $FF
    jr   z, label_B672
    ld   a, $01

label_B672::
    ld   hl, $FF98
    add  a, [hl]
    ld   [hl], a
    ld   a, [$FFD8]
    add  a, $10
    ld   hl, $FF99
    sub  a, [hl]
    bit  7, a
    ld   a, $FF
    jr   nz, label_B687
    ld   a, $01

label_B687::
    ld   hl, $FF99
    add  a, [hl]
    ld   [hl], a
    ld   a, [$FF98]
    sub  a, $08
    add  a, $02
    and  $0F
    cp   $04
    jr   nc, label_B6BF
    ld   a, [$FF99]
    sub  a, $10
    add  a, $02
    and  $0F
    cp   $04
    jr   nc, label_B6BF
    ld   a, [$FF99]
    add  a, $03
    ld   [$FF99], a

label_B6AA::
    ld   a, $06
    ld   [$C11C], a
    call label_CAF
    ld   [$C198], a
    ld   a, [$C181]
    ld   [$DBCB], a
    ld   a, $0C
    ld   [$FFF3], a

label_B6BF::
    ret

label_B6C0::
    ld   hl, $C000
    ld   a, [$C181]
    cp   $08
    jr   nz, label_B6D5
    ld   a, [$C13B]
    add  a, $FD
    ld   [$C13B], a
    jp   label_B7A2

label_B6D5::
    cp   $09
    jr   nz, label_B6E4
    ld   a, [$C13B]
    add  a, $02
    ld   [$C13B], a
    jp   label_B7A2

label_B6E4::
    cp   $0B
    jr   z, label_B6EC
    cp   $07
    jr   nz, label_B750

label_B6EC::
    ld   a, [$FFB2]
    and  a
    jr   z, label_B6F4
    jp   label_BC50

label_B6F4::
    ld   a, [$C1AD]
    cp   $80
    jr   z, label_B750
    ld   a, [$C11C]
    cp   $08
    jr   z, label_B74F
    cp   $01
    jr   z, label_B74F
    ld   a, [$FF99]
    add  a, $FE
    call label_9928
    ld   a, [$FFAF]
    cp   $06
    jr   z, label_B719
    ld   a, [$DB0C]
    and  a
    jr   nz, label_B732

label_B719::
    ld   a, $50
    ld   [$FFB7], a
    ld   a, $08
    ld   [$C11C], a
    ld   a, [$FFAF]
    ld   [$FF9C], a
    ld   a, [$FF99]
    add  a, $02
    ld   [$FF99], a
    ld   a, $01
    ld   [$C167], a
    ret

label_B732::
    ld   a, $01
    ld   [$C11C], a
    xor  a
    ld   [$FF9C], a
    call label_178E
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, label_B50A
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, label_B50E
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a

label_B74F::
    ret

label_B750::
    cp   $06
    jp   z, label_B87D
    cp   $05
    jr   nz, label_B7A2
    ld   a, [$FF99]
    add  a, $0C
    ldi  [hl], a
    ld   a, [$FF98]
    add  a, $00
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    push af
    ldi  [hl], a
    ld   a, [$FF99]
    add  a, $0C
    ldi  [hl], a
    ld   a, [$FF98]
    add  a, $08
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    pop  af
    or   $20
    ld   [hl], a
    ld   a, $03
    ld   [$C11F], a
    ld   a, [$FFE7]
    and  $0F
    jr   nz, label_B79A
    ld   a, [$FFCB]
    and  $0F
    jr   z, label_B79A
    ld   a, [$C19F]
    and  a
    jr   nz, label_B79A
    ld   a, $0E
    ld   [$FFF2], a

label_B79A::
    ld   a, [$C13B]
    add  a, $02
    ld   [$C13B], a

label_B7A2::
    xor  a
    ld   [$C1BB], a
    ld   a, [$C11C]
    cp   $01
    jr   nz, label_B7B2
    ld   a, $00
    ld   [$C11C], a

label_B7B2::
    ld   a, [$C181]
    cp   $04
    jr   nz, label_B7E9
    ld   a, [$FFAF]
    cp   $DB
    jr   c, label_B7E9
    cp   $DD
    jr   nc, label_B7E9
    sub  a, $DB
    ld   e, a
    ld   d, $00
    ld   hl, label_B87B
    add  hl, de
    ld   a, [$D6FB]
    xor  [hl]
    jr   z, label_B7E9
    ld   a, [$D6F8]
    ld   e, a
    ld   d, $00
    ld   hl, label_B86F
    add  hl, de
    ld   a, [$C13B]
    add  a, [hl]
    ld   [$C13B], a
    ld   a, $01
    ld   [$D6F9], a
    ret

label_B7E9::
    ld   a, [$D6F9]
    and  a
    jr   z, label_B7F7
    ld   a, $07
    ld   [$FFF4], a
    xor  a
    ld   [$D6F9], a

label_B7F7::
    ld   a, [$DBA5]
    and  a
    jp   z, label_B86E
    ld   a, [$C124]
    and  a
    jr   nz, label_B86E
    ld   a, [$FFAF]
    cp   $AA
    jr   nz, label_B83C
    ld   a, [$C1CB]
    and  a
    jr   nz, label_B83C
    ld   a, [$C1CA]
    inc  a
    ld   [$C1CA], a
    cp   $18
    jr   nz, label_B833
    ld   a, $60
    ld   [$C1CB], a
    ld   a, $0E
    ld   [$FFF3], a
    ld   a, $03
    ld   [$FFA5], a
    ld   a, [$FFF6]
    cp   $C3
    jr   nz, label_B833
    ld   hl, $D879
    set  4, [hl]

label_B833::
    ld   a, [$C13B]
    add  a, $FD
    ld   [$C13B], a
    ret

label_B83C::
    xor  a
    ld   [$C1CA], a
    ld   a, [$FFFA]
    ld   hl, $FFFB
    cp   [hl]
    ld   hl, $C1C9
    jr   nz, label_B86C
    ld   a, [$FFAF]
    cp   $DF
    jr   nz, label_B86C
    ld   a, [$FFA1]
    ld   e, a
    ld   a, [$C1A9]
    ld   d, a
    ld   a, [$C19F]
    or   e
    or   d
    jr   nz, label_B86C
    inc  [hl]
    ld   a, [hl]
    cp   $28
    jr   c, label_B86E
    ld   a, $2B
    ld   [$FFF4], a
    jp   label_8D97

label_B86C::
    ld   [hl], $00

label_B86E::
    ret

label_B86F::
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    cp   $FE
    cp   $FD
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction

label_B87B::
    nop
    ld   [bc], a

label_B87D::
    ld   a, [$FF99]
    add  a, $08
    ldi  [hl], a
    ld   a, [$FF98]
    add  a, $FF
    ldi  [hl], a
    ld   a, $1A
    ldi  [hl], a
    ld   a, [$C120]
    rla
    rla
    and  $20
    push af
    push af
    ld   a, [$FFFE]
    and  a
    jr   z, label_B8A9
    ld   a, [$DBA5]
    and  a
    jr   nz, label_B8A9
    ld   a, [$FFF6]
    cp   $32
    jr   nz, label_B8A9
    pop  af
    or   $06
    jr   label_B8AA

label_B8A9::
    pop  af

label_B8AA::
    ldi  [hl], a
    ld   a, [$FF99]
    add  a, $08
    ldi  [hl], a
    ld   a, [$FF98]
    add  a, $07
    ldi  [hl], a
    ld   a, $1A
    ldi  [hl], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_B8CE
    ld   a, [$DBA5]
    and  a
    jr   nz, label_B8CE
    ld   a, [$FFF6]
    cp   $32
    jr   nz, label_B8CE
    pop  af
    or   $06
    jr   label_B8CF

label_B8CE::
    pop  af

label_B8CF::
    xor  $20
    ld   [hl], a
    ld   a, $03
    ld   [$C11F], a
    ret

label_B8D8::
    add  a, $3A
    nop
    nop

label_B8DC::
    nop
    nop
    db   $3A ; ldd  a, [hl]
    add  a, $04
    db   $FC ; Undefined instruction
    nop
    nop

label_B8E4::
    nop
    nop
    db   $FC ; Undefined instruction
    inc  b
    ld   a, [$C124]
    cp   $00
    jp   z, label_B9D9
    push af
    cp   $04
    jp  c, label_B9CC
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    ld   hl, label_B8D8
    add  hl, bc
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, label_B8DC
    add  hl, bc
    ld   a, [hl]
    ld   [$FF9B], a
    push bc
    call label_21A8
    pop  bc
    ld   hl, label_B8E0
    add  hl, bc
    ld   a, [$FF96]
    add  a, [hl]
    ld   [$FF96], a
    ld   hl, label_B8E4
    add  hl, bc
    ld   a, [$FF97]
    add  a, [hl]
    ld   [$FF97], a
    ld   hl, $C12D
    cp   [hl]
    jp   nz, label_B9CC
    ld   a, [$FF96]
    ld   hl, $C12C
    cp   [hl]
    jp   nz, label_B9CC
    pop  af
    ld   a, [$FFB1]
    and  a
    jr   z, label_B93D
    call label_27C3
    xor  a
    ld   [$FFB1], a

label_B93D::
    call label_178E
    ld   [$FFA3], a
    ld   [$C124], a
    ld   a, [$FF98]
    ld   [$DBB1], a
    ld   a, [$FF99]
    ld   [$DBB2], a
    ld   a, [$C125]
    cp   $03
    jr   nz, label_B97A
    ld   a, $01
    ld   [$FF9B], a
    call label_AE45
    ld   a, [$FFAF]
    cp   $DB
    jr   z, label_B97A
    cp   $DC
    jr   z, label_B97A
    cp   $E1
    jr   z, label_B971
    ld   a, [$C133]
    and  a
    jr   z, label_B97A

label_B971::
    ld   a, [$C17B]
    and  a
    jr   nz, label_B97A
    call label_AEAD

label_B97A::
    ld   a, [$C169]
    and  a
    jr   z, label_B986
    ld   [$FFF2], a
    xor  a
    ld   [$C169], a

label_B986::
    call label_3958
    ld   a, $FF
    ld   [$FFA6], a
    ld   a, [$DBA5]
    and  a
    ret  z
    ld   d, a
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_B99D
    ld   d, $00
    jr   label_B9A6

label_B99D::
    cp   $1A
    jr   nc, label_B9A6
    cp   $06
    jr   c, label_B9A6
    inc  d

label_B9A6::
    ld   a, [$FFF6]
    ld   e, a
    call label_29ED
    cp   $1A
    jr   z, label_B9BC
    cp   $19
    jr   z, label_B9BC
    ld   a, [$C18E]
    and  $E0
    cp   $80
    ret  nz

label_B9BC::
    ld   a, [$DBCD]
    and  a
    ret  z
    ld   a, [$FFF8]
    and  $10
    ret  nz
    ld   a, $0C
    ld   [$D462], a
    ret

label_B9CC::
    pop  af
    dec  a
    rst  0
    ld   a, [label_3E79]
    ld   a, e
    ld   a, a
    ld   a, e
    nop
    ld   a, h
    inc  bc
    ld   a, h

label_B9D9::
    ret

label_B9DA::
    ld   bc, label_201
    nop
    nop
    ld   [bc], a
    ld   bc, $0002
    ld   [bc], a
    ld   [bc], a
    nop
    ld   [bc], a
    ld   [bc], a
    nop
    ld   [bc], a
    ld   bc, $0002
    ld   [bc], a
    ld   bc, $0002
    ld   [bc], a
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    ld   a, [$DBA5]
    and  a
    jr   z, label_BA6D
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_BA48
    cp   $0B
    jr   nc, label_BA6D
    cp   $08
    jr   nz, label_BA48
    ld   a, [$FFF6]
    cp   $71
    jr   nz, label_BA48
    ld   a, c
    cp   $03
    jr   z, label_BA48
    ld   a, [$DB7C]
    ld   e, a
    ld   d, $00
    ld   hl, label_B9DA
    add  hl, de
    ld   a, [$C5AA]
    ld   e, a
    inc  a
    ld   [$C5AA], a
    add  hl, de
    ld   a, c
    cp   [hl]
    jr   z, label_BA3D
    xor  a
    ld   [$C5AA], a
    jp   label_BAA5

label_BA3D::
    ld   a, e
    cp   $07
    jp   nz, label_BAA5
    ld   a, $02
    ld   [$C169], a

label_BA48::
    xor  a
    ld   [$C5AA], a
    ld   hl, label_BB7B
    add  hl, bc
    ld   a, c
    cp   $02
    jr   nz, label_BA67
    ld   a, [$FFF7]
    cp   $05
    jr   nz, label_BA67
    ld   a, [$DBAE]
    cp   $1D
    jr   nz, label_BA67
    ld   a, $35
    ld   [$DBAE], a

label_BA67::
    ld   a, [hl]
    ld   hl, $DBAE
    jr   label_BA8C

label_BA6D::
    ld   a, [$C10C]
    and  a
    jr   z, label_BA84
    ld   a, c
    cp   $02
    jr   nz, label_BA84
    ld   a, $1E
    ld   [$C169], a
    ld   a, $63
    ld   hl, $FFF6
    jr   label_BA8D

label_BA84::
    ld   hl, label_BB77
    add  hl, bc
    ld   a, [hl]
    ld   hl, $FFF6

label_BA8C::
    add  a, [hl]

label_BA8D::
    ld   [hl], a
    cp   $41
    jr   nz, label_BAA5
    ld   a, c
    cp   $02
    jr   nz, label_BAA5
    ld   hl, $D841
    bit  6, [hl]
    jr   nz, label_BAA5
    set  6, [hl]
    ld   a, $02
    ld   [$C169], a

label_BAA5::
    call label_30F4
    ld   a, [$DBA5]
    and  a
    jr   z, label_BABD
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_BABD
    ld   a, $01
    ld   [$FF90], a
    ld   a, $02
    call label_9F5

label_BABD::
    call label_37FE
    call label_1D2E
    call label_1794
    ld   a, [$C1CF]
    and  a
    jr   z, label_BAE9
    xor  a
    ld   [$C1CF], a
    ld   a, [$DC0F]
    and  a
    ld   a, [$FFB0]
    jr   nz, label_BAE2
    ld   a, [$D47C]
    and  a
    ld   a, [$FFB0]
    jr   z, label_BAE2
    ld   a, $49

label_BAE2::
    ld   [$FFB1], a
    call label_27EA
    jr   label_BB36

label_BAE9::
    ld   a, [$DBA5]
    and  a
    jr   nz, label_BB36
    ld   a, [$DB4E]
    and  a
    jr   z, label_BB36
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, label_8000
    add  hl, de
    ld   a, [hl]
    ld   hl, $FFB0
    cp   [hl]
    jr   z, label_BB36
    ld   c, a
    cp   $25
    jr   nc, label_BB14
    ld   b, $00
    ld   hl, label_8120
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_BB2A

label_BB14::
    ld   a, [$D47C]
    and  a
    jr   z, label_BB2D
    ld   a, [$FFBD]
    cp   $49
    jr   z, label_BB33
    call label_BB2D
    ld   a, $49
    ld   [$FFB1], a
    ld   [$FFBD], a
    ret

label_BB2A::
    ld   a, c
    ld   [$FFBD], a

label_BB2D::
    ld   a, c
    ld   [$FFB1], a
    call label_27EA

label_BB33::
    ld   a, c
    ld   [$FFB0], a

label_BB36::
    ld   a, [$C124]
    inc  a
    ld   [$C124], a
    ret
    call label_D1E
    ld   a, [$D6FA]
    cp   $02
    jr   nz, label_BB4C
    ld   a, $02
    ld   [$FFBB], a

label_BB4C::
    jp   label_BB36

label_BB4F::
    nop
    nop
    ld   [bc], a
    ld   [bc], a

label_BB53::
    inc  d
    inc  c
    nop
    nop

label_BB57::
    nop
    nop
    inc  bc
    ld   [bc], a

label_BB5B::
    inc  d
    rra
    ld   [rJOYP], a

label_BB5F::
    ld   [label_A08], sp
    ld   a, [bc]

label_BB63::
    inc  d
    inc  d
    db   $10 ; Undefined instruction

label_BB67::
    nop
    add  hl, bc
    ld   [hl], b
    nop
    ld   b, b
    ld   b, b
    ld   [bc], a
    ld   [bc], a

label_BB6F::
    and  b
    ld   h, b
    nop
    nop

label_BB73::
    nop
    nop
    add  a, b
    add  a, b

label_BB77::
    ld   bc, $F0FF
    db   $10 ; Undefined instruction
    rst  $38
    ld    hl, sp+$08
    ld   a, [$FFBB]
    and  a
    ret  nz
    ld   e, $FF
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    and  $02
    jr   nz, label_BB91
    ld   e, $DF

label_BB91::
    ld   hl, label_BB6F
    add  hl, bc
    ld   a, [$C12C]
    add  a, [hl]
    ld   [$C12C], a
    ld   hl, label_BB73
    add  hl, bc
    ld   a, [$C12D]
    add  a, [hl]
    ld   [$C12D], a
    ld   hl, label_BB5B
    add  hl, bc
    ld   a, [$C12F]
    add  a, [hl]
    rl   d
    and  e
    ld   [$C127], a
    ld   hl, label_BB57
    add  hl, bc
    ld   a, [$C12E]
    rr   d
    adc  a, [hl]
    and  $03
    ld   [$C126], a
    ld   hl, label_BB53
    add  hl, bc
    ld   a, [$C12F]
    add  a, [hl]
    rl   d
    and  e
    ld   [$C12F], a
    ld   hl, label_BB4F
    add  hl, bc
    ld   a, [$C12E]
    rr   d
    adc  a, [hl]
    and  $03
    ld   [$C12E], a
    ld   hl, label_BB5F
    add  hl, bc
    ld   a, [hl]
    ld   [$C128], a
    ld   hl, label_BB63
    add  hl, bc
    ld   a, [hl]
    ld   [$C129], a
    ld   hl, label_BB67
    add  hl, bc
    ld   a, [hl]
    ld   [$C12A], a
    xor  a
    ld   [$C12B], a
    jp   label_BB36
    jp   label_2209
    ret

label_BC04::
    nop
    nop
    rst  $38
    ld   bc, rSB
    ld   bc, label_1FF
    rst  $38
    nop
    nop
    ld   bc, rSB
    rst  $38

label_BC14::
    ld   a, [$FFE7]
    and  $03
    ld   hl, $C167
    or   [hl]
    ld   hl, $FFA1
    or   [hl]
    ld   hl, $C1A9
    or   [hl]
    ret  nz
    ld   a, [$C181]
    sub  a, $F0
    ld   e, a
    ld   d, $00
    ld   hl, label_BC04
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$FF98], a
    ld   hl, label_BC0C
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   [$FF99], a
    ret

label_BC40::
    db   $FC ; Undefined instruction
    ld   a, [$F6F8]
    inc  c
    nop
    nop
    db   $F4 ; Undefined instruction

label_BC48::
    nop
    nop
    nop
    nop
    nop
    db   $F4 ; Undefined instruction
    inc  c
    nop

label_BC50::
    ld   a, [$FFE7]
    and  $00
    ld   hl, $C124
    or   [hl]
    ld   hl, $C1A9
    or   [hl]
    ld   hl, $FFA1
    or   [hl]
    ld   hl, $C19F
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    ret  nz
    ld   e, $01
    ld   a, [$FFAF]
    cp   $0E
    jr   nz, label_BC88
    ld   a, [$FFF6]
    cp   $3E
    jr   z, label_BC8B
    inc  e
    cp   $3D
    jr   z, label_BC8B
    inc  e
    cp   $3C
    jr   z, label_BC8B
    cp   $3F
    ret  nz
    ld   e, $00
    jr   label_BC8B

label_BC88::
    sub  a, $E7
    ld   e, a

label_BC8B::
    ld   d, $00
    ld   hl, label_BC40
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, label_BC48
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a
    call label_21A8
    jp   label_AE45
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
