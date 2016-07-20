; The source code found here assembles to main.o.

; If it starts to take a long time to build, it's a good idea
; to split your code and data up into new objects in the makefile.


include "constants.asm"

include "code/rst.asm"
include "code/header.asm"
include "wram.asm"

SelectRomBank_2100 equ $2100

label_1010 equ $1010
label_4001 equ $4001
label_4003 equ $4003
label_4006 equ $4006
label_4029 equ $4029
label_4062 equ $4062
label_406E equ $406E
label_40B3 equ $40B3
label_410D equ $410D
label_4146 equ $4146
label_41C2 equ $41C2
label_41D0 equ $41D0
label_41E7 equ $41E7
UseOcarina equ $41FC
label_4200 equ $4200
label_4220 equ $4220
label_4254 equ $4254
label_4287 equ $4287
label_4303 equ $4303
label_434E equ $434E
label_4371 equ $4371
label_43B0 equ $43B0
label_4400 equ $4400
label_4496 equ $4496
label_44E0 equ $44E0
label_4518 equ $4518
label_4520 equ $4520
label_4561 equ $4561
label_4577 equ $4577
label_4581 equ $4581
label_4589 equ $4589
label_45A1 equ $45A1
label_45A9 equ $45A9
label_45C1 equ $45C1
label_45C9 equ $45C9
label_45CA equ $45CA
label_4600 equ $4600
label_4601 equ $4601
label_4616 equ $4616
label_4641 equ $4641
label_4657 equ $4657
label_4741 equ $4741
label_475A equ $475A
label_4760 equ $4760
label_47A0 equ $47A0
label_47C0 equ $47C0
label_47CE equ $47CE
label_47EC equ $47EC
label_47F7 equ $47F7
label_4800 equ $4800
label_482D equ $482D
label_4854 equ $4854
label_485B equ $485B
label_4874 equ $4874
label_4880 equ $4880
label_48B0 equ $48B0
label_48CA equ $48CA
label_48DD equ $48DD
label_48E0 equ $48E0
label_4900 equ $4900
label_4905 equ $4905
label_4910 equ $4910
label_4918 equ $4918
label_4928 equ $4928
label_4940 equ $4940
label_4950 equ $4950
label_4958 equ $4958
label_4985 equ $4985
label_49A0 equ $49A0
label_49BA equ $49BA
label_49BD equ $49BD
label_49D0 equ $49D0
label_49D9 equ $49D9
label_49F1 equ $49F1
label_4A2C equ $4A2C
label_4A4C equ $4A4C
label_4A76 equ $4A76
label_4A77 equ $4A77
label_4AA8 equ $4AA8
label_4AB3 equ $4AB3
label_4AB7 equ $4AB7
label_4ABC equ $4ABC
label_4AD4 equ $4AD4
label_4B1F equ $4B1F
label_4B4A equ $4B4A
label_4B81 equ $4B81
label_4BD4 equ $4BD4
label_4BE8 equ $4BE8
label_4BFF equ $4BFF
label_4C00 equ $4C00
label_4C0F equ $4C0F
label_4C40 equ $4C40
label_4C47 equ $4C47
label_4C4B equ $4C4B
label_4C98 equ $4C98
label_4CA3 equ $4CA3
label_4CFB equ $4CFB
label_4D00 equ $4D00
label_4D20 equ $4D20
label_4D73 equ $4D73
label_4DF1 equ $4DF1
label_4E3C equ $4E3C
label_4E41 equ $4E41
label_4E51 equ $4E51
label_4F00 equ $4F00
label_4F30 equ $4F30
label_4F68 equ $4F68
label_4F8C equ $4F8C
label_4F9B equ $4F9B
label_4FE8 equ $4FE8
label_5000 equ $5000
label_5021 equ $5021
label_5038 equ $5038
label_504B equ $504B
label_505F equ $505F
label_509A equ $509A
label_50A3 equ $50A3
label_50C3 equ $50C3
label_5118 equ $5118
label_5200 equ $5200
label_5218 equ $5218
label_5257 equ $5257
label_5267 equ $5267
label_5310 equ $5310
label_5347 equ $5347
label_538B equ $538B
label_53CF equ $53CF
label_53E4 equ $53E4
label_53F3 equ $53F3
label_5400 equ $5400
label_5407 equ $5407
label_5449 equ $5449
label_5487 equ $5487
label_54AC equ $54AC
label_54F5 equ $54F5
label_54F8 equ $54F8
label_5526 equ $5526
label_556B equ $556B
label_5570 equ $5570
label_55CA equ $55CA
label_55CF equ $55CF
label_5626 equ $5626
label_563B equ $563B
label_5690 equ $5690
label_5795 equ $5795
label_57E0 equ $57E0
label_5800 equ $5800
label_5838 equ $5838
label_5884 equ $5884
label_588B equ $588B
label_5897 equ $5897
label_5900 equ $5900
label_5904 equ $5904
label_593B equ $593B
label_59DE equ $59DE
label_59EE equ $59EE
label_59FE equ $59FE
label_5A1A equ $5A1A
label_5A1E equ $5A1E
label_5A2E equ $5A2E
label_5C00 equ $5C00
label_5C1A equ $5C1A
label_5C2C equ $5C2C
label_5C63 equ $5C63
label_5D50 equ $5D50
label_5D6A equ $5D6A
label_5E67 equ $5E67
label_5EAB equ $5EAB
label_5F02 equ $5F02
label_5F2E equ $5F2E
label_5F4B equ $5F4B
label_6000 equ $6000
label_6080 equ $6080
label_60E0 equ $60E0
label_6100 equ $6100
label_61EE equ $61EE
label_6200 equ $6200
label_6203 equ $6203
label_62CE equ $62CE
label_6302 equ $6302
label_6352 equ $6352
label_6414 equ $6414
label_6472 equ $6472
label_64CC equ $64CC
label_6500 equ $6500
label_6513 equ $6513
label_6524 equ $6524
label_6576 equ $6576
label_6600 equ $6600
label_6700 equ $6700
label_6709 equ $6709
label_6710 equ $6710
label_6749 equ $6749
label_67E5 equ $67E5
label_6800 equ $6800
label_6818 equ $6818
label_6827 equ $6827
label_6843 equ $6843
label_68E0 equ $68E0
label_6900 equ $6900
label_6930 equ $6930
label_6A22 equ $6A22
label_6A30 equ $6A30
label_6AC1 equ $6AC1
label_6AF8 equ $6AF8
label_6B1D equ $6B1D
label_6BA4 equ $6BA4
label_6BB5 equ $6BB5
label_6BDC equ $6BDC
label_6BDE equ $6BDE
label_6C00 equ $6C00
label_6C24 equ $6C24
label_6C4F equ $6C4F
label_6C6B equ $6C6B
label_6C75 equ $6C75
label_6C7A equ $6C7A
label_6CA7 equ $6CA7
label_6CC6 equ $6CC6
label_6CCE equ $6CCE
label_6CE3 equ $6CE3
label_6D0E equ $6D0E
label_6D32 equ $6D32
label_6D4D equ $6D4D
label_6D52 equ $6D52
label_6DAF equ $6DAF
label_6E00 equ $6E00
label_6E10 equ $6E10
label_6E1D equ $6E1D
label_6E2B equ $6E2B
label_6E50 equ $6E50
label_6E73 equ $6E73
label_6EB3 equ $6EB3
label_7000 equ $7000
label_703E equ $703E
label_705A equ $705A
label_70B3 equ $70B3
label_70D3 equ $70D3
label_70D6 equ $70D6
label_7161 equ $7161
label_725A equ $725A
label_72AB equ $72AB
label_72BA equ $72BA
label_73EB equ $73EB
label_73F3 equ $73F3
label_7405 equ $7405
label_7500 equ $7500
label_754F equ $754F
label_755B equ $755B
label_7578 equ $7578
label_75A2 equ $75A2
label_75F5 equ $75F5
label_7600 equ $7600
label_763B equ $763B
label_7830 equ $7830
label_783C equ $783C
label_7855 equ $7855
label_785A equ $785A
label_7893 equ $7893
label_78E8 equ $78E8
label_7964 equ $7964
label_7995 equ $7995
label_7A5F equ $7A5F
label_7A9A equ $7A9A
label_7B77 equ $7B77
label_7C00 equ $7C00
label_7C50 equ $7C50
label_7CAB equ $7CAB
label_7D00 equ $7D00
label_7D7C equ $7D7C
label_7DE6 equ $7DE6
label_7E00 equ $7E00
label_7E09 equ $7E09
label_7E44 equ $7E44
label_7E45 equ $7E45
label_7EC7 equ $7EC7
label_7EFE equ $7EFE
label_7F00 equ $7F00
label_7F80 equ $7F80
label_7FC5 equ $7FC5

label_8000 equ $8000
label_8200 equ $8200
label_8400 equ $8400
label_8460 equ $8460
label_8480 equ $8480
label_8700 equ $8700
label_8800 equ $8800
label_88E0 equ $88E0
label_89A0 equ $89A0
label_89D0 equ $89D0
label_8C00 equ $8C00
label_8CA0 equ $8CA0
label_8D00 equ $8D00
label_8E00 equ $8E00
label_8F00 equ $8F00
label_9000 equ $9000
label_9040 equ $9040
label_9080 equ $9080
label_90C0 equ $90C0
label_9100 equ $9100
label_9140 equ $9140
label_9200 equ $9200
label_9500 equ $9500
label_9690 equ $9690
label_96C0 equ $96C0
label_9790 equ $9790
label_97F0 equ $97F0
label_9800 equ $9800
label_990E equ $990E
label_A161 equ $A161
label_D942 equ $D942
label_F7F0 equ $F7F0
label_FAFA equ $FAFA
label_FF44 equ $FF44
label_FF90 equ $FF90
label_FF91 equ $FF91
label_FF92 equ $FF92
label_FF96 equ $FF96
label_FF97 equ $FF97
label_FF98 equ $FF98
label_FF9A equ $FF9A
label_FF9D equ $FF9D
label_FFA1 equ $FFA1
label_FFA2 equ $FFA2
label_FFB4 equ $FFB4
label_FFC0 equ $FFC0
label_FFD7 equ $FFD7
label_FFDA equ $FFDA
;label_FFE4 equ $FFE4
label_FFE7 equ $FFE7
label_FFED equ $FFED
label_FFEE equ $FFEE
label_FFF4 equ $FFF4
label_FFF6 equ $FFF6

section "Main", rom0

Start:
    cp   $11
    jr   nz, label_16E
    ld   a, [$FF4D]
    and  $80
    jr   nz, label_167
    ld   a, $30
    ld   [rJOYP], a
    ld   a, $01
    ld   [rKEY1], a
    xor  a
    ld   [rIE], a
    stop

label_167::
    xor  a

data_0168::
    ld   [rSVBK], a
    ld   a, $01
    jr   label_16F

label_16E::
    xor  a

label_16F::
    ld   [$FFFE], a
    call label_28CF
    ld   sp, $DFFF
    ld   a, $3C
    ld   [SelectRomBank_2100], a
    call label_6A22
    xor  a
    ld   [rBGP], a
    ld   [rOBP0], a
    ld   [rOBP1], a
    ld   hl, $8000
    ld   bc, $1800
    call ZeroMemory
    ld   a, $24
    ld   [SelectRomBank_2100], a
    call label_5C00
    call label_28F7
    call label_29D0
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_6D32
    call label_FFC0
    call label_410D
    call label_2BCF
    ld   a, $44
    ld   [rSTAT], a
    ld   a, $4F
    ld   [rLYC], a
    ld   a, $01
    ld   [$DBAF], a
    ld   a, $01
    ld   [rIE], a
    call label_46AA
    ld   a, $1F
    ld   [SelectRomBank_2100], a
    call label_4000
    ld   a, $18
    ld   [$FFB5], a
    ei
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4854
    jp   label_35F

label_1DA::
    ld   a, $01
    ld   [$FFFD], a
    ld   a, [$C500]
    and  a
    jr   z, label_1F2
    ld   a, [$DB95]
    cp   $0B
    jr   nz, label_1F2
    ld   a, [$FFE7]
    rrca
    and  $80
    jr   label_1F8

label_1F2::
    ld   hl, $C156
    ld   a, [$FF97]
    add  a, [hl]

label_1F8::
    ld   [rSCY], a
    ld   a, [$FF96]
    ld   hl, $C155
    add  a, [hl]

label_200::
    ld   hl, $C1BF
    add  a, [hl]
    ld   [rSCX], a
    ld   a, [$D6FE]
    and  a
    jr   nz, label_213
    ld   a, [$D6FF]
    cp   $00
    jr   z, label_23D

label_213::
    ld   a, [$DB95]
    cp   $09
    jr   z, label_229
    cp   $06
    jr   c, label_229
    cp   $0B
    jr   nz, label_22F
    ld   a, [$DB96]
    cp   $07
    jr   nc, label_22F

label_229::
    call label_8A4
    call label_8A4

label_22F::
    di
    call label_419
    ei
    call label_8A4
    call label_8A4
    jp   label_35F

label_23D::
    ld   a, [$D6FD]
    and  $7F
    ld   e, a
    ld   a, [$FF40]
    and  $80
    or   e
    ld   [rLCDC], a
    ld   hl, $FFE7
    inc  [hl]
    ld   a, [$DB95]
    cp   $00
    jr   nz, label_264
    ld   a, [$DB96]
    cp   $08
    jr   c, label_264
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_5257

label_264::
    ld   a, [$C17F]
    and  a
    jp   z, label_2D5
    inc  a
    jr   nz, label_279

label_26E::
    ld   a, $17
    ld   [SelectRomBank_2100], a
    call label_48DD
    jp   label_2D5

label_279::
    inc  a
    jr   z, label_26E
    ld   a, $14
    ld   [SelectRomBank_2100], a
    ld   a, [$C180]
    inc  a
    ld   [$C180], a
    cp   $C0
    jr   nz, label_2A0
    ld   a, [$C17F]
    cp   $02
    jr   nz, label_296
    call label_4E51

label_296::
    xor  a
    ld   [$C17F], a
    ld   [$C3CA], a
    jp   label_2D5

label_2A0::
    push af
    cp   $60
    jr   c, label_2B7
    ld   a, [$FFFE]
    and  a
    jr   z, label_2B4
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6CA7
    jr   label_2B7

label_2B4::
    call label_4FE8

label_2B7::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    pop  af
    call label_5038
    call label_8A4
    ld   a, [$DB97]
    ld   [rBGP], a
    ld   a, [$DB98]
    ld   [rOBP0], a
    ld   a, [$DB99]
    ld   [rOBP1], a
    jp   label_35F

label_2D5::
    ld   a, [$DB9A]
    ld   [rWY], a
    ld   a, [$DB97]
    ld   [rBGP], a
    ld   a, [$DB98]
    ld   [rOBP0], a
    ld   a, [$DB99]
    ld   [rOBP1], a
    call label_8A4
    call label_281E
    ld   a, [$FF90]
    ld   hl, $FF91
    or   [hl]
    ld   hl, $C10E
    or   [hl]
    jr   nz, label_35F
    ld   a, [$0003]
    and  a
    jr   z, label_32D
    ld   a, [$D6FC]
    and  a
    jr   nz, label_30D
    ld   a, [$FFCB]
    and  $0F
    jr   z, label_327

label_30D::
    ld   a, [$FFCC]
    and  $40
    jr   z, label_327
    ld   a, [$D6FC]
    xor  $01
    ld   [$D6FC], a
    jr   nz, label_35F
    ld   a, [$C17B]
    xor  $10
    ld   [$C17B], a
    jr   label_35F

label_327::
    ld   a, [$D6FC]
    and  a
    jr   nz, label_35F

label_32D::
    ld   a, [$DB95]
    cp   $0C
    jr   nz, label_33B
    ld   a, [$DB96]
    cp   $02
    jr   c, label_343

label_33B::
    ld   a, $01
    call label_80C
    call label_5F2E

label_343::
    call label_E34
    ld   a, [$FFFE]
    and  a
    jr   z, label_353
    ld   a, $21
    call label_80C
    call label_406E

label_353::
    xor  a
    ld   [$DDD2], a
    ld   a, $01
    call label_80C
    call label_5F4B

label_35F::
    ld   a, $1F
    call label_80C
    call label_7F80
    ld   a, $0C
    call label_B0B
    call label_80C
    xor  a
    ld   [$FFFD], a
    halt

label_374::
    ld   a, [$FFD1]
    and  a
    jr   z, label_374
    xor  a
    ld   [$FFD1], a
    jp   label_1DA

data_037F::
    db $20

label_380:
    db $30, $40, $60, 0

data_0384::
    db $30, $56, $68, 0

func_0388::
    di
    push af
    push hl
    push de
    push bc
    ld   a, [$FF70]
    ld   c, a
    xor  a
    ld   [rSVBK], a
    ld   a, [$DB95]
    cp   $01
    jr   nz, label_3AD
    ld   a, [$DB96]
    cp   $05
    jr   nz, label_3A6
    ld   a, [$D000]
    jr   label_3A8

label_3A6::
    ld   a, [$FF97]

label_3A8::
    ld   [rSCY], a
    jp   label_3FF

label_3AD::
    cp   $00
    jr   nz, label_3FC

label_3B1::
    ld   a, [$C105]
    ld   e, a
    ld   d, $00
    ld   hl, $C100
    add  hl, de
    ld   a, [hl]
    ld   hl, $FF96
    add  a, [hl]
    ld   [rSCX], a
    ld   a, [$DB96]
    cp   $06
    jr   c, label_3D9
    ld   hl, data_0384
    add  hl, de
    ld   a, [hl]
    ld   [rLYC], a
    ld   a, e
    inc  a
    and  $03
    ld   [$C105], a
    jr   label_3FF

label_3D9::
    ld   hl, data_037F

label_3DC::
    add  hl, de
    ld   a, [hl]
    ld   [rLYC], a
    ld   a, e
    inc  a
    cp   $05
    jr   nz, label_3E7
    xor  a

label_3E7::
    ld   [$C105], a
    nop
    cp   $04
    jr   nz, label_3FF
    ld   a, [$C106]
    ld   [rSCY], a
    cpl
    inc  a
    add  a, $60
    ld   [rLYC], a
    jr   label_3FF

label_3FC::
    xor  a
    ld   [rSCX], a

label_3FF::
    ld   a, c

label_400::
    ld   [rSVBK], a

label_402::
    pop  bc
    pop  de
    pop  hl
    pop  af
    ei
    reti

func_0408::
    push af
    ld   a, $28
    ld   [SelectRomBank_2100], a
    call label_4601
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    pop  af
    reti

label_419::
    ld   a, [$D6FE]
    and  a
    jr   z, label_43A
    ld   [$DDD2], a
    cp   $23
    jr   z, label_42B
    push af
    call label_28CF
    pop  af

label_42B::
    call label_430
    jr   label_45D

label_430::
    ld   e, a
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4657
    jp   [hl]

label_43A::
    call label_28CF
    ld   a, $24
    ld   [SelectRomBank_2100], a
    call label_5C2C
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4577
    ld   a, $08
    ld   [SelectRomBank_2100], a
    call label_292D
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a

label_45D::
    xor  a
    ld   [$D6FF], a
    ld   [$D6FE], a
    ld   a, [$D6FD]
    ld   [rLCDC], a
    ret

data_046A::
    db   7, 9

func_046C::
    push af
    push bc
    push de
    push hl
    ld   a, [$FF70]
    and  $07
    ld   c, a
    xor  a
    ld   [rSVBK], a
    push bc
    di
    ld   a, [$DB95]
    cp   $0D
    jr   nz, label_48D
    ld   a, [$DB96]
    cp   $09
    jr   c, label_48D
    cp   $12
    jp  c, label_577

label_48D::
    ld   a, [$FFFD]
    and  a
    jp   nz, label_569
    ld   a, [$C19F]
    and  $7F
    jr   z, label_4CC
    cp   $01
    jr   z, label_4CC
    cp   $05
    jr   nc, label_4AC
    call label_23E4
    ld   hl, $C19F
    inc  [hl]
    jp   label_569

label_4AC::
    cp   $0A
    jr   nz, label_4B6
    call label_2719
    jp   label_569

label_4B6::
    cp   $0B
    jr   nz, label_4CC
    ld   a, [$C172]
    and  a
    jr   z, label_4C6
    dec  a
    ld   [$C172], a
    jr   label_4CC

label_4C6::
    call label_276D
    jp   label_569

label_4CC::
    ld   a, [$DB95]
    cp   $0E
    jr   c, label_4E4
    ld   a, [$DB96]
    cp   $06
    jr   c, label_52B
    ld   a, $38
    ld   [SelectRomBank_2100], a
    call label_785A
    jr   label_52B

label_4E4::
    ld   a, [$D6FE]
    and  a
    jr   nz, label_569
    ld   a, [$FF90]
    ld   [$FFE8], a
    ld   hl, $FF91
    or   [hl]
    ld   hl, $C10E
    or   [hl]
    jr   z, label_509
    call label_5BC
    ld   a, [$FFE8]
    cp   $08
    jr   nc, label_504

label_501::
    call label_1D2E

label_504::
    call label_FFC0
    jr   label_569

label_509::
    ld   a, [$FFBB]
    and  a
    jr   z, label_521
    dec  a
    ld   [$FFBB], a
    ld   e, a
    ld   d, $00
    ld   hl, data_046A
    add  hl, de
    ld   a, [hl]
    ld   [$D6F8], a
    call label_1ED7
    jr   label_501

label_521::
    ld   a, [$DB95]
    cp   $0D
    jr   z, label_52B
    call label_1B0D

label_52B::
    ld   a, [$FFFE]
    and  a
    jr   z, label_538
    ld   a, $24
    ld   [SelectRomBank_2100], a
    call label_5C1A

label_538::
    ld   de, $D601
    call label_2927
    xor  a
    ld   [$D600], a
    ld   [$D601], a
    ld   [$DC90], a
    ld   [$DC91], a
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_72BA
    call label_FFC0
    ld   a, [$FFFE]
    and  a
    jr   z, label_569
    ld   a, $21
    ld   [SelectRomBank_2100], a
    call label_4000
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a

label_569::
    ei

label_56A::
    pop  bc
    ld   a, c
    ld   [rSVBK], a
    pop  hl
    pop  de
    pop  bc
    ld   a, $01
    ld   [$FFD1], a
    pop  af
    reti

label_577::
    ld   a, [$DBAF]
    push af
    ld   a, [$FFFD]
    and  a
    jr   nz, label_5AB
    call label_FFC0
    ld   a, [$FFFE]
    and  a
    jr   z, label_598
    ld   a, $21
    call label_80C
    call label_4000
    ld   a, $24
    call label_80C
    call label_5C1A

label_598::
    ld   de, $D601
    call label_2927
    xor  a
    ld   [$D600], a
    ld   [$D601], a
    ld   [$DC90], a
    ld   [$DC91], a

label_5AB::
    ld   a, $28
    call label_80C
    call label_4616
    pop  af
    ld   [$DBAF], a
    ld   [SelectRomBank_2100], a
    jr   label_56A

label_5BC::
    ld   a, [$FF90]
    and  a
    jp   z, label_69E
    cp   $07
    jp   z, label_7B0
    cp   $03
    jp   z, $0062
    cp   $04
    jp   z, $006A
    cp   $05
    jp   z, $0072
    cp   $06
    jp   z, $007A
    cp   $08
    jp   nc, label_7D3
    ld   a, [$DBA5]
    and  a
    jp   z, label_656
    ld   a, [$FF90]
    cp   $02
    jp   z, label_826
    ld   a, $0D
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   a, [$FF92]
    ld   c, a
    ld   b, $00
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
    ld   hl, $9000
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   hl, $5000
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_62F
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4616
    ld   [SelectRomBank_2100], a
    jr   label_641

label_62F::
    ld   a, [$FF94]
    add  a, $50
    ld   h, a
    add  hl, bc
    ld   a, [$FFBB]
    and  a
    jr   z, label_641
    ld   a, [$FF92]
    dec  a
    cp   $02
    jr   c, label_647

label_641::
    ld   bc, $0040
    call CopyData

label_647::
    ld   a, [$FF92]
    inc  a
    ld   [$FF92], a
    cp   $04
    jr   nz, label_655
    xor  a
    ld   [$FF90], a
    ld   [$FF92], a

label_655::
    ret

label_656::
    ld   a, $0F
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   a, [$FF92]
    ld   c, a
    ld   b, $00
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
    call CopyData
    ld   a, [$FF92]
    inc  a
    ld   [$FF92], a
    cp   $08
    jr   nz, label_69D
    xor  a
    ld   [$FF90], a
    ld   [$FF92], a

label_69D::
    ret

label_69E::
    ld   a, [$FFFE]
    and  a
    jr   z, label_6CB
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_6CB
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_475A
    xor  a
    ld   [$C10E], a
    ld   [$C10F], a
    ld   hl, $9000
    ld   bc, $0000
    call label_4616
    ld   c, $90
    ld   b, h
    ld   h, $00
    call label_A13
    jr   label_738

label_6CB::
    ld   a, [$FF91]
    and  a
    jp   z, label_73E
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
    swap a
    rra
    rra
    and  $03
    ld   c, a
    ld   b, $00
    ld   hl, data_2E6F
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_6F7
    call label_B0B

label_6F7::
    ld   [SelectRomBank_2100], a
    ld   a, [$FF93]
    ld   c, a
    ld   b, $00
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
    call CopyData
    ld   a, [$FF93]
    inc  a
    ld   [$FF93], a
    cp   $04
    jr   nz, label_73D

label_738::
    xor  a
    ld   [$FF91], a
    ld   [$FF93], a

label_73D::
    ret

label_73E::
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
    swap a
    rra
    rra
    and  $03
    ld   c, a
    ld   b, $00
    ld   hl, data_2E6F
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_764
    call label_B0B

label_764::
    ld   [SelectRomBank_2100], a
    ld   a, [$C10F]
    ld   c, a
    ld   b, $00
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
    call CopyData
    ld   a, [$C10F]
    inc  a
    ld   [$C10F], a
    cp   $04
    jr   nz, label_7AF
    xor  a
    ld   [$C10E], a
    ld   [$C10F], a

label_7AF::
    ret

label_7B0::
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_6BB5
    jp   $008B

data_07BB::
    db   $60, $69, $A0, $69, $C0, $69, 0, $42, $40, $42, $60, $42

data_07C7::
    db   0, $82, $40, $82, $60, $82, 0, $82, $40, $82, $60, $82

label_7D3::
    sub  a, $08
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, data_07BB
    add  hl, de
    push hl
    ld   hl, data_07C7
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    pop  hl
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   bc, $0040
    call CopyData
    ld   a, [$FF90]
    cp   $0A
    jr   z, label_808
    cp   $0D

label_800::
    jr   z, label_808

label_802::
    ld   a, [$FF90]
    inc  a

label_805::
    ld   [$FF90], a
    ret

label_808::
    xor  a
    ld   [$FF90], a
    ret

label_80C::
    ld   [$DBAF], a
    ld   [SelectRomBank_2100], a
    ret

label_813::
    call label_B0B

label_816::
    ld   [$DBAF], a
    ld   [SelectRomBank_2100], a
    ret

label_81D::
    push af
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    pop  af
    ret

label_826::
    ld   a, $12
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   a, [$FF92]
    cp   $08
    jr   c, label_873
    jr   nz, label_843
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_6843

label_83E::
    ld   hl, $FF92
    inc  [hl]
    ret

label_843::
    cp   $09
    jr   nz, label_854
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_6827
    ld   hl, $FF92
    inc  [hl]
    ret

label_854::
    cp   $0A
    jr   nz, label_865
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_680B
    ld   hl, $FF92
    inc  [hl]
    ret

label_865::
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_67E5
    xor  a
    ld   [$FF90], a
    ld   [$FF92], a
    ret

label_873::
    ld   c, a
    ld   b, $00
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
    ld   hl, $8D00
    add  hl, bc
    ld   e, l
    ld   d, h
    ld   hl, $7E00
    add  hl, bc
    ld   bc, $0040
    call CopyData
    ld   a, [$FF92]
    inc  a
    ld   [$FF92], a
    ret

label_8A4::
    ld   a, $1F
    call label_80C
    call label_4006
    ld   a, [$FFF3]
    and  a
    jr   nz, label_8D6
    ld   a, [$C10B]
    and  a
    jr   z, label_8C6
    cp   $02
    jr   nz, label_8C3
    ld   a, [$FFE7]
    and  $01
    jr   nz, label_8D6
    jr   label_8C6

label_8C3::
    call label_8C6

label_8C6::
    ld   a, $1B
    call label_80C
    call label_4006
    ld   a, $1E
    call label_80C
    call label_4006

label_8D6::
    ret

label_8D7::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6A30

label_8DF::
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

label_8E6::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6AC1
    jr   label_8DF

label_8F0::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6BA4
    jr   label_8DF

label_8FA::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6BDC
    jr   label_973

label_905::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6C00
    jr   label_917

label_90F::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6C24

label_917::
    ld   a, $01
    ld   [SelectRomBank_2100], a
    ret

label_91D::
    push af
    ld   b, $00
    ld   a, [$DDD8]
    sla  a
    rl   b
    sla  a
    rl   b
    ld   c, a
    jr   label_92F
    push af

label_92F::
    ld   a, $1A
    ld   [SelectRomBank_2100], a
    call label_6576
    ld   a, [$FFDF]
    ld   [SelectRomBank_2100], a
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

label_973::
    pop  af
    ld   [SelectRomBank_2100], a
    ret

label_978::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6D0E
    jr   label_973

label_983::
    ld   a, $1A
    ld   [SelectRomBank_2100], a
    call label_6710
    ld   a, [$FFDF]
    ld   [SelectRomBank_2100], a
    ld   a, [$FFE0]
    ld   h, a
    ld   a, [$FFE1]
    ld   l, a
    ld   a, [hl]
    inc  de
    ret

label_999::
    push af
    push bc
    call label_983
    ld   [$FFD7], a
    pop  bc
    call label_983
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
    jr   label_973

label_9C8::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4985
    jr   label_973

label_9D3::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4518
    jr   label_973

label_9DE::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4874
    jr   label_973

label_9E9::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4954
    jp   label_973

label_9F5::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_482D
    jp   label_973

label_A01::
    push hl
    ld   l, $00
    ld   e, l
    ld   h, b
    ld   a, c
    add  a, $80
    ld   d, a
    ld   bc, $0100
    call CopyData
    pop  hl
    jr   label_A2D

label_A13::
    ld   [SelectRomBank_2100], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_A01
    ld   a, b
    ld   [rHDMA1], a
    ld   a, $00
    ld   [rHDMA2], a
    ld   a, c
    ld   [rHDMA3], a
    ld   a, $00
    ld   [rHDMA4], a
    ld   a, $0F
    ld   [rHDMA5], a

label_A2D::
    ld   a, h
    ld   [SelectRomBank_2100], a
    ret

label_A32::
    push af
    ld   a, $35
    ld   [SelectRomBank_2100], a
    ld   hl, $4F00
    ld   de, $DCC0
    ld   bc, $0020
    call CopyData
    jp   label_973

label_A47::
    push af
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_505F
    jp   label_973

label_A53::
    push af
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_4F9B
    jp   label_973

label_A5F::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_3CE6
    jp   label_973

label_A6B::
    push af
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_5A2E
    jp   label_973

label_A77::
    push af
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_4F68
    jp   label_973

label_A83::
    push af
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6D52
    jp   label_973

label_A8F::
    push af
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_4BE8
    jp   label_973

label_A9B::
    push af
    ld   a, $0F
    call label_80C
    call label_2321
    jp   label_973

label_AA7::
    push af
    ld   a, $36
    call label_80C
    call label_705A

label_AB0::
    pop  af
    call label_80C
    ret

label_AB5::
    push af
    ld   a, $24
    ld   [SelectRomBank_2100], a
    call label_5C1A
    ld   de, $D601
    call label_2927
    jr   label_AB0

label_AC6::
    push af
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_703E
    jp   label_973

label_AD2::
    push af
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_70D6
    jp   label_973

label_ADE::
    push af
    ld   a, $36
    call label_80C
    call label_4A77
    jp   label_973

label_AEA::
    push af
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_4A4C
    jp   label_973

label_AF6::
    push af
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_7161
    jp   label_973

label_B02::
    ld   a, $3D
    ld   [SelectRomBank_2100], a
    call label_4029
    ret

label_B0B::
    push bc
    ld   b, a
    ld   a, [$FFFE]
    and  a
    jr   z, label_B17
    ld   a, b
    or   $20
    pop  bc
    ret

label_B17::
    ld   a, b
    pop  bc
    ret
    ld   a, [$FFD7]
    ld   [SelectRomBank_2100], a
    ld   a, $02
    ld   [rSVBK], a
    call CopyData
    xor  a
    ld   [rSVBK], a
    ld   a, $20
    ld   [SelectRomBank_2100], a
    ret

label_B2F::
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
    jr   nz, label_B4B
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6E50
    jr   c, label_B54

label_B4B::
    ld   b, [hl]
    ld   a, $02
    ld   [rSVBK], a
    ld   [hl], b
    xor  a
    ld   [rSVBK], a

label_B54::
    ld   a, [$FFD9]
    and  $7F
    ld   [SelectRomBank_2100], a
    pop  bc
    ret
    ld   [SelectRomBank_2100], a
    call CopyData
    ld   a, $28
    ld   [SelectRomBank_2100], a
    ret
    push hl
    ld   [SelectRomBank_2100], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_B80
    ld   de, data_0168
    add  hl, de
    ld   a, $01
    ld   [rVBK], a
    call label_B96
    xor  a
    ld   [rVBK], a

label_B80::
    pop  hl
    push hl
    call label_B96
    pop  hl
    ld   a, [$DB95]
    cp   $0D
    jr   nz, label_B90
    call label_BB5

label_B90::
    ld   a, [$FFE6]
    ld   [SelectRomBank_2100], a
    ret

label_B96::
    ld   de, $9800

label_B99::
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, e
    and  $1F
    cp   $14
    jr   nz, label_B99
    ld   a, e
    add  a, $0C
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    cp   $9A
    jr   nz, label_B99
    ld   a, e
    cp   $40
    jr   nz, label_B99
    ret

label_BB5::
    ld   bc, data_0168
    ld   de, $D000
    jp   CopyData
    push af
    call label_2BCF
    jp   label_973
    ld   a, [$D16A]
    ld   [SelectRomBank_2100], a

label_BCB::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  b
    jr   nz, label_BCB
    ld   a, $28
    ld   [SelectRomBank_2100], a
    ret

label_BD7::
    ld   a, [$DE01]
    ld   [SelectRomBank_2100], a
    call label_BE7
    ld   a, [$DE04]
    ld   [SelectRomBank_2100], a
    ret

label_BE7::
    ld   a, [$DE02]
    ld   h, a
    ld   a, [$DE03]
    ld   l, a
    jp   [hl]
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_1A50
    jp   label_81D

label_BFB::
    ld   hl, $C450
    jr   label_C08

label_C00::
    ld   hl, $C2F0
    jr   label_C08

label_C05::
    ld   hl, $C2E0

label_C08::
    add  hl, bc
    ld   a, [hl]
    and  a
    ret
    ld   a, $AF
    call label_3B86
    ld   a, [$FF98]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$FF99]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    ret

label_C20::
    ld   a, $1D
    ld   [$FFF2], a
    ret

label_C25::
    ld   hl, $4641
    jr   label_C2D

label_C2A::
    ld   hl, $4741

label_C2D::
    ld   a, $1C
    ld   [SelectRomBank_2100], a
    add  hl, bc
    ld   a, [hl]
    ld   hl, SelectRomBank_2100
    ld   [hl], $01
    ret

label_C3A::
    ld   a, $0C
    ld   [SelectRomBank_2100], a
    ld   bc, $0040
    call CopyData
    ld   a, $01
    ld   [SelectRomBank_2100], a
    ret

label_C4B::
    ld   hl, $FFF4
    ld   [hl], $0C

label_C50::
    ld   hl, $C502
    ld   [hl], $04
    ret

label_C56::
    ld   hl, $C410
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_C5F
    dec  [hl]

label_C5F::
    ret

label_C60::
    push af
    ld   a, [$C18F]
    and  a
    jr   nz, label_C7B
    ld   [$C1CF], a
    inc  a
    ld   [$C18F], a
    ld   [$C5A6], a
    ld   a, [$C19D]
    and  a
    jr   nz, label_C7B
    ld   a, $02
    ld   [$FFF2], a

label_C7B::
    pop  af
    ret

label_C7D::
    ld   a, $30
    ld   [$FFA8], a
    jr   label_C9A
    ld   a, $30
    ld   [$FFA8], a
    jr   label_C9E
    ld   a, [$D401]
    cp   $01
    jr   nz, label_C7D
    ld   a, [$DBA5]
    and  a
    jr   z, label_C7D
    ld   a, $01
    ld   [$FFBC], a

label_C9A::
    ld   a, $06
    ld   [$FFF4], a

label_C9E::
    ld   a, $03
    ld   [$C11C], a
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$D478], a
    and  a
    ret

label_CAF::
    xor  a
    ld   [WR0_IsUsingSpinAttack], a
    ld   [$C122], a

label_CB6::
    xor  a
    ld   [$C14B], a
    ld   [$C14A], a
    ret

label_CBE::
    ld   a, [$FF9F]
    ld   [$FF98], a
    ld   a, [$FFA0]
    ld   [$FF99], a
    ret

label_CC7::
    push af
    ld   e, $0F
    ld   d, $00

label_CCC::
    ld   hl, $C510
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_CEC
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, label_CCC
    ld   hl, $C5C0
    dec  [hl]
    ld   a, [hl]
    cp   $FF
    jr   nz, label_CE8
    ld   a, $0F
    ld   [$C5C0], a

label_CE8::
    ld   a, [$C5C0]
    ld   e, a

label_CEC::
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

label_D07::
    ld   a, [$C140]
    sub  a, $08
    ld   [$FFD7], a
    ld   a, [$C142]
    sub  a, $08
    ld   [$FFD8], a

label_D15::
    ld   a, $07
    ld   [$FFF2], a
    ld   a, $05
    jp   label_CC7

label_D1E::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_D59
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, $6EB3
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_D3C
    ld   hl, $70B3
    jr   label_D45

label_D3C::
    cp   $1A
    jr   nc, label_D45
    cp   $06
    jr   c, label_D45
    inc  h

label_D45::
    add  hl, de
    ld   a, [$FF94]
    ld   e, a
    ld   a, [hl]
    cp   e
    jr   z, label_D57
    ld   [$FF94], a
    cp   $FF
    jr   z, label_D57
    ld   a, $01
    ld   [$FF90], a

label_D57::
    jr   label_D91

label_D59::
    ld   a, [$FFF6]
    cp   $07
    jr   nz, label_D60
    inc  a

label_D60::
    ld   d, a
    srl  a
    srl  a
    and  $F8
    ld   e, a
    ld   a, d
    srl  a
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
    jr   z, label_D91
    cp   $0F
    jr   z, label_D91
    cp   $1A
    jr   nz, label_D8B
    ld   a, [$FFF6]
    cp   $37
    jr   nz, label_D91
    ld   a, [hl]

label_D8B::
    ld   [$FF94], a
    ld   a, $01
    ld   [$FF90], a

label_D91::
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
    jr   nc, label_DAB
    cp   $06
    jr   c, label_DAB
    inc  d

label_DAB::
    add  hl, de
    ld   e, [hl]
    ld   a, d
    and  a
    jr   z, label_DC1
    ld   a, [$FFF7]
    cp   $10
    jr   nz, label_DDB
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, label_DDB
    ld   e, $3D
    jr   label_DDB

label_DC1::
    ld   a, e
    cp   $23
    jr   nz, label_DCE
    ld   a, [$D8C9]
    and  $20
    jr   z, label_DCE
    inc  e

label_DCE::
    ld   a, e
    cp   $21
    jr   nz, label_DDB
    ld   a, [$D8FD]
    and  $20
    jr   z, label_DDB
    inc  e

label_DDB::
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_DF1
    ld   a, $01
    ld   [$FF91], a
    jr   label_E31

label_DF1::
    ld   hl, $73F3
    ld   a, [$DBA5]
    and  a
    jr   z, label_DFD
    ld   hl, $763B

label_DFD::
    add  hl, de
    ld   d, $00
    ld   bc, $C193

label_E03::
    ld   e, [hl]
    ld   a, [bc]
    cp   e
    jr   z, label_E29
    ld   a, e
    cp   $FF
    jr   z, label_E29
    ld   [bc], a
    ld   a, [$FFD7]
    and  a
    jr   z, label_E1E
    ld   a, d
    ld   [$C10D], a
    ld   a, $01
    ld   [$C10E], a
    jr   label_E29

label_E1E::
    inc  a
    ld   [$FFD7], a
    ld   a, d
    ld   [$C197], a
    ld   a, $01
    ld   [$FF91], a

label_E29::
    inc  hl
    inc  bc
    inc  d
    ld   a, d
    cp   $04
    jr   nz, label_E03

label_E31::
    jp   label_81D

label_E34::
    ld   a, [$DB95]
    cp   $07
    jr   c, label_E85
    cp   $0B
    jr   nz, label_E46
    ld   a, [$DB96]
    cp   $07
    jr   nz, label_E85

label_E46::
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_E85
    ld   a, [$C19F]
    ld   hl, $C167
    or   [hl]
    ld   hl, $C124
    or   [hl]
    jr   nz, label_E85
    ld   a, [$DB95]
    cp   $0C
    jr   nc, label_E85
    ld   a, [$FFCB]
    cp   $F0
    jr   nz, label_E85
    ld   a, [$D474]
    and  a
    jr   nz, label_E85
    ld   a, [$D464]
    and  a
    jr   nz, label_E85
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$C19F], a
    ld   [$DB96], a
    ld   a, $06
    ld   [$DB95], a

label_E85::
    ld   a, [$DB95]
    rst  0

label_E89::
    db $DF, $E, $E2, $E, $E, $F, $11, $F, $14, $F, $17, $F, $D7, $E, $D1, $E
    db $C5, $E, $CB, $E, $BF, $E, $1A, $F, $2D, $F, $35, $F, $40, $F, $40, $F
    db $40, $F, $40, $F, $40, $F, $40, $F, $40, $F, $40, $F, $40, $F, $40, $F
    db $40, $F, $40, $F, $40, $F

label_EBF::
    call label_6AF8
    jp   label_101A

label_EC5::
    call label_67EE
    jp   label_101A

label_ECB::
    call label_6203
    jp   label_101A

label_ED1::
    call label_5626
    jp   label_101A

label_ED7::
    ld   a, $01
    call label_80C
    jp   label_4000

label_EDF::
    jp   label_6E1D

label_EE2::
    ld   a, $17
    call label_80C
    call label_4AB7
    jp   label_101A

label_EED::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    ld   a, $17

label_EF4::
    push af
    call label_398D
    pop  af
    jp   label_80C

label_EFC::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    ld   a, $01
    jr   label_EF4

label_F05::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    ld   a, $02
    jr   label_EF4

label_F0E::
    jp   label_47CE

label_F11::
    jp   label_4A07

label_F14::
    jp   label_4CFB

label_F17::
    jp   label_4F8C

label_F1A::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_4C4B
    call label_4ABC
    ld   a, $01
    call label_80C
    jp   label_4371

label_F2D::
    ld   a, $20
    call label_80C
    jp   label_5904

label_F35::
    ld   a, $28
    call label_80C
    call label_4000
    jp   label_101A

label_F40::
    ld   a, $37
    call label_80C
    jp   label_4000

label_F48::
    ld   a, $02
    call label_80C
    ld   a, [$C19F]
    and  a
    jr   nz, label_F8F
    ld   hl, $FFB4
    ld   a, [hl]
    and  a
    jr   z, label_F75
    ld   a, [$DB9A]
    cp   $80
    jr   nz, label_F75
    ld   a, [$C14F]
    and  a
    jr   nz, label_F75
    dec  [hl]
    jr   nz, label_F75
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_61EE
    call label_81D

label_F75::
    ld   a, [$C19F]
    and  a
    jr   nz, label_F8F
    ld   a, [$C1BC]
    and  a
    jr   z, label_F8F
    ld   hl, $FFA1
    ld   [hl], $02
    dec  a
    ld   [$C1BC], a
    jr   nz, label_F8F
    jp   label_C7D

label_F8F::
    ld   hl, $DBC7
    ld   a, [hl]
    and  a
    jr   z, label_F97
    dec  [hl]

label_F97::
    ld   a, [$FF98]
    ld   [$FF9F], a
    ld   a, [$FF99]
    ld   [$FFA0], a
    ld   hl, $FFA2
    sub  a, [hl]
    ld   [$FFB3], a
    call label_60E0
    xor  a
    ld   [$C140], a
    ld   [$C13C], a
    ld   [$C13B], a
    ld   hl, $C11D
    res  7, [hl]
    ld   hl, $C11E
    res  7, [hl]
    call label_593B
    ld   a, $02
    call label_80C
    call label_78E8
    call label_1033
    ld   a, [$C15C]
    ld   [$C3CF], a
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4B1F
    ld   a, $19
    call label_80C
    call label_7A9A
    call label_398D
    ld   a, $02
    call label_80C
    call label_5487
    ld   hl, $D601
    ld   a, [$FFE7]
    and  $03
    or   [hl]
    jr   nz, label_1012
    ld   a, [$C11C]
    cp   $02
    jr   nc, label_1012
    ld   c, $01
    ld   b, $00

label_1000::
    ld   e, $00
    ld   a, [$FFE7]
    and  $04

label_1006::
    jr   z, label_100A
    dec  c
    dec  e

label_100A::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_5C9C

label_1012::
    ld   a, $14
    call label_80C
    call label_54F8

label_101A::
    db $3E, $F, $CD, $C, 8

label_101F::
    db $CD, $21, $23, $F0, $FE, $A7, $C8, $3E, $24, $CD, $C, 8, $C3, 5

data_102D::
    db $74

label_102E::
    db 8, $E, $99, $28, $EC

label_1033::
    ld   a, [$FF99]
    ld   hl, $FFA2
    sub  a, [hl]
    ld   [$C145], a
    ld   a, [$C1A9]
    and  a
    jr   z, label_107F
    ld   a, [$C19F]
    and  a
    jr   nz, label_106D
    ld   hl, $C1AA
    dec  [hl]
    ld   a, [hl]
    cp   $02
    jr   nz, label_1061
    ld   a, [$C1A9]
    ld   e, a
    ld   d, $00
    ld   hl, data_102D
    add  hl, de
    ld   a, [hl]
    call label_2385
    ld   a, $01

label_1061::
    and  a
    jr   nz, label_106D
    xor  a
    ld   [$C1A9], a
    ld   [$C1A8], a
    jr   label_107F

label_106D::
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

label_107F::
    ld   a, [$FFCB]
    and  $B0
    jr   nz, label_10DB
    ld   a, [$FFCB]
    and  $40
    jr   z, label_10DB
    ld   a, [$D45F]
    inc  a
    ld   [$D45F], a
    cp   $04
    jr   c, label_10DF
    ld   a, [$FFA1]
    cp   $02
    jr   z, label_10DB
    ld   a, [$FF9D]
    cp   $FF
    jr   z, label_10DB
    ld   a, [$C11C]
    cp   $02
    jr   nc, label_10DB
    ld   a, [$C19F]
    ld   hl, $C167
    or   [hl]
    ld   hl, $C124
    or   [hl]
    jr   nz, label_10DB
    ld   a, [$D464]
    and  a
    jr   nz, label_10DB
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    ld   [$DB96], a
    ld   a, $07
    ld   [$DB95], a
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_755B
    call label_1D2E
    call label_398D
    pop  af
    ret

label_10DB::
    xor  a
    ld   [$D45F], a

label_10DF::
    ld   a, [$FFB7]
    and  a
    jr   z, label_10E7
    dec  a
    ld   [$FFB7], a

label_10E7::
    ld   a, [$FFB6]
    and  a
    jr   z, label_10EF
    dec  a
    ld   [$FFB6], a

label_10EF::
    ld   a, [$C19F]
    and  a
    jp   nz, label_1794
    ld   a, [$C124]
    and  a
    jp   nz, label_114F
    ld   a, [$C11C]
    cp   $07
    jr   z, label_1138
    ld   a, [$DB5A]
    ld   hl, $C50A
    or   [hl]
    ld   hl, $C14F
    or   [hl]
    jr   nz, label_1135
    ld   a, $07
    ld   [$C11C], a
    ld   a, $BF
    ld   [$FFB7], a
    ld   a, $10
    ld   [$C3CC], a
    xor  a

label_1120::
    ld   [$DBC7], a
    ld   [$FF9C], a
    ld   [$DDD6], a
    ld   [$DDD7], a
    ld   [$D464], a
    call label_27F2
    ld   a, $08
    ld   [$FFF3], a

label_1135::
    ld   a, [$C11C]

label_1138::
    rst  0
    ld   h, l
    ld   de, $4F30
    ld   h, b
    ld   c, c
    scf
    jr   label_1120
    add  hl, de
    ld   l, l
    ld   c, [hl]
    call nc, label_5D50
    ld   de, $5267
    ld   d, l
    ld   de, $50A3

label_114F::
    call label_1794
    jp   label_1D2E
    ld   a, $19
    call label_80C
    jp   $5D6A
    ld   a, $01
    call label_80C
    jp   $41C2
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_725A
    and  a
    ret  z
    ld   a, $02
    call label_80C
    jp   $4287
    ld   a, [$C50A]
    ld   hl, $C167
    or   [hl]
    ld   hl, $C1A4
    or   [hl]
    ret  nz
    ld   a, [$C14A]
    and  a
    jr   z, label_11BC
    ld   a, [WR1_BButtonSlot]
    cp   $01
    jr   z, label_11AA
    ld   a, [WR1_AButtonSlot]
    cp   $01
    jr   z, label_11AA
    ld   a, [WR1_BButtonSlot]
    cp   $04
    jr   z, label_11A5
    ld   a, [WR1_AButtonSlot]
    cp   $04
    jr   nz, label_11BA

label_11A5::
    call label_1340
    jr   label_11BA

label_11AA::
    ld   a, [$C137]
    dec  a
    cp   $04
    jr   c, label_11BA
    ld   a, $05
    ld   [$C137], a
    ld   [$C16A], a

label_11BA::
    jr   label_11C3

label_11BC::
    xor  a
    ld   [WR0_IsUsingShield], a
    ld   [WR0_ShieldLevel], a

label_11C3::
    ld   a, [$C117]
    and  a
    jp   nz, label_12ED
    ld   a, [$C15C]
    and  a
    jp   nz, label_12ED
    ld   a, [$C137]
    and  a
    jr   z, label_11E2
    cp   $03
    jr   nz, label_11E2
    ld   a, [$C138]
    cp   $03
    jr   nc, label_11E8

label_11E2::
    ld   a, [$FFA1]
    and  a
    jp   nz, label_12ED

label_11E8::
    ld   a, [WR1_AButtonSlot]
    cp   $08
    jr   nz, label_11FE
    ld   a, [$FFCB]
    and  $20
    jr   z, label_11FA
    call label_1705
    jr   label_11FE

label_11FA::
    xor  a
    ld   [$C14B], a

label_11FE::
    ld   a, [WR1_BButtonSlot]
    cp   $08
    jr   nz, label_1214
    ld   a, [$FFCB]
    and  $10
    jr   z, label_1210
    call label_1705

label_120E::
    jr   label_1214

label_1210::
    xor  a
    ld   [$C14B], a

label_1214::
    ld   a, [WR1_BButtonSlot]
    cp   $04
    jr   nz, label_1235
    ld   a, [WR1_ShieldLevel]
    ld   [WR0_ShieldLevel], a
    ld   a, [$FFCB]
    and  $10
    jr   z, label_1235
    ld   a, [$C1AD]
    cp   $01
    jr   z, label_1235
    cp   $02
    jr   z, label_1235
    call label_1340

label_1235::
    ld   a, [WR1_AButtonSlot]
    cp   $04
    jr   nz, label_124B
    ld   a, [WR1_ShieldLevel]
    ld   [WR0_ShieldLevel], a
    ld   a, [$FFCB]
    and  $20
    jr   z, label_124B
    call label_1340

label_124B::
    ld   a, [$FFCC]
    and  $20
    jr   z, label_125E
    ld   a, [$C1AD]
    cp   $02
    jr   z, label_125E
    ld   a, [WR1_AButtonSlot]
    call ItemFunction

label_125E::
    ld   a, [$FFCC]
    and  $10
    jr   z, label_1275
    ld   a, [$C1AD]
    cp   $01
    jr   z, label_1275
    cp   $02
    jr   z, label_1275
    ld   a, [WR1_BButtonSlot]
    call ItemFunction

label_1275::
    ld   a, [$FFCB]
    and  $20
    jr   z, label_1281
    ld   a, [WR1_AButtonSlot]
    call label_1321

label_1281::
    ld   a, [$FFCB]
    and  $10
    jr   z, label_128D
    ld   a, [WR1_BButtonSlot]
    call label_1321

label_128D::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_48CA
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

ItemFunction::
    ld   c, a
    cp   $01
    jp   z, UseSword
    cp   $04
    jp   z, UseShield
    cp   $02
    jp   z, PlaceBomb
    cp   $03
    jp   z, UsePowerBracelet
    cp   $05
    jp   z, ShootArrow
    cp   $0D
    jp   z, UseBoomerang
    cp   $06
    jp   z, UseHookshot
    cp   $0A
    jp   z, UseRocksFeather
    cp   $09
    jp   z, UseOcarina
    cp   $0C
    jp   z, UseMagicPowder
    cp   $0B
    jp   z, UseShovel
    cp   $07 ; Magic wand
    jr   nz, label_12ED
    ld   hl, $C137
    ld   a, [$C19B]
    or   [hl]
    jr   nz, label_12ED
    ld   a, [WR0_ProjectileCount]
    cp   $02
    jr   nc, label_12ED
    ld   a, $8E
    ld   [$C19B], a

label_12ED::
    ret

UseShield::
    ld   a, [$C144]
    and  a
    ret  nz
    ld   a, $16
    ld   [$FFF4], a
    ret

UseShovel::
    ld   a, [$C1C7]
    ld   hl, $C146
    or   [hl]
    ret  nz

label_1300::
    call label_4D20
    jr   nc, label_130B
    ld   a, $07
    ld   [$FFF2], a
    jr   label_130F

label_130B::
    ld   a, $0E
    ld   [$FFF4], a

label_130F::
    ld   a, $01
    ld   [$C1C7], a
    xor  a
    ld   [$C1C8], a
    ret

UseHookshot::
    ld   a, [$C1A4]
    and  a
    ret  nz
    jp   $4254

label_1321::
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

label_1340::
    ld   a, $01
    ld   [WR0_IsUsingShield], a
    ld   a, [WR1_ShieldLevel]
    ld   [WR0_ShieldLevel], a
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4B4A
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

PlaceBomb::
    ld   a, [WR0_HasPlacedBomb]
    cp   $01
    ret  nc
    ld   a, [WR1_BombCount]
    and  a
    jp   z, label_C20
    sub  a, $01
    daa
    ld   [WR1_BombCount], a
    ld   a, $02
    call label_142F
    ret  c
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4B81
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

UsePowerBracelet::
    ret

UseBoomerang::
    ld   a, [WR0_ProjectileCount]
    and  a

label_1387::
    ret  nz
    ld   a, $01
    call label_142F
    ret  c
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4BFF
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

data_139D::
    db   0, 0, 0, 0

data_13A1::
    db   0, 0, 0, 0

data_13A5::
    db   $20, $E0, 0, 0

data_13A9::
    db   0, 0, $E0, $20

data_13AD::
    db   $30, $D0, 0, 0, $40, $C0, 0, 0

data_13B5::
    db   0, 0, $D0, $30, 0, 0, $C0, $40

ShootArrow::
    ld   a, [WR0_IsShootingArrow]
    and  a
    ret  nz
    ld   a, [WR0_ProjectileCount]
    cp   $02
    jr   nc, label_142E
    ld   a, $10
    ld   [WR0_IsShootingArrow], a
    ld   a, [WR1_ArrowCount]
    and  a
    jp   z, label_C20
    sub  a, $01
    daa
    ld   [WR1_ArrowCount], a
    call label_157C
    ld   a, $00
    call label_142F
    ret  c
    ld   a, e
    ld   [$C1C2], a
    ld   a, [$C1C0]
    and  a
    jr   z, label_1401
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
    jr   label_1407

label_1401::
    ld   a, $0A
    ld   [$FFF4], a
    ld   a, $06

label_1407::
    ld   [$C1C0], a
    ld   a, [$FF9E]
    ld   c, a
    ld   b, $00

label_140F::
    ld   a, [$D47C]
    cp   $01
    jr   nz, label_141A
    ld   a, c
    add  a, $04
    ld   c, a

label_141A::
    ld   hl, data_13AD
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, data_13B5
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C250
    add  hl, de
    ld   [hl], a

label_142E::
    ret

label_142F::
    call label_3B86
    ret  c
    ld   a, $0C
    ld   [$C19B], a
    push bc
    ld   a, [$FF9E]
    ld   c, a
    ld   b, $00
    ld   hl, data_139D
    add  hl, bc
    ld   a, [$FF98]
    add  a, [hl]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   hl, data_13A1
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
    ld   hl, data_13A5
    add  hl, bc
    ld   a, [hl]
    ld   hl, $C240
    add  hl, de
    ld   [hl], a
    ld   hl, data_13A9
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

UseMagicPowder::
    ld   a, [$C19B]
    and  a
    ret  nz
    ld   a, [$DB4B]
    and  a
    jr   z, label_14A7
    ld   a, [$FFA2]
    and  a
    ret  nz
    ld   a, $02
    ld   [$C1A9], a
    ld   a, $2A
    ld   [$C1AA], a
    ret

label_14A7::
    ld   a, [$DB4C]
    and  a
    jp   z, label_C20
    ld   a, $08
    call label_3B86
    ret  c
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4C47
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

data_14C3::
    db $1C, $E4, 0, 0

data_14C7::
    db 0, 0, $E4, $1C

UseRocksFeather::
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
    jr   z, label_1508
    call label_1508
    ld   a, [$FFCB]
    and  $03
    ld   a, $EA
    jr   z, label_14F8
    ld   a, $E8

label_14F8::
    ld   [$FF9B], a
    xor  a
    ld   [$FFA3], a
    call label_21A8
    ld   a, $02
    call label_80C
    jp   $6C75

label_1508::
    ld   a, $20
    ld   [$FFA3], a
    ld   a, [$C14A]
    and  a
    ret  z
    ld   a, [$FF9E]
    ld   e, a
    ld   d, b
    ld   hl, data_14C3
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, data_14C7
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a

label_1523::
    ret

data_1524::
    db   2, $14, $15, $18

UseSword::
    ld   a, [$C16D]
    ld   hl, WR0_IsUsingSpinAttack
    or   [hl]
    ret  nz
    ld   a, $03
    ld   [$C138], a

label_1535::
    ld   a, $01
    ld   [$C137], a
    ld   [$C5B0], a
    xor  a
    ld   [$C160], a
    ld   [$C1AC], a
    call label_280D
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, data_1524
    add  hl, de
    ld   a, [hl]
    ld   [$FFF4], a
    call label_157C
    ld   a, [$C146]
    and  a
    jr   nz, label_1562
    call label_CAF
    call label_178E

label_1562::
    ld   a, [WR0_ProjectileCount]
    and  a
    ret  nz
    ld   a, [$C5A9]
    and  a
    ret  z
    ld   a, [$DB4E]
    cp   $02
    ret  nz
    ld   a, $DF
    call label_142F
    xor  a
    ld   [$C19B], a
    ret

label_157C::
    ld   a, [$FFCB]
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, $4905
    add  hl, de
    ld   a, [hl]
    cp   $0F
    jr   z, label_158E
    ld   [$FF9E], a

label_158E::
    ret

label_158F::
    ld   d, $FA
    ld   [label_1608], sp
    ld   d, $08
    ld   a, [$FAFA]
    ld   [label_816], sp
    ld   [label_16FA], sp
    ld   [label_1616], sp
    ld   d, $08
    ld   a, [$FAFA]
    call label_15AF
    ld   a, $02
    jp   label_80C

label_15AF::
    ld   a, [$C1C4]
    and  a
    ret  nz
    ld   a, [$C14A]
    and  a
    jr   nz, label_15C0
    ld   a, [$C16A]
    cp   $05
    ret  z

label_15C0::
    ld   a, [WR0_IsUsingSpinAttack]
    and  a
    jr   z, label_15CD
    ld   a, [$C136]
    add  a, $04
    jr   label_15CF

label_15CD::
    ld   a, [$FF9E]

label_15CF::
    ld   e, a
    ld   d, $00
    ld   hl, $158F ; TODO: Check this
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   c, a
    ld   hl, $159B ; TODO: Check this
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   e, a
    ld   hl, WR1_TileMap
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
    call label_2A26
    pop  de
    cp   $D0

label_1608::
    db   $DA ; +
    db   $10
    db   $16
    db   $FE ; ¦
    db   $D4 ; +
    db   $DA ; +
    db   $C2 ; -
    db   $16
    db   $FE ; ¦
    db   $90 ; É
    db   $D2 ; -
    db   $C2 ; -
    db   $16
    db   $FE ; ¦

label_1616::
    ld   bc, $C2CA
    ld   d, $E
    nop
    ld   a, [$DBA5]
    and  a
    ld   a, [$FFAF]
    jr   z, label_1629
    cp   $DD
    jr   z, label_1637
    ret

label_1629::
    inc  c
    cp   $D3
    jr   z, label_1637
    cp   $5C
    jr   z, label_1637
    cp   $0A
    ret  nz
    ld   c, $FF

label_1637::
    ld   a, c
    ld   [$FFF1], a
    call label_2178
    ld   a, [$C14A]
    and  a
    jr   nz, label_1653
    ld   a, [$C16A]
    cp   $05
    jr   nz, label_1653
    xor  a
    ld   [$C122], a
    ld   a, $0C
    ld   [$C16D], a

label_1653::
    ld   a, $05
    call label_142F
    jr   c, label_167C
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
    call label_3942

label_167C::
    call label_280D
    and  $07
    ret  nz
    ld   a, [$FFAF]
    cp   $D3
    ret  z
    call label_280D
    rra
    ld   a, $2E
    jr   nc, label_1691
    ld   a, $2D

label_1691::
    call label_3B86
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

data_16BA::
    db $12, $EE, $FC, 4

data_16BE::
    db 4, 4, $EE, $12

label_16C2::
    ld   c, a
    ld   a, [$C16D]
    and  a
    ret  z
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, data_16BA
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    ld   [$FFD7], a
    ld   hl, data_16BE
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    ld   [$FFD8], a

label_16DF::
    ld   a, $04
    ld   [$C502], a
    call label_D15
    ld   a, $10
    ld   [$C1C4], a
    ld   a, c
    and  $F0
    cp   $90
    jr   z, label_16F8
    ld   a, $07
    ld   [$FFF2], a
    ret

label_16F8::
    ld   a, $17

label_16FA::
    ld   [$FFF4], a
    ret

data_16FD::
    db   $20, $E0, 0, 0

data_1701::
    db   0, 0, $E0, $20

label_1705::
    ld   a, [$FFF9]
    and  a
    jr   z, label_1713
    ld   a, [$FF9C]
    and  a
    ret  nz
    ld   a, [$FF9E]
    and  $02
    ret  nz

label_1713::
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
    call label_1756
    ld   a, [$C14B]
    inc  a
    ld   [$C14B], a
    cp   $20
    ret  nz
    ld   [$C14A], a
    xor  a
    ld   [WR0_IsUsingSpinAttack], a
    ld   [$C122], a
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, data_16FD
    add  hl, de
    ld   a, [hl]
    ld   [$FF9A], a
    ld   hl, data_1701
    add  hl, de
    ld   a, [hl]
    ld   [$FF9B], a
    xor  a
    ld   [$C1AC], a
    ret

label_1756::
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
    jr   z, label_1781
    ld   a, $07
    ld   [$FFF4], a
    ld   a, [$FF99]
    add  a, $06
    ld   [$FFD8], a
    ld   a, $0B
    jp   label_CC7

label_1781::
    ld   a, [$FF99]
    ld   [$FFD8], a
    ld   a, $0E
    ld   [$FFF2], a
    ld   a, $0C
    jp   label_CC7

label_178E::
    xor  a
    ld   [$FF9A], a
    ld   [$FF9B], a
    ret

label_1794::
    call label_753A
    ld   a, [$C11C]
    cp   $01
    ret  z
    ld   a, [$C16A]
    and  a
    jr   z, label_17DB
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
    jr   c, label_17C6
    ld   a, [$FFE7]
    rla
    rla
    and  $10
    ld   [hl], a

label_17C6::
    ld   a, [$C139]
    ld   h, a
    ld   a, [$C13A]
    ld   l, a
    ld   a, [$C136]
    ld   [$FFD9], a
    ld   a, [$FF99]
    cp   $88
    ret  nc
    jp   label_1819

label_17DB::
    ld   a, [$C19B]
    push af
    bit  7, a
    jp   z, label_1814
    ld   a, $02
    call label_80C
    call label_5310
    ld   a, [$C19B]
    and  $7F
    cp   $0C
    jr   nz, label_1814
    ld   hl, $C19F
    ld   a, [$C124]
    or   [hl]
    jr   nz, label_1814
    call label_157C
    ld   a, $04
    call label_142F
    jr   c, label_1814
    ld   a, $0D
    ld   [$FFF4], a
    ld   a, $02
    call label_80C
    call label_538B

label_1814::
    pop  af
    ld   [$C19B], a
    ret

label_1819::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4AB3
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_49BA
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret
    call label_754F
    ld   a, [$C3C9]
    and  a
    jr   z, label_1847
    xor  a
    ld   [$C3C9], a
    jp   label_C7D

label_1847::
    call label_1A22
    xor  a
    ld   [$C157], a
    inc  a
    ld   [$C1A8], a
    ld   a, [$C16B]
    cp   $04
    jp   nz, label_19D9
    xor  a
    ld   [$FF96], a
    ld   [$FF97], a
    ld   [$FFB4], a
    ld   [$DDD6], a
    ld   [$DDD7], a
    ld   e, $10
    ld   hl, $C280

label_186C::
    ldi  [hl], a
    dec  e
    jr   nz, label_186C
    ld   a, [$C509]
    and  a
    jr   z, label_1898
    push af
    ld   a, $04
    call label_80C
    pop  af
    call label_7A5F
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

label_1898::
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
    jr   nz, label_18DF
    ld   hl, $D416
    ld   c, $00

label_18BA::
    ld   a, [$FF98]
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FF99]
    sub  a, $08
    and  $F0
    or   e
    cp   [hl]
    jr   z, label_18D2
    inc  hl
    inc  c
    ld   a, c
    cp   $04
    jr   nz, label_18BA

label_18D2::
    ld   a, c
    sla  a
    sla  a
    add  a, c
    ld   e, a
    ld   d, $00
    ld   hl, $D401
    add  hl, de

label_18DF::
    push hl
    ld   a, [hli]
    ld   [$DBA5], a
    cp   $02
    jr   nz, label_18F2
    ld   [$FFF9], a
    dec  a
    ld   [$DBA5], a
    ld   a, $01
    ld   [$FF9C], a

label_18F2::
    ld   a, [hli]
    ld   [$FFF7], a
    ld   a, [$DBA5]
    and  a
    ld   a, [hli]
    ld   [$FFF6], a
    jr   nz, label_1909
    ld   a, [$FFE6]
    and  a
    jr   z, label_1907
    xor  a
    ld   [$D47C], a

label_1907::
    jr   label_196F

label_1909::
    ld   c, a
    ld   a, $14
    call label_80C
    push hl
    ld   a, [$FFF7]
    swap a
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, $4220
    add  hl, de
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_192E
    ld   hl, $44E0
    jr   label_193C

label_192E::
    cp   $06
    jr   nz, label_193C
    ld   a, [$DB6B]
    and  $04
    jr   z, label_193C
    ld   hl, $4520

label_193C::
    ld   e, $00

label_193E::
    ld   a, [hli]
    cp   c
    jr   z, label_1948
    inc  e
    ld   a, e
    cp   $40
    jr   nz, label_193E

label_1948::
    ld   a, e
    ld   [$DBAE], a
    ld   a, [$FFE6]
    and  a
    jr   nz, label_196E
    xor  a
    ld   [$D47C], a
    ld   a, [$FFF7]
    cp   $0A
    jr   nc, label_196E
    ld   a, $02
    call label_80C
    call label_6709
    ld   a, $30
    ld   [$FFB4], a
    xor  a
    ld   [$D6FB], a
    ld   [$D6F8], a

label_196E::
    pop  hl

label_196F::
    ld   a, [hli]
    ld   [$DB9D], a
    ld   a, [hl]
    ld   [$DB9E], a
    pop  hl
    ld   a, [$FFF9]
    and  a
    jr   nz, label_19DA
    ld   a, [$FFE4]
    and  a
    jr   nz, label_19D9
    ld   a, [$DBA5]
    and  a
    jr   z, label_19C2
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_1993
    ld   hl, $4E3C
    jr   label_19A4

label_1993::
    cp   $0A
    jr   nc, label_19C2
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, $4DF1
    add  hl, de

label_19A4::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_19C2
    push de
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_19B7
    ld   a, $3A
    jr   label_19BF

label_19B7::
    ld   e, a
    ld   d, $00
    ld   hl, $4E41
    add  hl, de
    ld   a, [hl]

label_19BF::
    pop  de
    ld   [de], a
    ret

label_19C2::
    ld   a, $00
    ld   [$FFD7], a
    ld   de, $DB5F

label_19C9::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [$FFD7]
    inc  a
    ld   [$FFD7], a
    cp   $05
    jr   nz, label_19C9
    ld   a, [$DBAE]
    ld   [de], a

label_19D9::
    ret

label_19DA::
    xor  a
    ld   [$FF9E], a
    ret
    call label_754F
    ld   a, [$D474]
    and  a
    jr   z, label_19FC
    xor  a
    ld   [$D474], a
    ld   a, $30
    ld   [$C180], a
    ld   a, $03
    ld   [$C17F], a
    ld   a, $04
    ld   [$C16B], a
    jr   label_1A06

label_19FC::
    call label_1A39
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_1A21

label_1A06::
    ld   a, [$D463]
    cp   $01
    jr   z, label_1A0F
    ld   a, $00

label_1A0F::
    ld   [$C11C], a
    ld   a, [$D47E]
    and  a
    jr   z, label_1A21
    xor  a
    ld   [$D47E], a
    ld   a, $36
    jp   label_2385

label_1A21::
    ret

label_1A22::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6C4F
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_55CA
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

label_1A39::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6C7A
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_563B
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

label_1A50::
    ld   a, [$C120]
    sra  a
    sra  a
    sra  a
    and  $01
    ld   d, a
    ld   a, [$FF9E]
    sla  a
    or   d
    ld   c, a
    ld   b, $00
    ld   hl, $4948
    ld   a, [$C11C]
    cp   $01
    jr   nz, label_1A78
    ld   a, [$FF9C]
    and  a
    jr   z, label_1A76
    ld   hl, $4950

label_1A76::
    jr   label_1AC7

label_1A78::
    ld   a, [$FFF9]
    and  a
    jr   z, label_1A88
    ld   a, [$FF9C]
    cp   $02
    jr   nz, label_1A88
    ld   hl, $4958
    jr   label_1AC7

label_1A88::
    ld   a, [$C15C]
    cp   $01
    jr   z, label_1AC4
    ld   a, [$FFB2]
    and  a
    jr   nz, label_1A9A
    ld   a, [$C144]
    and  a
    jr   nz, label_1ABF

label_1A9A::
    ld   a, [WR0_ShieldLevel]
    and  a
    jr   nz, label_1AA5
    ld   hl, $4910
    jr   label_1AC7

label_1AA5::
    ld   hl, $4918
    cp   $02
    jr   nz, label_1AAF
    ld   hl, $4928

label_1AAF::
    ld   a, [WR0_IsUsingShield]
    and  a
    jr   z, label_1ABD
    ld   a, l
    add  a, $08
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a

label_1ABD::
    jr   label_1AC7

label_1ABF::
    ld   hl, $4938
    jr   label_1AC7

label_1AC4::
    ld   hl, $4940

label_1AC7::
    add  hl, bc
    ld   a, [hl]
    ld   [$FF9D], a
    ret

label_1ACC::
    ld   a, [$D601]
    and  a
    ret  nz
    ld   a, $10
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $6500
    ld   de, $9500
    ld   a, [$FFE7]
    and  $0F
    jr   z, label_1AEB
    cp   $08
    ret  nz
    ld   l, $40
    ld   e, l

label_1AEB::
    ld   a, [$FFE7]
    and  $30
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    add  hl, bc
    ld   bc, $0040
    jp   CopyData
    jr   nz, label_1B67
    and  b
    ld   [$FFE0], a
    ld   [$FFA0], a
    ld   h, b

label_1B0D::
    ld   a, [$DB95]
    cp   $09
    jr   z, label_1ACC
    cp   $00
    jr   nz, label_1B46
    ld   a, [$D601]
    and  a
    jp   nz, label_1B45
    ld   a, [$FFE7]
    and  $0F
    cp   $04
    jr   c, label_1B45
    ld   a, $10
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   a, [$D006]
    ld   l, a
    ld   a, [$D007]
    ld   h, a
    ld   a, [$D008]
    ld   e, a
    ld   a, [$D009]
    ld   d, a
    ld   bc, $0020
    jp   CopyData

label_1B45::
    ret

label_1B46::
    ld   a, [$DB95]
    cp   $01
    jr   nz, label_1B53
    ld   a, [$FFA5]
    and  a
    jr   nz, label_1B82
    ret

label_1B53::
    cp   $0B
    jp  c, label_1DE8
    ld   a, [$DB9A]
    cp   $80
    jp   nz, label_1DE8
    ld   a, [$C14F]
    and  a
    jp   nz, label_1D2E

label_1B67::
    ld   hl, $C124
    ld   a, [$D601]
    or   [hl]
    jp   nz, label_1D2E
    ld   a, [$D6F8]
    and  a
    jr   z, label_1B7D
    call label_1ED7
    jp   label_1D2E

label_1B7D::
    ld   a, [$FFA5]
    and  a
    jr   z, label_1BCD

label_1B82::
    cp   $01
    jp   z, label_3F93
    cp   $02
    jp   z, label_3FA9
    cp   $03
    jp   z, label_1EB5
    cp   $04
    jp   z, label_1EBC
    cp   $08
    jp   z, label_1E69
    cp   $09
    jp   z, label_1EA1
    cp   $0A
    jp   z, label_1E2B
    cp   $0B
    jp   z, label_1E8D
    cp   $0C
    jp   z, label_1E33
    cp   $0D
    jp   z, label_1E01
    cp   $0E
    jr   z, label_1BC5
    cp   $0F
    jp   z, label_1DF0
    cp   $10
    jp   z, label_1DE9
    jp   label_1D2E

label_1BC5::
    ld   a, $17
    ld   [SelectRomBank_2100], a
    jp   $4062

label_1BCD::
    ld   a, [$FFA6]
    inc  a
    ld   [$FFA6], a

label_1BD2::
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
    jp   nz, label_1D1E
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_61AA
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    jp   label_1D2E

label_1C13::
    ld   l, a
    jr   label_1C51
    ld   h, $6B
    jr   label_1C24
    ld   h, $6C
    jr   label_1C24
    ld   h, $73
    jr   label_1C24
    ld   h, $6A

label_1C24::
    ld   a, [$FFA6]
    and  $0F
    jp   nz, label_1D1E
    call label_1CE8
    jp   label_1C13

data_1C31::
    db 0, $40, $80, $C0, $C0, $C0, $80, $40

label_1C39::
    ld   a, [$FFA6]
    and  $07
    jp   nz, label_1D1E
    ld   a, [$FFA6]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, data_1C31
    add  hl, de
    ld   l, [hl]
    ld   h, $6D

label_1C51::
    ld   de, $96C0

label_1C54::
    ld   bc, $0040
    call CopyData
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_1C87
    ld   a, $20
    ld   [SelectRomBank_2100], a
    ld   b, $01
    call label_47F7
    jr   z, label_1C72
    ld   [SelectRomBank_2100], a
    call CopyData

label_1C72::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    ld   b, $00
    call label_47F7
    jr   z, label_1C87
    ld   [SelectRomBank_2100], a
    ld   de, $96C0
    call CopyData

label_1C87::
    jp   label_1D2E
    ld   h, $6E
    jr   label_1C24
    ld   a, [$FFA6]
    and  $07
    jp   nz, label_1D1E
    ld   a, [$FFA6]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, data_1C31
    add  hl, de
    ld   l, [hl]
    ld   h, $6F
    jp   label_1C51
    ld   hl, $DCC0
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_1CB8
    ld   de, $8400
    jp   label_1C54

label_1CB8::
    ld   a, [$FFA6]
    inc  a
    and  $03
    jp   nz, label_1C39
    ld   de, $90C0
    jp   label_1C54
    ld   h, $70

label_1CC8::
    ld   a, [$FFA6]
    and  $07
    jp   nz, label_1D1E
    call label_1CE8
    jp   label_1C13
    ld   h, $71

label_1CD7::
    ld   a, [$FFA6]
    and  $03
    jp   nz, label_1D1E
    call label_1CE8
    jp   label_1C13
    ld   h, $72
    jr   label_1CD7

label_1CE8::
    ld   a, [$FFA7]
    add  a, $40
    ld   [$FFA7], a
    ret
    ld   h, $75
    jr   label_1CD7
    ld   h, $74
    jr   label_1CC8
    ld   h, $77
    jr   label_1CC8
    ld   h, $76
    jr   label_1CC8
    ld   a, $38
    ld   [SelectRomBank_2100], a
    call label_7830
    jp   label_1D2E
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a

label_1D12::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  d
    jr   nz, label_1D12
    ld   a, $20
    ld   [SelectRomBank_2100], a
    ret

label_1D1E::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_54F5
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a

label_1D2E::
    ld   a, [$FF9D]
    inc  a
    ret  z
    ld   a, [$FFFE]
    and  a
    jr   z, label_1D42
    ld   a, [$DBC7]
    and  $04
    jr   z, label_1D49
    ld   a, $04
    jr   label_1D49

label_1D42::
    ld   a, [$DBC7]
    rla
    rla
    and  $10

label_1D49::
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
    jr   z, label_1DA1
    ld   a, [$DBC7]
    and  $04
    jr   nz, label_1DA1
    ld   a, [$FF9D]
    cp   $50
    jr   c, label_1D8C
    cp   $55
    jr   nc, label_1D8C
    ld   a, [hl]
    or   $07
    ld   [hl], a
    jr   label_1DA1

label_1D8C::
    ld   a, [$DC0F]
    and  a
    jr   z, label_1D95
    inc  a
    or   [hl]
    ld   [hl], a

label_1D95::
    ld   a, [$FF9D]
    cp   $4E
    jr   z, label_1D9F
    cp   $4F
    jr   nz, label_1DA1

label_1D9F::
    ld   [hl], $03

label_1DA1::
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
    jr   z, label_1DE7
    ld   a, [$DBC7]
    and  $04
    jr   nz, label_1DE7
    ld   a, [$FF9D]
    cp   $50
    jr   c, label_1DD2
    cp   $55
    jr   nc, label_1DD2
    ld   a, [hl]
    or   $07
    ld   [hl], a
    jr   label_1DE7

label_1DD2::
    ld   a, [$DC0F]
    and  a
    jr   z, label_1DDB
    inc  a
    or   [hl]
    ld   [hl], a

label_1DDB::
    ld   a, [$FF9D]
    cp   $4E
    jr   z, label_1DE5
    cp   $4F
    jr   nz, label_1DE7

label_1DE5::
    ld   [hl], $23

label_1DE7::
    inc  hl

label_1DE8::
    ret

label_1DE9::
    ld   hl, $4F00
    ld   a, $0E
    jr   label_1DF5

label_1DF0::
    ld   a, $12
    ld   hl, $6080

label_1DF5::
    ld   [SelectRomBank_2100], a
    ld   de, $8400
    ld   bc, $0040
    jp   label_1F3B

label_1E01::
    ld   a, [$DB0E]
    cp   $02
    jp  c, label_1F3E
    sub  a, $02
    ld   d, a
    ld   e, $00
    sra  d
    rr   e
    sra  d
    rr   e
    ld   hl, $4400
    add  hl, de
    ld   de, $89A0
    ld   bc, $0040
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    jp   label_1F3B

label_1E2B::
    ld   hl, $68C0
    ld   de, $88E0
    jr   label_1EA7

label_1E33::
    ld   a, $11
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   a, [$D000]
    swap a
    and  $F0
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, $8D00
    add  hl, de
    push hl
    ld   hl, $5000

label_1E55::
    add  hl, de
    pop  de
    ld   bc, $0040
    call CopyData
    xor  a
    ld   [$FFA5], a
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    ret

label_1E69::
    ld   a, $13
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   a, [$D000]
    swap a
    and  $F0
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, $8D00
    add  hl, de
    push hl
    ld   hl, $4D00
    jr   label_1E55

label_1E8D::
    ld   hl, $48E0
    ld   de, $88E0
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   bc, $0020
    jp   label_1F3B

label_1EA1::
    ld   hl, $68E0
    ld   de, $8CA0

label_1EA7::
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   bc, $0020
    jp   label_1F3B

label_1EB5::
    ld   hl, $7F00
    ld   a, $12
    jr   label_1EC1

label_1EBC::
    ld   hl, $4C40
    ld   a, $0D

label_1EC1::
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   de, $9140
    jp   label_1F38

data_1ECD::
    db $40, $68, $40, $68

data_1ED1::
    db 0, $68

data_1ED3::
    db $80, $68, 0, $68

label_1ED7::
    push af
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    pop  af
    ld   hl, $FFA1
    ld   [hl], $01
    ld   hl, $D6FB
    ld   e, [hl]
    ld   d, $00
    inc  a
    cp   $03
    jr   nz, label_1EFB
    push af
    ld   a, [$D6FB]
    xor  $02
    ld   [$D6FB], a
    pop  af

label_1EFB::
    ld   [$D6F8], a
    cp   $04

label_1F00::
    jr   nz, label_1F07
    ld   hl, data_1ECD
    jr   label_1F0E

label_1F07::
    cp   $08
    jr   nz, label_1F14
    ld   hl, data_1ED1

label_1F0E::
    add  hl, de
    ld   de, $9040
    jr   label_1F2C

label_1F14::
    cp   $06
    jr   nz, label_1F1D
    ld   hl, data_1ECD
    jr   label_1F28

label_1F1D::
    cp   $0A
    jr   nz, label_1F35
    xor  a
    ld   [$D6F8], a
    ld   hl, data_1ED3

label_1F28::
    add  hl, de
    ld   de, $9080

label_1F2C::
    ld   bc, $0040
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    jp   CopyData

label_1F35::
    jp   label_1D2E

label_1F38::
    ld   bc, $0040

label_1F3B::
    call CopyData

label_1F3E::
    xor  a
    ld   [$FFA5], a
    ld   a, $0C
    ld   [SelectRomBank_2100], a
    jp   label_1D2E

data_1F49::
    db   $C, 3, 8, 8
    
data_1F4D::
    db   $A, $A, 5, $10

data_1F51::
    db   $36, $38, $3A, $3C

data_1F55::
    db   2, 1, 8, 4

data_1F59::
    db   $FC, 4, 0, 0

data_1F5D::
    db   0, 0, 4, 0

label_1F61::
    call label_1F69
    ld   a, 2
    jp   label_80C

label_1F69::
    ld   hl, $C14A
    ld   a, [$C15C]
    or   [hl]
    ld   hl, $FFA2
    or   [hl]
    ld   hl, $C11C
    or   [hl]
    jp   nz, label_2177
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, data_1F49
    add  hl, de
    ld   a, [$FF98]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ld   [$FFCE], a
    swap a
    ld   c, a
    ld   hl, data_1F4D
    add  hl, de
    ld   a, [$FF99]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ld   [$FFCD], a
    or   c
    ld   e, a
    ld   [$FFD8], a
    ld   hl, WR1_TileMap
    add  hl, de
    ld   a, h
    cp   $D7
    jp   nz, label_214E
    ld   a, [hl]
    ld   [$FFD7], a
    ld   e, a
    ld   a, [$DBA5]
    ld   d, a
    call label_2A26
    ld   [$FFDC], a
    ld   a, [$FFD7]
    cp   $9A
    jr   z, label_1FFE
    ld   a, [$FFDC]
    cp   $00
    jp   z, label_214E
    cp   $01
    jr   z, label_1FE6
    cp   $50
    jp   z, label_214E
    cp   $51
    jp   z, label_214E
    cp   $11
    jp  c, label_214E
    cp   $D4
    jp   nc, label_214E
    cp   $D0
    jr   nc, label_1FE6
    cp   $7C
    jp   nc, label_214E

label_1FE6::
    ld   a, [$FFD7]
    ld   e, a
    cp   $6F
    jr   z, label_1FF6
    cp   $5E
    jr   z, label_1FF6
    cp   $D4
    jp   nz, label_2098

label_1FF6::
    ld   a, [$DBA5]
    and  a
    ld   a, e
    jp   nz, label_2098

label_1FFE::
    ld   e, a
    ld   a, [$FF9E]
    cp   $02
    jp   nz, label_20CF
    ld   a, $02
    ld   [$C1AD], a
    ld   a, [$FFCC]
    and  $30
    jp   z, label_20CF
    ld   a, e
    cp   $5E
    ld   a, $8E
    jr   z, label_2088
    ld   a, e
    cp   $6F
    jr   z, label_2049
    cp   $D4
    jr   z, label_2049
    ld   a, [$DB73]
    and  a
    jr   z, label_2030
    ld   a, $78
    call label_237C
    jp   label_20CF

label_2030::
    ld   a, [$DB4E]
    and  a
    ld   a, [$FFF6]
    jr   nz, label_203E
    ld   e, $FF
    cp   $A3
    jr   z, label_2046

label_203E::
    ld   e, $FC
    cp   $FA
    jr   z, label_2046
    ld   e, $FD

label_2046::
    ld   a, e
    jr   label_208E

label_2049::
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   a, $14
    ld   [SelectRomBank_2100], a
    ld   hl, $5118
    add  hl, de
    ld   a, [$DB49]
    ld   e, a
    ld   a, [hl]
    cp   $A9
    jr   nz, label_2066
    bit  0, e
    jr   z, label_2066
    ld   a, $AF

label_2066::
    cp   $AF
    jr   nz, label_2080
    bit  0, e
    jr   nz, label_2080
    ld   a, [$FFCE]
    swap a
    and  $0F
    ld   e, a
    ld   a, [$FFCD]
    and  $F0
    or   e
    ld   [$D473], a
    jp   label_20CF

label_2080::
    cp   $83
    jr   z, label_208E
    cp   $2D
    jr   z, label_2093

label_2088::
    call label_2373
    jp   label_20CF

label_208E::
    call label_2385
    jr   label_20CF

label_2093::
    call label_237C
    jr   label_20CF

label_2098::
    cp   $A0
    jr   nz, label_20CF
    ld   a, [$C18E]
    and  $1F
    cp   $0D
    jr   z, label_20CF
    ld   a, [$FF9E]
    cp   $02
    jr   nz, label_20CF
    ld   [$C1AD], a
    ld   a, [$FFCC]
    and  $30
    jr   z, label_20CF
    ld   a, [$FFF9]
    and  a
    jr   nz, label_20BF
    ld   a, [$FF9E]
    cp   $02
    jr   nz, label_20CF

label_20BF::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_5900
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_41D0

label_20CF::
    ld   a, [WR1_AButtonSlot]
    cp   $03
    jr   nz, label_20DD
    ld   a, [$FFCB]
    and  $20
    jr   nz, label_20EC
    ret

label_20DD::
    ld   a, [WR1_BButtonSlot]
    cp   $03
    jp   nz, label_2177
    ld   a, [$FFCB]
    and  $10
    jp   z, label_2177

label_20EC::
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_48B0
    ld   a, $01
    ld   [$FFA1], a
    ld   a, [$FF9E]
    ld   e, a
    ld   d, $00
    ld   hl, data_1F51

    add  hl, de
    ld   a, [hl]
    ld   [$FF9D], a
    ld   hl, data_1F55
    add  hl, de
    ld   a, [$FFCB]
    and  [hl]
    jr   z, label_214E
    ld   hl, data_1F59
    add  hl, de
    ld   a, [hl]
    ld   [$C13C], a
    ld   hl, data_1F5D
    add  hl, de
    ld   a, [hl]
    ld   [$C13B], a
    ld   hl, $FF9D
    inc  [hl]
    ld   e, $08
    ld   a, [$D47C]
    cp   $01
    jr   nz, label_212C
    ld   e, $03

label_212C::
    ld   hl, $C15F
    inc  [hl]
    ld   a, [hl]
    cp   e
    jr   c, label_214D
    xor  a
    ld   [$FFE5], a
    ld   a, [$FFD7]
    cp   $8E
    jr   z, label_2153
    cp   $20
    jr   z, label_2153
    ld   a, [$DBA5]
    and  a
    jr   nz, label_214D
    ld   a, [$FFD7]
    cp   $5C
    jr   z, label_2161

label_214D::
    ret

label_214E::
    xor  a
    ld   [$C15F], a
    ret

label_2153::
    call label_2165
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_50C3
    jp   label_81D

label_2161::
    ld   a, $01
    ld   [$FFE5], a

label_2165::
    ld   a, [$FFD8]
    ld   e, a
    ld   a, [$FFD7]
    ld   [$FFAF], a
    call label_2178
    ld   a, [$FF9E]
    ld   [$C15D], a
    jp   label_2183

label_2177::
    ret

label_2178::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_5526
    jp   label_81D

label_2183::
    ld   a, $05
    call label_142F
    jr   c, label_21A7
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
    call label_80C
    jp   $5795

label_21A7::
    ret

label_21A8::
    ld   a, [$C14F]
    and  a
    ret  nz
    ld   c, $01
    call label_21B6
    ld   c, $00
    ld   [$FFD7], a

label_21B6::
    ld   b, $00
    ld   hl, $FF9A
    add  hl, bc
    ld   a, [hl]
    push af
    swap a
    and  $F0
    ld   hl, $C11A
    add  hl, bc
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $FF98
    add  hl, bc
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_21D7
    ld   e, $F0

label_21D7::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret
    ld   a, [$FFA3]
    push af
    swap a
    and  $F0
    ld   hl, $C149
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, $FFA2
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, label_21FB
    ld   e, $F0

label_21FB::
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

data_2205::
    db   $10, $10, 1, 1, $3E, 8, $EA, 0, $21, $CD, $34, $22, $C3, $1D, 8

label_2214::
    ld   a, [$C127]
    and  $20
    jr   z, label_221D
    inc  hl
    inc  hl

label_221D::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    ld   a, [hl]
    ld   [bc], a
    inc  bc
    ret

label_2224::
    ld   a, [$C127]
    and  $01
    jr   z, label_222C
    inc  hl

label_222C::
    ld   a, [hli]
    ld   [bc], a
    inc  hl
    inc  bc
    ld   a, [hl]
    ld   [bc], a
    inc  bc
    ret
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4A76
    ld   a, $08
    ld   [SelectRomBank_2100], a

label_2241::
    push bc
    push de
    ld   a, [$FFD9]
    ld   c, a
    ld   b, $00
    ld   hl, WR1_TileMap
    add  hl, bc
    ld   b, $00
    ld   c, [hl]
    ld   a, [$FFFE]
    and  a
    jr   z, label_2262
    ld   a, [$DBA5]
    and  a
    jr   nz, label_2262
    ld   a, $02
    ld   [rSVBK], a
    ld   c, [hl]
    xor  a
    ld   [rSVBK], a

label_2262::
    sla  c
    rl   b
    sla  c
    rl   b
    ld   a, [$DBA5]
    and  a
    jr   z, label_2286
    ld   hl, $4000
    ld   a, [$FFFE]
    and  a
    jr   z, label_2299
    ld   hl, $43B0
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_2291
    ld   hl, $4760
    jr   label_2291

label_2286::
    ld   hl, $6749
    ld   a, [$FFFE]
    and  a
    jr   z, label_2299
    ld   hl, $6B1D

label_2291::
    ld   a, $1A
    ld   [SelectRomBank_2100], a
    call label_6576

label_2299::
    call label_3905
    add  hl, bc
    pop  de
    pop  bc
    ld   a, [$C125]
    and  $02
    jr   z, label_22D3
    call label_2214
    ld   a, [$FFFE]
    and  a
    jr   z, label_22D1
    push bc
    push de
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_49D9
    ld   a, [$FFDF]
    ld   [SelectRomBank_2100], a
    call label_2214
    ld   a, b
    ld   [$FFE2], a
    ld   a, c
    ld   [$FFE3], a
    ld   a, d
    ld   [$FFE4], a
    ld   a, e
    ld   [$FFE5], a
    call label_3905
    pop  de
    pop  bc

label_22D1::
    jr   label_22FE

label_22D3::
    call label_2224
    ld   a, [$FFFE]
    and  a
    jr   z, label_22FE
    push bc
    push de
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_49D9
    ld   a, [$FFDF]
    ld   [SelectRomBank_2100], a
    call label_2224
    ld   a, b
    ld   [$FFE2], a
    ld   a, c
    ld   [$FFE3], a
    ld   a, d
    ld   [$FFE4], a
    ld   a, e
    ld   [$FFE5], a
    call label_3905
    pop  de
    pop  bc

label_22FE::
    push bc
    ld   a, [$C125]
    ld   c, a
    ld   b, $00
    ld   hl, data_2205
    add  hl, bc
    ld   a, [$FFD9]
    add  a, [hl]
    ld   [$FFD9], a
    pop  bc
    ld   a, [$C128]
    dec  a
    ld   [$C128], a
    jp   nz, label_2241
    ld   a, $20
    ld   [SelectRomBank_2100], a
    jp   $5570

label_2321::
    ld   a, [$C19F]
    and  a
    ret  z
    ld   e, a
    ld   a, [$DB95]
    cp   $01
    ld   a, $7E
    jr   nz, label_2332
    ld   a, $7F

label_2332::
    ld   [$FFE8], a
    ld   a, [$C164]
    and  a
    ld   a, [$C170]
    jr   nz, label_2341
    cp   $20
    jr   c, label_2345

label_2341::
    and  $0F
    or   $10

label_2345::
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
    call label_2924
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
    ld   [SelectRomBank_2100], a
    jp   $5449

label_2373::
    call label_2385
    ld   a, $01
    ld   [$C112], a
    ret

label_237C::
    call label_2385
    ld   a, $02
    ld   [$C112], a
    ret

label_2385::
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

data_23B0::
    db   $C9, $AF, $EA, $9F, $C1, $3E, $18, $EA, $34, $C1, $F0, $FE, $A7, $C8, $FA, $95
    db   $DB, $FE, $B, $C0, $FA, $CC, $C3, $FE, 8, $D8, $3E, $21, $EA, 0, $21, $C3

data_23D0::
    db   $CF, $53, 0, $24, $48, 0

data_23D6::
    db   $24, $48, $98, $98, $98, $99

data_23DC::
    db   $99, $99, $21, $61, $A1, $41, $81, $C1

label_23E4::
    ld   a, [$C19F]
    bit  7, a
    jr   z, label_23EF
    and  $7F
    add  a, $03

label_23EF::
    ld   e, a
    ld   d, $00
    ld   hl, data_23D0
    add  hl, de
    ld   a, [hl]
    add  a, $00
    ld   c, a
    ld   a, $D5
    adc  a, $00
    ld   b, a
    ld   hl, data_23DC
    add  hl, de
    ld   a, [$C12F]
    add  a, [hl]
    ld   l, a
    ld   [$FFD7], a
    ld   hl, data_23D6
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
    jr   nz, label_2444

label_241E::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    ld   a, l
    and  $1F
    jr   nz, label_242B
    ld   a, l
    dec  a
    and  $E0
    ld   l, a

label_242B::
    inc  e
    ld   a, e
    cp   $12
    jr   nz, label_241E
    ld   e, $00
    ld   a, [$FFD7]
    add  a, $20
    ld   [$FFD7], a
    jr   nc, label_243C
    inc  h

label_243C::
    ld   l, a
    inc  d
    ld   a, d
    cp   $02
    jr   nz, label_241E
    ret

label_2444::
    ld   a, [hl]
    ld   [bc], a
    ld   a, $01
    ld   [rVBK], a

label_244A::
    ld   a, $02
    ld   [rSVBK], a
    ld   a, [hl]
    ld   [bc], a
    xor  a
    ld   [rVBK], a
    ld   [rSVBK], a
    inc  bc
    ld   a, l
    add  a, $01
    and  $1F
    jr   nz, label_2463
    ld   a, l
    and  $E0
    ld   l, a
    jr   label_2464

label_2463::
    inc  l

label_2464::
    inc  e
    ld   a, e
    cp   $12
    jr   nz, label_2444
    ld   e, $00
    ld   a, [$FFD7]
    add  a, $20
    ld   [$FFD7], a
    jr   nc, label_2475
    inc  h

label_2475::
    ld   l, a
    inc  d
    ld   a, d
    cp   $02
    jr   nz, label_2444
    ret
    ld   a, $1C
    ld   [SelectRomBank_2100], a
    jp   $4A2C

label_2485::
    ld   hl, $C19F
    inc  [hl]
    ret
    ld   a, [$C1AB]
    and  a
    jr   nz, label_24AE
    ld   a, [$FFCC]
    and  $30
    jr   z, label_24AE

label_2496::
    xor  a
    ld   [$C16F], a
    ld   a, [$DB95]
    cp   $0D
    jr   nz, label_24A4
    xor  a
    jr   label_24AB

label_24A4::
    ld   a, [$C19F]
    and  $F0
    or   $0E

label_24AB::
    ld   [$C19F], a

label_24AE::
    ret
    ld   a, $1C
    ld   [SelectRomBank_2100], a
    jp   $4AA8
    ld   a, $1C
    ld   [SelectRomBank_2100], a
    ld   a, [$C172]
    and  a
    jr   z, label_24C7
    dec  a
    ld   [$C172], a
    ret

label_24C7::
    call label_49F1
    jp   label_2485
    ld   a, $1C
    ld   [SelectRomBank_2100], a
    ld   a, [$C19F]
    ld   c, a
    ld   a, [$C171]
    bit  7, c
    jr   z, label_24DF
    add  a, $20

label_24DF::
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
    jr   c, label_250D
    ld   a, d
    sub  a, $20
    ld   d, a

label_250D::
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
    call label_2485
    jp   label_2529

label_2529::
    ld   a, $1C
    ld   [SelectRomBank_2100], a
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
    sla  e
    rl   d
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
    ld   [SelectRomBank_2100], a
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
    call label_81D
    ld   a, e
    ld   [$FFD7], a
    cp   $FE
    jr   nz, label_25A4
    pop  hl
    xor  a
    ld   [$D601], a

label_2595::
    ld   a, [$C19F]
    and  $F0
    or   $0D
    ld   [$C19F], a

label_259F::
    ld   a, $15
    ld   [$FFF2], a
    ret

label_25A4::
    cp   $FF
    jr   nz, label_25BD
    pop  hl
    xor  a
    ld   [$D601], a

label_25AD::
    ld   a, [$C19F]
    and  $F0
    or   $0C
    ld   [$C19F], a
    ret

data_25B8::
    db $55, $49, $4A, $46, $47

label_25BD::
    cp   $20
    jr   z, label_25E0
    push af
    ld   a, [$C5AB]
    ld   d, a
    ld   e, $01
    cp   $0F
    jr   z, label_25D4
    ld   e, $07
    cp   $19
    jr   z, label_25D4
    ld   e, $03

label_25D4::
    ld   a, [$C170]
    add  a, $04
    and  e
    jr   nz, label_25DF
    ld   a, d
    ld   [$FFF3], a

label_25DF::
    pop  af

label_25E0::
    ld   d, $00
    cp   $23
    jr   nz, label_2608
    ld   a, [$C108]
    ld   e, a
    inc  a
    cp   $05
    jr   nz, label_25F0
    xor  a

label_25F0::
    ld   [$C108], a
    ld   hl, $DB4F
    ld   a, [$DB6E]
    and  a
    jr   z, label_25FF
    ld   hl, data_25B8

label_25FF::
    add  hl, de
    ld   a, [hl]
    dec  a
    cp   $FF
    jr   nz, label_2608
    ld   a, $20

label_2608::
    ld   [$FFD8], a
    ld   e, a
    ld   a, $1C
    ld   [SelectRomBank_2100], a
    ld   hl, $4641
    add  hl, de
    ld   e, [hl]
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    sla  e
    rl   d
    call label_81D
    ld   hl, $5000
    add  hl, de
    ld   c, l
    ld   b, h
    pop  hl
    ld   e, $10

label_2633::
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    dec  e
    jr   nz, label_2633
    ld   [hl], $00
    push hl
    ld   a, $1C
    ld   [SelectRomBank_2100], a
    ld   a, [$FFD8]
    ld   e, a
    ld   d, $00
    xor  a
    pop  hl
    and  a
    jr   z, label_2663
    ld   e, a
    ld   a, [$C175]
    ldi  [hl], a
    ld   a, [$C176]
    sub  a, $20
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, $C9
    rr   e
    jr   c, label_2660
    dec  a

label_2660::
    ldi  [hl], a
    ld   [hl], $00

label_2663::
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
    jr   z, label_268E

label_267E::
    ld   a, [$C19F]
    and  $F0
    or   $06
    ld   [$C19F], a
    ld   a, $00
    ld   [$C172], a
    ret

label_268E::
    jp   label_2485

data_2691::
    db $22, $42

data_2693::
    db $98, $99

label_2695::
    ld   a, [$C170]
    and  $1F
    jr   nz, label_26E1
    ld   a, [$C3C3]
    cp   $FF
    jp   z, label_25AD
    cp   $FE
    jp   z, label_2595
    ld   a, [$C1CC]
    and  a
    jr   nz, label_26B6
    inc  a
    ld   [$C1CC], a
    call label_259F

label_26B6::
    call label_27BB
    ld   a, [$FFCC]
    bit  4, a
    jr   nz, label_26E1
    bit  5, a
    jr   z, label_2714
    ld   a, $1C
    ld   [SelectRomBank_2100], a
    ld   a, [$DB95]
    cp   $07
    jp   z, label_278B
    ld   a, [$C173]
    ld   e, a
    ld   a, [$C112]
    ld   d, a
    ld   hl, $4741
    add  hl, de
    ld   a, [hl]
    and  a
    jp   z, label_278B

label_26E1::
    ld   e, $00
    ld   a, [$C19F]
    and  $80
    jr   z, label_26EB
    inc  e

label_26EB::
    ld   d, $00
    ld   hl, data_2693
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   [$D601], a
    ld   hl, data_2691
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
    call label_2485

label_2714::
    ret

data_2715::
    db $62, $82

data_2717::
    db $98, $99

label_2719::
    ld   e, $00
    ld   a, [$C19F]
    and  $80
    jr   z, label_2723
    inc  e

label_2723::
    ld   d, $00
    ld   hl, data_2717
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   b, a
    ld   hl, data_2715

label_2731::
    add  hl, de
    ld   a, [$C12F]
    add  a, [hl]
    ld   c, a
    ld   e, $10

label_2739::
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
    inc  bc
    ld   a, c
    and  $1F
    jr   nz, label_275D
    ld   a, c
    sub  a, $20
    ld   c, a

label_275D::
    dec  e
    jr   nz, label_2739
    ld   a, $08
    ld   [$C172], a
    jp   label_2485
    ret

data_2769::
    db $42, $62

data_276B::
    db $98, $99

label_276D::
    ld   e, 0
    ld   a, [$C0FB+$A4]
    and  $80 ; 'Ç'
    jr   z, label_2777
    inc  e

label_2777::
    ld   d, $00
    ld   hl, data_276B
    add  hl, de
    ld   a, [$C12E]
    add  a, [hl]
    ld   b, a
    ld   hl, data_2769
    call label_2731
    jp   label_267E

label_278B::
    ld   a, $02
    ld   [$C177], a
    jp   label_2496
    ld   a, [$FFCC]
    bit  4, a
    jp   nz, label_27B7
    and  $03
    jr   z, label_27AA
    ld   hl, $C177
    ld   a, [hl]
    inc  a
    and  $01
    ld   [hl], a
    ld   a, $0A
    ld   [$FFF2], a

label_27AA::
    ld   a, [$FFE7]
    and  $10
    ret  z
    ld   a, $17
    ld   [SelectRomBank_2100], a
    jp   $7DCC

label_27B7::
    call label_2496
    ret

label_27BB::
    ld   a, $17
    ld   [SelectRomBank_2100], a
    jp   $7D7C

label_27C3::
    ld   [$D368], a
    ld   [$FFBF], a
    ld   a, $38
    ld   [$FFAB], a
    xor  a
    ld   [$FFA8], a
    ret

label_27D0::
    push hl
    ld   hl, $4000
    ld   [hl], $00
    ld   hl, $0000
    ld   [hl], $0A
    pop  hl
    ret

label_27DD::
    ld   a, $02
    ld   [SelectRomBank_2100], a
    push bc
    call label_4146
    pop  bc
    jp   label_81D

label_27EA::
    ld   a, $38
    ld   [$FFA8], a
    xor  a
    ld   [$FFAB], a
    ret

label_27F2::
    ld   a, [$FFBC]
    and  a
    jr   nz, label_27FF
    ld   a, $1F
    ld   [SelectRomBank_2100], a
    call label_4003

label_27FF::
    jp   label_81D

label_2802::
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_5E67
    jp   label_81D

label_280D::
    push hl
    ld   a, [$FFE7]
    ld   hl, $C13D
    add  a, [hl]
    ld   hl, rLY
    add  a, [hl]
    rrca
    ld   [$C13D], a
    pop  hl
    ret

label_281E::
    ld   a, [$C124]
    and  a
    jr   nz, label_2886
    ld   a, [$DB95]
    cp   $0B
    jr   nz, label_2852
    ld   a, [$DB96]
    cp   $07
    jr   nz, label_284C
    ld   a, [$C11C]
    cp   $07
    jr   nz, label_283F
    ld   a, [$FF9C]
    cp   $04
    jr   z, label_2852

label_283F::
    ld   a, [$C16B]
    cp   $04
    jr   nz, label_284C
    ld   a, [$DDD5]
    and  a
    jr   z, label_2852

label_284C::
    xor  a
    ld   [$FFCB], a
    ld   [$FFCC], a
    ret

label_2852::
    ld   a, $20
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    cpl
    and  $0F
    ld   b, a
    ld   a, $10
    ld   [rJOYP], a
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    ld   a, [$FF00]
    swap a
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
    ld   [rJOYP], a

label_2886::
    ret

label_2887::
    push bc
    ld   a, [$FFCD]
    ld   hl, $FF97
    add  a, [hl]
    and  $F8
    srl  a
    srl  a
    srl  a
    ld   de, $0000
    ld   e, a
    ld   hl, $9800
    ld   b, $20

label_289F::
    add  hl, de
    dec  b
    jr   nz, label_289F
    push hl
    ld   a, [$FFCE]
    ld   hl, $FF96
    add  a, [hl]
    pop  hl
    and  $F8
    srl  a
    srl  a
    srl  a
    ld   de, $0000
    ld   e, a
    add  hl, de
    ld   a, h
    ld   [$FFCF], a
    ld   a, l
    ld   [$FFD0], a
    pop  bc
    ret

func_28C0::
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    pop  hl
    add  hl, de
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    ld   l, e
    ld   h, d
    jp   [hl]

label_28CF::
    ld   a, [$FFFF]
    ld   [$FFD2], a
    res  0, a
    ld   [rIE], a

label_28D7::
    ld   a, [$FF44]
    cp   $91
    jr   nz, label_28D7
    ld   a, [$FF40]
    and  $7F
    ld   [rLCDC], a
    ld   a, [$FFD2]
    ld   [rIE], a
    ret
    ld   a, $01
    call label_80C
    jp   $6CE3
    ld   a, $7E
    ld   bc, $0400
    jr   label_28FC

label_28F7::
    ld   a, $7F
    ld   bc, $0800

label_28FC::
    ld   d, a
    ld   hl, $9800

label_2900::
    ld   a, d
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, label_2900
    ret

label_2908::
    ld   [SelectRomBank_2100], a
    call CopyData
    ld   a, $01
    ld   [SelectRomBank_2100], a
    ret

include "CopyData.asm"

label_291D::
    inc  de
    ld   h, a
    ld   a, [de]
    ld   l, a
    inc  de
    ld   a, [de]
    inc  de

label_2924::
    call label_2941

label_2927::
    ld   a, [$C124]
    and  a
    jr   nz, label_293C

label_292D::
    ld   a, [de]
    and  a
    jr   nz, label_291D
    ret

label_2932::
    inc  de
    ld   h, a
    ld   a, [de]
    ld   l, a
    inc  de
    ld   a, [de]
    inc  de
    call label_2991

label_293C::
    ld   a, [de]
    and  a
    jr   nz, label_2932
    ret

label_2941::
    push af
    and  $3F
    ld   b, a
    inc  b
    pop  af
    rlca
    rlca
    and  $03
    jr   z, label_2955
    dec  a
    jr   z, label_2966
    dec  a
    jr   z, label_2977
    jr   label_2984

label_2955::
    ld   a, [de]
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, label_2961
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

label_2961::
    inc  de
    dec  b
    jr   nz, label_2955
    ret

label_2966::
    ld   a, [de]
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, label_2972
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

label_2972::
    dec  b
    jr   nz, label_2966
    inc  de
    ret

label_2977::
    ld   a, [de]
    ld   [hl], a
    inc  de
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, label_2977
    ret

label_2984::
    ld   a, [de]
    ld   [hl], a
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, label_2984
    inc  de
    ret

label_2991::
    push af
    and  $3F
    ld   b, a
    inc  b
    pop  af
    and  $80
    jr   nz, label_29B0

label_299B::
    ld   a, [de]
    cp   $EE
    jr   z, label_29AB
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, label_29AB
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

label_29AB::
    inc  de
    dec  b
    jr   nz, label_299B
    ret

label_29B0::
    ld   a, [de]
    cp   $EE
    jr   z, label_29B6
    ld   [hl], a

label_29B6::
    inc  de
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, label_29B0
    ret

label_29C1::
    ld   bc, $1600
    jr   label_29DC

label_29C6::
    ld   bc, $1300
    jr   label_29DC

label_29CB::
    ld   bc, $002F
    jr   label_29D3

label_29D0::
    ld   bc, $006D

label_29D3::
    ld   hl, $FF90
    call ZeroMemory
    ld   bc, $1F00

label_29DC::
    ld   hl, $C000

ZeroMemory::
    ld   a, [$FFFE]
    push af

label_29E2::
    xor  a
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, label_29E2
    pop  af
    ld   [$FFFE], a
    ret

label_29ED::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_5884
    jp   label_81D

label_29F8::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4C98
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ret

label_2A07::
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_5A59
    jp   label_81D

label_2A12::
    ld   a, $08
    ld   [SelectRomBank_2100], a
    ld   hl, $4AD4
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_2A23
    ld   hl, $4BD4

label_2A23::
    add  hl, de
    ld   a, [hl]
    ret

label_2A26::
    call label_2A12
    jp   label_81D

label_2A2C::
    call label_2A12
    push af
    ld   a, $03
    ld   [SelectRomBank_2100], a
    pop  af
    ret

label_2A37::
    ld   a, $13
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0800
    call CopyData
    ld   hl, $7000
    ld   de, $8800
    ld   bc, $0800
    jp   CopyData

label_2A57::
    call label_2A66
    ld   de, $8400
    ld   hl, $7600
    ld   bc, $0100
    jp   CopyData

label_2A66::
    ld   a, $13
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $4000
    ld   de, $8000
    ld   bc, $1800
    call CopyData
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $57E0
    ld   de, $97F0
    ld   bc, $0010
    call CopyData
    ld   a, $12
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $7500
    ld   de, $8000
    ld   bc, $0040
    call CopyData
    ld   de, $8D00
    ld   hl, $7500
    ld   bc, $0200
    jp   CopyData
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $5000
    ld   de, $9000
    ld   bc, $0800
    call CopyData
    ld   a, $12
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $6000
    ld   de, $8000
    ld   bc, $0800
    call CopyData
    ld   a, $0F
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $6000
    ld   de, $8800
    ld   bc, $0800
    jp   CopyData
    ld   hl, $4000
    ld   a, [$FFFE]
    and  a
    jr   z, label_2B01
    ld   hl, $6800
    ld   a, $35
    jr   label_2B06
    ld   hl, $4800
    jr   label_2B01
    ld   hl, $6000

label_2B01::
    ld   a, $13
    call label_B0B

label_2B06::
    ld   [SelectRomBank_2100], a
    ld   de, $8000
    ld   bc, $0800
    call CopyData
    ld   a, $13
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $5800
    ld   de, $8800
    ld   bc, $1000
    jp   CopyData
    call label_8A4
    ld   hl, $6800
    ld   a, $10
    call label_2B92
    call label_8A4
    ld   a, $12
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $6600
    ld   de, $8000
    ld   bc, $0080
    call CopyData
    call label_8A4
    ld   a, [$FFFE]
    and  a
    jr   nz, label_2B61
    ld   a, $10
    ld   [SelectRomBank_2100], a
    ld   hl, $6900
    ld   de, $8100
    ld   bc, $0700
    jp   CopyData

label_2B61::
    ld   a, $38
    ld   [SelectRomBank_2100], a
    ld   hl, $5000
    ld   de, $8000
    ld   bc, $0800
    jp   CopyData
    ld   hl, $7800
    ld   a, [$FFFE]
    and  a
    jr   z, label_2B90
    ld   hl, $7800
    ld   a, $35
    jr   label_2B95
    ld   hl, $4800
    ld   a, [$FFFE]
    and  a
    jr   z, label_2B90
    ld   hl, $7000
    ld   a, $35
    jr   label_2B95

label_2B90::
    ld   a, $13

label_2B92::
    call label_B0B

label_2B95::
    ld   [SelectRomBank_2100], a
    ld   de, $8000
    ld   bc, $0800
    call CopyData
    ld   a, $13
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $7000
    ld   de, $8800
    ld   bc, $0800
    call CopyData
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0800
    jp   CopyData

label_2BC1::
    push bc
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_5838
    call label_81D
    pop  bc
    ret

label_2BCF::
    ld   a, $0C
    call label_813
    ld   hl, data_bank_c_0000
    ld   de, $8000
    ld   bc, data_bank_c_0400-data_bank_c_0000
    call CopyData
    ld   a, $0C
    call label_813
    ld   hl, data_bank_c_0800
    ld   de, $8800
    ld   bc, data_bank_c_1800-data_bank_c_0800
    call CopyData
    ld   hl, data_bank_c_07A0
    ld   de, $8E00
    ld   bc, data_bank_c_07C0-data_bank_c_07A0
    call CopyData
    ld   a, $01
    call label_80C
    ret

    call label_2BCF
    ld   a, $0F
    call label_813
    ld   hl, $4000
    ld   de, $8800
    ld   bc, $0400
    call CopyData
    ld   a, $0F
    call label_813
    ld   hl, $5000
    ld   de, $9000
    ld   bc, $0800
    jp   CopyData
    ld   a, $20
    call label_80C
    ld   hl, $4589
    ld   a, [$FFF7]
    ld   e, a
    ld   d, $00
    cp   $FF
    jr   nz, label_2C53
    ld   a, $35
    ld   [SelectRomBank_2100], a
    ld   hl, $6200
    ld   de, $9000
    ld   bc, $0100
    call CopyData
    ld   e, $00
    ld   d, e
    ld   hl, $6000
    push de
    jr   label_2C5D

label_2C53::
    push de
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    ld   a, $0D
    call label_813

label_2C5D::
    ld   de, $9100
    ld   bc, $0100
    call CopyData
    ld   a, $0D
    call label_813
    ld   hl, $4000
    ld   de, $9200
    ld   bc, $0600
    call CopyData
    ld   a, $20
    ld   [SelectRomBank_2100], a
    pop  de
    push de
    ld   hl, $45A9
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_2C8A
    ld   hl, $45C9

label_2C8A::
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    call label_81D
    ld   de, $9200
    ld   bc, $0200
    call CopyData
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $47C0
    ld   de, $DCC0
    ld   bc, $0040
    call CopyData
    call label_2D50
    ld   a, $20
    ld   [SelectRomBank_2100], a
    pop  de
    ld   hl, $45CA
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    ld   a, $12
    call label_813
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_2CD1
    ld   hl, $6100
    ld   a, $35
    ld   [SelectRomBank_2100], a

label_2CD1::
    ld   de, $8F00
    ld   bc, $0100
    call CopyData
    ld   a, [$DBAF]
    ld   [SelectRomBank_2100], a
    ld   hl, $7D00
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_2CF5
    cp   $0A
    jr   c, label_2CF5
    ld   a, $0C
    call label_813
    ld   hl, $4C00

label_2CF5::
    ld   de, $8C00
    ld   bc, $0300
    call CopyData

label_2CFE::
    ld   a, [$DB4B]
    and  a
    jr   z, label_2D07
    call label_1E2B

label_2D07::
    ld   a, [$DBA5]
    and  a
    jr   z, label_2D17
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_2D21
    cp   $0A
    jr   c, label_2D21

label_2D17::
    ld   a, [$DB15]
    cp   $06
    jr   c, label_2D21
    call label_1EA1

label_2D21::
    ld   a, [$DB0E]
    cp   $02
    jr   c, label_2D2C
    ld   a, $0D
    ld   [$FFA5], a

label_2D2C::
    ret
    ld   a, $0C
    call label_813
    ld   hl, $5200
    ld   de, $9200
    ld   bc, $0600
    call CopyData
    ld   hl, $4C00
    ld   de, $8C00
    ld   bc, $0400
    call CopyData
    call label_2D50
    jp   label_2CFE

label_2D50::
    xor  a
    ld   [$FFA6], a
    ld   [$FFA7], a
    call label_1BD2
    ld   a, $0C
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $4800
    ld   de, $8800
    ld   bc, $0800
    call CopyData
    ld   hl, $4200
    ld   de, $8200
    ld   bc, $0100
    call CopyData
    ret
    ld   a, $01
    call label_80C
    ld   hl, $6D4A
    ld   de, $8700
    ld   bc, $0080
    call CopyData
    ld   a, $10
    call label_813
    ld   hl, $5400
    ld   de, $8000
    ld   bc, $0600
    call CopyData
    ld   hl, $4000
    ld   de, $8800
    ld   bc, $1000
    jp   CopyData
    ld   a, $0F
    call label_813
    ld   hl, $4900
    ld   de, $8800
    ld   bc, $0700
    call CopyData
    ld   a, $38
    call label_80C
    ld   a, [$FFFE]
    and  a
    jr   nz, label_2DC7
    ld   hl, $5C00
    jr   label_2DCA

label_2DC7::
    ld   hl, $5800

label_2DCA::
    ld   de, $8400
    ld   bc, $0400
    call CopyData
    ld   a, [$FFFE]
    and  a
    jr   nz, label_2DDD
    ld   hl, $6600
    jr   label_2DE0

label_2DDD::
    ld   hl, $6500

label_2DE0::
    ld   de, $8200
    ld   bc, $0100
    jp   CopyData
    ld   a, $0C
    call label_813
    ld   hl, $7800
    ld   de, $8F00
    ld   bc, $0800
    call CopyData
    ld   hl, $5000
    ld   de, $8200
    ld   bc, $0100
    jp   CopyData
    ld   hl, $7000
    jr   label_2E13
    ld   hl, $7800
    jr   label_2E13
    ld   hl, $5800

label_2E13::
    ld   a, $10
    call label_813
    ld   de, $9000
    ld   bc, $0800
    jp   CopyData
    ld   a, $13
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   hl, $7C00
    ld   de, $8C00
    ld   bc, $0400
    call CopyData
    ld   hl, $6800
    ld   de, $9000
    ld   bc, $0400
    jp   CopyData
    ld   a, $10
    call label_813
    ld   hl, $6700
    ld   de, $8400
    ld   bc, $0400
    call CopyData
    ld   hl, $6000
    ld   de, $9000
    ld   bc, $0600
    jp   CopyData
    ld   a, $0F
    call label_80C
    ld   hl, $4400
    ld   de, $8800
    ld   bc, $0500
    jp   CopyData

data_2E6F::
    db 0

label_2E70::
    ld   de, $120E
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_2E84
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_475A
    jp   label_2F12

label_2E84::
    xor  a

label_2E85::
    ld   [$FFD7], a
    ld   hl, $C193
    ld   e, a
    ld   d, $00
    add  hl, de
    and  a
    jr   nz, label_2ED3
    ld   a, [$DBA5]
    and  a
    jr   z, label_2EB0
    ld   a, [$FFF9]
    and  a
    jr   nz, label_2ED3
    ld   a, [$FFF7]
    cp   $14
    jr   z, label_2ED3
    cp   $0A
    jr   c, label_2ED3
    ld   a, [$FFF6]
    cp   $FD
    jr   z, label_2ED3
    cp   $B1
    jr   z, label_2ED3

label_2EB0::
    ld   a, [$DB56]
    cp   $01
    ld   a, $A4
    jr   z, label_2ED1
    ld   a, [$DB79]
    and  a
    ld   a, $D8
    jr   nz, label_2ED1
    ld   a, [$DB7B]
    and  a
    ld   a, $DD
    jr   nz, label_2ED1
    ld   a, [$DB73]
    and  a
    jr   z, label_2ED3
    ld   a, $8F

label_2ED1::
    jr   label_2ED4

label_2ED3::
    ld   a, [hl]

label_2ED4::
    and  a
    jr   z, label_2F0A
    push af
    and  $3F
    ld   b, a
    ld   c, $00
    pop  af
    swap a
    rra
    rra
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, data_2E6F
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_2EF2
    call label_B0B

label_2EF2::
    ld   [SelectRomBank_2100], a
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
    call CopyData

label_2F0A::
    ld   a, [$FFD7]
    inc  a
    cp   $04
    jp   nz, label_2E85

label_2F12::
    ld   de, $9000
    ld   a, [$DBA5]
    and  a
    jp   z, label_2FAD
    ld   a, $0D
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   a, [$FFF9]
    and  a
    jr   z, label_2F4B
    ld   hl, $7000
    ld   a, [$FFF7]
    cp   $06
    jr   z, label_2F41
    cp   $0A
    jr   nc, label_2F3B

label_2F36::
    ld   hl, $7800
    jr   label_2F41

label_2F3B::
    ld   a, [$FFF6]
    cp   $E9
    jr   z, label_2F36

label_2F41::
    ld   de, $9000
    ld   bc, $0800
    call CopyData
    ret

label_2F4B::
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_2F57
    ld   a, [$FFF6]
    cp   $12
    jr   nz, label_2F69

label_2F57::
    ld   hl, $5000
    ld   a, [$FF94]
    cp   $FF
    jr   z, label_2F69
    add  a, $50
    ld   h, a
    ld   bc, $0100
    call CopyData

label_2F69::
    ld   a, [$FFF7]
    cp   $10
    jr   nz, label_2F87
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, label_2F87
    ld   a, $35
    ld   [SelectRomBank_2100], a
    ld   hl, $6600
    ld   de, $8F00
    ld   bc, $0200
    call CopyData
    ret

label_2F87::
    ld   a, [$FFFE]
    and  a
    ret  z
    ld   a, [$FFF7]
    and  a
    ret  nz
    ld   a, $35
    ld   [SelectRomBank_2100], a
    ld   hl, $6E00
    ld   de, $9690
    ld   bc, $0010
    call CopyData
    ld   hl, $6E10
    ld   de, $9790
    ld   bc, $0010
    call CopyData
    ret

label_2FAD::
    ld   a, $0F
    call label_B0B
    ld   [SelectRomBank_2100], a
    ld   a, [$FF94]
    cp   $0F
    jr   z, label_2FC6
    add  a, $40
    ld   h, a
    ld   l, $00
    ld   bc, $0200
    call CopyData

label_2FC6::
    ret

label_2FC7::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    ret

label_2FCD::
    ld   a, [hl]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   hl, $6749
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_2FEC
    cp   $10
    jr   nz, label_2FF1
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, label_2FF1

label_2FEC::
    ld   hl, $4760
    jr   label_2FFA

label_2FF1::
    ld   a, [$DBA5]
    and  a
    jr   z, label_2FFA
    ld   hl, $4000

label_2FFA::
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

label_300E::
    ld   a, $02
    ld   [rSVBK], a
    ld   c, [hl]
    xor  a
    ld   [rSVBK], a
    jr   label_3019

label_3018::
    ld   c, [hl]

label_3019::
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    ld   a, $1A
    ld   [SelectRomBank_2100], a
    call label_6576
    call label_3905
    ld   a, [$DBA5]
    and  a
    jr   z, label_304C
    ld   hl, $43B0
    ld   a, [$FFF7]
    cp   $FF
    jr   z, label_3047
    cp   $10
    jr   nz, label_304F
    ld   a, [$FFF6]
    cp   $B5
    jr   nz, label_304F

label_3047::
    ld   hl, $4760
    jr   label_304F

label_304C::
    ld   hl, $6B1D

label_304F::
    push de
    add  hl, bc
    call label_2FC7
    pop  de
    push hl
    ld   a, [$FFDF]
    ld   [SelectRomBank_2100], a
    ld   a, [$FFE0]
    ld   h, a
    ld   a, [$FFE1]
    ld   l, a
    ld   a, $01
    ld   [rVBK], a
    call label_2FC7
    xor  a
    ld   [rVBK], a
    call label_3905
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
    call label_2FC7
    pop  de
    ld   a, [$FFDF]
    ld   [SelectRomBank_2100], a
    ld   a, [$FFE0]
    ld   h, a
    ld   a, [$FFE1]
    ld   l, a
    ld   a, $01
    ld   [rVBK], a
    call label_2FC7
    xor  a
    ld   [rVBK], a
    call label_3905
    ret
    call label_3905
    call label_80C
    ld   de, $9800
    ld   hl, WR1_TileMap
    ld   c, $80

label_30A9::
    push de
    push hl
    push bc
    ld   a, [$FFFE]
    and  a
    jr   nz, label_30B6
    call label_2FCD
    jr   label_30C4

label_30B6::
    ld   a, [$DBA5]
    and  a
    jr   z, label_30C1
    call label_3018
    jr   label_30C4

label_30C1::
    call label_300E

label_30C4::
    pop  bc
    pop  hl
    pop  de
    inc  hl
    ld   a, l
    and  $0F
    cp   $0B
    jr   nz, label_30D5
    ld   a, l
    and  $F0
    add  a, $11
    ld   l, a

label_30D5::
    ld   a, e
    add  a, $02
    ld   e, a
    and  $1F
    cp   $14
    jr   nz, label_30E9
    ld   a, e
    and  $E0
    add  a, $40
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a

label_30E9::
    dec  c
    jr   nz, label_30A9
    ld   a, $01
    ld   [SelectRomBank_2100], a
    jp   label_6DEA

label_30F4::
    ld   a, $01
    ld   [rIE], a
    ld   hl, $D47F
    inc  [hl]
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4CA3
    ld   a, [$FFFE]
    and  a
    jr   z, label_3119
    ld   a, $21
    ld   [SelectRomBank_2100], a
    call label_40B3
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_6DAF

label_3119::
    ld   a, $09
    ld   [SelectRomBank_2100], a
    ld   a, [$DBA5]
    and  a
    jr   z, label_313A
    ld   a, $14
    ld   [SelectRomBank_2100], a
    ld   [$FFE8], a
    call label_5897
    ld   e, a
    ld   hl, WR1_KillCount2

label_3132::
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $11
    jr   nz, label_3132

label_313A::
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   hl, $D800
    ld   a, [$DBA5]
    and  a
    jr   z, label_3161
    ld   hl, $D900
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_3156
    ld   hl, $DDE0
    jr   label_3161

label_3156::
    cp   $1A
    jr   nc, label_3161
    cp   $06
    jr   c, label_3161
    ld   hl, $DA00

label_3161::
    add  hl, de
    ld   a, [$FFF9]
    and  a
    ld   a, [hl]
    jr   nz, label_316B
    or   $80
    ld   [hl], a

label_316B::
    ld   [$FFF8], a
    ld   a, [$FFF6]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    ld   a, [$DBA5]
    and  a
    jr   z, label_31BF
    ld   a, $0A
    ld   [SelectRomBank_2100], a
    ld   [$FFE8], a
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_318F
    ld   hl, $7B77
    jp   label_3224

label_318F::
    cp   $1F
    jr   nz, label_31A6
    ld   a, [$FFF6]
    cp   $F5
    jr   nz, label_31A6
    ld   a, [$DB0E]
    cp   $0E
    jr   nz, label_31A6
    ld   bc, $7855
    jp   label_323A

label_31A6::
    ld   hl, $4000
    ld   a, [$FFF7]
    cp   $1A
    jr   nc, label_3224
    cp   $06
    jr   c, label_3224
    ld   a, $0B
    ld   [SelectRomBank_2100], a
    ld   [$FFE8], a
    ld   hl, $4000
    jr   label_3224

label_31BF::
    ld   a, [$FFF6]
    cp   $0E
    jr   nz, label_31D1
    ld   a, [$D80E]
    and  $10
    jr   z, label_3221
    ld   bc, $47EC
    jr   label_322F

label_31D1::
    cp   $8C
    jr   nz, label_31E1
    ld   a, [$D88C]
    and  $10
    jr   z, label_3221
    ld   bc, $434E
    jr   label_322F

label_31E1::
    cp   $79
    jr   nz, label_31F1
    ld   a, [$D879]
    and  $10
    jr   z, label_3221
    ld   bc, $6513
    jr   label_322F

label_31F1::
    cp   $06
    jr   nz, label_3201
    ld   a, [$D806]
    and  $10
    jr   z, label_3221
    ld   bc, $4496
    jr   label_322F

label_3201::
    cp   $1B
    jr   nz, label_3211
    ld   a, [$D82B]
    and  $10
    jr   z, label_3221
    ld   bc, $4C0F
    jr   label_322F

label_3211::
    cp   $2B
    jr   nz, label_3221
    ld   a, [$D82B]
    and  $10
    jr   z, label_3221
    ld   bc, $509A
    jr   label_322F

label_3221::
    ld   hl, $4000

label_3224::
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_323A

label_322F::
    ld   a, [$FFF6]
    cp   $80
    jr   c, label_323A
    ld   a, $1A
    ld   [SelectRomBank_2100], a

label_323A::
    ld   a, [bc]
    cp   $FE
    jr   z, label_328E
    ld   [$FFA4], a
    inc  bc
    ld   a, [$DBA5]
    and  a
    jr   z, label_3258
    ld   a, [bc]
    and  $0F
    call FillTileMapWith
    ld   a, [bc]
    swap a
    and  $0F
    call label_38EA
    jr   label_325C

label_3258::
    ld   a, [bc]
    call FillTileMapWith

label_325C::
    inc  bc
    ld   a, [bc]
    and  $FC
    cp   $E0
    jr   nz, label_3284
    ld   a, [$FFE6]
    ld   e, a
    ld   d, $00
    ld   hl, $D401
    add  hl, de
    ld   a, [bc]
    and  $03
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    ld   a, e
    add  a, $05
    ld   [$FFE6], a
    jr   label_325C

label_3284::
    ld   a, [bc]
    cp   $FE
    jr   z, label_328E
    call label_32A9
    jr   label_325C

label_328E::
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_6CCE
    ld   a, $36
    ld   [SelectRomBank_2100], a
    call label_6D4D
    ld   a, $21
    ld   [SelectRomBank_2100], a
    call label_53F3
    jp   label_81D

label_32A9::
    xor  a
    ld   [$FFD7], a
    ld   a, [bc]
    bit  7, a
    jr   z, label_32B8
    bit  4, a
    jr   nz, label_32B8
    ld   [$FFD7], a
    inc  bc

label_32B8::
    inc  bc
    ld   a, [$FFF8]
    ld   e, a
    ld   a, [$DBA5]
    and  a
    jr   nz, label_32D9
    ld   a, [bc]
    sub  a, $F5
    jr   c, label_3304
    ld   a, [bc]
    ld   d, a
    dec  bc
    ld   a, [bc]
    ld   e, a
    inc  bc
    ld   a, $24
    ld   [SelectRomBank_2100], a
    call label_7578
    call label_353B
    ret

label_32D9::
    ld   a, [bc]
    sub  a, $EC
    jp  c, label_33CB
    rst  0
    ld   a, [label_1535]
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

label_3304::
    add  a, $F5
    push af
    ld   d, a
    cp   $E9
    jr   nz, label_330F
    ld   [$C50E], a

label_330F::
    cp   $5E
    jr   nz, label_3317
    bit  5, e
    jr   nz, label_337C

label_3317::
    cp   $91
    jr   nz, label_3324
    bit  5, e
    jr   z, label_3324
    pop  af
    ld   a, $5E
    ld   d, a
    push af

label_3324::
    cp   $DC
    jr   nz, label_3331
    bit  5, e
    jr   z, label_3331
    pop  af
    ld   a, $91
    ld   d, a
    push af

label_3331::
    cp   $D8
    jr   z, label_333D
    cp   $D9
    jr   z, label_333D
    cp   $DA
    jr   nz, label_3346

label_333D::
    bit  4, e
    jr   z, label_3346
    pop  af
    ld   a, $DB
    ld   d, a
    push af

label_3346::
    cp   $C2
    jr   nz, label_3353
    bit  4, e
    jr   z, label_3353
    pop  af
    ld   a, $E3
    ld   d, a
    push af

label_3353::
    ld   a, d
    cp   $BA
    jr   nz, label_3361
    bit  2, e
    jr   z, label_3361
    pop  af
    ld   a, $E1
    ld   d, a
    push af

label_3361::
    ld   a, d
    cp   $D3
    jr   nz, label_3381
    bit  4, e
    jr   z, label_3381
    ld   a, [$FFF6]
    cp   $75
    jr   z, label_337C
    cp   $07
    jr   z, label_337C
    cp   $AA
    jr   z, label_337C
    cp   $4A
    jr   nz, label_3381

label_337C::
    pop  af
    ld   a, $C6
    ld   d, a
    push af

label_3381::
    ld   a, d
    ld   [$FFE0], a
    cp   $C2
    jr   z, label_33A8
    cp   $E1
    jr   z, label_33A8
    cp   $CB
    jr   z, label_33A8
    cp   $BA
    jr   z, label_33A8
    cp   $61
    jr   z, label_33A8
    cp   $C6
    jr   z, label_33A8
    cp   $C5
    jr   z, label_33A8
    cp   $E2
    jr   z, label_33A8
    cp   $E3
    jr   nz, label_33BC

label_33A8::
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
    inc  bc

label_33BC::
    ld   a, [$FFE0]
    cp   $C5
    jp   z, label_347D
    cp   $C6
    jp   z, label_347D
    jp   label_34CE

label_33CB::
    add  a, $EC
    ld   [$FFE0], a
    push af
    cp   $CF
    jr   c, label_33DC
    cp   $D3
    jr   nc, label_33DC
    ld   hl, $C1A5
    inc  [hl]

label_33DC::
    cp   $AB
    jr   nz, label_3407
    xor  a
    ld   [$C3CB], a
    ld   a, [$FFF6]
    cp   $C4
    ld   a, [$FFE0]
    jr   z, label_3407
    ld   hl, $DBC9
    inc  [hl]
    ld   [$C3CB], a
    push af
    ld   a, [$C3CD]
    add  a, $04
    ld   [$C3CD], a
    ld   a, [$FFFE]
    and  a
    jr   nz, label_3406
    ld   a, $04
    ld   [$C16B], a

label_3406::
    pop  af

label_3407::
    cp   $8E
    jr   z, label_341E
    cp   $AA
    jr   z, label_341E
    cp   $DC
    jr   z, label_3417
    cp   $DB
    jr   nz, label_3423

label_3417::
    ld   hl, $D6FA
    ld   [hl], $02
    jr   label_3423

label_341E::
    ld   hl, $D6FA
    ld   [hl], $01

label_3423::
    cp   $3F
    jr   z, label_342B
    cp   $47
    jr   nz, label_342F

label_342B::
    bit  2, e
    jr   nz, label_343B

label_342F::
    cp   $40
    jr   z, label_3437
    cp   $48
    jr   nz, label_343F

label_3437::
    bit  3, e
    jr   z, label_343F

label_343B::
    pop  af
    ld   a, $3D
    push af

label_343F::
    cp   $41
    jr   z, label_3447
    cp   $49
    jr   nz, label_344B

label_3447::
    bit  1, e
    jr   nz, label_3457

label_344B::
    cp   $42
    jr   z, label_3453
    cp   $4A
    jr   nz, label_345B

label_3453::
    bit  0, e
    jr   z, label_345B

label_3457::
    pop  af
    ld   a, $3E
    push af

label_345B::
    cp   $A1
    jr   nz, label_3467
    bit  4, e
    jr   nz, label_3467
    pop  af
    ld   a, [$FFE9]
    push af

label_3467::
    cp   $BF
    jr   nz, label_3471
    bit  4, e
    jr   nz, label_3471
    pop  af
    ret

label_3471::
    cp   $BE
    jr   z, label_347D
    cp   $BF
    jr   z, label_347D
    cp   $CB
    jr   nz, label_3496

label_347D::
    dec  bc
    ld   a, $01
    ld   [$FFAC], a
    ld   a, [bc]
    and  $F0
    add  a, $10
    ld   [$FFAE], a
    ld   a, [bc]
    swap a
    and  $F0
    add  a, $08
    ld   [$FFAD], a
    inc  bc
    jp   label_34CE

label_3496::
    cp   $D6
    jr   z, label_349E
    cp   $D5
    jr   nz, label_34A6

label_349E::
    bit  4, e
    jr   nz, label_34A6
    pop  af
    ld   a, $21
    push af

label_34A6::
    cp   $D7
    jr   z, label_34AE
    cp   $D8
    jr   nz, label_34B6

label_34AE::
    bit  4, e
    jr   nz, label_34B6
    pop  af
    ld   a, $22
    push af

label_34B6::
    ld   a, [$FFF7]
    cp   $0A
    ld   a, [$FFE0]
    jr   c, label_34C2
    cp   $A9
    jr   z, label_34C6

label_34C2::
    cp   $DE
    jr   nz, label_34CE

label_34C6::
    bit  6, e
    jr   z, label_34CE
    pop  af
    ld   a, $0D

label_34CD::
    push af

label_34CE::
    cp   $A0
    jr   nz, label_34DA
    bit  4, e
    jr   z, label_34DA
    pop  af
    ld   a, $A1
    push af

label_34DA::
    ld   d, $00
    ld   a, [$FFD7]
    and  a
    jr   z, label_352D
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   hl, WR1_TileMap
    add  hl, de
    ld   a, [$FFD7]
    and  $0F
    ld   e, a
    pop  af
    ld   d, a

label_34EF::
    ld   a, d
    ldi  [hl], a
    ld   a, [$FFD7]
    and  $40
    jr   z, label_34FB
    ld   a, l
    add  a, $0F
    ld   l, a

label_34FB::
    dec  e
    jr   nz, label_34EF
    inc  bc
    ret

label_3500::
    cp   $04
    ret  z
    cp   $09
    jr   nz, label_350E
    ld   a, [$FFF6]
    cp   $97
    ret  nz
    jr   label_3527

label_350E::
    cp   $E1
    jr   nz, label_351D
    ld   a, [$FFF6]
    cp   $0E
    ret  z
    cp   $0C
    ret  z
    cp   $1B
    ret  z

label_351D::
    ld   a, [$FFF6]
    cp   $80
    jr   nc, label_3527
    ld   a, $09
    jr   label_3529

label_3527::
    ld   a, $1A

label_3529::
    call label_B2F
    ret

label_352D::
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   hl, WR1_TileMap
    add  hl, de
    pop  af
    ld   [hl], a
    call label_3500
    inc  bc
    ret

label_353B::
    ld   a, [$FFF6]
    cp   $80
    jr   nc, label_3545
    ld   a, $09
    jr   label_3547

label_3545::
    ld   a, $1A

label_3547::
    ld   [SelectRomBank_2100], a
    ret

label_354B::
    push hl
    push de
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [de]
    cp   $E1
    jr   z, label_3560
    cp   $E2
    jr   z, label_3560
    cp   $E3
    jr   nz, label_357C

label_3560::
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

label_357C::
    ld   [hl], a
    call label_3500
    inc  de
    inc  bc
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, label_354B
    pop  bc
    ret

label_358B::
    push hl
    push de
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [de]
    cp   $E1
    jr   z, label_35A0
    cp   $E2
    jr   z, label_35A0
    cp   $E3
    jr   nz, label_35BC

label_35A0::
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

label_35BC::
    ld   [hl], a
    call label_35CB
    inc  de
    inc  bc
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, label_358B
    pop  bc
    ret

label_35CB::
    cp   $04
    ret  z
    cp   $09
    jr   nz, label_35D9
    ld   a, [$FFF6]
    cp   $97
    ret  nz
    jr   label_35E8

label_35D9::
    cp   $E1
    jr   nz, label_35E8
    ld   a, [$FFF6]
    cp   $0E
    ret  z
    cp   $0C
    ret  z
    cp   $1B
    ret  z

label_35E8::
    ld   a, $24
    call label_B2F
    ret

label_35EE::
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    ld   hl, WR1_TileMap
    add  hl, de
    ret

data_35F8::
    db $2D, $2E

label_35FA::
    ld   e, 0
    call label_373F
    ld   a, [$FFF8]
    and  $04
    jp   nz, label_36B2
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_35F8
    jp   label_354B

data_3613::
    db   $2F, $30, $1E, 1, $CD, $3F, $37, $F0, $F8, $E6, 8, $C2, $EA, $36, $C5, $CD
    db   $EE, $35, 1, $E1, $37, $11, $13, $36, $C3, $4B, $35

data_362E::
    db   $31, $32, $1E, 2, $CD, $3F, $37, $F0, $F8, $E6, 2, $C2, $FE, $36, $C5, $CD
    db   $EE, $35, 1, $E4, $37, $11, $2E, $36, $C3, $4B, $35

data_3649::
    db   $33, $34, $1E, 3, $CD, $3F, $37, $F0, $F8, $E6, 1, $C2, $12, $37, $C5, $CD
    db   $EE, $35, 1, $E4, $37, $11, $49, $36, $C3, $4B, $35, $1E, 4, $CD, $3F, $37
    db   $FA, $8A, $C1, $F6, 1, $EA, $8A, $C1, $EA, $8B, $C1, $C3, $B2, $36

data_3677::
    db   $1E, 5, $CD, $3F, $37, $FA, $8A, $C1, $F6, 2, $EA, $8A, $C1, $EA, $8B, $C1
    db   $C3, $EA, $36, $1E, 6, $CD, $3F, $37, $FA, $8A, $C1, $F6, 4, $EA, $8A, $C1
    db   $EA, $8B, $C1, $C3, $FE, $36, $1E, 7, $CD, $3F, $37, $FA, $8A, $C1, $F6, 8
    db   $EA, $8A, $C1, $EA, $8B, $C1, $C3, $12, $37

data_36B0::
    db   $43, $44

label_36B2::
    ld   a, $04
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_36B0
    jp   label_354B

label_36C4::
    push af
    ld   hl, $D900
    ld   a, [$FFF6]
    ld   e, a
    ld   d, $00
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_36D8
    ld   hl, $DDE0
    jr   label_36E1

label_36D8::
    cp   $1A
    jr   nc, label_36E1
    cp   $06
    jr   c, label_36E1
    inc  d

label_36E1::
    add  hl, de
    pop  af
    or   [hl]
    ld   [hl], a
    ld   [$FFF8], a
    ret

data_36E8::
    db $8C, 8

label_36EA::
    ld   a, 8
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_36E8
    jp   label_354B

data_36FC::
    db 9, $A

label_36FE::
    ld   a, $02
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E4
    ld   de, data_36FC
    jp   label_354B

data_3710::
    db $B, $C

label_3712::
    ld   a, $01
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E4
    ld   de, data_3710
    jp   label_354B

data_3724::
    db $A4, $A5

label_3726::
    ld   e, $08
    call label_373F
    ld   a, [$FFF8]
    and  $04
    jp   nz, label_36B2
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_3724
    jp   label_354B

label_373F::
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
    swap a
    and  $F0
    ld   hl, $C1D0
    add  hl, de
    ld   [hl], a
    inc  bc
    ret

data_375C::
    db   $AF, $B0, $C5, $CD, $EE, $35, 1, $E4, $37, $11, $5C, $37, $C3, $4B, $35

data_376B::
    db   $B1, $B2, $C5, $CD, $EE, $35, 1, $E1, $37, $11, $6B, $37, $C3, $4B, $35

data_377A::
    db   $45, $46, $C5, $CD, $EE, $35, 1, $E1, $37, $11, $7A, $37, $C3, $4B, $35

data_3789::
    db   0, 1, 2, 3, $10, $11, $12, $13, $20, $21, $22, $23, $FF

data_3796::
    db   $B3, $B4, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $3E, 8, $CD, $C4
    db   $36, $C5, $CD, $EE, $35, 1, $89, $37, $11, $96, $37, $C3, $4B, $35

data_37B4::
    db   $C1, $C2, $F0, $F7, $FE, $1A, $30, $13, $FE, 6, $38, $F, $F0, $F6, $FE, $D3
    db   $20, 9, $FA, $46, $DB, $A7, $28, 3, $C3, $77, $36

data_37CF::
    db   $3E, 1, $CD, $C4, $36, $C5, $CD, $EE, $35, 1, $E1, $37, $11, $B4, $37, $C3
    db   $4B, $35

data_37E1::
    db   0, 1, $FF

data_37E4::
    db   0, $10, $FF

; Fill the tile map with whatever is in register a
FillTileMapWith::
    ld   [$FFE9], a
    ld   d, $80
    ld   hl, WR1_TileMap
    ld   e, a

.fill_loop
    ld   a, l
    and  $0F
    jr   z, .dont_fill
    cp   $0B
    jr   nc, .dont_fill
    ld   [hl], e

.dont_fill
    inc  hl
    dec  d
    jr   nz, .fill_loop
    ret

label_37FE::
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_5F02
    ld   a, $16
    ld   [SelectRomBank_2100], a
    xor  a
    ld   [$FFE4], a
    ld   a, [$FFF6]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    ld   hl, $4000
    ld   a, [$DBA5]
    and  a
    jr   z, label_3868
    ld   a, [$FFF7]
    cp   $06
    jr   nz, label_3850
    ld   a, [$DB6F]
    ld   hl, $FFF6
    cp   [hl]
    jr   nz, label_3850
    ld   a, $A8
    call label_3B86
    ld   a, [$DB70]
    ld   hl, $C200
    add  hl, de
    ld   [hl], a
    ld   a, [$DB71]
    ld   hl, $C210
    add  hl, de
    ld   [hl], a
    call label_38D4
    ld   hl, $C460
    add  hl, de
    ld   [hl], $FF
    xor  a
    ld   [$FFE4], a

label_3850::
    ld   hl, $4200
    ld   a, [$FFF7]
    cp   $FF
    jr   nz, label_385E
    ld   hl, $4600
    jr   label_3868

label_385E::
    cp   $1A
    jr   nc, label_3868
    cp   $06
    jr   c, label_3868
    inc  h
    inc  h

label_3868::
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a

label_386D::
    ld   a, [bc]
    cp   $FF
    jr   z, label_3877
    call label_3883
    jr   label_386D

label_3877::
    call label_81D
    ret

data_387B::
    db 1, 2, 4, 8, $10, $20, $40, $80

label_3883::
    ld   a, [$FFE4]
    cp   $08
    jr   nc, label_389B
    ld   e, a
    ld   d, $00
    ld   hl, data_387B
    add  hl, de
    ld   a, [$FFF6]
    ld   e, a
    ld   a, [hl]
    ld   hl, $CF00
    add  hl, de
    and  [hl]
    jr   nz, label_38AD

label_389B::
    ld   e, $00
    ld   d, e

label_389E::
    ld   hl, $C280
    add  hl, de
    ld   a, [hl]
    cp   $00
    jr   z, label_38B4
    inc  e
    ld   a, e
    cp   $10
    jr   nz, label_389E

label_38AD::
    ld   hl, $FFE4
    inc  [hl]
    inc  bc
    inc  bc
    ret

label_38B4::
    ld   [hl], $04
    ld   a, [bc]
    and  $F0
    ld   hl, $C210
    add  hl, de
    add  a, $10
    ld   [hl], a
    ld   a, [bc]
    inc  bc
    swap a
    and  $F0
    ld   hl, $C200
    add  hl, de
    add  a, $08
    ld   [hl], a
    ld   hl, $C3A0
    add  hl, de
    ld   a, [bc]
    inc  bc
    ld   [hl], a

label_38D4::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_6524
    ld   a, $01
    ld   [SelectRomBank_2100], a
    call label_5EAB
    ld   a, $16
    ld   [SelectRomBank_2100], a
    ret

label_38EA::
    ld   e, a
    ld   a, $14
    ld   [SelectRomBank_2100], a
    ld   a, e
    push bc
    call label_4880
    pop  bc
    ld   a, [$FFE8]
    ld   [SelectRomBank_2100], a
    ret

    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_588B
    ret

label_3905::
    ld   a, [$DBA5]
    and  a
    jr   nz, label_390F
    ld   a, $1A
    jr   label_3911

label_390F::
    ld   a, $08

label_3911::
    ld   [SelectRomBank_2100], a
    ret

label_3915::
    ld   a, $27
    ld   [SelectRomBank_2100], a
    jp   $7FC5

label_391D::
    ld   a, $20
    ld   [SelectRomBank_2100], a
    jp   $7DE6

label_3925::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    ld   hl, $5218
    add  hl, de
    ld   a, [hl]
    ld   hl, SelectRomBank_2100
    ld   [hl], $05
    ret

label_3935::
    ld   a, $19
    call label_80C
    call label_7C50
    ld   a, $03
    jp   label_80C

label_3942::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_53E4
    jp   label_81D

label_394D::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_54AC
    jp   label_81D

label_3958::
    ld   a, $01
    call label_80C
    call label_5FB3
    ld   a, $02
    jp   label_80C

label_3965::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_485B
    jp   label_81D

label_3970::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_7EFE
    jp   label_81D

label_397B::
    ld   a, $14
    ld   [SelectRomBank_2100], a
    call label_5347
    ld   a, $03
    ld   [SelectRomBank_2100], a
    ret

data_3989::
    db   0, 8, $10, $18

label_398D::
    ld   hl, $C5A7
    ld   a, [hl]
    and  a
    jr   z, label_399B
    dec  [hl]
    jr   nz, label_399B
    ld   a, $10
    ld   [$FFF3], a

label_399B::
    ld   a, [$C19F]
    and  a
    jr   nz, label_39AE
    ld   a, [$C111]
    ld   [$C1A8], a
    and  a
    jr   z, label_39AE
    dec  a
    ld   [$C111], a

label_39AE::
    ld   a, [$C11C]
    cp   $07
    ret  z
    xor  a
    ld   [$C3C1], a
    ld   a, [$FFF7]
    cp   $0A
    ld   a, [$FFE7]
    jr   c, label_39C1
    xor  a

label_39C1::
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, data_3989
    add  hl, de
    ld   a, [hl]
    ld   [$C3C0], a
    ld   a, $20
    ld   [SelectRomBank_2100], a
    call label_4303
    xor  a
    ld   [SelectRomBank_2100], a
    ld   a, [$C19F]
    and  a
    jr   nz, label_39E3
    ld   [$C1AD], a

label_39E3::
    ld   a, $20
    ld   [$DBAF], a
    ld   [SelectRomBank_2100], a
    call label_6352
    ld   b, $00
    ld   c, $0F

label_39F2::
    ld   a, c
    ld   [$C123], a
    ld   hl, $C280
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_3A03
    ld   [$FFEA], a
    call label_3A18

label_3A03::
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, label_39F2
    ret

label_3A0A::
    ld   a, $15
    ld   [SelectRomBank_2100], a
    call label_4000
    ld   a, $03
    ld   [SelectRomBank_2100], a
    ret

label_3A18::
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
    ld   [SelectRomBank_2100], a
    ld   a, [$FFEB]
    cp   $6A
    jr   nz, label_3A40
    ld   a, [$FFB2]
    and  a
    jr   nz, label_3A46

label_3A40::
    ld   a, [$FFEA]
    cp   $07
    jr   nz, label_3A4E

label_3A46::
    call label_7964
    call label_3D8A
    jr   label_3A54

label_3A4E::
    call label_3D8A
    call label_7964

label_3A54::
    ld   a, $14
    ld   [$DBAF], a
    ld   [SelectRomBank_2100], a
    call label_4D73
    ld   a, $03
    ld   [$DBAF], a
    ld   [SelectRomBank_2100], a
    ld   a, [$FFEA]
    cp   $05
    jp   z, label_3A8D
    rst  0

data_3A6F:: 
    db 9, $3A, $18, $55, $B6, $4C, $4C, $4C, $B5, $48, $8D, $3A, 7, $4E, $32, $57
    db $94, $4D

label_3A81::
    call label_3A8D
    ld   a, $03
    ld   [$DBAF], a
    ld   [SelectRomBank_2100], a
    ret

label_3A8D::
    ld   a, $20
    ld   [SelectRomBank_2100], a
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
    ld   [SelectRomBank_2100], a
    jp   [hl]

data_3AAA::
    db   8, 5, 8, 5, 8, $A, 8, $A, 8, $A, 8, $A, 8, $10, 4, $A
    db   8, 2, 8, 2, 8, $13, 8, $13, 8, 6, 6, 8, 8, 7

data_3AC8::
    db   6, $A, 8, 6, $10, $30, 8, 7, 4, $A, $C, 7, $FC, 4, $10

data_3AD7::
    db $10, $C, $12, 8, 8, 2, 8, $10, $C, 8, $10, 8, 7, $C, 8, 8
    db 8, 2, 8

label_3AEA::
    ld      hl, $C350
    add     hl, bc
    ld      a, [hl]
    and     $7C ; '|'
    ld      e, a
    ld      d, b
    ld      hl, data_3AAA
    add     hl, de
    ld      e, l
    ld      d, h
    push    bc
    sla     c
    sla     c
    ld      hl, $D580
    add     hl, bc
    ld      c, 4

label_3B04::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, label_3B04
    pop  bc
    ret

label_3B0C::
    ld   hl, $C3B0
    add  hl, bc
    ld   [hl], a
    ret

label_3B12::
    ld   hl, $C290
    add  hl, bc
    inc  [hl]
    ret

label_3B18::
    ld   a, $02
    ld   [SelectRomBank_2100], a
    call label_75F5
    jp   label_81D

label_3B23::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_7893
    jp   label_81D

label_3B2E::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_7CAB
    jp   label_81D

label_3B39::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_6E28
    jp   label_81D

label_3B44::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_6C6B
    jp   label_81D

label_3B4F::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_6BDE
    jp   label_81D

label_3B5A::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_6C77
    jp   label_81D

label_3B65::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_73EB
    jp   label_81D

label_3B70::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_6E2B
    jp   label_81D

label_3B7B::
    ld   a, $03
    ld   [SelectRomBank_2100], a
    call label_75A2
    jp   label_81D

label_3B86::
    push af
    ld   a, $03
    ld   [SelectRomBank_2100], a
    pop  af
    call label_64CA
    rr   l
    call label_81D
    rl   l
    ret

label_3B98::
    push af
    ld   a, $03
    ld   [SelectRomBank_2100], a
    pop  af
    call label_64CC
    rr   l
    call label_81D
    rl   l
    ret

label_3BAA::
    ld   hl, SelectRomBank_2100
    ld   [hl], $03
    call label_7EC7
    jp   label_81D

label_3BB5::
    ld   hl, SelectRomBank_2100
    ld   [hl], $03
    call label_7E45
    jp   label_81D

label_3BC0::
    ld   a, [$FFF1]
    inc  a
    ret  z
    call label_3D57
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
    sla  c
    rl   b
    sla  c
    rl   b
    pop  hl
    add  hl, bc
    ld   a, [$FFF5]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, label_3C08
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de

label_3C08::
    inc  de
    ld   a, [hli]
    push hl
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_3C21
    ld   a, [$FFED]
    and  $10
    jr   z, label_3C21
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

label_3C21::
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
    jr   nz, label_3C4B
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de

label_3C4B::
    inc  de
    ld   a, [hl]
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a
    ld   a, [$FFFE]
    and  a
    jr   z, label_3C63
    ld   a, [$FFED]
    and  $10
    jr   z, label_3C63
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

label_3C63::
    ld   a, [$C123]
    ld   c, a
    ld   b, $00
    ld   a, $15
    ld   [SelectRomBank_2100], a
    call label_795D

label_3C71::
    call label_7995
    jp   label_81D

label_3C77::
    ld   a, [$FFF1]
    inc  a
    ret  z
    call label_3D57
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
    jr   z, label_3C9C
    sub  a, $04
    ld   [$FFEC], a

label_3C9C::
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
    sla  c
    rl   b
    pop  hl
    add  hl, bc
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [$FFFE]
    and  a
    jr   z, label_3CD0
    ld   a, [$DB95]
    cp   $01
    jr   z, label_3CD0
    ld   a, [$FFED]
    and  a
    jr   z, label_3CD0
    ld   a, [hl]
    and  $F8
    or   $04
    ld   [de], a
    jr   label_3CD6

label_3CD0::
    ld   a, [hli]
    ld   hl, $FFED
    xor  [hl]
    ld   [de], a

label_3CD6::
    inc  de
    jr   label_3C63

label_3CD9::
    ld   a, $15
    ld   [SelectRomBank_2100], a
    jr   label_3C71

label_3CE0::
    push hl
    ld   hl, $C000
    jr   label_3CF6

label_3CE6::
    ld   a, [$FFF1]
    inc  a
    jr   z, label_3D52
    push hl
    ld   a, [$C3C0]
    ld   e, a
    ld   d, $00
    ld   hl, $C030
    add  hl, de

label_3CF6::
    ld   e, l
    ld   d, h
    pop  hl
    ld   a, c
    ld   [$FFD7], a
    ld   a, [$C123]
    ld   c, a
    call label_3D57
    ld   a, [$FFD7]
    ld   c, a

label_3D06::
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
    jr   nz, label_3D28
    dec  de
    xor  a
    ld   [de], a
    inc  de

label_3D28::
    pop  bc
    inc  de
    ld   a, [$FFED]
    xor  [hl]
    ld   [de], a
    inc  hl
    ld   a, [$FFFE]
    and  a
    jr   z, label_3D3F
    ld   a, [$FFED]
    and  a
    jr   z, label_3D3F
    ld   a, [de]
    and  $F8
    or   $04
    ld   [de], a

label_3D3F::
    inc  de
    dec  c
    jr   nz, label_3D06
    ld   a, [$C123]
    ld   c, a
    ld   a, $15
    ld   [SelectRomBank_2100], a
    call label_795D
    jp   label_81D

label_3D52::
    ld   a, [$C123]
    ld   c, a
    ret

label_3D57::
    push hl
    ld   a, [$C124]
    and  a
    jr   z, label_3D7D
    ld   a, [$FFEE]
    dec  a
    cp   $C0
    jr   nc, label_3D7C
    ld   a, [$FFEC]
    dec  a
    cp   $88
    jr   nc, label_3D7C
    ld   hl, $C220
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, label_3D7C
    ld   hl, $C230
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, label_3D7D

label_3D7C::
    pop  af

label_3D7D::
    pop  hl
    ret

label_3D7F::
    ld   hl, $C240
    add  hl, bc
    ld   [hl], b
    ld   hl, $C250
    add  hl, bc
    ld   [hl], b
    ret

label_3D8A::
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

label_3DA0::
    ld   hl, SelectRomBank_2100
    ld   [hl], $15
    call label_7964
    jp   label_81D

label_3DAB::
    ld   hl, SelectRomBank_2100
    ld   [hl], $04
    call label_5A1A
    jp   label_81D

label_3DB6::
    ld   hl, SelectRomBank_2100
    ld   [hl], $04
    call label_5690
    jp   label_81D

label_3DC1::
    ld   hl, SelectRomBank_2100
    ld   [hl], $04
    call label_504B
    jp   label_81D

label_3DCC::
    ld   hl, SelectRomBank_2100
    ld   [hl], $04
    call label_49BD
    jp   label_81D

label_3DD7::
    ld   hl, SelectRomBank_2100
    ld   [hl], $36
    call label_72AB
    jp   label_81D

label_3DE2::
    ld   hl, SelectRomBank_2100
    ld   [hl], $05
    call label_6CC6
    jp   label_81D

label_3DED::
    ld   hl, SelectRomBank_2100
    ld   [hl], $05
    call label_6818
    jp   label_81D

label_3DF8::
    ld   hl, SelectRomBank_2100
    ld   [hl], $05
    call label_6302
    jp   label_81D

label_3E03::
    ld   hl, SelectRomBank_2100
    ld   [hl], $05
    call label_5A1E
    jp   label_81D

label_3E0E::
    ld   hl, SelectRomBank_2100
    ld   [hl], $05
    call label_556B
    jp   label_81D

label_3E19::
    ld   a, [$DBAF]
    push af
    ld   a, $02
    call label_80C
    call label_6C75
    pop  af
    jp   label_80C

label_3E29::
    ld   hl, SelectRomBank_2100
    ld   [hl], $04
    call label_5C63
    jp   label_81D

label_3E34::
    ld   hl, SelectRomBank_2100
    ld   [hl], $03
    call label_5407
    jp   label_81D

label_3E3F::
    ld   hl, SelectRomBank_2100
    ld   [hl], $02
    call label_62CE
    call label_6414
    jp   label_81D

label_3E4D::
    ld   a, $02
    call label_80C
    call label_41D0
    ld   a, $03
    jp   label_80C

label_3E5A::
    ld   hl, SelectRomBank_2100
    ld   [hl], $20
    ld   c, $01
    ld   b, $00
    ld   e, $FF
    call label_5C9C
    jp   label_81D

label_3E6B::
    ld   hl, SelectRomBank_2100
    ld   [hl], $03
    call label_6472
    jp   label_81D

label_3E76::
    ld   a, $06
    call label_80C
    call label_783C
    ld   a, $03
    jp   label_80C

label_3E83::
    ld   e, $10
    ld   hl, $C280

label_3E88::
    xor  a
    ldi  [hl], a
    dec  e
    jr   nz, label_3E88
    ret

label_3E8E::
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
    call label_CC7
    ld   hl, $C520
    add  hl, de
    ld   [hl], $0F
    ret

label_3EAF::
    ld   hl, $C3F0
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, label_3EBA
    cpl
    inc  a

label_3EBA::
    ld   [$FFD7], a
    ld   hl, $C400
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, label_3EC7
    cpl
    inc  a

label_3EC7::
    ld   e, $03
    ld   hl, $FFD7
    cp   [hl]
    jr   c, label_3ED1
    ld   e, $0C

label_3ED1::
    ld   a, e
    ld   hl, $C2A0
    add  hl, bc
    and  [hl]
    jr   z, label_3EDE
    ld   hl, $C410
    add  hl, bc
    ld   [hl], b

label_3EDE::
    ret

data_3EDF::
    db $B0, $B4, $B1, $B2, $B3, $B6, $BA, $BC, $B8

label_3EE8::
    ld   hl, $C14F
    ld   a, [$C124]
    or   [hl]
    ret  nz
    ld   a, [$C165]
    and  a
    jr   z, label_3EFB
    dec  a
    ld   [$C165], a
    ret

label_3EFB::
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
    jr   z, label_3F11
    ld   a, $50

label_3F11::
    ld   [$D368], a
    ld   [$FFBD], a
    ld   a, [$C16B]
    cp   $04
    ret  nz
    ld   a, [$FFEB]
    cp   $87
    jr   nz, label_3F26
    ld   a, $DA
    jr   label_3F45

label_3F26::
    cp   $BC
    jr   nz, label_3F2E
    ld   a, $26
    jr   label_3F45

label_3F2E::
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
    ld   hl, data_3EDF
    add  hl, de
    ld   a, [hl]

label_3F45::
    jp   label_2385

data_3F48::
    db 1, 2, 4, 8, $10, $20, $40, $80

label_3F50::
    ld   a, $03
    ld   [$C113], a
    ld   [SelectRomBank_2100], a
    call label_55CF
    call label_81D
    ld   hl, $C460
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, label_3F8D
    push af
    ld   a, [WR1_KillCount2]
    ld   e, a
    ld   d, b
    inc  a
    ld   [WR1_KillCount2], a
    ld   a, [hl]
    ld   hl, $DBB6
    add  hl, de
    ld   [hl], a
    pop  af

label_3F78::
    cp   $08
    jr   nc, label_3F8D
    ld   e, a
    ld   d, b
    ld   hl, data_3F48
    add  hl, de
    ld   a, [$FFF6]
    ld   e, a
    ld   d, b
    ld   a, [hl]
    ld   hl, $CF00
    add  hl, de
    or   [hl]
    ld   [hl], a

label_3F8D::
    ld   hl, $C280
    add  hl, bc
    ld   [hl], b
    ret

label_3F93::
    ld   a, $05
    ld   [SelectRomBank_2100], a
    ld   hl, $59DE
    ld   de, $8460
    ld   bc, $0010
    call CopyData
    ld   hl, $59EE
    jr   label_3FBD

label_3FA9::
    ld   a, $05
    ld   [SelectRomBank_2100], a
    ld   hl, $59FE
    ld   de, $8460
    ld   bc, $0010
    call CopyData
    ld   hl, $5A0E

label_3FBD::
    ld   de, $8480
    ld   bc, $0010
    call CopyData
    xor  a
    ld   [$FFA5], a
    ld   a, $0C
    ld   [SelectRomBank_2100], a
    jp   label_1D2E
    ld   b, $34
    ld   a, [$FFFE]
    and  a
    jr   z, label_3FD9
    inc  b

label_3FD9::
    ld   a, b
    ld   [SelectRomBank_2100], a
    ld   hl, $4000
    ld   de, $8400
    ld   bc, $0400
    call CopyData
    ld   a, $20
    ld   [SelectRomBank_2100], a
    ret

section "bank1",romx,bank[$01]
;incbin "bank-bins/bank_01_4000.bin"
include "bank1.asm"

section "bank2",romx,bank[$02]
incbin "bank-bins/bank_02_8000.bin"

section "bank3",romx,bank[$03]
;incbin "bank-bins/bank_03_C000.bin"
include "bank3.asm"

section "bank4",romx,bank[$04]
incbin "bank-bins/bank_04_10000.bin"

section "bank5",romx,bank[$05]
incbin "bank-bins/bank_05_14000.bin"

section "bank6",romx,bank[$06]
incbin "bank-bins/bank_06_18000.bin"

section "bank7",romx,bank[$07]
incbin "bank-bins/bank_07_1C000.bin"

section "bank8",romx,bank[$08]
incbin "bank-bins/bank_08_20000.bin"

section "bank9",romx,bank[$09]
incbin "bank-bins/bank_09_24000.bin"

section "bank10",romx,bank[$0A]
incbin "bank-bins/bank_0A_28000.bin"

section "bank11",romx,bank[$0B]
incbin "bank-bins/bank_0B_2C000.bin"

section "bank12",romx,bank[$0C]
;incbin "bank-bins/bank_0C_30000.bin"

data_bank_c_0000:: incbin "data/Bank_0xC_0x0000"
data_bank_c_0400:: incbin "data/Bank_0xC_0x0400"
data_bank_c_07A0:: incbin "data/Bank_0xC_0x07A0"
data_bank_c_07C0:: incbin "data/Bank_0xC_0x07C0"
data_bank_c_0800:: incbin "data/Bank_0xC_0x0800"
data_bank_c_1800::

section "bank13",romx,bank[$0D]
incbin "bank-bins/bank_0D_34000.bin"

section "bank14",romx,bank[$0E]
incbin "bank-bins/bank_0E_38000.bin"

section "bank15",romx,bank[$0F]
incbin "bank-bins/bank_0F_3C000.bin"

section "bank16",romx,bank[$10]
incbin "bank-bins/bank_10_40000.bin"

section "bank17",romx,bank[$11]
incbin "bank-bins/bank_11_44000.bin"

section "bank18",romx,bank[$12]
incbin "bank-bins/bank_12_48000.bin"

section "bank19",romx,bank[$13]
incbin "bank-bins/bank_13_4C000.bin"

section "bank20",romx,bank[$14]
incbin "bank-bins/bank_14_50000.bin"

section "bank21",romx,bank[$15]
incbin "bank-bins/bank_15_54000.bin"

section "bank22",romx,bank[$16]
incbin "bank-bins/bank_16_58000.bin"

section "bank23",romx,bank[$17]
incbin "bank-bins/bank_17_5C000.bin"

section "bank24",romx,bank[$18]
incbin "bank-bins/bank_18_60000.bin"

section "bank25",romx,bank[$19]
incbin "bank-bins/bank_19_64000.bin"

section "bank26",romx,bank[$1A]
incbin "bank-bins/bank_1A_68000.bin"

section "bank27",romx,bank[$1B]
incbin "bank-bins/bank_1B_6C000.bin"

section "bank28",romx,bank[$1C]
incbin "bank-bins/bank_1C_70000.bin"

section "bank29",romx,bank[$1D]
incbin "bank-bins/bank_1D_74000.bin"

section "bank30",romx,bank[$1E]
incbin "bank-bins/bank_1E_78000.bin"

section "bank31",romx,bank[$1F]
incbin "bank-bins/bank_1F_7C000.bin"

section "bank32",romx,bank[$20]
incbin "bank-bins/bank_20_80000.bin"

section "bank33",romx,bank[$21]
incbin "bank-bins/bank_22_88000.bin"

section "bank34",romx,bank[$22]
incbin "bank-bins/bank_23_8C000.bin"

section "bank35",romx,bank[$23]
incbin "bank-bins/bank_23_8C000.bin"

section "bank36",romx,bank[$24]
incbin "bank-bins/bank_24_90000.bin"

section "bank37",romx,bank[$25]
incbin "bank-bins/bank_25_94000.bin"

section "bank38",romx,bank[$26]
incbin "bank-bins/bank_26_98000.bin"

section "bank39",romx,bank[$27]
incbin "bank-bins/bank_27_9C000.bin"

section "bank40",romx,bank[$28]
incbin "bank-bins/bank_28_A0000.bin"

section "bank41",romx,bank[$29]
incbin "bank-bins/bank_29_A4000.bin"

section "bank42",romx,bank[$2A]
incbin "bank-bins/bank_2A_A8000.bin"

section "bank43",romx,bank[$2B]
incbin "bank-bins/bank_2B_AC000.bin"

section "bank44",romx,bank[$2C]
incbin "bank-bins/bank_2C_B0000.bin"

section "bank45",romx,bank[$2D]
incbin "bank-bins/bank_2D_B4000.bin"

section "bank46",romx,bank[$2E]
incbin "bank-bins/bank_2E_B8000.bin"

section "bank47",romx,bank[$2F]
incbin "bank-bins/bank_2F_BC000.bin"

section "bank48",romx,bank[$30]
incbin "bank-bins/bank_30_C0000.bin"

section "bank49",romx,bank[$31]
incbin "bank-bins/bank_31_C4000.bin"

section "bank50",romx,bank[$32]
incbin "bank-bins/bank_32_C8000.bin"

section "bank51",romx,bank[$33]
incbin "bank-bins/bank_33_CC000.bin"

section "bank52",romx,bank[$34]
incbin "bank-bins/bank_34_D0000.bin"

section "bank53",romx,bank[$35]
incbin "bank-bins/bank_35_D4000.bin"

section "bank54",romx,bank[$36]
incbin "bank-bins/bank_36_D8000.bin"

section "bank55",romx,bank[$37]
incbin "bank-bins/bank_37_DC000.bin"

section "bank56",romx,bank[$38]
incbin "bank-bins/bank_38_E0000.bin"

section "bank57",romx,bank[$39]
incbin "bank-bins/bank_39_E4000.bin"

section "bank58",romx,bank[$3A]
incbin "bank-bins/bank_3A_E8000.bin"

section "bank59",romx,bank[$3B]
incbin "bank-bins/bank_3B_EC000.bin"

section "bank60",romx,bank[$3C]
incbin "bank-bins/bank_3C_F0000.bin"

