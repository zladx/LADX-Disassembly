section "bank54",romx,bank[$36]

label_D8000::
    ld   a, [$C124]
    and  a
    ret  nz
    ld   a, [$FFF0]
    cp   $04
    jr   c, label_D8011
    ld   de, label_D890A
    call label_3BC0

label_D8011::
    call label_DAA40
    ld   a, [$DC0D]
    and  $08
    jp   nz, label_3F8D
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$FFF0]
    rst  0
    db   $3A ; ldd  a, [hl]
    ld   b, b
    ld   e, l
    ld   b, b
    ld   [hl], a
    ld   b, b
    sbc  a, h
    ld   b, b
    push bc
    ld   b, b
    db   $EB ; Undefined instruction
    ld   b, b
    ld   a, [$FF00+C]
    db   $FD ; Undefined instruction
    ld   b, b
    ld   h, $41
    ld   d, e
    ld   b, c
    ld   h, c
    ld   b, c
    ld   a, [$DC0C]
    and  $01
    call z, label_3F8D
    ld   a, [$DB73]
    ld   hl, $DB79
    or   [hl]
    ld   hl, $DB7B
    or   [hl]
    call nz, label_3F8D
    call label_DAC23
    ld   [hl], $E8
    call label_DAC28
    ld   [hl], $4D
    jp   label_3B12
    ld   de, $C280
    ld   hl, $C3A0

label_D8063::
    ld   a, [hli]
    and  a
    jr   z, label_D806E
    cp   $FA
    jr   z, label_D806E
    ld   a, [de]
    and  a
    ret  nz

label_D806E::
    inc  de
    ld   a, l
    and  $0F
    jr   nz, label_D8063
    jp   label_3B12
    ld   a, [$FF98]
    cp   $44
    ret  c
    cp   $48
    ret  nc
    ld   a, [$FF99]
    cp   $4A
    ret  c
    cp   $51
    ret  nc
    xor  a
    ld   [$FFA6], a
    ld   a, $11
    ld   [$FFA4], a
    call label_D8365
    jp   label_3B12

label_D8094::
    rst  $38
    ld   a, a
    nop
    nop
    ld   [hl], c
    ld   b, h
    ld   a, a
    ld   a, l
    call label_D8365
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $07
    ret  nz
    ld   [hl], a
    di
    ld   de, label_D8094
    ld   hl, $DC80

label_D80B0::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $07
    jr   nz, label_D80B0
    ei
    ld   a, $02
    ld   [$DDD1], a
    ld   a, $0B
    ld   [$FFA4], a
    jp   label_3B12
    call label_D8365
    call label_DAC23
    ld   a, [hl]
    cp   $37
    jr   z, label_D80DF
    inc  [hl]
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D80DE
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D80DE::
    ret

label_D80DF::
    ld   a, $06
    ld   [$FF9D], a
    ld   a, $A7
    call label_237C
    jp   label_3B12
    call label_D8365
    ld   a, $A8
    jr   label_D80F7
    call label_D8365
    ld   a, $A9

label_D80F7::
    call label_237C
    jp   label_3B12
    call label_D8365
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_D8117
    call label_DAC23
    dec  [hl]
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D8117
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D8117::
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $10
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, $AA
    jr   label_D80F7
    call label_D8365
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_D8144
    call label_DAC23
    dec  [hl]
    call label_DAC28
    inc  [hl]
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D8144
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D8144::
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $0A
    ret  nz
    xor  a
    ld   [hl], a
    ld   a, $AB
    jr   label_D80F7
    call label_D8365
    call label_DAC28
    inc  [hl]
    ld   a, [hl]
    cp   $70
    ret  c
    jp   label_3B12
    call label_D8365
    ld   a, $40
    ld   [$FFF4], a
    ld   a, $1A
    ld   [$DB95], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    ret

label_D8178::
    ld   de, label_D88F2
    call label_3BC0
    call label_DAB5C
    call label_DAA46
    ld   a, [$FFF0]
    and  a
    jr   z, label_D81A0
    ld   a, [$C16B]
    and  a
    jr   nz, label_D81A0
    ld   a, [$DB95]
    cp   $0B
    jr   nz, label_D81A0
    ld   a, [$C11C]
    cp   $03
    jr   z, label_D81A0
    call label_D81B2

label_D81A0::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$FFF0]
    rst  0
    rst  $18
    ld   b, c
    ld   hl, label_D8D42
    ld   b, d
    ld   d, h
    ld   b, d
    ld   h, h
    ld   b, d

label_D81B2::
    push bc
    call label_28CF
    ld   a, $38
    ld   b, $41
    ld   c, $07
    ld   h, $36
    call label_A13
    ld   a, [$D6FD]
    ld   [rLCDC], a
    pop  bc
    di
    ld   de, label_D8094
    ld   hl, $DC80
    ld   a, $02
    ld   [rSVBK], a

label_D81D2::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $07
    jr   nz, label_D81D2
    xor  a
    ld   [rSVBK], a
    ei
    ret
    ld   a, $70
    ld   [$FFA2], a
    ld   a, $02
    ld   [$C146], a
    ld   a, $E0
    ld   [$FFB3], a
    ld   [$C145], a
    ld   a, $01
    ld   [$D475], a
    ld   a, [$DB73]
    and  a
    jr   z, label_D8217
    ld   a, $70
    ld   hl, $D195
    ld   e, $10

label_D8201::
    ldi  [hl], a
    dec  e
    jr   nz, label_D8201
    ld   [$C31F], a
    ld   a, [$DC0C]
    and  $01
    jp   z, label_D8217
    ld   a, [$DC0C]
    and  $04
    jr   z, label_D821B

label_D8217::
    call label_3F8D
    ret

label_D821B::
    call label_D81B2
    jp   label_3B12
    push bc
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, $D580
    add  hl, bc
    inc  hl
    ld   [hl], $08
    inc  hl
    inc  hl
    ld   [hl], $0C
    pop  bc
    ld   a, [$FF9D]
    cp   $6A
    ret  nz
    ld   a, $02
    ld   [$C167], a
    ld   a, [$C157]
    and  a
    ret  nz
    ld   a, $A6
    call label_237C
    jp   label_3B12
    ld   hl, $C30F
    inc  [hl]
    jp   label_D867F
    ld   a, [$FF9D]
    cp   $6A
    ret  z
    ld   a, [$DC0C]
    or   $04
    ld   [$DC0C], a
    jp   label_3B12
    call label_DAC28
    ld   a, [hl]
    cp   $3B
    jr   c, label_D827A
    dec  [hl]
    ld   a, [$FFE7]
    and  $07
    ret  nz
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    ret

label_D827A::
    xor  a
    ld   [$C167], a
    call label_3F8D
    ret

label_D8282::
    nop
    nop
    ld   d, b
    rlca
    nop
    ld   [label_752], sp
    nop
    db   $10 ; Undefined instruction
    rlca
    stop
    ld   d, [hl]
    rlca
    db   $10 ; Undefined instruction
    ld   e, h
    rlca
    db   $10 ; Undefined instruction
    ld   e, [hl]
    rlca

label_D829A::
    call label_DAC23
    ld   a, [hl]
    cp   $20
    jr   nc, label_D82D4
    ld   [hl], $14
    call label_DAC28
    ld   [hl], $64
    push bc
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, $D580
    add  hl, bc
    inc  hl
    ld   [hl], $10
    inc  hl
    ld   [hl], $07
    inc  hl
    ld   [hl], $0B
    pop  bc
    ld   hl, label_D8282
    ld   c, $06
    call label_3CE6
    ld   a, $06
    call label_3DA0
    call label_DAB5C
    call label_3B5A
    ret

label_D82D4::
    call label_DAC02
    ld   a, [hli]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_D88C2
    call label_DAC7E
    ld   c, $03
    call label_3CE6
    ld   a, $03
    call label_3DA0
    call label_DAB5C
    call label_3B5A
    call label_DAA46
    ld   a, [$FFF0]
    and  a
    jr   z, label_D8329
    ld   a, [$C16B]
    and  a
    jr   nz, label_D8329
    ld   a, [$DB95]
    cp   $0B
    jr   nz, label_D8329
    ld   a, [$C11C]
    cp   $03
    jr   z, label_D8329
    call label_D836D
    ld   a, [$DC0C]
    and  $01
    jr   z, label_D8329
    ld   hl, $C3A0

label_D831C::
    ld   a, [hli]
    cp   $DD
    jr   z, label_D8329
    ld   a, l
    and  $0F
    jr   nz, label_D831C
    call label_D871E

label_D8329::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$DC0C]
    and  $01
    jr   z, label_D833C
    ld   a, $12
    ld   [$FFF0], a
    call label_DAC07

label_D833C::
    ld   a, [$FFF0]
    rst  0
    or   a
    ld   b, e
    cp   l
    ld   b, e
    di
    ld   b, e
    inc  e
    ld   b, h
    ld   [hl], c
    ld   b, h
    and  h
    ld   b, h
    or   e
    ld   b, h
    jp   nz, label_FC44
    ld   b, h
    ld   d, a
    ld   b, l
    adc  a, c
    ld   b, l
    dec  hl
    ld   b, [hl]
    ld   a, a
    ld   b, [hl]
    jp   z, label_D946
    ld   b, [hl]
    ld   sp, hl
    ld   b, [hl]
    jr   nc, label_D83A8
    ld   b, d
    ld   b, a
    ld   h, h
    ld   b, a

label_D8365::
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ret

label_D836D::
    push bc
    call label_28CF
    ld   a, $38
    ld   b, $40
    ld   c, $06
    ld   h, $36
    call label_A13
    ld   a, $38
    ld   b, $41
    ld   c, $07
    ld   h, $36
    call label_A13
    ld   a, $35
    ld   b, $66
    ld   c, $05
    ld   h, $36
    call label_A13
    ld   a, [$DB73]
    ld   hl, $DB56
    or   [hl]
    ld   hl, $DB79
    or   [hl]
    ld   hl, $DB7B
    or   [hl]
    and  $7F
    jr   nz, label_D83B0
    ld   a, $38
    ld   b, $42
    ld   c, $04
    ld   h, $36
    call label_A13

label_D83B0::
    ld   a, [$D6FD]
    ld   [rLCDC], a
    pop  bc
    ret
    call label_D836D
    jp   label_3B12
    ld   a, [$DB95]
    cp   $06
    ret  z
    call label_DAA98
    ret  nc
    call label_DAB8A
    ld   a, e
    and  a
    ret  z
    ld   a, [$DB73]
    ld   hl, $DB56
    or   [hl]
    ld   hl, $DB79
    or   [hl]
    ld   hl, $DB7B
    or   [hl]
    and  $7F
    jr   z, label_D83E6
    ld   a, $AD
    call label_237C
    ret

label_D83E6::
    ld   a, $02
    ld   [$C167], a
    ld   a, $0C
    call label_2373
    jp   label_3B12
    ld   a, [$C177]
    and  a
    jr   nz, label_D8405
    xor  a
    ld   [$C167], a
    ld   a, $0D
    call label_2373
    jp   label_3B12

label_D8405::
    call label_D8365
    ld   a, $94
    call label_237C
    call label_DAC23
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    ld   a, $07
    call label_DAC07
    ret
    xor  a
    ld   [$C167], a
    call label_DAA98
    jr   nc, label_D8429
    ld   a, $0D
    jr   label_D8440

label_D8429::
    ld   a, [$FF99]
    cp   $78
    jr   c, label_D8444
    call label_CB6
    ld   a, $77
    ld   [$FF99], a
    ld   [$DB9E], a
    ld   a, [$C146]
    and  a
    ret  nz
    ld   a, $0E

label_D8440::
    call label_2373
    ret

label_D8444::
    cp   $23
    ret  nc
    ld   a, [$FF98]
    cp   $4E
    ret  c
    cp   $53
    ret  nc
    ld   a, [$FF9E]
    cp   $03
    ret  nz
    ld   a, [$FF9D]
    and  a
    jr   z, label_D8466
    cp   $01
    jr   z, label_D8466
    cp   $22
    jr   z, label_D8466
    cp   $23
    jr   z, label_D8466
    ret

label_D8466::
    ld   a, [$C16E]
    and  a
    ret  nz
    call label_D8365
    jp   label_3B12
    call label_D8365
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D8481
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D8481::
    call label_DAC23
    ld   a, [hl]
    cp   $50
    jr   c, label_D848B
    dec  [hl]
    ret

label_D848B::
    call label_DAC02
    ld   a, [hl]
    or   $02
    ld   [hl], a
    call label_DAC28
    ld   a, [hl]
    cp   $38
    jr   c, label_D849C
    dec  [hl]
    ret

label_D849C::
    call label_C05
    ld   [hl], $40
    jp   label_3B12
    call label_D8365
    call label_C05
    ret  nz
    ld   a, $0F
    call label_2373
    jp   label_3B12
    call label_D8365
    ld   a, $0C
    call label_DAC07
    ld   hl, $C2B0
    add  hl, bc
    xor  a
    ld   [hl], a
    ret
    call label_D8365
    ld   a, [$C177]
    and  a
    jr   nz, label_D84DA
    xor  a
    ld   [$C167], a
    ld   a, $0D
    call label_2373
    call label_3B12
    ld   [hl], $03
    ret

label_D84DA::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    sub  a, $10
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $01
    jp   z, label_3B12
    cp   $05
    jr   nz, label_D84F6
    ld   a, $96
    call label_237C

label_D84F6::
    call label_3B12
    ld   [hl], $09
    ret
    call label_D8365
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    call label_DAC23
    cp   [hl]
    jr   z, label_D852D
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D8517
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D8517::
    ld   a, $08
    call label_3BAA
    call label_DAA62
    call label_DAB8A
    cp   $0C
    jr   nc, label_D852D
    ld   hl, $C2D0
    add  hl, bc
    ld   a, $E2
    ld   [hl], a

label_D852D::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D8542
    inc  [hl]
    ld   a, [hl]
    ld   [$FF9A], a
    push bc
    call label_21A8
    call label_3E19
    pop  bc
    ret

label_D8542::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    call label_DAC23
    cp   [hl]
    ret  nz
    ld   a, $94
    call label_237C
    ld   a, $07
    call label_DAC07
    ret
    call label_D8365
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D8567
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D8567::
    ld   a, [$FFE7]
    and  $01
    ret  nz
    call label_DAC23
    ld   a, [hl]
    cp   $50
    jr   nc, label_D857C
    call label_DAC02
    ld   [hl], $02
    jp   label_3B12

label_D857C::
    dec  [hl]
    call label_DAC28
    inc  [hl]
    ld   a, [$FF99]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    ret
    call label_D8365
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    call label_DAC28
    cp   [hl]
    jr   z, label_D85E6
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D85A4
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D85A4::
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   nz, label_D85C5
    ld   a, $0C
    call label_3BAA
    call label_DAA62
    call label_DAB9A
    cp   $0C
    jr   nc, label_D85E6
    ld   hl, $C2D0
    add  hl, bc
    ld   a, $DD
    ld   [hl], a
    jr   label_D85E6

label_D85C5::
    ld   a, $08
    call label_3BAA
    call label_DAA62
    call label_DAC28
    ld   a, [hl]
    cp   $2E
    jr   nc, label_D85D8
    ld   a, $2D
    ld   [hl], a

label_D85D8::
    call label_DAB9A
    cp   $0C
    jr   nc, label_D85E6
    ld   hl, $C2D0
    add  hl, bc
    ld   a, $E8
    ld   [hl], a

label_D85E6::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D85FB
    inc  [hl]
    ld   a, [hl]
    ld   [$FF9B], a
    push bc
    call label_21A8
    call label_3E19
    pop  bc
    ret

label_D85FB::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    call label_DAC28
    cp   [hl]
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    cp   $05
    jr   nz, label_D8618
    xor  a
    ld   [hl], a
    ld   a, $6A
    ld   [$FF9D], a
    ld   a, $0B
    jr   label_D8627

label_D8618::
    cp   $04
    jr   nz, label_D8620
    ld   a, $95
    jr   label_D8622

label_D8620::
    ld   a, $94

label_D8622::
    call label_237C
    ld   a, $07

label_D8627::
    call label_DAC07
    ret
    call label_D8365
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $40
    ret  nz
    ld   a, [$DC0D]
    or   $80
    ld   [$DC0D], a
    xor  a
    ld   [hl], a
    ld   a, $97
    call label_237C
    jp   label_3B12

label_D8649::
    di
    ld   hl, rSVBK
    ld   de, $DC10

label_D8650::
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
    jr   nz, label_D8650
    ld   a, $01
    ld   [$DDD1], a
    ei
    ret

label_D8665::
    di
    ld   hl, rSVBK
    ld   de, $DC10

label_D866C::
    ld   [hl], $03
    ld   a, [de]
    ld   [hl], $00
    ld   [de], a
    inc  de
    ld   a, e
    cp   $90
    jr   nz, label_D866C
    ld   a, $01
    ld   [$DDD1], a
    ei
    ret

label_D867F::
    call label_D8365
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    inc  [hl]
    and  a
    jr   nz, label_D869A
    ld   a, $40
    ld   [$FFF4], a
    ld   hl, $DB97
    xor  a
    ldi  [hl], a
    ldi  [hl], a
    ld   [hl], a
    call label_D8649
    ret

label_D869A::
    cp   $01
    jr   nz, label_D86A9
    ld   a, [$FFFE]
    and  a
    jr   z, label_D86A9
    ld   a, $02
    ld   [$DDD1], a
    ret

label_D86A9::
    cp   $1E
    ret  c
    jr   nz, label_D86B2
    call label_D8665
    ret

label_D86B2::
    ld   a, $02
    ld   [$DDD1], a
    ld   hl, $DB97
    ld   a, $E4
    ldi  [hl], a
    ld   a, $1C
    ldi  [hl], a
    ld   [hl], $E4
    call label_C05
    ld   [hl], $30
    jp   label_3B12
    call label_D8365
    call label_C05
    ret  nz
    call label_DAC02
    ld   [hl], $00
    jp   label_3B12
    call label_D8365
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D86E9
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D86E9::
    call label_DAC23
    dec  [hl]
    ld   a, [hl]
    cp   $35
    ret  nc
    call label_DAC02
    ld   [hl], $02
    jp   label_3B12
    call label_D8365
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D8709
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D8709::
    call label_DAC28
    dec  [hl]
    ld   a, [hl]
    cp   $2E
    ret  nc
    ld   a, $98
    call label_237C
    call label_DAC02
    ld   [hl], $00
    jp   label_3B12

label_D871E::
    ld   a, $DD
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $28
    ld   hl, $C210
    add  hl, de
    ld   [hl], $30
    ret
    call label_D8365
    ld   a, $01
    ld   [$FFF2], a
    call label_D871E
    call label_C05
    ld   [hl], $60
    jp   label_3B12
    call label_D8365
    call label_C05
    ret  nz
    xor  a
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, $99
    call label_237C
    ld   a, [$DC0C]
    or   $01
    ld   [$DC0C], a
    call label_DAC02
    ld   [hl], $04
    jp   label_3B12
    call label_DAA98
    ret  nc
    ld   e, $00
    ld   a, [$DC0C]

label_D876D::
    and  a
    jr   z, label_D8779
    srl  a
    bit  0, a
    jr   z, label_D8777
    inc  e

label_D8777::
    jr   label_D876D

label_D8779::
    ld   a, [$DC0D]
    and  $0F

label_D877E::
    and  a
    jr   z, label_D878A
    bit  0, a
    jr   z, label_D8786
    inc  e

label_D8786::
    srl  a
    jr   label_D877E

label_D878A::
    ld   a, e
    add  a, $9A
    call label_237C
    ret

label_D8791::
    ld   a, [$C124]
    and  a
    ret  nz
    ld   de, label_D88FA
    call label_3BC0
    call label_DAA40
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$FFF0]
    and  a
    jr   z, label_D87B1
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a

label_D87B1::
    ld   a, [$FFF0]
    rst  0
    jp   nz, label_DE47
    ld   b, a
    ld   a, [$FF00+C]
    inc  bc
    ld   c, b
    jr   nz, label_D8806
    jr   nc, label_D8808
    ld   h, [hl]
    ld   c, b
    ld   a, [$FF98]
    cp   $56
    ret  c
    cp   $5B
    ret  nc
    ld   a, [$FF99]
    cp   $67
    ret  c
    cp   $6C
    ret  nc
    ld   a, [$FF9E]
    cp   $02
    ret  nz
    ld   a, $04
    ld   [$FF9D], a
    jp   label_3B12
    xor  a
    ld   [$FFA6], a
    ld   a, $11
    ld   [$FFA4], a
    call label_DAC23
    ld   [hl], $B0
    call label_DAC28
    ld   [hl], $6A
    jp   label_3B12
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $07
    ret  nz
    ld   [hl], a
    ld   a, $03
    ld   [$FFA4], a
    jp   label_3B12
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D8810
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D8810::
    call label_DAC23
    dec  [hl]
    ld   a, [hl]
    cp   $6A
    ret  nz
    call label_C05
    ld   [hl], $20
    jp   label_3B12
    call label_C05
    ret  nz
    ld   a, $0A
    ld   [$FF9D], a
    ld   a, $08
    call label_2373
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $04
    ld   [$FF9D], a
    ld   a, [$FF98]
    cp   $51
    jr   z, label_D8842
    dec  a
    ld   [$FF98], a

label_D8842::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D884F
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a

label_D884F::
    call label_DAC23
    ld   a, [hl]
    cp   $60
    jr   z, label_D8859
    dec  [hl]
    ret

label_D8859::
    call label_DAC02
    ld   [hl], $02
    ld   a, $09
    call label_2373
    jp   label_3B12
    ld   a, $40
    ld   [$FFF4], a
    ld   a, $13
    ld   [$DB95], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    ret
    nop
    nop
    ld   l, h
    ld   b, $00
    ld   [label_66E], sp
    dec  b
    rlca
    rst  $38
    ld   b, $00
    nop
    ld   l, b
    ld   b, $00
    ld   [label_66A], sp
    dec  b
    rlca
    rst  $38
    ld   b, $00
    inc  b
    ld   c, d
    ld   b, $00
    nop
    ld   [hl], b
    ld   b, $00
    ld   [label_672], sp
    rst  $38
    inc  b
    ld   c, d
    ld   h, $00
    nop
    ld   [hl], h
    ld   b, $00
    ld   [label_676], sp
    nop
    nop
    ld   l, [hl]
    ld   h, $00
    ld   [label_266C], sp
    dec  b
    rlca
    rst  $38
    ld   b, $00
    nop
    ld   l, d
    ld   h, $00
    ld   [label_2668], sp
    dec  b
    rlca
    rst  $38
    ld   b, $7A
    ld   c, b
    add  a, [hl]
    ld   c, b
    sub  a, d
    ld   c, b
    sbc  a, [hl]
    ld   c, b
    xor  d
    ld   c, b
    or   [hl]
    ld   c, b

label_D88CE::
    ld   b, h
    rlca
    ld   b, [hl]
    rlca
    ld   c, b
    rlca
    ld   c, d
    rlca
    ld   b, [hl]
    daa
    ld   b, h
    daa
    ld   c, d
    daa
    ld   c, b
    daa
    ld   b, b
    rlca
    ld   b, d
    rlca

label_D88E2::
    ld   [hl], b
    inc  bc
    ld   [hl], d
    inc  bc
    ld   [hl], h
    inc  bc
    db   $76 ; Halt
    inc  bc
    ld   l, d
    inc  hl
    ld   l, b
    inc  hl
    ld   l, [hl]
    inc  hl
    ld   l, h
    inc  hl

label_D88F2::
    ld   [hl], b
    ld   b, $72
    ld   b, $74
    ld   b, $76
    ld   b, $48
    ld   b, $4A
    ld   b, $4C
    ld   b, $4E
    ld   b, $70
    ld   b, $72
    ld   b, $74
    ld   b, $76
    ld   b, $4E
    ld   h, $4C
    ld   h, $4A
    ld   h, $48
    ld   h, $FA
    and  l
    db   $DB
    and  a
    jr   z, label_D892F
    ld   a, [$FFF6]
    cp   $DA
    jr   nz, label_D8925
    ld   de, label_D88E2
    call label_3BC0
    ret

label_D8925::
    cp   $B5
    jp   z, label_D829A
    cp   $A4
    jp   z, label_D8178

label_D892F::
    ld   a, [$FFF6]
    cp   $B1
    jp   z, label_D8791
    cp   $0D
    jp   z, label_D8000
    ld   a, [$DC0C]
    bit  0, a
    jp   z, label_3F8D
    bit  7, a
    jp   nz, label_3F8D
    ld   a, [$DB0E]
    cp   $0D
    jp  c, label_3F8D
    ld   de, label_D88CE
    call label_3BC0
    call label_DAA40
    ld   a, [$FFF0]
    rst  0
    ret  nc
    ld   c, c
    ld   a, e
    ld   c, c
    sub  a, d
    ld   c, c
    ret  nc
    ld   c, c
    ld   a, e

label_D8965::
    ld   c, c
    sub  a, d
    ld   c, c
    ret  nc
    ld   c, c
    jp  c, label_F649
    ld   c, c

label_D896E::
    ld   a, [$FFE7]
    and  $0F
    ret  nz
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    ret
    call label_D896E
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    call label_DABEE
    ld   e, $E8
    and  a
    jr   z, label_D898E
    ld   e, $18

label_D898E::
    ld   [hl], e
    jp   label_3B12
    call label_D896E
    call label_DABEE
    ld   a, [hl]
    bit  7, a
    jr   z, label_D89A0
    inc  a
    jr   label_D89A1

label_D89A0::
    dec  a

label_D89A1::
    ld   [hl], a
    and  a
    jr   nz, label_D89AD
    call label_C05
    ld   [hl], $38
    jp   label_3B12

label_D89AD::
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_D89C6
    ld   e, $F0

label_D89C6::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret
    call label_D896E
    call label_C05
    ret  nz
    jp   label_3B12
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    xor  $01
    ld   [hl], a
    call label_DAC02
    ld   a, [hl]
    xor  $02
    ld   [hl], a
    call label_3B12
    xor  a
    ld   [hl], a
    call label_C05
    ld   a, $20
    ld   [hl], a
    ret
    call label_DAC02
    ld   [hl], $04
    ret
    add  a, b
    add  a, b
    adc  a, b
    add  a, c
    adc  a, d
    adc  a, c
    add  a, d
    adc  a, e
    adc  a, h
    add  a, e
    nop
    nop
    add  a, h
    adc  a, l
    nop
    add  a, l
    adc  a, [hl]
    adc  a, a
    add  a, [hl]
    sub  a, b
    sub  a, c
    add  a, a
    sub  a, d
    sub  a, e

label_D8A14::
    db   $FC ; Undefined instruction
    ld   c, c
    rst  $38
    ld   c, c
    ld   [bc], a
    ld   c, d
    dec  b
    ld   c, d
    ld   [label_B4A], sp
    ld   c, d
    ld   c, $4A
    ld   de, label_34A
    ld   a, [bc]
    inc  b
    add  hl, hl
    inc  sp
    cpl
    ld   d, h
    ld   b, b
    ld   b, a
    ld   l, a
    nop
    nop
    adc  a, d
    sbc  a, d
    nop
    cp   e
    or   [hl]
    rst  $10
    ld   d, $1C
    inc  b
    ld   d, e
    ld   b, l
    ld   b, c

label_D8A3C::
    inc  h
    ld   c, d
    daa
    ld   c, d
    ld   a, [hli]
    ld   c, d
    dec  l
    ld   c, d
    jr   nc, label_D8A90
    inc  sp
    ld   c, d
    ld   [hl], $4A
    add  hl, sp
    ld   c, d
    push bc
    ld   hl, label_D8A3C
    ld   a, [$FFF7]
    sla  a
    ld   e, a
    ld   d, $00
    ld   c, d
    ld   b, d
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    dec  hl

label_D8A5E::
    inc  hl
    ld   a, [$FFF6]
    cp   [hl]
    jr   z, label_D8A6A
    inc  c
    ld   a, c
    cp   $03
    jr   nz, label_D8A5E

label_D8A6A::
    ld   hl, label_D8A14
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    add  hl, bc
    ld   a, [hl]
    ld   [$FFD7], a
    pop  bc
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$FFF0]
    rst  0
    sbc  a, a
    ld   c, d
    reti
    ld   c, d
    di
    ld   c, d
    inc  c
    ld   c, e
    ld   h, $4B
    dec  sp
    ld   c, e
    ld   d, a
    ld   c, e
    adc  a, a

label_D8A90::
    ld   c, e
    xor  h
    ld   c, e
    jp   label_CF4B
    ld   c, e

label_D8A97::
    rst  $38
    ld   a, a
    nop
    nop
    ld   [hl], c
    ld   b, h
    ld   a, a
    ld   a, l
    push bc
    call label_28CF
    ld   a, $38
    ld   b, $40
    ld   c, $06
    ld   h, $36
    call label_A13
    ld   a, $38
    ld   b, $41
    ld   c, $07
    ld   h, $36
    call label_A13
    ld   a, [$D6FD]
    ld   [rLCDC], a
    di
    ld   a, $02
    ld   [rSVBK], a
    ld   de, label_D8A97
    ld   hl, $DC80

label_D8AC9::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $07
    jr   nz, label_D8AC9
    xor  a
    ld   [rSVBK], a
    ei
    pop  bc
    jp   label_3B12
    ld   a, [$C16B]
    cp   $04
    ret  nz
    call label_C05
    ld   [hl], $10
    jp   label_3B12

label_D8AE7::
    ld   a, [$FFE7]
    and  $07
    ret  nz
    ld   a, [$FF9D]
    xor  $01
    ld   [$FF9D], a
    ret
    call label_C05
    ret  nz
    call label_D8AE7
    ld   hl, $FF99
    dec  [hl]
    ld   a, [hl]
    cp   $42
    ret  nc
    ld   a, $42
    ld   [hl], a
    ld   a, $0A
    ld   [$FF9D], a
    jp   label_3B12
    call label_D8AE7
    ld   hl, $FF98
    inc  [hl]
    ld   a, [hl]
    cp   $78
    ret  c
    ld   a, $78
    ld   [hl], a
    ld   a, $04
    ld   [$FF9D], a
    call label_C05
    ld   [hl], $60
    jp   label_3B12
    call label_D8AE7
    ld   hl, $FF99
    dec  [hl]
    ld   a, [hl]
    cp   $2C
    ret  nc
    ld   a, $2C
    ld   [hl], a
    ld   a, $04
    ld   [$FF9D], a
    jp   label_3B12
    call label_C05
    jr   nz, label_D8B4D
    call label_3B12
    ld   a, $EF
    call label_2373
    ld   a, $03
    jp   label_3B0C

label_D8B4D::
    and  $04
    ld   a, $01
    jr   z, label_D8B54
    inc  a

label_D8B54::
    jp   label_3B0C
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $FA
    call label_3B86
    ld   hl, $C200
    add  hl, de
    ld   [hl], $50
    ld   hl, $C210
    add  hl, de
    ld   [hl], $7C
    ld   hl, $C390
    add  hl, bc
    ld   [hl], e
    call label_C05
    ld   [hl], $20
    jp   label_3B12

label_D8B7A::
    ld   hl, $C390
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, $C3B0
    add  hl, de
    ld   a, [$FFE7]
    and  $07
    ret  nz
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    ret
    call label_C05
    ret  nz
    call label_D8B7A
    ld   hl, $C210
    add  hl, de
    dec  [hl]
    ld   a, [hl]
    cp   $42
    ret  nc
    ld   a, $42
    ld   [hl], a
    ld   a, $02

label_D8BA4::
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    jp   label_3B12
    call label_D8B7A
    ld   hl, $C200
    add  hl, de
    inc  [hl]
    ld   a, [hl]
    cp   $78
    ret  c
    ld   a, $78
    ld   [hl], a
    call label_C05
    ld   [hl], $30
    xor  a
    jr   label_D8BA4
    call label_C05
    ret  nz
    ld   a, $F8
    call label_2373
    jp   label_3B12
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $40
    ld   [$FFF4], a
    ld   a, $17
    ld   [$DB95], a
    xor  a
    ld   [$DB96], a
    ld   [$C16B], a
    ld   [$C16C], a
    ret
    ld   a, [$D202]
    ld   e, a
    ld   d, $00
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $01
    jr   nz, label_D8BFE
    call label_DAC89
    call label_D9CAB
    ret

label_D8BFE::
    ld   a, [$DBAF]
    push af
    ld   a, $36
    ld   [$DBAF], a
    call label_3CD9
    call label_D8C12
    pop  af
    ld   [$DBAF], a
    ret

label_D8C12::
    ld   a, [$FFF0]
    rst  0
    dec  e
    ld   c, h
    dec  h
    ld   c, h
    ld   e, h
    ld   c, h
    add  a, d
    ld   c, h
    call label_C05
    ret  nz
    call label_3B12
    ret
    ld   a, [$FFE7]
    xor  c
    and  $03
    jr   nz, label_D8C31
    ld   a, $08
    call label_3BAA

label_D8C31::
    call label_DAB8A
    cp   $18
    jr   nc, label_D8C4C
    call label_DAB9A
    cp   $18
    jr   nc, label_D8C4C
    call label_DABF8
    ld   [hl], $28
    ld   a, $10
    call label_3BAA
    call label_3B12

label_D8C4C::
    call label_DAA62
    call label_3B23
    ld   a, [$FFE7]
    rra
    rra
    and  $01
    call label_3B0C
    ret
    call label_DAA62
    call label_3B23
    call label_DAAEC
    call label_DABF8
    dec  [hl]
    dec  [hl]
    ld   a, [hl]
    cp   $02
    jr   nc, label_D8C7C
    ld   [hl], $C0
    ld   a, $10
    call label_DAC83
    call label_3D7F
    call label_3B12

label_D8C7C::
    ld   a, $02
    call label_3B0C
    ret
    call label_C05
    ret  nz
    call label_DAAEC
    call label_DAC2D
    ld   a, [hl]
    bit  7, a
    ret  z
    ld   [hl], b
    ld   a, $20
    call label_DAC83
    xor  a
    call label_DAC07
    ld   hl, $C320
    add  hl, bc
    ld   a, [hl]
    ld   [hl], b
    bit  7, a
    ret  z
    cp   $D0
    ret  nc
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    add  a, $0C
    ld   [$FFD8], a
    call label_D15
    ret

label_D8CB4::
    inc  e
    jr   z, label_D8C84
    ld   c, l
    add  hl, sp
    ld   a, c
    ld   [$D202], a
    call label_D8F4E
    ld   a, [$FFEA]
    cp   $05
    jp   nz, label_D9C3C
    ld   a, [$FFE7]
    and  $1F
    jr   nz, label_D8CD5
    call label_DAC02
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a

label_D8CD5::
    call label_3EE8
    call label_DAA40
    call label_DAA62
    ld   de, label_D8CB4
    call label_DAC90
    call label_3B39
    ld   a, [$C190]
    and  a
    ret  z
    call label_D8D03
    call label_D8D4B
    ld   a, [$FFF0]
    rst  0
    db   $EB ; Undefined instruction
    ld   e, h
    dec  hl
    ld   d, l
    or   a
    ld   c, l
    rst  8
    ld   c, l
    daa
    ld   c, [hl]
    rst  8
    ld   c, l
    and  d
    ld   c, [hl]

label_D8D03::
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $10
    jr   nz, label_D8D13
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $00
    ret

label_D8D13::
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    call label_C00
    ret  nz
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D8D28
    dec  [hl]
    ret

label_D8D28::
    ld   hl, $C360
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $10
    jr   nz, label_D8D6E
    ld   a, $6F
    call label_237C
    jr   label_D8D6E

label_D8D39::
    rra
    nop
    rra
    nop
    rra
    ld   bc, label_21F
    rra

label_D8D42::
    inc  bc
    ld   sp, label_D8407
    dec  bc
    ld   b, b
    db   $3A ; ldd  a, [hl]
    and  l
    ld   a, h

label_D8D4B::
    call label_C56
    ld   a, [hl]
    and  a
    jr   nz, label_D8D5C
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   [hl], $00
    ret

label_D8D5C::
    ld   a, $10
    ld   [$C13E], a
    ld   a, $14
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a

label_D8D6E::
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    and  $FE
    ld   e, a
    ld   d, $00
    ld   hl, label_D8D39
    add  hl, de
    ld   a, [$DC8C]
    cp   [hl]
    jr   nz, label_D8D89
    inc  hl
    ld   a, [$DC8D]
    cp   [hl]
    ret  z
    dec  hl

label_D8D89::
    ld   e, l
    ld   d, h
    ld   hl, rSVBK
    ld   a, [de]
    ld   [$DC8C], a
    ld   [hl], $02
    ld   [$DC8C], a
    ld   [hl], $00
    inc  de
    ld   a, [de]
    ld   [$DC8D], a
    ld   [hl], $02
    ld   [$DC8D], a
    ld   [hl], $00
    ld   a, $02
    ld   [$DDD1], a
    ld   hl, $C2F0
    add  hl, bc
    ld   [hl], $60
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $04
    ret
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    inc  hl
    inc  hl
    inc  hl
    ld   [hl], $14
    pop  bc
    ld   a, $6D
    call label_237C
    call label_3B12
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3B12
    ret
    ld   a, [$FFE7]
    and  $0F
    ret  nz
    call label_280D
    and  $07
    ret  nz
    call label_D8E7F
    and  a
    ret  nz
    push bc
    ld   a, $F5
    call label_3B86
    jr   c, label_D8E1B
    ld   hl, $C290
    add  hl, de
    ld   [hl], $04
    call label_DAC23
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    call label_DAC28
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C350
    add  hl, de
    set  7, [hl]
    ld   c, e
    ld   b, d
    ld   a, $10
    call label_3BAA

label_D8E1B::
    pop  bc
    ret

label_D8E1D::
    ld   a, [$00FC]
    inc  b
    ld   b, $04
    nop
    db   $FC ; Undefined instruction
    ld   a, [$CDFC]
    ret  c
    ld   c, l
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D8E5C
    ld   hl, $C2B0
    add  hl, bc
    cp   $02
    jr   nc, label_D8E42
    ld   a, [hl]
    dec  a
    and  a
    jr   nz, label_D8E42
    inc  [hl]
    jr   label_D8E50

label_D8E42::
    cp   $05
    jr   nc, label_D8E5C
    ld   a, [hl]
    and  a
    jr   nz, label_D8E5C
    inc  [hl]
    ld   a, $6E
    call label_237C

label_D8E50::
    call label_DABEE
    ld   [hl], a
    call label_DABF3
    ld   [hl], a
    call label_3B12
    ret

label_D8E5C::
    call label_C05
    ret  nz
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_D8E1F
    add  hl, de
    ld   a, [hl]
    call label_DABEE
    ld   [hl], a
    ld   hl, label_D8E1D
    add  hl, de
    ld   a, [hl]
    call label_DABF3
    ld   [hl], a
    ret

label_D8E7F::
    xor  a
    ld   [$FFD7], a
    ld   e, a
    ld   d, a

label_D8E84::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $1A
    jr   nz, label_D8E99
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_D8E99
    ld   hl, $FFD7
    inc  [hl]

label_D8E99::
    inc  de
    ld   a, e
    and  $0F
    jr   nz, label_D8E84
    ld   a, [$FFD7]
    ret
    call label_D8E7F
    cp   $02
    jr   z, label_D8EE4
    ld   a, $1A
    call label_3B86
    jr   c, label_D8EE4
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
    ld   [hl], $30
    ld   hl, $C320
    add  hl, de
    ld   [hl], $C0
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], $02
    ld   hl, $C360
    add  hl, de
    ld   [hl], $02
    ld   hl, $C290
    add  hl, de
    ld   [hl], $03
    ld   hl, $C360
    add  hl, bc
    ld   a, [hl]
    cp   $04
    ret  nc

label_D8EE4::
    ld   a, $04
    call label_DAC07
    ret
    ld   a, [$FFF8]
    ld   h, b
    rlca
    ld   a, [$FF00]
    ld   h, d
    rlca
    ld   a, [$FF08]
    ld   h, d
    daa
    ld   a, [$FF10]
    ld   h, b
    daa
    nop
    ld    hl, sp+$64
    rlca
    nop
    nop
    ld   h, [hl]
    rlca
    nop
    ld   [label_2766], sp
    nop
    db   $10 ; Undefined instruction
    daa
    db   $10 ; Undefined instruction
    ld   l, b
    ld   b, $10
    nop
    ld   l, d
    ld   b, $10
    ld   [label_66C], sp
    db   $10 ; Undefined instruction
    ld   l, [hl]
    ld   b, $F0
    ld    hl, sp+$60
    rlca
    ld   a, [$FF00]
    ld   h, d
    rlca
    ld   a, [$FF08]
    ld   h, d
    daa
    ld   a, [$FF10]
    ld   h, b
    daa
    nop
    ld    hl, sp+$64
    rlca
    nop
    nop
    ld   h, [hl]
    rlca
    nop
    ld   [label_2766], sp
    nop
    db   $10 ; Undefined instruction
    daa
    db   $10 ; Undefined instruction
    ld   l, [hl]
    ld   h, $10
    nop
    ld   l, h
    ld   h, $10
    ld   [label_266A], sp
    db   $10 ; Undefined instruction
    ld   l, b
    ld   h, $EA
    ld   c, [hl]
    ld   a, [de]
    ld   c, a

label_D8F4E::
    call label_DAC02
    ld   a, [hl]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_D8F4A
    call label_DAC7E
    ld   c, $0C
    call label_3CE6
    ld   a, $0C
    call label_3DA0
    ret
    ld   a, [$DBAF]
    push af
    ld   a, $36
    ld   [$DBAF], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, label_DAA20
    and  a
    jr   nz, label_D8F7F
    ld   hl, label_DAA28

label_D8F7F::
    ld   c, $02
    ld   a, $36
    call label_A5F
    ld   a, $02
    call label_3DA0
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D8F96
    call label_3F8D

label_D8F96::
    pop  af
    ld   [$DBAF], a
    ret
    ld   a, [$D202]
    ld   e, a
    ld   d, $00
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $01
    jr   nz, label_D8FB1
    call label_DAC89
    call label_D9CAB
    ret

label_D8FB1::
    ld   a, [$DBAF]
    push af
    ld   a, $36
    ld   [$DBAF], a
    ld   hl, label_DAA10
    ld   c, $02
    ld   a, $36
    call label_A5F
    ld   a, $02
    call label_3DA0
    pop  af
    ld   [$DBAF], a
    call label_DAA40
    ld   a, [$DBAF]
    push af
    ld   a, $36
    ld   [$DBAF], a
    call label_3CD9
    call label_DABEE
    ld   a, [hl]
    rlca
    rlca
    and  $01
    call label_3B0C
    call label_DAA62
    call label_D9000
    ld   a, [$C146]
    and  a
    jr   z, label_D8FFB
    call label_3B5A
    jr   nc, label_D8FFB
    call label_D903C

label_D8FFB::
    pop  af
    ld   [$DBAF], a
    ret

label_D9000::
    ld   a, [$FFF0]
    rst  0
    rlca
    ld   d, b
    inc  e
    ld   d, b
    call label_DAC28
    ld   a, [hl]
    cp   $50
    jr   c, label_D901B
    xor  a
    call label_DABEE
    ld   [hl], a
    call label_DABF3
    ld   [hl], a
    call label_3B12

label_D901B::
    ret
    call label_3B23
    call label_C05
    ret  nz
    ld   [hl], $30
    call label_280D
    and  $0F
    sub  a, $08
    call label_DABEE
    ld   [hl], a
    call label_280D
    and  $0F
    sub  a, $08
    call label_DABF3
    ld   [hl], a
    ret

label_D903C::
    call label_DAC89
    ld   a, $01
    ld   [$FFF3], a
    ld   d, $0C
    call label_3E6B
    ld   a, $0B
    ld   [$FFA5], a
    ld   hl, $DB76
    ld   de, $DB4C
    ld   a, [de]
    cp   [hl]
    jr   nc, label_D905E
    add  a, $10
    daa
    cp   [hl]
    jr   c, label_D905D
    ld   a, [hl]

label_D905D::
    ld   [de], a

label_D905E::
    ret
    ld   hl, label_DA9E0
    ld   a, [$FFE7]
    and  $08
    jr   z, label_D906B
    ld   hl, label_DA9F8

label_D906B::
    ld   c, $06
    ld   a, $36
    call label_A5F
    ld   a, [$DBAF]
    push af
    ld   a, $36
    ld   [$DBAF], a
    ld   a, $06
    call label_3DA0
    call label_3CD9
    pop  af
    ld   [$DBAF], a
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$DBAF]
    push af
    ld   a, $36
    ld   [$DBAF], a
    call label_394D
    pop  af
    ld   [$DBAF], a
    ld   e, $FE
    ld   hl, $C3D0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    and  $40
    jr   z, label_D90B1
    ld   e, $02

label_D90B1::
    call label_DABF8
    ld   [hl], e
    call label_DAAEC
    ld   a, [$DBAF]
    push af
    ld   a, $36
    ld   [$DBAF], a
    call label_D90C9
    pop  af
    ld   [$DBAF], a
    ret

label_D90C9::
    ld   a, [$FFF0]
    rst  0
    db   $E4 ; Undefined instruction
    ld   d, b
    rla
    ld   d, c
    inc  [hl]
    ld   d, c
    ld   e, c
    ld   d, c
    sub  a, [hl]
    ld   d, c
    and  [hl]
    ld   d, c
    ld   c, e
    ld   d, d
    ret  c
    ld   d, d
    ld   a, [$C052]
    ld   d, e
    jr   z, label_D9136
    ld   c, [hl]
    ld   d, h
    call label_DAB8A
    cp   $10
    ret  nc
    call label_DAB9A
    cp   $24
    ret  nc
    ld   a, [$FF9E]
    cp   $02
    ret  nz
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$FFCC]
    and  $10
    ret  z
    ld   a, $68
    call label_237C
    xor  a
    ld   [$C16C], a
    ld   [$C16B], a
    ld   [$D47C], a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_3B12
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C177]
    and  a
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    ld   e, $5D
    and  a
    jr   z, label_D912C
    ld   e, $AE

label_D912C::
    ld   a, e
    call label_237C
    call label_3B12
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C177]
    and  a
    jr   nz, label_D9148
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    call label_3B12
    ret

label_D9148::
    ld   a, $5C
    call label_237C
    ld   a, $01
    call label_DAC07
    ret

label_D9153::
    ld   a, $36
    call label_A6B
    ret
    ld   a, $01
    ld   [$FFA1], a
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $01
    ld   [$FFF2], a
    ld   a, [$FF98]
    ld   a, $B9
    call label_3B86
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, de
    ld   [hl], a
    call label_D9153
    ld   a, $60
    call label_DAC83
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], e
    call label_3B12
    ret
    call label_D9153
    call label_C05
    ret  nz
    ld   a, $6B
    call label_237C
    call label_3B12
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_D9153
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], $00
    call label_3B12
    ret

label_D91BF::
    nop
    ld   [label_1810], sp
    ld   bc, label_1109
    add  hl, de
    ld   [bc], a
    ld   a, [bc]
    ld   [de], a
    ld   a, [de]
    inc  bc
    dec  bc
    inc  de
    dec  de
    inc  b
    inc  c
    inc  d
    inc  e
    dec  b
    dec  c
    dec  d
    dec  e
    ld   b, $0E
    ld   d, $1E
    rlca
    rrca
    rla
    rra

label_D91DF::
    ld   a, $07
    ld   [$FFA4], a
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, label_D91BF
    add  hl, de
    ld   e, [hl]
    ld   hl, $DCC0
    add  hl, de
    ld   [hl], $00
    ret

label_D91F6::
    ld   a, [$FFD7]
    inc  a
    bit  5, a
    jr   z, label_D91FF
    ld   a, $1F

label_D91FF::
    ld   [$FFD7], a
    ld   a, [$FFD8]
    sub  a, $02
    and  a
    jr   nz, label_D920A
    ld   a, $02

label_D920A::
    ld   [$FFD8], a
    ld   a, [$FFD9]
    sub  a, $04
    cp   $14
    jr   nc, label_D9216
    ld   a, $14

label_D9216::
    ld   [$FFD9], a
    ret

label_D9219::
    ld   a, [$FFD7]
    dec  a
    cp   $03
    jr   nc, label_D9222
    ld   a, $03

label_D9222::
    ld   [$FFD7], a
    ld   a, [$FFD8]
    bit  5, a
    jr   nz, label_D9234
    add  a, $02
    cp   $20
    jr   c, label_D923C
    ld   a, $20
    jr   label_D923C

label_D9234::
    sub  a, $02
    cp   $20
    jr   nc, label_D923C
    ld   a, $20

label_D923C::
    ld   [$FFD8], a
    ld   a, [$FFD9]
    add  a, $04
    bit  7, a
    jr   z, label_D9248
    ld   a, $7C

label_D9248::
    ld   [$FFD9], a
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$FFE7]
    and  $03
    ret  nz
    ld   hl, $C2D0
    add  hl, bc
    inc  [hl]
    ld   hl, $DC54
    ld   a, [$DC0F]
    and  a
    jr   z, label_D926E
    inc  a
    swap a
    srl  a
    ld   e, a
    ld   d, $00
    add  hl, de

label_D926E::
    push hl
    ld   a, [hl]
    and  $1F
    ld   [$FFD7], a
    ld   a, [hli]
    and  $E0
    swap a
    ld   e, a
    ld   a, [hl]
    and  $03
    swap a
    or   e
    ld   [$FFD8], a
    ld   a, [hl]
    and  $7C
    ld   [$FFD9], a
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_D9294
    call label_D91F6
    jr   label_D9297

label_D9294::
    call label_D9219

label_D9297::
    pop  hl
    ld   a, [$FFD7]
    ld   e, a
    ld   a, [$FFD8]
    and  $0E
    swap a
    or   e
    ldi  [hl], a
    ld   a, [$FFD8]
    and  $30
    swap a
    ld   e, a
    ld   a, [$FFD9]
    or   e
    ld   [hl], a
    ld   a, $02
    ld   [$DDD1], a
    call label_D91DF
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    cp   $20
    ret  nz
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [$DC0F], a
    ld   hl, $C2D0
    add  hl, bc
    ld   e, [hl]
    ld   d, $00
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], $01
    call label_3B12
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$C19F]
    and  a
    ret  nz
    xor  a
    ld   [$FFA4], a
    ld   e, $5B
    ld   a, [$DC0F]
    cp   $01
    jr   z, label_D92F2
    ld   e, $5A

label_D92F2::
    ld   a, e
    call label_237C
    call label_3B12
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$FFE7]
    and  $03
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    push hl
    ld   a, $36
    call label_A83
    pop  hl
    inc  [hl]
    ld   a, [hl]
    cp   $60
    ret  nz
    xor  a
    ld   [hl], a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$C12F], a
    ld   [$C12E], a
    ld   hl, $D6FD
    res  5, [hl]
    call label_3B12
    ret

label_D9330::
    sbc  a, b
    nop
    ld   d, e
    ld   a, a
    sbc  a, b
    jr   nz, label_D938A
    ld   a, a
    sbc  a, b
    ld   b, b
    ld   d, e
    ld   a, a
    sbc  a, b
    ld   h, b
    ld   d, e
    ld   a, a
    sbc  a, b
    add  a, b
    ld   d, e
    ld   a, a
    sbc  a, b
    and  b
    ld   d, e
    ld   a, a
    sbc  a, b
    ret  nz
    ld   d, e
    ld   a, a
    sbc  a, b
    ld   [rHDMA3], a
    ld   a, a
    sbc  a, c
    nop
    ld   d, e
    ld   a, a
    sbc  a, c
    jr   nz, label_D93AA
    ld   a, a
    sbc  a, c
    ld   b, b
    ld   d, e
    ld   a, a
    sbc  a, c
    ld   h, b
    ld   d, e
    ld   a, a
    sbc  a, c
    add  a, b
    ld   d, e
    ld   a, a
    sbc  a, c
    and  b
    ld   d, e
    ld   a, a
    sbc  a, c
    ret  nz
    ld   d, e
    ld   a, a
    sbc  a, c
    ld   [rHDMA3], a
    ld   a, a
    sbc  a, d
    nop
    ld   d, e
    ld   a, a
    sbc  a, d
    jr   nz, label_D93CA
    ld   a, a

label_D9378::
    sbc  a, b
    nop
    ld   d, e
    nop
    sbc  a, b
    jr   nz, label_D93D2
    nop
    sbc  a, b
    ld   b, b
    ld   d, e
    nop
    sbc  a, b
    ld   h, b
    ld   d, e
    nop
    sbc  a, b
    add  a, b

label_D938A::
    ld   d, e
    nop
    sbc  a, b
    and  b
    ld   d, e
    nop
    sbc  a, b
    ret  nz
    ld   d, e
    nop
    sbc  a, b
    ld   [rHDMA3], a
    nop
    sbc  a, c
    nop
    ld   d, e
    nop
    sbc  a, c
    jr   nz, label_D93F2
    nop
    sbc  a, c
    ld   b, b
    ld   d, e
    nop
    sbc  a, c
    ld   h, b
    ld   d, e
    nop
    sbc  a, c
    add  a, b

label_D93AA::
    ld   d, e
    nop
    sbc  a, c
    and  b
    ld   d, e
    nop
    sbc  a, c
    ret  nz
    ld   d, e
    nop
    sbc  a, c
    ld   [rHDMA3], a
    nop
    sbc  a, d
    nop
    ld   d, e
    nop
    sbc  a, d
    jr   nz, label_D9412
    nop
    call label_D9153
    push bc
    ld   hl, $C2B0
    add  hl, bc
    ld   c, [hl]
    sla  c
    sla  c
    sla  c
    ld   hl, label_D9330

label_D93D2::
    add  hl, bc
    ld   c, l
    ld   b, h
    ld   a, [$D600]
    ld   e, a
    add  a, $08
    ld   [$D600], a
    ld   d, $00
    ld   hl, $D601
    add  hl, de
    ld   e, $08

label_D93E6::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_D93E6
    ld   [hl], $00
    pop  bc
    push bc
    ld   hl, $C2B0
    add  hl, bc
    ld   c, [hl]
    sla  c
    sla  c
    sla  c
    ld   hl, label_D9378
    add  hl, bc
    ld   c, l
    ld   b, h
    ld   a, [$DC90]
    ld   e, a
    add  a, $08
    ld   [$DC90], a
    ld   d, $00
    ld   hl, $DC91
    add  hl, de
    ld   e, $08

label_D9412::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  e
    jr   nz, label_D9412
    ld   [hl], $00
    pop  bc
    ld   hl, $C2B0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    cp   $09
    ret  nz
    call label_3B12
    ret
    ld   de, $DC18
    ld   hl, rSVBK
    di

label_D942F::
    ld   [hl], $02
    ld   a, [de]
    ld   [hl], $00
    ld   [de], a
    inc  de
    ld   a, e
    and  $07
    jr   nz, label_D942F
    ld   a, $01
    ld   [$DDD1], a
    ei
    ld   a, $3A
    ld   [$FF99], a
    ld   a, $6C
    call label_237C
    call label_3B12
    ret
    call label_D9153
    ld   a, [$C19F]
    and  a
    ret  nz
    call label_3F8D
    call label_C9E
    ret

label_D945D::
    ld   a, [$DB4B]
    and  a
    ret  nz
    ld   e, $00
    ld   d, e

label_D9465::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $86
    jr   nz, label_D9475
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    ret  nz

label_D9475::
    inc  de
    ld   a, e
    and  $0F
    jr   nz, label_D9465
    ld   a, $86
    call label_3B86
    ret  c
    ld   hl, $C200
    add  hl, de
    ld   [hl], $20
    call label_280D
    and  $01
    jr   z, label_D9490
    ld   [hl], $88

label_D9490::
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], $0C
    bit  7, a
    jr   z, label_D949D
    ld   [hl], $F4

label_D949D::
    ld   hl, $C210
    add  hl, de
    ld   [hl], $18
    ld   hl, $C250
    add  hl, de
    ld   [hl], $0C
    ld   hl, $C310
    add  hl, de
    ld   [hl], $10
    ret

label_D94B0::
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$DB4B]
    and  a
    ret  z
    ld   a, [$DB00]
    cp   $0C
    jr   nz, label_D94C8
    ld   a, [$FFCC]
    and  $20
    ret  z
    jr   label_D94D3

label_D94C8::
    ld   a, [$DB01]
    cp   $0C
    ret  nz
    ld   a, [$FFCC]
    and  $10
    ret  z

label_D94D3::
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $00
    ld   hl, $C280
    add  hl, bc
    ld   a, $01
    ld   [hl], a
    pop  af
    ret
    call label_394D
    ld   a, c
    ld   [$D202], a
    call label_D9844
    ld   a, [$FFEA]
    cp   $05
    jp   nz, label_D9C3C
    ld   a, [$DB4C]
    and  a
    jr   nz, label_D94FE
    push bc
    call label_D945D
    pop  bc

label_D94FE::
    call label_3EE8
    call label_C56
    call label_DAA40
    ld   a, [$FFF0]
    cp   $03
    jr   c, label_D9510
    call label_D94B0

label_D9510::
    ld   a, [$FFF0]
    rst  0
    scf
    ld   d, l
    ld   h, c
    ld   d, l
    ld   [hl], l
    ld   d, l
    dec  hl
    ld   d, l
    adc  a, [hl]
    ld   d, l
    or   c
    ld   d, l
    ld   hl, label_2B57
    ld   d, l
    ld   a, $57
    adc  a, a
    ld   d, a
    xor  a
    ld   d, a
    ret  z
    ld   d, a
    ld   a, $01
    ld   [$FFA1], a
    call label_C05
    ret  nz
    call label_3B12
    ret
    ld   a, [$C190]
    and  a
    ret  z
    xor  a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$FFE7]
    and  $07
    ret  nz
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    cp   $04
    ret  c
    xor  a
    ld   [hl], a
    ld   a, $20
    call label_DAC83
    call label_3B12
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_C05
    ret  nz
    ld   a, $61
    call label_237C
    call label_3B12
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $20
    call label_DAC83
    xor  a
    ld   [$C167], a
    call label_3B12
    ret
    ld   a, $01
    ld   [$FFA1], a
    ld   a, [$FFE7]
    and  $03
    ret  nz
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    cp   $0B
    ret  nz
    xor  a
    ld   [hl], a
    call label_3B12
    ret

label_D95A5::
    ld   a, [$00FC]
    inc  b
    ld   b, $04
    nop
    db   $FC ; Undefined instruction
    ld   a, [label_1CFC]
    db   $10 ; Undefined instruction
    sbc  a, a
    pop  bc
    and  a
    ret  nz
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D95E0
    call label_DAC02
    ld   a, [hl]
    and  $01
    jr   nz, label_D95E0
    ld   [hl], a
    call label_DABEE
    ld   [hl], a
    call label_DABF3
    ld   [hl], a
    ld   hl, $C2D0
    add  hl, bc
    ld   [hl], $01
    ld   a, $20
    call label_DAC83
    ld   a, $07
    call label_DAC07
    ret

label_D95E0::
    call label_C05
    jr   nz, label_D9603
    call label_280D
    and  $3F
    add  a, $30
    ld   [hl], a
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_D95A7
    add  hl, de
    ld   a, [hl]
    call label_DABEE
    ld   [hl], a
    ld   hl, label_D95A5
    add  hl, de
    ld   a, [hl]
    call label_DABF3
    ld   [hl], a

label_D9603::
    call label_DAA62
    ld   de, label_D95AF
    call label_DAC90
    ld   hl, $C290
    add  hl, bc
    ld   e, [hl]
    ld   hl, $C360
    add  hl, bc
    ld   d, [hl]
    push de
    ld   [hl], $0F
    call label_3B39
    pop  de
    ld   hl, $C360
    add  hl, bc
    ld   [hl], d
    ld   hl, $C290
    add  hl, bc
    ld   [hl], e
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $05
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D9673
    xor  a
    ld   [hl], a
    ld   hl, $C410
    add  hl, bc
    ld   [hl], a
    ld   a, [$C16E]
    ld   hl, $C137
    or   [hl]
    ld   hl, $C14D
    or   [hl]
    and  a
    jr   nz, label_D9652
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $01
    jr   label_D9673

label_D9652::
    ld   hl, $C2D0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_D9661
    ld   [hl], $01
    ld   a, $69
    call label_237C

label_D9661::
    ld   a, $10
    ld   [$C13E], a
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a

label_D9673::
    ld   a, [$FFE7]
    and  $0F
    ret  nz
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    cp   $04
    ret  nz
    xor  a
    ld   [hl], a
    call label_280D
    and  $03
    ret  nz
    call label_3B12
    ret

label_D968C::
    ld    hl, sp+$00
    ld   [$FFF4], a
    ld   [bc], a
    db   $10 ; Undefined instruction
    db   $FC ; Undefined instruction
    nop
    ld   b, $F8
    nop
    ld   [de], a
    inc  c
    ld   [bc], a
    ld   [$FFF4], a
    db   $FC ; Undefined instruction
    nop
    ld   b, $10
    inc  c
    ld  [$FF00+C], a
    db   $F4 ; Undefined instruction
    nop
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  b
    ld   [$FFF4], a
    db   $10 ; Undefined instruction
    nop
    ld   [$FFF4], a
    ld  [$FF00+C], a
    db   $F4 ; Undefined instruction
    inc  b

label_D96B4::
    ld   hl, $C2C0
    add  hl, bc
    inc  [hl]
    ld   a, [hl]
    ld   hl, label_D968C
    and  $01
    jr   nz, label_D96C4
    ld   hl, label_D96A0

label_D96C4::
    call label_D96CD
    call label_D96CD
    call label_D96CD

label_D96CD::
    push hl
    ld   a, $F5
    call label_3B86
    pop  hl
    ret  c
    push hl
    ld   hl, $C290
    add  hl, de
    ld   [hl], $02
    call label_DAC23
    ld   a, [hl]
    pop  hl
    add  a, [hl]
    inc  hl
    push hl
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    pop  hl
    ld   a, [hli]
    push hl
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    call label_DAC28
    ld   a, [hl]
    pop  hl
    add  a, [hl]
    inc  hl
    push hl
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    pop  hl
    ld   a, [hli]
    push hl
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    pop  hl
    ld   a, [hli]
    push hl
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, de
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C350
    add  hl, de
    set  7, [hl]
    pop  hl
    ret
    ld   a, [$FFE7]
    and  $03
    ret  nz
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    cp   $03
    jr   z, label_D9736
    and  $01
    ret  z
    call label_D96B4
    ret

label_D9736::
    xor  a
    ld   [hl], a
    ld   a, $05
    call label_DAC07
    ret
    ld   a, [$FFE7]
    and  $03
    ret  nz
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    cp   $07
    ret  nz
    xor  a
    ld   [hl], a
    call label_3B12
    ld   a, $F0
    call label_DAC83
    ret

label_D9756::
    ld   de, label_D95AF
    call label_DAC90
    call label_3B39
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  nz
    call label_DAC02
    ld   a, [hl]
    and  a
    ret  nz
    ld   [hl], a
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a

label_D9779::
    xor  a
    ld   hl, $C410
    add  hl, bc
    ld   [hl], a
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ld   a, $20
    call label_DAC83
    ld   a, $03
    call label_DAC07
    ret
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D97AB
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    cp   $02
    jr   nz, label_D97AB
    ld   a, $08
    call label_3BAA
    call label_DABF8
    ld   [hl], $20
    call label_3B12

label_D97AB::
    call label_D9756
    ret
    call label_DAA62
    call label_DAAEC
    call label_DABF8
    dec  [hl]
    call label_DAC2D
    ld   a, [hl]
    bit  7, a
    ret  z
    call label_DAC02
    inc  [hl]
    call label_3B12
    ret
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_D97E6
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    cp   $04
    jr   nz, label_D97E6
    xor  a
    ld   [hl], a
    ld   a, $09
    call label_DAC07
    call label_C05
    jr   nz, label_D97E6
    call label_D9779

label_D97E6::
    call label_D9756
    ret
    jr   c, label_D9855
    ld   d, b
    ld   l, c
    ld   l, b
    ld   l, c
    ld   d, b
    ld   l, c
    jr   c, label_D985D
    ld   d, b
    ld   l, c
    ld   l, b
    ld   l, c
    ld   d, b
    ld   l, c
    jr   c, label_D9865
    ld   d, b
    ld   l, c
    ld   l, b
    ld   l, c
    ld   d, b
    ld   l, c
    jr   c, label_D986D
    ld   d, b
    ld   l, c
    add  a, b
    ld   l, c
    add  a, b
    ld   l, c
    sbc  a, b
    ld   l, c
    add  a, b
    ld   l, c
    or   b
    ld   l, c
    add  a, b
    ld   l, c
    ret  z
    ld   l, c
    add  a, b
    ld   l, c
    add  a, b
    ld   l, c
    ld   d, b
    ld   l, c
    jr   c, label_D9885
    ld   d, b
    ld   l, c
    ld   l, b
    ld   l, c
    ld   d, b
    ld   l, c
    jr   c, label_D988D
    jr   c, label_D988F
    ld   d, b
    ld   l, c
    ld   l, b
    ld   l, c
    ld   d, b
    ld   l, c

label_D982C::
    ld   [$EA57], a
    ld   d, a
    ld   [$EA57], a
    ld   d, a
    ld   a, [$FF00+C]
    ld   [label_1058], sp
    ld   e, b
    db   $10 ; Undefined instruction
    ld   d, $58
    inc  h
    ld   e, b
    inc  h
    ld   e, b
    inc  h
    ld   e, b

label_D9844::
    ld   d, $00
    ld   a, [$FFF0]
    sla  a
    ld   e, a
    ld   hl, label_D982C
    call label_DAC7E
    push hl
    call label_DAC02

label_D9855::
    ld   e, [hl]
    sla  e
    pop  hl
    call label_DAC7E
    ld   c, $06
    ld   a, $36
    call label_A5F
    ld   a, $06

label_D9865::
    call label_3DA0
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]

label_D986D::
    push af
    or   $10

label_D9870::
    ld   [hl], a
    push hl
    call label_3CD9
    pop  hl
    pop  af

label_D9877::
    ld   [hl], a
    ret

label_D9879::
    ld   e, b
    ld   [bc], a
    ld   e, d
    nop
    ld   e, d
    jr   nz, label_D9870
    pop  af
    and  a
    jr   z, label_D988C
    ld   de, label_D9877
    call label_3BC0
    jr   label_D9892

label_D988C::
    ld   de, label_D9879

label_D988F::
    call label_3C77

label_D9892::
    ld   a, [$FFF0]
    rst  0
    and  c
    ld   e, b
    cp   c
    ld   e, b
    cp   c
    ld   e, b
    db   $E4 ; Undefined instruction
    ld   e, b
    ld   [de], a
    ld   e, c
    jr   nc, label_D98FA
    ld   a, [$C157]
    and  a
    jr   z, label_D98B8
    cp   $05
    jr   nc, label_D98B8
    call label_DABF3
    ld   [hl], $14
    call label_DABF8
    ld   [hl], $10
    call label_3B12

label_D98B8::
    ret
    call label_DAA62
    call label_DAAEC
    ld   a, [$FFE7]
    and  $01
    jr   z, label_D98CD
    call label_DABF3
    ld   a, [hl]
    and  a
    jr   z, label_D98CD
    dec  [hl]

label_D98CD::
    call label_DABF8
    dec  [hl]
    call label_DAC2D
    ld   a, [hl]
    bit  7, a
    jr   z, label_D98E3
    xor  a
    ld   [hl], a
    call label_DABF8
    ld   [hl], $10
    call label_3B12

label_D98E3::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_D9911
    call label_DAB8A
    cp   $07
    jr   nc, label_D9911
    call label_DAB9A
    cp   $0B
    jr   nc, label_D9911
    ld   a, [$FF9E]

label_D98FA::
    cp   $02
    jr   nz, label_D9911
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$FFCC]
    and  $10
    jr   z, label_D9911
    ld   a, $66
    call label_237C
    call label_3B12

label_D9911::
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$C177]
    and  a
    jr   nz, label_D992A
    call label_DAC0D
    ld   a, $67
    call label_237C
    call label_3B12
    jr   label_D992F

label_D992A::
    ld   a, $03
    call label_DAC07

label_D992F::
    ret
    ld   a, [$C19F]
    and  a
    jr   nz, label_D993E
    call label_DAC0D
    ld   a, $03
    call label_DAC07

label_D993E::
    ret
    push bc
    sla  c
    sla  c
    ld   hl, $D580
    add  hl, bc
    inc  hl
    inc  hl
    ld   a, $06
    ldi  [hl], a
    ldi  [hl], a
    pop  bc
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $FF
    call label_D9AC8
    ld   a, [$C19F]
    and  a
    jr   nz, label_D9964
    call label_DAB5C
    call label_3B5A

label_D9964::
    xor  a
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    ld   hl, $C410
    add  hl, bc
    ld   [hl], a
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, [$FFF0]
    rst  0
    jp   label_A59
    ld   e, d
    dec  sp
    ld   e, d
    ld   b, b
    ld   e, d
    ld   a, l
    ld   e, d
    add  a, a
    ld   e, d

label_D9989::
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    xor  $01
    ld   de, rIE

label_D9993::
    inc  de
    ld   hl, $C3A0
    add  hl, de
    cp   [hl]
    jr   nz, label_D9993
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $03
    ret  nz
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    call label_DABEE
    ld   [hl], $FA
    and  $01
    jr   nz, label_D99B3
    ld   [hl], $06

label_D99B3::
    ld   a, $04
    call label_3B0C
    ld   a, $01
    ld   [$FFA1], a
    ld   a, $05
    call label_DAC07
    pop  af
    ret
    call label_D9989
    call label_DAB8A
    cp   $04
    jr   nc, label_D9A00
    call label_DAB9A
    cp   $0B
    jr   nc, label_D9A00
    ld   a, e
    and  $04
    jr   z, label_D9A00
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$FFCC]
    and  $10
    jr   z, label_D9A00
    ld   hl, $C2B0
    add  hl, bc
    ld   a, $01
    ld   [hl], a
    ld   e, $60
    ld   a, [$FFFE]
    and  a
    jr   nz, label_D99F9
    ld   a, $62
    call label_237C
    jr   label_D9A00

label_D99F9::
    ld   a, e
    call label_237C
    call label_3B12

label_D9A00::
    ld   a, [$FFE7]
    swap a
    and  $01
    call label_3B0C
    ret
    ld   a, [$FFEB]
    sub  a, $F6
    ld   e, a
    ld   a, [$C177]
    cp   e
    jr   nz, label_D9A1E
    ld   a, $64
    call label_237C
    call label_3B12
    ret

label_D9A1E::
    call label_DABEE
    ld   [hl], $FA
    ld   a, e
    and  a
    jr   z, label_D9A2B
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_D9A2B::
    ld   a, $02
    call label_3B0C
    ld   a, $65
    call label_237C
    ld   a, $03
    call label_DAC07
    ret
    xor  a
    call label_DAC07
    ret
    ld   a, $02
    ld   [$FFA1], a
    ld   [$C167], a
    call label_DAC23
    ld   e, $5F
    ld   a, [hl]
    cp   $3C
    jr   z, label_D9A57
    ld   e, $5E
    cp   $63
    jr   nz, label_D9A6A

label_D9A57::
    ld   a, [$DB95]
    cp   $0B
    jr   nz, label_D9A6A
    xor  a
    ld   [$C167], a
    ld   a, e
    call label_237C
    call label_3B12
    ret

label_D9A6A::
    call label_DAA62
    call label_DAC02
    ld   a, [$FFE7]
    srl  a
    srl  a
    srl  a
    and  $01
    xor  [hl]
    ld   [hl], a
    ret
    ld   a, [$FFE7]
    swap a
    and  $01
    call label_3B0C
    ret
    call label_DAC23
    ld   a, [hl]
    cp   $50
    jr   nz, label_D9A6A
    xor  a
    call label_DAC07
    ret
    ld   b, b
    inc  bc
    ld   b, d
    inc  bc
    ld   b, d
    inc  hl
    ld   b, b
    inc  hl
    ld   c, b
    inc  bc
    ld   c, d
    inc  bc
    ld   c, h
    inc  bc
    ld   c, [hl]
    inc  bc
    ld   c, d
    inc  hl
    ld   c, b
    inc  hl
    ld   c, [hl]
    inc  hl
    ld   c, h
    inc  hl
    ld   b, b
    ld   [bc], a
    ld   b, d
    ld   [bc], a
    ld   b, d
    ldi  [hl], a
    ld   b, b
    ldi  [hl], a
    ld   c, d
    ldi  [hl], a
    ld   c, b
    ldi  [hl], a
    ld   c, [hl]
    ldi  [hl], a
    ld   c, h
    ldi  [hl], a
    ld   c, b
    ld   [bc], a
    ld   c, d
    ld   [bc], a
    ld   c, h
    ld   [bc], a
    ld   c, [hl]
    ld   [bc], a

label_D9AC4::
    sub  a, h
    ld   e, d
    xor  h
    ld   e, d

label_D9AC8::
    ld   d, $00
    ld   a, [$FFEB]
    sub  a, $F6
    sla  a
    ld   e, a
    ld   hl, label_D9AC4
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    call label_3BC0
    ret

label_D9ADC::
    ld   b, b
    ld   bc, label_2140
    ld   b, d
    ld   bc, label_2142

label_D9AE4::
    ld   de, label_D9ADC
    call label_3BC0
    call label_DAA40
    call label_C56
    call label_3B39
    call label_DAA62
    call label_DAC15
    jp   label_D9BE8

label_D9AFC::
    ld   [hl], h
    ld   bc, label_176
    ld   [hl], h
    inc  b
    db   $76 ; Halt
    inc  b
    ld   [hl], b
    ld   bc, label_172
    ld   [hl], b
    inc  b
    ld   [hl], d
    inc  b
    db   $76 ; Halt
    ld   hl, label_2174
    db   $76 ; Halt
    inc  h
    ld   [hl], h
    inc  h
    ld   a, b
    ld   bc, label_17A
    ld   a, b
    inc  b
    ld   a, d
    inc  b

label_D9B1C::
    ld   de, label_D9AFC
    call label_3BC0
    call label_DAA40
    call label_C56
    call label_3B39
    call label_DAA62
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFE7]
    and  $04
    srl  a
    srl  a
    or   [hl]
    call label_DAC02
    ld   [hl], a
    jp   label_D9BE8

label_D9B42::
    ld   l, h
    rlca
    ld   l, [hl]
    rlca
    ld   l, [hl]
    daa
    ld   l, h
    daa
    ld   l, [hl]
    ld   h, a
    ld   l, h
    ld   h, a
    ld   l, h
    ld   b, a
    ld   l, [hl]
    ld   b, a

label_D9B52::
    inc  c
    db   $F4 ; Undefined instruction
    dec  b
    ei

label_D9B56::
    ld   [label_60A], sp

label_D9B59::
    inc  c

label_D9B5A::
    jr   label_D9B7C
    inc  e
    jr   z, label_D9B59
    ld   [bc], a
    jp   nc, label_165F
    nop
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $01
    jr   nz, label_D9B73
    call label_DAC89
    call label_D9CAB

label_D9B73::
    ld   a, [$FFF0]
    bit  1, a
    jr   nz, label_D9B1C
    bit  2, a
    jp   nz, label_D9AE4
    ld   de, label_D9B42
    call label_3BC0
    call label_DAA40
    call label_C56
    call label_3B39
    ld   a, [$FFE7]
    rra
    rra
    rra
    and  $03
    call label_3B0C
    call label_DAA62
    ld   a, [$FFF0]
    bit  3, a
    jr   nz, label_D9BE8
    call label_DAAEC
    call label_3CD9
    call label_DABF8
    dec  [hl]
    dec  [hl]
    call label_DAC2D
    ld   a, [hl]
    and  $80
    jr   z, label_D9BE8
    ld   [hl], b
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_D9B52
    add  hl, de
    ld   a, [hl]
    call label_DABEE
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_D9B56
    add  hl, de
    ld   a, [hl]
    call label_DABF3
    ld   [hl], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, b
    ld   hl, label_D9B5A
    add  hl, de
    ld   a, [hl]
    call label_DABF8
    ld   [hl], a
    ld   a, $20
    ld   [$FFF2], a

label_D9BE8::
    ld   a, [$FFEE]
    cp   $A8
    jp   nc, label_DAC89
    ld   a, [$FFEC]
    cp   $84
    jp   nc, label_DAC89
    ret
    call label_394D
    ld   a, c
    ld   [$D202], a
    call label_D9F75
    call label_3CD9
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_D9C3C
    call label_3EE8
    call label_DAA40
    ld   a, [$C190]
    and  a
    ret  z
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_D9C23
    xor  a
    ld   hl, $C410
    add  hl, bc
    ld   [hl], a

label_D9C23::
    ld   a, [$FFF0]
    rst  0
    db   $EB ; Undefined instruction
    ld   e, h
    dec  hl
    ld   d, l
    db   $F4 ; Undefined instruction
    ld   e, h
    dec  bc
    ld   e, l
    ld   l, b
    ld   e, l
    sbc  a, b
    ld   e, l
    jp   label_F35D
    ld   e, l
    inc  e
    ld   e, [hl]
    ld   e, c
    ld   e, [hl]
    dec  d
    ld   e, a

label_D9C3C::
    ld   hl, $C390
    add  hl, bc
    ld   a, [hl]
    rst  0
    ld   c, b
    ld   e, h
    ld   e, c
    ld   e, h
    ld   l, c
    ld   e, h
    call label_C05
    ld   [hl], $A0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF

label_D9C53::
    ld   hl, $C390
    add  hl, bc
    inc  [hl]
    ret
    call label_C05
    ret  nz
    ld   [hl], $C0
    ld   hl, $C420
    add  hl, bc
    ld   [hl], $FF
    call label_D9C53
    ret
    call label_C05
    jr   z, label_D9C72
    call label_D9C8B
    ret

label_D9C72::
    ld   a, $1A
    ld   [$FFF4], a
    call label_27DD
    call label_3F50
    xor  a
    ld   [$C167], a
    ld   hl, $DDE0
    ld   a, [$FFF6]
    ld   e, a
    ld   d, b
    add  hl, de
    set  5, [hl]
    ret

label_D9C8B::
    and  $07
    ret  nz
    call label_280D
    and  $1F
    sub  a, $10
    ld   e, a
    ld   hl, $FFEE
    add  a, [hl]
    ld   [hl], a
    call label_280D
    and  $1F
    sub  a, $14
    ld   e, a
    ld   hl, $FFEC
    add  a, [hl]
    ld   [hl], a
    call label_DAA46

label_D9CAB::
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    ld   a, $13
    ld   [$FFF4], a
    ret

label_D9CBD::
    call label_3B39
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, $10
    ld   [$C13E], a
    ld   a, $20
    call label_3BB5
    ld   a, [$FFD7]
    ld   [$FF9B], a
    ld   a, [$FFD8]
    ld   [$FF9A], a
    ld   a, $30
    call label_DAC83
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $06
    ld   a, $08
    call label_DAC07
    and  a
    ret
    ld   a, $10
    call label_DAC83
    call label_3B12
    ret
    ld   a, $6A
    call label_237C
    call label_3B12
    ret
    ld   a, [$C19F]
    and  a
    ret  nz
    ld   a, $10
    call label_DAC83
    call label_3B12
    ret
    call label_D9CBD
    ret  nz
    call label_C05
    ret  nz
    xor  a
    call label_DABEE
    ld   [hl], a
    call label_DABF3
    ld   [hl], a
    ld   hl, $C2D0
    add  hl, bc
    call label_280D
    and  [hl]
    jr   nz, label_D9D39
    ld   [hl], $01
    call label_DABF8
    ld   [hl], $18
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], $00
    ld   a, $09
    call label_DAC07
    ret

label_D9D39::
    ld   a, $20
    call label_DAC83
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], $06
    call label_DABFD
    ld   [hl], $03
    call label_3B12
    call label_280D
    and  $01
    jr   z, label_D9D62
    ld   [hl], $06
    call label_DABEE
    call label_280D
    and  $01
    jr   nz, label_D9D65
    ld   [hl], $C0
    ret

label_D9D62::
    call label_DABF3

label_D9D65::
    ld   [hl], $40
    ret
    call label_D9CBD
    ret  nz
    call label_C05
    jr   nz, label_D9D97
    call label_DAA62
    call label_3B23
    call label_DAC0D
    ld   a, $20
    call label_DAC83
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    and  a
    jr   nz, label_D9D97
    ld   [hl], $06
    call label_DABF3
    ld   [hl], $C0
    ld   a, $30
    call label_DAC83
    call label_3B12

label_D9D97::
    ret
    call label_D9CBD
    ret  nz
    call label_C05
    jr   nz, label_D9DC2
    call label_DAA62
    call label_3B23
    call label_DAC0D
    ld   a, $20
    call label_DAC83
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    and  a
    jr   nz, label_D9DC2
    ld   a, $30
    call label_DAC83
    ld   a, $03
    call label_DAC07

label_D9DC2::
    ret
    call label_D9CBD
    ret  nz
    call label_C05
    ret  nz
    call label_DAA62
    call label_3B23
    call label_DAC0D
    ld   a, $20
    call label_DAC83
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    and  a
    ret  nz
    ld   [hl], $06
    call label_DABEE
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a
    ld   a, $30
    call label_DAC83
    call label_3B12
    ret
    call label_D9CBD
    ret  nz
    call label_C05
    ret  nz
    call label_DAA62
    call label_3B23
    call label_DAC0D
    ld   a, $20
    call label_DAC83
    ld   hl, $C2B0
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    and  a
    ret  nz
    ld   a, $30
    call label_DAC83
    ld   a, $03
    call label_DAC07
    ret
    call label_C05
    ret  nz
    call label_DAC0D
    ld   a, $08
    call label_DAC83
    ld   hl, $C2C0
    add  hl, bc
    dec  [hl]
    ld   a, [hl]
    and  a
    ret  nz
    ld   [hl], $01
    xor  a
    call label_DABEE
    ld   [hl], a
    call label_DABF3
    ld   [hl], a
    call label_DABF8
    ld   [hl], $18
    call label_3B12
    call label_DAC23
    ld   a, [hl]
    call label_DABEE
    cp   $50
    jr   z, label_D9E53
    jr   nc, label_D9E56
    ld   [hl], $10
    ret

label_D9E53::
    call label_DABF3

label_D9E56::
    ld   [hl], $F0
    ret
    call label_DAA62
    call label_3B23
    call label_DABEE
    ld   a, [hl]
    and  a
    jr   z, label_D9E81
    call label_DAC23
    and  $80
    jr   nz, label_D9E74
    ld   a, [hl]
    cp   $50
    jr   c, label_D9E81
    jr   label_D9E79

label_D9E74::
    ld   a, [hl]
    cp   $50
    jr   nc, label_D9E81

label_D9E79::
    ld   a, $50
    ld   [hl], a
    call label_DABEE
    xor  a
    ld   [hl], a

label_D9E81::
    call label_DABF8
    dec  [hl]
    call label_DAAEC
    ld   a, [hl]
    bit  7, a
    jr   z, label_D9EC1
    xor  a
    ld   [hl], a
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    ld   a, $30
    ld   [$C157], a
    ld   a, $04
    ld   [$C158], a
    call label_D9EC2
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_D9EAC
    call label_D9EC2

label_D9EAC::
    call label_DAC02
    ld   a, [hl]
    and  $01
    jr   nz, label_D9EB6
    ld   a, $80

label_D9EB6::
    and  $80
    ld   [hl], a
    ld   a, $20
    call label_DAC83
    call label_3B12

label_D9EC1::
    ret

label_D9EC2::
    xor  a
    ld   e, a
    ld   d, a
    ld   [$FFD7], a

label_D9EC7::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $F5
    jr   nz, label_D9EDC
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_D9EDC
    ld   hl, $FFD7
    inc  [hl]

label_D9EDC::
    inc  de
    ld   a, e
    and  $0F
    jr   nz, label_D9EC7
    ld   a, [$FFD7]
    cp   $06
    ret  nc
    ld   a, $F5
    call label_3B86
    ret  c
    call label_280D
    rla
    rla
    rla
    rla
    and  $70
    add  a, $18
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   [hl], $10
    ld   hl, $C340
    add  hl, de
    ld   [hl], $12
    ld   hl, $C350
    add  hl, de
    set  7, [hl]
    ld   hl, $C290
    add  hl, de
    inc  [hl]
    ret
    ld   a, [$C146]
    and  a
    jr   nz, label_D9F26
    ld   a, $01
    ld   [$FFA1], a
    ld   a, $6A
    ld   [$FF9D], a
    ld   [$C167], a

label_D9F26::
    call label_C05
    ret  nz
    xor  a
    ld   [$C167], a
    ld   a, $04
    call label_DAC83
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    and  $0F
    cp   $03
    jr   nz, label_D9F43
    push af
    call label_D9EC2
    pop  af

label_D9F43::
    cp   $06
    jr   c, label_D9F58
    ld   a, [hl]
    swap a
    srl  a
    srl  a
    srl  a
    and  $01
    ld   [hl], a
    ld   a, $03
    call label_DAC07

label_D9F58::
    ret

label_D9F59::
    cp   b
    ld   l, b
    ret  c
    ld   l, b

label_D9F5D::
    jr   label_D9FC8
    cp   b
    ld   l, b
    ret  c
    ld   l, b
    ld    hl, sp+$68
    ret  c
    ld   l, b
    cp   b
    ld   l, b

label_D9F69::
    ld    hl, sp+$68
    ret  c
    ld   l, b
    cp   b
    ld   l, b
    jr   label_D9FDA
    cp   b
    ld   l, b
    ret  c
    ld   l, b

label_D9F75::
    ld   d, $00
    call label_DAC02
    ld   e, [hl]
    ld   a, [$FFF0]
    cp   $0A
    jr   c, label_D9F8D
    ld   hl, label_D9F5D
    sla  e
    jr   nc, label_D9F92
    ld   hl, label_D9F69
    jr   label_D9F92

label_D9F8D::
    sla  e
    ld   hl, label_D9F59

label_D9F92::
    call label_DAC7E
    ld   c, $08
    ld   a, $36
    call label_A5F
    ld   a, $08
    call label_3DA0
    ret
    call label_DA219
    call label_DAA40
    call label_3B70
    call label_DAA62
    call label_3CD9
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_D9FBF
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $00

label_D9FBF::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    push af
    push hl
    ld   [hl], $01

label_D9FC8::
    call label_3B23
    pop  hl
    pop  af
    ld   [hl], a
    ld   a, [$FFF0]
    rst  0
    cp   e
    ld   h, b
    ld   b, h
    ld   h, c
    add  a, l
    ld   h, c
    ld   c, a
    ld   h, b
    db   $DB

label_D9FDA::
    ld   e, a
    call label_DABF8
    dec  [hl]
    ld   a, [hl]
    ld   [$FFD7], a
    call label_DAAEC
    ld   a, [hl]
    bit  7, a
    jr   z, label_DA04E
    ld   a, [$FFD7]
    bit  7, a
    jr   z, label_DA04E
    ld   e, $04
    call label_280D
    and  $01
    jr   z, label_D9FFB
    ld   e, $FC

label_D9FFB::
    call label_DABEE
    ld   [hl], e
    call label_DABFD
    ld   [hl], $00
    bit  7, e
    jr   nz, label_DA009
    inc  [hl]

label_DA009::
    ld   e, $03
    call label_280D
    and  $01
    jr   z, label_DA014
    ld   e, $FD

label_DA014::
    call label_DABF3
    ld   [hl], e
    call label_DABF8
    ld   [hl], $14
    ld   a, $0D
    ld   [$FFF2], a
    ld   d, $00
    call label_DABFD
    ld   e, [hl]
    call label_DAC23
    ld   a, [hl]
    ld   [$FFD7], a
    call label_DAC28
    ld   a, [hl]
    ld   [$FFD8], a
    ld   a, $36
    call label_9DE
    ld   hl, $D711
    add  hl, de
    ld   a, [hl]
    cp   $53
    jr   z, label_DA049
    cp   $55
    jr   z, label_DA049
    cp   $54
    jr   nz, label_DA04E

label_DA049::
    ld   a, $36
    call label_9E9

label_DA04E::
    ret
    xor  a
    call label_DABEE
    ld   [hl], a
    call label_DABF3
    ld   [hl], a
    call label_DAC02
    ld   [hl], a
    ld   hl, $C410
    add  hl, bc
    ld   [hl], a
    call label_3B12
    ret

label_DA065::
    ld   hl, $C420
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_DA07A
    ld   a, $03
    call label_DAC07
    ld   hl, $C4D0
    add  hl, bc
    ld   [hl], $00
    jr   label_DA083

label_DA07A::
    ld   a, [$FFE7]
    and  $07
    jr   nz, label_DA083
    call label_DAC0D

label_DA083::
    ret

label_DA084::
    call label_DAB8A
    cp   $10
    jr   nc, label_DA0B2
    ld   [$FFD7], a
    ld   a, e
    ld   [$FFD8], a
    call label_DAB9A
    cp   $10
    jr   nc, label_DA0B2
    call label_DABF3
    ld   [hl], $10
    bit  1, e
    jr   z, label_DA0A2
    ld   [hl], $F0

label_DA0A2::
    call label_DABEE
    ld   [hl], $10
    bit  0, e
    jr   z, label_DA0AD
    ld   [hl], $F0

label_DA0AD::
    ld   a, $02
    call label_DAC07

label_DA0B2::
    ret

label_DA0B3::
    ld   [$F80C], sp
    db   $F4 ; Undefined instruction
    ld   [bc], a
    nop
    cp   $00
    call label_DA065
    call label_280D
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, label_DA0B3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    call label_DAC23
    ld   a, [hl]
    sub  a, $40
    ld   hl, $C2B0
    add  hl, bc
    bit  7, a
    jr   z, label_DA0EC
    cp   $D0
    jr   nc, label_DA0F8
    ld   a, [hl]
    bit  7, a
    jr   z, label_DA0F8
    cpl
    inc  a
    ld   [hl], a
    jr   label_DA0F8

label_DA0EC::
    cp   $30
    jr   c, label_DA0F8
    ld   a, [hl]
    bit  7, a
    jr   nz, label_DA0F8
    cpl
    inc  a
    ld   [hl], a

label_DA0F8::
    ld   a, [hl]
    call label_DABFD
    ld   [hl], $00
    bit  7, a
    jr   nz, label_DA103
    inc  [hl]

label_DA103::
    call label_280D
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, label_DA0B3
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2C0
    add  hl, bc
    ld   [hl], a
    call label_DAC28
    ld   a, [hl]
    sub  a, $40
    ld   hl, $C2C0
    add  hl, bc
    bit  7, a
    jr   z, label_DA131
    cp   $E0
    jr   nc, label_DA13D
    ld   a, [hl]
    bit  7, a
    jr   z, label_DA13D
    cpl
    inc  a
    ld   [hl], a
    jr   label_DA13D

label_DA131::
    cp   $20
    jr   c, label_DA13D
    ld   a, [hl]
    bit  7, a
    jr   nz, label_DA13D
    cpl
    inc  a
    ld   [hl], a

label_DA13D::
    call label_3B12
    call label_DA084
    ret
    call label_DA065
    ld   a, [$FFE7]
    and  $01
    jr   z, label_DA181
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [hl]
    ld   e, a
    call label_DABEE
    cp   [hl]
    jr   z, label_DA160
    dec  [hl]
    bit  7, a
    jr   nz, label_DA160
    inc  [hl]
    inc  [hl]

label_DA160::
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    ld   d, a
    call label_DABF3
    cp   [hl]
    jr   z, label_DA173
    dec  [hl]
    bit  7, a
    jr   nz, label_DA173
    inc  [hl]
    inc  [hl]

label_DA173::
    ld   a, [hl]
    cp   d
    jr   nz, label_DA181
    call label_DABEE
    ld   a, [hl]
    cp   e
    jr   nz, label_DA181
    call label_3B12

label_DA181::
    call label_DA084
    ret
    call label_DA065
    ld   a, [$FFE7]
    and  $01
    jr   z, label_DA205
    call label_DABEE
    ld   a, [hl]
    and  a
    jr   z, label_DA19C
    inc  [hl]
    bit  7, a
    jr   nz, label_DA19C
    dec  [hl]
    dec  [hl]

label_DA19C::
    call label_DABF3
    ld   a, [hl]
    and  a
    jr   z, label_DA1AA
    inc  [hl]
    bit  7, a
    jr   nz, label_DA1AA
    dec  [hl]
    dec  [hl]

label_DA1AA::
    ld   a, [hl]
    and  a
    jr   nz, label_DA205
    call label_DABEE
    ld   a, [hl]
    and  a
    jr   nz, label_DA205
    ld   a, $10
    call label_DAC83
    xor  a
    call label_DAC07
    ld   a, [$C14E]
    and  a
    jr   nz, label_DA205
    call label_280D
    and  $03
    jr   nz, label_DA205
    ld   a, $02
    call label_3B86
    jr   c, label_DA205
    ld   hl, $C430
    add  hl, de
    res  0, [hl]
    call label_DAC23
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    call label_DAC28
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    call label_DAC2D
    ld   a, [hl]
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $C320
    add  hl, de
    ld   [hl], $08
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $48
    ld   hl, $C440
    add  hl, de
    ld   [hl], $01

label_DA205::
    call label_DA084
    ret

label_DA209::
    jr   c, label_DA273
    ld   c, b
    ld   l, b
    ld   e, b
    ld   l, b
    ld   l, b
    ld   l, b
    ld   a, b
    ld   l, b
    adc  a, b
    ld   l, b
    sbc  a, b
    ld   l, b
    xor  b
    ld   l, b

label_DA219::
    ld   d, $00
    call label_DAC02
    ld   a, [hl]
    sla  a
    ld   e, a
    ld   hl, label_DA209
    add  hl, de
    push hl
    call label_DABFD
    ld   a, [hl]
    sla  a
    sla  a
    ld   e, a
    pop  hl
    call label_DAC7E
    ld   c, $04
    ld   a, $36
    call label_A5F
    ld   a, $04
    call label_3DA0
    ret
    ld   hl, $C360
    add  hl, bc
    ld   [hl], $FF
    call label_DA3C2
    call label_DAB5C
    ld   a, [$C18F]
    and  a
    jr   z, label_DA25F
    xor  a
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    ld   hl, $C410
    add  hl, bc
    ld   [hl], a
    ret

label_DA25F::
    ld   a, [$FFF0]
    bit  7, a
    ret  nz
    ld   a, [$FFF0]
    rst  0
    ld   l, l
    ld   h, d
    ld   hl, label_D9163
    ld   h, e
    call label_DAA40
    call label_3B70

label_DA273::
    call label_3B23
    call label_DAC02
    ld   a, [hl]
    and  $03
    jr   nz, label_DA29E
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_DA29E
    ld   a, $04
    call label_DAC83
    call label_DAC02
    inc  [hl]
    xor  a
    ld   hl, $C420
    add  hl, bc
    ld   [hl], a
    call label_DA29F
    call label_3B12
    call label_3B12

label_DA29E::
    ret

label_DA29F::
    call label_DAC23
    ld   a, [hl]
    ld   [$FFD7], a
    call label_DAC28
    ld   a, [hl]
    ld   [$FFD8], a
    ld   de, $0000

label_DA2AE::
    ld   a, e
    sub  a, c
    jr   z, label_DA31A
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $EF
    jr   z, label_DA2C3
    cp   $F0
    jr   z, label_DA2C3
    cp   $F1
    jr   nz, label_DA31A

label_DA2C3::
    ld   hl, $C290
    add  hl, de
    inc  [hl]
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFD7]
    cp   [hl]
    jr   nz, label_DA2EA
    ld   a, [$FFF6]
    cp   $0A
    jr   nz, label_DA30A
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFD8]
    sub  a, [hl]
    bit  7, a
    jr   z, label_DA2E4
    cpl
    inc  a

label_DA2E4::
    cp   $20
    jr   nz, label_DA2EA
    jr   label_DA30A

label_DA2EA::
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFD8]
    cp   [hl]
    jr   nz, label_DA31A
    ld   a, [$FFF6]
    cp   $0A
    jr   nz, label_DA30A
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFD7]
    sub  a, [hl]
    bit  7, a
    jr   z, label_DA306
    cpl
    inc  a

label_DA306::
    cp   $20
    jr   nz, label_DA31A

label_DA30A::
    ld   hl, $C3B0
    add  hl, de
    inc  [hl]
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $04
    ld   hl, $C290
    add  hl, de
    inc  [hl]

label_DA31A::
    inc  de
    ld   a, e
    and  $0F
    jr   nz, label_DA2AE
    ret
    ld   de, $0000

label_DA324::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $EF
    jr   z, label_DA335
    cp   $F0
    jr   z, label_DA335
    cp   $F1
    jr   nz, label_DA34A

label_DA335::
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $00
    jr   nz, label_DA34A
    ld   hl, $C410
    add  hl, bc
    xor  a
    ld   [hl], a
    ld   a, $00
    call label_DAC07
    ret

label_DA34A::
    inc  de
    ld   a, e
    and  $0F
    jr   nz, label_DA324
    ret
    call label_C05
    jr   nz, label_DA381
    call label_DAC02
    ld   a, [$FFF6]
    cp   $08
    jr   z, label_DA364
    call label_DA382
    jr   label_DA366

label_DA364::
    ld   a, [hl]
    inc  a

label_DA366::
    ld   [hl], a
    cp   $0C
    jr   nz, label_DA36C
    xor  a

label_DA36C::
    ld   [hl], a
    and  $03
    jr   nz, label_DA37C
    ld   hl, $C410
    add  hl, bc
    xor  a
    ld   [hl], a
    ld   a, $00
    call label_DAC07

label_DA37C::
    ld   a, $04
    call label_DAC83

label_DA381::
    ret

label_DA382::
    ld   a, [hl]
    inc  a
    cp   $02
    ret  nz
    ld   a, $06
    ret
    ld   a, [hl]
    inc  a
    cp   $0A
    ret  nz
    ld   a, $02
    ret

label_DA392::
    ld   [hl], b
    ld   [bc], a
    ld   [hl], b
    ldi  [hl], a
    ld   [hl], d
    ld   [bc], a
    ld   [hl], h
    ld   [bc], a
    db   $76 ; Halt
    ld   bc, label_2176
    ld   [hl], h
    ld   hl, label_2172
    ld   [hl], b
    ld   bc, label_2170
    ld   [hl], d
    ld   bc, label_174
    db   $76 ; Halt
    inc  bc
    db   $76 ; Halt
    inc  hl
    ld   [hl], h
    inc  hl
    ld   [hl], d
    inc  hl
    ld   [hl], b
    inc  bc
    ld   [hl], b
    inc  hl
    ld   [hl], d
    inc  bc
    ld   [hl], h
    inc  bc
    db   $76 ; Halt
    ld   [bc], a
    db   $76 ; Halt
    ldi  [hl], a
    ld   [hl], h
    ldi  [hl], a
    ld   [hl], d
    ldi  [hl], a

label_DA3C2::
    ld   de, label_DA392
    call label_3BC0
    ret
    call label_DA629
    ld   a, [$FFEA]
    cp   $05
    call label_DAA40
    call label_DAC02
    ld   a, [hl]
    and  a
    jr   z, label_DA3DD
    call label_3B39

label_DA3DD::
    ld   a, [$C190]
    and  a
    ret  z
    ld   a, [$FFF0]
    rst  0
    db   $FD ; Undefined instruction
    ld   h, e
    ld   bc, label_2764
    ld   h, h
    cp   l
    ld   h, h
    rst  $20
    ld   h, h
    rst  $20
    ld   h, h
    rst  $20
    ld   h, h
    rst  $20
    ld   h, h
    rst  $20
    ld   h, h
    rst  $20
    ld   h, h
    rst  $20
    ld   h, h
    ld   [$CD65], sp
    ld   [de], a
    dec  sp
    ret
    call label_DABFD
    ld   [hl], $00
    call label_DAB8A
    cp   $28
    jp   nc, label_DA423
    ld   a, [$FF98]
    call label_DAC46
    call label_DAB9A
    cp   $28
    jp   nc, label_DA423
    ld   a, [$FF99]
    call label_DAC54
    call label_3B12

label_DA423::
    ret
    db   $10 ; Undefined instruction
    ld   c, $21
    inc  h
    ld   h, h
    ld   a, [$FFEB]
    sub  a, $EC
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    call label_DABEE
    ld   [hl], a
    call label_DABF3
    ld   [hl], a
    call label_DAC23
    ld   e, [hl]
    call label_DAC62
    sub  a, e
    ld   [$FFD7], a
    call label_DABEE
    and  a
    jr   nz, label_DA44C
    ld   [hl], a

label_DA44C::
    bit  7, a
    jr   z, label_DA454
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_DA454::
    call label_DAC28
    ld   e, [hl]
    call label_DAC70
    sub  a, e
    ld   [$FFD8], a
    call label_DABF3
    and  a
    jr   nz, label_DA465
    ld   [hl], a

label_DA465::
    bit  7, a
    jr   z, label_DA46D
    ld   a, [hl]
    cpl
    inc  a
    ld   [hl], a

label_DA46D::
    ld   a, [$FFD7]
    and  $FE
    ld   e, a
    ld   a, [$FFD8]
    and  $FE
    push af
    push de
    call label_DAA62
    call label_3B23
    pop  de
    pop  af
    or   e
    jr   nz, label_DA4A4
    ld   a, $08
    call label_DAC83
    ld   a, $01
    call label_3B0C
    call label_3B12
    call label_DAB8A
    call label_DABFD
    ld   a, e
    xor  $01
    ld   [hl], a
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $0F
    ld   [hl], a
    jr   label_DA4B9

label_DA4A4::
    ld   hl, $C2A0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_DA4B9
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $DF
    ld   [hl], a
    ld   a, $01
    call label_DAC07

label_DA4B9::
    ret

label_DA4BA::
    inc  b
    nop
    ld   [bc], a
    call label_C05
    jr   nz, label_DA4E6
    ld   a, $08
    call label_DAC83
    call label_DAC02
    inc  [hl]
    ld   a, [hl]
    cp   $03
    jr   nz, label_DA4E6
    ld   a, $10
    call label_DAC83
    ld   hl, label_DA4BA
    ld   a, [$FFEB]
    sub  a, $EC
    ld   e, a
    ld   d, $00
    add  hl, de
    ld   a, [hl]
    call label_3B12
    add  a, [hl]
    ld   [hl], a

label_DA4E6::
    ret
    call label_C05
    ret  nz
    call label_3B12
    call label_DABFD
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    ld   a, $08
    call label_DAC83
    ld   a, [$FFF0]
    cp   $0A
    jr   c, label_DA504
    call label_DAC02
    dec  [hl]

label_DA504::
    ret
    ld   d, c
    ld   d, b
    ld   d, d
    call label_C05
    jp   nz, label_DA528
    ld   a, $08
    call label_DAC83
    call label_DAC02
    dec  [hl]
    ld   a, [hl]
    and  a
    jr   nz, label_DA528
    ld   a, $01
    call label_DAC07
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    or   $D0
    ld   [hl], a

label_DA528::
    ret
    nop
    nop
    ld   h, b
    ld   [bc], a
    nop
    ld   [label_2260], sp
    nop
    nop
    ld   h, b
    nop
    nop
    ld   [label_2060], sp
    nop
    nop
    ld   h, b
    inc  bc
    nop
    ld   [label_2360], sp
    nop
    nop
    ld   h, d
    ld   [bc], a
    nop
    ld   [label_2262], sp
    nop
    nop
    ld   h, d
    nop
    nop
    ld   [label_2062], sp
    nop
    nop
    ld   h, d
    inc  bc
    nop
    ld   [label_2362], sp
    nop
    nop
    ld   l, h
    ld   [bc], a
    nop
    ld   [label_26E], sp
    nop
    ld   [label_226C], sp
    nop
    nop
    ld   l, [hl]
    ldi  [hl], a
    nop
    nop
    ld   l, h
    nop
    nop
    ld   [$006E], sp
    nop
    ld   [label_206C], sp
    nop
    nop
    ld   l, [hl]
    jr   nz, label_DA57A

label_DA57A::
    nop
    ld   l, h
    inc  bc
    nop
    ld   [label_36E], sp
    nop
    ld   [label_236C], sp
    nop
    nop
    ld   l, [hl]
    inc  hl
    ld   a, [$FF00]
    ld   h, h
    ld   [bc], a
    ld   a, [$FF08]
    ld   h, [hl]
    ld   [bc], a
    nop
    nop
    ld   l, b
    ld   [bc], a
    nop
    ld   [label_26A], sp
    ld   a, [$FF00]
    ld   h, [hl]
    ldi  [hl], a
    ld   a, [$FF08]
    ld   h, h
    ldi  [hl], a
    nop
    nop
    ld   l, d
    ldi  [hl], a
    nop
    ld   [label_2268], sp
    ld   a, [$FF00]
    ld   h, h
    nop
    ld   a, [$FF08]
    ld   h, [hl]
    nop
    nop
    nop
    ld   l, b
    nop
    nop
    ld   [$006A], sp
    ld   a, [$FF00]
    ld   h, [hl]
    jr   nz, label_DA5AE
    ld   [label_2064], sp
    nop
    nop
    ld   l, d
    jr   nz, label_DA5C6

label_DA5C6::
    ld   [label_2068], sp
    ld   a, [$FF00]
    ld   h, h
    inc  bc
    ld   a, [$FF08]
    ld   h, [hl]
    inc  bc
    nop
    nop
    ld   l, b
    inc  bc
    nop
    ld   [label_36A], sp
    ld   a, [$FF00]
    ld   h, [hl]
    inc  hl
    ld   a, [$FF08]
    ld   h, h
    inc  hl
    nop
    nop
    ld   l, d
    inc  hl
    nop
    ld   [label_2368], sp
    add  hl, hl
    ld   h, l
    ld   b, c
    ld   h, l
    ld   e, c
    ld   h, l
    adc  a, c
    ld   h, l
    ld   sp, label_D8965
    ld   h, l
    ld   l, c
    ld   h, l
    xor  c
    ld   h, l
    add  hl, sp
    ld   h, l
    ld   d, c
    ld   h, l
    ld   a, c
    ld   h, l
    ret
    ld   h, l
    add  hl, hl
    ld   h, l
    ld   b, c
    ld   h, l
    ld   h, c
    ld   h, l
    sbc  a, c
    ld   h, l
    ld   sp, label_D8965
    ld   h, l
    ld   [hl], c
    ld   h, l
    cp   c
    ld   h, l
    add  hl, sp
    ld   h, l
    ld   d, c
    ld   h, l
    add  a, c
    ld   h, l
    reti
    ld   h, l
    jp   [hl]
    ld   h, l
    pop  af
    ld   h, l
    ld   sp, hl
    ld   h, l
    ld   bc, label_966
    ld   h, [hl]
    ld   de, label_1F66
    ld   h, [hl]
    add  hl, de
    ld   h, [hl]

label_DA629::
    push bc
    ld   d, $00
    call label_DABFD
    ld   a, [hl]
    sla  a
    ld   e, a
    ld   hl, label_DA625
    call label_DAC7E
    ld   a, [$FFEB]
    sub  a, $EC
    sla  a
    ld   e, a
    call label_DAC7E
    push hl
    call label_DAC02
    ld   a, [hl]
    sla  a
    ld   e, a
    pop  hl
    call label_DAC7E
    push hl
    call label_DAC02
    ld   c, $02
    ld   a, [hl]
    cp   $03
    jr   c, label_DA65C
    ld   c, $04

label_DA65C::
    pop  hl
    push bc
    call label_3CE6
    pop  bc
    ld   a, c
    call label_3DA0
    pop  bc
    ret
    call label_DA9D9
    call label_DAA40
    ld   a, [$FFF0]
    cp   $0C
    jr   z, label_DA677
    call label_3B39

label_DA677::
    ld   a, [$FFF0]
    rst  0
    sub  a, [hl]
    ld   h, [hl]
    dec  a
    ld   h, a
    and  e
    ld   h, a
    or   l
    ld   h, a
    dec  de
    ld   l, b
    dec  h
    ld   l, b
    ld   d, a
    ld   l, b
    ld   a, b
    ld   l, b
    sub  a, c
    ld   l, b
    db   $EC ; Undefined instruction
    ld   l, b
    rra
    ld   l, c
    ccf
    ld   l, c
    ld   e, h
    ld   l, c
    sbc  a, l
    ld   l, c
    call label_C05
    jr   nz, label_DA6B0
    call label_280D
    and  $06
    srl  a
    call label_DABFD
    ld   [hl], a
    ld   a, $40
    call label_DAC83
    ld   a, $01
    call label_DAC07

label_DA6B0::
    call label_DAB8A
    cp   $30
    jp   nc, label_DA6C5
    call label_DAB9A
    cp   $30
    jp   nc, label_DA6C5
    ld   a, $01
    call label_DAC07

label_DA6C5::
    ret

label_DA6C6::
    call label_DAC23
    ld   a, [hl]
    cp   $16
    jr   nc, label_DA6D2
    ld   a, $16
    jr   label_DA6D8

label_DA6D2::
    cp   $89
    jr   c, label_DA6D9
    ld   a, $89

label_DA6D8::
    ld   [hl], a

label_DA6D9::
    call label_DAC28
    ld   a, [hl]
    cp   $1E
    jr   nc, label_DA6E5
    ld   a, $1E
    jr   label_DA6EB

label_DA6E5::
    cp   $72
    jr   c, label_DA6EC
    ld   a, $72

label_DA6EB::
    ld   [hl], a

label_DA6EC::
    ret
    call label_280D
    and  $0F
    ret  nz
    xor  a
    ld   [$FFD7], a
    ld   e, $00
    ld   d, e

label_DA6F9::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $7D
    jr   nz, label_DA70D
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    ret  nz
    ld   hl, $FFD7
    inc  [hl]

label_DA70D::
    inc  de
    ld   a, e
    and  $0F
    jr   nz, label_DA6F9
    ld   a, $7D
    call label_3B86
    ret  c
    call label_DAC23
    ld   a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    call label_DAC28
    ld   a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    push bc
    ld   c, e
    ld   b, d
    ld   a, $10
    call label_3BAA
    pop  bc
    ret

label_DA735::
    inc  bc
    db   $FD ; Undefined instruction
    nop
    nop

label_DA739::
    nop
    nop
    db   $FD ; Undefined instruction
    inc  bc
    call label_DABFD
    ld   a, [hl]
    ld   e, a
    ld   d, $00
    ld   hl, label_DA735
    add  hl, de
    ld   a, [hl]
    call label_DABEE
    ld   [hl], a
    ld   hl, label_DA739
    add  hl, de
    ld   a, [hl]
    call label_DABF3
    ld   [hl], a
    call label_DAA62
    call label_3B23
    call label_DA6C6
    call label_C05
    jr   nz, label_DA79F
    ld   a, $10
    call label_DAC83
    ld   a, $00
    jr   label_DA77F
    call label_DAB8A
    cp   $30
    jp   nc, label_DA79F
    call label_DAB9A
    cp   $30
    jp   nc, label_DA79F
    ld   a, $01

label_DA77F::
    call label_DAC07
    call label_DAB8A
    cp   $20
    jr   nc, label_DA79F
    call label_DAB9A
    cp   $20
    jr   nc, label_DA79F
    ld   a, $0E
    call label_3BAA
    ld   a, $20
    call label_DAC83
    ld   a, $02
    call label_DAC07

label_DA79F::
    call label_DAC15
    ret
    call label_C05
    jr   nz, label_DA7D1
    ld   [hl], $18
    ld   a, $03
    call label_DAC07
    jr   label_DA7D1

label_DA7B1::
    ld   [bc], a
    inc  bc
    ld   bc, $CD00
    dec  b
    inc  c
    jr   nz, label_DA7C8
    ld   a, $01
    call label_DAC07
    xor  a
    call label_DABEE
    ld   [hl], a
    call label_DABF3
    ld   [hl], a

label_DA7C8::
    call label_DAA62
    call label_3B23
    call label_DA6C6

label_DA7D1::
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_DA7F1
    call label_DAC02
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a
    and  a
    jr   nz, label_DA7F1
    call label_DABFD
    ld   a, [hl]
    push hl
    ld   e, a
    ld   d, $00
    ld   hl, label_DA7B1
    add  hl, de
    ld   a, [hl]
    pop  hl
    ld   [hl], a

label_DA7F1::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_DA806
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    or   $80
    ld   [hl], a
    ld   a, $04
    call label_DAC07

label_DA806::
    ret
    ld   a, [hl]
    bit  7, a
    jr   z, label_DA813
    add  a, d
    bit  7, a
    jr   nz, label_DA819
    jr   label_DA818

label_DA813::
    sub  a, d
    bit  7, a
    jr   z, label_DA819

label_DA818::
    xor  a

label_DA819::
    ld   [hl], a
    ret
    ld   hl, $C410
    add  hl, bc
    ld   [hl], $00
    call label_3B12
    ret
    call label_3B23
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_DA83F
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    or   $80
    ld   [hl], a
    ld   a, $04
    call label_DAC07
    jr   label_DA856

label_DA83F::
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    or   $80
    ld   [hl], a
    ld   a, [$FFEA]
    cp   $06
    jr   nc, label_DA856
    ld   a, [hl]
    and  $7F
    ld   [hl], a
    ld   a, $01
    call label_DAC07

label_DA856::
    ret
    ld   e, $28
    call label_DAC23
    ld   a, [hl]
    cp   $50
    jr   c, label_DA863
    ld   e, $78

label_DA863::
    ld   [hl], e
    ld   e, $30
    call label_DAC28
    ld   a, [hl]
    cp   $48
    jr   c, label_DA870
    ld   e, $60

label_DA870::
    ld   [hl], e
    call label_DABF8
    ld   [hl], $10
    jr   label_DA88A
    call label_DABF8
    dec  [hl]
    call label_DAAEC
    ld   a, [hl]
    bit  7, a
    jr   z, label_DA88D
    xor  a
    ld   [hl], a
    call label_DABF8
    ld   [hl], a

label_DA88A::
    call label_3B12

label_DA88D::
    ret

label_DA88E::
    ld   e, [hl]
    ld   e, c
    ld   h, e
    ld   a, [$FFEB]
    sub  a, $E9
    ld   e, a
    ld   d, $00
    ld   hl, label_DA88E
    add  hl, de
    ld   a, [hl]
    push af
    call label_DABCF
    pop  af
    dec  hl
    cp   [hl]
    jr   nz, label_DA8C3
    ld   a, $0C
    call label_DAC07
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    or   $F0
    ld   [hl], a
    call label_DABCF
    ld   a, [$FFEB]
    sub  a, $E9
    add  a, $67
    ld   [hl], a
    ld   a, $04
    ld   [$FFF4], a
    jr   label_DA8EB

label_DA8C3::
    ld   a, $1D
    ld   [$FFF2], a
    ld   e, $10
    call label_DAC23
    ld   a, [hl]
    cp   $50
    jr   c, label_DA8D3
    ld   e, $F0

label_DA8D3::
    xor  a
    call label_DABF3
    ld   [hl], a
    call label_DABEE
    ld   [hl], e
    call label_DABF8
    ld   [hl], $10
    ld   a, $18
    call label_DAC83
    ld   a, $09
    call label_DAC07

label_DA8EB::
    ret
    call label_C05
    jr   nz, label_DA91E
    call label_DABEE
    ld   a, [hl]
    and  a
    jr   z, label_DA8FB
    call label_DAA62

label_DA8FB::
    call label_DABF8
    dec  [hl]
    call label_DAAEC
    call label_3B23
    call label_DAC2D
    ld   a, [hl]
    bit  7, a
    jr   z, label_DA91E
    xor  a
    ld   [hl], a
    call label_DABF8
    ld   [hl], $08
    call label_DABEE
    sra  [hl]
    ld   a, $0A
    call label_DAC07

label_DA91E::
    ret
    call label_DAA62
    call label_DABF8
    dec  [hl]
    call label_DAAEC
    push bc
    call label_3B23
    pop  bc
    call label_DAC2D
    ld   a, [hl]
    bit  7, a
    jr   z, label_DA93E
    ld   a, $20
    call label_DAC83
    call label_3B12

label_DA93E::
    ret
    call label_C05
    jr   nz, label_DA95B
    xor  a
    ld   [hl], a
    call label_DABF8
    ld   [hl], a
    call label_DABEE
    ld   [hl], a
    ld   a, $01
    call label_DAC07
    ld   hl, $C340
    add  hl, bc
    ld   a, [hl]
    and  $7F
    ld   [hl], a

label_DA95B::
    ret
    ld   e, $00
    ld   d, e

label_DA95F::
    ld   hl, $C3A0
    add  hl, de
    ld   a, [hl]
    cp   $E9
    jr   z, label_DA970
    cp   $EA
    jr   z, label_DA970
    cp   $EB
    jr   nz, label_DA981

label_DA970::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_DA981
    ld   hl, $C290
    add  hl, de
    ld   a, [hl]
    cp   $0C
    jr   c, label_DA999

label_DA981::
    inc  e
    ld   a, e
    cp   $10
    jr   nz, label_DA95F
    ld   a, $18
    call label_DAC83
    call label_3B12
    call label_DABCF
    ld   a, [$FFEB]
    sub  a, $E9
    add  a, $67
    ld   [hl], a

label_DA999::
    ret

label_DA99A::
    ld   e, a
    ld   e, d
    ld   h, h
    call label_C05
    jr   nz, label_DA9CC
    ld   a, [$FFEB]
    sub  a, $E9
    ld   e, a
    ld   d, $00
    ld   hl, label_DA99A
    add  hl, de
    ld   a, [hl]
    push af
    call label_DABCF
    pop  af
    ld   [hl], a
    call label_DAC23
    ld   a, [hl]
    ld   [$FFD7], a
    call label_DAC28
    ld   a, [hl]
    call label_DAC2D
    sub  a, [hl]
    ld   [$FFD8], a
    ld   a, $02
    call label_CC7
    call label_3F5E

label_DA9CC::
    ret

label_DA9CD::
    adc  a, b
    ld   h, [hl]
    db   $E8 ; add  sp, d
    ld   h, [hl]
    ld   c, b
    ld   h, a

label_DA9D3::
    xor  b
    ld   h, a
    ret  c
    ld   h, a
    ld   [$F068], sp
    db   $EB ; Undefined instruction
    sub  a, $E9
    sla  a
    ld   [$FFD7], a
    ld   d, $00
    call label_DAC02
    ld   a, [$FFF0]
    cp   $06
    jr   nc, label_DA9F2
    ld   a, [$FFEA]
    cp   $05
    jr   z, label_DAA0A

label_DA9F2::
    ld   a, [hl]
    ld   l, a
    sla  a
    add  a, l
    sla  a
    sla  a
    ld   e, a
    push de
    ld   a, [$FFD7]
    ld   e, a
    ld   hl, label_DA9D3
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    pop  de
    jr   label_DAA32

label_DAA0A::
    ld   a, [hl]
    ld   l, a
    sla  a
    add  a, l
    sla  a
    sla  a
    ld   e, a
    push de
    ld   a, [$FFD7]
    ld   e, a
    ld   hl, label_DA9CD
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    pop  de

label_DAA20::
    push hl
    call label_DABFD
    ld   a, [hl]
    ld   l, a
    sla  a

label_DAA28::
    add  a, l
    sla  a
    sla  a
    sla  a
    pop  hl
    add  hl, de
    ld   e, a

label_DAA32::
    add  hl, de
    ld   c, $03
    ld   a, $36
    call label_A5F
    ld   a, $03
    call label_3DA0
    ret

label_DAA40::
    ld   a, [$FFEA]
    cp   $05
    jr   nz, label_DAA60

label_DAA46::
    ld   a, [$DB95]
    cp   $07
    jr   z, label_DAA60
    ld   a, [$C19F]
    ld   hl, $C1A8
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_DAA60
    ld   a, [$C124]
    and  a
    jr   z, label_DAA61

label_DAA60::
    pop  af

label_DAA61::
    ret

label_DAA62::
    call label_DAA6F
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_DAA6F
    pop  bc
    ret

label_DAA6F::
    call label_DABEE
    ld   a, [hl]
    and  a
    ret  z
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    call label_DAC23
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_DAA8E
    ld   e, $F0

label_DAA8E::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

label_DAA98::
    ld   e, $00
    ld   a, [$FF99]
    ld   hl, $FFEF
    sub  a, [hl]
    add  a, $04
    cp   $08
    jr   nc, label_DAAEA
    ld   a, [$FF98]
    ld   hl, $FFEE
    sub  a, [hl]
    add  a, $10
    cp   $18
    jr   nc, label_DAAEA
    inc  e
    ld   a, [$FFEB]
    cp   $B5
    jr   z, label_DAAC5
    push de
    call label_DABAB
    ld   a, [$FF9E]
    xor  $01
    cp   e
    pop  de
    jr   nz, label_DAAEA

label_DAAC5::
    ld   hl, $C1AD
    ld   [hl], $01
    ld   a, [$C19F]
    ld   hl, $C14F
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ld   hl, $C134
    or   [hl]
    jr   nz, label_DAAEA
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_DAAEA
    ld   a, [$FFCC]
    and  $10
    jr   z, label_DAAEA
    scf
    ret

label_DAAEA::
    and  a
    ret

label_DAAEC::
    call label_DABF8
    ld   a, [hl]
    and  a
    ret  z
    push af
    swap a
    and  $F0
    ld   hl, $C330
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    call label_DAC2D
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_DAB0B
    ld   e, $F0

label_DAB0B::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

label_DAB15::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_DAB5B
    dec  a
    ld   [hl], a
    call label_3E8E
    call label_DABEE
    ld   a, [hl]
    push af
    call label_DABF3
    ld   a, [hl]
    push af
    ld   hl, $C3F0
    add  hl, bc
    ld   a, [hl]
    call label_DABEE
    ld   [hl], a
    ld   hl, $C400
    add  hl, bc
    ld   a, [hl]
    call label_DABF3
    ld   [hl], a
    call label_DAA62
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $20
    jr   nz, label_DAB4D
    call label_3B23

label_DAB4D::
    call label_DABF3
    pop  af
    ld   [hl], a
    call label_DABEE
    pop  af
    ld   [hl], a
    pop  af
    call label_3EAF

label_DAB5B::
    ret

label_DAB5C::
    call label_3B5A
    jr   nc, label_DAB88
    call label_CBE
    ld   a, [$C1A6]
    and  a
    jr   z, label_DAB7B
    ld   e, a
    ld   d, b
    ld   hl, $C39F
    add  hl, de
    ld   a, [hl]
    cp   $03
    jr   nz, label_DAB7B
    ld   hl, $C28F
    add  hl, de
    ld   [hl], $00

label_DAB7B::
    ld   a, [$C14A]
    ld   e, a
    call label_CB6
    call label_178E
    ld   a, e
    scf
    ret

label_DAB88::
    and  a
    ret

label_DAB8A::
    ld   e, $00
    ld   a, [$FF98]
    call label_DAC23
    sub  a, [hl]
    bit  7, a
    jr   z, label_DAB99
    inc  e
    cpl
    inc  a

label_DAB99::
    ret

label_DAB9A::
    ld   e, $04
    ld   a, [$FF99]
    call label_DAC28
    sub  a, [hl]
    bit  7, a
    jr   z, label_DABAA
    ld   e, $02
    cpl
    inc  a

label_DABAA::
    ret

label_DABAB::
    call label_DAB8A
    ld   d, a
    push af
    ld   a, e
    ld   [$FFD7], a
    call label_DAB9A
    ld   d, a
    ld   a, e
    xor  $06
    cp   $04
    jr   nz, label_DABC0
    ld   a, $03

label_DABC0::
    ld   [$FFD8], a
    ld   a, d
    pop  de
    cp   d
    jr   nc, label_DABCB
    ld   a, [$FFD7]
    jr   label_DABCD

label_DABCB::
    ld   a, [$FFD8]

label_DABCD::
    ld   e, a
    ret

label_DABCF::
    call label_DAC23
    ld   a, [hl]
    sub  a, $01
    and  $F0
    swap a
    ld   e, a
    call label_DAC28
    ld   a, [hl]
    sub  a, $07
    and  $F0
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    ld   a, h
    add  hl, de
    ld   h, a
    ld   a, [hl]
    ret

label_DABEE::
    ld   hl, $C240
    add  hl, bc
    ret

label_DABF3::
    ld   hl, $C250
    add  hl, bc
    ret

label_DABF8::
    ld   hl, $C320
    add  hl, bc
    ret

label_DABFD::
    ld   hl, $C380
    add  hl, bc
    ret

label_DAC02::
    ld   hl, $C3B0
    add  hl, bc
    ret

label_DAC07::
    ld   hl, $C290
    add  hl, bc
    ld   [hl], a
    ret

label_DAC0D::
    call label_DAC02
    ld   a, [hl]
    xor  $01
    ld   [hl], a
    ret

label_DAC15::
    ld   a, [$FFE7]
    and  $07
    ret  nz
    call label_DAC02
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a
    ret

label_DAC23::
    ld   hl, $C200
    add  hl, bc
    ret

label_DAC28::
    ld   hl, $C210
    add  hl, bc
    ret

label_DAC2D::
    ld   hl, $C310
    add  hl, bc
    ret

label_DAC32::
    ld   hl, $D030
    add  hl, bc
    ret

label_DAC37::
    ld   hl, $D040
    add  hl, bc
    ret
    ld   hl, $D050
    add  hl, bc
    ret
    ld   hl, $D060
    add  hl, bc
    ret

label_DAC46::
    ld   hl, rSVBK
    ld   [hl], $02
    push hl
    call label_DAC32
    ld   [hl], a
    pop  hl
    ld   [hl], $00
    ret

label_DAC54::
    ld   hl, rSVBK
    ld   [hl], $02
    push hl
    call label_DAC37
    ld   [hl], a
    pop  hl
    ld   [hl], $00
    ret

label_DAC62::
    ld   hl, rSVBK
    ld   [hl], $02
    push hl
    call label_DAC32
    ld   a, [hl]
    pop  hl
    ld   [hl], $00
    ret

label_DAC70::
    ld   hl, rSVBK
    ld   [hl], $02
    push hl
    call label_DAC37
    ld   a, [hl]
    pop  hl
    ld   [hl], $00
    ret

label_DAC7E::
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ret

label_DAC83::
    ld   hl, $C2E0
    add  hl, bc
    ld   [hl], a
    ret

label_DAC89::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], $00
    ret

label_DAC90::
    ld   a, [de]
    ld   l, a
    inc  de
    ld   a, [de]
    ld   d, a
    ld   e, l
    call label_DAC23
    ld   a, [hl]
    cp   $1C
    jr   nc, label_DACA2
    ld   a, $1C
    jr   label_DACAA

label_DACA2::
    add  a, e
    cp   $A0
    jr   c, label_DACAB
    ld   a, $A0
    sub  a, e

label_DACAA::
    ld   [hl], a

label_DACAB::
    call label_DAC28
    ld   a, [hl]
    cp   $20
    jr   nc, label_DACB7
    ld   a, $20
    jr   label_DACBF

label_DACB7::
    add  a, e
    cp   $80
    jr   c, label_DACC0
    ld   a, $80
    sub  a, e

label_DACBF::
    ld   [hl], a

label_DACC0::
    ret
    rst  $38
    ld   b, a
    add  hl, sp
    ld   c, $C7
    nop
    nop
    nop
    adc  a, h
    ld   sp, label_26C4
    inc  h
    dec  d
    nop
    nop
    rst  $38
    ld   b, a
    add  a, a
    ld   a, l
    add  a, e
    inc  a
    nop
    nop
    dec  c
    db   $76 ; Halt
    ld   b, l
    ld   a, l
    and  h
    inc  a
    nop
    nop
    di
    ld   d, c
    nop
    nop
    ld   l, l
    dec  c
    rla
    rla
    di
    ld   d, c
    nop
    nop
    nop
    ld   a, h
    xor  [hl]
    ld   a, [hl]
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_DACF8

label_DACF8::
    nop
    rst  $38
    ld   b, a
    di
    ld   d, c
    ld   h, a
    jr   z, label_DAD00

label_DAD00::
    nop

label_DAD01::
    di
    ld   d, c
    nop
    nop
    or   h
    ld   bc, label_DBFFF
    di
    ld   d, c
    nop
    nop
    and  l
    ld   a, h
    rst  $38
    ld   a, a

label_DAD11::
    nop
    inc  b
    nop
    nop
    nop
    nop
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0001
    ld   bc, $0001
    ld   bc, $0000
    ld   [bc], a
    nop
    nop

label_DAD27::
    add  a, b
    nop
    rlca
    ld   b, $00
    nop
    rlca
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    nop
    nop
    nop
    rlca
    nop
    nop

label_DAD3B::
    nop
    nop
    pop  bc
    ld   l, h
    ret
    ld   l, h
    pop  de
    ld   l, h
    reti
    ld   l, h
    pop  hl
    ld   l, h
    jp   [hl]
    ld   l, h
    pop  af
    ld   l, h
    ld   sp, hl
    ld   l, h
    ld   a, [$FFF7]
    cp   $FF
    ret  nz
    ld   d, $00
    ld   a, [$FFF6]
    ld   e, a
    ld   hl, label_DAD11
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_DAD78
    sla  a
    ld   e, a
    ld   hl, label_DAD3B
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $DC48
    ld   bc, $0008
    call label_2914
    ld   a, $01
    ld   [$DDD1], a
    ret

label_DAD78::
    ld   hl, label_DAD27
    add  hl, de
    ld   a, [hl]
    and  a
    ret  z
    bit  7, a
    jr   z, label_DAD8E
    ld   hl, label_DAD01
    ld   de, $DC80
    ld   bc, $0010
    jr   label_DAD9E

label_DAD8E::
    sla  a
    ld   e, a
    ld   hl, label_DAD3B
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $DC88
    ld   bc, $0008

label_DAD9E::
    call label_2914
    ld   a, $02
    ld   [$DDD1], a
    ret

label_DADA7::
    rst  $38
    nop
    rst  $38
    jr   nz, label_DADE6
    nop
    db   $3A ; ldd  a, [hl]
    jr   nz, label_DADEC
    nop
    inc  a
    jr   nz, label_DADF0
    nop
    inc  a
    jr   nz, label_DAE10
    ld   a, b
    ld   a, b
    jr   z, label_DADE4
    jr   z, label_DAE36
    ld   e, b
    jr   z, label_DAE39
    jr   z, label_DAE3B
    jr   z, label_DAE3D
    ld   e, b
    ld   e, b
    jr   z, label_DAE41
    jr   z, label_DAE43

label_DADCB::
    ld   b, b
    jr   nc, label_DAE1E
    ld   d, b
    jr   nc, label_DAE01
    ld   d, b
    ld   b, b
    ld   d, b
    jr   nc, label_DAE26
    ld   d, b
    jr   nc, label_DAE09
    ld   b, b
    ld   b, b
    ld   d, b
    jr   nc, label_DAE0E
    ld   d, b

label_DADDF::
    ld   a, [$FF00+C]
    db   $3A ; ldd  a, [hl]
    nop
    ld   a, [$FF00+C]
    db   $3A ; ldd  a, [hl]

label_DADE6::
    jr   nz, label_DADF6
    nop
    db   $3A ; ldd  a, [hl]
    nop
    ld   c, $08
    db   $3A ; ldd  a, [hl]
    jr   nz, label_DADE6

label_DADF0::
    ld   a, [bc]
    db   $3A ; ldd  a, [hl]
    nop
    or   $12
    db   $3A ; ldd  a, [hl]

label_DADF6::
    jr   nz, label_DAE02
    or   $3A
    nop
    ld   a, [bc]
    cp   $3A
    jr   nz, label_DAE00

label_DAE00::
    ld   c, $3A

label_DAE02::
    nop
    nop
    ld   d, $3A
    jr   nz, label_DAE08

label_DAE08::
    ld   a, [$FF00+C]
    nop
    nop
    ld   a, [label_203A]
    ld   a, [bc]

label_DAE10::
    ld   a, [bc]
    db   $3A ; ldd  a, [hl]
    nop
    ld   a, [bc]
    ld   [de], a
    db   $3A ; ldd  a, [hl]
    jr   nz, label_DAE0E
    or   $3A
    nop
    or   $FE
    db   $3A ; ldd  a, [hl]

label_DAE1E::
    jr   nz, label_DAE10
    ld   a, [$FFA7]
    jr   z, label_DAE3F
    call label_C05
    jp   z, label_DAC89
    rla
    rla
    and  $30
    ld   e, a
    ld   d, b
    ld   hl, label_DADDF
    add  hl, de
    ld   c, $04

label_DAE36::
    call label_3CE6

label_DAE39::
    ld   a, $02

label_DAE3B::
    call label_3DA0
    ret

label_DAE3F::
    call label_DAA40
    ld   a, [$FFEB]
    cp   $8A
    jr   nz, label_DAE57
    ld   a, [$FFE7]
    rra
    rra
    and  $03
    call label_3B0C
    ld   de, label_DADA7
    call label_3BC0

label_DAE57::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [$FFB9]
    ld   e, a
    sla  a
    sla  a
    add  a, e
    add  a, [hl]
    ld   e, a
    ld   d, b
    ld   hl, label_DADB7
    add  hl, de
    ld   a, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   [hl], a
    ld   hl, label_DADCB
    add  hl, de
    ld   a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    call label_3D8A
    ld   hl, $C2B0
    add  hl, bc
    ld   a, [$FFB8]
    cp   [hl]
    jr   z, label_DAECD
    cp   $8D
    jr   nz, label_DAECD
    call label_3B5A
    jr   nc, label_DAEC8
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    cp   $04
    jr   nz, label_DAEA0
    call label_DAC89
    call label_C60
    jr   label_DAECD

label_DAEA0::
    inc  [hl]
    ld   a, $13
    ld   [$FFF2], a
    ld   a, $8A
    call label_3B86
    jr   c, label_DAEC6
    ld   a, [$FFD7]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    push bc
    ld   c, e
    ld   b, d
    call label_3B12
    call label_C05
    ld   [hl], $18
    pop  bc

label_DAEC6::
    jr   label_DAECD

label_DAEC8::
    ld   hl, $C3D0
    add  hl, bc
    ld   [hl], b

label_DAECD::
    ld   a, [$FFB8]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a
    ret
    ld   hl, $C3F0
    add  hl, bc
    ld   [hl], b
    ld   hl, $C400
    add  hl, bc
    ld   [hl], b
    call label_DB022
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C16B]
    cp   $04
    ret  nz
    call label_DAA40
    ld   hl, $C2C0
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_DAF01
    inc  [hl]
    ld   a, [$FFEF]
    ld   hl, $C2B0
    add  hl, bc
    ld   [hl], a

label_DAF01::
    call label_DAB15
    ld   a, [$FFF0]
    rst  0
    rrca
    ld   l, a
    ld   a, $6F
    ld   l, e
    ld   l, a
    sub  a, h
    ld   l, a
    call label_C05
    jr   nz, label_DAF2D
    ld   [hl], $40
    ld   e, $00
    ld   a, [$FF98]
    call label_DAC23
    sub  a, [hl]
    bit  7, a
    jr   z, label_DAF23
    inc  e

label_DAF23::
    ld   d, a
    add  a, $10
    cp   $20
    jr   c, label_DAF2D
    call label_3B12

label_DAF2D::
    ret

label_DAF2E::
    inc  b
    inc  b
    inc  bc
    ld   [bc], a
    ld   bc, $0000
    nop

label_DAF36::
    ld   [$FFE0], a
    db   $E8 ; add  sp, d
    ld   a, [$FF00]
    nop
    nop
    nop
    call label_3B39
    call label_C05
    jr   nz, label_DAF4C
    ld   [hl], $80
    call label_3B12
    ret

label_DAF4C::
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_DAF2E
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, label_DAF36
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    add  a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ret
    call label_3B39
    call label_C05
    jr   nz, label_DAF78
    ld   [hl], $40
    call label_3B12

label_DAF78::
    ld   e, $04
    and  $10
    jr   nz, label_DAF7F
    inc  e

label_DAF7F::
    ld   a, e
    call label_3B0C
    ret

label_DAF84::
    nop
    nop
    nop
    nop
    ld   bc, label_302
    dec  b

label_DAF8C::
    nop
    nop
    nop
    nop
    nop
    ld   a, [$FFE8]
    ld   [$FFCD], a
    add  hl, sp
    dec  sp
    call label_C05
    jr   nz, label_DAFA3
    ld   [hl], $40
    call label_3B12
    ld   [hl], b
    ret

label_DAFA3::
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, b
    ld   hl, label_DAF84
    add  hl, de
    ld   a, [hl]
    call label_3B0C
    ld   hl, label_DAF8C
    add  hl, de
    ld   a, [hl]
    ld   hl, $C2B0
    add  hl, bc
    add  a, [hl]
    ld   hl, $C210
    add  hl, bc
    ld   [hl], a
    ret

label_DAFC2::
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
    ld   a, [$FF00]
    ld   [hl], h
    ld   [bc], a
    ld   a, [$FF08]
    ld   [hl], h
    ldi  [hl], a
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
    ld   [hl], b
    ld   [bc], a
    nop
    ld   [label_2270], sp
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
    ld   [hl], b
    ld   [bc], a
    nop
    ld   [label_2270], sp
    ld   [label_DB600], sp
    nop
    ld   [label_DB608], sp
    jr   nz, label_DB003

label_DB003::
    nop
    ld   [hl], b
    ld   [bc], a
    nop
    ld   [label_2270], sp
    stop
    ld   [hl], d
    nop
    db   $10 ; Undefined instruction
    ld   [hl], d
    jr   nz, label_DB013

label_DB013::
    nop
    ld   a, b
    ld   [bc], a
    nop
    ld   [label_2278], sp
    stop
    ld   [hl], d
    nop
    db   $10 ; Undefined instruction

label_DB020::
    ld   [hl], d
    jr   nz, label_DB013
    pop  af
    rla
    rla
    rla
    rla
    and  $F0
    ld   e, a
    ld   d, b
    ld   hl, label_DAFC2
    add  hl, de
    ld   c, $04
    call label_3CE6
    ret

label_DB036::
    rst  $38
    ld   b, a
    add  hl, de
    inc  d
    ld   a, [bc]
    stop
    nop
    ld   hl, $DC88
    ld   de, label_DB036

label_DB044::
    ld   a, [de]
    ldi  [hl], a
    inc  de
    ld   a, l
    and  $07
    jr   nz, label_DB044
    ld   a, $02
    ld   [$DDD1], a
    ret

label_DB052::
    ld   [label_818], sp
    jr   label_DB067
    db   $10 ; Undefined instruction
    jr   nz, label_DB020
    ld   c, $03
    ld   b, $00

label_DB05F::
    ld   a, $05
    call label_3B86
    jr   c, label_DB08E
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $0F
    ld   a, [$FFCE]
    ld   hl, label_DB052

label_DB071::
    add  hl, bc
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FFCD]
    ld   hl, label_DB056
    add  hl, bc
    add  a, [hl]
    ld   hl, $FFDA
    sub  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   hl, $C340
    add  hl, de
    ld   [hl], $C4

label_DB08E::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_DB05F
    pop  bc
    ret

label_DB096::
    add  a, b
    ld   h, $95
    ld   h, e
    jr   nz, label_DB0D6
    ld   [hl], l
    ld   l, e
    and  b
    ld   d, c
    dec  [hl]
    ld   [hl], e
    ld   [label_187D], sp
    ld   a, a
    xor  l
    ld   a, b
    ld   sp, hl
    ld   a, [hl]
    ld   d, b
    ld   e, h
    jp  c, label_1276
    ld   b, b
    cp   e
    ld   l, d
    dec  d
    jr   nc, label_DB071
    ld   h, [hl]
    rla
    inc  d
    cp   l
    ld   e, [hl]
    rst  $10
    inc  b
    db   $FD ; Undefined instruction
    ld   d, [hl]
    scf
    dec  b
    dec  e
    ld   d, a
    sub  a, a
    add  hl, bc
    dec  a
    ld   e, e
    push af
    add  hl, bc
    ld   e, h
    ld   e, e
    db   $10 ; Undefined instruction
    ld   e, d
    ld   e, e
    ld   c, e
    ld   b, $79
    ld   d, a
    and  b
    ld   [bc], a
    sub  a, l
    ld   d, a

label_DB0D6::
    ld   a, [$DDD5]
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$FFE7]
    srl  a
    and  $3C
    ld   e, a
    ld   d, $00
    ld   hl, label_DB096
    add  hl, de
    ld   de, $DC5C

label_DB0F3::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, e
    and  $03
    jr   nz, label_DB0F3
    ld   a, $02
    ld   [$DDD1], a
    ret

label_DB101::
    ld   a, [$DB73]
    and  a
    jp   z, label_DB288
    ld   a, [$DC0C]
    and  $02
    jp   nz, label_DB288
    ld   a, [$FF98]
    cp   $24
    jp  c, label_DB288
    cp   $2C
    jp   nc, label_DB288
    ld   a, [$FF99]
    cp   $4E
    jp  c, label_DB288
    cp   $52
    jp   nc, label_DB288
    ld   e, $10
    jp   label_DB28B

label_DB12D::
    ld   a, [$DB73]
    and  a
    jp   z, label_DB288
    ld   a, [$DC0C]
    and  $08
    jp   nz, label_DB288
    ld   a, [$FF98]
    cp   $50
    jp  c, label_DB288
    cp   $60
    jp   nc, label_DB288
    ld   a, [$FF99]
    cp   $58
    jp  c, label_DB288
    cp   $68
    jp   nc, label_DB288
    ld   e, $12
    jp   label_DB28B
    rst  $38
    ld   a, a
    nop
    nop
    ld   [hl], c
    ld   b, h
    ld   a, a
    ld   a, l
    ld   a, [$FFF6]
    cp   $B1
    ret  nz
    ld   a, [$DC0C]
    and  $01
    ret  z
    ld   a, [$DC0C]
    and  $10
    ret  nz
    ld   a, [$DB73]
    ld   hl, $DB79
    or   [hl]
    ld   hl, $DB7B
    or   [hl]
    ld   hl, $DB56
    or   [hl]
    and  $7F
    ret  nz
    push bc
    ld   a, [$DBAF]
    push af
    ld   a, $36
    ld   [$DBAF], a
    ld   a, $FA
    call label_3B86
    pop  af
    ld   [$DBAF], a
    ld   hl, $C200
    add  hl, de
    ld   [hl], $20
    ld   a, [$C124]
    and  a
    jr   nz, label_DB1A5
    ld   [hl], $E0

label_DB1A5::
    ld   hl, $C210
    add  hl, de
    ld   [hl], $6A
    pop  bc
    ret

label_DB1AD::
    ld   a, [$DC0C]
    and  $20
    jp   nz, label_DB288
    ld   hl, $DB00
    ld   e, $0C

label_DB1BA::
    ld   a, [hli]
    cp   $01
    jr   z, label_DB1C7
    dec  e
    ld   a, e
    and  a
    jr   nz, label_DB1BA
    jp   label_DB288

label_DB1C7::
    ld   a, [$DB56]
    and  a
    jp   nz, label_DB288
    ld   a, [$DB73]
    ld   hl, $DB79
    or   [hl]
    ld   hl, $DB7B
    or   [hl]
    and  a
    jp   nz, label_DB288
    ld   a, [$FF98]
    cp   $38
    jp  c, label_DB288
    cp   $58
    jp   nc, label_DB288
    ld   a, [$FF99]
    cp   $50
    jp  c, label_DB288
    cp   $60
    jp   nc, label_DB288
    ld   e, $14
    jp   label_DB28B

label_DB1FA::
    ld   a, [$D879]
    and  $10
    jp   nz, label_DB288
    ld   a, [$DC0D]
    and  $02
    jr   nz, label_DB288
    ld   a, [$DB15]
    cp   $05
    jr   nc, label_DB288
    ld   a, [$FF98]
    cp   $50
    jr   c, label_DB288
    cp   $60
    jr   nc, label_DB288
    ld   e, $18
    ld   a, [$FF99]
    cp   $38
    jr   c, label_DB288
    cp   $40
    jr   c, label_DB28B
    jr   label_DB288

label_DB228::
    ld   a, [$DC0D]
    and  $04
    jr   nz, label_DB288
    ld   a, [$DB15]
    cp   $06
    jr   nz, label_DB288
    ld   hl, $D900
    ld   de, $00E3
    add  hl, de
    ld   a, [hl]
    and  $40
    jr   z, label_DB288
    ld   a, [$FF98]
    cp   $25
    jr   c, label_DB288
    cp   $30
    jr   nc, label_DB288
    ld   e, $19
    ld   a, [$FF99]
    cp   $68
    jr   c, label_DB288
    cp   $6E
    jr   c, label_DB28B
    jr   label_DB288
    ld   a, [$C124]
    and  a
    jr   nz, label_DB288
    ld   a, [$DC0C]
    and  $01
    jr   z, label_DB288
    ld   a, [$DBA5]
    and  a
    jr   nz, label_DB29E
    ld   a, [$FFF6]
    cp   $F0
    jp   z, label_DB101
    cp   $92
    jp   z, label_DB12D
    cp   $A1
    jp   z, label_DB1AD
    cp   $79
    jp   z, label_DB1FA
    cp   $64
    jp   z, label_DB228

label_DB288::
    ld   a, $01
    ret

label_DB28B::
    ld   a, $02
    ld   [$FFA1], a
    ld   a, e
    ld   [$DB95], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    ret

label_DB29E::
    ld   a, [$FFF7]
    cp   $0F
    jr   nz, label_DB2A9
    ld   a, [$FFF9]
    and  a
    jr   z, label_DB288

label_DB2A9::
    jr   label_DB288
    xor  a
    ld   hl, $C390
    add  hl, bc
    ld   [hl], a
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    add  a, $08
    ld   [hl], a
    ret
    ld   a, [$DDD1]
    and  a
    ret  nz
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$DE00]
    and  a
    ret  z
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$DB96]
    cp   $07
    ret  nz
    xor  a
    ld   [$DE00], a
    ld   hl, $C000
    ld   de, $C09C
    ld   b, $14

label_DB2E0::
    ld   c, [hl]
    ld   a, [de]
    ldi  [hl], a
    ld   a, c
    ld   [de], a
    inc  de
    ld   c, [hl]
    ld   a, [de]
    ldi  [hl], a
    ld   a, c
    ld   [de], a
    inc  de
    ld   c, [hl]
    ld   a, [de]
    ldi  [hl], a
    ld   a, c
    ld   [de], a
    inc  de
    ld   c, [hl]
    ld   a, [de]
    ldi  [hl], a
    ld   a, c
    ld   [de], a
    ld   c, $07
    ld   a, e
    sub  a, c
    ld   e, a
    dec  b
    jr   nz, label_DB2E0
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_DB600::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_DB608::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_DBFFF::
    nop
