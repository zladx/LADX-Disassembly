section "bank38",romx,bank[$26]
    nop
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
    ld   a, l

label_9800C::
    nop
    add  a, b
    ld   c, l
    ld   c, l
    ld   c, l
    add  a, c
    nop
    ld   a, h
    rst  $28
    rst  $28
    rst  $28

label_98017::
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    jr   c, label_9800C
    rst  $28
    push hl
    push hl
    dec  e
    ld   l, $48
    ld   [rOBP1], a
    ld   c, [hl]
    ld   e, l
    push hl
    push hl
    dec  e
    scf
    add  hl, sp
    pop  hl
    ld   [$FF3A], a
    dec  sp
    jr   c, label_98017
    dec  e
    scf
    scf
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   a, d
    ld   a, d
    scf
    scf
    scf
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    jr   c, label_98096
    scf
    scf
    ld   l, $2F
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    add  hl, bc
    ld   a, h
    ld   a, l
    nop
    ld   a, h
    ld   a, l
    nop
    nop
    nop
    nop
    nop
    inc  e
    inc  e
    ld   a, [hl]
    inc  e
    inc  e
    ld   a, [hl]
    ld   a, l
    nop
    nop
    nop
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    push hl
    push hl
    push hl
    push hl
    push hl
    dec  e
    ld   d, b
    ld   e, l
    push hl
    push hl
    push hl
    push hl
    push hl
    dec  e
    ld   d, b
    scf
    db   $E8 ; add  sp, d
    jr   c, label_980D1
    ld   d, b
    ld   a, d
    ld   a, d
    ld   a, d
    ld   a, d
    ld   a, [bc]
    inc  sp
    ld   [$FF34], a
    inc  bc
    inc  bc
    ld   d, b
    ld   d, b
    ld   d, b
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_98096::
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   l, $2F
    cpl
    cpl
    cpl
    cpl
    cpl
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, l
    nop

label_980A9::
    nop
    nop
    nop
    add  a, b
    ld   c, l
    add  a, c
    ld   a, h
    inc  e
    inc  e
    ld   a, [hl]
    ld   a, l

label_980B4::
    rst  $28
    rst  $28
    scf
    inc  bc
    jr   c, label_980A9
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    push hl
    dec  e
    ld   l, $2F
    ld   c, [hl]
    ld   e, l
    push hl
    push hl
    push hl
    dec  e
    ld   d, b
    ld   c, e
    call label_D7E1
    jr   c, label_980B4
    push hl
    push hl

label_980D1::
    scf
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_98129
    ld   d, b
    ld   d, b
    ld   c, e
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_980E6
    inc  bc
    inc  bc
    inc  bc

label_980E6::
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    inc  bc
    inc  bc
    inc  bc
    dec  a
    add  a, b
    ld   c, l
    ld   c, l
    add  a, c
    nop
    add  a, b
    ld   c, l
    ld   c, l
    add  a, c
    nop
    scf
    inc  bc
    inc  bc

label_980FD::
    ld   c, h
    ld   c, l
    ld   c, e
    inc  bc
    inc  bc
    jr   c, label_98104

label_98104::
    scf
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_980FD
    scf
    inc  bc
    inc  bc
    dec  a
    cpl
    inc  a
    inc  bc
    inc  bc
    jr   c, label_98175
    ld   l, $2F
    cpl
    ld   c, [hl]
    pop  hl
    ld   l, $2F
    cpl
    ld   c, [hl]
    jr   c, label_9815C
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]

label_98129::
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_98130
    inc  bc
    inc  bc
    inc  bc

label_98130::
    inc  bc
    inc  bc
    ret  z
    inc  bc
    inc  bc
    ld   a, d
    cpl
    cpl
    ld   c, b
    ld   c, d
    ld   c, c
    cpl
    ld   c, b
    ld   c, d
    ld   c, c
    ld   c, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, l
    nop
    nop
    ld   a, h
    ld   a, l
    nop
    ld   a, h
    ld   a, l
    ld   a, h
    inc  e
    inc  e
    ld   a, [hl]
    ld   a, l
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28

label_9815C::
    rst  $28
    rst  $28
    push hl
    push hl
    dec  e
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    push hl
    push hl
    scf
    inc  bc
    inc  bc
    and  b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    push hl
    push hl
    scf

label_98175::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   a, d
    ld   a, d
    ld   a, d
    inc  bc
    inc  bc
    inc  bc
    jr   nz, label_98187
    inc  bc
    inc  bc
    dec  e

label_98187::
    ld   d, b
    ld   l, $2F
    cpl
    cpl
    ld   c, b
    ld   c, d
    ld   c, c
    cpl
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    inc  e
    inc  e
    ld   a, [hl]
    ld   a, l
    nop
    nop
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   d, b
    ld   d, b

label_981B0::
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   e, l
    push hl
    push hl
    inc  bc
    add  hl, bc

label_981BA::
    inc  bc
    jr   nz, label_981C0
    inc  bc
    jr   nz, label_981F8

label_981C0::
    push hl
    push hl
    inc  bc
    jr   nz, label_981C8
    inc  bc
    jr   nz, label_981CB

label_981C8::
    inc  bc
    jr   c, label_981B0

label_981CB::
    push hl
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    inc  bc
    jr   nz, label_981D6
    jr   c, label_981BA
    push hl

label_981D6::
    cpl
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    ld   c, [hl]
    ld   d, b
    ld   e, l
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

label_981EC::
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

label_981F7::
    scf

label_981F8::
    ld   [hl], c
    inc  e
    ld   a, a
    jr   c, label_981EC
    rst  $28
    push hl
    push hl
    dec  e

label_98201::
    scf
    xor  c
    xor  d
    cp   a
    jr   c, label_98264
    push hl
    push hl
    push hl
    scf
    ld   l, $48
    ld   [rOBP1], a
    ld   c, [hl]
    jr   c, label_981F7
    push hl
    push hl
    scf
    ld   a, $3A
    ld   [$FF3A], a
    ccf
    jr   c, label_98201
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
    jr   c, label_98231

label_98231::
    nop
    nop
    nop

label_98234::
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, l
    nop
    add  a, b
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    add  a, c
    rst  $28
    rst  $28
    rst  $28
    scf
    inc  bc
    add  hl, bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_98234
    push hl
    dec  e
    ld   c, e
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   a, d
    push hl
    push hl
    scf
    db   $D3 ; Undefined instruction
    inc  bc
    dec  a
    ld   c, b
    ld   c, d
    ld   c, c
    ld   c, [hl]
    push hl
    push hl

label_98264::
    scf
    inc  bc
    inc  bc
    jr   c, label_982A3
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    push hl
    push hl
    scf
    add  hl, bc
    inc  bc
    jr   c, label_98276
    inc  bc
    inc  bc
    inc  bc

label_98276::
    push hl
    push hl
    ld   l, $2F
    cpl
    ld   c, [hl]
    ld   [$FF3C], a
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
    ld   a, h
    ld   a, l
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, l
    ret  z
    ld   a, d
    ld   a, d
    rst  $28
    ld   a, d
    rst  $28
    rst  $28
    rst  $28
    ld   a, d
    ret  z
    ld   a, d
    ld   a, d
    ld   a, d
    ld   a, e
    ld   a, d

label_982A3::
    ld   a, e
    ld   a, e

label_982A5::
    ld   a, e
    ld   a, d
    ld   a, d
    push hl
    push hl
    push hl
    push hl
    push hl
    push hl
    push hl
    push hl
    push hl
    push hl
    ld   d, b
    ld   d, b
    ld   e, l
    push hl
    dec  e
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    inc  bc
    inc  bc
    jr   c, label_982A5
    scf
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    jr   c, label_982E7
    ld   l, $2F
    cpl
    cpl
    cpl
    cpl
    nop
    nop
    ld   a, h
    ld   a, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    inc  e
    inc  e
    ld   a, [hl]
    ld   a, l
    nop
    nop
    add  a, b
    ld   c, l
    ret  z
    ld   a, b
    ld   a, b

label_982E7::
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, b
    ld   a, b
    inc  bc
    ld   a, c
    ld   a, c
    ld   a, c
    ld   a, e
    ld   a, e
    ld   a, e
    ld   a, e
    ld   a, c
    ret  z
    inc  bc
    push hl
    push hl
    push hl
    push hl
    dec  e
    ld   d, b
    ld   d, b
    ld   d, b
    ld   l, $2F
    ld   d, b
    ld   d, b
    ld   d, b
    ld   d, b
    ld   c, e
    inc  bc
    inc  bc
    inc  bc
    ld   a, $3A
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    inc  bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    ld   c, b
    ld   c, d
    ld   c, c
    inc  a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  a, b
    ld   c, l
    ld   c, l
    ld   d, d
    ld   d, d
    ld   d, d
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, l
    ld   c, e
    inc  bc
    add  hl, bc
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    add  hl, bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
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
    add  hl, bc
    inc  bc
    cpl
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    inc  a
    inc  bc
    dec  a
    cpl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    ld   l, $2F
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    pop  hl
    sbc  a, $03
    inc  bc
    inc  bc
    add  hl, sp
    pop  hl
    dec  sp
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
    ld   c, l
    ld   c, l
    ld   c, l
    add  a, c
    nop
    nop
    nop
    nop
    nop
    nop

label_9837A::
    inc  bc
    inc  bc
    inc  bc
    ld   c, h
    ld   c, l
    add  a, c
    ld   a, h
    ld   a, l
    nop
    nop
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_9837A
    rst  $28
    rst  $28
    rst  $28
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   a, d
    ld   a, d
    ld   a, e
    ld   a, d
    ld   a, d
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    ld   d, b
    ld   e, l
    push hl
    push hl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_983A4::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    ld   a, b
    ld   a, b
    ld   a, b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    ld   a, c
    ld   a, c
    ld   a, c
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    add  hl, bc
    inc  bc
    jr   c, label_983A4
    push hl
    nop
    nop
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
    ld   a, l
    nop

label_983CE::
    ld   a, h
    ld   a, l
    add  a, b
    ld   c, l
    ld   c, l
    add  a, c
    rst  $28
    ld   a, b
    ld   a, b
    ld   a, d
    ld   a, d
    ld   a, d
    ld   a, d
    jr   nz, label_983FD
    jr   c, label_98459
    ld   a, c
    ld   a, c
    push hl
    push hl
    dec  e
    ld   c, e
    jr   nz, label_983EA
    jr   c, label_983CE
    dec  e

label_983EA::
    ld   d, b
    ld   d, b
    ld   e, l
    scf
    inc  bc
    inc  bc
    ld   a, d
    ld   a, d
    ld   a, b
    ld   a, b
    inc  bc
    inc  bc
    jr   c, label_9842F
    inc  bc
    inc  bc
    jr   c, label_9843B
    ld   a, c

label_983FD::
    ld   a, c
    inc  bc
    inc  bc
    jr   c, label_98430
    cpl
    cpl

label_98404::
    ld   c, [hl]
    ccf
    push hl
    ld   l, $2F
    ld   [$FF4E], a
    ld   a, $53
    db   $3A ; ldd  a, [hl]
    ccf
    ccf
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, l
    nop
    add  a, b
    ld   c, l
    ld   c, l
    ld   c, l
    add  a, c
    nop
    ld   a, h
    inc  e
    inc  e
    ld   a, l
    ld   l, $2F
    cpl

label_98427::
    cpl
    ld   c, [hl]
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    ld   a, $3A

label_98430::
    db   $3A ; ldd  a, [hl]

label_98431::
    db   $3A ; ldd  a, [hl]
    ccf
    dec  e
    ld   d, b
    ld   d, b
    ld   e, l
    push hl
    ld   a, d
    ld   a, d
    ld   a, d

label_9843B::
    ld   a, d
    ld   a, d
    ld   a, d
    inc  bc
    inc  bc
    jr   c, label_98427

label_98442::
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    scf
    inc  bc
    inc  bc
    jr   c, label_98431
    ld   a, $E1
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    ld   l, $2F
    cpl
    ld   c, [hl]
    push hl
    scf
    inc  bc
    inc  bc

label_98459::
    inc  bc
    jr   c, label_9849A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    push hl
    nop
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
    ld   [hl], h
    ld   [hl], h
    ld   [hl], e
    rst  $28
    rst  $28
    dec  e
    ld   d, b
    ld   d, b
    ld   [hl], d
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    ld   [hl], e
    ld   d, b
    ld   d, b
    scf
    ld   d, h
    jr   nz, label_98442
    ld   [hl], h
    ld   [hl], h
    ld   [hl], h
    or   a
    inc  bc
    inc  bc
    scf
    jr   nz, label_98498
    inc  bc
    inc  bc
    inc  bc

label_98498::
    add  hl, bc
    inc  bc

label_9849A::
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
    nop
    nop
    nop
    nop
    nop
    nop
    ld   a, h
    ld   a, l
    nop
    nop
    ld   a, h
    ld   a, l
    nop
    nop
    ld   a, h
    ld   a, [hl]
    inc  e
    inc  e
    ld   a, l
    nop
    rst  $28
    rst  $28
    rst  $28

label_984C7::
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28
    rst  $28

label_984CE::
    ld   d, b
    ld   d, b
    ld   d, b

label_984D1::
    ld   d, d
    ld   d, d
    ld   d, d
    ld   d, b
    ld   d, b
    ld   e, l
    push hl
    inc  bc
    add  hl, bc
    inc  bc
    or   [hl]
    ldh  [$FF0C], a
    or   a
    inc  bc
    add  hl, bc
    jr   c, label_984C7
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_984D1
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    dec  a
    cpl
    ld   c, [hl]
    push hl
    cpl
    cpl
    cpl
    cpl

label_984FA::
    cpl
    cpl
    ld   c, [hl]

label_984FD::
    db   $3A ; ldd  a, [hl]
    ccf

label_984FF::
    push hl
    scf
    scf
    add  hl, sp
    or   [hl]
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    or   [hl]
    dec  sp
    ret  z
    scf
    scf
    add  hl, bc
    or   a
    add  hl, bc
    add  hl, bc
    add  hl, bc
    or   a
    add  hl, bc
    add  hl, bc
    scf
    scf
    ret  z
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ret  z
    add  hl, bc
    scf
    scf
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    scf
    scf
    add  hl, bc
    inc  bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    inc  bc
    add  hl, bc
    dec  a
    scf
    scf
    inc  bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_98574
    inc  sp
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  [hl]
    ld   l, $2F
    cpl
    cpl
    cpl
    cpl
    inc  a
    dec  h
    ld   h, $25
    ret  z
    ret  z
    ret  z
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    add  hl, bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    dec  h
    ld   b, l
    ld   h, $03
    inc  bc
    add  hl, bc
    add  hl, bc
    inc  bc
    add  hl, bc
    inc  bc
    daa
    pop  hl
    jr   z, label_98570
    inc  bc
    add  hl, bc
    add  hl, bc

label_98570::
    inc  bc
    add  hl, bc
    inc  bc
    inc  bc

label_98574::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    cpl
    cpl
    inc  a
    inc  bc
    inc  bc
    inc  bc
    dec  a
    cpl
    cpl
    cpl
    ret  z
    ld   l, a
    ld   l, $48
    ld   c, d
    ld   c, c
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ret  z
    inc  bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    inc  bc
    inc  bc
    ld   h, $0A
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    dec  a
    ld   c, b
    ld   c, d
    ld   c, c
    inc  a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_985AE
    inc  bc
    inc  bc
    inc  bc

label_985AE::
    add  hl, bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_985B8
    inc  bc
    inc  bc
    inc  bc

label_985B8::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_985C2
    add  hl, bc
    inc  bc
    inc  bc

label_985C2::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_985F8
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
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
    dec  a
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
    cp   d
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_985F8::
    db   $3A ; ldd  a, [hl]
    dec  sp
    ret  z
    inc  bc
    ret  z
    inc  bc
    inc  bc
    inc  bc
    ret  z
    inc  bc
    ret  z
    inc  bc
    inc  bc
    inc  bc
    ret  z
    inc  bc
    ret  z
    inc  bc
    ret  z
    inc  bc
    inc  bc
    ret  z
    inc  bc
    ret  z
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ret  z
    inc  bc
    inc  bc
    ret  z
    ret  z
    inc  bc
    inc  bc
    ret  z
    inc  bc
    ret  z
    inc  bc
    inc  bc
    ret  z
    inc  bc
    ret  z
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ret  z
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ret  z
    inc  bc
    inc  bc
    ret  z
    add  hl, bc
    ret  z
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
    scf
    inc  bc
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    inc  bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $3C
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, sp
    ld   l, $2F
    ld   c, b
    ld   [rOBP1], a
    cpl
    cpl
    cpl
    cpl
    add  hl, bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ret  z
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
    ret  z
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    dec  a
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    ccf
    inc  bc
    jr   c, label_986D5
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    dec  sp
    add  hl, bc
    jr   c, label_986A8
    add  hl, bc
    inc  bc
    inc  bc

label_986A8::
    inc  bc
    inc  bc
    dec  a
    cpl
    cpl
    ld   c, [hl]
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    pop  hl
    dec  sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    inc  bc
    ret  z
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
    ret  z
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl

label_986D5::
    inc  a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $1D
    ld   l, $2F
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    cpl
    ld   c, [hl]
    scf
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    scf
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    ld   l, $2F
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    cpl
    cpl
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ret  z
    inc  bc
    inc  bc
    inc  bc
    call nc, label_303
    add  hl, bc
    inc  bc
    ret  z
    ret  z
    add  hl, bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ret  z
    cpl
    cpl
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    cpl
    cpl
    ld   e, l
    dec  e
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    ccf
    ld   [$FF37], a
    inc  bc
    add  hl, bc
    jr   c, label_98773
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    ccf
    ld   [$FF37], a
    inc  bc
    inc  bc
    jr   c, label_9877D
    add  hl, sp
    pop  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    ld   l, $2F
    cpl
    ld   c, [hl]
    scf
    jr   nz, label_98755
    jr   nz, label_9875D
    inc  bc

label_98755::
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    scf
    add  hl, bc
    jr   nz, label_98760

label_9875D::
    inc  bc
    inc  bc
    inc  bc

label_98760::
    inc  bc
    db   $03
    inc  bc
    inc  sp
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    cpl
    ld   c, [hl]
    inc  bc
    inc  bc
    db   $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a

label_98773::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    cpl
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a

label_9877D::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    inc  bc
    inc  bc
    jr   c, label_987BB
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    inc  bc
    inc  bc
    jr   c, label_987C5
    and  b
    inc  bc
    inc  bc
    ret  z
    add  hl, bc
    inc  bc
    cpl
    cpl
    ld   c, [hl]
    scf
    inc  bc
    inc  bc
    add  hl, bc
    ret  z
    inc  bc
    inc  bc
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    scf
    inc  bc
    inc  bc
    inc  bc
    ret  z
    inc  bc
    inc  bc
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    inc  sp
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de

label_987BB::
    dec  de
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    cpl
    cpl
    cpl
    cpl
    inc  a

label_987C5::
    dec  de
    dec  h
    ld   h, $3E
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, bc
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
    add  hl, bc
    scf
    inc  bc
    add  hl, bc
    inc  bc
    dec  a
    cpl
    cpl
    inc  bc
    inc  bc
    inc  bc
    ld   l, $2F
    cpl
    cpl
    ld   c, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    cpl
    ld   c, b
    ld   [$FF39], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  a
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
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
    dec  a
    cpl
    cpl
    cpl
    inc  a
    inc  bc
    cpl
    cpl
    ld   l, $2F
    ld   c, [hl]
    ld   d, e
    ld   d, e
    ld   d, e
    ld   l, $2F
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    ccf
    jp   [hl]
    jp   [hl]
    jp   [hl]
    ld   a, $3A
    dec  de
    dec  de
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    dec  sp
    jp   [hl]
    jp   [hl]
    jp   [hl]
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    cpl
    cpl
    cpl
    inc  a
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_988C9
    ld   d, b
    inc  bc
    dec  a
    cpl
    inc  a
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_9889E
    dec  de
    cpl
    ld   c, [hl]
    ld   d, e
    ld   l, $2F
    cpl
    cpl
    ld   c, [hl]
    dec  de
    dec  de
    db   $3A ; ldd  a, [hl]
    ccf
    jp   [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    ld   d, e
    ccf
    dec  de
    dec  de
    db   $3A ; ldd  a, [hl]
    dec  sp
    jp   [hl]
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9889E::
    jp   [hl]
    dec  sp
    dec  de
    dec  de
    dec  de
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $1B
    dec  de
    dec  de
    dec  a
    ld   c, b
    jp   [hl]
    jp   [hl]
    jp   [hl]
    ld   c, c
    inc  a
    ld   c, $1B
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    cpl
    ld   d, b
    ld   a, $3A
    ld   [$FF3F], a
    ld   a, $E9
    db   $3A ; ldd  a, [hl]
    ccf

label_988C9::
    ccf
    dec  de
    ld   a, $3A
    ld   [$FF3F], a
    ld   a, $E9
    db   $3A ; ldd  a, [hl]
    ccf
    ccf
    dec  de
    ld   a, $3A
    ld   [$FF3F], a
    ld   a, $E9
    db   $3A ; ldd  a, [hl]
    ccf
    dec  sp
    dec  de
    ld   a, $3A
    ld   [$FF3F], a
    add  hl, sp
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    dec  de
    dec  de
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    ld   [$FF3B], a
    ld   c, $0E
    ld   c, $1B
    dec  de
    dec  de
    dec  de
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $1B
    dec  de
    dec  a
    cpl
    jp   [hl]
    cpl
    jp   [hl]
    cpl
    jp   [hl]
    cpl
    cpl
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    inc  bc
    inc  bc
    inc  bc
    ldd  [hl], a
    inc  l
    dec  l
    db   $3A ; ldd  a, [hl]
    ccf
    push hl
    ld   l, $2F
    inc  a
    inc  bc
    inc  bc
    and  b
    jr   c, label_9895C
    ccf
    push hl
    add  hl, sp
    pop  hl
    scf
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_98966
    ccf
    ld   d, b
    dec  de
    dec  de
    ld   l, $2F
    cpl
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    inc  bc
    dec  de
    dec  de
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    pop  hl
    dec  sp
    inc  bc
    dec  de
    dec  de
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
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
    cpl
    cpl
    cpl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9895C::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3E
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_98966::
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3E
    sbc  a, $03
    db   $3A
    db   $3A ; ldd  a, [hl]
    sbc  a, $03
    inc  bc
    inc  bc
    add  hl, sp
    ld   a, $2E
    ld   [$FF4E], a
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    cpl
    cpl
    inc  bc
    add  hl, sp
    ld   a, $E0
    ccf
    db   $3A ; ldd  a, [hl]
    ld   a, $DE
    inc  bc
    inc  bc
    inc  bc
    ld   l, a
    add  hl, sp
    ld   [$FF3B], a
    db   $E8 ; add  sp, d
    add  hl, sp
    ld   l, $2F
    cpl
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
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

label_989A9::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    pop  hl

label_989B3::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    pop  hl
    ccf
    push hl
    inc  bc
    add  hl, bc
    inc  bc

label_989BD::
    inc  bc
    db   $3A
    db   $3A ; ldd  a, [hl]
    ccf
    inc  bc
    jr   c, label_989A9
    ld   c, b
    ld   [rOBP1], a

label_989C7::
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    inc  bc
    jr   c, label_989B3
    inc  bc
    inc  bc
    db   $3A

label_989D1::
    db   $3A ; ldd  a, [hl]
    ccf
    pop  hl
    dec  sp
    inc  bc
    jr   c, label_989BD
    cpl
    cpl
    ld   c, [hl]
    cp   d
    dec  sp
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_989C7
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_989D1
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    push hl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    push hl
    scf
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    daa
    jr   z, label_98A31
    scf
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    cpl
    cpl
    scf
    rst  $30
    rst  $38
    ld   sp, hl
    rst  $38
    or   $39
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    ld   l, $3C
    rst  $30
    ld   a, [rIE]
    ld   sp, hl
    ld    hl, sp+$04
    inc  b
    add  hl, sp
    scf
    or   $04
    rst  $30
    ld   a, [label_4F8]
    inc  b

label_98A31::
    dec  hl
    ld   c, $37
    rst  $38
    or   $20
    inc  b
    inc  b
    jr   nz, label_98A3F
    scf
    ld   c, $37
    rst  $38

label_98A3F::
    rst  $38
    ld   sp, hl
    ld   sp, hl
    or   $04
    push af
    scf
    ld   c, $37
    ei
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$04
    ei
    scf
    jr   z, label_98A5C
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    jr   c, label_98A91
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    cpl
    cpl

label_98A5C::
    ld   c, b
    ld   [rOBP1], a
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    dec  sp
    inc  b
    inc  b
    push af
    scf
    rst  $30
    ld   a, [label_4F8]
    ld   e, h
    ld   e, h
    push af
    ld   sp, hl
    rst  $38
    scf
    dec  l
    inc  b

label_98A7A::
    inc  b
    inc  b
    push af
    ld   sp, hl
    rst  $38
    ld   a, [label_370A]
    jr   c, label_98A7A
    ld   e, h
    push af
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   e, h
    ld   a, [bc]
    scf
    jr   c, label_98A8D
    ld   sp, hl
    rst  $38
    rst  $38

label_98A91::
    ld   a, [bc]
    ld   a, [bc]

label_98A93::
    ld   a, [bc]
    ld   a, [bc]
    scf
    jr   c, label_98A93
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [bc]
    scf
    jr   c, label_98ADC
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_98AE6
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_98AB5
    ld    hl, sp+$11
    jr   nc, label_98B0B
    jr   nc, label_98AD7

label_98ABC::
    dec  de
    ld   d, c
    jr   c, label_98ABC
    inc  de
    rla

label_98AC2::
    jr   nc, label_98B15
    dec  de
    dec  de
    dec  de
    dec  de
    jr   c, label_98AC2
    ld   de, label_3030
    ld   d, c
    dec  de
    dec  de
    dec  de
    ld   d, c
    jr   c, label_98AD8
    ld   de, label_1B30

label_98AD7::
    dec  de

label_98AD8::
    dec  de
    ld   d, c
    ld   d, c
    dec  de

label_98ADC::
    jr   c, label_98AE2
    ld   de, label_1B1B
    dec  de

label_98AE2::
    dec  de
    dec  de
    dec  de
    dec  de

label_98AE6::
    jr   c, label_98AEC
    ld   de, label_1B1B
    ld   d, c

label_98AEC::
    dec  de
    dec  de
    ld   d, c
    ld   d, c
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
    ld   d, c
    jr   nc, label_98B37
    dec  de
    dec  de
    dec  de
    dec  de

label_98B0B::
    ld   d, c
    dec  de
    dec  de
    dec  de
    jr   nc, label_98B2C
    dec  de
    ld   d, c
    dec  de
    dec  de

label_98B15::
    dec  de
    dec  de
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    ld   d, c
    ld   d, c
    dec  de
    dec  de
    dec  de
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    ld   d, c

label_98B2C::
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    ld   d, c
    dec  de
    dec  de
    ld   d, c
    ld   d, c

label_98B37::
    dec  de
    dec  de
    dec  de
    ld   d, c
    dec  de
    ld   d, c
    dec  de
    dec  de
    ld   d, c
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   [hl]
    rst  $10
    or   [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   [hl]
    or   a
    pop  hl
    or   a
    or   [hl]
    dec  sp
    inc  b
    rst  $30
    db   $FD ; Undefined instruction
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    ld   [de], a
    jr   nz, label_98B7C
    inc  b
    dec  h
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    jr   label_98B79
    dec  h
    ld   h, $27
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    ld   [de], a
    daa

label_98B70::
    jr   z, label_98B67
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    ld   [de], a

label_98B79::
    jr   nz, label_98B70
    rst  $38

label_98B7C::
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    ld   [de], a
    jr   nz, label_98B7C
    ld   a, [label_99151]
    ld   d, c
    dec  de
    dec  de
    ld   d, c
    ld   [de], a
    dec  h
    ld   h, $25
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $FA
    ld    hl, sp+$04
    inc  b
    inc  b
    inc  b
    inc  b
    rst  $30
    rst  $38
    add  hl, sp
    ld   h, $25
    ld   h, $20
    ld   [hl], $2F
    inc  a
    inc  b
    rst  $30
    ld    hl, sp+$28
    daa
    jr   z, label_98BD2
    call nc, label_3720
    inc  b
    inc  b
    inc  b
    ld   sp, hl
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    or   $04
    inc  b
    ld   l, $48
    ld   c, d
    ld   c, c
    db   $FC ; Undefined instruction
    ld   [hl], $3C
    rst  $30
    ld   sp, hl
    or   $39
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, [label_37F9]
    inc  b
    rst  $30
    rst  $38

label_98BD2::
    ld   sp, hl
    or   $04
    inc  b
    ld   h, $F7
    scf
    inc  b
    inc  b
    rst  $30
    ld   a, [$F9FF]
    or   $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    inc  b
    push af
    ld   a, [$F8FD]
    inc  b
    inc  b
    add  hl, bc
    rst  $30
    ld   sp, hl
    push af
    db   $FC ; Undefined instruction
    dec  a
    cpl
    ld   c, b
    ld   c, d
    ld   c, c
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
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
    rst  $38
    rst  $38
    ld   sp, hl
    ld    hl, sp+$04
    rst  $30
    ld   a, [$FFF7]
    rst  $38
    rst  $38
    ld   a, [label_3DF8]
    dec  [hl]
    inc  b
    inc  b
    inc  b
    ei
    rst  $38
    ld    hl, sp+$04
    dec  a
    ld   c, [hl]
    or   $04
    inc  b
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  b
    rst  $30
    ld   sp, hl
    db   $FC ; Undefined instruction
    add  hl, bc
    inc  b
    inc  b
    ld   a, [label_4F6]
    inc  b
    add  hl, bc
    rst  $30
    ld   a, [label_4F6]
    dec  hl
    cpl
    cpl
    ld   c, b
    ld   c, d
    ld   c, c
    cpl
    inc  a
    cp   $09
    scf
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    rst  $38
    or   $37
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   e, h
    scf
    rst  $30
    db   $FC ; Undefined instruction
    scf
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    or   $5C
    scf
    inc  b
    ei
    scf
    inc  b
    ei
    rst  $38
    rst  $38
    rst  $38
    or   $37
    add  hl, bc
    ei
    scf
    daa
    jr   z, label_98CBC
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    inc  b
    inc  b
    rst  $30
    ld    hl, sp+$47
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    dec  l
    or   $04
    inc  b
    jr   c, label_98CA8
    ld   c, $0E
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    jr   c, label_98C9F
    ld   sp, hl
    ld   sp, hl
    jr   c, label_98CB2
    ld   c, $0E
    ld   c, $0E

label_98CA8::
    jr   c, label_98CA9
    rst  $38
    rst  $38
    ldd  [hl], a
    inc  l

label_98CAE::
    inc  l

label_98CAF::
    inc  l
    inc  l
    inc  l

label_98CB2::
    jr   c, label_98CAF
    rst  $38
    ld    hl, sp+$04
    jr   nz, label_98CAE
    rst  $38
    ld   a, [label_38FF]
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    dec  a
    cpl
    cpl
    cpl
    inc  a
    rst  $30
    jr   c, label_98CC7
    rst  $38
    ld   sp, hl
    jr   c, label_98D06
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
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
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    inc  l
    inc  l
    dec  l
    ld   c, $2B
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    rst  $38
    ld    hl, sp+$38

label_98D05::
    inc  l

label_98D06::
    ld   sp, $F9F5
    rst  $38
    ld   sp, hl
    rst  $38
    ld    hl, sp+$04
    jr   c, label_98D05
    ld   sp, hl
    ld   a, [$FFFA]
    rst  $38
    ld   a, [$E048]
    ld   c, [hl]
    ld   a, [bc]
    dec  hl
    inc  l
    dec  l
    ei
    db   $FC ; Undefined instruction
    dec  hl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $B6
    or   a
    db   $3A ; ldd  a, [hl]
    or   [hl]
    or   a
    db   $3A ; ldd  a, [hl]
    ld   c, $0E
    ld   c, $39
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    inc  l
    dec  l
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    or   $32
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    rst  $38
    ld   sp, hl
    or   $04
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  l
    dec  l
    rst  $38
    ld   sp, hl
    dec  hl
    inc  l
    dec  l
    ld   sp, hl
    ld   sp, hl
    dec  hl
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, $0E
    ld   c, $0E
    ld   c, $39
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
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
    inc  l
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
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $2B
    inc  l
    dec  l
    ld   c, $2B
    ld   c, $0E
    ld   c, $2B
    inc  l
    scf
    db   $E8 ; add  sp, d
    jr   c, label_98E1D
    scf
    inc  l
    inc  l
    inc  l
    ld   sp, label_330A
    ld   [$FF34], a
    ld   a, [bc]
    inc  sp
    inc  b
    inc  b
    inc  b
    rst  $30
    ld   a, [label_A0A]
    ld   a, [bc]
    ld   a, [label_2D0A]
    dec  hl
    inc  l
    dec  l
    inc  b
    dec  hl
    inc  l
    dec  l
    inc  b
    dec  hl
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
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_98E1D::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    inc  l
    dec  l
    ld   c, $0E
    dec  hl
    inc  l
    dec  l
    ld   c, $2B
    inc  l
    db   $E8 ; add  sp, d
    jr   c, label_98E67
    inc  l
    scf
    add  a, $38
    inc  l
    ld   sp, label_2FF5
    inc  [hl]
    ld   sp, hl
    ld   a, [bc]
    inc  sp
    ld   [$FF34], a
    ld   a, [bc]
    ld   sp, hl
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    ld   a, [label_2CF8]
    dec  l
    ei
    rst  $38
    dec  hl
    inc  l
    dec  l
    ld    hl, sp+$04
    inc  b
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_98E67::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    pop  hl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    inc  l
    inc  l
    inc  l
    dec  l
    ld   c, $0E
    dec  hl
    inc  l
    inc  l
    inc  l
    ld   sp, hl
    ld   a, [$F2F8]
    ld   c, $0E
    ld   [$FFF7], a
    ld   sp, hl
    ld    hl, sp+$6E
    inc  b
    di
    ld   c, $0E
    ld   a, [$FF04]
    rst  $30
    ld   a, [label_404]
    inc  b
    di
    ld   c, $0E
    ld   a, [$FF04]
    ld   l, [hl]
    dec  h
    inc  b
    push af
    or   $F4
    ld   c, $CA
    pop  af
    inc  b
    inc  b
    daa
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    dec  l
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_98ED3
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    jr   c, label_98EFB
    inc  l
    inc  l
    inc  l
    inc  l

label_98ED3::
    dec  l
    ld   c, $0E
    ld   c, $38
    rst  $38
    ld   sp, hl
    or   $04
    inc  b

label_98EDD::
    jr   c, label_98EED
    ld   c, $0E
    jr   c, label_98EDD
    ld   a, [$F9FF]
    or   $32
    dec  l
    jp   z, label_380E
    ld   h, $C6
    rst  $30
    ld   a, [$F6FF]
    jr   c, label_98F02
    jp   z, label_2938
    ld   h, $25
    ld   h, $FB

label_98EFB::
    rst  $38
    jr   c, label_98F0C
    ld   c, $38
    ld   c, $37

label_98F02::
    ei
    rst  $38
    rst  $38
    ld    hl, sp+$04
    push af
    rst  $38
    scf
    ld   c, $37

label_98F0C::
    ld   b, h
    rst  $38
    ld    hl, sp+$F5
    ld   d, d
    ld   d, d
    ld   d, d
    scf
    dec  hl
    ld   sp, $FCFB
    inc  b
    ld   a, [bc]
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    scf
    scf
    ld   sp, hl
    rst  $38

label_98F21::
    ld    hl, sp+$E8
    rst  $30
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   l, $37
    ld   b, h
    ld    hl, sp+$04
    inc  b
    inc  b
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    add  hl, sp
    scf
    dec  h
    ld   h, $04
    call nc, label_E8E8
    inc  b
    inc  b
    inc  b
    scf
    daa
    add  hl, hl
    ld   h, $04
    push af
    or   $04
    dec  h
    ld   h, $37
    dec  h
    ld   a, [hli]
    jr   z, label_98F4F
    rst  $30
    rst  $38

label_98F4D::
    or   $27

label_98F4F::
    add  hl, hl
    jr   c, label_98F4D
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [bc]
    scf
    jr   c, label_98F5B
    rst  $38

label_98F5D::
    ld   a, [$FFFA]
    rst  $38
    ld   a, [label_37F8]
    jr   c, label_98F5D
    ld   b, h
    dec  h
    ld   h, $F7
    ld    hl, sp+$25
    ld   h, $2E
    ld   c, [hl]
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    daa
    jr   z, label_98F99
    ld   b, l
    ld   a, [hli]
    jr   z, label_98FB1
    dec  sp
    inc  b
    push af
    ld   a, [bc]
    ld   a, [bc]
    daa
    pop  hl
    jr   z, label_98F8B
    ld   a, [bc]
    inc  b
    inc  b
    rst  $30
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    ld   a, [label_250A]
    ld   h, $04
    rst  $30
    ld   a, [$FAFA]
    ld    hl, sp+$25
    ld   h, $2A
    add  hl, hl

label_98F98::
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   a, [hli]
    add  hl, hl
    jr   c, label_98F98
    ld   de, label_1B1B
    ld   d, c
    dec  de
    dec  de
    ld   d, c
    ld   d, c
    jr   c, label_98FF0
    ld   de, label_1B30
    ld   d, c
    dec  de

label_98FB1::
    dec  de
    dec  de
    ld   d, c
    ld   c, [hl]
    db   $FC ; Undefined instruction
    ld   de, label_3030
    dec  de
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  sp
    cp   $15
    call nc, label_1B19
    dec  de
    ld   d, c
    dec  de
    dec  de
    ld   a, [bc]
    rst  $38
    ld   sp, hl
    or   $11
    jr   nc, label_98FFF
    dec  de
    ld   d, c
    ld   d, c
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    ld   b, h
    dec  d
    db   $10 ; Undefined instruction
    jr   nc, label_9902C
    dec  de
    dec  h
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   a, [hli]
    ld   d, c
    dec  de
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl

label_98FF0::
    ld   d, c
    dec  de
    dec  de
    dec  de
    ld   d, c
    dec  de
    ld   d, c
    dec  de
    dec  de
    ld   d, c
    ld   d, c
    dec  de
    dec  de
    dec  de
    ld   d, c

label_98FFF::
    dec  de
    ld   d, c
    dec  de
    dec  de
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    ld   d, c
    dec  de
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    ld   d, c
    dec  de
    dec  de
    ld   d, c
    dec  de
    dec  de
    dec  de
    ld   d, c
    ld   d, c
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    ld   d, c
    ld   d, c
    ld   d, c
    dec  de
    dec  de
    dec  de
    ld   d, c
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de
    dec  de

label_9902C::
    dec  de
    jr   nc, label_9905F
    dec  de
    dec  de
    ld   d, c
    dec  de
    jr   nc, label_99065
    dec  de
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   d, c
    ld   d, c
    ld   d, c
    dec  de
    dec  de
    ld   d, c
    ld   [de], a
    daa
    jr   z, label_99071
    ld   d, c
    and  b
    ld   d, c
    dec  de
    dec  de
    jr   nc, label_99063
    inc  b
    inc  b
    dec  h
    dec  de
    dec  de
    ld   d, c
    dec  de
    ld   a, [de]
    db   $10 ; Undefined instruction
    dec  h
    ld   h, $27
    dec  de

label_9905F::
    ld   d, c
    dec  de
    ld   a, [de]
    ld   d, $25
    ld   h, $27
    jr   z, label_9905D
    ld   d, c
    ld   d, c
    dec  de
    ld   [de], a
    jr   nz, label_99095
    jr   z, label_99065
    ld   sp, hl

label_99071::
    ld   a, [label_1B1B]
    jr   nc, label_99088
    jr   nz, label_9906D
    db   $FD ; Undefined instruction
    ld   a, [label_25F8]
    dec  de
    jr   nc, label_990A8
    ld   h, $F5
    db   $FC ; Undefined instruction

label_99082::
    dec  h
    ld   h, $25
    ld   a, [hli]
    ld   a, [hli]
    add  hl, hl

label_99088::
    ld   a, [hli]
    jr   z, label_99082
    ld    hl, sp+$27
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    jr   z, label_99096
    scf
    rrca
    rrca

label_99095::
    rrca

label_99096::
    inc  d
    ei
    rst  $38
    db   $FC ; Undefined instruction
    ld   h, $F5
    scf
    dec  de
    dec  de
    jr   nc, label_990B3

label_990A1::
    rst  $30
    rst  $38
    db   $FC ; Undefined instruction
    jr   z, label_990A1
    scf
    dec  de

label_990A8::
    dec  de
    ld   a, [de]
    ld   d, $04
    rst  $30
    ld    hl, sp+$F9
    rst  $38
    ld   l, $2F
    cpl

label_990B3::
    cpl
    ld   c, b
    ld   c, d
    ld   c, d
    ld   c, c
    ld   a, [label_39FC]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   [hl]
    pop  hl
    or   [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   h, $F7
    or   $6F
    push af
    or   $04
    inc  b
    inc  b
    inc  b
    add  hl, hl
    ld   h, $F7
    db   $FD ; Undefined instruction
    ld   a, [$FDFA]
    or   $25
    ld   h, $2A
    add  hl, hl
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   a, [hli]
    add  hl, hl
    inc  b
    rst  $30
    ld    hl, sp+$04
    inc  b
    jr   c, label_99122
    rst  $38
    or   $04
    inc  b
    dec  a
    ld   c, b
    ld   c, d
    ld   c, c
    ld   c, [hl]
    ld   a, [bc]
    rst  $38
    rst  $38
    ld   sp, hl
    inc  b
    jr   c, label_99131
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    rst  $38
    ld   a, [rIE]
    cpl
    ld   c, [hl]
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    rst  $38
    ld    hl, sp+$04
    ei
    rst  $38
    db   $3A ; ldd  a, [hl]
    dec  sp

label_9910A::
    ld   a, [bc]
    call nc, label_F8F7
    db   $E8 ; add  sp, d
    inc  b
    ei
    ld   a, [$FAF7]
    rst  $38
    or   $04
    inc  b
    push af
    ld   sp, hl
    ld    hl, sp+$25
    dec  h
    ld   h, $FB
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    push af

label_99122::
    ld   a, [label_25F8]
    ld   a, [hli]
    ld   a, [hli]
    jr   z, label_99124
    rst  $38
    ld   sp, hl
    ld    hl, sp+$04
    dec  h
    ld   a, [hli]
    add  hl, hl
    push af

label_99131::
    rst  $38
    rst  $38
    ld   a, [$FAFF]
    scf
    ld   sp, hl
    db   $FC ; Undefined instruction
    scf
    rst  $38
    rst  $38
    ld    hl, sp+$55
    ld   h, c
    ld   d, [hl]
    scf
    rst  $30
    ld   a, [$FF2E]
    ld    hl, sp+$62
    ld   b, b
    ld   h, b
    ld   b, d
    ld   l, $3C
    add  hl, bc
    add  hl, sp
    db   $FC ; Undefined instruction
    inc  b
    ld   h, d

label_99151::
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    add  hl, sp
    scf
    or   $04
    ld   a, [$F6F9]
    inc  b
    inc  c
    inc  b
    push af
    scf
    ld   a, [label_26F6]
    rst  $30
    rst  $38
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   a, [label_2F2E]
    cpl
    jr   z, label_99172
    rst  $30
    ld   a, [$F8FA]

label_99172::
    inc  b
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    jr   c, label_9917D
    rst  $38
    rst  $38
    jr   c, label_991C0
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    ld   c, [hl]
    rst  $38
    ld   a, [label_38F8]
    db   $3A ; ldd  a, [hl]
    ld   b, [hl]
    or   $39
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld    hl, sp+$04
    dec  a
    ld   c, [hl]
    ld   c, $37
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    inc  b
    inc  b
    push af
    jr   c, label_991E2
    ld   c, $37
    ld   a, [rIE]
    push af
    ld   sp, hl
    ld   a, [label_3B38]
    ld   c, $33
    inc  a
    ei
    ld   a, [label_2F2F]
    cpl
    ld   c, [hl]
    ld   c, $0E
    ld   c, $33
    cpl
    cpl
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf

label_991C0::
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   h, $04
    ld   b, a
    ccf
    ld   c, $2B
    inc  l
    inc  l
    inc  l
    inc  l
    db   $3A ; ldd  a, [hl]
    ld   [$FF3F], a
    ld   a, [bc]
    inc  sp
    cpl
    inc  [hl]
    ld   a, [bc]
    ld   a, [bc]
    inc  sp
    db   $3A ; ldd  a, [hl]
    ld   [$FF3B], a
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $FB
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_991E8::
    ld   a, [label_27F8]
    jr   z, label_991E8
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    rst  $30
    ld    hl, sp+$04
    inc  b
    push af
    ld   sp, hl
    rst  $38
    rst  $38
    rst  $38
    or   $04
    inc  b
    push af
    ld   sp, hl
    rst  $38
    rst  $38
    rst  $38
    ld   a, [label_2F2F]
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
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    cpl
    inc  [hl]
    ld   a, [bc]
    ld   a, [bc]
    inc  sp
    cpl
    inc  [hl]
    ld   a, [bc]
    ld   a, [bc]
    inc  sp
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  b
    rst  $30
    ld   a, [bc]
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [label_4F8]
    inc  b
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    ld   a, [label_3DF8]
    cpl
    cpl
    cpl
    cpl
    ld   a, [$F8FA]
    inc  b
    push af
    jr   c, label_9925D
    ld   c, $0E
    ld   c, $2F
    cpl
    cpl
    cpl
    cpl
    inc  [hl]
    ld   c, $0E
    dec  hl
    inc  l
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    scf
    dec  h
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    ld   sp, label_2F27
    inc  [hl]
    inc  sp
    cpl
    inc  [hl]
    inc  sp
    cpl
    inc  [hl]
    scf
    db   $E8 ; add  sp, d
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  sp
    cpl
    ld   a, [rIE]
    ld   a, [label_AFA]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    cpl
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    inc  a
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    inc  sp
    cpl
    inc  a
    rst  $30
    inc  l
    ld   [$FF2C], a
    dec  l
    ld   c, $0E
    ld   c, $0E
    scf
    inc  b
    ld   h, $04
    rst  $30
    jr   c, label_992BF
    ld   c, $0E
    ld   c, $2E
    inc  a
    jr   z, label_992BC
    inc  b
    ldd  [hl], a
    inc  l
    inc  l

label_992BC::
    dec  l
    ld   c, $3E

label_992BF::
    scf
    jr   c, label_992F9

label_992C2::
    db   $E8 ; add  sp, d
    jr   c, label_992BE
    scf
    db   $E8 ; add  sp, d
    jr   c, label_992C2
    scf
    inc  [hl]
    inc  sp
    cpl
    inc  [hl]
    ld   a, [bc]
    inc  sp
    cpl
    inc  [hl]
    ld   a, [bc]
    inc  sp
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [label_A0A]
    ld   a, [bc]
    rst  $38
    ld   a, [bc]
    rst  $38
    ld   a, [$F8FF]
    inc  b
    rst  $30
    ld   a, [$FAFF]
    ld   a, [label_3DF8]
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    inc  b
    jr   c, label_99303
    ld   c, $0E
    ld   c, $0E

label_992F9::
    ld   c, $0E
    ld   c, $3D
    ld   c, [hl]
    jp   [hl]
    jp   [hl]
    jp   [hl]
    ld   c, c
    inc  a

label_99303::
    ld   c, $0E
    ld   c, $38
    ccf
    jp   [hl]
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    ld   l, $2F
    cpl
    cpl
    db   $E8 ; add  sp, d
    jr   c, label_99312
    ld    hl, sp+$37
    db   $E8 ; add  sp, d
    jr   c, label_9931C
    inc  b
    inc  b
    cpl
    inc  [hl]

label_9931C::
    db   $FC ; Undefined instruction
    inc  b
    inc  sp
    cpl
    inc  [hl]
    ld   sp, hl
    or   $04
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [label_AF9]
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    ld    hl, sp+$04
    ei
    rst  $38
    ld   a, [$FAFF]
    ld   a, [label_2FFF]
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
    ld   c, $3D
    ld   c, b
    jp   [hl]
    jp   [hl]
    ld   c, c
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    push af
    rst  $38
    ld    hl, sp+$38
    ld   c, $2B
    ld   sp, label_404
    dec  h
    ei
    ld    hl, sp+$04
    jr   c, label_9937D
    scf
    inc  b
    inc  b
    inc  b
    daa
    db   $FC ; Undefined instruction
    dec  a
    ld   [$FF34], a
    ld   c, $37
    inc  b
    inc  b
    inc  b

label_9937D::
    dec  h
    ld    hl, sp+$38
    ld   c, $0E
    ld   c, $37
    inc  b
    inc  b
    inc  b
    daa
    cpl
    inc  [hl]
    jp   z, label_CACA
    inc  sp
    cpl
    cpl
    cpl
    cpl
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
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
    ld   a, [hli]
    or   [hl]
    or   a
    ld   h, [hl]
    rst  $38
    db   $FC ; Undefined instruction
    jr   c, label_993C6
    ld   c, $38
    jr   z, label_99417
    ldh  [$FF0C], a
    ld   e, e
    ld   a, [bc]
    ld    hl, sp+$38
    ld   c, $0E
    jr   c, label_993EB
    ld   a, [bc]

label_993C6::
    ld   a, [bc]
    call nc, label_3DF8
    inc  [hl]
    ld   c, $0E
    jr   c, label_993F7
    inc  b
    inc  b
    inc  b
    inc  b
    jr   c, label_993E3
    ld   c, $0E
    jr   c, label_99408
    cpl
    cpl
    cpl
    ld   [$FF34], a
    ld   c, $0E
    ld   c, $38
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $38
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]

label_993F7::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    scf
    add  a, d
    add  a, e
    adc  a, [hl]
    inc  b
    inc  b
    rst  $30
    db   $FC ; Undefined instruction

label_99408::
    adc  a, a
    add  a, d
    scf
    add  hl, hl
    ld   a, [hli]
    add  a, a
    ld   [label_404], sp
    rst  $30
    adc  a, l
    add  a, h
    scf
    add  a, d
    add  a, e

label_99417::
    add  a, a
    or   $04
    inc  b
    ld   [label_444], sp
    scf
    sub  a, b
    sub  a, b
    adc  a, d
    add  a, l
    adc  a, [hl]
    inc  b
    adc  a, a
    add  a, l
    add  a, l
    scf
    adc  a, b
    add  a, h
    add  a, h
    add  a, h
    adc  a, h
    db   $E8 ; add  sp, d
    adc  a, l
    add  a, h
    add  a, h
    scf
    add  a, a
    ld   [label_99C5C], sp
    ld   e, h
    inc  b
    inc  b
    inc  b
    rst  $30
    scf
    add  a, a
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    scf
    add  a, a
    ld   b, h
    inc  b
    inc  b
    ld   a, [bc]
    adc  a, a
    add  a, l
    add  a, l
    add  a, l
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    adc  a, c
    adc  a, b
    add  a, h
    add  a, h
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    add  a, [hl]
    add  a, a
    ld   [$8504], sp
    add  a, l
    adc  a, [hl]
    ld   e, h
    and  b
    ld   e, h
    adc  a, l
    adc  a, h
    ld   b, h
    inc  b
    add  a, h
    adc  a, c
    add  a, a
    inc  b
    ld   e, h
    inc  b
    inc  b
    db   $E8 ; add  sp, d
    inc  b
    inc  b
    ld   sp, hl
    add  a, [hl]
    add  a, a
    inc  b
    inc  b
    inc  b
    inc  b
    db   $E8 ; add  sp, d
    adc  a, a
    add  a, l
    rst  $30
    add  a, [hl]
    add  a, a
    inc  b
    inc  b
    ld   [$8F0A], sp
    add  hl, hl
    ld   a, [hli]
    add  a, l
    adc  a, e
    add  a, a
    ld   b, h
    inc  b
    inc  b
    ld   a, [bc]
    add  a, [hl]

label_9949E::
    add  a, d
    add  hl, hl
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, h
    adc  a, c
    adc  a, b
    sub  a, d
    adc  a, c
    sub  a, b
    adc  a, b
    add  a, h
    add  a, h
    add  a, h
    ld   a, [bc]
    add  a, [hl]
    add  a, a
    db   $E4 ; Undefined instruction
    add  a, [hl]
    sub  a, b
    add  a, a
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    adc  a, l
    adc  a, h
    db   $E3 ; Undefined instruction
    adc  a, l
    add  a, h
    adc  a, h
    inc  b
    inc  b
    inc  b
    rst  $30
    ld   a, [bc]
    jr   nz, label_994D0
    jr   nz, label_994D2
    inc  b
    ld   a, [bc]

label_994D0::
    adc  a, a
    add  a, l

label_994D2::
    adc  a, [hl]
    ld   [label_2004], sp
    inc  b
    inc  b
    ld   b, h
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    adc  a, d
    adc  a, [hl]
    inc  b
    inc  b
    ld   b, h
    ld   a, [bc]
    adc  a, a
    add  a, l
    adc  a, e
    add  a, d
    ld   a, [hli]
    add  a, a
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  hl, hl
    ld   a, [hli]
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    adc  a, c
    add  a, d
    add  hl, hl
    inc  b
    inc  b
    inc  b
    inc  b
    rst  $30
    ld   a, [$8DF6]
    add  hl, hl
    ld   a, [hli]
    inc  b
    ld   [label_444], sp
    inc  b
    inc  b
    rst  $30
    ld    hl, sp+$27
    jr   z, label_9949E
    adc  a, [hl]
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, h
    inc  b
    ld   [label_2A04], sp
    add  a, a
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  b
    inc  b
    add  a, e
    adc  a, d
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    adc  a, [hl]
    ld   a, [bc]
    ld   [label_292A], sp
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $25

label_99540::
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $04
    inc  b
    dec  h
    ld   a, [hli]
    add  hl, hl

label_99549::
    ld   a, [hli]
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    jr   z, label_99553
    inc  b
    daa

label_99551::
    jr   z, label_9957A

label_99553::
    jr   z, label_9957E
    ld   a, [hli]
    jr   z, label_99540
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    jr   nz, label_99551
    ld   sp, hl
    ld   sp, hl
    daa
    jr   z, label_99549
    db   $E8 ; add  sp, d
    ld   a, [bc]
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   b, h
    rst  $38
    rst  $38
    inc  b
    inc  b
    db   $E8 ; add  sp, d
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    db   $E8 ; add  sp, d
    ei
    rst  $38
    ld   a, [label_B0B]
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ld   a, [bc]
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    ei

label_9957A::
    ld   b, h
    dec  h
    rst  $30
    dec  bc

label_9957E::
    dec  bc
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    push af
    rst  $38
    ld    hl, sp+$27
    ld   h, $FB
    dec  bc
    or   $04
    push af
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    dec  h
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    daa
    jr   z, label_995C4
    add  hl, hl
    ld   a, [hli]

label_9959F::
    jr   z, label_995C8
    jr   z, label_995CA
    jr   z, label_995E9
    or   $D4
    daa

label_995A8::
    jr   z, label_9959F
    ld   sp, hl
    ld   d, d
    ld   d, d
    ld   d, d
    rst  $38
    ld    hl, sp+$04
    jr   nz, label_995A8
    ld   a, [label_99BFF]
    ldh  [$FF0C], a
    ld   e, e
    ld    hl, sp+$04
    dec  a
    cpl
    ld   [$FF3C], a
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   h, $20

label_995C4::
    jr   c, label_995E1
    dec  de
    scf

label_995C8::
    ld   a, [bc]
    ld   a, [bc]

label_995CA::
    ld   a, [bc]
    dec  h
    jr   z, label_995D8
    ldd  [hl], a
    inc  l
    inc  l
    ld   sp, $FF0A
    db   $FC ; Undefined instruction
    daa
    ld   h, $FB

label_995D8::
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    rst  $38
    ld   b, h
    dec  h
    add  hl, hl

label_995E1::
    ld   h, $FB
    rst  $38
    ld    hl, sp+$04
    inc  b
    daa
    jr   z, label_99611
    daa
    jr   z, label_995F7
    db   $FC ; Undefined instruction
    or   [hl]
    or   a
    inc  b
    inc  b
    or   [hl]
    or   a
    dec  h
    ld   h, $0A

label_995F7::
    ld   a, [bc]
    call label_4CE
    inc  b
    call label_27CE
    jr   z, label_9960B
    add  hl, bc
    add  hl, bc
    add  hl, bc
    or   [hl]
    or   a
    inc  bc
    inc  bc
    ld   a, [bc]
    jr   nz, label_99614

label_9960B::
    add  hl, bc
    inc  b
    inc  b
    call label_3CE

label_99611::
    or   [hl]

label_99612::
    ld   h, $09

label_99614::
    inc  b
    or   [hl]
    or   a
    inc  b
    inc  bc
    inc  bc
    inc  b
    call label_428
    inc  b
    call label_4CE
    inc  b
    add  hl, bc
    add  hl, bc
    inc  b
    ld   h, $03
    inc  bc
    inc  b
    inc  b
    or   [hl]
    or   a
    inc  b
    inc  b
    or   [hl]
    jr   z, label_99659
    jr   z, label_9965B
    jr   z, label_9965D
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    or   [hl]
    or   a
    inc  b
    inc  b
    inc  b
    add  hl, bc
    daa
    add  hl, hl
    ld   a, [hli]
    jr   z, label_99612
    adc  a, $E8
    add  hl, bc
    inc  b
    or   [hl]
    or   a
    daa
    add  hl, hl
    ld   h, $03
    inc  bc
    inc  bc
    inc  bc
    inc  b
    call label_4CE
    daa
    jr   z, label_99610

label_99659::
    inc  b
    inc  b

label_9965B::
    inc  b
    add  hl, bc

label_9965D::
    add  hl, bc
    inc  b
    inc  bc
    dec  h
    ld   h, $CE
    inc  b
    or   [hl]
    or   a
    inc  b
    db   $E8 ; add  sp, d
    inc  bc
    inc  bc
    daa
    jr   z, label_99671
    inc  b
    call label_3CE

label_99671::
    inc  bc
    inc  b
    add  hl, bc
    dec  h
    ld   h, $B7
    inc  b
    inc  bc
    inc  bc
    add  hl, bc
    add  hl, bc
    inc  b
    inc  bc
    daa
    jr   z, label_996A9
    inc  b
    jr   c, label_996BF
    ld   c, $9B
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    dec  a
    cpl
    ld   c, [hl]
    ld   c, $0E
    sbc  a, d
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    jr   c, label_996D0
    dec  sp
    ld   c, $0E
    sbc  a, d
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    jr   c, label_996AE
    ld   c, $0E
    ld   c, $9A
    inc  b
    push af
    ld   sp, hl
    rst  $38
    jr   c, label_996B8
    sbc  a, e
    sbc  a, c
    sbc  a, c
    sbc  a, [hl]

label_996AE::
    inc  b
    ei
    rst  $38
    ld   a, [label_E38]
    sbc  a, d
    sub  a, [hl]
    sub  a, [hl]
    sbc  a, b

label_996B8::
    push af
    rst  $38
    ld    hl, sp+$9B
    jr   c, label_996CC
    sbc  a, d

label_996BF::
    sub  a, e
    sub  a, e
    sub  a, l
    ei
    ld    hl, sp+$9B
    sbc  a, d
    jr   c, label_996D6
    sbc  a, d
    dec  h
    ld   h, $F5

label_996CC::
    db   $FC ; Undefined instruction
    inc  b
    sbc  a, d
    sbc  a, d

label_996D0::
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c

label_996D6::
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    ld   sp, hl
    rst  $38
    ld    hl, sp+$04
    rst  $30
    ld    hl, sp+$04
    rst  $30
    rst  $38
    ld   b, h
    rst  $38
    ld    hl, sp+$25
    ld   h, $25
    ld   h, $C6
    inc  b
    rst  $30
    ld   a, [$9999]
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
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
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, h
    dec  h
    ld   h, $25
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sbc  a, d
    daa
    jr   z, label_9975B
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sbc  a, d
    ld   b, h
    db   $D3 ; Undefined instruction
    ld   b, h
    ld   sp, hl
    rst  $38
    or   $04
    inc  b
    rst  $30
    sbc  a, d
    ld   b, h
    ld   b, h
    ld   b, h
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    or   $04
    sbc  a, l
    sbc  a, c
    sbc  a, c
    sbc  a, h
    sbc  a, h
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    or   $97
    sub  a, [hl]
    sub  a, [hl]

label_9975B::
    sbc  a, d
    sbc  a, d
    sbc  a, h
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    sub  a, h
    sub  a, e
    sub  a, e
    sbc  a, d
    sbc  a, d
    sbc  a, d
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    or   $9A
    ld   h, $04
    inc  b
    dec  h
    ld   b, l
    ld   h, $38
    ld   c, $39
    scf
    jr   z, label_99780
    inc  b
    daa
    pop  hl
    jr   z, label_997B9
    ld   c, $0E
    scf
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    push af
    jr   c, label_9979A
    ld   c, $37
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ei
    jr   c, label_997A4
    ld   c, $37
    dec  h
    ld   h, $04
    inc  b
    inc  b
    ei
    jr   c, label_997AE
    ld   c, $37
    daa
    jr   z, label_997A9
    inc  b
    push af
    rst  $38
    jr   c, label_997B8
    ld   c, $37
    dec  h
    ld   h, $04
    inc  b
    ei
    db   $FC ; Undefined instruction
    jr   c, label_997C2
    ld   c, $37
    daa
    jr   z, label_997BD

label_997B9::
    push af
    rst  $38
    db   $FC ; Undefined instruction
    jr   c, label_997CC
    ld   c, $37
    jr   c, label_99801

label_997C2::
    jp   [hl]

label_997C3::
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_99807

label_997CC::
    jp   [hl]

label_997CD::
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_997C3
    db   $ED ; Undefined instruction

label_997D7::
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_997CD
    db   $ED ; Undefined instruction

label_997E1::
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction

label_997E7::
    db   $EB ; Undefined instruction
    jr   c, label_997D7
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $EB ; Undefined instruction

label_997F1::
    db   $EB ; Undefined instruction
    jr   c, label_997E1
    db   $ED ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_997E7
    jp   [hl]
    dec  hl
    inc  l

label_99801::
    inc  l
    dec  l
    jp   [hl]
    jp   [hl]
    dec  hl
    jr   c, label_997F1
    jp   [hl]
    ld   l, $2F
    cpl
    ld   c, [hl]
    jp   [hl]
    jp   [hl]
    ld   l, $3A
    ccf
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    db   $3A ; ldd  a, [hl]
    jp   [hl]
    jp   [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    or   [hl]
    or   a
    or   [hl]
    or   a
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    call label_98F21
    adc  a, $EB
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    call label_EBCE
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $EB ; Undefined instruction
    inc  l
    dec  l
    or   [hl]
    or   a
    or   [hl]
    or   a
    or   [hl]
    or   a
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    cpl
    ld   c, [hl]
    call label_CDCE
    adc  a, $CD
    adc  a, $B6
    or   a
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
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    call label_EBCE
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    or   [hl]
    or   a
    or   [hl]

label_99890::
    or   a
    or   [hl]
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    call label_CDCE
    adc  a, $CD
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    or   [hl]
    or   a
    or   [hl]
    or   a
    ret  z
    or   [hl]
    or   a
    or   [hl]

label_998AE::
    or   a
    or   [hl]
    db   $3A ; ldd  a, [hl]

label_998B1::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf

label_998BA::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_998BA
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_99890
    or   [hl]
    or   a
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EE
    ret  z
    db   $ED ; Undefined instruction
    jr   c, label_998B1
    call label_EDCE
    db   $ED ; Undefined instruction
    ret  z
    db   $EC ; Undefined instruction
    xor  $EE
    jr   c, label_998D8
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_998AE
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_99938
    add  a, a
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    add  a, [hl]
    adc  a, b
    sub  a, d
    adc  a, c
    scf
    add  a, a
    ld   [label_404], sp
    ld   a, [bc]
    add  a, [hl]
    add  a, a
    db   $E4 ; Undefined instruction
    add  a, [hl]
    scf
    add  a, a
    inc  b
    ld   e, h
    inc  b
    ld   a, [bc]
    adc  a, l
    adc  a, h
    db   $E3 ; Undefined instruction
    add  a, [hl]
    scf
    add  a, a
    inc  b
    ld   e, h
    ld   b, h
    rst  $30
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    add  a, [hl]
    scf
    add  a, a
    ld   [label_45C], sp
    ld   b, h
    rst  $30
    ld    hl, sp+$04
    add  a, [hl]
    scf
    adc  a, d
    add  a, l
    adc  a, [hl]
    inc  b
    inc  b

label_99938::
    inc  b
    inc  b
    ld   b, h
    add  a, [hl]
    scf
    add  hl, hl
    ld   a, [hli]
    add  a, a
    ld   [label_404], sp

label_99943::
    inc  b
    inc  b
    add  a, [hl]
    scf
    add  a, d
    add  a, e
    adc  a, d
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    adc  a, e
    sub  a, b
    adc  a, b
    adc  a, h
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    add  a, [hl]
    sub  a, b
    add  a, d
    adc  a, b
    adc  a, h
    inc  b
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    adc  a, l
    adc  a, c
    add  hl, hl
    add  a, a
    ld   [label_99C04], sp
    ld   e, h
    inc  b
    inc  b
    ld   b, h
    add  a, [hl]
    add  a, d
    add  a, a
    inc  b
    ld   e, h
    dec  h
    ld   h, $5C
    ld   b, h
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    add  a, a
    inc  b
    ld   e, h
    daa
    jr   z, label_999DA
    inc  b
    ld   a, [bc]
    add  a, [hl]
    add  a, d
    add  a, a
    inc  b
    inc  b
    ld   e, h
    ld   e, h
    inc  b
    ld   a, [bc]
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    add  a, a
    inc  b
    inc  b
    ld   b, h
    ld   [label_A04], sp
    adc  a, a
    adc  a, e
    add  a, d
    adc  a, d
    add  a, l
    adc  a, [hl]
    inc  b
    inc  b
    ld   a, [bc]
    ld   a, [bc]
    add  a, [hl]
    sub  a, b
    add  hl, hl
    add  a, e
    add  a, a
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    add  a, [hl]
    add  a, d
    add  a, e
    add  a, d
    ld   a, [hli]
    add  a, a
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    adc  a, l
    add  a, h
    adc  a, c
    add  hl, hl
    add  a, e
    add  a, a
    inc  b
    inc  b
    ld   [label_A04], sp
    jr   nz, label_99943
    add  a, d
    ld   a, [hli]
    add  a, a
    inc  b
    ld   b, h
    ld   b, h
    ld   b, h
    inc  b
    inc  b
    add  a, [hl]
    add  hl, hl
    add  a, e
    add  a, a
    inc  b
    ld   b, h
    ld   b, h
    ld   b, h
    inc  b
    inc  b
    add  a, [hl]
    add  a, d
    ld   a, [hli]
    add  a, a
    ld   a, [bc]
    ld   b, h
    ld   b, h
    ld   b, h
    ld   [$8D04], sp
    add  a, h
    add  a, e
    add  a, a
    ld   a, [bc]
    ld   a, [bc]
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   [$872A], sp
    ld   [label_40A], sp
    adc  a, a
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    add  a, e
    add  a, d
    ld   a, [hli]
    adc  a, b
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    adc  a, c
    add  hl, hl
    add  a, e
    add  a, a
    ld   a, [bc]
    dec  a
    cpl
    cpl
    inc  a
    ld   a, [bc]
    add  a, [hl]
    add  a, d
    ld   a, [hli]
    add  a, a
    ld   a, [bc]
    jr   c, label_99A21
    ld   c, $37
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    add  a, e
    add  a, a
    ld   a, [bc]
    ldd  [hl], a
    inc  l
    inc  l
    ld   sp, $860A

label_99A21::
    add  a, d
    add  a, h
    adc  a, h
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    rst  $30
    db   $FD ; Undefined instruction
    ld   a, [label_A0A]
    ld   a, [bc]
    ld   a, [bc]
    ld    hl, sp+$86
    add  a, d
    add  a, l
    add  a, l
    adc  a, [hl]

label_99A39::
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld    hl, sp+$8F
    adc  a, e
    add  hl, hl
    jr   z, label_99A39
    dec  bc
    ld   a, [$FFF9]
    ld   a, [label_4F8]
    daa
    ld   h, $04
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    inc  b
    dec  h
    jr   z, label_99A93
    cpl
    cpl
    cpl
    inc  a
    inc  b
    dec  bc
    inc  b
    daa
    ld   h, $38
    ld   c, $0E
    ld   c, $37
    inc  b
    dec  bc
    inc  b
    dec  h
    jr   z, label_99AA2
    ld   c, $0E
    ld   c, $37
    inc  b
    dec  bc
    inc  b
    daa
    ld   h, $32
    dec  l
    ld   c, $0E
    scf
    inc  b
    dec  bc
    inc  b
    dec  h
    add  hl, hl
    ld   h, $32
    inc  l
    inc  l
    ld   sp, label_B04
    inc  b
    daa
    ld   a, [hli]
    add  hl, hl
    ld   h, $25
    ld   h, $04
    inc  b
    dec  bc
    inc  b
    dec  h
    jr   z, label_99A89
    ld   b, h

label_99A93::
    ld   a, [label_4F8]
    rst  $30
    ld   a, [label_27F8]
    ld   h, $25
    ld   h, $04
    add  hl, bc
    add  hl, bc
    inc  b
    inc  b

label_99AA2::
    inc  b
    dec  h
    jr   z, label_99ACD
    jr   z, label_99AAC
    jr   nz, label_99AAE
    dec  h
    ld   h, $04
    daa

label_99AAE::
    ld   h, $04
    dec  h
    ld   h, $04
    jr   nz, label_99ADC
    jr   z, label_99ADC
    ld   h, $28
    add  hl, bc
    daa
    jr   z, label_99AC6
    inc  bc
    inc  bc
    inc  b
    daa
    jr   z, label_99AE9
    inc  b
    add  hl, bc
    add  hl, bc

label_99AC6::
    inc  bc
    inc  b
    inc  b
    inc  b
    inc  b
    add  hl, bc
    add  hl, hl

label_99ACD::
    ld   h, $E8
    inc  bc
    inc  bc
    inc  bc
    inc  b
    add  hl, bc
    add  hl, bc
    inc  b
    ld   a, [hli]
    add  hl, hl
    ld   h, $25
    ld   h, $25

label_99ADC::
    ld   h, $F5
    or   $25
    jr   z, label_99AEB
    inc  bc
    inc  bc
    inc  b
    call label_4CE
    add  hl, bc

label_99AE9::
    call label_426
    inc  b
    inc  b
    push af
    or   $B6
    or   a
    inc  b
    add  hl, bc
    jr   z, label_99AFA
    or   [hl]
    or   a
    rst  $30
    ld    hl, sp+$CD
    adc  a, $F5
    or   $B6
    or   a
    call label_B6CE
    or   a
    db   $E8 ; add  sp, d
    inc  b
    rst  $30
    rst  $38
    call label_9CE
    db   $E8 ; add  sp, d
    call label_3CE
    inc  bc
    inc  bc
    rst  $30
    add  hl, bc
    add  hl, bc
    inc  bc
    inc  bc
    inc  b
    inc  b
    add  hl, bc
    add  hl, bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  b
    add  hl, bc
    add  hl, bc
    inc  b
    inc  b
    inc  b
    inc  b
    call label_2526
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    adc  a, $04
    inc  b
    inc  b
    inc  bc
    inc  bc
    inc  bc
    inc  b
    dec  h
    ld   h, $09

label_99B3B::
    add  hl, bc
    inc  b
    inc  bc
    add  hl, bc
    inc  b
    inc  bc
    inc  bc
    daa
    jr   z, label_99B49
    inc  bc
    or   [hl]
    or   a
    inc  b

label_99B49::
    inc  bc
    inc  bc
    add  hl, bc
    dec  h
    ld   h, $F6
    inc  b
    call label_3CE
    inc  bc
    inc  b

label_99B55::
    inc  b
    daa
    jr   z, label_99B51
    inc  b
    add  hl, bc
    add  hl, bc
    inc  bc
    or   [hl]
    or   a
    inc  b
    dec  h
    ld   h, $B7
    add  hl, bc
    inc  bc
    inc  bc
    add  hl, bc
    call label_9CE
    daa
    jr   z, label_99B3B
    inc  bc
    add  hl, bc
    inc  bc
    or   $04
    inc  bc
    inc  bc
    dec  h
    ld   h, $26
    dec  h
    ld   h, $FB
    db   $FC ; Undefined instruction
    dec  h
    ld   h, $25
    ld   a, [hli]
    jr   z, label_99BB9

label_99B81::
    ld   c, $9A
    daa
    jr   z, label_99B81
    rst  $38
    or   $9A
    sbc  a, l
    jr   c, label_99B9A
    sbc  a, d
    dec  h
    ld   h, $FB
    rst  $38
    rst  $38
    sbc  a, d
    sub  a, a
    jr   c, label_99BA4
    sbc  a, d
    daa
    jr   z, label_99B95

label_99B9A::
    rst  $38
    rst  $38
    sbc  a, d
    sub  a, h
    jr   c, label_99BAE
    sbc  a, l
    sbc  a, h
    push af
    ld   b, h

label_99BA4::
    rst  $38
    db   $FC ; Undefined instruction
    sbc  a, d
    dec  c
    jr   c, label_99BB8
    sub  a, a
    sbc  a, d
    ei
    rst  $38

label_99BAE::
    rst  $38
    ld    hl, sp+$9A
    dec  c
    jr   c, label_99BC2
    sub  a, h
    sbc  a, d
    ei
    rst  $38

label_99BB8::
    db   $FC ; Undefined instruction

label_99BB9::
    jr   nz, label_99B55
    dec  c
    jr   c, label_99BCC
    ld   c, $9A
    ld   b, h
    rst  $38

label_99BC2::
    ld    hl, sp+$20
    sbc  a, d
    dec  c
    jr   c, label_99BD6
    ld   c, $9A
    rst  $38
    db   $FC ; Undefined instruction

label_99BCC::
    dec  h
    ld   h, $9D
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, h
    inc  c
    inc  c

label_99BD6::
    inc  c
    sbc  a, e
    sbc  a, c
    sbc  a, c
    and  h
    and  l
    and  [hl]
    sbc  a, l
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    and  a
    db   $E3 ; Undefined instruction
    xor  b
    or   a
    and  h
    and  l
    and  [hl]
    or   a
    sub  a, e
    sub  a, e
    dec  c
    dec  c
    dec  c
    and  d
    and  a
    db   $E3 ; Undefined instruction
    xor  b
    and  d
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    or   [hl]
    dec  c
    dec  c
    dec  c

label_99BFF::
    or   [hl]
    dec  c
    dec  c
    dec  c
    dec  c

label_99C04::
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c

label_99C0A::
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, h
    dec  c
    dec  c
    dec  c
    sbc  a, e
    sbc  a, c
    sbc  a, c
    sbc  a, [hl]
    sbc  a, d
    ei
    rst  $38
    rst  $38
    ld   a, [rIE]
    db   $FC ; Undefined instruction
    sbc  a, d
    sbc  a, b
    sbc  a, d
    ei
    rst  $38
    ld    hl, sp+$E8
    rst  $30
    rst  $38
    rst  $38
    sbc  a, d
    sub  a, l
    sbc  a, d
    rst  $30
    ld    hl, sp+$04
    inc  b
    inc  b
    rst  $30
    ld    hl, sp+$9A
    dec  c
    sbc  a, d
    db   $E8 ; add  sp, d
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    db   $E8 ; add  sp, d
    sbc  a, d
    dec  c
    sbc  a, d
    or   $04
    inc  b
    db   $E8 ; add  sp, d
    inc  b
    inc  b
    push af
    sbc  a, d
    dec  c
    sbc  a, d
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ei
    sbc  a, d

label_99C5C::
    dec  c
    sbc  a, d
    ld    hl, sp+$E8
    push af
    ld   sp, hl
    or   $E8
    ei
    sbc  a, d
    sbc  a, c
    sbc  a, [hl]
    dec  h
    ld   h, $F7
    rst  $38
    rst  $38
    sbc  a, e
    sbc  a, c
    sbc  a, [hl]
    dec  h
    ld   h, $04
    ei
    rst  $38
    ld    hl, sp+$38
    ld   c, $0E
    scf
    daa
    jr   z, label_99C72
    ld   b, h
    ld    hl, sp+$04
    jr   c, label_99C90
    ld   c, $37
    dec  h
    ld   h, $FB
    db   $FC ; Undefined instruction
    dec  a
    cpl
    inc  [hl]
    ld   c, $0E
    scf
    daa
    jr   z, label_99C8C
    db   $FC ; Undefined instruction
    jr   c, label_99CA2
    ld   c, $0E
    ld   c, $37
    dec  h
    ld   h, $FB
    db   $FC ; Undefined instruction
    jr   c, label_99CAC
    ld   c, $0E

label_99CA0::
    ld   c, $37

label_99CA2::
    daa
    jr   z, label_99CA0
    ld    hl, sp+$38
    ld   c, $0E
    ld   c, $0E

label_99CAB::
    scf

label_99CAC::
    dec  h
    ld   h, $FE
    inc  b
    ldd  [hl], a

label_99CB1::
    inc  l
    dec  l
    ld   c, $0E
    scf
    daa
    jr   z, label_99CB1

label_99CB9::
    inc  b
    dec  h
    ld   h, $38
    ld   c, $0E

label_99CBF::
    scf
    jr   c, label_99CAB
    jp   [hl]

label_99CC3::
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    ccf
    jp   [hl]
    jp   [hl]

label_99CC9::
    add  hl, sp
    jr   c, label_99CB9
    db   $ED ; Undefined instruction

label_99CCD::
    scf
    inc  b
    inc  b
    jr   c, label_99CBF
    db   $EB ; Undefined instruction

label_99CD3::
    db   $EB ; Undefined instruction
    jr   c, label_99CC3
    db   $ED ; Undefined instruction

label_99CD7::
    scf
    and  b
    inc  b
    jr   c, label_99CC9
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_99CCD
    db   $ED ; Undefined instruction

label_99CE1::
    scf
    inc  b
    inc  b
    jr   c, label_99CD3
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_99CD7
    db   $ED ; Undefined instruction
    inc  sp
    ld   c, b
    ld   [$FF34], a
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_99CE1
    db   $ED ; Undefined instruction
    db   $EB ; Undefined instruction

label_99CF6::
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction

label_99CF8::
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_99CE9
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    or   [hl]
    or   a
    jr   c, label_99CBE
    or   a
    or   [hl]
    or   a
    or   [hl]
    or   a
    or   [hl]

label_99D0E::
    ld   c, a
    ld   hl, label_3B3A
    dec  hl
    inc  l
    inc  l
    inc  l
    inc  l
    dec  l

label_99D18::
    call label_EBCE
    db   $ED ; Undefined instruction
    scf
    inc  b
    ld   l, a
    inc  b
    and  b
    jr   c, label_99D0E
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    inc  sp
    inc  a
    inc  b
    inc  b
    inc  b
    jr   c, label_99D18
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    inc  sp
    ld   c, b
    ld   [rOBP1], a
    inc  [hl]
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    or   [hl]
    or   a
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    ld   c, a
    ld   hl, $B6B7
    or   a
    or   [hl]
    or   a
    or   [hl]
    or   a
    or   [hl]
    call label_CDCE
    adc  a, $C8
    call label_CDCE
    adc  a, $CD
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction

label_99D83::
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    dec  hl
    inc  l
    inc  l
    dec  l
    db   $EB ; Undefined instruction

label_99D8E::
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    scf
    inc  b
    inc  b
    jr   c, label_99D83
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    ret  z
    db   $EB ; Undefined instruction
    db   $EC ; Undefined instruction
    scf
    inc  b
    inc  b
    jr   c, label_99D8E
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction

label_99DA6::
    or   a
    inc  sp
    cpl
    cpl
    inc  [hl]
    or   [hl]
    or   a
    or   [hl]

label_99DAE::
    or   a
    or   [hl]

label_99DB0::
    adc  a, $ED
    db   $ED ; Undefined instruction
    xor  $EE
    xor  $EB
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_99DA6
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    or   [hl]
    or   a
    or   [hl]
    or   a
    ret  z
    db   $ED ; Undefined instruction
    jr   c, label_99DB0
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    call label_98F21
    adc  a, $C8
    db   $ED ; Undefined instruction
    jr   c, label_99DBA
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    call label_EDCE
    xor  $EE
    jr   c, label_99DC4
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $B6
    or   a
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_99DCE
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    or   [hl]
    ld   c, a
    ld   hl, $C8B7
    db   $ED ; Undefined instruction
    jr   c, label_99DD8
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    call label_98F21
    adc  a, $C8
    db   $ED ; Undefined instruction
    jr   c, label_99DAE
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    call label_EDCE
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_99E38
    add  hl, hl
    ld   a, [hli]
    sub  a, b
    adc  a, b
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    add  a, h
    scf
    add  a, d
    add  hl, hl
    ld   a, [hli]
    add  a, a
    ld   [label_404], sp
    inc  b
    inc  b
    scf
    add  hl, hl
    ld   a, [hli]
    add  a, e
    add  a, a
    ld   b, h
    inc  b
    inc  b
    inc  b
    ld   b, h
    scf
    add  a, d
    add  hl, hl
    ld   a, [hli]
    add  a, a
    inc  b
    ld   [$8F04], sp
    add  a, l
    scf
    sub  a, b
    add  a, d
    add  a, e
    add  a, a
    inc  b
    inc  b
    inc  b
    add  a, [hl]
    add  hl, hl
    scf
    add  hl, hl
    ld   a, [hli]
    adc  a, b
    adc  a, h
    inc  b

label_99E38::
    ld   b, h
    inc  b
    add  a, [hl]
    add  a, d
    scf
    add  a, d
    add  a, e
    add  a, a
    inc  b
    ld   [label_404], sp
    adc  a, l
    add  a, h
    scf
    add  hl, hl
    ld   a, [hli]
    add  a, a
    or   $04
    inc  b
    inc  b
    inc  b
    inc  b
    add  a, h
    add  a, h
    adc  a, h
    inc  b
    inc  b
    inc  b
    inc  b
    add  a, [hl]
    add  hl, hl
    ld   a, [hli]
    rst  $30
    ld   a, [bc]
    inc  b
    ld   [label_404], sp
    inc  b
    add  a, [hl]
    add  a, d
    add  hl, hl
    inc  b
    ld   a, [bc]
    ld   a, [bc]
    inc  b
    inc  b
    inc  b
    inc  b
    add  a, [hl]
    add  hl, hl
    ld   a, [hli]
    add  a, l
    add  a, l
    add  a, l
    adc  a, [hl]
    inc  b
    inc  b
    ld   e, h
    add  a, [hl]
    add  a, d
    add  a, e
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  a, a
    ld   b, h
    inc  b
    inc  b
    adc  a, l
    add  a, h
    add  a, h
    add  a, e
    add  a, d
    add  a, e
    add  a, a
    inc  b
    inc  b
    ld   b, h
    inc  b
    inc  b
    inc  b
    add  a, h
    add  a, h
    add  a, h
    adc  a, h
    inc  b
    ld   [$8F04], sp
    add  a, l
    add  a, l
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    add  a, [hl]
    sub  a, b
    add  hl, hl
    add  a, e
    add  a, a
    inc  b
    inc  b
    push af
    add  a, [hl]
    sub  a, b
    sub  a, b
    sub  a, b
    sub  a, b
    ld   a, [hli]
    add  a, a
    or   $04
    ei
    add  a, [hl]
    adc  a, b
    sub  a, d
    adc  a, c
    sub  a, b
    add  a, e
    add  a, a
    db   $FC ; Undefined instruction
    inc  b
    rst  $30
    add  a, [hl]
    add  a, a
    db   $E4 ; Undefined instruction
    add  a, [hl]
    sub  a, b
    sub  a, b
    add  a, a
    ld    hl, sp+$04
    inc  b
    adc  a, l
    adc  a, h
    db   $E3 ; Undefined instruction
    adc  a, l
    adc  a, c
    add  a, h
    adc  a, h
    inc  b
    inc  b
    inc  b
    call nc, label_404
    inc  b
    add  a, [hl]
    inc  b
    inc  b
    ld   b, h
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   [$8586], sp
    adc  a, [hl]
    inc  b
    inc  b
    inc  b
    ld   [label_408], sp
    inc  b
    add  a, [hl]
    ld   a, [hli]
    add  a, a
    ld   [$858F], sp
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    adc  a, e
    sub  a, b
    adc  a, b
    adc  a, h
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    add  a, [hl]
    sub  a, b
    add  a, d
    adc  a, b
    adc  a, h
    inc  b
    inc  b
    inc  b
    inc  b
    ld   a, [bc]
    adc  a, l
    adc  a, c
    add  hl, hl
    add  a, a
    ld   [label_99C04], sp
    ld   e, h
    inc  b
    inc  b
    ld   b, h
    add  a, [hl]
    add  a, d
    add  a, a
    inc  b
    ld   e, h
    dec  h
    ld   h, $5C
    ld   b, h
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    add  a, a
    inc  b
    ld   e, h
    daa
    jr   z, label_99F7A
    inc  b
    ld   a, [bc]
    add  a, [hl]
    add  a, d
    add  a, a
    inc  b
    inc  b
    ld   e, h
    ld   e, h
    inc  b
    ld   a, [bc]
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    add  a, a
    inc  b
    inc  b
    ld   b, h
    ld   [label_A04], sp
    adc  a, a
    adc  a, e
    add  a, d
    adc  a, d
    add  a, l
    adc  a, [hl]
    inc  b
    inc  b
    ld   a, [bc]
    ld   a, [bc]
    add  a, [hl]
    sub  a, b
    add  hl, hl
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    jr   z, label_99F4A
    inc  b
    dec  bc
    or   $27

label_99F4A::
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    jr   z, label_99F53
    inc  b
    push af
    dec  bc
    dec  bc

label_99F53::
    ld   sp, hl
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $04
    inc  b
    ei
    ld   [$FF0B], sp
    ld   a, [hli]
    jr   z, label_99F88
    add  hl, hl
    ld   h, $04
    rst  $30
    rst  $38
    dec  bc
    dec  bc
    jr   z, label_99FAE
    ld   b, h
    daa
    add  hl, hl
    ld   h, $04
    rst  $30
    ld   a, [label_26F8]
    ld   b, h
    call nz, label_2744
    add  hl, hl
    ld   h, $04

label_99F7A::
    inc  b
    inc  b
    jr   z, label_99FC2
    ld   b, h
    ld   b, h
    ld    hl, sp+$27
    jr   z, label_99FA4
    inc  b
    inc  b
    ld   h, $F7

label_99F88::
    ld   a, [label_4F8]
    dec  a
    ld   c, b
    ld   [rOBP1], a
    cpl
    jr   z, label_99FB9
    jr   z, label_99FBB
    jr   z, label_99FBD
    jr   z, label_99F93
    db   $FC ; Undefined instruction
    daa
    ld   sp, hl
    or   $04
    or   [hl]
    ret  z
    or   a
    push af
    rst  $38
    ld   [label_825], sp
    ld    hl, sp+$04
    call label_CEE1
    rst  $30
    ld    hl, sp+$25
    ld   a, [hli]

label_99FAE::
    dec  bc
    dec  bc
    or   [hl]
    or   a
    dec  bc
    or   [hl]
    or   a
    inc  b
    daa
    add  hl, hl
    inc  b

label_99FB9::
    dec  bc
    call label_BCE

label_99FBD::
    call label_20CE
    call nc, label_427
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    inc  b
    db   $E8 ; add  sp, d
    inc  b
    push af
    ld   sp, hl
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    db   $E8 ; add  sp, d
    push af
    rst  $38
    ld   a, [label_2F2F]
    cpl
    cpl
    cpl
    cpl
    inc  a
    ld   a, [bc]
    db   $FC ; Undefined instruction
    dec  h
    jr   z, label_9A009
    jr   z, label_9A00B
    jr   z, label_9A00D
    jr   z, label_9A00F
    jr   z, label_9A011
    ld   h, $51
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    jr   z, label_9A047
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    add  hl, bc
    ld   a, [bc]

label_99FFC::
    ld   a, [bc]
    or   [hl]
    ld   h, $51
    ld   a, [bc]
    call nz, label_C403
    ld   a, [bc]
    call nz, label_CD03
    jr   z, label_9A05B
    ld   a, [bc]

label_9A00B::
    ld   a, [bc]
    ld   a, [bc]

label_9A00D::
    add  hl, bc
    inc  bc

label_9A00F::
    ld   a, [bc]
    ld   a, [bc]

label_9A011::
    or   [hl]
    inc  b
    inc  b
    ld   a, [bc]
    call nz, label_C403
    ld   a, [bc]
    call nz, label_CD09
    inc  b
    inc  b
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  bc
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    or   [hl]
    ld   h, $51
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  bc
    inc  bc
    call label_2728
    jr   z, label_9A03C
    db   $FC ; Undefined instruction
    daa
    jr   z, label_9A05F
    add  hl, hl
    ld   h, $51
    ld   d, c

label_9A03C::
    ld   d, c
    ei
    db   $FC ; Undefined instruction
    ld   d, c

label_9A040::
    ld   d, c
    ld   d, c
    daa
    jr   z, label_99FFC
    ld   a, [bc]
    ld   a, [bc]

label_9A047::
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   d, c
    adc  a, $03
    inc  bc
    call nz, label_C40A
    ld   a, [bc]
    call nz, label_9910A
    or   a
    ld   a, [bc]
    inc  bc

label_9A05B::
    inc  bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]

label_9A05F::
    inc  bc
    inc  bc
    ld   d, c
    adc  a, $0A
    inc  bc
    call nz, label_C40A
    ld   a, [bc]
    call nz, label_9910A
    or   a
    ld   a, [bc]
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   d, c
    adc  a, $0A
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  bc
    inc  bc
    ld   a, [bc]
    ld   a, [bc]
    ld   d, c
    jr   c, label_9A090
    ld   c, $9A
    ei
    db   $FC ; Undefined instruction
    daa
    jr   z, label_9A040
    sub  a, [hl]
    jr   c, label_9A09A
    ld   c, $9A
    ei
    ld    hl, sp+$25
    ld   h, $A2
    sub  a, e
    jr   c, label_9A0A4
    ld   c, $9A
    cp   $04

label_9A09A::
    daa
    jr   z, label_9A053
    push af
    jr   c, label_9A0AE
    ld   c, $9A
    db   $FC ; Undefined instruction
    inc  b

label_9A0A4::
    inc  b
    rst  $30
    ld   sp, hl
    rst  $38
    jr   c, label_9A0B8
    ld   c, $9A
    rst  $38
    or   $04
    inc  b
    rst  $30
    ld   a, [label_E38]
    ld   c, $9A
    rst  $38
    rst  $38

label_9A0B8::
    ld   sp, hl
    or   $04
    inc  b
    jr   c, label_9A0CC
    sbc  a, e
    sbc  a, [hl]
    rst  $30
    rst  $38
    rst  $38
    rst  $38
    ld   sp, hl
    ld   sp, hl
    jr   c, label_9A0D6
    sbc  a, d
    sbc  a, e
    sbc  a, c
    sbc  a, c

label_9A0CC::
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sbc  a, d
    dec  c
    dec  c

label_9A0D6::
    dec  c
    sbc  a, d
    sub  a, [hl]
    sub  a, [hl]
    sub  a, e
    sub  a, e
    sub  a, e
    sbc  a, l
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, [hl]
    sub  a, e
    sub  a, e
    ld   sp, hl
    or   $5C
    or   a
    and  h
    and  l
    and  [hl]
    or   a
    ld   e, h
    rst  $30
    rst  $38
    ld    hl, sp+$5C
    and  d
    and  a
    db   $E3 ; Undefined instruction
    xor  b
    and  d
    ld   e, h
    inc  b
    ld    hl, sp+$04
    ld   e, h
    or   [hl]
    ld   e, h
    inc  c
    ld   e, h
    or   [hl]
    ld   e, h
    push af
    inc  b
    push af
    or   $04
    ld   e, h
    inc  c
    ld   e, h
    inc  b
    push af
    rst  $38
    ld   sp, hl
    rst  $38
    ld   a, [label_99CF6]
    inc  c
    ld   e, h
    push af
    rst  $38
    rst  $38
    sbc  a, c
    sbc  a, c
    sbc  a, e
    sbc  a, h
    or   $0C
    push af
    sbc  a, e
    sbc  a, h
    sbc  a, c
    sub  a, [hl]
    or   a
    daa
    jr   z, label_9A129
    ei
    rst  $38
    sbc  a, d
    sub  a, [hl]

label_9A129::
    sbc  a, b
    sub  a, e
    and  d
    dec  h
    ld   h, $04
    ei
    db   $FC ; Undefined instruction
    sbc  a, d
    sub  a, e
    sub  a, l
    ld    hl, sp+$B6
    daa
    jr   z, label_9A12E
    rst  $38
    rst  $38
    sbc  a, d
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ei
    rst  $38
    ld    hl, sp+$9A
    inc  b
    inc  b
    or   $04
    push af
    ld   sp, hl
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    sbc  a, d
    ld   [rOBP1], a
    rst  $38
    ld   sp, hl
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$04
    sbc  a, d
    ld   c, $0E
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$04
    push af
    sbc  a, l
    sbc  a, h
    ld   c, $99
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, c
    sbc  a, h
    sbc  a, d
    ld   c, $25
    ld   h, $04
    dec  c
    daa
    jr   z, label_9A1AF
    ld   c, $0E
    scf
    daa
    jr   z, label_9A181
    dec  c
    inc  b
    inc  b
    jr   c, label_9A190
    ld   c, $37
    inc  b
    inc  b
    inc  b
    dec  c
    inc  b
    inc  b
    ldd  [hl], a
    dec  l
    ld   c, $37
    inc  b

label_9A18F::
    inc  b

label_9A190::
    inc  b
    dec  c
    dec  c
    inc  b
    ld   e, h
    jr   c, label_9A1A5
    scf
    cpl
    inc  a
    inc  b
    inc  b
    dec  c
    inc  b
    ld   e, h
    jr   c, label_9A1AF
    scf
    ld   c, $37
    ld   e, h

label_9A1A5::
    inc  b
    dec  c
    dec  h
    ld   h, $38
    ld   c, $37
    ld   c, $37
    ld   e, h

label_9A1AF::
    ld   e, h
    dec  c
    daa
    jr   z, label_9A1EC
    ld   c, $37
    ld   c, $37
    dec  h

label_9A1B9::
    ld   h, $04
    dec  h
    ld   h, $38
    ld   c, $37
    jr   c, label_9A18F
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    jr   c, label_9A1B9
    xor  $EE
    xor  $EE
    xor  $EE
    xor  $EE
    jr   c, label_9A1C3
    dec  hl

label_9A1D7::
    inc  l
    inc  l
    dec  l
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction

label_9A1DC::
    xor  $EE
    jr   c, label_9A1CD
    scf

label_9A1E1::
    and  b
    add  a, $38
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    xor  $EE
    jr   c, label_9A1D7
    scf
    inc  b

label_9A1EC::
    inc  b
    jr   c, label_9A1DC
    db   $ED ; Undefined instruction
    or   [hl]
    or   a
    jr   c, label_9A1E1
    inc  sp

label_9A1F5::
    cpl
    cpl
    inc  [hl]
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    call label_38CE
    db   $ED ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_9A1F5
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    xor  $EE
    xor  $EE
    xor  $EE
    xor  $EE
    xor  $EE
    xor  $EE
    xor  $EE
    xor  $B6
    or   a
    or   [hl]
    or   a
    db   $EC ; Undefined instruction
    xor  $EE
    xor  $EE
    or   [hl]
    ld   c, a
    adc  a, $CD
    adc  a, $C8
    or   [hl]
    or   a
    db   $ED ; Undefined instruction
    xor  $CD
    adc  a, $ED
    xor  $EE
    xor  $CD
    adc  a, $ED
    ret  z
    ret  z
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EE
    xor  $EB
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $ED ; Undefined instruction
    xor  $EE
    xor  $EB
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $ED ; Undefined instruction
    or   [hl]
    or   a
    or   [hl]
    adc  a, $B6
    or   a
    or   [hl]
    or   a
    call label_CDCE
    adc  a, $CD
    xor  $CD
    adc  a, $CD
    adc  a, $ED
    xor  $EE
    xor  $EE
    xor  $EE
    xor  $EE
    xor  $ED
    ret  z
    ret  z
    db   $ED ; Undefined instruction
    xor  $C8
    ret  z
    ret  z
    db   $ED ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EE
    xor  $C8
    xor  $EB
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EE
    xor  $EE
    db   $EC ; Undefined instruction
    ret  z
    ret  z
    ret  z

label_9A297::
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EE
    xor  $EE
    db   $EC ; Undefined instruction
    xor  $EE
    xor  $EE
    db   $ED ; Undefined instruction
    ret  z
    ret  z
    db   $EC ; Undefined instruction
    or   a
    or   [hl]
    or   a

label_9A2A9::
    or   [hl]
    or   a
    or   [hl]
    or   a
    or   [hl]

label_9A2AE::
    or   a
    or   [hl]
    adc  a, $ED
    db   $ED ; Undefined instruction

label_9A2B3::
    db   $ED ; Undefined instruction
    ret  z
    ret  z
    db   $ED ; Undefined instruction
    xor  $ED
    jr   c, label_9A2A9
    xor  $EE
    db   $EC ; Undefined instruction
    xor  $C8
    db   $ED ; Undefined instruction
    ret  z
    db   $ED ; Undefined instruction
    jr   c, label_9A2B3
    xor  $EE

label_9A2C7::
    xor  $EC
    ret  z
    db   $ED ; Undefined instruction
    ret  z
    db   $ED ; Undefined instruction
    jr   c, label_9A297
    ret  z
    ret  z

label_9A2D1::
    db   $EC ; Undefined instruction
    xor  $EE
    db   $ED ; Undefined instruction
    ret  z
    db   $ED ; Undefined instruction
    jr   c, label_9A2C7
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    xor  $EC
    xor  $EE
    ret  z
    db   $ED ; Undefined instruction
    jr   c, label_9A2D1
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $EC ; Undefined instruction
    ret  z
    ret  z
    db   $ED ; Undefined instruction
    xor  $38
    xor  $EE
    xor  $EE
    db   $EC ; Undefined instruction
    xor  $EE
    xor  $EE
    jr   c, label_9A2AE
    or   [hl]

label_9A2F8::
    or   a
    or   [hl]
    or   a
    or   [hl]

label_9A2FC::
    or   a
    or   [hl]
    or   a
    jr   c, label_9A338
    add  a, d
    add  a, e
    add  a, a
    rst  $38
    or   $04
    inc  b
    inc  b
    inc  b
    scf
    add  hl, hl
    ld   a, [hli]
    add  a, a
    rst  $30
    db   $FC ; Undefined instruction
    ld   [label_98404], sp
    inc  b
    scf
    add  a, d
    add  a, e
    adc  a, d
    adc  a, [hl]
    ei
    or   $08
    inc  b
    inc  b
    scf
    add  hl, hl
    ld   a, [hli]
    sub  a, b
    add  a, a
    rst  $30
    db   $FC ; Undefined instruction
    inc  b
    dec  h
    ld   h, $31
    add  a, d
    add  a, e
    sub  a, b
    add  a, a
    ld   b, h
    ei
    or   $27
    add  hl, hl
    add  hl, hl
    ld   a, [hli]
    adc  a, b
    add  a, h
    adc  a, h
    inc  b

label_9A338::
    ei
    db   $FC ; Undefined instruction
    dec  h
    ld   a, [hli]
    add  a, d
    add  a, e
    add  a, a
    ld   b, h
    inc  b
    push af
    rst  $38
    ld   a, [bc]
    daa
    add  hl, hl
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $F5
    rst  $38
    rst  $38
    ld   a, [bc]
    dec  h
    ld   a, [hli]
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    add  a, [hl]
    add  hl, hl
    ld   a, [hli]
    inc  b
    inc  b
    ld   [label_804], sp
    inc  b
    inc  b
    add  a, [hl]
    add  a, d
    add  hl, hl
    inc  b
    inc  b
    inc  b
    dec  h
    ld   h, $25
    ld   h, $86
    add  hl, hl
    ld   a, [hli]
    dec  h
    ld   h, $20
    daa
    jr   z, label_9A39B
    jr   z, label_9A2FC
    add  a, d
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9A37F
    inc  b
    ld   b, h
    inc  b
    dec  h

label_9A37F::
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $04
    ld   b, h
    and  b
    ld   b, h
    daa
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $04
    ld   b, h
    inc  b
    inc  b
    daa
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $25

label_9A39B::
    ld   h, $25
    ld   h, $27
    add  hl, hl
    add  a, e
    add  a, a
    inc  b
    add  a, [hl]
    add  hl, hl
    ld   a, [hli]
    adc  a, b
    add  a, h
    add  a, h
    add  a, h
    ld   a, [hli]
    add  a, a
    inc  b
    add  a, [hl]
    add  a, d
    add  a, e
    add  a, a
    inc  b
    inc  b
    inc  b
    add  a, e
    add  a, a
    inc  b
    adc  a, l
    add  a, h
    add  a, h
    adc  a, h
    inc  b
    adc  a, a
    add  a, l
    ld   a, [hli]
    add  a, a
    inc  b
    inc  b
    inc  b
    ld   b, h
    inc  b
    inc  b
    add  a, [hl]
    add  hl, hl
    add  a, e
    add  a, a
    ld   b, h
    inc  b
    inc  b
    inc  b
    inc  b
    ld   e, h
    add  a, [hl]
    add  a, d
    ld   a, [hli]
    add  a, a
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    add  a, [hl]
    add  hl, hl
    add  hl, hl
    ld   a, [hli]
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    adc  a, e
    add  a, d
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    add  a, h
    add  a, h
    adc  a, h
    inc  b
    inc  b
    ld   a, [bc]
    ld   a, [bc]
    adc  a, l
    adc  a, c
    add  a, d
    inc  b
    inc  b
    ld   b, h
    inc  b
    db   $E8 ; add  sp, d
    rst  $30
    rst  $38
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    add  a, l
    adc  a, [hl]
    inc  b
    ld   [label_804], sp
    rst  $30
    ld   a, [bc]
    add  a, [hl]
    add  a, d
    ld   a, [hli]
    add  a, a
    db   $E8 ; add  sp, d
    inc  b
    ld   e, h
    inc  b
    db   $E8 ; add  sp, d
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    add  a, e
    add  a, a
    inc  b
    ld   [label_804], sp
    push af
    ld   a, [bc]
    add  a, [hl]
    add  a, d
    ld   a, [hli]
    add  a, a
    ld   [$E804], sp
    push af
    ld   a, [bc]
    ld   a, [bc]
    add  a, [hl]
    add  hl, hl
    add  a, e
    adc  a, d
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    add  a, l
    adc  a, e
    add  a, d
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    jr   z, label_9A445
    inc  bc
    inc  bc
    inc  bc

label_9A445::
    jr   c, label_9A481
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    ld   h, $3D
    ld   c, b
    ld   [rOBP1], a
    inc  [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   z, label_9A48E
    inc  bc
    inc  bc
    inc  bc
    ld   a, [bc]
    ld   [label_30A], sp
    inc  bc
    ld   h, $38
    inc  bc
    inc  bc
    ld   a, [bc]
    ld   [label_85C], sp
    ld   a, [bc]
    inc  bc
    jr   z, label_9A4A2
    inc  bc
    inc  bc
    inc  bc
    ld   a, [bc]
    ld   [label_30A], sp
    inc  bc
    ld   h, $38
    inc  bc
    inc  bc
    inc  bc
    inc  bc

label_9A478::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    jr   z, label_9A4B6
    inc  bc
    inc  bc
    inc  bc

label_9A481::
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    ld   h, $32
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l

label_9A48E::
    inc  l
    inc  l
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    scf
    rst  $38
    ld    hl, sp+$27
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    scf
    ld   a, [bc]

label_9A4A2::
    inc  b
    dec  h
    inc  bc
    inc  bc
    inc  bc
    jr   nz, label_9A4AC
    inc  bc
    scf
    ld   a, [bc]

label_9A4AC::
    or   $27
    inc  bc
    inc  bc
    jr   nz, label_9A478
    jr   nz, label_9A4DF
    ld   sp, label_A0A
    dec  h
    inc  bc
    inc  bc
    jr   nz, label_9A4BF
    jr   nz, label_9A4F5
    rst  $38

label_9A4BF::
    ld   a, [bc]
    ld    hl, sp+$27
    inc  bc
    inc  bc
    inc  bc
    jr   nz, label_9A4CA
    scf
    ld   a, [bc]
    ld    hl, sp+$25
    ld   h, $03
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    scf
    ld    hl, sp+$04
    daa
    add  hl, hl
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    ld   sp, label_404
    dec  h

label_9A4DF::
    ld   a, [hli]
    jr   z, label_9A533
    ld   a, [bc]
    ld   a, [bc]
    add  hl, bc
    add  hl, bc
    inc  bc
    ld   a, [bc]
    ld   a, [bc]
    or   [hl]
    ld   h, $51
    ld   a, [bc]
    add  hl, bc
    call nz, label_C40A
    inc  bc
    ld   a, [bc]
    call label_99128
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  bc
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   h, $51
    ld   a, [bc]
    ld   a, [bc]
    call nz, label_C503
    inc  bc
    ld   a, [bc]
    ld   a, [bc]
    jr   z, label_9A55B
    ld   a, [bc]
    inc  bc
    inc  bc
    ld   a, [bc]
    ld   a, [bc]
    inc  bc
    inc  bc
    add  hl, bc
    dec  h
    ld   h, $51
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   a, [hli]
    jr   z, label_9A55C
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    add  hl, hl
    ld   h, $38
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   a
    add  hl, bc
    inc  bc

label_9A533::
    inc  bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   d, c
    adc  a, $0A
    inc  bc
    call nz, label_C409
    inc  bc
    call nz, label_9910A
    ld   a, [bc]
    inc  bc
    add  hl, bc
    add  hl, bc
    ld   a, [bc]
    ld   a, [bc]
    add  hl, bc
    inc  bc
    ld   a, [bc]
    ld   d, c
    ld   a, [bc]
    ld   a, [bc]
    inc  bc
    call nz, label_C40A
    inc  bc
    ld   a, [bc]
    ld   a, [bc]
    ld   d, c
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_9A55B::
    ld   a, [bc]

label_9A55C::
    inc  bc
    inc  bc
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    ld   d, c
    dec  a
    dec  [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    cpl
    cpl
    cpl
    cpl
    cpl
    ld   c, [hl]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    dec  h
    ld   h, $27
    jr   z, label_9A5B9
    ld   c, $9D
    sbc  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    jr   c, label_9A59A
    sub  a, a
    sbc  a, b
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    jr   c, label_9A5A4
    sub  a, h
    sub  a, l
    ld   c, $0E

label_9A59A::
    ld   c, $0E
    ld   c, $0E
    jr   c, label_9A5AE
    ld   c, $0E
    ld   c, $0E

label_9A5A4::
    ld   c, $0E
    ld   c, $0E
    jr   c, label_9A5B8
    ld   c, $0E
    ld   c, $0E

label_9A5AE::
    ld   c, $0E
    ld   c, $0E
    ldd  [hl], a
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l

label_9A5B8::
    inc  l

label_9A5B9::
    inc  l
    inc  l
    inc  l
    dec  h
    ld   h, $C6
    inc  b
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    inc  b
    daa
    jr   z, label_9A5EE
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $96
    sub  a, [hl]
    sbc  a, l
    sbc  a, [hl]
    dec  c
    inc  c
    dec  c
    sbc  a, l
    sbc  a, [hl]
    sub  a, [hl]
    sub  a, e
    sub  a, e
    sub  a, a
    sbc  a, b
    xor  e
    xor  e
    xor  e
    sub  a, a
    sbc  a, b
    sub  a, e
    ld   c, $0E
    sub  a, h
    sub  a, l
    xor  h
    xor  h
    xor  h
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
    inc  l
    inc  l
    and  e
    dec  c
    inc  c
    dec  c
    and  e
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
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sub  a, [hl]
    sbc  a, l
    sbc  a, [hl]
    ld   c, $93
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, e
    sub  a, a
    sbc  a, b
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    sub  a, h
    sub  a, l
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
    ld   c, $2C
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    ld    hl, sp+$04
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   c, $37
    daa
    jr   z, label_9A679
    daa
    jr   z, label_9A6B0
    ld   c, $37
    ld   c, $33
    cpl
    cpl
    ret  c
    cpl
    cpl
    inc  [hl]
    ld   c, $37
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    ld   c, $0E
    dec  hl
    inc  l
    jp  c, label_2D2C
    ld   c, $0E
    scf
    ld   c, $0E
    scf
    inc  b
    inc  b
    inc  b
    jr   c, label_9A6AE
    ld   c, $37
    inc  l
    inc  l
    ld   sp, label_4F6
    push af
    ldd  [hl], a
    dec  l
    ld   c, $37
    rst  $30
    ld   a, [$FFFA]

label_9A6B0::
    ld   sp, hl
    rst  $38
    rst  $38
    jr   c, label_9A6C3
    scf
    ld   h, $25
    ld   h, $F7
    rst  $38
    rst  $38
    ld    hl, sp+$38
    ld   c, $37
    jr   c, label_9A6AF
    db   $EB ; Undefined instruction

label_9A6C3::
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_9A6B9
    db   $EC ; Undefined instruction

label_9A6CD::
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    ret  z
    ret  z
    ret  z
    jr   c, label_9A6C3
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_9A6CD
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EC ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    jr   c, label_9A6D5
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    ldd  [hl], a
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    dec  a
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    jr   c, label_9A742
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $ED ; Undefined instruction
    call label_CDCE
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    ret  z
    ret  z
    db   $ED ; Undefined instruction
    ret  z
    ret  z
    db   $ED ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction

label_9A742::
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
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
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    ret  z
    ret  z
    ret  z
    ret  z
    ret  z
    ret  z
    ret  z
    ret  z
    ret  z
    ret  z
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction

label_9A78D::
    ret  z
    ret  z
    ret  z
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
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
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    adc  a, $CD
    adc  a, $38

label_9A7BA::
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    ret  z
    ret  z
    jr   c, label_9A78D
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    ret  z
    jr   c, label_9A7BA
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_9A7C4
    db   $EB ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    jr   c, label_9A80F
    dec  l
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    db   $ED ; Undefined instruction
    dec  hl
    inc  l
    inc  l
    dec  l
    jr   c, label_9A81C
    ld   c, [hl]
    jp   [hl]
    jp   [hl]
    jp   [hl]
    ld   l, $2F
    cpl
    ld   c, [hl]
    jr   c, label_9A831
    ccf
    jp   [hl]
    jp   [hl]
    jp   [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    ccf
    jr   c, label_9A828
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9A800
    rst  $38
    rst  $38
    ld   b, h
    daa
    add  hl, hl
    inc  a
    daa
    jr   z, label_9A812
    rst  $30

label_9A80F::
    rst  $38
    ld   a, [bc]
    ld   a, [bc]

label_9A812::
    dec  h
    ld   a, [hli]
    scf
    dec  h
    ld   h, $04
    inc  b
    rst  $30
    ld   b, h
    ld   a, [bc]

label_9A81C::
    daa
    add  hl, hl
    scf
    daa
    jr   z, label_9A847
    ld   h, $04
    rst  $30
    ld   a, [bc]
    dec  h
    ld   a, [hli]

label_9A828::
    ld   l, $3C
    dec  h
    ld   a, [hli]
    add  hl, hl
    ld   h, $04
    dec  h
    ld   a, [hli]

label_9A831::
    add  hl, hl
    ld   a, $37
    daa
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9A83D
    daa
    add  hl, hl
    ld   a, [hli]
    add  hl, sp

label_9A83D::
    scf
    dec  h
    ld   a, [hli]
    add  hl, hl
    ld   h, $04
    dec  h
    ld   a, [hli]
    add  hl, hl
    ld   c, $37
    daa
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9A851
    daa
    add  hl, hl
    ld   a, [hli]
    ld   a, [hli]

label_9A851::
    jr   z, label_9A87A
    jr   z, label_9A87C
    jr   z, label_9A87E
    jr   z, label_9A87E
    ld   a, [hli]
    jr   z, label_9A899
    cpl
    cpl
    inc  a
    ld   d, d
    ld   d, d
    ld   d, d
    daa
    add  hl, hl
    ld   h, $38
    ld   c, $0E
    scf
    ld   e, e
    ld   e, e
    ld   e, e
    dec  h
    ld   a, [hli]
    jr   z, label_9A8A8
    ld   c, $0E
    inc  sp
    inc  a
    ld   a, [bc]
    ld   a, [bc]
    daa
    add  hl, hl
    ld   h, $38

label_9A87A::
    ld   c, $0E

label_9A87C::
    ld   c, $37

label_9A87E::
    rst  $30
    ld   b, h
    dec  h
    ld   a, [hli]
    jr   z, label_9A8B6
    inc  l
    inc  l
    inc  l
    ld   sp, $FE04
    daa
    add  hl, hl
    ld   h, $F7
    rst  $38
    ld   b, h
    ld    hl, sp+$04
    push af
    db   $FC ; Undefined instruction
    dec  h
    ld   a, [hli]
    add  hl, hl
    ld   h, $FB

label_9A899::
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    ei
    db   $FC ; Undefined instruction
    daa
    add  hl, hl
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]

label_9A8A8::
    add  hl, hl
    ld   a, [hli]
    ld   a, [hli]
    jr   z, label_9A8D4
    jr   z, label_9A8D6
    jr   z, label_9A8D8
    jr   z, label_9A8DA
    jr   z, label_9A8DD
    ld   e, h

label_9A8B6::
    push af
    or   $55
    ld   e, d
    ld   e, d
    ld   e, d
    ld   d, [hl]
    push af
    ld   h, $5C
    rst  $30
    db   $FC ; Undefined instruction
    ld   d, a
    ld   e, c
    ld   e, c
    ld   e, c
    ld   e, b
    rst  $38
    jr   z, label_9A926
    ld   e, h
    rst  $30
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    rst  $30
    ld   h, $36

label_9A8D4::
    inc  a
    ld   e, h

label_9A8D6::
    ld   b, h
    dec  bc

label_9A8D8::
    dec  bc
    dec  bc

label_9A8DA::
    dec  bc
    dec  bc
    jr   z, label_9A8D3
    scf
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    rst  $30
    ld   b, h
    ld   sp, hl
    ld   h, $FB
    ld   l, $2F
    cpl
    cpl
    cpl
    ld   c, b
    ld   c, d
    ld   c, c
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    daa

label_9A8FB::
    jr   z, label_9A924
    jr   z, label_9A926
    jr   z, label_9A928
    jr   z, label_9A92A
    jr   z, label_9A8FB
    ld   e, a
    ld   e, a
    ld   e, a
    push af
    ld   sp, hl
    ld   b, h
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    db   $FC ; Undefined instruction
    ld   h, b
    ldh  [$FF0C], a
    ld   h, b
    ei
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    ld   a, [label_2044]
    inc  b

label_9A91B::
    jr   nz, label_9A918
    rst  $38
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    dec  h
    dec  bc
    dec  bc

label_9A924::
    jr   nz, label_9A91B

label_9A926::
    ld   b, h
    rst  $38

label_9A928::
    rst  $38
    rst  $38

label_9A92A::
    db   $FC ; Undefined instruction
    daa
    or   $0B
    push af
    ld    hl, sp+$3D
    dec  [hl]
    ei
    ld   b, h
    db   $FC ; Undefined instruction
    dec  h
    ld   c, b
    ld   [rOBP1], a
    cpl
    ld   c, [hl]
    push af
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    daa
    add  hl, hl
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $27
    jr   z, label_9A974
    jr   z, label_9A976
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9A97A
    jr   z, label_9A94E
    or   $5C
    ld   e, h
    ld   e, h
    daa
    jr   z, label_9A992
    inc  a
    ld   a, [bc]
    ld   a, [$F9FF]
    or   $04
    ld   e, h
    dec  h
    ld   h, $2E
    cpl
    ld   h, $FB
    rst  $38

label_9A96B::
    rst  $38
    or   $5C
    daa
    jr   z, label_9A9AF
    db   $3A ; ldd  a, [hl]
    jr   z, label_9A96B

label_9A974::
    rst  $38
    rst  $38

label_9A976::
    db   $FC ; Undefined instruction
    dec  h
    ld   h, $0A

label_9A97A::
    add  hl, sp

label_9A97B::
    pop  hl
    ld   h, $04
    ei
    rst  $38
    db   $FC ; Undefined instruction
    daa
    jr   z, label_9A97B
    ld   a, [bc]
    ld   a, [bc]
    jr   z, label_9A97D
    rst  $38
    rst  $38
    ld    hl, sp+$25
    ld   h, $04
    ei
    ld   a, [bc]
    dec  h
    ld   h, $25
    ld   h, $25
    ld   h, $04
    inc  b
    daa
    jr   z, label_9A9C2
    jr   z, label_9A9C4
    jr   z, label_9A9C6
    jr   z, label_9A9A5
    dec  a
    cpl
    cpl
    ld   sp, hl

label_9A9A5::
    ld   b, h
    or   $04
    inc  b
    jr   nz, label_9A9A0
    jr   c, label_9A9E7
    db   $3A ; ldd  a, [hl]
    cpl

label_9A9AF::
    cpl
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    ld   c, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    ccf
    ld   a, [bc]
    dec  h

label_9A9C2::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9A9C4::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9A9C6::
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    dec  sp
    ld   a, [bc]
    daa
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   b, h
    dec  h
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   b, h
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    ld    hl, sp+$27
    daa
    jr   z, label_9AA1B
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9A9E7::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    cpl
    cpl
    ld   c, [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   e, h
    ld   e, h
    inc  b
    inc  b
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ccf
    ld   a, [bc]
    ld   a, [bc]
    ld   sp, hl
    or   $E8
    inc  b
    inc  b
    db   $3A ; ldd  a, [hl]
    cp   d
    dec  sp
    ld   a, [bc]
    db   $E8 ; add  sp, d
    rst  $30
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    ld   h, $0A
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    db   $E8 ; add  sp, d
    inc  b
    db   $E8 ; add  sp, d
    inc  b
    jr   z, label_9AA1E
    ld   a, [bc]
    ld   a, [bc]
    db   $E8 ; add  sp, d
    ld   b, h
    db   $FD ; Undefined instruction
    ld   a, [bc]
    or   $04
    ld   h, $0A

label_9AA1E::
    ld   a, [bc]
    rst  $38
    dec  bc
    ld   a, [bc]
    db   $E8 ; add  sp, d
    rst  $30
    db   $FC ; Undefined instruction
    dec  h
    jr   z, label_9AA32
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    ld    hl, sp+$04
    inc  b
    cp   $27
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9AA32::
    cp   d
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    daa
    jr   z, label_9AA5E
    ld   h, $F7
    ld   b, h
    ld   sp, hl
    rst  $38
    ld   a, [$F6FD]
    ld   e, h
    daa
    jr   z, label_9AA49
    ei
    rst  $38
    ld   b, h
    dec  h

label_9AA49::
    ld   h, $44
    or   $5C
    dec  h
    dec  bc
    dec  bc
    ld   b, h
    ld   a, [bc]
    daa
    jr   z, label_9AA5F
    ld   b, h
    ld   e, h
    daa
    inc  b
    dec  bc
    dec  bc
    ld   b, h
    ld   a, [bc]
    ld   a, [bc]

label_9AA5E::
    ld   b, h

label_9AA5F::
    ld    hl, sp+$04
    dec  h
    inc  b
    inc  b
    dec  bc
    ei
    ld   b, h
    ld   b, h
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    daa
    ld   h, $04
    dec  bc
    dec  bc
    dec  bc
    ld   b, h
    ld    hl, sp+$04
    dec  h
    ld   h, $28
    inc  b
    inc  b
    rst  $30
    dec  bc
    ld    hl, sp+$04
    ld   l, [hl]
    daa
    jr   z, label_9AAA6
    ld   h, $27
    jr   z, label_9AAAC
    jr   z, label_9AAAE
    jr   z, label_9AAB0
    jr   z, label_9AAB2
    jr   z, label_9AA82
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   b, h
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   h, $F5
    rst  $38
    rst  $38
    ld   a, [$FAFA]

label_9AA9B::
    rst  $38
    rst  $38
    rst  $38
    jr   z, label_9AA9B
    ld   b, h
    ld    hl, sp+$25
    ld   b, l
    ld   h, $F7

label_9AAA6::
    rst  $38
    rst  $38
    ld   h, $F7
    db   $FC ; Undefined instruction
    inc  b

label_9AAAC::
    daa
    pop  hl

label_9AAAE::
    jr   z, label_9AAB4

label_9AAB0::
    rst  $30
    ld   b, h

label_9AAB2::
    jr   z, label_9AAB8

label_9AAB4::
    rst  $30
    db   $FD ; Undefined instruction
    or   $0B

label_9AAB8::
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  h
    ld   h, $25
    ld   h, $FE
    dec  bc
    push af
    ld   b, h
    db   $FD ; Undefined instruction
    ld    hl, sp+$27
    jr   z, label_9AAF0

label_9AAC9::
    jr   z, label_9AAC9
    dec  bc
    cp   $25
    ld   h, $25
    daa
    jr   z, label_9AACA
    rst  $38
    ld    hl, sp+$0B
    rst  $38
    ld   a, [label_27FC]
    ld   sp, hl
    or   $5C
    ld   b, h
    ld   e, h
    dec  bc
    cp   $5C
    cp   $25
    ld   b, h
    ld    hl, sp+$5C
    rst  $30
    db   $FD ; Undefined instruction
    dec  bc
    ld    hl, sp+$5C
    cp   $27
    db   $FC ; Undefined instruction
    inc  b

label_9AAF0::
    ld   e, h
    inc  b
    db   $E8 ; add  sp, d
    dec  bc
    inc  b
    call nc, label_25FE
    ld    hl, sp+$5C
    inc  b
    ld   e, h
    inc  b
    dec  bc
    inc  b
    push af
    db   $FC ; Undefined instruction
    daa
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    db   $E8 ; add  sp, d
    rst  $30
    ld   b, h
    dec  h
    inc  b
    ld   e, h
    inc  b
    ld   e, h
    dec  bc
    ld   e, h
    inc  b
    ld   e, h
    rst  $30
    daa
    ld   h, $25
    ld   h, $04
    dec  bc
    dec  h
    ld   h, $25
    ld   h, $25
    jr   z, label_9AB49
    jr   z, label_9AB4B
    jr   z, label_9AB4D
    jr   z, label_9AB4F
    jr   z, label_9AB51
    ld   h, $04
    dec  hl
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    jr   z, label_9AB61
    ld   sp, $B6F8
    jp   label_F7B7
    rst  $38
    rst  $38
    ld   h, $37
    ld    hl, sp+$04
    call label_CEE1
    inc  b
    rst  $30
    rst  $38
    jr   z, label_9AB81
    or   [hl]

label_9AB4B::
    or   a
    inc  b

label_9AB4D::
    dec  bc
    call nc, label_B7B6

label_9AB51::
    ei
    ld   h, $37
    call label_4CE
    dec  bc
    inc  b
    call label_984CE
    jr   z, label_9AB95
    or   $04
    inc  b

label_9AB61::
    dec  bc

label_9AB62::
    inc  b
    inc  b
    push af
    ld   a, [label_3726]
    rst  $38
    or   $04
    dec  bc
    push af
    ld   sp, hl
    db   $FC ; Undefined instruction
    dec  a
    jr   z, label_9AB99
    jr   z, label_9AB78
    ei
    rst  $38
    or   $38

label_9AB78::
    ld   c, $37
    inc  l
    inc  l
    dec  l
    push af
    rst  $38

label_9AB7F::
    rst  $38
    ld   b, h

label_9AB81::
    jr   c, label_9AB91
    scf
    rst  $38

label_9AB85::
    ld   b, h
    jr   c, label_9AB7F
    ld   b, h

label_9AB89::
    ld   a, [label_38FF]
    ld   c, $37
    rst  $38
    db   $FC ; Undefined instruction
    ldd  [hl], a

label_9AB91::
    inc  l
    inc  l

label_9AB93::
    dec  l
    ei

label_9AB95::
    jr   c, label_9ABA5
    scf
    rst  $38

label_9AB99::
    rst  $38
    or   $5C
    ld   e, h
    jr   c, label_9AB9B
    jr   c, label_9ABAF
    scf
    rst  $38

label_9ABA3::
    ld   a, [label_99CF8]
    ld   e, h

label_9ABA7::
    jr   c, label_9ABA7
    jr   c, label_9ABB9
    scf
    ld    hl, sp+$5C

label_9ABAE::
    ld   e, h

label_9ABAF::
    ld   e, h
    ld   e, h
    jr   c, label_9ABAE
    jr   c, label_9ABC3
    scf
    cpl
    ld   c, b
    ld   c, d

label_9ABB9::
    ld   c, d
    ld   c, c
    ld   c, [hl]
    db   $FC ; Undefined instruction
    jr   c, label_9ABCD
    scf
    jr   c, label_9ABFC
    db   $3A ; ldd  a, [hl]

label_9ABC3::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_9AB85
    cp   c

label_9ABCD::
    cp   c
    cp   c
    cp   c
    ld   b, a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    jr   c, label_9AB89
    or   e
    or   e
    or   e
    or   e
    jr   c, label_9AC4C
    ld   b, a
    db   $3A ; ldd  a, [hl]
    jr   c, label_9AB93
    or   e
    or   e
    or   e
    or   e
    db   $F2 ; Undefined instruction
    inc  b
    jr   c, label_9ABF6
    jr   c, label_9ABA3
    cp   b
    cp   c
    cp   b
    cp   c
    di
    inc  b
    db   $F2 ; Undefined instruction
    ld   c, $38
    or   [hl]
    cp   c
    cp   c

label_9ABF6::
    cp   c
    or   [hl]
    db   $F4 ; Undefined instruction
    inc  b
    di
    ld   c, $38
    or   a
    cp   c
    cp   c
    cp   c
    or   a
    jr   c, label_9AC08
    db   $F4 ; Undefined instruction
    ld   c, $38
    cpl

label_9AC08::
    ld   c, b
    ld   [rOBP1], a
    cpl
    ld   c, [hl]
    inc  b
    jr   c, label_9AC1E
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
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    cp   d

label_9AC1E::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   b, [hl]
    inc  b
    inc  b
    ld   b, a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   c, $0E
    scf
    inc  b
    inc  b
    jr   c, label_9AC43
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    inc  b
    inc  b
    ldd  [hl], a
    inc  l
    ld   [$FF2C], a
    inc  l
    ld   c, $0E
    scf
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b

label_9AC4C::
    ld   c, $0E
    inc  sp
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    inc  a
    ld   l, [hl]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    scf
    inc  b
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
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   b, [hl]
    inc  b
    inc  b
    inc  b
    add  hl, bc
    inc  b
    ld   c, $0E
    ld   c, $0E
    inc  sp
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    inc  l
    inc  l
    dec  l
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $04
    inc  b
    ldd  [hl], a
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l

label_9AC9C::
    ld   l, [hl]
    jr   nz, label_9ACBF
    ld   e, h
    ld   e, h
    inc  b
    jr   nz, label_9ACA8
    ld   l, [hl]
    inc  b
    inc  b
    ld   l, [hl]

label_9ACA8::
    inc  b
    ld   l, [hl]
    inc  b
    inc  b
    ld   l, [hl]
    inc  b
    ld   l, [hl]
    inc  b
    db   $3A ; ldd  a, [hl]
    ccf
    jp   [hl]
    jp   [hl]
    jp   [hl]
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    ccf
    jr   c, label_9AC9C
    ccf
    jp   [hl]
    jp   [hl]
    jp   [hl]

label_9ACBF::
    ld   a, $3A
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_9ACC9
    jr   c, label_9ACD5
    ld   c, $0E

label_9ACC9::
    scf
    dec  h
    ld   h, $3D
    inc  [hl]
    cpl
    inc  [hl]
    ld   c, $0E
    ld   c, $37
    daa

label_9ACD5::
    jr   z, label_9AD0F
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    scf
    ld   a, [bc]
    ld   l, a
    jr   c, label_9ACF0
    inc  l
    inc  l
    dec  l
    ld   c, $0E
    scf
    ld   a, [bc]
    ld   a, [bc]
    jr   c, label_9ACFA
    inc  b
    jr   nz, label_9AD27
    ld   c, $0E
    scf
    ld   a, [label_380A]
    ld   c, $04
    inc  b
    jr   c, label_9AD08

label_9ACFA::
    ld   c, $37
    inc  b
    rst  $30
    jr   c, label_9AD0E
    ld   c, $37
    dec  h
    ld   a, [hli]
    add  hl, hl
    ld   h, $04
    dec  h

label_9AD08::
    ld   a, [hli]
    add  hl, hl
    ld   c, $37
    daa
    add  hl, hl

label_9AD0E::
    ld   a, [hli]

label_9AD0F::
    jr   z, label_9AD15
    daa
    add  hl, hl
    ld   a, [hli]
    ld   c, $37
    dec  h
    ld   a, [hli]
    jr   z, label_9AD24
    ld   e, h
    inc  b
    daa
    add  hl, hl
    ld   c, $37
    daa
    jr   z, label_9AD2D
    ld    hl, sp+$04
    inc  b
    dec  h

label_9AD27::
    ld   a, [hli]
    ld   c, $37
    dec  h
    ld   h, $0A

label_9AD2D::
    inc  b
    inc  b
    inc  b
    daa
    add  hl, hl
    ld   c, $37
    daa
    jr   z, label_9AD33
    call nc, label_F504
    dec  h
    ld   a, [hli]
    ld   c, $37
    dec  h
    ld   h, $FB
    or   $0B
    ld   b, h
    daa
    add  hl, hl

label_9AD46::
    ld   c, $37
    daa
    jr   z, label_9AD46
    rst  $38
    dec  bc
    ld   a, [bc]

label_9AD4E::
    dec  h
    ld   a, [hli]
    ld   a, [hli]

label_9AD51::
    jr   z, label_9AD4E
    ld    hl, sp+$04
    push af
    rst  $38
    ld    hl, sp+$25
    ld   a, [hli]
    jr   z, label_9AD51
    ld    hl, sp+$04
    push af
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    daa
    add  hl, hl
    ld   h, $FE
    dec  h
    ld   h, $F7
    ld   b, h
    rst  $38
    or   $04
    daa

label_9AD6E::
    jr   z, label_9AD6E
    daa
    jr   z, label_9AD77
    rst  $30
    ld   a, [$F6FF]

label_9AD77::
    dec  h
    ld   h, $FB
    or   $04
    inc  b
    dec  h
    ld   h, $FB
    db   $FC ; Undefined instruction
    daa
    jr   z, label_9AD7F
    ld   b, h

label_9AD85::
    or   $04
    daa
    jr   z, label_9AD85
    ld    hl, sp+$25
    ld   h, $F7
    ld   a, [label_4F8]
    push af
    ld   sp, hl
    ld    hl, sp+$25
    ld   a, [hli]
    add  hl, hl
    ld   h, $25
    ld   h, $F5
    rst  $38
    db   $FC ; Undefined instruction

label_9AD9D::
    dec  h
    ld   a, [hli]
    add  hl, hl
    jr   z, label_9AD9D
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   h, $FE
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    ei

label_9ADB4::
    jr   z, label_9ADB4
    inc  c
    inc  c
    ld   b, h
    ld   b, h
    ld   b, h
    inc  c
    inc  c
    ei
    ld   h, $FE
    inc  c
    ld   b, h
    inc  c
    sub  a, c
    inc  c
    ld   b, h
    inc  c
    ei

label_9ADC8::
    jr   z, label_9ADC8
    inc  c
    ld   b, h
    inc  c
    ld   e, [hl]
    inc  c
    ld   b, h
    inc  c
    ei
    ld   h, $FE
    inc  c
    ld   b, h
    inc  c
    inc  c
    inc  c
    ld   b, h
    inc  c
    rst  $30

label_9ADDC::
    jr   z, label_9ADDC
    inc  c
    inc  c
    ld   b, h
    ld   b, h
    ld   b, h
    inc  c
    inc  c
    dec  bc
    ld   h, $FE
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    push af
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    dec  sp
    ei
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    dec  h
    db   $FC ; Undefined instruction
    dec  bc
    ei
    ld   a, [$FAFA]
    ld   b, h
    ld   a, [label_27F8]
    db   $FC ; Undefined instruction
    dec  bc
    ld    hl, sp+$5C
    ld   e, h
    ld   e, h
    rst  $30
    dec  bc
    dec  bc
    dec  bc
    db   $FC ; Undefined instruction
    dec  bc
    ld   e, h
    ld   d, l
    ld   e, d
    ld   d, [hl]
    ld   e, h
    dec  bc
    push af
    dec  h
    db   $FC ; Undefined instruction
    dec  bc
    ld   e, h
    ld   b, b
    ld   b, c
    ld   b, d
    ld   e, h
    dec  bc
    db   $FC ; Undefined instruction
    daa
    ld    hl, sp+$0B
    ld   e, h
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    ld   e, h
    dec  bc
    db   $FC ; Undefined instruction
    dec  h
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    db   $FC ; Undefined instruction
    daa
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    db   $FC ; Undefined instruction
    dec  h
    ld   h, $FB
    rst  $38
    ld    hl, sp+$04
    daa
    jr   z, label_9AE52
    ld   a, [bc]
    ld   a, [bc]
    jr   z, label_9AE47
    db   $FC ; Undefined instruction
    call nc, label_205C
    push af
    ld   a, [bc]

label_9AE52::
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    ld   e, h
    jr   nz, label_9AE66
    dec  bc
    dec  bc
    dec  bc
    ld   h, $F7
    ld    hl, sp+$5C
    ld   e, h
    dec  h
    ld   h, $F5

label_9AE66::
    ld   b, h
    ld   a, [bc]
    jr   z, label_9AE6E
    ld   e, h
    ld   e, h
    dec  h
    ld   a, [hli]

label_9AE6E::
    jr   z, label_9AE7A
    rst  $38
    ld   a, [bc]
    ld   h, $25
    ld   h, $25
    ld   a, [hli]

label_9AE77::
    jr   z, label_9AE83
    ld   a, [bc]

label_9AE7A::
    rst  $38
    rst  $38
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9AE77
    rst  $38

label_9AE83::
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [hli]
    add  hl, hl
    ld   a, [hli]
    add  hl, hl
    ld   h, $FB
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    daa
    dec  bc
    dec  bc
    ld   e, h
    dec  h
    ld   h, $0A
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    daa
    jr   z, label_9AEDF
    inc  l
    dec  l
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    dec  bc
    dec  bc
    scf
    db   $E8 ; add  sp, d
    jr   c, label_9AECB
    ld   a, [bc]
    or   $04
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    inc  sp
    ld   [$FF34], a
    dec  bc

label_9AECB::
    dec  bc
    ld   a, [bc]
    ld   sp, hl
    rst  $38
    ld   a, [bc]
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   sp, hl
    ld   a, [bc]
    ld   sp, hl
    ld   a, [bc]
    dec  h

label_9AEDF::
    ld   h, $26
    ei
    rst  $38
    rst  $38
    dec  bc
    inc  b
    inc  b
    push af
    ld    hl, sp+$25
    jr   z, label_9AEF6
    rst  $38
    ld    hl, sp+$0B
    push af
    ld   sp, hl
    db   $FC ; Undefined instruction
    db   $E8 ; add  sp, d
    daa
    ld   sp, hl
    rst  $38

label_9AEF6::
    ld   a, [bc]
    db   $E8 ; add  sp, d
    dec  bc
    rst  $30
    rst  $38
    ld    hl, sp+$04
    dec  h
    ld   a, [bc]
    rst  $30
    rst  $38
    or   $0B
    db   $E8 ; add  sp, d
    cp   $5C
    dec  h
    ld   a, [hli]
    ld   a, [bc]
    db   $E8 ; add  sp, d
    rst  $30
    ld    hl, sp+$0B
    push af
    ld    hl, sp+$04
    daa
    add  hl, hl
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    cp   $E8
    push af
    or   $27
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   a, [$FAFD]
    ld    hl, sp+$25
    dec  h
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   a, [hli]
    ld   h, $04
    inc  b
    inc  b
    dec  bc
    inc  b
    inc  b
    dec  hl
    inc  l
    inc  l
    jr   z, label_9AF40
    inc  b
    inc  b
    dec  bc
    inc  b

label_9AF40::
    inc  b
    ld   [$F9F5], a
    ld   h, $04
    db   $E8 ; add  sp, d
    inc  b
    dec  bc
    dec  bc
    dec  bc
    ld   a, [$FFFB]
    ld   b, h
    add  hl, hl
    ld   h, $04
    inc  b
    inc  b
    inc  b
    inc  b
    pop  af
    rst  $30
    ld   a, [label_282A]
    inc  b
    db   $E8 ; add  sp, d
    cp   e
    cp   h
    ld   l, [hl]
    ld   l, $E0
    ld   c, c
    jr   z, label_9AF68
    add  hl, bc
    inc  b
    cp   l
    cp   [hl]

label_9AF68::
    inc  b
    add  hl, sp
    ld   [$FF3A], a
    ld   h, $6E
    inc  b
    dec  h
    ld   h, $04
    inc  b
    inc  b
    inc  b
    dec  h
    add  hl, hl
    ld   h, $25
    ld   a, [hli]
    add  hl, hl
    ld   h, $25
    ld   h, $25
    ld   a, [hli]
    inc  l
    inc  l
    inc  l
    dec  l
    cp   $0B
    cp   $27
    jr   z, label_9AFB1
    ld   sp, hl
    ld   b, h
    or   $38
    cp   $0B
    rst  $30
    db   $FD ; Undefined instruction
    or   $25
    rst  $38
    ld   a, [label_38F8]
    cp   $0B
    dec  bc
    call nc, label_27FE
    ld    hl, sp+$3D
    ld   [$FF4E], a
    ei
    or   $E8
    push af
    db   $FC ; Undefined instruction
    dec  h
    cpl
    ld   c, [hl]
    ld   [$FF3B], a
    rst  $30
    ld    hl, sp+$0B
    ld   b, h
    db   $FC ; Undefined instruction

label_9AFB1::
    daa
    db   $3A ; ldd  a, [hl]
    dec  sp
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    ei
    db   $FC ; Undefined instruction
    dec  h
    ld   h, $44
    ld   a, [label_BF8]
    rst  $30
    db   $FD ; Undefined instruction
    ld   a, [label_27F8]
    add  hl, hl
    ld   h, $25
    ld   h, $0B
    dec  h
    ld   h, $25
    ld   h, $25
    jr   z, label_9AFF9
    jr   z, label_9AFD8
    dec  bc
    daa
    jr   z, label_9AFFF

label_9AFD8::
    jr   z, label_9B001
    ld   h, $F6
    ld   e, h
    inc  b
    dec  bc
    inc  b
    ld   e, h
    inc  b
    ld   e, h
    dec  h
    jr   z, label_9B02A
    inc  b
    db   $E8 ; add  sp, d
    dec  bc
    ld   e, h
    inc  b
    db   $E8 ; add  sp, d
    inc  b
    daa
    ld   h, $FE
    ld   e, h
    inc  b
    dec  bc
    inc  b
    ld   e, h
    ld   b, h
    ld   e, h
    push af

label_9AFF8::
    jr   z, label_9AFF8
    inc  b
    db   $E8 ; add  sp, d
    dec  bc
    ld   e, h
    inc  b

label_9AFFF::
    db   $E8 ; add  sp, d
    push af

label_9B001::
    ld   a, [$FE26]
    ld   e, h
    inc  b
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    jr   z, label_9B052
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    or   $0B
    ld   b, h
    ld   a, [label_2526]
    ld   h, $FB
    rst  $38
    ld   b, h
    ld    hl, sp+$0B
    dec  h
    ld   h, $28
    scf
    ei
    db   $FC ; Undefined instruction
    inc  b
    dec  bc
    rst  $30
    ld   a, [label_38FF]

label_9B02A::
    ld   h, $37
    rst  $38
    rst  $38
    or   $0B
    dec  bc
    dec  bc
    rst  $30
    jr   c, label_9B05D
    inc  sp
    cpl
    cpl
    inc  a
    push af
    or   $0B
    ld   [hl], $34
    ld   sp, hl
    ld   a, [label_4F6]
    inc  sp
    dec  [hl]
    cp   $0B
    inc  b
    push af
    ld    hl, sp+$04
    rst  $30
    ld   sp, hl
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld    hl, sp+$0B
    push af
    rst  $38

label_9B052::
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    ei
    rst  $38
    ld   a, [$FAFD]
    db   $FD ; Undefined instruction
    ld   a, [$FAFD]
    db   $FD ; Undefined instruction
    ld   a, [label_25FA]
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $3A
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ei
    jr   c, label_9B087
    scf
    dec  h
    ld   h, $04
    rst  $30
    rst  $38
    ld   sp, hl
    ld   b, h
    jr   c, label_9B091
    scf
    daa
    jr   z, label_9B08B

label_9B087::
    dec  a
    ld   c, b
    ld   [rOBP1], a

label_9B08B::
    inc  [hl]
    ld   c, $2E
    ld   sp, hl
    or   $04

label_9B091::
    jr   c, label_9B0A1
    ld   c, $0E
    ld   c, $0E
    add  hl, sp
    ld   b, h
    db   $FC ; Undefined instruction
    dec  a
    inc  [hl]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    rst  $38
    ld    hl, sp+$38
    ld   c, $0E
    dec  hl
    inc  l
    inc  l
    inc  l
    inc  l
    ld    hl, sp+$04
    jr   c, label_9B0BE
    ld   c, $37
    push af
    ld   sp, hl
    ld   b, h
    ld    hl, sp+$25
    ld   h, $38
    ld   c, $0E
    scf
    ld   b, h
    rst  $38

label_9B0BE::
    db   $FC ; Undefined instruction
    dec  hl
    jr   c, label_9B0FC
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    pop  hl
    dec  sp
    inc  b
    jr   c, label_9B0D8
    jr   c, label_9B106
    ld   b, [hl]
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    jr   c, label_9B0E2
    ld   c, [hl]
    ld   c, $2E
    ld   c, b

label_9B0D8::
    ld   c, d
    ld   c, c
    cpl
    cpl
    ld   c, [hl]
    ld   c, $3B
    ld   c, $39
    db   $3A ; ldd  a, [hl]

label_9B0E2::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $2C
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l

label_9B0FC::
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

label_9B106::
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    scf
    inc  b
    ld   c, $2B
    inc  l
    inc  l
    inc  l
    inc  l
    dec  l
    ld   c, $37
    inc  b
    ld   c, $37
    add  a, $B9
    cp   c
    cp   b
    jr   c, label_9B13A
    scf
    ld   l, [hl]
    ld   c, $33
    cpl
    ld   c, b
    ld   [rOBP1], a
    inc  [hl]
    ld   c, $37
    inc  b
    ld   c, $0E

label_9B13A::
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    scf
    inc  b
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    ld   sp, label_46E
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
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  b
    ld   l, [hl]
    inc  b
    ld   l, [hl]
    inc  b
    inc  b
    ld   l, [hl]
    inc  b
    ld   l, [hl]
    inc  b
    inc  b
    jr   nz, label_9B18D
    jr   nz, label_9B1CB
    jr   nz, label_9B1DF
    jr   nz, label_9B193
    inc  b
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    inc  b
    jr   nz, label_9B1EC
    inc  b
    ld   l, [hl]
    inc  b
    jr   nz, label_9B1A3
    jr   nz, label_9B1E1
    ld   e, h
    jr   nz, label_9B18C
    inc  b
    inc  b
    inc  b
    inc  b

label_9B18C::
    jr   nz, label_9B1FC
    ld   l, [hl]
    jr   nz, label_9B1B1
    ld   l, [hl]
    ld   l, [hl]

label_9B193::
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   e, h
    jr   nz, label_9B1C1
    ld   e, h
    jr   nz, label_9B1A8
    jr   nz, label_9B1AA
    inc  l
    inc  l

label_9B1A8::
    inc  l
    inc  l

label_9B1AA::
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  b

label_9B1B1::
    inc  b
    jr   c, label_9B1C2
    ld   c, $37
    inc  b
    inc  b
    jr   c, label_9B1C8
    inc  b
    ld   e, h
    jr   c, label_9B1CC
    ld   c, $37
    inc  b

label_9B1C1::
    inc  b

label_9B1C2::
    jr   c, label_9B1D2
    ld   l, [hl]
    ld   e, h
    ldd  [hl], a
    inc  l

label_9B1C8::
    inc  l
    ld   sp, label_404

label_9B1CC::
    jr   c, label_9B1DC
    inc  b
    ld   e, h
    ld   l, [hl]
    inc  b

label_9B1D2::
    inc  b
    inc  b
    inc  b
    inc  b
    jr   c, label_9B1E6
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    inc  b

label_9B1DC::
    inc  b
    inc  b
    ld   [hl], $3C
    jr   c, label_9B1F0
    inc  b
    inc  b
    inc  b
    inc  b

label_9B1E6::
    jr   nz, label_9B208
    inc  b
    scf
    jr   c, label_9B1FA

label_9B1EC::
    inc  b
    inc  b
    inc  b
    inc  b

label_9B1F0::
    inc  b
    inc  b
    inc  b
    scf
    jr   c, label_9B204
    inc  l
    inc  l
    dec  l
    inc  b

label_9B1FA::
    dec  hl
    inc  l

label_9B1FC::
    inc  l
    ld   sp, label_E38
    ld   c, $37
    dec  h
    ld   h, $FB
    db   $FC ; Undefined instruction

label_9B206::
    dec  bc
    ld   a, [bc]

label_9B208::
    daa
    jr   z, label_9B219
    scf
    daa
    jr   z, label_9B206
    ld    hl, sp+$0B
    dec  bc
    dec  bc
    dec  bc
    ld   c, $37
    ld   [hl], $3C
    ld   e, h

label_9B219::
    ld   e, h
    ld   e, h
    dec  a
    dec  [hl]
    push af
    ld   c, $37
    or   $2E
    ld   c, b
    ld   c, d
    ld   c, c
    ld   c, [hl]
    ld   e, h
    ei
    ld   c, $37
    db   $FC ; Undefined instruction
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   sp, hl
    ld   b, h
    ld   c, $37
    ei
    or   $62
    ld   h, c
    ld   h, d
    rst  $30
    ld   a, [label_EFA]
    scf
    ei
    ld   b, h
    ld   h, d
    inc  b
    ld   h, d
    dec  bc
    dec  bc
    dec  bc
    ld   c, $37
    ei
    rst  $38
    ld   sp, hl
    ld   sp, hl
    or   $0B
    push af
    dec  h
    daa
    jr   z, label_9B27A
    jr   z, label_9B25F
    ld   a, [bc]
    ld   a, [bc]
    daa
    jr   z, label_9B281
    dec  bc
    dec  bc
    ld   d, l
    ld   e, d
    ld   d, [hl]

label_9B25F::
    ld   a, [bc]
    rst  $38
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    or   $0B
    ld   d, a
    ld   e, c
    ld   e, b
    ld   d, d
    rst  $30
    ld   b, h
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    dec  bc
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    ldh  [$FF0C], a
    ld   h, d
    ld   a, [bc]
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    dec  bc

label_9B27A::
    dec  bc
    dec  bc
    and  $0A
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_9B281::
    rst  $38
    ld   a, [label_984FD]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    rst  $38
    dec  bc
    dec  bc
    rst  $30
    ld   a, [$FAFA]
    ld   a, [label_984FA]
    ld   a, [label_B26]
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc

label_9B29D::
    dec  bc
    dec  bc
    dec  bc
    jr   z, label_9B29D
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    rst  $38
    ld   sp, hl
    db   $FC ; Undefined instruction
    ld   h, d
    ld   h, d
    ld   h, d
    ld   h, d
    ld   h, d
    ld   h, d
    ld   h, d
    ei
    rst  $38
    db   $FC ; Undefined instruction
    ld   h, d
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $0A
    rst  $38
    ld   b, h
    ld   h, d
    ld   a, [bc]
    ld   d, d
    ld   d, d
    ld   d, d
    daa
    jr   z, label_9B2D2
    rst  $38
    db   $FC ; Undefined instruction
    ld   h, d
    ld   a, [bc]
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    ld   a, [bc]
    ld   h, d
    ei

label_9B2D2::
    rst  $38
    db   $FC ; Undefined instruction
    ld   h, d
    ld   a, [bc]
    ld   a, [bc]
    dec  bc
    ld   a, [bc]
    ld   a, [bc]
    ld   h, d
    ei
    ld   a, [label_9A2F8]
    ld   h, d
    ld   h, d
    dec  bc
    ld   h, d
    ld   h, d
    ld   h, d
    ei
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    push af
    ld   sp, hl
    ld   sp, hl
    rst  $38
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    daa
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   a, [bc]
    daa
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   a, [bc]
    dec  h
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   a, [bc]
    daa
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   a, [bc]
    dec  h
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   a, [bc]
    daa
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_9B33D::
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    jr   z, label_9B369
    jr   z, label_9B36B
    jr   z, label_9B33D
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   h, $0A
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    inc  b
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    jr   z, label_9B360
    dec  h
    ld   b, l
    ld   h, $04
    dec  h
    ld   h, $0A
    ld   a, [bc]
    ld   h, $F6

label_9B360::
    daa
    pop  hl
    jr   z, label_9B368
    daa
    jr   z, label_9B371
    ld   a, [bc]

label_9B368::
    jr   z, label_9B3AE
    or   $04
    call nc, label_AF5
    ld   a, [bc]
    ld   [hl], $2F
    ld   h, $0A
    rst  $38
    ld   sp, hl
    ld   b, h
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $28
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    daa
    jr   z, label_9B3AD
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $04
    push af
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    daa
    jr   z, label_9B390
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  hl
    inc  l
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  hl
    inc  l
    inc  l
    inc  l
    inc  l
    ld   sp, label_AF5
    ld   a, [bc]
    ld   a, [bc]
    ld   [label_A04], a
    inc  b
    inc  b
    rst  $30
    rst  $38
    inc  a
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [$FF0A]
    inc  b
    ld   a, [bc]
    inc  b
    inc  b
    ei
    scf
    ld   a, [bc]
    ld   a, [bc]
    pop  af
    inc  b
    ld   a, [bc]
    inc  b
    inc  b
    push af
    rst  $38
    scf
    ld   a, [bc]
    ld   a, [bc]
    scf
    inc  b
    inc  b
    inc  b
    push af
    ld   a, [label_37FA]
    ld   a, [bc]
    ld   a, [bc]
    ld   l, $2F
    cpl
    cpl
    cpl
    cpl
    cpl
    daa
    jr   z, label_9B40A
    jr   z, label_9B40C
    jr   z, label_9B40E
    jr   z, label_9B410
    jr   z, label_9B417
    inc  l
    inc  l
    dec  l
    rrca
    rrca
    rrca
    rrca
    rrca
    ld   l, [hl]
    ld   sp, hl
    ld   sp, hl
    or   $38
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    jr   c, label_9B411
    ld   a, [de]
    db   $10 ; Undefined instruction
    ld   c, $0E
    rst  $38
    rst  $38

label_9B40A::
    rst  $38
    jr   c, label_9B41B
    ld   [de], a

label_9B40E::
    ld   e, h
    ld   de, label_E0E
    rst  $38
    ld   a, [label_38FF]
    ld   c, $12
    inc  b
    ld   de, label_E0E
    ld    hl, sp+$04
    rst  $30
    jr   c, label_9B42F
    jr   label_9B432
    rla
    ld   c, $0E
    ld   c, b
    ld   [rOBP1], a
    ld   c, [hl]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    daa
    jr   z, label_9B45A
    jr   z, label_9B45C
    add  hl, hl
    ld   a, [hli]

label_9B437::
    jr   z, label_9B460
    add  hl, hl
    ld   l, [hl]
    rrca
    rrca
    inc  d
    push af
    daa
    jr   z, label_9B437
    ld    hl, sp+$27
    ld   c, $0E
    ld   c, $12
    rst  $30
    ld   sp, hl
    ld   sp, hl
    db   $FC ; Undefined instruction
    dec  bc
    dec  bc
    ld   c, $0E
    ld   c, $12
    inc  b
    rst  $30
    ld   a, [label_BF8]
    push af
    ld   c, $0E

label_9B45A::
    ld   c, $12

label_9B45C::
    inc  b
    dec  h
    ld   h, $0B

label_9B460::
    dec  bc
    ei
    ld   c, $0E
    ld   c, $12
    inc  b
    daa
    jr   z, label_9B475
    push af
    dec  hl
    ld   c, $0E
    ld   c, $12
    inc  b
    dec  h
    ld   h, $0B
    cp   $37
    ld   c, $0E
    ld   c, $12
    inc  b
    daa
    jr   z, label_9B489
    ei
    scf
    ld   a, [hli]

label_9B481::
    jr   z, label_9B4AA
    jr   z, label_9B490
    daa
    jr   z, label_9B4AF
    jr   z, label_9B4B1
    jr   z, label_9B481
    ld   sp, hl
    ld   sp, hl
    dec  bc
    or   $25
    ld   h, $04
    inc  b
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    db   $FC ; Undefined instruction
    daa
    jr   z, label_9B4A1
    inc  b
    ld   sp, hl
    db   $FC ; Undefined instruction
    dec  hl

label_9B4A1::
    inc  l
    inc  l
    inc  l
    inc  l
    dec  l
    inc  b
    inc  b
    rst  $38
    ld    hl, sp+$37
    inc  b
    ld   l, a
    push af
    or   $32
    dec  l

label_9B4B1::
    ld   l, [hl]
    inc  l
    inc  l
    ld   sp, $F9F5
    rst  $38
    rst  $38
    or   $38
    inc  b
    dec  h
    ld   h, $F5
    rst  $38
    rst  $38
    ld   a, [$FFFA]

label_9B4C4::
    jr   c, label_9B4CA
    daa
    jr   z, label_9B4C4
    dec  hl

label_9B4CA::
    inc  l
    inc  l
    dec  l
    cp   $38

label_9B4CF::
    inc  b
    jr   z, label_9B4F9
    jr   z, label_9B4CF
    ld   b, h
    ld    hl, sp+$04
    dec  bc
    daa
    jr   z, label_9B4DF
    push af
    db   $FD ; Undefined instruction
    ld   a, [label_4F8]
    inc  b
    dec  bc
    inc  b
    dec  h
    push af
    db   $FC ; Undefined instruction
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    dec  bc
    inc  b
    daa
    rst  $30
    ld   b, h
    ld   l, [hl]
    inc  b
    inc  b
    push af
    or   $0B
    dec  bc
    dec  bc
    ld   l, [hl]

label_9B4F9::
    ld   l, [hl]
    ld   l, [hl]
    inc  b
    push af
    ld   l, [hl]
    ld   b, h
    ld   l, [hl]
    push af
    ld   sp, hl
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, h
    db   $FD ; Undefined instruction
    ld    hl, sp+$6E
    rst  $30
    rst  $38
    inc  b
    ld   l, [hl]
    inc  b
    ld   l, [hl]
    cp   $6E
    inc  b
    ld   l, [hl]
    inc  b
    rst  $30
    inc  b
    inc  b
    inc  b
    push af
    rst  $38
    or   $04
    ld   l, [hl]
    inc  b
    dec  h
    daa
    jr   z, label_9B54A
    jr   z, label_9B54C
    add  hl, hl
    ld   a, [hli]
    jr   z, label_9B550
    jr   z, label_9B551

label_9B52B::
    inc  b
    push af
    or   $25
    ld   a, [hli]
    add  hl, hl
    ld   h, $F5
    ld   sp, hl

label_9B534::
    jr   z, label_9B52B
    ld    hl, sp+$D4
    daa
    jr   z, label_9B562
    jr   z, label_9B534
    rst  $38
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    dec  bc
    rst  $30
    ld   sp, hl
    or   $25
    ld   h, $25
    ld   h, $25
    ld   h, $D3

label_9B551::
    inc  b
    rst  $38
    db   $FC ; Undefined instruction
    daa
    jr   z, label_9B57E
    jr   z, label_9B580
    jr   z, label_9B550
    ld   sp, hl
    ld   a, [$FDFA]
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction

label_9B562::
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   a, [label_26F8]
    dec  h
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    daa
    jr   z, label_9B5AB
    ld   c, $0E
    scf
    ld   a, [bc]
    rst  $38
    ld   b, h
    scf
    or   $04
    jr   c, label_9B58C

label_9B57E::
    ld   c, $37

label_9B580::
    ld   a, [bc]
    rst  $38
    rst  $38
    scf
    rst  $38
    or   $38
    ld   c, $0E
    inc  sp
    inc  a
    ld   b, h

label_9B58C::
    db   $FC ; Undefined instruction
    scf
    rst  $38
    db   $FC ; Undefined instruction
    ldd  [hl], a
    dec  l
    ld   c, $0E
    scf
    rst  $30
    db   $FC ; Undefined instruction
    scf
    ei
    rst  $38
    or   $38
    ld   c, $0E
    scf
    add  a, $FB
    scf
    ld   a, [$F8FA]
    db   $F2 ; Undefined instruction
    ld   c, $0E
    ld   [$F8F5], a

label_9B5AB::
    scf
    inc  b
    ld   l, [hl]
    inc  b
    di
    ld   c, $0E
    ld   a, [$FFFE]
    ld   l, [hl]
    scf
    ld   h, $25
    ld   h, $F4
    ld   c, $0E
    pop  af
    rst  $38
    or   $37
    dec  a
    inc  a
    or   e
    or   e
    or   e
    or   e
    or   e
    or   e
    or   e
    dec  a
    jr   c, label_9B603
    or   e
    or   e
    or   e
    or   e
    or   e
    or   e
    or   e
    jr   c, label_9B60D
    scf
    xor  l
    xor  a
    or   c
    rst  $20
    xor  l
    xor  a
    or   c
    jr   c, label_9B617
    scf
    xor  [hl]
    or   b
    or   d
    db   $E3 ; Undefined instruction
    xor  [hl]
    or   b
    or   d
    jr   c, label_9B621
    scf
    inc  bc
    inc  bc
    inc  bc
    cp   c
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_9B62B
    scf
    inc  bc
    inc  bc
    inc  bc
    cp   c
    inc  bc
    inc  bc
    inc  bc
    jr   c, label_9B635
    scf
    inc  bc
    inc  bc
    cp   c
    cp   c
    cp   c

label_9B603::
    inc  bc
    inc  bc
    jr   c, label_9B63F
    ld   l, $2F
    cpl
    ld   c, b
    ld   [rOBP1], a

label_9B60D::
    cpl
    cpl
    ld   c, [hl]
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl
    cpl

label_9B617::
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

label_9B621::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    inc  bc

label_9B62B::
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    cp   b
    inc  bc
    or   [hl]
    inc  bc

label_9B635::
    cp   b
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    or   [hl]
    inc  bc

label_9B63F::
    or   [hl]
    inc  bc
    or   [hl]
    or   [hl]
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    or   a
    inc  bc
    or   [hl]
    inc  bc
    or   a
    or   [hl]
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    or   [hl]
    or   [hl]
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
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    cp   b
    cp   c
    inc  bc
    or   [hl]
    inc  bc
    cp   c
    cp   b
    inc  bc
    or   [hl]
    inc  bc
    cp   c
    cp   c
    cp   c
    or   [hl]
    cp   c
    cp   c
    cp   c
    inc  bc
    or   a
    inc  bc
    cp   b
    cp   c
    add  a, $B6
    inc  bc
    cp   c
    cp   b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]

label_9B6AD::
    or   [hl]
    or   [hl]
    or   [hl]
    cpl
    cpl
    ld   c, [hl]
    inc  bc
    ld   l, $2F
    inc  a
    add  hl, bc
    jr   c, label_9B6C8
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    inc  bc
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    scf
    inc  bc
    jr   c, label_9B6D2
    inc  bc
    inc  bc
    or   [hl]
    cp   c

label_9B6C8::
    cp   c
    inc  bc
    scf
    inc  bc
    jr   c, label_9B6DC
    inc  bc
    cp   b
    or   [hl]
    cp   c

label_9B6D2::
    or   [hl]
    cp   b
    scf
    inc  bc
    jr   c, label_9B6E6
    inc  bc
    inc  bc
    or   [hl]
    cp   c

label_9B6DC::
    or   [hl]
    inc  bc
    scf
    inc  bc
    jr   c, label_9B6F0
    inc  bc
    cp   b
    or   a
    cp   c

label_9B6E6::
    or   a
    cp   b
    scf
    inc  bc
    ldd  [hl], a
    dec  l
    inc  bc
    inc  bc
    cp   c
    cp   c

label_9B6F0::
    cp   c
    inc  bc
    scf
    inc  bc
    inc  bc
    jr   c, label_9B6AD
    inc  bc
    or   [hl]
    cp   c
    or   [hl]
    inc  bc
    ld   l, $3C
    inc  bc
    jr   c, label_9B70F
    scf
    ld   b, h
    ld   a, [$FFFA]
    db   $FC ; Undefined instruction
    dec  bc
    cp   $27
    ld   c, $37
    ld   d, d
    ld   d, d
    ld   d, d

label_9B70F::
    ei
    db   $FC ; Undefined instruction
    dec  bc
    cp   $25
    ld   c, $37
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    rst  $30
    ld    hl, sp+$0B
    cp   $27
    ld   c, $37
    or   $04
    inc  b
    inc  b
    dec  bc
    dec  bc
    ld   b, h
    dec  h
    ld   c, $37
    rst  $38
    ld   sp, hl
    or   $0B
    dec  bc
    inc  b
    ld   e, h
    daa
    ld   c, $37
    ei
    rst  $38
    db   $FC ; Undefined instruction
    dec  bc
    push af
    or   $5C
    dec  h
    ld   c, $37
    rst  $30
    ld   a, [label_BFC]
    ei
    ld    hl, sp+$25
    ld   a, [hli]
    ld   c, $37
    dec  h
    ld   h, $FE
    dec  bc
    cp   $25
    ld   a, [hli]
    add  hl, hl
    jr   z, label_9B747
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   b, h
    ld   sp, hl
    ld   sp, hl
    ld   h, $F7
    rst  $38
    ld   b, h
    rst  $38
    rst  $38
    ld   a, [$FFFA]
    rst  $38
    jr   z, label_9B7C5
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   h, b
    ld   e, a
    ei
    rst  $38
    ld   h, $60
    ld   a, [bc]
    ld   d, l
    ld   h, c
    ld   d, [hl]
    ld   a, [bc]
    ld   h, b
    ei
    ld   b, h
    jr   z, label_9B76F
    ld   a, [bc]
    ld   d, a
    ld   e, c
    ld   e, b
    ld   a, [bc]
    rst  $38
    rst  $38
    rst  $38
    ld   h, $F7
    ld   a, [bc]
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    ld   a, [bc]
    rst  $38
    rst  $38
    rst  $38
    add  hl, hl
    ld   h, $F7
    ld    hl, sp+$04
    rst  $30
    ld   a, [label_984FA]
    ld   a, [label_292A]
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   sp, hl
    ld   sp, hl
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   a, [$FA44]
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    ei
    ld   b, h
    db   $FC ; Undefined instruction
    inc  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    inc  c
    ei
    rst  $38
    db   $FC ; Undefined instruction
    inc  c
    dec  c
    dec  h
    ld   b, l
    ld   h, $0D
    inc  c
    ei
    rst  $38
    db   $FC ; Undefined instruction
    inc  c
    dec  c
    daa
    pop  hl
    jr   z, label_9B7DD
    inc  c
    ei
    rst  $38
    db   $FC ; Undefined instruction
    inc  c
    dec  c
    dec  c
    dec  c
    dec  c
    dec  c
    inc  c
    ei
    ld   a, [label_C44]
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    inc  c
    rst  $30
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   h, $25
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    daa
    rst  $38
    rst  $38
    rst  $38
    ld    hl, sp+$5C
    ld   e, h
    ld   e, h
    rst  $30
    dec  a
    cpl
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   e, h
    ld   d, l
    ld   e, d
    ld   d, [hl]
    ld   e, h
    jr   c, label_9B81C
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   e, h
    ld   b, b
    ld   b, c
    ld   b, d
    ld   e, h
    jr   c, label_9B826
    rst  $38
    ld   b, h
    db   $FC ; Undefined instruction
    ld   e, h

label_9B81C::
    ld   e, e
    ldh  [$FF0C], a
    ld   e, e
    ld   e, h
    jr   c, label_9B830
    rst  $38
    rst  $38
    db   $FC ; Undefined instruction
    ld   e, h

label_9B826::
    inc  b
    inc  b
    inc  b
    ld   e, h
    jr   c, label_9B83A
    ld   a, [$FAFA]
    or   $5C
    ld   e, h
    dec  h
    ld   h, $38
    ld   c, $26
    dec  h
    ld   h, $25

label_9B83A::
    ld   h, $25
    ld   a, [hli]
    jr   z, label_9B871
    inc  l
    jr   z, label_9B84C
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    daa
    jr   z, label_9B887
    ld   a, [bc]

label_9B84C::
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $37
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    db   $E8 ; add  sp, d
    ld   a, [bc]
    daa
    jr   z, label_9B896
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    dec  h
    ld   h, $37
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $D4
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    daa

label_9B871::
    jr   z, label_9B8AA
    dec  h
    ld   h, $27
    jr   z, label_9B882
    ld   a, [bc]
    db   $E8 ; add  sp, d
    dec  h
    ld   h, $37
    daa
    add  hl, hl
    ld   h, $0A
    ld   a, [bc]

label_9B882::
    ld   a, [bc]
    ld   a, [bc]
    daa
    jr   z, label_9B8B8

label_9B887::
    dec  h
    ld   a, [hli]
    jr   z, label_9B895
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $37
    ld   a, [bc]
    ld   a, [bc]
    add  hl, sp
    ld   l, d

label_9B895::
    ld   l, h

label_9B896::
    ld   l, h
    ld   l, h
    ld   l, d
    db   $3A ; ldd  a, [hl]
    scf
    ld   a, [bc]
    ld   a, [bc]
    or   [hl]
    ld   l, e
    ld   h, d
    jp   nz, label_9AB62
    dec  de
    scf
    ld   a, [bc]
    ld   a, [bc]
    or   a
    ld   de, label_1B1B
    dec  de
    ld   a, [de]
    db   $10 ; Undefined instruction
    ld   a, [bc]
    ld   a, [bc]
    or   [hl]
    dec  d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    inc  b

label_9B8B8::
    scf
    ld   a, [bc]
    ld   a, [bc]
    or   a
    or   [hl]
    inc  b
    or   [hl]
    inc  b
    or   [hl]
    inc  b
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    or   a
    ld   l, [hl]
    ret  nz
    ld   l, [hl]
    or   a
    inc  b
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    or   $04
    inc  b
    ld   l, [hl]
    push af
    ld   l, $2F
    cpl
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    cpl
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    dec  sp
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   a, [de]
    db   $10 ; Undefined instruction
    add  hl, de
    ld   c, $1A
    add  hl, de
    ld   c, $1A
    db   $10 ; Undefined instruction
    inc  b
    inc  b
    ld   de, label_180E
    rla
    ld   c, $18
    rrca
    inc  b
    inc  de
    rrca
    rla
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    inc  b
    ld   de, label_E0E
    ld   c, $0E
    ld   a, [de]
    add  hl, de
    ld   c, $0E
    inc  b
    ld   de, label_1A0E
    add  hl, de
    ld   c, $18
    rla
    ld   c, $0E
    or   $11
    ld   c, $18
    rla
    ld   c, $0E
    ld   c, $0E
    ld   c, $2F
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
    ld   c, $12
    inc  b
    dec  h
    ld   h, $0B
    cp   $37
    db   $10 ; Undefined instruction
    ld   c, $12
    inc  b
    daa
    jr   z, label_9B94D
    cp   $37
    rrca
    rla
    ld   c, $18
    inc  d
    inc  b
    dec  h
    ld   h, $FE

label_9B94D::
    scf
    ld   c, $0E
    ld   c, $0E

label_9B952::
    ld   [de], a
    inc  b
    daa
    jr   z, label_9B952
    scf
    ld   c, $0E
    ld   c, $0E
    ld   [de], a
    ld   a, [bc]
    dec  h
    ld   h, $FE
    scf
    ld   c, $0E
    ld   c, $3D
    dec  [hl]
    ld   a, [bc]
    daa

label_9B969::
    jr   z, label_9B969
    scf
    ld   c, $0E
    ld   c, $38
    ld   a, [bc]
    ld   a, [bc]
    dec  h
    ld   h, $FB
    scf
    cpl
    cpl
    cpl
    ld   c, [hl]

label_9B97A::
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    daa
    jr   z, label_9B97A
    scf

label_9B980::
    dec  h
    ld   h, $FB
    scf

label_9B984::
    inc  b
    inc  b
    jr   c, label_9B984

label_9B988::
    jr   c, label_9B980
    daa
    jr   z, label_9B988
    ld   l, $2F
    cpl
    ld   c, [hl]
    ei
    jr   c, label_9B993
    dec  h
    ld   h, $FE
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    pop  hl
    dec  sp
    db   $FC ; Undefined instruction

label_9B99C::
    jr   c, label_9B9A8
    daa
    jr   z, label_9B99C
    ld   b, h
    ld    hl, sp+$04
    rst  $30
    ld    hl, sp+$38
    ld   a, [bc]

label_9B9A8::
    dec  h
    ld   h, $F7
    ld    hl, sp+$04
    dec  a
    cpl
    cpl
    ld   c, [hl]
    ld   a, [bc]
    daa
    add  hl, hl
    ld   h, $04
    push af
    jr   c, label_9B9F3
    pop  hl
    dec  sp
    ld   l, [hl]
    dec  h
    ld   a, [hli]
    jr   z, label_9B9C4
    ei
    jr   c, label_9B9CD
    ld   a, [bc]

label_9B9C4::
    ld   a, [bc]
    inc  b
    daa
    add  hl, hl
    ld   h, $04
    rst  $30
    jr   c, label_9B9D7

label_9B9CD::
    ld   l, [hl]
    cp   $6E
    inc  b
    inc  b
    inc  b
    rst  $30
    ld   b, h
    ld   a, [label_9AEF6]
    inc  b
    daa
    or   $6E
    inc  b
    ld   l, [hl]
    cp   $6E
    cp   $6E
    push af
    ld   b, h
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    inc  b
    rst  $30
    db   $FD ; Undefined instruction
    ld    hl, sp+$6E
    ei
    rst  $38
    ld    hl, sp+$6E
    inc  b
    inc  b
    jr   nz, label_9BA62
    ld   l, [hl]
    ld   l, [hl]
    ei
    rst  $38
    inc  b
    inc  b
    inc  b
    inc  b
    ld   l, [hl]
    push af
    db   $FD ; Undefined instruction
    ld   sp, hl
    rst  $38
    ld   a, [label_9AE6E]
    ld   l, [hl]
    inc  b
    ld   l, [hl]
    cp   $3D
    cpl
    cpl
    cpl
    inc  b
    inc  b
    inc  b
    inc  b
    push af
    rst  $38
    jr   c, label_9BA22
    ld   c, $0E
    ld   l, [hl]
    inc  b
    ld   l, [hl]
    inc  b
    ld   b, h
    db   $FC ; Undefined instruction
    jr   c, label_9BA2C
    ld   c, $0E
    jr   z, label_9BA49

label_9BA22::
    jr   z, label_9BA4B
    jr   z, label_9BA4D
    jr   z, label_9BA4F
    jr   z, label_9BA51
    ld   sp, hl
    or   $04
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    inc  b
    ld   b, h
    rst  $38
    or   $3D
    cpl
    cpl
    ld   c, b
    ld   [rOBP1], a
    cpl
    rst  $38
    rst  $38
    ld    hl, sp+$38
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   a, [label_3DF8]

label_9BA4B::
    inc  [hl]
    ld   c, $2B
    inc  l

label_9BA4F::
    inc  l
    inc  l

label_9BA51::
    inc  l
    cpl
    cpl
    inc  [hl]
    ld   c, $0E
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   c, $0E
    ld   c, $0E
    ld   c, $33

label_9BA62::
    ld   [$FF3C], a
    ld   a, [bc]
    ld   a, [bc]
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    ld   a, [bc]
    dec  h
    jr   z, label_9BA99
    jr   z, label_9BAAC
    ld   c, $0E
    scf
    ei
    ld   b, h
    scf
    inc  b
    inc  b
    inc  b
    jr   c, label_9BA8D
    ld   c, $37
    rst  $38
    db   $FC ; Undefined instruction
    scf
    cpl
    cpl
    cpl
    inc  [hl]
    ld   c, $0E
    scf
    ld   a, [bc]
    ld    hl, sp+$37
    ld   c, $0E
    ld   c, $0E
    ld   c, $2B
    ld   sp, label_99C0A
    scf
    inc  l

label_9BA99::
    inc  l
    inc  l
    inc  l
    inc  l
    ld   sp, label_A0A
    inc  b
    scf
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    scf

label_9BAAC::
    ld   a, [rIE]
    db   $FC ; Undefined instruction
    ld   e, h
    ld   a, [bc]
    ld   a, [bc]
    rst  $38
    ld   a, [bc]
    scf
    ld   h, $FB
    rst  $38
    rst  $38
    ld   sp, hl
    rst  $38
    ld   b, h
    rst  $38
    ld   a, [bc]
    scf
    jr   c, label_9BAFB
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    jr   c, label_9BACF
    inc  bc
    cp   c
    cp   c

label_9BACF::
    cp   c
    or   [hl]
    cp   c
    inc  bc
    inc  bc
    jr   c, label_9BAD9
    cp   c
    or   [hl]
    or   [hl]

label_9BAD9::
    or   [hl]
    or   a
    cp   c
    inc  bc
    inc  bc
    jr   c, label_9BAE3
    cp   c
    or   [hl]
    or   a

label_9BAE3::
    or   a
    cp   c
    cp   c
    inc  bc
    inc  bc
    jr   c, label_9BAED
    cp   c
    or   [hl]
    cp   b

label_9BAED::
    cp   c
    cp   c
    or   [hl]
    or   [hl]
    or   [hl]
    jr   c, label_9BAF7
    cp   c
    or   a
    cp   c

label_9BAF7::
    cp   c
    cp   c
    or   [hl]
    or   a

label_9BAFB::
    or   a
    jr   c, label_9BB01
    inc  bc
    inc  bc
    inc  bc

label_9BB01::
    inc  bc
    inc  bc
    or   a
    inc  bc
    inc  bc
    ldd  [hl], a
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    or   a
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    or   a
    or   a
    or   a
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    cp   b
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    or   [hl]
    inc  bc
    inc  bc
    or   [hl]
    or   a
    or   a
    or   a
    or   a
    or   a
    or   a
    or   a
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   a
    inc  bc
    inc  bc
    inc  bc
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    or   a
    or   a
    or   a
    or   a
    or   a
    or   a
    or   a
    or   [hl]
    or   a
    or   a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    cp   c
    cp   b
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    cp   c
    cp   c
    cp   c
    or   [hl]
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    or   [hl]
    inc  bc
    cp   c
    cp   c
    cp   c

label_9BB85::
    or   [hl]
    or   [hl]
    or   [hl]
    or   a
    inc  bc
    or   [hl]
    inc  bc
    cp   b
    cp   c
    inc  bc
    or   a

label_9BB90::
    or   a
    or   a
    inc  bc
    inc  bc
    or   [hl]
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    or   a
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  bc
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l
    or   a
    inc  bc
    or   [hl]
    cp   c
    or   [hl]
    inc  bc
    add  hl, sp
    scf
    inc  bc
    jr   c, label_9BBBE
    inc  bc
    or   a
    cp   c

label_9BBBE::
    or   a
    inc  bc
    inc  bc
    scf
    inc  bc
    jr   c, label_9BBC8
    inc  bc
    inc  bc
    inc  bc

label_9BBC8::
    inc  bc
    inc  bc
    inc  bc
    scf
    add  hl, bc
    jr   c, label_9BB85
    inc  bc
    or   [hl]
    cp   b
    or   [hl]
    inc  bc
    inc  bc
    scf
    inc  bc
    jr   c, label_9BB90
    cp   c
    or   a
    cp   c
    or   a
    cp   c
    inc  bc
    scf
    inc  bc
    jr   c, label_9BBE6
    cp   c
    cp   c
    inc  bc

label_9BBE6::
    cp   c
    cp   b
    inc  bc
    scf
    inc  bc
    jr   c, label_9BBF0
    inc  bc
    inc  bc
    inc  bc

label_9BBF0::
    inc  bc
    inc  bc
    inc  bc
    scf
    add  hl, bc
    jr   c, label_9BC23
    inc  l
    inc  l
    inc  l
    inc  l
    inc  l

label_9BBFC::
    inc  l
    ld   sp, label_3803
    ld   c, $37
    daa
    jr   z, label_9BBFC
    dec  bc
    ld    hl, sp+$27
    jr   z, label_9BC31
    ld   c, $37
    or   $04
    call nc, label_B0B
    push af
    ld   sp, hl
    db   $FD ; Undefined instruction
    dec  hl
    ld   sp, label_3C36
    or   $04
    dec  bc
    ld   b, h
    dec  a
    cpl
    scf
    push af
    or   $2E
    cpl

label_9BC23::
    ld   c, b
    ld   b, e
    ld   c, c
    ld   c, [hl]
    push af
    scf
    ei
    rst  $38
    add  hl, sp
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp

label_9BC31::
    ei
    scf
    rst  $38
    rst  $38
    rst  $38
    ld   a, [label_B44]
    ei
    ld   sp, hl
    ld   a, [$F737]
    ld   a, [label_BF8]
    dec  bc
    dec  bc
    rst  $30
    dec  a
    cpl
    ld   l, $2F
    cpl
    ld   c, b
    ld   b, e
    ld   c, c
    cpl
    cpl
    ld   c, [hl]
    ld    hl, sp+$28
    daa
    jr   z, label_9BC7B
    jr   z, label_9BC7D
    jr   z, label_9BC7F
    jr   z, label_9BC81
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   b, h
    db   $FD ; Undefined instruction
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    cpl
    cpl
    cpl
    dec  [hl]
    ei
    db   $FC ; Undefined instruction
    ld   e, h
    ld   e, h
    ei
    ld   a, [$FFF9]
    ld   a, [$FAFD]
    ld   a, [$F9F9]
    db   $FC ; Undefined instruction
    dec  h
    rst  $38
    db   $FC ; Undefined instruction
    ld   e, h

label_9BC7B::
    ld   e, h
    ld   e, h

label_9BC7D::
    db   $E8 ; add  sp, d
    rst  $30

label_9BC7F::
    rst  $38
    db   $FC ; Undefined instruction

label_9BC81::
    daa
    ld   a, [$F9FF]
    ld   sp, hl
    or   $04
    dec  a
    dec  [hl]
    cp   $25
    dec  [hl]
    ei
    ld   b, h
    rst  $38
    rst  $38
    or   $38
    push af
    ld   b, h

label_9BC95::
    daa
    push af
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    rst  $38
    jr   c, label_9BC95
    db   $FC ; Undefined instruction
    dec  h
    jr   z, label_9BCC9
    jr   z, label_9BCCB
    jr   z, label_9BCCD
    jr   z, label_9BCCF
    jr   z, label_9BCD1
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    ld   a, [$F944]
    ld   sp, hl
    ld   sp, hl
    ld   a, [label_984FF]
    rst  $38
    ld    hl, sp+$04
    rst  $30
    ld   a, [$F8FA]

label_9BCBE::
    ld   h, $F7
    ld   a, [label_4F8]
    dec  h
    ld   h, $25
    ld   h, $25
    jr   z, label_9BCEF
    ld   h, $E8
    inc  b

label_9BCCD::
    daa
    jr   z, label_9BCF7
    jr   z, label_9BCF9
    ld   h, $27
    jr   z, label_9BCBE
    db   $E8 ; add  sp, d
    db   $E8 ; add  sp, d
    push af
    ld   sp, hl
    ld   sp, hl
    db   $FD ; Undefined instruction
    jr   z, label_9BCD3
    or   $04
    inc  b
    push af
    rst  $38
    rst  $38
    ld    hl, sp+$25
    ld   h, $FB
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    ei
    rst  $38
    db   $FC ; Undefined instruction
    dec  h

label_9BCEF::
    ld   a, [hli]
    jr   z, label_9BD19
    jr   z, label_9BD1B
    jr   z, label_9BD1D
    add  hl, hl

label_9BCF7::
    ld   h, $25

label_9BCF9::
    ld   h, $FD
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    ld   sp, hl
    or   $27
    jr   z, label_9BD2A
    add  hl, hl
    inc  b
    inc  b
    rst  $30
    ld   b, h
    ld   a, [$F6FF]
    inc  b
    inc  b
    daa
    ld   h, $25
    ld   h, $FE
    ld   e, h
    ei
    ld   b, h
    or   $5C

label_9BD17::
    dec  h
    jr   z, label_9BD41
    jr   z, label_9BD17
    ld   sp, hl

label_9BD1D::
    rst  $38
    ld   a, [$F6FF]
    daa
    db   $FD ; Undefined instruction
    ld   sp, hl
    ld   sp, hl
    rst  $38
    ld   b, h
    db   $FC ; Undefined instruction
    ld   e, h
    ei

label_9BD2A::
    ld    hl, sp+$25
    ld   h, $F7
    ld   a, [$FFFA]
    rst  $38
    ld   sp, hl
    ld    hl, sp+$04
    daa
    add  hl, hl
    ld   h, $25
    ld   h, $2B
    inc  l
    inc  l
    inc  l
    dec  l
    dec  h
    dec  h

label_9BD41::
    ld   a, [hli]
    add  hl, hl
    ld   h, $0A
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    daa
    jr   z, label_9BD75
    jr   z, label_9BD74
    jr   z, label_9BD59
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    jr   z, label_9BD60
    call nc, label_A0A

label_9BD59::
    ld   a, [de]
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    ld   h, $0A

label_9BD60::
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [de]
    ld   d, $E8
    call nc, label_404
    add  hl, hl
    ld   h, $E8
    ld   a, [bc]
    ld   [de], a
    inc  b
    inc  de
    rrca
    rrca
    dec  h
    ld   a, [hli]
    jr   z, label_9BDE3

label_9BD75::
    ld   a, [de]
    ld   d, $04
    ld   de, label_1BD4
    daa
    jr   z, label_9BD66
    ld   a, [bc]
    ld   [de], a
    inc  b
    call nc, label_1B11
    dec  de
    dec  de
    ld   h, $0A
    ld   a, [bc]
    ld   [de], a

label_9BD8A::
    inc  b
    inc  b
    dec  d
    db   $10 ; Undefined instruction
    db   $10 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   [$FF3A], a
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]

label_9BD9D::
    ld   a, [bc]
    dec  h
    ld   h, $0A
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    db   $10 ; Undefined instruction
    call nc, label_270A
    add  hl, hl
    ld   h, $0A
    ld   a, [bc]
    ld   a, [bc]
    inc  b
    dec  d
    db   $10 ; Undefined instruction
    add  hl, de
    daa
    jr   z, label_9BD8A
    ld   l, [hl]
    dec  h
    ld   h, $0F
    inc  d
    ld   b, h
    dec  d
    db   $10 ; Undefined instruction
    add  hl, de
    ld   a, [bc]
    daa
    jr   z, label_9BDDF
    jr   label_9BDDA
    inc  b
    jr   nz, label_9BD9D
    ld   de, label_250A
    dec  de
    dec  de
    dec  de
    ld   [de], a
    call nc, label_F13
    rla
    ld   a, [bc]
    daa
    add  hl, de
    dec  de
    dec  de
    ld   [de], a

label_9BDDA::
    ld   b, h
    ld   de, label_A0A
    ld   a, [bc]

label_9BDDF::
    dec  h
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]

label_9BDE3::
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   l, [hl]
    ld   a, [bc]
    ld   l, a
    ld   a, [bc]
    ld   l, [hl]
    ld   a, [bc]
    ld   a, [bc]
    dec  hl
    inc  l
    inc  l
    dec  l
    ld   a, [bc]
    ld   e, h
    ld   a, [bc]
    ld   a, [bc]
    ld   h, $0A
    ld   l, $2F
    cpl
    ld   c, [hl]
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    ld   l, [hl]
    jr   z, label_9BE14
    add  hl, sp
    pop  hl
    db   $3A ; ldd  a, [hl]
    dec  sp
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]
    ld   h, $0A

label_9BE14::
    ld   l, [hl]
    ld   a, [bc]
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    jr   z, label_9BE28
    ld   l, [hl]
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   a, [bc]
    ld   h, $0A

label_9BE28::
    ld   l, [hl]
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   a, [bc]
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    db   $3A ; ldd  a, [hl]
    dec  sp
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   l, [hl]
    ei
    scf
    db   $D3 ; Undefined instruction
    ld   e, h
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   e, h
    ld   e, h
    ld   l, [hl]
    cp   $37
    ld   a, [bc]
    ld   e, h
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   e, h
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   l, [hl]
    db   $FC ; Undefined instruction
    scf
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   e, h
    ld   l, [hl]
    ei
    scf
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   l, [hl]
    cp   $37
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   e, h
    ld   e, h
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   l, [hl]
    db   $FC ; Undefined instruction
    scf
    ld   a, [bc]
    ld   e, h
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   e, h
    db   $D3 ; Undefined instruction
    ld   e, h
    ld   l, [hl]
    db   $FC ; Undefined instruction
    scf
    db   $D3 ; Undefined instruction
    ld   a, [bc]
    db   $D3 ; Undefined instruction
    db   $D3 ; Undefined instruction
    ld   a, [bc]
    db   $D3 ; Undefined instruction
    ld   a, [bc]
    ld   l, [hl]
    ei
    scf
    inc  bc
    daa
    jr   z, label_9BE8D
    add  hl, bc
    jr   c, label_9BE91
    ld   l, [hl]
    cp   $6E
    inc  bc
    add  hl, bc
    inc  bc

label_9BE8D::
    dec  a
    cpl
    ld   c, [hl]
    ld   a, [bc]

label_9BE91::
    ld   a, [$F9FA]
    add  hl, bc
    inc  b
    add  hl, bc
    jr   c, label_9BED3
    dec  sp
    ld   l, [hl]
    ld   l, [hl]
    inc  b
    rst  $30
    dec  a
    cpl
    cpl
    ld   c, [hl]
    ld   a, [bc]
    ld   a, [bc]
    or   $04
    dec  a
    cpl
    jr   c, label_9BEE4
    pop  hl
    dec  sp
    ld   a, [bc]
    rst  $38
    ld    hl, sp+$04
    jr   c, label_9BEC0
    jr   c, label_9BEBE
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    db   $FC ; Undefined instruction
    inc  b
    inc  b
    jr   c, label_9BECA
    jr   c, label_9BEC8

label_9BEBE::
    ld   a, [bc]
    ld   a, [bc]

label_9BEC0::
    rst  $38
    db   $FC ; Undefined instruction
    inc  b
    dec  a
    ld   c, [hl]
    ld   c, $38
    ld   a, [bc]

label_9BEC8::
    ld   a, [bc]
    rst  $38

label_9BECA::
    rst  $38
    ld    hl, sp+$04
    jr   c, label_9BF0E
    ld   c, $6E
    inc  b
    ld   l, [hl]

label_9BED3::
    inc  b
    rst  $30
    ld    hl, sp+$38
    ld   c, $0E
    ld   c, $F6
    inc  b
    inc  b
    dec  a
    cpl
    cpl
    inc  [hl]
    jp   z, label_E0E

label_9BEE4::
    db   $FC ; Undefined instruction
    inc  b
    push af
    jr   c, label_9BEF7
    ld   c, $0E
    ld   c, $0E
    ld   c, $48
    ld   [rOBP1], a
    inc  [hl]
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
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E

label_9BF0E::
    jp   z, label_E0E
    ld   d, c
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
    ld   c, $37
    ld   a, [bc]
    daa
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    db   $FC ; Undefined instruction
    dec  h
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    cp   $27
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    ld    hl, sp+$25
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    inc  b
    daa
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    inc  b
    dec  h
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    inc  b
    daa
    ld   c, $0E
    ld   c, $0E
    ld   c, $0E
    ld   c, $37
    inc  b
    dec  h
    jr   z, label_9BF7C
    rst  $38
    rst  $38
    ld   a, [label_984FF]
    ld   a, [bc]
    ld   a, [bc]
    ld   l, $26
    ld   b, h

label_9BF7C::
    ld   a, [bc]
    ld    hl, sp+$04
    rst  $30
    ld   a, [bc]
    ld   a, [bc]
    ld   a, [bc]
    add  hl, sp
    jr   z, label_9BF90
    ld    hl, sp+$5C
    push af
    or   $5C
    dec  h
    ld   h, $04
    ld   h, $FE

label_9BF90::
    inc  b
    push af
    rst  $38
    rst  $38
    or   $27
    add  hl, hl
    ld   h, $28
    ld   a, [bc]
    or   $F7
    rst  $38
    ld   b, h
    ld    hl, sp+$D4
    daa
    jr   z, label_9BFC9
    ld   a, [bc]
    ld   a, [bc]
    ld   e, h
    ei
    ld    hl, sp+$5C
    push af
    ld   b, h
    db   $FC ; Undefined instruction
    jr   z, label_9BFB8
    ld   a, [bc]
    ld   a, [bc]
    ld    hl, sp+$04
    push af
    ld   b, h
    dec  h
    ld   h, $26
    ld   a, [bc]

label_9BFB8::
    ld   a, [bc]
    db   $FC ; Undefined instruction
    inc  b
    push af
    rst  $38
    db   $FC ; Undefined instruction
    daa
    jr   z, label_9BFC1

label_9BFC1::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_9BFC9::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
