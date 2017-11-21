section "bank46",romx,bank[$2E]
    ld   [bc], a
    nop
    rlca
    ld   [bc], a
    rrca
    ld   b, $0A
    rlca
    dec  b
    ld   [bc], a
    inc  bc
    ld   bc, $0103
    rlca
    nop
    rlca
    ld   [bc], a
    rrca
    dec  b
    dec  bc
    inc  b
    rrca
    ld   [bc], a
    rlca
    ld   [bc], a
    rlca
    nop
    dec  b
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    nop
    nop
    inc  a
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    adc  a, [hl]
    cp   $DF
    cp   $57
    db   $FD ; Undefined instruction
    ld   c, $FF
    jr   nc, label_B8032
    db   $FD ; Undefined instruction
    rst  $38
    ld   [bc], a
    rst  $38
    ld   b, $FF
    ld   b, $FF
    pop  af
    cp   $FF
    ld   [hl], a
    ld    hl, sp+$40
    nop
    ld   [rLCDC], a
    ld   a, [$FF60]
    ret  nc
    ld   [$FFA0], a
    ld   b, b
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF20]
    ret  nc
    ld   h, b
    ld   [rJOYP], a
    ld   [$FF80], a
    ld   [$FF80], a
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
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
    rla
    ld   [label_1827], sp
    cpl
    db   $10
    db   $27
    inc  e
    inc  hl
    inc  e
    rla
    ld   [$000F], sp
    inc  b
    inc  bc
    rlca
    nop
    rrca
    dec  b
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
    xor  a
    ld   [hl], b
    adc  a, a
    ld   [hl], b
    rst  $38
    nop
    nop
    rst  $38
    sbc  a, [hl]
    ld   h, c
    jp   z, label_FBB1
    nop
    nop
    nop
    add  a, b
    nop
    ld    hl, sp+$00
    call nz, label_C238
    inc  a
    ld  [$FF00+C], a
    inc  e
    jp   nc, label_D26C
    inc  l
    add  a, d
    db   $FC ; Undefined instruction
    ld   b, $F8
    adc  a, [hl]
    ld   [hl], b
    db   $FC ; Undefined instruction
    nop
    ld   [label_3CF0], sp
    ret  nz
    ld   a, [hl]
    or   h
    cp   $00
    ld   [hl], b
    nop
    sbc  a, b
    ld   [hl], b
    adc  a, c
    ld   [hl], b
    sbc  a, a
    ld   h, b
    adc  a, a
    ld   [hl], b
    ld   c, a
    jr   nc, label_B8114

label_B80CD::
    jr   c, label_B80F6
    jr   label_B80F0
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    inc  b
    inc  bc
    rlca
    nop
    rrca
    dec  b
    rrca
    nop
    ld   c, $00
    sbc  a, l
    ld   c, $F5
    ld   c, $E9
    ld   d, $E7
    jr   label_B80CD
    inc  e
    ld   a, [$FF00+C]
    db   $FC ; Undefined instruction
    nop

label_B80F0::
    cp   $00
    cp   $00
    cp   $00

label_B80F6::
    db   $FC ; Undefined instruction
    nop
    ld   [label_3CF0], sp
    ret  nz
    ld   a, [hl]
    or   h

label_B80FE::
    cp   $00
    inc  c
    nop
    ld   e, $0C
    ld   a, $0C
    ccf
    inc  d
    ld   a, $11
    ccf
    jr   label_B813C
    inc  e
    rra
    inc  c
    ccf
    inc  b

label_B8112::
    ld   e, a
    jr   nz, label_B8174
    jr   nz, label_B80FE
    jr   label_B8112
    add  a, a
    rst  $38
    add  a, b
    ld   a, a
    ld   [hl], b
    rra
    add  hl, de
    ld   bc, label_BA300
    ld   bc, label_2173
    ld   a, e
    jr   nz, label_B81A8
    ld   sp, label_317F
    ld   e, a
    ld   sp, label_112F
    ld   a, $01
    rst  $18
    jr   nz, label_B8114
    and  b
    rst  $20
    sbc  a, b
    ld   sp, hl
    rlca
    rst  $38
    ret  nz

label_B813C::
    ld   a, a
    ld   h, b
    ccf
    ld   [hl], $00
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
    ld   c, $04
    ld   a, $04
    ccf
    inc  d
    ld   a, $11
    ccf
    jr   label_B81C6
    inc  e
    rst  $30
    ld   l, h
    ei
    db   $E4 ; Undefined instruction
    rst  $38
    ret  nc
    ld   a, a
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
    nop
    nop
    ld   c, $00
    ccf
    ld   l, $3F
    dec  l
    ld   a, a
    ld   sp, label_367F
    ld   a, a
    ld   c, l
    ccf
    add  hl, sp
    rrca
    ld   c, $00
    nop
    jr   c, label_B8184

label_B8184::
    ld   a, h
    jr   c, label_B8183
    ld   [hl], b
    cp   $74
    cp   $74
    cp   $74
    cp   d
    ld   l, h
    ld   d, a
    jr   c, label_B81C2
    ld   [de], a
    rra
    ld   [bc], a
    dec  [hl]
    ld   a, [bc]
    db   $76 ; Halt

label_B8199::
    dec  l
    di
    ld   l, a
    ld    hl, sp+$47
    rst  $38
    nop

label_B81A0::
    inc  e
    nop
    ld   a, $1C
    ld   a, [hl]
    jr   c, label_B8226
    db   $3A ; ldd  a, [hl]

label_B81A8::
    ld   a, a
    db   $3A ; ldd  a, [hl]
    ld   a, a
    db   $3A ; ldd  a, [hl]
    ld   e, l
    ld   [hl], $2B
    inc  e
    cpl
    ld   [de], a

label_B81B2::
    rra
    ld   [bc], a
    dec  d
    ld   a, [bc]
    ld   [hl], $0D
    ld   [hl], e
    cpl
    ld   a, b
    scf
    ld   a, a
    jr   nz, label_B823E
    nop
    nop
    nop

label_B81C2::
    ld   h, c
    nop
    ld   [hl], c
    jr   nz, label_B8206
    db   $10
    db   $1F
    nop
    inc  d
    rrca
    ld   l, a
    dec  de

label_B81CE::
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
    jr   nc, label_B81CE
    ld   b, c
    jp   label_101
    nop
    add  a, b
    nop
    jp   label_CF80
    add  a, d
    cp   $0C
    db   $F4 ; Undefined instruction
    jr   label_B81A3
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
    jr   label_B8199
    inc  b
    add  a, [hl]
    nop
    nop
    nop
    rst  $20
    nop
    inc  a
    inc  bc
    ld   a, $1D

label_B8206::
    cp   $15
    cp   [hl]
    dec  e
    inc  a
    inc  bc
    ccf
    jr   label_B824E
    ld   bc, label_3877
    add  a, d
    ld   a, l
    xor  e
    ld   d, h
    ld   a, [hl]
    ld   bc, label_1F20
    inc  hl
    inc  e
    rra
    nop
    rlca
    nop
    call c, label_3000
    ret  nz
    ld   e, $E0

label_B8226::
    jp   z, label_8830
    ld   [hl], b
    inc  a
    ret  nz
    xor  $1C
    pop  bc
    cp   [hl]
    push de
    ld   a, [hli]
    ld   a, [hl]
    add  a, b
    call nz, label_438
    ld    hl, sp+$08
    ld   a, [$FF84]
    ld   a, b
    call nz, label_FC38
    nop
    ld   [hl], e
    nop
    ld   e, $01

label_B8244::
    rra
    ld   c, $7F
    ld   a, [bc]
    ld   e, a
    ld   c, $3E
    ld   bc, label_3877

label_B824E::
    add  a, e
    ld   a, h
    xor  e
    ld   d, h
    ld   a, [hl]
    ld   bc, label_1C23
    jr   nz, label_B8277
    db   $10
    db   $0F
    ld   hl, label_231E
    inc  e
    ccf
    nop
    xor  $00
    jr   label_B8244
    rrca
    ld   a, [$FF65]
    sbc  a, b
    ld   b, h
    cp   b
    inc  e
    ld   [$FFFC], a
    ld   [$D8FC], sp
    db   $FC ; Undefined instruction
    nop
    ld   l, $DC
    pop  bc
    ld   a, $55

label_B8277::
    xor  d

label_B8278::
    ld   a, $C0
    add  a, h
    ld   a, b
    ld    hl, sp+$00
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
    rst  $20
    nop
    jr   c, label_B8295
    jr   nz, label_B82AF
    inc  a
    inc  bc
    cp   $1D
    cp   [hl]

label_B8295::
    dec  d
    ld   a, $05
    ld   [hl], l
    db   $3A ; ldd  a, [hl]
    add  a, e
    ld   a, h
    xor  e
    ld   d, h
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
    sbc  a, h
    nop
    ld   [hl], b
    add  a, b
    ld   e, $E0
    ld   a, [bc]
    ld   a, [$FFC8]
    jr   nc, label_B823D
    ld   [hl], b
    jr   c, label_B8278
    call c, label_8238
    ld   a, h
    xor  d
    ld   d, h
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
    inc  d
    nop
    ld   l, d
    inc  d
    xor  d
    ld   d, h
    jp   nz, label_963C
    ld   l, b
    ld   l, c
    nop
    nop
    nop
    rrca
    rrca
    rra
    db   $10
    db   $3F
    jr   nz, label_B8317
    cpl
    daa
    ccf
    cpl
    inc  a
    cpl
    ccf
    ld   l, a
    ld   a, c
    rst  $28
    cp   a
    rst  $28
    cp   d
    rst  $28
    cp   a
    ld   [$FFBF], a
    rst  $38
    cp   a
    rst  $38
    add  a, b
    sbc  a, b
    rst  $38
    rst  $38
    ld   h, a
    ld   [hl], e
    nop
    rst  $38
    ld   [hl], e
    ld   a, a
    ccf
    ccf
    rlca
    rra
    dec  bc
    ccf
    ld   [label_277F], sp
    rst  $38
    ld   l, a
    rst  $38
    ld   l, l
    sbc  a, a
    ld   h, a
    ld   a, a
    nop
    dec  sp

label_B8317::
    rlca
    ccf
    nop
    ccf
    inc  e
    ld   a, a
    inc  l
    ld   a, [hl]
    nop
    call z, label_FE00
    call z, label_FEFF
    rst  $18
    ld   [$FFB8], a
    ret  nc
    db   $FC ; Undefined instruction
    db   $10
    db   $EE
    or   h
    rst  $38
    add  a, $DF
    ld   h, d
    rst  $38
    adc  a, $FD
    ld   c, $B2
    call z, label_FC
    and  h
    ld   e, b
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    inc  bc
    nop
    ld   a, a
    inc  bc
    rst  $38
    ld   a, a
    ld   e, a
    cpl
    ccf
    nop
    rla
    rrca
    daa
    jr   label_B83CE
    nop
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    and  a
    ld   e, b
    ld   [hl], b
    rrca
    ccf
    nop
    daa
    jr   label_B839C
    nop
    nop
    nop
    ret  nz
    nop
    db   $EC ; Undefined instruction
    ret  nz
    cp   $EC
    rst  $38
    cp   $EE
    db   $10
    db   $DC
    ld   [$FFCC], a

label_B836D::
    jr   nc, label_B836D
    inc  b
    ei
    ld   b, $FD
    ld   [bc], a
    adc  a, $30
    inc  e
    ld   [$FFFC], a
    nop
    db   $FC ; Undefined instruction

label_B837B::
    jr   label_B837B
    inc  a
    ld   a, [hl]
    nop
    inc  bc
    nop
    rlca
    inc  bc
    ld   l, a
    rlca
    rst  $38
    ld   h, h
    rst  $38
    ld   [hl], c
    rst  $38
    ld   e, e
    cp   a
    ld   a, h
    ld   a, a
    rrca
    ld   e, [hl]
    ccf
    scf
    ld   [label_70F], sp
    rrca
    rlca
    ld   a, [bc]
    rlca
    rlca
    nop

label_B839C::
    inc  bc
    ld   bc, $0007
    call c, label_FE00
    call c, label_FEFF
    ld   a, a
    ret  c
    call c, label_DE60
    ld   l, b
    cp   [hl]
    ret  nc
    ld   a, a
    add  a, b
    rst  $38
    ld   [hl], b
    db   $FD ; Undefined instruction
    ld   a, [label_BBAFD]
    rst  $30
    ld    hl, sp+$8F
    ld   [hl], b
    db   $FC ; Undefined instruction
    nop
    add  a, [hl]
    ld    hl, sp+$FE
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    ld   l, a
    rlca
    rst  $38
    ld   h, h
    rst  $38
    ld   [hl], c
    rst  $38
    ld   e, e

label_B83CE::
    cp   a
    ld   a, h
    ld   a, a
    rrca
    ld   e, a
    inc  a
    scf
    dec  bc
    rra
    inc  bc
    dec  e
    inc  bc
    rrca
    nop
    inc  e
    rrca
    rra
    nop
    nop
    nop
    rst  8
    nop
    rst  $38
    adc  a, $FE
    db   $FC ; Undefined instruction
    ld   a, h
    ret  c
    call c, label_DE60
    ld   l, b
    cp   [hl]
    ret  nc
    ld   a, a
    add  a, b
    rst  $38
    ld   [hl], b
    db   $FD ; Undefined instruction
    cp   d
    push af
    ld   a, [$B04F]
    ld   sp, hl
    ld   b, $79
    sbc  a, [hl]
    cp   $00
    rrca
    nop
    ccf
    ld   bc, label_37F
    ld   [hl], e
    rrca
    cp   $01
    rst  $38
    ld   l, $7F
    ld   [hl], $7F
    dec  a
    ccf
    inc  bc
    ld   a, a
    inc  c
    rst  $38
    ld   b, a
    rst  $20
    ld   e, b
    ld   h, b
    rra
    ld   e, $01
    rra
    inc  c
    rra
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    add  a, b
    cp   $C0
    adc  a, $F0
    ld   a, a
    add  a, b
    rst  $38
    ld   [hl], h
    cp   $6C
    cp   $BC
    cp   $C0
    db   $FC ; Undefined instruction
    jr   c, label_B8431
    ld   [$FFFE], a
    inc  c
    ld   e, $EC
    inc  e

label_B843B::
    ld   [$FFF0], a
    nop
    ld   a, [$FF00]
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
    ld   b, b
    rst  $38
    ld   b, b
    di
    ld   e, h
    ld   a, b
    rra
    rra
    rrca
    ccf
    nop
    ld   [hl], b
    cpl
    ld   [hl], b
    cpl
    jr   c, label_B8463
    rrca
    nop
    ccf
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    rst  8
    db   $3A ; ldd  a, [hl]
    ld   e, $F8
    cp   $F0
    cp   $04
    ld   c, $F4
    inc  c
    ld   a, [$FFF8]
    nop
    ld    hl, sp+$70
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    rrca
    ld   [bc], a
    rrca
    rlca
    ccf
    inc  b
    ccf
    inc  de
    ccf
    inc  de
    ccf
    ld   a, [bc]
    ccf
    dec  de
    ld   a, a
    inc  a
    ld   a, a
    rlca
    rra
    rrca
    rra
    nop
    dec  b
    ld   [bc], a
    dec  b
    ld   [bc], a
    inc  bc
    ld   bc, $0007
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    nop
    cp   $C0
    rst  $38
    ld   b, b
    rst  $38
    ld   c, h
    rst  $38
    ld   a, $FF
    ld   a, [hl]
    cp   $70
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld   a, [$FFF0]
    nop
    db   $E8 ; add  sp, d
    ret  nc
    db   $E8 ; add  sp, d
    ret  nc
    ld    hl, sp+$00
    ld    hl, sp+$E0
    ld    hl, sp+$00
    nop
    nop
    rlca
    nop
    rrca
    ld   [bc], a
    rrca
    rlca
    ccf
    inc  b
    ccf
    inc  de
    ccf
    inc  de
    ccf
    ld   a, [bc]
    ccf
    dec  de
    ld   a, a
    inc  a
    ld   a, a
    rlca
    rra
    ld   c, $0F
    ld   bc, $010F
    rra
    ld   c, $1F
    nop
    nop
    nop
    ld   a, [$FF00]

label_B84E4::
    db   $FC ; Undefined instruction
    nop
    cp   $C0
    rst  $38
    ld   b, b
    rst  $38
    ld   c, h
    rst  $38
    ld   a, $FF
    ld   a, [hl]
    cp   $70
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8
    ld   a, [$FFF0]
    nop
    ret  c
    and  b
    db   $FC ; Undefined instruction

label_B84FB::
    adc  a, b
    db   $FC ; Undefined instruction
    jr   c, label_B84FB
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc
    rlca
    ld   de, label_110F
    ld   c, $23
    inc  e
    ld   h, $19
    ld   h, l
    dec  de
    xor  a
    ld   d, c
    cp   a
    ld   b, [hl]
    sbc  a, a
    ld   l, a
    ld   c, e
    scf
    ccf
    rlca
    daa
    dec  de
    ld   h, a
    dec  e
    ld   a, a
    nop
    ret  nz
    nop
    jr   nz, label_B84E4
    sub  a, b
    ld   [$FF88], a
    ld   a, [$FF88]
    ld   [hl], b
    call nz, label_BA638
    sbc  a, b
    and  l
    jp  c, label_8AF5
    ld   sp, hl
    ld   h, [hl]
    ld   a, [$DCF4]
    ld   [$FFF4], a
    db   $E8 ; add  sp, d
    ld  [$FF00+C], a
    call c, label_BCF2
    cp   $00
    inc  bc
    nop
    dec  b
    inc  bc
    add  hl, bc
    rlca
    ld   de, label_100F
    rrca
    jr   z, label_B8563
    jr   z, label_B8565
    inc  h
    dec  de
    ld   d, b
    cpl
    adc  a, b
    ld   [hl], a
    adc  a, h
    ld   a, e
    sbc  a, a
    ld   l, h
    ld   d, a
    cpl
    jr   nc, label_B856B
    ld   h, b
    rra
    ld   a, a
    nop
    ret  nz
    nop
    and  b

label_B8563::
    ret  nz
    sub  a, b

label_B8565::
    ld   [$FF08], a
    ld   a, [$FF08]
    ld   a, [$FF14]

label_B856B::
    db   $E8 ; add  sp, d
    inc  [hl]
    ret  z
    ld   c, d
    or   h
    ld   de, label_29EE
    sub  a, $59
    or   [hl]
    ld   a, [$EC74]
    ld   a, [$FF04]
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    cp   $00
    ld   a, [hl]
    nop
    rst  $38
    ld   a, [hl]
    ld   [$FF3F], a
    ld   [$FF1F], a
    ld   [hl], b
    rrca
    ld   [hl], b

label_B858B::
    rrca
    ld   a, b
    daa
    ld    hl, sp+$67
    rst  $38
    jr   label_B858B
    ld   [hl], a
    ld    hl, sp+$77
    db   $FC ; Undefined instruction
    ld   [hl], e
    ld   a, e
    inc  [hl]
    ld   a, b
    daa
    jr   c, label_B85A5
    rra
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b

label_B85A5::
    add  a, b
    jr   nz, label_B8568
    db   $10
    db   $E0

label_B85AA::
    ld   [hl], b
    add  a, b
    ld   [$C8F0], sp
    jr   nc, label_B85D5
    ret  c
    inc  d
    db   $E8 ; add  sp, d
    inc  e
    ld   a, [$FF78]
    or   b
    adc  a, b
    ld   [hl], b
    ld   [label_4F0], sp
    ld    hl, sp+$FC
    nop
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    ld   a, [hl]
    ld   [$FF3F], a
    ld   [$FF1F], a
    ld   [hl], b
    rrca
    ld   [hl], b
    rrca
    ld   a, b
    daa
    ld   sp, hl
    ld   h, [hl]
    cp   $11
    ld   a, [$FF6F]
    ld   a, [$FF6F]
    ld    hl, sp+$77
    ld   a, a
    jr   nc, label_B864D
    cpl
    ccf
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   b, b
    add  a, b
    jr   nz, label_B85AA
    db   $10
    db   $E0
    ld   [hl], b
    add  a, b
    ld   [$C8F0], sp
    jr   nc, label_B8617
    ret  c
    inc  d
    db   $E8 ; add  sp, d
    inc  e
    ld   a, [$FFB8]
    ld   [hl], b
    inc  b
    ld    hl, sp+$02
    db   $FC ; Undefined instruction
    cp   $00
    ld   [hl], e
    nop
    ld   l, a
    ldd  [hl], a
    ccf
    rla
    rra
    dec  b
    rrca
    nop
    rra
    inc  b
    ccf
    rrca
    ld   e, a
    inc  l

label_B8610::
    rst  $38
    ld   l, e
    ei
    ld   h, a
    sbc  a, c
    ld   h, a
    ld   a, a

label_B8617::
    nop
    dec  sp
    rlca
    ld   c, a
    jr   nc, label_B8610
    ld   a, h
    rst  $38
    nop
    rst  8
    nop
    rst  $30
    adc  a, $FE
    db   $E4 ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   h, b
    ld    hl, sp+$00
    call c, label_EAE0
    db   $F4 ; Undefined instruction
    rst  $38
    db   $76 ; Halt
    rst  $38
    or   [hl]
    xor  c
    sub  a, $3E
    ret  nz
    db   $FC ; Undefined instruction
    nop
    sbc  a, $E0
    ld   a, [$FF00+C]
    rst  8
    ld   a, $FF
    nop
    ld   [hl], e
    nop
    ld   e, a
    jr   nz, label_B8674
    db   $10
    db   $1F
    nop
    ccf
    nop
    ld   a, a
    jr   nz, label_B864C

label_B864D::
    ld   h, b
    rst  $18
    ld   h, b
    cp   a
    ld   b, h
    ld   a, a
    ld   b, $7B
    rlca
    ld   [hl], l
    dec  bc
    inc  hl
    inc  e
    ld   e, b
    daa
    rst  0
    ld   a, b
    rst  $38
    nop
    rst  $28
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
    ld   a, [$FC04]
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $04
    rst  $38
    ld   b, $FB
    ld   b, $FD
    ld   [bc], a

label_B8674::
    cp   $00
    cp   h
    ld   b, b
    inc  c
    ld   a, [$FF1A]
    db   $E4 ; Undefined instruction
    db   $E3 ; Undefined instruction
    ld   e, $FF
    nop
    rrca
    nop
    rra
    inc  c
    rra
    inc  b
    rst  $38
    inc  b
    rst  $38
    jr   c, label_B868A
    ld   a, h
    db   $FD ; Undefined instruction
    ld   a, $FD
    ld   e, [hl]
    cp   e
    ld   l, h
    ld   e, a
    dec  hl
    ccf
    inc  bc
    dec  h
    dec  de
    ccf
    nop
    rra
    ld   bc, label_70E
    rrca
    nop
    ld   [hl], b
    nop
    ld   a, [$FF60]
    ld   [$FFC0], a
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    ld   e, h
    ld   [$FFFE], a
    ld   [rIE], a
    ld  [$FF00+C], a
    rst  $18
    ld  [$FF00+C], a
    cp   c
    add  a, $E2
    inc  e
    inc  a
    ret  nz
    ld   [$F8F0], sp
    nop
    rra
    nop
    ccf
    ld   d, $3F
    dec  bc
    ld   a, a
    inc  bc
    rst  $38
    ld   c, h
    rst  $38
    ld   a, [hl]
    cp   $5F
    cp   $2F
    rst  $38
    db   $76 ; Halt
    ld   a, e
    inc  [hl]
    ccf
    ld   bc, label_1D23
    ld   a, $01
    rra
    nop
    ld   c, $07
    rrca
    nop
    ld   a, b
    nop
    ld    hl, sp+$30
    ld   a, [$FF60]
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    xor  h
    ld   [hl], b
    cp   $70
    rst  $38
    ld   [hl], d
    rst  $38
    ld   a, [$FF00+C]
    or   $D2
    db   $EC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    ld   [$F8F0], sp
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
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

label_B872E::
    ld   a, b
    daa
    di
    ld   l, h
    rst  $30
    ld   l, c
    ld   [hl], a
    jr   z, label_B872E
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
    ld   sp, label_BA77F
    ld   a, a
    ld   l, [hl]
    rst  $38
    call z, label_CDFF
    rst  $38
    ld   h, a
    rst  $38
    ld   [hl], e
    rst  $38
    cp   b
    rst  $38
    sbc  a, a
    ld   a, a
    ld   b, a
    ccf
    jr   nc, label_B876C
    rrca
    nop
    nop
    ld   bc, label_300
    ld   bc, label_1E3
    rst  $30
    ld   h, b
    rst  $38
    ld   [hl], b
    ld   a, a
    inc  l

label_B876C::
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
    inc  bc
    nop
    inc  a
    inc  bc
    ld   a, c
    scf
    db   $DB
    ld   [hl], l
    cp   e
    ld   d, h
    ld   sp, hl

label_B878B::
    ld   b, [hl]
    xor  h
    ld   b, e
    rst  $20
    ld   b, b
    and  a
    ld   b, d
    rst  $20
    ld   b, d
    and  d
    ld   b, b
    ld   [rLCDC], a
    and  b
    ld   b, b
    ld   [rLCDC], a
    sub  a, b
    ld   h, b
    ld   [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_B87AC

label_B87AC::
    ld   a, e
    jr   nc, label_B878B
    ld   [hl], e
    cp   c
    ld   d, a
    db   $EB ; Undefined instruction
    ld   d, l
    xor  e
    ld   d, h
    jp   hl
    ld   d, [hl]
    cp   h
    ld   b, e
    rst  $20
    ld   b, b
    sub  a, a
    ld   h, d
    ld   [hl], e
    nop
    nop
    nop
    ccf
    nop
    ld   a, a
    dec  hl
    rst  $38
    xor  e
    call nc, label_FFAB
    add  a, b
    rst  $38
    xor  e
    rst  $38
    xor  e
    call nc, label_FFAB
    add  a, b
    rst  $38
    xor  e
    rst  $38
    xor  e
    call nc, label_D4AB
    xor  e
    cp   a
    ret  nz
    ld   a, a
    ld   a, a
    nop
    nop
    ccf
    ccf
    ld   a, a
    ld   b, b
    rst  $38
    xor  e
    rst  $38
    xor  e
    call nc, label_FFAB
    ret  nz
    rst  $38
    xor  e
    rst  $38
    xor  e
    call nc, label_FFAB
    ret  nz
    rst  $38
    xor  e
    rst  $38
    xor  e
    call nc, label_FFAB
    ret  nz
    ld   a, a
    ld   a, a
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    rlca
    ccf
    rrca
    ld   a, a
    dec  hl
    ld   l, a
    dec  a
    ld   a, a
    ccf
    ccf
    dec  de
    cpl
    inc  e
    rla
    rrca
    cpl
    db   $10
    db   $2F
    rla
    rra
    ld   b, $1F
    nop
    ccf
    inc  e
    ccf
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld   a, [$FFE0]
    cp   $F0
    rst  $38
    or   [hl]
    rst  $30
    ld   a, [hl]
    db   $FD ; Undefined instruction
    cp   $FE
    cp   b
    db   $F4 ; Undefined instruction
    ld   a, b
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]
    nop
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $F4 ; Undefined instruction
    ld   l, b
    ld    hl, sp+$C0
    db   $FC ; Undefined instruction
    jr   c, label_B883B
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    rlca
    ccf
    rrca
    ld   a, a
    scf
    ld   [hl], a
    ccf
    ld   e, a
    ccf
    ccf
    rrca
    ld   e, [hl]
    cpl
    ld   c, a
    inc  sp
    ld   b, e
    inc  a
    jr   nz, label_B8877
    rra
    rrca
    rra
    nop
    ccf
    inc  e
    ccf
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld   a, [$FFE0]
    db   $FC ; Undefined instruction
    ld   a, [$FFFE]
    db   $F4 ; Undefined instruction
    cp   $FC
    ld   a, [$FCFC]
    ld    hl, sp+$38
    ld   a, [$FFFC]
    ret  nz
    jp   nz, label_23C

label_B8877::
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld    hl, sp+$F8

label_B887B::
    nop
    db   $FC ; Undefined instruction
    jr   c, label_B887B
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    rlca
    rra
    rrca
    rra
    dec  bc
    ccf
    rla
    ccf
    rra
    ccf
    dec  de
    ccf
    rlca
    rra
    rrca
    rra
    nop
    ccf
    ld   a, [de]
    ccf
    ld   d, $1F
    ld   c, $0F
    ld   bc, $000F
    ret  nz
    nop
    ld   a, [$FFC0]
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    ret  nz
    db   $FC ; Undefined instruction
    cp   b
    cp   h
    ld    hl, sp+$FC
    ld    hl, sp+$F8
    ld   [$FFF0], a
    ld   [$FFF0], a
    nop
    db   $10
    db   $E0
    db   $10
    db   $E0
    jr   nz, label_B887A

label_B88BA::
    ld   [rJOYP], a
    ld   a, [$FFE0]
    ld   a, [$FF00]
    inc  bc
    nop
    rlca
    inc  bc
    rra
    rlca
    rra
    rrca
    ccf
    ld   d, $3F
    dec  d
    ccf
    rra
    ccf
    ld   e, $1F
    ld   bc, label_F1F
    ccf
    nop
    ld   a, [hl]
    dec  l
    ld   a, [hl]
    dec  l
    ld   a, a
    inc  [hl]
    ccf
    ld   bc, $000F
    ret  nz
    nop
    ld   a, [$FFC0]
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    ld   [$FFFE], a
    call c, label_FCDE
    cp   $FC
    db   $FC ; Undefined instruction
    ld   a, [$FFF8]
    ld   a, [$FFF0]
    add  a, b
    sub  a, b
    ld   h, b
    db   $10
    db   $E0
    jr   nz, label_B88BA
    ld   [rJOYP], a
    ld   a, [$FFE0]
    ld   a, [$FF00]
    inc  bc
    nop
    rlca
    inc  bc
    rlca
    nop
    rst  $38
    inc  bc
    rst  $38
    ld   a, d
    rst  $38
    ld   [bc], a
    rst  $38
    ld   a, e
    rst  $38
    ld   b, b
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rLCDC], a
    ld   [rJOYP], a
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
    nop
    rrca
    inc  bc
    rra
    ld   a, [bc]
    ccf
    ld   a, [de]
    ld   a, a
    inc  sp
    rst  $38
    ld   l, b
    ld    hl, sp+$50
    ld   a, [$FF20]
    ld   a, [$FF40]
    ld   a, b
    jr   nz, label_B8975
    db   $10
    db   $1C
    ld   [$0008], sp
    nop
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
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    cp   l
    ld   b, d
    and  l
    ld   e, d
    add  a, l
    ld   a, d
    sbc  a, l
    ld   h, d
    sbc  a, c
    ld   h, [hl]
    add  a, c
    ld   a, [hl]
    sbc  a, c
    ld   h, [hl]
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    rst  $38
    nop
    rst  $38
    ld   l, e
    rst  $38
    ld   e, l
    rst  $38
    ld   e, l
    rst  $38
    ld   l, e
    rst  $38
    nop
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a

label_B8975::
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    rst  $38
    nop
    rst  $38
    cp   $FF
    nop
    rst  $38
    add  a, $FF
    add  a, d
    rst  $38
    add  a, d
    rst  $38
    add  a, $FF
    nop
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   a, b
    nop
    ld   l, h
    nop
    ld   l, h
    nop
    ld   a, h
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   a, [hl]
    nop
    nop
    nop
    nop
    nop
    ld   [label_BBC00], sp
    nop
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    ld   a, h
    nop
    ld   [$0000], sp
    nop
    inc  a
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   a, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    nop
    nop
    nop
    nop
    inc  a
    nop
    inc  a
    nop
    inc  a
    nop
    ld   a, [hl]
    nop
    inc  a
    nop
    jr   label_B89DE

label_B89DE::
    nop
    nop
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_B8A04::
    nop
    nop
    nop
    nop
    jr   nc, label_B8A0A

label_B8A0A::
    ld   a, b
    jr   nc, label_B8A8A
    jr   c, label_B8A6E
    dec  a
    ld   c, a
    ccf
    cpl
    rra
    daa
    dec  de
    rla
    dec  bc
    rrca
    ld   bc, label_70F
    rra
    rrca
    rra
    rrca
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rra
    inc  bc
    ld   a, a
    rra
    rst  $38
    ld   a, a
    rst  $38
    ld    hl, sp+$F8
    rst  $30
    pop  af
    rst  $28
    pop  hl
    sbc  a, $E3
    call c, label_DCA3
    rra
    db   $E3 ; Undefined instruction
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rra
    rrca
    rra
    rrca
    rra
    rrca
    rla
    rrca
    rla
    rrca
    inc  de
    rrca
    dec  bc
    rlca
    add  hl, bc
    rlca
    add  hl, bc
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
    rst  $38
    ccf
    rst  $38
    rrca
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ret  nz
    pop  af
    adc  a, $E2
    db   $E2

label_B8A6E::
    ld  [$FF00+C], a
    db   $E2
    ld  [$FF00+C], a
    db   $E2
    ld  [$FF00+C], a
    db   $70
    ld   [hl], b
    rst  $28
    inc  sp
    rst  $28
    adc  a, b
    ld   [hl], a
    ld   h, a
    jr   label_B8A95
    rlca
    rlca
    nop
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, $F70F
    rra
    rst  $28
    rra
    rst  $28
    rra
    rst  $28
    ld   e, $EF
    rra

label_B8A95::
    rst  $28
    ccf
    rst  $18
    ld   a, a
    cp   a
    add  a, b
    ld   a, a
    ld   bc, $FEFE
    nop
    ld    hl, sp+$F0
    ld    hl, sp+$F0
    ei
    ld   a, [$FFEF]
    ld   a, [$FF00+C]
    or   $CF
    or   $DD
    xor  $9D
    xor  $39
    sbc  a, $7A
    cp   h
    ld   a, [$FF00+C]
    db   $E4 ; Undefined instruction
    ld    hl, sp+$08
    ld   a, [$FF30]
    ret  nz
    ret  nz
    nop
    nop
    nop
    rst  $38
    ld   a, a
    rst  $38
    rra
    rst  $38
    add  a, b
    pop  af
    adc  a, $E2
    db   $E2
    ld  [$FF00+C], a
    db   $F0
    ld   a, [$FFEF]
    di
    rst  $28
    ld    hl, sp+$F7
    rst  $38
    ld    hl, sp+$7F
    rst  $38
    ccf
    rst  $38
    add  a, a
    ld   a, a
    ld   h, b
    rra
    jr   label_B8AE5
    rlca
    nop
    rst  $38
    cp   $FF
    ld    hl, sp+$FF

label_B8AE5::
    ld   bc, $E71F
    rrca
    rst  $30
    rrca
    rst  $30
    rra
    rst  $28
    rra
    rst  $28
    ccf
    rst  $18
    cp   $3F
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    ld   bc, $FEFE
    nop
    rrca
    nop
    db   $10
    db   $0F
    inc  e
    inc  bc
    ld   a, $1D
    ld   a, a
    ld   a, $7F
    ld   [hl], $7F
    ld   [hl], $7F
    inc  e
    sbc  a, h
    ld   h, b
    sbc  a, b
    ld   [hl], b
    cp   b
    ld   [hl], b
    cp   b
    ld   [hl], b
    cp   b
    ld   [hl], b
    ld   a, h
    jr   c, label_B8B5B
    inc  e
    ld   e, $00
    ld   a, $00
    ld   a, a
    ld   a, $E3
    ld   a, [hl]
    db   $62
    ld   h, d
    db   $E3 ; Undefined instruction
    ld   b, b
    pop  bc
    nop
    ld   bc, $0100
    nop
    pop  bc
    nop
    db   $E3 ; Undefined instruction
    ld   b, b
    rst  $38
    ld   h, e
    cp   a
    ld   a, a
    ld   e, [hl]
    ccf
    ld   hl, label_1E1E
    nop
    nop
    nop
    ld   [hl], b
    nop
    ld    hl, sp+$70
    db   $FC ; Undefined instruction
    sbc  a, b
    ld   a, [label_BB1F4]
    adc  a, [hl]
    ld   sp, hl
    db   $76 ; Halt
    db   $FD ; Undefined instruction
    ld   a, [$9AFD]
    push af
    ld   a, [$F669]
    pop  af
    ld   c, $43
    cp   h
    add  a, [hl]
    ld   a, b
    db   $FC ; Undefined instruction

label_B8B5B::
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_F00
    ld   bc, label_B37
    ld   b, a
    db   $3A ; ldd  a, [hl]
    ld   e, a
    db   $3A ; ldd  a, [hl]
    cp   a
    ld   a, c
    cp   c
    ld   [hl], b
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   a, [$FF60]
    ld   [rLCDC], a
    ld   h, b
    nop
    inc  bc
    nop
    rrca
    inc  bc
    rrca
    rlca
    rlca
    nop
    ld    hl, sp+$00
    db   $E4 ; Undefined instruction
    ret  c
    ld   a, [$FF00+C]
    pop  af
    ld   l, [hl]
    db   $FD ; Undefined instruction
    ld  [$FF00+C], a
    rst  $38
    call c, label_3EFF
    ld   a, a
    ld   [hl], $7F
    ld   h, $7E
    inc  e
    ld   a, $00
    ld   [hl], d
    inc  a
    db   $F4 ; Undefined instruction
    ld   a, b
    db   $E4 ; Undefined instruction
    ld    hl, sp+$98
    ld   [$FFE0], a
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
    and  l
    ld   a, [hl]
    and  l
    ld   a, [hl]
    sbc  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    ld   b, d
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
    nop
    nop
    rrca
    nop
    inc  de
    inc  c
    dec  l
    ld   e, $3F
    ld   a, [de]
    ccf
    ld   a, [de]
    dec  l
    ld   e, $33
    inc  c
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
    rrca
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
    rra
    nop
    rrca
    nop
    nop
    nop
    nop

label_B8BFD::
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
    rrca

label_B8C09::
    ld   b, $1F
    ld   a, [bc]
    rra
    ld   [$011F], sp
    rlca
    ld   bc, $001F
    ccf
    inc  e
    ld   a, a
    jr   nz, label_B8C09
    ld   b, b
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
    inc  a
    nop
    ld   a, [hl]
    inc  a
    rst  $38
    ld   [bc], a
    ld   h, e
    add  a, b
    ld   [rJOYP], a

label_B8C32::
    ld   a, [$FF60]
    ld    hl, sp+$50
    ld    hl, sp+$10
    jr   c, label_B8C4A
    jr   label_B8C3C

label_B8C3C::
    nop
    nop
    nop
    nop
    ld   b, $00
    rrca
    inc  b
    inc  e
    inc  bc
    jr   nc, label_B8C57
    ld   h, a
    jr   label_B8C32
    ld   e, d
    rst  0
    jr   c, label_B8C8F
    ccf
    ld   c, c
    ld   [hl], $EF
    db   $10
    db   $E6
    ld   e, c
    ld   [hl], b

label_B8C57::
    rrca
    inc  e
    inc  bc
    rra
    ld   [$000C], sp
    nop
    nop
    nop
    nop
    ld   b, $00
    rrca
    inc  b
    ld   c, $01
    jr   c, label_B8C71
    ld   [hl], d
    dec  l
    ld   [hl], a
    ld   a, [bc]
    ldi  [hl], a
    dec  e
    ldi  [hl], a

label_B8C71::
    dec  e
    ld   [hl], a
    ld   a, [bc]
    ld   [hl], d
    dec  l
    jr   c, label_B8C7F
    ld   c, $01
    rrca
    inc  b
    ld   b, $00
    nop

label_B8C7F::
    nop
    inc  e
    nop
    inc  de
    inc  c
    jr   label_B8C8D
    inc  e
    dec  bc
    ld   a, $1D
    ccf
    jr   label_B8CCB

label_B8C8D::
    add  hl, de
    cpl

label_B8C8F::
    ld   e, $37
    dec  c
    ld   e, a
    ld   hl, label_2D56
    ld   d, a
    ld   l, $4B
    scf
    inc  a
    inc  bc
    scf
    inc  e
    ccf
    nop
    inc  e
    nop
    inc  de
    inc  c
    jr   label_B8CAD
    inc  d
    dec  bc
    ldi  [hl], a
    dec  e
    ld   hl, label_3E1E

label_B8CAD::
    ld   bc, label_1E21
    inc  sp
    dec  c
    ld   e, a
    ld   hl, label_2D56
    ld   d, a
    ld   l, $4B
    scf
    inc  a
    inc  bc
    scf
    inc  e
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    ld   [label_807], sp

label_B8CCB::
    rlca
    rlca
    nop
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
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    inc  de
    inc  c
    jr   label_B8CED
    sbc  a, h
    dec  bc
    ld   a, [hl]
    sbc  a, l
    ccf
    ret  c
    cp   [hl]

label_B8CED::
    reti
    rst  $28
    sbc  a, $F7
    ld   l, l
    ld   e, a
    ld   sp, label_1D3E
    cpl
    ld   e, $17
    rrca
    inc  e
    inc  bc
    scf
    inc  e
    ccf
    nop
    inc  bc
    nop
    dec  c
    ld   [bc], a
    rra
    add  hl, bc
    rra
    inc  c
    scf
    dec  c
    dec  l
    rla
    dec  h
    dec  de
    ccf
    nop
    ld   b, a
    rlca
    and  a
    daa
    and  a
    daa
    and  a
    daa
    and  a
    daa
    and  a
    daa
    and  e
    inc  hl
    or   c
    ld   sp, $00F0
    db   $FC ; Undefined instruction
    db   $F4 ; Undefined instruction
    rst  $38
    nop

label_B8D26::
    rst  $38
    pop  hl
    rst  $38
    jr   nc, label_B8D2A
    db   $E8 ; add  sp, d
    or   $BA
    db   $FC ; Undefined instruction
    nop
    ld   a, [$EDF8]
    db   $EC ; Undefined instruction
    push af
    db   $F4 ; Undefined instruction
    push af
    db   $F4 ; Undefined instruction
    push af
    db   $F4 ; Undefined instruction
    push af
    db   $F4 ; Undefined instruction
    push af
    db   $F4 ; Undefined instruction
    call label_CC
    nop
    rlca
    nop
    dec  bc
    rlca
    dec  de
    inc  b

label_B8D48::
    ccf
    inc  de
    ccf
    inc  d
    ccf
    db   $10
    db   $27
    jr   label_B8D90
    dec  c
    scf
    dec  c
    ld   l, e
    rla
    rst  $28
    ld   e, b
    rst  $18
    ld   l, h
    db   $ED ; Undefined instruction
    ld   [hl], e
    ld   a, a
    ccf
    ccf
    ld   b, b
    nop
    nop
    ret  nz
    nop
    jr   nz, label_B8D26
    jr   label_B8D48
    call c, label_FCE8
    jr   z, label_B8D69
    ld   [label_18E4], sp
    ld    hl, sp+$B0
    db   $EC ; Undefined instruction
    or   b
    sub  a, $E8
    rst  $30
    ld   a, [de]
    ei
    ld   [hl], $B7
    adc  a, $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [bc], a
    nop
    nop
    rlca
    nop
    ld   [label_1307], sp
    rrca
    inc  h
    dec  de
    ld   c, a
    inc  [hl]
    ld   c, l
    ld   [hl], $2F
    ld   d, $1F
    ld   b, $2B
    ld   d, $6D
    ld   [de], a
    rst  $28
    ld   e, h
    rst  $18
    ld   l, h
    db   $ED ; Undefined instruction
    ld   [hl], e
    ld   a, a
    ccf
    ccf
    ld   b, b
    nop
    nop
    ret  nz
    nop
    or   b
    ret  nz
    ld   a, b
    or   b
    xor  $70
    call c, label_BB0E0
    add  a, b
    db   $FC ; Undefined instruction
    ld   d, b
    db   $FC ; Undefined instruction
    ret  c
    db   $E8 ; add  sp, d
    ld   a, [$FF16]
    db   $E8 ; add  sp, d
    rst  $30
    ld   a, [de]
    ei
    ld   [hl], $B7
    adc  a, $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [bc], a
    nop
    nop
    ret  nz
    nop
    or   b
    ret  nz
    ld   a, b
    or   b
    xor  $70
    call c, label_BB0E0
    add  a, b
    db   $FC ; Undefined instruction
    ld   [hl], b
    db   $FC ; Undefined instruction
    ret  c
    db   $E8 ; add  sp, d
    ld   a, [$FF16]
    db   $E8 ; add  sp, d
    rst  $30
    ld   a, [de]
    ei
    ld   [hl], $B7
    adc  a, $FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
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
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
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
    jr   z, label_B8E68
    scf
    jr   c, label_B8E27
    ccf
    db   $10
    db   $3F
    ld   [label_277F], sp
    ld   [hl], a
    jr   z, label_B8E4C
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

label_B8E27::
    ld   [$FFFE], a
    or   h
    cp   $B4
    db   $3A ; ldd  a, [hl]

label_B8E2D::
    db   $FC ; Undefined instruction
    inc  a
    ret  z
    db   $FC ; Undefined instruction
    jr   label_B8E2D
    inc  [hl]
    ld   a, [$FF00+C]
    ld   a, [$FC34]
    or   b
    ld   a, b
    add  a, b
    cp   h
    ld   a, b
    ld    hl, sp+$00
    dec  hl
    dec  hl
    ld   a, a
    ld   d, h
    ld   a, a
    ld   b, b
    ld   a, a
    ld   b, b
    ccf
    cpl
    ld   a, a
    ld   e, a

label_B8E4C::
    ld   a, a
    ld   b, h
    ld   e, e
    ccf
    ld   b, e
    inc  a
    ld   a, a
    nop
    scf
    rrca
    ld   l, a
    ccf
    rst  $18
    ld   a, a
    rst  0
    ld   a, a
    rst  8
    ld   a, a
    rst  $18
    ld   a, a
    ret  nz
    ret  nz
    ld   a, [$FF30]
    ld    hl, sp+$08
    db   $FC ; Undefined instruction
    inc  b

label_B8E68::
    cp   $02
    cp   $DA
    cp   $DA
    or   $FA
    db   $FC ; Undefined instruction
    ld   [hl], h
    db   $FC ; Undefined instruction
    inc  b
    call c, label_E4E4
    ld    hl, sp+$F2
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
    and  $FC
    adc  a, [hl]
    db   $FC ; Undefined instruction
    dec  hl
    nop
    ccf
    nop
    ccf
    nop
    rra
    rrca
    ccf
    dec  d
    ccf
    dec  b
    ld   e, e
    ccf
    ld   b, e
    inc  a
    ld   a, a
    nop
    ccf
    ld   bc, label_F17
    rrca
    nop
    ld   de, label_1F0E

label_B8E9B::
    nop
    dec  bc
    rlca
    rra
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ret  c
    db   $FC ; Undefined instruction
    ret  c
    db   $F4 ; Undefined instruction
    ld    hl, sp+$F8
    ld   [hl], b
    ld    hl, sp+$F0
    ld    hl, sp+$E0
    db   $E4 ; Undefined instruction
    jr   label_B8E9B
    ret  c
    db   $E4 ; Undefined instruction
    ret  c
    ld    hl, sp+$00
    ret  nc
    ld   [$FFF8], a
    nop
    ld   a, a
    nop
    ld   a, a
    ccf
    ld   a, a
    ldi  [hl], a
    ld   a, a
    ccf
    ld   a, a
    add  hl, hl
    ld   a, a
    ccf
    ld   a, a
    ldi  [hl], a
    ld   a, a
    ccf
    ld   a, a
    dec  h
    ld   a, a
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
    rlca
    nop
    jr   c, label_B8F0B
    ld   d, b
    cpl
    ld   b, c
    ld   a, $51
    ld   l, $3F

label_B8F0B::
    db   $10
    db   $3F
    dec  d
    ld   e, a
    dec  l
    sbc  a, a
    ld   h, a
    sbc  a, a
    ld   h, e
    or   a
    ld   c, b
    ld   a, h
    rla
    dec  sp
    rla
    jr   nc, label_B8F2B
    rra
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

label_B8F2B::
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
    jr   nz, label_B8F6B
    jr   nc, label_B8F5D
    jr   nz, label_B8F6F
    db   $10
    db   $0F
    jr   nz, label_B8F73
    jr   nz, label_B8F75
    jr   nc, label_B8F67
    inc  e
    inc  bc
    inc  hl
    inc  e
    jr   nz, label_B8F7D
    ccf
    nop
    ret  nz
    nop
    jr   nz, label_B8F24
    sbc  a, h
    ld   [rSC], a

label_B8F67::
    db   $FC ; Undefined instruction
    ld   [bc], a
    db   $FC ; Undefined instruction
    inc  b

label_B8F6B::
    ld    hl, sp+$0C
    ld   a, [$FF04]

label_B8F6F::
    ld    hl, sp+$08
    ld   a, [$FF08]

label_B8F73::
    ld   a, [$FF1C]

label_B8F75::
    ld   [rNR32], a
    db   $E8 ; add  sp, d
    ld   [hl], h
    adc  a, b
    adc  a, b
    ld   [hl], b
    inc  b

label_B8F7D::
    ld    hl, sp+$FC
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
    rrca
    nop
    db   $76 ; Halt
    rrca
    and  b
    ld   a, a
    cp   b
    ld   b, a
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
    rrca
    inc  bc
    inc  de
    inc  c
    rra
    nop
    nop
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
    call nc, label_A268
    call c, label_BE41
    pop  hl
    ld   e, $9E
    ld   h, b
    adc  a, b
    ld   [hl], b
    inc  b
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
    stop
    ldd  [hl], a
    nop
    db   $3A ; ldd  a, [hl]
    nop
    ld   a, a
    nop
    ld   a, a
    ld   b, $FF
    ld   [bc], a
    rst  $20
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
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   b, $00
    rlca
    nop
    rrca
    ld   [bc], a
    rrca
    ld   [bc], a
    rrca
    nop
    dec  c
    nop
    inc  c
    nop
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ld   c, $01
    dec  e
    inc  bc
    ld   a, $01
    ccf
    nop
    ld   a, e
    rlca
    rst  $38
    ld   c, a
    rst  $10
    ld   a, b
    xor  a
    db   $76 ; Halt
    rst  $18
    ld   a, [hli]
    ld   a, a
    ld   a, [bc]
    ld   a, a
    ld   l, $6E
    ld   sp, label_366F
    ld   a, a
    ld   b, $1F
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ld   c, $01
    dec  e
    inc  bc
    ld   a, $01
    ccf
    nop
    ld   a, e
    rlca
    rst  $38
    ld   c, a
    rst  $10
    ld   a, b
    xor  a
    ld   [hl], d
    ld   a, a
    ld   c, $EE
    ld   [hl], c
    rst  $18
    ld   h, [hl]
    db   $FD ; Undefined instruction
    ld   c, $3F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   c, $00
    ld   e, $04
    dec  e
    ld   c, $1A
    rlca
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
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    rlca
    rrca
    inc  b
    ld   a, a
    dec  b
    ld   a, e
    scf
    ld   a, a
    ld   sp, label_1D3F
    ld   e, a
    inc  l
    ld   a, h
    inc  bc
    ld   a, e
    inc  [hl]
    ld   a, h
    inc  sp
    ccf
    nop
    rrca
    ld   b, $1F
    ld   c, $1F
    nop
    ld   a, [$FF00]
    ld    hl, sp+$F0
    ld   a, h
    ld    hl, sp+$3C
    ret  z
    rst  $38
    db   $E8 ; add  sp, d
    rst  $30
    db   $3A ; ldd  a, [hl]
    rst  $38
    and  $FE
    inc  l
    db   $FD ; Undefined instruction
    ld   a, [bc]
    call label_3732

label_B90D5::
    ret  z
    rst  8
    ld   [hl], $FF
    ld   b, $CE
    jr   nc, label_B90D5
    nop
    nop
    nop
    rst  $20
    nop
    rst  $38
    ld   h, a
    cp   $6F
    ld   a, [hl]
    add  hl, hl
    rst  $38
    dec  bc
    rst  $38
    ld   h, [hl]
    rst  $38

label_B90ED::
    ld   l, e
    rst  $38
    ld   [bc], a
    daa
    jr   label_B9172
    jr   nz, label_B90ED
    ld   [hl], b
    ld   a, b
    jr   nc, label_B9169
    jr   nz, label_B911B
    nop
    nop
    nop
    nop
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
    jr   label_B9119
    db   $FC ; Undefined instruction
    inc  bc
    rst  $28
    ld   [hl], b
    ld   [hl], a
    jr   c, label_B9154

label_B9119::
    inc  e
    ld   e, $0C
    ld   c, $04
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
    rlca
    nop
    ld   [label_1107], sp
    rrca
    inc  hl
    rra
    ld   hl, label_201F
    rra
    ldi  [hl], a
    dec  e
    ldi  [hl], a
    dec  e
    jr   nc, label_B914B
    jr   label_B9145
    rrca
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc

label_B9145::
    rlca
    add  hl, bc
    rlca
    ld   [label_A07], sp

label_B914B::
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b

label_B9154::
    ld   [label_807], sp
    rlca
    jr   label_B9161
    jr   label_B9163
    inc  e
    inc  bc
    rrca
    nop
    nop

label_B9161::
    nop
    nop

label_B9163::
    nop
    nop
    nop
    nop
    nop
    nop

label_B9169::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_B9172::
    jr   c, label_B9174

label_B9174::
    ld   [hl], h
    jr   c, label_B9119
    ld   a, h
    jp   z, label_CA34
    inc  [hl]
    add  a, d
    ld   a, h
    ld   a, h
    nop
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
    jr   label_B91B6
    jr   label_B9208
    jr   z, label_B9206
    inc  l
    ld   e, h
    inc  sp
    cpl
    inc  e
    ld   a, e
    rlca
    ld   [hl], a
    jr   label_B91DC
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

label_B91B6::
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
    jr   label_B9244
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

label_B91DC::
    ccf
    jr   label_B91EE
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
    jr   label_B91EE
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
    jr   nc, label_B9202

label_B9202::
    ccf
    db   $10
    db   $3B
    rla

label_B9206::
    dec  d
    dec  bc

label_B9208::
    rla
    ld   [label_A77], sp
    di
    ld   l, h
    pop  de
    ld   l, [hl]
    sub  a, c
    ld   l, [hl]
    ld   sp, hl
    ld   b, $9F
    ld   h, b
    rst  $38
    inc  bc
    db   $EC ; Undefined instruction
    ld   [hl], e
    rst  $38
    ld   [hl], b
    rst  $38
    ld   [hl], b
    ld   a, a
    nop
    ld   c, $00
    cp   $0C
    cp   h
    ret  c
    ld   a, b
    sub  a, b
    sbc  a, $20
    rst  8
    or   [hl]
    adc  a, e
    db   $76 ; Halt
    add  hl, bc
    or   $0F
    ld   a, [$FF39]
    add  a, $F9
    ld   b, $9F
    ld   [$FF37], a
    adc  a, $FF
    ld   c, $FF
    ld   l, [hl]
    cp   $00
    inc  bc
    nop
    rlca
    inc  bc

label_B9244::
    add  hl, bc
    rlca
    inc  e
    inc  bc
    inc  a
    dec  bc
    inc  a
    dec  de
    ld   a, h
    dec  de
    db   $FD ; Undefined instruction
    ld   d, d
    cp   [hl]
    ld   b, c
    cp   e
    ld   e, [hl]
    ld   a, e
    rra
    dec  sp
    rra
    add  hl, sp
    rra
    ld   l, h
    rra
    ld   [hl], a
    rrca
    ccf
    nop
    ret  nz
    nop
    and  b
    ret  nz
    ret  c
    ld   [$FFDC], a
    db   $E8 ; add  sp, d
    ld   e, $EC
    ld   e, $EC

label_B926C::
    ld   e, $E4
    rst  $18
    jr   nz, label_B92B0
    jp   z, label_3AED
    db   $FD ; Undefined instruction
    ld   a, [$F8FE]
    cp   $F8
    ld   a, [hl]
    ld    hl, sp+$FE
    ld   a, [$FFFC]
    nop
    nop
    nop
    rra
    nop
    ccf
    ld   e, $6D
    ldd  [hl], a
    ld   e, l
    ldi  [hl], a
    ld   a, b
    rla
    ld   [hl], b
    rrca
    ld   b, a
    jr   c, label_B92E0
    scf
    call z, label_BC37
    ld   b, e
    ei
    inc  [hl]
    ld   a, b
    scf
    ld   a, a
    nop
    rst  $38
    rra
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$B8
    ret  nz
    ld   a, [$FFE0]
    ld   [rJOYP], a
    jr   nz, label_B926C
    ld   [hl], b
    and  b

label_B92AE::
    ld   a, [$FF60]

label_B92B0::
    ld   a, [$FF60]
    ld   a, b
    or   b
    ld   a, b

label_B92B5::
    or   b
    db   $FC ; Undefined instruction

label_B92B7::
    jr   label_B92B5
    jr   label_B92B7
    ld   [$80FC], sp
    ld   a, [$FF00]
    nop
    nop
    nop
    nop
    rra
    nop
    ccf
    ld   e, $6D
    ldd  [hl], a
    ld   e, l
    ldi  [hl], a
    ld   a, b
    rla
    ld   [hl], b
    rrca
    ld   b, a
    jr   c, label_B9322
    scf
    db   $FC ; Undefined instruction
    rlca
    db   $FC ; Undefined instruction
    inc  sp
    ei
    inc  [hl]
    ld   a, b
    rlca
    rst  $38
    ld   [hl], b
    rst  $38
    nop

label_B92E0::
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ld    hl, sp+$B8
    ret  nz
    ld   a, [$FFE0]
    ld   [rJOYP], a
    jr   nz, label_B92AE
    ld   [hl], b
    and  b
    ld   a, [$FF60]
    rst  $38
    ld   [hl], b
    ld   a, a

label_B92F5::
    cp   [hl]
    ld   a, a
    sbc  a, [hl]
    rst  $38
    ld   c, $FF
    jr   nz, label_B92F5
    ld   [$FFF0], a
    nop
    ld   [hl], b
    nop
    ld    hl, sp+$70
    db   $FC ; Undefined instruction
    ld   e, b
    sbc  a, $6C
    adc  a, $74
    rst  8
    db   $76 ; Halt
    ld   h, a
    dec  sp
    ld   h, a
    dec  sp
    scf
    rra
    rra
    dec  c
    rst  $38
    dec  c
    cpl
    dec  d
    rst  $38
    rrca
    daa
    rra
    ld   b, e
    inc  a
    ld   a, h
    nop
    nop
    nop

label_B9322::
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
    inc  a
    rst  $38
    ld   a, [hl]
    ld   a, a
    inc  bc
    inc  hl
    dec  e
    rla
    rrca
    rra
    rrca
    ld   a, a
    dec  bc
    xor  a
    dec  e
    ld   b, a
    ccf
    ld   a, a
    nop
    rrca
    nop
    ld   [hl], e
    rrca
    rst  $30
    ld   l, a
    sbc  a, a
    ld   h, h
    rst  $38
    ld   h, b
    sbc  a, a
    ld   l, a
    di
    ld   l, a
    sub  a, [hl]
    ld   l, a
    cp   e
    ld   [hl], a
    ld   d, a
    jr   c, label_B9375
    rra
    ld   a, a
    ccf
    ld   b, e
    inc  a
    rst  $38
    ld   a, b
    rst  $38
    nop
    ld   a, a
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   [$FFE8], a
    ld   a, [$FFEC]
    or   b
    xor  $34
    rrca
    or   $EB
    or   $7D
    adc  a, [hl]
    db   $ED ; Undefined instruction
    ld   a, [hl]
    ld   [label_BBE7C], a

label_B9375::
    add  a, b
    add  a, d
    db   $FC ; Undefined instruction
    cp   [hl]
    ld   a, h
    jp   label_FF3C
    ld   a, $FF
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    nop
    rrca
    nop
    ccf
    rrca
    ld   e, e
    inc  a
    cp   a
    ld   a, b
    cp   e
    ld   a, h
    sbc  a, a
    ld   a, a
    adc  a, e
    ld   [hl], a
    ret  z
    scf
    db   $FC ; Undefined instruction
    ld   b, e
    rst  $30
    ld   a, b
    cp   a
    ld   a, a
    adc  a, e
    ld   [hl], a
    ret  z
    scf
    ld   a, h
    inc  bc
    rra
    nop
    rlca
    nop
    rra
    rlca
    dec  l
    ld   e, $3D
    ld   e, $5F
    ccf
    ld   c, a
    ccf
    ld   b, l
    dec  sp
    ld   b, h
    dec  sp
    ld   h, h
    dec  de
    ld   a, [hl]
    ld   hl, label_3C7B
    ld   e, a
    ccf
    ld   b, l
    dec  sp
    ld   h, h
    dec  de
    ld   a, $01
    rrca
    nop
    ccf
    nop
    ld   a, a
    ccf
    ld   a, a
    rra
    ld   a, $0F
    rra
    rlca
    ccf
    dec  bc
    ccf
    add  hl, bc
    ccf
    dec  c
    cpl
    inc  de
    cpl
    rla
    ld   l, b
    rla
    ret  c
    ld   h, a
    ld    hl, sp+$77
    rst  $38
    nop
    nop
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $FC
    cp   $FC
    ld   c, [hl]
    db   $FC ; Undefined instruction
    inc  e
    ld    hl, sp+$9C
    ld    hl, sp+$FC
    ld   a, [$FFFC]
    ld   a, [$FFFC]
    ld    hl, sp+$FE
    ld    hl, sp+$F7
    ld   a, [$FA77]
    ccf
    ld   a, [$FFF8]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_700
    ld   bc, label_71F
    ccf
    rra
    ld   a, a
    jr   nz, label_B944C
    ld   b, b
    ld    hl, sp+$47
    ld   a, [$FF0F]
    inc  hl
    dec  e
    ld   h, e
    dec  e
    and  c
    ld   e, [hl]
    ld   [$FF5F], a
    ld   a, [$FF6F]
    db   $FC ; Undefined instruction
    inc  bc
    rrca
    nop
    nop
    nop
    ret  nz
    nop
    ld   [$FFC0], a
    ld   a, [$FFE0]
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    ld   [label_4FE], sp
    ld   e, $E4
    ld   c, $F0
    add  a, h
    ld   a, b
    add  a, h
    ld   a, b
    ld   b, $F8
    dec  c
    ld   a, [$FF00+C]
    and  $7F
    adc  a, [hl]
    rst  $38
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_600
    ld   bc, label_718
    ld   a, a
    rra
    rst  $38
    ld   a, a
    ld   b, c
    ccf
    jr   nz, label_B94B1
    db   $10
    db   $0F
    db   $10
    db   $0F
    db   $10
    db   $0F
    ld   sp, label_BBF0E
    ld   bc, $003F
    nop
    nop
    rra
    nop
    ld   a, a
    ld   e, $FF
    ld   a, [hl]
    ld   a, $FC
    inc  a
    ld   [$FFFA], a
    call nc, label_96F9
    ld   sp, hl
    or   [hl]
    pop  af

label_B94B1::
    adc  a, [hl]
    ld   b, c
    cp   [hl]
    ld   b, d
    cp   h
    db   $FC ; Undefined instruction
    nop
    cp   $F8
    rst  0
    ld    hl, sp+$FE
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
    inc  c
    inc  bc
    ccf
    rrca
    ld   a, a
    ccf
    inc  hl
    rra
    ld   de, label_80F
    rlca
    ld   [label_F07], sp
    nop
    ccf
    rlca
    ld   a, [hl]
    rrca
    ccf
    nop
    nop
    nop
    rrca
    nop
    ccf
    ld   c, $FF
    inc  a
    ld   a, [hl]
    ld   a, [$FF7C]
    ret  nz
    ld   a, [$FF00+C]
    pop  af
    ld   l, $F1
    ld   l, [hl]
    pop  hl
    ld   e, $81
    ld   a, [hl]
    add  a, d
    ld   a, h
    add  a, $38
    ld   a, [label_23C4]
    call c, label_FE
    nop
    nop
    ld   bc, label_300
    ld   bc, label_305
    rra
    nop
    jr   nz, label_B9529
    ld   b, b
    ccf
    rst  $20
    jr   label_B950E
    ld   h, d
    rst  $38
    ld   [hl], d
    cp   a
    ld   [hl], b
    ld   e, a
    jr   c, label_B9556
    rra
    inc  a
    rra
    ld   a, [hl]
    ccf
    rst  $38
    ld   a, a
    rst  $38
    nop
    ld   bc, label_300
    ld   bc, label_305
    dec  e
    inc  bc
    dec  h

label_B9529::
    dec  de
    ld   b, l
    dec  sp
    ld   b, l
    dec  sp
    jp   label_E03C
    ld   e, a
    ld   a, [$FF6F]
    ld   a, a
    jr   nc, label_B956F
    rra
    ccf
    rra
    ld   a, a
    ccf
    rst  $38
    ld   a, a
    rst  $38
    nop
    rrca
    nop
    db   $10
    db   $0F
    jr   nz, label_B9565
    jr   nz, label_B9567
    scf
    ld   [label_307F], sp
    ld   a, a
    dec  [hl]
    ld   e, a
    dec  [hl]
    ccf
    db   $10
    db   $3F
    jr   label_B9584
    rra

label_B9556::
    jr   label_B9567
    dec  e
    rrca
    rra
    rrca
    ccf
    rra
    ccf
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    ld   a, [hl]

label_B9565::
    cp   h
    ldi  [hl], a

label_B9567::
    call c, label_E01E
    sbc  a, a
    ld   l, [hl]
    rst  $38
    ld   e, $FD

label_B956F::
    ld   a, $FA
    ld   a, h
    db   $F4 ; Undefined instruction
    ld    hl, sp+$F4
    ld    hl, sp+$F4
    ld    hl, sp+$F4
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    rst  $38
    cp   $FF
    nop
    nop
    nop
    nop
    nop

label_B9584::
    inc  bc
    nop
    rlca
    inc  bc
    ld   c, $07
    rra
    rrca
    inc  e
    rrca
    ccf
    rra
    ccf
    rra
    inc  e
    rrca
    rra
    rrca
    ld   c, $07
    rlca
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
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FFE0]
    ld   h, b
    add  a, b
    ld    hl, sp+$C0
    ret  nz
    nop
    ld    hl, sp+$C0
    ld    hl, sp+$C0
    ret  nz
    nop
    ld    hl, sp+$C0
    ld   h, b
    add  a, b
    ld   a, [$FFE0]
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
    jr   nz, label_B95C6

label_B95C6::
    dec  h
    nop
    dec  [hl]
    nop
    dec  a
    db   $10
    db   $3F
    dec  d
    scf
    dec  e
    dec  [hl]
    rra
    dec  a
    rra
    rra
    rrca
    rrca
    rlca
    rlca
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
    ld   bc, label_300
    ld   bc, label_305
    dec  e
    inc  bc
    dec  h
    dec  de
    ld   b, l
    dec  sp
    ld   b, e
    inc  a
    ld   b, b
    ccf
    jr   nz, label_B961D
    rra
    nop
    inc  bc
    nop
    dec  b
    inc  bc
    ld   l, c
    rlca
    sbc  a, b
    ld   h, a
    adc  a, b
    ld   [hl], a
    ld  [$FF00+C], a
    dec  e
    ld   a, [$FF00+C]
    ld   a, [label_BB875]
    scf
    add  hl, sp
    ld   d, $11
    ld   c, $11
    ld   c, $1C
    inc  bc

label_B961A::
    rra
    inc  c
    ccf

label_B961D::
    ld   e, $3F
    nop
    ret  nz
    nop
    and  b
    ret  nz
    sub  a, b
    ld   [rNR10], a
    ld   [rNR10], a
    ld   [$FF4C], a
    or   b
    ld   b, d
    cp   h
    ld   b, c
    cp   [hl]
    dec  e
    ld  [$FF00+C], a
    sbc  a, a
    ld   l, h
    adc  a, a
    db   $76 ; Halt
    adc  a, [hl]
    ld   [hl], b
    jr   label_B961A
    ld    hl, sp+$00
    ld   a, [$FF00]
    nop
    nop
    inc  bc
    nop
    dec  b
    inc  bc
    ld   l, c
    rlca
    sbc  a, b
    ld   h, a
    adc  a, b
    ld   [hl], a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    ld   c, b
    scf
    jr   nc, label_B9663
    db   $10
    db   $0F
    db   $10
    db   $0F
    inc  e
    inc  bc
    rra
    inc  c
    ccf
    ld   e, $3F
    nop
    ret  nz
    nop
    and  b

label_B9663::
    ret  nz
    sub  a, b
    ld   [rNR10], a
    ld   [rNR10], a
    ld   [$FF0C], a
    ld   a, [$FF02]
    db   $FC ; Undefined instruction
    ld   bc, label_1FE
    cp   $11
    xor  $09
    or   $0E
    ld   a, [$FF18]
    ld   [$FFF8], a
    nop
    ld   a, [$FF00]
    nop
    nop
    inc  bc
    nop
    dec  b
    inc  bc
    add  hl, bc
    rlca
    ld   [label_807], sp
    rlca
    ld   a, [bc]
    dec  b
    ld   [de], a
    dec  c
    ldi  [hl], a
    dec  e
    jr   z, label_B96A9
    inc  l
    inc  de
    inc  l
    inc  de
    inc  l
    inc  de
    db   $10
    db   $0F
    rrca
    nop
    rrca
    rlca
    rra
    nop
    ret  nz
    nop
    and  b
    ret  nz
    sub  a, b
    ld   [$FF08], a
    ld   a, [$FF08]

label_B96A9::
    ld   a, [$FF38]
    ret  nz
    inc  c
    ld   a, [$FF02]
    db   $FC ; Undefined instruction
    ld   b, c
    cp   [hl]
    ld   hl, label_1FDE
    ld   [$FF08], a
    ld   a, [$FF10]
    ld   [$FFE0], a
    nop
    ld   [$FFC0], a
    ld   [rJOYP], a
    nop
    nop
    inc  bc
    nop
    dec  b
    inc  bc
    add  hl, bc
    rlca
    ld   [label_807], sp
    rlca
    ld   a, [bc]
    dec  b
    ld   [de], a
    dec  c
    ldi  [hl], a
    dec  e
    jr   z, label_B96EB
    inc  l
    inc  de
    inc  l
    inc  de
    inc  l
    inc  de
    jr   c, label_B96E3
    ld   a, a
    jr   c, label_B975E
    nop
    nop
    nop
    ret  nz

label_B96E3::
    nop
    and  b
    ret  nz
    sbc  a, [hl]
    ld   [rNR11], a
    xor  $27

label_B96EB::
    ret  c
    ld   c, a
    or   [hl]
    rra
    xor  $3E
    call c, label_B87C
    inc  a
    ret  nz
    inc  b
    ld    hl, sp+$0C
    ld   a, [$FF3E]
    call nz, label_3CFE
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    rra
    rlca
    rst  $38
    rra
    rst  $38
    ld   a, a
    rst  $38
    ld   l, a
    ld   a, a
    jr   nc, label_B970C
    db   $76 ; Halt
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   a, a
    rst  $38
    ld   l, a
    rst  $38
    ld   [hl], b
    ld   a, a
    ccf
    ld   a, b
    ccf
    ccf
    rra
    rra
    rlca
    rlca
    nop
    add  a, b
    nop
    ld   [$FF80], a
    cp   $E0
    cp   $FC
    cp   $7C
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC
    ld   a, [$FFFC]
    ld    hl, sp+$FC
    ld    hl, sp+$FC
    cp   b
    cp   $78
    rst  $38
    or   $F9
    cp   $E2
    db   $FC ; Undefined instruction
    sbc  a, h
    ld   [$FFE0], a
    nop
    rlca
    nop
    rra
    rlca
    rst  $38
    rra
    rst  $38
    ld   l, a
    rst  $38
    db   $76 ; Halt
    ld   a, a
    ld   [hl], $FF
    ld   [hl], b
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   e, a
    rst  $38
    ld   b, b
    rst  $38
    ld   c, c
    ld   a, a
    jr   nz, label_B97D8
    jr   nc, label_B979A
    rra
    rra
    rlca

label_B975E::
    rlca
    nop
    add  a, b
    nop
    ld   [$FF80], a
    cp   $E0
    cp   $7C
    cp   $FC
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC
    ld   a, [$FFFC]
    ld    hl, sp+$FF
    ret  c
    rst  $38
    ld   a, [de]
    rst  $38
    sbc  a, d
    db   $FD ; Undefined instruction
    ld   [hl], $FA
    ld   a, h
    db   $E4 ; Undefined instruction
    ld    hl, sp+$98
    ld   [$FFE0], a
    nop
    ld   b, $02
    ld   b, [hl]
    ld   [bc], a
    ld   h, b
    nop
    ld   h, e
    ld   b, b
    cpl
    jr   nz, label_B97AA
    nop
    rra
    nop
    ccf
    ld   [bc], a
    ccf
    ld   [bc], a
    ld   a, a
    ld   b, $7F
    nop
    ld   a, a
    nop
    inc  e
    inc  bc

label_B979A::
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
    nop
    nop
    inc  bc
    nop
    ld   a, a
    nop

label_B97AA::
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    ld   a, a
    ld   b, $3F
    nop
    ccf
    nop
    ccf
    inc  bc
    ccf
    rlca
    rra
    nop
    rra
    nop
    rrca
    nop
    inc  bc
    nop
    rlca
    nop
    rra
    rlca
    rst  $38
    rra
    rst  $38
    ld   a, a
    rst  $38
    db   $76 ; Halt
    ld   a, a
    ld   [hl], $FF
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   c, a
    rst  $38
    db   $76 ; Halt
    ld   a, a
    add  hl, sp

label_B97D8::
    ld   a, a
    ccf
    add  hl, sp
    rra
    rra
    rlca
    rlca
    nop
    add  a, b
    nop
    ld   [$FF80], a
    cp   $E0
    cp   $FC
    cp   $FC
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC
    ld   a, [$FFFC]
    ld    hl, sp+$FC
    ld    hl, sp+$FC

label_B97F3::
    jr   label_B97F3
    ld    hl, sp+$FF
    or   $F9
    cp   $E2
    db   $FC ; Undefined instruction
    sbc  a, h
    ld   [$FFE0], a
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc

label_B9806::
    inc  de
    inc  c
    cpl
    db   $10
    db   $2F
    db   $10
    db   $5E
    ld   hl, label_235D
    ld   e, l
    inc  hl
    ld   e, [hl]
    ld   hl, label_102F
    ccf
    ld   c, $3F
    add  hl, de
    ccf
    add  hl, de
    rra
    ld   c, $0E
    nop
    nop
    nop
    inc  bc
    nop
    inc  a
    inc  bc
    ld   a, e
    inc  [hl]
    rst  $38
    ld   a, b
    rst  $38
    ld   c, b
    cp   $49
    ld   a, l
    inc  sp
    ld   a, l
    inc  sp
    cp   $49
    rst  $38
    ld   c, b
    rst  $38
    ld   a, b
    ld   a, e
    inc  [hl]
    inc  a
    inc  bc
    inc  bc

label_B983D::
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    jr   nc, label_B9806

label_B9846::
    ret  z
    jr   nc, label_B983D
    ld   [label_8F4], sp
    ld   a, d
    add  a, h
    cp   d
    call nz, label_C4BA
    ld   a, d
    add  a, h
    db   $F4 ; Undefined instruction
    ld   [label_8F4], sp
    ret  z
    jr   nc, label_B988B
    ret  nz
    ret  nz
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    inc  de
    inc  c
    cpl
    db   $10
    db   $2F
    db   $10
    db   $7E
    ld   bc, label_337D
    db   $FD ; Undefined instruction
    ld   a, e
    cp   $49
    rst  $38
    ld   c, b
    ld   a, a
    ccf
    ccf
    add  hl, bc
    rra
    add  hl, bc
    rrca

label_B987D::
    rlca
    rlca
    nop
    nop
    nop
    ret  nz
    nop
    jr   nc, label_B9846
    ret  z
    jr   nc, label_B987D
    ld   [label_8F4], sp
    ld   a, d
    add  a, h
    cp   d
    call nz, label_C4BA
    ld   a, d
    add  a, h
    db   $F4 ; Undefined instruction
    ld   [label_8F4], sp
    ret  z
    or   b
    ld   a, [$FF80]
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
    inc  bc
    nop
    inc  b
    inc  bc
    dec  bc
    inc  b
    ld   d, $09
    ld   d, $09
    rla
    ld   [label_817], sp
    dec  bc
    inc  b
    inc  b
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
    inc  bc
    nop
    inc  b
    inc  bc
    dec  bc
    inc  b
    ld   a, [bc]
    dec  b
    dec  bc
    inc  b
    dec  bc
    inc  b
    inc  b
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
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    nop
    ld   e, $01
    ld   e, $01
    rra
    nop
    ccf
    nop
    ld   e, a
    inc  hl
    ld   e, a
    daa
    ld   e, a
    ld   h, $5B
    ld   h, $4D
    inc  sp
    ld   h, a
    jr   label_B9950
    rrca
    rra
    nop
    rlca
    nop
    dec  bc
    ld   b, $0B
    rlca
    dec  de
    inc  b
    ld   e, $01
    ld   e, $01
    rra
    nop
    ccf
    nop
    ld   e, a
    jr   nz, label_B9992
    jr   nz, label_B9994
    jr   nz, label_B9996
    jr   nz, label_B9988
    jr   nc, label_B99A2
    jr   label_B9970
    rrca
    rra
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    ccf
    nop
    ld   a, [hl]
    add  hl, sp

label_B994A::
    cp   $19
    rst  $38
    jr   label_B994A
    inc  a

label_B9950::
    or   e
    ld   a, h
    ld   b, a
    jr   c, label_B99D4
    nop
    ld   e, a
    jr   nz, label_B99A8
    jr   nc, label_B99C2
    jr   label_B9990
    rrca
    rra
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld   a, b
    add  a, b
    ld   a, b
    add  a, b
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop

label_B9970::
    ld   a, [$FA04]
    inc  b
    ld   a, [$FA04]
    inc  b
    ld   a, [$FF00+C]
    and  $18
    call z, label_F8F0
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    nop

label_B9988::
    ld   e, $01
    ld   e, $01
    rra
    nop
    ccf
    ld   c, $7F
    rra

label_B9992::
    ld   a, a
    inc  de

label_B9994::
    ld   a, a
    inc  de

label_B9996::
    ld   l, [hl]
    rra
    ld   d, b
    cpl
    ld   l, a
    db   $10
    db   $33
    rrca
    rra
    nop
    nop
    nop

label_B99A2::
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF00]

label_B99A8::
    ld   a, b
    add  a, b
    ld   a, b
    add  a, b
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    ld   a, [label_BBA04]
    add  a, h
    ld   a, d
    add  a, h
    ld   a, d
    add  a, h
    ld   a, [$FF00+C]
    and  $18
    call z, label_F8F0
    nop
    ld   c, $00

label_B99C2::
    dec  e
    ld   c, $3F
    inc  c
    ld   a, a
    jr   c, label_B9A47
    ld   sp, label_314E
    ld   c, a
    jr   nc, label_B9A0E
    nop
    ld   e, a
    jr   nz, label_B9A32
    jr   nz, label_B9A34
    jr   nz, label_B9A36
    jr   nz, label_B9A28
    jr   nc, label_B9A42
    jr   label_B9A10
    rrca
    rra
    nop
    nop
    nop
    nop
    nop

label_B99E4::
    ret  nz
    nop
    ld   a, [$FF00]
    ld   a, b
    add  a, b
    ld   a, b
    add  a, b
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FA04]
    inc  b
    ld   a, [$FA04]
    inc  b
    ld   a, [$FF00+C]
    and  $18
    call z, label_F8F0
    nop
    rlca
    nop
    dec  sp
    rlca
    ld   a, e
    scf
    ld   a, b
    scf
    ld   a, a
    jr   nc, label_B9A8A
    inc  b
    ld   c, a
    jr   nc, label_B9A57
    scf

label_B9A10::
    ld   a, b
    rlca
    ld   c, b
    scf
    scf
    ld   [label_1F20], sp
    inc  hl
    inc  e
    inc  a
    inc  bc
    rra
    nop
    rlca
    nop
    ret  nz
    nop
    jr   nz, label_B99E4
    db   $10
    db   $E0
    db   $10
    db   $E0

label_B9A28::
    call c, label_FE20
    adc  a, h
    ld   a, [$FF00+C]
    ld   d, d
    xor  h
    ld   a, $C0

label_B9A32::
    ld   a, [hl]
    cp   h

label_B9A34::
    rst  $38
    ld   h, [hl]

label_B9A36::
    rst  $38
    ld   b, d
    rst  $38
    ld   b, d
    rst  $38
    ld   h, [hl]
    cp   $3C
    db   $FC ; Undefined instruction
    nop
    ld   h, a
    nop

label_B9A42::
    ld   sp, hl
    ld   h, a
    pop  af
    ld   l, a
    ld   a, [$FF6F]
    rst  $30
    ld   [label_BA29F], sp
    sbc  a, a
    ld   h, b
    db   $F4 ; Undefined instruction
    dec  bc
    sub  a, b
    ld   l, a
    ld   a, b
    rlca
    daa
    jr   label_B9A77

label_B9A57::
    rra
    inc  hl
    inc  e
    ld   a, $01
    ccf
    ld   e, $1F
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   [$FF88], a
    ld   a, [$FF08]
    ld   a, [$FFE8]
    db   $10
    db   $FE
    ld   b, b
    rst  $38
    ld   b, $3D
    jp   nz, label_BC7F
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   b, d
    rst  $38

label_B9A77::
    ld   b, d
    rst  $38
    ld   h, [hl]
    cp   $3C
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   bc, label_301
    ld   [bc], a
    ccf
    dec  a
    ccf
    ld   hl, label_283F

label_B9A8A::
    ccf
    ld   h, $7B
    ld   b, [hl]
    rst  $38
    or   b
    rst  8
    or   b
    ld   a, a
    ld   b, [hl]
    dec  a
    ld   h, $3F
    jr   z, label_B9AD7
    ld   hl, label_3D3E
    inc  bc
    ld   [bc], a
    ld   bc, $0001
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d

label_B9AD7::
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    jr   label_B9B02

label_B9B02::
    inc  e
    ld   [label_C1E], sp
    dec  de
    inc  c
    sub  a, $09
    rst  $38
    ld   b, b
    rst  $38
    ld   h, b
    ld   a, a
    jr   nc, label_B9B70
    jr   c, label_B9B3A
    jr   label_B9B74
    jr   nz, label_B9B5E
    jr   c, label_B9B7C
    rra
    ld   a, b
    daa
    ld   a, a
    jr   c, label_B9B5E
    nop
    nop
    nop
    jr   label_B9B24

label_B9B24::
    inc  e
    ld   [label_C1E], sp
    dec  de
    inc  c
    sub  a, $09
    rst  $38
    ld   b, b
    rst  $38
    ld   h, b
    ld   a, a
    jr   nc, label_B9B92
    jr   c, label_B9B5C
    jr   label_B9B96
    jr   nz, label_B9B80
    jr   c, label_B9B1E
    ld   e, a
    ld    hl, sp+$67
    rst  $38
    nop
    nop
    nop
    rlca
    nop
    jr   label_B9B4D
    inc  hl
    inc  e
    ld   b, l
    dec  sp
    ld   c, [hl]
    scf
    ld   c, [hl]

label_B9B4D::
    scf
    ld   c, l
    scf
    ld   b, a
    dec  sp
    jp   label_E03C
    ld   e, a
    pop  af
    rrca
    inc  e
    inc  bc
    rrca
    nop

label_B9B5C::
    dec  b
    inc  bc

label_B9B5E::
    inc  bc
    nop
    nop
    nop
    rlca
    nop
    dec  de
    dec  b
    inc  hl
    dec  e
    ld   e, a
    inc  hl
    ld   e, a
    dec  l
    ld   e, a
    ld   l, $4F
    dec  [hl]

label_B9B70::
    ld   b, a
    add  hl, sp
    jp   label_E03C
    ld   e, a
    pop  af
    rrca
    inc  e
    inc  bc
    rrca
    nop

label_B9B7C::
    dec  b
    inc  bc
    inc  bc
    nop

label_B9B80::
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38

label_B9B92::
    nop
    rst  $38
    ldi  [hl], a
    db   $14

label_B9B96::
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a

label_B9BDD::
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    inc  bc
    nop
    dec  b
    inc  bc
    dec  bc
    rlca
    rla
    ld   [label_1728], sp
    scf
    rrca
    ccf
    dec  bc
    ld   e, a
    dec  hl
    sbc  a, a
    ld   l, e
    sub  a, a
    ld   l, a
    cp   h
    ld   h, a
    cp   a
    ld   h, a
    cp   a
    ld   h, h
    ld   h, a
    jr   label_B9BDD
    ccf
    rst  $38
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   [$FF08], a
    ld   a, [$FFC4]
    jr   c, label_B9C6D
    cp   b
    and  d
    call c, label_BACD2
    push af
    ld   a, [hli]
    push af
    ld   a, [hli]
    db   $E2
    ld  [$FF00+C], a
    or   c
    adc  a, $F9
    adc  a, [hl]
    ld   a, [$CD8C]
    ldd  [hl], a
    ld   bc, $FFFE
    nop
    inc  bc
    nop
    dec  b

label_B9C43::
    inc  bc
    add  hl, bc
    rlca
    ld   de, label_100F
    rrca
    jr   z, label_B9C63
    jr   z, label_B9C65
    ld   h, h
    dec  de
    and  b
    ld   e, a
    sub  a, b
    ld   l, a
    adc  a, b
    ld   [hl], a
    or   a
    ld   e, b
    ld   c, h
    ccf
    add  a, e
    ld   a, a
    add  a, b
    ld   a, a
    rst  $38
    nop
    ld   [rJOYP], a
    sub  a, b

label_B9C63::
    ld   [$FF88], a

label_B9C65::
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF14]
    db   $E8 ; add  sp, d
    inc  [hl]

label_B9C6D::
    ret  z
    ld   c, d
    or   h
    ld   de, label_21EE
    sbc  a, $45
    cp   d
    adc  a, l
    ld   a, d
    ld   [de], a
    db   $FC ; Undefined instruction
    ld  [$FF00+C], a
    db   $FC ; Undefined instruction
    ld   bc, $FFFE
    nop
    nop
    nop
    ld   a, a
    nop
    ld   a, a
    ccf
    ld   a, h
    rrca
    inc  l
    rla
    ld   a, b
    scf
    ld   a, h
    inc  hl
    ld   a, [hl]
    ld   hl, label_BA5FA
    cp   e
    ld   a, h
    and  a
    ld   a, e
    rst  $38
    ld   h, e
    cp   a
    ld   l, e
    ld   a, a
    nop
    db   $10
    db   $0F
    rra
    nop
    nop
    nop
    ret  nz
    nop
    and  b
    ret  nz
    db   $10
    db   $E0
    ld   [label_38F0], sp
    ret  nz
    inc  b
    ld    hl, sp+$E4
    jr   label_B9C43
    ld   l, h
    ld   c, $F0
    inc  b
    ld    hl, sp+$04
    ld    hl, sp+$2A
    call c, label_3EF1
    ld   bc, $FFFE
    nop
    ld   a, a
    nop
    ld   a, a
    ccf
    ld   a, h
    rrca
    inc  l
    rla
    ld   a, b
    scf
    ld   a, h
    inc  hl
    ld   a, [hl]
    ld   hl, label_BA5FA
    cp   e
    ld   a, h
    and  a
    ld   a, c
    rst  $38
    ld   h, l
    cp   a
    ld   l, l
    ld   a, a
    nop
    ld   b, $01
    ld   [label_F07], sp
    nop
    ret  nz
    nop
    and  b
    ret  nz
    db   $10
    db   $E0
    ld   [label_38F0], sp
    ret  nz
    inc  b
    ld    hl, sp+$64
    sbc  a, b
    sub  a, d
    ld   l, h
    adc  a, [hl]
    ld   [hl], b
    add  a, h
    ld    hl, sp+$84
    ld    hl, sp+$AC
    ret  c
    db   $F4 ; Undefined instruction
    jr   c, label_B9CFD
    db   $FC ; Undefined instruction
    ld   [bc], a

label_B9CFD::
    db   $FC ; Undefined instruction
    cp   $00
    ld   bc, label_300
    ld   bc, $0103
    rlca
    ld   bc, $001F
    ccf
    inc  bc
    ccf
    ld   b, $7F
    nop
    ld   a, a
    ld   bc, $007F
    ld   a, a
    ld   b, $3F
    inc  bc
    ccf
    nop
    rra
    nop
    add  hl, hl
    ld   e, $1E
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld   [$FF80], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ret  nz
    db   $FC ; Undefined instruction
    ld   h, b
    cp   $60
    cp   $C0
    cp   $60
    cp   $60
    db   $FC ; Undefined instruction
    ret  nz
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    sub  a, h
    ld   a, b
    ld   a, b
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_700
    ld   bc, $001F
    ccf
    inc  bc
    ccf
    ld   b, $7F
    nop
    ld   a, a
    ld   bc, label_37F
    ld   a, a
    ld   b, $3F
    rlca
    ccf
    nop
    rra
    nop
    add  hl, hl
    ld   e, $1E
    nop
    nop
    nop
    nop
    nop
    add  a, b
    nop
    ld   [$FF80], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ret  nz
    db   $FC ; Undefined instruction
    ld   h, b
    cp   $60
    cp   $C0
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    ld   [$FFFC], a
    nop
    ld    hl, sp+$00
    sub  a, h
    ld   a, b
    ld   a, b
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
    ld   [bc], a
    dec  a
    inc  bc
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    db   $10
    db   $7F
    db   $10
    db   $7F
    jr   label_B9DD6
    ld   [$003F], sp
    ld   d, a
    jr   c, label_B9DE0
    inc  a
    inc  a
    nop
    jr   c, label_B9DA2

label_B9DA2::
    ld   l, b
    jr   nc, label_B9D75
    ld   h, b
    and  b
    ret  nz
    ld   a, [$FF00]
    cp   b
    ret  nz
    ld    hl, sp+$00
    db   $FC ; Undefined instruction

label_B9DAF::
    nop
    db   $FC ; Undefined instruction
    jr   nz, label_B9DAF
    ld   h, b
    db   $FC ; Undefined instruction
    ret  nz
    ld    hl, sp+$80
    db   $F4 ; Undefined instruction
    ld   [label_18E4], sp
    ld    hl, sp+$00
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
    ld   bc, $013F
    ld   a, a
    ld   bc, label_17F
    ld   a, a
    ld   bc, label_17F

label_B9DD6::
    ccf
    ld   bc, $003F
    rra
    nop
    add  hl, hl
    ld   e, $1E
    nop

label_B9DE0::
    ld   bc, label_300
    ld   bc, $0103
    rlca
    ld   bc, $001F
    ccf
    inc  b
    ccf
    ld   b, $7F
    ld   [bc], a
    ld   a, a
    nop
    ld   a, a
    jr   label_B9E70
    rra
    dec  sp
    rrca
    dec  sp
    rlca
    rra
    nop
    add  hl, hl
    ld   e, $1E
    nop
    inc  e
    nop
    ccf
    inc  e
    ccf
    rla
    ccf
    jr   label_B9E88
    rlca
    ld   e, a
    cpl
    xor  a
    ld   e, a
    xor  a
    ld   e, a
    rst  $28
    ld   e, a
    or   $6F
    cp   a
    ld   h, b
    ld   d, [hl]
    cpl
    jr   c, label_B9E21

label_B9E1A::
    ld   a, a
    jr   c, label_B9E1A
    ld   d, [hl]
    rst  $38
    nop
    ld   [rJOYP], a
    ld   a, [$FFE0]
    ld    hl, sp+$A0
    db   $FC ; Undefined instruction
    ld   [$FFFE], a
    nop
    add  a, $B8
    cp   e
    call c, label_DCBB
    ld   a, l
    sbc  a, [hl]
    cp   l
    ld   e, [hl]
    dec  a
    sbc  a, $5A
    cp   h
    db   $FC ; Undefined instruction
    nop
    sbc  a, $3C
    cp   a
    ld   l, d
    rst  $38
    nop
    ld   bc, label_300
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
    dec  b
    inc  bc
    dec  bc
    rlca
    rla
    rrca
    rla
    rrca
    dec  bc
    rlca
    dec  b
    inc  bc
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   bc, $0103
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
    ccf
    nop
    ld   a, a
    ccf

label_B9E70::
    ld   a, a
    ccf
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
    ld   bc, label_300
    ld   bc, $0103
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    inc  bc
    ld   bc, $0103
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
    ld   bc, label_200
    ld   bc, label_3FC
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
    nop
    inc  e
    nop
    ccf
    ld   [label_1C3F], sp
    ccf
    rrca
    ld   e, $07
    dec  e
    ld   b, $1D
    ld   b, $1E
    rlca
    ccf
    rrca
    ccf
    inc  e
    ccf
    ld   [$001C], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  bc
    ld   bc, $0107
    rrca
    inc  bc
    ld   a, $07
    ld   a, l
    ld   e, $7D
    ld   e, $3E
    rlca
    rrca
    inc  bc
    rlca
    ld   bc, $0103
    inc  bc
    nop
    ld   bc, $0000

label_B9EFF::
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    rra
    ld   bc, label_E1F
    ccf
    ld   a, [bc]
    ccf
    ld   c, $2E
    ld   de, label_1F20
    ld   h, b
    rra
    ld   a, [$FF6F]
    ld    hl, sp+$77
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
    ld   [rJOYP], a
    sub  a, b
    ld   [$FFF8], a
    ret  nz
    db   $FC ; Undefined instruction
    cp   b
    ld   a, h
    xor  b
    ld   a, h
    cp   b
    inc  a
    ret  nz
    ld   b, $F8
    rlca
    ld   a, [$FA07]
    rrca
    ld   a, [$FFF0]
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    inc  c
    rlca
    add  hl, de
    rrca
    ld   a, a
    rra
    rst  $38
    ld   a, a
    ld   b, c
    ccf
    jr   nz, label_B9F71
    db   $10
    db   $0F
    db   $10
    db   $0F
    db   $10
    db   $0F
    db   $10
    db   $0F
    rrca
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    cp   $FF
    cp   $7E
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    ld   [$FFE0], a
    ret  nz
    ret  nz
    add  a, b
    ret  nz

label_B9F71::
    add  a, b
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
    nop
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    inc  bc
    nop
    inc  bc
    ld   bc, $001F
    ld   h, a
    rra
    adc  a, $71
    cp   $65
    cp   $6D
    ld   l, l
    ldd  [hl], a
    ld   [hl], h
    dec  sp
    ld   [hl], $19
    jr   nc, label_BA035
    add  hl, sp
    ld   b, $7F
    dec  a
    rst  $30
    ld   a, b
    rst  $38
    rlca
    rlca
    nop
    ld   h, b
    nop
    ld   a, [$FF60]
    ld    hl, sp+$10
    cp   h
    ret  z
    ld   e, h
    ld   [$FFA8], a
    ld   [hl], b
    sbc  a, [hl]
    ld   [hl], b
    rst  $20
    ld   a, [de]
    rst  $38
    ld   [bc], a
    add  a, a
    ld   a, d
    rst  $30

label_BA035::
    ld   a, [de]
    rst  $30
    jp  c, label_B0EE
    call c, label_B868
    ret  nc
    ld   a, [$FF00]
    inc  bc
    nop
    inc  bc
    ld   bc, $001F
    ld   h, a
    rra
    adc  a, $71
    cp   $6D
    cp   $65
    ld   l, l
    ldd  [hl], a
    ld   [hl], h
    dec  sp
    or   $59
    ld   a, [$FF5F]
    ld   a, c
    ld   h, $3F
    dec  e
    rra
    ld   [label_70F], sp
    rlca
    nop
    ret  nz
    nop
    ld   [rLCDC], a
    ld   a, [$FF20]
    or   b
    ret  nz
    ld   d, b
    ld   [$FFA8], a
    ld   [hl], b
    ld   c, h

label_BA06D::
    or   b
    ld   l, d
    sub  a, h
    ld   a, [label_B8A04]
    or   h
    ld   a, [$FA04]
    ld   h, h
    db   $EC ; Undefined instruction
    ret  nc
    ret  c
    jr   nz, label_BA06D
    ret  nz
    ld   [rJOYP], a
    nop
    nop
    ld   bc, label_1B00
    ld   bc, label_187F
    db   $FC ; Undefined instruction
    ld   c, e
    cp   l
    ld   e, d
    reti
    ld   h, $61
    ld   e, $39
    ld   b, $FF
    inc  e
    rst  $38
    ld   a, e
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
    ret  nz
    nop
    ld   [$FFC0], a
    ld   a, [$FF00]
    dec  bc
    ld   a, [$FF57]
    ld   a, [$FA57]
    rst  $10
    db   $3A ; ldd  a, [hl]
    rst  $18
    cp   d
    ei
    ld   [hl], b
    ld   a, [$FFC0]
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
    ld   bc, label_1B00
    ld   bc, label_187F
    db   $FC ; Undefined instruction
    ld   c, e
    cp   l
    ld   e, d
    ld   e, c
    ld   h, $E1
    ld   e, [hl]
    ld   sp, hl
    ld   h, [hl]
    ld   a, a
    inc  a
    ccf
    dec  bc
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
    ret  nz
    nop
    and  b
    ret  nz
    ld   [rJOYP], a
    ld   d, $E0
    ld   c, d
    db   $F4 ; Undefined instruction
    ld   e, d
    db   $F4 ; Undefined instruction
    ld   a, [$FA14]
    call nc, label_20F6
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $10
    db   $10
    ld   [de], a
    ld   [de], a
    inc  e
    inc  e
    inc  b
    inc  b
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
    stop
    jr   label_BA128

label_BA128::
    ld   e, $00
    cpl
    ld   e, $5F
    ld   a, [hli]
    cp   a
    ld   c, [hl]
    cp   $00
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
    stop
    jr   label_BA14A

label_BA14A::
    ld   d, $08
    ccf
    ld   e, $7F
    db   $3A ; ldd  a, [hl]
    rst  $28
    ld   a, [hl]
    add  a, d
    ld   a, h
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
    add  a, b
    nop
    add  a, b
    nop
    ld   b, b
    nop
    ld   b, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    jr   nc, label_BA172

label_BA172::
    jr   nc, label_BA174

label_BA174::
    jr   nc, label_BA176

label_BA176::
    inc  a
    nop
    ld   a, $0C
    ld   a, $0C
    inc  a
    nop
    jr   nc, label_BA180

label_BA180::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ccf
    nop
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
    inc  c
    nop
    ld   e, $0C
    ld   e, $0C
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
    inc  e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    db   $76 ; Halt
    nop
    ccf
    ld   b, $1F
    ld   b, $0E
    nop
    rlca
    nop

label_BA1FE::
    inc  bc

label_BA1FF::
    nop
    inc  e
    nop
    db   $3A ; ldd  a, [hl]
    inc  e
    add  hl, hl
    ld   e, $11
    ld   c, $39
    ld   e, $1B
    inc  c
    rla
    ld   [$001F], sp
    dec  bc
    inc  b
    ld   [label_407], sp
    inc  bc
    rlca
    nop
    rlca
    nop
    dec  c
    ld   b, $0B
    inc  b
    rrca
    nop
    inc  a
    nop
    ld   b, d
    inc  a
    sbc  a, c
    ld   h, [hl]
    cp   l
    ld   b, d
    inc  a
    jp   label_E718
    add  a, c
    ld   a, [hl]
    add  a, c
    ld   a, [hl]
    nop
    rst  $38
    ld   b, d
    cp   l

label_BA234::
    rst  $38
    ld   b, d
    rst  $38
    inc  a
    cp   l
    ld   a, [hl]
    db   $DB
    inc  a
    cp   l
    nop

label_BA23E::
    nop
    nop
    nop
    nop
    jr   nc, label_BA244

label_BA244::
    ld   a, b
    jr   nc, label_BA2A3
    jr   c, label_BA234
    ld   e, h
    cp   e
    ld   a, h
    ld   d, a
    jr   c, label_BA23E
    ld   d, b
    cp   e
    ld   [hl], h
    ld   c, b
    scf
    inc  h
    dec  de
    rra
    nop
    rlca
    nop
    dec  c
    ld   b, $0B
    inc  b
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
    dec  c
    nop
    rra
    inc  c
    ccf
    jr   label_BA2A6
    jr   label_BA2E4
    inc  e
    ld   [hl], d
    dec  l
    ld   [hl], d
    dec  e
    ld   d, a
    jr   z, label_BA29E
    ld   a, [de]
    rla
    ld   [$000F], sp
    nop
    nop
    inc  e
    nop
    inc  de
    inc  c
    jr   label_BA28D
    inc  e
    dec  bc
    ld   a, $1D
    ccf
    jr   label_BA2CB

label_BA28D::
    add  hl, de
    cpl
    ld   e, $37
    dec  c
    ld   e, a
    ld   hl, label_2D56
    ld   d, a
    ld   l, $4B
    scf
    inc  a
    inc  bc
    scf
    inc  e

label_BA29E::
    ccf

label_BA29F::
    nop
    inc  e
    nop
    inc  de

label_BA2A3::
    inc  c
    jr   label_BA2AD

label_BA2A6::
    inc  d
    dec  bc
    ldi  [hl], a
    dec  e
    ld   hl, label_3E1E

label_BA2AD::
    ld   bc, label_1E21
    inc  sp
    dec  c
    ld   e, a
    ld   hl, label_2D56
    ld   d, a
    ld   l, $4B
    scf
    inc  a
    inc  bc
    scf
    inc  e
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    ld   [label_807], sp

label_BA2CB::
    rlca
    rlca
    nop
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
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    inc  de
    inc  c

label_BA2E4::
    jr   label_BA2ED
    sbc  a, h
    dec  bc
    ld   a, [hl]
    sbc  a, l
    ccf
    ret  c
    cp   [hl]

label_BA2ED::
    reti
    rst  $28
    sbc  a, $F7
    ld   l, l
    ld   e, a
    ld   sp, label_1D3E
    cpl
    ld   e, $17
    rrca
    inc  e
    inc  bc
    scf
    inc  e
    ccf
    nop

label_BA300::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_1F00
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, [$FF0F]
    ld   a, a
    dec  b
    ccf
    dec  c
    ccf
    rra
    ld   a, a
    ccf
    ld   a, a
    scf
    ld   [hl], b
    rrca
    cp   a
    ld   [hl], b
    nop
    nop
    nop
    nop
    ld    hl, sp+$00
    adc  a, h
    ld   [hl], b
    ld   a, [hl]
    add  a, b
    cp   $00
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    ld   a, h
    add  a, b
    call c, label_C8A0
    or   b
    ld   b, h
    cp   b

label_BA33A::
    ld   b, h
    cp   b
    call nz, label_E838
    db   $10
    db   $BF
    ld   h, b
    ld   a, a
    jr   label_BA3A4
    jr   nc, label_BA33A
    inc  c
    rst  $30
    ld   c, [hl]
    db   $EB ; Undefined instruction
    rla
    dec  a
    inc  de
    cpl
    jr   label_BA3A8
    cpl
    ld   c, a
    jr   nc, label_BA398
    ccf
    ld   h, b
    rra
    ld   l, h
    inc  de
    ld   a, $01
    rrca
    stop
    nop
    cp   $00
    rst  $38
    ld   [bc], a
    rst  $38
    ld   [bc], a
    ld   a, a
    or   $EF

label_BA369::
    jr   label_BA369
    ld   [label_8FC], sp
    db   $F4 ; Undefined instruction
    jr   label_BA35B
    db   $F4 ; Undefined instruction
    ld   a, [$FF00+C]
    jp   nz, label_6FC
    ld    hl, sp+$36
    ret  z
    ld   a, h
    add  a, b
    ld   a, [$FF08]
    nop
    nop
    nop
    nop
    ld   bc, label_300
    nop
    inc  bc
    nop
    inc  bc
    nop
    rra
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $30
    dec  bc
    rst  $28
    dec  d
    ld   l, a
    dec  d
    ld   c, a
    scf

label_BA398::
    ld   c, e
    scf
    ld   c, a
    inc  sp
    ld   c, l
    inc  sp
    ccf
    nop
    nop
    nop
    ld   [rJOYP], a

label_BA3A4::
    ld   [hl], b
    add  a, b
    ld   [hl], b
    add  a, b

label_BA3A8::
    ld   h, b
    add  a, b
    ld    hl, sp+$00
    cp   $00
    rst  $38
    nop
    xor  a
    ret  nc
    rst  $30
    xor  b
    ld   a, [$FF00+C]
    di
    db   $EC ; Undefined instruction
    sub  a, c
    xor  $E1
    sbc  a, [hl]
    ld   h, c
    sbc  a, [hl]
    ld   a, [$FF00+C]
    ccf
    rlca
    ccf
    ld   c, $7F
    dec  c
    rst  $38
    ld   b, b
    push af
    ld   e, e
    db   $FD ; Undefined instruction
    inc  de
    ld   a, $11
    cpl
    jr   label_BA428
    cpl
    ld   c, a
    jr   nc, label_BA418
    ccf
    ld   h, b
    rra
    ld   l, h
    inc  de
    ld   a, $01
    rrca
    stop
    nop
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    ret  nz
    cp   [hl]
    ret  nz
    rst  $18
    ldd  [hl], a
    ld   l, a
    sbc  a, d
    ld   a, a
    adc  a, b
    db   $FC ; Undefined instruction
    ld   [label_18F4], sp
    ld   [$F2F4], a
    inc  c
    jp   nz, label_6FC
    ld    hl, sp+$36
    ret  z
    ld   a, h
    add  a, b
    ld   a, [$FF08]
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
    jr   nz, label_BA40A
    ld   d, b
    rst  $38
    ld   d, b
    rst  $38
    jr   nz, label_BA410
    nop
    cp   a
    ld   b, b
    rst  $38
    jr   nc, label_BA48E
    ld   a, $7E
    rla
    ccf
    ld   [bc], a
    rra
    nop
    rlca
    nop
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    jr   nz, label_BA4A8
    db   $10
    db   $FF
    ld   d, b
    rst  $38

label_BA42D::
    jr   nz, label_BA42D
    rlca
    rst  $30
    ld   e, $FF
    ldd  [hl], a
    cp   a
    ld   d, b
    ld   e, a
    jr   nz, label_BA498
    jr   nz, label_BA462
    jr   label_BA456
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

label_BA456::
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

label_BA462::
    ld   a, b
    add  a, b
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $C0
    rst  $38
    jr   nz, label_BA46C
    jr   nz, label_BA46E
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

label_BA48E::
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

label_BA498::
    ld   a, e
    inc  a

label_BA49A::
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

label_BA4A8::
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

label_BA4B8::
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
    rlca
    nop
    ld   c, $03
    ccf
    ld   bc, label_215F
    rst  $38
    ld   b, c
    cp   $01
    ld   a, $01
    ld   [hl], a
    jr   c, label_BA510
    ld   a, b
    rst  $30

label_BA513::
    ld   [label_61F], sp
    rrca
    dec  b
    rrca
    inc  bc
    rlca
    nop
    inc  bc
    nop
    nop
    nop
    ccf
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    cp   c
    ld   b, [hl]
    sub  a, h
    ld   l, a
    sub  a, b
    ld   l, a
    pop  af
    ld   c, $FA
    ld   h, l
    db   $F4 ; Undefined instruction
    db   $DB
    db   $E4 ; Undefined instruction
    db   $DB
    db   $E4 ; Undefined instruction
    ld   e, e
    ld    hl, sp+$47
    cp   $E1
    cp   $0D
    rra
    nop
    jr   label_BA542

label_BA542::
    and  h
    jr   label_BA539
    ld   [label_BA49A], sp
    adc  a, a
    ld   [hl], b
    adc  a, a
    db   $76 ; Halt
    adc  a, [hl]
    ld   [hl], b
    ret  z

label_BA54F::
    jr   nc, label_BA559

label_BA551::
    ld   a, [$FF08]
    ld   a, [$FF08]
    ld   a, [$FF30]
    ret  nz
    ld   b, b

label_BA559::
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    nop
    nop
    ccf
    nop
    rst  $38
    nop
    cp   a
    ld   b, b
    cp   a
    ld   b, b
    cp   c
    ld   b, [hl]
    sub  a, h
    ld   l, a
    sub  a, b
    ld   l, a
    pop  af

label_BA571::
    ld   c, $F9
    ld   h, [hl]
    push af
    ld   [$DEE9], a
    pop  hl
    ld   e, [hl]
    di
    ld   l, h
    db   $FC ; Undefined instruction
    ld   [$FFE0], a
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ret  z
    jr   nc, label_BA551
    jr   nc, label_BA54F
    jr   c, label_BA571
    jr   label_BA513
    ld   a, b
    ld   b, $F8
    ld   a, [bc]
    db   $F4 ; Undefined instruction
    ld   a, [de]
    db   $E4 ; Undefined instruction
    ld   a, [bc]
    db   $F4 ; Undefined instruction
    add  a, h
    ld   a, b
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    db   $FC ; Undefined instruction
    nop
    ld   [label_1C00], sp
    ld   [label_C1F], sp
    rla
    ld   c, $0B
    dec  b
    rlca
    ld   bc, $0067
    db   $F4 ; Undefined instruction
    ld   b, e
    xor  e
    ld   d, [hl]
    adc  a, a
    ld   [hl], l
    ld   l, a
    dec  d
    ei
    ld   h, [hl]
    db   $ED ; Undefined instruction
    ld   d, e
    rst  0
    jr   c, label_BA621
    dec  de
    ccf
    nop
    nop
    nop
    ld   a, h
    nop
    rst  $28
    db   $10
    db   $FF
    jp   label_A7FF
    rst  $38
    push hl
    rst  $38
    db   $D3 ; Undefined instruction
    db   $DB
    inc  h
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    add  a, d
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   sp, hl
    cp   [hl]
    ld   a, a
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    stop
    jr   c, label_BA5F6
    ld    hl, sp+$30
    db   $E8 ; add  sp, d
    or   b
    ret  nc
    and  b
    db   $EC ; Undefined instruction
    nop
    ld   a, [hl]
    add  a, h
    xor  d
    call nc, label_DCE2
    and  $D8

label_BA5F6::
    cp   a
    add  a, $77
    adc  a, d

label_BA5FA::
    db   $E3 ; Undefined instruction
    inc  e
    ld   h, $D8
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    ccf
    ccf
    ld   hl, label_213E
    ld   a, $21
    ld   a, $21
    ld   a, $3F
    jr   nz, label_BA64E
    jr   nz, label_BA632
    ld   a, $21
    ld   a, $21
    ld   a, $21
    ld   a, $3F
    ccf
    ccf
    ccf
    nop
    nop
    nop
    nop
    ld   bc, label_201
    inc  bc
    inc  b
    rlca
    ld   [label_1C0F], sp
    inc  de
    ld   h, $39
    ld   b, e
    ld   a, h
    add  a, c
    cp   $C3
    db   $FC ; Undefined instruction

label_BA632::
    ld   h, [hl]
    ld   a, c
    inc  a
    inc  sp
    inc  e
    dec  de

label_BA638::
    inc  c
    rrca
    ld   b, $07
    inc  bc
    inc  bc
    ld   bc, label_301
    nop
    ld   [bc], a
    ld   bc, $0003
    ld   [bc], a
    ld   bc, $010F
    dec  de
    dec  c
    ld   l, $11

label_BA64E::
    ld   e, d
    ld   hl, label_B81B2
    and  d
    ld   b, c
    and  d
    ld   b, c
    and  d
    ld   b, c
    cp   [hl]
    ld   b, c
    add  a, a
    ld   a, l
    cp   $01
    ld   a, a
    nop
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
    nop
    nop
    rst  $20
    rst  $20
    ei
    sbc  a, h
    sub  a, a
    db   $E8 ; add  sp, d
    sbc  a, a
    pop  af
    xor  a
    ld   a, [$FF00+C]
    di
    xor  a
    pop  af
    or   a
    ld    hl, sp+$BB
    db   $EC ; Undefined instruction
    cp   l
    xor  $6C
    ld   [hl], a
    push af
    cp   [hl]
    db   $FD ; Undefined instruction
    sbc  a, [hl]
    cp   h
    rst  0
    ld   a, l
    ld   b, [hl]
    db   $E6
    and  $A4
    rst  $38
    cp   l
    cp   $A5
    cp   $A4
    rst  $38
    and  l
    cp   $A5
    cp   $C4
    rst  $38
    push bc
    cp   $C5
    cp   $FC
    cp   a
    cp   l
    and  $EC
    rst  $30
    cp   $BF
    db   $FD ; Undefined instruction
    add  a, e
    ld   a, a
    ld   a, a
    inc  bc
    nop
    inc  c
    inc  bc
    inc  de
    rrca
    cpl
    rra
    cpl
    rra
    ld   e, h
    ccf
    ld   e, c
    ld   a, $59
    ld   a, $59
    ccf
    ld   e, c
    ccf
    inc  l
    rra
    cpl
    rra
    inc  de
    rrca
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  c
    ld   b, l
    ld   c, [hl]
    ld   d, $0F
    scf
    rrca
    rrca
    rst  $38
    ld   a, h
    rst  $38
    add  hl, sp
    ld   a, [hl]
    ld   e, c
    ld   a, $D9
    cp   a
    ld   e, c
    ccf
    inc  a
    ld   a, a
    ld   a, a
    rst  $38
    rrca
    rst  $38
    ld   [hl], $0F
    ld   d, l
    ld   c, [hl]
    nop
    inc  c
    rlca
    nop
    rra
    nop
    ccf
    inc  e
    ld   a, a
    ld   a, $7F
    ld   h, $DD
    ld   l, $E3
    inc  e
    rst  $38
    inc  bc
    rst  8
    ccf
    cp   [hl]
    ld   a, a
    cp   l
    ld   a, [hl]
    jp   nz, label_BBC3D
    inc  bc
    ld   a, a
    nop
    cp   l
    ld   a, [hl]
    rst  $38
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $F4 ; Undefined instruction
    ld   [$F06C], sp
    ld   a, [$FF00+C]
    ld   l, d
    sbc  a, h
    ld   a, [$FAFC]
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
    rst  $20
    ld    hl, sp+$0F
    or   $FD
    ld   c, $FB
    inc  a
    cp   $00
    rlca
    nop
    rra
    nop
    ccf
    ld   c, $7F
    rra
    ld   a, a
    inc  de
    xor  $17
    pop  af
    ld   c, $FF
    ld   sp, label_BAFF7
    rst  $30
    ld   l, a
    or   $6F
    cp   c
    db   $76 ; Halt
    ld   b, [hl]
    add  hl, sp
    ld   a, a
    nop
    dec  bc
    rlca
    rrca
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    ld    hl, sp+$00
    db   $F4 ; Undefined instruction
    ld   [label_BB0EC], sp
    ld   a, [$B204]
    call z, label_FCFA
    ld   a, d
    db   $FC ; Undefined instruction
    ld   a, [$FF00+C]
    db   $E4 ; Undefined instruction
    ld    hl, sp+$08
    ld   a, [$FFF8]
    nop
    db   $E8 ; add  sp, d
    ld   a, [$FFF8]

label_BA77F::
    nop
    rrca
    nop
    ccf
    nop
    ld   a, a
    ld   de, label_3B7F
    rst  $38
    ld   a, [hli]
    push de
    ld   a, [hli]
    xor  $11
    cp   a
    ld   b, b
    rst  $38
    ld   d, c
    rst  $38
    ld   e, a
    cp   a
    ld   e, a
    ld   e, a
    ccf
    cpl
    rra
    ld   a, h
    inc  bc
    cp   e
    ld   a, h
    rst  $38
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ret  nz
    cp   $E0
    cp   $60
    db   $DB
    db   $EC ; Undefined instruction
    ccf
    ret  nz

label_BA7AE::
    rst  $28
    inc  e
    db   $FD ; Undefined instruction
    cp   $FD
    xor  $F1
    xor  $EE
    ld   a, [$FF84]
    ld    hl, sp+$0E
    ld   a, [$FFF3]
    inc  c
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
    rra
    nop
    daa
    rra
    ld   b, a
    ccf
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   h, b
    rra
    ld   [hl], b
    rrca
    ccf
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
    nop
    nop
    ret  nz
    nop
    jr   nz, label_BA7AE
    db   $10
    db   $E0
    db   $10
    db   $E0
    db   $10
    db   $E0
    db   $10
    db   $E0
    db   $10
    db   $E0
    jr   nc, label_BA7BA
    ld   [hl], b
    add  a, b
    ld   [rJOYP], a
    ret  nz
    nop
    nop
    nop
    db   $E3 ; Undefined instruction
    nop
    cp   $61
    ld   e, a
    jr   nc, label_BA868
    jr   nz, label_BA80A
    nop
    db   $FD ; Undefined instruction
    inc  bc
    di
    inc  c
    rst  $28
    db   $10
    db   $FF
    nop
    rst  $38
    add  a, b
    rst  $38
    nop

label_BA818::
    rst  $38
    ld   h, b
    rst  $38
    ld   [hl], b
    ld   a, [hl]
    cp   l
    ld   a, $C0
    db   $E3 ; Undefined instruction
    nop
    rst  $38
    ld   h, b
    ld   e, l
    inc  sp
    ld   d, e
    inc  l
    rst  $28
    inc  de
    rst  $38
    rrca
    rst  $38

label_BA82D::
    dec  e
    sbc  a, $39
    rst  8
    jr   c, label_BA818
    sbc  a, d
    ld   a, [$FF00+C]
    rst  $38
    ret  nz
    rst  $28
    ret  nc
    ld   [$FFDF], a
    ld   a, [$FF6F]
    ld   [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  b
    inc  bc
    ld   c, $05
    dec  de
    inc  c
    inc  [hl]
    jr   label_BA8C3
    jr   nc, label_BA82D
    ld   h, b
    ld   [$FF1F], a
    ld   [hl], b
    nop
    ld    hl, sp+$30
    call c, label_EE78
    ld   e, h

label_BA868::
    rst  $30
    ld   c, [hl]

label_BA86A::
    db   $EB ; Undefined instruction
    ld   b, a
    push hl
    ld   b, d
    db   $E3 ; Undefined instruction
    ld   b, b
    rst  $38
    nop
    rst  $38
    db   $FD ; Undefined instruction
    dec  b
    ei
    db   $FC ; Undefined instruction
    inc  bc
    ld   [hl], l
    ldi  [hl], a
    ld   h, e
    inc  e
    nop
    rlca
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   bc, label_300
    nop
    rlca
    ld   [bc], a
    dec  c
    ld   b, $1B
    inc  c
    dec  [hl]
    jr   label_BA900
    jr   nc, label_BA86A
    ld   h, b
    pop  hl
    ld   e, $01
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
    ld   [$FFC0], a
    jr   nc, label_BA88C
    rst  $38
    or   b
    db   $BA
    cp   d
    rst  $28
    sbc  a, h
    rst  $30
    adc  a, l
    call label_C483
    add  a, e
    push bc
    add  a, d
    jp   label_C0BC
    add  a, a
    ret  nz
    ccf
    nop
    nop
    nop

label_BA8C3::
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
    ld   bc, label_300
    ld   bc, $0103
    ld   b, $03
    rlca
    ld   [bc], a
    dec  c
    ld   b, $0E
    inc  b
    inc  c
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop

label_BA8E6::
    nop
    nop
    nop
    nop
    jr   c, label_BA8EC

label_BA8EC::
    rst  $18
    jr   c, label_BA8E6
    adc  a, $FF
    or   b
    ld   c, a
    cp   l
    di
    dec  c
    adc  a, h

label_BA8F7::
    inc  bc
    dec  b
    ld   a, [bc]
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rlca
    nop
    rst  $38

label_BA900::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    inc  a
    db   $10
    db   $3E
    inc  e
    rst  $38
    ld   c, $FF
    ld   l, d
    sbc  a, [hl]
    ld   h, c
    rst  $38
    nop
    ld   bc, label_300
    nop
    rlca
    inc  bc
    rlca
    nop
    rrca
    nop
    ccf
    rrca
    ld   a, a
    ccf
    rst  $38
    ld   c, [hl]
    rst  $38
    ld   e, h
    rst  $38
    ld   c, h
    rst  $38
    ld   c, h
    rst  $38
    ld   l, h
    rst  $38
    ccf
    rst  $38
    db   $D3 ; Undefined instruction
    ld   a, a
    add  a, d
    rst  $38
    ld   [hl], b
    cp   a
    ld   a, b
    ld   e, h
    cp   e
    cp   a
    ret  nz
    ld    hl, sp+$00
    ret  nz
    nop
    ld   a, [$FFC0]
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    jr   c, label_BA945

label_BA949::
    sbc  a, b
    db   $FC ; Undefined instruction
    jr   label_BA949

label_BA94D::
    jr   c, label_BA94D
    ld   a, [$FFFF]
    add  a, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $20
    jr   label_BA8F7
    ld   h, b
    ld   a, [hl]
    sbc  a, b
    cp   a
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
    inc  c
    nop
    ld   a, $04
    ld   a, [hl]
    inc  [hl]
    rst  $38
    inc  a
    rst  $38
    ld   d, e
    sbc  a, b
    ld   h, a
    rst  $38
    nop
    rlca
    nop
    ld   b, $03
    inc  bc
    ld   bc, $0003
    rst  $38
    ld   l, [hl]
    rst  $30
    ld   l, [hl]
    ld   l, c
    ld   b, $0F
    nop
    dec  c
    ld   b, $0D
    ld   b, $0D
    ld   b, $0D
    ld   b, $0D
    ld   b, $0D
    ld   b, $0D
    ld   b, $0F
    nop
    nop
    nop
    nop
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
    ccf
    rrca
    ld   a, a
    ccf
    rst  $38
    ld   h, e
    rst  $38
    ld   h, c
    rst  $38
    ld   h, c
    rst  $38
    ld   h, l
    ld   a, a
    add  hl, sp
    rst  $38
    rrca
    rst  $38
    ld   b, $BF
    ld   b, d
    cp   a
    ld   b, b
    ld   e, a
    jr   nz, label_BA9BE
    ld   c, h
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    ret  z
    db   $FC ; Undefined instruction
    adc  a, b
    db   $FC ; Undefined instruction
    adc  a, b
    cp   $D8
    rst  $38
    or   [hl]
    rst  $38
    xor  $FF
    ld   l, h
    rst  $38
    ld   b, b
    sub  a, $28
    cpl
    sbc  a, $FF
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    adc  a, b
    ld   [hl], b
    cp   b
    ld   [hl], b
    cp   e
    ld   [hl], b
    ld   a, a
    jr   nc, label_BAA2E
    ld   b, $1F

label_BA9F1::
    rrca
    rra
    dec  c
    rra
    dec  c
    rra
    ld   b, $0F
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    ld   c, $01
    dec  e
    inc  bc
    ld   a, $01
    ld   a, a
    nop
    ld   a, [hl]
    ld   bc, label_BA1FE
    rst  $38
    ld   [hl], b
    rst  $38
    ld   e, a
    rst  $20
    ld   e, a
    cp   b
    ld   h, a
    ld   a, a
    jr   nz, label_BAA76
    jr   nc, label_BAA48
    jr   label_BAA42
    rra
    jr   label_BAA25
    rlca
    nop
    nop
    nop
    rlca
    nop
    dec  bc

label_BAA25::
    rlca
    rla
    rrca
    rla
    inc  c
    ld   l, $19
    ld   e, a

label_BAA2D::
    jr   nc, label_BAA2D
    ld   h, c
    db   $FD ; Undefined instruction
    ld   h, e
    cp   [hl]
    ld   h, c
    ld   e, a
    jr   nz, label_BAAB6
    nop
    ccf
    nop
    rra
    nop
    rrca
    nop
    inc  bc
    nop
    jr   c, label_BAA42

label_BAA42::
    ld   d, a
    jr   c, label_BA9F1
    ld   [hl], e
    rst  $38
    ld   h, b

label_BAA48::
    rst  $38
    ld   h, b
    xor  a
    ld   [hl], b
    ld   e, e
    inc  a
    daa
    rra
    jr   label_BAA59
    daa
    jr   label_BAAA4
    jr   nc, label_BAA16
    ld   h, b
    xor  [hl]

label_BAA59::
    ld   [hl], c
    sbc  a, a
    ld   a, a
    ld   b, b
    ccf
    ccf
    nop
    ld   [hl], b
    nop
    xor  h
    ld   [hl], b
    xor  [hl]
    ld   [hl], b
    rst  $18
    jr   nz, label_BAA68
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rst  $18
    ld   [$FFEF], a
    ld   [hl], b
    rst  $28
    ld   [hl], b

label_BAA76::
    rst  $28
    ld   [hl], b
    sbc  a, $E0
    cp   [hl]
    ret  nz
    ld    hl, sp+$00
    ret  nz
    nop
    inc  bc
    nop
    ld   c, $01
    dec  e
    inc  bc
    dec  a
    inc  bc
    ld   a, [hl]
    ld   bc, $007F
    rst  $38
    nop
    rst  $38
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
    rrca
    nop
    rlca
    nop
    ccf
    nop

label_BAAA4::
    cp   $01
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
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
    rst  $38
    nop

label_BAAB6::
    rst  $38
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
    ld   a, a
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
    rlca
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   bc, label_F00
    ld   bc, label_C1F
    rra
    dec  bc
    ccf
    ld   [bc], a
    ld   c, a
    dec  sp
    ld   b, e
    inc  a
    ld   b, d
    dec  a
    ld   [hl], b
    rrca
    cp   a
    ld   [hl], b
    cp   a
    ld   a, a
    ld   e, a
    ccf
    jr   nc, label_BAB29
    rrca
    nop
    inc  b
    inc  bc
    inc  bc
    nop
    ld   a, [$FF00]
    db   $FC ; Undefined instruction
    ld   a, [$FFFF]
    inc  a
    rst  $38
    rst  $18
    rst  $38

label_BAB29::
    rst  $18
    rst  $38
    adc  a, a
    cp   a
    ld   [hl], a
    rrca
    rst  $30
    ld   c, a
    or   a
    rst  $38
    rrca
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ccf
    rst  $38
    rst  $38
    ld   a, a
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
    ret  nz
    nop
    ld   [$FFC0], a
    ld   a, [$FFE0]
    ld    hl, sp+$F0
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    cp   $FC
    ld   a, [$F2FC]
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$F8
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, $0103
    rlca
    nop
    add  hl, bc
    rlca
    ld   [label_C07], sp
    inc  bc
    ld   a, [bc]
    dec  b
    add  hl, bc
    ld   b, $04
    inc  bc
    inc  bc
    nop
    dec  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  bc
    nop
    ld   a, $00
    rst  $38
    ld   a, $FF
    add  a, a
    rst  $38
    ld   a, e
    rst  $38
    ld   e, e
    rst  $38
    ld   [hl], c
    ld   [hl], a
    adc  a, [hl]
    ld   b, c
    cp   [hl]
    add  hl, bc
    or   $F3
    inc  c
    rlca
    ei
    rst  $38
    rlca
    ld    hl, sp+$F7
    rst  $38
    ld    hl, sp+$00
    rst  $38
    rst  $38
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    ld    hl, sp+$FE
    db   $FC ; Undefined instruction
    cp   $FC
    rst  $38
    cp   $FF
    ld   a, $EF
    cp   $FF
    xor  $DF
    xor  $3D
    sbc  a, $F9
    ld   a, $02
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    add  hl, sp
    rlca
    add  hl, sp
    rlca
    ld   a, l
    inc  bc
    cp   a
    ld   c, l
    cp   a
    ld   c, l
    ld   a, l
    inc  bc
    add  hl, sp
    rlca
    add  hl, sp
    rlca
    add  hl, sp
    rlca
    add  hl, sp
    rlca
    add  hl, sp
    ld   b, $7B
    dec  [hl]
    ld   a, e
    dec  [hl]
    add  hl, sp
    ld   b, $39
    rlca
    add  hl, sp
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

label_BABED::
    nop
    nop
    nop
    ld   [hl], b
    nop
    ret  c
    jr   nz, label_BABED
    nop
    ld    hl, sp+$00
    ld   [hl], h
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    ld   [bc], a
    nop
    nop
    inc  a
    inc  a
    ld   a, [hl]
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    inc  a
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
    rlca
    nop
    rrca
    rlca
    rra
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   a, [$FF60]
    ld   a, b
    db   $10
    db   $1C
    ld   [label_40E], sp
    ld   c, $04
    rrca
    inc  b
    ld   c, $05
    ccf
    ld   b, $7F
    ld   hl, label_B9EFF
    rst  $38
    inc  sp
    rst  $30
    xor  c
    nop
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
    inc  c
    inc  bc
    inc  de
    rrca
    ld   h, $1F
    ld   [$FF3F], a
    ld   [hl], b
    cp   a
    ld   a, [$FF7F]
    ld   a, [$FFFF]
    ld   [hl], b
    rst  $38
    or   c
    ld   a, [hl]
    ld   [$FFBF], a
    rrca
    rrca
    db   $10
    db   $1F
    jr   z, label_BACA5
    ld   d, e
    ld   a, a
    ld   d, h
    ld   a, a
    and  h
    rst  $38
    add  hl, hl
    rst  $38
    xor  c
    ld   a, a
    sub  a, d
    ld   a, [hl]
    rst  8
    ccf
    ld   [$FF1F], a
    jr   nz, label_BAC57
    nop
    rst  $38
    add  a, b
    ld   a, a
    ld   h, b
    sbc  a, a
    pop  hl
    sbc  a, a
    nop
    nop
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    nop
    nop

label_BAC88::
    add  a, b
    add  a, b
    add  a, c
    add  a, c
    ld   b, $07
    add  hl, bc
    rrca
    ldd  [hl], a
    ccf
    call nz, label_9FF
    rst  $38
    ld   a, [bc]
    rst  $38
    inc  b
    rst  $38
    ld   [bc], a
    rst  $38
    inc  bc
    rst  $38
    add  a, c
    rst  $38
    nop
    nop
    nop
    nop
    nop

label_BACA5::
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$F8
    ld   b, $FE
    add  a, c
    rst  $38
    inc  bc
    rst  $38
    ld   a, l
    rst  $38
    add  a, c
    rst  $38
    ld   e, $FE
    ld   h, c
    rst  $38
    add  a, d
    cp   $0C
    db   $FC ; Undefined instruction
    ld   a, [$FFF0]
    inc  de
    rrca
    dec  e
    inc  bc
    ld   a, [de]
    dec  c
    rla

label_BACC7::
    ld   a, [bc]
    dec  a
    ld   [bc], a
    ld   d, a
    jr   c, label_BAC88
    ld   a, h
    sbc  a, c
    ld   a, [hl]
    add  a, b
    ld   a, a

label_BACD2::
    ld   h, b
    rra
    jr   label_BACDD
    inc  c
    inc  bc
    ld   b, $01
    inc  bc
    nop
    ld   bc, $0000
    nop
    rst  $38
    and  c
    rst  $38
    or   e
    cp   $DF
    ld   [hl], c
    xor  $0E
    pop  af
    add  a, a
    ld   a, b
    call nz, label_B84BB
    cp   e
    ld  [$FF00+C], a
    dec  e
    pop  hl
    ld   e, $60
    sbc  a, a
    jr   nc, label_BACC7
    db   $10
    db   $EF
    db   $10
    db   $EF
    sbc  a, c
    ld   h, [hl]
    rst  $38
    nop
    rst  $38
    ld   c, b
    rst  $38
    ld   c, d
    rst  $38
    jp   nc, label_94FF
    rst  $38
    inc  h
    rst  $38
    call nz, label_8FF
    rst  $38
    ld   [label_8FF], sp
    ei
    inc  c
    db   $FD ; Undefined instruction
    add  a, [hl]
    ld   a, [$FA87]
    add  a, a
    or   d
    rst  8
    add  a, [hl]
    rst  $38
    inc  c
    rst  $38
    pop  af
    adc  a, a
    cp   h
    rst  8
    cp   [hl]
    rst  $18
    cp   [hl]
    rst  $18
    cp   [hl]
    rst  $18
    xor  h
    rst  $18
    ret  nz
    rst  $38
    ld   b, [hl]
    rst  $38
    and  [hl]
    ld   a, a
    sbc  a, a
    ld   a, a
    rra
    rst  $38
    inc  e
    rst  $38
    jr   label_BAD39
    jr   label_BAD3B
    jr   label_BAD3D
    jr   label_BAD3F
    add  a, b
    rst  $38

label_BAD42::
    nop
    rst  $38
    jr   c, label_BAD45
    ld   a, b
    rst  $38
    jr   c, label_BAD49
    add  hl, de
    rst  $38
    add  a, c
    rst  $38
    jr   label_BAD4F
    inc  e
    rst  $38
    ld   a, $FF
    rst  $38
    rst  $38
    cp   c
    rst  0
    ld   h, b
    sbc  a, a
    cp   a
    ld   a, a
    db   $FC ; Undefined instruction
    jp   label_BFCC
    jr   nz, label_BAD42
    db   $10
    db   $F0
    ld   [label_9F8], sp
    ld   sp, hl
    ld   b, $FF
    add  a, h
    rst  $38
    add  a, d
    rst  $38
    ld   bc, label_BA1FF
    rst  $38
    ld   [rIE], a
    ld   a, [$FFFF]
    cp   $FF
    rst  $38
    rst  $38
    rst  8
    rst  $38
    add  a, b
    rst  $38
    add  a, c
    rst  $38
    nop
    nop
    inc  a
    inc  a
    jp   nz, label_3AFE
    cp   $41
    rst  $38
    sbc  a, d
    cp   $61
    rst  $38
    ld   [bc], a
    cp   $1C
    db   $FC ; Undefined instruction
    xor  b
    ld    hl, sp+$86
    cp   $BC
    db   $FC ; Undefined instruction
    add  a, d
    cp   $82
    cp   $BC
    db   $FC ; Undefined instruction
    adc  a, b
    ld    hl, sp+$8E
    rst  $38
    add  a, b
    rst  $38
    add  a, e
    rst  $38
    sbc  a, b
    rst  $38
    ld   b, h
    ld   a, a
    ld   b, [hl]
    ld   a, a
    inc  hl
    ccf
    ld   de, label_81F
    rrca
    ld   b, $07
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
    db   $10
    db   $FF
    jr   nz, label_BADC3
    ret  nz
    rst  $38
    nop
    rst  $38
    ld   bc, label_3FF
    rst  $38
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    add  a, e
    rst  $38
    ld   a, h
    ld   a, a
    ld   h, $3F
    inc  de
    rra
    rrca
    rrca
    nop
    nop
    jr   nc, label_BADE1
    jr   nc, label_BADE3
    ld   h, c
    rst  $38
    pop  bc
    rst  $38
    add  a, [hl]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [$FFFF]
    ld   c, a
    rst  $38
    ldi  [hl], a
    cp   $11
    rst  $38
    adc  a, c
    rst  $38
    ld   a, [hl]
    ld   a, [hl]
    di
    rst  $38
    adc  a, h
    rst  $38
    ld   a, [$FFFF]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   bc, label_3FF
    rst  $38
    inc  c
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   [bc], a
    inc  bc
    ld   bc, $0001
    nop
    nop
    nop
    inc  bc
    rst  $38
    ld   c, $FF
    ld   [de], a
    di
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    ld   a, c
    ld   sp, hl
    call nz, label_C3FC
    rst  $38
    jr   nz, label_BAE2F
    jr   label_BAE31
    add  a, a
    rst  $38
    ld   h, b
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    add  a, c
    rst  $38
    ld   a, [hl]
    ld   a, [hl]
    nop
    nop
    inc  h
    db   $FC ; Undefined instruction
    sbc  a, h
    db   $FC ; Undefined instruction
    ld   b, d
    cp   $21
    rst  $38
    dec  e
    rst  $38
    add  a, e
    rst  $38
    ld   h, d
    ld   a, [hl]
    sbc  a, h
    sbc  a, h
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   b, b
    ret  nz
    add  a, b
    add  a, b
    ld   b, b
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
    jr   label_BAE7F
    inc  a
    jr   label_BAEA6
    nop
    jr   label_BAE6D

label_BAE6D::
    nop
    nop
    nop
    nop
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
    rlca
    rra

label_BAE7F::
    rrca
    inc  de
    rrca
    dec  e
    inc  bc
    ld   a, [de]
    dec  c
    rla
    ld   a, [bc]
    dec  e
    ld   [bc], a
    rra
    nop
    ccf
    ld   [label_324F], sp
    sbc  a, e
    ld   a, h
    cp   l
    ld   a, [hl]
    sbc  a, b
    ld   a, a
    ld   h, b
    rra
    jr   label_BAEA1
    ld   c, $01
    inc  bc
    nop
    ld   bc, label_3000

label_BAEA1::
    jr   nc, label_BAEEB
    ld   a, b
    cp   h
    db   $FC ; Undefined instruction

label_BAEA6::
    ld   b, h
    db   $FC ; Undefined instruction

label_BAEA8::
    add  a, h
    db   $FC ; Undefined instruction

label_BAEAA::
    inc  a
    db   $FC ; Undefined instruction
    ld   b, h
    db   $FC ; Undefined instruction
    jr   label_BAEA8
    jr   z, label_BAEAA
    add  a, [hl]
    cp   $81
    rst  $38
    xor  a
    rst  $38
    add  a, c
    rst  $38
    sbc  a, [hl]
    cp   $81
    rst  $38
    ld   [bc], a
    cp   $4C
    db   $FC ; Undefined instruction

label_BAEC2::
    jr   c, label_BAEBC
    add  a, h
    db   $FC ; Undefined instruction
    ld   b, h
    db   $FC ; Undefined instruction
    jr   c, label_BAEC2
    add  a, h
    db   $FC ; Undefined instruction
    ld   b, h
    ld   a, h
    cp   b
    cp   b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   b, b
    ret  nz
    add  a, b
    add  a, b
    ld   b, b
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
    ldi  [hl], a
    ldi  [hl], a
    inc  d
    inc  d
    ld   [label_1408], sp

label_BAEEB::
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    nop
    nop
    nop
    nop
    nop
    nop
    ldi  [hl], a
    ldi  [hl], a
    inc  d
    inc  d
    ld   [label_1408], sp
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    nop
    nop
    nop
    nop
    nop
    nop
    ldi  [hl], a
    ldi  [hl], a
    inc  d
    inc  d
    ld   [label_1408], sp
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    nop
    nop
    nop
    nop
    nop
    nop
    ldi  [hl], a
    ldi  [hl], a
    inc  d
    inc  d
    ld   [label_1408], sp
    inc  d
    ldi  [hl], a
    ldi  [hl], a
    nop
    nop
    nop
    nop
    nop
    nop
    inc  e
    inc  e
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    ldi  [hl], a
    inc  e
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
    rlca
    rlca
    ld   [label_170F], sp
    jr   label_BAF76
    jr   nc, label_BAF98
    ld   [hl], b
    db   $E3 ; Undefined instruction
    db   $FC ; Undefined instruction
    sbc  a, e
    db   $FC ; Undefined instruction
    adc  a, [hl]
    rst  $38
    add  a, e
    rst  $38
    add  a, b
    rst  $38
    ld   h, b
    ld   a, a

label_BAF56::
    inc  e
    rra
    ld   b, $07
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ret  nz
    ret  nz
    or   b
    ld   [hl], b
    call z, label_FA3C
    ld   b, $F5
    rrca
    ret
    ccf
    pop  de
    ccf
    or   c
    rst  $38
    ld   b, d
    cp   $44
    db   $FC ; Undefined instruction

label_BAF76::
    ld   c, b
    ld    hl, sp+$50
    ld   a, [$FFE0]
    ld   [rJOYP], a
    nop
    nop
    nop
    ret  nz
    ret  nc
    ret  nz
    ret  z
    nop
    ld   [$0039], sp

label_BAF88::
    ld   [hl], a
    jr   c, label_BAF88
    dec  de
    db   $F4 ; Undefined instruction
    cp   e
    ld   a, [hl]
    pop  bc
    or   a
    ld   l, b
    ld   a, a
    ld   h, $DF
    ld   l, [hl]
    xor  a
    db   $CF

label_BAF98::
    rst  8
    inc  sp
    ld   c, a
    ccf
    jr   nc, label_BAFAD
    rrca
    nop
    nop
    nop
    ld   [hl], b
    nop
    ret  nc
    ld   h, b
    ret  nc
    ld   [$FFC8], a
    jr   nc, label_BAF56
    ret  nc
    rra

label_BAFAD::
    db   $E3 ; Undefined instruction
    call z, label_FB37
    rlca
    ei
    rlca
    db   $EC ; Undefined instruction
    ld   d, a
    rst  $28
    di
    db   $DB
    ld   [$FF38], a
    ret  nz
    ld   [hl], h
    cp   b
    or   d
    inc  e
    nop
    ret  nc
    nop
    ret  z
    nop
    ld   [$0039], sp

label_BAFC8::
    ld   [hl], a
    jr   c, label_BAFC8
    dec  de
    db   $F4 ; Undefined instruction
    cp   e
    ld   a, [hl]
    pop  bc
    or   a
    ld   l, b
    rst  $38
    and  a
    rst  $18
    rst  $28
    xor  a
    ld   e, [hl]
    ld   c, a
    ld   sp, label_3F4F
    jr   nc, label_BAFED
    rrca
    nop
    nop
    nop
    ld   [hl], b
    nop
    ld   a, [$FF60]
    ld   a, [$FFE0]
    ld    hl, sp+$30
    cp   e
    ret  nc
    rra

label_BAFED::
    ld  [$FF00+C], a
    call label_FB36
    ld   b, $FB
    ld   b, $ED
    ld   d, [hl]
    rst  $28

label_BAFF7::
    ld   a, [$FF00+C]
    ld   [$FF38], a
    ret  nz
    ld   a, h
    cp   b
    cp   [hl]
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

label_BB009::
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
    nop
    ld   b, $01
    ld   a, [bc]
    dec  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, $0003
    call z, label_3303
    rst  8
    ld   c, a
    cp   h
    sbc  a, a
    ld   [hl], b
    cp   a
    ld   h, b
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    cp   $81
    db   $FD ; Undefined instruction
    add  a, e
    ld   a, [bc]
    dec  b
    ld   b, $01
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0102
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
    db   $FD ; Undefined instruction
    add  a, e
    cp   $81
    ld   a, a
    ret  nz
    ld   a, a
    ret  nz
    db   $3E
    ld   a, $BE
    ld   a, a
    rst  $38
    ld   h, a
    rst  $38
    ld   h, e
    cp   [hl]
    ld   [hl], e
    ld   e, l
    ld   a, $3E
    nop
    ld   c, b
    jr   nc, label_BB009
    ld   h, b
    or   b
    ld   h, b
    or   b
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
    ld   [hl], c
    nop
    adc  a, d
    ld   [hl], c
    push hl
    ld   a, e
    ld   [hl], a
    dec  bc
    rrca
    ld   [bc], a
    rlca
    ld   [bc], a
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
    ld   bc, label_200
    ld   bc, $0033
    ld   c, h
    inc  sp
    di
    rrca
    rst  $18
    db   $EC ; Undefined instruction
    rst  $28
    ld   a, [$FFFF]
    jr   nc, label_BB0B8
    jr   nc, label_BB0BA
    ld   [hl], b
    xor  $F1
    db   $E3
    db   $E3 ; Undefined instruction
    ld   a, [bc]
    dec  b
    dec  b
    inc  bc
    ccf
    inc  bc
    ld   b, a
    dec  sp
    adc  a, a
    ld   [hl], e

label_BB0CA::
    push de
    ld   h, e
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

label_BB0D6::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_BB0E0::
    db   $E3
    db   $E3 ; Undefined instruction
    xor  $F1
    rst  $38
    jr   nc, label_BB0E6
    jr   nc, label_BB0D6
    ld   a, $FE
    rst  $38

label_BB0EC::
    ccf
    db   $E3 ; Undefined instruction
    cp   a
    ld   h, e
    ld   a, [hl]
    ccf
    ld   e, l
    ld   a, $3E
    ld   bc, label_815
    inc  h
    jr   label_BB15F
    jr   c, label_BB145
    jr   nc, label_BB12F
    nop
    rst  $20
    nop

label_BB102::
    cp   b
    ld   b, a
    rst  $20
    rra
    ld   c, a
    jr   c, label_BB168
    jr   nc, label_BB0CA
    ld   h, b
    cp   [hl]
    ld   h, c
    cp   l
    ld   h, e
    cp   l
    ld   h, e
    cp   [hl]
    ld   h, c
    cp   a
    ld   h, b
    ld   e, a
    jr   nc, label_BB168
    jr   c, label_BB102
    rra
    cp   b
    ld   b, a
    rst  $20
    nop
    nop
    nop
    ld   [hl], e
    nop
    ld   e, h
    inc  hl
    ld   [hl], e
    rrca
    daa
    inc  e
    cpl
    jr   label_BB18C
    jr   nc, label_BB18D

label_BB12F::
    ld   sp, label_315E
    ld   e, a
    jr   nc, label_BB164
    jr   label_BB15E
    inc  e
    ld   [hl], e
    rrca
    ld   e, h
    inc  hl
    ld   [hl], e
    nop
    nop
    nop
    ld   bc, label_300
    ld   bc, $0103
    rrca
    ld   bc, label_D12
    rla
    ld   [$007F], sp
    rst  $30
    ld   a, c
    rst  $30
    ld   a, c
    ld   a, a
    nop
    rla
    ld   [label_D12], sp
    rrca
    ld   bc, $0103
    inc  bc
    ld   bc, $0001
    nop
    nop
    jr   nc, label_BB164

label_BB164::
    ld   a, c
    jr   nc, label_BB1DE
    add  hl, sp

label_BB168::
    inc  hl
    dec  e
    inc  de
    inc  c
    rra
    nop
    ccf
    add  hl, de
    ccf
    add  hl, de
    rra
    nop
    inc  de
    inc  c
    inc  hl
    dec  e
    ld   [hl], a
    add  hl, sp
    ld   a, c
    jr   nc, label_BB1AD
    nop
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction

label_BB18C::
    ldi  [hl], a

label_BB18D::
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a

label_BB1AD::
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00

label_BB1DE::
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38

label_BB1F4::
    ldi  [hl], a
    db   $14
    inc  d
    db   $EB ; Undefined instruction
    ld   [label_14F7], sp
    db   $EB ; Undefined instruction
    ldi  [hl], a
    db   $00
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    jr   nc, label_BB237
    ld   c, b
    ld   b, b
    add  a, b
    nop
    add  a, b
    ld   e, $01
    ccf
    nop
    daa
    jr   label_BB216
    inc  h
    ld   bc, $0002
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

label_BB223::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    ld   [$8403], sp
    ret  nz
    jr   nz, label_BB223
    ld   [$00FF], sp
    rst  $38

label_BB237::
    nop
    ccf
    ret  nz
    rrca
    jr   nc, label_BB23D

label_BB23D::
    rrca
    nop
    nop
    nop
    inc  a
    inc  c
    ld   [hl], d
    ld   a, [de]
    db   $FD ; Undefined instruction
    dec  a
    cp   $1C
    rst  $38
    inc  c
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
    ld   bc, label_21E
    dec  c
    nop
    nop
    nop
    nop
    rlca
    nop
    ld   a, [bc]
    rlca
    ld   c, $07
    rrca
    sub  a, b
    sbc  a, a
    ld   b, b
    sbc  a, a
    ld   b, b
    ld   e, a
    add  a, b
    ld   c, a
    sub  a, b
    ld   b, a
    adc  a, b
    ld   b, b
    add  a, e
    add  a, e
    ld   d, e
    adc  a, b
    inc  d
    inc  b
    sbc  a, e
    inc  bc
    inc  c
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
    ld   bc, label_201
    inc  bc
    inc  bc
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
    nop
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
    inc  b
    rlca
    ld   [label_B0F], sp
    rrca
    rrca
    rrca
    rrca
    rrca
    rlca
    rlca
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
    rrca
    rrca
    db   $10
    db   $1F
    jr   nz, label_BB309
    daa
    ccf
    cpl
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    rra
    rra
    rrca
    rrca
    nop
    nop
    nop
    nop
    rra
    rra
    jr   nz, label_BB323
    ld   b, b
    ld   a, a
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
    ld   a, a
    ccf
    ccf
    rra

label_BB2FF::
    rra
    nop
    nop
    nop
    nop
    ld   h, b
    nop
    jr   label_BB308

label_BB308::
    ld   c, $00
    inc  bc
    nop
    ld   bc, $0000
    nop
    nop
    ld   [bc], a
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

label_BB323::
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
    ld   h, b
    nop
    jr   nc, label_BB334

label_BB334::
    sbc  a, b
    ld   b, b
    ld   c, h
    jr   nz, label_BB35F
    db   $10
    db   $13
    ld   [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], b
    nop
    inc  a
    nop
    rra
    nop
    rrca
    nop
    rlca
    nop
    inc  bc
    db   $10
    db   $01
    ld   [label_204], sp
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_BB35F::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [label_400], sp
    nop
    ld   [bc], a
    add  a, b
    ld   [bc], a
    ret  nz
    ld   bc, label_B81A0
    ret  nc
    ld   hl, $00F8
    ld   a, h
    nop
    ld   e, $80
    rst  0
    jr   nz, label_BB3AC
    ld   [bc], a
    nop
    ld   bc, $0000
    rra
    nop
    ccf
    nop
    ld   e, a
    jr   nz, label_BB406
    nop
    ccf
    nop
    ccf
    nop
    rra
    nop
    rrca
    ld   b, b
    rlca
    jr   nz, label_BB3A6
    ld   [label_409], sp
    inc  b
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
    ld   [label_4C0], sp
    ld  [$FF00+C], a
    nop

label_BB3A6::
    pop  af
    nop
    ld   sp, hl
    nop
    ld   a, h
    pop  bc

label_BB3AC::
    cp   h
    ld   h, b
    sbc  a, $20
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    dec  e
    add  a, d
    rst  0
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    db   $10
    db   $07
    nop
    ld   [$0007], sp
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
    inc  bc
    add  a, b
    nop
    ld   h, b
    add  a, b
    rra
    ld   h, b
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
    nop

label_BB406::
    nop

label_BB407::
    nop
    nop

label_BB409::
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, label_304
    ld   [label_1006], sp
    inc  c
    db   $10
    db   $0B
    ld   hl, label_2316
    inc  d
    ld   b, a
    jr   c, label_BB46B
    inc  sp
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  e
    inc  bc
    ld   h, b
    inc  e
    add  a, b
    ld   h, b
    nop
    add  a, b
    nop
    rra
    nop
    ld   a, a
    rrca
    ld   a, [$FF7F]
    add  a, b
    ld   a, [$FF0F]
    ret  nz
    ccf
    nop
    ld   a, [$FF00]
    add  a, b
    ret  z
    ld   [hl], $D0
    inc  l
    ret  nc
    jr   z, label_BB407
    jr   c, label_BB409
    jr   c, label_BB4AB
    inc  e
    ld   h, b
    ld   e, $30
    rrca
    jr   c, label_BB459
    inc  e
    inc  bc
    ld   c, $01
    rlca
    nop
    inc  bc

label_BB459::
    nop
    nop
    nop
    nop
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
    inc  c
    inc  bc
    ld   de, label_230F
    dec  e
    daa
    jr   label_BB498
    ret  c
    daa
    ret  c
    dec  hl
    call c, label_BAF94
    rst  $28
    inc  de
    rst  $38
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
    nop
    nop
    ld   bc, label_200
    ld   bc, label_304
    inc  b
    ld   [bc], a
    ld   [label_806], sp
    inc  b
    db   $10
    db   $0C

label_BB498::
    db   $10
    db   $09
    jr   nc, label_BB4A7
    ld   sp, label_330E
    inc  c
    nop
    nop
    rrca
    nop
    jr   nc, label_BB4B5
    ld   b, b

label_BB4A7::
    inc  a
    add  a, b
    ld   [hl], b
    nop

label_BB4AB::
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

label_BB4B5::
    ccf
    nop
    rst  $38
    rra
    ld   [$FF7F], a
    add  a, b
    ld   [rNR23], a
    add  a, b
    ld   h, b
    inc  sp
    inc  c
    ld   [hl], $09
    inc  [hl]
    ld   a, [bc]
    inc  [hl]
    ld   a, [bc]
    jr   nc, label_BB4D8
    jr   c, label_BB4D2
    jr   label_BB4D5
    inc  e
    inc  bc
    inc  c
    inc  bc

label_BB4D2::
    ld   c, $01
    rlca

label_BB4D5::
    nop
    inc  bc
    nop

label_BB4D8::
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
    ret  nz
    nop
    ld   a, [$FF00]
    rst  $38
    add  a, b
    ld   a, a
    ld   [$FF1F], a
    rst  $38
    nop
    ccf
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ld   [$FF1F], a
    nop
    ld   [rJOYP], a
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
    rlca
    nop
    jr   label_BB52B
    jr   nz, label_BB545
    ld   b, c
    ccf
    ld   b, e
    ccf
    add  a, a

label_BB52B::
    ld   a, c
    adc  a, a
    ld   [hl], b
    adc  a, a
    ld   [hl], b
    adc  a, a
    ld   [hl], b
    adc  a, a
    ld   [hl], b
    ld   d, a
    cp   b
    ld   e, e
    inc  a
    cpl
    ld   e, a
    dec  de
    rst  $20
    rst  $38
    nop
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop

label_BB545::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp   label_3C00
    jp   label_BBE00
    nop
    nop
    nop
    nop
    nop
    jp   label_BBE81
    rst  $38
    nop
    ld   a, h
    add  a, e
    nop
    rst  $38
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
    ld   a, [hl]
    nop
    rst  $38
    nop
    rst  $38

label_BB574::
    ld   a, [hl]
    add  a, c
    rst  $38
    nop
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
    add  a, b
    nop
    ld   h, b
    add  a, b

label_BB592::
    jr   label_BB5F4
    rlca

label_BB595::
    jr   label_BB597

label_BB597::
    rst  8
    add  a, b
    ld   h, b
    ret  nz
    jr   c, label_BB595
    rlca

label_BB59E::
    ccf
    ret  nz
    rlca
    ld   a, b
    nop
    rra
    nop
    rlca
    nop
    nop
    nop
    inc  bc
    nop
    rrca
    inc  bc
    inc  a
    ld   c, $70
    jr   label_BB592
    jr   nc, label_BB574
    ld   h, b
    add  a, b
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
    rlca
    ld   a, b
    nop
    rra
    inc  bc
    inc  b
    rrca
    db   $10
    db   $18
    inc  h
    jr   nc, label_BB614
    jr   nz, label_BB59E
    ld   h, b
    sub  a, b
    ld   h, b
    sub  a, b
    ret  nz
    jr   nz, label_BB595
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
    rst  $38
    nop
    nop
    rst  $38
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
    rst  $38
    nop
    rst  $38

label_BB5F4::
    nop
    rst  $38
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
    ld   bc, label_300
    ld   bc, $0103
    ld   h, e
    ld   bc, label_BA1F3
    ei
    ld   [hl], c
    ld   a, a
    add  hl, sp
    ccf
    rrca
    rrca
    rlca
    rrca
    inc  bc

label_BB614::
    ld   a, a
    rrca
    rst  $38
    ld   a, a
    rst  $38
    ld   a, b
    ld   a, a
    rlca
    ld   a, a
    dec  e
    cp   a
    ld   e, b
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    call z, label_DE80
    adc  a, h
    cp   $9C
    db   $FC ; Undefined instruction
    cp   b
    ld    hl, sp+$70
    cp   $60
    rst  $38
    xor  $FF
    call c, label_B0FF
    rst  $38
    ld   a, e
    rst  $38
    db   $DB
    rst  $38
    jp   label_CDF3
    ld   c, $00
    dec  e
    ld   c, $1D
    ld   c, $11
    ld   c, $0E
    nop
    ld   b, $00
    inc  bc
    nop
    rra
    nop
    ccf
    nop
    ld   l, e
    inc  e
    rst  $38
    nop
    rst  $18
    ld   h, a
    rst  $38
    xor  [hl]
    rst  $38
    dec  a
    cp   a
    ld   e, e
    rst  $38
    dec  de
    sbc  a, l
    ld   h, d
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    add  a, d
    ld   a, l
    add  a, l
    ld   a, d
    ld   b, l
    db   $3A ; ldd  a, [hl]
    ld   b, l
    db   $3A ; ldd  a, [hl]
    inc  h
    dec  de
    inc  e
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0102
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    rst  $20
    dec  e
    ld   l, c

label_BB683::
    sub  a, [hl]
    db   $E4 ; Undefined instruction
    ld   e, e
    db   $F4 ; Undefined instruction
    ld   c, e
    ld   a, [$FF00+C]
    pop  af
    xor  $F8
    rla
    inc  a

label_BB68F::
    db   $DB
    ccf
    call c, label_BF7F
    ld   a, a
    or   c
    ld   [hl], e
    adc  a, l
    inc  bc
    db   $FC ; Undefined instruction
    ret  nz
    ccf
    jr   nc, label_BB6AD
    rrca
    nop
    rst  $38
    pop  de
    ei
    push de
    rst  $38
    ld   [bc], a
    db   $76 ; Halt
    cp   c
    add  a, b
    rst  $38
    rst  $38
    nop
    db   $D3 ; Undefined instruction

label_BB6AD::
    inc  l
    sub  a, d
    ld   l, l
    sub  a, d
    ld   l, l
    rst  $10
    ld   l, h
    rst  $28
    ld   a, l
    cp   e
    ld   a, l
    push bc
    db   $3A ; ldd  a, [hl]
    jr   c, label_BB683
    nop
    rst  $38
    jp   label_3C
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, a
    nop
    ret  c
    rlca

label_BB6D6::
    ld   [$FF1F], a
    ld   [$FFDF], a
    db   $EC ; Undefined instruction
    db   $D3 ; Undefined instruction
    rst  $38
    call z, label_CFFF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   label_BB6D6
    inc  b
    ld    hl, sp+$04
    ld    hl, sp+$C2
    inc  a
    ld  [$FF00+C], a
    call c, label_DEE1
    rst  $38
    add  a, c
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   a, a
    ld   a, a
    add  a, a
    ld   e, a
    xor  a
    cp   a
    ld   e, a
    ld   a, a
    cp   c
    rst  $38
    ld   [hl], c
    ei
    ld   [hl], l
    rst  $38
    add  hl, bc
    rst  $38
    sbc  a, c
    rst  $18
    and  c
    jp   label_13D
    cp   $06
    ld    hl, sp+$F8
    nop
    db   $FD ; Undefined instruction
    jp   nz, label_BBAFD
    db   $FD ; Undefined instruction
    cp   d
    cp   $D8
    rst  $38
    xor  $FF
    xor  $FF
    db   $F4 ; Undefined instruction
    cp   $B8
    cp   $9C
    cp   $8C
    db   $EC ; Undefined instruction
    add  a, b
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
    and  l
    ld   e, d
    add  a, d
    ld   a, h
    and  h
    ld   a, b
    xor  b
    ld   [hl], b
    ld   [hl], h
    jr   c, label_BB7A5
    inc  a
    dec  l
    ld   e, $1F
    ld   c, $1F
    ld   c, $3E
    inc  e
    ld   a, h
    jr   c, label_BB7CF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  bc
    rlca
    rla
    inc  c
    rla
    inc  c
    inc  de
    rrca
    ld   [label_707], sp
    nop
    ld   [bc], a
    ld   bc, $0106
    ld   a, [bc]
    dec  b
    ld   d, $0D
    dec  [hl]
    ld   c, $53
    cpl
    ld   l, b
    scf
    or   a
    ld   a, b
    sbc  a, b
    ld   h, a
    cp   a
    ld   e, e
    cp   $3D
    cp   $35
    cp   [hl]
    ld   e, l
    sbc  a, h
    ld   h, e

label_BB79A::
    ld   b, b
    ccf
    jr   nc, label_BB7AD
    rrca
    nop
    nop
    nop
    nop
    nop
    nop

label_BB7A5::
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0001
    nop
    nop
    nop
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0106
    ld   a, [bc]
    dec  b
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   a, h
    ld   a, [$FFFE]
    adc  a, h
    db   $FD ; Undefined instruction
    add  a, [hl]
    ld   a, l

label_BB7CF::
    add  a, $3D
    cp   $82
    ld   a, h
    db   $FC ; Undefined instruction
    nop
    db   $10
    db   $E0
    jr   nz, label_BB79A
    ld   b, b
    add  a, b
    ld   h, b
    add  a, b
    ld   d, b
    and  b
    ld   c, $05
    dec  de
    ld   b, $29
    rla
    inc  [hl]
    dec  de
    ld   a, e
    inc  l
    ld   a, h
    cpl
    ld   [hl], a
    cpl
    ld   [hl], c
    ld   l, $73
    dec  l
    ld   h, a
    dec  de
    ld   b, a
    db   $3A ; ldd  a, [hl]
    ld   b, a
    dec  sp
    inc  hl
    dec  e
    ld   hl, label_181E
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
    ld   [bc], a
    ld   bc, $0102
    dec  b
    inc  bc
    dec  b
    inc  bc
    dec  b
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
    rlca
    nop
    jr   label_BB835
    ld   h, a
    rra
    sbc  a, a
    ld   a, b
    ccf
    ld   [$FF7F], a

label_BB835::
    ret  nz
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    nop
    cp   $01
    db   $FD ; Undefined instruction
    inc  bc
    dec  b
    inc  bc
    dec  b
    inc  bc
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0102
    ld   bc, $0100
    nop
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
    rst  $38
    nop
    rst  $38
    rlca
    cp   $8F
    db   $FD ; Undefined instruction
    adc  a, [hl]
    ld   [hl], l
    adc  a, $3F
    and  $FB
    ld   b, $FF
    ld   [hl], d
    rst  $38
    ld   a, [$CAFF]
    ld   [hl], a

label_BB875::
    jp   z, label_BB68F
    ld   [hl], a
    ld   c, $13
    ld   c, $09
    ld   b, $06
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  bc
    rlca
    rla
    rrca
    rla
    add  hl, bc
    scf
    add  hl, bc
    ld   c, e
    scf
    sbc  a, a
    ld   a, b
    cp   a
    ld   a, a
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
    rlca
    nop
    jr   label_BB8B5
    ld   h, e
    rra
    rst  8
    inc  a
    rst  $18
    or   b
    rst  $38

label_BB8B5::
    and  b
    rst  $38
    add  a, b
    rst  $28
    inc  e
    cp   a
    ld   a, [hl]
    rst  $20
    cp   $FB
    ld   b, $0E
    ld   bc, label_E1F
    ccf
    rra
    ccf
    inc  de
    ld   l, $13

label_BB8CA::
    ld   de, label_1F0E
    ld   bc, label_F17
    rla
    ld   c, $13
    dec  c
    dec  c
    inc  bc
    inc  b
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    inc  e
    rst  $38
    ld   a, $E3
    ccf
    xor  e
    ld   [hl], a
    di
    ld   l, a
    rst  $38
    sbc  a, $F7
    cp   b
    rst  $38
    ld   h, b
    cp   $DD
    rst  $38
    cp   [hl]
    rst  $38
    and  [hl]
    ld   e, l
    and  [hl]
    ld  [$FF00+C], a
    inc  e
    inc  e
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    jr   label_BB90B
    daa
    rra
    ld   c, a
    jr   c, label_BB968
    jr   nc, label_BB8CA

label_BB90B::
    ld   h, b
    cp   [hl]
    ld   h, c
    cp   l
    ld   h, e
    cp   l
    ld   h, e
    cp   [hl]
    ld   h, c
    cp   a
    ld   h, b
    ld   e, a
    jr   nc, label_BB968
    jr   c, label_BB942
    rra
    jr   label_BB925
    rlca
    nop
    nop
    nop
    inc  bc
    nop
    inc  c

label_BB925::
    inc  bc
    inc  de
    rrca
    daa
    inc  e
    cpl
    jr   label_BB98C
    jr   nc, label_BB98D
    ld   sp, label_315E
    ld   e, a
    jr   nc, label_BB964
    jr   label_BB95E
    inc  e
    inc  de
    rrca
    inc  c
    inc  bc
    inc  bc
    nop
    nop
    nop
    ld   bc, label_301
    ld   [bc], a
    ccf
    dec  a
    ccf
    ld   hl, label_283F
    ccf
    ld   h, $7B
    ld   b, [hl]
    rst  $38
    or   b
    rst  8
    or   b
    ld   a, a
    ld   b, [hl]
    dec  a
    ld   h, $3F
    jr   z, label_BB997
    ld   hl, label_3D3E
    inc  bc
    ld   [bc], a

label_BB95E::
    ld   bc, label_BBF01
    jr   c, label_BB962
    ld   a, h

label_BB964::
    rst  $38
    ld   h, h
    cp   e
    ld   h, h

label_BB968::
    ld   b, a
    jr   c, label_BB9A4
    ld   b, $17
    ld   c, $17
    ld   c, $09
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
    dec  b
    inc  bc
    dec  b
    inc  bc
    rlca
    nop
    rrca
    rlca
    rra
    rrca
    rra
    add  hl, bc

label_BB98C::
    rla

label_BB98D::
    add  hl, bc
    ld   [label_F07], sp
    nop
    dec  bc
    rlca
    dec  bc
    rlca
    rlca

label_BB997::
    inc  bc
    inc  bc
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
    rlca

label_BB9A4::
    db   $FC ; Undefined instruction
    rrca
    ei
    inc  e
    db   $F4 ; Undefined instruction
    sbc  a, b
    db   $F4 ; Undefined instruction
    cp   b
    ld   l, [hl]
    or   h
    sbc  a, $60
    and  b
    ret  nz
    ld   [$FF80], a
    ld   a, [$FF60]
    ld   [rJOYP], a
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
    dec  de
    rlca
    cpl
    rra
    ld   e, a
    inc  sp
    ld   [hl], e
    dec  l
    xor  l
    ld   e, [hl]
    db   $EC ; Undefined instruction
    ld   e, a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   a, [$FF6F]
    cp   b
    ld   [hl], a
    ld   a, h
    dec  sp
    ld   e, [hl]
    dec  a
    cpl
    ld   e, $1B
    rlca
    rlca
    nop
    rlca
    nop
    dec  de
    rlca
    cpl
    rra
    ld   e, a
    ccf
    ld   a, a
    ccf
    cp   a
    ld   a, c
    ld   sp, hl
    db   $76 ; Halt
    ld   a, [$F877]
    ld   [hl], a
    db   $FC ; Undefined instruction
    ld   a, e
    cp   [hl]
    ld   a, l
    ld   a, a
    ld   a, $5F
    ccf
    cpl
    rra
    dec  de
    rlca
    rlca
    nop
    nop
    nop
    nop
    nop

label_BBA04::
    ld   [bc], a
    nop
    rlca
    ld   [bc], a
    rlca
    inc  bc
    rlca
    inc  bc
    cpl
    rlca
    ld   a, a
    daa
    ld   a, [hl]
    daa
    ld   l, $07
    ld   c, $07
    rrca
    rlca
    cpl
    rlca
    ld   a, [hl]
    cpl
    ld   a, h
    ccf
    ld   a, h
    ccf
    stop
    jr   c, label_BBA34
    add  hl, sp
    db   $10
    db   $3B
    ld   de, label_193
    add  a, a
    inc  bc
    rst  0
    add  a, e
    rst  $28
    rst  0
    db   $FD ; Undefined instruction
    rst  $28
    ld   a, e
    rst  $38

label_BBA34::
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, b
    rst  $38
    jr   nc, label_BBA3B
    jr   nc, label_BBA3D
    jr   nz, label_BBA3F
    ld   b, b
    nop
    pop  hl
    ld   b, b
    di
    pop  hl
    or   a
    db   $E3 ; Undefined instruction
    or   [hl]
    db   $E3 ; Undefined instruction
    ld   a, $F7
    inc  e
    rst  $38
    inc  e
    rst  $38
    inc  e
    rst  $38
    cp   [hl]
    rst  $38
    cp   a
    rst  $38
    rst  $38
    rst  $38
    ei
    rst  $38
    di
    rst  $38
    inc  sp
    rst  $38
    ld   hl, label_4FF
    nop
    ld   c, $04
    sbc  a, [hl]
    inc  c
    sub  a, $8C
    call z, label_C080
    add  a, b
    ld   [$FFC0], a
    db   $E4 ; Undefined instruction
    ret  nz
    xor  $C4
    cp   $E4
    rst  $38
    xor  $FF
    cp   $FB
    cp   $BB
    cp   $3B
    cp   $1F
    cp   $F9
    ld   a, a
    ld   a, [$D17F]
    ld   a, [hl]
    pop  de
    ld   a, [hl]
    pop  af
    ld   a, [hl]
    db   $EC ; Undefined instruction
    ld   [hl], e
    xor  $71
    and  $79
    ld   h, a
    jr   c, label_BBB0A
    jr   c, label_BBAC8
    inc  e
    add  hl, sp
    ld   e, $1C
    rrca
    rrca
    rlca
    rlca
    ld   bc, $0001
    ld   [rIE], a
    ld   a, [$FF1F]
    db   $FC ; Undefined instruction
    rrca
    cp   $07
    ei
    daa
    ei
    rlca
    ld   [hl], a
    adc  a, a
    rra
    rst  $38
    rst  $30
    ld    hl, sp+$6F
    ld   a, [$FF9F]
    ld   h, b
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, [$FF0F]
    rlca
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    ld   bc, label_700
    nop
    rrca
    nop
    ld   e, $01

label_BBAC8::
    dec  d
    dec  bc
    dec  h
    ld   a, [de]
    ld   hl, label_2D1E
    ld   e, $3E
    inc  de
    ccf
    ld   de, label_103F
    rra
    ld   [label_E1D], sp
    rrca
    rlca
    rlca
    ld   bc, $0001
    cp   $00
    rst  $38
    nop
    rrca
    ld   a, [$FFF7]
    ld    hl, sp+$FB
    inc  c
    ei
    inc  b
    ld   a, [$F925]
    rlca
    di
    rrca
    adc  a, a
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    nop
    db   $FC ; Undefined instruction
    inc  bc
    inc  bc
    rst  $38
    rst  $38

label_BBAFD::
    rst  $38
    rst  $38
    nop
    nop
    nop
    nop

label_BBB03::
    nop
    jr   label_BBB06

label_BBB06::
    inc  e
    ld   [label_C1E], sp

label_BBB0A::
    rrca
    ld   b, $0A
    rlca
    inc  b
    inc  bc
    inc  b
    inc  bc
    inc  b
    inc  bc
    ld   [$0107], sp
    ld   l, $00
    daa
    nop
    jr   nc, label_BBB1D

label_BBB1D::
    inc  e
    nop
    nop
    nop
    nop
    ld   b, b
    nop
    pop  hl
    ld   b, b
    db   $E3 ; Undefined instruction
    ld   b, c
    push de
    ld   h, e
    db   $F4 ; Undefined instruction
    ld   h, e
    xor  b
    ld   [hl], a
    cp   e
    ld   [hl], h
    adc  a, a
    ld   [hl], b
    adc  a, [hl]
    ld   [hl], c
    adc  a, [hl]
    ld   [hl], c
    ld   b, $F9
    inc  b
    ei
    nop
    rrca
    nop
    db   $E3 ; Undefined instruction
    nop
    jr   label_BBB41

label_BBB41::
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
    ld   e, $01
    ld   a, $1F
    ld   bc, $003F
    rra
    ld   b, $09
    ld   a, [bc]
    rlca
    inc  d
    rrca
    db   $10
    db   $0F
    nop
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
    call nz, label_A503
    jp   label_E758
    nop
    rst  $38
    rrca
    ld   a, [$FF3F]
    ret  nz
    call z, label_20F3
    rst  $38
    ld   bc, $00DF
    rlca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    ld   bc, label_3300
    ld   bc, label_317B

label_BBB8A::
    ld   c, [hl]
    add  hl, sp
    ld   h, $1D
    db   $10
    db   $0F
    inc  a
    inc  bc
    ld   a, a
    inc  a
    ld   b, b
    ccf
    dec  a
    inc  bc
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
    ld   bc, label_300
    ld   bc, $0102
    ld   h, c
    nop
    ld   a, [$FF60]
    adc  a, b
    ld   [hl], b
    ld   [hl], b
    nop
    nop
    nop
    jr   c, label_BBBB6

label_BBBB6::
    ld   l, b
    jr   nc, label_BBB8A
    ld   h, b
    sub  a, e
    ld   h, c
    ld   h, d
    ld   bc, $0001
    inc  bc
    nop
    db   $F4 ; Undefined instruction
    inc  bc
    db   $DB
    ld   h, h
    ld   l, h
    inc  sp
    add  hl, sp
    rlca
    ld   a, e
    rlca
    rst  $20
    dec  de
    db   $DB
    dec  a
    db   $26
    ld   h, $6E
    dec  de
    ld   e, a
    dec  sp
    cp   e
    ld   [hl], l
    db   $FD ; Undefined instruction
    ld   h, [hl]
    and  $43
    ld   b, e
    nop
    nop
    nop
    add  a, a
    nop
    call z, label_BBB03
    add  a, h
    or   h
    ld   c, e
    res  6, h
    rst  $38
    call nz, label_27FF
    rst  $38
    daa
    rst  $38
    ld   [$FFEE], a
    rra
    ld   a, a
    rst  $38
    rst  $38
    di
    rst  $38
    nop
    cp   $65
    rst  $38
    jr   nz, label_BBC2F
    nop

label_BBC00::
    nop
    nop
    nop
    nop
    ld   c, $00
    rla
    ld   c, $2C
    dec  de
    inc  a
    inc  de
    ld   c, h
    scf
    ld   c, b
    ccf
    add  a, b
    ld   a, a
    add  a, c
    ld   a, a
    add  a, e
    ld   a, a
    rst  8
    ld   a, [hl]
    rst  $38
    ld   a, b
    db   $FC ; Undefined instruction
    ld   h, e
    ld   a, [$FF00+C]
    pop  hl
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    dec  bc
    inc  b
    rra
    nop
    rst  $38
    jr   label_BBC2A
    ret  nc
    rra
    or   $0F

label_BBC2F::
    ld   a, [$FF00+C]
    db   $E4 ; Undefined instruction
    sbc  a, a
    di
    call label_C2FE
    ld   a, l
    db   $FC ; Undefined instruction
    ld   [hl], e
    ld   [hl], b
    adc  a, a
    inc  b

label_BBC3D::
    ei
    ei
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$70
    ld    hl, sp+$20
    db   $FC ; Undefined instruction
    ld   [hl], b
    rst  $38
    ld    hl, sp+$FF
    rst  $38
    db   $DB
    scf
    db   $E4 ; Undefined instruction
    db   $DB
    and  $59
    ld   b, l
    cp   b
    ld   c, b
    or   b
    ld   [hl], b
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    rlca
    nop
    rrca
    rlca
    rra
    rrca
    ccf
    jr   label_BBCA8
    db   $10
    db   $3F
    inc  d
    ccf
    db   $10
    db   $3F
    dec  de
    ld   e, $07
    ccf
    rra
    ld   [hl], a
    add  hl, sp
    ld   c, a
    ld   a, $27
    rra
    ld   [hl], e
    rrca
    ld   sp, hl
    rlca
    rst  $18
    ld   [$FFE0], a
    nop
    ld   a, [$FFE0]
    ld    hl, sp+$F0
    db   $FC ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    ld   [hl], b
    rst  $38
    ret  nz
    rst  $38
    ld   a, $EF
    pop  af
    rst  $38
    ld   a, $FF
    rst  8
    rst  $38
    ld   a, [$FFFF]
    ld   [hl], b
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $20
    sbc  a, b
    di
    inc  c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_BBCA8::
    nop
    nop
    ld   [rJOYP], a
    db   $FC ; Undefined instruction
    nop
    cp   $00
    rst  $38
    nop
    rst  $20
    nop
    di
    nop
    rst  $38
    inc  bc
    ld   a, a
    add  a, e
    ccf
    pop  bc
    cp   a
    ld   d, c
    cp   a
    ld   e, [hl]
    rst  $38
    ld   [$FF7F], a
    ld   [rNR34], a
    pop  hl
    cp   a
    ld   b, b
    rst  $38
    nop
    ld   a, a
    nop
    ccf
    nop
    ccf
    nop
    ld   a, [de]
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
    ld    hl, sp+$07
    ld   a, b
    add  a, a
    add  hl, sp
    add  a, $01
    cp   $07
    ld    hl, sp+$00
    rst  $38
    add  a, b
    ld   a, a
    add  a, b
    ld   a, a
    nop
    rst  $38
    nop

label_BBCF3::
    rst  $38
    jr   label_BBCF5
    rst  $20
    rra
    jr   label_BBD01
    rlca
    nop
    nop
    nop
    nop
    nop
    inc  c

label_BBD01::
    rst  $38
    jr   label_BBCF3
    inc  hl
    call c, label_3BC4
    ld   c, $FF
    ld   e, $FF
    ld   c, $FF
    nop
    rst  $38
    ld   de, label_3FEE
    ret  nz
    ld   [$90F0], sp
    ld   [$FF60], a
    add  a, b
    add  a, b
    nop
    nop
    nop
    nop
    nop
    ld   a, b
    nop
    rst  $38
    nop
    rst  $38
    add  a, b
    cp   $98
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld    hl, sp+$C0
    ld   a, [hl]
    add  a, b
    db   $FD ; Undefined instruction
    ld   c, $F9
    ld   h, $FD
    ld   h, $F1
    ld   e, $F6
    ld   a, b
    ret  z
    jr   nc, label_BBDAB
    add  a, b
    ret  nz
    nop
    add  a, b
    nop
    ld   b, $00
    ld   c, $00
    ld   e, $00
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    ld   bc, label_FFF
    rst  $38
    ld   e, a
    rst  $38
    ld   e, a
    rst  $28
    ld   e, a
    rst  $38
    ld   l, a
    cp   a
    ld   l, a
    ld   [hl], a
    cpl
    ld   a, a
    scf
    ld   a, a
    scf
    ld   e, a
    scf
    nop
    nop
    inc  bc
    nop
    rra
    nop
    rst  $38
    nop
    rst  $38
    ld   a, h
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$FF
    ld   a, [$FFCF]
    db   $FC ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld    hl, sp+$F7
    cp   $EF
    cp   $FF
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FEF7]
    ld   a, [hl]
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    ld   a, [$FF00]
    ret  nz
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    ret  nz
    nop
    ld   a, [$FF00]
    ld   [rJOYP], a
    ret  nz
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   a, b
    rst  $38
    ld   a, [$FFFF]
    ccf
    ei

label_BBDAB::
    ld   a, a
    di
    rst  $38
    push hl
    ei
    inc  b
    ei
    call nz, label_B843B
    cp   e
    ld   c, h
    or   e
    ld   [hl], d
    add  a, c
    ld   b, a
    add  a, b
    adc  a, a
    nop
    rrca
    nop
    ccf
    rla
    dec  sp
    rla
    ccf
    dec  de
    cp   a
    dec  de
    cp   a
    dec  de
    cp   a
    dec  de
    rst  $38
    sbc  a, e
    rst  $38
    db   $DB
    rst  $38
    db   $DB
    ld   a, e
    rst  $10
    ld   l, a
    rst  $10
    ld   a, a
    add  a, a
    rst  $38
    rrca
    rst  $38
    rrca
    rst  $38
    rra
    rst  $38
    ld   e, $FF
    db   $FC ; Undefined instruction
    cp   $F8
    rst  $38
    ld   a, [$FFEF]
    ld    hl, sp+$FF
    ld    hl, sp+$FE
    ld   a, [$FFFF]
    ld    hl, sp+$FF
    ld    hl, sp+$FF
    ret  nz
    db   $FC ; Undefined instruction
    ld   [$FFF8], a
    ld   [$FFF8], a
    nop
    ld   [$FF80], a
    db   $EC ; Undefined instruction
    add  a, b
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop

label_BBE00::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [hl], $00
    ld   c, a
    ld   [hl], $D9
    ld   l, [hl]
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $38
    ld   l, h
    ld   a, [hl]
    inc  h
    inc  h
    nop
    nop
    nop
    ld   c, $00
    rrca
    ld   b, $07
    ld   [bc], a
    inc  bc
    nop
    nop
    nop
    rrca
    nop
    rrca
    inc  b
    rra
    rrca
    ld   a, a
    inc  bc
    rst  $18
    ld   l, l
    or   e
    sbc  a, $F9
    ld   b, $FD
    jp  c, label_B8BFD
    db   $FD ; Undefined instruction
    inc  bc
    and  a
    ld   e, c
    sbc  a, [hl]
    ld   h, c
    db   $FC ; Undefined instruction
    dec  de
    ld   a, [hl]
    adc  a, l
    cpl
    ret  nz
    ret  nz
    nop
    rst  $38
    ld   a, a
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
    dec  a
    rst  $18
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    db   $E3 ; Undefined instruction
    ld   a, h
    add  a, d
    ld   a, h
    call nz, label_BA4B8
    ret  c
    sbc  a, b
    ld   h, b
    sub  a, b
    ld   h, b
    ld   h, b
    nop
    rst  $38
    sub  a, b
    rst  $28
    or   b
    xor  $F0
    call c, label_BCE0
    ret  nz
    ld   c, $F0
    ld   c, $F0
    ld   e, $E0
    ld   a, b
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

label_BBE7C::
    nop
    nop
    nop
    nop
    ld   c, $00
    ccf
    nop
    ld   a, a
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $30
    ld   [label_18E7], sp
    or   $E9
    or   $E9
    ld   [hl], b
    rst  $28
    ld   [hl], b
    rst  8
    ld   [hl], b
    adc  a, a
    ld   a, [$FF0F]
    ld   a, [$FF0F]
    db   $FC ; Undefined instruction
    rra
    rst  $38
    ld   e, $00
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $00
    ld   a, [hl]
    add  a, b
    ld   [hl], a
    adc  a, b
    ld   [hl], a
    adc  a, b
    ld   h, [hl]
    sbc  a, b
    rrca
    ld   a, [$FF0E]
    ld   a, [$FF78]
    add  a, b
    inc  a
    ret  nz
    ld   a, h
    add  a, b
    rst  $38
    nop
    ret  nz
    nop
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    ld   a, b
    rst  $38
    ld   a, [$FFFF]
    ccf
    ei
    ld   a, a
    di
    rst  $38
    push hl
    ei
    dec  b
    ld   a, [label_3AC5]
    ld   b, a
    cp   b
    ld   c, a
    or   b
    ld   a, a
    add  a, b
    ld   e, a
    add  a, c
    sbc  a, a
    ld   bc, label_33F
    inc  bc
    nop
    rlca
    inc  bc
    rrca
    rlca
    rra
    inc  c
    rst  $38
    ld   [label_BB2FF], sp
    rst  $38
    ld   a, h
    rst  $38
    ld   a, [hl]
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
    db   $FD ; Undefined instruction
    cp   $FF
    rst  $38
    rst  $38
    rst  $38
    ld   [rJOYP], a
    ld    hl, sp+$E0
    db   $FC ; Undefined instruction
    ld    hl, sp+$FC

label_BBF07::
    jr   c, label_BBF07
    inc  a
    cp   $7C
    cp   $E0

label_BBF0E::
    db   $FC ; Undefined instruction
    add  a, b
    cp   $00
    cp   $80
    cp   $80
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
    db   $EC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    ccf
    rlca
    ld   e, a
    cpl
    ld   e, a
    cpl
    rst  $38
    rra
    rst  $38
    ld   e, a
    ei
    cp   a
    rst  $38
    dec  sp
    rst  $38
    or   e
    rst  $38
    ldi  [hl], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $28
    nop
    ld   l, $C0
    call z, label_FD00
    cp   $FF

label_BBF43::
    cp   $FF
    rst  $38
    ei
    db   $FD ; Undefined instruction
    rst  $38
    db   $FC ; Undefined instruction
    ld   a, a
    cp   $EF
    ld   a, [hl]
    rst  $38
    ld   l, [hl]
    rst  $38
    ld   c, [hl]
    rst  $38

label_BBF53::
    inc  b
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    ld   [hl], a
    nop
    db   $76 ; Halt
    nop
    ld   h, b
    nop
    rst  $38
    db   $10
    db   $EF
    jr   nc, label_BBF53

label_BBF65::
    jr   nc, label_BBF43
    jr   nz, label_BBF65
    nop
    adc  a, $30
    adc  a, $30
    sbc  a, [hl]
    ld   h, b
    ld    hl, sp+$00
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
    ld   bc, label_700
    nop
    dec  bc
    rlca
    rla
    rrca
    rra
    rrca
    ld   a, a
    rra
    rst  $38
    ld   h, b
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
    cp   $00
    cp   $00
    ld   a, h
    add  a, b
    cp   b
    ret  nz
    or   b
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
    ret  nz
    nop
    ld   [rJOYP], a
    ld   a, [$FF00]
    adc  a, b
    ld   [hl], b
    cp   b
    ld   [hl], b
    cp   e
    ld   [hl], b
    ld   a, a
    jr   nc, label_FFFF800E
    ld   b, $1F
    rrca
    rra
    dec  c
    rra
    dec  c
    rra
    ld   b, $0F
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    rra
    rlca
    ccf
    rra
    ld   a, a
    inc  hl
    ld   a, a
    ld   hl, label_257F
    ld   e, a
    ld   sp, label_D7F
    rst  $38
    rlca
    rst  $38
    ld   b, [hl]
    rst  $38
    ld   h, d
    rst  $30
    ld   l, b
    ld   a, e
    inc  b
    ld   [hl], h
    dec  de
    ei
    ld   a, h
    cp   $00
