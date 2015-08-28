section "bank59",romx,bank[$3B]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_EC007::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    inc  e
    ei
    jr   nc, label_EC007
    ld   sp, label_20F0
    ld   [$FFE0], a
    ld   h, b
    cp   $40
    rst  $38
    ld   b, b
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    ld    hl, sp+$07
    ret  nz
    ccf
    nop
    rst  $38
    ld   a, [$FF0F]
    ld   [$FF1F], a
    ret  nz
    ccf
    add  a, b
    ld   a, a

label_EC048::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    cp   $07
    cp   $07
    cp   $03
    cp   $03
    cp   $EF
    db   $10 ; Undefined instruction
    jr   label_EC048
    inc  e
    pop  af
    ld   c, $F8
    rlca
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rra
    ld   [rSB], a
    cp   $00
    rst  $38
    nop
    nop
    ld    hl, sp+$00
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
    ld   a, [$FF01]
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
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
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
    pop  bc
    ld   a, $FF
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
    cp   $01
    cp   $01
    ld   sp, hl
    rlca
    pop  bc
    ccf
    rst  $38
    ld   h, b
    rst  $38
    ld   h, b
    rst  $38
    ld   [rIE], a
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    sbc  a, a
    ld   [$FF8F], a
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
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
    rst  $38
    ret  nz
    ccf
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rra
    ld   [rJOYP], a
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
    rst  $38
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
    add  a, b
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
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FF03]
    rst  $38
    inc  bc
    rst  $38
    rra
    db   $E3 ; Undefined instruction
    ccf
    jp   label_837B
    ei
    inc  bc
    di
    inc  bc
    di
    inc  bc
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
    ccf
    nop
    rra
    nop
    inc  bc
    nop
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    ld   [$FF1F], a
    ld   a, [$FF0F]
    ld    hl, sp+$07

label_EC17C::
    cp   $01
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
    rst  $38
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
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
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
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $18
    jr   nz, label_EC17C
    ld   a, $E0
    rra
    ld    hl, sp+$07
    ld   bc, label_1FF
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rlca
    cp   $8F
    ld   a, [$FF87]
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    ccf
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rrca
    or   $07
    db   $FC ; Undefined instruction
    rrca

label_EC1FF::
    db   $FC ; Undefined instruction
    nop
    rst  $38
    ret  nz
    ccf
    ld   a, [$FF0F]
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
    ld   bc, $FFFE
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    nop
    nop
    rst  $38
    ld   h, b
    sbc  a, a
    ld   a, [$FF0F]
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
    rst  $38
    ld   bc, label_FFE
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    nop
    nop
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    ld   a, [$FF00]
    add  a, c
    nop
    rrca
    nop
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    inc  bc
    rst  $20
    rlca
    add  a, a
    rlca
    rra
    rlca
    ld   a, a
    rlca
    rst  $30
    rrca
    rst  $20
    rra
    rst  0
    ccf
    add  a, c
    nop
    ret  nz
    nop
    ld   a, [$FF00]
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
    rrca
    nop
    ret  nz
    nop
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
    rst  $38
    nop
    rlca
    nop
    nop
    nop
    ld   [rJOYP], a
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
    ld    hl, sp+$00
    rlca
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    ret  nz
    ccf
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

label_EC2BF::
    nop
    rlca
    cp   $07
    cp   $F7
    ld   c, $FC
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [$FF0F]
    ld    hl, sp+$07
    cp   $01
    rst  $38
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rra
    nop
    rra
    nop
    nop
    rst  $38

label_EC2E2::
    nop
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$07
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rrca
    db   $FC ; Undefined instruction
    rrca
    ld    hl, sp+$0F
    ld    hl, sp+$5F
    or   b
    rst  $38
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   c, label_EC2E2
    inc  a

label_EC300::
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
    nop
    nop
    ld    hl, sp+$00
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
    ld   a, [$FF0F]
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
    ld   [$FF1F], a
    nop
    rst  $38
    rrca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    ld   a, [$FF0F]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, [hl]
    ld   a, a
    ld   b, $FF
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  c
    rst  $38
    ld   c, $FF
    ld   a, $FF
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    ccf
    ret  nz
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, $00FE
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    sbc  a, a
    ld   h, b
    rlca
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    rst  $38
    nop
    rst  $38
    cp   $0C
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    inc  c
    rrca
    db   $FC ; Undefined instruction
    rrca
    cp   $0E
    rst  $38
    rra
    rst  $38
    rrca
    nop
    rlca
    nop
    pop  bc
    nop
    ld   [rJOYP], a
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rlca
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    rst  $38
    nop
    pop  hl
    ld   a, $E0
    ccf
    ld   [$FF3F], a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ld    hl, sp+$47
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    ld   bc, rIE
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  a
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
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FF
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
    db   $FC ; Undefined instruction
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, rIE
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    rst  $38
    and  a
    rst  $38
    daa
    rst  $38
    ld   h, e
    rst  $18
    ld   h, c
    rst  $18
    ld   [hl], b
    rst  8
    ret  nz
    rst  $38
    db   $F4 ; Undefined instruction
    rst  $38
    db   $FD ; Undefined instruction
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
    rst  $38
    ld   b, $FF
    rlca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_EC47C::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
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
    rst  $38
    inc  b
    rst  $38
    ld   c, $FF
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, c
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
    rst  $38
    nop
    rst  $38
    inc  bc
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
    rst  $38
    rra
    ld   [rIF], a
    ld   a, [$FF00]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    ld   b, e
    cp   $41
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    rst  8
    ret  nz
    rst  0
    ret  nz
    add  a, e
    ret  nz
    and  c
    ret  nz
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
    rst  $20
    rst  $38
    jp   label_E0FF
    rst  $18
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
    cp   $FF
    ld    hl, sp+$0E
    ld   a, [$FFFF]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    ld   a, b
    rst  $38
    ret  nz
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    add  a, b
    rst  $38
    rlca
    ld    hl, sp+$FF
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    ld   de, label_39EF
    rst  0
    ld   a, a
    add  a, d
    rst  $38
    inc  b
    rst  $38
    jr   label_EC54A
    ld   [rIE], a
    nop
    rst  $38
    nop
    ld   a, b
    rst  0
    rst  $38
    ld   b, b
    ei
    ld   b, b
    ld    hl, sp+$60
    cp   $20
    rst  $38
    jr   label_EC55C
    ld   b, $DF
    ld   bc, $FF1F
    nop
    rst  $38
    rst  $38
    nop
    ccf
    nop
    nop
    nop
    ret  nz
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    nop
    ld    hl, sp+$00
    nop
    nop
    rrca
    ld   bc, label_7FF
    rst  $38
    db   $FC ; Undefined instruction
    nop
    rst  $38
    rst  $38
    nop
    ld   [rJOYP], a
    rra
    nop
    rst  $38
    ccf
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rlca
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    rrca
    nop
    pop  bc
    nop
    ld   a, [$FFC0]
    cp   $38
    rst  $38
    ld   c, $FF
    inc  bc
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    add  a, b
    ld   a, a
    ld   a, [$FF0F]
    ld   a, a
    nop
    ccf
    nop
    add  a, a
    nop
    ld   [rJOYP], a
    ld   sp, hl
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    cp   $01
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, a
    rst  $38
    ccf
    rst  $38
    ccf
    rst  $38
    ld   h, a
    rst  $18
    ld   h, b
    rst  $18
    nop
    rst  $38
    ld   [rIE], a
    ld    hl, sp+$FF
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    or   b
    ret  nz
    sbc  a, h
    ld   [$FFDE], a
    ld   [$FFDF], a
    ld   [$FFCF], a
    ld   a, [$FFC7]
    ld    hl, sp+$E7
    ld    hl, sp+$E1
    cp   $F8
    rst  0
    rst  $28
    ret  nz
    rst  $30

label_EC605::
    ld   [$FFF8], a
    jr   nc, label_EC605
    jr   label_EC60A
    rlca
    rst  $38
    nop
    rst  $38
    nop
    dec  c
    pop  af
    di
    ld   bc, label_3E7
    rrca
    ld   b, $3F
    inc  c
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
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
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, a
    nop
    rra
    nop
    rrca
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    add  a, b
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
    nop
    nop
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
    ld   [$FF1F], a
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
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$C0
    rst  $38
    ld   [hl], b
    rst  $38
    inc  e
    rst  $38
    rrca
    rst  $38
    ld   bc, $003F
    rra
    nop
    inc  bc
    nop
    ld   b, $01
    inc  e
    inc  bc
    rst  $38
    rlca
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, b
    rst  0
    db   $FC ; Undefined instruction
    jp   label_C0EF
    rst  $20
    ld   h, b
    pop  af
    ld   h, b
    ld    hl, sp+$60
    db   $FC ; Undefined instruction
    jr   nc, label_EC6DE
    inc  e
    ld   bc, label_1FF
    rst  $38
    add  a, c
    ld   a, a
    pop  hl
    rra
    ld   sp, hl
    rlca
    dec  de
    rlca
    ld   a, $07
    call z, label_F03F
    rst  $38
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    ret  nz
    nop
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
    rst  $38
    nop
    rst  $38
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
    add  a, b
    rrca
    ld   a, [$FF03]
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    ld   a, [$FF01]
    cp   $FF
    nop
    ld   a, a
    add  a, b
    rra
    ld   [rTAC], a
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    add  a, b
    rrca
    ld   a, [$FF00]
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
    ccf
    ccf
    ld   a, a
    ld   b, b
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
    rst  $38
    rst  $38
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
    ld   a, [$FFF0]
    call c, label_160C
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    rlca
    rst  $38
    inc  bc
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    nop
    rrca
    nop
    ld   bc, $0000
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
    sbc  a, [hl]
    ld   a, a
    rst  0
    ccf
    db   $E3 ; Undefined instruction
    rra
    di
    rrca
    rst  $38
    ld   bc, $00FF
    rst  $38
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rra
    rst  $38
    ld   bc, $00FF
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
    ret  nz
    ret  nz
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   a, b
    ld    hl, sp+$3C
    db   $FC ; Undefined instruction
    inc  e
    db   $FC ; Undefined instruction
    ld   a, b
    ld    hl, sp+$1C
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    ld   c, $FE
    ld   b, $FE
    rlca
    rst  $38
    inc  bc
    rst  $38
    inc  bc
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
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
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
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    or   b
    rst  8
    sbc  a, h
    db   $E3 ; Undefined instruction
    rst  8
    ld   a, [$FFC3]
    db   $FC ; Undefined instruction
    ld   [rIE], a
    ld   a, [$FFFF]
    db   $FC ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FF0F]
    rst  $38
    nop
    rra
    ld   [$FF03], a
    db   $FC ; Undefined instruction
    nop
    rst  $38
    rst  $28
    ld   a, [$FFCF]
    ret  nz
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FFDF], a
    and  d
    rst  $18
    and  h
    rst  $18
    xor  b
    db   $DB
    xor  h
    rst  $38
    nop
    cp   d
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $28
    db   $10 ; Undefined instruction
    ld   [label_12CA], sp
    ld   h, e
    add  hl, bc
    di
    ld   bc, label_1FF
    rst  $38
    pop  hl
    rst  $38
    ld   bc, label_13FD
    db   $FD ; Undefined instruction
    inc  de
    ccf
    rst  $38
    rrca
    rst  $38
    add  a, a
    ld   a, [hl]
    adc  a, [hl]

label_EC8B7::
    ld   a, h
    call z, label_FD38
    ld    hl, sp+$F9
    jr   nc, label_EC8B7
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $20
    rra
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
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
    ld   bc, label_FFF
    rst  $38
    sbc  a, a
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF

label_EC8F0::
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    ld   [bc], a
    ld   a, a
    ld   bc, $007F
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
    add  a, b
    add  a, b
    ld   [$FFE0], a
    ld   a, [$FFF0]
    ld   c, $FE
    ld   b, $FE
    rlca
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ccf
    nop
    rrca
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
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
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
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    cp   $01
    rst  $38
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    sbc  a, a
    db   $EB ; Undefined instruction
    sbc  a, a
    ld   [$CABF], a
    or   [hl]
    res  2, a
    db   $E8 ; add  sp, d
    rst  $10
    xor  c
    sub  a, a
    db   $E8 ; add  sp, d
    or   e
    call label_FEFF
    rst  $38
    nop
    rst  $18
    jr   nz, label_EC997

label_EC997::
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   d, c
    rst  $38
    ld   d, c
    rst  $38
    ld   d, c
    ld   a, a
    pop  de
    rst  $38
    ld   de, $91FF
    rst  $38
    ld   de, $93FD
    ld    hl, sp+$10
    db   $FC ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   label_ECA36
    ld   [label_C7F], sp
    ld   a, a
    rlca
    ld   a, a
    ld   bc, $003F
    rst  $38
    nop
    dec  a
    nop
    inc  bc
    nop
    rlca
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    sbc  a, h
    ld   a, a
    cp   b
    ld   a, a
    ld   a, [$FF7F]
    ld   [rIE], a
    rst  0
    ld    hl, sp+$BF
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    ld   b, $FF
    inc  bc
    rst  $38
    ld   bc, $00FF
    rst  $38
    ret  nz
    ccf
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
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
    ld   bc, label_EE1E2
    sbc  a, d
    add  hl, sp
    ld   b, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, [hl]
    nop
    cp   h
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_ECA35

label_ECA35::
    inc  a

label_ECA36::
    nop
    ld   a, [hl]
    nop
    rst  $38
    nop
    inc  a
    nop
    inc  a
    nop
    nop
    rst  $38
    nop
    ccf
    nop
    rrca
    nop
    pop  bc
    nop
    ld   [rJOYP], a
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
    rst  $38
    nop
    rst  $38
    nop
    rrca
    nop
    add  a, b
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
    dec  b
    inc  b
    cp   a
    ret  z
    sbc  a, a
    db   $E8 ; add  sp, d
    sbc  a, a
    db   $E8 ; add  sp, d
    adc  a, a
    ld    hl, sp+$CF
    cp   b
    adc  a, h
    db   $F4 ; Undefined instruction
    rst  8
    or   b
    rst  $38
    rst  $38
    rst  $38
    nop
    cp   $01
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    inc  de
    rst  $38
    ld   de, label_11FF
    rst  $38
    ld   de, label_1FF
    ld   bc, $EF07
    ld   bc, rIE
    nop
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
    add  a, b
    ld   [$FF60], a
    and  b
    jr   nz, label_ECAC0
    nop
    rst  $38
    nop
    rst  $38
    nop
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

label_ECADA::
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
    dec  c
    ldd  [hl], a
    dec  a
    ret  nz
    rlca
    jr   c, label_ECB0E
    ld   [$000D], sp
    ld   [bc], a
    nop
    nop
    nop

label_ECB0E::
    nop
    nop
    jr   nz, label_ECADA
    ld   h, b
    adc  a, a
    db   $FC ; Undefined instruction
    ld   [bc], a
    ld   a, [$FF04]
    ld   b, b
    ld   [$00A0], sp
    nop
    nop
    nop
    nop
    ld   [hl], b
    add  a, b
    ld   a, h
    add  a, b
    inc  e
    ld   h, d
    nop
    inc  e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, $01
    ld   a, $01
    jr   c, label_ECB7C
    nop
    jr   c, label_ECB39

label_ECB39::
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
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rlca
    ccf
    jr   c, label_ECBD4
    ld   c, e
    cp   h
    add  a, a
    cp   a
    add  a, e
    rst  $18
    ret  z
    ld   a, b
    ld   a, b
    rlca
    rlca
    ret  nz
    ret  nz
    ld    hl, sp+$38
    db   $FC ; Undefined instruction
    and  h
    ld   a, d
    jp   nz, label_82FA
    or   $26
    inc  a
    inc  a
    ret  nz
    ret  nz
    ld   a, [bc]
    inc  c
    db   $10 ; Undefined instruction
    inc  d
    dec  de
    jr   label_ECB8E
    rra
    db   $10 ; Undefined instruction
    jr   label_ECB9C
    db   $10 ; Undefined instruction
    rrca

label_ECB80::
    ld   [hl], b
    nop
    ld   c, $F1
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    nop
    cp   $01
    rst  $38
    nop
    rst  $38
    ld   b, b

label_ECB8E::
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop

label_ECB9C::
    sbc  a, b
    ld   h, b
    rst  $38
    rst  $38
    ld   c, $00
    ld   [hl], b
    adc  a, a
    rst  $20
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $18
    jr   nz, label_ECBAC
    jr   nz, label_ECB80
    rst  $38
    ld   h, b
    jr   nz, label_ECBE3
    ld   a, [$FF30]

label_ECBB5::
    ret  nc
    db   $10 ; Undefined instruction
    ld    hl, sp+$08
    db   $E8 ; add  sp, d
    jr   label_ECBB5
    ld   [$F0F0], sp
    rst  $38
    ld   a, [$FFFF]
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    ei
    nop
    pop  af
    nop
    ld   bc, $0000
    nop
    nop
    nop

label_ECBD4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_ECBE3::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_600
    ld   bc, label_718
    jr   nz, label_ECC35
    ld   b, e
    inc  a
    ld   b, a
    dec  sp
    add  a, a
    ld   a, e
    add  a, e
    ld   a, l
    sub  a, e
    ld   l, l
    nop
    nop
    nop
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
    rst  $38
    ld   c, $3F
    rst  $18
    ld   a, a
    cp   [hl]
    ld   a, a

label_ECC35::
    cp   c
    rst  $38
    ld   [hl], a
    rst  $38
    cpl
    rst  $38
    adc  a, $FF
    dec  l
    rst  $38
    rlc  b
    nop
    nop
    nop
    nop

label_ECC45::
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
    ld    hl, sp+$60
    rst  $38
    ld    hl, sp+$FF
    cp   $FF
    ld   a, [hl]
    cp   $3C
    db   $FC ; Undefined instruction
    ret  nz

label_ECC5E::
    ld   a, [$FFA0]
    ei
    inc  b
    rlca
    ld   bc, label_307
    inc  bc
    nop
    inc  bc
    ld   bc, $0001
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    rlca
    ld   [bc], a
    dec  bc
    dec  b
    add  hl, bc
    ld   b, $04
    inc  bc
    rlca
    nop
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    ld   l, e
    cp   $0B
    rst  $38
    ld   c, e
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    jp   label_38C7
    nop
    rst  $38
    sbc  a, b
    ld   h, a
    ld   a, [$FF0F]
    sbc  a, a
    ld   h, b
    nop
    rst  $38
    rst  $38
    nop
    ret  nz
    nop
    jr   nz, label_ECC5E
    ld   [rJOYP], a
    ld   a, [$FFA0]
    db   $FC ; Undefined instruction
    and  b
    ld   a, h
    ld    hl, sp+$F8
    ld   [$FFF0], a
    ld   [$FFE0], a
    add  a, b
    ret  c
    nop
    ld   a, h
    sbc  a, b
    inc  a
    ret  c
    ld   a, b
    ret  nz
    and  b
    ld   b, b
    ld   a, [hl]
    add  a, b
    db   $F2 ; Undefined instruction
    ld   l, h
    db   $E4 ; Undefined instruction
    jr   label_ECC45
    ld   [hl], b
    ld   a, [$FF00]
    ld   bc, label_700
    ld   bc, label_70F
    rrca
    inc  b
    rra
    dec  bc
    rra
    rlca
    ld   a, a
    rlca
    ld   a, a
    cpl
    ld   a, a
    jr   z, label_ECD52
    inc  hl
    ld   a, a
    dec  hl
    ld   a, a
    dec  hl
    inc  a
    dec  bc
    rra
    dec  bc
    rra
    dec  bc
    rra
    add  hl, bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    rlca
    rst  $38
    ld   sp, hl
    rst  $38
    cp   $FF
    ei
    rst  $38
    db   $E3 ; Undefined instruction
    rst  $38
    dec  e
    rst  $38
    cp   $FF
    halt
    halt
    halt
    cp   $FF
    cp   $FF
    ld   b, $FF
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    nop
    ld   a, [$FF00]
    ld   a, [$FFA0]
    ld   a, [$FFA0]
    ld   a, [$FFA0]
    ld   a, [$FFA0]
    ld   a, [$FFA0]
    ld   [$FF80], a
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld   l, a
    db   $10 ; Undefined instruction
    rra
    ld   c, b
    scf
    ld   l, b
    rla
    rst  $38
    ld   h, c
    ld   a, [$FF6F]
    ld   a, a
    nop
    ld   e, $0C
    ld   a, $00
    ld   b, d
    inc  a
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
    ld   bc, label_700
    ld   bc, label_70F
    rra
    inc  c
    ld   e, h
    dec  bc
    ld    hl, sp+$57
    ld    hl, sp+$57
    ld   a, [$FF4F]
    ld   a, [$FF4F]

label_ECD52::
    ld   a, [$FF4F]
    ld   a, [$FF4F]
    ld   [hl], h
    dec  hl
    ld   [hl], h
    dec  hl
    db   $3A ; ldd  a, [hl]
    dec  d
    ld   a, [de]
    dec  b
    ld   e, $09
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    ld   a, [$FFFE]
    db   $FC ; Undefined instruction
    rst  $38
    ld   b, $07
    ld   a, [$FD03]
    inc  bc
    db   $FD ; Undefined instruction
    ld   bc, label_1FE
    cp   $01
    cp   $01
    cp   $05
    ld   a, [$FA05]
    dec  bc
    push af
    dec  bc
    db   $F4 ; Undefined instruction
    rrca
    db   $F2 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, b
    nop
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    inc  l
    inc  de
    inc  h
    dec  de
    ld   b, e
    inc  a
    ld   d, b
    cpl
    ld   e, h
    inc  hl
    ld   [hl], e
    inc  c
    ld   [hl], b
    cpl
    ccf
    nop
    ld   e, $0C
    ld   a, $00
    ld   b, d
    inc  a
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
    ld   bc, label_E00
    ld   bc, label_F10
    jr   nz, label_ECDF3
    inc  hl
    inc  e
    ld   b, a
    dec  sp
    ld   b, a
    dec  sp
    ld   b, e
    dec  a
    ld   c, e
    dec  [hl]
    ld   c, e
    inc  [hl]
    nop
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
    rst  $38
    ld   c, $3F
    rst  $18
    ld   a, a
    cp   [hl]
    ld   a, a

label_ECDF3::
    cp   c
    rst  $38
    ld   [hl], a
    rst  $38
    cpl
    rst  $38
    adc  a, $FF
    dec  l
    rst  $38
    set  7, a
    db   $EB ; Undefined instruction
    nop
    nop
    nop
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
    ld    hl, sp+$60
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, $FF
    add  a, $F6
    and  b
    ld   a, [$FFA0]
    ld   a, a
    ld   bc, label_307
    inc  bc
    nop
    ld   bc, $0100
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
    nop
    nop
    rst  $38
    ld   l, e
    cp   $0B
    rst  $38
    ld   c, e
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    jp   label_18E7
    ld   d, d
    dec  l
    ld   d, d
    dec  l
    ld   e, [hl]
    ld   hl, label_ECCBF
    sbc  a, [hl]
    ld   l, l
    rst  $38
    nop
    inc  a
    jr   label_ECE9A
    nop
    jr   nz, label_ECE7D
    ccf
    nop
    db   $FC ; Undefined instruction
    and  b
    ld   a, h
    ld    hl, sp+$F8
    ld   [$FFF0], a
    ld   [$FFE0], a
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    ret  nz
    nop
    nop
    nop
    nop
    nop
    add  a, b

label_ECE7D::
    nop
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
    ld   bc, label_600
    ld   bc, label_718
    jr   nz, label_ECEB5
    ld   b, e
    inc  a
    ld   b, a
    dec  sp

label_ECE9A::
    add  a, a
    ld   a, e
    add  a, e
    ld   a, l
    sub  a, e
    ld   l, l
    nop
    nop
    nop
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
    rst  $38
    ld   c, $3F
    rst  $18
    ld   a, a
    cp   [hl]
    ld   a, a

label_ECEB5::
    cp   c
    rst  $38
    ld   [hl], a
    rst  $38
    cpl
    rst  $38
    adc  a, $FF
    dec  l
    rst  $38
    rlc  b
    nop
    nop
    nop
    nop

label_ECEC5::
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
    ld    hl, sp+$60
    rst  $38
    ld    hl, sp+$FF
    cp   $FF
    ld   a, [hl]
    cp   $3C
    db   $FC ; Undefined instruction
    ret  nz
    ld   a, [$FFA0]
    ei
    inc  b
    rlca
    ld   bc, label_307
    inc  bc
    nop
    ld   bc, $0100
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rlca
    ld   [bc], a
    ld   [bc], a
    ld   bc, label_207
    dec  bc
    dec  b
    add  hl, bc
    ld   b, $04
    inc  bc
    inc  bc
    nop
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    ld   l, e
    cp   $0B
    rst  $38
    ld   c, e
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    jp   label_3CC3
    add  a, b
    ld   a, a
    add  a, h
    ld   a, e
    jp   label_3F3C
    ret  nz
    nop
    rst  $38
    rst  $38
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ret  nz
    nop
    ld   a, [$FFA0]
    db   $FC ; Undefined instruction
    and  b
    ld   a, h
    ld    hl, sp+$F8
    ld   [$FFF0], a
    ld   [$FFE0], a
    add  a, b
    ld   a, [$FF00]
    ld   a, b
    or   b
    ld   a, b
    or   b
    ld   a, [$FF00]
    jr   nz, label_ECEF6
    ld   a, [hl]
    add  a, b
    db   $F2 ; Undefined instruction
    ld   l, h
    db   $E4 ; Undefined instruction
    jr   label_ECEC5
    ld   [hl], b
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
    ld   bc, label_700
    ld   bc, label_70F
    rra
    rrca
    rra
    rrca
    ccf
    rra
    ccf
    ld   e, $3F
    ld   de, label_61F
    rrca
    ld   b, $00
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
    rst  $38
    inc  a
    rst  $38
    adc  a, $FF
    di
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    db   $ED ; Undefined instruction
    rst  $38
    sub  a, [hl]
    rst  $38
    ld   a, d
    rst  $38
    call label_EDFF
    rst  $38
    db   $ED ; Undefined instruction
    nop
    nop
    nop
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
    jr   nz, label_ECF50
    sub  a, b

label_ECF91::
    ld   h, b
    db   $E8 ; add  sp, d

label_ECF93::
    sub  a, b
    db   $F4 ; Undefined instruction
    xor  b
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $F4 ; Undefined instruction
    jr   z, label_ECF91
    jr   z, label_ECF93
    ld   l, b
    rrca
    ld   b, $09
    rlca
    rrca
    rlca
    ld   h, a
    ld   [bc], a
    rst  $38
    ld   h, c
    pop  af
    ld   l, [hl]
    ld   h, d
    dec  e

label_ECFAE::
    ld   e, $01

label_ECFB0::
    ld   [bc], a
    ld   bc, $0003
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    ld   bc, label_200
    ld   bc, $0003
    rst  $38
    db   $ED ; Undefined instruction
    di
    db   $FD ; Undefined instruction
    rst  $38
    db   $ED ; Undefined instruction
    rst  $38
    dec  e
    ei
    db   $FC ; Undefined instruction
    cp   $01
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    rlca
    ei
    rst  $38
    jp   label_FC03
    rst  $38
    nop
    cp   $6C
    rst  $38
    nop
    ld   b, c
    cp   [hl]
    rst  $38
    nop
    db   $E4 ; Undefined instruction
    ld   e, b
    call c, label_E020
    ld   b, b
    ld   [rLCDC], a
    ld   [rLCDC], a
    ret  nz
    nop
    jr   nz, label_ECFAE
    jr   nz, label_ECFB0
    and  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_700
    ld   bc, label_70F
    rra
    rrca
    rra
    ld   c, $1F
    nop
    inc  bc
    ld   bc, $010F
    rrca
    rlca
    rlca
    ld   bc, $0103
    ld   bc, $0000
    nop
    nop
    nop
    jr   nc, label_ED024

label_ED024::
    ld   a, a
    jr   nc, label_ED023
    ld   a, e
    cp   $9D
    rst  $38
    xor  $FF
    or   $FF
    dec  d
    rst  $38
    db   $DB
    rst  $38
    ld   l, e
    rst  $38
    ld   l, e
    rst  $38
    ld   l, d
    sbc  a, a
    db   $E8 ; add  sp, d
    rst  $38
    db   $EB ; Undefined instruction
    rst  $38
    ld   h, c
    di
    inc  c
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [hl], b
    add  a, b
    ld   [label_8F0], sp
    ld   a, [$FF84]
    ld   a, b
    call nz, label_C4B8
    cp   b
    call nc, label_F428
    ld   c, b
    db   $FC ; Undefined instruction
    ld   b, b
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   c, c
    ld   [hl], $89
    halt
    ld   b, [hl]
    adc  a, a
    halt
    jr   c, label_ED0E9
    nop
    add  a, d
    ld   a, h
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
    ccf
    rlca

label_ED08C::
    ccf
    rra
    ccf
    rra
    rra
    ld   c, $0F
    ld   bc, label_207
    rra
    ld   [bc], a
    rra
    ld   c, $0F
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   h, b
    nop
    rst  $38
    ld   h, b
    ld    hl, sp+$F7
    db   $FC ; Undefined instruction
    dec  sp
    cp   $DD
    rst  $38
    db   $EC ; Undefined instruction
    rst  $38
    dec  hl
    rst  $38
    or   a
    rst  $38
    sub  a, $FF
    sub  a, $FF
    call nc, label_D03F
    rst  $38
    sub  a, $FF
    ret  nz
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
    jr   nc, label_ED08C
    ld   [label_4F0], sp
    ld    hl, sp+$82
    ld   a, h
    add  a, d
    ld   a, h
    sub  a, d
    ld   l, h
    sbc  a, $A0
    ld   [$FF80], a
    ret  nz
    nop
    nop
    nop
    nop
    nop
    rlca
    ld   [bc], a
    rlca
    inc  bc
    inc  bc
    nop
    ld   bc, label_F00

label_ED0E9::
    nop
    ld   [label_607], sp
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
    db   $EB ; Undefined instruction
    inc  d
    sub  a, c
    ld   l, [hl]
    db   $EB ; Undefined instruction
    dec  d
    add  a, a
    ld   a, c
    push hl
    ld   a, [label_27F8]
    ld   sp, $CFCE
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ret  nz
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
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
    ld   b, $00
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ld   a, a
    rra
    ld   a, a
    jr   nc, label_ED168
    ld   l, a
    rst  $38
    ld   e, a
    rst  $38
    ccf
    rst  $38
    cp   h
    rst  $38
    add  a, e
    rst  $38
    or   a
    rst  $38
    or   a
    rst  $38
    or   a
    rst  8
    cp   a
    rst  $38
    or   b
    cp   a
    rra
    ld   e, a
    jr   nz, label_ED181

label_ED181::
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    ld   a, [$FF60]
    ld    hl, sp+$B0
    ld    hl, sp+$D0
    ei
    jr   nz, label_ED18E
    xor  d
    rst  $38
    jp   z, label_EEAFF
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    sbc  a, [hl]
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ld   l, b
    db   $E8 ; add  sp, d
    ret  nz
    ret  nc
    jr   nz, label_ED1A1

label_ED1A1::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    ld   a, a
    ret  nc
    cpl
    rst  $38
    jp   nz, label_DFE0
    rst  $38
    jr   c, label_ED248
    nop
    add  a, l
    ld   a, b
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
    nop
    nop
    nop
    nop
    ld   [label_EC8F0], sp
    or   b
    db   $FC ; Undefined instruction
    jr   label_ED223
    ret  c
    ld    hl, sp+$E0
    ld   a, [$FF00]
    ld   [$F8F0], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  c
    nop
    rrca
    dec  b
    rrca
    dec  b
    rrca
    dec  b
    rra
    dec  b
    rst  $18
    add  hl, bc
    rst  $38
    ld   c, c
    ld   a, a
    add  hl, sp
    ld   a, a
    inc  b
    ld   a, [hl]
    dec  [hl]
    nop
    nop
    ccf

label_ED223::
    nop
    rst  $38
    ccf
    rst  $38
    ld   h, b
    rst  $38
    rst  $18
    rst  $38
    cp   a
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, c
    rst  $38
    rlca
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   l, [hl]
    sbc  a, a
    ld   a, a
    rst  $38
    ld   h, b
    rst  $38
    ccf
    ccf
    ret  nz
    nop
    nop
    add  a, b
    nop
    ld   [$FF80], a
    ld   [$FFC0], a

label_ED248::
    ld   a, [$FF60]
    ld   a, [$FFA0]
    or   $40
    cp   $54
    cp   $94
    cp   $D4
    cp   $D4
    cp   $D4
    inc  a
    ret  nc
    ld    hl, sp+$D0
    ret  nc
    add  a, b
    and  b
    ld   b, b
    db   $3A ; ldd  a, [hl]
    dec  c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    nop
    ld   bc, $0100
    nop
    inc  bc
    ld   bc, $0003
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
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
    ld   [hl], b
    rst  $38
    pop  de
    rst  $38
    reti
    rst  $38
    reti
    rst  $38
    rst  $38
    cp   $7F
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
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    add  a, b
    ld    hl, sp+$C0
    ld   a, [$FFC0]
    ld   a, [$FF80]
    ret  nz
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
    ld   a, a
    nop
    db   $E3 ; Undefined instruction
    inc  e
    di
    db   $EC ; Undefined instruction
    db   $FD ; Undefined instruction
    ldh  [$FF0C], a
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
    ld   sp, hl
    ld   sp, hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    cp   $00
    ld   a, [$FF00]
    ld    hl, sp+$10
    ld    hl, sp+$F0
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    ld   bc, $0103
    ld   bc, $0000
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
    ld   a, a
    nop
    ret  z
    ccf
    ret  nc
    cp   a
    di
    cp   h
    pop  bc
    ld   a, $FF
    nop
    rst  $38
    ld   sp, hl
    ld   sp, hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ld   [$FFF8], a
    ld   [$FFF0], a
    nop
    ld   a, [$FFE0]
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
    rst  $38
    and  b
    ld   e, a
    ld   a, a
    inc  b
    ld   b, b
    ccf
    rst  $38
    ld   [hl], c
    ei
    nop
    add  hl, bc
    ld   a, [$FFF8]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $10 ; Undefined instruction
    sub  a, b
    ld   h, b
    ld    hl, sp+$30
    ld   a, b
    or   b
    ld   a, [$FFC0]
    ld   a, [$FF00]
    ld   [$F8F0], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
    nop
    rlca
    nop
    rlca
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
    add  a, e
    nop
    rrca
    nop
    sbc  a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_7FF
    rst  $38
    ld   e, e
    rst  $38
    ld   e, e
    rst  $38
    ld   e, e
    ld   a, a
    rra
    rra
    rrca
    ccf
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    cp   $C0
    db   $FD ; Undefined instruction
    and  $FF
    or   [hl]
    rst  $38
    cp   [hl]
    push af
    cp   [hl]
    cp   $F0
    ld   a, [$FFE0]
    ld   a, [$FF00]
    nop
    nop

label_ED5E2::
    nop
    nop
    ld   bc, $0100
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
    nop
    nop
    nop
    nop
    ld   [hl], e
    inc  c
    di
    inc  c
    db   $F4 ; Undefined instruction
    rst  $28
    db   $F4 ; Undefined instruction
    rst  $28
    di
    rst  $28
    rst  $38
    nop
    ccf
    ld   e, $1F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_ED5E2
    inc  a
    ret  nz
    cp   [hl]
    call c, label_DCBE
    ccf
    call c, label_FF
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    ld   a, $00
    ld   a, h
    nop
    ld   a, h
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rrca
    nop
    ld   bc, $0100
    nop
    inc  bc
    ld   bc, $0003
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
    ld   [hl], b
    rst  $38
    pop  de
    rst  $38
    reti
    rst  $38
    reti
    rst  $38
    rst  $38
    cp   $7F
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    add  a, b
    ld    hl, sp+$C0
    ld   a, [$FFC0]
    ld   a, [$FF80]
    ret  nz
    nop
    add  a, b
    nop
    scf
    jr   label_ED71E
    inc  [hl]
    ld   l, a
    jr   nc, label_ED706
    ld   l, $5F
    ld   l, $7F
    nop
    db   $FC ; Undefined instruction
    ccf
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
    ret  nz
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [rJOYP], a
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
    ret  nz
    nop
    pop  hl
    ld   b, b
    rst  $30
    ld   h, b
    rst  $30
    ld   h, b
    rst  $38
    ld   [hl], b
    ld   a, a
    jr   nc, label_ED76C
    jr   c, label_ED72E
    jr   label_ED730
    inc  e
    rra
    inc  c
    rra
    ld   [$001F], sp
    rra
    rlca
    rrca
    rlca
    rrca
    rlca
    rlca
    nop
    nop
    nop
    add  a, b
    nop
    rst  0
    nop

label_ED706::
    sbc  a, a
    nop
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    rrca
    rst  $38
    or   a
    rst  $38
    or   a
    rst  $38
    scf
    rst  $38
    ccf
    rst  $38
    rra

label_ED71E::
    rst  $38
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop

label_ED72E::
    db   $FC ; Undefined instruction
    nop

label_ED730::
    db   $FC ; Undefined instruction
    add  a, b
    ld   a, [$FECC]
    ld   l, h
    cp   $7C
    ld   [$FC7C], a
    ld   [$FFE0], a
    ret  nz
    ld   a, [$FF00]
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    nop
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and  $19
    and  $19
    jp   [hl]
    rra
    jp   [hl]
    rra
    ld   h, [hl]
    rra
    ld   a, a
    nop

label_ED76C::
    db   $FD ; Undefined instruction
    ld   a, b
    ld   a, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    add  a, b
    ld   a, h
    add  a, b
    ld   a, h
    cp   b
    ld   a, [hl]
    cp   b
    ld   a, [hl]
    cp   b
    ld    hl, sp+$00
    ld    hl, sp+$F0
    ld    hl, sp+$00
    nop
    nop
    nop
    nop
    nop

label_ED795::
    nop
    nop
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
    ld   bc, $0103
    rrca
    nop
    ld   [label_607], sp
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
    db   $EB ; Undefined instruction
    inc  d
    pop  de
    ld   l, $C3
    cp   h
    call label_F3B3
    ld   c, $DE
    pop  hl
    jr   z, label_ED795
    rst  8
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ret  nz
    add  a, b
    add  a, b
    nop
    ld   b, b
    add  a, b
    ld   b, b
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
    db   $10 ; Undefined instruction
    rst  $38
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    rst  $38
    ld   b, b
    ld   b, b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rst  $38
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    ld   [$FF50], a
    ld   e, a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   b, h
    cp   e
    rst  $38
    nop
    ld   de, $FFEE
    rst  $38
    add  a, c
    jp   label_FFFF
    add  a, e
    rst  $38
    cp   l
    jp   label_DFA1
    cp   l
    jp   label_FB85
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    ldi  [hl], a
    db   $FF
    rst  $38
    nop
    adc  a, b
    ld   [hl], a
    ld   a, a
    rst  $38
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rst  $18
    ld   [$FFC0], a
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    ld   bc, $0103
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ei
    rlca
    dec  de
    rst  $20
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_ED9E6::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, $27
    pop  af
    rst  $38
    jr   c, label_ED9E6
    nop
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
    rst  $38
    db   $E3 ; Undefined instruction
    add  a, c
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, label_3FFF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
    cpl
    rst  $18
    rst  $38
    rrca
    adc  a, a
    ld   a, a
    rst  $38
    rrca
    cpl
    rst  $18
    rst  $38
    rrca
    adc  a, a
    ld   a, a
    rst  $38
    ld   a, [$FFF4]
    ei
    rst  $38
    ld   a, [$FFF1]
    cp   $FF
    ld   a, [$FFF4]
    ei
    rst  $38
    ld   a, [$FFF1]
    cp   $BD
    jp   label_DFA1
    cp   l
    jp   label_FB85
    cp   l
    jp   label_DFA1
    cp   l
    jp   label_FB85
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    adc  a, b
    rst  $30
    rst  $38
    add  a, b
    and  d
    db   $FF
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    ld   de, $FFEE
    nop
    ld   b, h
    cp   e
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   bc, rSB
    rst  $38
    ld   de, $FFEF
    ld   bc, $BB45
    rst  $38
    ld   bc, rIE
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rst  $18
    ld   [$FFD8], a
    rst  $20
    cp   $FF
    inc  bc
    ld   bc, $0103
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ei
    rlca
    inc  bc
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
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
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
    rra
    rlca
    pop  af
    cp   $1F
    ld   [rIE], a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    adc  a, l
    di
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rrca
    nop
    ld   a, [$FF00]
    add  a, b
    nop
    rst  $38
    nop
    nop
    nop
    rrca
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    nop
    nop
    rlca
    nop
    rst  $38
    nop
    rrca
    nop
    ld   a, [$FF00]
    nop
    nop
    rst  $38
    nop
    rrca
    nop
    ld   [hl], b
    nop
    add  a, b
    nop
    rst  $38
    nop
    nop
    nop
    rrca
    nop
    ld   a, [$FF00]
    rst  $38
    inc  bc
    inc  c
    rrca
    jr   c, label_EDB9D
    rst  0
    rst  $38
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rrca
    inc  a
    ccf
    jp   label_C0FF
    rst  $38
    jr   nc, label_EDB6B
    inc  c
    rst  $38
    inc  bc
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_EDB73
    inc  c
    rst  $38
    inc  sp
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_EDB7B
    inc  c
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   de, $FFEF
    ld   bc, $BB45
    rst  $38
    ld   bc, $EF11
    db   $10 ; Undefined instruction
    rst  $38
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [$FFF7], sp
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    ld   [label_8F7], sp

label_EDBAF::
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    and  b
    rst  $18
    and  b
    rst  $18
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
    nop
    jr   nz, label_EDBAD
    jr   nz, label_EDBAF
    rst  $38
    nop
    rst  $38
    nop
    ei
    rlca
    call c, label_FF3C
    ld   [rJOYP], a
    nop
    nop
    nop
    nop
    nop
    rst  $20
    ld   e, $70
    ld   a, [$FFFF]
    add  a, b
    nop
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
    nop
    rrca
    nop
    ld   a, [$FF00]
    nop
    nop
    rst  $38
    nop
    rrca
    nop
    ld   [hl], b
    nop
    add  a, b
    nop
    rst  $38
    ret  nz
    ccf
    ld   a, [$FF0C]
    db   $FC ; Undefined instruction
    inc  sp
    rst  $38
    pop  bc
    rst  $38
    jr   nc, label_EDC0B

label_EDC0C::
    inc  c
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    nop
    nop
    nop
    ld   a, [$FF00]
    rrca
    nop
    rst  $38
    ret  nz
    jr   nc, label_EDC0C
    inc  e
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    rst  $38
    nop
    ld   a, [$FF00]
    rrca
    nop
    nop
    nop
    rst  $38
    nop
    ld   a, [$FF00]
    ld   c, $00
    ld   bc, rJOYP
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    rrca
    nop
    nop
    nop
    ld   [rJOYP], a
    rst  $38
    nop
    ld   a, [$FF00]
    rrca
    nop
    ld   bc, rJOYP
    nop
    nop
    nop
    ld   a, [$FF00]
    rrca
    nop
    ld   [$FFF7], sp
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    rlca
    ld   a, [bc]
    ld   a, [$F808]
    ld   [$FFF7], sp
    nop
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    rst  $38
    ld   [bc], a
    ld   [bc], a
    ld   [$C408], sp
    ld   a, a
    rst  $38
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    rst  $38
    ld   a, a
    call nz, label_C47F
    ld   a, a
    nop
    nop
    inc  bc
    inc  bc
    inc  c
    rrca
    jr   nc, label_EDCC7
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, e
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop

label_EDC96::
    nop
    nop
    nop
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
    ret  nz
    jr   nc, label_EDC96
    inc  c
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    ld   bc, label_1FF
    rst  $38
    pop  bc
    rst  $38
    or   l
    jp   z, label_CAB5
    or   l
    jp   z, label_8AF5
    push af
    adc  a, d
    rst  $30
    adc  a, b
    or   $89
    or   $89
    sbc  a, a
    ld   h, c
    sbc  a, e
    ld   h, l
    db   $DB
    dec  h
    db   $DB

label_EDCC7::
    dec  h
    ei
    dec  b
    rst  $38
    ld   bc, label_1FF
    db   $DB
    dec  h
    add  a, b
    rst  $38
    or   l
    jp   z, label_AAD5
    push de
    xor  d
    push af
    adc  a, d
    rst  $30
    adc  a, b
    or   $89
    or   $89
    ld   bc, $9BFF
    ld   h, l
    db   $DB
    dec  h
    db   $DB
    dec  h
    ei
    dec  b
    rst  $38
    ld   bc, label_1FF
    db   $DB
    dec  h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$FF
    rst  0
    add  a, c
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, a
    ld   [$FF8F], a
    rst  $38
    inc  e
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
    inc  de
    cp   $FF
    cp   $03
    cp   $03
    cp   $03
    cp   $FF
    cp   $13
    cp   $13
    cp   $FF
    ld   [hl], e
    db   $FC ; Undefined instruction
    ld   c, a
    ld   a, [$FF3F]
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    jp   label_CE7F
    ld   a, a
    ld    hl, sp+$7F
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
    adc  a, $3F
    db   $F2 ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    inc  bc
    cp   $03
    cp   $C3
    cp   $73
    cp   $1F
    cp   $F6
    adc  a, c
    rst  $38
    add  a, b
    db   $A2
    and  d
    db   $A2
    and  d
    db   $A2
    and  d
    call label_CDB2
    or   d
    call z, label_CBB3
    dec  [hl]
    ld   c, c
    or   a
    ld   e, l
    and  e
    ld   e, a
    and  c
    ld   d, l
    xor  e
    ld   [hl], l
    adc  a, e
    ld   [hl], l
    adc  a, e
    ld   [hl], a
    adc  a, c
    or   $89
    rst  $38
    add  a, b
    db   $A2
    and  d
    db   $A2
    and  d
    db   $A2
    and  d
    call label_CDB2
    or   d
    add  a, b
    rst  $38
    swap l
    ld   c, c
    or   a
    ld   e, l
    and  e
    ld   e, a
    and  c
    ld   d, l
    xor  e
    ld   [hl], l
    adc  a, e
    ld   [hl], l
    adc  a, e
    ld   bc, $00FF
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   c, label_EDE03
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    jr   c, label_EDE09
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    inc  e
    rst  $38
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    inc  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    jr   label_EDE23
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    inc  e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or   c
    rst  8
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    ld    hl, sp+$E0
    adc  a, a
    ld   a, a
    ld    hl, sp+$07
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
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    rst  $38
    rst  $38
    db   $E8 ; add  sp, d
    ld   a, a
    ret
    ld   a, a
    rst  8
    ld   a, a
    ld   a, [$FF7F]
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    rst  8
    ld   a, a
    ld    hl, sp+$7F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rla
    cp   $93
    cp   $F3
    cp   $0F
    cp   $03
    cp   $03
    cp   $F3
    cp   $1F
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
    inc  de
    cp   $FF
    cp   $03
    cp   $03
    cp   $03
    cp   $FF
    cp   $13
    cp   $13
    cp   $C4
    ld   a, a
    rst  $38
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    rst  $38
    ld   a, a
    call nz, label_C47F
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
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
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
    rst  $20
    ld   a, b
    ld   c, $0F
    rst  $38
    ld   bc, $0000
    rst  $38
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
    rst  $18
    ld   [$FF3B], a
    inc  a
    rst  $38
    rlca
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EE000::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EE014::
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    jr   nc, label_EE02B
    jr   nz, label_EE03D
    jr   label_EE027
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EE027::
    nop
    nop
    nop
    nop

label_EE02B::
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_3F00
    nop
    ret
    ld   [hl], $08
    sub  a, a
    ld   b, $38
    ld   [label_9F6], sp

label_EE03D::
    or   $E9
    ld   d, $00
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nz, label_EE014
    db   $10 ; Undefined instruction
    sub  a, b
    ld   h, b
    ld   [hl], b
    nop
    sbc  a, b
    ld   h, b
    inc  d
    db   $E8 ; add  sp, d
    inc  h
    ret  c
    ld   de, label_EE10A
    ld   d, $43
    dec  a
    ccf
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rrca
    rlca
    rrca
    rlca
    rlca
    nop
    ld   [bc], a
    ld   bc, $0007
    jr   label_EE07F
    jr   nz, label_EE099
    ld   b, h
    dec  sp
    ld   a, c
    ld   b, $0F

label_EE07F::
    nop
    inc  h
    ret  c
    call nz, label_38
    ld    hl, sp+$80
    ld   [hl], b
    ret  nz
    and  b
    ret  nz
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

label_EE099::
    nop
    nop
    nop
    nop
    nop
    nop

label_EE09F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    ld   [label_407], sp
    inc  bc
    ld   [label_1007], sp
    rrca
    inc  d
    dec  bc
    inc  c
    inc  bc
    ld   [label_B07], sp
    inc  b
    inc  c
    nop
    ld   bc, $0100
    nop
    nop
    nop
    rst  $38
    ld   a, a
    ld   a, a
    ccf
    ccf
    rrca
    cpl
    db   $10 ; Undefined instruction
    ldd  [hl], a
    ld   [hl], d
    dec  c
    db   $10 ; Undefined instruction
    jr   nz, label_EE0EF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EE0E0::
    sbc  a, a
    ld   h, h
    sbc  a, a
    ld   l, e
    rst  $18
    xor  e
    rst  $28
    rst  $10
    rst  $28
    sub  a, $EF
    call nc, label_D0EE
    jp   z, label_C9B4
    or   [hl]
    sub  a, c
    ld   l, [hl]
    sbc  a, c
    ld   h, [hl]
    sbc  a, a
    ld   h, b
    cp   h

label_EE0F9::
    ld   e, b
    db   $FC ; Undefined instruction
    jr   c, label_EE0F9
    ld   a, b
    ld   a, h
    cp   b
    jp   nz, label_C2BC
    cp   h
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    pop  bc
    ld   a, $41
    ld   a, $42
    inc  a
    ld   b, d
    inc  a
    ldh  [$FF0C], a
    inc  e
    inc  h
    jr   label_EE139
    jr   label_EE12F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EE12F::
    nop
    nop
    nop
    nop
    nop
    rlca
    nop

label_EE136::
    ld   a, b
    rlca

label_EE138::
    ld   b, b

label_EE139::
    ld   a, $38
    rlca
    db   $10 ; Undefined instruction
    jr   nz, label_EE157
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EE14C::
    nop
    nop

label_EE14E::
    nop
    nop
    inc  bc
    nop
    cp   $01
    ld   [de], a
    dec  l
    ld   de, label_86E
    db   $F4 ; Undefined instruction
    dec  d
    db   $E8 ; add  sp, d
    ld   de, $FAEE
    dec  d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, b
    add  a, b
    jr   nz, label_EE136
    jr   nz, label_EE138
    ld   a, [$FF00]
    jr   z, label_EE14C
    jr   z, label_EE14E
    inc  h
    ret  c
    ld   b, c
    ld   l, $87
    ld   a, c
    rst  $38
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rlca
    inc  bc
    rrca
    rlca
    rrca
    rlca
    rra
    nop
    ldh  [$FF0C], a
    dec  e
    add  a, c
    ld   a, [hl]
    ld   h, [hl]
    add  hl, de
    inc  d
    dec  bc
    inc  hl
    inc  e
    ld   de, label_F0E
    nop
    ld   b, h
    cp   b
    add  a, h
    ld   a, b
    ld   [$80F0], sp
    ld   [hl], b
    ret  nz
    and  b
    ret  nz
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

label_EE1B9::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_3E00
    ld   bc, label_1F20
    jr   label_EE1D5
    ld   a, [$FF0F]
    add  a, b
    ld   a, a
    ld   [hl], b
    rrca
    ld   hl, label_1F1E
    nop
    nop
    nop
    ld   bc, $0100
    nop
    nop
    nop
    rst  $38
    ld   a, [hl]

label_EE1E2::
    ld   a, a
    ld   a, $7E
    dec  c
    sbc  a, a
    ld   h, b
    rst  $38
    ld   [bc], a
    ld   [de], a
    dec  c
    db   $10 ; Undefined instruction
    jr   nz, label_EE20F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, a
    ld   h, h
    sbc  a, a
    ld   l, e
    rst  $18
    xor  e
    rst  $28
    rst  $10
    rst  $28
    sub  a, $CF
    or   h
    adc  a, [hl]
    ld   [hl], b
    sbc  a, d

label_EE20F::
    ld   h, h
    ld   de, label_31EE
    adc  a, $73

label_EE215::
    adc  a, h
    db   $FC ; Undefined instruction
    jr   nc, label_EE215
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    ld   a, h
    cp   b
    jp   nz, label_C2BC
    cp   h
    add  a, d
    ld   a, h
    and  d
    ld   e, h
    ldh  [$FF0C], a
    inc  e
    ld   b, d
    inc  a
    ld   b, h
    jr   c, label_EE273
    jr   c, label_EE1B9
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    sub  a, b
    ld   h, b
    sub  a, b
    ld   h, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld   [hl], d
    ld   a, [$FF6C]
    ld   [$FFD8], a
    ret  nz
    jr   nc, label_EE299
    and  b
    add  a, b
    ld   b, b
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
    db   $FC ; Undefined instruction
    ld   h, d
    ld   [rNR32], a
    add  a, b
    ld   e, b
    nop
    or   b
    nop
    ld   [rJOYP], a
    ret  nz
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

label_EE299::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $8100
    nop
    add  a, c
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
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    add  a, h
    nop
    ld   b, h
    nop
    jr   c, label_EE39E

label_EE39E::
    nop
    ld   bc, $0040
    ret  nz
    nop
    and  b
    nop
    jr   nz, label_EE3A8

label_EE3A8::
    jr   nz, label_EE3AA

label_EE3AA::
    stop
    stop
    stop
    ld   [label_840], sp
    ld   b, b
    inc  b
    ld   b, b
    ld   [bc], a
    ld   h, b
    ld   bc, $0060
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    jr   nz, label_EE3BF
    nop
    nop
    nop
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
    ld   [label_1800], sp
    nop
    jr   z, label_EE3D8

label_EE3D8::
    ret  z
    nop
    ld   [label_700], sp
    nop
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
    ret  nz
    nop
    jr   nz, label_EE3EE

label_EE3EE::
    jr   nz, label_EE3F0

label_EE3F0::
    ret  nz
    nop
    nop
    nop
    inc  b
    nop
    inc  b
    nop
    ld   a, [bc]
    nop
    db   $F2 ; Undefined instruction
    nop
    ld   bc, $0000
    inc  e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_600
    nop
    ld   [label_1000], sp
    nop
    ld   [rSB], a
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
    jr   label_EE42A

label_EE42A::
    jr   z, label_EE42C

label_EE42C::
    jr   z, label_EE42E

label_EE42E::
    ld   d, b
    nop
    sub  a, b
    nop
    sub  a, b
    nop
    stop
    stop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [$82C0], sp
    nop
    ld   a, h
    nop
    nop
    ld   bc, label_700
    nop
    rra
    inc  bc
    rst  $38
    adc  a, a
    rst  $38
    ld   a, a
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
    ld   b, d
    nop
    inc  a
    nop
    nop
    nop
    nop
    add  a, c
    nop
    rst  $38
    nop
    rst  $38
    jp   label_FFFF
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
    rlca
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    ld   b, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    jr   nz, label_EE4A1
    ld   [hl], b
    rst  $38
    ld   a, b
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
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    rst  $38
    rst  $38
    rst  $38
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
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   label_EE4E9
    ld   a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    rlca
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FF
    rst  $38
    rrca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    rlca
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld    hl, sp+$00
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    rst  $38
    ld    hl, sp+$FF
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_200
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    pop  bc
    add  a, c
    rst  $38
    ld   a, a
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
    add  a, b
    nop
    ld   b, b
    nop
    ld   [hl], c
    add  a, b
    ld   e, $C0
    nop
    ld    hl, sp+$80
    rst  $38
    rst  $38
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
    ld   a, [$FF00]
    sbc  a, a
    jr   nz, label_EE597

label_EE597::
    ccf
    ld   b, b

label_EE599::
    ld   a, a
    pop  bc
    rst  $38
    ccf
    rst  $38

label_EE59E::
    rst  $38
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
    ld   l, b
    jr   nz, label_EE599
    jr   nz, label_EE59E
    ld   a, b
    rst  0
    rst  $38
    db   $10 ; Undefined instruction
    ld    hl, sp+$FF
    rst  $38
    rst  $38
    rst  $38
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
    ld   a, b
    nop
    add  a, a
    ld   b, b
    ret  nz
    ld   [rJOYP], a
    ld    hl, sp+$00
    rst  $38
    sbc  a, a
    rst  $38
    rst  $38
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
    inc  bc
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    ld   [hl], c
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
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
    pop  bc
    nop
    and  c
    ret  nz
    ld   e, a
    ld   h, c
    ld   [hl], b
    ld    hl, sp+$F8
    cp   $FF
    rst  $38
    rst  $38
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
    add  a, c
    nop
    ld   h, d
    nop
    inc  e
    nop
    nop
    jp   label_E701
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, b
    nop
    ld   sp, label_E80
    ret  nz
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, b
    nop
    sub  a, c
    nop
    ld   c, $00
    nop
    pop  af
    ld   a, [$FFFF]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [label_101B], sp
    dec  [hl]
    jr   nz, label_EE894
    ld   b, b
    rst  $28
    sub  a, b
    rst  $10
    nop
    rst  8
    ld   bc, label_36F
    ld   a, a
    ld   b, $FB
    inc  c

label_EE82A::
    rst  $30
    jr   label_EE82A

label_EE82D::
    jr   nc, label_EE82D
    ld   h, b
    db   $FC ; Undefined instruction
    ld   h, b
    rst  $30
    add  a, c
    rst  $20
    inc  bc
    rst  $28
    inc  bc
    cp   a
    rlca
    ld   a, a
    ld   c, $7F
    inc  e
    rst  $38
    jr   c, label_EE840
    rst  $38
    ld   e, a
    rst  $30
    ccf
    jp  c, label_EC2BF
    ld   a, [$FF0F]
    ld   [$FF1F], a
    db   $F4 ; Undefined instruction
    dec  bc
    ld   d, b
    cpl
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    reti
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, $FF
    add  a, b
    rst  $38
    rst  $38
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
    rst  $38
    ret  nz
    ccf
    jr   nc, label_EE894
    ld   [label_407], sp
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $00FF
    rst  $38
    nop

label_EE894::
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    ld   a, [$FF10]
    ld   [rNR41], a
    rst  $38
    rrca
    ld   a, [$FF70]
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
    ld   [rNR41], a
    ld   [rNR41], a
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b

label_EE8F0::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    nop
    nop
    inc  bc

label_EE901::
    ld   bc, label_607
    rrca
    inc  c
    ld   e, $18
    ccf
    jr   nz, label_EE984
    ld   b, d
    ld   l, e
    ld   d, b
    cp   a
    ret  nz
    rst  0
    jr   label_EE901
    ld   bc, label_59B
    cp   a
    ld   [bc], a
    ld   l, [hl]
    ld   e, $EA
    jr   label_EE8F0
    jr   nz, label_EE926
    ld   [$FFD3], a
    ld   h, b
    or   a
    ret  nz
    rst  $18
    add  a, c

label_EE926::
    sbc  a, a
    inc  bc
    ld   a, a
    ld   b, $FF
    inc  b
    cp   $18
    db   $FC ; Undefined instruction
    jr   label_EE92D
    ld   a, b
    ld    hl, sp+$A0
    db   $F2 ; Undefined instruction
    ret  nz
    db   $E3 ; Undefined instruction
    nop
    db   $D3 ; Undefined instruction
    nop
    rla
    nop
    ld   l, a
    ld   bc, label_7DF
    ld    hl, sp+$87
    db   $E8 ; add  sp, d
    rla
    ld   a, [$FF0F]
    ld   e, [hl]
    or   l
    cp   a
    ld   a, a
    rst  $38
    rst  $38
    ld    hl, sp+$FF
    ret  nz
    cp   a
    jr   nz, label_EE951
    jr   nz, label_EE953
    ld   h, a
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    adc  a, b
    rst  $38
    add  a, b
    rst  $38
    add  hl, hl
    rst  $38
    cp   $FF
    cp   $FF
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    ld   a, [$FF10]
    ld   a, [$FF10]
    rst  $38
    rrca
    ld   a, [$FF70]

label_EE984::
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
    rst  $38
    ld   [$FF1F], a
    jr   label_EE99C
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rrca
    ld   a, [$FF30]
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    jr   c, label_EE9C2
    inc  b
    inc  bc
    inc  bc
    ld   bc, $E001
    jr   nz, label_EE983
    ld   b, b
    ret  nz
    ld   b, b
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
    rst  $38
    ret  nz
    ccf
    jr   nz, label_EE9F4
    db   $10 ; Undefined instruction
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
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop

label_EE9F4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $28
    add  a, b
    cp   $81
    db   $FC ; Undefined instruction
    add  a, e
    cp   $8C
    ld    hl, sp+$D0
    ld   [hl], a
    ld   [hl], b
    ld   a, e
    ld   h, b
    ld   d, a
    ld   b, b
    rra
    ret  nz
    cpl
    add  a, c
    sbc  a, a
    inc  bc
    cp   a
    ld   c, $FF
    inc  e
    rst  $38
    jr   nc, label_EEA1C
    ld   d, b
    db   $FD ; Undefined instruction
    ld   h, b
    ei
    ld   [$FFF6], a
    add  a, b
    push hl
    nop

label_EEA26::
    rst  $20
    nop
    and  a
    nop
    xor  a
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ld   c, $3F
    ld   c, $FF
    inc  e
    rst  $38
    jr   nc, label_EEA36
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   d, b
    xor  a
    ret  nc
    cpl
    ld   [$FF1F], a
    ret  nc
    cpl
    ld   a, [$FF0F]
    ld   c, b
    scf
    db   $E4 ; Undefined instruction
    dec  de
    ret  c
    daa
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
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    db   $10 ; Undefined instruction
    ldi  [hl], a
    rst  $38
    rra
    ld   d, $DF
    pop  de
    cpl
    jr   z, label_EEA26
    xor  e
    xor  [hl]
    xor  d
    adc  a, h
    adc  a, h
    ld   l, b
    ld   [label_303], sp
    nop
    nop
    nop
    ld   bc, label_704
    dec  bc
    inc  c
    rra
    db   $10 ; Undefined instruction
    jr   nz, label_EEB0B
    ld   b, c
    xor  $91
    ld   a, a
    ld   a, a
    db   $10 ; Undefined instruction
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$9805]
    ld   h, a
    adc  a, b
    ld   [hl], a
    cp   a
    ld   a, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret  nz
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    sbc  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_28FF], sp
    rst  $38
    cp   $FF
    inc  a
    nop
    jp   label_1800
    rst  $20
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EEAFF::
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, c
    rst  $38
    add  a, e
    rst  $38
    adc  a, d
    rst  $38
    call z, label_EF87F
    ld   a, a
    ld   l, b
    ld   a, a
    ld   b, b
    db   $FD ; Undefined instruction
    ret  nz
    rst  $30
    add  a, b
    and  a
    nop
    xor  a
    ld   bc, label_19F
    ld   a, a
    rlca
    rst  $38
    inc  c
    cp   $1A
    rst  $38
    ld   [label_30FF], sp
    rst  $38
    ld   [rIE], a
    ret  nz
    ld   sp, hl
    ret  nz
    or   $08
    cp   $00
    rst  $28
    nop
    ld   a, [$EB00]
    nop
    and  a
    nop
    cp   a
    nop
    sbc  a, $01
    db   $FD ; Undefined instruction
    inc  bc
    ei
    rlca
    rst  $38
    ld   c, $C0
    ccf
    adc  a, h
    ld   [hl], e
    rrca
    rst  $38
    ld   a, a
    rst  $38
    ld    hl, sp+$F7
    ret  nc
    xor  a
    ret  nz
    ccf
    ld   a, [$FF0F]
    ld   b, d
    rst  $38
    ld   h, a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    nop
    rst  $38
    ld   l, d
    rst  $38
    xor  l

label_EEB63::
    rst  $38
    rst  $38
    rst  $38
    ld   [rIE], a
    nop
    rst  $38
    inc  b
    rst  $38
    nop
    rst  $38
    ld   b, $FF
    ld   bc, label_301
    ld   [bc], a
    rlca
    inc  b
    dec  bc
    inc  c
    rra
    db   $10 ; Undefined instruction
    ldd  [hl], a
    ld   l, e
    ld   d, b
    ld   a, a
    ret  nz
    add  a, $19
    sbc  a, $01
    cp   e
    inc  b
    cp   l
    inc  bc
    jp   [hl]
    rla
    rst  $20
    ld   e, $DF
    inc  l
    ld   c, l
    cp   b
    ld   b, $FF
    jr   nc, label_EEB63
    ld   a, d
    push bc
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    ld   c, b
    rlca
    ld   a, a
    cpl
    rst  $38
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
    ld   d, h
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $38
    jr   nz, label_EEBB3
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    db   $E4 ; Undefined instruction
    rst  $38
    xor  [hl]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   h, b
    rst  $38
    add  a, b
    jp   label_CF8D
    add  a, a
    rst  $38
    rst  8
    rst  $30
    call z, label_EFC67
    ld   [hl], a
    ld   a, b
    ccf
    ret  c
    cp   $E0
    rst  $38
    ret  nz
    db   $FD ; Undefined instruction

label_EEC17::
    adc  a, b
    push af
    inc  d
    rst  $28
    ld   [$00BF], sp
    xor  a
    nop
    rst  0
    nop
    rst  $28
    nop
    ld   a, a
    nop
    ld   a, [hl]
    add  a, c
    cp   a
    ld   b, e
    di
    ld   e, $FF
    inc  a
    rst  $38
    ld   [$FFDF], a
    scf
    cp   c
    ld   l, c
    ld   sp, hl
    ld   c, c
    cp   $C7
    cp   $01
    db   $F4 ; Undefined instruction
    nop
    db   $EB ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rrca
    ld   a, b
    add  a, a
    ld   h, b
    sbc  a, a
    jr   nc, label_EEC17
    ld   l, h
    sub  a, e
    ret  nc
    cpl
    ld   [$FF1F], a
    ret  nc
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   nz, label_EEC57
    nop
    rst  $38
    inc  d
    rst  $38
    db   $10 ; Undefined instruction
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
    ld   [label_AFF], sp
    rst  $38
    ld   a, [bc]
    rst  $38
    ld   c, e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [$A9FF], sp
    rst  $38
    and  c
    rst  $38
    rst  $38
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
    dec  d
    rst  $38
    rst  $38
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
    jr   nz, label_EEC9B
    ld   h, $FF
    rst  $38
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
    add  a, l
    rst  $38
    and  l
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [bc], a
    rst  $38
    ld   a, [hli]
    rst  $38
    jr   z, label_EECBD
    rst  $38
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
    inc  bc
    inc  bc
    inc  c
    inc  c
    jr   c, label_EED0E
    cp   $C6
    rst  0
    ld   bc, $008F
    ccf
    ld   [bc], a
    rst  $38
    rlca
    ret  nz
    ret  nz
    ld   a, $3E
    rra
    ld   de, label_80F
    rlca
    inc  b
    add  a, a
    add  a, h
    jp   label_EC43
    inc  l
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ld   [$FF60], a
    ld   a, [$FF10]
    ld    hl, sp+$08
    db   $FC ; Undefined instruction
    call nz, label_EC47C
    rst  $28
    ret  nc
    ld   a, [$F180]
    add  a, b
    rst  $20
    add  a, b
    rst  $28
    add  a, b
    ei
    add  a, l
    ei
    add  a, a

label_EED0E::
    ld   a, a
    rst  8
    rlc  l
    rst  $38
    rlca
    rst  $38
    ld   c, $BF
    ld   e, h
    rst  $38
    ld   [hl], b
    rst  $38
    ld   [$FFFE], a
    add  a, b
    rst  $38
    nop
    ld   sp, hl
    add  a, [hl]
    db   $FC ; Undefined instruction
    ld   [bc], a
    rst  $28
    nop
    add  a, a
    nop
    ld   [hl], a
    nop
    ld   a, e
    dec  b
    rst  $18
    inc  hl
    ld   c, [hl]
    or   a
    xor  a
    ld   de, label_37F
    rst  $38
    rlca
    di
    ld   a, $CF
    ld   a, h
    cp   a
    ld   a, [$FF7F]
    ret  nz
    db   $FD ; Undefined instruction
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    jp   nz, label_30FD
    rst  8
    cp   b
    ld   b, a
    ld   a, b
    add  a, a
    ld   a, b
    add  a, a
    db   $E4 ; Undefined instruction
    dec  de
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_EED59
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_EED79
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_EED99
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    db   $10 ; Undefined instruction
    ld   h, b
    rst  $38
    or   b
    rst  $38
    cp   b
    rst  $38
    ld    hl, sp+$FF
    jr   c, label_EEDB9
    nop
    rst  $38
    jr   nz, label_EEDBD
    jr   nc, label_EEDBF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  a
    jp   z, label_CA4A
    jp   z, label_C8C8
    adc  a, b
    adc  a, b
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
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
    ld   a, a
    ld   a, h
    ld   a, a
    ld   [hl], b
    ld   a, a
    ld   [hl], b
    ld   a, a
    ld   b, b
    db   $F2 ; Undefined instruction
    pop  bc
    db   $F2 ; Undefined instruction
    add  a, c
    ld   a, [$F781]
    adc  a, b
    db   $E3 ; Undefined instruction
    nop
    ret  nc
    inc  bc
    ld   a, a
    nop
    ld   h, $19
    ld   sp, hl
    rlca
    ld   sp, hl
    rrca
    ld   [hl], a
    cp   [hl]
    cp   $F8
    ld   a, e
    sbc  a, a
    db   $EC ; Undefined instruction
    ld   a, $1C
    db   $F2 ; Undefined instruction
    ld   a, h
    db   $E3 ; Undefined instruction
    push hl
    ret  nz
    db   $EC ; Undefined instruction
    nop
    sbc  a, [hl]
    nop
    ld   [hl], e
    dec  c
    ld   a, a
    add  a, b
    scf
    ret  nz
    ld   sp, label_FC2
    ret  nc
    ld   d, a
    adc  a, c
    ccf
    rst  $18
    ld   [hl], d
    ld   l, l
    jp   label_A4FC
    ld   e, e
    db   $E4 ; Undefined instruction
    dec  de
    or   b
    ld   c, a
    halt
    ld   [$FFDF], a
    nop
    rst  $38
    nop
    rst  $38
    sub  a, d
    ld   l, l
    ld   b, b
    rst  $38
    ld   d, b
    rst  $38
    rst  $38
    cp   a
    rst  $38
    rst  $38
    sbc  a, a
    ld   a, a
    jr   label_EEE5B
    nop
    rst  $38
    nop
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   c, [hl]
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    ld   d, b
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    ld   e, a
    rst  $38
    ret  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   c, [hl]
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, b
    rst  $38
    ld   d, b
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    ld   e, a
    rst  $38
    ret  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldd  [hl], a
    rst  $38
    ld   c, [hl]
    rst  $38
    rst  $28
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   c, label_EEEB1
    ld   a, b
    rst  $38
    cp   $FF
    rst  $38
    rst  $38
    adc  a, $FF
    ld   b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_EEEE4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ei
    push bc

label_EEF02::
    rst  $38
    ld   [hl], d
    rst  $28
    ld   l, h
    cp   $F4
    ld   sp, hl
    ld   [$FF7B], a
    ret  nz
    ld   a, c
    add  a, $1D
    ldh  [$FF0C], a
    rst  $38
    ret  nz
    rst  $18
    rrca
    sbc  a, e
    dec  bc
    dec  sp

label_EEF17::
    dec  bc
    rst  $38
    rlca
    ld   e, a
    and  [hl]
    ccf
    ld    hl, sp+$FF
    ret  nz
    rst  $18
    daa
    jp  c, label_F92D
    ld   [hl], $FD
    ldh  [$FF0C], a
    db   $FD ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $28
    db   $10 ; Undefined instruction
    ld   d, h
    rst  $20
    jr   label_EEF02
    jr   nc, label_EEEE4
    ld   d, b
    daa
    ret  c
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    ret  c
    daa
    ld    hl, sp+$07
    ld   a, [$FF0F]
    call nc, label_EF82B
    add  a, a
    db   $E8 ; add  sp, d
    rla
    db   $F4 ; Undefined instruction
    dec  bc
    jr   c, label_EEF17
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    rst  $38
    nop
    nop
    jr   nz, label_EF00A

label_EF00A::
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    ld   a, a
    ld   b, b
    ld   a, a
    ld   h, b
    ccf
    jr   nc, label_EF03C
    db   $10 ; Undefined instruction

label_EF01F::
    jr   label_EF01F
    inc  bc
    cp   $03
    rst  $38
    ld   bc, $00FF
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
    ret  nz
    ccf
    ld   [$FF9F], a
    ld   a, [$FF8F]
    ld    hl, sp+$C7
    ld   a, h

label_EF03C::
    db   $E3 ; Undefined instruction
    ld   a, $E3
    ccf
    nop
    rst  $38
    nop
    ld   bc, label_9F4
    db   $FC ; Undefined instruction
    ld   bc, label_1FC
    db   $EC ; Undefined instruction
    ld   de, label_1FC
    nop
    rst  $38
    cp   $40
    cp   $20
    rst  $38
    jr   nz, label_EF056
    db   $10 ; Undefined instruction
    jr   label_EF05A
    ld   [label_8FF], sp
    rst  $38
    inc  b
    rlca
    nop
    rlca
    nop
    rlca
    nop
    inc  bc
    nop
    inc  bc
    nop
    add  a, e
    nop
    add  a, e
    nop
    add  a, e
    nop
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    cp   $03
    cp   $03
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    rst  $38
    add  a, c
    ld   a, a
    pop  bc
    ld   a, a
    pop  bc
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
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
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, label_11EE
    cp   $01
    cp   $01
    cp   $01
    cp   $01
    nop
    rst  $38
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ccf
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FFFC], a
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$0F
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, [hl]
    add  a, c
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    nop
    rst  $38
    ld   a, a
    ld   [$FF7F], a
    ret  nz
    ld   a, a
    ret  nz
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
    cp   h
    ld   b, b
    cp   h
    ld   b, b
    cp   h
    ld   b, b
    cp   h
    ld   b, b
    cp   h
    ld   b, b
    inc  a
    ret  nz
    ld   a, h
    add  a, b
    ld   a, h
    add  a, b
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    ld   [hl], b
    nop
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    ld   [label_407], sp
    rlca
    ld   b, $03
    ld   [bc], a
    inc  bc
    ld   [bc], a
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, rJOYP
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   e, a
    and  b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    nop
    rst  $38
    pop  af
    rra
    ld   a, [$FF1F]
    ld    hl, sp+$0F
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    cp   $03
    cp   $03
    rst  $38
    ld   bc, $00FF
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ld   a, a
    ret  nz
    ld   a, a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF1F], a
    ld   a, [$FFFF]
    ld   b, $FF
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    pop  bc
    nop
    pop  bc
    nop
    pop  hl
    nop
    pop  hl
    nop
    pop  hl
    nop
    ld   [$FF80], a
    ld   a, [$FF80]
    ld   a, [$FF80]
    cp   $03
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF9F], a
    ld   a, [$FF9F]
    ld   a, [$FF8F]
    ld    hl, sp+$8F
    ld    hl, sp+$C0
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
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
    ccf
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FFF8], a
    rrca
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    inc  bc
    cp   $03
    cp   $03
    cp   $03
    cp   $FE
    ld   bc, label_1FE
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    ei
    ld   b, $FB
    ld   b, $7C
    add  a, b
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [rJOYP], a
    nop
    nop
    ld   b, $00
    nop
    rst  $38
    nop
    nop
    jr   nz, label_EF20A

label_EF20A::
    nop
    nop
    nop
    nop
    nop
    add  a, b
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
    rst  $38
    nop
    rst  $38
    nop
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
    nop
    rst  $38
    ld   [rJOYP], a
    rlca
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_EE000
    nop
    nop
    nop
    sbc  a, a
    ld   a, [$FF8F]
    ld    hl, sp+$C7
    ld   a, h
    rst  0
    ld   a, [hl]
    jp   label_E17E
    ccf
    ld   [$FF3F], a
    ld   [$FF3F], a
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
    add  a, b
    rst  $38
    add  a, b
    ld   a, [$FF80]
    ld    hl, sp+$40
    db   $FC ; Undefined instruction

label_EF265::
    ld   h, b
    db   $FC ; Undefined instruction
    jr   nz, label_EF265

label_EF269::
    jr   nc, label_EF269

label_EF26B::
    jr   label_EF26B
    jr   label_EF26E
    inc  c
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
    rra
    nop

label_EF27C::
    rra
    nop
    rra
    nop
    rst  8
    ld   a, b
    rst  0
    ld   a, h
    rst  $20
    inc  a
    db   $E3 ; Undefined instruction
    ld   a, $F3
    ld   e, $F3
    ld   e, $F9
    rrca
    ld   sp, hl
    rrca
    ld   [$FF3F], a
    db   $E3 ; Undefined instruction
    ccf
    db   $F2 ; Undefined instruction
    ld   e, $F3
    ld   e, $F3
    rra
    cp   $0C
    ei
    rrca
    ld    hl, sp+$0F
    nop
    rst  $38
    jr   nc, label_EF2A3
    ret  nc
    rst  $18
    ld   d, b
    rra
    jr   label_EF2B9
    inc  b
    rlca
    cp   h
    cp   a
    and  b
    cp   a
    ccf
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a

label_EF2B9::
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   [$FFF8], a
    rrca
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    inc  bc
    cp   $07
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rrca
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    ld    hl, sp+$1F
    ld   a, [$FFF3]
    ld   c, $F7
    inc  c
    rst  $20
    inc  e
    rst  $20
    inc  e
    rst  0
    inc  a
    rst  8
    jr   c, label_EF27C
    ld   a, b
    rra
    ld   a, [$FFE0]
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    ret  nz
    nop
    add  a, c
    nop
    add  a, c
    nop
    add  a, e
    nop
    inc  bc
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   a, d
    add  a, l
    ld   h, b
    sbc  a, a
    rst  $18
    jr   nz, label_EF30B

label_EF30B::
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nz, label_EF38D
    sub  a, a
    ld   a, e
    sub  a, h
    rst  $38
    ld   [label_800], sp
    ld   [rIE], sp
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ei
    ret  nz
    ld   a, e
    ld   b, b
    ld   a, e
    ld   b, b
    ld   a, e
    ld   b, b
    ld   a, l
    ld   b, b
    nop
    rst  $38
    ld   [rJOYP], a
    rlca
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_EE000
    nop
    rst  $38
    rst  $38
    ld   a, [$FF1F]
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    rlca
    cp   $03
    cp   $03
    rst  $38
    ld   bc, $C07F
    ld   a, a
    jp   label_E23E
    ccf
    ldh  [$FF0C], a
    ccf
    db   $E3 ; Undefined instruction
    ld   e, $F4
    rra
    di
    rrca
    ld    hl, sp+$FF
    inc  c
    rst  $38
    ld   [hl], $DF
    db   $D3 ; Undefined instruction
    ld   e, a
    ld   de, label_81F
    rlca
    inc  b
    cp   a
    cp   h
    cp   a
    and  b
    rrca
    nop
    add  a, a
    nop
    add  a, e
    nop
    add  a, e
    nop
    pop  bc
    add  a, b
    pop  bc
    ret  nz
    pop  hl
    ld   b, b
    rst  $30
    ld   h, a
    rst  $38
    ld   a, a
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    jr   nz, label_EF38A
    db   $10 ; Undefined instruction

label_EF38D::
    ld    hl, sp+$07
    inc  b
    rst  $38
    rst  $38
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

label_EF39F::
    nop
    ret  nz
    rst  $38
    ld    hl, sp+$3F
    rst  $38
    rlca
    db   $FD ; Undefined instruction
    inc  bc
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf

label_EF3B1::
    ld   [$FF3F], a
    ld   a, [$FF2F]
    db   $E8 ; add  sp, d
    rst  $20
    db   $E4 ; Undefined instruction
    ld   h, e
    ldh  [$FF0C], a
    ld   hl, $E0E1
    jr   nz, label_EF39F
    jr   nz, label_EF3B1
    rra
    ld   a, [$FF1F]
    ld   a, [$FF1F]
    db   $FC ; Undefined instruction
    rra
    db   $FC ; Undefined instruction
    ld   h, a
    db   $EC ; Undefined instruction
    add  a, a
    jr   label_EF3DD
    jr   label_EF3DF
    rra

label_EF3D1::
    ld   a, [$FF1E]
    pop  af
    inc  e
    di
    inc  e
    di
    jr   label_EF3D1
    jr   c, label_EF3C3
    jr   nc, label_EF3CD
    jr   nz, label_EF3DF
    rra
    ld   a, [$FF1F]
    ld   a, [$FF3F]
    ld   [$FF3E], a
    ld   [$FF7C], a
    ret  nz
    ld   a, b
    ret  nz
    ld   a, b
    ret  nz
    pop  af
    add  a, b
    rlca
    nop
    rrca
    nop
    rra
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
    rst  $28
    inc  d
    and  a
    ld   e, d
    ld   bc, rSB
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   [label_5FE], sp
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    dec  a
    jr   nz, label_EF45F
    jr   nz, label_EF443
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_80F], sp
    rrca
    ld   [$00FF], sp
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
    ld   a, a
    nop
    ccf
    nop
    rst  $38
    nop
    rst  $38

label_EF443::
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
    add  a, a
    db   $FC ; Undefined instruction
    add  a, a
    db   $FC ; Undefined instruction
    add  a, e
    cp   $C1
    ld   a, a
    pop  bc
    ld   a, a
    ld   [$FF3F], a
    ld   [$FF3F], a
    ld   a, [$FF1F]
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   bc, label_2FE
    db   $FC ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    add  a, h
    ld   a, e
    jp   label_E03C
    ld    hl, sp+$38
    rst  $20
    ld   h, b
    sbc  a, a
    sbc  a, b
    ld   h, a
    inc  h
    db   $E3 ; Undefined instruction
    ldi  [hl], a
    pop  hl
    ld   hl, label_20E0
    ld   [rNR41], a
    rst  $38
    inc  b
    cp   $09
    rst  $38
    inc  de
    rst  $38
    inc  e
    rst  $38
    ld   h, h
    rst  8
    add  a, h
    inc  e
    dec  bc
    jr   label_EF49F
    rst  $38
    nop
    ld   bc, $FFFE
    rst  $38
    add  a, b
    ld   a, a
    rst  $38
    nop
    rst  $38
    nop
    nop
    rst  $38
    inc  bc

label_EF49F::
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    inc  bc
    call z, label_FFC
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    add  hl, sp
    pop  bc
    and  $06
    ret  nz
    ret  nz
    inc  b
    inc  b
    inc  c
    inc  b
    jr   c, label_EF4D0
    ld   [$FFE0], a
    jp   label_86C3
    add  a, e
    inc  h
    daa
    jr   nc, label_EF4E1
    jr   nz, label_EF503
    jr   nz, label_EF505
    db   $10 ; Undefined instruction
    ld   [label_40F], sp
    rlca
    ldh  [$FF0C], a
    db   $E3 ; Undefined instruction
    rra
    rst  $38

label_EF4D0::
    jr   nz, label_EF4D1
    ld   b, c
    rst  $38
    ld   b, c
    rst  $38
    ld   b, c
    rst  $38
    jp   label_83FE
    cp   $87
    db   $FC ; Undefined instruction
    add  a, a
    db   $FC ; Undefined instruction
    pop  af

label_EF4E1::
    add  a, b
    db   $E3 ; Undefined instruction
    nop
    rst  $20
    nop
    rst  $38
    ld   bc, label_3FF
    rst  $38
    ld   b, $FF
    inc  c
    rst  $38
    jr   label_EF4F0
    ld   hl, label_EC1FF
    cp   $82
    cp   $02
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld   a, [$FF10]
    rst  $38
    rst  $38
    rst  $38

label_EF503::
    ld   bc, label_DF3
    adc  a, a
    ld   [hl], b
    ld   a, $C1
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ldh  [$FF0C], a
    sbc  a, l
    xor  $D1
    db   $FC ; Undefined instruction
    ld   b, e
    nop
    ld   b, b
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rrca
    ld   [label_407], sp
    rlca
    inc  b
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
    ccf
    ld   [label_83F], sp
    cp   a
    inc  b
    sbc  a, a
    ld   [bc], a
    sbc  a, a
    ld   [bc], a
    sbc  a, a
    ld   bc, label_19F
    rst  $18
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
    add  a, b
    ld    hl, sp+$0F
    ld    hl, sp+$0F
    db   $FC ; Undefined instruction
    rlca
    cp   $03
    cp   $03
    rst  $38
    ld   bc, label_1FF
    rst  $38
    nop
    rra
    ld   a, [$FF0F]
    ei
    inc  b
    db   $FC ; Undefined instruction
    rrca
    rst  $38
    dec  e
    di
    dec  de
    rst  $30
    inc  d
    db   $FC ; Undefined instruction
    sbc  a, b
    ld    hl, sp+$C0
    ret  nz
    add  a, e
    add  a, e
    inc  bc
    nop
    nop
    nop
    ldh  [$FF0C], a
    ld   [$FF27], a
    and  e
    ld   h, $22
    inc  l
    inc  h
    jr   nc, label_EF5A1
    jr   nz, label_EF584

label_EF584::
    rst  $38
    rst  $38
    nop
    nop
    rrca
    ld   [label_4C4], sp
    db   $F2 ; Undefined instruction
    ldh  [$FF0C], a
    ld   e, $1E
    nop
    ld    hl, sp+$01
    inc  bc
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   bc, rJOYP
    nop
    rla
    nop
    nop
    nop
    nop
    nop
    jr   label_EF5BA
    db   $E3 ; Undefined instruction

label_EF5A3::
    ld   [rTAC], a
    ld   [label_1FF8], sp
    adc  a, $07
    scf
    ld   bc, $000B
    ld   bc, $E800

label_EF5B1::
    daa
    jr   c, label_EF5A3
    ld   a, [$FFBF]
    ld    hl, sp+$07
    inc  e
    db   $E3 ; Undefined instruction

label_EF5BA::
    inc  c
    di
    add  a, d
    db   $FD ; Undefined instruction
    ld   [$FF7F], a
    add  hl, bc
    rst  $38
    dec  bc
    rst  $38
    ld   a, [bc]
    rst  $38
    ld   a, [bc]
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    adc  a, a
    ld    hl, sp+$1F
    ld   a, [$FF1F]
    ld   a, [$FF3F]
    ld   [$FF3F], a
    pop  hl
    ld   a, a
    jp   label_C67F
    ld   a, a
    call z, label_30FF
    rst  $38
    ld   h, b
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   bc, label_2FE
    cp   $02
    ld   a, [$FF10]
    ld   [rNR41], a
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, a
    rst  $38
    and  b
    ld   h, b
    ret  nc
    jr   nc, label_EF5B1
    ld   e, b
    sub  a, h
    ld   l, a
    ld   a, [bc]
    or   $01
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    jr   nc, label_EF61C

label_EF61C::
    nop
    nop
    add  a, b
    add  a, b
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
    rst  $18
    nop
    rst  $18
    nop
    rst  8
    nop
    rst  $28
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    jr   nz, label_EF646
    db   $10 ; Undefined instruction
    ld   [label_9FF], sp
    rst  $38
    dec  b
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, b
    rst  $38
    ret  nc
    cp   a
    adc  a, b
    adc  a, a
    add  a, h
    rlca
    ld   [bc], a
    inc  bc
    ld   bc, label_EE0E0
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    jp   label_C443
    ld   b, h
    ret  z
    ld   c, b
    ld   a, [$FF30]
    jr   c, label_EF69A
    ccf
    cpl
    jr   c, label_EF6AE
    ret  nz
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
    rst  $38
    rst  $38
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
    db   $EC ; Undefined instruction
    ld   a, [$FFFF]
    rrca
    rst  $38
    nop
    rst  $38
    nop

label_EF69A::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    nop

label_EF6A1::
    nop
    nop
    nop
    nop
    nop
    ret  nz

label_EF6A7::
    ret  nz
    pop  af
    jr   nc, label_EF6A7
    inc  c
    di
    inc  hl

label_EF6AE::
    di
    jr   nz, label_EF6A1
    ccf
    jr   c, label_EF6D3
    ld   a, h
    rrca
    ld   e, [hl]
    rlca
    ld   l, $03
    ld   e, a
    ld   bc, $006F
    cp   a
    add  a, b
    call z, label_283F
    rst  $18
    ld   de, label_12FF
    rst  $38
    inc  de
    rst  $38
    ld   [de], a
    cp   $8E
    cp   $8C
    db   $FC ; Undefined instruction
    ld   a, a
    ret  nc
    rst  $38

label_EF6D3::
    ret  nc
    rst  $38
    ld   [$FFBF], a
    and  b
    ccf
    jr   nz, label_EF6FA
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$08
    db   $FD ; Undefined instruction
    ld   [label_8FD], sp
    db   $FD ; Undefined instruction
    inc  b
    db   $FC ; Undefined instruction

label_EF6ED::
    inc  b
    cp   $02
    nop
    nop
    stop
    stop
    ld   b, b
    nop
    ld   d, b
    nop

label_EF6FA::
    inc  b
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    ld   e, $E1
    ld   a, h
    add  a, e
    cp   c
    ld   b, [hl]
    di
    adc  a, h
    rst  $20
    ld   e, b
    ld   [rNR41], a
    rst  $38
    ccf
    ld   b, b
    ret  nz
    and  d
    ld   h, b
    ld   d, b
    cp   a
    db   $E8 ; add  sp, d
    jr   label_EF6ED
    inc  l
    ld   a, [bc]
    or   $01
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    nop
    adc  a, h
    ld   [hl], e
    sbc  a, h
    ld   h, e
    reti
    and  [hl]
    di
    ld   c, h
    di
    inc  l
    ld   a, [$FF10]
    rst  $38
    rrca
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ccf
    jr   nz, label_EF776
    jr   nz, label_EF778
    jr   nz, label_EF77A
    jr   nz, label_EF77C
    jr   nz, label_EF7BE
    ld   b, b
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_3FF
    inc  bc
    nop
    ld   bc, $0000
    nop
    ld   b, b
    ld   b, b
    ld   h, b
    jr   nz, label_EF7CB
    db   $10 ; Undefined instruction
    add  hl, bc
    dec  a
    dec  b
    ld   [$FFE0], a
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   bc, label_3001
    jr   nc, label_EF771

label_EF771::
    nop
    nop
    nop
    nop
    nop

label_EF776::
    nop
    nop

label_EF778::
    ld   bc, label_301
    inc  bc

label_EF77C::
    adc  a, h
    adc  a, h
    ld   a, b
    ld   a, b
    ld   bc, label_EC300
    ld   b, c
    ld   b, a
    ld   b, c
    rst  8
    jp   nz, label_829F
    ccf
    ld   b, $7B
    ld   a, [bc]
    rst  $30
    dec  d

label_EF790::
    rst  $38
    nop
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    dec  b
    cp   $06
    ei
    dec  de
    ld   [$FF60], a
    add  a, b
    add  a, b
    pop  af
    ld   d, b
    ret  nc
    ld   d, b
    sbc  a, b
    adc  a, b
    inc  c
    inc  b
    ld   c, $02
    add  a, a
    add  a, c
    pop  hl
    ld   [rNR24], a
    jr   label_EF790
    ld   b, b
    xor  $21
    halt
    inc  a
    dec  bc
    inc  e
    rlca
    adc  a, [hl]
    inc  bc
    rst  0
    pop  bc

label_EF7BE::
    di
    ld   hl, $F848
    ld   [hl], b
    ld   a, [$FF60]
    ld   [rLCDC], a
    ret  nz
    ld   b, e
    jp   label_8487
    adc  a, a
    adc  a, b
    cp   a
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    sub  a, b
    sub  a, c
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [bc], a
    rst  $38
    ld   bc, label_1FF
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
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    rst  $38
    ld   a, [$FFFC]
    dec  bc
    adc  a, $35
    rla
    ld   [label_9F7], a
    nop
    ld   bc, rSB
    rst  $38
    rst  $38
    rst  $30
    ld   [$C33C], sp
    ld   sp, hl
    ld   b, $73
    adc  a, h
    rst  0
    jr   c, label_EF81B

label_EF81B::
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    ld   b, [hl]
    ret  nz
    and  b
    ld   h, b
    ret  nc
    ccf
    xor  b
    ld   e, b
    sub  a, h
    ld   l, h
    ld   [bc], a

label_EF82B::
    ld   b, $02
    cp   $FE
    cp   $7F
    ld   b, b
    ld   a, a
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
    dec  b
    rst  $38
    dec  b
    rst  $38
    ld   [label_10FF], sp
    rst  $38
    db   $10 ; Undefined instruction
    jr   nz, label_EF84C
    jr   nz, label_EF84E
    ld   b, b
    ld   a, $06
    ld   e, $02
    sbc  a, [hl]
    add  a, d
    sbc  a, a
    add  a, e
    adc  a, a
    add  a, e
    rst  8
    ld   b, b
    rst  8
    ld   b, b
    rst  $20
    jr   nz, label_EF8C1
    ld   h, b
    and  b
    and  b
    ret  nz
    ret  nz
    ret  nz
    ld   b, b
    pop  bc
    ld   b, b
    jp   label_E340
    ld   b, c
    rst  $20
    ld   h, d
    inc  bc
    nop
    rrca
    inc  bc
    rrca
    inc  c
    ccf
    inc  sp
    db   $FC ; Undefined instruction
    ld   b, h
    ld    hl, sp+$88
    pop  af
    sub  a, c
    jp   nc, label_E692
    ld   h, [hl]
    add  a, b
    add  a, b
    ld   [$FFE0], a
    db   $10 ; Undefined instruction
    ld   [$C408], sp
    call nz, label_2424
    ldi  [hl], a
    ldi  [hl], a
    inc  bc
    inc  bc
    inc  c
    inc  c
    db   $10 ; Undefined instruction
    ld   hl, label_2221
    ldi  [hl], a
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    inc  h
    add  a, $C6
    jr   nc, label_EF8D4
    ld   [$C408], sp
    call nz, label_2424
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a

label_EF8AE::
    ldh  [$FF0C], a
    ldh  [$FF0C], a
    ei
    jr   label_EF8AE
    ld   [label_1079], sp
    ld   [hl], c
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_EF91D
    jr   nz, label_EF91F

label_EF8BF::
    jr   nz, label_EF8BF

label_EF8C1::
    sub  a, b
    db   $FC ; Undefined instruction
    and  b
    ld    hl, sp+$40
    ld   a, [$FF40]
    ld   a, [$FF40]
    ld   a, [$FF40]
    ld   [rNR41], a
    ld   [rLCDC], a
    inc  e
    db   $10 ; Undefined instruction

label_EF8D3::
    db   $10 ; Undefined instruction

label_EF8D5::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nz, label_EF95C
    jr   nc, label_EF8DE
    ld   d, b
    ld   a, a
    nop
    ccf
    nop
    rra
    nop
    rrca

label_EF8E7::
    nop
    rrca
    nop
    add  a, a
    nop
    rst  0
    nop
    jp   label_E000
    jr   nz, label_EF8D3
    jr   nz, label_EF8D5
    jr   nz, label_EF8E7
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [label_8F8], sp
    db   $FC ; Undefined instruction
    inc  b
    nop
    nop
    ld   h, b
    nop
    nop
    rst  $38
    nop
    nop
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
    nop

label_EF91D::
    nop
    inc  e

label_EF91F::
    nop
    ld   bc, label_1FF
    ld   bc, label_7FB
    rst  $28
    ld   [de], a
    rst  $38
    ld   [bc], a
    rst  $38
    inc  b
    rst  $38
    inc  b
    rrca
    ld    hl, sp+$FF
    nop
    rst  $38
    ld   bc, label_2FF
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
    add  a, b
    rst  $38
    nop

label_EF944::
    rst  $38
    ld   bc, label_2FF
    rst  $38
    inc  b
    rst  $38
    ld   [label_10FF], sp
    rst  $38
    jr   nz, label_EF944
    ld   d, b
    jp   [hl]
    sbc  a, b
    db   $F4 ; Undefined instruction
    inc  c
    di
    rrca
    ld   a, [$FF0F]
    ld   [$FF1F], a

label_EF95C::
    ld   [$FF1F], a
    ret  nz
    ccf
    rst  $38
    ld   h, d
    ld   e, a
    ld   d, h
    ld   c, a
    ld   c, c
    ld   b, a
    ld   b, c
    rst  0
    pop  bc
    ld   b, a
    pop  bc
    ld   b, a
    pop  bc
    ld   b, e
    pop  bc
    jp   nc, label_D292
    sub  a, d
    jp   nc, label_D112
    ld   de, label_1090
    sub  a, b
    db   $10 ; Undefined instruction
    ld   c, $81
    ld   bc, label_2222
    call nz, label_4C4
    inc  b
    ld   [$F008], sp
    ld   a, [$FF00]
    nop
    nop
    nop
    ld   [$FFE0], a
    inc  h
    inc  h
    ldi  [hl], a
    ldi  [hl], a
    ld   de, label_1011
    db   $10 ; Undefined instruction
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    inc  b
    inc  b
    sbc  a, b
    sbc  a, b
    ld   h, b
    ld   h, b
    nop
    nop
    ld   [$FFE0], a
    ld   [bc], a
    ld   [bc], a
    ld   a, [bc]
    ld   a, [bc]
    ld   h, b
    jr   nz, label_EFA13
    jr   nz, label_EFA15
    jr   nz, label_EFA17
    jr   nz, label_EFA19
    jr   nz, label_EFA1B
    jr   nz, label_EFA1D
    jr   nz, label_EFA1F
    jr   nz, label_EFA21
    ld   b, b
    ld   h, c
    ld   b, b
    ld   h, a
    ld   b, c
    ld   a, a
    ld   b, [hl]
    ld   a, e
    ld   a, h
    ld   b, c
    ld   a, [hl]
    ld   b, c
    ld   a, [hl]
    ld   b, c
    ld   a, [hl]
    rst  $38
    adc  a, b
    rst  $38
    adc  a, b
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    ld   bc, label_1FF
    db   $E3 ; Undefined instruction
    nop
    pop  hl
    nop
    pop  hl
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    rlca
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  $38
    inc  bc
    ld   a, a
    ld   bc, $013F
    ccf
    nop
    rra
    nop
    nop
    rst  $38
    nop
    ld   bc, label_11EC
    db   $FC ; Undefined instruction
    ld   bc, label_1FC
    db   $FC ; Undefined instruction
    add  a, c
    db   $FC ; Undefined instruction
    add  a, c
    ret  nz
    rst  $38
    nop
    rst  $38
    nop

label_EFA13::
    nop
    nop

label_EFA15::
    nop
    nop

label_EFA17::
    nop
    nop

label_EFA19::
    nop
    ret  nz

label_EFA1B::
    nop
    nop

label_EFA1D::
    nop
    rst  $38

label_EFA1F::
    rst  $38
    rrca

label_EFA21::
    ld    hl, sp+$0F
    adc  a, b
    ld   a, a
    sub  a, b
    ld   a, a
    sub  a, b
    ld   a, a
    sub  a, b
    ld   a, a
    and  b
    ccf
    ret  nz
    ld   a, a
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
    rst  $38
    jr   nz, label_EFA42
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    ret  nz
    ccf
    ret  nz
    ccf
    ret  nz
    ccf
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, e
    pop  bc
    ld   b, e
    pop  bc
    ld   b, e
    pop  bc
    ld   b, e
    pop  bc
    inc  hl
    pop  hl
    daa
    pop  hl
    daa
    pop  hl
    daa
    db   $E3 ; Undefined instruction
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   d, d
    jp   nc, label_C040
    or   b
    ld   h, b
    sbc  a, b
    ld   [hl], b
    adc  a, [hl]
    ld   a, h
    ei
    rst  $38
    nop
    nop
    add  a, b
    add  a, b
    nop
    nop
    rrca
    rrca
    db   $10 ; Undefined instruction
    jr   label_EFAA4
    rrca
    rrca
    and  b
    ret  nz
    nop
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    inc  bc
    inc  bc
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    ld   c, b
    ld   c, b
    nop
    nop

label_EFAA4::
    nop
    nop
    ld   bc, label_500
    inc  bc
    ld   b, $07
    cpl
    rra
    ld   a, [$FF7F]
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   [$FFA0], a
    ld   [$FFA0], a
    ld   [hl], b
    and  b
    ld   [hl], b
    and  b
    ld   a, [$FFF0]
    jp   [hl]
    jr   label_EFB01
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   a, a
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ccf
    ret  nz
    ld    hl, sp+$80
    ld    hl, sp+$80
    db   $FD ; Undefined instruction
    ld   b, c
    rst  $38
    ld   b, d
    rst  $38
    ldi  [hl], a
    rst  $38
    ldi  [hl], a
    rst  $38
    ld   [de], a
    cp   $03
    rrca
    nop
    rrca
    nop
    rst  $38
    ld    hl, sp+$FF
    ld   b, $FF
    ld   bc, label_11EE
    cp   $01
    nop
    rst  $38
    ret  nz

label_EFB01::
    ld   a, a
    ret  nz
    ld   b, b
    rst  $38
    jr   nz, label_EFB06
    jr   nz, label_EFB08
    ld   [$FF7F], a
    add  a, b
    ld   a, a
    add  a, b
    nop
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, c
    ld   a, a
    add  a, d
    ld   l, a
    sub  a, e
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    nop
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   bc, label_1FC
    nop
    rst  $38
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    rst  $38
    ld   a, c
    adc  a, a
    ld   a, a
    adc  a, [hl]
    rrca
    ld    hl, sp+$FE
    ld   bc, label_3FC
    db   $FC ; Undefined instruction
    inc  bc
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld    hl, sp+$07
    ld   a, [$FF0F]
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
    rla
    db   $F2 ; Undefined instruction
    rla
    db   $F2 ; Undefined instruction
    rrca
    ld   a, [$FE07]
    inc  bc
    rst  $38
    ld   [bc], a
    rst  $38
    inc  bc
    cp   $07
    db   $FC ; Undefined instruction
    ret  c
    ccf
    ld   [$FF9F], a
    jp   nz, label_A2FF
    rst  $38
    rla
    db   $FC ; Undefined instruction

label_EFB7A::
    db   $FC ; Undefined instruction
    rrca
    push af
    ld   c, $F8
    rrca
    ld   a, h
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    ld   a, h
    add  a, d
    rst  $38
    ld   bc, $827E
    rst  $38
    inc  bc
    ld   a, a
    rst  $38
    rlca
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    jr   nc, label_EFBD5
    rst  8
    ret  nc
    ccf
    jr   nz, label_EFB7A
    ret  nc
    rst  $38
    or   b
    rst  $38
    rst  $38
    add  a, c
    cp   $11
    cp   $19
    cp   $88
    ld   a, a
    rst  $38
    rrca
    call label_E23E
    rra
    add  a, a
    rst  $38
    xor  c
    ld   a, b
    ld   sp, hl
    ld   sp, hl
    sbc  a, e
    pop  af
    xor  $9B
    db   $FC ; Undefined instruction
    rrca
    db   $F4 ; Undefined instruction
    rrca
    db   $FC ; Undefined instruction
    rlca
    cp   $FF
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
    ccf
    ret  nz
    rra
    ld   [$FF1F], a

label_EFBD5::
    rst  $38
    ld   c, $F9
    dec  bc
    db   $FC ; Undefined instruction
    dec  b
    cp   $05
    cp   $03
    rst  $38
    cp   $03
    cp   $03
    db   $FC ; Undefined instruction
    dec  b
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   bc, label_9F4
    db   $FC ; Undefined instruction
    ld   bc, rJOYP
    cp   $02
    cp   $00
    cp   $00
    cp   $00
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    nop
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
    rst  $38
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
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, [hl]
    add  a, c
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    ld   bc, label_FFF
    rst  $38
    nop
    ld   bc, label_11EC
    db   $FC ; Undefined instruction
    ld   bc, label_1FC
    db   $FC ; Undefined instruction
    ld   bc, label_1FC
    rst  $38
    rst  $38
    ld   a, [$FFFF]
    rrca
    adc  a, a
    ld   a, a
    add  a, b
    ld   a, [hl]
    add  a, c
    ld   a, a
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    nop
    rst  $38
    pop  bc
    rst  $38
    ei
    ld   a, $F6
    inc  c
    or   $0C
    db   $FC ; Undefined instruction
    ld   [label_8FC], sp
    db   $FC ; Undefined instruction
    ld    hl, sp+$7F
    rst  $38
    db   $E3 ; Undefined instruction
    add  a, e
    nop
    nop
    nop

label_EFC67::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $28
    rra
    rst  $18
    cp   h
    db   $EB ; Undefined instruction
    rst  $38
    ld   [hl], e
    ld   a, h
    ccf
    jr   nc, label_EFCBA
    jr   c, label_EFC9B
    rra
    rra
    add  hl, de
    ld   a, [$8A8C]
    ld   a, h
    rst  $38
    rst  $38
    ret  nz
    ccf
    ld   [$FF1F], a
    db   $FC ; Undefined instruction
    rrca
    rst  $38
    inc  bc
    cp   $01
    rla
    inc  c
    inc  d
    rrca
    rst  $38
    rst  $38
    rrca
    ld   a, [$FF1F]
    ld   [rIE], a

label_EFC9B::
    nop
    sub  a, a
    db   $E8 ; add  sp, d
    ld   h, a
    ld   sp, hl
    rst  $30
    ld   a, a
    ld   [hl], h
    adc  a, a
    db   $EB ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    ld   e, $F8
    inc  e
    db   $E8 ; add  sp, d
    ld   a, b
    sub  a, b
    ld    hl, sp+$70
    sub  a, b
    ld   bc, $FCE3
    db   $FC ; Undefined instruction
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop

label_EFCBA::
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    jr   nz, label_EFD45
    and  c
    rst  $38
    ld   l, a
    ld   a, [hl]
    ccf
    jr   nc, label_EFD0C
    jr   nc, label_EFD0E
    ccf
    ld   bc, label_1FF
    rst  $38
    ld   b, $FF
    cp   $F9
    cp   $01
    cp   $01
    cp   $01
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    add  a, b
    ld   a, a
    add  a, b
    ld   a, [hl]
    add  a, c
    ld   a, a
    add  a, b
    ld   l, a
    sub  a, b
    ld   a, a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, rIE
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    ld   c, $00
    nop
    rst  $38
    nop
    nop

label_EFD0C::
    nop
    nop

label_EFD0E::
    nop
    nop
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    inc  c
    nop
    nop
    nop
    ld   bc, $FE01
    rst  $38
    dec  b
    ld   b, $0B
    inc  c
    ld   d, l
    ld   a, [de]

label_EFD28::
    add  hl, hl
    or   $50
    ld   l, a
    add  a, b
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   sp, label_39CE
    add  a, $9B
    ld   h, l
    rst  8
    ldd  [hl], a
    rst  8
    inc  [hl]
    rrca
    ld   [$F0FF], sp
    rst  $30
    jr   z, label_EFD28
    ld   e, d
    add  a, b

label_EFD45::
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, h
    sbc  a, b
    db   $FC ; Undefined instruction
    jr   z, label_EFD79
    inc  h
    db   $E4 ; Undefined instruction
    db   $E4 ; Undefined instruction
    ldi  [hl], a
    db   $F2 ; Undefined instruction
    ld   e, $FE
    add  a, c
    ld   a, a
    ret  nz
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
    ld   bc, $C300
    ret  nz
    dec  c
    jr   label_EFD80
    inc  c
    ld   b, $0E
    ld   [bc], a
    ld   b, $07

label_EFD79::
    inc  bc
    inc  bc
    ld   bc, $00F3
    rst  $38
    nop

label_EFD80::
    cp   a
    ret  nz
    cp   a
    ret  nz
    rst  8
    ld   [hl], b
    ret  nz
    ld   a, a
    db   $FC ; Undefined instruction

label_EFD89::
    ld   a, a
    add  a, e
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    sbc  a, a
    ld   h, c
    cp   $03
    ei
    rlca
    dec  b
    rst  $38
    inc  c
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FF10]
    or   b
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nc, label_EFD89
    and  b
    rst  0
    ret  nz
    sbc  a, a
    ret  nz
    cp   a
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
    ret  nz
    ld   bc, label_3F3
    or   $07
    jr   nc, label_EFE01
    scf
    jr   c, label_EFDED
    ld   a, b
    ld   c, a
    ld   c, a
    adc  a, a
    adc  a, b
    rst  8
    ret  c
    ccf
    ld   a, [$FF1F]
    ld   [rJOYP], a
    rst  $38
    nop
    nop
    nop
    nop
    ret  nz
    nop
    nop
    rst  $38
    jr   label_EFDDC

label_EFDDC::
    nop
    nop
    nop
    nop
    inc  c
    nop
    nop
    nop
    nop
    rst  $38
    nop
    nop
    nop
    nop
    inc  bc
    nop
    nop

label_EFDED::
    nop
    ld   h, b
    nop
    rlca
    ld   bc, $0107
    rlca
    ld   bc, $0107
    rlca
    ld   bc, $010F
    rrca
    ld   bc, $010F
    nop

label_EFE01::
    nop
    ld   h, b
    nop
    nop
    rst  $38
    nop
    nop
    inc  b
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_201
    inc  bc
    ld   b, l
    ld   b, $0A
    db   $FD ; Undefined instruction
    rla
    jr   label_EFE44
    inc  [hl]
    ld   d, b
    ld   l, a
    add  a, b
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   a, b
    add  a, a
    ld   a, $C1
    sbc  a, l
    ld   h, d
    rst  8
    ld   sp, label_1AE7
    rlca
    inc  b
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    db   $10 ; Undefined instruction
    and  b
    rst  $38
    ld   b, b
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
    rst  $28
    inc  d
    and  a
    ld   e, d

label_EFE44::
    ld   bc, rSB
    rst  $38
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
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    scf
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   a, [$FF0F]
    rst  $38
    nop
    rst  $38
    nop
    cp   $01
    rst  $38
    ld   bc, $87FE
    ld   a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$07
    ld    hl, sp+$0F
    ld   a, [$FF3F]
    ret  nz
    rst  $38
    nop
    nop
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    ld   e, a
    ld   [$FF37], a
    ld    hl, sp+$0F
    rst  $38
    nop
    rst  $38
    ld   [$FF1F], a
    rst  $38
    nop
    ld    hl, sp+$0F
    db   $E8 ; add  sp, d
    rra
    ret  nc
    ccf
    ld   h, b
    rst  $38
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rrca
    ld   a, [$FF07]
    ld    hl, sp+$03
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$1F
    ld   [rIE], a
    nop
    nop
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
    rst  $38
    rst  $38
    nop
    nop
    nop
    ld   a, [$FF10]
    ld   [rNR41], a
    ld   [rNR41], a
    ld   [$FF60], a
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    rrca
    ld   bc, $010F
    ld   c, $02
    ld   c, $02
    ld   e, $02
    ld   e, $06
    inc  e
    inc  b
    inc  a
    inc  b
    ld   h, d
    inc  bc
    dec  b
    ld   b, $0B
    db   $FC ; Undefined instruction
    dec  d
    ld   a, [de]
    add  hl, hl
    ld   [hl], $40
    ld   h, b
    ld   b, b
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $28
    db   $10 ; Undefined instruction
    jp   label_EE09F
    adc  a, $31
    db   $E3 ; Undefined instruction
    inc  e
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rrca
    ccf
    ret  nc
    ld   [hl], e
    xor  h
    db   $E8 ; add  sp, d
    ld   d, a
    rst  $28
    sub  a, b
    nop
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   b, a
    cp   c
    ld   [hl], a
    adc  a, e
    ccf
    jp   nz, label_200
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    add  a, b
    rst  8
    or   b
    pop  af
    ld   c, $7C
    add  a, e
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    ld   e, $E9
    sbc  a, $29
    rst  $38
    stop
    db   $10 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   e, [hl]
    and  c
    ld   b, $F9
    ei
    inc  b
    nop
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nz, label_EFFE5
    xor  a
    db   $FC ; Undefined instruction
    ld   b, e
    rst  $28
    ld   d, b
    ld   b, b
    ld   b, b
    ld   b, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   $01
    ld   a, [$FF0F]
    cp   e
    ld   b, l
    rst  8
    ld   sp, $0100
    ld   bc, rIE
    rst  $38
    nop
    nop
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    rst  $38
    ld   b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_EFFA6

label_EFFA6::
    ld   [bc], a
    nop
    nop
    rst  $38
    nop
    nop
    nop
    nop
    jr   nz, label_EFFB0

label_EFFB0::
    pop  bc
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
    nop
    ld   b, $00
    nop
    nop
    add  a, b
    nop
    nop
    nop
    jr   nc, label_EFFC6

label_EFFC6::
    nop
    nop
    nop
    rst  $38
    nop
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    rst  $38
    rst  $38
    ld   a, a
    add  a, b
    rrca
    ld   a, [$FFDD]
    and  d
    di
    adc  a, h
    nop
    add  a, b
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    ld   c, $F5
    ccf
    jp   nz, label_AF7
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    rst  $38
    rst  $38
    rst  $38
    ld   a, h
    inc  b
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld    hl, sp+$08
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   a, [$FF10]
