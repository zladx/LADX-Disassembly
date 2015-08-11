; The source code found here assembles to main.o.

; If it starts to take a long time to build, it's a good idea
; to split your code and data up into new objects in the makefile.


include "constants.asm"

include "code/rst.asm"
include "code/header.asm"


section "Main", rom0

Start:
    cp   a, $11
    jr   nz, .loc_16E
    ld   a, [rKEY1]
    and  a, $80
    jr   nz, .loc_167
    ld   a, $30
    ld   [rJOYP], a
    ld   a, 1
    ld   [rKEY1], a
    xor  a
    ld   [rIE], a
    stop

.loc_167
    xor  a
    ld   [rSVBK], a
    ld   a, 1
    jr   .loc_16F

.loc_16E
    xor  a

.loc_16F
    ld   [$FFFE], a
    call .LCDDisplayEnable
    ld   sp, $DFFF
    ld   a, $3C
    ld   [$2100], a
    call $6A22 ; TODO: Call into other rom bank
    xor  a
    ld   [rBGP], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   hl, $8000
    ld   bc, $1800
    call .ZeroMemory
    ld   a, $24
    ld   [$2100], a
    call $5C00 ; TODO: Call into other rom bank
    call .FillBGMapWith7F
    call .ClearHRAMAndWRAM
    ld   a, 1
    ld   [$2100], a
    call $6D32 ; TODO: Call into other rom bank
    call $FFC0 ; TODO: Call into other rom bank
    call $410D ; TODO: Call into other rom bank
    call .sub_2BCF
    ld   a, $44
    ld   [rSTAT], a
    ld   a, $4F
    ld   [rLYC], a
    ld   a, 1
    ld   [$DBAF], a
    ld   a, 1
    ld   [rIE], a
    call $46AA ; TODO: Call into other rom bank
    ld   a, $1F
    ld   [$2100], a
    call $4000 ; TODO: Call into other rom bank
    ld   a, $18
    ld   [$FFB5], a
    ei
    ld   a, $20
    ld   [$2100], a
    call $4854
    jp   .loc_35F

.loc_1DA
    ld   a, $01
    ld   [$FFFD], a
    ld   a, [$C500]
    and  a
    jr   z, .loc_1F2
    ld   a, [$DB95]
    cp   a, $0B
    jr   nz, .loc_1F2
    ld   a, [$FFE7]
    rrca 
    and  a, $80
    jr   .loc_1F8

.loc_1F2
    ld   hl, $C156
    ld   a, [$FF97]
    add  [hl]

.loc_1F8
    ld   [$FF42], a
    ld   a, [$FF96]
    ld   hl, $C155
    add  [hl]
    ld   hl, $C1BF
    add  [hl]
    ld   [$FF43], a
    ld   a, [$D6FE]
    and  a
    jr   nz, .loc_213
    ld   a, [$D6FF]
    cp   a, $00
    jr   z, .loc_23D

.loc_213
    ld   a, [$DB95]
    cp   a, $09
    jr   z, .loc_229
    cp   a, $06
    jr   c, .loc_229
    cp   a, $0B
    jr   nz, .loc_22F
    ld   a, [$DB96]
    cp   a, $07
    jr   nc, .loc_22F

.loc_229
    call .sub_8A4
    call .sub_8A4

.loc_22F
    di   
    call .sub_419
    ei   
    call .sub_8A4
    call .sub_8A4
    jp   .loc_35F

.loc_23D
    ld   a, [$D6FD]
    and  a, $7F
    ld   e, a
    ld   a, [$FF40]
    and  a, $80
    or   e
    ld   [$FF40], a
    ld   hl, $FFE7
    inc  [hl]
    ld   a, [$DB95]
    cp   a, $00
    jr   nz, .loc_264
    ld   a, [$DB96]
    cp   a, $08
    jr   c, .loc_264
    ld   a, $20
    ld   [$2100], a
    call $5257

.loc_264
    ld   a, [$C17F]
    and  a
    jp   z, .loc_2D5
    inc  a
    jr   nz, .loc_279

.loc_26E
    ld   a, $17
    ld   [$2100], a
    call $48DD
    jp   .loc_2D5

.loc_279
    inc  a
    jr   z, .loc_26E
    ld   a,$14
    ld   [$2100],a
    ld   a,[$C180]
    inc  a
    ld   [$C180],a
    cp   a,$C0
    jr   nz, .loc_2A0
    ld   a,[$C17F]
    cp   a,$02
    jr   nz, .loc_296
    call $4E51

.loc_296
    xor  a
    ld   [$C17F],a
    ld   [$C3CA],a
    jp   .loc_2D5

.loc_2A0
    push af
    cp   a,$60
    jr   c, .loc_2B7
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_2B4
    ld   a,$20
    ld   [$2100],a
    call $6CA7
    jr   .loc_2B7

.loc_2B4
    call $4FE8

.loc_2B7
    ld   a,$14
    ld   [$2100],a
    pop  af
    call $5038
    call .sub_8A4
    ld   a,[$DB97]
    ld   [$FF47],a
    ld   a,[$DB98]
    ld   [$FF48],a
    ld   a,[$DB99]
    ld   [$FF49],a
    jp   .loc_35F

.loc_2D5
    ld   a,[$DB9A]
    ld   [$FF4A],a
    ld   a,[$DB97]
    ld   [$FF47],a
    ld   a,[$DB98]
    ld   [$FF48],a
    ld   a,[$DB99]
    ld   [$FF49],a
    call .sub_8A4
    call $281E
    ld   a,[$FF90]
    ld   hl,$FF91
    or   [hl]
    ld   hl,$C10E
    or   [hl]
    jr   nz, .loc_35F
    ld   a,[$0003]
    and  a
    jr   z, .loc_32D
    ld   a,[$D6FC]
    and  a
    jr   nz, .loc_30D
    ld   a,[$FFCB]
    and  a,$0F
    jr   z, .loc_327

.loc_30D
    ld   a,[$FFCC]
    and  a,$40
    jr   z, .loc_327
    ld   a,[$D6FC]
    xor  a,$01
    ld   [$D6FC],a
    jr   nz, .loc_35F
    ld   a,[$C17B]
    xor  a,$10
    ld   [$C17B],a
    jr   .loc_35F

.loc_327
    ld   a,[$D6FC]
    and  a
    jr   nz, .loc_35F

.loc_32D
    ld   a,[$DB95]
    cp   a,$0C
    jr   nz, .loc_33B
    ld   a,[$DB96]
    cp   a,$02
    jr   c, .loc_343

.loc_33B
    ld   a,$01
    call .sub_80C
    call $5F2E

.loc_343
    call .sub_E34
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_353
    ld   a,$21
    call .sub_80C
    call $406E

.loc_353
    xor  a
    ld   [$DDD2],a
    ld   a,$01
    call .sub_80C
    call $5F4B

.loc_35F
    ld   a,$1F
    call .sub_80C
    call $7F80
    ld   a,$0C
    call .sub_B0B
    call .sub_80C
    xor  a
    ld   [$FFFD],a
    halt 
    nop  

.loc_374
    ld   a,[$FFD1]
    and  a
    jr   z, .loc_374
    xor  a
    ld   [$FFD1],a
    jp   .loc_1DA

.loc_37F
    jr   nz, .loc_3B1
    ld   b,b
    ld   h,b
    nop  
    jr   nc, .loc_3DC
    ld   l,b
    nop  
    di   
    push af
    push hl
    push de
    push bc
    ld   a,[$FF70]
    ld   c,a
    xor  a
    ld   [$FF70],a
    ld   a,[$DB95]
    cp   a,$01
    jr   nz, .loc_3AD
    ld   a,[$DB96]
    cp   a,$05
    jr   nz, .loc_3A6
    ld   a,[$D000]
    jr   .loc_3A8

.loc_3A6
    ld   a,[$FF97]

.loc_3A8
    ld   [$FF42],a
    jp   .loc_3FF

.loc_3AD
    cp   a,$00
    jr   nz, .loc_3FC

.loc_3B1
    ld   a,[$C105]
    ld   e,a
    ld   d,$00
    ld   hl,$C100
    add  hl,de
    ld   a,[hl]
    ld   hl,$FF96
    add  [hl]
    ld   [$FF43],a
    ld   a,[$DB96]
    cp   a,$06
    jr   c, .loc_3D9
    ld   hl, .loc_384
    add  hl,de
    ld   a,[hl]
    ld   [$FF45],a
    ld   a,e
    inc  a
    and  a,$03
    ld   [$C105],a
    jr   .loc_3FF

.loc_3D9
    ld   hl, .loc_37F

.loc_3DC
    add  hl,de
    ld   a,[hl]
    ld   [$FF45],a
    ld   a,e
    inc  a
    cp   a,$05
    jr   nz, .loc_3E7
    xor  a

.loc_3E7
    ld   [$C105],a
    nop  
    cp   a,$04
    jr   nz, .loc_3FF
    ld   a,[$C106]
    ld   [$FF42],a
    cpl  
    inc  a
    add  a,$60
    ld   [$FF45],a
    jr   .loc_3FF

.loc_3FC
    xor  a
    ld   [$FF43],a

.loc_3FF
    ld   a,c
    ld   [$FF70],a
    pop  bc
    pop  de
    pop  hl
    pop  af
    ei   
    reti 

.loc_408
    push af
    ld   a,$28
    ld   [$2100],a
    call $4601
    ld   a,[$DBAF]
    ld   [$2100],a
    pop  af
    reti 

.sub_419
    ld   a,[$D6FE]
    and  a
    jr   z, .loc_43A
    ld   [$DDD2],a
    cp   a,$23
    jr   z, .loc_42B
    push af
    call $28CF ; LCDDisplayEnable
    pop  af

.loc_42B
    call .sub_430
    jr   .loc_45D

.sub_430
    ld   e,a
    ld   a,$20
    ld   [$2100],a
    call $4657
    jp   [hl]

.loc_43A
    call $28CF ; LCDDisplayEnable
    ld   a,$24
    ld   [$2100],a

.loc_442
    call $5C2C
    ld   a,$20
    ld   [$2100],a
    call $4577
    ld   a,$08
    ld   [$2100],a
    call $292D
    ld   a,$0C
    call $0B0B
    ld   [$2100],a

.loc_45D
    xor  a
    ld   [$D6FF],a
    ld   [$D6FE],a
    ld   a,[$D6FD]
    ld   [$FF40],a
    ret  

.sub_46A
    rlca 
    add  hl,bc
    push af
    push bc
    push de
    push hl
    ld   a,[$FF70]
    and  a,$07
    ld   c,a
    xor  a
    ld   [$FF70],a
    push bc
    di   
    ld   a,[$DB95]
    cp   a,$0D
    jr   nz, .loc_48D
    ld   a,[$DB96]
    cp   a,$09
    jr   c, .loc_48D
    cp   a,$12
    jp   c, .loc_577

.loc_48D
    ld   a,[$FFFD]
    and  a
    jp   nz, .loc_569
    ld   a,[$C19F]
    and  a,$7F
    jr   z, .loc_4CC
    cp   a,$01
    jr   z, .loc_4CC
    cp   a,$05
    jr   nc, .loc_4AC
    call $23E4
    ld   hl,$C19F
    inc  [hl]
    jp   .loc_569

.loc_4AC
    cp   a,$0A
    jr   nz, .loc_4B6
    call $2719
    jp   .loc_569

.loc_4B6
    cp   a,$0B
    jr   nz, .loc_4CC
    ld   a,[$C172]
    and  a
    jr   z, .loc_4C6
    dec  a
    ld   [$C172],a
    jr   .loc_4CC

    call $276D
    jp   .loc_569

.loc_4CC
    ld   a,[$DB95]
    cp   a,$0E
    jr   c, .loc_4E4

.loc_4D3
    ld   a,[$DB96]
    cp   a,$06
    jr   c, .loc_52B
    ld   a,$38
    ld   [$2100],a
    call $785A
    jr   .loc_52B

.loc_4E4
    ld   a,[$D6FE]
    and  a
    jr   nz, .loc_569
    ld   a,[$FF90]
    ld   [$FFE8],a
    ld   hl,$FF91
    or   [hl]
    ld   hl,$C10E
    or   [hl]
    jr   z, .loc_509
    call .loc_5BC
    ld   a,[$FFE8]
    cp   a,$08
    jr   nc, .loc_504

.loc_501
    call $1D2E

.loc_504
    call $FFC0
    jr   .loc_569

.loc_509
    ld   a,[$FFBB]
    and  a
    jr   z, .loc_521
    dec  a
    ld   [$FFBB],a
    ld   e,a
    ld   d,$00
    ld   hl, .sub_46A
    add  hl,de
    ld   a,[hl]
    ld   [$D6F8],a
    call $1ED7
    jr   .loc_501

.loc_521
    ld   a,[$DB95]
    cp   a,$0D
    jr   z, .loc_52B
    call $1B0D

.loc_52B
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_538
    ld   a,$24
    ld   [$2100],a
    call $5C1A

.loc_538
    ld   de,$D601
    call $2927
    xor  a
    ld   [$D600],a
    ld   [$D601],a
    ld   [$DC90],a
    ld   [$DC91],a
    ld   a,$36
    ld   [$2100],a
    call $72BA
    call $FFC0
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_569
    ld   a,$21
    ld   [$2100],a
    call $4000
    ld   a,[$DBAF]
    ld   [$2100],a

.loc_569
    ei  

.loc_56A
    pop  bc
    ld   a,c
    ld   [$FF70],a
    pop  hl
    pop  de
    pop  bc
    ld   a,$01
    ld   [$FFD1],a
    pop  af
    reti 

.loc_577
    ld   a,[$DBAF]
    push af
    ld   a,[$FFFD]
    and  a
    jr   nz, .loc_5AB
    call $FFC0
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_598
    ld   a,$21
    call .sub_80C
    call $4000
    ld   a,$24
    call .sub_80C
    call $5C1A
    ld   de,$D601
    call $2927
    xor  a
    ld   [$D600],a
    ld   [$D601],a
    ld   [$DC90],a
    ld   [$DC91],a
    ld   a,$28
    call .sub_80C
    call $4616
    pop  af
    ld   [$DBAF],a
    ld   [$2100],a
    jr   .loc_56A

.sub_5BC
    ld   a,[$FF90]
    and  a
    jp   z, .loc_69E
    cp   a,$07
    jp   z, .loc_7B0
    cp   a,$03
    jp   z,$0062
    cp   a,$04
    jp   z,$006A
    cp   a,$05
    jp   z,$0072
    cp   a,$06
    jp   z,$007A
    cp   a,$08
    jp   nc, .loc_7D3
    ld   a,[$DBA5]
    and  a
    jp   z, .loc_656
    ld   a,[$FF90]
    cp   a,$02
    jp   z, .loc_826
    ld   a,$0D
    call .sub_B0B
    ld   [$2100],a
    ld   a,[$FF92]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c

.loc_605
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl,$9000
    add  hl,bc
    ld   e,l
    ld   d,h
    ld   hl,$5000
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz, .loc_62F
    ld   a,$20
    ld   [$2100],a
    call $4616
    ld   [$2100],a
    jr   .loc_641

.loc_62F
    ld   a,[$FF94]
    add  a,$50
    ld   h,a
    add  hl,bc
    ld   a,[$FFBB]
    and  a
    jr   z, .loc_641
    ld   a,[$FF92]
    dec  a
    cp   a,$02
    jr   c, .loc_647

.loc_641
    ld   bc,$0040
    call $2914 ; CopyData

.loc_647
    ld   a,[$FF92]
    inc  a
    ld   [$FF92],a
    cp   a,$04
    jr   nz, .loc_655
    xor  a
    ld   [$FF90],a
    ld   [$FF92],a

.loc_655
    ret  

.loc_656
    ld   a,$0F
    call .sub_B0B
    ld   [$2100],a
    ld   a,[$FF92]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl,$9000
    add  hl,bc
    ld   e,l
    ld   d,h
    ld   a,[$FF94]
    add  a,$40
    ld   h,a
    ld   l,$00
    add  hl,bc
    ld   bc,$0040
    call $2914 ; CopyData
    ld   a,[$FF92]
    inc  a
    ld   [$FF92],a
    cp   a,$08
    jr   nz, .loc_69D
    xor  a
    ld   [$FF90],a
    ld   [$FF92],a

.loc_69D
    ret  

.loc_69E
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_6CB
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz, .loc_6CB
    ld   a,$20
    ld   [$2100],a
    call $475A
    xor  a
    ld   [$C10E],a
    ld   [$C10F],a
    ld   hl,$9000
    ld   bc,$0000
    call $4616
    ld   c,$90
    ld   b,h
    ld   h,$00
    call .sub_A13
    jr   .loc_738

.loc_6CB
    ld   a,[$FF91]
    and  a
    jp   z, .loc_73E
    ld   a,[$C197]
    ld   e,a
    ld   d,$00
    ld   hl,$C193
    add  hl,de
    ld   a,[hl]
    push af
    and  a,$3F
    ld   d,a
    ld   e,$00
    pop  af
    swap a
    rra  
    rra  
    and  a,$03
    ld   c,a
    ld   b,$00
    ld   hl,$2E6F
    add  hl,bc
    ld   a,[hl]
    and  a
    jr   z, .loc_6F7
    call .sub_B0B

.loc_6F7
    ld   [$2100],a
    ld   a,[$FF93]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b

.loc_707
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl,$4000
    add  hl,bc
    add  hl,de
    push hl
    ld   a,[$C197]
    ld   d,a
    ld   hl,$8400
    add  hl,bc
    add  hl,de
    ld   e,l
    ld   d,h
    pop  hl
    ld   bc,$0040
    call $2914 ; CopyData
    ld   a,[$FF93]
    inc  a
    ld   [$FF93],a
    cp   a,$04
    jr   nz, .loc_73D

.loc_738
    xor  a
    ld   [$FF91],a
    ld   [$FF93],a

.loc_73D
    ret 

    ld   a,[$C10D]
    ld   e,a
    ld   d,$00
    ld   hl,$C193
    add  hl,de
    ld   a,[hl]
    push af
    and  a,$3F
    ld   d,a
    ld   e,$00
    pop  af
    swap a
    rra  
    rra  
    and  a,$03
    ld   c,a
    ld   b,$00
    ld   hl,$2E6F
    add  hl,bc
    ld   a,[hl]
    and  a
    jr   z, .loc_764
    call .loc_B0B

.loc_764
    ld   [$2100],a
    ld   a,[$C10F]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl,$4000
    add  hl,bc
    add  hl,de
    push hl
    ld   a,[$C10D]
    ld   d,a
    ld   hl,$8400
    add  hl,bc
    add  hl,de
    ld   e,l
    ld   d,h
    pop  hl
    ld   bc,$0040
    call $2914 ; CopyData
    ld   a,[$C10F]
    inc  a
    ld   [$C10F],a
    cp   a,$04
    jr   nz, .loc_7AF
    xor  a
    ld   [$C10E],a
    ld   [$C10F],a

.loc_7AF
    ret  

.loc_7B0
    ld   a,$01
    ld   [$2100],a
    call $6BB5
    jp   $008B ; TODO: Cover the instructions in the first 0x100 bytes of the rom 

.loc_7BB
    ld   h,b
    ld   l,c
    and  b
    ld   l,c
    ret  nz
    ld   l,c
    nop  
    ld   b,d
    ld   b,b
    ld   b,d
    ld   h,b
    ld   b,d

.loc_7C7
    nop  
    add  d
    ld   b,b
    add  d
    ld   h,b
    add  d
    nop  
    add  d
    ld   b,b
    add  d
    ld   h,b
    add  d

.loc_7D3
    sub  a,$08
    sla  a
    ld   e,a
    ld   d,$00
    ld   hl, .loc_7BB
    add  hl,de
    push hl
    ld   hl, .loc_7C7
    add  hl,de
    ld   e,[hl]
    inc  hl
    ld   d,[hl]
    pop  hl
    db $2A ; ldi  a,[hl] ; TODO: Figure out why this instruction wont assemble
    ld   h,[hl]
    ld   l,a
    ld   a,$0C
    call .sub_B0B
    ld   [$2100],a
    ld   bc,$0040
    call $2914 ; CopyData
    ld   a,[$FF90]
    cp   a,$0A
    jr   z, .loc_808
    cp   a,$0D
    jr   z, .loc_808

.loc_802
    ld   a,[$FF90]
    inc  a

.loc_805
    ld   [$FF90],a
    ret  

.loc_808
    xor  a

.loc_809
    ld   [$FF90],a
    ret  

.sub_80C
    ld   [$DBAF],a
    ld   [$2100],a
    ret  

.sub_813
    call .sub_B0B
    ld   [$DBAF],a
    ld   [$2100],a
    ret  

.sub_81D
    push af
    ld   a,[$DBAF]
    ld   [$2100],a
    pop  af
    ret  

.loc_826
    ld   a,$12
    call .sub_B0B
    ld   [$2100],a
    ld   a,[$FF92]
    cp   a,$08
    jr   c, .loc_873
    jr   nz, .loc_843
    ld   a,$02
    ld   [$2100],a
    call $6843
    ld   hl,$FF92
    inc  [hl]
    ret  

.loc_843
    cp   a,$09
    jr   nz, .loc_854
    ld   a,$02
    ld   [$2100],a
    call $6827
    ld   hl,$FF92
    inc  [hl]
    ret  

.loc_854
    cp   a,$0A
    jr   nz, .loc_865
    ld   a,$02
    ld   [$2100],a
    call $680B
    ld   hl,$FF92
    inc  [hl]
    ret  

.loc_865
    ld   a,$02
    ld   [$2100],a
    call $67E5
    xor  a
    ld   [$FF90],a
    ld   [$FF92],a
    ret  

.loc_873
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl,$8D00
    add  hl,bc
    ld   e,l
    ld   d,h
    ld   hl,$7E00
    add  hl,bc
    ld   bc,$0040
    call $2914
    ld   a,[$FF92]
    inc  a
    ld   [$FF92],a
    ret  

.sub_8A4
    ld   a,$1F
    call .sub_80C
    call $4006
    ld   a,[$FFF3]
    and  a
    jr   nz, .loc_8D6
    ld   a,[$C10B]
    and  a
    jr   z, .sub_8C6
    cp   a,$02
    jr   nz, .loc_8C3
    ld   a,[$FFE7]
    and  a,$01
    jr   nz, .loc_8D6
    jr   .sub_8C6

.loc_8C3
    call .sub_8C6

.sub_8C6
    ld   a,$1B
    call .sub_80C
    call $4006
    ld   a,$1E
    call .sub_80C
    call $4006

.loc_8D6
    ret  

.sub_8D7
    ld   a,$20
    ld   [$2100],a
    call $6A30

.loc_8DF
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  

.loc_8E6
    ld   a,$20
    ld   [$2100],a
    call $6AC1
    jr   .loc_8DF

.sub_8F0
    ld   a,$20
    ld   [$2100],a
    call $6BA4
    jr   .loc_8DF

.sub_8FA
    push af
    ld   a,$20
    ld   [$2100],a
    call $6BDC
    jr   .loc_973

.loc_905
    ld   a,$20
    ld   [$2100],a
    call $6C00
    jr   .loc_917

.loc_90F
    ld   a,$20
    ld   [$2100],a
    call $6C24
    ld   a,$01
    ld   [$2100],a
    ret  

.loc_91D
    push af
    ld   b,$00
    ld   a,[$DDD8]
    sla  a
    rl   b
    sla  a
    rl   b
    ld   c,a
    jr   .loc_92F

.loc_92E
    push af

.loc_92F
    ld   a,$1A
    ld   [$2100],a
    call $6576
    ld   a,[$FFDF]
    ld   [$2100],a
    ld   hl,$DC91
    ld   a,[$DC90]
    ld   e,a
    add  a,$0A
    ld   [$DC90],a
    ld   d,$00
    add  hl,de
    ld   a,[$FFE0]
    ld   d,a
    ld   a,[$FFE1]
    ld   e,a
    ld   a,[$FFCF]
    ldi  [hl],a
    ld   a,[$FFD0]
    ldi  [hl],a
    ld   a,$81
    ldi  [hl],a
    ld   a,[de]
    ldi  [hl],a
    inc  de
    inc  de
    ld   a,[de]
    ldi  [hl],a
    dec  de
    ld   a,[$FFCF]
    ldi  [hl],a
    ld   a,[$FFD0]
    inc  a
    ldi  [hl],a
    ld   a,$81
    ldi  [hl],a
    ld   a,[de]
    ldi  [hl],a
    inc  de
    inc  de
    ld   a,[de]
    ldi  [hl],a
    xor  a
    ldi  [hl],a

.loc_973
    pop  af
    ld   [$2100],a
    ret  

.sub_978
    push af
    ld   a,$20
    ld   [$2100],a
    call $6D0E
    jr   .loc_973

.sub_983
    ld   a,$1A
    ld   [$2100],a
    call $6710
    ld   a,[$FFDF]
    ld   [$2100],a
    ld   a,[$FFE0]
    ld   h,a
    ld   a,[$FFE1]
    ld   l,a
    ld   a,[hl]
    inc  de
    ret  

.loc_999
    push af
    push bc
    call .sub_983
    ld   [$FFD7],a
    pop  bc
    call .sub_983
    ld   [$FFD8],a
    ld   a,[$DC90]
    ld   c,a
    ld   b,$00
    add  a,$05
    ld   [$DC90],a
    ld   hl,$DC91
    add  hl,bc
    ld   a,[$FFCF]
    ldi  [hl],a
    ld   a,[$FFD0]
    ldi  [hl],a
    ld   a,$01
    ldi  [hl],a
    ld   a,[$FFD7]
    ldi  [hl],a
    ld   a,[$FFD8]
    ldi  [hl],a
    xor  a
    ldi  [hl],a
    jr   .loc_973

.sub_9C8
    push af
    ld   a,$20
    ld   [$2100],a
    call $4985
    jr   .loc_973

.loc_9D3
    push af
    ld   a,$20
    ld   [$2100],a
    call $4518
    jr   .loc_973

.loc_9DE
    push af
    ld   a,$20
    ld   [$2100],a
    call $4874
    jr   .loc_973

.loc_9E9
    push af
    ld   a,$20
    ld   [$2100],a
    call $4954
    jp   .loc_973

.loc_9F5
    push af
    ld   a,$20
    ld   [$2100],a
    call $482D
    jp   .loc_973

.loc_A01
    push hl

.loc_A02
    ld   l,$00
    ld   e,l
    ld   h,b
    ld   a,c
    add  a,$80
    ld   d,a
    ld   bc,$0100
    call $2914 ; CopyData
    pop  hl
    jr   .loc_A2D

.sub_A13
    ld   [$2100],a
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_A01
    ld   a,b
    ld   [$FF51],a
    ld   a,$00
    ld   [$FF52],a
    ld   a,c
    ld   [$FF53],a
    ld   a,$00
    ld   [$FF54],a
    ld   a,$0F
    ld   [$FF55],a

.loc_A2D
    ld   a,h
    ld   [$2100],a
    ret  

.loc_A32
    push af
    ld   a,$35
    ld   [$2100],a
    ld   hl,$4F00
    ld   de,$DCC0
    ld   bc,$0020
    call $2914 ; CopyData
    jp   .loc_973

.loc_A47
    push af
    ld   a,$36
    ld   [$2100],a
    call $505F
    jp   .loc_973

.loc_A53
    push af
    ld   a,$36
    ld   [$2100],a
    call $4F9B
    jp   .loc_973

.loc_A5F
    push af
    ld   a,$20
    ld   [$2100],a
    call $3CE6
    jp   .loc_973

.loc_A6B
    push af
    ld   a,$03
    ld   [$2100],a
    call $5A2E
    jp   loc_973

.loc_A77
    push af
    ld   a,$36
    ld   [$2100],a
    call $4F68
    jp   .loc_973

.loc_A83
    push af
    ld   a,$20
    ld   [$2100],a
    call $6D52
    jp   .loc_973

.loc_A8F
    push af
    ld   a,$36
    ld   [$2100],a
    call $4BE8
    jp   .loc_973

.loc_A98
    push af
    ld   a,$0F
    call .sub_80C
    call $2321
    jp   .loc_973

.sub_AA7
    push af
    ld   a,$36
    call .sub_80C
    call $705A
    pop  af
    call .sub_80C
    ret  

.loc_AB0
    push af
    ld   a,$24
    ld   [$2100],a
    call $5C1A
    ld   de,$D601
    call $2927
    jr   .loc_AB0

.loc_AC6
    push af
    ld   a,$36
    ld   [$2100],a
    call $703E
    jp   .loc_973

.loc_AD2
    push af
    ld   a,$36
    ld   [$2100],a
    call $70D6
    jp   .loc_973

.loc_ADE
    push af
    ld   a,$36
    call .sub_80C
    call $4A77
    jp   .loc_973

.loc_AEA
    push af
    ld   a,$36
    ld   [$2100],a
    call $4A4C
    jp   .loc_973

.loc_AF6
    push af
    ld   a,$36
    ld   [$2100],a
    call $7161
    jp   .loc_973

.loc_B02
    ld   a,$3D
    ld   [$2100],a
    call $4029
    ret  

.sub_B0B
    push bc
    ld   b,a
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_B17
    ld   a,b
    or   a,$20
    pop  bc
    ret

.loc_B17
    ld   a,b
    pop  bc
    ret  

.loc_B1A
    ld   a,[$FFD7]
    ld   [$2100],a
    ld   a,$02
    ld   [$FF70],a
    call $2914 ; CopyData
    xor  a
    ld   [$FF70],a
    ld   a,$20
    ld   [$2100],a
    ret  

.sub_B2F
    ld   [$FFD9],a
    ld   a,[$FFFE]
    and  a
    ret  z
    ld   a,[$DBA5]
    and  a
    ret  nz
    push bc
    ld   a,[$FFD9]
    and  a,$80
    jr   nz, .loc_B4B
    ld   a,$20
    ld   [$2100],a
    call $6E50
    jr   c, .loc_B54

.loc_B4B
    ld   b,[hl]
    ld   a,$02
    ld   [$FF70],a
    ld   [hl],b
    xor  a
    ld   [$FF70],a

.loc_B54
    ld   a,[$FFD9]
    and  a,$7F
    ld   [$2100],a
    pop  bc
    ret  

.loc_B5D
    ld   [$2100],a
    call $2914 ; CopyData
    ld   a,$28
    ld   [$2100],a
    ret  

.loc_B69
    push hl
    ld   [$2100],a
    ld   a,[$FFFE]
    and  a
    jr   z, .loc_B80
    ld   de,$0168
    add  hl,de
    ld   a,$01
    ld   [$FF4F],a
    call .loc_B96
    xor  a
    ld   [$FF4F],a
    pop  hl
    push hl
    call .loc_B96
    pop  hl
    ld   a,[$DB95]
    cp   a,$0D
    jr   nz, .loc_B90
    call .sub_BB5

.loc_B90
    ld   a,[$FFE6]
    ld   [$2100],a
    ret  

.sub_B96
    ld   de,$9800

.loc_B99
    db $2A ; ldi  a,[hl]
    ld   [de],a
    inc  e
    ld   a,e
    and  a,$1F
    cp   a,$14
    jr   nz, .loc_B99
    ld   a,e
    add  a,$0C
    ld   e,a
    ld   a,d
    adc  a,$00
    ld   d,a
    cp   a,$9A
    jr   nz, .loc_B99
    ld   a,e
    cp   a,$40
    jr   nz, .loc_B99
    ret  

.sub_BB5
    ld   bc,$0168
    ld   de,$D000
    jp   $2914 ; CopyData

.loc_BBE
    push af
    call $2BCF
    jp   .loc_973

.loc_BC5
    ld   a,[$D16A]
    ld   [$2100],a

.loc_BCB
    db $2A ; ldi  a,[hl]
    ld   [de],a
    inc  de
    dec  b
    jr   nz, .loc_BCB
    ld   a,$28
    ld   [$2100],a
    ret  

.loc_BD7
    ld   a,[$DE01]
    ld   [$2100],a
    call .sub_BE7
    ld   a,[$DE04]
    ld   [$2100],a
    ret  

.sub_BE7
    ld   a,[$DE02]
    ld   h,a
    ld   a,[$DE03]
    ld   l,a
    jp   [hl]

.loc_BF0
    ld   a,$02
    ld   [$2100],a
    call $1A50
    jp   .sub_81D

.sub_BFB
    ld   hl,$C450
    jr   .loc_C08

.sub_C00
    ld   hl,$C2F0
    jr   .loc_C08

.sub_C05
    ld   hl,$C2E0

.loc_C08
    add  hl,bc
    ld   a,[hl]
    and  a
    ret  

    ld   a,$AF
    call $3B86
    ld   a,[$FF98]
    ld   hl,$C200
    add  hl,de
    ld   [hl],a
    ld   a,[$FF99]
    ld   hl,$C210
    add  hl,de
    ld   [hl],a
    ret  
    ld   a,$1D
    ld   [$FFF2],a
    ret  
    ld   hl,$4641
    jr   $0C2D
    ld   hl,$4741
    ld   a,$1C
    ld   [$2100],a
    add  hl,bc
    ld   a,[hl]
    ld   hl,$2100
    ld   [hl],$01
    ret  
    ld   a,$0C
    ld   [$2100],a
    ld   bc,$0040
    call $2914
    ld   a,$01
    ld   [$2100],a
    ret  
    ld   hl,$FFF4
    ld   [hl],$0C
    ld   hl,$C502
    ld   [hl],$04
    ret  
    ld   hl,$C410
    add  hl,bc
    ld   a,[hl]
    and  a
    jr   z,$0C5F
    dec  [hl]
    ret  
    push af
    ld   a,[$C18F]
    and  a
    jr   nz,$0C7B
    ld   [$C1CF],a
    inc  a
    ld   [$C18F],a
    ld   [$C5A6],a
    ld   a,[$C19D]
    and  a
    jr   nz,$0C7B
    ld   a,$02
    ld   [$FFF2],a
    pop  af
    ret  
    ld   a,$30
    ld   [$FFA8],a
    jr   $0C9A
    ld   a,$30
    ld   [$FFA8],a
    jr   $0C9E
    ld   a,[$D401]
    cp   a,$01
    jr   nz,$0C7D
    ld   a,[$DBA5]
    and  a
    jr   z,$0C7D
    ld   a,$01
    ld   [$FFBC],a
    ld   a,$06
    ld   [$FFF4],a
    ld   a,$03
    ld   [$C11C],a
    xor  a
    ld   [$C16B],a
    ld   [$C16C],a
    ld   [$D478],a
    and  a
    ret  
    xor  a
    ld   [$C121],a
    ld   [$C122],a
    xor  a
    ld   [$C14B],a
    ld   [$C14A],a
    ret  
    ld   a,[$FF9F]
    ld   [$FF98],a
    ld   a,[$FFA0]
    ld   [$FF99],a
    ret  
    push af
    ld   e,$0F
    ld   d,$00
    ld   hl,$C510
    add  hl,de
    ld   a,[hl]
    and  a
    jr   z,$0CEC
    dec  e
    ld   a,e
    cp   a,$FF
    jr   nz,$0CCC
    ld   hl,$C5C0
    dec  [hl]
    ld   a,[hl]
    cp   a,$FF
    jr   nz,$0CE8
    ld   a,$0F
    ld   [$C5C0],a
    ld   a,[$C5C0]
    ld   e,a
    pop  af
    ld   hl,$C510
    add  hl,de
    ld   [hl],a
    ld   a,[$FFD8]
    ld   hl,$C540
    add  hl,de
    ld   [hl],a
    ld   a,[$FFD7]
    ld   hl,$C530
    add  hl,de
    ld   [hl],a
    ld   hl,$C520
    add  hl,de
    ld   [hl],$0F
    ret  
    ld   a,[$C140]
    sub  a,$08
    ld   [$FFD7],a
    ld   a,[$C142]
    sub  a,$08
    ld   [$FFD8],a
    ld   a,$07
    ld   [$FFF2],a
    ld   a,$05
    jp   $0CC7
    ld   a,$20
    ld   [$2100],a
    ld   a,[$DBA5]
    and  a
    jr   z,$0D59
    ld   a,[$FFF6]
    ld   e,a
    ld   d,$00
    ld   hl,$6EB3
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$0D3C
    ld   hl,$70B3
    jr   $0D45
    cp   a,$1A
    jr   nc,$0D45
    cp   a,$06
    jr   c,$0D45
    inc  h
    add  hl,de
    ld   a,[$FF94]
    ld   e,a
    ld   a,[hl]
    cp   e
    jr   z,$0D57
    ld   [$FF94],a
    cp   a,$FF
    jr   z,$0D57
    ld   a,$01
    ld   [$FF90],a
    jr   $0D91
    ld   a,[$FFF6]
    cp   a,$07
    jr   nz,$0D60
    inc  a
    ld   d,a
    srl  a
    srl  a
    and  a,$F8
    ld   e,a
    ld   a,d
    srl  a
    and  a,$07
    or   e
    ld   e,a
    ld   d,$00
    ld   hl,$6E73
    add  hl,de
    ld   a,[$FF94]
    ld   e,a
    ld   a,[hl]
    cp   e
    jr   z,$0D91
    cp   a,$0F
    jr   z,$0D91
    cp   a,$1A
    jr   nz,$0D8B
    ld   a,[$FFF6]
    cp   a,$37
    jr   nz,$0D91
    ld   a,[hl]
    ld   [$FF94],a
    ld   a,$01
    ld   [$FF90],a
    xor  a
    ld   [$FFD7],a
    ld   a,[$FFF6]
    ld   e,a
    ld   d,$00
    ld   hl,$70D3
    ld   a,[$DBA5]
    ld   d,a
    ld   a,[$FFF7]
    cp   a,$1A
    jr   nc,$0DAB
    cp   a,$06
    jr   c,$0DAB
    inc  d
    add  hl,de
    ld   e,[hl]
    ld   a,d
    and  a
    jr   z,$0DC1
    ld   a,[$FFF7]
    cp   a,$10
    jr   nz,$0DDB
    ld   a,[$FFF6]
    cp   a,$B5
    jr   nz,$0DDB
    ld   e,$3D
    jr   $0DDB
    ld   a,e
    cp   a,$23
    jr   nz,$0DCE
    ld   a,[$D8C9]
    and  a,$20
    jr   z,$0DCE
    inc  e
    ld   a,e
    cp   a,$21
    jr   nz,$0DDB
    ld   a,[$D8FD]
    and  a,$20
    jr   z,$0DDB
    inc  e
    ld   d,$00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$0DF1
    ld   a,$01
    ld   [$FF91],a
    jr   $0E31
    ld   hl,$73F3
    ld   a,[$DBA5]
    and  a
    jr   z,$0DFD
    ld   hl,$763B
    add  hl,de
    ld   d,$00
    ld   bc,$C193
    ld   e,[hl]
    ld   a,[bc]
    cp   e
    jr   z,$0E29
    ld   a,e
    cp   a,$FF
    jr   z,$0E29
    ld   [bc],a
    ld   a,[$FFD7]
    and  a
    jr   z,$0E1E
    ld   a,d
    ld   [$C10D],a
    ld   a,$01
    ld   [$C10E],a
    jr   $0E29
    inc  a
    ld   [$FFD7],a
    ld   a,d
    ld   [$C197],a
    ld   a,$01
    ld   [$FF91],a
    inc  hl
    inc  bc
    inc  d
    ld   a,d
    cp   a,$04
    jr   nz,$0E03
    jp   $081D
    ld   a,[$DB95]
    cp   a,$07
    jr   c,$0E85
    cp   a,$0B
    jr   nz,$0E46
    ld   a,[$DB96]
    cp   a,$07
    jr   nz,$0E85
    ld   a,[$C16B]
    cp   a,$04
    jr   nz,$0E85
    ld   a,[$C19F]
    ld   hl,$C167
    or   [hl]
    ld   hl,$C124
    or   [hl]
    jr   nz,$0E85
    ld   a,[$DB95]
    cp   a,$0C
    jr   nc,$0E85
    ld   a,[$FFCB]
    cp   a,$F0
    jr   nz,$0E85
    ld   a,[$D474]
    and  a
    jr   nz,$0E85
    ld   a,[$D464]
    and  a
    jr   nz,$0E85
    xor  a
    ld   [$C16B],a
    ld   [$C16C],a
    ld   [$C19F],a
    ld   [$DB96],a
    ld   a,$06
    ld   [$DB95],a
    ld   a,[$DB95]
    rst  $00
    rst  $18
    ld   c,$E2
    ld   c,$0E
    rrca 
    ld   de,$140F
    rrca 
    rla  
    rrca 
    rst  $10
    ld   c,$D1
    ld   c,$C5
    ld   c,$CB
    ld   c,$BF
    ld   c,$1A
    rrca 
    dec  l
    rrca 
    dec  [hl]
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    ld   b,b
    rrca 
    call $6AF8
    jp   $101A
    call $67EE
    jp   $101A
    call $6203
    jp   $101A
    call $5626
    jp   $101A
    ld   a,$01
    call $080C
    jp   $4000
    jp   $6E1D
    ld   a,$17
    call $080C
    call $4AB7
    jp   $101A
    ld   a,$03
    ld   [$2100],a
    ld   a,$17
    push af
    call $398D
    pop  af
    jp   $080C
    ld   a,$03
    ld   [$2100],a
    ld   a,$01
    jr   $0EF4
    ld   a,$03
    ld   [$2100],a
    ld   a,$02
    jr   $0EF4
    jp   $47CE
    jp   $4A07
    jp   $4CFB
    jp   $4F8C
    ld   a,$14
    ld   [$2100],a
    call $4C4B
    call $4ABC
    ld   a,$01
    call $080C
    jp   $4371
    ld   a,$20
    call $080C
    jp   $5904
    ld   a,$28
    call $080C
    call $4000
    jp   $101A
    ld   a,$37
    call $080C
    jp   $4000
    ld   a,$02
    call $080C
    ld   a,[$C19F]
    and  a
    jr   nz,$0F8F
    ld   hl,$FFB4
    ld   a,[hl]
    and  a
    jr   z,$0F75
    ld   a,[$DB9A]
    cp   a,$80
    jr   nz,$0F75
    ld   a,[$C14F]
    and  a
    jr   nz,$0F75
    dec  [hl]
    jr   nz,$0F75
    ld   a,$01
    ld   [$2100],a
    call $61EE
    call $081D
    ld   a,[$C19F]
    and  a
    jr   nz,$0F8F
    ld   a,[$C1BC]
    and  a
    jr   z,$0F8F
    ld   hl,$FFA1
    ld   [hl],$02
    dec  a
    ld   [$C1BC],a
    jr   nz,$0F8F
    jp   $0C7D
    ld   hl,$DBC7
    ld   a,[hl]
    and  a
    jr   z,$0F97
    dec  [hl]
    ld   a,[$FF98]
    ld   [$FF9F],a
    ld   a,[$FF99]
    ld   [$FFA0],a
    ld   hl,$FFA2
    sub  [hl]
    ld   [$FFB3],a
    call $60E0
    xor  a
    ld   [$C140],a
    ld   [$C13C],a
    ld   [$C13B],a
    ld   hl,$C11D
    res  7,[hl]
    ld   hl,$C11E
    res  7,[hl]
    call $593B
    ld   a,$02
    call $080C
    call $78E8
    call $1033
    ld   a,[$C15C]
    ld   [$C3CF],a
    ld   a,$20
    ld   [$2100],a
    call $4B1F
    ld   a,$19
    call $080C
    call $7A9A
    call $398D
    ld   a,$02
    call $080C
    call $5487
    ld   hl,$D601
    ld   a,[$FFE7]
    and  a,$03
    or   [hl]
    jr   nz,$1012
    ld   a,[$C11C]
    cp   a,$02
    jr   nc,$1012
    ld   c,$01
    ld   b,$00
    ld   e,$00
    ld   a,[$FFE7]
    and  a,$04
    jr   z,$100A
    dec  c
    dec  e
    ld   a,$20
    ld   [$2100],a
    call $5C9C
    ld   a,$14
    call $080C
    call $54F8
    ld   a,$0F
    call $080C
    call $2321
    ld   a,[$FFFE]
    and  a
    ret  z
    ld   a,$24
    call $080C
    jp   $7405
    ld   [$990E],sp
    jr   z,$101F
    ld   a,[$FF99]
    ld   hl,$FFA2
    sub  [hl]
    ld   [$C145],a
    ld   a,[$C1A9]
    and  a
    jr   z,$107F
    ld   a,[$C19F]
    and  a
    jr   nz,$106D
    ld   hl,$C1AA
    dec  [hl]
    ld   a,[hl]
    cp   a,$02
    jr   nz,$1061
    ld   a,[$C1A9]
    ld   e,a
    ld   d,$00
    ld   hl,$102D
    add  hl,de
    ld   a,[hl]
    call $2385
    ld   a,$01
    and  a
    jr   nz,$106D
    xor  a
    ld   [$C1A9],a
    ld   [$C1A8],a
    jr   $107F
    ld   a,[$C1A9]
    ld   [$C1A8],a
    dec  a
    rst  $00
    cp   h
    ld   d,c
    rst  $00
    ld   d,c
    rst  $00
    ld   d,c
    rst  $00
    ld   d,c
    cp   h
    ld   d,c
    ld   a,[$FFCB]
    and  a,$B0
    jr   nz,$10DB
    ld   a,[$FFCB]
    and  a,$40
    jr   z,$10DB
    ld   a,[$D45F]
    inc  a
    ld   [$D45F],a
    cp   a,$04
    jr   c,$10DF
    ld   a,[$FFA1]
    cp   a,$02
    jr   z,$10DB
    ld   a,[$FF9D]
    cp   a,$FF
    jr   z,$10DB
    ld   a,[$C11C]
    cp   a,$02
    jr   nc,$10DB
    ld   a,[$C19F]
    ld   hl,$C167
    or   [hl]
    ld   hl,$C124
    or   [hl]
    jr   nz,$10DB
    ld   a,[$D464]
    and  a
    jr   nz,$10DB
    xor  a
    ld   [$C16B],a
    ld   [$C16C],a
    ld   [$DB96],a
    ld   a,$07
    ld   [$DB95],a
    ld   a,$02
    ld   [$2100],a
    call $755B
    call $1D2E
    call $398D
    pop  af
    ret  
    xor  a
    ld   [$D45F],a
    ld   a,[$FFB7]
    and  a
    jr   z,$10E7
    dec  a
    ld   [$FFB7],a
    ld   a,[$FFB6]
    and  a
    jr   z,$10EF
    dec  a
    ld   [$FFB6],a
    ld   a,[$C19F]
    and  a
    jp   nz,$1794
    ld   a,[$C124]
    and  a
    jp   nz,$114F
    ld   a,[$C11C]
    cp   a,$07
    jr   z,$1138
    ld   a,[$DB5A]
    ld   hl,$C50A
    or   [hl]
    ld   hl,$C14F
    or   [hl]
    jr   nz,$1135
    ld   a,$07
    ld   [$C11C],a
    ld   a,$BF
    ld   [$FFB7],a
    ld   a,$10
    ld   [$C3CC],a
    xor  a
    ld   [$DBC7],a
    ld   [$FF9C],a
    ld   [$DDD6],a
    ld   [$DDD7],a
    ld   [$D464],a
    call $27F2
    ld   a,$08
    ld   [$FFF3],a
    ld   a,[$C11C]
    rst  $00
    ld   h,l
    ld   de,$4F30
    ld   h,b
    ld   c,c
    scf  
    jr   $1120
    add  hl,de
    ld   l,l
    ld   c,[hl]
    call nc,$5D50
    ld   de,$5267
    ld   d,l
    ld   de,$50A3
    call $1794
    jp   $1D2E
    ld   a,$19
    call $080C
    jp   $5D6A
    ld   a,$01
    call $080C
    jp   $41C2
    ld   a,$36
    ld   [$2100],a
    call $725A
    and  a
    ret  z
    ld   a,$02
    call $080C
    jp   $4287
    ld   a,[$C50A]
    ld   hl,$C167
    or   [hl]
    ld   hl,$C1A4
    or   [hl]
    ret  nz
    ld   a,[$C14A]
    and  a
    jr   z,$11BC
    ld   a,[$DB01]
    cp   a,$01
    jr   z,$11AA
    ld   a,[$DB00]
    cp   a,$01
    jr   z,$11AA
    ld   a,[$DB01]
    cp   a,$04
    jr   z,$11A5
    ld   a,[$DB00]
    cp   a,$04
    jr   nz,$11BA
    call $1340
    jr   $11BA
    ld   a,[$C137]
    dec  a
    cp   a,$04
    jr   c,$11BA
    ld   a,$05
    ld   [$C137],a
    ld   [$C16A],a
    jr   $11C3
    xor  a
    ld   [$C15B],a
    ld   [$C15A],a
    ld   a,[$C117]
    and  a
    jp   nz,$12ED
    ld   a,[$C15C]
    and  a
    jp   nz,$12ED
    ld   a,[$C137]
    and  a
    jr   z,$11E2
    cp   a,$03
    jr   nz,$11E2
    ld   a,[$C138]
    cp   a,$03
    jr   nc,$11E8
    ld   a,[$FFA1]
    and  a
    jp   nz,$12ED
    ld   a,[$DB00]
    cp   a,$08
    jr   nz,$11FE
    ld   a,[$FFCB]
    and  a,$20
    jr   z,$11FA
    call $1705
    jr   $11FE
    xor  a
    ld   [$C14B],a
    ld   a,[$DB01]
    cp   a,$08
    jr   nz,$1214
    ld   a,[$FFCB]
    and  a,$10
    jr   z,$1210
    call $1705
    jr   $1214
    xor  a
    ld   [$C14B],a
    ld   a,[$DB01]
    cp   a,$04
    jr   nz,$1235
    ld   a,[$DB44]
    ld   [$C15A],a
    ld   a,[$FFCB]
    and  a,$10
    jr   z,$1235
    ld   a,[$C1AD]
    cp   a,$01
    jr   z,$1235
    cp   a,$02
    jr   z,$1235
    call $1340
    ld   a,[$DB00]
    cp   a,$04
    jr   nz,$124B
    ld   a,[$DB44]
    ld   [$C15A],a
    ld   a,[$FFCB]
    and  a,$20
    jr   z,$124B
    call $1340
    ld   a,[$FFCC]
    and  a,$20
    jr   z,$125E
    ld   a,[$C1AD]
    cp   a,$02
    jr   z,$125E
    ld   a,[$DB00]
    call $129C
    ld   a,[$FFCC]
    and  a,$10
    jr   z,$1275
    ld   a,[$C1AD]
    cp   a,$01
    jr   z,$1275
    cp   a,$02
    jr   z,$1275
    ld   a,[$DB01]
    call $129C
    ld   a,[$FFCB]
    and  a,$20
    jr   z,$1281
    ld   a,[$DB00]
    call $1321
    ld   a,[$FFCB]
    and  a,$10
    jr   z,$128D
    ld   a,[$DB01]
    call $1321
    ld   a,$20
    ld   [$2100],a
    call $48CA
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    ld   c,a
    cp   a,$01
    jp   z,$1528
    cp   a,$04
    jp   z,$12EE
    cp   a,$02
    jp   z,$135A
    cp   a,$03
    jp   z,$1382
    cp   a,$05
    jp   z,$13BD
    cp   a,$0D
    jp   z,$1383
    cp   a,$06
    jp   z,$1319
    cp   a,$0A
    jp   z,$14CB
    cp   a,$09
    jp   z,$41FC
    cp   a,$0C
    jp   z,$148D
    cp   a,$0B
    jp   z,$12F8
    cp   a,$07
    jr   nz,$12ED
    ld   hl,$C137
    ld   a,[$C19B]
    or   [hl]
    jr   nz,$12ED
    ld   a,[$C14D]
    cp   a,$02
    jr   nc,$12ED
    ld   a,$8E
    ld   [$C19B],a
    ret  
    ld   a,[$C144]
    and  a
    ret  nz
    ld   a,$16
    ld   [$FFF4],a
    ret  
    ld   a,[$C1C7]
    ld   hl,$C146
    or   [hl]
    ret  nz
    call $4D20
    jr   nc,$130B
    ld   a,$07
    ld   [$FFF2],a
    jr   $130F
    ld   a,$0E
    ld   [$FFF4],a
    ld   a,$01
    ld   [$C1C7],a
    xor  a
    ld   [$C1C8],a
    ret  
    ld   a,[$C1A4]
    and  a
    ret  nz
    jp   $4254
    cp   a,$01
    ret  nz
    ld   hl,$C137
    ld   a,[$C1AD]
    and  a,$03
    or   [hl]
    ret  nz
    ld   a,[$C160]
    and  a
    ret  nz
    xor  a
    ld   [$C1AC],a
    ld   a,$05
    ld   [$C137],a
    ld   [$C5B0],a
    ret  
    ld   a,$01
    ld   [$C15B],a
    ld   a,[$DB44]
    ld   [$C15A],a
    ld   a,$20
    ld   [$2100],a
    call $4B4A
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    ld   a,[$C14E]
    cp   a,$01
    ret  nc
    ld   a,[$DB4D]
    and  a
    jp   z,$0C20
    sub  a,$01
    daa  
    ld   [$DB4D],a
    ld   a,$02
    call $142F
    ret  c
    ld   a,$20
    ld   [$2100],a
    call $4B81
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    ret  
    ld   a,[$C14D]
    and  a
    ret  nz
    ld   a,$01
    call $142F
    ret  c
    ld   a,$20
    ld   [$2100],a
    call $4BFF
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    nop  
    nop  
    nop  
    nop  
    nop  
    nop  
    nop  
    nop  
    jr   nz,$1387
    nop  
    nop  
    nop  
    nop  
    ld   [$FF20],a
    jr   nc,$137F
    nop  
    nop  
    ld   b,b
    ret  nz
    nop  
    nop  
    nop  
    nop  
    ret  nc
    jr   nc,$13BA
    nop  
    ret  nz
    ld   b,b
    ld   a,[$C14C]
    and  a
    ret  nz
    ld   a,[$C14D]
    cp   a,$02
    jr   nc,$142E
    ld   a,$10
    ld   [$C14C],a
    ld   a,[$DB45]
    and  a
    jp   z,$0C20
    sub  a,$01
    daa  
    ld   [$DB45],a
    call $157C
    ld   a,$00
    call $142F
    ret  c
    ld   a,e
    ld   [$C1C2],a
    ld   a,[$C1C0]
    and  a
    jr   z,$1401
    ld   a,[$C1C1]
    ld   c,a
    ld   b,d
    ld   hl,$C280
    add  hl,bc
    ld   [hl],b
    ld   hl,$C290
    add  hl,de
    ld   [hl],$01
    xor  a
    jr   $1407
    ld   a,$0A
    ld   [$FFF4],a
    ld   a,$06
    ld   [$C1C0],a
    ld   a,[$FF9E]
    ld   c,a
    ld   b,$00
    ld   a,[$D47C]
    cp   a,$01
    jr   nz,$141A
    ld   a,c
    add  a,$04
    ld   c,a
    ld   hl,$13AD
    add  hl,bc
    ld   a,[hl]
    ld   hl,$C240
    add  hl,de
    ld   [hl],a
    ld   hl,$13B5
    add  hl,bc
    ld   a,[hl]
    ld   hl,$C250
    add  hl,de
    ld   [hl],a
    ret  
    call $3B86
    ret  c
    ld   a,$0C
    ld   [$C19B],a
    push bc
    ld   a,[$FF9E]
    ld   c,a
    ld   b,$00
    ld   hl,$139D
    add  hl,bc
    ld   a,[$FF98]
    add  [hl]
    ld   hl,$C200
    add  hl,de
    ld   [hl],a
    ld   hl,$13A1
    add  hl,bc
    ld   a,[$FF99]
    add  [hl]
    ld   hl,$C210
    add  hl,de
    ld   [hl],a
    ld   a,[$FFA2]
    inc  a
    ld   hl,$C310
    add  hl,de
    ld   [hl],a
    ld   hl,$13A5
    add  hl,bc
    ld   a,[hl]
    ld   hl,$C240
    add  hl,de
    ld   [hl],a
    ld   hl,$13A9
    add  hl,bc
    ld   a,[hl]
    ld   hl,$C250
    add  hl,de
    ld   [hl],a
    ld   a,[$FF9E]
    ld   hl,$C3B0
    add  hl,de
    ld   [hl],a
    ld   hl,$C380
    add  hl,de
    ld   [hl],a
    ld   hl,$C5D0
    add  hl,de
    ld   [hl],a
    ld   hl,$C4F0
    add  hl,de
    ld   [hl],$01
    pop  bc
    scf  
    ccf  
    ret  
    ld   a,[$C19B]
    and  a
    ret  nz
    ld   a,[$DB4B]
    and  a
    jr   z,$14A7
    ld   a,[$FFA2]
    and  a
    ret  nz
    ld   a,$02
    ld   [$C1A9],a
    ld   a,$2A
    ld   [$C1AA],a
    ret  
    ld   a,[$DB4C]
    and  a
    jp   z,$0C20
    ld   a,$08
    call $3B86
    ret  c
    ld   a,$20
    ld   [$2100],a
    call $4C47
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    inc  e
    -    
    nop  
    nop  
    nop  
    nop  
    -    
    inc  e
    ld   a,[$C130]
    cp   a,$07
    ret  z
    ld   a,[$C146]
    and  a
    ret  nz
    ld   a,$01
    ld   [$C146],a
    xor  a
    ld   [$C152],a
    ld   [$C153],a
    ld   a,$0D
    ld   [$FFF2],a
    ld   a,[$FFF9]
    and  a
    jr   z,$1508
    call $1508
    ld   a,[$FFCB]
    and  a,$03
    ld   a,$EA
    jr   z,$14F8
    ld   a,$E8
    ld   [$FF9B],a
    xor  a
    ld   [$FFA3],a
    call $21A8
    ld   a,$02
    call $080C
    jp   $6C75
    ld   a,$20
    ld   [$FFA3],a
    ld   a,[$C14A]
    and  a
    ret  z
    ld   a,[$FF9E]
    ld   e,a
    ld   d,b
    ld   hl,$14C3
    add  hl,de
    ld   a,[hl]
    ld   [$FF9A],a
    ld   hl,$14C7
    add  hl,de
    ld   a,[hl]
    ld   [$FF9B],a
    ret  
    ld   [bc],a
    inc  d
    dec  d
    jr   $1523
    ld   l,l
    pop  bc
    ld   hl,$C121
    or   [hl]
    ret  nz
    ld   a,$03
    ld   [$C138],a
    ld   a,$01
    ld   [$C137],a
    ld   [$C5B0],a
    xor  a
    ld   [$C160],a
    ld   [$C1AC],a
    call $280D
    and  a,$03
    ld   e,a
    ld   d,$00
    ld   hl,$1524
    add  hl,de
    ld   a,[hl]
    ld   [$FFF4],a
    call $157C
    ld   a,[$C146]
    and  a
    jr   nz,$1562
    call $0CAF
    call $178E
    ld   a,[$C14D]
    and  a
    ret  nz
    ld   a,[$C5A9]
    and  a
    ret  z
    ld   a,[$DB4E]
    cp   a,$02
    ret  nz
    ld   a,$DF
    call $142F
    xor  a
    ld   [$C19B],a
    ret  
    ld   a,[$FFCB]
    and  a,$0F
    ld   e,a
    ld   d,$00
    ld   hl,$4905
    add  hl,de
    ld   a,[hl]
    cp   a,$0F
    jr   z,$158E
    ld   [$FF9E],a
    ret  
    ld   d,$FA
    ld   [$1608],sp
    ld   d,$08
    ld   a,[$FAFA]
    ld   [$0816],sp
    ld   [$16FA],sp
    ld   [$1616],sp
    ld   d,$08
    ld   a,[$FAFA]
    call $15AF
    ld   a,$02
    jp   $080C
    ld   a,[$C1C4]
    and  a
    ret  nz
    ld   a,[$C14A]
    and  a
    jr   nz,$15C0
    ld   a,[$C16A]
    cp   a,$05
    ret  z
    ld   a,[$C121]
    and  a
    jr   z,$15CD
    ld   a,[$C136]
    add  a,$04
    jr   $15CF
    ld   a,[$FF9E]
    ld   e,a
    ld   d,$00
    ld   hl,$158F
    add  hl,de
    ld   a,[$FF98]
    add  [hl]
    sub  a,$08
    and  a,$F0
    ld   [$FFCE],a
    swap a
    ld   c,a
    ld   hl,$159B
    add  hl,de
    ld   a,[$FF99]
    add  [hl]
    sub  a,$10
    and  a,$F0
    ld   [$FFCD],a
    or   c
    ld   e,a
    ld   hl,$D711
    add  hl,de
    ld   a,h
    cp   a,$D7
    ret  nz
    push de
    ld   a,[hl]
    ld   [$FFAF],a
    ld   e,a
    ld   a,[$DBA5]
    ld   d,a
    call $2A26
    pop  de
    cp   a,$D0
    jp   c,$1610
    cp   a,$D4
    jp   c,$16C2
    cp   a,$90
    jp   nc,$16C2
    cp   a,$01
    jp   z,$16C2
    ld   c,$00
    ld   a,[$DBA5]
    and  a
    ld   a,[$FFAF]
    jr   z,$1629
    cp   a,$DD
    jr   z,$1637
    ret  
    inc  c
    cp   a,$D3
    jr   z,$1637
    cp   a,$5C
    jr   z,$1637
    cp   a,$0A
    ret  nz
    ld   c,$FF
    ld   a,c
    ld   [$FFF1],a
    call $2178
    ld   a,[$C14A]
    and  a
    jr   nz,$1653
    ld   a,[$C16A]
    cp   a,$05
    jr   nz,$1653
    xor  a
    ld   [$C122],a
    ld   a,$0C
    ld   [$C16D],a
    ld   a,$05
    call $142F
    jr   c,$167C
    xor  a
    ld   [$C19B],a
    ld   hl,$C200
    add  hl,de
    ld   a,[$FFCE]
    add  a,$08
    ld   [hl],a
    ld   hl,$C210
    add  hl,de
    ld   a,[$FFCD]
    add  a,$10
    ld   [hl],a
    ld   hl,$C3B0
    add  hl,de
    ld   a,[$FFF1]
    ld   [hl],a
    ld   c,e
    ld   b,d
    call $3942
    call $280D
    and  a,$07
    ret  nz
    ld   a,[$FFAF]
    cp   a,$D3
    ret  z
    call $280D
    rra  
    ld   a,$2E
    jr   nc,$1691
    ld   a,$2D
    call $3B86
    ret  c
    ld   hl,$C200
    add  hl,de
    ld   a,[$FFCE]
    add  a,$08
    ld   [hl],a
    ld   hl,$C210
    add  hl,de
    ld   a,[$FFCD]
    add  a,$10
    ld   [hl],a
    ld   hl,$C450
    add  hl,de
    ld   [hl],$80
    ld   hl,$C2F0
    add  hl,de
    ld   [hl],$18
    ld   hl,$C320
    add  hl,de
    ld   [hl],$10
    ret  
    ld   [de],a
    xor  a,$FC
    inc  b
    inc  b
    inc  b
    xor  a,$12
    ld   c,a
    ld   a,[$C16D]
    and  a
    ret  z
    ld   a,[$FF9E]
    ld   e,a
    ld   d,$00
    ld   hl,$16BA
    add  hl,de
    ld   a,[$FF98]
    add  [hl]
    ld   [$FFD7],a
    ld   hl,$16BE
    add  hl,de
    ld   a,[$FF99]
    add  [hl]
    ld   [$FFD8],a
    ld   a,$04
    ld   [$C502],a
    call $0D15
    ld   a,$10
    ld   [$C1C4],a
    ld   a,c
    and  a,$F0
    cp   a,$90
    jr   z,$16F8
    ld   a,$07
    ld   [$FFF2],a
    ret  
    ld   a,$17
    ld   [$FFF4],a
    ret  
    jr   nz,$16DF
    nop  
    nop  
    nop  
    nop  
    ld   [$FF20],a
    ld   a,[$FFF9]
    and  a
    jr   z,$1713
    ld   a,[$FF9C]
    and  a
    ret  nz
    ld   a,[$FF9E]
    and  a,$02
    ret  nz
    ld   a,[$C14A]
    and  a
    ret  nz
    ld   a,[$FFA2]
    ld   hl,$C146
    or   [hl]
    ret  nz
    ld   a,[$C120]
    add  a,$02
    ld   [$C120],a
    call $1756
    ld   a,[$C14B]
    inc  a
    ld   [$C14B],a
    cp   a,$20
    ret  nz
    ld   [$C14A],a
    xor  a
    ld   [$C121],a
    ld   [$C122],a
    ld   a,[$FF9E]
    ld   e,a
    ld   d,$00
    ld   hl,$16FD
    add  hl,de
    ld   a,[hl]
    ld   [$FF9A],a
    ld   hl,$1701
    add  hl,de
    ld   a,[hl]
    ld   [$FF9B],a
    xor  a
    ld   [$C1AC],a
    ret  
    ld   a,[$FFE7]
    and  a,$07
    ld   hl,$FFA2
    or   [hl]
    ld   hl,$FFA1
    or   [hl]
    ld   hl,$C146
    or   [hl]
    ret  nz
    ld   a,[$FF98]
    ld   [$FFD7],a
    ld   a,[$C181]
    cp   a,$05
    jr   z,$1781
    ld   a,$07
    ld   [$FFF4],a
    ld   a,[$FF99]
    add  a,$06
    ld   [$FFD8],a
    ld   a,$0B
    jp   $0CC7
    ld   a,[$FF99]
    ld   [$FFD8],a
    ld   a,$0E
    ld   [$FFF2],a
    ld   a,$0C
    jp   $0CC7
    xor  a
    ld   [$FF9A],a
    ld   [$FF9B],a
    ret  
    call $753A
    ld   a,[$C11C]
    cp   a,$01
    ret  z
    ld   a,[$C16A]
    and  a
    jr   z,$17DB
    ld   bc,$C010
    ld   a,[$C145]
    ld   hl,$C13B
    add  [hl]
    ld   [$FFD7],a
    ld   a,[$FF98]
    ld   [$FFD8],a
    ld   hl,$FFDA
    ld   [hl],$00
    ld   a,[$C122]
    cp   a,$28
    jr   c,$17C6
    ld   a,[$FFE7]
    rla  
    rla  
    and  a,$10
    ld   [hl],a
    ld   a,[$C139]
    ld   h,a
    ld   a,[$C13A]
    ld   l,a
    ld   a,[$C136]
    ld   [$FFD9],a
    ld   a,[$FF99]
    cp   a,$88
    ret  nc
    jp   $1819
    ld   a,[$C19B]
    push af
    bit  7,a
    jp   z,$1814
    ld   a,$02
    call $080C
    call $5310
    ld   a,[$C19B]
    and  a,$7F
    cp   a,$0C
    jr   nz,$1814
    ld   hl,$C19F
    ld   a,[$C124]
    or   [hl]
    jr   nz,$1814
    call $157C
    ld   a,$04
    call $142F
    jr   c,$1814
    ld   a,$0D
    ld   [$FFF4],a
    ld   a,$02
    call $080C
    call $538B
    pop  af
    ld   [$C19B],a
    ret  
    ld   a,$20
    ld   [$2100],a
    call $4AB3
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    ld   a,$20
    ld   [$2100],a
    call $49BA
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    call $754F
    ld   a,[$C3C9]
    and  a
    jr   z,$1847
    xor  a
    ld   [$C3C9],a
    jp   $0C7D
    call $1A22
    xor  a
    ld   [$C157],a
    inc  a
    ld   [$C1A8],a
    ld   a,[$C16B]
    cp   a,$04
    jp   nz,$19D9
    xor  a
    ld   [$FF96],a
    ld   [$FF97],a
    ld   [$FFB4],a
    ld   [$DDD6],a
    ld   [$DDD7],a
    ld   e,$10
    ld   hl,$C280
    ldi  [hl],a
    dec  e
    jr   nz,$186C
    ld   a,[$C509]
    and  a
    jr   z,$1898
    push af
    ld   a,$04
    call $080C
    pop  af
    call $7A5F
    ld   hl,$DB6E
    inc  [hl]
    ld   hl,$DB46
    inc  [hl]
    ld   a,[$DC0C]
    or   a,$40
    ld   [$DC0C],a
    ld   a,$01
    ld   [$D47E],a
    xor  a
    ld   [$FF9D],a
    ld   a,[$FFF9]
    ld   [$FFE4],a
    ld   a,$0B
    ld   [$DB95],a
    xor  a
    ld   [$DB96],a
    ld   [$C3CB],a
    ld   [$FFF9],a
    ld   hl,$D401
    ld   a,[$DBA5]
    ld   [$FFE6],a
    and  a
    jr   nz,$18DF
    ld   hl,$D416
    ld   c,$00
    ld   a,[$FF98]
    swap a
    and  a,$0F
    ld   e,a
    ld   a,[$FF99]
    sub  a,$08
    and  a,$F0
    or   e
    cp   [hl]
    jr   z,$18D2
    inc  hl
    inc  c
    ld   a,c
    cp   a,$04
    jr   nz,$18BA
    ld   a,c
    sla  a
    sla  a
    add  c
    ld   e,a
    ld   d,$00
    ld   hl,$D401
    add  hl,de
    push hl
    ldi  a,[hl]
    ld   [$DBA5],a
    cp   a,$02
    jr   nz,$18F2
    ld   [$FFF9],a
    dec  a
    ld   [$DBA5],a
    ld   a,$01
    ld   [$FF9C],a
    ldi  a,[hl]
    ld   [$FFF7],a
    ld   a,[$DBA5]
    and  a
    ldi  a,[hl]
    ld   [$FFF6],a
    jr   nz,$1909
    ld   a,[$FFE6]
    and  a
    jr   z,$1907
    xor  a
    ld   [$D47C],a
    jr   $196F
    ld   c,a
    ld   a,$14
    call $080C
    push hl
    ld   a,[$FFF7]
    swap a
    ld   e,a
    ld   d,$00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl,$4220
    add  hl,de
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$192E
    ld   hl,$44E0
    jr   $193C
    cp   a,$06
    jr   nz,$193C
    ld   a,[$DB6B]
    and  a,$04
    jr   z,$193C
    ld   hl,$4520
    ld   e,$00
    ldi  a,[hl]
    cp   c
    jr   z,$1948
    inc  e
    ld   a,e
    cp   a,$40
    jr   nz,$193E
    ld   a,e
    ld   [$DBAE],a
    ld   a,[$FFE6]
    and  a
    jr   nz,$196E
    xor  a
    ld   [$D47C],a
    ld   a,[$FFF7]
    cp   a,$0A
    jr   nc,$196E
    ld   a,$02
    call $080C
    call $6709
    ld   a,$30
    ld   [$FFB4],a
    xor  a
    ld   [$D6FB],a
    ld   [$D6F8],a
    pop  hl
    ldi  a,[hl]
    ld   [$DB9D],a
    ld   a,[hl]
    ld   [$DB9E],a
    pop  hl
    ld   a,[$FFF9]
    and  a
    jr   nz,$19DA
    ld   a,[$FFE4]
    and  a
    jr   nz,$19D9
    ld   a,[$DBA5]
    and  a
    jr   z,$19C2
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$1993
    ld   hl,$4E3C
    jr   $19A4
    cp   a,$0A
    jr   nc,$19C2
    ld   e,a
    sla  a
    sla  a
    add  e
    ld   e,a
    ld   d,$00
    ld   hl,$4DF1
    add  hl,de
    ld   a,$14
    ld   [$2100],a
    call $19C2
    push de
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$19B7
    ld   a,$3A
    jr   $19BF
    ld   e,a
    ld   d,$00
    ld   hl,$4E41
    add  hl,de
    ld   a,[hl]
    pop  de
    ld   [de],a
    ret  
    ld   a,$00
    ld   [$FFD7],a
    ld   de,$DB5F
    ldi  a,[hl]
    ld   [de],a
    inc  de
    ld   a,[$FFD7]
    inc  a
    ld   [$FFD7],a
    cp   a,$05
    jr   nz,$19C9
    ld   a,[$DBAE]
    ld   [de],a
    ret  
    xor  a
    ld   [$FF9E],a
    ret  
    call $754F
    ld   a,[$D474]
    and  a
    jr   z,$19FC
    xor  a
    ld   [$D474],a
    ld   a,$30
    ld   [$C180],a
    ld   a,$03
    ld   [$C17F],a
    ld   a,$04
    ld   [$C16B],a
    jr   $1A06
    call $1A39
    ld   a,[$C16B]
    cp   a,$04
    jr   nz,$1A21
    ld   a,[$D463]
    cp   a,$01
    jr   z,$1A0F
    ld   a,$00
    ld   [$C11C],a
    ld   a,[$D47E]
    and  a
    jr   z,$1A21
    xor  a
    ld   [$D47E],a
    ld   a,$36
    jp   $2385
    ret  
    ld   a,$20
    ld   [$2100],a
    call $6C4F
    ld   a,$20
    ld   [$2100],a
    call $55CA
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    ld   a,$20
    ld   [$2100],a
    call $6C7A
    ld   a,$20
    ld   [$2100],a
    call $563B
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    ld   a,[$C120]
    sra  a
    sra  a
    sra  a
    and  a,$01
    ld   d,a
    ld   a,[$FF9E]
    sla  a
    or   d
    ld   c,a
    ld   b,$00
    ld   hl,$4948
    ld   a,[$C11C]
    cp   a,$01
    jr   nz,$1A78
    ld   a,[$FF9C]
    and  a
    jr   z,$1A76
    ld   hl,$4950
    jr   $1AC7
    ld   a,[$FFF9]
    and  a
    jr   z,$1A88
    ld   a,[$FF9C]
    cp   a,$02
    jr   nz,$1A88
    ld   hl,$4958
    jr   $1AC7
    ld   a,[$C15C]
    cp   a,$01
    jr   z,$1AC4
    ld   a,[$FFB2]
    and  a
    jr   nz,$1A9A
    ld   a,[$C144]
    and  a
    jr   nz,$1ABF
    ld   a,[$C15A]
    and  a
    jr   nz,$1AA5
    ld   hl,$4910
    jr   $1AC7
    ld   hl,$4918
    cp   a,$02
    jr   nz,$1AAF
    ld   hl,$4928
    ld   a,[$C15B]
    and  a
    jr   z,$1ABD
    ld   a,l
    add  a,$08
    ld   l,a
    ld   a,h
    adc  a,$00
    ld   h,a
    jr   $1AC7
    ld   hl,$4938
    jr   $1AC7
    ld   hl,$4940
    add  hl,bc
    ld   a,[hl]
    ld   [$FF9D],a
    ret  
    ld   a,[$D601]
    and  a
    ret  nz
    ld   a,$10
    call $0B0B
    ld   [$2100],a
    ld   hl,$6500
    ld   de,$9500
    ld   a,[$FFE7]
    and  a,$0F
    jr   z,$1AEB
    cp   a,$08
    ret  nz
    ld   l,$40
    ld   e,l
    ld   a,[$FFE7]
    and  a,$30
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    add  hl,bc
    ld   bc,$0040
    jp   $2914
    jr   nz,$1B67
    and  b
    ld   [$FFE0],a
    ld   [$FFA0],a
    ld   h,b
    ld   a,[$DB95]
    cp   a,$09
    jr   z,$1ACC
    cp   a,$00
    jr   nz,$1B46
    ld   a,[$D601]
    and  a
    jp   nz,$1B45
    ld   a,[$FFE7]
    and  a,$0F
    cp   a,$04
    jr   c,$1B45
    ld   a,$10
    call $0B0B
    ld   [$2100],a
    ld   a,[$D006]
    ld   l,a
    ld   a,[$D007]
    ld   h,a
    ld   a,[$D008]
    ld   e,a
    ld   a,[$D009]
    ld   d,a
    ld   bc,$0020
    jp   $2914
    ret  
    ld   a,[$DB95]
    cp   a,$01
    jr   nz,$1B53
    ld   a,[$FFA5]
    and  a
    jr   nz,$1B82
    ret  
    cp   a,$0B
    jp   c,$1DE8
    ld   a,[$DB9A]
    cp   a,$80
    jp   nz,$1DE8
    ld   a,[$C14F]
    and  a
    jp   nz,$1D2E
    ld   hl,$C124
    ld   a,[$D601]
    or   [hl]
    jp   nz,$1D2E
    ld   a,[$D6F8]
    and  a
    jr   z,$1B7D
    call $1ED7
    jp   $1D2E
    ld   a,[$FFA5]
    and  a
    jr   z,$1BCD
    cp   a,$01
    jp   z,$3F93
    cp   a,$02
    jp   z,$3FA9
    cp   a,$03
    jp   z,$1EB5
    cp   a,$04
    jp   z,$1EBC
    cp   a,$08
    jp   z,$1E69
    cp   a,$09
    jp   z,$1EA1
    cp   a,$0A
    jp   z,$1E2B
    cp   a,$0B
    jp   z,$1E8D
    cp   a,$0C
    jp   z,$1E33
    cp   a,$0D
    jp   z,$1E01
    cp   a,$0E
    jr   z,$1BC5
    cp   a,$0F
    jp   z,$1DF0
    cp   a,$10
    jp   z,$1DE9
    jp   $1D2E
    ld   a,$17
    ld   [$2100],a
    jp   $4062
    ld   a,[$FFA6]
    inc  a
    ld   [$FFA6],a
    ld   a,[$FFA4]
    rst  $00
    ld   e,$1D
    ld   sp,hl
    dec  de
    ld   d,$1C
    ld   a,[de]
    inc  e
    add  hl,sp
    inc  e
    adc  d
    inc  e
    adc  [hl]
    inc  e
    xor  c
    inc  e
    add  a,$1C
    push de
    inc  e
    -    
    inc  e
    ldi  [hl],a
    inc  e
    ld   e,$1C
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
    ld   a,[$FFA6]
    and  a,$07
    jp   nz,$1D1E
    ld   a,$01
    ld   [$2100],a
    call $61AA
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    jp   $1D2E
    ld   l,a
    jr   $1C51
    ld   h,$6B
    jr   $1C24
    ld   h,$6C
    jr   $1C24
    ld   h,$73
    jr   $1C24
    ld   h,$6A
    ld   a,[$FFA6]
    and  a,$0F
    jp   nz,$1D1E
    call $1CE8
    jp   $1C13
    nop  
    ld   b,b
    add  b
    ret  nz
    ret  nz
    ret  nz
    add  b
    ld   b,b
    ld   a,[$FFA6]
    and  a,$07
    jp   nz,$1D1E
    ld   a,[$FFA6]
    rra  
    rra  
    rra  
    and  a,$07
    ld   e,a
    ld   d,$00
    ld   hl,$1C31
    add  hl,de
    ld   l,[hl]
    ld   h,$6D
    ld   de,$96C0
    ld   bc,$0040
    call $2914
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$1C87
    ld   a,$20
    ld   [$2100],a
    ld   b,$01
    call $47F7
    jr   z,$1C72
    ld   [$2100],a
    call $2914
    ld   a,$20
    ld   [$2100],a
    ld   b,$00
    call $47F7
    jr   z,$1C87
    ld   [$2100],a
    ld   de,$96C0
    call $2914
    jp   $1D2E
    ld   h,$6E
    jr   $1C24
    ld   a,[$FFA6]
    and  a,$07
    jp   nz,$1D1E
    ld   a,[$FFA6]
    rra  
    rra  
    rra  
    and  a,$07
    ld   e,a
    ld   d,$00
    ld   hl,$1C31
    add  hl,de
    ld   l,[hl]
    ld   h,$6F
    jp   $1C51
    ld   hl,$DCC0
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$1CB8
    ld   de,$8400
    jp   $1C54
    ld   a,[$FFA6]
    inc  a
    and  a,$03
    jp   nz,$1C39
    ld   de,$90C0
    jp   $1C54
    ld   h,$70
    ld   a,[$FFA6]
    and  a,$07
    jp   nz,$1D1E
    call $1CE8
    jp   $1C13
    ld   h,$71
    ld   a,[$FFA6]
    and  a,$03
    jp   nz,$1D1E
    call $1CE8
    jp   $1C13
    ld   h,$72
    jr   $1CD7
    ld   a,[$FFA7]
    add  a,$40
    ld   [$FFA7],a
    ret  
    ld   h,$75
    jr   $1CD7
    ld   h,$74
    jr   $1CC8
    ld   h,$77
    jr   $1CC8
    ld   h,$76
    jr   $1CC8
    ld   a,$38
    ld   [$2100],a
    call $7830
    jp   $1D2E
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ld   a,[bc]
    inc  bc
    ldi  [hl],a
    dec  d
    jr   nz,$1D12
    ld   a,$20
    ld   [$2100],a
    ret  
    ld   a,$20
    ld   [$2100],a
    call $54F5
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ld   a,[$FF9D]
    inc  a
    ret  z
    ld   a,[$FFFE]
    and  a
    jr   z,$1D42
    ld   a,[$DBC7]
    and  a,$04
    jr   z,$1D49
    ld   a,$04
    jr   $1D49
    ld   a,[$DBC7]
    rla  
    rla  
    and  a,$10
    ld   [$C135],a
    ld   hl,$C008
    ld   a,[$C13B]
    ld   c,a
    ld   a,[$C145]
    add  c
    cp   a,$88
    ret  nc
    push af
    ldi  [hl],a
    ld   a,[$C13C]
    ld   c,a
    ld   a,[$FF98]
    add  c
    ldi  [hl],a
    ld   a,$00
    ldi  [hl],a
    ld   a,[$C135]
    ld   d,a
    ld   a,[$C11D]
    or   d
    ld   [hl],a
    ld   a,[$FFFE]
    and  a
    jr   z,$1DA1
    ld   a,[$DBC7]
    and  a,$04
    jr   nz,$1DA1
    ld   a,[$FF9D]
    cp   a,$50
    jr   c,$1D8C
    cp   a,$55
    jr   nc,$1D8C
    ld   a,[hl]
    or   a,$07
    ld   [hl],a
    jr   $1DA1
    ld   a,[$DC0F]
    and  a
    jr   z,$1D95
    inc  a
    or   [hl]
    ld   [hl],a
    ld   a,[$FF9D]
    cp   a,$4E
    jr   z,$1D9F
    cp   a,$4F
    jr   nz,$1DA1
    ld   [hl],$03
    inc  hl
    pop  af
    ldi  [hl],a
    ld   a,[$FF98]
    add  c
    add  a,$08
    ldi  [hl],a
    ld   a,$02
    ldi  [hl],a
    ld   a,[$C135]
    ld   d,a
    ld   a,[$C11E]
    or   d
    ld   [hl],a
    ld   a,[$FFFE]
    and  a
    jr   z,$1DE7
    ld   a,[$DBC7]
    and  a,$04
    jr   nz,$1DE7
    ld   a,[$FF9D]
    cp   a,$50
    jr   c,$1DD2
    cp   a,$55
    jr   nc,$1DD2
    ld   a,[hl]
    or   a,$07
    ld   [hl],a
    jr   $1DE7
    ld   a,[$DC0F]
    and  a
    jr   z,$1DDB
    inc  a
    or   [hl]
    ld   [hl],a
    ld   a,[$FF9D]
    cp   a,$4E
    jr   z,$1DE5
    cp   a,$4F
    jr   nz,$1DE7
    ld   [hl],$23
    inc  hl
    ret  
    ld   hl,$4F00
    ld   a,$0E
    jr   $1DF5
    ld   a,$12
    ld   hl,$6080
    ld   [$2100],a
    ld   de,$8400
    ld   bc,$0040
    jp   $1F3B
    ld   a,[$DB0E]
    cp   a,$02
    jp   c,$1F3E
    sub  a,$02
    ld   d,a
    ld   e,$00
    sra  d
    rr   e
    sra  d
    rr   e
    ld   hl,$4400
    add  hl,de
    ld   de,$89A0
    ld   bc,$0040
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    jp   $1F3B
    ld   hl,$68C0
    ld   de,$88E0
    jr   $1EA7
    ld   a,$11
    call $0B0B
    ld   [$2100],a
    ld   a,[$D000]
    swap a
    and  a,$F0
    ld   e,a
    ld   d,$00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl,$8D00
    add  hl,de
    push hl
    ld   hl,$5000
    add  hl,de
    pop  de
    ld   bc,$0040
    call $2914
    xor  a
    ld   [$FFA5],a
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ret  
    ld   a,$13
    call $0B0B
    ld   [$2100],a
    ld   a,[$D000]
    swap a
    and  a,$F0
    ld   e,a
    ld   d,$00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl,$8D00
    add  hl,de
    push hl
    ld   hl,$4D00
    jr   $1E55
    ld   hl,$48E0
    ld   de,$88E0
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ld   bc,$0020
    jp   $1F3B
    ld   hl,$68E0
    ld   de,$8CA0
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ld   bc,$0020
    jp   $1F3B
    ld   hl,$7F00
    ld   a,$12
    jr   $1EC1
    ld   hl,$4C40
    ld   a,$0D
    call $0B0B
    ld   [$2100],a
    ld   de,$9140
    jp   $1F38
    ld   b,b
    ld   l,b
    ld   b,b
    ld   l,b
    nop  
    ld   l,b
    add  b
    ld   l,b
    nop  
    ld   l,b
    push af
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    pop  af
    ld   hl,$FFA1
    ld   [hl],$01
    ld   hl,$D6FB
    ld   e,[hl]
    ld   d,$00
    inc  a
    cp   a,$03
    jr   nz,$1EFB
    push af
    ld   a,[$D6FB]
    xor  a,$02
    ld   [$D6FB],a
    pop  af
    ld   [$D6F8],a
    cp   a,$04
    jr   nz,$1F07
    ld   hl,$1ECD
    jr   $1F0E
    cp   a,$08
    jr   nz,$1F14
    ld   hl,$1ED1
    add  hl,de
    ld   de,$9040
    jr   $1F2C
    cp   a,$06
    jr   nz,$1F1D
    ld   hl,$1ECD
    jr   $1F28
    cp   a,$0A
    jr   nz,$1F35
    xor  a
    ld   [$D6F8],a
    ld   hl,$1ED3
    add  hl,de
    ld   de,$9080
    ld   bc,$0040
    ldi  a,[hl]
    ld   h,[hl]
    ld   l,a
    jp   $2914
    jp   $1D2E
    ld   bc,$0040
    call $2914
    xor  a
    ld   [$FFA5],a
    ld   a,$0C
    ld   [$2100],a
    jp   $1D2E
    inc  c
    inc  bc
    ld   [$0A08],sp
    ld   a,[bc]
    dec  b
    <corrupted stop>
    jr   c,$1F8E
    inc  a
    ld   [bc],a
    ld   bc,$0408
    -    
    inc  b
    nop  
    nop  
    nop  
    nop  
    inc  b
    nop  
    call $1F69
    ld   a,$02
    jp   $080C
    ld   hl,$C14A
    ld   a,[$C15C]
    or   [hl]
    ld   hl,$FFA2
    or   [hl]
    ld   hl,$C11C
    or   [hl]
    jp   nz,$2177
    ld   a,[$FF9E]
    ld   e,a
    ld   d,$00
    ld   hl,$1F49
    add  hl,de
    ld   a,[$FF98]
    add  [hl]
    sub  a,$08
    and  a,$F0
    ld   [$FFCE],a
    swap a
    ld   c,a
    ld   hl,$1F4D
    add  hl,de
    ld   a,[$FF99]
    add  [hl]
    sub  a,$10
    and  a,$F0
    ld   [$FFCD],a
    or   c
    ld   e,a
    ld   [$FFD8],a
    ld   hl,$D711
    add  hl,de
    ld   a,h
    cp   a,$D7
    jp   nz,$214E
    ld   a,[hl]
    ld   [$FFD7],a
    ld   e,a
    ld   a,[$DBA5]
    ld   d,a
    call $2A26
    ld   [$FFDC],a
    ld   a,[$FFD7]
    cp   a,$9A
    jr   z,$1FFE
    ld   a,[$FFDC]
    cp   a,$00
    jp   z,$214E
    cp   a,$01
    jr   z,$1FE6
    cp   a,$50
    jp   z,$214E
    cp   a,$51
    jp   z,$214E
    cp   a,$11
    jp   c,$214E
    cp   a,$D4
    jp   nc,$214E
    cp   a,$D0
    jr   nc,$1FE6
    cp   a,$7C
    jp   nc,$214E
    ld   a,[$FFD7]
    ld   e,a
    cp   a,$6F
    jr   z,$1FF6
    cp   a,$5E
    jr   z,$1FF6
    cp   a,$D4
    jp   nz,$2098
    ld   a,[$DBA5]
    and  a
    ld   a,e
    jp   nz,$2098
    ld   e,a
    ld   a,[$FF9E]
    cp   a,$02
    jp   nz,$20CF
    ld   a,$02
    ld   [$C1AD],a
    ld   a,[$FFCC]
    and  a,$30
    jp   z,$20CF
    ld   a,e
    cp   a,$5E
    ld   a,$8E
    jr   z,$2088
    ld   a,e
    cp   a,$6F
    jr   z,$2049
    cp   a,$D4
    jr   z,$2049
    ld   a,[$DB73]
    and  a
    jr   z,$2030
    ld   a,$78
    call $237C
    jp   $20CF
    ld   a,[$DB4E]
    and  a
    ld   a,[$FFF6]
    jr   nz,$203E
    ld   e,$FF
    cp   a,$A3
    jr   z,$2046
    ld   e,$FC
    cp   a,$FA
    jr   z,$2046
    ld   e,$FD
    ld   a,e
    jr   $208E
    ld   a,[$FFF6]
    ld   e,a
    ld   d,$00
    ld   a,$14
    ld   [$2100],a
    ld   hl,$5118
    add  hl,de
    ld   a,[$DB49]
    ld   e,a
    ld   a,[hl]
    cp   a,$A9
    jr   nz,$2066
    bit  0,e
    jr   z,$2066
    ld   a,$AF
    cp   a,$AF
    jr   nz,$2080
    bit  0,e
    jr   nz,$2080
    ld   a,[$FFCE]
    swap a
    and  a,$0F
    ld   e,a
    ld   a,[$FFCD]
    and  a,$F0
    or   e
    ld   [$D473],a
    jp   $20CF
    cp   a,$83
    jr   z,$208E
    cp   a,$2D
    jr   z,$2093
    call $2373
    jp   $20CF
    call $2385
    jr   $20CF
    call $237C
    jr   $20CF
    cp   a,$A0
    jr   nz,$20CF
    ld   a,[$C18E]
    and  a,$1F
    cp   a,$0D
    jr   z,$20CF
    ld   a,[$FF9E]
    cp   a,$02
    jr   nz,$20CF
    ld   [$C1AD],a
    ld   a,[$FFCC]
    and  a,$30
    jr   z,$20CF
    ld   a,[$FFF9]
    and  a
    jr   nz,$20BF
    ld   a,[$FF9E]
    cp   a,$02
    jr   nz,$20CF
    ld   a,$14
    ld   [$2100],a
    call $5900
    ld   a,$02
    ld   [$2100],a
    call $41D0
    ld   a,[$DB00]
    cp   a,$03
    jr   nz,$20DD
    ld   a,[$FFCB]
    and  a,$20
    jr   nz,$20EC
    ret  
    ld   a,[$DB01]
    cp   a,$03
    jp   nz,$2177
    ld   a,[$FFCB]
    and  a,$10
    jp   z,$2177
    ld   a,$02
    ld   [$2100],a
    call $48B0
    ld   a,$01
    ld   [$FFA1],a
    ld   a,[$FF9E]
    ld   e,a
    ld   d,$00
    ld   hl,$1F51
    add  hl,de
    ld   a,[hl]
    ld   [$FF9D],a
    ld   hl,$1F55
    add  hl,de
    ld   a,[$FFCB]
    and  [hl]
    jr   z,$214E
    ld   hl,$1F59
    add  hl,de
    ld   a,[hl]
    ld   [$C13C],a
    ld   hl,$1F5D
    add  hl,de
    ld   a,[hl]
    ld   [$C13B],a
    ld   hl,$FF9D
    inc  [hl]
    ld   e,$08
    ld   a,[$D47C]
    cp   a,$01
    jr   nz,$212C
    ld   e,$03
    ld   hl,$C15F
    inc  [hl]
    ld   a,[hl]
    cp   e
    jr   c,$214D
    xor  a
    ld   [$FFE5],a
    ld   a,[$FFD7]
    cp   a,$8E
    jr   z,$2153
    cp   a,$20
    jr   z,$2153
    ld   a,[$DBA5]
    and  a
    jr   nz,$214D
    ld   a,[$FFD7]
    cp   a,$5C
    jr   z,$2161
    ret  
    xor  a
    ld   [$C15F],a
    ret  
    call $2165
    ld   a,$14
    ld   [$2100],a
    call $50C3
    jp   $081D
    ld   a,$01
    ld   [$FFE5],a
    ld   a,[$FFD8]
    ld   e,a
    ld   a,[$FFD7]
    ld   [$FFAF],a
    call $2178
    ld   a,[$FF9E]
    ld   [$C15D],a
    jp   $2183
    ret  
    ld   a,$14
    ld   [$2100],a
    call $5526
    jp   $081D
    ld   a,$05
    call $142F
    jr   c,$21A7
    ld   a,$02
    ld   [$FFF3],a
    ld   hl,$C280
    add  hl,de
    ld   [hl],$07
    ld   hl,$C3B0
    add  hl,de
    ld   a,[$FFE5]
    ld   [hl],a
    ld   c,e
    ld   b,d
    ld   e,$01
    ld   a,$03
    call $080C
    jp   $5795
    ret  
    ld   a,[$C14F]
    and  a
    ret  nz
    ld   c,$01
    call $21B6
    ld   c,$00
    ld   [$FFD7],a
    ld   b,$00
    ld   hl,$FF9A
    add  hl,bc
    ld   a,[hl]
    push af
    swap a
    and  a,$F0
    ld   hl,$C11A
    add  hl,bc
    add  [hl]
    ld   [hl],a
    rl   d
    ld   hl,$FF98
    add  hl,bc
    pop  af
    ld   e,$00
    bit  7,a
    jr   z,$21D7
    ld   e,$F0
    swap a
    and  a,$0F
    or   e
    rr   d
    adc  [hl]
    ld   [hl],a
    ret  
    ld   a,[$FFA3]
    push af
    swap a
    and  a,$F0
    ld   hl,$C149
    add  [hl]
    ld   [hl],a
    rl   d
    ld   hl,$FFA2
    pop  af
    ld   e,$00
    bit  7,a
    jr   z,$21FB
    ld   e,$F0
    swap a
    and  a,$0F
    or   e
    rr   d
    adc  [hl]
    ld   [hl],a
    ret  
    <corrupted stop>
    ld   bc,$3E01
    ld   [$00EA],sp
    ld   hl,$34CD
    ldi  [hl],a
    jp   $081D
    ld   a,[$C127]
    and  a,$20
    jr   z,$221D
    inc  hl
    inc  hl
    ldi  a,[hl]
    ld   [bc],a
    inc  bc
    ld   a,[hl]
    ld   [bc],a
    inc  bc
    ret  
    ld   a,[$C127]
    and  a,$01
    jr   z,$222C
    inc  hl
    ldi  a,[hl]
    ld   [bc],a
    inc  hl
    inc  bc
    ld   a,[hl]
    ld   [bc],a
    inc  bc
    ret  
    ld   a,$20
    ld   [$2100],a
    call $4A76
    ld   a,$08
    ld   [$2100],a
    push bc
    push de
    ld   a,[$FFD9]
    ld   c,a
    ld   b,$00
    ld   hl,$D711
    add  hl,bc
    ld   b,$00
    ld   c,[hl]
    ld   a,[$FFFE]
    and  a
    jr   z,$2262
    ld   a,[$DBA5]
    and  a
    jr   nz,$2262
    ld   a,$02
    ld   [$FF70],a
    ld   c,[hl]
    xor  a
    ld   [$FF70],a
    sla  c
    rl   b
    sla  c
    rl   b
    ld   a,[$DBA5]
    and  a
    jr   z,$2286
    ld   hl,$4000
    ld   a,[$FFFE]
    and  a
    jr   z,$2299
    ld   hl,$43B0
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$2291
    ld   hl,$4760
    jr   $2291
    ld   hl,$6749
    ld   a,[$FFFE]
    and  a
    jr   z,$2299
    ld   hl,$6B1D
    ld   a,$1A
    ld   [$2100],a
    call $6576
    call $3905
    add  hl,bc
    pop  de
    pop  bc
    ld   a,[$C125]
    and  a,$02
    jr   z,$22D3
    call $2214
    ld   a,[$FFFE]
    and  a
    jr   z,$22D1
    push bc
    push de
    ld   a,$20
    ld   [$2100],a
    call $49D9
    ld   a,[$FFDF]
    ld   [$2100],a
    call $2214
    ld   a,b
    ld   [$FFE2],a
    ld   a,c
    ld   [$FFE3],a
    ld   a,d
    ld   [$FFE4],a
    ld   a,e
    ld   [$FFE5],a
    call $3905
    pop  de
    pop  bc
    jr   $22FE
    call $2224
    ld   a,[$FFFE]
    and  a
    jr   z,$22FE
    push bc
    push de
    ld   a,$20
    ld   [$2100],a
    call $49D9
    ld   a,[$FFDF]
    ld   [$2100],a
    call $2224
    ld   a,b
    ld   [$FFE2],a
    ld   a,c
    ld   [$FFE3],a
    ld   a,d
    ld   [$FFE4],a
    ld   a,e
    ld   [$FFE5],a
    call $3905
    pop  de
    pop  bc
    push bc
    ld   a,[$C125]
    ld   c,a
    ld   b,$00
    ld   hl,$2205
    add  hl,bc
    ld   a,[$FFD9]
    add  [hl]
    ld   [$FFD9],a
    pop  bc
    ld   a,[$C128]
    dec  a
    ld   [$C128],a
    jp   nz,$2241
    ld   a,$20
    ld   [$2100],a
    jp   $5570
    ld   a,[$C19F]
    and  a
    ret  z
    ld   e,a
    ld   a,[$DB95]
    cp   a,$01
    ld   a,$7E
    jr   nz,$2332
    ld   a,$7F
    ld   [$FFE8],a
    ld   a,[$C164]
    and  a
    ld   a,[$C170]
    jr   nz,$2341
    cp   a,$20
    jr   c,$2345
    and  a,$0F
    or   a,$10
    ld   [$C171],a
    ld   a,e
    and  a,$7F
    dec  a
    rst  $00
    ld   l,e
    inc  hl
    or   b
    inc  hl
    or   b
    inc  hl
    or   b
    inc  hl
    ld   a,l
    inc  h
    or   a
    inc  h
    call $2924
    dec  h
    sub  l
    ld   h,$14
    daa  
    ld   l,b
    daa  
    adc  d
    inc  h
    sub  e
    daa  
    xor  a
    inc  h
    or   c
    inc  hl
    ld   a,$14
    ld   [$2100],a
    jp   $5449
    call $2385
    ld   a,$01
    ld   [$C112],a
    ret  
    call $2385
    ld   a,$02
    ld   [$C112],a
    ret  
    push af
    xor  a
    ld   [$C177],a
    pop  af
    ld   [$C173],a
    xor  a
    ld   [$C16F],a
    ld   [$C170],a
    ld   [$C164],a
    ld   [$C108],a
    ld   [$C112],a
    ld   a,$0F
    ld   [$C5AB],a
    ld   a,[$FF99]
    cp   a,$48
    rra  
    and  a,$80
    or   a,$01
    ld   [$C19F],a
    ret  
    ret  
    xor  a
    ld   [$C19F],a
    ld   a,$18
    ld   [$C134],a
    ld   a,[$FFFE]
    and  a
    ret  z
    ld   a,[$DB95]
    cp   a,$0B
    ret  nz
    ld   a,[$C3CC]
    cp   a,$08
    ret  c
    ld   a,$21
    ld   [$2100],a
    jp   $53CF
    nop  
    inc  h
    ld   c,b
    nop  
    inc  h
    ld   c,b
    sbc  b
    sbc  b
    sbc  b
    sbc  c
    sbc  c
    sbc  c
    ld   hl,$A161
    ld   b,c
    add  c
    pop  bc
    ld   a,[$C19F]
    bit  7,a
    jr   z,$23EF
    and  a,$7F
    add  a,$03
    ld   e,a
    ld   d,$00
    ld   hl,$23D0
    add  hl,de
    ld   a,[hl]
    add  a,$00
    ld   c,a
    ld   a,$D5
    adc  a,$00
    ld   b,a
    ld   hl,$23DC
    add  hl,de
    ld   a,[$C12F]
    add  [hl]
    ld   l,a
    ld   [$FFD7],a
    ld   hl,$23D6
    add  hl,de
    ld   a,[$C12E]
    add  [hl]
    ld   h,a
    ld   a,[$FFD7]
    ld   l,a
    xor  a
    ld   e,a
    ld   d,a
    ld   a,[$FFFE]
    and  a
    jr   nz,$2444
    ldi  a,[hl]
    ld   [bc],a
    inc  bc
    ld   a,l
    and  a,$1F
    jr   nz,$242B
    ld   a,l
    dec  a
    and  a,$E0
    ld   l,a
    inc  e
    ld   a,e
    cp   a,$12
    jr   nz,$241E
    ld   e,$00
    ld   a,[$FFD7]
    add  a,$20
    ld   [$FFD7],a
    jr   nc,$243C
    inc  h
    ld   l,a
    inc  d
    ld   a,d
    cp   a,$02
    jr   nz,$241E
    ret  
    ld   a,[hl]
    ld   [bc],a
    ld   a,$01
    ld   [$FF4F],a
    ld   a,$02
    ld   [$FF70],a
    ld   a,[hl]
    ld   [bc],a
    xor  a
    ld   [$FF4F],a
    ld   [$FF70],a
    inc  bc
    ld   a,l
    add  a,$01
    and  a,$1F
    jr   nz,$2463
    ld   a,l
    and  a,$E0
    ld   l,a
    jr   $2464
    inc  l
    inc  e
    ld   a,e
    cp   a,$12
    jr   nz,$2444
    ld   e,$00
    ld   a,[$FFD7]
    add  a,$20
    ld   [$FFD7],a
    jr   nc,$2475
    inc  h
    ld   l,a
    inc  d
    ld   a,d
    cp   a,$02
    jr   nz,$2444
    ret  
    ld   a,$1C
    ld   [$2100],a
    jp   $4A2C
    ld   hl,$C19F
    inc  [hl]
    ret  
    ld   a,[$C1AB]
    and  a
    jr   nz,$24AE
    ld   a,[$FFCC]
    and  a,$30
    jr   z,$24AE
    xor  a
    ld   [$C16F],a
    ld   a,[$DB95]
    cp   a,$0D
    jr   nz,$24A4
    xor  a
    jr   $24AB
    ld   a,[$C19F]
    and  a,$F0
    or   a,$0E
    ld   [$C19F],a
    ret  
    ld   a,$1C
    ld   [$2100],a
    jp   $4AA8
    ld   a,$1C
    ld   [$2100],a
    ld   a,[$C172]
    and  a
    jr   z,$24C7
    dec  a
    ld   [$C172],a
    ret  
    call $49F1
    jp   $2485
    ld   a,$1C
    ld   [$2100],a
    ld   a,[$C19F]
    ld   c,a
    ld   a,[$C171]
    bit  7,c
    jr   z,$24DF
    add  a,$20
    ld   c,a
    ld   b,$00
    ld   e,$01
    ld   d,$00
    ld   a,[$C12E]
    ld   hl,$45C1
    add  hl,bc
    add  [hl]
    ld   hl,$D600
    add  hl,de
    ldi  [hl],a
    ld   [$C175],a
    push hl
    ld   hl,$4601
    add  hl,bc
    ld   a,[hl]
    and  a,$E0
    add  a,$20
    ld   e,a
    ld   a,[$C12F]
    add  [hl]
    ld   d,a
    cp   e
    jr   c,$250D
    ld   a,d
    sub  a,$20
    ld   d,a
    ld   a,d
    ld   [$C176],a
    pop  hl
    ldi  [hl],a
    xor  a
    ldi  [hl],a
    push hl
    ld   a,[$C170]
    and  a,$1F
    ld   c,a
    ld   hl,$45A1
    add  hl,bc
    ld   a,[hl]
    pop  hl
    ldi  [hl],a
    call $2485
    jp   $2529
    ld   a,$1C
    ld   [$2100],a
    ld   a,[$C170]
    and  a,$1F
    ld   c,a
    ld   b,$00
    ld   e,$05
    ld   d,$00
    ld   hl,$4581
    add  hl,bc
    ld   a,[hl]
    ld   hl,$D600
    add  hl,de
    ldi  [hl],a
    push hl
    ld   hl,$4561
    add  hl,bc
    ld   a,[hl]
    pop  hl
    ldi  [hl],a
    ld   a,$0F
    ldi  [hl],a
    push hl
    ld   a,[$C112]
    ld   d,a
    ld   a,[$C173]
    ld   e,a
    sla  e
    rl   d
    ld   hl,$4001
    add  hl,de
    ldi  a,[hl]
    ld   e,a
    ld   d,[hl]
    push de
    ld   a,[$C173]
    ld   e,a
    ld   a,[$C112]
    ld   d,a
    ld   hl,$4741
    add  hl,de
    ld   a,[hl]
    and  a,$3F
    ld   [$2100],a
    pop  hl
    ld   a,[$C170]
    ld   e,a
    ld   a,[$C164]
    ld   d,a
    add  hl,de
    ldi  a,[hl]
    ld   e,a
    ld   a,[hl]
    ld   [$C3C3],a
    call $081D
    ld   a,e
    ld   [$FFD7],a
    cp   a,$FE
    jr   nz,$25A4
    pop  hl
    xor  a
    ld   [$D601],a
    ld   a,[$C19F]
    and  a,$F0
    or   a,$0D
    ld   [$C19F],a
    ld   a,$15
    ld   [$FFF2],a
    ret  
    cp   a,$FF
    jr   nz,$25BD
    pop  hl
    xor  a
    ld   [$D601],a
    ld   a,[$C19F]
    and  a,$F0
    or   a,$0C
    ld   [$C19F],a
    ret  
    ld   d,l
    ld   c,c
    ld   c,d
    ld   b,[hl]
    ld   b,a
    cp   a,$20
    jr   z,$25E0
    push af
    ld   a,[$C5AB]
    ld   d,a
    ld   e,$01
    cp   a,$0F
    jr   z,$25D4
    ld   e,$07
    cp   a,$19
    jr   z,$25D4
    ld   e,$03
    ld   a,[$C170]
    add  a,$04
    and  e
    jr   nz,$25DF
    ld   a,d
    ld   [$FFF3],a
    pop  af
    ld   d,$00
    cp   a,$23
    jr   nz,$2608
    ld   a,[$C108]
    ld   e,a
    inc  a
    cp   a,$05
    jr   nz,$25F0
    xor  a
    ld   [$C108],a
    ld   hl,$DB4F
    ld   a,[$DB6E]
    and  a
    jr   z,$25FF
    ld   hl,$25B8
    add  hl,de
    ld   a,[hl]
    dec  a
    cp   a,$FF
    jr   nz,$2608
    ld   a,$20
    ld   [$FFD8],a
    ld   e,a
    ld   a,$1C
    ld   [$2100],a
    ld   hl,$4641
    add  hl,de
    ld   e,[hl]
    ld   d,$00
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    call $081D
    ld   hl,$5000
    add  hl,de
    ld   c,l
    ld   b,h
    pop  hl
    ld   e,$10
    ld   a,[bc]
    ldi  [hl],a
    inc  bc
    dec  e
    jr   nz,$2633
    ld   [hl],$00
    push hl
    ld   a,$1C
    ld   [$2100],a
    ld   a,[$FFD8]
    ld   e,a
    ld   d,$00
    xor  a
    pop  hl
    and  a
    jr   z,$2663
    ld   e,a
    ld   a,[$C175]
    ldi  [hl],a
    ld   a,[$C176]
    sub  a,$20
    ldi  [hl],a
    ld   a,$00
    ldi  [hl],a
    ld   a,$C9
    rr   e
    jr   c,$2660
    dec  a
    ldi  [hl],a
    ld   [hl],$00
    ld   a,[$C170]
    add  a,$01
    ld   [$C170],a
    ld   a,[$C164]
    adc  a,$00
    ld   [$C164],a
    xor  a
    ld   [$C1CC],a
    ld   a,[$C171]
    cp   a,$1F
    jr   z,$268E
    ld   a,[$C19F]
    and  a,$F0
    or   a,$06
    ld   [$C19F],a
    ld   a,$00
    ld   [$C172],a
    ret  
    jp   $2485
    ldi  [hl],a
    ld   b,d
    sbc  b
    sbc  c
    ld   a,[$C170]
    and  a,$1F
    jr   nz,$26E1
    ld   a,[$C3C3]
    cp   a,$FF
    jp   z,$25AD
    cp   a,$FE
    jp   z,$2595
    ld   a,[$C1CC]
    and  a
    jr   nz,$26B6
    inc  a
    ld   [$C1CC],a
    call $259F
    call $27BB
    ld   a,[$FFCC]
    bit  4,a
    jr   nz,$26E1
    bit  5,a
    jr   z,$2714
    ld   a,$1C
    ld   [$2100],a
    ld   a,[$DB95]
    cp   a,$07
    jp   z,$278B
    ld   a,[$C173]
    ld   e,a
    ld   a,[$C112]
    ld   d,a
    ld   hl,$4741
    add  hl,de
    ld   a,[hl]
    and  a
    jp   z,$278B
    ld   e,$00
    ld   a,[$C19F]
    and  a,$80
    jr   z,$26EB
    inc  e
    ld   d,$00
    ld   hl,$2693
    add  hl,de
    ld   a,[$C12E]
    add  [hl]
    ld   [$D601],a
    ld   hl,$2691
    add  hl,de
    ld   a,[$C12F]
    add  [hl]
    ld   [$D602],a
    ld   a,$4F
    ld   [$D603],a
    ld   a,[$FFE8]
    ld   [$D604],a
    xor  a
    ld   [$D605],a
    call $2485
    ret  
    ld   h,d
    add  d
    sbc  b
    sbc  c
    ld   e,$00
    ld   a,[$C19F]
    and  a,$80
    jr   z,$2723
    inc  e
    ld   d,$00
    ld   hl,$2717
    add  hl,de
    ld   a,[$C12E]
    add  [hl]
    ld   b,a
    ld   hl,$2715
    add  hl,de
    ld   a,[$C12F]
    add  [hl]
    ld   c,a
    ld   e,$10
    ld   a,c
    sub  a,$20
    ld   l,a
    ld   h,b
    ld   a,[bc]
    ld   [hl],a
    push bc
    ld   a,c
    add  a,$20
    ld   c,a
    ld   a,l
    add  a,$20
    ld   l,a
    ld   a,[bc]
    ld   [hl],a
    ld   a,l
    add  a,$20
    ld   l,a
    ld   a,[$FFE8]
    ld   [hl],a
    pop  bc
    inc  bc
    ld   a,c
    and  a,$1F
    jr   nz,$275D
    ld   a,c
    sub  a,$20
    ld   c,a
    dec  e
    jr   nz,$2739
    ld   a,$08
    ld   [$C172],a
    jp   $2485
    ret  
    ld   b,d
    ld   h,d
    sbc  b
    sbc  c
    ld   e,$00
    ld   a,[$C19F]
    and  a,$80
    jr   z,$2777
    inc  e
    ld   d,$00
    ld   hl,$276B
    add  hl,de
    ld   a,[$C12E]
    add  [hl]
    ld   b,a
    ld   hl,$2769
    call $2731
    jp   $267E
    ld   a,$02
    ld   [$C177],a
    jp   $2496
    ld   a,[$FFCC]
    bit  4,a
    jp   nz,$27B7
    and  a,$03
    jr   z,$27AA
    ld   hl,$C177
    ld   a,[hl]
    inc  a
    and  a,$01
    ld   [hl],a
    ld   a,$0A
    ld   [$FFF2],a
    ld   a,[$FFE7]
    and  a,$10
    ret  z
    ld   a,$17
    ld   [$2100],a
    jp   $7DCC
    call $2496
    ret  
    ld   a,$17
    ld   [$2100],a
    jp   $7D7C
    ld   [$D368],a
    ld   [$FFBF],a
    ld   a,$38
    ld   [$FFAB],a
    xor  a
    ld   [$FFA8],a
    ret  
    push hl
    ld   hl,$4000
    ld   [hl],$00
    ld   hl,$0000
    ld   [hl],$0A
    pop  hl
    ret  
    ld   a,$02
    ld   [$2100],a
    push bc
    call $4146
    pop  bc
    jp   $081D
    ld   a,$38
    ld   [$FFA8],a
    xor  a
    ld   [$FFAB],a
    ret  
    ld   a,[$FFBC]
    and  a
    jr   nz,$27FF
    ld   a,$1F
    ld   [$2100],a
    call $4003
    jp   $081D
    ld   a,$01
    ld   [$2100],a
    call $5E67
    jp   $081D
    push hl
    ld   a,[$FFE7]
    ld   hl,$C13D
    add  [hl]
    ld   hl,$FF44
    add  [hl]
    rrca 
    ld   [$C13D],a
    pop  hl
    ret  
    ld   a,[$C124]
    and  a
    jr   nz,$2886
    ld   a,[$DB95]
    cp   a,$0B
    jr   nz,$2852
    ld   a,[$DB96]
    cp   a,$07
    jr   nz,$284C
    ld   a,[$C11C]
    cp   a,$07
    jr   nz,$283F
    ld   a,[$FF9C]
    cp   a,$04
    jr   z,$2852
    ld   a,[$C16B]
    cp   a,$04
    jr   nz,$284C
    ld   a,[$DDD5]
    and  a
    jr   z,$2852
    xor  a
    ld   [$FFCB],a
    ld   [$FFCC],a
    ret  
    ld   a,$20
    ld   [$FF00],a
    ld   a,[$FF00]
    ld   a,[$FF00]
    cpl  
    and  a,$0F
    ld   b,a
    ld   a,$10
    ld   [$FF00],a
    ld   a,[$FF00]
    ld   a,[$FF00]
    ld   a,[$FF00]
    ld   a,[$FF00]
    ld   a,[$FF00]
    ld   a,[$FF00]
    ld   a,[$FF00]
    ld   a,[$FF00]
    swap a
    cpl  
    and  a,$F0
    or   b
    ld   c,a
    ld   a,[$FFCB]
    xor  c
    and  c
    ld   [$FFCC],a
    ld   a,c
    ld   [$FFCB],a
    ld   a,$30
    ld   [$FF00],a
    ret  
    push bc
    ld   a,[$FFCD]
    ld   hl,$FF97
    add  [hl]
    and  a,$F8
    srl  a
    srl  a
    srl  a
    ld   de,$0000
    ld   e,a
    ld   hl,$9800
    ld   b,$20
    add  hl,de
    dec  b
    jr   nz,$289F
    push hl
    ld   a,[$FFCE]
    ld   hl,$FF96
    add  [hl]
    pop  hl
    and  a,$F8
    srl  a
    srl  a
    srl  a
    ld   de,$0000
    ld   e,a
    add  hl,de
    ld   a,h
    ld   [$FFCF],a
    ld   a,l
    ld   [$FFD0],a
    pop  bc
    ret  
    ld   e,a
    ld   d,$00
    sla  e
    rl   d
    pop  hl
    add  hl,de
    ld   e,[hl]
    inc  hl
    ld   d,[hl]
    ld   l,e
    ld   h,d
    jp   [hl]
    ld   a,[$FFFF]
    ld   [$FFD2],a
    res  0,a
    ld   [$FFFF],a
    ld   a,[$FF44]
    cp   a,$91
    jr   nz,$28D7
    ld   a,[$FF40]
    and  a,$7F
    ld   [$FF40],a
    ld   a,[$FFD2]
    ld   [$FFFF],a
    ret  
    ld   a,$01
    call $080C
    jp   $6CE3
    ld   a,$7E
    ld   bc,$0400
    jr   $28FC
    ld   a,$7F
    ld   bc,$0800
    ld   d,a
    ld   hl,$9800
    ld   a,d
    ldi  [hl],a
    dec  bc
    ld   a,b
    or   c
    jr   nz,$2900
    ret  
    ld   [$2100],a
    call $2914
    ld   a,$01
    ld   [$2100],a
    ret  
    ldi  a,[hl]
    ld   [de],a
    inc  de
    dec  bc
    ld   a,b
    or   c
    jr   nz,$2914
    ret  
    inc  de
    ld   h,a
    ld   a,[de]
    ld   l,a
    inc  de
    ld   a,[de]
    inc  de
    call $2941
    ld   a,[$C124]
    and  a
    jr   nz,$293C
    ld   a,[de]
    and  a
    jr   nz,$291D
    ret  
    inc  de
    ld   h,a
    ld   a,[de]
    ld   l,a
    inc  de
    ld   a,[de]
    inc  de
    call $2991
    ld   a,[de]
    and  a
    jr   nz,$2932
    ret  
    push af
    and  a,$3F
    ld   b,a
    inc  b
    pop  af
    rlca 
    rlca 
    and  a,$03
    jr   z,$2955
    dec  a
    jr   z,$2966
    dec  a
    jr   z,$2977
    jr   $2984
    ld   a,[de]
    ldi  [hl],a
    ld   a,l
    and  a,$1F
    jr   nz,$2961
    dec  hl
    ld   a,l
    and  a,$E0
    ld   l,a
    inc  de
    dec  b
    jr   nz,$2955
    ret  
    ld   a,[de]
    ldi  [hl],a
    ld   a,l
    and  a,$1F
    jr   nz,$2972
    dec  hl
    ld   a,l
    and  a,$E0
    ld   l,a
    dec  b
    jr   nz,$2966
    inc  de
    ret  
    ld   a,[de]
    ld   [hl],a
    inc  de
    ld   a,b
    ld   bc,$0020
    add  hl,bc
    ld   b,a
    dec  b
    jr   nz,$2977
    ret  
    ld   a,[de]
    ld   [hl],a
    ld   a,b
    ld   bc,$0020
    add  hl,bc
    ld   b,a
    dec  b
    jr   nz,$2984
    inc  de
    ret  
    push af
    and  a,$3F
    ld   b,a
    inc  b
    pop  af
    and  a,$80
    jr   nz,$29B0
    ld   a,[de]
    cp   a,$EE
    jr   z,$29AB
    ldi  [hl],a
    ld   a,l
    and  a,$1F
    jr   nz,$29AB
    dec  hl
    ld   a,l
    and  a,$E0
    ld   l,a
    inc  de
    dec  b
    jr   nz,$299B
    ret  
    ld   a,[de]
    cp   a,$EE
    jr   z,$29B6
    ld   [hl],a
    inc  de
    ld   a,b
    ld   bc,$0020
    add  hl,bc
    ld   b,a
    dec  b
    jr   nz,$29B0
    ret  
    ld   bc,$1600
    jr   $29DC
    ld   bc,$1300
    jr   $29DC
    ld   bc,$002F
    jr   $29D3
    ld   bc,$006D
    ld   hl,$FF90
    call $29DF
    ld   bc,$1F00
    ld   hl,$C000
    ld   a,[$FFFE]
    push af
    xor  a
    ldi  [hl],a
    dec  bc
    ld   a,b
    or   c
    jr   nz,$29E2
    pop  af
    ld   [$FFFE],a
    ret  
    ld   a,$14
    ld   [$2100],a
    call $5884
    jp   $081D
    ld   a,$20
    ld   [$2100],a
    call $4C98
    ld   a,[$DBAF]
    ld   [$2100],a
    ret  
    ld   a,$01
    ld   [$2100],a
    call $5A59
    jp   $081D
    ld   a,$08
    ld   [$2100],a
    ld   hl,$4AD4
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$2A23
    ld   hl,$4BD4
    add  hl,de
    ld   a,[hl]
    ret  
    call $2A12
    jp   $081D
    call $2A12
    push af
    ld   a,$03
    ld   [$2100],a
    pop  af
    ret  
    ld   a,$13
    call $0B0B
    ld   [$2100],a
    ld   hl,$6800
    ld   de,$9000
    ld   bc,$0800
    call $2914
    ld   hl,$7000
    ld   de,$8800
    ld   bc,$0800
    jp   $2914
    call $2A66
    ld   de,$8400
    ld   hl,$7600
    ld   bc,$0100
    jp   $2914
    ld   a,$13
    call $0B0B
    ld   [$2100],a
    ld   hl,$4000
    ld   de,$8000
    ld   bc,$1800
    call $2914
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ld   hl,$57E0
    ld   de,$97F0
    ld   bc,$0010
    call $2914
    ld   a,$12
    call $0B0B
    ld   [$2100],a
    ld   hl,$7500
    ld   de,$8000
    ld   bc,$0040
    call $2914
    ld   de,$8D00
    ld   hl,$7500
    ld   bc,$0200
    jp   $2914
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ld   hl,$5000
    ld   de,$9000
    ld   bc,$0800
    call $2914
    ld   a,$12
    call $0B0B
    ld   [$2100],a
    ld   hl,$6000
    ld   de,$8000
    ld   bc,$0800
    call $2914
    ld   a,$0F
    call $0B0B
    ld   [$2100],a
    ld   hl,$6000
    ld   de,$8800
    ld   bc,$0800
    jp   $2914
    ld   hl,$4000
    ld   a,[$FFFE]
    and  a
    jr   z,$2B01
    ld   hl,$6800
    ld   a,$35
    jr   $2B06
    ld   hl,$4800
    jr   $2B01
    ld   hl,$6000
    ld   a,$13
    call $0B0B
    ld   [$2100],a
    ld   de,$8000
    ld   bc,$0800
    call $2914
    ld   a,$13
    call $0B0B
    ld   [$2100],a
    ld   hl,$5800
    ld   de,$8800
    ld   bc,$1000
    jp   $2914
    call $08A4
    ld   hl,$6800
    ld   a,$10
    call $2B92
    call $08A4
    ld   a,$12
    call $0B0B
    ld   [$2100],a
    ld   hl,$6600
    ld   de,$8000
    ld   bc,$0080
    call $2914
    call $08A4
    ld   a,[$FFFE]
    and  a
    jr   nz,$2B61
    ld   a,$10
    ld   [$2100],a
    ld   hl,$6900
    ld   de,$8100
    ld   bc,$0700
    jp   $2914
    ld   a,$38
    ld   [$2100],a
    ld   hl,$5000
    ld   de,$8000
    ld   bc,$0800
    jp   $2914
    ld   hl,$7800
    ld   a,[$FFFE]
    and  a
    jr   z,$2B90
    ld   hl,$7800
    ld   a,$35
    jr   $2B95
    ld   hl,$4800
    ld   a,[$FFFE]
    and  a
    jr   z,$2B90
    ld   hl,$7000
    ld   a,$35
    jr   $2B95
    ld   a,$13
    call $0B0B
    ld   [$2100],a
    ld   de,$8000
    ld   bc,$0800
    call $2914
    ld   a,$13
    call $0B0B
    ld   [$2100],a
    ld   hl,$7000
    ld   de,$8800
    ld   bc,$0800
    call $2914
    ld   hl,$6800
    ld   de,$9000
    ld   bc,$0800
    jp   $2914
    push bc
    ld   a,$14
    ld   [$2100],a
    call $5838
    call $081D
    pop  bc
    ret  
    ld   a,$0C
    call $0813
    ld   hl,$4000
    ld   de,$8000
    ld   bc,$0400
    call $2914
    ld   a,$0C
    call $0813
    ld   hl,$4800
    ld   de,$8800
    ld   bc,$1000
    call $2914
    ld   hl,$47A0
    ld   de,$8E00
    ld   bc,$0020
    call $2914
    ld   a,$01
    call $080C
    ret  
    call $2BCF
    ld   a,$0F
    call $0813
    ld   hl,$4000
    ld   de,$8800
    ld   bc,$0400
    call $2914
    ld   a,$0F
    call $0813
    ld   hl,$5000
    ld   de,$9000
    ld   bc,$0800
    jp   $2914
    ld   a,$20
    call $080C
    ld   hl,$4589
    ld   a,[$FFF7]
    ld   e,a
    ld   d,$00
    cp   a,$FF
    jr   nz,$2C53
    ld   a,$35
    ld   [$2100],a
    ld   hl,$6200
    ld   de,$9000
    ld   bc,$0100
    call $2914
    ld   e,$00
    ld   d,e
    ld   hl,$6000
    push de
    jr   $2C5D
    push de
    add  hl,de
    ld   h,[hl]
    ld   l,$00
    ld   a,$0D
    call $0813
    ld   de,$9100
    ld   bc,$0100
    call $2914
    ld   a,$0D
    call $0813
    ld   hl,$4000
    ld   de,$9200
    ld   bc,$0600
    call $2914
    ld   a,$20
    ld   [$2100],a
    pop  de
    push de
    ld   hl,$45A9
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$2C8A
    ld   hl,$45C9
    add  hl,de
    ld   h,[hl]
    ld   l,$00
    call $081D
    ld   de,$9200
    ld   bc,$0200
    call $2914
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ld   hl,$47C0
    ld   de,$DCC0
    ld   bc,$0040
    call $2914
    call $2D50
    ld   a,$20
    ld   [$2100],a
    pop  de
    ld   hl,$45CA
    add  hl,de
    ld   h,[hl]
    ld   l,$00
    ld   a,$12
    call $0813
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$2CD1
    ld   hl,$6100
    ld   a,$35
    ld   [$2100],a
    ld   de,$8F00
    ld   bc,$0100
    call $2914
    ld   a,[$DBAF]
    ld   [$2100],a
    ld   hl,$7D00
    ld   a,[$FFF7]
    cp   a,$FF
    jr   z,$2CF5
    cp   a,$0A
    jr   c,$2CF5
    ld   a,$0C
    call $0813
    ld   hl,$4C00
    ld   de,$8C00
    ld   bc,$0300
    call $2914
    ld   a,[$DB4B]
    and  a
    jr   z,$2D07
    call $1E2B
    ld   a,[$DBA5]
    and  a
    jr   z,$2D17
    ld   a,[$FFF7]
    cp   a,$FF
    jr   z,$2D21
    cp   a,$0A
    jr   c,$2D21
    ld   a,[$DB15]
    cp   a,$06
    jr   c,$2D21
    call $1EA1
    ld   a,[$DB0E]
    cp   a,$02
    jr   c,$2D2C
    ld   a,$0D
    ld   [$FFA5],a
    ret  
    ld   a,$0C
    call $0813
    ld   hl,$5200
    ld   de,$9200
    ld   bc,$0600
    call $2914
    ld   hl,$4C00
    ld   de,$8C00
    ld   bc,$0400
    call $2914
    call $2D50
    jp   $2CFE
    xor  a
    ld   [$FFA6],a
    ld   [$FFA7],a
    call $1BD2
    ld   a,$0C
    call $0B0B
    ld   [$2100],a
    ld   hl,$4800
    ld   de,$8800
    ld   bc,$0800
    call $2914
    ld   hl,$4200
    ld   de,$8200
    ld   bc,$0100
    call $2914
    ret  
    ld   a,$01
    call $080C
    ld   hl,$6D4A
    ld   de,$8700
    ld   bc,$0080
    call $2914
    ld   a,$10
    call $0813
    ld   hl,$5400
    ld   de,$8000
    ld   bc,$0600
    call $2914
    ld   hl,$4000
    ld   de,$8800
    ld   bc,$1000
    jp   $2914
    ld   a,$0F
    call $0813
    ld   hl,$4900
    ld   de,$8800
    ld   bc,$0700
    call $2914
    ld   a,$38
    call $080C
    ld   a,[$FFFE]
    and  a
    jr   nz,$2DC7
    ld   hl,$5C00
    jr   $2DCA
    ld   hl,$5800
    ld   de,$8400
    ld   bc,$0400
    call $2914
    ld   a,[$FFFE]
    and  a
    jr   nz,$2DDD
    ld   hl,$6600
    jr   $2DE0
    ld   hl,$6500
    ld   de,$8200
    ld   bc,$0100
    jp   $2914
    ld   a,$0C
    call $0813
    ld   hl,$7800
    ld   de,$8F00
    ld   bc,$0800
    call $2914
    ld   hl,$5000
    ld   de,$8200
    ld   bc,$0100
    jp   $2914
    ld   hl,$7000
    jr   $2E13
    ld   hl,$7800
    jr   $2E13
    ld   hl,$5800
    ld   a,$10
    call $0813
    ld   de,$9000
    ld   bc,$0800
    jp   $2914
    ld   a,$13
    call $0B0B
    ld   [$2100],a
    ld   hl,$7C00
    ld   de,$8C00
    ld   bc,$0400
    call $2914
    ld   hl,$6800
    ld   de,$9000
    ld   bc,$0400
    jp   $2914
    ld   a,$10
    call $0813
    ld   hl,$6700
    ld   de,$8400
    ld   bc,$0400
    call $2914
    ld   hl,$6000
    ld   de,$9000
    ld   bc,$0600
    jp   $2914
    ld   a,$0F
    call $080C
    ld   hl,$4400
    ld   de,$8800
    ld   bc,$0500
    jp   $2914
    nop  
    ld   de,$120E
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$2E84
    ld   a,$20
    ld   [$2100],a
    call $475A
    jp   $2F12
    xor  a
    ld   [$FFD7],a
    ld   hl,$C193
    ld   e,a
    ld   d,$00
    add  hl,de
    and  a
    jr   nz,$2ED3
    ld   a,[$DBA5]
    and  a
    jr   z,$2EB0
    ld   a,[$FFF9]
    and  a
    jr   nz,$2ED3
    ld   a,[$FFF7]
    cp   a,$14
    jr   z,$2ED3
    cp   a,$0A
    jr   c,$2ED3
    ld   a,[$FFF6]
    cp   a,$FD
    jr   z,$2ED3
    cp   a,$B1
    jr   z,$2ED3
    ld   a,[$DB56]
    cp   a,$01
    ld   a,$A4
    jr   z,$2ED1
    ld   a,[$DB79]
    and  a
    ld   a,$D8
    jr   nz,$2ED1
    ld   a,[$DB7B]
    and  a
    ld   a,$DD
    jr   nz,$2ED1
    ld   a,[$DB73]
    and  a
    jr   z,$2ED3
    ld   a,$8F
    jr   $2ED4
    ld   a,[hl]
    and  a
    jr   z,$2F0A
    push af
    and  a,$3F
    ld   b,a
    ld   c,$00
    pop  af
    swap a
    rra  
    rra  
    and  a,$03
    ld   e,a
    ld   d,$00
    ld   hl,$2E6F
    add  hl,de
    ld   a,[hl]
    and  a
    jr   z,$2EF2
    call $0B0B
    ld   [$2100],a
    ld   a,[$FFD7]
    ld   d,a
    ld   e,$00
    ld   hl,$8400
    add  hl,de
    ld   e,l
    ld   d,h
    ld   hl,$4000
    add  hl,bc
    ld   bc,$0100
    call $2914
    ld   a,[$FFD7]
    inc  a
    cp   a,$04
    jp   nz,$2E85
    ld   de,$9000
    ld   a,[$DBA5]
    and  a
    jp   z,$2FAD
    ld   a,$0D
    call $0B0B
    ld   [$2100],a
    ld   a,[$FFF9]
    and  a
    jr   z,$2F4B
    ld   hl,$7000
    ld   a,[$FFF7]
    cp   a,$06
    jr   z,$2F41
    cp   a,$0A
    jr   nc,$2F3B
    ld   hl,$7800
    jr   $2F41
    ld   a,[$FFF6]
    cp   a,$E9
    jr   z,$2F36
    ld   de,$9000
    ld   bc,$0800
    call $2914
    ret  
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$2F57
    ld   a,[$FFF6]
    cp   a,$12
    jr   nz,$2F69
    ld   hl,$5000
    ld   a,[$FF94]
    cp   a,$FF
    jr   z,$2F69
    add  a,$50
    ld   h,a
    ld   bc,$0100
    call $2914
    ld   a,[$FFF7]
    cp   a,$10
    jr   nz,$2F87
    ld   a,[$FFF6]
    cp   a,$B5
    jr   nz,$2F87
    ld   a,$35
    ld   [$2100],a
    ld   hl,$6600
    ld   de,$8F00
    ld   bc,$0200
    call $2914
    ret  
    ld   a,[$FFFE]
    and  a
    ret  z
    ld   a,[$FFF7]
    and  a
    ret  nz
    ld   a,$35
    ld   [$2100],a
    ld   hl,$6E00
    ld   de,$9690
    ld   bc,$0010
    call $2914
    ld   hl,$6E10
    ld   de,$9790
    ld   bc,$0010
    call $2914
    ret  
    ld   a,$0F
    call $0B0B
    ld   [$2100],a
    ld   a,[$FF94]
    cp   a,$0F
    jr   z,$2FC6
    add  a,$40
    ld   h,a
    ld   l,$00
    ld   bc,$0200
    call $2914
    ret  
    ldi  a,[hl]
    ld   [de],a
    inc  de
    ldi  a,[hl]
    ld   [de],a
    ret  
    ld   a,[hl]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl,$6749
    ld   a,[$FFF7]
    cp   a,$FF
    jr   z,$2FEC
    cp   a,$10
    jr   nz,$2FF1
    ld   a,[$FFF6]
    cp   a,$B5
    jr   nz,$2FF1
    ld   hl,$4760
    jr   $2FFA
    ld   a,[$DBA5]
    and  a
    jr   z,$2FFA
    ld   hl,$4000
    add  hl,bc
    ldi  a,[hl]
    ld   [de],a
    inc  de
    ldi  a,[hl]
    ld   [de],a
    ld   a,e
    add  a,$1F
    ld   e,a
    ld   a,d
    adc  a,$00
    ld   d,a
    ldi  a,[hl]
    ld   [de],a
    inc  de
    ld   a,[hl]
    ld   [de],a
    ret  
    ld   a,$02
    ld   [$FF70],a
    ld   c,[hl]
    xor  a
    ld   [$FF70],a
    jr   $3019
    ld   c,[hl]
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   a,$1A
    ld   [$2100],a
    call $6576
    call $3905
    ld   a,[$DBA5]
    and  a
    jr   z,$304C
    ld   hl,$43B0
    ld   a,[$FFF7]
    cp   a,$FF
    jr   z,$3047
    cp   a,$10
    jr   nz,$304F
    ld   a,[$FFF6]
    cp   a,$B5
    jr   nz,$304F
    ld   hl,$4760
    jr   $304F
    ld   hl,$6B1D
    push de
    add  hl,bc
    call $2FC7
    pop  de
    push hl
    ld   a,[$FFDF]
    ld   [$2100],a
    ld   a,[$FFE0]
    ld   h,a
    ld   a,[$FFE1]
    ld   l,a
    ld   a,$01
    ld   [$FF4F],a
    call $2FC7
    xor  a
    ld   [$FF4F],a
    call $3905
    ld   a,h
    ld   [$FFE0],a
    ld   a,l
    ld   [$FFE1],a
    pop  hl
    ld   a,e
    add  a,$1F
    ld   e,a
    ld   a,d
    adc  a,$00
    ld   d,a
    push de
    call $2FC7
    pop  de
    ld   a,[$FFDF]
    ld   [$2100],a
    ld   a,[$FFE0]
    ld   h,a
    ld   a,[$FFE1]
    ld   l,a
    ld   a,$01
    ld   [$FF4F],a
    call $2FC7
    xor  a
    ld   [$FF4F],a
    call $3905
    ret  
    call $3905
    call $080C
    ld   de,$9800
    ld   hl,$D711
    ld   c,$80
    push de
    push hl
    push bc
    ld   a,[$FFFE]
    and  a
    jr   nz,$30B6
    call $2FCD
    jr   $30C4
    ld   a,[$DBA5]
    and  a
    jr   z,$30C1
    call $3018
    jr   $30C4
    call $300E
    pop  bc
    pop  hl
    pop  de
    inc  hl
    ld   a,l
    and  a,$0F
    cp   a,$0B
    jr   nz,$30D5
    ld   a,l
    and  a,$F0
    add  a,$11
    ld   l,a
    ld   a,e
    add  a,$02
    ld   e,a
    and  a,$1F
    cp   a,$14
    jr   nz,$30E9
    ld   a,e
    and  a,$E0
    add  a,$40
    ld   e,a
    ld   a,d
    adc  a,$00
    ld   d,a
    dec  c
    jr   nz,$30A9
    ld   a,$01
    ld   [$2100],a
    jp   $6DEA
    ld   a,$01
    ld   [$FFFF],a
    ld   hl,$D47F
    inc  [hl]
    ld   a,$20
    ld   [$2100],a
    call $4CA3
    ld   a,[$FFFE]
    and  a
    jr   z,$3119
    ld   a,$21
    ld   [$2100],a
    call $40B3
    ld   a,$20
    ld   [$2100],a
    call $6DAF
    ld   a,$09
    ld   [$2100],a
    ld   a,[$DBA5]
    and  a
    jr   z,$313A
    ld   a,$14
    ld   [$2100],a
    ld   [$FFE8],a
    call $5897
    ld   e,a
    ld   hl,$DBB5
    xor  a
    ldi  [hl],a
    inc  e
    ld   a,e
    cp   a,$11
    jr   nz,$3132
    ld   a,[$FFF6]
    ld   e,a
    ld   d,$00
    ld   hl,$D800
    ld   a,[$DBA5]
    and  a
    jr   z,$3161
    ld   hl,$D900
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$3156
    ld   hl,$DDE0
    jr   $3161
    cp   a,$1A
    jr   nc,$3161
    cp   a,$06
    jr   c,$3161
    ld   hl,$DA00
    add  hl,de
    ld   a,[$FFF9]
    and  a
    ld   a,[hl]
    jr   nz,$316B
    or   a,$80
    ld   [hl],a
    ld   [$FFF8],a
    ld   a,[$FFF6]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    ld   a,[$DBA5]
    and  a
    jr   z,$31BF
    ld   a,$0A
    ld   [$2100],a
    ld   [$FFE8],a
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$318F
    ld   hl,$7B77
    jp   $3224
    cp   a,$1F
    jr   nz,$31A6
    ld   a,[$FFF6]
    cp   a,$F5
    jr   nz,$31A6
    ld   a,[$DB0E]
    cp   a,$0E
    jr   nz,$31A6
    ld   bc,$7855
    jp   $323A
    ld   hl,$4000
    ld   a,[$FFF7]
    cp   a,$1A
    jr   nc,$3224
    cp   a,$06
    jr   c,$3224
    ld   a,$0B
    ld   [$2100],a
    ld   [$FFE8],a
    ld   hl,$4000
    jr   $3224
    ld   a,[$FFF6]
    cp   a,$0E
    jr   nz,$31D1
    ld   a,[$D80E]
    and  a,$10
    jr   z,$3221
    ld   bc,$47EC
    jr   $322F
    cp   a,$8C
    jr   nz,$31E1
    ld   a,[$D88C]
    and  a,$10
    jr   z,$3221
    ld   bc,$434E
    jr   $322F
    cp   a,$79
    jr   nz,$31F1
    ld   a,[$D879]
    and  a,$10
    jr   z,$3221
    ld   bc,$6513
    jr   $322F
    cp   a,$06
    jr   nz,$3201
    ld   a,[$D806]
    and  a,$10
    jr   z,$3221
    ld   bc,$4496
    jr   $322F
    cp   a,$1B
    jr   nz,$3211
    ld   a,[$D82B]
    and  a,$10
    jr   z,$3221
    ld   bc,$4C0F
    jr   $322F
    cp   a,$2B
    jr   nz,$3221
    ld   a,[$D82B]
    and  a,$10
    jr   z,$3221
    ld   bc,$509A
    jr   $322F
    ld   hl,$4000
    add  hl,bc
    ldi  a,[hl]
    ld   c,a
    ld   a,[hl]
    ld   b,a
    ld   a,[$DBA5]
    and  a
    jr   nz,$323A
    ld   a,[$FFF6]
    cp   a,$80
    jr   c,$323A
    ld   a,$1A
    ld   [$2100],a
    ld   a,[bc]
    cp   a,$FE
    jr   z,$328E
    ld   [$FFA4],a
    inc  bc
    ld   a,[$DBA5]
    and  a
    jr   z,$3258
    ld   a,[bc]
    and  a,$0F
    call $37E7
    ld   a,[bc]
    swap a
    and  a,$0F
    call $38EA
    jr   $325C
    ld   a,[bc]
    call $37E7
    inc  bc
    ld   a,[bc]
    and  a,$FC
    cp   a,$E0
    jr   nz,$3284
    ld   a,[$FFE6]
    ld   e,a
    ld   d,$00
    ld   hl,$D401
    add  hl,de
    ld   a,[bc]
    and  a,$03
    ldi  [hl],a
    inc  bc
    ld   a,[bc]
    ldi  [hl],a
    inc  bc
    ld   a,[bc]
    ldi  [hl],a
    inc  bc
    ld   a,[bc]
    ldi  [hl],a
    inc  bc
    ld   a,[bc]
    ldi  [hl],a
    ld   a,e
    add  a,$05
    ld   [$FFE6],a
    jr   $325C
    ld   a,[bc]
    cp   a,$FE
    jr   z,$328E
    call $32A9
    jr   $325C
    ld   a,$01
    ld   [$2100],a
    call $6CCE
    ld   a,$36
    ld   [$2100],a
    call $6D4D
    ld   a,$21
    ld   [$2100],a
    call $53F3
    jp   $081D
    xor  a
    ld   [$FFD7],a
    ld   a,[bc]
    bit  7,a
    jr   z,$32B8
    bit  4,a
    jr   nz,$32B8
    ld   [$FFD7],a
    inc  bc
    inc  bc
    ld   a,[$FFF8]
    ld   e,a
    ld   a,[$DBA5]
    and  a
    jr   nz,$32D9
    ld   a,[bc]
    sub  a,$F5
    jr   c,$3304
    ld   a,[bc]
    ld   d,a
    dec  bc
    ld   a,[bc]
    ld   e,a
    inc  bc
    ld   a,$24
    ld   [$2100],a
    call $7578
    call $353B
    ret  
    ld   a,[bc]
    sub  a,$EC
    jp   c,$33CB
    rst  $00
    ld   a,[$1535]
    ld   [hl],$30
    ld   [hl],$4B
    ld   [hl],$64
    ld   [hl],$77
    ld   [hl],$8A
    ld   [hl],$9D
    ld   [hl],$B2
    ld   [hl],$EA
    ld   [hl],$FE
    ld   [hl],$12
    scf  
    ld   h,$37
    ld   e,[hl]
    scf  
    ld   l,l
    scf  
    ld   a,h
    scf  
    and  d
    scf  
    or   [hl]
    scf  
    add  a,$F5
    push af
    ld   d,a
    cp   a,$E9
    jr   nz,$330F
    ld   [$C50E],a
    cp   a,$5E
    jr   nz,$3317
    bit  5,e
    jr   nz,$337C
    cp   a,$91
    jr   nz,$3324
    bit  5,e
    jr   z,$3324
    pop  af
    ld   a,$5E
    ld   d,a
    push af
    cp   a,$DC
    jr   nz,$3331
    bit  5,e
    jr   z,$3331
    pop  af
    ld   a,$91
    ld   d,a
    push af
    cp   a,$D8
    jr   z,$333D
    cp   a,$D9
    jr   z,$333D
    cp   a,$DA
    jr   nz,$3346
    bit  4,e
    jr   z,$3346
    pop  af
    ld   a,$DB
    ld   d,a
    push af
    cp   a,$C2
    jr   nz,$3353
    bit  4,e
    jr   z,$3353
    pop  af
    ld   a,$E3
    ld   d,a
    push af
    ld   a,d
    cp   a,$BA
    jr   nz,$3361
    bit  2,e
    jr   z,$3361
    pop  af
    ld   a,$E1
    ld   d,a
    push af
    ld   a,d
    cp   a,$D3
    jr   nz,$3381
    bit  4,e
    jr   z,$3381
    ld   a,[$FFF6]
    cp   a,$75
    jr   z,$337C
    cp   a,$07
    jr   z,$337C
    cp   a,$AA
    jr   z,$337C
    cp   a,$4A
    jr   nz,$3381
    pop  af
    ld   a,$C6
    ld   d,a
    push af
    ld   a,d
    ld   [$FFE0],a
    cp   a,$C2
    jr   z,$33A8
    cp   a,$E1
    jr   z,$33A8
    cp   a,$CB
    jr   z,$33A8
    cp   a,$BA
    jr   z,$33A8
    cp   a,$61
    jr   z,$33A8
    cp   a,$C6
    jr   z,$33A8
    cp   a,$C5
    jr   z,$33A8
    cp   a,$E2
    jr   z,$33A8
    cp   a,$E3
    jr   nz,$33BC
    ld   a,[$C19C]
    ld   e,a
    inc  a
    and  a,$03
    ld   [$C19C],a
    ld   d,$00
    ld   hl,$D416
    add  hl,de
    dec  bc
    ld   a,[bc]
    ld   [hl],a
    inc  bc
    ld   a,[$FFE0]
    cp   a,$C5
    jp   z,$347D
    cp   a,$C6
    jp   z,$347D
    jp   $34CE
    add  a,$EC
    ld   [$FFE0],a
    push af
    cp   a,$CF
    jr   c,$33DC
    cp   a,$D3
    jr   nc,$33DC
    ld   hl,$C1A5
    inc  [hl]
    cp   a,$AB
    jr   nz,$3407
    xor  a
    ld   [$C3CB],a
    ld   a,[$FFF6]
    cp   a,$C4
    ld   a,[$FFE0]
    jr   z,$3407
    ld   hl,$DBC9
    inc  [hl]
    ld   [$C3CB],a
    push af
    ld   a,[$C3CD]
    add  a,$04
    ld   [$C3CD],a
    ld   a,[$FFFE]
    and  a
    jr   nz,$3406
    ld   a,$04
    ld   [$C16B],a
    pop  af
    cp   a,$8E
    jr   z,$341E
    cp   a,$AA
    jr   z,$341E
    cp   a,$DC
    jr   z,$3417
    cp   a,$DB
    jr   nz,$3423
    ld   hl,$D6FA
    ld   [hl],$02
    jr   $3423
    ld   hl,$D6FA
    ld   [hl],$01
    cp   a,$3F
    jr   z,$342B
    cp   a,$47
    jr   nz,$342F
    bit  2,e
    jr   nz,$343B
    cp   a,$40
    jr   z,$3437
    cp   a,$48
    jr   nz,$343F
    bit  3,e
    jr   z,$343F
    pop  af
    ld   a,$3D
    push af
    cp   a,$41
    jr   z,$3447
    cp   a,$49
    jr   nz,$344B
    bit  1,e
    jr   nz,$3457
    cp   a,$42
    jr   z,$3453
    cp   a,$4A
    jr   nz,$345B
    bit  0,e
    jr   z,$345B
    pop  af
    ld   a,$3E
    push af
    cp   a,$A1
    jr   nz,$3467
    bit  4,e
    jr   nz,$3467
    pop  af
    ld   a,[$FFE9]
    push af
    cp   a,$BF
    jr   nz,$3471
    bit  4,e
    jr   nz,$3471
    pop  af
    ret  
    cp   a,$BE
    jr   z,$347D
    cp   a,$BF
    jr   z,$347D
    cp   a,$CB
    jr   nz,$3496
    dec  bc
    ld   a,$01
    ld   [$FFAC],a
    ld   a,[bc]
    and  a,$F0
    add  a,$10
    ld   [$FFAE],a
    ld   a,[bc]
    swap a
    and  a,$F0
    add  a,$08
    ld   [$FFAD],a
    inc  bc
    jp   $34CE
    cp   a,$D6
    jr   z,$349E
    cp   a,$D5
    jr   nz,$34A6
    bit  4,e
    jr   nz,$34A6
    pop  af
    ld   a,$21
    push af
    cp   a,$D7
    jr   z,$34AE
    cp   a,$D8
    jr   nz,$34B6
    bit  4,e
    jr   nz,$34B6
    pop  af
    ld   a,$22
    push af
    ld   a,[$FFF7]
    cp   a,$0A
    ld   a,[$FFE0]
    jr   c,$34C2
    cp   a,$A9
    jr   z,$34C6
    cp   a,$DE
    jr   nz,$34CE
    bit  6,e
    jr   z,$34CE
    pop  af
    ld   a,$0D
    push af
    cp   a,$A0
    jr   nz,$34DA
    bit  4,e
    jr   z,$34DA
    pop  af
    ld   a,$A1
    push af
    ld   d,$00
    ld   a,[$FFD7]
    and  a
    jr   z,$352D
    dec  bc
    ld   a,[bc]
    ld   e,a
    ld   hl,$D711
    add  hl,de
    ld   a,[$FFD7]
    and  a,$0F
    ld   e,a
    pop  af
    ld   d,a
    ld   a,d
    ldi  [hl],a
    ld   a,[$FFD7]
    and  a,$40
    jr   z,$34FB
    ld   a,l
    add  a,$0F
    ld   l,a
    dec  e
    jr   nz,$34EF
    inc  bc
    ret  
    cp   a,$04
    ret  z
    cp   a,$09
    jr   nz,$350E
    ld   a,[$FFF6]
    cp   a,$97
    ret  nz
    jr   $3527
    cp   a,$E1
    jr   nz,$351D
    ld   a,[$FFF6]
    cp   a,$0E
    ret  z
    cp   a,$0C
    ret  z
    cp   a,$1B
    ret  z
    ld   a,[$FFF6]
    cp   a,$80
    jr   nc,$3527
    ld   a,$09
    jr   $3529
    ld   a,$1A
    call $0B2F
    ret  
    dec  bc
    ld   a,[bc]
    ld   e,a
    ld   hl,$D711
    add  hl,de
    pop  af
    ld   [hl],a
    call $3500
    inc  bc
    ret  
    ld   a,[$FFF6]
    cp   a,$80
    jr   nc,$3545
    ld   a,$09
    jr   $3547
    ld   a,$1A
    ld   [$2100],a
    ret  
    push hl
    push de
    ld   a,[bc]
    ld   e,a
    ld   d,$00
    add  hl,de
    pop  de
    ld   a,[de]
    cp   a,$E1
    jr   z,$3560
    cp   a,$E2
    jr   z,$3560
    cp   a,$E3
    jr   nz,$357C
    push af
    push hl
    push de
    ld   a,l
    sub  a,$11
    push af
    ld   a,[$C19C]
    ld   e,a
    inc  a
    and  a,$03
    ld   [$C19C],a
    ld   d,$00
    ld   hl,$D416
    add  hl,de
    pop  af
    ld   [hl],a
    pop  de
    pop  hl
    pop  af
    ld   [hl],a
    call $3500
    inc  de
    inc  bc
    pop  hl
    ld   a,[bc]
    and  a
    cp   a,$FF
    jr   nz,$354B
    pop  bc
    ret  
    push hl
    push de
    ld   a,[bc]
    ld   e,a
    ld   d,$00
    add  hl,de
    pop  de
    ld   a,[de]
    cp   a,$E1
    jr   z,$35A0
    cp   a,$E2
    jr   z,$35A0
    cp   a,$E3
    jr   nz,$35BC
    push af
    push hl
    push de
    ld   a,l
    sub  a,$11
    push af
    ld   a,[$C19C]
    ld   e,a
    inc  a
    and  a,$03
    ld   [$C19C],a
    ld   d,$00
    ld   hl,$D416
    add  hl,de
    pop  af
    ld   [hl],a
    pop  de
    pop  hl
    pop  af
    ld   [hl],a
    call $35CB
    inc  de
    inc  bc
    pop  hl
    ld   a,[bc]
    and  a
    cp   a,$FF
    jr   nz,$358B
    pop  bc
    ret  
    cp   a,$04
    ret  z
    cp   a,$09
    jr   nz,$35D9
    ld   a,[$FFF6]
    cp   a,$97
    ret  nz
    jr   $35E8
    cp   a,$E1
    jr   nz,$35E8
    ld   a,[$FFF6]
    cp   a,$0E
    ret  z
    cp   a,$0C
    ret  z
    cp   a,$1B
    ret  z
    ld   a,$24
    call $0B2F
    ret  
    dec  bc
    ld   a,[bc]
    ld   e,a
    ld   d,$00
    ld   hl,$D711
    add  hl,de
    ret  
    dec  l
    ld   l,$1E
    nop  
    call $373F
    ld   a,[$FFF8]
    and  a,$04
    jp   nz,$36B2
    push bc
    call $35EE
    ld   bc,$37E1
    ld   de,$35F8
    jp   $354B
    cpl  
    jr   nc,$3634
    ld   bc,$3FCD
    scf  
    ld   a,[$FFF8]
    and  a,$08
    jp   nz,$36EA
    push bc
    call $35EE
    ld   bc,$37E1
    ld   de,$3613
    jp   $354B
    ld   sp,$1E32
    ld   [bc],a
    call $373F
    ld   a,[$FFF8]
    and  a,$02
    jp   nz,$36FE
    push bc
    call $35EE
    ld   bc,$37E4
    ld   de,$362E
    jp   $354B
    inc  sp
    inc  [hl]
    ld   e,$03
    call $373F
    ld   a,[$FFF8]
    and  a,$01
    jp   nz,$3712
    push bc
    call $35EE
    ld   bc,$37E4
    ld   de,$3649
    jp   $354B
    ld   e,$04
    call $373F
    ld   a,[$C18A]
    or   a,$01
    ld   [$C18A],a
    ld   [$C18B],a
    jp   $36B2
    ld   e,$05
    call $373F
    ld   a,[$C18A]
    or   a,$02
    ld   [$C18A],a
    ld   [$C18B],a
    jp   $36EA
    ld   e,$06
    call $373F
    ld   a,[$C18A]
    or   a,$04
    ld   [$C18A],a
    ld   [$C18B],a
    jp   $36FE
    ld   e,$07
    call $373F
    ld   a,[$C18A]
    or   a,$08
    ld   [$C18A],a
    ld   [$C18B],a
    jp   $3712
    ld   b,e
    ld   b,h
    ld   a,$04
    call $36C4
    push bc
    call $35EE
    ld   bc,$37E1
    ld   de,$36B0
    jp   $354B
    push af
    ld   hl,$D900
    ld   a,[$FFF6]
    ld   e,a
    ld   d,$00
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$36D8
    ld   hl,$DDE0
    jr   $36E1
    cp   a,$1A
    jr   nc,$36E1
    cp   a,$06
    jr   c,$36E1
    inc  d
    add  hl,de
    pop  af
    or   [hl]
    ld   [hl],a
    ld   [$FFF8],a
    ret  
    adc  h
    ld   [$083E],sp
    call $36C4
    push bc
    call $35EE
    ld   bc,$37E1
    ld   de,$36E8
    jp   $354B
    add  hl,bc
    ld   a,[bc]
    ld   a,$02
    call $36C4
    push bc
    call $35EE
    ld   bc,$37E4
    ld   de,$36FC
    jp   $354B
    dec  bc
    inc  c
    ld   a,$01
    call $36C4
    push bc
    call $35EE
    ld   bc,$37E4
    ld   de,$3710
    jp   $354B
    and  h
    and  l
    ld   e,$08
    call $373F
    ld   a,[$FFF8]
    and  a,$04
    jp   nz,$36B2
    push bc
    call $35EE
    ld   bc,$37E1
    ld   de,$3724
    jp   $354B
    ld   d,$00
    ld   hl,$C1F0
    add  hl,de
    dec  bc
    ld   a,[bc]
    ld   [hl],a
    push af
    and  a,$F0
    ld   hl,$C1E0
    add  hl,de
    ld   [hl],a
    pop  af
    swap a
    and  a,$F0
    ld   hl,$C1D0
    add  hl,de
    ld   [hl],a
    inc  bc
    ret  
    xor  a
    or   b
    push bc
    call $35EE
    ld   bc,$37E4
    ld   de,$375C
    jp   $354B
    or   c
    or   d
    push bc
    call $35EE
    ld   bc,$37E1
    ld   de,$376B
    jp   $354B
    ld   b,l
    ld   b,[hl]
    push bc
    call $35EE
    ld   bc,$37E1
    ld   de,$377A
    jp   $354B
    nop  
    ld   bc,$0302
    <corrupted stop>
    ld   [de],a
    inc  de
    jr   nz,$37B4
    ldi  [hl],a
    inc  hl
    rst  $38
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
    ld   a,$08
    call $36C4
    push bc
    call $35EE
    ld   bc,$3789
    ld   de,$3796
    jp   $354B
    pop  bc
    jp   nz,$F7F0
    cp   a,$1A
    jr   nc,$37CF
    cp   a,$06
    jr   c,$37CF
    ld   a,[$FFF6]
    cp   a,$D3
    jr   nz,$37CF
    ld   a,[$DB46]
    and  a
    jr   z,$37CF
    jp   $3677
    ld   a,$01
    call $36C4
    push bc
    call $35EE
    ld   bc,$37E1
    ld   de,$37B4
    jp   $354B
    nop  
    ld   bc,$00FF
    <corrupted stop>
    ld   [$FFE9],a
    ld   d,$80
    ld   hl,$D711
    ld   e,a
    ld   a,l
    and  a,$0F
    jr   z,$37F9
    cp   a,$0B
    jr   nc,$37F9
    ld   [hl],e
    inc  hl
    dec  d
    jr   nz,$37EF
    ret  
    ld   a,$01
    ld   [$2100],a
    call $5F02
    ld   a,$16
    ld   [$2100],a
    xor  a
    ld   [$FFE4],a
    ld   a,[$FFF6]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    ld   hl,$4000
    ld   a,[$DBA5]
    and  a
    jr   z,$3868
    ld   a,[$FFF7]
    cp   a,$06
    jr   nz,$3850
    ld   a,[$DB6F]
    ld   hl,$FFF6
    cp   [hl]
    jr   nz,$3850
    ld   a,$A8
    call $3B86
    ld   a,[$DB70]
    ld   hl,$C200
    add  hl,de
    ld   [hl],a
    ld   a,[$DB71]
    ld   hl,$C210
    add  hl,de
    ld   [hl],a
    call $38D4
    ld   hl,$C460
    add  hl,de
    ld   [hl],$FF
    xor  a
    ld   [$FFE4],a
    ld   hl,$4200
    ld   a,[$FFF7]
    cp   a,$FF
    jr   nz,$385E
    ld   hl,$4600
    jr   $3868
    cp   a,$1A
    jr   nc,$3868
    cp   a,$06
    jr   c,$3868
    inc  h
    inc  h
    add  hl,bc
    ldi  a,[hl]
    ld   c,a
    ld   a,[hl]
    ld   b,a
    ld   a,[bc]
    cp   a,$FF
    jr   z,$3877
    call $3883
    jr   $386D
    call $081D
    ret  
    ld   bc,$0402
    ld   [$2010],sp
    ld   b,b
    add  b
    ld   a,[$FFE4]
    cp   a,$08
    jr   nc,$389B
    ld   e,a
    ld   d,$00
    ld   hl,$387B
    add  hl,de
    ld   a,[$FFF6]
    ld   e,a
    ld   a,[hl]
    ld   hl,$CF00
    add  hl,de
    and  [hl]
    jr   nz,$38AD
    ld   e,$00
    ld   d,e
    ld   hl,$C280
    add  hl,de
    ld   a,[hl]
    cp   a,$00
    jr   z,$38B4
    inc  e
    ld   a,e
    cp   a,$10
    jr   nz,$389E
    ld   hl,$FFE4
    inc  [hl]
    inc  bc
    inc  bc
    ret  
    ld   [hl],$04
    ld   a,[bc]
    and  a,$F0
    ld   hl,$C210
    add  hl,de
    add  a,$10
    ld   [hl],a
    ld   a,[bc]
    inc  bc
    swap a
    and  a,$F0
    ld   hl,$C200
    add  hl,de
    add  a,$08
    ld   [hl],a
    ld   hl,$C3A0
    add  hl,de
    ld   a,[bc]
    inc  bc
    ld   [hl],a
    ld   a,$03
    ld   [$2100],a
    call $6524
    ld   a,$01
    ld   [$2100],a
    call $5EAB
    ld   a,$16
    ld   [$2100],a
    ret  
    ld   e,a
    ld   a,$14
    ld   [$2100],a
    ld   a,e
    push bc
    call $4880
    pop  bc
    ld   a,[$FFE8]
    ld   [$2100],a
    ret  
    ld   a,$20
    ld   [$2100],a
    call $588B
    ret  
    ld   a,[$DBA5]
    and  a
    jr   nz,$390F
    ld   a,$1A
    jr   $3911
    ld   a,$08
    ld   [$2100],a
    ret  
    ld   a,$27
    ld   [$2100],a
    jp   $7FC5
    ld   a,$20
    ld   [$2100],a
    jp   $7DE6
    ld   a,$14
    ld   [$2100],a
    ld   hl,$5218
    add  hl,de
    ld   a,[hl]
    ld   hl,$2100
    ld   [hl],$05
    ret  
    ld   a,$19
    call $080C
    call $7C50
    ld   a,$03
    jp   $080C
    ld   a,$03
    ld   [$2100],a
    call $53E4
    jp   $081D
    ld   a,$14
    ld   [$2100],a
    call $54AC
    jp   $081D
    ld   a,$01
    call $080C
    call $5FB3
    ld   a,$02
    jp   $080C
    ld   a,$03
    ld   [$2100],a
    call $485B
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $7EFE
    jp   $081D
    ld   a,$14
    ld   [$2100],a
    call $5347
    ld   a,$03
    ld   [$2100],a
    ret  
    nop  
    ld   [$1810],sp
    ld   hl,$C5A7
    ld   a,[hl]
    and  a
    jr   z,$399B
    dec  [hl]
    jr   nz,$399B
    ld   a,$10
    ld   [$FFF3],a
    ld   a,[$C19F]
    and  a
    jr   nz,$39AE
    ld   a,[$C111]
    ld   [$C1A8],a
    and  a
    jr   z,$39AE
    dec  a
    ld   [$C111],a
    ld   a,[$C11C]
    cp   a,$07
    ret  z
    xor  a
    ld   [$C3C1],a
    ld   a,[$FFF7]
    cp   a,$0A
    ld   a,[$FFE7]
    jr   c,$39C1
    xor  a
    and  a,$03
    ld   e,a
    ld   d,$00
    ld   hl,$3989
    add  hl,de
    ld   a,[hl]
    ld   [$C3C0],a
    ld   a,$20
    ld   [$2100],a
    call $4303
    xor  a
    ld   [$2100],a
    ld   a,[$C19F]
    and  a
    jr   nz,$39E3
    ld   [$C1AD],a
    ld   a,$20
    ld   [$DBAF],a
    ld   [$2100],a
    call $6352
    ld   b,$00
    ld   c,$0F
    ld   a,c
    ld   [$C123],a
    ld   hl,$C280
    add  hl,bc
    ld   a,[hl]
    and  a
    jr   z,$3A03
    ld   [$FFEA],a
    call $3A18
    dec  c
    ld   a,c
    cp   a,$FF
    jr   nz,$39F2
    ret  
    ld   a,$15
    ld   [$2100],a
    call $4000
    ld   a,$03
    ld   [$2100],a
    ret  
    ld   hl,$C3A0
    add  hl,bc
    ld   a,[hl]
    ld   [$FFEB],a
    ld   hl,$C290
    add  hl,bc
    ld   a,[hl]
    ld   [$FFF0],a
    ld   hl,$C3B0
    add  hl,bc
    ld   a,[hl]
    ld   [$FFF1],a
    ld   a,$19
    ld   [$DBAF],a
    ld   [$2100],a
    ld   a,[$FFEB]
    cp   a,$6A
    jr   nz,$3A40
    ld   a,[$FFB2]
    and  a
    jr   nz,$3A46
    ld   a,[$FFEA]
    cp   a,$07
    jr   nz,$3A4E
    call $7964
    call $3D8A
    jr   $3A54
    call $3D8A
    call $7964
    ld   a,$14
    ld   [$DBAF],a
    ld   [$2100],a
    call $4D73
    ld   a,$03
    ld   [$DBAF],a
    ld   [$2100],a
    ld   a,[$FFEA]
    cp   a,$05
    jp   z,$3A8D
    rst  $00
    add  hl,bc
    ldd  a,[hl]
    jr   $3AC8
    or   [hl]
    ld   c,h
    ld   c,h
    ld   c,h
    or   l
    ld   c,b
    adc  l
    ldd  a,[hl]
    rlca 
    ld   c,[hl]
    ldd  [hl],a
    ld   d,a
    sub  h
    ld   c,l
    call $3A8D
    ld   a,$03
    ld   [$DBAF],a
    ld   [$2100],a
    ret  
    ld   a,$20
    ld   [$2100],a
    ld   a,[$FFEB]
    ld   e,a
    ld   d,b
    ld   hl,$4000
    add  hl,de
    add  hl,de
    add  hl,de
    ld   e,[hl]
    inc  hl
    ld   d,[hl]
    inc  hl
    ld   a,[hl]
    ld   l,e
    ld   h,d
    ld   [$DBAF],a
    ld   [$2100],a
    jp   [hl]
    ld   [$0805],sp
    dec  b
    ld   [$080A],sp
    ld   a,[bc]
    ld   [$080A],sp
    ld   a,[bc]
    ld   [$0410],sp
    ld   a,[bc]
    ld   [$0802],sp
    ld   [bc],a
    ld   [$0813],sp
    inc  de
    ld   [$0606],sp
    ld   [$0708],sp
    ld   b,$0A
    ld   [$1006],sp
    jr   nc,$3AD7
    rlca 
    inc  b
    ld   a,[bc]
    inc  c
    rlca 
    -    
    inc  b
    <corrupted stop>
    inc  c
    ld   [de],a
    ld   [$0208],sp
    ld   [$0C10],sp
    ld   [$0810],sp
    rlca 
    inc  c
    ld   [$0808],sp
    ld   [bc],a
    ld   [$5021],sp
    jp   $7E09
    and  a,$7C
    ld   e,a
    ld   d,b
    ld   hl,$3AAA
    add  hl,de
    ld   e,l
    ld   d,h
    push bc
    sla  c
    sla  c
    ld   hl,$D580
    add  hl,bc
    ld   c,$04
    ld   a,[de]
    inc  de
    ldi  [hl],a
    dec  c
    jr   nz,$3B04
    pop  bc
    ret  
    ld   hl,$C3B0
    add  hl,bc
    ld   [hl],a
    ret  
    ld   hl,$C290
    add  hl,bc
    inc  [hl]
    ret  
    ld   a,$02
    ld   [$2100],a
    call $75F5
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $7893
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $7CAB
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $6E28
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $6C6B
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $6BDE
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $6C77
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $73EB
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $6E2B
    jp   $081D
    ld   a,$03
    ld   [$2100],a
    call $75A2
    jp   $081D
    push af
    ld   a,$03
    ld   [$2100],a
    pop  af
    call $64CA
    rr   l
    call $081D
    rl   l
    ret  
    push af
    ld   a,$03
    ld   [$2100],a
    pop  af
    call $64CC
    rr   l
    call $081D
    rl   l
    ret  
    ld   hl,$2100
    ld   [hl],$03
    call $7EC7
    jp   $081D
    ld   hl,$2100
    ld   [hl],$03
    call $7E45
    jp   $081D
    ld   a,[$FFF1]
    inc  a
    ret  z
    call $3D57
    push de
    ld   a,[$C3C0]
    ld   e,a
    ld   d,b
    ld   hl,$C030
    add  hl,de
    ld   e,l
    ld   d,h
    ld   a,[$FFEC]
    ld   [de],a
    inc  de
    ld   a,[$C155]
    ld   c,a
    ld   a,[$FFED]
    and  a,$20
    rra  
    rra  
    ld   hl,$FFEE
    add  [hl]
    sub  c
    ld   [de],a
    inc  de
    ld   a,[$FFF1]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    sla  c
    rl   b
    pop  hl
    add  hl,bc
    ld   a,[$FFF5]
    ld   c,a
    ldi  a,[hl]
    add  c
    ld   [de],a
    and  a,$0F
    cp   a,$0F
    jr   nz,$3C08
    dec  de
    ld   a,$F0
    ld   [de],a
    inc  de
    inc  de
    ldi  a,[hl]
    push hl
    ld   hl,$FFED
    xor  [hl]
    ld   [de],a
    ld   a,[$FFFE]
    and  a
    jr   z,$3C21
    ld   a,[$FFED]
    and  a,$10
    jr   z,$3C21
    ld   a,[de]
    and  a,$F8
    or   a,$04
    ld   [de],a
    inc  de
    ld   a,[$FFEC]
    ld   [de],a
    inc  de
    ld   a,[$C155]
    ld   c,a
    ld   a,[$FFED]
    and  a,$20
    xor  a,$20
    rra  
    rra  
    ld   hl,$FFEE
    sub  c
    add  [hl]
    ld   [de],a
    inc  de
    pop  hl
    ld   a,[$FFF5]
    ld   c,a
    ldi  a,[hl]
    add  c
    ld   [de],a
    and  a,$0F
    cp   a,$0F
    jr   nz,$3C4B
    dec  de
    ld   a,$F0
    ld   [de],a
    inc  de
    inc  de
    ld   a,[hl]
    ld   hl,$FFED
    xor  [hl]
    ld   [de],a
    ld   a,[$FFFE]
    and  a
    jr   z,$3C63
    ld   a,[$FFED]
    and  a,$10
    jr   z,$3C63
    ld   a,[de]
    and  a,$F8
    or   a,$04
    ld   [de],a
    ld   a,[$C123]
    ld   c,a
    ld   b,$00
    ld   a,$15
    ld   [$2100],a
    call $795D
    call $7995
    jp   $081D
    ld   a,[$FFF1]
    inc  a
    ret  z
    call $3D57
    push de
    ld   a,[$C3C0]
    ld   l,a
    ld   h,$00
    ld   bc,$C030
    add  hl,bc
    ld   e,l
    ld   d,h
    ld   a,[$C123]
    ld   c,a
    ld   b,$00
    ld   a,[$FFF9]
    and  a
    ld   a,[$FFEC]
    jr   z,$3C9C
    sub  a,$04
    ld   [$FFEC],a
    ld   [de],a
    inc  de
    ld   a,[$C155]
    ld   h,a
    ld   a,[$FFEE]
    add  a,$04
    sub  h
    ld   [de],a
    inc  de
    ld   a,[$FFF1]
    ld   c,a
    ld   b,$00
    sla  c
    rl   b
    pop  hl
    add  hl,bc
    ldi  a,[hl]
    ld   [de],a
    inc  de
    ld   a,[$FFFE]
    and  a
    jr   z,$3CD0
    ld   a,[$DB95]
    cp   a,$01
    jr   z,$3CD0
    ld   a,[$FFED]
    and  a
    jr   z,$3CD0
    ld   a,[hl]
    and  a,$F8
    or   a,$04
    ld   [de],a
    jr   $3CD6
    ldi  a,[hl]
    ld   hl,$FFED
    xor  [hl]
    ld   [de],a
    inc  de
    jr   $3C63
    ld   a,$15
    ld   [$2100],a
    jr   $3C71
    push hl
    ld   hl,$C000
    jr   $3CF6
    ld   a,[$FFF1]
    inc  a
    jr   z,$3D52
    push hl
    ld   a,[$C3C0]
    ld   e,a
    ld   d,$00
    ld   hl,$C030
    add  hl,de
    ld   e,l
    ld   d,h
    pop  hl
    ld   a,c
    ld   [$FFD7],a
    ld   a,[$C123]
    ld   c,a
    call $3D57
    ld   a,[$FFD7]
    ld   c,a
    ld   a,[$FFEC]
    add  [hl]
    ld   [de],a
    inc  hl
    inc  de
    push bc
    ld   a,[$C155]
    ld   c,a
    ld   a,[$FFEE]
    add  [hl]
    sub  c
    ld   [de],a
    inc  hl
    inc  de
    ld   a,[$FFF5]
    ld   c,a
    ldi  a,[hl]
    push af
    add  c
    ld   [de],a
    pop  af
    cp   a,$FF
    jr   nz,$3D28
    dec  de
    xor  a
    ld   [de],a
    inc  de
    pop  bc
    inc  de
    ld   a,[$FFED]
    xor  [hl]
    ld   [de],a
    inc  hl
    ld   a,[$FFFE]
    and  a
    jr   z,$3D3F
    ld   a,[$FFED]
    and  a
    jr   z,$3D3F
    ld   a,[de]
    and  a,$F8
    or   a,$04
    ld   [de],a
    inc  de
    dec  c
    jr   nz,$3D06
    ld   a,[$C123]
    ld   c,a
    ld   a,$15
    ld   [$2100],a
    call $795D
    jp   $081D
    ld   a,[$C123]
    ld   c,a
    ret  
    push hl
    ld   a,[$C124]
    and  a
    jr   z,$3D7D
    ld   a,[$FFEE]
    dec  a
    cp   a,$C0
    jr   nc,$3D7C
    ld   a,[$FFEC]
    dec  a
    cp   a,$88
    jr   nc,$3D7C
    ld   hl,$C220
    add  hl,bc
    ld   a,[hl]
    and  a
    jr   nz,$3D7C
    ld   hl,$C230
    add  hl,bc
    ld   a,[hl]
    and  a
    jr   z,$3D7D
    pop  af
    pop  hl
    ret  
    ld   hl,$C240
    add  hl,bc
    ld   [hl],b
    ld   hl,$C250
    add  hl,bc
    ld   [hl],b
    ret  
    ld   hl,$C200
    add  hl,bc
    ld   a,[hl]
    ld   [$FFEE],a
    ld   hl,$C210
    add  hl,bc
    ld   a,[hl]
    ld   [$FFEF],a
    ld   hl,$C310
    add  hl,bc
    sub  [hl]
    ld   [$FFEC],a
    ret  
    ld   hl,$2100
    ld   [hl],$15
    call $7964
    jp   $081D
    ld   hl,$2100
    ld   [hl],$04
    call $5A1A
    jp   $081D
    ld   hl,$2100
    ld   [hl],$04
    call $5690
    jp   $081D
    ld   hl,$2100
    ld   [hl],$04
    call $504B
    jp   $081D
    ld   hl,$2100
    ld   [hl],$04
    call $49BD
    jp   $081D
    ld   hl,$2100
    ld   [hl],$36
    call $72AB
    jp   $081D
    ld   hl,$2100
    ld   [hl],$05
    call $6CC6
    jp   $081D
    ld   hl,$2100
    ld   [hl],$05
    call $6818
    jp   $081D
    ld   hl,$2100
    ld   [hl],$05
    call $6302
    jp   $081D
    ld   hl,$2100
    ld   [hl],$05
    call $5A1E
    jp   $081D
    ld   hl,$2100
    ld   [hl],$05
    call $556B
    jp   $081D
    ld   a,[$DBAF]
    push af
    ld   a,$02
    call $080C
    call $6C75
    pop  af
    jp   $080C
    ld   hl,$2100
    ld   [hl],$04
    call $5C63
    jp   $081D
    ld   hl,$2100
    ld   [hl],$03
    call $5407
    jp   $081D
    ld   hl,$2100
    ld   [hl],$02
    call $62CE
    call $6414
    jp   $081D
    ld   a,$02
    call $080C
    call $41D0
    ld   a,$03
    jp   $080C
    ld   hl,$2100
    ld   [hl],$20
    ld   c,$01
    ld   b,$00
    ld   e,$FF
    call $5C9C
    jp   $081D
    ld   hl,$2100
    ld   [hl],$03
    call $6472
    jp   $081D
    ld   a,$06
    call $080C
    call $783C
    ld   a,$03
    jp   $080C
    ld   e,$10
    ld   hl,$C280
    xor  a
    ldi  [hl],a
    dec  e
    jr   nz,$3E88
    ret  
    ld   hl,$C4A0
    add  hl,bc
    ld   a,[hl]
    and  a
    ret  z
    ld   a,[$FFE7]
    xor  c
    and  a,$03
    ret  nz
    ld   a,[$FFEE]
    ld   [$FFD7],a
    ld   a,[$FFEC]
    ld   [$FFD8],a
    ld   a,$08
    call $0CC7
    ld   hl,$C520
    add  hl,de
    ld   [hl],$0F
    ret  
    ld   hl,$C3F0
    add  hl,bc
    ld   a,[hl]
    bit  7,a
    jr   z,$3EBA
    cpl  
    inc  a
    ld   [$FFD7],a
    ld   hl,$C400
    add  hl,bc
    ld   a,[hl]
    bit  7,a
    jr   z,$3EC7
    cpl  
    inc  a
    ld   e,$03
    ld   hl,$FFD7
    cp   [hl]
    jr   c,$3ED1
    ld   e,$0C
    ld   a,e
    ld   hl,$C2A0
    add  hl,bc
    and  [hl]
    jr   z,$3EDE
    ld   hl,$C410
    add  hl,bc
    ld   [hl],b
    ret  
    or   b
    or   h
    or   c
    or   d
    or   e
    or   [hl]
    cp   d
    cp   h
    cp   b
    ld   hl,$C14F
    ld   a,[$C124]
    or   [hl]
    ret  nz
    ld   a,[$C165]
    and  a
    jr   z,$3EFB
    dec  a
    ld   [$C165],a
    ret  
    ld   a,[$C1BD]
    and  a
    ret  nz
    inc  a
    ld   [$C1BD],a
    ld   hl,$C430
    add  hl,bc
    ld   a,[hl]
    and  a,$04
    ld   a,$19
    jr   z,$3F11
    ld   a,$50
    ld   [$D368],a
    ld   [$FFBD],a
    ld   a,[$C16B]
    cp   a,$04
    ret  nz
    ld   a,[$FFEB]
    cp   a,$87
    jr   nz,$3F26
    ld   a,$DA
    jr   $3F45
    cp   a,$BC
    jr   nz,$3F2E
    ld   a,$26
    jr   $3F45
    ld   hl,$C430
    add  hl,bc
    ld   a,[hl]
    and  a,$04
    ret  nz
    ld   a,[$FFF7]
    cp   a,$FF
    ret  z
    cp   a,$05
    ret  z
    ld   e,a
    ld   d,b
    ld   hl,$3EDF
    add  hl,de
    ld   a,[hl]
    jp   $2385
    ld   bc,$0402
    ld   [$2010],sp
    ld   b,b
    add  b
    ld   a,$03
    ld   [$C113],a
    ld   [$2100],a
    call $55CF
    call $081D
    ld   hl,$C460
    add  hl,bc
    ld   a,[hl]
    cp   a,$FF
    jr   z,$3F8D
    push af
    ld   a,[$DBB5]
    ld   e,a
    ld   d,b
    inc  a
    ld   [$DBB5],a
    ld   a,[hl]
    ld   hl,$DBB6
    add  hl,de
    ld   [hl],a
    pop  af
    cp   a,$08
    jr   nc,$3F8D
    ld   e,a
    ld   d,b
    ld   hl,$3F48
    add  hl,de
    ld   a,[$FFF6]
    ld   e,a
    ld   d,b
    ld   a,[hl]
    ld   hl,$CF00
    add  hl,de
    or   [hl]
    ld   [hl],a
    ld   hl,$C280
    add  hl,bc
    ld   [hl],b
    ret  
    ld   a,$05
    ld   [$2100],a
    ld   hl,$59DE
    ld   de,$8460
    ld   bc,$0010
    call $2914
    ld   hl,$59EE
    jr   $3FBD
    ld   a,$05
    ld   [$2100],a
    ld   hl,$59FE
    ld   de,$8460
    ld   bc,$0010
    call $2914
    ld   hl,$5A0E
    ld   de,$8480
    ld   bc,$0010
    call $2914
    xor  a
    ld   [$FFA5],a
    ld   a,$0C
    ld   [$2100],a
    jp   $1D2E
    ld   b,$34
    ld   a,[$FFFE]
    and  a
    jr   z,$3FD9
    inc  b
    ld   a,b
    ld   [$2100],a
    ld   hl,$4000
    ld   de,$8400
    ld   bc,$0400
    call $2914
    ld   a,$20
    ld   [$2100],a
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


	di
.loop
	halt
	jr .loop

section "bank1",romx,bank[$1]
    xor    a

