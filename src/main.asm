; The source code found here assembles to main.o.

; If it starts to take a long time to build, it's a good idea
; to split your code and data up into new objects in the makefile.


include "constants.asm"

include "code/rst.asm"
include "code/header.asm"


section "Main", rom0

Start:
    cp   $11
    jr   nz, .label_016E
    ld   a, [$FF4D]
    and  $80
    jr   nz, .label_0167
    ld   a, $30
    ld   [$FF00], a
    ld   a, $01
    ld   [$FF4D], a
    xor  a
    ld   [$FFFF], a
    stop

.label_0167
    xor  a

.label_0168
    ld   [$FF70], a
    ld   a, $01
    jr   .label_016F

.label_016E
    xor  a

.label_016F
    ld   [$FFFE], a
    call .label_28CF
    ld   sp, $DFFF
    ld   a, $3C
    ld   [.label_2100], a
    call $6A22
    xor  a
    ld   [$FF47], a
    ld   [$FF48], a
    ld   [$FF49], a
    ld   hl, $8000
    ld   bc, $1800
    call .label_29DF
    ld   a, $24
    ld   [.label_2100], a
    call $5C00
    call .label_28F7
    call .label_29D0
    ld   a, $01
    ld   [.label_2100], a
    call $6D32
    call $FFC0
    call $410D
    call .label_2BCF
    ld   a, $44
    ld   [$FF41], a
    ld   a, $4F
    ld   [$FF45], a
    ld   a, $01
    ld   [$DBAF], a
    ld   a, $01
    ld   [$FFFF], a
    call $46AA
    ld   a, $1F
    ld   [.label_2100], a
    call $4000
    ld   a, $18
    ld   [$FFB5], a
    ei
    ld   a, $20
    ld   [.label_2100], a
    call $4854
    jp   .label_035F

.label_01DA
    ld   a, $01
    ld   [$FFFD], a
    ld   a, [$C500]
    and  a
    jr   z, .label_01F2
    ld   a, [$DB95]
    cp   $0B
    jr   nz, .label_01F2
    ld   a, [$FFE7]
    rrca
    and  $80
    jr   .label_01F8

.label_01F2
    ld   hl, $C156
    ld   a, [$FF97]
    add  a, [hl]

.label_01F8
    ld   [$FF42], a
    ld   a, [$FF96]
    ld   hl, $C155
    add  a, [hl]

.label_0200
    ld   hl, $C1BF
    add  a, [hl]
    ld   [$FF43], a
    ld   a, [$D6FE]
    and  a
    jr   nz, .label_0213
    ld   a, [$D6FF]
    cp   $00
    jr   z, .label_023D

.label_0213
    ld   a, [$DB95]
    cp   $09
    jr   z, .label_0229
    cp   $06
    jr   c, .label_0229
    cp   $0B
    jr   nz, .label_022F
    ld   a, [$DB96]
    cp   $07
    jr   nc, .label_022F

.label_0229
    call .label_08A4
    call .label_08A4

.label_022F
    di
    call .label_0419
    ei
    call .label_08A4
    call .label_08A4
    jp   .label_035F

.label_023D
    ld   a, [$D6FD]
    and  $7F
    ld   e, a
    ld   a, [$FF40]
    and  $80
    or   e
    ld   [$FF40], a
    ld   hl, $FFE7
    inc  [hl]
    ld   a, [$DB95]
    cp   $00
    jr   nz, .label_0264
    ld   a, [$DB96]
    cp   $08
    jr   c, .label_0264
    ld   a, $20
    ld   [.label_2100], a
    call $5257

.label_0264
    ld   a, [$C17F]
    and  a
    jp   z, .label_02D5
    inc  a
    jr   nz, .label_0279

.label_026E
    ld   a, $17
    ld   [.label_2100], a
    call $48DD
    jp   .label_02D5

.label_0279
    inc  a
    jr   z, .label_026E
    ld   a, $14
    ld   [.label_2100], a
    ld   a, [$C180]
    inc  a
    ld   [$C180], a
    cp   $C0
    jr   nz, .label_02A0
    ld   a, [$C17F]
    cp   $02
    jr   nz, .label_0296
    call $4E51

.label_0296
    xor  a
    ld   [$C17F], a
    ld   [$C3CA], a
    jp   .label_02D5

.label_02A0
    push af
    cp   $60
    jr   c, .label_02B7
    ld   a, [$FFFE]
    and  a
    jr   z, .label_02B4
    ld   a, $20
    ld   [.label_2100], a
    call $6CA7
    jr   .label_02B7

.label_02B4
    call $4FE8

.label_02B7
    ld   a, $14
    ld   [.label_2100], a
    pop  af
    call $5038
    call .label_08A4
    ld   a, [$DB97]
    ld   [$FF47], a
    ld   a, [$DB98]
    ld   [$FF48], a
    ld   a, [$DB99]
    ld   [$FF49], a
    jp   .label_035F

.label_02D5
    ld   a, [$DB9A]
    ld   [$FF4A], a
    ld   a, [$DB97]
    ld   [$FF47], a
    ld   a, [$DB98]
    ld   [$FF48], a
    ld   a, [$DB99]
    ld   [$FF49], a
    call .label_08A4
    call .label_281E
    ld   a, [$FF90]
    ld   hl, $FF91
    or   [hl]
    ld   hl, $C10E
    or   [hl]
    jr   nz, .label_035F
    ld   a, [$0003]
    and  a
    jr   z, .label_032D
    ld   a, [$D6FC]
    and  a
    jr   nz, .label_030D
    ld   a, [$FFCB]
    and  $0F
    jr   z, .label_0327

.label_030D
    ld   a, [$FFCC]
    and  $40
    jr   z, .label_0327
    ld   a, [$D6FC]
    xor  $01
    ld   [$D6FC], a
    jr   nz, .label_035F
    ld   a, [$C17B]
    xor  $10
    ld   [$C17B], a
    jr   .label_035F

.label_0327
    ld   a, [$D6FC]
    and  a
    jr   nz, .label_035F

.label_032D
    ld   a, [$DB95]
    cp   $0C
    jr   nz, .label_033B
    ld   a, [$DB96]
    cp   $02
    jr   c, .label_0343

.label_033B
    ld   a, $01
    call .label_080C
    call $5F2E

.label_0343
    call .label_0E34
    ld   a, [$FFFE]
    and  a
    jr   z, .label_0353
    ld   a, $21
    call .label_080C
    call $406E

.label_0353
    xor  a
    ld   [$DDD2], a
    ld   a, $01
    call .label_080C
    call $5F4B

.label_035F
    ld   a, $1F
    call .label_080C
    call $7F80
    ld   a, $0C
    call .label_0B0B
    call .label_080C
    xor  a
    ld   [$FFFD], a
    halt
    nop

.label_0374
    ld   a, [$FFD1]
    and  a
    jr   z, .label_0374
    xor  a
    ld   [$FFD1], a
    jp   .label_01DA

.label_037F
    jr   nz, .label_03B1
    ld   b, b
    ld   h, b
    nop

.label_0384
    jr   nc, .label_03DC
    ld   l, b
    nop
    di
    push af
    push hl
    push de
    push bc
    ld   a, [$FF70]
    ld   c, a
    xor  a
    ld   [$FF70], a
    ld   a, [$DB95]
    cp   $01
    jr   nz, .label_03AD
    ld   a, [$DB96]
    cp   $05
    jr   nz, .label_03A6
    ld   a, [$D000]
    jr   .label_03A8

.label_03A6
    ld   a, [$FF97]

.label_03A8
    ld   [$FF42], a
    jp   .label_03FF

.label_03AD
    cp   $00
    jr   nz, .label_03FC

.label_03B1
    ld   a, [$C105]
    ld   e, a
    ld   d, $00
    ld   hl, $C100
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF96
    add  a, [hl]
    ld   [$FF43], a
    ld   a, [$DB96]
    cp   $06
    jr   c, .label_03D9
    ld   hl, $0384
    add  hl, de
    ld   a, [hl]
    ld   [$FF45], a
    ld   a, e
    inc  a
    and  $03
    ld   [$C105], a
    jr   .label_03FF

.label_03D9
    ld   hl, $037F

.label_03DC
    add  hl, de
    ld   a, [hl]
    ld   [$FF45], a
    ld   a, e
    inc  a
    cp   $05
    jr   nz, .label_03E7
    xor  a

.label_03E7
    ld   [$C105], a
    nop
    cp   $04
    jr   nz, .label_03FF
    ld   a, [$C106]
    ld   [$FF42], a
    cpl
    inc  a
    add  a, $60
    ld   [$FF45], a
    jr   .label_03FF

.label_03FC
    xor  a
    ld   [$FF43], a

.label_03FF
    ld   a, c

.label_0400
    ld   [$FF70], a

.label_0402
    pop  bc
    pop  de
    pop  hl
    pop  af
    ei
    reti

.label_0408
    push af
    ld   a, $28
    ld   [.label_2100], a
    call $4601
    ld   a, [$DBAF]
    ld   [.label_2100], a
    pop  af
    reti

.label_0419
    ld   a, [$D6FE]
    and  a
    jr   z, .label_043A
    ld   [$DDD2], a
    cp   $23
    jr   z, .label_042B
    push af
    call .label_28CF
    pop  af

.label_042B
    call .label_0430
    jr   .label_045D

.label_0430
    ld   e, a
    ld   a, $20
    ld   [.label_2100], a
    call $4657
    jp   [hl]

.label_043A
    call .label_28CF
    ld   a, $24
    ld   [.label_2100], a
    call $5C2C
    ld   a, $20
    ld   [.label_2100], a
    call $4577
    ld   a, $08
    ld   [.label_2100], a
    call .label_292D
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a

.label_045D
    xor  a
    ld   [$D6FF], a
    ld   [$D6FE], a
    ld   a, [$D6FD]
    ld   [$FF40], a
    ret

.label_046A
    rlca
    add  hl, bc
    push af
    push bc
    push de
    push hl
    ld   a, [$FF70]
    and  $07
    ld   c, a
    xor  a
    ld   [$FF70], a
    push bc
    di
    ld   a, [$DB95]
    cp   $0D
    jr   nz, .label_048D
    ld   a, [$DB96]
    cp   $09
    jr   c, .label_048D
    cp   $12
    jp  c, .label_0577

.label_048D
    ld   a, [$FFFD]
    and  a
    jp   nz, .label_0569
    ld   a, [$C19F]
    and  $7F
    jr   z, .label_04CC
    cp   $01
    jr   z, .label_04CC
    cp   $05
    jr   nc, .label_04AC
    call .label_23E4
    ld   hl, $C19F
    inc  [hl]
    jp   .label_0569

.label_04AC
    cp   $0A
    jr   nz, .label_04B6
    call .label_2719
    jp   .label_0569

.label_04B6
    cp   $0B
    jr   nz, .label_04CC
    ld   a, [$C172]
    and  a
    jr   z, .label_04C6
    dec  a
    ld   [$C172], a
    jr   .label_04CC

.label_04C6
    call .label_276D
    jp   .label_0569

.label_04CC
    ld   a, [$DB95]
    cp   $0E
    jr   c, .label_04E4
    ld   a, [$DB96]
    cp   $06
    jr   c, .label_052B
    ld   a, $38
    ld   [.label_2100], a
    call $785A
    jr   .label_052B

.label_04E4
    ld   a, [$D6FE]
    and  a
    jr   nz, .label_0569
    ld   a, [$FF90]
    ld   [$FFE8], a
    ld   hl, $FF91
    or   [hl]
    ld   hl, $C10E
    or   [hl]
    jr   z, .label_0509
    call .label_05BC
    ld   a, [$FFE8]
    cp   $08
    jr   nc, .label_0504

.label_0501
    call .label_1D2E

.label_0504
    call $FFC0
    jr   .label_0569

.label_0509
    ld   a, [$FFBB]
    and  a
    jr   z, .label_0521
    dec  a
    ld   [$FFBB], a
    ld   e, a
    ld   d, $00
    ld   hl, $046A
    add  hl, de
    ld   a, [hl]
    ld   [$D6F8], a
    call .label_1ED7
    jr   .label_0501

.label_0521
    ld   a, [$DB95]
    cp   $0D
    jr   z, .label_052B
    call .label_1B0D

.label_052B
    ld   a, [$FFFE]
    and  a
    jr   z, .label_0538
    ld   a, $24
    ld   [.label_2100], a
    call $5C1A

.label_0538
    ld   de, $D601
    call .label_2927
    xor  a
    ld   [$D600], a
    ld   [$D601], a
    ld   [$DC90], a
    ld   [$DC91], a
    ld   a, $36
    ld   [.label_2100], a
    call $72BA
    call $FFC0
    ld   a, [$FFFE]
    and  a
    jr   z, .label_0569
    ld   a, $21
    ld   [.label_2100], a
    call $4000
    ld   a, [$DBAF]
    ld   [.label_2100], a

.label_0569
    ei

.label_056A
    pop  bc
    ld   a, c
    ld   [$FF70], a
    pop  hl
    pop  de
    pop  bc
    ld   a, $01
    ld   [$FFD1], a
    pop  af
    reti

.label_0577
    ld   a, [$DBAF]
    push af
    ld   a, [$FFFD]
    and  a
    jr   nz, .label_05AB
    call $FFC0
    ld   a, [$FFFE]
    and  a
    jr   z, .label_0598
    ld   a, $21
    call .label_080C
    call $4000
    ld   a, $24
    call .label_080C
    call $5C1A

.label_0598
    ld   de, $D601
    call .label_2927
    xor  a
    ld   [$D600], a
    ld   [$D601], a
    ld   [$DC90], a
    ld   [$DC91], a

.label_05AB
    ld   a, $28
    call .label_080C
    call $4616
    pop  af
    ld   [$DBAF], a
    ld   [.label_2100], a
    jr   .label_056A

.label_05BC
    ld   a, [$FF90]
    and  a
    jp   z, .label_069E
    cp   $07
    jp   z, .label_07B0
    cp   $03
    jp   z, $0062
    cp   $04
    jp   z, $006A
    cp   $05
    jp   z, $0072
    cp   $06
    jp   z, $007A
    cp   $08
    jp   nc, .label_07D3
    ld   a, [$DBA5]
    and  a
    jp   z, .label_0656
    ld   a, [$FF90]
    cp   $02
    jp   z, .label_0826
    ld   a, $0D
    call .label_0B0B
    ld   [.label_2100], a
    ld   a, [$FF92]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   hl, $9000
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   hl, $5000
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_062F
    ld   a, $20
    ld   [.label_2100], a
    call $4616
    ld   [.label_2100], a
    jr   .label_0641

.label_062F
    ld   a, [$FF94]
    add  a, $50
    ld   h, a
    add  hl, bc
    ld   a, [$FFBB]
    and  a
    jr   z, .label_0641
    ld   a, [$FF92]
    dec  a
    cp   $02
    jr   c, .label_0647

.label_0641
    ld   bc, $0040
    call .label_2914

.label_0647
    ld   a, [$FF92]
    inc  a
    ld   [$FF92], a
    cp   $04
    jr   nz, .label_0655
    xor  a
    ld   [$FF90], a
    ld   [$FF92], a

.label_0655
    ret

.label_0656
    ld   a, $0F
    call .label_0B0B
    ld   [.label_2100], a
    ld   a, [$FF92]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   hl, $9000
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   a, [$FF94]
    add  a, $40
    ld   h, a
    ld   l, $00
    add  hl, bc
    ld   bc, $0040
    call .label_2914
    ld   a, [$FF92]
    inc  a
    ld   [$FF92], a
    cp   $08
    jr   nz, .label_069D
    xor  a
    ld   [$FF90], a
    ld   [$FF92], a

.label_069D
    ret

.label_069E
    ld   a, [$FFFE]
    and  a
    jr   z, .label_06CB
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_06CB
    ld   a, $20
    ld   [.label_2100], a
    call $475A
    xor  a
    ld   [$C10E], a
    ld   [$C10F], a
    ld   hl, $9000
    ld   bc, $0000
    call $4616
    ld   c, $90
    ld   b, h
    ld   h, $00
    call .label_0A13
    jr   .label_0738

.label_06CB
    ld   a, [$FF91]
    and  a
    jp   z, .label_073E
    ld   a, [$C197]
    ld   e, a
    ld   d, $00
    ld   hl, $C193
    add  hl, de
    ld   a, [hl]
    push af
    and  $3F
    ld   d, a
    ld   e, $00
    pop  af
    db   $CB, $37 ; Need to handle this instruction 
    rra
    rra
    and  $03
    ld   c, a
    ld   b, $00
    ld   hl, $2E6F
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .label_06F7
    call .label_0B0B

.label_06F7
    ld   [.label_2100], a
    ld   a, [$FF93]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   hl, $4000
    add  hl, bc
    add  hl, de
    push hl
    ld   a, [$C197]
    ld   d, a
    ld   hl, $8400
    add  hl, bc
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    ld   bc, $0040
    call .label_2914
    ld   a, [$FF93]
    inc  a
    ld   [$FF93], a
    cp   $04
    jr   nz, .label_073D

.label_0738
    xor  a
    ld   [$FF91], a
    ld   [$FF93], a

.label_073D
    ret

.label_073E
    ld   a, [$C10D]
    ld   e, a
    ld   d, $00
    ld   hl, $C193
    add  hl, de
    ld   a, [hl]
    push af
    and  $3F
    ld   d, a
    ld   e, $00
    pop  af
    db   $CB, $37 ; Need to handle this instruction 
    rra
    rra
    and  $03
    ld   c, a
    ld   b, $00
    ld   hl, $2E6F
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .label_0764
    call .label_0B0B

.label_0764
    ld   [.label_2100], a
    ld   a, [$C10F]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   hl, $4000
    add  hl, bc
    add  hl, de
    push hl
    ld   a, [$C10D]
    ld   d, a
    ld   hl, $8400
    add  hl, bc
    add  hl, de
    ld   e, l
    ld   d, h
    pop  hl
    ld   bc, $0040
    call .label_2914
    ld   a, [$C10F]
    inc  a
    ld   [$C10F], a
    cp   $04
    jr   nz, .label_07AF
    xor  a
    ld   [$C10E], a
    ld   [$C10F], a

.label_07AF
    ret

.label_07B0
    ld   a, $01
    ld   [.label_2100], a
    call $6BB5
    jp   $008B

.label_07BB
    ld   h, b
    ld   l, c
    and  b
    ld   l, c
    ret  nz
    ld   l, c
    nop
    ld   b, d
    ld   b, b
    ld   b, d
    ld   h, b
    ld   b, d

.label_07C7
    nop
    add  a, d
    ld   b, b
    add  a, d
    ld   h, b
    add  a, d
    nop
    add  a, d
    ld   b, b
    add  a, d
    ld   h, b
    add  a, d

.label_07D3
    sub  a, $08
    db   $CB, $27 ; Need to handle this instruction 
    ld   e, a
    ld   d, $00
    ld   hl, $07BB
    add  hl, de
    push hl
    ld   hl, $07C7
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    pop  hl
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    ld   bc, $0040
    call .label_2914
    ld   a, [$FF90]
    cp   $0A
    jr   z, .label_0808
    cp   $0D

.label_0800
    jr   z, .label_0808

.label_0802
    ld   a, [$FF90]
    inc  a

.label_0805
    ld   [$FF90], a
    ret

.label_0808
    xor  a
    ld   [$FF90], a
    ret

.label_080C
    ld   [$DBAF], a
    ld   [.label_2100], a
    ret

.label_0813
    call .label_0B0B

.label_0816
    ld   [$DBAF], a
    ld   [.label_2100], a
    ret

.label_081D
    push af
    ld   a, [$DBAF]
    ld   [.label_2100], a
    pop  af
    ret

.label_0826
    ld   a, $12
    call .label_0B0B
    ld   [.label_2100], a
    ld   a, [$FF92]
    cp   $08
    jr   c, .label_0873
    jr   nz, .label_0843
    ld   a, $02
    ld   [.label_2100], a
    call $6843

.label_083E
    ld   hl, $FF92
    inc  [hl]
    ret

.label_0843
    cp   $09
    jr   nz, .label_0854
    ld   a, $02
    ld   [.label_2100], a
    call $6827
    ld   hl, $FF92
    inc  [hl]
    ret

.label_0854
    cp   $0A
    jr   nz, .label_0865
    ld   a, $02
    ld   [.label_2100], a
    call $680B
    ld   hl, $FF92
    inc  [hl]
    ret

.label_0865
    ld   a, $02
    ld   [.label_2100], a
    call $67E5
    xor  a
    ld   [$FF90], a
    ld   [$FF92], a
    ret

.label_0873
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   hl, $8D00
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   hl, $7E00
    add  hl, bc
    ld   bc, $0040
    call .label_2914
    ld   a, [$FF92]
    inc  a
    ld   [$FF92], a
    ret

.label_08A4
    ld   a, $1F
    call .label_080C
    call $4006
    ld   a, [$FFF3]
    and  a
    jr   nz, .label_08D6
    ld   a, [$C10B]
    and  a
    jr   z, .label_08C6
    cp   $02
    jr   nz, .label_08C3
    ld   a, [$FFE7]
    and  $01
    jr   nz, .label_08D6
    jr   .label_08C6

.label_08C3
    call .label_08C6

.label_08C6
    ld   a, $1B
    call .label_080C
    call $4006
    ld   a, $1E
    call .label_080C
    call $4006

.label_08D6
    ret
    ld   a, $20
    ld   [.label_2100], a
    call $6A30

.label_08DF
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret
    ld   a, $20
    ld   [.label_2100], a
    call $6AC1
    jr   .label_08DF
    ld   a, $20
    ld   [.label_2100], a
    call $6BA4
    jr   .label_08DF
    push af
    ld   a, $20
    ld   [.label_2100], a
    call $6BDC
    jr   .label_0973
    ld   a, $20
    ld   [.label_2100], a
    call $6C00
    jr   .label_0917
    ld   a, $20
    ld   [.label_2100], a
    call $6C24

.label_0917
    ld   a, $01
    ld   [.label_2100], a
    ret
    push af
    ld   b, $00
    ld   a, [$DDD8]
    db   $CB, $27 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $27 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   c, a
    jr   .label_092F
    push af

.label_092F
    ld   a, $1A
    ld   [.label_2100], a
    call $6576
    ld   a, [$FFDF]
    ld   [.label_2100], a
    ld   hl, $DC91
    ld   a, [$DC90]
    ld   e, a
    add  a, $0A
    ld   [$DC90], a
    ld   d, $00
    add  hl, de
    ld   a, [$FFE0]
    ld   d, a
    ld   a, [$FFE1]
    ld   e, a
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    inc  de
    inc  de
    ld   a, [de]
    ldi  [hl], a
    dec  de
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    inc  de
    inc  de
    ld   a, [de]
    ldi  [hl], a
    xor  a
    ldi  [hl], a

.label_0973
    pop  af
    ld   [.label_2100], a
    ret
    push af
    ld   a, $20
    ld   [.label_2100], a
    call $6D0E
    jr   .label_0973

.label_0983
    ld   a, $1A
    ld   [.label_2100], a
    call $6710
    ld   a, [$FFDF]
    ld   [.label_2100], a
    ld   a, [$FFE0]
    ld   h, a
    ld   a, [$FFE1]
    ld   l, a
    ld   a, [hl]
    inc  de
    ret
    push af
    push bc
    call .label_0983
    ld   [$FFD7], a
    pop  bc
    call .label_0983
    ld   [$FFD8], a
    ld   a, [$DC90]
    ld   c, a
    ld   b, $00
    add  a, $05
    ld   [$DC90], a
    ld   hl, $DC91
    add  hl, bc
    ld   a, [$FFCF]
    ldi  [hl], a
    ld   a, [$FFD0]
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    ld   a, [$FFD7]
    ldi  [hl], a
    ld   a, [$FFD8]
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    jr   .label_0973
    push af
    ld   a, $20
    ld   [.label_2100], a
    call $4985
    jr   .label_0973
    push af
    ld   a, $20
    ld   [.label_2100], a
    call $4518
    jr   .label_0973
    push af
    ld   a, $20
    ld   [.label_2100], a
    call $4874
    jr   .label_0973
    push af
    ld   a, $20
    ld   [.label_2100], a
    call $4954
    jp   .label_0973
    push af
    ld   a, $20
    ld   [.label_2100], a
    call $482D
    jp   .label_0973

.label_0A01
    push hl
    ld   l, $00
    ld   e, l
    ld   h, b
    ld   a, c
    add  a, $80
    ld   d, a
    ld   bc, $0100
    call .label_2914
    pop  hl
    jr   .label_0A2D

.label_0A13
    ld   [.label_2100], a
    ld   a, [$FFFE]
    and  a
    jr   z, .label_0A01
    ld   a, b
    ld   [$FF51], a
    ld   a, $00
    ld   [$FF52], a
    ld   a, c
    ld   [$FF53], a
    ld   a, $00
    ld   [$FF54], a
    ld   a, $0F
    ld   [$FF55], a

.label_0A2D
    ld   a, h
    ld   [.label_2100], a
    ret
    push af
    ld   a, $35
    ld   [.label_2100], a
    ld   hl, $4F00
    ld   de, $DCC0
    ld   bc, $0020
    call .label_2914
    jp   .label_0973
    push af
    ld   a, $36
    ld   [.label_2100], a
    call $505F
    jp   .label_0973
    push af
    ld   a, $36
    ld   [.label_2100], a
    call $4F9B
    jp   .label_0973
    push af
    ld   a, $20
    ld   [.label_2100], a
    call .label_3CE6
    jp   .label_0973
    push af
    ld   a, $03
    ld   [.label_2100], a
    call $5A2E
    jp   .label_0973
    push af
    ld   a, $36
    ld   [.label_2100], a
    call $4F68
    jp   .label_0973
    push af
    ld   a, $20
    ld   [.label_2100], a
    call $6D52
    jp   .label_0973
    push af
    ld   a, $36
    ld   [.label_2100], a
    call $4BE8
    jp   .label_0973
    push af
    ld   a, $0F
    call .label_080C
    call .label_2321
    jp   .label_0973
    push af
    ld   a, $36
    call .label_080C
    call $705A

.label_0AB0
    pop  af
    call .label_080C
    ret
    push af
    ld   a, $24
    ld   [.label_2100], a
    call $5C1A
    ld   de, $D601
    call .label_2927
    jr   .label_0AB0
    push af
    ld   a, $36
    ld   [.label_2100], a
    call $703E
    jp   .label_0973
    push af
    ld   a, $36
    ld   [.label_2100], a
    call $70D6
    jp   .label_0973
    push af
    ld   a, $36
    call .label_080C
    call $4A77
    jp   .label_0973
    push af
    ld   a, $36
    ld   [.label_2100], a
    call $4A4C
    jp   .label_0973
    push af
    ld   a, $36
    ld   [.label_2100], a
    call $7161
    jp   .label_0973
    ld   a, $3D
    ld   [.label_2100], a
    call $4029
    ret

.label_0B0B
    push bc
    ld   b, a
    ld   a, [$FFFE]
    and  a
    jr   z, .label_0B17
    ld   a, b
    or   $20
    pop  bc
    ret

.label_0B17
    ld   a, b
    pop  bc
    ret
    ld   a, [$FFD7]
    ld   [.label_2100], a
    ld   a, $02
    ld   [$FF70], a
    call .label_2914
    xor  a
    ld   [$FF70], a
    ld   a, $20
    ld   [.label_2100], a
    ret

.label_0B2F
    ld   [$FFD9], a
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$DBA5]
    and  a
    ret  nz
    push bc
    ld   a, [$FFD9]
    and  $80
    jr   nz, .label_0B4B
    ld   a, $20
    ld   [.label_2100], a
    call $6E50
    jr   c, .label_0B54

.label_0B4B
    ld   b, [hl]
    ld   a, $02
    ld   [$FF70], a
    ld   [hl], b
    xor  a
    ld   [$FF70], a

.label_0B54
    ld   a, [$FFD9]
    and  $7F
    ld   [.label_2100], a
    pop  bc
    ret
    ld   [.label_2100], a
    call .label_2914
    ld   a, $28
    ld   [.label_2100], a
    ret
    push hl
    ld   [.label_2100], a
    ld   a, [$FFFE]
    and  a
    jr   z, .label_0B80
    ld   de, .label_0168
    add  hl, de
    ld   a, $01
    ld   [$FF4F], a
    call .label_0B96
    xor  a
    ld   [$FF4F], a

.label_0B80
    pop  hl
    push hl
    call .label_0B96
    pop  hl
    ld   a, [$DB95]
    cp   $0D
    jr   nz, .label_0B90
    call .label_0BB5

.label_0B90
    ld   a, [$FFE6]
    ld   [.label_2100], a
    ret

.label_0B96
    ld   de, $9800

.label_0B99
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, e
    and  $1F
    cp   $14
    jr   nz, .label_0B99
    ld   a, e
    add  a, $0C
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    cp   $9A
    jr   nz, .label_0B99
    ld   a, e
    cp   $40
    jr   nz, .label_0B99
    ret

.label_0BB5
    ld   bc, $0168
    ld   de, $D000
    jp   .label_2914
    push af
    call .label_2BCF
    jp   .label_0973
    ld   a, [$D16A]
    ld   [.label_2100], a

.label_0BCB
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  b
    jr   nz, .label_0BCB
    ld   a, $28
    ld   [.label_2100], a
    ret
    ld   a, [$DE01]
    ld   [.label_2100], a
    call .label_0BE7
    ld   a, [$DE04]
    ld   [.label_2100], a
    ret

.label_0BE7
    ld   a, [$DE02]
    ld   h, a
    ld   a, [$DE03]
    ld   l, a
    jp   [hl]
    ld   a, $02
    ld   [.label_2100], a
    call .label_1A50
    jp   .label_081D
    ld   hl, $C450
    jr   .label_0C08
    ld   hl, $C2F0
    jr   .label_0C08
    ld   hl, $C2E0

.label_0C08
    add  hl, bc
    ld   a, [hl]
    and  a
    ret
    ld   a, $AF
    call .label_3B86
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ret

.label_0C20
    ld   a, $1D
    ld   [$FFF2], a
    ret
    ld   hl, $4641
    jr   .label_0C2D
    ld   hl, $4741

.label_0C2D
    ld   a, $1C
    ld   [.label_2100], a
    add  hl, bc
    ld   a, [hl]
    ld   hl, $2100
    ld   [hl], $01
    ret
    ld   a, $0C
    ld   [.label_2100], a
    ld   bc, $0040
    call .label_2914
    ld   a, $01
    ld   [.label_2100], a
    ret
    ld   hl, $FFF4
    ld   [hl], $0C
    ld   hl, $C502
    ld   [hl], $04
    ret
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .label_0C5F
    dec  [hl]

.label_0C5F
    ret
    push af
    ld   a, [$C18F]
    and  a
    jr   nz, .label_0C7B
    ld   [$C1CF], a
    inc  a
    ld   [$C18F], a
    ld   [$C5A6], a
    ld   a, [$C19D]
    and  a
    jr   nz, .label_0C7B
    ld   a, $02
    ld   [$FFF2], a

.label_0C7B
    pop  af
    ret

.label_0C7D
    ld   a, $30
    ld   [$FFA8], a
    jr   .label_0C9A
    ld   a, $30
    ld   [$FFA8], a
    jr   .label_0C9E
    ld   a, [$D401]
    cp   $01
    jr   nz, .label_0C7D
    ld   a, [$DBA5]
    and  a
    jr   z, .label_0C7D
    ld   a, $01
    ld   [$FFBC], a

.label_0C9A
    ld   a, $06
    ld   [$FFF4], a

.label_0C9E
    ld   a, $03
    ld   [$C11C], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$D478], a
    and  a
    ret

.label_0CAF
    xor  a
    ld   [$C121], a
    ld   [$C122], a
    xor  a
    ld   [$C14B], a
    ld   [$C14A], a
    ret
    ld   a, [$FF9F]
    ld   [$FF98], a
    ld   a, [$FFA0]
    ld   [$FF99], a
    ret

.label_0CC7
    push af
    ld   e, $0F
    ld   d, $00

.label_0CCC
    ld   hl, $C510
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, .label_0CEC
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, .label_0CCC
    ld   hl, $C5C0
    dec  [hl]
    ld   a, [hl]
    cp   $FF
    jr   nz, .label_0CE8
    ld   a, $0F
    ld   [$C5C0], a

.label_0CE8
    ld   a, [$C5C0]
    ld   e, a

.label_0CEC
    pop  af
    ld   hl, $C510
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD8]
    ld   hl, $C540
    add  hl, de
    ld   [hl], a
    ld   a, [$FFD7]
    ld   hl, $C530
    add  hl, de
    ld   [hl], a
    ld   hl, $C520
    add  hl, de
    ld   [hl], $0F
    ret
    ld   a, [$C140]
    sub  a, $08
    ld   [$FFD7], a
    ld   a, [$C142]
    sub  a, $08
    ld   [$FFD8], a

.label_0D15
    ld   a, $07
    ld   [$FFF2], a
    ld   a, $05
    jp   .label_0CC7
    ld   a, $20
    ld   [.label_2100], a
    ld   a, [$DBA5]
    and  a
    jr   z, .label_0D59
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, $6EB3
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_0D3C
    ld   hl, $70B3
    jr   .label_0D45

.label_0D3C
    cp   $1A
    jr   nc, .label_0D45
    cp   $06
    jr   c, .label_0D45
    inc  h

.label_0D45
    add  hl, de
    ld   a, [$FF94]
    ld   e, a
    ld   a, [hl]
    cp   e
    jr   z, .label_0D57
    ld   [$FF94], a
    cp   $FF
    jr   z, .label_0D57
    ld   a, $01
    ld   [$FF90], a

.label_0D57
    jr   .label_0D91

.label_0D59
    ld   a, [$FFF6]
    cp   $07
    jr   nz, .label_0D60
    inc  a

.label_0D60
    ld   d, a
    db   $CB, $3F ; Need to handle this instruction 
    db   $CB, $3F ; Need to handle this instruction 
    and  $F8
    ld   e, a
    ld   a, d
    db   $CB, $3F ; Need to handle this instruction 
    and  $07
    or   e
    ld   e, a
    ld   d, $00
    ld   hl, $6E73
    add  hl, de
    ld   a, [$FF94]
    ld   e, a
    ld   a, [hl]
    cp   e
    jr   z, .label_0D91
    cp   $0F
    jr   z, .label_0D91
    cp   $1A
    jr   nz, .label_0D8B
    ld   a, [$FFF6]
    cp   $37
    jr   nz, .label_0D91
    ld   a, [hl]

.label_0D8B
    ld   [$FF94], a
    ld   a, $01
    ld   [$FF90], a

.label_0D91
    xor  a
    ld   [$FFD7], a
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, $70D3
    ld   a, [$DBA5]
    ld   d, a
    ld   a, [$FFF7]
    cp   $1A
    jr   nc, .label_0DAB
    cp   $06
    jr   c, .label_0DAB
    inc  d

.label_0DAB
    add  hl, de
    ld   e, [hl]
    ld   a, d
    and  a
    jr   z, .label_0DC1
    ld   a, [$FFF7]
    cp   $10
    jr   nz, .label_0DDB
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, .label_0DDB
    ld   e, $3D
    jr   .label_0DDB

.label_0DC1
    ld   a, e
    cp   $23
    jr   nz, .label_0DCE
    ld   a, [$D8C9]
    and  $20
    jr   z, .label_0DCE
    inc  e

.label_0DCE
    ld   a, e
    cp   $21
    jr   nz, .label_0DDB
    ld   a, [$D8FD]
    and  $20
    jr   z, .label_0DDB
    inc  e

.label_0DDB
    ld   d, $00
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_0DF1
    ld   a, $01
    ld   [$FF91], a
    jr   .label_0E31

.label_0DF1
    ld   hl, $73F3
    ld   a, [$DBA5]
    and  a
    jr   z, .label_0DFD
    ld   hl, $763B

.label_0DFD
    add  hl, de
    ld   d, $00
    ld   bc, $C193

.label_0E03
    ld   e, [hl]
    ld   a, [bc]
    cp   e
    jr   z, .label_0E29
    ld   a, e
    cp   $FF
    jr   z, .label_0E29
    ld   [bc], a
    ld   a, [$FFD7]
    and  a
    jr   z, .label_0E1E
    ld   a, d
    ld   [$C10D], a
    ld   a, $01
    ld   [$C10E], a
    jr   .label_0E29

.label_0E1E
    inc  a
    ld   [$FFD7], a
    ld   a, d
    ld   [$C197], a
    ld   a, $01
    ld   [$FF91], a

.label_0E29
    inc  hl
    inc  b
    inc  d
    ld   a, d
    cp   $04
    jr   nz, .label_0E03

.label_0E31
    jp   .label_081D

.label_0E34
    ld   a, [$DB95]
    cp   $07
    jr   c, .label_0E85
    cp   $0B
    jr   nz, .label_0E46
    ld   a, [$DB96]
    cp   $07
    jr   nz, .label_0E85

.label_0E46
    ld   a, [$C16B]
    cp   $04
    jr   nz, .label_0E85
    ld   a, [$C19F]
    ld   hl, $C167
    or   [hl]
    ld   hl, $C124
    or   [hl]
    jr   nz, .label_0E85
    ld   a, [$DB95]
    cp   $0C
    jr   nc, .label_0E85
    ld   a, [$FFCB]
    cp   $F0
    jr   nz, .label_0E85
    ld   a, [$D474]
    and  a
    jr   nz, .label_0E85
    ld   a, [$D464]
    and  a
    jr   nz, .label_0E85
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$C19F], a
    ld   [$DB96], a
    ld   a, $06
    ld   [$DB95], a

.label_0E85
    ld   a, [$DB95]
    rst  0
    rst  $18
    ld   c, $E2
    ld   c, $0E
    rrca
    ld   de, .label_140F
    rrca
    rl   a
    rrca
    rst  $10
    ld   c, $D1
    ld   c, $C5
    ld   c, $CB
    ld   c, $BF
    ld   c, $1A
    rrca
    dec  l
    rrca
    dec  [hl]
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    ld   b, b
    rrca
    call $6AF8
    jp   .label_101A
    call $67EE
    jp   .label_101A
    call $6203
    jp   .label_101A
    call $5626
    jp   .label_101A
    ld   a, $01
    call .label_080C
    jp   $4000
    jp   $6E1D
    ld   a, $17
    call .label_080C
    call $4AB7
    jp   .label_101A
    ld   a, $03
    ld   [.label_2100], a
    ld   a, $17

.label_0EF4
    push af
    call .label_398D
    pop  af
    jp   .label_080C
    ld   a, $03
    ld   [.label_2100], a
    ld   a, $01
    jr   .label_0EF4
    ld   a, $03
    ld   [.label_2100], a
    ld   a, $02
    jr   .label_0EF4
    jp   $47CE
    jp   $4A07
    jp   $4CFB
    jp   $4F8C
    ld   a, $14
    ld   [.label_2100], a
    call $4C4B
    call $4ABC
    ld   a, $01
    call .label_080C
    jp   $4371
    ld   a, $20
    call .label_080C
    jp   $5904
    ld   a, $28
    call .label_080C
    call $4000
    jp   .label_101A
    ld   a, $37
    call .label_080C
    jp   $4000
    ld   a, $02
    call .label_080C
    ld   a, [$C19F]
    and  a
    jr   nz, .label_0F8F
    ld   hl, $FFB4
    ld   a, [hl]
    and  a
    jr   z, .label_0F75
    ld   a, [$DB9A]
    cp   $80
    jr   nz, .label_0F75
    ld   a, [$C14F]
    and  a
    jr   nz, .label_0F75
    dec  [hl]
    jr   nz, .label_0F75
    ld   a, $01
    ld   [.label_2100], a
    call $61EE
    call .label_081D

.label_0F75
    ld   a, [$C19F]
    and  a
    jr   nz, .label_0F8F
    ld   a, [$C1BC]
    and  a
    jr   z, .label_0F8F
    ld   hl, $FFA1
    ld   [hl], $02
    dec  a
    ld   [$C1BC], a
    jr   nz, .label_0F8F
    jp   .label_0C7D

.label_0F8F
    ld   hl, $DBC7
    ld   a, [hl]
    and  a
    jr   z, .label_0F97
    dec  [hl]

.label_0F97
    ld   a, [$FF98]
    ld   [$FF9F], a
    ld   a, [$FF99]
    ld   [$FFA0], a
    ld   hl, $FFA2
    sub  a, [hl]
    ld   [$FFB3], a
    call $60E0
    xor  a
    ld   [$C140], a
    ld   [$C13C], a
    ld   [$C13B], a
    ld   hl, $C11D
    db   $CB, $BE ; Need to handle this instruction 
    ld   hl, $C11E
    db   $CB, $BE ; Need to handle this instruction 
    call $593B
    ld   a, $02
    call .label_080C
    call $78E8
    call .label_1033
    ld   a, [$C15C]
    ld   [$C3CF], a
    ld   a, $20
    ld   [.label_2100], a
    call $4B1F
    ld   a, $19
    call .label_080C
    call $7A9A
    call .label_398D
    ld   a, $02
    call .label_080C
    call $5487
    ld   hl, $D601
    ld   a, [$FFE7]
    and  $03
    or   [hl]
    jr   nz, .label_1012
    ld   a, [$C11C]
    cp   $02
    jr   nc, .label_1012
    ld   c, $01
    ld   b, $00

.label_1000
    ld   e, $00
    ld   a, [$FFE7]
    and  $04

.label_1006
    jr   z, .label_100A
    dec  c
    dec  e

.label_100A
    ld   a, $20
    ld   [.label_2100], a
    call $5C9C

.label_1012
    ld   a, $14
    call .label_080C
    call $54F8

.label_101A
    ld   a, $0F
    call .label_080C

.label_101F
    call .label_2321
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, $24
    call .label_080C
    jp   $7405
    ld   [$990E], sp
    jr   z, .label_101F

.label_1033
    ld   a, [$FF99]
    ld   hl, $FFA2
    sub  a, [hl]
    ld   [$C145], a
    ld   a, [$C1A9]
    and  a
    jr   z, .label_107F
    ld   a, [$C19F]
    and  a
    jr   nz, .label_106D
    ld   hl, $C1AA
    dec  [hl]
    ld   a, [hl]
    cp   $02
    jr   nz, .label_1061
    ld   a, [$C1A9]
    ld   e, a
    ld   d, $00
    ld   hl, $102D
    add  hl, de
    ld   a, [hl]
    call .label_2385
    ld   a, $01

.label_1061
    and  a
    jr   nz, .label_106D
    xor  a
    ld   [$C1A9], a
    ld   [$C1A8], a
    jr   .label_107F

.label_106D
    ld   a, [$C1A9]
    ld   [$C1A8], a
    dec  a
    rst  0
    cp   h
    ld   d, c
    rst  0
    ld   d, c
    rst  0
    ld   d, c
    rst  0
    ld   d, c
    cp   h
    ld   d, c

.label_107F
    ld   a, [$FFCB]
    and  $B0
    jr   nz, .label_10DB
    ld   a, [$FFCB]
    and  $40
    jr   z, .label_10DB
    ld   a, [$D45F]
    inc  a
    ld   [$D45F], a
    cp   $04
    jr   c, .label_10DF
    ld   a, [$FFA1]
    cp   $02
    jr   z, .label_10DB
    ld   a, [$FF9D]
    cp   $FF
    jr   z, .label_10DB
    ld   a, [$C11C]
    cp   $02
    jr   nc, .label_10DB
    ld   a, [$C19F]
    ld   hl, $C167
    or   [hl]
    ld   hl, $C124
    or   [hl]
    jr   nz, .label_10DB
    ld   a, [$D464]
    and  a
    jr   nz, .label_10DB
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    ld   a, $07
    ld   [$DB95], a
    ld   a, $02
    ld   [.label_2100], a
    call $755B
    call .label_1D2E
    call .label_398D
    pop  af
    ret

.label_10DB
    xor  a
    ld   [$D45F], a

.label_10DF
    ld   a, [$FFB7]
    and  a
    jr   z, .label_10E7
    dec  a
    ld   [$FFB7], a

.label_10E7
    ld   a, [$FFB6]
    and  a
    jr   z, .label_10EF
    dec  a
    ld   [$FFB6], a

.label_10EF
    ld   a, [$C19F]
    and  a
    jp   nz, .label_1794
    ld   a, [$C124]
    and  a
    jp   nz, .label_114F
    ld   a, [$C11C]
    cp   $07
    jr   z, .label_1138
    ld   a, [$DB5A]
    ld   hl, $C50A
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, .label_1135
    ld   a, $07
    ld   [$C11C], a
    ld   a, $BF
    ld   [$FFB7], a
    ld   a, $10
    ld   [$C3CC], a
    xor  a

.label_1120
    ld   [$DBC7], a
    ld   [$FF9C], a
    ld   [$DDD6], a
    ld   [$DDD7], a
    ld   [$D464], a
    call .label_27F2
    ld   a, $08
    ld   [$FFF3], a

.label_1135
    ld   a, [$C11C]

.label_1138
    rst  0
    ld   h, l
    ld   de, $4F30
    ld   h, b
    ld   c, c
    scf
    jr   .label_1120
    add  hl, de
    ld   l, l
    ld   c, [hl]
    call nc, $5D50
    ld   de, $5267
    ld   d, l
    ld   de, $50A3

.label_114F
    call .label_1794
    jp   .label_1D2E
    ld   a, $19
    call .label_080C
    jp   $5D6A
    ld   a, $01
    call .label_080C
    jp   $41C2
    ld   a, $36
    ld   [.label_2100], a
    call $725A
    and  a
    ret  z
    ld   a, $02
    call .label_080C
    jp   $4287
    ld   a, [$C50A]
    ld   hl, $C167
    or   [hl]
    ld   hl, $C1A4
    or   [hl]
    ret  nz
    ld   a, [$C14A]
    and  a
    jr   z, .label_11BC
    ld   a, [$DB01]
    cp   $01
    jr   z, .label_11AA
    ld   a, [$DB00]
    cp   $01
    jr   z, .label_11AA
    ld   a, [$DB01]
    cp   $04
    jr   z, .label_11A5
    ld   a, [$DB00]
    cp   $04
    jr   nz, .label_11BA

.label_11A5
    call .label_1340
    jr   .label_11BA

.label_11AA
    ld   a, [$C137]
    dec  a
    cp   $04
    jr   c, .label_11BA
    ld   a, $05
    ld   [$C137], a
    ld   [$C16A], a

.label_11BA
    jr   .label_11C3

.label_11BC
    xor  a
    ld   [$C15B], a
    ld   [$C15A], a

.label_11C3
    ld   a, [$C117]
    and  a
    jp   nz, .label_12ED
    ld   a, [$C15C]
    and  a
    jp   nz, .label_12ED
    ld   a, [$C137]
    and  a
    jr   z, .label_11E2
    cp   $03
    jr   nz, .label_11E2
    ld   a, [$C138]
    cp   $03
    jr   nc, .label_11E8

.label_11E2
    ld   a, [$FFA1]
    and  a
    jp   nz, .label_12ED

.label_11E8
    ld   a, [$DB00]
    cp   $08
    jr   nz, .label_11FE
    ld   a, [$FFCB]
    and  $20
    jr   z, .label_11FA
    call .label_1705
    jr   .label_11FE

.label_11FA
    xor  a
    ld   [$C14B], a

.label_11FE
    ld   a, [$DB01]
    cp   $08
    jr   nz, .label_1214
    ld   a, [$FFCB]
    and  $10
    jr   z, .label_1210
    call .label_1705

.label_120E
    jr   .label_1214

.label_1210
    xor  a
    ld   [$C14B], a

.label_1214
    ld   a, [$DB01]
    cp   $04
    jr   nz, .label_1235
    ld   a, [$DB44]
    ld   [$C15A], a
    ld   a, [$FFCB]
    and  $10
    jr   z, .label_1235
    ld   a, [$C1AD]
    cp   $01
    jr   z, .label_1235
    cp   $02
    jr   z, .label_1235
    call .label_1340

.label_1235
    ld   a, [$DB00]
    cp   $04
    jr   nz, .label_124B
    ld   a, [$DB44]
    ld   [$C15A], a
    ld   a, [$FFCB]
    and  $20
    jr   z, .label_124B
    call .label_1340

.label_124B
    ld   a, [$FFCC]
    and  $20
    jr   z, .label_125E
    ld   a, [$C1AD]
    cp   $02
    jr   z, .label_125E
    ld   a, [$DB00]
    call .label_129C

.label_125E
    ld   a, [$FFCC]
    and  $10
    jr   z, .label_1275
    ld   a, [$C1AD]
    cp   $01
    jr   z, .label_1275
    cp   $02
    jr   z, .label_1275
    ld   a, [$DB01]
    call .label_129C

.label_1275
    ld   a, [$FFCB]
    and  $20
    jr   z, .label_1281
    ld   a, [$DB00]
    call .label_1321

.label_1281
    ld   a, [$FFCB]
    and  $10
    jr   z, .label_128D
    ld   a, [$DB01]
    call .label_1321

.label_128D
    ld   a, $20
    ld   [.label_2100], a
    call $48CA
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret

.label_129C
    ld   c, a
    cp   $01
    jp   z, .label_1528
    cp   $04
    jp   z, .label_12EE
    cp   $02
    jp   z, .label_135A
    cp   $03
    jp   z, .label_1382
    cp   $05
    jp   z, .label_13BD
    cp   $0D
    jp   z, .label_1383
    cp   $06
    jp   z, .label_1319
    cp   $0A
    jp   z, .label_14CB
    cp   $09
    jp   z, $41FC
    cp   $0C
    jp   z, .label_148D
    cp   $0B
    jp   z, .label_12F8
    cp   $07
    jr   nz, .label_12ED
    ld   hl, $C137
    ld   a, [$C19B]
    or   [hl]
    jr   nz, .label_12ED
    ld   a, [$C14D]
    cp   $02
    jr   nc, .label_12ED
    ld   a, $8E
    ld   [$C19B], a

.label_12ED
    ret

.label_12EE
    ld   a, [$C144]
    and  a
    ret  nz
    ld   a, $16
    ld   [$FFF4], a
    ret

.label_12F8
    ld   a, [$C1C7]
    ld   hl, $C146
    or   [hl]
    ret  nz

.label_1300
    call $4D20
    jr   nc, .label_130B
    ld   a, $07
    ld   [$FFF2], a
    jr   .label_130F

.label_130B
    ld   a, $0E
    ld   [$FFF4], a

.label_130F
    ld   a, $01
    ld   [$C1C7], a
    xor  a
    ld   [$C1C8], a
    ret

.label_1319
    ld   a, [$C1A4]
    and  a
    ret  nz
    jp   $4254

.label_1321
    cp   $01
    ret  nz
    ld   hl, $C137
    ld   a, [$C1AD]
    and  $03
    or   [hl]
    ret  nz
    ld   a, [$C160]
    and  a
    ret  nz
    xor  a
    ld   [$C1AC], a
    ld   a, $05
    ld   [$C137], a
    ld   [$C5B0], a
    ret

.label_1340
    ld   a, $01
    ld   [$C15B], a
    ld   a, [$DB44]
    ld   [$C15A], a
    ld   a, $20
    ld   [.label_2100], a
    call $4B4A
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret

.label_135A
    ld   a, [$C14E]
    cp   $01
    ret  nc
    ld   a, [$DB4D]
    and  a
    jp   z, .label_0C20
    sub  a, $01
    daa
    ld   [$DB4D], a
    ld   a, $02
    call .label_142F
    ret  c
    ld   a, $20
    ld   [.label_2100], a
    call $4B81
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret

.label_1382
    ret

.label_1383
    ld   a, [$C14D]
    and  a

.label_1387
    ret  nz
    ld   a, $01
    call .label_142F
    ret  c
    ld   a, $20
    ld   [.label_2100], a
    call $4BFF
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret

.label_139D
    nop
    nop
    nop
    nop

.label_13A1
    nop
    nop
    nop
    nop

.label_13A5
    jr   nz, .label_1387
    nop
    nop

.label_13A9
    db   0, 0, $E0
.label_13AD
    jr   nz, .label_13DE
    nop
    nop
    ld   b, b
    ret  nz
    nop
    nop

.label_13B5
    nop
    nop
    ret  nc
    jr   nc, .label_13BA

.label_13BA
    nop
    ret  nz
    ld   b, b

.label_13BD
    ld   a, [$C14C]
    and  a
    ret  nz
    ld   a, [$C14D]
    cp   $02
    jr   nc, .label_142E
    ld   a, $10
    ld   [$C14C], a
    ld   a, [$DB45]
    and  a
    jp   z, .label_0C20
    sub  a, $01
    daa
    ld   [$DB45], a

.label_13DE
    call .label_157C
    ld   a, $00
    call .label_142F
    ret  c
    ld   a, e
    ld   [$C1C2], a
    ld   a, [$C1C0]
    and  a
    jr   z, .label_1401
    ld   a, [$C1C1]
    ld   c, a
    ld   b, d
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    xor  a
    jr   .label_1407

.label_1401
    ld   a, $0A
    ld   [$FFF4], a
    ld   a, $06

.label_1407
    ld   [$C1C0], a
    ld   a, [$FF9E]
    ld   c, a
    ld   b, $00

.label_140F
    ld   a, [$D47C]
    cp   $01
    jr   nz, .label_141A
    ld   a, c
    add  a, $04
    ld   c, a

.label_141A
    ld   hl, $13AD
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $13B5
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a

.label_142E
    ret

.label_142F
    call .label_3B86
    ret  c
    ld   a, $0C
    ld   [$C19B], a
    push bc
    ld   a, [$FF9E]
    ld   c, a
    ld   b, $00
    ld   hl, $139D
    add  hl, bc
    ld   a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, $13A1
    add  hl, bc
    ld   a, [$FF99]
    add  a, [hl]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ld   a, [$FFA2]
    inc  a
    ld   hl, $C310
    add  hl, de
    ld   [hl], a
    ld   hl, $13A5
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, $13A9
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a
    ld   a, [$FF9E]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, $C380
    add  hl, de
    ld   [hl], a
    ld   hl, $C5D0
    add  hl, de
    ld   [hl], a
    ld   hl, $C4F0
    add  hl, de
    ld   [hl], $01
    pop  bc
    scf
    ccf
    ret

.label_148D
    ld   a, [$C19B]
    and  a
    ret  nz
    ld   a, [$DB4B]
    and  a
    jr   z, .label_14A7
    ld   a, [$FFA2]
    and  a
    ret  nz
    ld   a, $02
    ld   [$C1A9], a
    ld   a, $2A
    ld   [$C1AA], a
    ret

.label_14A7
    ld   a, [$DB4C]
    and  a
    jp   z, .label_0C20
    ld   a, $08
    call .label_3B86
    ret  c
    ld   a, $20
    ld   [.label_2100], a
    call $4C47
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret

.label_14C3
    inc  e
    db   $E4 ; Undefined instruction
    nop
    nop

.label_14C7
    nop
    nop
    db   $E4 ; Undefined instruction
    inc  e

.label_14CB
    ld   a, [$C130]
    cp   $07
    ret  z
    ld   a, [$C146]
    and  a
    ret  nz
    ld   a, $01
    ld   [$C146], a
    xor  a
    ld   [$C152], a
    ld   [$C153], a
    ld   a, $0D
    ld   [$FFF2], a
    ld   a, [$FFF9]
    and  a
    jr   z, .label_1508
    call .label_1508
    ld   a, [$FFCB]
    and  $03
    ld   a, $EA
    jr   z, .label_14F8
    ld   a, $E8

.label_14F8
    ld   [$FF9B], a
    xor  a
    ld   [$FFA3], a
    call .label_21A8
    ld   a, $02
    call .label_080C
    jp   $6C75

.label_1508
    ld   a, $20
    ld   [$FFA3], a
    ld   a, [$C14A]
    and  a
    ret  z
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, $14C3
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, $14C7
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a

.label_1523
    ret

.label_1524
    db   $02, $14, $15, $16

.label_1528
    ld   a, [$C16D]
    ld   hl, $C121
    or   [hl]
    ret  nz
    ld   a, $03
    ld   [$C138], a

.label_1535
    ld   a, $01
    ld   [$C137], a
    ld   [$C5B0], a
    xor  a
    ld   [$C160], a
    ld   [$C1AC], a
    call .label_280D
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, $1524
    add  hl, de
    ld   a, [hl]
    ld   [$FFF4], a
    call .label_157C
    ld   a, [$C146]
    and  a
    jr   nz, .label_1562
    call .label_0CAF
    call .label_178E

.label_1562
    ld   a, [$C14D]
    and  a
    ret  nz
    ld   a, [$C5A9]
    and  a
    ret  z
    ld   a, [$DB4E]
    cp   $02
    ret  nz
    ld   a, $DF
    call .label_142F
    xor  a
    ld   [$C19B], a
    ret

.label_157C
    ld   a, [$FFCB]
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, $4905
    add  hl, de
    ld   a, [hl]
    cp   $0F
    jr   z, .label_158E
    ld   [$FF9E], a

.label_158E
    ret

.label_158F
    ld   d, $FA
    ld   [.label_1608], sp
    ld   d, $08
    ld   a, [$FAFA]
    ld   [.label_0816], sp
    ld   [.label_16FA], sp
    ld   [.label_1616], sp
    ld   d, $08
    ld   a, [$FAFA]
    call .label_15AF
    ld   a, $02
    jp   .label_080C

.label_15AF
    ld   a, [$C1C4]
    and  a
    ret  nz
    ld   a, [$C14A]
    and  a
    jr   nz, .label_15C0
    ld   a, [$C16A]
    cp   $05
    ret  z

.label_15C0
    ld   a, [$C121]
    and  a
    jr   z, .label_15CD
    ld   a, [$C136]
    add  a, $04
    jr   .label_15CF

.label_15CD
    ld   a, [$FF9E]

.label_15CF
    ld   e, a
    ld   d, $00
    ld   hl, $158F
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ld   [$FFCE], a
    db   $CB, $37 ; Need to handle this instruction 
    ld   c, a
    ld   hl, $159B
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   e, a
    ld   hl, $D711
    add  hl, de
    ld   a, h
    cp   $D7
    ret  nz
    push de
    ld   a, [hl]
    ld   [$FFAF], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call .label_2A26
    pop  de
    cp   $D0

.label_1608
    jp  c, .label_1610
    cp   $D4
    jp  c, .label_16C2

.label_1610
    db   $FE, $90, $D2, $C2, $16, $FE

.label_1616
    ld   bc, $C2CA
    ld   d, $E
    nop
    ld   a, [$DBA5]
    and  a
    ld   a, [$FFAF]
    jr   z, .label_1629
    cp   $DD
    jr   z, .label_1637
    ret

.label_1629
    inc  c
    cp   $D3
    jr   z, .label_1637
    cp   $5C
    jr   z, .label_1637
    cp   $0A
    ret  nz
    ld   c, $FF

.label_1637
    ld   a, c
    ld   [$FFF1], a
    call .label_2178
    ld   a, [$C14A]
    and  a
    jr   nz, .label_1653
    ld   a, [$C16A]
    cp   $05
    jr   nz, .label_1653
    xor  a
    ld   [$C122], a
    ld   a, $0C
    ld   [$C16D], a

.label_1653
    ld   a, $05
    call .label_142F
    jr   c, .label_167C
    xor  a
    ld   [$C19B], a
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFCE]
    add  a, $08
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFCD]
    add  a, $10
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ld   a, [$FFF1]
    ld   [hl], a
    ld   c, e
    ld   b, d
    call .label_3942

.label_167C
    call .label_280D
    and  $07
    ret  nz
    ld   a, [$FFAF]
    cp   $D3
    ret  z
    call .label_280D
    rra
    ld   a, $2E
    jr   nc, .label_1691
    ld   a, $2D

.label_1691
    call .label_3B86
    ret  c
    ld   hl, $C200
    add  hl, de
    ld   a, [$FFCE]
    add  a, $08
    ld   [hl], a
    ld   hl, $C210
    add  hl, de
    ld   a, [$FFCD]
    add  a, $10
    ld   [hl], a
    ld   hl, $C450
    add  hl, de
    ld   [hl], $80
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $18
    ld   hl, $C320
    add  hl, de
    ld   [hl], $10
    ret

.label_16BA
    ld   [de], a
    xor  $FC
    inc  b

.label_16BE
    inc  b
    inc  b
    xor  $12

.label_16C2
    ld   c, a
    ld   a, [$C16D]
    and  a
    ret  z
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, $16BA
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$FFD7], a
    ld   hl, $16BE
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   [$FFD8], a

.label_16DF
    ld   a, $04
    ld   [$C502], a
    call .label_0D15
    ld   a, $10
    ld   [$C1C4], a
    ld   a, c
    and  $F0
    cp   $90
    jr   z, .label_16F8
    ld   a, $07
    ld   [$FFF2], a
    ret

.label_16F8
    ld   a, $17

.label_16FA
    ld   [$FFF4], a
    ret

.label_16FD
    jr   nz, .label_16DF
    nop
    nop

.label_1701
    nop
    nop
    ld   [$FF20], a

.label_1705
    ld   a, [$FFF9]
    and  a
    jr   z, .label_1713
    ld   a, [$FF9C]
    and  a
    ret  nz
    ld   a, [$FF9E]
    and  $02
    ret  nz

.label_1713
    ld   a, [$C14A]
    and  a
    ret  nz
    ld   a, [$FFA2]
    ld   hl, $C146
    or   [hl]
    ret  nz
    ld   a, [$C120]
    add  a, $02
    ld   [$C120], a
    call .label_1756
    ld   a, [$C14B]
    inc  a
    ld   [$C14B], a
    cp   $20
    ret  nz
    ld   [$C14A], a
    xor  a
    ld   [$C121], a
    ld   [$C122], a
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, $16FD
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, $1701
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a
    xor  a
    ld   [$C1AC], a
    ret

.label_1756
    ld   a, [$FFE7]
    and  $07
    ld   hl, $FFA2
    or   [hl]
    ld   hl, $FFA1
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ret  nz
    ld   a, [$FF98]
    ld   [$FFD7], a
    ld   a, [$C181]
    cp   $05
    jr   z, .label_1781
    ld   a, $07
    ld   [$FFF4], a
    ld   a, [$FF99]
    add  a, $06
    ld   [$FFD8], a
    ld   a, $0B
    jp   .label_0CC7

.label_1781
    ld   a, [$FF99]
    ld   [$FFD8], a
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, $0C
    jp   .label_0CC7

.label_178E
    xor  a
    ld   [$FF9A], a
    ld   [$FF9B], a
    ret

.label_1794
    call $753A
    ld   a, [$C11C]
    cp   $01
    ret  z
    ld   a, [$C16A]
    and  a
    jr   z, .label_17DB
    ld   bc, $C010
    ld   a, [$C145]
    ld   hl, $C13B
    add  a, [hl]
    ld   [$FFD7], a
    ld   a, [$FF98]
    ld   [$FFD8], a
    ld   hl, $FFDA
    ld   [hl], $00
    ld   a, [$C122]
    cp   $28
    jr   c, .label_17C6
    ld   a, [$FFE7]
    rl   a
    rl   a
    and  $10
    ld   [hl], a

.label_17C6
    ld   a, [$C139]
    ld   h, a
    ld   a, [$C13A]
    ld   l, a
    ld   a, [$C136]
    ld   [$FFD9], a
    ld   a, [$FF99]
    cp   $88
    ret  nc
    jp   .label_1819

.label_17DB
    ld   a, [$C19B]
    push af
    db   $CB, $7F ; Need to handle this instruction 
    jp   z, .label_1814
    ld   a, $02
    call .label_080C
    call $5310
    ld   a, [$C19B]
    and  $7F
    cp   $0C
    jr   nz, .label_1814
    ld   hl, $C19F
    ld   a, [$C124]
    or   [hl]
    jr   nz, .label_1814
    call .label_157C
    ld   a, $04
    call .label_142F
    jr   c, .label_1814
    ld   a, $0D
    ld   [$FFF4], a
    ld   a, $02
    call .label_080C
    call $538B

.label_1814
    pop  af
    ld   [$C19B], a
    ret

.label_1819
    ld   a, $20
    ld   [.label_2100], a
    call $4AB3
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret
    ld   a, $20
    ld   [.label_2100], a
    call $49BA
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret
    call $754F
    ld   a, [$C3C9]
    and  a
    jr   z, .label_1847
    xor  a
    ld   [$C3C9], a
    jp   .label_0C7D

.label_1847
    call .label_1A22
    xor  a
    ld   [$C157], a
    inc  a
    ld   [$C1A8], a
    ld   a, [$C16B]
    cp   $04
    jp   nz, .label_19D9
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$FFB4], a
    ld   [$DDD6], a
    ld   [$DDD7], a
    ld   e, $10
    ld   hl, $C280

.label_186C
    ldi  [hl], a
    dec  e
    jr   nz, .label_186C
    ld   a, [$C509]
    and  a
    jr   z, .label_1898
    push af
    ld   a, $04
    call .label_080C
    pop  af
    call $7A5F
    ld   hl, $DB6E
    inc  [hl]
    ld   hl, $DB46
    inc  [hl]
    ld   a, [$DC0C]
    or   $40
    ld   [$DC0C], a
    ld   a, $01
    ld   [$D47E], a
    xor  a
    ld   [$FF9D], a

.label_1898
    ld   a, [$FFF9]
    ld   [$FFE4], a
    ld   a, $0B
    ld   [$DB95], a
    xor  a
    ld   [$DB96], a
    ld   [$C3CB], a
    ld   [$FFF9], a
    ld   hl, $D401
    ld   a, [$DBA5]
    ld   [$FFE6], a
    and  a
    jr   nz, .label_18DF
    ld   hl, $D416
    ld   c, $00

.label_18BA
    ld   a, [$FF98]
    db   $CB, $37 ; Need to handle this instruction 
    and  $0F
    ld   e, a
    ld   a, [$FF99]
    sub  a, $08
    and  $F0
    or   e
    cp   [hl]
    jr   z, .label_18D2
    inc  hl
    inc  c
    ld   a, c
    cp   $04
    jr   nz, .label_18BA

.label_18D2
    ld   a, c
    db   $CB, $27 ; Need to handle this instruction 
    db   $CB, $27 ; Need to handle this instruction 
    add  a, c
    ld   e, a
    ld   d, $00
    ld   hl, $D401
    add  hl, de

.label_18DF
    push hl
    ld   a, [hli]
    ld   [$DBA5], a
    cp   $02
    jr   nz, .label_18F2
    ld   [$FFF9], a
    dec  a
    ld   [$DBA5], a
    ld   a, $01
    ld   [$FF9C], a

.label_18F2
    ld   a, [hli]
    ld   [$FFF7], a
    ld   a, [$DBA5]
    and  a
    ld   a, [hli]
    ld   [$FFF6], a
    jr   nz, .label_1909
    ld   a, [$FFE6]
    and  a
    jr   z, .label_1907
    xor  a
    ld   [$D47C], a

.label_1907
    jr   .label_196F

.label_1909
    ld   c, a
    ld   a, $14
    call .label_080C
    push hl
    ld   a, [$FFF7]
    db   $CB, $37 ; Need to handle this instruction 
    ld   e, a
    ld   d, $00
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    ld   hl, $4220
    add  hl, de
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_192E
    ld   hl, $44E0
    jr   .label_193C

.label_192E
    cp   $06
    jr   nz, .label_193C
    ld   a, [$DB6B]
    and  $04
    jr   z, .label_193C
    ld   hl, $4520

.label_193C
    ld   e, $00

.label_193E
    ld   a, [hli]
    cp   c
    jr   z, .label_1948
    inc  e
    ld   a, e
    cp   $40
    jr   nz, .label_193E

.label_1948
    ld   a, e
    ld   [$DBAE], a
    ld   a, [$FFE6]
    and  a
    jr   nz, .label_196E
    xor  a
    ld   [$D47C], a
    ld   a, [$FFF7]
    cp   $0A
    jr   nc, .label_196E
    ld   a, $02
    call .label_080C
    call $6709
    ld   a, $30
    ld   [$FFB4], a
    xor  a
    ld   [$D6FB], a
    ld   [$D6F8], a

.label_196E
    pop  hl

.label_196F
    ld   a, [hli]
    ld   [$DB9D], a
    ld   a, [hl]
    ld   [$DB9E], a
    pop  hl
    ld   a, [$FFF9]
    and  a
    jr   nz, .label_19DA
    ld   a, [$FFE4]
    and  a
    jr   nz, .label_19D9
    ld   a, [$DBA5]
    and  a
    jr   z, .label_19C2
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_1993
    ld   hl, $4E3C
    jr   .label_19A4

.label_1993
    cp   $0A
    jr   nc, .label_19C2
    ld   e, a
    db   $CB, $27 ; Need to handle this instruction 
    db   $CB, $27 ; Need to handle this instruction 
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, $4DF1
    add  hl, de

.label_19A4
    ld   a, $14
    ld   [.label_2100], a
    call .label_19C2
    push de
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_19B7
    ld   a, $3A
    jr   .label_19BF

.label_19B7
    ld   e, a
    ld   d, $00
    ld   hl, $4E41
    add  hl, de
    ld   a, [hl]

.label_19BF
    pop  de
    ld   [de], a
    ret

.label_19C2
    ld   a, $00
    ld   [$FFD7], a
    ld   de, $DB5F

.label_19C9
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [$FFD7]
    inc  a
    ld   [$FFD7], a
    cp   $05
    jr   nz, .label_19C9
    ld   a, [$DBAE]
    ld   [de], a

.label_19D9
    ret

.label_19DA
    xor  a
    ld   [$FF9E], a
    ret
    call $754F
    ld   a, [$D474]
    and  a
    jr   z, .label_19FC
    xor  a
    ld   [$D474], a
    ld   a, $30
    ld   [$C180], a
    ld   a, $03
    ld   [$C17F], a
    ld   a, $04
    ld   [$C16B], a
    jr   .label_1A06

.label_19FC
    call .label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, .label_1A21

.label_1A06
    ld   a, [$D463]
    cp   $01
    jr   z, .label_1A0F
    ld   a, $00

.label_1A0F
    ld   [$C11C], a
    ld   a, [$D47E]
    and  a
    jr   z, .label_1A21
    xor  a
    ld   [$D47E], a
    ld   a, $36
    jp   .label_2385

.label_1A21
    ret

.label_1A22
    ld   a, $20
    ld   [.label_2100], a
    call $6C4F
    ld   a, $20
    ld   [.label_2100], a
    call $55CA
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret

.label_1A39
    ld   a, $20
    ld   [.label_2100], a
    call $6C7A
    ld   a, $20
    ld   [.label_2100], a
    call $563B
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret

.label_1A50
    ld   a, [$C120]
    db   $CB, $2F ; Need to handle this instruction 
    db   $CB, $2F ; Need to handle this instruction 
    db   $CB, $2F ; Need to handle this instruction 
    and  $01
    ld   d, a
    ld   a, [$FF9E]
    db   $CB, $27 ; Need to handle this instruction 
    or   d
    ld   c, a
    ld   b, $00
    ld   hl, $4948
    ld   a, [$C11C]
    cp   $01
    jr   nz, .label_1A78
    ld   a, [$FF9C]
    and  a
    jr   z, .label_1A76
    ld   hl, $4950

.label_1A76
    jr   .label_1AC7

.label_1A78
    ld   a, [$FFF9]
    and  a
    jr   z, .label_1A88
    ld   a, [$FF9C]
    cp   $02
    jr   nz, .label_1A88
    ld   hl, $4958
    jr   .label_1AC7

.label_1A88
    ld   a, [$C15C]
    cp   $01
    jr   z, .label_1AC4
    ld   a, [$FFB2]
    and  a
    jr   nz, .label_1A9A
    ld   a, [$C144]
    and  a
    jr   nz, .label_1ABF

.label_1A9A
    ld   a, [$C15A]
    and  a
    jr   nz, .label_1AA5
    ld   hl, $4910
    jr   .label_1AC7

.label_1AA5
    ld   hl, $4918
    cp   $02
    jr   nz, .label_1AAF
    ld   hl, $4928

.label_1AAF
    ld   a, [$C15B]
    and  a
    jr   z, .label_1ABD
    ld   a, l
    add  a, $08
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a

.label_1ABD
    jr   .label_1AC7

.label_1ABF
    ld   hl, $4938
    jr   .label_1AC7

.label_1AC4
    ld   hl, $4940

.label_1AC7
    add  hl, bc
    ld   a, [hl]
    ld   [$FF9D], a
    ret

.label_1ACC
    ld   a, [$D601]
    and  a
    ret  nz
    ld   a, $10
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $6500
    ld   de, $9500
    ld   a, [$FFE7]
    and  $0F
    jr   z, .label_1AEB
    cp   $08
    ret  nz
    ld   l, $40
    ld   e, l

.label_1AEB
    ld   a, [$FFE7]
    and  $30
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    add  hl, bc
    ld   bc, $0040
    jp   .label_2914
    jr   nz, .label_1B67
    and  b
    ld   [$FFE0], a
    ld   [$FFA0], a
    ld   h, b

.label_1B0D
    ld   a, [$DB95]
    cp   $09
    jr   z, .label_1ACC
    cp   $00
    jr   nz, .label_1B46
    ld   a, [$D601]
    and  a
    jp   nz, .label_1B45
    ld   a, [$FFE7]
    and  $0F
    cp   $04
    jr   c, .label_1B45
    ld   a, $10
    call .label_0B0B
    ld   [.label_2100], a
    ld   a, [$D006]
    ld   l, a
    ld   a, [$D007]
    ld   h, a
    ld   a, [$D008]
    ld   e, a
    ld   a, [$D009]
    ld   d, a
    ld   bc, $0020
    jp   .label_2914

.label_1B45
    ret

.label_1B46
    ld   a, [$DB95]
    cp   $01
    jr   nz, .label_1B53
    ld   a, [$FFA5]
    and  a
    jr   nz, .label_1B82
    ret

.label_1B53
    cp   $0B
    jp  c, .label_1DE8
    ld   a, [$DB9A]
    cp   $80
    jp   nz, .label_1DE8
    ld   a, [$C14F]
    and  a
    jp   nz, .label_1D2E

.label_1B67
    ld   hl, $C124
    ld   a, [$D601]
    or   [hl]
    jp   nz, .label_1D2E
    ld   a, [$D6F8]
    and  a
    jr   z, .label_1B7D
    call .label_1ED7
    jp   .label_1D2E

.label_1B7D
    ld   a, [$FFA5]
    and  a
    jr   z, .label_1BCD

.label_1B82
    cp   $01
    jp   z, .label_3F93
    cp   $02
    jp   z, .label_3FA9
    cp   $03
    jp   z, .label_1EB5
    cp   $04
    jp   z, .label_1EBC
    cp   $08
    jp   z, .label_1E69
    cp   $09
    jp   z, .label_1EA1
    cp   $0A
    jp   z, .label_1E2B
    cp   $0B
    jp   z, .label_1E8D
    cp   $0C
    jp   z, .label_1E33
    cp   $0D
    jp   z, .label_1E01
    cp   $0E
    jr   z, .label_1BC5
    cp   $0F
    jp   z, .label_1DF0
    cp   $10
    jp   z, .label_1DE9
    jp   .label_1D2E

.label_1BC5
    ld   a, $17
    ld   [.label_2100], a
    jp   $4062

.label_1BCD
    ld   a, [$FFA6]
    inc  a
    ld   [$FFA6], a

.label_1BD2
    ld   a, [$FFA4]
    rst  0
    ld   e, $1D
    ld   sp, hl
    dec  de
    ld   d, $1C
    ld   a, [de]
    inc  e
    add  hl, sp
    inc  e
    adc  a, d
    inc  e
    adc  a, [hl]
    inc  e
    xor  c
    inc  e
    add  a, $1C
    push de
    inc  e
    db   $E4 ; Undefined instruction
    inc  e
    ldi  [hl], a
    inc  e
    ld   e, $1C
    rst  $28
    inc  e
    ei
    inc  e
    di
    inc  e
    rst  $30
    inc  e
    rst  $38
    inc  e
    ld   a, [$FFA6]
    and  $07
    jp   nz, .label_1D1E
    ld   a, $01
    ld   [.label_2100], a
    call $61AA
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    jp   .label_1D2E

.label_1C13
    ld   l, a
    jr   .label_1C51
    ld   h, $6B
    jr   .label_1C24
    ld   h, $6C
    jr   .label_1C24
    ld   h, $73
    jr   .label_1C24
    ld   h, $6A

.label_1C24
    ld   a, [$FFA6]
    and  $0F
    jp   nz, .label_1D1E
    call .label_1CE8
    jp   .label_1C13

.label_1C31
    nop
    ld   b, b
    add  a, b
    ret  nz
    ret  nz
    ret  nz
    add  a, b
    ld   b, b

.label_1C39
    ld   a, [$FFA6]
    and  $07
    jp   nz, .label_1D1E
    ld   a, [$FFA6]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, $1C31
    add  hl, de
    ld   l, [hl]
    ld   h, $6D

.label_1C51
    ld   de, $96C0

.label_1C54
    ld   bc, $0040
    call .label_2914
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_1C87
    ld   a, $20
    ld   [.label_2100], a
    ld   b, $01
    call $47F7
    jr   z, .label_1C72
    ld   [.label_2100], a
    call .label_2914

.label_1C72
    ld   a, $20
    ld   [.label_2100], a
    ld   b, $00
    call $47F7
    jr   z, .label_1C87
    ld   [.label_2100], a
    ld   de, $96C0
    call .label_2914

.label_1C87
    jp   .label_1D2E
    ld   h, $6E
    jr   .label_1C24
    ld   a, [$FFA6]
    and  $07
    jp   nz, .label_1D1E
    ld   a, [$FFA6]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, $1C31
    add  hl, de
    ld   l, [hl]
    ld   h, $6F
    jp   .label_1C51
    ld   hl, $DCC0
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_1CB8
    ld   de, $8400
    jp   .label_1C54

.label_1CB8
    ld   a, [$FFA6]
    inc  a
    and  $03
    jp   nz, .label_1C39
    ld   de, $90C0
    jp   .label_1C54
    ld   h, $70

.label_1CC8
    ld   a, [$FFA6]
    and  $07
    jp   nz, .label_1D1E
    call .label_1CE8
    jp   .label_1C13
    ld   h, $71

.label_1CD7
    ld   a, [$FFA6]
    and  $03
    jp   nz, .label_1D1E
    call .label_1CE8
    jp   .label_1C13
    ld   h, $72
    jr   .label_1CD7

.label_1CE8
    ld   a, [$FFA7]
    add  a, $40
    ld   [$FFA7], a
    ret
    ld   h, $75
    jr   .label_1CD7
    ld   h, $74
    jr   .label_1CC8
    ld   h, $77
    jr   .label_1CC8
    ld   h, $76
    jr   .label_1CC8
    ld   a, $38
    ld   [.label_2100], a
    call $7830
    jp   .label_1D2E
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a

.label_1D12
    ld   a, [bc]
    inc  b
    ldi  [hl], a
    dec  d
    jr   nz, .label_1D12
    ld   a, $20
    ld   [.label_2100], a
    ret

.label_1D1E
    ld   a, $20
    ld   [.label_2100], a
    call $54F5
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a

.label_1D2E
    ld   a, [$FF9D]
    inc  a
    ret  z
    ld   a, [$FFFE]
    and  a
    jr   z, .label_1D42
    ld   a, [$DBC7]
    and  $04
    jr   z, .label_1D49
    ld   a, $04
    jr   .label_1D49

.label_1D42
    ld   a, [$DBC7]
    rl   a
    rl   a
    and  $10

.label_1D49
    ld   [$C135], a
    ld   hl, $C008
    ld   a, [$C13B]
    ld   c, a
    ld   a, [$C145]
    add  a, c
    cp   $88
    ret  nc
    push af
    ldi  [hl], a
    ld   a, [$C13C]
    ld   c, a
    ld   a, [$FF98]
    add  a, c
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, [$C135]
    ld   d, a
    ld   a, [$C11D]
    or   d
    ld   [hl], a
    ld   a, [$FFFE]
    and  a
    jr   z, .label_1DA1
    ld   a, [$DBC7]
    and  $04
    jr   nz, .label_1DA1
    ld   a, [$FF9D]
    cp   $50
    jr   c, .label_1D8C
    cp   $55
    jr   nc, .label_1D8C
    ld   a, [hl]
    or   $07
    ld   [hl], a
    jr   .label_1DA1

.label_1D8C
    ld   a, [$DC0F]
    and  a
    jr   z, .label_1D95
    inc  a
    or   [hl]
    ld   [hl], a

.label_1D95
    ld   a, [$FF9D]
    cp   $4E
    jr   z, .label_1D9F
    cp   $4F
    jr   nz, .label_1DA1

.label_1D9F
    ld   [hl], $03

.label_1DA1
    inc  hl
    pop  af
    ldi  [hl], a
    ld   a, [$FF98]
    add  a, c
    add  a, $08
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, [$C135]
    ld   d, a
    ld   a, [$C11E]
    or   d
    ld   [hl], a
    ld   a, [$FFFE]
    and  a
    jr   z, .label_1DE7
    ld   a, [$DBC7]
    and  $04
    jr   nz, .label_1DE7
    ld   a, [$FF9D]
    cp   $50
    jr   c, .label_1DD2
    cp   $55
    jr   nc, .label_1DD2
    ld   a, [hl]
    or   $07
    ld   [hl], a
    jr   .label_1DE7

.label_1DD2
    ld   a, [$DC0F]
    and  a
    jr   z, .label_1DDB
    inc  a
    or   [hl]
    ld   [hl], a

.label_1DDB
    ld   a, [$FF9D]
    cp   $4E
    jr   z, .label_1DE5
    cp   $4F
    jr   nz, .label_1DE7

.label_1DE5
    ld   [hl], $23

.label_1DE7
    inc  hl

.label_1DE8
    ret

.label_1DE9
    ld   hl, $4F00
    ld   a, $0E
    jr   .label_1DF5

.label_1DF0
    ld   a, $12
    ld   hl, $6080

.label_1DF5
    ld   [.label_2100], a
    ld   de, $8400
    ld   bc, $0040
    jp   .label_1F3B

.label_1E01
    ld   a, [$DB0E]
    cp   $02
    jp  c, .label_1F3E
    sub  a, $02
    ld   d, a
    ld   e, $00
    db   $CB, $2A ; Need to handle this instruction 
    db   $CB, $1B ; Need to handle this instruction 
    db   $CB, $2A ; Need to handle this instruction 
    db   $CB, $1B ; Need to handle this instruction 
    ld   hl, $4400
    add  hl, de
    ld   de, $89A0
    ld   bc, $0040
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    jp   .label_1F3B

.label_1E2B
    ld   hl, $68C0
    ld   de, $88E0
    jr   .label_1EA7

.label_1E33
    ld   a, $11
    call .label_0B0B
    ld   [.label_2100], a
    ld   a, [$D000]
    db   $CB, $37 ; Need to handle this instruction 
    and  $F0
    ld   e, a
    ld   d, $00
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    ld   hl, $8D00
    add  hl, de
    push hl
    ld   hl, $5000

.label_1E55
    add  hl, de
    pop  de
    ld   bc, $0040
    call .label_2914
    xor  a
    ld   [$FFA5], a
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    ret

.label_1E69
    ld   a, $13
    call .label_0B0B
    ld   [.label_2100], a
    ld   a, [$D000]
    db   $CB, $37 ; Need to handle this instruction 
    and  $F0
    ld   e, a
    ld   d, $00
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    ld   hl, $8D00
    add  hl, de
    push hl
    ld   hl, $4D00
    jr   .label_1E55

.label_1E8D
    ld   hl, $48E0
    ld   de, $88E0
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    ld   bc, $0020
    jp   .label_1F3B

.label_1EA1
    ld   hl, $68E0
    ld   de, $8CA0

.label_1EA7
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    ld   bc, $0020
    jp   .label_1F3B

.label_1EB5
    ld   hl, $7F00
    ld   a, $12
    jr   .label_1EC1

.label_1EBC
    ld   hl, $4C40
    ld   a, $0D

.label_1EC1
    call .label_0B0B
    ld   [.label_2100], a
    ld   de, $9140
    jp   .label_1F38

.label_1ECD
    ld   b, b
    ld   l, b
    ld   b, b
    ld   l, b

.label_1ED1
    nop
    ld   l, b

.label_1ED3
    add  a, b
    ld   l, b
    nop
    ld   l, b

.label_1ED7
    push af
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    pop  af
    ld   hl, $FFA1
    ld   [hl], $01
    ld   hl, $D6FB
    ld   e, [hl]
    ld   d, $00
    inc  a
    cp   $03
    jr   nz, .label_1EFB
    push af
    ld   a, [$D6FB]
    xor  $02
    ld   [$D6FB], a
    pop  af

.label_1EFB
    ld   [$D6F8], a
    cp   $04

.label_1F00
    jr   nz, .label_1F07
    ld   hl, $1ECD
    jr   .label_1F0E

.label_1F07
    cp   $08
    jr   nz, .label_1F14
    ld   hl, $1ED1

.label_1F0E
    add  hl, de
    ld   de, $9040
    jr   .label_1F2C

.label_1F14
    cp   $06
    jr   nz, .label_1F1D
    ld   hl, $1ECD
    jr   .label_1F28

.label_1F1D
    cp   $0A
    jr   nz, .label_1F35
    xor  a
    ld   [$D6F8], a
    ld   hl, $1ED3

.label_1F28
    add  hl, de
    ld   de, $9080

.label_1F2C
    ld   bc, $0040
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    jp   .label_2914

.label_1F35
    jp   .label_1D2E

.label_1F38
    ld   bc, $0040

.label_1F3B
    call .label_2914

.label_1F3E
    xor  a
    ld   [$FFA5], a
    ld   a, $0C
    ld   [.label_2100], a
    jp   .label_1D2E

.label_1F49
    db   $C, 3, 8, 8, $A, $A, 5, $10, $36, $38, $3A, $3C

.label_1F55
    db   2, 1, 8, 4

.label_1F59
    db   $FC, 4, 0, 0

.label_1F5D
    db   0, 0, 4, 0

.label_1F61
    call .label_1F69
    ld   a, $02
    jp   .label_080C

.label_1F69
    ld   hl, $C14A
    ld   a, [$C15C]
    or   [hl]
    ld   hl, $FFA2
    or   [hl]
    ld   hl, $C11C
    or   [hl]
    jp   nz, .label_2177
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, $1F49
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ld   [$FFCE], a
    db   $CB, $37 ; Need to handle this instruction 
    ld   c, a
    ld   hl, $1F4D
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   e, a
    ld   [$FFD8], a
    ld   hl, $D711
    add  hl, de
    ld   a, h
    cp   $D7
    jp   nz, .label_214E
    ld   a, [hl]
    ld   [$FFD7], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call .label_2A26
    ld   [$FFDC], a
    ld   a, [$FFD7]
    cp   $9A
    jr   z, .label_1FFE
    ld   a, [$FFDC]
    cp   $00
    jp   z, .label_214E
    cp   $01
    jr   z, .label_1FE6
    cp   $50
    jp   z, .label_214E
    cp   $51
    jp   z, .label_214E
    cp   $11
    jp  c, .label_214E
    cp   $D4
    jp   nc, .label_214E
    cp   $D0
    jr   nc, .label_1FE6
    cp   $7C
    jp   nc, .label_214E

.label_1FE6
    ld   a, [$FFD7]
    ld   e, a
    cp   $6F
    jr   z, .label_1FF6
    cp   $5E
    jr   z, .label_1FF6
    cp   $D4
    jp   nz, .label_2098

.label_1FF6
    ld   a, [$DBA5]
    and  a
    ld   a, e
    jp   nz, .label_2098

.label_1FFE
    ld   e, a
    ld   a, [$FF9E]
    cp   $02
    jp   nz, .label_20CF
    ld   a, $02
    ld   [$C1AD], a
    ld   a, [$FFCC]
    and  $30
    jp   z, .label_20CF
    ld   a, e
    cp   $5E
    ld   a, $8E
    jr   z, .label_2088
    ld   a, e
    cp   $6F
    jr   z, .label_2049
    cp   $D4
    jr   z, .label_2049
    ld   a, [$DB73]
    and  a
    jr   z, .label_2030
    ld   a, $78
    call .label_237C
    jp   .label_20CF

.label_2030
    ld   a, [$DB4E]
    and  a
    ld   a, [$FFF6]
    jr   nz, .label_203E
    ld   e, $FF
    cp   $A3
    jr   z, .label_2046

.label_203E
    ld   e, $FC
    cp   $FA
    jr   z, .label_2046
    ld   e, $FD

.label_2046
    ld   a, e
    jr   .label_208E

.label_2049
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   a, $14
    ld   [.label_2100], a
    ld   hl, $5118
    add  hl, de
    ld   a, [$DB49]
    ld   e, a
    ld   a, [hl]
    cp   $A9
    jr   nz, .label_2066
    db   $CB, $43 ; Need to handle this instruction 
    jr   z, .label_2066
    ld   a, $AF

.label_2066
    cp   $AF
    jr   nz, .label_2080
    db   $CB, $43 ; Need to handle this instruction 
    jr   nz, .label_2080
    ld   a, [$FFCE]
    db   $CB, $37 ; Need to handle this instruction 
    and  $0F
    ld   e, a
    ld   a, [$FFCD]
    and  $F0
    or   e
    ld   [$D473], a
    jp   .label_20CF

.label_2080
    cp   $83
    jr   z, .label_208E
    cp   $2D
    jr   z, .label_2093

.label_2088
    call .label_2373
    jp   .label_20CF

.label_208E
    call .label_2385
    jr   .label_20CF

.label_2093
    call .label_237C
    jr   .label_20CF

.label_2098
    cp   $A0
    jr   nz, .label_20CF
    ld   a, [$C18E]
    and  $1F
    cp   $0D
    jr   z, .label_20CF
    ld   a, [$FF9E]
    cp   $02
    jr   nz, .label_20CF
    ld   [$C1AD], a
    ld   a, [$FFCC]
    and  $30
    jr   z, .label_20CF
    ld   a, [$FFF9]
    and  a
    jr   nz, .label_20BF
    ld   a, [$FF9E]
    cp   $02
    jr   nz, .label_20CF

.label_20BF
    ld   a, $14
    ld   [.label_2100], a
    call $5900
    ld   a, $02
    ld   [.label_2100], a
    call $41D0

.label_20CF
    ld   a, [$DB00]
    cp   $03
    jr   nz, .label_20DD
    ld   a, [$FFCB]
    and  $20
    jr   nz, .label_20EC
    ret

.label_20DD
    ld   a, [$DB01]
    cp   $03
    jp   nz, .label_2177
    ld   a, [$FFCB]
    and  $10
    jp   z, .label_2177

.label_20EC
    ld   a, $02
    ld   [.label_2100], a
    call $48B0
    ld   a, $01
    ld   [$FFA1], a
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, $1F51

.label_2100
    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    ld   hl, $1F55
    add  hl, de
    ld   a, [$FFCB]
    and  [hl]
    jr   z, .label_214E
    ld   hl, $1F59
    add  hl, de
    ld   a, [hl]
    ld   [$C13C], a
    ld   hl, $1F5D
    add  hl, de
    ld   a, [hl]
    ld   [$C13B], a
    ld   hl, $FF9D
    inc  [hl]
    ld   e, $08
    ld   a, [$D47C]
    cp   $01
    jr   nz, .label_212C
    ld   e, $03

.label_212C
    ld   hl, $C15F
    inc  [hl]
    ld   a, [hl]
    cp   e
    jr   c, .label_214D
    xor  a
    ld   [$FFE5], a
    ld   a, [$FFD7]
    cp   $8E
    jr   z, .label_2153
    cp   $20
    jr   z, .label_2153
    ld   a, [$DBA5]
    and  a
    jr   nz, .label_214D
    ld   a, [$FFD7]
    cp   $5C
    jr   z, .label_2161

.label_214D
    ret

.label_214E
    xor  a
    ld   [$C15F], a
    ret

.label_2153
    call .label_2165
    ld   a, $14
    ld   [.label_2100], a
    call $50C3
    jp   .label_081D

.label_2161
    ld   a, $01
    ld   [$FFE5], a

.label_2165
    ld   a, [$FFD8]
    ld   e, a
    ld   a, [$FFD7]
    ld   [$FFAF], a
    call .label_2178
    ld   a, [$FF9E]
    ld   [$C15D], a
    jp   .label_2183

.label_2177
    ret

.label_2178
    ld   a, $14
    ld   [.label_2100], a
    call $5526
    jp   .label_081D

.label_2183
    ld   a, $05
    call .label_142F
    jr   c, .label_21A7
    ld   a, $02
    ld   [$FFF3], a
    ld   hl, $C280
    add  hl, de
    ld   [hl], $07
    ld   hl, $C3B0
    add  hl, de
    ld   a, [$FFE5]
    ld   [hl], a
    ld   c, e
    ld   b, d
    ld   e, $01
    ld   a, $03
    call .label_080C
    jp   $5795

.label_21A7
    ret

.label_21A8
    ld   a, [$C14F]
    and  a
    ret  nz
    ld   c, $01
    call .label_21B6
    ld   c, $00
    ld   [$FFD7], a

.label_21B6
    ld   b, $00
    ld   hl, $FF9A
    add  hl, bc
    ld   a, [hl]
    push af
    db   $CB, $37 ; Need to handle this instruction 
    and  $F0
    ld   hl, $C11A
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    db   $CB, $12 ; Need to handle this instruction 
    ld   hl, $FF98
    add  hl, bc
    pop  af
    ld   e, $00
    db   $CB, $7F ; Need to handle this instruction 
    jr   z, .label_21D7
    ld   e, $F0

.label_21D7
    db   $CB, $37 ; Need to handle this instruction 
    and  $0F
    or   e
    db   $CB, $1A ; Need to handle this instruction 
    adc  a, [hl]
    ld   [hl], a
    ret
    ld   a, [$FFA3]
    push af
    db   $CB, $37 ; Need to handle this instruction 
    and  $F0
    ld   hl, $C149
    add  a, [hl]
    ld   [hl], a
    db   $CB, $12 ; Need to handle this instruction 
    ld   hl, $FFA2
    pop  af
    ld   e, $00
    db   $CB, $7F ; Need to handle this instruction 
    jr   z, .label_21FB
    ld   e, $F0

.label_21FB
    db   $CB, $37 ; Need to handle this instruction 
    and  $0F
    or   e
    db   $CB, $1A ; Need to handle this instruction 
    adc  a, [hl]
    ld   [hl], a
    ret

.label_2205
    stop
    ld   bc, $3E01
    ld   [$00EA], sp
    ld   hl, $34CD
    ldi  [hl], a
    jp   .label_081D

.label_2214
    ld   a, [$C127]
    and  $20
    jr   z, .label_221D
    inc  hl
    inc  hl

.label_221D
    ld   a, [hli]
    ld   [bc], a
    inc  b
    ld   a, [hl]
    ld   [bc], a
    inc  b
    ret

.label_2224
    ld   a, [$C127]
    and  $01
    jr   z, .label_222C
    inc  hl

.label_222C
    ld   a, [hli]
    ld   [bc], a
    inc  hl
    inc  b
    ld   a, [hl]
    ld   [bc], a
    inc  b
    ret
    ld   a, $20
    ld   [.label_2100], a
    call $4A76
    ld   a, $08
    ld   [.label_2100], a

.label_2241
    push bc
    push de
    ld   a, [$FFD9]
    ld   c, a
    ld   b, $00
    ld   hl, $D711
    add  hl, bc
    ld   b, $00
    ld   c, [hl]
    ld   a, [$FFFE]
    and  a
    jr   z, .label_2262
    ld   a, [$DBA5]
    and  a
    jr   nz, .label_2262
    ld   a, $02
    ld   [$FF70], a
    ld   c, [hl]
    xor  a
    ld   [$FF70], a

.label_2262
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   a, [$DBA5]
    and  a
    jr   z, .label_2286
    ld   hl, $4000
    ld   a, [$FFFE]
    and  a
    jr   z, .label_2299
    ld   hl, $43B0
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_2291
    ld   hl, $4760
    jr   .label_2291

.label_2286
    ld   hl, $6749
    ld   a, [$FFFE]
    and  a
    jr   z, .label_2299
    ld   hl, $6B1D

.label_2291
    ld   a, $1A
    ld   [.label_2100], a
    call $6576

.label_2299
    call .label_3905
    add  hl, bc
    pop  de
    pop  bc
    ld   a, [$C125]
    and  $02
    jr   z, .label_22D3
    call .label_2214
    ld   a, [$FFFE]
    and  a
    jr   z, .label_22D1
    push bc
    push de
    ld   a, $20
    ld   [.label_2100], a
    call $49D9
    ld   a, [$FFDF]
    ld   [.label_2100], a
    call .label_2214
    ld   a, b
    ld   [$FFE2], a
    ld   a, c
    ld   [$FFE3], a
    ld   a, d
    ld   [$FFE4], a
    ld   a, e
    ld   [$FFE5], a
    call .label_3905
    pop  de
    pop  bc

.label_22D1
    jr   .label_22FE

.label_22D3
    call .label_2224
    ld   a, [$FFFE]
    and  a
    jr   z, .label_22FE
    push bc
    push de
    ld   a, $20
    ld   [.label_2100], a
    call $49D9
    ld   a, [$FFDF]
    ld   [.label_2100], a
    call .label_2224
    ld   a, b
    ld   [$FFE2], a
    ld   a, c
    ld   [$FFE3], a
    ld   a, d
    ld   [$FFE4], a
    ld   a, e
    ld   [$FFE5], a
    call .label_3905
    pop  de
    pop  bc

.label_22FE
    push bc
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    ld   hl, $2205
    add  hl, bc
    ld   a, [$FFD9]
    add  a, [hl]
    ld   [$FFD9], a
    pop  bc
    ld   a, [$C128]
    dec  a
    ld   [$C128], a
    jp   nz, .label_2241
    ld   a, $20
    ld   [.label_2100], a
    jp   $5570

.label_2321
    ld   a, [$C19F]
    and  a
    ret  z
    ld   e, a
    ld   a, [$DB95]
    cp   $01
    ld   a, $7E
    jr   nz, .label_2332
    ld   a, $7F

.label_2332
    ld   [$FFE8], a
    ld   a, [$C164]
    and  a
    ld   a, [$C170]
    jr   nz, .label_2341
    cp   $20
    jr   c, .label_2345

.label_2341
    and  $0F
    or   $10

.label_2345
    ld   [$C171], a
    ld   a, e
    and  $7F
    dec  a
    rst  0
    ld   l, e
    inc  hl
    or   b
    inc  hl
    or   b
    inc  hl
    or   b
    inc  hl
    ld   a, l
    inc  h
    or   a
    inc  h
    call .label_2924
    dec  h
    sub  a, l
    ld   h, $14
    daa
    ld   l, b
    daa
    adc  a, d
    inc  h
    sub  a, e
    daa
    xor  a
    inc  h
    or   c
    inc  hl
    ld   a, $14
    ld   [.label_2100], a
    jp   $5449

.label_2373
    call .label_2385
    ld   a, $01
    ld   [$C112], a
    ret

.label_237C
    call .label_2385
    ld   a, $02
    ld   [$C112], a
    ret

.label_2385
    push af
    xor  a
    ld   [$C177], a
    pop  af
    ld   [$C173], a
    xor  a
    ld   [$C16F], a
    ld   [$C170], a
    ld   [$C164], a
    ld   [$C108], a
    ld   [$C112], a
    ld   a, $0F
    ld   [$C5AB], a
    ld   a, [$FF99]
    cp   $48
    rra
    and  $80
    or   $01
    ld   [$C19F], a
    ret
    ret
    xor  a
    ld   [$C19F], a
    ld   a, $18
    ld   [$C134], a
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$DB95]
    cp   $0B
    ret  nz
    ld   a, [$C3CC]
    cp   $08
    ret  c
    ld   a, $21
    ld   [.label_2100], a
    jp   $53CF
    nop
    inc  h
    ld   c, b
    nop

.label_23D6
    inc  h
    ld   c, b
    sbc  a, b
    sbc  a, b
    sbc  a, b
    sbc  a, c

.label_23DC
    sbc  a, c
    sbc  a, c
    ld   hl, $A161
    ld   b, c
    add  a, c
    pop  bc

.label_23E4
    ld   a, [$C19F]
    db   $CB, $7F ; Need to handle this instruction 
    jr   z, .label_23EF
    and  $7F
    add  a, $03

.label_23EF
    ld   e, a
    ld   d, $00
    ld   hl, $23D0
    add  hl, de
    ld   a, [hl]
    add  a, $00
    ld   c, a
    ld   a, $D5
    adc  a, $00
    ld   b, a
    ld   hl, $23DC
    add  hl, de
    ld   a, [$C12F]
    add  a, [hl]
    ld   l, a
    ld   [$FFD7], a
    ld   hl, $23D6
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   h, a
    ld   a, [$FFD7]
    ld   l, a
    xor  a
    ld   e, a
    ld   d, a
    ld   a, [$FFFE]
    and  a
    jr   nz, .label_2444

.label_241E
    ld   a, [hli]
    ld   [bc], a
    inc  b
    ld   a, l
    and  $1F
    jr   nz, .label_242B
    ld   a, l
    dec  a
    and  $E0
    ld   l, a

.label_242B
    inc  e
    ld   a, e
    cp   $12
    jr   nz, .label_241E
    ld   e, $00
    ld   a, [$FFD7]
    add  a, $20
    ld   [$FFD7], a
    jr   nc, .label_243C
    inc  h

.label_243C
    ld   l, a
    inc  d
    ld   a, d
    cp   $02
    jr   nz, .label_241E
    ret

.label_2444
    ld   a, [hl]
    ld   [bc], a
    ld   a, $01
    ld   [$FF4F], a
    ld   a, $02
    ld   [$FF70], a
    ld   a, [hl]
    ld   [bc], a
    xor  a
    ld   [$FF4F], a
    ld   [$FF70], a
    inc  b
    ld   a, l
    add  a, $01
    and  $1F
    jr   nz, .label_2463
    ld   a, l
    and  $E0
    ld   l, a
    jr   .label_2464

.label_2463
    inc  l

.label_2464
    inc  e
    ld   a, e
    cp   $12
    jr   nz, .label_2444
    ld   e, $00
    ld   a, [$FFD7]
    add  a, $20
    ld   [$FFD7], a
    jr   nc, .label_2475
    inc  h

.label_2475
    ld   l, a
    inc  d
    ld   a, d
    cp   $02
    jr   nz, .label_2444
    ret
    ld   a, $1C
    ld   [.label_2100], a
    jp   $4A2C

.label_2485
    ld   hl, $C19F
    inc  [hl]
    ret
    ld   a, [$C1AB]
    and  a
    jr   nz, .label_24AE
    ld   a, [$FFCC]
    and  $30
    jr   z, .label_24AE

.label_2496
    xor  a
    ld   [$C16F], a
    ld   a, [$DB95]
    cp   $0D
    jr   nz, .label_24A4
    xor  a
    jr   .label_24AB

.label_24A4
    ld   a, [$C19F]
    and  $F0
    or   $0E

.label_24AB
    ld   [$C19F], a

.label_24AE
    ret
    ld   a, $1C
    ld   [.label_2100], a
    jp   $4AA8
    ld   a, $1C
    ld   [.label_2100], a
    ld   a, [$C172]
    and  a
    jr   z, .label_24C7
    dec  a
    ld   [$C172], a
    ret

.label_24C7
    call $49F1
    jp   .label_2485
    ld   a, $1C
    ld   [.label_2100], a
    ld   a, [$C19F]
    ld   c, a
    ld   a, [$C171]
    db   $CB, $79 ; Need to handle this instruction 
    jr   z, .label_24DF
    add  a, $20

.label_24DF
    ld   c, a
    ld   b, $00
    ld   e, $01
    ld   d, $00
    ld   a, [$C12E]
    ld   hl, $45C1
    add  hl, bc
    add  a, [hl]
    ld   hl, $D600
    add  hl, de
    ldi  [hl], a
    ld   [$C175], a
    push hl
    ld   hl, $4601
    add  hl, bc
    ld   a, [hl]
    and  $E0
    add  a, $20
    ld   e, a
    ld   a, [$C12F]
    add  a, [hl]
    ld   d, a
    cp   e
    jr   c, .label_250D
    ld   a, d
    sub  a, $20
    ld   d, a

.label_250D
    ld   a, d
    ld   [$C176], a
    pop  hl
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    push hl
    ld   a, [$C170]
    and  $1F
    ld   c, a
    ld   hl, $45A1
    add  hl, bc
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    call .label_2485
    jp   .label_2529

.label_2529
    ld   a, $1C
    ld   [.label_2100], a
    ld   a, [$C170]
    and  $1F
    ld   c, a
    ld   b, $00
    ld   e, $05
    ld   d, $00
    ld   hl, $4581
    add  hl, bc
    ld   a, [hl]
    ld   hl, $D600
    add  hl, de
    ldi  [hl], a
    push hl
    ld   hl, $4561
    add  hl, bc
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    ld   a, $0F
    ldi  [hl], a
    push hl
    ld   a, [$C112]
    ld   d, a
    ld   a, [$C173]
    ld   e, a
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    ld   hl, $4001
    add  hl, de
    ld   a, [hli]
    ld   e, a
    ld   d, [hl]
    push de
    ld   a, [$C173]
    ld   e, a
    ld   a, [$C112]
    ld   d, a
    ld   hl, $4741
    add  hl, de
    ld   a, [hl]
    and  $3F
    ld   [.label_2100], a
    pop  hl
    ld   a, [$C170]
    ld   e, a
    ld   a, [$C164]
    ld   d, a
    add  hl, de
    ld   a, [hli]
    ld   e, a
    ld   a, [hl]
    ld   [$C3C3], a
    call .label_081D
    ld   a, e
    ld   [$FFD7], a
    cp   $FE
    jr   nz, .label_25A4
    pop  hl
    xor  a
    ld   [$D601], a

.label_2595
    ld   a, [$C19F]
    and  $F0
    or   $0D
    ld   [$C19F], a

.label_259F
    ld   a, $15
    ld   [$FFF2], a
    ret

.label_25A4
    cp   $FF
    jr   nz, .label_25BD
    pop  hl
    xor  a
    ld   [$D601], a

.label_25AD
    ld   a, [$C19F]
    and  $F0
    or   $0C
    ld   [$C19F], a
    ret

.label_25B8
    ld   d, l
    ld   c, c
    ld   c, d
    ld   b, [hl]
    ld   b, a

.label_25BD
    cp   $20
    jr   z, .label_25E0
    push af
    ld   a, [$C5AB]
    ld   d, a
    ld   e, $01
    cp   $0F
    jr   z, .label_25D4
    ld   e, $07
    cp   $19
    jr   z, .label_25D4
    ld   e, $03

.label_25D4
    ld   a, [$C170]
    add  a, $04
    and  e
    jr   nz, .label_25DF
    ld   a, d
    ld   [$FFF3], a

.label_25DF
    pop  af

.label_25E0
    ld   d, $00
    cp   $23
    jr   nz, .label_2608
    ld   a, [$C108]
    ld   e, a
    inc  a
    cp   $05
    jr   nz, .label_25F0
    xor  a

.label_25F0
    ld   [$C108], a
    ld   hl, $DB4F
    ld   a, [$DB6E]
    and  a
    jr   z, .label_25FF
    ld   hl, $25B8

.label_25FF
    add  hl, de
    ld   a, [hl]
    dec  a
    cp   $FF
    jr   nz, .label_2608
    ld   a, $20

.label_2608
    ld   [$FFD8], a
    ld   e, a
    ld   a, $1C
    ld   [.label_2100], a
    ld   hl, $4641
    add  hl, de
    ld   e, [hl]
    ld   d, $00
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    call .label_081D
    ld   hl, $5000
    add  hl, de
    ld   c, l
    ld   b, h
    pop  hl
    ld   e, $10

.label_2633
    ld   a, [bc]
    ldi  [hl], a
    inc  b
    dec  e
    jr   nz, .label_2633
    ld   [hl], $00
    push hl
    ld   a, $1C
    ld   [.label_2100], a
    ld   a, [$FFD8]
    ld   e, a
    ld   d, $00
    xor  a
    pop  hl
    and  a
    jr   z, .label_2663
    ld   e, a
    ld   a, [$C175]
    ldi  [hl], a
    ld   a, [$C176]
    sub  a, $20
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $C9
    db   $CB, $1B ; Need to handle this instruction 
    jr   c, .label_2660
    dec  a

.label_2660
    ldi  [hl], a
    ld   [hl], $00

.label_2663
    ld   a, [$C170]
    add  a, $01
    ld   [$C170], a
    ld   a, [$C164]
    adc  a, $00
    ld   [$C164], a
    xor  a
    ld   [$C1CC], a
    ld   a, [$C171]
    cp   $1F
    jr   z, .label_268E

.label_267E
    ld   a, [$C19F]
    and  $F0
    or   $06
    ld   [$C19F], a
    ld   a, $00
    ld   [$C172], a
    ret

.label_268E
    jp   .label_2485

.label_2691
    ldi  [hl], a
    ld   b, d

.label_2693
    sbc  a, b
    sbc  a, c
    ld   a, [$C170]
    and  $1F
    jr   nz, .label_26E1
    ld   a, [$C3C3]
    cp   $FF
    jp   z, .label_25AD
    cp   $FE
    jp   z, .label_2595
    ld   a, [$C1CC]
    and  a
    jr   nz, .label_26B6
    inc  a
    ld   [$C1CC], a
    call .label_259F

.label_26B6
    call .label_27BB
    ld   a, [$FFCC]
    db   $CB, $67 ; Need to handle this instruction 
    jr   nz, .label_26E1
    db   $CB, $6F ; Need to handle this instruction 
    jr   z, .label_2714
    ld   a, $1C
    ld   [.label_2100], a
    ld   a, [$DB95]
    cp   $07
    jp   z, .label_278B
    ld   a, [$C173]
    ld   e, a
    ld   a, [$C112]
    ld   d, a
    ld   hl, $4741
    add  hl, de
    ld   a, [hl]
    and  a
    jp   z, .label_278B

.label_26E1
    ld   e, $00
    ld   a, [$C19F]
    and  $80
    jr   z, .label_26EB
    inc  e

.label_26EB
    ld   d, $00
    ld   hl, $2693
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   [$D601], a
    ld   hl, $2691
    add  hl, de
    ld   a, [$C12F]
    add  a, [hl]
    ld   [$D602], a
    ld   a, $4F
    ld   [$D603], a
    ld   a, [$FFE8]
    ld   [$D604], a
    xor  a
    ld   [$D605], a
    call .label_2485

.label_2714
    ret

.label_2715
    ld   h, d
    add  a, d

.label_2717
    sbc  a, b
    sbc  a, c

.label_2719
    ld   e, $00
    ld   a, [$C19F]
    and  $80
    jr   z, .label_2723
    inc  e

.label_2723
    ld   d, $00
    ld   hl, $2717
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   b, a
    ld   hl, $2715

.label_2731
    add  hl, de
    ld   a, [$C12F]
    add  a, [hl]
    ld   c, a
    ld   e, $10

.label_2739
    ld   a, c
    sub  a, $20
    ld   l, a
    ld   h, b
    ld   a, [bc]
    ld   [hl], a
    push bc
    ld   a, c
    add  a, $20
    ld   c, a
    ld   a, l
    add  a, $20
    ld   l, a
    ld   a, [bc]
    ld   [hl], a
    ld   a, l
    add  a, $20
    ld   l, a
    ld   a, [$FFE8]
    ld   [hl], a
    pop  bc
    inc  b
    ld   a, c
    and  $1F
    jr   nz, .label_275D
    ld   a, c
    sub  a, $20
    ld   c, a

.label_275D
    dec  e
    jr   nz, .label_2739
    ld   a, $08
    ld   [$C172], a
    jp   .label_2485
    ret

.label_2769
    ld   b, d
    ld   h, d

.label_276B
    sbc  a, b
    sbc  a, c

.label_276D
    ld   e, $00
    ld   a, [$C19F]
    and  $80
    jr   z, .label_2777
    inc  e

.label_2777
    ld   d, $00
    ld   hl, $276B
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   b, a
    ld   hl, $2769
    call .label_2731
    jp   .label_267E

.label_278B
    ld   a, $02
    ld   [$C177], a
    jp   .label_2496
    ld   a, [$FFCC]
    db   $CB, $67 ; Need to handle this instruction 
    jp   nz, .label_27B7
    and  $03
    jr   z, .label_27AA
    ld   hl, $C177
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a
    ld   a, $0A
    ld   [$FFF2], a

.label_27AA
    ld   a, [$FFE7]
    and  $10
    ret  z
    ld   a, $17
    ld   [.label_2100], a
    jp   $7DCC

.label_27B7
    call .label_2496
    ret

.label_27BB
    ld   a, $17
    ld   [.label_2100], a
    jp   $7D7C
    ld   [$D368], a
    ld   [$FFBF], a
    ld   a, $38
    ld   [$FFAB], a
    xor  a
    ld   [$FFA8], a
    ret
    push hl
    ld   hl, $4000
    ld   [hl], $00
    ld   hl, $0000
    ld   [hl], $0A
    pop  hl
    ret
    ld   a, $02
    ld   [.label_2100], a
    push bc
    call $4146
    pop  bc
    jp   .label_081D
    ld   a, $38
    ld   [$FFA8], a
    xor  a
    ld   [$FFAB], a
    ret

.label_27F2
    ld   a, [$FFBC]
    and  a
    jr   nz, .label_27FF
    ld   a, $1F
    ld   [.label_2100], a
    call $4003

.label_27FF
    jp   .label_081D
    ld   a, $01
    ld   [.label_2100], a
    call $5E67
    jp   .label_081D

.label_280D
    push hl
    ld   a, [$FFE7]
    ld   hl, $C13D
    add  a, [hl]
    ld   hl, $FF44
    add  a, [hl]
    rrca
    ld   [$C13D], a
    pop  hl
    ret

.label_281E
    ld   a, [$C124]
    and  a
    jr   nz, .label_2886
    ld   a, [$DB95]
    cp   $0B
    jr   nz, .label_2852
    ld   a, [$DB96]
    cp   $07
    jr   nz, .label_284C
    ld   a, [$C11C]
    cp   $07
    jr   nz, .label_283F
    ld   a, [$FF9C]
    cp   $04
    jr   z, .label_2852

.label_283F
    ld   a, [$C16B]
    cp   $04
    jr   nz, .label_284C
    ld   a, [$DDD5]
    and  a
    jr   z, .label_2852

.label_284C
    xor  a
    ld   [$FFCB], a
    ld   [$FFCC], a
    ret

.label_2852
    ld   a, $20
    ld   [$FF00], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    cpl
    and  $0F
    ld   b, a
    ld   a, $10
    ld   [$FF00], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    db   $CB, $37 ; Need to handle this instruction 
    cpl
    and  $F0
    or   b
    ld   c, a
    ld   a, [$FFCB]
    xor  c
    and  c
    ld   [$FFCC], a
    ld   a, c
    ld   [$FFCB], a
    ld   a, $30
    ld   [$FF00], a

.label_2886
    ret
    push bc
    ld   a, [$FFCD]
    ld   hl, $FF97
    add  a, [hl]
    and  $F8
    db   $CB, $3F ; Need to handle this instruction 
    db   $CB, $3F ; Need to handle this instruction 
    db   $CB, $3F ; Need to handle this instruction 
    ld   de, $0000
    ld   e, a
    ld   hl, $9800
    ld   b, $20

.label_289F
    add  hl, de
    dec  b
    jr   nz, .label_289F
    push hl
    ld   a, [$FFCE]
    ld   hl, $FF96
    add  a, [hl]
    pop  hl
    and  $F8
    db   $CB, $3F ; Need to handle this instruction 
    db   $CB, $3F ; Need to handle this instruction 
    db   $CB, $3F ; Need to handle this instruction 
    ld   de, $0000
    ld   e, a
    add  hl, de
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    pop  bc
    ret
    ld   e, a
    ld   d, $00
    db   $CB, $23 ; Need to handle this instruction 
    db   $CB, $12 ; Need to handle this instruction 
    pop  hl
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    ld   l, e
    ld   h, d
    jp   [hl]

.label_28CF
    ld   a, [$FFFF]
    ld   [$FFD2], a
    db   $CB, $87 ; Need to handle this instruction 
    ld   [$FFFF], a

.label_28D7
    ld   a, [$FF44]
    cp   $91
    jr   nz, .label_28D7
    ld   a, [$FF40]
    and  $7F
    ld   [$FF40], a
    ld   a, [$FFD2]
    ld   [$FFFF], a
    ret
    ld   a, $01
    call .label_080C
    jp   $6CE3
    ld   a, $7E
    ld   bc, $0400
    jr   .label_28FC

.label_28F7
    ld   a, $7F
    ld   bc, $0800

.label_28FC
    ld   d, a
    ld   hl, $9800

.label_2900
    ld   a, d
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, .label_2900
    ret
    ld   [.label_2100], a
    call .label_2914
    ld   a, $01
    ld   [.label_2100], a
    ret

.label_2914
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  bc
    ld   a, b
    or   c
    jr   nz, .label_2914
    ret

.label_291D
    inc  de
    ld   h, a
    ld   a, [de]
    ld   l, a
    inc  de
    ld   a, [de]
    inc  de

.label_2924
    call .label_2941

.label_2927
    ld   a, [$C124]
    and  a
    jr   nz, .label_293C

.label_292D
    ld   a, [de]
    and  a
    jr   nz, .label_291D
    ret

.label_2932
    inc  de
    ld   h, a
    ld   a, [de]
    ld   l, a
    inc  de
    ld   a, [de]
    inc  de
    call .label_2991

.label_293C
    ld   a, [de]
    and  a
    jr   nz, .label_2932
    ret

.label_2941
    push af
    and  $3F
    ld   b, a
    inc  b
    pop  af
    rlca
    rlca
    and  $03
    jr   z, .label_2955
    dec  a
    jr   z, .label_2966
    dec  a
    jr   z, .label_2977
    jr   .label_2984

.label_2955
    ld   a, [de]
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, .label_2961
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

.label_2961
    inc  de
    dec  b
    jr   nz, .label_2955
    ret

.label_2966
    ld   a, [de]
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, .label_2972
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

.label_2972
    dec  b
    jr   nz, .label_2966
    inc  de
    ret

.label_2977
    ld   a, [de]
    ld   [hl], a
    inc  de
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, .label_2977
    ret

.label_2984
    ld   a, [de]
    ld   [hl], a
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, .label_2984
    inc  de
    ret

.label_2991
    push af
    and  $3F
    ld   b, a
    inc  b
    pop  af
    and  $80
    jr   nz, .label_29B0

.label_299B
    ld   a, [de]
    cp   $EE
    jr   z, .label_29AB
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, .label_29AB
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

.label_29AB
    inc  de
    dec  b
    jr   nz, .label_299B
    ret

.label_29B0
    ld   a, [de]
    cp   $EE
    jr   z, .label_29B6
    ld   [hl], a

.label_29B6
    inc  de
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, .label_29B0
    ret
    ld   bc, $1600
    jr   .label_29DC
    ld   bc, $1300
    jr   .label_29DC
    ld   bc, $002F
    jr   .label_29D3

.label_29D0
    ld   bc, $006D

.label_29D3
    ld   hl, $FF90
    call .label_29DF
    ld   bc, $1F00

.label_29DC
    ld   hl, $C000

.label_29DF
    ld   a, [$FFFE]
    push af

.label_29E2
    xor  a
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, .label_29E2
    pop  af
    ld   [$FFFE], a
    ret
    ld   a, $14
    ld   [.label_2100], a
    call $5884
    jp   .label_081D
    ld   a, $20
    ld   [.label_2100], a
    call $4C98
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ret
    ld   a, $01
    ld   [.label_2100], a
    call $5A59
    jp   .label_081D

.label_2A12
    ld   a, $08
    ld   [.label_2100], a
    ld   hl, $4AD4
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_2A23
    ld   hl, $4BD4

.label_2A23
    add  hl, de
    ld   a, [hl]
    ret

.label_2A26
    call .label_2A12
    jp   .label_081D
    call .label_2A12
    push af
    ld   a, $03
    ld   [.label_2100], a
    pop  af
    ret
    ld   a, $13
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0800
    call .label_2914
    ld   hl, $7000
    ld   de, $8800
    ld   bc, $0800
    jp   .label_2914
    call .label_2A66
    ld   de, $8400
    ld   hl, $7600
    ld   bc, $0100
    jp   .label_2914

.label_2A66
    ld   a, $13
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $4000
    ld   de, $8000
    ld   bc, $1800
    call .label_2914
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $57E0
    ld   de, $97F0
    ld   bc, $0010
    call .label_2914
    ld   a, $12
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $7500
    ld   de, $8000
    ld   bc, $0040
    call .label_2914
    ld   de, $8D00
    ld   hl, $7500
    ld   bc, $0200
    jp   .label_2914
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $5000
    ld   de, $9000
    ld   bc, $0800
    call .label_2914
    ld   a, $12
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $6000
    ld   de, $8000
    ld   bc, $0800
    call .label_2914
    ld   a, $0F
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $6000
    ld   de, $8800
    ld   bc, $0800
    jp   .label_2914
    ld   hl, $4000
    ld   a, [$FFFE]
    and  a
    jr   z, .label_2B01
    ld   hl, $6800
    ld   a, $35
    jr   .label_2B06
    ld   hl, $4800
    jr   .label_2B01
    ld   hl, $6000

.label_2B01
    ld   a, $13
    call .label_0B0B

.label_2B06
    ld   [.label_2100], a
    ld   de, $8000
    ld   bc, $0800
    call .label_2914
    ld   a, $13
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $5800
    ld   de, $8800
    ld   bc, $1000
    jp   .label_2914
    call .label_08A4
    ld   hl, $6800
    ld   a, $10
    call .label_2B92
    call .label_08A4
    ld   a, $12
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $6600
    ld   de, $8000
    ld   bc, $0080
    call .label_2914
    call .label_08A4
    ld   a, [$FFFE]
    and  a
    jr   nz, .label_2B61
    ld   a, $10
    ld   [.label_2100], a
    ld   hl, $6900
    ld   de, $8100
    ld   bc, $0700
    jp   .label_2914

.label_2B61
    ld   a, $38
    ld   [.label_2100], a
    ld   hl, $5000
    ld   de, $8000
    ld   bc, $0800
    jp   .label_2914
    ld   hl, $7800
    ld   a, [$FFFE]
    and  a
    jr   z, .label_2B90
    ld   hl, $7800
    ld   a, $35
    jr   .label_2B95
    ld   hl, $4800
    ld   a, [$FFFE]
    and  a
    jr   z, .label_2B90
    ld   hl, $7000
    ld   a, $35
    jr   .label_2B95

.label_2B90
    ld   a, $13

.label_2B92
    call .label_0B0B

.label_2B95
    ld   [.label_2100], a
    ld   de, $8000
    ld   bc, $0800
    call .label_2914
    ld   a, $13
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $7000
    ld   de, $8800
    ld   bc, $0800
    call .label_2914
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0800
    jp   .label_2914
    push bc
    ld   a, $14
    ld   [.label_2100], a
    call $5838
    call .label_081D
    pop  bc
    ret

.label_2BCF
    ld   a, $0C
    call .label_0813
    ld   hl, $4000
    ld   de, $8000
    ld   bc, $0400
    call .label_2914
    ld   a, $0C
    call .label_0813
    ld   hl, $4800
    ld   de, $8800
    ld   bc, $1000
    call .label_2914
    ld   hl, $47A0
    ld   de, $8E00
    ld   bc, $0020
    call .label_2914
    ld   a, $01
    call .label_080C
    ret
    call .label_2BCF
    ld   a, $0F
    call .label_0813
    ld   hl, $4000
    ld   de, $8800
    ld   bc, $0400
    call .label_2914
    ld   a, $0F
    call .label_0813
    ld   hl, $5000
    ld   de, $9000
    ld   bc, $0800
    jp   .label_2914
    ld   a, $20
    call .label_080C
    ld   hl, $4589
    ld   a, [$FFF7]
    ld   e, a
    ld   d, $00
    cp   $FF
    jr   nz, .label_2C53
    ld   a, $35
    ld   [.label_2100], a
    ld   hl, $6200
    ld   de, $9000
    ld   bc, $0100
    call .label_2914
    ld   e, $00
    ld   d, e
    ld   hl, $6000
    push de
    jr   .label_2C5D

.label_2C53
    push de
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    ld   a, $0D
    call .label_0813

.label_2C5D
    ld   de, $9100
    ld   bc, $0100
    call .label_2914
    ld   a, $0D
    call .label_0813
    ld   hl, $4000
    ld   de, $9200
    ld   bc, $0600
    call .label_2914
    ld   a, $20
    ld   [.label_2100], a
    pop  de
    push de
    ld   hl, $45A9
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_2C8A
    ld   hl, $45C9

.label_2C8A
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    call .label_081D
    ld   de, $9200
    ld   bc, $0200
    call .label_2914
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $47C0
    ld   de, $DCC0
    ld   bc, $0040
    call .label_2914
    call .label_2D50
    ld   a, $20
    ld   [.label_2100], a
    pop  de
    ld   hl, $45CA
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    ld   a, $12
    call .label_0813
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_2CD1
    ld   hl, $6100
    ld   a, $35
    ld   [.label_2100], a

.label_2CD1
    ld   de, $8F00
    ld   bc, $0100
    call .label_2914
    ld   a, [$DBAF]
    ld   [.label_2100], a
    ld   hl, $7D00
    ld   a, [$FFF7]
    cp   $FF
    jr   z, .label_2CF5
    cp   $0A
    jr   c, .label_2CF5
    ld   a, $0C
    call .label_0813
    ld   hl, $4C00

.label_2CF5
    ld   de, $8C00
    ld   bc, $0300
    call .label_2914

.label_2CFE
    ld   a, [$DB4B]
    and  a
    jr   z, .label_2D07
    call .label_1E2B

.label_2D07
    ld   a, [$DBA5]
    and  a
    jr   z, .label_2D17
    ld   a, [$FFF7]
    cp   $FF
    jr   z, .label_2D21
    cp   $0A
    jr   c, .label_2D21

.label_2D17
    ld   a, [$DB15]
    cp   $06
    jr   c, .label_2D21
    call .label_1EA1

.label_2D21
    ld   a, [$DB0E]
    cp   $02
    jr   c, .label_2D2C
    ld   a, $0D
    ld   [$FFA5], a

.label_2D2C
    ret
    ld   a, $0C
    call .label_0813
    ld   hl, $5200
    ld   de, $9200
    ld   bc, $0600
    call .label_2914
    ld   hl, $4C00
    ld   de, $8C00
    ld   bc, $0400
    call .label_2914
    call .label_2D50
    jp   .label_2CFE

.label_2D50
    xor  a
    ld   [$FFA6], a
    ld   [$FFA7], a
    call .label_1BD2
    ld   a, $0C
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $4800
    ld   de, $8800
    ld   bc, $0800
    call .label_2914
    ld   hl, $4200
    ld   de, $8200
    ld   bc, $0100
    call .label_2914
    ret
    ld   a, $01
    call .label_080C
    ld   hl, $6D4A
    ld   de, $8700
    ld   bc, $0080
    call .label_2914
    ld   a, $10
    call .label_0813
    ld   hl, $5400
    ld   de, $8000
    ld   bc, $0600
    call .label_2914
    ld   hl, $4000
    ld   de, $8800
    ld   bc, $1000
    jp   .label_2914
    ld   a, $0F
    call .label_0813
    ld   hl, $4900
    ld   de, $8800
    ld   bc, $0700
    call .label_2914
    ld   a, $38
    call .label_080C
    ld   a, [$FFFE]
    and  a
    jr   nz, .label_2DC7
    ld   hl, $5C00
    jr   .label_2DCA

.label_2DC7
    ld   hl, $5800

.label_2DCA
    ld   de, $8400
    ld   bc, $0400
    call .label_2914
    ld   a, [$FFFE]
    and  a
    jr   nz, .label_2DDD
    ld   hl, $6600
    jr   .label_2DE0

.label_2DDD
    ld   hl, $6500

.label_2DE0
    ld   de, $8200
    ld   bc, $0100
    jp   .label_2914
    ld   a, $0C
    call .label_0813
    ld   hl, $7800
    ld   de, $8F00
    ld   bc, $0800
    call .label_2914
    ld   hl, $5000
    ld   de, $8200
    ld   bc, $0100
    jp   .label_2914
    ld   hl, $7000
    jr   .label_2E13
    ld   hl, $7800
    jr   .label_2E13
    ld   hl, $5800

.label_2E13
    ld   a, $10
    call .label_0813
    ld   de, $9000
    ld   bc, $0800
    jp   .label_2914
    ld   a, $13
    call .label_0B0B
    ld   [.label_2100], a
    ld   hl, $7C00
    ld   de, $8C00
    ld   bc, $0400
    call .label_2914
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0400
    jp   .label_2914
    ld   a, $10
    call .label_0813
    ld   hl, $6700
    ld   de, $8400
    ld   bc, $0400
    call .label_2914
    ld   hl, $6000
    ld   de, $9000
    ld   bc, $0600
    jp   .label_2914
    ld   a, $0F
    call .label_080C
    ld   hl, $4400
    ld   de, $8800
    ld   bc, $0500
    jp   .label_2914

.label_2E6F
    nop
    ld   de, .label_120E
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_2E84
    ld   a, $20
    ld   [.label_2100], a
    call $475A
    jp   .label_2F12

.label_2E84
    xor  a

.label_2E85
    ld   [$FFD7], a
    ld   hl, $C193
    ld   e, a
    ld   d, $00
    add  hl, de
    and  a
    jr   nz, .label_2ED3
    ld   a, [$DBA5]
    and  a
    jr   z, .label_2EB0
    ld   a, [$FFF9]
    and  a
    jr   nz, .label_2ED3
    ld   a, [$FFF7]
    cp   $14
    jr   z, .label_2ED3
    cp   $0A
    jr   c, .label_2ED3
    ld   a, [$FFF6]
    cp   $FD
    jr   z, .label_2ED3
    cp   $B1
    jr   z, .label_2ED3

.label_2EB0
    ld   a, [$DB56]
    cp   $01
    ld   a, $A4
    jr   z, .label_2ED1
    ld   a, [$DB79]
    and  a
    ld   a, $D8
    jr   nz, .label_2ED1
    ld   a, [$DB7B]
    and  a
    ld   a, $DD
    jr   nz, .label_2ED1
    ld   a, [$DB73]
    and  a
    jr   z, .label_2ED3
    ld   a, $8F

.label_2ED1
    jr   .label_2ED4

.label_2ED3
    ld   a, [hl]

.label_2ED4
    and  a
    jr   z, .label_2F0A
    push af
    and  $3F
    ld   b, a
    ld   c, $00
    pop  af
    db   $CB, $37 ; Need to handle this instruction 
    rra
    rra
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, $2E6F
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, .label_2EF2
    call .label_0B0B

.label_2EF2
    ld   [.label_2100], a
    ld   a, [$FFD7]
    ld   d, a
    ld   e, $00
    ld   hl, $8400
    add  hl, de
    ld   e, l
    ld   d, h
    ld   hl, $4000
    add  hl, bc
    ld   bc, $0100
    call .label_2914

.label_2F0A
    ld   a, [$FFD7]
    inc  a
    cp   $04
    jp   nz, .label_2E85

.label_2F12
    ld   de, $9000
    ld   a, [$DBA5]
    and  a
    jp   z, .label_2FAD
    ld   a, $0D
    call .label_0B0B
    ld   [.label_2100], a
    ld   a, [$FFF9]
    and  a
    jr   z, .label_2F4B
    ld   hl, $7000
    ld   a, [$FFF7]
    cp   $06
    jr   z, .label_2F41
    cp   $0A
    jr   nc, .label_2F3B

.label_2F36
    ld   hl, $7800
    jr   .label_2F41

.label_2F3B
    ld   a, [$FFF6]
    cp   $E9
    jr   z, .label_2F36

.label_2F41
    ld   de, $9000
    ld   bc, $0800
    call .label_2914
    ret

.label_2F4B
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_2F57
    ld   a, [$FFF6]
    cp   $12
    jr   nz, .label_2F69

.label_2F57
    ld   hl, $5000
    ld   a, [$FF94]
    cp   $FF
    jr   z, .label_2F69
    add  a, $50
    ld   h, a
    ld   bc, $0100
    call .label_2914

.label_2F69
    ld   a, [$FFF7]
    cp   $10
    jr   nz, .label_2F87
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, .label_2F87
    ld   a, $35
    ld   [.label_2100], a
    ld   hl, $6600
    ld   de, $8F00
    ld   bc, $0200
    call .label_2914
    ret

.label_2F87
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$FFF7]
    and  a
    ret  nz
    ld   a, $35
    ld   [.label_2100], a
    ld   hl, $6E00
    ld   de, $9690
    ld   bc, $0010
    call .label_2914
    ld   hl, $6E10
    ld   de, $9790
    ld   bc, $0010
    call .label_2914
    ret

.label_2FAD
    ld   a, $0F
    call .label_0B0B
    ld   [.label_2100], a
    ld   a, [$FF94]
    cp   $0F
    jr   z, .label_2FC6
    add  a, $40
    ld   h, a
    ld   l, $00
    ld   bc, $0200
    call .label_2914

.label_2FC6
    ret

.label_2FC7
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    ret

.label_2FCD
    ld   a, [hl]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   hl, $6749
    ld   a, [$FFF7]
    cp   $FF
    jr   z, .label_2FEC
    cp   $10
    jr   nz, .label_2FF1
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, .label_2FF1

.label_2FEC
    ld   hl, $4760
    jr   .label_2FFA

.label_2FF1
    ld   a, [$DBA5]
    and  a
    jr   z, .label_2FFA
    ld   hl, $4000

.label_2FFA
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    ld   a, e
    add  a, $1F
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hl]
    ld   [de], a
    ret

.label_300E
    ld   a, $02
    ld   [$FF70], a
    ld   c, [hl]
    xor  a
    ld   [$FF70], a
    jr   .label_3019

.label_3018
    ld   c, [hl]

.label_3019
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   a, $1A
    ld   [.label_2100], a
    call $6576
    call .label_3905
    ld   a, [$DBA5]
    and  a
    jr   z, .label_304C
    ld   hl, $43B0
    ld   a, [$FFF7]
    cp   $FF
    jr   z, .label_3047
    cp   $10
    jr   nz, .label_304F
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, .label_304F

.label_3047
    ld   hl, $4760
    jr   .label_304F

.label_304C
    ld   hl, $6B1D

.label_304F
    push de
    add  hl, bc
    call .label_2FC7
    pop  de
    push hl
    ld   a, [$FFDF]
    ld   [.label_2100], a
    ld   a, [$FFE0]
    ld   h, a
    ld   a, [$FFE1]
    ld   l, a
    ld   a, $01
    ld   [$FF4F], a
    call .label_2FC7
    xor  a
    ld   [$FF4F], a
    call .label_3905
    ld   a, h
    ld   [$FFE0], a
    ld   a, l
    ld   [$FFE1], a
    pop  hl
    ld   a, e
    add  a, $1F
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    push de
    call .label_2FC7
    pop  de
    ld   a, [$FFDF]
    ld   [.label_2100], a
    ld   a, [$FFE0]
    ld   h, a
    ld   a, [$FFE1]
    ld   l, a
    ld   a, $01
    ld   [$FF4F], a
    call .label_2FC7
    xor  a
    ld   [$FF4F], a
    call .label_3905
    ret
    call .label_3905
    call .label_080C
    ld   de, $9800
    ld   hl, $D711
    ld   c, $80

.label_30A9
    push de
    push hl
    push bc
    ld   a, [$FFFE]
    and  a
    jr   nz, .label_30B6
    call .label_2FCD
    jr   .label_30C4

.label_30B6
    ld   a, [$DBA5]
    and  a
    jr   z, .label_30C1
    call .label_3018
    jr   .label_30C4

.label_30C1
    call .label_300E

.label_30C4
    pop  bc
    pop  hl
    pop  de
    inc  hl
    ld   a, l
    and  $0F
    cp   $0B
    jr   nz, .label_30D5
    ld   a, l
    and  $F0
    add  a, $11
    ld   l, a

.label_30D5
    ld   a, e
    add  a, $02
    ld   e, a
    and  $1F
    cp   $14
    jr   nz, .label_30E9
    ld   a, e
    and  $E0
    add  a, $40
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a

.label_30E9
    dec  c
    jr   nz, .label_30A9
    ld   a, $01
    ld   [.label_2100], a
    jp   $6DEA
    ld   a, $01
    ld   [$FFFF], a
    ld   hl, $D47F
    inc  [hl]
    ld   a, $20
    ld   [.label_2100], a
    call $4CA3
    ld   a, [$FFFE]
    and  a
    jr   z, .label_3119
    ld   a, $21
    ld   [.label_2100], a
    call $40B3
    ld   a, $20
    ld   [.label_2100], a
    call $6DAF

.label_3119
    ld   a, $09
    ld   [.label_2100], a
    ld   a, [$DBA5]
    and  a
    jr   z, .label_313A
    ld   a, $14
    ld   [.label_2100], a
    ld   [$FFE8], a
    call $5897
    ld   e, a
    ld   hl, $DBB5

.label_3132
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $11
    jr   nz, .label_3132

.label_313A
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, $D800
    ld   a, [$DBA5]
    and  a
    jr   z, .label_3161
    ld   hl, $D900
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_3156
    ld   hl, $DDE0
    jr   .label_3161

.label_3156
    cp   $1A
    jr   nc, .label_3161
    cp   $06
    jr   c, .label_3161
    ld   hl, $DA00

.label_3161
    add  hl, de
    ld   a, [$FFF9]
    and  a
    ld   a, [hl]
    jr   nz, .label_316B
    or   $80
    ld   [hl], a

.label_316B
    ld   [$FFF8], a
    ld   a, [$FFF6]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   a, [$DBA5]
    and  a
    jr   z, .label_31BF
    ld   a, $0A
    ld   [.label_2100], a
    ld   [$FFE8], a
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_318F
    ld   hl, $7B77
    jp   .label_3224

.label_318F
    cp   $1F
    jr   nz, .label_31A6
    ld   a, [$FFF6]
    cp   $F5
    jr   nz, .label_31A6
    ld   a, [$DB0E]
    cp   $0E
    jr   nz, .label_31A6
    ld   bc, $7855
    jp   .label_323A

.label_31A6
    ld   hl, $4000
    ld   a, [$FFF7]
    cp   $1A
    jr   nc, .label_3224
    cp   $06
    jr   c, .label_3224
    ld   a, $0B
    ld   [.label_2100], a
    ld   [$FFE8], a
    ld   hl, $4000
    jr   .label_3224

.label_31BF
    ld   a, [$FFF6]
    cp   $0E
    jr   nz, .label_31D1
    ld   a, [$D80E]
    and  $10
    jr   z, .label_3221
    ld   bc, $47EC
    jr   .label_322F

.label_31D1
    cp   $8C
    jr   nz, .label_31E1
    ld   a, [$D88C]
    and  $10
    jr   z, .label_3221
    ld   bc, $434E
    jr   .label_322F

.label_31E1
    cp   $79
    jr   nz, .label_31F1
    ld   a, [$D879]
    and  $10
    jr   z, .label_3221
    ld   bc, $6513
    jr   .label_322F

.label_31F1
    cp   $06
    jr   nz, .label_3201
    ld   a, [$D806]
    and  $10
    jr   z, .label_3221
    ld   bc, $4496
    jr   .label_322F

.label_3201
    cp   $1B
    jr   nz, .label_3211
    ld   a, [$D82B]
    and  $10
    jr   z, .label_3221
    ld   bc, $4C0F
    jr   .label_322F

.label_3211
    cp   $2B
    jr   nz, .label_3221
    ld   a, [$D82B]
    and  $10
    jr   z, .label_3221
    ld   bc, $509A
    jr   .label_322F

.label_3221
    ld   hl, $4000

.label_3224
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a
    ld   a, [$DBA5]
    and  a
    jr   nz, .label_323A

.label_322F
    ld   a, [$FFF6]
    cp   $80
    jr   c, .label_323A
    ld   a, $1A
    ld   [.label_2100], a

.label_323A
    ld   a, [bc]
    cp   $FE
    jr   z, .label_328E
    ld   [$FFA4], a
    inc  b
    ld   a, [$DBA5]
    and  a
    jr   z, .label_3258
    ld   a, [bc]
    and  $0F
    call .label_37E7
    ld   a, [bc]
    db   $CB, $37 ; Need to handle this instruction 
    and  $0F
    call .label_38EA
    jr   .label_325C

.label_3258
    ld   a, [bc]
    call .label_37E7

.label_325C
    inc  b
    ld   a, [bc]
    and  $FC
    cp   $E0
    jr   nz, .label_3284
    ld   a, [$FFE6]
    ld   e, a
    ld   d, $00
    ld   hl, $D401
    add  hl, de
    ld   a, [bc]
    and  $03
    ldi  [hl], a
    inc  b
    ld   a, [bc]
    ldi  [hl], a
    inc  b
    ld   a, [bc]
    ldi  [hl], a
    inc  b
    ld   a, [bc]
    ldi  [hl], a
    inc  b
    ld   a, [bc]
    ldi  [hl], a
    ld   a, e
    add  a, $05
    ld   [$FFE6], a
    jr   .label_325C

.label_3284
    ld   a, [bc]
    cp   $FE
    jr   z, .label_328E
    call .label_32A9
    jr   .label_325C

.label_328E
    ld   a, $01
    ld   [.label_2100], a
    call $6CCE
    ld   a, $36
    ld   [.label_2100], a
    call $6D4D
    ld   a, $21
    ld   [.label_2100], a
    call $53F3
    jp   .label_081D

.label_32A9
    xor  a
    ld   [$FFD7], a
    ld   a, [bc]
    db   $CB, $7F ; Need to handle this instruction 
    jr   z, .label_32B8
    db   $CB, $67 ; Need to handle this instruction 
    jr   nz, .label_32B8
    ld   [$FFD7], a
    inc  b

.label_32B8
    inc  b
    ld   a, [$FFF8]
    ld   e, a
    ld   a, [$DBA5]
    and  a
    jr   nz, .label_32D9
    ld   a, [bc]
    sub  a, $F5
    jr   c, .label_3304
    ld   a, [bc]
    ld   d, a
    dec  bc
    ld   a, [bc]
    ld   e, a
    inc  b
    ld   a, $24
    ld   [.label_2100], a
    call $7578
    call .label_353B
    ret

.label_32D9
    ld   a, [bc]
    sub  a, $EC
    jp  c, .label_33CB
    rst  0
    ld   a, [$1535]
    ld   [hl], $30
    ld   [hl], $4B
    ld   [hl], $64
    ld   [hl], $77
    ld   [hl], $8A
    ld   [hl], $9D
    ld   [hl], $B2
    ld   [hl], $EA
    ld   [hl], $FE
    ld   [hl], $12
    scf
    ld   h, $37
    ld   e, [hl]
    scf
    ld   l, l
    scf
    ld   a, h
    scf
    and  d
    scf
    or   [hl]
    scf

.label_3304
    add  a, $F5
    push af
    ld   d, a
    cp   $E9
    jr   nz, .label_330F
    ld   [$C50E], a

.label_330F
    cp   $5E
    jr   nz, .label_3317
    db   $CB, $6B ; Need to handle this instruction 
    jr   nz, .label_337C

.label_3317
    cp   $91
    jr   nz, .label_3324
    db   $CB, $6B ; Need to handle this instruction 
    jr   z, .label_3324
    pop  af
    ld   a, $5E
    ld   d, a
    push af

.label_3324
    cp   $DC
    jr   nz, .label_3331
    db   $CB, $6B ; Need to handle this instruction 
    jr   z, .label_3331
    pop  af
    ld   a, $91
    ld   d, a
    push af

.label_3331
    cp   $D8
    jr   z, .label_333D
    cp   $D9
    jr   z, .label_333D
    cp   $DA
    jr   nz, .label_3346

.label_333D
    db   $CB, $63 ; Need to handle this instruction 
    jr   z, .label_3346
    pop  af
    ld   a, $DB
    ld   d, a
    push af

.label_3346
    cp   $C2
    jr   nz, .label_3353
    db   $CB, $63 ; Need to handle this instruction 
    jr   z, .label_3353
    pop  af
    ld   a, $E3
    ld   d, a
    push af

.label_3353
    ld   a, d
    cp   $BA
    jr   nz, .label_3361
    db   $CB, $53 ; Need to handle this instruction 
    jr   z, .label_3361
    pop  af
    ld   a, $E1
    ld   d, a
    push af

.label_3361
    ld   a, d
    cp   $D3
    jr   nz, .label_3381
    db   $CB, $63 ; Need to handle this instruction 
    jr   z, .label_3381
    ld   a, [$FFF6]
    cp   $75
    jr   z, .label_337C
    cp   $07
    jr   z, .label_337C
    cp   $AA
    jr   z, .label_337C
    cp   $4A
    jr   nz, .label_3381

.label_337C
    pop  af
    ld   a, $C6
    ld   d, a
    push af

.label_3381
    ld   a, d
    ld   [$FFE0], a
    cp   $C2
    jr   z, .label_33A8
    cp   $E1
    jr   z, .label_33A8
    cp   $CB
    jr   z, .label_33A8
    cp   $BA
    jr   z, .label_33A8
    cp   $61
    jr   z, .label_33A8
    cp   $C6
    jr   z, .label_33A8
    cp   $C5
    jr   z, .label_33A8
    cp   $E2
    jr   z, .label_33A8
    cp   $E3
    jr   nz, .label_33BC

.label_33A8
    ld   a, [$C19C]
    ld   e, a
    inc  a
    and  $03
    ld   [$C19C], a
    ld   d, $00
    ld   hl, $D416
    add  hl, de
    dec  bc
    ld   a, [bc]
    ld   [hl], a
    inc  b

.label_33BC
    ld   a, [$FFE0]
    cp   $C5
    jp   z, .label_347D
    cp   $C6
    jp   z, .label_347D
    jp   .label_34CE

.label_33CB
    add  a, $EC
    ld   [$FFE0], a
    push af
    cp   $CF
    jr   c, .label_33DC
    cp   $D3
    jr   nc, .label_33DC
    ld   hl, $C1A5
    inc  [hl]

.label_33DC
    cp   $AB
    jr   nz, .label_3407
    xor  a
    ld   [$C3CB], a
    ld   a, [$FFF6]
    cp   $C4
    ld   a, [$FFE0]
    jr   z, .label_3407
    ld   hl, $DBC9
    inc  [hl]
    ld   [$C3CB], a
    push af
    ld   a, [$C3CD]
    add  a, $04
    ld   [$C3CD], a
    ld   a, [$FFFE]
    and  a
    jr   nz, .label_3406
    ld   a, $04
    ld   [$C16B], a

.label_3406
    pop  af

.label_3407
    cp   $8E
    jr   z, .label_341E
    cp   $AA
    jr   z, .label_341E
    cp   $DC
    jr   z, .label_3417
    cp   $DB
    jr   nz, .label_3423

.label_3417
    ld   hl, $D6FA
    ld   [hl], $02
    jr   .label_3423

.label_341E
    ld   hl, $D6FA
    ld   [hl], $01

.label_3423
    cp   $3F
    jr   z, .label_342B
    cp   $47
    jr   nz, .label_342F

.label_342B
    db   $CB, $53 ; Need to handle this instruction 
    jr   nz, .label_343B

.label_342F
    cp   $40
    jr   z, .label_3437
    cp   $48
    jr   nz, .label_343F

.label_3437
    db   $CB, $5B ; Need to handle this instruction 
    jr   z, .label_343F

.label_343B
    pop  af
    ld   a, $3D
    push af

.label_343F
    cp   $41
    jr   z, .label_3447
    cp   $49
    jr   nz, .label_344B

.label_3447
    db   $CB, $4B ; Need to handle this instruction 
    jr   nz, .label_3457

.label_344B
    cp   $42
    jr   z, .label_3453
    cp   $4A
    jr   nz, .label_345B

.label_3453
    db   $CB, $43 ; Need to handle this instruction 
    jr   z, .label_345B

.label_3457
    pop  af
    ld   a, $3E
    push af

.label_345B
    cp   $A1
    jr   nz, .label_3467
    db   $CB, $63 ; Need to handle this instruction 
    jr   nz, .label_3467
    pop  af
    ld   a, [$FFE9]
    push af

.label_3467
    cp   $BF
    jr   nz, .label_3471
    db   $CB, $63 ; Need to handle this instruction 
    jr   nz, .label_3471
    pop  af
    ret

.label_3471
    cp   $BE
    jr   z, .label_347D
    cp   $BF
    jr   z, .label_347D
    cp   $CB
    jr   nz, .label_3496

.label_347D
    dec  bc
    ld   a, $01
    ld   [$FFAC], a
    ld   a, [bc]
    and  $F0
    add  a, $10
    ld   [$FFAE], a
    ld   a, [bc]
    db   $CB, $37 ; Need to handle this instruction 
    and  $F0
    add  a, $08
    ld   [$FFAD], a
    inc  b
    jp   .label_34CE

.label_3496
    cp   $D6
    jr   z, .label_349E
    cp   $D5
    jr   nz, .label_34A6

.label_349E
    db   $CB, $63 ; Need to handle this instruction 
    jr   nz, .label_34A6
    pop  af
    ld   a, $21
    push af

.label_34A6
    cp   $D7
    jr   z, .label_34AE
    cp   $D8
    jr   nz, .label_34B6

.label_34AE
    db   $CB, $63 ; Need to handle this instruction 
    jr   nz, .label_34B6
    pop  af
    ld   a, $22
    push af

.label_34B6
    ld   a, [$FFF7]
    cp   $0A
    ld   a, [$FFE0]
    jr   c, .label_34C2
    cp   $A9
    jr   z, .label_34C6

.label_34C2
    cp   $DE
    jr   nz, .label_34CE

.label_34C6
    db   $CB, $73 ; Need to handle this instruction 
    jr   z, .label_34CE
    pop  af
    ld   a, $0D

.label_34CD
    push af

.label_34CE
    cp   $A0
    jr   nz, .label_34DA
    db   $CB, $63 ; Need to handle this instruction 
    jr   z, .label_34DA
    pop  af
    ld   a, $A1
    push af

.label_34DA
    ld   d, $00
    ld   a, [$FFD7]
    and  a
    jr   z, .label_352D
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   hl, $D711
    add  hl, de
    ld   a, [$FFD7]
    and  $0F
    ld   e, a
    pop  af
    ld   d, a

.label_34EF
    ld   a, d
    ldi  [hl], a
    ld   a, [$FFD7]
    and  $40
    jr   z, .label_34FB
    ld   a, l
    add  a, $0F
    ld   l, a

.label_34FB
    dec  e
    jr   nz, .label_34EF
    inc  b
    ret

.label_3500
    cp   $04
    ret  z
    cp   $09
    jr   nz, .label_350E
    ld   a, [$FFF6]
    cp   $97
    ret  nz
    jr   .label_3527

.label_350E
    cp   $E1
    jr   nz, .label_351D
    ld   a, [$FFF6]
    cp   $0E
    ret  z
    cp   $0C
    ret  z
    cp   $1B
    ret  z

.label_351D
    ld   a, [$FFF6]
    cp   $80
    jr   nc, .label_3527
    ld   a, $09
    jr   .label_3529

.label_3527
    ld   a, $1A

.label_3529
    call .label_0B2F
    ret

.label_352D
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   hl, $D711
    add  hl, de
    pop  af
    ld   [hl], a
    call .label_3500
    inc  b
    ret

.label_353B
    ld   a, [$FFF6]
    cp   $80
    jr   nc, .label_3545
    ld   a, $09
    jr   .label_3547

.label_3545
    ld   a, $1A

.label_3547
    ld   [.label_2100], a
    ret

.label_354B
    push hl
    push de
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [de]
    cp   $E1
    jr   z, .label_3560
    cp   $E2
    jr   z, .label_3560
    cp   $E3
    jr   nz, .label_357C

.label_3560
    push af
    push hl
    push de
    ld   a, l
    sub  a, $11
    push af
    ld   a, [$C19C]
    ld   e, a
    inc  a
    and  $03
    ld   [$C19C], a
    ld   d, $00
    ld   hl, $D416
    add  hl, de
    pop  af
    ld   [hl], a
    pop  de
    pop  hl
    pop  af

.label_357C
    ld   [hl], a
    call .label_3500
    inc  de
    inc  b
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, .label_354B
    pop  bc
    ret

.label_358B
    push hl
    push de
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [de]
    cp   $E1
    jr   z, .label_35A0
    cp   $E2
    jr   z, .label_35A0
    cp   $E3
    jr   nz, .label_35BC

.label_35A0
    push af
    push hl
    push de
    ld   a, l
    sub  a, $11
    push af
    ld   a, [$C19C]
    ld   e, a
    inc  a
    and  $03
    ld   [$C19C], a
    ld   d, $00
    ld   hl, $D416
    add  hl, de
    pop  af
    ld   [hl], a
    pop  de
    pop  hl
    pop  af

.label_35BC
    ld   [hl], a
    call .label_35CB
    inc  de
    inc  b
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, .label_358B
    pop  bc
    ret

.label_35CB
    cp   $04
    ret  z
    cp   $09
    jr   nz, .label_35D9
    ld   a, [$FFF6]
    cp   $97
    ret  nz
    jr   .label_35E8

.label_35D9
    cp   $E1
    jr   nz, .label_35E8
    ld   a, [$FFF6]
    cp   $0E
    ret  z
    cp   $0C
    ret  z
    cp   $1B
    ret  z

.label_35E8
    ld   a, $24
    call .label_0B2F
    ret

.label_35EE
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    ld   hl, $D711
    add  hl, de
    ret

.label_35F8
    dec  l
    ld   l, $1E
    nop
    call .label_373F
    ld   a, [$FFF8]
    and  $04
    jp   nz, .label_36B2
    push bc
    call .label_35EE
    ld   bc, $37E1
    ld   de, .label_35F8
    jp   .label_354B

.label_3613
    db   $2F, $30, $1E, 1, $CD, $3F, $37, $F0, $F8, $E6, 8, $C2, $EA, $36, $C5, $CD
    db   $EE, $35, 1, $E1, $37, $11, $13, $36, $C3, $4B, $35

.label_362E
    db   $31, $32, $1E, 2, $CD, $3F, $37, $F0, $F8, $E6, 2, $C2, $FE, $36, $C5, $CD
    db   $EE, $35, 1, $E4, $37, $11, $2E, $36, $C3, $4B, $35

.label_3649
    db   $33, $34, $1E, 3, $CD, $3F, $37, $F0, $F8, $E6, 1, $C2, $12, $37, $C5, $CD
    db   $EE, $35, 1, $E4, $37, $11, $49, $36, $C3, $4B, $35, $1E, 4, $CD, $3F, $37
    db   $FA, $8A, $C1, $F6, 1, $EA, $8A, $C1, $EA, $8B, $C1, $C3, $B2, $36

.label_3677
    db   $C3, $EA, $36, $1E, 6, $CD, $3F, $37, $FA, $8A, $C1, $F6, 4, $EA, $8A, $C1
    db   $EA, $8B, $C1, $C3, $FE, $36, $1E, 7, $CD, $3F, $37, $FA, $8A, $C1, $F6, 8
    db   $EA, $8A, $C1, $EA, $8B, $C1, $C3, $12, $37

.label_36B0
    db $43, $44

.label_36B2
    ld   a, $04
    call .label_36C4
    push bc
    call .label_35EE
    ld   bc, $37E1
    ld   de, .label_36B0
    jp   .label_354B

.label_36C4
    push af
    ld   hl, $D900
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_36D8
    ld   hl, $DDE0
    jr   .label_36E1

.label_36D8
    cp   $1A
    jr   nc, .label_36E1
    cp   $06
    jr   c, .label_36E1
    inc  d

.label_36E1
    add  hl, de
    pop  af
    or   [hl]
    ld   [hl], a
    ld   [$FFF8], a
    ret

.label_36E8
    adc  a, h
    ld   [.label_083E], sp
    call .label_36C4
    push bc
    call .label_35EE
    ld   bc, $37E1
    ld   de, .label_36E8
    jp   .label_354B

.label_36FC
    add  hl, bc
    ld   a, [bc]

.label_36FE
    ld   a, $02
    call .label_36C4
    push bc
    call .label_35EE
    ld   bc, $37E4
    ld   de, .label_36FC
    jp   .label_354B

.label_3710
    dec  bc
    inc  c

.label_3712
    ld   a, $01
    call .label_36C4
    push bc
    call .label_35EE
    ld   bc, $37E4
    ld   de, .label_3710
    jp   .label_354B

.label_3724
    and  h
    and  l
    ld   e, $08
    call .label_373F
    ld   a, [$FFF8]
    and  $04
    jp   nz, .label_36B2
    push bc
    call .label_35EE
    ld   bc, $37E1
    ld   de, .label_3724
    jp   .label_354B

.label_373F
    ld   d, $00
    ld   hl, $C1F0
    add  hl, de
    dec  bc
    ld   a, [bc]
    ld   [hl], a
    push af
    and  $F0
    ld   hl, $C1E0
    add  hl, de
    ld   [hl], a
    pop  af
    db   $CB, $37 ; Need to handle this instruction 
    and  $F0
    ld   hl, $C1D0
    add  hl, de
    ld   [hl], a
    inc  b
    ret

.label_375C
    xor  a
    or   b
    push bc
    call .label_35EE
    ld   bc, $37E4
    ld   de, .label_375C
    jp   .label_354B

.label_376B
    or   c
    or   d
    push bc
    call .label_35EE
    ld   bc, $37E1
    ld   de, .label_376B
    jp   .label_354B

.label_377A
    ld   b, l
    ld   b, [hl]
    push bc
    call .label_35EE
    ld   bc, $37E1
    ld   de, .label_377A
    jp   .label_354B

.label_3789
    nop
    ld   bc, $0302
    stop
    ld   [de], a
    inc  de
    jr   nz, .label_37B4
    ldi  [hl], a
    inc  hl
    rst  $38

.label_3796
    or   e
    or   h
    or   h
    or   l
    or   [hl]
    or   a
    cp   b
    cp   c
    cp   d
    cp   e
    cp   h
    cp   l
    ld   a, $08
    call .label_36C4
    push bc
    call .label_35EE
    ld   bc, $3789
    ld   de, .label_3796
    jp   .label_354B

.label_37B4
    pop  bc
    jp   nz, $F7F0
    cp   $1A
    jr   nc, .label_37CF
    cp   $06
    jr   c, .label_37CF
    ld   a, [$FFF6]
    cp   $D3
    jr   nz, .label_37CF
    ld   a, [$DB46]
    and  a
    jr   z, .label_37CF
    jp   .label_3677

.label_37CF
    ld   a, $01
    call .label_36C4
    push bc
    call .label_35EE
    ld   bc, $37E1
    ld   de, .label_37B4
    jp   .label_354B

.label_37E1
    nop
    ld   bc, $00FF
    stop

.label_37E7
    ld   [$FFE9], a
    ld   d, $80
    ld   hl, $D711
    ld   e, a

.label_37EF
    ld   a, l
    and  $0F
    jr   z, .label_37F9
    cp   $0B
    jr   nc, .label_37F9
    ld   [hl], e

.label_37F9
    inc  hl
    dec  d
    jr   nz, .label_37EF
    ret
    ld   a, $01
    ld   [.label_2100], a
    call $5F02
    ld   a, $16
    ld   [.label_2100], a
    xor  a
    ld   [$FFE4], a
    ld   a, [$FFF6]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    ld   hl, $4000
    ld   a, [$DBA5]
    and  a
    jr   z, .label_3868
    ld   a, [$FFF7]
    cp   $06
    jr   nz, .label_3850
    ld   a, [$DB6F]
    ld   hl, $FFF6
    cp   [hl]
    jr   nz, .label_3850
    ld   a, $A8
    call .label_3B86
    ld   a, [$DB70]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$DB71]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    call .label_38D4
    ld   hl, $C460
    add  hl, de
    ld   [hl], $FF
    xor  a
    ld   [$FFE4], a

.label_3850
    ld   hl, $4200
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, .label_385E
    ld   hl, $4600
    jr   .label_3868

.label_385E
    cp   $1A
    jr   nc, .label_3868
    cp   $06
    jr   c, .label_3868
    inc  h
    inc  h

.label_3868
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a

.label_386D
    ld   a, [bc]
    cp   $FF
    jr   z, .label_3877
    call .label_3883
    jr   .label_386D

.label_3877
    call .label_081D
    ret

.label_387B
    db   1, 2, 4, 8, $10, $20, $40, $80

.label_3883
    ld   a, [$FFE4]
    cp   $08
    jr   nc, .label_389B
    ld   e, a
    ld   d, $00
    ld   hl, $387B
    add  hl, de
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [hl]
    ld   hl, $CF00
    add  hl, de
    and  [hl]
    jr   nz, .label_38AD

.label_389B
    ld   e, $00
    ld   d, e

.label_389E
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $00
    jr   z, .label_38B4
    inc  e
    ld   a, e
    cp   $10
    jr   nz, .label_389E

.label_38AD
    ld   hl, $FFE4
    inc  [hl]
    inc  b
    inc  b
    ret

.label_38B4
    ld   [hl], $04
    ld   a, [bc]
    and  $F0
    ld   hl, $C210
    add  hl, de
    add  a, $10
    ld   [hl], a
    ld   a, [bc]
    inc  b
    db   $CB, $37 ; Need to handle this instruction 
    and  $F0
    ld   hl, $C200
    add  hl, de
    add  a, $08
    ld   [hl], a
    ld   hl, $C3A0
    add  hl, de
    ld   a, [bc]
    inc  b
    ld   [hl], a

.label_38D4
    ld   a, $03
    ld   [.label_2100], a
    call $6524
    ld   a, $01
    ld   [.label_2100], a
    call $5EAB
    ld   a, $16
    ld   [.label_2100], a
    ret

.label_38EA
    ld   e, a
    ld   a, $14
    ld   [.label_2100], a
    ld   a, e
    push bc
    call $4880
    pop  bc
    ld   a, [$FFE8]
    ld   [.label_2100], a
    ret
    ld   a, $20
    ld   [.label_2100], a
    call $588B
    ret

.label_3905
    ld   a, [$DBA5]
    and  a
    jr   nz, .label_390F
    ld   a, $1A
    jr   .label_3911

.label_390F
    ld   a, $08

.label_3911
    ld   [.label_2100], a
    ret
    ld   a, $27
    ld   [.label_2100], a
    jp   $7FC5
    ld   a, $20
    ld   [.label_2100], a
    jp   $7DE6
    ld   a, $14
    ld   [.label_2100], a
    ld   hl, $5218
    add  hl, de
    ld   a, [hl]
    ld   hl, $2100
    ld   [hl], $05
    ret
    ld   a, $19
    call .label_080C
    call $7C50
    ld   a, $03
    jp   .label_080C

.label_3942
    ld   a, $03
    ld   [.label_2100], a
    call $53E4
    jp   .label_081D
    ld   a, $14
    ld   [.label_2100], a
    call $54AC
    jp   .label_081D
    ld   a, $01
    call .label_080C
    call $5FB3
    ld   a, $02
    jp   .label_080C
    ld   a, $03
    ld   [.label_2100], a
    call $485B
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $7EFE
    jp   .label_081D
    ld   a, $14
    ld   [.label_2100], a
    call $5347
    ld   a, $03
    ld   [.label_2100], a
    ret

.label_3989
    db   0, 8, $10, $18

.label_398D
    ld   hl, $C5A7
    ld   a, [hl]
    and  a
    jr   z, .label_399B
    dec  [hl]
    jr   nz, .label_399B
    ld   a, $10
    ld   [$FFF3], a

.label_399B
    ld   a, [$C19F]
    and  a
    jr   nz, .label_39AE
    ld   a, [$C111]
    ld   [$C1A8], a
    and  a
    jr   z, .label_39AE
    dec  a
    ld   [$C111], a

.label_39AE
    ld   a, [$C11C]
    cp   $07
    ret  z
    xor  a
    ld   [$C3C1], a
    ld   a, [$FFF7]
    cp   $0A
    ld   a, [$FFE7]
    jr   c, .label_39C1
    xor  a

.label_39C1
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, $3989
    add  hl, de
    ld   a, [hl]
    ld   [$C3C0], a
    ld   a, $20
    ld   [.label_2100], a
    call $4303
    xor  a
    ld   [.label_2100], a
    ld   a, [$C19F]
    and  a
    jr   nz, .label_39E3
    ld   [$C1AD], a

.label_39E3
    ld   a, $20
    ld   [$DBAF], a
    ld   [.label_2100], a
    call $6352
    ld   b, $00
    ld   c, $0F

.label_39F2
    ld   a, c
    ld   [$C123], a
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .label_3A03
    ld   [$FFEA], a
    call .label_3A18

.label_3A03
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, .label_39F2
    ret
    ld   a, $15
    ld   [.label_2100], a
    call $4000
    ld   a, $03
    ld   [.label_2100], a
    ret

.label_3A18
    ld   hl, $C3A0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEB], a
    ld   hl, $C290
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF0], a
    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ld   [$FFF1], a
    ld   a, $19
    ld   [$DBAF], a
    ld   [.label_2100], a
    ld   a, [$FFEB]
    cp   $6A
    jr   nz, .label_3A40
    ld   a, [$FFB2]
    and  a
    jr   nz, .label_3A46

.label_3A40
    ld   a, [$FFEA]
    cp   $07
    jr   nz, .label_3A4E

.label_3A46
    call $7964
    call .label_3D8A
    jr   .label_3A54

.label_3A4E
    call .label_3D8A
    call $7964

.label_3A54
    ld   a, $14
    ld   [$DBAF], a
    ld   [.label_2100], a
    call $4D73
    ld   a, $03
    ld   [$DBAF], a
    ld   [.label_2100], a
    ld   a, [$FFEA]
    cp   $05
    jp   z, .label_3A8D
    rst  0
    add  hl, bc
    db   $3A ; ldd  a, [hl]
    jr   .label_3AC8
    or   [hl]
    ld   c, h
    ld   c, h
    ld   c, h
    or   l
    ld   c, b
    adc  a, l
    db   $3A ; ldd  a, [hl]
    rlca
    ld   c, [hl]
    ldd  [hl], a
    ld   d, a
    sub  a, h
    ld   c, l
    call .label_3A8D
    ld   a, $03
    ld   [$DBAF], a
    ld   [.label_2100], a
    ret

.label_3A8D
    ld   a, $20
    ld   [.label_2100], a
    ld   a, [$FFEB]
    ld   e, a
    ld   d, b
    ld   hl, $4000
    add  hl, de
    add  hl, de
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    inc  hl
    ld   a, [hl]
    ld   l, e
    ld   h, d
    ld   [$DBAF], a
    ld   [.label_2100], a
    jp   [hl]

.label_3AAA
    db   8, 5, 8, 5, 8, $A, 8, $A, 8, $A, 8, $A, 8, $10, 4, $A
    db   8, 2, 8, 2, 8, $13, 8, $13, 8, 6, 6, 8, 8, 7

.label_3AC8
    ld   b, $0A
    ld   [.label_1006], sp
    jr   nc, .label_3AD7
    rlca
    inc  b
    ld   a, [bc]
    inc  c
    rlca
    db   $FC, $04, $10; call    m, sub_1004

.label_3AD7
    db   $10, $C, $12, 8, 8, 2, 8, $10, $C, 8, $10, 8, 7, $C, 8, 8
    db   8, 2, 8, $21, $50, $C3, 9, $7E, $E6, $7C, $5F, $50, $21, $AA, $3A, $19
    db   $5D, $54, $C5, $CB, $21, $CB, $21, $21, $80, $D5, 9, $E, 4

.label_3B04
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, .label_3B04
    pop  bc
    ret

.label_3B0C
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    ret
    ld   hl, $C290
    add  hl, bc
    inc  [hl]
    ret
    ld   a, $02
    ld   [.label_2100], a
    call $75F5
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $7893
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $7CAB
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $6E28
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $6C6B
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $6BDE
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $6C77
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $73EB
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $6E2B
    jp   .label_081D
    ld   a, $03
    ld   [.label_2100], a
    call $75A2
    jp   .label_081D

.label_3B86
    push af
    ld   a, $03
    ld   [.label_2100], a
    pop  af
    call $64CA
    db   $CB, $1D ; Need to handle this instruction 
    call .label_081D
    db   $CB, $15 ; Need to handle this instruction 
    ret
    push af
    ld   a, $03
    ld   [.label_2100], a
    pop  af
    call $64CC
    db   $CB, $1D ; Need to handle this instruction 
    call .label_081D
    db   $CB, $15 ; Need to handle this instruction 
    ret
    ld   hl, $2100
    ld   [hl], $03
    call $7EC7
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $03
    call $7E45
    jp   .label_081D
    ld   a, [$FFF1]
    inc  a
    ret  z
    call .label_3D57
    push de
    ld   a, [$C3C0]
    ld   e, a
    ld   d, b
    ld   hl, $C030
    add  hl, de
    ld   e, l
    ld   d, h
    ld   a, [$FFEC]
    ld   [de], a
    inc  de
    ld   a, [$C155]
    ld   c, a
    ld   a, [$FFED]
    and  $20
    rra
    rra
    ld   hl, $FFEE
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  de
    ld   a, [$FFF1]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    pop  hl
    add  hl, bc
    ld   a, [$FFF5]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, .label_3C08
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de

.label_3C08
    inc  de
    ld   a, [hli]
    push hl
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a
    ld   a, [$FFFE]
    and  a
    jr   z, .label_3C21
    ld   a, [$FFED]
    and  $10
    jr   z, .label_3C21
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

.label_3C21
    inc  de
    ld   a, [$FFEC]
    ld   [de], a
    inc  de
    ld   a, [$C155]
    ld   c, a
    ld   a, [$FFED]
    and  $20
    xor  $20
    rra
    rra
    ld   hl, $FFEE
    sub  a, c
    add  a, [hl]
    ld   [de], a
    inc  de
    pop  hl
    ld   a, [$FFF5]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, .label_3C4B
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de

.label_3C4B
    inc  de
    ld   a, [hl]
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a
    ld   a, [$FFFE]
    and  a
    jr   z, .label_3C63
    ld   a, [$FFED]
    and  $10
    jr   z, .label_3C63
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

.label_3C63
    ld   a, [$C123]
    ld   c, a
    ld   b, $00
    ld   a, $15
    ld   [.label_2100], a
    call $795D

.label_3C71
    call $7995
    jp   .label_081D
    ld   a, [$FFF1]
    inc  a
    ret  z
    call .label_3D57
    push de
    ld   a, [$C3C0]
    ld   l, a
    ld   h, $00
    ld   bc, $C030
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   a, [$C123]
    ld   c, a
    ld   b, $00
    ld   a, [$FFF9]
    and  a
    ld   a, [$FFEC]
    jr   z, .label_3C9C
    sub  a, $04
    ld   [$FFEC], a

.label_3C9C
    ld   [de], a
    inc  de
    ld   a, [$C155]
    ld   h, a
    ld   a, [$FFEE]
    add  a, $04
    sub  a, h
    ld   [de], a
    inc  de
    ld   a, [$FFF1]
    ld   c, a
    ld   b, $00
    db   $CB, $21 ; Need to handle this instruction 
    db   $CB, $10 ; Need to handle this instruction 
    pop  hl
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [$FFFE]
    and  a
    jr   z, .label_3CD0
    ld   a, [$DB95]
    cp   $01
    jr   z, .label_3CD0
    ld   a, [$FFED]
    and  a
    jr   z, .label_3CD0
    ld   a, [hl]
    and  $F8
    or   $04
    ld   [de], a
    jr   .label_3CD6

.label_3CD0
    ld   a, [hli]
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a

.label_3CD6
    inc  de
    jr   .label_3C63
    ld   a, $15
    ld   [.label_2100], a
    jr   .label_3C71
    push hl
    ld   hl, $C000
    jr   .label_3CF6

.label_3CE6
    ld   a, [$FFF1]
    inc  a
    jr   z, .label_3D52
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de

.label_3CF6
    ld   e, l
    ld   d, h
    pop  hl
    ld   a, c
    ld   [$FFD7], a
    ld   a, [$C123]
    ld   c, a
    call .label_3D57
    ld   a, [$FFD7]
    ld   c, a

.label_3D06
    ld   a, [$FFEC]
    add  a, [hl]
    ld   [de], a
    inc  hl
    inc  de
    push bc
    ld   a, [$C155]
    ld   c, a
    ld   a, [$FFEE]
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  hl
    inc  de
    ld   a, [$FFF5]
    ld   c, a
    ld   a, [hli]
    push af
    add  a, c
    ld   [de], a
    pop  af
    cp   $FF
    jr   nz, .label_3D28
    dec  de
    xor  a
    ld   [de], a
    inc  de

.label_3D28
    pop  bc
    inc  de
    ld   a, [$FFED]
    xor  [hl]
    ld   [de], a
    inc  hl
    ld   a, [$FFFE]
    and  a
    jr   z, .label_3D3F
    ld   a, [$FFED]
    and  a
    jr   z, .label_3D3F
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

.label_3D3F
    inc  de
    dec  c
    jr   nz, .label_3D06
    ld   a, [$C123]
    ld   c, a
    ld   a, $15
    ld   [.label_2100], a
    call $795D
    jp   .label_081D

.label_3D52
    ld   a, [$C123]
    ld   c, a
    ret

.label_3D57
    push hl
    ld   a, [$C124]
    and  a
    jr   z, .label_3D7D
    ld   a, [$FFEE]
    dec  a
    cp   $C0
    jr   nc, .label_3D7C
    ld   a, [$FFEC]
    dec  a
    cp   $88
    jr   nc, .label_3D7C
    ld   hl, $C220
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, .label_3D7C
    ld   hl, $C230
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .label_3D7D

.label_3D7C
    pop  af

.label_3D7D
    pop  hl
    ret
    ld   hl, $C240
    add  hl, bc
    ld   [hl], b
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    ret

.label_3D8A
    ld   hl, $C200
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEE], a
    ld   hl, $C210
    add  hl, bc
    ld   a, [hl]
    ld   [$FFEF], a
    ld   hl, $C310
    add  hl, bc
    sub  a, [hl]
    ld   [$FFEC], a
    ret
    ld   hl, $2100
    ld   [hl], $15
    call $7964
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $04
    call $5A1A
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $04
    call $5690
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $04
    call $504B
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $04
    call $49BD
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $36
    call $72AB
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $05
    call $6CC6
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $05
    call $6818
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $05
    call $6302
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $05
    call $5A1E
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $05
    call $556B
    jp   .label_081D
    ld   a, [$DBAF]
    push af
    ld   a, $02
    call .label_080C
    call $6C75
    pop  af
    jp   .label_080C
    ld   hl, $2100
    ld   [hl], $04
    call $5C63
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $03
    call $5407
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $02
    call $62CE
    call $6414
    jp   .label_081D
    ld   a, $02
    call .label_080C
    call $41D0
    ld   a, $03
    jp   .label_080C
    ld   hl, $2100
    ld   [hl], $20
    ld   c, $01
    ld   b, $00
    ld   e, $FF
    call $5C9C
    jp   .label_081D
    ld   hl, $2100
    ld   [hl], $03
    call $6472
    jp   .label_081D
    ld   a, $06
    call .label_080C
    call $783C
    ld   a, $03
    jp   .label_080C
    ld   e, $10
    ld   hl, $C280

.label_3E88
    xor  a
    ldi  [hl], a
    dec  e
    jr   nz, .label_3E88
    ret
    ld   hl, $C4A0
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z
    ld   a, [$FFE7]
    xor  c
    and  $03
    ret  nz
    ld   a, [$FFEE]
    ld   [$FFD7], a
    ld   a, [$FFEC]
    ld   [$FFD8], a
    ld   a, $08
    call .label_0CC7
    ld   hl, $C520
    add  hl, de
    ld   [hl], $0F
    ret
    ld   hl, $C3F0
    add  hl, bc
    ld   a, [hl]
    db   $CB, $7F ; Need to handle this instruction 
    jr   z, .label_3EBA
    cpl
    inc  a

.label_3EBA
    ld   [$FFD7], a
    ld   hl, $C400
    add  hl, bc
    ld   a, [hl]
    db   $CB, $7F ; Need to handle this instruction 
    jr   z, .label_3EC7
    cpl
    inc  a

.label_3EC7
    ld   e, $03
    ld   hl, $FFD7
    cp   [hl]
    jr   c, .label_3ED1
    ld   e, $0C

.label_3ED1
    ld   a, e
    ld   hl, $C2A0
    add  hl, bc
    and  [hl]
    jr   z, .label_3EDE
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b

.label_3EDE
    ret

.label_3EDF
    or   b
    or   h
    or   c
    or   d
    or   e
    or   [hl]
    cp   d
    cp   h
    cp   b
    ld   hl, $C14F
    ld   a, [$C124]
    or   [hl]
    ret  nz
    ld   a, [$C165]
    and  a
    jr   z, .label_3EFB
    dec  a
    ld   [$C165], a
    ret

.label_3EFB
    ld   a, [$C1BD]
    and  a
    ret  nz
    inc  a
    ld   [$C1BD], a
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $04
    ld   a, $19
    jr   z, .label_3F11
    ld   a, $50

.label_3F11
    ld   [$D368], a
    ld   [$FFBD], a
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFEB]
    cp   $87
    jr   nz, .label_3F26
    ld   a, $DA
    jr   .label_3F45

.label_3F26
    cp   $BC
    jr   nz, .label_3F2E
    ld   a, $26
    jr   .label_3F45

.label_3F2E
    ld   hl, $C430
    add  hl, bc
    ld   a, [hl]
    and  $04
    ret  nz
    ld   a, [$FFF7]
    cp   $FF
    ret  z
    cp   $05
    ret  z
    ld   e, a
    ld   d, b
    ld   hl, $3EDF
    add  hl, de
    ld   a, [hl]

.label_3F45
    jp   .label_2385

.label_3F48
    db   1, 2, 4, 8, $10, $20, $40, $80

.label_3F50
    ld   a, $03
    ld   [$C113], a
    ld   [.label_2100], a
    call $55CF
    call .label_081D
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, .label_3F8D
    push af
    ld   a, [$DBB5]
    ld   e, a
    ld   d, b
    inc  a
    ld   [$DBB5], a
    ld   a, [hl]
    ld   hl, $DBB6
    add  hl, de
    ld   [hl], a
    pop  af
    cp   $08
    jr   nc, .label_3F8D
    ld   e, a
    ld   d, b
    ld   hl, $3F48
    add  hl, de
    ld   a, [$FFF6]
    ld   e, a
    ld   d, b
    ld   a, [hl]
    ld   hl, $CF00
    add  hl, de
    or   [hl]
    ld   [hl], a

.label_3F8D
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

.label_3F93
    ld   a, $05
    ld   [.label_2100], a
    ld   hl, $59DE
    ld   de, $8460
    ld   bc, $0010
    call .label_2914
    ld   hl, $59EE
    jr   .label_3FBD

.label_3FA9
    ld   a, $05
    ld   [.label_2100], a
    ld   hl, $59FE
    ld   de, $8460
    ld   bc, $0010
    call .label_2914
    ld   hl, $5A0E

.label_3FBD
    ld   de, $8480
    ld   bc, $0010
    call .label_2914
    xor  a
    ld   [$FFA5], a
    ld   a, $0C
    ld   [.label_2100], a
    jp   .label_1D2E
    ld   b, $34
    ld   a, [$FFFE]
    and  a
    jr   z, .label_3FD9
    inc  b

.label_3FD9
    ld   a, b
    ld   [.label_2100], a
    ld   hl, $4000
    ld   de, $8400
    ld   bc, $0400
    call .label_2914
    ld   a, $20
    ld   [.label_2100], a
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

section "bank1",romx,bank[$1]
    xor    a

