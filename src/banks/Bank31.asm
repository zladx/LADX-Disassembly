section "bank31",romx,bank[$1F]

label_7C000::
    jp   label_7C009
    jp   label_7FB5C
    jp   label_7C01E

label_7C009::
    ld   hl, $D300

label_7C00C::
    ld   [hl], $00
    inc  l
    jr   nz, label_7C00C
    ld   a, $80
    ld   [rNR52], a
    ld   a, $77
    ld   [rNR50], a
    ld   a, $FF
    ld   [rNR51], a
    ret

label_7C01E::
    call label_7C204
    call label_7D3ED
    call label_7E4EC
    xor  a
    ld   [$D360], a
    ld   [$D370], a
    ld   [$D378], a
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

label_7C100::
    dec  l
    ld   b, d
    ldi  [hl], a
    ld   b, e
    ld   l, [hl]
    ld   b, e
    and  e
    ld   b, e
    ldh  [$FF0C], a
    ld   b, e
    dec  e
    ld   b, h
    ld   e, c
    ld   b, h
    ld   a, l
    ld   b, h
    and  c
    ld   b, h
    adc  a, $44
    dec  d
    ld   b, l
    ld   d, h
    ld   b, l
    sbc  a, e
    ld   b, l
    xor  [hl]
    ld   b, l
    call z, label_F045
    ld   b, l
    di
    ld   b, l
    ld   c, e
    ld   b, [hl]
    sbc  a, l
    ld   b, [hl]
    rst  $20
    ld   b, [hl]
    ld   bc, label_3247
    ld   b, a
    ld   b, l
    ld   b, a
    adc  a, d
    ld   b, a
    xor  [hl]
    ld   b, a
    rst  $28
    ld   b, a
    jr   label_7C17E
    ld   [hl], l
    ld   c, b
    rst  8
    ld   c, b
    ld   a, [bc]
    ld   c, c
    add  hl, sp
    ld   c, c
    ld   [hl], l
    ld   c, c
    or   b
    ld   c, c
    ld   [label_7F04A], sp
    ld   c, d
    reti
    ld   c, d
    db   $EC ; Undefined instruction
    ld   c, d
    ld   b, e
    ld   c, e
    sub  a, c
    ld   c, e
    or   c
    ld   c, e
    ld   sp, hl
    ld   c, e
    add  hl, de
    ld   c, h
    inc  l
    ld   c, h
    add  a, c
    ld   c, h
    pop  hl
    ld   c, h
    ld   h, $4D
    or   a
    ld   c, l
    rst  $28
    ld   c, l
    db   $10 ; Undefined instruction
    ld   d, [hl]
    ld   c, [hl]
    add  a, a
    ld   c, [hl]
    jp   z, label_234E
    ld   c, a
    add  a, h
    ld   c, a
    push af
    ld   c, a
    inc  a
    ld   d, b
    adc  a, [hl]
    ld   d, b
    jr   nz, label_7C1C5
    ld   h, a
    ld   d, c
    or   h
    ld   d, c
    db   $FC ; Undefined instruction
    ld   d, c
    ld   l, [hl]
    ld   d, d
    adc  a, c
    ld   d, d

label_7C17E::
    reti
    ld   d, d
    scf
    ld   d, e

label_7C182::
    ld   e, d
    ld   b, d
    jr   z, label_7C1C9
    ld   [hl], a
    ld   b, e
    or   c
    ld   b, e
    ld   a, [$FF43]
    dec  hl
    ld   b, h
    ld   e, a
    ld   b, h
    add  a, e
    ld   b, h
    xor  d
    ld   b, h
    rst  $20
    ld   b, h
    inc  hl
    ld   b, l
    ld   h, d
    ld   b, l
    and  c
    ld   b, l
    cp   a
    ld   b, l
    jp   nc, label_BB45
    ld   d, e
    rrca
    ld   b, [hl]
    ld   l, a
    ld   b, [hl]
    or   [hl]
    ld   b, [hl]
    db   $F4 ; Undefined instruction
    ld   b, [hl]
    rlca
    ld   b, a
    jr   c, label_7C1F5
    ld   d, e
    ld   b, a
    sub  a, b
    ld   b, a
    or   h
    ld   b, a
    db   $FD ; Undefined instruction
    ld   b, a
    ld   h, $48
    add  a, e
    ld   c, b
    jp  c, label_1048
    ld   c, c
    ld   b, a
    ld   c, c
    adc  a, [hl]
    ld   c, c
    cp   [hl]
    ld   c, c
    ld   c, a

label_7C1C5::
    ld   c, d
    ld   a, e
    ld   c, d
    rst  $18

label_7C1C9::
    ld   c, d
    rst  $30
    ld   c, d
    ld   d, c
    ld   c, e
    sub  a, a
    ld   c, e
    or   a
    ld   c, e
    rst  $38
    ld   c, e
    rra
    ld   c, h
    db   $3A ; ldd  a, [hl]
    ld   c, h
    adc  a, a
    ld   c, h
    rst  $28
    ld   c, h
    inc  [hl]
    ld   c, l
    push bc
    ld   c, l
    ld   a, [label_1E4D]
    ld   c, [hl]
    ld   e, h
    ld   c, [hl]
    sub  a, l
    ld   c, [hl]
    ret  c
    ld   c, [hl]
    ld   sp, $924F
    ld   c, a
    inc  bc
    ld   d, b
    ld   d, a
    ld   d, b
    sbc  a, h
    ld   d, b
    ld   l, $51
    ld   [hl], l
    ld   d, c
    jp   nz, label_2651
    ld   d, d
    ld   a, h
    ld   d, d
    sub  a, a
    ld   d, d

label_7C200::
    rst  $20
    ld   d, d
    dec  a
    ld   d, e

label_7C204::
    ld   hl, $D360
    ld   a, [hl]
    and  a
    jr   z, label_7C21C
    cp   $01
    jr   z, label_7C216
    ld   a, [$D3C6]
    and  a
    jp   nz, label_7D3E6

label_7C216::
    ld   a, [hl]
    ld   hl, label_7C100
    jr   label_7C223

label_7C21C::
    inc  hl
    ld   a, [hl]
    and  a
    ret  z
    ld   hl, label_7C182

label_7C223::
    call label_7FA64
    ld   de, $D390
    ld   bc, $D394
    jp   [hl]
    xor  a
    ld   [$D370], a
    ld   [$D371], a
    ld   [rNR30], a
    ld   a, $01
    ld   [$D3C8], a
    ld   hl, $D32F
    set  7, [hl]
    ld   hl, $D33F
    set  7, [hl]
    ld   hl, label_7C2EB
    call label_7FA7F
    call label_7E36A
    ld   hl, label_7C2FF
    call label_7FA85
    ld   hl, label_7C2D3
    jp   label_7D395
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $01
    jr   z, label_7C273
    cp   $02
    jr   z, label_7C285
    cp   $03
    jr   z, label_7C297
    cp   $04
    jr   z, label_7C2A9
    jr   label_7C2BB

label_7C273::
    ld   hl, label_7C2D9
    call label_7FA79
    ld   hl, label_7C2F0
    call label_7FA7F
    ld   hl, label_7C305
    jp   label_7FA85

label_7C285::
    ld   hl, label_7C2DF
    call label_7FA79
    ld   hl, label_7C2F5
    call label_7FA7F
    ld   hl, label_7C30B
    jp   label_7FA85

label_7C297::
    ld   hl, label_7C2E5
    call label_7FA79
    ld   hl, label_7C2FA
    call label_7FA7F
    ld   hl, label_7C311
    jp   label_7FA85

label_7C2A9::
    ld   hl, label_7C317
    call label_7FA79
    ld   hl, label_7C31D
    call label_7FA7F
    ld   hl, label_7C317
    jp   label_7FA85

label_7C2BB::
    ld   hl, $D32F
    res  7, [hl]
    ld   hl, $D33F
    res  7, [hl]
    xor  a
    ld   [rNR30], a
    ld   [$D3C8], a
    ld   a, $01
    ld   [$D3E7], a
    jp   label_7D3BB

label_7C2D3::
    nop
    add  a, b
    add  a, b
    adc  a, c
    add  a, [hl]
    ld   a, [bc]

label_7C2D9::
    nop
    add  a, b
    add  a, b
    sbc  a, [hl]
    add  a, [hl]
    ld   a, [bc]

label_7C2DF::
    nop
    add  a, b
    add  a, b
    or   d
    add  a, [hl]
    ld   a, [bc]

label_7C2E5::
    nop
    add  a, b
    add  a, b
    call nz, label_3086

label_7C2EB::
    nop
    ret  nz
    ld   b, $87
    ld   a, [bc]

label_7C2F0::
    nop
    ret  nz
    inc  d
    add  a, a
    ld   a, [bc]

label_7C2F5::
    nop
    ret  nz
    ld   hl, label_A87

label_7C2FA::
    nop
    ret  nz
    dec  l
    add  a, a
    jr   nc, label_7C280
    nop
    jr   nz, label_7C36E
    add  a, a
    ld   a, [bc]

label_7C305::
    add  a, b
    nop
    jr   nz, label_7C37C
    add  a, a
    ld   a, [bc]

label_7C30B::
    add  a, b
    nop
    jr   nz, label_7C38A
    add  a, a
    ld   a, [bc]

label_7C311::
    add  a, b
    nop
    jr   nz, label_7C298
    add  a, a
    jr   nc, label_7C318

label_7C318::
    nop
    nop
    nop
    ret  nz
    jr   nz, label_7C35D
    nop
    nop
    pop  bc
    jr   nz, label_7C344
    ld   d, e
    ld   b, e
    jp   label_7D395
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $08
    jp   z, label_7D3BB
    ld   hl, label_7C345
    call label_7FA64
    ld   a, $80
    ld   [rNR11], a
    ld   a, $F1
    ld   [rNR12], a
    jp   label_7D3DF

label_7C345::
    ld   e, c
    ld   b, e
    ld   e, h
    ld   b, e
    ld   e, a
    ld   b, e
    ld   h, d
    ld   b, e
    ld   h, l
    ld   b, e
    ld   l, b
    ld   b, e
    ld   l, e
    ld   b, e
    nop
    add  a, b
    pop  af
    and  a
    rst  0
    ld   [$C7A2], sp
    ld   [$C790], sp
    ld   [$C77B], sp
    ld   [$C759], sp
    ld   [$C797], sp
    ld   [$C7AC], sp
    ld   [$C7BE], sp
    jr   nz, label_7C390
    sbc  a, l
    ld   b, e
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $0D

label_7C37C::
    jp   z, label_7D3B5
    ld   hl, label_7C385
    jp   label_7FAE1

label_7C385::
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38

label_7C38A::
    nop
    cp   $00
    ld   bc, rJOYP

label_7C390::
    nop
    ld   bc, rJOYP
    nop
    nop
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    nop
    ret  nz
    add  a, b
    add  a, [hl]
    ld   bc, label_E3E
    ld   [$D3BC], a
    ld   hl, label_7C3DC
    call label_7FAB7
    jp   label_7D39A
    call label_7FA71
    ret  nz
    ld   a, [$D379]
    cp   $02
    jp   z, label_7D3B5
    ld   a, $02
    ld   [de], a
    call label_7FA75
    cp   $03
    jr   z, label_7C3CD

label_7C3C7::
    ld   hl, label_7C3D8
    jp   label_7FAE1

label_7C3CD::
    call label_7FA9A
    jp   z, label_7D3BB
    ld   a, $01
    ld   [bc], a
    jr   label_7C3C7

label_7C3D8::
    nop
    jr   nz, label_7C3DA
    ld   a, [$FF00]
    add  a, b
    add  a, a
    ret  nz
    add  a, [hl]
    ld   [bc], a
    ld   a, $04
    ld   [$D3BC], a
    ld   hl, label_7C417
    call label_7FAB7
    jp   label_7D39A
    call label_7FA71
    ret  nz
    ld   a, $04
    ld   [de], a
    call label_7FA75
    cp   $05
    jr   z, label_7C404

label_7C3FE::
    ld   hl, label_7C40F
    jp   label_7FAE1

label_7C404::
    call label_7FA9A
    jp   z, label_7D3BB
    ld   a, $01
    ld   [bc], a
    jr   label_7C3FE

label_7C40F::
    nop
    ld   b, $00
    inc  b
    nop
    ld   [bc], a
    rst  $38
    db   $F4 ; Undefined instruction

label_7C417::
    nop
    nop
    push bc
    ret  c
    add  a, a
    inc  b
    ld   a, $0A
    ld   [$D3BC], a
    ld   hl, label_7C453
    call label_7FAB7
    jp   label_7D395
    call label_7FA75
    cp   $09
    jr   z, label_7C438

label_7C432::
    ld   hl, label_7C443
    jp   label_7FAE1

label_7C438::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $01
    ld   [bc], a
    jr   label_7C432

label_7C443::
    nop
    ld   b, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    rst  $38
    ret  nc
    rst  $38
    and  b
    rst  $38
    and  b
    rst  $38
    ret  nc

label_7C453::
    nop
    add  a, b
    dec  de
    nop
    add  a, d
    ld   bc, label_7F121
    ld   b, h
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7D3BB
    ld   hl, label_7C477
    jp   label_7FA79

label_7C471::
    nop
    dec  a
    ld   a, [$FFD8]
    rst  0
    inc  bc

label_7C477::
    nop
    nop
    add  a, c
    ld   [$FF87], a
    ld   [$9521], sp
    ld   b, h
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7D3BB
    ld   hl, label_7C49B
    jp   label_7FA79
    ccf
    sbc  a, [hl]
    add  hl, hl
    add  a, b
    rst  0
    ld   [$9F1F], sp
    add  a, c
    jr   nz, label_7C427
    db   $10 ; Undefined instruction
    ret  z
    ld   b, h
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $09
    jp   z, label_7D3B5
    ld   hl, label_7C4B8
    jp   label_7FAE1

label_7C4B8::
    ld   bc, $0000
    ret  nz
    nop
    add  a, b
    nop
    ld   b, b
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    nop
    nop
    sbc  a, a
    and  b
    nop
    jp   nz, label_FA01
    ld   h, c
    db   $D3 ; Undefined instruction
    cp   $13
    jp   z, label_7D3E6
    ld   a, [$FF24]
    cp   $77
    jr   nz, label_7C4E2
    ld   hl, label_7C509

label_7C4DF::
    jp   label_7D39A

label_7C4E2::
    ld   hl, label_7C50F
    jr   label_7C4DF
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7D3BB
    ld   a, [$FF24]
    cp   $77
    jr   nz, label_7C505
    ld   a, $10

label_7C4FB::
    ld   [rNR12], a
    ld   a, $C7
    ld   [rNR14], a
    ld   a, $08
    ld   [de], a
    ret

label_7C505::
    ld   a, $20
    jr   label_7C4FB

label_7C509::
    nop
    sbc  a, a
    add  a, b
    and  b
    rst  0
    ld   [bc], a

label_7C50F::
    nop
    sbc  a, a
    ld   a, [$FFA0]
    rst  0
    ld   [bc], a
    ld   a, $05
    ld   [$D3BC], a
    ld   hl, label_7C54E
    call label_7FAB7
    jp   label_7D395

label_7C523::
    call label_7FA71
    ret  nz
    ld   a, $02
    ld   [de], a
    call label_7FA75
    cp   $07
    jr   z, label_7C537

label_7C531::
    ld   hl, label_7C542
    jp   label_7FAE1

label_7C537::
    call label_7FA9A
    jp   z, label_7D3BB
    ld   a, $01
    ld   [bc], a
    jr   label_7C531

label_7C542::
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    nop
    ret  nz

label_7C54A::
    nop
    add  a, b
    nop
    ld   b, b

label_7C54E::
    nop
    add  a, b
    db   $F4 ; Undefined instruction
    add  a, b
    add  a, e
    ld   bc, label_163E
    ld   [$D3BC], a
    ld   hl, label_7C58F
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $04
    jr   z, label_7C56F

label_7C569::
    ld   hl, label_7C589
    jp   label_7FAE1

label_7C56F::
    call label_7FA9A
    jp   z, label_7D3BB
    cp   $08
    jr   z, label_7C57E
    ld   a, $01
    ld   [bc], a
    jr   label_7C569

label_7C57E::
    xor  a
    ld   [bc], a
    ld   hl, label_7C595
    call label_7FAB7
    jp   label_7FA79

label_7C589::
    nop
    jr   z, label_7C58C

label_7C58C::
    nop
    rst  $38
    ld   a, [$FF00]
    add  a, e
    ld   b, a
    ret  nz
    add  a, [hl]
    ld   [bc], a

label_7C595::
    nop
    add  a, e
    ld   b, a
    nop
    add  a, a
    ld   [bc], a
    ld   hl, label_7C5A8
    jp   label_7D39A
    call label_7FA71
    ret  nz
    jp   label_7D3BB

label_7C5A8::
    daa

label_7C5A9::
    add  a, b
    jp   nz, label_8648
    jr   label_7C5A9
    ld   h, c
    db   $D3 ; Undefined instruction
    cp   $08
    jr   z, label_7C5B9
    and  a
    jp   nz, label_7D3E6

label_7C5B9::
    ld   hl, label_7C5C6
    jp   label_7D39A
    call label_7FA71
    ret  nz
    jp   label_7D3BB

label_7C5C6::
    ld   d, $AB
    jr   nz, label_7C54A
    add  a, $05
    ld   hl, label_7C5E4
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7D3BB
    ld   hl, label_7C5EA
    jp   label_7FA79

label_7C5E4::
    rla
    add  a, b
    dec  bc
    nop
    add  a, l
    db   $10 ; Undefined instruction
    add  a, b
    ld   c, $00
    push bc
    db   $10 ; Undefined instruction
    ld   e, h
    ld   a, e
    ld   a, $17
    ld   [$D3BC], a
    ld   hl, $D32F
    set  7, [hl]
    ld   hl, label_7C632
    call label_7FAD0
    call label_7FA7F
    ld   hl, label_7C637
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $02
    jr   z, label_7C625

label_7C616::
    ld   hl, label_7C630
    call label_7FB11
    ld   bc, $D394
    ld   hl, label_7C630
    jp   label_7FAE1

label_7C625::
    call label_7FA9A
    jp   z, label_7C63D
    ld   a, $01
    ld   [bc], a
    jr   label_7C616

label_7C630::
    nop
    ld   hl, label_C45
    nop
    add  a, h
    ld   [de], a

label_7C637::
    nop
    add  a, l
    dec  bc
    nop
    add  a, c
    ld   [de], a

label_7C63D::
    ld   hl, $D32F
    res  7, [hl]
    ld   hl, label_7C31D
    call label_7FA7F
    jp   label_7D3B5
    ld   a, [$D361]
    cp   $13
    jp   z, label_7D3E6
    ld   a, $08
    ld   [$D3BC], a
    ld   hl, $D32F
    set  7, [hl]
    ld   hl, label_7C692
    call label_7FAD0
    call label_7FA7F
    ld   hl, label_7C697
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $02
    jr   z, label_7C685

label_7C676::
    ld   hl, label_7C690
    call label_7FB11
    ld   bc, $D394
    ld   hl, label_7C690
    jp   label_7FAE1

label_7C685::
    call label_7FA9A
    jp   z, label_7C63D
    ld   a, $01
    ld   [bc], a
    jr   label_7C676

label_7C690::
    rst  $38
    ret  nc

label_7C692::
    ld   b, b
    ld   a, [bc]
    or   b
    add  a, a
    ld   [de], a

label_7C697::
    nop
    add  a, b
    add  hl, bc
    ret  nz
    add  a, [hl]
    ld   [de], a
    ld   a, $05
    ld   [$D3BC], a
    ld   a, [$FF24]
    cp   $77
    jr   nz, label_7C6B1
    ld   hl, label_7C6DB

label_7C6AB::
    call label_7FAB7
    jp   label_7D39A

label_7C6B1::
    ld   hl, label_7C6E1
    jr   label_7C6AB
    call label_7FA71
    ret  nz
    ld   a, $03
    ld   [de], a
    call label_7FA75
    cp   $04
    jr   z, label_7C6CA

label_7C6C4::
    ld   hl, label_7C6D5

label_7C6C7::
    jp   label_7FAE1

label_7C6CA::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $01
    ld   [bc], a
    jr   label_7C6C4

label_7C6D5::
    nop
    ldi  [hl], a
    nop
    add  hl, de
    rst  $38
    push bc

label_7C6DB::
    nop
    add  a, b
    and  h
    ld   a, e
    add  a, a
    inc  bc

label_7C6E1::
    nop
    add  a, b
    di
    ld   a, e
    add  a, a
    inc  bc
    ld   a, [$D361]
    and  a
    jp   nz, label_7D3E6
    ld   hl, label_7C6FB
    jp   label_7D39A
    call label_7FA71
    ret  nz
    jp   label_7D3BB

label_7C6FB::
    dec  [hl]
    or   b
    ld   h, b
    jr   nz, label_7C6C7
    inc  b
    ld   hl, label_7C720
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jp   z, label_7D3BB
    ld   hl, label_7C71C
    call label_7FA64
    jp   label_7FA79

label_7C71C::
    ld   h, $47
    inc  l
    ld   b, a

label_7C720::
    nop
    or   b
    add  hl, de
    ld   c, a
    rst  0
    ld   b, $00
    or   b
    add  hl, de
    ld   a, e
    rst  0
    ld   b, $00
    or   b
    add  hl, hl
    sbc  a, l
    rst  0
    inc  bc
    ld   hl, label_7C73F
    jp   label_7D39A
    call label_7FA71
    ret  nz
    jp   label_7D3BB

label_7C73F::
    nop
    nop
    add  a, c
    cp   e
    rst  0
    jr   nz, label_7C784
    ld   a, [hli]
    ld   [$D3BC], a
    ld   hl, label_7C784
    call label_7FAB7
    jp   label_7D395
    call label_7FA75
    cp   $03
    jr   z, label_7C760

label_7C75A::
    ld   hl, label_7C77E
    jp   label_7FAE1

label_7C760::
    call label_7FA9A
    jp   z, label_7D3BB
    cp   $0E
    jr   z, label_7C773
    cp   $1C
    jr   z, label_7C773
    ld   a, $01
    ld   [bc], a
    jr   label_7C75A

label_7C773::
    ld   hl, label_7C77E
    call label_7FAE1
    xor  a
    ld   [$D394], a
    ret

label_7C77E::
    nop
    jr   nz, label_7C780
    db   $E8 ; add  sp, d
    rst  $38
    sub  a, b

label_7C784::
    nop
    add  a, b
    rst  $10
    ld   l, b
    add  a, a
    ld   bc, $A221
    ld   b, a
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7D3B5
    ld   hl, label_7C7A8
    jp   label_7FA79
    cpl
    add  a, b
    ld   h, b
    ld   [$FF86], a
    inc  d

label_7C7A8::
    cpl
    add  a, b
    db   $10 ; Undefined instruction
    add  a, [hl]
    inc  d
    ld   hl, label_7C7D1
    jp   label_7D395
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jp   z, label_7D3BB
    ld   hl, label_7C7C9
    call label_7FA64
    jp   label_7FA79

label_7C7C9::
    rst  $10
    ld   b, a
    db   $47
    ld   b, a
    db   $E3 ; Undefined instruction
    ld   b, a
    jp   [hl]
    ld   b, a

label_7C7D1::
    nop
    add  a, b
    pop  bc
    and  a
    add  a, a
    ld   b, $00
    add  a, b
    pop  bc
    or   c
    add  a, a
    ld   b, $00
    add  a, b
    pop  bc
    cp   d
    add  a, a
    ld   b, $00
    add  a, b
    pop  bc
    cp   [hl]
    add  a, a
    ld   b, $00

label_7C7EA::
    add  a, b
    and  e
    push bc
    add  a, a
    jr   nz, label_7C7EA
    ld   h, c
    db   $D3 ; Undefined instruction
    cp   $1A
    jp   z, label_7D3E6
    ld   hl, label_7C80F
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7D3B5
    ld   hl, label_7C815
    jp   label_7D3DF

label_7C80F::
    nop
    add  a, b
    inc  [hl]

label_7C812::
    sub  a, b
    add  a, a
    ld   bc, label_7C8
    inc  b
    ld   a, $03
    ld   [$D3BC], a
    ld   hl, label_7C863
    call label_7FAB7
    jp   label_7D395
    call label_7FA71
    ret  nz
    ld   a, $04
    ld   [de], a
    call label_7FA75
    cp   $08
    jr   z, label_7C83A
    ld   hl, label_7C855
    jp   label_7FAE1

label_7C83A::
    call label_7FA9A
    jp   z, label_7D3B5
    cp   $02
    jr   z, label_7C850
    ld   hl, label_7C86F

label_7C847::
    call label_7FAB7
    ld   a, $04
    ld   [bc], a
    jp   label_7FA79

label_7C850::
    ld   hl, label_7C869
    jr   label_7C847

label_7C855::
    nop
    ld   a, [hli]
    nop
    ld   l, $00
    dec  h
    nop
    rlca
    nop
    dec  d
    nop
    rla
    nop
    inc  de

label_7C863::
    nop
    nop
    ld   c, h
    rst  $30
    add  a, [hl]
    inc  b

label_7C869::
    nop
    ld   b, b
    ld   b, b
    ld   a, e
    add  a, a
    inc  b

label_7C86F::
    nop
    add  a, b
    db   $10 ; Undefined instruction
    add  a, a
    inc  b
    ld   a, $2C
    ld   [$D3BC], a
    ld   hl, label_7C8C3
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $03
    jr   z, label_7C894
    cp   $05
    jr   z, label_7C8B0

label_7C88E::
    ld   hl, label_7C8BB
    jp   label_7FAE1

label_7C894::
    call label_7FA9A
    cp   $18
    jr   z, label_7C8A4
    cp   $17
    jr   z, label_7C8B0
    ld   a, $01
    ld   [bc], a
    jr   label_7C88E

label_7C8A4::
    ld   a, $02
    ld   [bc], a
    ld   hl, label_7C8C9
    call label_7FAB7
    jp   label_7FA79

label_7C8B0::
    call label_7FA9A
    jp   z, label_7D3BB
    ld   a, $03
    ld   [bc], a
    jr   label_7C88E

label_7C8BB::
    nop
    xor  [hl]
    rst  $38
    ld   h, b
    nop
    xor  d
    rst  $38
    ld   h, b

label_7C8C3::
    nop
    ld   b, b
    inc  c
    nop
    add  a, l
    ld   bc, label_7C000
    and  h
    ld   b, b
    add  a, [hl]
    ld   bc, label_83E
    ld   [$D3BC], a
    ld   hl, label_7C901
    jp   label_7D39A
    call label_7FA71
    ret  nz
    ld   a, $79
    ld   [rNR11], a
    call label_7FA75
    cp   $03
    jr   z, label_7C8F2

label_7C8E9::
    ld   hl, label_7C8FD
    call label_7FA64
    jp   label_7D3DF

label_7C8F2::
    call label_7FA9A
    jp   z, label_7D3BB
    ld   a, $02

label_7C8FA::
    ld   [bc], a
    jr   label_7C8E9

label_7C8FD::
    rlca
    ld   c, c
    inc  b
    ld   c, c

label_7C901::
    nop
    ld   a, c
    ld   [$FFC0], a
    call nz, label_C002
    call nz, label_210C
    dec  l
    ld   c, c
    jp   label_7D395
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jp   z, label_7D3BB
    ld   hl, label_7C925
    call label_7FA64
    jp   label_7D3DF

label_7C925::
    inc  sp
    ld   c, c
    inc  sp
    ld   c, c
    ld   [hl], $49
    ld   [hl], $49
    rra
    and  [hl]
    pop  hl
    nop
    rst  0
    db   $10 ; Undefined instruction
    add  a, $09
    nop
    add  a, $18
    ld   a, $0A
    ld   [$D3BC], a
    ld   hl, label_7C96F
    call label_7FAB7
    jp   label_7D395
    call label_7FA75
    cp   $09
    jr   z, label_7C954

label_7C94E::
    ld   hl, label_7C95F
    jp   label_7FAE1

label_7C954::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $01
    ld   [bc], a
    jr   label_7C94E

label_7C95F::
    nop
    jr   nc, label_7C962

label_7C962::
    ld   h, b
    nop
    ld   h, b
    nop
    jr   nc, label_7C967
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz

label_7C96F::
    nop
    add  a, b
    dec  bc
    jr   nz, label_7C8FA
    ld   bc, label_7E1FA
    db   $D3 ; Undefined instruction
    cp   $20
    jr   z, label_7C980
    and  a
    jp   nz, label_7D3E6

label_7C980::
    ld   a, $08
    ld   [$D3BC], a
    ld   hl, label_7C9AA
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $03
    jr   z, label_7C99B

label_7C995::
    ld   hl, label_7C9A6
    jp   label_7FAE1

label_7C99B::
    call label_7FA9A
    jp   z, label_7D3BB
    ld   a, $01
    ld   [bc], a
    jr   label_7C995

label_7C9A6::
    nop
    ret  nz
    rst  $38
    and  b

label_7C9AA::
    nop
    add  a, b
    pop  af
    add  a, b
    add  a, e
    ld   bc, label_1C3E
    ld   [$D3BC], a
    ld   hl, label_7C9F6
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $02
    jr   z, label_7C9CB

label_7C9C5::
    ld   hl, label_7C9F4
    jp   label_7FAE1

label_7C9CB::
    call label_7FA9A
    jp   z, label_7D3B5
    cp   $14
    jr   z, label_7C9DE
    cp   $0A
    jr   z, label_7C9E9
    ld   a, $01
    ld   [bc], a
    jr   label_7C9C5

label_7C9DE::
    xor  a
    ld   [bc], a
    ld   hl, label_7C9FC
    call label_7FAB7
    jp   label_7FA79

label_7C9E9::
    xor  a
    ld   [bc], a
    ld   hl, label_7CA02
    call label_7FAB7
    jp   label_7FA79

label_7C9F4::
    rst  $38
    rst  $38

label_7C9F6::
    nop

label_7C9F7::
    nop
    add  hl, de
    or   b
    add  a, a
    ld   bc, $0000
    ld   h, d
    and  a
    add  a, a
    ld   bc, $0000
    db   $10 ; Undefined instruction
    add  a, a
    ld   bc, label_7E1FA
    db   $D3 ; Undefined instruction
    cp   $22
    jp   z, label_7D3E6
    ld   bc, $D3D7
    call label_7FA75
    cp   $04
    jr   nc, label_7CA20

label_7CA1A::
    ld   hl, label_7CA52
    jp   label_7D39A

label_7CA20::
    cp   $06
    jr   nc, label_7CA2A

label_7CA24::
    ld   hl, label_7CA58
    jp   label_7D39A

label_7CA2A::
    cp   $08
    jr   nc, label_7CA34

label_7CA2E::
    ld   hl, label_7CA5E
    jp   label_7D39A

label_7CA34::
    cp   $09
    jr   nc, label_7CA3E
    ld   hl, label_7CA64
    jp   label_7D39A

label_7CA3E::
    cp   $0B
    jr   nc, label_7CA44
    jr   label_7CA2E

label_7CA44::
    cp   $0D
    jr   z, label_7CA4A
    jr   label_7CA24

label_7CA4A::
    ld   a, $01
    ld   [bc], a
    jr   label_7CA1A
    jp   label_7D3BB

label_7CA52::
    dec  d
    jr   c, label_7CA85
    ld   b, b
    add  a, $02

label_7CA58::
    dec  d
    jr   c, label_7CA9B
    inc  a
    add  a, $02

label_7CA5E::
    dec  d
    jr   c, label_7CAC1
    jr   c, label_7CA29
    ld   [bc], a

label_7CA64::
    dec  d
    jr   c, label_7C9F7
    inc  [hl]
    add  a, $02
    dec  d
    jr   c, label_7CA3D
    jr   nc, label_7CA35
    ld   [bc], a
    ld   hl, $D32F
    set  7, [hl]
    ld   hl, label_7CAAD
    jp   label_7D395
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $08
    jr   z, label_7CA97
    ld   hl, label_7CA9F
    call label_7FA64
    ld   a, [$D394]
    and  $01
    jp   nz, label_7FA7F
    jp   label_7FA79

label_7CA97::
    ld   hl, $D32F
    res  7, [hl]
    jp   label_7D3B5

label_7CA9F::
    or   e
    ld   c, d
    cp   b
    ld   c, d
    cp   [hl]
    ld   c, d
    jp   label_C94A
    ld   c, d
    adc  a, $4A
    call nc, label_4A
    add  a, b
    ldh  [$FF0C], a
    and  a
    add  a, a
    add  hl, bc
    add  a, b
    ldh  [$FF0C], a
    and  d
    add  a, a
    ld   [$8000], sp
    ldh  [$FF0C], a
    sub  a, b
    add  a, a
    ld   [$E280], sp
    ld   a, e

label_7CAC1::
    add  a, a
    ld   [$8000], sp
    or   d
    ld   e, c
    add  a, a
    add  hl, bc
    add  a, b
    ldh  [$FF0C], a
    sub  a, a
    add  a, a
    ld   a, [bc]
    nop
    add  a, b
    ldh  [$FF0C], a
    xor  h
    add  a, a
    dec  bc
    add  a, b
    ldh  [$FF0C], a
    cp   [hl]
    add  a, a
    db   $10 ; Undefined instruction
    and  $4A
    jp   label_7D39A
    call label_7FA71
    ret  nz
    jp   label_7D3BB
    daa
    add  a, b
    add  a, e
    nop
    add  a, [hl]
    jr   label_7CB2B
    rlca
    ld   [$D3BC], a
    ld   hl, label_7CB2B
    jp   label_7D395
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $06
    jr   z, label_7CB0F
    cp   $07
    jr   z, label_7CB1A

label_7CB06::
    ld   hl, label_7CB1F
    call label_7FA64
    jp   label_7D3DF

label_7CB0F::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $06
    ld   [bc], a
    jr   label_7CB06

label_7CB1A::
    ld   a, $03
    ld   [bc], a
    jr   label_7CB06

label_7CB1F::
    ld   sp, label_344B
    ld   c, e
    scf
    ld   c, e
    db   $3A ; ldd  a, [hl]
    ld   c, e
    dec  a
    ld   c, e
    ld   b, b
    ld   c, e

label_7CB2B::
    nop
    add  a, b
    and  l
    ld   b, $87
    ld   [bc], a
    ld   hl, label_207
    add  hl, sp
    rlca
    ld   [bc], a
    ld   c, a
    rlca
    ld   [bc], a
    ld   h, d
    rlca
    ld   [bc], a
    ld   [hl], h
    rlca
    ld   [bc], a
    ld   b, $07
    ld   [bc], a
    ld   a, $0E
    ld   [$D3BC], a
    ld   hl, label_7CB85
    call label_7FAB7
    jp   label_7D395
    call label_7FA71
    ret  nz
    ld   a, $03
    ld   [de], a
    call label_7FA75
    cp   $04
    jr   z, label_7CB65

label_7CB5F::
    ld   hl, label_7CB7F
    jp   label_7FAE1

label_7CB65::
    call label_7FA9A
    jp   z, label_7D3BB
    cp   $09
    jr   z, label_7CB74
    ld   a, $01
    ld   [bc], a
    jr   label_7CB5F

label_7CB74::
    xor  a
    ld   [bc], a
    ld   hl, label_7CB8B
    call label_7FAB7
    jp   label_7FA79

label_7CB7F::
    rst  $38
    ld   [rJOYP], a
    jr   nz, label_7CB83
    db   $FC ; Undefined instruction

label_7CB85::
    nop
    nop
    inc  c
    ld   a, [$FF87]
    inc  bc

label_7CB8B::
    nop
    nop
    and  a
    call c, label_387
    ld   hl, label_7CBAB
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7D3B5
    ld   a, $1E
    ld   [rNR10], a
    ld   a, $18
    ld   [de], a
    ret

label_7CBAB::
    inc  d
    ld   b, b
    ret  nz
    nop
    add  a, c
    inc  c
    ld   hl, label_7CBDE
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $08
    jp   z, label_7D3BB
    ld   hl, label_7CBD0
    call label_7FA64
    ld   a, $BD
    ld   [rNR11], a
    jp   label_7D3DF

label_7CBD0::
    db   $E4 ; Undefined instruction
    ld   c, e
    rst  $20
    ld   c, e
    ld   [$ED4B], a
    ld   c, e
    ld   a, [$FF4B]
    di
    ld   c, e
    or   $4B

label_7CBDE::
    nop
    cp   l
    ld   a, [$FFE0]
    rst  0
    inc  c
    ld   [$FFC7], a
    inc  bc
    ret  nz
    rst  0
    inc  bc
    and  b
    rst  0
    inc  b
    add  a, b
    rst  0
    inc  b
    ld   h, b
    rst  0
    dec  b
    ld   b, b
    rst  0
    ld   b, $20
    rst  0
    inc  bc
    ld   hl, label_7CC13
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7D3BB
    ld   a, $1E
    ld   [rNR10], a
    ld   a, $06
    ld   [de], a
    ret

label_7CC13::
    rla
    sub  a, [hl]
    ld   c, c
    ld   h, b
    add  a, $04
    ld   hl, label_7CC26
    jp   label_7D39A
    call label_7FA71
    ret  nz
    jp   label_7D3B5

label_7CC26::
    ld   d, $00
    ld   a, [$FF00]
    jp   nz, label_3E10
    inc  l
    ld   [$D3BC], a
    ld   hl, label_7CC75
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $0B
    jr   z, label_7CC47

label_7CC41::
    ld   hl, label_7CC61
    jp   label_7FAE1

label_7CC47::
    call label_7FA9A
    jp   z, label_7D3B5
    cp   $0C
    jr   z, label_7CC56
    ld   a, $01
    ld   [bc], a
    jr   label_7CC41

label_7CC56::
    xor  a
    ld   [bc], a
    ld   hl, label_7CC7B
    call label_7FAB7
    jp   label_7FA79

label_7CC61::
    nop
    ld   [$F0FF], sp
    nop
    ld   [$FCFF], sp
    nop
    ld   b, $FF
    ld    hl, sp+$00
    ld   b, $FF
    ld   a, [label_800]
    rst  $38
    rst  $38

label_7CC75::
    nop
    nop
    rrca
    ret  nc
    add  a, a
    ld   [bc], a

label_7CC7B::
    nop
    nop
    rst  $30
    ld   a, [$FF87]
    inc  b
    ld   a, $22
    ld   [$D3BC], a
    ld   hl, label_7CCCF
    call label_7FAB7
    jp   label_7D395
    call label_7FA75
    cp   $07
    jr   z, label_7CC9C

label_7CC96::
    ld   hl, label_7CCC3
    jp   label_7FAE1

label_7CC9C::
    call label_7FA9A
    jp   z, label_7D3BB
    cp   $1E
    jr   z, label_7CCB2
    cp   $06
    jr   z, label_7CCBE
    ld   a, $01
    ld   bc, $D394
    ld   [bc], a
    jr   label_7CC96

label_7CCB2::
    ld   hl, label_7CCD5

label_7CCB5::
    ld   a, $01
    ld   [bc], a
    call label_7FAB7
    jp   label_7FA79

label_7CCBE::
    ld   hl, label_7CCDB
    jr   label_7CCB5

label_7CCC3::
    nop
    ld   [bc], a
    nop
    ld   bc, $F0FF
    rst  $38
    ld   [rIE], a
    ret  nz
    nop
    ld   [hl], c

label_7CCCF::
    nop
    nop
    rrca
    nop
    add  a, a
    ld   bc, $0000
    ld   b, b
    db   $10 ; Undefined instruction
    ld   bc, $0000
    ld   b, a
    ld   [hl], b
    add  a, a
    ld   bc, label_33E
    ld   [$D3BC], a
    ld   hl, label_7CD20
    call label_7FAB7
    jp   label_7D395
    call label_7FA71
    ret  nz
    ld   a, $08
    ld   [de], a
    call label_7FA75
    cp   $05
    jr   z, label_7CD03

label_7CCFD::
    ld   hl, label_7CD18
    jp   label_7FAE1

label_7CD03::
    call label_7FA9A
    jp   z, label_7D3BB
    cp   $01
    jr   z, label_7CD12

label_7CD0D::
    ld   a, $01
    ld   [bc], a
    jr   label_7CCFD

label_7CD12::
    ld   a, $65
    ld   [rNR12], a
    jr   label_7CD0D

label_7CD18::
    nop
    inc  b
    rst  $38
    db   $00
    nop
    ld   b, $00
    add  hl, de

label_7CD20::
    nop
    add  a, b
    rra
    or   [hl]
    add  a, a
    ld   [label_93E], sp
    ld   [$D3BC], a
    ld   hl, label_7CDAB
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $29
    jr   z, label_7CD41

label_7CD3B::
    ld   hl, label_7CD5B
    jp   label_7FAE1

label_7CD41::
    call label_7FA9A
    jp   z, label_7D3BB
    cp   $03
    jr   z, label_7CD50
    ld   a, $01
    ld   [bc], a
    jr   label_7CD3B

label_7CD50::
    xor  a
    ld   [bc], a
    ld   hl, label_7CDB1
    call label_7FAB7
    jp   label_7FA79

label_7CD5B::
    nop
    jr   nc, label_7CD5E

label_7CD5E::
    jr   nc, label_7CD60

label_7CD60::
    jr   nc, label_7CD62

label_7CD62::
    jr   nc, label_7CD64

label_7CD64::
    jr   z, label_7CD66

label_7CD66::
    jr   z, label_7CD68

label_7CD68::
    jr   z, label_7CD6A

label_7CD6A::
    jr   z, label_7CD6C

label_7CD6C::
    jr   nz, label_7CD6E

label_7CD6E::
    jr   nz, label_7CD70

label_7CD70::
    jr   nz, label_7CD72

label_7CD72::
    jr   nz, label_7CD74

label_7CD74::
    jr   label_7CD76

label_7CD76::
    jr   label_7CD78

label_7CD78::
    jr   label_7CD7A

label_7CD7A::
    jr   label_7CD7C

label_7CD7C::
    stop
    stop
    stop
    db   $10 ; Undefined instruction
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    db   $E8 ; add  sp, d
    rst  $38
    db   $E8 ; add  sp, d
    rst  $38
    db   $E8 ; add  sp, d
    rst  $38
    db   $E8 ; add  sp, d
    rst  $38
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ld   [rIE], a
    ret  c
    rst  $38
    ret  c
    rst  $38
    ret  c
    rst  $38
    ret  c
    rst  $38
    ret  nc
    rst  $38
    ret  nc
    rst  $38
    ret  nc
    rst  $38
    ret  nc

label_7CDAB::
    nop
    add  a, b
    dec  e
    nop
    add  a, c
    stop
    add  a, b
    rst  $30
    nop
    add  a, c
    db   $10 ; Undefined instruction
    rlca
    ld   [$D3BC], a
    ld   hl, label_7CDE9
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $07
    jr   z, label_7CDD2

label_7CDCC::
    ld   hl, label_7CDDD
    jp   label_7FAE1

label_7CDD2::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $01
    ld   [bc], a
    jr   label_7CDCC

label_7CDDD::
    nop
    add  a, b
    nop
    ld   h, b
    nop
    ld   b, b
    rst  $38
    ret  nz
    rst  $38
    and  b
    rst  $38
    adc  a, b

label_7CDE9::
    nop
    add  a, b
    db   $F2 ; Undefined instruction
    nop
    add  a, l
    ld   bc, label_A3E
    ld   [$D3BC], a
    ld   hl, label_7CE0A
    jp   label_7D39A
    call label_7FA71
    ret  nz
    call label_7FA9A
    jp   z, label_7D3BB
    ld   hl, label_7CE0A
    jp   label_7FA79

label_7CE0A::
    rla
    cp   h
    ld   h, h
    ld   b, h
    rst  0
    ld   [bc], a
    ld   a, $14
    ld   [$D3BC], a
    ld   hl, label_7CE4A
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $03
    jr   z, label_7CE2B

label_7CE25::
    ld   hl, label_7CE46
    jp   label_7FAE1

label_7CE2B::
    call label_7FA9A
    jp   z, label_7D3BB
    cp   $10
    jr   z, label_7CE3A
    ld   a, $01
    ld   [bc], a
    jr   label_7CE25

label_7CE3A::
    ld   hl, label_7CE50
    ld   a, $01
    ld   [bc], a
    call label_7FAB7
    jp   label_7FA79

label_7CE46::
    rst  $38
    db   $FC ; Undefined instruction
    nop
    ld   [bc], a

label_7CE4A::
    nop
    nop
    add  hl, de
    ld   [label_187], a

label_7CE50::
    nop
    nop
    ld   b, a
    ld   [$FF87], a
    ld   bc, label_7F521
    ld   c, [hl]
    jp   label_7D395
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jp   z, label_7D3B5
    ld   hl, label_7CE71
    call label_7FA64
    jp   label_7FA79

label_7CE71::
    ld   a, e
    ld   c, [hl]
    add  a, c
    ld   c, [hl]
    rra
    add  a, b
    add  a, l
    and  b
    add  a, a
    inc  c
    rra
    add  a, b
    ld   b, a
    and  b
    add  a, a
    inc  c
    rra
    adc  a, l
    jr   nz, label_7CE25
    rst  0
    inc  c
    ld   a, $02
    ld   [$D3BC], a
    ld   hl, label_7CEC4
    call label_7FAB7
    jp   label_7D39A
    call label_7FA71
    ret  nz
    ld   a, $08
    ld   [de], a
    call label_7FA75
    cp   $04
    jr   z, label_7CEAD
    cp   $05
    jr   z, label_7CEB8

label_7CEA7::
    ld   hl, label_7CEBC
    jp   label_7FAE1

label_7CEAD::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $04

label_7CEB5::
    ld   [bc], a
    jr   label_7CEA7

label_7CEB8::
    ld   a, $01
    jr   label_7CEB5

label_7CEBC::
    nop
    ld   [$FDFF], sp
    nop
    inc  bc
    rst  $38
    ld    hl, sp+$00
    nop
    ld   h, b
    pop  de
    add  a, a
    ld   [label_C3E], sp
    ld   [$D3BC], a
    ld   hl, label_7CF17
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $09
    jr   z, label_7CEE9
    cp   $0A
    jr   z, label_7CF00

label_7CEE3::
    ld   hl, label_7CF05
    jp   label_7FAE1

label_7CEE9::
    call label_7FA9A
    jp   z, label_7D3B5
    cp   $09
    jr   z, label_7CEF5
    jr   label_7CEE3

label_7CEF5::
    xor  a
    ld   [bc], a
    ld   hl, label_7CF1D
    call label_7FAB7
    jp   label_7FA79

label_7CF00::
    ld   a, $01
    ld   [bc], a
    jr   label_7CEE3

label_7CF05::
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    rst  $38
    ld   a, [$0000]
    rra
    ret  nc
    add  a, a
    ld   bc, $0000
    and  a
    ret  c
    add  a, a
    ld   bc, label_53E
    ld   [$D3BC], a
    ld   hl, label_7CF78
    call label_7FAB7
    jp   label_7D39A
    call label_7FA71
    ret  nz
    ld   a, $02
    ld   [de], a
    call label_7FA75
    cp   $09
    jr   z, label_7CF49
    cp   $0A
    jr   z, label_7CF56

label_7CF43::
    ld   hl, label_7CF66
    jp   label_7FAE1

label_7CF49::
    call label_7FA9A
    jp   z, label_7D3B5
    cp   $03
    jr   z, label_7CF5B
    ld   a, [bc]
    jr   label_7CF43

label_7CF56::
    ld   a, $01
    ld   [bc], a
    jr   label_7CF43

label_7CF5B::
    xor  a
    ld   [bc], a
    ld   hl, label_7CF7E
    call label_7FAB7
    jp   label_7FA79

label_7CF66::
    nop
    stop
    stop
    stop
    stop
    inc  c
    nop
    ld   [label_400], sp
    nop
    ld   [bc], a
    rst  $38
    and  d

label_7CF78::
    nop
    add  a, b
    rra
    and  b
    add  a, [hl]
    ld   [bc], a

label_7CF7E::
    nop
    add  a, b
    add  a, a
    and  b
    add  a, [hl]
    ld   [bc], a
    ld   a, $0B
    ld   [$D3BC], a
    ld   hl, label_7CFEF
    call label_7FAB7
    jp   label_7D39A
    call label_7FA9A
    jr   z, label_7CFBB

label_7CF97::
    ld   a, [$D3E2]
    cp   $0D
    jr   nc, label_7CFAF
    and  $01
    jr   nz, label_7CFAB
    ld   a, $01

label_7CFA4::
    ld   [bc], a
    ld   hl, label_7CFE7
    jp   label_7FAE1

label_7CFAB::
    ld   a, $02
    jr   label_7CFA4

label_7CFAF::
    and  $01
    jr   nz, label_7CFB7
    ld   a, $03
    jr   label_7CFA4

label_7CFB7::
    ld   a, $04
    jr   label_7CFA4

label_7CFBB::
    push bc
    ld   bc, $D3E2
    call label_7FA75
    pop  bc
    cp   $05
    jr   z, label_7CFDB
    cp   $22
    jp   z, label_7D3B5
    cp   $11
    jr   nc, label_7CFE3

label_7CFD0::
    sra  a
    ld   e, a
    ld   a, $0B
    sub  a, e
    ld   [$D3BC], a
    jr   label_7CF97

label_7CFDB::
    ld   a, $A0
    ld   [rNR12], a
    ld   a, $05
    jr   label_7CFD0

label_7CFE3::
    ld   a, $11
    jr   label_7CFD0

label_7CFE7::
    nop
    jr   nz, label_7CFE9
    db   $E8 ; add  sp, d
    nop
    inc  e
    rst  $38
    ld   a, [$FF00]
    ld   b, b
    rra
    add  a, b
    add  a, e
    ld   bc, label_103E
    ld   [$D3BC], a
    ld   hl, label_7D036
    call label_7FAB7

label_7D000::
    jp   label_7D395
    call label_7FA75
    cp   $09
    jr   z, label_7D014
    cp   $0A
    jr   z, label_7D01F

label_7D00E::
    ld   hl, label_7D024
    jp   label_7FAE1

label_7D014::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $09
    ld   [bc], a
    jr   label_7D00E

label_7D01F::
    ld   a, $01
    ld   [bc], a
    jr   label_7D00E

label_7D024::
    nop
    ld   b, b
    nop
    jr   nc, label_7D029

label_7D029::
    jr   nz, label_7D02A
    ld   [rIE], a
    ret  nc
    rst  $38
    ret  nz
    rst  $38
    and  b
    rst  $38
    add  a, b
    nop
    ret  nc

label_7D036::
    nop
    add  a, b
    add  a, b
    nop
    add  a, [hl]
    ld   bc, label_7E1FA
    db   $D3 ; Undefined instruction
    and  a
    jp   nz, label_7D3E6
    ld   a, [$D3D6]
    and  a
    jr   nz, label_7D052
    ld   hl, label_7D082

label_7D04C::
    call label_7FAB7
    jp   label_7D39A

label_7D052::
    ld   hl, label_7D088
    jr   label_7D04C
    call label_7FA75
    cp   $0B
    jr   z, label_7D064
    ld   hl, label_7D06E
    jp   label_7FAE1

label_7D064::
    ld   hl, $D360
    ld   a, $38
    ldi  [hl], a
    xor  a
    ld   [hl], a
    jr   label_7D03C

label_7D06E::
    nop
    ret  nz
    nop
    sub  a, b
    nop
    ld   h, b
    nop
    jr   nc, label_7D077

label_7D077::
    jr   label_7D078
    db   $E8 ; add  sp, d
    rst  $38
    ret  nc
    rst  $38
    and  b
    rst  $38
    ld   [hl], b
    rst  $38
    ld   b, b

label_7D082::
    nop
    add  a, b
    and  b
    nop
    add  a, d
    ld   bc, $8000
    ret  nz
    nop
    add  a, e
    ld   bc, label_43E
    ld   [$D3BC], a
    ld   hl, label_7D114
    call label_7FAB7
    jp   label_7D395
    call label_7FA75
    cp   $0E
    jr   z, label_7D0BA
    cp   $0F
    jr   z, label_7D0C5

label_7D0A7::
    ld   a, [$D3BC]
    cp   $03
    jr   c, label_7D0B4
    ld   hl, label_7D0DC
    jp   label_7FAE1

label_7D0B4::
    ld   hl, label_7D0F8
    jp   label_7FAE1

label_7D0BA::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $0E
    ld   [bc], a
    jr   label_7D0A7

label_7D0C5::
    ld   a, [$D3BC]
    cp   $01
    jr   z, label_7D0D1
    ld   a, $01
    ld   [bc], a
    jr   label_7D0A7

label_7D0D1::
    xor  a
    ld   [bc], a
    ld   hl, label_7D11A
    call label_7FAB7
    jp   label_7FA79

label_7D0DC::
    nop
    ret  nz

label_7D0DE::
    nop
    and  b
    nop
    add  a, b
    nop
    ld   h, b
    nop
    ld   b, b
    nop
    jr   nz, label_7D0E8
    ld   [rIE], a
    ld   [rIE], a
    ret  nc
    rst  $38
    ret  nc
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    or   b
    rst  $38
    or   b

label_7D0F8::
    nop
    ld   h, b
    nop
    ld   d, b
    nop
    ld   b, b
    nop
    jr   nc, label_7D101

label_7D101::
    jr   nz, label_7D103

label_7D103::
    db   $10 ; Undefined instruction
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   [rIE], a
    ld   [rIE], a
    ret  nc
    rst  $38
    ret  nc

label_7D114::
    nop
    ld   b, b
    ld   c, l
    add  a, b
    add  a, e
    ld   bc, $8000
    jr   nz, label_7D0DE
    add  a, h
    ld   bc, label_43E
    ld   [$D3BC], a
    ld   hl, label_7D161
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $09
    jr   z, label_7D13F
    cp   $0A
    jr   z, label_7D14A

label_7D139::
    ld   hl, label_7D14F
    jp   label_7FAE1

label_7D13F::
    call label_7FA9A
    jp   z, label_7D3BB
    ld   a, $09
    ld   [bc], a
    jr   label_7D139

label_7D14A::
    ld   a, $01
    ld   [bc], a
    jr   label_7D139

label_7D14F::
    nop
    ld   [de], a
    nop
    ld   c, $00
    ld   a, [bc]
    nop
    ld   [label_600], sp
    nop
    inc  b
    nop
    ld   [bc], a
    nop
    ld   bc, $C1FF

label_7D161::
    nop
    nop
    and  h
    nop
    add  a, a
    ld   bc, label_53E
    ld   [$D3BC], a
    ld   hl, label_7D1AE
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $0C
    jr   z, label_7D18B
    cp   $0D
    jr   z, label_7D186

label_7D180::
    ld   hl, label_7D196
    jp   label_7FAE1

label_7D186::
    ld   a, $01
    ld   [bc], a
    jr   label_7D180

label_7D18B::
    call label_7FA9A
    jp   z, label_7D3B5
    ld   a, $0C
    ld   [bc], a
    jr   label_7D180

label_7D196::
    rst  $38
    ret  nz
    rst  $38
    and  b
    nop
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    and  b
    nop
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    and  b
    nop
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    and  b
    ld   bc, $0000
    nop
    add  a, a
    add  a, b
    add  a, a
    ld   bc, label_23E
    ld   [$D3BC], a
    ld   hl, label_7D1F0
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $09
    jr   z, label_7D1CF
    ld   hl, label_7D1E0
    jp   label_7FAE1

label_7D1CF::
    call label_7FA9A
    jp   z, label_7D3B5
    xor  a
    ld   [bc], a
    ld   hl, label_7D1F6
    call label_7FAB7
    jp   label_7FA79

label_7D1E0::
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100

label_7D1F0::
    nop
    nop
    ld   h, b
    ret  nc
    add  a, a
    ld   [bc], a

label_7D1F6::
    nop
    ld   b, b
    db   $10 ; Undefined instruction
    add  a, a
    ld   bc, label_7E1FA
    db   $D3 ; Undefined instruction
    cp   $04
    jp   z, label_7D3E6
    cp   $05
    jp   z, label_7D3E6
    cp   $07
    jp   z, label_7D3E6
    cp   $03
    jp   z, label_7D3E6
    cp   $0D
    jp   z, label_7D3E6
    ld   a, $0A
    ld   [$D3BC], a
    ld   hl, label_7D262
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $04
    jr   z, label_7D23C
    cp   $05
    jr   z, label_7D237

label_7D231::
    ld   hl, label_7D25A
    jp   label_7FAE1

label_7D237::
    ld   a, $01
    ld   [bc], a
    jr   label_7D231

label_7D23C::
    call label_7FA9A
    jp   z, label_7D253
    cp   $07
    jr   z, label_7D248
    jr   label_7D231

label_7D248::
    xor  a
    ld   [bc], a
    ld   hl, label_7D268
    call label_7FAB7
    jp   label_7FA79

label_7D253::
    ld   a, $3D
    ld   [$D360], a
    jr   label_7D1FC

label_7D25A::
    nop
    ret  nz
    nop
    add  a, b
    nop
    ld   b, b
    cp   $80

label_7D262::
    nop
    ld   b, b
    add  hl, de
    add  a, b
    add  a, e
    ld   bc, label_7C000
    add  a, [hl]
    add  a, b
    add  a, e
    ld   bc, label_7E1FA
    db   $D3 ; Undefined instruction
    cp   $3E
    jp   z, label_7D3E6
    ld   hl, label_7D283
    jp   label_7D39A
    call label_7FA71
    ret  nz
    jp   label_7D3BB

label_7D283::
    daa
    cp   [hl]
    ld   h, b
    ret  nz
    rst  0
    inc  bc
    ld   a, $09
    ld   [$D3BC], a
    ld   hl, label_7D2CD
    call label_7FAB7
    jp   label_7D39A
    call label_7FA75
    cp   $03
    jr   z, label_7D2A8
    cp   $04
    jr   z, label_7D2B7

label_7D2A2::
    ld   hl, label_7D2C7
    jp   label_7FAE1

label_7D2A8::
    call label_7FA9A
    jp   z, label_7D3B5
    cp   $06
    jr   z, label_7D2BC
    ld   a, $03
    ld   [bc], a
    jr   label_7D2A2

label_7D2B7::
    ld   a, $01
    ld   [bc], a
    jr   label_7D2A2

label_7D2BC::
    xor  a
    ld   [bc], a
    ld   hl, label_7D2D3
    call label_7FAB7
    jp   label_7FA79

label_7D2C7::
    nop
    ld   h, b
    nop
    ld   b, b
    rst  $38
    ld   [hl], b

label_7D2CD::
    nop
    add  a, b
    add  hl, de
    nop
    add  a, [hl]
    ld   bc, $8000
    pop  de
    db   $10 ; Undefined instruction
    ld   bc, label_43E
    ld   [$D3BC], a
    ld   hl, label_7D32B
    call label_7FAB7
    jp   label_7D39A
    call label_7FA9A
    jr   z, label_7D300

label_7D2EC::
    ld   a, [$D3E2]
    cp   $06
    jr   nc, label_7D2FC
    ld   a, $01

label_7D2F5::
    ld   [bc], a
    ld   hl, label_7D327
    jp   label_7FAE1

label_7D2FC::
    ld   a, $02
    jr   label_7D2F5

label_7D300::
    push bc
    ld   bc, $D3E2
    call label_7FA75
    pop  bc
    cp   $14
    jp   z, label_7D3BB
    cp   $06
    jp   z, label_7D319
    ld   a, $04
    ld   [$D3BC], a
    jr   label_7D2EC

label_7D319::
    ld   a, $04
    ld   [$D3BC], a
    ld   hl, label_7D331
    call label_7FAB7
    jp   label_7FA79

label_7D327::
    nop
    db   $10 ; Undefined instruction
    ld    hl, sp+$00
    add  a, b
    ld   a, [de]
    add  a, b
    add  a, d
    ld   bc, $8000
    push hl
    db   $10 ; Undefined instruction
    ld   bc, label_7E021
    ld   d, e
    jp   label_7D395
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $08
    jp   z, label_7D3BB
    ld   hl, label_7D352
    call label_7FA64
    jp   label_7FA79

label_7D352::
    ld   a, b
    ld   d, e
    ld   h, [hl]
    ld   d, e
    ld   a, [hl]
    ld   d, e
    ld   l, h
    ld   d, e
    add  a, h
    ld   d, e
    ld   [hl], d
    ld   d, e
    adc  a, d
    ld   d, e
    nop
    nop
    pop  bc
    ld   a, e
    add  a, a
    ld   b, $00
    nop
    pop  bc
    adc  a, d
    add  a, a
    ld   b, $00
    nop
    pop  bc
    sub  a, b
    add  a, a
    rlca
    nop
    nop
    pop  bc
    or   [hl]
    add  a, a
    rlca
    nop
    nop
    ld   h, d
    ld   a, e
    add  a, a
    inc  b
    nop
    nop
    ld   h, d
    adc  a, d
    add  a, a
    inc  b
    nop
    nop
    ld   h, d
    sub  a, b
    add  a, a
    inc  b
    nop
    nop
    ld   h, d
    or   [hl]
    add  a, a
    inc  b
    ld   a, $01
    ld   [$D3A0], a

label_7D395::
    ld   a, $01
    ld   [$D3C6], a

label_7D39A::
    ld   a, [$D360]
    ld   [$D361], a
    xor  a
    ld   [$D390], a
    ld   [$D394], a
    ld   [$D3E2], a
    ld   a, [$D31F]
    set  7, a
    ld   [$D31F], a
    jp   label_7FA79

label_7D3B5::
    ld   hl, label_7D3D9
    call label_7FA79

label_7D3BB::
    xor  a
    ld   [$D361], a
    ld   [$D390], a
    ld   [rNR10], a
    ld   [$D394], a
    ld   [$D3BC], a
    ld   [$D3A0], a
    ld   [$D3C6], a
    ld   a, [$D31F]
    res  7, a
    ld   [$D31F], a
    ret

label_7D3D9::
    nop
    ccf
    nop
    nop
    pop  bc
    ld   bc, label_206
    ld   c, $13
    jp   label_7FA91

label_7D3E6::
    xor  a
    ld   [$D360], a
    jp   label_7C204

label_7D3ED::
    ld   hl, $D370
    ld   a, [hl]
    and  a
    jr   z, label_7D405
    cp   $14
    jr   z, label_7D3FF
    ld   a, [$D3C8]
    and  a
    jp   nz, label_7E385

label_7D3FF::
    ld   a, [hl]
    ld   hl, label_7D41B
    jr   label_7D40C

label_7D405::
    inc  hl
    ld   a, [hl]
    and  a
    ret  z
    ld   hl, label_7D461

label_7D40C::
    call label_7FA64
    ld   de, $D392
    ld   bc, $D396
    ld   a, [$D3CD]
    and  a
    ret  nz
    jp   [hl]

label_7D41B::
    and  a
    ld   d, h
    di
    ld   d, h
    jr   c, label_7D476
    ld   h, h
    ld   d, l
    or   e
    ld   d, l
    ld   sp, hl
    ld   d, l
    ld   b, l
    ld   d, [hl]
    pop  de
    ld   d, [hl]
    ldd  [hl], a
    ld   d, a
    cp   $57
    and  e
    ld   e, b
    ld   c, c
    ld   e, c
    sbc  a, c
    ld   e, c
    pop  hl
    ld   e, c
    add  hl, de
    ld   e, d
    ld   b, h
    ld   e, d
    ld   h, a
    ld   e, e
    call nz, label_C5B
    ld   e, h
    add  a, b
    ld   e, h
    or   b
    ld   e, h
    db   $FC ; Undefined instruction
    ld   e, h
    add  a, h
    ld   e, l
    rst  $10
    ld   e, [hl]
    add  hl, de
    ld   e, a
    ld   a, b
    ld   e, a
    ret  nz
    ld   e, a
    inc  e
    ld   h, b
    ld   l, h
    ld   h, b
    ld   l, [hl]
    ld   h, b
    call nc, label_7CD60
    ld   h, c
    and  d
    ld   h, c
    inc  e
    ld   h, d
    ld   a, h
    ld   h, d

label_7D461::
    or   b
    ld   d, h
    inc  b
    ld   d, l
    ld   c, d
    ld   d, l
    add  a, l
    ld   d, l
    cp   h
    ld   d, l
    db   $10 ; Undefined instruction
    ld   e, [hl]
    ld   d, [hl]
    ldh  [$FF0C], a
    ld   d, [hl]
    ld   b, b
    ld   d, a
    inc  c
    ld   e, b
    xor  a

label_7D476::
    ld   e, b
    ld   e, d
    ld   e, c
    xor  d
    ld   e, c
    ld   [label_2A59], a
    ld   e, d
    ld   d, l
    ld   e, d
    ld   a, b
    ld   e, e
    push de
    ld   e, e
    dec  e
    ld   e, h
    sbc  a, c
    ld   e, h
    cp   c
    ld   e, h
    ld   a, [de]
    ld   e, l
    and  [hl]
    ld   e, l
    db   $E8 ; add  sp, d
    ld   e, [hl]
    dec  h
    ld   e, a
    sub  a, e
    ld   e, a
    ret
    ld   e, a
    dec  l
    ld   h, b
    ld   l, l
    ld   h, b
    add  a, h
    ld   h, b
    rst  $28
    ld   h, b
    ld   h, e
    ld   h, c
    rst  8
    ld   h, c
    ld   sp, $8562
    ld   h, d
    call label_7E36A
    ld   hl, label_7D4CF
    jp   label_7E2F3
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $06
    jp   z, label_7E32D
    ld   hl, label_7D4C5
    call label_7FA64
    jp   label_7FA85

label_7D4C5::
    push de
    ld   d, h
    db   $DB
    ld   d, h
    pop  hl
    ld   d, h
    rst  $20
    ld   d, h
    db   $ED ; Undefined instruction
    ld   d, h

label_7D4CF::
    add  a, b
    xor  $20
    set  0, a
    dec  b
    add  a, b
    xor  $20
    pop  de
    rst  0
    dec  b
    add  a, b
    xor  $20
    sub  a, $C7
    dec  b
    add  a, b
    xor  $20
    db   $C7
    rst  0
    rlca
    add  a, b
    xor  $40
    db   $C7
    rst  0
    rlca
    add  a, b
    xor  $60
    db   $C7
    rst  0
    rlca
    ld   a, $0C
    ld   [$D3BE], a
    call label_7E36F
    ld   hl, label_7D532
    call label_7FABD
    jp   label_7E2F8
    call label_7FA75
    cp   $02
    jr   z, label_7D516
    cp   $0A
    jp   z, label_7E327

label_7D510::
    ld   hl, label_7D520
    jp   label_7FAEB

label_7D516::
    call label_7FAA6
    jr   z, label_7D510
    ld   a, $01
    ld   [bc], a
    jr   label_7D510

label_7D520::
    nop
    stop
    ld   b, b
    nop
    ld   b, b
    nop
    jr   nc, label_7D529

label_7D529::
    jr   nc, label_7D52B

label_7D52B::
    jr   nz, label_7D52D

label_7D52D::
    db   $10 ; Undefined instruction
    ld   a, [$FFFF]
    ld   [$FF80], a
    nop
    jr   nz, label_7D4B6
    add  a, l
    ld   [bc], a
    ld   hl, label_7E3CC
    xor  a
    ld   [rNR30], a
    call label_7E347
    ld   hl, label_7D55E
    call label_7FABD
    jp   label_7E2F8
    call label_7FA75
    cp   $05
    jp   z, label_7E32D
    ld   hl, label_7D558
    jp   label_7FAEB

label_7D558::
    ld   bc, $FF80
    ld   a, [$FFFF]
    ld   [$FF80], a
    rst  $28
    jr   nz, label_7D562

label_7D562::
    add  a, $01
    ld   a, [$D371]
    and  a
    jp   nz, label_7E385
    ld   a, [$D361]
    cp   $01
    ret  z
    ld   a, [$D361]
    cp   $01
    ret  z
    ld   a, $02
    ld   [$D3BE], a
    call label_7E36F
    ld   hl, label_7D5A4
    jp   label_7E2F8
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jr   z, label_7D596
    ld   hl, label_7D5AA
    jp   label_7E37E

label_7D596::
    call label_7FAA6
    jp   z, label_7E32D
    xor  a
    ld   [bc], a
    ld   hl, label_7D5AD
    jp   label_7FA85

label_7D5A4::
    add  a, b
    ld   a, [$C040]
    rst  0
    inc  b

label_7D5AA::
    ld   [$FFC7], a
    inc  b

label_7D5AD::
    add  a, b
    ld   a, [$C060]
    rst  0
    inc  b
    call label_7E36A
    ld   hl, label_7D5F0
    jp   label_7E2F8
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $06
    jp   z, label_7E32D
    cp   $02
    jp   z, label_7D5DB
    cp   $04
    jp   z, label_7D5E2

label_7D5D2::
    ld   hl, label_7D5E6
    call label_7FA64
    jp   label_7E37E

label_7D5DB::
    ld   a, $40

label_7D5DD::
    ld   [rNR32], a
    ld   a, [bc]
    jr   label_7D5D2

label_7D5E2::
    ld   a, $60
    jr   label_7D5DD

label_7D5E6::
    or   $55
    di
    ld   d, l
    or   $55
    di
    ld   d, l
    or   $55

label_7D5F0::
    add  a, b
    ld   a, [$DA20]
    rst  0
    ld   [bc], a
    ld   [label_2C7], a
    ld   a, [$D361]
    cp   $01
    ret  z
    ld   a, $0C
    ld   [$D3BE], a
    call label_7E365
    ld   hl, label_7D639
    call label_7FABD
    jp   label_7E2F8
    call label_7FA75
    cp   $02
    jr   z, label_7D628

label_7D617::
    ld   hl, label_7D637
    jp   label_7FAEB

label_7D61D::
    xor  a
    ld   [bc], a
    ld   hl, label_7D63F
    call label_7FABD
    jp   label_7FA85

label_7D628::
    call label_7FAA6
    jp   z, label_7E327
    cp   $07
    jr   z, label_7D61D
    ld   a, $01
    ld   [bc], a
    jr   label_7D617

label_7D637::
    nop
    inc  bc

label_7D639::
    add  a, b
    jp   nc, label_E040
    add  a, a
    ld   bc, $D280
    ld   h, b
    ld   [$FF87], a
    ld   bc, label_7F1FA
    db   $D3 ; Undefined instruction
    cp   $03
    jp   z, label_7E385
    ld   a, $02
    ld   [$D3BE], a
    call label_7E365
    ld   hl, label_7D6C5
    call label_7FABD
    jp   label_7E2F8
    call label_7FA71
    ret  nz
    ld   a, $01
    ld   [de], a
    call label_7FA75
    cp   $1D
    jr   z, label_7D676
    cp   $15
    jr   nc, label_7D688

label_7D670::
    ld   hl, label_7D68D
    jp   label_7FAEB

label_7D676::
    call label_7FAA6
    jp   z, label_7E327
    ld   a, $14
    ld   [bc], a
    ld   hl, label_7D6CB
    call label_7FABD
    jp   label_7FA85

label_7D688::
    ld   a, $02
    ld   [de], a
    jr   label_7D670

label_7D68D::
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    ld   bc, $0000
    jr   nz, label_7D697
    ld   [rJOYP], a
    ld   b, b
    rst  $38
    ret  nz
    nop
    ld   h, b
    rst  $38
    and  b
    nop
    add  a, b
    rst  $38
    add  a, b
    nop
    and  b
    rst  $38
    ld   h, b
    nop
    ret  nz
    rst  $38
    ld   b, b
    ld   bc, rJOYP
    nop
    ld   bc, rJOYP
    nop
    rst  $38
    ld   [rIE], a
    ret  nz
    rst  $38
    and  b
    rst  $38
    add  a, b
    rst  $38
    ld   h, b
    rst  $38
    ld   b, b
    rst  $38
    jr   nz, label_7D6C3
    nop

label_7D6C5::
    add  a, b
    nop
    jr   nz, label_7D709
    add  a, h
    ld   [bc], a

label_7D6CB::
    add  a, b
    nop
    ld   h, b
    nop
    add  a, [hl]
    ld   [bc], a
    ld   a, $08
    ld   [$D3BE], a
    call label_7E379
    ld   hl, label_7D716
    call label_7FABD
    jp   label_7E2F3
    call label_7FA75
    cp   $0F
    jr   z, label_7D6EF

label_7D6E9::
    ld   hl, label_7D6FA
    jp   label_7FAEB

label_7D6EF::
    call label_7FAA6
    jp   z, label_7E327
    ld   a, $01
    ld   [bc], a
    jr   label_7D6E9

label_7D6FA::
    nop
    ld   a, [bc]
    nop
    ld   b, $FF
    ld   a, [$FF00]
    jr   nz, label_7D703

label_7D703::
    ld   a, [bc]
    nop
    ld   b, $FF
    ld   a, [$F6FF]
    nop
    jr   nz, label_7D70D

label_7D70D::
    ld   a, [bc]
    nop
    ld   b, $FF
    ld   a, [$F6FF]
    rst  $38
    xor  b

label_7D716::
    add  a, b
    nop
    jr   nz, label_7D77A
    add  a, a
    nop

label_7D71C::
    adc  a, d
    rst  $18
    db   $FD ; Undefined instruction
    xor  b
    add  a, a
    ld   b, d
    inc  h
    ld   a, b
    adc  a, d
    rst  $18
    db   $FD ; Undefined instruction
    xor  b
    add  a, a
    ld   b, d
    inc  h
    ld   a, b

label_7D72C::
    ld   hl, label_7D71C
    jp   label_7E35A
    ld   hl, $D32F
    set  7, [hl]
    call label_7D72C
    ld   hl, label_7D790
    jp   label_7E2F3
    call label_7FA71

label_7D743::
    ret  nz
    call label_7FA75
    cp   $14
    jr   z, label_7D75C
    ld   hl, label_7D76A

label_7D74E::
    call label_7FA64

label_7D751::
    ld   a, [$D396]
    and  $01
    jp   nz, label_7FA7F
    jp   label_7FA85

label_7D75C::
    ld   hl, label_7C31D
    call label_7FA7F
    ld   hl, $D32F
    res  7, [hl]
    jp   label_7E327

label_7D76A::
    call z, label_9657
    ld   d, a
    pop  de
    ld   d, a
    sbc  a, h
    ld   d, a
    sub  a, $57
    and  d

label_7D775::
    ld   d, a
    db   $DB
    ld   d, a
    xor  b
    ld   d, a

label_7D77A::
    ld   [$FF57], a

label_7D77C::
    xor  [hl]
    ld   d, a
    push hl
    ld   d, a
    or   h
    ld   d, a
    ld   [$BA57], a
    ld   d, a
    rst  $28
    ld   d, a
    ret  nz
    ld   d, a
    db   $F4 ; Undefined instruction
    ld   d, a
    add  a, $57
    ld   sp, hl
    ld   d, a

label_7D790::
    add  a, b
    and  $20
    adc  a, d
    rst  0
    ld   [$E680], sp
    jr   nz, label_7D731
    rst  0
    ld   [label_7E080], sp
    jr   nz, label_7D73C
    rst  0
    ld   [$E680], sp
    jr   nz, label_7D730
    rst  0
    ld   [$E680], sp
    jr   nz, label_7D743
    rst  0
    ld   [$E680], sp
    jr   nz, label_7D74E
    rst  0
    ld   [$E680], sp
    jr   nz, label_7D74F
    rst  0
    ld   [$E680], sp
    jr   nz, label_7D748
    rst  0
    ld   [$E680], sp
    jr   nz, label_7D826
    rst  0
    ld   [$0080], sp
    jr   nz, label_7D843
    rst  0
    ld   [label_2080], sp
    adc  a, d
    add  a, a
    ld   [bc], a
    add  a, b
    jr   nz, label_7D76B
    add  a, a
    ld   [bc], a
    add  a, b
    jr   nz, label_7D775
    add  a, a
    inc  [hl]
    add  a, b
    jr   nz, label_7D768
    add  a, a
    ld   [bc], a
    add  a, b
    jr   nz, label_7D77A
    add  a, a
    ld   [bc], a
    add  a, b
    jr   nz, label_7D784
    add  a, a
    ld   [bc], a
    add  a, b
    jr   nz, label_7D784
    add  a, a
    ld   [bc], a
    add  a, b
    jr   nz, label_7D77C
    add  a, a
    ld   [bc], a
    add  a, b
    jr   nz, label_7D859
    add  a, a
    ld   [bc], a
    add  a, b
    jr   nz, label_7D875
    add  a, a
    ld   c, b
    ld   hl, $D32F
    set  7, [hl]
    call label_7D72C
    ld   hl, label_7D84B
    jp   label_7E2F3
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $16
    jp   z, label_7D75C
    ld   hl, label_7D821

label_7D81B::
    call label_7FA64
    jp   label_7D751

label_7D821::
    ld   a, e
    ld   e, b
    ld   d, c

label_7D824::
    ld   e, b
    add  a, b

label_7D826::
    ld   e, b
    ld   d, a
    ld   e, b
    add  a, l

label_7D82A::
    ld   e, b
    ld   e, l
    ld   e, b
    adc  a, d
    ld   e, b
    ld   h, e
    ld   e, b
    adc  a, a
    ld   e, b
    ld   l, c
    ld   e, b
    sub  a, h
    ld   e, b
    ld   l, a

label_7D838::
    ld   e, b
    sbc  a, c
    ld   e, b
    ld   e, l
    ld   e, b
    adc  a, d

label_7D83E::
    ld   e, b
    ld   d, a
    ld   e, b
    add  a, l
    ld   e, b

label_7D843::
    ld   d, c
    ld   e, b
    add  a, b
    ld   e, b
    ld   [hl], l
    ld   e, b
    sbc  a, [hl]
    ld   e, b

label_7D84B::
    add  a, b
    ld   [rNR41], a
    sbc  a, l

label_7D84F::
    rst  0
    inc  b
    add  a, b
    ld   [rNR41], a
    and  a
    rst  0
    inc  b
    add  a, b
    ld   [rNR41], a
    or   b

label_7D85B::
    rst  0
    inc  b
    add  a, b
    ld   [rNR41], a
    or   [hl]
    rst  0
    inc  b
    add  a, b
    sub  a, b
    jr   nz, label_7D824
    rst  0
    inc  b
    add  a, b
    ld   [rNR41], a
    call nz, label_4C7
    add  a, b
    ld   [rNR41], a
    cp   l
    rst  0
    inc  b

label_7D875::
    add  a, b
    add  a, b
    jr   nz, label_7D816
    rst  0
    inc  b
    add  a, b
    jr   nz, label_7D81B
    add  a, a
    rlca
    add  a, b
    jr   nz, label_7D82A
    add  a, a
    rlca
    add  a, b
    jr   nz, label_7D838
    add  a, a
    rlca
    add  a, b
    jr   nz, label_7D843
    add  a, a
    rlca
    add  a, b
    jr   nz, label_7D84F
    add  a, a
    inc  hl
    add  a, b
    jr   nz, label_7D85B
    add  a, a
    rlca
    add  a, b
    jr   nz, label_7D859
    add  a, a
    rlca
    add  a, b
    jr   nz, label_7D83E
    add  a, a
    dec  [hl]
    call label_7FB5C
    call label_7D72C
    ld   hl, label_7D84B
    jp   label_7E2F3
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $12
    jp   z, label_7D75C
    ld   hl, label_7D8C4
    call label_7FA64

label_7D8C1::
    jp   label_7D751

label_7D8C4::
    inc  e
    ld   e, c
    db   $EC ; Undefined instruction
    ld   e, b
    ld   hl, $F259

label_7D8CB::
    ld   e, b
    ld   h, $59
    ld    hl, sp+$58
    dec  hl
    ld   e, c
    cp   $58
    jr   nc, label_7D92F
    inc  b

label_7D8D7::
    ld   e, c
    dec  [hl]
    ld   e, c
    ld   a, [bc]
    ld   e, c
    db   $3A ; ldd  a, [hl]
    ld   e, c
    db   $10 ; Undefined instruction
    ccf
    ld   e, c
    ld   d, $59
    ld   b, h
    ld   e, c
    add  a, b
    ret  nz
    jr   nz, label_7D887
    rst  0
    inc  b
    add  a, b
    ld   a, [$FF20]
    sbc  a, l
    rst  0
    inc  b
    add  a, b
    ld   a, [$FF20]
    ld   a, e
    rst  0
    inc  b
    add  a, b
    ld   a, [$FF20]
    adc  a, [hl]
    rst  0
    inc  b
    add  a, b

label_7D8FF::
    ret  nz
    jr   nz, label_7D8A8
    rst  0
    inc  b
    add  a, b
    ret  nz
    jr   nz, label_7D8A5
    rst  0
    inc  b
    add  a, b
    ret  nz
    jr   nz, label_7D8CB
    rst  0
    inc  b
    add  a, b
    ld   a, [$FF20]
    cp   l
    rst  0
    inc  b
    add  a, b
    add  a, b
    jr   nz, label_7D8D7
    rst  0
    inc  b
    add  a, b
    jr   nz, label_7D8BC
    add  a, a
    inc  d
    add  a, b
    jr   nz, label_7D8C1
    add  a, a
    ld   [label_2080], sp
    ld   a, e
    add  a, a
    ld   [label_2080], sp
    adc  a, [hl]
    add  a, a

label_7D92F::
    ld   [label_2080], sp
    and  [hl]
    add  a, a
    inc  d
    add  a, b
    jr   nz, label_7D8D5
    add  a, a
    inc  d
    add  a, b
    jr   nz, label_7D8FA
    add  a, a
    inc  d
    add  a, b
    jr   nz, label_7D8FF
    add  a, a
    ld   [label_2080], sp
    cp   l
    add  a, a
    inc  l
    ld   a, $08
    ld   [$D3BE], a
    call label_7E36F
    ld   hl, label_7D98D
    call label_7FABD
    jp   label_7E2F3
    call label_7FA75
    cp   $09
    jr   z, label_7D967

label_7D961::
    ld   hl, label_7D97D
    jp   label_7FAEB

label_7D967::
    call label_7FAA6
    jp   z, label_7E327
    cp   $02
    jr   z, label_7D976
    ld   a, $01
    ld   [bc], a
    jr   label_7D961

label_7D976::
    xor  a
    ld   [bc], a
    ld   a, $60
    ld   [rNR32], a
    ret

label_7D97D::
    rst  $38
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    db   $E8 ; add  sp, d
    nop
    inc  d
    nop
    ld   [bc], a
    nop
    inc  b
    nop
    ld   b, $80
    nop
    ld   b, b
    ret  nz
    add  a, a
    ld   bc, $0080
    ld   h, b
    ret  nz
    add  a, a
    ld   bc, label_103E
    ld   [$D3BE], a
    call label_7E360
    ld   hl, label_7D9D5
    call label_7FABD
    jp   label_7E2F8
    call label_7FA75
    cp   $03
    jr   z, label_7D9B7

label_7D9B1::
    ld   hl, label_7D9D1
    jp   label_7FAEB

label_7D9B7::
    call label_7FAA6
    jp   z, label_7E327
    cp   $08
    jr   z, label_7D9C6
    ld   a, $01
    ld   [bc], a
    jr   label_7D9B1

label_7D9C6::
    xor  a
    ld   [bc], a
    ld   hl, label_7D9DB
    call label_7FABD
    jp   label_7FA85

label_7D9D1::
    rst  $38
    and  b
    nop
    ret  nz

label_7D9D5::
    add  a, b
    nop
    jr   nz, label_7DA49
    add  a, b
    ld   [bc], a

label_7D9DB::
    add  a, b
    nop
    ld   h, b
    ld   [hl], b
    add  a, b
    ld   [bc], a
    call label_7E360
    ld   hl, label_7DA07
    jp   label_7E2F8
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jp   z, label_7E32D
    ld   hl, label_7D9FF
    call label_7FA64
    jp   label_7FA85

label_7D9FF::
    dec  c
    ld   e, d
    inc  de
    ld   e, d
    dec  c
    ld   e, d
    rlca
    ld   e, d

label_7DA07::
    add  a, b
    ei
    jr   nz, label_7DA0B

label_7DA0B::
    jp   nz, label_8003
    db   $FD ; Undefined instruction
    ld   b, b
    add  a, b
    jp   label_8004
    db   $FD ; Undefined instruction
    ld   h, b
    nop
    call nz, label_FA05
    ld   [hl], c
    db   $D3 ; Undefined instruction
    cp   $0F
    jp   z, label_7E385
    call label_7E36F
    ld   hl, label_7DA38
    jp   label_7E2F8
    call label_7FA75
    cp   $02
    jp   z, label_7E32D
    ld   hl, label_7DA3E
    jp   label_7FA85

label_7DA38::
    add  a, b
    ei
    ld   h, b
    jp   nc, label_1C7

label_7DA3E::
    add  a, b
    ei
    ld   b, b
    jp   nc, label_2C7
    ld   a, $02
    ld   [$D3BE], a

label_7DA49::
    call label_7E365
    ld   hl, label_7DB5B
    call label_7FABD
    jp   label_7E2F3
    call label_7FA71
    ret  nz
    ld   a, $01
    ld   [de], a
    call label_7FA75
    cp   $71
    jr   z, label_7DA69
    ld   hl, label_7DA7B
    jp   label_7FAEB

label_7DA69::
    call label_7FAA6
    jp   z, label_7E327
    ld   a, $60
    ld   [bc], a
    ld   hl, label_7DB61
    call label_7FABD
    jp   label_7FA85

label_7DA7B::
    nop
    or   b
    nop
    or   b
    nop
    or   b
    nop
    or   b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    jr   nz, label_7DA8D
    ld   [rJOYP], a
    ld   b, b
    rst  $38
    ret  nz
    nop
    ld   h, b
    rst  $38
    and  b
    nop
    add  a, b
    rst  $38
    add  a, b
    nop
    and  b
    rst  $38
    ld   h, b
    nop
    ret  nz
    rst  $38
    ld   b, b
    nop
    add  a, b
    rst  $38
    adc  a, b
    nop
    add  a, b
    rst  $38
    adc  a, b
    nop
    sub  a, b
    rst  $38
    ld   a, b
    nop
    and  b
    rst  $38
    ld   l, b
    nop
    or   b
    rst  $38
    ld   d, [hl]
    nop
    ret  nz
    rst  $38
    ld   b, [hl]
    nop
    ret  nz
    rst  $38
    ld   b, h
    nop
    ret  nz
    rst  $38
    ld   b, h
    nop
    ret  nz
    rst  $38
    ld   b, e
    nop
    ret  nz
    rst  $38
    ld   b, e
    nop
    ret  nz
    rst  $38
    ld   b, d
    nop
    and  b
    rst  $38
    ld   h, d
    nop
    add  a, b
    rst  $38
    add  a, d
    nop
    add  a, b
    rst  $38
    add  a, d
    nop
    add  a, b
    rst  $38
    add  a, h
    nop
    add  a, b
    rst  $38
    add  a, h
    nop
    add  a, b
    rst  $38
    add  a, h
    nop
    add  a, b
    rst  $38
    add  a, h
    nop
    add  a, b
    rst  $38
    or   b
    nop
    add  a, b
    rst  $38
    or   b
    nop
    add  a, b
    rst  $38
    add  a, b
    nop
    add  a, b
    rst  $38
    add  a, b
    nop
    add  a, b
    rst  $38
    add  a, b

label_7DAFF::
    nop
    add  a, b
    rst  $38
    add  a, b
    nop
    add  a, b
    rst  $38
    ld   l, b
    nop
    add  a, b
    rst  $38
    ld   l, b
    nop
    add  a, b
    rst  $38
    ld   l, b
    nop
    add  a, b
    rst  $38
    ld   l, b
    nop
    add  a, b
    rst  $38
    ld   a, b
    nop
    add  a, b
    rst  $38
    ld   a, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    ld   b, b
    nop
    and  b
    rst  $38
    nop
    nop
    and  b
    rst  $38
    nop
    nop
    add  a, b
    cp   $80
    nop
    add  a, b
    cp   $80
    nop
    add  a, b
    cp   $80
    nop
    add  a, b
    cp   $80

label_7DB5B::
    add  a, b
    nop
    jr   nz, label_7DAFF
    add  a, c
    ld   [bc], a

label_7DB61::
    add  a, b
    nop
    ld   h, b
    ldi  [hl], a
    add  a, [hl]
    ld   [bc], a
    ld   a, $0C
    ld   [$D3BE], a
    call label_7E36A
    ld   hl, label_7DBB2
    call label_7FABD
    jp   label_7E2F8
    call label_7FA75
    cp   $03
    jr   z, label_7DB85
    ld   hl, label_7DBAE
    jp   label_7FAEB

label_7DB85::
    call label_7FAA6
    jp   z, label_7E327
    cp   $06
    jp   z, label_7DB9E
    cp   $03
    jp   z, label_7DBA9
    ld   a, $01
    ld   [bc], a
    ld   hl, label_7DBAE
    jp   label_7FAEB

label_7DB9E::
    ld   hl, label_7DBB8

label_7DBA1::
    call label_7FABD
    xor  a
    ld   [bc], a
    jp   label_7FA85

label_7DBA9::
    ld   hl, label_7DBBE
    jr   label_7DBA1

label_7DBAE::
    nop
    ld   [rIE], a
    and  b

label_7DBB2::
    add  a, b
    nop
    jr   nz, label_7DBB6

label_7DBB6::
    add  a, h
    ld   bc, $0080
    ld   b, b
    add  a, b
    add  a, l
    ld   bc, $0080
    ld   h, b
    add  a, b
    add  a, l
    ld   bc, label_123E
    ld   [$D3BE], a
    call label_7E36A
    ld   hl, label_7DC00
    call label_7FABD
    jp   label_7E2F8
    call label_7FA75
    cp   $03
    jr   z, label_7DBE2

label_7DBDC::
    ld   hl, label_7DBFC
    jp   label_7FAEB

label_7DBE2::
    call label_7FAA6
    jp   z, label_7E327
    cp   $06
    jr   z, label_7DBF1
    ld   a, $01
    ld   [bc], a
    jr   label_7DBDC

label_7DBF1::
    xor  a
    ld   [bc], a
    ld   hl, label_7DC06
    call label_7FABD
    jp   label_7FA85

label_7DBFC::
    ld   bc, $FE00
    ret  nz

label_7DC00::
    add  a, b
    nop
    jr   nz, label_7DC44
    add  a, [hl]
    ld   [bc], a

label_7DC06::
    add  a, b
    nop
    ld   h, b
    ret  nz
    add  a, h
    ld   [bc], a
    ld   a, $04
    ld   [$D3BE], a
    call label_7E374
    ld   hl, label_7DC6E
    call label_7FABD
    jp   label_7E2F8
    call label_7FA71
    ret  nz
    ld   a, $01
    ld   [de], a
    call label_7FA75
    cp   $06
    jr   z, label_7DC4E
    cp   $07
    jr   z, label_7DC35
    ld   hl, label_7DC64
    jp   label_7FAEB

label_7DC35::
    call label_7FAA6
    jp   z, label_7E327
    cp   $02
    jr   z, label_7DC5F
    cp   $01
    jr   z, label_7DC5F
    ld   hl, label_7DC74

label_7DC46::
    xor  a
    ld   [bc], a
    call label_7FABD
    jp   label_7FA85

label_7DC4E::
    ld   a, [$D3BE]
    cp   $01
    jr   z, label_7DC35
    cp   $04
    ret  z
    ld   a, $06
    ld   [de], a
    xor  a
    ld   [rNR32], a
    ret

label_7DC5F::
    ld   hl, label_7DC7A
    jr   label_7DC46

label_7DC64::
    ld   [bc], a
    ld   b, b
    ld   bc, rLCDC
    db   $F2 ; Undefined instruction
    nop
    ld   c, $FF
    db   $F2 ; Undefined instruction

label_7DC6E::
    add  a, b
    nop
    jr   nz, label_7DC88
    add  a, h
    ld   bc, $0080
    jr   nz, label_7DC9E
    add  a, h
    ld   bc, $0080
    jr   nz, label_7DC86
    add  a, h
    ld   bc, label_7F1FA
    db   $D3 ; Undefined instruction
    cp   $14
    jp   z, label_7E385

label_7DC88::
    ld   a, $04
    ld   [$D3BE], a
    call label_7E36A
    ld   hl, label_7DCAA
    call label_7FABD
    jp   label_7E2F8
    call label_7FAA6
    jp   z, label_7E327
    ld   a, $01
    ld   [bc], a
    ld   hl, label_7DCA8
    jp   label_7FAEB

label_7DCA8::
    nop
    ld   c, $80
    nop
    ld   b, b
    add  a, b
    add  a, a
    ld   bc, label_7F9CD
    ld   h, e
    ld   hl, label_7DCD8
    jp   label_7E2F3
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $06
    jp   z, label_7E32D
    ld   hl, label_7DCCE
    call label_7FA64
    jp   label_7FA85

label_7DCCE::
    sbc  a, $5C
    db   $E4 ; Undefined instruction
    ld   e, h
    ld   [$F05C], a
    ld   e, h
    or   $5C

label_7DCD8::
    add  a, b
    ret  nc
    jr   nz, label_7DD1C
    rst  0
    inc  d
    add  a, b
    ret  nz
    jr   nz, label_7DD46
    rst  0
    inc  c
    add  a, b
    sub  a, b
    ld   b, b
    ld   a, b
    rst  0
    ld   b, b
    add  a, b
    ret  nz
    jr   nz, label_7DD42
    rst  0
    ld   b, $80
    ret  nz
    ld   b, b
    ld   b, [hl]
    rst  0
    inc  c
    add  a, b

label_7DCF7::
    and  b
    jr   nz, label_7DD58
    rst  0
    jr   nz, label_7DCF7
    ld   [hl], c
    db   $D3 ; Undefined instruction
    cp   $03
    jp   z, label_7E385
    cp   $07
    jp   z, label_7E385
    ld   a, $02
    ld   [$D3BE], a
    call label_7E365
    ld   hl, label_7DD68
    call label_7FABD
    jp   label_7E2F8
    call label_7FA71
    ret  nz
    ld   a, $01
    ld   [de], a
    ld   a, [bc]
    cp   $07
    jr   nc, label_7DD33

label_7DD26::
    call label_7FA75
    cp   $10
    jr   z, label_7DD38
    ld   hl, label_7DD4A
    jp   label_7FAEB

label_7DD33::
    ld   a, $03
    ld   [de], a
    jr   label_7DD26

label_7DD38::
    call label_7FAA6
    jp   z, label_7E327
    ld   a, $03
    ld   [bc], a
    ld   hl, label_7DD6E
    call label_7FABD
    jp   label_7FA85

label_7DD4A::
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   bc, $0000
    ret  nz
    rst  $38
    ld   b, b
    nop
    ret  nz
    rst  $38
    ld   b, b

label_7DD58::
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz

label_7DD68::
    add  a, b
    nop
    jr   nz, label_7DDCC
    add  a, b
    ld   [bc], a

label_7DD6E::
    add  a, b
    nop
    ld   h, b
    ld   h, b
    add  a, l
    ld   [bc], a

label_7DD74::
    ld   [bc], a
    ld   b, [hl]
    adc  a, d
    adc  a, $FC
    sub  a, [hl]
    inc  b
    inc  b
    ld   [bc], a
    ld   b, [hl]
    adc  a, d
    adc  a, $FC
    sub  a, [hl]
    inc  b
    inc  b
    ld   hl, $D34F
    set  7, [hl]
    ld   a, $03
    ld   [$D3BE], a
    ld   hl, label_7DEB1
    call label_7FA8B
    call label_7E36A
    ld   hl, label_7DD74
    call label_7E35A
    ld   hl, label_7DEC5
    call label_7FABD
    jp   label_7E2F3
    call label_7FA75
    cp   $55
    jr   z, label_7DDCE
    cp   $03
    jr   z, label_7DDBB
    cp   $07
    jr   z, label_7DDC4

label_7DDB5::
    ld   hl, label_7DE09
    jp   label_7FAEB

label_7DDBB::
    ld   a, $40

label_7DDBD::
    ld   [rNR32], a
    ld   bc, $D396
    jr   label_7DDB5

label_7DDC4::
    ld   hl, label_7DEB6
    call label_7FA8B
    ld   a, $20

label_7DDCC::
    jr   label_7DDBD

label_7DDCE::
    call label_7FAA6
    jr   z, label_7DDFB
    cp   $01
    jr   z, label_7DDE9
    ld   a, $40
    ld   [bc], a
    ld   hl, label_7DEBB
    call label_7FA8B
    ld   hl, label_7DECB
    call label_7FABD
    jp   label_7FA85

label_7DDE9::
    ld   a, $40
    ld   [bc], a
    ld   hl, label_7DEC0
    call label_7FA8B
    ld   hl, label_7DED1
    call label_7FABD
    jp   label_7FA85

label_7DDFB::
    ld   hl, $D34F
    res  7, [hl]
    ld   hl, label_7FA20
    call label_7FA8B
    jp   label_7E327

label_7DE09::
    nop
    ld   b, b
    rst  $38
    ld   [rJOYP], a
    ld   b, b
    rst  $38
    ld   [rJOYP], a
    jr   nc, label_7DE13
    db   $E8 ; add  sp, d
    nop
    jr   nc, label_7DE17
    db   $E8 ; add  sp, d
    nop
    jr   nz, label_7DE1B
    ld   a, [$FF00]
    jr   nz, label_7DE1F
    ld   a, [$FF00]
    db   $10 ; Undefined instruction
    ld    hl, sp+$00
    db   $10 ; Undefined instruction
    ld    hl, sp+$00
    ld   [$F9FF], sp
    nop
    ld   [$F9FF], sp
    nop
    ld   [$F9FF], sp
    nop
    ld   [$F9FF], sp
    nop
    ld   [$F9FF], sp
    nop
    ld   [$F9FF], sp
    nop
    ld   [$F8FF], sp
    nop
    ld   [$F8FF], sp
    nop
    ld   [$F8FF], sp
    nop
    ld   [$F8FF], sp
    nop
    ld   [$F7FF], sp
    nop
    ld   [$F7FF], sp
    nop
    ld   [$F7FF], sp

label_7DE5D::
    nop
    ld   [$F7FF], sp
    nop
    ld   [$F7FF], sp
    nop
    ld   [$F7FF], sp
    nop
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    xor  $00
    db   $10 ; Undefined instruction
    db   $EC ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    db   $EC ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    db   $EC ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    db   $EC ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    db   $EC ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    db   $EC ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    db   $EC ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    db   $EC ; Undefined instruction

label_7DEB1::
    nop
    add  hl, de
    nop
    add  a, b
    ld   bc, $A000
    nop
    add  a, b
    ld   bc, label_7D000
    nop
    add  a, b
    ld   bc, label_2000
    nop
    add  a, b
    ld   bc, $0080
    ld   h, b
    and  b
    add  a, [hl]
    ld   [bc], a

label_7DECB::
    add  a, b
    nop
    ld   b, b
    jr   nz, label_7DE57
    ld   [bc], a

label_7DED1::
    add  a, b
    nop
    ld   h, b
    jr   nz, label_7DE5D
    ld   [bc], a
    ld   a, $0E
    ld   [$D3BE], a
    call label_7E365
    ld   hl, label_7DF13
    call label_7FABD
    jp   label_7E2F3
    call label_7FA75
    cp   $03
    jr   z, label_7DEF5

label_7DEEF::
    ld   hl, label_7DF0F
    jp   label_7FAEB

label_7DEF5::
    call label_7FAA6
    jp   z, label_7E327
    cp   $07
    jr   z, label_7DF04
    ld   a, $01
    ld   [bc], a
    jr   label_7DEEF

label_7DF04::
    xor  a
    ld   [bc], a
    ld   hl, label_7DF13
    call label_7FABD
    jp   label_7FA85

label_7DF0F::
    nop
    ld   h, b
    rst  $38
    nop

label_7DF13::
    add  a, b
    nop
    jr   nz, label_7DF57
    add  a, [hl]
    nop
    call label_7E379
    ld   hl, label_7DF72
    call label_7FABD
    jp   label_7E2F8
    call label_7FA75
    cp   $13
    jp   z, label_7E327
    cp   $02
    jr   z, label_7DF3F
    cp   $0E
    jr   z, label_7DF46
    cp   $10
    jr   z, label_7DF4A

label_7DF39::
    ld   hl, label_7DF4E
    jp   label_7FAEB

label_7DF3F::
    ld   a, $20

label_7DF41::
    ld   [rNR32], a
    ld   a, [bc]
    jr   label_7DF39

label_7DF46::
    ld   a, $40
    jr   label_7DF41

label_7DF4A::
    ld   a, $60
    jr   label_7DF41

label_7DF4E::
    rst  $38
    ld   a, [$FF00]
    ld   [de], a
    rst  $38
    ld   a, [$FF00]
    ld   [de], a
    rst  $38

label_7DF57::
    ld   a, [$FF00]
    ld   [de], a
    rst  $38
    ld   [rJOYP], a
    ld   e, $FF
    ld   [rJOYP], a
    inc  e
    rst  $38
    ld   [rJOYP], a
    ld   a, [de]
    rst  $38
    ld   [rJOYP], a
    jr   label_7DF6A
    ld   [rJOYP], a
    ld   [de], a
    rst  $38
    ld   [rJOYP], a
    inc  d

label_7DF72::
    add  a, b

label_7DF73::
    nop
    ld   b, b
    jr   nc, label_7DEFE
    ld   bc, label_7F1FA
    db   $D3 ; Undefined instruction
    cp   $03
    jp   z, label_7E385
    cp   $06
    jp   z, label_7E385
    cp   $07
    jp   z, label_7E385
    call label_7E360
    ld   hl, label_7DFAE
    jp   label_7E2F8
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $04
    jp   z, label_7E32D
    ld   hl, label_7DFA8
    call label_7FA64
    jp   label_7FA85

label_7DFA8::
    or   h
    ld   e, a
    cp   d
    ld   e, a
    or   h
    ld   e, a

label_7DFAE::
    add  a, b
    db   $FD ; Undefined instruction
    ld   b, b
    jr   nz, label_7DF73
    ld   [bc], a
    add  a, b
    db   $FD ; Undefined instruction
    ld   b, b
    add  a, b
    pop  bc
    ld   [bc], a
    add  a, b
    db   $FD ; Undefined instruction
    ld   b, b
    nop
    jp   nz, label_CD02
    ld   a, c
    ld   h, e
    ld   hl, label_7DFEC
    jp   label_7E2F3
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $08
    jp   z, label_7E32D
    ld   hl, label_7DFDE
    call label_7FA64
    jp   label_7FA85

label_7DFDE::
    inc  b
    ld   h, b
    db   $F2 ; Undefined instruction
    ld   e, a
    ld   a, [bc]
    ld   h, b
    ld    hl, sp+$5F
    db   $10 ; Undefined instruction
    cp   $5F
    ld   d, $60

label_7DFEC::
    add  a, b
    ld   [label_7E220], a
    rst  0
    ld   b, $80
    ld   [label_7F420], a
    rst  0
    ld   b, $80
    ld   [label_7FB20], a
    rst  0
    ld   b, $80
    ld   [$A720], a
    rst  0
    ld   b, $80
    ld   [label_7E260], a
    rst  0
    ld   b, $80
    ld   [label_7F460], a
    rst  0
    ld   b, $80
    ld   [label_7FB60], a
    rst  0
    ld   b, $80
    ld   [$A760], a
    rst  0
    ld   b, $3E
    inc  b
    ld   [$D3BE], a

label_7E021::
    call label_7E379
    ld   hl, label_7E060
    call label_7FABD
    jp   label_7E2F8
    call label_7FA75
    cp   $07
    jr   z, label_7E03A
    ld   hl, label_7E054
    jp   label_7FAEB

label_7E03A::
    call label_7FAA6
    jp   z, label_7E327
    cp   $02
    jr   z, label_7E04F
    ld   hl, label_7E066

label_7E047::
    xor  a
    ld   [bc], a
    call label_7FABD
    jp   label_7FA85

label_7E04F::
    ld   hl, label_7E060
    jr   label_7E047

label_7E054::
    nop
    ld   b, $00
    inc  b
    nop
    ld   [bc], a
    rst  $38
    ld    hl, sp+$FF
    ld   a, [$FFFF]
    db   $E8 ; add  sp, d

label_7E060::
    add  a, b
    nop
    jr   nz, label_7E0C4
    add  a, a
    ld   bc, $0080
    ld   h, b
    ld   h, b
    add  a, a
    ld   bc, $C9C9
    ld   a, $07
    ld   [$D3DC], a
    ld   a, $40
    ld   [$D3BE], a
    call label_7E360
    ld   hl, label_7E0BE
    call label_7FABD
    jp   label_7E2F8
    call label_7FAA6
    jp   z, label_7E0A6

label_7E08A::
    ld   a, [$D3DC]
    cp   $07
    jr   z, label_7E09E
    cp   $06
    jr   z, label_7E0A2
    ld   a, $03

label_7E097::
    ld   [bc], a
    ld   hl, label_7E0B8
    jp   label_7FAEB

label_7E09E::
    ld   a, $01
    jr   label_7E097

label_7E0A2::
    ld   a, $02
    jr   label_7E097

label_7E0A6::
    push de
    ld   de, $D3DC
    call label_7FA71
    pop  de
    jp   z, label_7E327
    ld   a, $40
    ld   [$D3BE], a
    jr   label_7E08A

label_7E0B8::
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    ei

label_7E0BE::
    add  a, b
    nop
    jr   nz, label_7E0C1
    add  a, a
    ld   bc, $C606
    ld   b, $C6
    ld   b, $C6
    ld   b, $C6
    adc  a, c

label_7E0CD::
    cp   l
    db   $ED ; Undefined instruction
    cp   c
    add  a, a
    ld   d, e
    inc  hl
    ld   d, a
    call label_7FB5C
    ld   hl, label_7E0C4
    call label_7E35A
    ld   a, $05
    ld   [$D3BE], a
    xor  a
    ld   [$D3DD], a
    ld   hl, label_7E147
    call label_7FABD
    jp   label_7E2F3
    call label_7FAA6
    cp   $01
    jr   z, label_7E115
    ld   a, [$D3DD]
    cp   $11
    jr   z, label_7E10D
    cp   $0A
    jr   nc, label_7E111
    ld   a, $01

label_7E103::
    ld   bc, $D396
    ld   [bc], a
    ld   hl, label_7E13D
    jp   label_7FAEB

label_7E10D::
    ld   a, $05
    jr   label_7E103

label_7E111::
    ld   a, $03
    jr   label_7E103

label_7E115::
    push bc
    ld   bc, $D3DD
    call label_7FA75
    pop  bc
    cp   $12
    jr   z, label_7E135
    add  a, $05
    ld   [$D3BE], a
    ld   a, [$D3DD]
    cp   $0B
    jr   nc, label_7E131
    ld   a, $02
    jr   label_7E103

label_7E131::
    ld   a, $04
    jr   label_7E103

label_7E135::
    ld   a, $59
    ld   [$D368], a
    jp   label_7E327

label_7E13D::
    rst  $38
    db   $F4 ; Undefined instruction
    nop
    ldd  [hl], a
    rst  $38
    ld   a, [$FF00]
    ld   [hl], b
    rst  $38
    db   $E8 ; add  sp, d

label_7E147::
    add  a, b
    nop
    ld   b, b
    and  b
    add  a, a
    ld   bc, label_7E0CD
    ld   h, e
    ld   a, $03
    ld   [$D3DE], a
    ld   a, $90
    ld   [$D3BE], a
    ld   hl, label_7E19C
    call label_7FABD
    jp   label_7E2F8
    call label_7FAA6
    jr   z, label_7E184

label_7E168::
    ld   a, [$D3DE]
    cp   $03
    jr   z, label_7E17C
    cp   $02
    jr   z, label_7E180
    ld   a, $01

label_7E175::
    ld   [bc], a
    ld   hl, label_7E196
    jp   label_7FAEB

label_7E17C::
    ld   a, $03
    jr   label_7E175

label_7E180::
    ld   a, $02
    jr   label_7E175

label_7E184::
    push de
    ld   de, $D3DE
    call label_7FA71
    pop  de
    jp   z, label_7E327
    ld   a, $90
    ld   [$D3BE], a
    jr   label_7E168

label_7E196::
    nop
    ld   bc, label_200
    nop
    inc  bc

label_7E19C::
    add  a, b
    nop
    ld   h, b
    add  a, b
    add  a, h
    ld   [bc], a
    ld   a, $07
    ld   [$D3BE], a
    ld   a, [$D370]
    ld   [$D371], a
    ld   a, $01
    ld   [$D3C8], a
    ld   hl, $D32F
    set  7, [hl]
    xor  a
    ld   [$D392], a
    ld   [$D396], a
    ld   [rNR30], a
    ld   hl, label_7E354
    call label_7FA85
    ld   hl, label_7E217
    call label_7FAD0
    jp   label_7FA7F
    call label_7FA75
    cp   $09
    jr   z, label_7E1E0
    cp   $0A
    jr   z, label_7E1E8

label_7E1DA::
    ld   hl, label_7E205
    jp   label_7FB11

label_7E1E0::
    call label_7FAA6
    jr   z, label_7E1ED
    ld   a, [bc]
    jr   label_7E1DA

label_7E1E8::
    ld   a, $01
    ld   [bc], a
    jr   label_7E1DA

label_7E1ED::
    xor  a
    ld   [$D392], a
    ld   [$D396], a
    ld   [$D371], a
    ld   [$D3C8], a

label_7E1FA::
    ld   hl, $D32F
    res  7, [hl]

label_7E1FF::
    ld   hl, $D32F
    res  7, [hl]
    ret

label_7E205::
    rst  $38
    rst  $38
    rst  $38
    cp   $FF
    db   $FD ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$F6FF]
    rst  $38
    db   $F2 ; Undefined instruction
    rst  $38
    xor  $00
    db   $3A ; ldd  a, [hl]

label_7E217::
    nop
    sub  a, a
    add  a, b
    add  a, a
    ld   bc, label_2E3E
    ld   [$D3BE], a
    xor  a
    ld   [$D3E1], a
    call label_7E360
    ld   hl, label_7E276
    call label_7FABD
    jp   label_7E2F3
    call label_7FAA6
    jr   z, label_7E24E

label_7E236::
    ld   a, [$D3E1]
    cp   $01
    jr   z, label_7E262
    cp   $02
    jr   z, label_7E266
    cp   $03
    jr   z, label_7E26A
    ld   a, $01

label_7E247::
    ld   [bc], a
    ld   hl, label_7E26E
    jp   label_7FAEB

label_7E24E::
    push bc
    ld   bc, $D3E1
    call label_7FA75
    pop  bc
    cp   $04
    jp   z, label_7E327
    ld   a, $2E
    ld   [$D3BE], a

label_7E260::
    jr   label_7E236

label_7E262::
    ld   a, $02
    jr   label_7E247

label_7E266::
    ld   a, $03
    jr   label_7E247

label_7E26A::
    ld   a, $04
    jr   label_7E247

label_7E26E::
    nop
    ld   [label_600], sp
    nop
    inc  b
    nop
    ld   [bc], a

label_7E276::
    add  a, b
    nop
    ld   b, b
    jr   nc, label_7E1FF
    ld   bc, label_7E5CD
    ld   h, e
    ld   hl, label_7E2C9
    jp   label_7E2F3
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $0D
    jp   z, label_7E327
    ld   hl, label_7E2B1
    call label_7FA64
    ld   a, [$D396]
    cp   $01
    jp   z, label_7FA85
    cp   $02
    jp   z, label_7FA85
    cp   $07
    jp   z, label_7FA85
    cp   $0A
    jp   z, label_7FA85
    jp   label_7E37E

label_7E2B1::
    rst  8
    ld   h, d
    push de
    ld   h, d
    rst  $20
    ld   h, d
    ld   [$ED62], a
    ld   h, d
    ld   a, [$FF62]
    db   $DB
    ld   h, d
    db   $ED ; Undefined instruction
    ld   h, d
    ld   a, [$FF62]
    pop  hl
    ld   h, d
    db   $ED ; Undefined instruction
    ld   h, d
    ld   a, [$FF62]

label_7E2C9::
    add  a, b
    db   $F2 ; Undefined instruction
    ld   h, b
    rst  $18
    add  a, a
    ld   [bc], a
    add  a, b
    db   $F2 ; Undefined instruction
    ld   b, b
    rst  $18
    add  a, a
    ld   [bc], a
    add  a, b
    db   $F2 ; Undefined instruction
    jr   nz, label_7E2B8
    add  a, a
    inc  bc
    add  a, b
    db   $F2 ; Undefined instruction
    ld   b, b
    and  d
    add  a, a
    inc  bc
    add  a, b
    db   $F2 ; Undefined instruction
    ld   h, b
    and  d
    add  a, a
    inc  bc
    cp   [hl]
    add  a, a
    inc  bc
    and  d
    add  a, a
    inc  bc
    add  a, e
    add  a, a
    inc  bc
    and  a
    rst  0
    inc  bc

label_7E2F3::
    ld   a, $01
    ld   [$D3C8], a

label_7E2F8::
    ld   a, [$D370]
    ld   [$D371], a
    push hl
    ld   hl, $D33F
    set  7, [hl]
    pop  hl
    xor  a
    ld   [$D392], a
    ld   [$D396], a
    ld   [rNR30], a
    jp   label_7FA85
    add  a, b
    nop
    nop
    nop
    ld   bc, $0001
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_7E327::
    ld   hl, label_7E354
    call label_7FA85

label_7E32D::
    xor  a
    ld   [$D392], a
    ld   [$D396], a
    ld   [$D371], a
    ld   [rNR30], a
    ld   [$D3C8], a
    ld   hl, $D33F
    res  7, [hl]
    ld   a, $01
    ld   [$D3E7], a
    ret

label_7E347::
    push bc
    ld   c, $30

label_7E34A::
    ld   a, [hli]
    ldh  [$FF0C], a
    inc  c
    ld   a, c
    cp   $40
    jr   nz, label_7E34A
    pop  bc
    ret

label_7E354::
    add  a, b
    nop
    nop
    nop
    add  a, c
    ld   bc, $E0AF
    ld   a, [de]
    jp   label_7E347

label_7E360::
    ld   hl, label_7E3AC
    jr   label_7E35A

label_7E365::
    ld   hl, label_7E3BC
    jr   label_7E35A

label_7E36A::
    ld   hl, label_7E39C
    jr   label_7E35A

label_7E36F::
    ld   hl, label_7E3CC
    jr   label_7E35A

label_7E374::
    ld   hl, label_7E3DC
    jr   label_7E35A

label_7E379::
    ld   hl, label_7E38C
    jr   label_7E35A

label_7E37E::
    ld   c, $1D
    ld   b, $02
    jp   label_7FA91

label_7E385::
    xor  a
    ld   [$D370], a
    jp   label_7D3ED

label_7E38C::
    adc  a, h
    rst  $28
    cp   $C8
    add  a, h
    ld   hl, label_7C812
    adc  a, h
    rst  $28
    cp   $C8
    add  a, h
    ld   hl, label_7C812

label_7E39C::
    nop
    ldi  [hl], a
    ld   b, h
    ld   h, [hl]
    adc  a, b
    xor  d
    call z, label_CC
    ldi  [hl], a
    ld   b, h
    ld   h, [hl]
    adc  a, b
    xor  d
    call z, label_FCC
    rrca
    rra
    rra
    cpl
    cpl
    ccf
    ccf
    ld   b, b
    ld   b, b
    ld   d, b
    ld   d, b
    ld   h, b
    ld   h, b
    ld   [hl], b
    ld   [hl], b

label_7E3BC::
    inc  c
    inc  c
    nop
    ldi  [hl], a
    ld   b, h
    adc  a, b
    xor  d
    call z, label_EE
    ld   l, h
    ld   h, b
    nop
    ld   l, h
    ld   h, b
    nop

label_7E3CC::
    rst  $38
    rst  $38
    xor  $DD
    xor  $DD
    xor  $FF
    rst  $38
    ret
    ld   h, e
    ld   hl, $0000
    inc  b
    adc  a, h

label_7E3DC::
    ld   bc, label_7C523
    ld   h, a
    adc  a, c
    xor  h
    xor  $EE
    cp   $DC
    cp   d
    sbc  a, b
    halt
    ldd  [hl], a
    db   $10 ; Undefined instruction
    ld   h, l
    dec  a
    ld   h, l
    add  a, a
    ld   h, l
    rst  $28
    ld   h, l
    rra
    ld   h, [hl]
    ld   l, l
    ld   h, [hl]
    and  d
    ld   h, [hl]
    ld   [$FF66], a
    ld   h, $67
    ld   h, b
    ld   h, a

label_7E400::
    sub  a, d
    ld   h, a
    or   h
    ld   h, a
    push af
    ld   h, a
    ld   l, $68
    ld   e, h
    ld   l, b
    sub  a, c
    ld   l, b
    ld   a, [$FF68]
    ld   [bc], a
    ld   l, c
    ccf
    ld   l, c
    ret
    ld   l, c
    rrca
    ld   l, d
    ld   c, [hl]
    ld   l, d
    add  a, b
    ld   l, d
    and  d
    ld   l, d
    db   $EC ; Undefined instruction
    ld   l, d
    ldd  [hl], a
    ld   l, e
    sub  a, a
    ld   l, e
    inc  de
    ld   l, h
    ld   c, h
    ld   l, h
    sub  a, a
    ld   l, h
    call nz, label_B6C
    ld   l, l
    ld   bc, label_357A
    ld   l, l
    ld   [hl], e
    ld   l, l
    sub  a, l
    ld   l, l
    or   a
    ld   l, l
    ld   c, [hl]
    ld   l, [hl]
    add  a, a
    ld   l, [hl]
    db   $6E
    ld   l, [hl]
    ld   sp, label_7F86F
    ld   l, a
    db   $6F
    ld   l, a
    rst  $28
    ld   l, a
    ld   a, b
    ld   [hl], b
    call nz, label_1470
    ld   [hl], c
    ld   [hl], $71
    rst  0
    ld   [hl], c
    ld   a, $72
    sub  a, l
    ld   [hl], d
    db   $E4 ; Undefined instruction
    ld   [hl], d
    adc  a, e
    ld   [hl], h
    sub  a, b
    ld   [hl], l
    jp  c, label_A175
    halt
    halt
    ld   [hl], a
    ld   l, [hl]
    ld   [hl], a
    ret  nz
    ld   [hl], a
    and  $77
    dec  b
    ld   a, c
    ld   e, e
    ld   a, c
    dec  de
    ld   a, e

label_7E46C::
    add  hl, hl
    ld   h, l
    ld   b, e
    ld   h, l
    adc  a, l
    ld   h, l
    push af
    ld   h, l
    inc  a
    ld   h, [hl]
    ld   [hl], e
    ld   h, [hl]
    call nz, label_F366
    ld   h, [hl]
    inc  l
    ld   h, a
    ld   h, [hl]
    ld   h, a
    sbc  a, b
    ld   h, a
    rst  0
    ld   h, a
    nop
    ld   l, b
    inc  [hl]
    ld   l, b
    ld   l, c
    ld   l, b
    sbc  a, h
    ld   l, b
    or   $68
    ld   [label_7C569], sp
    ld   l, c
    rst  8
    ld   l, c
    dec  d
    ld   l, d
    ld   e, h
    ld   l, d
    add  a, [hl]
    ld   l, d
    xor  b
    ld   l, d
    db   $F2 ; Undefined instruction
    ld   l, d
    jr   c, label_7E50B
    xor  a
    ld   l, e
    ld   e, $6C
    ld   d, a
    ld   l, h
    and  h
    ld   l, h
    rst  8
    ld   l, h
    ld   de, label_16D
    ld   a, d
    dec  sp
    ld   l, l
    ld   a, c
    ld   l, l
    sbc  a, e
    ld   l, l
    cp   l
    ld   l, l
    ld   e, c
    ld   l, [hl]
    adc  a, l
    ld   l, [hl]
    db   $E8 ; add  sp, d
    ld   l, [hl]
    inc  a
    ld   l, a
    add  a, e
    ld   l, a
    db   $E3 ; Undefined instruction
    ld   l, a
    push af
    ld   l, a
    ld   a, [hl]
    ld   [hl], b
    rst  8
    ld   [hl], b
    ld   a, [de]
    ld   [hl], c
    inc  a
    ld   [hl], c
    call label_7C471
    ld   [hl], d
    sbc  a, e
    ld   [hl], d
    db   $F4 ; Undefined instruction
    ld   [hl], d
    sub  a, [hl]
    ld   [hl], h
    sbc  a, e
    ld   [hl], l
    db   $EB ; Undefined instruction
    ld   [hl], l
    and  a
    halt
    halt
    ld   [hl], a
    sub  a, b
    ld   [hl], a
    rlca
    ld   a, d
    db   $EC ; Undefined instruction
    ld   [hl], a
    dec  bc
    ld   a, c
    ld   h, c
    ld   a, c
    ld   hl, label_217B
    ld   a, b
    db   $D3 ; Undefined instruction
    ld   a, [hl]
    and  a
    jr   z, label_7E500
    ld   a, [$D3C9]
    and  a
    jp   nz, label_7FA2C
    ld   a, [hl]
    ld   hl, label_7E3EC
    jr   label_7E508

label_7E500::
    inc  hl
    ld   a, [hl]
    and  a
    jr   z, label_7E512
    ld   hl, label_7E46C

label_7E508::
    call label_7FA64

label_7E50B::
    ld   de, $D393
    ld   bc, $D398
    jp   [hl]

label_7E512::
    ld   a, [$C50E]
    and  a
    ret  z
    ld   a, $1E
    ld   [$D378], a
    jr   label_7E4EC
    ld   a, $01
    ld   [$D379], a
    ld   hl, label_7E533
    jp   label_7FA8B
    xor  a
    ld   [$D379], a
    ld   hl, label_7E538
    jp   label_7FA8B

label_7E533::
    dec  sp
    add  a, b
    rlca
    ret  nz
    ld   bc, label_7C200
    ld   [bc], a
    ret  nz
    inc  b
    ld   hl, label_7E564
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $07
    jp   z, label_7FA07
    ld   hl, label_7E558
    call label_7FA64
    jp   label_7FA8B

label_7E558::
    ld   l, c
    ld   h, l
    ld   l, [hl]
    ld   h, l
    ld   [hl], e
    ld   h, l
    ld   a, b
    ld   h, l
    ld   a, l
    ld   h, l
    add  a, d
    ld   h, l

label_7E564::
    nop
    ld   b, b
    ld   hl, label_180
    nop
    ld   d, b
    ldi  [hl], a
    add  a, b
    ld   bc, label_7E000
    inc  hl
    add  a, b
    ld   bc, label_7F000
    inc  h
    add  a, b
    ld   bc, $8000
    dec  h
    add  a, b
    ld   bc, $9000
    ld   h, $80
    ld   bc, $A03C
    daa
    ret  nz
    ld   bc, $C221
    ld   h, l
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $11
    jp   z, label_7FA07
    ld   hl, label_7E5A2
    call label_7FA64
    jp   label_7FA8B

label_7E5A2::
    rst  0
    ld   h, l
    call z, label_D165
    ld   h, l
    sub  a, $65
    db   $DB
    ld   h, l
    ld   [$FF65], a
    push hl
    ld   h, l
    ld   [$E565], a
    ld   h, l
    ld   [$FF65], a
    db   $DB
    ld   h, l
    sub  a, $65
    pop  de
    ld   h, l
    call z, label_C765
    ld   h, l
    jp   nz, label_3765
    db   $10 ; Undefined instruction
    ret  nz
    ld   [bc], a
    nop
    jr   nz, label_7E5D0
    add  a, b
    ld   [bc], a
    nop

label_7E5CD::
    jr   nc, label_7E5E3
    add  a, b

label_7E5D0::
    ld   [bc], a
    nop
    ld   b, b
    ld   d, $80
    ld   [bc], a
    nop
    ld   d, b
    inc  h
    add  a, b
    ld   [bc], a
    nop
    ld   h, b
    ld   h, $80
    ld   [bc], a
    nop
    ld   [hl], b
    inc  [hl]

label_7E5E3::
    add  a, b
    ld   [bc], a
    nop
    add  a, b
    ld   [hl], $80
    ld   [bc], a
    nop
    sub  a, b
    ld   b, h
    add  a, b
    ld   [bc], a
    ld   hl, label_7E610
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $04
    jp   z, label_7FA07
    ld   hl, label_7E60A
    call label_7FA64
    jp   label_7FA8B

label_7E60A::
    dec  d
    ld   h, [hl]
    db   $10 ; Undefined instruction
    ld   a, [de]
    ld   h, [hl]

label_7E610::
    dec  sp
    ret  nz
    ld   a, $C0
    ld   bc, $F033
    ld   l, [hl]
    ret  nz
    ld   b, $36
    ld   [hl], b
    ld   c, [hl]
    ret  nz
    inc  bc
    ld   a, [$D379]
    cp   $02
    jp   z, label_7FA2C

label_7E627::
    cp   $03
    jp   z, label_7FA2C
    cp   $0C
    jp   z, label_7FA2C
    cp   $13
    jp   z, label_7FA2C
    ld   hl, label_7E659
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jp   z, label_7FA07
    ld   hl, label_7E651
    call label_7FA64
    jp   label_7FA8B

label_7E651::
    ld   e, [hl]
    ld   h, [hl]
    ld   h, e
    ld   h, [hl]
    ld   l, b
    ld   h, [hl]
    ld   l, b
    ld   h, [hl]

label_7E659::
    jr   nc, label_7E6A4
    ld   h, b
    ret  nz
    ld   b, $30
    ld   c, c
    ld   b, b
    ret  nz
    ld   b, $30
    ld   c, c
    jr   nz, label_7E627
    ld   b, $30
    ld   c, c
    nop
    ret  nz
    ld   b, $21
    adc  a, [hl]
    ld   h, [hl]
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $04
    jp   z, label_7FA07
    ld   hl, label_7E688
    call label_7FA64
    jp   label_7FA8B

label_7E688::
    sub  a, e
    ld   h, [hl]
    sbc  a, b
    ld   h, [hl]
    sbc  a, l
    ld   h, [hl]
    nop
    ld   h, c
    inc  h
    add  a, b
    inc  c
    nop
    ld   d, c
    dec  h
    add  a, b
    inc  c
    nop
    ldd  [hl], a
    daa
    add  a, b
    inc  c
    nop
    ldi  [hl], a

label_7E69F::
    inc  [hl]
    add  a, b
    inc  c
    ld   a, [$D379]
    cp   $05
    jp   z, label_7FA2C
    cp   $08
    jp   z, label_7FA2C
    cp   $0C
    jp   z, label_7FA2C
    cp   $10
    jp   z, label_7FA2C
    cp   $13
    jp   z, label_7FA2C
    ld   hl, label_7E6D6
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7FA07
    ld   hl, label_7E6DB
    jp   label_7FA8B

label_7E6D6::
    dec  sp
    ld   a, [$FF20]
    ret  nz
    ld   [bc], a

label_7E6DB::
    add  hl, sp
    ld   b, b
    jr   nz, label_7E69F
    ld   [label_7F9FA], sp
    db   $D3 ; Undefined instruction
    cp   $0C
    jp   z, label_7FA2C
    ld   a, $03
    ld   [$D3BF], a
    ld   hl, label_7E718
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $04
    jr   z, label_7E707

label_7E6FE::
    ld   hl, label_7E712
    call label_7FA64
    jp   label_7FA25

label_7E707::
    call label_7FAAC
    jp   z, label_7FA07
    ld   a, $01
    ld   [bc], a
    jr   label_7E6FE

label_7E712::
    dec  e
    ld   h, a
    jr   nz, label_7E77D
    inc  hl
    ld   h, a

label_7E718::
    nop
    and  e
    inc  a
    add  a, b

label_7E71C::
    inc  bc
    dec  a
    nop
    inc  bc
    ld   a, $00
    inc  bc
    ccf
    nop
    inc  bc
    ld   hl, label_7E74F
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    ld   a, $33
    ld   [rNR41], a
    call label_7FA75
    cp   $06
    jp   z, label_7FA07
    ld   hl, label_7E745
    call label_7FA64
    jp   label_7FA25

label_7E745::
    ld   d, h
    ld   h, a
    ld   d, a
    ld   h, a
    ld   e, d
    ld   h, a
    ld   e, l
    ld   h, a
    ld   e, l
    ld   h, a

label_7E74F::
    inc  sp
    and  b
    ld   [hl], d
    ret  nz
    inc  b
    ld   d, d
    ret  nz
    inc  b
    ld   d, b
    ret  nz
    inc  b
    jr   nc, label_7E71C
    inc  b
    db   $10 ; Undefined instruction
    inc  b
    ld   hl, label_7E783
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jp   z, label_7FA07
    ld   hl, label_7E77B
    call label_7FA64
    jp   label_7FA8B

label_7E77B::
    adc  a, b
    ld   h, a

label_7E77D::
    adc  a, l
    ld   h, a
    adc  a, b
    ld   h, a
    add  a, e
    ld   h, a

label_7E783::
    scf
    ld   b, b
    ld   b, a
    ret  nz
    ld   bc, label_7E000
    daa
    add  a, b
    ld   [bc], a
    nop
    and  b
    dec  d
    add  a, b
    ld   [bc], a
    ld   hl, label_7E7AA
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7FA07
    ld   hl, label_7E7AF
    jp   label_7FA8B

label_7E7AA::
    inc  a
    ret  nz
    jr   label_7E76E
    ld   bc, label_7E03C
    jr   label_7E773
    ld   [bc], a
    ld   a, [$D379]
    cp   $02
    jp   z, label_7FA2C
    cp   $03
    jp   z, label_7FA2C
    ld   hl, label_7E7E4
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jp   z, label_7FA07
    ld   hl, label_7E7DC
    call label_7FA64
    jp   label_7FA25

label_7E7DC::
    jp   [hl]
    ld   h, a
    db   $EC ; Undefined instruction
    ld   h, a
    rst  $28
    ld   h, a
    db   $F2 ; Undefined instruction
    ld   h, a

label_7E7E4::
    nop
    add  a, $6A
    add  a, b
    inc  b
    ld   l, e
    nop
    dec  b
    ld   l, h
    nop
    ld   b, $6D
    nop
    rlca
    ld   l, [hl]
    nop
    jr   c, label_7E834
    ld   c, $EA
    cp   a
    db   $D3 ; Undefined instruction
    ld   hl, label_7E823
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jr   z, label_7E814

label_7E80B::
    ld   hl, label_7E81F
    call label_7FA64
    jp   label_7FA25

label_7E814::
    call label_7FAAC
    jp   z, label_7FA01
    ld   a, $01
    ld   [bc], a
    jr   label_7E80B

label_7E81F::
    jr   z, label_7E889
    dec  hl
    ld   l, b

label_7E823::
    nop
    ld   h, a
    rrca
    add  a, b
    ld   [bc], a
    ld   h, b
    nop
    ld   [bc], a
    rrca
    nop
    ld   [bc], a
    ld   hl, label_7E84D
    jp   label_7F9E9

label_7E834::
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jp   z, label_7FA07
    ld   hl, label_7E849
    call label_7FA64
    jp   label_7FA8B

label_7E849::
    ld   d, d
    ld   l, b
    ld   d, a
    ld   l, b

label_7E84D::
    ld   e, $29
    ld   b, [hl]
    ret  nz
    stop
    add  hl, hl
    ld   h, h
    add  a, b
    ld   [$8100], sp
    ld   h, h
    add  a, b
    ld   b, $FA
    ld   a, c
    db   $D3 ; Undefined instruction
    and  a
    jp   nz, label_7FA2C
    ld   hl, label_7E882
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jp   z, label_7FA07
    ld   hl, label_7E87E
    call label_7FA64
    jp   label_7FA8B

label_7E87E::
    add  a, a
    ld   l, b
    adc  a, h
    ld   l, b

label_7E882::
    nop
    rrca
    jr   nc, label_7E806
    jr   nz, label_7E888

label_7E888::
    ld   h, b

label_7E889::
    inc  bc
    add  a, b
    jr   nc, label_7E88D

label_7E88D::
    ld   h, a
    inc  bc
    add  a, b
    jr   nz, label_7E8D0
    inc  bc
    ld   [$D3BF], a
    ld   hl, label_7E8D2
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $06
    jr   z, label_7E8B0
    ld   hl, label_7E8C8
    call label_7FA64
    jp   label_7FA25

label_7E8B0::
    call label_7FAAC
    jp   z, label_7FA01
    cp   $01
    jr   z, label_7E8C3
    ld   hl, label_7E8E6

label_7E8BD::
    ld   a, $01
    ld   [bc], a
    jp   label_7FA8B

label_7E8C3::
    ld   hl, label_7E8EB
    jr   label_7E8BD

label_7E8C8::
    rst  $10
    ld   l, b
    jp  c, label_DD68
    ld   l, b
    ld   [rBGPI], a

label_7E8D0::
    db   $E3 ; Undefined instruction
    ld   l, b

label_7E8D2::
    nop
    ld   [rOBP0], a
    add  a, b
    ld   bc, $004B
    ld   bc, $005E
    ld   bc, $005D
    ld   [bc], a
    ld   l, h
    nop
    ld   [bc], a
    ld   l, a
    nop
    ld   [bc], a

label_7E8E6::
    nop
    ld   [hl], b
    ld   c, e
    add  a, b
    ld   bc, label_2000
    ld   c, e
    add  a, b
    ld   bc, $FD21
    ld   l, b
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    jp   label_7FA01
    nop
    ld   a, [$FFA0]
    add  a, b
    jr   nz, label_7E924
    dec  hl
    ld   l, c
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $08
    jp   z, label_7FA01
    ld   hl, label_7E91D
    call label_7FA64
    jp   label_7FA25

label_7E91D::
    jr   nc, label_7E988
    inc  sp
    ld   l, c
    ld   [hl], $69
    inc  sp

label_7E924::
    ld   l, c
    jr   nc, label_7E990
    add  hl, sp
    ld   l, c
    inc  a
    ld   l, c
    nop
    ld   l, c
    cp   b
    add  a, b
    ld   [bc], a
    xor  b
    nop
    ld   [bc], a
    sbc  a, b
    nop
    ld   [bc], a
    adc  a, b
    nop
    ld   [bc], a
    cp   b
    nop
    ld   [bc], a
    ret  z
    nop
    ld   [bc], a
    ld   hl, label_7E99C
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $1A
    jp   z, label_7FA07
    ld   hl, label_7E96A
    call label_7FA64
    ld   a, [$D398]
    cp   $11
    jr   nc, label_7E961
    jp   label_7FA8B

label_7E961::
    inc  hl
    inc  hl
    ld   a, $20
    ld   [rNR42], a
    jp   label_7FA25

label_7E96A::
    and  c
    ld   l, c
    and  [hl]
    ld   l, c
    xor  e
    ld   l, c
    or   b
    ld   l, c
    or   l
    ld   l, c
    cp   d
    ld   l, c
    cp   a
    ld   l, c
    call nz, label_BF69
    ld   l, c
    cp   d
    ld   l, c
    or   l
    ld   l, c
    or   b
    ld   l, c
    xor  e
    ld   l, c
    and  [hl]
    ld   l, c
    and  c
    ld   l, c

label_7E988::
    sbc  a, h
    ld   l, c
    call nz, label_BF69
    ld   l, c
    cp   d
    ld   l, c

label_7E990::
    or   l
    ld   l, c
    or   b
    ld   l, c
    xor  e
    ld   l, c
    and  [hl]
    ld   l, c
    and  c
    ld   l, c
    sbc  a, h
    ld   l, c

label_7E99C::
    scf
    jr   nz, label_7E9C4
    ret  nz
    ld   bc, label_7C000
    daa
    add  a, b
    ld   bc, label_7E000
    dec  [hl]
    add  a, b
    ld   bc, $8000
    scf
    add  a, b
    ld   bc, $A000
    ld   c, l
    add  a, b
    ld   [bc], a
    nop
    or   b
    ld   c, a
    add  a, b
    ld   [bc], a
    nop
    ret  nz
    ld   e, l
    add  a, b
    ld   [bc], a
    nop
    ret  nc
    ld   e, a
    add  a, b
    ld   [bc], a

label_7E9C4::
    nop
    ld   [$FF6D], a
    add  a, b
    ld   [bc], a
    ld   hl, label_7E9EC
    jp   label_7F9E9
    call label_7FA75
    cp   $07
    jp   z, label_7FA07
    ld   hl, label_7E9E0
    call label_7FA64
    jp   label_7FA8B

label_7E9E0::
    pop  af
    ld   l, c
    or   $69
    ei
    ld   l, c
    nop
    ld   l, d
    dec  b
    ld   l, d
    ld   a, [bc]
    ld   l, d

label_7E9EC::
    nop
    ld   b, b
    ld   e, a
    add  a, b
    ld   bc, label_7D000
    ld   e, l
    add  a, b
    ld   bc, label_7E000
    ld   c, a
    add  a, b
    ld   bc, label_7F000
    ld   c, l
    add  a, b
    ld   bc, $8000
    ccf
    add  a, b
    ld   bc, $9000
    inc  a
    add  a, b
    ld   bc, $A03C
    ld   l, $C0
    ld   bc, label_3021
    ld   l, d
    jp   label_7F9E9
    call label_7FA75
    cp   $06
    jp   z, label_7FA07
    ld   hl, label_7EA26
    call label_7FA64
    jp   label_7FA8B

label_7EA26::
    dec  [hl]
    ld   l, d
    db   $3A ; ldd  a, [hl]
    ld   l, d
    ccf
    ld   l, d
    ld   b, h
    ld   l, d
    ld   c, c
    ld   l, d
    nop
    jr   nz, label_7EA7A
    add  a, b
    ld   [bc], a
    nop
    ld   b, b
    scf
    add  a, b
    ld   bc, label_7E000
    daa
    add  a, b
    ld   bc, $8000
    rla
    add  a, b
    ld   bc, $A000
    rlca
    add  a, b
    ld   bc, $C03C
    inc  bc
    ret  nz
    ld   bc, label_7F9FA
    db   $D3 ; Undefined instruction
    cp   $03
    jp   z, label_7FA2C
    ld   hl, label_7EA71
    jp   label_7F9E9
    call label_7FA75
    cp   $03
    jp   z, label_7FA07
    ld   hl, label_7EA6D
    call label_7FA64
    jp   label_7FA8B

label_7EA6D::
    halt
    ld   a, e
    ld   l, d

label_7EA71::
    nop
    add  hl, hl
    ld   l, b
    add  a, b
    db   $10 ; Undefined instruction
    ret  nz
    ld   d, b
    ret  nz

label_7EA7A::
    ld   bc, $C13C
    jr   label_7EA3F
    ld   bc, $9821
    ld   l, d
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7FA07
    ld   hl, label_7EA9D
    jp   label_7FA8B
    nop
    pop  af
    add  hl, bc
    add  a, b
    ld   c, $00
    ld   h, d
    add  hl, bc
    add  a, b
    db   $10 ; Undefined instruction
    ret
    ld   l, d
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $07
    jp   z, label_7FA07
    ld   hl, label_7EABD
    call label_7FA64
    jp   label_7FA8B

label_7EABD::
    adc  a, $6A
    db   $D3 ; Undefined instruction
    ld   l, d
    ret  c
    ld   l, d
    db   $6A
    ld   l, d
    ldh  [$FF0C], a
    ld   l, d
    rst  $20
    ld   l, d
    nop
    jr   nz, label_7EADD
    add  a, b
    ld   bc, label_7C000
    ld   hl, label_180
    nop
    ld   h, b
    add  hl, sp
    add  a, b
    ld   bc, $8000
    ld   c, c
    add  a, b
    ld   bc, $A000
    ld   c, e
    add  a, b
    ld   bc, $C000
    ld   c, l
    add  a, b
    ld   bc, $E03C
    ld   c, a
    ret  nz
    ld   bc, label_1B21
    ld   l, e
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $0B
    jp   z, label_7FA07
    ld   hl, label_7EB07
    call label_7FA64
    jp   label_7FA25

label_7EB07::
    jr   nz, label_7EB74
    inc  hl
    ld   l, e
    ld   h, $6B
    add  hl, hl
    ld   l, e
    inc  l
    ld   l, e
    add  hl, hl
    ld   l, e
    ld   h, $6B
    inc  hl
    ld   l, e
    jr   nz, label_7EB84
    cpl
    ld   l, e
    nop
    ld   h, a
    inc  l
    add  a, b
    ld   bc, $003C
    ld   bc, $004C
    ld   bc, $005C
    ld   bc, $006C
    ld   bc, $007C
    ld   bc, $8009
    jr   nc, label_7EB54
    ld   [hl], a
    ld   l, e
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $16
    jp   z, label_7FA07
    ld   hl, label_7EB4D
    call label_7FA64
    jp   label_7FA25

label_7EB4D::
    ld   a, h
    ld   l, e
    ld   a, a
    ld   l, e
    add  a, d
    ld   l, e
    add  a, l

label_7EB54::
    ld   l, e
    adc  a, b
    ld   l, e
    add  a, l
    ld   l, e
    add  a, d
    ld   l, e
    ld   a, a
    ld   l, e
    add  a, d
    ld   l, e
    add  a, l
    ld   l, e
    adc  a, b
    ld   l, e
    adc  a, e
    ld   l, e
    adc  a, [hl]
    ld   l, e
    adc  a, e
    ld   l, e
    adc  a, b
    ld   l, e
    add  a, l
    ld   l, e
    adc  a, b
    ld   l, e
    adc  a, e
    ld   l, e
    adc  a, [hl]
    ld   l, e
    sub  a, c

label_7EB74::
    ld   l, e
    sub  a, h
    ld   l, e
    nop
    rst  $30

label_7EB79::
    dec  a
    add  a, b
    inc  b
    ld   h, b
    nop
    inc  b
    ld   h, c
    nop
    inc  b
    ld   h, d
    nop

label_7EB84::
    inc  b
    ld   h, e
    nop
    inc  b
    ld   h, h
    nop
    inc  b
    ld   h, l
    nop

label_7EB8D::
    inc  b
    ld   h, [hl]
    nop
    inc  b
    ld   h, a

label_7EB92::
    nop
    inc  b
    ld   [hl], h
    nop
    jr   z, label_7EB92
    ld   a, c
    db   $D3 ; Undefined instruction
    and  a
    jp   nz, label_7FA2C
    ld   a, [$D3D6]
    and  a
    jr   nz, label_7EBAA
    ld   hl, label_7EBF5

label_7EBA7::
    jp   label_7F9E9

label_7EBAA::
    ld   hl, label_7EC09
    jr   label_7EBA7
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jr   z, label_7EBD4
    cp   $06
    jp   z, label_7EBDD
    ld   a, [$D3D6]
    and  a
    jr   nz, label_7EBCF

label_7EBC5::
    ld   hl, label_7EBE7

label_7EBC8::
    ld   a, [bc]
    call label_7FA64
    jp   label_7FA8B

label_7EBCF::
    ld   hl, label_7EBF1
    jr   label_7EBC8

label_7EBD4::
    ld   a, [$D3D6]
    and  a
    jp   nz, label_7EBDD
    jr   label_7EBC5

label_7EBDD::
    ld   hl, $D378
    ld   a, $1B
    ldi  [hl], a
    xor  a
    ld   [hl], a
    jr   label_7EB97

label_7EBE7::
    rst  $38
    ld   l, e
    ld   a, [label_46B]
    ld   l, h
    ld   a, [label_46B]
    ld   l, h

label_7EBF1::
    ld   c, $6C
    ld   c, $6C

label_7EBF5::
    scf
    ld   h, c
    jr   nc, label_7EB79
    inc  bc
    scf
    ld   b, c
    inc  d
    add  a, b
    inc  bc
    scf
    jr   nz, label_7EC32
    ret  nz
    ld   [bc], a
    scf
    jr   nz, label_7EC1B
    ret  nz
    ld   [bc], a

label_7EC09::
    scf
    and  c
    jr   nc, label_7EB8D
    inc  b
    scf
    ld   d, c
    inc  d
    add  a, b
    inc  b
    ld   a, $06
    ld   [$D3BF], a
    ld   hl, label_7EC41

label_7EC1B::
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jr   z, label_7EC32

label_7EC29::
    ld   hl, label_7EC3D
    call label_7FA64
    jp   label_7FA25

label_7EC32::
    call label_7FAAC
    jp   z, label_7FA01
    ld   a, $01
    ld   [bc], a
    jr   label_7EC29

label_7EC3D::
    ld   b, [hl]
    ld   l, h
    ld   c, c
    ld   l, h

label_7EC41::
    nop
    ret  nz
    ld   e, b
    add  a, b
    ld   [bc], a
    ld   l, b
    add  a, b
    ld   [bc], a
    ld   e, b
    add  a, b
    ld   [bc], a
    ld   a, $78
    ld   [$D3BF], a
    ld   hl, label_7EC87
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jr   z, label_7EC6B

label_7EC62::
    ld   hl, label_7EC83
    call label_7FA64
    jp   label_7FA25

label_7EC6B::
    call label_7FAAC
    jp   z, label_7FA01
    cp   $18
    jr   z, label_7EC7A
    ld   a, $01
    ld   [bc], a
    jr   label_7EC62

label_7EC7A::
    ld   a, $01
    ld   [bc], a
    ld   hl, label_7EC8C
    jp   label_7FA8B

label_7EC83::
    sub  a, c
    ld   l, h
    sub  a, h
    ld   l, h

label_7EC87::
    nop
    inc  l
    ld   a, h
    add  a, b
    ld   [bc], a

label_7EC8C::
    nop
    rst  $30
    ld   a, h
    add  a, b
    ld   [bc], a
    ld   a, l
    nop
    ld   [bc], a
    ld   a, h
    nop
    ld   [bc], a
    ld   a, [$D379]
    and  a
    jp   nz, label_7FA2C
    ld   hl, label_7ECBA
    jp   label_7F9E9
    ld   a, [$C50E]
    and  a
    jr   z, label_7ECB1
    call label_7FA71
    ret  nz
    jp   label_7FA07

label_7ECB1::
    ld   hl, label_7ECBF
    call label_7FA8B
    jp   label_7FA07

label_7ECBA::
    ld   [$0060], sp
    ret  nz
    inc  c

label_7ECBF::
    nop
    ld   h, a
    nop
    nop
    jr   nz, label_7ED03
    inc  d
    ld   [$D3BF], a
    ld   hl, label_7ECFB
    jp   label_7F9E9
    call label_7FA75
    cp   $03
    jr   z, label_7ECDF

label_7ECD6::
    ld   hl, label_7ECF7
    call label_7FA64
    jp   label_7FA25

label_7ECDF::
    call label_7FAAC
    jp   z, label_7FA07
    cp   $0E
    jr   z, label_7ECEE
    ld   a, $01
    ld   [bc], a
    jr   label_7ECD6

label_7ECEE::
    ld   a, $01
    ld   [bc], a
    ld   hl, label_7ED00
    jp   label_7FA8B

label_7ECF7::
    dec  b
    ld   l, l
    ld   [$006D], sp
    ld   a, [de]
    ld   b, $80
    ld   bc, label_7E400
    ld   b, $80
    ld   bc, $0006
    ld   bc, $0048
    ld   bc, label_2A21
    ld   l, l
    jp   label_7F9E9
    call label_7FA75
    cp   $03
    jr   z, label_7ED21

label_7ED18::
    ld   hl, label_7ED26
    call label_7FA64
    jp   label_7FA25

label_7ED21::
    ld   a, $01
    ld   [bc], a
    jr   label_7ED18

label_7ED26::
    cpl
    ld   l, l
    ldd  [hl], a
    ld   l, l
    nop
    ld   d, b
    dec  bc
    add  a, b
    ld   bc, $000C
    ld   bc, $000B
    ld   bc, label_7E021
    ld   l, l
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jp   z, label_7FA07
    ld   hl, label_7ED58
    call label_7FA64
    ld   a, [$D398]
    cp   $01
    jp   z, label_7FA8B
    jp   label_7FA25

label_7ED58::
    ld   h, l
    ld   l, l
    ld   l, d
    ld   l, l
    ld   l, l
    ld   l, l
    ld   [hl], b
    ld   l, l
    nop
    rrca
    ld   h, b
    add  a, b
    jr   c, label_7ED66

label_7ED66::
    or   $60
    add  a, b
    inc  c
    ld   h, c
    nop
    inc  c
    ld   h, d
    nop
    inc  c
    ld   h, e
    nop
    jr   c, label_7ED95
    adc  a, e
    ld   l, l
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7FA01
    ld   hl, label_7ED90
    jp   label_7FA8B
    nop
    rrca
    xor  b
    add  a, b
    and  b

label_7ED90::
    nop
    rst  $30
    xor  b
    add  a, b
    ld   h, b

label_7ED95::
    ld   hl, label_7EDAD
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $02
    jp   z, label_7FA07
    ld   hl, label_7EDB2
    jp   label_7FA8B

label_7EDAD::
    nop
    add  hl, hl
    rlca
    add  a, b
    ld   [$A700], sp
    dec  b
    add  a, b
    ld   d, b
    ld   hl, label_7EE20
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $24
    jp   z, label_7FA01
    ld   hl, label_7EDDA
    call label_7FA64
    ld   a, [$D398]
    cp   $1E
    jp   z, label_7FA8B
    jp   label_7FA25

label_7EDDA::
    dec  hl
    ld   l, [hl]
    ld   l, $6E
    ld   sp, label_2E6E
    ld   l, [hl]
    dec  hl
    ld   l, [hl]
    jr   z, label_7EE54
    dec  hl
    ld   l, [hl]
    ld   l, $6E
    ld   sp, label_2E6E
    ld   l, [hl]
    dec  hl
    ld   l, [hl]
    jr   z, label_7EE60
    dec  hl
    ld   l, [hl]
    ld   sp, label_346E
    ld   l, [hl]
    ld   sp, label_2B6E
    ld   l, [hl]
    jr   z, label_7EE6C
    dec  hl
    ld   l, [hl]
    ld   sp, label_346E
    ld   l, [hl]
    ld   sp, label_2B6E
    ld   l, [hl]
    dec  h
    ld   l, [hl]
    dec  hl
    ld   l, [hl]
    ld   l, $6E
    ld   sp, label_346E
    ld   l, [hl]
    scf
    ld   l, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, [hl]
    ccf
    ld   l, [hl]
    ld   b, d
    ld   l, [hl]
    ld   b, l
    ld   l, [hl]
    ld   c, b
    ld   l, [hl]
    ld   c, e
    ld   l, [hl]

label_7EE20::
    nop
    ld   a, [$FF8C]
    add  a, b
    ld   e, h
    adc  a, h
    nop
    ld   [$008C], sp
    inc  c
    ld   a, [hl]
    nop
    inc  b
    ld   a, h
    nop
    inc  b
    ld   l, [hl]
    nop
    inc  b
    ld   l, l
    nop
    inc  b
    ld   l, h
    nop
    inc  b
    nop
    rst  $30
    ld   l, e
    add  a, b
    inc  c
    ld   l, h
    nop
    inc  c
    ld   l, l
    nop
    inc  c
    ld   l, [hl]
    nop
    inc  c
    ld   a, h
    nop
    inc  c
    ld   a, [hl]
    nop
    inc  [hl]
    ld   a, $40
    ld   [$D3BF], a
    ld   hl, label_7EE7C
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75

label_7EE60::
    cp   $03
    jr   z, label_7EE6D

label_7EE64::
    ld   hl, label_7EE78
    call label_7FA64
    jp   label_7FA25

label_7EE6D::
    call label_7FAAC
    jp   z, label_7FA01
    ld   a, $01
    ld   [bc], a
    jr   label_7EE64

label_7EE78::
    add  a, c
    ld   l, [hl]
    add  a, h
    ld   l, [hl]

label_7EE7C::
    nop
    add  a, b
    db   $3A ; ldd  a, [hl]
    add  a, b
    ld   bc, $8039
    ld   [bc], a
    db   $3A ; ldd  a, [hl]
    add  a, b
    ld   bc, $BA21
    ld   l, [hl]
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $0D
    jp   z, label_7FA07
    ld   hl, label_7EEA2
    call label_7FA64
    jp   label_7FA25

label_7EEA2::
    cp   a
    ld   l, [hl]
    jp   nz, label_C56E
    ld   l, [hl]
    jp   nz, label_BF6E
    ld   l, [hl]
    ret  z
    ld   l, [hl]
    bit  5, [hl]
    adc  a, $6E
    pop  de
    ld   l, [hl]
    call nc, label_D76E
    ld   l, [hl]
    jp  c, label_6E
    jp   nz, label_805D
    ld   bc, $005C
    ld   bc, $004F
    ld   bc, $004E
    ld   bc, $005D
    ld   bc, $005E
    ld   bc, $005F
    ld   bc, $006C
    ld   bc, $006D
    ld   bc, $006E
    ld   bc, $006F
    db   $10 ; Undefined instruction
    dec  b
    ld   [$D3BF], a
    ld   hl, label_7EF1D
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $0C
    jr   z, label_7EEFC

label_7EEF3::
    ld   hl, label_7EF07
    call label_7FA64
    jp   label_7FA25

label_7EEFC::
    call label_7FAAC
    jp   z, label_7FA07
    ld   a, $04
    ld   [bc], a
    jr   label_7EEF3

label_7EF07::
    dec  h
    ld   l, a
    jr   z, label_7EF7A
    dec  hl
    ld   l, a
    ld   l, $6F
    dec  hl
    ld   l, a
    jr   z, label_7EF82
    dec  h
    ld   l, a
    ldi  [hl], a
    ld   l, a
    dec  h
    ld   l, a
    jr   z, label_7EF8A
    dec  hl
    ld   l, a

label_7EF1D::
    nop
    ld   h, a
    ld   l, h
    add  a, b
    ld   bc, $006C
    ld   bc, $006B
    ld   bc, $006A
    ld   bc, $0069
    ld   bc, $0068
    ld   [bc], a
    ld   a, $05
    ld   [$D3BF], a
    ld   hl, label_7EF67
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $07
    jr   z, label_7EF50

label_7EF47::
    ld   hl, label_7EF5B
    call label_7FA64
    jp   label_7FA25

label_7EF50::
    call label_7FAAC
    jp   z, label_7FA07
    ld   a, $01
    ld   [bc], a
    jr   label_7EF47

label_7EF5B::
    ld   l, h
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, h
    ld   l, a
    ld   [hl], d
    ld   l, a
    ld   l, h
    ld   l, a
    ld   [hl], l
    ld   l, a

label_7EF67::
    nop
    db   $F4 ; Undefined instruction
    ld   l, b
    add  a, b
    ld   [bc], a
    ld   l, a
    nop
    ld   [bc], a
    ld   l, c
    nop
    ld   [bc], a
    ld   l, d
    nop
    ld   [bc], a
    ld   l, b
    nop
    ld   [bc], a
    ld   a, $08

label_7EF7A::
    ld   [$D3BF], a
    ld   hl, label_7EFBE
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75

label_7EF8A::
    cp   $0A
    jr   z, label_7EF9F

label_7EF8E::
    ld   hl, label_7EFAA
    call label_7FA64
    ld   a, [$D398]
    cp   $01
    jp   z, label_7FA8B
    jp   label_7FA25

label_7EF9F::
    call label_7FAAC
    jp   z, label_7FA01
    ld   a, $02
    ld   [bc], a
    jr   label_7EF8E

label_7EFAA::
    jp   label_C86F
    ld   l, a
    adc  a, $6F
    call nc, label_DA6F
    ld   l, a
    rst  $10
    ld   l, a
    call nc, label_D16F
    ld   l, a
    adc  a, $6F
    bit  5, a

label_7EFBE::
    nop
    ret  nz
    ld   a, a
    add  a, b
    adc  a, b
    nop
    db   $F4 ; Undefined instruction
    ld   l, l
    add  a, b
    ld   bc, $0074
    ld   bc, $005F
    ld   bc, $0066
    ld   bc, $005D
    ld   bc, $0064
    ld   bc, $004F
    ld   bc, $0062
    ld   bc, $EA21
    ld   l, a
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    jp   label_7FA07
    nop
    db   $F4 ; Undefined instruction
    ld   a, l
    add  a, b
    ld   b, b
    ld   hl, label_7F038
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $14
    jp   z, label_7FA01
    ld   hl, label_7F012
    call label_7FA64
    ld   a, [$D398]
    cp   $13
    jp   z, label_7FA8B
    jp   label_7FA25

label_7F012::
    dec  a
    ld   [hl], b
    ld   b, b
    ld   [hl], b
    ld   b, e
    ld   [hl], b
    ld   b, [hl]
    ld   [hl], b
    ld   c, c
    ld   [hl], b
    ld   c, h
    ld   [hl], b
    ld   c, a
    ld   [hl], b
    ld   d, d
    ld   [hl], b
    ld   d, l
    ld   [hl], b
    ld   e, b
    ld   [hl], b
    ld   e, e
    ld   [hl], b
    ld   e, [hl]
    ld   [hl], b
    ld   h, c
    ld   [hl], b
    ld   h, h
    ld   [hl], b
    ld   h, a
    ld   [hl], b
    ld   l, d
    ld   [hl], b
    ld   l, l
    ld   [hl], b
    ld   [hl], b
    ld   [hl], b
    ld   [hl], e
    ld   [hl], b

label_7F038::
    ld   h, $40
    scf
    add  a, b
    ld   b, $36
    add  a, b
    ld   b, $35
    add  a, b
    ld   b, $34
    add  a, b
    ld   b, $27
    add  a, b
    ld   b, $26

label_7F04A::
    add  a, b
    ld   b, $25
    add  a, b
    ld   b, $24
    add  a, b
    ld   b, $17
    add  a, b
    ld   b, $16
    add  a, b
    ld   b, $15
    add  a, b
    ld   b, $14
    add  a, b
    ld   b, $07
    add  a, b
    ld   b, $06
    nop
    ld   b, $05
    nop
    ld   b, $04
    nop
    ld   b, $03
    nop
    ld   b, $02
    nop
    ld   b, $01
    nop
    ld   b, $00
    ld   b, a
    nop
    add  a, b
    jr   nz, label_7F09A
    and  c
    ld   [hl], b
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $08
    jp   z, label_7FA07
    ld   hl, label_7F093
    call label_7FA64
    jp   label_7FA8B

label_7F093::
    and  [hl]
    ld   [hl], b
    xor  e
    ld   [hl], b
    or   b
    ld   [hl], b
    or   l

label_7F09A::
    ld   [hl], b
    cp   d
    ld   [hl], b
    xor  e
    ld   [hl], b
    cp   a
    ld   [hl], b
    ld   h, $29
    ld   b, b
    ret  nz
    inc  b
    ld   h, $10
    ld   b, b
    ret  nz
    ld   [bc], a
    ld   h, $29
    db   $10 ; Undefined instruction
    inc  b
    ld   h, $10
    db   $10 ; Undefined instruction
    ld   [bc], a
    ld   h, $19
    ld   h, b
    ret  nz
    inc  b
    ld   h, $10
    ld   h, b
    ret  nz
    ld   [bc], a
    ld   h, $10
    db   $10 ; Undefined instruction
    inc  bc
    ld   a, $08
    ld   [$D3BF], a
    ld   hl, label_7F10C
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $0C
    jr   z, label_7F0EB

label_7F0DA::
    ld   hl, label_7F0F6
    call label_7FA64
    ld   a, [$D398]
    cp   $02
    jp   z, label_7FA8B
    jp   label_7FA25

label_7F0EB::
    call label_7FAAC
    jp   z, label_7FA01
    ld   a, $03
    ld   [bc], a
    jr   label_7F0DA

label_7F0F6::
    ld   de, $C371
    ld   l, a
    ret  z
    ld   l, a
    adc  a, $6F
    call nc, label_DA6F
    ld   l, a
    rst  $10
    ld   l, a
    call nc, label_D16F
    ld   l, a
    adc  a, $6F
    bit  5, a

label_7F10C::
    nop
    ret  nz
    ld   a, a
    add  a, b
    rst  $38
    ld   a, a
    add  a, b
    inc  [hl]
    ld   hl, label_7F12C
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75

label_7F121::
    cp   $02

label_7F123::
    jp   z, label_7FA01
    ld   hl, label_7F131
    jp   label_7FA8B

label_7F12C::
    nop
    add  hl, de
    ld   d, b
    add  a, b
    ld   b, $00
    ld   h, l
    ld   d, b
    add  a, b
    jr   nz, label_7F158
    sub  a, l
    ld   [hl], c
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $23
    jp   z, label_7FA07
    ld   hl, label_7F151
    call label_7FA64
    jp   label_7FA8B

label_7F151::
    sbc  a, d
    ld   [hl], c
    cp   l
    ld   [hl], c
    sbc  a, a
    ld   [hl], c
    cp   l

label_7F158::
    ld   [hl], c
    and  h
    ld   [hl], c
    cp   l
    ld   [hl], c
    xor  c
    ld   [hl], c
    cp   l
    ld   [hl], c
    xor  c
    ld   [hl], c
    cp   l
    ld   [hl], c
    xor  [hl]
    ld   [hl], c
    jp   nz, label_B371
    ld   [hl], c
    jp   nz, label_B871
    ld   [hl], c
    jp   nz, label_B371
    ld   [hl], c
    jp   nz, label_AE71
    ld   [hl], c
    jp   nz, label_B371
    ld   [hl], c
    jp   nz, label_B871
    ld   [hl], c
    jp   nz, label_B371
    ld   [hl], c
    jp   nz, label_AE71
    ld   [hl], c
    jp   nz, label_B371
    ld   [hl], c
    jp   nz, label_B871
    ld   [hl], c
    jp   nz, label_B371
    ld   [hl], c
    jp   nz, label_71
    inc  e
    ld   h, b
    add  a, b
    jr   label_7F19B

label_7F19B::
    add  hl, de
    ld   d, b
    add  a, b
    ld   a, [bc]
    nop
    add  hl, de
    jr   nc, label_7F123
    add  hl, bc
    nop
    add  hl, de
    ld   b, b
    add  a, b
    rlca
    nop
    add  hl, de
    ld   d, b
    add  a, b
    ld   b, $00
    add  hl, de
    ld   h, b
    add  a, b
    ld   b, $00
    add  hl, de
    ld   h, b
    add  a, b
    inc  b
    nop
    add  hl, de
    ld   d, b
    add  a, b
    ld   [bc], a
    scf
    ld   b, b
    jr   nz, label_7F181
    ld   [bc], a
    scf
    jr   nz, label_7F1E5
    ret  nz
    ld   [bc], a
    ld   hl, label_7F216
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $1B
    jp   z, label_7FA01
    ld   hl, label_7F1E2
    call label_7FA64
    jp   label_7FA8B

label_7F1E2::
    dec  de
    ld   [hl], d
    cp   l

label_7F1E5::
    ld   [hl], c
    jr   nz, label_7F25A
    cp   l
    ld   [hl], c
    dec  h
    ld   [hl], d
    cp   l
    ld   [hl], c
    ld   a, [hli]
    ld   [hl], d
    cp   l
    ld   [hl], c
    ld   a, [hli]
    ld   [hl], d
    cp   l
    ld   [hl], c
    cpl
    ld   [hl], d
    jp   nz, label_3471
    ld   [hl], d
    jp   nz, label_3971
    ld   [hl], d
    jp   nz, label_3471
    ld   [hl], d
    jp   nz, label_2F71
    ld   [hl], d
    jp   nz, label_3471
    ld   [hl], d
    jp   nz, label_3971
    ld   [hl], d
    jp   nz, label_3471
    ld   [hl], d
    jp   nz, label_71
    nop
    nop
    add  a, b
    jr   nz, label_7F21C

label_7F21C::
    add  hl, de
    daa
    add  a, b
    ld   a, [bc]
    nop
    add  hl, de
    ld   h, $80
    add  hl, bc
    nop
    add  hl, de
    inc  h
    add  a, b
    ld   [label_1900], sp
    inc  hl
    add  a, b
    rlca
    nop
    add  hl, de
    rla
    add  a, b
    ld   b, $00
    add  hl, de
    rla
    add  a, b
    inc  b
    nop
    add  hl, de
    ld   d, $80
    ld   [bc], a
    ld   hl, label_7F26D
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $0B
    jp   z, label_7FA07
    ld   hl, label_7F259
    call label_7FA64
    jp   label_7FA8B

label_7F259::
    ld   [hl], d

label_7F25A::
    ld   [hl], d
    ld   [hl], a
    ld   [hl], d
    ld   a, h
    ld   [hl], d
    ld   [hl], a
    ld   [hl], d
    ld   [hl], d
    ld   [hl], d
    ld   l, l
    ld   [hl], d
    sub  a, b
    ld   [hl], d
    adc  a, e
    ld   [hl], d
    add  a, [hl]
    ld   [hl], d
    add  a, c
    ld   [hl], d

label_7F26D::
    nop
    jr   nz, label_7F2A0
    add  a, b
    ld   [bc], a
    nop
    ld   b, b
    ld   b, b
    add  a, b
    inc  bc
    nop
    add  a, b
    ld   d, b
    add  a, b
    inc  b
    nop
    ret  nz
    ld   h, b
    add  a, b
    dec  b
    scf
    db   $10 ; Undefined instruction
    ret  nz
    ld   [bc], a
    nop
    db   $10 ; Undefined instruction
    add  a, b
    inc  bc
    nop
    db   $10 ; Undefined instruction
    add  a, b
    inc  b
    nop
    db   $10 ; Undefined instruction
    add  a, b
    dec  b
    ld   hl, label_7F2CE
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $0C
    jp   z, label_7FA01
    ld   hl, label_7F2B8
    call label_7FA64
    ld   a, [$D398]
    cp   $06
    jp   z, label_7FA8B
    jp   label_7FA25

label_7F2B8::
    sub  a, $72
    db   $D3 ; Undefined instruction
    ld   [hl], d
    reti
    ld   [hl], d
    sub  a, $72
    call c, label_DF72
    ld   [hl], d
    sub  a, $72
    db   $D3 ; Undefined instruction
    ld   [hl], d
    reti
    ld   [hl], d
    sub  a, $72
    call c, label_72
    add  a, b
    ld   c, b
    add  a, b
    ld   [bc], a
    ld   c, c
    add  a, b
    ld   [bc], a
    ld   c, d
    add  a, b
    ld   [bc], a
    ld   c, e
    add  a, b
    ld   [bc], a
    ld   c, h
    add  a, b
    ld   [bc], a
    nop
    jr   nz, label_7F32A
    add  a, b
    ld   [bc], a
    ld   a, $2B
    ld   [$D3DF], a
    ld   a, $15
    ld   [$D3E0], a
    ld   hl, label_7F415
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jr   z, label_7F33B
    cp   $0D
    jr   z, label_7F363
    cp   $1A
    jr   z, label_7F34A
    cp   $52
    jp   z, label_7FA01

label_7F30C::
    ld   hl, label_7F373
    call label_7FA64
    ld   a, [$D398]
    cp   $1A
    jp   z, label_7FA8B
    cp   $22
    jp   z, label_7FA8B
    cp   $2A
    jp   z, label_7FA8B
    cp   $32
    jp   z, label_7FA8B
    cp   $3A
    jp   z, label_7FA8B
    cp   $42
    jp   z, label_7FA8B
    cp   $4A
    jp   z, label_7FA8B
    jp   label_7FA25

label_7F33B::
    push de
    ld   de, $D3DF
    call label_7FA71
    pop  de
    jr   z, label_7F359
    ld   a, $01
    ld   [bc], a
    jr   label_7F30C

label_7F34A::
    push de
    ld   de, $D3E0
    call label_7FA71
    pop  de
    jr   z, label_7F35E
    ld   a, $12
    ld   [bc], a
    jr   label_7F30C

label_7F359::
    ld   a, $05
    ld   [bc], a
    jr   label_7F30C

label_7F35E::
    ld   a, $1A
    ld   [bc], a
    jr   label_7F30C

label_7F363::
    ld   a, $20
    ld   [$D370], a
    call label_7D3ED
    ld   bc, $D398
    ld   de, $D393
    jr   label_7F30C

label_7F373::
    ld   a, [de]
    ld   [hl], h
    dec  e
    ld   [hl], h
    jr   nz, label_7F3ED
    inc  hl
    ld   [hl], h
    ld   h, $74
    add  hl, hl
    ld   [hl], h
    inc  l
    ld   [hl], h
    cpl
    ld   [hl], h
    ldd  [hl], a
    ld   [hl], h
    dec  [hl]
    ld   [hl], h
    jr   c, label_7F3FD
    dec  sp
    ld   [hl], h
    ld   a, $74
    ld   b, c
    ld   [hl], h
    ld   b, h
    ld   [hl], h
    ld   b, a
    ld   [hl], h
    ld   c, d
    ld   [hl], h
    ld   c, l
    ld   [hl], h
    ld   d, b
    ld   [hl], h
    ld   d, e
    ld   [hl], h
    ld   d, [hl]
    ld   [hl], h
    ld   e, c
    ld   [hl], h
    ld   d, [hl]
    ld   [hl], h
    ld   d, e
    ld   [hl], h
    ld   d, b
    ld   [hl], h
    ld   e, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   l, d
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   l, l
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   l, d
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   [hl], d
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   l, d
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   [hl], a
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   l, d
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   a, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, a
    ld   [hl], h

label_7F3ED::
    ld   l, d
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    add  a, c
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, a
    ld   [hl], h

label_7F3FD::
    ld   l, d
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    add  a, [hl]
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   l, d
    ld   [hl], h
    ld   h, a
    ld   [hl], h
    ld   h, h
    ld   [hl], h
    ld   h, c
    ld   [hl], h

label_7F415::
    nop
    add  a, b
    sbc  a, h
    add  a, b
    ld   bc, $008E
    ld   bc, $007E
    ld   bc, $008C
    ld   bc, $007C
    ld   bc, $006F
    ld   bc, $006D
    ld   bc, $005F
    ld   bc, $005D
    ld   bc, $004F
    ld   bc, $004D
    ld   bc, $003F
    ld   bc, $003D
    ld   bc, $8037
    ld   [bc], a
    dec  [hl]
    add  a, b
    ld   [bc], a
    daa
    add  a, b
    ld   [bc], a
    dec  h
    add  a, b
    ld   [bc], a
    rla
    add  a, b
    ld   [bc], a
    dec  d
    add  a, b
    ld   [bc], a
    inc  d
    add  a, b
    ld   [bc], a
    rlca
    add  a, b
    ld   [bc], a
    ld   b, $80
    ld   [bc], a
    dec  b
    add  a, b
    ld   [bc], a
    nop
    ld   [hl], b
    dec  d
    add  a, b

label_7F460::
    ld   [bc], a
    inc  d
    add  a, b
    ld   [bc], a
    rlca
    add  a, b
    ld   [bc], a
    ld   b, $80
    ld   [bc], a
    dec  b
    add  a, b
    ld   [bc], a
    nop
    ld   h, b
    dec  d
    add  a, b
    ld   [bc], a
    nop
    ld   d, b
    dec  d
    add  a, b
    ld   [bc], a
    nop
    ld   b, b
    dec  d
    add  a, b
    ld   [bc], a
    nop
    jr   nc, label_7F494
    add  a, b
    ld   [bc], a
    nop
    jr   nz, label_7F499
    add  a, b
    ld   [bc], a
    nop
    db   $10 ; Undefined instruction
    add  a, b
    ld   [bc], a
    ld   a, $40
    ld   [$D3BF], a
    ld   hl, label_7F4EB
    jp   label_7F9E9
    call label_7FA71

label_7F499::
    ret  nz
    call label_7FA75
    cp   $21
    jp   z, label_7FA01
    ld   hl, label_7F4AB
    call label_7FA64
    jp   label_7FA8B

label_7F4AB::
    ld   a, [$FF74]
    push af
    ld   [hl], h
    ld   a, [rUNKN4]
    ld   [hl], h
    inc  b
    ld   [hl], l
    add  hl, bc
    ld   [hl], l
    ld   c, $75
    inc  de
    ld   [hl], l
    jr   label_7F532
    dec  e
    ld   [hl], l
    ldi  [hl], a
    ld   [hl], l
    daa
    ld   [hl], l
    inc  l
    ld   [hl], l
    ld   sp, label_3675
    ld   [hl], l
    dec  sp
    ld   [hl], l
    ld   b, b
    ld   [hl], l
    ld   b, l
    ld   [hl], l
    ld   c, d
    ld   [hl], l
    ld   c, a
    ld   [hl], l
    ld   d, h
    ld   [hl], l
    ld   e, c
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], l
    ld   h, e
    ld   [hl], l
    ld   l, b
    ld   [hl], l
    ld   l, l
    ld   [hl], l
    ld   [hl], d
    ld   [hl], l
    ld   [hl], a
    ld   [hl], l
    ld   a, h
    ld   [hl], l
    add  a, c
    ld   [hl], l
    add  a, [hl]
    ld   [hl], l
    adc  a, e
    ld   [hl], l

label_7F4EB::
    nop
    jr   nz, label_7F555
    add  a, b
    ld   [bc], a
    nop
    jr   nz, label_7F559
    add  a, b
    ld   [bc], a
    nop
    jr   nz, label_7F55D
    add  a, b
    ld   [bc], a
    nop
    jr   nz, label_7F561
    add  a, b
    inc  bc
    nop
    jr   nz, label_7F559
    add  a, b
    inc  bc
    nop
    jr   nz, label_7F55D
    add  a, b
    inc  bc
    nop
    jr   nz, label_7F561
    add  a, b
    inc  b
    nop
    jr   nz, label_7F565
    add  a, b
    inc  b
    nop
    jr   nz, label_7F55D
    add  a, b
    inc  b
    nop
    jr   nz, label_7F561
    add  a, b
    dec  b
    nop
    jr   nz, label_7F565
    add  a, b

label_7F521::
    dec  b
    nop
    jr   nz, label_7F569
    add  a, b
    dec  b
    nop
    jr   nz, label_7F561
    add  a, b
    ld   b, $00
    jr   nz, label_7F565
    add  a, b
    ld   b, $00

label_7F532::
    jr   nz, label_7F569
    add  a, b
    ld   b, $00
    jr   nz, label_7F56D
    add  a, b
    ld   [label_2000], sp
    daa
    add  a, b
    ld   [label_2000], sp
    ld   h, $80
    ld   a, [bc]
    nop
    jr   nz, label_7F56D
    add  a, b
    ld   a, [bc]
    nop
    jr   nz, label_7F571
    add  a, b
    inc  c
    nop
    jr   nz, label_7F569
    add  a, b
    inc  c
    nop

label_7F555::
    jr   nz, label_7F56D
    add  a, b
    ld   c, $00
    jr   nz, label_7F571
    add  a, b

label_7F55D::
    ld   c, $00
    jr   nz, label_7F575

label_7F561::
    add  a, b
    stop
    jr   nz, label_7F56D
    add  a, b
    stop

label_7F569::
    jr   nz, label_7F571
    add  a, b
    ld   [de], a

label_7F56D::
    nop
    jr   nz, label_7F575
    add  a, b

label_7F571::
    ld   [de], a
    nop
    jr   nz, label_7F579

label_7F575::
    add  a, b
    inc  d
    nop
    jr   nz, label_7F57D
    add  a, b
    inc  d
    nop

label_7F57D::
    jr   nz, label_7F581
    add  a, b
    ld   d, $00
    jr   nz, label_7F585
    add  a, b

label_7F585::
    ld   d, $00
    jr   nz, label_7F589

label_7F589::
    add  a, b
    jr   label_7F58C

label_7F58C::
    stop
    add  a, b
    jr   nz, label_7F5CF
    rlca
    ld   [$D3BF], a
    ld   hl, label_7F5C6
    jp   label_7F9E4
    call label_7FA75
    cp   $09
    jr   z, label_7F5AB

label_7F5A2::
    ld   hl, label_7F5B6
    call label_7FA64
    jp   label_7FA25

label_7F5AB::
    call label_7FAAC
    jp   z, label_7FA07
    ld   a, $01
    ld   [bc], a
    jr   label_7F5A2

label_7F5B6::
    bit  6, l
    adc  a, $75
    pop  de
    ld   [hl], l
    call nc, label_D775
    ld   [hl], l
    call nc, label_D175
    ld   [hl], l
    adc  a, $75

label_7F5C6::
    nop
    db   $F4 ; Undefined instruction
    rrca
    add  a, b
    ld   bc, $000E
    ld   bc, $000D
    ld   bc, $000C
    ld   bc, $000B
    ld   bc, $000A
    ld   bc, label_73E
    ld   [$D3BF], a
    call label_7FA33
    ld   hl, label_7E217
    call label_7FAD0
    jp   label_7FA7F
    call label_7FA75
    cp   $09
    jr   z, label_7F5FC
    cp   $0A
    jr   z, label_7F605

label_7F5F6::
    ld   hl, label_7E205
    jp   label_7FB11

label_7F5FC::
    call label_7FAAC
    jp   z, label_7FA51
    ld   a, [bc]
    jr   label_7F5F6

label_7F605::
    ld   a, $01
    ld   [bc], a
    jr   label_7F5F6
    ld   hl, label_7F647
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $12
    jp   z, label_7FA07
    ld   hl, label_7F625
    call label_7FA64
    jp   label_7FA8B

label_7F625::
    ld   c, h
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    jr   nz, label_7F656
    add  a, b
    ld   bc, label_7C000
    dec  c
    add  a, b
    ld   bc, label_7E000
    ld   c, $80
    ld   bc, $8000
    rrca
    add  a, b
    ld   bc, $A000
    inc  e
    add  a, b
    ld   bc, $E000
    dec  e
    add  a, b
    ld   bc, $C000
    ld   e, $80
    ld   [bc], a
    nop
    or   b
    rra
    add  a, b
    ld   [bc], a
    nop
    and  b
    inc  l
    add  a, b
    ld   [bc], a
    nop
    sub  a, b
    dec  l
    add  a, b
    ld   [bc], a
    nop
    add  a, b
    ld   l, $80
    ld   [bc], a
    nop
    ld   [hl], b
    cpl
    add  a, b
    ld   [bc], a
    nop
    ld   h, b
    inc  a
    add  a, b
    ld   [bc], a
    nop
    ld   d, b
    dec  a
    add  a, b
    ld   [bc], a
    nop
    ld   b, b
    ld   a, $80
    ld   [bc], a
    nop
    jr   nc, label_7F6D4
    add  a, b
    ld   [bc], a
    nop
    jr   nz, label_7F6E6
    add  a, b
    ld   [bc], a
    scf
    db   $10 ; Undefined instruction
    ret  nz
    ld   [bc], a
    ld   hl, label_7F6D6
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $0E
    jp   z, label_7FA07
    ld   hl, label_7F6BC
    call label_7FA64
    jp   label_7FA8B

label_7F6BC::
    db   $DB
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    ld   [hl], a
    ld   [label_D77], sp
    ld   [hl], a
    ld   [de], a
    ld   [hl], a

label_7F6D4::
    rla
    ld   [hl], a

label_7F6D6::
    nop
    jr   nc, label_7F716
    add  a, b
    ld   [bc], a
    nop
    ld   h, b
    ccf
    add  a, b
    ld   [bc], a
    nop
    sub  a, b
    dec  a
    add  a, b
    ld   [bc], a
    nop

label_7F6E6::
    ret  nz
    ccf
    add  a, b
    ld   [bc], a
    nop
    ld   a, [$FF3D]
    add  a, b
    ld   [bc], a
    nop
    ret  nc
    ccf
    add  a, b
    ld   [bc], a
    nop
    or   b
    dec  a
    add  a, b
    ld   [bc], a
    nop
    sub  a, b
    ccf
    add  a, b
    ld   [bc], a
    nop
    ld   [hl], b
    dec  a
    add  a, b
    inc  bc
    nop
    ld   d, b
    ccf
    add  a, b
    inc  bc
    nop
    ld   b, b
    dec  a
    add  a, b
    inc  b
    nop
    jr   nc, label_7F74F
    add  a, b
    inc  b
    nop
    jr   nz, label_7F752
    add  a, b

label_7F716::
    inc  b
    cpl
    db   $10 ; Undefined instruction
    ret  nz
    inc  b
    xor  a
    ld   [$D361], a
    ld   hl, $D31F
    set  7, [hl]
    ld   a, $01
    ld   [$D3C6], a
    ld   hl, label_7F75E
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $03
    jr   z, label_7F74C
    ld   hl, label_7F75A
    call label_7FA64
    ld   a, [$D398]
    cp   $01
    jp   z, label_7FA79
    jp   label_7FA8B

label_7F74C::
    xor  a
    ld   [rNR10], a

label_7F74F::
    ld   [$D3C6], a

label_7F752::
    ld   hl, $D31F
    res  7, [hl]
    jp   label_7FA07

label_7F75A::
    ld   h, e
    ld   [hl], a
    ld   l, c
    ld   [hl], a

label_7F75E::
    nop

label_7F75F::
    jr   nz, label_7F7D1
    add  a, b
    ld   bc, label_7D11D
    add  a, d
    ld   e, c
    rst  0
    inc  bc
    nop
    ld   b, d
    ld   d, b
    add  a, b
    ld   [$EAAF], sp
    ld   h, c
    db   $D3 ; Undefined instruction
    ld   hl, $D31F
    set  7, [hl]
    ld   a, $01
    ld   [$D3C6], a
    ld   hl, label_7F7D6
    call label_7F9E4
    ld   a, $F0
    ld   [$D3BF], a
    ld   hl, label_7F7E0
    call label_7FAB7
    jp   label_7FA79
    ld   hl, $D3E6
    ld   a, [hl]
    and  a
    jr   z, label_7F7C0
    xor  a
    ld   [hl], a
    call label_7FAAC
    jr   z, label_7F7C0
    cp   $E0
    jr   z, label_7F7B3
    cp   $D8
    jr   nc, label_7F7AF
    ld   a, $02

label_7F7A8::
    ld   [bc], a
    ld   hl, label_7F7D2
    jp   label_7FAE1

label_7F7AF::
    ld   a, $01
    jr   label_7F7A8

label_7F7B3::
    ld   hl, label_7F7DB
    call label_7FA8B
    ld   a, $01
    ld   bc, $D398
    jr   label_7F7A8

label_7F7C0::
    xor  a
    ld   [$D3C6], a
    ld   hl, $D31F
    res  7, [hl]
    ld   hl, label_7D3D9
    call label_7FA79
    jp   label_7FA01

label_7F7D2::
    nop
    ld   [bc], a
    nop
    nop

label_7F7D6::
    nop
    dec  e
    jr   nz, label_7F75A
    ld   bc, label_7E000
    jr   nz, label_7F75F
    ld   bc, label_7C000
    db   $10 ; Undefined instruction
    add  a, a
    ld   bc, $A321
    ld   a, b
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $51
    jp   z, label_7FA01
    ld   hl, label_7F801
    call label_7FA64
    jp   label_7FA25

label_7F801::
    xor  b
    ld   a, b
    xor  e
    ld   a, b
    xor  [hl]
    ld   a, b
    or   c
    ld   a, b
    or   h
    ld   a, b
    or   a
    ld   a, b
    or   h
    ld   a, b
    or   c
    ld   a, b
    xor  [hl]
    ld   a, b
    or   c
    ld   a, b
    or   h
    ld   a, b
    or   a
    ld   a, b
    cp   d
    ld   a, b
    cp   l
    ld   a, b
    ret  nz
    ld   a, b
    cp   l
    ld   a, b
    cp   d
    ld   a, b
    or   a
    ld   a, b

label_7F825::
    cp   d
    ld   a, b
    cp   l
    ld   a, b
    ret  nz
    ld   a, b
    jp   label_C678
    ld   a, b
    ret
    ld   a, b
    add  a, $78
    jp   label_C078
    ld   a, b
    jp   label_C678
    ld   a, b
    ret
    ld   a, b
    call z, label_CF78
    ld   a, b
    jp   nc, label_CF78
    ld   a, b
    call z, label_C978
    ld   a, b
    call z, label_CF78
    ld   a, b
    jp   nc, label_D578
    ld   a, b
    ret  c
    ld   a, b
    db   $DB
    ld   a, b
    ret  c
    ld   a, b
    push de
    ld   a, b
    jp   nc, label_D578
    ld   a, b
    ret  c
    ld   a, b
    db   $DB
    ld   a, b
    sbc  a, $78
    pop  hl
    ld   a, b
    db   $E4 ; Undefined instruction
    ld   a, b
    pop  hl
    ld   a, b
    sbc  a, $78
    db   $DB
    ld   a, b
    sbc  a, $78

label_7F86F::
    pop  hl
    ld   a, b
    db   $E4 ; Undefined instruction
    ld   a, b
    rst  $20
    ld   a, b
    ld   [$ED78], a
    ld   a, b
    ld   [$E778], a
    ld   a, b
    db   $E4 ; Undefined instruction
    ld   a, b
    rst  $20
    ld   a, b
    ld   [$ED78], a
    ld   a, b
    ld   a, [$FF78]
    di
    ld   a, b
    or   $78
    di
    ld   a, b
    ld   a, [$FF78]
    db   $ED ; Undefined instruction
    ld   a, b
    ld   a, [$FF78]
    di
    ld   a, b
    or   $78
    ld   sp, hl
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    rst  $38
    ld   a, b
    ld   [bc], a
    ld   a, c
    rst  $38
    ld   a, b
    ld   [bc], a
    ld   a, c
    jr   c, label_7F825
    inc  h
    add  a, b
    ld   [bc], a
    dec  h
    add  a, b
    ld   [bc], a
    ld   h, $80
    ld   [bc], a
    daa
    add  a, b
    ld   [bc], a
    inc  [hl]
    add  a, b
    ld   [bc], a
    dec  [hl]
    add  a, b
    ld   [bc], a
    ld   [hl], $80
    ld   [bc], a
    scf
    add  a, b
    ld   [bc], a
    ld   b, h
    add  a, b
    ld   [bc], a
    ld   b, l
    add  a, b
    ld   [bc], a
    ld   b, [hl]
    add  a, b
    ld   [bc], a
    ld   b, a
    add  a, b
    ld   [bc], a
    inc  a
    add  a, b
    inc  bc
    dec  a
    add  a, b
    inc  bc
    ld   a, $80
    inc  bc
    ccf
    add  a, b
    inc  bc
    ld   c, h
    add  a, b
    inc  bc
    ld   c, l
    add  a, b
    inc  bc
    ld   c, [hl]
    add  a, b
    inc  bc
    ld   c, a
    add  a, b
    inc  bc
    ld   e, h
    add  a, b
    inc  bc
    ld   e, l
    add  a, b
    inc  bc
    ld   e, [hl]
    add  a, b
    inc  bc
    ld   e, a
    add  a, b
    inc  bc
    ld   l, h
    add  a, b
    inc  bc
    ld   l, l
    ret  nz
    inc  bc
    ld   l, [hl]
    ret  nz
    inc  bc
    ld   l, a
    ret  nz
    inc  bc
    ld   a, h
    ret  nz
    inc  bc
    ld   a, l
    ret  nz
    inc  bc
    ld   a, [hl]
    ret  nz
    inc  bc
    ld   a, a
    ret  nz
    inc  bc
    ld   hl, label_7F933
    jp   label_7F9E4
    ld   a, [$D3E8]
    and  a
    ret  nz
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $08
    jp   z, label_7FA07
    ld   hl, label_7F925
    call label_7FA64
    jp   label_7FA8B

label_7F925::
    jr   c, label_7F9A0
    dec  a
    ld   a, c
    ld   b, d
    ld   a, c
    ld   b, a
    ld   a, c
    ld   c, h
    ld   a, c
    ld   d, c
    ld   a, c
    ld   d, [hl]
    ld   a, c

label_7F933::
    nop
    rra
    ld   a, a
    add  a, b
    ld   bc, $E000
    ld   b, h
    add  a, b
    ld   b, $00
    ret  nz
    ld   b, l
    add  a, b
    ld   b, $00
    and  b
    ld   b, [hl]
    add  a, b
    ld   b, $00
    add  a, b
    ld   b, a
    add  a, b
    ld   b, $00
    ld   h, b
    ld   d, h
    add  a, b
    ld   b, $00
    ld   b, b
    ld   d, l
    add  a, b
    ld   b, $38
    jr   nz, label_7F9AF
    ret  nz
    ld   b, $21
    sub  a, h
    ld   a, c
    jp   label_7F9E4
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $10
    jp   z, label_7FA07
    ld   hl, label_7F976
    call label_7FA64
    jp   label_7FA8B

label_7F976::
    sbc  a, c
    ld   a, c
    sbc  a, [hl]
    ld   a, c
    and  e
    ld   a, c
    xor  b
    ld   a, c
    xor  l
    ld   a, c
    or   d
    ld   a, c
    or   a
    ld   a, c
    cp   h
    ld   a, c
    pop  bc
    ld   a, c
    add  a, $79
    bit  7, c
    ret  nc
    ld   a, c
    push de
    ld   a, c
    jp  c, label_DF79
    ld   a, c
    nop
    jr   nz, label_7F9BE
    add  a, b
    ld   [bc], a
    nop
    ld   b, b
    dec  h
    add  a, b
    ld   [bc], a
    nop
    ld   h, b

label_7F9A0::
    rla
    add  a, b
    ld   [bc], a
    nop
    add  a, b
    dec  d
    add  a, b
    ld   [bc], a
    nop
    and  b
    rla
    add  a, b
    ld   [bc], a
    nop
    ret  nz

label_7F9AF::
    dec  h
    add  a, b
    inc  b
    nop
    or   b
    daa
    add  a, b
    inc  b
    nop
    and  b
    dec  h
    add  a, b
    inc  b
    nop
    sub  a, b

label_7F9BE::
    rla
    add  a, b
    inc  b
    nop
    add  a, b
    dec  d
    ret  nz
    inc  b
    nop
    ld   [hl], b
    rla
    add  a, b
    inc  b
    nop
    ld   h, b

label_7F9CD::
    dec  h
    add  a, b
    inc  b
    nop
    ld   d, b
    daa
    add  a, b
    inc  b
    nop
    ld   b, b
    dec  h
    add  a, b
    inc  b
    nop
    jr   nc, label_7F9F4
    add  a, b
    inc  b
    cpl
    jr   nz, label_7F9F7
    ret  nz
    inc  b

label_7F9E4::
    ld   a, $01
    ld   [$D3C9], a

label_7F9E9::
    ld   a, [$D378]
    ld   [$D379], a
    xor  a
    ld   [$D393], a
    ld   [$D398], a
    ld   a, [$D34F]
    set  7, a
    ld   [$D34F], a
    jp   label_7FA8B

label_7FA01::
    ld   hl, label_7FA20
    call label_7FA8B

label_7FA07::
    xor  a
    ld   [$D379], a
    ld   [$D393], a
    ld   [$D398], a
    ld   [$D3BF], a
    ld   [$D3C9], a
    ld   a, [$D34F]
    res  7, a
    ld   [$D34F], a
    ret

label_7FA20::
    nop
    nop
    nop
    nop
    ld   bc, label_206
    ld   c, $22
    jp   label_7FA91

label_7FA2C::
    xor  a
    ld   [$D378], a
    jp   label_7E4EC

label_7FA33::
    ld   a, [$D378]
    ld   [$D379], a
    ld   hl, $D32F
    set  7, [hl]
    ld   a, $01
    ld   [$D3C9], a
    xor  a
    ld   [$D393], a
    ld   [$D398], a
    ld   hl, label_7FA20
    call label_7FA8B
    ret

label_7FA51::
    xor  a
    ld   [$D393], a
    ld   [$D398], a
    ld   [$D379], a
    ld   [$D3C9], a
    ld   hl, $D32F
    res  7, [hl]
    ret

label_7FA64::
    dec  a
    sla  a
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   c, [hl]
    inc  hl
    ld   b, [hl]
    ld   h, b
    ld   l, c
    ret

label_7FA71::
    ld   a, [de]
    dec  a
    ld   [de], a
    ret

label_7FA75::
    ld   a, [bc]
    inc  a
    ld   [bc], a
    ret

label_7FA79::
    ld   b, $05
    ld   c, $10
    jr   label_7FA91

label_7FA7F::
    ld   b, $04
    ld   c, $16
    jr   label_7FA91

label_7FA85::
    ld   b, $05
    ld   c, $1A
    jr   label_7FA91

label_7FA8B::
    ld   b, $04
    ld   c, $20
    jr   label_7FA91

label_7FA91::
    ld   a, [hli]
    ldh  [$FF0C], a
    inc  c
    dec  b
    jr   nz, label_7FA91
    ld   a, [hl]
    ld   [de], a
    ret

label_7FA9A::
    push de
    ld   de, $D3BC
    jr   label_7FAB2
    push de
    ld   de, $D3BD
    jr   label_7FAB2

label_7FAA6::
    push de
    ld   de, $D3BE
    jr   label_7FAB2

label_7FAAC::
    push de
    ld   de, $D3BF
    jr   label_7FAB2

label_7FAB2::
    call label_7FA71
    pop  de
    ret

label_7FAB7::
    push de
    ld   de, $D3C0
    jr   label_7FAC1

label_7FABD::
    push de
    ld   de, $D3C4

label_7FAC1::
    inc  hl
    inc  hl
    inc  hl
    ld   a, [hli]
    ld   [de], a
    inc  e
    db   $3A ; ldd  a, [hl]
    and  $0F
    ld   [de], a
    dec  hl
    dec  hl
    dec  hl
    pop  de
    ret

label_7FAD0::
    push de
    ld   de, $D3C2
    inc  hl
    inc  hl
    ld   a, [hli]
    ld   [de], a
    inc  e
    db   $3A ; ldd  a, [hl]
    and  $0F
    ld   [de], a
    dec  hl
    dec  hl
    pop  de
    ret

label_7FAE1::
    push de
    ld   de, $D3C1
    ld   a, [bc]
    ld   c, $13
    push bc
    jr   label_7FAF5

label_7FAEB::
    push de
    ld   de, $D3C5
    ld   a, [bc]
    ld   c, $1D
    push bc
    jr   label_7FAF5

label_7FAF5::
    dec  a
    sla  a
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   a, [hli]
    ld   b, a
    ld   a, [hl]
    ld   c, a
    ld   a, [de]
    dec  e
    ld   h, a
    ld   a, [de]
    ld   l, a
    add  hl, bc
    pop  bc
    ld   a, l
    ldh  [$FF0C], a
    ld   [de], a
    inc  c
    inc  e
    ld   a, h
    ldh  [$FF0C], a
    ld   [de], a
    pop  de
    ret

label_7FB11::
    push de
    ld   de, $D3C3
    ld   a, [bc]
    ld   c, $18
    push bc
    jr   label_7FAF5
    ld   hl, label_7FB3E
    jp   label_7F9E9
    call label_7FA71
    ret  nz
    call label_7FA75
    cp   $05
    jp   z, label_7FA01
    ld   hl, label_7FB36
    call label_7FA64
    jp   label_7FA8B

label_7FB36::
    ld   c, b
    ld   a, e
    ld   c, l
    ld   a, e
    ld   d, d
    ld   a, e
    ld   d, a
    ld   a, e

label_7FB3E::
    nop
    ld    hl, sp+$1D
    add  a, b
    ld   bc, $F800
    dec  e
    add  a, b
    ld   bc, $F800
    ld   bc, label_180
    nop
    ld   e, c
    ld   de, label_380
    ld   bc, label_17C8
    add  a, b
    ld   bc, $F500
    ld   de, label_180

label_7FB5C::
    ld   a, $FF
    ld   [rNR51], a

label_7FB60::
    ld   a, $03
    ld   [$D355], a
    xor  a
    ld   [$D369], a
    xor  a
    ld   [$D361], a
    ld   [$D371], a
    ld   [$D379], a
    ld   [$D31F], a
    ld   [$D32F], a
    ld   [$D33F], a
    ld   [$D34F], a
    ld   [$D39E], a
    ld   [$D39F], a
    ld   [$D3D9], a
    ld   [$D3DA], a
    ld   [$D3B6], a
    ld   [$D3B7], a
    ld   [$D3B8], a
    ld   [$D3B9], a
    ld   [$D3BA], a
    ld   [$D3BB], a
    ld   [$D394], a
    ld   [$D395], a
    ld   [$D396], a
    ld   [$D398], a
    ld   [$D390], a
    ld   [$D391], a
    ld   [$D392], a
    ld   [$D393], a
    ld   [$D3C6], a
    ld   [$D3C7], a
    ld   [$D3C8], a
    ld   [$D3C9], a
    ld   [$D3A0], a
    ld   [$D3A1], a
    ld   [$D3A2], a
    ld   [$D3A3], a
    ld   [$D3CD], a
    ld   [$D3D6], a
    ld   [$D3D7], a
    ld   [$D3D8], a
    ld   [$D3DC], a
    ld   [$D3E7], a
    ld   [$D3E2], a
    ld   [$D3E3], a
    ld   [$D3E4], a
    ld   [$D3E5], a
    ld   a, $08
    ld   [rNR12], a
    ld   [rNR22], a
    ld   [rNR42], a
    ld   a, $80
    ld   [rNR14], a
    ld   [rNR24], a
    ld   [rNR44], a
    xor  a
    ld   [rNR10], a
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FFA8]
    and  a
    jr   z, label_7FF9E
    sub  a, $01
    ld   [$FFA8], a
    and  $03
    jr   nz, label_7FF9E
    ld   a, [$FFA9]
    and  a
    jr   z, label_7FF95
    dec  a
    ld   [$FFA9], a

label_7FF95::
    ld   a, [$FFAA]
    and  a
    jr   z, label_7FF9E
    sub  a, $10
    ld   [$FFAA], a

label_7FF9E::
    ld   a, [$FFAB]
    and  a
    jr   z, label_7FFBE
    sub  a, $01
    ld   [$FFAB], a
    and  $01
    jr   nz, label_7FFBE
    ld   a, [$FFA9]
    cp   $07
    jr   nc, label_7FFB4
    inc  a
    ld   [$FFA9], a

label_7FFB4::
    ld   a, [$FFAA]
    cp   $70
    jr   nc, label_7FFBE
    add  a, $10
    ld   [$FFAA], a

label_7FFBE::
    ld   hl, $FFA9
    ld   a, [$FF24]
    and  $F8
    or   [hl]
    inc  hl
    and  $8F
    or   [hl]
    ld   [rNR50], a
    ld   a, [$FFF2]
    and  a
    jr   z, label_7FFD7
    ld   [$D360], a
    xor  a
    ld   [$FFF2], a

label_7FFD7::
    ld   a, [$FFF3]
    and  a
    jr   z, label_7FFE2
    ld   [$D370], a
    xor  a
    ld   [$FFF3], a

label_7FFE2::
    ld   a, [$FFF4]
    and  a
    jr   z, label_7FFED
    ld   [$D378], a
    xor  a
    ld   [$FFF4], a

label_7FFED::
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
