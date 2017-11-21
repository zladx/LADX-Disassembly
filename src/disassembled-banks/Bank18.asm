section "bank18",romx,bank[$12]
    inc  bc
    nop
    ccf
    ld   bc, label_133F
    ld   a, a
    rra
    rst  $38
    ld   sp, label_4A0FF
    rst  $38
    inc  h
    ld   a, a
    ld   h, $7F
    ld   h, $FF
    ldi  [hl], a
    rst  $38
    ld   [hl], b
    rst  $38
    jr   c, label_48098
    rra
    ccf
    inc  de
    ccf
    ld   bc, $0003
    cp   l
    nop
    rst  $38
    jr   label_48024
    rst  $38

label_48026::
    rst  $38
    di
    rst  $38
    di
    rst  $38
    di
    rst  $38
    ld   h, e
    rst  $38
    ld   h, c
    rst  $38
    ld   h, h
    rst  $38
    ld   b, h
    rst  $38
    ld   c, h
    rst  $38
    call z, label_FFFF
    rst  $38

label_4803B::
    rst  $38
    rst  $38
    jr   label_3FFC
    nop
    ret  nz
    nop
    db   $FC ; Undefined instruction
    add  a, b

label_48044::
    cp   $C8
    cp   $FC
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    and  $FF
    call nz, label_CCFE

label_48050::
    cp   $CC
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    sbc  a, [hl]
    rst  $38
    sbc  a, h
    cp   $F8
    db   $FC ; Undefined instruction
    ret  z
    db   $FC ; Undefined instruction
    add  a, b
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  c
    inc  bc
    inc  de
    inc  c
    daa
    jr   label_480A0
    db   $10
    db   $5F
    jr   nz, label_480D4
    jr   nz, label_480D6
    jr   nz, label_48044
    inc  [hl]
    rst  $38
    nop
    xor  a
    ld   e, b
    or   a
    ld   c, a
    rlca
    nop
    jr   label_4808B
    ld   h, a
    jr   label_48026
    ld   h, b
    rst  $38
    nop
    ccf

label_4808B::
    ret  nz
    rst  $28
    db   $10
    db   $D7
    jr   c, label_48050
    ld   a, b
    ld   a, e
    db   $FC ; Undefined instruction
    ei
    db   $FC ; Undefined instruction
    ei
    ld   a, h

label_48098::
    ei
    ld   a, h
    rst  $38
    ld   a, b
    rst  $30
    ld    hl, sp+$EF
    ld   a, [$FFFC]
    inc  bc
    ccf
    nop
    rra
    nop
    ld   l, $1F
    ld   e, a
    ccf
    ld   e, a
    ccf
    ld   b, e
    ccf
    dec  sp
    rlca
    ld   de, label_90F
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    call z, label_1EF9
    scf
    sbc  a, $EF
    sbc  a, $F9
    sbc  a, $E7
    sbc  a, $7F
    db   $ED ; Undefined instruction
    adc  a, a
    ld   [hl], e
    rst  $30
    adc  a, a
    rst  $38
    rst  $38

label_480D4::
    ld   a, a
    rst  $38

label_480D6::
    ld   e, $FF
    add  a, b
    ld   a, a
    ld   [hl], b
    rrca
    ld   c, $01
    ld   bc, $F200
    dec  c
    rst  $38
    nop
    reti
    ld   h, $F1
    ld   c, $FB
    inc  b
    adc  a, $31
    call z, label_EC33
    inc  de
    rst  $38
    nop
    ld   a, [$FF0F]
    db   $E8 ; add  sp, d
    rra
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    sub  a, d
    rst  $38
    sbc  a, [hl]
    rst  $38
    ld    hl, sp+$FF
    nop
    nop
    nop

label_48103::
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  c
    inc  bc
    inc  de
    inc  c
    daa
    jr   label_48140
    db   $10
    db   $5F
    jr   nz, label_48164
    jr   nc, label_48192
    inc  b
    rst  8
    jr   nc, label_4811A
    db   $10
    db   $AF
    ld   e, b
    or   a
    ld   c, a
    rlca
    nop
    jr   label_4812B
    ld   h, a
    jr   label_480C6
    ld   h, b
    rst  $38
    nop
    ccf

label_4812B::
    ret  nz
    rst  8
    jr   nc, label_48126
    ld   [$00FF], sp
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, a
    ld   h, b
    rst  $30
    ld   a, b
    rst  $30
    ld    hl, sp+$EF
    ld   a, [$FFFC]
    inc  bc
    ld   a, a
    nop
    or   a
    ld   a, b
    cp   a
    ld   a, a
    ld   b, a
    ccf
    scf
    rrca
    inc  hl
    rra

label_4814E::
    inc  de
    rrca
    ld   de, label_90F
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    jp   label_7FE

label_48164::
    db   $FD ; Undefined instruction
    rrca
    ld   [hl], e
    rst  $28
    cp   $EF
    pop  af
    rst  $28
    ld   l, a
    or   $8F
    ld   [hl], c
    rst  $30
    adc  a, a
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ld   e, $FF
    add  a, b
    ld   a, a
    ld   [hl], b
    rrca
    ld   c, $01
    ld   bc, label_700
    nop
    dec  bc

label_48183::
    inc  b
    rla
    ld   [label_102F], sp
    ld   l, $10
    ld   e, [hl]
    jr   nz, label_481EB
    jr   nz, label_4814E
    ld   b, b
    sbc  a, a
    ld   h, b

label_48192::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    nop
    or   $09
    ld   a, [$FF00+C]
    rst  $38
    nop
    reti
    ld   h, $F1
    ld   c, $FB
    inc  b
    adc  a, $31
    call z, label_EC33
    inc  de
    rst  $38
    add  a, b
    jr   nc, label_48183
    db   $E8 ; add  sp, d
    rst  $18
    inc  a
    rst  $18
    ld   a, [$FFDF]
    jp   nc, label_9EBF
    ld   a, a
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ret  z
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    rrca
    ld   a, [$FF70]
    adc  a, a
    add  a, c
    ld   a, a

label_481CE::
    add  a, a
    ld   a, b
    ld   h, d
    inc  a
    ld   d, d
    inc  a
    ld   sp, label_291E
    ld   e, $19
    ld   c, $15
    ld   c, $09
    ld   b, $06
    nop
    ret  nz
    nop
    cp   b
    ret  nz
    ld   b, h
    ld    hl, sp+$BE
    ld   a, h
    or   d
    ld   a, h
    call label_49F3E
    cp   [hl]
    ld   e, a
    cp   [hl]
    ld   e, l
    cp   [hl]
    ld   b, d
    cp   h
    db   $3E
    ld   a, $DD
    ld   a, $DD
    ld   a, $42
    cp   h
    ld   e, l
    cp   [hl]
    db   $3E
    ld   a, $60
    nop
    or   b
    ld   b, b
    or   b
    ld   b, b
    or   b
    ld   b, b
    cp   b
    ld   b, b
    cp   h
    ld   b, b
    cp   h
    ld   b, b
    cp   [hl]
    ld   b, b
    sbc  a, a
    ld   h, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    nop
    or   $09
    ld    hl, sp+$FF
    ret  z
    rst  $38
    ret  nz
    rst  $38

label_48226::
    nop
    rst  $38
    rrca
    ld   a, [$FF70]
    adc  a, a
    add  a, c
    ld   a, a
    add  a, a
    ld   a, b
    jp   nz, label_C27C
    ld   a, h
    call nz, label_C478
    ld   a, b
    ret  z
    ld   [hl], b
    adc  a, b
    ld   [hl], b

label_4823C::
    sub  a, b
    ld   h, b
    ld   h, b
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    rla
    rrca
    cpl
    rra
    ccf
    rra
    ld   e, a
    ccf
    ld   e, a
    ccf
    ld   e, a
    ccf
    ld   e, a
    ccf
    ccf
    rra
    cpl
    rra
    rla
    rrca
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    jr   nc, label_48226
    db   $E8 ; add  sp, d
    ld   a, [$FFF4]
    ld    hl, sp+$FC
    ld    hl, sp+$FA
    db   $FC ; Undefined instruction
    ld   a, [$FAFC]
    adc  a, h
    ld   a, [$EC04]
    db   $10
    db   $FC
    nop
    ld    hl, sp+$80
    jr   nc, label_4823C
    ret  nz
    nop

label_4827E::
    nop
    nop
    rrca
    nop
    ccf
    ld   c, $5F
    ld   a, [hli]
    ld   a, a
    ld   l, $8E
    ld   [hl], c
    add  a, b
    ld   a, a
    sub  a, l
    ld   l, [hl]
    ld   l, a
    dec  e
    rra
    inc  bc
    rra
    dec  bc
    rra
    dec  c
    rrca
    ld   b, $07
    nop
    ld   bc, $0000

label_4829D::
    nop
    nop
    nop
    call z, label_3E00
    call z, label_F62F
    ld   d, a
    cp   d
    ld   c, a
    cp   d
    ld   c, e
    cp   h
    add  a, d
    ld   a, h
    add  a, d
    db   $FC ; Undefined instruction
    jp   nz, label_C2FC
    cp   h
    jp   nz, label_C4BC
    jr   c, label_4829D
    ret  c
    cp   b
    ld   [$FFF0], a
    ld   h, b
    ld   [hl], b
    nop
    rra
    nop
    ccf
    rla
    ccf
    dec  b
    ld   e, a
    scf
    ld   h, a
    jr   c, label_4830B
    ccf
    ld   c, d
    scf
    scf
    ld   c, $1F
    nop
    dec  b
    ld   [bc], a
    rlca
    ld   [bc], a
    inc  bc
    nop
    ld   bc, $0100
    nop
    nop
    nop
    nop
    nop
    ret  c

label_482E1::
    nop
    cp   h
    ld   e, b
    cp   [hl]
    ld   l, h
    cp   [hl]
    ld   d, h
    ld   l, $D4
    ld   h, $D8
    jp   nz, label_E23C
    call c, label_FC82
    jp   nc, label_F4EC
    ld   l, b
    db   $E4 ; Undefined instruction
    jr   label_482E1
    ret  nc
    or   b
    ld   [$FFF0], a
    ld   h, b
    ld   [hl], b
    nop
    ld   b, $00
    rrca
    ld   b, $0F
    dec  b
    rrca
    ld   b, $16
    add  hl, bc
    ld   de, label_100F
    rrca
    dec  bc
    inc  b
    inc  c
    inc  bc
    rrca
    inc  b
    dec  c
    ld   b, $0B
    inc  b
    rlca
    ld   bc, $0103
    ld   [bc], a
    ld   bc, $0001
    ld   bc, label_3700
    ld   bc, label_377F
    rst  8
    ld   [hl], a
    rst  8
    ld   a, [hl]
    cp   $6F
    ld   a, h
    rra
    ccf
    dec  e
    ccf
    dec  e
    dec  a

label_48333::
    ld   e, $2C
    rra
    ld   e, $0F
    ccf
    rla
    dec  a
    dec  de
    rra
    inc  c
    inc  c
    nop
    ld   a, [$FF00]
    ret  z
    or   b
    ret  z
    or   b
    ret  z
    ld   a, [$FFC8]
    jr   nc, label_48333
    ret  nc
    ld   [hl], b
    ld   [rSVBK], a
    ld   [$FFE0], a
    ret  nz
    call z, label_49E00
    adc  a, h
    ld   a, a
    sbc  a, [hl]
    ccf
    sbc  a, $FF
    sbc  a, $FE
    inc  c
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
    inc  bc
    nop
    rrca
    inc  bc
    rra
    ld   a, [bc]
    rra
    dec  bc
    inc  sp
    inc  e
    jr   nz, label_48393
    inc  h
    dec  de
    add  hl, de
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, $00
    ccf
    ld   e, $FF
    nop
    ret  nz
    cp   a
    call z, label_DEB3
    xor  l
    sbc  a, [hl]
    ld   l, l
    ld   a, a

label_48393::
    db   $DB
    rst  $38
    rst  $10
    db   $FD ; Undefined instruction
    cp   [hl]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, $00
    sbc  a, $0C
    ld   a, $DC
    ld   a, $DC
    cp   $DC
    cp   [hl]
    call z, label_804E
    ld   [$FFC0], a
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
    inc  bc
    nop
    rrca
    inc  bc
    rra
    ld   a, [bc]
    scf
    dec  de
    inc  hl
    inc  e
    jr   nz, label_483F3
    inc  a
    inc  bc
    dec  b
    inc  bc
    dec  b
    ld   [bc], a
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  c
    nop
    call c, label_3C08
    ret  c
    inc  a
    ret  c
    db   $FC ; Undefined instruction
    ret  c
    cp   h

label_483F3::
    ret  z
    ld   c, h
    add  a, b
    ld   [$FFC0], a
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop

label_483FF::
    nop
    inc  e
    nop
    ld   a, $1C
    scf
    ld   c, $0B
    ld   b, $0B
    inc  b
    rrca
    rlca
    rra
    dec  bc
    rra
    dec  bc
    cpl
    add  hl, de
    cpl
    rra
    rla
    rrca
    ccf
    db   $10
    db   $3F
    rla
    dec  de
    rlca
    dec  e
    ld   c, $1F
    nop
    ld   h, b
    nop
    ld   a, [$FF60]
    sub  a, b
    ld   [$FFA0], a
    ret  nz
    and  b
    ret  nz
    ld   [$FFC0], a
    ld   a, [$FF60]
    ld    hl, sp+$60
    db   $E8 ; add  sp, d
    ld   a, [$FFC8]
    ld   a, [$FFF0]
    add  a, b
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF80]
    ld   a, b
    ld   a, [$FFF8]
    nop
    ld   b, $00
    rrca
    ld   b, $0F
    rlca
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rrca
    rlca
    rra
    rrca
    rra
    rrca
    rla
    rrca
    dec  bc
    inc  b
    rra
    dec  bc
    rla
    dec  bc
    rrca
    inc  b
    ld   e, $0F
    rra
    nop
    jr   c, label_48462

label_48462::
    ld   a, h
    jr   c, label_48461
    ld   [hl], b
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FFE0]
    ld    hl, sp+$F0
    ld    hl, sp+$F0
    db   $F4 ; Undefined instruction
    ld    hl, sp+$F4
    ld    hl, sp+$E8
    ld   [hl], b
    db   $FC ; Undefined instruction
    cp   b
    db   $F4 ; Undefined instruction
    cp   b
    ld    hl, sp+$60
    ld    hl, sp+$70
    ld    hl, sp+$00
    ld   [hl], a
    nop
    ld   a, a
    ld   [hl], $2D
    dec  de
    dec  d
    dec  bc
    dec  c
    inc  bc
    rra
    rrca
    rra
    dec  bc
    ccf
    dec  de
    ld   a, a
    rrca
    ld   a, a
    ccf
    ld   e, l
    ld   a, $3F
    ld   bc, $0107
    rlca
    nop
    rlca
    inc  bc
    rrca
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ret  nc
    ld   [$FFD0], a
    ld   [$FFA0], a
    ret  nz
    ld   a, b
    ld   [$FFDC], a
    db   $E8 ; add  sp, d
    cp   h
    ret  z
    ret  c
    jr   nz, label_484AD
    ld   [$FFF0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    ld   a, $14
    ld   a, $00
    inc  h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_484E4::
    nop
    nop
    nop
    nop
    jp   label_E700
    ld   b, d
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]

label_484F0::
    ld   a, [hl]
    inc  h
    inc  a
    nop
    nop
    nop
    nop
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
    nop
    jr   label_4850B
    ld   h, $19
    daa
    ld   a, [de]
    ld   c, a
    inc  sp
    ld   e, a

label_4850B::
    dec  hl
    ccf
    rrca
    rra
    dec  c
    rla
    dec  c
    dec  hl
    rla
    cpl
    db   $10
    db   $3F
    dec  c
    rra
    dec  c
    dec  e
    ld   [bc], a
    rla
    rrca
    rra
    nop
    ret  nz
    nop
    jr   nz, label_484E4
    inc  e
    ld   [$FF82], a
    ld   a, h
    jp   nc, label_FA2C
    ld   d, h
    db   $FC ; Undefined instruction
    ret  nc
    ld   [$B2F4], a
    call z, label_9E61
    pop  de
    ld   l, $D1
    xor  [hl]
    jp   nc, label_8CAC
    ld   [hl], b
    adc  a, b
    ld   a, [$FFF8]
    nop
    rlca
    nop
    ld   [label_3107], sp
    ld   c, $43
    dec  a
    ld   d, a
    add  hl, hl
    ld   a, a
    dec  d
    ccf
    rla
    ld   e, a
    cpl
    adc  a, e
    ld   [hl], a
    add  a, l
    ld   a, e
    add  a, a
    ld   a, b
    ld   c, a
    ld   [hl], $3F
    ld   b, $16
    add  hl, bc
    inc  de
    rrca
    rra
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    ld   [hl], a
    nop
    ld   a, a
    ld   [hl], $2D
    dec  de
    dec  d
    dec  bc
    dec  c
    inc  bc
    rra
    rrca
    rra
    dec  bc
    ccf
    dec  de
    ld   a, a
    rrca
    ld   a, a
    ccf
    ld   e, l
    ld   a, $3F
    ld   bc, $0107
    rlca
    nop
    rlca
    inc  bc
    rrca
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ret  nc
    ld   [$FFD0], a
    ld   [$FFA0], a
    ret  nz
    ld   a, b
    ld   [$FFDC], a
    db   $E8 ; add  sp, d
    cp   h
    ret  z
    ret  c
    jr   nz, label_485AD
    ld   [$FFF0], a
    nop
    inc  a
    nop
    ld   a, $1C
    rla
    ld   c, $0B
    ld   b, $0F
    ld   [bc], a
    rra
    rrca
    rra
    rlca
    ccf
    rla
    ld   a, a
    rra
    ld   a, a
    ccf
    ld   e, d
    dec  a
    ccf
    inc  bc
    rlca
    inc  bc
    rrca
    nop
    add  hl, de
    ld   c, $1F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    and  b
    ret  nz
    and  b
    ret  nz
    ret  nz
    add  a, b
    db   $EC ; Undefined instruction
    ret  nz
    sbc  a, [hl]
    db   $EC ; Undefined instruction
    ld   a, [hl]
    or   h
    xor  h
    ld   [hl], b
    ret  c
    ld   [$FFF0], a
    nop
    dec  b
    nop
    rlca
    nop
    dec  c
    ld   [bc], a
    dec  bc
    inc  b
    rrca
    nop
    rra
    inc  c
    ccf
    dec  c
    ld   a, c
    ld   a, $C7
    ld   a, b
    jp   hl
    ld   d, [hl]
    adc  a, e
    ld   [hl], l
    ld   e, a
    ld   hl, $0031
    inc  bc
    ld   bc, label_207
    rlca
    nop
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF80]
    db   $E8 ; add  sp, d
    sub  a, b
    ld   d, h
    cp   b
    call z, label_CA38
    inc  a
    add  a, $BC
    rst  $20
    call c, label_CCF3
    ld   e, [hl]
    and  b
    call z, label_A870
    ret  nc
    ld    hl, sp+$00
    jr   nc, label_48642

label_48642::
    dec  a
    db   $10
    db   $3F
    jr   label_48674
    ld   a, [de]
    dec  de
    inc  b
    rra
    nop
    rra
    inc  c
    ccf
    dec  c
    ld   a, c
    ld   a, $C7
    ld   a, b
    jp   hl
    ld   d, [hl]
    adc  a, e
    ld   [hl], l
    ld   e, l
    inc  hl
    inc  sp
    nop
    rlca
    ld   [bc], a
    rlca
    nop
    inc  bc
    nop
    push hl
    ld   [bc], a
    jp   hl
    ld   b, $D5
    ld   c, $EF
    ld   e, $FD

label_4866B::
    sbc  a, [hl]
    jp  c, label_49ABC
    cp   h
    db   $E4 ; Undefined instruction
    jr   label_4866B
    nop

label_48674::
    cp   $80
    rst  $38
    ret  nz
    sbc  a, $A0
    call z, label_A870
    ret  nc
    ld    hl, sp+$00
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    ld   bc, label_300
    ld   bc, $00F9
    or   h
    ld   a, b
    ld   h, e
    inc  e
    jr   c, label_48713
    ld   [hl], $19

label_4870E::
    db   $3A ; ldd  a, [hl]
    dec  e
    db   $3A ; ldd  a, [hl]
    dec  e
    inc  e

label_48713::
    dec  bc
    inc  c
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    inc  bc
    nop
    rlca
    inc  bc
    rlca
    nop
    jp   label_A500
    jp   label_4A699
    ld   e, d
    inc  h
    add  a, c
    ld   a, [hl]
    jp   label_FF3C
    ld   b, d
    rst  $38
    ld   h, [hl]
    ld   h, [hl]
    sbc  a, c
    sbc  a, c
    ld   a, [hl]
    rst  $38
    nop
    ld   a, [hl]
    and  l
    inc  a
    jp   label_4BE81
    cp   l
    ld   b, d
    jp   label_100
    nop
    inc  bc
    ld   bc, $0001
    ld   bc, label_600
    ld   bc, label_70A
    inc  c
    rlca
    ld   [de], a
    dec  c
    ld   [de], a
    dec  c
    ld   [de], a
    dec  c
    inc  de
    inc  c
    inc  de
    inc  c
    dec  bc
    inc  b
    add  hl, bc
    ld   b, $07
    ld   bc, $0003
    rst  $20
    nop
    sbc  a, c
    rst  $20
    db   $DB
    inc  h
    add  a, c
    ld   a, [hl]
    jp   label_FF3C
    ld   b, d
    rst  $38
    ld   h, [hl]
    ld   h, [hl]
    sbc  a, c
    sbc  a, c
    ld   a, [hl]
    ld   a, [hl]
    add  a, c
    nop
    rst  $38
    jr   label_4875F
    add  a, c
    ld   a, [hl]
    sbc  a, c
    ld   h, [hl]
    rst  $20
    add  a, c
    jp   label_E000
    nop
    ld    hl, sp+$00
    cp   $30
    ld   a, e
    inc  a
    ld   a, [hl]
    rra
    cpl
    rra
    ccf
    rrca
    ld   d, $0F
    ld   e, $07
    rra
    rlca
    ccf
    rlca
    ld   [hl], $0F
    ld   l, a
    ld   e, $7D
    ld   e, $FB
    inc  e
    rst  $38
    jr   label_487A4
    nop
    rrca
    nop

label_487A4::
    ccf
    nop
    rst  $30
    rrca
    rst  $28
    rra
    db   $FD ; Undefined instruction
    cp   $F7
    ld    hl, sp+$6F
    ld   a, [$FFFF]
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nz
    nop
    add  a, b
    nop
    rlca
    nop
    rrca
    inc  bc
    rrca
    inc  bc
    rlca
    ld   bc, $0003
    inc  bc
    nop
    inc  bc
    nop
    rlca
    ld   bc, label_31F
    ccf
    rrca
    ld   a, a
    rra
    ccf
    rrca
    rra
    inc  bc
    rlca
    ld   bc, $0003
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    jr   label_487E8

label_487E8::
    inc  a
    jr   label_48829
    inc  e
    rra
    inc  c
    ld   c, $05
    dec  b
    inc  bc
    ld   [bc], a
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
    rra
    nop
    ld   d, $0B
    jr   nz, label_48825
    inc  a
    inc  bc
    cp   $09
    cp   $61
    or   $39
    db   $FC ; Undefined instruction
    ld   a, a
    ld   e, d
    dec  a
    ld   a, h
    inc  sp
    ld    hl, sp+$6F
    ld    hl, sp+$6F
    ld   a, a
    jr   nc, label_48857
    inc  bc
    ld   a, $17
    ccf
    nop
    nop
    nop
    add  a, b
    nop

label_48824::
    ld   b, b

label_48825::
    add  a, b
    jr   nz, label_487E8
    jr   nz, label_487EA
    db   $10
    db   $E0
    db   $10
    db   $E0
    db   $10
    db   $E0
    ld   [label_8F0], sp
    ld   a, [$FF08]
    ld   a, [$FF8E]
    ld   [hl], b
    dec  d
    ld   [$CA35], a
    ld   a, $C0

label_4883E::
    ld   [rJOYP], a
    ld   b, $00
    dec  c
    ld   b, $08
    rlca
    db   $10
    db   $0F
    ld   a, h
    inc  bc
    db   $FC ; Undefined instruction
    ld   h, e
    ret  z
    ld   [hl], a
    adc  a, b
    ld   [hl], a
    ld   b, b
    ccf
    ld   h, b
    rra
    ld   [hl], b
    cpl
    ld   [hl], b

label_48857::
    ccf
    jr   nc, label_48879
    jr   c, label_48863
    ld   [hl], b
    ccf
    ld   a, a
    nop
    ret  nz
    nop
    jr   nz, label_48824
    db   $10
    db   $E0
    db   $10
    db   $E0
    ld   [label_8F0], sp
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$1E
    ld   [rBGPD], a
    sub  a, [hl]
    jp   hl
    ld   d, $FF

label_48879::
    nop
    ld   a, [hl]
    add  a, b
    jp   nz, label_FE3C
    nop
    inc  c
    nop
    inc  de
    inc  c
    db   $10
    db   $0F

label_48886::
    rla
    ld   [label_146F], sp
    rst  $28
    ld   d, b
    xor  a

label_4888D::
    ld   e, a
    xor  a
    ld   e, c
    ld   e, a
    cpl
    ld   e, h
    inc  sp
    ld   e, a
    ccf
    ld   e, a
    ccf
    cpl
    dec  e
    scf
    rrca
    ld   [hl], c
    ld   a, $7F
    nop
    ld   h, b
    nop
    sub  a, b
    ld   h, b
    jr   nc, label_48886
    ret  z
    jr   nc, label_4888D
    sbc  a, b
    db   $E4 ; Undefined instruction
    jr   label_48911
    sbc  a, b
    jp   nz, label_F2FC
    db   $EC ; Undefined instruction
    ld  [$FF00+C], a
    call c, label_BCE2
    rst  $20
    cp   b
    db   $FD ; Undefined instruction
    jp   nz, label_F887
    adc  a, [hl]
    ld   a, h
    cp   $00
    inc  bc
    nop
    inc  b
    inc  bc
    rrca
    nop
    rra
    inc  b
    rra
    nop
    ld   l, a
    rra
    ei

label_488CD::
    ld   d, h
    cp   a

label_488CF::
    ld   d, b
    cp   a
    ld   e, b
    ld   e, a
    cpl
    ld   e, c
    scf
    ld   e, a
    ccf
    ld   e, a
    dec  sp
    cpl
    rra
    ld   [hl], c
    ld   a, $7F
    nop
    jr   nc, label_488E2

label_488E2::
    ret  c
    jr   nc, label_488CD
    db   $10
    db   $E4
    sbc  a, b
    db   $E4 ; Undefined instruction
    jr   label_488CF
    ld    hl, sp+$B2
    ld   e, h
    ld   a, [$FF00+C]
    jp   hl
    ld   [hl], $F1
    xor  $F1
    sbc  a, $F3
    call c, label_E2FD
    rst  $20
    ld    hl, sp+$8E
    ld   a, h
    cp   $00
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8

label_48911::
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    rst  8
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, $0003
    ld   bc, $0100
    nop
    rlca
    nop
    dec  c
    ld   b, $1A
    dec  c
    rra
    nop
    ld   [bc], a
    ld   bc, $0102
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    ld   [bc], a
    ld   bc, $0001
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
    ld   bc, label_301
    ld   [bc], a
    rlca
    inc  b
    rlca
    inc  b
    rrca
    ld   [label_80F], sp
    rra
    db   $10
    db   $1F
    db   $10
    db   $1F
    stop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    rra
    jr   label_48A0A
    ld   h, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    ld   [bc], a
    rlca
    inc  b
    rlca
    inc  b
    rrca
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rlca
    inc  b
    nop
    nop
    nop
    nop
    rrca
    rrca
    ccf
    jr   nc, label_489C8
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_48A0A::
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ccf
    jr   nz, label_48A54
    jr   nz, label_48A36
    db   $10
    db   $0F
    inc  c
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
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    ld   [bc], a
    rlca
    inc  b
    rrca
    ld   [label_80F], sp

label_48A36::
    rrca
    ld   [label_407], sp
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    rrca
    ld   [label_101F], sp
    rra
    db   $10
    db   $7F
    ld   h, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_48A54::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ccf
    jr   nz, label_48AA4
    jr   nz, label_48AA6
    jr   nz, label_48AA8
    jr   nz, label_48AAA
    jr   nz, label_48AAC
    jr   nz, label_48A8E
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $0F
    ld   [label_80F], sp
    rlca
    inc  b
    inc  bc
    ld   [bc], a
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
    ld   bc, label_301
    ld   [bc], a
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rlca
    inc  b

label_48AA4::
    rrca
    ld   [label_80F], sp

label_48AA8::
    rrca
    ld   [label_383F], sp

label_48AAC::
    rst  $38
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    jr   nz, label_48ADC
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $1F
    db   $10
    db   $0F
    ld   [label_80F], sp
    rlca
    inc  b
    rlca
    inc  b

label_48ADC::
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, label_203
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    rra
    ld   e, $3F
    ldi  [hl], a
    ld   a, a
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   a, [$FF0F]
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rrca
    ld   [label_80F], sp
    rlca
    inc  b
    rlca
    inc  b
    rlca
    inc  b
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, label_1801
    nop
    inc  a
    jr   label_48B61
    jr   label_48B63
    jr   label_48B65
    jr   label_48B67
    jr   label_48B69
    jr   label_48B6B
    jr   label_48B6D
    jr   label_48B6F
    jr   label_48B71
    jr   label_48B73
    jr   label_48B75
    jr   label_48B77
    jr   label_48B79
    jr   label_48B57
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    ld   [bc], a
    rrca

label_48B47::
    ld   b, $0F
    ld   b, $1E
    inc  c
    ld   e, $0C
    inc  a
    jr   label_48B8D
    jr   label_48BCB
    jr   nc, label_48BCD
    jr   nc, label_48B47

label_48B57::
    ld   h, b
    ld   a, [$FF60]
    ld   [rLCDC], a
    ret  nz
    nop
    nop
    nop
    nop

label_48B61::
    nop
    nop

label_48B63::
    nop
    jr   label_48B66

label_48B66::
    inc  a

label_48B67::
    jr   label_48BE5

label_48B69::
    jr   c, label_48B63

label_48B6B::
    ld   [hl], b
    ld   a, [$FFE0]
    ld   [$FFC0], a
    ret  nz

label_48B71::
    add  a, b
    add  a, b

label_48B73::
    nop
    nop

label_48B75::
    nop
    nop

label_48B77::
    nop
    nop

label_48B79::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, $00
    ld   a, [hl]
    inc  e
    db   $FC ; Undefined instruction

label_48B8D::
    ld   a, b
    ld    hl, sp+$E0
    ld   [$FF80], a
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
    rlca
    rlca
    rra
    jr   label_48BE4
    jr   nz, label_48C26
    ld   b, b
    ld   a, a
    ld   b, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ccf
    jr   nz, label_48BDC
    jr   label_48BC6
    rlca
    ret  nz
    nop
    ld   a, h
    nop
    ld   a, $00

label_48BC6::
    ld   b, $00
    inc  c
    nop
    jr   label_48BCC

label_48BCC::
    jr   label_48BCE

label_48BCE::
    add  hl, de
    nop
    inc  sp
    nop
    ld   a, $00
    inc  e
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_48BDC::
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   a, [hl]
    nop

label_48BE4::
    ld   l, [hl]

label_48BE5::
    jr   nc, label_48C5E
    jr   c, label_48C27
    ld   bc, $0003
    rst  $38
    nop
    adc  a, a
    ld   a, [hl]
    adc  a, a
    ld   a, [hl]
    rst  $38
    nop
    ld   b, c
    ld   a, $4F
    ld   a, $4F
    ld   a, $4F
    ld   a, $4F
    ld   a, $7F
    nop
    ld   c, $00
    dec  d
    ld   a, [bc]
    db   $10
    db   $0F
    ld   e, $01
    rst  8
    ld   b, $E5
    inc  bc
    ei
    nop
    ld   a, c
    jr   nc, label_48C50
    nop
    ld   c, $05
    ld   c, $01
    add  hl, bc
    ld   b, $07
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_3F00
    nop

label_48C26::
    ld   c, l

label_48C27::
    ld   a, $7C
    inc  bc
    ld   a, [hl]
    dec  l
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   d, [hl]
    xor  $11
    ld   [$FF7F], a
    inc  b
    ei
    ld   l, $D5
    rst  $38
    jr   nz, label_48C3A
    rst  $18
    ld   a, a
    rst  $38
    rst  $38
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    add  a, e
    nop

label_48C50::
    ld   b, a
    add  a, d
    add  hl, hl
    add  a, $91
    ld   l, [hl]
    jp   nc, label_4926C
    db   $EC ; Undefined instruction
    ld   a, [$BA84]
    ld   [hl], h

label_48C5E::
    add  a, l
    ld   a, d
    ld   a, a
    adc  a, [hl]
    ld   a, $DD
    ld   a, a
    sub  a, h
    rst  $38
    rla
    rst  $38
    dec  e
    ld   e, a
    cpl
    rst  $28
    ld   [hl], b
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  0
    db   $3A ; ldd  a, [hl]
    daa
    jp  c, label_4B28F
    sbc  a, l
    ld   h, [hl]
    cp   $00
    ld   a, [$FF00+C]
    rst  0
    ld   a, $FF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop

label_48CAE::
    dec  c
    ld   b, $10
    rrca
    db   $10
    db   $0F
    dec  e
    ld   [bc], a
    rrca
    inc  b
    rrca
    ld   [bc], a
    inc  bc
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, $00
    cpl
    inc  e
    inc  hl
    dec  e
    ld   hl, label_4A01E
    rra
    ld   a, [$FF2F]
    ld   a, b
    and  a
    rlca
    ld    hl, sp+$A0
    ld   e, a
    ld   a, [$FFBF]
    rst  $28
    ld   [hl], b
    rst  $10
    xor  $FF
    nop
    ld   h, a
    jr   label_48CE1

label_48CE1::
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    and  b
    ld   b, b
    jr   nz, label_48CAE

label_48CEE::
    jr   nz, label_48CB0

label_48CF0::
    daa
    ret  nz
    ei
    ld   b, $6D
    sbc  a, [hl]
    jp  c, label_843C
    ld   a, b
    jr   c, label_48CBC
    jr   c, label_48CEE
    jr   c, label_48CF0
    and  d
    ld   e, l
    add  a, d
    ld   a, l
    ld   b, h
    dec  sp
    jr   c, label_48D0F
    add  hl, sp
    rlca
    ld   h, l
    dec  de
    jp   label_FF7C

label_48D0F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_48D1F::
    nop
    inc  h
    ld    hl, sp+$7C
    ld    hl, sp+$8C
    ld    hl, sp+$F4
    ld    hl, sp+$1C
    ld   a, [$FFFA]
    db   $E4 ; Undefined instruction
    di
    ld   c, $FF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rlca
    inc  bc
    rlca
    ld   [bc], a
    rrca
    nop
    ld   a, [bc]
    dec  b
    rrca
    nop
    db   $10
    db   $0F
    dec  hl
    inc  d
    ld   a, [hli]
    dec  d
    jr   nz, label_48D79
    ld   c, h
    ccf
    add  a, b
    ld   a, a
    and  h
    ld   e, e
    nop
    nop
    nop
    nop
    ld   c, $00
    sbc  a, a
    ld   c, $FF
    ld   e, $B7
    sbc  a, $B6
    ld   c, h
    ld   a, [hl]
    sbc  a, h
    ld   a, $CC
    ld   e, $E4
    inc  c
    ld   a, [$FF48]
    ld   a, [$FFC4]

label_48D79::
    jr   c, label_48CFF
    ld   a, b
    add  a, d
    ld   a, h
    ld   b, d
    cp   h
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ld   b, b
    ccf
    ccf
    nop
    ld   b, b
    ccf
    ld   b, b
    ccf
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ld   b, b
    ccf
    jr   nc, label_48DA9
    ld   c, a
    jr   nc, label_48D1F
    ld   a, l
    rst  $38
    nop
    ld   b, d
    cp   h
    ld   b, c
    cp   [hl]
    add  a, c
    ld   a, [hl]
    ld   hl, label_31DE

label_48DA9::
    adc  a, $21
    sbc  a, $43
    cp   h
    ld   h, l
    cp   d
    add  hl, sp
    add  a, $01
    cp   $02
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$C4
    jr   c, label_48DBD
    db   $FC ; Undefined instruction
    ld   [bc], a

label_48DBD::
    db   $FC ; Undefined instruction
    cp   $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_48DD2

label_48DD2::
    inc  a
    jr   label_48E14
    jr   label_48E14
    ld   d, $7D
    ld   [bc], a
    ld   d, e
    inc  l
    ld   a, c
    ld   b, $80
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
    ld   [hl], b
    nop
    ld    hl, sp+$70
    ld    hl, sp+$F0
    cp   b
    ld   a, [$FFB0]
    ld   h, b
    ld   a, [$FFE0]
    ld   a, [$FF60]
    ld   [rJOYP], a
    ld   bc, $0100
    nop
    ld   bc, label_200
    ld   bc, label_304
    dec  b
    ld   [bc], a
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    inc  bc
    nop

label_48E14::
    rlca
    inc  bc
    ld   b, $03
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    ld   e, b
    and  a
    ld   d, d
    xor  a
    ld   b, $F9
    ld   h, h
    ei
    ld   [bc], a
    db   $FD ; Undefined instruction
    ldi  [hl], a
    db   $03
    inc  bc
    db   $FC ; Undefined instruction
    ld   b, $F9
    ld    hl, sp+$07
    ld   b, $F9
    adc  a, a
    db   $76 ; Halt
    ld   d, e
    xor  [hl]
    ld   d, c
    xor  [hl]
    ld   d, c
    xor  [hl]
    ld   [hl], e
    adc  a, h
    rst  $38
    nop
    jr   nz, label_48E02
    db   $10
    db   $E0
    ld   [label_4F0], sp
    ld    hl, sp+$04
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    ldi  [hl], a
    call c, label_DE21
    ld   sp, label_481CE
    cp   [hl]
    ld   h, d
    cp   h
    ld   l, [hl]
    or   b
    ld   [hl], d
    adc  a, h
    ld   b, $F8
    inc  e
    ld   [$FFF0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, $00
    ld   a, [bc]
    inc  b
    ccf
    nop
    ld   a, a
    dec  l
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   h, b
    ccf
    ld   e, a
    ccf
    rst  $38
    nop
    ret  nz
    ld   a, a
    rst  $38
    nop
    dec  c
    nop
    dec  c
    nop
    dec  e
    nop
    inc  l
    inc  de
    jr   c, label_48EA5
    nop
    nop
    ld   bc, $0100
    nop
    inc  bc

label_48EA5::
    nop
    inc  b
    inc  bc
    dec  b
    ld   [bc], a
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    inc  bc
    nop
    rlca
    inc  bc
    ld   b, $03
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    ld   e, b
    and  a
    ld   d, d
    xor  a
    ld   h, [hl]
    ld   sp, hl
    inc  b
    ei
    ld   [de], a
    db   $ED ; Undefined instruction
    ld   [bc], a
    db   $FD ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  c
    di
    ld   a, [$FF0F]
    ld   b, $F9
    adc  a, a
    db   $76 ; Halt
    ld   d, e
    xor  [hl]
    ld   d, c
    xor  [hl]
    ld   d, c
    xor  [hl]
    ld   [hl], e
    adc  a, h
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    dec  de
    nop
    inc  h
    dec  de
    ld   l, $13
    jr   nc, label_48F1D
    jr   nz, label_48F2F
    ld   [hl], e
    inc  c
    ld   a, b
    rra
    ld   a, e
    inc  a
    ld   e, a
    dec  sp
    jr   c, label_48F21
    add  hl, hl
    ld   d, $1C

label_48F1D::
    inc  bc
    rlca
    nop
    nop

label_48F21::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_48F28::
    add  a, b
    nop
    cp   b
    nop
    ld   e, h
    cp   b
    inc  l

label_48F2F::
    ret  nc
    ld   a, $CC
    daa
    sbc  a, $07
    ld    hl, sp+$82
    ld   a, h
    add  a, d
    ld   a, h
    ldi  [hl], a
    call c, label_B844
    ld    hl, sp+$00
    nop

label_48F41::
    nop
    nop
    nop
    ld   b, $00
    add  hl, bc
    ld   b, $1D
    ld   b, $28
    rla
    jr   nz, label_48F6D
    inc  sp
    inc  c
    ld   a, b
    rra
    ld   a, e
    inc  a
    ld   e, a
    dec  sp
    jr   z, label_48F6F
    ld   e, c
    ld   h, $48
    scf
    inc  a
    inc  bc
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, h
    nop
    ld   l, [hl]

label_48F6D::
    sbc  a, h
    ld   a, $C0
    ld   l, $DC
    inc  h
    ret  c
    add  a, h
    ld   a, b
    add  a, d
    ld   a, h
    ld   [bc], a
    db   $FC ; Undefined instruction
    ldi  [hl], a
    call c, label_B844
    ld    hl, sp+$00
    nop

label_48F81::
    nop
    jr   nc, label_48F84

label_48F84::
    ld   a, a
    jr   nc, label_48F28
    ld   e, [hl]
    add  a, a
    ld   a, a
    cp   a
    ld   b, b
    and  b
    ld   e, a
    db   $02
    ld   [bc], a
    inc  bc
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    inc  bc
    nop
    rlca
    ld   [bc], a
    rlca
    nop
    ld   bc, label_4A000
    nop
    ld   a, [$FF40]
    ld   a, $C0
    ld   a, h
    add  a, b
    xor  [hl]
    ld   [hl], b
    db   $FC ; Undefined instruction
    ld   d, b
    cp   b
    ld   h, b
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    sub  a, $28
    sub  a, $28
    and  h
    ld   e, b
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    ret  z
    ld   a, [$FFF8]
    nop
    jr   label_48FC2

label_48FC2::
    ld   a, $18
    ld   d, c
    ld   l, $9C
    ld   a, a
    cp   e
    ld   b, a
    rst  0
    nop
    ld   c, $01
    inc  b
    inc  bc
    add  hl, bc
    ld   b, $0F
    nop
    rlca
    nop
    rlca
    nop
    inc  bc
    nop
    rlca
    ld   [bc], a
    rlca
    nop
    ld   bc, label_3000
    nop
    ld   a, b
    jr   nz, label_48F81
    ld   h, b
    cp   a
    ld   b, b
    cp   $80
    rst  0
    jr   c, label_49069
    add  a, b
    ld   a, b
    add  a, b
    db   $FC ; Undefined instruction
    nop
    sub  a, $28
    sub  a, $28
    and  h
    ld   e, b
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    ret  z
    ld   a, [$FFF8]
    nop
    ld   b, $00
    ld   c, $04
    ld   e, $0C
    dec  sp
    inc  e
    ld   [hl], h
    dec  sp
    db   $E8 ; add  sp, d
    ld   [hl], a
    ld   a, [label_1A05]
    dec  b
    jr   label_49019
    db   $FC ; Undefined instruction
    inc  bc
    rst  $28
    ld   [hl], b
    ld   [hl], a
    jr   c, label_49054

label_49019::
    inc  e
    ld   e, $0C
    ld   c, $04
    ld   b, $00
    nop
    nop
    ld   bc, label_300
    ld   bc, label_1E3
    rst  $30
    ld   h, b
    rst  $38
    ld   [hl], h
    ld   a, l
    dec  hl

label_4902E::
    ld   a, b
    daa
    di
    ld   l, h
    rst  $30
    ld   l, c
    ld   [hl], a
    jr   z, label_4902E
    ld   l, b
    di
    adc  a, h
    ld    hl, sp+$E7
    ld   [hl], a
    ld   a, b
    rrca
    rrca
    nop
    nop
    rlca
    rlca
    rra
    inc  e
    ccf
    ld   sp, label_4A77F
    ld   a, a
    ld   l, [hl]
    rst  $38
    call z, label_CDFF
    rst  $38
    ld   h, a
    rst  $38
    ld   [hl], e

label_49054::
    rst  $38
    cp   b
    rst  $38
    sbc  a, a
    ld   a, a
    ld   b, a
    ccf
    jr   nc, label_4906C
    rrca
    nop
    nop
    ld   bc, label_300
    ld   bc, label_1E3
    rst  $30
    ld   h, b
    rst  $38

label_49069::
    ld   [hl], b
    ld   a, a
    inc  l

label_4906C::
    ld   a, a
    ld   l, $FF
    ld   l, e
    rst  $38
    ld   l, b
    ld   a, c
    daa
    di
    ld   l, h
    db   $F4 ; Undefined instruction
    ld   c, e
    pop  af
    adc  a, [hl]
    rst  $38
    pop  af
    ccf
    ccf
    rlca
    rlca
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    ld   de, label_130F
    rrca
    inc  hl
    dec  e
    daa
    jr   label_490B6
    jr   label_49108
    jr   z, label_49106
    inc  l
    ld   e, h
    inc  sp
    cpl
    inc  e
    ld   a, e
    rlca
    ld   [hl], a
    jr   label_490DC
    db   $10
    db   $1F
    nop
    inc  bc
    nop
    ld   [hl], a
    ld   [hl], b
    ld   a, a
    ld   a, b
    ld   a, a
    ld   a, b
    ccf
    inc  sp
    ld   a, a
    rlca
    rst  $38
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    dec  c
    rst  $38
    rrca
    ld   a, a
    inc  bc

label_490B6::
    ccf
    ldd  [hl], a
    ld   a, a
    ld   a, d
    ld   a, a
    ld   a, b
    ld   [hl], a
    ld   [hl], b
    inc  bc
    nop
    rrca
    add  hl, bc
    ccf
    jr   label_49144
    inc  bc
    ld   a, a
    ld   c, a
    rst  $38
    db   $D3 ; Undefined instruction
    rst  $38
    add  hl, de
    rst  $38
    dec  a
    rst  $38
    xor  a
    rst  $38
    and  a
    rst  $38
    add  hl, sp
    rst  $38
    inc  e
    rst  $38
    sbc  a, $7F
    ld   c, a
    ld   a, a
    inc  bc

label_490DC::
    ccf
    jr   label_490EE
    add  hl, bc
    dec  sp
    nop
    inc  a
    dec  de
    ld   a, $1D
    ccf
    ld   b, $3F
    dec  bc
    ccf
    dec  e
    ld   a, a
    jr   label_490EE
    ld   e, c
    db   $ED ; Undefined instruction
    ld   e, [hl]
    db   $D3 ; Undefined instruction
    inc  l
    adc  a, a
    ld   [hl], b
    and  e
    ld   e, h
    or   e
    ld   l, h
    db   $D3 ; Undefined instruction
    ld   a, $61
    rra
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_49106::
    rrca
    nop

label_49108::
    ccf
    nop
    ccf
    nop
    rra
    ld   bc, label_307
    ld   a, a
    ld   [bc], a
    and  a
    ld   e, b
    add  a, c
    ld   a, [hl]
    ld    hl, sp+$07
    ld   a, l
    db   $3A ; ldd  a, [hl]
    ld   e, a
    dec  a
    scf
    ld   c, $0B
    rlca
    nop
    nop
    ld   a, h
    nop
    or   d
    ld   a, h
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $38
    nop
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [$FFFF]
    or   b
    db   $E3 ; Undefined instruction
    inc  e
    nop
    rst  $38
    inc  b
    ei
    ccf
    jp   label_2FFF
    or   $D9
    jp   hl
    or   $00
    nop
    nop
    nop

label_49144::
    nop
    nop
    nop
    nop
    nop

label_49149::
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    call z, label_E00
    inc  b
    adc  a, [hl]
    inc  b
    ld   e, [hl]
    adc  a, h
    ld   e, [hl]
    adc  a, h
    ld   a, d
    sbc  a, h
    or   $38
    ld   [label_E74], a
    ld   bc, label_40B
    inc  de
    dec  c
    ld   [de], a
    dec  c
    rrca
    nop
    dec  e
    ld   b, $3C
    rra
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_49149
    call nz, label_4803B
    cp   a
    ld   h, c
    sbc  a, [hl]
    rst  $38
    nop
    ld   a, [$FF1F]
    ld    hl, sp+$7F
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or   d
    ld   c, h
    jp   nz, label_843C
    ld   a, b
    add  a, h
    ld   a, b
    ld   [$B0F0], sp
    ld   b, b
    ld   b, b
    add  a, b
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nz
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    ret  nz
    nop
    ld   [rLCDC], a
    cp   b
    ld   h, b
    sbc  a, $38
    scf
    adc  a, $8F
    ld   [hl], b
    ld   b, b
    cp   a
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    db   $10
    db   $E0
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rlca
    nop
    ccf
    ld   bc, label_2C53
    ld   b, b
    ccf
    ld   a, b
    rlca
    ld   a, h
    dec  hl
    cpl
    nop
    rlca
    nop
    inc  bc
    nop
    ccf
    ld   bc, label_1E3F
    ld   e, $00
    db   $ED ; Undefined instruction
    ld   e, $F8
    rlca
    cp   $01
    rst  $38
    nop
    rst  $38
    or   b
    rst  $38
    ld    hl, sp+$FF
    ld   e, b
    di
    inc  c
    ld   bc, label_25FE
    jp  c, label_23FE
    cp   $07
    cp   $0F
    or   $19
    jp   hl
    or   $00
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop

label_4926C::
    ret  nz
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    cpl
    rra
    rra
    nop
    inc  de
    dec  c
    ld   [de], a
    dec  c
    rrca
    nop
    dec  e
    ld   b, $3C
    rra
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    rlca
    inc  bc
    ld   [bc], a
    ld   bc, $0003
    ccf
    ld   [bc], a
    ccf
    inc  e
    ccf
    nop
    ld   a, [hl]
    dec  l
    ld   a, [hli]
    dec  d
    inc  a
    inc  bc
    ld   a, h
    dec  hl
    inc  a
    inc  bc
    ld   a, h
    dec  hl
    add  hl, sp
    ld   b, $79
    ld   b, $FB
    ld   d, h
    pop  af
    ld   c, $71
    adc  a, [hl]
    sbc  a, $E7
    ld   a, $CF
    cp   $39
    ld   sp, hl
    or   $00
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    ld   a, h
    add  a, b
    cp   $40
    rst  $38
    jp   nz, label_827F
    ld   sp, hl
    ld   b, $FA
    inc  b
    db   $FC ; Undefined instruction
    nop
    ld   [rJOYP], a
    inc  bc
    nop
    rlca
    nop
    rrca
    nop
    rrca
    rlca
    rra
    dec  bc
    rra
    dec  bc
    rrca
    rlca
    rra
    rrca
    ld   d, $0F
    cpl
    db   $10
    db   $27
    add  hl, de
    cpl

label_49317::
    inc  d
    rra
    ld   b, $0F
    nop
    inc  e
    rrca
    rra
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$80
    db   $FC ; Undefined instruction
    ret  c
    db   $FC ; Undefined instruction
    ld   e, b
    db   $F4 ; Undefined instruction
    ld   a, b
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]
    jr   nz, label_49325
    jr   z, label_49317
    ld   e, b
    db   $E4 ; Undefined instruction
    sbc  a, b
    db   $F4 ; Undefined instruction
    ld   l, b
    ld    hl, sp+$60
    ld    hl, sp+$00
    sbc  a, h
    ld   a, b
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    rrca
    nop
    rrca
    rlca
    dec  c
    inc  bc
    ccf
    rrca
    rst  $38
    cpl
    push af
    ld   l, [hl]
    rst  $38
    ld   h, b
    ld   a, a
    nop
    ld   c, a
    scf
    cpl
    inc  de
    rra
    nop
    inc  c
    inc  bc
    rrca
    nop
    inc  e
    rrca
    rra
    nop
    ld   [rJOYP], a
    ld   a, [$FF80]
    ld   a, [$FFC0]
    ld    hl, sp+$40
    db   $FC ; Undefined instruction
    ld   e, b
    db   $FC ; Undefined instruction

label_4936B::
    ld    hl, sp+$F4
    ld   a, b
    ld    hl, sp+$60
    db   $F4 ; Undefined instruction
    ret  z
    db   $E4 ; Undefined instruction
    sbc  a, b
    db   $E4 ; Undefined instruction
    jr   label_4936B
    ld   l, b
    ld    hl, sp+$60
    ld    hl, sp+$00
    sbc  a, h
    ld   a, b
    db   $FC ; Undefined instruction
    nop
    scf
    nop
    ld   a, a
    ld   sp, label_377F
    ld   a, l
    inc  hl
    ld   a, a
    rrca
    ld   e, a
    cpl
    ld   e, a
    ld   l, $2F
    db   $10
    db   $2F
    db   $10
    db   $1F
    dec  b
    ld   l, a
    dec  b
    cp   $63
    rst  $38
    ld   [hl], b
    ld   a, a
    jr   nc, label_493DC
    nop
    nop
    nop
    ret  c
    nop
    db   $FC ; Undefined instruction

label_493A3::
    jr   label_493A3
    sbc  a, h
    cp   $44
    or   $48
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    db   $E4 ; Undefined instruction
    ld   e, b
    db   $E4 ; Undefined instruction
    ret  c
    db   $E8 ; add  sp, d
    sub  a, b
    ld   a, b
    add  a, b
    ld    hl, sp+$30
    ld    hl, sp+$70
    ld   a, [$FF60]
    ld   [rJOYP], a
    nop
    nop
    scf
    nop
    ld   a, a
    ld   sp, label_377F
    ld   a, l
    inc  hl
    ld   a, a
    rrca
    ld   e, a
    cpl
    ld   e, a
    ld   l, $2F
    db   $10
    db   $2F
    db   $10
    db   $1F
    rlca
    rrca
    inc  bc
    rrca
    nop
    ld   b, $01
    rlca
    nop

label_493DC::
    inc  bc
    ld   bc, $0001
    ret  c
    nop
    db   $FC ; Undefined instruction

label_493E3::
    jr   label_493E3
    sbc  a, h
    cp   $44
    or   $48
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    db   $E4 ; Undefined instruction
    ld   e, b
    db   $E4 ; Undefined instruction
    ret  c
    db   $E8 ; add  sp, d
    sub  a, b
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld   a, h
    add  a, b
    cp   $04
    cp   $DC
    call c, label_0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    inc  b
    ld   e, $01
    ccf
    dec  c
    ccf
    dec  e
    ccf
    dec  e
    ld   l, $1D
    inc  de
    inc  c
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
    jp   label_2400
    db   $DB
    and  l
    db   $DB
    rst  $20
    db   $DB
    rst  $38
    jp   label_E7DB
    db   $DB
    rst  $20
    db   $DB
    rst  $20
    ld   e, d
    rst  $20
    sbc  a, c
    ld   h, [hl]
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    ld   de, label_300F
    rrca
    ld   b, b
    ccf
    ld   l, [hl]
    ccf
    ld   l, a
    inc  sp
    ccf
    dec  bc
    ld   d, a
    cpl
    ld   c, e
    ld   [hl], $77
    ld   [label_4AEF7], sp
    rst  $38
    ld   b, $07
    nop
    rrca
    nop
    inc  de
    rrca
    ld   h, b
    rra
    add  a, b
    ld   a, a
    db   $7F
    ld   a, a
    rst  $18
    ld   h, a
    ld   a, a
    rla
    xor  a
    ld   e, a
    or   a
    ld   c, l
    sbc  a, a
    ld   h, b
    sbc  a, a
    ld   a, l
    ld   e, a
    dec  sp
    add  hl, sp
    rlca
    ld   b, b
    ccf
    di
    ld   a, h
    db   $FC ; Undefined instruction
    nop
    pop  de
    ld   c, $31
    adc  a, $19
    and  $05

label_49487::
    ld   a, [$FADD]
    db   $3A
    db   $3A ; ldd  a, [hl]
    jp  c, label_D264
    db   $EC ; Undefined instruction
    and  h
    ret  c
    db   $E4 ; Undefined instruction
    jr   c, label_49487
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
    and  $F8
    rlca
    cp   $FF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   a, d
    inc  a
    ld   a, [hl]
    inc  e

label_494BA::
    ld   a, l
    ld   a, $31
    ld   c, $11
    ld   c, $00
    nop
    nop
    nop
    inc  bc
    nop
    dec  c
    inc  bc
    rla
    rrca
    inc  e
    rrca
    jr   z, label_494ED
    jr   c, label_494EF
    jr   nc, label_494F1
    jr   nc, label_494F3
    jr   nz, label_494F5
    daa
    jr   label_494F1
    rlca
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
    ld   a, [$FF00]
    ret  z
    ld   a, [$FF08]
    ld   a, [$FF14]
    db   $E8 ; add  sp, d
    inc  d

label_494ED::
    db   $E8 ; add  sp, d
    inc  d

label_494EF::
    db   $E8 ; add  sp, d
    inc  d

label_494F1::
    db   $E8 ; add  sp, d
    inc  h

label_494F3::
    ret  c
    ld   c, b

label_494F5::
    or   b
    adc  a, b
    ld   [hl], b
    jr   nc, label_494BA
    ret  nz
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    db   $FC ; Undefined instruction
    ld   a, e
    add  a, l
    ld   a, d
    add  a, [hl]
    ld   a, c
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, h
    dec  sp
    ld   b, l
    db   $3A ; ldd  a, [hl]
    ld   a, l
    ld   [bc], a
    ld   a, h
    dec  sp
    ld   b, h
    dec  sp
    ld   a, a
    nop
    ld   a, a
    ld   a, $7F
    nop
    rst  $38
    ei
    rst  $38
    ei
    inc  b

label_49525::
    ei
    rst  $38
    nop
    nop
    rst  $38
    ld   [$FF1F], a
    db   $D3 ; Undefined instruction
    inc  l
    ld   b, $F9
    rst  $38
    nop
    ld   d, d
    xor  l
    or   e
    ld   c, h
    rst  $38
    nop
    ld   b, $F9
    rst  $38
    nop
    rst  $38
    rst  $30
    rst  $38
    nop
    rst  $38
    rst  $18
    rst  $38
    rst  $18
    jr   nz, label_49525
    rst  $38
    nop
    ld   d, l
    xor  d
    nop
    rst  $38
    ld   d, l
    xor  d
    nop
    rst  $38
    ld   sp, hl
    ld   b, $DF
    jr   nz, label_49584
    ret  nc
    ld   sp, hl
    ld   b, $00
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $28
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    ccf
    sbc  a, $21
    sbc  a, $21
    sbc  a, $BF
    ld   b, b
    cp   [hl]
    ld   e, h
    ldi  [hl], a
    call c, label_C03E
    cp   [hl]
    ld   e, h
    and  d
    ld   e, h
    cp   $00
    cp   $7C
    cp   $00
    rst  $38
    nop
    and  c
    ld   e, [hl]

label_49584::
    and  c
    ld   e, [hl]
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    rst  $38
    nop
    rst  $18
    ld   a, [hl]
    rst  $18
    ld   a, [hl]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    nop
    cp   [hl]
    ld   a, h
    cp   a
    ld   a, [hl]
    cp   [hl]
    ld   a, a
    cp   [hl]
    ld   a, a
    cp   [hl]
    ld   a, a
    add  a, [hl]
    ld   a, a
    add  a, c
    ld   a, [hl]
    rst  $38
    ld   bc, $0003
    nop
    nop
    nop
    nop
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
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    ret  nz
    cp   b
    adc  a, b
    ld    hl, sp+$98
    ld    hl, sp+$98
    ld    hl, sp+$98
    ld    hl, sp+$98
    ld    hl, sp+$F8
    ld    hl, sp+$98
    ld    hl, sp+$98

label_49611::
    ld    hl, sp+$9C
    db   $FC ; Undefined instruction
    sbc  a, b
    ld    hl, sp+$98
    ld    hl, sp+$98

label_49619::
    ld    hl, sp+$98
    ld    hl, sp+$B8
    ld    hl, sp+$D8
    ld   [$FFFC], a

label_49621::
    nop
    db   $E4 ; Undefined instruction

label_49623::
    jr   label_49611
    jr   label_49623
    nop
    db   $FC ; Undefined instruction

label_49629::
    nop
    db   $E4 ; Undefined instruction

label_4962B::
    jr   label_49619
    jr   label_4962B
    nop
    db   $FC ; Undefined instruction
    nop
    db   $E4 ; Undefined instruction

label_49633::
    jr   label_49621
    jr   label_49633
    nop
    db   $FC ; Undefined instruction
    nop
    db   $E4 ; Undefined instruction
    jr   label_49629
    jr   label_4965B
    nop
    push bc
    ld   a, $8E
    ld   a, a
    rra
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    ccf
    rst  $38
    rst  $18
    rst  $38
    sbc  a, a
    ld   a, a
    sbc  a, a
    ld   a, a
    rra
    rst  $38
    rra
    rst  $38
    rra
    rst  $38
    add  hl, de

label_4965B::
    rst  $38
    cpl
    pop  af
    ld   a, a
    pop  bc
    rst  $38
    nop
    pop  hl
    ld   e, $EF
    ld   e, $FF
    nop
    rst  $38
    nop
    pop  hl
    ld   e, $EF
    ld   e, $FF
    nop
    rst  $38
    nop
    pop  hl
    ld   e, $EF
    ld   e, $FF
    nop
    rst  $38
    nop
    pop  hl
    ld   e, $6F
    ld   e, $3F
    nop
    di
    rrca
    rst  8
    ccf
    sbc  a, a
    ld   a, a
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ld   a, a
    rst  $38
    cp   a
    rst  $38
    cp   a
    ld   a, a
    cp   a
    ld   a, a
    rra
    rst  $38
    rra
    rst  $38
    jr   nz, label_4969B
    ld   e, a
    ld   [$FFBF], a
    ret  nz
    rst  $38
    nop
    ret  nz
    ccf
    rst  $18
    ccf
    rst  $38
    nop
    rst  $38
    nop
    ret  nz
    ccf
    rst  $18
    ccf
    rst  $38
    nop
    rst  $38
    nop
    ret  nz
    ccf
    rst  $18
    ccf
    rst  $38
    nop
    rst  $38
    nop
    ret  nz
    ccf
    rst  $18
    ccf
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    rra
    nop
    ccf
    ld   d, $7F
    ld   [hl], $EB
    db   $76 ; Halt
    db   $DB
    ld   h, [hl]
    ei
    ld   d, [hl]
    cp   e
    ld   b, [hl]
    ld   a, e
    ld   b, $FB
    ld   h, [hl]
    ei
    db   $76 ; Halt
    ei
    db   $76 ; Halt
    ei
    ld   d, [hl]
    db   $EB ; Undefined instruction
    db   $76 ; Halt
    ei
    ld   h, [hl]
    rst  $18
    ld   h, d
    ld   [hl], e
    nop
    dec  a
    nop
    ld   a, a
    dec  l
    ld   a, [hl]
    ccf
    ld   a, e
    inc  a
    rst  $30
    ld   a, e
    rst  $38
    ld   [hl], a
    sbc  a, a
    ld   [hl], c
    ld   l, a
    ld   de, label_4A3FC
    ei
    ld   a, h
    ei
    ld   a, h
    or   $59
    db   $FC ; Undefined instruction
    ld   [hl], e
    rst  $38
    ld   [hl], b
    cp   b
    ld   h, b
    ld   [hl], b
    nop
    cp   h
    nop
    cp   $BC
    rst  $20
    ld   a, [hl]
    sub  a, e
    ld   l, [hl]
    db   $DB
    ld   h, $7B
    add  a, [hl]
    ld   c, e
    or   [hl]
    ld   c, e
    or   [hl]
    adc  a, e
    db   $76 ; Halt
    sbc  a, e
    ld   h, [hl]
    dec  de
    and  $9B
    ld   h, [hl]
    ei
    ld   b, $9B
    ld   b, $0F
    nop
    ld   b, $00
    dec  de
    nop
    ccf
    ld   a, [de]
    ld   h, a
    dec  sp
    ld   l, l
    inc  sp
    rst  $38
    ld   h, l
    rst  $18
    ld   h, l
    xor  $51
    rst  $28
    ld   d, b
    db   $EB ; Undefined instruction
    ld   d, l
    rst  $20
    ld   e, e
    rst  $20
    ld   e, e
    rst  $20
    ld   e, c
    rst  $28
    ld   d, e
    push af
    inc  bc
    ld   h, d
    ld   bc, $0001
    adc  a, $00
    rst  $38
    call z, label_FDF3
    xor  $F1
    rst  $18
    db   $EC ; Undefined instruction
    db   $FD ; Undefined instruction
    sbc  a, $7D
    add  a, $BD
    ld   b, [hl]
    ei
    adc  a, h
    sbc  a, $E1
    db   $FC ; Undefined instruction
    di
    ld   sp, hl
    ld   h, [hl]
    ld   sp, hl
    add  a, $BF
    ret  nz
    ld   [hl], b
    add  a, b
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld    hl, sp+$8E
    db   $FC ; Undefined instruction
    ld   [hl], $CC
    db   $76 ; Halt
    adc  a, h
    rst  $38
    ld   b, $1B
    and  $0B
    or   $0B
    or   $2B
    sub  a, $2B
    sub  a, $2B
    sub  a, $EB
    ld   d, $3B
    ld   b, $1F
    nop
    ld   c, $00
    rrca
    nop
    rra
    rrca
    ld   sp, label_361F
    add  hl, de
    ld   l, a
    jr   nc, label_4983A
    jr   nc, label_49845
    daa
    ret  nc
    ld   l, a
    ret  nc
    ld   l, a
    jp   nc, label_D26D
    ld   l, l
    jp   nc, label_D76D
    ld   l, b
    call c, label_4B860
    nop
    jr   nc, label_497E0

label_497E0::
    add  hl, sp
    nop
    cp   a
    add  hl, de
    rst  $20
    sbc  a, a
    cp   e
    rst  0
    ld   d, a
    cp   e
    rst  $38
    dec  sp
    cp   $23
    ld   a, l
    and  d
    ld   a, a
    sbc  a, c
    dec  a
    jp   label_E71F
    ld   c, a
    or   l
    rst  8
    scf
    ld   a, l
    inc  bc
    ld   c, $01
    rlca
    nop
    scf
    nop
    ld   l, a
    scf
    ld   e, a
    cpl
    ccf
    ld   a, [de]
    ccf
    ld   [de], a
    ld   a, a
    rla
    rst  $38
    ld   a, a
    cp   a
    ld   a, b
    ld   e, a
    jr   nc, label_49852
    inc  de
    ccf
    rra
    inc  l
    rra
    rla
    rrca
    db   $10
    db   $0F
    inc  c
    inc  bc
    inc  bc
    nop
    ret  c
    nop
    db   $EC ; Undefined instruction
    ret  c
    db   $E4 ; Undefined instruction
    ret  c
    ld    hl, sp+$60
    db   $FC ; Undefined instruction

label_49829::
    jr   c, label_49829
    jr   nc, label_4982C
    cp   $FD
    ld   a, [hl]
    ld  [$FF00+C], a
    inc  a
    db   $EC ; Undefined instruction
    jr   nc, label_4981B
    ld    hl, sp+$C5
    ld   a, [$F689]

label_4983A::
    ld   [bc], a
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FFF0]
    nop
    scf
    nop
    ld   l, a
    scf
    ld   e, a

label_49845::
    cpl
    ccf
    ld   a, [de]
    ccf
    ld   [de], a
    ccf
    rla
    ccf
    rra
    ccf
    jr   label_498D0
    jr   nc, label_49852
    ld   [hl], e
    sbc  a, a
    ld   a, a
    ld   l, h
    rra
    rla
    rrca
    db   $10
    db   $0F
    inc  c
    inc  bc
    inc  bc
    nop
    ret  c
    nop
    db   $EC ; Undefined instruction
    ret  c
    db   $E4 ; Undefined instruction
    ret  c
    ld    hl, sp+$60
    db   $FC ; Undefined instruction

label_49869::
    jr   c, label_49867
    jr   c, label_49869
    ld    hl, sp+$FE
    ld   a, h
    rst  $38
    ld   a, $F7
    ld   a, $E9
    or   $CE
    ld   a, [$FF98]
    ld   [rDIV], a
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    dec  de
    nop
    scf
    dec  de
    daa
    dec  de
    rra
    rlca
    rra
    rrca
    ld   a, a
    rrca
    rst  $38
    ld   a, a
    cp   a
    ld   a, a
    ld   e, a
    ccf
    dec  a
    ld   e, $2F
    rra
    daa
    rra
    db   $10
    db   $0F
    db   $10
    db   $0F
    inc  c
    inc  bc
    inc  bc
    nop
    ret  c
    nop
    db   $EC ; Undefined instruction
    ret  c
    db   $F4 ; Undefined instruction
    db   $E8 ; add  sp, d
    ld    hl, sp+$F0
    ld    hl, sp+$F0
    cp   $F0
    rst  $38
    cp   $FD
    sbc  a, [hl]
    ld   a, [$FC6C]
    ld   a, [$FF9C]
    ld    hl, sp+$04
    ld    hl, sp+$04
    ld    hl, sp+$08
    ld   a, [$FF10]
    ld   [$FFE0], a
    nop
    dec  de
    nop
    scf
    dec  de
    daa
    dec  de
    rra
    rlca
    rra
    rrca
    cpl
    rra
    cpl
    rra
    ld   a, a
    ccf

label_498D0::
    rst  $38
    ld   a, a
    adc  a, a
    ld   a, a
    ld   a, a
    rrca
    daa
    rra
    inc  de
    rrca
    db   $10
    db   $0F
    inc  c
    inc  bc
    inc  bc
    nop
    ret  c
    nop
    db   $EC ; Undefined instruction
    ret  c
    db   $F4 ; Undefined instruction
    db   $E8 ; add  sp, d
    ld    hl, sp+$F0
    ld    hl, sp+$F0
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    rst  $38
    cp   $F9
    cp   $FE
    adc  a, b
    db   $FC ; Undefined instruction
    ld   [hl], b
    call z, label_4F8
    ld    hl, sp+$08
    ld   a, [$FFF0]
    nop
    rlca
    nop
    inc  a
    inc  bc
    ld   c, b
    scf
    ld   e, c
    daa
    ld   [hl], a
    rrca
    call z, label_993F
    ld   a, [hl]
    sub  a, d
    ld   a, l
    sub  a, l
    ld   a, e
    jp   z, label_B537
    ld   c, [hl]
    push af
    ld   c, [hl]
    or   b
    ld   c, a
    ret  z
    scf
    sub  a, h
    ld   a, e
    adc  a, b
    ld   a, a
    rst  $38
    nop
    ld   a, h
    cp   e
    cp   e
    rst  0
    add  a, $FF
    inc  a
    rst  $38
    nop
    rst  $38
    ld   a, [$FF0F]
    db   $E8 ; add  sp, d
    rst  $30
    db   $F4 ; Undefined instruction
    ei
    ld   a, [bc]
    db   $FD ; Undefined instruction
    push hl
    ld   e, $F3
    cpl
    cp   $31
    ld   a, h
    add  a, e
    nop
    rst  $38
    nop
    rst  $38
    adc  a, b
    ld   a, a
    adc  a, b
    ld   a, a
    ret  z
    ccf
    xor  b
    ld   e, a
    db   $E8 ; add  sp, d
    ld   e, a
    xor  d
    ld   e, l
    srl  l
    sub  a, d
    ld   a, l
    sub  a, e
    ld   a, h
    ret
    ld   a, $64
    rra
    ld   d, d
    cpl
    ld   c, b
    scf
    inc  h
    dec  de
    rra
    nop
    nop
    nop
    nop
    rst  $38
    ld   a, h
    add  a, e
    cp   e
    ld   a, h
    rst  $38
    ccf
    cp   a
    ld   b, a
    cp   a
    ld   a, b
    ld   a, b
    add  a, a
    jp   label_FF
    rst  $38
    adc  a, h
    ld   [hl], e
    ld   a, [$FF0F]
    nop
    rst  $38
    ld   [hl], b
    adc  a, a
    xor  b

label_4997B::
    ld   [hl], a
    rst  $38
    nop
    nop
    nop
    rlca
    nop
    inc  a
    inc  bc
    ld   c, b
    scf
    ld   e, b
    daa
    ld   a, l
    inc  bc
    rst  8
    add  hl, sp
    adc  a, a
    ld   a, h
    sub  a, e
    ld   a, h
    sub  a, a
    ld   a, e
    call z, label_BD37
    ld   b, [hl]
    db   $FD ; Undefined instruction
    ld   b, [hl]
    cp   c
    ld   b, [hl]
    ret
    ld   [hl], $99
    ld   h, [hl]
    ld    hl, sp+$07
    rst  $38
    nop
    ld   a, h
    cp   e
    cp   e
    rst  0
    db   $76 ; Halt
    rst  8
    db   $FC ; Undefined instruction
    rst  8
    jr   nc, label_4997B
    db   $FC ; Undefined instruction
    inc  bc
    ei
    db   $FC ; Undefined instruction
    add  a, b
    ld   a, a
    ld    hl, sp+$07
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    jr   nc, label_499B8
    ld   c, b
    rst  $38
    ld   c, c
    cp   $33
    cp   $03
    call c, label_E73B
    ld   a, h
    jp   label_A13E
    ld   e, [hl]
    db   $EB ; Undefined instruction
    ld   e, l
    xor  a
    ld   e, c
    cp   $03
    sbc  a, h
    ld   [hl], e
    adc  a, [hl]
    ld   a, c
    rst  0
    inc  a
    ld   h, a
    inc  e
    ld   d, a
    add  hl, hl
    ld   c, h
    inc  sp
    inc  h
    dec  de
    rra
    nop
    nop
    nop
    ld   a, h
    adc  a, a
    pop  af
    ld   c, $FB
    ld   h, l
    sbc  a, e
    push af
    dec  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  de
    db   $EC ; Undefined instruction
    db   $10
    db   $EF
    ei
    rlca
    db   $FC ; Undefined instruction
    di
    rlca
    ld    hl, sp+$71
    adc  a, [hl]
    xor  c
    db   $76 ; Halt
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    rlca
    ld   bc, label_30F
    rra
    rlca
    rra
    rlca
    ccf
    rrca
    ccf
    rrca
    ccf
    rra
    ld   a, a
    rra
    ld   a, a
    rra
    ld   a, a

label_49A1E::
    rra
    ld   a, a
    nop
    nop
    nop
    rrca
    nop
    ld   a, a
    rrca
    rst  $38
    ccf
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
    rst  0
    rst  $38
    add  a, e
    rst  $38
    add  a, e
    rst  $38
    add  a, e
    nop
    nop
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
    ld   bc, label_30F
    rra
    rlca
    ccf
    rrca
    ccf
    rrca
    ld   a, a
    rra
    ld   a, a
    rra
    ld   a, a
    ccf
    rst  $38
    ccf
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    rst  $38
    rra
    rst  $38
    ld   a, a
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
    add  a, a
    rst  $38
    inc  bc
    rst  $38
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
    ld   bc, label_300
    nop
    rlca
    ld   bc, $0107
    rrca
    inc  bc
    rrca
    inc  bc
    rrca
    rlca
    rra
    rlca
    rra
    rlca
    rra
    rlca
    rra
    rlca
    rra
    nop
    inc  bc
    nop
    rra
    inc  bc
    ld   a, a
    rrca
    rst  $38
    ccf
    rst  $38
    ld   a, a
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
    di
    rst  $38
    pop  hl
    rst  $38
    pop  hl

label_49ABC::
    rst  $38
    pop  hl
    rst  $38
    pop  hl
    rst  8
    ld   a, [$FFB7]
    rst  8
    ld   e, a
    cp   a
    ld   a, a
    cp   a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   b, e
    rst  $20
    add  hl, de
    ld   a, a
    add  a, c
    ld   a, a
    add  a, c
    ccf
    jp   label_F00F
    nop
    rst  $38
    rlca
    ld    hl, sp+$0F
    ld   a, [$FF4E]
    or   c
    rst  8
    ld   a, [$FFBF]
    jp   label_9967
    ld   a, a
    add  a, c
    rst  $38
    ld   bc, label_483FF
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    ld   a, a
    cp   a
    ld   e, a
    cp   a
    scf
    rst  8
    rrca
    ld   a, [$FF00]
    rst  $38
    rlca
    ld    hl, sp+$0F
    ld   a, [$FF4E]
    or   c
    rst  $38
    nop
    add  a, a
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    rst  $38
    nop
    ld   a, a
    nop
    ld   b, b
    ccf
    ld   b, c
    ld   a, $62
    dec  e
    di
    ld   l, l
    push af
    ld   l, e
    sub  a, [hl]
    ld   l, e
    sub  a, [hl]
    ld   l, e
    ld   h, [hl]
    dec  de
    ld   b, [hl]
    dec  sp
    ld   b, h
    dec  sp
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    ccf
    ld   [hl], b
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    ld   [hl], b
    adc  a, a
    cp   a
    ld   [hl], b
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    cp   a
    ld   a, a
    ld   h, h
    dec  de
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    sub  a, c
    ld   l, [hl]
    sub  a, b
    ld   l, a
    ld   h, b
    rra
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   h, b

label_49B53::
    rra
    ld   [hl], b
    rrca
    ld   e, b
    daa
    ld   c, a
    jr   nc, label_49BB5
    inc  a
    inc  h
    jr   label_49B77
    nop
    ld   a, a
    cp   h
    ld   e, [hl]
    cp   c
    scf
    ret  z
    rrca
    ld   a, [$FF00]
    rst  $38
    sbc  a, b
    ld   h, a
    sbc  a, a
    ld   h, b
    adc  a, a
    ld   [hl], b
    ld   b, b
    cp   a
    jr   nz, label_49B53
    nop
    rst  $38
    nop

label_49B77::
    rst  $38
    rst  $38
    nop
    ld   e, d
    inc  a
    inc  h
    jr   label_49B97
    nop
    rst  8
    ld   a, [$FFB7]
    rst  8
    ld   e, a
    cp   a
    ld   a, a
    cp   a
    cp   a
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, h
    cp   a
    ld   a, b
    ld   a, [hl]
    cp   c
    ld   e, a
    cp   b
    scf
    call z, label_F00F
    nop
    rst  $38
    rlca
    ld    hl, sp+$0F
    ld   a, [$FF4E]
    or   c
    rst  8
    ld   a, [$FFB7]
    call z, label_B95E
    ld   a, a
    cp   b
    cp   a
    ld   a, b
    rst  $38
    ld   a, h
    rst  $38
    ld   a, a
    cp   a
    ld   a, a
    ld   a, a
    cp   a
    ld   e, a
    cp   a
    scf

label_49BB5::
    rst  8
    rrca
    ld   a, [$FF00]
    rst  $38
    rlca
    ld    hl, sp+$0F
    ld   a, [$FF4E]
    or   c
    rst  8
    ld   a, [$FFB7]
    rst  8
    ld   e, a
    cp   a
    ld   a, a
    add  a, a
    rst  8
    inc  sp
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rlca
    ld   a, a
    cp   a
    ld   e, a
    cp   a
    scf
    rst  8
    rrca
    ld   a, [$FF00]
    rst  $38
    rlca
    ld    hl, sp+$0F
    ld   a, [$FF4E]
    or   c
    di
    rrca
    db   $ED ; Undefined instruction
    di
    ld   a, [$FEFD]
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    cp   $FF
    cp   $FF
    cp   $FD
    cp   $FE
    db   $FD ; Undefined instruction
    ld   a, [$ECFD]
    di
    ld   a, [$FF0F]
    nop
    rst  $38
    ld   [$FF1F], a
    ld   a, [$FF0F]
    ld   [hl], d
    adc  a, l
    nop
    nop
    nop
    nop
    rlca
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a
    jr   nc, label_49C8C
    scf
    ld   a, a
    ld   a, $3F
    ld   c, $0B
    rlca
    rra
    nop
    ccf
    jr   label_49C55
    dec  de
    rra
    nop
    rrca
    rlca
    rrca
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$C0
    db   $FC ; Undefined instruction
    ret  z
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ret  c
    ld    hl, sp+$D0
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    jr   label_49C33
    jr   label_49C71
    ret  nz
    db   $10
    db   $E0
    ld    hl, sp+$00
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    rlca
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a
    jr   nc, label_49CCC
    jr   nc, label_49CCE
    jr   nc, label_49C90
    inc  c
    rra
    rlca
    scf

label_49C55::
    jr   label_49C96
    db   $10
    db   $18
    rlca
    ld   [label_1F07], sp
    nop
    rrca
    nop
    nop
    nop
    nop

label_49C63::
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop

label_49C6A::
    cp   $0C
    cp   $0C
    cp   $0C
    db   $FC ; Undefined instruction

label_49C71::
    jr   nc, label_49C63
    ld   [$FFF8], a
    nop
    db   $FC ; Undefined instruction
    ld   [$C83C], sp
    ld    hl, sp+$00
    ld    hl, sp+$E0
    ld   a, [$FF00]
    jr   label_49C82

label_49C82::
    jr   c, label_49C94
    ld   a, $10
    ld   l, c
    ld   [hl], $DF
    ld   h, b
    rst  $38
    ld   c, [hl]

label_49C8C::
    rst  $38
    ld   a, [bc]
    rst  $38
    ld   c, [hl]

label_49C90::
    rst  $38
    ld   h, b
    cp   $61

label_49C94::
    rst  $18

label_49C95::
    ld   h, b

label_49C96::
    rst  $38
    ld   c, h

label_49C98::
    xor  a
    ld   b, [hl]
    rst  0
    inc  bc
    rlca
    ld   bc, label_207
    nop
    nop
    inc  bc
    nop
    rlca
    ld   [bc], a
    ld   [hl], a
    ld   [bc], a
    sub  a, l
    ld   h, d
    push af
    ld   [bc], a

label_49CAC::
    rst  $30
    nop
    rst  $38
    ld   [bc], a
    rra
    ld   [label_22DD], a
    rst  $10
    jr   nz, label_49CAC
    ld   [bc], a
    push af
    ld   h, d
    push hl
    jp   nz, label_2C5
    jp   label_780
    inc  bc
    inc  bc
    nop
    rra
    ld   bc, label_D3B
    ld   e, e
    dec  l
    db   $DB
    inc  l

label_49CCC::
    ret  c
    cpl

label_49CCE::
    rst  $18
    cpl
    rst  $18
    jr   nz, label_49CB2
    jr   nz, label_49C95
    ccf
    rst  $18
    jr   nz, label_49C98
    ld   c, a
    cp   a
    ld   c, d
    cp   a
    ld   c, a
    rst  $38
    nop
    ret  nz
    add  a, b
    add  a, b
    nop
    ld   a, [$FF00]
    cp   b
    ld   h, b
    or   h
    ld   l, b
    or   [hl]
    ld   l, b
    ld   [hl], $E8
    or   $E8
    or   $08
    or   $08
    ld   b, $F8
    or   $08
    ld   a, [$FAE4]
    and  h
    ld   a, [$FEE4]
    nop
    scf
    nop
    ld   e, a
    jr   nz, label_49D83
    nop
    ld   a, a
    nop
    ld   d, l
    ld   l, $7F
    ld   a, [bc]
    sub  a, l
    ld   l, [hl]
    sbc  a, $61
    cp   h
    ld   b, e
    cp   $11
    ccf
    add  hl, de
    cpl
    rra
    rla
    rrca
    rrca
    nop
    dec  de
    dec  c
    rra
    nop
    nop
    nop
    jr   c, label_49D24

label_49D24::
    inc  a
    jr   label_49CF5
    inc  a
    ld   b, $FC
    ld   b, $FC
    inc  e
    ld   [rDIV], a
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    ld   bc, label_5FE
    ld   a, [$FC83]
    jp   nz, label_FEBC
    nop
    ret  c
    ld   [$FFF0], a
    nop
    nop
    nop
    scf
    nop
    ld   e, a
    jr   nz, label_49DC5
    nop
    ld   a, a
    nop
    ld   d, l
    ld   l, $7F

label_49D4D::
    ld   a, [bc]
    sub  a, l
    ld   l, [hl]
    sbc  a, $61
    cp   h
    ld   b, e
    cp   $11
    ccf
    add  hl, de
    ccf
    rra
    add  hl, de
    ld   b, $1F
    add  hl, bc
    rra
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    ld   l, $1C
    adc  a, $30
    ld   de, label_23EE
    call c, label_FA05
    ld   bc, label_1FE
    cp   $01
    cp   $82
    db   $FC ; Undefined instruction
    and  h
    ret  c
    ret  c
    jr   nz, label_49D4D
    ld   [$FFF0], a
    nop
    inc  bc
    nop
    rrca

label_49D83::
    ld   [bc], a
    dec  de
    inc  c
    rla
    ld   [label_40F], sp
    ld   e, $09
    ccf
    inc  c
    ld   c, [hl]
    ld   sp, label_4B987
    sub  a, [hl]
    ld   l, c
    ld   [hl], a
    ld   c, $17
    rrca
    dec  bc
    rlca
    ld   c, $01
    ld   de, label_1F0E
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   [hl], e
    nop
    xor  a
    ld   d, b
    adc  a, a
    ld   [hl], h
    ld   e, [hl]
    add  hl, hl
    ld   d, a
    inc  l
    ld   l, $11
    daa
    add  hl, de
    ld   h, $19
    rla
    ld   c, $17
    rrca
    dec  bc
    rlca
    inc  d
    dec  bc
    rra
    nop
    ld   bc, label_300
    nop
    dec  b

label_49DC5::
    ld   [bc], a
    add  hl, bc
    ld   b, $08
    rlca
    db   $10
    db   $0F
    ld   sp, label_4870E
    add  hl, sp
    adc  a, a
    ld   [hl], a
    xor  a
    ld   d, a
    ld   [hl], a
    dec  bc
    rla
    rrca
    dec  bc
    rlca
    ld   c, $01
    ld   de, label_1F0E
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_4A300
    nop
    sub  a, l
    ld   h, d
    adc  a, c
    db   $76 ; Halt
    ret  z
    scf
    ld   b, c
    ld   a, $27
    add  hl, de
    cpl
    rla
    cpl

label_49DF5::
    rla
    rla
    dec  bc
    rla
    rrca
    dec  bc
    rlca
    inc  d
    dec  bc
    rra
    nop

label_49E00::
    jr   c, label_49E02

label_49E02::
    ld   a, b
    jr   nc, label_49DF5
    ld   b, b
    rst  $20
    nop
    cp   a
    ld   h, a
    rst  $28
    rra
    ld   d, a
    ld   a, $5F
    inc  l
    ld   a, a
    inc  c
    ld   a, a
    inc  [hl]
    ei
    ld   [hl], a
    db   $F4 ; Undefined instruction
    ld   e, e
    rst  $38
    ld   h, b
    ld  [$FF00+C], a
    ld   e, l
    pop  bc
    ldi  [hl], a
    nop
    ld   bc, $0003
    ld   h, a
    ld   [bc], a
    ld   a, [$DC64]

label_49E27::
    jr   nz, label_49E27
    adc  a, h
    ei
    sub  a, $DD
    ld   l, d
    cp   $69
    call nc, label_49C6A
    ld  [$FF00+C], a
    cp   h
    jp   nz, label_9C63
    rst  0
    db   $3A ; ldd  a, [hl]
    db   $FD ; Undefined instruction
    add  a, $3A
    call c, label_FC
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  c
    nop
    ld   [de], a
    inc  c
    ldi  [hl], a
    inc  e
    ldi  [hl], a
    inc  e
    ld   e, d
    inc  l
    ld   e, e
    inc  l
    ld   e, h
    dec  sp
    cp   [hl]
    ld   e, c
    cp   e
    ld   [hl], h
    cp   l
    db   $76 ; Halt
    ld   [hl], a
    inc  l
    ld   e, a
    inc  l
    ccf
    rrca
    rra
    rrca
    rla
    rrca
    dec  bc
    rlca
    rlca
    inc  bc
    ld   [bc], a
    ld   bc, $0007
    ld   c, $07
    rrca
    nop
    sbc  a, h
    nop
    db   $F4 ; Undefined instruction
    adc  a, b
    ld   a, [hl]
    add  a, b
    xor  a
    ld   [hl], b
    rst  $38
    ld   d, b
    xor  h
    ld   [hl], b
    ld   a, [hl]
    add  a, b
    ld   de, $83EE
    db   $FC ; Undefined instruction
    add  a, l
    ld   a, d
    add  a, c
    ld   a, [hl]
    add  a, d
    ld   a, h
    add  a, $B8
    ld   sp, hl
    ld   b, $FB
    inc  e
    cp   $00
    inc  a
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [hl]
    nop
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_49EE6

label_49EE6::
    inc  a
    nop
    inc  a
    nop
    jr   label_49EEC

label_49EEC::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  sp
    nop
    dec  l
    inc  de
    inc  sp
    ld   e, $44
    dec  sp
    db   $E4 ; Undefined instruction
    dec  de
    add  a, [hl]
    ld   a, a
    pop  af
    ld   l, [hl]
    ld   a, [hl]
    ld   bc, label_173F
    ccf
    nop
    inc  b
    nop
    ld   [label_800], sp
    nop
    inc  c
    nop
    ld   b, $00
    ld   [bc], a
    nop
    db   $E3 ; Undefined instruction
    nop
    sub  a, c
    ld   h, b
    adc  a, e
    ld   [hl], b
    dec  h
    jp  c, label_BC42
    ld   b, d
    cp   h
    ld   b, [hl]
    cp   b
    ld   [hl], h
    adc  a, b
    db   $E4 ; Undefined instruction
    ld   a, b

label_49F3E::
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    add  hl, de
    nop
    ld   d, $09
    add  hl, de
    rrca
    ldi  [hl], a
    dec  e
    ld   [hl], d
    dec  c
    ld   b, e
    ccf
    ld   a, b
    scf
    ccf
    nop
    ld   e, $0F
    scf
    ld   e, $3F
    dec  d
    dec  sp
    inc  b
    ld   [hl], l
    db   $3A ; ldd  a, [hl]
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    jp   label_C680
    nop
    ld   b, h
    add  a, b
    inc  h
    ret  nz
    ld   d, $E0
    sub  a, e
    ld   h, b
    add  hl, bc
    ld   a, [$FF09]
    ld   a, [$FFCB]
    or   b
    rst  8
    or   b
    ld   a, [label_4AC04]
    ld   a, [$FFF8]
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38

label_4A000::
    nop
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
    inc  b
    rrca
    nop
    rrca
    db   $10
    db   $1F
    nop
    rra
    nop
    rra
    ld   [label_E1B], sp
    ld   e, $03
    rrca
    nop
    inc  bc
    inc  b

label_4A01E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    jr   nz, label_4A09D
    add  a, b
    ld   a, [$FF08]
    ld   e, b
    ld   [$FFF8], a
    and  b
    ld   e, b
    ld   [$FFF8], a
    nop
    ld   a, [$FF08]
    ld   a, [$FF00]
    ret  nz
    jr   nz, label_4A03F

label_4A03F::
    nop
    nop
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
    inc  b
    rrca
    nop
    rrca
    db   $10
    db   $1F
    inc  c
    rra
    dec  bc
    rrca
    ld   [bc], a
    rla
    ld   [label_F10], sp
    rrca
    nop
    inc  bc
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

label_4A06A::
    ret  nz
    jr   nz, label_4A0DD
    add  a, b
    ld   a, [$FF08]
    xor  b
    ld   [hl], b
    ld    hl, sp+$50
    xor  b
    ld   a, [$FF78]
    add  a, b
    ld   a, [$FF08]
    ld   a, [$FF00]
    ret  nz
    jr   nz, label_4A07F

label_4A07F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    jr   label_4A091
    ld   h, $19
    daa
    ld   a, [de]
    ld   c, a
    inc  sp
    ld   e, a

label_4A091::
    dec  hl
    ccf
    rrca
    rra
    rlca
    rra
    ld   a, [bc]
    rra
    dec  c
    rra
    nop
    ccf

label_4A09D::
    dec  de
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    jr   nz, label_4A06A
    inc  e
    ld   [$FF82], a
    ld   a, h
    jp   nc, label_FA2C
    ld   d, h
    db   $FC ; Undefined instruction
    ld   a, [$FFEA]
    inc  d
    ld   sp, hl
    add  a, $CD
    or   d
    push de
    ld   a, [hli]
    ld   h, [hl]
    sbc  a, b
    db   $FC ; Undefined instruction
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a

label_4A0DD::
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  e
    ld   e, $21
    ld   l, $51
    ld   a, $41
    inc  a
    ld   b, d
    nop
    inc  a
    nop
    nop
    nop

label_4A0FF::
    nop
    nop
    nop
    ld   bc, $0100
    nop
    inc  bc
    ld   bc, $0103
    rrca
    nop
    ld   e, $01
    rra
    jr   nz, label_4A14F
    ld   bc, $013F
    ld   a, $11
    scf
    inc  e
    dec  a
    ld   b, $1F
    nop
    rlca
    ld   [$0000], sp
    ret  nz
    nop
    and  $C0
    rst  $28
    add  a, $FF
    adc  a, [hl]
    rst  $18
    ld   l, [hl]
    sbc  a, a
    ld   h, [hl]
    rst  $38
    ld   c, $FF
    ld   c, $BF
    add  a, $F6
    ld   b, b
    or   b
    ret  nz
    ld   a, [$FF00]
    ld   [rNR10], a
    ld   [rJOYP], a
    add  a, b
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    inc  bc
    ld   bc, $000F
    ld   e, $01
    rra

label_4A14F::
    jr   nz, label_4A190
    jr   label_4A192
    ld   d, $1F
    dec  b
    ld   l, $11
    ld   hl, label_1F1E
    nop
    rlca
    ld   [$0000], sp
    nop
    nop
    ret  nz
    nop
    and  $C0
    rst  $28
    add  a, $FF
    adc  a, [hl]
    rst  $18
    ld   l, [hl]
    rst  $18
    ld   h, $FF
    ld   c, $5F
    xor  $FF
    and  [hl]
    ld   d, [hl]
    ld   [$FFF0], a
    nop
    ld   [rNR10], a
    ld   [rJOYP], a
    add  a, b
    ld   b, b
    nop
    nop
    nop
    nop
    db   $10
    db   $10
    nop
    nop
    nop
    add  a, d
    nop
    jr   c, label_4A1C3
    ld   a, h
    ld   e, h
    cp   $3E
    ld   a, a

label_4A190::
    ld   a, [hl]
    rst  $38

label_4A192::
    rlca
    rst  $38
    inc  bc
    rlca
    ld   bc, label_48103
    ld   b, e
    ld   bc, $0013
    ld   bc, $0100
    nop
    ret  nz
    nop
    ld   h, b
    nop
    ld   [hl], c
    nop
    inc  sp
    nop
    scf
    nop
    ld   [hl], $00
    ld   d, $00
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

label_4A1C3::
    nop
    nop
    nop
    jr   nc, label_4A1D8
    jr   nc, label_4A1DA
    inc  e
    inc  c
    rrca
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

label_4A1D8::
    nop
    nop

label_4A1DA::
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld   [label_1107], sp
    rrca
    inc  de
    rrca
    dec  bc
    rlca
    add  hl, bc
    rlca
    ld   [label_407], sp
    inc  bc
    inc  bc
    nop
    nop
    nop

label_4A1FC::
    nop
    nop
    nop
    nop
    dec  d
    nop
    rra
    nop
    rra
    nop
    ccf
    rlca
    ld   a, a
    dec  l
    ld   a, a
    jr   z, label_4A268
    scf
    jr   c, label_4A227
    ccf
    db   $10
    db   $3F
    ld   [label_277F], sp
    ld   [hl], a
    jr   z, label_4A24C
    rrca
    ld   e, $01
    dec  a
    ld   e, $1F
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction

label_4A227::
    ld   [$FFFE], a
    or   h
    cp   $B4
    db   $3A ; ldd  a, [hl]

label_4A22D::
    db   $FC ; Undefined instruction
    inc  a
    ret  z
    db   $FC ; Undefined instruction
    jr   label_4A22D
    inc  [hl]
    ld   a, [$FF00+C]
    ld   a, [$FC34]
    or   b
    jr   c, label_4A1FC
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    ld   [hl], e
    nop
    rst  $38
    ld   [hl], b
    rst  $38
    ld   [hl], l
    rst  $38
    ld   h, b
    ei
    rlca
    sbc  a, b
    ld   h, a

label_4A24C::
    sbc  a, a
    ld   h, b
    ld   c, a
    jr   nc, label_4A2A0
    ld   [hl], $2B
    ld   d, $15
    dec  bc
    dec  de
    inc  c
    daa
    rra
    ld   a, b
    rlca
    rst  $30
    ld   a, b
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop

label_4A268::
    rst  $38
    nop
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    and  b
    db   $FC ; Undefined instruction
    and  b
    ld   a, [hl]
    ld   a, [$FF7E]
    sub  a, h
    cp   $1C
    ld   a, [$FC3C]
    ld   a, b
    ld   a, [$B974]
    add  a, $FD
    ld   a, [de]
    cp   [hl]

label_4A299::
    ret  c
    ld   e, $E0
    rst  $28
    ld   e, $FF
    nop

label_4A2A0::
    nop
    nop
    nop

label_4A2A3::
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    dec  b
    inc  bc
    add  hl, bc
    rlca
    db   $10
    db   $0F
    db   $10
    db   $0F
    db   $10
    db   $0F
    inc  c
    inc  bc
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0000
    nop
    nop
    nop
    ld   h, c
    nop
    ld   [hl], c
    jr   nz, label_4A306
    db   $10
    db   $1F
    nop
    inc  d
    rrca
    ld   l, a
    dec  de

label_4A2CE::
    rst  $28
    ld   e, e
    ld   l, a
    dec  de
    inc  d
    rrca
    rra
    nop
    ccf
    db   $10
    db   $6F
    jr   nc, label_4A2CE
    ld   b, c
    jp   label_101
    nop
    add  a, b
    nop
    jp   label_CF80
    add  a, d
    cp   $0C
    db   $F4 ; Undefined instruction
    jr   label_4A2A3
    ret  nz
    ret  c
    ld   h, b
    sbc  a, $60
    rst  $18
    ld   l, [hl]
    cp   [hl]
    ret  nz
    ld    hl, sp+$00
    ld    hl, sp+$10
    db   $EC ; Undefined instruction
    jr   label_4A299
    inc  b
    add  a, [hl]
    nop
    nop
    nop

label_4A300::
    rlca
    nop
    db   $E8 ; add  sp, d
    rlca
    sub  a, c
    ld   l, a

label_4A306::
    ld   d, e
    cpl
    ld   hl, label_2C1F
    rra
    cpl
    dec  de
    cpl
    add  hl, de
    scf
    dec  c
    ld   d, a
    cpl
    sbc  a, h
    ld   h, e
    and  l
    ld   b, e
    rst  8
    nop
    inc  de
    rrca
    rra
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    ld   [label_4B107], sp
    rrca
    sub  a, e
    ld   l, a
    pop  hl
    rra
    inc  l
    rra
    ld   l, a
    dec  de
    xor  a
    ld   e, c
    or   a
    ld   c, l
    rst  $30
    rrca
    inc  c
    inc  bc
    dec  b
    inc  bc
    rrca
    nop
    inc  de
    rrca
    rra
    nop
    inc  e
    nop
    inc  de
    inc  c
    ld   l, l
    inc  bc
    ld   d, a
    ldi  [hl], a
    ld   a, e
    daa
    ld   a, e
    cpl
    ld   a, e
    ld   l, $7B
    cpl
    ld   [hl], c
    cpl
    ld   e, h
    inc  hl
    ld   e, a
    jr   nz, label_4A3C6
    inc  bc
    add  hl, bc
    ld   b, $13
    inc  c
    inc  e
    nop
    nop
    nop
    ld   a, [$FF00]
    db   $EC ; Undefined instruction
    ld   a, [$FFEA]
    inc  a
    db   $7E
    ld   a, [hl]
    db   $FE
    cp   $C9
    cp   $E1
    ld   a, [hl]
    pop  hl
    ld   a, $E1
    cp   [hl]
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    ld   a, $C0
    cp   $18
    ld   a, [$FF00+C]
    ld   sp, hl
    ld   b, $07
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    ld   bc, label_6CB
    xor  a
    ld   b, h
    rst  $30
    ld   c, a
    rst  $30
    ld   e, a
    rst  $30
    ld   e, h
    rst  $30
    ld   e, [hl]
    db   $E3 ; Undefined instruction
    ld   e, a
    cp   c
    ld   b, a
    cp   [hl]
    ld   b, c
    rst  $18
    ld   b, $09
    ld   b, $09
    ld   b, $05
    ld   [bc], a
    inc  bc
    nop
    ld   [rJOYP], a
    ret  c
    ld   [$FFD4], a
    ld   a, b
    cp   d
    db   $FC ; Undefined instruction
    cp   d
    db   $FC ; Undefined instruction
    sub  a, d
    db   $FC ; Undefined instruction
    jp   nz, label_C2FC
    ld   a, h
    jp   nz, label_C47C
    ld    hl, sp+$3C
    ret  nz
    ld   a, h
    or   b
    call z, label_C830
    jr   nc, label_4A40D
    jr   nz, label_4A41F
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_4A3C6::
    rlca
    nop
    add  hl, bc
    ld   b, $13
    dec  c
    rla
    dec  bc
    rla
    dec  bc
    rla
    add  hl, bc
    add  hl, de
    ld   b, $11
    ld   c, $08
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   e, d
    inc  a
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    inc  a
    ld   e, d
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_4A3FC::
    nop
    nop
    nop
    nop
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    jr   nz, label_4A40A
    ld   d, b
    rst  $38

label_4A40D::
    ld   d, b
    rst  $38
    jr   nz, label_4A410
    nop
    cp   a
    ld   b, b
    rst  $38
    jr   nc, label_4A48E
    ld   a, $7E
    rla
    ccf
    ld   [bc], a
    rra
    nop
    rlca

label_4A41F::
    nop
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    jr   nz, label_4A4A8
    db   $10
    db   $FF
    ld   d, b
    rst  $38

label_4A42D::
    jr   nz, label_4A42D
    rlca
    rst  $30
    ld   e, $FF
    ldd  [hl], a
    cp   a
    ld   d, b
    ld   e, a
    jr   nz, label_4A498
    jr   nz, label_4A462
    jr   label_4A456
    rlca
    rlca
    nop
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   b, b
    rst  $38
    ld   h, b
    rst  $38
    ld   e, b
    rst  $38
    inc  de

label_4A456::
    ld   a, a
    ld   [bc], a
    ld   a, a
    nop
    ccf
    nop
    rra
    nop
    rlca
    nop
    ld   [rJOYP], a

label_4A462::
    ld   a, b
    add  a, b
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $C0
    rst  $38
    jr   nz, label_4A46C
    jr   nz, label_4A46E
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    ld   h, b
    rst  $38
    ld   d, b
    rst  $38
    ld   e, b

label_4A48E::
    ld   a, a
    inc  e
    ccf
    ld   [bc], a
    ld   e, a
    inc  hl
    rst  $38
    ld   b, b
    db   $FC ; Undefined instruction
    ld   b, e

label_4A498::
    ld   a, e
    inc  a
    ccf
    nop
    rra
    nop
    rlca
    nop
    ld   [rJOYP], a
    ld   a, b
    add  a, b
    db   $FC ; Undefined instruction
    nop
    cp   $60

label_4A4A8::
    cp   $90
    rst  $38
    sub  a, b
    rst  $38
    ld   h, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_4A4D4::
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rra
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   e, d
    inc  a
    ld   a, [hl]
    inc  h
    ld   a, [hl]
    inc  h
    ld   e, d
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], $00
    ld   e, [hl]
    jr   nz, label_4A587
    nop
    ld   a, a
    ld   c, $7F
    ccf
    ld   a, a
    dec  de
    rst  $18
    ld   l, e
    sbc  a, a
    ld   l, a
    cp   a
    ld   b, a
    ld    hl, sp+$07
    jr   nz, label_4A539
    jr   label_4A523
    scf
    jr   label_4A55E
    nop
    nop
    nop
    nop

label_4A523::
    nop
    nop
    nop
    jr   c, label_4A528

label_4A528::
    ld   a, h
    jr   c, label_4A527
    ld   h, b
    cp   $DC
    cp   $B8
    cp   [hl]
    db   $F4 ; Undefined instruction
    cp   $FC
    db   $3A ; ldd  a, [hl]
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$48

label_4A539::
    or   b
    or   b
    ld   b, b
    and  b
    ret  nz
    ld   [rJOYP], a
    nop
    nop
    ld   [hl], $00
    ld   e, [hl]
    jr   nz, label_4A5C5
    nop
    ld   a, a
    ld   c, $7F
    ccf
    ld   a, a
    dec  de
    rst  $18
    ld   l, e
    sbc  a, a
    ld   l, a
    cp   [hl]
    ld   b, a
    rst  $38
    ld   b, $21
    ld   e, $11
    ld   c, $0F
    nop
    rlca
    inc  bc

label_4A55E::
    rlca
    nop
    nop
    nop
    nop
    nop
    ld   [hl], b

label_4A565::
    nop
    ld   a, b
    jr   nc, label_4A565
    ld   a, b
    db   $F4 ; Undefined instruction
    ld    hl, sp+$FC
    ld    hl, sp+$D8
    ld   [$FFFC], a
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    xor  $F4
    db   $76 ; Halt
    ld    hl, sp+$84
    ld   a, b
    ld   a, h
    add  a, b
    ld   a, [$FF80]
    ld   [rJOYP], a
    nop
    nop
    jr   nc, label_4A584

label_4A584::
    jr   z, label_4A596
    add  hl, hl

label_4A587::
    db   $10
    db   $26
    add  hl, de
    jr   nz, label_4A5AB
    ld   a, [hli]
    dec  d
    ld   c, d
    dec  [hl]
    ret  nz
    ld   a, a
    ret  c
    ld   h, a
    ld   b, c
    ld   a, $43
    inc  a
    ld   a, $01
    db   $10
    db   $0F
    dec  de
    dec  c
    rra
    nop
    nop
    nop
    ld   h, b
    nop
    and  b
    ld   b, b
    ld   h, [hl]
    ret  nz
    rst  $28
    ret  nz
    rst  8

label_4A5AB::
    add  a, b
    dec  hl
    call nz, label_EE31
    ld   [hl], c
    adc  a, $72
    db   $EC ; Undefined instruction
    ld   a, [$FF00+C]
    inc  d
    db   $E8 ; add  sp, d
    ld   [label_484F0], sp
    cp   b
    db   $FC ; Undefined instruction
    sbc  a, b
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    ld   h, b
    nop
    and  b

label_4A5C5::
    ld   b, b
    ld   a, b
    ret  nz
    db   $FC ; Undefined instruction
    ret  nz
    db   $FC ; Undefined instruction
    add  a, b
    ld   h, $D8
    ldd  [hl], a
    db   $EC ; Undefined instruction
    ld   [hl], d
    call z, label_EC72
    db   $F4 ; Undefined instruction
    ld   [$E814], sp
    ld   [label_484F0], sp
    cp   b
    db   $FC ; Undefined instruction
    sbc  a, b
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop

label_4A5E4::
    nop
    nop
    nop
    nop
    jp   label_E700
    ld   b, d
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    inc  h
    inc  a
    nop
    nop
    nop
    nop
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
    nop
    jr   label_4A60B
    ld   h, $19
    daa
    ld   a, [de]
    ld   c, a
    inc  sp
    ld   e, a

label_4A60B::
    dec  hl
    ccf
    rrca
    rra
    dec  c
    rla
    dec  c
    dec  hl
    rla
    cpl
    db   $10
    db   $3F
    dec  c
    rra
    dec  c
    dec  e
    ld   [bc], a
    rla
    rrca
    rra
    nop
    ret  nz
    nop
    jr   nz, label_4A5E4
    inc  e
    ld   [$FF82], a
    ld   a, h
    jp   nc, label_FA2C
    ld   d, h
    db   $FC ; Undefined instruction
    ret  nc
    ld   [$B2F4], a
    call z, label_9E61
    pop  de
    ld   l, $D1
    xor  [hl]
    jp   nc, label_8CAC
    ld   [hl], b
    adc  a, b
    ld   a, [$FFF8]
    nop
    rlca
    nop
    ld   [label_3107], sp
    ld   c, $43
    dec  a
    ld   d, a
    add  hl, hl
    ld   a, a
    dec  d
    ccf
    rla
    ld   e, a
    cpl
    adc  a, e
    ld   [hl], a
    add  a, l
    ld   a, e
    add  a, a
    ld   a, b
    ld   c, a
    ld   [hl], $3F
    ld   b, $16
    add  hl, bc
    inc  de
    rrca
    rra
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, sp
    rlca
    ld   b, b
    ccf
    ld   b, b
    ccf
    jr   nz, label_4A68B
    jr   nc, label_4A67D
    jr   nz, label_4A68F
    db   $10
    db   $0F
    jr   nz, label_4A693
    jr   nz, label_4A695
    jr   nc, label_4A687
    inc  e
    inc  bc
    inc  hl
    inc  e
    jr   nz, label_4A69D
    ccf
    nop
    rlca
    nop
    jr   c, label_4A68B
    ld   d, b
    cpl
    ld   b, c

label_4A687::
    ld   a, $51
    ld   l, $3F

label_4A68B::
    db   $10
    db   $3F
    dec  d
    ld   e, a

label_4A68F::
    dec  l
    sbc  a, a
    ld   h, a
    sbc  a, a

label_4A693::
    ld   h, e
    or   a

label_4A695::
    ld   c, b
    ld   a, h
    rla
    dec  sp

label_4A699::
    rla
    jr   nc, label_4A6AB
    rra

label_4A69D::
    rrca
    rra
    nop
    ld   [rJOYP], a
    inc  e
    ld   [$FF8A], a
    ld   [hl], h
    jp   nz, label_CABC
    or   h
    db   $FC ; Undefined instruction

label_4A6AB::
    adc  a, b
    cp   $A8
    ld   sp, hl
    or   [hl]
    ld   sp, hl
    and  $F9
    add  a, $EE
    db   $10
    db   $7C
    ret  c
    cp   h
    ret  c
    inc  e
    ld   [$FF08], a
    ld   a, [$FFF8]
    nop
    rrca
    nop
    ld   [hl], $0F
    ld   h, b
    ccf
    ld   e, b
    daa
    ld   a, h
    dec  bc
    rra
    ld   [label_A1F], sp
    ccf
    ld   a, [de]
    ccf
    rra
    ld   e, $0F
    rrca
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    nop
    ld   [label_F07], sp
    nop
    add  a, b
    nop
    ld   h, b
    add  a, b
    db   $10
    db   $E0
    inc  e
    ld   [rDIV], a
    ld    hl, sp+$74
    adc  a, b
    ld   a, b
    and  b
    ret  c
    ld   h, b
    and  h
    ret  c
    ld   b, h
    cp   b
    jp   nz, label_E23C
    inc  e
    cp   h
    ld   b, b
    db   $10
    db   $E0
    ld   [$F8F0], sp
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a
    jr   nc, label_4A78C
    scf
    ld   a, a
    ld   a, $3F
    ld   c, $0B
    rlca
    rra
    nop
    ccf
    jr   label_4A755
    dec  de
    rra
    nop
    rrca
    rlca
    rrca
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$C0
    db   $FC ; Undefined instruction
    ret  z
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ret  c
    ld    hl, sp+$D0
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    jr   label_4A733
    jr   label_4A771
    ret  nz
    db   $10
    db   $E0
    ld    hl, sp+$00
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    rlca
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a
    jr   nc, label_4A7CC
    jr   nc, label_4A7CE
    jr   nc, label_4A790
    inc  c
    rra
    rlca
    scf

label_4A755::
    jr   label_4A796
    db   $10
    db   $18
    rlca
    ld   [label_1F07], sp
    nop
    rrca
    nop
    nop
    nop
    nop

label_4A763::
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    cp   $0C
    cp   $0C
    cp   $0C
    db   $FC ; Undefined instruction

label_4A771::
    jr   nc, label_4A763
    ld   [$FFF8], a
    nop
    db   $FC ; Undefined instruction
    ld   [$C83C], sp
    ld    hl, sp+$00
    ld    hl, sp+$E0
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    rrca
    nop
    rra
    nop
    rra
    inc  b
    rra
    inc  b

label_4A78C::
    rrca
    rlca
    rra
    dec  b

label_4A790::
    rra
    dec  c
    ccf
    rlca
    ccf
    jr   label_4A7D6
    ld   d, $1F
    ld   b, $07
    nop
    inc  bc
    ld   bc, $0007
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$F0
    ret  nc
    ld   [$FFA0], a
    ret  nz
    ld   [rJOYP], a
    ld   a, [$FF00]
    db   $10
    db   $E0
    ld   a, [$FF00]
    ld   [$FFC0], a
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ccf
    nop

label_4A7CA::
    ccf
    ld   [label_83F], sp

label_4A7CE::
    rra
    ld   c, $3F
    dec  bc
    ccf
    dec  de
    ld   a, a
    nop

label_4A7D6::
    ld   a, a
    jr   c, label_4A817
    add  hl, de
    inc  a
    inc  bc
    ld   b, a
    jr   c, label_4A85E
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FFE0]
    ld   [$FF80], a
    ret  nz
    nop
    ld   a, [$FF00]
    jr   c, label_4A7CA
    ld   a, b
    or   b
    ld   a, [$FF60]
    ld    hl, sp+$00
    nop
    nop
    inc  bc
    nop
    rrca
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_4A817::
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rrca
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    nop
    rrca
    nop
    rra
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop

label_4A85E::
    ccf
    nop
    rst  $38
    nop
    db   $DB
    ld   h, a
    ld    hl, sp+$07
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    db   $DB
    ld   h, a
    sbc  a, b
    ld   h, a
    rst  $38
    nop
    rst  $38
    nop
    db   $DB
    ld   h, a
    ld    hl, sp+$07
    rst  $18
    ld   h, b
    rst  $18
    ld   h, b
    db   $DB
    ld   h, a
    sbc  a, b
    ld   h, a
    rst  $38
    nop
    rlca
    nop

label_4A882::
    rra
    nop
    ccf
    nop
    ld   a, a
    nop

label_4A888::
    ld   c, a
    jr   nc, label_4A882
    jr   c, label_4A888
    inc  a
    rst  $38
    inc  a
    db   $3E
    ld   a, $FF
    ld   e, $EF
    ld   e, $77
    ld   c, $7D
    ld   [bc], a
    ccf
    nop
    rra
    nop
    rlca
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
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rlca
    nop
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
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    nop
    rra
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    rra
    nop
    rra
    nop
    rrca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rra
    nop
    rlca
    nop
    nop
    nop
    inc  e
    nop
    ld   a, $00
    ld   a, a
    nop
    rst  $38
    nop
    rst  8
    nop
    rrca
    nop
    rrca
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    nop
    nop
    ld   a, $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    pop  af
    rst  $38
    ld   a, c
    rst  $38
    add  hl, de
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    jr   label_4A946

label_4A946::
    ld   a, [hli]
    db   $10
    db   $5D
    ldd  [hl], a
    ld   [hl], a
    db   $3A ; ldd  a, [hl]
    cp   a
    ld   a, e
    cp   a
    ld   a, [hl]
    or   a
    ld   a, [hl]
    and  a
    ld   a, a
    sbc  a, e
    ld   h, a
    and  [hl]
    ld   b, c
    and  c
    ld   b, b
    ret  nz
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
    nop
    dec  b
    ld   [bc], a
    rlca
    ld   [bc], a
    dec  bc
    rlca
    dec  bc
    ld   b, $0F
    ld   b, $17
    rrca
    dec  d
    rrca
    inc  d
    rrca
    inc  de
    inc  c
    inc  d
    ld   [label_814], sp
    inc  d
    ld   [$0018], sp
    inc  bc
    nop
    inc  b
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    ld   [bc], a
    ld   bc, label_172
    adc  a, h
    ld   [hl], e
    or   c
    ld   a, a
    or   c
    ld   a, a
    adc  a, h
    ld   [hl], e
    ld   [hl], d
    ld   bc, $0102
    dec  b
    inc  bc
    dec  b
    inc  bc
    inc  b
    inc  bc
    inc  bc
    nop
    nop
    nop
    jr   c, label_4A9A4

label_4A9A4::
    ld   b, h
    jr   c, label_4AA01
    inc  a
    ld   e, d
    inc  a
    ld   hl, label_181E
    rlca
    dec  b
    inc  bc
    dec  b
    inc  bc
    jr   label_4A9BB
    ld   hl, label_49A1E
    inc  a
    ld   e, d
    inc  a
    ld   b, h

label_4A9BB::
    jr   c, label_4A9F5
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_4A9F5::
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rra
    nop
    nop

label_4AA01::
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    nop
    rra
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    rra
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_4AA32::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_4AA38::
    rst  8
    jr   nc, label_4AA32
    jr   c, label_4AA38
    inc  a
    rst  $38
    inc  a
    db   $3E
    ld   a, $FF
    ld   e, $EF
    ld   e, $F7
    ld   c, $FD
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    nop
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
    nop
    rrca
    nop
    rra
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    nop
    nop
    rra
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_4AA92::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_4AA98::
    rst  8
    jr   nc, label_4AA92
    jr   c, label_4AA98
    inc  a
    rst  $38
    inc  a
    db   $3E
    ld   a, $FF
    ld   e, $EF
    ld   e, $F7
    ld   c, $FD
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
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
    inc  bc
    nop
    rlca
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_4AAF2::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_4AAF8::
    rst  8
    jr   nc, label_4AAF2
    jr   c, label_4AAF8
    inc  a
    rst  $38
    inc  a
    db   $3E
    ld   a, $FF
    ld   e, $EF
    ld   e, $F7
    ld   c, $FD
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    rlca
    nop
    rrca
    nop
    rrca
    nop
    rra
    nop
    rra
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  bc
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rrca
    nop
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
    inc  bc
    nop
    rra
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    nop
    inc  bc
    nop
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
    nop
    nop
    nop
    rlca
    nop
    rra
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop

label_4AC04::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  bc
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  hl, de
    nop
    rra
    nop
    ccf
    nop
    cp   a
    nop
    rst  $38
    nop
    ei
    inc  e
    db   $FD ; Undefined instruction
    ld   e, $EF
    ld   e, $F7
    ld   c, $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    nop
    inc  c
    nop
    sbc  a, $00
    cp   $00
    ld   a, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  hl, de
    nop
    rra
    nop
    ccf
    nop
    cp   a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, h
    nop
    inc  e
    nop
    nop
    nop
    inc  c
    nop
    inc  c
    nop
    add  a, $00
    ld   a, [$FF00+C]
    ld   a, [de]
    nop
    rrca
    nop
    rst  $38
    nop
    rst  8
    nop
    rra
    nop
    inc  sp
    nop
    inc  sp
    nop
    inc  bc
    nop
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ret  nz
    nop
    ld   b, b
    nop
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rra
    nop
    rra
    nop
    rra
    nop
    rra
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ld   e, $00
    inc  c
    nop
    nop
    nop
    ld   [rLCDC], a
    ld   [rLCDC], a
    db   $FC ; Undefined instruction
    ld   h, b
    ld   a, [hl]
    inc  a
    ccf
    ld   c, $0F
    ld   b, $07
    ld   [bc], a
    rlca
    ld   [bc], a
    ccf
    ld   b, $7F
    ld   a, $FE
    ld   [hl], b
    ld   a, [$FF60]
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  sp
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    inc  c
    db   $EB ; Undefined instruction
    inc  e
    ld   l, a
    jr   label_4ADA8
    jr   label_4AD3A
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rra
    nop
    rra
    nop
    ld   a, a
    nop
    ld   a, b
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ccf
    nop
    rst  $38
    nop

label_4ADA8::
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ccf
    nop
    ld   e, $00
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    db   $10
    db   $0F
    ld   de, label_230F
    rra
    daa
    rra
    daa
    rra
    inc  hl
    rra
    ld   de, label_100F
    rrca
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    jr   label_4ADEB
    jr   nz, label_4AE05
    ld   b, b
    ccf
    ld   b, e
    ccf
    add  a, a

label_4ADEB::
    ld   a, a
    adc  a, a
    ld   a, a
    adc  a, a
    ld   a, a
    adc  a, a
    ld   a, a
    adc  a, a
    ld   a, a
    add  a, a
    ld   a, a
    ld   b, e
    ccf
    ld   b, b
    ccf
    jr   nz, label_4AE1B
    jr   label_4AE05
    rlca
    nop
    nop
    nop
    nop
    nop
    nop

label_4AE05::
    nop
    nop
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
    nop
    nop
    nop
    nop
    ld   bc, $0100

label_4AE1B::
    nop
    rlca
    nop
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
    ld   bc, label_300
    nop
    inc  bc
    nop
    rst  8
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    nop
    rlca
    nop
    ld   bc, $0100
    nop
    inc  bc
    nop
    inc  bc
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $3E
    ld   a, $BE
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    cp   [hl]
    ld   a, a
    ld   e, l
    ld   a, $3E
    nop
    ld   a, b
    nop
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], c
    nop
    ld   a, [$FD01]
    inc  bc
    ld   a, a
    inc  bc
    rrca
    inc  bc
    rlca
    inc  bc
    dec  b
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  sp
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $18
    ld   [$FFEF], a
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFEF]
    ld   a, [$FFDF]
    ld   [$FF0E], a
    ld   bc, label_305
    ccf
    inc  bc
    ld   a, a
    inc  bc
    rst  $38
    inc  bc
    push af
    inc  bc
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
    nop
    nop
    nop
    rst  $18
    ld   [$FFEF], a
    ld   a, [$FFFF]
    ld   a, [$FFFF]
    ld   a, [$FFED]
    cp   $FE
    rst  $38
    ccf
    rst  $38
    cp   a
    ld   a, a
    ld   a, [hl]
    ccf
    ld   e, l
    ld   a, $3F
    nop
    dec  e

label_4AEF7::
    nop
    inc  a
    nop
    ld   a, h
    nop
    ld   a, b
    nop
    jr   nc, label_4AF00

label_4AF00::
    rst  $20
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $20
    nop
    nop
    nop
    ld   [hl], e
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   [hl], e
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    nop
    rlca
    nop
    rrca
    nop
    rra
    nop
    ld   a, a
    nop
    rst  $38
    ld   [label_CFF], sp
    rst  $38
    ld   c, $FF
    ld   b, $7F
    ld   [bc], a
    rra
    nop
    rrca
    nop
    rlca
    nop
    rlca
    nop
    inc  bc
    nop
    nop
    nop
    jr   c, label_4AF64

label_4AF64::
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    ld   [label_C3F], sp
    ccf
    ld   c, $3F
    ld   b, $3F
    ld   [bc], a
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    jr   c, label_4AF7E

label_4AF7E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   bc, $0100
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   h, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    pop  af
    ld   c, $E0
    rra
    ld   [$FF1F], a
    jr   nz, label_4AFED
    ld   de, label_1F0E
    nop
    inc  a
    nop
    jr   c, label_4AFD6

label_4AFD6::
    jr   c, label_4AFD8

label_4AFD8::
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
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a

label_4AFED::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    jp   label_F300
    nop
    ei
    nop
    ei
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    nop
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
    jr   label_4B024

label_4B024::
    jr   c, label_4B026

label_4B026::
    jr   nc, label_4B028

label_4B028::
    ld   [hl], b
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    nop
    cp   $00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $20
    nop
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   e, $00
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, [hl]
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    nop
    rra
    nop
    rrca
    nop
    ld   bc, label_700
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rra
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    rlca
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rra
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rra
    nop
    dec  e
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rra
    nop
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rra
    nop
    dec  e
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    inc  a
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $20
    nop
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    cp   $C0
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    ld   bc, label_900
    nop
    dec  de
    nop
    rra

label_4B107::
    nop
    ccf
    nop
    ccf
    nop
    dec  sp
    nop
    inc  sp
    nop
    ld   sp, label_1100
    nop
    ld   bc, label_300
    nop
    inc  bc
    nop
    ld   bc, $0100
    nop
    ld   bc, $0000
    nop
    nop
    nop
    rrca
    nop
    ccf
    nop
    ld   a, [hl]
    nop
    inc  e
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    inc  e
    nop
    ld   a, [hl]
    nop
    ccf
    nop
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
    add  a, b
    nop
    ret  nz
    nop
    nop
    nop
    nop
    nop
    jr   label_4B14E

label_4B14E::
    rst  $38
    nop
    rst  $38
    nop
    jr   label_4B154

label_4B154::
    nop
    nop
    nop
    nop
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    inc  bc
    nop
    inc  sp
    nop
    ccf
    nop
    rra
    nop
    sbc  a, a
    nop
    rst  $18
    nop
    rst  $38
    nop
    rst  $30
    nop
    ld   [hl], b
    nop
    ld   a, b
    nop
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    jr   nc, label_4B18A

label_4B18A::
    sub  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld   [hl], b
    nop
    ld   a, b
    nop
    inc  e
    nop
    ld   c, $00
    rlca
    nop
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
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   [hl], b
    nop
    jr   c, label_4B1E8

label_4B1E8::
    inc  e
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  hl, sp
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_4B24E

label_4B24E::
    ld   a, h
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_4B28A

label_4B28A::
    ld   a, [hl]
    nop
    ld   a, a
    nop
    rst  $38

label_4B28F::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    nop
    rra
    nop
    rrca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, b
    rlca
    ld   a, h
    inc  bc
    ccf
    nop
    ccf
    nop
    rra
    nop
    rlca
    nop
    ld   bc, $0000
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   h, [hl]
    sbc  a, c
    rst  $38
    add  a, c
    ld   a, [hl]
    add  a, c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    ld   a, l
    inc  bc
    ld   a, e
    rlca
    ld   a, c
    rlca
    inc  a
    inc  bc
    ld   a, $01
    rra
    nop
    rlca
    nop
    ld   bc, $0000
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   l
    ld   a, [hl]
    rst  $38
    rst  $38
    cp   l
    jp   label_99E7
    rst  $38
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    cp   l
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    inc  bc
    ei
    rlca
    ld   a, e
    rlca
    ld   a, e
    rlca
    ld   a, c
    rlca
    inc  a
    inc  bc
    inc  a
    inc  bc
    ld   e, $01
    rrca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    add  a, c
    ld   a, [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   l
    jp   label_99E7
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    ld   a, [hl]
    add  a, c
    inc  a
    jp   label_4BF80
    rst  $38
    nop
    nop
    nop
    nop
    nop
    pop  bc
    nop
    db   $E3 ; Undefined instruction
    nop
    ld   a, a
    nop
    ccf
    nop
    inc  a
    inc  bc
    jr   c, label_4B3D3
    ld   [hl], c
    rrca
    di
    rrca
    di
    rrca
    ld   [hl], c

label_4B3D3::
    rrca
    jr   c, label_4B3DD
    inc  a
    inc  bc
    ccf
    nop
    ld   a, a
    nop
    db   $E3 ; Undefined instruction

label_4B3DD::
    nop
    pop  bc
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    or   $0F
    ld   a, [$FFFD]
    ld   b, $FD
    ld   b, $FD
    or   $09
    or   $FF
    nop
    rst  $38
    nop

label_4B3F2::
    db   $FD ; Undefined instruction
    or   $0F
    ld   a, [$FFFD]
    ld   b, $FD
    ld   b, $FD
    or   $09
    or   $FF
    nop
    ccf
    nop
    ld   a, a
    dec  sp
    cp   a
    ld   a, e
    xor  a
    ld   [hl], b
    cp   [hl]
    ld   h, c
    cp   [hl]
    ld   h, c
    cp   a
    ld   h, b
    cp   e
    ld   h, a
    rst  $30
    cpl
    cp   e
    ld   c, h
    cp   a
    ld   l, b
    cp   a
    ld   l, b
    cp   a
    ld   l, b
    ld   d, a
    inc  l
    dec  hl
    rla
    rra
    nop
    ccf
    nop
    ld   a, a
    dec  sp
    cp   a
    ld   a, e
    xor  a
    ld   [hl], b
    cp   a
    ld   h, b
    cp   e
    ld   h, a
    or   a
    ld   l, a
    cp   e
    ld   l, h
    rst  $38
    jr   z, label_4B3F2
    ld   c, b
    cp   a
    ld   l, b
    or   a
    ld   l, h
    cp   e
    ld   h, a
    ld   e, a
    jr   nz, label_4B45D
    rra
    rra
    nop
    add  hl, de
    nop
    ld   d, $09
    inc  de
    dec  c
    dec  d
    rrca
    ld   l, a
    rra
    xor  h
    ld   e, a
    ret
    ld   a, [hl]
    db   $7A
    ld   a, d
    rst  $10
    ld   a, b
    or   a
    ld   a, b
    or   a
    ld   a, b
    ld   e, e
    inc  a
    ld   c, h
    ccf
    daa
    rra
    jr   label_4B465
    rlca
    nop
    nop
    nop
    ld   bc, label_200

label_4B465::
    ld   bc, $0103
    dec  b
    inc  bc
    dec  d
    inc  bc
    dec  hl
    rla
    daa
    rra
    ld   [hl], $1F
    ld   a, $1D
    cpl
    inc  e
    dec  e
    ld   c, $16
    rrca
    add  hl, bc
    rlca
    ld   b, $01
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, label_305
    rlca
    inc  bc
    ld   a, [bc]
    rlca
    dec  bc
    ld   b, $0A
    rlca
    dec  b
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
    ld   b, $00
    add  hl, bc
    ld   b, $16
    dec  c
    dec  l
    rra
    ld   l, $1F
    ld   e, c
    ld   a, $5B
    inc  a
    xor  h
    ld   [hl], e
    xor  a
    ld   [hl], b
    xor  a
    ld   [hl], b
    or   a
    ld   a, b
    ld   e, h
    ccf
    ld   b, a
    ccf
    jr   nc, label_4B4CD
    rrca
    nop
    scf
    nop
    swap [hl]
    dec  a
    xor  $DE
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    add  hl, de
    cp   $8D

label_4B4CD::
    ld   a, [hl]
    ld   a, [hli]
    call c, label_38D6
    cp   d
    ld   [hl], h
    cp   d
    ld   a, h
    ld   [hl], h
    ld    hl, sp+$F4
    ld    hl, sp+$C8
    ld   a, [$FF30]
    ret  nz
    ret  nz
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_4B4F2::
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    inc  bc
    nop
    rlca
    nop
    rlca
    inc  bc
    rra
    inc  b
    dec  a
    inc  de
    add  hl, sp
    rla
    db   $3A ; ldd  a, [hl]
    dec  d
    inc  l
    inc  de
    inc  e
    inc  bc
    inc  d
    dec  bc
    inc  [hl]
    dec  de
    dec  sp
    inc  d
    rla
    rrca
    jr   label_4B523
    rra
    nop
    rrca
    nop
    add  a, b
    nop
    ret  nz

label_4B523::
    nop
    ld   [$FFC0], a
    ld    hl, sp+$20
    cp   h
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    sbc  a, h
    db   $E8 ; add  sp, d
    sub  a, h
    db   $E8 ; add  sp, d
    jr   c, label_4B4F2
    ld   d, h
    xor  b
    sub  a, h
    ld   l, b
    inc  l

label_4B537::
    ld   a, [$FFC8]
    ld   a, [$FF38]
    ret  nz
    db   $FC ; Undefined instruction
    jr   nc, label_4B537
    nop
    rlca
    nop
    dec  bc
    inc  b
    rra
    nop
    ccf
    ld   de, label_153F
    ld   l, a
    rra
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    ld   l, e
    ld   d, $25
    dec  de
    dec  de
    inc  b
    jr   c, label_4B55F
    ccf
    jr   label_4B59A
    inc  e
    rra
    inc  c
    inc  c

label_4B55F::
    nop
    nop
    nop
    ld   bc, label_1F00
    nop
    dec  a
    ld   a, [de]
    dec  sp
    rla
    ccf
    ld   b, $2F
    inc  d
    cpl
    inc  d
    dec  sp
    rlca
    ld   h, l
    dec  de
    db   $E3 ; Undefined instruction
    ld   e, h
    pop  af
    ld   l, [hl]
    ei
    ld   h, l
    ld   a, a
    inc  hl
    scf
    inc  bc
    inc  bc
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   [$8CFE], sp
    cp   $C4
    rst  $38
    add  a, b
    db   $FD ; Undefined instruction
    xor  $FA
    db   $FC ; Undefined instruction
    cp   $E0
    rst  $18
    and  $EF
    ld   d, $8E
    ld   [hl], b
    ld   a, [$FF80]

label_4B59A::
    ld   [$FF80], a
    ret  nz
    nop
    add  a, b
    nop
    nop
    nop
    dec  sp
    nop
    ld   a, l
    ldd  [hl], a
    ei
    ld   [hl], l
    rst  $38
    ld   h, d
    rst  $28
    inc  d
    ld   l, a
    inc  d
    ld   l, e
    rla
    ld   h, l
    dec  de
    ld   h, [hl]
    add  hl, de
    ld   sp, hl
    ld   h, [hl]
    db   $FD ; Undefined instruction
    ld   a, d
    ld   a, a
    jr   c, label_4B5F3
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    db   $EC ; Undefined instruction
    ret  nz
    cp   $00
    cp   $E0
    rst  $38
    ld   b, b
    rst  $38
    ld   [hl], b
    rst  $38
    ld   a, [$FF00+C]
    add  a, $FF
    db   $EC ; Undefined instruction
    db   $FD ; Undefined instruction
    jp   z, label_36F9
    cp   $D8
    db   $FC ; Undefined instruction
    ret  nz
    ret  z
    jr   nc, label_4B60D
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    nop
    ld   a, d
    rlca
    db   $F4 ; Undefined instruction
    ld   l, a
    ld   sp, hl
    db   $76 ; Halt
    ld   a, e
    dec  [hl]
    ccf
    inc  bc
    rla
    dec  bc
    rla

label_4B5F3::
    ld   a, [bc]
    rra
    ld   [bc], a
    dec  a
    dec  de
    ccf
    add  hl, de
    rra
    nop
    ld   [bc], a
    ld   bc, $0001
    ret  nz
    nop
    ld   [$FFC0], a
    ld   [rJOYP], a
    cp   h
    ld   b, b
    cp   $0C
    cp   $CC
    db   $FC ; Undefined instruction

label_4B60D::
    add  a, b
    cp   $08
    db   $FD ; Undefined instruction
    ld   a, [de]
    pop  af
    ld   a, $B5
    ld   l, [hl]
    and  l
    ld   e, [hl]
    jp   z, label_823C
    ld   a, h
    inc  c
    ld   a, [$FFF0]
    nop
    inc  c
    nop
    rra
    inc  c
    ccf
    inc  e
    inc  a
    dec  de
    add  hl, de
    rlca
    cpl
    db   $10
    db   $4B
    scf
    ld   [hl], a
    inc  c
    rst  $38
    ld   l, b

label_4B632::
    ei
    ld   d, a
    ld   a, [hl]
    ld   de, label_F30
    ld   de, label_80F
    rlca
    inc  b
    inc  bc
    inc  bc
    nop
    inc  bc
    nop
    rlca
    nop
    rlca
    inc  bc
    rra
    inc  b
    dec  a
    inc  de
    add  hl, sp
    rla
    db   $3A ; ldd  a, [hl]
    dec  d
    inc  l
    inc  de
    inc  e
    inc  bc
    inc  l
    inc  de
    ld   l, h
    inc  sp
    ld   [hl], e
    inc  l
    scf
    rrca
    jr   label_4B663
    ccf
    jr   label_4B69E
    nop
    add  a, b
    nop
    ret  nz

label_4B663::
    nop

label_4B664::
    ld   [$FFC0], a
    ld    hl, sp+$20
    cp   h
    ret  z
    sbc  a, h
    db   $E8 ; add  sp, d
    sbc  a, h
    db   $E8 ; add  sp, d
    sub  a, h
    db   $E8 ; add  sp, d
    jr   c, label_4B632
    ld   d, h
    xor  b
    sub  a, [hl]
    ld   l, h
    ld   c, $F4
    db   $EC ; Undefined instruction
    ld   a, [$FF18]

label_4B67B::
    ld   [$FFFC], a
    jr   label_4B67B
    nop
    rlca
    nop
    dec  bc
    rlca
    dec  de
    inc  b

label_4B686::
    ccf
    inc  de
    ccf
    inc  d
    ccf
    db   $10
    db   $27
    jr   label_4B6AE
    dec  c
    rla
    dec  c
    dec  hl
    rla
    ld   l, a
    jr   nc, label_4B70F
    daa
    scf
    rrca
    inc  e
    inc  bc
    dec  sp
    inc  e

label_4B69E::
    ccf
    nop
    ret  nz
    nop
    jr   nz, label_4B664
    jr   label_4B686
    call c, label_FCE8
    jr   z, label_4B6A7
    ld   [label_18E4], sp

label_4B6AE::
    ld    hl, sp+$B0
    db   $E8 ; add  sp, d
    or   b
    call nc, label_F6E8
    inc  c
    ld   e, $E4
    db   $EC ; Undefined instruction
    ld   a, [$FF38]
    ret  nz
    call c, label_FC38
    nop
    dec  de
    nop
    dec  a
    dec  de
    ccf
    jr   label_4B706
    nop
    cpl
    ld   de, label_152F
    cpl
    rla
    dec  hl
    ld   d, $2B
    ld   d, $15
    dec  bc
    dec  de
    inc  b
    jr   label_4B6E7
    daa
    rra
    ld   a, b
    daa
    rst  $30
    ld   a, b
    ld   a, a
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d

label_4B6E7::
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38

label_4B6EE::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    rst  $38
    inc  d
    rst  $38
    ld   [label_14FF], sp
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    inc  bc
    inc  bc
    rlca
    inc  b
    ld   c, $09

label_4B706::
    dec  e
    dec  de
    dec  l
    dec  sp
    cpl
    add  hl, sp
    ld   c, d
    ld   a, h
    ld   b, l

label_4B70F::
    ld   a, [hl]
    ld   h, e
    ld   a, a
    ld   h, e
    ld   a, h
    ld   d, c
    ld   a, [hl]
    ld   e, h
    ld   l, a
    ccf
    inc  hl
    cpl
    jr   nc, label_4B738
    inc  e
    rlca
    rlca
    ld   [$FFE0], a
    ld   a, [$FF10]
    jr   c, label_4B6EE
    call c, label_DAEC
    xor  $FA
    adc  a, $29
    rra
    pop  de
    ccf
    pop  hl
    rst  $38
    ld   h, e
    rra
    push bc
    ccf
    dec  e
    ei

label_4B738::
    cp   $E2
    ld   a, [$EC06]
    inc  e
    ld   a, [$FFF0]
    jr   nc, label_4B772
    dec  hl
    dec  hl
    ld   h, $24
    inc  [hl]
    inc  h
    inc  a
    jr   nz, label_4B789
    jr   c, label_4B7B4
    ld   h, [hl]
    di
    and  d
    ei
    or   d
    rst  $38
    xor  [hl]
    cp   $A3
    rst  $38
    sub  a, e
    rst  $30
    sbc  a, b
    rst  $38
    adc  a, a
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    inc  c
    inc  c
    call nc, label_4A4D4
    inc  h
    inc  l
    inc  h
    inc  a
    inc  b
    ld   a, h
    inc  e
    and  $66
    rst  8
    ld   b, l
    rst  $18
    ld   c, l

label_4B772::
    rst  $38
    ld   [hl], l
    ld   a, a
    push bc
    rst  $38
    ret
    rst  $28
    add  hl, de
    rst  $38
    pop  af
    ld   bc, rSB
    rst  $38
    rst  $38
    rst  $38
    or   $81
    rst  $18
    and  a
    rst  $18
    and  h
    sub  a, a

label_4B789::
    db   $EC ; Undefined instruction
    rst  8
    or   h
    rst  $18
    and  h
    call c, label_D6A7
    and  c
    reti
    and  a
    sub  a, c
    rst  $28
    pop  de
    xor  a
    rst  $38
    cp   a
    rst  $38
    adc  a, b
    adc  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    pop  hl
    rrca
    push af
    rst  $28
    push de
    cpl
    rst  0
    ccf
    db   $2F
    cpl
    push de
    cpl
    dec  d
    rst  $28
    push hl
    rrca
    dec  d
    rst  $28

label_4B7B4::
    rrca
    rst  $30
    dec  c
    rst  $30
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    ld   hl, rNR42
    rst  $38
    rst  $38
    rst  $38
    ld   a, h
    di
    add  a, e
    rst  $10
    and  a
    sub  a, $A7
    db   $6E
    ld   l, [hl]
    push af
    ld   [hl], $D5
    ld   h, a
    rst  $10
    and  a
    rst  $10
    and  d
    jp   nz, label_C5AF
    ld   l, a
    ret
    ld   a, a
    ei
    cp   a
    xor  a
    sbc  a, [hl]
    adc  a, a
    ld   sp, hl
    rst  $38
    ld   [hl], b
    rst  $38
    cp   $01
    rrca
    push hl
    rst  $28
    ld   h, a
    xor  $FF
    ld   a, [hl]
    rst  $28
    xor  a
    push hl
    cpl

label_4B7EE::
    rst  $20
    xor  $07
    inc  c
    rra
    db   $EC ; Undefined instruction
    rra
    cp   $1D
    rst  $30
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    ldi  [hl], a
    inc  hl
    cp   $FF
    db   $FC ; Undefined instruction
    inc  bc
    inc  bc
    rlca
    inc  b
    ld   c, $09
    dec  e
    dec  de
    dec  l
    dec  sp
    cpl
    add  hl, sp
    ld   c, d
    ld   a, h
    ld   b, l
    ld   a, [hl]
    ld   h, e
    ld   a, a
    ld   h, e
    ld   a, h
    ld   d, c
    ld   a, [hl]
    ld   e, h
    ld   l, a
    ccf
    inc  hl
    cpl
    jr   nc, label_4B838
    inc  e
    rlca
    rlca
    ld   [$FFE0], a
    ld   a, [$FF10]
    jr   c, label_4B7EE
    call c, label_DAEC
    xor  $FA
    adc  a, $29
    rra
    pop  de
    ccf
    pop  hl
    rst  $38
    ld   h, e
    rra
    push bc
    ccf
    dec  e
    ei

label_4B838::
    cp   $E2
    ld   a, [$EC06]
    inc  e
    ld   a, [$FFF0]
    pop  af
    pop  af
    cp   d
    bit  3, l
    ld   h, [hl]
    dec  l
    ldd  [hl], a
    ld   sp, label_4883E
    ld   c, a
    ld   c, l
    ld   c, a
    ld   c, a
    ld   c, [hl]
    and  [hl]
    db   $E4 ; Undefined instruction
    cp   $B8
    xor  [hl]
    cp   b
    and  [hl]
    cp   h
    sub  a, d
    sbc  a, [hl]
    rst  8
    adc  a, [hl]
    ld   h, e
    ld   b, c
    ccf
    ccf

label_4B860::
    adc  a, a
    adc  a, a
    ld   e, l
    db   $D3 ; Undefined instruction
    cp   d
    ld   h, [hl]
    or   h
    ld   c, h
    xor  h
    ld   e, h
    ld   [de], a
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   [hl], d
    ld   h, l
    daa
    ld   a, a
    dec  e
    ld   [hl], l
    dec  a
    ld   h, l
    dec  a
    ld   c, c
    ld   a, c
    di
    ld   [hl], c
    add  a, $82
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    ld   [$FF9F], a
    sub  a, b
    rst  $28
    adc  a, a
    ld   a, [$FF88]
    rst  $30
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, b
    rst  $30
    adc  a, a
    ld   a, [$FF8F]
    rst  $38
    sbc  a, a
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rst  $38
    rrca
    rra
    rst  $28
    rst  $18
    cpl
    rst  $18
    cpl
    rst  $18
    cpl
    rst  $18
    cpl
    rra
    rst  $28
    rst  $38
    rrca
    rst  $38
    rst  $30
    rst  $38
    ei
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    pop  hl
    sbc  a, a
    sub  a, b
    rst  $28
    adc  a, a
    ld   a, [$FF88]
    rst  $30
    sub  a, a
    db   $FC ; Undefined instruction
    rst  $30
    db   $E3 ; Undefined instruction
    ld   [$CBD6], a
    or   [hl]
    adc  a, c
    rst  $30
    adc  a, [hl]
    ld   a, [$FF00+C]
    rst  $38
    sbc  a, [hl]
    rst  $38
    cp   [hl]
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    cp   $FF
    pop  bc
    cp   a
    rst  0
    cp   a
    ccf
    adc  a, a
    sbc  a, a
    rst  $28
    sbc  a, a
    xor  a
    sbc  a, a
    cp   a

label_4B8EE::
    db   $E3 ; Undefined instruction
    rst  $38
    inc  c
    cpl
    rra
    rst  $28
    rst  $38
    rrca
    rst  $38
    rst  $30
    rst  $38
    ei
    rst  $38
    db   $FD ; Undefined instruction
    ld   a, a
    db   $FD ; Undefined instruction
    ld   a, [hl]
    rst  $38
    inc  bc
    inc  bc
    rlca
    inc  b
    ld   c, $09
    dec  e
    dec  de
    dec  l
    dec  sp
    cpl
    add  hl, sp
    ld   c, d
    ld   a, h
    ld   b, l
    ld   a, [hl]
    ld   h, e
    ld   a, a
    ld   h, e
    ld   a, h
    ld   d, c
    ld   a, [hl]
    ld   e, h
    ld   l, a
    ccf
    inc  hl
    cpl
    jr   nc, label_4B938
    inc  e
    rlca
    rlca
    ld   [$FFE0], a
    ld   a, [$FF10]
    jr   c, label_4B8EE
    call c, label_DAEC
    xor  $FA
    adc  a, $29
    rra
    pop  de
    ccf
    pop  hl
    rst  $38
    ld   h, e
    rra
    push bc
    ccf
    dec  e
    ei

label_4B938::
    cp   $E2
    ld   a, [$EC06]
    inc  e
    ld   a, [$FFF0]
    rlca
    rlca
    db   $3A ; ldd  a, [hl]
    inc  a
    ld   c, [hl]
    ld   c, b
    ld   [hl], a
    ld   e, b
    ld   e, a
    ld   [hl], e
    inc  l
    inc  [hl]
    ld   l, c
    ld   a, c
    xor  l
    cp   c
    ld   a, [$EFBC]
    rst  $30
    xor  a
    or   b
    sub  a, [hl]
    sbc  a, b
    ld   a, e
    ld   a, h
    inc  l
    daa
    ld   e, e
    ld   b, a
    ld   a, a
    ld   a, a
    ld   [$FFE0], a
    ld   e, h
    inc  a
    ld   [hl], d
    ld   [de], a
    cp   $12
    ld   a, [label_34CE]
    inc  l
    sub  a, [hl]
    sbc  a, [hl]
    or   l
    sbc  a, l
    ld   e, a
    dec  a
    rst  $30
    rst  $28
    push af
    dec  c
    ld   l, c
    add  hl, de
    rst  $18
    ccf
    ld   [hl], $E6
    jp  c, label_FEE2
    cp   $FF
    rst  $38
    ld   [$FF9F], a
    sub  a, b
    rst  $28
    adc  a, a

label_4B987::
    ld   a, [$FF88]
    rst  $30
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, e
    db   $F4 ; Undefined instruction
    adc  a, b
    rst  $30
    adc  a, a
    ld   a, [$FF8F]
    rst  $38
    sbc  a, a
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_7FF
    rst  $38
    rst  $38
    rrca
    rra
    rst  $28
    rst  $18
    cpl
    rst  $18
    cpl
    rst  $18
    cpl
    rst  $18
    cpl
    rra
    rst  $28
    rst  $38
    rrca
    rst  $38
    rst  $30
    rst  $38
    ei
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    pop  hl
    sbc  a, a
    sub  a, b
    rst  $28
    adc  a, a
    ld   a, [$FF88]
    rst  $30
    sub  a, a
    db   $FC ; Undefined instruction
    rst  $30
    db   $E3 ; Undefined instruction
    ld   [$CBD6], a
    or   [hl]
    adc  a, c
    rst  $30
    adc  a, [hl]
    ld   a, [$FF00+C]
    rst  $38
    sbc  a, [hl]
    rst  $38
    cp   [hl]
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    cp   $FF
    pop  bc
    cp   a
    rst  0
    cp   a
    ccf
    adc  a, a
    sbc  a, a
    rst  $28
    sbc  a, a
    xor  a
    sbc  a, a
    cp   a
    db   $E3 ; Undefined instruction
    rst  $38
    inc  c
    cpl
    rra
    rst  $28
    rst  $38
    rrca
    rst  $38
    rst  $30
    rst  $38
    ei
    rst  $38
    db   $FD ; Undefined instruction
    ld   a, a
    db   $FD ; Undefined instruction
    ld   a, [hl]
    rst  $38
    nop
    nop
    inc  bc
    inc  bc
    rrca
    inc  c
    rra
    db   $10
    db   $3F
    ld   h, $3F
    ld   l, $7F
    ld   c, h
    ld   a, a
    ld   b, b
    ld   e, a
    ld   h, l
    ccf
    add  hl, hl
    ccf
    jr   nz, label_4BA56
    jr   nc, label_4BA98
    ld   c, l
    ld   l, a
    ld   e, d
    ccf

label_4BA1D::
    ld   a, $03
    inc  bc
    nop
    nop
    ret  nz
    ret  nz
    ld   a, [$FF30]
    db   $E8 ; add  sp, d
    jr   label_4BA1D
    call z, label_E4FC
    ld   a, [$FAE6]
    ld   h, [hl]
    ld   a, [$C606]
    ld   a, $8C
    ld   a, h
    cp   b
    ld   a, b
    and  b
    ld   [$FFC0], a
    ld   b, b
    ld   b, b
    ret  nz
    add  a, b
    add  a, b
    rlca
    rlca
    db   $3A ; ldd  a, [hl]
    inc  a
    ld   c, [hl]
    ld   c, b
    ld   [hl], a
    ld   e, b
    ld   e, a
    ld   [hl], e
    inc  l
    inc  [hl]
    ld   l, c
    ld   a, c
    xor  l
    cp   c
    ld   a, [$EFBC]
    rst  $30
    xor  a
    or   b

label_4BA56::
    sub  a, [hl]
    sbc  a, b
    ld   a, e
    ld   a, h
    inc  l
    daa
    ld   e, e
    ld   b, a
    ld   a, a
    ld   a, a
    ld   [$FFE0], a
    ld   e, h
    inc  a
    ld   [hl], d
    ld   [de], a
    cp   $12
    ld   a, [label_34CE]
    inc  l
    sub  a, [hl]
    sbc  a, [hl]
    or   l
    sbc  a, l
    ld   e, a
    dec  a
    rst  $30
    rst  $28
    push af
    dec  c
    ld   l, c
    add  hl, de
    rst  $18
    ccf
    ld   [hl], $E6
    jp  c, label_FEE2
    cp   $1F
    rra
    dec  h
    ld   a, $4F
    ld   [hl], a
    ei
    db   $EC ; Undefined instruction
    sub  a, a
    ld    hl, sp+$B7
    ret  c
    or   a
    ret  c
    or   e
    call c, label_FEB1
    ret  c
    rst  $28
    sbc  a, a
    rst  $20
    adc  a, a
    pop  af

label_4BA98::
    add  a, c
    rst  $38
    ld   b, c
    ld   a, a
    ld   hl, label_1F3F
    rra
    ld    hl, sp+$F8
    call nz, label_F23C
    xor  $D9
    scf
    rst  $28
    rra
    db   $ED ; Undefined instruction
    dec  de
    db   $ED ; Undefined instruction
    dec  de
    call label_8D3B
    ld   a, e
    add  hl, de
    rst  $38
    db   $FD ; Undefined instruction
    rst  $20
    di
    rrca
    ld   bc, label_2FF
    cp   $84
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    add  hl, de
    add  hl, de
    ld   h, $3F
    ld   c, a
    ld   [hl], a
    ei
    db   $ED ; Undefined instruction
    sub  a, a
    ld   a, [$DCB7]
    cp   a
    jp  c, label_D9F7
    di
    inc  a
    ret  c
    ld   l, a
    sbc  a, a
    rst  $20
    adc  a, a
    pop  af
    add  a, c
    rst  $38
    ld   b, c
    ld   a, a
    inc  hl
    ld   a, $1E
    inc  e
    ld    hl, sp+$F8
    call nz, label_F23C
    xor  $D9
    scf
    rst  $28
    sbc  a, a
    db   $ED ; Undefined instruction
    ld   e, e
    rst  $38
    ld   a, e
    xor  $9C

label_4BAF0::
    rst  $28
    sbc  a, d
    sbc  a, c
    rst  $38
    db   $FD ; Undefined instruction
    rst  $20
    di
    rrca
    ld   bc, label_2FF
    cp   $84
    db   $FC ; Undefined instruction
    ld    hl, sp+$78
    inc  bc
    inc  bc
    rrca
    inc  c
    rra
    db   $10
    db   $1C
    inc  de
    dec  sp
    daa
    ld   a, a
    ld   h, a
    ld   a, a
    ld   h, a
    ld   a, a
    ld   d, e
    ld   [hl], a
    ld   e, b
    ld   e, [hl]
    ld   l, h
    ld   e, a
    ld   h, e
    ld   d, a
    ld   l, b
    ldi  [hl], a
    inc  a
    inc  hl
    inc  a
    add  hl, de
    ld   e, $07
    rlca
    ret  nz
    ret  nz
    ld   a, [$FF30]
    ld    hl, sp+$08
    jr   c, label_4BAF0
    call c, label_FEE4
    and  $FE
    and  $FE
    jp   z, label_1AEE
    ld   a, d
    ld   [hl], $FA
    add  a, $EA
    ld   d, $44
    inc  a
    call nz, label_983C
    ld   a, b
    ld   [$FFE0], a
    nop
    nop
    ld   e, $1E
    ccf
    ld   hl, label_48679
    ld   [hl], h
    ld   c, e
    scf
    ld   l, b
    dec  [hl]
    ld   l, e
    ld   [hl], a
    ld   c, b
    ld   l, h
    ld   d, e
    ld   h, c
    ld   e, [hl]
    ld   a, a
    ld   h, c
    ld   e, [hl]
    ld   a, a
    ld   b, b
    ld   a, a
    ld   h, c
    ccf
    ccf
    ld   e, $00
    nop
    nop
    nop
    ld   a, b
    ld   a, b
    db   $FC ; Undefined instruction
    add  a, h
    adc  a, $32
    ld   [hl], $CA
    or   $0A
    xor  [hl]
    sub  a, $EC
    ld   d, $36
    jp   z, label_32CE
    cp   $C6
    db   $3A ; ldd  a, [hl]
    cp   $02
    cp   $C6
    db   $FC ; Undefined instruction
    ld   a, h
    jr   c, label_4BB7F

label_4BB7F::
    nop
    ld   a, a
    ld   a, a
    rst  $38
    add  a, b
    cp   a
    ret  nc
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    cp   a
    ret  nc
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    cp   a
    ret  nc
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    sub  a, d
    rst  $38
    ld   a, a
    ld   a, a
    cp   $FE
    rst  $38
    ld   bc, label_BFD
    rst  $38
    ld   bc, rSB
    rst  $38
    ld   bc, label_BFD
    rst  $38
    ld   bc, rSB
    rst  $38
    ld   bc, label_BFD
    rst  $38
    ld   bc, rIE
    ld   c, c
    rst  $38
    ld   c, c
    rst  $38
    cp   $FE
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    cp   a
    rst  $38
    rst  $38
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, rSB
    rst  $38
    ld   bc, rSB
    db   $FD ; Undefined instruction
    rst  $38
    and  b
    rst  $38
    and  c
    cp   $A0
    rst  $38
    cp   a
    rst  $38
    and  b
    rst  $38
    and  c
    cp   $A0

label_4BBEE::
    rst  $38
    cp   a
    rst  $38
    dec  b
    rst  $38
    add  a, l
    ld   a, a
    dec  b
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    dec  b
    rst  $38
    add  a, l
    ld   a, a
    dec  b
    rst  $38
    db   $FD ; Undefined instruction
    inc  bc
    inc  bc
    rlca
    inc  b
    ld   c, $09
    dec  e
    dec  de
    dec  l
    dec  sp
    cpl
    add  hl, sp
    ld   c, d
    ld   a, h
    ld   b, l
    ld   a, [hl]
    ld   h, e
    ld   a, a
    ld   h, e
    ld   a, h
    ld   d, c
    ld   a, [hl]
    ld   e, h
    ld   l, a
    ccf
    inc  hl
    cpl
    jr   nc, label_4BC38
    inc  e
    rlca
    rlca
    ld   [$FFE0], a
    ld   a, [$FF10]
    jr   c, label_4BBEE
    call c, label_DAEC
    xor  $FA
    adc  a, $29
    rra
    pop  de
    ccf
    pop  hl
    rst  $38
    ld   h, e
    rra
    push bc
    ccf
    dec  e
    ei

label_4BC38::
    cp   $E2
    ld   a, [$EC06]
    inc  e
    ld   a, [$FFF0]
    jr   c, label_4BC7A
    daa
    daa
    ld   e, $14
    rrca
    dec  bc
    ccf
    dec  sp
    ld   e, [hl]
    ld   c, d
    ld   a, e
    ld   c, l
    rst  $38
    cp   $83
    add  a, d
    rst  $38
    cp   e
    cp   $BA
    cp   $BB
    rst  $38
    sub  a, e
    rst  $38
    rst  0
    rst  $38
    cp   b
    rst  $38
    rst  $38
    ld   c, $0E
    ld   a, [$FF00+C]
    ld   e, h
    inc  [hl]
    ld    hl, sp+$68
    cp   $EE
    cp   e
    xor  c
    rst  $28
    reti
    ret
    cp   a
    rst  $18
    cp   a
    ei
    ld   sp, hl
    ld   e, a
    add  hl, sp
    ccf
    rst  $38
    push hl
    rst  0

label_4BC7A::
    db   $FD ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
    ld   bc, rIE
    ld   a, a
    ld   a, a
    rst  $38
    add  a, b
    cp   a
    ret  nc
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    cp   a
    ret  nc
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    cp   a
    ret  nc
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    sub  a, d
    rst  $38
    sub  a, d
    rst  $38
    ld   a, a
    ld   a, a
    cp   $FE
    rst  $38
    ld   bc, label_BFD
    rst  $38
    ld   bc, rSB
    rst  $38
    ld   bc, label_BFD
    rst  $38
    ld   bc, rSB
    rst  $38
    ld   bc, label_BFD
    rst  $38
    ld   bc, rIE
    ld   c, c
    rst  $38
    ld   c, c
    rst  $38
    cp   $FE
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    cp   a
    rst  $38
    rst  $38
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, rSB
    rst  $38
    ld   bc, rSB
    db   $FD ; Undefined instruction
    rst  $38
    cp   a
    rst  $38
    and  a
    db   $FD ; Undefined instruction
    and  l
    db   $FD ; Undefined instruction
    and  l
    db   $FD ; Undefined instruction
    and  l
    rst  $38
    cp   a
    rst  $38
    add  a, b
    rst  $38
    cp   a
    rst  $38
    push hl
    rst  $38
    push hl
    ccf
    push hl
    ccf
    push hl
    ccf
    push hl
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    ld   bc, $FDFF
    nop
    nop
    ld   h, a
    ld   h, a
    rst  $38
    sbc  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    and  l
    rst  $38
    add  a, c
    rst  $38
    xor  c
    rst  $38
    add  a, c
    ei
    sub  a, l
    rst  $38
    add  a, c
    rst  $38
    and  l
    rst  $38
    add  a, c
    rst  $38
    sbc  a, c
    rst  $20
    rst  $20
    nop
    nop
    nop
    nop
    jr   label_4BD3C
    inc  h
    inc  h
    inc  h
    inc  h
    inc  a
    inc  a
    ld   a, [hl]
    ld   b, d
    rst  $38
    and  c
    rst  $38
    or   c
    rst  $30
    sbc  a, c
    di
    adc  a, l
    rst  $20
    jp   label_FFBD
    sub  a, c
    rst  $28
    ld   d, d
    ld   l, [hl]

label_4BD3C::
    inc  a
    inc  a
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_4BD7E
    ld   [hl], h
    ld   c, h
    ld   a, [$F6BE]
    adc  a, $E2
    adc  a, [hl]
    ld   [$F2AE], a
    adc  a, [hl]
    or   [hl]
    adc  a, $9E
    xor  $5C
    ld   l, h
    jr   z, label_4BD92
    db   $10
    db   $10
    nop
    nop
    nop
    nop
    nop
    nop
    jp   label_E7C3
    and  l
    rst  $38
    cp   l
    rst  $20
    and  l
    rst  $18
    jp   label_4827E
    ld   a, [hl]
    ld   a, [hl]
    inc  e
    inc  d
    inc  e
    inc  d
    ccf
    cpl
    ccf
    add  hl, hl
    ccf
    dec  hl
    ccf
    add  hl, hl
    ccf
    ccf

label_4BD7E::
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
    ld    hl, sp+$F8
    ld   a, [$F8FA]
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    rst  $38

label_4BD92::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [$FAFA]
    ld   a, [rIE]
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, h
    cp   $82
    cp   $BA
    cp   $BA
    cp   $82
    ld   a, h
    ld   a, h
    jr   c, label_4BDDA
    jr   c, label_4BDDC
    ld   a, $2E
    ld   a, $2A
    ld   a, $2E
    ld   a, $2A
    ld   a, $3E
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $FE
    cp   $82
    cp   $FE
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   l, h
    nop
    sub  a, d
    nop
    add  a, d
    nop
    add  a, d
    nop

label_4BDDA::
    ld   b, h
    nop

label_4BDDC::
    jr   z, label_4BDDE

label_4BDDE::
    stop
    nop
    nop
    ld   l, h
    ld   h, b
    ld   a, [$FF00+C]
    jp   nz, label_82B0
    ld   a, [$FF44]
    ld   [hl], b
    jr   z, label_4BE1E
    db   $10
    db   $10
    nop
    nop
    rrca
    rrca
    ld   de, label_2511
    ld   hl, label_48F41
    ld   b, d
    ld   a, [hl]
    ld   b, h
    ld   a, h
    ld   a, b
    ld   a, b
    nop
    rst  $38
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $38
    nop
    rst  $20
    nop
    add  a, c
    nop
    add  a, c
    nop
    nop
    nop
    nop
    nop
    add  a, c
    nop
    add  a, c

label_4BE1E::
    nop
    rst  $20
    nop
    rst  $38
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, c
    nop
    add  a, c
    nop
    ld   bc, $0100
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $20
    nop
    rst  $20
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $38
    nop
    rst  $20
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $20
    nop
    rst  $38
    nop
    add  a, c
    nop
    add  a, c
    nop
    nop
    nop
    nop
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $38
    nop

label_4BE81::
    rst  $38
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $20
    nop
    rst  $38
    nop
    add  a, c
    nop
    add  a, c
    nop
    ld   bc, $0100
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $20
    nop
    rst  $20
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $38
    nop
    rst  $20
    nop
    add  a, c
    nop
    add  a, c
    nop
    ld   bc, $0100
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $38
    nop
    rst  $20
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $20
    nop
    rst  $20
    nop
    add  a, c
    nop
    add  a, c
    nop
    ld   bc, $0100
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $20
    nop
    rst  $38
    nop
    add  a, c
    nop
    add  a, c
    nop
    nop
    nop
    nop
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $20
    nop
    rst  $20
    nop
    add  a, c
    nop
    add  a, c
    nop
    nop
    nop
    nop
    nop
    add  a, c
    nop
    add  a, c
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    inc  b
    ld   [label_100B], sp
    rlca
    db   $10
    db   $07
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rNR41], a
    db   $10
    db   $D0
    ld   [label_8E0], sp
    ld   [$FF08], a
    rlca
    db   $10
    db   $07
    db   $10
    db   $0B
    db   $10
    db   $04
    ld   [label_700], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [$FF08], a
    ld   [$FF08], a
    ret  nc
    ld   [label_1020], sp
    nop
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
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
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
    nop
    rst  $38
    nop
    nop
    nop
    nop
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
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    add  a, c
    add  a, c
    cp   l
    cp   l
    cp   l
    cp   l
    add  a, c
    add  a, c
    rst  $38
    sbc  a, c
    rst  $38
    add  a, c
    rst  $38
    rst  $38

label_4BF80::
    nop
    nop
    nop
    nop
    ld   c, [hl]
    ld   c, [hl]
    ld   c, b
    ld   c, b
    ld   c, [hl]
    ld   c, [hl]
    ld   c, b
    ld   c, b
    ld   c, b
    ld   c, b
    nop
    nop
    nop
    nop
    nop
    nop
    xor  $EE
    jr   z, label_4BFC0
    xor  $EE
    adc  a, b
    adc  a, b
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    nop
    nop
    nop
    nop
    nop
    nop
    xor  $EE
    jr   z, label_4BFD0
    xor  $EE
    jr   z, label_4BFD4
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    nop
    nop
    nop
    nop
    nop
    nop
    xor  [hl]
    xor  [hl]
    xor  b
    xor  b
    xor  [hl]
    xor  [hl]
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    jr   z, label_4BFE6
    nop
    nop

label_4BFC0::
    nop
    nop
    nop
    nop
    ld   [hl], b
    ld   [hl], b
    ld   d, b
    ld   d, b
    ld   a, d
    ld   a, d
    ld   c, b
    ld   c, b
    ld   a, b
    ld   a, b
    nop
    nop

label_4BFD0::
    rst  $38
    rst  $38
    add  a, c
    add  a, c

label_4BFD4::
    add  a, c
    add  a, c
    rst  $38
    add  a, c
    sbc  a, c
    rst  $20
    jp   label_FFBD
    add  a, c
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    cp   l
    cp   l
    add  a, c
    add  a, c

label_4BFE6::
    and  l
    and  l
    and  l
    and  l
    jp   label_DBC3
    db   $DB
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  a
    jp   label_C33C
    inc  a
    jp   label_C33C
    nop
    rst  $38
    nop
    rst  $38
