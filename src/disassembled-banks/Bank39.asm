section "bank39",romx,bank[$27]
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    inc  b
    ld   d, l
    ld   e, d
    ld   e, d
    ld   d, [hl]
    rst  $30
    rst  $38
    ld   a, [$FA44]
    ld   h, d

label_9C01F::
    ld   d, a
    ld   e, c
    ld   e, c
    ld   e, b
    ld   h, d
    ld   d, d
    ld   d, d
    ld   d, d
    ld   h, d
    ld   h, d
    ld   e, e
    ld  [$FF00+C], a
    ld   e, e
    ld   e, e
    ld   a, [bc]
    ld   e, e
    ld  [$FF00+C], a
    ld   e, e
    ld   a, [bc]
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    ld   h, d
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   h, d
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    cp   d
    scf
    ld    hl, sp+$55
    ld   e, d
    ld   d, [hl]
    ld   d, l
    ld   e, d
    ld   d, [hl]
    inc  b
    inc  b
    scf
    ld   h, d
    ld   d, a
    ld   e, c
    ld   e, b
    ld   d, a
    ld   e, c
    ld   e, b
    ld   h, d
    inc  b
    scf
    ld   a, [bc]
    ld   e, e
    ld  [$FF00+C], a
    ld   e, e
    ld   e, e
    ld  [$FF00+C], a
    ld   e, e
    ld   h, d
    or   $37
    inc  c
    inc  c
    inc  c

label_9C085::
    inc  c
    inc  c
    inc  c
    inc  c
    ld   h, d
    ei
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_9C08F::
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  c
    ld   h, d
    rst  $38
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  c
    ld   h, d
    cp   $37
    add  hl, bc
    dec  a
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  a
    add  hl, bc
    dec  a
    inc  [hl]
    rst  8
    rst  8
    rst  8
    ret  nc
    ret  nc
    ret  nc
    inc  sp
    inc  a
    jr   c, label_9C085
    rst  8
    rst  8
    rst  8
    ret  nc
    ret  nc
    ret  nc
    ret  nc
    inc  sp
    jr   c, label_9C08F
    rst  8
    rst  8
    rst  8
    ret  nc
    ret  nc
    ret  nc
    ret  nc
    ld   [$D138], sp
    pop  de
    pop  de
    pop  de
    jp   nc, label_D2D2
    jp   nc, label_382B
    pop  de
    pop  de
    pop  de
    pop  de
    jp   nc, label_D2D2
    jp   nc, label_3837
    pop  de
    pop  de
    pop  de
    pop  de
    jp   nc, label_D2D2
    jp   nc, label_3237
    inc  l
    inc  l
    dec  l
    ld   [label_2C2B], sp
    inc  l
    inc  l
    ld   sp, label_2F3D
    cpl
    cpl
    ld   c, b
    pop  hl
    ld   c, c
    inc  a
    add  hl, bc
    jr   c, label_9C133
    ld   [label_9EF08], sp
    ld   [label_808], sp
    inc  sp
    inc  a
    jr   c, label_9C139
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_3837], sp
    ld   [label_9E908], sp
    ld   [label_808], sp
    ld   [label_3708], sp
    jr   c, label_9C146
    ld   [label_808], sp
    ld   l, c
    ld   l, c
    ld   l, c
    ld   [label_3837], sp
    jr   c, label_9C18D
    ld   l, c
    ld   l, c
    ld   [label_808], sp
    ld   [label_3837], sp
    jr   c, label_9C136
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    jr   c, label_9C16F
    ld   [label_9E969], sp
    ld   [label_2B08], sp
    inc  l
    ld   sp, label_3E38
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9C146::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  b
    scf
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    dec  bc
    rst  $30
    rst  $38
    rst  $38
    ld    hl, sp+$F5
    scf
    rst  $30
    ld   a, [label_BF8]
    dec  bc
    rst  $30
    ld    hl, sp+$04
    rst  $30
    ld   l, $2F
    cpl
    cpl
    ld   c, b
    ld   b, e
    ld   c, c
    ld   c, b
    ld   [rOBP1], a
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9C16F::
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    scf
    rst  $38
    ld    hl, sp+$04
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    push af
    scf
    ld    hl, sp+$04
    ld   [hl], $3C
    inc  b
    inc  b
    push af
    ld   sp, hl
    rst  $38
    scf
    inc  b
    inc  b
    inc  b
    ld   l, $48
    ld   c, d

label_9C18D::
    ld   c, c
    cpl
    cpl
    ei
    ld   b, h
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    jr   c, label_9C19C
    cp   $27
    rst  $38
    rst  $38

label_9C19C::
    ld   a, [label_9C4FA]
    ld    hl, sp+$38
    or   $F7
    dec  h
    ld   a, [label_3DF8]
    ld   c, b
    ld   c, d
    ld   c, c
    ld   c, [hl]
    ld   b, h
    or   $27
    cpl
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    rst  $38
    ld    hl, sp+$25
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    push af
    ld   sp, hl
    rst  $38
    ld   a, [label_4F8]
    daa
    ld   sp, hl
    rst  $38
    ld   a, [rLY]
    db   $FC ; Undefined instruction
    ld   e, h
    ld   e, h
    ld   e, h
    dec  h
    rst  $38
    ld    hl, sp+$5C
    ld   e, h
    rst  $30
    ld    hl, sp+$04
    inc  b
    inc  b
    daa
    cpl
    cpl
    cpl
    cpl
    ld   c, b
    ld   c, d
    ld   c, c

label_9C1DD::
    cpl
    cpl
    cpl
    jr   z, label_9C1DD
    db   $FC ; Undefined instruction
    inc  b
    push af
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    daa
    add  hl, hl
    ld   h, $FB
    ld   b, h
    ld   sp, hl
    rst  $38
    rst  $38
    rst  $38

label_9C1F1::
    rst  $38
    ld   b, h
    daa
    jr   z, label_9C1F1
    rst  $38
    rst  $38
    rst  $38
    ld   b, h
    rst  $38
    rst  $38
    ld    hl, sp+$25
    ld   h, $FB
    rst  $38
    ld   a, [$FFFA]
    rst  $38

label_9C205::
    db   $FC ; Undefined instruction
    dec  h
    ld   a, [hli]
    jr   z, label_9C205
    db   $FC ; Undefined instruction
    dec  h
    ld   h, $FB
    rst  $38
    ld    hl, sp+$27
    add  hl, hl
    ld   h, $F7
    ld   b, h
    daa
    jr   z, label_9C213
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    daa
    jr   z, label_9C222
    rst  $30
    ld   sp, hl
    ld   sp, hl
    ld   a, [$F6FF]
    inc  b
    inc  b
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   a, [hli]
    jr   z, label_9C25A
    jr   z, label_9C263
    cpl
    cpl
    cpl
    ld   c, [hl]
    daa
    jr   z, label_9C240
    inc  b
    inc  c
    add  hl, sp
    ld   h, d

label_9C240::
    jp   nz, label_3B62
    dec  h
    ld   h, $04
    inc  b
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    daa
    jr   z, label_9C254
    inc  b
    inc  c
    or   [hl]
    inc  c

label_9C254::
    inc  c
    inc  c
    or   [hl]
    dec  h
    ld   h, $04

label_9C25A::
    inc  b
    inc  c
    or   a
    inc  c
    or   [hl]
    inc  c
    or   a
    daa
    jr   z, label_9C268
    inc  b
    inc  b
    inc  c
    inc  c

label_9C268::
    ret  nz
    inc  c

label_9C26A::
    inc  c
    dec  h
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  b
    daa
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    jr   z, label_9C28C
    ld   a, [bc]
    ld   [de], a
    inc  b
    ld   b, h
    inc  b
    inc  de
    rrca

label_9C289::
    inc  d
    ld   h, $0A

label_9C28C::
    ld   a, [de]
    ld   d, $04
    inc  b
    inc  b
    ld   de, label_121B
    jr   z, label_9C26A
    jr   label_9C2A7
    inc  d
    ld   e, h
    inc  b
    ld   de, label_121B
    ld   h, $0A
    ld   a, [bc]
    ld   l, [hl]
    jr   label_9C2B3
    inc  d
    dec  d
    db   $10
    db   $16
    add  hl, hl
    ld   h, $6E
    ld   e, h
    ld   l, [hl]
    ld   l, [hl]
    jr   label_9C2BF
    rrca
    rrca
    ld   a, [hli]

label_9C2B3::
    jr   z, label_9C289
    jr   nz, label_9C29F
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   a, [bc]
    ld   l, [hl]
    jr   z, label_9C2C8
    jr   nz, label_9C2CA
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   e, h
    ld   a, [bc]
    cpl
    cpl

label_9C2C8::
    cpl
    cpl

label_9C2CA::
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   de, label_1B1B
    ld   [de], a
    inc  b
    ld   de, label_A0A
    ld   a, [bc]
    daa
    ld   de, label_1A1B
    ld   d, $6E
    ld   de, label_A0A
    ld   a, [bc]
    dec  h
    dec  d
    db   $10
    db   $16
    inc  de
    rrca
    rla
    call nc, label_A0A
    daa
    inc  b
    ld   b, h
    call nc, label_A11
    ld   a, [bc]
    jr   nz, label_9C2CA
    inc  b
    dec  h
    rrca
    rrca
    rrca
    rla
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  b
    daa
    ld   l, [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    call nc, label_A0A
    ld   a, [bc]
    dec  h
    ld   h, $0A
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    daa
    jr   z, label_9C346
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  a
    jr   z, label_9C32C
    ld   l, [hl]
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   a, [bc]
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   h, $0A

label_9C32C::
    ld   l, [hl]
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   a, [bc]
    jr   z, label_9C340
    ld   l, [hl]
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   e, h
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   h, $0A

label_9C340::
    ld   l, [hl]
    ld   d, d
    ld   d, d
    ld   d, d
    ld   e, h
    ld   e, h

label_9C346::
    ld   e, h
    ld   a, [bc]
    jr   z, label_9C354
    or   $5B
    ld  [$FF00+C], a
    ld   e, e
    ld   l, [hl]
    call nc, label_9EE6E
    dec  h
    ld   h, $0A
    or   $04
    inc  b
    rst  $30
    db   $FD ; Undefined instruction
    or   $6E
    daa
    jr   z, label_9C369
    ld   a, [bc]
    ld   a, [bc]
    db   $D3 ; Undefined instruction
    dec  h
    ld   h, $F7
    db   $FD ; Undefined instruction
    dec  h
    ld   h, $25

label_9C369::
    ld   h, $25
    ld   h, $27
    jr   z, label_9C394
    ld   h, $D3
    ld   a, [bc]
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   a, [bc]
    db   $D3 ; Undefined instruction
    ld   a, [bc]
    ld   l, [hl]
    ei
    scf
    ld   a, [bc]
    ld   e, h
    ld   e, h
    db   $D3 ; Undefined instruction
    ld   e, h
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   l, [hl]
    db   $FC ; Undefined instruction
    scf
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   e, h
    ld   e, h
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   l, [hl]
    rst  $30
    scf
    ld   a, [bc]
    ld   e, h
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   e, h

label_9C394::
    ld   e, h
    ld   l, [hl]
    inc  b
    scf
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   l, [hl]
    inc  b
    push af
    scf
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    call nc, label_9EE6E
    push af
    db   $FD ; Undefined instruction
    ld    hl, sp+$2E
    ld   a, [label_4F6]
    inc  b
    inc  b
    push af
    ld    hl, sp+$25
    ld   h, $39
    dec  h
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   a, [hli]
    add  hl, hl
    ld   h, $38
    ld   a, [bc]
    rst  $38
    rst  $38
    ld    hl, sp+$04
    inc  b
    jr   c, label_9C404
    ld   c, $38
    ld   a, [bc]
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    push af
    jr   c, label_9C3E1
    ld   c, $38
    ld   a, [bc]
    rst  $38
    ld    hl, sp+$04
    inc  b
    ei
    jr   c, label_9C3EB
    ld   c, $38
    ld   a, [bc]
    db   $FC ; Undefined instruction

label_9C3E1::
    inc  b
    inc  b
    push af
    rst  $38
    jr   c, label_9C3F5
    ld   c, $38
    ld   a, [bc]
    db   $FC ; Undefined instruction

label_9C3EB::
    dec  a
    ld   c, b
    ld   [rOBP1], a
    ld   c, [hl]
    ld   c, $0E
    ld   c, [hl]
    rst  $38
    db   $FC ; Undefined instruction

label_9C3F5::
    jr   c, label_9C431
    ld   [$FF3A], a
    dec  sp
    ld   c, $0E
    dec  sp
    rst  $30
    rst  $38
    jr   c, label_9C40F
    ld   c, $0E
    ld   c, $0E
    ld   c, $25
    ld   h, $F7
    jr   c, label_9C419
    ld   c, $0E
    ld   c, $0E

label_9C40F::
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E

label_9C419::
    ld   c, $0E
    ld   c, $0E
    jp   z, label_9D151
    ld   d, c
    ld   d, c
    ld   c, $0E
    ld   c, $0E
    ld   d, c
    ld   c, $B6
    or   a
    ld   h, [hl]
    ld   c, $CA
    ld   c, $0E
    ld   c, $51

label_9C431::
    ld   c, $67
    db   $E3 ; Undefined instruction
    ld   l, b
    ld   c, $51
    ld   c, $0E
    jp   z, label_E51
    ld   c, $0E
    ld   c, $0E
    ld   d, c
    ld   c, $0E
    ld   c, $0E
    ld   d, c
    ld   c, $0E
    ld   c, $CA
    ld   d, c
    ld   c, $0E
    jp   z, label_CACA
    ld   d, c
    jp   z, label_9D151
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    inc  b
    daa
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $33
    ld   [$FF2F], a
    ld   c, $0E
    dec  hl
    inc  l
    inc  l
    dec  l
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    scf
    inc  b
    ld   l, a
    ldd  [hl], a
    inc  l
    dec  l
    ld   c, $0E
    ld   c, $0E
    scf
    inc  b
    inc  b
    inc  b
    inc  b
    jr   c, label_9C49F
    ld   c, $0E
    ld   c, $33
    inc  a
    inc  b
    inc  b
    inc  b
    jr   c, label_9C4A9
    ld   c, $0E
    ld   c, $0E

label_9C49F::
    scf
    inc  b
    inc  b
    push af
    jr   c, label_9C4B3
    ld   c, $0E
    ld   c, $0E

label_9C4A9::
    scf
    push af
    ld   sp, hl
    ld   b, h
    jr   c, label_9C4BD
    ld   c, $28
    rst  $30
    ld   a, [bc]

label_9C4B3::
    db   $FC ; Undefined instruction
    inc  b
    rst  $30
    rst  $38
    db   $FC ; Undefined instruction
    dec  h
    ld   h, $2F
    inc  a
    ld   a, [bc]

label_9C4BD::
    rst  $38
    or   $04
    ld   b, h
    db   $FC ; Undefined instruction
    daa
    jr   z, label_9C4D3
    scf
    rst  $38
    rst  $38
    ld    hl, sp+$F5
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $0E
    scf
    ei
    db   $FC ; Undefined instruction
    inc  b

label_9C4D3::
    ld   a, [bc]
    dec  h
    ld   b, l
    ld   a, [hli]
    jr   z, label_9C4E7
    scf
    ld   b, h
    db   $FC ; Undefined instruction
    inc  b
    ld   a, [bc]
    daa
    pop  hl
    add  hl, hl
    ld   h, $0E
    scf
    ld   a, [bc]
    rst  $38
    or   $04
    ld   a, [bc]
    ld   a, [bc]
    daa
    jr   z, label_9C4FB
    scf
    ld   a, [bc]
    rst  $38
    ld   b, h
    ld   sp, hl
    rst  $38
    db   $FC ; Undefined instruction
    dec  a
    cpl
    ld   c, $37
    ld   a, [bc]
    rst  $38

label_9C4FA::
    rst  $38

label_9C4FB::
    rst  $38
    rst  $38
    rst  $38
    jr   c, label_9C50E
    ld   h, d
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   h, d
    ld   a, [bc]
    ld   a, [bc]
    rst  $38

label_9C50E::
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   h, d
    ld   a, [bc]
    rst  $38
    ld   b, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   h, d
    ld   a, [bc]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   b, h
    ld   a, [bc]
    ld   h, d
    ld   a, [bc]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   b, h
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   h, d
    ld   h, d
    ld   a, [bc]
    rst  $38
    rst  $38
    ld   b, h
    ld   a, [label_AFA]
    ld   a, [bc]
    cpl
    cpl
    inc  a
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   h, d
    ld   h, d
    ld   h, d
    ld   h, d
    ld   c, $0E
    scf
    db   $FC ; Undefined instruction
    dec  h
    ld   h, $25
    ld   h, $25
    ld   h, $0A
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  c
    ld   h, d
    ei
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   d, l
    ld   e, d
    ld   d, [hl]
    ld   h, d
    cp   $37
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   e, h
    ld   d, a
    ld   e, c
    ld   e, b
    ld   h, d
    ei
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   h, c
    ld   e, e
    ld  [$FF00+C], a
    ld   e, e
    ld   h, d
    db   $FC ; Undefined instruction
    ld   l, $0A
    ld   a, [bc]
    inc  c
    inc  c
    inc  c
    inc  c
    ld   h, d
    ei
    ld   b, h
    add  hl, sp
    rst  $38
    db   $FC ; Undefined instruction
    inc  c
    ld   a, [bc]
    ld   h, d
    ld   h, d
    ld   h, d
    ld    hl, sp+$25
    ld   h, $62
    ld   h, d
    inc  c
    ld   h, d
    ld   h, d
    ld   a, [label_4F8]
    daa
    jr   z, label_9C5BC
    ld   h, $0C
    dec  h
    ld   h, $04
    dec  h
    ld   h, $25
    ld   h, $36
    cpl
    cpl
    inc  [hl]
    ld   [label_2F2E], sp
    cpl
    cpl
    cpl
    or   [hl]
    ld   [label_808], sp
    ld   [label_3A39], sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   a
    ld   [label_353D], sp
    ld   [label_9E908], sp
    ld   [label_808], sp
    inc  a
    inc  bc
    jr   c, label_9C5CA
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    inc  bc

label_9C5CA::
    jr   c, label_9C635
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    inc  bc
    ldd  [hl], a
    inc  l
    dec  l
    ld   [label_808], sp
    ld   [label_372B], sp
    inc  bc
    inc  bc
    add  hl, bc
    jr   c, label_9C5EA
    ld   [label_808], sp
    scf
    scf
    inc  bc
    inc  bc
    inc  bc

label_9C5EA::
    jr   c, label_9C5F4
    dec  hl
    inc  l
    inc  l
    ld   sp, label_84E
    ld   l, c
    ld   l, c

label_9C5F4::
    ld   [label_3308], sp
    cpl
    dec  [hl]
    jr   c, label_9C636
    ld   [label_9E908], sp
    ld   [label_808], sp
    ld   [label_3808], sp
    ld   [label_808], sp
    ld   [label_869], sp
    ld   [label_808], sp
    jr   c, label_9C617
    ld   [label_808], sp
    ld   [label_869], sp
    ld   [label_3808], sp
    ld   [label_808], sp
    ld   [label_3608], sp
    cpl
    inc  a
    ld   [label_2D38], sp
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    inc  bc
    jr   c, label_9C665
    ld   [label_808], sp
    ld   [$C808], sp
    scf
    inc  bc

label_9C635::
    jr   c, label_9C669
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    ld   sp, label_3803
    scf
    inc  bc
    inc  bc
    inc  bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    scf
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    scf
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    or   a
    or   [hl]

label_9C665::
    or   a
    inc  bc
    or   [hl]
    scf

label_9C669::
    inc  bc
    inc  bc
    inc  bc
    call label_CDCE
    adc  a, $03
    call label_337
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    scf
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   e, h
    inc  bc
    ld   e, h
    ld   e, h
    call label_337
    inc  bc
    dec  a
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    cpl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    inc  bc
    inc  bc
    call nc, label_303
    ld   e, h
    ld   e, h
    ld   e, h
    or   [hl]
    or   a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    call label_B7CE
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    adc  a, $03
    inc  bc
    dec  a
    cpl
    dec  [hl]
    inc  bc
    inc  bc
    ld   [hl], $2F
    or   a
    inc  bc
    inc  bc
    jr   c, label_9C6CF
    ld   [label_808], sp
    ld   [$CE08], sp
    ld   e, h
    ld   e, h

label_9C6CF::
    jr   c, label_9C6D9
    ld   [label_824], sp
    ld   [label_2F08], sp
    cpl
    cpl

label_9C6D9::
    ld   c, [hl]
    ld   [label_808], sp
    ld   [label_2C2B], sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   [hl]
    or   a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    or   a
    call label_3CE
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    call label_3CE
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  a
    inc  bc
    inc  bc
    ld   [label_2408], sp
    ld   [label_808], sp
    ld   [$B637], sp
    or   a
    ld   [label_808], sp
    ld   [label_824], sp
    ld   [$CD37], sp
    adc  a, $2C
    dec  l
    ld   [label_808], sp
    ld   [label_2E08], sp
    inc  a
    inc  bc
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   [hl]
    or   a
    inc  bc
    ld   d, d
    ld   d, d
    ld   d, d
    or   [hl]
    or   a
    or   [hl]
    or   a
    call label_3CE
    ld   e, e
    ld  [$FF00+C], a
    ld   e, e
    call label_CDCE
    adc  a, $03
    inc  bc
    ld   e, h
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc

label_9C758::
    inc  bc
    inc  bc
    ld   e, h
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    or   a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    or   a
    or   [hl]
    or   a
    call label_3CE
    inc  bc
    inc  bc
    inc  bc
    call label_CDCE
    adc  a, $03
    dec  a
    ld   c, b
    ld   c, d
    ld   c, d
    ld   c, d
    ld   c, c
    cpl
    cpl
    cpl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   [hl]
    or   a
    or   [hl]
    or   a
    or   [hl]
    or   a
    ld   [label_808], sp
    ld   [$CECD], sp
    call label_CDCE
    adc  a, $08
    ld   [label_808], sp
    inc  bc
    inc  bc
    ld   e, h
    ld   [label_808], sp
    ld   [label_2408], sp
    ld   [label_303], sp
    ld   e, h
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [$B7B6], sp
    dec  a
    dec  [hl]
    ld   [label_808], sp
    ld   [label_808], sp
    call label_38CE
    ld   [label_824], sp
    ld   [label_808], sp
    dec  hl
    cpl
    cpl
    ld   c, [hl]
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    ld   [label_808], sp
    ld   [label_2408], sp
    ld   [label_808], sp
    ld   l, $08
    ld   [$C808], sp
    ld   [label_808], sp
    and  b

label_9C7EC::
    jr   nz, label_9C827
    ld   [label_824], sp
    ld   [label_808], sp
    ret  z
    jr   nz, label_9C7EC
    ld   sp, hl
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [$FB20], sp
    rst  $38
    ld   [$C808], sp
    ld   [label_808], sp
    ld   [hl], $3C
    rst  $30
    ld   a, [label_82D]
    ld   [label_808], sp
    ld   [label_3308], sp
    cpl
    inc  a
    ldd  [hl], a
    inc  l
    inc  l
    inc  l
    dec  l
    ld   [label_808], sp
    ld   [label_2737], sp
    jr   z, label_9C84A
    jr   z, label_9C84C
    jr   z, label_9C864

label_9C827::
    dec  [hl]
    daa
    jr   z, label_9C85A
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   sp, hl
    or   $25
    ld   h, $C6
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $FF
    db   $FC ; Undefined instruction

label_9C84A::
    daa
    jr   z, label_9C872
    ld   h, $25
    ld   h, $27
    add  hl, hl
    ld   a, [$F6FA]
    inc  b
    daa
    jr   z, label_9C880
    jr   z, label_9C85F
    daa
    dec  a
    cpl
    inc  a

label_9C85F::
    or   $04
    inc  b
    inc  b
    inc  b

label_9C864::
    inc  b
    dec  h
    jr   c, label_9C8A2
    ld   l, $3C
    ld   sp, hl
    or   $04
    inc  b
    inc  b
    daa
    daa
    jr   z, label_9C89A
    jr   z, label_9C89C
    jr   z, label_9C89E
    add  hl, hl
    ld   a, [hli]

label_9C879::
    jr   z, label_9C885
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_9C880::
    add  a, $27
    jr   z, label_9C879
    ld   a, [bc]

label_9C885::
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $F5
    ld   b, h

label_9C88E::
    dec  h
    ld   h, $25
    ld   h, $0A
    dec  h
    ld   a, [hli]
    jr   z, label_9C88E
    rst  $38
    ld   a, [hli]
    jr   z, label_9C8C2

label_9C89B::
    add  hl, hl

label_9C89C::
    ld   h, $27

label_9C89E::
    jr   z, label_9C8A4
    inc  b
    ei

label_9C8A2::
    jr   z, label_9C89B

label_9C8A4::
    or   $27
    jr   z, label_9C8EC
    or   $E8
    push af
    rst  $38
    ld   h, $04
    rst  $30
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   a, [$F9FA]
    rst  $38
    rst  $38
    jr   z, label_9C8DD
    ld   h, $25
    ld   h, $25
    ld   h, $FB
    ld   b, h
    rst  $38
    daa
    jr   z, label_9C8C7
    jr   c, label_9C8D3
    ld   c, $0E

label_9C8C7::
    ld   c, $0E
    ld   c, $F9
    or   $04
    jr   c, label_9C8DD
    ld   c, $0E
    ld   c, $0E

label_9C8D3::
    ld   c, $FF
    rst  $38
    or   $32
    inc  l
    inc  l
    inc  l
    dec  l
    ld   c, $0E
    rst  $38
    rst  $38
    ld   a, [$FAFD]
    or   $09
    jr   c, label_9C8F5
    ld   c, $FA
    ld    hl, sp+$25
    ld   b, l

label_9C8EC::
    ld   h, $FB
    or   $38
    ld   c, $0E
    inc  bc
    inc  b
    daa

label_9C8F5::
    pop  hl
    jr   z, label_9C8EF
    rst  $38
    ldd  [hl], a
    inc  l
    inc  l
    inc  bc
    inc  bc
    inc  bc
    inc  b
    add  hl, bc
    inc  b
    rst  $30
    ld   a, [$F9FF]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    rst  $30
    ld   a, [label_E0E]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    dec  hl
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    ld   c, $0E
    ld   c, $CA
    scf
    inc  b
    add  a, $04
    inc  b
    push af
    ld   c, $0E
    ld   c, $0E
    inc  sp
    inc  a
    inc  b
    push af
    ld   sp, hl
    rst  $38
    ld   c, $0E
    jp   z, label_E0E
    scf
    push af
    ld   a, [rLY]
    inc  l
    inc  l
    inc  l
    dec  l
    ld   c, $33
    cpl
    inc  a
    rst  $30
    ld   a, [label_A0A]
    ld   e, h
    jr   c, label_9C95F
    ld   c, $0E
    inc  sp
    cpl
    cpl
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    jr   c, label_9C969
    ld   c, $0E
    jp   z, label_CACA
    ld   c, $0E
    ld   c, $37
    ld   b, h
    ld   a, [label_38F8]
    ld   c, $0E
    inc  l
    inc  l
    dec  l
    inc  sp
    cpl
    db   $DB
    cpl
    inc  [hl]
    ld   c, $0E
    ld   sp, hl
    ld   b, h
    jr   c, label_9C986
    jp   z, label_EDB
    ld   c, $0E
    ld   c, $FF
    db   $FC ; Undefined instruction
    ldd  [hl], a
    dec  l
    jp   z, label_CADB
    ld   c, $2B
    inc  l
    ld   b, h
    ld    hl, sp+$04
    ldd  [hl], a
    dec  l
    db   $DB
    jp   z, label_312B
    inc  b
    ld    hl, sp+$04
    dec  h
    ld   h, $32
    db   $DB
    inc  l
    ld   sp, $F9F5
    inc  a
    inc  b
    daa
    jr   z, label_9C9A5
    inc  b
    rst  $30
    ld   b, h
    rst  $38

label_9C9A5::
    ld   a, [label_437]
    inc  b
    dec  h
    ld   h, $04
    inc  b
    rst  $30
    db   $FC ; Undefined instruction
    dec  h
    ld   c, $37
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   b, h
    jr   c, label_9C9C8
    ld   c, $37
    rst  $30
    ld   b, h
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$38
    ld   c, $0E
    scf
    inc  b
    ei

label_9C9C8::
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    jr   c, label_9C9DC
    inc  l
    ld   sp, $FAF5
    ld   b, h
    rst  $38
    rst  $38
    or   $38
    ld   c, $F5
    ld   sp, hl
    ld    hl, sp+$04

label_9C9DC::
    rst  $30
    rst  $38
    ld   b, h
    ld    hl, sp+$38
    ld   c, $FF
    ld    hl, sp+$25
    ld   h, $04
    rst  $30
    ld    hl, sp+$04
    jr   c, label_9C9FA
    ld   b, h
    inc  b
    daa
    jr   z, label_9C9F5
    inc  b
    inc  b
    inc  b
    jr   c, label_9CA04
    ld   h, $25
    ld   h, $44

label_9C9FA::
    or   $04
    inc  b
    dec  a
    inc  [hl]
    ld   c, $0E
    ld   c, $37
    db   $FC ; Undefined instruction

label_9CA04::
    daa
    jr   z, label_9CA2E
    jr   z, label_9CA30
    jr   z, label_9CA19
    ld   c, $37
    cp   $3D
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, $0E
    scf
    ei
    jr   c, label_9CA35
    dec  de
    dec  de
    dec  de
    dec  de
    ld   c, $2B
    ld   sp, label_38FC
    dec  hl
    inc  l
    dec  l
    dec  de
    dec  de
    ld   c, $37
    ld   b, h
    db   $FC ; Undefined instruction
    jr   c, label_9CA65

label_9CA2E::
    db   $E8 ; add  sp, d
    jr   c, label_9CA4C
    dec  de
    ld   c, $37
    rst  $38

label_9CA35::
    rst  $38
    jr   c, label_9CA6B
    ld   [$FF34], a
    dec  de
    dec  de
    ld   c, $37
    ei
    ld   b, h
    jr   c, label_9CA5D
    dec  de
    dec  de
    dec  de
    dec  de
    ld   c, $37
    ei
    rst  $38
    ldd  [hl], a
    inc  l

label_9CA4C::
    inc  l
    inc  l
    inc  l
    inc  l
    daa
    jr   z, label_9CA97
    daa
    jr   z, label_9CA5A
    daa
    jr   z, label_9CA80
    jr   z, label_9CA8A
    inc  a
    ld    hl, sp+$25
    ld   h, $04
    push af
    ld   b, h
    dec  hl
    inc  l
    dec  de

label_9CA65::
    scf
    inc  b
    daa
    jr   z, label_9CA5F
    rst  $38

label_9CA6B::
    dec  hl
    ld   sp, label_1B03
    inc  sp
    ld   [$FF3C], a
    inc  b
    ei
    ld    hl, sp+$37
    inc  bc
    inc  bc
    dec  de
    dec  de
    dec  de
    scf
    push af
    db   $FC ; Undefined instruction
    dec  hl
    ld   sp, label_303
    dec  de
    dec  de
    dec  de
    scf
    ei
    rst  $38
    scf
    inc  bc

label_9CA8A::
    inc  bc
    inc  bc
    dec  de
    dec  de
    dec  de
    scf
    rst  $38
    ld   b, h
    scf
    inc  bc
    inc  bc
    inc  bc
    inc  l

label_9CA97::
    inc  l
    inc  l
    ld   sp, rLY
    scf
    inc  bc
    inc  bc
    inc  bc
    scf
    add  hl, bc
    inc  bc
    inc  bc
    jr   c, label_9CAAE
    inc  sp
    cpl
    cpl
    cpl
    ld   sp, label_303
    inc  bc

label_9CAAE::
    jr   c, label_9CAB8
    ld   [label_808], sp
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc

label_9CAB8::
    jr   c, label_9CAC2
    ld   [label_808], sp
    or   a
    inc  bc
    dec  a
    cpl
    cpl

label_9CAC2::
    ld   c, [hl]
    ld   [label_808], sp
    ld   [label_908], sp
    jr   c, label_9CB05
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [label_808], sp
    ld   [label_308], sp
    jr   c, label_9CADD
    ld   [label_808], sp
    ld   [label_8C8], sp
    ld   [label_3803], sp
    ld   [label_8C8], sp
    ld   [label_808], sp
    ld   [label_308], sp
    jr   c, label_9CAF1
    ld   [label_808], sp
    ld   [label_808], sp
    or   [hl]
    cpl

label_9CAF1::
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  a
    inc  bc
    jr   c, label_9CAB1
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    inc  bc
    jr   c, label_9CABC

label_9CB05::
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    inc  bc
    jr   c, label_9CB17
    ld   [label_808], sp
    ld   l, c
    ld   [label_3708], sp
    inc  bc

label_9CB17::
    jr   c, label_9CB21
    ld   [label_808], sp
    ld   [label_808], sp

label_9CB1F::
    scf
    inc  bc

label_9CB21::
    jr   c, label_9CB2B
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    inc  bc

label_9CB2B::
    jr   c, label_9CB35
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    inc  bc

label_9CB35::
    jr   c, label_9CAED
    ld   [label_808], sp
    or   [hl]
    or   [hl]
    or   [hl]
    scf
    inc  bc
    jr   c, label_9CB78
    inc  bc
    inc  bc
    jr   c, label_9CB7F
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    inc  bc
    inc  bc
    jr   c, label_9CB57
    ld   [label_808], sp
    ld   [label_3708], sp
    inc  bc
    inc  bc

label_9CB57::
    jr   c, label_9CB61
    ld   [label_2408], sp
    ld   [label_2E08], sp
    inc  a
    inc  bc

label_9CB61::
    jr   c, label_9CB6B
    ld   [label_808], sp
    ld   [label_3908], sp
    scf
    inc  bc

label_9CB6B::
    jr   c, label_9CB75
    ld   [label_8C8], sp
    ld   [label_1F08], sp
    ld   l, $2F

label_9CB75::
    ld   c, [hl]
    ld   e, $1E

label_9CB78::
    ld   e, $1E
    ld   e, $1E
    rra
    add  hl, sp
    db   $3A ; ldd  a, [hl]

label_9CB7F::
    dec  sp
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [label_808], sp
    ld   [label_337], sp
    ld   [label_808], sp
    ld   [label_808], sp
    inc  h
    ld   [label_2F2E], sp
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_3908], sp
    db   $3A ; ldd  a, [hl]
    ld   [label_808], sp
    ret  z
    ld   [label_808], sp
    ld   [label_824], sp
    ld   [label_808], sp
    ld   [label_823], sp
    ret  z
    ld   [label_2B08], sp
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $37
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    ld   l, $1F
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    add  hl, sp
    inc  bc
    jr   c, label_9CBEB
    ld   [label_808], sp
    ld   [label_2E3E], sp
    cpl
    cpl

label_9CBEB::
    ld   c, [hl]
    ld   [label_808], sp
    ld   [label_3908], sp
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [label_808], sp
    ld   [label_808], sp
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    ld   [label_808], sp
    ld   [label_2308], sp
    ld   [label_2408], sp
    ld   [label_2D2C], sp
    ld   [label_2308], sp
    ld   [$C808], sp
    ld   [label_308], sp
    jr   c, label_9CC33
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $2F
    ld   c, [hl]
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    db   $3A ; ldd  a, [hl]
    dec  sp
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]

label_9CC33::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   [label_824], sp
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_824], sp
    ld   [label_808], sp
    ret  z
    ld   [label_808], sp
    ld   [label_808], sp
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    db   $3A ; ldd  a, [hl]
    cp   d
    dec  sp
    ld   [label_2408], sp
    ld   [label_808], sp
    scf
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    ld   [label_808], sp
    ld   [label_8C8], sp
    ld   [label_2408], sp
    scf
    ld   [label_824], sp
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $37
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    inc  sp
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    inc  bc
    dec  a
    cpl
    cpl
    inc  [hl]
    ld   [label_808], sp
    ld   [label_337], sp
    jr   c, label_9CCE5
    ld   [label_2408], sp
    ld   [label_808], sp
    scf
    dec  a

label_9CCE5::
    ld   c, [hl]
    or   [hl]
    or   a
    ld   [label_808], sp
    or   [hl]
    or   a
    scf
    jr   c, label_9CD2B
    call label_8CE
    ld   [$CD08], sp
    adc  a, $37
    jr   c, label_9CD02
    ld   [label_8C8], sp
    ld   [label_808], sp
    ld   [label_3837], sp
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   e, $1E
    ld   l, $34
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    ld   a, $1F
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    rra
    add  hl, sp
    jr   c, label_9CD30
    add  hl, sp
    scf
    rst  $38
    rst  $38
    or   $04
    inc  b
    dec  h
    jr   c, label_9CD3A
    ld   c, $37
    ld   a, [bc]
    ld   a, [bc]

label_9CD30::
    ld   b, h
    ld   sp, hl
    or   $27
    jr   c, label_9CD44
    ld   c, $37
    ld   d, d
    ld   d, d

label_9CD3A::
    ld   d, d
    ld   a, [bc]
    ld   a, [bc]
    ld   sp, hl
    jr   c, label_9CD4E
    ld   c, $37
    ld   e, e
    ld  [$FF00+C], a

label_9CD44::
    ld   e, e
    ld   a, [bc]
    rst  $38
    rst  $38
    jr   c, label_9CD58
    ld   c, $2E
    inc  a
    ld   a, [bc]

label_9CD4E::
    ld   a, [bc]
    inc  b
    rst  $30
    ld   b, h
    ld   c, [hl]
    ld   c, $0E
    add  hl, sp
    ld   l, $2F

label_9CD58::
    inc  a
    or   $04
    rst  $30
    dec  sp
    ld   c, $0E
    ld   c, $39
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    cpl
    cpl
    dec  sp
    ld   c, $0E
    ld   c, $0E
    ld   c, $39
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   h, $27
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9CDBC
    ld   a, [label_28F8]
    dec  h
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $F8
    dec  h
    ld   h, $F6
    daa
    jr   z, label_9CDAF
    jr   z, label_9CDB1
    jr   z, label_9CD90
    daa
    jr   z, label_9CD8B
    inc  b

label_9CD90::
    inc  b
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    inc  b
    inc  b
    dec  a
    cpl
    rst  $38
    or   $25
    ld   h, $25
    ld   h, $25
    ld   h, $38
    ld   c, $FF
    ld    hl, sp+$27
    jr   z, label_9CDCE
    jr   z, label_9CDD0
    jr   z, label_9CDE3
    ld   c, $2F
    cpl
    cpl

label_9CDAF::
    cpl
    cpl

label_9CDB1::
    cpl
    cpl
    cpl
    ld   c, [hl]
    ld   c, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9CDBC::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, $04
    push af
    or   $04
    push af
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    or   $04
    dec  a
    cpl
    ld   c, b
    ld   [rOBP1], a
    inc  a

label_9CDD0::
    rst  $30
    ld   a, [$F644]
    jr   c, label_9CDE4
    ld   c, $0E
    ld   c, $33
    cpl
    inc  a
    rst  $30
    rst  $38
    inc  [hl]
    ld   c, $2B
    inc  l
    inc  l

label_9CDE3::
    dec  l

label_9CDE4::
    ld   c, $37
    inc  b
    rst  $30
    jp   z, label_370E
    inc  b
    ld   e, h
    jr   c, label_9CDFD
    scf
    or   $04
    jp   z, label_330E
    ld   [$FF2F], a
    inc  [hl]
    ld   c, $37
    ld   a, [$CAF9]

label_9CDFD::
    ld   c, $0E
    ld   c, $CA
    ld   c, $0E
    ld   l, $3C
    ld   b, h
    ld   c, $CA
    jp   z, label_ECA
    ld   c, $0E
    add  hl, sp
    ld   l, $2F
    rst  $30
    ld   a, [label_38FF]
    ld   c, $0E
    ld   c, $CA
    jp   z, label_4CA
    inc  b
    rst  $30
    ldd  [hl], a
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    dec  l
    ld   sp, hl
    or   $04
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    jr   c, label_9CE2E
    db   $FC ; Undefined instruction

label_9CE30::
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    jr   c, label_9CE30

label_9CE39::
    ld    hl, sp+$E8
    db   $E8 ; add  sp, d
    ld   e, h
    ld   e, h
    ld   e, h
    add  a, $5C
    jr   c, label_9CE39
    inc  b
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   e, h

label_9CE47::
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    jr   c, label_9CE47
    or   $E8
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   e, h
    ld   e, h
    ld   e, h
    dec  a
    inc  [hl]
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  [hl]
    ld   c, $37
    push af
    or   $27
    jr   z, label_9CE6A
    inc  b
    inc  b
    cp   $27

label_9CE6A::
    scf
    rst  $30
    ld   b, h
    dec  a
    cpl
    ld   [$FF3C], a
    push af
    ld   b, h
    dec  h
    scf
    inc  b
    rst  $30
    ld   a, [$FF00+C]
    ld   c, $EA
    ei
    ld    hl, sp+$27
    scf
    jr   nz, label_9CE85
    di
    ld   c, $0E
    ld   a, [$FFFE]
    inc  b
    inc  b
    inc  sp
    inc  a
    or   $F3
    ld   c, $0E
    ld   a, [$FF44]
    jr   nz, label_9CE96
    ld   c, $37
    ld   b, h
    db   $F4 ; Undefined instruction

label_9CE96::
    ld   c, $0E
    pop  af
    rst  $30
    or   $04
    ld   c, $33
    cpl
    inc  [hl]
    ld   c, $CA
    inc  sp
    cpl
    cpl
    cpl
    ld   c, $0E
    ld   c, $CA
    jp   z, label_E0E
    ld   c, $0E
    ld   c, $28
    daa
    jr   z, label_9CEAB
    rst  $38
    or   $04
    jr   c, label_9CEC7
    ld   c, $26
    inc  b
    inc  b
    inc  b
    rst  $30
    ld    hl, sp+$04
    jr   c, label_9CED1
    ld   c, $28
    inc  b
    inc  b

label_9CEC7::
    inc  b
    inc  b
    inc  b
    inc  b
    jr   c, label_9CEDB
    jp   z, label_404
    inc  b

label_9CED1::
    inc  b
    inc  b
    inc  b
    push af
    jr   c, label_9CEE5
    jp   z, label_404
    inc  b

label_9CEDB::
    push af
    or   $3D
    cpl
    inc  [hl]
    jp   z, label_4CA
    inc  b
    push af

label_9CEE5::
    db   $FC ; Undefined instruction
    dec  a
    inc  [hl]
    ld   c, $CA
    ld   c, $0E
    cpl
    cpl
    cpl
    cpl
    inc  [hl]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    scf
    rst  $38
    db   $FC ; Undefined instruction
    dec  h
    ld   h, $25
    ld   h, $25
    ld   h, $0E
    scf
    ld   b, h
    db   $FC ; Undefined instruction
    daa
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9CF3A
    jr   z, label_9CF40
    ld   sp, $FCFF
    ld   e, h
    daa
    jr   z, label_9CF60
    inc  b
    push af
    scf
    ei
    rst  $38
    ld   b, h
    inc  b
    ld   e, h
    dec  h
    ld   h, $04
    ei
    scf
    ld   b, h
    rst  $38
    ld    hl, sp+$5C
    ld   e, h
    daa
    jr   z, label_9CF26
    rst  $38
    inc  sp
    inc  a
    ld   b, h
    ld   e, h
    ld   e, h
    ld   e, h
    push af
    ld   sp, hl

label_9CF3A::
    ld   b, h
    rst  $38
    ld   c, $33
    inc  a
    ld   e, h

label_9CF40::
    push af
    ld   sp, hl
    ld   b, h
    rst  $38
    ld   a, [label_EFF]
    ld   c, $33
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    dec  h
    ld   h, $25
    ld   h, $FB
    rst  $38
    scf
    inc  bc
    inc  bc
    inc  bc
    daa
    jr   z, label_9CF84
    jr   z, label_9CFA3
    db   $FC ; Undefined instruction

label_9CF60::
    ld   l, $48
    ld   c, d
    ld   c, c
    or   $04
    call nc, label_FFF5
    rst  $38
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   b, h
    or   $04
    ei
    rst  $38
    rst  $38
    ld   b, h
    ld    hl, sp+$04
    push af
    rst  $38
    rst  $38
    ld   sp, hl
    ld   b, h
    rst  $38
    ld   a, [label_4F8]
    push af
    ld   b, h
    rst  $38
    rst  $38

label_9CF84::
    rst  $38
    rst  $38
    ld    hl, sp+$3D
    cpl
    cpl
    cpl
    cpl
    ld   a, [label_9C4FF]
    ld    hl, sp+$3D
    inc  [hl]
    ld   c, $0E
    ld   c, $0E
    cpl
    cpl
    cpl
    cpl
    inc  [hl]
    ld   c, $0E
    ld   c, $0E
    ld   c, $09
    jr   c, label_9CFAB

label_9CFA3::
    ld   [label_808], sp
    ld   [label_808], sp
    or   a
    cpl

label_9CFAB::
    ld   c, [hl]
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_3A08], sp
    dec  sp
    ld   [label_8CD], sp
    ld   [label_8CD], sp
    ld   [label_808], sp
    ld   [$CE08], sp
    ld   [$CE08], sp
    ld   [$B608], sp
    ld   [label_808], sp
    ld   [label_808], sp
    ld   [label_808], sp
    or   a
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    or   a
    ld   [label_808], sp
    or   a
    or   a
    or   a
    scf
    inc  bc
    jr   c, label_9D003
    ld   [label_808], sp
    ld   [label_808], sp
    scf
    inc  bc

label_9D003::
    jr   c, label_9D00D
    ld   [label_808], sp
    dec  hl
    inc  l
    inc  l
    ld   sp, label_385C
    or   [hl]
    ld   [label_808], sp
    scf
    jr   nz, label_9D01E
    inc  bc
    ld   e, h
    jr   c, label_9CFD0
    ld   [label_808], sp
    scf
    jr   nz, label_9D022
    dec  a
    cpl
    ld   c, [hl]

label_9D022::
    cpl
    cpl
    cpl
    cpl
    ld   l, $2F
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, $0E
    ld   c, $0E
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    nop
    nop
    nop
    nop
    dec  b
    ld   b, $07
    nop
    nop
    nop
    ld   a, h
    ld   a, l

label_9D04C::
    nop
    add  a, b
    ld   h, e
    ld   h, h
    ld   h, l
    add  a, c
    ld   a, h
    ld   a, l
    rst  $28
    rst  $28
    rst  $28

label_9D057::
    scf
    ld   [hl], c
    pop  bc
    ld   a, a
    jr   c, label_9D04C
    rst  $28
    push hl
    push hl
    dec  e

label_9D061::
    scf
    xor  c
    res  7, a
    jr   c, label_9D0C4
    push hl
    push hl
    push hl
    scf
    ld   l, $48
    ld   [rOBP1], a
    ld   c, [hl]
    jr   c, label_9D057

label_9D072::
    push hl
    push hl
    scf
    ld   a, $3A
    ld   [$FF3A], a
    ccf
    jr   c, label_9D061
    push hl
    dec  e
    ld   l, $2F
    ld   c, b
    ld   [rOBP1], a
    cpl
    ld   c, [hl]
    ld   e, l
    push hl
    scf
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_9D091

label_9D091::
    nop
    nop
    ld   [hl], d
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], e
    nop
    nop
    ld   a, h
    ld   a, [hl]
    ld   a, l
    ld   [hl], d
    ld   [hl], l
    sub  a, $76
    ld   [hl], e
    ld   a, h
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    ld   [hl], d
    ld   [hl], h
    pop  hl
    ld   [hl], h
    ld   [hl], e
    rst  $28
    rst  $28
    dec  e
    ld   d, b
    ld   d, b
    ld   [hl], d
    ld   [hl], h
    ld   [hl], a
    ld   [hl], h
    ld   [hl], e
    ld   d, b
    ld   d, b
    scf
    ld   d, h
    jr   nz, label_9D072
    ld   [hl], h
    ld   [hl], a
    ld   [hl], h
    or   a
    inc  bc
    inc  bc
    scf
    jr   nz, label_9D0C8
    inc  bc
    inc  bc
    inc  bc

label_9D0C8::
    add  hl, bc
    inc  bc
    inc  bc
    add  hl, bc
    ld   l, $3C
    inc  bc
    add  hl, bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   a, $2E
    cpl
    cpl
    ld   c, b
    ld   c, d
    ld   c, c
    ld   c, b
    ld   c, d
    ld   c, c
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_9D139
    ld   d, b
    inc  bc
    dec  a
    cpl
    inc  a
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_9D10E
    dec  de
    cpl
    ld   c, [hl]
    pop  hl
    ld   l, $2F
    cpl
    cpl
    ld   c, [hl]
    inc  bc
    dec  de
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    pop  hl
    ccf
    inc  bc
    inc  bc
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9D10E::
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    inc  bc
    dec  de
    inc  bc
    add  hl, bc
    inc  bc
    inc  bc
    add  hl, bc
    add  hl, bc
    inc  bc
    inc  bc
    dec  de
    dec  de
    dec  a
    ld   c, b
    ld   c, d
    ld   c, d
    ld   c, d
    ld   c, c
    inc  a
    add  hl, bc
    inc  bc
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    cpl
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    push de
    sub  a, $D7
    db   $3A ; ldd  a, [hl]
    ld   a, $3A

label_9D139::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    call label_CEE1
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    add  hl, bc
    inc  bc
    add  hl, bc
    add  a, $39
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   c, $0E
    dec  de

label_9D151::
    dec  de
    inc  bc
    inc  bc
    add  hl, bc
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    dec  de
    dec  de
    dec  de
    dec  de
    ld   c, $0E
    ld   c, $2C
    inc  l
    inc  l
    inc  l
    ld   d, h
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  l
    dec  l
    dec  hl
    inc  l
    dec  l
    dec  hl
    inc  l
    dec  l
    dec  hl
    inc  l
    sub  a, [hl]
    sub  a, [hl]
    sbc  a, l
    sbc  a, [hl]
    dec  c

label_9D185::
    inc  c
    dec  c
    sbc  a, l
    sbc  a, [hl]
    sub  a, [hl]
    sub  a, e
    sub  a, e
    sub  a, a
    sbc  a, b
    dec  c

label_9D18F::
    inc  c
    dec  c
    sub  a, a
    sbc  a, b

label_9D193::
    sub  a, e
    ld   c, $0E
    sub  a, h
    sub  a, l
    dec  c
    inc  c
    dec  c
    sub  a, h
    sub  a, l
    ld   c, $0E
    ld   c, $0E
    sbc  a, a
    dec  c
    inc  c
    dec  c
    sbc  a, a
    ld   c, $0E
    ld   c, $0E
    ld   c, $9A
    dec  c
    inc  c
    dec  c
    sbc  a, d
    ld   c, $0E
    inc  l

label_9D1B3::
    inc  l
    inc  l
    and  e
    dec  c
    inc  c
    dec  c
    and  e

label_9D1BA::
    inc  l
    inc  l
    rst  $30
    ld   a, [$F9FF]
    or   $0C
    push af
    ld   sp, hl
    rst  $38
    ld   a, [label_2625]
    ei
    rst  $38
    db   $FC ; Undefined instruction
    inc  c
    ei
    rst  $38
    db   $FC ; Undefined instruction
    dec  h
    jr   c, label_9D185
    or   e
    or   e
    or   e
    or   e
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_9D18F
    or   e
    or   e
    or   e
    or   e
    ld   b, a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_9D193
    or   c
    rst  $20
    xor  l
    or   c
    jr   c, label_9D25C
    ld   b, a
    db   $3A ; ldd  a, [hl]
    jr   c, label_9D19E
    or   d
    db   $E3 ; Undefined instruction
    xor  [hl]
    or   d
    ld   a, [$FF00+C]
    jr   c, label_9D206
    jr   c, label_9D1B3
    cp   b
    cp   c
    cp   b
    cp   c
    di
    inc  b
    ld   a, [$FF00+C]
    jr   c, label_9D1BA
    cp   c
    cp   c

label_9D206::
    cp   c
    or   [hl]

label_9D208::
    db   $F4 ; Undefined instruction
    inc  b
    di
    ld   c, $38
    or   a
    cp   c
    cp   c
    cp   c
    or   a
    jr   c, label_9D218
    db   $F4 ; Undefined instruction
    ld   c, $38
    cpl

label_9D218::
    ld   c, b
    ld   [rOBP1], a
    cpl
    ld   c, [hl]
    inc  b
    jr   c, label_9D22E
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc

label_9D22E::
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    ld   b, $06
    ld   b, [hl]
    ld   b, [hl]
    ld   b, $06
    ld   b, [hl]
    ld   b, [hl]
    ld   b, $06
    ld   b, [hl]
    ld   b, [hl]
    ld   b, $06
    ld   b, [hl]
    ld   b, [hl]
    ld   bc, $0101
    ld   bc, label_606
    ld   b, $06
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    inc  b
    inc  b
    inc  b
    inc  b

label_9D25C::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    inc  bc
    inc  bc
    nop
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
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    ld   bc, label_303
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, label_303
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   bc, $0101
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   b, $26
    ld   b, $06
    nop
    jr   nz, label_9D337

label_9D337::
    jr   nz, label_9D33C
    ld   bc, $0103

label_9D33C::
    ld   bc, $0103
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, $0000
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, label_603
    ld   b, $06
    ld   b, $01
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
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
    ld   bc, $0101
    ld   bc, $0101
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    inc  bc
    inc  hl
    ld   bc, label_321
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    ld   bc, $0100
    nop
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0001
    ld   bc, $0100
    nop
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_601
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $07
    rlca
    rlca
    rlca
    dec  b
    dec  b
    dec  b
    dec  b

label_9D508::
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
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
    inc  bc
    inc  bc
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    rlca
    rlca
    inc  bc
    inc  bc
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
    ld   bc, label_301
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $26
    ld   b, $06
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, $0103
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_2303
    inc  bc
    inc  hl
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0001
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   bc, $0103
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   b, $06
    ld   b, $06
    ld   h, $26
    ld   h, $26
    ld   b, [hl]
    ld   b, $46
    ld   b, [hl]
    ld   h, $66
    ld   h, [hl]
    ld   h, [hl]
    ld   b, $26
    ld   h, $26
    ld   h, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, $46
    ld   h, $06
    ld   h, [hl]
    ld   b, $66
    ld   b, $26
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, $06
    ld   b, $06
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    ld   b, $04
    inc  b
    ld   b, $06
    inc  b
    inc  b
    ld   b, $04
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  b
    inc  b
    dec  b
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
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
    inc  b
    nop
    nop
    nop
    nop
    inc  b
    nop
    nop
    dec  b
    nop
    inc  bc
    inc  bc
    nop
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
    nop
    nop
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
    ld   bc, label_303
    ld   bc, label_301
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
    inc  bc
    ld   bc, label_303
    ld   bc, label_303
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   bc, $0101
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    jr   nz, label_9D737

label_9D737::
    jr   nz, label_9D739

label_9D739::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, label_404
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
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
    inc  b
    ld   bc, $0005
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $06
    inc  bc
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    ld   b, $03
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b

label_9D818::
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, $23
    ld   b, $23
    inc  b
    inc  b
    nop
    ld   bc, label_404
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    inc  bc
    inc  hl
    ld   bc, label_321
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, $03
    inc  bc
    ld   b, $06
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    nop
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
    ld   b, $03
    inc  bc
    inc  bc

label_9D920::
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    ld   b, $06
    ld   b, $06
    inc  bc
    inc  bc
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
    ld   bc, $0103
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_2303
    inc  bc
    inc  hl
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    ld   b, $04
    inc  b
    ld   b, $06
    inc  b
    inc  b
    ld   b, $04
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
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
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
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
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    dec  b
    nop
    inc  bc
    inc  bc
    nop
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
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_303
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, label_303
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   bc, $0101
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    jr   nz, label_9DB37

label_9DB37::
    jr   nz, label_9DB39

label_9DB39::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, label_404
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $06
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, $0005
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $06
    inc  bc
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
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
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    inc  bc
    ld   b, $03
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    dec  b
    dec  b
    dec  b
    dec  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, $23
    ld   b, $23
    inc  b
    inc  b
    nop
    ld   bc, label_404
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    inc  bc
    inc  hl
    ld   bc, label_321
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, $03
    inc  bc
    ld   b, $06
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    nop
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
    ld   b, $03
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    ld   b, $06
    ld   b, $06
    inc  bc
    inc  bc
    inc  bc
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, $0103
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_2303
    inc  bc
    inc  hl
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
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
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    ld   b, $04
    inc  b
    ld   b, $06
    inc  b
    inc  b
    ld   b, $04
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
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
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
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
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    dec  b
    nop
    inc  bc
    inc  bc
    nop
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
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_303
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, label_303
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   bc, $0101
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    jr   nz, label_9DF57

label_9DF57::
    jr   nz, label_9DF59

label_9DF59::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, label_404
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, $0001
    nop
    nop
    nop
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
    nop
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
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, $0005
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $06
    inc  bc
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop

label_9E004::
    inc  bc
    ld   b, $03
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
    ld   b, $01
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    dec  b
    dec  b
    dec  b
    dec  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, $23
    ld   b, $23
    inc  b
    inc  b
    nop
    ld   bc, label_404
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    inc  bc
    inc  hl
    ld   bc, label_321
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, $03
    inc  bc
    ld   b, $06
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
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
    ld   b, $03
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    ld   b, $06
    ld   b, $06
    inc  bc
    inc  bc
    inc  bc
    inc  hl
    nop
    nop
    nop
    nop
    ld   b, $06
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, $0103
    nop
    nop
    nop
    nop
    ld   b, $06
    ld   b, $06
    ld   b, $26
    ld   b, $26
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
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
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_9E208::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    ld   b, $04
    inc  b
    ld   b, $06
    inc  b
    inc  b
    ld   b, $04
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
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
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
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
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    dec  b
    nop
    inc  bc
    inc  bc
    nop
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
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_303
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, label_303
    inc  bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   bc, $0101
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    jr   nz, label_9E357

label_9E357::
    jr   nz, label_9E359

label_9E359::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, label_404
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $06
    ld   b, $06
    inc  bc
    inc  hl
    dec  b
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, $0005
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   b, $06
    inc  bc
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    ld   b, $03
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    dec  b
    dec  b
    dec  b
    dec  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, $23
    ld   b, $23
    inc  b
    inc  b
    nop
    ld   bc, label_404
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    inc  bc
    inc  hl
    ld   bc, label_321
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   b, $03
    inc  bc
    ld   b, $06
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
    nop
    nop
    nop

label_9E500::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_9E508::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    nop
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
    ld   b, $03
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    ld   bc, label_701
    rlca
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    ld   b, $06
    ld   b, $06
    inc  bc
    inc  bc
    inc  bc
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, $0103
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_2303
    inc  bc
    inc  hl
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
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
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    daa
    daa
    daa
    daa
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
    ld   b, $06
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    daa
    rlca
    daa
    rlca
    rlca
    rlca
    rlca
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    inc  bc
    inc  bc
    nop
    dec  b
    inc  bc
    inc  bc
    daa
    daa
    daa
    daa
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_707
    rlca
    rlca
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    inc  bc
    inc  bc
    nop
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
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    ld   bc, label_303
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, label_303
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   bc, $0101
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   b, $26
    ld   b, $06
    nop
    jr   nz, label_9E757

label_9E757::
    jr   nz, label_9E75C
    ld   bc, $0103

label_9E75C::
    ld   bc, $0103
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, $0000
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    rlca
    rlca
    inc  b
    inc  b
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   bc, label_401
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, label_603
    ld   b, $06
    ld   b, $01
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
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
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop

label_9E804::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_9E818::
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    inc  bc
    inc  hl
    ld   bc, label_321
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    ld   bc, $0100
    nop
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0001
    ld   bc, $0100
    nop
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_301
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc

label_9E920::
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    nop
    nop

label_9E969::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $26
    ld   b, $06
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, $0103
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_2303
    inc  bc
    inc  hl
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0001
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   bc, $0103
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   b, $06
    ld   b, $06
    ld   h, $26
    ld   h, $26
    ld   b, [hl]
    ld   b, $46
    ld   b, [hl]
    ld   h, $66
    ld   h, [hl]
    ld   h, [hl]
    ld   b, $26
    ld   h, $26
    ld   h, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, $46
    ld   h, $06
    ld   h, [hl]
    ld   b, $66
    ld   b, $26
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, $06
    ld   b, $06
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    daa
    daa
    daa
    daa
    inc  b
    inc  b
    inc  b
    inc  b
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    ld   b, $06
    ld   b, $06
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    daa
    rlca
    daa
    rlca
    rlca
    rlca
    rlca
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    inc  bc
    inc  bc
    nop
    dec  b
    inc  bc
    inc  bc
    daa
    daa
    daa
    daa
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_707
    rlca
    rlca
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    inc  bc
    inc  bc
    nop
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
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    ld   bc, label_303
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, label_303
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   bc, $0101
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   b, $26
    ld   b, $06
    nop
    jr   nz, label_9EB57

label_9EB57::
    jr   nz, label_9EB5C
    ld   bc, $0103

label_9EB5C::
    ld   bc, $0103
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, $0000
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    rlca
    rlca
    inc  b
    inc  b
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    ld   bc, label_401
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, label_603
    ld   b, $06
    ld   b, $01
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
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
    ld   bc, $0101
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
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
    ld   bc, $0101
    ld   bc, $0101
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    inc  bc
    inc  hl
    ld   bc, label_321
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    ld   bc, $0100
    nop
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0001
    ld   bc, $0100
    nop
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    rlca
    rlca
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $26
    ld   b, $06
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, $0103
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_2303
    inc  bc
    inc  hl
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0001
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   bc, $0103
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   b, $06
    ld   b, $06
    ld   h, $26
    ld   h, $26
    ld   b, [hl]
    ld   b, $46
    ld   b, [hl]
    ld   h, $66
    ld   h, [hl]
    ld   h, [hl]
    ld   b, $26
    ld   h, $26
    ld   h, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, $46
    ld   h, $06
    ld   h, [hl]
    ld   b, $66
    ld   b, $26
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, $06
    ld   b, $06
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    inc  bc
    inc  bc
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

label_9EE58::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    inc  bc
    inc  bc

label_9EE6E::
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, label_707
    rlca
    rlca
    inc  b
    inc  b
    inc  b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_707
    rlca
    rlca
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    rlca
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec  b
    nop
    inc  bc
    inc  bc
    nop
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
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_303
    ld   bc, label_301
    inc  bc
    ld   bc, label_303
    ld   bc, label_303
    ld   bc, label_301
    inc  bc

label_9EF00::
    nop
    nop
    nop
    nop
    inc  bc
    ld   bc, $0101

label_9EF08::
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, label_303
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, label_301
    ld   bc, $0101
    ld   bc, label_303
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   b, $26
    ld   b, $06
    nop
    jr   nz, label_9EF57

label_9EF57::
    jr   nz, label_9EF5C
    ld   bc, $0103

label_9EF5C::
    ld   bc, $0103
    inc  bc
    ld   bc, label_301
    inc  bc
    ld   bc, label_301
    inc  bc
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0101
    ld   bc, $0103
    ld   bc, $0000
    ld   bc, $0101
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    rlca
    rlca
    inc  b
    inc  b
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    nop
    nop
    nop
    nop
    inc  b
    inc  b
    ld   bc, label_603
    ld   b, $06
    ld   b, $01
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
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
    ld   bc, $0101
    ld   bc, $0101
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    inc  b
    inc  b
    inc  b
    inc  b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0000
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ldi  [hl], a
    inc  bc
    inc  hl
    ld   bc, label_321
    inc  hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    nop
    ld   bc, $0100
    nop
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0001
    ld   bc, $0100
    nop
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_701
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    rlca
    rlca
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    nop
    nop
    rlca
    rlca
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    rlca
    rlca
    rlca
    rlca
    inc  bc
    inc  bc
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
    ld   bc, label_301
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    ld   bc, $0001
    nop
    nop
    nop
    ld   b, $26
    ld   b, $06
    ld   bc, $0103
    inc  bc
    inc  bc
    ld   bc, $0103
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_2303
    inc  bc
    inc  hl
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   bc, $0001
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    ld   bc, $0103
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    ld   bc, $0103
    inc  bc
    nop
    inc  bc
    nop
    inc  bc
    ld   bc, $0103
    inc  bc
    ld   b, $06
    ld   b, $06
    ld   h, $26
    ld   h, $26
    ld   b, [hl]
    ld   b, $46
    ld   b, [hl]
    ld   h, $66
    ld   h, [hl]
    ld   h, [hl]
    ld   b, $26
    ld   h, $26
    ld   h, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, $46
    ld   h, $06
    ld   h, [hl]
    ld   b, $66
    ld   b, $26
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, [hl]
    ld   h, [hl]
    ld   b, $06
    ld   b, $06

label_9F240::
    push bc
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C000
    add  hl, de
    ld   d, h
    ld   e, l
    pop  hl
    ld   a, c
    srl  a
    srl  a
    ld   c, a

label_9F255::
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [$FFEE]
    add  a, [hl]
    ld   [de], a
    inc  de
    inc  hl
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, label_9F255
    pop  bc
    ld   a, [$C3C0]
    add  a, c
    cp   $A0
    jr   c, label_9F274
    xor  a

label_9F274::
    ld   [$C3C0], a
    ld   a, [$C123]
    ld   c, a
    ret

label_9F27C::
    nop
    ld   [label_20F], sp
    nop
    db   $10
    db   $1F
    ld   [bc], a
    nop
    jr   label_9F2B6
    ld   [bc], a
    ld   [label_9D000], sp
    inc  bc
    ld   [label_9D208], sp
    inc  bc
    ld   [label_9D818], sp
    inc  bc
    ld   [label_9D920], sp
    nop
    stop
    ld   d, c
    inc  bc
    db   $10
    db   $08
    ld   d, e
    nop
    db   $10
    db   $10
    ld   d, l
    nop

label_9F2A4::
    nop
    ld   [label_20F], sp
    nop
    db   $10
    db   $1F
    ld   [bc], a
    nop
    jr   label_9F2DE
    ld   [bc], a
    ld   [label_9D000], sp
    inc  bc
    ld   [label_9D208], sp
    inc  bc
    ld   [label_9E818], sp
    inc  bc
    ld   [label_9E920], sp
    nop
    stop
    ld   h, c
    inc  bc
    db   $10
    db   $08
    ld   h, e
    nop
    db   $10
    db   $10
    ld   h, l
    nop
    nop
    ld   [$010E], sp
    nop
    db   $10
    db   $1E
    ld   bc, $0008
    ld   h, b
    ld   [bc], a
    ld   [label_9E208], sp
    ld   bc, label_1008

label_9F2DE::
    ld   d, h
    ld   bc, label_1808
    ld   h, h
    ld   bc, $CC21
    ld   [hl], d
    ld   c, $18
    call label_9F240
    ld   hl, label_9F27C
    ld   a, [$FFE7]
    and  $10
    jr   z, label_9F2F8
    ld   hl, label_9F2A4

label_9F2F8::
    ld   c, $28
    call label_9F240
    ret

label_9F2FE::
    nop
    nop

label_9F300::
    ld   e, d
    inc  bc

label_9F302::
    nop
    nop
    ld   l, d
    inc  bc
    ld   de, $C200
    add  hl, bc
    ld   a, [hl]
    cp   $28
    ld   hl, label_9F2FE
    jr   z, label_9F315
    ld   hl, label_9F302

label_9F315::
    ld   c, $04
    call label_9F240
    ret

label_9F31B::
    nop
    nop
    ld   d, h
    inc  b
    nop
    ld   [label_464], sp
    ld   [label_9D500], sp
    inc  b
    ld   [label_9E508], sp
    inc  b

label_9F32B::
    nop
    nop
    ld   h, h
    inc  h
    nop
    ld   [label_2454], sp
    ld   [label_9E500], sp
    inc  h
    ld   [label_9D508], sp
    inc  h

label_9F33B::
    nop
    nop
    ld   l, [hl]
    inc  b
    nop
    ld   [label_47E], sp
    ld   [label_9EF00], sp
    inc  b
    ld   [label_9FF08], sp
    inc  b
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    cp   $18
    ld   hl, label_9F33B
    jr   z, label_9F361
    ld   hl, label_9F31B
    cp   $68
    jr   z, label_9F361
    ld   hl, label_9F32B

label_9F361::
    ld   c, $10
    call label_9F240
    ret

label_9F367::
    nop
    nop
    ld   [hl], d
    nop
    nop
    ld   [label_2072], sp
    ld   [label_9F300], sp
    nop
    ld   [label_9F308], sp
    jr   nz, label_9F378

label_9F378::
    nop
    ld   [hl], h
    nop
    nop
    ld   [label_2074], sp
    ld   [label_9F500], sp
    nop
    ld   [label_9F508], sp
    jr   nz, label_9F388

label_9F388::
    nop
    db   $76 ; Halt
    nop
    nop
    ld   [label_2076], sp
    ld   [label_9F700], sp
    nop
    ld   [label_9F708], sp
    jr   nz, label_9F398

label_9F398::
    nop
    ld   a, b
    nop
    nop
    ld   [label_2078], sp
    ld   [label_9F900], sp
    nop
    ld   [label_9F908], sp
    jr   nz, label_9F3A8

label_9F3A8::
    nop
    ld   a, d
    nop
    nop
    ld   [label_207A], sp
    ld   [label_9FB00], sp
    nop
    ld   [label_9FB08], sp
    jr   nz, label_9F3B8

label_9F3B8::
    nop
    ld   a, h
    nop
    nop
    ld   [label_207C], sp
    ld   [label_9FD00], sp
    nop
    ld   [label_9FD08], sp
    jr   nz, label_9F3E9
    or   b
    jp   label_9FE09
    sla  a
    sla  a
    sla  a
    sla  a
    ld   d, $00
    ld   e, a
    ld   hl, label_9F367
    add  hl, de
    ld   c, $10
    call label_9F240
    ret
    nop
    db   $10
    db   $03
    ld   bc, label_1800
    inc  b
    ld   bc, label_1818
    inc  c
    dec  b
    db   $10
    db   $20
    dec  bc
    rlca
    db   $10
    db   $18
    ld   a, [bc]
    rlca
    db   $10
    db   $08

label_9F3F7::
    add  hl, bc
    ld   b, $08
    inc  h
    ld   [label_801], sp
    inc  e
    rlca
    ld   bc, label_1008
    ld   b, $06
    ld   [label_508], sp
    ld   b, $00
    db   $10
    db   $02
    ld   b, $00
    ld   [label_601], sp
    nop
    nop
    nop
    ld   b, $20
    ld   d, b
    rrca
    inc  bc
    jr   label_9F46B
    ld   c, $03
    jr   label_9F3F7
    dec  c
    inc  bc
    db   $10
    db   $D8
    dec  l
    inc  bc
    nop
    rst  $38
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
    jr   label_9F44B
    dec  e
    ld   bc, label_1018
    inc  e
    dec  b
    jr   label_9F443
    dec  de
    dec  b
    db   $10
    db   $1D
    ld   a, [de]
    ld   bc, label_1510

label_9F443::
    add  hl, de
    ld   bc, label_2408
    jr   label_9F44A
    ld   [label_171C], sp
    ld   bc, label_1008
    ld   d, $06
    nop
    jr   label_9F469
    ld   [bc], a
    nop
    db   $10
    db   $14
    ld   b, $04
    ld   [label_613], sp
    ld    hl, sp+$10
    ld   [de], a
    ld   b, $FC
    ld   [label_611], sp
    ld    hl, sp+$00
    db   $10
    db   $06

label_9F469::
    jr   nz, label_9F4BB

label_9F46B::
    rrca
    inc  bc
    jr   label_9F4BF
    ld   c, $03
    jr   label_9F44B
    dec  c
    inc  bc
    db   $10
    db   $D8
    dec  l
    inc  bc
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    stop
    inc  l
    inc  bc
    ld   [label_2B00], sp
    inc  bc
    jr   label_9F4A3
    ld   a, [hli]
    ld   b, $10
    inc  e
    add  hl, hl
    ld   bc, label_1410
    jr   z, label_9F496
    ld   [label_1824], sp
    ld   bc, label_1C08
    daa
    ld   bc, label_1008
    ld   h, $06
    nop
    jr   label_9F4C9
    ld   [bc], a
    nop
    db   $10
    db   $24
    ld   b, $00
    nop
    inc  hl
    ld   b, $F8
    jr   label_9F4D2
    ld   [bc], a
    ld    hl, sp+$10
    ld   hl, $FC02
    ld   [label_620], sp
    ld   a, [$FF10]

label_9F4BB::
    rra
    ld   b, $F4
    ld   [label_61E], sp
    jr   nz, label_9F513
    rrca
    inc  bc
    jr   label_9F517
    ld   c, $03

label_9F4C9::
    jr   label_9F4A3
    dec  c
    inc  bc
    db   $10
    db   $D8
    dec  l
    inc  bc

label_9F4D1::
    pop  hl

label_9F4D2::
    ld   [hl], e
    pop  hl
    ld   [hl], e
    pop  hl
    ld   [hl], e
    pop  hl
    ld   [hl], e
    pop  hl
    ld   [hl], e
    pop  hl
    ld   [hl], e
    pop  hl
    ld   [hl], e
    ld   sp, $8174
    ld   [hl], h
    ld   b, $00
    ld   c, $0B
    ld   a, [$D000]
    ld   d, a
    ld   hl, $C210
    add  hl, bc

label_9F4EF::
    ld   a, [hl]
    sub  a, d
    ld   [$FFEC], a
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_9F4D1
    add  hl, de
    ld   a, [hli]

label_9F500::
    ld   d, a
    ld   h, [hl]
    ld   l, d
    ld   c, $50
    ld   a, [$D00E]

label_9F508::
    cp   $03
    jr   c, label_9F50E
    ld   c, $4F

label_9F50E::
    call label_9F240
    ld   b, $00

label_9F513::
    ld   c, $0B
    ret
    ld   [label_A20], sp
    inc  bc
    ld   [label_818], sp
    inc  bc
    ld   [label_610], sp
    inc  bc
    db   $10
    db   $18
    ld   [bc], a
    ld   [bc], a
    jr   nc, label_9F540
    ld   l, $05
    jr   nc, label_9F53C
    inc  l
    dec  b
    ld   [label_420], sp
    ld   [bc], a
    jr   label_9F54C
    cp   h

label_9F535::
    inc  b
    nop
    jr   label_9F4EF
    ld   [bc], a
    jr   z, label_9F554

label_9F53C::
    ld   e, $04
    ld   hl, label_E10
    inc  b
    jr   nz, label_9F54C
    inc  c
    dec  b
    jr   nc, label_9F550
    sbc  a, d
    dec  b
    jr   label_9F564

label_9F54C::
    cp   d
    ld   bc, label_2010

label_9F550::
    add  a, [hl]
    ld   bc, label_2000

label_9F554::
    cp   b
    ld   bc, label_1800
    nop
    ld   bc, label_1000
    or   h
    ld   [bc], a
    nop
    ld   [label_2B2], sp
    jr   z, label_9F57C

label_9F564::
    inc  e
    ld   bc, label_2030
    xor  d
    dec  b
    jr   z, label_9F57C
    adc  a, [hl]
    ld   bc, label_1018
    adc  a, h
    ld   bc, label_2020
    sub  a, h
    ld   bc, $0030
    sbc  a, b
    inc  b
    jr   nz, label_9F584

label_9F57C::
    adc  a, d
    ld   bc, $0020
    adc  a, b
    dec  b
    ld   [label_1A20], sp
    inc  bc
    ld   [label_1818], sp
    inc  bc
    ld   [label_1610], sp
    inc  bc
    nop
    jr   nz, label_9F535
    ld   [bc], a
    db   $10
    db   $18
    ld   [de], a
    ld   [bc], a
    jr   nc, label_9F5B0
    ld   l, $05
    jr   nc, label_9F5AC
    inc  l
    dec  b
    ld   [label_1420], sp
    ld   [bc], a
    jr   label_9F5BC
    call z, label_2804
    jr   label_9F5C7
    inc  b
    ld   hl, label_E10
    inc  b
    jr   nz, label_9F5B8

label_9F5B0::
    inc  c
    dec  b
    nop
    jr   label_9F57B
    ld   [bc], a
    jr   label_9F5D0

label_9F5B8::
    jp   z, label_1001
    jr   nz, label_9F553
    ld   bc, label_2000
    ret  z
    ld   bc, label_1000
    call nz, label_2

label_9F5C7::
    ld   [label_2C2], sp
    jr   z, label_9F5E4
    inc  e
    ld   bc, label_2030

label_9F5D0::
    xor  d
    dec  b
    jr   z, label_9F5E4
    adc  a, [hl]
    ld   bc, label_1018
    adc  a, h
    ld   bc, label_2020
    sub  a, h
    ld   bc, label_830
    sbc  a, d
    dec  b
    jr   nc, label_9F5E4

label_9F5E4::
    sbc  a, b
    inc  b
    jr   nz, label_9F5F0
    adc  a, d
    ld   bc, $0020
    adc  a, b
    dec  b
    ld   [label_2A20], sp
    inc  bc
    ld   [label_2818], sp
    inc  bc
    ld   [label_2610], sp
    inc  bc
    nop
    jr   nz, label_9F5A5
    ld   [bc], a
    db   $10
    db   $18
    ldi  [hl], a
    ld   [bc], a
    jr   nc, label_9F61C
    ld   l, $05
    jr   nc, label_9F618
    inc  l
    dec  b
    ld   [label_2420], sp
    ld   [bc], a
    jr   label_9F628
    call c, label_2804
    jr   label_9F633
    inc  b
    ld   hl, label_E10
    inc  b
    jr   nz, label_9F624

label_9F61C::
    inc  c
    dec  b
    nop
    jr   label_9F5F7
    ld   [bc], a
    jr   label_9F63C

label_9F624::
    jp  c, label_1001
    jr   nz, label_9F5CF
    ld   bc, label_2000
    ret  c
    ld   bc, label_1000
    call nc, label_2

label_9F633::
    ld   [label_2D2], sp
    jr   z, label_9F650
    inc  e
    ld   bc, label_2030

label_9F63C::
    xor  d
    dec  b
    jr   z, label_9F650
    adc  a, [hl]
    ld   bc, label_1018
    adc  a, h
    ld   bc, label_2020
    sub  a, h
    ld   bc, label_830
    sbc  a, d
    dec  b
    jr   nc, label_9F650

label_9F650::
    sbc  a, b
    inc  b
    jr   nz, label_9F65C
    adc  a, d
    ld   bc, $0020
    adc  a, b
    dec  b

label_9F65A::
    ld   d, $75

label_9F65C::
    add  a, d
    ld   [hl], l
    xor  $75
    ld   a, [$D000]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_9F65A
    add  hl, de
    ld   a, [hli]
    ld   d, a
    ld   h, [hl]
    ld   l, d
    ld   c, $6C
    call label_9F240
    ret

label_9F676::
    db   $10
    db   $25
    ld   [de], a
    inc  b
    jr   nc, label_9F697
    ld   a, [de]
    inc  b
    dec  sp
    jr   nc, label_9F69D
    ld   [bc], a
    ld   b, b
    inc  bc
    jr   nc, label_9F688
    ld   b, b
    ld   b, b

label_9F688::
    ld   b, b
    ld   [bc], a
    ld   b, b
    jr   c, label_9F6CB
    ld   [bc], a
    ld   b, b
    jr   nc, label_9F6CD
    inc  bc
    ld   b, b
    jr   z, label_9F6CF
    inc  bc
    ld   b, b

label_9F697::
    jr   nz, label_9F6D1
    inc  bc
    ld   b, b
    jr   label_9F6D3

label_9F69D::
    inc  bc
    ld   b, b
    db   $10
    db   $34
    inc  bc
    ld   b, b
    ld   [label_332], sp
    jr   nc, label_9F6A8

label_9F6A8::
    ld   d, b
    ld   [bc], a
    jr   nc, label_9F6E4
    ld   l, $02
    jr   nc, label_9F6E0
    inc  l
    inc  bc
    jr   nc, label_9F6DC
    ld   a, [hli]
    inc  bc
    jr   nc, label_9F6D8
    jr   z, label_9F6BF
    jr   nc, label_9F6D4
    ld   h, $00
    jr   nc, label_9F6D0
    inc  h
    nop
    jr   nc, label_9F6CC
    ldi  [hl], a
    dec  b
    jr   nz, label_9F6F0
    jr   nz, label_9F6D1
    jr   nz, label_9F6EC

label_9F6CC::
    ld   e, $01
    jr   nz, label_9F6D8

label_9F6D0::
    jr   label_9F6D3
    db   $10
    db   $28

label_9F6D4::
    ld   d, $07
    db   $10
    db   $20

label_9F6D8::
    inc  d
    ld   bc, label_1010

label_9F6DC::
    db   $10
    db   $01
    db   $10
    db   $08

label_9F6E0::
    ld   c, $01
    stop

label_9F6E4::
    inc  c
    ld   bc, label_2800
    ld   a, [bc]
    ld   b, $00
    jr   nz, label_9F6F5
    ld   bc, label_1800

label_9F6F0::
    ld   b, $01
    nop
    db   $10
    db   $04

label_9F6F5::
    ld   bc, label_800
    ld   [bc], a
    ld   bc, $0000
    nop
    ld   bc, label_1C20

label_9F700::
    ld   c, h
    inc  b
    jr   nz, label_9F718
    ld   c, d
    inc  b
    jr   nz, label_9F714

label_9F708::
    ld   c, b
    inc  b
    db   $10
    db   $1C
    ld   b, [hl]
    inc  b
    db   $10
    db   $14
    ld   b, h
    inc  b
    db   $10
    db   $0C

label_9F714::
    ld   b, d
    inc  b
    jr   nz, label_9F734

label_9F718::
    ld   e, h
    inc  b
    jr   nz, label_9F730
    ld   e, d
    inc  b
    jr   nz, label_9F72C
    ld   e, b
    inc  b
    db   $10
    db   $1C
    ld   d, [hl]
    inc  b
    db   $10
    db   $14
    ld   d, h
    inc  b
    db   $10
    db   $0C

label_9F72C::
    ld   d, d
    inc  b
    jr   nz, label_9F74C

label_9F730::
    ld   l, h
    inc  b
    jr   nz, label_9F748

label_9F734::
    ld   l, d
    inc  b
    jr   nz, label_9F744
    ld   l, b
    inc  b
    db   $10
    db   $1C
    ld   h, [hl]
    inc  b
    db   $10
    db   $14
    ld   h, h
    inc  b
    db   $10
    db   $0C

label_9F744::
    ld   h, d
    inc  b

label_9F746::
    cp   $76

label_9F748::
    ld   d, $77
    ld   l, $77

label_9F74C::
    xor  a
    ld   [$C3C0], a
    ld   a, [$D003]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_9F746
    add  hl, de
    ld   a, [hli]
    ld   d, a
    ld   h, [hl]
    ld   l, d
    ld   c, $18
    call label_9F240
    ld   hl, label_9F676
    ld   c, $88
    call label_9F240
    ret

label_9F76E::
    ld   [label_9E804], sp
    ld   bc, label_400
    ld   h, a
    ld   bc, label_1012
    ld   l, h
    inc  b
    ld   [de], a
    ld   [label_46B], sp
    ld   [de], a
    nop
    ld   l, d
    inc  b
    ld   [de], a
    ld    hl, sp+$69
    inc  b
    ld   a, [label_9E004]
    ld   [bc], a
    ld   [bc], a
    ld   [label_462], sp
    ld   [bc], a
    nop
    ld   h, c
    inc  b
    ld   a, [bc]
    db   $10
    db   $66
    inc  bc
    ld   a, [bc]
    ld   [label_365], sp
    ld   a, [bc]
    nop
    ld   h, h
    inc  bc
    ld   a, [bc]
    ld    hl, sp+$63
    inc  bc
    ld   [de], a
    db   $10
    db   $70
    inc  b
    ld   [de], a
    ld   [label_46F], sp
    ld   [de], a
    nop
    ld   l, [hl]
    inc  b
    ld   [de], a
    ld    hl, sp+$6D
    inc  b
    ld   a, [label_9E004]
    ld   [bc], a
    ld   [bc], a
    ld   [label_462], sp
    ld   [bc], a
    nop
    ld   h, c
    inc  b
    ld   a, [bc]
    db   $10
    db   $66
    inc  bc
    ld   a, [bc]
    ld   [label_365], sp
    ld   a, [bc]
    nop
    ld   h, h
    inc  bc
    ld   a, [bc]
    ld    hl, sp+$63
    inc  bc
    ld   [de], a
    db   $10
    db   $74
    inc  b
    ld   [de], a
    ld   [label_473], sp
    ld   [de], a
    nop
    ld   [hl], d
    inc  b
    ld   [de], a
    ld    hl, sp+$71
    inc  b
    ld   a, [label_9E004]
    ld   [bc], a
    ld   [bc], a
    ld   [label_462], sp
    ld   [bc], a
    nop
    ld   h, c
    inc  b
    ld   a, [bc]
    db   $10
    db   $66
    inc  bc
    ld   a, [bc]
    ld   [label_365], sp
    ld   a, [bc]
    nop
    ld   h, h
    inc  bc
    ld   a, [bc]
    ld    hl, sp+$63
    inc  bc
    ld   [de], a
    db   $10
    db   $78
    inc  b
    ld   [de], a
    ld   [label_477], sp
    ld   [de], a
    nop
    db   $76 ; Halt
    inc  b
    ld   [de], a
    ld    hl, sp+$75
    inc  b
    ld   a, [label_9E004]
    ld   [bc], a
    ld   [bc], a
    ld   [label_462], sp
    ld   [bc], a
    nop
    ld   h, c
    inc  b
    ld   a, [bc]
    db   $10
    db   $66
    inc  bc
    ld   a, [bc]
    ld   [label_365], sp
    ld   a, [bc]
    nop
    ld   h, h
    inc  bc
    ld   a, [bc]
    ld    hl, sp+$63
    inc  bc

label_9F826::
    db   $76 ; Halt
    ld   [hl], a
    and  d
    ld   [hl], a
    adc  a, $77
    ld   a, [label_3E77]
    ld   l, h
    ld   [$C3C0], a
    ld   a, [$FFE7]
    and  $18
    sra  a
    sra  a
    ld   e, a
    ld   d, $00
    ld   hl, label_9F826
    add  hl, de
    ld   a, [hli]
    ld   d, a
    ld   h, [hl]
    ld   l, d
    ld   c, $2C
    call label_9F240
    ld   hl, label_9F76E
    ld   c, $08
    call label_9F240
    ret
    ld   a, [$D015]
    rst  0
    ld   h, b
    ld   a, b
    add  a, h
    ld   a, b
    sbc  a, [hl]
    ld   a, b
    ld   b, h
    ld   a, c
    ld   hl, $D6FD
    set  2, [hl]
    ld   hl, $C200
    add  hl, bc
    ld   a, $50
    ld   [hl], a
    ld   hl, $C210
    add  hl, bc
    ld   a, $50
    ld   [hl], a
    ld   a, $FF
    ld   [$D01A], a
    call label_9FE55
    call label_9FF87
    call label_9FBB6
    jp   label_9FBAB
    ld   a, [$D01A]
    inc  a
    cp   $06
    jp   nz, label_9F895
    ld   a, $2F
    ld   [$D368], a
    jp   label_9FBAB

label_9F895::
    ld   [$D01A], a
    ld   a, $22
    ld   [$D6FE], a
    ret
    ld   hl, $D01D
    ld   a, [$D01C]
    ld   d, a
    or   [hl]
    jr   z, label_9F8DB
    ld   a, d
    dec  a
    ld   [$D01C], a
    jr   nz, label_9F8CD
    ld   a, [hl]
    and  a
    jr   z, label_9F8BB
    dec  [hl]
    ld   a, $FF
    ld   [$D01C], a
    jr   label_9F8CD

label_9F8BB::
    ld   hl, $D016
    inc  [hl]
    ld   a, $01
    ld   [$D017], a
    ld   a, $1C
    ld   [$FFF2], a
    ld   a, $60
    ld   [$D021], a

label_9F8CD::
    ld   a, [$D017]
    inc  a
    and  $01
    ld   [$D017], a
    ret  z
    call label_9F9E6
    ret

label_9F8DB::
    call label_9F925
    ld   a, [$D017]
    inc  a
    and  $01
    ld   [$D017], a
    jr   nz, label_9F8F1
    call label_9FACB
    call label_9FB8F
    jr   label_9F90C

label_9F8F1::
    call label_9F9E6
    ld   hl, $D016
    inc  [hl]
    ld   a, [hl]
    cp   $40
    jr   nz, label_9F908
    ld   a, $01
    ld   [$D01D], a
    ld   a, $2C
    ld   [$D01C], a
    ret

label_9F908::
    cp   $C0
    jr   z, label_9F910

label_9F90C::
    call label_9FBB0
    ret

label_9F910::
    ld   a, $07
    ld   [$FFA9], a
    swap a
    ld   [$FFAA], a
    ld   a, $32
    ld   [$D466], a
    ld   a, $90
    ld   [$D020], a
    jp   label_9FBAB

label_9F925::
    ld   hl, $D021
    ld   a, [hl]
    and  a
    ret  z
    dec  [hl]
    ret  nz
    ld   a, [$FFA9]
    dec  a
    ld   [$FFA9], a
    ld   a, [$FFAA]
    sub  a, $10
    ld   [$FFAA], a
    jr   nz, label_9F940
    ld   a, $FF
    ld   [$D368], a
    ret

label_9F940::
    ld   a, $14
    ld   [hl], a
    ret
    call label_9F9F2
    call label_9FACB
    call label_9FB8F
    ret

label_9F94E::
    jr   nz, label_9F949
    ld   a, $06
    jr   label_9F95C

label_9F954::
    inc  a
    ld   [bc], a
    jr   label_9F958

label_9F958::
    db   $3A ; ldd  a, [hl]
    ld   [bc], a
    jr   label_9F954

label_9F95C::
    jr   c, label_9F960
    ld   [label_3617], sp
    inc  bc
    ld   [label_340F], sp
    inc  bc
    ld   [label_9CA00], sp
    ld   bc, $F808
    ld   c, b
    ld   bc, label_16F8
    ldd  [hl], a
    inc  b
    ld    hl, sp+$0E
    jr   nc, label_9F97A
    ld    hl, sp+$00
    ld   b, [hl]
    ld   bc, $F8F8
    ld   b, h
    ld   bc, label_1E8
    ld   b, d
    ld   bc, $F9E8
    ld   b, b
    ld   bc, label_1818
    ld   l, $03
    jr   label_9F99C

label_9F98C::
    inc  l
    inc  bc
    jr   label_9F998

label_9F990::
    ld   a, [hli]
    inc  bc
    jr   label_9F994

label_9F994::
    jr   z, label_9F999
    jr   label_9F990

label_9F998::
    ld   h, $03
    jr   label_9F98C

label_9F99C::
    inc  h
    inc  bc
    ld   [label_2218], sp
    nop
    ld   [label_2010], sp
    nop
    ld   [label_1E08], sp
    nop
    ld   [label_1C00], sp
    nop
    ld   [label_1AF8], sp
    nop
    ld   [label_18F0], sp
    nop
    ld    hl, sp+$16
    ld   d, $00
    ld    hl, sp+$0E
    inc  d
    nop
    ld    hl, sp+$06
    ld   [de], a
    nop
    ld    hl, sp+$FE
    stop
    ld    hl, sp+$F6
    ld   c, $00
    ld    hl, sp+$EE
    inc  c
    nop
    db   $E8 ; add  sp, d
    ld   d, $0A
    inc  b
    db   $E8 ; add  sp, d
    ld   c, $08
    dec  b
    db   $E8 ; add  sp, d
    ld   b, $06
    nop
    db   $E8 ; add  sp, d
    cp   $04
    nop
    db   $E8 ; add  sp, d
    or   $02
    nop
    db   $E8 ; add  sp, d
    xor  $00
    nop

label_9F9E6::
    xor  a
    ld   [$C3C0], a
    ld   hl, label_9F94E
    ld   c, $26
    jp   label_3CE0

label_9F9F2::
    ld   a, [$D466]
    and  a
    jr   nz, label_9FA06
    ld   a, $21
    ld   [$FFF2], a
    call label_280D
    and  $7F
    add  a, $30
    ld   [$D466], a

label_9FA06::
    dec  a
    ld   [$D466], a
    ret

label_9FA0B::
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
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    dec  b
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, label_202
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    dec  b
    dec  b
    dec  b
    dec  b

label_9FACB::
    ld   a, [$D016]
    cp   $C0
    jr   nc, label_9FADE
    ld   e, a
    ld   d, $00
    ld   hl, label_9FA0B
    add  hl, de
    ld   a, [hl]
    ld   [$D01B], a
    ret

label_9FADE::
    ld   hl, $D020
    ld   a, [hl]
    and  a
    jr   z, label_9FAE8
    dec  [hl]
    jr   label_9FB07

label_9FAE8::
    ld   hl, $C3D0
    add  hl, bc
    ld   a, [hl]
    inc  a
    ld   [hl], a
    and  $1F
    jr   nz, label_9FAFD
    ld   hl, $C250
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, label_9FAFD
    inc  [hl]

label_9FAFD::
    call label_9FB18

label_9FB00::
    ld   a, [$FFEE]
    cp   $B0
    jp   nc, label_9FB51

label_9FB07::
    ld   a, [$FFE7]
    and  $07
    ret  nz
    ld   hl, $D01B
    inc  [hl]
    ld   a, [hl]
    cp   $06
    jr   nz, label_9FB16
    xor  a

label_9FB16::
    ld   [hl], a
    ret

label_9FB18::
    call label_9FB25
    push bc
    ld   a, c
    add  a, $10
    ld   c, a
    call label_9FB25
    pop  bc
    ret

label_9FB25::
    ld   hl, $C240
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_9FB50
    push af
    swap a
    and  $F0
    ld   hl, $C260
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $C200
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_9FB47
    ld   e, $F0

label_9FB47::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a

label_9FB50::
    ret

label_9FB51::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    xor  a
    ld   [$D01F], a
    ld   hl, $D00E
    inc  [hl]
    ret

label_9FB5F::
    nop
    nop
    ld   [hl], d
    rlca
    nop
    ld   [label_2772], sp
    nop
    nop
    ld   [hl], h
    rlca
    nop
    ld   [label_2774], sp
    nop
    nop
    db   $76 ; Halt
    rlca
    nop
    ld   [label_2776], sp
    nop
    nop
    ld   a, b
    rlca
    nop
    ld   [label_2778], sp
    nop
    nop
    ld   a, d
    rlca
    nop
    ld   [label_277A], sp
    nop
    nop
    ld   a, h
    rlca
    nop
    ld   [label_277C], sp

label_9FB8F::
    xor  a
    ld   [$C3C0], a
    ld   a, [$D01B]
    cp   $FF
    ret  z
    sla  a
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_9FB5F
    add  hl, de
    ld   c, $02
    jp   label_3CE0

label_9FBAB::
    ld   hl, $D015
    inc  [hl]
    ret

label_9FBB0::
    call label_9FE5A
    call label_9FF8C

label_9FBB6::
    xor  a
    ld   [$DDD3], a
    ld   a, $20
    ld   [$DDD4], a
    ld   a, $82
    ld   [$DDD1], a
    ret

label_9FBC5::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
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
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
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
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, $0001
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_9FC85::
    rst  $38
    ld   a, a
    ld   h, $7D
    ld   h, $7D
    ld   h, $7D
    rst  $38
    ld   a, a
    ld   h, $7D
    ld   h, $7D
    ld   h, $7D
    rst  $38
    ld   a, a
    ld   h, $7D
    ld   h, $7D
    ld   h, $7D
    rst  $38
    ld   a, a
    ld   h, $7D
    ld   h, $7D
    ld   h, $7D
    rst  $38
    ld   a, a
    ld   h, $7D
    ld   h, $7D
    ld   h, $7D
    rst  $38
    ld   a, a
    ld   h, $7D
    ld   h, $7D
    ld   h, $7D
    rst  $38
    ld   a, a
    ld   h, $7D
    ld   h, $7D
    ld   h, $7D
    rst  $38
    ld   a, a
    push hl
    ld   l, b
    ld   c, d
    ld   l, l
    add  hl, bc
    ld   l, l
    rst  $38
    ld   a, a
    push hl
    ld   l, b
    rlca
    ld   l, c
    adc  a, d
    ld   [hl], l
    rst  $38
    ld   a, a
    add  hl, bc
    ld   l, l
    ld   c, d
    ld   l, l
    adc  a, d
    ld   [hl], l
    rst  $38
    ld   a, a
    push hl
    ld   l, b
    ld   b, a
    ld   a, l
    ld   l, b
    ld   a, l
    rst  $38
    ld   a, a
    push hl
    ld   l, b
    ld   [$8A70], a
    ld   [hl], l
    rst  $38
    ld   a, a
    push hl
    ld   l, b
    ld   c, d
    ld   l, l
    ld   [rSVBK], a
    ld   a, a
    db   $E8 ; add  sp, d
    ld   l, b
    ld   [$8A70], a
    ld   [hl], l
    rst  $38
    ld   a, a
    call nz, label_9EE58
    ld   h, c
    dec  bc
    ld   e, l
    rst  $38
    ld   a, a
    call nz, label_E858
    ld   e, b
    adc  a, $6D
    rst  $38
    ld   a, a
    dec  bc

label_9FD08::
    ld   e, l
    ld   l, [hl]
    ld   h, c
    adc  a, $6D
    rst  $38
    ld   a, a
    call nz, label_9C758
    ld   a, l
    xor  d
    ld   a, l
    rst  $38
    ld   a, a
    call nz, label_CE58
    ld   l, b
    adc  a, $6D
    rst  $38
    ld   a, a
    call nz, label_9EE58
    ld   h, c
    adc  a, $68
    rst  $38
    ld   a, a
    jp   z, label_CE58
    ld   l, b
    adc  a, $6D
    rst  $38
    ld   a, a
    and  e
    ld   b, h
    ld   [hl], c
    ld   d, l
    dec  c

label_9FD34::
    ld   d, c
    rst  $38
    ld   a, a
    and  e
    ld   b, h
    ret

label_9FD3A::
    ld   c, b
    ld   de, $FF66
    ld   a, a
    dec  c
    ld   d, c
    ld   [hl], c
    ld   d, l
    ld   de, $FF66
    ld   a, a
    and  e
    ld   b, h
    ld   b, a
    ld   a, l
    db   $EC ; Undefined instruction
    ld   a, l
    rst  $38
    ld   a, a
    and  e
    ld   b, h
    or   c
    ld   h, b
    ld   de, $FF66
    ld   a, a
    and  e
    ld   b, h
    ld   [hl], c
    ld   d, l
    or   c
    ld   h, b
    rst  $38
    ld   a, a
    xor  e
    ld   b, h
    or   c

label_9FD62::
    ld   h, b
    ld   de, $FF66
    ld   a, a
    ld   h, d
    inc  [hl]
    sub  a, l
    ld   b, l
    rrca
    ld   b, c
    rst  $38
    ld   a, a
    ld   h, d
    inc  [hl]
    xor  c
    inc  [hl]
    ld   d, l
    ld   e, [hl]
    rst  $38
    ld   a, a
    rrca
    ld   b, c
    sub  a, l
    ld   b, l
    ld   d, l
    ld   e, [hl]
    rst  $38
    ld   a, a
    ld   h, d
    inc  [hl]
    ld   b, a
    ld   a, l
    ld   c, $7E
    rst  $38
    ld   a, a
    ld   h, d
    inc  [hl]
    ld   [hl], l
    ld   e, b
    ld   d, l
    ld   e, [hl]
    rst  $38
    ld   a, a
    ld   h, d
    inc  [hl]
    sub  a, l
    ld   b, l
    ld   [hl], l
    ld   e, b
    rst  $38
    ld   a, a
    ld   l, l
    inc  [hl]
    ld   [hl], l
    ld   e, b
    ld   d, l
    ld   e, [hl]
    rst  $38
    ld   a, a
    ld   b, c
    jr   nz, label_9FD3A
    add  hl, sp
    ld   de, $FF35
    ld   a, a
    ld   b, c
    jr   nz, label_9FD34
    inc  h
    sbc  a, b
    ld   d, [hl]
    rst  $38
    ld   a, a
    ld   de, $9835
    add  hl, sp
    sbc  a, b
    ld   d, [hl]
    rst  $38
    ld   a, a
    ld   b, c
    jr   nz, label_9FE01
    ld   a, l
    ld   d, b
    ld   a, [hl]
    rst  $38
    ld   a, a
    ld   b, c
    jr   nz, label_9FE1A
    ld   d, b
    sbc  a, b
    ld   d, [hl]
    rst  $38
    ld   a, a
    ld   b, c
    jr   nz, label_9FD62
    add  hl, sp
    ld   e, b
    ld   d, b
    rst  $38
    ld   a, a
    ld   c, [hl]
    jr   nz, label_9FE2A
    ld   d, b
    sbc  a, b
    ld   d, [hl]
    rst  $38
    ld   a, a
    jr   nz, label_9FDE9
    cp   h
    dec  l
    inc  de
    dec  h
    rst  $38
    ld   a, a
    jr   nz, label_9FDF1
    ld   l, e
    inc  d
    call c, label_FF4E
    ld   a, a
    inc  de
    dec  h

label_9FDE9::
    cp   h
    dec  l
    call c, label_FF4E
    ld   a, a
    jr   nz, label_9FE01

label_9FDF1::
    ld   b, a
    ld   a, l
    sub  a, d
    ld   a, [hl]
    rst  $38
    ld   a, a
    jr   nz, label_9FE09
    inc  a
    ld   c, b
    call c, label_FF4E
    ld   a, a
    jr   nz, label_9FE11

label_9FE01::
    cp   h
    dec  l
    inc  a
    ld   c, b
    rst  $38
    ld   a, a
    jr   nc, label_9FE19

label_9FE09::
    inc  a
    ld   c, b
    call c, label_264E
    ld   a, l
    nop
    nop

label_9FE11::
    cp   a
    ld   hl, label_1915
    rst  $38
    ld   a, a
    nop
    nop

label_9FE19::
    ld   l, e

label_9FE1A::
    inc  b
    rra
    ld   c, e
    rst  $38
    ld   a, a
    dec  d
    add  hl, de
    cp   a
    ld   hl, label_9CB1F
    rst  $38
    ld   a, a
    nop
    nop
    ld   l, b

label_9FE2A::
    ld   a, l
    or   e
    ld   a, [hl]
    rst  $38
    ld   a, a
    nop
    nop
    rra
    ld   b, b
    rra
    ld   c, e
    rst  $38
    ld   a, a
    nop
    nop
    cp   a
    ld   hl, label_9C01F
    rst  $38
    ld   a, a
    ld   de, label_1F00
    ld   b, b
    rra
    ld   c, e

label_9FE45::
    add  a, l
    ld   a, h
    cp   l
    ld   a, h
    push af
    ld   a, h
    dec  l
    ld   a, l
    ld   h, l
    ld   a, l
    sbc  a, l
    ld   a, l
    push de
    ld   a, l
    dec  c
    ld   a, [hl]

label_9FE55::
    ld   hl, label_9FC85
    jr   label_9FE7D

label_9FE5A::
    ld   a, [$D016]
    ld   e, a
    ld   d, $00
    ld   hl, label_9FBC5
    add  hl, de
    ld   a, [hl]
    cp   $FF
    ret  z
    ld   hl, $D018
    cp   [hl]
    ret  z
    ld   [$D018], a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_9FE45
    add  hl, de
    ld   a, [hli]
    ld   d, a
    ld   h, [hl]
    ld   l, d

label_9FE7D::
    ld   bc, $0038
    ld   de, $DC50
    call label_2914
    ret

label_9FE87::
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
    ld   bc, $0101
    ld   bc, $0101
    ld   bc, label_201
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    ld   [bc], a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
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
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    dec  b
    ld   b, $06
    ld   b, $06
    ld   b, $06
    ld   b, $06
    rlca

label_9FF08::
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
    rlca
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

label_9FF27::
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

label_9FF47::
    rst  $38
    ld   a, a
    ld   h, $7D
    ld   h, $7D
    ld   h, $7D
    rst  $38
    ld   a, a
    push hl
    ld   l, b
    ld   c, $7E
    ld   c, $7E
    rst  $38
    ld   a, a
    call nz, label_F658
    ld   a, [hl]
    or   $7E
    rst  $38
    ld   a, a
    and  e
    ld   b, h
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    ld   h, d
    inc  [hl]
    ld   e, c
    ld   a, a
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    ld   b, c
    jr   nz, label_9FF27
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    jr   nz, label_9FF8B
    dec  c
    ld   a, [hl]
    rst  $38
    ld   a, a
    rst  $38
    ld   a, a
    nop
    nop
    ld   l, b
    ld   a, l
    rst  $38
    ld   a, a

label_9FF87::
    ld   hl, label_9FF47
    jr   label_9FFAF

label_9FF8C::
    ld   a, [$D016]
    ld   e, a
    ld   d, $00
    ld   hl, label_9FE87
    add  hl, de
    ld   a, [hl]
    cp   $FF
    ret  z
    ld   hl, $D019
    cp   [hl]
    ret  z
    ld   [$D019], a
    sla  a
    sla  a
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_9FF47
    add  hl, de

label_9FFAF::
    ld   bc, $0008
    ld   de, $DC88
    call label_2914
    ret

label_9FFB9::
    ld   h, b
    jr   c, label_FFFF801D
    jr   c, label_FFFF8020
    jr   c, label_FFFF8023
    jr   c, label_FFFF8026
    jr   c, label_FFFF8033
    dec  [hl]
    ld   a, [$D01A]
    cp   $05
    jr   nz, label_9FFD0
    ld   c, $07
    jr   label_9FFD1

label_9FFD0::
    ld   c, a

label_9FFD1::
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_9FFB9
    add  hl, de
    ld   a, [hli]
    ld   b, a
    ld   a, [hl]
    ld   h, $27
    jp   label_A13
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
