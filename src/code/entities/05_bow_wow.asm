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
    ld   a, c                                     ;; 05:4038 $79
    ld   [wD154], a                               ;; 05:4039 $EA $54 $D1
    ld   a, [wIsBowWowFollowingLink]              ;; 05:403C $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ;; 05:403F $FE $01
    jr   nz, .selectSpriteVariant                 ;; 05:4041 $20 $11

    ; calculate x- and y-Offset of bow_wow
    ldh  a, [hMapRoom]                            ;; 05:4043 $F0 $F6
    ld   hl, wEntitiesRoomTable                   ;; 05:4045 $21 $E0 $C3
    add  hl, bc                                   ;; 05:4048 $09
    ld   [hl], a                                  ;; 05:4049 $77
    ld   hl, wEntitiesPosXSignTable               ;; 05:404A $21 $20 $C2
    add  hl, bc                                   ;; 05:404D $09
    ld   [hl], b                                  ;; 05:404E $70
    ld   hl, wEntitiesPosYSignTable               ;; 05:404F $21 $30 $C2
    add  hl, bc                                   ;; 05:4052 $09
    ld   [hl], b                                  ;; 05:4053 $70

.selectSpriteVariant
    ld   de, BowWowFollowingSpriteVariants        ;; 05:4054 $11 $1C $40
    ld   a, [wIsBowWowFollowingLink]              ;; 05:4057 $FA $56 $DB
    and  a                                        ;; 05:405A $A7
    jr   nz, .render                              ;; 05:405B $20 $03

    ld   de, BowWowAtHomeSpriteVariants           ;; 05:405D $11 $00 $40

.render:
    call RenderActiveEntitySpritesPair            ;; 05:4060 $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ;; 05:4063 $FA $24 $C1
    and  a                                        ;; 05:4066 $A7
    jr   z, .jr_407C                              ;; 05:4067 $28 $13

    ld   a, [wIsBowWowFollowingLink]              ;; 05:4069 $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ;; 05:406C $FE $01
    jp   z, label_005_40A2                        ;; 05:406E $CA $A2 $40

    ld   hl, wEntitiesRoomTable                   ;; 05:4071 $21 $E0 $C3
    add  hl, bc                                   ;; 05:4074 $09
    ldh  a, [hMapRoom]                            ;; 05:4075 $F0 $F6
    cp   [hl]                                     ;; 05:4077 $BE
    ret  z                                        ;; 05:4078 $C8

    jp   label_005_40A2                           ;; 05:4079 $C3 $A2 $40

.jr_407C
    ld   a, [wC1A8]                               ;; 05:407C $FA $A8 $C1
    ld   hl, wDialogState                         ;; 05:407F $21 $9F $C1
    or   [hl]                                     ;; 05:4082 $B6
    ld   hl, wInventoryAppearing                  ;; 05:4083 $21 $4F $C1
    or   [hl]                                     ;; 05:4086 $B6
    jp   nz, label_005_40A2                       ;; 05:4087 $C2 $A2 $40

    ld   a, [wTransitionSequenceCounter]          ;; 05:408A $FA $6B $C1
    cp   $04                                      ;; 05:408D $FE $04
    ret  nz                                       ;; 05:408F $C0

    call func_005_44CB                            ;; 05:4090 $CD $CB $44
    call DecrementEntityIgnoreHitsCountdown       ;; 05:4093 $CD $56 $0C
    ld   a, [wIsBowWowFollowingLink]              ;; 05:4096 $FA $56 $DB
    and  a                                        ;; 05:4099 $A7
    jr   nz, .jr_409F                             ;; 05:409A $20 $03

    call label_3B70                               ;; 05:409C $CD $70 $3B

.jr_409F
    call func_005_40A5                            ;; 05:409F $CD $A5 $40

label_005_40A2:
    jp   label_005_4253                           ;; 05:40A2 $C3 $53 $42

func_005_40A5::
    ld   hl, wEntitiesPrivateState4Table          ;; 05:40A5 $21 $40 $C4
    add  hl, bc                                   ;; 05:40A8 $09
    ld   a, [hl]                                  ;; 05:40A9 $7E
    JP_TABLE                                      ;; 05:40AA
._00 dw func_005_40AF                             ;; 05:40AB
._01 dw func_005_40E6                             ;; 05:40AD

func_005_40AF::
    ld   hl, wEntitiesPosXTable                   ;; 05:40AF $21 $00 $C2
    add  hl, bc                                   ;; 05:40B2 $09
    ld   a, [hl]                                  ;; 05:40B3 $7E
    add  $04                                      ;; 05:40B4 $C6 $04
    ld   [hl], a                                  ;; 05:40B6 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 05:40B7 $21 $B0 $C2
    add  hl, bc                                   ;; 05:40BA $09
    ld   [hl], a                                  ;; 05:40BB $77
    ld   e, $10                                   ;; 05:40BC $1E $10
    ld   hl, wD100                                ;; 05:40BE $21 $00 $D1

.loop_40C1
    ld   [hl+], a                                 ;; 05:40C1 $22
    dec  e                                        ;; 05:40C2 $1D
    jr   nz, .loop_40C1                           ;; 05:40C3 $20 $FC

    ld   hl, wEntitiesPosYTable                   ;; 05:40C5 $21 $10 $C2
    add  hl, bc                                   ;; 05:40C8 $09
    ld   a, [hl]                                  ;; 05:40C9 $7E
    add  $08                                      ;; 05:40CA $C6 $08
    ld   [hl], a                                  ;; 05:40CC $77
    ld   hl, wEntitiesPrivateState2Table          ;; 05:40CD $21 $C0 $C2
    add  hl, bc                                   ;; 05:40D0 $09
    ld   [hl], a                                  ;; 05:40D1 $77
    ld   hl, wEntitiesPosZTable                   ;; 05:40D2 $21 $10 $C3
    add  hl, bc                                   ;; 05:40D5 $09
    sub  [hl]                                     ;; 05:40D6 $96
    ld   e, $10                                   ;; 05:40D7 $1E $10
    ld   hl, wD110                                ;; 05:40D9 $21 $10 $D1

.loop_40DC
    ld   [hl+], a                                 ;; 05:40DC $22
    dec  e                                        ;; 05:40DD $1D
    jr   nz, .loop_40DC                           ;; 05:40DE $20 $FC

    ld   hl, wEntitiesPrivateState4Table          ;; 05:40E0 $21 $40 $C4
    add  hl, bc                                   ;; 05:40E3 $09
    inc  [hl]                                     ;; 05:40E4 $34
    ret                                           ;; 05:40E5 $C9

func_005_40E6::
    ; if bow_wow is at home jump to jr_005_4137
    ld   a, [wIsBowWowFollowingLink]              ;; 05:40E6 $FA $56 $DB
    and  a                                        ;; 05:40E9 $A7
    jr   z, jr_005_4137                           ;; 05:40EA $28 $4B

    cp   BOW_WOW_KIDNAPPED                        ;; 05:40EC $FE $80
    jr   z, .jr_40FA                              ;; 05:40EE $28 $0A

    ; bow_wow is following link
    ldh  a, [hLinkPositionX]                      ;; 05:40F0 $F0 $98
    ldh  [hMultiPurpose0], a                      ;; 05:40F2 $E0 $D7
    ldh  a, [hLinkPositionZModified]              ;; 05:40F4 $F0 $B3
    ldh  [hMultiPurpose1], a                      ;; 05:40F6 $E0 $D8
    jr   jr_005_4129                              ;; 05:40F8 $18 $2F

.jr_40FA
    ldh  a, [hLinkPositionY]                      ;; 05:40FA $F0 $99
    sub  $40                                      ;; 05:40FC $D6 $40
    add  $10                                      ;; 05:40FE $C6 $10
    cp   $20                                      ;; 05:4100 $FE $20
    jr   nc, .jr_4127                             ;; 05:4102 $30 $23

    ldh  a, [hLinkPositionX]                      ;; 05:4104 $F0 $98
    sub  $88                                      ;; 05:4106 $D6 $88
    add  $10                                      ;; 05:4108 $C6 $10
    cp   $20                                      ;; 05:410A $FE $20
    jr   nc, .jr_4127                             ;; 05:410C $30 $19

    ld   a, [wCollisionType]                      ;; 05:410E $FA $33 $C1
    and  a                                        ;; 05:4111 $A7
    jr   z, .jr_4127                              ;; 05:4112 $28 $13

    ; Bow-Wow retrieved from King Moblin
    ld   a, MUSIC_OBTAIN_ITEM                     ;; 05:4114 $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 05:4116 $EA $68 $D3
    call_open_dialog Dialog16C                    ;; 05:4119
    ld   a, WAVE_SFX_CHAIN_CHOMP                  ;; 05:411E $3E $18
    ldh  [hWaveSfx], a                            ;; 05:4120 $E0 $F3
    ld   a, BOW_WOW_FOLLOWING                     ;; 05:4122 $3E $01
    ld   [wIsBowWowFollowingLink], a              ;; 05:4124 $EA $56 $DB

.jr_4127
    jr   jr_005_4137                              ;; 05:4127 $18 $0E

jr_005_4129:
    ldh  a, [hMultiPurpose0]                      ;; 05:4129 $F0 $D7
    ld   hl, wEntitiesPrivateState1Table          ;; 05:412B $21 $B0 $C2
    add  hl, bc                                   ;; 05:412E $09
    ld   [hl], a                                  ;; 05:412F $77
    ldh  a, [hMultiPurpose1]                      ;; 05:4130 $F0 $D8
    ld   hl, wEntitiesPrivateState2Table          ;; 05:4132 $21 $C0 $C2
    add  hl, bc                                   ;; 05:4135 $09
    ld   [hl], a                                  ;; 05:4136 $77

jr_005_4137:
    ld   hl, wEntitiesPrivateState1Table          ;; 05:4137 $21 $B0 $C2
    add  hl, bc                                   ;; 05:413A $09
    ld   a, [hl]                                  ;; 05:413B $7E
    ld   [wD150], a                               ;; 05:413C $EA $50 $D1
    ld   hl, wEntitiesPrivateState2Table          ;; 05:413F $21 $C0 $C2
    add  hl, bc                                   ;; 05:4142 $09
    ld   a, [hl]                                  ;; 05:4143 $7E
    ld   [wD151], a                               ;; 05:4144 $EA $51 $D1
    call AddEntityZSpeedToPos_05                  ;; 05:4147 $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ;; 05:414A $21 $20 $C3
    add  hl, bc                                   ;; 05:414D $09
    dec  [hl]                                     ;; 05:414E $35
    dec  [hl]                                     ;; 05:414F $35
    ld   e, l                                     ;; 05:4150 $5D
    ld   d, h                                     ;; 05:4151 $54
    ld   hl, wEntitiesPosZTable                   ;; 05:4152 $21 $10 $C3
    add  hl, bc                                   ;; 05:4155 $09
    ld   a, [hl]                                  ;; 05:4156 $7E
    and  $80                                      ;; 05:4157 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 05:4159 $E0 $E8
    jr   z, .jr_4160                              ;; 05:415B $28 $03

    xor  a                                        ;; 05:415D $AF
    ld   [hl], a                                  ;; 05:415E $77
    ld   [de], a                                  ;; 05:415F $12

.jr_4160
    call ApplyEntityInteractionWithBackground_trampoline ;; 05:4160 $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ;; 05:4163 $F0 $F0
    JP_TABLE                                      ;; 05:4165
._00 dw func_005_4180                             ;; 05:4166
._01 dw func_005_41CF                             ;; 05:4168
._02 dw func_005_41EB                             ;; 05:416A
._03 dw func_005_420E                             ;; 05:416C
._04 dw func_005_41EB                             ;; 05:416E

Data_005_4170::
    db   $04, $08, $0C, $08, $FC, $F8, $F4, $F8

Data_005_4178::
    db   $F4, $F8, $04, $08, $0C, $08, $FC, $F8

func_005_4180::
    call GetEntityTransitionCountdown             ;; 05:4180 $CD $05 $0C
    jr   z, jr_005_41B1                           ;; 05:4183 $28 $2C

    call GetEntityPrivateCountdown1               ;; 05:4185 $CD $00 $0C
    jr   nz, .ret_41B0                            ;; 05:4188 $20 $26

    call GetRandomByte                            ;; 05:418A $CD $0D $28
    and  $3F                                      ;; 05:418D $E6 $3F
    add  $20                                      ;; 05:418F $C6 $20
    ld   [hl], a                                  ;; 05:4191 $77
    call IncrementEntityState                     ;; 05:4192 $CD $12 $3B
    call GetRandomByte                            ;; 05:4195 $CD $0D $28
    and  $07                                      ;; 05:4198 $E6 $07
    ld   e, a                                     ;; 05:419A $5F
    ld   d, b                                     ;; 05:419B $50
    ld   hl, Data_005_4170                        ;; 05:419C $21 $70 $41
    add  hl, de                                   ;; 05:419F $19
    ld   a, [hl]                                  ;; 05:41A0 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:41A1 $21 $40 $C2
    add  hl, bc                                   ;; 05:41A4 $09
    ld   [hl], a                                  ;; 05:41A5 $77
    ld   hl, Data_005_4178                        ;; 05:41A6 $21 $78 $41
    add  hl, de                                   ;; 05:41A9 $19
    ld   a, [hl]                                  ;; 05:41AA $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:41AB $21 $50 $C2
    add  hl, bc                                   ;; 05:41AE $09
    ld   [hl], a                                  ;; 05:41AF $77

.ret_41B0
    ret                                           ;; 05:41B0 $C9

jr_005_41B1:
    call GetEntityTransitionCountdown             ;; 05:41B1 $CD $05 $0C
    ld   [hl], $28                                ;; 05:41B4 $36 $28
    ld   a, [wIsBowWowFollowingLink]              ;; 05:41B6 $FA $56 $DB
    and  a                                        ;; 05:41B9 $A7
    jr   z, .bow_wow_not_following                ;; 05:41BA $28 $03

    jp   label_005_4297                           ;; 05:41BC $C3 $97 $42

.bow_wow_not_following
    ld   hl, wEntitiesSpeedZTable                 ;; 05:41BF $21 $20 $C3
    add  hl, bc                                   ;; 05:41C2 $09
    ld   [hl], $20                                ;; 05:41C3 $36 $20
    call IncrementEntityState                     ;; 05:41C5 $CD $12 $3B
    ld   [hl], $02                                ;; 05:41C8 $36 $02
    ld   a, $20                                   ;; 05:41CA $3E $20
    jp   ApplyVectorTowardsLink_trampoline        ;; 05:41CC $C3 $AA $3B

func_005_41CF::
    call GetEntityPrivateCountdown1               ;; 05:41CF $CD $00 $0C
    jr   nz, .jr_41DA                             ;; 05:41D2 $20 $06

    ld   [hl], $20                                ;; 05:41D4 $36 $20
    call IncrementEntityState                     ;; 05:41D6 $CD $12 $3B
    ld   [hl], b                                  ;; 05:41D9 $70

.jr_41DA
    ldh  a, [hMultiPurposeG]                      ;; 05:41DA $F0 $E8
    and  a                                        ;; 05:41DC $A7
    jr   z, .jr_41E5                              ;; 05:41DD $28 $06

    ld   hl, wEntitiesSpeedZTable                 ;; 05:41DF $21 $20 $C3
    add  hl, bc                                   ;; 05:41E2 $09
    ld   [hl], $10                                ;; 05:41E3 $36 $10

.jr_41E5
    call UpdateEntityPosWithSpeed_05              ;; 05:41E5 $CD $B1 $7A
    jp   func_005_4228                            ;; 05:41E8 $C3 $28 $42

func_005_41EB::
    call GetEntityTransitionCountdown             ;; 05:41EB $CD $05 $0C
    jr   z, .jr_41F9                              ;; 05:41EE $28 $09

    call UpdateEntityPosWithSpeed_05              ;; 05:41F0 $CD $B1 $7A
    call func_005_4228                            ;; 05:41F3 $CD $28 $42
    dec  e                                        ;; 05:41F6 $1D
    jr   z, jr_005_4206                           ;; 05:41F7 $28 $0D

.jr_41F9
    call ClearEntitySpeed                         ;; 05:41F9 $CD $7F $3D
    call IncrementEntityState                     ;; 05:41FC $CD $12 $3B
    ld   [hl], $03                                ;; 05:41FF $36 $03
    call GetEntityTransitionCountdown             ;; 05:4201 $CD $05 $0C
    ld   [hl], $10                                ;; 05:4204 $36 $10

jr_005_4206:
    ld   a, [wIsBowWowFollowingLink]              ;; 05:4206 $FA $56 $DB
    and  a                                        ;; 05:4209 $A7
    ret  z                                        ;; 05:420A $C8

    jp   label_005_4335                           ;; 05:420B $C3 $35 $43

func_005_420E::
    call GetEntityTransitionCountdown             ;; 05:420E $CD $05 $0C
    jr   nz, ret_005_4227                         ;; 05:4211 $20 $14

    call GetRandomByte                            ;; 05:4213 $CD $0D $28
    and  $3F                                      ;; 05:4216 $E6 $3F
    add  $30                                      ;; 05:4218 $C6 $30
    ld   [hl], a                                  ;; 05:421A $77
    ld   a, [wIsBowWowFollowingLink]              ;; 05:421B $FA $56 $DB
    and  a                                        ;; 05:421E $A7
    jr   z, .bow_wow_not_following                ;; 05:421F $28 $02

    ld   [hl], $10                                ;; 05:4221 $36 $10

.bow_wow_not_following
    call IncrementEntityState                     ;; 05:4223 $CD $12 $3B
    ld   [hl], b                                  ;; 05:4226 $70

ret_005_4227:
    ret                                           ;; 05:4227 $C9

func_005_4228::
    ld   e, $01                                   ;; 05:4228 $1E $01
    ld   hl, wEntitiesPrivateState1Table          ;; 05:422A $21 $B0 $C2
    add  hl, bc                                   ;; 05:422D $09
    ld   a, [hl]                                  ;; 05:422E $7E
    ld   hl, wEntitiesPosXTable                   ;; 05:422F $21 $00 $C2
    add  hl, bc                                   ;; 05:4232 $09
    sub  [hl]                                     ;; 05:4233 $96
    add  $20                                      ;; 05:4234 $C6 $20
    cp   $40                                      ;; 05:4236 $FE $40
    jr   c, .jr_423E                              ;; 05:4238 $38 $04

    ldh  a, [hActiveEntityPosX]                   ;; 05:423A $F0 $EE
    ld   [hl], a                                  ;; 05:423C $77
    inc  e                                        ;; 05:423D $1C

.jr_423E
    ld   hl, wEntitiesPrivateState2Table          ;; 05:423E $21 $C0 $C2
    add  hl, bc                                   ;; 05:4241 $09
    ld   a, [hl]                                  ;; 05:4242 $7E
    ld   hl, wEntitiesPosYTable                   ;; 05:4243 $21 $10 $C2
    add  hl, bc                                   ;; 05:4246 $09
    sub  [hl]                                     ;; 05:4247 $96
    add  $20                                      ;; 05:4248 $C6 $20
    cp   $40                                      ;; 05:424A $FE $40
    jr   c, .ret_4252                             ;; 05:424C $38 $04

    ldh  a, [hActiveEntityPosY]                   ;; 05:424E $F0 $EF
    ld   [hl], a                                  ;; 05:4250 $77
    inc  e                                        ;; 05:4251 $1C

.ret_4252
    ret                                           ;; 05:4252 $C9

label_005_4253:
    call func_005_43A8                            ;; 05:4253 $CD $A8 $43
    call func_005_43FE                            ;; 05:4256 $CD $FE $43
    ld   a, [wOAMNextAvailableSlot]               ;; 05:4259 $FA $C0 $C3
    ld   e, a                                     ;; 05:425C $5F
    ld   d, $00                                   ;; 05:425D $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 05:425F $21 $30 $C0
    add  hl, de                                   ;; 05:4262 $19
    ld   e, l                                     ;; 05:4263 $5D
    ld   d, h                                     ;; 05:4264 $54
    push bc                                       ;; 05:4265 $C5
    ld   c, $05                                   ;; 05:4266 $0E $05

jr_005_4268:
    ldh  a, [hFrameCounter]                       ;; 05:4268 $F0 $E7
    xor  c                                        ;; 05:426A $A9
    rra                                           ;; 05:426B $1F
    jr   c, jr_005_428E                           ;; 05:426C $38 $20

    ld   hl, wD110                                ;; 05:426E $21 $10 $D1
    add  hl, bc                                   ;; 05:4271 $09
    ld   a, [hl]                                  ;; 05:4272 $7E
    ld   [de], a                                  ;; 05:4273 $12
    inc  de                                       ;; 05:4274 $13
    ld   hl, wD100                                ;; 05:4275 $21 $00 $D1
    add  hl, bc                                   ;; 05:4278 $09
    ld   a, [hl]                                  ;; 05:4279 $7E
    add  $04                                      ;; 05:427A $C6 $04
    ld   [de], a                                  ;; 05:427C $12
    inc  de                                       ;; 05:427D $13
    ld   a, [wIsBowWowFollowingLink]              ;; 05:427E $FA $56 $DB
    and  a                                        ;; 05:4281 $A7
    ld   a, $4E                                   ;; 05:4282 $3E $4E
    jr   nz, .bow_wow_not_at_home                 ;; 05:4284 $20 $02

    ld   a, $7E                                   ;; 05:4286 $3E $7E

.bow_wow_not_at_home
    ld   [de], a                                  ;; 05:4288 $12
    inc  de                                       ;; 05:4289 $13
    ld   a, $00                                   ;; 05:428A $3E $00
    ld   [de], a                                  ;; 05:428C $12
    inc  de                                       ;; 05:428D $13

jr_005_428E:
    dec  c                                        ;; 05:428E $0D
    jr   nz, jr_005_4268                          ;; 05:428F $20 $D7

    pop  bc                                       ;; 05:4291 $C1
    ld   a, $03                                   ;; 05:4292 $3E $03
    jp   func_015_7964_trampoline                 ;; 05:4294 $C3 $A0 $3D

label_005_4297:
    ld   a, [wIsBowWowFollowingLink]              ;; 05:4297 $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ;; 05:429A $FE $80
    jp   z, label_005_432F                        ;; 05:429C $CA $2F $43

    call GetRandomByte                            ;; 05:429F $CD $0D $28
    ld   d, b                                     ;; 05:42A2 $50
    and  $01                                      ;; 05:42A3 $E6 $01
    jr   nz, .jr_42AF                             ;; 05:42A5 $20 $08

    ld   e, $0F                                   ;; 05:42A7 $1E $0F
    ld   a, $FF                                   ;; 05:42A9 $3E $FF
    ldh  [hMultiPurpose0], a                      ;; 05:42AB $E0 $D7
    jr   jr_005_42B7                              ;; 05:42AD $18 $08

.jr_42AF
    ld   e, $00                                   ;; 05:42AF $1E $00
    ld   a, $01                                   ;; 05:42B1 $3E $01
    ldh  [hMultiPurpose0], a                      ;; 05:42B3 $E0 $D7
    ld   a, $10                                   ;; 05:42B5 $3E $10

jr_005_42B7:
    ldh  [hMultiPurpose1], a                      ;; 05:42B7 $E0 $D8

jr_005_42B9:
    ld   a, e                                     ;; 05:42B9 $7B
    cp   c                                        ;; 05:42BA $B9
    jr   z, .jr_4323                              ;; 05:42BB $28 $66

    ld   hl, wEntitiesStatusTable                 ;; 05:42BD $21 $80 $C2
    add  hl, de                                   ;; 05:42C0 $19
    ld   a, [hl]                                  ;; 05:42C1 $7E
    and  a                                        ;; 05:42C2 $A7
    jr   z, .jr_4323                              ;; 05:42C3 $28 $5E

    cp   $01                                      ;; 05:42C5 $FE $01
    jr   z, .jr_4323                              ;; 05:42C7 $28 $5A

    ld   hl, wEntitiesSpriteVariantTable          ;; 05:42C9 $21 $B0 $C3
    add  hl, de                                   ;; 05:42CC $19
    ld   a, [hl]                                  ;; 05:42CD $7E
    dec  a                                        ;; 05:42CE $3D
    jr   z, .jr_4323                              ;; 05:42CF $28 $52

    push de                                       ;; 05:42D1 $D5
    ld   hl, wEntitiesTypeTable                   ;; 05:42D2 $21 $A0 $C3
    add  hl, de                                   ;; 05:42D5 $19
    ld   e, [hl]                                  ;; 05:42D6 $5E
    call CanBowWowEatEntity                       ;; 05:42D7 $CD $25 $39
    pop  de                                       ;; 05:42DA $D1
    and  a                                        ;; 05:42DB $A7
    jr   z, .jr_4323                              ;; 05:42DC $28 $45

    ld   hl, wEntitiesPosXTable                   ;; 05:42DE $21 $00 $C2
    add  hl, de                                   ;; 05:42E1 $19
    ldh  a, [hLinkPositionX]                      ;; 05:42E2 $F0 $98
    sub  [hl]                                     ;; 05:42E4 $96
    add  $2F                                      ;; 05:42E5 $C6 $2F
    cp   $5E                                      ;; 05:42E7 $FE $5E
    jr   nc, .jr_4323                             ;; 05:42E9 $30 $38

    ld   hl, wEntitiesPosYTable                   ;; 05:42EB $21 $10 $C2
    add  hl, de                                   ;; 05:42EE $19
    ldh  a, [hLinkPositionY]                      ;; 05:42EF $F0 $99
    sub  [hl]                                     ;; 05:42F1 $96
    add  $2F                                      ;; 05:42F2 $C6 $2F
    cp   $5E                                      ;; 05:42F4 $FE $5E
    jr   nc, .jr_4323                             ;; 05:42F6 $30 $2B

    ld   a, e                                     ;; 05:42F8 $7B
    ld   [wD152], a                               ;; 05:42F9 $EA $52 $D1
    ldh  a, [hLinkPositionY]                      ;; 05:42FC $F0 $99
    push af                                       ;; 05:42FE $F5
    ldh  a, [hLinkPositionX]                      ;; 05:42FF $F0 $98
    push af                                       ;; 05:4301 $F5
    ld   a, [hl]                                  ;; 05:4302 $7E
    ldh  [hLinkPositionY], a                      ;; 05:4303 $E0 $99
    ld   hl, wEntitiesPosXTable                   ;; 05:4305 $21 $00 $C2
    add  hl, de                                   ;; 05:4308 $19
    ld   a, [hl]                                  ;; 05:4309 $7E
    ldh  [hLinkPositionX], a                      ;; 05:430A $E0 $98
    ld   a, $30                                   ;; 05:430C $3E $30
    call ApplyVectorTowardsLink_trampoline        ;; 05:430E $CD $AA $3B
    pop  af                                       ;; 05:4311 $F1
    ldh  [hLinkPositionX], a                      ;; 05:4312 $E0 $98
    pop  af                                       ;; 05:4314 $F1
    ldh  [hLinkPositionY], a                      ;; 05:4315 $E0 $99
    ld   hl, wEntitiesSpeedZTable                 ;; 05:4317 $21 $20 $C3
    add  hl, bc                                   ;; 05:431A $09
    ld   [hl], $10                                ;; 05:431B $36 $10
    call IncrementEntityState                     ;; 05:431D $CD $12 $3B
    ld   [hl], $04                                ;; 05:4320 $36 $04
    ret                                           ;; 05:4322 $C9

.jr_4323
    ld   hl, hMultiPurpose0                       ;; 05:4323 $21 $D7 $FF
    ld   a, e                                     ;; 05:4326 $7B
    add  [hl]                                     ;; 05:4327 $86
    ld   e, a                                     ;; 05:4328 $5F
    ld   hl, hMultiPurpose1                       ;; 05:4329 $21 $D8 $FF
    cp   [hl]                                     ;; 05:432C $BE
    jr   nz, jr_005_42B9                          ;; 05:432D $20 $8A

label_005_432F:
    call GetEntityTransitionCountdown             ;; 05:432F $CD $05 $0C
    ld   [hl], $10                                ;; 05:4332 $36 $10
    ret                                           ;; 05:4334 $C9

label_005_4335:
    ld   a, [wD152]                               ;; 05:4335 $FA $52 $D1
    ld   e, a                                     ;; 05:4338 $5F
    ld   d, b                                     ;; 05:4339 $50
    ld   hl, wEntitiesStatusTable                 ;; 05:433A $21 $80 $C2
    add  hl, de                                   ;; 05:433D $19
    ld   a, [hl]                                  ;; 05:433E $7E
    and  a                                        ;; 05:433F $A7
    ret  z                                        ;; 05:4340 $C8

    ld   hl, wEntitiesPosXTable                   ;; 05:4341 $21 $00 $C2
    add  hl, de                                   ;; 05:4344 $19
    ldh  a, [hActiveEntityPosX]                   ;; 05:4345 $F0 $EE
    sub  [hl]                                     ;; 05:4347 $96
    add  $0E                                      ;; 05:4348 $C6 $0E
    cp   $1A                                      ;; 05:434A $FE $1A
    ret  nc                                       ;; 05:434C $D0

    ld   hl, wEntitiesPosYTable                   ;; 05:434D $21 $10 $C2
    add  hl, de                                   ;; 05:4350 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:4351 $F0 $EC
    sub  [hl]                                     ;; 05:4353 $96
    add  $10                                      ;; 05:4354 $C6 $10
    cp   $20                                      ;; 05:4356 $FE $20
    ret  nc                                       ;; 05:4358 $D0

    ld   hl, wEntitiesTypeTable                   ;; 05:4359 $21 $A0 $C3
    add  hl, de                                   ;; 05:435C $19
    ld   a, [hl]                                  ;; 05:435D $7E
    cp   $3D                                      ;; 05:435E $FE $3D
    jr   nz, .jr_4380                             ;; 05:4360 $20 $1E

    ld   hl, wEntitiesPrivateState4Table          ;; 05:4362 $21 $40 $C4
    add  hl, de                                   ;; 05:4365 $19
    ld   a, [hl]                                  ;; 05:4366 $7E
    and  a                                        ;; 05:4367 $A7
    ret  z                                        ;; 05:4368 $C8

    ld   a, [wDialogState]                        ;; 05:4369 $FA $9F $C1
    and  a                                        ;; 05:436C $A7
    ret  nz                                       ;; 05:436D $C0

    call GetEntityTransitionCountdown             ;; 05:436E $CD $05 $0C
    ld   [hl], b                                  ;; 05:4371 $70
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:4372 $21 $00 $C3
    add  hl, bc                                   ;; 05:4375 $09
    ld   a, [hl]                                  ;; 05:4376 $7E
    and  a                                        ;; 05:4377 $A7
    ret  nz                                       ;; 05:4378 $C0

    ld   [hl], $80                                ;; 05:4379 $36 $80
    jp_open_dialog Dialog115                      ;; 05:437B

.jr_4380
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:4380 $21 $20 $C4
    add  hl, de                                   ;; 05:4383 $19
    ld   a, [hl]                                  ;; 05:4384 $7E
    and  a                                        ;; 05:4385 $A7
    ret  nz                                       ;; 05:4386 $C0

    ld   a, JINGLE_ENEMY_HIT                      ;; 05:4387 $3E $03
    ldh  [hJingle], a                             ;; 05:4389 $E0 $F2
    ld   hl, wEntitiesTypeTable                   ;; 05:438B $21 $A0 $C3
    add  hl, de                                   ;; 05:438E $19
    ld   a, [hl]                                  ;; 05:438F $7E
    cp   $AD                                      ;; 05:4390 $FE $AD
    jr   nz, .jr_43A0                             ;; 05:4392 $20 $0C

    ld   hl, wEntitiesFlashCountdownTable         ;; 05:4394 $21 $20 $C4
    add  hl, de                                   ;; 05:4397 $19
    ld   [hl], $18                                ;; 05:4398 $36 $18
    ld   hl, wEntitiesInertiaTable                ;; 05:439A $21 $D0 $C3
    add  hl, de                                   ;; 05:439D $19
    inc  [hl]                                     ;; 05:439E $34
    ret                                           ;; 05:439F $C9

.jr_43A0
    push bc                                       ;; 05:43A0 $C5
    ld   c, e                                     ;; 05:43A1 $4B
    ld   b, d                                     ;; 05:43A2 $42
    call DidKillEnemy                             ;; 05:43A3 $CD $50 $3F
    pop  bc                                       ;; 05:43A6 $C1
    ret                                           ;; 05:43A7 $C9

func_005_43A8::
    ld   hl, wEntitiesPosXTable                   ;; 05:43A8 $21 $00 $C2
    add  hl, bc                                   ;; 05:43AB $09
    ld   a, [hl]                                  ;; 05:43AC $7E
    ld   [wD100], a                               ;; 05:43AD $EA $00 $D1
    ld   hl, wEntitiesPosYTable                   ;; 05:43B0 $21 $10 $C2
    add  hl, bc                                   ;; 05:43B3 $09
    ld   a, [hl]                                  ;; 05:43B4 $7E
    ld   hl, wEntitiesPosZTable                   ;; 05:43B5 $21 $10 $C3
    add  hl, bc                                   ;; 05:43B8 $09
    sub  [hl]                                     ;; 05:43B9 $96
    ld   [wD110], a                               ;; 05:43BA $EA $10 $D1
    ld   de, wD100                                ;; 05:43BD $11 $00 $D1
    ld   hl, wD101                                ;; 05:43C0 $21 $01 $D1
    push bc                                       ;; 05:43C3 $C5
    ld   c, $05                                   ;; 05:43C4 $0E $05

jr_005_43C6:
    ld   a, [de]                                  ;; 05:43C6 $1A
    sub  [hl]                                     ;; 05:43C7 $96
    add  $07                                      ;; 05:43C8 $C6 $07
    cp   $0E                                      ;; 05:43CA $FE $0E
    jr   c, jr_005_43D8                           ;; 05:43CC $38 $0A

    bit  7, a                                     ;; 05:43CE $CB $7F
    jr   nz, .jr_43D6                             ;; 05:43D0 $20 $04

    inc  [hl]                                     ;; 05:43D2 $34
    inc  [hl]                                     ;; 05:43D3 $34
    inc  [hl]                                     ;; 05:43D4 $34
    inc  [hl]                                     ;; 05:43D5 $34

.jr_43D6
    dec  [hl]                                     ;; 05:43D6 $35
    dec  [hl]                                     ;; 05:43D7 $35

jr_005_43D8:
    inc  hl                                       ;; 05:43D8 $23
    inc  de                                       ;; 05:43D9 $13
    dec  c                                        ;; 05:43DA $0D
    jr   nz, jr_005_43C6                          ;; 05:43DB $20 $E9

    ld   de, wD110                                ;; 05:43DD $11 $10 $D1
    ld   hl, wD111                                ;; 05:43E0 $21 $11 $D1
    ld   c, $05                                   ;; 05:43E3 $0E $05

jr_005_43E5:
    ld   a, [de]                                  ;; 05:43E5 $1A
    sub  [hl]                                     ;; 05:43E6 $96
    add  $07                                      ;; 05:43E7 $C6 $07
    cp   $0E                                      ;; 05:43E9 $FE $0E
    jr   c, jr_005_43F7                           ;; 05:43EB $38 $0A

    bit  7, a                                     ;; 05:43ED $CB $7F
    jr   nz, .jr_43F5                             ;; 05:43EF $20 $04

    inc  [hl]                                     ;; 05:43F1 $34
    inc  [hl]                                     ;; 05:43F2 $34
    inc  [hl]                                     ;; 05:43F3 $34
    inc  [hl]                                     ;; 05:43F4 $34

.jr_43F5
    dec  [hl]                                     ;; 05:43F5 $35
    dec  [hl]                                     ;; 05:43F6 $35

jr_005_43F7:
    inc  hl                                       ;; 05:43F7 $23
    inc  de                                       ;; 05:43F8 $13
    dec  c                                        ;; 05:43F9 $0D
    jr   nz, jr_005_43E5                          ;; 05:43FA $20 $E9

    pop  bc                                       ;; 05:43FC $C1
    ret                                           ;; 05:43FD $C9

func_005_43FE::
    ld   a, [wIsBowWowFollowingLink]              ;; 05:43FE $FA $56 $DB
    and  a                                        ;; 05:4401 $A7
    ret  z                                        ;; 05:4402 $C8

    cp   BOW_WOW_KIDNAPPED                        ;; 05:4403 $FE $80
    ret  z                                        ;; 05:4405 $C8

    ldh  a, [hLinkSpeedY]                         ;; 05:4406 $F0 $9B
    ld   hl, hLinkSpeedX                          ;; 05:4408 $21 $9A $FF
    or   [hl]                                     ;; 05:440B $B6
    ld   hl, hLinkVelocityZ                       ;; 05:440C $21 $A3 $FF
    or   [hl]                                     ;; 05:440F $B6
    jp   z, ret_005_44CA                          ;; 05:4410 $CA $CA $44

    ld   hl, wEntitiesPrivateState1Table          ;; 05:4413 $21 $B0 $C2
    add  hl, bc                                   ;; 05:4416 $09
    ld   a, [hl]                                  ;; 05:4417 $7E
    ld   [wD106], a                               ;; 05:4418 $EA $06 $D1
    ld   hl, wEntitiesPrivateState2Table          ;; 05:441B $21 $C0 $C2
    add  hl, bc                                   ;; 05:441E $09
    ld   a, [hl]                                  ;; 05:441F $7E
    ld   [wD116], a                               ;; 05:4420 $EA $16 $D1
    ld   de, wD106                                ;; 05:4423 $11 $06 $D1
    ld   hl, wD105                                ;; 05:4426 $21 $05 $D1
    push bc                                       ;; 05:4429 $C5
    ld   bc, $06                                  ;; 05:442A $01 $06 $00

jr_005_442D:
    ld   a, [de]                                  ;; 05:442D $1A
    sub  [hl]                                     ;; 05:442E $96
    add  $07                                      ;; 05:442F $C6 $07
    cp   $0E                                      ;; 05:4431 $FE $0E
    jr   c, jr_005_4448                           ;; 05:4433 $38 $13

    bit  7, a                                     ;; 05:4435 $CB $7F
    jr   nz, .jr_443F                             ;; 05:4437 $20 $06

    inc  [hl]                                     ;; 05:4439 $34
    inc  [hl]                                     ;; 05:443A $34
    inc  [hl]                                     ;; 05:443B $34
    inc  [hl]                                     ;; 05:443C $34
    inc  [hl]                                     ;; 05:443D $34
    inc  [hl]                                     ;; 05:443E $34

.jr_443F
    dec  [hl]                                     ;; 05:443F $35
    dec  [hl]                                     ;; 05:4440 $35
    dec  [hl]                                     ;; 05:4441 $35
    ld   a, c                                     ;; 05:4442 $79
    cp   $01                                      ;; 05:4443 $FE $01
    jr   nz, jr_005_4448                          ;; 05:4445 $20 $01

    inc  b                                        ;; 05:4447 $04

jr_005_4448:
    dec  hl                                       ;; 05:4448 $2B
    dec  de                                       ;; 05:4449 $1B
    dec  c                                        ;; 05:444A $0D
    jr   nz, jr_005_442D                          ;; 05:444B $20 $E0

    ld   de, wD116                                ;; 05:444D $11 $16 $D1
    ld   hl, wD115                                ;; 05:4450 $21 $15 $D1
    ld   c, $06                                   ;; 05:4453 $0E $06

jr_005_4455:
    ld   a, [de]                                  ;; 05:4455 $1A
    sub  [hl]                                     ;; 05:4456 $96
    add  $07                                      ;; 05:4457 $C6 $07
    cp   $0E                                      ;; 05:4459 $FE $0E
    jr   c, jr_005_4473                           ;; 05:445B $38 $16

    bit  7, a                                     ;; 05:445D $CB $7F
    jr   nz, .jr_4467                             ;; 05:445F $20 $06

    inc  [hl]                                     ;; 05:4461 $34
    inc  [hl]                                     ;; 05:4462 $34
    inc  [hl]                                     ;; 05:4463 $34
    inc  [hl]                                     ;; 05:4464 $34
    inc  [hl]                                     ;; 05:4465 $34
    inc  [hl]                                     ;; 05:4466 $34

.jr_4467
    dec  [hl]                                     ;; 05:4467 $35
    dec  [hl]                                     ;; 05:4468 $35
    dec  [hl]                                     ;; 05:4469 $35
    ld   a, c                                     ;; 05:446A $79
    cp   $01                                      ;; 05:446B $FE $01
    jr   nz, jr_005_4473                          ;; 05:446D $20 $04

    ld   a, b                                     ;; 05:446F $78
    or   $02                                      ;; 05:4470 $F6 $02
    ld   b, a                                     ;; 05:4472 $47

jr_005_4473:
    dec  hl                                       ;; 05:4473 $2B
    dec  de                                       ;; 05:4474 $1B
    dec  c                                        ;; 05:4475 $0D
    jr   nz, jr_005_4455                          ;; 05:4476 $20 $DD

    ld   a, b                                     ;; 05:4478 $78
    ldh  [hMultiPurpose0], a                      ;; 05:4479 $E0 $D7
    pop  bc                                       ;; 05:447B $C1
    and  $01                                      ;; 05:447C $E6 $01
    jr   z, jr_005_4499                           ;; 05:447E $28 $19

    ld   hl, wD110                                ;; 05:4480 $21 $10 $D1
    ld   e, $06                                   ;; 05:4483 $1E $06

jr_005_4485:
    ld   a, [wD151]                               ;; 05:4485 $FA $51 $D1
    sub  [hl]                                     ;; 05:4488 $96
    jr   z, jr_005_4492                           ;; 05:4489 $28 $07

    bit  7, a                                     ;; 05:448B $CB $7F
    jr   nz, .jr_4491                             ;; 05:448D $20 $02

    inc  [hl]                                     ;; 05:448F $34
    inc  [hl]                                     ;; 05:4490 $34

.jr_4491
    dec  [hl]                                     ;; 05:4491 $35

jr_005_4492:
    inc  hl                                       ;; 05:4492 $23
    dec  e                                        ;; 05:4493 $1D
    jr   nz, jr_005_4485                          ;; 05:4494 $20 $EF

    call func_005_44B5                            ;; 05:4496 $CD $B5 $44

jr_005_4499:
    ldh  a, [hMultiPurpose0]                      ;; 05:4499 $F0 $D7
    and  $02                                      ;; 05:449B $E6 $02
    jr   z, ret_005_44CA                          ;; 05:449D $28 $2B

    ld   hl, wD100                                ;; 05:449F $21 $00 $D1
    ld   e, $06                                   ;; 05:44A2 $1E $06

jr_005_44A4:
    ld   a, [wD150]                               ;; 05:44A4 $FA $50 $D1
    sub  [hl]                                     ;; 05:44A7 $96
    jr   z, jr_005_44B1                           ;; 05:44A8 $28 $07

    bit  7, a                                     ;; 05:44AA $CB $7F
    jr   nz, .jr_44B0                             ;; 05:44AC $20 $02

    inc  [hl]                                     ;; 05:44AE $34
    inc  [hl]                                     ;; 05:44AF $34

.jr_44B0
    dec  [hl]                                     ;; 05:44B0 $35

jr_005_44B1:
    inc  hl                                       ;; 05:44B1 $23
    dec  e                                        ;; 05:44B2 $1D
    jr   nz, jr_005_44A4                          ;; 05:44B3 $20 $EF

func_005_44B5::
    ld   a, [wD110]                               ;; 05:44B5 $FA $10 $D1
    ld   hl, wEntitiesPosZTable                   ;; 05:44B8 $21 $10 $C3
    add  hl, bc                                   ;; 05:44BB $09
    add  [hl]                                     ;; 05:44BC $86
    ld   hl, wEntitiesPosYTable                   ;; 05:44BD $21 $10 $C2
    add  hl, bc                                   ;; 05:44C0 $09
    ld   [hl], a                                  ;; 05:44C1 $77
    ld   a, [wD100]                               ;; 05:44C2 $FA $00 $D1
    ld   hl, wEntitiesPosXTable                   ;; 05:44C5 $21 $00 $C2
    add  hl, bc                                   ;; 05:44C8 $09
    ld   [hl], a                                  ;; 05:44C9 $77

ret_005_44CA:
    ret                                           ;; 05:44CA $C9

func_005_44CB::
    ld   hl, wEntitiesSpeedXTable                 ;; 05:44CB $21 $40 $C2
    add  hl, bc                                   ;; 05:44CE $09
    ld   a, [hl]                                  ;; 05:44CF $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:44D0 $21 $50 $C2
    add  hl, bc                                   ;; 05:44D3 $09
    or   [hl]                                     ;; 05:44D4 $B6
    ret  z                                        ;; 05:44D5 $C8

    ld   hl, wEntitiesSpeedXTable                 ;; 05:44D6 $21 $40 $C2
    add  hl, bc                                   ;; 05:44D9 $09
    ld   a, [hl]                                  ;; 05:44DA $7E
    ld   d, a                                     ;; 05:44DB $57
    bit  7, a                                     ;; 05:44DC $CB $7F
    jr   z, .jr_44E2                              ;; 05:44DE $28 $02

    cpl                                           ;; 05:44E0 $2F
    inc  a                                        ;; 05:44E1 $3C

.jr_44E2
    ld   e, a                                     ;; 05:44E2 $5F
    ld   hl, wEntitiesSpeedYTable                 ;; 05:44E3 $21 $50 $C2
    add  hl, bc                                   ;; 05:44E6 $09
    ld   a, [hl]                                  ;; 05:44E7 $7E
    bit  7, a                                     ;; 05:44E8 $CB $7F
    jr   z, .jr_44EE                              ;; 05:44EA $28 $02

    cpl                                           ;; 05:44EC $2F
    inc  a                                        ;; 05:44ED $3C

.jr_44EE
    cp   e                                        ;; 05:44EE $BB
    jr   nc, jr_005_44FE                          ;; 05:44EF $30 $0D

    bit  7, d                                     ;; 05:44F1 $CB $7A
    jr   nz, .jr_44F9                             ;; 05:44F3 $20 $04

    ld   e, $04                                   ;; 05:44F5 $1E $04
    jr   label_005_4509                           ;; 05:44F7 $18 $10

.jr_44F9
    ld   e, $02                                   ;; 05:44F9 $1E $02
    jp   label_005_4509                           ;; 05:44FB $C3 $09 $45

jr_005_44FE:
    bit  7, [hl]                                  ;; 05:44FE $CB $7E
    jr   z, .jr_4507                              ;; 05:4500 $28 $05

    ld   a, $06                                   ;; 05:4502 $3E $06
    jp   SetEntitySpriteVariant                   ;; 05:4504 $C3 $0C $3B

.jr_4507
    ld   e, $00                                   ;; 05:4507 $1E $00

label_005_4509:
    ldh  a, [hFrameCounter]                       ;; 05:4509 $F0 $E7
    rra                                           ;; 05:450B $1F
    rra                                           ;; 05:450C $1F
    rra                                           ;; 05:450D $1F
    and  $01                                      ;; 05:450E $E6 $01
    add  e                                        ;; 05:4510 $83
    jp   SetEntitySpriteVariant                   ;; 05:4511 $C3 $0C $3B
