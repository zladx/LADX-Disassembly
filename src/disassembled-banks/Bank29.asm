section "bank29",romx,bank[$1D]
    ld   b, l
    ld   l, [hl]
    ld   l, [hl]
    ld   l, b
    ccf
    jr   nz, label_74027
    ld   d, a
    ld   l, b
    ld   l, a
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_7402E
    jr   nz, label_74030
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_74089
    ld   [hl], l
    ld   [hl], e
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    dec  l
    ld   l, h
    ld   l, a
    ld   l, a
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_74027::
    jr   nz, label_7409B
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ccf
    ld   hl, label_2020

label_74030::
    ld   c, a
    ld   l, e
    ld   h, c
    ld   a, c
    jr   nz, label_74098
    ld   l, a
    ld   a, c
    ld   [hl], e
    inc  l
    jr   nz, label_740A8
    ld   h, l
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_740B7
    ld   l, c
    ld   h, h
    ld   h, h
    ld   h, c
    jr   nz, label_740B3
    ld   l, c
    ld   l, l
    ld   hl, label_759FF
    ld   l, a
    ld   [hl], l
    jr   nz, label_740C1
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_740BB
    ld   h, l
    jr   nz, label_740BD
    ld   l, [hl]
    jr   nz, label_7407F
    ld   h, c
    ld   [hl], e
    ld   [hl], e
    ld   h, c
    ld   [hl], e
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    jr   nz, label_740DC
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_740D0
    ld   a, c
    ld   c, l
    ld   h, c
    ld   h, h
    ld   h, c
    ld   l, l
    jr   nz, label_740C3
    ld   h, l
    ld   l, a
    ld   [hl], a
    ld   c, l
    ld   h, l
    ld   l, a
    ld   [hl], a
    jr   nz, label_7409F

label_7407F::
    ld   [hl], h
    ld   l, a
    jr   nz, label_740F5
    ld   h, l
    ld   [hl], e
    ld   h, e
    ld   [hl], l
    ld   h, l
    jr   nz, label_740FE
    ld   l, b
    ld   h, l
    jr   nz, label_740AE
    jr   nz, label_740FD
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   hl, label_2020
    ld   e, c
    ld   l, a

label_74098::
    ld   [hl], l
    jr   nz, label_740FE

label_7409B::
    ld   h, c
    ld   l, l
    ld   h, l
    jr   nz, label_74108
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_74119
    ld   l, a
    jr   nz, label_7410F

label_740A8::
    ld   h, l
    ld   [hl], h
    jr   nz, label_74119
    ld   h, l
    inc  l

label_740AE::
    jr   nz, label_74112
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_7411D
    ld   [hl], h
    jr   nz, label_74120

label_740B7::
    ld   [hl], e
    jr   nz, label_74103
    jr   nz, label_74133
    ld   l, b

label_740BD::
    ld   l, a
    jr   nz, label_74137
    ld   l, c

label_740C1::
    ld   l, h
    ld   l, h

label_740C3::
    jr   nz, label_7412C
    ld   h, l
    ld   [hl], h
    jr   nz, label_74142
    ld   l, a
    ld   [hl], l
    ld   hl, rNR42
    ld   c, a
    ld   l, b

label_740D0::
    inc  l
    jr   nz, label_740F6
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   l, $20
    jr   nz, label_74124
    jr   nz, label_740FD
    jr   nz, label_7414E
    ld   h, [hl]
    ld   [hl], h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_74148
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_7415E
    ld   l, a
    jr   nz, label_7410D
    jr   nz, label_74163
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_7416A
    ld   l, c

label_740F5::
    ld   l, h

label_740F6::
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_74170
    ld   l, a

label_740FD::
    jr   nz, label_74172
    ld   l, c
    ld   l, [hl]
    ld   h, a
    inc  l

label_74103::
    jr   nz, label_74179
    ld   l, a
    ld   l, a
    ld   hl, label_2020
    ld   c, c
    ld   [hl], h
    jr   nz, label_7412E
    ld   [hl], e

label_7410F::
    ld   h, l
    ld   h, l
    ld   l, l

label_74112::
    ld   [hl], e
    jr   nz, label_74189
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_74184
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_7411D::
    jr   nz, label_74180
    ld   h, d

label_74120::
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_7418A
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   a, c
    ld   l, a
    ld   l, [hl]
    ld   h, l

label_7412C::
    jr   nz, label_7414E

label_7412E::
    ld   l, h
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    ld   [hl], e

label_74133::
    jr   nz, label_741A2
    ld   a, c
    jr   nz, label_74196
    ld   b, d
    ld   h, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, h
    ld   l, a
    ld   h, [hl]
    jr   nz, label_741B6

label_74142::
    ld   l, b
    ld   h, l
    jr   nz, label_7419D
    ld   l, c
    ld   l, [hl]

label_74148::
    ld   h, h
    jr   nz, label_7416B
    jr   nz, label_7416D
    jr   nz, label_74195
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   hl, label_205E
    jr   nz, label_7417A
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_7417E

label_7415E::
    ld   [hl], a
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_741CD
    ld   [hl], e
    jr   nz, label_741E0
    ld   l, a
    ld   [hl], l
    ld   [hl], d

label_7416A::
    jr   nz, label_7418C
    jr   nz, label_7418E
    ld   h, [hl]
    ld   h, c

label_74170::
    db   $76 ; Halt
    ld   l, a

label_74172::
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    ld   h, l
    jr   nz, label_741EB
    ld   l, a

label_74179::
    ld   l, [hl]

label_7417A::
    ld   h, a
    ccf
    rst  $38
    ld   d, b

label_7417E::
    ld   l, h
    ld   h, l

label_74180::
    ld   h, c
    ld   [hl], e
    ld   h, l
    inc  l

label_74184::
    jr   nz, label_741EA
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]

label_74189::
    ld   [hl], h

label_7418A::
    jr   nz, label_741AC

label_7418C::
    jr   nz, label_741F3

label_7418E::
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_741F9
    ld   l, a
    ld   [hl], d

label_74195::
    ld   h, a

label_74196::
    ld   h, l
    ld   [hl], h
    jr   nz, label_7420E
    ld   l, b
    ld   l, c
    ld   [hl], e

label_7419D::
    ld   [hl], e
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   l, $2E
    ld   l, $6F
    ld   [hl], d
    jr   nz, label_74215
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   d, h
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_7422D
    ld   l, a
    ld   [hl], l

label_741B6::
    jr   nz, label_7421E
    ld   l, a
    ld   [hl], d
    jr   nz, label_741DC
    jr   nz, label_74223
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   a, c
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   hl, label_2020
    jr   nz, label_741EC
    jr   nz, label_741F1
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_7424E
    ld   l, a
    ld   [hl], l
    jr   nz, label_7423A
    ld   [hl], d
    ld   h, l
    jr   nz, label_741FD
    ld   [hl], h
    ld   l, b
    ld   h, l

label_741E0::
    jr   nz, label_7424D
    ld   l, c
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_7424C

label_741EA::
    ld   l, a

label_741EB::
    ld   a, c

label_741EC::
    jr   nz, label_74237
    jr   nz, label_7425B
    ld   l, [hl]

label_741F1::
    ld   l, a
    ld   [hl], a

label_741F3::
    ld   l, $20
    jr   nz, label_74246
    ld   l, [hl]
    ld   h, l

label_741F9::
    jr   nz, label_7425F
    ld   h, c
    ld   a, c

label_741FD::
    ld   c, c
    jr   nz, label_7426D
    ld   h, c
    ld   h, h
    ld   h, l
    jr   nz, label_74266
    jr   nz, label_7427E
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_74280
    ld   l, a
    ld   [hl], h

label_7420E::
    ld   l, b
    ld   h, l
    jr   nz, label_74269
    ld   l, c
    ld   l, [hl]
    ld   h, h

label_74215::
    jr   nz, label_7425D
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   l, $2E
    ld   l, $57

label_7421E::
    ld   l, b
    ld   h, c

label_74220::
    ld   [hl], h
    jr   nz, label_7429A

label_74223::
    ld   h, c
    ld   [hl], e
    jr   nz, label_7429B
    ld   l, b
    ld   h, l
    jr   nz, label_7424B
    jr   nz, label_7424D

label_7422D::
    ld   [hl], a
    ld   l, c
    ld   [hl], e
    ld   l, b
    ccf
    jr   nz, label_74254
    ld   c, c
    ld   [hl], h
    jr   nz, label_742AF
    ld   h, c
    ld   [hl], e

label_7423A::
    ld   l, $2E
    ld   l, $4E
    ld   l, a
    inc  l
    jr   nz, label_742AB
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_742BA
    ld   h, l
    ld   h, e
    ld   [hl], d
    ld   h, l

label_7424B::
    ld   [hl], h

label_7424C::
    ld   hl, label_23FF
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l

label_74254::
    jr   nz, label_742C9
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_742BF

label_7425B::
    ld   h, c
    ld   a, c

label_7425D::
    jr   nz, label_742D8

label_7425F::
    ld   l, a
    ld   [hl], l
    jr   nz, label_742DA
    ld   l, c
    ld   l, h
    ld   l, h

label_74266::
    jr   nz, label_742D4
    ld   h, l

label_74269::
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_7428E
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_742DD
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_742C8
    jr   nz, label_742EB
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_742F1
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_742F4
    ld   [hl], h
    jr   nz, label_742AE

label_7428E::
    ld   l, c
    ld   l, [hl]
    jr   nz, label_742FF
    ld   a, c
    jr   nz, label_742FD
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   l, $2E

label_7429B::
    ld   l, $20
    jr   nz, label_742CD
    ld   l, $2E
    ld   b, h
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_7430D
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d

label_742AB::
    jr   nz, label_742CD
    jr   nz, label_74315

label_742AF::
    ld   l, a
    ld   [hl], d
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_74323
    ld   h, l
    ld   l, $2E
    ld   l, $20
    ld   c, c
    ld   h, [hl]
    jr   nz, label_74338

label_742BF::
    ld   l, a
    ld   [hl], l
    jr   nz, label_74327
    ld   l, a
    inc  l
    jr   nz, label_74310
    ld   e, [hl]

label_742C8::
    ld   l, h

label_742C9::
    ld   l, h
    jr   nz, label_742EC
    jr   nz, label_742EE
    ld   l, [hl]
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_7433B
    ld   l, a
    ld   [hl], d
    ld   h, a

label_742D8::
    ld   l, c
    db   $76 ; Halt

label_742DA::
    ld   h, l
    jr   nz, label_742FD

label_742DD::
    jr   nz, label_74358
    ld   l, a
    ld   [hl], l
    ld   hl, label_2EFF
    ld   l, $2E
    jr   nz, label_74316
    ld   l, $2E
    jr   nz, label_7431A

label_742EC::
    ld   l, $2E

label_742EE::
    jr   nz, label_7431E
    ld   l, $2E
    jr   nz, label_7433D

label_742F4::
    ld   [hl], h
    jr   nz, label_7436A
    ld   h, l
    ld   h, l
    ld   l, l
    ld   [hl], e
    jr   nz, label_74371

label_742FD::
    ld   l, a
    jr   nz, label_74362
    ld   h, l
    jr   nz, label_74323
    ld   [hl], h
    ld   l, a
    ld   [hl], h
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    jr   nz, label_7436D
    ld   h, d

label_7430D::
    ld   [hl], e
    ld   l, a
    ld   [hl], d

label_74310::
    ld   h, d
    ld   h, l
    ld   h, h
    ld   l, c
    ld   l, [hl]

label_74315::
    jr   nz, label_74364
    ld   h, c
    ld   [hl], d
    ld   l, c

label_7431A::
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_74392
    ld   l, a

label_74320::
    ld   l, [hl]
    ld   h, a
    ld   hl, label_754FF
    ld   l, b
    ld   h, l

label_74327::
    ld   a, c
    jr   nz, label_7439D
    ld   h, c
    ld   a, c
    jr   nz, label_743A2
    ld   l, b
    ld   h, l
    jr   nz, label_74352
    jr   nz, label_74354
    ld   e, [hl]
    ld   b, d
    ld   h, c
    ld   l, h

label_74338::
    ld   l, h
    ld   h, c
    ld   h, h

label_7433B::
    jr   nz, label_743AC

label_7433D::
    ld   h, [hl]
    jr   nz, label_743B4
    ld   l, b
    ld   h, l
    jr   nz, label_74364
    ld   d, a
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_74390
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   e, [hl]
    jr   nz, label_743B9
    ld   [hl], e
    jr   nz, label_743B4
    jr   nz, label_743C8
    ld   l, a
    ld   l, [hl]
    ld   h, a

label_74358::
    jr   nz, label_743C9
    ld   h, [hl]
    jr   nz, label_743BE
    ld   [hl], a
    ld   h, c
    ld   l, e
    ld   h, l
    ld   l, [hl]

label_74362::
    dec  l
    jr   nz, label_743CE
    ld   l, [hl]
    ld   h, a
    ld   l, $20
    jr   nz, label_743B4
    jr   nz, label_743E4

label_7436D::
    ld   l, a
    ld   l, [hl]
    ld   h, h
    ld   h, l

label_74371::
    ld   [hl], d
    inc  l
    jr   nz, label_743DE
    ld   h, [hl]
    jr   nz, label_743EC
    ld   l, b
    ld   h, l
    jr   nz, label_743D3
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_743C7
    ld   l, c
    ld   [hl], e
    ld   l, b
    ld   [hl], a
    ld   h, c
    ld   l, e
    ld   h, l
    ld   [hl], e
    jr   nz, label_74400
    ld   [hl], b
    inc  l
    jr   nz, label_74406
    ld   l, c

label_74390::
    ld   l, h
    ld   l, h

label_74392::
    jr   nz, label_743B4
    ld   l, b
    ld   h, l
    jr   nz, label_74405
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_7440A

label_7439D::
    ld   a, c
    jr   nz, label_74417
    ld   l, c
    ld   [hl], e

label_743A2::
    ld   l, b
    jr   nz, label_74408
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_7441E
    ld   [hl], d
    ld   [hl], l

label_743AC::
    ld   h, l
    ccf
    rst  $38
    ld   b, l
    ld   l, b
    ccf
    jr   nz, label_743D4

label_743B4::
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_74430

label_743B9::
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_7442B

label_743BE::
    ld   h, l
    ld   [hl], h
    ld   l, a
    jr   nz, label_7442A
    ld   l, a
    jr   nz, label_7442F
    ld   l, [hl]

label_743C7::
    jr   nz, label_7443D

label_743C9::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ccf

label_743CE::
    jr   nz, label_7441E
    ld   l, a
    inc  l
    jr   nz, label_7441D

label_743D4::
    jr   nz, label_7444A
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_74425
    ld   e, [hl]
    ld   l, h

label_743DE::
    ld   l, h
    ld   [hl], a
    ld   h, c
    ld   l, c
    ld   [hl], h
    jr   nz, label_74454
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_74451
    ld   h, l
    ld   [hl], d
    ld   h, l

label_743EC::
    ld   l, $2E
    ld   l, $54
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_74458
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_74469
    ld   h, [hl]
    jr   nz, label_7441D
    jr   nz, label_7441F
    ld   a, c

label_74400::
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   [hl], e
    ld   h, l

label_74405::
    ld   l, h

label_74406::
    ld   h, [hl]
    inc  l

label_74408::
    jr   nz, label_7442D

label_7440A::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   hl, label_741FF
    ld   l, b
    ld   l, b
    ld   l, b
    ld   hl, label_2020

label_74417::
    ld   b, c
    ld   l, b
    ld   l, b
    ld   l, b
    inc  l
    jr   nz, label_74497

label_7441E::
    ld   l, a

label_7441F::
    ld   [hl], l

label_74420::
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_74486

label_74425::
    jr   nz, label_74489
    ld   h, c
    ld   h, h
    jr   nz, label_7448D

label_7442B::
    ld   l, a
    ld   a, c

label_7442D::
    inc  l
    jr   nz, label_74450

label_74430::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   hl, label_748FF
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   [hl], e

label_7443D::
    jr   nz, label_744B2
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_74464
    jr   nz, label_74466
    jr   nz, label_744AA
    ld   l, a
    ld   l, [hl]

label_7444A::
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_744C2
    ld   [hl], d
    ld   h, l

label_74450::
    ld   h, c

label_74451::
    ld   [hl], h
    ld   l, l
    ld   h, l

label_74454::
    ld   l, [hl]
    ld   [hl], h
    ld   hl, label_76542
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, h
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   [hl], d

label_74464::
    jr   nz, label_74486

label_74466::
    jr   nz, label_744B0
    ld   h, l

label_74469::
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_744D0
    ld   [hl], d
    ld   h, l
    jr   nz, label_744D9
    ld   [hl], l
    ld   l, h
    ld   l, h
    ld   hl, label_759FF
    ld   h, c
    inc  l
    jr   nz, label_744C6
    jr   nz, label_744E0
    ld   l, l
    jr   nz, label_744D5
    ld   h, e
    ld   l, b
    ld   [hl], l
    ld   l, h

label_74486::
    ld   h, l
    jr   nz, label_744CD

label_74489::
    ld   l, a
    ld   l, [hl]
    ld   h, c
    db   $76 ; Halt

label_7448D::
    ld   l, c
    ld   [hl], h
    ld   h, e
    ld   l, b
    ld   hl, label_2020
    ld   e, d
    ld   h, l
    ld   h, l

label_74497::
    jr   nz, label_74506
    ld   h, l
    ld   [hl], d
    ld   l, l
    ld   h, c
    ld   l, c
    ld   h, h
    jr   nz, label_74514
    ld   [hl], h
    ld   h, c
    ld   [hl], h
    ld   [hl], l
    ld   h, l
    jr   nz, label_744C8
    ld   h, d
    ld   a, c

label_744AA::
    jr   nz, label_74526
    ld   h, l
    ld   h, l
    jr   nz, label_74512

label_744B0::
    ld   h, c
    ld   a, c

label_744B2::
    jr   nz, label_7451D
    ld   a, d
    jr   nz, label_74524
    ld   a, c
    ld   l, l
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   [hl], b
    ld   l, c
    ld   h, l
    ld   h, e

label_744C2::
    ld   h, l
    ld   hl, label_2E20

label_744C6::
    ld   l, $2E

label_744C8::
    ld   d, h
    ld   l, a
    jr   nz, label_74540
    ld   h, l

label_744CD::
    ld   l, h
    ld   l, h
    jr   nz, label_7454A
    ld   l, a
    ld   [hl], l
    jr   nz, label_7454F

label_744D5::
    ld   h, l
    ld   h, l
    jr   nz, label_7454D

label_744D9::
    ld   [hl], d
    ld   [hl], l
    ld   [hl], h
    ld   l, b
    inc  l
    jr   nz, label_7455A

label_744E0::
    ld   l, c
    ld   [hl], e
    jr   nz, label_7455B
    ld   h, l
    ld   [hl], d
    ld   l, e
    jr   nz, label_74552
    ld   a, d
    jr   nz, label_7455A
    ld   l, a
    ld   [hl], h
    jr   nz, label_74553
    ld   l, a
    ld   l, l
    ld   [hl], b
    ld   l, h
    ld   h, l
    ld   [hl], h
    ld   h, l
    ld   hl, label_7655A
    ld   h, l
    jr   nz, label_7455E
    ld   [hl], d
    ld   [hl], h
    inc  l
    jr   nz, label_7456B
    ld   [hl], h
    ld   e, [hl]
    ld   a, d
    ld   l, $2E
    ld   l, $64
    ld   l, c
    ld   h, [hl]
    ld   h, [hl]
    ld   l, c
    ld   h, e
    ld   [hl], l
    ld   l, h
    ld   [hl], h
    jr   nz, label_74579
    ld   l, a

label_74514::
    ld   [hl], d
    jr   nz, label_74537
    jr   nz, label_74592
    ld   l, a
    ld   [hl], l
    jr   nz, label_74591

label_7451D::
    ld   l, a
    jr   nz, label_74587
    ld   [hl], d
    ld   h, c
    ld   [hl], e
    ld   [hl], b

label_74524::
    inc  l
    jr   nz, label_74590
    ld   a, d
    ld   l, c
    ld   [hl], h
    jr   nz, label_7459A
    ld   l, a
    ld   [hl], h
    ccf
    rst  $38
    jr   nz, label_74552
    ld   d, h
    ld   c, b
    ld   b, l
    jr   nz, label_74584

label_74537::
    ld   c, a
    ld   d, l
    ld   d, d
    ld   c, [hl]
    ld   c, c
    ld   c, [hl]
    ld   b, a
    jr   nz, label_74560

label_74540::
    jr   nz, label_74562
    jr   nz, label_74564
    jr   nz, label_74593
    ld   b, l
    ld   d, d
    ld   c, l
    ld   b, c

label_7454A::
    ld   c, c
    ld   b, h
    jr   nz, label_7456E
    jr   nz, label_74570
    jr   nz, label_74572

label_74552::
    jr   nz, label_74574
    ld   b, d
    ld   a, c
    jr   nz, label_745AB
    ld   b, e
    ld   c, b

label_7455A::
    ld   d, l

label_7455B::
    ld   c, h
    ld   b, l
    jr   nz, label_7457F
    jr   nz, label_745A0
    jr   nz, label_74591
    ld   l, $2E
    ld   b, c
    jr   nz, label_745DB
    ld   h, e
    ld   h, c
    ld   l, h

label_7456B::
    ld   h, l
    jr   nz, label_745D7

label_7456E::
    ld   [hl], e
    jr   nz, label_745DE
    ld   l, c

label_74572::
    ld   [hl], e
    ld   [hl], e

label_74574::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, $2E

label_74579::
    ld   l, $FF
    ld   d, e
    ld   h, l
    ld   h, c
    ld   [hl], e

label_7457F::
    ld   l, b
    ld   h, l
    ld   l, h
    ld   l, h
    jr   nz, label_745D2
    ld   h, c
    ld   l, [hl]

label_74587::
    ld   [hl], e
    ld   l, c
    ld   l, a
    ld   l, [hl]
    rst  $38
    ld   b, l
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], d

label_74590::
    ld   h, c

label_74591::
    ld   l, [hl]

label_74592::
    ld   h, e

label_74593::
    ld   h, l
    jr   nz, label_7460A
    ld   l, a
    jr   nz, label_745B9
    jr   nz, label_745BB
    jr   nz, label_745BD
    jr   nz, label_745F8

label_7459F::
    ld   h, c

label_745A0::
    ld   [hl], d
    ld   l, [hl]
    ld   h, c
    jr   nz, label_745E9
    ld   h, l
    ld   [hl], e
    ld   h, l
    ld   [hl], d
    ld   [hl], h
    jr   nz, label_7459F
    rst  $38
    jr   nz, label_745CF
    jr   nz, label_745FE
    ld   a, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   l, a
    ld   [hl], l

label_745B9::
    ld   [hl], e
    jr   nz, label_745DC
    jr   nz, label_745DE
    jr   nz, label_745E0
    jr   nz, label_745E2
    ld   b, [hl]
    ld   l, a
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_745EA
    jr   nz, label_745EC
    jr   nz, label_745EE
    jr   z, label_74619
    ld   [hl], h
    ld   e, [hl]

label_745D2::
    ld   [hl], e
    jr   nz, label_74636
    jr   nz, label_74643

label_745D7::
    ld   l, c
    ld   [hl], h
    ld   [hl], h
    ld   l, h

label_745DB::
    ld   h, l

label_745DC::
    jr   nz, label_745FE

label_745DE::
    ld   h, d
    ld   l, c

label_745E0::
    ld   [hl], h
    jr   nz, label_74650
    ld   a, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   l, c

label_745E9::
    ld   l, a

label_745EA::
    ld   [hl], l
    ld   [hl], e

label_745EC::
    add  hl, hl
    rst  $38

label_745EE::
    ld   b, h
    ld   l, a
    jr   nz, label_7466B
    ld   l, a
    ld   [hl], l
    jr   nz, label_7466D
    ld   h, c
    ld   l, [hl]

label_745F8::
    ld   [hl], h
    jr   nz, label_7466F
    ld   l, a
    jr   nz, label_7461E

label_745FE::
    ld   h, e

label_745FF::
    ld   l, b
    ld   h, c
    ld   l, h
    ld   l, h
    ld   h, l
    ld   l, [hl]
    ld   h, a
    ld   h, l
    jr   nz, label_7467D
    ld   l, b

label_7460A::
    ld   h, l
    jr   nz, label_7462D
    jr   nz, label_74681
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_74687
    ld   h, c
    ld   [hl], b
    ld   l, c
    ld   h, h

label_74619::
    ld   [hl], e
    jr   nz, label_7468B
    ld   l, [hl]
    jr   nz, label_74680
    jr   nz, label_74693
    ld   h, c
    ld   h, [hl]
    ld   [hl], h
    ccf
    jr   nz, label_74647
    ld   d, b
    ld   [hl], d
    ld   l, a
    ld   h, e
    ld   h, l
    ld   h, l

label_7462D::
    ld   h, h
    ld   [hl], h
    ld   l, a
    jr   nz, label_746A6
    ld   l, b
    ld   h, l
    jr   nz, label_746A5

label_74636::
    ld   h, [hl]
    ld   h, [hl]
    ld   l, c
    ld   h, e
    ld   h, l
    jr   nz, label_7469E
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   h, e
    ld   h, l
    inc  l

label_74643::
    jr   nz, label_746B5

label_74645::
    ld   l, h
    ld   h, l

label_74647::
    ld   h, c
    ld   [hl], e
    ld   h, l
    ld   hl, label_745FF
    ld   h, c
    ld   [hl], e
    ld   [hl], h

label_74650::
    jr   nz, label_74645
    jr   nz, label_746A9
    ld   l, e
    ld   [hl], l
    ld   l, e
    ld   [hl], l
    jr   nz, label_7467A
    jr   nz, label_7467C
    jr   nz, label_7467E
    jr   nz, label_74680
    jr   nz, label_74682
    jr   nz, label_746B4
    ld   [hl], d
    ld   h, c
    ld   l, c
    ld   [hl], d
    ld   l, c
    ld   h, l
    jr   nz, label_7468C
    ld   b, [hl]

label_7466D::
    ld   h, c
    ld   [hl], d

label_7466F::
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], d
    jr   nz, label_746BA
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_7469A

label_7467A::
    jr   nz, label_7469C

label_7467C::
    jr   nz, label_7469E

label_7467E::
    ld   b, c
    ld   l, [hl]

label_74680::
    ld   l, c

label_74681::
    ld   l, l

label_74682::
    ld   h, c
    ld   l, h
    jr   nz, label_746DC
    ld   l, c

label_74687::
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a

label_7468B::
    ld   h, l

label_7468C::
    rst  $38
    ld   c, l
    ld   [hl], h
    ld   l, $20
    ld   d, h
    ld   h, c

label_74693::
    ld   l, l
    ld   h, c
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, e
    ld   l, b

label_7469A::
    jr   nz, label_746BC

label_7469C::
    jr   nz, label_7469D

label_7469E::
    di
    jr   nz, label_746F5
    ld   h, c
    ld   l, c
    ld   l, h
    jr   nz, label_746E9

label_746A6::
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_746A9::
    jr   nz, label_746CB
    jr   nz, label_746CD
    jr   nz, label_746A0
    jr   nz, label_74705
    ld   l, a
    ld   [hl], d
    ld   l, a

label_746B4::
    ld   l, [hl]

label_746B5::
    ld   h, d
    ld   l, a
    jr   nz, label_7470C
    ld   l, b

label_746BA::
    ld   l, a
    ld   [hl], d

label_746BC::
    ld   h, l
    ld   [hl], e
    rst  $38
    di
    jr   nz, label_74709
    ld   l, a
    ld   [hl], b
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   l, a
    jr   nz, label_7471D
    ld   [hl], a

label_746CB::
    ld   h, c
    ld   l, l

label_746CD::
    ld   [hl], b
    jr   nz, label_746C1
    jr   nz, label_7471F
    ld   a, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_746FD
    jr   nz, label_746FF
    jr   nz, label_74701
    ld   b, [hl]
    ld   l, a
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    rst  $38
    ld   b, d

label_746E9::
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_7475F
    ld   h, [hl]
    jr   nz, label_74759
    ld   l, h
    ld   l, a

label_746F5::
    ld   l, a
    ld   [hl], d
    ld   [hl], e
    ld   [hl], a
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_74761
    ld   [hl], d

label_746FF::
    ld   h, c
    ld   h, e

label_74701::
    ld   l, e
    ld   [hl], e
    ld   hl, label_2020
    ld   b, c
    jr   nz, label_74771

label_74709::
    ld   h, l
    ld   h, c
    db   $76 ; Halt

label_7470C::
    ld   a, c
    jr   nz, label_7477F
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    ld   l, a
    ld   l, [hl]
    jr   nz, label_74736
    jr   nz, label_74738
    ld   [hl], e
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h

label_7471D::
    ld   h, h
    jr   nz, label_7478E

label_74720::
    ld   l, a
    ld   [hl], h
    jr   nz, label_74797
    ld   [hl], h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   l, a
    ld   l, [hl]
    jr   nz, label_747A0
    ld   l, b
    ld   h, l
    ld   l, l
    ld   hl, label_754FF
    ld   h, l
    ld   l, h
    ld   h, l
    ld   [hl], b

label_74736::
    ld   l, b
    ld   l, a

label_74738::
    ld   l, [hl]
    ld   h, l
    jr   nz, label_7477E
    ld   l, a
    ld   l, a
    ld   [hl], h
    ld   l, b
    jr   nz, label_74741
    jr   nz, label_74764
    jr   nz, label_74766
    jr   nz, label_7478C
    ld   b, c
    ld   c, [hl]
    ld   b, a
    ld   b, l
    ld   d, d
    ld   hl, label_2020
    jr   nz, label_74772
    jr   nz, label_74774
    jr   nz, label_74776
    ld   c, e
    ld   h, l
    ld   h, l

label_74759::
    ld   [hl], b
    jr   nz, label_747CB
    ld   [hl], l
    ld   [hl], h
    ld   hl, label_2020

label_74761::
    jr   nz, label_7478B
    ld   b, l

label_74764::
    ld   a, b
    ld   h, e

label_74766::
    ld   h, l
    ld   [hl], b
    ld   [hl], h
    jr   nz, label_747AD
    ld   l, a
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    add  hl, hl

label_74771::
    rst  $38

label_74772::
    pop  af
    jr   nz, label_747BC
    ld   c, a

label_74776::
    jr   nz, label_747CC
    ld   c, b
    ld   c, c
    ld   d, e
    jr   nz, label_747D4
    ld   b, c

label_7477E::
    ld   e, c

label_7477F::
    rst  $38
    ld   a, [$FF20]
    ld   b, a
    ld   c, a
    jr   nz, label_747DA
    ld   c, b
    ld   c, c
    ld   d, e
    jr   nz, label_747E2

label_7478B::
    ld   b, c

label_7478C::
    ld   e, c
    rst  $38

label_7478E::
    di
    jr   nz, label_747D8
    ld   c, a
    jr   nz, label_747E8
    ld   c, b
    ld   c, c
    ld   d, e

label_74797::
    jr   nz, label_747F0
    ld   b, c
    ld   e, c
    rst  $38
    ld   a, [$FF00+C]
    ld   b, a
    ld   c, a

label_747A0::
    jr   nz, label_747F6
    ld   c, b
    ld   c, c
    ld   d, e
    jr   nz, label_747FE
    ld   b, c
    ld   e, c
    rst  $38
    jr   nz, label_74800
    ld   d, d

label_747AD::
    ld   e, c
    jr   nz, label_747F1
    ld   b, a
    ld   b, c
    ld   c, c
    ld   c, [hl]
    jr   nz, label_747FC
    ld   d, d
    ld   c, a
    ld   c, l
    jr   nz, label_747DB
    jr   nz, label_747DD
    ld   d, h
    ld   c, b
    ld   b, l
    jr   nz, label_74815
    ld   d, h
    ld   b, c
    ld   d, d
    ld   d, h
    rst  $38
    ld   b, a
    ld   d, d
    ld   b, l
    ld   b, c

label_747CB::
    ld   d, h

label_747CC::
    ld   hl, label_2020
    ld   e, c
    ld   c, a
    ld   d, l
    jr   nz, label_74818

label_747D4::
    ld   c, c
    ld   b, h
    jr   nz, label_74821

label_747D8::
    ld   d, h
    ld   hl, label_2020
    ld   e, c

label_747DD::
    ld   c, a

label_747DE::
    ld   d, l
    ld   d, d
    jr   nz, label_74834

label_747E2::
    ld   b, l
    ld   d, a
    ld   b, c
    ld   d, d
    ld   b, h
    ld   c, c

label_747E8::
    ld   d, e
    jr   nz, label_747DE
    jr   nz, label_74841
    ld   c, b
    ld   c, c
    ld   d, e

label_747F0::
    jr   nz, label_74849
    ld   b, c
    ld   e, c
    ld   hl, label_747FF
    ld   c, a
    ld   c, [hl]
    ld   b, l
    jr   nz, label_7484B

label_747FC::
    ld   c, [hl]
    jr   nz, label_74853

label_747FF::
    ld   c, a

label_74800::
    ld   d, l
    ld   d, d
    jr   nz, label_74824
    jr   nz, label_74826
    jr   nz, label_74828
    jr   nz, label_7482A
    jr   nz, label_7482C
    jr   nz, label_7482E
    jr   nz, label_7485D
    ld   b, c
    ld   c, l
    ld   d, l
    rst  $38
    di

label_74815::
    jr   nz, label_7485A
    ld   [hl], d

label_74818::
    ld   h, c
    ld   a, d
    ld   a, c
    jr   nz, label_74871
    ld   [hl], d
    ld   h, c
    ld   h, e

label_74820::
    ld   a, c

label_74821::
    jr   nz, label_74843
    jr   nz, label_74816
    jr   nz, label_74874
    ld   h, c

label_74828::
    ld   l, [hl]
    ld   h, d

label_7482A::
    ld   l, a
    ld   e, [hl]

label_7482C::
    ld   [hl], e
    jr   nz, label_7487F
    ld   l, a
    ld   l, [hl]
    ld   h, h
    rst  $38
    di

label_74834::
    jr   nz, label_74877
    ld   l, [hl]
    ld   l, c
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_74893
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c

label_74841::
    ld   h, a
    ld   h, l

label_74843::
    pop  af
    jr   nz, label_74893
    ld   h, c
    ld   [hl], d
    ld   [hl], h

label_74849::
    ld   l, b
    ld   h, c

label_7484B::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_74891
    ld   h, c
    ld   a, c
    rst  $38
    di

label_74853::
    jr   nz, label_748AC
    ld   h, l
    ld   l, h
    ld   h, e
    ld   l, a
    ld   l, l

label_7485A::
    ld   h, l
    jr   nz, label_748D1

label_7485D::
    ld   l, a
    jr   nz, label_748D4
    ld   l, b
    ld   h, l
    jr   nz, label_748A5
    ld   l, [hl]
    ld   l, c
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_748C1
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l

label_74871::
    ld   hl, $F3FF

label_74874::
    jr   nz, label_748B9
    ld   h, l

label_74877::
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   a, c
    jr   nz, label_7489F

label_7487F::
    jr   nz, label_748A1
    jr   nz, label_748A3
    pop  af
    jr   nz, label_748DB
    ld   l, e
    ld   [hl], l
    ld   l, e
    ld   [hl], l
    jr   nz, label_748DC
    ld   [hl], d
    ld   h, c
    ld   l, c
    ld   [hl], d
    ld   l, c

label_74891::
    ld   h, l
    jr   nz, label_74893
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_748FF
    ld   l, h
    ld   l, a
    ld   [hl], e

label_7489F::
    ld   h, l
    jr   nz, label_74916
    ld   l, a

label_748A3::
    jr   nz, label_748F9

label_748A5::
    ld   h, c
    ld   l, h
    jr   nz, label_748FD
    ld   h, c
    ld   l, h
    jr   nz, label_748F5
    ld   h, l
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   [hl], e
    ld   l, $54
    ld   l, b
    ld   h, l
    jr   nz, label_748FC

label_748B9::
    ld   h, c
    ld   l, l
    ld   h, l
    ld   [hl], d
    ld   h, c
    jr   nz, label_74913
    ld   l, b

label_748C1::
    ld   l, a
    ld   [hl], b
    jr   nz, label_7492E
    ld   [hl], e
    jr   nz, label_74936
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   h, d
    ld   a, c
    ld   l, $FF
    di
    jr   nz, label_74926
    ld   h, c
    ld   l, l

label_748D4::
    ld   h, c
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, e
    ld   l, b
    jr   nz, label_74929

label_748DC::
    ld   [hl], h
    ld   l, $20
    ld   a, [$FF00+C]
    ld   b, a
    ld   l, a
    ld   [hl], b
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   h, c
    jr   nz, label_7493D
    ld   [hl], a
    ld   h, c
    ld   l, l
    ld   [hl], b
    jr   nz, label_748EF
    ld   c, l
    ld   d, l
    ld   d, e
    ld   c, c
    ld   b, e

label_748F5::
    inc  l
    jr   nz, label_7494C
    ld   c, b

label_748F9::
    ld   b, l
    jr   nz, label_74942

label_748FC::
    ld   c, c

label_748FD::
    ld   d, e
    ld   c, b

label_748FF::
    jr   nz, label_74954
    ld   d, h
    ld   c, c
    ld   d, d
    ld   d, e
    jr   nz, label_74950
    ld   c, [hl]
    jr   nz, label_7495E
    ld   c, b
    ld   b, l
    jr   nz, label_74953
    ld   b, a
    ld   b, a
    ld   e, c
    ld   c, a
    ld   d, l

label_74913::
    jr   nz, label_74956
    ld   d, d

label_74916::
    ld   b, l
    jr   nz, label_7496D
    ld   c, b
    ld   b, l
    ld   d, d
    ld   b, l
    ld   l, $2E
    ld   l, $FF
    ld   d, h
    ld   c, b
    ld   b, l
    jr   nz, label_7497D

label_74926::
    ld   c, c
    ld   c, [hl]
    ld   b, h

label_74929::
    jr   nz, label_74971
    ld   c, c
    ld   d, e
    ld   c, b

label_7492E::
    jr   nz, label_74979
    ld   c, [hl]
    ld   c, [hl]
    ld   b, c
    ld   c, l
    ld   b, l
    jr   nz, label_74986
    ld   c, [hl]
    ld   c, h
    ld   e, c
    inc  l
    jr   nz, label_74983

label_7493D::
    ld   c, a
    ld   d, d
    jr   nz, label_74961
    ld   c, c

label_74942::
    ld   d, h
    jr   nz, label_7498E
    ld   d, e
    jr   nz, label_74996
    ld   b, l
    ld   c, c
    ld   d, h
    ld   c, b

label_7494C::
    ld   b, l
    ld   d, d
    ld   l, $FF

label_74950::
    ld   c, c
    ld   c, [hl]
    jr   nz, label_749A7

label_74954::
    ld   c, a
    ld   c, c

label_74956::
    ld   c, h
    jr   nz, label_749AC
    ld   c, h
    ld   b, l
    ld   b, l
    ld   d, b
    ld   d, e

label_7495E::
    jr   nz, label_74980
    ld   d, e

label_74961::
    ld   b, l
    ld   b, e
    ld   d, d
    ld   b, l
    ld   d, h
    ld   d, e
    inc  l
    jr   nz, label_749AC
    ld   b, l
    ld   c, [hl]
    ld   b, l

label_7496D::
    ld   b, c
    ld   d, h
    ld   c, b
    ld   e, c

label_74971::
    ld   c, a
    ld   d, l
    ld   d, d
    jr   nz, label_749C9
    ld   c, a
    ld   c, h
    ld   b, l

label_74979::
    ld   d, e
    ld   l, $2E
    ld   l, $FF
    ld   c, c
    ld   c, [hl]

label_74980::
    jr   nz, label_749D5
    ld   c, a

label_74983::
    ld   c, c
    ld   c, h
    jr   nz, label_749DA
    ld   c, h
    ld   b, l
    ld   b, l
    ld   d, b
    ld   d, e
    jr   nz, label_749AE

label_7498E::
    ld   d, e
    ld   b, l
    ld   b, e
    ld   d, d
    ld   b, l
    ld   d, h
    ld   d, e
    inc  l

label_74996::
    jr   nz, label_749DA
    ld   b, l
    ld   c, [hl]
    ld   b, l
    ld   b, c
    ld   d, h
    ld   c, b
    ld   e, c
    ld   c, a
    ld   d, l
    ld   d, d
    jr   nz, label_749F7
    ld   c, a
    ld   c, h
    ld   b, l

label_749A7::
    ld   d, e
    ld   l, $2E
    ld   l, $FF

label_749AC::
    ld   b, c
    ld   d, d

label_749AE::
    ld   c, a
    ld   d, l
    ld   c, [hl]
    ld   b, h
    jr   nz, label_749FC
    ld   b, l
    ld   d, d
    ld   b, l
    inc  l
    jr   nz, label_749DA
    jr   nz, label_749DC
    ld   d, e
    ld   b, l
    ld   b, e
    ld   d, d
    ld   b, l
    ld   d, h
    ld   d, e
    jr   nz, label_74A06
    ld   d, d
    ld   b, l
    jr   nz, label_74A17

label_749C9::
    ld   c, c
    ld   b, a
    ld   c, b
    rst  $38
    ld   d, e
    ld   b, l
    ld   b, e
    ld   d, d
    ld   b, l
    ld   d, h
    ld   d, e
    jr   nz, label_74A17
    ld   d, d
    ld   b, l
    jr   nz, label_74A26

label_749DA::
    ld   c, c
    ld   c, e

label_749DC::
    ld   b, l
    ld   d, a
    ld   b, c
    ld   d, h
    ld   b, l
    ld   d, d
    jr   nz, label_74A3B
    ld   c, b
    ld   b, l
    ld   c, [hl]
    jr   nz, label_74A32
    ld   d, h
    jr   nz, label_74A0C
    jr   nz, label_74A31
    ld   c, a
    ld   c, l
    ld   b, l
    ld   d, e
    jr   nz, label_74A48
    ld   c, a
    jr   nz, label_74A39

label_749F7::
    ld   d, d
    ld   c, c
    ld   b, h
    ld   b, a
    ld   b, l

label_749FC::
    ld   d, e
    rst  $38
    ld   c, [hl]

label_749FF::
    ld   c, a
    ld   d, a
    jr   nz, label_74A5C
    ld   c, a
    ld   d, l
    jr   nz, label_74A55
    ld   b, l
    ld   b, l
    ld   b, h
    jr   nz, label_74A2C

label_74A0C::
    jr   nz, label_74A2E
    ld   c, h
    ld   c, a
    ld   c, a
    ld   c, e
    jr   nz, label_74A5A
    ld   b, c
    ld   d, d
    jr   nz, label_74A5E
    ld   c, a
    ld   d, d
    jr   nz, label_74A3C
    jr   nz, label_74A3E
    ld   b, c
    jr   nz, label_74A74
    ld   b, l
    ld   b, e
    ld   d, d
    ld   b, l
    ld   d, h

label_74A26::
    ld   l, $2E
    ld   l, $FF
    ld   d, h
    ld   c, b

label_74A2C::
    ld   b, l
    jr   nz, label_74A86
    ld   c, c
    ld   c, [hl]

label_74A31::
    ld   b, h

label_74A32::
    jr   nz, label_74A7A
    ld   c, c
    ld   d, e
    ld   c, b
    jr   nz, label_74A59

label_74A39::
    jr   nz, label_74A8E

label_74A3B::
    ld   c, h

label_74A3C::
    ld   d, l
    ld   c, l

label_74A3E::
    ld   b, d
    ld   b, l
    ld   d, d
    ld   d, e
    jr   nz, label_74A90
    ld   c, a
    ld   c, [hl]
    ld   b, a
    ld   l, $2E
    ld   l, $54
    ld   c, b
    ld   b, l
    jr   nz, label_74A97
    ld   b, l
    ld   d, d
    ld   c, a
    ld   e, [hl]
    ld   d, e
    jr   nz, label_74AA2
    ld   c, c
    ld   b, [hl]
    ld   b, l

label_74A59::
    jr   nz, label_74AA2
    ld   c, a

label_74A5C::
    ld   c, [hl]
    ld   b, l

label_74A5E::
    ld   l, $2E
    ld   l, $FF
    ld   d, e
    ld   b, l
    ld   b, c
    jr   nz, label_74AA9
    ld   b, l
    ld   b, c
    ld   d, d
    ld   d, e
    jr   nz, label_74AB3
    ld   c, a
    ld   b, c
    ld   c, l
    inc  l
    jr   nz, label_74AC6
    ld   c, h

label_74A74::
    ld   b, l
    ld   b, l
    ld   d, b
    jr   nz, label_74ABB
    ld   b, l

label_74A7A::
    ld   b, c
    ld   d, d
    ld   d, e
    jr   nz, label_74A9F
    jr   nz, label_74AA1
    jr   nz, label_74AC7
    ld   d, d
    ld   b, l
    ld   b, c

label_74A86::
    ld   c, l
    ld   d, e
    ld   l, $20
    ld   b, d
    ld   c, a
    ld   d, h
    ld   c, b

label_74A8E::
    jr   nz, label_74AD5

label_74A90::
    ld   c, [hl]
    ld   b, h
    ld   c, c
    ld   c, [hl]
    jr   nz, label_74AEA
    ld   c, b

label_74A97::
    ld   b, l
    jr   nz, label_74AED
    ld   b, c
    ld   c, l
    ld   b, l
    jr   nz, label_74AF6

label_74A9F::
    ld   b, c
    ld   e, c

label_74AA1::
    jr   nz, label_74AE6
    ld   d, d
    ld   b, c
    ld   d, e
    ld   d, e
    ld   d, e
    ld   c, b

label_74AA9::
    ld   hl, label_74FFF
    ld   l, b
    ccf
    ld   hl, label_2020
    inc  hl
    inc  hl

label_74AB3::
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_74B02
    jr   nz, label_74ADB

label_74ABB::
    ld   [hl], e
    ld   h, l
    ld   h, l
    jr   nz, label_74B39
    ld   h, c
    jr   nz, label_74B2B
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_74AC6::
    jr   nz, label_74B29
    jr   nz, label_74AEA
    jr   nz, label_74B3A
    ld   l, c
    ld   h, e
    ld   h, l
    jr   nz, label_74B44
    ld   [hl], h
    ld   l, c
    ld   h, e
    ld   l, e

label_74AD5::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_74AFB

label_74ADB::
    ld   b, e
    ld   h, c
    ld   l, [hl]
    jr   nz, label_74B29
    jr   nz, label_74B44
    ld   l, a
    ld   [hl], d
    ld   [hl], d
    ld   l, a

label_74AE6::
    ld   [hl], a
    jr   nz, label_74B52
    ld   [hl], h

label_74AEA::
    jr   nz, label_74B52
    ld   l, a

label_74AED::
    ld   [hl], d
    jr   nz, label_74B51
    jr   nz, label_74B65
    ld   h, l
    ld   h, e
    ld   l, a
    ld   l, [hl]

label_74AF6::
    ld   h, h
    ccf
    jr   nz, label_74B1A
    jr   nz, label_74B1C
    jr   nz, label_74B1E
    jr   nz, label_74B43
    ld   h, c
    ld   l, [hl]

label_74B02::
    jr   nz, label_74B24
    ld   b, e
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    cp   $E4
    jr   nz, label_74B6F
    ld   h, l
    ld   h, e
    ld   h, c
    ld   l, l
    ld   h, l
    jr   nz, label_74B88
    ld   l, b
    ld   h, l
    jr   nz, label_74B38
    jr   nz, label_74B3A

label_74B1A::
    ld   l, b
    ld   l, a

label_74B1C::
    ld   l, [hl]
    ld   h, l

label_74B1E::
    ld   a, c
    ld   h, e
    ld   l, a
    ld   l, l
    ld   h, d
    jr   nz, label_74B0A
    ld   hl, label_2020
    jr   nz, label_74B4A
    ld   e, c

label_74B2B::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_74BA0
    ld   l, a
    ld   [hl], h
    jr   nz, label_74BA9
    ld   [hl], l
    ld   [hl], d

label_74B38::
    ld   h, l

label_74B39::
    jr   nz, label_74BA3
    ld   l, a
    ld   [hl], a
    jr   nz, label_74BA8
    ld   [hl], h
    jr   nz, label_74BAA
    ld   h, c

label_74B43::
    ld   [hl], b

label_74B44::
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    ld   h, l
    ld   h, h
    inc  l

label_74B4A::
    ld   h, d
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_74BC3
    ld   h, c
    ld   l, e

label_74B51::
    ld   h, l

label_74B52::
    jr   nz, label_74BBD
    ld   [hl], h
    ld   hl, label_748FF
    ld   l, l
    ld   l, l
    ld   l, l
    inc  l
    jr   nz, label_74B81
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_74BDE

label_74B65::
    ld   l, a
    ld   [hl], l
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_74BD9
    ld   h, l
    ld   h, c
    ld   l, [hl]

label_74B6F::
    ld   hl, label_742FF
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_74BE8
    ld   h, [hl]
    jr   nz, label_74BCF
    ld   h, l
    ld   h, c
    jr   nz, label_74BA0
    jr   nz, label_74BD7
    ld   [hl], d
    ld   h, e
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   [hl], e

label_74B88::
    ld   hl, label_2020
    ld   b, h
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_74C06
    ld   l, a
    ld   [hl], l
    ld   h, e
    ld   l, b
    jr   nz, label_74C0C
    ld   l, b
    ld   h, l
    ld   l, l
    jr   nz, label_74C14
    ld   l, c
    ld   [hl], h
    ld   l, b

label_74BA0::
    jr   nz, label_74C1B
    ld   l, a

label_74BA3::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_74C09
    ld   h, c

label_74BA8::
    ld   [hl], d

label_74BA9::
    ld   h, l

label_74BAA::
    jr   nz, label_74C14
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   [hl], e
    ld   hl, label_749FF
    jr   nz, label_74C2C
    ld   h, c
    ld   [hl], e
    jr   nz, label_74C21
    ld   [hl], l
    ld   l, [hl]
    ld   h, a
    ld   [hl], d

label_74BBD::
    ld   a, c
    jr   nz, label_74BE0
    jr   nz, label_74BE2
    ld   [hl], e

label_74BC3::
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   e, [hl]
    jr   nz, label_74C33
    ld   l, c
    ld   h, l

label_74BCF::
    ld   [hl], d
    ld   h, e
    ld   h, l
    ld   [hl], e
    ld   l, a
    jr   nz, label_74C1F
    jr   nz, label_74C4F
    ld   h, l

label_74BD9::
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_74C3E
    ld   l, [hl]

label_74BDE::
    ld   h, h
    jr   nz, label_74C01
    jr   nz, label_74C4A
    ld   l, a
    ld   [hl], h
    jr   nz, label_74C49
    ld   h, c

label_74BE8::
    ld   l, [hl]
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   [hl], e
    jr   nz, label_74C50
    ld   [hl], h
    jr   nz, label_74C12
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_74C59
    ld   h, l
    ld   h, c
    ld   h, e
    ld   l, b
    ld   l, $2E
    ld   l, $20
    jr   nz, label_74C21

label_74C01::
    jr   nz, label_74C26
    inc  hl
    inc  hl
    inc  hl

label_74C06::
    inc  hl
    inc  l
    jr   nz, label_74C73
    ld   h, [hl]
    jr   nz, label_74C86
    ld   l, a
    ld   [hl], l
    jr   nz, label_74C31
    jr   nz, label_74C8A
    ld   h, c

label_74C14::
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_74C8B
    ld   l, a
    ld   l, l
    ld   h, l

label_74C1B::
    inc  l
    jr   nz, label_74C97
    ld   l, a

label_74C1F::
    ld   [hl], l
    jr   nz, label_74C42
    ld   [hl], e
    ld   l, b
    ld   l, a
    ld   [hl], l

label_74C26::
    ld   l, h
    ld   h, h
    jr   nz, label_74C91
    ld   l, a
    jr   nz, label_74C8E
    ld   l, [hl]
    ld   h, h
    jr   nz, label_74C51

label_74C31::
    jr   nz, label_74C9A

label_74C33::
    ld   h, l
    ld   [hl], h
    jr   nz, label_74CAA
    ld   l, a
    ld   l, l
    ld   h, l
    ld   hl, label_757FF
    ld   h, l

label_74C3E::
    ld   l, h
    ld   h, e
    ld   l, a
    ld   l, l

label_74C42::
    ld   h, l

label_74C43::
    jr   nz, label_74CB9
    ld   l, a
    jr   nz, label_74C68
    jr   nz, label_74C6A

label_74C4A::
    jr   nz, label_74C6C
    ld   d, e
    ld   h, c
    ld   l, h

label_74C4F::
    ld   h, l

label_74C50::
    ld   e, [hl]

label_74C51::
    ld   [hl], e
    jr   nz, label_74C9C
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    jr   nz, label_74CA9
    ld   e, [hl]
    jr   nz, label_74C9F
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   [hl], e
    ld   hl, label_2020
    ld   c, c
    ld   e, [hl]

label_74C68::
    ld   l, l
    jr   nz, label_74C8B
    jr   nz, label_74CC0
    ld   h, c
    ld   l, h
    ld   h, l
    inc  l
    jr   nz, label_74CE7

label_74C73::
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_74CE1
    ld   [hl], e
    jr   nz, label_74CE8
    ld   a, c
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    ld   hl, label_74120
    ld   h, e
    ld   [hl], h

label_74C86::
    ld   [hl], l
    ld   h, c
    ld   l, h
    ld   l, h

label_74C8A::
    ld   a, c

label_74C8B::
    inc  l
    ld   l, l
    ld   a, c

label_74C8E::
    jr   nz, label_74CF8
    ld   l, a

label_74C91::
    ld   h, d
    ld   h, d
    ld   a, c
    jr   nz, label_74CFF
    ld   [hl], e

label_74C97::
    jr   nz, label_74CFC
    ld   l, a

label_74C9A::
    ld   l, h
    dec  l

label_74C9C::
    ld   l, h
    ld   h, l
    ld   h, e

label_74C9F::
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_74D17
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_74D0B

label_74CAA::
    ld   l, [hl]
    ld   h, h
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], l
    ld   [hl], e
    ld   [hl], l
    ld   h, c
    ld   l, h
    jr   nz, label_74D18
    ld   h, c
    ld   l, [hl]
    ld   l, [hl]
    ld   h, l

label_74CB9::
    ld   h, h
    jr   nz, label_74CDC
    ld   h, [hl]
    ld   l, a
    ld   l, a
    ld   h, h

label_74CC0::
    ld   l, $20
    ld   c, l
    ld   a, c
    jr   nz, label_74D28
    ld   [hl], d
    ld   l, a
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   [hl], e
    jr   nz, label_74D31
    ld   l, [hl]
    jr   nz, label_74D34
    ld   [hl], d
    ld   [hl], h
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    inc  l
    jr   nz, label_74D4E
    ld   l, a

label_74CDC::
    ld   c, c
    jr   nz, label_74D46
    ld   [hl], l
    ld   h, l

label_74CE1::
    ld   [hl], e
    ld   [hl], e
    jr   nz, label_74D58
    ld   [hl], h
    ld   [hl], d

label_74CE7::
    ld   h, c

label_74CE8::
    ld   l, [hl]
    ld   h, a
    ld   h, l
    jr   nz, label_74D55
    ld   l, a
    ld   h, d
    ld   h, d
    ld   l, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_74D67
    ld   [hl], l
    ld   l, [hl]
    jr   nz, label_74D62
    ld   l, [hl]
    jr   nz, label_74D1C

label_74CFC::
    ld   [hl], h
    ld   l, b
    ld   h, l

label_74CFF::
    jr   nz, label_74D67
    ld   h, c
    ld   l, l
    ld   l, c
    ld   l, h
    ld   a, c
    ld   hl, label_757FF
    ld   l, b
    ld   h, c

label_74D0B::
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_74D84
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_74D8E
    ld   l, a
    ld   [hl], l

label_74D17::
    jr   nz, label_74D81
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_74D1C::
    ccf
    ld   hl, label_2020
    ld   c, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_74D46
    jr   nz, label_74D48

label_74D28::
    ld   h, e
    ld   h, c
    ld   l, [hl]
    ld   l, [hl]
    ld   h, l
    ld   h, h
    jr   nz, label_74D96
    ld   l, a

label_74D31::
    ld   l, a
    ld   h, h
    ld   hl, label_74620
    ld   l, a
    ld   [hl], d
    ld   l, b
    ld   h, l

label_74D3A::
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_74DB5
    ld   h, c
    ld   l, e
    ld   h, l
    inc  l

label_74D46::
    jr   nz, label_74D68

label_74D48::
    ld   l, l
    ld   h, c
    ld   l, [hl]
    inc  l
    jr   nz, label_74DB5

label_74D4E::
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_74DC7
    ld   l, b
    ld   h, c

label_74D55::
    ld   [hl], h
    jr   nz, label_74D3A

label_74D58::
    ld   [hl], h
    ld   l, a
    jr   nz, label_74DA9
    ld   b, l
    ld   hl, label_2021
    jr   nz, label_74DB2

label_74D62::
    ld   c, h
    ld   b, l
    ld   b, c
    ld   d, e
    ld   b, l

label_74D67::
    ld   hl, label_76548
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_74DD6
    ld   a, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   h, e
    ld   h, c
    ld   l, h
    ld   hl, label_76857
    ld   h, c
    ld   [hl], h
    jr   nz, label_74DE2
    ld   l, a
    jr   nz, label_74DFA

label_74D81::
    ld   l, a
    ld   [hl], l
    jr   nz, label_74DE9
    ld   l, a
    ccf
    jr   nz, label_74DA9
    jr   nz, label_74DAB
    jr   nz, label_74DD4
    ld   l, c

label_74D8E::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_74DD6
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h

label_74D96::
    cp   $4F
    ld   l, b
    jr   nz, label_74E0F
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_74E1A
    ld   l, a
    ld   [hl], l
    ld   hl, label_2020
    jr   nz, label_74DF1
    ld   e, [hl]

label_74DA9::
    ld   l, h
    ld   l, h

label_74DAB::
    jr   nz, label_74E21
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_74E26

label_74DB2::
    ld   l, b
    ld   h, c
    ld   [hl], h

label_74DB5::
    ld   hl, label_749FF
    jr   nz, label_74E1E
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_74E33
    ld   [hl], l
    ld   [hl], b
    ld   [hl], b
    ld   l, a
    ld   [hl], e
    ld   h, l
    jr   nz, label_74E31
    ld   [hl], h
    jr   nz, label_74E42
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_74E35
    ld   l, a
    jr   nz, label_74E35

label_74DD4::
    ld   l, [hl]
    ld   a, c

label_74DD6::
    jr   nz, label_74E3F
    ld   l, a
    ld   l, a
    ld   h, h
    jr   nz, label_74E51
    ld   l, a
    jr   nz, label_74E42
    ld   h, l
    ld   h, a

label_74DE2::
    ccf
    jr   nz, label_74E05
    jr   nz, label_74E07
    ld   d, a
    ld   h, l

label_74DE9::
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_74E57
    ld   h, [hl]
    jr   nz, label_74E6A

label_74DF1::
    ld   l, a
    ld   [hl], l
    jr   nz, label_74E15
    jr   nz, label_74E17
    ld   h, e
    ld   l, b
    ld   h, c

label_74DFA::
    ld   l, [hl]
    ld   h, a
    ld   h, l
    jr   nz, label_74E78

label_74DFF::
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_74E24
    jr   nz, label_74E26
    jr   nz, label_74E75
    ld   l, c
    ld   l, [hl]
    ld   h, h
    inc  l
    jr   nz, label_74E82
    ld   h, l

label_74E0F::
    ld   l, h
    ld   l, h
    jr   nz, label_74E80
    ld   h, l
    ld   l, $FF
    jr   nz, label_74E38
    ld   c, l
    ld   d, l

label_74E1A::
    ld   c, [hl]
    ld   b, e
    ld   c, b
    jr   nz, label_74E6C
    ld   d, l

label_74E20::
    ld   c, [hl]

label_74E21::
    ld   b, e
    ld   c, b
    ld   hl, label_2021

label_74E26::
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   d, h
    ld   l, b

label_74E38::
    ld   h, c
    ld   [hl], h
    jr   nz, label_74EB3
    ld   h, c
    ld   [hl], e
    jr   nz, label_74EA7
    ld   [hl], d
    ld   h, l

label_74E42::
    ld   h, c
    ld   [hl], h
    ld   hl, label_74920
    jr   nz, label_74EB4
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_74EB7
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_74E51::
    jr   nz, label_74EC1
    ld   l, a
    ld   [hl], h
    jr   nz, label_74EB8

label_74E57::
    jr   nz, label_74EBF
    ld   h, c
    ld   l, c
    ld   [hl], d
    jr   nz, label_74ED2
    ld   [hl], d
    ld   h, c
    ld   h, h
    ld   h, l
    inc  l
    jr   nz, label_74E85
    jr   nz, label_74EC9
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_74ED3
    ld   h, l

label_74E6C::
    ld   [hl], d
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_74EE5
    ld   l, a
    ld   l, l
    ld   h, l

label_74E75::
    jr   nz, label_74ED9
    ld   h, c

label_74E78::
    ld   l, [hl]
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   [hl], e
    ld   hl, label_75920

label_74E80::
    ld   d, l
    ld   c, l

label_74E82::
    ld   l, $2E
    ld   l, $FF
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_74EF2
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_74EF8
    ld   l, c
    ld   l, l
    jr   nz, label_74E76
    jr   nz, label_74EB6
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_74F02
    ld   l, a
    ld   [hl], h
    jr   nz, label_74F01
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   [hl], e
    jr   nz, label_74E8A

label_74EA7::
    jr   nz, label_74F12
    ld   l, [hl]
    jr   nz, label_74F1E
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   l, [hl]
    ld   hl, label_2020

label_74EB4::
    jr   nz, label_74ED6

label_74EB6::
    ld   b, a

label_74EB7::
    ld   l, a

label_74EB8::
    ld   l, a
    ld   h, h
    jr   nz, label_74F20
    ld   h, l
    ld   h, c
    ld   l, h

label_74EBF::
    ld   hl, label_754FF
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_74F41
    ld   l, a

label_74EC9::
    ld   [hl], l
    jr   nz, label_74F2D
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   hl, label_76854

label_74ED3::
    ld   h, c
    ld   [hl], h
    jr   nz, label_74F4E
    ld   h, c
    ld   [hl], e

label_74ED9::
    jr   nz, label_74F54
    ld   [hl], l
    ld   l, l
    ld   l, l
    ld   a, c
    ld   hl, label_748FF
    ld   h, l
    ld   a, c
    jr   nz, label_74F4C
    ld   [hl], d
    ld   l, c
    ld   h, l
    ld   l, [hl]
    ld   h, h
    ld   hl, label_74820
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   a, c

label_74EF2::
    ld   l, a
    ld   [hl], l
    jr   nz, label_74F5B
    db   $76 ; Halt
    ld   h, l

label_74EF8::
    ld   [hl], d
    jr   nz, label_74F6D
    ld   l, c
    ld   h, h
    ld   h, h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_74F76

label_74F02::
    ld   l, b
    ld   h, l
    jr   nz, label_74F78
    ld   h, c
    ld   [hl], b
    ld   l, c
    ld   h, h
    ld   [hl], e
    jr   nz, label_74F7C
    ld   l, [hl]
    jr   nz, label_74F71
    jr   nz, label_74F84

label_74F12::
    ld   h, c
    ld   h, [hl]
    ld   [hl], h
    ccf
    jr   nz, label_74F38
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_74F80
    ld   h, c

label_74F1E::
    ld   l, [hl]
    inc  l

label_74F20::
    jr   nz, label_74F90
    ld   h, l
    ld   h, c
    ld   [hl], d
    jr   nz, label_74F7B
    ld   h, c
    ld   l, h
    jr   nz, label_74F7F
    ld   h, c
    ld   l, h

label_74F2D::
    jr   nz, label_74F4F
    jr   nz, label_74F51
    ld   c, b
    ld   h, l
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   [hl], e

label_74F38::
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_74F60
    jr   nz, label_74FB1
    ld   [hl], l
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_74FBC
    ld   l, a
    jr   nz, label_74FBF
    ld   [hl], d

label_74F4C::
    ld   a, c
    jr   nz, label_74FB8

label_74F4F::
    ld   [hl], h
    ld   hl, label_752FF
    ld   l, c

label_74F54::
    ld   l, e
    ld   e, [hl]
    ld   l, l
    jr   nz, label_74FCB
    ld   h, c
    ld   l, e

label_74F5B::
    ld   e, [hl]
    ld   l, l
    ld   hl, label_74920

label_74F60::
    jr   nz, label_74F82
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    jr   nz, label_74FD6
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_74FDA
    ld   h, [hl]
    jr   nz, label_74F8E
    jr   nz, label_74F90
    jr   nz, label_74F92
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   [hl], d

label_74F76::
    ld   h, l
    ld   h, h

label_74F78::
    ld   l, c
    ld   h, l
    ld   l, [hl]

label_74F7B::
    ld   [hl], h

label_74F7C::
    ld   [hl], e
    ld   hl, label_2020

label_74F80::
    ld   c, c
    ld   h, [hl]

label_74F82::
    ld   c, c
    jr   nz, label_74FED
    ld   h, c
    ld   h, h
    jr   nz, label_74FF1
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   a, c
    inc  l

label_74F8E::
    jr   nz, label_74FD9

label_74F90::
    jr   nz, label_74FB2

label_74F92::
    ld   h, e
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_75006
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_75012
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_75009
    ld   l, c
    ld   [hl], h
    jr   nz, label_7500D
    ld   l, a
    ld   [hl], d
    jr   nz, label_7500C
    jr   nz, label_75018
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   hl, label_748FF
    ld   l, c
    jr   nz, label_7501E
    ld   l, a
    ld   hl, label_74820

label_74FBA::
    ld   h, l
    ld   a, c

label_74FBC::
    jr   nz, label_75037
    ld   l, a

label_74FBF::
    ld   [hl], l
    ld   hl, label_74920
    ld   [hl], e
    jr   nz, label_7503A
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_7503B

label_74FCB::
    ld   l, a
    ld   [hl], e
    ld   [hl], e
    ld   l, c
    ld   h, d
    ld   l, h
    ld   a, c
    ld   h, c
    jr   nz, label_74FBA
    jr   nz, label_75050
    ld   l, a
    ld   [hl], l

label_74FD9::
    jr   nz, label_75043
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ccf
    jr   nz, label_75001
    jr   nz, label_7502C
    jr   nz, label_7504F
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_7505C
    ld   h, c
    ld   l, [hl]
    jr   nz, label_7505D
    ld   [hl], l
    ld   [hl], h
    ld   hl, label_75720
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_75071
    ld   l, a
    ld   [hl], l
    jr   nz, label_7506F
    ld   [hl], a
    ld   h, c
    ld   [hl], b

label_74FFF::
    jr   nz, label_7506A

label_75001::
    ld   [hl], h
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    jr   nz, label_75068
    jr   nz, label_75079

label_75009::
    ld   l, c
    ld   l, [hl]
    ld   h, l

label_7500C::
    ld   h, c

label_7500D::
    ld   [hl], b
    ld   [hl], b
    ld   l, h
    ld   h, l
    ccf

label_75012::
    jr   nz, label_75034
    jr   nz, label_75036
    ld   e, c
    ld   h, l

label_75018::
    ld   [hl], e

label_75019::
    jr   nz, label_7503B
    ld   c, [hl]
    ld   l, a
    cp   $59
    ld   l, a

label_75020::
    ld   [hl], l
    jr   nz, label_75088
    ld   a, b
    ld   h, e
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   h, l
    ld   h, h
    jr   nz, label_75012
    jr   nz, label_75095
    ld   l, a
    ld   [hl], d
    jr   nz, label_75019
    ld   hl, label_2020

label_75036::
    ld   c, c

label_75037::
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_7503A::
    jr   nz, label_750AA
    ld   l, a
    ld   [hl], h
    ld   h, c
    ld   [hl], e
    jr   nz, label_750B5
    ld   [hl], a

label_75043::
    ld   h, l
    ld   h, l
    ld   [hl], h
    inc  l
    jr   nz, label_750AB
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_750B6
    ld   [hl], h
    ld   l, c

label_7504F::
    ld   [hl], e

label_75050::
    jr   nz, label_750B6
    ld   h, l
    ld   l, h
    ld   l, c
    ld   h, e
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   hl, label_2020

label_7505D::
    jr   nz, label_7505E
    ld   d, h
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_750C8
    jr   nz, label_750CC
    ld   [hl], d

label_7506A::
    ld   a, c
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_750E3
    ld   l, b

label_75071::
    ld   h, c
    ld   l, l
    ld   h, l
    inc  l
    jr   nz, label_750D9
    ld   [hl], l
    ld   [hl], h

label_75079::
    jr   nz, label_750C4
    jr   nz, label_7509D
    jr   nz, label_7509F
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, c
    ld   a, d
    ld   h, l
    jr   nz, label_750FC

label_75088::
    ld   l, b
    ld   l, a
    ld   [hl], e
    ld   h, l
    jr   nz, label_750AE
    jr   nz, label_750F1
    ld   [hl], d
    ld   h, l
    jr   nz, label_750F5
    jr   nz, label_75108
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_750BB
    jr   nz, label_750BD

label_7509D::
    jr   nz, label_750BF

label_7509F::
    ld   h, h
    ld   h, l
    ld   l, h
    ld   l, c
    ld   h, e
    ld   h, c
    ld   h, e
    ld   a, c
    ld   hl, label_748FF

label_750AA::
    ld   l, c

label_750AB::
    jr   nz, label_75115
    ld   l, a

label_750AE::
    ld   hl, label_75920
    ld   h, l
    ld   h, c
    ld   l, b
    inc  l

label_750B5::
    jr   nz, label_75100
    jr   nz, label_750D9
    ld   l, e
    ld   l, [hl]

label_750BB::
    ld   l, a
    ld   [hl], a

label_750BD::
    inc  l
    jr   nz, label_75134
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_75139
    ld   [hl], l
    ld   h, d
    jr   nz, label_750E9
    ld   l, a
    ld   h, [hl]
    jr   nz, label_75134
    ld   l, a
    ld   l, a
    jr   nz, label_7513A
    ld   [hl], e
    jr   nz, label_75135
    ld   [hl], e
    ld   l, h
    ld   h, l
    ld   h, l
    ld   [hl], b

label_750D9::
    ld   [hl], d
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_75149
    ld   l, [hl]
    jr   nz, label_75157

label_750E3::
    ld   l, b
    ld   h, l
    jr   nz, label_7515E
    ld   h, c
    ld   a, c

label_750E9::
    ld   [hl], h
    ld   l, a
    jr   nz, label_75146
    ld   h, c
    ld   [hl], d
    ld   l, [hl]
    ld   h, c

label_750F1::
    jr   nz, label_75137
    ld   h, l
    ld   [hl], e

label_750F5::
    ld   h, l
    ld   [hl], d
    ld   [hl], h
    ld   hl, label_76E4F
    ld   h, e

label_750FC::
    ld   h, l
    jr   nz, label_75167
    ld   h, l

label_75100::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_75165
    ld   [hl], e
    ld   l, h
    ld   h, l
    ld   h, l

label_75108::
    ld   [hl], b
    ld   l, b
    ld   h, l
    jr   nz, label_75184
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_75175
    ld   [hl], l
    ld   h, h

label_75115::
    ld   h, a
    ld   h, l
    jr   nz, label_75139
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    jr   nz, label_7517F
    jr   nz, label_7518C
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   l, [hl]
    ld   h, a
    ld   [hl], h
    ld   l, c
    ld   l, l
    ld   h, l
    ld   l, $20
    jr   nz, label_75173
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_7519D

label_75135::
    ld   h, l
    ld   a, c

label_75137::
    ld   hl, label_75420

label_7513A::
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_7518B
    ld   l, c
    ld   [hl], h
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_75166

label_75146::
    jr   nz, label_75168
    jr   nz, label_75197
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    jr   nz, label_751B1
    ld   l, [hl]
    ld   h, h
    jr   nz, label_751CB
    ld   h, c
    ld   l, e
    ld   h, l

label_75157::
    jr   nz, label_75179
    ld   l, b
    ld   l, c
    ld   l, l
    jr   nz, label_751D3

label_7515E::
    ld   [hl], b
    jr   nz, label_751D8
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_751CE

label_75166::
    ld   h, l

label_75167::
    ld   [hl], d

label_75168::
    jr   nz, label_751DD
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, c

label_75173::
    ld   [hl], h
    jr   nz, label_751E9
    ld   l, h
    ld   l, a
    ld   h, d

label_75179::
    ld   [hl], a
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_751F7
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_751FA
    ld   [hl], b
    jr   nz, label_751A8
    jr   nz, label_75201
    ld   l, c

label_7518B::
    ld   [hl], h

label_7518C::
    ld   l, b
    jr   nz, label_751F0
    jr   nz, label_751FB
    ld   [hl], l
    ld   l, l
    ld   [hl], b
    jr   nz, label_751FF
    ld   h, [hl]

label_75197::
    jr   nz, label_751B9
    ld   l, b
    ld   h, l
    jr   nz, label_75205

label_7519D::
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_7520B
    ld   h, l
    ld   [hl], d
    jr   nz, label_751C7
    jr   nz, label_751C9
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    inc  l
    jr   nz, label_75216
    ld   l, a

label_751B1::
    ld   [hl], d
    jr   nz, label_75227
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   hl, label_74820
    ld   h, l
    ld   l, b
    jr   nz, label_75226
    ld   h, l
    ld   l, b
    jr   nz, label_7522A
    ld   h, l
    ld   l, b
    ld   hl, label_74DFF

label_751C7::
    ld   a, c
    jr   nz, label_7523F
    ld   l, h

label_751CB::
    ld   [hl], h
    ld   l, c
    ld   l, l

label_751CE::
    ld   h, c
    ld   [hl], h
    ld   h, l
    jr   nz, label_75243

label_751D3::
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   l, c
    ld   [hl], e

label_751D8::
    jr   nz, label_7524E
    ld   l, a
    jr   nz, label_7524C

label_751DD::
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_75243
    jr   nz, label_75204
    jr   nz, label_75206
    ld   h, d
    ld   [hl], d
    ld   h, c

label_751E9::
    ld   l, [hl]
    ld   h, e
    ld   l, b
    jr   nz, label_75257
    ld   l, [hl]
    jr   nz, label_7523E
    ld   h, c
    ld   h, d
    ld   h, l
    jr   nz, label_75216
    ld   d, [hl]

label_751F7::
    ld   l, c
    ld   l, h
    ld   l, h

label_751FA::
    ld   h, c

label_751FB::
    ld   h, a
    ld   h, l
    ld   hl, label_748FF
    ld   c, c

label_75201::
    jr   nz, label_7524B
    ld   c, a

label_75204::
    ld   hl, label_2020
    ld   c, h
    ld   l, c
    ld   [hl], h
    ld   [hl], h

label_7520B::
    ld   l, h
    ld   h, l
    jr   nz, label_7522F
    ld   c, l
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   hl, label_2020
    ld   d, a
    ld   h, l
    ld   l, h
    ld   h, e
    ld   l, a
    ld   l, l
    ld   h, l
    ld   hl, label_2E2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20

label_75227::
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20

label_7522F::
    ld   c, a
    ld   l, b
    inc  l
    jr   nz, label_752A7
    ld   l, b
    ld   [hl], l
    ld   h, e
    ld   l, e
    ld   [hl], e
    ld   hl, label_2020
    ld   e, c
    ld   l, a

label_7523E::
    ld   [hl], l

label_7523F::
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_752AC
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_752BD
    ld   l, a
    ld   l, a

label_7524B::
    ld   l, $2E
    ld   l, $20
    ld   d, e
    ld   l, a
    ld   [hl], d
    ld   [hl], d
    ld   a, c
    ld   l, $2E
    ld   l, $FF
    ld   c, a
    ld   l, b
    inc  l
    jr   nz, label_75280
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_752AD
    ld   e, [hl]
    ld   l, l
    jr   nz, label_75288
    ld   h, a
    ld   l, h
    ld   h, c
    ld   h, h
    jr   nz, label_752E7
    ld   l, a
    ld   [hl], l
    jr   nz, label_752D8
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75298
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_752EE
    ld   l, h
    ld   h, c

label_75280::
    ld   h, e
    ld   h, l
    ld   l, $20
    jr   nz, label_752A6
    jr   nz, label_752A8

label_75288::
    ld   d, a
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_75307
    ld   l, a
    ld   [hl], l
    jr   nz, label_75305
    ld   [hl], h
    ld   h, c
    ld   a, c
    jr   nz, label_752B7
    jr   nz, label_752FA
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75311
    ld   h, c
    ld   l, h
    ld   l, e
    jr   nz, label_75316
    ld   l, a
    jr   nz, label_75312
    ld   h, l

label_752A6::
    jr   nz, label_752C8

label_752A8::
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    jr   nz, label_7530E

label_752AD::
    jr   nz, label_75326
    ld   l, b
    ld   l, c
    ld   l, h
    ld   h, l
    ccf
    jr   nz, label_752D6
    jr   nz, label_752D8
    jr   nz, label_752DA
    jr   nz, label_752DC
    ld   e, c

label_752BD::
    ld   h, l
    ld   [hl], e
    ld   hl, label_74E20
    ld   l, a
    ld   l, $2E
    ld   l, $FE
    ld   c, a

label_752C8::
    ld   l, e
    ld   h, c
    ld   a, c
    inc  l
    jr   nz, label_75317
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_7533D
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_752D6::
    jr   nz, label_7534F

label_752D8::
    ld   h, c
    ld   [hl], h

label_752DA::
    ld   h, e
    ld   l, b

label_752DC::
    jr   nz, label_75352
    ld   l, b
    ld   h, l
    jr   nz, label_75359
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   [hl], e
    jr   nz, label_7534E
    ld   l, a
    ld   [hl], d
    jr   nz, label_7534D
    jr   nz, label_75365

label_752EE::
    ld   l, b
    ld   l, c
    ld   l, h
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   b, c
    ld   [hl], h
    jr   nz, label_7536E

label_752FA::
    ld   l, b
    ld   h, l
    jr   nz, label_75360
    ld   h, l

label_752FF::
    ld   h, c
    ld   h, e
    ld   l, b
    ld   l, $2E
    ld   l, $20
    jr   nz, label_75355
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    jr   nz, label_7532E

label_7530E::
    sbc  a, $FF
    ld   c, c

label_75311::
    jr   nz, label_7538A
    ld   l, a
    ld   l, [hl]
    ld   h, h

label_75316::
    ld   h, l

label_75317::
    ld   [hl], d
    jr   nz, label_75391
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_75340
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], e
    ld   h, l
    jr   nz, label_7538A
    ld   l, a
    ld   h, e
    ld   l, a
    ld   l, [hl]
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_7534F
    jr   nz, label_753A5
    ld   [hl], d
    ld   h, l
    ld   h, l
    ld   [hl], e
    jr   nz, label_7539A
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_753A2
    ld   [hl], d

label_7533D::
    ld   l, a
    ld   l, l
    ccf

label_75340::
    ld   l, $2E
    ld   l, $54
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    jr   nz, label_753BD
    ld   h, c
    ld   a, c
    ld   [hl], e

label_7534D::
    jr   nz, label_7536F

label_7534F::
    jr   nz, label_753C5
    ld   l, b

label_75352::
    ld   h, l
    ld   [hl], d
    ld   h, l

label_75355::
    jr   nz, label_753C0
    ld   [hl], e
    jr   nz, label_753C8
    ld   l, a
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_75360::
    ld   h, d
    ld   h, l
    ld   a, c
    ld   l, a
    ld   l, [hl]

label_75365::
    ld   h, h
    jr   nz, label_753DC
    ld   l, b
    ld   h, l
    jr   nz, label_753DF
    ld   h, l
    ld   h, c

label_7536E::
    inc  l

label_7536F::
    jr   nz, label_753D3
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_753BE
    jr   nz, label_753D9
    ld   h, l
    ld   l, h
    ld   l, c
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_7539F
    jr   nz, label_753F5
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_753F4
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_7538A::
    jr   nz, label_753EE
    ld   h, l
    jr   nz, label_753AF
    jr   nz, label_75404

label_75391::
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7540A
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_753C0
    ld   [hl], h
    ld   l, b

label_753A2::
    ld   h, l
    ld   [hl], d
    ld   h, l

label_753A5::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_75402
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_753F9
    ld   h, h
    ld   l, c
    ld   [hl], e
    ld   h, e
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   h, h
    jr   nz, label_75435
    ld   l, a

label_753BD::
    ld   [hl], l

label_753BE::
    inc  l
    jr   nz, label_753E4
    inc  hl
    inc  hl
    inc  hl
    inc  hl

label_753C5::
    inc  l
    jr   nz, label_75435

label_753C8::
    ld   a, c
    jr   nz, label_75433
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    jr   nz, label_75444
    ld   l, e
    ld   l, c

label_753D3::
    ld   [hl], b
    ld   [hl], b
    ld   h, l
    ld   h, h
    jr   nz, label_7543A

label_753D9::
    jr   nz, label_7543D
    ld   h, l

label_753DC::
    ld   h, c
    ld   [hl], h
    ld   hl, label_74920
    jr   nz, label_75457
    ld   l, b

label_753E4::
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    ld   [hl], h
    inc  l
    jr   nz, label_75460
    ld   l, b
    ld   l, c

label_753EE::
    ld   [hl], e
    jr   nz, label_75461
    ld   h, l
    ld   [hl], d
    ld   [hl], e

label_753F4::
    ld   l, a

label_753F5::
    ld   l, [hl]
    jr   nz, label_75460
    ld   h, c

label_753F9::
    ld   [hl], e
    jr   nz, label_7545F
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_75475
    ld   l, a

label_75402::
    jr   nz, label_7546B

label_75404::
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_7547E
    ld   [hl], e

label_7540A::
    jr   nz, label_7546D
    jr   nz, label_7542E
    jr   nz, label_75430
    ld   l, l
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   h, c
    ld   h, a
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20

label_75433::
    ld   l, $2E

label_75435::
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   c, c
    ld   h, [hl]

label_7543D::
    jr   nz, label_75488
    jr   nz, label_754B8
    ld   h, c
    ld   [hl], e
    jr   nz, label_754A6
    jr   nz, label_754BA
    ld   h, l
    ld   h, c
    jr   nz, label_7546B
    ld   h, a
    ld   [hl], l
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_7549B
    jr   nz, label_754CB
    ld   l, a
    ld   [hl], l
    ld   l, h

label_75457::
    ld   h, h
    jr   nz, label_7547A
    jr   nz, label_754C2
    ld   l, h
    ld   a, c
    jr   nz, label_754C1

label_75460::
    ld   [hl], e

label_75461::
    jr   nz, label_754C9
    ld   h, c
    ld   [hl], d
    jr   nz, label_754C8
    ld   [hl], e
    jr   nz, label_754B3
    jr   nz, label_754CF
    ld   l, a

label_7546D::
    ld   [hl], l
    ld   l, h
    ld   h, h
    ld   hl, label_2020
    ld   c, c
    jr   nz, label_754ED
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h

label_7547A::
    jr   nz, label_754E2
    ld   l, h
    ld   a, c

label_7547E::
    jr   nz, label_754F4
    ld   l, a
    jr   nz, label_754E9
    ld   h, c
    ld   [hl], d
    jr   nz, label_754E8
    ld   [hl], a

label_75488::
    ld   h, c
    ld   a, c
    jr   nz, label_754FC
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l
    ld   [hl], e
    jr   nz, label_754F4
    ld   l, [hl]
    ld   h, h
    jr   nz, label_7550A
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_75502
    ld   l, a
    ld   [hl], d
    jr   nz, label_7550D
    ld   h, c
    ld   l, [hl]
    ld   a, c
    jr   nz, label_75515
    ld   h, l

label_754A6::
    ld   l, a
    ld   [hl], b
    ld   l, h
    ld   h, l
    ld   hl, label_2E2E
    ld   l, $49
    ld   h, [hl]
    jr   nz, label_754FB
    jr   nz, label_7552B
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_7552D
    ld   l, a

label_754BA::
    jr   nz, label_75530
    ld   l, b
    ld   h, l
    jr   nz, label_75517
    ld   l, c

label_754C1::
    ld   l, [hl]

label_754C2::
    ld   h, h
    jr   nz, label_7550B
    ld   l, c
    ld   [hl], e
    ld   l, b

label_754C8::
    inc  l

label_754C9::
    jr   nz, label_754EB

label_754CB::
    ld   c, c
    jr   nz, label_75545
    ld   l, a

label_754CF::
    ld   l, [hl]
    ld   h, h
    ld   h, l
    ld   [hl], d
    jr   nz, label_7553E
    ld   h, [hl]
    jr   nz, label_75545
    ld   a, c
    jr   nz, label_754FB
    ld   h, h
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   l, l
    jr   nz, label_75559

label_754E2::
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_7554A
    ld   l, a

label_754E8::
    ld   l, l

label_754E9::
    ld   h, l
    jr   nz, label_75560
    ld   [hl], d

label_754ED::
    ld   [hl], l
    ld   h, l
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $FF

label_754FB::
    ld   c, b

label_754FC::
    ld   h, l
    ld   a, c
    ld   hl, label_2020
    ld   b, c

label_75502::
    ld   [hl], d
    ld   h, l
    jr   nz, label_7557F
    ld   l, a
    ld   [hl], l
    jr   nz, label_7552A

label_7550A::
    jr   nz, label_75578
    ld   l, c

label_7550D::
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   l, [hl]
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ccf

label_75515::
    jr   nz, label_75537

label_75517::
    jr   nz, label_75539
    jr   nz, label_7553B
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    jr   nz, label_75584
    ld   [hl], d
    ld   h, l
    jr   nz, label_755A0
    ld   l, a
    ld   [hl], l
    jr   nz, label_7554B

label_7552B::
    ld   l, h
    ld   l, c

label_7552D::
    ld   [hl], e
    ld   [hl], h
    ld   h, l

label_75530::
    ld   l, [hl]
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_755AA
    ld   l, a

label_75537::
    jr   nz, label_755A6

label_75539::
    ld   h, l
    ccf

label_7553B::
    jr   nz, label_7555D
    jr   nz, label_7555F
    ld   e, c
    ld   h, l
    ld   h, c
    ld   l, b
    jr   nz, label_75593

label_75545::
    ld   l, a
    ld   l, $2E
    ld   l, $FE

label_7554A::
    ld   c, c

label_7554B::
    jr   nz, label_755C4
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_755C6
    ld   l, a
    jr   nz, label_755C0
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_7557A
    ld   h, l
    db   $76 ; Halt
    ld   h, l

label_7555D::
    ld   [hl], d
    ld   a, c

label_7555F::
    ld   [hl], h

label_75560::
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_755C7
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   a, c
    ld   l, a
    ld   [hl], l
    ld   l, $2E
    ld   l, $45
    ld   [hl], d
    ld   [hl], d
    ld   l, $2E
    ld   l, $55
    ld   l, b

label_75578::
    ld   l, b
    inc  l

label_7557A::
    ld   c, b
    ld   h, c
    jr   nz, label_755E6
    ld   h, c

label_7557F::
    jr   nz, label_755E9
    ld   h, c
    jr   nz, label_755EC

label_75584::
    ld   h, c
    ld   hl, label_748FF
    ld   [hl], l
    ld   l, [hl]
    ld   l, b
    ccf
    jr   nz, label_755E2
    ld   l, b
    ld   h, l
    jr   nz, label_75609
    ld   h, c

label_75593::
    ld   l, h
    ld   [hl], d
    ld   [hl], l
    ld   [hl], e
    ld   [hl], a
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_7560B
    ld   h, l
    jr   nz, label_75615
    ld   l, a
    jr   nz, label_7560B
    ld   l, a
    jr   nz, label_755C7
    ld   [hl], h
    ld   l, a
    jr   nz, label_75613
    ld   l, c
    ld   l, l
    ccf
    jr   nz, label_755D0
    ld   c, c
    ld   [hl], h
    jr   nz, label_755D4
    jr   nz, label_755D6
    jr   nz, label_7561C
    ld   l, a
    ld   h, l
    ld   [hl], e
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_7562D

label_755C0::
    ld   h, c
    ld   [hl], h
    ld   [hl], h
    ld   h, l

label_755C4::
    ld   [hl], d
    inc  l

label_755C6::
    jr   nz, label_75611
    jr   nz, label_75641
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_75636
    ld   l, a

label_755D0::
    jr   nz, label_75649
    ld   l, c
    ld   [hl], h

label_755D4::
    ld   l, b
    jr   nz, label_755F7
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_75650
    ld   l, a
    jr   nz, label_75647
    ld   l, c
    ld   l, l
    ld   l, $2E
    ld   l, $FF
    ld   d, l

label_755E6::
    ld   l, [hl]
    ld   l, [hl]
    ld   l, [hl]

label_755E9::
    ld   l, [hl]
    ld   h, a
    ld   l, b

label_755EC::
    ld   hl, label_74F20
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    ld   [hl], a
    ld   hl, label_2E2E

label_755F7::
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   c, c
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l

label_75609::
    jr   nz, label_7567E

label_7560B::
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_7567C
    ld   l, a

label_75611::
    ld   [hl], e
    ld   [hl], h

label_75613::
    jr   nz, label_75635

label_75615::
    ld   l, l
    ld   a, c
    jr   nz, label_7568D
    ld   h, c
    ld   [hl], e
    ld   [hl], h

label_7561C::
    ld   h, l
    jr   nz, label_75685
    ld   l, a
    ld   [hl], d
    jr   nz, label_75643
    jr   nz, label_75645
    ld   l, b
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   a, c
    ld   hl, label_748FF

label_7562D::
    ld   [hl], l
    ld   l, l
    ld   [hl], b
    ld   l, b
    ld   hl, label_75920
    ld   l, a

label_75635::
    ld   [hl], l

label_75636::
    ld   [hl], d
    jr   nz, label_756A1
    ld   h, l
    ld   h, c
    ld   h, h
    ld   l, c
    ld   [hl], e
    jr   nz, label_756A1
    ld   l, h

label_75641::
    ld   [hl], a
    ld   h, c

label_75643::
    ld   a, c
    ld   [hl], e

label_75645::
    jr   nz, label_756B0

label_75647::
    ld   l, [hl]
    jr   nz, label_756BE
    ld   l, b
    ld   h, l
    ld   h, e
    ld   l, h
    ld   l, a
    ld   [hl], l

label_75650::
    ld   h, h
    ld   [hl], e
    ld   hl, label_75720
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_756D3
    ld   l, a
    ld   [hl], l
    ld   [hl], b
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l
    jr   nz, label_756D0
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_756DF
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_756DE
    ld   h, l
    ld   a, b
    ld   [hl], h
    jr   nz, label_756E9
    ld   l, c
    ld   l, l
    ld   h, l
    ccf
    ld   hl, label_748FF

label_7567C::
    ld   h, c
    ld   hl, label_75420
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_75685::
    jr   nz, label_756E8
    ld   l, h
    ld   l, h
    jr   nz, label_756AB
    ld   a, c
    ld   l, a

label_7568D::
    ld   [hl], l
    ld   e, [hl]
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_756FA
    ld   l, a
    ld   [hl], h
    ccf
    ld   hl, label_2020
    jr   nz, label_756BB
    ld   b, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_75712
    ld   h, l

label_756A1::
    ld   h, c
    ld   h, h
    ld   a, c
    jr   nz, label_7570C
    ld   l, a
    ld   [hl], d
    jr   nz, label_756CA
    jr   nz, label_75700
    ld   c, b
    ld   c, c
    ld   d, e
    ld   hl, label_75AFF
    ld   e, d
    ld   e, d
    jr   nz, label_75710
    ld   e, d
    ld   e, d
    jr   nz, label_75714
    ld   e, d

label_756BB::
    ld   e, d
    jr   nz, label_75718

label_756BE::
    ld   e, d
    ld   e, d
    jr   nz, label_756E2
    ld   l, $2E
    ld   l, $20
    sbc  a, $20
    ld   l, $2E

label_756CA::
    ld   l, $20
    sbc  a, $20
    ld   l, $2E

label_756D0::
    ld   l, $FF
    ld   e, c

label_756D3::
    ld   h, l
    ld   [hl], e
    inc  l
    jr   nz, label_75741
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_75751
    ld   l, b

label_756DE::
    ld   h, c

label_756DF::
    ld   [hl], h
    jr   nz, label_75702

label_756E2::
    ld   l, h
    ld   h, c
    ld   a, d
    ld   a, c
    jr   nz, label_7575F

label_756E8::
    ld   h, c

label_756E9::
    ld   l, h
    ld   [hl], d
    ld   [hl], l
    ld   [hl], e
    ld   hl, label_2020
    jr   nz, label_75712
    ld   d, e
    ld   l, b
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_75770
    ld   h, l

label_756FA::
    jr   nz, label_75763
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_75721
    jr   nz, label_7576B
    ld   l, c
    ld   l, l
    jr   nz, label_75768
    jr   nz, label_75775
    ld   l, c
    ld   [hl], h
    ld   [hl], h

label_7570C::
    ld   l, h
    ld   h, l
    jr   nz, label_75730

label_75710::
    jr   nz, label_75732

label_75712::
    ld   [hl], e
    ld   [hl], l

label_75714::
    ld   [hl], d
    ld   [hl], b
    ld   [hl], d
    ld   l, c

label_75718::
    ld   [hl], e
    ld   h, l
    ccf
    jr   nz, label_7573D
    jr   nz, label_7573F
    jr   nz, label_75741

label_75721::
    jr   nz, label_75743
    jr   nz, label_75745
    jr   nz, label_75780
    ld   h, l
    ld   [hl], e
    jr   nz, label_7574B
    ld   c, [hl]
    ld   l, a
    ld   l, $2E
    ld   l, $FE
    ld   b, c

label_75732::
    ld   l, b
    ld   h, c
    jr   nz, label_7579E
    ld   h, c
    jr   nz, label_757A1
    ld   h, c
    ld   hl, label_2020

label_7573D::
    ld   d, a
    ld   l, a

label_7573F::
    ld   [hl], a
    ld   hl, label_76548

label_75743::
    jr   nz, label_757A8

label_75745::
    ld   h, l
    ld   [hl], d
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   l, [hl]

label_7574B::
    ld   l, h
    ld   a, c
    jr   nz, label_7576F
    jr   nz, label_75771

label_75751::
    ld   [hl], a
    ld   l, a
    ld   l, e
    ld   h, l
    jr   nz, label_757CE
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_757BD
    jr   nz, label_7577E
    jr   nz, label_75780
    jr   nz, label_757D5
    ld   [hl], h

label_75763::
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   hl, label_748FF
    ld   [hl], l
    ld   l, [hl]

label_7576B::
    ld   l, b
    ccf
    jr   nz, label_7578F

label_7576F::
    ld   c, a

label_75770::
    ld   l, b

label_75771::
    inc  l
    jr   nz, label_757DC
    ld   h, l

label_75775::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_757DC
    ld   h, c
    ld   l, h
    ld   l, h
    ld   l, c
    ld   l, [hl]

label_7577E::
    ld   h, a
    jr   nz, label_757EE
    ld   h, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_757A8
    ld   c, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_75802
    ld   l, b

label_7578F::
    ld   h, l
    jr   nz, label_75805
    ld   h, c
    ld   l, l
    ld   h, l
    jr   nz, label_757F8
    ld   [hl], e
    ld   h, c
    ld   l, h
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   [hl], e

label_7579E::
    ld   l, $2E
    ld   l, $20
    ld   c, b
    ld   h, c
    jr   nz, label_7580E
    ld   h, c
    ld   hl, label_759FF
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_75823
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    inc  l
    jr   nz, label_75821
    ld   [hl], h
    ld   [hl], a
    ld   l, a
    ld   [hl], l
    ld   l, h

label_757BD::
    ld   h, h
    jr   nz, label_75822
    ld   h, l
    jr   nz, label_75830
    ld   h, l
    ld   h, c
    ld   l, [hl]
    jr   nz, label_7583C
    ld   l, a
    ld   [hl], a
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_75837
    ld   l, c
    ld   l, l
    jr   nz, label_75848
    ld   [hl], b
    jr   nz, label_75844
    ld   l, a
    ld   [hl], a
    ld   hl, label_7654C
    ld   [hl], h

label_757DC::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_7584C
    ld   h, l
    ld   [hl], h
    jr   nz, label_7584C
    ld   l, c
    ld   l, l
    jr   nz, label_75808
    jr   nz, label_7585D
    ld   l, h
    ld   h, l
    ld   h, l
    ld   [hl], b

label_757EE::
    jr   nz, label_75863
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_75862
    ld   l, a
    ld   [hl], d
    ld   h, l

label_757F8::
    ld   hl, label_23FF
    inc  hl
    inc  hl
    inc  hl
    inc  hl

label_757FF::
    inc  l
    jr   nz, label_7584B

label_75802::
    ld   e, [hl]
    ld   l, l
    jr   nz, label_7586D
    ld   l, a
    ld   l, c

label_75808::
    ld   l, [hl]
    ld   h, a
    ld   [hl], h
    ld   l, a
    jr   nz, label_75882

label_7580E::
    ld   l, b
    ld   h, l
    jr   nz, label_75853
    ld   l, [hl]
    ld   l, c
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_75839
    jr   nz, label_75871
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l

label_75821::
    ld   hl, label_2020
    ld   d, b
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l
    ld   h, h
    ld   [hl], d
    ld   l, a
    ld   [hl], b
    jr   nz, label_75892

label_75830::
    ld   a, c
    inc  l
    jr   nz, label_758A3
    ld   l, e
    ld   h, c
    ld   a, c

label_75837::
    ccf
    rst  $38

label_75839::
    ld   b, c
    ld   [hl], d
    ld   h, [hl]

label_7583C::
    ld   l, b
    ld   hl, label_74120
    ld   [hl], d
    ld   h, [hl]
    ld   l, b
    ld   hl, label_74120
    ld   [hl], d
    ld   h, [hl]

label_75848::
    ld   hl, $DE20

label_7584B::
    jr   nz, label_7586D
    sbc  a, $21
    jr   nz, label_75871
    sbc  a, $20

label_75853::
    jr   nz, label_75875
    sbc  a, $21
    jr   nz, label_75879
    ld   l, $2E
    ld   l, $2E

label_7585D::
    ld   l, $20
    db   $3F
    ccf
    ccf

label_75862::
    jr   nz, label_75863
    ld   c, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_758D8
    ld   l, a
    jr   nz, label_758E2

label_7586D::
    ld   [hl], e
    ld   h, l
    inc  l
    jr   nz, label_75892
    jr   nz, label_75894
    ld   l, h

label_75875::
    ld   l, c
    ld   [hl], h
    ld   [hl], h
    ld   l, h

label_75879::
    ld   h, l
    jr   nz, label_758DE
    ld   [hl], l
    ld   h, h
    ld   h, h
    ld   a, c
    ld   hl, label_2020
    ld   b, c
    ld   h, [hl]
    ld   l, c
    ld   [hl], e
    ld   l, b
    jr   nz, label_758FE
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_758FC
    ld   a, c
    jr   nz, label_758B2

label_75892::
    jr   nz, label_758B4

label_75894::
    ld   l, b
    ld   l, a
    ld   l, a
    ld   l, e
    ld   l, $2E
    ld   l, $20
    ld   c, c
    jr   nz, label_7590A
    ld   h, l
    ld   h, l
    ld   [hl], b
    jr   nz, label_758C4
    ld   h, e
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7591A
    ld   a, c
    jr   nz, label_7591C
    ld   l, c
    ld   l, [hl]

label_758B2::
    ld   h, l
    jr   nz, label_7591E
    ld   l, [hl]
    ld   [hl], h
    ld   l, a
    jr   nz, label_7592E
    ld   l, b
    ld   h, l
    jr   nz, label_75935
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    inc  l
    jr   nz, label_75927
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_75912
    jr   nz, label_75933
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_758F3
    jr   nz, label_7593C
    ld   l, a
    ld   [hl], h
    jr   nz, label_7593A
    jr   nz, label_7593D
    ld   l, c
    ld   [hl], h
    ld   h, l

label_758DE::
    ld   l, $2E
    ld   l, $20

label_758E2::
    ld   c, c
    jr   nz, label_75959
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_75961
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_75912
    jr   nz, label_75914
    ld   [hl], a
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_75963
    ld   h, c

label_758FC::
    ld   [hl], b
    ld   [hl], b

label_758FE::
    ld   h, l
    ld   l, [hl]
    ld   l, $2E
    ld   l, $FF
    ld   c, a
    ld   l, b
    ld   hl, label_75720
    ld   l, b

label_7590A::
    ld   h, c
    ld   [hl], h
    jr   nz, label_75977
    ld   [hl], e
    jr   nz, label_75985
    ld   l, b

label_75912::
    ld   h, c
    ld   [hl], h

label_75914::
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_75981
    ld   h, c

label_7591A::
    db   $76 ; Halt
    ld   h, l

label_7591C::
    jr   nz, label_75987

label_7591E::
    ld   l, [hl]
    jr   nz, label_7599A

label_75921::
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   l, b
    ld   h, c
    ld   l, [hl]

label_75927::
    ld   h, h
    ccf
    jr   nz, label_7594B
    ld   c, c
    ld   [hl], h
    ld   e, [hl]

label_7592E::
    ld   [hl], e
    jr   nz, label_7599F
    ld   l, a
    ld   [hl], h

label_75933::
    jr   nz, label_75996

label_75935::
    jr   nz, label_7599D
    ld   l, c
    ld   [hl], e
    ld   l, b

label_7593A::
    ld   l, c
    ld   l, [hl]

label_7593C::
    ld   h, a

label_7593D::
    jr   nz, label_759A7
    ld   l, a
    ld   l, a
    ld   l, e
    inc  l
    jr   nz, label_759AE
    ld   [hl], e
    jr   nz, label_759B1
    ld   [hl], h
    ccf
    jr   nz, label_7596C
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_759B9
    ld   h, c
    ld   h, h
    jr   nz, label_759B7
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l

label_75959::
    ld   [hl], d
    jr   nz, label_759C8
    ld   h, l
    ld   [hl], h
    jr   nz, label_759CD
    ld   h, l

label_75961::
    jr   nz, label_75983

label_75963::
    jr   nz, label_759CD
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_759D3
    ld   [hl], h
    ld   l, $20
    jr   nz, label_759B8
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_75994
    ld   h, a
    ld   l, c
    db   $76 ; Halt

label_75977::
    ld   h, l
    jr   nz, label_759F3
    ld   l, a
    ld   [hl], l
    jr   nz, label_759EB
    ld   a, c
    jr   nz, label_759EF

label_75981::
    ld   h, l
    ld   a, b

label_75983::
    ld   [hl], h
    ld   h, e

label_75985::
    ld   h, c
    ld   [hl], h

label_75987::
    ld   h, e
    ld   l, b
    jr   nz, label_759F4
    ld   h, [hl]
    jr   nz, label_75A07
    ld   l, a
    ld   [hl], l
    jr   nz, label_759FE
    ld   h, l
    ld   [hl], h

label_75994::
    ld   l, l
    ld   h, l

label_75996::
    jr   nz, label_75A00
    ld   h, c
    db   $76 ; Halt

label_7599A::
    ld   h, l
    jr   nz, label_75A06

label_7599D::
    ld   [hl], h
    ld   l, $2E
    ld   l, $20
    jr   nz, label_759C4
    jr   nz, label_759C6
    jr   nz, label_759C8
    ld   c, a
    ld   l, e
    ld   h, c
    ld   a, c
    jr   nz, label_759FC

label_759AE::
    ld   l, a
    cp   $4B

label_759B1::
    ld   h, l
    ld   h, l
    ld   [hl], b
    jr   nz, label_75A2F
    ld   l, a

label_759B7::
    ld   [hl], l

label_759B8::
    ld   [hl], d

label_759B9::
    jr   nz, label_75A20
    ld   a, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_759E0
    ld   l, a
    ld   [hl], b
    ld   h, l
    ld   l, [hl]

label_759C4::
    jr   nz, label_75A27

label_759C6::
    ld   l, [hl]
    ld   h, h

label_759C8::
    jr   nz, label_75A41
    ld   h, c
    ld   [hl], h
    ld   h, e

label_759CD::
    ld   l, b
    jr   nz, label_759F0
    ld   h, c
    jr   nz, label_75A43

label_759D3::
    ld   [hl], d
    ld   l, a
    jr   nz, label_75A38
    ld   [hl], h
    jr   nz, label_75A51
    ld   l, a
    ld   [hl], d
    ld   l, e
    ld   l, $FF
    ld   e, c

label_759E0::
    ld   l, a
    ld   [hl], l
    jr   nz, label_75A57
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_75A4D

label_759EB::
    ld   h, l
    jr   nz, label_75A0E
    jr   nz, label_75A5D

label_759F0::
    ld   l, a
    ld   [hl], d
    ld   h, l

label_759F3::
    jr   nz, label_75A60
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75A6E
    ld   l, a
    jr   nz, label_75A6A
    ld   h, l

label_759FE::
    ld   hl, label_2049
    ld   [hl], h
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   h, a

label_75A06::
    ld   l, b

label_75A07::
    ld   [hl], h
    jr   nz, label_75A81
    ld   h, l
    jr   nz, label_75A2D
    jr   nz, label_75A2F
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_75A77
    ld   [hl], l
    ld   h, h
    ld   h, h
    ld   l, c
    ld   h, l
    ld   [hl], e
    ld   hl, label_74DFF
    ld   a, c
    inc  l

label_75A20::
    jr   nz, label_75A96
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_75A27::
    jr   nz, label_75A8A
    jr   nz, label_75A4B
    jr   nz, label_75A4D

label_75A2D::
    ld   b, d
    ld   c, c

label_75A2F::
    ld   c, c
    ld   c, c
    ld   c, c
    ld   b, a
    jr   nz, label_75AA4
    ld   l, [hl]
    ld   h, l
    ld   hl, label_754FF
    ld   l, b
    ld   h, l
    jr   nz, label_75A27
    jr   nz, label_75AA2
    ld   h, l

label_75A41::
    ld   h, e
    ld   h, c

label_75A43::
    ld   l, l
    ld   h, l
    jr   nz, label_75AA8
    jr   nz, label_75A69
    ld   l, [hl]
    ld   h, l

label_75A4B::
    ld   h, e
    ld   l, e

label_75A4D::
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l

label_75A51::
    jr   nz, label_75A3D
    ld   hl, label_2020
    jr   nz, label_75A78
    jr   nz, label_75AA6
    dec  l
    ld   l, h
    dec  l

label_75A5D::
    ld   l, h
    ld   [hl], l
    ld   h, e

label_75A60::
    ld   l, e
    ld   a, c
    ld   hl, label_749FF
    jr   nz, label_75ACA
    ld   h, c
    ld   l, [hl]

label_75A69::
    ld   e, [hl]

label_75A6A::
    ld   [hl], h
    jr   nz, label_75AE4
    ld   h, c

label_75A6E::
    ld   l, c
    ld   [hl], h
    jr   nz, label_75AE6
    ld   l, a
    jr   nz, label_75AE8
    ld   h, l
    ld   h, l

label_75A77::
    jr   nz, label_75AF0
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_75AC7
    ld   e, [hl]
    ld   l, h
    ld   l, h

label_75A81::
    jr   nz, label_75AA3
    jr   nz, label_75AE8
    ld   h, c
    ld   [hl], h
    ld   h, e
    ld   l, b
    jr   nz, label_75AF9
    ld   h, l
    ld   a, b
    ld   [hl], h
    ld   hl, label_74DFF
    ld   a, c
    jr   nz, label_75AFC
    ld   [hl], l
    ld   [hl], e

label_75A96::
    ld   h, d
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75B05
    ld   [hl], e
    jr   nz, label_75ABF
    jr   nz, label_75B0D
    ld   l, a

label_75AA2::
    ld   [hl], e

label_75AA3::
    ld   [hl], h

label_75AA4::
    jr   nz, label_75B0F

label_75AA6::
    ld   l, [hl]
    jr   nz, label_75B1D
    ld   l, b
    ld   h, l
    jr   nz, label_75ACD
    jr   nz, label_75ACF
    jr   nz, label_75B28
    ld   l, a
    ld   l, a
    ld   h, h
    ld   [hl], e
    ld   hl, label_75020
    ld   l, h
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   h, l
    jr   nz, label_75ADF

label_75ABF::
    jr   nz, label_75B28
    ld   l, a
    jr   nz, label_75B2A
    ld   l, c
    ld   l, [hl]
    ld   h, h

label_75AC7::
    jr   nz, label_75B31
    ld   l, c

label_75ACA::
    ld   l, l
    ld   hl, label_748FF
    ld   h, l

label_75ACF::
    ld   a, c
    inc  l
    jr   nz, label_75B4C
    ld   l, a
    ld   [hl], l
    jr   nz, label_75B3A
    ld   h, c
    ld   l, [hl]
    jr   nz, label_75B4E
    ld   h, l
    ld   h, l
    ld   l, l
    ld   h, l

label_75ADF::
    ccf
    ld   hl, label_75920
    ld   l, a

label_75AE4::
    ld   [hl], l
    jr   nz, label_75B54
    ld   [hl], l

label_75AE8::
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_75B0C
    jr   nz, label_75B56
    ld   h, c
    db   $76 ; Halt

label_75AF0::
    ld   h, l
    jr   nz, label_75B54
    jr   nz, label_75B62
    ld   h, c
    ld   h, a
    ld   l, [hl]
    ld   l, c

label_75AF9::
    ld   h, [hl]
    ld   a, c
    dec  l

label_75AFC::
    jr   nz, label_75B67
    ld   l, [hl]

label_75AFF::
    ld   h, a
    jr   nz, label_75B69
    ld   l, h
    ld   h, c
    ld   [hl], e

label_75B05::
    ld   [hl], e
    ld   l, $20
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_75B2D

label_75B0D::
    ld   l, [hl]
    ld   l, a

label_75B0F::
    ld   [hl], h
    jr   nz, label_75B73
    jr   nz, label_75B88
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   h, d
    ld   l, h
    ld   h, l
    jr   nz, label_75B3C
    jr   nz, label_75B8B
    ld   h, c
    ld   l, e
    ld   h, l
    ld   [hl], d
    ld   l, $20
    ld   c, c
    jr   nz, label_75B91
    ld   [hl], l

label_75B28::
    ld   [hl], e
    ld   [hl], h

label_75B2A::
    jr   nz, label_75B4C
    jr   nz, label_75BA5
    ld   h, c
    ld   l, [hl]
    ld   [hl], h

label_75B31::
    jr   nz, label_75BA7
    ld   l, a
    jr   nz, label_75BA2
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_75BA4
    ld   l, [hl]

label_75B3C::
    jr   nz, label_75BAE
    ld   h, l
    ld   h, c
    ld   h, e
    ld   h, l
    ld   l, $FF
    ld   d, a
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_75B93
    jr   nz, label_75BC3

label_75B4C::
    ld   h, c
    ld   [hl], e

label_75B4E::
    jr   nz, label_75BC3
    ld   [hl], a
    ld   l, c
    ld   l, l
    dec  l

label_75B54::
    ld   l, l
    ld   l, c

label_75B56::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_75BC3
    ld   l, [hl]
    jr   nz, label_75BD1
    ld   l, b
    ld   h, l
    jr   nz, label_75BC3
    ld   h, c

label_75B62::
    ld   a, c
    inc  l
    ld   [hl], h
    ld   l, b
    ld   h, l

label_75B67::
    jr   nz, label_75BE0

label_75B69::
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   [hl], e
    jr   nz, label_75BE3
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_75BD5
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   a, c
    jr   nz, label_75BE3
    ld   l, l
    ld   [hl], b
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_75BA4
    ld   l, [hl]
    ld   h, l
    ld   h, e
    ld   l, e

label_75B88::
    ld   l, h
    ld   h, c
    ld   h, e

label_75B8B::
    ld   h, l
    jr   nz, label_75BF4
    ld   [hl], d
    ld   l, a
    ld   l, l

label_75B91::
    jr   nz, label_75BB3

label_75B93::
    jr   nz, label_75BF6
    ld   [hl], d
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75C09
    ld   a, c
    jr   nz, label_75C0D
    ld   h, l
    ld   h, e
    ld   l, e

label_75BA2::
    ld   hl, label_74920

label_75BA5::
    ld   h, [hl]
    jr   nz, label_75C21
    ld   l, a
    ld   [hl], l
    jr   nz, label_75C12
    ld   l, c
    ld   l, [hl]

label_75BAE::
    ld   h, h
    jr   nz, label_75C1A
    ld   [hl], h
    inc  l

label_75BB3::
    jr   nz, label_75BFE
    jr   nz, label_75C2E
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_75C28
    ld   h, l
    ld   [hl], h
    jr   nz, label_75C39
    ld   l, a
    ld   [hl], l
    jr   nz, label_75BE4
    ld   [hl], h
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_75C2B
    jr   nz, label_75C3F
    ld   h, e
    ld   h, c
    ld   l, h
    ld   h, l
    jr   nz, label_75BF2
    jr   nz, label_75BF4
    ld   h, [hl]

label_75BD5::
    ld   [hl], d
    ld   l, a
    ld   l, l
    jr   nz, label_75C47
    ld   a, c
    jr   nz, label_75C51
    ld   h, c
    ld   l, c
    ld   l, h

label_75BE0::
    ld   hl, label_2020

label_75BE3::
    jr   nz, label_75BE4
    ld   c, c
    jr   nz, label_75C50
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_75C4E
    ld   l, h
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   h, h

label_75BF2::
    ld   a, c
    jr   nz, label_75C15
    ld   l, h

label_75BF6::
    ld   l, a
    ld   l, a
    ld   l, e
    ld   h, l
    ld   h, h
    jr   nz, label_75C5E
    ld   [hl], d

label_75BFE::
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75C24
    jr   nz, label_75C6E
    ld   h, l
    ld   [hl], d
    ld   h, l

label_75C09::
    ld   hl, label_741FF
    ld   l, b

label_75C0D::
    ld   l, b
    ld   hl, label_2020
    ld   d, h

label_75C12::
    ld   l, b
    ld   h, c
    ld   [hl], h

label_75C15::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_75C82
    ld   [hl], h

label_75C1A::
    ld   hl, label_76854
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_75C21::
    jr   nz, label_75C90
    ld   a, c

label_75C24::
    jr   nz, label_75C94
    ld   h, l
    ld   h, e

label_75C28::
    ld   l, e
    dec  l
    jr   nz, label_75C98
    ld   h, c
    ld   h, e

label_75C2E::
    ld   h, l
    ld   hl, label_2020
    ld   b, a
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_75CA1
    ld   [hl], h

label_75C39::
    ld   hl, label_74720
    ld   l, c
    db   $76 ; Halt
    ld   h, l

label_75C3F::
    jr   nz, label_75CAA
    ld   [hl], h
    jr   nz, label_75CA6
    ld   h, c
    ld   h, e
    ld   l, e

label_75C47::
    ld   hl, label_2020
    ld   c, c
    ld   [hl], a
    ld   l, c
    ld   l, h

label_75C4E::
    ld   l, h
    jr   nz, label_75CB8

label_75C51::
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_75CCF
    ld   l, a
    ld   [hl], l
    jr   nz, label_75CBB
    jr   nz, label_75CCF
    ld   h, e
    ld   h, c

label_75C5E::
    ld   l, h
    ld   h, l
    jr   nz, label_75CC3
    ld   [hl], e
    jr   nz, label_75CAE
    jr   nz, label_75CDA
    ld   h, c
    ld   l, c
    ld   h, h
    ld   hl, label_2020
    jr   nz, label_75C8F
    ld   b, a
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_75CC0
    ld   h, l
    ld   h, l
    ld   [hl], b
    cp   $50
    ld   [hl], d
    ld   l, a
    ld   l, l
    ld   l, c
    ld   [hl], e
    ld   h, l
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   l, h
    ld   l, h
    ld   l, a
    ld   l, [hl]
    ld   l, h
    ld   a, c
    jr   nz, label_75D03

label_75C8F::
    ld   h, c

label_75C90::
    ld   l, e
    ld   h, l
    jr   nz, label_75D03

label_75C94::
    ld   l, [hl]
    ld   h, l
    ld   hl, label_759FF
    ld   l, a
    ld   [hl], l
    jr   nz, label_75CFE
    ld   [hl], d
    ld   h, l
    jr   nz, label_75D09

label_75CA1::
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    dec  l

label_75CA6::
    jr   nz, label_75CC8
    ld   l, h
    ld   h, l

label_75CAA::
    ld   [hl], e
    ld   [hl], e
    jr   nz, label_75D0F

label_75CAE::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75D15
    ld   [hl], d
    ld   [hl], l
    ld   h, l
    ld   l, h
    ld   hl, label_759FF
    ld   l, a
    ld   [hl], l

label_75CBB::
    jr   nz, label_75D2F
    ld   h, l
    ld   [hl], h
    ld   [hl], l

label_75CC0::
    ld   [hl], d
    ld   l, [hl]
    ld   h, l

label_75CC3::
    ld   h, h
    jr   nz, label_75D3A
    ld   l, b
    ld   h, l

label_75CC8::
    ld   l, [hl]
    ld   h, l
    ld   h, e
    ld   l, e
    ld   l, h
    ld   h, c
    ld   h, e

label_75CCF::
    ld   h, l

label_75CD0::
    jr   nz, label_75CBC
    jr   nz, label_75D35
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75CF8
    ld   h, a
    ld   l, a

label_75CDA::
    ld   [hl], h
    jr   nz, label_75D3E
    jr   nz, label_75D52
    ld   h, e
    ld   h, c
    ld   l, h
    ld   h, l
    jr   nz, label_75CD0
    jr   nz, label_75D56
    ld   h, [hl]
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_75D5A
    ld   h, l
    ld   [hl], d
    ld   l, l
    ld   h, c
    ld   l, c
    ld   h, h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_75D17
    jr   nz, label_75D6D
    ld   h, c
    ld   l, c
    ld   l, h
    ld   l, $20

label_75CFE::
    jr   nz, label_75D48
    ld   l, a
    ld   [hl], a
    jr   nz, label_75D7B
    ld   l, c
    ld   l, h
    ld   l, h
    jr   nz, label_75D82

label_75D09::
    ld   l, a
    ld   [hl], l
    jr   nz, label_75D82
    ld   [hl], e
    ld   h, l

label_75D0F::
    jr   nz, label_75D85
    ld   l, b
    ld   l, c
    ld   [hl], e
    ccf

label_75D15::
    rst  $38
    ld   c, c

label_75D17::
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_75D7F
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_75D95
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_75D46
    ld   e, [hl]
    ld   c, c
    jr   nz, label_75D81
    ld   h, c
    ld   [hl], e
    jr   nz, label_75D84
    ld   h, l

label_75D2F::
    ld   [hl], d
    ld   a, c
    jr   nz, label_75D53
    jr   nz, label_75D55

label_75D35::
    jr   nz, label_75D78
    ld   h, [hl]
    ld   [hl], d
    ld   h, c

label_75D3A::
    ld   l, c
    ld   h, h
    ld   l, $5E

label_75D3E::
    jr   nz, label_75D93
    ld   l, l
    ld   l, c
    ld   l, h
    ld   h, l
    ld   hl, label_741FF
    ld   l, [hl]

label_75D48::
    jr   nz, label_75DAB
    ld   [hl], d
    ld   [hl], h
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_75DC0
    ld   l, [hl]

label_75D52::
    ld   h, e

label_75D53::
    ld   h, l
    jr   nz, label_75D76

label_75D56::
    ld   h, c
    ld   [hl], e
    ld   l, e
    ld   h, l

label_75D5A::
    ld   h, h
    jr   nz, label_75DCA
    ld   h, l
    jr   nz, label_75DD4
    ld   l, a
    jr   nz, label_75DD3
    ld   l, a
    ld   [hl], e
    ld   h, l
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    jr   nz, label_75DD3
    ld   l, c
    ld   l, l

label_75D6D::
    inc  l
    jr   nz, label_75DD1
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75DDC
    ld   h, l
    jr   nz, label_75DEE
    ld   h, c

label_75D78::
    ld   l, [hl]
    ld   [hl], h
    ld   h, l

label_75D7B::
    ld   h, h
    jr   nz, label_75DDF
    jr   nz, label_75DF3
    ld   h, e

label_75D81::
    ld   h, c

label_75D82::
    ld   l, h
    ld   h, l

label_75D84::
    inc  l

label_75D85::
    jr   nz, label_75DFB
    ld   l, a
    ld   l, a
    ld   l, $2E
    ld   l, $20
    jr   nz, label_75DD2
    ld   h, c
    ld   l, [hl]
    jr   nz, label_75E07

label_75D93::
    ld   l, b
    ld   h, l

label_75D95::
    jr   nz, label_75E03
    ld   h, l
    ld   h, a
    ld   h, l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75E0D
    ld   h, [hl]
    jr   nz, label_75E15
    ld   l, b
    ld   h, l
    jr   nz, label_75DC5
    jr   nz, label_75DF4
    ld   h, c
    ld   h, a
    ld   l, [hl]
    ld   l, c

label_75DAB::
    ld   h, [hl]
    ld   a, c
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_75DFE
    ld   h, l
    ld   l, [hl]
    ld   [hl], e
    jr   nz, label_75E19
    ld   h, l
    jr   nz, label_75E2E
    ld   [hl], d
    ld   [hl], l
    ld   h, l
    ld   l, $2E
    ld   l, $3F
    rst  $38
    ld   c, b
    ld   l, c
    jr   nz, label_75E3A
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l

label_75DCA::
    ld   hl, label_74920
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_75DF2

label_75DD2::
    ld   l, l

label_75DD3::
    ld   h, l

label_75DD4::
    inc  l
    jr   nz, label_75E4B
    ld   l, b
    ld   h, l
    jr   nz, label_75E4B
    ld   l, b

label_75DDC::
    ld   l, a
    ld   [hl], h
    ld   l, a

label_75DDF::
    dec  l
    jr   nz, label_75E02
    ld   h, a
    ld   [hl], d
    ld   h, c
    ld   [hl], b
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   hl, label_75920
    ld   l, a
    ld   [hl], l

label_75DEE::
    jr   nz, label_75E63
    ld   h, c
    ld   a, c

label_75DF2::
    ld   e, d

label_75DF3::
    ld   l, a

label_75DF4::
    ld   [hl], d
    ld   h, c
    jr   nz, label_75E61
    ld   [hl], e
    jr   nz, label_75E64

label_75DFB::
    ld   l, [hl]
    jr   nz, label_75E72

label_75DFE::
    ld   l, b
    ld   h, l
    jr   nz, label_75E22

label_75E02::
    ld   l, b

label_75E03::
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l

label_75E07::
    ccf
    jr   nz, label_75E53
    jr   nz, label_75E54
    ld   b, c

label_75E0D::
    ld   d, [hl]
    ld   b, l
    jr   nz, label_75E85
    ld   l, a
    ld   [hl], h
    ld   h, c
    ld   l, e

label_75E15::
    ld   h, l
    jr   nz, label_75E79
    jr   nz, label_75E8A
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    jr   nz, label_75E42

label_75E22::
    ld   l, a
    ld   h, [hl]
    jr   nz, label_75E9A
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   l, $20
    ld   c, c
    ld   e, [hl]
    ld   l, h

label_75E2E::
    ld   l, h
    jr   nz, label_75E51
    jr   nz, label_75E96
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_75EA1
    ld   [hl], h
    jr   nz, label_75E99
    ld   c, c
    jr   nz, label_75E84
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h

label_75E42::
    ld   e, d
    ld   l, a
    ld   [hl], d
    ld   h, c
    ld   l, $5E
    rst  $38
    ld   d, d
    ld   l, c

label_75E4B::
    ld   h, e
    ld   l, b
    ld   h, c
    ld   [hl], d
    ld   h, h
    ld   e, [hl]

label_75E51::
    ld   [hl], e
    jr   nz, label_75EAA

label_75E54::
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    jr   nz, label_75E59
    ld   c, e
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   l, h
    ld   h, l
    ld   [hl], h

label_75E61::
    jr   nz, label_75EA6

label_75E63::
    ld   h, c

label_75E64::
    ld   [hl], e

label_75E65::
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_75E8A
    ld   sp, label_2030
    ld   c, l
    ld   l, c
    ld   l, [hl]
    ld   l, $20

label_75E72::
    di
    jr   nz, label_75E65
    rst  $38
    ld   c, e
    ld   h, c
    ld   l, [hl]

label_75E79::
    ld   h, c
    ld   l, h
    ld   h, l
    ld   [hl], h
    jr   nz, label_75EC2
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, h
    ld   h, l

label_75E84::
    jr   nz, label_75EA6
    dec  [hl]
    jr   nz, label_75ED6
    ld   l, c

label_75E8A::
    ld   l, [hl]
    ld   l, $20
    di
    rst  $38
    ld   c, e
    ld   h, c
    ld   l, [hl]
    ld   h, c
    ld   l, h
    ld   h, l
    ld   [hl], h

label_75E96::
    jr   nz, label_75EDB
    ld   h, c

label_75E99::
    ld   [hl], e

label_75E9A::
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_75EBF
    dec  [hl]
    jr   nc, label_75EC2
    ld   d, b
    ld   h, c
    ld   h, e
    ld   h, l

label_75EA6::
    ld   [hl], e
    jr   nz, label_75E99
    rst  $38

label_75EAA::
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c

label_75EBF::
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74320
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, label_75920
    ld   h, l
    ld   h, l
    ld   h, l
    ld   [hl], e
    ld   hl, label_2020
    ld   c, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_75ED6::
    jr   nz, label_75F4C
    ld   l, b
    ld   h, l
    ld   b, d

label_75EDB::
    ld   [hl], l
    ld   h, e
    ld   l, e
    ld   h, l
    ld   [hl], h
    jr   nz, label_75F2F
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    ld   hl, label_2020
    jr   nz, label_75F3F
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    ld   [hl], e
    jr   nz, label_75F58
    ld   l, a
    ld   [hl], d
    jr   nz, label_75F59
    ld   h, c
    ld   l, h
    ld   l, h
    dec  l
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   hl, label_2E20
    ld   l, $2E
    ld   d, a
    ld   h, l
    ld   l, h
    ld   l, h
    ld   l, $2E
    ld   l, $20
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, label_205E
    jr   nz, label_75F53
    ccf
    ccf
    jr   nz, label_75F46
    ld   l, $2E
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_75F8C
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_75F8C
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_75F49
    jr   nz, label_75F8F
    ld   l, c
    ld   h, c
    ld   l, h
    ld   h, l

label_75F2F::
    ld   h, h
    jr   nz, label_75F93
    jr   nz, label_75FAB
    ld   [hl], d
    ld   l, a
    ld   l, [hl]
    ld   h, a
    jr   nz, label_75F5A
    ld   l, [hl]
    ld   [hl], l
    ld   l, l
    ld   h, d
    ld   h, l

label_75F3F::
    ld   [hl], d
    ld   l, $2E
    ld   l, $FF
    ld   c, a
    ld   l, b

label_75F46::
    ld   hl, label_2020

label_75F49::
    ld   c, c
    ld   [hl], h
    ld   e, [hl]

label_75F4C::
    ld   [hl], e
    jr   nz, label_75FB0
    jr   nz, label_75FB3
    ld   l, c
    ld   h, a

label_75F53::
    jr   nz, label_75FC4
    ld   l, [hl]
    ld   h, l
    ld   hl, label_2020

label_75F5A::
    ld   b, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_75FC8
    ld   [hl], h
    jr   nz, label_75FCA
    ld   h, c
    ld   [hl], e
    ld   h, c
    jr   nz, label_75FB7
    ld   l, c
    ld   h, l
    ld   h, e
    ld   h, l
    jr   nz, label_75FDC
    ld   h, [hl]
    jr   nz, label_75F90
    jr   nz, label_75F92
    jr   nz, label_75F94
    ld   c, b
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    inc  l
    jr   nz, label_75FF0
    ld   l, a
    ld   l, a
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_75FEA
    jr   nz, label_75FBD
    jr   nc, label_75FAD
    ld   d, d
    ld   [hl], l

label_75F8F::
    ld   [hl], b

label_75F90::
    ld   h, l
    ld   h, l

label_75F92::
    jr   nz, label_75FB4

label_75F94::
    ld   [hl], b
    ld   [hl], d
    ld   l, c
    ld   a, d
    ld   h, l
    jr   nz, label_7600A
    ld   l, [hl]
    jr   nz, label_76012
    ld   l, a
    ld   [hl], b
    jr   nz, label_76011
    ld   h, [hl]
    jr   nz, label_76019
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   hl, label_75420

label_75FAB::
    ld   [hl], d
    ld   a, c

label_75FAD::
    jr   nz, label_76010
    ld   h, a

label_75FB0::
    ld   h, c
    ld   l, c
    ld   l, [hl]

label_75FB3::
    ccf

label_75FB4::
    jr   nz, label_75FD6
    jr   nz, label_75FD8
    ld   e, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_75FDD

label_75FBD::
    ld   c, [hl]
    ld   l, a
    cp   $4F
    ld   l, b
    ld   hl, label_2020
    ld   c, c
    ld   [hl], h
    ld   e, [hl]

label_75FC8::
    ld   [hl], e
    jr   nz, label_7602C
    jr   nz, label_7602F
    ld   l, c
    ld   h, a
    jr   nz, label_76040
    ld   l, [hl]
    ld   h, l
    ld   hl, label_2020

label_75FD6::
    ld   b, c
    ld   l, [hl]

label_75FD8::
    ld   h, h
    jr   nz, label_76044
    ld   [hl], h

label_75FDC::
    jr   nz, label_76046
    ld   h, c
    ld   [hl], e
    ld   h, c
    jr   nz, label_76033
    ld   l, c
    ld   h, l
    ld   h, e
    ld   h, l
    jr   nz, label_76058
    ld   h, [hl]

label_75FEA::
    jr   nz, label_7600C
    jr   nz, label_7600E
    jr   nz, label_76010

label_75FF0::
    ld   c, b
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    inc  l
    jr   nz, label_7606C
    ld   l, a
    ld   l, a
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   l, b
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_76069
    ld   l, a
    ld   l, l
    ld   [hl], b
    ld   l, h

label_7600A::
    ld   h, l
    ld   [hl], h

label_7600C::
    ld   h, l
    ld   h, h

label_7600E::
    jr   nz, label_76030

label_76010::
    ld   h, c

label_76011::
    ld   l, [hl]

label_76012::
    ld   l, a
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], d
    jr   nz, label_76061

label_76019::
    ld   h, l
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    jr   nz, label_7603F
    jr   nz, label_76064
    ld   l, a
    ld   l, [hl]
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   h, l
    ld   [hl], d
    ld   hl, label_2020

label_7602C::
    ld   c, a
    ld   l, [hl]
    jr   nz, label_76050

label_76030::
    ld   [hl], h
    ld   l, a
    ld   [hl], b

label_76033::
    jr   nz, label_760A4
    ld   h, [hl]
    jr   nz, label_760AC
    ld   l, b
    ld   h, c
    ld   [hl], h
    inc  l
    jr   nz, label_760B7
    ld   l, a

label_7603F::
    ld   [hl], l

label_76040::
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_760A6
    jr   nz, label_76079
    jr   nc, label_76069
    ld   d, d
    ld   [hl], l
    ld   [hl], b
    ld   h, l
    ld   h, l
    jr   nz, label_76070

label_76050::
    ld   [hl], b
    ld   [hl], d
    ld   l, c
    ld   a, d
    ld   h, l
    ld   hl, label_75720

label_76058::
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_760D1
    ld   l, a
    jr   nz, label_76080
    ld   [hl], h

label_76061::
    ld   [hl], d
    ld   a, c
    jr   nz, label_760C6
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]

label_76069::
    ccf
    jr   nz, label_7608C

label_7606C::
    jr   nz, label_7608E
    jr   nz, label_76090

label_76070::
    jr   nz, label_76092
    jr   nz, label_76094
    ld   e, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_76099

label_76079::
    ld   c, [hl]
    ld   l, a
    cp   $20
    ld   e, [hl]
    ld   c, b
    ld   l, a

label_76080::
    ld   [hl], a
    jr   nz, label_760D7
    ld   l, a
    jr   nz, label_760CE
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   l, h
    ld   h, l
    jr   nz, label_760AD
    jr   nz, label_760AF
    ld   e, c

label_76090::
    ld   l, a
    ld   [hl], l

label_76092::
    ld   [hl], d
    jr   nz, label_760E8
    ld   l, b
    ld   l, c
    ld   h, l
    ld   l, h

label_76099::
    ld   h, h
    jr   nz, label_760BC
    jr   nz, label_760BE
    jr   nz, label_760EC
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_760E6
    jr   nz, label_760F7
    ld   [hl], d
    ld   l, a
    ld   hl, label_205E

label_760AC::
    ld   d, d

label_760AD::
    ld   h, l
    ld   h, c

label_760AF::
    ld   h, h
    jr   nz, label_76126
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_76119

label_760B7::
    ld   l, a
    ld   l, a
    ld   l, e
    ccf
    jr   nz, label_760DD
    jr   nz, label_760DF
    jr   nz, label_7611A
    ld   b, l
    ld   d, e
    jr   nz, label_760E5
    ld   c, [hl]

label_760C6::
    ld   c, a
    cp   $5E
    ld   c, c
    ld   h, [hl]
    jr   nz, label_76146
    ld   l, a

label_760CE::
    ld   [hl], l
    jr   nz, label_76139

label_760D1::
    ld   l, a
    ld   l, h
    ld   h, h
    jr   nz, label_7614A
    ld   l, b

label_760D7::
    ld   h, l
    ld   b, d
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   l, a

label_760DD::
    ld   l, [hl]
    jr   nz, label_76144
    ld   l, a
    ld   [hl], a
    ld   l, [hl]
    inc  l
    jr   nz, label_7615F

label_760E6::
    ld   l, a
    ld   [hl], l

label_760E8::
    ld   h, e
    ld   h, c
    ld   l, [hl]
    jr   nz, label_76151
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_7616D
    ld   l, a
    ld   [hl], l
    ld   [hl], d

label_760F7::
    dec  l
    ld   [hl], e
    ld   h, l
    ld   l, h
    ld   h, [hl]
    jr   nz, label_76164
    ld   [hl], d
    ld   l, a
    ld   l, l
    jr   nz, label_76168
    ld   l, [hl]
    ld   h, l
    ld   l, l
    ld   a, c
    jr   nz, label_7616A
    ld   [hl], h
    ld   [hl], h
    ld   h, c
    ld   h, e
    ld   l, e
    ld   [hl], e
    inc  l
    jr   nz, label_76173
    ld   l, [hl]
    ld   h, h
    jr   nz, label_7618F
    ld   l, a
    ld   [hl], l
    ld   h, e

label_76119::
    ld   h, c

label_7611A::
    ld   l, [hl]
    jr   nz, label_76183
    ld   l, h
    ld   l, c
    ld   [hl], b
    jr   nz, label_76195
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_76147
    jr   nz, label_7618E
    ld   l, [hl]
    ld   h, l
    ld   l, l
    ld   l, c
    ld   h, l
    ld   [hl], e
    inc  l
    jr   nz, label_761A6
    ld   l, a
    ld   l, a
    ld   l, $2E
    ld   l, $20
    ld   b, d

label_76139::
    ld   h, l
    ld   [hl], e
    ld   l, c
    ld   h, h
    ld   h, l
    ld   [hl], e
    jr   nz, label_761B5
    ld   l, b
    ld   h, l
    jr   nz, label_76165
    jr   nz, label_76167

label_76147::
    jr   nz, label_761BC
    ld   [hl], h

label_7614A::
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   h, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_761C5
    ld   l, b
    ld   l, c
    ld   h, l
    ld   l, h
    ld   h, h
    jr   nz, label_761CD

label_76159::
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_761C8

label_7615F::
    ld   [hl], e
    jr   nz, label_761C3
    ld   l, h
    ld   [hl], e

label_76164::
    ld   l, a

label_76165::
    jr   nz, label_761C8

label_76167::
    jr   nz, label_761D6
    ld   l, c

label_7616A::
    ld   [hl], d
    ld   [hl], d
    ld   l, a

label_7616D::
    ld   [hl], d
    ld   h, l
    ld   h, h
    jr   nz, label_761E8
    ld   h, c

label_76173::
    ld   [hl], d
    ld   l, c
    ld   h, l
    ld   [hl], h
    ld   a, c
    ld   [hl], a
    ld   l, b
    ld   l, c
    ld   h, e
    ld   l, b
    jr   nz, label_761E2
    ld   h, c
    ld   l, [hl]
    jr   nz, label_761E7

label_76183::
    ld   h, l
    ld   h, [hl]
    ld   h, l
    ld   l, [hl]
    ld   h, h
    ld   h, c
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   [hl], e

label_7618E::
    ld   [hl], h

label_7618F::
    jr   nz, label_761F3
    ld   h, l
    ld   h, c
    ld   l, l
    ld   [hl], e

label_76195::
    ld   hl, $FF5E
    jr   nz, label_761F8
    ld   d, e
    ld   h, l
    ld   l, h
    ld   h, l
    ld   h, e
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_761F9
    ld   l, b

label_761A6::
    ld   h, l
    jr   nz, label_761C9
    jr   nz, label_761CB
    ld   c, c
    ld   [hl], h
    ld   h, l
    ld   l, l
    jr   nz, label_76205
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]

label_761B5::
    ld   [hl], e
    jr   nz, label_761D8
    jr   nz, label_761DA
    ld   d, d
    ld   l, c

label_761BC::
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_76207
    ld   l, a
    ld   [hl], d

label_761C3::
    jr   nz, label_7621E

label_761C5::
    ld   l, a
    ld   [hl], l
    ld   e, [hl]

label_761C8::
    ld   d, d

label_761C9::
    ld   h, l
    ld   h, c

label_761CB::
    ld   h, h
    jr   nz, label_76242
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_76235
    ld   l, a
    ld   l, a
    ld   l, e

label_761D6::
    ccf
    jr   nz, label_761F9
    jr   nz, label_761FB
    jr   nz, label_76236
    ld   b, l
    ld   d, e
    jr   nz, label_76201
    ld   c, [hl]

label_761E2::
    ld   c, a
    cp   $5E
    ld   e, c
    ld   l, a

label_761E7::
    ld   [hl], l

label_761E8::
    jr   nz, label_7624D
    ld   h, c
    ld   l, [hl]
    jr   nz, label_76261
    ld   h, l
    ld   l, h
    ld   h, l
    ld   h, e
    ld   [hl], h

label_761F3::
    jr   nz, label_7626E
    ld   l, a
    ld   [hl], l
    ld   [hl], d

label_761F8::
    jr   nz, label_76260
    ld   h, c

label_761FB::
    db   $76 ; Halt
    ld   l, a
    ld   [hl], d
    ld   l, c
    ld   [hl], h
    ld   h, l

label_76201::
    jr   nz, label_76223
    jr   nz, label_7626E

label_76205::
    ld   [hl], h
    ld   h, l

label_76207::
    ld   l, l
    jr   nz, label_76270
    ld   l, a
    ld   [hl], d
    jr   nz, label_76282
    ld   l, b
    ld   h, l
    jr   nz, label_76253
    jr   nz, label_76234
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_7625B
    jr   nz, label_7625D
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h

label_7621E::
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    jr   nz, label_76292

label_76223::
    ld   l, [hl]
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_7627C
    ld   [hl], l
    ld   h, d
    dec  l
    ld   d, e
    ld   h, e
    ld   [hl], d
    ld   h, l
    ld   h, l
    ld   l, [hl]
    ld   l, $20

label_76234::
    ld   d, l

label_76235::
    ld   [hl], e

label_76236::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7629F
    ld   l, c
    ld   h, [hl]
    ld   h, [hl]
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   l, [hl]

label_76242::
    ld   [hl], h
    jr   nz, label_762AE
    ld   [hl], h
    ld   h, l
    ld   l, l
    ld   [hl], e
    inc  l
    jr   nz, label_762C5
    ld   l, a

label_7624D::
    ld   [hl], l
    jr   nz, label_762B3
    ld   h, c
    ld   l, [hl]
    jr   nz, label_76274
    ld   h, [hl]
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_762D2

label_7625B::
    ld   l, c
    ld   [hl], h

label_7625D::
    ld   l, b
    ld   l, a
    ld   [hl], l

label_76260::
    ld   [hl], h

label_76261::
    jr   nz, label_762C4
    jr   nz, label_762D8
    ld   [hl], a
    ld   l, a
    ld   [hl], d
    ld   h, h
    ld   hl, label_2020
    ld   d, h
    ld   [hl], d

label_7626E::
    ld   a, c
    jr   nz, label_762DE
    ld   h, c
    ld   l, [hl]
    ld   a, c

label_76274::
    ld   h, h
    ld   l, c
    ld   h, [hl]
    ld   h, [hl]
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   l, [hl]

label_7627C::
    ld   [hl], h
    jr   nz, label_762F3
    ld   l, b
    ld   l, c
    ld   l, [hl]

label_76282::
    ld   h, a
    ld   [hl], e
    ld   [hl], h
    ld   l, a
    jr   nz, label_762EE
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76304
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_76292::
    jr   nz, label_762B4
    ld   [hl], d
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_76301
    ld   l, a
    ld   [hl], d
    jr   nz, label_76318

label_7629F::
    ld   l, a
    ld   [hl], l
    ld   hl, $FF5E
    jr   nz, label_76304
    ld   b, c
    ld   [hl], l
    ld   [hl], h
    ld   l, a
    jr   nz, label_762F9
    ld   h, c
    ld   [hl], b

label_762AE::
    jr   nz, label_76311
    ld   l, [hl]
    ld   h, h
    jr   nz, label_762D4

label_762B4::
    ld   c, l
    ld   h, l
    ld   l, l
    ld   l, a
    jr   nz, label_76301
    ld   [hl], l
    ld   l, c
    ld   h, h
    ld   h, l
    jr   nz, label_76302
    ld   l, a
    ld   l, a
    ld   l, e
    ld   e, [hl]

label_762C4::
    ld   d, d

label_762C5::
    ld   h, l
    ld   h, c
    ld   h, h
    jr   nz, label_7633E
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_76331
    ld   l, a
    ld   l, a
    ld   l, e

label_762D2::
    ccf
    jr   nz, label_762F5
    jr   nz, label_762F7
    jr   nz, label_76332
    ld   b, l
    ld   d, e
    jr   nz, label_762FD
    ld   c, [hl]

label_762DE::
    ld   c, a
    cp   $5E
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_76349
    ld   h, c
    ld   l, [hl]
    jr   nz, label_7635D
    ld   h, l
    ld   h, l
    jr   nz, label_7634F

label_762EE::
    ld   l, [hl]
    jr   nz, label_7635A
    ld   [hl], e
    ld   l, h

label_762F3::
    ld   h, c
    ld   l, [hl]

label_762F5::
    ld   h, h
    jr   nz, label_76365
    ld   h, c

label_762F9::
    ld   [hl], b
    jr   nz, label_7635E
    ld   a, c

label_762FD::
    jr   nz, label_7631F
    jr   nz, label_76371

label_76301::
    ld   [hl], d

label_76302::
    ld   h, l
    ld   [hl], e

label_76304::
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7637E
    ld   l, b
    ld   h, l
    jr   nz, label_7632E
    jr   nz, label_76330
    ld   d, e

label_76311::
    ld   b, l
    ld   c, h
    ld   b, l
    ld   b, e
    ld   d, h
    jr   nz, label_7635A

label_76318::
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   l, $20

label_7631F::
    jr   nz, label_76375
    ld   l, b
    ld   h, l
    jr   nz, label_76389
    ld   h, c
    ld   [hl], d
    ld   l, e
    jr   nz, label_7639A
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   [hl], e

label_7632E::
    jr   nz, label_76350

label_76330::
    ld   l, a

label_76331::
    ld   h, [hl]

label_76332::
    jr   nz, label_763A8
    ld   l, b
    ld   h, l
    jr   nz, label_763A5
    ld   h, c
    ld   [hl], b
    jr   nz, label_7639D
    ld   [hl], d
    ld   h, l

label_7633E::
    jr   nz, label_76360
    ld   [hl], b
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l
    ld   [hl], e
    jr   nz, label_763C1
    ld   l, a

label_76349::
    ld   [hl], l
    jr   nz, label_763B4
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_7634F::
    jr   nz, label_763BF
    ld   l, a
    ld   [hl], h
    jr   nz, label_763CE
    ld   h, l
    ld   [hl], h
    jr   nz, label_763CF
    ld   l, c

label_7635A::
    ld   [hl], e
    ld   l, c
    ld   [hl], h

label_7635D::
    ld   h, l

label_7635E::
    ld   h, h
    ld   l, $4D
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_763DA
    ld   l, b
    ld   h, l
    jr   nz, label_763CD
    ld   [hl], l
    ld   [hl], d
    ld   [hl], e
    ld   l, a
    ld   [hl], d
    jr   nz, label_763D2

label_76371::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_763E5

label_76375::
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    jr   nz, label_763EF
    ld   l, b
    ld   h, l
    jr   nz, label_763C0
    jr   nz, label_763C3
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    jr   nz, label_763FC
    ld   l, a

label_76389::
    jr   nz, label_763F2
    ld   h, l
    ld   [hl], h
    jr   nz, label_763AF
    jr   nz, label_763FE
    ld   l, a
    ld   [hl], d
    ld   h, l
    jr   nz, label_763FF
    ld   l, [hl]
    ld   h, [hl]
    ld   l, a
    ld   [hl], d

label_7639A::
    ld   l, l
    ld   h, c
    ld   [hl], h

label_7639D::
    ld   l, c
    ld   l, a
    ld   l, [hl]
    ld   h, c
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h

label_763A5::
    jr   nz, label_76408
    ld   l, [hl]

label_763A8::
    jr   nz, label_7640B
    ld   [hl], d
    ld   h, l
    ld   h, c
    inc  l
    jr   nz, label_763D0
    ld   l, a
    ld   [hl], d
    jr   nz, label_76428

label_763B4::
    ld   l, a
    jr   nz, label_76429
    ld   h, l
    ld   [hl], b
    ld   l, h
    ld   h, c
    ld   a, c
    jr   nz, label_76432
    ld   l, b

label_763BF::
    ld   h, l

label_763C0::
    ld   l, l

label_763C1::
    ld   h, l
    ld   [hl], e

label_763C3::
    ld   [hl], e
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_76442
    ld   l, a
    ld   [hl], l
    jr   nz, label_76434

label_763CD::
    ld   l, a

label_763CE::
    ld   [hl], h

label_763CF::
    jr   nz, label_76445
    ld   l, b

label_763D2::
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   l, $2E
    ld   l, $5E
    jr   nz, label_763FB
    ld   b, c
    ld   l, b
    ld   l, b
    ld   l, b
    ld   hl, label_76F48
    ld   [hl], a
    jr   nz, label_76448

label_763E5::
    ld   l, a
    ld   l, [hl]
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]
    ld   l, c
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    ld   hl, label_20FF
    ld   e, [hl]

label_763F2::
    ld   d, e
    ld   h, l
    ld   h, e
    ld   [hl], d
    ld   h, l
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_7644A

label_763FB::
    ld   h, [hl]

label_763FC::
    jr   nz, label_76452

label_763FE::
    ld   l, b

label_763FF::
    ld   h, l
    jr   nz, label_76459
    ld   l, b
    ld   l, c
    ld   [hl], d
    ld   l, h
    ld   l, c
    ld   l, [hl]

label_76408::
    ld   h, a
    jr   nz, label_7644D

label_7640B::
    ld   l, h
    ld   h, c
    ld   h, h
    ld   h, l
    ld   e, [hl]
    ld   d, d
    ld   h, l
    ld   h, c
    ld   h, h
    jr   nz, label_7648A
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_7647D
    ld   l, a
    ld   l, a
    ld   l, e
    ccf
    jr   nz, label_76441
    jr   nz, label_76443
    jr   nz, label_7647E
    ld   b, l
    ld   d, e
    jr   nz, label_76449

label_76429::
    ld   c, [hl]
    ld   c, a
    cp   $5E
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_76489

label_76432::
    ld   l, b
    ld   l, c

label_76434::
    ld   [hl], d
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7645B
    jr   nz, label_7647F
    ld   l, h
    ld   h, c
    ld   h, h
    ld   h, l

label_76441::
    jr   nz, label_764B7

label_76443::
    ld   h, l
    ld   h, e

label_76445::
    ld   l, b
    ld   l, [hl]
    ld   l, c

label_76448::
    ld   [hl], c

label_76449::
    ld   [hl], l

label_7644A::
    ld   h, l
    jr   nz, label_764B5

label_7644D::
    ld   h, c
    ld   [hl], e
    jr   nz, label_764B3
    ld   h, l

label_76452::
    ld   h, l
    ld   l, [hl]
    jr   nz, label_764BE
    ld   h, c
    ld   l, [hl]
    ld   h, h

label_76459::
    ld   h, l
    ld   h, h

label_7645B::
    jr   nz, label_764C1
    ld   l, a
    ld   [hl], a
    ld   l, [hl]
    jr   nz, label_764C8
    ld   [hl], d
    ld   l, a
    ld   l, l
    jr   nz, label_764CE
    ld   h, l
    ld   l, [hl]
    ld   h, l
    ld   [hl], d
    dec  l
    ld   h, c
    ld   [hl], h
    ld   l, c
    ld   l, a
    ld   l, [hl]
    jr   nz, label_764E7
    ld   l, a
    jr   nz, label_764DD
    ld   h, l
    ld   l, [hl]
    ld   h, l
    ld   [hl], d
    dec  l
    jr   nz, label_764DE

label_7647D::
    ld   [hl], h

label_7647E::
    ld   l, c

label_7647F::
    ld   l, a
    ld   l, [hl]
    jr   nz, label_764E5
    ld   a, c
    jr   nz, label_764FA
    ld   l, b
    ld   h, l
    jr   nz, label_764AA

label_7648A::
    jr   nz, label_764AC
    ld   h, [hl]
    ld   h, c
    ld   l, l
    ld   l, c
    ld   l, h
    ld   a, c
    jr   nz, label_76503
    ld   h, [hl]
    jr   nz, label_7650B
    ld   l, b
    ld   h, l
    jr   nz, label_764BB
    jr   nz, label_76505
    ld   h, l
    ld   [hl], d
    ld   l, a
    ld   l, $20
    ld   d, h
    ld   l, a
    jr   nz, label_7651B
    ld   [hl], e
    ld   h, l
    jr   nz, label_76513

label_764AA::
    ld   [hl], h
    inc  l

label_764AC::
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, h
    jr   nz, label_76516
    ld   l, a

label_764B3::
    ld   [hl], a
    ld   l, [hl]

label_764B5::
    jr   nz, label_7652B

label_764B7::
    ld   l, b
    ld   h, l
    jr   nz, label_764DB

label_764BB::
    jr   nz, label_76510
    ld   [hl], a

label_764BE::
    ld   l, a
    ld   [hl], d
    ld   h, h

label_764C1::
    jr   nz, label_76505
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   l, a
    ld   l, [hl]

label_764C8::
    jr   nz, label_7652B
    ld   l, [hl]
    ld   h, h
    ld   h, d
    ld   [hl], l

label_764CE::
    ld   l, c
    ld   l, h
    ld   h, h
    jr   nz, label_76548
    ld   [hl], b
    jr   nz, label_7654F
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_764FB

label_764DB::
    jr   nz, label_7654D

label_764DD::
    ld   l, a

label_764DE::
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   l, $20
    jr   nz, label_7653C

label_764E5::
    ld   l, b
    ld   h, l

label_764E7::
    ld   l, [hl]
    jr   nz, label_76563
    ld   l, a
    ld   [hl], l
    ld   l, b
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_76557
    ld   l, [hl]
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    inc  l
    jr   nz, label_76573

label_764FA::
    ld   l, a

label_764FB::
    ld   [hl], l
    ld   h, e
    ld   h, c
    ld   l, [hl]
    jr   nz, label_76573
    ld   h, l
    ld   l, h

label_76503::
    ld   h, l
    ld   h, c

label_76505::
    ld   [hl], e
    ld   h, l
    jr   nz, label_7657D
    ld   l, b
    ld   h, l

label_7650B::
    jr   nz, label_7654F
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h

label_76510::
    ld   l, a
    ld   l, [hl]
    ld   hl, label_2020
    ld   b, e

label_76516::
    ld   h, c
    ld   l, [hl]
    jr   nz, label_76593
    ld   l, a

label_7651B::
    ld   [hl], l
    ld   l, l
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_76598
    ld   l, b
    ld   l, c
    ld   [hl], e
    ccf
    ld   e, [hl]
    rst  $38
    ld   e, [hl]

label_7652B::
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_76580
    ld   [hl], d
    ld   l, a
    ld   [hl], b
    ld   h, l
    ld   [hl], d
    ld   [hl], h
    ld   l, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_7655B
    jr   nz, label_7658C
    ld   h, [hl]
    jr   nz, label_76597
    ld   h, c
    ld   [hl], d

label_76542::
    ld   [hl], b
    jr   nz, label_7658D
    ld   l, a
    ld   l, h
    ld   h, l

label_76548::
    ld   [hl], e
    ld   e, [hl]
    ld   d, d
    ld   h, l

label_7654C::
    ld   h, c

label_7654D::
    ld   h, h
    jr   nz, label_765C4
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_765B7
    ld   l, a
    ld   l, a

label_76557::
    ld   l, e
    ccf

label_76559::
    jr   nz, label_7657B

label_7655B::
    jr   nz, label_7657D
    jr   nz, label_765B8
    ld   b, l
    ld   d, e
    jr   nz, label_76583

label_76563::
    ld   c, [hl]
    ld   c, a
    cp   $5E
    ld   d, h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_765CF
    ld   [hl], d
    ld   h, l
    jr   nz, label_765E5
    ld   l, a

label_76573::
    ld   l, l
    ld   h, l
    jr   nz, label_765CE
    ld   h, c
    ld   [hl], d
    ld   [hl], b
    jr   nz, label_765C4
    ld   l, a

label_7657D::
    ld   l, h
    ld   h, l
    ld   [hl], e

label_76580::
    jr   nz, label_765F1
    ld   l, [hl]

label_76583::
    jr   nz, label_765A5
    jr   nz, label_765D2
    ld   l, a
    ld   l, b
    ld   l, a
    ld   l, h
    ld   l, c

label_7658C::
    ld   l, [hl]

label_7658D::
    ld   [hl], h
    jr   nz, label_765D9
    ld   [hl], e
    ld   l, h
    ld   h, c

label_76593::
    ld   l, [hl]
    ld   h, h
    ld   l, $59

label_76597::
    ld   l, a

label_76598::
    ld   [hl], l
    jr   nz, label_765FE
    ld   h, c
    ld   l, [hl]
    jr   nz, label_76616
    ld   h, c
    ld   [hl], d
    ld   [hl], b
    jr   nz, label_76618
    ld   l, a

label_765A5::
    jr   nz, label_76608
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76611
    ld   [hl], d
    ld   l, a
    jr   nz, label_76624
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_765D5
    jr   nz, label_7662B

label_765B7::
    ld   l, b

label_765B8::
    ld   h, l
    ld   [hl], e
    ld   h, l
    jr   nz, label_76625
    ld   l, a
    ld   l, h
    ld   h, l
    ld   [hl], e
    ld   l, $20
    jr   nz, label_7660E
    ld   h, [hl]
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_76635
    ld   [hl], l
    ld   l, l
    ld   [hl], b

label_765CE::
    jr   nz, label_76639
    ld   l, [hl]
    ld   [hl], h

label_765D2::
    ld   l, a
    jr   nz, label_765F5

label_765D5::
    jr   nz, label_7664B
    ld   l, b
    ld   h, l

label_765D9::
    jr   nz, label_76632
    ld   h, c
    ld   [hl], d
    ld   [hl], b
    jr   nz, label_76628
    ld   l, a
    ld   l, h
    ld   h, l
    jr   nz, label_76605

label_765E5::
    jr   nz, label_76648
    ld   [hl], h
    jr   nz, label_76661
    ld   l, b
    ld   l, c
    ld   h, e
    ld   l, b
    jr   nz, label_76669
    ld   l, a

label_765F1::
    ld   [hl], l
    jr   nz, label_76614
    jr   nz, label_76616
    ld   h, c
    ld   [hl], d
    ld   [hl], d
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    ld   h, h
    inc  l

label_765FE::
    jr   nz, label_76679
    ld   l, a
    ld   [hl], l
    jr   nz, label_76624
    jr   nz, label_76626
    ld   [hl], a
    ld   l, c

label_76608::
    ld   l, h
    ld   l, h
    jr   nz, label_76673
    ld   l, a
    jr   nz, label_76683
    ld   l, a
    jr   nz, label_76686
    ld   l, b
    ld   h, l

label_76614::
    jr   nz, label_76636

label_76616::
    ld   l, [hl]
    ld   h, l

label_76618::
    ld   a, b
    ld   [hl], h
    jr   nz, label_7668B
    ld   l, [hl]
    ld   h, l
    jr   nz, label_76689
    ld   l, [hl]
    jr   nz, label_76697
    ld   l, b

label_76624::
    ld   h, l

label_76625::
    jr   nz, label_7669A
    ld   h, l

label_76628::
    ld   [hl], c
    ld   [hl], l
    ld   h, l

label_7662B::
    ld   l, [hl]
    ld   h, e
    ld   h, l
    ld   l, $20
    jr   nz, label_7668B

label_76632::
    ld   l, a
    ld   [hl], l
    jr   nz, label_76656

label_76636::
    ld   h, e
    ld   h, c
    ld   l, [hl]

label_76639::
    jr   nz, label_766AA
    ld   l, [hl]
    ld   l, h
    ld   a, c
    jr   nz, label_766B7
    ld   h, c
    ld   [hl], d
    ld   [hl], b
    jr   nz, label_766B9
    ld   l, a
    ld   h, c
    jr   nz, label_766B1
    ld   l, a
    ld   l, h

label_7664B::
    ld   h, l
    jr   nz, label_766C7
    ld   l, a
    ld   [hl], l
    jr   nz, label_766BA
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_766CA
    ld   h, l
    ld   h, l
    ld   l, [hl]
    jr   nz, label_766D3
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_766DA

label_76661::
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_76686
    ld   l, a
    ld   [hl], a
    ld   l, [hl]

label_76669::
    jr   nz, label_766D0
    ld   a, c
    ld   h, l
    ld   [hl], e
    ld   l, $2E
    ld   l, $5E
    rst  $38

label_76673::
    ld   e, [hl]
    ld   b, [hl]
    ld   [hl], l
    ld   l, [hl]
    jr   nz, label_766D0

label_76679::
    ld   l, c
    ld   [hl], h
    ld   l, b
    jr   nz, label_766C0
    ld   l, a
    ld   l, l
    ld   h, d
    ld   [hl], e
    ld   e, [hl]

label_76683::
    ld   d, d
    ld   h, l
    ld   h, c

label_76686::
    ld   h, h
    jr   nz, label_766FD

label_76689::
    ld   l, b
    ld   l, c

label_7668B::
    ld   [hl], e
    jr   nz, label_766F0
    ld   l, a
    ld   l, a
    ld   l, e
    ccf
    jr   nz, label_766B4
    jr   nz, label_766B6
    jr   nz, label_766F1
    ld   b, l
    ld   d, e

label_7669A::
    jr   nz, label_766BC
    ld   c, [hl]
    ld   c, a
    cp   $5E
    ld   b, c
    ld   h, [hl]
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_76720
    ld   l, a
    ld   [hl], l
    jr   nz, label_7671B
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_76710
    ld   b, d
    ld   l, a

label_766B1::
    ld   l, l
    ld   h, d
    jr   nz, label_76719
    ld   l, a

label_766B6::
    ld   [hl], a

label_766B7::
    ld   l, [hl]
    inc  l

label_766B9::
    jr   nz, label_76734
    ld   l, a

label_766BC::
    ld   [hl], l
    jr   nz, label_766DF
    ld   h, e

label_766C0::
    ld   h, c
    ld   l, [hl]
    jr   nz, label_76734
    ld   l, c
    ld   h, e
    ld   l, e

label_766C7::
    jr   nz, label_76732
    ld   [hl], h

label_766CA::
    jr   nz, label_76741
    ld   [hl], b
    jr   nz, label_766EF
    ld   h, d

label_766D0::
    ld   a, c
    jr   nz, label_76743

label_766D3::
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   [hl], e
    ld   l, c
    ld   l, [hl]
    ld   h, a

label_766DA::
    jr   nz, label_76750
    ld   l, b
    ld   h, l
    jr   nz, label_76722
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    jr   nz, label_76748
    ld   h, a
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   l, $20
    jr   nz, label_7670F

label_766EF::
    ld   e, c

label_766F0::
    ld   l, a

label_766F1::
    ld   [hl], l
    jr   nz, label_76757
    ld   h, c
    ld   l, [hl]
    jr   nz, label_7676C
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_7671D

label_766FD::
    jr   nz, label_7671F
    ld   [hl], h
    ld   l, b
    ld   [hl], d
    ld   l, a
    ld   [hl], a
    jr   nz, label_7676F
    ld   [hl], h
    jr   nz, label_7676B
    ld   a, c
    jr   nz, label_7672C
    jr   nz, label_7672E
    jr   nz, label_76780

label_76710::
    ld   [hl], l
    ld   [hl], e
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_7678C
    ld   l, b

label_76719::
    ld   h, l
    jr   nz, label_7673C
    jr   nz, label_7673E
    jr   nz, label_76762

label_76720::
    ld   [hl], l
    ld   [hl], h

label_76722::
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    jr   nz, label_76796
    ld   l, [hl]
    ld   h, l
    jr   nz, label_76798
    ld   l, a

label_7672C::
    ld   [hl], d
    ld   h, l

label_7672E::
    jr   nz, label_767A4
    ld   l, c
    ld   l, l

label_76732::
    ld   h, l
    ld   l, $20
    jr   nz, label_7677B
    ld   l, c
    ld   h, h
    jr   nz, label_767B4
    ld   l, a

label_7673C::
    ld   [hl], l
    jr   nz, label_7675F
    ld   l, e
    ld   l, [hl]

label_76741::
    ld   l, a
    ld   [hl], a

label_76743::
    jr   nz, label_767B9
    ld   l, b
    ld   h, c
    ld   [hl], h

label_76748::
    ccf
    ld   e, [hl]
    rst  $38
    jr   nz, label_7676D
    jr   nz, label_767AD
    ld   b, c

label_76750::
    ld   [hl], h
    ld   l, h
    ld   h, c
    ld   [hl], e
    jr   nz, label_767A5
    ld   h, [hl]

label_76757::
    jr   nz, label_76779
    jr   nz, label_7677B
    ld   c, e
    ld   l, a
    ld   l, b
    ld   l, a

label_7675F::
    ld   l, h
    ld   l, c
    ld   l, [hl]

label_76762::
    ld   [hl], h
    jr   nz, label_767AE
    ld   [hl], e
    ld   l, h
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   e, [hl]

label_7676B::
    ld   e, c

label_7676C::
    ld   l, a

label_7676D::
    ld   [hl], l
    jr   nz, label_767D3
    ld   h, c
    ld   l, [hl]
    jr   nz, label_767E1
    ld   l, a
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_767ED

label_76779::
    ld   l, b
    ld   h, l

label_7677B::
    ld   h, e
    ld   [hl], l
    ld   [hl], d
    ld   [hl], e
    ld   l, a

label_76780::
    ld   [hl], d
    jr   nz, label_767E4
    ld   l, [hl]
    ld   h, h
    jr   nz, label_767F3
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_76801

label_7678C::
    ld   [hl], b
    jr   nz, label_76803
    ld   l, b
    ld   h, l
    jr   nz, label_76801
    ld   h, c
    ld   l, l
    ld   h, l

label_76796::
    jr   nz, label_76807

label_76798::
    ld   h, [hl]
    jr   nz, label_767FC
    ld   [hl], b
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l
    ld   l, $2E
    ld   l, $20

label_767A4::
    jr   nz, label_767EA
    ld   l, a
    jr   nz, label_76822
    ld   l, a
    ld   [hl], l
    ld   [hl], a
    ld   h, c

label_767AD::
    ld   l, [hl]

label_767AE::
    ld   [hl], h
    jr   nz, label_76825
    ld   l, a
    jr   nz, label_76820

label_767B4::
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_7681A

label_767B9::
    ld   [hl], h
    jr   nz, label_76830
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_7682E
    ld   h, c
    ld   [hl], b
    ccf
    jr   nz, label_767E6
    jr   nz, label_767E8
    jr   nz, label_767EA
    jr   nz, label_767EC
    jr   nz, label_767EE
    jr   nz, label_7681C
    ld   l, a
    ld   l, a
    ld   l, e

label_767D3::
    jr   nz, label_76819
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    cp   $20
    ld   e, [hl]
    ld   b, h
    ld   h, c
    ld   [hl], d
    ld   l, e
    jr   nz, label_76835
    ld   h, l
    ld   h, e

label_767E4::
    ld   [hl], d
    ld   h, l

label_767E6::
    ld   [hl], h
    ld   [hl], e

label_767E8::
    jr   nz, label_7680A

label_767EA::
    jr   nz, label_7680C

label_767EC::
    ld   b, c

label_767ED::
    ld   l, [hl]

label_767EE::
    ld   h, h
    jr   nz, label_7683E
    ld   a, c
    ld   [hl], e

label_767F3::
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   h, l
    ld   [hl], e
    jr   nz, label_7681B
    jr   nz, label_7681D
    ld   c, a
    ld   h, [hl]
    jr   nz, label_7684C

label_76801::
    ld   l, a
    ld   l, b

label_76803::
    ld   l, a
    ld   l, h
    ld   l, c
    ld   l, [hl]

label_76807::
    ld   [hl], h
    ld   e, [hl]
    jr   nz, label_7684F
    ld   l, a

label_7680C::
    jr   nz, label_76887
    ld   l, a
    ld   [hl], l
    jr   nz, label_76884
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    jr   nz, label_76839

label_76819::
    jr   nz, label_76892

label_7681B::
    ld   h, c

label_7681C::
    ld   l, [hl]

label_7681D::
    ld   [hl], h
    jr   nz, label_76894

label_76820::
    ld   l, a
    jr   nz, label_76895
    ld   h, l
    ld   h, c

label_76825::
    ld   h, h
    jr   nz, label_76891
    ld   [hl], h
    ccf
    jr   nz, label_7684C
    jr   nz, label_7684E

label_7682E::
    ld   e, c
    ld   b, l

label_76830::
    ld   d, e
    jr   nz, label_76853
    ld   c, [hl]
    ld   c, a

label_76835::
    cp   $47
    ld   h, c
    ld   [hl], e

label_76839::
    ld   [hl], b
    ld   hl, label_75720
    ld   l, b

label_7683E::
    ld   h, c
    dec  l
    ld   d, a
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    ld   hl, label_2E20
    ld   l, $2E

label_7684F::
    jr   nz, label_7687F
    ld   l, $2E

label_76853::
    jr   nz, label_76875
    jr   nz, label_768B0

label_76857::
    ld   l, a
    ld   [hl], l
    jr   nz, label_768BE
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_768D3
    ld   h, l
    ld   h, c
    ld   h, h
    jr   nz, label_76886
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_768DF
    ld   l, c
    ld   l, [hl]
    ld   a, c
    jr   nz, label_768E0
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_76896
    ld   [hl], a
    ld   l, c
    ld   [hl], h
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_768F3

label_7687F::
    ld   l, b
    ld   h, l
    jr   nz, label_768E4
    ld   l, c

label_76884::
    ld   h, h
    jr   nz, label_768F6

label_76887::
    ld   h, [hl]
    jr   nz, label_768EB
    jr   nz, label_768F9
    ld   h, c
    ld   h, a
    ld   l, [hl]
    ld   l, c
    ld   h, [hl]

label_76891::
    ld   a, c

label_76892::
    ld   l, c
    ld   l, [hl]

label_76894::
    ld   h, a

label_76895::
    jr   nz, label_768FE
    ld   l, h
    ld   h, c
    ld   [hl], e
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    ld   l, $2E
    ld   l, $6D
    ld   a, c
    jr   nz, label_7690D
    ld   [hl], d
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_768DE

label_768B0::
    ld   l, $2E
    ld   [hl], h
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_76925
    ld   h, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_768DF
    ld   l, $2E
    ld   l, $6D
    ld   a, c
    jr   nz, label_7692D
    ld   [hl], d
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   l, $2E
    ld   l, $74
    ld   l, b

label_768D3::
    ld   h, l
    jr   nz, label_7693E
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    ld   l, $2E
    ld   l, $20

label_768DE::
    jr   nz, label_7690E

label_768E0::
    ld   l, $2E
    ld   [hl], h
    ld   h, c

label_768E4::
    ld   l, e
    ld   h, l
    jr   nz, label_76955
    ld   h, l
    ld   l, $2E

label_768EB::
    ld   l, $20
    jr   nz, label_7691D
    ld   l, $2E
    ld   [hl], h
    ld   l, b

label_768F3::
    ld   h, l
    jr   nz, label_7695E

label_768F6::
    ld   l, a
    ld   [hl], l
    ld   [hl], e

label_768F9::
    ld   h, l
    ld   l, $2E
    ld   l, $20

label_768FE::
    ld   l, $2E
    ld   l, $61
    ld   [hl], h
    jr   nz, label_76979
    ld   l, b
    ld   h, l
    jr   nz, label_7696B
    ld   h, c
    ld   a, c
    ld   l, $2E

label_7690D::
    ld   l, $FF
    ld   l, $2E
    ld   l, $4E
    dec  l
    ld   c, [hl]
    dec  l
    ld   c, [hl]
    ld   l, a
    ld   hl, label_2E2E
    ld   l, $20

label_7691D::
    jr   nz, label_7693F
    ld   l, $2E
    ld   l, $4E
    dec  l
    ld   l, [hl]

label_76925::
    ld   l, a
    ld   [hl], h
    jr   nz, label_7699D
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l

label_7692D::
    ld   hl, label_20FF
    jr   nz, label_76952
    ld   l, $2E
    ld   l, $48
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_2E2E
    ld   l, $20

label_7693E::
    jr   nz, label_76960
    jr   nz, label_76962
    ld   l, $2E
    ld   l, $65
    ld   l, [hl]
    ld   [hl], h

label_76948::
    ld   h, l
    ld   [hl], d
    ld   l, $2E
    ld   l, $20
    jr   nz, label_76970
    ld   l, $2E

label_76952::
    ld   l, $6D
    ld   a, c

label_76955::
    jr   nz, label_769BF
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    jr   nz, label_7698F
    ld   l, $2E
    ld   c, [hl]
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    ld   h, c
    ld   l, h
    ld   h, a
    ld   l, c

label_7696B::
    ld   h, c
    ld   l, $2E
    ld   l, $20

label_76970::
    ld   l, $2E
    ld   l, $75
    ld   l, [hl]
    ld   h, e
    ld   l, b
    ld   h, c
    ld   l, [hl]

label_76979::
    ld   h, a
    ld   h, l
    ld   h, h
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $62
    ld   l, a
    ld   l, a
    jr   nz, label_769F0
    ld   l, a
    ld   l, a
    ld   l, $2E
    ld   l, $FF
    jr   nz, label_769B0
    ld   l, $2E
    ld   l, $45
    ld   l, [hl]
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    ld   l, $2E
    ld   l, $20

label_7699D::
    jr   nz, label_769BF
    ld   l, $2E
    ld   l, $63
    ld   h, l
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   a, c
    ld   l, $2E
    ld   l, $20
    jr   nz, label_769D0

label_769B0::
    ld   l, $2E
    ld   l, $74
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_76A26
    ld   h, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_769EE
    ld   l, $2E
    ld   l, l
    ld   a, c
    jr   nz, label_76A2D
    ld   [hl], d
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   l, $2E

label_769D0::
    ld   l, $54
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_76A51
    ld   l, a
    ld   [hl], l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_76A0E
    ld   l, $2E
    ld   h, c
    jr   nz, label_76A4F
    ld   h, c
    ld   [hl], d
    ld   l, $2E
    ld   l, $20
    jr   nz, label_76A0D
    jr   nz, label_76A1D
    ld   l, $2E
    ld   l, c
    ld   l, [hl]
    jr   nz, label_76A62
    ld   a, c
    jr   nz, label_76A60
    ld   l, a
    ld   l, l
    ld   h, l
    ld   l, $2E
    ld   l, $2E
    ld   l, $2E
    ld   l, h
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_76A70
    ld   l, [hl]
    ld   [hl], e
    ld   l, c
    ld   h, h
    ld   h, l
    ld   l, $2E

label_76A0E::
    ld   l, $2E
    ld   l, $62
    ld   a, c
    ld   h, l
    ld   l, $2E
    ld   l, $62
    ld   a, c
    ld   h, l
    ld   l, $2E
    ld   l, $FF
    ld   d, d
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76A86
    ld   l, [hl]

label_76A26::
    ld   h, h
    jr   nz, label_76A9B
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h

label_76A2D::
    inc  l
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_76AA3
    ld   h, c
    ld   [hl], e
    ld   [hl], e
    ld   h, c
    ld   h, a
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   [hl], e
    jr   nz, label_76AAE
    ld   h, [hl]
    jr   nz, label_76AB6
    ld   l, b
    ld   h, l
    jr   nz, label_76A8B
    ld   h, a
    ld   h, a
    ld   l, $2E

label_76A4A::
    ld   l, $20
    jr   nz, label_76A6E
    ld   a, [$FF00+C]
    ld   a, [$FF00+C]
    ld   a, [$FF20]
    di
    jr   nz, label_76A4A
    jr   nz, label_76A49
    jr   nz, label_76A4D
    jr   nz, label_76A4D
    jr   nz, label_76A9E
    ccf

label_76A60::
    jr   nz, label_76A82

label_76A62::
    ld   l, $2E
    ld   l, $48
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    inc  l
    jr   nz, label_76AE3
    ld   l, b

label_76A70::
    ld   l, c
    ld   [hl], e
    jr   nz, label_76AD6
    ld   l, a
    ld   l, a
    ld   l, e
    jr   nz, label_76AEB
    ld   h, l
    ld   h, l
    ld   l, e
    ld   [hl], e
    jr   nz, label_76AEE
    ld   h, [hl]
    jr   nz, label_76AF5

label_76A82::
    ld   h, l
    ld   h, e
    ld   [hl], d
    ld   h, l

label_76A86::
    ld   [hl], h
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    ld   d, d
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76AF4
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76B09
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h

label_76A9B::
    inc  l
    ld   [hl], h
    ld   l, b

label_76A9E::
    ld   h, l
    jr   nz, label_76B11
    ld   h, c
    ld   [hl], e

label_76AA3::
    ld   [hl], e
    ld   h, c
    ld   h, a
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   [hl], e
    jr   nz, label_76B1C
    ld   h, [hl]

label_76AAE::
    jr   nz, label_76B24
    ld   l, b

label_76AB1::
    ld   h, l
    jr   nz, label_76AF9
    ld   h, a

label_76AB5::
    ld   h, a

label_76AB6::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_76ADC

label_76ABC::
    di
    jr   nz, label_76AAF
    jr   nz, label_76AB1
    jr   nz, label_76AB6
    jr   nz, label_76AB5
    jr   nz, label_76AB7
    jr   nz, label_76ABC
    jr   nz, label_76ABB
    jr   nz, label_76B0C
    ccf
    jr   nz, label_76AF0
    ld   l, $2E
    ld   l, $48
    ld   l, l
    ld   l, l

label_76AD6::
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    inc  l
    jr   nz, label_76B51
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_76B44
    ld   l, a

label_76AE3::
    ld   l, a
    ld   l, e
    jr   nz, label_76B59
    ld   h, l
    ld   h, l
    ld   l, e
    ld   [hl], e

label_76AEB::
    jr   nz, label_76B5C
    ld   h, [hl]

label_76AEE::
    jr   nz, label_76B63

label_76AF0::
    ld   h, l
    ld   h, e
    ld   [hl], d
    ld   h, l

label_76AF4::
    ld   [hl], h

label_76AF5::
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    ld   d, d
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76B62
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76B77
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h

label_76B09::
    inc  l
    ld   [hl], h
    ld   l, b

label_76B0C::
    ld   h, l
    jr   nz, label_76B7F
    ld   h, c
    ld   [hl], e

label_76B11::
    ld   [hl], e
    ld   h, c
    ld   h, a
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   [hl], e
    jr   nz, label_76B8A
    ld   h, [hl]

label_76B1C::
    jr   nz, label_76B92
    ld   l, b
    ld   h, l
    jr   nz, label_76B67
    ld   h, a
    ld   h, a

label_76B24::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_76B4A

label_76B2A::
    ld   a, [$FF00+C]
    ld   a, [$FF20]
    di
    jr   nz, label_76B21
    jr   nz, label_76B25
    jr   nz, label_76B25
    jr   nz, label_76B2A
    jr   nz, label_76B29
    jr   nz, label_76B7A
    ccf
    jr   nz, label_76B5E
    ld   l, $2E
    ld   l, $48
    ld   l, l
    ld   l, l

label_76B44::
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    inc  l
    jr   nz, label_76BBF
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_76BB2
    ld   l, a

label_76B51::
    ld   l, a
    ld   l, e
    jr   nz, label_76BC7
    ld   h, l
    ld   h, l
    ld   l, e
    ld   [hl], e

label_76B59::
    jr   nz, label_76BCA
    ld   h, [hl]

label_76B5C::
    jr   nz, label_76BD1

label_76B5E::
    ld   h, l
    ld   h, e
    ld   [hl], d
    ld   h, l

label_76B62::
    ld   [hl], h

label_76B63::
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    ld   d, d
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76BD0
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76BE5
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h

label_76B77::
    inc  l
    ld   [hl], h
    ld   l, b

label_76B7A::
    ld   h, l
    jr   nz, label_76BED
    ld   h, c
    ld   [hl], e

label_76B7F::
    ld   [hl], e
    ld   h, c
    ld   h, a
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   a, c
    ld   [hl], e
    jr   nz, label_76BF8
    ld   h, [hl]

label_76B8A::
    jr   nz, label_76C00
    ld   l, b
    ld   h, l

label_76B8E::
    jr   nz, label_76BD5

label_76B90::
    ld   h, a

label_76B91::
    ld   h, a

label_76B92::
    ld   l, $2E
    ld   l, $20
    jr   nz, label_76BB8
    di
    jr   nz, label_76B8E
    jr   nz, label_76B90
    jr   nz, label_76B92
    jr   nz, label_76B91
    jr   nz, label_76B93
    jr   nz, label_76B95
    jr   nz, label_76B97
    jr   nz, label_76BE8
    ccf
    jr   nz, label_76BCC
    ld   l, $2E
    ld   l, $48
    ld   l, l
    ld   l, l

label_76BB2::
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    inc  l
    jr   nz, label_76C2D
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_76C20
    ld   l, a

label_76BBF::
    ld   l, a
    ld   l, e
    jr   nz, label_76C35
    ld   h, l
    ld   h, l
    ld   l, e
    ld   [hl], e

label_76BC7::
    jr   nz, label_76C38
    ld   h, [hl]

label_76BCA::
    jr   nz, label_76C3F

label_76BCC::
    ld   h, l
    ld   h, e
    ld   [hl], d
    ld   h, l

label_76BD0::
    ld   [hl], h

label_76BD1::
    ld   [hl], e
    ld   l, $2E
    ld   l, $FF
    ld   l, $2E
    ld   l, $59
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_76C4D
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   hl, label_74920
    jr   nz, label_76C5D
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   h, a

label_76BED::
    ld   l, b
    ld   [hl], h
    jr   nz, label_76C6A
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   h, h
    jr   nz, label_76C65
    ld   h, l

label_76BF8::
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    jr   nz, label_76C60
    ld   l, a
    ld   l, l
    ld   h, l

label_76C00::
    jr   nz, label_76C64
    ld   h, c
    ld   h, e
    ld   l, e
    ld   hl, label_2EFF
    ld   l, $2E
    ld   b, l
    ld   b, l
    ld   b, l
    ld   c, e
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    ld   l, b
    ld   [hl], l
    ld   [hl], d
    ld   [hl], h
    ld   hl, label_2020
    ld   b, c
    ld   [hl], d

label_76C20::
    ld   [hl], d
    ld   [hl], d
    ld   h, a
    ld   l, b
    ld   hl, label_2020
    ld   b, h
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_76C90
    ld   h, l
    jr   nz, label_76CA4
    ld   l, a
    jr   nz, label_76C54
    jr   nz, label_76C56
    jr   nz, label_76CAA

label_76C38::
    ld   h, l
    ld   h, e
    ld   l, e
    ld   l, h
    ld   h, l
    ld   [hl], e
    ld   [hl], e

label_76C3F::
    ld   hl, label_23FF
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   hl, label_75920
    ld   l, a
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d

label_76C4D::
    ld   h, l
    jr   nz, label_76C70
    jr   nz, label_76CB4
    ld   h, c
    ld   h, e

label_76C54::
    ld   l, e

label_76C55::
    ld   hl, label_2020
    ld   b, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_76CD6

label_76C5D::
    ld   l, a
    ld   [hl], l
    jr   nz, label_76C81
    ld   l, b
    ld   [hl], l
    ld   [hl], d

label_76C64::
    ld   [hl], h

label_76C65::
    ccf
    rst  $38
    ld   l, $2E
    ld   l, $59
    ld   l, a
    ld   [hl], l
    jr   nz, label_76CD8
    ld   h, h

label_76C70::
    ld   l, c
    ld   l, a
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_76CC1
    jr   nz, label_76CEE
    ld   l, a
    ld   l, h
    ld   h, h
    jr   nz, label_76CF8
    ld   l, a
    ld   [hl], l

label_76C81::
    jr   nz, label_76CF7
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_76CFF
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_76CF6
    ld   h, c
    ld   [hl], b

label_76C90::
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    ld   l, $2E
    ld   l, $20
    ld   b, l
    ld   l, b
    ccf
    ld   hl, label_2020
    ld   d, a
    ld   l, b
    ld   h, c
    ld   [hl], h
    ccf
    jr   nz, label_76CC4

label_76CA4::
    ld   c, c
    jr   nz, label_76CC7
    ld   h, h
    ld   l, c
    ld   h, h

label_76CAA::
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_76D22
    ld   h, c
    ld   a, c
    jr   nz, label_76D14
    ld   l, [hl]

label_76CB4::
    ld   a, c
    dec  l
    jr   nz, label_76D2C
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    inc  l
    jr   nz, label_76D31
    ld   h, l
    ld   h, c

label_76CC1::
    ld   l, h
    ld   l, h
    ld   a, c

label_76CC4::
    ld   hl, label_748FF

label_76CC7::
    ld   h, l
    ld   a, c
    jr   nz, label_76D2D
    ld   [hl], l
    ld   h, h
    ld   h, h
    ld   a, c
    ld   hl, label_2020
    ld   c, c
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_76CD6::
    ld   [hl], e
    ld   h, l

label_76CD8::
    ld   [hl], d
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   hl, label_2020
    ld   e, c
    ld   h, l
    ld   h, c
    ld   l, b
    inc  l
    jr   nz, label_76D59
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    jr   nz, label_76D61

label_76CEE::
    ld   h, l
    ld   [hl], d
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   hl, label_75921

label_76CF7::
    ld   h, l

label_76CF8::
    ld   h, c
    ld   l, b
    inc  l
    jr   nz, label_76D66
    ld   [hl], h
    jr   nz, label_76D69
    ld   [hl], e
    ld   hl, label_2020
    jr   nz, label_76D26
    ld   d, h
    ld   l, b
    ld   h, l
    jr   nz, label_76D58
    ld   l, a
    ld   h, d
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   [hl], e
    jr   nz, label_76D76
    ld   h, c

label_76D14::
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, a
    jr   nz, label_76D8E
    ld   l, b
    ld   h, l
    jr   nz, label_76D94
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c

label_76D22::
    ld   h, a
    ld   h, l
    ld   hl, label_75920
    ld   h, l
    ld   h, c
    ld   l, b
    inc  l
    jr   nz, label_76DA1

label_76D2D::
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   e, [hl]

label_76D31::
    ld   [hl], e
    jr   nz, label_76D54
    jr   nz, label_76D56
    ld   [hl], d
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   hl, label_2020
    ld   b, c
    jr   nz, label_76DB8
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    jr   nz, label_76DAE
    ld   h, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_76DBB
    ld   h, [hl]
    jr   nz, label_76D9C
    ld   l, a
    ld   h, d
    ld   l, h
    ld   l, c
    ld   l, [hl]

label_76D54::
    ld   [hl], e
    ld   hl, label_76854

label_76D58::
    ld   h, l

label_76D59::
    ld   l, [hl]
    ld   l, $2E
    ld   l, $20
    ld   c, c
    ld   [hl], h
    ld   e, [hl]

label_76D61::
    ld   [hl], e
    jr   nz, label_76DCA
    ld   l, a
    ld   [hl], d

label_76D66::
    ld   [hl], d
    ld   h, l
    ld   h, c

label_76D69::
    ld   l, h
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, l
    ld   a, c
    jr   nz, label_76DD4
    ld   l, h
    ld   l, h
    jr   nz, label_76DEE
    ld   h, l
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_76DF0
    ld   l, a
    jr   nz, label_76DF3
    ld   l, b
    ld   h, l
    jr   nz, label_76DA3
    jr   nz, label_76DA5
    jr   nz, label_76DEF
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_76DEA
    ld   h, l
    ld   h, c
    ld   l, b

label_76D94::
    inc  l
    jr   nz, label_76E0B
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_76E04

label_76D9C::
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    inc  l

label_76DA1::
    jr   nz, label_76E04

label_76DA3::
    ld   l, [hl]
    ld   h, h

label_76DA5::
    jr   nz, label_76E1B
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_76E20
    ld   l, b
    ld   h, l

label_76DAE::
    ld   a, c
    jr   nz, label_76E15
    ld   l, c
    ld   h, h
    jr   nz, label_76DD5
    jr   nz, label_76E2A
    ld   l, a

label_76DB8::
    ld   l, l
    ld   h, l
    ld   [hl], h

label_76DBB::
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_76E22
    ld   [hl], h
    jr   nz, label_76E06
    ld   l, a
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    ld   e, [hl]

label_76DCA::
    ld   [hl], e
    jr   nz, label_76E35
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    ld   hl, label_2021

label_76DD4::
    jr   nz, label_76DF6
    ld   c, c
    ld   [hl], h
    jr   nz, label_76E51
    ld   h, c
    ld   [hl], e
    jr   nz, label_76E3F
    jr   nz, label_76E52
    ld   h, l
    ld   h, c
    ld   l, h
    ld   l, h
    ld   a, c
    jr   nz, label_76E49
    ld   h, c
    ld   h, h
    jr   nz, label_76E5E
    ld   h, e
    ld   h, l
    ld   l, [hl]

label_76DEE::
    ld   h, l

label_76DEF::
    inc  l

label_76DF0::
    jr   nz, label_76E69
    ld   l, c

label_76DF3::
    ld   [hl], h
    ld   l, b
    jr   nz, label_76E6B
    ld   l, b
    ld   h, l
    jr   nz, label_76E48
    dec  l
    ld   l, l
    dec  l
    ld   l, l
    ld   l, a
    ld   h, d
    ld   l, h
    ld   l, c
    ld   l, [hl]

label_76E04::
    ld   [hl], e
    ld   hl, label_76F53
    inc  l
    jr   nz, label_76E54

label_76E0B::
    jr   nz, label_76E7A
    ld   h, l
    ld   h, c
    ld   l, [hl]
    inc  l
    jr   nz, label_76E74
    ld   l, b
    ld   l, b

label_76E15::
    ld   hl, label_2E2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E

label_76E20::
    ld   l, $20

label_76E22::
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20

label_76E2A::
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   c, c
    ld   [hl], h
    jr   nz, label_76EA7
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_76EA2
    ld   h, l
    jr   nz, label_76E63
    jr   nz, label_76E65
    jr   nz, label_76EAD
    ld   h, c

label_76E48::
    ld   [hl], e

label_76E49::
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    jr   nz, label_76EC2
    ld   l, a

label_76E4F::
    jr   nz, label_76EB7

label_76E51::
    ld   l, c

label_76E52::
    ld   l, [hl]
    ld   h, h

label_76E54::
    jr   nz, label_76E76
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_76EC1
    ld   l, a
    ld   [hl], d
    jr   nz, label_76ED8
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   [hl], e

label_76E63::
    ld   h, l
    ld   l, h

label_76E65::
    ld   h, [hl]
    ld   [hl], a
    ld   l, b
    ld   h, c

label_76E69::
    ld   [hl], h
    jr   nz, label_76ED4
    ld   h, c
    ld   [hl], b
    ld   [hl], b
    ld   h, l
    ld   l, [hl]
    ld   h, l
    ld   h, h
    ld   hl, label_749FF

label_76E76::
    jr   nz, label_76EDE
    ld   l, a
    ld   [hl], l

label_76E7A::
    ld   l, [hl]
    ld   h, h
    jr   nz, label_76EDF
    jr   nz, label_76EE7
    ld   l, a
    ld   l, a
    ld   h, h
    jr   nz, label_76EA5
    ld   l, c
    ld   [hl], h
    ld   h, l
    ld   l, l
    jr   nz, label_76F02
    ld   h, c
    ld   [hl], e
    ld   l, b
    ld   h, l
    ld   h, h
    jr   nz, label_76F07
    ld   [hl], b
    jr   nz, label_76EB5
    ld   l, a
    ld   l, [hl]
    jr   nz, label_76F0D
    ld   l, b
    ld   h, l
    jr   nz, label_76EFF
    ld   h, l
    ld   h, c
    ld   h, e
    ld   l, b
    ld   l, $2E
    ld   l, $20

label_76EA5::
    ld   c, c
    ld   e, [hl]

label_76EA7::
    ld   l, h
    ld   l, h
    jr   nz, label_76F1F
    ld   [hl], d
    ld   h, c

label_76EAD::
    ld   h, h
    ld   h, l
    jr   nz, label_76F1A
    ld   [hl], h
    jr   nz, label_76F28
    ld   l, a

label_76EB5::
    ld   a, c
    ld   l, a

label_76EB7::
    ld   [hl], l
    jr   nz, label_76F20
    ld   l, a
    ld   [hl], d
    jr   nz, label_76F35
    ld   l, b
    ld   h, c
    ld   [hl], h

label_76EC1::
    jr   nz, label_76F3C
    ld   l, a
    ld   [hl], l
    ld   l, b
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_76F34
    ld   l, [hl]
    jr   nz, label_76F47
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_76F15
    jr   nz, label_76EF5
    ld   b, d
    ld   [hl], l
    ld   [hl], h

label_76ED8::
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   l, $2E
    ld   l, $20

label_76EDF::
    jr   nz, label_76F01
    jr   nz, label_76F03
    jr   nz, label_76F05
    jr   nz, label_76F07

label_76EE7::
    jr   nz, label_76F09
    ld   c, a
    ld   l, e
    ld   h, c
    ld   a, c
    jr   nz, label_76F3D
    ld   l, a
    cp   $4F
    ld   l, e
    ld   h, c
    ld   a, c

label_76EF5::
    inc  l
    jr   nz, label_76F64
    ld   h, l
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_76F62
    ld   l, a

label_76EFF::
    jr   nz, label_76F21

label_76F01::
    ld   l, c

label_76F02::
    ld   [hl], h

label_76F03::
    ld   hl, label_2020
    ld   d, a

label_76F07::
    ld   l, b
    ld   h, l

label_76F09::
    ld   l, [hl]
    jr   nz, label_76F85
    ld   l, a

label_76F0D::
    ld   [hl], l
    jr   nz, label_76F30
    jr   nz, label_76F76
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]

label_76F15::
    ld   [hl], h
    jr   nz, label_76F8F
    ld   h, c
    ld   l, [hl]

label_76F1A::
    ld   [hl], h
    jr   nz, label_76F91
    ld   l, b
    ld   h, l

label_76F1F::
    jr   nz, label_76F41

label_76F21::
    ld   b, d
    ld   l, a
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], d
    ld   h, c

label_76F28::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_76F8D
    ld   l, [hl]
    ld   a, c
    jr   nz, label_76F50

label_76F30::
    jr   nz, label_76F9F
    ld   l, a
    ld   [hl], d

label_76F34::
    ld   h, l

label_76F35::
    inc  l
    jr   nz, label_76F9B
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_76F9F

label_76F3D::
    ld   h, c
    ld   h, e
    ld   l, e
    ld   hl, label_74FFF
    ld   l, b
    inc  l
    jr   nz, label_76FC0

label_76F47::
    ld   h, l

label_76F48::
    ld   h, c
    ld   l, b
    inc  l
    jr   nz, label_76FC2
    ld   l, b
    ld   l, $2E

label_76F50::
    ld   l, $20
    ld   l, a

label_76F53::
    ld   l, e
    ld   h, c
    ld   a, c
    inc  l
    jr   nz, label_76FD0

label_76F59::
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   l, $FF

label_76F62::
    ld   e, c
    ld   l, a

label_76F64::
    ld   [hl], l
    jr   nz, label_76FCE
    ld   l, a
    ld   [hl], h
    jr   nz, label_76FDF
    ld   l, b
    ld   h, l
    jr   nz, label_76F8F
    jr   nz, label_76F91
    jr   nz, label_76FB5
    ld   l, a
    ld   l, a
    ld   l, l

label_76F76::
    ld   h, l
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_76FE6
    ld   l, [hl]
    jr   nz, label_76FA0
    jr   nz, label_76FA2
    ld   h, l
    ld   a, b
    ld   h, e

label_76F85::
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   h, l
    jr   nz, label_76FF2
    ld   l, a

label_76F8D::
    ld   [hl], d
    jr   nz, label_77004
    ld   l, b

label_76F91::
    ld   h, l
    ld   l, c
    ld   [hl], h
    ld   h, l
    ld   l, l
    jr   nz, label_77011
    ld   l, a
    ld   [hl], l
    jr   nz, label_77004
    ld   h, c
    ld   h, h
    ld   l, $FF

label_76FA0::
    ld   b, a
    ld   l, c

label_76FA2::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_77013
    ld   h, l
    jr   nz, label_7700B
    ld   h, c
    ld   h, e
    ld   l, e
    jr   nz, label_77022
    ld   l, b
    ld   h, l
    ld   b, d
    ld   l, a
    ld   l, a
    ld   l, l
    ld   h, l

label_76FB5::
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, a
    inc  l
    jr   nz, label_77005
    jr   nz, label_77020
    ld   h, l
    ld   h, a

label_76FC0::
    ld   a, c
    ld   l, a

label_76FC2::
    ld   [hl], l
    ld   hl, label_74920
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_7703D
    ld   h, l
    ld   [hl], h
    ld   [hl], l

label_76FCE::
    ld   [hl], d
    ld   l, [hl]

label_76FD0::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_7703E
    ld   [hl], h
    ld   h, l
    ld   l, l
    jr   nz, label_77053
    ld   l, a
    ld   [hl], l
    jr   nz, label_76FFE
    jr   nz, label_77000
    ld   h, a
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_7705A

label_76FE6::
    ld   l, a
    jr   nz, label_77056
    ld   h, l
    ld   hl, label_2020
    jr   nz, label_7700F
    jr   nz, label_77011
    jr   nz, label_77013
    jr   nz, label_77044
    ld   l, e
    ld   h, c
    ld   a, c
    jr   nz, label_77048
    ld   l, a
    ld   [hl], h
    jr   nz, label_7704C

label_76FFE::
    ld   l, a
    ld   [hl], a

label_77000::
    cp   $54
    ld   l, b
    ld   h, l

label_77004::
    jr   nz, label_7706F
    ld   [hl], h
    ld   h, l
    ld   l, l
    jr   nz, label_7706E

label_7700B::
    ld   h, c
    ld   l, l
    ld   h, l
    jr   nz, label_77030
    jr   nz, label_77074
    ld   h, c

label_77013::
    ld   h, e
    ld   l, e
    jr   nz, label_7708B
    ld   l, a
    jr   nz, label_77093
    ld   l, a
    ld   [hl], l
    ld   l, $20
    ld   e, c
    ld   l, a

label_77020::
    ld   [hl], l
    ld   [hl], d

label_77022::
    ld   h, l
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   l, [hl]
    ld   h, l
    ld   h, h
    jr   nz, label_7709F
    ld   l, b
    ld   h, l
    jr   nz, label_7704F
    jr   nz, label_77051
    ld   b, d
    ld   l, a
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, a
    ld   l, $FF
    ld   b, c

label_7703D::
    ld   l, b

label_7703E::
    ld   l, $2E
    ld   l, $20
    ld   b, h
    ld   l, a

label_77044::
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_770B0
    ld   l, c
    db   $76 ; Halt
    ld   h, l

label_7704C::
    ld   l, l
    ld   h, l
    jr   nz, label_770C4
    ld   l, b

label_77051::
    ld   h, c
    ld   [hl], h

label_77053::
    jr   nz, label_770BE
    ld   [hl], h

label_77056::
    ld   h, l
    ld   l, l
    ld   l, $2E

label_7705A::
    ld   l, $20
    ld   c, b
    ld   l, a
    ld   [hl], a
    jr   nz, label_770C2
    ld   h, d
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_770DA
    ld   l, a
    ld   l, l
    ld   h, l
    dec  l
    jr   nz, label_770E1
    ld   l, b

label_7706E::
    ld   l, c

label_7706F::
    ld   l, [hl]
    ld   h, a
    jr   nz, label_770D8
    ld   l, h

label_77074::
    ld   [hl], e
    ld   h, l
    ccf
    rst  $38
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_76159
    inc  l

label_7708B::
    jr   nz, label_770F6
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_770E7
    ld   l, h

label_77093::
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_76F59
    ld   [hl], l
    jr   nz, label_77105
    ld   h, c
    db   $76 ; Halt

label_7709F::
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_770C5
    jr   nz, label_770C7
    jr   nz, label_7710F
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_77123
    ld   l, b

label_770B0::
    ld   h, l
    jr   nz, label_770E8
    jr   nz, label_770D5
    jr   nz, label_770D7
    jr   nz, label_77100
    ld   l, a
    ld   l, h
    ld   h, h
    ld   h, l
    ld   l, [hl]

label_770BE::
    jr   nz, label_7710C
    ld   h, l
    ld   h, c

label_770C2::
    db   $76 ; Halt
    ld   h, l

label_770C4::
    ld   [hl], e

label_770C5::
    ccf
    jr   nz, label_770E8
    ld   c, e
    ld   h, l
    ld   h, l
    ld   [hl], b
    jr   nz, label_7712F
    ld   l, [hl]
    jr   nz, label_77136
    ld   a, c
    ld   h, l
    jr   nz, label_77144

label_770D5::
    ld   l, [hl]
    jr   nz, label_770F8

label_770D8::
    ld   [hl], h
    ld   l, b

label_770DA::
    ld   h, l
    jr   nz, label_7714C
    ld   l, [hl]
    ld   h, l
    ld   [hl], e
    jr   nz, label_7715B
    ld   l, a
    ld   [hl], l
    jr   nz, label_77106
    jr   nz, label_77108

label_770E8::
    ld   l, b
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, $20
    ld   d, e
    ld   l, a
    ld   l, l
    ld   h, l
    ld   l, a
    ld   l, [hl]
    ld   h, l
    jr   nz, label_77117
    jr   nz, label_77166
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_77173
    ld   [hl], d

label_77100::
    ld   a, c
    jr   nz, label_77164
    ld   l, [hl]
    ld   h, h

label_77105::
    jr   nz, label_77127
    jr   nz, label_7717D
    ld   h, c
    ld   l, e
    ld   h, l

label_7710C::
    jr   nz, label_7716C
    ld   h, l

label_7710F::
    ld   l, l
    ld   hl, label_74220
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d

label_77123::
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a

label_77127::
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a

label_7712F::
    ld   hl, label_76159
    inc  l
    jr   nz, label_7719E
    ld   [hl], h

label_77136::
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_7718F
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_76F59
    ld   [hl], l
    jr   nz, label_771AD
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_7716D
    jr   nz, label_7716F
    jr   nz, label_771B7
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_771CB
    ld   l, b
    ld   h, l
    jr   nz, label_77190

label_7715B::
    jr   nz, label_7717D
    jr   nz, label_7717F
    jr   nz, label_771A8
    ld   l, a
    ld   l, h
    ld   h, h

label_77164::
    ld   h, l
    ld   l, [hl]

label_77166::
    jr   nz, label_771B4
    ld   h, l
    ld   h, c
    db   $76 ; Halt
    ld   h, l

label_7716C::
    ld   [hl], e

label_7716D::
    ccf
    jr   nz, label_77190
    ld   d, h
    ld   [hl], d
    ld   a, c

label_77173::
    jr   nz, label_771D7
    ld   l, a
    ld   l, l
    ld   h, d
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_771F0

label_7717D::
    ld   [hl], l
    ld   [hl], e

label_7717F::
    dec  l
    ld   [hl], b
    ld   l, c
    ld   h, e
    ld   l, c
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    jr   nz, label_771F9
    ld   l, h
    ld   h, c
    ld   h, e
    ld   h, l
    ld   [hl], e
    ld   l, $20

label_77190::
    ld   c, b
    ld   l, a
    ld   [hl], b
    ld   h, l
    jr   nz, label_7720A
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_77203
    ld   h, l
    ld   l, h
    ld   [hl], b

label_7719E::
    ld   [hl], e
    ld   l, $42
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    jr   nz, label_771C8

label_771A8::
    jr   nz, label_771CA
    jr   nz, label_771CC
    jr   nz, label_771CE
    jr   nz, label_771D0
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e

label_771B4::
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_76159

label_771CA::
    inc  l

label_771CB::
    jr   nz, label_77236
    ld   [hl], h

label_771CE::
    ld   e, [hl]
    ld   [hl], e

label_771D0::
    jr   nz, label_77227
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c

label_771D7::
    ld   hl, label_76F59
    ld   [hl], l
    jr   nz, label_77245
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_77205
    jr   nz, label_77207
    jr   nz, label_7724F
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   h, h
    jr   nz, label_77263
    ld   l, b

label_771F0::
    ld   h, l
    jr   nz, label_77228
    jr   nz, label_77215
    jr   nz, label_77217
    jr   nz, label_77240

label_771F9::
    ld   l, a
    ld   l, h
    ld   h, h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_7724C
    ld   h, l
    ld   h, c
    db   $76 ; Halt

label_77203::
    ld   h, l
    ld   [hl], e

label_77205::
    ccf
    jr   nz, label_77228
    ld   b, a
    ld   l, a

label_7720A::
    jr   nz, label_7727F
    ld   h, e
    ld   h, c
    ld   [hl], d
    ld   h, l
    jr   nz, label_77286
    ld   l, b
    ld   h, c
    ld   [hl], h

label_77215::
    jr   nz, label_77237

label_77217::
    jr   nz, label_7727C
    ld   [hl], d
    ld   l, a
    ld   [hl], a
    jr   nz, label_77280
    ld   a, c
    jr   nz, label_77295
    ld   l, b
    ld   h, l
    jr   nz, label_77245
    jr   nz, label_77247

label_77227::
    jr   nz, label_7728C
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_77291
    ld   l, [hl]
    ld   h, h
    jr   nz, label_772A7
    ld   h, l
    ld   h, l

label_77236::
    jr   nz, label_77258
    ld   l, c
    ld   h, [hl]
    jr   nz, label_772B0
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_772A9

label_77241::
    ld   h, l
    ld   l, h
    ld   [hl], b
    ld   [hl], e

label_77245::
    ld   hl, label_2020
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    jr   nz, label_77270
    jr   nz, label_77272
    jr   nz, label_77274
    jr   nz, label_77276
    jr   nz, label_77278

label_77258::
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   d, h
    ld   l, b

label_77263::
    ld   h, l
    jr   nz, label_772BA
    ld   [hl], d
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   l, h
    ld   [hl], e
    jr   nz, label_772DD
    ld   h, [hl]
    jr   nz, label_77294
    inc  hl

label_77272::
    inc  hl
    inc  hl

label_77274::
    inc  hl
    ld   e, [hl]

label_77276::
    jr   nz, label_772BC

label_77278::
    ld   l, a
    jr   nz, label_772F4
    ld   l, a

label_7727C::
    ld   [hl], l
    jr   nz, label_7729F

label_7727F::
    jr   nz, label_772F8
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_772FA

label_77286::
    ld   l, a
    jr   nz, label_772F5
    ld   l, a
    ld   l, a
    ld   l, e

label_7728C::
    jr   nz, label_772EF
    ld   [hl], h
    jr   nz, label_7730A

label_77291::
    ld   l, a
    ld   [hl], l
    ld   [hl], d

label_77294::
    jr   nz, label_772F7
    ld   l, h
    ld   h, d
    ld   [hl], l
    ld   l, l
    ccf
    jr   nz, label_772BD
    jr   nz, label_772BF

label_7729F::
    jr   nz, label_772C1
    jr   nz, label_772C3
    jr   nz, label_772F1
    ld   l, a
    ld   l, a

label_772A7::
    ld   l, e
    jr   nz, label_772EE
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    cp   $57

label_772B0::
    ld   l, b
    ld   l, c
    ld   h, e
    ld   l, b
    jr   nz, label_77326
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l

label_772BA::
    ld   [hl], d
    ld   h, l

label_772BC::
    jr   nz, label_772DE
    jr   nz, label_77337
    ld   l, a

label_772C1::
    ld   [hl], l
    ld   l, h

label_772C3::
    ld   h, h
    jr   nz, label_7733F
    ld   l, a
    ld   [hl], l
    jr   nz, label_77336

label_772CA::
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_772EF
    ld   [hl], h
    ld   l, a
    jr   nz, label_77346
    ld   h, l
    ld   h, l
    ccf
    jr   nz, label_7732D
    ld   [hl], e
    ld   h, l
    jr   nz, label_772CA
    jr   nz, label_77352

label_772DE::
    ld   l, a
    ld   [hl], e
    ld   h, l
    ld   l, h
    ld   h, l
    ld   h, e
    ld   [hl], h
    inc  l
    jr   nz, label_7735C
    ld   l, b
    ld   h, l
    ld   l, [hl]
    jr   nz, label_7730D
    jr   nz, label_7730F

label_772EF::
    ld   [hl], b
    ld   [hl], d

label_772F1::
    ld   h, l
    ld   [hl], e
    ld   [hl], e

label_772F4::
    jr   nz, label_7736A
    ld   l, b

label_772F7::
    ld   h, l

label_772F8::
    jr   nz, label_7733B

label_772FA::
    jr   nz, label_7731C
    jr   nz, label_7731E
    jr   nz, label_77342
    ld   [hl], l
    ld   [hl], h
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   hl, label_759FF
    ld   l, a
    ld   [hl], l

label_7730A::
    jr   nz, label_7736D
    ld   [hl], d

label_7730D::
    ld   h, l
    jr   nz, label_7737E
    ld   h, l
    ld   h, c
    ld   [hl], d
    jr   nz, label_77389
    ld   l, b
    ld   h, l
    ld   b, l
    ld   h, c
    ld   h, a
    ld   l, h
    ld   h, l

label_7731C::
    ld   e, [hl]
    ld   [hl], e

label_7731E::
    jr   nz, label_77374
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   l, $20

label_77326::
    jr   nz, label_7736A
    ld   h, l
    ld   [hl], a
    ld   h, c
    ld   [hl], d
    ld   h, l

label_7732D::
    jr   nz, label_7739E
    ld   h, [hl]
    jr   nz, label_773A6
    ld   l, b
    ld   h, l
    jr   nz, label_77356

label_77336::
    jr   nz, label_7739A
    ld   l, c
    ld   [hl], d
    ld   h, h

label_7733B::
    ld   hl, label_748FF
    ld   l, c

label_7733F::
    inc  l
    jr   nz, label_77365

label_77342::
    inc  hl
    inc  hl
    inc  hl
    inc  hl

label_77346::
    ld   l, $20
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_7736D
    ld   l, e
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_7739C
    jr   nz, label_773C1
    ld   l, a

label_77356::
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_773CE
    ld   l, a
    jr   nz, label_7737D
    ld   [hl], h
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_773D3
    ld   l, c
    ld   h, e

label_77365::
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   [hl], e

label_7736A::
    ld   l, $20
    jr   nz, label_773C5
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    ld   l, [hl]
    ld   e, [hl]

label_77374::
    ld   [hl], h
    jr   nz, label_773EB
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_7739C
    jr   nz, label_773ED

label_7737E::
    ld   l, h
    ld   h, h
    jr   nz, label_773E5
    ld   h, c
    ld   [hl], e
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_773F6

label_77389::
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_773EF
    jr   nz, label_773F7
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   [hl], h
    jr   nz, label_77406
    ld   l, b
    ld   l, a
    ld   [hl], h
    ld   l, a

label_7739A::
    ccf
    rst  $38

label_7739C::
    ld   c, b
    ld   [hl], l

label_7739E::
    ld   l, [hl]
    ld   l, b
    ccf
    jr   nz, label_773C3
    ld   b, c
    jr   nz, label_77411

label_773A6::
    ld   h, l
    ld   a, c
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ccf
    jr   nz, label_773D3
    ld   c, c
    ld   [hl], h
    jr   nz, label_7742A
    ld   h, c
    ld   a, c
    ld   [hl], e
    inc  l
    jr   nz, label_7741B
    ld   d, h
    ld   h, c
    ld   l, h
    ld   h, l

label_773C1::
    jr   nz, label_7740E

label_773C3::
    ld   h, l
    ld   a, c

label_773C5::
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    ld   e, [hl]
    rst  $38
    ld   c, b
    ld   [hl], l
    ld   l, [hl]

label_773CE::
    ld   l, b
    ccf
    jr   nz, label_773F2
    ld   b, c

label_773D3::
    jr   nz, label_77440
    ld   h, l
    ld   a, c
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ccf
    jr   nz, label_77402
    ld   c, c
    ld   [hl], h
    jr   nz, label_77459
    ld   h, c
    ld   a, c
    ld   [hl], e
    inc  l
    jr   nz, label_7744A
    ld   d, e

label_773ED::
    ld   l, h
    ld   l, c

label_773EF::
    ld   l, l
    ld   h, l
    jr   nz, label_7743E
    ld   h, l
    ld   a, c
    ld   l, b

label_773F6::
    ld   l, a

label_773F7::
    ld   l, h
    ld   h, l
    ld   e, [hl]
    rst  $38
    ld   c, b
    ld   [hl], l
    ld   l, [hl]
    ld   l, b
    ccf
    jr   nz, label_77422

label_77402::
    ld   b, c
    jr   nz, label_77470
    ld   h, l

label_77406::
    ld   a, c
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    ld   l, b
    ld   h, l
    ld   [hl], d

label_7740E::
    ld   h, l
    ccf
    jr   nz, label_77432
    ld   c, c
    ld   [hl], h
    jr   nz, label_77489
    ld   h, c
    ld   a, c
    ld   [hl], e
    inc  l
    jr   nz, label_7747A
    ld   b, c
    ld   l, [hl]
    ld   h, a
    ld   l, h
    ld   h, l
    ld   [hl], d

label_77422::
    jr   nz, label_7746F
    ld   h, l
    ld   a, c
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l

label_7742A::
    ld   e, [hl]
    rst  $38
    ld   c, b
    ld   [hl], l
    ld   l, [hl]
    ld   l, b
    ccf
    jr   nz, label_77453
    ld   b, c
    jr   nz, label_774A1
    ld   h, l
    ld   a, c
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    ld   l, b
    ld   h, l

label_7743E::
    ld   [hl], d
    ld   h, l

label_77440::
    ccf
    jr   nz, label_77463
    ld   c, c
    ld   [hl], h
    jr   nz, label_774BA
    ld   h, c
    ld   a, c
    ld   [hl], e

label_7744A::
    inc  l
    jr   nz, label_774AB
    ld   b, d
    ld   l, c
    ld   [hl], d
    ld   h, h
    jr   nz, label_7749E

label_77453::
    ld   h, l
    ld   a, c
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l

label_77459::
    ld   e, [hl]
    rst  $38
    ld   c, b
    ld   [hl], l
    ld   l, [hl]
    ld   l, b
    ccf
    jr   nz, label_77482
    ld   b, c

label_77463::
    jr   nz, label_774D0
    ld   h, l
    ld   a, c
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l

label_7746F::
    ccf

label_77470::
    jr   nz, label_77492
    ld   c, c
    ld   [hl], h
    jr   nz, label_774E9
    ld   h, c
    ld   a, c
    ld   [hl], e
    inc  l

label_7747A::
    jr   nz, label_774DA
    ld   b, [hl]
    ld   h, c
    ld   h, e
    ld   h, l
    jr   nz, label_774CD

label_77482::
    ld   h, l
    ld   a, c
    ld   l, b
    ld   l, a
    ld   l, h
    ld   h, l
    ld   e, [hl]

label_77489::
    rst  $38
    ld   d, e
    ld   l, a
    ld   l, l
    ld   h, l
    ld   h, d
    ld   l, a
    ld   h, h
    ld   a, c

label_77492::
    inc  l
    jr   nz, label_774DD
    ld   b, l
    ld   c, h
    ld   d, b
    ld   hl, label_748FF
    ld   h, l
    ld   a, c
    ld   hl, label_2020
    inc  hl

label_774A1::
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   hl, label_2020
    jr   nz, label_774CA
    ld   d, e

label_774AB::
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_7751D
    ld   l, a
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], h
    ld   h, l
    ld   [hl], d
    ld   [hl], e
    jr   nz, label_774D9
    jr   nz, label_7752B
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_7752C
    ld   h, l
    jr   nz, label_77537
    ld   [hl], b
    jr   nz, label_7752D
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_75720
    ld   l, b
    ld   h, c

label_774CD::
    ld   [hl], h
    jr   nz, label_77543

label_774D0::
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_77520
    jr   nz, label_774F9

label_774D9::
    jr   nz, label_7753F
    ld   l, a
    ccf

label_774DD::
    ld   hl, label_2020
    ld   c, c
    ld   e, [hl]
    ld   l, l
    jr   nz, label_77546
    ld   h, [hl]
    ld   [hl], d
    ld   h, c
    ld   l, c

label_774E9::
    ld   h, h
    ld   l, a
    ld   h, [hl]
    jr   nz, label_77556
    ld   h, l
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   [hl], e
    ld   hl, rNR42
    ld   e, c
    ld   l, a

label_774F9::
    ld   [hl], a
    ld   hl, label_2020
    ld   d, h
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_7757A
    ld   h, c
    ld   [hl], e
    jr   nz, label_77568
    ld   [hl], e
    ld   [hl], l
    ld   [hl], d
    ld   [hl], b
    ld   [hl], d
    ld   l, c
    ld   [hl], e
    ld   h, l
    ld   hl, label_2320
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  l
    ld   [hl], h
    ld   l, b
    ld   h, c
    ld   l, [hl]
    ld   l, e
    jr   nz, label_77597
    ld   l, a
    ld   [hl], l

label_77520::
    ld   hl, label_2EFF
    ld   l, $2E
    jr   nz, label_77555
    ld   l, $2E
    jr   nz, label_77559

label_7752B::
    ld   l, $2E

label_7752D::
    jr   nz, label_7755D
    ld   l, $2E
    jr   nz, label_77561
    ld   l, $2E
    jr   nz, label_77565

label_77537::
    ld   l, $2E
    jr   nz, label_77569
    ld   l, $2E
    jr   nz, label_7756D

label_7753F::
    ld   l, $2E
    jr   nz, label_77596

label_77543::
    ld   h, c
    ld   a, c
    ld   l, $2E
    ld   l, $20
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   l, $2E
    ld   l, $20
    rst  $38
    ld   d, l
    ld   l, b

label_77555::
    ld   l, b

label_77556::
    ld   l, $2E
    ld   l, $20
    ld   c, c
    jr   nz, label_775C1

label_7755D::
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h

label_77561::
    jr   nz, label_77583
    ld   l, e
    ld   l, [hl]

label_77565::
    ld   l, a
    ld   [hl], a
    jr   nz, label_775D1

label_77569::
    ld   l, a
    ld   [hl], a
    jr   nz, label_775E1

label_7756D::
    ld   l, a
    jr   nz, label_775E3
    ld   h, c
    ld   a, c
    jr   nz, label_775E8
    ld   l, b
    ld   l, c
    ld   [hl], e
    ld   l, $2E
    ld   l, $20
    ld   h, d
    ld   [hl], l
    ld   [hl], h
    ld   l, $2E
    ld   l, $FF
    ld   c, b

label_77583::
    ld   [hl], l
    ld   l, [hl]
    ld   l, b
    ccf
    ld   hl, label_2020
    ld   d, h
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    ccf
    ccf
    ld   hl, label_2E2E
    ld   l, $20

label_77596::
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   l, $2E
    ld   l, $20
    ld   d, l
    ld   l, b
    ld   l, $2E
    ld   l, $20
    ld   c, [hl]
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    ld   [hl], d
    ld   l, l
    ld   l, c
    ld   l, [hl]
    ld   h, h
    inc  l
    ld   c, c
    ld   l, $2E
    ld   l, $20
    ld   c, c
    jr   nz, label_77621
    ld   l, a
    ld   [hl], h
    ld   [hl], h
    ld   h, c
    jr   nz, label_77627
    ld   l, a

label_775C1::
    ld   hl, label_74DFF
    ld   b, c
    ld   b, c
    ld   b, c
    ld   b, c
    ld   b, c
    ld   b, c
    ld   b, c
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]
    ld   c, [hl]

label_775D1::
    ld   hl, rNR42
    ld   c, [hl]
    ld   l, a
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77656
    ld   h, l
    ld   [hl], h
    ccf
    ld   hl, label_74920

label_775E3::
    jr   nz, label_7764C
    ld   [hl], d
    ld   l, a
    ld   [hl], a

label_775E8::
    jr   nz, label_7765E
    ld   l, c
    ld   [hl], d
    ld   h, l
    ld   h, h
    jr   nz, label_7765F
    ld   h, [hl]
    jr   nz, label_77613
    jr   nz, label_7766C
    ld   h, c
    ld   l, c
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   l, $20
    ld   c, c
    jr   nz, label_77677
    ld   h, c
    ld   l, [hl]
    ld   [hl], h
    jr   nz, label_77679
    ld   l, b
    ld   l, a
    ld   [hl], e
    ld   h, l
    jr   nz, label_77652
    ld   l, a
    ld   l, h
    ld   h, h
    ld   h, l
    ld   l, [hl]
    jr   nz, label_77632
    jr   nz, label_77634
    ld   c, h
    ld   h, l
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    ld   [hl], e
    jr   nz, label_77680
    ld   h, l
    ld   l, h
    ld   l, c
    db   $76 ; Halt
    ld   h, l

label_77621::
    ld   [hl], d
    ld   h, l
    ld   h, h
    ld   [hl], e
    ld   l, a
    ld   l, a

label_77627::
    ld   l, [hl]
    ld   hl, label_2020
    jr   nz, label_7764D
    jr   nz, label_7764F
    jr   nz, label_77651
    jr   nz, label_77653
    jr   nz, label_77678
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_776A9
    ld   l, c
    ld   l, e
    ld   h, l
    jr   nz, label_77662
    jr   nz, label_77664
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_776AE
    ld   h, l
    ld   [hl], e

label_7764C::
    ld   h, l

label_7764D::
    ld   [hl], d
    db   $76 ; Halt

label_7764F::
    ld   h, l
    ld   [hl], e

label_77651::
    jr   nz, label_776B4

label_77653::
    jr   nz, label_776C5
    ld   l, b

label_77656::
    ld   l, a
    ld   [hl], h
    ld   l, a
    inc  l
    jr   nz, label_776C0
    ld   l, a
    ld   l, [hl]

label_7765E::
    ld   e, [hl]

label_7765F::
    ld   [hl], h
    jr   nz, label_776DB

label_77662::
    ld   l, a
    ld   [hl], l

label_77664::
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   l, e
    ccf
    rst  $38
    ld   c, b

label_7766C::
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_776BE
    ld   h, c
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    jr   nz, label_776D8

label_77677::
    ld   l, [hl]

label_77678::
    ld   h, h

label_77679::
    jr   nz, label_7769B
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    inc  hl

label_77680::
    ld   hl, label_74120
    ld   [hl], d
    ld   h, l
    jr   nz, label_77700
    ld   l, a
    ld   [hl], l
    jr   nz, label_776AB
    ld   [hl], h
    ld   h, c
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77703
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ccf

label_7769B::
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_77713
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_7771B
    ld   h, c
    ld   l, e

label_776A9::
    ld   h, l
    jr   nz, label_7771C
    ld   l, c
    ld   h, e

label_776AE::
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    jr   nz, label_77724
    ld   h, [hl]
    jr   nz, label_776D8
    jr   nz, label_776DA
    jr   nz, label_77721
    db   $76 ; Halt
    ld   h, l

label_776BE::
    ld   [hl], d
    ld   a, c

label_776C0::
    ld   l, a
    ld   l, [hl]
    ld   h, l
    inc  l
    jr   nz, label_776E6
    jr   nz, label_776E8
    jr   nz, label_776EA
    jr   nz, label_77735
    ld   l, [hl]
    ld   h, e
    ld   l, h
    ld   [hl], l
    ld   h, h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77743
    ld   h, l
    ld   l, $FF
    ld   c, c

label_776DA::
    jr   nz, label_77751
    ld   [hl], e
    ld   h, l
    jr   nz, label_77754
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_77759
    ld   l, a

label_776E6::
    jr   nz, label_77708

label_776E8::
    jr   nz, label_7775E

label_776EA::
    ld   h, c
    ld   l, e
    ld   h, l
    jr   nz, label_7775F
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l
    ld   [hl], d
    ld   h, l
    ld   [hl], e
    ld   l, $20
    jr   nz, label_7773B
    ld   [hl], d
    ld   h, l
    jr   nz, label_77777
    ld   l, a
    ld   [hl], l

label_77700::
    jr   nz, label_77774
    ld   h, l

label_77703::
    ld   h, c
    ld   h, h
    ld   a, c
    ccf
    jr   nz, label_77729
    ld   d, e
    ld   h, c
    ld   a, c
    jr   nz, label_7776C
    ld   l, l
    ld   [hl], l
    ld   [hl], e
    ld   l, b
    ld   [hl], d

label_77713::
    ld   l, a
    ld   l, a
    ld   l, l
    ld   hl, $FF5E
    ld   c, a
    ld   c, e

label_7771B::
    inc  l

label_7771C::
    jr   nz, label_77767
    ld   e, [hl]
    ld   l, l
    jr   nz, label_77786
    ld   l, a
    ld   l, [hl]

label_77724::
    ld   h, l
    ld   l, $20
    jr   nz, label_77749

label_77729::
    ld   c, c
    ld   e, [hl]
    ld   l, h
    ld   l, h
    jr   nz, label_77796
    ld   l, a
    jr   nz, label_7779A
    ld   l, a
    ld   l, l
    ld   h, l

label_77735::
    jr   nz, label_77757
    jr   nz, label_77759
    ld   l, [hl]
    ld   l, a

label_7773B::
    ld   [hl], a
    ld   l, $FF
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c

label_77743::
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d

label_77749::
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_76854
    ld   l, c

label_77751::
    ld   [hl], e
    jr   nz, label_777BD

label_77754::
    ld   [hl], e
    jr   nz, label_777AC

label_77757::
    ld   l, h
    ld   [hl], d

label_77759::
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_74F20

label_7775F::
    ld   l, b
    inc  l
    jr   nz, label_777AC
    jr   nz, label_777CD
    ld   h, l
    ld   h, c

label_77767::
    ld   [hl], d
    ld   h, h
    jr   nz, label_777D1
    ld   [hl], d

label_7776C::
    ld   l, a
    ld   l, l
    ld   h, a
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, h
    ld   l, l

label_77774::
    ld   h, c
    jr   nz, label_777EB

label_77777::
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_7779C
    jr   nz, label_7779E
    ld   [hl], h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_777EE
    ld   [hl], e

label_77786::
    jr   nz, label_777FB
    ld   l, a
    ld   l, l
    ld   h, l
    dec  l
    jr   nz, label_777AE
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_777FD
    ld   l, c

label_77796::
    ld   h, h
    ld   h, h
    ld   h, l
    ld   l, [hl]

label_7779A::
    jr   nz, label_777BC

label_7779C::
    jr   nz, label_777BE

label_7779E::
    ld   h, d
    ld   h, l
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_7781A
    ld   l, b
    ld   h, l
    jr   nz, label_77810
    ld   h, c
    ld   l, h

label_777AC::
    ld   l, h
    ld   [hl], e

label_777AE::
    ld   l, c
    ld   l, [hl]
    jr   nz, label_77826
    ld   l, b
    ld   h, l
    jr   nz, label_7780A
    ld   h, c
    ld   l, h
    jr   nz, label_7780E
    ld   h, c
    ld   l, h

label_777BC::
    jr   nz, label_777DE

label_777BE::
    ld   c, l
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   [hl], e
    ld   l, $20
    jr   nz, label_7780F
    ld   l, a
    ld   h, l

label_777CD::
    ld   [hl], e
    ld   [hl], h
    ld   l, b
    ld   h, c

label_777D1::
    ld   [hl], h
    jr   nz, label_7783C
    ld   h, l
    ld   l, h
    ld   [hl], b
    ccf
    jr   nz, label_777FA
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_74C43
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c

label_777EB::
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_76C55
    ld   [hl], d
    ld   l, c

label_777FA::
    ld   [hl], d

label_777FB::
    ld   h, c
    jr   nz, label_77866
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_77860
    ld   h, l
    ld   [hl], e
    inc  l

label_7780A::
    jr   nz, label_77883
    ld   l, b
    ld   h, l

label_7780E::
    ld   l, [hl]

label_7780F::
    jr   nz, label_7785A
    jr   nz, label_7788A
    ld   h, c
    ld   [hl], e
    jr   nz, label_77881
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h

label_7781A::
    jr   nz, label_7787D
    jr   nz, label_7788A
    ld   h, c
    ld   h, h
    inc  l
    jr   nz, label_7786C
    jr   nz, label_77845
    jr   nz, label_77899
    ld   h, l
    ld   h, e
    ld   h, c
    ld   l, h
    ld   l, h
    jr   nz, label_778A1
    ld   h, l
    ld   h, l
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77896
    jr   nz, label_7789F
    ld   l, c
    ld   h, a
    ld   l, b
    jr   nz, label_778B0

label_7783C::
    ld   l, a
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    jr   nz, label_778AB
    ld   l, [hl]
    jr   nz, label_77865

label_77845::
    jr   nz, label_778BB
    ld   l, b
    ld   h, l
    jr   nz, label_778B8
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   l, [hl]
    ld   [hl], e
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_778CE
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h

label_77860::
    jr   nz, label_778C9
    ld   l, a
    jr   nz, label_77885

label_77865::
    jr   nz, label_778DB
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   hl, label_2020
    ld   c, c
    ld   [hl], e
    jr   nz, label_778E6
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_778DF
    ld   h, l
    ld   l, h
    ld   [hl], b
    ld   h, [hl]
    ld   [hl], l
    ld   l, h

label_7787D::
    jr   nz, label_778E5
    ld   l, a
    ld   [hl], d

label_77881::
    jr   nz, label_778FC

label_77883::
    ld   l, a
    ld   [hl], l

label_77885::
    ccf
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_74320
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d

label_77896::
    ld   d, d
    ld   c, c
    ld   c, [hl]

label_77899::
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d

label_7789F::
    ld   c, c
    ld   c, [hl]

label_778A1::
    ld   b, a
    ld   hl, label_76548
    ld   l, h
    ld   l, h
    ld   l, a
    inc  l
    jr   nz, label_7791F

label_778AB::
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_77919

label_778B0::
    ld   [hl], e
    jr   nz, label_778D3
    ld   d, l
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d

label_778B8::
    ld   h, c
    jr   nz, label_7792E

label_778BB::
    ld   [hl], b
    ld   h, l
    ld   h, c
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   hl, label_2323
    inc  hl
    inc  hl
    inc  hl
    inc  l

label_778C9::
    jr   nz, label_77934
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e

label_778CE::
    jr   nz, label_77944
    ld   l, c
    ld   l, l
    ld   h, l

label_778D3::
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    jr   nz, label_77951
    ld   l, a
    ld   [hl], l
    jr   nz, label_77950
    ld   l, a
    jr   nz, label_77945

label_778DF::
    ld   h, c
    ld   h, e
    ld   h, l
    jr   nz, label_77958
    ld   l, b

label_778E5::
    ld   h, l

label_778E6::
    jr   nz, label_7792D
    ld   h, a
    ld   h, a
    jr   nz, label_7795B
    ld   l, [hl]
    jr   nz, label_7793C
    ld   [hl], h
    ld   l, $20
    jr   nz, label_77948
    ld   h, c
    ld   l, l
    ld   h, c
    ld   [hl], d
    ld   h, c
    ld   l, [hl]
    ld   h, e
    ld   l, b

label_778FC::
    ld   hl, label_2020
    ld   b, d
    ld   h, l
    jr   nz, label_77923
    ld   h, e
    ld   h, c
    ld   [hl], d
    ld   h, l
    ld   h, [hl]
    ld   [hl], l
    ld   l, h
    inc  l
    jr   nz, label_77930
    inc  hl
    inc  hl
    inc  hl
    inc  hl
    ld   hl, label_74220
    ld   a, c
    ld   h, l
    ld   hl, label_2020

label_77919::
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d

label_77923::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d

label_7792D::
    ld   c, c

label_7792E::
    ld   c, [hl]
    ld   b, a

label_77930::
    ld   hl, label_76854
    ld   l, c

label_77934::
    ld   [hl], e
    jr   nz, label_779A0
    ld   [hl], e
    jr   nz, label_7798F
    ld   l, h
    ld   [hl], d

label_7793C::
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_75920
    ld   l, a
    ld   [hl], l

label_77944::
    ld   e, [hl]

label_77945::
    ld   [hl], d
    ld   h, l
    jr   nz, label_779B5
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_779B7
    ld   l, [hl]
    jr   nz, label_77971

label_77951::
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_7799B
    ld   h, a
    ld   h, a

label_77958::
    ccf
    jr   nz, label_7797B

label_7795B::
    ld   c, b
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, l
    ld   l, $4E
    ld   l, a
    jr   nz, label_779D8
    ld   l, c
    ld   [hl], d
    inc  l
    jr   nz, label_779B3
    jr   nz, label_779CF
    ld   h, c
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_779DA
    ld   h, l
    ld   l, h
    ld   [hl], b
    jr   nz, label_779F0
    ld   l, a
    ld   [hl], l
    jr   nz, label_779EA

label_7797B::
    ld   l, [hl]
    jr   nz, label_779F2
    ld   l, b
    ld   h, c
    ld   [hl], h
    ld   l, a
    ld   l, [hl]
    ld   h, l
    ld   l, $20
    jr   nz, label_779D0
    ld   l, a
    ld   [hl], a
    jr   nz, label_779ED
    ld   h, d
    ld   l, a
    ld   [hl], l

label_7798F::
    ld   [hl], h
    jr   nz, label_77A06
    ld   l, b
    ld   h, l
    jr   nz, label_77A02
    ld   l, c
    ld   h, d
    ld   [hl], d
    ld   h, c
    ld   [hl], d

label_7799B::
    ld   a, c
    ccf
    jr   nz, label_779BF
    jr   nz, label_779C1
    ld   b, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_77A0E
    ld   h, l
    ld   a, c
    inc  l
    jr   nz, label_77A0F
    ld   l, a
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_779D1
    ld   [hl], e
    ld   [hl], h

label_779B3::
    ld   l, a
    ld   [hl], b

label_779B5::
    jr   nz, label_77A1A

label_779B7::
    ld   h, c
    ld   l, h
    ld   l, h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77A2C

label_779BF::
    ld   h, l
    jr   nz, label_77A24
    ld   h, l
    ld   h, e
    ld   h, c
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    jr   nz, label_77A13
    jr   nz, label_77A30
    ld   l, c
    ld   h, h
    ld   l, [hl]

label_779CF::
    ld   e, [hl]

label_779D0::
    ld   [hl], h

label_779D1::
    ld   l, e
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_77A46
    ld   l, [hl]

label_779D8::
    ld   h, l
    jr   nz, label_77A47
    ld   l, c
    ld   [hl], h
    ld   [hl], h
    ld   l, h
    ld   h, l
    jr   nz, label_77A43
    ld   l, [hl]
    ld   [hl], e
    ld   [hl], a
    ld   h, l
    ld   [hl], d
    ld   hl, label_2020

label_779EA::
    ld   b, e
    ld   c, h
    ld   c, c

label_779ED::
    ld   b, e
    ld   c, e
    ld   hl, $FF5E

label_779F2::
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_76C55
    ld   [hl], d
    ld   l, c

label_77A06::
    ld   [hl], d
    ld   h, c
    jr   nz, label_77A6B
    ld   [hl], h
    jr   nz, label_77A86
    ld   l, a

label_77A0E::
    ld   [hl], l

label_77A0F::
    ld   [hl], d
    jr   nz, label_77A32
    ld   [hl], e

label_77A13::
    ld   h, l
    ld   [hl], d
    db   $76 ; Halt
    ld   l, c
    ld   h, e
    ld   h, l
    ld   hl, label_2020
    ld   c, a
    ld   l, b
    ccf
    jr   nz, label_77A41
    jr   nz, label_77A7C
    ld   l, a

label_77A24::
    ld   [hl], l
    jr   nz, label_77A9A
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h

label_77A2C::
    jr   nz, label_77AA2
    ld   h, c
    ld   l, e

label_77A30::
    ld   h, l
    jr   nz, label_77A75
    ld   l, a
    ld   [hl], a
    ld   d, a
    ld   l, a
    ld   [hl], a
    jr   nz, label_77AA2
    ld   l, a
    ld   l, l
    ld   h, l
    jr   nz, label_77AAD
    ld   l, a
    ld   [hl], a

label_77A41::
    inc  l
    ld   c, l

label_77A43::
    ld   h, c
    ld   h, h
    ld   h, c

label_77A46::
    ld   l, l

label_77A47::
    jr   nz, label_77A96
    ld   h, l
    ld   l, a
    ld   [hl], a
    ld   c, l
    ld   h, l
    ld   l, a
    ld   [hl], a
    jr   nz, label_77A72
    ld   [hl], a
    ld   l, a
    ld   [hl], l
    ld   l, h
    ld   h, h
    jr   nz, label_77ABA
    ld   [hl], b
    ld   [hl], b
    ld   [hl], d
    ld   h, l
    ld   h, e
    ld   l, c
    ld   h, c
    ld   [hl], h
    ld   h, l
    ld   l, c
    ld   [hl], h
    ld   hl, label_74220
    ld   a, c
    ld   h, l
    ld   hl, label_74320
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d

label_77A75::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_76559
    ld   h, c

label_77A86::
    ld   l, b
    inc  l
    jr   nz, label_77AFE
    ld   l, b
    ld   l, c
    ld   [hl], e
    jr   nz, label_77AF8
    ld   [hl], e
    jr   nz, label_77AB2
    jr   nz, label_77AE9
    ld   l, h
    ld   [hl], d

label_77A96::
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_2020
    ld   e, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_77B02
    ld   [hl], d

label_77AA2::
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   h, c
    ld   [hl], d
    ld   [hl], h
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77B21

label_77AAD::
    ld   l, a
    jr   nz, label_77B1C
    ld   l, c
    ld   l, e

label_77AB2::
    ld   h, l
    ld   l, l
    ld   [hl], l
    ld   [hl], e
    ld   l, c
    ld   h, e
    inc  l
    jr   nz, label_77B20
    ld   l, b
    ccf
    jr   nz, label_77ADF
    jr   nz, label_77AE1
    jr   nz, label_77AE3
    ld   d, a
    ld   h, l
    ld   l, h
    ld   l, h
    inc  l
    jr   nz, label_77B2B
    jr   nz, label_77B32
    ld   [hl], d
    ld   l, a
    ld   h, a
    jr   nz, label_77AF1
    jr   nz, label_77AF3
    ld   l, [hl]
    ld   h, c
    ld   l, l
    ld   h, l
    ld   h, h
    jr   nz, label_77B27
    ld   h, c
    ld   l, l
    ld   [hl], l
    inc  l
    jr   nz, label_77B57
    ld   l, b

label_77AE1::
    ld   l, a
    jr   nz, label_77B50
    ld   l, c
    db   $76 ; Halt
    ld   h, l
    ld   [hl], e
    jr   nz, label_77B53
    ld   l, [hl]
    jr   nz, label_77B61
    ld   l, b
    ld   h, l
    jr   nz, label_77B11

label_77AF1::
    jr   nz, label_77B13

label_77AF3::
    ld   d, e
    ld   l, c
    ld   h, a
    ld   l, [hl]
    ld   [hl], b

label_77AF8::
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_77B4A
    ld   h, c

label_77AFE::
    ld   a, d
    ld   h, l
    inc  l
    jr   nz, label_77B23
    ld   l, l
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_77B75
    ld   l, [hl]
    ld   l, a
    ld   [hl], a
    jr   nz, label_77B82
    ld   l, a
    ld   l, l

label_77B11::
    ld   h, l
    jr   nz, label_77B82
    ld   h, l
    ld   [hl], a
    jr   nz, label_77B8B
    ld   l, a
    ld   l, [hl]
    ld   h, a
    ld   [hl], e

label_77B1C::
    inc  l
    jr   nz, label_77B81
    ld   [hl], l

label_77B20::
    ld   [hl], h

label_77B21::
    jr   nz, label_77B43

label_77B23::
    ld   l, b
    ld   h, l
    jr   nz, label_77B8A

label_77B27::
    ld   l, b
    ld   h, c
    ld   [hl], d
    ld   h, a

label_77B2B::
    ld   h, l
    ld   [hl], e
    jr   nz, label_77B90
    jr   nz, label_77B9D
    ld   l, a

label_77B32::
    ld   [hl], h
    ld   [hl], h
    ld   l, a
    jr   nz, label_77BA7
    ld   l, h
    ld   h, c
    ld   a, c
    jr   nz, label_77BB0
    ld   l, b
    ld   h, l
    ld   l, l
    ld   hl, label_2020
    jr   nz, label_77B86
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    ld   b, e

label_77B4A::
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d

label_77B53::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]

label_77B57::
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a
    ld   hl, label_76948
    inc  l
    jr   nz, label_77BCF
    ld   [hl], h
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_77BC0
    ld   l, h
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    ld   hl, label_76F59
    ld   [hl], l
    jr   nz, label_77BD7
    ld   [hl], d
    ld   h, l
    jr   nz, label_77BDE
    ld   l, a
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77BA0
    jr   nz, label_77BE9

label_77B82::
    ld   [hl], d
    ld   h, l
    ld   h, c
    ld   [hl], h

label_77B86::
    ld   hl, label_2020
    ld   e, c

label_77B8A::
    ld   l, a

label_77B8B::
    ld   [hl], l
    ld   [hl], d
    jr   nz, label_77BAF
    jr   nz, label_77BB1
    ld   h, l
    ld   h, [hl]
    ld   h, [hl]
    ld   l, a
    ld   [hl], d
    ld   [hl], h
    ld   [hl], e
    jr   nz, label_77C11
    ld   l, c
    ld   l, h
    ld   l, h

label_77B9D::
    jr   nz, label_77C04
    ld   l, [hl]

label_77BA0::
    ld   h, h
    ld   [hl], e
    ld   l, a
    ld   l, a
    ld   l, [hl]
    ld   l, $2E

label_77BA7::
    ld   l, $20
    ld   b, d
    ld   a, c
    jr   nz, label_77C21
    ld   l, b
    ld   h, l

label_77BAF::
    jr   nz, label_77BD1

label_77BB1::
    ld   [hl], a
    ld   h, c
    ld   a, c
    inc  l
    jr   nz, label_77C1F
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_77C35
    ld   l, a
    ld   [hl], l
    jr   nz, label_77BE0

label_77BC0::
    jr   nz, label_77C38
    ld   l, c
    ld   [hl], e
    ld   l, c
    ld   [hl], h
    ld   h, l
    ld   h, h
    jr   nz, label_77C3E
    ld   l, b
    ld   h, l
    jr   nz, label_77C16
    ld   h, l

label_77BCF::
    ld   l, [hl]
    jr   nz, label_77C1A
    ld   l, a
    ld   [hl], l
    ld   [hl], e
    ld   h, l
    jr   nz, label_77C47
    ld   l, [hl]
    jr   nz, label_77C4F
    ld   l, b
    ld   h, l
    jr   nz, label_77BFF
    jr   nz, label_77C01
    ld   l, l
    ld   l, a
    ld   [hl], l
    ld   l, [hl]
    ld   [hl], h
    ld   h, c
    ld   l, c
    ld   l, [hl]

label_77BE9::
    ccf
    jr   nz, label_77C0C
    ld   d, h
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    ld   l, c
    ld   [hl], e
    jr   nz, label_77C56
    jr   nz, label_77C5A
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_77C6A
    ld   h, l
    ld   h, c
    ld   [hl], d

label_77BFF::
    ld   h, d
    ld   a, c

label_77C01::
    ld   [hl], a
    ld   l, c
    ld   [hl], h

label_77C04::
    ld   l, b
    jr   nz, label_77C7A
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b

label_77C0C::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77C31

label_77C11::
    ld   l, c
    ld   l, l
    ld   [hl], b
    ld   l, a
    ld   [hl], d

label_77C16::
    ld   [hl], h
    ld   h, c
    ld   l, [hl]
    ld   [hl], h

label_77C1A::
    jr   nz, label_77C85
    ld   l, [hl]
    jr   nz, label_77C88

label_77C1F::
    ld   [hl], h
    ld   l, $42
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    ld   b, e
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d

label_77C31::
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]

label_77C35::
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]
    ld   b, a

label_77C3E::
    ld   hl, label_76C55
    ld   [hl], d
    ld   l, c
    ld   [hl], d
    ld   h, c
    jr   nz, label_77CBA

label_77C47::
    ld   [hl], b
    ld   h, l
    ld   h, c
    ld   l, e
    ld   l, c
    ld   l, [hl]
    ld   h, a
    ld   hl, label_77241
    ld   h, l
    jr   nz, label_77CCD
    ld   l, a
    ld   [hl], l

label_77C56::
    ld   [hl], d
    jr   nz, label_77CBE
    ld   l, [hl]

label_77C5A::
    ld   h, l
    ld   l, l
    ld   l, c
    ld   h, l
    ld   [hl], e
    ld   [hl], h
    ld   l, a
    ld   l, a
    jr   nz, label_77CD7
    ld   [hl], h
    ld   [hl], d
    ld   l, a
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77CD1
    ld   l, a
    ld   [hl], d
    jr   nz, label_77C8F
    ld   a, c
    ld   l, a
    ld   [hl], l
    ccf
    jr   nz, label_77C95
    ld   c, c
    ld   l, [hl]
    jr   nz, label_77CED
    ld   l, b

label_77C7A::
    ld   h, c
    ld   [hl], h
    jr   nz, label_77C9E
    jr   nz, label_77CE3
    ld   h, c
    ld   [hl], e
    ld   h, l
    inc  l
    jr   nz, label_77CFF
    ld   l, a
    ld   [hl], l

label_77C88::
    jr   nz, label_77CEC
    ld   h, l
    ld   [hl], h
    ld   [hl], h
    ld   h, l
    ld   [hl], d

label_77C8F::
    ld   h, e
    ld   l, a
    ld   l, h
    ld   l, h
    ld   h, l
    ld   h, e

label_77C95::
    ld   [hl], h
    jr   nz, label_77CF9
    ld   l, h
    ld   l, h
    jr   nz, label_77D10
    ld   l, b
    ld   h, l

label_77C9E::
    jr   nz, label_77CF3
    ld   h, l
    ld   h, c
    ld   [hl], e
    ld   l, b
    ld   h, l
    ld   l, h
    ld   l, h
    ld   [hl], e
    ld   l, $2E
    ld   l, $4A
    ld   [hl], l
    ld   [hl], e
    ld   [hl], h
    ld   h, d
    ld   h, l
    ld   l, h
    ld   l, c
    ld   h, l
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_77D21
    ld   l, [hl]
    jr   nz, label_77D34
    ld   l, a
    ld   [hl], l
    ld   [hl], d

label_77CBE::
    dec  l
    ld   [hl], e
    ld   h, l
    ld   l, h
    ld   h, [hl]
    jr   nz, label_77D26
    ld   l, [hl]
    ld   h, h
    jr   nz, label_77D2D
    ld   l, a
    jr   nz, label_77D45
    ld   l, a

label_77CCD::
    ld   [hl], l
    ld   [hl], d
    ld   h, d
    ld   h, l

label_77CD1::
    ld   [hl], e
    ld   [hl], h
    ld   hl, label_2020
    ld   b, e

label_77CD7::
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   e, [hl]
    ld   b, d
    ld   d, d
    ld   d, d
    ld   c, c

label_77CE3::
    ld   c, [hl]
    ld   b, a
    ld   hl, label_74220
    ld   d, d
    ld   d, d
    ld   c, c
    ld   c, [hl]

label_77CEC::
    ld   b, a

label_77CED::
    ld   hl, label_76C55
    ld   [hl], d
    ld   l, c
    ld   [hl], d

label_77CF3::
    ld   h, c
    jr   nz, label_77D5E
    ld   h, l
    ld   [hl], d
    ld   h, l

label_77CF9::
    ld   hl, label_2E20
    ld   l, $2E
    ld   b, a

label_77CFF::
    ld   l, a
    jr   nz, label_77D68
    ld   l, a
    ld   [hl], d
    jr   nz, label_77D6F
    ld   [hl], h
    ld   hl, label_2020
    jr   nz, label_77D2C
    jr   nz, label_77D2E
    ld   e, c
    ld   l, a

label_77D10::
    ld   [hl], l
    ld   e, [hl]
    ld   [hl], d
    ld   h, l
    jr   nz, label_77D77
    ld   l, h
    ld   l, l
    ld   l, a
    ld   [hl], e
    ld   [hl], h
    jr   nz, label_77D3D
    jr   nz, label_77D93
    ld   l, b
    ld   h, l

label_77D21::
    ld   [hl], d
    ld   h, l
    ld   hl, label_74920

label_77D26::
    ld   e, [hl]
    ld   l, l
    jr   nz, label_77D9A
    ld   [hl], l
    ld   l, h

label_77D2C::
    ld   l, h

label_77D2D::
    dec  l

label_77D2E::
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77D99
    ld   l, a

label_77D34::
    ld   [hl], d
    jr   nz, label_77DB0
    ld   l, a
    ld   [hl], l
    ld   hl, label_2020
    jr   nz, label_77D5E
    ld   b, d
    ld   a, c
    ld   h, l
    ld   hl, label_2020
    ld   b, e

label_77D45::
    ld   c, h
    ld   c, c
    ld   b, e
    ld   c, e
    ld   hl, $FF5E
    ld   b, a
    ld   l, a
    jr   nz, label_77DB1
    ld   l, b
    ld   h, l
    ld   h, c
    ld   h, h
    jr   nz, label_77DB7
    ld   l, [hl]
    ld   h, h
    jr   nz, label_77D7A
    jr   nz, label_77D7C
    ld   [hl], h
    ld   h, c

label_77D5E::
    ld   l, e
    ld   h, l
    jr   nz, label_77DC3
    jr   nz, label_77DD4
    ld   l, c
    ld   h, e
    ld   [hl], h
    ld   [hl], l

label_77D68::
    ld   [hl], d
    ld   h, l
    jr   nz, label_77D8C
    ld   l, a
    ld   h, [hl]
    jr   nz, label_77DDD
    ld   h, l
    ld   l, $20
    ld   b, c
    ld   l, [hl]
    ld   a, c
    jr   nz, label_77DD9
    ld   l, [hl]
    ld   h, a

label_77D7A::
    ld   l, h
    ld   h, l

label_77D7C::
    ld   a, c
    ld   l, a
    ld   [hl], l
    jr   nz, label_77DED
    ld   l, c
    ld   l, e
    ld   h, l
    ld   hl, label_759FF
    ld   h, c
    ld   [hl], d
    ld   l, [hl]
    ld   h, c
    jr   nz, label_77DD1
    ld   h, l
    ld   [hl], e
    ld   h, l
    ld   [hl], d
    ld   [hl], h
    ccf

label_77D93::
    jr   nz, label_77DB5
    jr   nz, label_77DEB
    ld   l, b
    ld   h, l

label_77D99::
    ld   [hl], d

label_77D9A::
    ld   h, l
    ld   e, [hl]
    ld   [hl], e
    jr   nz, label_77E00
    jr   nz, label_77E18
    ld   h, c
    ld   a, c
    jr   nz, label_77E19
    ld   l, a
    ld   h, a
    ld   h, l
    ld   [hl], h
    jr   nz, label_77E1F
    ld   l, b
    ld   h, l
    ld   [hl], d
    ld   h, l
    jr   nz, label_77E25

label_77DB1::
    ld   l, a
    jr   nz, label_77E28
    ld   l, b

label_77DB5::
    ld   h, l
    ld   [hl], e

label_77DB7::
    ld   l, a
    ld   [hl], l
    ld   [hl], h
    ld   l, b
    inc  l
    jr   nz, label_77E20
    ld   [hl], l
    ld   [hl], h
    jr   nz, label_77E3B
    ld   l, a

label_77DC3::
    ld   [hl], l
    jr   nz, label_77DE6
    ld   l, l
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    jr   nz, label_77E3B
    ld   l, a
    ld   [hl], h
    jr   nz, label_77E33

label_77DD1::
    ld   h, l
    jr   nz, label_77DF4

label_77DD4::
    jr   nz, label_77DF6
    ld   h, c
    ld   h, d
    ld   l, h

label_77DD9::
    ld   h, l
    jr   nz, label_77E50
    ld   l, a

label_77DDD::
    jr   nz, label_77E46
    ld   h, l
    ld   [hl], h
    jr   nz, label_77E03
    jr   nz, label_77E05
    jr   nz, label_77E5B
    ld   l, b
    ld   [hl], d
    ld   l, a
    ld   [hl], l

label_77DEB::
    ld   h, a
    ld   l, b

label_77DED::
    jr   nz, label_77E58
    ld   h, [hl]
    jr   nz, label_77E66
    ld   l, b
    ld   h, c

label_77DF4::
    ld   [hl], h
    jr   nz, label_77E63
    ld   h, c
    ld   a, d
    ld   a, c
    jr   nz, label_77E73
    ld   h, c
    ld   l, h
    ld   [hl], d
    ld   [hl], l

label_77E00::
    ld   [hl], e
    jr   nz, label_77E6C

label_77E03::
    ld   [hl], e
    jr   nz, label_77E26
    ld   l, c
    ld   l, [hl]
    jr   nz, label_77E7E
    ld   l, b
    ld   h, l
    jr   nz, label_77E85
    ld   h, c
    ld   a, c
    ld   hl, label_741FF
    ld   l, b
    ld   l, b
    ld   l, b
    ld   l, $2E

label_77E18::
    ld   l, $20
    ld   d, e
    ld   l, c
    ld   h, a
    ld   l, b
    ld   l, $2E

label_77E20::
    ld   l, $20
    ld   c, a
    ld   l, [hl]
    jr   nz, label_77E99

label_77E26::
    ld   [hl], l
    ld   h, e

label_77E28::
    ld   l, b
    jr   nz, label_77E8C
    jr   nz, label_77E9B
    ld   l, c
    ld   h, e
    ld   h, l
    jr   nz, label_77E52
    ld   h, h

label_77E33::
    ld   h, c
    ld   a, c
    inc  l
    jr   nz, label_77EAF
    ld   h, l
    jr   nz, label_77EA9

label_77E3B::
    ld   h, l
    ld   h, l
    ld   h, h
    jr   nz, label_77EA1
    jr   nz, label_77E62
    ld   [hl], e
    ld   l, a
    ld   l, [hl]
    ld   h, a

label_77E46::
    jr   nz, label_77EAE
    ld   [hl], d
    ld   l, a
    ld   l, l
    jr   nz, label_77E9A
    ld   h, c
    ld   [hl], d
    ld   l, c

label_77E50::
    ld   l, [hl]
    ld   hl, label_748FF
    ld   h, l
    ld   a, c
    ld   hl, label_74420
    ld   l, c
    ld   h, h

label_77E5B::
    jr   nz, label_77ED6
    ld   h, c
    jr   nz, label_77ECB
    ld   l, [hl]
    ld   l, a

label_77E62::
    ld   [hl], a

label_77E63::
    ld   b, c
    ld   l, [hl]
    ld   l, c

label_77E66::
    ld   l, l
    ld   h, c
    ld   l, h
    jr   nz, label_77EC1
    ld   l, c

label_77E6C::
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_77E93

label_77E73::
    ld   h, c
    ld   l, [hl]
    ld   h, h
    jr   nz, label_77EC5
    ld   h, c
    ld   h, d
    ld   h, l
    jr   nz, label_77ED3
    ld   l, c

label_77E7E::
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    ld   h, c
    ld   [hl], d

label_77E85::
    ld   h, l
    jr   nz, label_77EFB
    ld   l, c
    ld   [hl], e
    ld   [hl], h
    ld   h, l

label_77E8C::
    ld   [hl], d
    jr   nz, label_77EAF
    jr   nz, label_77EB1
    jr   nz, label_77EB3

label_77E93::
    ld   h, e
    ld   l, c
    ld   [hl], h
    ld   l, c
    ld   h, l
    ld   [hl], e

label_77E99::
    ccf

label_77E9A::
    jr   nz, label_77EBC
    ld   e, c
    ld   h, l
    ld   [hl], e
    inc  l
    jr   nz, label_77EC2
    jr   nz, label_77F09
    db   $76 ; Halt
    ld   h, l
    ld   l, [hl]
    jr   nz, label_77F1D

label_77EA9::
    ld   l, b
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b

label_77EAE::
    jr   nz, label_77F24
    ld   l, b

label_77EB1::
    ld   h, l
    ld   a, c

label_77EB3::
    ld   h, c
    ld   [hl], d
    ld   h, l
    ld   l, [hl]
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_77F27
    ld   h, c

label_77EBC::
    ld   [hl], d
    ld   h, a
    ld   h, l
    jr   nz, label_77EE1

label_77EC1::
    jr   nz, label_77EE3
    ld   h, l
    ld   l, [hl]

label_77EC5::
    ld   l, a
    ld   [hl], l
    ld   h, a
    ld   l, b
    jr   nz, label_77F3F

label_77ECB::
    ld   l, a
    jr   nz, label_77F30
    ld   h, l
    jr   nz, label_77EF1
    jr   nz, label_77EF3

label_77ED3::
    ld   h, e
    ld   h, c
    ld   l, h

label_77ED6::
    ld   l, h
    ld   h, l
    ld   h, h
    jr   nz, label_77F3E
    ld   l, c
    ld   [hl], h
    ld   l, c
    ld   h, l
    ld   [hl], e
    ld   l, $2E
    ld   l, $41
    ld   l, [hl]
    ld   a, c
    ld   [hl], a
    ld   h, c
    ld   a, c
    inc  l
    jr   nz, label_77F35
    jr   nz, label_77F56
    ld   h, l
    ld   h, c
    ld   [hl], d

label_77EF1::
    ld   h, h
    jr   nz, label_77F5A
    ld   [hl], d
    ld   l, a
    ld   l, l
    jr   nz, label_77F5A
    jr   nz, label_77F71

label_77EFB::
    ld   h, l
    ld   [hl], d
    ld   a, c
    jr   nz, label_77F67
    ld   l, a
    ld   l, a
    ld   h, h
    ld   [hl], e
    ld   l, a
    ld   [hl], l
    ld   [hl], d
    ld   h, e
    ld   h, l

label_77F09::
    jr   nz, label_77F7F
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_77F84
    ld   l, b
    ld   h, l
    ld   a, c
    ld   l, b
    ld   h, c
    db   $76 ; Halt
    ld   h, l
    jr   nz, label_77F7A
    jr   nz, label_77F5F
    ld   [hl], d
    ld   h, l

label_77F1D::
    ld   h, c
    ld   l, l
    jr   nz, label_77F41
    jr   nz, label_77F43
    ld   d, e

label_77F24::
    ld   l, b
    ld   [hl], d
    ld   l, c

label_77F27::
    ld   l, [hl]
    ld   h, l
    jr   nz, label_77F94
    ld   l, [hl]
    jr   nz, label_77F7B
    ld   h, c
    ld   h, d

label_77F30::
    ld   h, l
    inc  l
    jr   nz, label_77F95
    ld   l, [hl]

label_77F35::
    ld   h, h
    jr   nz, label_77FAC
    ld   l, b
    ld   h, c
    ld   [hl], h
    jr   nz, label_77FA6
    ld   [hl], h

label_77F3E::
    jr   nz, label_77FA8
    ld   h, c

label_77F41::
    ld   [hl], e
    jr   nz, label_77FB7
    ld   l, a
    ld   l, l
    ld   h, l
    ld   [hl], h
    ld   l, b
    ld   l, c
    ld   l, [hl]
    ld   h, a
    jr   nz, label_77FB5
    ld   l, a
    ld   l, a
    ld   h, h
    jr   nz, label_77F73
    ld   l, c
    ld   l, [hl]
    ld   [hl], e

label_77F56::
    ld   l, c
    ld   h, h
    ld   h, l
    ld   l, $2E
    ld   l, $20
    jr   nz, label_77FA8

label_77F5F::
    ld   [hl], e
    jr   nz, label_77F82
    jr   nz, label_77FD8
    ld   l, b
    ld   h, c
    ld   [hl], h

label_77F67::
    jr   nz, label_77FDD
    ld   [hl], d
    ld   [hl], l
    ld   h, l
    ccf
    rst  $38
    ld   c, c
    jr   nz, label_77FD4

label_77F71::
    ld   h, c
    ld   l, [hl]

label_77F73::
    ld   e, [hl]
    ld   [hl], h
    jr   nz, label_77FDE
    ld   l, a
    jr   nz, label_77FEE

label_77F7A::
    ld   l, a

label_77F7B::
    jr   nz, label_77F9D
    jr   nz, label_77FCC

label_77F7F::
    ld   h, c
    ld   h, d
    ld   h, l

label_77F82::
    jr   nz, label_77FDA

label_77F84::
    ld   l, c
    ld   l, h
    ld   l, h
    ld   h, c
    ld   h, a
    ld   h, l
    jr   nz, label_77FAC
    jr   nz, label_77FAE
    ld   h, d
    ld   h, l
    ld   h, e
    ld   h, c
    ld   [hl], l
    ld   [hl], e

label_77F94::
    ld   h, l

label_77F95::
    jr   nz, label_FFFF8006
    ld   h, [hl]
    jr   nz, label_77FFB
    ld   l, h
    ld   l, h
    jr   nz, label_77FBE
    ld   [hl], h
    ld   l, b
    ld   h, l
    jr   nz, label_FFFF8010
    ld   l, a
    ld   l, [hl]
    ld   [hl], e

label_77FA6::
    ld   [hl], h
    ld   h, l

label_77FA8::
    ld   [hl], d
    ld   [hl], e
    ld   l, $20

label_77FAC::
    jr   nz, label_77FCE

label_77FAE::
    ld   c, c
    jr   nz, label_FFFF8019
    ld   l, a
    ld   [hl], b
    ld   h, l
    jr   nz, label_FFFF8003
    ld   h, c

label_77FB7::
    ld   [hl], d
    ld   l, c
    ld   l, [hl]
    jr   nz, label_77FDC
    jr   nz, label_77FDE

label_77FBE::
    ld   l, c
    ld   [hl], e
    jr   nz, label_FFFF8023
    ld   l, h
    ld   l, h
    jr   nz, label_FFFF8038
    ld   l, c
    ld   h, a
    ld   l, b
    ld   [hl], h
    ld   l, $FF

label_77FCC::
    nop
    nop

label_77FCE::
    nop
    nop
    nop
    nop
    nop
    nop

label_77FD4::
    nop
    nop
    nop
    nop

label_77FD8::
    nop
    nop

label_77FDA::
    nop
    nop

label_77FDC::
    nop

label_77FDD::
    nop

label_77FDE::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_77FEE::
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_77FFB::
    nop
    nop
    nop
    nop
    nop
