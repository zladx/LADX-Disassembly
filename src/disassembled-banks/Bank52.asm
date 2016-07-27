section "bank52",romx,bank[$34]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  bc
    rst  $38
    inc  b
    rst  $28
    inc  d
    rst  0
    db   $3A ; ldd  a, [hl]
    add  a, e
    ld   a, l
    adc  a, c
    db   $76 ; Halt
    ret  nc
    cpl
    db   $FC ; Undefined instruction
    inc  bc
    rst  $38
    inc  c
    rst  $28
    inc  de
    db   $E3 ; Undefined instruction
    inc  e
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
    inc  e
    rst  $38
    ldi  [hl], a
    rst  $38
    ld   b, c
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    ld   b, b
    rst  $38
    jr   nz, label_D0032
    db   $10 ; Undefined instruction
    ld   [label_4FF], sp
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
    rst  $38
    inc  e
    rst  $38
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    ld   e, l
    pop  hl
    ld   e, [hl]
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   a, [$FF2F]
    ld    hl, sp+$17
    db   $FC ; Undefined instruction
    dec  bc
    cp   $05
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
    rst  $38
    inc  e
    rst  $38
    ldi  [hl], a
    db   $E3 ; Undefined instruction
    ld   e, l
    pop  hl
    ld   e, [hl]
    ld   [$FF5F], a
    ld   [$FF5F], a
    rst  $38
    jr   nz, label_D0072
    db   $10 ; Undefined instruction
    ld   [label_4FF], sp
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
    rst  $38
    ld   a, a
    rst  $38
    ld   b, b
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    ld   [$FF5F], a
    rst  $38
    ld   b, b
    rst  $38
    ld   a, a
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
    jr   label_D00B5

label_D00B5::
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
    rrca
    nop
    dec  c
    nop
    dec  c
    nop
    rrca
    nop
    inc  c
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
    ld   [hl], $00
    or   [hl]
    nop
    or   [hl]
    nop
    ld   [hl], $00
    ld   [hl], $00
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
    nop
    ld   [hl], e
    nop
    jp   label_D3300
    nop
    dec  de
    nop
    db   $DB
    nop
    ld   [hl], e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, c
    nop
    ld   h, e
    nop
    pop  hl
    nop
    ld   h, b
    nop
    ld   h, e
    nop
    ld   h, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst  8
    nop
    inc  c
    nop
    adc  a, $00
    ld   l, h
    nop
    ld   l, h
    nop
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
    nop
    nop
    nop
    nop
    ld   h, e
    nop
    ld   h, e
    nop
    ld   h, e
    nop
    ld   h, e
    nop
    ld   h, e
    nop
    ld   a, e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc  a, $00
    jr   label_D0196

label_D0196::
    sbc  a, b
    nop
    jr   label_D019A

label_D019A::
    jr   label_D019C

label_D019C::
    adc  a, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    ld   h, b
    nop
    nop
    nop
    rst  $38
    nop
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    ld   d, e
    rst  $38
    nop
    rst  $38
    rra
    rst  $38
    jr   c, label_D01D2
    ld   sp, label_31FF
    rst  $38
    ld   sp, label_31FF
    rst  $38
    jr   c, label_D01DC
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, $FF
    ld   d, l
    rst  $38
    ld   d, l
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    db   $FC ; Undefined instruction
    rst  $38
    inc  c
    rst  $38
    adc  a, h
    rst  $38
    inc  e
    rst  $38
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    ld   d, e
    rst  $38
    nop
    rst  $38
    rra
    rst  $38
    jr   nc, label_D0212
    ld   sp, label_31FF
    rst  $38
    jr   nc, label_D0218
    ld   sp, label_31FF
    rst  $38
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, $FF
    ld   d, l
    rst  $38
    ld   d, l
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    adc  a, h
    rst  $38
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    adc  a, h
    rst  $38
    ld    hl, sp+$FF
    nop
    rst  $38
    nop
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    xor  e
    rst  $38
    xor  d
    rst  $38
    ld   d, e
    rst  $38
    nop
    rst  $38
    rra
    rst  $38
    jr   nc, label_D0252
    ld   sp, label_30FF
    rst  $38
    ld   sp, label_31FF
    rst  $38
    jr   nc, label_D025C
    rra
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    jr   label_D0292
    jr   c, label_D0294
    jr   label_D0296
    jr   label_D0298
    jr   label_D029A
    jr   label_D029C
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   h, [hl]
    rst  $38
    ld   b, $FF
    inc  a
    rst  $38
    ld   h, b
    rst  $38
    ld   a, [hl]
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   h, [hl]
    rst  $38
    inc  c
    rst  $38
    ld   b, $FF
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    inc  c
    rst  $38
    inc  e
    rst  $38
    inc  a
    rst  $38
    ld   l, h
    rst  $38
    ld   a, [hl]
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
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, h
    rst  $38
    ld   h, b
    rst  $38
    ld   a, h
    rst  $38
    ld   b, $FF
    ld   b, $FF
    ld   a, h
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   h, b
    rst  $38
    ld   a, h
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   a, [hl]
    rst  $38
    ld   b, $FF
    inc  c
    rst  $38
    jr   label_D0358
    jr   label_D035A
    jr   label_D035C
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    inc  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, $FF
    ld   b, $FF
    inc  a
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
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
    rst  $38
    ld   b, $FF
    inc  c
    rst  $38
    jr   label_D03B8
    jr   nc, label_D03BA
    ld   h, b
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   h, $FF
    ld   d, l
    rst  $38
    ld   d, l
    rst  $38
    db   $76 ; Halt
    rst  $38
    ld   d, l
    rst  $38
    nop
    rst  $38
    ld    hl, sp+$FF
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    inc  e
    rst  $38
    adc  a, h
    rst  $38
    adc  a, h
    rst  $38
    inc  e
    rst  $38
    ld    hl, sp+$FF
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0420
    jr   label_D0422
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0430
    jr   label_D0432
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0420::
    nop
    nop

label_D0422::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0440
    jr   label_D0442
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0430::
    nop
    nop

label_D0432::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0450
    jr   label_D0452
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0440::
    nop
    nop

label_D0442::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0460
    jr   label_D0462
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0450::
    nop
    nop

label_D0452::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0470
    jr   label_D0472
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0460::
    nop
    nop

label_D0462::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0480
    jr   label_D0482
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0470::
    nop
    nop

label_D0472::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0490
    jr   label_D0492
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0480::
    nop
    nop

label_D0482::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D04A0
    jr   label_D04A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0490::
    nop
    nop

label_D0492::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D04B0
    jr   label_D04B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D04A0::
    nop
    nop

label_D04A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D04C0
    jr   label_D04C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D04B0::
    nop
    nop

label_D04B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D04D0
    jr   label_D04D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D04C0::
    nop
    nop

label_D04C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D04E0
    jr   label_D04E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D04D0::
    nop
    nop

label_D04D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D04F0
    jr   label_D04F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D04E0::
    nop
    nop

label_D04E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0500
    jr   label_D0502
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D04F0::
    nop
    nop

label_D04F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0510
    jr   label_D0512
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0500::
    nop
    nop

label_D0502::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0520
    jr   label_D0522
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0510::
    nop
    nop

label_D0512::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0530
    jr   label_D0532
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0520::
    nop
    nop

label_D0522::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0540
    jr   label_D0542
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0530::
    nop
    nop

label_D0532::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0550
    jr   label_D0552
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0540::
    nop
    nop

label_D0542::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0560
    jr   label_D0562
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0550::
    nop
    nop

label_D0552::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0570
    jr   label_D0572
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0560::
    nop
    nop

label_D0562::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0580
    jr   label_D0582
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0570::
    nop
    nop

label_D0572::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0590
    jr   label_D0592
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0580::
    nop
    nop

label_D0582::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D05A0
    jr   label_D05A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0590::
    nop
    nop

label_D0592::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D05B0
    jr   label_D05B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D05A0::
    nop
    nop

label_D05A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D05C0
    jr   label_D05C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D05B0::
    nop
    nop

label_D05B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D05D0
    jr   label_D05D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D05C0::
    nop
    nop

label_D05C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D05E0
    jr   label_D05E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D05D0::
    nop
    nop

label_D05D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D05F0
    jr   label_D05F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D05E0::
    nop
    nop

label_D05E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0600
    jr   label_D0602
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D05F0::
    nop
    nop

label_D05F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0610
    jr   label_D0612
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0600::
    nop
    nop

label_D0602::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0620
    jr   label_D0622
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0610::
    nop
    nop

label_D0612::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0630
    jr   label_D0632
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0620::
    nop
    nop

label_D0622::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0640
    jr   label_D0642
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0630::
    nop
    nop

label_D0632::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0650
    jr   label_D0652
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0640::
    nop
    nop

label_D0642::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0660
    jr   label_D0662
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0650::
    nop
    nop

label_D0652::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0670
    jr   label_D0672
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0660::
    nop
    nop

label_D0662::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0680
    jr   label_D0682
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0670::
    nop
    nop

label_D0672::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0690
    jr   label_D0692
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0680::
    nop
    nop

label_D0682::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D06A0
    jr   label_D06A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0690::
    nop
    nop

label_D0692::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D06B0
    jr   label_D06B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D06A0::
    nop
    nop

label_D06A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D06C0
    jr   label_D06C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D06B0::
    nop
    nop

label_D06B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D06D0
    jr   label_D06D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D06C0::
    nop
    nop

label_D06C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D06E0
    jr   label_D06E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D06D0::
    nop
    nop

label_D06D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D06F0
    jr   label_D06F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D06E0::
    nop
    nop

label_D06E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0700
    jr   label_D0702
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D06F0::
    nop
    nop

label_D06F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0710
    jr   label_D0712
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0700::
    nop
    nop

label_D0702::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0720
    jr   label_D0722
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0710::
    nop
    nop

label_D0712::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0730
    jr   label_D0732
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0720::
    nop
    nop

label_D0722::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0740
    jr   label_D0742
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0730::
    nop
    nop

label_D0732::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0750
    jr   label_D0752
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0740::
    nop
    nop

label_D0742::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0760
    jr   label_D0762
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0750::
    nop
    nop

label_D0752::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0770
    jr   label_D0772
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0760::
    nop
    nop

label_D0762::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0780
    jr   label_D0782
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0770::
    nop
    nop

label_D0772::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0790
    jr   label_D0792
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0780::
    nop
    nop

label_D0782::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D07A0
    jr   label_D07A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0790::
    nop
    nop

label_D0792::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D07B0
    jr   label_D07B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D07A0::
    nop
    nop

label_D07A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D07C0
    jr   label_D07C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D07B0::
    nop
    nop

label_D07B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D07D0
    jr   label_D07D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D07C0::
    nop
    nop

label_D07C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D07E0
    jr   label_D07E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D07D0::
    nop
    nop

label_D07D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D07F0
    jr   label_D07F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D07E0::
    nop
    nop

label_D07E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0800
    jr   label_D0802
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D07F0::
    nop
    nop

label_D07F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0810
    jr   label_D0812
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0800::
    nop
    nop

label_D0802::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0820
    jr   label_D0822
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0810::
    nop
    nop

label_D0812::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0830
    jr   label_D0832
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0820::
    nop
    nop

label_D0822::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0840
    jr   label_D0842
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0830::
    nop
    nop

label_D0832::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0850
    jr   label_D0852
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0840::
    nop
    nop

label_D0842::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0860
    jr   label_D0862
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0850::
    nop
    nop

label_D0852::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0870
    jr   label_D0872
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0860::
    nop
    nop

label_D0862::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0880
    jr   label_D0882
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0870::
    nop
    nop

label_D0872::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0890
    jr   label_D0892
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0880::
    nop
    nop

label_D0882::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D08A0
    jr   label_D08A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0890::
    nop
    nop

label_D0892::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D08B0
    jr   label_D08B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D08A0::
    nop
    nop

label_D08A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D08C0
    jr   label_D08C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D08B0::
    nop
    nop

label_D08B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D08D0
    jr   label_D08D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D08C0::
    nop
    nop

label_D08C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D08E0
    jr   label_D08E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D08D0::
    nop
    nop

label_D08D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D08F0
    jr   label_D08F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D08E0::
    nop
    nop

label_D08E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0900
    jr   label_D0902
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D08F0::
    nop
    nop

label_D08F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0910
    jr   label_D0912
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0900::
    nop
    nop

label_D0902::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0920
    jr   label_D0922
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0910::
    nop
    nop

label_D0912::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0930
    jr   label_D0932
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0920::
    nop
    nop

label_D0922::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0940
    jr   label_D0942
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0930::
    nop
    nop

label_D0932::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0950
    jr   label_D0952
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0940::
    nop
    nop

label_D0942::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0960
    jr   label_D0962
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0950::
    nop
    nop

label_D0952::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0970
    jr   label_D0972
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0960::
    nop
    nop

label_D0962::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0980
    jr   label_D0982
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0970::
    nop
    nop

label_D0972::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0990
    jr   label_D0992
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0980::
    nop
    nop

label_D0982::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D09A0
    jr   label_D09A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0990::
    nop
    nop

label_D0992::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D09B0
    jr   label_D09B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D09A0::
    nop
    nop

label_D09A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D09C0
    jr   label_D09C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D09B0::
    nop
    nop

label_D09B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D09D0
    jr   label_D09D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D09C0::
    nop
    nop

label_D09C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D09E0
    jr   label_D09E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D09D0::
    nop
    nop

label_D09D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D09F0
    jr   label_D09F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D09E0::
    nop
    nop

label_D09E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A00
    jr   label_D0A02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D09F0::
    nop
    nop

label_D09F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A10
    jr   label_D0A12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A00::
    nop
    nop

label_D0A02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A20
    jr   label_D0A22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A10::
    nop
    nop

label_D0A12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A30
    jr   label_D0A32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A20::
    nop
    nop

label_D0A22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A40
    jr   label_D0A42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A30::
    nop
    nop

label_D0A32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A50
    jr   label_D0A52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A40::
    nop
    nop

label_D0A42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A60
    jr   label_D0A62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A50::
    nop
    nop

label_D0A52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A70
    jr   label_D0A72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A60::
    nop
    nop

label_D0A62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A80
    jr   label_D0A82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A70::
    nop
    nop

label_D0A72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0A90
    jr   label_D0A92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A80::
    nop
    nop

label_D0A82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0AA0
    jr   label_D0AA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0A90::
    nop
    nop

label_D0A92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0AB0
    jr   label_D0AB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0AA0::
    nop
    nop

label_D0AA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0AC0
    jr   label_D0AC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0AB0::
    nop
    nop

label_D0AB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0AD0
    jr   label_D0AD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0AC0::
    nop
    nop

label_D0AC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0AE0
    jr   label_D0AE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0AD0::
    nop
    nop

label_D0AD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0AF0
    jr   label_D0AF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0AE0::
    nop
    nop

label_D0AE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B00
    jr   label_D0B02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0AF0::
    nop
    nop

label_D0AF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B10
    jr   label_D0B12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B00::
    nop
    nop

label_D0B02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B20
    jr   label_D0B22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B10::
    nop
    nop

label_D0B12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B30
    jr   label_D0B32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B20::
    nop
    nop

label_D0B22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B40
    jr   label_D0B42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B30::
    nop
    nop

label_D0B32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B50
    jr   label_D0B52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B40::
    nop
    nop

label_D0B42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B60
    jr   label_D0B62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B50::
    nop
    nop

label_D0B52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B70
    jr   label_D0B72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B60::
    nop
    nop

label_D0B62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B80
    jr   label_D0B82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B70::
    nop
    nop

label_D0B72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0B90
    jr   label_D0B92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B80::
    nop
    nop

label_D0B82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0BA0
    jr   label_D0BA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0B90::
    nop
    nop

label_D0B92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0BB0
    jr   label_D0BB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0BA0::
    nop
    nop

label_D0BA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0BC0
    jr   label_D0BC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0BB0::
    nop
    nop

label_D0BB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0BD0
    jr   label_D0BD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0BC0::
    nop
    nop

label_D0BC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0BE0
    jr   label_D0BE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0BD0::
    nop
    nop

label_D0BD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0BF0
    jr   label_D0BF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0BE0::
    nop
    nop

label_D0BE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C00
    jr   label_D0C02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0BF0::
    nop
    nop

label_D0BF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C10
    jr   label_D0C12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C00::
    nop
    nop

label_D0C02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C20
    jr   label_D0C22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C10::
    nop
    nop

label_D0C12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C30
    jr   label_D0C32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C20::
    nop
    nop

label_D0C22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C40
    jr   label_D0C42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C30::
    nop
    nop

label_D0C32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C50
    jr   label_D0C52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C40::
    nop
    nop

label_D0C42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C60
    jr   label_D0C62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C50::
    nop
    nop

label_D0C52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C70
    jr   label_D0C72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C60::
    nop
    nop

label_D0C62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C80
    jr   label_D0C82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C70::
    nop
    nop

label_D0C72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0C90
    jr   label_D0C92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C80::
    nop
    nop

label_D0C82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0CA0
    jr   label_D0CA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0C90::
    nop
    nop

label_D0C92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0CB0
    jr   label_D0CB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0CA0::
    nop
    nop

label_D0CA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0CC0
    jr   label_D0CC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0CB0::
    nop
    nop

label_D0CB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0CD0
    jr   label_D0CD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0CC0::
    nop
    nop

label_D0CC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0CE0
    jr   label_D0CE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0CD0::
    nop
    nop

label_D0CD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0CF0
    jr   label_D0CF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0CE0::
    nop
    nop

label_D0CE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D00
    jr   label_D0D02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0CF0::
    nop
    nop

label_D0CF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D10
    jr   label_D0D12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D00::
    nop
    nop

label_D0D02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D20
    jr   label_D0D22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D10::
    nop
    nop

label_D0D12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D30
    jr   label_D0D32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D20::
    nop
    nop

label_D0D22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D40
    jr   label_D0D42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D30::
    nop
    nop

label_D0D32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D50
    jr   label_D0D52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D40::
    nop
    nop

label_D0D42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D60
    jr   label_D0D62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D50::
    nop
    nop

label_D0D52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D70
    jr   label_D0D72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D60::
    nop
    nop

label_D0D62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D80
    jr   label_D0D82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D70::
    nop
    nop

label_D0D72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0D90
    jr   label_D0D92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D80::
    nop
    nop

label_D0D82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0DA0
    jr   label_D0DA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0D90::
    nop
    nop

label_D0D92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0DB0
    jr   label_D0DB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0DA0::
    nop
    nop

label_D0DA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0DC0
    jr   label_D0DC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0DB0::
    nop
    nop

label_D0DB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0DD0
    jr   label_D0DD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0DC0::
    nop
    nop

label_D0DC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h

label_D0DC6::
    jr   label_D0DE0
    jr   label_D0DE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0DD0::
    nop
    nop

label_D0DD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0DF0
    jr   label_D0DF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0DE0::
    nop
    nop

label_D0DE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0E00
    jr   label_D0E02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0DF0::
    nop
    nop

label_D0DF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D0E10
    jr   label_D0E12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D0E00::
    rlca
    nop

label_D0E02::
    dec  bc
    rlca
    rra
    rrca
    cpl
    rra
    ccf
    inc  de
    ccf
    inc  de
    dec  sp
    rla
    cpl
    dec  e

label_D0E10::
    rra
    rrca

label_D0E12::
    ccf
    dec  bc
    ld   a, a
    jr   nc, label_D0E92
    inc  [hl]
    jr   c, label_D0E21
    inc  e
    inc  bc
    ccf
    inc  e
    ccf
    nop
    ld   [rJOYP], a
    sub  a, b
    ld   [$FFF8], a
    ld   a, [$FFFC]

label_D0E27::
    ld    hl, sp+$DC
    jr   c, label_D0E27
    jr   label_D0EA9
    sbc  a, b
    db   $F4 ; Undefined instruction
    ld    hl, sp+$DC
    ld   [$FFD2], a
    ld   l, h
    rst  $20
    jr   label_D0DC6
    db   $76 ; Halt
    rrca
    or   $06
    ld    hl, sp+$9E
    ld   h, b
    ld   a, [$FF00]
    rlca
    nop
    dec  bc
    rlca
    ld   e, $0F
    dec  l
    rra
    ccf
    rra
    ccf
    rra
    cpl
    rra
    scf
    inc  c
    ld   c, a
    jr   nc, label_D0E9A
    jr   c, label_D0E75
    rra
    db   $10 ; Undefined instruction
    ld   h, $19
    cpl
    ld   d, $3F
    ld   c, $3F
    nop
    ld   [rJOYP], a
    ld   d, b
    ld   [$FFF8], a
    ld   a, [$FF74]
    ld    hl, sp+$F4
    ld    hl, sp+$F4
    ld    hl, sp+$F4
    ld    hl, sp+$C8
    ld   [hl], b
    db   $F4 ; Undefined instruction
    ld   [label_D3886], sp
    rlca

label_D0E75::
    ld   a, [$F60F]
    ld   e, $E0
    inc  b
    ld    hl, sp+$9C
    ld   h, b
    ld   a, [$FF00]
    rlca
    nop
    dec  bc
    rlca
    rla
    rrca
    rra
    rrca
    rra
    ld   b, $1F
    ld   b, $1F
    ld   b, $17
    dec  bc
    rla
    rrca

label_D0E92::
    rra
    dec  b
    ccf
    db   $10 ; Undefined instruction
    rla
    db   $10 ; Undefined instruction

label_D0E9A::
    ld   de, label_1B0E
    dec  b
    rrca
    nop
    ld   [rJOYP], a
    ld    hl, sp+$E0
    db   $F4 ; Undefined instruction
    ld    hl, sp+$FC
    ld    hl, sp+$FC

label_D0EA9::
    ld   a, b
    db   $FC ; Undefined instruction

label_D0EAB::
    ld   a, b
    db   $F4 ; Undefined instruction
    ld   a, b
    db   $E8 ; add  sp, d
    ld   a, [$FFF0]
    add  a, b
    ld   c, b
    or   b
    db   $E4 ; Undefined instruction
    jr   label_D0EAB
    ld   l, b
    db   $FC ; Undefined instruction
    ld   h, b
    db   $F4 ; Undefined instruction
    ld   [$ECF2], sp
    db   $FC ; Undefined instruction

label_D0EBF::
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
    rrca
    rla
    inc  c
    rla
    inc  c
    rla
    inc  c
    rra
    rlca
    rla
    ld   c, $1F
    ld   b, $0F
    ld   bc, label_50B
    add  hl, de
    ld   b, $34
    dec  de
    ccf
    nop
    nop
    nop
    ld   a, [$FF00]
    db   $E8 ; add  sp, d
    ld   a, [$FFF4]
    ld    hl, sp+$FC
    ld    hl, sp+$FC
    ld    hl, sp+$FC
    ld    hl, sp+$F4
    ld    hl, sp+$C8
    ld   a, [$FFF0]
    nop
    ret  z
    jr   nc, label_D0EBF
    or   b
    call nc, label_F2A8
    inc  c
    ld   a, [$FC74]
    nop
    nop
    nop
    inc  bc
    nop
    rlca
    inc  bc
    rra
    inc  b
    cpl
    inc  d
    ld   b, a
    db   $3A ; ldd  a, [hl]
    add  a, e
    ld   a, l
    adc  a, c
    db   $76 ; Halt
    ld   d, b
    cpl
    inc  a
    inc  bc
    rra
    inc  c
    cpl
    inc  de
    inc  hl

label_D0F19::
    inc  e
    db   $10 ; Undefined instruction
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
    jr   nc, label_D0F4B
    jr   label_D0F45
    rrca
    nop
    inc  bc
    nop
    inc  b
    inc  bc
    add  hl, bc

label_D0F45::
    rlca
    add  hl, bc
    rlca
    ld   [label_A07], sp

label_D0F4B::
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   a, [bc]
    dec  b
    ld   [label_807], sp
    rlca
    jr   label_D0F61
    jr   label_D0F63
    inc  e
    inc  bc
    rrca
    nop
    nop

label_D0F61::
    nop
    nop

label_D0F63::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   c, label_D0F74

label_D0F74::
    ld   [hl], h
    jr   c, label_D0F19
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
    jr   label_D0FB6
    jr   label_D1008
    jr   z, label_D1006
    inc  l
    ld   e, h
    inc  sp
    cpl
    inc  e
    ld   a, e
    rlca
    ld   [hl], a
    jr   label_D0FDC
    db   $10 ; Undefined instruction
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
    jr   z, label_D1008
    scf
    jr   c, label_D0FC7
    ccf
    db   $10 ; Undefined instruction
    ld   [label_277F], sp

label_D0FB6::
    ld   [hl], a
    jr   z, label_D0FEC
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

label_D0FC7::
    ld   [$FFFE], a
    or   h
    cp   $B4
    db   $3A ; ldd  a, [hl]

label_D0FCD::
    db   $FC ; Undefined instruction
    inc  a
    ret  z
    db   $FC ; Undefined instruction
    jr   label_D0FCD
    inc  [hl]
    ld   a, [$FF00+C]
    ld   a, [$FC34]
    or   b
    jr   c, label_D0F9C

label_D0FDC::
    db   $FC ; Undefined instruction
    nop
    ld   a, [$FF00]
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

label_D0FEC::
    ld   a, a
    jr   label_D0FEE
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
    ld   b, d
    ld   b, d
    inc  h
    inc  h

label_D1006::
    jr   label_D1020

label_D1008::
    jr   label_D1022
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1030
    jr   label_D1032
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1020::
    nop
    nop

label_D1022::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1040
    jr   label_D1042
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1030::
    nop
    nop

label_D1032::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1050
    jr   label_D1052
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1040::
    nop
    nop

label_D1042::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1060
    jr   label_D1062
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1050::
    nop
    nop

label_D1052::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1070
    jr   label_D1072
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1060::
    nop
    nop

label_D1062::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1080
    jr   label_D1082
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1070::
    nop
    nop

label_D1072::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1090
    jr   label_D1092
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1080::
    nop
    nop

label_D1082::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D10A0
    jr   label_D10A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1090::
    nop
    nop

label_D1092::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D10B0
    jr   label_D10B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D10A0::
    nop
    nop

label_D10A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D10C0
    jr   label_D10C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D10B0::
    nop
    nop

label_D10B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D10D0
    jr   label_D10D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D10C0::
    nop
    nop

label_D10C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D10E0
    jr   label_D10E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D10D0::
    nop
    nop

label_D10D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D10F0
    jr   label_D10F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D10E0::
    nop
    nop

label_D10E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1100
    jr   label_D1102
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D10F0::
    nop
    nop

label_D10F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1110
    jr   label_D1112
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1100::
    nop
    nop

label_D1102::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1120
    jr   label_D1122
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1110::
    nop
    nop

label_D1112::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1130
    jr   label_D1132
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1120::
    nop
    nop

label_D1122::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1140
    jr   label_D1142
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1130::
    nop
    nop

label_D1132::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1150
    jr   label_D1152
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1140::
    nop
    nop

label_D1142::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1160
    jr   label_D1162
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1150::
    nop
    nop

label_D1152::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1170
    jr   label_D1172
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1160::
    nop
    nop

label_D1162::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1180
    jr   label_D1182
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1170::
    nop
    nop

label_D1172::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1190
    jr   label_D1192
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1180::
    nop
    nop

label_D1182::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D11A0
    jr   label_D11A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1190::
    nop
    nop

label_D1192::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D11B0
    jr   label_D11B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D11A0::
    nop
    nop

label_D11A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D11C0
    jr   label_D11C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D11B0::
    nop
    nop

label_D11B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D11D0
    jr   label_D11D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D11C0::
    nop
    nop

label_D11C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D11E0
    jr   label_D11E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D11D0::
    nop
    nop

label_D11D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D11F0
    jr   label_D11F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D11E0::
    nop
    nop

label_D11E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1200
    jr   label_D1202
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D11F0::
    nop
    nop

label_D11F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1210
    jr   label_D1212
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1200::
    nop
    nop

label_D1202::
    nop
    nop
    ld   a, $00
    ld   a, a
    inc  e
    ld   a, a
    ld   a, $7F
    ld   [hl], $7F
    ld   [hl], $7F
    ld   [hl], $7F
    jr   nc, label_D1292
    jr   nc, label_D1294
    ld   [hl], $7F
    ld   [hl], $7F
    ld   [hl], $7F
    ld   a, $7F
    inc  e
    ld   a, $00
    nop
    nop
    nop
    nop
    nop
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
    ld   h, a
    rst  $38
    or   l
    rst  $38
    dec  [hl]
    rst  $38
    ld   [hl], l
    rst  $38
    or   l
    rst  $38
    or   l
    rst  $38
    ld   [hl], l
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
    cp   l
    nop
    rst  $38
    jr   label_D1252
    or   l
    rst  $38
    or   l
    rst  $38
    or   c
    rst  $38
    or   l
    rst  $38
    or   l
    rst  $38
    sbc  a, b
    db   $FD ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    ld   e, $00
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    ld   e, $0C
    cp   $0C
    cp   $CC
    cp   $AC
    cp   $AC
    cp   $EC
    cp   $8C
    cp   $AC
    cp   $CC
    cp   $00
    nop
    nop
    rlca
    nop
    rra
    inc  bc
    ccf
    rrca
    ccf
    ld   e, $7F
    inc  e
    ld   a, a
    inc  a
    ld   a, a
    jr   c, label_D1310
    jr   c, label_D1312
    jr   c, label_D1314
    jr   c, label_D1316
    jr   c, label_D1318
    dec  e
    ccf
    rra
    ccf
    rlca
    rrca
    nop
    nop
    nop
    jp   label_F300
    add  a, c
    ei
    pop  hl
    ei
    pop  hl
    ei
    ld   [hl], c
    ei
    ld   [hl], c
    rst  $38
    ld   [hl], c
    rst  $38
    ld   [hl], e
    rst  $38
    ld   [hl], e
    rst  $38
    di
    rst  $38
    rst  $20
    rst  $38
    rst  $20
    rst  $38
    rst  0
    rst  $28
    ld   [bc], a
    add  a, a
    nop
    nop
    nop
    nop
    nop
    inc  e
    nop
    ld   a, $1C
    ld   a, a
    ld   a, $FF
    db   $76 ; Halt
    rst  $38
    ld   h, [hl]
    ld   l, a
    ld   b, $1F
    ld   c, $3F
    inc  e
    ld   a, $18
    inc  e
    nop
    inc  a
    jr   label_D1357
    jr   c, label_D1359
    jr   nc, label_D1317
    nop
    rlca
    rlca
    rra
    jr   label_D1324
    inc  hl
    ld   a, l
    ld   c, [hl]
    ld   [hl], e
    ld   e, h
    and  $B9
    and  $B9
    and  $B9
    add  a, $B9
    rst  0
    cp   b
    add  a, $B9
    ld   h, [hl]
    ld   e, c
    ld   [hl], b
    ld   c, a
    inc  a
    inc  hl
    rra
    jr   label_D1306
    rlca
    rlca
    rlca
    rra
    jr   label_D1344
    inc  hl

label_D1306::
    ld   a, h
    ld   c, a
    ld   [hl], a
    ld   e, b
    and  $B9
    and  $B9
    rst  $20
    cp   b

label_D1310::
    add  a, $B9

label_D1312::
    add  a, $B9

label_D1314::
    add  a, $B9

label_D1316::
    ld   h, a

label_D1317::
    ld   e, b

label_D1318::
    ld   [hl], b
    ld   c, a
    inc  a
    inc  hl
    rra
    jr   label_D1326
    rlca
    ld   [$FFE0], a
    ld    hl, sp+$18

label_D1324::
    db   $FC ; Undefined instruction
    call nz, label_F23E
    adc  a, $3A
    ld   h, a
    sbc  a, l
    ld   h, a
    sbc  a, l
    rst  0
    dec  a
    ld   h, e
    sbc  a, l
    ld   h, e
    sbc  a, l
    ld   h, e
    sbc  a, l
    add  a, $3A
    ld   c, $F2
    inc  a
    call nz, label_18F8
    ld   [$FFE0], a
    nop
    nop
    nop
    nop

label_D1344::
    ld   a, a
    nop
    ld   a, a
    ld   a, $7F
    ccf
    ld   a, a
    inc  sp
    ld   a, a
    inc  sp
    ld   a, a
    inc  sp
    ld   a, a
    inc  sp
    ld   a, a
    ccf
    ld   a, a
    ld   a, $7F

label_D1357::
    jr   nc, label_D13D1

label_D1359::
    jr   nc, label_D13D3
    jr   nc, label_D13D5
    jr   nc, label_D13D7
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
    add  a, e
    nop
    add  a, e
    ld   bc, label_1FF
    rst  $38

label_D1373::
    ld   l, h
    rst  $38

label_D1375::
    ld   a, l
    rst  $38

label_D1377::
    ld   [hl], c
    ei

label_D1379::
    ld   h, c
    di

label_D137B::
    ld   h, c
    di
    ld   h, c
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
    nop
    nop
    nop
    ret  nz
    nop
    ret  nz
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   [hl], $FF
    cp   a
    rst  $38
    or   e
    rst  $38
    or   e
    rst  $38
    or   e
    rst  $38
    or   e
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
    inc  a
    nop
    rst  $38
    jr   label_D13B2
    ld   a, [hl]
    rst  $38
    jr   label_D1373
    jr   label_D1375
    jr   label_D1377
    jr   label_D1379
    jr   label_D137B
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    rrca
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38

label_D13D1::
    ld   l, l
    rst  $38

label_D13D3::
    ld   l, l
    rst  $38

label_D13D5::
    ld   l, l
    rst  $38

label_D13D7::
    ld   l, l
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
    cp   [hl]
    nop
    rst  $38
    inc  e
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    sbc  a, [hl]
    rst  $38
    ld   b, $7F
    ld   [hl], $7F
    inc  e
    ld   a, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_3300
    ld   bc, label_317B
    ld   a, c
    jr   nc, label_D144B
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sbc  a, [hl]
    inc  c
    sbc  a, $8C
    call z, label_8080
    nop
    nop
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
    cp   $7C
    cp   $7C
    cp   $60
    ld   a, [$FF60]
    db   $FC ; Undefined instruction
    ld   h, b
    rst  $38
    ld   a, b
    rst  $38
    ld   a, c
    rst  $38
    ld   h, c
    di
    ld   h, c
    rst  $38
    ld   h, c
    rst  $38
    ld   a, l
    rst  $38
    ld   a, l
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
    cp   [hl]
    nop
    rst  $38
    or   [hl]
    rst  $38
    rst  $30
    rst  $38
    rst  0
    rst  $28
    add  a, [hl]
    rst  8
    add  a, [hl]
    rst  8
    add  a, [hl]
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
    rst  $28
    nop
    rst  $38
    rst  8
    rst  $38
    reti
    rst  $38
    add  hl, de
    cp   a
    add  hl, de
    ccf
    add  hl, de
    rra
    rrca
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
    ld   [hl], a
    nop
    rst  $38
    ld   [hl], $FF
    cp   [hl]
    rst  $38
    cp   b
    db   $FC ; Undefined instruction
    or   b
    ld    hl, sp+$B0
    ld    hl, sp+$30
    ld   a, b
    nop
    nop
    nop
    ld   a, [hl]
    nop
    rst  $38
    inc  a
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
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   h, [hl]
    rst  $38
    ld   a, [hl]
    rst  $38
    inc  a
    ld   a, [hl]
    nop
    nop
    nop
    jr   label_D14E4

label_D14E4::
    inc  a
    jr   label_D1565
    inc  a
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    inc  a
    ld   a, [hl]
    jr   c, label_D156D
    jr   c, label_D156F

label_D14F3::
    jr   nc, label_D156D
    jr   nc, label_D1527
    nop
    ld   a, b
    jr   nc, label_D14F3
    ld   [hl], b
    ld    hl, sp+$60
    ld   [hl], b

label_D14FF::
    nop
    nop

label_D1501::
    nop
    jr   c, label_D1504

label_D1504::
    ld   a, b
    jr   nc, label_D14FF
    jr   nc, label_D1501
    ld   [hl], b
    ld    hl, sp+$70
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$30
    ld    hl, sp+$30
    db   $FC ; Undefined instruction
    jr   nc, label_D1517
    ld   a, b
    db   $FC ; Undefined instruction
    ld   a, b
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $78
    cp   $FC
    cp   $CC
    cp   $CC
    cp   $0C
    cp   $1C
    db   $FC ; Undefined instruction
    jr   c, label_D152B
    ld   [hl], b
    ld   a, [$FF60]
    ld   a, [$FFE0]
    cp   $C0
    cp   $FC
    cp   $FC
    cp   $00
    nop
    nop
    db   $FC ; Undefined instruction
    nop
    cp   $78
    cp   $FC
    cp   $CC
    cp   $CC
    cp   $0C
    db   $FC ; Undefined instruction
    jr   c, label_D154D

label_D1551::
    jr   c, label_D1551
    inc  c
    cp   $CC
    cp   $CC
    cp   $CC
    cp   $FC
    cp   $78
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    ld   a, $00
    ld   a, $1C
    ld   a, [hl]
    inc  e
    ld   a, [hl]
    inc  a
    cp   $3C
    cp   $7C
    cp   $6C
    cp   $EC
    cp   $CC
    rst  $38
    call z, label_FEFF
    rst  $38
    cp   $FF
    inc  c
    ld   e, $0C
    ld   e, $00
    rlca
    nop
    ld   e, $01
    ccf
    nop
    ld   a, a
    nop
    ld   a, a
    inc  bc
    rst  $38
    inc  b
    rst  $38
    inc  b
    rst  $38
    inc  bc
    rst  $38
    nop
    rst  $38
    nop
    db   $FD ; Undefined instruction
    ld   [bc], a
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
    ld   [rJOYP], a
    ld   a, b
    add  a, b
    db   $FC ; Undefined instruction
    nop
    cp   $00
    cp   $00
    rst  $38
    add  a, b
    rst  $38
    add  a, b
    rst  $38
    ld   [bc], a
    rst  $38
    ld   b, $FF
    ld   a, [de]
    rst  $38
    ret  z
    cp   $40
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
    ld   b, $7F
    add  hl, bc
    rst  $38
    add  hl, bc
    rst  $38
    ld   b, $FF
    nop
    rst  $38
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    inc  bc
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
    ld   [rJOYP], a
    ld   a, b
    add  a, b
    db   $FC ; Undefined instruction
    nop
    cp   $00
    rst  $38
    ld   b, $FF
    ld   a, [bc]
    rst  $38
    ld   a, [de]
    cp   $38
    db   $FC ; Undefined instruction
    ld   b, b
    ld   a, [$FFC4]
    ld   [bc], a
    ccf
    jp   nz, label_3CDE
    db   $FC ; Undefined instruction
    nop
    ld    hl, sp+$00
    ld   [rJOYP], a
    jr   c, label_D1602

label_D1602::
    ld   d, h
    jr   c, label_D1684
    jr   c, label_D1661
    dec  a
    add  hl, sp
    rra
    ccf
    rrca
    rla
    rrca
    ld   a, a
    rlca
    or   a
    ld   a, a
    cp   $7F
    xor  c
    db   $76 ; Halt
    ld   a, a
    ld   bc, $0103
    inc  bc
    ld   bc, $0003
    ld   bc, $0000
    nop
    nop
    nop
    ld   [rJOYP], a
    ld   d, b
    ld   [$FFE8], a
    ld   a, [$FFF8]
    ld   a, [$FFF8]
    ld   a, [$FFF8]
    ld   a, [$FF98]
    ld   [rUNKN4], a
    ld    hl, sp+$FA
    db   $FC ; Undefined instruction
    cp   $CC
    ld   a, [$FC8C]
    sbc  a, b
    db   $EC ; Undefined instruction
    ld   a, [$FFF0]
    nop
    nop
    nop
    adc  a, $00
    rst  $18
    add  a, h
    rst  $38
    adc  a, [hl]
    rst  $38
    sbc  a, [hl]
    rst  $38
    cp   h
    cp   $F0
    ld    hl, sp+$E0
    ld   a, [$FFE0]
    ld    hl, sp+$B0
    db   $FC ; Undefined instruction
    or   b
    cp   $18
    cp   [hl]
    inc  e
    cp   [hl]
    inc  e
    cp   [hl]
    ld   [$001C], sp
    nop

label_D1661::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FF00]
    ld   a, [$FF60]
    rst  $38
    ld   h, b
    rst  $38
    rrca
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    ld   l, l
    rst  $38
    nop
    ld   bc, $0100
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_D1684::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp   [hl]
    nop
    rst  $38
    inc  e
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    or   [hl]
    rst  $38
    sbc  a, [hl]
    rst  $38
    ld   b, $FF
    add  a, $FF
    ld   a, h
    cp   $00
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D16A8
    db   $10 ; Undefined instruction
    jr   z, label_D16AC
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
    jr   z, label_D16B8
    db   $10 ; Undefined instruction
    jr   z, label_D16BC
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
    jr   z, label_D16C8
    db   $10 ; Undefined instruction
    jr   z, label_D16CC
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
    jr   z, label_D16D8
    db   $10 ; Undefined instruction
    jr   z, label_D16DC
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
    jr   z, label_D16E8
    db   $10 ; Undefined instruction
    jr   z, label_D16EC
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
    jr   z, label_D16F8
    db   $10 ; Undefined instruction
    jr   z, label_D16FC
    ld   b, h
    rst  $38
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, label_301
    ld   bc, $0103
    ld   bc, label_301
    ld   bc, $0103
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
    ccf
    nop
    jr   nz, label_D1734
    jr   nz, label_D1736
    jr   nz, label_D1738
    jr   nz, label_D173A
    inc  hl
    rrca
    ld   h, $0F
    ld   h, $00
    rst  $38
    nop
    nop

label_D1734::
    rst  $38
    nop

label_D1736::
    rst  $38
    nop

label_D1738::
    rst  $38
    nop

label_D173A::
    rst  $38
    add  a, $FF
    ld   h, [hl]
    rst  $38
    ld   h, a
    nop
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    ld   h, h
    db   $F4 ; Undefined instruction
    call nz, label_84F4
    nop
    ccf
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction

label_D1758::
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    nop
    sbc  a, h
    nop
    sbc  a, c
    nop
    add  hl, de
    nop
    add  hl, de
    nop
    sbc  a, h
    nop
    rst  $38
    nop
    db   $FC ; Undefined instruction
    jr   label_D1758
    ld   [label_834], sp
    sub  a, h
    ld   [label_894], sp
    sub  a, h
    ld   [$0034], sp
    rst  $38
    rlca
    rlca
    ld   e, $18
    cpl
    jr   nc, label_D17DA
    ld   l, a
    ld   c, l

label_D1789::
    db   $FD ; Undefined instruction
    pop  de
    ld   sp, hl
    ld   [hl], e
    ld   sp, hl
    inc  hl
    ld   [hl], c
    ld   [$FFE0], a
    ld   a, b
    jr   label_D1789
    inc  c
    jp   z, label_B6F6
    cp   e
    adc  a, e
    sbc  a, a
    adc  a, [hl]
    sbc  a, a
    add  a, h
    adc  a, [hl]
    rrca
    ld   h, $0F
    ld   h, $0F
    inc  hl
    rrca
    jr   nz, label_D17B8
    jr   nz, label_D17BA
    jr   nz, label_D17AD

label_D17AD::
    jr   nz, label_D17CE
    ccf
    rst  $38
    ld   h, a
    rst  $38
    ld   h, [hl]
    rst  $38
    add  a, $FF
    nop

label_D17B8::
    rst  $38
    nop

label_D17BA::
    rst  $38
    nop
    nop
    nop
    rst  $38
    rst  $38
    db   $F4 ; Undefined instruction
    call nz, label_E4F4
    db   $F4 ; Undefined instruction
    ld   h, h
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    db   $F4 ; Undefined instruction
    inc  b
    inc  b
    inc  b

label_D17CE::
    db   $FC ; Undefined instruction
    db   $FC ; Undefined instruction
    ld   [$0084], sp
    or   l
    nop
    or   l
    ld   [$0084], sp
    cp   l

label_D17DA::
    jr   label_D17C3
    rra
    jr   nz, label_D17DF

label_D17DF::
    ccf
    nop
    ld   h, l
    nop
    and  h
    nop
    and  h
    nop
    ld   h, l
    add  a, b
    dec  h
    nop
    rst  $38
    rst  $38
    nop
    nop
    rst  $38
    nop
    and  c
    nop
    or   e
    nop
    ldd  [hl], a
    nop
    ldd  [hl], a
    nop
    or   d
    nop
    cp   $F8
    inc  b
    nop
    db   $FC ; Undefined instruction
    nop
    nop
    nop
    nop
    nop
    nop
    ld   h, [hl]
    nop
    ld   h, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr   label_D1814

label_D1814::
    jr   label_D1816

label_D1816::
    nop
    nop
    nop
    nop
    jr   label_D181C

label_D181C::
    jr   label_D181E

label_D181E::
    nop
    nop
    nop
    nop
    jr   label_D1824

label_D1824::
    jr   label_D1826

label_D1826::
    ld   a, [hl]
    nop
    ld   a, [hl]
    nop
    jr   label_D182C

label_D182C::
    jr   label_D182E

label_D182E::
    nop
    nop
    rst  $38
    nop
    rst  $38
    nop
    rst  $38
    ld   b, h
    rst  $38
    jr   z, label_D1838
    db   $10 ; Undefined instruction
    jr   z, label_D183C
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
    jr   z, label_D1848
    db   $10 ; Undefined instruction
    jr   z, label_D184C
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
    jr   z, label_D1858
    db   $10 ; Undefined instruction
    jr   z, label_D185C
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
    jr   z, label_D1868
    db   $10 ; Undefined instruction
    jr   z, label_D186C
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
    jr   z, label_D1878
    db   $10 ; Undefined instruction
    jr   z, label_D187C
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
    jr   z, label_D1888
    db   $10 ; Undefined instruction
    jr   z, label_D188C
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
    jr   z, label_D1898
    db   $10 ; Undefined instruction
    jr   z, label_D189C
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
    jr   z, label_D18A8
    db   $10 ; Undefined instruction
    jr   z, label_D18AC
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
    jr   z, label_D18B8
    db   $10 ; Undefined instruction
    jr   z, label_D18BC
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
    jr   z, label_D18C8
    db   $10 ; Undefined instruction
    jr   z, label_D18CC
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
    jr   z, label_D18D8
    db   $10 ; Undefined instruction
    jr   z, label_D18DC
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
    jr   z, label_D18E8
    db   $10 ; Undefined instruction
    jr   z, label_D18EC
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
    jr   z, label_D18F8
    db   $10 ; Undefined instruction
    jr   z, label_D18FC
    ld   b, h
    rst  $38
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1920
    jr   label_D1922
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
    nop
    nop
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1930
    jr   label_D1932
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1920::
    nop
    nop

label_D1922::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1940
    jr   label_D1942
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1930::
    nop
    nop

label_D1932::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1950
    jr   label_D1952
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1940::
    nop
    nop

label_D1942::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1960
    jr   label_D1962
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1950::
    nop
    nop

label_D1952::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1970
    jr   label_D1972
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1960::
    nop
    nop

label_D1962::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1980
    jr   label_D1982
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1970::
    nop
    nop

label_D1972::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1990
    jr   label_D1992
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1980::
    nop
    nop

label_D1982::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D19A0
    jr   label_D19A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1990::
    nop
    nop

label_D1992::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D19B0
    jr   label_D19B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D19A0::
    nop
    nop

label_D19A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D19C0
    jr   label_D19C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D19B0::
    nop
    nop

label_D19B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D19D0
    jr   label_D19D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D19C0::
    nop
    nop

label_D19C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D19E0
    jr   label_D19E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D19D0::
    nop
    nop

label_D19D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D19F0
    jr   label_D19F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D19E0::
    nop
    nop

label_D19E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A00
    jr   label_D1A02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D19F0::
    nop
    nop

label_D19F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A10
    jr   label_D1A12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A00::
    nop
    nop

label_D1A02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A20
    jr   label_D1A22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A10::
    nop
    nop

label_D1A12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A30
    jr   label_D1A32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A20::
    nop
    nop

label_D1A22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A40
    jr   label_D1A42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A30::
    nop
    nop

label_D1A32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A50
    jr   label_D1A52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A40::
    nop
    nop

label_D1A42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A60
    jr   label_D1A62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A50::
    nop
    nop

label_D1A52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A70
    jr   label_D1A72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A60::
    nop
    nop

label_D1A62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A80
    jr   label_D1A82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A70::
    nop
    nop

label_D1A72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1A90
    jr   label_D1A92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A80::
    nop
    nop

label_D1A82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1AA0
    jr   label_D1AA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1A90::
    nop
    nop

label_D1A92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1AB0
    jr   label_D1AB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1AA0::
    nop
    nop

label_D1AA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1AC0
    jr   label_D1AC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1AB0::
    nop
    nop

label_D1AB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1AD0
    jr   label_D1AD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1AC0::
    nop
    nop

label_D1AC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1AE0
    jr   label_D1AE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1AD0::
    nop
    nop

label_D1AD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1AF0
    jr   label_D1AF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1AE0::
    nop
    nop

label_D1AE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B00
    jr   label_D1B02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1AF0::
    nop
    nop

label_D1AF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B10
    jr   label_D1B12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B00::
    nop
    nop

label_D1B02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B20
    jr   label_D1B22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B10::
    nop
    nop

label_D1B12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B30
    jr   label_D1B32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B20::
    nop
    nop

label_D1B22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B40
    jr   label_D1B42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B30::
    nop
    nop

label_D1B32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B50
    jr   label_D1B52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B40::
    nop
    nop

label_D1B42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B60
    jr   label_D1B62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B50::
    nop
    nop

label_D1B52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B70
    jr   label_D1B72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B60::
    nop
    nop

label_D1B62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B80
    jr   label_D1B82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B70::
    nop
    nop

label_D1B72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1B90
    jr   label_D1B92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B80::
    nop
    nop

label_D1B82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1BA0
    jr   label_D1BA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1B90::
    nop
    nop

label_D1B92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1BB0
    jr   label_D1BB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1BA0::
    nop
    nop

label_D1BA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1BC0
    jr   label_D1BC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1BB0::
    nop
    nop

label_D1BB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1BD0
    jr   label_D1BD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1BC0::
    nop
    nop

label_D1BC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1BE0
    jr   label_D1BE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1BD0::
    nop
    nop

label_D1BD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1BF0
    jr   label_D1BF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1BE0::
    nop
    nop

label_D1BE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C00
    jr   label_D1C02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1BF0::
    nop
    nop

label_D1BF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C10
    jr   label_D1C12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C00::
    nop
    nop

label_D1C02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C20
    jr   label_D1C22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C10::
    nop
    nop

label_D1C12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C30
    jr   label_D1C32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C20::
    nop
    nop

label_D1C22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C40
    jr   label_D1C42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C30::
    nop
    nop

label_D1C32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C50
    jr   label_D1C52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C40::
    nop
    nop

label_D1C42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C60
    jr   label_D1C62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C50::
    nop
    nop

label_D1C52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C70
    jr   label_D1C72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C60::
    nop
    nop

label_D1C62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C80
    jr   label_D1C82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C70::
    nop
    nop

label_D1C72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1C90
    jr   label_D1C92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C80::
    nop
    nop

label_D1C82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1CA0
    jr   label_D1CA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1C90::
    nop
    nop

label_D1C92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1CB0
    jr   label_D1CB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1CA0::
    nop
    nop

label_D1CA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1CC0
    jr   label_D1CC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1CB0::
    nop
    nop

label_D1CB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1CD0
    jr   label_D1CD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1CC0::
    nop
    nop

label_D1CC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1CE0
    jr   label_D1CE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1CD0::
    nop
    nop

label_D1CD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1CF0
    jr   label_D1CF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1CE0::
    nop
    nop

label_D1CE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D00
    jr   label_D1D02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1CF0::
    nop
    nop

label_D1CF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D10
    jr   label_D1D12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D00::
    nop
    nop

label_D1D02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D20
    jr   label_D1D22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D10::
    nop
    nop

label_D1D12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D30
    jr   label_D1D32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D20::
    nop
    nop

label_D1D22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D40
    jr   label_D1D42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D30::
    nop
    nop

label_D1D32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D50
    jr   label_D1D52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D40::
    nop
    nop

label_D1D42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D60
    jr   label_D1D62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D50::
    nop
    nop

label_D1D52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D70
    jr   label_D1D72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D60::
    nop
    nop

label_D1D62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D80
    jr   label_D1D82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D70::
    nop
    nop

label_D1D72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1D90
    jr   label_D1D92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D80::
    nop
    nop

label_D1D82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1DA0
    jr   label_D1DA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1D90::
    nop
    nop

label_D1D92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1DB0
    jr   label_D1DB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1DA0::
    nop
    nop

label_D1DA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1DC0
    jr   label_D1DC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1DB0::
    nop
    nop

label_D1DB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1DD0
    jr   label_D1DD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1DC0::
    nop
    nop

label_D1DC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1DE0
    jr   label_D1DE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1DD0::
    nop
    nop

label_D1DD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1DF0
    jr   label_D1DF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1DE0::
    nop
    nop

label_D1DE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E00
    jr   label_D1E02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1DF0::
    nop
    nop

label_D1DF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E10
    jr   label_D1E12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E00::
    nop
    nop

label_D1E02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E20
    jr   label_D1E22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E10::
    nop
    nop

label_D1E12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E30
    jr   label_D1E32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E20::
    nop
    nop

label_D1E22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E40
    jr   label_D1E42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E30::
    nop
    nop

label_D1E32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E50
    jr   label_D1E52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E40::
    nop
    nop

label_D1E42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E60
    jr   label_D1E62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E50::
    nop
    nop

label_D1E52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E70
    jr   label_D1E72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E60::
    nop
    nop

label_D1E62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E80
    jr   label_D1E82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E70::
    nop
    nop

label_D1E72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1E90
    jr   label_D1E92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E80::
    nop
    nop

label_D1E82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1EA0
    jr   label_D1EA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1E90::
    nop
    nop

label_D1E92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1EB0
    jr   label_D1EB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1EA0::
    nop
    nop

label_D1EA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1EC0
    jr   label_D1EC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1EB0::
    nop
    nop

label_D1EB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1ED0
    jr   label_D1ED2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1EC0::
    nop
    nop

label_D1EC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1EE0
    jr   label_D1EE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1ED0::
    nop
    nop

label_D1ED2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1EF0
    jr   label_D1EF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1EE0::
    nop
    nop

label_D1EE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F00
    jr   label_D1F02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1EF0::
    nop
    nop

label_D1EF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F10
    jr   label_D1F12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F00::
    nop
    nop

label_D1F02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F20
    jr   label_D1F22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F10::
    nop
    nop

label_D1F12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F30
    jr   label_D1F32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F20::
    nop
    nop

label_D1F22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F40
    jr   label_D1F42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F30::
    nop
    nop

label_D1F32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F50
    jr   label_D1F52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F40::
    nop
    nop

label_D1F42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F60
    jr   label_D1F62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F50::
    nop
    nop

label_D1F52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F70
    jr   label_D1F72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F60::
    nop
    nop

label_D1F62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F80
    jr   label_D1F82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F70::
    nop
    nop

label_D1F72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1F90
    jr   label_D1F92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F80::
    nop
    nop

label_D1F82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1FA0
    jr   label_D1FA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1F90::
    nop
    nop

label_D1F92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1FB0
    jr   label_D1FB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1FA0::
    nop
    nop

label_D1FA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1FC0
    jr   label_D1FC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1FB0::
    nop
    nop

label_D1FB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1FD0
    jr   label_D1FD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1FC0::
    nop
    nop

label_D1FC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1FE0
    jr   label_D1FE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1FD0::
    nop
    nop

label_D1FD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D1FF0
    jr   label_D1FF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1FE0::
    nop
    nop

label_D1FE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2000
    jr   label_D2002
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D1FF0::
    nop
    nop

label_D1FF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2010
    jr   label_D2012
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2000::
    nop
    nop

label_D2002::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2020
    jr   label_D2022
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2010::
    nop
    nop

label_D2012::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2030
    jr   label_D2032
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2020::
    nop
    nop

label_D2022::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2040
    jr   label_D2042
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2030::
    nop
    nop

label_D2032::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2050
    jr   label_D2052
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2040::
    nop
    nop

label_D2042::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2060
    jr   label_D2062
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2050::
    nop
    nop

label_D2052::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2070
    jr   label_D2072
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2060::
    nop
    nop

label_D2062::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2080
    jr   label_D2082
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2070::
    nop
    nop

label_D2072::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2090
    jr   label_D2092
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2080::
    nop
    nop

label_D2082::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D20A0
    jr   label_D20A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2090::
    nop
    nop

label_D2092::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D20B0
    jr   label_D20B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D20A0::
    nop
    nop

label_D20A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D20C0
    jr   label_D20C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D20B0::
    nop
    nop

label_D20B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D20D0
    jr   label_D20D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D20C0::
    nop
    nop

label_D20C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D20E0
    jr   label_D20E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D20D0::
    nop
    nop

label_D20D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D20F0
    jr   label_D20F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D20E0::
    nop
    nop

label_D20E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2100
    jr   label_D2102
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D20F0::
    nop
    nop

label_D20F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2110
    jr   label_D2112
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2100::
    nop
    nop

label_D2102::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2120
    jr   label_D2122
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2110::
    nop
    nop

label_D2112::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2130
    jr   label_D2132
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2120::
    nop
    nop

label_D2122::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2140
    jr   label_D2142
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2130::
    nop
    nop

label_D2132::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2150
    jr   label_D2152
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2140::
    nop
    nop

label_D2142::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2160
    jr   label_D2162
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2150::
    nop
    nop

label_D2152::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2170
    jr   label_D2172
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2160::
    nop
    nop

label_D2162::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2180
    jr   label_D2182
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2170::
    nop
    nop

label_D2172::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2190
    jr   label_D2192
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2180::
    nop
    nop

label_D2182::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D21A0
    jr   label_D21A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2190::
    nop
    nop

label_D2192::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D21B0
    jr   label_D21B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D21A0::
    nop
    nop

label_D21A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D21C0
    jr   label_D21C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D21B0::
    nop
    nop

label_D21B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D21D0
    jr   label_D21D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D21C0::
    nop
    nop

label_D21C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D21E0
    jr   label_D21E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D21D0::
    nop
    nop

label_D21D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D21F0
    jr   label_D21F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D21E0::
    nop
    nop

label_D21E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2200
    jr   label_D2202
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D21F0::
    nop
    nop

label_D21F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2210
    jr   label_D2212
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2200::
    nop
    nop

label_D2202::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2220
    jr   label_D2222
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2210::
    nop
    nop

label_D2212::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2230
    jr   label_D2232
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2220::
    nop
    nop

label_D2222::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2240
    jr   label_D2242
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2230::
    nop
    nop

label_D2232::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2250
    jr   label_D2252
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2240::
    nop
    nop

label_D2242::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2260
    jr   label_D2262
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2250::
    nop
    nop

label_D2252::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2270
    jr   label_D2272
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2260::
    nop
    nop

label_D2262::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2280
    jr   label_D2282
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2270::
    nop
    nop

label_D2272::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2290
    jr   label_D2292
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2280::
    nop
    nop

label_D2282::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D22A0
    jr   label_D22A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2290::
    nop
    nop

label_D2292::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D22B0
    jr   label_D22B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D22A0::
    nop
    nop

label_D22A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D22C0
    jr   label_D22C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D22B0::
    nop
    nop

label_D22B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D22D0
    jr   label_D22D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D22C0::
    nop
    nop

label_D22C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D22E0
    jr   label_D22E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D22D0::
    nop
    nop

label_D22D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D22F0
    jr   label_D22F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D22E0::
    nop
    nop

label_D22E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2300
    jr   label_D2302
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D22F0::
    nop
    nop

label_D22F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2310
    jr   label_D2312
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2300::
    nop
    nop

label_D2302::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2320
    jr   label_D2322
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2310::
    nop
    nop

label_D2312::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2330
    jr   label_D2332
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2320::
    nop
    nop

label_D2322::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2340
    jr   label_D2342
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2330::
    nop
    nop

label_D2332::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2350
    jr   label_D2352
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2340::
    nop
    nop

label_D2342::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2360
    jr   label_D2362
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2350::
    nop
    nop

label_D2352::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2370
    jr   label_D2372
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2360::
    nop
    nop

label_D2362::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2380
    jr   label_D2382
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2370::
    nop
    nop

label_D2372::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2390
    jr   label_D2392
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2380::
    nop
    nop

label_D2382::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D23A0
    jr   label_D23A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2390::
    nop
    nop

label_D2392::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D23B0
    jr   label_D23B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D23A0::
    nop
    nop

label_D23A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D23C0
    jr   label_D23C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D23B0::
    nop
    nop

label_D23B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D23D0
    jr   label_D23D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D23C0::
    nop
    nop

label_D23C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D23E0
    jr   label_D23E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D23D0::
    nop
    nop

label_D23D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D23F0
    jr   label_D23F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D23E0::
    nop
    nop

label_D23E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2400
    jr   label_D2402
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D23F0::
    nop
    nop

label_D23F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2410
    jr   label_D2412
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2400::
    nop
    nop

label_D2402::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2420
    jr   label_D2422
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2410::
    nop
    nop

label_D2412::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2430
    jr   label_D2432
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2420::
    nop
    nop

label_D2422::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2440
    jr   label_D2442
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2430::
    nop
    nop

label_D2432::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2450
    jr   label_D2452
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2440::
    nop
    nop

label_D2442::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2460
    jr   label_D2462
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2450::
    nop
    nop

label_D2452::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2470
    jr   label_D2472
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2460::
    nop
    nop

label_D2462::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2480
    jr   label_D2482
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2470::
    nop
    nop

label_D2472::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2490
    jr   label_D2492
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2480::
    nop
    nop

label_D2482::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D24A0
    jr   label_D24A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2490::
    nop
    nop

label_D2492::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D24B0
    jr   label_D24B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D24A0::
    nop
    nop

label_D24A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D24C0
    jr   label_D24C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D24B0::
    nop
    nop

label_D24B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D24D0
    jr   label_D24D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D24C0::
    nop
    nop

label_D24C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D24E0
    jr   label_D24E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D24D0::
    nop
    nop

label_D24D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D24F0
    jr   label_D24F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D24E0::
    nop
    nop

label_D24E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2500
    jr   label_D2502
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D24F0::
    nop
    nop

label_D24F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2510
    jr   label_D2512
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2500::
    nop
    nop

label_D2502::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2520
    jr   label_D2522
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2510::
    nop
    nop

label_D2512::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2530
    jr   label_D2532
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2520::
    nop
    nop

label_D2522::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2540
    jr   label_D2542
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2530::
    nop
    nop

label_D2532::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2550
    jr   label_D2552
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2540::
    nop
    nop

label_D2542::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2560
    jr   label_D2562
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2550::
    nop
    nop

label_D2552::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2570
    jr   label_D2572
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2560::
    nop
    nop

label_D2562::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2580
    jr   label_D2582
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2570::
    nop
    nop

label_D2572::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2590
    jr   label_D2592
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2580::
    nop
    nop

label_D2582::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D25A0
    jr   label_D25A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2590::
    nop
    nop

label_D2592::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D25B0
    jr   label_D25B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D25A0::
    nop
    nop

label_D25A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D25C0
    jr   label_D25C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D25B0::
    nop
    nop

label_D25B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D25D0
    jr   label_D25D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D25C0::
    nop
    nop

label_D25C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D25E0
    jr   label_D25E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D25D0::
    nop
    nop

label_D25D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D25F0
    jr   label_D25F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D25E0::
    nop
    nop

label_D25E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2600
    jr   label_D2602
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D25F0::
    nop
    nop

label_D25F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2610
    jr   label_D2612
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2600::
    nop
    nop

label_D2602::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2620
    jr   label_D2622
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2610::
    nop
    nop

label_D2612::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2630
    jr   label_D2632
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2620::
    nop
    nop

label_D2622::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2640
    jr   label_D2642
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2630::
    nop
    nop

label_D2632::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2650
    jr   label_D2652
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2640::
    nop
    nop

label_D2642::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2660
    jr   label_D2662
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2650::
    nop
    nop

label_D2652::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2670
    jr   label_D2672
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2660::
    nop
    nop

label_D2662::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2680
    jr   label_D2682
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2670::
    nop
    nop

label_D2672::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2690
    jr   label_D2692
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2680::
    nop
    nop

label_D2682::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D26A0
    jr   label_D26A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2690::
    nop
    nop

label_D2692::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D26B0
    jr   label_D26B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D26A0::
    nop
    nop

label_D26A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D26C0
    jr   label_D26C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D26B0::
    nop
    nop

label_D26B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D26D0
    jr   label_D26D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D26C0::
    nop
    nop

label_D26C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D26E0
    jr   label_D26E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D26D0::
    nop
    nop

label_D26D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D26F0
    jr   label_D26F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D26E0::
    nop
    nop

label_D26E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2700
    jr   label_D2702
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D26F0::
    nop
    nop

label_D26F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2710
    jr   label_D2712
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2700::
    nop
    nop

label_D2702::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2720
    jr   label_D2722
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2710::
    nop
    nop

label_D2712::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2730
    jr   label_D2732
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2720::
    nop
    nop

label_D2722::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2740
    jr   label_D2742
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2730::
    nop
    nop

label_D2732::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2750
    jr   label_D2752
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2740::
    nop
    nop

label_D2742::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2760
    jr   label_D2762
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2750::
    nop
    nop

label_D2752::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2770
    jr   label_D2772
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2760::
    nop
    nop

label_D2762::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2780
    jr   label_D2782
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2770::
    nop
    nop

label_D2772::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2790
    jr   label_D2792
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2780::
    nop
    nop

label_D2782::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D27A0
    jr   label_D27A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2790::
    nop
    nop

label_D2792::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D27B0
    jr   label_D27B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D27A0::
    nop
    nop

label_D27A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D27C0
    jr   label_D27C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D27B0::
    nop
    nop

label_D27B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D27D0
    jr   label_D27D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D27C0::
    nop
    nop

label_D27C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D27E0
    jr   label_D27E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D27D0::
    nop
    nop

label_D27D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D27F0
    jr   label_D27F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D27E0::
    nop
    nop

label_D27E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2800
    jr   label_D2802
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D27F0::
    nop
    nop

label_D27F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2810
    jr   label_D2812
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2800::
    nop
    nop

label_D2802::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2820
    jr   label_D2822
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2810::
    nop
    nop

label_D2812::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2830
    jr   label_D2832
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2820::
    nop
    nop

label_D2822::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2840
    jr   label_D2842
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2830::
    nop
    nop

label_D2832::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2850
    jr   label_D2852
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2840::
    nop
    nop

label_D2842::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2860
    jr   label_D2862
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2850::
    nop
    nop

label_D2852::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2870
    jr   label_D2872
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2860::
    nop
    nop

label_D2862::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2880
    jr   label_D2882
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2870::
    nop
    nop

label_D2872::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2890
    jr   label_D2892
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2880::
    nop
    nop

label_D2882::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D28A0
    jr   label_D28A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2890::
    nop
    nop

label_D2892::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D28B0
    jr   label_D28B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D28A0::
    nop
    nop

label_D28A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D28C0
    jr   label_D28C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D28B0::
    nop
    nop

label_D28B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D28D0
    jr   label_D28D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D28C0::
    nop
    nop

label_D28C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D28E0
    jr   label_D28E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D28D0::
    nop
    nop

label_D28D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D28F0
    jr   label_D28F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D28E0::
    nop
    nop

label_D28E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2900
    jr   label_D2902
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D28F0::
    nop
    nop

label_D28F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2910
    jr   label_D2912
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2900::
    nop
    nop

label_D2902::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2920
    jr   label_D2922
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2910::
    nop
    nop

label_D2912::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2930
    jr   label_D2932
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2920::
    nop
    nop

label_D2922::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2940
    jr   label_D2942
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2930::
    nop
    nop

label_D2932::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2950
    jr   label_D2952
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2940::
    nop
    nop

label_D2942::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2960
    jr   label_D2962
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2950::
    nop
    nop

label_D2952::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2970
    jr   label_D2972
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2960::
    nop
    nop

label_D2962::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2980
    jr   label_D2982
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2970::
    nop
    nop

label_D2972::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2990
    jr   label_D2992
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2980::
    nop
    nop

label_D2982::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D29A0
    jr   label_D29A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2990::
    nop
    nop

label_D2992::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D29B0
    jr   label_D29B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D29A0::
    nop
    nop

label_D29A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D29C0
    jr   label_D29C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D29B0::
    nop
    nop

label_D29B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D29D0
    jr   label_D29D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D29C0::
    nop
    nop

label_D29C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D29E0
    jr   label_D29E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D29D0::
    nop
    nop

label_D29D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D29F0
    jr   label_D29F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D29E0::
    nop
    nop

label_D29E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A00
    jr   label_D2A02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D29F0::
    nop
    nop

label_D29F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A10
    jr   label_D2A12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A00::
    nop
    nop

label_D2A02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A20
    jr   label_D2A22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A10::
    nop
    nop

label_D2A12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A30
    jr   label_D2A32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A20::
    nop
    nop

label_D2A22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A40
    jr   label_D2A42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A30::
    nop
    nop

label_D2A32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A50
    jr   label_D2A52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A40::
    nop
    nop

label_D2A42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A60
    jr   label_D2A62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A50::
    nop
    nop

label_D2A52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A70
    jr   label_D2A72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A60::
    nop
    nop

label_D2A62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A80
    jr   label_D2A82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A70::
    nop
    nop

label_D2A72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2A90
    jr   label_D2A92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A80::
    nop
    nop

label_D2A82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2AA0
    jr   label_D2AA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2A90::
    nop
    nop

label_D2A92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2AB0
    jr   label_D2AB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2AA0::
    nop
    nop

label_D2AA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2AC0
    jr   label_D2AC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2AB0::
    nop
    nop

label_D2AB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2AD0
    jr   label_D2AD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2AC0::
    nop
    nop

label_D2AC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2AE0
    jr   label_D2AE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2AD0::
    nop
    nop

label_D2AD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2AF0
    jr   label_D2AF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2AE0::
    nop
    nop

label_D2AE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B00
    jr   label_D2B02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2AF0::
    nop
    nop

label_D2AF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B10
    jr   label_D2B12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B00::
    nop
    nop

label_D2B02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B20
    jr   label_D2B22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B10::
    nop
    nop

label_D2B12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B30
    jr   label_D2B32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B20::
    nop
    nop

label_D2B22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B40
    jr   label_D2B42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B30::
    nop
    nop

label_D2B32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B50
    jr   label_D2B52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B40::
    nop
    nop

label_D2B42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B60
    jr   label_D2B62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B50::
    nop
    nop

label_D2B52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B70
    jr   label_D2B72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B60::
    nop
    nop

label_D2B62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B80
    jr   label_D2B82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B70::
    nop
    nop

label_D2B72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2B90
    jr   label_D2B92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B80::
    nop
    nop

label_D2B82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2BA0
    jr   label_D2BA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2B90::
    nop
    nop

label_D2B92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2BB0
    jr   label_D2BB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2BA0::
    nop
    nop

label_D2BA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2BC0
    jr   label_D2BC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2BB0::
    nop
    nop

label_D2BB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2BD0
    jr   label_D2BD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2BC0::
    nop
    nop

label_D2BC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2BE0
    jr   label_D2BE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2BD0::
    nop
    nop

label_D2BD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2BF0
    jr   label_D2BF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2BE0::
    nop
    nop

label_D2BE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C00
    jr   label_D2C02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2BF0::
    nop
    nop

label_D2BF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C10
    jr   label_D2C12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C00::
    nop
    nop

label_D2C02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C20
    jr   label_D2C22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C10::
    nop
    nop

label_D2C12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C30
    jr   label_D2C32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C20::
    nop
    nop

label_D2C22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C40
    jr   label_D2C42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C30::
    nop
    nop

label_D2C32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C50
    jr   label_D2C52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C40::
    nop
    nop

label_D2C42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C60
    jr   label_D2C62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C50::
    nop
    nop

label_D2C52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C70
    jr   label_D2C72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C60::
    nop
    nop

label_D2C62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C80
    jr   label_D2C82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C70::
    nop
    nop

label_D2C72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2C90
    jr   label_D2C92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C80::
    nop
    nop

label_D2C82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2CA0
    jr   label_D2CA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2C90::
    nop
    nop

label_D2C92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2CB0
    jr   label_D2CB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2CA0::
    nop
    nop

label_D2CA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2CC0
    jr   label_D2CC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2CB0::
    nop
    nop

label_D2CB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2CD0
    jr   label_D2CD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2CC0::
    nop
    nop

label_D2CC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2CE0
    jr   label_D2CE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2CD0::
    nop
    nop

label_D2CD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2CF0
    jr   label_D2CF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2CE0::
    nop
    nop

label_D2CE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D00
    jr   label_D2D02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2CF0::
    nop
    nop

label_D2CF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D10
    jr   label_D2D12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D00::
    nop
    nop

label_D2D02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D20
    jr   label_D2D22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D10::
    nop
    nop

label_D2D12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D30
    jr   label_D2D32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D20::
    nop
    nop

label_D2D22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D40
    jr   label_D2D42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D30::
    nop
    nop

label_D2D32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D50
    jr   label_D2D52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D40::
    nop
    nop

label_D2D42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D60
    jr   label_D2D62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D50::
    nop
    nop

label_D2D52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D70
    jr   label_D2D72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D60::
    nop
    nop

label_D2D62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D80
    jr   label_D2D82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D70::
    nop
    nop

label_D2D72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2D90
    jr   label_D2D92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D80::
    nop
    nop

label_D2D82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2DA0
    jr   label_D2DA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2D90::
    nop
    nop

label_D2D92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2DB0
    jr   label_D2DB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2DA0::
    nop
    nop

label_D2DA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2DC0
    jr   label_D2DC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2DB0::
    nop
    nop

label_D2DB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2DD0
    jr   label_D2DD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2DC0::
    nop
    nop

label_D2DC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2DE0
    jr   label_D2DE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2DD0::
    nop
    nop

label_D2DD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2DF0
    jr   label_D2DF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2DE0::
    nop
    nop

label_D2DE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E00
    jr   label_D2E02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2DF0::
    nop
    nop

label_D2DF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E10
    jr   label_D2E12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E00::
    nop
    nop

label_D2E02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E20
    jr   label_D2E22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E10::
    nop
    nop

label_D2E12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E30
    jr   label_D2E32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E20::
    nop
    nop

label_D2E22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E40
    jr   label_D2E42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E30::
    nop
    nop

label_D2E32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E50
    jr   label_D2E52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E40::
    nop
    nop

label_D2E42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E60
    jr   label_D2E62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E50::
    nop
    nop

label_D2E52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E70
    jr   label_D2E72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E60::
    nop
    nop

label_D2E62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E80
    jr   label_D2E82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E70::
    nop
    nop

label_D2E72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2E90
    jr   label_D2E92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E80::
    nop
    nop

label_D2E82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2EA0
    jr   label_D2EA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2E90::
    nop
    nop

label_D2E92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2EB0
    jr   label_D2EB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2EA0::
    nop
    nop

label_D2EA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2EC0
    jr   label_D2EC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2EB0::
    nop
    nop

label_D2EB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2ED0
    jr   label_D2ED2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2EC0::
    nop
    nop

label_D2EC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2EE0
    jr   label_D2EE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2ED0::
    nop
    nop

label_D2ED2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2EF0
    jr   label_D2EF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2EE0::
    nop
    nop

label_D2EE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F00
    jr   label_D2F02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2EF0::
    nop
    nop

label_D2EF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F10
    jr   label_D2F12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F00::
    nop
    nop

label_D2F02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F20
    jr   label_D2F22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F10::
    nop
    nop

label_D2F12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F30
    jr   label_D2F32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F20::
    nop
    nop

label_D2F22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F40
    jr   label_D2F42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F30::
    nop
    nop

label_D2F32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F50
    jr   label_D2F52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F40::
    nop
    nop

label_D2F42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F60
    jr   label_D2F62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F50::
    nop
    nop

label_D2F52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F70
    jr   label_D2F72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F60::
    nop
    nop

label_D2F62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F80
    jr   label_D2F82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F70::
    nop
    nop

label_D2F72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2F90
    jr   label_D2F92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F80::
    nop
    nop

label_D2F82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2FA0
    jr   label_D2FA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2F90::
    nop
    nop

label_D2F92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2FB0
    jr   label_D2FB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2FA0::
    nop
    nop

label_D2FA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2FC0
    jr   label_D2FC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2FB0::
    nop
    nop

label_D2FB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2FD0
    jr   label_D2FD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2FC0::
    nop
    nop

label_D2FC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2FE0
    jr   label_D2FE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2FD0::
    nop
    nop

label_D2FD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D2FF0
    jr   label_D2FF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2FE0::
    nop
    nop

label_D2FE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3000
    jr   label_D3002
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D2FF0::
    nop
    nop

label_D2FF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3010
    jr   label_D3012
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3000::
    nop
    nop

label_D3002::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3020
    jr   label_D3022
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3010::
    nop
    nop

label_D3012::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3030
    jr   label_D3032
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3020::
    nop
    nop

label_D3022::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3040
    jr   label_D3042
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3030::
    nop
    nop

label_D3032::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3050
    jr   label_D3052
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3040::
    nop
    nop

label_D3042::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3060
    jr   label_D3062
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3050::
    nop
    nop

label_D3052::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3070
    jr   label_D3072
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3060::
    nop
    nop

label_D3062::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3080
    jr   label_D3082
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3070::
    nop
    nop

label_D3072::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3090
    jr   label_D3092
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3080::
    nop
    nop

label_D3082::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D30A0
    jr   label_D30A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3090::
    nop
    nop

label_D3092::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D30B0
    jr   label_D30B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D30A0::
    nop
    nop

label_D30A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D30C0
    jr   label_D30C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D30B0::
    nop
    nop

label_D30B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D30D0
    jr   label_D30D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D30C0::
    nop
    nop

label_D30C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D30E0
    jr   label_D30E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D30D0::
    nop
    nop

label_D30D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D30F0
    jr   label_D30F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D30E0::
    nop
    nop

label_D30E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3100
    jr   label_D3102
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D30F0::
    nop
    nop

label_D30F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3110
    jr   label_D3112
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3100::
    nop
    nop

label_D3102::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3120
    jr   label_D3122
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3110::
    nop
    nop

label_D3112::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3130
    jr   label_D3132
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3120::
    nop
    nop

label_D3122::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3140
    jr   label_D3142
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3130::
    nop
    nop

label_D3132::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3150
    jr   label_D3152
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3140::
    nop
    nop

label_D3142::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3160
    jr   label_D3162
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3150::
    nop
    nop

label_D3152::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3170
    jr   label_D3172
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3160::
    nop
    nop

label_D3162::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3180
    jr   label_D3182
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3170::
    nop
    nop

label_D3172::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3190
    jr   label_D3192
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3180::
    nop
    nop

label_D3182::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D31A0
    jr   label_D31A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3190::
    nop
    nop

label_D3192::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D31B0
    jr   label_D31B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D31A0::
    nop
    nop

label_D31A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D31C0
    jr   label_D31C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D31B0::
    nop
    nop

label_D31B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D31D0
    jr   label_D31D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D31C0::
    nop
    nop

label_D31C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D31E0
    jr   label_D31E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D31D0::
    nop
    nop

label_D31D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D31F0
    jr   label_D31F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D31E0::
    nop
    nop

label_D31E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3200
    jr   label_D3202
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D31F0::
    nop
    nop

label_D31F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3210
    jr   label_D3212
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3200::
    nop
    nop

label_D3202::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3220
    jr   label_D3222
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3210::
    nop
    nop

label_D3212::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3230
    jr   label_D3232
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3220::
    nop
    nop

label_D3222::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3240
    jr   label_D3242
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3230::
    nop
    nop

label_D3232::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3250
    jr   label_D3252
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3240::
    nop
    nop

label_D3242::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3260
    jr   label_D3262
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3250::
    nop
    nop

label_D3252::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3270
    jr   label_D3272
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3260::
    nop
    nop

label_D3262::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3280
    jr   label_D3282
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3270::
    nop
    nop

label_D3272::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3290
    jr   label_D3292
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3280::
    nop
    nop

label_D3282::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D32A0
    jr   label_D32A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3290::
    nop
    nop

label_D3292::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D32B0
    jr   label_D32B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D32A0::
    nop
    nop

label_D32A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D32C0
    jr   label_D32C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D32B0::
    nop
    nop

label_D32B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D32D0
    jr   label_D32D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D32C0::
    nop
    nop

label_D32C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D32E0
    jr   label_D32E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D32D0::
    nop
    nop

label_D32D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D32F0
    jr   label_D32F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D32E0::
    nop
    nop

label_D32E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3300
    jr   label_D3302
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D32F0::
    nop
    nop

label_D32F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3310
    jr   label_D3312
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3300::
    nop
    nop

label_D3302::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3320
    jr   label_D3322
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3310::
    nop
    nop

label_D3312::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3330
    jr   label_D3332
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3320::
    nop
    nop

label_D3322::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3340
    jr   label_D3342
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3330::
    nop
    nop

label_D3332::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3350
    jr   label_D3352
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3340::
    nop
    nop

label_D3342::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3360
    jr   label_D3362
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3350::
    nop
    nop

label_D3352::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3370
    jr   label_D3372
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3360::
    nop
    nop

label_D3362::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3380
    jr   label_D3382
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3370::
    nop
    nop

label_D3372::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3390
    jr   label_D3392
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3380::
    nop
    nop

label_D3382::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D33A0
    jr   label_D33A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3390::
    nop
    nop

label_D3392::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D33B0
    jr   label_D33B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D33A0::
    nop
    nop

label_D33A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D33C0
    jr   label_D33C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D33B0::
    nop
    nop

label_D33B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D33D0
    jr   label_D33D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D33C0::
    nop
    nop

label_D33C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D33E0
    jr   label_D33E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D33D0::
    nop
    nop

label_D33D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D33F0
    jr   label_D33F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D33E0::
    nop
    nop

label_D33E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3400
    jr   label_D3402
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D33F0::
    nop
    nop

label_D33F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3410
    jr   label_D3412
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3400::
    nop
    nop

label_D3402::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3420
    jr   label_D3422
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3410::
    nop
    nop

label_D3412::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3430
    jr   label_D3432
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3420::
    nop
    nop

label_D3422::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3440
    jr   label_D3442
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3430::
    nop
    nop

label_D3432::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3450
    jr   label_D3452
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3440::
    nop
    nop

label_D3442::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3460
    jr   label_D3462
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3450::
    nop
    nop

label_D3452::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3470
    jr   label_D3472
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3460::
    nop
    nop

label_D3462::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3480
    jr   label_D3482
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3470::
    nop
    nop

label_D3472::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3490
    jr   label_D3492
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3480::
    nop
    nop

label_D3482::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D34A0
    jr   label_D34A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3490::
    nop
    nop

label_D3492::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D34B0
    jr   label_D34B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D34A0::
    nop
    nop

label_D34A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D34C0
    jr   label_D34C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D34B0::
    nop
    nop

label_D34B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D34D0
    jr   label_D34D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D34C0::
    nop
    nop

label_D34C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D34E0
    jr   label_D34E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D34D0::
    nop
    nop

label_D34D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D34F0
    jr   label_D34F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D34E0::
    nop
    nop

label_D34E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3500
    jr   label_D3502
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D34F0::
    nop
    nop

label_D34F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3510
    jr   label_D3512
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3500::
    nop
    nop

label_D3502::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3520
    jr   label_D3522
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3510::
    nop
    nop

label_D3512::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3530
    jr   label_D3532
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3520::
    nop
    nop

label_D3522::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3540
    jr   label_D3542
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3530::
    nop
    nop

label_D3532::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3550
    jr   label_D3552
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3540::
    nop
    nop

label_D3542::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3560
    jr   label_D3562
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3550::
    nop
    nop

label_D3552::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3570
    jr   label_D3572
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3560::
    nop
    nop

label_D3562::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3580
    jr   label_D3582
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3570::
    nop
    nop

label_D3572::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3590
    jr   label_D3592
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3580::
    nop
    nop

label_D3582::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D35A0
    jr   label_D35A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3590::
    nop
    nop

label_D3592::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D35B0
    jr   label_D35B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D35A0::
    nop
    nop

label_D35A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D35C0
    jr   label_D35C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D35B0::
    nop
    nop

label_D35B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D35D0
    jr   label_D35D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D35C0::
    nop
    nop

label_D35C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D35E0
    jr   label_D35E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D35D0::
    nop
    nop

label_D35D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D35F0
    jr   label_D35F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D35E0::
    nop
    nop

label_D35E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3600
    jr   label_D3602
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D35F0::
    nop
    nop

label_D35F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3610
    jr   label_D3612
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3600::
    nop
    nop

label_D3602::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3620
    jr   label_D3622
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3610::
    nop
    nop

label_D3612::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3630
    jr   label_D3632
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3620::
    nop
    nop

label_D3622::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3640
    jr   label_D3642
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3630::
    nop
    nop

label_D3632::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3650
    jr   label_D3652
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3640::
    nop
    nop

label_D3642::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3660
    jr   label_D3662
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3650::
    nop
    nop

label_D3652::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3670
    jr   label_D3672
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3660::
    nop
    nop

label_D3662::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3680
    jr   label_D3682
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3670::
    nop
    nop

label_D3672::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3690
    jr   label_D3692
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3680::
    nop
    nop

label_D3682::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D36A0
    jr   label_D36A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3690::
    nop
    nop

label_D3692::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D36B0
    jr   label_D36B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D36A0::
    nop
    nop

label_D36A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D36C0
    jr   label_D36C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D36B0::
    nop
    nop

label_D36B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D36D0
    jr   label_D36D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D36C0::
    nop
    nop

label_D36C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D36E0
    jr   label_D36E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D36D0::
    nop
    nop

label_D36D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D36F0
    jr   label_D36F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D36E0::
    nop
    nop

label_D36E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3700
    jr   label_D3702
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D36F0::
    nop
    nop

label_D36F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3710
    jr   label_D3712
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3700::
    nop
    nop

label_D3702::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3720
    jr   label_D3722
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3710::
    nop
    nop

label_D3712::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3730
    jr   label_D3732
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3720::
    nop
    nop

label_D3722::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3740
    jr   label_D3742
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3730::
    nop
    nop

label_D3732::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3750
    jr   label_D3752
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3740::
    nop
    nop

label_D3742::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3760
    jr   label_D3762
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3750::
    nop
    nop

label_D3752::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3770
    jr   label_D3772
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3760::
    nop
    nop

label_D3762::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3780
    jr   label_D3782
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3770::
    nop
    nop

label_D3772::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3790
    jr   label_D3792
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3780::
    nop
    nop

label_D3782::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D37A0
    jr   label_D37A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3790::
    nop
    nop

label_D3792::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D37B0
    jr   label_D37B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D37A0::
    nop
    nop

label_D37A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D37C0
    jr   label_D37C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D37B0::
    nop
    nop

label_D37B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D37D0
    jr   label_D37D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D37C0::
    nop
    nop

label_D37C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D37E0
    jr   label_D37E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D37D0::
    nop
    nop

label_D37D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D37F0
    jr   label_D37F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D37E0::
    nop
    nop

label_D37E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3800
    jr   label_D3802
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D37F0::
    nop
    nop

label_D37F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3810
    jr   label_D3812
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3800::
    nop
    nop

label_D3802::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3820
    jr   label_D3822
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3810::
    nop
    nop

label_D3812::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3830
    jr   label_D3832
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3820::
    nop
    nop

label_D3822::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3840
    jr   label_D3842
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3830::
    nop
    nop

label_D3832::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3850
    jr   label_D3852
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3840::
    nop
    nop

label_D3842::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3860
    jr   label_D3862
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3850::
    nop
    nop

label_D3852::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3870
    jr   label_D3872
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3860::
    nop
    nop

label_D3862::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3880
    jr   label_D3882
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3870::
    nop
    nop

label_D3872::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3890
    jr   label_D3892
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3880::
    nop
    nop

label_D3882::
    ld   b, d
    ld   b, d
    inc  h
    inc  h

label_D3886::
    jr   label_D38A0
    jr   label_D38A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3890::
    nop
    nop

label_D3892::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D38B0
    jr   label_D38B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D38A0::
    nop
    nop

label_D38A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D38C0
    jr   label_D38C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D38B0::
    nop
    nop

label_D38B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D38D0
    jr   label_D38D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D38C0::
    nop
    nop

label_D38C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D38E0
    jr   label_D38E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D38D0::
    nop
    nop

label_D38D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D38F0
    jr   label_D38F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D38E0::
    nop
    nop

label_D38E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3900
    jr   label_D3902
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D38F0::
    nop
    nop

label_D38F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3910
    jr   label_D3912
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3900::
    nop
    nop

label_D3902::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3920
    jr   label_D3922
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3910::
    nop
    nop

label_D3912::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3930
    jr   label_D3932
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3920::
    nop
    nop

label_D3922::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3940
    jr   label_D3942
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3930::
    nop
    nop

label_D3932::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3950
    jr   label_D3952
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3940::
    nop
    nop

label_D3942::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3960
    jr   label_D3962
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3950::
    nop
    nop

label_D3952::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3970
    jr   label_D3972
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3960::
    nop
    nop

label_D3962::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3980
    jr   label_D3982
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3970::
    nop
    nop

label_D3972::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3990
    jr   label_D3992
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3980::
    nop
    nop

label_D3982::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D39A0
    jr   label_D39A2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3990::
    nop
    nop

label_D3992::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D39B0
    jr   label_D39B2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D39A0::
    nop
    nop

label_D39A2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D39C0
    jr   label_D39C2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D39B0::
    nop
    nop

label_D39B2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D39D0
    jr   label_D39D2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D39C0::
    nop
    nop

label_D39C2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D39E0
    jr   label_D39E2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D39D0::
    nop
    nop

label_D39D2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D39F0
    jr   label_D39F2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D39E0::
    nop
    nop

label_D39E2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A00
    jr   label_D3A02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D39F0::
    nop
    nop

label_D39F2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A10
    jr   label_D3A12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A00::
    nop
    nop

label_D3A02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A20
    jr   label_D3A22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A10::
    nop
    nop

label_D3A12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A30
    jr   label_D3A32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A20::
    nop
    nop

label_D3A22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A40
    jr   label_D3A42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A30::
    nop
    nop

label_D3A32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A50
    jr   label_D3A52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A40::
    nop
    nop

label_D3A42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A60
    jr   label_D3A62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A50::
    nop
    nop

label_D3A52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A70
    jr   label_D3A72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A60::
    nop
    nop

label_D3A62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A80
    jr   label_D3A82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A70::
    nop
    nop

label_D3A72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3A90
    jr   label_D3A92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A80::
    nop
    nop

label_D3A82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3AA0
    jr   label_D3AA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3A90::
    nop
    nop

label_D3A92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3AB0
    jr   label_D3AB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3AA0::
    nop
    nop

label_D3AA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3AC0
    jr   label_D3AC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3AB0::
    nop
    nop

label_D3AB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3AD0
    jr   label_D3AD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3AC0::
    nop
    nop

label_D3AC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3AE0
    jr   label_D3AE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3AD0::
    nop
    nop

label_D3AD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3AF0
    jr   label_D3AF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3AE0::
    nop
    nop

label_D3AE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B00
    jr   label_D3B02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3AF0::
    nop
    nop

label_D3AF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B10
    jr   label_D3B12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B00::
    nop
    nop

label_D3B02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B20
    jr   label_D3B22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B10::
    nop
    nop

label_D3B12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B30
    jr   label_D3B32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B20::
    nop
    nop

label_D3B22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B40
    jr   label_D3B42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B30::
    nop
    nop

label_D3B32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B50
    jr   label_D3B52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B40::
    nop
    nop

label_D3B42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B60
    jr   label_D3B62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B50::
    nop
    nop

label_D3B52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B70
    jr   label_D3B72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B60::
    nop
    nop

label_D3B62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B80
    jr   label_D3B82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B70::
    nop
    nop

label_D3B72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3B90
    jr   label_D3B92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B80::
    nop
    nop

label_D3B82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3BA0
    jr   label_D3BA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3B90::
    nop
    nop

label_D3B92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3BB0
    jr   label_D3BB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3BA0::
    nop
    nop

label_D3BA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3BC0
    jr   label_D3BC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3BB0::
    nop
    nop

label_D3BB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3BD0
    jr   label_D3BD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3BC0::
    nop
    nop

label_D3BC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3BE0
    jr   label_D3BE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3BD0::
    nop
    nop

label_D3BD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3BF0
    jr   label_D3BF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3BE0::
    nop
    nop

label_D3BE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C00
    jr   label_D3C02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3BF0::
    nop
    nop

label_D3BF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C10
    jr   label_D3C12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C00::
    nop
    nop

label_D3C02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C20
    jr   label_D3C22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C10::
    nop
    nop

label_D3C12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C30
    jr   label_D3C32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C20::
    nop
    nop

label_D3C22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C40
    jr   label_D3C42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C30::
    nop
    nop

label_D3C32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C50
    jr   label_D3C52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C40::
    nop
    nop

label_D3C42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C60
    jr   label_D3C62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C50::
    nop
    nop

label_D3C52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C70
    jr   label_D3C72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C60::
    nop
    nop

label_D3C62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C80
    jr   label_D3C82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C70::
    nop
    nop

label_D3C72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3C90
    jr   label_D3C92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C80::
    nop
    nop

label_D3C82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3CA0
    jr   label_D3CA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3C90::
    nop
    nop

label_D3C92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3CB0
    jr   label_D3CB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3CA0::
    nop
    nop

label_D3CA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3CC0
    jr   label_D3CC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3CB0::
    nop
    nop

label_D3CB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3CD0
    jr   label_D3CD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3CC0::
    nop
    nop

label_D3CC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3CE0
    jr   label_D3CE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3CD0::
    nop
    nop

label_D3CD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3CF0
    jr   label_D3CF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3CE0::
    nop
    nop

label_D3CE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D00
    jr   label_D3D02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3CF0::
    nop
    nop

label_D3CF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D10
    jr   label_D3D12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D00::
    nop
    nop

label_D3D02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D20
    jr   label_D3D22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D10::
    nop
    nop

label_D3D12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D30
    jr   label_D3D32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D20::
    nop
    nop

label_D3D22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D40
    jr   label_D3D42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D30::
    nop
    nop

label_D3D32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D50
    jr   label_D3D52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D40::
    nop
    nop

label_D3D42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D60
    jr   label_D3D62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D50::
    nop
    nop

label_D3D52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D70
    jr   label_D3D72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D60::
    nop
    nop

label_D3D62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D80
    jr   label_D3D82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D70::
    nop
    nop

label_D3D72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3D90
    jr   label_D3D92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D80::
    nop
    nop

label_D3D82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3DA0
    jr   label_D3DA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3D90::
    nop
    nop

label_D3D92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3DB0
    jr   label_D3DB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3DA0::
    nop
    nop

label_D3DA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3DC0
    jr   label_D3DC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3DB0::
    nop
    nop

label_D3DB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3DD0
    jr   label_D3DD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3DC0::
    nop
    nop

label_D3DC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3DE0
    jr   label_D3DE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3DD0::
    nop
    nop

label_D3DD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3DF0
    jr   label_D3DF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3DE0::
    nop
    nop

label_D3DE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E00
    jr   label_D3E02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3DF0::
    nop
    nop

label_D3DF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E10
    jr   label_D3E12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E00::
    nop
    nop

label_D3E02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E20
    jr   label_D3E22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E10::
    nop
    nop

label_D3E12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E30
    jr   label_D3E32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E20::
    nop
    nop

label_D3E22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E40
    jr   label_D3E42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E30::
    nop
    nop

label_D3E32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E50
    jr   label_D3E52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E40::
    nop
    nop

label_D3E42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E60
    jr   label_D3E62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E50::
    nop
    nop

label_D3E52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E70
    jr   label_D3E72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E60::
    nop
    nop

label_D3E62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E80
    jr   label_D3E82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E70::
    nop
    nop

label_D3E72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3E90
    jr   label_D3E92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E80::
    nop
    nop

label_D3E82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3EA0
    jr   label_D3EA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3E90::
    nop
    nop

label_D3E92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3EB0
    jr   label_D3EB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3EA0::
    nop
    nop

label_D3EA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3EC0
    jr   label_D3EC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3EB0::
    nop
    nop

label_D3EB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3ED0
    jr   label_D3ED2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3EC0::
    nop
    nop

label_D3EC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3EE0
    jr   label_D3EE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3ED0::
    nop
    nop

label_D3ED2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3EF0
    jr   label_D3EF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3EE0::
    nop
    nop

label_D3EE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F00
    jr   label_D3F02
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3EF0::
    nop
    nop

label_D3EF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F10
    jr   label_D3F12
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F00::
    nop
    nop

label_D3F02::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F20
    jr   label_D3F22
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F10::
    nop
    nop

label_D3F12::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F30
    jr   label_D3F32
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F20::
    nop
    nop

label_D3F22::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F40
    jr   label_D3F42
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F30::
    nop
    nop

label_D3F32::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F50
    jr   label_D3F52
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F40::
    nop
    nop

label_D3F42::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F60
    jr   label_D3F62
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F50::
    nop
    nop

label_D3F52::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F70
    jr   label_D3F72
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F60::
    nop
    nop

label_D3F62::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F80
    jr   label_D3F82
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F70::
    nop
    nop

label_D3F72::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3F90
    jr   label_D3F92
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F80::
    nop
    nop

label_D3F82::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3FA0
    jr   label_D3FA2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3F90::
    nop
    nop

label_D3F92::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3FB0
    jr   label_D3FB2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3FA0::
    nop
    nop

label_D3FA2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3FC0
    jr   label_D3FC2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3FB0::
    nop
    nop

label_D3FB2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3FD0
    jr   label_D3FD2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3FC0::
    nop
    nop

label_D3FC2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3FE0
    jr   label_D3FE2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3FD0::
    nop
    nop

label_D3FD2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_D3FF0
    jr   label_D3FF2
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3FE0::
    nop
    nop

label_D3FE2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_FFFF8000
    jr   label_FFFF8002
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop

label_D3FF0::
    nop
    nop

label_D3FF2::
    ld   b, d
    ld   b, d
    inc  h
    inc  h
    jr   label_FFFF8010
    jr   label_FFFF8012
    inc  h
    inc  h
    ld   b, d
    ld   b, d
    nop
    nop
