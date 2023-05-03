; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BowWowAtHomeSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0
.variant3
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_3 | OAMF_PAL0
.variant4
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $7A, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BowWowFollowingSpriteVariants::
.variant0
    db $40, OAM_GBC_PAL_3 | OAMF_PAL0
    db $40, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $42, OAM_GBC_PAL_3 | OAMF_PAL0
    db $42, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $44, OAM_GBC_PAL_3 | OAMF_PAL0
    db $46, OAM_GBC_PAL_3 | OAMF_PAL0
.variant3
    db $48, OAM_GBC_PAL_3 | OAMF_PAL0
    db $4A, OAM_GBC_PAL_3 | OAMF_PAL0
.variant4
    db $46, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $44, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $4A, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $48, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $4C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $4C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

BowWowEntityHandler::
    ld   a, c                                     ; $4038: $79
    ld   [wD154], a                               ; $4039: $EA $54 $D1
    ld   a, [wIsBowWowFollowingLink]              ; $403C: $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ; $403F: $FE $01
    jr   nz, .selectSpriteVariant                 ; $4041: $20 $11

    ; calculate x- and y-Offset of bow_wow
    ldh  a, [hMapRoom]                            ; $4043: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $4045: $21 $E0 $C3
    add  hl, bc                                   ; $4048: $09
    ld   [hl], a                                  ; $4049: $77
    ld   hl, wEntitiesPosXSignTable               ; $404A: $21 $20 $C2
    add  hl, bc                                   ; $404D: $09
    ld   [hl], b                                  ; $404E: $70
    ld   hl, wEntitiesPosYSignTable               ; $404F: $21 $30 $C2
    add  hl, bc                                   ; $4052: $09
    ld   [hl], b                                  ; $4053: $70

.selectSpriteVariant
    ld   de, BowWowFollowingSpriteVariants        ; $4054: $11 $1C $40
    ld   a, [wIsBowWowFollowingLink]              ; $4057: $FA $56 $DB
    and  a                                        ; $405A: $A7
    jr   nz, .render                              ; $405B: $20 $03

    ld   de, BowWowAtHomeSpriteVariants           ; $405D: $11 $00 $40

.render:
    call RenderActiveEntitySpritesPair            ; $4060: $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ; $4063: $FA $24 $C1
    and  a                                        ; $4066: $A7
    jr   z, .jr_407C                              ; $4067: $28 $13

    ld   a, [wIsBowWowFollowingLink]              ; $4069: $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ; $406C: $FE $01
    jp   z, label_005_40A2                        ; $406E: $CA $A2 $40

    ld   hl, wEntitiesRoomTable                   ; $4071: $21 $E0 $C3
    add  hl, bc                                   ; $4074: $09
    ldh  a, [hMapRoom]                            ; $4075: $F0 $F6
    cp   [hl]                                     ; $4077: $BE
    ret  z                                        ; $4078: $C8

    jp   label_005_40A2                           ; $4079: $C3 $A2 $40

.jr_407C
    ld   a, [wC1A8]                               ; $407C: $FA $A8 $C1
    ld   hl, wDialogState                         ; $407F: $21 $9F $C1
    or   [hl]                                     ; $4082: $B6
    ld   hl, wInventoryAppearing                  ; $4083: $21 $4F $C1
    or   [hl]                                     ; $4086: $B6
    jp   nz, label_005_40A2                       ; $4087: $C2 $A2 $40

    ld   a, [wTransitionSequenceCounter]          ; $408A: $FA $6B $C1
    cp   $04                                      ; $408D: $FE $04
    ret  nz                                       ; $408F: $C0

    call func_005_44CB                            ; $4090: $CD $CB $44
    call DecrementEntityIgnoreHitsCountdown       ; $4093: $CD $56 $0C
    ld   a, [wIsBowWowFollowingLink]              ; $4096: $FA $56 $DB
    and  a                                        ; $4099: $A7
    jr   nz, .jr_409F                             ; $409A: $20 $03

    call label_3B70                               ; $409C: $CD $70 $3B

.jr_409F
    call func_005_40A5                            ; $409F: $CD $A5 $40

label_005_40A2:
    jp   label_005_4253                           ; $40A2: $C3 $53 $42

func_005_40A5::
    ld   hl, wEntitiesPrivateState4Table          ; $40A5: $21 $40 $C4
    add  hl, bc                                   ; $40A8: $09
    ld   a, [hl]                                  ; $40A9: $7E
    JP_TABLE                                      ; $40AA
._00 dw func_005_40AF                             ; $40AB
._01 dw func_005_40E6                             ; $40AD

func_005_40AF::
    ld   hl, wEntitiesPosXTable                   ; $40AF: $21 $00 $C2
    add  hl, bc                                   ; $40B2: $09
    ld   a, [hl]                                  ; $40B3: $7E
    add  $04                                      ; $40B4: $C6 $04
    ld   [hl], a                                  ; $40B6: $77
    ld   hl, wEntitiesPrivateState1Table          ; $40B7: $21 $B0 $C2
    add  hl, bc                                   ; $40BA: $09
    ld   [hl], a                                  ; $40BB: $77
    ld   e, $10                                   ; $40BC: $1E $10
    ld   hl, wD100                                ; $40BE: $21 $00 $D1

.loop_40C1
    ld   [hl+], a                                 ; $40C1: $22
    dec  e                                        ; $40C2: $1D
    jr   nz, .loop_40C1                           ; $40C3: $20 $FC

    ld   hl, wEntitiesPosYTable                   ; $40C5: $21 $10 $C2
    add  hl, bc                                   ; $40C8: $09
    ld   a, [hl]                                  ; $40C9: $7E
    add  $08                                      ; $40CA: $C6 $08
    ld   [hl], a                                  ; $40CC: $77
    ld   hl, wEntitiesPrivateState2Table          ; $40CD: $21 $C0 $C2
    add  hl, bc                                   ; $40D0: $09
    ld   [hl], a                                  ; $40D1: $77
    ld   hl, wEntitiesPosZTable                   ; $40D2: $21 $10 $C3
    add  hl, bc                                   ; $40D5: $09
    sub  [hl]                                     ; $40D6: $96
    ld   e, $10                                   ; $40D7: $1E $10
    ld   hl, wD110                                ; $40D9: $21 $10 $D1

.loop_40DC
    ld   [hl+], a                                 ; $40DC: $22
    dec  e                                        ; $40DD: $1D
    jr   nz, .loop_40DC                           ; $40DE: $20 $FC

    ld   hl, wEntitiesPrivateState4Table          ; $40E0: $21 $40 $C4
    add  hl, bc                                   ; $40E3: $09
    inc  [hl]                                     ; $40E4: $34
    ret                                           ; $40E5: $C9

func_005_40E6::
    ; if bow_wow is at home jump to jr_005_4137
    ld   a, [wIsBowWowFollowingLink]              ; $40E6: $FA $56 $DB
    and  a                                        ; $40E9: $A7
    jr   z, jr_005_4137                           ; $40EA: $28 $4B

    cp   BOW_WOW_KIDNAPPED                        ; $40EC: $FE $80
    jr   z, .jr_40FA                              ; $40EE: $28 $0A

    ; bow_wow is following link
    ldh  a, [hLinkPositionX]                      ; $40F0: $F0 $98
    ldh  [hMultiPurpose0], a                      ; $40F2: $E0 $D7
    ldh  a, [hLinkPositionZModified]              ; $40F4: $F0 $B3
    ldh  [hMultiPurpose1], a                      ; $40F6: $E0 $D8
    jr   jr_005_4129                              ; $40F8: $18 $2F

.jr_40FA
    ldh  a, [hLinkPositionY]                      ; $40FA: $F0 $99
    sub  $40                                      ; $40FC: $D6 $40
    add  $10                                      ; $40FE: $C6 $10
    cp   $20                                      ; $4100: $FE $20
    jr   nc, .jr_4127                             ; $4102: $30 $23

    ldh  a, [hLinkPositionX]                      ; $4104: $F0 $98
    sub  $88                                      ; $4106: $D6 $88
    add  $10                                      ; $4108: $C6 $10
    cp   $20                                      ; $410A: $FE $20
    jr   nc, .jr_4127                             ; $410C: $30 $19

    ld   a, [wCollisionType]                      ; $410E: $FA $33 $C1
    and  a                                        ; $4111: $A7
    jr   z, .jr_4127                              ; $4112: $28 $13

    ; Bow-Wow retrieved from King Moblin
    ld   a, MUSIC_OBTAIN_ITEM                     ; $4114: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $4116: $EA $68 $D3
    call_open_dialog Dialog16C                    ; $4119
    ld   a, WAVE_SFX_CHAIN_CHOMP                  ; $411E: $3E $18
    ldh  [hWaveSfx], a                            ; $4120: $E0 $F3
    ld   a, BOW_WOW_FOLLOWING                     ; $4122: $3E $01
    ld   [wIsBowWowFollowingLink], a              ; $4124: $EA $56 $DB

.jr_4127
    jr   jr_005_4137                              ; $4127: $18 $0E

jr_005_4129:
    ldh  a, [hMultiPurpose0]                      ; $4129: $F0 $D7
    ld   hl, wEntitiesPrivateState1Table          ; $412B: $21 $B0 $C2
    add  hl, bc                                   ; $412E: $09
    ld   [hl], a                                  ; $412F: $77
    ldh  a, [hMultiPurpose1]                      ; $4130: $F0 $D8
    ld   hl, wEntitiesPrivateState2Table          ; $4132: $21 $C0 $C2
    add  hl, bc                                   ; $4135: $09
    ld   [hl], a                                  ; $4136: $77

jr_005_4137:
    ld   hl, wEntitiesPrivateState1Table          ; $4137: $21 $B0 $C2
    add  hl, bc                                   ; $413A: $09
    ld   a, [hl]                                  ; $413B: $7E
    ld   [wD150], a                               ; $413C: $EA $50 $D1
    ld   hl, wEntitiesPrivateState2Table          ; $413F: $21 $C0 $C2
    add  hl, bc                                   ; $4142: $09
    ld   a, [hl]                                  ; $4143: $7E
    ld   [wD151], a                               ; $4144: $EA $51 $D1
    call AddEntityZSpeedToPos_05                  ; $4147: $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ; $414A: $21 $20 $C3
    add  hl, bc                                   ; $414D: $09
    dec  [hl]                                     ; $414E: $35
    dec  [hl]                                     ; $414F: $35
    ld   e, l                                     ; $4150: $5D
    ld   d, h                                     ; $4151: $54
    ld   hl, wEntitiesPosZTable                   ; $4152: $21 $10 $C3
    add  hl, bc                                   ; $4155: $09
    ld   a, [hl]                                  ; $4156: $7E
    and  $80                                      ; $4157: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $4159: $E0 $E8
    jr   z, .jr_4160                              ; $415B: $28 $03

    xor  a                                        ; $415D: $AF
    ld   [hl], a                                  ; $415E: $77
    ld   [de], a                                  ; $415F: $12

.jr_4160
    call label_3B23                               ; $4160: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $4163: $F0 $F0
    JP_TABLE                                      ; $4165
._00 dw func_005_4180                             ; $4166
._01 dw func_005_41CF                             ; $4168
._02 dw func_005_41EB                             ; $416A
._03 dw func_005_420E                             ; $416C
._04 dw func_005_41EB                             ; $416E

Data_005_4170::
    db   $04, $08, $0C, $08, $FC, $F8, $F4, $F8

Data_005_4178::
    db   $F4, $F8, $04, $08, $0C, $08, $FC, $F8

func_005_4180::
    call GetEntityTransitionCountdown             ; $4180: $CD $05 $0C
    jr   z, jr_005_41B1                           ; $4183: $28 $2C

    call GetEntityPrivateCountdown1               ; $4185: $CD $00 $0C
    jr   nz, .ret_41B0                            ; $4188: $20 $26

    call GetRandomByte                            ; $418A: $CD $0D $28
    and  $3F                                      ; $418D: $E6 $3F
    add  $20                                      ; $418F: $C6 $20
    ld   [hl], a                                  ; $4191: $77
    call IncrementEntityState                     ; $4192: $CD $12 $3B
    call GetRandomByte                            ; $4195: $CD $0D $28
    and  $07                                      ; $4198: $E6 $07
    ld   e, a                                     ; $419A: $5F
    ld   d, b                                     ; $419B: $50
    ld   hl, Data_005_4170                        ; $419C: $21 $70 $41
    add  hl, de                                   ; $419F: $19
    ld   a, [hl]                                  ; $41A0: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $41A1: $21 $40 $C2
    add  hl, bc                                   ; $41A4: $09
    ld   [hl], a                                  ; $41A5: $77
    ld   hl, Data_005_4178                        ; $41A6: $21 $78 $41
    add  hl, de                                   ; $41A9: $19
    ld   a, [hl]                                  ; $41AA: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $41AB: $21 $50 $C2
    add  hl, bc                                   ; $41AE: $09
    ld   [hl], a                                  ; $41AF: $77

.ret_41B0
    ret                                           ; $41B0: $C9

jr_005_41B1:
    call GetEntityTransitionCountdown             ; $41B1: $CD $05 $0C
    ld   [hl], $28                                ; $41B4: $36 $28
    ld   a, [wIsBowWowFollowingLink]              ; $41B6: $FA $56 $DB
    and  a                                        ; $41B9: $A7
    jr   z, .bow_wow_not_following                ; $41BA: $28 $03

    jp   label_005_4297                           ; $41BC: $C3 $97 $42

.bow_wow_not_following
    ld   hl, wEntitiesSpeedZTable                 ; $41BF: $21 $20 $C3
    add  hl, bc                                   ; $41C2: $09
    ld   [hl], $20                                ; $41C3: $36 $20
    call IncrementEntityState                     ; $41C5: $CD $12 $3B
    ld   [hl], $02                                ; $41C8: $36 $02
    ld   a, $20                                   ; $41CA: $3E $20
    jp   ApplyVectorTowardsLink_trampoline        ; $41CC: $C3 $AA $3B

func_005_41CF::
    call GetEntityPrivateCountdown1               ; $41CF: $CD $00 $0C
    jr   nz, .jr_41DA                             ; $41D2: $20 $06

    ld   [hl], $20                                ; $41D4: $36 $20
    call IncrementEntityState                     ; $41D6: $CD $12 $3B
    ld   [hl], b                                  ; $41D9: $70

.jr_41DA
    ldh  a, [hMultiPurposeG]                      ; $41DA: $F0 $E8
    and  a                                        ; $41DC: $A7
    jr   z, .jr_41E5                              ; $41DD: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $41DF: $21 $20 $C3
    add  hl, bc                                   ; $41E2: $09
    ld   [hl], $10                                ; $41E3: $36 $10

.jr_41E5
    call UpdateEntityPosWithSpeed_05              ; $41E5: $CD $B1 $7A
    jp   func_005_4228                            ; $41E8: $C3 $28 $42

func_005_41EB::
    call GetEntityTransitionCountdown             ; $41EB: $CD $05 $0C
    jr   z, .jr_41F9                              ; $41EE: $28 $09

    call UpdateEntityPosWithSpeed_05              ; $41F0: $CD $B1 $7A
    call func_005_4228                            ; $41F3: $CD $28 $42
    dec  e                                        ; $41F6: $1D
    jr   z, jr_005_4206                           ; $41F7: $28 $0D

.jr_41F9
    call ClearEntitySpeed                         ; $41F9: $CD $7F $3D
    call IncrementEntityState                     ; $41FC: $CD $12 $3B
    ld   [hl], $03                                ; $41FF: $36 $03
    call GetEntityTransitionCountdown             ; $4201: $CD $05 $0C
    ld   [hl], $10                                ; $4204: $36 $10

jr_005_4206:
    ld   a, [wIsBowWowFollowingLink]              ; $4206: $FA $56 $DB
    and  a                                        ; $4209: $A7
    ret  z                                        ; $420A: $C8

    jp   label_005_4335                           ; $420B: $C3 $35 $43

func_005_420E::
    call GetEntityTransitionCountdown             ; $420E: $CD $05 $0C
    jr   nz, ret_005_4227                         ; $4211: $20 $14

    call GetRandomByte                            ; $4213: $CD $0D $28
    and  $3F                                      ; $4216: $E6 $3F
    add  $30                                      ; $4218: $C6 $30
    ld   [hl], a                                  ; $421A: $77
    ld   a, [wIsBowWowFollowingLink]              ; $421B: $FA $56 $DB
    and  a                                        ; $421E: $A7
    jr   z, .bow_wow_not_following                ; $421F: $28 $02

    ld   [hl], $10                                ; $4221: $36 $10

.bow_wow_not_following
    call IncrementEntityState                     ; $4223: $CD $12 $3B
    ld   [hl], b                                  ; $4226: $70

ret_005_4227:
    ret                                           ; $4227: $C9

func_005_4228::
    ld   e, $01                                   ; $4228: $1E $01
    ld   hl, wEntitiesPrivateState1Table          ; $422A: $21 $B0 $C2
    add  hl, bc                                   ; $422D: $09
    ld   a, [hl]                                  ; $422E: $7E
    ld   hl, wEntitiesPosXTable                   ; $422F: $21 $00 $C2
    add  hl, bc                                   ; $4232: $09
    sub  [hl]                                     ; $4233: $96
    add  $20                                      ; $4234: $C6 $20
    cp   $40                                      ; $4236: $FE $40
    jr   c, .jr_423E                              ; $4238: $38 $04

    ldh  a, [hActiveEntityPosX]                   ; $423A: $F0 $EE
    ld   [hl], a                                  ; $423C: $77
    inc  e                                        ; $423D: $1C

.jr_423E
    ld   hl, wEntitiesPrivateState2Table          ; $423E: $21 $C0 $C2
    add  hl, bc                                   ; $4241: $09
    ld   a, [hl]                                  ; $4242: $7E
    ld   hl, wEntitiesPosYTable                   ; $4243: $21 $10 $C2
    add  hl, bc                                   ; $4246: $09
    sub  [hl]                                     ; $4247: $96
    add  $20                                      ; $4248: $C6 $20
    cp   $40                                      ; $424A: $FE $40
    jr   c, .ret_4252                             ; $424C: $38 $04

    ldh  a, [hActiveEntityPosY]                   ; $424E: $F0 $EF
    ld   [hl], a                                  ; $4250: $77
    inc  e                                        ; $4251: $1C

.ret_4252
    ret                                           ; $4252: $C9

label_005_4253:
    call func_005_43A8                            ; $4253: $CD $A8 $43
    call func_005_43FE                            ; $4256: $CD $FE $43
    ld   a, [wOAMNextAvailableSlot]               ; $4259: $FA $C0 $C3
    ld   e, a                                     ; $425C: $5F
    ld   d, $00                                   ; $425D: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $425F: $21 $30 $C0
    add  hl, de                                   ; $4262: $19
    ld   e, l                                     ; $4263: $5D
    ld   d, h                                     ; $4264: $54
    push bc                                       ; $4265: $C5
    ld   c, $05                                   ; $4266: $0E $05

jr_005_4268:
    ldh  a, [hFrameCounter]                       ; $4268: $F0 $E7
    xor  c                                        ; $426A: $A9
    rra                                           ; $426B: $1F
    jr   c, jr_005_428E                           ; $426C: $38 $20

    ld   hl, wD110                                ; $426E: $21 $10 $D1
    add  hl, bc                                   ; $4271: $09
    ld   a, [hl]                                  ; $4272: $7E
    ld   [de], a                                  ; $4273: $12
    inc  de                                       ; $4274: $13
    ld   hl, wD100                                ; $4275: $21 $00 $D1
    add  hl, bc                                   ; $4278: $09
    ld   a, [hl]                                  ; $4279: $7E
    add  $04                                      ; $427A: $C6 $04
    ld   [de], a                                  ; $427C: $12
    inc  de                                       ; $427D: $13
    ld   a, [wIsBowWowFollowingLink]              ; $427E: $FA $56 $DB
    and  a                                        ; $4281: $A7
    ld   a, $4E                                   ; $4282: $3E $4E
    jr   nz, .bow_wow_not_at_home                 ; $4284: $20 $02

    ld   a, $7E                                   ; $4286: $3E $7E

.bow_wow_not_at_home
    ld   [de], a                                  ; $4288: $12
    inc  de                                       ; $4289: $13
    ld   a, $00                                   ; $428A: $3E $00
    ld   [de], a                                  ; $428C: $12
    inc  de                                       ; $428D: $13

jr_005_428E:
    dec  c                                        ; $428E: $0D
    jr   nz, jr_005_4268                          ; $428F: $20 $D7

    pop  bc                                       ; $4291: $C1
    ld   a, $03                                   ; $4292: $3E $03
    jp   func_015_7964_trampoline                 ; $4294: $C3 $A0 $3D

label_005_4297:
    ld   a, [wIsBowWowFollowingLink]              ; $4297: $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ; $429A: $FE $80
    jp   z, label_005_432F                        ; $429C: $CA $2F $43

    call GetRandomByte                            ; $429F: $CD $0D $28
    ld   d, b                                     ; $42A2: $50
    and  $01                                      ; $42A3: $E6 $01
    jr   nz, .jr_42AF                             ; $42A5: $20 $08

    ld   e, $0F                                   ; $42A7: $1E $0F
    ld   a, $FF                                   ; $42A9: $3E $FF
    ldh  [hMultiPurpose0], a                      ; $42AB: $E0 $D7
    jr   jr_005_42B7                              ; $42AD: $18 $08

.jr_42AF
    ld   e, $00                                   ; $42AF: $1E $00
    ld   a, $01                                   ; $42B1: $3E $01
    ldh  [hMultiPurpose0], a                      ; $42B3: $E0 $D7
    ld   a, $10                                   ; $42B5: $3E $10

jr_005_42B7:
    ldh  [hMultiPurpose1], a                      ; $42B7: $E0 $D8

jr_005_42B9:
    ld   a, e                                     ; $42B9: $7B
    cp   c                                        ; $42BA: $B9
    jr   z, .jr_4323                              ; $42BB: $28 $66

    ld   hl, wEntitiesStatusTable                 ; $42BD: $21 $80 $C2
    add  hl, de                                   ; $42C0: $19
    ld   a, [hl]                                  ; $42C1: $7E
    and  a                                        ; $42C2: $A7
    jr   z, .jr_4323                              ; $42C3: $28 $5E

    cp   $01                                      ; $42C5: $FE $01
    jr   z, .jr_4323                              ; $42C7: $28 $5A

    ld   hl, wEntitiesSpriteVariantTable          ; $42C9: $21 $B0 $C3
    add  hl, de                                   ; $42CC: $19
    ld   a, [hl]                                  ; $42CD: $7E
    dec  a                                        ; $42CE: $3D
    jr   z, .jr_4323                              ; $42CF: $28 $52

    push de                                       ; $42D1: $D5
    ld   hl, wEntitiesTypeTable                   ; $42D2: $21 $A0 $C3
    add  hl, de                                   ; $42D5: $19
    ld   e, [hl]                                  ; $42D6: $5E
    call CanBowWowEatEntity                       ; $42D7: $CD $25 $39
    pop  de                                       ; $42DA: $D1
    and  a                                        ; $42DB: $A7
    jr   z, .jr_4323                              ; $42DC: $28 $45

    ld   hl, wEntitiesPosXTable                   ; $42DE: $21 $00 $C2
    add  hl, de                                   ; $42E1: $19
    ldh  a, [hLinkPositionX]                      ; $42E2: $F0 $98
    sub  [hl]                                     ; $42E4: $96
    add  $2F                                      ; $42E5: $C6 $2F
    cp   $5E                                      ; $42E7: $FE $5E
    jr   nc, .jr_4323                             ; $42E9: $30 $38

    ld   hl, wEntitiesPosYTable                   ; $42EB: $21 $10 $C2
    add  hl, de                                   ; $42EE: $19
    ldh  a, [hLinkPositionY]                      ; $42EF: $F0 $99
    sub  [hl]                                     ; $42F1: $96
    add  $2F                                      ; $42F2: $C6 $2F
    cp   $5E                                      ; $42F4: $FE $5E
    jr   nc, .jr_4323                             ; $42F6: $30 $2B

    ld   a, e                                     ; $42F8: $7B
    ld   [wD152], a                               ; $42F9: $EA $52 $D1
    ldh  a, [hLinkPositionY]                      ; $42FC: $F0 $99
    push af                                       ; $42FE: $F5
    ldh  a, [hLinkPositionX]                      ; $42FF: $F0 $98
    push af                                       ; $4301: $F5
    ld   a, [hl]                                  ; $4302: $7E
    ldh  [hLinkPositionY], a                      ; $4303: $E0 $99
    ld   hl, wEntitiesPosXTable                   ; $4305: $21 $00 $C2
    add  hl, de                                   ; $4308: $19
    ld   a, [hl]                                  ; $4309: $7E
    ldh  [hLinkPositionX], a                      ; $430A: $E0 $98
    ld   a, $30                                   ; $430C: $3E $30
    call ApplyVectorTowardsLink_trampoline        ; $430E: $CD $AA $3B
    pop  af                                       ; $4311: $F1
    ldh  [hLinkPositionX], a                      ; $4312: $E0 $98
    pop  af                                       ; $4314: $F1
    ldh  [hLinkPositionY], a                      ; $4315: $E0 $99
    ld   hl, wEntitiesSpeedZTable                 ; $4317: $21 $20 $C3
    add  hl, bc                                   ; $431A: $09
    ld   [hl], $10                                ; $431B: $36 $10
    call IncrementEntityState                     ; $431D: $CD $12 $3B
    ld   [hl], $04                                ; $4320: $36 $04
    ret                                           ; $4322: $C9

.jr_4323
    ld   hl, hMultiPurpose0                       ; $4323: $21 $D7 $FF
    ld   a, e                                     ; $4326: $7B
    add  [hl]                                     ; $4327: $86
    ld   e, a                                     ; $4328: $5F
    ld   hl, hMultiPurpose1                       ; $4329: $21 $D8 $FF
    cp   [hl]                                     ; $432C: $BE
    jr   nz, jr_005_42B9                          ; $432D: $20 $8A

label_005_432F:
    call GetEntityTransitionCountdown             ; $432F: $CD $05 $0C
    ld   [hl], $10                                ; $4332: $36 $10
    ret                                           ; $4334: $C9

label_005_4335:
    ld   a, [wD152]                               ; $4335: $FA $52 $D1
    ld   e, a                                     ; $4338: $5F
    ld   d, b                                     ; $4339: $50
    ld   hl, wEntitiesStatusTable                 ; $433A: $21 $80 $C2
    add  hl, de                                   ; $433D: $19
    ld   a, [hl]                                  ; $433E: $7E
    and  a                                        ; $433F: $A7
    ret  z                                        ; $4340: $C8

    ld   hl, wEntitiesPosXTable                   ; $4341: $21 $00 $C2
    add  hl, de                                   ; $4344: $19
    ldh  a, [hActiveEntityPosX]                   ; $4345: $F0 $EE
    sub  [hl]                                     ; $4347: $96
    add  $0E                                      ; $4348: $C6 $0E
    cp   $1A                                      ; $434A: $FE $1A
    ret  nc                                       ; $434C: $D0

    ld   hl, wEntitiesPosYTable                   ; $434D: $21 $10 $C2
    add  hl, de                                   ; $4350: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $4351: $F0 $EC
    sub  [hl]                                     ; $4353: $96
    add  $10                                      ; $4354: $C6 $10
    cp   $20                                      ; $4356: $FE $20
    ret  nc                                       ; $4358: $D0

    ld   hl, wEntitiesTypeTable                   ; $4359: $21 $A0 $C3
    add  hl, de                                   ; $435C: $19
    ld   a, [hl]                                  ; $435D: $7E
    cp   $3D                                      ; $435E: $FE $3D
    jr   nz, .jr_4380                             ; $4360: $20 $1E

    ld   hl, wEntitiesPrivateState4Table          ; $4362: $21 $40 $C4
    add  hl, de                                   ; $4365: $19
    ld   a, [hl]                                  ; $4366: $7E
    and  a                                        ; $4367: $A7
    ret  z                                        ; $4368: $C8

    ld   a, [wDialogState]                        ; $4369: $FA $9F $C1
    and  a                                        ; $436C: $A7
    ret  nz                                       ; $436D: $C0

    call GetEntityTransitionCountdown             ; $436E: $CD $05 $0C
    ld   [hl], b                                  ; $4371: $70
    ld   hl, wEntitiesPrivateCountdown2Table      ; $4372: $21 $00 $C3
    add  hl, bc                                   ; $4375: $09
    ld   a, [hl]                                  ; $4376: $7E
    and  a                                        ; $4377: $A7
    ret  nz                                       ; $4378: $C0

    ld   [hl], $80                                ; $4379: $36 $80
    jp_open_dialog Dialog115                      ; $437B

.jr_4380
    ld   hl, wEntitiesFlashCountdownTable         ; $4380: $21 $20 $C4
    add  hl, de                                   ; $4383: $19
    ld   a, [hl]                                  ; $4384: $7E
    and  a                                        ; $4385: $A7
    ret  nz                                       ; $4386: $C0

    ld   a, JINGLE_ENEMY_HIT                      ; $4387: $3E $03
    ldh  [hJingle], a                             ; $4389: $E0 $F2
    ld   hl, wEntitiesTypeTable                   ; $438B: $21 $A0 $C3
    add  hl, de                                   ; $438E: $19
    ld   a, [hl]                                  ; $438F: $7E
    cp   $AD                                      ; $4390: $FE $AD
    jr   nz, .jr_43A0                             ; $4392: $20 $0C

    ld   hl, wEntitiesFlashCountdownTable         ; $4394: $21 $20 $C4
    add  hl, de                                   ; $4397: $19
    ld   [hl], $18                                ; $4398: $36 $18
    ld   hl, wEntitiesInertiaTable                ; $439A: $21 $D0 $C3
    add  hl, de                                   ; $439D: $19
    inc  [hl]                                     ; $439E: $34
    ret                                           ; $439F: $C9

.jr_43A0
    push bc                                       ; $43A0: $C5
    ld   c, e                                     ; $43A1: $4B
    ld   b, d                                     ; $43A2: $42
    call DidKillEnemy                             ; $43A3: $CD $50 $3F
    pop  bc                                       ; $43A6: $C1
    ret                                           ; $43A7: $C9

func_005_43A8::
    ld   hl, wEntitiesPosXTable                   ; $43A8: $21 $00 $C2
    add  hl, bc                                   ; $43AB: $09
    ld   a, [hl]                                  ; $43AC: $7E
    ld   [wD100], a                               ; $43AD: $EA $00 $D1
    ld   hl, wEntitiesPosYTable                   ; $43B0: $21 $10 $C2
    add  hl, bc                                   ; $43B3: $09
    ld   a, [hl]                                  ; $43B4: $7E
    ld   hl, wEntitiesPosZTable                   ; $43B5: $21 $10 $C3
    add  hl, bc                                   ; $43B8: $09
    sub  [hl]                                     ; $43B9: $96
    ld   [wD110], a                               ; $43BA: $EA $10 $D1
    ld   de, wD100                                ; $43BD: $11 $00 $D1
    ld   hl, wD101                                ; $43C0: $21 $01 $D1
    push bc                                       ; $43C3: $C5
    ld   c, $05                                   ; $43C4: $0E $05

jr_005_43C6:
    ld   a, [de]                                  ; $43C6: $1A
    sub  [hl]                                     ; $43C7: $96
    add  $07                                      ; $43C8: $C6 $07
    cp   $0E                                      ; $43CA: $FE $0E
    jr   c, jr_005_43D8                           ; $43CC: $38 $0A

    bit  7, a                                     ; $43CE: $CB $7F
    jr   nz, .jr_43D6                             ; $43D0: $20 $04

    inc  [hl]                                     ; $43D2: $34
    inc  [hl]                                     ; $43D3: $34
    inc  [hl]                                     ; $43D4: $34
    inc  [hl]                                     ; $43D5: $34

.jr_43D6
    dec  [hl]                                     ; $43D6: $35
    dec  [hl]                                     ; $43D7: $35

jr_005_43D8:
    inc  hl                                       ; $43D8: $23
    inc  de                                       ; $43D9: $13
    dec  c                                        ; $43DA: $0D
    jr   nz, jr_005_43C6                          ; $43DB: $20 $E9

    ld   de, wD110                                ; $43DD: $11 $10 $D1
    ld   hl, wD111                                ; $43E0: $21 $11 $D1
    ld   c, $05                                   ; $43E3: $0E $05

jr_005_43E5:
    ld   a, [de]                                  ; $43E5: $1A
    sub  [hl]                                     ; $43E6: $96
    add  $07                                      ; $43E7: $C6 $07
    cp   $0E                                      ; $43E9: $FE $0E
    jr   c, jr_005_43F7                           ; $43EB: $38 $0A

    bit  7, a                                     ; $43ED: $CB $7F
    jr   nz, .jr_43F5                             ; $43EF: $20 $04

    inc  [hl]                                     ; $43F1: $34
    inc  [hl]                                     ; $43F2: $34
    inc  [hl]                                     ; $43F3: $34
    inc  [hl]                                     ; $43F4: $34

.jr_43F5
    dec  [hl]                                     ; $43F5: $35
    dec  [hl]                                     ; $43F6: $35

jr_005_43F7:
    inc  hl                                       ; $43F7: $23
    inc  de                                       ; $43F8: $13
    dec  c                                        ; $43F9: $0D
    jr   nz, jr_005_43E5                          ; $43FA: $20 $E9

    pop  bc                                       ; $43FC: $C1
    ret                                           ; $43FD: $C9

func_005_43FE::
    ld   a, [wIsBowWowFollowingLink]              ; $43FE: $FA $56 $DB
    and  a                                        ; $4401: $A7
    ret  z                                        ; $4402: $C8

    cp   BOW_WOW_KIDNAPPED                        ; $4403: $FE $80
    ret  z                                        ; $4405: $C8

    ldh  a, [hLinkSpeedY]                         ; $4406: $F0 $9B
    ld   hl, hLinkSpeedX                          ; $4408: $21 $9A $FF
    or   [hl]                                     ; $440B: $B6
    ld   hl, hLinkVelocityZ                       ; $440C: $21 $A3 $FF
    or   [hl]                                     ; $440F: $B6
    jp   z, ret_005_44CA                          ; $4410: $CA $CA $44

    ld   hl, wEntitiesPrivateState1Table          ; $4413: $21 $B0 $C2
    add  hl, bc                                   ; $4416: $09
    ld   a, [hl]                                  ; $4417: $7E
    ld   [wD106], a                               ; $4418: $EA $06 $D1
    ld   hl, wEntitiesPrivateState2Table          ; $441B: $21 $C0 $C2
    add  hl, bc                                   ; $441E: $09
    ld   a, [hl]                                  ; $441F: $7E
    ld   [wD116], a                               ; $4420: $EA $16 $D1
    ld   de, wD106                                ; $4423: $11 $06 $D1
    ld   hl, wD105                                ; $4426: $21 $05 $D1
    push bc                                       ; $4429: $C5
    ld   bc, $06                                  ; $442A: $01 $06 $00

jr_005_442D:
    ld   a, [de]                                  ; $442D: $1A
    sub  [hl]                                     ; $442E: $96
    add  $07                                      ; $442F: $C6 $07
    cp   $0E                                      ; $4431: $FE $0E
    jr   c, jr_005_4448                           ; $4433: $38 $13

    bit  7, a                                     ; $4435: $CB $7F
    jr   nz, .jr_443F                             ; $4437: $20 $06

    inc  [hl]                                     ; $4439: $34
    inc  [hl]                                     ; $443A: $34
    inc  [hl]                                     ; $443B: $34
    inc  [hl]                                     ; $443C: $34
    inc  [hl]                                     ; $443D: $34
    inc  [hl]                                     ; $443E: $34

.jr_443F
    dec  [hl]                                     ; $443F: $35
    dec  [hl]                                     ; $4440: $35
    dec  [hl]                                     ; $4441: $35
    ld   a, c                                     ; $4442: $79
    cp   $01                                      ; $4443: $FE $01
    jr   nz, jr_005_4448                          ; $4445: $20 $01

    inc  b                                        ; $4447: $04

jr_005_4448:
    dec  hl                                       ; $4448: $2B
    dec  de                                       ; $4449: $1B
    dec  c                                        ; $444A: $0D
    jr   nz, jr_005_442D                          ; $444B: $20 $E0

    ld   de, wD116                                ; $444D: $11 $16 $D1
    ld   hl, wD115                                ; $4450: $21 $15 $D1
    ld   c, $06                                   ; $4453: $0E $06

jr_005_4455:
    ld   a, [de]                                  ; $4455: $1A
    sub  [hl]                                     ; $4456: $96
    add  $07                                      ; $4457: $C6 $07
    cp   $0E                                      ; $4459: $FE $0E
    jr   c, jr_005_4473                           ; $445B: $38 $16

    bit  7, a                                     ; $445D: $CB $7F
    jr   nz, .jr_4467                             ; $445F: $20 $06

    inc  [hl]                                     ; $4461: $34
    inc  [hl]                                     ; $4462: $34
    inc  [hl]                                     ; $4463: $34
    inc  [hl]                                     ; $4464: $34
    inc  [hl]                                     ; $4465: $34
    inc  [hl]                                     ; $4466: $34

.jr_4467
    dec  [hl]                                     ; $4467: $35
    dec  [hl]                                     ; $4468: $35
    dec  [hl]                                     ; $4469: $35
    ld   a, c                                     ; $446A: $79
    cp   $01                                      ; $446B: $FE $01
    jr   nz, jr_005_4473                          ; $446D: $20 $04

    ld   a, b                                     ; $446F: $78
    or   $02                                      ; $4470: $F6 $02
    ld   b, a                                     ; $4472: $47

jr_005_4473:
    dec  hl                                       ; $4473: $2B
    dec  de                                       ; $4474: $1B
    dec  c                                        ; $4475: $0D
    jr   nz, jr_005_4455                          ; $4476: $20 $DD

    ld   a, b                                     ; $4478: $78
    ldh  [hMultiPurpose0], a                      ; $4479: $E0 $D7
    pop  bc                                       ; $447B: $C1
    and  $01                                      ; $447C: $E6 $01
    jr   z, jr_005_4499                           ; $447E: $28 $19

    ld   hl, wD110                                ; $4480: $21 $10 $D1
    ld   e, $06                                   ; $4483: $1E $06

jr_005_4485:
    ld   a, [wD151]                               ; $4485: $FA $51 $D1
    sub  [hl]                                     ; $4488: $96
    jr   z, jr_005_4492                           ; $4489: $28 $07

    bit  7, a                                     ; $448B: $CB $7F
    jr   nz, .jr_4491                             ; $448D: $20 $02

    inc  [hl]                                     ; $448F: $34
    inc  [hl]                                     ; $4490: $34

.jr_4491
    dec  [hl]                                     ; $4491: $35

jr_005_4492:
    inc  hl                                       ; $4492: $23
    dec  e                                        ; $4493: $1D
    jr   nz, jr_005_4485                          ; $4494: $20 $EF

    call func_005_44B5                            ; $4496: $CD $B5 $44

jr_005_4499:
    ldh  a, [hMultiPurpose0]                      ; $4499: $F0 $D7
    and  $02                                      ; $449B: $E6 $02
    jr   z, ret_005_44CA                          ; $449D: $28 $2B

    ld   hl, wD100                                ; $449F: $21 $00 $D1
    ld   e, $06                                   ; $44A2: $1E $06

jr_005_44A4:
    ld   a, [wD150]                               ; $44A4: $FA $50 $D1
    sub  [hl]                                     ; $44A7: $96
    jr   z, jr_005_44B1                           ; $44A8: $28 $07

    bit  7, a                                     ; $44AA: $CB $7F
    jr   nz, .jr_44B0                             ; $44AC: $20 $02

    inc  [hl]                                     ; $44AE: $34
    inc  [hl]                                     ; $44AF: $34

.jr_44B0
    dec  [hl]                                     ; $44B0: $35

jr_005_44B1:
    inc  hl                                       ; $44B1: $23
    dec  e                                        ; $44B2: $1D
    jr   nz, jr_005_44A4                          ; $44B3: $20 $EF

func_005_44B5::
    ld   a, [wD110]                               ; $44B5: $FA $10 $D1
    ld   hl, wEntitiesPosZTable                   ; $44B8: $21 $10 $C3
    add  hl, bc                                   ; $44BB: $09
    add  [hl]                                     ; $44BC: $86
    ld   hl, wEntitiesPosYTable                   ; $44BD: $21 $10 $C2
    add  hl, bc                                   ; $44C0: $09
    ld   [hl], a                                  ; $44C1: $77
    ld   a, [wD100]                               ; $44C2: $FA $00 $D1
    ld   hl, wEntitiesPosXTable                   ; $44C5: $21 $00 $C2
    add  hl, bc                                   ; $44C8: $09
    ld   [hl], a                                  ; $44C9: $77

ret_005_44CA:
    ret                                           ; $44CA: $C9

func_005_44CB::
    ld   hl, wEntitiesSpeedXTable                 ; $44CB: $21 $40 $C2
    add  hl, bc                                   ; $44CE: $09
    ld   a, [hl]                                  ; $44CF: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $44D0: $21 $50 $C2
    add  hl, bc                                   ; $44D3: $09
    or   [hl]                                     ; $44D4: $B6
    ret  z                                        ; $44D5: $C8

    ld   hl, wEntitiesSpeedXTable                 ; $44D6: $21 $40 $C2
    add  hl, bc                                   ; $44D9: $09
    ld   a, [hl]                                  ; $44DA: $7E
    ld   d, a                                     ; $44DB: $57
    bit  7, a                                     ; $44DC: $CB $7F
    jr   z, .jr_44E2                              ; $44DE: $28 $02

    cpl                                           ; $44E0: $2F
    inc  a                                        ; $44E1: $3C

.jr_44E2
    ld   e, a                                     ; $44E2: $5F
    ld   hl, wEntitiesSpeedYTable                 ; $44E3: $21 $50 $C2
    add  hl, bc                                   ; $44E6: $09
    ld   a, [hl]                                  ; $44E7: $7E
    bit  7, a                                     ; $44E8: $CB $7F
    jr   z, .jr_44EE                              ; $44EA: $28 $02

    cpl                                           ; $44EC: $2F
    inc  a                                        ; $44ED: $3C

.jr_44EE
    cp   e                                        ; $44EE: $BB
    jr   nc, jr_005_44FE                          ; $44EF: $30 $0D

    bit  7, d                                     ; $44F1: $CB $7A
    jr   nz, .jr_44F9                             ; $44F3: $20 $04

    ld   e, $04                                   ; $44F5: $1E $04
    jr   label_005_4509                           ; $44F7: $18 $10

.jr_44F9
    ld   e, $02                                   ; $44F9: $1E $02
    jp   label_005_4509                           ; $44FB: $C3 $09 $45

jr_005_44FE:
    bit  7, [hl]                                  ; $44FE: $CB $7E
    jr   z, .jr_4507                              ; $4500: $28 $05

    ld   a, $06                                   ; $4502: $3E $06
    jp   SetEntitySpriteVariant                   ; $4504: $C3 $0C $3B

.jr_4507
    ld   e, $00                                   ; $4507: $1E $00

label_005_4509:
    ldh  a, [hFrameCounter]                       ; $4509: $F0 $E7
    rra                                           ; $450B: $1F
    rra                                           ; $450C: $1F
    rra                                           ; $450D: $1F
    and  $01                                      ; $450E: $E6 $01
    add  e                                        ; $4510: $83
    jp   SetEntitySpriteVariant                   ; $4511: $C3 $0C $3B
