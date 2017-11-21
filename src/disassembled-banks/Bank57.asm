section "bank57",romx,bank[$39]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_600
    ld   bc, label_708
    db   $10
    db   $0F
    ld   de, label_1F0E
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
    jr   nc, label_E4024

label_E4024::
    ld   a, a
    jr   nc, label_E4023
    ld   a, e
    ld   a, [hl]
    sbc  a, l
    rra
    xor  $0F
    or   $EF
    dec  d
    rst  $20
    db   $DB
    rst  $30
    ld   l, e
    rst  $30
    ld   l, e
    rst  $30
    ld   l, d
    sub  a, a
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    db   $EB ; Undefined instruction
    cp   $61
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
    db   $76 ; Halt
    rst  $38
    ld   b, [hl]
    adc  a, a
    db   $76 ; Halt
    ld   a, [hl]
    jr   c, label_E40E9
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
    jr   c, label_E4093

label_E408C::
    jr   nz, label_E40AD
    jr   nz, label_E40AF
    ld   de, label_F0E

label_E4093::
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
    ld   a, $DD
    rra

label_E40AF::
    db   $EC ; Undefined instruction
    rst  $18
    dec  hl
    rst  8
    or   a
    rst  $28
    sub  a, $EF
    sub  a, $EF
    call nc, label_D02F
    jp   hl
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
    jr   nc, label_E408C
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

label_E40E9::
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

label_E413F::
    nop
    nop
    nop
    nop
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

label_E4159::
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

label_E4166::
    ld   a, a
    jr   nc, label_E4159
    ld   l, a
    ld   [$FF5F], a
    ret  nz
    ccf
    ld   b, e
    cp   h
    ld   a, a
    add  a, e
    ld   a, a
    or   a
    ld   a, a
    or   a
    ld   a, a
    or   a
    ld   c, a
    cp   a
    ld   a, a
    or   b
    cp   a
    rra
    ld   e, a
    jr   nz, label_E4181

label_E4181::
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    ld   a, [$FF60]
    ld   a, b
    or   b
    jr   c, label_E415C
    db   $DB
    jr   nz, label_E4166
    xor  d
    rst  $30
    jp   z, label_E6AF7
    rst  $30
    ld   l, d
    rst  $30
    ld   l, d
    sub  a, [hl]
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $E8 ; add  sp, d
    ret  nz
    ret  nc
    jr   nz, label_E41A1

label_E41A1::
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
    nop
    nop
    add  a, b
    ld   a, a
    ret  nc
    cpl
    rst  $38
    jp   nz, label_DFE0
    rst  $38
    jr   c, label_E4248
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
    ld   [label_E48F0], sp
    or   b
    db   $FC ; Undefined instruction
    jr   label_E4223
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
    nop
    nop
    ld   bc, label_200
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0001
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0102
    nop
    nop
    nop

label_E4223::
    nop
    rlca
    nop
    inc  e
    rlca
    db   $E8 ; add  sp, d
    rra
    ld   c, c
    cp   [hl]
    ld   b, l
    cp   [hl]
    inc  bc
    db   $FD ; Undefined instruction
    ld   h, e
    cp   l
    rst  $18
    inc  hl
    rst  $38
    db   $DB
    rst  $38
    db   $DB
    rst  $38
    dec  de
    daa
    rst  $18
    ccf
    rst  $18
    rra
    rst  $20
    ld   [bc], a
    ld   bc, $0001
    ld   bc, $0000
    nop

label_E4248::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    daa
    ret  c
    ld   b, h
    cp   a
    db   $F4 ; Undefined instruction
    ld   l, a
    di
    ld   l, a
    pop  af
    ld   l, a
    ld   h, b
    rra
    ld   b, b
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
    nop
    nop
    nop
    nop
    ld   bc, label_200
    ld   bc, label_31D
    jr   nc, label_E42AD
    jr   c, label_E42AF
    ld   a, [hli]
    dec  e
    dec  h
    ld   a, [de]
    rra
    ld   [bc], a
    rlca
    ld   [bc], a

label_E4298::
    rlca
    ld   [bc], a
    rrca
    ld   b, $0E
    rlca
    rrca
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   [$E7F0], sp
    ld    hl, sp+$00

label_E42AD::
    rst  $38
    nop

label_E42AF::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jp   label_E63C
    db   $DB
    db   $ED ; Undefined instruction
    rst  $10
    ld   a, [hl]
    rst  0
    rst  $38

label_E42BF::
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
    add  a, b
    nop
    add  a, b
    nop
    ld   a, [$FF00]
    db   $10
    db   $E0
    db   $10
    db   $E0
    jr   nz, label_E4298
    and  b
    ld   b, b
    and  b
    ld   b, b
    ret  nz
    nop
    ld   h, b
    add  a, b
    rlca
    inc  bc
    inc  bc
    nop
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    inc  bc
    nop
    ld   [bc], a
    ld   bc, label_304
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
    db   $FC ; Undefined instruction
    di
    db   $FC ; Undefined instruction
    inc  bc
    ld   a, $DD
    ccf
    adc  a, $0F
    or   $07
    ld    hl, sp+$00
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

label_E4320::
    db   $10
    db   $E0
    ld   [label_8F0], sp
    ld   a, [$FF10]
    ld   [$FF60], a
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
    ld   bc, label_200
    ld   bc, label_31D
    jr   z, label_E436B
    jr   c, label_E436D
    ldd  [hl], a
    dec  e
    dec  h
    ld   a, [de]
    rra
    ld   [bc], a
    rlca
    ld   [bc], a

label_E4356::
    rlca
    ld   [bc], a
    rrca
    ld   b, $0E
    rlca
    rrca
    rlca
    rlca
    inc  bc

label_E4360::
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   [$E7F0], sp
    ld    hl, sp+$00

label_E436B::
    rst  $38
    nop

label_E436D::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jp   label_E63C
    db   $DB
    db   $ED ; Undefined instruction
    rst  $10
    ld   a, [hl]
    rst  0
    rst  $38
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    di
    nop
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
    ld   a, [$FF00]
    db   $10
    db   $E0
    db   $10
    db   $E0
    jr   nz, label_E4356
    and  b
    ld   b, b
    and  b
    ld   b, b
    ret  nz
    nop
    ld   b, b
    add  a, b
    jr   nz, label_E4360
    inc  bc
    nop

label_E43A2::
    ld   bc, $0100
    nop
    ld   bc, $0100
    nop
    ld   [bc], a
    ld   bc, $0102
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
    ld    hl, sp+$07
    ld   a, b
    or   a
    ld   a, b
    or   a
    ld   a, h
    or   e
    ld   a, e
    or   h
    ld   sp, label_1CE
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
    jr   nz, label_E43A2
    db   $10
    db   $E0
    db   $10
    db   $E0
    jr   nz, label_E43A8
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
    dec  c
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rra
    ld   bc, label_B1F
    rra
    dec  bc
    rra
    ld   a, [bc]
    ld   a, [hl]
    dec  c
    cp   $6D
    rst  $38
    ld   [hl], h
    rst  $38
    db   $76 ; Halt
    rst  $38
    rlca
    add  a, a
    ld   a, e
    add  a, e
    ld   a, h

label_E441E::
    ld   b, b
    ccf
    cp   [hl]
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    cp   $FF
    cp   e
    rst  $38
    cp   e
    rst  $38
    inc  bc
    dec  de
    db   $FD ; Undefined instruction
    inc  bc
    db   $FC ; Undefined instruction
    rst  $38
    ld   bc, label_1FF
    rst  $38
    inc  bc
    rst  $38
    rst  8
    rst  $38
    call z, label_3FC
    nop
    nop
    ret  nz
    nop
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF20]
    ld   a, [$FF20]
    ld   a, [$FF20]
    ld   a, [$FFE0]
    ld   a, [$FFE0]
    ld   a, [$FFC0]
    ld   [$FFC0], a
    ld   [$FFC0], a
    ld   [rJOYP], a
    jr   c, label_E441E
    ld   a, h
    cp   b
    jr   c, label_E4469
    ld   [label_407], sp
    inc  bc
    inc  bc
    nop
    rlca

label_E4469::
    inc  bc
    ld   [label_807], sp
    rlca

label_E446E::
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

label_E447C::
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
    add  a, e
    ld   a, h
    rst  $38
    add  a, e
    jr   z, label_E4453
    jr   z, label_E4455
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
    ld   a, h
    cp   b
    ld   a, h
    cp   b
    ld   a, h
    cp   b
    cp   b
    nop
    ret  nz
    add  a, b
    jr   nz, label_E446C
    jr   nz, label_E446E
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
    ld   l, e
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rra
    rrca
    ccf
    ld   d, $3F
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
    nop
    nop
    ld   [rJOYP], a
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    rst  $20
    rst  $38
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
    ccf
    ld   d, $7F
    ld   bc, label_E7E8D
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rst  $38
    ld   h, h
    db   $E4 ; Undefined instruction
    ld   a, e
    db   $E4 ; Undefined instruction
    ld   a, e
    rst  $20
    ld   a, b
    ld   a, e
    inc  b
    rlca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    cp   $FF
    ld   a, $FF
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    cp   $F1
    ld   a, [$FF0F]
    jp   nc, label_E71ED
    xor  $E9
    ld   [hl], $C9
    ld   [hl], $EA
    inc  d
    db   $EC ; Undefined instruction
    db   $10
    db   $78
    nop
    jr   nc, label_E4560

label_E4560::
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
    ret  nz
    nop
    ld   [$FFC0], a
    ld   a, [$FFE0]
    ld   a, [$FFE0]
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
    ccf
    ld   d, $7F
    ld   bc, label_E7E8D
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rrca
    inc  bc
    di
    inc  c
    adc  a, b
    ld   [hl], a
    adc  a, b
    ld   [hl], a
    and  $19
    ld   a, c
    ld   b, $1A
    inc  b
    inc  c
    nop
    nop
    nop
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    cp   $FF
    ld   a, $FF
    ld   a, [hl]
    rst  $38
    ld   a, h
    db   $FC ; Undefined instruction
    jp   label_BFFC
    db   $FC ; Undefined instruction
    ccf
    ld   a, l
    cp   [hl]
    ld   a, l
    cp   [hl]
    ld   a, $C1
    rst  $38
    rra
    ld   b, b
    ccf
    ld   b, b
    ccf
    ld   a, a
    nop
    ld   [hl], b
    nop
    sub  a, b
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    db   $10
    db   $E0
    db   $10
    db   $E0
    ld   a, [$FF00]
    stop
    stop
    db   $10
    db   $E0
    ld   a, [$FF00]
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
    db   $10
    db   $E0
    db   $10
    db   $E0
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
    sub  a, b
    ld   h, b
    db   $10
    db   $E0
    db   $10
    db   $E0
    stop
    stop
    stop
    db   $10
    db   $E0
    db   $10
    db   $E0
    db   $10
    db   $E0
    stop
    stop
    db   $10
    db   $E0
    db   $10
    db   $E0
    db   $10
    db   $E0
    stop
    stop
    stop
    db   $10
    db   $E0
    db   $10
    db   $E0
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

label_E4635::
    nop
    nop
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
    jr   z, label_E4635
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
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    ld   l, e
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    ccf
    nop
    rra
    rrca
    ccf
    ld   d, $3F
    ld   d, $3F
    ld   d, $7F
    ld   bc, label_E7E8D
    add  a, c
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    nop
    rla
    rrca
    cpl
    db   $10
    db   $E0
    nop
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    cp   $FF
    ld   a, $FF
    ld   a, [hl]
    rst  $38
    ld   a, [hl]
    cp   $F8
    ld   sp, hl
    and  $E0
    rra
    rlca
    inc  bc
    inc  bc
    nop
    rlca
    inc  bc
    rlca
    inc  bc
    inc  bc
    nop
    ld   [bc], a
    ld   bc, label_304
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
    db   $FC ; Undefined instruction
    di
    ld    hl, sp+$07
    db   $E8 ; add  sp, d
    rst  $10
    db   $E4 ; Undefined instruction
    db   $DB
    jp   nz, label_13D
    cp   $00
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
    db   $10
    db   $E0
    ld   [label_8F0], sp
    ld   a, [$FF10]
    ld   [$FF60], a
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
    nop
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
    jr   nz, label_E47A1
    ld   [hl], b
    cpl
    ld   [hl], b
    cpl
    ld   a, a
    jr   nc, label_E47C0

label_E4789::
    ld   bc, label_708
    ld   [label_707], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_E4789
    rrca
    rst  $30
    rrca
    rst  $30
    rst  $38
    rlca
    rst  $38
    ld   a, [$FF04]
    ld    hl, sp+$04
    ld    hl, sp+$F8
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E47C0::
    add  a, b
    nop
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
    call c, label_E74E7
    adc  a, a
    jp   hl
    rra
    ld   [$ED1F], a
    ld   e, $F3
    inc  c
    nop
    rst  $38
    nop
    rst  $38
    jr   nc, label_E4825
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
    jr   nc, label_E4877
    db   $EC ; Undefined instruction
    rra
    ld   a, [$FD07]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E48F0::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   sp, label_E53FF
    cp   $D7
    cp   h
    rst  $10
    inc  a
    rst  $28
    jr   label_E4906
    ld   [$FF38], sp
    ld   e, b
    rst  $28
    db   $E8 ; add  sp, d
    sbc  a, a
    db   $E8 ; add  sp, d
    rra
    jp   hl
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

label_E4957::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   hl, label_E4320
    ld   b, b
    ld   b, a
    ld   b, c
    adc  a, [hl]
    add  a, e
    sbc  a, h
    add  a, a
    cp   b
    adc  a, a
    ld   [hl], b
    ld   a, a
    ld   e, h
    ld   c, a
    db   $FC ; Undefined instruction
    inc  a
    rst  8
    di
    jr   label_E4957
    ld   b, $F8
    ld   a, l
    cp   $C6
    rst  0
    cp   d

label_E497D::
    cp   e
    cp   d
    cp   e
    nop
    nop
    nop
    nop
    add  a, c
    add  a, c
    ld   b, a
    add  a, $EE
    ld   l, c
    cp   b
    ld   [hl], a
    jr   nc, label_E497D
    jr   nz, label_E498F
    nop
    nop
    nop
    nop
    pop  af
    pop  af
    add  hl, hl
    add  hl, de
    dec  h
    call label_F50D
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    ld   bc, $0101
    ld   bc, $0101
    rlca
    rlca
    rrca
    ld   [label_1718], sp
    jr   label_E49C5
    jr   nc, label_E49DF
    nop
    nop
    ld   a, a
    nop
    ld   a, a
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    ld   a, a
    rst  $38
    add  a, b
    add  a, b
    nop
    nop
    cp   $00
    cp   $00

label_E49C6::
    rst  $38
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    cp   $FF
    ld   bc, $8001
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ld   [$FFE0], a
    ld   a, [$FF10]
    jr   c, label_E49A4
    jr   label_E49C6
    inc  c

label_E49DF::
    db   $F4 ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $01
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0102
    ld   [bc], a
    ld   bc, $0001
    ld   bc, $8000
    ld   a, a
    ret  nz
    ccf
    ld   h, b
    rra
    jr   nc, label_E4A27
    db   $10
    db   $0F
    ld   [label_807], sp
    rlca
    inc  b
    inc  bc
    ret  nz
    ccf
    jr   nc, label_E4A33
    ld   [label_407], sp

label_E4A27::
    inc  bc
    ld   [bc], a
    ld   bc, $0102
    ld   bc, $0100
    nop
    rst  $38
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
    rst  $38
    ret  nz
    ccf
    ld   [hl], b
    rrca
    jr   label_E4A4F
    inc  b
    inc  bc
    ld   b, $01
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
    adc  a, [hl]
    add  a, a
    add  a, [hl]
    add  a, e
    add  a, a
    add  a, c
    add  a, a
    add  a, c
    add  a, a
    add  a, c
    adc  a, [hl]

label_E4A6B::
    add  a, e
    adc  a, a
    add  a, e
    adc  a, [hl]
    add  a, [hl]
    cp   d
    cp   e
    add  a, $C7
    ld   a, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   b, b
    ld   a, a
    rrca
    sbc  a, a
    ld   de, label_2EF0
    ld   [$FF71], a
    adc  a, $60
    rst  $18
    jr   nz, label_E4A6B
    nop
    rst  $38
    nop
    rst  $38
    sub  a, c
    pop  af
    ld   d, c
    pop  af
    pop  de
    ld   [hl], c
    rst  $18
    ld   a, a
    pop  de
    ld   [hl], c
    rst  $18
    ld   a, a
    pop  de
    ld   [hl], c
    ld   d, c
    pop  af
    jr   nc, label_E4AD1
    ld   h, c
    ld   e, a
    ld   h, c
    ld   e, a
    db   $FC ; Undefined instruction
    add  a, d
    db   $FC ; Undefined instruction
    add  a, d
    jp   nz, label_C2BE
    cp   [hl]
    jp   nz, label_BFBE
    add  a, b
    ld   a, a
    nop
    ld   a, a
    ccf
    nop
    nop
    ccf
    ccf
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   bc, $00FE
    cp   $FC
    nop
    nop
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction

label_E4ACA::
    rst  $38
    nop
    rst  $38
    db   $FC ; Undefined instruction
    cp   $00
    inc  c

label_E4AD1::
    db   $F4 ; Undefined instruction
    adc  a, [hl]
    ld   a, [$FF00+C]
    ld   a, [label_E413F]
    ccf
    ld   b, c
    ld   [hl], e
    ld   c, l
    daa
    ld   e, c
    rrca
    ld   [hl], c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E4AE8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E4B02::
    inc  bc
    db   $FC ; Undefined instruction
    ld   c, $F0
    jr   label_E4AE8
    jr   nz, label_E4ACA
    ld   h, b
    add  a, b
    ret  nz
    nop
    add  a, b
    nop
    rst  $38
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
    inc  bc
    db   $FC ; Undefined instruction
    inc  b
    ld    hl, sp+$10
    ld   [rNR41], a
    ret  nz
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    add  a, b
    nop
    add  a, b
    nop
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    ld   b, $F8
    inc  c
    ld   a, [$FF08]
    ld   a, [$FF10]
    ld   [rNR10], a
    ld   [rNR41], a
    ret  nz
    jr   nz, label_E4B02
    nop
    ret  nz
    nop
    ret  nz
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    ld   b, b
    add  a, b
    nop
    add  a, b
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
    rst  $38
    sbc  a, h
    add  a, h
    ld   e, [hl]
    ld   c, [hl]
    ld   a, e
    ld   c, e
    ld   sp, $0031
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    jr   label_E4B93
    inc  b
    rlca
    add  a, d
    add  a, e
    pop  bc
    pop  bc
    ld   h, c
    ld   b, c
    jr   c, label_E4BAE
    rrca
    rrca
    ld   bc, $00FF
    rst  $38
    rrca
    rst  $38
    ld   de, label_23F0
    ld   [$FFCF], a
    pop  bc
    ld   a, $06
    ld    hl, sp+$F8
    sub  a, c
    pop  af
    ld   hl, $A1E1
    pop  hl
    pop  bc
    ld   b, c
    add  a, c
    add  a, c
    ld   bc, $0001
    nop
    nop
    nop
    jp   nz, label_C2BE
    cp   [hl]
    jp   nz, label_C2BE
    cp   [hl]
    jp   nz, label_C2BE
    cp   [hl]
    jp   nz, label_C2BE
    cp   [hl]
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    ccf
    rst  $38
    nop
    rst  $38
    nop
    cp   $00
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   sp, hl
    nop
    rst  $38
    ld   a, [$FFE7]
    nop
    cp   $CC
    sbc  a, h
    nop
    add  hl, sp
    nop
    ld   [hl], e
    nop
    ld   e, e
    ld   h, l
    ld   [hl], e
    ld   c, l
    inc  hl
    ld   e, l
    inc  bc
    ld   a, l
    ld   b, e
    ld   a, l
    ld   b, e
    ld   a, l
    ld   b, e
    ld   a, l
    ld   b, e
    ld   a, l
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    rst  $38
    rst  $38
    nop
    ld   sp, hl
    ld   b, $9F
    ld   h, b
    rst  $38
    nop
    di
    inc  c
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, a
    rst  $38
    add  a, b
    ld   sp, hl
    add  a, [hl]
    sbc  a, a
    ld   [rIE], a
    add  a, b
    di
    adc  a, h
    rst  $38
    add  a, b
    rst  $38
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
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   [label_808], sp
    jr   label_E4C70
    jr   nc, label_E4C61

label_E4C61::
    nop
    add  a, b
    add  a, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ld   [rNR41], a
    ld   [rNR41], a

label_E4C70::
    dec  bc
    ld   [label_808], sp
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    rst  $38
    rst  $38
    ld   a, [$FF10]
    ld   a, [$FF10]
    ld   [rNR41], a
    ret  nz
    ret  nz
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
    ret  nz
    ld   b, b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E4D11::
    rst  $38
    rst  $38

label_E4D13::
    nop
    rst  $38
    add  a, [hl]
    ld   a, l
    ret
    inc  a
    jp   hl
    jr   c, label_E4D07
    jr   label_E4D11
    jr   label_E4D13
    rst  $38
    rst  $38
    rst  $38
    ld   bc, label_2FF
    cp   $84
    ld   a, h
    jp   hl
    jr   label_E4D1F
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
    jr   c, label_E4D83
    add  a, h
    add  a, a
    add  a, h
    add  a, a
    inc  b
    rlca
    jr   label_E4D6B
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E4D83::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E4E11::
    rst  $38
    rst  $38

label_E4E13::
    add  a, b
    ld   a, a
    pop  bc
    ccf
    ld  [$FF00+C], a
    ld   a, $E4
    inc  e
    ld   sp, hl
    jr   label_E4E11
    jr   label_E4E13
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    add  a, c
    ld   a, a
    ld   b, [hl]
    ld   a, $E8
    jr   label_E4E1D

label_E4E2C::
    nop
    rst  $30
    nop
    rst  $30
    rlca
    rst  $38
    jr   c, label_E4E2C
    ld   b, d
    jp   nz, label_C343
    ld   b, b
    ret  nz
    jr   nc, label_E4E2C
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
    ld   sp, label_E7A0F
    ld   c, $FA
    inc  b
    db   $FD ; Undefined instruction
    inc  b
    db   $FD ; Undefined instruction
    rst  $38

label_E4F11::
    rst  $38
    rst  $38

label_E4F13::
    and  b
    cp   a
    jr   nz, label_E4F36
    ld   sp, label_E721F

label_E4F1A::
    inc  e
    db   $FC ; Undefined instruction
    jr   label_E4F11
    jr   label_E4F13
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

label_E4F34::
    ld   hl, label_21E1
    pop  hl
    jr   nz, label_E4F1A
    jr   label_E4F34
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E5014::
    nop
    nop
    inc  bc
    nop
    inc  c
    inc  bc
    jr   nc, label_E502B
    jr   nz, label_E503D
    jr   label_E5027
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E5027::
    nop
    nop
    nop
    nop

label_E502B::
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

label_E503D::
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
    jr   nz, label_E5014
    db   $10
    db   $E0
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
    ld   de, label_E610A
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
    jr   label_E507F
    jr   nz, label_E5099
    ld   b, h
    dec  sp
    ld   a, c
    ld   b, $0F

label_E507F::
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

label_E5099::
    nop
    nop
    nop
    nop
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
    db   $10
    db   $4F
    ldd  [hl], a
    ld   [hl], d
    dec  c
    db   $10
    db   $0F
    jr   nz, label_E50EF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E50F9::
    ld   e, b
    db   $FC ; Undefined instruction
    jr   c, label_E50F9
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
    ld  [$FF00+C], a
    inc  e
    inc  h
    jr   label_E5139
    jr   label_E512F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E512F::
    nop
    nop
    nop
    nop
    nop
    rlca
    nop

label_E5136::
    ld   a, b
    rlca

label_E5138::
    ld   b, b

label_E5139::
    ld   a, $38
    rlca
    db   $10
    db   $0F
    jr   nz, label_E5157
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E514C::
    nop
    nop

label_E514E::
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
    jr   nz, label_E5136
    jr   nz, label_E5138
    ld   a, [$FF00]
    jr   z, label_E514C
    jr   z, label_E514E
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
    ld  [$FF00+C], a
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

label_E51B9::
    nop
    nop
    nop
    nop
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
    jr   label_E51D5
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
    ld   a, a
    ld   a, $7E
    dec  c
    sbc  a, a
    ld   h, b
    rst  $38
    ld   [bc], a
    ld   [de], a
    dec  c
    db   $10
    db   $0F
    jr   nz, label_E520F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E520F::
    ld   h, h
    ld   de, label_31EE
    adc  a, $73

label_E5215::
    adc  a, h
    db   $FC ; Undefined instruction
    jr   nc, label_E5215
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
    ld  [$FF00+C], a
    inc  e
    ld   b, d
    inc  a
    ld   b, h
    jr   c, label_E5273
    jr   c, label_E51B9
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
    jr   nc, label_E5299
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

label_E5299::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   c, label_E539E

label_E539E::
    nop
    ld   bc, $0040
    ret  nz
    nop
    and  b
    nop
    jr   nz, label_E53A8

label_E53A8::
    jr   nz, label_E53AA

label_E53AA::
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
    jr   nz, label_E53BF
    nop
    nop
    nop
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
    jr   z, label_E53D8

label_E53D8::
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
    jr   nz, label_E53EE

label_E53EE::
    jr   nz, label_E53F0

label_E53F0::
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
    ld   a, [$FF00+C]
    ld   bc, $0000

label_E53FF::
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
    jr   label_E542A

label_E542A::
    jr   z, label_E542C

label_E542C::
    jr   z, label_E542E

label_E542E::
    ld   d, b
    nop
    sub  a, b
    nop
    sub  a, b
    nop
    stop
    stop
    db   $10
    db   $80
    db   $10
    db   $80
    db   $10
    db   $80
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
    jr   nz, label_E54A1
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
    jr   label_E54E9
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
    jr   nz, label_E5597

label_E5597::
    ccf
    ld   b, b

label_E5599::
    ld   a, a
    pop  bc
    rst  $38
    ccf
    rst  $38

label_E559E::
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
    jr   nz, label_E5599
    jr   nz, label_E559E
    ld   a, b
    rst  0
    rst  $38
    db   $10
    db   $FF
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
    jr   nz, label_E5894
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

label_E582A::
    rst  $30
    jr   label_E582A

label_E582D::
    jr   nc, label_E582D
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
    jr   c, label_E5840
    rst  $38
    ld   e, a
    rst  $30
    ccf
    jp  c, label_E42BF
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
    jr   nc, label_E5894
    ld   [label_407], sp
    inc  bc
    ld   [bc], a
    inc  bc
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $00FF
    rst  $38
    nop

label_E5894::
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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

label_E58F0::
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

label_E5901::
    ld   bc, label_607
    rrca
    inc  c
    ld   e, $18
    ccf
    jr   nz, label_E5984
    ld   b, d
    ld   l, e
    ld   d, b
    cp   a
    ret  nz
    rst  0
    jr   label_E5901
    ld   bc, label_59B
    cp   a
    ld   [bc], a
    ld   l, [hl]
    ld   e, $EA
    jr   label_E58F0
    jr   nz, label_E5926
    ld   [$FFD3], a
    ld   h, b
    or   a
    ret  nz
    rst  $18
    add  a, c

label_E5926::
    sbc  a, a
    inc  bc
    ld   a, a
    ld   b, $FF
    inc  b
    cp   $18
    db   $FC ; Undefined instruction
    jr   label_E592D
    ld   a, b
    ld    hl, sp+$A0
    ld   a, [$FF00+C]
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
    jr   nz, label_E5951
    jr   nz, label_E5953
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

label_E5984::
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
    jr   label_E599C
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
    jr   c, label_E59C2
    inc  b
    inc  bc
    inc  bc
    ld   bc, $E001
    jr   nz, label_E5983
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
    jr   nz, label_E59F4
    db   $10
    db   $0F
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

label_E59F4::
    nop
    nop
    nop
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
    jr   nc, label_E5A1C
    ld   d, b
    db   $FD ; Undefined instruction
    ld   h, b
    ei
    ld   [$FFF6], a
    add  a, b
    push hl
    nop

label_E5A26::
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
    jr   nc, label_E5A36
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
    db   $10
    db   $FF
    ldi  [hl], a
    rst  $38
    rra
    ld   d, $DF
    pop  de
    cpl
    jr   z, label_E5A26
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
    db   $10
    db   $3F
    jr   nz, label_E5B0B
    ld   b, c
    xor  $91
    ld   a, a
    ld   a, a
    db   $10
    db   $EF
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
    call z, label_E787F
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

label_E5B63::
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
    db   $10
    db   $09
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
    jp   hl
    rla
    rst  $20
    ld   e, $DF
    inc  l
    ld   c, l
    cp   b
    ld   b, $FF
    jr   nc, label_E5B63
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
    jr   nz, label_E5BB3
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
    call z, label_E7C67
    ld   [hl], a
    ld   a, b
    ccf
    ret  c
    cp   $E0
    rst  $38
    ret  nz
    db   $FD ; Undefined instruction

label_E5C17::
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
    db   $10
    db   $AF
    db   $10
    db   $F0
    rrca
    ld   a, b
    add  a, a
    ld   h, b
    sbc  a, a
    jr   nc, label_E5C17
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
    jr   nz, label_E5C57
    nop
    rst  $38
    inc  d
    rst  $38
    db   $10
    db   $FF
    nop
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
    jr   nz, label_E5C9B
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
    jr   z, label_E5CBD
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
    jr   c, label_E5D0E
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
    call nz, label_E447C
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

label_E5D0E::
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
    jr   nc, label_E5D59
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
    db   $10
    db   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_E5D79
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
    db   $10
    db   $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   nc, label_E5D99
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
    db   $10
    db   $FF
    ld   h, b
    rst  $38
    or   b
    rst  $38
    cp   b
    rst  $38
    ld    hl, sp+$FF
    jr   c, label_E5DB9
    nop
    rst  $38
    jr   nz, label_E5DBD
    jr   nc, label_E5DBF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
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
    ld   a, [$FF00+C]
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
    db   $76 ; Halt
    xor  a
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
    jr   label_E5E5B
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
    jr   c, label_E5EB1
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

label_E5EE4::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E5F02::
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
    ld  [$FF00+C], a
    rst  $38
    ret  nz
    rst  $18
    rrca
    sbc  a, e
    dec  bc
    dec  sp

label_E5F17::
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
    ld  [$FF00+C], a
    db   $FD ; Undefined instruction
    add  a, d
    db   $FD ; Undefined instruction
    ld   [bc], a
    rst  $28
    db   $10
    db   $AB
    ld   d, h
    rst  $20
    jr   label_E5F02
    jr   nc, label_E5EE4
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
    call nc, label_E782B
    add  a, a
    db   $E8 ; add  sp, d
    rla
    db   $F4 ; Undefined instruction
    dec  bc
    jr   c, label_E5F17
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    nop
    nop
    nop
    nop
    ld   bc, label_600
    ld   bc, label_708
    db   $10
    db   $0F
    ld   de, label_1F0E
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
    jr   nc, label_E6024

label_E6024::
    ld   a, a
    jr   nc, label_E6023
    ld   a, e
    ld   a, [hl]
    sbc  a, l
    rra
    xor  $0F
    or   $EF
    dec  d
    rst  $20
    db   $DB
    rst  $30
    ld   l, e
    rst  $30
    ld   l, e
    rst  $30
    ld   l, d
    sub  a, a
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    db   $EB ; Undefined instruction
    cp   $61
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
    db   $76 ; Halt
    rst  $38
    ld   b, [hl]
    adc  a, a
    db   $76 ; Halt
    ld   a, [hl]
    jr   c, label_E60E9
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
    jr   c, label_E6093

label_E608C::
    jr   nz, label_E60AD
    jr   nz, label_E60AF
    ld   de, label_F0E

label_E6093::
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
    ld   a, $DD
    rra

label_E60AF::
    db   $EC ; Undefined instruction
    rst  $18
    dec  hl
    rst  8
    or   a
    rst  $28
    sub  a, $EF
    sub  a, $EF
    call nc, label_D02F
    jp   hl
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
    jr   nc, label_E608C
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

label_E60E9::
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

label_E6159::
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

label_E6166::
    ld   a, a
    jr   nc, label_E6159
    ld   l, a
    ld   [$FF5F], a
    ret  nz
    ccf
    ld   b, e
    cp   h
    ld   a, a
    add  a, e
    ld   a, a
    or   a
    ld   a, a
    or   a
    ld   a, a
    or   a
    ld   c, a
    cp   a
    ld   a, a
    or   b
    cp   a
    rra
    ld   e, a
    jr   nz, label_E6181

label_E6181::
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    ld   a, [$FF60]
    ld   a, b
    or   b
    jr   c, label_E615C
    db   $DB
    jr   nz, label_E6166
    xor  d
    rst  $30
    jp   z, label_E6AF7
    rst  $30
    ld   l, d
    rst  $30
    ld   l, d
    sub  a, [hl]
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $E8 ; add  sp, d
    ret  nz
    ret  nc
    jr   nz, label_E61A1

label_E61A1::
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
    nop
    nop
    add  a, b
    ld   a, a
    ret  nc
    cpl
    rst  $38
    jp   nz, label_DFE0
    rst  $38
    jr   c, label_E6248
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
    ld   [label_E48F0], sp
    or   b
    db   $FC ; Undefined instruction
    jr   label_E6223
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
    ld   c, $05
    ld   c, $05
    ld   c, $05
    ld   e, $05
    sbc  a, $09
    cp   $49
    ld   a, [hl]
    add  hl, sp
    ld   a, a
    inc  b
    ld   a, [hl]
    dec  [hl]
    nop
    nop
    ccf

label_E6223::
    nop
    rst  $38
    ccf
    rst  $38
    ld   h, b
    ld   [$FFDF], a
    ret  nz
    cp   a
    add  a, c
    ld   a, [hl]
    add  a, a
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

label_E6248::
    ld   a, [$FF60]
    ld   [hl], b
    and  b
    or   [hl]
    ld   b, b
    xor  [hl]
    ld   d, h
    xor  $94
    xor  $D4
    xor  $D4
    xor  $D4
    inc  l
    ret  nc
    db   $E8 ; add  sp, d
    ret  nc
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
    ld  [$FF00+C], a
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
    db   $10
    db   $E0
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

label_E65E2::
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
    jr   c, label_E65E2
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
    jr   label_E671E
    inc  [hl]
    ld   l, a
    jr   nc, label_E6706
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
    jr   nc, label_E676C
    jr   c, label_E672E
    jr   label_E6730
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

label_E6706::
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

label_E671E::
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

label_E672E::
    db   $FC ; Undefined instruction
    nop

label_E6730::
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
    jp   hl
    rra
    jp   hl
    rra
    ld   h, [hl]
    rra
    ld   a, a
    nop

label_E676C::
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

label_E6795::
    nop
    nop
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
    jr   z, label_E6795
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
    db   $10
    db   $EF
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
    db   $10
    db   $10
    db   $10
    db   $EF
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
    db   $10
    db   $1F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

label_E69E6::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   c, label_E69E6
    nop
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

label_E6AF7::
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
    jr   c, label_E6B9D
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
    jr   nc, label_E6B6B
    inc  c
    rst  $38
    inc  bc
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_E6B73
    inc  c
    rst  $38
    inc  sp
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_E6B7B
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
    db   $10
    db   $EF
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
    db   $10
    db   $EF
    db   $10
    db   $EF
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

label_E6BAF::
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
    jr   nz, label_E6BAD
    jr   nz, label_E6BAF
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
    jr   nc, label_E6C0B

label_E6C0C::
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
    jr   nc, label_E6C0C
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
    rst  $38
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    rrca
    ld   a, [$FF3F]
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
    nop
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
    ret  nz
    ccf
    ld   a, [$FF0F]
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
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    inc  de
    rst  $38
    inc  de
    rst  $38
    adc  a, a
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    ld   a, [$FFFF]
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    jp   label_CEFF
    rst  $38
    ld    hl, sp+$FF
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
    pop  af
    rst  $38
    dec  a
    rst  $38
    rrca
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    jp   label_E73FF
    rst  $38
    rra
    rst  $38
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
    jr   c, label_E6E03
    inc  [hl]
    rst  $20
    inc  [hl]
    rst  $20
    jr   c, label_E6E09
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
    rst  $38
    rst  $38
    rst  $38
    nop
    jr   label_E6E23
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
    rst  $38
    ret
    rst  $38
    rst  8
    rst  $38
    ld   a, [$FFFF]
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rst  8
    rst  $38
    ld    hl, sp+$FF
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    sub  a, e
    rst  $38
    di
    rst  $38
    rrca
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    di
    rst  $38
    rra
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
    inc  de
    rst  $38
    rst  $38
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    inc  de
    rst  $38
    inc  de
    rst  $38
    call nz, label_FFFF
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    ret  nz
    rst  $38
    rst  $38
    rst  $38
    call nz, label_C4FF
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    nop
    nop
    nop
    nop
    ld   bc, label_600
    ld   bc, label_708
    db   $10
    db   $0F
    ld   de, label_1F0E
    nop
    inc  bc
    ld   bc, $010F
    rrca
    rlca
    rlca
    ld   bc, $0103
    pop  hl
    nop
    ld    hl, sp+$60
    nop
    nop
    jr   nc, label_E7024

label_E7024::
    ld   a, a
    jr   nc, label_E7023
    ld   a, e
    ld   a, [hl]
    sbc  a, l
    rra
    xor  $0F
    or   $EF
    dec  d
    rst  $20
    db   $DB
    rst  $30
    ld   l, e
    rst  $30
    ld   l, e
    rst  $30
    ld   l, d
    sub  a, a
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    db   $EB ; Undefined instruction
    cp   $61
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
    ld   a, [hl]
    jr   c, label_E70A2
    ld   c, $0F
    inc  bc
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
    nop
    nop
    nop
    nop
    ld   c, l
    ldd  [hl], a
    sub  a, c
    ld   l, [hl]
    pop  hl
    ld   e, $F2
    inc  l
    cp   $30
    ld   a, d
    inc  b
    add  a, d
    ld   a, h
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

label_E70A2::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   c, label_E70E3

label_E70DC::
    jr   nz, label_E70FD
    jr   nz, label_E70FF
    nop
    nop
    nop

label_E70E3::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst  $38
    ld   h, b
    ld    hl, sp+$F7
    db   $FC ; Undefined instruction
    dec  sp
    ld   a, $DD
    rra

label_E70FF::
    db   $EC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr   nc, label_E70DC
    ld   [label_4F0], sp
    ld    hl, sp+$19
    ld   b, $07
    ld   bc, label_207
    rra
    ld   [bc], a
    rra
    ld   c, $0F
    inc  bc
    rst  0
    inc  bc
    di
    ret  nz
    db   $FD ; Undefined instruction
    ld   [hl], b
    ld   a, a
    jr   label_E7154
    inc  bc
    rrca
    inc  bc
    rlca
    nop
    ld   [label_607], sp
    ld   bc, $0001
    rst  $18
    dec  hl
    rst  8
    or   a
    rst  $28
    sub  a, $EF
    sub  a, $EF
    call nc, label_D02F
    jp   hl
    sub  a, $FF
    ret  nz
    db   $EB ; Undefined instruction
    inc  d
    pop  de
    ld   l, $C3
    cp   h
    call label_F3B3
    ld   c, $DE
    pop  hl
    jr   z, label_E7125
    rst  8
    nop
    add  a, d
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
    add  hl, de
    ld   b, $07
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
    ld   bc, label_200
    ld   bc, $000F
    rra
    rrca
    rrca
    nop
    ld   [label_607], sp
    ld   bc, $0001
    rst  $18
    dec  hl
    rst  8
    or   a
    rst  $28
    sub  a, $EF
    sub  a, $EF
    call nc, label_D02F
    jp   hl
    sub  a, $FF
    ret  nz
    db   $EB ; Undefined instruction
    inc  d
    sub  a, [hl]
    ld   l, c
    rst  $38
    ld   b, $FF
    or   $FE
    ld   bc, label_27F8
    add  hl, hl
    add  a, $C6
    nop
    add  a, d
    ld   a, h
    add  a, d
    ld   a, h
    sub  a, d
    ld   l, h
    sbc  a, $A0
    ld   [$FF80], a
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    nop
    nop
    add  a, b
    nop
    ret  nz
    nop
    ret  nz
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

label_E71ED::
    nop
    nop
    nop
    nop

label_E71F1::
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E7209::
    nop
    nop
    nop

label_E720C::
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    nop
    ld   a, a
    rra

label_E7216::
    ld   a, a
    jr   nc, label_E7209
    ld   l, a
    ld   [$FF5F], a
    ret  nz
    ccf
    ld   b, e

label_E721F::
    cp   h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [$FFC0]
    ld   a, [$FF60]
    ld   a, b
    or   b
    jr   c, label_E720C
    db   $DB
    jr   nz, label_E7216
    xor  d
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
    ld   a, a
    add  a, e
    ld   a, a
    or   a
    ld   a, a
    or   a
    ld   a, a
    or   a
    ld   c, a
    cp   a
    ld   a, a
    or   b
    cp   a
    rra
    ld   e, a
    jr   nz, label_E71F1
    ld   a, a
    sub  a, b
    ld   l, a
    rst  $38
    jp   nz, label_DFE0
    rst  $38
    jr   c, label_E72F8
    nop
    add  a, l
    ld   a, b
    db   $FD ; Undefined instruction
    nop
    rst  $30
    jp   z, label_E6AF7
    rst  $30
    ld   l, d
    rst  $30
    ld   l, d
    sub  a, [hl]
    db   $E8 ; add  sp, d
    db   $F4 ; Undefined instruction
    ld   l, b
    db   $E8 ; add  sp, d
    ret  nz
    ret  c
    jr   nz, label_E72AF
    db   $E8 ; add  sp, d
    ld   e, a
    xor  b
    rst  $38
    dec  de
    rra
    pop  hl
    pop  af
    ld   [$FFF0], a
    nop
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

label_E72AF::
    nop
    nop
    nop
    nop
    nop
    ret  nz
    nop
    ld   a, [$FFC0]
    db   $FC ; Undefined instruction
    ld   [hl], b
    ld   a, [hl]
    inc  e
    rra
    ld   b, $07
    nop
    rlca
    ld   [bc], a
    rlca
    ld   [bc], a
    rrca
    ld   [bc], a
    ld   l, a
    inc  b
    ld   a, a
    inc  h
    ccf
    inc  e
    ccf
    ld   [bc], a
    ccf
    ld   a, [de]
    ld   e, $05
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
    nop
    ld   bc, label_300
    nop
    inc  bc
    nop
    rlca
    nop
    rlca
    ld   bc, label_20F
    rrca
    ld   [bc], a
    rrca
    ld   [bc], a
    rrca
    ld   bc, $000F
    rrca
    nop
    dec  c
    ld   [bc], a
    inc  c
    inc  bc
    rrca
    nop
    ccf
    nop
    ld   a, a
    ld   bc, label_1FF
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    ld   h, b
    rst  $38
    ld   h, b
    rst  $38
    ld   h, b
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
    ld   b, $01
    rlca
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
    nop
    nop
    nop
    nop
    nop
    nop
    rst  $18
    ld   [$FFED], a
    cp   $FE
    ld   l, a
    or   [hl]
    ld   l, a
    rst  $38
    ld   [bc], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, label_207
    rlca
    ld   [bc], a
    rrca
    ld   [bc], a
    rrca
    inc  bc
    rrca
    ld   bc, $000F
    rrca
    nop
    rrca
    nop
    ld   c, $01
    rrca
    ld   bc, $0007
    rra
    nop
    ld   a, a
    ld   bc, $00FF
    rst  $38
    nop
    rst  $38
    add  a, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ret  nz
    rst  $38
    add  a, b
    cp   $0F
    cp   $0F
    rst  8
    ld   a, [hl]
    rst  $30
    adc  a, $FB
    add  a, $0D
    ld   [bc], a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    rra
    ld   [$FFC3], a
    inc  a
    ld   sp, label_F0F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rrca
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
    cp   a
    ld   b, b
    rst  $18
    ld   h, b
    rst  $28
    ld   [hl], b
    rst  $30
    ld   a, b
    ei
    ld   [hl], a
    rst  $28

label_E73FF::
    ld   [hl], a
    ccf
    nop
    rst  $38
    nop
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rlca
    rst  $38
    rrca
    rst  $38
    jr   label_E7412
    jr   label_E7414
    jr   label_E7416
    rrca
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
    nop
    ccf
    ret  nz
    nop
    nop
    ret  nz
    nop
    ld   a, [$FF00]
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    cp   $80
    rst  $38
    ret  nz
    rst  $38
    ret  nz
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
    ld   a, h
    daa
    ccf
    inc  b

label_E7444::
    ccf
    nop

label_E7446::
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db   $F4 ; Undefined instruction
    dec  sp
    rst  $28
    jr   nc, label_E7444
    jr   nz, label_E7466
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
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
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
    ccf
    nop
    ccf
    nop
    ld   c, a
    jr   nc, label_E7446
    ld   a, b
    cp   a
    db   $76 ; Halt
    rst  $28
    ld   [hl], a
    rst  $38
    ld   b, a
    ld   c, a
    rlca
    rlca
    nop
    ld   l, a
    nop
    ld   [hl], a
    jr   z, label_E74BE
    jr   nc, label_E7540
    nop
    db   $E3 ; Undefined instruction
    inc  e
    db   $E3 ; Undefined instruction
    inc  e
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    rlca
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    rlca
    rst  $38
    add  a, e
    rst  $38
    ret  nz

label_E74D8::
    rst  $38
    jr   nc, label_E74DA
    jr   c, label_E74D8
    inc  a
    ld   sp, hl
    ld   b, $80
    nop
    ld   [rJOYP], a
    ld    hl, sp+$00
    db   $FC ; Undefined instruction

label_E74E7::
    nop
    db   $FC ; Undefined instruction
    add  a, b
    cp   $C0
    cp   $60
    cp   $60
    rst  $38
    ld   h, b
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
    rst  $38
    nop
    rst  $38
    ldd  [hl], a
    sub  a, $3F
    ld   h, a
    rra
    ld   a, a
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   $01
    reti
    ld   h, $83
    ld   a, h
    rrca
    ld   a, [$FFFF]
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E7540::
    cp   $00
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   [rJOYP], a
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
    inc  bc
    nop
    rlca
    nop
    rrca
    nop
    rra
    nop
    ccf
    ld   c, $3F
    ld   c, $7F
    inc  sp
    ld   a, a
    inc  sp
    rst  $38
    inc  sp
    rst  $38
    inc  sp
    rst  $38
    inc  c
    rst  $38
    inc  c
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rst  $38
    nop
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    call c, label_3C3F
    rst  $38
    ei
    rlca
    di
    rrca
    rst  $38
    rrca
    rst  $28
    rra
    rst  8
    scf
    rst  8
    inc  sp
    ld   l, a
    db   $10
    db   $67
    jr   label_E75E4
    inc  c
    ld   sp, label_1C0E
    inc  bc
    inc  c
    inc  bc
    rlca
    nop
    inc  bc
    nop
    nop
    nop
    nop
    nop
    ccf
    db   $FC ; Undefined instruction
    rra
    db   $FC ; Undefined instruction
    rst  $38
    inc  e
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
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    ccf
    ret  nz
    jp   label_C33F
    ccf
    rst  $38
    nop
    ccf
    nop
    add  a, b
    nop
    add  a, b
    nop

label_E75E4::
    add  a, b
    nop
    add  a, b
    nop
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ret  nz
    add  a, b
    ld   [$FFC0], a
    ld    hl, sp+$E0
    ld   [$FFC0], a
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
    add  a, b
    nop
    ld   a, a
    add  a, e
    ld   a, a
    or   a
    ld   a, a
    or   a
    ld   a, a
    or   a
    ld   c, a
    cp   a
    ld   a, a
    or   b
    cp   a
    rra
    rst  $18
    jr   nz, label_E7611

label_E7611::
    rst  $38
    ld   h, b
    sbc  a, a
    cp   a
    ld   [bc], a
    jr   nz, label_E7637
    ld   a, a
    jr   c, label_E7698
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E7637::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E7698::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [bc], a
    ld   bc, label_33D
    ld   a, l
    dec  sp
    cp   l
    ld   a, a
    cp   a
    ld   a, a
    adc  a, a
    ld   a, a
    ld   l, a
    rra
    dec  d
    rrca
    ld   de, label_D0F
    inc  bc
    dec  b
    inc  bc
    dec  b
    ld   [bc], a
    ld   b, $00
    ld   b, $00
    inc  b
    nop
    ld   a, [$FF00]
    ret  c
    ld   [$FFE8], a
    ld   a, [$FFE8]
    ld   a, [$FFDE]
    ld   [$FF91], a
    xor  $FD
    cp   $FD
    cp   $9D
    cp   $B9
    cp   $82
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
    jr   c, label_E77E6

label_E77E6::
    ld   a, h
    jr   c, label_E7865
    jr   z, label_E7867
    jr   c, label_E7825
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E7825::
    nop
    nop
    nop
    nop
    nop
    nop

label_E782B::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E7865::
    nop
    nop

label_E7867::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E787F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   a, [bc]
    dec  de
    dec  de
    nop
    nop
    dec  de
    dec  de
    ld   a, [bc]
    ld   a, [bc]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rra
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ccf
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    rlca
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld    hl, sp+$00
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
    cp   $00
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld    hl, sp+$00
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   [rJOYP], a
    ld   [rJOYP], a
    ld   a, a
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
    rlca
    nop
    rlca
    nop
    ld   [rJOYP], a
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
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    add  a, e
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    ccf
    ld    hl, sp+$0F
    db   $FC ; Undefined instruction
    rst  0
    ccf
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ret  nz
    rst  $38
    jr   nc, label_E79B8
    jr   c, label_E79BA
    ccf
    db   $FC ; Undefined instruction
    ld   [$FF38], a
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
    ei
    ei
    ccf
    rlca
    inc  e
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$F8
    rst  $38
    rlca
    rst  $38
    nop
    rst  $38
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
    ld   b, d
    add  a, c
    and  l
    ld   b, d
    jp   label_FF3C
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
    cp   $FE
    jp   label_8001
    nop
    add  a, b

label_E7A0B::
    nop
    pop  bc
    nop
    rst  $38

label_E7A0F::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    or   b
    ld   [hl], b
    ret  z
    jr   c, label_E7A0B
    inc  e
    nop
    rlca
    nop
    inc  bc
    nop
    inc  bc
    nop
    ld   bc, $0100
    nop
    ld   bc, $0000
    nop
    nop
    nop
    ld   [rJOYP], a
    ret  nz
    nop
    ret  nz
    nop
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
    ld   [rJOYP], a
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    ret  nz
    nop
    add  a, b
    nop
    add  a, b
    nop
    add  a, b
    nop
    rlca
    nop
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    nop
    ld   bc, $0100
    nop
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
    nop
    rst  $38
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
    nop
    rst  $38
    ld   [hl], b
    adc  a, a
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
    rst  $30
    ld   c, $FC
    dec  de
    db   $FC ; Undefined instruction

label_E7AA5::
    inc  sp
    db   $FC ; Undefined instruction
    inc  hl
    inc  a
    db   $E3 ; Undefined instruction
    ld   a, [hl]

label_E7AAB::
    pop  bc
    ld   a, a
    ret  nz
    sbc  a, a
    ld   [rSVBK], a
    add  a, b
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    rst  $38
    nop
    ccf
    ret  nz
    rlca
    ld    hl, sp+$80
    ld   a, a
    ret  nz
    ccf
    ld   c, $01
    rra
    nop
    ccf
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
    ld   [$FF1F], a
    ld   bc, label_3FE
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   h, e
    jr   c, label_E7AAB
    jr   c, label_E7AA5
    inc  a
    rst  0
    inc  a
    rst  0
    ld   a, [hl]
    add  a, e
    cp   $03
    ld   sp, hl
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
    nop
    nop
    nop
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
    ld   bc, label_1FF
    ei
    rlca
    ld   [bc], a
    cp   $06
    cp   $04
    db   $FC ; Undefined instruction
    inc  c
    db   $FC ; Undefined instruction
    ld    hl, sp+$08
    rst  $38
    rst  $38
    nop
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
    rst  $38
    nop
    rlca
    rlca
    dec  de
    inc  e
    cpl
    jr   nc, label_E7B86
    ld   h, b
    ld   a, a
    ld   b, b
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    ld   [$FFE0], a
    ld    hl, sp+$18
    call nz, label_8204
    ld   [bc], a
    add  a, d
    ld   [bc], a
    add  a, c
    inc  bc
    push bc
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    rlca
    rlca
    dec  de
    inc  e
    cpl
    jr   nc, label_E7BA6
    ld   h, b
    ld   a, a
    ld   b, b
    cp   a
    ret  nz
    cp   a
    ret  nz
    cp   a
    ret  nz
    ld   [$FFE0], a
    ld    hl, sp+$18
    call nz, label_8204
    ld   [bc], a
    add  a, d
    ld   [bc], a
    add  a, c
    inc  bc
    push bc
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    rrca
    inc  c
    rra
    db   $10
    db   $3F
    jr   nz, label_E7BEC
    ld   b, b
    rst  $38
    add  a, b
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
    rst  $38
    nop
    nop
    ld    hl, sp+$00

label_E7B86::
    ld    hl, sp+$00
    db   $FC ; Undefined instruction
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    add  a, b
    add  a, b
    add  a, b
    add  a, b
    ret  nz
    ret  nz
    ld   a, h
    ld   a, h
    ld   h, a
    ld   a, a
    ld   hl, label_303F
    ccf
    db   $10
    db   $1F
    sbc  a, a
    ld   [$FF9F], a
    ld   [$FF9F], a
    ld   [$FF8F], a
    ld   a, [$FF41]
    cp   $40
    rst  $38
    jr   nz, label_E7BAD
    jr   nz, label_E7BAF
    ret  nz
    ccf
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld   a, a
    add  a, b
    inc  bc
    db   $FC ; Undefined instruction
    nop
    rst  $38
    inc  bc
    db   $FC ; Undefined instruction
    ccf
    ret  nz
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    ld    hl, sp+$07
    ret  nz
    ccf
    nop
    rst  $38
    pop  af
    rrca
    ld   sp, hl
    rlca
    jp   hl
    rla
    pop  af
    rrca
    ld  [$FF00+C], a
    rra
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  e
    rst  $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_E7BE8::
    nop
    nop
    nop
    nop

label_E7BEC::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld    hl, sp+$18
    ld   a, [$FF10]
    pop  af
    jr   nc, label_E7BE8
    jr   nz, label_E7BEC
    ld   [rSCX], a
    ld   b, b
    rst  0
    ret  nz
    add  a, a
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
    cp   a
    ret  nz
    cp   a
    ret  nz
    sbc  a, a
    ld   [$FFDF], a
    ld   [$FFCF], a
    ld   a, [$FFE3]
    cp   h
    ld    hl, sp+$9F
    add  a, a
    rst  $38
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    ld   sp, hl
    rlca
    ld   a, [$F207]
    rrca
    rst  0
    inc  a
    dec  de
    db   $FC ; Undefined instruction
    db   $E4 ; Undefined instruction
    ei
    cp   a
    ret  nz
    cp   a
    ret  nz
    sbc  a, a
    ld   [$FF5F], a
    ld   [rVBK], a
    ld   a, [$FFA3]
    ld   a, h
    jr   label_E7C4D
    rlca
    rst  $38
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    ld   sp, hl
    rlca
    ei
    rlca
    di
    rrca
    push bc
    ccf
    ld   de, $E1FF
    rst  $38
    rlca
    rlca
    rra
    jr   label_E7CE4
    ld   h, b
    rst  $28

label_E7C67::
    ret  nc
    rst  0
    cp   b
    ld   [$FF1F], a
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    jr   label_E7CB1
    ld   [$8C0F], sp
    rrca
    add  a, h
    rlca
    add  a, $07
    jp   nz, label_E303
    inc  bc
    pop  hl
    ld   bc, rNR23
    ld   c, $FB
    ccf
    di
    cp   $C6
    ld   a, b
    ld   [label_818], sp
    inc  e
    inc  c
    rst  $38
    rst  $30
    nop

label_E7CB1::
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    ccf
    rlca
    ld   [hl], b
    nop
    ld   a, b
    nop
    inc  a
    jr   c, label_E7CBE
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   [$FF0E], a
    nop
    ld   e, $00
    inc  a
    inc  e
    rst  $38
    rst  $38
    db   $10
    db   $FF
    ld   h, b
    rst  $38
    ret  nz
    rst  $18
    ld   h, b
    ld   l, a
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    db   $10
    ld   [$FFE0], a
    jr   label_E7CE1
    ld   c, $FB

label_E7CE4::
    ccf
    di
    cp   $C6
    ld   a, b
    ld   [label_818], sp
    inc  e
    inc  c
    rst  $38
    rst  $30
    cp   $7F
    rst  $20
    jp   label_BFBD
    add  a, l
    xor  e
    add  a, l
    xor  c
    add  a, e
    xor  l
    di
    add  a, l
    di
    add  a, l
    rst  $38
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   [$FF9F], a
    rst  $38
    rst  $38
    ld   b, b
    add  a, b
    add  a, b
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
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
    rst  $38
    cp   $FF
    ld   [bc], a
    ld   bc, $0101
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, rIE
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    rrca
    ld   sp, hl
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
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    adc  a, a
    rst  $38
    ld   a, [$FF9F]
    rst  $38
    rst  $38
    ld   bc, label_1FF
    rst  $38
    ld   sp, hl
    ld   bc, label_1F9
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rlca
    ld   sp, hl
    ld   a, a
    ld   a, a
    ret  nz
    add  a, b
    add  a, b
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    rst  $38
    rst  $38
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
    rst  $38
    rst  $38
    rst  $38
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
    rst  $38
    cp   $FE
    inc  bc
    ld   bc, $0101
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
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
    ld   a, [hl]
    ld   a, [hl]
    rst  $20
    jp   label_BFBD
    add  a, l
    xor  e
    add  a, l
    xor  c
    add  a, e
    xor  l
    di
    add  a, l
    di
    add  a, l
    ld   [$FF9F], a
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, [hl]
    add  a, c
    add  a, a
    sbc  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    ld   a, a
    rst  $38
    ret  nz
    cp   a
    ret  nz
    cp   a
    nop
    nop
    jp   nc, label_EF00
    nop
    sbc  a, a
    nop
    sbc  a, c
    nop
    ld   sp, hl
    nop
    rst  $38
    nop
    rst  $28
    db   $10
    db   $FF
    nop
    rst  $38
    nop
    ld   a, $C1
    sbc  a, l
    ld   h, d
    sbc  a, l
    ld   h, d
    adc  a, c
    db   $76 ; Halt
    ret
    ld   [hl], $C9
    ld   [hl], $FD
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, $FFFE
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
    db   $FD ; Undefined instruction
    rrca
    ld   sp, hl
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    ld   sp, hl
    add  hl, bc
    reti
    add  hl, hl
    ld   sp, hl
    add  hl, bc
    ld    hl, sp+$08
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38

label_E7E66::
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
    ld   a, [$FF9F]
    sbc  a, a
    sub  a, b
    sbc  a, e
    sub  a, h
    sbc  a, a
    sub  a, b
    sbc  a, a
    sub  a, b
    sbc  a, a
    sub  a, b
    sbc  a, a

label_E7E8D::
    sub  a, b
    dec  de
    inc  d
    rlca
    ld   sp, hl
    ld   sp, hl
    ld   bc, label_1F9
    ld   sp, hl
    ld   bc, $8179
    pop  hl
    add  hl, de
    ld   sp, hl
    ld   bc, label_1F9
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    cp   a
    add  a, b
    ld   a, a
    rst  $38
    ret  nz
    cp   a
    ret  nz
    cp   a
    rst  $38
    nop
    rst  $30
    ld   [label_4FB], sp
    ld   sp, hl
    ld   b, $89
    db   $76 ; Halt
    push bc
    db   $3A ; ldd  a, [hl]
    rst  $20
    jr   label_E7EBE
    nop
    rst  $38
    nop
    rst  $28
    db   $10
    db   $DF
    jr   nz, label_E7E66
    ld   h, b
    sub  a, c
    ld   l, [hl]
    and  e
    ld   e, h
    rst  $20
    jr   label_E7ECE
    nop
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, label_1FD
    db   $FD ; Undefined instruction
    ld   bc, $FFFE
    inc  bc
    db   $FD ; Undefined instruction
    inc  bc
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
    di
    add  a, l
    sub  a, e
    and  l
    sbc  a, c
    and  e
    sbc  a, c
    and  e
    sub  a, e
    and  l
    sub  a, e
    push hl
    add  a, e
    push de
    adc  a, c
    db   $D3 ; Undefined instruction
    sbc  a, l
    add  a, d
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    sbc  a, a
    add  a, b
    rst  $38
    rst  $38
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    rst  $38
    rst  $38
    rst  $38
    nop
    rst  $38
    nop
    reti
    nop
    ld   sp, hl
    nop
    rst  $38
    nop
    di
    nop
    ld   bc, $0000
    nop
    ret
    ld   [hl], $C9
    ld   [hl], $CB
    inc  [hl]
    db   $EB ; Undefined instruction
    inc  d
    db   $EB ; Undefined instruction
    inc  d
    rst  $28
    db   $10
    db   $FF
    nop
    rst  $38
    nop
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c

label_E7F4A::
    ld   a, l
    add  a, c

label_E7F4C::
    ld   a, l
    add  a, c
    rst  $38
    rst  $38
    ld   a, b
    adc  a, h
    rst  $30
    rrca
    rst  $38
    nop
    ld   sp, hl
    ld   b, $FF
    nop
    rst  $28
    db   $10
    db   $FF
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  $38
    nop
    ei
    inc  b
    rst  $38
    nop
    rst  $28
    db   $10
    db   $FF
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    rst  $38
    rst  8
    jr   nc, label_E7F76
    nop
    cp   $01
    db   $FC ; Undefined instruction
    inc  bc
    xor  $11
    rst  $38
    rst  $38
    dec  de
    inc  [hl]
    rst  $28
    ld   a, [$FFFF]
    nop
    call c, label_FD23
    ld   [bc], a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    rst  $38
    cp   c
    ld   b, c
    ld   sp, hl
    ld   bc, label_1F9
    ld   sp, hl
    ld   bc, label_1F9
    ld   sp, hl
    ld   bc, label_1F9
    rst  $38
    rst  $38
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
    cp   [hl]
    add  a, c
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
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $20
    nop
    rst  $20
    nop
    add  a, c
    jr   label_E7F4A
    jr   label_E7F4C
    ld   h, [hl]
    rst  $20
    nop
    rst  $20
    jr   label_FFFF804E
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
    add  a, c
    ld   a, l
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
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ret
    sub  a, e
    sbc  a, c
    and  e
    sbc  a, c
    and  e
    cp   c
    jp   label_C399
    adc  a, e
    push de
    db   $3A ; ldd  a, [hl]
    ld   a, $00
    nop
