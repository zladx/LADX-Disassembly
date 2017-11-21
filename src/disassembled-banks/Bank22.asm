section "bank22",romx,bank[$16]
    add  a, [hl]
    ld   d, c
    adc  a, l
    ld   d, c
    sub  a, d
    ld   d, c
    sub  a, l
    ld   d, c
    sbc  a, b
    ld   d, c
    sbc  a, e
    ld   d, c
    sbc  a, [hl]
    ld   d, c
    and  e
    ld   d, c
    and  h
    ld   d, c
    xor  c
    ld   d, c
    xor  d
    ld   d, c
    xor  a
    ld   d, c
    or   h
    ld   d, c
    cp   c
    ld   d, c
    cp   [hl]
    ld   d, c
    cp   a
    ld   d, c
    call nz, label_CB51
    ld   d, c
    adc  a, $51
    push de
    ld   d, c
    jp  c, label_DF51
    ld   d, c
    ld  [$FF00+C], a
    ld   d, c
    push hl
    ld   d, c
    db   $E8 ; add  sp, d
    ld   d, c
    jp   hl
    ld   d, c
    db   $EC ; Undefined instruction
    ld   d, c
    db   $ED ; Undefined instruction
    ld   d, c
    xor  $51
    rst  $28
    ld   d, c
    ld   a, [$FF00+C]
    push af
    ld   d, c
    ld    hl, sp+$51
    rst  $38
    ld   d, c
    ld   b, $52
    dec  c
    ld   d, d
    ld   [de], a
    ld   d, d
    dec  e
    ld   d, d
    ldi  [hl], a
    ld   d, d
    inc  hl
    ld   d, d
    inc  h
    ld   d, d
    add  hl, hl
    ld   d, d
    inc  l
    ld   d, d
    ld   sp, label_3252
    ld   d, d
    scf
    ld   d, d
    db   $3A ; ldd  a, [hl]
    ld   d, d
    dec  a
    ld   d, d
    ld   b, d
    ld   d, d
    ld   b, l
    ld   d, d
    ld   c, h
    ld   d, d
    ld   c, a
    ld   d, d
    ld   d, [hl]
    ld   d, d
    ld   e, c
    ld   d, d
    ld   e, d
    ld   d, d
    ld   e, l
    ld   d, d
    ld   e, [hl]
    ld   d, d
    ld   h, c
    ld   d, d
    ld   h, [hl]
    ld   d, d
    ld   l, e
    ld   d, d
    ld   l, [hl]
    ld   d, d
    ld   [hl], e
    ld   d, d
    db   $76 ; Halt
    ld   d, d
    ld   a, e
    ld   d, d
    ld   a, [hl]
    ld   d, d
    add  a, e
    ld   d, d
    add  a, [hl]
    ld   d, d
    adc  a, l
    ld   d, d
    sub  a, d
    ld   d, d
    sub  a, l
    ld   d, d
    sub  a, [hl]
    ld   d, d
    sbc  a, e
    ld   d, d
    and  b
    ld   d, d
    and  e
    ld   d, d
    and  h
    ld   d, d
    and  a
    ld   d, d
    xor  b
    ld   d, d
    xor  e
    ld   d, d
    xor  [hl]
    ld   d, d
    or   c
    ld   d, d
    cp   b
    ld   d, d
    cp   e
    ld   d, d
    cp   [hl]
    ld   d, d
    jp   label_C652
    ld   d, d
    bit  2, d
    call z, label_D152
    ld   d, d
    sub  a, $52
    db   $DB
    ld   d, d
    call c, label_DF52
    ld   d, d
    ld   [rHDMA2], a
    rst  $20
    ld   d, d
    db   $EC ; Undefined instruction
    ld   d, d
    pop  af
    ld   d, d
    or   $52
    ei
    ld   d, d
    nop
    ld   d, e
    inc  bc
    ld   d, e
    ld   b, $53
    dec  bc
    ld   d, e
    ld   c, $53
    rla
    ld   d, e
    jr   nz, label_58125
    inc  hl
    ld   d, e
    inc  h
    ld   d, e
    dec  hl
    ld   d, e
    inc  l
    ld   d, e
    cpl
    ld   d, e
    jr   c, label_58131
    dec  sp
    ld   d, e
    ld   b, [hl]
    ld   d, e
    ld   c, e
    ld   d, e
    ld   d, d
    ld   d, e
    ld   e, c
    ld   d, e
    ld   h, b
    ld   d, e
    ld   h, l
    ld   d, e
    ld   l, b
    ld   d, e
    ld   [hl], e
    ld   d, e
    ld   a, h
    ld   d, e
    ld   a, l
    ld   d, e
    ld   a, [hl]
    ld   d, e
    ld   a, a
    ld   d, e
    add  a, h
    ld   d, e
    adc  a, e
    ld   d, e
    sub  a, b
    ld   d, e
    sub  a, a
    ld   d, e
    and  b
    ld   d, e
    and  e
    ld   d, e
    and  [hl]
    ld   d, e
    xor  l
    ld   d, e
    or   h
    ld   d, e
    cp   c
    ld   d, e
    cp   d
    ld   d, e
    pop  bc
    ld   d, e
    add  a, $53
    bit  2, e
    ret  nc
    ld   d, e
    reti
    ld   d, e
    sbc  a, $53
    rst  $18
    ld   d, e

label_5811C::
    ld   [rHDMA3], a
    push hl
    ld   d, e

label_58120::
    db   $E8 ; add  sp, d
    ld   d, e
    jp   hl
    ld   d, e
    ld   a, [$FF00+C]
    ld   bc, label_654
    ld   d, h
    rlca
    ld   d, h
    ld   c, $54
    inc  de
    ld   d, h
    ld   d, $54
    dec  e
    ld   d, h
    ldi  [hl], a
    ld   d, h
    add  hl, hl
    ld   d, h
    ld   l, $54
    ld   sp, label_3854
    ld   d, h
    dec  a
    ld   d, h
    ld   b, d
    ld   d, h
    ld   c, a
    ld   d, h
    ld   e, b
    ld   d, h
    ld   e, l
    ld   d, h
    ld   h, [hl]
    ld   d, h
    ld   l, l
    ld   d, h
    ld   [hl], h
    ld   d, h
    ld   [hl], a
    ld   d, h
    ld   a, b
    ld   d, h
    ld   a, a
    ld   d, h
    add  a, [hl]
    ld   d, h
    add  a, a
    ld   d, h
    adc  a, [hl]
    ld   d, h
    sub  a, l
    ld   d, h
    and  d
    ld   d, h
    xor  e
    ld   d, h
    xor  h
    ld   d, h
    or   l
    ld   d, h
    cp   d
    ld   d, h
    cp   a
    ld   d, h
    jp   z, label_CF54
    ld   d, h
    ret  nc
    ld   d, h
    db   $D3 ; Undefined instruction
    ld   d, h
    call nc, label_D954
    ld   d, h
    ld  [$FF00+C], a
    ld   d, h
    rst  $20
    ld   d, h
    db   $EC ; Undefined instruction
    ld   d, h
    rst  $30
    ld   d, h
    inc  b
    ld   d, l
    ld   de, label_1C55
    ld   d, l
    dec  e
    ld   d, l
    ldi  [hl], a
    ld   d, l
    add  hl, hl
    ld   d, l
    jr   nc, label_581DF
    add  hl, sp
    ld   d, l
    ld   b, b
    ld   d, l
    ld   b, e
    ld   d, l
    ld   b, h
    ld   d, l
    ld   c, c
    ld   d, l
    ld   c, h
    ld   d, l
    ld   d, e
    ld   d, l
    ld   e, d
    ld   d, l
    ld   h, e
    ld   d, l
    ld   l, h
    ld   d, l
    ld   [hl], c
    ld   d, l
    db   $76 ; Halt
    ld   d, l
    ld   a, c
    ld   d, l
    ld   a, [hl]
    ld   d, l
    add  a, e
    ld   d, l
    add  a, h
    ld   d, l
    adc  a, e
    ld   d, l
    sub  a, [hl]
    ld   d, l
    sub  a, a
    ld   d, l
    sbc  a, b
    ld   d, l
    sbc  a, l
    ld   d, l
    and  d
    ld   d, l
    xor  c
    ld   d, l
    or   b
    ld   d, l
    cp   a
    ld   d, l
    ret  z
    ld   d, l
    rst  8
    ld   d, l
    jp  c, label_DF55
    ld   d, l
    and  $55
    rst  $28
    ld   d, l
    ld    hl, sp+$55
    ei
    ld   d, l
    db   $FC ; Undefined instruction
    ld   d, l
    db   $FD ; Undefined instruction
    ld   d, l
    nop
    ld   d, [hl]
    dec  b
    ld   d, [hl]
    ld   a, [bc]
    ld   d, [hl]
    rrca
    ld   d, [hl]
    ld   d, $56
    add  hl, de
    ld   d, [hl]
    ld   a, [de]
    ld   d, [hl]
    dec  e

label_581DF::
    ld   d, [hl]
    ldi  [hl], a
    ld   d, [hl]
    add  hl, hl
    ld   d, [hl]
    jr   nc, label_5823C
    scf
    ld   d, [hl]
    inc  a
    ld   d, [hl]
    ld   b, e
    ld   d, [hl]
    ld   b, [hl]
    ld   d, [hl]
    ld   b, a
    ld   d, [hl]
    ld   c, b
    ld   d, [hl]
    ld   c, l
    ld   d, [hl]
    ld   c, [hl]
    ld   d, [hl]
    ld   d, e
    ld   d, [hl]
    ld   e, b
    ld   d, [hl]
    ld   e, c
    ld   d, [hl]
    ld   e, h
    ld   d, [hl]
    ld   e, l

label_581FF::
    ld   d, [hl]
    ld   b, b
    ld   b, [hl]
    ld   b, c
    ld   b, [hl]
    ld   b, d
    ld   b, [hl]
    ld   b, l
    ld   b, [hl]
    ld   c, h
    ld   b, [hl]
    ld   d, c
    ld   b, [hl]
    ld   e, d
    ld   b, [hl]
    ld   e, l
    ld   b, [hl]
    ld   h, d
    ld   b, [hl]
    ld   h, e
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   l, a
    ld   b, [hl]
    ld   a, b
    ld   b, [hl]
    ld   a, c
    ld   b, [hl]
    ld   a, h
    ld   b, [hl]
    add  a, e
    ld   b, [hl]

label_58220::
    adc  a, d
    ld   b, [hl]
    sub  a, c
    ld   b, [hl]
    sbc  a, b
    ld   b, [hl]
    and  c
    ld   b, [hl]
    xor  b
    ld   b, [hl]
    or   c
    ld   b, [hl]
    cp   [hl]
    ld   b, [hl]
    jp   label_C646
    ld   b, [hl]
    ret
    ld   b, [hl]
    adc  a, $46
    rst  8
    ld   b, [hl]
    ret  nc
    ld   b, [hl]
    db   $D3 ; Undefined instruction
    ld   b, [hl]

label_5823C::
    ret  c
    ld   b, [hl]
    db   $DB
    ld   b, [hl]
    sbc  a, $46
    db   $E3 ; Undefined instruction
    ld   b, [hl]
    ld   a, [$FF46]
    ei
    ld   b, [hl]
    ld   [bc], a
    ld   b, a
    rrca
    ld   b, a
    ld   a, [de]
    ld   b, a
    inc  hl
    ld   b, a
    ld   a, [hli]
    ld   b, a
    cpl
    ld   b, a
    db   $3A ; ldd  a, [hl]
    ld   b, a
    dec  a
    ld   b, a
    ld   b, b
    ld   b, a
    ld   b, a
    ld   b, a
    ld   c, b
    ld   b, a
    ld   c, e
    ld   b, a
    ld   e, b
    ld   b, a
    ld   h, l
    ld   b, a
    ld   l, b
    ld   b, a
    ld   l, l
    ld   b, a
    ld   [hl], h
    ld   b, a
    ld   a, e
    ld   b, a
    add  a, b
    ld   b, a
    adc  a, e
    ld   b, a
    sub  a, d
    ld   b, a
    sub  a, a
    ld   b, a
    and  b
    ld   b, a
    and  l
    ld   b, a
    xor  h
    ld   b, a
    or   e
    ld   b, a
    cp   b
    ld   b, a
    cp   e
    ld   b, a
    cp   [hl]
    ld   b, a
    ret
    ld   b, a
    jp   nc, label_DB47
    ld   b, a
    and  $47
    db   $ED ; Undefined instruction
    ld   b, a
    db   $F4 ; Undefined instruction
    ld   b, a
    rst  $30
    ld   b, a
    nop
    ld   c, b
    add  hl, bc
    ld   c, b
    inc  d
    ld   c, b
    dec  e
    ld   c, b
    ld   h, $48
    cpl
    ld   c, b
    db   $3A ; ldd  a, [hl]
    ld   c, b
    ld   b, c
    ld   c, b
    ld   c, d
    ld   c, b
    ld   d, c
    ld   c, b
    ld   e, d
    ld   c, b
    ld   e, l
    ld   c, b
    ld   h, b
    ld   c, b
    ld   l, e
    ld   c, b
    db   $76 ; Halt
    ld   c, b
    add  a, c
    ld   c, b
    adc  a, b
    ld   c, b
    sub  a, a
    ld   c, b
    sbc  a, d
    ld   c, b
    sbc  a, l
    ld   c, b
    xor  b
    ld   c, b
    or   c
    ld   c, b
    or   d
    ld   c, b
    or   a
    ld   c, b
    cp   h
    ld   c, b
    push bc
    ld   c, b
    jp   nc, label_D548
    ld   c, b
    ld   [rOBP0], a
    push hl
    ld   c, b
    xor  $48
    rst  $28
    ld   c, b
    ld    hl, sp+$48
    inc  bc
    ld   c, c
    inc  c
    ld   c, c
    dec  d
    ld   c, c
    jr   nz, label_58323
    add  hl, hl
    ld   c, c
    ldd  [hl], a
    ld   c, c
    add  hl, sp
    ld   c, c
    ld   b, h
    ld   c, c
    ld   c, c
    ld   c, c
    ld   d, h
    ld   c, c
    ld   e, e
    ld   c, c
    ld   h, d
    ld   c, c
    ld   l, c
    ld   c, c
    ld   [hl], h
    ld   c, c
    ld   a, l
    ld   c, c
    add  a, h
    ld   c, c
    adc  a, l
    ld   c, c
    sub  a, h
    ld   c, c
    sub  a, a
    ld   c, c
    and  b
    ld   c, c
    and  e
    ld   c, c
    and  [hl]
    ld   c, c
    and  a

label_582FF::
    ld   c, c
    xor  b
    ld   c, c
    xor  e
    ld   c, c
    or   h
    ld   c, c
    or   a
    ld   c, c
    ret  nz
    ld   c, c
    jp   label_C649
    ld   c, c
    rst  0
    ld   c, c
    call nc, label_DF49
    ld   c, c
    xor  $49
    ld   sp, hl
    ld   c, c
    db   $FC ; Undefined instruction
    ld   c, c
    db   $FD ; Undefined instruction
    ld   c, c
    ld   b, $4A
    rrca
    ld   c, d

label_58320::
    jr   label_5836C
    dec  h

label_58323::
    ld   c, d
    ld   a, [hli]
    ld   c, d
    dec  l
    ld   c, d
    inc  [hl]
    ld   c, d
    ccf
    ld   c, d
    ld   b, d
    ld   c, d
    ld   c, a
    ld   c, d
    ld   e, d
    ld   c, d
    ld   h, a
    ld   c, d
    ld   [hl], d
    ld   c, d
    ld   a, e
    ld   c, d
    add  a, h
    ld   c, d
    sub  a, c
    ld   c, d
    sbc  a, b
    ld   c, d
    sbc  a, a
    ld   c, d
    xor  d
    ld   c, d
    or   c
    ld   c, d
    or   h
    ld   c, d
    cp   e
    ld   c, d
    ret  nz
    ld   c, d
    jp   label_C84A
    ld   c, d
    call label_D24A
    ld   c, d
    db   $DB
    ld   c, d
    ld   [rWY], a
    db   $E3 ; Undefined instruction
    ld   c, d
    and  $4A
    jp   hl
    ld   c, d
    ld   [$EB4A], a
    ld   c, d
    db   $EC ; Undefined instruction
    ld   c, d
    push af
    ld   c, d
    nop
    ld   c, e
    add  hl, bc
    ld   c, e
    db   $10 ; Undefined instruction
    rla
    ld   c, e

label_5836C::
    ld   a, [de]
    ld   c, e
    rra
    ld   c, e
    ld   a, [hli]
    ld   c, e
    scf
    ld   c, e
    db   $3A ; ldd  a, [hl]
    ld   c, e
    ld   b, e
    ld   c, e
    ld   c, [hl]
    ld   c, e
    ld   d, c
    ld   c, e
    ld   e, b
    ld   c, e
    ld   h, e
    ld   c, e
    ld   l, h
    ld   c, e
    ld   [hl], a
    ld   c, e
    add  a, d
    ld   c, e
    adc  a, l
    ld   c, e
    sub  a, b
    ld   c, e
    sub  a, l
    ld   c, e
    sbc  a, d
    ld   c, e
    sbc  a, e
    ld   c, e
    and  b
    ld   c, e
    and  a
    ld   c, e
    xor  h
    ld   c, e
    or   a
    ld   c, e
    cp   h
    ld   c, e
    ret
    ld   c, e
    sub  a, $4B
    db   $4B
    ld   c, e
    db   $E4 ; Undefined instruction
    ld   c, e
    db   $ED ; Undefined instruction
    ld   c, e
    ld    hl, sp+$4B
    rst  $38
    ld   c, e
    ld   b, $4C
    add  hl, bc
    ld   c, h
    ld   [de], a
    ld   c, h
    dec  d
    ld   c, h
    jr   nz, label_583FE
    daa
    ld   c, h
    inc  l
    ld   c, h
    dec  l
    ld   c, h
    inc  [hl]
    ld   c, h
    dec  a
    ld   c, h
    ld   b, h
    ld   c, h
    ld   b, l
    ld   c, h
    ld   b, [hl]
    ld   c, h
    ld   b, [hl]
    ld   c, h
    ld   b, [hl]
    ld   c, h
    ld   c, c
    ld   c, h
    ld   c, h
    ld   c, h
    ld   c, a
    ld   c, h
    ld   d, d
    ld   c, h
    ld   d, l
    ld   c, h
    ld   d, [hl]
    ld   c, h
    ld   e, c
    ld   c, h
    ld   e, d
    ld   c, h
    ld   e, e
    ld   c, h
    ld   e, h
    ld   c, h
    ld   h, c
    ld   c, h
    ld   h, d
    ld   c, h
    ld   h, l
    ld   c, h
    ld   h, [hl]
    ld   c, h
    ld   h, a
    ld   c, h
    ld   l, h
    ld   c, h
    ld   l, l
    ld   c, h
    ld   [hl], b
    ld   c, h
    ld   [hl], c
    ld   c, h
    ld   [hl], h
    ld   c, h
    ld   [hl], a
    ld   c, h
    ld   a, b
    ld   c, h
    add  a, c
    ld   c, h
    add  a, d
    ld   c, h
    sub  a, l
    ld   c, h
    sbc  a, b
    ld   c, h
    sbc  a, a
    ld   c, h
    and  b
    ld   c, h

label_583FE::
    and  c
    ld   c, h
    and  h
    ld   c, h
    and  l
    ld   c, h
    xor  d
    ld   c, h
    or   c
    ld   c, h
    cp   b
    ld   c, h
    pop  bc
    ld   c, h
    jp   nz, label_C54C
    ld   c, h
    call z, label_D14C
    ld   c, h
    jp   nc, label_D94C
    ld   c, h
    jp  c, label_E14C
    ld   c, h
    db   $E8 ; add  sp, d
    ld   c, h
    db   $EB ; Undefined instruction
    ld   c, h
    ld   a, [$FF4C]
    ld   sp, hl
    ld   c, h
    nop
    ld   c, l
    rlca
    ld   c, l
    inc  c
    ld   c, l
    rrca
    ld   c, l
    jr   label_5847B
    ld   hl, label_2A4D
    ld   c, l
    ld   sp, label_384D
    ld   c, l
    dec  sp
    ld   c, l
    ld   b, d
    ld   c, l
    ld   c, e
    ld   c, l
    ld   d, d
    ld   c, l
    ld   d, l
    ld   c, l
    ld   h, b
    ld   c, l
    ld   l, c
    ld   c, l
    ld   [hl], d
    ld   c, l
    ld   [hl], e
    ld   c, l
    ld   [hl], h
    ld   c, l
    ld   a, l
    ld   c, l
    add  a, [hl]
    ld   c, l
    add  a, a
    ld   c, l
    adc  a, b
    ld   c, l
    adc  a, l
    ld   c, l
    sub  a, [hl]
    ld   c, l
    sbc  a, a
    ld   c, l
    and  [hl]
    ld   c, l
    xor  c
    ld   c, l
    or   d
    ld   c, l
    or   e
    ld   c, l
    or   h
    ld   c, l
    or   a
    ld   c, l
    cp   b
    ld   c, l
    cp   e
    ld   c, l
    cp   h
    ld   c, l
    cp   a
    ld   c, l
    ret  z
    ld   c, l
    ret
    ld   c, l
    jp   z, label_CD4D
    ld   c, l
    adc  a, $4D
    db   $DB
    ld   c, l
    sbc  a, $4D
    rst  $20

label_5847B::
    ld   c, l
    db   $EC ; Undefined instruction
    ld   c, l
    push af
    ld   c, l
    ld   a, [$FD4D]
    ld   c, l
    inc  b
    ld   c, [hl]
    dec  bc
    ld   c, [hl]
    ld   c, $4E
    rla
    ld   c, [hl]
    inc  h
    ld   c, [hl]
    add  hl, hl
    ld   c, [hl]
    jr   nc, label_584E0
    scf
    ld   c, [hl]
    jr   c, label_584E4
    dec  a
    ld   c, [hl]
    ld   c, b
    ld   c, [hl]
    ld   c, l
    ld   c, [hl]
    ld   d, b
    ld   c, [hl]
    ld   d, e
    ld   c, [hl]
    ld   e, b
    ld   c, [hl]
    ld   e, e
    ld   c, [hl]
    ld   e, [hl]
    ld   c, [hl]
    ld   h, c
    ld   c, [hl]
    ld   l, d
    ld   c, [hl]
    ld   l, a
    ld   c, [hl]
    db   $76 ; Halt
    ld   c, [hl]
    ld   a, a
    ld   c, [hl]
    add  a, d
    ld   c, [hl]
    adc  a, e
    ld   c, [hl]
    adc  a, h
    ld   c, [hl]
    sub  a, l
    ld   c, [hl]
    sbc  a, b
    ld   c, [hl]
    and  c
    ld   c, [hl]
    and  h
    ld   c, [hl]
    xor  l
    ld   c, [hl]
    or   [hl]
    ld   c, [hl]
    cp   e
    ld   c, [hl]
    ret  nz
    ld   c, [hl]
    pop  bc
    ld   c, [hl]
    call nz, label_CB4E
    ld   c, [hl]
    call nc, label_D94E
    ld   c, [hl]
    sbc  a, $4E
    push hl
    ld   c, [hl]
    ld   [$F14E], a
    ld   c, [hl]
    or   $4E
    rst  $30
    ld   c, [hl]
    ld    hl, sp+$4E
    ld   sp, hl
    ld   c, [hl]

label_584E0::
    db   $FC ; Undefined instruction
    ld   c, [hl]
    db   $FD ; Undefined instruction
    ld   c, [hl]

label_584E4::
    cp   $4E
    rst  $38
    ld   c, [hl]
    nop
    ld   c, a
    inc  bc
    ld   c, a
    inc  b
    ld   c, a
    dec  b
    ld   c, a
    ld   b, $4F
    rlca
    ld   c, a
    ld   [label_B4F], sp
    ld   c, a
    inc  c
    ld   c, a
    dec  c
    ld   c, a
    ld   c, $4F
    rrca
    ld   c, a
    ld   [de], a
    ld   c, a
    dec  de
    ld   c, a
    ldi  [hl], a
    ld   c, a
    dec  hl
    ld   c, a
    inc  l
    ld   c, a
    dec  l
    ld   c, a
    jr   nc, label_5855D
    add  hl, sp
    ld   c, a
    ld   a, $4F
    ld   b, a
    ld   c, a
    ld   c, h
    ld   c, a
    ld   c, l
    ld   c, a
    ld   d, [hl]
    ld   c, a
    ld   e, e
    ld   c, a
    ld   e, h
    ld   c, a
    ld   h, l
    ld   c, a
    ld   l, d
    ld   c, a
    ld   l, e
    ld   c, a
    ld   [hl], h
    ld   c, a
    ld   a, c

label_58527::
    ld   c, a
    add  a, d
    ld   c, a
    add  a, l
    ld   c, a
    adc  a, h
    ld   c, a
    adc  a, a
    ld   c, a
    sbc  a, [hl]
    ld   c, a
    xor  c
    ld   c, a
    xor  h
    ld   c, a
    xor  a
    ld   c, a
    or   d
    ld   c, a
    or   l
    ld   c, a
    cp   b
    ld   c, a
    cp   c
    ld   c, a
    jp   nz, label_C54F
    ld   c, a
    ret  z
    ld   c, a
    reti
    ld   c, a
    ld  [$FF00+C], a
    ld   c, a
    rst  $20
    ld   c, a
    ld   [$EF4F], a
    ld   c, a
    db   $F4 ; Undefined instruction
    ld   c, a
    ld   sp, hl
    ld   c, a
    cp   $4F
    ld   bc, label_450
    ld   d, b
    add  hl, bc
    ld   d, b
    db   $10 ; Undefined instruction
    dec  d
    ld   d, b
    inc  e
    ld   d, b
    rra
    ld   d, b
    ldi  [hl], a
    ld   d, b
    daa
    ld   d, b
    jr   z, label_585BA
    dec  hl
    ld   d, b
    jr   nc, label_585BE
    add  hl, sp
    ld   d, b
    ld   b, b
    ld   d, b
    ld   b, a
    ld   d, b
    ld   c, [hl]
    ld   d, b
    ld   d, c
    ld   d, b
    ld   d, [hl]
    ld   d, b
    ld   e, l
    ld   d, b
    ld   h, [hl]
    ld   d, b
    ld   l, a
    ld   d, b
    ld   a, d
    ld   d, b
    ld   a, e
    ld   d, b
    ld   a, h
    ld   d, b
    add  a, c
    ld   d, b
    adc  a, b
    ld   d, b
    adc  a, c
    ld   d, b
    sub  a, b
    ld   d, b
    sub  a, e
    ld   d, b
    sbc  a, [hl]
    ld   d, b
    and  e
    ld   d, b
    and  [hl]
    ld   d, b
    xor  l
    ld   d, b
    or   b
    ld   d, b
    or   e
    ld   d, b
    cp   h
    ld   d, b
    cp   a
    ld   d, b
    ret  z
    ld   d, b
    bit  2, b
    ret  nc
    ld   d, b
    reti
    ld   d, b
    jp  c, label_DB50
    ld   d, b
    call c, label_E150
    ld   d, b
    db   $E4 ; Undefined instruction
    ld   d, b
    jp   hl
    ld   d, b
    xor  $50
    pop  af
    ld   d, b
    ld   a, [$FF00+C]

label_585BA::
    push af
    ld   d, b
    ld    hl, sp+$50

label_585BE::
    rst  $38
    ld   d, b
    inc  b
    ld   d, c
    dec  c
    ld   d, c
    db   $10 ; Undefined instruction
    inc  de
    ld   d, c
    ld   d, $51
    add  hl, de
    ld   d, c
    inc  e
    ld   d, c
    dec  h
    ld   d, c
    inc  l
    ld   d, c
    cpl
    ld   d, c
    ldd  [hl], a
    ld   d, c
    scf
    ld   d, c
    jr   c, label_5862B
    add  hl, sp
    ld   d, c
    db   $3A ; ldd  a, [hl]
    ld   d, c
    ld   b, c
    ld   d, c
    ld   c, d
    ld   d, c
    ld   c, l
    ld   d, c
    ld   d, d
    ld   d, c
    ld   d, e
    ld   d, c
    ld   d, h
    ld   d, c
    ld   d, a
    ld   d, c
    ld   e, h
    ld   d, c
    ld   h, c
    ld   d, c
    ld   h, h
    ld   d, c
    ld   h, l
    ld   d, c
    ld   l, d
    ld   d, c
    ld   [hl], c
    ld   d, c
    ld   a, b
    ld   d, c
    ld   a, c
    ld   d, c
    add  a, b
    ld   d, c
    add  a, e
    ld   d, c
    ld   h, h
    ld   d, [hl]
    ld   h, a
    ld   d, [hl]
    ld   l, d
    ld   d, [hl]
    ld   l, e
    ld   d, [hl]
    ld   l, [hl]
    ld   d, [hl]
    ld   [hl], c
    ld   d, [hl]
    ld   a, [hl]
    ld   d, [hl]
    adc  a, e
    ld   d, [hl]
    sub  a, h
    ld   d, [hl]
    sbc  a, a
    ld   d, [hl]
    and  [hl]
    ld   d, [hl]

label_58616::
    cp   e
    ld   d, [hl]
    ret  nz
    ld   d, [hl]
    jp   label_C856
    ld   d, [hl]
    db   $D3 ; Undefined instruction
    ld   d, [hl]

label_58620::
    sbc  a, $56
    db   $E3 ; Undefined instruction
    ld   d, [hl]
    db   $E8 ; add  sp, d
    ld   d, [hl]
    db   $ED ; Undefined instruction
    ld   d, [hl]
    xor  $56
    di

label_5862B::
    ld   d, [hl]
    nop
    ld   d, a
    nop
    ld   d, a
    nop
    ld   d, a
    nop
    ld   d, a
    nop
    ld   d, a
    nop
    ld   d, a
    nop
    ld   d, a
    nop
    ld   d, a
    nop
    ld   d, a
    nop
    ld   d, a
    rst  $38
    rst  $38
    inc  h
    add  hl, sp
    rst  $38
    dec  b
    ld   b, d
    ldd  [hl], a
    inc  l
    ld   d, l
    inc  l
    rst  $38
    inc  d
    rla
    inc  bc
    ld   b, d
    rst  $38
    inc  de
    rla
    ld   h, [hl]
    ld   d, $15
    inc  e
    inc  sp
    inc  e
    rst  $38
    inc  hl
    ld   e, c
    rst  $38
    ld   sp, label_58527
    add  hl, de
    rst  $38
    rst  $38
    daa
    jr   nz, label_58665
    ldi  [hl], a
    sub  a, b
    daa
    sub  a, b
    inc  [hl]
    sub  a, b
    dec  b
    ld   b, d
    rst  $38
    ld   de, label_1827
    daa
    ld   h, c
    daa
    ld   l, b
    daa
    rst  $38
    rst  $38
    inc  h
    add  hl, hl
    rst  $38
    dec  [hl]
    add  hl, hl
    inc  d
    rla
    ld   h, a
    ld   d, $FF
    ld   b, h
    ld   e, $26
    add  hl, de
    dec  [hl]
    add  hl, de
    rst  $38
    ld   h, a
    rla
    ld   d, l
    ld   d, $23
    ld   e, $FF
    inc  [hl]
    ld   h, c
    jr   c, label_58616
    ld   [hl], $82
    rst  $38
    inc  [hl]
    add  hl, de
    dec  [hl]
    add  hl, de
    ld   b, h
    add  hl, de
    ld   b, l
    add  hl, de
    rst  $38
    inc  d
    jr   nz, label_586F6
    inc  e
    ld   d, a
    inc  e
    rst  $38
    ld   b, e
    ld   e, $46
    ld   e, $54
    add  hl, de
    ld   d, l
    add  hl, de
    rst  $38
    ld   b, d
    sbc  a, e
    ldd  [hl], a
    sbc  a, e
    inc  [hl]
    sbc  a, e
    ld   b, h
    sbc  a, e
    ld   de, label_159E
    sbc  a, [hl]
    rst  $38
    inc  hl
    jr   nz, label_586E7
    jr   nz, label_586C2
    inc  [hl]
    ld   h, c
    rst  $38
    ld   h, l
    sbc  a, a
    rst  $38
    ld   h, d
    sbc  a, a
    ld   h, l
    sbc  a, a
    rst  $38
    rst  $38
    rst  $38
    ld   b, h
    push hl
    rst  $38
    ld   d, c
    daa
    ld   e, b
    daa
    rst  $38
    dec  h
    ret  c
    rst  $38
    inc  d
    ret  c
    rst  $38
    inc  h
    ld   d, b
    ld   b, l
    ld   d, b
    rst  $38
    ldd  [hl], a
    add  hl, de
    scf
    add  hl, de

label_586E7::
    jr   label_58716
    inc  h
    ld   l, $57
    ld   l, $25
    add  a, [hl]
    rst  $38
    inc  h
    ld   h, [hl]
    ld   d, e
    dec  l
    ld   d, h
    dec  l

label_586F6::
    ld   d, l
    dec  l
    ld   d, [hl]
    dec  l
    rst  $38
    rla
    jr   nz, label_58721
    inc  e
    ld   h, h
    add  hl, de
    rst  $38
    inc  hl
    add  hl, de
    dec  h
    add  hl, de
    ld   b, e
    add  hl, de
    ld   b, l
    add  hl, de
    inc  [hl]
    ld   h, [hl]
    jr   label_58728
    rst  $38
    ld   b, h
    jr   label_58779
    jr   label_5875A
    dec  de
    ld   d, l

label_58716::
    ld   l, $63
    cpl
    rst  $38
    ld   h, c
    ld   d, d
    inc  h
    add  hl, de
    dec  [hl]
    add  hl, de
    ld   b, [hl]

label_58721::
    add  hl, de
    rst  $38
    ld   h, h
    jr   label_5878D
    add  hl, de
    inc  sp

label_58728::
    dec  bc
    rst  $38
    dec  h
    adc  a, c
    inc  [hl]
    ld   h, c
    rst  $38
    ldi  [hl], a
    add  hl, de
    ld   d, a
    add  hl, de
    dec  b
    ld   b, d
    ldd  [hl], a
    dec  l
    ld   h, [hl]
    push hl
    rst  $38
    inc  h
    add  hl, sp
    rst  $38
    inc  h
    ld   e, h
    rst  $38
    ldi  [hl], a
    add  hl, de
    ld   hl, label_58416
    push hl
    rst  $38
    rst  $38
    dec  d
    jr   nz, label_5874A
    inc  h
    add  hl, de
    ld   d, h
    add  hl, de
    ld   h, d
    rla
    inc  h
    dec  l
    ld   h, l
    dec  l
    ld   [bc], a
    ld   b, d
    rst  $38
    ld   de, label_1827
    daa
    ld   h, c
    daa
    ld   l, b
    daa
    inc  sp
    add  hl, de
    ld   [hl], $19
    rst  $38
    ld   [de], a
    ld   d, $FF
    inc  [hl]
    ld   e, $35
    ld   a, [de]
    rst  $38
    inc  b
    ld   b, d
    dec  [hl]
    ld   h, [hl]
    ld   [de], a
    ld   d, $FF
    dec  [hl]
    adc  a, a
    ld   [hl], $8F
    ld   l, b

label_58779::
    ld   l, $FF
    dec  h
    inc  l
    ld   l, b
    inc  l
    rst  $38
    inc  [hl]
    ld   h, c
    rla
    dec  l
    jr   label_587B3
    daa
    dec  l
    jr   z, label_587B7
    rst  $38
    ld   d, h
    adc  a, a

label_5878D::
    ld   b, h
    ld   l, $46
    ld   l, $FF
    ld   h, d
    inc  d
    ld   b, l
    ld   h, [hl]
    rst  $38
    ld   l, b
    ld   h, [hl]
    ld   de, label_212D
    dec  l
    ld   b, l
    add  a, [hl]
    rst  $38
    ld   b, e
    and  l
    ld   h, [hl]
    sub  a, $FF
    ld   b, e
    and  l
    ld   h, [hl]
    sub  a, $67
    sub  a, $FF
    ld   d, e
    and  d
    ld   d, a
    and  d
    ld   d, l
    sbc  a, a
    rst  $38

label_587B3::
    ld   d, h
    and  d
    ld   h, d
    sbc  a, a

label_587B7::
    rst  $38
    inc  sp
    and  h
    rst  $38
    ld   h, e
    and  e
    rst  $38
    dec  d
    ld   d, l
    ld   b, d
    ld   d, l
    scf
    inc  d
    inc  [hl]
    add  a, [hl]
    inc  b
    ld   b, d
    rst  $38
    jr   label_58820
    ld   b, c
    ld   d, l
    ld   b, e
    ld   d, l
    ld   b, h
    cpl
    rst  $38

label_587D2::
    inc  hl
    sbc  a, e
    ldd  [hl], a
    dec  bc
    dec  [hl]
    sbc  a, e
    ld   b, [hl]
    sbc  a, e
    rst  $38
    ld   [de], a
    ld   d, [hl]
    ld   h, $56
    ld   b, a
    ld   d, [hl]
    inc  sp
    sbc  a, e
    scf
    sbc  a, e
    rst  $38
    inc  hl
    ld   a, [de]
    dec  [hl]
    dec  de
    ld   b, d
    dec  de
    rst  $38
    inc  hl
    ld   h, b
    dec  h
    ld   h, b
    inc  [hl]
    ld   h, c
    rst  $38
    ld   h, h
    push hl
    rst  $38
    inc  de
    ld   a, [de]
    ld   b, [hl]
    ld   a, [de]
    ldd  [hl], a
    sbc  a, e
    inc  bc
    ld   b, d

label_587FF::
    rst  $38
    ldi  [hl], a
    ld   d, a
    ld   d, [hl]
    ld   d, a
    inc  sp
    sbc  a, e
    ld   [hl], $9B
    rst  $38
    inc  [hl]
    inc  e
    ld   b, e
    inc  e
    ld   b, l
    inc  e
    ld   d, h
    inc  e
    ld   b, h
    dec  de
    rst  $38
    inc  h
    dec  bc
    ld   b, a

label_58817::
    dec  bc
    ld   h, a
    dec  l
    ld   l, b
    jr   c, label_5881C
    ld   h, d
    dec  bc
    ld   h, h

label_58820::
    dec  bc
    ld   h, [hl]
    dec  l
    ld   h, a
    dec  l
    rst  $38
    dec  h
    sbc  a, e
    daa
    sbc  a, e
    ld   b, l
    sbc  a, e
    ld   b, a
    sbc  a, e
    rst  $38
    ld   [de], a
    sbc  a, e
    ld   hl, label_269B
    sbc  a, e
    jr   z, label_587D2
    ld   l, b

label_58838::
    sbc  a, e
    rst  $38
    ld   sp, label_351C
    ld   e, $45
    ld   e, $FF
    ld   [hl], $9B
    ld   b, [hl]
    sbc  a, e
    scf
    sbc  a, e
    ld   b, a
    sbc  a, e
    rst  $38
    ldd  [hl], a
    add  hl, de
    ld   h, c
    add  hl, de
    ld   b, [hl]
    inc  d
    rst  $38
    ld   sp, label_5811C
    ld   d, l
    ld   c, b
    ld   d, l
    dec  [hl]
    inc  d
    rst  $38
    inc  [hl]
    ld   h, c
    rst  $38
    scf
    ld   d, e
    rst  $38
    inc  sp
    ld   b, d
    ld   [hl], $66
    ld   b, c
    dec  bc
    ld   c, b
    ld   a, [de]
    ld   hl, $FF2D
    daa
    ld   d, a
    ld   [hl], $9B
    ld   b, c
    sbc  a, e
    ld   d, a
    ld   d, a
    ld   b, d
    push hl
    rst  $38
    dec  h
    sbc  a, e
    ld   b, l
    sbc  a, e
    daa
    sbc  a, e
    ld   b, a
    sbc  a, e
    ldd  [hl], a
    inc  e
    rst  $38
    ld   h, $57
    inc  sp
    add  hl, de
    ld   d, a
    add  hl, de
    rst  $38
    inc  [hl]
    sbc  a, e
    ld   b, c
    sbc  a, e
    ld   d, [hl]
    sbc  a, e
    ld   [hl], $57

label_58890::
    ld   d, d
    dec  bc
    ld   d, h
    jr   c, label_588EA
    jr   c, label_58896
    inc  h
    add  hl, sp
    rst  $38
    inc  [hl]
    ld   e, e
    rst  $38
    inc  de
    add  hl, de
    dec  h
    add  hl, de
    ld   b, d
    add  hl, de
    ld   d, l
    add  hl, de
    ld   h, a
    add  hl, de
    rst  $38
    dec  d
    ld   d, a
    ldd  [hl], a
    ld   d, a
    ld   h, a
    ld   d, a
    inc  [hl]
    push hl

label_588B0::
    rst  $38
    rst  $38
    scf
    xor  e
    ld   d, e
    xor  d
    rst  $38
    inc  [hl]
    xor  e
    ld   h, d
    xor  d
    rst  $38
    inc  bc
    sbc  a, [hl]
    dec  b
    sbc  a, [hl]
    ld   d, e
    dec  de
    ld   d, l
    dec  de
    rst  $38
    rlca
    ld   l, c
    ld   d, e
    ld   d, $21
    ld   b, [hl]
    ld   d, c
    ld   b, a
    ld   h, e
    ld   c, b
    ld   h, [hl]
    ld   c, c
    rst  $38
    inc  h
    add  hl, sp
    rst  $38
    inc  [hl]
    adc  a, d
    inc  sp
    inc  h
    ld   [hl], $24
    ld   b, l
    dec  de
    ld   b, h
    push hl
    rst  $38
    ld   de, label_148E
    ld   h, c
    rst  $38
    inc  de
    dec  d
    rla
    dec  d
    dec  [hl]

label_588EA::
    sbc  a, c
    ldd  [hl], a
    push hl
    rst  $38
    rst  $38
    inc  [hl]
    adc  a, e
    inc  hl
    sbc  a, c
    ld   [hl], $99
    ld   d, l
    sbc  a, c
    rst  $38

label_588F8::
    inc  b
    sbc  a, [hl]
    dec  b
    sbc  a, [hl]
    scf
    sbc  a, e
    ld   e, b

label_588FF::
    sbc  a, e
    ld   h, c
    rla
    rst  $38
    ld   b, h
    dec  de
    ld   b, l

label_58906::
    dec  de
    ld   h, a
    ld   l, $68
    dec  l
    rst  $38
    inc  de
    sbc  a, h
    inc  h
    sbc  a, e
    ldd  [hl], a
    inc  d
    ld   e, b
    dec  de
    rst  $38
    jr   z, label_588B0
    dec  [hl]
    and  b
    ld   b, e
    sbc  a, c
    ld   d, a
    and  b
    ld   e, b
    jr   c, label_5891F

label_58920::
    inc  hl
    dec  de
    ld   d, e
    dec  de
    ld   d, [hl]
    dec  de
    ld   d, h
    dec  l
    rst  $38
    scf
    inc  d
    ld   c, b
    dec  de
    ld   d, l
    dec  bc
    jr   label_5895E
    rst  $38
    scf
    sbc  a, c
    ld   b, [hl]
    sbc  a, c
    ld   d, d
    push hl
    rst  $38
    ld   b, e
    ld   b, d
    inc  sp
    sbc  a, e
    ld   [hl], $2C
    ld   b, d
    inc  l
    dec  h
    cpl
    rst  $38
    ld   d, l
    dec  de
    ld   e, b
    dec  de
    rst  $38
    dec  [hl]
    dec  d
    ld   b, e
    sbc  a, c
    ld   e, b
    and  b
    ld   d, c
    ld   l, $61
    ld   l, $FF
    inc  de
    and  b
    jr   z, label_588F8
    ld   [hl], $A0
    rst  $38
    ldi  [hl], a
    sbc  a, c
    ld   h, $99
    inc  [hl]
    sbc  a, c
    rst  $38
    ldi  [hl], a
    sbc  a, c
    dec  [hl]
    and  b
    ld   b, h
    sbc  a, c
    rst  $38
    dec  h
    sbc  a, c
    jr   z, label_58906
    ld   b, d
    and  b
    ld   b, a
    sbc  a, c
    ld   hl, $FF2F
    ld   d, c
    dec  l
    ld   h, c
    dec  l
    ld   h, l
    sbc  a, c
    ld   [hl], $86
    rst  $38
    ld   b, d
    inc  l
    ld   b, [hl]
    inc  l
    ld   d, l
    dec  de
    rst  $38
    dec  [hl]
    inc  l
    ld   d, e
    ld   d, $56
    dec  de
    ld   h, d
    inc  l
    rst  $38
    ld   [hl], $99
    ld   c, b
    sbc  a, c
    ld   d, h
    sbc  a, c
    rst  $38
    inc  [hl]
    ld   h, c
    rst  $38
    ld   hl, label_2899
    sbc  a, c
    ld   d, d
    sbc  a, c
    ld   l, b
    sbc  a, c
    rst  $38
    inc  hl
    jr   nc, label_589A2
    ldd  [hl], a
    and  e
    rst  $38
    rst  $38
    rst  $38
    inc  [hl]
    ld   e, a
    rst  $38
    inc  de
    ld   e, $51
    ld   e, $18
    ld   a, [de]
    ld   h, l
    ld   a, [de]
    rst  $38
    inc  h
    add  hl, sp
    rst  $38
    inc  sp
    ld   e, $34
    ld   a, [de]
    dec  [hl]
    ld   e, $54
    push hl
    rst  $38
    inc  [hl]
    ld   e, a
    rst  $38
    inc  [hl]
    ld   e, l
    rst  $38
    rst  $38
    ld   d, $16
    dec  h
    sbc  a, e
    scf
    sbc  a, e
    ld   b, d
    sbc  a, e
    jr   label_589FE
    ld   h, c
    dec  l
    rst  $38
    ldd  [hl], a
    inc  d
    ld   b, h
    sbc  a, h
    ld   h, d
    ld   l, $64
    ld   l, $58
    push hl
    rst  $38
    ld   b, c
    sbc  a, [hl]
    ld   c, b
    sbc  a, [hl]
    ld   h, $0B
    ld   d, [hl]
    inc  d
    jr   label_58A16
    ld   h, c
    ld   l, $62
    ld   l, $FF
    dec  b
    ld   b, d
    inc  h
    sbc  a, h
    ld   h, $15
    ld   h, h
    sbc  a, h
    ld   h, [hl]
    sbc  a, h
    rst  $38
    ld   h, l
    rla
    rst  $38
    rst  $38
    dec  d

label_589FE::
    sbc  a, c

label_589FF::
    ld   b, c
    sbc  a, c
    ld   c, b
    sbc  a, c
    ld   h, l
    sbc  a, c
    rst  $38
    ldi  [hl], a
    dec  bc
    dec  [hl]
    dec  bc
    ld   b, e
    sbc  a, h
    inc  de
    ld   l, $FF
    ld   b, d
    ld   d, $64
    dec  de
    ld   h, [hl]
    inc  d
    ld   d, h

label_58A16::
    add  a, [hl]
    rst  $38
    ld   de, label_1827
    daa
    ld   h, c
    daa
    ld   l, b
    daa
    inc  hl
    sbc  a, h
    ld   b, d
    inc  d
    rst  $38
    ld   sp, label_59716
    rla
    rst  $38
    inc  [hl]
    ld   e, a
    rst  $38
    ld   [de], a
    ld   e, [hl]
    ld   b, d
    ld   e, [hl]
    inc  [hl]
    ld   h, c
    rst  $38
    inc  h
    dec  de
    ld   b, e
    dec  de
    ld   d, l
    dec  d
    inc  [hl]
    dec  l
    dec  [hl]
    scf
    rst  $38
    inc  [hl]
    ld   e, a
    rst  $38
    inc  h
    sbc  a, e
    ldd  [hl], a
    sbc  a, e
    ld   b, h
    sbc  a, e
    dec  h
    jr   c, label_58A71
    jr   c, label_58A83
    dec  l
    rst  $38
    ld   b, d
    inc  h
    ld   d, e
    inc  h
    ld   h, [hl]
    inc  h
    ld   hl, label_5932D
    push hl
    rst  $38
    inc  d
    daa
    ld   d, $27
    ld   h, h
    daa
    ld   h, [hl]
    daa
    ldi  [hl], a
    sbc  a, e
    ld   d, d
    sbc  a, e
    rst  $38
    dec  d
    sbc  a, [hl]
    ldd  [hl], a
    dec  de
    inc  [hl]
    dec  de
    scf
    cpl
    ld   b, e
    push hl

label_58A71::
    rst  $38
    ld   [de], a
    ld   a, [de]
    rla
    ld   a, [de]
    ld   b, [hl]
    ld   e, $07
    ld   b, d
    rst  $38
    inc  h
    ld   d, $33
    inc  h
    ld   d, l

label_58A80::
    inc  h
    ld   d, h
    add  a, [hl]

label_58A83::
    rst  $38
    ld   de, label_1827
    daa
    ld   h, c
    daa
    ld   l, b
    daa
    ld   d, l
    inc  h
    inc  sp
    inc  h
    rst  $38
    ld   h, $1A
    ldd  [hl], a
    inc  h

label_58A95::
    ld   d, e
    ld   e, $FF
    inc  [hl]

label_58A99::
    ld   d, $35
    inc  h
    ld   b, h
    inc  h
    rst  $38
    inc  hl
    add  hl, de
    ld   h, $19
    ld   b, e
    add  hl, de
    ld   b, [hl]
    add  hl, de
    inc  [hl]
    inc  h
    rst  $38
    ld   b, h
    inc  h
    ld   b, l
    ld   d, $55
    dec  de
    rst  $38
    inc  [hl]
    ld   h, c
    rst  $38
    inc  sp
    xor  c
    inc  [hl]
    xor  c
    scf
    sbc  a, a
    rst  $38
    ld   b, d
    xor  c
    ld   d, d
    xor  c
    rst  $38
    ld   d, c
    sbc  a, a
    rst  $38
    ldd  [hl], a
    sbc  a, a
    inc  [hl]
    sbc  a, a
    rst  $38
    ld   d, e
    xor  h
    ld   d, [hl]
    xor  h
    rst  $38

label_58ACD::
    ld   d, d
    xor  h
    ld   d, [hl]
    xor  h
    rst  $38
    ld   d, d
    and  [hl]
    ld   [hl], $A6
    ld   d, h
    and  [hl]
    jr   c, label_58A80
    rst  $38
    ld   d, h
    and  [hl]
    ld   [hl], $A6
    rst  $38
    dec  d
    reti
    rst  $38
    scf
    and  d
    rst  $38
    inc  h
    add  a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   d, e
    sbc  a, b
    ld   d, [hl]
    sbc  a, b
    ldi  [hl], a
    ld   h, [hl]
    ld   hl, $FF9C
    ld   d, e
    sbc  a, b
    ld   d, [hl]
    sbc  a, b
    daa
    ld   h, [hl]
    jr   z, label_58A99
    ld   h, h
    push hl
    rst  $38
    dec  d
    ld   d, $32
    sbc  a, l
    inc  [hl]
    sbc  a, l
    ld   b, d
    rla
    rst  $38
    nop
    ld   h, [hl]
    dec  [hl]
    sbc  a, h
    jr   c, label_58A95
    rst  $38
    inc  d
    dec  d
    inc  sp
    ld   hl, label_2136
    rst  $38
    inc  h
    add  hl, sp
    rst  $38
    ld   h, $66
    inc  b
    ld   b, d
    rst  $38
    ld   sp, label_58817
    ld   d, $34
    add  a, [hl]
    inc  hl
    scf
    jr   z, label_58B56
    rst  $38
    ld   d, a
    jr   c, label_58B85
    jr   c, label_58B54
    sbc  a, e
    ldd  [hl], a
    sbc  a, e
    inc  [hl]
    sbc  a, e
    ldd  [hl], a
    push hl
    rst  $38
    rla
    sbc  a, [hl]
    rst  $38
    inc  [hl]
    sbc  a, b
    ld   b, l
    sbc  a, b
    ld   [hl], $2D
    ld   b, e
    dec  l
    rst  $38
    ld   d, l
    ld   b, d
    jr   c, label_58ACD
    inc  d
    sbc  a, l
    ldd  [hl], a
    ld   d, $42
    rla
    rst  $38
    inc  [hl]
    ld   e, d
    rst  $38
    ldd  [hl], a
    sbc  a, l
    scf

label_58B54::
    sbc  a, l
    inc  [hl]

label_58B56::
    add  a, [hl]
    rst  $38
    dec  h
    sbc  a, c
    daa
    sbc  a, c
    ld   b, [hl]
    sbc  a, c
    ld   sp, label_5A39C
    dec  l
    rst  $38
    ld   sp, label_3418
    jr   label_58BBA
    jr   label_58B7B
    jr   c, label_58B6B
    ld   h, c

label_58B6D::
    ld   h, [hl]
    daa
    ld   hl, label_2134
    ld   d, d
    ld   hl, $E533
    rst  $38
    ld   b, [hl]
    sbc  a, e
    ld   d, e
    sbc  a, e

label_58B7B::
    ld   de, label_252D

label_58B7E::
    jr   c, label_58BE1
    scf
    rst  $38
    inc  hl
    sbc  a, e
    dec  h

label_58B85::
    sbc  a, e
    ld   b, l
    sbc  a, e
    ld   d, e
    sbc  a, e
    inc  [hl]
    sbc  a, l
    rst  $38
    ldi  [hl], a
    sbc  a, d
    rst  $38
    ldi  [hl], a
    rla
    ld   h, $17
    rst  $38
    dec  [hl]
    sub  a, d
    inc  [hl]
    ld   h, c
    rst  $38
    rst  $38
    dec  h
    ld   h, b
    ld   d, h
    ld   h, b
    rst  $38
    inc  [hl]
    ld   h, [hl]
    dec  h
    adc  a, a
    ld   d, h
    sbc  a, l
    rst  $38
    inc  d
    sbc  a, l
    ldi  [hl], a
    push hl
    rst  $38
    ld   b, h
    ld   d, d
    inc  h
    sbc  a, e
    ld   d, c
    sbc  a, e
    ld   b, [hl]
    sbc  a, e
    ld   h, h
    sbc  a, e
    rst  $38
    dec  [hl]
    ld   hl, label_2A68
    rst  $38
    ld   de, label_189E
    sbc  a, [hl]
    inc  [hl]
    dec  de
    dec  [hl]
    dec  de
    scf
    dec  l
    ld   b, d
    jr   c, label_58BC8
    daa
    ld   d, $22
    sbc  a, c
    ld   d, e
    sbc  a, c
    jr   c, label_58B6D
    rla
    jr   c, label_58BEC
    scf
    rst  $38
    inc  [hl]
    sbc  a, l
    dec  [hl]
    sbc  a, l
    jr   label_58C0B
    rst  $38
    inc  hl
    add  hl, hl
    jr   c, label_58B7E

label_58BE1::
    ld   h, e
    rla
    rst  $38
    inc  de
    sbc  a, [hl]
    ld   d, $9E
    ld   b, e
    sbc  a, l
    ld   b, [hl]
    sbc  a, l

label_58BEC::
    rst  $38
    inc  hl
    ld   hl, label_2134
    ld   b, l
    ld   hl, label_2156
    dec  h
    push hl
    rst  $38
    ld   c, b
    add  hl, hl
    jr   c, label_58C1D
    ld   e, b
    ld   hl, label_24FF
    ld   hl, label_2143
    ld   b, l
    ld   hl, label_34FF
    ld   h, c
    rst  $38
    ld   b, e
    sbc  a, l

label_58C0B::
    ld   b, [hl]
    sbc  a, l
    inc  de
    daa
    ld   d, $27
    rst  $38
    nop
    sbc  a, d
    rst  $38
    ldd  [hl], a
    sbc  a, h
    ld   [hl], $9C
    ld   l, b
    daa
    ld   de, $012D
    ld   b, d
    rst  $38
    dec  h
    db   $DB
    ld   h, h
    sbc  a, a
    ld   h, [hl]
    sbc  a, a
    rst  $38
    ld   [de], a
    db   $DB
    ld   h, h
    sbc  a, a
    rst  $38
    rst  $38
    dec  h
    rla
    ld   d, e
    ld   d, $66
    sbc  a, a
    rst  $38
    inc  h
    rst  $10
    dec  h
    rst  $10
    ld   h, $D7
    daa
    rst  $10
    rst  $38
    ldi  [hl], a
    rst  $10
    inc  h
    rst  $10
    inc  sp
    rst  $10
    rst  $38
    rst  $38
    rst  $38
    inc  [hl]
    jp   z, label_5A8FF
    dec  a
    rst  $38
    inc  [hl]
    call c, label_595FF
    call z, label_593FF
    call z, label_FFFF
    inc  d
    dec  [hl]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   h, d
    sbc  a, a
    ld   h, h
    sbc  a, a
    rst  $38
    rst  $38
    ld   [$FFE2], sp
    rst  $38
    rst  $38

label_58C67::
    ld   d, e
    call z, label_CC64
    rst  $38
    rst  $38
    inc  h
    add  a, h
    rst  $38
    rst  $38
    inc  d
    adc  a, a
    rst  $38
    dec  d
    call z, label_FFFF
    inc  [hl]
    jr   nc, label_58CB3
    or   b
    ld   b, d
    or   b
    ld   h, d
    or   b
    rst  $38
    rst  $38
    ld   hl, label_23DD
    db   $26
    ld   h, $DD
    jr   z, label_58C67
    ld   d, c
    db   $53
    ld   d, e
    db   $56
    ld   d, [hl]
    db   $58
    ld   e, b
    db   $04
    inc  b
    ld   c, d
    rst  $38
    inc  h
    add  a, h
    rst  $38
    inc  d
    inc  d
    inc  hl
    dec  bc
    ld   h, $0B
    rst  $38
    rst  $38
    rst  $38
    ld   h, $65
    rst  $38
    rst  $38
    inc  sp
    sub  a, c
    ld   d, a
    sbc  a, a
    rst  $38
    ld   d, l
    add  hl, hl
    ld   b, e
    and  b
    ld   e, b
    and  b
    rst  $38
    ld   b, c
    and  b

label_58CB3::
    ld   b, a
    and  b
    ld   d, h
    ld   a, [hli]
    rst  $38
    ld   d, c
    sub  a, c
    ld   b, h
    ld   a, [hli]
    ld   [hl], $16
    inc  h
    ld   b, d
    rst  $38
    rst  $38
    ldi  [hl], a
    push hl
    rst  $38
    ld   b, l
    ld   e, $26
    inc  hl
    ld   b, d
    inc  hl
    rst  $38
    inc  b
    sbc  a, [hl]
    ld   d, h
    ld   h, [hl]
    rst  $38
    rst  $38
    ld   b, a
    rra
    dec  h
    rra
    ld   h, l
    rla
    rst  $38
    rst  $38
    ld   de, label_5A127
    daa
    inc  sp
    rra
    rst  $38
    ld   b, l
    ld   hl, label_3825
    ld   [hl], $38
    rst  $38
    inc  [hl]
    ld   h, c
    rst  $38
    ld   de, label_1827
    daa
    rst  $38
    nop
    sbc  a, [hl]
    inc  hl
    inc  hl
    dec  [hl]
    dec  d
    ld   b, [hl]
    inc  hl
    rst  $38
    ld   sp, label_58890
    sub  a, b
    ld   h, l
    sub  a, b

label_58CFF::
    rst  $38
    ld   b, d
    sbc  a, b
    ld   b, a
    sbc  a, b
    ld   h, l
    dec  d
    rst  $38
    ld   de, label_169A
    dec  d
    rst  $38
    dec  [hl]
    and  a
    rst  $38
    ldi  [hl], a
    sbc  a, e
    inc  [hl]
    and  a
    ld   b, l
    sbc  a, e
    rla
    dec  de
    rst  $38
    ld   [label_169], sp
    ld   b, d
    ld   hl, label_59146
    ld   b, a
    rst  $38
    ld   [de], a
    ld   d, $25
    rla
    inc  sp
    sbc  a, e
    ld   d, a
    sbc  a, e
    rst  $38
    ld   b, l
    and  a
    scf
    sbc  a, e
    ld   d, h
    sbc  a, e
    rst  $38
    ld   b, h
    and  a
    ld   d, d
    sbc  a, e
    ld   d, [hl]
    push hl
    rst  $38
    ld   l, b
    ld   h, [hl]
    rst  $38
    ld   h, c
    sbc  a, [hl]
    ld   l, b
    sbc  a, [hl]
    inc  [hl]
    adc  a, c
    rst  $38
    ld   d, d
    sub  a, b
    ld   d, [hl]
    sub  a, b
    ld   h, h
    sub  a, b
    ld   bc, rSCY
    inc  h
    ld   h, [hl]
    scf
    sbc  a, e
    ld   h, e
    sbc  a, e
    rst  $38
    ld   d, [hl]
    dec  d
    rst  $38
    ldi  [hl], a
    and  b
    daa
    and  b
    inc  [hl]
    ld   a, [hli]
    ld   d, c
    daa
    ld   e, b
    daa
    rst  $38
    dec  d
    sbc  a, b
    inc  hl
    sbc  a, b
    ld   b, l
    dec  de
    ld   d, a
    ld   a, [hli]
    rst  $38
    ldi  [hl], a
    sbc  a, a
    dec  d
    ld   d, $34
    ld   a, [hli]
    ld   b, a
    and  b
    rst  $38
    rst  $38
    rst  $38
    ld   hl, label_2666
    rla
    ld   d, c
    rla
    ld   e, b
    rla
    rst  $38
    dec  d
    ld   hl, label_2135
    ld   b, e
    ld   a, [hli]
    ld   h, [hl]
    dec  d
    rst  $38
    rst  $38
    rst  $38
    inc  b
    cp   h
    inc  [hl]
    ld   h, c
    rst  $38
    inc  [hl]
    and  b
    ld   d, c
    and  b
    ld   h, e
    dec  d
    ld   d, [hl]
    and  c
    rst  $38
    inc  hl
    and  b
    ld   b, a
    inc  h
    ld   h, h
    inc  h
    inc  [hl]
    add  a, [hl]
    rst  $38
    dec  h
    sbc  a, a
    ld   c, b
    sbc  a, a
    ld   d, h
    sbc  a, a
    rst  $38
    inc  h

label_58DA7::
    add  hl, sp
    rst  $38
    dec  h
    sbc  a, a
    ld   b, a
    sbc  a, a
    ld   d, d
    sbc  a, a
    ld   d, a
    sbc  a, a
    rst  $38
    rst  $38
    rst  $38
    inc  h
    add  hl, sp
    rst  $38
    rst  $38
    ld   d, d
    or   c
    rst  $38
    rst  $38
    inc  [hl]
    ld   h, d
    rst  $38
    ld   b, a
    push hl
    ld   d, [hl]
    push hl
    daa
    add  a, [hl]
    ld   [hl], $86
    rst  $38
    rst  $38
    rst  $38
    ld   de, $FF8E
    rst  $38
    ldd  [hl], a
    cp   l
    inc  sp
    and  c
    ld   d, h
    and  c
    ld   h, d
    scf
    ld   h, l
    cpl
    ld   h, [hl]
    scf
    rst  $38
    ld   sp, $FFE5
    ld   de, label_219B
    sbc  a, e
    inc  hl
    sbc  a, e
    inc  [hl]
    sbc  a, e
    rst  $38
    ldd  [hl], a
    ld   h, b
    ld   d, l
    ld   h, b
    rst  $38
    ld   d, $E5
    inc  [hl]
    rra
    ld   [hl], $1F
    dec  h
    add  a, [hl]
    rst  $38
    dec  [hl]
    cp   [hl]
    inc  [hl]
    ld   h, c
    rst  $38
    ld   h, e
    ld   a, [hli]
    rst  $38
    inc  sp
    rla

label_58DFF::
    ld   [hl], $17
    ld   b, $42
    rst  $38
    inc  d
    and  c
    inc  [hl]
    and  b
    ld   d, [hl]
    and  c
    rst  $38
    inc  [hl]
    and  c
    rst  $38
    ld   d, $16
    rla
    ld   d, $42
    sbc  a, e
    ld   d, d
    sbc  a, e
    rst  $38
    inc  hl
    sbc  a, e
    ld   h, $9B
    ld   d, e
    sbc  a, e
    ld   d, [hl]
    sbc  a, e
    jr   c, label_58DA7
    rlca
    ld   b, d
    rst  $38
    ld   sp, label_38A1
    and  c
    rst  $38
    ldd  [hl], a
    add  a, [hl]
    ld   b, e
    push hl
    ld   d, d
    push hl
    rst  $38
    inc  hl
    and  b
    ld   b, l
    and  b
    daa
    and  b
    rst  $38
    rst  $38
    inc  hl
    cp   l
    ld   [hl], $E5
    rst  $38
    ld   de, label_1827
    daa
    ld   h, c
    daa
    ld   l, b
    daa
    ld   b, a
    ld   e, $FF
    ld   d, $16
    inc  [hl]
    cp   l
    rst  $38
    ld   [hl], $B1
    rst  $38
    inc  [hl]
    adc  a, c
    rst  $38
    ldi  [hl], a
    sbc  a, e
    inc  h
    sbc  a, e
    rst  $38
    ld   d, e
    or   c
    rst  $38
    ld   l, b
    push hl
    rst  $38
    inc  [hl]
    ld   h, [hl]
    rst  $38
    ld   d, c
    ld   b, d
    jr   label_58E8F
    inc  [hl]
    sbc  a, e
    ld   d, l
    sbc  a, e
    rst  $38
    ld   sp, label_3381
    add  a, d
    rst  $38
    ld   b, [hl]
    rla
    ld   b, a
    ld   d, $62
    push hl
    rst  $38
    ldi  [hl], a
    and  c
    ld   b, c
    and  c
    ld   b, l
    and  c
    ld   d, h
    ld   a, [hli]
    rst  $38
    ld   b, h
    cp   l
    rst  $38
    inc  de
    ld   d, $46
    ld   d, $45
    add  a, [hl]
    ld   l, b
    cpl
    rst  $38
    rst  $38
    ld   b, a
    or   c
    ld   b, d

label_58E8F::
    sbc  a, e
    ld   d, e
    sbc  a, e
    inc  [hl]
    push hl
    rst  $38
    inc  [hl]
    sub  a, d
    rst  $38
    inc  sp
    sbc  a, e
    dec  [hl]
    sbc  a, e
    ld   b, h
    sbc  a, e
    ld   h, a
    ld   d, d
    rst  $38
    inc  [hl]
    ld   h, c
    rst  $38
    ld   h, $28
    ld   d, e
    jr   z, label_58F0A
    sbc  a, [hl]
    ld   l, b
    sbc  a, [hl]
    rst  $38
    dec  d
    and  c
    inc  sp
    and  c
    scf
    and  c
    ld   b, l
    and  c
    rst  $38
    inc  de
    sbc  a, a
    ld   d, $9F
    rst  $38
    ld   b, e
    sbc  a, a
    ld   b, l
    sbc  a, a
    rst  $38
    rst  $38
    ld   d, e
    sbc  a, a
    rst  $38
    ld   b, e
    and  e
    ld   h, h
    jp  c, label_DA67
    rst  $38
    ldd  [hl], a
    and  h
    ld   d, l
    and  h
    ld   h, h
    jp  c, label_DA67
    rst  $38
    inc  sp
    sbc  a, a
    ld   h, l
    sbc  a, a
    rst  $38
    ld   h, e
    jp  c, label_DA65
    rst  $38
    inc  sp
    and  h
    ld   h, $17
    ld   h, a
    sbc  a, a
    rst  $38
    ld   d, e
    and  e
    ld   d, a
    sbc  a, a
    rst  $38
    ld   h, e
    jp  c, label_DA65
    ld   h, a
    jp  c, label_5A3FF
    jp  c, label_DA65
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  b
    ld   b, d
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  [hl]
    and  $FF
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  h
    jr   nc, label_58F0A
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  [hl]
    adc  a, b
    rst  $38
    dec  b
    add  hl, de
    inc  de
    add  hl, de
    ldi  [hl], a
    add  hl, de
    inc  [hl]
    add  hl, de
    rst  $38
    inc  de
    sbc  a, e
    inc  d
    sbc  a, e
    dec  d
    sbc  a, e
    rst  $38
    inc  b
    add  hl, de
    ld   d, $19
    inc  [hl]
    add  hl, de
    scf
    add  hl, de
    rst  $38
    rst  $38
    rst  $38
    ld   c, b
    sbc  a, e
    rst  $38
    ld   [hl], $20
    inc  [hl]
    sbc  a, e
    ld   b, a
    sbc  a, e
    ld   b, d
    jr   nz, label_58F38
    ld   b, c
    sbc  a, e
    ld   d, c
    sbc  a, e
    rst  $38
    dec  h
    sbc  a, e
    daa
    sbc  a, e
    ld   b, l
    sbc  a, e
    ld   b, a
    sbc  a, e
    rst  $38
    inc  sp
    add  hl, de
    dec  [hl]
    sbc  a, e
    rst  $38
    rst  $38
    inc  hl
    add  hl, de
    ld   h, $19
    ld   b, e
    add  hl, de
    ld   b, [hl]
    add  hl, de
    rst  $38
    ld   b, h
    sbc  a, e
    ld   b, l
    sbc  a, e
    rst  $38
    rst  $38
    rla
    cp   e
    ld   b, d
    jr   nz, label_58F97
    add  hl, de
    jr   c, label_58F7D
    rst  $38
    ld   b, e
    scf
    ld   b, [hl]
    scf
    rst  $38
    rst  $38
    ld   d, $19
    dec  h
    cp   e
    ld   d, e
    cp   e
    ld   h, [hl]
    sbc  a, e
    rst  $38
    ldd  [hl], a
    sbc  a, e
    ld   b, l
    cp   e
    rst  $38
    ld   hl, label_24BB
    sbc  a, e

label_58F7D::
    scf
    cp   e
    ld   b, e
    sbc  a, e
    rst  $38
    daa
    sbc  a, e
    rst  $38
    dec  d
    sbc  a, e
    ld   b, l
    sbc  a, e
    ld   d, d
    sbc  a, e
    rst  $38
    ld   d, d
    sbc  a, e
    rst  $38
    inc  d
    xor  a
    ld   de, label_212D
    dec  l
    ld   sp, label_182D
    dec  l
    jr   z, label_58FC8
    jr   c, label_58FCA
    rst  $38
    ldi  [hl], a
    dec  de
    ld   c, b
    dec  de
    ld   d, e
    dec  de
    dec  h
    jr   z, label_58FE8
    jr   z, label_58FA8
    ld   d, l
    add  a, b
    rst  $38
    ld   hl, rNR41
    ld   d, l
    add  a, b
    rst  $38
    ld   d, l
    add  a, b
    rst  $38
    ld   d, l
    add  a, b
    rst  $38
    rst  $38
    ld   h, $DC
    rla
    ld   l, h
    ld   [hl], $6C
    ld   b, h
    ld   l, h
    rst  $38
    ld   l, b
    ld   c, a
    rst  $38
    ld   d, a
    ld   c, l
    rst  $38

label_58FC8::
    ld   b, h
    ld   b, b

label_58FCA::
    rla
    dec  l
    ld   hl, label_232D
    dec  l
    ld   h, c
    dec  l
    ldd  [hl], a
    dec  sp
    scf
    dec  sp
    inc  h
    pop  hl
    rst  $38
    dec  [hl]
    ld   a, $47
    ccf
    ld   h, c
    dec  l
    ld   h, d
    dec  l
    rst  $38
    ld   b, h
    dec  [hl]
    ld   h, l
    ld   a, [label_23FF]

label_58FE8::
    ld   l, $FF
    ldd  [hl], a
    ld   [hl], h
    inc  h
    or   [hl]
    rst  $38
    ldi  [hl], a
    ld   a, b
    inc  [hl]
    ld   a, c
    rst  $38
    inc  [hl]
    db   $76 ; Halt
    ld   h, $85
    rst  $38
    ldi  [hl], a
    add  a, b
    ld   b, h
    ld   [hl], a
    rst  $38
    dec  [hl]
    add  a, e
    rst  $38
    inc  sp
    dec  [hl]
    rst  $38
    inc  sp
    sbc  a, e
    ld   b, h
    sbc  a, e
    rst  $38
    inc  h
    ld   a, e
    ld   [hl], $E1
    ld   d, d
    pop  hl
    rst  $38
    ld   sp, label_5939B
    sbc  a, e
    rst  $38
    ld   d, h
    sbc  a, e
    ld   d, l
    sbc  a, e
    ld   d, [hl]
    sbc  a, e
    rst  $38
    ld   e, b
    ld   l, d
    rst  $38
    scf

label_59020::
    ld   d, h
    rst  $38
    ld   b, h
    ld   a, b
    ld   h, [hl]
    dec  a
    rst  $38
    rst  $38
    ld   d, l
    add  a, b
    rst  $38
    ld   d, a
    ld   a, [$FA61]
    rst  $38
    daa
    add  hl, de
    inc  [hl]
    add  hl, de
    dec  [hl]
    jr   nz, label_5908F
    add  hl, de
    rst  $38
    inc  d
    sbc  a, e
    jr   nz, label_58FDB
    ld   d, l
    sbc  a, e
    rst  $38
    ld   h, $19
    daa
    add  hl, de
    ld   b, [hl]
    sbc  a, e
    rst  $38
    ldi  [hl], a
    add  hl, de
    inc  h
    add  hl, de
    inc  sp
    sbc  a, e
    rst  $38
    inc  sp
    dec  [hl]
    rst  $38
    scf
    sbc  a, e
    ld   b, d
    sbc  a, e
    rst  $38
    scf
    sbc  a, e
    ld   b, l
    sbc  a, e
    ld   l, b
    sbc  a, e
    rst  $38
    dec  h
    add  hl, de
    ld   h, $19
    ldi  [hl], a
    add  hl, de
    ld   d, d
    add  hl, de
    rst  $38
    inc  d
    jr   z, label_59080
    jr   z, label_5909C
    jr   z, label_590BE
    jr   z, label_5906E
    inc  de
    jr   z, label_59086
    jr   z, label_59089
    jr   z, label_5909E
    jr   z, label_590C0
    jr   z, label_59079
    rst  $38
    rst  $38
    ld   d, e
    dec  bc
    ld   h, [hl]
    inc  d

label_59080::
    rst  $38
    nop
    rst  $20
    ld   d, [hl]
    dec  bc
    ld   h, h

label_59086::
    add  hl, de
    rst  $38
    rst  $38

label_59089::
    ldd  [hl], a
    sub  a, h
    scf
    sub  a, h
    ld   h, h
    rla

label_5908F::
    rst  $38
    ld   h, $51
    rst  $38
    ld   d, $95
    ld   h, d
    sub  a, [hl]
    ld   b, e
    sub  a, [hl]
    ld   d, [hl]
    sub  a, [hl]
    ld   c, b

label_5909C::
    sub  a, [hl]
    rst  $38

label_5909E::
    ldd  [hl], a
    sbc  a, e
    scf
    sbc  a, e
    rst  $38
    inc  sp
    sbc  a, e
    rst  $38
    ld   b, l
    cp   e
    ld   h, d
    sbc  a, e
    ld   h, h
    sbc  a, e
    rst  $38
    ld   d, l
    add  a, b
    rst  $38
    ld   d, l
    add  a, b
    rst  $38
    ld   hl, label_279B
    sbc  a, e
    ld   b, e
    sbc  a, e
    ld   c, b
    sbc  a, e
    rst  $38
    ld   b, c
    jr   z, label_590BE
    jr   label_590E9
    jr   z, label_590EB
    jr   c, label_590ED
    ld   c, b
    jr   z, label_590C7
    ld   b, [hl]
    call z, label_34FF
    call z, label_CC55
    rst  $38
    inc  de
    dec  bc
    ld   d, $0B
    ldd  [hl], a
    dec  de
    scf
    dec  d
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   sp, label_58838
    dec  l
    rst  $38
    dec  h
    or   l
    rst  $38
    inc  de
    sbc  a, e
    ld   h, $9B
    rst  $38

label_590E9::
    ld   b, [hl]
    db   $76 ; Halt

label_590EB::
    ld   h, $85

label_590ED::
    rst  $38
    rla
    set  7, a
    rst  $38
    dec  [hl]
    db   $D3 ; Undefined instruction
    rst  $38
    ld   b, l
    call label_26FF
    add  hl, de
    ld   d, c
    add  hl, de
    ld   d, [hl]
    jr   nz, label_590FE
    ld   d, $35
    dec  [hl]
    add  hl, de
    rst  $38
    inc  d
    dec  bc
    ldi  [hl], a
    dec  bc
    ld   h, $0B
    ld   c, b
    dec  bc
    rst  $38
    ld   d, l
    db   $E4 ; Undefined instruction
    rst  $38
    scf
    ld   l, l
    rst  $38
    ld   d, l
    add  a, b
    rst  $38
    inc  de
    ld   d, $FF
    ld   b, l
    dec  [hl]
    rst  $38
    inc  de
    dec  [hl]
    inc  [hl]
    sbc  a, e
    dec  [hl]
    sbc  a, e
    ld   [hl], $9B
    rst  $38
    ldi  [hl], a
    add  hl, de
    dec  [hl]
    add  hl, de
    ld   b, e
    add  hl, de
    rst  $38
    ld   b, e
    ld   h, e
    rst  $38
    nop
    rst  8
    rst  $38
    ld   [hl], $19
    ld   b, h
    add  hl, de
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  de
    cp   e
    ld   b, d
    add  hl, de
    ld   d, l
    add  hl, de
    rst  $38
    ld   sp, label_35BB
    sbc  a, e
    ld   d, l

label_59146::
    cp   e
    ld   d, e
    sbc  a, e
    rst  $38
    ld   [hl], $14
    rst  $38
    scf
    call z, label_CC54
    rst  $38
    rst  $38
    rst  $38
    ld   d, c
    ld   d, $FF
    inc  h
    cp   b
    ld   d, h
    ld   a, [label_13FF]
    jr   nz, label_591A2
    ld   d, $FF
    inc  hl
    jr   nz, label_59163
    rst  $38
    ldi  [hl], a
    add  hl, de
    dec  h
    call z, label_25FF
    cp   e
    ld   d, $19
    ld   b, h
    add  hl, de
    rst  $38
    inc  d
    jp   label_C342
    ld   b, a
    jp   label_FFFF
    dec  [hl]
    rst  0
    ld   h, e
    rst  0
    ld   h, [hl]
    rst  0
    rst  $38
    scf
    call label_34FF
    ld   l, d
    rst  $38
    ld   h, a
    add  hl, hl
    inc  h
    dec  [hl]
    ld   h, $7A
    rst  $38
    ld   b, [hl]
    ld   h, c
    ld   d, e
    ld   a, d
    rst  $38
    ld   h, h
    dec  bc
    rst  $38
    ld   h, e
    ld   c, $FF
    ld   d, e
    add  hl, hl
    rst  $38
    ld   b, l
    add  hl, hl
    rst  $38
    nop
    sbc  a, $F0
    ld   b, c

label_591A2::
    rst  $38
    rst  $38
    nop
    ld   b, c
    inc  h
    jp   nz, label_FFFF
    ldd  [hl], a
    dec  c
    ld   [hl], $0D
    rst  $38
    ld   [de], a
    dec  c
    ld   d, [hl]
    dec  c
    rst  $38
    jr   z, label_591F3
    scf
    cp   e
    rst  $38
    ld   b, [hl]
    cp   e
    ld   c, c
    ld   a, [rIE]
    ld   d, d
    dec  c
    ld   d, a
    dec  c
    rst  $38
    dec  d
    ld   a, a
    inc  de
    ld   a, d
    rla
    ld   a, d
    rst  $38
    inc  sp
    dec  bc
    rst  $38
    inc  de
    ld   c, $25
    inc  hl
    ldd  [hl], a
    ld   c, $FF
    ld   b, h
    dec  bc
    ld   d, l
    inc  hl
    rst  $38
    ld   d, e
    add  hl, hl
    nop
    ld   b, l
    rst  $38
    nop
    ld   b, l
    rst  $38
    dec  [hl]
    ld   b, c
    rst  $38
    nop
    ld   b, c
    rst  $38
    rst  $38
    ld   h, $B6
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  hl
    dec  c
    rst  $38
    ld   d, [hl]

label_591F3::
    dec  c
    rst  $38
    ld   d, a
    dec  c
    rst  $38
    dec  h
    dec  bc
    ldd  [hl], a
    inc  hl
    ld   b, l
    inc  hl
    rst  $38

label_591FF::
    ld   [hl], $23
    ld   d, e
    dec  bc
    ld   d, [hl]
    dec  bc
    rst  $38
    jr   c, label_59286
    ld   h, a
    ld   a, [hl]
    ld   d, e
    call z, label_35FF
    ld   a, h
    ld   d, h
    call z, label_22FF
    ld   a, [hl]
    inc  h
    ld   a, [hl]
    ldd  [hl], a
    ld   a, [hl]
    inc  [hl]
    ld   a, [hl]
    ld   b, e
    ld   a, [hl]
    rst  $38
    ld   b, e
    dec  bc
    ld   d, l
    dec  bc
    rst  $38
    rst  $38
    rst  $38
    inc  sp
    dec  bc
    ld   d, e
    dec  bc
    rst  $38
    ld   d, l
    dec  bc
    rst  $38
    ld   h, h
    dec  c
    ld   h, a
    dec  c
    rst  $38
    rst  $38
    ld   b, [hl]
    ld   h, c
    ld   d, h
    dec  c
    rst  $38
    ld   d, e
    inc  hl
    rst  $38
    ld   b, a
    inc  hl
    rst  $38
    ld   b, e
    add  hl, bc
    ld   d, h
    add  hl, bc
    rst  $38
    ld   b, e
    dec  bc
    rst  $38
    ldi  [hl], a
    dec  bc
    ld   d, d
    inc  hl
    ld   h, e
    dec  bc
    rst  $38
    daa
    call z, label_17FF
    ld   a, h
    dec  h
    ld   a, [hl]
    ldd  [hl], a
    call z, label_15FF
    call z, label_FFFF
    ld   b, l
    ld   b, c
    rst  $38
    rst  $38
    ld   b, d
    dec  bc
    rst  $38
    dec  [hl]
    dec  bc
    ld   b, [hl]
    dec  bc
    rst  $38
    inc  h
    dec  bc
    ld   b, h
    dec  c
    rst  $38
    scf
    cp   d
    rst  $38
    inc  h
    dec  c
    ld   [hl], $0D
    rst  $38
    ld   [hl], $0D
    rst  $38
    ld   h, $23
    scf
    inc  hl
    rst  $38
    ld   d, h
    ld   l, d
    rst  $38
    inc  h
    dec  bc
    ld   d, [hl]
    dec  bc
    rst  $38
    nop
    ld   b, c
    rst  $38

label_59286::
    ld   b, l
    dec  de
    ld   d, h
    dec  de
    ld   b, a
    dec  bc
    rst  $38
    inc  sp
    dec  bc
    ld   d, l
    dec  bc
    rst  $38
    ld   b, h
    dec  [hl]
    rst  $38
    rst  $38
    scf
    ld   a, d
    ld   d, h
    ld   a, d
    rst  $38
    ld   h, $7A
    ld   d, e
    ld   a, d
    rst  $38
    ld   [hl], $0B
    rst  $38
    rst  $38
    dec  [hl]
    inc  d
    rst  $38
    rst  $38
    ld   b, h
    add  a, [hl]
    rst  $38
    dec  [hl]
    add  a, [hl]
    rst  $38
    ld   h, [hl]
    add  a, [hl]
    rst  $38
    ld   h, $86
    dec  [hl]
    add  a, [hl]
    ld   c, b
    add  a, [hl]
    rst  $38
    ldd  [hl], a
    db   $3A ; ldd  a, [hl]
    rst  $38
    scf
    ccf
    rst  $38
    ld   b, d
    inc  d
    ld   b, l
    dec  bc
    rst  $38
    inc  [hl]
    add  a, h

label_592C5::
    rst  $38
    scf
    cp   c
    ld   b, e
    set  7, a
    rst  $38
    inc  hl
    ld   a, d
    dec  [hl]
    ld   a, d
    rst  $38
    inc  hl
    ld   a, d
    ld   b, [hl]
    ld   a, d
    rst  $38
    inc  d
    ld   a, d
    ld   b, a
    inc  d
    rst  $38
    rst  $38
    inc  [hl]
    sub  a, e
    rst  $38
    rst  $38
    ld   sp, label_581E5
    add  a, [hl]
    ld   d, d
    add  a, [hl]
    rst  $38
    ld   h, a
    add  a, [hl]
    ld   d, h
    push hl
    rst  $38
    ld   d, $86
    ld   d, l
    push hl
    rst  $38
    ld   c, b
    add  a, [hl]
    ld   h, d
    push hl
    rst  $38
    dec  [hl]
    dec  bc
    ld   d, l
    dec  bc
    rst  $38
    inc  hl
    dec  bc
    inc  [hl]
    dec  bc

label_592FF::
    rst  $38
    ld   h, l
    dec  bc
    rst  $38
    scf
    dec  bc
    rst  $38
    dec  l
    ld   b, c
    ld   d, d
    ld   b, h
    rst  $38
    add  hl, de
    cpl
    rst  $38
    scf
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [de], a
    rst  $38
    inc  sp
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [de], a
    ld   d, a
    ld   de, label_5A4FF
    inc  d
    rst  $38
    rst  $38
    ldd  [hl], a
    inc  d
    ld   h, [hl]
    inc  d
    ld   [de], a
    cpl
    rst  $38
    rst  $38
    ld   h, [hl]

label_5932D::
    add  a, [hl]
    rst  $38
    ld   d, a
    push hl
    ld   e, b
    push hl
    ld   h, a
    add  a, [hl]
    ld   l, b
    add  a, [hl]
    rst  $38
    inc  h
    add  a, [hl]
    rst  $38
    ld   h, $86
    jr   z, label_592C5
    ld   c, b
    add  a, [hl]
    ld   d, c
    add  a, [hl]
    ld   l, b
    add  a, [hl]
    rst  $38
    daa
    dec  bc
    ld   [hl], $0B
    rst  $38
    ld   b, d
    dec  de
    ld   h, [hl]
    dec  de
    ldi  [hl], a
    dec  bc
    rst  $38
    ld   b, d
    dec  bc
    ld   b, [hl]
    dec  bc
    ldd  [hl], a
    dec  de
    rst  $38
    inc  h
    dec  bc
    dec  [hl]
    dec  bc
    ld   d, a
    dec  de
    rst  $38
    ld   [hl], $3D
    nop
    cp   a
    rst  $38
    nop
    cp   a
    rst  $38
    nop
    cp   a
    inc  d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [de], a
    rst  $38
    inc  de
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   [de], a
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    inc  h
    xor  a
    ld   d, h
    xor  l
    rst  $38
    ld   hl, label_28E5
    add  a, [hl]
    ld   sp, $FF86
    inc  h
    add  a, [hl]
    ld   c, b
    add  a, [hl]
    rst  $38
    ldi  [hl], a
    add  a, [hl]
    inc  h
    add  a, [hl]
    ld   h, $86
    rst  $38
    ldi  [hl], a
    add  a, [hl]
    inc  [hl]
    add  a, [hl]

label_5939B::
    ld   b, e
    push hl
    ld   b, l
    add  a, [hl]
    rst  $38
    ld   de, rSTAT
    ld   b, [hl]
    ld   d, h
    rst  $38
    ld   h, $6E

label_593A8::
    ldd  [hl], a
    ld   l, [hl]
    ld   d, l
    ld   l, [hl]
    rst  $38
    dec  h
    ld   [hl], b
    ldi  [hl], a
    ld   l, [hl]
    ld   d, [hl]
    ld   l, [hl]
    rst  $38
    inc  hl
    ld   l, [hl]
    ld   b, c
    ld   l, [hl]
    rst  $38
    rst  $38
    daa
    or   b
    inc  [hl]
    or   b
    ld   d, h
    or   b
    rst  $38
    inc  h
    or   e
    ld   b, l
    or   h
    rst  $38
    daa
    xor  [hl]
    ldd  [hl], a
    xor  [hl]
    rst  $38
    inc  [hl]
    or   b
    ld   d, [hl]
    or   d
    rst  $38
    ld   d, h
    dec  bc
    ld   d, [hl]
    dec  bc
    ld   d, d
    ld   b, e
    ld   d, a
    ld   b, e
    rst  $38
    ld   b, h
    dec  a
    jr   c, label_593A8
    rst  $38
    rst  $38
    rst  $38
    dec  h
    cp   d
    ld   b, e
    cp   d
    rst  $38
    ld   h, $2F
    rst  $38
    rst  $38
    ldi  [hl], a
    jr   c, label_59430
    ld   l, h
    ld   h, $6E
    ldd  [hl], a
    ld   l, [hl]
    rst  $38
    ld   d, a
    ld   [hl], e
    ld   b, d
    ld   a, $63
    ld   l, a

label_593F8::
    ld   de, label_176E
    ld   l, [hl]
    inc  hl
    ld   l, [hl]
    ld   b, l

label_593FF::
    call c, label_22FF
    ld   l, h
    ld   b, [hl]
    ld   l, [hl]
    rst  $38
    rst  $38
    ld   b, [hl]
    ld   h, c
    dec  h
    xor  [hl]
    inc  hl
    cpl
    rst  $38
    inc  hl
    or   b
    ld   d, [hl]
    or   b
    rst  $38
    ldi  [hl], a
    or   b
    rst  $38
    ld   [de], a
    xor  [hl]
    dec  [hl]
    xor  [hl]
    ld   e, b
    cp   d
    rst  $38
    inc  sp
    xor  [hl]
    ld   d, [hl]

label_59420::
    xor  [hl]
    rst  $38
    ld   b, [hl]
    dec  bc
    ld   d, h
    inc  d
    ld   d, a
    dec  bc
    rst  $38
    ld   b, h
    cp   d
    jr   c, label_593F8
    rst  $38
    ld   a, [$FF41]

label_59430::
    rst  $38
    rrca
    ld   b, c
    ldi  [hl], a
    rrca
    ld   h, h
    cp   d
    rst  $38
    ld   b, e
    dec  c
    ld   d, [hl]
    dec  c
    rst  $38
    ld   b, h
    cp   d
    scf
    dec  c
    rst  $38

label_59442::
    inc  de
    ld   l, [hl]
    ld   h, $6E
    ld   d, d
    ld   l, [hl]
    inc  h
    dec  l
    dec  h
    dec  l
    ld   h, $2D
    rst  $38
    rla
    ld   l, a
    inc  hl
    ld   l, [hl]
    ld   e, b
    ld   l, [hl]
    ld   b, h
    ld   l, l
    rst  $38
    daa
    cpl
    ld   d, e
    ld   l, h
    rst  $38
    dec  [hl]
    dec  a
    inc  de
    ld   l, [hl]
    ldd  [hl], a
    ld   l, [hl]
    ld   d, a
    ld   l, [hl]
    rst  $38
    ld   h, $3D
    ld   d, c
    xor  [hl]
    ld   b, [hl]
    xor  [hl]
    rst  $38
    inc  [hl]
    xor  [hl]
    ld   h, l
    xor  [hl]
    ld   b, l
    dec  a
    rst  $38
    ld   b, [hl]
    dec  a
    rst  $38
    rst  $38
    ld   d, e
    dec  a
    ld   b, [hl]
    xor  [hl]
    ld   h, h
    xor  [hl]
    rst  $38
    inc  sp
    dec  bc
    ld   b, [hl]
    dec  bc
    ld   d, h
    dec  bc
    rst  $38
    rst  $38
    jr   z, label_59442
    inc  [hl]
    cp   d
    ld   b, d
    cp   c
    rst  $38
    ld   b, c
    ld   b, c
    ld   h, e
    rrca
    ld   h, a
    rrca
    rst  $38
    inc  hl
    rrca
    daa
    rrca
    inc  h
    sbc  a, e
    ld   h, $9B
    ld   b, h
    sbc  a, e
    ld   b, [hl]
    sbc  a, e
    rst  $38
    inc  [hl]
    rrca
    ld   [hl], $0F
    ld   d, h
    rrca
    ld   d, [hl]
    rrca
    rst  $38
    rst  $38
    ld   b, h
    ld   [hl], c
    ld   b, a
    ld   [hl], d
    dec  d
    ld   l, [hl]
    rla
    ld   l, [hl]
    rst  $38
    inc  bc
    ld   l, h
    ld   d, a
    ld   [hl], l
    rst  $38
    inc  hl
    ld   l, [hl]
    daa
    ld   l, h
    rst  $38
    ld   h, $6E
    inc  sp
    ld   l, [hl]
    ld   b, a
    ld   l, [hl]
    ldi  [hl], a
    ld   l, a
    ld   d, d
    ld   [hl], e
    rst  $38
    nop
    ret  nz
    ld   b, d
    inc  d
    rst  $38
    rst  $38
    pop  af
    ld   b, c
    rst  $38
    rst  $38
    scf
    cp   d
    ld   b, d
    cp   d
    rst  $38
    inc  [hl]
    dec  a
    ldi  [hl], a
    dec  bc
    ld   h, $0B
    ld   b, d
    dec  bc
    rst  $38
    ldi  [hl], a
    cp   d
    ld   d, l
    set  7, a
    ld   b, [hl]
    cp   c
    ld   d, e
    cp   c
    rst  $38
    ld   [de], a
    rrca
    ld   h, h
    rrca
    inc  de
    sbc  a, e
    ld   b, d
    sbc  a, e
    ld   h, [hl]
    sbc  a, e
    rst  $38
    ldi  [hl], a
    rrca
    ld   h, $0F
    ld   b, h
    rrca
    ld   d, a
    rrca

label_594FF::
    dec  h
    sbc  a, e
    ldd  [hl], a
    sbc  a, e
    rst  $38
    ld   [de], a
    rrca
    inc  d
    rrca
    ld   b, [hl]
    rrca
    ld   b, c
    sbc  a, e
    ld   d, e
    sbc  a, e
    ld   d, [hl]
    sbc  a, e
    rst  $38
    ld   sp, label_350F
    rrca
    ld   d, e
    rrca
    inc  hl
    dec  de
    ld   h, $9B
    rst  $38
    rst  $38
    inc  sp
    add  hl, bc
    ld   d, h
    add  hl, bc
    rst  $38
    inc  de
    add  hl, bc
    ld   h, $09
    ld   d, [hl]
    add  hl, bc
    rst  $38
    inc  h
    add  hl, bc
    ld   b, a
    add  hl, bc
    ld   d, d
    add  hl, bc
    rst  $38
    nop
    ret  nz
    inc  hl
    sbc  a, e
    ld   b, h
    sbc  a, e
    ld   d, [hl]
    dec  de
    rst  $38
    nop
    ret  nz
    ld   b, e
    sbc  a, e
    ld   e, b
    sbc  a, e
    rst  $38
    daa
    inc  a
    rst  $38
    rst  $38
    dec  [hl]
    dec  bc
    ld   b, h
    dec  bc
    rst  $38
    ld   b, a
    or   a
    rst  $38
    ldi  [hl], a
    swap [hl]
    bit  2, h
    set  7, a
    ldi  [hl], a
    ld   l, [hl]
    scf
    ld   l, [hl]
    ld   d, h
    ld   l, [hl]
    rst  $38
    ld   d, h
    db   $D3 ; Undefined instruction
    ldi  [hl], a
    ld   l, [hl]
    ld   b, e
    ld   l, [hl]
    ld   e, b
    ld   l, [hl]
    rst  $38
    ld   d, e
    db   $D3 ; Undefined instruction
    ld   d, [hl]
    ld   [hl], l

label_59567::
    ld   d, h
    ld   l, [hl]
    ld   h, d
    ld   l, [hl]
    rst  $38
    ld   b, e
    add  a, a
    nop
    ld   h, c
    rst  $38
    dec  h
    ld   c, $33
    ld   c, $FF
    rla
    add  hl, bc
    rst  $38
    scf
    add  hl, bc
    ld   b, e
    add  hl, bc
    rst  $38
    ld   b, l
    ld   b, c
    ld   b, e
    dec  a
    rst  $38
    rst  $38
    nop
    ret  nz
    ldi  [hl], a
    sbc  a, e
    ld   [hl], $BB
    rst  $38
    nop
    ret  nz
    inc  h
    sbc  a, e
    inc  sp
    sbc  a, e
    ld   b, a
    sbc  a, e
    ld   h, h
    cp   e
    rst  $38
    rst  $38
    rst  $38
    ldd  [hl], a
    cp   d
    jr   c, label_59567
    rst  $38
    ld   d, d
    sub  a, a
    ld   d, h
    sub  a, a
    rst  $38
    inc  sp
    dec  a
    ld   h, $CB
    ld   h, d
    set  7, a
    ldd  [hl], a
    cp   d
    inc  [hl]
    cp   e
    ld   d, l
    cp   e
    rst  $38
    dec  [hl]
    ld   a, $38
    ld   l, [hl]
    ld   h, $D0
    inc  hl
    jp   nc, label_D053
    ld   d, a
    pop  de
    ld   h, l
    ret  nc
    rst  $38
    ld   b, d
    db   $D3 ; Undefined instruction
    jr   label_59631
    inc  sp
    ld   l, [hl]
    ld   b, a
    ld   l, [hl]
    rst  $38
    daa
    ld   c, $34
    ld   c, $57
    ld   c, $FF
    scf
    db   $E3 ; Undefined instruction
    ld   h, e
    db   $E3 ; Undefined instruction
    ldd  [hl], a
    ld   c, $65
    ld   c, $66
    ld   b, h
    rst  $38
    inc  d
    add  hl, bc
    ld   b, d
    add  hl, bc
    rst  $38
    inc  hl
    push bc
    ld   b, [hl]
    push bc
    ld   b, a
    push bc
    rst  $38
    ld   h, $09
    ld   d, l
    add  hl, bc
    ld   d, d
    push bc
    ld   h, d
    push bc
    rst  $38
    db   $10 ; Undefined instruction
    ld   d, $CD
    ld   d, b
    call label_CD56
    rst  $38
    inc  d
    ld   [rIE], a
    rst  $38
    rst  $38
    inc  [hl]
    cp   c

label_595FF::
    rst  $38
    inc  sp
    cp   c
    ld   b, [hl]
    cp   c
    rst  $38
    ld   h, $CE
    ld   h, d
    dec  a
    rst  $38
    ld   h, $97
    ld   h, [hl]
    cp   c
    rst  $38
    ldd  [hl], a
    cp   c
    inc  sp
    cp   d
    ld   b, [hl]
    cp   c
    rst  $38
    ld   b, [hl]
    ld   h, c
    rst  $38
    rst  $38
    ld   bc, rSTAT
    ld   b, [hl]
    db   $E3 ; Undefined instruction

label_5961F::
    ld   d, e

label_59620::
    db   $E3 ; Undefined instruction
    rst  $38
    ld   b, h

label_59623::
    ld   c, $47
    ld   c, $22
    add  hl, bc
    rst  $38
    inc  de
    add  hl, bc
    inc  hl
    ld   c, $45
    ld   c, $FF
    nop

label_59631::
    ld   b, c
    ld   d, l
    ld   sp, $C532
    rst  $38
    ldd  [hl], a
    add  a, $46
    add  a, $FF
    inc  h
    ld   c, $26
    ld   c, $28
    add  a, $FF
    ld   b, l
    pop  bc
    rst  $38
    rst  $38
    rst  $38
    ld   b, h
    dec  a
    ld   hl, $FFCB
    rst  $38
    ldi  [hl], a
    cp   c
    ld   d, c
    set  7, a
    inc  h
    cp   c
    ldi  [hl], a
    cp   e
    rst  $38
    rst  $38
    jr   c, label_5961F
    rst  $38
    rst  $38
    ld   b, l
    dec  a
    inc  hl
    ld   c, $42
    ld   c, $FF
    dec  h
    ld   sp, hl
    rst  $38
    inc  h
    add  a, h
    rst  $38
    rst  $38
    inc  h
    ld    hl, sp+$FF
    ld   h, c
    ld   h, [hl]
    rst  $38
    inc  hl
    sbc  a, e
    ld   d, e
    sbc  a, e
    ld   h, $9B
    ld   d, [hl]
    sbc  a, e
    jr   label_596AA
    ld   h, c
    dec  l
    rst  $38
    ld   b, d
    sbc  a, e
    inc  sp
    sbc  a, e
    ldd  [hl], a
    dec  de
    inc  d
    dec  de
    jr   c, label_59623
    ld   b, a
    sbc  a, e
    rst  $38
    dec  [hl]
    ld   [$EA44], a
    inc  [hl]
    jp   hl
    ld   b, l
    db   $EB ; Undefined instruction
    rst  $38
    inc  hl
    rst  $28
    ld   h, $F1
    ld   d, e
    pop  af
    ld   d, [hl]
    ld   a, [$FF04]
    ld   b, d
    rst  $38
    ld   l, b
    db   $EC ; Undefined instruction
    ld   d, d
    db   $ED ; Undefined instruction
    dec  d
    xor  $FF
    ldi  [hl], a
    pop  af
    ld   b, d
    rst  $28

label_596AA::
    ld   h, d
    pop  af
    inc  h
    rst  $28
    ld   b, h
    pop  af
    ld   h, h
    rst  $28
    ld   h, $F1
    ld   b, [hl]
    rst  $28
    ld   h, [hl]
    pop  af
    inc  bc
    ld   b, d
    rst  $38
    inc  sp
    ld   a, [$FF00+C]
    di
    rst  $38
    dec  d
    db   $F4 ; Undefined instruction
    rst  $38
    inc  sp
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    dec  h
    db   $EC ; Undefined instruction
    ld   d, d
    db   $ED ; Undefined instruction
    ld   d, a
    db   $ED ; Undefined instruction
    ld   de, label_183B
    ld   l, $FF
    ldi  [hl], a
    rst  $28
    daa
    pop  af
    ld   d, d
    pop  af
    ld   d, a
    rst  $28
    dec  b
    ld   b, d
    rst  $38
    ld   d, l
    ld   a, [$FF00+C]
    jr   c, label_596E2
    inc  [hl]
    ld   [$E945], a
    rst  $38
    inc  d
    or   $15
    rst  $30
    rst  $38
    rst  $38
    ld   b, e
    di
    ld   h, e
    di
    rst  $38
    ldi  [hl], a
    db   $EC ; Undefined instruction
    daa
    db   $EC ; Undefined instruction
    ld   d, d
    db   $ED ; Undefined instruction
    ld   d, a
    db   $ED ; Undefined instruction
    jr   label_59738
    ld   h, c
    ld   l, $FF
    rst  $38
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_59770
    ld   l, a
    ld   [hl], h
    jr   nz, label_59781
    ld   l, b
    ld   h, l
    jr   nz, label_59731
    ld   b, [hl]
    ld   h, c
    ld   h, e
    ld   h, l
    jr   nz, label_59762
    ld   h, l
    ld   a, c
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt

label_59720::
    ld   h, l
    jr   nz, label_5978A
    ld   l, a
    ld   [hl], h
    jr   nz, label_5979B
    ld   l, b
    ld   h, l
    jr   nz, label_5974B
    ld   b, d
    ld   l, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_5977C

label_59731::
    ld   h, l
    ld   a, c
    ld   hl, label_581FF
    ld   [hl], h
    jr   nz, label_597A5
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    inc  l
    jr   nz, label_597B8
    ld   l, a
    ld   [hl], l
    jr   nz, label_597AA
    ld   l, a
    ld   [hl], h
    ld   h, c
    jr   nz, label_59795
    ld   h, c
    ld   [hl], b
    ld   hl, label_2020
    ld   d, b
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    jr   nz, label_59774
    jr   nz, label_597CA
    ld   l, b
    ld   h, l
    jr   nz, label_597AD
    ld   d, h
    ld   b, c
    ld   d, d
    ld   d, h
    jr   nz, label_597A2
    ld   [hl], l
    ld   [hl], h

label_59762::
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   [hl], h
    ld   l, a
    jr   nz, label_597D5
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_597CF
    ld   [hl], h
    jr   nz, label_597DA
    ld   [hl], h
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_597E3

label_5977C::
    ld   l, a
    ld   [hl], h
    jr   nz, label_597F4
    ld   l, b

label_59781::
    ld   h, l
    jr   nz, label_597A4
    ld   b, e
    ld   l, a
    ld   l, l
    ld   [hl], b
    ld   h, c
    ld   [hl], e

label_5978A::
    ld   [hl], e
    ld   hl, label_2020
    ld   c, [hl]
    ld   l, a
    ld   [hl], a
    inc  l
    jr   nz, label_597B4
    ld   a, c

label_59795::
    ld   l, a
    ld   [hl], l
    jr   nz, label_597FC
    ld   h, c
    ld   l, [hl]

label_5979B::
    jr   nz, label_59810
    ld   h, l
    ld   h, l
    jr   nz, label_597C1
    jr   nz, label_597C3
    jr   nz, label_5981C

label_597A5::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_5981F
    ld   l, b
    ld   h, l

label_597AD::
    jr   nz, label_59812
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   [hl], e

label_597B4::
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59807
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, l
    ld   h, c
    ld   [hl], d
    ld   h, l

label_597C1::
    jr   nz, label_597E3

label_597C3::
    jr   nz, label_59826
    ld   [hl], d
    ld   h, l
    jr   nz, label_59831
    ld   l, c

label_597CA::
    ld   h, h
    ld   h, h
    ld   h, l
    ld   l, [hl]
    ld   hl, label_59420
    ld   l, b
    ld   l, c
    ld   [hl], e
    ld   b, e

label_597D5::
    ld   l, a
    ld   l, l
    ld   [hl], b
    ld   h, c
    ld   [hl], e

label_597DA::
    ld   [hl], e
    jr   nz, label_59845
    ld   h, c
    ld   [hl], e
    jr   nz, label_59842
    jr   nz, label_59803

label_597E3::
    jr   nz, label_59853
    ld   h, l
    ld   [hl], a
    jr   nz, label_5984F
    ld   h, l
    ld   h, c
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    dec  l
    dec  l
    jr   nz, label_59854
    jr   nz, label_59869
    ld   l, a
    ld   l, [hl]
    ld   h, l
    jr   nz, label_59871
    ld   l, c
    ld   l, h

label_597FC::
    ld   l, h
    jr   nz, label_59873

label_597FF::
    ld   h, l
    ld   l, h
    ld   l, h
    jr   nz, label_59824
    ld   a, c
    ld   l, a
    ld   [hl], l

label_59807::
    jr   nz, label_59872
    ld   h, [hl]
    jr   nz, label_5986D
    jr   nz, label_59879
    ld   h, l
    ld   a, c

label_59810::
    jr   nz, label_5987B

label_59812::
    ld   [hl], e
    jr   nz, label_5987D
    ld   l, c
    ld   h, h
    ld   h, h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_59885

label_5981C::
    ld   l, [hl]
    jr   nz, label_59880

label_5981F::
    jr   nz, label_59893
    ld   l, a
    ld   l, a
    ld   l, l

label_59824::
    ld   [hl], a
    ld   l, b

label_59826::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_598A3
    ld   l, a
    ld   [hl], l
    jr   nz, label_59893
    ld   l, [hl]
    ld   [hl], h
    ld   h, l

label_59831::
    ld   [hl], d
    ld   hl, rNR41
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_598A0
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_598A1
    jr   nz, label_59862

label_59842::
    jr   nz, label_59864
    jr   nz, label_598B9
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   h, l
    jr   nz, label_598AE
    ld   h, l
    ld   h, c
    ld   l, e

label_5984F::
    ld   hl, label_2020
    jr   nz, label_59874

label_59854::
    jr   nz, label_598A2
    ld   h, l
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_598C2
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_598D5
    ld   l, b

label_59862::
    ld   h, l
    jr   nz, label_59885
    ld   l, a
    ld   [hl], a
    ld   l, h
    jr   nz, label_598DD
    ld   [hl], h
    ld   h, c
    ld   [hl], h

label_5986D::
    ld   [hl], l
    ld   h, l
    jr   nz, label_598E5

label_59871::
    ld   l, b

label_59872::
    ld   h, c

label_59873::
    ld   [hl], h

label_59874::
    jr   nz, label_598D8
    ld   h, l
    ld   l, h
    ld   l, a

label_59879::
    ld   l, [hl]
    ld   h, a

label_5987B::
    ld   [hl], e
    jr   nz, label_598F2
    ld   l, a
    jr   nz, label_598EA
    ld   [hl], h
    ld   l, $FF
    ld   e, c

label_59885::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_598F3
    ld   l, a
    ld   [hl], h
    jr   nz, label_59904
    ld   l, b
    ld   h, l
    jr   nz, label_598B4
    ld   c, [hl]
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, l
    ld   h, c
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_598EC

label_598A1::
    ld   h, l

label_598A2::
    ld   a, c

label_598A3::
    ld   hl, label_5AF4E
    ld   [hl], a
    jr   nz, label_59922
    ld   l, a
    ld   [hl], l
    jr   nz, label_59910
    ld   h, c

label_598AE::
    ld   l, [hl]
    jr   nz, label_59920
    ld   [hl], b
    ld   h, l
    ld   l, [hl]

label_598B4::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5991D

label_598B9::
    ld   l, a
    ld   l, a
    ld   [hl], d
    jr   nz, label_59932
    ld   l, a
    jr   nz, label_59935
    ld   l, b

label_598C2::
    ld   h, l
    jr   nz, label_59913
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, l
    ld   h, c
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_598F1
    jr   nz, label_598F3
    jr   nz, label_59921

label_598D5::
    ld   h, c
    ld   l, c
    ld   [hl], d

label_598D8::
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l

label_598DD::
    jr   nz, label_59946
    ld   l, a
    ld   [hl], h
    jr   nz, label_59944
    jr   nz, label_59938

label_598E5::
    ld   l, l
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_59936
    ld   h, l

label_598EC::
    ld   a, c
    ld   hl, label_2020
    ld   e, c

label_598F1::
    ld   l, a

label_598F2::
    ld   [hl], l

label_598F3::
    jr   nz, label_59958
    ld   h, c
    ld   l, [hl]
    jr   nz, label_59919
    jr   nz, label_5996A
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_59961
    jr   nz, label_5996E
    ld   l, a
    ld   h, e

label_59904::
    ld   l, e
    ld   h, l
    ld   h, h
    jr   nz, label_59929
    jr   nz, label_5996F
    ld   l, a
    ld   l, a
    ld   [hl], d
    ld   l, $FF

label_59910::
    jr   nz, label_59932
    jr   nz, label_5996D
    ld   l, a
    ld   [hl], l
    jr   nz, label_5997F
    ld   l, a

label_59919::
    ld   [hl], h
    jr   nz, label_5994E
    jr   nc, label_5993E
    jr   nz, label_59940

label_59920::
    jr   nz, label_59942

label_59922::
    jr   nz, label_59944
    jr   nz, label_59978
    ld   [hl], l
    ld   [hl], b
    ld   h, l

label_59929::
    ld   h, l
    ld   [hl], e
    ld   hl, label_2020
    jr   nz, label_59950
    jr   nz, label_59952

label_59932::
    jr   nz, label_59954
    jr   nz, label_59956

label_59936::
    ld   c, d
    ld   c, a

label_59938::
    ld   e, c
    ld   hl, label_20FF
    jr   nz, label_5995E

label_5993E::
    jr   nz, label_59999

label_59940::
    ld   l, a
    ld   [hl], l

label_59942::
    jr   nz, label_599AB

label_59944::
    ld   l, a
    ld   [hl], h

label_59946::
    jr   nz, label_5997D
    jr   nc, label_5996A
    jr   nz, label_5996C
    jr   nz, label_5996E

label_5994E::
    jr   nz, label_59970

label_59950::
    jr   nz, label_599A4

label_59952::
    ld   [hl], l
    ld   [hl], b

label_59954::
    ld   h, l
    ld   h, l

label_59956::
    ld   [hl], e
    ld   hl, label_2020
    jr   nz, label_5997C
    jr   nz, label_5997E

label_5995E::
    jr   nz, label_599B6
    ld   h, l

label_59961::
    ld   [hl], d
    ld   a, c
    jr   nz, label_599B3
    ld   l, c
    ld   h, e
    ld   h, l
    ld   hl, label_20FF
    jr   nz, label_5998D

label_5996D::
    ld   e, c

label_5996E::
    ld   l, a

label_5996F::
    ld   [hl], l

label_59970::
    jr   nz, label_599D9
    ld   l, a
    ld   [hl], h
    jr   nz, label_599A7
    jr   nc, label_599A8

label_59978::
    jr   nz, label_5999A
    jr   nz, label_5999C

label_5997C::
    jr   nz, label_5999E

label_5997E::
    jr   nz, label_599D2
    ld   [hl], l
    ld   [hl], b
    ld   h, l
    ld   h, l
    ld   [hl], e
    ld   hl, label_2020
    jr   nz, label_599AA
    jr   nz, label_599AC
    ld   e, c

label_5998D::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_599DC
    ld   h, c
    ld   [hl], b
    ld   [hl], b
    ld   a, c
    ld   hl, label_20FF
    jr   nz, label_599BD
    ld   e, c

label_5999E::
    ld   l, a
    ld   [hl], l
    jr   nz, label_59A09
    ld   l, a
    ld   [hl], h

label_599A4::
    jr   nz, label_599D8
    jr   nc, label_599D8

label_599A8::
    jr   nz, label_599CA

label_599AA::
    jr   nz, label_599CC

label_599AC::
    jr   nz, label_599CE
    jr   nz, label_59A02
    ld   [hl], l
    ld   [hl], b
    ld   h, l

label_599B3::
    ld   h, l
    ld   [hl], e
    ld   hl, label_2020
    jr   nz, label_599DA
    ld   e, c
    ld   l, a
    ld   [hl], l

label_599BD::
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_59A07
    ld   h, e
    ld   [hl], e
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   l, c
    ld   h, e
    ld   hl, label_58CFF

label_599CC::
    ld   h, l
    ld   h, c

label_599CE::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_59A3F

label_599D2::
    ld   h, l
    jr   nz, label_59A36
    ld   l, h
    ld   l, a
    ld   l, [hl]

label_599D8::
    ld   h, l

label_599D9::
    ld   hl, label_58920

label_599DC::
    ld   e, [hl]
    ld   l, l
    jr   nz, label_59A54
    ld   [hl], d
    ld   a, c
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_59A5B
    ld   l, a
    jr   nz, label_59A0A
    jr   nz, label_59A5F
    ld   l, c
    ld   [hl], h
    jr   nz, label_59A63
    ld   [hl], h
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_59A69
    ld   l, a
    jr   nz, label_59A19
    jr   nz, label_59A1B
    ld   d, e
    ld   h, e
    ld   l, b
    ld   [hl], l

label_599FF::
    ld   l, h
    ld   h, l
    jr   nz, label_59A66
    ld   h, c
    ld   l, [hl]
    jr   nz, label_59A77

label_59A07::
    ld   h, c
    ld   l, c

label_59A09::
    ld   l, [hl]

label_59A0A::
    ld   [hl], h
    ld   l, l
    ld   a, c
    jr   nz, label_59A7F
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    ld   [hl], d
    ld   h, c
    ld   l, c
    ld   [hl], h
    ld   hl, label_582FF

label_59A19::
    ld   d, l
    ld   e, d

label_59A1B::
    ld   e, d
    ld   e, d
    ld   e, d
    ld   e, d
    ld   hl, label_58220
    ld   d, l
    ld   e, d
    ld   e, d
    ld   e, d
    ld   e, d
    ld   hl, label_2020
    jr   nz, label_59A7B
    ld   d, l
    ld   d, h
    ld   e, d
    ld   e, d
    ld   e, d
    ld   c, c
    ld   b, h
    ld   b, l
    ld   d, d
    ld   hl, label_2020
    rst  $38
    ld   c, [hl]
    ld   b, l
    ld   b, l
    ld   c, [hl]
    ld   b, l
    ld   d, d

label_59A3F::
    jr   nz, label_59A8F
    ld   b, l
    ld   b, l
    ld   c, [hl]
    ld   b, l
    ld   d, d
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_59AB1
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_59ABA

label_59A54::
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59A79
    ld   l, l
    ld   h, l

label_59A5B::
    ld   hl, label_2020
    ld   c, [hl]

label_59A5F::
    ld   e, c
    ld   b, c
    ld   c, b
    jr   nz, label_59AB2
    ld   e, c
    ld   b, c

label_59A66::
    ld   c, b
    ld   hl, label_582FF
    ld   c, h
    ld   c, a
    ld   c, a
    ld   c, a
    ld   d, b
    ld   hl, label_58220
    ld   c, h
    ld   c, a
    ld   c, a
    ld   c, a
    ld   d, b

label_59A77::
    ld   hl, label_2020
    jr   nz, label_59AC3
    ld   c, h
    ld   d, l
    ld   b, d

label_59A7F::
    ld   hl, label_2020
    ld   b, a
    ld   c, h
    ld   d, l
    ld   b, d
    ld   hl, label_2020
    ld   c, a
    ld   b, a
    ld   b, a
    ld   b, a
    ld   c, b
    ld   hl, label_2020
    ld   b, [hl]
    ld   c, a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   b, h
    ld   hl, label_58220
    ld   c, h
    ld   c, a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   d, b
    ld   hl, label_2020
    ld   b, a
    ld   c, h
    ld   d, l
    ld   b, d
    ld   hl, label_593FF
    ld   [hl], e
    ld   [hl], e
    ld   l, a
    ld   l, $2E
    ld   l, $79

label_59AB1::
    ld   l, a

label_59AB2::
    ld   [hl], l
    jr   nz, label_59B16
    ld   [hl], d
    ld   h, l
    jr   nz, label_59AD9
    ld   [hl], h

label_59ABA::
    ld   l, b
    ld   h, l
    jr   nz, label_59B2D
    ld   [hl], l
    ld   [hl], h
    ld   [hl], e
    ld   [hl], e
    ld   [hl], e

label_59AC3::
    ld   l, c
    ld   h, h
    ld   h, l
    ld   [hl], d
    inc  l
    jr   nz, label_59B2D
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_59B43
    ld   l, a
    jr   nz, label_59B49
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_59B4B
    ld   l, b
    ld   h, l

label_59AD9::
    ld   d, a
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59B25
    ld   l, c
    ld   [hl], e
    ld   [hl], e
    ld   [hl], e
    ld   l, b
    ld   l, $2E
    ld   l, $20
    jr   nz, label_59B35
    ld   b, l
    ld   b, l
    ld   b, l
    dec  l
    ld   c, b
    ld   b, l
    ld   b, l
    dec  l
    ld   c, b
    ld   b, l
    ld   b, l
    ld   b, l
    ld   c, b
    ld   hl, label_58920
    jr   nz, label_59B6F
    ld   l, b
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_59B67
    ld   h, c
    ld   [hl], h
    jr   nz, label_59B7F
    ld   l, a
    ld   [hl], l
    ld   hl, label_588FF
    ld   c, a
    jr   nz, label_59B56
    ld   c, a
    jr   nz, label_59B59
    ld   c, a
    ld   hl, label_2020
    jr   nz, label_59B37
    jr   nz, label_59B39
    jr   nz, label_59B64
    ld   e, [hl]
    ld   l, l
    jr   nz, label_59B98
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_59B86
    ld   h, c

label_59B25::
    ld   h, h
    jr   nz, label_59B8F
    ld   [hl], l
    ld   a, c
    ld   [hl], h
    ld   l, b
    ld   l, c

label_59B2D::
    ld   [hl], e
    jr   nz, label_59BA4
    ld   l, c
    ld   l, l
    ld   h, l
    ld   hl, label_2021
    jr   nz, label_59B58
    jr   nz, label_59B5A
    ld   c, b
    ld   c, a
    jr   nz, label_59B86
    ld   c, a
    jr   nz, label_59B89
    ld   c, a
    ld   hl, label_594FF
    ld   d, e
    ld   d, e
    ld   d, e
    ld   c, e

label_59B49::
    inc  l
    jr   nz, label_59BA0
    ld   d, e
    ld   d, e
    ld   d, e
    ld   c, e
    ld   hl, label_2020
    jr   nz, label_59BAE
    ld   l, a

label_59B56::
    ld   [hl], l
    jr   nz, label_59BBD

label_59B59::
    ld   l, a

label_59B5A::
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_59BD2
    ld   [hl], e
    ld   [hl], e
    ld   h, l
    ld   h, l
    ld   l, l

label_59B64::
    ld   [hl], h
    ld   l, a
    jr   nz, label_59BD3
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_59BE4
    ld   l, b
    ld   h, c

label_59B6F::
    ld   [hl], h
    jr   nz, label_59B92
    jr   nz, label_59B94
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59BE9
    ld   h, [hl]
    jr   nz, label_59BE6
    ld   [hl], e
    ld   l, h

label_59B7F::
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59BA4
    ld   [hl], h
    ld   l, b

label_59B86::
    ld   l, c
    ld   [hl], e
    ld   [hl], e

label_59B89::
    ld   [hl], e
    jr   nz, label_59BF5
    ld   [hl], e
    ld   [hl], e
    ld   l, $2E
    ld   l, $20

label_59B92::
    jr   nz, label_59BB4

label_59B94::
    ld   c, e
    ld   b, l
    ld   b, l
    ld   b, l

label_59B98::
    dec  l
    ld   c, b
    ld   b, l
    ld   b, l
    ld   b, l
    dec  l
    ld   c, b
    ld   b, l

label_59BA0::
    ld   b, l
    ld   b, l
    ld   hl, label_59720
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_59C0B
    jr   nz, label_59C12
    ld   l, a
    ld   l, a

label_59BAE::
    ld   l, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_59C00
    ld   b, l
    ld   b, l
    dec  l
    ld   c, b
    ld   b, l
    ld   b, l
    dec  l
    ld   c, b

label_59BBD::
    ld   b, l
    ld   c, b
    ld   hl, rNR42
    ld   c, b
    ld   h, l
    ld   a, c
    jr   nz, label_59C2B
    ld   [hl], l
    ld   l, l
    ld   l, l
    ld   a, c
    ld   hl, label_58E20
    ld   h, l
    ld   h, l
    ld   h, h
    jr   nz, label_59C34

label_59BD3::
    jr   nz, label_59C3D
    ld   l, c
    ld   l, [hl]
    ld   [hl], h
    ccf
    jr   nz, label_59BFB
    ld   c, l
    ld   a, c
    jr   nz, label_59C56
    ld   h, l
    ld   h, c
    ld   l, e
    ld   [hl], b
    ld   l, a

label_59BE4::
    ld   l, c
    ld   l, [hl]

label_59BE6::
    ld   [hl], h
    jr   nz, label_59C52

label_59BE9::
    ld   [hl], e
    ld   l, $2E
    ld   l, $20
    ld   hl, label_2021
    jr   nz, label_59C4A
    ld   l, b
    ld   l, a

label_59BF5::
    ld   l, a
    ld   [hl], b
    ld   [hl], e
    ld   hl, label_2020

label_59BFB::
    ld   d, h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l

label_59C00::
    jr   nz, label_59C4B
    ld   h, a
    ld   l, a
    inc  l
    jr   nz, label_59C7B
    ld   h, c
    ld   l, h
    ld   l, e
    ld   l, c

label_59C0B::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_59C83
    ld   l, a
    ld   l, a
    jr   nz, label_59C80
    ld   [hl], l
    ld   h, e
    ld   l, b
    jr   nz, label_59C79
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   l, $2E
    ld   l, $FF
    ld   c, a
    ld   l, e
    ld   h, c
    ld   a, c
    inc  l
    jr   nz, label_59C93
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l

label_59C2B::
    ld   l, [hl]
    jr   nz, label_59CA3
    ld   [hl], b
    ld   hl, label_5A649
    jr   nz, label_59CA8

label_59C34::
    ld   l, b
    ld   h, l
    jr   nz, label_59C8F
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59C83

label_59C3D::
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   [hl], a
    ld   h, c
    ld   l, e
    ld   h, l
    ld   [hl], e
    jr   nz, label_59CBC
    ld   [hl], b
    inc  l
    jr   nz, label_59CB0

label_59C4B::
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   a, c
    dec  l
    ld   [hl], h
    ld   l, b

label_59C52::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_59CC6
    ld   l, [hl]
    jr   nz, label_59CCE
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_59C7F
    jr   nz, label_59CCA
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59CDF
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_59CCF
    ld   h, l
    jr   nz, label_59C90
    ld   h, a
    ld   l, a
    ld   l, [hl]
    ld   h, l
    jr   nz, label_59CDC
    ld   l, a
    ld   [hl], d
    ld   h, l

label_59C79::
    db   $76 ; Halt
    ld   h, l

label_59C7B::
    ld   [hl], d
    ld   hl, label_2020

label_59C7F::
    jr   nz, label_59CC2
    ld   l, [hl]
    ld   h, h

label_59C83::
    jr   nz, label_59CCE
    jr   nz, label_59CEB
    ld   l, a
    jr   nz, label_59CF7
    ld   h, l
    ld   h, c
    ld   l, [hl]
    ld   l, $2E

label_59C8F::
    ld   l, $45
    ld   d, [hl]
    ld   b, l

label_59C93::
    ld   d, d
    ld   e, c
    ld   d, h
    ld   c, b
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_58DFF
    ld   a, c
    jr   nz, label_59D05
    ld   l, [hl]
    ld   h, l
    ld   [hl], d

label_59CA3::
    ld   h, a
    ld   a, c
    ld   l, $2E
    ld   l, $20
    jr   nz, label_59CCB
    jr   nz, label_59D14
    ld   l, a
    ld   l, [hl]
    ld   h, l

label_59CB0::
    ld   l, $2E
    ld   l, $49
    ld   l, $2E
    ld   l, $6C
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    ld   hl, label_5B542
    ld   [hl], h
    jr   nz, label_59D3A
    ld   l, a

label_59CC2::
    ld   [hl], l
    jr   nz, label_59D3C
    ld   l, c

label_59CC6::
    ld   l, h
    ld   l, h
    jr   nz, label_59D2C

label_59CCA::
    ld   h, l

label_59CCB::
    jr   nz, label_59D39
    ld   l, a

label_59CCE::
    ld   [hl], e

label_59CCF::
    ld   [hl], h
    jr   nz, label_59D46
    ld   l, a
    ld   l, a
    inc  l
    jr   nz, label_59D40
    ld   h, [hl]
    jr   nz, label_59D4E
    ld   l, b
    ld   h, l

label_59CDC::
    ld   d, a
    ld   l, c
    ld   l, [hl]

label_59CDF::
    ld   h, h
    jr   nz, label_59D28
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_59D5E
    ld   h, c
    ld   l, e
    ld   h, l
    ld   [hl], e

label_59CEB::
    ld   hl, label_5A153
    ld   l, l
    ld   h, l
    jr   nz, label_59D53
    ld   [hl], e
    jr   nz, label_59D62
    ld   h, l
    ld   l, $2E
    ld   l, $79
    ld   l, a
    ld   [hl], l
    ld   l, $2E
    ld   l, $61
    ld   [hl], d
    ld   h, l
    ld   l, $2E
    ld   l, $69
    ld   l, [hl]
    ld   l, $2E
    ld   l, $20
    jr   nz, label_59D75
    ld   l, c
    ld   [hl], e
    ld   l, $2E
    ld   l, $64
    ld   [hl], d

label_59D14::
    ld   h, l
    ld   h, c
    ld   l, l
    ld   l, $2E
    ld   l, $FF
    ld   b, d
    ld   b, c
    ld   c, b
    ld   hl, label_2020
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_59D94
    ld   l, a
    ld   [hl], h

label_59D28::
    jr   nz, label_59D4A
    jr   nz, label_59D93

label_59D2C::
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_59DA6
    ld   l, a
    jr   nz, label_59D9D
    ld   l, a
    ld   l, h
    ld   h, h
    jr   nz, label_59D5A

label_59D3A::
    jr   nz, label_59D9E

label_59D3C::
    ld   h, c
    ld   h, e
    ld   l, e
    ld   hl, label_2020
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_59DAE
    ld   l, a
    ld   l, c
    ld   l, [hl]

label_59D4A::
    ld   h, a
    ld   [hl], h
    ld   l, a
    jr   nz, label_59DBC
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_59DCD
    ld   l, a
    ld   [hl], l
    jr   nz, label_59DCF
    ld   l, c
    ld   [hl], e

label_59D5A::
    ld   l, b
    ld   a, c
    ld   l, a
    ld   [hl], l

label_59D5E::
    jr   nz, label_59DD7
    ld   h, l
    ld   [hl], d

label_59D62::
    ld   h, l
    jr   nz, label_59DD3
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_59D8B
    ld   h, d
    ld   l, a
    ld   [hl], d
    ld   l, [hl]
    ld   hl, rNR42
    ld   b, e
    ld   d, d
    ld   b, c

label_59D75::
    ld   b, e
    ld   c, e
    ld   c, h
    ld   b, l
    dec  l
    ld   b, [hl]
    ld   d, a
    ld   c, a
    ld   c, a
    ld   c, a
    ld   d, e
    ld   c, b
    ld   hl, label_5AF59
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_59DF0
    ld   l, c

label_59D8B::
    ld   l, [hl]
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   h, l
    ld   h, h
    ld   hl, label_2049

label_59D94::
    ld   [hl], a
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_59E08
    ld   h, l
    db   $76 ; Halt
    ld   h, l

label_59D9D::
    ld   [hl], d

label_59D9E::
    jr   nz, label_59E0C
    ld   h, l
    ld   [hl], h
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_59E17
    ld   l, h
    ld   h, c
    ld   a, c
    jr   nz, label_59E20
    ld   l, b
    ld   h, l

label_59DAE::
    jr   nz, label_59DD0
    jr   nz, label_59DD2
    ld   c, c
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d
    ld   [hl], l
    ld   l, l
    ld   h, l
    ld   l, [hl]
    ld   [hl], h

label_59DBC::
    ld   [hl], e
    jr   nz, label_59E2E
    ld   h, [hl]
    jr   nz, label_59DE2
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_59E1A
    ld   l, c
    ld   [hl], d
    ld   h, l
    ld   l, [hl]
    ld   [hl], e
    ld   hl, rNR42

label_59DCF::
    ld   b, e

label_59DD0::
    dec  l
    ld   b, e

label_59DD2::
    dec  l

label_59DD3::
    ld   b, e
    ld   d, d
    ld   b, c
    ld   b, e

label_59DD7::
    ld   c, e
    ld   c, h
    ld   b, l
    ld   hl, label_2020
    jr   nz, label_59DFF
    ld   d, a
    ld   l, b
    ld   a, c

label_59DE2::
    jr   nz, label_59E48
    ld   l, c
    ld   h, h
    jr   nz, label_59E61
    ld   l, a
    ld   [hl], l
    jr   nz, label_59E4F
    ld   l, a
    ld   l, l
    ld   h, l
    ld   l, b

label_59DF0::
    ld   h, l
    ld   [hl], d
    ld   h, l
    ccf
    jr   nz, label_59E16
    ld   c, c
    ld   h, [hl]
    jr   nz, label_59E63
    ld   [hl], h
    jr   nz, label_59E1D
    jr   nz, label_59E1F

label_59DFF::
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_59E6E

label_59E08::
    ld   l, a
    ld   [hl], d
    jr   nz, label_59E85

label_59E0C::
    ld   l, a
    ld   [hl], l
    inc  l
    ld   l, [hl]
    ld   l, a
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_59E16::
    jr   nz, label_59E8F
    ld   l, a
    ld   [hl], l

label_59E1A::
    ld   l, h
    ld   h, h
    jr   nz, label_59E3E
    jr   nz, label_59E88

label_59E20::
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_59E99
    ld   l, a
    jr   nz, label_59E8B
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   h, l
    ld   hl, label_59920
    ld   l, a
    ld   [hl], l
    jr   nz, label_59E97
    ld   h, c
    ld   l, [hl]
    ld   l, [hl]
    ld   l, a
    ld   [hl], h
    jr   nz, label_59EB2
    ld   h, c
    ld   l, e
    ld   h, l

label_59E3E::
    jr   nz, label_59EB4
    ld   l, b
    ld   h, l
    jr   nz, label_59E9B
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59E8F

label_59E49::
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   hl, label_2020

label_59E4F::
    ld   d, d
    ld   h, l
    ld   l, l
    ld   h, l
    ld   l, l
    ld   h, d
    ld   h, l
    ld   [hl], d
    inc  l
    jr   nz, label_59ED3
    ld   l, a
    ld   [hl], l
    ld   l, $2E
    ld   l, $74
    ld   l, a

label_59E61::
    ld   l, a
    ld   l, $2E
    ld   l, $61
    ld   [hl], d
    ld   h, l
    jr   nz, label_59ED3
    ld   l, [hl]
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $74
    ld   l, b
    ld   h, l
    jr   nz, label_59EDB
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, l
    ld   l, $2E
    ld   l, $FF
    ld   c, b
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    ld   c, b
    ld   l, a

label_59E88::
    inc  l
    jr   nz, label_59EED

label_59E8B::
    ld   [hl], d
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_59E8F::
    ld   l, h
    ld   h, c
    ld   h, h
    inc  l
    jr   nz, label_59F04
    ld   l, [hl]
    jr   nz, label_59F11
    ld   l, a

label_59E99::
    ld   [hl], l
    ld   [hl], d

label_59E9B::
    jr   nz, label_59EBD
    jr   nz, label_59EBF
    ld   [hl], c
    ld   [hl], l
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_59F1A
    ld   l, a
    jr   nz, label_59F20
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_59ECE
    jr   nz, label_59F24
    ld   l, b
    ld   h, l

label_59EB2::
    jr   nz, label_59F18

label_59EB4::
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, l
    ld   h, l
    ld   [hl], d
    ld   hl, label_2020

label_59EBD::
    jr   nz, label_59EDF

label_59EBF::
    ld   d, a
    ld   h, l
    ld   l, h
    ld   h, e
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_59F3C
    ld   l, a
    jr   nz, label_59F3F
    ld   l, b
    ld   h, l
    jr   nz, label_59EEF
    ld   c, l
    ld   a, c
    ld   [hl], e
    ld   [hl], h

label_59ED3::
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_59F32

label_59EDB::
    ld   l, a
    ld   l, a
    ld   h, h
    ld   hl, label_5B54D
    ld   h, e
    ld   l, b
    jr   nz, label_59F54
    ld   h, [hl]
    jr   nz, label_59F55
    ld   a, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d

label_59EED::
    ld   a, c
    jr   nz, label_59F69
    ld   l, a
    ld   [hl], l
    jr   nz, label_59F6B
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_59F5F
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59F6D
    ld   l, [hl]
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_59F7A
    ld   l, [hl]
    ld   h, e
    ld   l, b
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   h, l
    ld   h, h
    jr   nz, label_59F2F
    ld   c, e
    ld   l, a

label_59F11::
    ld   l, b
    ld   l, a
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_59F82
    ld   [hl], e

label_59F1A::
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   hl, label_59E49
    ld   l, l
    jr   nz, label_59F85

label_59F24::
    ld   h, [hl]
    ld   [hl], d
    ld   h, c
    ld   l, c
    ld   h, h
    jr   nz, label_59FA4
    ld   l, a
    ld   [hl], l
    jr   nz, label_59F4F

label_59F2F::
    ld   l, l
    ld   h, c
    ld   a, c

label_59F32::
    jr   nz, label_59F9A
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59FA2
    ld   [hl], h
    jr   nz, label_59F9D

label_59F3C::
    jr   nz, label_59F5E
    jr   nz, label_59FB4
    ld   [hl], d
    ld   l, c
    ld   h, [hl]
    ld   l, h
    ld   h, l
    jr   nz, label_59FAB
    ld   l, c
    ld   h, [hl]
    ld   h, [hl]
    ld   l, c
    ld   h, e
    ld   [hl], l
    ld   l, h
    ld   [hl], h

label_59F4F::
    ld   [hl], h
    ld   l, a
    jr   nz, label_59FBF
    ld   h, l

label_59F54::
    ld   h, c

label_59F55::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_59FCD
    ld   l, b
    ld   h, l
    jr   nz, label_59F7D
    jr   nz, label_59F7F

label_59F5F::
    ld   l, c
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59FDE
    ld   l, b
    ld   l, c

label_59F69::
    ld   l, h
    ld   h, l

label_59F6B::
    jr   nz, label_59FE1

label_59F6D::
    ld   l, b
    ld   h, l
    ld   d, a
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_59FBB
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_59FE8

label_59F7A::
    ld   h, c
    ld   [hl], b
    ld   [hl], e

label_59F7D::
    ld   l, $20

label_59F7F::
    ld   l, $2E
    ld   l, $42
    ld   a, c
    jr   nz, label_59FFA
    ld   l, b
    ld   h, l
    jr   nz, label_59FEC
    ld   a, c
    inc  l
    jr   nz, label_59FAE
    jr   nz, label_59FF8
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5A00E
    ld   l, a
    ld   [hl], l
    jr   nz, label_59FFE
    db   $76 ; Halt

label_59F9A::
    ld   h, l
    ld   [hl], d
    jr   nz, label_59FBE
    jr   nz, label_5A016
    ld   l, c
    ld   [hl], e

label_59FA2::
    ld   l, c
    ld   [hl], h

label_59FA4::
    ld   h, l
    ld   h, h
    jr   nz, label_5A01C
    ld   l, b
    ld   h, l
    jr   nz, label_5A000
    ld   h, c
    ld   l, c

label_59FAE::
    ld   l, h
    ld   b, e
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    inc  l

label_59FB4::
    jr   nz, label_5A02D
    ld   l, b
    ld   l, c
    ld   h, e
    ld   l, b
    jr   nz, label_5A025
    ld   [hl], e
    jr   nz, label_59FDF

label_59FBF::
    ld   [hl], e
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, b
    jr   nz, label_5A035
    ld   h, [hl]
    jr   nz, label_5A03D
    ld   l, b
    ld   h, l
    jr   nz, label_59FED

label_59FCD::
    jr   nz, label_59FEF
    db   $76 ; Halt
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    ccf
    jr   nz, label_59FF9
    ld   b, a
    ld   l, a
    jr   nz, label_59FFD
    jr   nz, label_59FFF

label_59FDF::
    ld   [hl], h
    ld   l, b

label_59FE1::
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_5A05D
    ld   l, c
    ld   [hl], h

label_59FE8::
    ld   l, b
    jr   nz, label_5A05F
    ld   l, b

label_59FEC::
    ld   h, l

label_59FED::
    jr   nz, label_5A00F

label_59FEF::
    ld   l, e
    ld   h, l
    ld   a, c
    jr   nz, label_5A06D
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A05E

label_59FF8::
    ld   l, c

label_59FF9::
    ld   l, [hl]

label_59FFA::
    ld   h, h
    jr   nz, label_5A066

label_59FFD::
    ld   l, [hl]

label_59FFE::
    jr   nz, label_5A074

label_5A000::
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_5A06B
    ld   l, a
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, $2E
    ld   l, $20

label_5A00E::
    jr   nz, label_5A064
    ld   l, b
    ld   h, l
    jr   nz, label_5A06B
    ld   l, c
    ld   l, [hl]

label_5A016::
    ld   h, h
    jr   nz, label_5A05F
    ld   l, c
    ld   [hl], e
    ld   l, b

label_5A01C::
    jr   nz, label_5A087
    ld   [hl], e
    ld   [hl], a
    ld   h, c
    ld   [hl], h
    ld   h, e
    ld   l, b
    ld   l, c

label_5A025::
    ld   l, [hl]
    ld   h, a
    ld   l, $2E
    ld   l, $48
    ld   l, a
    ld   l, a

label_5A02D::
    ld   [hl], h
    ld   hl, label_588FF
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    ld   d, h
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_5A0B1

label_5A03D::
    ld   l, b
    ld   h, l
    jr   nz, label_5A0AC
    ld   h, l
    ld   a, c
    jr   nz, label_5A0A6
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A0B0
    ld   l, a
    jr   nz, label_5A0C0
    ld   l, a
    jr   nz, label_5A06F
    jr   nz, label_5A0C5
    ld   l, b
    ld   h, l
    jr   nz, label_5A0A9
    ld   h, c
    ld   l, c
    ld   l, h
    jr   nz, label_5A09D
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_5A05D::
    ld   l, $20

label_5A05F::
    jr   nz, label_5A0B3
    ld   h, l
    ld   [hl], h
    ld   [hl], d

label_5A064::
    ld   l, c
    ld   h, l

label_5A066::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5A0DE
    ld   l, b

label_5A06B::
    ld   h, l
    jr   nz, label_5A08E
    jr   nz, label_5A090
    ld   c, c
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h

label_5A074::
    ld   [hl], d
    ld   [hl], l
    ld   l, l
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5A0F0
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_5A0EA
    ld   [hl], e
    jr   nz, label_5A0EC
    ld   l, c
    ld   h, h
    ld   h, h

label_5A087::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5A0FF
    ld   l, b
    ld   h, l
    ld   [hl], d

label_5A08E::
    ld   h, l
    ld   hl, label_5AF47
    jr   nz, label_5A102
    ld   l, a
    ld   [hl], a
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_5A0BE
    jr   nz, label_5A0C0
    ld   d, a
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A0EC

label_5A0A6::
    ld   l, c
    ld   [hl], e
    ld   l, b

label_5A0A9::
    jr   nz, label_5A114
    ld   [hl], e

label_5A0AC::
    jr   nz, label_5A0CE
    jr   nz, label_5A0D0

label_5A0B0::
    ld   [hl], a

label_5A0B1::
    ld   h, c
    ld   l, c

label_5A0B3::
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   hl, label_2020
    ld   c, b
    ld   l, a
    ld   l, a
    ld   l, a

label_5A0BE::
    ld   [hl], h
    ld   hl, label_588FF
    ld   l, a
    ld   l, a
    ld   l, a

label_5A0C5::
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, c
    ld   [hl], h

label_5A0CE::
    jr   nz, label_5A139

label_5A0D0::
    ld   [hl], e
    ld   h, c
    ld   l, [hl]
    jr   nz, label_5A133
    ld   c, c
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d
    ld   [hl], l
    ld   l, l
    ld   h, l
    ld   l, [hl]

label_5A0DE::
    ld   [hl], h
    jr   nz, label_5A101
    ld   l, a
    ld   h, [hl]
    jr   nz, label_5A159
    ld   l, b
    ld   h, l
    jr   nz, label_5A13C
    ld   l, c

label_5A0EA::
    ld   [hl], d
    ld   h, l

label_5A0EC::
    ld   l, [hl]
    ld   [hl], e
    ld   hl, label_205E
    ld   c, c
    jr   nz, label_5A15C
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5A16D
    ld   l, a
    jr   nz, label_5A15D
    ld   h, h
    ld   l, l
    ld   l, c

label_5A0FF::
    ld   [hl], h
    inc  l

label_5A101::
    ld   h, c

label_5A102::
    ld   [hl], h
    jr   nz, label_5A16B
    ld   l, c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_5A154
    jr   nz, label_5A171
    ld   l, c
    ld   h, h
    jr   nz, label_5A131
    ld   l, [hl]
    ld   l, a
    ld   [hl], h

label_5A114::
    jr   nz, label_5A178
    ld   h, l
    ld   l, h
    ld   l, c
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5A197
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A199
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_5A199

label_5A127::
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5A150
    jr   nz, label_5A186
    ld   l, b

label_5A133::
    ld   h, c
    ld   [hl], h
    jr   nz, label_5A180
    ld   l, [hl]
    ld   [hl], e

label_5A139::
    ld   [hl], h
    ld   [hl], d
    ld   [hl], l

label_5A13C::
    ld   l, l
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    inc  l
    ld   h, c
    ld   l, h
    ld   l, a
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5A1BF
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_5A1C1
    ld   l, b
    ld   h, l
    jr   nz, label_5A171
    ld   [hl], e
    ld   h, l

label_5A153::
    db   $76 ; Halt

label_5A154::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5A1C7
    ld   [hl], h

label_5A159::
    ld   l, b
    ld   h, l
    ld   [hl], d

label_5A15C::
    ld   [hl], e

label_5A15D::
    jr   nz, label_5A1C8
    ld   l, [hl]
    jr   nz, label_5A1D6
    ld   l, b
    ld   h, l
    jr   nz, label_5A1D9
    ld   h, l
    ld   [hl], h
    inc  l
    jr   nz, label_5A1D3

label_5A16B::
    ld   h, c
    ld   [hl], e

label_5A16D::
    jr   nz, label_5A1E3
    ld   l, b
    ld   h, l

label_5A171::
    ld   [hl], b
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    jr   nz, label_5A1EC

label_5A178::
    ld   l, a
    jr   nz, label_5A1F2
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_5A1A0

label_5A180::
    jr   nz, label_5A1F6
    ld   l, b
    ld   h, l
    jr   nz, label_5A1DD

label_5A186::
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A1D1
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A203
    ld   [hl], l

label_5A197::
    ld   [hl], e
    ld   [hl], h

label_5A199::
    jr   nz, label_5A1FE
    ld   l, a
    ld   l, h
    ld   l, h
    ld   h, l
    ld   h, e

label_5A1A0::
    ld   [hl], h
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   l, l
    jr   nz, label_5A208
    ld   l, h
    ld   l, h
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_5A226
    ld   h, c
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d
    ld   [hl], l
    ld   h, e
    ld   [hl], h
    ld   h, l
    ld   h, h
    jr   nz, label_5A231
    ld   l, a
    jr   nz, label_5A1E0
    jr   nz, label_5A229
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5A240

label_5A1C7::
    ld   l, a

label_5A1C8::
    ld   [hl], l
    jr   nz, label_5A22F
    ld   l, c
    ld   [hl], d
    ld   h, l
    ld   h, e
    dec  l
    jr   nz, label_5A246
    ld   l, c

label_5A1D3::
    ld   l, a
    ld   l, [hl]
    ld   [hl], e

label_5A1D6::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5A235
    ld   l, a

label_5A1DD::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5A201
    ld   l, [hl]
    ld   h, l

label_5A1E3::
    ld   a, b
    ld   [hl], h
    jr   nz, label_5A24E
    ld   l, a
    ld   h, c
    ld   l, h
    jr   nz, label_5A255

label_5A1EC::
    ld   [hl], e
    jr   nz, label_5A20F
    jr   nz, label_5A211
    ld   l, [hl]

label_5A1F2::
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    ld   l, b

label_5A1F6::
    inc  l
    jr   nz, label_5A262
    ld   l, [hl]
    jr   nz, label_5A21C
    jr   nz, label_5A21E

label_5A1FE::
    jr   nz, label_5A220
    jr   nz, label_5A249
    ld   l, a

label_5A203::
    ld   [hl], b
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   h, c

label_5A208::
    jr   nz, label_5A25D
    ld   [hl], a
    ld   h, c
    ld   l, l
    ld   [hl], b
    ld   hl, label_2021

label_5A211::
    ld   c, b
    ld   l, a
    ld   l, a
    ld   [hl], h
    inc  l
    jr   nz, label_5A281
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   h, l

label_5A21C::
    ld   h, h
    ld   hl, label_588FF

label_5A220::
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020

label_5A226::
    ld   d, h
    ld   l, b
    ld   h, c

label_5A229::
    ld   [hl], h
    jr   nz, label_5A295
    ld   [hl], e
    jr   nz, label_5A290

label_5A22F::
    ld   h, [hl]
    ld   h, l

label_5A231::
    ld   h, c
    ld   [hl], d
    ld   [hl], e
    ld   l, a

label_5A235::
    ld   l, l
    ld   h, l
    jr   nz, label_5A2A5
    ld   l, a
    ld   l, a
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   h, c

label_5A240::
    ld   l, [hl]
    ld   l, c
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_5A2C0
    ld   l, a
    ld   [hl], l

label_5A249::
    jr   nz, label_5A2B3
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_5A24E::
    jr   nz, label_5A2C4
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_2020
    ld   b, h
    ld   l, a
    jr   nz, label_5A2C9
    ld   l, a
    ld   [hl], h

label_5A25D::
    jr   nz, label_5A27F
    ld   h, [hl]
    ld   l, a
    ld   [hl], d

label_5A262::
    ld   h, a
    ld   h, l
    ld   [hl], h
    inc  l
    jr   nz, label_5A2DC
    ld   l, b
    ld   h, l
    jr   nz, label_5A2DA
    ld   h, l
    ld   a, b
    ld   [hl], h
    ld   c, c
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d
    ld   [hl], l
    ld   l, l
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5A2E4
    ld   [hl], e
    jr   nz, label_5A2E7
    ld   l, [hl]

label_5A27F::
    ld   b, a
    ld   l, a

label_5A281::
    ld   [hl], b
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   h, c
    jr   nz, label_5A2DB
    ld   [hl], a
    ld   h, c
    ld   l, l
    ld   [hl], b
    ld   hl, label_588FF
    ld   l, a

label_5A290::
    ld   l, a
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_59420
    ld   l, b
    ld   h, l
    jr   nz, label_5A2F2
    ld   l, c
    ld   l, [hl]
    ld   h, h
    ld   b, [hl]
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_5A317
    ld   l, h

label_5A2A5::
    ld   h, l
    ld   h, l
    ld   [hl], b
    ld   [hl], e
    jr   nz, label_5A317
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A317

label_5A2B3::
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, l
    ld   l, c
    ld   l, h
    ld   a, c
    jr   nz, label_5A325
    ld   l, [hl]
    jr   nz, label_5A333
    ld   l, b

label_5A2C0::
    ld   h, l
    jr   nz, label_5A308
    ld   h, a

label_5A2C4::
    ld   h, a
    jr   nz, label_5A328
    ld   h, d
    ld   l, a

label_5A2C9::
    db   $76 ; Halt
    ld   h, l
    ld   l, $2E
    ld   l, $57
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5A34D
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A348
    ld   l, h
    ld   h, c

label_5A2DA::
    ld   a, c

label_5A2DB::
    jr   nz, label_5A2FD
    jr   nz, label_5A353
    ld   l, b
    ld   h, l
    jr   nz, label_5A348
    ld   l, c

label_5A2E4::
    ld   h, a
    ld   l, b
    ld   [hl], h

label_5A2E7::
    jr   nz, label_5A33C
    ld   l, c
    ld   [hl], d
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5A338
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h

label_5A2F2::
    ld   [hl], d
    ld   [hl], l
    ld   l, l
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_5A364
    ld   l, [hl]
    jr   nz, label_5A31E
    ld   h, [hl]
    ld   [hl], d
    ld   l, a
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5A374
    ld   h, [hl]
    jr   nz, label_5A37C

label_5A308::
    ld   l, b
    ld   h, l
    jr   nz, label_5A351
    ld   h, a
    ld   h, a
    ld   l, b
    ld   h, l
    jr   nz, label_5A389
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_5A378

label_5A317::
    ld   [hl], a
    ld   h, c
    ld   l, e
    ld   h, l
    ld   l, [hl]
    ld   l, $20

label_5A31E::
    ld   d, h
    ld   l, b
    ld   l, c
    ld   [hl], e
    inc  l
    jr   nz, label_5A392

label_5A325::
    ld   a, c
    jr   nz, label_5A38E

label_5A328::
    ld   [hl], d
    ld   l, c
    ld   h, l
    ld   l, [hl]
    ld   h, h
    inc  l
    ld   l, c
    ld   [hl], e
    jr   nz, label_5A3A6
    ld   l, b

label_5A333::
    ld   h, l
    jr   nz, label_5A3A5
    ld   l, [hl]
    ld   l, h

label_5A338::
    ld   a, c
    jr   nz, label_5A3B2
    ld   h, c

label_5A33C::
    ld   a, c
    jr   nz, label_5A3A5
    ld   l, a
    ld   [hl], d
    jr   nz, label_5A3BC
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A3BB
    ld   l, a

label_5A348::
    jr   nz, label_5A3B6
    ld   h, l
    ld   h, c
    db   $76 ; Halt

label_5A34D::
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   h, l

label_5A351::
    jr   nz, label_5A3BC

label_5A353::
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   hl, label_58820
    ld   l, a
    ld   l, a
    ld   hl, label_588FF
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    ld   c, b
    ld   l, a
    ld   [hl], a
    jr   nz, label_5A3D8
    ld   h, c
    ld   l, [hl]
    ld   a, c
    jr   nz, label_5A3B9
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d

label_5A374::
    ld   [hl], l
    ld   l, l
    ld   h, l
    ld   l, [hl]

label_5A378::
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_5A39C

label_5A37C::
    jr   nz, label_5A39E
    jr   nz, label_5A3E8
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5A3FE
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A3F0

label_5A389::
    ld   l, a
    ld   [hl], h
    ld   [hl], h
    ld   h, l
    ld   l, [hl]

label_5A38E::
    jr   nz, label_5A403
    ld   l, a
    jr   nz, label_5A3F9
    ld   h, c
    ld   [hl], d
    ccf
    jr   nz, label_5A3B8
    ld   d, a
    ld   l, b
    ld   h, l
    ld   l, [hl]

label_5A39C::
    jr   nz, label_5A3BE

label_5A39E::
    jr   nz, label_5A419
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A414
    ld   l, h

label_5A3A5::
    ld   h, c

label_5A3A6::
    ld   a, c
    jr   nz, label_5A41D
    ld   l, b
    ld   h, l
    jr   nz, label_5A3CD
    jr   nz, label_5A3CF
    ld   c, c
    ld   l, [hl]
    ld   [hl], e

label_5A3B2::
    ld   [hl], h
    ld   [hl], d
    ld   [hl], l
    ld   l, l

label_5A3B6::
    ld   h, l
    ld   l, [hl]

label_5A3B8::
    ld   [hl], h

label_5A3B9::
    ld   [hl], e
    jr   nz, label_5A425

label_5A3BC::
    ld   l, [hl]
    jr   nz, label_5A3DF
    ld   h, [hl]
    ld   [hl], d
    ld   l, a
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5A435
    ld   h, [hl]
    jr   nz, label_5A43D
    ld   l, b
    ld   h, l
    jr   nz, label_5A3ED

label_5A3CD::
    jr   nz, label_5A3EF

label_5A3CF::
    ld   b, l
    ld   h, a
    ld   h, a
    inc  l
    jr   nz, label_5A449
    ld   l, b
    ld   h, l
    jr   nz, label_5A430
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A3FE
    jr   nz, label_5A426
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_5A45C
    ld   l, c
    ld   l, h
    ld   l, h

label_5A3E8::
    jr   nz, label_5A461
    ld   h, c
    ld   l, e
    ld   h, l

label_5A3ED::
    jr   nz, label_5A40F

label_5A3EF::
    ld   h, c

label_5A3F0::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A46D
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A46F
    ld   l, c

label_5A3F9::
    ld   l, h
    ld   l, h
    jr   nz, label_5A41D
    jr   nz, label_5A41F

label_5A3FF::
    ld   l, h
    ld   h, l
    ld   h, c
    db   $76 ; Halt

label_5A403::
    ld   h, l
    jr   nz, label_5A47A
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_5A42B
    jr   nz, label_5A42D
    jr   nz, label_5A42F

label_5A40F::
    ld   l, c
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]

label_5A414::
    ld   h, h
    ld   l, $20
    jr   nz, label_5A467

label_5A419::
    ld   l, a
    ld   [hl], a
    inc  l
    jr   nz, label_5A43E
    jr   nz, label_5A499
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A491
    ld   [hl], l

label_5A425::
    ld   [hl], e

label_5A426::
    ld   [hl], h
    jr   nz, label_5A491
    ld   h, c
    ld   [hl], e

label_5A42B::
    ld   [hl], h
    ld   h, l

label_5A42D::
    ld   l, [hl]
    jr   nz, label_5A4A4

label_5A430::
    ld   l, a
    jr   nz, label_5A4A7
    ld   l, b
    ld   h, l

label_5A435::
    jr   nz, label_5A490
    ld   h, c
    ld   [hl], d
    ld   l, [hl]
    ld   h, c
    jr   nz, label_5A45D

label_5A43D::
    jr   nz, label_5A45F
    ld   b, h
    ld   h, l
    ld   [hl], e
    ld   h, l
    ld   [hl], d
    ld   [hl], h
    ld   hl, label_2020
    ld   d, h

label_5A449::
    ld   l, b
    ld   h, l
    jr   nz, label_5A46D
    jr   nz, label_5A46F
    ld   h, h
    ld   h, c
    ld   [hl], d
    ld   l, e
    inc  l
    jr   nz, label_5A4C3
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d
    ld   l, a

label_5A45C::
    ld   [hl], l

label_5A45D::
    ld   [hl], e
    jr   nz, label_5A4C9
    ld   l, [hl]

label_5A461::
    ld   l, b
    ld   h, c
    ld   h, d
    ld   l, c
    ld   [hl], h
    ld   h, c

label_5A467::
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_5A4DB
    ld   h, [hl]

label_5A46D::
    jr   nz, label_5A48F

label_5A46F::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5A4E7
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A4F0
    ld   l, c

label_5A47A::
    ld   l, h
    ld   l, h
    jr   nz, label_5A49E
    jr   nz, label_5A4F3
    ld   l, b
    ld   l, a
    ld   [hl], a
    jr   nz, label_5A4FE
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A4FD
    ld   l, b
    ld   h, l
    jr   nz, label_5A4AD
    jr   nz, label_5A4AF

label_5A48F::
    ld   [hl], a

label_5A490::
    ld   h, c

label_5A491::
    ld   a, c
    ld   hl, label_58820
    ld   l, a
    ld   l, a
    ld   [hl], h
    jr   nz, label_5A4E2
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_588FF
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    ld   d, h

label_5A4A7::
    ld   l, b
    ld   h, l
    jr   nz, label_5A51E
    ld   l, b
    ld   h, c

label_5A4AD::
    ld   [hl], b
    ld   h, l

label_5A4AF::
    ld   l, a
    ld   h, [hl]
    jr   nz, label_5A527
    ld   l, b
    ld   h, l
    jr   nz, label_5A522
    ld   h, l
    ld   a, c
    jr   nz, label_5A52E
    ld   l, b
    ld   l, a
    ld   [hl], a
    ld   [hl], e
    ld   h, c
    jr   nz, label_5A528
    ld   l, c

label_5A4C3::
    ld   [hl], e
    ld   l, b
    inc  l
    jr   nz, label_5A53B
    ld   [hl], a

label_5A4C9::
    ld   l, c
    ld   l, l
    ld   l, l
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   [hl], l
    ld   [hl], b
    jr   nz, label_5A534
    jr   nz, label_5A538
    ld   h, c
    ld   [hl], e
    ld   h, e
    ld   h, c
    ld   h, h
    ld   h, l

label_5A4DB::
    jr   nz, label_5A54C
    ld   h, [hl]
    jr   nz, label_5A557
    ld   h, c
    ld   [hl], h

label_5A4E2::
    ld   h, l
    ld   [hl], d
    ld   hl, label_2020

label_5A4E7::
    ld   b, a
    ld   l, a
    jr   nz, label_5A559
    ld   l, a
    ld   [hl], a
    jr   nz, label_5A50F
    ld   [hl], h

label_5A4F0::
    ld   l, a
    jr   nz, label_5A567

label_5A4F3::
    ld   l, b
    ld   h, l
    jr   nz, label_5A564
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ld   h, c
    ld   l, c

label_5A4FD::
    ld   l, [hl]

label_5A4FE::
    jr   nz, label_5A577
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   h, [hl]
    ld   h, c
    ld   l, h
    ld   l, h
    ld   hl, label_2020
    ld   b, c
    jr   nz, label_5A52E
    jr   nz, label_5A57C
    ld   h, l
    ld   h, c
    ld   [hl], b
    jr   nz, label_5A57B
    ld   [hl], d
    ld   l, a
    ld   l, l
    jr   nz, label_5A58E
    ld   l, b
    ld   h, l
    jr   nz, label_5A53E

label_5A51E::
    jr   nz, label_5A594
    ld   l, a
    ld   [hl], b

label_5A522::
    jr   nz, label_5A585
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A5A1

label_5A528::
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A5A3
    ld   l, c
    ld   l, h

label_5A52E::
    ld   l, h
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   h, e
    ld   l, b

label_5A534::
    jr   nz, label_5A5AF
    ld   l, a
    ld   [hl], l

label_5A538::
    ld   [hl], d
    jr   nz, label_5A5A2

label_5A53B::
    ld   l, a
    ld   h, c
    ld   l, h

label_5A53E::
    ld   hl, label_588FF
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    ld   d, h

label_5A548::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l

label_5A54C::
    jr   nz, label_5A5AF
    ld   [hl], d
    ld   h, l
    ld   [hl], h
    ld   [hl], a
    ld   l, a

label_5A553::
    jr   nz, label_5A5C8
    ld   l, b
    ld   [hl], d

label_5A557::
    ld   l, c
    ld   l, [hl]

label_5A559::
    ld   h, l
    ld   [hl], e
    inc  l
    jr   nz, label_5A5CD
    ld   l, [hl]
    ld   h, l
    ld   [hl], h
    ld   l, a
    jr   nz, label_5A5D8

label_5A564::
    ld   l, b
    ld   h, l
    jr   nz, label_5A5D6
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    ld   l, b
    inc  l
    jr   nz, label_5A58F
    jr   nz, label_5A5E5
    ld   l, b
    ld   h, l
    jr   nz, label_5A5E4
    ld   [hl], h
    ld   l, b

label_5A577::
    ld   h, l
    ld   [hl], d
    jr   nz, label_5A5EF

label_5A57B::
    ld   l, a

label_5A57C::
    jr   nz, label_5A5F2
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, b

label_5A585::
    ld   l, $20
    jr   nz, label_5A5CF
    ld   l, c
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    inc  l

label_5A58E::
    jr   nz, label_5A5B0
    ld   l, b
    ld   h, l
    ld   h, c
    ld   h, h

label_5A594::
    jr   nz, label_5A609
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, b
    inc  l
    jr   nz, label_5A5BD
    jr   nz, label_5A5BF
    jr   nz, label_5A618

label_5A5A1::
    ld   l, b

label_5A5A2::
    ld   h, l

label_5A5A3::
    ld   [hl], d
    ld   h, l
    jr   nz, label_5A608
    ld   l, [hl]
    ld   h, e
    ld   l, c
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5A5CF

label_5A5AF::
    jr   nz, label_5A623
    ld   [hl], l
    ld   l, c
    ld   l, [hl]
    ld   [hl], e
    jr   nz, label_5A62A
    ld   [hl], b
    ld   h, l
    ld   h, c
    ld   l, e
    jr   nz, label_5A62C

label_5A5BD::
    ld   h, [hl]
    jr   nz, label_5A5E0
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5A61C
    ld   l, c
    ld   l, [hl]
    ld   h, h

label_5A5C8::
    jr   nz, label_5A610
    ld   l, c
    ld   [hl], e
    ld   l, b

label_5A5CD::
    ld   l, $2E

label_5A5CF::
    ld   l, $59
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A64C
    ld   l, c

label_5A5D6::
    ld   l, h
    ld   l, h

label_5A5D8::
    jr   nz, label_5A646
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   l, [hl]
    jr   nz, label_5A600

label_5A5E0::
    ld   l, l
    ld   [hl], l
    ld   h, e
    ld   l, b

label_5A5E4::
    jr   nz, label_5A65A
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   c, b

label_5A5EF::
    ld   l, a
    ld   l, a
    ld   [hl], h

label_5A5F2::
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_5A66B
    ld   h, l
    ld   h, l
    jr   nz, label_5A675
    ld   l, a
    ld   [hl], l
    ld   l, b
    ld   h, c

label_5A600::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5A676
    ld   h, l
    ld   h, c
    ld   h, h
    jr   nz, label_5A67D

label_5A609::
    ld   l, b
    ld   h, l
    jr   nz, label_5A62D
    jr   nz, label_5A681
    ld   h, l

label_5A610::
    ld   l, h
    ld   l, c
    ld   h, l
    ld   h, [hl]
    ld   l, $2E
    ld   l, $20

label_5A618::
    jr   nz, label_5A671
    ld   l, b
    ld   l, c

label_5A61C::
    ld   l, h
    ld   h, l
    ld   l, c
    ld   [hl], h
    jr   nz, label_5A686
    ld   l, a

label_5A623::
    ld   h, l
    ld   [hl], e
    jr   nz, label_5A69A
    ld   h, c
    ld   a, c
    jr   nz, label_5A69F
    ld   l, b

label_5A62C::
    ld   h, l

label_5A62D::
    jr   nz, label_5A698
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A69F
    ld   [hl], e
    jr   nz, label_5A69B
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5A69E
    jr   nz, label_5A6A3
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, l
    jr   nz, label_5A6B4
    ld   h, [hl]

label_5A646::
    jr   nz, label_5A6BC
    ld   l, b

label_5A649::
    ld   h, l
    jr   nz, label_5A66C

label_5A64C::
    jr   nz, label_5A66E
    ld   d, a
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A69A
    ld   l, c
    ld   [hl], e
    ld   l, b
    inc  l
    jr   nz, label_5A6C8

label_5A65A::
    ld   l, a
    jr   nz, label_5A67D
    jr   nz, label_5A6CE
    ld   l, [hl]
    ld   h, l
    jr   nz, label_5A6CC
    ld   [hl], e
    jr   nz, label_5A6D8
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c

label_5A66B::
    jr   nz, label_5A68D
    jr   nz, label_5A6E2
    ld   [hl], l
    ld   [hl], d

label_5A671::
    ld   h, l
    ld   l, $2E
    ld   l, $20

label_5A676::
    jr   nz, label_5A6C2
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_5A6DE

label_5A67D::
    ld   [hl], e
    ld   a, c
    ld   l, a
    ld   [hl], l

label_5A681::
    jr   nz, label_5A6E6
    ld   h, c
    ld   l, [hl]
    ld   l, [hl]

label_5A686::
    ld   l, a
    ld   [hl], h
    jr   nz, label_5A6F5
    ld   l, [hl]
    ld   l, a
    ld   [hl], a

label_5A68D::
    jr   nz, label_5A6F8
    ld   h, [hl]
    jr   nz, label_5A6F3
    jr   nz, label_5A6F7
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   [hl], h

label_5A698::
    jr   nz, label_5A702

label_5A69A::
    ld   l, a

label_5A69B::
    ld   l, h
    ld   h, h
    ld   [hl], e

label_5A69E::
    ld   [hl], h

label_5A69F::
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   [hl], e

label_5A6A3::
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_5A71D
    ld   l, [hl]
    ld   [hl], h
    ld   l, c
    ld   l, h
    jr   nz, label_5A6CE
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A722
    ld   [hl], b

label_5A6B4::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5A721
    ld   [hl], h
    inc  l
    jr   nz, label_5A72F

label_5A6BC::
    ld   l, a
    jr   nz, label_5A738
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A726
    ld   h, c
    ld   l, [hl]
    ld   l, [hl]
    ld   l, a
    ld   [hl], h

label_5A6C8::
    jr   nz, label_5A73E
    ld   h, l
    ld   l, h

label_5A6CC::
    ld   l, h
    jr   nz, label_5A738
    ld   h, [hl]
    jr   nz, label_5A746
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_5A740
    ld   [hl], e

label_5A6D8::
    jr   nz, label_5A73B
    jr   nz, label_5A6FC
    jr   nz, label_5A6FE

label_5A6DE::
    ld   h, h
    ld   [hl], d
    ld   h, l
    ld   h, c

label_5A6E2::
    ld   l, l
    jr   nz, label_5A75A
    ld   l, [hl]

label_5A6E6::
    ld   [hl], h
    ld   l, c
    ld   l, h
    jr   nz, label_5A764
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A750
    ld   [hl], a
    ld   h, c
    ld   l, e
    ld   h, l

label_5A6F3::
    ld   l, [hl]
    ld   l, $2E
    ld   l, $20

label_5A6F8::
    jr   nz, label_5A74E
    ld   l, b
    ld   h, l

label_5A6FC::
    jr   nz, label_5A71E

label_5A6FE::
    ld   l, a
    ld   l, [hl]
    ld   l, h
    ld   a, c

label_5A702::
    jr   nz, label_5A773
    ld   l, [hl]
    ld   h, l
    jr   nz, label_5A77F
    ld   l, b
    ld   l, a
    jr   nz, label_5A72C
    jr   nz, label_5A72E
    ld   l, e
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    ld   [hl], e
    jr   nz, label_5A77B
    ld   l, a
    ld   [hl], d
    jr   nz, label_5A78C
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_5A73E

label_5A71E::
    ld   l, c
    ld   [hl], e
    jr   nz, label_5A796

label_5A722::
    ld   l, b
    ld   h, l
    jr   nz, label_5A77D

label_5A726::
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A74B
    jr   nz, label_5A74D
    jr   nz, label_5A775

label_5A72F::
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5A78C

label_5A738::
    ld   [hl], d
    ld   [hl], l
    ld   [hl], e

label_5A73B::
    ld   [hl], h
    jr   nz, label_5A75E

label_5A73E::
    ld   a, c
    ld   l, a

label_5A740::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5A7AA
    ld   h, l
    ld   h, l

label_5A746::
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   [hl], e

label_5A74B::
    ld   l, $2E

label_5A74D::
    ld   l, $53
    ld   l, a

label_5A750::
    ld   l, l
    ld   h, l
    ld   h, h
    ld   h, c
    ld   a, c
    jr   nz, label_5A7D0
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A7D2
    ld   l, c
    ld   l, h
    ld   l, h

label_5A75E::
    ld   l, e
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_5A7CA

label_5A764::
    ld   l, a
    ld   [hl], d
    jr   nz, label_5A7DB
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   c, b
    ld   l, a
    ld   l, a
    ld   [hl], h

label_5A773::
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_5A7E8

label_5A77B::
    ld   h, c
    ld   l, [hl]

label_5A77D::
    ld   a, c
    jr   nz, label_5A7ED
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    jr   nz, label_5A7F8
    ld   h, [hl]
    jr   nz, label_5A800

label_5A78C::
    ld   l, b
    ld   l, c
    ld   [hl], e
    ld   l, c
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A7FD
    ld   h, l
    ld   h, c
    ld   [hl], d
    jr   nz, label_5A810
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5A7FB
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A7EF
    ld   l, c

label_5A7AA::
    ld   [hl], e
    ld   l, b
    jr   nz, label_5A817
    ld   [hl], e
    ld   h, c
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5A82A
    ld   l, a
    jr   nz, label_5A81A
    ld   [hl], a
    ld   h, c
    ld   l, e
    ld   h, l
    ld   l, [hl]
    ld   hl, label_5A854
    ld   h, l
    jr   nz, label_5A831
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d

label_5A7CA::
    ld   [hl], e
    ld   e, [hl]
    jr   nz, label_5A7EE
    jr   nz, label_5A840

label_5A7D0::
    ld   l, a
    ld   [hl], a

label_5A7D2::
    ld   h, l
    ld   [hl], d
    jr   nz, label_5A83F
    ld   [hl], e
    jr   nz, label_5A84B
    ld   h, l
    ld   h, c

label_5A7DB::
    ld   l, h
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_5A852
    ld   h, c
    ld   a, c
    jr   nz, label_5A84C
    ld   l, a
    ld   l, [hl]
    ld   [hl], c
    ld   [hl], l

label_5A7ED::
    ld   h, l

label_5A7EE::
    ld   [hl], d

label_5A7EF::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5A85D
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]

label_5A7F8::
    ld   h, h
    jr   nz, label_5A85C

label_5A7FB::
    ld   l, [hl]
    ld   h, h

label_5A7FD::
    jr   nz, label_5A81F
    ld   h, h

label_5A800::
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d
    ld   l, a
    ld   a, c
    jr   nz, label_5A87C
    ld   l, b
    ld   h, l
    ld   l, c
    ld   [hl], d
    jr   nz, label_5A82E
    jr   nz, label_5A876

label_5A810::
    ld   l, a
    ld   h, l
    ld   [hl], e
    ld   hl, label_2020
    ld   d, h

label_5A817::
    ld   l, b
    ld   h, c
    ld   [hl], h

label_5A81A::
    jr   nz, label_5A880
    ld   h, c
    ld   a, c
    jr   nz, label_5A88D
    ld   h, c
    ld   a, c
    jr   nz, label_5A887
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_5A89C
    ld   l, a

label_5A82A::
    ld   l, a
    ld   l, [hl]
    ld   hl, label_2020
    ld   c, [hl]
    ld   l, a

label_5A831::
    ld   [hl], a
    inc  l
    jr   nz, label_5A89C
    ld   l, a
    jr   nz, label_5A8AC
    ld   l, a
    jr   nz, label_5A8AF
    ld   l, b
    ld   h, l
    jr   nz, label_5A85F

label_5A83F::
    ld   l, l

label_5A840::
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   l, [hl]
    jr   nz, label_5A8BD
    ld   l, a
    ld   [hl], a

label_5A84B::
    ld   h, l

label_5A84C::
    ld   [hl], d
    ld   hl, label_58620
    ld   l, h
    ld   a, c

label_5A852::
    jr   nz, label_5A8C0

label_5A854::
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_5A8BA
    jr   nz, label_5A8BD
    ld   l, c

label_5A85C::
    ld   [hl], d

label_5A85D::
    ld   h, h
    ld   hl, label_5AF48
    ld   l, a
    ld   [hl], h
    ld   hl, label_58820
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_588FF
    ld   l, a
    ld   l, a
    ld   [hl], h
    jr   nz, label_5A8D9
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_5A899
    jr   nz, label_5A89B
    ld   e, c

label_5A87C::
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5A8F1
    ld   h, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_5A8EF
    ld   [hl], e

label_5A887::
    jr   nz, label_5A8A9
    jr   nz, label_5A8AB
    ld   l, [hl]
    ld   l, a

label_5A88D::
    ld   [hl], h
    jr   nz, label_5A8F5
    ld   h, c
    ld   [hl], e
    ld   a, c
    inc  l
    jr   nz, label_5A8F8
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5A8BA
    jr   nz, label_5A915

label_5A89C::
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A901
    ld   [hl], d
    ld   h, l
    jr   nz, label_5A905
    ld   l, h
    ld   l, l
    ld   l, a
    ld   [hl], e
    ld   [hl], h

label_5A8A9::
    jr   nz, label_5A8CB

label_5A8AB::
    ld   [hl], h

label_5A8AC::
    ld   l, b
    ld   h, l
    ld   [hl], d

label_5A8AF::
    ld   h, l
    ld   l, $20
    ld   b, a
    ld   l, a
    jr   nz, label_5A91B
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, $20
    ld   d, h
    ld   l, b

label_5A8BD::
    ld   h, l
    jr   nz, label_5A917

label_5A8C0::
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5A90B
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_5A8EA
    jr   nz, label_5A935
    ld   [hl], e
    jr   nz, label_5A936
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5A8F7
    jr   nz, label_5A8F9

label_5A8D9::
    jr   nz, label_5A8FB
    jr   nz, label_5A94F
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, h
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   l, $FF
    ld   c, b
    ld   l, a
    ld   l, a
    ld   [hl], h

label_5A8EA::
    ld   hl, label_2020
    ld   c, c
    ld   [hl], h

label_5A8EF::
    jr   nz, label_5A959

label_5A8F1::
    ld   h, c
    ld   [hl], e
    jr   nz, label_5A915

label_5A8F5::
    jr   nz, label_5A959

label_5A8F7::
    ld   h, l

label_5A8F8::
    ld   h, l

label_5A8F9::
    ld   l, [hl]
    jr   nz, label_5A96F
    ld   l, a
    ld   l, l
    ld   h, l

label_5A8FF::
    jr   nz, label_5A975

label_5A901::
    ld   l, c
    ld   l, l
    ld   h, l
    jr   nz, label_5A926
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   h, e
    ld   h, l

label_5A90B::
    jr   nz, label_5A97C
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5A981
    ld   h, c
    ld   [hl], h
    ld   l, b
    ld   [hl], e

label_5A915::
    jr   nz, label_5A97A

label_5A917::
    ld   [hl], d
    ld   l, a
    ld   [hl], e
    ld   [hl], e

label_5A91B::
    ld   h, l
    ld   h, h
    inc  l
    jr   nz, label_5A98C
    ld   h, c
    ld   h, h
    ld   l, $20
    jr   nz, label_5A946

label_5A926::
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_5A998
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_5A994
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5A955

label_5A935::
    jr   nz, label_5A9A0
    ld   l, [hl]
    ld   [hl], h
    ld   l, a
    jr   nz, label_5A9B0
    ld   l, b
    ld   h, l
    jr   nz, label_5A9B7
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    jr   nz, label_5A9B6
    ld   h, [hl]
    jr   nz, label_5A997
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   l, b
    ld   h, c

label_5A94F::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_5A995
    ld   h, c
    ld   a, c

label_5A955::
    jr   nz, label_5A9CB
    ld   l, a
    jr   nz, label_5A9BF
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_5A9D4
    ld   l, b
    ld   h, l
    jr   nz, label_5A984
    jr   nz, label_5A986
    ld   b, e
    ld   h, c
    ld   [hl], h
    ld   h, [hl]
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   e, [hl]
    ld   [hl], e

label_5A96F::
    jr   nz, label_5A9BE
    ld   h, c
    ld   [hl], a
    ld   l, $2E

label_5A975::
    ld   l, $54
    ld   l, b
    ld   h, l
    jr   nz, label_5A9DE
    ld   l, h

label_5A97C::
    ld   l, a
    ld   [hl], e
    ld   h, l
    ld   [hl], d
    jr   nz, label_5A9FB
    ld   l, a
    ld   [hl], l

label_5A984::
    jr   nz, label_5A9A6

label_5A986::
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_5A9FF
    ld   l, a

label_5A98C::
    jr   nz, label_5AA02
    ld   l, b
    ld   h, l
    jr   nz, label_5A9E9
    ld   l, c
    ld   l, [hl]

label_5A994::
    ld   h, h

label_5A995::
    jr   nz, label_5A9DD

label_5A997::
    ld   l, c

label_5A998::
    ld   [hl], e
    ld   l, b
    inc  l
    jr   nz, label_5AA11
    ld   l, b
    ld   h, l
    jr   nz, label_5AA0E
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_5A9C6

label_5A9A6::
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, h
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    jr   nz, label_5AA18

label_5A9B0::
    ld   h, l
    jr   nz, label_5A9D3
    jr   nz, label_5A9D5
    jr   nz, label_5AA2A

label_5A9B7::
    ld   l, h
    ld   h, l
    ld   h, l
    ld   [hl], b
    ld   [hl], e
    ld   l, $20

label_5A9BE::
    jr   nz, label_5AA03
    ld   h, c
    ld   [hl], d
    ld   [hl], d
    ld   a, c
    jr   nz, label_5A9E6

label_5A9C6::
    ld   l, a
    ld   l, [hl]
    ld   [hl], a
    ld   h, c
    ld   [hl], d

label_5A9CB::
    ld   h, h
    ld   hl, label_2020
    ld   c, b
    ld   l, a
    ld   l, a
    ld   [hl], h

label_5A9D3::
    ld   hl, label_588FF
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    ld   d, h

label_5A9DD::
    ld   l, b

label_5A9DE::
    ld   h, c
    ld   [hl], h
    jr   nz, label_5AA49
    ld   l, c
    ld   [hl], d
    ld   l, h
    ld   [hl], e

label_5A9E6::
    ld   h, c
    ld   l, [hl]
    ld   h, a

label_5A9E9::
    jr   nz, label_5AA53
    ld   h, l
    ld   [hl], d
    jr   nz, label_5AA62
    ld   l, a
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5AA5D
    ld   l, [hl]
    ld   h, [hl]
    ld   [hl], d
    ld   l, a
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5AA6B
    ld   h, [hl]
    jr   nz, label_5AA73

label_5A9FF::
    ld   l, b
    ld   h, l
    jr   nz, label_5AA23

label_5AA03::
    jr   nz, label_5AA25
    ld   b, l
    ld   h, a
    ld   h, a
    ld   hl, label_58820
    ld   h, l
    ld   [hl], d
    jr   nz, label_5AA6D
    ld   b, d
    ld   h, c

label_5AA11::
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, h
    ld   l, a
    ld   h, [hl]
    jr   nz, label_5AA8D
    ld   l, b
    ld   h, l
    jr   nz, label_5AA74
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5AA42
    jr   nz, label_5AA44
    jr   nz, label_5AA6C
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   e, [hl]

label_5AA2A::
    jr   nz, label_5AA95
    ld   [hl], e
    jr   nz, label_5AA90
    jr   nz, label_5AAA4
    ld   l, a
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5AAA5
    ld   h, [hl]
    jr   nz, label_5AA9A
    ld   [hl], a
    ld   h, c
    ld   l, e
    ld   h, l
    ld   l, [hl]
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   hl, label_2020

label_5AA44::
    jr   nz, label_5AA8A
    ld   l, c
    ld   h, h
    jr   nz, label_5AABD
    ld   l, b
    ld   h, l
    jr   nz, label_5AAAF
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   h, c
    ld   l, h

label_5AA53::
    ld   l, h
    ld   a, c
    ld   l, c
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5AAD1

label_5AA5D::
    ld   l, a
    jr   nz, label_5AAD7
    ld   h, c
    ld   l, e

label_5AA62::
    ld   h, l
    jr   nz, label_5AA85
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5AAC1
    ld   l, c

label_5AA6B::
    ld   l, [hl]

label_5AA6C::
    ld   h, h

label_5AA6D::
    jr   nz, label_5AAB5
    ld   l, c
    ld   [hl], e
    ld   l, b
    ccf

label_5AA73::
    ld   hl, label_59420
    ld   l, b
    ld   h, l
    jr   nz, label_5AAE8
    ld   h, l
    ld   a, b
    ld   [hl], h
    jr   nz, label_5AAD2
    ld   l, c
    ld   [hl], d
    ld   h, l
    ld   l, [hl]
    ld   [hl], e
    ld   e, [hl]

label_5AA85::
    ld   c, c
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   [hl], d

label_5AA8A::
    ld   [hl], l
    ld   l, l
    ld   h, l

label_5AA8D::
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5AAFA
    ld   [hl], e
    jr   nz, label_5AAFD
    ld   l, [hl]

label_5AA95::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5AB11

label_5AA9A::
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, $20
    jr   nz, label_5AAF1
    ld   l, h
    ld   h, c
    ld   a, c

label_5AAA4::
    jr   nz, label_5AB1F
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5AB18
    ld   h, l
    ld   l, h
    ld   l, a
    ld   h, h

label_5AAAF::
    ld   l, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_5AB27
    ld   l, a

label_5AAB5::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5AB2F
    ld   l, [hl]
    ld   l, h
    ld   l, c

label_5AABD::
    db   $76 ; Halt
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_5AAC1::
    jr   nz, label_5AAE3
    jr   nz, label_5AAE5
    ld   [hl], e
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   [hl], e
    jr   nz, label_5AB3A
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h

label_5AAD1::
    jr   nz, label_5AAF3
    jr   nz, label_5AAF5
    ld   l, b
    ld   h, l

label_5AAD7::
    ld   h, c
    ld   [hl], d
    ld   hl, label_2020
    ld   d, e
    ld   l, b
    ld   l, a
    ld   [hl], a
    jr   nz, label_5AB5B
    ld   l, a

label_5AAE3::
    ld   [hl], l
    ld   [hl], d

label_5AAE5::
    ld   h, e
    ld   l, a
    ld   [hl], l

label_5AAE8::
    ld   [hl], d
    ld   h, c
    ld   h, a
    ld   h, l
    ld   hl, label_2020
    ld   d, h
    ld   l, b

label_5AAF1::
    ld   h, l
    jr   nz, label_5AB14
    jr   nz, label_5AB4D
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5AB41
    ld   l, c
    ld   [hl], e

label_5AAFD::
    ld   l, b
    jr   nz, label_5AB77
    ld   h, c
    ld   l, c
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_5AB6C
    ld   l, a
    ld   [hl], d
    jr   nz, label_5AB83
    ld   l, a
    ld   [hl], l
    ld   hl, label_2020
    ld   c, b
    ld   l, a

label_5AB11::
    ld   l, a
    ld   [hl], h
    ld   hl, label_594FF
    ld   l, b
    ld   h, l

label_5AB18::
    jr   nz, label_5AB8E
    ld   l, c
    ld   l, l
    ld   h, l
    jr   nz, label_5AB87

label_5AB1F::
    ld   h, c
    ld   [hl], e
    jr   nz, label_5AB43
    jr   nz, label_5AB45
    ld   h, e
    ld   l, a

label_5AB27::
    ld   l, l
    ld   h, l
    ld   l, $2E
    ld   l, $20
    ld   d, h
    ld   l, b

label_5AB2F::
    ld   h, l
    jr   nz, label_5AB89
    ld   l, c
    ld   l, [hl]
    ld   h, h
    ld   b, [hl]
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_5AB9C
    ld   [hl], a
    ld   h, c
    ld   l, c
    ld   [hl], h
    ld   [hl], e
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5AB8B
    ld   l, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_5ABC0
    ld   l, b

label_5AB4D::
    ld   h, l
    jr   nz, label_5AB95
    ld   h, a
    ld   h, a
    ld   l, $2E
    ld   l, $48
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_58820
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_588FF
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_59920
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, a

label_5AB6C::
    jr   nz, label_5ABDA
    ld   h, c
    ld   h, h
    inc  l
    ld   c, c
    jr   nz, label_5ABE1
    ld   h, l
    ld   h, c
    ld   l, [hl]

label_5AB77::
    ld   l, $2E
    ld   l, $20
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    ld   [hl], h
    ld   l, b

label_5AB83::
    ld   h, l
    jr   nz, label_5ABEE
    ld   h, l

label_5AB87::
    ld   [hl], d
    ld   l, a

label_5AB89::
    ld   hl, label_2020
    ld   e, c
    ld   l, a

label_5AB8E::
    ld   [hl], l
    jr   nz, label_5ABB1
    ld   l, b
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_5AB95::
    jr   nz, label_5ABFB
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   h, c
    ld   [hl], h

label_5AB9C::
    ld   h, l
    ld   h, h
    jr   nz, label_5ABC0
    jr   nz, label_5AC16
    ld   l, b
    ld   h, l
    jr   nz, label_5ABF4
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, l
    ld   h, c
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   hl, label_59920
    ld   l, a
    ld   [hl], l
    jr   nz, label_5AC1E
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5AC2B
    ld   [hl], d
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]

label_5ABC0::
    jr   nz, label_5AC3B
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5AC3E
    ld   l, c
    ld   [hl], e
    ld   h, h
    ld   l, a
    ld   l, l
    inc  l
    jr   nz, label_5ABEF
    jr   nz, label_5ABF1
    ld   h, e
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_5AC3B

label_5ABDA::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5ABFE
    jr   nz, label_5AC00
    jr   nz, label_5AC52
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   hl, label_2020
    jr   nz, label_5AC0B
    jr   nz, label_5AC0D
    jr   nz, label_5AC0F

label_5ABEF::
    jr   nz, label_5AC11

label_5ABF1::
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E

label_5ABFB::
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   b, c
    ld   [hl], e
    jr   nz, label_5AC75
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    jr   nz, label_5AC79
    ld   h, [hl]

label_5AC0B::
    jr   nz, label_5AC81

label_5AC0D::
    ld   l, b
    ld   h, l

label_5AC0F::
    jr   nz, label_5AC31

label_5AC11::
    ld   d, a
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5AC5D
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_5AC3E

label_5AC1E::
    jr   nz, label_5AC40
    jr   nz, label_5AC95
    ld   [hl], b
    ld   l, c
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    inc  l
    jr   nz, label_5AC73
    jr   nz, label_5AC8D
    ld   l, l
    jr   nz, label_5ACA3
    ld   l, b
    ld   h, l

label_5AC31::
    ld   h, a
    ld   [hl], l
    ld   h, c
    ld   [hl], d
    ld   h, h
    ld   l, c
    ld   h, c
    ld   l, [hl]
    jr   nz, label_5ACAA

label_5AC3B::
    ld   h, [hl]
    jr   nz, label_5ACA6

label_5AC3E::
    ld   l, c
    ld   [hl], e

label_5AC40::
    jr   nz, label_5ACA6
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, l
    jr   nz, label_5ACBF
    ld   l, a
    ld   [hl], d
    ld   l, h
    ld   h, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5AC94

label_5AC52::
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5ACC5
    ld   l, [hl]
    ld   h, l
    jr   nz, label_5ACBE
    ld   h, c
    ld   a, c
    inc  l

label_5AC5D::
    jr   nz, label_5ACD3
    ld   l, b
    ld   h, l
    ld   c, [hl]
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, l
    ld   h, c
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    jr   nz, label_5AC8D
    jr   nz, label_5AC8F
    jr   nz, label_5AC91
    ld   h, l
    ld   l, [hl]

label_5AC73::
    ld   [hl], h
    ld   h, l

label_5AC75::
    ld   [hl], d
    ld   h, l
    ld   h, h
    jr   nz, label_5ACEE
    ld   l, b
    ld   h, l
    jr   nz, label_5AC9E
    jr   nz, label_5ACA0
    jr   nz, label_5ACE6
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, l
    jr   nz, label_5ACE9
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5ACEE
    ld   h, l

label_5AC8D::
    ld   h, a
    ld   h, c

label_5AC8F::
    ld   l, [hl]
    jr   nz, label_5AD09
    ld   [hl], d
    ld   h, l

label_5AC94::
    ld   h, c

label_5AC95::
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5AD03
    ld   h, c
    db   $76 ; Halt
    ld   l, a

label_5AC9E::
    ld   h, e
    ld   l, $20
    ld   d, h
    ld   l, b

label_5ACA3::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5AD20
    ld   l, a
    ld   [hl], l
    inc  l

label_5ACAA::
    jr   nz, label_5ACCF
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    ld   h, e
    ld   h, c
    ld   l, l
    ld   h, l
    jr   nz, label_5AD2B
    ld   l, a
    jr   nz, label_5AD2C
    ld   h, l
    ld   [hl], e
    ld   h, e
    ld   [hl], l

label_5ACBE::
    ld   h, l

label_5ACBF::
    jr   nz, label_5ACE1
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5AD2F
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   l, $2E
    ld   l, $20

label_5ACCF::
    jr   nz, label_5ACF1
    ld   c, c
    jr   nz, label_5AD3C
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5AD3A
    ld   l, h
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   [hl], e
    jr   nz, label_5AD00
    jr   nz, label_5AD56
    ld   [hl], d
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_5ACE6::
    ld   h, l
    ld   h, h
    jr   nz, label_5AD53
    ld   l, [hl]
    jr   nz, label_5AD66
    ld   l, a

label_5ACEE::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5AD55
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_5AD6E
    ld   l, a
    jr   nz, label_5AD71
    ld   [hl], l
    ld   [hl], d
    ld   l, [hl]

label_5AD00::
    jr   nz, label_5AD64
    ld   h, c

label_5AD03::
    ld   h, e
    ld   l, e
    jr   nz, label_5AD7B
    ld   l, b
    ld   h, l

label_5AD09::
    jr   nz, label_5AD59
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    dec  l
    jr   nz, label_5AD7F
    ld   h, c
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   l, $20
    jr   nz, label_5AD6E
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_5AD40

label_5AD20::
    jr   nz, label_5AD9B
    ld   l, a
    ld   [hl], l
    inc  l
    jr   nz, label_5AD4A
    inc  hl
    inc  hl
    inc  hl
    inc  hl

label_5AD2B::
    ld   l, $2E
    ld   l, $20

label_5AD2F::
    ld   c, l
    ld   a, c
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   l, e
    jr   nz, label_5ADA0
    ld   [hl], e
    jr   nz, label_5AD9E

label_5AD3A::
    ld   l, a
    ld   l, [hl]

label_5AD3C::
    ld   h, l
    ld   l, $2E
    ld   l, $20
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_5AD9D
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5AD91
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_5AD70
    jr   nz, label_5ADC9
    ld   l, c

label_5AD53::
    ld   l, h
    ld   l, h

label_5AD55::
    jr   nz, label_5ADCE
    ld   h, c
    ld   l, e

label_5AD59::
    ld   h, l
    jr   nz, label_5ADCF
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   l, $20
    ld   b, a
    ld   l, a
    ld   l, a

label_5AD64::
    ld   h, h
    jr   nz, label_5ADC9
    ld   a, c
    ld   h, l
    ld   l, $2E
    ld   l, $48
    ld   l, a

label_5AD6E::
    ld   l, a
    ld   [hl], h

label_5AD70::
    ld   hl, label_2EFF
    ld   l, $2E
    jr   nz, label_5ADA5
    ld   l, $2E
    jr   nz, label_5ADA9

label_5AD7B::
    ld   l, $2E
    jr   nz, label_5ADAD

label_5AD7F::
    ld   l, $2E
    jr   nz, label_5ADA3
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E

label_5AD91::
    ld   l, $20
    ld   c, c
    jr   nz, label_5ADD7
    ld   c, l
    jr   nz, label_5ADED
    ld   c, b
    ld   b, l

label_5AD9B::
    jr   nz, label_5ADF4

label_5AD9D::
    ld   c, c

label_5AD9E::
    ld   c, [hl]
    ld   b, h

label_5ADA0::
    jr   nz, label_5ADC2
    jr   nz, label_5ADC4
    jr   nz, label_5ADC6
    jr   nz, label_5ADC8
    ld   b, [hl]

label_5ADA9::
    ld   c, c
    ld   d, e
    ld   c, b
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5ADD2
    jr   nz, label_5AE00
    ld   c, a
    ld   c, [hl]
    ld   b, a
    jr   nz, label_5AE01
    ld   b, c
    ld   d, e
    jr   nz, label_5ADFF
    ld   b, l
    ld   b, l
    ld   c, [hl]
    jr   nz, label_5ADE2

label_5ADC2::
    jr   nz, label_5ADE4

label_5ADC4::
    ld   c, l
    ld   e, c

label_5ADC6::
    jr   nz, label_5AE1B

label_5ADC8::
    ld   c, h

label_5ADC9::
    ld   d, l
    ld   c, l
    ld   b, d
    ld   b, l
    ld   d, d

label_5ADCE::
    ld   l, $2E
    ld   l, $20

label_5ADD2::
    jr   nz, label_5AE1D
    ld   c, [hl]
    jr   nz, label_5AE24

label_5ADD7::
    ld   e, c
    jr   nz, label_5AE1E
    ld   d, d
    ld   b, l
    ld   b, c
    ld   c, l
    ld   d, e
    ld   l, $2E
    ld   l, $20
    ld   b, c

label_5ADE4::
    ld   c, [hl]
    jr   nz, label_5AE2C
    ld   b, a
    ld   b, a
    jr   nz, label_5AE2C
    ld   d, b
    ld   d, b

label_5ADED::
    ld   b, l
    ld   b, c
    ld   d, d
    ld   b, l
    ld   b, h
    jr   nz, label_5AE14

label_5ADF4::
    jr   nz, label_5AE16
    jr   nz, label_5AE39
    ld   c, [hl]
    ld   b, h
    jr   nz, label_5AE53
    ld   b, c
    ld   d, e
    jr   nz, label_5AE20

label_5AE00::
    jr   nz, label_5AE22
    ld   d, e
    ld   d, l
    ld   d, d
    ld   d, d
    ld   c, a
    ld   d, l
    ld   c, [hl]
    ld   b, h
    ld   b, l
    ld   b, h
    jr   nz, label_5AE50
    ld   e, c
    jr   nz, label_5AE52
    ld   c, [hl]
    jr   nz, label_5AE34

label_5AE14::
    ld   c, c
    ld   d, e

label_5AE16::
    ld   c, h
    ld   b, c
    ld   c, [hl]
    ld   b, h
    inc  l

label_5AE1B::
    jr   nz, label_5AE74

label_5AE1D::
    ld   c, c

label_5AE1E::
    ld   d, h
    ld   c, b

label_5AE20::
    jr   nz, label_5AE42

label_5AE22::
    ld   d, b
    ld   b, l

label_5AE24::
    ld   c, a
    ld   d, b
    ld   c, h
    ld   b, l
    inc  l
    jr   nz, label_5AE6C
    ld   c, [hl]

label_5AE2C::
    ld   c, c
    ld   c, l
    ld   b, c
    ld   c, h
    ld   d, e
    inc  l
    ld   b, c
    ld   c, [hl]

label_5AE34::
    jr   nz, label_5AE7B
    ld   c, [hl]
    ld   d, h
    ld   c, c

label_5AE39::
    ld   d, d
    ld   b, l
    jr   nz, label_5AE94
    ld   c, a
    ld   d, d
    ld   c, h
    ld   b, h
    ld   hl, label_2E2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E

label_5AE50::
    ld   l, $20

label_5AE52::
    jr   nz, label_5AE74
    ld   b, d
    ld   d, l
    ld   d, h
    inc  l
    jr   nz, label_5AEB0
    ld   b, l
    ld   d, d
    ld   c, c
    ld   c, h
    ld   e, c
    inc  l
    jr   nz, label_5AE82
    ld   c, c
    ld   d, h
    jr   nz, label_5AEA8
    ld   b, l
    jr   nz, label_5AEBD
    ld   c, b
    ld   b, l
    jr   nz, label_5AEBB
    ld   b, c
    ld   d, h
    ld   d, l
    ld   d, d
    ld   b, l
    jr   nz, label_5AE94

label_5AE74::
    ld   c, a
    ld   b, [hl]
    jr   nz, label_5AEBC
    ld   d, d
    ld   b, l
    ld   b, c

label_5AE7B::
    ld   c, l
    ld   d, e
    jr   nz, label_5AED3
    ld   c, a
    jr   nz, label_5AEA2

label_5AE82::
    ld   b, l
    ld   c, [hl]
    ld   b, h
    ld   hl, label_59720
    ld   c, b
    ld   b, l
    ld   c, [hl]
    jr   nz, label_5AED6
    jr   nz, label_5AED3
    ld   c, a
    ld   d, e
    ld   d, h
    ld   b, c
    ld   d, a

label_5AE94::
    ld   b, c
    ld   c, e
    ld   b, l
    ld   c, [hl]
    inc  l
    jr   nz, label_5AEE6
    ld   c, a
    ld   c, b
    ld   c, a
    ld   c, h
    ld   c, c
    ld   c, [hl]
    ld   d, h

label_5AEA2::
    jr   nz, label_5AEFB
    ld   c, c
    ld   c, h
    ld   c, h
    jr   nz, label_5AEEB
    ld   b, l
    jr   nz, label_5AEF3
    ld   c, a
    ld   c, [hl]
    ld   b, l
    ld   l, $2E
    ld   l, $4F
    ld   c, [hl]
    ld   c, h
    ld   e, c
    jr   nz, label_5AF0C
    ld   c, b
    ld   b, l
    jr   nz, label_5AF09

label_5AEBC::
    ld   b, l

label_5AEBD::
    ld   c, l
    ld   c, a
    ld   d, d
    ld   e, c
    jr   nz, label_5AEE3
    ld   c, a
    ld   b, [hl]
    jr   nz, label_5AF1B
    ld   c, b
    ld   c, c
    ld   d, e
    jr   nz, label_5AF10
    ld   d, d
    ld   b, l
    ld   b, c
    ld   c, l
    jr   nz, label_5AEF2
    ld   c, h

label_5AED3::
    ld   b, c
    ld   c, [hl]
    ld   b, h

label_5AED6::
    jr   nz, label_5AF2F
    ld   c, c
    ld   c, h
    ld   c, h
    jr   nz, label_5AF22
    ld   e, b
    ld   c, c
    ld   d, e
    ld   d, h
    jr   nz, label_5AF03

label_5AEE3::
    jr   nz, label_5AF2E
    ld   c, [hl]

label_5AEE6::
    jr   nz, label_5AF3C
    ld   c, b
    ld   b, l
    jr   nz, label_5AF43
    ld   b, c
    ld   c, e
    ld   c, c
    ld   c, [hl]
    ld   b, a
    jr   nz, label_5AF13

label_5AEF3::
    jr   nz, label_5AF15
    jr   nz, label_5AF17
    jr   nz, label_5AF50
    ld   c, a
    ld   d, d

label_5AEFB::
    ld   c, h
    ld   b, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5AF23

label_5AF03::
    ld   d, e
    ld   c, a
    ld   c, l
    ld   b, l
    ld   b, h
    ld   b, c

label_5AF09::
    ld   e, c
    inc  l
    jr   nz, label_5AF61
    ld   c, b
    ld   c, a
    ld   d, l

label_5AF10::
    jr   nz, label_5AF32
    ld   c, l

label_5AF13::
    ld   b, c
    ld   e, c

label_5AF15::
    jr   nz, label_5AF69

label_5AF17::
    ld   b, l
    ld   b, e
    ld   b, c
    ld   c, h

label_5AF1B::
    ld   c, h
    jr   nz, label_5AF72
    ld   c, b
    ld   c, c
    ld   d, e
    jr   nz, label_5AF43

label_5AF23::
    ld   c, c
    ld   d, e
    ld   c, h
    ld   b, c
    ld   c, [hl]
    ld   b, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5AF83

label_5AF2F::
    ld   c, b
    ld   b, c
    ld   d, h

label_5AF32::
    jr   nz, label_5AF81
    ld   b, l
    ld   c, l
    ld   c, a
    ld   d, d
    ld   e, c
    jr   nz, label_5AF88
    ld   d, l

label_5AF3C::
    ld   d, e
    ld   d, h
    jr   nz, label_5AF82
    ld   b, l
    jr   nz, label_5AF63

label_5AF43::
    ld   d, h
    ld   c, b
    ld   b, l
    jr   nz, label_5AF9A

label_5AF48::
    ld   b, l
    ld   b, c
    ld   c, h
    jr   nz, label_5AF91
    ld   d, d

label_5AF4E::
    ld   b, l
    ld   b, c

label_5AF50::
    ld   c, l
    jr   nz, label_5AF73
    jr   nz, label_5AF75
    jr   nz, label_5AF77
    ld   d, a
    ld   c, a

label_5AF59::
    ld   d, d
    ld   c, h
    ld   b, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5AF82
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20

label_5AF72::
    jr   nz, label_5AFB7
    ld   c, a

label_5AF75::
    ld   c, l
    ld   b, l

label_5AF77::
    inc  l
    jr   nz, label_5AF9D
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   l, $2E
    ld   l, $20

label_5AF82::
    ld   c, h

label_5AF83::
    ld   b, l
    ld   d, h
    jr   nz, label_5AFDC
    ld   d, e

label_5AF88::
    jr   nz, label_5AFCB
    ld   d, a
    ld   b, c
    ld   c, e
    ld   b, l
    ld   c, [hl]
    ld   l, $2E

label_5AF91::
    ld   l, $20
    jr   nz, label_5AFB5
    ld   d, h
    ld   c, a
    ld   b, a
    ld   b, l
    ld   d, h

label_5AF9A::
    ld   c, b
    ld   b, l
    ld   d, d

label_5AF9D::
    ld   hl, rNR42
    jr   nz, label_5AFF2
    ld   c, h
    ld   b, c
    ld   e, c
    jr   nz, label_5AFFB
    ld   c, b
    ld   b, l
    jr   nz, label_5AFF0
    ld   c, c
    ld   b, a
    ld   c, b
    ld   d, h
    jr   nz, label_5AFD1
    jr   nz, label_5AFFC
    ld   c, [hl]
    ld   d, e

label_5AFB5::
    ld   d, h
    ld   d, d

label_5AFB7::
    ld   d, l
    ld   c, l
    ld   b, l
    ld   c, [hl]
    ld   d, h
    ld   d, e
    ld   hl, label_2020
    ld   d, b
    ld   c, h
    ld   b, c
    ld   e, c
    jr   nz, label_5B01A
    ld   c, b
    ld   b, l
    jr   nz, label_5B01D
    ld   c, a

label_5AFCB::
    ld   c, [hl]
    ld   b, a
    jr   nz, label_5B01E
    ld   b, [hl]
    jr   nz, label_5AFF2
    jr   nz, label_5B015
    ld   d, a
    ld   b, c
    ld   c, e
    ld   b, l
    ld   c, [hl]
    ld   c, c
    ld   c, [hl]
    ld   b, a

label_5AFDC::
    ld   hl, rNR42
    ld   c, l
    ld   h, l
    ld   [hl], d
    ld   l, l
    ld   h, c
    ld   l, c
    ld   h, h
    jr   nz, label_5B03B
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   [hl], l
    ld   h, l
    jr   nz, label_5B00F
    rst  $38

label_5AFF0::
    ld   l, $2E

label_5AFF2::
    ld   l, $23
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_5B074

label_5AFFB::
    ld   l, a

label_5AFFC::
    ld   [hl], l
    jr   nz, label_5B01F
    jr   nz, label_5B069
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5B068
    ld   h, l
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5B06E
    ld   l, h
    ld   l, h

label_5B00F::
    jr   nz, label_5B085
    ld   l, b
    ld   h, l
    jr   nz, label_5B063

label_5B015::
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, l

label_5B01A::
    ld   h, c
    ld   [hl], d
    ld   h, l

label_5B01D::
    ld   [hl], e

label_5B01E::
    ld   hl, label_58320
    ld   l, h
    ld   l, c
    ld   l, l
    ld   h, d
    jr   nz, label_5B09B
    ld   l, b
    ld   h, l
    jr   nz, label_5B09E
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   [hl], d
    ld   [hl], e
    ld   h, d
    ld   h, l
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B0B1
    ld   l, a
    ld   [hl], l
    ld   hl, label_581FF
    ld   h, e
    ld   l, b
    ld   hl, label_59620
    ld   h, c
    ld   [hl], h
    jr   nz, label_5B0A7
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B0C3
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   l, a
    ld   l, a
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5B0B6
    ld   [hl], h
    jr   nz, label_5B0CE
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_5B0D7
    ld   h, c
    ld   [hl], h
    jr   nz, label_5B0CE
    ld   h, c
    ld   h, a

label_5B063::
    ld   l, [hl]
    ld   l, c
    ld   h, [hl]
    ld   a, c
    ld   l, c

label_5B068::
    ld   l, [hl]

label_5B069::
    ld   h, a
    jr   nz, label_5B08C
    ld   l, h
    ld   h, l

label_5B06E::
    ld   l, [hl]
    ld   [hl], e
    ccf
    jr   nz, label_5B093
    ld   d, e

label_5B074::
    ld   [hl], h
    ld   l, a
    ld   [hl], b
    jr   nz, label_5B0E2
    ld   [hl], h
    jr   nz, label_5B09C
    ld   h, c
    ld   [hl], h
    jr   nz, label_5B0F6
    ld   l, a
    ld   l, [hl]
    ld   h, e
    ld   h, l
    ld   hl, label_20FF
    jr   nz, label_5B0D1
    ld   l, a
    ld   l, a
    ld   [hl], h

label_5B08C::
    ld   hl, label_2020
    ld   c, b
    ld   l, a
    ld   l, a
    ld   [hl], h

label_5B093::
    ld   hl, label_2020
    ld   d, e
    ld   l, a
    jr   nz, label_5B113
    ld   l, a

label_5B09B::
    ld   [hl], l

label_5B09C::
    jr   nz, label_5B0FF

label_5B09E::
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B116
    ld   l, b
    ld   h, l
    jr   nz, label_5B0C6
    ld   l, h

label_5B0A7::
    ld   h, c
    ld   h, h
    jr   nz, label_5B122
    ld   l, b
    ld   l, a
    jr   nz, label_5B11E
    ld   [hl], a
    ld   l, [hl]

label_5B0B1::
    ld   [hl], e
    jr   nz, label_5B128
    ld   l, b
    ld   h, l

label_5B0B6::
    ld   [hl], e
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   h, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5B10F
    ld   l, a
    ld   [hl], a

label_5B0C3::
    jr   nz, label_5B10E
    jr   nz, label_5B13C
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    ld   [hl], h
    ld   h, c

label_5B0CE::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5B149
    ld   l, b
    ld   a, c
    jr   nz, label_5B0F6
    ld   [hl], h

label_5B0D7::
    ld   l, b
    ld   h, l
    jr   nz, label_5B148
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   [hl], e

label_5B0E2::
    jr   nz, label_5B145
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5B164
    ld   l, a
    jr   nz, label_5B154
    ld   h, e
    ld   [hl], h
    jr   nz, label_5B16A
    ld   l, a
    jr   nz, label_5B170
    ld   l, c
    ld   l, a
    ld   l, h
    ld   h, l
    ld   l, [hl]

label_5B0FF::
    ld   [hl], h
    ld   l, h
    ld   a, c
    ld   l, $2E
    ld   l, $20
    ld   b, c
    jr   nz, label_5B16C
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   h, c
    ld   h, a

label_5B10E::
    ld   h, l

label_5B10F::
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_5B180
    ld   h, c
    ld   h, h

label_5B116::
    ld   l, b
    ld   h, c
    ld   [hl], e
    jr   nz, label_5B17E
    ld   l, a
    ld   l, l
    ld   h, l

label_5B11E::
    jr   nz, label_5B194
    ld   l, a
    jr   nz, label_5B19A
    ld   h, c
    ld   l, e
    ld   h, l
    ld   [hl], h
    ld   l, b

label_5B128::
    ld   h, l
    jr   nz, label_5B182
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5B176
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   l, $2E
    ld   l, $49
    ld   [hl], h
    jr   nz, label_5B1A3
    ld   [hl], e
    jr   nz, label_5B1B0
    ld   h, c
    ld   l, c
    ld   h, h
    jr   nz, label_5B1B6
    ld   l, b
    ld   h, c
    ld   [hl], h

label_5B145::
    jr   nz, label_5B1C0
    ld   l, a

label_5B148::
    ld   [hl], l

label_5B149::
    jr   nz, label_5B1AE
    ld   h, c
    ld   l, [hl]
    ld   l, [hl]
    ld   l, a
    ld   [hl], h
    jr   nz, label_5B1BE
    ld   h, l
    ld   h, c

label_5B154::
    db   $76 ; Halt
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5B1C4
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5B182
    jr   nz, label_5B184

label_5B164::
    jr   nz, label_5B186
    ld   [hl], l
    ld   l, [hl]
    ld   l, h
    ld   h, l

label_5B16A::
    ld   [hl], e
    ld   [hl], e

label_5B16C::
    jr   nz, label_5B1E7
    ld   l, a
    ld   [hl], l

label_5B170::
    jr   nz, label_5B1E9
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_5B1EB
    ld   l, b
    ld   h, l
    jr   nz, label_5B1D2
    ld   l, c
    ld   l, [hl]
    ld   h, h

label_5B17E::
    jr   nz, label_5B1C6

label_5B180::
    ld   l, c
    ld   [hl], e

label_5B182::
    ld   l, b
    ld   l, $2E
    ld   l, $59
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B1FE
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_5B200
    ld   l, a
    ld   [hl], a

label_5B194::
    jr   nz, label_5B1B6
    ld   h, a
    ld   l, a
    jr   nz, label_5B208

label_5B19A::
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    ld   l, b
    inc  l
    jr   nz, label_5B215
    ld   l, a
    jr   nz, label_5B218
    ld   l, b
    ld   h, l
    ld   c, l
    ld   a, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   l, a

label_5B1AE::
    ld   [hl], l
    ld   [hl], e

label_5B1B0::
    jr   nz, label_5B1D2
    jr   nz, label_5B1D4
    jr   nz, label_5B1D6

label_5B1B6::
    ld   b, [hl]
    ld   l, a
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, $20

label_5B1BE::
    jr   nz, label_5B209

label_5B1C0::
    jr   nz, label_5B239
    ld   l, c
    ld   l, h

label_5B1C4::
    ld   l, h
    jr   nz, label_5B23E
    ld   h, c
    ld   l, c
    ld   [hl], h
    jr   nz, label_5B232
    ld   l, a
    ld   [hl], d
    jr   nz, label_5B249
    ld   l, a
    ld   [hl], l

label_5B1D2::
    jr   nz, label_5B1F4

label_5B1D4::
    jr   nz, label_5B1F6

label_5B1D6::
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_2020
    ld   c, b
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   hl, label_581FF
    ld   l, [hl]
    ld   l, [hl]

label_5B1E7::
    ld   l, a
    ld   a, c

label_5B1E9::
    ld   h, c
    ld   l, [hl]

label_5B1EB::
    ld   h, e
    ld   h, l
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B256
    ld   [hl], d

label_5B1F6::
    ld   h, l
    jr   nz, label_5B268
    ld   l, [hl]
    ld   l, h
    ld   a, c
    jr   nz, label_5B265

label_5B1FE::
    ld   h, l
    ld   [hl], h

label_5B200::
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, c
    ld   l, [hl]
    jr   nz, label_5B27C

label_5B208::
    ld   l, b

label_5B209::
    ld   h, l
    jr   nz, label_5B283
    ld   h, c
    ld   a, c
    ld   hl, label_592FF
    ld   l, c
    ld   h, d
    ld   h, d
    ld   l, c

label_5B215::
    ld   [hl], h
    ld   hl, label_2020
    ld   d, d
    ld   l, c
    ld   h, d
    ld   h, d
    ld   l, c
    ld   [hl], h
    ld   hl, label_5A548
    ld   a, c
    inc  l
    jr   nz, label_5B293
    ld   h, c
    ld   l, [hl]
    inc  l
    jr   nz, label_5B274
    ld   e, [hl]
    ld   l, l
    jr   nz, label_5B24F
    jr   nz, label_5B27E
    ld   h, c

label_5B232::
    ld   l, l
    ld   [hl], l
    inc  l
    jr   nz, label_5B2A6
    ld   l, [hl]
    jr   nz, label_5B2B0
    ld   l, a
    ld   h, e
    ld   h, c
    ld   l, h

label_5B23E::
    ld   [hl], e
    ld   hl, label_5B242

label_5B242::
    ld   l, a
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], d
    inc  l
    jr   nz, label_5B2C3
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B26E
    jr   nz, label_5B270
    ld   l, h
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_5B2C2

label_5B256::
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_5B2D4
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B27F
    jr   nz, label_5B2C5
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h

label_5B265::
    jr   nz, label_5B2D2
    ld   l, [hl]

label_5B268::
    ld   l, a
    ld   [hl], a
    jr   nz, label_5B28C
    jr   nz, label_5B28E

label_5B26E::
    jr   nz, label_5B290

label_5B270::
    ld   [hl], e
    ld   [hl], c
    ld   [hl], l
    ld   h, c

label_5B274::
    ld   [hl], h
    jr   nz, label_5B2D8
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5B29D
    jr   nz, label_5B29F

label_5B27F::
    jr   nz, label_5B2EE
    ld   [hl], l
    ld   [hl], e

label_5B283::
    ld   l, c
    ld   h, e
    ld   hl, label_2020
    ld   d, d
    ld   l, c
    ld   h, d
    ld   h, d

label_5B28C::
    ld   l, c
    ld   [hl], h

label_5B28E::
    ld   hl, label_592FF
    ld   l, c
    ld   h, d

label_5B293::
    ld   h, d
    ld   l, c
    ld   [hl], h
    ld   hl, label_2020
    ld   d, d
    ld   l, c
    ld   h, d
    ld   h, d

label_5B29D::
    ld   l, c
    ld   [hl], h

label_5B29F::
    ld   hl, label_59E49
    ld   l, l
    jr   nz, label_5B2F2
    ld   h, c

label_5B2A6::
    ld   l, l
    ld   [hl], l
    inc  l
    jr   nz, label_5B31A
    ld   l, [hl]
    jr   nz, label_5B2CE
    jr   nz, label_5B2D0

label_5B2B0::
    db   $76 ; Halt
    ld   l, a
    ld   h, e
    ld   h, c
    ld   l, h
    ld   [hl], e
    ld   hl, label_2020
    ld   b, d
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5B307
    jr   nz, label_5B2E0
    ld   h, h
    ld   l, a

label_5B2C2::
    ld   l, [hl]

label_5B2C3::
    ld   e, [hl]
    ld   [hl], h

label_5B2C5::
    jr   nz, label_5B335
    ld   h, l
    ld   h, l
    ld   h, h
    jr   nz, label_5B340
    ld   l, a
    jr   nz, label_5B2EF
    jr   nz, label_5B345
    ld   h, l

label_5B2D2::
    ld   l, h
    ld   l, h

label_5B2D4::
    jr   nz, label_5B34F
    ld   l, a
    ld   [hl], l

label_5B2D8::
    jr   nz, label_5B34E
    ld   l, b
    ld   h, c
    ld   [hl], h
    inc  l
    jr   nz, label_5B300

label_5B2E0::
    ld   h, h
    ld   l, a
    jr   nz, label_5B32D
    ccf
    jr   nz, label_5B307
    ld   b, l
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   a, c
    ld   h, d
    ld   l, a

label_5B2EE::
    ld   h, h

label_5B2EF::
    ld   a, c
    ld   l, e
    ld   l, [hl]

label_5B2F2::
    ld   l, a
    ld   [hl], a
    ld   [hl], e
    jr   nz, label_5B364
    ld   h, l
    ld   hl, label_2020
    ld   d, a
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5B375
    ld   l, a
    jr   nz, label_5B36C
    ld   h, c
    ld   l, [hl]
    ld   h, a

label_5B307::
    jr   nz, label_5B378
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5B36E
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5B37D
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5B38C
    ld   l, a
    jr   nz, label_5B390
    ld   [hl], e
    jr   nz, label_5B33E
    jr   nz, label_5B340
    ld   l, d
    ld   h, c
    ld   l, l
    ccf
    jr   nz, label_5B346
    ld   b, [hl]
    ld   l, a
    ld   [hl], d
    jr   nz, label_5B35E
    jr   nc, label_5B35D

label_5B32D::
    jr   nz, label_5B34F
    jr   nz, label_5B383
    ld   [hl], l
    ld   [hl], b
    ld   h, l
    ld   h, l

label_5B335::
    ld   [hl], e
    inc  l
    jr   nz, label_5B3B0
    ld   h, l
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_5B35F
    jr   nz, label_5B3AD
    ld   h, l
    ld   [hl], h
    jr   nz, label_5B3BE

label_5B345::
    ld   l, a

label_5B346::
    ld   [hl], l
    jr   nz, label_5B3B5
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   l, [hl]

label_5B34E::
    jr   nz, label_5B370
    ld   [hl], h
    ld   l, a
    jr   nz, label_5B3B5
    jr   nz, label_5B3C6
    ld   [hl], d
    ld   h, l
    db   $76 ; Halt
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e

label_5B35D::
    ld   l, h

label_5B35E::
    ld   a, c

label_5B35F::
    jr   nz, label_5B3D6
    ld   l, [hl]
    ld   [hl], d
    ld   h, l

label_5B364::
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l
    ld   h, h
    jr   nz, label_5B3CF

label_5B36C::
    ld   [hl], l
    ld   [hl], h

label_5B36E::
    ld   hl, label_59720
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_5B3DA
    ld   l, a
    jr   nz, label_5B3F2
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B3E1

label_5B37D::
    ld   l, a
    ccf
    jr   nz, label_5B3A1
    jr   nz, label_5B3A3

label_5B383::
    jr   nz, label_5B3D5
    ld   h, c
    ld   a, c
    jr   nz, label_5B3A9
    ld   c, h
    ld   h, l
    ld   h, c

label_5B38C::
    db   $76 ; Halt
    ld   h, l
    cp   $54

label_5B390::
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_5B40F
    ld   l, a
    ld   [hl], l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5B3BE
    jr   nz, label_5B3F4
    ld   l, b

label_5B3A1::
    ld   h, c
    ld   l, [hl]

label_5B3A3::
    ld   l, e
    jr   nz, label_5B41F
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B420
    ld   h, l
    ld   [hl], d
    ld   a, c

label_5B3AD::
    jr   nz, label_5B3CF
    ld   l, l

label_5B3B0::
    ld   [hl], l
    ld   h, e
    ld   l, b
    ld   l, $2E

label_5B3B5::
    ld   l, $20
    ld   b, e
    ld   [hl], d
    ld   l, a
    ld   h, c
    ld   l, e
    ld   hl, label_597FF
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_5B439
    ld   l, b

label_5B3C6::
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_5B42D
    jr   nz, label_5B3EE
    ld   [hl], e

label_5B3CF::
    ld   l, b
    ld   h, c
    ld   l, l
    ld   h, l
    inc  l
    jr   nz, label_5B438

label_5B3D6::
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5B451

label_5B3DA::
    ld   h, l
    jr   nz, label_5B3FD
    jr   nz, label_5B443
    ld   l, a
    ld   l, [hl]

label_5B3E1::
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_5B455
    ld   l, h
    ld   h, c
    ld   a, c
    jr   nz, label_5B450
    ld   l, a
    ld   [hl], d
    jr   nz, label_5B40E

label_5B3EE::
    ld   h, [hl]
    ld   [hl], d
    ld   h, l
    ld   h, l

label_5B3F2::
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5B468
    ld   h, l

label_5B3FD::
    ld   h, c
    ld   [hl], d
    ld   l, [hl]
    ld   h, l
    ld   h, h
    jr   nz, label_5B424
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_5B44F
    ld   [hl], d
    ld   l, a
    ld   h, a
    ld   e, [hl]
    ld   [hl], e

label_5B40E::
    jr   nz, label_5B463
    ld   l, a
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5B484
    ld   h, [hl]
    jr   nz, label_5B46B
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   hl, label_2020
    ld   c, c

label_5B41F::
    ld   [hl], h

label_5B420::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_5B485

label_5B424::
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   a, c
    jr   nz, label_5B497
    ld   l, a
    db   $76 ; Halt
    ld   l, c

label_5B42D::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5B451
    jr   nz, label_5B453
    jr   nz, label_5B4A9
    ld   [hl], l
    ld   l, [hl]
    ld   h, l

label_5B438::
    ld   l, $2E
    ld   l, $20
    ld   c, c
    ld   [hl], h
    jr   nz, label_5B4A3
    ld   h, c
    ld   l, [hl]
    jr   nz, label_5B464
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5B4B6
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5B4C5

label_5B450::
    ld   [hl], b

label_5B451::
    jr   nz, label_5B473

label_5B453::
    jr   nz, label_5B4CA

label_5B455::
    ld   l, [hl]
    ld   l, h
    ld   l, c
    db   $76 ; Halt
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5B4D2
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   [hl], e

label_5B463::
    ld   hl, label_589FF
    ld   h, [hl]
    jr   nz, label_5B4E2
    ld   l, a
    ld   [hl], l

label_5B46B::
    jr   nz, label_5B4DD
    ld   l, h
    ld   h, c
    ld   a, c
    jr   nz, label_5B4E6
    ld   l, b

label_5B473::
    ld   l, c
    ld   [hl], e
    ld   [hl], e
    ld   l, a
    ld   l, [hl]
    ld   h, a
    inc  l
    jr   nz, label_5B4F5
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_5B4A3
    jr   nz, label_5B4A5

label_5B485::
    ld   l, l
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_5B4F0
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   a, c
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5B4F7
    ld   [hl], d

label_5B497::
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5B516
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B507
    ld   h, l
    ld   h, l

label_5B4A3::
    ld   l, h
    jr   nz, label_5B513
    ld   l, a
    ld   [hl], d
    ld   h, l

label_5B4A9::
    jr   nz, label_5B50C
    ld   l, h
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    ld   hl, label_588FF
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_5B502
    ld   l, c
    ld   h, h
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B4E1
    ld   [hl], a
    ld   l, a
    ld   l, e
    ld   h, l

label_5B4C5::
    jr   nz, label_5B534
    ld   h, l
    jr   nz, label_5B53F

label_5B4CA::
    ld   [hl], b
    jr   nz, label_5B533
    ld   [hl], d
    ld   l, a
    ld   l, l
    jr   nz, label_5B533

label_5B4D2::
    jr   nz, label_5B53A
    ld   l, c
    ld   l, [hl]
    ld   h, l
    jr   nz, label_5B547
    ld   h, c
    ld   [hl], b
    ld   hl, label_2021
    jr   nz, label_5B500
    jr   nz, label_5B510

label_5B4E2::
    ld   l, $2E
    ld   d, h
    ld   l, b

label_5B4E6::
    ld   h, c
    ld   l, [hl]
    ld   l, e
    ld   [hl], e
    jr   nz, label_5B54D
    jr   nz, label_5B55A
    ld   l, a
    ld   [hl], h

label_5B4F0::
    ld   hl, label_5B542
    ld   [hl], h
    jr   nz, label_5B564
    ld   l, a

label_5B4F7::
    ld   [hl], a
    inc  l
    jr   nz, label_5B544
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_5B520

label_5B500::
    jr   nz, label_5B569

label_5B502::
    ld   h, l
    ld   [hl], h
    jr   nz, label_5B573
    ld   a, c

label_5B507::
    jr   nz, label_5B57B
    ld   h, l
    db   $76 ; Halt
    ld   h, l

label_5B50C::
    ld   l, [hl]
    ld   h, a
    ld   h, l
    ld   hl, label_58120
    ld   [hl], d

label_5B513::
    ld   h, l
    jr   nz, label_5B58F

label_5B516::
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B58C
    ld   h, l
    ld   h, c
    ld   h, h
    ld   a, c
    ccf
    ld   hl, label_2020
    jr   nz, label_5B544
    jr   nz, label_5B57F
    ld   h, l
    ld   [hl], e
    jr   nz, label_5B54A
    ld   c, [hl]
    dec  l
    ld   c, [hl]
    ld   l, a
    cp   $49
    ld   e, [hl]
    ld   l, h
    ld   l, h

label_5B533::
    jr   nz, label_5B5A1
    ld   h, l
    ld   [hl], h
    jr   nz, label_5B5B2
    ld   l, a

label_5B53A::
    ld   [hl], l
    jr   nz, label_5B55D
    jr   nz, label_5B55F

label_5B53F::
    ld   h, e
    ld   h, c
    ld   [hl], d

label_5B542::
    ld   [hl], d
    ld   a, c

label_5B544::
    jr   nz, label_5B5B3
    ld   l, a

label_5B547::
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B598
    ld   h, c
    ld   h, a

label_5B54D::
    ld   l, c
    ld   h, e
    ld   d, b
    ld   l, a
    ld   [hl], a
    ld   h, h
    ld   h, l
    ld   [hl], d
    ld   hl, label_2020
    ld   c, b
    ld   h, l

label_5B55A::
    jr   nz, label_5B5A4
    ld   h, l

label_5B55D::
    ld   hl, label_58120
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B5DD

label_5B564::
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B5DA
    ld   h, l

label_5B569::
    ld   h, c
    ld   h, h
    ld   a, c
    ccf
    ld   hl, label_2020
    jr   nz, label_5B592
    jr   nz, label_5B5CD
    ld   h, l
    ld   [hl], e
    jr   nz, label_5B598
    ld   c, [hl]
    dec  l
    ld   c, [hl]

label_5B57B::
    ld   l, a
    cp   $4F
    ld   l, e

label_5B57F::
    ld   h, c
    ld   a, c
    inc  l
    jr   nz, label_5B5CD
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_5B5F5
    ld   h, l
    ld   [hl], h
    jr   nz, label_5B5AD
    ld   a, c
    ld   l, a

label_5B58F::
    ld   [hl], l
    jr   nz, label_5B5F5

label_5B592::
    ld   h, c
    ld   [hl], d
    ld   [hl], d
    ld   a, c
    jr   nz, label_5B605

label_5B598::
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B5BD
    ld   b, d
    ld   l, a
    ld   l, l
    ld   h, d

label_5B5A1::
    ld   [hl], e
    ld   hl, label_58820
    ld   h, l
    jr   nz, label_5B5F0
    ld   h, l
    jr   nz, label_5B5F3
    ld   h, l
    ld   hl, label_5B241
    ld   h, l
    jr   nz, label_5B62B

label_5B5B2::
    ld   l, a

label_5B5B3::
    ld   [hl], l
    jr   nz, label_5B628
    ld   h, l
    ld   h, c
    ld   h, h
    ld   a, c
    ccf
    ld   hl, label_2020
    jr   nz, label_5B5E0
    jr   nz, label_5B61B
    ld   h, l
    ld   [hl], e
    jr   nz, label_5B5E6
    ld   c, [hl]
    dec  l
    ld   c, [hl]
    ld   l, a
    cp   $46
    ld   l, c

label_5B5CD::
    ld   l, [hl]
    ld   h, l
    inc  l
    jr   nz, label_5B61B
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_5B643
    ld   h, l
    ld   [hl], h
    jr   nz, label_5B5FB
    ld   a, c
    ld   l, a

label_5B5DD::
    ld   [hl], l
    jr   nz, label_5B648

label_5B5E0::
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5B652
    ld   l, a

label_5B5E6::
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B60A
    jr   nz, label_5B64D
    ld   [hl], d
    ld   [hl], d
    ld   l, a
    ld   [hl], a

label_5B5F0::
    ld   [hl], e
    ld   hl, label_58820
    ld   h, l

label_5B5F5::
    ld   l, b
    jr   nz, label_5B640
    ld   h, l
    ld   l, b
    ld   hl, label_5B241
    ld   h, l
    jr   nz, label_5B679
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B676
    ld   h, l

label_5B605::
    ld   h, c
    ld   h, h
    ld   a, c
    ccf
    ld   hl, label_2020
    jr   nz, label_5B62E
    jr   nz, label_5B669
    ld   h, l
    ld   [hl], e
    jr   nz, label_5B634
    ld   c, [hl]
    dec  l
    ld   c, [hl]
    ld   l, a
    cp   $48
    ld   h, l

label_5B61B::
    ld   l, b
    jr   nz, label_5B666
    ld   h, l
    ld   l, b
    jr   nz, label_5B66A
    ld   h, l
    ld   l, b
    ld   hl, label_2020
    jr   nz, label_5B649
    ld   e, c
    ld   l, a

label_5B62B::
    ld   [hl], l
    jr   nz, label_5B692

label_5B62E::
    ld   h, l
    ld   [hl], e
    ld   h, l
    ld   [hl], d
    db   $76 ; Halt
    ld   h, l

label_5B634::
    jr   nz, label_5B69F
    ld   [hl], h
    ld   hl, label_58E20
    ld   l, a
    ld   [hl], a
    jr   nz, label_5B6AA
    ld   l, a
    ld   l, a

label_5B640::
    ld   l, e
    jr   nz, label_5B6A4

label_5B643::
    ld   [hl], h
    jr   nz, label_5B6A7
    ld   l, h
    ld   l, h

label_5B648::
    jr   nz, label_5B6BE
    ld   l, b
    ld   h, c
    ld   [hl], h

label_5B64D::
    jr   nz, label_5B6B9
    ld   [hl], l
    ld   l, [hl]
    ld   l, e

label_5B652::
    jr   nz, label_5B6CD
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B678
    jr   nz, label_5B6C2
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5B6D3
    ld   l, a
    jr   nz, label_5B6C5
    ld   h, c
    ld   [hl], d
    ld   [hl], d
    ld   a, c

label_5B666::
    ld   hl, label_2020

label_5B669::
    ld   c, b

label_5B66A::
    ld   h, c
    ld   l, b
    ld   hl, label_2020
    ld   d, h
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_5B6D8
    ld   h, c

label_5B676::
    ld   [hl], d
    ld   h, l

label_5B678::
    ld   hl, label_5A553
    ld   h, l
    jr   nz, label_5B6F7
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B6E3
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   hl, label_3FFF
    ccf
    jr   nz, label_5B6AC
    ld   d, h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B6FC
    ld   [hl], e
    jr   nz, label_5B6F7
    jr   nz, label_5B6B8
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l

label_5B69F::
    jr   nz, label_5B704
    ld   h, c
    ld   [hl], d
    db   $76 ; Halt

label_5B6A4::
    ld   h, l
    ld   h, h
    jr   nz, label_5B6C8
    ld   l, a
    ld   l, [hl]

label_5B6AA::
    jr   nz, label_5B720

label_5B6AC::
    ld   l, b
    ld   h, l
    jr   nz, label_5B727
    ld   h, c
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_5B718
    ld   [hl], l
    ld   [hl], h

label_5B6B8::
    ld   a, c

label_5B6B9::
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B720
    ld   h, c

label_5B6BE::
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_5B736
    ld   h, l
    ld   h, l

label_5B6C5::
    jr   nz, label_5B730
    ld   [hl], h

label_5B6C8::
    ld   h, d
    ld   h, l
    ld   h, e
    ld   h, c
    ld   [hl], l

label_5B6CD::
    ld   [hl], e
    ld   h, l
    jr   nz, label_5B73A
    ld   [hl], h
    ld   e, [hl]

label_5B6D3::
    ld   [hl], e
    jr   nz, label_5B74A
    ld   l, a
    ld   l, a

label_5B6D8::
    ld   h, h
    ld   h, c
    ld   [hl], d
    ld   l, e
    jr   nz, label_5B747
    ld   l, [hl]
    jr   nz, label_5B749
    ld   h, l
    ld   [hl], d

label_5B6E3::
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   d, h
    ld   c, a
    jr   nz, label_5B740
    ld   c, b
    ld   b, l
    jr   nz, label_5B736
    ld   c, c
    ld   c, [hl]
    ld   b, h
    ld   b, l
    ld   d, d
    ld   l, $2E

label_5B6F7::
    ld   l, $20
    jr   nz, label_5B74F
    ld   c, b

label_5B6FC::
    ld   b, l
    jr   nz, label_5B748
    ld   d, e
    ld   c, h
    ld   b, l
    jr   nz, label_5B753

label_5B704::
    ld   b, [hl]
    jr   nz, label_5B727
    jr   nz, label_5B754
    ld   c, a
    ld   c, b
    ld   c, a
    ld   c, h
    ld   c, c
    ld   c, [hl]
    ld   d, h
    inc  l
    jr   nz, label_5B75C
    ld   d, e
    jr   nz, label_5B758
    ld   d, l
    ld   d, h

label_5B718::
    jr   nz, label_5B73A
    ld   b, c
    ld   c, [hl]
    jr   nz, label_5B767
    ld   c, h
    ld   c, h

label_5B720::
    ld   d, l
    ld   d, e
    ld   c, c
    ld   c, a
    ld   c, [hl]
    ld   l, $2E

label_5B727::
    ld   l, $20
    ld   c, b
    ld   d, l
    ld   c, l
    ld   b, c
    ld   c, [hl]
    inc  l
    jr   nz, label_5B77E
    ld   c, a
    ld   c, [hl]
    ld   d, e
    ld   d, h
    ld   b, l

label_5B736::
    ld   d, d
    inc  l
    jr   nz, label_5B78D

label_5B73A::
    ld   b, l
    ld   b, c
    inc  l
    jr   nz, label_5B792
    ld   c, e

label_5B740::
    ld   e, c
    ld   l, $2E
    ld   l, $20
    ld   b, c
    jr   nz, label_5B768

label_5B748::
    ld   d, e

label_5B749::
    ld   b, e

label_5B74A::
    ld   b, l
    ld   c, [hl]
    ld   b, l
    jr   nz, label_5B79E

label_5B74F::
    ld   c, [hl]
    jr   nz, label_5B7A6
    ld   c, b

label_5B753::
    ld   b, l

label_5B754::
    jr   nz, label_5B7A2
    ld   c, c
    ld   b, h

label_5B758::
    jr   nz, label_5B7A9
    ld   b, [hl]
    jr   nz, label_5B79E
    jr   nz, label_5B7B2
    ld   c, h
    ld   b, l
    ld   b, l
    ld   d, b
    ld   b, l
    ld   d, d
    ld   e, [hl]
    ld   d, e

label_5B767::
    jr   nz, label_5B789
    jr   nz, label_5B7B0
    ld   e, c
    ld   b, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5B7B4
    ld   d, a
    ld   b, c
    ld   c, e
    ld   b, l
    jr   nz, label_5B7CD
    ld   c, b
    ld   b, l
    jr   nz, label_5B7C1
    ld   d, d

label_5B77E::
    ld   b, l
    ld   b, c
    ld   c, l
    ld   b, l
    ld   d, d
    inc  l
    jr   nz, label_5B7C7
    ld   c, [hl]
    ld   b, h
    jr   nz, label_5B7AA
    ld   c, e
    ld   c, a
    ld   c, b

label_5B78D::
    ld   c, a
    ld   c, h
    ld   c, c
    ld   c, [hl]
    ld   d, h

label_5B792::
    jr   nz, label_5B7EB
    ld   c, c
    ld   c, h
    ld   c, h
    jr   nz, label_5B7EF
    ld   b, c
    ld   c, [hl]
    ld   c, c
    ld   d, e
    ld   c, b

label_5B79E::
    jr   nz, label_5B7ED
    ld   d, l
    ld   b, e

label_5B7A2::
    ld   c, b
    jr   nz, label_5B7F1
    ld   c, c

label_5B7A6::
    ld   c, e
    ld   b, l
    jr   nz, label_5B7CA

label_5B7AA::
    ld   b, c
    jr   nz, label_5B7EF
    ld   d, l
    ld   b, d
    ld   b, d

label_5B7B0::
    ld   c, h
    ld   b, l

label_5B7B2::
    jr   nz, label_5B803

label_5B7B4::
    ld   c, [hl]
    jr   nz, label_5B7F8
    jr   nz, label_5B807
    ld   b, l
    ld   b, l
    ld   b, h
    ld   c, h
    ld   b, l
    ld   l, $2E
    ld   l, $20
    ld   b, e
    ld   b, c
    ld   d, e
    ld   d, h
    dec  l

label_5B7C7::
    jr   nz, label_5B80A
    ld   d, a

label_5B7CA::
    ld   b, c
    ld   e, c
    inc  l

label_5B7CD::
    jr   nz, label_5B828
    ld   c, a
    ld   d, l
    jr   nz, label_5B826
    ld   c, b
    ld   c, a
    ld   d, l
    ld   c, h
    ld   b, h
    ld   c, e
    ld   c, [hl]
    ld   c, a
    ld   d, a
    jr   nz, label_5B832
    ld   c, b
    ld   b, l
    jr   nz, label_5B836
    ld   d, d
    ld   d, l
    ld   d, h
    ld   c, b
    ld   hl, label_2E20
    ld   l, $2E

label_5B7EB::
    jr   nz, label_5B81B

label_5B7ED::
    ld   l, $2E

label_5B7EF::
    jr   nz, label_5B81F

label_5B7F1::
    ld   l, $2E
    jr   nz, label_5B823
    ld   l, $2E
    jr   nz, label_5B850
    ld   l, b
    ld   h, c
    ld   [hl], h
    ccf
    jr   nz, label_5B81F
    ld   c, c
    ld   l, h
    ld   l, h
    ld   [hl], l

label_5B803::
    ld   [hl], e
    ld   l, c
    ld   l, a
    ld   l, [hl]

label_5B807::
    ccf
    rst  $38
    ld   e, c

label_5B80A::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5B877
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5B878
    jr   nz, label_5B839
    ld   b, a
    ld   l, a

label_5B81B::
    ld   l, h
    ld   h, h
    jr   nz, label_5B86B

label_5B81F::
    ld   h, l
    ld   h, c
    ld   h, [hl]
    ld   hl, label_59020
    ld   [hl], d

label_5B826::
    ld   h, l
    ld   [hl], e

label_5B828::
    ld   [hl], e
    ld   d, e
    ld   d, h
    ld   b, c
    ld   d, d
    ld   d, h
    jr   nz, label_5B8A4
    ld   l, a
    jr   nz, label_5B8A6
    ld   h, l
    ld   h, l
    jr   nz, label_5B857
    jr   nz, label_5B859

label_5B839::
    ld   l, b
    ld   l, a
    ld   [hl], a
    jr   nz, label_5B8AB
    ld   h, c
    ld   l, [hl]
    ld   a, c
    jr   nz, label_5B8BC
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5B8AD
    ld   l, a
    ld   l, h
    ld   l, h
    ld   h, l
    ld   h, e
    ld   [hl], h

label_5B850::
    ld   h, l
    ld   h, h
    ld   hl, label_581FF
    ld   [hl], h
    jr   nz, label_5B8C4
    ld   h, c

label_5B859::
    ld   [hl], e
    ld   [hl], h
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    ld   h, a
    ld   l, a
    ld   [hl], h
    jr   nz, label_5B8DD
    ld   l, b
    ld   h, l

label_5B86B::
    jr   nz, label_5B8D3
    ld   l, c
    ld   l, [hl]
    ld   h, c
    ld   l, h
    jr   nz, label_5B893
    jr   nz, label_5B8BC
    ld   l, a
    ld   l, h

label_5B877::
    ld   h, h

label_5B878::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_5B8C8
    ld   h, l
    ld   h, c
    ld   h, [hl]
    ld   hl, label_2020
    jr   nz, label_5B8A4
    ld   c, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_5B8F0
    ld   l, a
    jr   nz, label_5B8ED
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5B903
    ld   h, l
    ld   h, l
    jr   nz, label_5B8B4
    ld   d, d
    ld   l, c
    ld   h, e
    ld   l, b
    ld   h, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_5B8FE
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5B8C3
    jr   nz, label_5B919
    ld   l, b

label_5B8A6::
    ld   h, c
    ld   [hl], h
    jr   nz, label_5B915
    ld   h, l

label_5B8AB::
    ld   a, c
    ld   l, $2E
    ld   l, $FF
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]

label_5B8B4::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5B91F
    ld   l, a
    ld   [hl], h
    jr   nz, label_5B91D

label_5B8BC::
    jr   nz, label_5B8DE
    jr   nz, label_5B8E0
    ld   b, a
    ld   [hl], l
    ld   h, c

label_5B8C3::
    ld   [hl], d

label_5B8C4::
    ld   h, h
    ld   l, c
    ld   h, c
    ld   l, [hl]

label_5B8C8::
    jr   nz, label_5B90B
    ld   h, e
    ld   l, a
    ld   [hl], d
    ld   l, [hl]
    ld   hl, label_58920
    ld   [hl], h
    jr   nz, label_5B94B
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_5B94B
    ld   h, l
    ld   h, h
    ld   [hl], l
    ld   h, e

label_5B8DD::
    ld   h, l

label_5B8DE::
    jr   nz, label_5B900

label_5B8E0::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5B949
    ld   h, c
    ld   l, l
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_5B965
    ld   l, a

label_5B8ED::
    ld   [hl], l
    jr   nz, label_5B910

label_5B8F0::
    ld   [hl], h
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_5B958
    ld   a, c
    jr   nz, label_5B961
    ld   h, c
    ld   l, h
    ld   h, [hl]
    ld   hl, label_599FF
    ld   l, a

label_5B900::
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt

label_5B903::
    ld   h, l
    jr   nz, label_5B96D
    ld   l, a
    ld   [hl], h
    jr   nz, label_5B97E
    ld   l, b

label_5B90B::
    ld   h, l
    jr   nz, label_5B92E
    ld   c, l
    ld   l, c

label_5B910::
    ld   [hl], d
    ld   [hl], d
    ld   l, a
    ld   [hl], d
    jr   nz, label_5B969
    ld   l, b
    ld   l, c
    ld   h, l

label_5B919::
    ld   l, h
    ld   h, h
    ld   hl, label_2020
    ld   e, c

label_5B91F::
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B986
    ld   h, c
    ld   l, [hl]
    jr   nz, label_5B995
    ld   l, a
    ld   [hl], a
    jr   nz, label_5B99F
    ld   [hl], l
    ld   [hl], d
    ld   l, [hl]

label_5B92E::
    ld   h, d
    ld   h, c
    ld   h, e
    ld   l, e
    jr   nz, label_5B9A8
    ld   l, b
    ld   h, l
    jr   nz, label_5B99A
    ld   h, l
    ld   h, c
    ld   l, l
    ld   [hl], e
    jr   nz, label_5B95E
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B9A6
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    ld   l, [hl]
    ld   e, [hl]

label_5B949::
    ld   [hl], h
    jr   nz, label_5B96C
    jr   nz, label_5B96E
    ld   h, d
    ld   l, h
    ld   l, a
    ld   h, e
    ld   l, e
    jr   nz, label_5B9B7
    ld   h, l
    ld   h, [hl]
    ld   l, a

label_5B958::
    ld   [hl], d
    ld   h, l
    ld   hl, label_599FF
    ld   l, a

label_5B95E::
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt

label_5B961::
    ld   h, l
    jr   nz, label_5B9CB
    ld   l, a

label_5B965::
    ld   [hl], h
    jr   nz, label_5B9C9
    jr   nz, label_5B98A
    jr   nz, label_5B98C

label_5B96C::
    ld   l, l

label_5B96D::
    ld   l, a

label_5B96E::
    ld   [hl], d
    ld   h, l
    jr   nz, label_5B9C2
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   h, [hl]
    ld   [hl], l
    ld   l, h
    jr   nz, label_5B99B
    jr   nz, label_5B9BF
    ld   [hl], d

label_5B97E::
    ld   h, c
    ld   h, e
    ld   h, l
    ld   l, h
    ld   h, l
    ld   [hl], h
    ld   hl, label_2020
    ld   c, [hl]
    ld   l, a
    ld   [hl], a

label_5B98A::
    jr   nz, label_5B9AC

label_5B98C::
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_5B9F4
    ld   h, c
    ld   l, [hl]
    jr   nz, label_5B9F6

label_5B995::
    ld   l, h
    ld   l, l
    ld   l, a
    ld   [hl], e
    ld   [hl], h

label_5B99A::
    jr   nz, label_5B9BC
    ld   l, h
    ld   l, c
    ld   h, [hl]

label_5B99F::
    ld   [hl], h
    jr   nz, label_5BA03
    jr   nz, label_5BA1B
    ld   l, b
    ld   h, c

label_5B9A6::
    ld   l, h
    ld   h, l

label_5B9A8::
    ld   hl, label_599FF
    ld   l, a

label_5B9AC::
    ld   [hl], l
    jr   nz, label_5BA15
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5BA16
    jr   nz, label_5B9D7

label_5B9B7::
    jr   nz, label_5B9D9
    jr   nz, label_5BA0E
    ld   h, l

label_5B9BC::
    ld   h, e
    ld   [hl], d
    ld   h, l

label_5B9BF::
    ld   [hl], h
    jr   nz, label_5BA15

label_5B9C2::
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   l, b
    ld   h, l
    ld   l, h
    ld   l, h

label_5B9C9::
    ld   hl, label_5A649
    jr   nz, label_5BA47
    ld   l, a
    ld   [hl], l
    jr   nz, label_5BA35
    ld   l, a
    ld   l, h
    ld   l, h
    ld   h, l
    ld   h, e

label_5B9D7::
    ld   [hl], h
    jr   nz, label_5BA3B
    ld   l, h
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BA4E
    ld   h, [hl]
    jr   nz, label_5BA56
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   h, l
    inc  l
    jr   nz, label_5BA09
    jr   nz, label_5BA5E
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5BA5C
    ld   l, a

label_5B9F6::
    ld   l, a
    ld   h, h
    jr   nz, label_5BA1A
    ld   l, c
    ld   [hl], e
    jr   nz, label_5BA60
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5BA78
    ld   l, a
    jr   nz, label_5BA27
    jr   nz, label_5BA29

label_5BA09::
    jr   nz, label_5BA73
    ld   h, c
    ld   [hl], b
    ld   [hl], b

label_5BA0E::
    ld   h, l
    ld   l, [hl]
    ld   hl, label_597FF
    ld   h, c
    ld   l, [hl]

label_5BA15::
    ld   [hl], h

label_5BA16::
    jr   nz, label_5BA8C
    ld   l, a
    jr   nz, label_5BA82

label_5BA1B::
    ld   l, a
    jr   nz, label_5BA8D
    ld   l, [hl]
    jr   nz, label_5BA82
    jr   nz, label_5BA95
    ld   h, c
    ld   h, [hl]
    ld   [hl], h
    jr   nz, label_5BA9A
    ld   l, c

label_5BA29::
    ld   h, h
    ld   h, l
    jr   nz, label_5BA93
    ld   l, a
    ld   [hl], d
    jr   nz, label_5BA92
    jr   nz, label_5BA9B
    ld   [hl], l
    ld   l, [hl]

label_5BA35::
    ld   h, h
    ld   [hl], d
    ld   h, l
    ld   h, h
    jr   nz, label_5BA8D

label_5BA3B::
    ld   [hl], l
    ld   [hl], b
    ld   h, l
    ld   h, l
    ld   [hl], e
    ccf
    jr   nz, label_5BA63
    jr   nz, label_5BA65
    jr   nz, label_5BAA0

label_5BA47::
    ld   h, l
    ld   [hl], e
    jr   nz, label_5BA6B
    ld   c, [hl]
    ld   l, a
    jr   nz, label_5BAA6
    ld   h, c
    ld   a, c
    cp   $4F
    ld   l, e
    ld   h, c
    ld   a, c

label_5BA56::
    inc  l
    jr   nz, label_5BACD
    ld   l, b
    ld   h, l
    jr   nz, label_5BACF
    ld   h, c

label_5BA5E::
    ld   h, [hl]
    ld   [hl], h

label_5BA60::
    jr   nz, label_5BA82
    ld   l, c

label_5BA63::
    ld   [hl], e
    jr   nz, label_5BAD8
    ld   h, l
    ld   h, c
    ld   h, h
    ld   a, c
    jr   nz, label_5BAD2
    ld   l, a
    ld   [hl], d
    jr   nz, label_5BAE9
    ld   l, a
    ld   [hl], l
    ld   l, a

label_5BA73::
    ld   [hl], l
    ld   [hl], h
    ld   [hl], e
    ld   l, c
    ld   h, h

label_5BA78::
    ld   h, l
    ld   hl, label_2020
    ld   b, l
    ld   l, [hl]
    ld   l, d
    ld   l, a
    ld   a, c
    ld   hl, label_597FF
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   h, [hl]
    ld   h, c
    ld   l, h
    ld   l, h

label_5BA8C::
    jr   nz, label_5BAEF
    ld   [hl], h
    jr   nz, label_5BB05
    ld   l, b

label_5BA92::
    ld   h, l

label_5BA93::
    jr   nz, label_5BAB5

label_5BA95::
    jr   nz, label_5BAB7
    ld   d, e
    ld   l, b
    ld   [hl], d

label_5BA9A::
    ld   l, c

label_5BA9B::
    ld   l, [hl]
    ld   h, l
    rst  $38
    jr   nz, label_5BAF3

label_5BAA0::
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, b
    jr   nz, label_5BB15

label_5BAA6::
    ld   h, [hl]
    jr   nz, label_5BB1D
    ld   l, b
    ld   h, l
    jr   nz, label_5BACD
    jr   nz, label_5BACF
    jr   nz, label_5BAD1
    jr   nz, label_5BB06
    ld   l, b
    ld   [hl], d

label_5BAB5::
    ld   l, c
    ld   l, [hl]

label_5BAB7::
    ld   h, l
    rst  $38
    ld   b, l
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, e
    ld   h, l
    jr   nz, label_5BB37
    ld   l, a
    jr   nz, label_5BB3A
    ld   l, b
    ld   h, l
    jr   nz, label_5BAEA
    ld   b, c
    ld   l, [hl]
    ld   l, c

label_5BACD::
    ld   l, l
    ld   h, c

label_5BACF::
    ld   l, h
    jr   nz, label_5BB28

label_5BAD2::
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l

label_5BAD8::
    rst  $38
    ld   d, a
    ld   h, l
    jr   nz, label_5BB54
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_5BB44
    ld   l, a
    ld   [hl], d
    ld   l, [hl]
    jr   nz, label_5BB56
    ld   h, [hl]
    jr   nz, label_5BB58

label_5BAEA::
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, l

label_5BAEF::
    ld   h, c
    ld   [hl], d
    ld   h, l
    ld   [hl], e

label_5BAF3::
    ld   l, $2E
    ld   l, $20
    ld   d, h
    ld   l, a
    ld   [hl], h
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_5BB6E
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_5BB78
    ld   l, b

label_5BB05::
    ld   l, c

label_5BB06::
    ld   [hl], e
    jr   nz, label_5BB29
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   l, h
    ld   h, h
    inc  l
    jr   nz, label_5BB88
    ld   h, l
    jr   nz, label_5BB81
    ld   h, c

label_5BB15::
    ld   h, h
    ld   h, l
    jr   nz, label_5BB39
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_5BB75
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5BB69
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_5BB48

label_5BB28::
    jr   nz, label_5BB9D
    ld   l, h
    ld   h, l
    ld   h, l
    ld   [hl], b
    jr   nz, label_5BB95
    ld   l, [hl]
    ld   h, h
    ld   l, h
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   l, h

label_5BB37::
    ld   a, c
    ld   hl, label_5A649
    jr   nz, label_5BBB1
    ld   l, b
    ld   h, l
    jr   nz, label_5BB98
    ld   l, c
    ld   l, [hl]
    ld   h, h

label_5BB44::
    jr   nz, label_5BB8C
    ld   l, c
    ld   [hl], e

label_5BB48::
    ld   l, b
    ld   h, h
    ld   l, a
    ld   h, l
    ld   [hl], e
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_5BBC9
    ld   h, c
    ld   l, e

label_5BB54::
    ld   h, l
    jr   nz, label_5BBCC
    ld   [hl], b

label_5BB58::
    inc  l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_5BBC8
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5BBDD
    ld   l, c
    ld   l, h
    ld   l, h

label_5BB69::
    ld   l, [hl]
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d

label_5BB6E::
    jr   nz, label_5BBD4
    ld   l, c
    ld   [hl], e
    ld   h, c
    ld   [hl], b
    ld   [hl], b

label_5BB75::
    ld   h, l
    ld   h, c
    ld   [hl], d

label_5BB78::
    ld   hl, label_5A557
    jr   nz, label_5BBF4
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h

label_5BB81::
    jr   nz, label_5BBEB
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5BBA8

label_5BB88::
    jr   nz, label_5BBEC
    ld   h, l
    ld   h, l

label_5BB8C::
    ld   l, [hl]
    jr   nz, label_5BC03
    ld   l, b
    ld   h, l
    jr   nz, label_5BC00
    ld   h, c
    ld   [hl], e

label_5BB95::
    ld   [hl], h
    ld   h, l
    ld   [hl], d

label_5BB98::
    ld   [hl], e
    ld   l, a
    ld   h, [hl]
    jr   nz, label_5BC11

label_5BB9D::
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_5BC12
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l
    ld   l, $2E

label_5BBA8::
    ld   l, $42
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_5BC27
    ld   l, a
    ld   [hl], l
    jr   nz, label_5BC1A
    ld   h, c
    ld   h, h
    jr   nz, label_5BC2A
    ld   l, a
    jr   nz, label_5BBD9
    ld   h, e
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_5BC27
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_5BC25
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5BBE8

label_5BBC8::
    jr   nz, label_5BC2E
    ld   l, c
    ld   [hl], e

label_5BBCC::
    ld   [hl], d
    ld   [hl], l
    ld   [hl], b
    ld   [hl], h
    jr   nz, label_5BC41
    ld   [hl], l
    ld   [hl], d

label_5BBD4::
    jr   nz, label_5BBF6
    jr   nz, label_5BBF8
    jr   nz, label_5BC4A
    ld   l, h
    ld   h, c
    ld   l, [hl]

label_5BBDD::
    ld   [hl], e
    ld   hl, label_2020
    ld   c, b
    ld   h, l
    ld   l, b
    jr   nz, label_5BC4E
    ld   h, l
    ld   l, b

label_5BBE8::
    ld   hl, label_5AF59

label_5BBEB::
    ld   [hl], l

label_5BBEC::
    jr   nz, label_5BC51
    ld   h, c
    ld   l, [hl]
    jr   nz, label_5BC60
    ld   h, l
    db   $76 ; Halt

label_5BBF4::
    ld   h, l
    ld   [hl], d

label_5BBF6::
    jr   nz, label_5BC18

label_5BBF8::
    jr   nz, label_5BC5E
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   h, c
    ld   [hl], h
    jr   nz, label_5BC76
    ld   [hl], e
    ld   hl, label_2121
    jr   nz, label_5BC27
    jr   nz, label_5BC29
    ld   c, h
    ld   h, l
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_5BC82
    ld   [hl], l

label_5BC11::
    ld   l, l

label_5BC12::
    ld   h, d
    ld   l, h
    ld   h, l
    ld   hl, label_594FF

label_5BC18::
    ld   l, b
    ld   l, c

label_5BC1A::
    ld   [hl], e
    jr   nz, label_5BC86
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5BC8D
    ld   [hl], e

label_5BC25::
    jr   nz, label_5BC47

label_5BC27::
    ld   h, a
    ld   l, a

label_5BC29::
    ld   l, c

label_5BC2A::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5BCA2

label_5BC2E::
    ld   l, a
    jr   nz, label_5BC95
    ld   l, c
    ld   [hl], e
    dec  l
    jr   nz, label_5BC56
    jr   nz, label_5BC99
    ld   [hl], b
    ld   [hl], b
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   l, $2E
    ld   l, $20

label_5BC41::
    jr   nz, label_5BC92
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5BC67

label_5BC47::
    ld   [hl], a
    ld   l, a
    ld   [hl], d

label_5BC4A::
    ld   l, h
    ld   h, h
    jr   nz, label_5BCB7

label_5BC4E::
    ld   [hl], e
    jr   nz, label_5BCB8

label_5BC51::
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5BC77
    ld   [hl], h
    ld   l, a
    jr   nz, label_5BCBF
    ld   l, c
    ld   [hl], e
    ld   h, c

label_5BC5E::
    ld   [hl], b
    ld   [hl], b

label_5BC60::
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   l, $2E
    ld   l, $20

label_5BC67::
    ld   c, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_5BCE3
    ld   l, a
    ld   [hl], d
    ld   l, h
    ld   h, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5BC96

label_5BC76::
    jr   nz, label_5BCC7
    ld   [hl], l
    ld   [hl], d
    ld   l, $2E
    ld   l, $20
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   l, h

label_5BC82::
    ld   h, h
    ld   l, $2E
    ld   l, $20
    rst  $38
    ld   d, a
    ld   l, a
    ld   [hl], a
    ld   hl, label_2020
    inc  hl
    inc  hl
    inc  hl
    inc  hl

label_5BC92::
    inc  hl
    inc  l
    jr   nz, label_5BCF9

label_5BC96::
    ld   h, c
    ld   l, [hl]
    ld   c, c

label_5BC99::
    jr   nz, label_5BD0F
    ld   [hl], d
    ld   a, c
    jr   nz, label_5BD13
    ld   l, b
    ld   l, c
    ld   [hl], e

label_5BCA2::
    ccf
    ld   hl, label_2020
    jr   nz, label_5BCC8
    ld   d, a
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_5BD12
    ld   l, a
    jr   nz, label_5BD2A
    ld   l, a
    ld   [hl], l
    jr   nz, label_5BD28
    ld   h, c
    ld   a, c

label_5BCB7::
    ccf

label_5BCB8::
    jr   nz, label_5BCDA
    jr   nz, label_5BCDC
    ld   c, a
    ld   l, e
    ld   h, c

label_5BCBF::
    ld   a, c
    jr   nz, label_5BD10
    ld   l, a
    jr   nz, label_5BD1C
    ld   h, c
    ld   a, c

label_5BCC7::
    cp   $43
    ld   e, [hl]
    ld   l, l
    ld   l, a
    ld   l, [hl]
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_5BD4A
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_5BCF8
    ld   [hl], h
    ld   l, a

label_5BCDA::
    jr   nz, label_5BD40

label_5BCDC::
    ld   l, a
    jr   nz, label_5BD48
    ld   [hl], h
    ld   hl, label_58320

label_5BCE3::
    ld   h, c
    ld   l, [hl]
    jr   nz, label_5BD30
    ccf
    ld   c, c
    ld   [hl], h
    jr   nz, label_5BD58
    ld   l, a
    ld   l, a
    ld   l, e
    ld   [hl], e
    jr   nz, label_5BD65
    ld   l, a
    jr   nz, label_5BD5B
    ld   [hl], l
    ld   l, [hl]
    ld   hl, label_2020
    jr   nz, label_5BD1C
    ld   e, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_5BD21
    ld   c, a
    ld   l, e
    ld   h, c
    ld   a, c
    cp   $59
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_5BD75
    ld   l, a

label_5BD0F::
    ld   l, a

label_5BD10::
    ld   h, h
    ld   hl, label_2020
    jr   nz, label_5BD36
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l

label_5BD1C::
    jr   nz, label_5BD7F
    jr   nz, label_5BD90
    ld   [hl], d

label_5BD21::
    ld   l, a
    inc  l
    jr   nz, label_5BD45
    jr   nz, label_5BD88
    ld   [hl], d

label_5BD28::
    ld   h, l
    ld   l, [hl]

label_5BD2A::
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_5BDA7
    ld   l, a
    ld   [hl], l

label_5BD30::
    ccf
    jr   nz, label_5BD53
    jr   nz, label_5BD55
    jr   nz, label_5BD65
    ld   l, $2E
    jr   nz, label_5BD69
    ld   l, $2E
    jr   nz, label_5BD6D
    ld   l, $2E
    jr   nz, label_5BD71
    ld   l, $2E

label_5BD45::
    jr   nz, label_5BD9E
    ld   h, l

label_5BD48::
    ld   l, h
    ld   l, h

label_5BD4A::
    inc  l
    jr   nz, label_5BDAF
    ld   h, l
    ld   h, c
    ld   [hl], h
    jr   nz, label_5BDBB
    ld   [hl], h

label_5BD53::
    ld   hl, label_2020
    ld   d, b
    ld   [hl], d

label_5BD58::
    ld   l, a
    ld   [hl], e
    jr   nz, label_5BDBD
    ld   [hl], d
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_5BD83
    jr   nz, label_5BD85

label_5BD65::
    jr   nz, label_5BDC8
    ld   l, h
    ld   l, h

label_5BD69::
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   h, h

label_5BD6D::
    jr   nz, label_5BDD8
    ld   l, [hl]
    jr   nz, label_5BDDA
    ld   h, l
    ld   [hl], d
    ld   h, l

label_5BD75::
    ld   hl, label_587FF
    ld   l, a
    jr   nz, label_5BDDC
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   hl, label_591FF
    ld   [hl], l
    ld   l, c

label_5BD83::
    ld   [hl], h
    jr   nz, label_5BDEF
    ld   [hl], h
    ld   hl, label_594FF
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_5BDF8
    ld   [hl], e

label_5BD90::
    jr   nz, label_5BE00
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BDF7
    jr   nz, label_5BDB8
    jr   nz, label_5BDFD
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   [hl], h

label_5BD9E::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_5BDFB
    ld   l, b
    ld   h, c
    ld   [hl], h

label_5BDA7::
    ccf
    jr   nz, label_5BE03
    ld   l, a
    ld   [hl], l
    jr   nz, label_5BE19
    ld   l, [hl]

label_5BDAF::
    ld   h, l
    ld   [hl], a
    jr   nz, label_5BE27
    ld   l, b
    ld   h, c
    ld   [hl], h
    ccf
    jr   nz, label_5BDD9
    ld   c, a
    ld   l, e

label_5BDBB::
    ld   h, c
    ld   a, c

label_5BDBD::
    ld   l, $FF
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    jr   nz, label_5BE29
    ld   l, b
    ld   h, l

label_5BDC8::
    ld   h, e
    ld   l, e
    ld   h, l
    ld   h, h
    jr   nz, label_5BDEE
    jr   nz, label_5BE44
    ld   l, b
    ld   h, l
    jr   nz, label_5BE37
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   [hl], h

label_5BDD8::
    ld   l, $20

label_5BDDA::
    jr   nz, label_5BE33

label_5BDDC::
    ld   l, a
    ld   [hl], a
    ld   hl, label_5A854
    ld   l, c
    ld   [hl], e
    jr   nz, label_5BE4E
    ld   [hl], e
    jr   nz, label_5BE49
    jr   nz, label_5BE58
    ld   l, c
    ld   h, e
    ld   h, l
    jr   nz, label_5BE0F

label_5BDEF::
    ld   h, e
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   hl, label_589FF

label_5BDF7::
    ld   [hl], h

label_5BDF8::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_5BE5D
    ld   l, h

label_5BDFD::
    ld   l, h
    jr   nz, label_5BE72

label_5BE00::
    ld   h, l
    ld   h, c
    ld   h, h

label_5BE03::
    ld   a, c
    inc  l
    jr   nz, label_5BE70
    ld   [hl], h
    jr   nz, label_5BE73
    ld   [hl], e
    ld   hl, label_2020
    ld   d, h

label_5BE0F::
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_5BE34
    jr   nz, label_5BE36
    ld   h, e
    ld   h, c
    ld   [hl], d

label_5BE19::
    ld   h, l
    inc  l
    jr   nz, label_5BE7E
    ld   [hl], e
    jr   nz, label_5BE94
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    ld   l, [hl]

label_5BE27::
    ld   l, a
    ld   [hl], h

label_5BE29::
    jr   nz, label_5BE98
    ld   [hl], l
    ld   h, e
    ld   l, b
    jr   nz, label_5BEA4
    ld   l, b
    ld   h, l
    ld   [hl], d

label_5BE33::
    ld   h, l

label_5BE34::
    ld   hl, label_59720

label_5BE37::
    ld   l, b
    ld   a, c
    jr   nz, label_5BEA9
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BEB3
    ld   [hl], d
    ld   a, c
    jr   nz, label_5BEA4
    jr   nz, label_5BE65
    jr   nz, label_5BEA9
    ld   l, c
    ld   [hl], h

label_5BE49::
    jr   nz, label_5BEB4
    ld   l, [hl]
    jr   nz, label_5BEBB

label_5BE4E::
    ld   a, c
    jr   nz, label_5BEB9
    ld   [hl], l
    ld   [hl], h
    ccf
    rst  $38
    ld   c, b
    ld   h, l
    ld   a, c

label_5BE58::
    ld   hl, label_2020
    ld   d, a
    ld   l, b

label_5BE5D::
    ld   h, c
    ld   [hl], h
    jr   nz, label_5BEC2
    ld   [hl], d
    ld   h, l
    jr   nz, label_5BE85

label_5BE65::
    ld   a, c
    ld   h, c
    jr   nz, label_5BECD
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   e, [hl]
    jr   nz, label_5BED8
    ld   l, [hl]

label_5BE70::
    jr   nz, label_5BEDF

label_5BE72::
    ld   a, c

label_5BE73::
    jr   nz, label_5BE95
    ld   h, e
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ccf
    ld   hl, label_2020

label_5BE7E::
    ld   d, a
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   h, h

label_5BE85::
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_5BEF6
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   l, [hl]
    jr   nz, label_5BF04
    ld   h, c
    jr   nz, label_5BEF7
    ld   l, a

label_5BE94::
    jr   nz, label_5BF09
    ld   [hl], l
    ld   h, e

label_5BE98::
    ld   l, b
    jr   nz, label_5BEFC
    jr   nz, label_5BF11
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ccf
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt

label_5BEA9::
    ld   h, l
    jr   nz, label_5BF13
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BF24
    ld   l, b
    ld   h, l
    jr   nz, label_5BED4

label_5BEB4::
    ld   b, [hl]
    ld   [hl], l
    ld   l, h
    ld   l, h
    jr   nz, label_5BF07
    ld   l, a

label_5BEBB::
    ld   l, a
    ld   l, [hl]
    jr   nz, label_5BF02
    ld   h, l
    ld   l, h
    ld   l, h

label_5BEC2::
    ld   l, a
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5BF34

label_5BECD::
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BF45
    ld   l, b
    ld   h, l
    jr   nz, label_5BEF5
    ld   b, e
    ld   l, a
    ld   l, [hl]

label_5BED8::
    ld   h, e
    ld   l, b
    jr   nz, label_5BF24
    ld   l, a
    ld   [hl], d
    ld   l, [hl]

label_5BEDF::
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5BF50
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BF61
    ld   l, b
    ld   h, l
    jr   nz, label_5BF11
    ld   d, e
    ld   h, l
    ld   h, c
    jr   nz, label_5BF42

label_5BEF6::
    ld   l, c

label_5BEF7::
    ld   l, h
    ld   a, c
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_5BF3F
    ld   h, l
    ld   l, h
    ld   l, h
    ld   hl, label_599FF
    ld   l, a

label_5BF04::
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt

label_5BF07::
    ld   h, l
    jr   nz, label_5BF71
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BF82
    ld   l, b
    ld   h, l
    jr   nz, label_5BF32
    ld   d, e

label_5BF13::
    ld   [hl], l
    ld   [hl], d
    ld   h, [hl]
    jr   nz, label_5BF60
    ld   h, c
    ld   [hl], d
    ld   [hl], b
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5BF8C
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BF9D
    ld   l, b
    ld   h, l
    jr   nz, label_5BF4D
    ld   d, a
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_5BF80
    ld   h, c

label_5BF34::
    ld   [hl], d
    ld   l, c
    ld   l, l
    ld   h, d
    ld   h, c
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]

label_5BF3F::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5BFAA
    ld   l, a
    ld   [hl], h

label_5BF45::
    jr   nz, label_5BFBB
    ld   l, b
    ld   h, l
    jr   nz, label_5BF6B
    ld   b, e
    ld   l, a

label_5BF4D::
    ld   [hl], d
    ld   h, c
    ld   l, h

label_5BF50::
    jr   nz, label_5BFA6
    ld   [hl], d
    ld   l, c
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   l, h
    ld   h, l
    ld   hl, label_599FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt

label_5BF60::
    ld   h, l

label_5BF61::
    jr   nz, label_5BFCA
    ld   l, a
    ld   [hl], h
    jr   nz, label_5BFDB
    ld   l, b
    ld   h, l
    jr   nz, label_5BF8B

label_5BF6B::
    ld   c, a
    ld   [hl], d
    ld   h, a
    ld   h, c
    ld   l, [hl]
    jr   nz, label_5BFE1
    ld   h, [hl]
    jr   nz, label_5BF95
    jr   nz, label_5BF97
    jr   nz, label_5BF99
    jr   nz, label_5BF9B
    jr   nz, label_5BF9D
    ld   b, l
    db   $76 ; Halt
    ld   h, l

label_5BF80::
    ld   l, [hl]
    ld   l, c

label_5BF82::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_5BFC9
    ld   h, c
    ld   l, h
    ld   l, l
    ld   hl, label_599FF

label_5BF8C::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_5BFFA
    ld   l, a
    ld   [hl], h

label_5BF95::
    jr   nz, label_FFFF800B

label_5BF97::
    ld   l, b
    ld   h, l

label_5BF99::
    jr   nz, label_5BFBB

label_5BF9B::
    ld   d, h
    ld   l, b

label_5BF9D::
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d
    jr   nz, label_5BFE8
    ld   [hl], d
    ld   [hl], l

label_5BFA6::
    ld   l, l
    ld   hl, $00FF

label_5BFAA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5BFBB::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5BFC9::
    nop

label_5BFCA::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5BFDB::
    nop
    nop
    nop
    nop
    nop
    nop

label_5BFE1::
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5BFE8::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_5BFFA::
    nop
    nop
    nop
    nop
    nop
    nop
