section "bank56",romx,bank[$38]
    inc  a
    nop
    ld   e, d
    inc  a
    ld   a, a
    inc  h
    ld   a, a
    inc  h
    ld   e, a
    ld   a, $37
    rrca
    rra
    dec  bc
    ccf
    dec  e
    ccf
    rra
    rra
    ld   c, $1F
    inc  bc
    inc  sp
    inc  e
    cpl
    rla
    ccf
    rlca
    rrca
    rlca
    rra
    nop
    inc  a
    nop
    ld   e, d
    inc  a
    cp   $24
    cp   $24
    ld   a, [$EC7C]
    ld   a, [$FFF8]
    ret  nc
    db   $FC ; Undefined instruction
    cp   b
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld   [hl], b
    ld    hl, sp+$C0
    rst  $38
    nop
    rst  $38
    cp   [hl]
    db   $EB ; Undefined instruction
    sbc  a, h
    rst  $38
    sub  a, h
    db   $EB ; Undefined instruction
    inc  e
    inc  a
    nop
    ld   e, d
    inc  a
    ld   a, a
    inc  h
    ld   a, a
    inc  h
    ld   e, a
    ld   a, $37
    rrca
    rra
    dec  bc
    ccf
    dec  e
    ccf
    rra
    rra
    ld   c, $0F
    inc  bc
    dec  de
    inc  c
    dec  a
    dec  de
    inc  a
    dec  de
    rra
    nop
    nop
    nop
    inc  a
    nop
    ld   e, d
    inc  a
    cp   $24
    cp   $24
    ld   a, [$EC7C]
    ld   a, [$FFF8]
    ret  nc
    db   $FC ; Undefined instruction
    cp   b
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld   [hl], b
    rst  $38
    add  a, b
    rst  $38
    ld   a, $EB
    sbc  a, h
    rst  $38
    sub  a, h
    db   $EB ; Undefined instruction
    sbc  a, h
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    jr   c, label_E0084

label_E0084::
    ld   b, h
    jr   c, label_E00E6
    jr   nz, label_E00C7
    ld   bc, label_277F
    ld   a, a
    inc  a
    ld   a, a
    inc  de
    rst  $38
    ld   a, a
    rst  $38
    rra
    ld   a, a
    ccf
    ld   h, $1F
    ld   a, a
    ld   bc, label_E07FF
    rst  $38
    ld   b, b
    ld   a, a
    inc  bc
    nop
    nop
    ld   a, b
    nop
    db   $F4 ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    sbc  a, b
    db   $FC ; Undefined instruction
    sbc  a, b
    db   $F4 ; Undefined instruction
    ld    hl, sp+$B8
    ret  nz
    ld   [$FFC0], a
    ret  nc
    ld   [$FFD4], a
    ld   [$FFAC], a
    ret  nz
    db   $EC ; Undefined instruction
    nop
    ld    hl, sp+$C0
    ld   [hl], b
    add  a, b
    ld    hl, sp+$70
    ld    hl, sp+$00
    jr   c, label_E00C2

label_E00C2::
    ld   b, h
    jr   c, label_E0124
    jr   nz, label_E0105

label_E00C7::
    ld   bc, label_277F
    ld   a, a
    inc  a
    ld   a, a
    inc  de
    rst  $38
    ld   a, a
    rst  $38
    rra
    ld   a, a
    ccf
    ld   h, $1F
    ld   a, [hl]
    ld   bc, label_E07FF
    rst  $38
    ld   b, b
    ld   a, a
    inc  bc
    rrca
    nop
    ld   a, b
    nop
    db   $F4 ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    sbc  a, b

label_E00E6::
    db   $FC ; Undefined instruction
    sbc  a, b
    db   $F4 ; Undefined instruction
    ld    hl, sp+$B8
    ret  nz
    ld   [$FFC0], a
    ret  nc
    ld   [$FFD0], a
    ld   [$FFA2], a
    ret  nz
    and  $00
    sbc  a, h
    ld   [$FFF0], a
    nop
    ld   a, [$FFE0]
    ld   a, [$FFC0]
    ld   [rJOYP], a
    inc  a
    nop
    ld   e, d
    inc  a
    ld   a, a

label_E0105::
    inc  a
    ld   a, a
    inc  a
    ld   d, a
    ld   a, $37
    rrca
    rra
    rrca
    ccf
    rra
    rst  $38
    rra
    rst  $38
    rrca
    cp   a
    ld   b, e
    rst  $38
    jr   c, label_E0198
    inc  sp
    ccf
    rlca
    rrca
    nop
    nop
    nop
    inc  a
    nop
    ld   e, d
    inc  a

label_E0124::
    cp   $3C
    cp   $3C
    ld   [$EC7C], a
    ld   a, [$FFF8]
    ld   a, [$FFFC]
    ld    hl, sp+$FC
    ld    hl, sp+$FE
    ld   a, [$FFFE]
    call z, label_38FC
    ld    hl, sp+$E0
    ld   a, [$FFE0]
    ld   [hl], b
    ld   [$FFF8], a
    nop
    inc  a
    nop
    ld   e, d
    inc  a
    ld   a, a
    inc  a
    ld   a, a
    inc  a
    ld   d, a
    ld   a, $37
    rrca
    rra
    rrca
    rst  $38
    rra
    rst  $38
    rra
    cp   a
    ld   c, a
    rst  $38
    inc  sp
    ld   a, a
    jr   c, label_E0198
    inc  bc
    rrca
    rlca
    rrca
    ld   b, $0F
    nop
    inc  a
    nop
    ld   e, d
    inc  a
    cp   $3C
    cp   $3C
    ld   [$EC7C], a
    ld   a, [$FFF8]
    ld   a, [$FFFC]
    ld    hl, sp+$FC
    ld    hl, sp+$F8
    ld   a, [$FFF0]
    ret  nz
    ld    hl, sp+$30
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    ld   [$FFE0], a
    stop
    nop
    ld   e, $00
    ccf
    ld   e, $3F
    add  hl, de
    ccf
    add  hl, de
    rra
    rrca
    dec  c
    inc  bc
    ld   l, b
    rlca
    cp   $0F
    cp   a
    ld   e, $3F
    inc  e
    rra
    inc  bc
    ccf
    rra

label_E0198::
    ld   a, e
    inc  a
    ld   [hl], l
    jr   c, label_E01D6
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    cp   $90
    rst  $38
    db   $EC ; Undefined instruction
    rst  $38
    cp   $FF
    ld  [$FF00+C], a
    cp   $F8
    ld   a, [$E47C]
    ld   a, b
    ld   a, h
    add  a, b
    or   h
    ret  z
    cp   h
    ret  nz
    ld    hl, sp+$00
    ld   [$FFC0], a
    ld   [$FFC0], a
    ret  nz
    nop
    inc  c
    nop
    rra
    nop
    ld   a, $01
    ld   a, a
    ld   bc, label_D1F
    ccf
    rra
    ld   a, a
    add  hl, sp
    rst  $38
    scf
    ld   a, a
    ccf
    ccf
    rra

label_E01D4::
    ld   a, [de]
    rlca

label_E01D6::
    ld   e, $01
    ld   a, e
    rlca
    ld   e, e
    daa
    ld   a, a
    nop
    jr   label_E01E0

label_E01E0::
    nop

label_E01E1::
    nop
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]
    jr   nc, label_E01E1
    jr   nc, label_E01D4
    ld   a, [$FFB1]
    ret  nz
    di
    ld   [$FFDE], a
    ld   [$FFBC], a
    ret  nz
    cp   $1C
    sbc  a, [hl]
    db   $FC ; Undefined instruction
    xor  $F4
    cp   d
    call nz, label_20C6
    nop
    nop
    ld   e, b
    nop
    ld   a, a
    nop
    ld   a, $01
    rra
    ld   bc, label_D1F
    ccf
    rra
    ld   a, a
    add  hl, sp
    rst  $38
    scf
    ld   a, a
    ccf
    ccf
    rra
    ld   a, [de]

label_E0215::
    rlca
    ld   e, $01
    ld   a, e
    rlca
    ld   e, e
    daa
    ld   a, a
    nop
    jr   label_E0220

label_E0220::
    nop

label_E0221::
    nop
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]
    jr   nc, label_E0221
    jr   nc, label_E0215
    ld   a, [$FFB2]
    ret  nz
    db   $FC ; Undefined instruction
    ld   [$FFDC], a
    ld   [$FFB2], a
    call z, label_FE
    sbc  a, [hl]
    db   $FC ; Undefined instruction
    cp   $FC
    sbc  a, [hl]
    db   $EC ; Undefined instruction
    cp   $04
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_E0255

label_E0255::
    inc  a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, $00
    ld   b, $00
    inc  b
    nop
    inc  c
    nop
    jr   label_E02BE

label_E02BE::
    nop
    nop
    ld   e, b
    nop
    ld   a, a
    nop
    ld   a, $01
    rra
    ld   bc, label_D1F
    ccf
    rra
    ld   a, a
    add  hl, sp
    rst  $38
    scf
    ld   a, a
    ccf
    ccf
    rra
    ld   a, [de]

label_E02D5::
    rlca
    ld   e, $01
    ld   a, e
    rlca
    ld   e, e
    daa
    ld   a, a
    nop
    jr   label_E02E0

label_E02E0::
    nop

label_E02E1::
    nop
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]
    jr   nc, label_E02E1
    jr   nc, label_E02D5
    ld   a, [$FFB2]
    ret  nz
    db   $FC ; Undefined instruction
    ld   [$FFDC], a
    ld   [$FFB2], a
    call z, label_FE
    sbc  a, [hl]
    db   $FC ; Undefined instruction
    cp   $FC
    sbc  a, [hl]
    db   $EC ; Undefined instruction
    cp   $04
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E07FF::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E0FE4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   label_E100B
    ld   h, $19
    daa
    ld   a, [de]
    ld   c, a
    inc  sp
    ld   e, a

label_E100B::
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
    db   $10 ; Undefined instruction
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
    jr   nz, label_E0FE4
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
    jr   nz, label_E108B
    jr   nc, label_E107D
    jr   nz, label_E108F
    db   $10 ; Undefined instruction
    jr   nz, label_E1093
    jr   nz, label_E1095
    jr   nc, label_E1087
    inc  e
    inc  bc
    inc  hl
    inc  e
    jr   nz, label_E109D
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E1087::
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, label_307
    ld   b, $03
    rlca

label_E1093::
    ld   [bc], a
    rrca

label_E1095::
    ld   b, $1F
    ld   c, $7E
    inc  e
    sbc  a, [hl]
    ld   a, h
    adc  a, h

label_E109D::
    ld   a, b
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
    inc  bc
    nop
    rrca
    inc  bc
    rra

label_E10AF::
    rrca
    ld   a, $19
    ld   a, l
    jr   c, label_E112D
    jr   nc, label_E10AF
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    adc  a, b
    ld   [hl], b
    ld   c, b
    jr   nc, label_E10F7
    nop
    nop
    nop
    ld   [bc], a
    nop
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rrca
    dec  b
    dec  c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   e, $0C
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
    nop
    nop
    nop

label_E10F7::
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
    ld   a, [$FF60]
    ld    hl, sp+$70
    cp   h
    ld   a, b
    ld   a, [hl]
    inc  a
    ld   e, [hl]
    inc  a
    cpl
    ld   e, $1F
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38

label_E112D::
    ld   b, $3F
    ld   b, $7F
    inc  e
    cp   $30
    ld    hl, sp+$60
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    ld   a, [hl]
    jr   label_E11C5
    inc  h
    ld   a, [hl]
    inc  h
    ld   a, [hl]
    jr   z, label_E11C9
    jr   label_E11CB
    db   $10 ; Undefined instruction
    jr   z, label_E1152
    ld   l, d
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, h
    rst  $38
    ld   h, [hl]
    rst  $38
    db   $3A ; ldd  a, [hl]
    ld   a, a
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    nop
    nop
    cp   $00
    cp   $7C
    rst  $38
    ld   h, [hl]
    cp   $7C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $7C
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, b
    cp   $7C
    cp   $60
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF00]
    ld   c, $00
    ld   e, $0C
    ld   a, $1C
    ld   a, $0C
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    ld   e, $00
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    ld   a, a
    ld   a, $3F
    ld   b, $7E
    inc  a
    ld   a, h
    nop
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38

label_E11C5::
    ld   b, [hl]
    ld   a, [hl]
    inc  e
    ld   a, a

label_E11C9::
    ld   b, $FF

label_E11CB::
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E11E8
    jr   label_E11EA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E11F8
    jr   label_E11FA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    nop
    nop
    cp   $00
    rst  $38
    ld   a, h
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $7C
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, b
    ld   a, [$FF60]
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $78
    rst  $38
    ld   h, h
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, b
    ld   a, [$FF60]
    ld   a, [$FF60]
    cp   $60
    cp   $7C
    rst  $38
    inc  a
    ld   a, [hl]
    jr   label_E1291
    jr   label_E1293
    jr   label_E1295
    jr   label_E1297
    jr   label_E1299
    nop
    nop
    nop
    cp   $7C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    inc  a
    inc  a
    jr   label_E12B5
    jr   label_E12B7
    jr   label_E12B9
    jr   label_E12BB
    jr   label_E1281

label_E1281::
    nop
    ccf
    nop
    ccf
    ld   e, $3F
    inc  c
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    nop

label_E1291::
    nop
    rst  $38

label_E1293::
    nop
    rst  $38

label_E1295::
    ld   h, [hl]
    rst  $38

label_E1297::
    ld   h, [hl]
    cp   $6C
    db   $FC ; Undefined instruction
    ld   a, b
    ld    hl, sp+$70
    ld    hl, sp+$70
    nop
    nop
    rst  $30
    nop
    rst  $30
    ld   h, d
    rst  $38
    ld   h, d
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    nop
    nop
    rst  $30
    nop
    rst  $30

label_E12B5::
    ld   h, d
    rst  $38

label_E12B7::
    ld   h, d
    rst  $38

label_E12B9::
    ld   [hl], d
    rst  $38

label_E12BB::
    ld   [hl], d
    rst  $38
    ld   a, d
    rst  $38
    ld   a, d
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, b
    ld   a, [hl]
    inc  a
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    jr   label_E1315
    jr   label_E1317
    jr   label_E1319
    jr   label_E131B
    jr   label_E12E1

label_E12E1::
    nop
    rst  $38
    nop
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    nop
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   a, [hl]
    rst  $38
    inc  d
    ld   a, [hl]
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    nop
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38

label_E1315::
    ld   h, [hl]
    rst  $38

label_E1317::
    ld   h, [hl]
    rst  $38

label_E1319::
    ld   h, [hl]
    rst  $38

label_E131B::
    ld   a, h
    cp   $00
    nop
    nop
    rst  $38
    ld   h, b
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    db   $3A ; ldd  a, [hl]
    ld   a, [hl]
    nop
    nop
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, h
    cp   $78
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    cp   $60
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    nop
    nop
    cp   $60
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF00]
    nop
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   c, $3F
    ld   c, $3F
    inc  e
    ld   a, $1C
    ld   a, [hl]
    inc  e
    ld   e, $0C
    cp   $0C
    cp   $6C
    cp   $6C
    cp   $6C
    cp   $38
    ld   a, h
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    cp   $6C
    cp   $6C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    nop
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   h, d
    rst  $30
    ld   h, d
    rst  $30
    nop
    nop
    nop
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, d
    rst  $30
    ld   h, d
    rst  $30
    nop
    nop
    nop
    rst  $38
    ld   b, $FF
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    inc  a
    ld   a, [hl]
    nop
    nop
    nop
    inc  a
    jr   label_E140F
    jr   label_E1411
    jr   label_E1413
    jr   label_E1415
    jr   label_E1417
    jr   label_E1419
    nop
    nop
    nop
    rst  $38
    ld   l, d
    rst  $38
    ld   l, d
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, $7F
    inc  d
    ld   a, $00
    nop
    nop
    rst  $30
    nop
    rst  $38
    ld   h, d
    rst  $38
    ld   [hl], h
    cp   $38
    ld   a, a
    inc  e
    rst  $38
    ld   l, $FF
    ld   b, [hl]
    rst  $28

label_E13FF::
    nop
    jr   label_E1402

label_E1402::
    inc  a
    jr   label_E1483
    inc  h
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38

label_E140F::
    nop
    inc  a

label_E1411::
    nop
    ld   a, [hl]

label_E1413::
    inc  a
    rst  $38

label_E1415::
    ld   h, [hl]
    rst  $38

label_E1417::
    ld   h, b
    rst  $38

label_E1419::
    ld   h, b
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   a, b
    cp   $64
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $64
    db   $FC ; Undefined instruction
    ld   a, b
    ld    hl, sp+$00
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, b
    cp   $7C
    cp   $60
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    ld   a, [hl]
    nop
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, b
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, $7E
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    inc  a
    inc  a
    jr   label_E14A3
    jr   label_E14A5
    jr   label_E14A7
    jr   label_E14EB
    inc  a
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   l, h
    cp   $78
    cp   $78
    rst  $38
    ld   l, h
    rst  $38
    ld   h, [hl]
    rst  $38
    nop
    ld   a, [$FF00]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    nop
    rst  $30
    ld   h, d
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   l, d
    rst  $38
    ld   h, d
    rst  $30
    ld   h, d
    rst  $30
    nop
    rst  $20
    nop
    rst  $30

label_E14A3::
    ld   h, d
    rst  $38

label_E14A5::
    ld   [hl], d
    rst  $38

label_E14A7::
    ld   a, d
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   h, [hl]
    rst  $30
    ld   h, d
    di
    nop
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E14C8
    jr   label_E14CA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E14D8
    jr   label_E14DA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E14E8
    jr   label_E14EA

label_E14EB::
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E14F8
    jr   label_E14FA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $7C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $7C
    db   $FC ; Undefined instruction
    ld   h, b
    ld   a, [$FF60]
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    cp   $7C
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    cp   $7C
    cp   $6C
    rst  $38
    ld   h, [hl]
    rst  $30
    nop
    ld   a, $00
    ld   a, [hl]
    inc  a
    db   $FC ; Undefined instruction
    ld   h, b
    ld   a, [hl]
    inc  a
    rst  $38
    ld   b, $FF
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    jr   label_E1573
    jr   label_E1575
    jr   label_E1577
    jr   label_E1579
    jr   label_E157B
    nop
    rst  $20
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    ld   a, [hl]
    inc  a
    inc  a
    nop
    rst  $38
    nop
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    inc  h
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    jr   label_E159B
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E1568
    jr   label_E156A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_E1573::
    ld   b, d
    rst  $38

label_E1575::
    inc  h
    rst  $38

label_E1577::
    jr   label_E1578

label_E1579::
    jr   label_E157A

label_E157B::
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E1588
    jr   label_E158A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rlca
    rlca
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    jr   c, label_E159D
    ld   a, h

label_E159B::
    nop
    ld   a, a

label_E159D::
    nop
    jr   nc, label_E15A0

label_E15A0::
    nop
    ld   [bc], a
    nop
    ld   a, [de]
    nop
    db   $3A ; ldd  a, [hl]
    nop
    ld   h, h
    nop
    sbc  a, b
    nop
    ld   h, b
    nop
    add  a, b
    ld   b, b
    ld   b, b
    nop
    nop
    nop
    rrca
    nop
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
    rrca
    ld   a, a
    rra
    xor  $77
    ld   a, l
    ld   b, $1D
    ld   c, $1A
    inc  c
    db   $3A ; ldd  a, [hl]
    inc  e
    inc  [hl]
    jr   label_E1643
    jr   nc, label_E162D
    jr   nz, label_E163F
    nop
    nop
    nop
    nop
    nop
    rrca
    nop
    ccf
    rrca
    ld   a, a
    ccf
    rst  $38
    ld   [hl], a
    rst  $38
    ld   b, a
    ld   e, l
    ld   c, $1E
    inc  c
    db   $3A ; ldd  a, [hl]
    inc  e
    db   $3A ; ldd  a, [hl]
    inc  e
    inc  [hl]
    jr   label_E160D
    ld   [$0018], sp
    nop
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
    ldi  [hl], a
    inc  e
    ld   e, c
    ld   h, $66

label_E160D::
    nop
    ld   b, d
    nop
    inc  b
    nop
    inc  b
    nop
    ld   e, $00
    ld   [de], a
    nop
    add  hl, sp
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    jr   nc, label_E1641
    nop
    jr   nz, label_E1624

label_E1624::
    ld   a, b
    nop
    ld   c, b
    nop
    ld   a, h
    ld   [label_8FC], sp
    db   $F4 ; Undefined instruction

label_E162D::
    ld   [label_CF6], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    ld   a, d
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38

label_E163F::
    ld   a, d
    ld   [hl], a

label_E1641::
    inc  hl
    ld   [hl], e

label_E1643::
    jr   nz, label_E16B9

label_E1645::
    jr   nz, label_E16A3
    jr   nz, label_E1645
    nop
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    rst  $38
    xor  $C4
    xor  $04
    ld   a, $04
    ld   a, d
    inc  b
    rst  $38
    nop
    rst  $38
    rlca
    rst  $30
    ld   [$EBFF], sp
    nop
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    rst  $28
    db   $10 ; Undefined instruction
    sub  a, $DF
    jr   nz, label_E166E
    xor  [hl]
    jr   label_E167A
    inc  h
    inc  e
    nop
    inc  a
    nop
    inc  a
    nop
    jr   label_E167B

label_E167B::
    db   $DB
    nop
    ld   l, b
    nop
    ld   [hl], b
    nop
    ld   h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    jr   c, label_E168D

label_E168D::
    jr   nc, label_E168F

label_E168F::
    nop
    add  a, l
    ld   a, d
    rst  $38
    nop
    ld   a, h
    nop
    rra
    nop
    nop
    nop
    stop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38

label_E16A3::
    nop
    rst  $38
    nop
    pop  af
    nop
    ld   e, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  d
    db   $EB ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    nop
    nop

label_E16B9::
    nop
    adc  a, b
    nop
    nop
    nop
    nop
    nop
    ld   d, c
    xor  [hl]
    rst  $38
    nop
    rra
    nop
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld   [$0000], sp
    nop
    nop
    nop
    add  a, l
    ld   a, d
    rst  $38
    nop
    rst  $38
    nop
    jr   c, label_E16D8

label_E16D8::
    rlca
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
    rlca
    nop
    cp   a
    nop
    ret  nz
    nop
    ld   c, b
    nop
    nop
    nop
    nop
    nop
    inc  d
    db   $EB ; Undefined instruction
    rst  $38
    nop
    di
    nop
    inc  a
    nop
    pop  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   d, c
    xor  [hl]
    rst  $38
    nop
    rst  $38
    nop
    ld   c, $00
    ret  nz
    nop
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    add  a, l
    ld   a, d
    rst  $38
    nop
    rlca
    nop
    ld   a, [hl]
    nop
    stop
    ld   bc, $0000
    nop
    nop
    nop
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    inc  bc
    nop
    ld   a, [de]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  d
    db   $EB ; Undefined instruction
    rst  $38
    nop
    add  a, e
    nop
    ld   [rJOYP], a
    jr   label_E173A

label_E173A::
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    ld   d, c
    xor  [hl]
    rst  $38
    nop
    ld    hl, sp+$00
    ld   a, [hl]
    nop
    inc  b
    nop
    add  a, b
    nop
    nop
    nop
    nop
    nop
    add  a, l
    ld   a, d
    rst  $38
    nop
    ccf
    nop
    ld   bc, label_1800
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
    ei
    nop
    ld   a, $00
    ld   bc, label_1200
    nop
    nop
    nop
    nop
    nop
    inc  d
    db   $EB ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, $C000
    nop
    stop
    nop
    nop
    nop
    nop
    ld   d, c
    xor  [hl]
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    inc  e
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
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E1798
    jr   label_E179A
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E17A8
    jr   label_E17AA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E17B8
    jr   label_E17BA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E17C8
    jr   label_E17CA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E17D8
    jr   label_E17DA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E17E8
    jr   label_E17EA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, d
    rst  $38
    inc  h
    rst  $38
    jr   label_E17F8
    jr   label_E17FA
    inc  h
    rst  $38
    ld   b, d
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    ld   a, a
    jr   c, label_E1885
    jr   c, label_E1887
    jr   c, label_E1889
    jr   c, label_E188B
    jr   c, label_E188D
    jr   c, label_E188F
    jr   c, label_E1891
    jr   c, label_E1893
    jr   c, label_E1895
    jr   c, label_E1897
    jr   c, label_E1899
    jr   c, label_E189B
    jr   c, label_E18A0
    inc  a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp   label_F300
    pop  bc
    ld   a, c
    ld   a, [$FFBC]
    ld   a, b
    ld   e, d
    inc  a
    ld   e, [hl]
    inc  a
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   e, [hl]
    inc  a
    ld   e, d
    inc  a
    cp   h
    ld   a, b
    ld   a, c
    ld   a, [$FFF3]
    pop  bc
    jp   label_0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E1885::
    db   $FD ; Undefined instruction
    ld   a, a

label_E1887::
    ld    hl, sp+$BB

label_E1889::
    ld   a, l
    ld   a, l

label_E188B::
    ccf
    ld   e, [hl]

label_E188D::
    ccf
    ccf

label_E188F::
    ld   e, $2F

label_E1891::
    ld   e, $1E

label_E1893::
    rrca
    rra

label_E1895::
    rrca
    cpl

label_E1897::
    rra
    dec  sp

label_E1899::
    rra
    ld   d, a

label_E189B::
    dec  sp
    ld   a, l
    inc  sp
    xor  e
    ld   [hl], c

label_E18A0::
    ld   [hl], d
    pop  hl
    rst  $38
    di
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
    ld   a, [$FF00]
    ld   a, [$FFE0]
    and  b
    ret  nz
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ret  nz
    add  a, b
    and  b
    ret  nz
    ld   [$FFC0], a
    ret  nc
    ld   [$FFE8], a
    ld   a, [$FFFC]
    ld    hl, sp+$FC
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [label_2300]
    nop
    ldi  [hl], a
    nop
    ldi  [hl], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_E1928

label_E1928::
    ld   h, b
    nop
    and  b
    nop
    jr   nz, label_E192E

label_E192E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, h
    rst  $38
    jr   z, label_E1948
    db   $10 ; Undefined instruction
    jr   z, label_E194C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1958
    db   $10 ; Undefined instruction
    jr   z, label_E195C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1968
    db   $10 ; Undefined instruction
    jr   z, label_E196C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1978
    db   $10 ; Undefined instruction
    jr   z, label_E197C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1988
    db   $10 ; Undefined instruction
    jr   z, label_E198C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1998
    db   $10 ; Undefined instruction
    jr   z, label_E199C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E19A8
    db   $10 ; Undefined instruction
    jr   z, label_E19AC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E19B8
    db   $10 ; Undefined instruction
    jr   z, label_E19BC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E19C8
    db   $10 ; Undefined instruction
    jr   z, label_E19CC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E19D8
    db   $10 ; Undefined instruction
    jr   z, label_E19DC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E19E8
    db   $10 ; Undefined instruction
    jr   z, label_E19EC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E19F8
    db   $10 ; Undefined instruction
    jr   z, label_E19FC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A08
    db   $10 ; Undefined instruction
    jr   z, label_E1A0C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A18
    db   $10 ; Undefined instruction
    jr   z, label_E1A1C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A28
    db   $10 ; Undefined instruction
    jr   z, label_E1A2C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A38
    db   $10 ; Undefined instruction
    jr   z, label_E1A3C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A48
    db   $10 ; Undefined instruction
    jr   z, label_E1A4C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A58
    db   $10 ; Undefined instruction
    jr   z, label_E1A5C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A68
    db   $10 ; Undefined instruction
    jr   z, label_E1A6C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A78
    db   $10 ; Undefined instruction
    jr   z, label_E1A7C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A88
    db   $10 ; Undefined instruction
    jr   z, label_E1A8C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1A98
    db   $10 ; Undefined instruction
    jr   z, label_E1A9C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1AA8
    db   $10 ; Undefined instruction
    jr   z, label_E1AAC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1AB8
    db   $10 ; Undefined instruction
    jr   z, label_E1ABC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1AC8
    db   $10 ; Undefined instruction
    jr   z, label_E1ACC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1AD8
    db   $10 ; Undefined instruction
    jr   z, label_E1ADC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1AE8
    db   $10 ; Undefined instruction
    jr   z, label_E1AEC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1AF8
    db   $10 ; Undefined instruction
    jr   z, label_E1AFC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B08
    db   $10 ; Undefined instruction
    jr   z, label_E1B0C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B18
    db   $10 ; Undefined instruction
    jr   z, label_E1B1C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B28
    db   $10 ; Undefined instruction
    jr   z, label_E1B2C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B38
    db   $10 ; Undefined instruction
    jr   z, label_E1B3C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B48
    db   $10 ; Undefined instruction
    jr   z, label_E1B4C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B58
    db   $10 ; Undefined instruction
    jr   z, label_E1B5C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B68
    db   $10 ; Undefined instruction
    jr   z, label_E1B6C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B78
    db   $10 ; Undefined instruction
    jr   z, label_E1B7C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B88
    db   $10 ; Undefined instruction
    jr   z, label_E1B8C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1B98
    db   $10 ; Undefined instruction
    jr   z, label_E1B9C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1BA8
    db   $10 ; Undefined instruction
    jr   z, label_E1BAC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1BB8
    db   $10 ; Undefined instruction
    jr   z, label_E1BBC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1BC8
    db   $10 ; Undefined instruction
    jr   z, label_E1BCC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1BD8
    db   $10 ; Undefined instruction
    jr   z, label_E1BDC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1BE8
    db   $10 ; Undefined instruction
    jr   z, label_E1BEC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1BF8
    db   $10 ; Undefined instruction
    jr   z, label_E1BFC
    ld   b, h
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    ld   a, a
    jr   c, label_E1C85
    jr   c, label_E1C87
    jr   c, label_E1C89
    jr   c, label_E1C8B
    jr   c, label_E1C8D
    jr   c, label_E1C8F
    jr   c, label_E1C91
    jr   c, label_E1C93
    jr   c, label_E1C95
    jr   c, label_E1C97
    jr   c, label_E1C99
    jr   c, label_E1C9B
    jr   c, label_E1CA0
    inc  a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp   label_F300
    pop  bc
    ld   a, c
    ld   a, [$FFBC]
    ld   a, b
    ld   e, d
    inc  a
    ld   e, [hl]
    inc  a
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   e, [hl]
    inc  a
    ld   e, d
    inc  a
    cp   h
    ld   a, b
    ld   a, c
    ld   a, [$FFF3]
    pop  bc
    jp   label_0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E1C85::
    db   $FD ; Undefined instruction
    ld   a, a

label_E1C87::
    ld    hl, sp+$BB

label_E1C89::
    ld   a, l
    ld   a, l

label_E1C8B::
    ccf
    ld   e, [hl]

label_E1C8D::
    ccf
    ccf

label_E1C8F::
    ld   e, $2F

label_E1C91::
    ld   e, $1E

label_E1C93::
    rrca
    rra

label_E1C95::
    rrca
    cpl

label_E1C97::
    rra
    dec  sp

label_E1C99::
    rra
    ld   d, a

label_E1C9B::
    dec  sp
    ld   a, l
    inc  sp
    xor  e
    ld   [hl], c

label_E1CA0::
    ld   [hl], d
    pop  hl
    rst  $38
    di
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
    ld   a, [$FF00]
    ld   a, [$FFE0]
    and  b
    ret  nz
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ret  nz
    add  a, b
    and  b
    ret  nz
    ld   [$FFC0], a
    ret  nc
    ld   [$FFE8], a
    ld   a, [$FFFC]
    ld    hl, sp+$FC
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [label_2300]
    nop
    ldi  [hl], a
    nop
    ldi  [hl], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_E1D28

label_E1D28::
    ld   h, b
    nop
    and  b
    nop
    jr   nz, label_E1D2E

label_E1D2E::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, h
    rst  $38
    jr   z, label_E1D48
    db   $10 ; Undefined instruction
    jr   z, label_E1D4C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1D58
    db   $10 ; Undefined instruction
    jr   z, label_E1D5C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1D68
    db   $10 ; Undefined instruction
    jr   z, label_E1D6C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1D78
    db   $10 ; Undefined instruction
    jr   z, label_E1D7C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1D88
    db   $10 ; Undefined instruction
    jr   z, label_E1D8C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1D98
    db   $10 ; Undefined instruction
    jr   z, label_E1D9C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1DA8
    db   $10 ; Undefined instruction
    jr   z, label_E1DAC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1DB8
    db   $10 ; Undefined instruction
    jr   z, label_E1DBC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1DC8
    db   $10 ; Undefined instruction
    jr   z, label_E1DCC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1DD8
    db   $10 ; Undefined instruction
    jr   z, label_E1DDC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1DE8
    db   $10 ; Undefined instruction
    jr   z, label_E1DEC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1DF8
    db   $10 ; Undefined instruction
    jr   z, label_E1DFC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E08
    db   $10 ; Undefined instruction
    jr   z, label_E1E0C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E18
    db   $10 ; Undefined instruction
    jr   z, label_E1E1C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E28
    db   $10 ; Undefined instruction
    jr   z, label_E1E2C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E38
    db   $10 ; Undefined instruction
    jr   z, label_E1E3C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E48
    db   $10 ; Undefined instruction
    jr   z, label_E1E4C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E58
    db   $10 ; Undefined instruction
    jr   z, label_E1E5C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E68
    db   $10 ; Undefined instruction
    jr   z, label_E1E6C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E78
    db   $10 ; Undefined instruction
    jr   z, label_E1E7C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E88
    db   $10 ; Undefined instruction
    jr   z, label_E1E8C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1E98
    db   $10 ; Undefined instruction
    jr   z, label_E1E9C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1EA8
    db   $10 ; Undefined instruction
    jr   z, label_E1EAC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1EB8
    db   $10 ; Undefined instruction
    jr   z, label_E1EBC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1EC8
    db   $10 ; Undefined instruction
    jr   z, label_E1ECC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1ED8
    db   $10 ; Undefined instruction
    jr   z, label_E1EDC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1EE8
    db   $10 ; Undefined instruction
    jr   z, label_E1EEC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1EF8
    db   $10 ; Undefined instruction
    jr   z, label_E1EFC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F08
    db   $10 ; Undefined instruction
    jr   z, label_E1F0C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F18
    db   $10 ; Undefined instruction
    jr   z, label_E1F1C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F28
    db   $10 ; Undefined instruction
    jr   z, label_E1F2C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F38
    db   $10 ; Undefined instruction
    jr   z, label_E1F3C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F48
    db   $10 ; Undefined instruction
    jr   z, label_E1F4C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F58
    db   $10 ; Undefined instruction
    jr   z, label_E1F5C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F68
    db   $10 ; Undefined instruction
    jr   z, label_E1F6C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F78
    db   $10 ; Undefined instruction
    jr   z, label_E1F7C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F88
    db   $10 ; Undefined instruction
    jr   z, label_E1F8C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1F98
    db   $10 ; Undefined instruction
    jr   z, label_E1F9C
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1FA8
    db   $10 ; Undefined instruction
    jr   z, label_E1FAC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1FB8
    db   $10 ; Undefined instruction
    jr   z, label_E1FBC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1FC8
    db   $10 ; Undefined instruction
    jr   z, label_E1FCC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1FD8
    db   $10 ; Undefined instruction
    jr   z, label_E1FDC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1FE8
    db   $10 ; Undefined instruction
    jr   z, label_E1FEC
    ld   b, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_E1FF8
    db   $10 ; Undefined instruction
    jr   z, label_E1FFC

label_E1FFD::
    ld   b, h
    rst  $38
    nop

label_E2000::
    nop
    nop
    ld   bc, label_700
    ld   bc, label_70C
    jr   label_E2019
    inc  sp
    inc  e
    dec  l
    db   $10 ; Undefined instruction
    ld   hl, label_364
    dec  c
    ld   b, $0B
    dec  b
    ld   a, [de]
    dec  c
    ld   d, $0B
    dec  [hl]
    dec  de
    dec  [hl]
    ld   a, [de]
    dec  h
    ld   a, [de]
    ld   a, [hl]
    nop
    pop  bc
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    adc  a, h
    ld   [hl], e
    jr   nc, label_E1FFD
    ld   b, b
    cp   a
    add  a, b
    ld   a, a
    ld   c, $FF
    ccf
    ld   sp, hl
    ld   a, c
    db   $E4 ; Undefined instruction
    ld   a, [$FF88]
    or   b
    ld   d, b
    jr   nz, label_E200E
    jr   nz, label_E2000
    inc  bc
    nop
    adc  a, [hl]
    inc  bc
    ld   [hl], b
    adc  a, a

label_E2046::
    nop
    rst  $38
    rlca
    ld    hl, sp+$08
    rst  $30
    nop
    rst  $38
    ld   b, b
    cp   a
    ret  nz
    cp   a
    sbc  a, $61
    pop  hl
    ld   [bc], a
    add  a, b
    ld   bc, $0000
    nop
    nop
    nop

label_E205D::
    inc  bc
    rlca
    inc  b
    cp   $00
    inc  bc
    cp   $00
    rst  $38
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   h, b
    sbc  a, a
    jr   label_E205D
    dec  c
    or   $05
    ld   a, [$FC07]
    add  a, a
    ld   a, h
    jp   nz, label_E33BD
    adc  a, $3B
    ld   d, [hl]
    dec  e
    adc  a, d
    cp   l
    ld   l, d
    nop
    nop
    ret  nz
    nop
    jr   nc, label_E2046
    inc  c
    ld   a, [$FF3A]
    call nz, label_3AFD
    rst  $38
    ld   a, h
    rst  $38
    db   $FD ; Undefined instruction
    rst  $38
    cp   $FF
    cp   $FF
    xor  $FF
    db   $76 ; Halt
    rst  $38
    ld   a, d
    rst  $38
    ld   a, l
    rst  $38
    ld   a, l
    rst  $38
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
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nz, label_E2070
    db   $10 ; Undefined instruction
    sub  a, h
    and  $B6
    ld   h, [hl]
    ld   a, b
    adc  a, b
    cp   h
    ld   [hl], b
    db   $E4 ; Undefined instruction
    ret  c
    ld   [hl], h
    sbc  a, b
    sbc  a, b
    ld   h, b
    ld   h, $1D
    ld   l, $19
    ld   l, $13
    ld   a, $13
    inc  d
    inc  bc
    dec  d
    ld   [bc], a
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    inc  bc
    nop
    inc  bc
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   [hl], b
    ret  nz
    ld   h, h
    and  h
    ld   b, b
    and  b
    ld   b, b
    and  b
    ld   d, b
    and  h
    ld   d, b
    and  b
    call c, label_FEA0
    or   [hl]
    ret  z
    add  a, h
    ret  nz
    add  a, d
    ld   h, b
    and  b
    ld   h, b
    and  c
    ld   h, b
    and  b
    ld   h, e
    and  b
    ld   b, d
    add  a, c
    ld   h, c
    ret  nc
    ld   [$000C], sp
    nop
    nop
    nop
    ld   bc, label_504
    nop
    dec  bc
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
    ld   b, b
    ld   [rJOYP], a
    jr   nz, label_E211E

label_E211E::
    ld   [rJOYP], a
    rla
    xor  h
    ld   a, [de]
    dec  l
    ld   e, d
    db   $ED ; Undefined instruction
    cp   b
    cpl
    ret  c
    cpl
    sbc  a, b
    ld   l, a
    sbc  a, b
    cpl
    ld   e, b
    ld   l, a
    jr   label_E21A1
    jr   label_E2163
    ld   a, [de]
    cpl
    ld   a, [de]
    cpl
    ld   a, [de]
    cpl
    ld   a, [de]
    cpl
    ld   a, [de]
    cpl
    ld   a, [de]
    ld   l, a
    add  a, d
    nop
    ld   b, d
    add  a, b
    ld   b, d
    add  a, b
    ld   h, $C0
    inc  e
    ld   [$FF08], a
    ld   a, [$FF84]
    ld    hl, sp+$84
    ld    hl, sp+$83
    ld   a, h
    add  a, e
    ld   a, a
    jp   label_C17F
    ld   a, a
    pop  bc
    ld   a, a
    pop  bc
    ld   a, a
    pop  bc
    ld   a, a
    ret  nz
    ld   a, a
    ret  z
    nop
    or   b

label_E2163::
    nop
    stop
    ld   [label_800], sp
    nop
    ld   [label_3000], sp
    nop
    ret  nz
    nop
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
    ret  nz
    add  a, b
    ld   [$FFC0], a
    ld   [$FFC0], a
    inc  c
    rlca
    ld   c, $07
    ld   c, $07
    ld   a, [bc]
    rlca
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    dec  de
    dec  c
    dec  de
    dec  c
    dec  de
    dec  c
    dec  de
    dec  c
    inc  de
    ld   c, $13
    ld   c, $11
    ld   c, $1B
    inc  c
    rrca
    nop
    add  a, a

label_E21A1::
    nop
    db   $E3 ; Undefined instruction
    and  b
    ld   [hl], b
    ret  nc
    ld   a, b
    ret
    ld   a, h
    call nc, label_DA7E
    ld   a, a
    call c, label_DE7F
    ld   a, a
    sbc  a, $7F
    sbc  a, $7F
    sbc  a, $7F
    sbc  a, $7E
    reti
    cp   [hl]
    jp   nz, label_C8B4
    xor  h
    ld   b, h
    add  a, b
    ld   bc, label_300
    ld   bc, label_202
    add  a, a
    nop
    rrca
    ld   [$C02F], sp
    rra
    nop
    rst  $38
    nop
    rst  0
    nop
    add  a, c
    nop
    ld   bc, $0000
    ld   bc, $0101
    nop
    inc  bc
    ld   [bc], a
    ld   [bc], a
    inc  b
    db   $EB ; Undefined instruction
    cp   l
    ld   [$EE3D], a
    cp   l
    xor  $BD
    xor  $BD
    xor  $BB
    xor  $BB
    xor  $BB
    xor  $BB
    rst  $28
    cp   e
    rst  $28
    ld   [hl], c
    db   $72
    ld   [hl], d
    ret  c
    ld   [hl], a
    ret  c
    ld   [hl], a
    reti
    ld   h, [hl]
    cp   [hl]
    ld   l, b
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  de
    rst  $38
    ld   sp, label_31DF
    rst  $18
    add  hl, sp
    rst  $18
    add  hl, sp
    rst  $28
    dec  a
    rst  $28
    rra
    rst  $28
    rra
    rst  $28
    ccf
    jp   label_E3
    ld   b, c
    add  a, b
    add  a, d
    nop
    inc  b
    nop
    ld   [$8000], sp
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld   [$FFC0], a
    ld   [$FFC0], a
    ld   a, [$FFE0]
    ld    hl, sp+$D0
    db   $FC ; Undefined instruction
    ret  c
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    cp   $EC
    cp   $6C
    ld   a, [hl]
    inc  c
    ld   e, $0C
    ld   c, $04
    ld   b, $00
    ld   a, [bc]
    dec  b
    ld   d, $0D
    rra
    ld   c, $2F
    ld   e, $3F
    rra
    ld   e, a
    ccf
    ld   a, a
    ccf
    ccf
    ccf
    ccf
    ccf
    rra
    rra
    cpl
    cpl
    rra
    rra
    ld   a, [bc]
    ld   a, [bc]
    dec  b

label_E225B::
    dec  b
    nop
    nop
    nop
    nop
    xor  b
    nop
    cp   b
    nop
    ld   l, a
    sub  a, b
    jr   z, label_E223F
    and  h

label_E2269::
    ld   e, e
    add  a, h
    ld   a, e
    jp   label_FFBC
    ret  nz
    push af
    ld    hl, sp+$F8
    ld   a, [$FFE8]
    ld   a, [$FFD0]
    ret  nz
    xor  b
    or   b
    ld   [label_500], sp
    ld   [$0003], sp
    dec  b
    nop
    ld   a, $01
    ret  z
    scf
    db   $10 ; Undefined instruction
    jr   nz, label_E2269
    ld   b, b
    cp   a
    rst  $38
    nop
    ld   a, a
    rst  $38
    cp   a
    ld   a, a
    rst  $38
    ccf
    jp   z, label_E352A
    dec  d
    ret  nz
    jr   nz, label_E225B
    nop
    add  a, b
    ld   b, b
    nop
    nop
    sbc  a, b
    rlca
    or   b
    rrca
    and  b
    rra
    pop  bc
    ld   a, $83
    ld   a, l
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    xor  d
    xor  d
    ld   d, h
    ld   d, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rst  $28
    ccf
    rst  $18
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
    ld   d, l

label_E22D3::
    ld   d, l
    xor  d
    xor  d
    nop
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
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    cp   $FC
    rst  $38
    cp   $FF
    cp   $FD
    db   $FC ; Undefined instruction
    ld   a, [$FCFA]
    db   $FC ; Undefined instruction
    xor  b
    xor  b
    ld   d, b
    ld   d, b
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
    add  a, d
    ld   a, l
    ld   b, d
    dec  a
    ld   b, d
    dec  a
    ld   h, $19
    inc  e
    inc  bc
    ld   [label_407], sp
    inc  bc
    inc  b
    inc  bc
    add  a, e
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
    add  a, b
    nop
    db   $E8 ; add  sp, d
    jr   nc, label_E22D3
    ld   b, b
    db   $10 ; Undefined instruction
    ld   [label_8F0], sp
    ld   a, [$FF08]
    ld   a, [$FF30]
    ret  nz
    ret  nz
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    jr   nz, label_E233E

label_E233E::
    jr   nz, label_E2340

label_E2340::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_800], sp
    nop
    ld   e, $00
    pop  af
    ld   c, $20
    rra
    ld   b, c
    ld   a, $83
    ld   a, l
    rlca
    ei
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    ld   a, [bc]
    nop
    add  hl, bc
    nop
    ret
    nop
    ld   sp, hl
    ld   b, b
    ld   sp, hl
    ld   a, [$FFFD]
    ld    hl, sp+$FF
    db   $FC ; Undefined instruction
    ld   d, a
    inc  de
    ld   b, a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$FA
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nz, label_E2402
    nop
    ld   b, b
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    ld   c, $04
    ld   [label_80E], sp
    rra
    nop
    ld   c, $0A
    inc  b
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
    nop
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

label_E2402::
    inc  c
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ld   h, b
    nop
    add  a, b
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    inc  b
    nop
    scf
    nop
    rst  $18
    inc  de
    cp   a
    ccf
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    rst  $38
    rst  $38
    rra
    nop
    ld   h, b
    nop
    add  a, b
    nop
    nop
    nop
    inc  a
    nop
    ld   b, e
    nop
    nop

label_E242D::
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    db   $EC ; Undefined instruction
    ld   [$FFF2], a
    ld   a, [$FFF9]
    ld    hl, sp+$FD
    db   $FC ; Undefined instruction
    ld  [$FF00+C], a
    db   $E3 ; Undefined instruction
    call c, label_DFC0
    ccf
    ld   l, a
    ld   l, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   a, a
    ld   c, a
    cpl
    ld   l, a
    ccf
    ld   a, a
    rrca
    daa
    rlca
    ld   h, a
    rst  8
    ld   h, a
    rst  $30
    ld   l, a
    ld   a, a
    ld   [hl], e
    ld   a, e
    ld   a, [hl]
    ld   a, [hl]
    ld   a, a
    ld   [hl], b
    ld   a, e
    di
    cp   a
    jr   c, label_E242D
    call label_FFFF
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    rst  $20
    jp   [hl]
    rst  $38
    db   $E8 ; add  sp, d
    cp   $D0
    rst  $38
    pop  af
    cp   $FA
    ld   a, [$FFFE]
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
    ld   a, a
    cp   $7E
    cp   a
    ld   a, b
    ld   e, a
    inc  e
    cpl
    rrca
    ld   [hl], $06
    dec  hl
    inc  bc
    dec  h
    ld   bc, $0023
    ld   hl, label_2100
    nop
    ld   hl, label_2100
    nop
    ld   hl, label_2600
    nop
    dec  a
    ld   bc, label_337
    cp   e
    inc  de
    cp   $7E
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, b
    ld   a, b
    ld   a, [$FFF0]
    ret  nz
    ret  nc
    ret  nz
    jr   nz, label_E24AF

label_E24AF::
    nop
    jr   c, label_E24EA
    ld   a, [hl]
    ld   a, [hl]
    cp   $FE
    rst  $38
    rst  $38
    cp   $FE
    rst  $38
    cp   $FD
    db   $FC ; Undefined instruction
    ei
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E24EA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_1C08], sp
    jr   label_E258D
    jr   c, label_E258F
    jr   c, label_E2591
    jr   c, label_E2593
    jr   c, label_E2595
    jr   c, label_E2597
    jr   c, label_E2599
    jr   c, label_E259B
    jr   c, label_E25A0
    inc  a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_C00
    ld   [label_C0A], sp
    ld   e, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   e, [hl]
    inc  a
    ld   e, d
    inc  a
    cp   h
    ld   a, b
    ld   a, c
    ld   a, [$FFF0]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   e, b

label_E258D::
    jr   c, label_E25CB

label_E258F::
    inc  e
    cpl

label_E2591::
    ld   e, $1E

label_E2593::
    rrca
    rra

label_E2595::
    rrca
    cpl

label_E2597::
    rra
    dec  sp

label_E2599::
    rra
    ld   d, a

label_E259B::
    dec  sp
    ld   a, l
    inc  sp
    xor  e
    ld   [hl], c

label_E25A0::
    ld   [hl], d
    pop  hl
    ccf
    inc  sp
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E25CB::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ret  nz
    add  a, b
    and  b
    ret  nz
    ld   [$FFC0], a
    ret  nc
    ld   [$FFE8], a
    ld   a, [$FFFC]
    ld    hl, sp+$FC
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_1C08], sp
    jr   label_E268D
    jr   c, label_E268F
    jr   c, label_E2691
    jr   c, label_E2693
    jr   c, label_E2695
    jr   c, label_E2697
    jr   c, label_E2699
    jr   c, label_E269B
    jr   c, label_E26A0
    inc  a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_C00
    ld   [label_C0A], sp
    ld   e, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   a, $1C
    ld   e, [hl]
    inc  a
    ld   e, d
    inc  a
    cp   h
    ld   a, b
    ld   a, c
    ld   a, [$FFF0]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   e, b

label_E268D::
    jr   c, label_E26CB

label_E268F::
    inc  e
    cpl

label_E2691::
    ld   e, $1E

label_E2693::
    rrca
    rra

label_E2695::
    rrca
    cpl

label_E2697::
    rra
    dec  sp

label_E2699::
    rra
    ld   d, a

label_E269B::
    dec  sp
    ld   a, l
    inc  sp
    xor  e
    ld   [hl], c

label_E26A0::
    ld   [hl], d
    pop  hl
    ccf
    inc  sp
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E26CB::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    ret  nz
    add  a, b
    and  b
    ret  nz
    ld   [$FFC0], a
    ret  nc
    ld   [$FFE8], a
    ld   a, [$FFFC]
    ld    hl, sp+$FC
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, c
    add  a, c
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  0
    rst  0
    or   a
    or   a
    or   a
    or   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ei
    ei
    jp   label_B7C3
    or   a
    or   a
    or   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    cp   e
    cp   e
    or   a
    or   a
    xor  a
    xor  a
    sbc  a, a
    sbc  a, a
    cp   a
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    rst  0
    rst  0
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    set  1, e
    push de
    push de
    push de
    push de
    xor  e
    xor  e
    xor  e
    xor  e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $10
    rst  $10
    set  1, e
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    jp   label_EFC3
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $38
    rst  $38
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    set  1, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    set  1, e
    push de
    push de
    push de
    push de
    xor  e
    xor  e
    xor  e
    xor  e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    push de
    push de
    push de
    push de
    xor  e
    xor  e
    xor  e
    xor  e
    rst  $10
    rst  $10
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    set  1, e
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ei
    ei
    jp   label_B7C3
    or   a
    or   a
    or   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    di
    di
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    db   $DB
    db   $DB
    rst  $10
    rst  $10
    rst  8
    rst  8
    or   a
    or   a
    cp   e
    cp   e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    add  a, e
    add  a, e
    cp   a
    cp   a
    rst  0
    rst  0
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    jp   label_EFC3
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $30
    rst  $30
    jp   label_EFC3
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  0
    rst  0
    or   a
    or   a
    or   a
    or   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    set  1, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $10
    rst  $10
    set  1, e
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    db   $DB
    db   $DB
    rst  $10
    rst  $10
    rst  8
    rst  8
    or   a
    or   a
    cp   e
    cp   e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $DD
    db   $EB
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    cp   a
    cp   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    set  1, e
    rst  $38
    rst  $38
    ld   sp, hl
    ld   sp, hl
    rst  $30
    rst  $30
    add  a, c
    add  a, c
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    rst  8
    rst  8
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    rst  0
    rst  0
    cp   a
    cp   a
    cp   a
    cp   a
    rst  $30
    rst  $30
    rst  $30
    rst  $30
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    cp   e
    cp   e
    or   a
    or   a
    set  1, e
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    db   $DD
    db   $EB
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    rst  $20
    rst  $20
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    cp   a
    cp   a
    di
    di
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $18
    rst  $18
    rst  $18
    rst  $18
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $10
    rst  $10
    set  1, e
    db   $DB
    db   $DB
    or   a
    or   a
    or   a
    or   a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $20
    rst  $20
    db   $DB
    db   $DB
    db   $DB
    db   $DB
    db   $E3 ; Undefined instruction
    db   $E3 ; Undefined instruction
    or   a
    or   a
    adc  a, a
    adc  a, a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  c
    rst  $38
    dec  [hl]
    rst  $38
    db   $76 ; Halt
    rst  $28
    or   l
    adc  a, $7B
    adc  a, h
    ld   [hl], a
    adc  a, b
    inc  e
    rst  $38
    inc  h
    rst  $38
    call c, label_E34E7
    adc  a, a
    jp   [hl]
    rra
    ld   [$ED1F], a
    ld   e, $F3
    inc  c
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_E3025
    ret  z
    rst  $38
    ld   sp, $F2DF
    rra
    db   $F4 ; Undefined instruction
    rra
    ld   sp, hl
    ld   c, $00
    rst  $38
    ld   [hl], b
    rst  $38
    adc  a, h
    rst  $38
    or   d
    rst  8
    add  hl, sp
    rst  0
    ld   a, l
    add  a, e
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    nop
    rst  $38
    add  a, c
    rst  $38
    jp   nz, label_A5FF
    cp   $55
    cp   [hl]
    ld   a, e
    sbc  a, h
    ei
    inc  c
    ei
    inc  b
    ret  nz
    rst  $38
    ld   b, c
    rst  $38
    and  d
    ld   a, a
    ld  [$FF00+C], a
    ccf
    push af
    ld   e, $FD
    ld   c, $FD
    ld   c, $FD
    ld   [bc], a
    nop
    rst  $38
    rrca
    rst  $38
    sub  a, h
    ei
    ld   c, e
    db   $FC ; Undefined instruction
    xor  e
    ld   a, h
    push hl
    ld   a, $F5
    ld   e, $F9
    ld   c, $00
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_E3077
    db   $EC ; Undefined instruction
    rra
    ld   a, [$FD07]
    inc  bc
    cp   $01
    nop
    rst  $38
    nop
    rst  $38
    ld   sp, label_E13FF
    cp   $D7
    cp   h
    rst  $10
    inc  a
    rst  $28
    jr   label_E3086
    ld   [$FF38], sp
    ld   e, b
    rst  $28
    db   $E8 ; add  sp, d
    sbc  a, a
    db   $E8 ; add  sp, d
    rra
    jp   [hl]
    rra
    ld   [$ED1F], a
    ld   e, $F1
    ld   c, $00
    rst  $38
    nop
    rst  $38
    ld   b, e
    rst  $38
    and  d
    rst  $38
    ldi  [hl], a
    rst  $38
    and  h
    ld   a, a
    push de
    ld   a, $EB
    inc  e
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    or   b
    ld   a, a
    db   $ED ; Undefined instruction
    rra
    ei
    rlca
    db   $FD ; Undefined instruction
    inc  bc
    cp   $01
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, e
    rst  $38
    rst  0
    ld   a, h

label_E3106::
    and  $3C
    ld   a, [$FF00+C]
    cp   $0C
    db   $FD ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    rst  $38
    rst  $38
    nop
    rst  $38
    add  a, [hl]
    rst  $38
    call label_ED79
    jr   c, label_E3106
    jr   c, label_E3118
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    rst  $38
    ld   bc, label_3FF
    cp   $86
    db   $FC ; Undefined instruction
    db   $ED ; Undefined instruction
    ld   a, b
    ei
    db   $10 ; Undefined instruction
    nop
    rst  $30
    nop
    rrca
    rst  $38
    ld   [hl], b
    ld   a, [$FF84]
    add  a, h
    add  a, a
    add  a, a
    add  a, b
    add  a, b
    ld   h, b
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   c, label_E3183
    add  a, h
    add  a, a
    add  a, h
    add  a, a
    inc  b
    rlca
    jr   label_E316B
    ld   [rIE], a
    nop
    rst  $38
    rrca
    rst  $38
    ld   [hl], b
    ld   a, [$FF84]
    add  a, h
    add  a, a
    add  a, a
    add  a, b
    add  a, b
    ld   h, b
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   c, label_E31A3
    add  a, h
    add  a, a
    add  a, h
    add  a, a
    inc  b
    rlca
    jr   label_E318B
    ld   [rIE], a
    nop
    rst  $38
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
    rrca
    nop
    ld   a, [$FF00]
    ld   b, $F9
    nop
    rst  $38
    nop
    rst  $38
    nop

label_E318B::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jp   label_3C00
    nop
    add  a, c
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
    ld   a, [$FF00]
    rrca

label_E31A3::
    nop
    ld   h, b
    sbc  a, a
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    pop  hl
    cp   a
    or   e
    ld   e, $72
    ld   e, $FA
    ld   c, $FE
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    pop  bc
    ld   a, a
    db   $E3 ; Undefined instruction
    ld   a, $E6
    inc  a
    db   $FD ; Undefined instruction
    jr   label_E3218
    db   $10 ; Undefined instruction

label_E321F::
    db   $10 ; Undefined instruction
    rst  $38
    nop
    rst  $38
    add  a, c
    rst  $38
    ld   b, a
    ld   a, [hl]
    xor  $38
    ld   sp, hl
    db   $10 ; Undefined instruction
    nop
    rst  $30
    nop
    rlca
    rst  $38
    jr   c, label_E322C
    ld   b, d
    jp   nz, label_C343
    ld   b, b
    ret  nz
    jr   nc, label_E322C
    rrca
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    inc  e
    rra
    ld   b, d
    ld   b, e
    jp   nz, label_2C3
    inc  bc
    inc  c
    rrca

label_E324C::
    ld   a, [$FFFF]
    nop
    rst  $38
    rlca
    rst  $38
    jr   c, label_E324C
    ld   b, d
    jp   nz, label_C343
    ld   b, b
    ret  nz
    jr   nc, label_E324C
    rrca
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    inc  e
    rra
    ld   b, d
    ld   b, e
    jp   nz, label_2C3
    inc  bc
    inc  c
    rrca
    ld   a, [$FFFF]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [hl], b
    rst  $18
    pop  de
    sbc  a, a
    or   c
    rra
    ld   a, e
    ld   c, $FA
    ld   c, $FD
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    rst  $38
    rst  $38
    ld   [$FFBF], a
    and  b
    ccf
    ld   sp, label_E331F
    ld   e, $FC
    inc  e
    ei
    db   $10 ; Undefined instruction

label_E331F::
    db   $10 ; Undefined instruction
    rst  $38
    nop
    rst  $38
    ld   h, b
    rst  $38
    and  e
    cp   a
    ld   l, [hl]
    inc  a
    db   $FD ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    rst  $30
    nop
    inc  bc
    rst  $38
    inc  e
    db   $FC ; Undefined instruction

label_E3334::
    ld   hl, label_21E1
    pop  hl
    jr   nz, label_E331A

label_E333A::
    jr   label_E3334
    rlca
    rst  $38
    nop
    rst  $38
    ld   a, [$FFFF]
    ld   c, $0F
    ld   hl, $E121
    pop  hl
    ld   bc, label_601
    rlca
    ld    hl, sp+$FF
    nop
    rst  $38
    inc  bc
    rst  $38
    inc  e
    db   $FC ; Undefined instruction

label_E3354::
    ld   hl, label_21E1
    pop  hl
    jr   nz, label_E333A
    jr   label_E3354
    rlca
    rst  $38
    nop
    rst  $38
    ld   a, [$FFFF]
    ld   c, $0F
    ld   hl, $E121
    pop  hl
    ld   bc, label_601
    rlca
    ld    hl, sp+$FF
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E33BD::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  c
    rst  $38
    dec  [hl]
    rst  $38
    db   $76 ; Halt
    rst  $28
    or   l
    adc  a, $7B
    adc  a, h
    ld   [hl], a
    adc  a, b
    inc  e
    rst  $38
    inc  h
    rst  $38
    call c, label_E34E7
    adc  a, a
    jp   [hl]
    rra
    ld   [$ED1F], a
    ld   e, $F3
    inc  c
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_E3425
    ret  z
    rst  $38
    ld   sp, $F2DF
    rra
    db   $F4 ; Undefined instruction
    rra
    ld   sp, hl
    ld   c, $00
    rst  $38
    ld   [hl], b
    rst  $38
    adc  a, h
    rst  $38
    or   d
    rst  8
    add  hl, sp
    rst  0
    ld   a, l
    add  a, e
    db   $FC ; Undefined instruction
    inc  bc
    cp   $01
    nop
    rst  $38
    add  a, c
    rst  $38
    jp   nz, label_A5FF
    cp   $55
    cp   [hl]
    ld   a, e
    sbc  a, h
    ei
    inc  c
    ei
    inc  b
    ret  nz
    rst  $38
    ld   b, c
    rst  $38
    and  d
    ld   a, a
    ld  [$FF00+C], a
    ccf
    push af
    ld   e, $FD
    ld   c, $FD
    ld   c, $FD
    ld   [bc], a
    nop
    rst  $38
    rrca
    rst  $38
    sub  a, h
    ei
    ld   c, e
    db   $FC ; Undefined instruction
    xor  e
    ld   a, h
    push hl
    ld   a, $F5
    ld   e, $F9
    ld   c, $00
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_E3477
    db   $EC ; Undefined instruction
    rra
    ld   a, [$FD07]
    inc  bc
    cp   $01
    nop
    rst  $38
    nop
    rst  $38
    ld   sp, label_E13FF
    cp   $D7
    cp   h
    rst  $10
    inc  a
    rst  $28
    jr   label_E3486
    ld   [$FF38], sp
    ld   e, b
    rst  $28
    db   $E8 ; add  sp, d
    sbc  a, a
    db   $E8 ; add  sp, d
    rra
    jp   [hl]
    rra
    ld   [$ED1F], a
    ld   e, $F1
    ld   c, $00
    rst  $38
    nop
    rst  $38
    ld   b, e
    rst  $38
    and  d
    rst  $38
    ldi  [hl], a
    rst  $38
    and  h
    ld   a, a
    push de
    ld   a, $EB
    inc  e
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    or   b
    ld   a, a
    db   $ED ; Undefined instruction
    rra
    ei
    rlca
    db   $FD ; Undefined instruction
    inc  bc
    cp   $01
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E34E7::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    add  a, e
    ld   a, a
    call nz, label_E43E
    ld   e, $F2
    ld   c, $FC
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    rst  $38

label_E3511::
    rst  $38
    rst  $38

label_E3513::
    nop
    rst  $38
    add  a, [hl]
    ld   a, l
    ret
    inc  a
    jp   [hl]
    jr   c, label_E3507
    jr   label_E3511
    jr   label_E3513
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_2FF
    cp   $84
    ld   a, h
    jp   [hl]

label_E352A::
    jr   label_E351F
    nop
    rst  $30
    nop
    rst  $30
    rrca
    rst  $38
    ld   [hl], b
    ld   a, [$FF84]
    add  a, h
    add  a, a
    add  a, a
    add  a, b
    add  a, b
    ld   h, b
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   c, label_E3583
    add  a, h
    add  a, a
    add  a, h
    add  a, a
    inc  b
    rlca
    jr   label_E356B
    ld   [rIE], a
    nop
    rst  $38
    rrca
    rst  $38
    ld   a, a
    ld   a, [$FFFF]
    add  a, h
    rst  $38
    add  a, a
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld    hl, sp+$3F
    db   $FC ; Undefined instruction
    add  a, a
    db   $FC ; Undefined instruction
    add  a, a
    db   $FC ; Undefined instruction
    rlca
    ld    hl, sp+$1F
    ld   [rIE], a
    nop
    rst  $38
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
    rrca
    nop
    ld   a, [$FF00]
    ld   b, $F9
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jp   label_3C00
    nop
    add  a, c
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
    ld   a, [$FF00]
    rrca
    nop
    ld   h, b
    sbc  a, a
    nop
    rst  $38
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    and  c
    sbc  a, [hl]
    inc  sp
    ld   e, $72
    ld   c, $FA
    ld   b, $FC
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    rst  $38

label_E3611::
    rst  $38
    rst  $38

label_E3613::
    add  a, b
    ld   a, a
    pop  bc
    ccf
    ld  [$FF00+C], a
    ld   a, $E4
    inc  e
    ld   sp, hl
    jr   label_E3611
    jr   label_E3613
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    add  a, c
    ld   a, a
    ld   b, [hl]
    ld   a, $E8
    jr   label_E361D

label_E362C::
    nop
    rst  $30
    nop
    rst  $30
    rlca
    rst  $38
    jr   c, label_E362C
    ld   b, d
    jp   nz, label_C343
    ld   b, b
    ret  nz
    jr   nc, label_E362C
    rrca
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    inc  e
    rra
    ld   b, d
    ld   b, e
    jp   nz, label_2C3
    inc  bc
    inc  c
    rrca
    ld   a, [$FFFF]
    nop
    rst  $38
    rlca
    rst  $38
    ccf
    ld    hl, sp+$7F
    jp   nz, label_C37F
    ld   a, a
    ret  nz
    ccf
    ld   a, [$FF0F]
    rst  $38
    nop
    rst  $38
    ld   [rIE], a
    db   $FC ; Undefined instruction
    rra
    cp   $43
    cp   $C3
    cp   $03
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FFFF]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   d, b
    rst  $18
    sub  a, c
    sbc  a, a
    ld   sp, label_E3A0F
    ld   c, $FA
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    rst  $38

label_E3711::
    rst  $38
    rst  $38

label_E3713::
    and  b
    cp   a
    jr   nz, label_E3736
    ld   sp, label_E321F

label_E371A::
    inc  e
    db   $FC ; Undefined instruction
    jr   label_E3711
    jr   label_E3713
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   h, b
    cp   a
    and  e
    ld   a, $6C
    inc  e
    pop  af
    nop
    di
    nop
    rst  $30
    inc  bc
    rst  $38
    inc  e
    db   $FC ; Undefined instruction

label_E3734::
    ld   hl, label_21E1
    pop  hl
    jr   nz, label_E371A
    jr   label_E3734
    rlca
    rst  $38
    nop
    rst  $38
    ld   a, [$FFFF]
    ld   c, $0F
    ld   hl, $E121
    pop  hl
    ld   bc, label_601
    rlca
    ld    hl, sp+$FF
    nop
    rst  $38
    inc  bc
    rst  $38
    rra
    db   $FC ; Undefined instruction
    ccf
    pop  hl
    ccf
    pop  hl
    ccf
    ld   [$FF1F], a
    ld    hl, sp+$07
    rst  $38
    nop
    rst  $38
    ld   a, [$FFFF]
    cp   $0F
    rst  $38
    ld   hl, $E1FF
    rst  $38
    ld   bc, label_7FE
    ld    hl, sp+$FF
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E3800::
    nop
    ld   b, b
    ld   b, b
    ld   b, b
    add  a, b
    ld   b, b
    ret  nz
    ld   b, b
    nop
    ld   b, c
    ld   b, b
    ld   b, c
    add  a, b
    ld   b, c
    ret  nz
    ld   b, c

label_E3810::
    nop
    add  a, h
    ld   b, b
    add  a, h
    add  a, b
    add  a, h
    ret  nz
    add  a, h
    nop
    add  a, a
    ld   b, b
    add  a, a
    add  a, b
    add  a, a
    ret  nz
    add  a, a

label_E3820::
    nop
    add  a, h
    ld   b, b
    add  a, h
    add  a, b
    add  a, h
    ret  nz
    add  a, h
    nop
    add  a, [hl]
    ld   b, b
    add  a, [hl]
    add  a, b
    add  a, [hl]
    ret  nz
    add  a, [hl]
    ld   hl, label_E3810
    ld   a, [$FFF6]
    cp   $0D
    jr   nz, label_E383C
    ld   hl, label_E3820

label_E383C::
    ld   a, [$FFA6]
    dec  a
    and  $07
    sla  a
    ld   c, a
    ld   b, $00
    add  hl, bc
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   hl, label_E3800
    add  hl, bc
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   bc, $0040
    ld   a, $38
    call label_2914
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$DDD1]
    and  a
    ret  nz
    ld   bc, $0000

label_E3867::
    push bc
    ld   hl, $C242
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_E3890
    push bc
    sla  c
    ld   hl, $C23A
    add  hl, bc
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    ld   hl, $C232
    add  hl, bc
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    pop  bc
    push hl
    ld   hl, $C22A
    add  hl, bc
    ld   c, [hl]
    ld   b, $00
    pop  hl
    ld   a, $38
    call label_2914

label_E3890::
    pop  bc
    inc  bc
    ld   a, c
    and  $03
    jr   nz, label_E3867
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E3A0F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
