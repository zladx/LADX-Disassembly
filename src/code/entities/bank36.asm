; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

;
; Photographer scenes
;

label_036_4000:
    ld   a, [wRoomTransitionState]                ;; 36:4000 $FA $24 $C1
    and  a                                        ;; 36:4003 $A7
    ret  nz                                       ;; 36:4004 $C0

    ldh  a, [hActiveEntityState]                  ;; 36:4005 $F0 $F0
    cp   $04                                      ;; 36:4007 $FE $04
    jr   c, .jr_4011                              ;; 36:4009 $38 $06

    ld   de, Unknown076SpriteVariants             ;; 36:400B $11 $0A $49
    call RenderActiveEntitySpritesPair            ;; 36:400E $CD $C0 $3B

.jr_4011
    call ReturnIfNonInteractive_36                ;; 36:4011 $CD $40 $6A
    ld   a, [wPhotos2]                            ;; 36:4014 $FA $0D $DC
    and  $08                                      ;; 36:4017 $E6 $08
    jp   nz, UnloadEntityAndReturn                ;; 36:4019 $C2 $8D $3F

    ld   a, [wDialogState]                        ;; 36:401C $FA $9F $C1
    and  a                                        ;; 36:401F $A7
    ret  nz                                       ;; 36:4020 $C0

    ldh  a, [hActiveEntityState]                  ;; 36:4021 $F0 $F0
    JP_TABLE                                      ;; 36:4023
._00 dw func_036_403A                             ;; 36:4024
._01 dw func_036_405D                             ;; 36:4026
._02 dw func_036_4077                             ;; 36:4028
._03 dw func_036_409C                             ;; 36:402A
._04 dw func_036_40C5                             ;; 36:402C
._05 dw func_036_40EB                             ;; 36:402E
._06 dw func_036_40F2                             ;; 36:4030
._07 dw func_036_40FD                             ;; 36:4032
._08 dw func_036_4126                             ;; 36:4034
._09 dw func_036_4153                             ;; 36:4036
._0A dw func_036_4161                             ;; 36:4038

func_036_403A::
    ld   a, [wPhotos1]                            ;; 36:403A $FA $0C $DC
    and  $01                                      ;; 36:403D $E6 $01
    call z, UnloadEntity                          ;; 36:403F $CC $8D $3F
    ld   a, [wIsMarinFollowingLink]               ;; 36:4042 $FA $73 $DB
    ld   hl, wIsGhostFollowingLink                ;; 36:4045 $21 $79 $DB
    or   [hl]                                     ;; 36:4048 $B6
    ld   hl, wIsRoosterFollowingLink              ;; 36:4049 $21 $7B $DB
    or   [hl]                                     ;; 36:404C $B6
    call nz, UnloadEntity                         ;; 36:404D $C4 $8D $3F
    call PointHLToEntityPosX                      ;; 36:4050 $CD $23 $6C
    ld   [hl], $E8                                ;; 36:4053 $36 $E8
    call PointHLToEntityPosY                      ;; 36:4055 $CD $28 $6C
    ld   [hl], $4D                                ;; 36:4058 $36 $4D
    jp   IncrementEntityState                     ;; 36:405A $C3 $12 $3B

func_036_405D::
    ld   de, wEntitiesStatusTable                 ;; 36:405D $11 $80 $C2
    ld   hl, wEntitiesTypeTable                   ;; 36:4060 $21 $A0 $C3

jr_036_4063:
    ld   a, [hl+]                                 ;; 36:4063 $2A
    and  a                                        ;; 36:4064 $A7
    jr   z, .jr_406E                              ;; 36:4065 $28 $07

    cp   $FA                                      ;; 36:4067 $FE $FA
    jr   z, .jr_406E                              ;; 36:4069 $28 $03

    ld   a, [de]                                  ;; 36:406B $1A
    and  a                                        ;; 36:406C $A7
    ret  nz                                       ;; 36:406D $C0

.jr_406E
    inc  de                                       ;; 36:406E $13
    ld   a, l                                     ;; 36:406F $7D
    and  $0F                                      ;; 36:4070 $E6 $0F
    jr   nz, jr_036_4063                          ;; 36:4072 $20 $EF

    jp   IncrementEntityState                     ;; 36:4074 $C3 $12 $3B

func_036_4077::
    ldh  a, [hLinkPositionX]                      ;; 36:4077 $F0 $98
    cp   $44                                      ;; 36:4079 $FE $44
    ret  c                                        ;; 36:407B $D8

    cp   $48                                      ;; 36:407C $FE $48
    ret  nc                                       ;; 36:407E $D0

    ldh  a, [hLinkPositionY]                      ;; 36:407F $F0 $99
    cp   $4A                                      ;; 36:4081 $FE $4A
    ret  c                                        ;; 36:4083 $D8

    cp   $51                                      ;; 36:4084 $FE $51
    ret  nc                                       ;; 36:4086 $D0

    xor  a                                        ;; 36:4087 $AF
    ldh  [hAnimatedTilesFrameCount], a            ;; 36:4088 $E0 $A6
    ld   a, $11                                   ;; 36:408A $3E $11
    ldh  [hAnimatedTilesGroup], a                 ;; 36:408C $E0 $A4
    call func_036_4365                            ;; 36:408E $CD $65 $43
    jp   IncrementEntityState                     ;; 36:4091 $C3 $12 $3B

PhotographerPaletteA::
    rgb  #F8F8F8, #000000, #881888, #F858F8

func_036_409C::
    call func_036_4365                            ;; 36:409C $CD $65 $43
    ld   hl, wEntitiesPrivateState1Table          ;; 36:409F $21 $B0 $C2
    add  hl, bc                                   ;; 36:40A2 $09
    inc  [hl]                                     ;; 36:40A3 $34
    ld   a, [hl]                                  ;; 36:40A4 $7E
    and  $07                                      ;; 36:40A5 $E6 $07
    ret  nz                                       ;; 36:40A7 $C0

    ld   [hl], a                                  ;; 36:40A8 $77
    di                                            ;; 36:40A9 $F3
    ld   de, PhotographerPaletteA                 ;; 36:40AA $11 $94 $40
    ld   hl, wObjPal7                             ;; 36:40AD $21 $80 $DC

.loop_40B0
    ld   a, [de]                                  ;; 36:40B0 $1A
    ld   [hl+], a                                 ;; 36:40B1 $22
    inc  de                                       ;; 36:40B2 $13
    ld   a, l                                     ;; 36:40B3 $7D
    and  $07                                      ;; 36:40B4 $E6 $07
    jr   nz, .loop_40B0                           ;; 36:40B6 $20 $F8

    ei                                            ;; 36:40B8 $FB
    ld   a, $02                                   ;; 36:40B9 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 36:40BB $EA $D1 $DD
    ld   a, $0B                                   ;; 36:40BE $3E $0B
    ldh  [hAnimatedTilesGroup], a                 ;; 36:40C0 $E0 $A4
    jp   IncrementEntityState                     ;; 36:40C2 $C3 $12 $3B

func_036_40C5::
    call func_036_4365                            ;; 36:40C5 $CD $65 $43
    call PointHLToEntityPosX                      ;; 36:40C8 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:40CB $7E
    cp   $37                                      ;; 36:40CC $FE $37
    jr   z, jr_036_40DF                           ;; 36:40CE $28 $0F

    inc  [hl]                                     ;; 36:40D0 $34
    ldh  a, [hFrameCounter]                       ;; 36:40D1 $F0 $E7
    and  $07                                      ;; 36:40D3 $E6 $07
    jr   nz, .ret_40DE                            ;; 36:40D5 $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:40D7 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:40DA $7E
    xor  $01                                      ;; 36:40DB $EE $01
    ld   [hl], a                                  ;; 36:40DD $77

.ret_40DE
    ret                                           ;; 36:40DE $C9

jr_036_40DF:
    ld   a, LINK_ANIMATION_STATE_STANDING_LEFT    ;; 36:40DF $3E $06
    ldh  [hLinkAnimationState], a                 ;; 36:40E1 $E0 $9D
    call_open_dialog Dialog2A7                    ;; 36:40E3
    jp   IncrementEntityState                     ;; 36:40E8 $C3 $12 $3B

func_036_40EB::
    call func_036_4365                            ;; 36:40EB $CD $65 $43

    ld_dialog_low a, Dialog2A8 ; "I'll call this one 'Close Call'" ;; 36:40EE $3E $A8
    jr   jr_036_40F7                              ;; 36:40F0 $18 $05

func_036_40F2::
    call func_036_4365                            ;; 36:40F2 $CD $65 $43
    ld_dialog_low a, Dialog2A9 ; "I'm too close"  ;; 36:40F5 $3E $A9

jr_036_40F7:
    call OpenDialogInTable2                       ;; 36:40F7 $CD $7C $23
    jp   IncrementEntityState                     ;; 36:40FA $C3 $12 $3B

func_036_40FD::
    call func_036_4365                            ;; 36:40FD $CD $65 $43
    ldh  a, [hFrameCounter]                       ;; 36:4100 $F0 $E7
    and  $01                                      ;; 36:4102 $E6 $01
    jr   nz, .jr_4117                             ;; 36:4104 $20 $11

    call PointHLToEntityPosX                      ;; 36:4106 $CD $23 $6C
    dec  [hl]                                     ;; 36:4109 $35
    ldh  a, [hFrameCounter]                       ;; 36:410A $F0 $E7
    and  $07                                      ;; 36:410C $E6 $07
    jr   nz, .jr_4117                             ;; 36:410E $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:4110 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4113 $7E
    xor  $01                                      ;; 36:4114 $EE $01
    ld   [hl], a                                  ;; 36:4116 $77

.jr_4117
    ld   hl, wEntitiesPrivateState1Table          ;; 36:4117 $21 $B0 $C2
    add  hl, bc                                   ;; 36:411A $09
    inc  [hl]                                     ;; 36:411B $34
    ld   a, [hl]                                  ;; 36:411C $7E
    cp   $10                                      ;; 36:411D $FE $10
    ret  nz                                       ;; 36:411F $C0

    xor  a                                        ;; 36:4120 $AF
    ld   [hl], a                                  ;; 36:4121 $77
    ld   a, $AA                                   ;; 36:4122 $3E $AA
    jr   jr_036_40F7                              ;; 36:4124 $18 $D1

func_036_4126::
    call func_036_4365                            ;; 36:4126 $CD $65 $43
    ldh  a, [hFrameCounter]                       ;; 36:4129 $F0 $E7
    and  $01                                      ;; 36:412B $E6 $01
    jr   nz, .jr_4144                             ;; 36:412D $20 $15

    call PointHLToEntityPosX                      ;; 36:412F $CD $23 $6C
    dec  [hl]                                     ;; 36:4132 $35
    call PointHLToEntityPosY                      ;; 36:4133 $CD $28 $6C
    inc  [hl]                                     ;; 36:4136 $34
    ldh  a, [hFrameCounter]                       ;; 36:4137 $F0 $E7
    and  $07                                      ;; 36:4139 $E6 $07
    jr   nz, .jr_4144                             ;; 36:413B $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:413D $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4140 $7E
    xor  $01                                      ;; 36:4141 $EE $01
    ld   [hl], a                                  ;; 36:4143 $77

.jr_4144
    ld   hl, wEntitiesPrivateState1Table          ;; 36:4144 $21 $B0 $C2
    add  hl, bc                                   ;; 36:4147 $09
    inc  [hl]                                     ;; 36:4148 $34
    ld   a, [hl]                                  ;; 36:4149 $7E
    cp   $0A                                      ;; 36:414A $FE $0A
    ret  nz                                       ;; 36:414C $C0

    xor  a                                        ;; 36:414D $AF
    ld   [hl], a                                  ;; 36:414E $77
    ld   a, $AB                                   ;; 36:414F $3E $AB
    jr   jr_036_40F7                              ;; 36:4151 $18 $A4

func_036_4153::
    call func_036_4365                            ;; 36:4153 $CD $65 $43
    call PointHLToEntityPosY                      ;; 36:4156 $CD $28 $6C
    inc  [hl]                                     ;; 36:4159 $34
    ld   a, [hl]                                  ;; 36:415A $7E
    cp   $70                                      ;; 36:415B $FE $70
    ret  c                                        ;; 36:415D $D8

    jp   IncrementEntityState                     ;; 36:415E $C3 $12 $3B

func_036_4161::
    call func_036_4365                            ;; 36:4161 $CD $65 $43
    ld   a, NOISE_SFX_PHOTO                       ;; 36:4164 $3E $40
    ldh  [hNoiseSfx], a                           ;; 36:4166 $E0 $F4
    ld   a, GAMEPLAY_PHOTO_BRIDGE                 ;; 36:4168 $3E $1A
    ld   [wGameplayType], a                       ;; 36:416A $EA $95 $DB
    xor  a                                        ;; 36:416D $AF
    ld   [wTransitionSequenceCounter], a          ;; 36:416E $EA $6B $C1
    ld   [wC16C], a                               ;; 36:4171 $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 36:4174 $EA $96 $DB
    ret                                           ;; 36:4177 $C9

label_036_4178:
    ld   de, Unknown074SpriteVariants             ;; 36:4178 $11 $F2 $48
    call RenderActiveEntitySpritesPair            ;; 36:417B $CD $C0 $3B
    call PushLinkOutOfEntity_36                   ;; 36:417E $CD $5C $6B
    call ReturnIfNonInteractive_36.allowInactiveEntity ;; 36:4181 $CD $46 $6A
    ldh  a, [hActiveEntityState]                  ;; 36:4184 $F0 $F0
    and  a                                        ;; 36:4186 $A7
    jr   z, .jr_41A0                              ;; 36:4187 $28 $17

    ld   a, [wTransitionSequenceCounter]          ;; 36:4189 $FA $6B $C1
    and  a                                        ;; 36:418C $A7
    jr   nz, .jr_41A0                             ;; 36:418D $20 $11

    ld   a, [wGameplayType]                       ;; 36:418F $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 36:4192 $FE $0B
    jr   nz, .jr_41A0                             ;; 36:4194 $20 $0A

    ld   a, [wLinkMotionState]                    ;; 36:4196 $FA $1C $C1
    cp   LINK_MOTION_MAP_FADE_OUT                 ;; 36:4199 $FE $03
    jr   z, .jr_41A0                              ;; 36:419B $28 $03

    call func_036_41B2                            ;; 36:419D $CD $B2 $41

.jr_41A0
    ld   a, [wDialogState]                        ;; 36:41A0 $FA $9F $C1
    and  a                                        ;; 36:41A3 $A7
    ret  nz                                       ;; 36:41A4 $C0

    ldh  a, [hActiveEntityState]                  ;; 36:41A5 $F0 $F0
    JP_TABLE                                      ;; 36:41A7
._00 dw func_036_41DF                             ;; 36:41A8
._01 dw func_036_4221                             ;; 36:41AA
._02 dw func_036_424D                             ;; 36:41AC
._03 dw func_036_4254                             ;; 36:41AE
._04 dw func_036_4264                             ;; 36:41B0

func_036_41B2::
    push bc                                       ;; 36:41B2 $C5
    call LCDOff                                   ;; 36:41B3 $CD $CF $28
    ld   a, $38                                   ;; 36:41B6 $3E $38
    ld   b, $41                                   ;; 36:41B8 $06 $41
    ld   c, $07                                   ;; 36:41BA $0E $07
    ld   h, $36                                   ;; 36:41BC $26 $36
    call CopyDataToVRAM                           ;; 36:41BE $CD $13 $0A
    ld   a, [wLCDControl]                         ;; 36:41C1 $FA $FD $D6
    ldh  [rLCDC], a                               ;; 36:41C4 $E0 $40
    pop  bc                                       ;; 36:41C6 $C1
    di                                            ;; 36:41C7 $F3
    ld   de, PhotographerPaletteA                 ;; 36:41C8 $11 $94 $40
    ld   hl, wObjPal7                             ;; 36:41CB $21 $80 $DC
    ld   a, $02                                   ;; 36:41CE $3E $02
    ldh  [rSVBK], a                               ;; 36:41D0 $E0 $70

.loop_41D2
    ld   a, [de]                                  ;; 36:41D2 $1A
    ld   [hl+], a                                 ;; 36:41D3 $22
    inc  de                                       ;; 36:41D4 $13
    ld   a, l                                     ;; 36:41D5 $7D
    and  $07                                      ;; 36:41D6 $E6 $07
    jr   nz, .loop_41D2                           ;; 36:41D8 $20 $F8

    xor  a                                        ;; 36:41DA $AF
    ldh  [rSVBK], a                               ;; 36:41DB $E0 $70
    ei                                            ;; 36:41DD $FB
    ret                                           ;; 36:41DE $C9

func_036_41DF::
    ld   a, $70                                   ;; 36:41DF $3E $70
    ldh  [hLinkPositionZ], a                      ;; 36:41E1 $E0 $A2
    ld   a, $02                                   ;; 36:41E3 $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 36:41E5 $EA $46 $C1
    ld   a, $E0                                   ;; 36:41E8 $3E $E0
    ldh  [hLinkPositionZModified], a              ;; 36:41EA $E0 $B3
    ld   [wC145], a                               ;; 36:41EC $EA $45 $C1
    ld   a, $01                                   ;; 36:41EF $3E $01
    ld   [wD475], a                               ;; 36:41F1 $EA $75 $D4
    ld   a, [wIsMarinFollowingLink]               ;; 36:41F4 $FA $73 $DB
    and  a                                        ;; 36:41F7 $A7
    jr   z, label_036_4217                        ;; 36:41F8 $28 $1D

    ld   a, $70                                   ;; 36:41FA $3E $70
    ld   hl, wLinkPositionZHistory                ;; 36:41FC $21 $95 $D1
    ld   e, $10                                   ;; 36:41FF $1E $10

.loop_4201
    ld   [hl+], a                                 ;; 36:4201 $22
    dec  e                                        ;; 36:4202 $1D
    jr   nz, .loop_4201                           ;; 36:4203 $20 $FC

    ld   [wEntitiesPosZTable+15], a               ;; 36:4205 $EA $1F $C3
    ld   a, [wPhotos1]                            ;; 36:4208 $FA $0C $DC
    and  $01                                      ;; 36:420B $E6 $01
    jp   z, label_036_4217                        ;; 36:420D $CA $17 $42

    ld   a, [wPhotos1]                            ;; 36:4210 $FA $0C $DC
    and  $04                                      ;; 36:4213 $E6 $04
    jr   z, jr_036_421B                           ;; 36:4215 $28 $04

label_036_4217:
    call UnloadEntity                             ;; 36:4217 $CD $8D $3F
    ret                                           ;; 36:421A $C9

jr_036_421B:
    call func_036_41B2                            ;; 36:421B $CD $B2 $41
    jp   IncrementEntityState                     ;; 36:421E $C3 $12 $3B

func_036_4221::
    push bc                                       ;; 36:4221 $C5
    sla  c                                        ;; 36:4222 $CB $21
    rl   b                                        ;; 36:4224 $CB $10
    sla  c                                        ;; 36:4226 $CB $21
    rl   b                                        ;; 36:4228 $CB $10
    ld   hl, wEntitiesHitboxPositionTable         ;; 36:422A $21 $80 $D5
    add  hl, bc                                   ;; 36:422D $09
    inc  hl                                       ;; 36:422E $23
    ld   [hl], $08                                ;; 36:422F $36 $08
    inc  hl                                       ;; 36:4231 $23
    inc  hl                                       ;; 36:4232 $23
    ld   [hl], $0C                                ;; 36:4233 $36 $0C
    pop  bc                                       ;; 36:4235 $C1
    ldh  a, [hLinkAnimationState]                 ;; 36:4236 $F0 $9D
    cp   LINK_ANIMATION_STATE_UNKNOWN_6A          ;; 36:4238 $FE $6A
    ret  nz                                       ;; 36:423A $C0

    ld   a, $02                                   ;; 36:423B $3E $02
    ld   [wC167], a                               ;; 36:423D $EA $67 $C1
    ld   a, [wScreenShakeCountdown]               ;; 36:4240 $FA $57 $C1
    and  a                                        ;; 36:4243 $A7
    ret  nz                                       ;; 36:4244 $C0

    call_open_dialog Dialog2A6                    ;; 36:4245
    jp   IncrementEntityState                     ;; 36:424A $C3 $12 $3B

func_036_424D::
    ld   hl, wEntitiesPrivateCountdown2Table+15   ;; 36:424D $21 $0F $C3
    inc  [hl]                                     ;; 36:4250 $34
    jp   func_036_467F                            ;; 36:4251 $C3 $7F $46

func_036_4254::
    ldh  a, [hLinkAnimationState]                 ;; 36:4254 $F0 $9D
    cp   LINK_ANIMATION_STATE_UNKNOWN_6A          ;; 36:4256 $FE $6A
    ret  z                                        ;; 36:4258 $C8

    ld   a, [wPhotos1]                            ;; 36:4259 $FA $0C $DC
    or   $04                                      ;; 36:425C $F6 $04
    ld   [wPhotos1], a                            ;; 36:425E $EA $0C $DC
    jp   IncrementEntityState                     ;; 36:4261 $C3 $12 $3B

func_036_4264::
    call PointHLToEntityPosY                      ;; 36:4264 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:4267 $7E
    cp   $3B                                      ;; 36:4268 $FE $3B
    jr   c, .jr_427A                              ;; 36:426A $38 $0E

    dec  [hl]                                     ;; 36:426C $35
    ldh  a, [hFrameCounter]                       ;; 36:426D $F0 $E7
    and  $07                                      ;; 36:426F $E6 $07
    ret  nz                                       ;; 36:4271 $C0

    call PointHLToEntitySpriteVariant             ;; 36:4272 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4275 $7E
    xor  $01                                      ;; 36:4276 $EE $01
    ld   [hl], a                                  ;; 36:4278 $77
    ret                                           ;; 36:4279 $C9

.jr_427A
    xor  a                                        ;; 36:427A $AF
    ld   [wC167], a                               ;; 36:427B $EA $67 $C1
    call UnloadEntity                             ;; 36:427E $CD $8D $3F
    ret                                           ;; 36:4281 $C9

Data_036_4282::
    db   $00, $00, $50, $07, $00, $08, $52, $07, $00, $10, $54, $07, $10, $00, $56, $07
    db   $10, $08, $5C, $07, $10, $10, $5E, $07

label_036_429A:
    call PointHLToEntityPosX                      ;; 36:429A $CD $23 $6C
    ld   a, [hl]                                  ;; 36:429D $7E
    cp   $20                                      ;; 36:429E $FE $20
    jr   nc, .jr_42D4                             ;; 36:42A0 $30 $32

    ld   [hl], $14                                ;; 36:42A2 $36 $14
    call PointHLToEntityPosY                      ;; 36:42A4 $CD $28 $6C
    ld   [hl], $64                                ;; 36:42A7 $36 $64
    push bc                                       ;; 36:42A9 $C5
    sla  c                                        ;; 36:42AA $CB $21
    rl   b                                        ;; 36:42AC $CB $10
    sla  c                                        ;; 36:42AE $CB $21
    rl   b                                        ;; 36:42B0 $CB $10
    ld   hl, wEntitiesHitboxPositionTable         ;; 36:42B2 $21 $80 $D5
    add  hl, bc                                   ;; 36:42B5 $09
    inc  hl                                       ;; 36:42B6 $23
    ld   [hl], $10                                ;; 36:42B7 $36 $10
    inc  hl                                       ;; 36:42B9 $23
    ld   [hl], $07                                ;; 36:42BA $36 $07
    inc  hl                                       ;; 36:42BC $23
    ld   [hl], $0B                                ;; 36:42BD $36 $0B
    pop  bc                                       ;; 36:42BF $C1
    ld   hl, Data_036_4282                        ;; 36:42C0 $21 $82 $42
    ld   c, $06                                   ;; 36:42C3 $0E $06
    call RenderActiveEntitySpritesRect            ;; 36:42C5 $CD $E6 $3C
    ld   a, $06                                   ;; 36:42C8 $3E $06
    call func_015_7964_trampoline                 ;; 36:42CA $CD $A0 $3D
    call PushLinkOutOfEntity_36                   ;; 36:42CD $CD $5C $6B
    call CheckLinkCollisionWithEnemy_trampoline   ;; 36:42D0 $CD $5A $3B
    ret                                           ;; 36:42D3 $C9

.jr_42D4
    call PointHLToEntitySpriteVariant             ;; 36:42D4 $CD $02 $6C
    ld   a, [hl+]                                 ;; 36:42D7 $2A
    sla  a                                        ;; 36:42D8 $CB $27
    ld   e, a                                     ;; 36:42DA $5F
    ld   d, $00                                   ;; 36:42DB $16 $00
    ld   hl, Data_036_48C2                        ;; 36:42DD $21 $C2 $48
    call func_036_6C7E                            ;; 36:42E0 $CD $7E $6C
    ld   c, $03                                   ;; 36:42E3 $0E $03
    call RenderActiveEntitySpritesRect            ;; 36:42E5 $CD $E6 $3C
    ld   a, $03                                   ;; 36:42E8 $3E $03
    call func_015_7964_trampoline                 ;; 36:42EA $CD $A0 $3D
    call PushLinkOutOfEntity_36                   ;; 36:42ED $CD $5C $6B
    call CheckLinkCollisionWithEnemy_trampoline   ;; 36:42F0 $CD $5A $3B
    call ReturnIfNonInteractive_36.allowInactiveEntity ;; 36:42F3 $CD $46 $6A
    ldh  a, [hActiveEntityState]                  ;; 36:42F6 $F0 $F0
    and  a                                        ;; 36:42F8 $A7
    jr   z, jr_036_4329                           ;; 36:42F9 $28 $2E

    ld   a, [wTransitionSequenceCounter]          ;; 36:42FB $FA $6B $C1
    and  a                                        ;; 36:42FE $A7
    jr   nz, jr_036_4329                          ;; 36:42FF $20 $28

    ld   a, [wGameplayType]                       ;; 36:4301 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 36:4304 $FE $0B
    jr   nz, jr_036_4329                          ;; 36:4306 $20 $21

    ld   a, [wLinkMotionState]                    ;; 36:4308 $FA $1C $C1
    cp   LINK_MOTION_MAP_FADE_OUT                 ;; 36:430B $FE $03
    jr   z, jr_036_4329                           ;; 36:430D $28 $1A

    call func_036_436D                            ;; 36:430F $CD $6D $43
    ld   a, [wPhotos1]                            ;; 36:4312 $FA $0C $DC
    and  $01                                      ;; 36:4315 $E6 $01
    jr   z, jr_036_4329                           ;; 36:4317 $28 $10

    ld   hl, wEntitiesTypeTable                   ;; 36:4319 $21 $A0 $C3

.loop_431C
    ld   a, [hl+]                                 ;; 36:431C $2A
    cp   $DD                                      ;; 36:431D $FE $DD
    jr   z, jr_036_4329                           ;; 36:431F $28 $08

    ld   a, l                                     ;; 36:4321 $7D
    and  $0F                                      ;; 36:4322 $E6 $0F
    jr   nz, .loop_431C                           ;; 36:4324 $20 $F6

    call func_036_471E                            ;; 36:4326 $CD $1E $47

jr_036_4329:
    ld   a, [wDialogState]                        ;; 36:4329 $FA $9F $C1
    and  a                                        ;; 36:432C $A7
    ret  nz                                       ;; 36:432D $C0

    ld   a, [wPhotos1]                            ;; 36:432E $FA $0C $DC
    and  $01                                      ;; 36:4331 $E6 $01
    jr   z, .jr_433C                              ;; 36:4333 $28 $07

    ld   a, $12                                   ;; 36:4335 $3E $12
    ldh  [hActiveEntityState], a                  ;; 36:4337 $E0 $F0
    call SetEntityState                           ;; 36:4339 $CD $07 $6C

.jr_433C
    ldh  a, [hActiveEntityState]                  ;; 36:433C $F0 $F0
    JP_TABLE                                      ;; 36:433E
._00 dw func_036_43B7                             ;; 36:433F
._01 dw func_036_43BD                             ;; 36:4341
._02 dw func_036_43F3                             ;; 36:4343
._03 dw func_036_441C                             ;; 36:4345
._04 dw func_036_4471                             ;; 36:4347
._05 dw func_036_44A4                             ;; 36:4349
._06 dw func_036_44B3                             ;; 36:434B
._07 dw func_036_44C2                             ;; 36:434D
._08 dw func_036_44FC                             ;; 36:434F
._09 dw func_036_4557                             ;; 36:4351
._0A dw func_036_4589                             ;; 36:4353
._0B dw func_036_462B                             ;; 36:4355
._0C dw func_036_467F                             ;; 36:4357
._0D dw func_036_46CA                             ;; 36:4359
._0E dw func_036_46D9                             ;; 36:435B
._0F dw func_036_46F9                             ;; 36:435D
._10 dw func_036_4730                             ;; 36:435F
._11 dw func_036_4742                             ;; 36:4361
._12 dw func_036_4764                             ;; 36:4363

func_036_4365::
    ld   a, $02                                   ;; 36:4365 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:4367 $E0 $A1
    ld   [wC167], a                               ;; 36:4369 $EA $67 $C1
    ret                                           ;; 36:436C $C9

func_036_436D::
    push bc                                       ;; 36:436D $C5
    call LCDOff                                   ;; 36:436E $CD $CF $28
    ld   a, $38                                   ;; 36:4371 $3E $38
    ld   b, $40                                   ;; 36:4373 $06 $40
    ld   c, $06                                   ;; 36:4375 $0E $06
    ld   h, $36                                   ;; 36:4377 $26 $36
    call CopyDataToVRAM                           ;; 36:4379 $CD $13 $0A
    ld   a, $38                                   ;; 36:437C $3E $38
    ld   b, $41                                   ;; 36:437E $06 $41
    ld   c, $07                                   ;; 36:4380 $0E $07
    ld   h, $36                                   ;; 36:4382 $26 $36
    call CopyDataToVRAM                           ;; 36:4384 $CD $13 $0A
    ld   a, $35                                   ;; 36:4387 $3E $35
    ld   b, $66                                   ;; 36:4389 $06 $66
    ld   c, $05                                   ;; 36:438B $0E $05
    ld   h, $36                                   ;; 36:438D $26 $36
    call CopyDataToVRAM                           ;; 36:438F $CD $13 $0A
    ld   a, [wIsMarinFollowingLink]               ;; 36:4392 $FA $73 $DB
    ld   hl, wIsBowWowFollowingLink               ;; 36:4395 $21 $56 $DB
    or   [hl]                                     ;; 36:4398 $B6
    ld   hl, wIsGhostFollowingLink                ;; 36:4399 $21 $79 $DB
    or   [hl]                                     ;; 36:439C $B6
    ld   hl, wIsRoosterFollowingLink              ;; 36:439D $21 $7B $DB
    or   [hl]                                     ;; 36:43A0 $B6
    and  LOW(~BOW_WOW_KIDNAPPED)                  ;; 36:43A1 $E6 $7F
    jr   nz, .jr_43B0                             ;; 36:43A3 $20 $0B

    ld   a, $38                                   ;; 36:43A5 $3E $38
    ld   b, $42                                   ;; 36:43A7 $06 $42
    ld   c, $04                                   ;; 36:43A9 $0E $04
    ld   h, $36                                   ;; 36:43AB $26 $36
    call CopyDataToVRAM                           ;; 36:43AD $CD $13 $0A

.jr_43B0
    ld   a, [wLCDControl]                         ;; 36:43B0 $FA $FD $D6
    ldh  [rLCDC], a                               ;; 36:43B3 $E0 $40
    pop  bc                                       ;; 36:43B5 $C1
    ret                                           ;; 36:43B6 $C9

func_036_43B7::
    call func_036_436D                            ;; 36:43B7 $CD $6D $43
    jp   IncrementEntityState                     ;; 36:43BA $C3 $12 $3B

func_036_43BD::
    ld   a, [wGameplayType]                       ;; 36:43BD $FA $95 $DB
    cp   GAMEPLAY_FILE_SAVE                       ;; 36:43C0 $FE $06
    ret  z                                        ;; 36:43C2 $C8

    call func_036_6A98                            ;; 36:43C3 $CD $98 $6A
    ret  nc                                       ;; 36:43C6 $D0

    call func_036_6B8A                            ;; 36:43C7 $CD $8A $6B
    ld   a, e                                     ;; 36:43CA $7B
    and  a                                        ;; 36:43CB $A7
    ret  z                                        ;; 36:43CC $C8

    ld   a, [wIsMarinFollowingLink]               ;; 36:43CD $FA $73 $DB
    ld   hl, wIsBowWowFollowingLink               ;; 36:43D0 $21 $56 $DB
    or   [hl]                                     ;; 36:43D3 $B6
    ld   hl, wIsGhostFollowingLink                ;; 36:43D4 $21 $79 $DB
    or   [hl]                                     ;; 36:43D7 $B6
    ld   hl, wIsRoosterFollowingLink              ;; 36:43D8 $21 $7B $DB
    or   [hl]                                     ;; 36:43DB $B6
    and  LOW(~BOW_WOW_KIDNAPPED)                  ;; 36:43DC $E6 $7F
    jr   z, .jr_43E6                              ;; 36:43DE $28 $06

    call_open_dialog Dialog2AD                    ;; 36:43E0
    ret                                           ;; 36:43E5 $C9

.jr_43E6
    ld   a, $02                                   ;; 36:43E6 $3E $02
    ld   [wC167], a                               ;; 36:43E8 $EA $67 $C1
    call_open_dialog Dialog10C                    ;; 36:43EB
    jp   IncrementEntityState                     ;; 36:43F0 $C3 $12 $3B

func_036_43F3::
    ld   a, [wDialogAskSelectionIndex]            ;; 36:43F3 $FA $77 $C1
    and  a                                        ;; 36:43F6 $A7
    jr   nz, .jr_4405                             ;; 36:43F7 $20 $0C

    xor  a                                        ;; 36:43F9 $AF
    ld   [wC167], a                               ;; 36:43FA $EA $67 $C1
    call_open_dialog Dialog10D                    ;; 36:43FD
    jp   IncrementEntityState                     ;; 36:4402 $C3 $12 $3B

.jr_4405
    call func_036_4365                            ;; 36:4405 $CD $65 $43
    call_open_dialog Dialog294                    ;; 36:4408
    call PointHLToEntityPosX                      ;; 36:440D $CD $23 $6C
    ld   a, [hl]                                  ;; 36:4410 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 36:4411 $21 $C0 $C2
    add  hl, bc                                   ;; 36:4414 $09
    ld   [hl], a                                  ;; 36:4415 $77
    ld   a, $07                                   ;; 36:4416 $3E $07
    call SetEntityState                           ;; 36:4418 $CD $07 $6C
    ret                                           ;; 36:441B $C9

func_036_441C::
    xor  a                                        ;; 36:441C $AF
    ld   [wC167], a                               ;; 36:441D $EA $67 $C1
    call func_036_6A98                            ;; 36:4420 $CD $98 $6A
    jr   nc, .jr_4429                             ;; 36:4423 $30 $04

    ld_dialog_low a, Dialog10D ; "stand in front of the screen" ;; 36:4425 $3E $0D
    jr   jr_036_4440                              ;; 36:4427 $18 $17

.jr_4429
    ldh  a, [hLinkPositionY]                      ;; 36:4429 $F0 $99
    cp   $78                                      ;; 36:442B $FE $78
    jr   c, jr_036_4444                           ;; 36:442D $38 $15

    call ResetPegasusBoots                        ;; 36:442F $CD $B6 $0C
    ld   a, $77                                   ;; 36:4432 $3E $77
    ldh  [hLinkPositionY], a                      ;; 36:4434 $E0 $99
    ld   [wMapEntrancePositionY], a               ;; 36:4436 $EA $9E $DB
    ld   a, [wIsLinkInTheAir]                     ;; 36:4439 $FA $46 $C1
    and  a                                        ;; 36:443C $A7
    ret  nz                                       ;; 36:443D $C0

    ld_dialog_low a, Dialog10E ; "go back!"       ;; 36:443E $3E $0E

jr_036_4440:
    call OpenDialogInTable1                       ;; 36:4440 $CD $73 $23
    ret                                           ;; 36:4443 $C9

jr_036_4444:
    cp   $23                                      ;; 36:4444 $FE $23
    ret  nc                                       ;; 36:4446 $D0

    ldh  a, [hLinkPositionX]                      ;; 36:4447 $F0 $98
    cp   $4E                                      ;; 36:4449 $FE $4E
    ret  c                                        ;; 36:444B $D8

    cp   $53                                      ;; 36:444C $FE $53
    ret  nc                                       ;; 36:444E $D0

    ldh  a, [hLinkDirection]                      ;; 36:444F $F0 $9E
    cp   $03                                      ;; 36:4451 $FE $03
    ret  nz                                       ;; 36:4453 $C0

    ldh  a, [hLinkAnimationState]                 ;; 36:4454 $F0 $9D
    and  a                                        ;; 36:4456 $A7
    jr   z, .jr_4466                              ;; 36:4457 $28 $0D

    cp   $01                                      ;; 36:4459 $FE $01
    jr   z, .jr_4466                              ;; 36:445B $28 $09

    cp   $22                                      ;; 36:445D $FE $22
    jr   z, .jr_4466                              ;; 36:445F $28 $05

    cp   $23                                      ;; 36:4461 $FE $23
    jr   z, .jr_4466                              ;; 36:4463 $28 $01

    ret                                           ;; 36:4465 $C9

.jr_4466
    ld   a, [wC16E]                               ;; 36:4466 $FA $6E $C1
    and  a                                        ;; 36:4469 $A7
    ret  nz                                       ;; 36:446A $C0

    call func_036_4365                            ;; 36:446B $CD $65 $43
    jp   IncrementEntityState                     ;; 36:446E $C3 $12 $3B

func_036_4471::
    call func_036_4365                            ;; 36:4471 $CD $65 $43
    ldh  a, [hFrameCounter]                       ;; 36:4474 $F0 $E7
    and  $07                                      ;; 36:4476 $E6 $07
    jr   nz, .jr_4481                             ;; 36:4478 $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:447A $CD $02 $6C
    ld   a, [hl]                                  ;; 36:447D $7E
    xor  $01                                      ;; 36:447E $EE $01
    ld   [hl], a                                  ;; 36:4480 $77

.jr_4481
    call PointHLToEntityPosX                      ;; 36:4481 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:4484 $7E
    cp   $50                                      ;; 36:4485 $FE $50
    jr   c, .jr_448B                              ;; 36:4487 $38 $02

    dec  [hl]                                     ;; 36:4489 $35
    ret                                           ;; 36:448A $C9

.jr_448B
    call PointHLToEntitySpriteVariant             ;; 36:448B $CD $02 $6C
    ld   a, [hl]                                  ;; 36:448E $7E
    or   $02                                      ;; 36:448F $F6 $02
    ld   [hl], a                                  ;; 36:4491 $77
    call PointHLToEntityPosY                      ;; 36:4492 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:4495 $7E
    cp   $38                                      ;; 36:4496 $FE $38
    jr   c, .jr_449C                              ;; 36:4498 $38 $02

    dec  [hl]                                     ;; 36:449A $35
    ret                                           ;; 36:449B $C9

.jr_449C
    call GetEntityTransitionCountdown             ;; 36:449C $CD $05 $0C
    ld   [hl], $40                                ;; 36:449F $36 $40
    jp   IncrementEntityState                     ;; 36:44A1 $C3 $12 $3B

func_036_44A4::
    call func_036_4365                            ;; 36:44A4 $CD $65 $43
    call GetEntityTransitionCountdown             ;; 36:44A7 $CD $05 $0C
    ret  nz                                       ;; 36:44AA $C0

    call_open_dialog Dialog10F                    ;; 36:44AB
    jp   IncrementEntityState                     ;; 36:44B0 $C3 $12 $3B

func_036_44B3::
    call func_036_4365                            ;; 36:44B3 $CD $65 $43
    ld   a, $0C                                   ;; 36:44B6 $3E $0C
    call SetEntityState                           ;; 36:44B8 $CD $07 $6C
    ld   hl, wEntitiesPrivateState1Table          ;; 36:44BB $21 $B0 $C2
    add  hl, bc                                   ;; 36:44BE $09
    xor  a                                        ;; 36:44BF $AF
    ld   [hl], a                                  ;; 36:44C0 $77
    ret                                           ;; 36:44C1 $C9

func_036_44C2::
    call func_036_4365                            ;; 36:44C2 $CD $65 $43
    ld   a, [wDialogAskSelectionIndex]            ;; 36:44C5 $FA $77 $C1
    and  a                                        ;; 36:44C8 $A7
    jr   nz, .jr_44DA                             ;; 36:44C9 $20 $0F

    xor  a                                        ;; 36:44CB $AF
    ld   [wC167], a                               ;; 36:44CC $EA $67 $C1
    call_open_dialog Dialog10D                    ;; 36:44CF
    call IncrementEntityState                     ;; 36:44D4 $CD $12 $3B
    ld   [hl], $03                                ;; 36:44D7 $36 $03
    ret                                           ;; 36:44D9 $C9

.jr_44DA
    ld   hl, wEntitiesPrivateState2Table          ;; 36:44DA $21 $C0 $C2
    add  hl, bc                                   ;; 36:44DD $09
    ld   a, [hl]                                  ;; 36:44DE $7E
    sub  $10                                      ;; 36:44DF $D6 $10
    ld   [hl], a                                  ;; 36:44E1 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 36:44E2 $21 $B0 $C2
    add  hl, bc                                   ;; 36:44E5 $09
    inc  [hl]                                     ;; 36:44E6 $34
    ld   a, [hl]                                  ;; 36:44E7 $7E
    cp   $01                                      ;; 36:44E8 $FE $01
    jp   z, IncrementEntityState                  ;; 36:44EA $CA $12 $3B

    cp   $05                                      ;; 36:44ED $FE $05
    jr   nz, .jr_44F6                             ;; 36:44EF $20 $05

    call_open_dialog Dialog296                    ;; 36:44F1

.jr_44F6
    call IncrementEntityState                     ;; 36:44F6 $CD $12 $3B
    ld   [hl], $09                                ;; 36:44F9 $36 $09
    ret                                           ;; 36:44FB $C9

func_036_44FC::
    call func_036_4365                            ;; 36:44FC $CD $65 $43
    ld   hl, wEntitiesPrivateState2Table          ;; 36:44FF $21 $C0 $C2
    add  hl, bc                                   ;; 36:4502 $09
    ld   a, [hl]                                  ;; 36:4503 $7E
    call PointHLToEntityPosX                      ;; 36:4504 $CD $23 $6C
    cp   [hl]                                     ;; 36:4507 $BE
    jr   z, jr_036_452D                           ;; 36:4508 $28 $23

    ldh  a, [hFrameCounter]                       ;; 36:450A $F0 $E7
    and  $07                                      ;; 36:450C $E6 $07
    jr   nz, .jr_4517                             ;; 36:450E $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:4510 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4513 $7E
    xor  $01                                      ;; 36:4514 $EE $01
    ld   [hl], a                                  ;; 36:4516 $77

.jr_4517
    ld   a, $08                                   ;; 36:4517 $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 36:4519 $CD $AA $3B
    call UpdateEntityPosWithSpeed_36              ;; 36:451C $CD $62 $6A
    call func_036_6B8A                            ;; 36:451F $CD $8A $6B
    cp   $0C                                      ;; 36:4522 $FE $0C
    jr   nc, jr_036_452D                          ;; 36:4524 $30 $07

    ld   hl, wEntitiesPrivateState3Table          ;; 36:4526 $21 $D0 $C2
    add  hl, bc                                   ;; 36:4529 $09
    ld   a, $E2                                   ;; 36:452A $3E $E2
    ld   [hl], a                                  ;; 36:452C $77

jr_036_452D:
    ld   hl, wEntitiesPrivateState3Table          ;; 36:452D $21 $D0 $C2
    add  hl, bc                                   ;; 36:4530 $09
    ld   a, [hl]                                  ;; 36:4531 $7E
    and  a                                        ;; 36:4532 $A7
    jr   z, .jr_4542                              ;; 36:4533 $28 $0D

    inc  [hl]                                     ;; 36:4535 $34
    ld   a, [hl]                                  ;; 36:4536 $7E
    ldh  [hLinkSpeedX], a                         ;; 36:4537 $E0 $9A
    push bc                                       ;; 36:4539 $C5
    call UpdateFinalLinkPosition                  ;; 36:453A $CD $A8 $21
    call CheckPositionForMapTransition_trampoline ;; 36:453D $CD $19 $3E
    pop  bc                                       ;; 36:4540 $C1
    ret                                           ;; 36:4541 $C9

.jr_4542
    ld   hl, wEntitiesPrivateState2Table          ;; 36:4542 $21 $C0 $C2
    add  hl, bc                                   ;; 36:4545 $09
    ld   a, [hl]                                  ;; 36:4546 $7E
    call PointHLToEntityPosX                      ;; 36:4547 $CD $23 $6C
    cp   [hl]                                     ;; 36:454A $BE
    ret  nz                                       ;; 36:454B $C0

    call_open_dialog Dialog294                    ;; 36:454C
    ld   a, $07                                   ;; 36:4551 $3E $07
    call SetEntityState                           ;; 36:4553 $CD $07 $6C
    ret                                           ;; 36:4556 $C9

func_036_4557::
    call func_036_4365                            ;; 36:4557 $CD $65 $43
    ldh  a, [hFrameCounter]                       ;; 36:455A $F0 $E7
    and  $07                                      ;; 36:455C $E6 $07
    jr   nz, .jr_4567                             ;; 36:455E $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:4560 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4563 $7E
    xor  $01                                      ;; 36:4564 $EE $01
    ld   [hl], a                                  ;; 36:4566 $77

.jr_4567
    ldh  a, [hFrameCounter]                       ;; 36:4567 $F0 $E7
    and  $01                                      ;; 36:4569 $E6 $01
    ret  nz                                       ;; 36:456B $C0

    call PointHLToEntityPosX                      ;; 36:456C $CD $23 $6C
    ld   a, [hl]                                  ;; 36:456F $7E
    cp   $50                                      ;; 36:4570 $FE $50
    jr   nc, .jr_457C                             ;; 36:4572 $30 $08

    call PointHLToEntitySpriteVariant             ;; 36:4574 $CD $02 $6C
    ld   [hl], $02                                ;; 36:4577 $36 $02
    jp   IncrementEntityState                     ;; 36:4579 $C3 $12 $3B

.jr_457C
    dec  [hl]                                     ;; 36:457C $35
    call PointHLToEntityPosY                      ;; 36:457D $CD $28 $6C
    inc  [hl]                                     ;; 36:4580 $34
    ldh  a, [hLinkPositionY]                      ;; 36:4581 $F0 $99
    ld   hl, wEntitiesPrivateState2Table          ;; 36:4583 $21 $C0 $C2
    add  hl, bc                                   ;; 36:4586 $09
    ld   [hl], a                                  ;; 36:4587 $77
    ret                                           ;; 36:4588 $C9

func_036_4589::
    call func_036_4365                            ;; 36:4589 $CD $65 $43
    ld   hl, wEntitiesPrivateState2Table          ;; 36:458C $21 $C0 $C2
    add  hl, bc                                   ;; 36:458F $09
    ld   a, [hl]                                  ;; 36:4590 $7E
    call PointHLToEntityPosY                      ;; 36:4591 $CD $28 $6C
    cp   [hl]                                     ;; 36:4594 $BE
    jr   z, jr_036_45E6                           ;; 36:4595 $28 $4F

    ldh  a, [hFrameCounter]                       ;; 36:4597 $F0 $E7
    and  $07                                      ;; 36:4599 $E6 $07
    jr   nz, .jr_45A4                             ;; 36:459B $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:459D $CD $02 $6C
    ld   a, [hl]                                  ;; 36:45A0 $7E
    xor  $01                                      ;; 36:45A1 $EE $01
    ld   [hl], a                                  ;; 36:45A3 $77

.jr_45A4
    ld   hl, wEntitiesPrivateState1Table          ;; 36:45A4 $21 $B0 $C2
    add  hl, bc                                   ;; 36:45A7 $09
    ld   a, [hl]                                  ;; 36:45A8 $7E
    cp   $05                                      ;; 36:45A9 $FE $05
    jr   nz, .jr_45C5                             ;; 36:45AB $20 $18

    ld   a, $0C                                   ;; 36:45AD $3E $0C
    call ApplyVectorTowardsLink_trampoline        ;; 36:45AF $CD $AA $3B
    call UpdateEntityPosWithSpeed_36              ;; 36:45B2 $CD $62 $6A
    call func_036_6B9A                            ;; 36:45B5 $CD $9A $6B
    cp   $0C                                      ;; 36:45B8 $FE $0C
    jr   nc, jr_036_45E6                          ;; 36:45BA $30 $2A

    ld   hl, wEntitiesPrivateState3Table          ;; 36:45BC $21 $D0 $C2
    add  hl, bc                                   ;; 36:45BF $09
    ld   a, $DD                                   ;; 36:45C0 $3E $DD
    ld   [hl], a                                  ;; 36:45C2 $77
    jr   jr_036_45E6                              ;; 36:45C3 $18 $21

.jr_45C5
    ld   a, $08                                   ;; 36:45C5 $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 36:45C7 $CD $AA $3B
    call UpdateEntityPosWithSpeed_36              ;; 36:45CA $CD $62 $6A
    call PointHLToEntityPosY                      ;; 36:45CD $CD $28 $6C
    ld   a, [hl]                                  ;; 36:45D0 $7E
    cp   $2E                                      ;; 36:45D1 $FE $2E
    jr   nc, .jr_45D8                             ;; 36:45D3 $30 $03

    ld   a, $2D                                   ;; 36:45D5 $3E $2D
    ld   [hl], a                                  ;; 36:45D7 $77

.jr_45D8
    call func_036_6B9A                            ;; 36:45D8 $CD $9A $6B
    cp   $0C                                      ;; 36:45DB $FE $0C
    jr   nc, jr_036_45E6                          ;; 36:45DD $30 $07

    ld   hl, wEntitiesPrivateState3Table          ;; 36:45DF $21 $D0 $C2
    add  hl, bc                                   ;; 36:45E2 $09
    ld   a, $E8                                   ;; 36:45E3 $3E $E8
    ld   [hl], a                                  ;; 36:45E5 $77

jr_036_45E6:
    ld   hl, wEntitiesPrivateState3Table          ;; 36:45E6 $21 $D0 $C2
    add  hl, bc                                   ;; 36:45E9 $09
    ld   a, [hl]                                  ;; 36:45EA $7E
    and  a                                        ;; 36:45EB $A7
    jr   z, .jr_45FB                              ;; 36:45EC $28 $0D

    inc  [hl]                                     ;; 36:45EE $34
    ld   a, [hl]                                  ;; 36:45EF $7E
    ldh  [hLinkSpeedY], a                         ;; 36:45F0 $E0 $9B
    push bc                                       ;; 36:45F2 $C5
    call UpdateFinalLinkPosition                  ;; 36:45F3 $CD $A8 $21
    call CheckPositionForMapTransition_trampoline ;; 36:45F6 $CD $19 $3E
    pop  bc                                       ;; 36:45F9 $C1
    ret                                           ;; 36:45FA $C9

.jr_45FB
    ld   hl, wEntitiesPrivateState2Table          ;; 36:45FB $21 $C0 $C2
    add  hl, bc                                   ;; 36:45FE $09
    ld   a, [hl]                                  ;; 36:45FF $7E
    call PointHLToEntityPosY                      ;; 36:4600 $CD $28 $6C
    cp   [hl]                                     ;; 36:4603 $BE
    ret  nz                                       ;; 36:4604 $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 36:4605 $21 $B0 $C2
    add  hl, bc                                   ;; 36:4608 $09
    ld   a, [hl]                                  ;; 36:4609 $7E
    cp   $05                                      ;; 36:460A $FE $05
    jr   nz, .jr_4618                             ;; 36:460C $20 $0A

    xor  a                                        ;; 36:460E $AF
    ld   [hl], a                                  ;; 36:460F $77
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ;; 36:4610 $3E $6A
    ldh  [hLinkAnimationState], a                 ;; 36:4612 $E0 $9D
    ld   a, $0B                                   ;; 36:4614 $3E $0B
    jr   jr_036_4627                              ;; 36:4616 $18 $0F

.jr_4618
    cp   $04                                      ;; 36:4618 $FE $04
    jr   nz, .jr_4620                             ;; 36:461A $20 $04

    ld_dialog_low a, Dialog295 ; "No picture?!"   ;; 36:461C $3E $95
    jr   jr_036_4622                              ;; 36:461E $18 $02

.jr_4620
    ld_dialog_low a, Dialog294 ; "Let's take a picture" ;; 36:4620 $3E $94

jr_036_4622:
    call OpenDialogInTable2                       ;; 36:4622 $CD $7C $23
    ld   a, $07                                   ;; 36:4625 $3E $07

jr_036_4627:
    call SetEntityState                           ;; 36:4627 $CD $07 $6C
    ret                                           ;; 36:462A $C9

func_036_462B::
    call func_036_4365                            ;; 36:462B $CD $65 $43
    ld   hl, wEntitiesPrivateState1Table          ;; 36:462E $21 $B0 $C2
    add  hl, bc                                   ;; 36:4631 $09
    inc  [hl]                                     ;; 36:4632 $34
    ld   a, [hl]                                  ;; 36:4633 $7E
    cp   $40                                      ;; 36:4634 $FE $40
    ret  nz                                       ;; 36:4636 $C0

    ld   a, [wPhotos2]                            ;; 36:4637 $FA $0D $DC
    or   $80                                      ;; 36:463A $F6 $80
    ld   [wPhotos2], a                            ;; 36:463C $EA $0D $DC
    xor  a                                        ;; 36:463F $AF
    ld   [hl], a                                  ;; 36:4640 $77
    call_open_dialog Dialog297                    ;; 36:4641
    jp   IncrementEntityState                     ;; 36:4646 $C3 $12 $3B

func_036_4649::
    di                                            ;; 36:4649 $F3
    ld   hl, rSVBK                                ;; 36:464A $21 $70 $FF
    ld   de, wBGPal1                              ;; 36:464D $11 $10 $DC

.loop_4650
    ld   a, [de]                                  ;; 36:4650 $1A
    ld   [hl], $03                                ;; 36:4651 $36 $03
    ld   [de], a                                  ;; 36:4653 $12
    xor  a                                        ;; 36:4654 $AF
    ld   [hl], a                                  ;; 36:4655 $77
    dec  a                                        ;; 36:4656 $3D
    ld   [de], a                                  ;; 36:4657 $12
    inc  de                                       ;; 36:4658 $13
    ld   a, e                                     ;; 36:4659 $7B
    cp   $90                                      ;; 36:465A $FE $90
    jr   nz, .loop_4650                           ;; 36:465C $20 $F2

    ld   a, $01                                   ;; 36:465E $3E $01
    ld   [wPaletteDataFlags], a                   ;; 36:4660 $EA $D1 $DD
    ei                                            ;; 36:4663 $FB
    ret                                           ;; 36:4664 $C9

func_036_4665::
    di                                            ;; 36:4665 $F3
    ld   hl, rSVBK                                ;; 36:4666 $21 $70 $FF
    ld   de, wBGPal1                              ;; 36:4669 $11 $10 $DC

.loop_466C
    ld   [hl], $03                                ;; 36:466C $36 $03
    ld   a, [de]                                  ;; 36:466E $1A
    ld   [hl], $00                                ;; 36:466F $36 $00
    ld   [de], a                                  ;; 36:4671 $12
    inc  de                                       ;; 36:4672 $13
    ld   a, e                                     ;; 36:4673 $7B
    cp   $90                                      ;; 36:4674 $FE $90
    jr   nz, .loop_466C                           ;; 36:4676 $20 $F4

    ld   a, $01                                   ;; 36:4678 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 36:467A $EA $D1 $DD
    ei                                            ;; 36:467D $FB
    ret                                           ;; 36:467E $C9

func_036_467F::
    call func_036_4365                            ;; 36:467F $CD $65 $43
    ld   hl, wEntitiesPrivateState1Table          ;; 36:4682 $21 $B0 $C2
    add  hl, bc                                   ;; 36:4685 $09
    ld   a, [hl]                                  ;; 36:4686 $7E
    inc  [hl]                                     ;; 36:4687 $34
    and  a                                        ;; 36:4688 $A7
    jr   nz, .jr_469A                             ;; 36:4689 $20 $0F

    ld   a, NOISE_SFX_PHOTO                       ;; 36:468B $3E $40
    ldh  [hNoiseSfx], a                           ;; 36:468D $E0 $F4
    ld   hl, wBGPalette                           ;; 36:468F $21 $97 $DB
    xor  a                                        ;; 36:4692 $AF
    ld   [hl+], a                                 ;; 36:4693 $22
    ld   [hl+], a                                 ;; 36:4694 $22
    ld   [hl], a                                  ;; 36:4695 $77
    call func_036_4649                            ;; 36:4696 $CD $49 $46
    ret                                           ;; 36:4699 $C9

.jr_469A
    cp   $01                                      ;; 36:469A $FE $01
    jr   nz, .jr_46A9                             ;; 36:469C $20 $0B

    ldh  a, [hIsGBC]                              ;; 36:469E $F0 $FE
    and  a                                        ;; 36:46A0 $A7
    jr   z, .jr_46A9                              ;; 36:46A1 $28 $06

    ld   a, $02                                   ;; 36:46A3 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 36:46A5 $EA $D1 $DD
    ret                                           ;; 36:46A8 $C9

.jr_46A9
    cp   $1E                                      ;; 36:46A9 $FE $1E
    ret  c                                        ;; 36:46AB $D8

    jr   nz, .jr_46B2                             ;; 36:46AC $20 $04

    call func_036_4665                            ;; 36:46AE $CD $65 $46
    ret                                           ;; 36:46B1 $C9

.jr_46B2
    ld   a, $02                                   ;; 36:46B2 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 36:46B4 $EA $D1 $DD
    ld   hl, wBGPalette                           ;; 36:46B7 $21 $97 $DB
    ld   a, $E4                                   ;; 36:46BA $3E $E4
    ld   [hl+], a                                 ;; 36:46BC $22
    ld   a, $1C                                   ;; 36:46BD $3E $1C
    ld   [hl+], a                                 ;; 36:46BF $22
    ld   [hl], $E4                                ;; 36:46C0 $36 $E4
    call GetEntityTransitionCountdown             ;; 36:46C2 $CD $05 $0C
    ld   [hl], $30                                ;; 36:46C5 $36 $30
    jp   IncrementEntityState                     ;; 36:46C7 $C3 $12 $3B

func_036_46CA::
    call func_036_4365                            ;; 36:46CA $CD $65 $43
    call GetEntityTransitionCountdown             ;; 36:46CD $CD $05 $0C
    ret  nz                                       ;; 36:46D0 $C0

    call PointHLToEntitySpriteVariant             ;; 36:46D1 $CD $02 $6C
    ld   [hl], $00                                ;; 36:46D4 $36 $00
    jp   IncrementEntityState                     ;; 36:46D6 $C3 $12 $3B

func_036_46D9::
    call func_036_4365                            ;; 36:46D9 $CD $65 $43
    ldh  a, [hFrameCounter]                       ;; 36:46DC $F0 $E7
    and  $07                                      ;; 36:46DE $E6 $07
    jr   nz, .jr_46E9                             ;; 36:46E0 $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:46E2 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:46E5 $7E
    xor  $01                                      ;; 36:46E6 $EE $01
    ld   [hl], a                                  ;; 36:46E8 $77

.jr_46E9
    call PointHLToEntityPosX                      ;; 36:46E9 $CD $23 $6C
    dec  [hl]                                     ;; 36:46EC $35
    ld   a, [hl]                                  ;; 36:46ED $7E
    cp   $35                                      ;; 36:46EE $FE $35
    ret  nc                                       ;; 36:46F0 $D0

    call PointHLToEntitySpriteVariant             ;; 36:46F1 $CD $02 $6C
    ld   [hl], $02                                ;; 36:46F4 $36 $02
    jp   IncrementEntityState                     ;; 36:46F6 $C3 $12 $3B

func_036_46F9::
    call func_036_4365                            ;; 36:46F9 $CD $65 $43
    ldh  a, [hFrameCounter]                       ;; 36:46FC $F0 $E7
    and  $07                                      ;; 36:46FE $E6 $07
    jr   nz, .jr_4709                             ;; 36:4700 $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:4702 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4705 $7E
    xor  $01                                      ;; 36:4706 $EE $01
    ld   [hl], a                                  ;; 36:4708 $77

.jr_4709
    call PointHLToEntityPosY                      ;; 36:4709 $CD $28 $6C
    dec  [hl]                                     ;; 36:470C $35
    ld   a, [hl]                                  ;; 36:470D $7E
    cp   $2E                                      ;; 36:470E $FE $2E
    ret  nc                                       ;; 36:4710 $D0

    call_open_dialog Dialog298                    ;; 36:4711
    call PointHLToEntitySpriteVariant             ;; 36:4716 $CD $02 $6C
    ld   [hl], $00                                ;; 36:4719 $36 $00
    jp   IncrementEntityState                     ;; 36:471B $C3 $12 $3B

func_036_471E::

    ld   a, ENTITY_BOOK                           ;; 36:471E $3E $DD
    call SpawnNewEntity_trampoline                ;; 36:4720 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 36:4723 $21 $00 $C2
    add  hl, de                                   ;; 36:4726 $19
    ld   [hl], $28                                ;; 36:4727 $36 $28
    ld   hl, wEntitiesPosYTable                   ;; 36:4729 $21 $10 $C2
    add  hl, de                                   ;; 36:472C $19
    ld   [hl], $30                                ;; 36:472D $36 $30
    ret                                           ;; 36:472F $C9

func_036_4730::
    call func_036_4365                            ;; 36:4730 $CD $65 $43
    ld   a, JINGLE_TREASURE_FOUND                 ;; 36:4733 $3E $01
    ldh  [hJingle], a                             ;; 36:4735 $E0 $F2
    call func_036_471E                            ;; 36:4737 $CD $1E $47
    call GetEntityTransitionCountdown             ;; 36:473A $CD $05 $0C
    ld   [hl], $60                                ;; 36:473D $36 $60
    jp   IncrementEntityState                     ;; 36:473F $C3 $12 $3B

func_036_4742::
    call func_036_4365                            ;; 36:4742 $CD $65 $43
    call GetEntityTransitionCountdown             ;; 36:4745 $CD $05 $0C
    ret  nz                                       ;; 36:4748 $C0

    xor  a                                        ;; 36:4749 $AF
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:474A $E0 $A1
    ld   [wC167], a                               ;; 36:474C $EA $67 $C1
    call_open_dialog Dialog299                    ;; 36:474F
    ld   a, [wPhotos1]                            ;; 36:4754 $FA $0C $DC
    or   $01                                      ;; 36:4757 $F6 $01
    ld   [wPhotos1], a                            ;; 36:4759 $EA $0C $DC
    call PointHLToEntitySpriteVariant             ;; 36:475C $CD $02 $6C
    ld   [hl], $04                                ;; 36:475F $36 $04
    jp   IncrementEntityState                     ;; 36:4761 $C3 $12 $3B

func_036_4764::
    call func_036_6A98                            ;; 36:4764 $CD $98 $6A
    ret  nc                                       ;; 36:4767 $D0

    ld   e, $00                                   ;; 36:4768 $1E $00
    ld   a, [wPhotos1]                            ;; 36:476A $FA $0C $DC

jr_036_476D:
    and  a                                        ;; 36:476D $A7
    jr   z, jr_036_4779                           ;; 36:476E $28 $09

    srl  a                                        ;; 36:4770 $CB $3F
    bit  0, a                                     ;; 36:4772 $CB $47
    jr   z, .jr_4777                              ;; 36:4774 $28 $01

    inc  e                                        ;; 36:4776 $1C

.jr_4777
    jr   jr_036_476D                              ;; 36:4777 $18 $F4

jr_036_4779:
    ld   a, [wPhotos2]                            ;; 36:4779 $FA $0D $DC
    and  $0F                                      ;; 36:477C $E6 $0F

jr_036_477E:
    and  a                                        ;; 36:477E $A7
    jr   z, jr_036_478A                           ;; 36:477F $28 $09

    bit  0, a                                     ;; 36:4781 $CB $47
    jr   z, .jr_4786                              ;; 36:4783 $28 $01

    inc  e                                        ;; 36:4785 $1C

.jr_4786
    srl  a                                        ;; 36:4786 $CB $3F
    jr   jr_036_477E                              ;; 36:4788 $18 $F4

jr_036_478A:
    ld   a, e                                     ;; 36:478A $7B
    add  LOW($29A) ; From Dialog29A, "[11-1] shots left!" ;; 36:478B $C6 $9A
    call OpenDialogInTable2                       ;; 36:478D $CD $7C $23
    ret                                           ;; 36:4790 $C9

label_036_4791:
    ld   a, [wRoomTransitionState]                ;; 36:4791 $FA $24 $C1
    and  a                                        ;; 36:4794 $A7
    ret  nz                                       ;; 36:4795 $C0

    ld   de, Unknown075SpriteVariants             ;; 36:4796 $11 $FA $48
    call RenderActiveEntitySpritesPair            ;; 36:4799 $CD $C0 $3B
    call ReturnIfNonInteractive_36                ;; 36:479C $CD $40 $6A
    ld   a, [wGameplayType]                       ;; 36:479F $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 36:47A2 $FE $0B
    ret  nz                                       ;; 36:47A4 $C0

    ldh  a, [hActiveEntityState]                  ;; 36:47A5 $F0 $F0
    and  a                                        ;; 36:47A7 $A7
    jr   z, .jr_47B1                              ;; 36:47A8 $28 $07

    ld   a, $02                                   ;; 36:47AA $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:47AC $E0 $A1
    ld   [wC167], a                               ;; 36:47AE $EA $67 $C1

.jr_47B1
    ldh  a, [hActiveEntityState]                  ;; 36:47B1 $F0 $F0
    JP_TABLE                                      ;; 36:47B3
._00 dw func_036_47C2                             ;; 36:47B4
._01 dw func_036_47DE                             ;; 36:47B6
._02 dw func_036_47F2                             ;; 36:47B8
._03 dw func_036_4803                             ;; 36:47BA
._04 dw func_036_4820                             ;; 36:47BC
._05 dw func_036_4830                             ;; 36:47BE
._06 dw func_036_4866                             ;; 36:47C0

func_036_47C2::
    ldh  a, [hLinkPositionX]                      ;; 36:47C2 $F0 $98
    cp   $56                                      ;; 36:47C4 $FE $56
    ret  c                                        ;; 36:47C6 $D8

    cp   $5B                                      ;; 36:47C7 $FE $5B
    ret  nc                                       ;; 36:47C9 $D0

    ldh  a, [hLinkPositionY]                      ;; 36:47CA $F0 $99
    cp   $67                                      ;; 36:47CC $FE $67
    ret  c                                        ;; 36:47CE $D8

    cp   $6C                                      ;; 36:47CF $FE $6C
    ret  nc                                       ;; 36:47D1 $D0

    ldh  a, [hLinkDirection]                      ;; 36:47D2 $F0 $9E
    cp   $02                                      ;; 36:47D4 $FE $02
    ret  nz                                       ;; 36:47D6 $C0

    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ;; 36:47D7 $3E $04
    ldh  [hLinkAnimationState], a                 ;; 36:47D9 $E0 $9D
    jp   IncrementEntityState                     ;; 36:47DB $C3 $12 $3B

func_036_47DE::
    xor  a                                        ;; 36:47DE $AF
    ldh  [hAnimatedTilesFrameCount], a            ;; 36:47DF $E0 $A6
    ld   a, $11                                   ;; 36:47E1 $3E $11
    ldh  [hAnimatedTilesGroup], a                 ;; 36:47E3 $E0 $A4
    call PointHLToEntityPosX                      ;; 36:47E5 $CD $23 $6C
    ld   [hl], $B0                                ;; 36:47E8 $36 $B0
    call PointHLToEntityPosY                      ;; 36:47EA $CD $28 $6C
    ld   [hl], $6A                                ;; 36:47ED $36 $6A
    jp   IncrementEntityState                     ;; 36:47EF $C3 $12 $3B

func_036_47F2::
    ld   hl, wEntitiesPrivateState1Table          ;; 36:47F2 $21 $B0 $C2
    add  hl, bc                                   ;; 36:47F5 $09
    inc  [hl]                                     ;; 36:47F6 $34
    ld   a, [hl]                                  ;; 36:47F7 $7E
    and  $07                                      ;; 36:47F8 $E6 $07
    ret  nz                                       ;; 36:47FA $C0

    ld   [hl], a                                  ;; 36:47FB $77
    ld   a, $03                                   ;; 36:47FC $3E $03
    ldh  [hAnimatedTilesGroup], a                 ;; 36:47FE $E0 $A4
    jp   IncrementEntityState                     ;; 36:4800 $C3 $12 $3B

func_036_4803::
    ldh  a, [hFrameCounter]                       ;; 36:4803 $F0 $E7
    and  $07                                      ;; 36:4805 $E6 $07
    jr   nz, .jr_4810                             ;; 36:4807 $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:4809 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:480C $7E
    xor  $01                                      ;; 36:480D $EE $01
    ld   [hl], a                                  ;; 36:480F $77

.jr_4810
    call PointHLToEntityPosX                      ;; 36:4810 $CD $23 $6C
    dec  [hl]                                     ;; 36:4813 $35
    ld   a, [hl]                                  ;; 36:4814 $7E
    cp   $6A                                      ;; 36:4815 $FE $6A
    ret  nz                                       ;; 36:4817 $C0

    call GetEntityTransitionCountdown             ;; 36:4818 $CD $05 $0C
    ld   [hl], $20                                ;; 36:481B $36 $20
    jp   IncrementEntityState                     ;; 36:481D $C3 $12 $3B

func_036_4820::
    call GetEntityTransitionCountdown             ;; 36:4820 $CD $05 $0C
    ret  nz                                       ;; 36:4823 $C0

    ld   a, LINK_ANIMATION_STATE_STANDING_RIGHT   ;; 36:4824 $3E $0A
    ldh  [hLinkAnimationState], a                 ;; 36:4826 $E0 $9D
    call_open_dialog Dialog108                    ;; 36:4828
    jp   IncrementEntityState                     ;; 36:482D $C3 $12 $3B

func_036_4830::
    ld   a, [wDialogState]                        ;; 36:4830 $FA $9F $C1
    and  a                                        ;; 36:4833 $A7
    ret  nz                                       ;; 36:4834 $C0

    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ;; 36:4835 $3E $04
    ldh  [hLinkAnimationState], a                 ;; 36:4837 $E0 $9D
    ldh  a, [hLinkPositionX]                      ;; 36:4839 $F0 $98
    cp   $51                                      ;; 36:483B $FE $51
    jr   z, .jr_4842                              ;; 36:483D $28 $03

    dec  a                                        ;; 36:483F $3D
    ldh  [hLinkPositionX], a                      ;; 36:4840 $E0 $98

.jr_4842
    ldh  a, [hFrameCounter]                       ;; 36:4842 $F0 $E7
    and  $07                                      ;; 36:4844 $E6 $07
    jr   nz, .jr_484F                             ;; 36:4846 $20 $07

    call PointHLToEntitySpriteVariant             ;; 36:4848 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:484B $7E
    xor  $01                                      ;; 36:484C $EE $01
    ld   [hl], a                                  ;; 36:484E $77

.jr_484F
    call PointHLToEntityPosX                      ;; 36:484F $CD $23 $6C
    ld   a, [hl]                                  ;; 36:4852 $7E
    cp   $60                                      ;; 36:4853 $FE $60
    jr   z, .jr_4859                              ;; 36:4855 $28 $02

    dec  [hl]                                     ;; 36:4857 $35
    ret                                           ;; 36:4858 $C9

.jr_4859
    call PointHLToEntitySpriteVariant             ;; 36:4859 $CD $02 $6C
    ld   [hl], $02                                ;; 36:485C $36 $02
    call_open_dialog Dialog109                    ;; 36:485E
    jp   IncrementEntityState                     ;; 36:4863 $C3 $12 $3B

func_036_4866::
    ld   a, NOISE_SFX_PHOTO                       ;; 36:4866 $3E $40
    ldh  [hNoiseSfx], a                           ;; 36:4868 $E0 $F4
    ld   a, GAMEPLAY_PHOTO_ULRIRA                 ;; 36:486A $3E $13
    ld   [wGameplayType], a                       ;; 36:486C $EA $95 $DB
    xor  a                                        ;; 36:486F $AF
    ld   [wTransitionSequenceCounter], a          ;; 36:4870 $EA $6B $C1
    ld   [wC16C], a                               ;; 36:4873 $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 36:4876 $EA $96 $DB
    ret                                           ;; 36:4879 $C9

Data_036_487A::
    db   $00, $00, $6C, $06, $00, $08, $6E, $06
    db   $05, $07, $FF, $06

Data_036_4886::
    db   $00, $00, $68, $06, $00, $08, $6A, $06
    db   $05, $07, $FF, $06

Data_036_4892::
    db   $00, $04, $4A, $06, $00, $00, $70, $06
    db   $00, $08, $72, $06

Data_036_489E::
    db   $FF, $04, $4A, $26, $00, $00, $74, $06
    db   $00, $08, $76, $06

Data_036_48AA::
    db   $00, $00, $6E, $26, $00, $08, $6C, $26
    db   $05, $07, $FF, $06

Data_036_48B6::
    db   $00, $00, $6A, $26, $00, $08, $68, $26
    db   $05, $07, $FF, $06

Data_036_48C2::
    dw   Data_036_487A
    dw   Data_036_4886
    dw   Data_036_4892
    dw   Data_036_489E
    dw   Data_036_48AA
    dw   Data_036_48B6

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PhotographerOverworldSpriteVariants::
.variant0
    db $44, $07
    db $46, $07
.variant1
    db $48, $07
    db $4A, $07
.variant2
    db $46, $27
    db $44, $27
.variant3
    db $4A, $27
    db $48, $27
.variant4
    db $40, $07
    db $42, $07

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Photographer2SpriteVariants::
IF __PATCH_0__
.variant0
    db $70, $06
    db $72, $06
.variant1
    db $74, $06
    db $76, $06
.variant2
    db $6A, $26
    db $68, $26
.variant3
    db $6E, $26
    db $6C, $26
ELSE
.variant0
    db $70, $03
    db $72, $03
.variant1
    db $74, $03
    db $76, $03
.variant2
    db $6A, $23
    db $68, $23
.variant3
    db $6E, $23
    db $6C, $23
ENDC

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown074SpriteVariants::
.variant0
    db $70, $06
    db $72, $06
.variant1
    db $74, $06
    db $76, $06

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown075SpriteVariants::
.variant0
    db $48, $06
    db $4A, $06
.variant1
    db $4C, $06
    db $4E, $06
.variant2
    db $70, $06
    db $72, $06
.variant3
    db $74, $06
    db $76, $06

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown076SpriteVariants::
.variant0
    db $4E, $26
    db $4C, $26
.variant1
    db $4A, $26
    db $48, $26

PhotographerEntityHandler::
    ld   a, [wIsIndoor]                           ;; 36:4912 $FA $A5 $DB
    and  a                                        ;; 36:4915 $A7
    jr   z, .overworld                            ;; 36:4916 $28 $17

    ldh  a, [hMapRoom]                            ;; 36:4918 $F0 $F6
    cp   UNKNOWN_ROOM_DA                          ;; 36:491A $FE $DA
    jr   nz, .jr_036_4925                         ;; 36:491C $20 $07

    ld   de, Photographer2SpriteVariants          ;; 36:491E $11 $E2 $48
    call RenderActiveEntitySpritesPair            ;; 36:4921 $CD $C0 $3B
    ret                                           ;; 36:4924 $C9

.jr_036_4925
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 36:4925 $FE $B5
    jp   z, label_036_429A                        ;; 36:4927 $CA $9A $42
    cp   UNKNOWN_ROOM_A4                          ;; 36:492A $FE $A4
    jp   z, label_036_4178                        ;; 36:492C $CA $78 $41

.overworld
    ldh  a, [hMapRoom]                            ;; 36:492F $F0 $F6
    cp   ROOM_OW_ULRIRA_HOUSE                     ;; 36:4931 $FE $B1
    jp   z, label_036_4791                        ;; 36:4933 $CA $91 $47
    cp   UNKNOWN_ROOM_0D                          ;; 36:4936 $FE $0D
    jp   z, label_036_4000                        ;; 36:4938 $CA $00 $40

    ld   a, [wPhotos1]                            ;; 36:493B $FA $0C $DC
    bit  0, a                                     ;; 36:493E $CB $47
    jp   z, UnloadEntityAndReturn                 ;; 36:4940 $CA $8D $3F

    bit  7, a                                     ;; 36:4943 $CB $7F
    jp   nz, UnloadEntityAndReturn                ;; 36:4945 $C2 $8D $3F

    ld   a, [wTradeSequenceItem]                  ;; 36:4948 $FA $0E $DB
    cp   TRADING_ITEM_SCALE                       ;; 36:494B $FE $0D
    jp   c, UnloadEntityAndReturn                 ;; 36:494D $DA $8D $3F

    ld   de, PhotographerOverworldSpriteVariants  ;; 36:4950 $11 $CE $48
    call RenderActiveEntitySpritesPair            ;; 36:4953 $CD $C0 $3B
    call ReturnIfNonInteractive_36                ;; 36:4956 $CD $40 $6A
    ldh  a, [hActiveEntityState]                  ;; 36:4959 $F0 $F0
    JP_TABLE                                      ;; 36:495B $C7
._00 dw func_036_49D0
._01 dw func_036_497B
._02 dw func_036_4992
._03 dw func_036_49D0
._04 dw func_036_497B
._05 dw func_036_4992
._06 dw func_036_49D0
._07 dw func_036_49DA
._08 dw func_036_49F6

func_036_496E::
    ldh  a, [hFrameCounter]                       ;; 36:496E $F0 $E7
    and  $0F                                      ;; 36:4970 $E6 $0F
    ret  nz                                       ;; 36:4972 $C0

    call PointHLToEntitySpriteVariant             ;; 36:4973 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4976 $7E
    xor  $01                                      ;; 36:4977 $EE $01
    ld   [hl], a                                  ;; 36:4979 $77
    ret                                           ;; 36:497A $C9

func_036_497B::
    call func_036_496E                            ;; 36:497B $CD $6E $49
    ld   hl, wEntitiesPrivateState1Table          ;; 36:497E $21 $B0 $C2
    add  hl, bc                                   ;; 36:4981 $09
    ld   a, [hl]                                  ;; 36:4982 $7E
    and  a                                        ;; 36:4983 $A7
    call PointHLToEntitySpeedX                    ;; 36:4984 $CD $EE $6B
    ld   e, $E8                                   ;; 36:4987 $1E $E8
    and  a                                        ;; 36:4989 $A7
    jr   z, .jr_498E                              ;; 36:498A $28 $02

    ld   e, $18                                   ;; 36:498C $1E $18

.jr_498E
    ld   [hl], e                                  ;; 36:498E $73
    jp   IncrementEntityState                     ;; 36:498F $C3 $12 $3B

func_036_4992::
    call func_036_496E                            ;; 36:4992 $CD $6E $49
    call PointHLToEntitySpeedX                    ;; 36:4995 $CD $EE $6B
    ld   a, [hl]                                  ;; 36:4998 $7E
    bit  7, a                                     ;; 36:4999 $CB $7F
    jr   z, .jr_49A0                              ;; 36:499B $28 $03

    inc  a                                        ;; 36:499D $3C
    jr   jr_036_49A1                              ;; 36:499E $18 $01

.jr_49A0
    dec  a                                        ;; 36:49A0 $3D

jr_036_49A1:
    ld   [hl], a                                  ;; 36:49A1 $77
    and  a                                        ;; 36:49A2 $A7
    jr   nz, .jr_49AD                             ;; 36:49A3 $20 $08

    call GetEntityTransitionCountdown             ;; 36:49A5 $CD $05 $0C
    ld   [hl], $38                                ;; 36:49A8 $36 $38
    jp   IncrementEntityState                     ;; 36:49AA $C3 $12 $3B

.jr_49AD
    push af                                       ;; 36:49AD $F5
    swap a                                        ;; 36:49AE $CB $37
    and  $F0                                      ;; 36:49B0 $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 36:49B2 $21 $60 $C2
    add  [hl]                                     ;; 36:49B5 $86
    ld   [hl], a                                  ;; 36:49B6 $77
    rl   d                                        ;; 36:49B7 $CB $12
    ld   hl, wEntitiesPosXTable                   ;; 36:49B9 $21 $00 $C2
    add  hl, bc                                   ;; 36:49BC $09
    pop  af                                       ;; 36:49BD $F1
    ld   e, $00                                   ;; 36:49BE $1E $00
    bit  7, a                                     ;; 36:49C0 $CB $7F
    jr   z, .jr_49C6                              ;; 36:49C2 $28 $02

    ld   e, $F0                                   ;; 36:49C4 $1E $F0

.jr_49C6
    swap a                                        ;; 36:49C6 $CB $37
    and  $0F                                      ;; 36:49C8 $E6 $0F
    or   e                                        ;; 36:49CA $B3
    rr   d                                        ;; 36:49CB $CB $1A
    adc  [hl]                                     ;; 36:49CD $8E
    ld   [hl], a                                  ;; 36:49CE $77
    ret                                           ;; 36:49CF $C9

func_036_49D0::
    call func_036_496E                            ;; 36:49D0 $CD $6E $49
    call GetEntityTransitionCountdown             ;; 36:49D3 $CD $05 $0C
    ret  nz                                       ;; 36:49D6 $C0

    jp   IncrementEntityState                     ;; 36:49D7 $C3 $12 $3B

func_036_49DA::
    ld   hl, wEntitiesPrivateState1Table          ;; 36:49DA $21 $B0 $C2
    add  hl, bc                                   ;; 36:49DD $09
    ld   a, [hl]                                  ;; 36:49DE $7E
    and  a                                        ;; 36:49DF $A7
    xor  $01                                      ;; 36:49E0 $EE $01
    ld   [hl], a                                  ;; 36:49E2 $77
    call PointHLToEntitySpriteVariant             ;; 36:49E3 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:49E6 $7E
    xor  $02                                      ;; 36:49E7 $EE $02
    ld   [hl], a                                  ;; 36:49E9 $77
    call IncrementEntityState                     ;; 36:49EA $CD $12 $3B
    xor  a                                        ;; 36:49ED $AF
    ld   [hl], a                                  ;; 36:49EE $77
    call GetEntityTransitionCountdown             ;; 36:49EF $CD $05 $0C
    ld   a, $20                                   ;; 36:49F2 $3E $20
    ld   [hl], a                                  ;; 36:49F4 $77
    ret                                           ;; 36:49F5 $C9

func_036_49F6::
    call PointHLToEntitySpriteVariant             ;; 36:49F6 $CD $02 $6C
    ld   [hl], $04                                ;; 36:49F9 $36 $04
    ret                                           ;; 36:49FB $C9

TailCaveHints::
    db_dialog_low Dialog280
    db_dialog_low Dialog280
    db_dialog_low Dialog288

BottleGrottoHints::
    db_dialog_low Dialog281
    db_dialog_low Dialog28A
    db_dialog_low Dialog289

KeyCavernHints::
    db_dialog_low Dialog282
    db_dialog_low Dialog28B
    db_dialog_low Dialog28C

AnglersTunnelHints::
    db_dialog_low Dialog283
    db_dialog_low Dialog200
    db_dialog_low Dialog200

CatfishsMawHints::
    db_dialog_low Dialog284
    db_dialog_low Dialog28D
    db_dialog_low Dialog200

FaceShrineHints::
    db_dialog_low Dialog285
    db_dialog_low Dialog28E
    db_dialog_low Dialog28F

EaglesTowerHints::
    db_dialog_low Dialog286
    db_dialog_low Dialog290
    db_dialog_low Dialog291

TurtleRockHints::
    db_dialog_low Dialog287
    db_dialog_low Dialog292
    db_dialog_low Dialog293

; Indexed by hMapId
HintTable::
._0 dw TailCaveHints
._1 dw BottleGrottoHints
._2 dw KeyCavernHints
._3 dw AnglersTunnelHints
._4 dw CatfishsMawHints
._5 dw FaceShrineHints
._6 dw EaglesTowerHints
._7 dw TurtleRockHints

TailCaveHintRooms::
    db   ROOM_INDOOR_A_TAIL_CAVE_SPIKED_BEETLES, ROOM_INDOOR_A_TAIL_CAVE_THREE_OF_A_KIND, ROOM_INDOOR_A_TAIL_CAVE_MOVABLE_BLOCK

BottleGrottoHintRooms::
    db   ROOM_INDOOR_A_BOTTLE_GROTTO_POT_STAIRS, ROOM_INDOOR_A_BOTTLE_GROTTO_FIRST_SWITCH, ROOM_INDOOR_A_BOTTLE_GROTTO_PUSH_BLOCKS

KeyCavernHintRooms::
    db   ROOM_INDOOR_A_KEY_CAVERN_SWITCH, ROOM_INDOOR_A_KEY_CAVERN_BOMBITE_CORNER, ROOM_INDOOR_A_KEY_CAVERN_FLOOR_ARROW

AnglersTunnelHintRooms::
    db   ROOM_INDOOR_A_ANGLERS_TUNNEL_HINT_STATUE, ROOM_NULL, ROOM_NULL

CatfishsMawHintRooms::
    db   ROOM_INDOOR_A_CATFISHS_MAW_HINT_CRYSTAL, ROOM_INDOOR_A_CATFISHS_MAW_HINT_STAR, ROOM_NULL

FaceShrineHintRooms::
    db   ROOM_INDOOR_A_FACE_SHRINE_CORRIDOR_HINT, ROOM_INDOOR_A_FACE_SHRINE_POT_CHEST, ROOM_INDOOR_A_FACE_SHRINE_CRYSTAL_JUMP

EaglesTowerHintRooms::
    db   ROOM_INDOOR_B_EAGLES_TOWER_WRECKING_BALL, ROOM_INDOOR_B_EAGLES_TOWER_3_OF_A_KIND, ROOM_INDOOR_B_EAGLES_TOWER_NE_CHEST

TurtleRockHintRooms::
    db   ROOM_INDOOR_B_TURTLE_ROCK_BEAMOS_HINT, ROOM_INDOOR_B_TURTLE_ROCK_BOMB_ZOL, ROOM_INDOOR_B_TURTLE_ROCK_ARROW_STATUE

HintRoomTable::
    dw   TailCaveHintRooms
    dw   BottleGrottoHintRooms
    dw   KeyCavernHintRooms
    dw   AnglersTunnelHintRooms
    dw   CatfishsMawHintRooms
    dw   FaceShrineHintRooms
    dw   EaglesTowerHintRooms
    dw   TurtleRockHintRooms

; Returns a dialog id for an owl statue hint, depending on the
; current map and room.
;
; Returns:
;   hMultiPurpose0   the lower part of the dialog id
GetOwlStatueDialogId::
    push bc                                       ;; 36:4A4C $C5
    ld   hl, HintRoomTable                        ;; 36:4A4D $21 $3C $4A
    ldh  a, [hMapId]                              ;; 36:4A50 $F0 $F7
    sla  a                                        ;; 36:4A52 $CB $27
    ld   e, a                                     ;; 36:4A54 $5F
    ld   d, $00                                   ;; 36:4A55 $16 $00
    ld   c, d                                     ;; 36:4A57 $4A
    ld   b, d                                     ;; 36:4A58 $42
    add  hl, de                                   ;; 36:4A59 $19
    ld   a, [hl+]                                 ;; 36:4A5A $2A
    ld   h, [hl]                                  ;; 36:4A5B $66
    ld   l, a                                     ;; 36:4A5C $6F
    dec  hl                                       ;; 36:4A5D $2B

.loop_4A5E
    inc  hl                                       ;; 36:4A5E $23
    ldh  a, [hMapRoom]                            ;; 36:4A5F $F0 $F6
    cp   [hl]                                     ;; 36:4A61 $BE
    jr   z, .jr_4A6A                              ;; 36:4A62 $28 $06

    inc  c                                        ;; 36:4A64 $0C
    ld   a, c                                     ;; 36:4A65 $79
    cp   $03                                      ;; 36:4A66 $FE $03
    jr   nz, .loop_4A5E                           ;; 36:4A68 $20 $F4

.jr_4A6A
    ld   hl, HintTable                            ;; 36:4A6A $21 $14 $4A
    add  hl, de                                   ;; 36:4A6D $19
    ld   a, [hl+]                                 ;; 36:4A6E $2A
    ld   h, [hl]                                  ;; 36:4A6F $66
    ld   l, a                                     ;; 36:4A70 $6F
    add  hl, bc                                   ;; 36:4A71 $09
    ld   a, [hl]                                  ;; 36:4A72 $7E
    ldh  [hMultiPurpose0], a                      ;; 36:4A73 $E0 $D7
    pop  bc                                       ;; 36:4A75 $C1
    ret                                           ;; 36:4A76 $C9

func_036_4A77::
    ld   a, $02                                   ;; 36:4A77 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:4A79 $E0 $A1
    ld   [wC167], a                               ;; 36:4A7B $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ;; 36:4A7E $F0 $F0
    JP_TABLE                                      ;; 36:4A80
._00 dw func_036_4A9F                             ;; 36:4A81
._01 dw func_036_4AD9                             ;; 36:4A83
._02 dw func_036_4AF3                             ;; 36:4A85
._03 dw func_036_4B0C                             ;; 36:4A87
._04 dw func_036_4B26                             ;; 36:4A89
._05 dw func_036_4B3B                             ;; 36:4A8B
._06 dw func_036_4B57                             ;; 36:4A8D
._07 dw func_036_4B8F                             ;; 36:4A8F
._08 dw func_036_4BAC                             ;; 36:4A91
._09 dw func_036_4BC3                             ;; 36:4A93
._0A dw func_036_4BCF                             ;; 36:4A95

PhotographerPaletteB::
    rgb  #F8F8F8, #000000, #881888, #F858F8

func_036_4A9F::
    push bc                                       ;; 36:4A9F $C5
    call LCDOff                                   ;; 36:4AA0 $CD $CF $28
    ld   a, $38                                   ;; 36:4AA3 $3E $38
    ld   b, $40                                   ;; 36:4AA5 $06 $40
    ld   c, $06                                   ;; 36:4AA7 $0E $06
    ld   h, $36                                   ;; 36:4AA9 $26 $36
    call CopyDataToVRAM                           ;; 36:4AAB $CD $13 $0A
    ld   a, $38                                   ;; 36:4AAE $3E $38
    ld   b, $41                                   ;; 36:4AB0 $06 $41
    ld   c, $07                                   ;; 36:4AB2 $0E $07
    ld   h, $36                                   ;; 36:4AB4 $26 $36
    call CopyDataToVRAM                           ;; 36:4AB6 $CD $13 $0A
    ld   a, [wLCDControl]                         ;; 36:4AB9 $FA $FD $D6
    ldh  [rLCDC], a                               ;; 36:4ABC $E0 $40
    di                                            ;; 36:4ABE $F3
    ld   a, $02                                   ;; 36:4ABF $3E $02
    ldh  [rSVBK], a                               ;; 36:4AC1 $E0 $70
    ld   de, PhotographerPaletteB                 ;; 36:4AC3 $11 $97 $4A
    ld   hl, wObjPal7                             ;; 36:4AC6 $21 $80 $DC

.loop_4AC9
    ld   a, [de]                                  ;; 36:4AC9 $1A
    ld   [hl+], a                                 ;; 36:4ACA $22
    inc  de                                       ;; 36:4ACB $13
    ld   a, l                                     ;; 36:4ACC $7D
    and  $07                                      ;; 36:4ACD $E6 $07
    jr   nz, .loop_4AC9                           ;; 36:4ACF $20 $F8

    xor  a                                        ;; 36:4AD1 $AF
    ldh  [rSVBK], a                               ;; 36:4AD2 $E0 $70
    ei                                            ;; 36:4AD4 $FB
    pop  bc                                       ;; 36:4AD5 $C1
    jp   IncrementEntityState                     ;; 36:4AD6 $C3 $12 $3B

func_036_4AD9::
    ld   a, [wTransitionSequenceCounter]          ;; 36:4AD9 $FA $6B $C1
    cp   $04                                      ;; 36:4ADC $FE $04
    ret  nz                                       ;; 36:4ADE $C0

    call GetEntityTransitionCountdown             ;; 36:4ADF $CD $05 $0C
    ld   [hl], $10                                ;; 36:4AE2 $36 $10
    jp   IncrementEntityState                     ;; 36:4AE4 $C3 $12 $3B

func_036_4AE7::
    ldh  a, [hFrameCounter]                       ;; 36:4AE7 $F0 $E7
    and  $07                                      ;; 36:4AE9 $E6 $07
    ret  nz                                       ;; 36:4AEB $C0

    ldh  a, [hLinkAnimationState]                 ;; 36:4AEC $F0 $9D
    xor  $01                                      ;; 36:4AEE $EE $01
    ldh  [hLinkAnimationState], a                 ;; 36:4AF0 $E0 $9D
    ret                                           ;; 36:4AF2 $C9

func_036_4AF3::
    call GetEntityTransitionCountdown             ;; 36:4AF3 $CD $05 $0C
    ret  nz                                       ;; 36:4AF6 $C0

    call func_036_4AE7                            ;; 36:4AF7 $CD $E7 $4A
    ld   hl, hLinkPositionY                       ;; 36:4AFA $21 $99 $FF
    dec  [hl]                                     ;; 36:4AFD $35
    ld   a, [hl]                                  ;; 36:4AFE $7E
    cp   $42                                      ;; 36:4AFF $FE $42
    ret  nc                                       ;; 36:4B01 $D0

    ld   a, $42                                   ;; 36:4B02 $3E $42
    ld   [hl], a                                  ;; 36:4B04 $77
    ld   a, LINK_ANIMATION_STATE_STANDING_RIGHT   ;; 36:4B05 $3E $0A
    ldh  [hLinkAnimationState], a                 ;; 36:4B07 $E0 $9D
    jp   IncrementEntityState                     ;; 36:4B09 $C3 $12 $3B

func_036_4B0C::
    call func_036_4AE7                            ;; 36:4B0C $CD $E7 $4A
    ld   hl, hLinkPositionX                       ;; 36:4B0F $21 $98 $FF
    inc  [hl]                                     ;; 36:4B12 $34
    ld   a, [hl]                                  ;; 36:4B13 $7E
    cp   $78                                      ;; 36:4B14 $FE $78
    ret  c                                        ;; 36:4B16 $D8

    ld   a, $78                                   ;; 36:4B17 $3E $78
    ld   [hl], a                                  ;; 36:4B19 $77
    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ;; 36:4B1A $3E $04
    ldh  [hLinkAnimationState], a                 ;; 36:4B1C $E0 $9D
    call GetEntityTransitionCountdown             ;; 36:4B1E $CD $05 $0C
    ld   [hl], $60                                ;; 36:4B21 $36 $60
    jp   IncrementEntityState                     ;; 36:4B23 $C3 $12 $3B

func_036_4B26::
    call func_036_4AE7                            ;; 36:4B26 $CD $E7 $4A
    ld   hl, hLinkPositionY                       ;; 36:4B29 $21 $99 $FF
    dec  [hl]                                     ;; 36:4B2C $35
    ld   a, [hl]                                  ;; 36:4B2D $7E
    cp   $2C                                      ;; 36:4B2E $FE $2C
    ret  nc                                       ;; 36:4B30 $D0

    ld   a, $2C                                   ;; 36:4B31 $3E $2C
    ld   [hl], a                                  ;; 36:4B33 $77
    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ;; 36:4B34 $3E $04
    ldh  [hLinkAnimationState], a                 ;; 36:4B36 $E0 $9D
    jp   IncrementEntityState                     ;; 36:4B38 $C3 $12 $3B

func_036_4B3B::
    call GetEntityTransitionCountdown             ;; 36:4B3B $CD $05 $0C
    jr   nz, .jr_4B4D                             ;; 36:4B3E $20 $0D

    call IncrementEntityState                     ;; 36:4B40 $CD $12 $3B
    call_open_dialog Dialog1EF                    ;; 36:4B43
    ld   a, $03                                   ;; 36:4B48 $3E $03
    jp   SetEntitySpriteVariant                   ;; 36:4B4A $C3 $0C $3B

.jr_4B4D
    and  $04                                      ;; 36:4B4D $E6 $04
    ld   a, $01                                   ;; 36:4B4F $3E $01
    jr   z, .jr_4B54                              ;; 36:4B51 $28 $01

    inc  a                                        ;; 36:4B53 $3C

.jr_4B54
    jp   SetEntitySpriteVariant                   ;; 36:4B54 $C3 $0C $3B

func_036_4B57::
    ld   a, [wDialogState]                        ;; 36:4B57 $FA $9F $C1
    and  a                                        ;; 36:4B5A $A7
    ret  nz                                       ;; 36:4B5B $C0

    ld   a, ENTITY_PHOTOGRAPHER                   ;; 36:4B5C $3E $FA
    call SpawnNewEntity_trampoline                ;; 36:4B5E $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 36:4B61 $21 $00 $C2
    add  hl, de                                   ;; 36:4B64 $19
    ld   [hl], $50                                ;; 36:4B65 $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 36:4B67 $21 $10 $C2
    add  hl, de                                   ;; 36:4B6A $19
    ld   [hl], $7C                                ;; 36:4B6B $36 $7C
    ld   hl, wEntitiesPrivateState5Table          ;; 36:4B6D $21 $90 $C3
    add  hl, bc                                   ;; 36:4B70 $09
    ld   [hl], e                                  ;; 36:4B71 $73
    call GetEntityTransitionCountdown             ;; 36:4B72 $CD $05 $0C
    ld   [hl], $20                                ;; 36:4B75 $36 $20
    jp   IncrementEntityState                     ;; 36:4B77 $C3 $12 $3B

func_036_4B7A::
    ld   hl, wEntitiesPrivateState5Table          ;; 36:4B7A $21 $90 $C3
    add  hl, bc                                   ;; 36:4B7D $09
    ld   e, [hl]                                  ;; 36:4B7E $5E
    ld   d, $00                                   ;; 36:4B7F $16 $00
    ld   hl, wEntitiesSpriteVariantTable          ;; 36:4B81 $21 $B0 $C3
    add  hl, de                                   ;; 36:4B84 $19
    ldh  a, [hFrameCounter]                       ;; 36:4B85 $F0 $E7
    and  $07                                      ;; 36:4B87 $E6 $07
    ret  nz                                       ;; 36:4B89 $C0

    ld   a, [hl]                                  ;; 36:4B8A $7E
    xor  $01                                      ;; 36:4B8B $EE $01
    ld   [hl], a                                  ;; 36:4B8D $77
    ret                                           ;; 36:4B8E $C9

func_036_4B8F::
    call GetEntityTransitionCountdown             ;; 36:4B8F $CD $05 $0C
    ret  nz                                       ;; 36:4B92 $C0

    call func_036_4B7A                            ;; 36:4B93 $CD $7A $4B
    ld   hl, wEntitiesPosYTable                   ;; 36:4B96 $21 $10 $C2
    add  hl, de                                   ;; 36:4B99 $19
    dec  [hl]                                     ;; 36:4B9A $35
    ld   a, [hl]                                  ;; 36:4B9B $7E
    cp   $42                                      ;; 36:4B9C $FE $42
    ret  nc                                       ;; 36:4B9E $D0

    ld   a, $42                                   ;; 36:4B9F $3E $42
    ld   [hl], a                                  ;; 36:4BA1 $77
    ld   a, $02                                   ;; 36:4BA2 $3E $02

jr_036_4BA4:
    ld   hl, wEntitiesSpriteVariantTable          ;; 36:4BA4 $21 $B0 $C3
    add  hl, de                                   ;; 36:4BA7 $19
    ld   [hl], a                                  ;; 36:4BA8 $77
    jp   IncrementEntityState                     ;; 36:4BA9 $C3 $12 $3B

func_036_4BAC::
    call func_036_4B7A                            ;; 36:4BAC $CD $7A $4B
    ld   hl, wEntitiesPosXTable                   ;; 36:4BAF $21 $00 $C2
    add  hl, de                                   ;; 36:4BB2 $19
    inc  [hl]                                     ;; 36:4BB3 $34
    ld   a, [hl]                                  ;; 36:4BB4 $7E
    cp   $78                                      ;; 36:4BB5 $FE $78
    ret  c                                        ;; 36:4BB7 $D8

    ld   a, $78                                   ;; 36:4BB8 $3E $78
    ld   [hl], a                                  ;; 36:4BBA $77
    call GetEntityTransitionCountdown             ;; 36:4BBB $CD $05 $0C
    ld   [hl], $30                                ;; 36:4BBE $36 $30
    xor  a                                        ;; 36:4BC0 $AF
    jr   jr_036_4BA4                              ;; 36:4BC1 $18 $E1

func_036_4BC3::
    call GetEntityTransitionCountdown             ;; 36:4BC3 $CD $05 $0C
    ret  nz                                       ;; 36:4BC6 $C0

    call_open_dialog Dialog1F8                    ;; 36:4BC7
    jp   IncrementEntityState                     ;; 36:4BCC $C3 $12 $3B

func_036_4BCF::
    ld   a, [wDialogState]                        ;; 36:4BCF $FA $9F $C1
    and  a                                        ;; 36:4BD2 $A7
    ret  nz                                       ;; 36:4BD3 $C0

    ld   a, NOISE_SFX_PHOTO                       ;; 36:4BD4 $3E $40
    ldh  [hNoiseSfx], a                           ;; 36:4BD6 $E0 $F4
    ld   a, GAMEPLAY_PHOTO_ZORA                   ;; 36:4BD8 $3E $17
    ld   [wGameplayType], a                       ;; 36:4BDA $EA $95 $DB
    xor  a                                        ;; 36:4BDD $AF
    ld   [wGameplaySubtype], a                    ;; 36:4BDE $EA $96 $DB
    ld   [wTransitionSequenceCounter], a          ;; 36:4BE1 $EA $6B $C1
    ld   [wC16C], a                               ;; 36:4BE4 $EA $6C $C1
    ret                                           ;; 36:4BE7 $C9

func_036_4BE8::
    ld   a, [wD202]                               ;; 36:4BE8 $FA $02 $D2
    ld   e, a                                     ;; 36:4BEB $5F
    ld   d, $00                                   ;; 36:4BEC $16 $00
    ld   hl, wEntitiesStatusTable                 ;; 36:4BEE $21 $80 $C2
    add  hl, de                                   ;; 36:4BF1 $19
    ld   a, [hl]                                  ;; 36:4BF2 $7E
    cp   $01                                      ;; 36:4BF3 $FE $01
    jr   nz, .jr_4BFE                             ;; 36:4BF5 $20 $07

    call ClearEntityStatus_36                     ;; 36:4BF7 $CD $89 $6C
    call func_036_5CAB                            ;; 36:4BFA $CD $AB $5C
    ret                                           ;; 36:4BFD $C9

.jr_4BFE
    ld   a, [wCurrentBank]                        ;; 36:4BFE $FA $AF $DB
    push af                                       ;; 36:4C01 $F5
    ld   a, $36                                   ;; 36:4C02 $3E $36
    ld   [wCurrentBank], a                        ;; 36:4C04 $EA $AF $DB
    call label_3CD9                               ;; 36:4C07 $CD $D9 $3C
    call func_036_4C12                            ;; 36:4C0A $CD $12 $4C
    pop  af                                       ;; 36:4C0D $F1
    ld   [wCurrentBank], a                        ;; 36:4C0E $EA $AF $DB
    ret                                           ;; 36:4C11 $C9

func_036_4C12::
    ldh  a, [hActiveEntityState]                  ;; 36:4C12 $F0 $F0
    JP_TABLE                                      ;; 36:4C14
._00 dw func_036_4C1D                             ;; 36:4C15
._01 dw func_036_4C25                             ;; 36:4C17
._02 dw func_036_4C5C                             ;; 36:4C19
._03 dw func_036_4C82                             ;; 36:4C1B

func_036_4C1D::
    call GetEntityTransitionCountdown             ;; 36:4C1D $CD $05 $0C
    ret  nz                                       ;; 36:4C20 $C0

    call IncrementEntityState                     ;; 36:4C21 $CD $12 $3B
    ret                                           ;; 36:4C24 $C9

func_036_4C25::
    ldh  a, [hFrameCounter]                       ;; 36:4C25 $F0 $E7
    xor  c                                        ;; 36:4C27 $A9
    and  $03                                      ;; 36:4C28 $E6 $03
    jr   nz, .jr_4C31                             ;; 36:4C2A $20 $05

    ld   a, $08                                   ;; 36:4C2C $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 36:4C2E $CD $AA $3B

.jr_4C31
    call func_036_6B8A                            ;; 36:4C31 $CD $8A $6B
    cp   $18                                      ;; 36:4C34 $FE $18
    jr   nc, .jr_4C4C                             ;; 36:4C36 $30 $14

    call func_036_6B9A                            ;; 36:4C38 $CD $9A $6B
    cp   $18                                      ;; 36:4C3B $FE $18
    jr   nc, .jr_4C4C                             ;; 36:4C3D $30 $0D

    call PointHLToEntitySpeedZ                    ;; 36:4C3F $CD $F8 $6B
    ld   [hl], $28                                ;; 36:4C42 $36 $28
    ld   a, $10                                   ;; 36:4C44 $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 36:4C46 $CD $AA $3B
    call IncrementEntityState                     ;; 36:4C49 $CD $12 $3B

.jr_4C4C
    call UpdateEntityPosWithSpeed_36              ;; 36:4C4C $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:4C4F $CD $23 $3B
    ldh  a, [hFrameCounter]                       ;; 36:4C52 $F0 $E7
    rra                                           ;; 36:4C54 $1F
    rra                                           ;; 36:4C55 $1F
    and  $01                                      ;; 36:4C56 $E6 $01
    call SetEntitySpriteVariant                   ;; 36:4C58 $CD $0C $3B
    ret                                           ;; 36:4C5B $C9

func_036_4C5C::
    call UpdateEntityPosWithSpeed_36              ;; 36:4C5C $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:4C5F $CD $23 $3B
    call func_036_6AEC                            ;; 36:4C62 $CD $EC $6A
    call PointHLToEntitySpeedZ                    ;; 36:4C65 $CD $F8 $6B
    dec  [hl]                                     ;; 36:4C68 $35
    dec  [hl]                                     ;; 36:4C69 $35
    ld   a, [hl]                                  ;; 36:4C6A $7E
    cp   $02                                      ;; 36:4C6B $FE $02
    jr   nc, .jr_4C7C                             ;; 36:4C6D $30 $0D

    ld   [hl], $C0                                ;; 36:4C6F $36 $C0
    ld   a, $10                                   ;; 36:4C71 $3E $10
    call SetEntityTransitionCountdown_36          ;; 36:4C73 $CD $83 $6C
    call ClearEntitySpeed                         ;; 36:4C76 $CD $7F $3D
    call IncrementEntityState                     ;; 36:4C79 $CD $12 $3B

.jr_4C7C
    ld   a, $02                                   ;; 36:4C7C $3E $02
    call SetEntitySpriteVariant                   ;; 36:4C7E $CD $0C $3B
    ret                                           ;; 36:4C81 $C9

func_036_4C82::
    call GetEntityTransitionCountdown             ;; 36:4C82 $CD $05 $0C
    ret  nz                                       ;; 36:4C85 $C0

    call func_036_6AEC                            ;; 36:4C86 $CD $EC $6A
    call PointHLToEntityPosZ                      ;; 36:4C89 $CD $2D $6C
    ld   a, [hl]                                  ;; 36:4C8C $7E
    bit  7, a                                     ;; 36:4C8D $CB $7F
    ret  z                                        ;; 36:4C8F $C8

    ld   [hl], b                                  ;; 36:4C90 $70
    ld   a, $20                                   ;; 36:4C91 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:4C93 $CD $83 $6C
    xor  a                                        ;; 36:4C96 $AF
    call SetEntityState                           ;; 36:4C97 $CD $07 $6C
    ld   hl, wEntitiesSpeedZTable                 ;; 36:4C9A $21 $20 $C3
    add  hl, bc                                   ;; 36:4C9D $09
    ld   a, [hl]                                  ;; 36:4C9E $7E
    ld   [hl], b                                  ;; 36:4C9F $70
    bit  7, a                                     ;; 36:4CA0 $CB $7F
    ret  z                                        ;; 36:4CA2 $C8

    cp   $D0                                      ;; 36:4CA3 $FE $D0
    ret  nc                                       ;; 36:4CA5 $D0

    ldh  a, [hActiveEntityPosX]                   ;; 36:4CA6 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 36:4CA8 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 36:4CAA $F0 $EC
    add  $0C                                      ;; 36:4CAC $C6 $0C
    ldh  [hMultiPurpose1], a                      ;; 36:4CAE $E0 $D8
    call label_D15                                ;; 36:4CB0 $CD $15 $0D
    ret                                           ;; 36:4CB3 $C9

Data_036_4CB4::
    db   $1C, $28

; Color Dungeon Boss
HardhitBeetleEntityHandler::
    call label_394D                               ;; 36:4CB6 $CD $4D $39
    ld   a, c                                     ;; 36:4CB9 $79
    ld   [wD202], a                               ;; 36:4CBA $EA $02 $D2
    call func_036_4F4E                            ;; 36:4CBD $CD $4E $4F
    ldh  a, [hActiveEntityStatus]                 ;; 36:4CC0 $F0 $EA
    cp   $05                                      ;; 36:4CC2 $FE $05
    jp   nz, AnimateBossAgony_1836                ;; 36:4CC4 $C2 $3C $5C

    ldh  a, [hFrameCounter]                       ;; 36:4CC7 $F0 $E7
    and  $1F                                      ;; 36:4CC9 $E6 $1F
    jr   nz, .jr_4CD5                             ;; 36:4CCB $20 $08

    call PointHLToEntitySpriteVariant             ;; 36:4CCD $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4CD0 $7E
    inc  a                                        ;; 36:4CD1 $3C
    and  $01                                      ;; 36:4CD2 $E6 $01
    ld   [hl], a                                  ;; 36:4CD4 $77

.jr_4CD5
    call BossIntro                                ;; 36:4CD5 $CD $E8 $3E
    call ReturnIfNonInteractive_36                ;; 36:4CD8 $CD $40 $6A
    call UpdateEntityPosWithSpeed_36              ;; 36:4CDB $CD $62 $6A
    ld   de, Data_036_4CB4                        ;; 36:4CDE $11 $B4 $4C
    call func_036_6C90                            ;; 36:4CE1 $CD $90 $6C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:4CE4 $CD $39 $3B
    ld   a, [wC190]                               ;; 36:4CE7 $FA $90 $C1
    and  a                                        ;; 36:4CEA $A7
    ret  z                                        ;; 36:4CEB $C8

    call func_036_4D03                            ;; 36:4CEC $CD $03 $4D
    call func_036_4D4B                            ;; 36:4CEF $CD $4B $4D
    ldh  a, [hActiveEntityState]                  ;; 36:4CF2 $F0 $F0
    JP_TABLE                                      ;; 36:4CF4
._00 dw AvalaunchState0Handler                             ;; 36:4CF5
._01 dw AvalaunchState1Handler                             ;; 36:4CF7
._02 dw func_036_4DB7                             ;; 36:4CF9
._03 dw func_036_4DCF                             ;; 36:4CFB
._04 dw func_036_4E27                             ;; 36:4CFD
._05 dw func_036_4DCF                             ;; 36:4CFF
._06 dw func_036_4EA2                             ;; 36:4D01

func_036_4D03::
    ld   hl, wEntitiesHealthTable                 ;; 36:4D03 $21 $60 $C3
    add  hl, bc                                   ;; 36:4D06 $09
    ld   a, [hl]                                  ;; 36:4D07 $7E
    cp   $10                                      ;; 36:4D08 $FE $10
    jr   nz, .jr_4D13                             ;; 36:4D0A $20 $07

    ld   hl, wEntitiesPrivateState1Table          ;; 36:4D0C $21 $B0 $C2
    add  hl, bc                                   ;; 36:4D0F $09
    ld   [hl], $00                                ;; 36:4D10 $36 $00
    ret                                           ;; 36:4D12 $C9

.jr_4D13
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:4D13 $21 $20 $C4
    add  hl, bc                                   ;; 36:4D16 $09
    ld   a, [hl]                                  ;; 36:4D17 $7E
    and  a                                        ;; 36:4D18 $A7
    ret  nz                                       ;; 36:4D19 $C0

    call GetEntityPrivateCountdown1               ;; 36:4D1A $CD $00 $0C
    ret  nz                                       ;; 36:4D1D $C0

    ld   hl, wEntitiesPrivateState2Table          ;; 36:4D1E $21 $C0 $C2
    add  hl, bc                                   ;; 36:4D21 $09
    ld   a, [hl]                                  ;; 36:4D22 $7E
    and  a                                        ;; 36:4D23 $A7
    jr   z, .jr_4D28                              ;; 36:4D24 $28 $02

    dec  [hl]                                     ;; 36:4D26 $35
    ret                                           ;; 36:4D27 $C9

.jr_4D28
    ld   hl, wEntitiesHealthTable                 ;; 36:4D28 $21 $60 $C3
    add  hl, bc                                   ;; 36:4D2B $09
    inc  [hl]                                     ;; 36:4D2C $34
    ld   a, [hl]                                  ;; 36:4D2D $7E
    cp   $10                                      ;; 36:4D2E $FE $10
    jr   nz, jr_036_4D6E                          ;; 36:4D30 $20 $3C

    call_open_dialog Dialog26F                    ;; 36:4D32
    jr   jr_036_4D6E                              ;; 36:4D37 $18 $35

ColorDungeonBossPalette::
    rgb   #F80000, #F80000, #F84000, #F88000, #F8C000, #88C808, #20D010, #009070, #2828F8

func_036_4D4B::
    call DecrementEntityIgnoreHitsCountdown       ;; 36:4D4B $CD $56 $0C
    ld   a, [hl]                                  ;; 36:4D4E $7E
    and  a                                        ;; 36:4D4F $A7
    jr   nz, .jr_4D5C                             ;; 36:4D50 $20 $0A

    ld   hl, wEntitiesFlashCountdownTable         ;; 36:4D52 $21 $20 $C4
    add  hl, bc                                   ;; 36:4D55 $09
    ld   a, [hl]                                  ;; 36:4D56 $7E
    and  a                                        ;; 36:4D57 $A7
    ret  z                                        ;; 36:4D58 $C8

    ld   [hl], $00                                ;; 36:4D59 $36 $00
    ret                                           ;; 36:4D5B $C9

.jr_4D5C
    ld   a, $10                                   ;; 36:4D5C $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 36:4D5E $EA $3E $C1
    ld   a, $14                                   ;; 36:4D61 $3E $14
    call GetVectorTowardsLink_trampoline          ;; 36:4D63 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 36:4D66 $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 36:4D68 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 36:4D6A $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 36:4D6C $E0 $9A

jr_036_4D6E:
    ld   hl, wEntitiesHealthTable                 ;; 36:4D6E $21 $60 $C3
    add  hl, bc                                   ;; 36:4D71 $09
    ld   a, [hl]                                  ;; 36:4D72 $7E
    and  $FE                                      ;; 36:4D73 $E6 $FE
    ld   e, a                                     ;; 36:4D75 $5F
    ld   d, $00                                   ;; 36:4D76 $16 $00
    ld   hl, ColorDungeonBossPalette              ;; 36:4D78 $21 $39 $4D
    add  hl, de                                   ;; 36:4D7B $19
    ld   a, [wObjPal8 + 2*2]                      ;; 36:4D7C $FA $8C $DC
    cp   [hl]                                     ;; 36:4D7F $BE
    jr   nz, .jr_4D89                             ;; 36:4D80 $20 $07

    inc  hl                                       ;; 36:4D82 $23
    ld   a, [wObjPal8 + 2*2+1]                    ;; 36:4D83 $FA $8D $DC
    cp   [hl]                                     ;; 36:4D86 $BE
    ret  z                                        ;; 36:4D87 $C8

    dec  hl                                       ;; 36:4D88 $2B

.jr_4D89
    ld   e, l                                     ;; 36:4D89 $5D
    ld   d, h                                     ;; 36:4D8A $54
    ld   hl, rSVBK                                ;; 36:4D8B $21 $70 $FF
    ld   a, [de]                                  ;; 36:4D8E $1A
    ld   [wObjPal8 + 2*2], a                      ;; 36:4D8F $EA $8C $DC
    ld   [hl], $02                                ;; 36:4D92 $36 $02
    ld   [wObjPal8 + 2*2], a                      ;; 36:4D94 $EA $8C $DC
    ld   [hl], $00                                ;; 36:4D97 $36 $00
    inc  de                                       ;; 36:4D99 $13
    ld   a, [de]                                  ;; 36:4D9A $1A
    ld   [wObjPal8 + 2*2+1], a                    ;; 36:4D9B $EA $8D $DC
    ld   [hl], $02                                ;; 36:4D9E $36 $02
    ld   [wObjPal8 + 2*2+1], a                    ;; 36:4DA0 $EA $8D $DC
    ld   [hl], $00                                ;; 36:4DA3 $36 $00
    ld   a, $02                                   ;; 36:4DA5 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 36:4DA7 $EA $D1 $DD
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 36:4DAA $21 $F0 $C2
    add  hl, bc                                   ;; 36:4DAD $09
    ld   [hl], $60                                ;; 36:4DAE $36 $60
    ld   hl, wEntitiesPrivateState2Table          ;; 36:4DB0 $21 $C0 $C2
    add  hl, bc                                   ;; 36:4DB3 $09
    ld   [hl], $04                                ;; 36:4DB4 $36 $04
    ret                                           ;; 36:4DB6 $C9

func_036_4DB7::
    push bc                                       ;; 36:4DB7 $C5
    sla  c                                        ;; 36:4DB8 $CB $21
    sla  c                                        ;; 36:4DBA $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 36:4DBC $21 $80 $D5
    add  hl, bc                                   ;; 36:4DBF $09
    inc  hl                                       ;; 36:4DC0 $23
    inc  hl                                       ;; 36:4DC1 $23
    inc  hl                                       ;; 36:4DC2 $23
    ld   [hl], $14                                ;; 36:4DC3 $36 $14
    pop  bc                                       ;; 36:4DC5 $C1
    call_open_dialog Dialog26D                    ;; 36:4DC6
    call IncrementEntityState                     ;; 36:4DCB $CD $12 $3B
    ret                                           ;; 36:4DCE $C9

func_036_4DCF::
    ld   a, [wDialogState]                        ;; 36:4DCF $FA $9F $C1
    and  a                                        ;; 36:4DD2 $A7
    ret  nz                                       ;; 36:4DD3 $C0

    call IncrementEntityState                     ;; 36:4DD4 $CD $12 $3B
    ret                                           ;; 36:4DD7 $C9

func_036_4DD8::
    ldh  a, [hFrameCounter]                       ;; 36:4DD8 $F0 $E7
    and  $0F                                      ;; 36:4DDA $E6 $0F
    ret  nz                                       ;; 36:4DDC $C0

    call GetRandomByte                            ;; 36:4DDD $CD $0D $28
    and  $07                                      ;; 36:4DE0 $E6 $07
    ret  nz                                       ;; 36:4DE2 $C0

    call func_036_4E7F                            ;; 36:4DE3 $CD $7F $4E
    and  a                                        ;; 36:4DE6 $A7
    ret  nz                                       ;; 36:4DE7 $C0

    push bc                                       ;; 36:4DE8 $C5
    ld   a, ENTITY_BOUNCING_BOULDER               ;; 36:4DE9 $3E $F5
    call SpawnNewEntity_trampoline                ;; 36:4DEB $CD $86 $3B
    jr   c, .jr_4E1B                              ;; 36:4DEE $38 $2B

    ld   hl, wEntitiesStateTable                  ;; 36:4DF0 $21 $90 $C2
    add  hl, de                                   ;; 36:4DF3 $19
    ld   [hl], $04                                ;; 36:4DF4 $36 $04
    call PointHLToEntityPosX                      ;; 36:4DF6 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:4DF9 $7E
    ld   hl, wEntitiesPosXTable                   ;; 36:4DFA $21 $00 $C2
    add  hl, de                                   ;; 36:4DFD $19
    ld   [hl], a                                  ;; 36:4DFE $77
    call PointHLToEntityPosY                      ;; 36:4DFF $CD $28 $6C
    ld   a, [hl]                                  ;; 36:4E02 $7E
    ld   hl, wEntitiesPosYTable                   ;; 36:4E03 $21 $10 $C2
    add  hl, de                                   ;; 36:4E06 $19
    ld   [hl], a                                  ;; 36:4E07 $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:4E08 $21 $40 $C3
    add  hl, de                                   ;; 36:4E0B $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 36:4E0C $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ;; 36:4E0E $21 $50 $C3
    add  hl, de                                   ;; 36:4E11 $19
    set  7, [hl]                                  ;; 36:4E12 $CB $FE
    ld   c, e                                     ;; 36:4E14 $4B
    ld   b, d                                     ;; 36:4E15 $42
    ld   a, $10                                   ;; 36:4E16 $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 36:4E18 $CD $AA $3B

.jr_4E1B
    pop  bc                                       ;; 36:4E1B $C1
    ret                                           ;; 36:4E1C $C9

Data_036_4E1D::
    db   $FA, $FC

Data_036_4E1F::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

func_036_4E27::
    call func_036_4DD8                            ;; 36:4E27 $CD $D8 $4D
    ld   hl, wEntitiesHealthTable                 ;; 36:4E2A $21 $60 $C3
    add  hl, bc                                   ;; 36:4E2D $09
    ld   a, [hl]                                  ;; 36:4E2E $7E
    and  a                                        ;; 36:4E2F $A7
    jr   z, jr_036_4E5C                           ;; 36:4E30 $28 $2A

    ld   hl, wEntitiesPrivateState1Table          ;; 36:4E32 $21 $B0 $C2
    add  hl, bc                                   ;; 36:4E35 $09
    cp   $02                                      ;; 36:4E36 $FE $02
    jr   nc, .jr_4E42                             ;; 36:4E38 $30 $08

    ld   a, [hl]                                  ;; 36:4E3A $7E
    dec  a                                        ;; 36:4E3B $3D
    and  a                                        ;; 36:4E3C $A7
    jr   nz, .jr_4E42                             ;; 36:4E3D $20 $03

    inc  [hl]                                     ;; 36:4E3F $34
    jr   jr_036_4E50                              ;; 36:4E40 $18 $0E

.jr_4E42
    cp   $05                                      ;; 36:4E42 $FE $05
    jr   nc, jr_036_4E5C                          ;; 36:4E44 $30 $16

    ld   a, [hl]                                  ;; 36:4E46 $7E
    and  a                                        ;; 36:4E47 $A7
    jr   nz, jr_036_4E5C                          ;; 36:4E48 $20 $12

    inc  [hl]                                     ;; 36:4E4A $34
    call_open_dialog Dialog26E                    ;; 36:4E4B

jr_036_4E50:
    call PointHLToEntitySpeedX                    ;; 36:4E50 $CD $EE $6B
    ld   [hl], a                                  ;; 36:4E53 $77
    call PointHLToEntitySpeedY                    ;; 36:4E54 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:4E57 $77
    call IncrementEntityState                     ;; 36:4E58 $CD $12 $3B
    ret                                           ;; 36:4E5B $C9

jr_036_4E5C:
    call GetEntityTransitionCountdown             ;; 36:4E5C $CD $05 $0C
    ret  nz                                       ;; 36:4E5F $C0

    call GetRandomByte                            ;; 36:4E60 $CD $0D $28
    and  $3F                                      ;; 36:4E63 $E6 $3F
    add  $30                                      ;; 36:4E65 $C6 $30
    ld   [hl], a                                  ;; 36:4E67 $77
    and  $07                                      ;; 36:4E68 $E6 $07
    ld   e, a                                     ;; 36:4E6A $5F
    ld   d, b                                     ;; 36:4E6B $50
    ld   hl, Data_036_4E1F                        ;; 36:4E6C $21 $1F $4E
    add  hl, de                                   ;; 36:4E6F $19
    ld   a, [hl]                                  ;; 36:4E70 $7E
    call PointHLToEntitySpeedX                    ;; 36:4E71 $CD $EE $6B
    ld   [hl], a                                  ;; 36:4E74 $77
    ld   hl, Data_036_4E1D                        ;; 36:4E75 $21 $1D $4E
    add  hl, de                                   ;; 36:4E78 $19
    ld   a, [hl]                                  ;; 36:4E79 $7E
    call PointHLToEntitySpeedY                    ;; 36:4E7A $CD $F3 $6B
    ld   [hl], a                                  ;; 36:4E7D $77
    ret                                           ;; 36:4E7E $C9

func_036_4E7F::
    xor  a                                        ;; 36:4E7F $AF
    ldh  [hMultiPurpose0], a                      ;; 36:4E80 $E0 $D7
    ld   e, a                                     ;; 36:4E82 $5F
    ld   d, a                                     ;; 36:4E83 $57

jr_036_4E84:
    ld   hl, wEntitiesTypeTable                   ;; 36:4E84 $21 $A0 $C3
    add  hl, de                                   ;; 36:4E87 $19
    ld   a, [hl]                                  ;; 36:4E88 $7E
    cp   $1A                                      ;; 36:4E89 $FE $1A
    jr   nz, .jr_4E99                             ;; 36:4E8B $20 $0C

    ld   hl, wEntitiesStatusTable                 ;; 36:4E8D $21 $80 $C2
    add  hl, de                                   ;; 36:4E90 $19
    ld   a, [hl]                                  ;; 36:4E91 $7E
    and  a                                        ;; 36:4E92 $A7
    jr   z, .jr_4E99                              ;; 36:4E93 $28 $04

    ld   hl, hMultiPurpose0                       ;; 36:4E95 $21 $D7 $FF
    inc  [hl]                                     ;; 36:4E98 $34

.jr_4E99
    inc  de                                       ;; 36:4E99 $13
    ld   a, e                                     ;; 36:4E9A $7B
    and  $0F                                      ;; 36:4E9B $E6 $0F
    jr   nz, jr_036_4E84                          ;; 36:4E9D $20 $E5

    ldh  a, [hMultiPurpose0]                      ;; 36:4E9F $F0 $D7
    ret                                           ;; 36:4EA1 $C9

func_036_4EA2::
    call func_036_4E7F                            ;; 36:4EA2 $CD $7F $4E
    cp   $02                                      ;; 36:4EA5 $FE $02
    jr   z, .jr_4EE4                              ;; 36:4EA7 $28 $3B

    ld   a, ENTITY_STALFOS_AGGRESSIVE             ;; 36:4EA9 $3E $1A
    call SpawnNewEntity_trampoline                ;; 36:4EAB $CD $86 $3B
    jr   c, .jr_4EE4                              ;; 36:4EAE $38 $34

    ldh  a, [hLinkPositionX]                      ;; 36:4EB0 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 36:4EB2 $21 $00 $C2
    add  hl, de                                   ;; 36:4EB5 $19
    ld   [hl], a                                  ;; 36:4EB6 $77
    ldh  a, [hLinkPositionY]                      ;; 36:4EB7 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 36:4EB9 $21 $10 $C2
    add  hl, de                                   ;; 36:4EBC $19
    ld   [hl], a                                  ;; 36:4EBD $77
    ld   hl, wEntitiesPosZTable                   ;; 36:4EBE $21 $10 $C3
    add  hl, de                                   ;; 36:4EC1 $19
    ld   [hl], $30                                ;; 36:4EC2 $36 $30
    ld   hl, wEntitiesSpeedZTable                 ;; 36:4EC4 $21 $20 $C3
    add  hl, de                                   ;; 36:4EC7 $19
    ld   [hl], $C0                                ;; 36:4EC8 $36 $C0
    ld   hl, wEntitiesSpriteVariantTable          ;; 36:4ECA $21 $B0 $C3
    add  hl, de                                   ;; 36:4ECD $19
    ld   [hl], $02                                ;; 36:4ECE $36 $02
    ld   hl, wEntitiesHealthTable                 ;; 36:4ED0 $21 $60 $C3
    add  hl, de                                   ;; 36:4ED3 $19
    ld   [hl], $02                                ;; 36:4ED4 $36 $02
    ld   hl, wEntitiesStateTable                  ;; 36:4ED6 $21 $90 $C2
    add  hl, de                                   ;; 36:4ED9 $19
    ld   [hl], $03                                ;; 36:4EDA $36 $03
    ld   hl, wEntitiesHealthTable                 ;; 36:4EDC $21 $60 $C3
    add  hl, bc                                   ;; 36:4EDF $09
    ld   a, [hl]                                  ;; 36:4EE0 $7E
    cp   $04                                      ;; 36:4EE1 $FE $04
    ret  nc                                       ;; 36:4EE3 $D0

.jr_4EE4
    ld   a, $04                                   ;; 36:4EE4 $3E $04
    call SetEntityState                           ;; 36:4EE6 $CD $07 $6C
    ret                                           ;; 36:4EE9 $C9

Data_036_4EEA::
    db   $F0, $F8, $60, $07, $F0, $00, $62, $07   ;; 36:4EEA
    db   $F0, $08, $62, $27, $F0, $10, $60, $27   ;; 36:4EF2
    db   $00, $F8, $64, $07, $00, $00, $66, $07   ;; 36:4EFA
    db   $00, $08, $66, $27, $00, $10, $64, $27   ;; 36:4F02
    db   $10, $F8, $68, $06, $10, $00, $6A, $06   ;; 36:4F0A
    db   $10, $08, $6C, $06, $10, $10, $6E, $06   ;; 36:4F12

Data_036_4F1A::
    db   $F0, $F8, $60, $07, $F0, $00, $62, $07   ;; 36:4F1A
    db   $F0, $08, $62, $27, $F0, $10, $60, $27   ;; 36:4F22
    db   $00, $F8, $64, $07, $00, $00, $66, $07   ;; 36:4F2A
    db   $00, $08, $66, $27, $00, $10, $64, $27   ;; 36:4F32
    db   $10, $F8, $6E, $26, $10, $00, $6C, $26   ;; 36:4F3A
    db   $10, $08, $6A, $26, $10, $10, $68, $26   ;; 36:4F42

Data_036_4F4A::
    dw   Data_036_4EEA
    dw   Data_036_4F1A

func_036_4F4E::
    call PointHLToEntitySpriteVariant             ;; 36:4F4E $CD $02 $6C
    ld   a, [hl]                                  ;; 36:4F51 $7E
    sla  a                                        ;; 36:4F52 $CB $27
    ld   e, a                                     ;; 36:4F54 $5F
    ld   d, $00                                   ;; 36:4F55 $16 $00
    ld   hl, Data_036_4F4A                        ;; 36:4F57 $21 $4A $4F
    call func_036_6C7E                            ;; 36:4F5A $CD $7E $6C
    ld   c, $0C                                   ;; 36:4F5D $0E $0C
    call RenderActiveEntitySpritesRect            ;; 36:4F5F $CD $E6 $3C
    ld   a, $0C                                   ;; 36:4F62 $3E $0C
    call func_015_7964_trampoline                 ;; 36:4F64 $CD $A0 $3D
    ret                                           ;; 36:4F67 $C9

func_036_4F68::
    ld   a, [wCurrentBank]                        ;; 36:4F68 $FA $AF $DB
    push af                                       ;; 36:4F6B $F5

IF __PATCH_0__
    ld   a, $09
    ld   hl, wEntitiesHealthGroup
    add  hl, bc
    ld   [hl], a
ENDC

    ld   a, $36                                   ;; 36:4F6C $3E $36
    ld   [wCurrentBank], a                        ;; 36:4F6E $EA $AF $DB
    ld   hl, wEntitiesPrivateState2Table          ;; 36:4F71 $21 $C0 $C2
    add  hl, bc                                   ;; 36:4F74 $09
    ld   a, [hl]                                  ;; 36:4F75 $7E
    ld   hl, Data_020_6A20                        ;; 36:4F76 $21 $20 $6A
    and  a                                        ;; 36:4F79 $A7
    jr   nz, .jr_4F7F                             ;; 36:4F7A $20 $03

    ld   hl, Data_020_6A28                        ;; 36:4F7C $21 $28 $6A

.jr_4F7F
    ld   c, $02                                   ;; 36:4F7F $0E $02
    ld   a, $36                                   ;; 36:4F81 $3E $36
    call func_A5F                                 ;; 36:4F83 $CD $5F $0A
    ld   a, $02                                   ;; 36:4F86 $3E $02
    call func_015_7964_trampoline                 ;; 36:4F88 $CD $A0 $3D
    ld   hl, wEntitiesPrivateState1Table          ;; 36:4F8B $21 $B0 $C2
    add  hl, bc                                   ;; 36:4F8E $09
    ld   a, [hl]                                  ;; 36:4F8F $7E
    and  a                                        ;; 36:4F90 $A7
    jr   z, .jr_4F96                              ;; 36:4F91 $28 $03

    call UnloadEntity                             ;; 36:4F93 $CD $8D $3F

.jr_4F96
    pop  af                                       ;; 36:4F96 $F1
    ld   [wCurrentBank], a                        ;; 36:4F97 $EA $AF $DB
    ret                                           ;; 36:4F9A $C9

func_036_4F9B::
    ld   a, [wD202]                               ;; 36:4F9B $FA $02 $D2
    ld   e, a                                     ;; 36:4F9E $5F
    ld   d, $00                                   ;; 36:4F9F $16 $00
    ld   hl, wEntitiesStatusTable                 ;; 36:4FA1 $21 $80 $C2
    add  hl, de                                   ;; 36:4FA4 $19
    ld   a, [hl]                                  ;; 36:4FA5 $7E
    cp   $01                                      ;; 36:4FA6 $FE $01
    jr   nz, .jr_4FB1                             ;; 36:4FA8 $20 $07

    call ClearEntityStatus_36                     ;; 36:4FAA $CD $89 $6C
    call func_036_5CAB                            ;; 36:4FAD $CD $AB $5C
    ret                                           ;; 36:4FB0 $C9

.jr_4FB1
    ld   a, [wCurrentBank]                        ;; 36:4FB1 $FA $AF $DB
    push af                                       ;; 36:4FB4 $F5
    ld   a, $36                                   ;; 36:4FB5 $3E $36
    ld   [wCurrentBank], a                        ;; 36:4FB7 $EA $AF $DB
    ld   hl, Data_020_6A10                        ;; 36:4FBA $21 $10 $6A
    ld   c, $02                                   ;; 36:4FBD $0E $02
    ld   a, $36                                   ;; 36:4FBF $3E $36
    call func_A5F                                 ;; 36:4FC1 $CD $5F $0A
    ld   a, $02                                   ;; 36:4FC4 $3E $02
    call func_015_7964_trampoline                 ;; 36:4FC6 $CD $A0 $3D
    pop  af                                       ;; 36:4FC9 $F1
    ld   [wCurrentBank], a                        ;; 36:4FCA $EA $AF $DB
    call ReturnIfNonInteractive_36                ;; 36:4FCD $CD $40 $6A
    ld   a, [wCurrentBank]                        ;; 36:4FD0 $FA $AF $DB
    push af                                       ;; 36:4FD3 $F5
    ld   a, $36                                   ;; 36:4FD4 $3E $36
    ld   [wCurrentBank], a                        ;; 36:4FD6 $EA $AF $DB
    call label_3CD9                               ;; 36:4FD9 $CD $D9 $3C
    call PointHLToEntitySpeedX                    ;; 36:4FDC $CD $EE $6B
    ld   a, [hl]                                  ;; 36:4FDF $7E
    rlca                                          ;; 36:4FE0 $07
    rlca                                          ;; 36:4FE1 $07
    and  $01                                      ;; 36:4FE2 $E6 $01
    call SetEntitySpriteVariant                   ;; 36:4FE4 $CD $0C $3B
    call UpdateEntityPosWithSpeed_36              ;; 36:4FE7 $CD $62 $6A
    call func_036_5000                            ;; 36:4FEA $CD $00 $50
    ld   a, [wIsLinkInTheAir]                     ;; 36:4FED $FA $46 $C1
    and  a                                        ;; 36:4FF0 $A7
    jr   z, .jr_4FFB                              ;; 36:4FF1 $28 $08

    call CheckLinkCollisionWithEnemy_trampoline   ;; 36:4FF3 $CD $5A $3B
    jr   nc, .jr_4FFB                             ;; 36:4FF6 $30 $03

    call func_036_503C                            ;; 36:4FF8 $CD $3C $50

.jr_4FFB
    pop  af                                       ;; 36:4FFB $F1
    ld   [wCurrentBank], a                        ;; 36:4FFC $EA $AF $DB
    ret                                           ;; 36:4FFF $C9

func_036_5000::
    ldh  a, [hActiveEntityState]                  ;; 36:5000 $F0 $F0
    JP_TABLE                                      ;; 36:5002
._00 dw func_036_5007                             ;; 36:5003
._01 dw func_036_501C                             ;; 36:5005

func_036_5007::
    call PointHLToEntityPosY                      ;; 36:5007 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:500A $7E
    cp   $50                                      ;; 36:500B $FE $50
    jr   c, .ret_501B                             ;; 36:500D $38 $0C

    xor  a                                        ;; 36:500F $AF
    call PointHLToEntitySpeedX                    ;; 36:5010 $CD $EE $6B
    ld   [hl], a                                  ;; 36:5013 $77
    call PointHLToEntitySpeedY                    ;; 36:5014 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:5017 $77
    call IncrementEntityState                     ;; 36:5018 $CD $12 $3B

.ret_501B
    ret                                           ;; 36:501B $C9

func_036_501C::
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:501C $CD $23 $3B
    call GetEntityTransitionCountdown             ;; 36:501F $CD $05 $0C
    ret  nz                                       ;; 36:5022 $C0

    ld   [hl], $30                                ;; 36:5023 $36 $30
    call GetRandomByte                            ;; 36:5025 $CD $0D $28
    and  $0F                                      ;; 36:5028 $E6 $0F
    sub  $08                                      ;; 36:502A $D6 $08
    call PointHLToEntitySpeedX                    ;; 36:502C $CD $EE $6B
    ld   [hl], a                                  ;; 36:502F $77
    call GetRandomByte                            ;; 36:5030 $CD $0D $28
    and  $0F                                      ;; 36:5033 $E6 $0F
    sub  $08                                      ;; 36:5035 $D6 $08
    call PointHLToEntitySpeedY                    ;; 36:5037 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:503A $77
    ret                                           ;; 36:503B $C9

func_036_503C::
    call ClearEntityStatus_36                     ;; 36:503C $CD $89 $6C
    ld   a, WAVE_SFX_SEASHELL                     ;; 36:503F $3E $01
    ldh  [hWaveSfx], a                            ;; 36:5041 $E0 $F3
    ld   d, $0C                                   ;; 36:5043 $16 $0C
    call GiveInventoryItem_trampoline             ;; 36:5045 $CD $6B $3E
    ld   a, REPLACE_TILES_MAGIC_POWDER            ;; 36:5048 $3E $0B
    ldh  [hReplaceTiles], a                       ;; 36:504A $E0 $A5
    ld   hl, wMaxMagicPowder                      ;; 36:504C $21 $76 $DB
    ld   de, wMagicPowderCount                    ;; 36:504F $11 $4C $DB
    ld   a, [de]                                  ;; 36:5052 $1A
    cp   [hl]                                     ;; 36:5053 $BE
    jr   nc, ret_036_505E                         ;; 36:5054 $30 $08

    add  $10                                      ;; 36:5056 $C6 $10
    daa                                           ;; 36:5058 $27
    cp   [hl]                                     ;; 36:5059 $BE
    jr   c, .jr_505D                              ;; 36:505A $38 $01

    ld   a, [hl]                                  ;; 36:505C $7E

.jr_505D
    ld   [de], a                                  ;; 36:505D $12

ret_036_505E:
    ret                                           ;; 36:505E $C9

; @TODO Big Fairy in the Color Dungeon
func_036_505F::
    ld   hl, Data_020_69E0                        ;; 36:505F $21 $E0 $69
    ldh  a, [hFrameCounter]                       ;; 36:5062 $F0 $E7
    and  $08                                      ;; 36:5064 $E6 $08
    jr   z, .jr_506B                              ;; 36:5066 $28 $03

    ld   hl, Data_020_69F8                        ;; 36:5068 $21 $F8 $69

.jr_506B
    ld   c, $06                                   ;; 36:506B $0E $06
    ld   a, $36                                   ;; 36:506D $3E $36
    call func_A5F                                 ;; 36:506F $CD $5F $0A
    ld   a, [wCurrentBank]                        ;; 36:5072 $FA $AF $DB
    push af                                       ;; 36:5075 $F5
    ld   a, $36                                   ;; 36:5076 $3E $36
    ld   [wCurrentBank], a                        ;; 36:5078 $EA $AF $DB
    ld   a, $06                                   ;; 36:507B $3E $06
    call func_015_7964_trampoline                 ;; 36:507D $CD $A0 $3D
    call label_3CD9                               ;; 36:5080 $CD $D9 $3C
    pop  af                                       ;; 36:5083 $F1
    ld   [wCurrentBank], a                        ;; 36:5084 $EA $AF $DB
    ld   a, [wGameplayType]                       ;; 36:5087 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 36:508A $FE $0B
    ret  nz                                       ;; 36:508C $C0

    ld   a, [wTransitionSequenceCounter]          ;; 36:508D $FA $6B $C1
    cp   $04                                      ;; 36:5090 $FE $04
    ret  nz                                       ;; 36:5092 $C0

    ld   a, [wCurrentBank]                        ;; 36:5093 $FA $AF $DB
    push af                                       ;; 36:5096 $F5
    ld   a, $36                                   ;; 36:5097 $3E $36
    ld   [wCurrentBank], a                        ;; 36:5099 $EA $AF $DB
    call label_394D                               ;; 36:509C $CD $4D $39
    pop  af                                       ;; 36:509F $F1
    ld   [wCurrentBank], a                        ;; 36:50A0 $EA $AF $DB
    ld   e, $FE                                   ;; 36:50A3 $1E $FE
    ld   hl, wEntitiesInertiaTable                ;; 36:50A5 $21 $D0 $C3
    add  hl, bc                                   ;; 36:50A8 $09
    inc  [hl]                                     ;; 36:50A9 $34
    ld   a, [hl]                                  ;; 36:50AA $7E
    and  $40                                      ;; 36:50AB $E6 $40
    jr   z, .jr_50B1                              ;; 36:50AD $28 $02

    ld   e, $02                                   ;; 36:50AF $1E $02

.jr_50B1
    call PointHLToEntitySpeedZ                    ;; 36:50B1 $CD $F8 $6B
    ld   [hl], e                                  ;; 36:50B4 $73
    call func_036_6AEC                            ;; 36:50B5 $CD $EC $6A
    ld   a, [wCurrentBank]                        ;; 36:50B8 $FA $AF $DB
    push af                                       ;; 36:50BB $F5
    ld   a, $36                                   ;; 36:50BC $3E $36
    ld   [wCurrentBank], a                        ;; 36:50BE $EA $AF $DB
    call func_036_50C9                            ;; 36:50C1 $CD $C9 $50
    pop  af                                       ;; 36:50C4 $F1
    ld   [wCurrentBank], a                        ;; 36:50C5 $EA $AF $DB
    ret                                           ;; 36:50C8 $C9

func_036_50C9::
    ldh  a, [hActiveEntityState]                  ;; 36:50C9 $F0 $F0
     JP_TABLE                                      ;; 36:50CB
._00 dw TunicFairyState0                             ;; 36:50CC
._01 dw TunicFairyState1                             ;; 36:50CE
._02 dw TunicFairyState2                             ;; 36:50D0
._03 dw TunicFairyState3                             ;; 36:50D2
._04 dw TunicFairyState4                             ;; 36:50D4
._05 dw TunicFairyState5                             ;; 36:50D6
._06 dw TunicFairyState6                             ;; 36:50D8
._07 dw TunicFairyState7                             ;; 36:50DA
._08 dw TunicFairyState8                             ;; 36:50DC
._09 dw TunicFairyState9                             ;; 36:50DE
._0A dw TunicFairyStateA                             ;; 36:50E0
._0B dw TunicFairyStateB                             ;; 36:50E2

TunicFairyState0::
    call func_036_6B8A                            ;; 36:50E4 $CD $8A $6B
    cp   $10                                      ;; 36:50E7 $FE $10
    ret  nc                                       ;; 36:50E9 $D0

    call func_036_6B9A                            ;; 36:50EA $CD $9A $6B
    cp   $24                                      ;; 36:50ED $FE $24
    ret  nc                                       ;; 36:50EF $D0

    ldh  a, [hLinkDirection]                      ;; 36:50F0 $F0 $9E
    cp   $02                                      ;; 36:50F2 $FE $02
    ret  nz                                       ;; 36:50F4 $C0

    ld   hl, wItemUsageContext                    ;; 36:50F5 $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 36:50F8 $36 $01
    ldh  a, [hJoypadState]                        ;; 36:50FA $F0 $CC
    and  J_A                                      ;; 36:50FC $E6 $10
    ret  z                                        ;; 36:50FE $C8

    call_open_dialog Dialog268                    ;; 36:50FF
    xor  a                                        ;; 36:5104 $AF
    ld   [wC16C], a                               ;; 36:5105 $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ;; 36:5108 $EA $6B $C1
    ld   [wActivePowerUp], a                      ;; 36:510B $EA $7C $D4
    ld   hl, wEntitiesPrivateState1Table          ;; 36:510E $21 $B0 $C2
    add  hl, bc                                   ;; 36:5111 $09
    ld   [hl], a                                  ;; 36:5112 $77
    call IncrementEntityState                     ;; 36:5113 $CD $12 $3B
    ret                                           ;; 36:5116 $C9

TunicFairyState1::
    ld   a, [wDialogState]                        ;; 36:5117 $FA $9F $C1
    and  a                                        ;; 36:511A $A7
    ret  nz                                       ;; 36:511B $C0

    ld   a, [wDialogAskSelectionIndex]            ;; 36:511C $FA $77 $C1
    and  a                                        ;; 36:511F $A7
IF __PATCH_1__
    xor  $01
ENDC
    ld   hl, wEntitiesPrivateState2Table          ;; 36:5120 $21 $C0 $C2
    add  hl, bc                                   ;; 36:5123 $09
    ld   [hl], a                                  ;; 36:5124 $77
    ld_dialog_low e, Dialog25D ; "Are you sure?"  ;; 36:5125 $1E $5D
    and  a                                        ;; 36:5127 $A7
    jr   z, .jr_512C                              ;; 36:5128 $28 $02

    ld_dialog_low e, Dialog2AE ; "Are you sure?"  ;; 36:512A $1E $AE

.jr_512C
    ld   a, e                                     ;; 36:512C $7B
    call OpenDialogInTable2                       ;; 36:512D $CD $7C $23
    call IncrementEntityState                     ;; 36:5130 $CD $12 $3B
    ret                                           ;; 36:5133 $C9

TunicFairyState2::
    ld   a, [wDialogState]                        ;; 36:5134 $FA $9F $C1
    and  a                                        ;; 36:5137 $A7
    ret  nz                                       ;; 36:5138 $C0

    ld   a, [wDialogAskSelectionIndex]            ;; 36:5139 $FA $77 $C1
    and  a                                        ;; 36:513C $A7
    jr   nz, .jr_5148                             ;; 36:513D $20 $09

    ld   hl, wEntitiesPrivateState2Table          ;; 36:513F $21 $C0 $C2
    add  hl, bc                                   ;; 36:5142 $09
    ld   a, [hl]                                  ;; 36:5143 $7E
    call IncrementEntityState                     ;; 36:5144 $CD $12 $3B
    ret                                           ;; 36:5147 $C9

.jr_5148
    call_open_dialog Dialog25C                    ;; 36:5148
    ld   a, $01                                   ;; 36:514D $3E $01
    call SetEntityState                           ;; 36:514F $CD $07 $6C
    ret                                           ;; 36:5152 $C9

func_036_5153::
    ld   a, $36                                   ;; 36:5153 $3E $36
    call func_003_5A2E_trampoline                 ;; 36:5155 $CD $6B $0A
    ret                                           ;; 36:5158 $C9

TunicFairyState3::
    ld   a, $01                                   ;; 36:5159 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:515B $E0 $A1
    ld   a, [wDialogState]                        ;; 36:515D $FA $9F $C1
    and  a                                        ;; 36:5160 $A7
    ret  nz                                       ;; 36:5161 $C0

    ld   a, JINGLE_TREASURE_FOUND                 ;; 36:5162 $3E $01
    ldh  [hJingle], a                             ;; 36:5164 $E0 $F2
    ldh  a, [hLinkPositionX]                      ;; 36:5166 $F0 $98
    ld   a, ENTITY_BUZZ_BLOB                      ;; 36:5168 $3E $B9
    call SpawnNewEntity_trampoline                ;; 36:516A $CD $86 $3B
    ldh  a, [hLinkPositionX]                      ;; 36:516D $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 36:516F $21 $00 $C2
    add  hl, de                                   ;; 36:5172 $19
    ld   [hl], a                                  ;; 36:5173 $77
    ldh  a, [hLinkPositionY]                      ;; 36:5174 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 36:5176 $21 $10 $C2
    add  hl, de                                   ;; 36:5179 $19
    ld   [hl], a                                  ;; 36:517A $77
    ld   hl, wEntitiesPrivateState2Table          ;; 36:517B $21 $C0 $C2
    add  hl, bc                                   ;; 36:517E $09
    ld   a, [hl]                                  ;; 36:517F $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 36:5180 $21 $C0 $C2
    add  hl, de                                   ;; 36:5183 $19
    ld   [hl], a                                  ;; 36:5184 $77
    call func_036_5153                            ;; 36:5185 $CD $53 $51
    ld   a, $60                                   ;; 36:5188 $3E $60
    call SetEntityTransitionCountdown_36          ;; 36:518A $CD $83 $6C
    ld   hl, wEntitiesPrivateState3Table          ;; 36:518D $21 $D0 $C2
    add  hl, bc                                   ;; 36:5190 $09
    ld   [hl], e                                  ;; 36:5191 $73
    call IncrementEntityState                     ;; 36:5192 $CD $12 $3B
    ret                                           ;; 36:5195 $C9

TunicFairyState4::
    call func_036_5153                            ;; 36:5196 $CD $53 $51
    call GetEntityTransitionCountdown             ;; 36:5199 $CD $05 $0C
    ret  nz                                       ;; 36:519C $C0

    call_open_dialog Dialog26B                    ;; 36:519D
    call IncrementEntityState                     ;; 36:51A2 $CD $12 $3B
    ret                                           ;; 36:51A5 $C9

TunicFairyState5::
    ld   a, $02                                   ;; 36:51A6 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:51A8 $E0 $A1
    ld   [wC167], a                               ;; 36:51AA $EA $67 $C1
    call func_036_5153                            ;; 36:51AD $CD $53 $51
    ld   a, [wDialogState]                        ;; 36:51B0 $FA $9F $C1
    and  a                                        ;; 36:51B3 $A7
    ret  nz                                       ;; 36:51B4 $C0

    ld   hl, wEntitiesPrivateState3Table          ;; 36:51B5 $21 $D0 $C2
    add  hl, bc                                   ;; 36:51B8 $09
    ld   [hl], $00                                ;; 36:51B9 $36 $00
    call IncrementEntityState                     ;; 36:51BB $CD $12 $3B
    ret                                           ;; 36:51BE $C9

Data_036_51BF::
    db   $00, $08, $10, $18, $01, $09, $11, $19, $02, $0A, $12, $1A, $03, $0B, $13, $1B
    db   $04, $0C, $14, $1C, $05, $0D, $15, $1D, $06, $0E, $16, $1E, $07, $0F, $17, $1F

func_036_51DF::
    ld   a, $07                                   ;; 36:51DF $3E $07
    ldh  [hAnimatedTilesGroup], a                 ;; 36:51E1 $E0 $A4
    ld   hl, wEntitiesPrivateState3Table          ;; 36:51E3 $21 $D0 $C2
    add  hl, bc                                   ;; 36:51E6 $09
    ld   e, [hl]                                  ;; 36:51E7 $5E
    ld   d, $00                                   ;; 36:51E8 $16 $00
    ld   hl, Data_036_51BF                        ;; 36:51EA $21 $BF $51
    add  hl, de                                   ;; 36:51ED $19
    ld   e, [hl]                                  ;; 36:51EE $5E
    ld   hl, wAnimatedScrollingTilesStorage       ;; 36:51EF $21 $C0 $DC
    add  hl, de                                   ;; 36:51F2 $19
    ld   [hl], $00                                ;; 36:51F3 $36 $00
    ret                                           ;; 36:51F5 $C9

func_036_51F6::
    ldh  a, [hMultiPurpose0]                      ;; 36:51F6 $F0 $D7
    inc  a                                        ;; 36:51F8 $3C
    bit  5, a                                     ;; 36:51F9 $CB $6F
    jr   z, .jr_51FF                              ;; 36:51FB $28 $02

    ld   a, $1F                                   ;; 36:51FD $3E $1F

.jr_51FF
    ldh  [hMultiPurpose0], a                      ;; 36:51FF $E0 $D7
    ldh  a, [hMultiPurpose1]                      ;; 36:5201 $F0 $D8
    sub  $02                                      ;; 36:5203 $D6 $02
    and  a                                        ;; 36:5205 $A7
    jr   nz, .jr_520A                             ;; 36:5206 $20 $02

    ld   a, $02                                   ;; 36:5208 $3E $02

.jr_520A
    ldh  [hMultiPurpose1], a                      ;; 36:520A $E0 $D8
    ldh  a, [hMultiPurpose2]                      ;; 36:520C $F0 $D9
    sub  $04                                      ;; 36:520E $D6 $04
    cp   $14                                      ;; 36:5210 $FE $14
    jr   nc, .jr_5216                             ;; 36:5212 $30 $02

    ld   a, $14                                   ;; 36:5214 $3E $14

.jr_5216
    ldh  [hMultiPurpose2], a                      ;; 36:5216 $E0 $D9
    ret                                           ;; 36:5218 $C9

func_036_5219::
    ldh  a, [hMultiPurpose0]                      ;; 36:5219 $F0 $D7
    dec  a                                        ;; 36:521B $3D
    cp   $03                                      ;; 36:521C $FE $03
    jr   nc, .jr_5222                             ;; 36:521E $30 $02

    ld   a, $03                                   ;; 36:5220 $3E $03

.jr_5222
    ldh  [hMultiPurpose0], a                      ;; 36:5222 $E0 $D7
    ldh  a, [hMultiPurpose1]                      ;; 36:5224 $F0 $D8
    bit  5, a                                     ;; 36:5226 $CB $6F
    jr   nz, .jr_5234                             ;; 36:5228 $20 $0A

    add  $02                                      ;; 36:522A $C6 $02
    cp   $20                                      ;; 36:522C $FE $20
    jr   c, jr_036_523C                           ;; 36:522E $38 $0C

    ld   a, $20                                   ;; 36:5230 $3E $20
    jr   jr_036_523C                              ;; 36:5232 $18 $08

.jr_5234
    sub  $02                                      ;; 36:5234 $D6 $02
    cp   $20                                      ;; 36:5236 $FE $20
    jr   nc, jr_036_523C                          ;; 36:5238 $30 $02

    ld   a, $20                                   ;; 36:523A $3E $20

jr_036_523C:
    ldh  [hMultiPurpose1], a                      ;; 36:523C $E0 $D8
    ldh  a, [hMultiPurpose2]                      ;; 36:523E $F0 $D9
    add  $04                                      ;; 36:5240 $C6 $04
    bit  7, a                                     ;; 36:5242 $CB $7F
    jr   z, .jr_5248                              ;; 36:5244 $28 $02

    ld   a, $7C                                   ;; 36:5246 $3E $7C

.jr_5248
    ldh  [hMultiPurpose2], a                      ;; 36:5248 $E0 $D9
    ret                                           ;; 36:524A $C9

TunicFairyState6::
    ld   a, $02                                   ;; 36:524B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:524D $E0 $A1
    ld   [wC167], a                               ;; 36:524F $EA $67 $C1
    ldh  a, [hFrameCounter]                       ;; 36:5252 $F0 $E7
    and  $03                                      ;; 36:5254 $E6 $03
    ret  nz                                       ;; 36:5256 $C0

    ld   hl, wEntitiesPrivateState3Table          ;; 36:5257 $21 $D0 $C2
    add  hl, bc                                   ;; 36:525A $09
    inc  [hl]                                     ;; 36:525B $34
    ld   hl, wObjPal1 + 2*2                       ;; 36:525C $21 $54 $DC
    ld   a, [wTunicType]                          ;; 36:525F $FA $0F $DC
    and  a                                        ;; 36:5262 $A7
    jr   z, .jr_526E                              ;; 36:5263 $28 $09

    inc  a                                        ;; 36:5265 $3C
    swap a                                        ;; 36:5266 $CB $37
    srl  a                                        ;; 36:5268 $CB $3F
    ld   e, a                                     ;; 36:526A $5F
    ld   d, $00                                   ;; 36:526B $16 $00
    add  hl, de                                   ;; 36:526D $19

.jr_526E
    push hl                                       ;; 36:526E $E5
    ld   a, [hl]                                  ;; 36:526F $7E
    and  $1F                                      ;; 36:5270 $E6 $1F
    ldh  [hMultiPurpose0], a                      ;; 36:5272 $E0 $D7
    ld   a, [hl+]                                 ;; 36:5274 $2A
    and  $E0                                      ;; 36:5275 $E6 $E0
    swap a                                        ;; 36:5277 $CB $37
    ld   e, a                                     ;; 36:5279 $5F
    ld   a, [hl]                                  ;; 36:527A $7E
    and  $03                                      ;; 36:527B $E6 $03
    swap a                                        ;; 36:527D $CB $37
    or   e                                        ;; 36:527F $B3
    ldh  [hMultiPurpose1], a                      ;; 36:5280 $E0 $D8
    ld   a, [hl]                                  ;; 36:5282 $7E
    and  $7C                                      ;; 36:5283 $E6 $7C
    ldh  [hMultiPurpose2], a                      ;; 36:5285 $E0 $D9
    ld   hl, wEntitiesPrivateState2Table          ;; 36:5287 $21 $C0 $C2
    add  hl, bc                                   ;; 36:528A $09
    ld   a, [hl]                                  ;; 36:528B $7E
    and  a                                        ;; 36:528C $A7
    jr   nz, .jr_5294                             ;; 36:528D $20 $05

    call func_036_51F6                            ;; 36:528F $CD $F6 $51
    jr   jr_036_5297                              ;; 36:5292 $18 $03

.jr_5294
    call func_036_5219                            ;; 36:5294 $CD $19 $52

jr_036_5297:
    pop  hl                                       ;; 36:5297 $E1
    ldh  a, [hMultiPurpose0]                      ;; 36:5298 $F0 $D7
    ld   e, a                                     ;; 36:529A $5F
    ldh  a, [hMultiPurpose1]                      ;; 36:529B $F0 $D8
    and  $0E                                      ;; 36:529D $E6 $0E
    swap a                                        ;; 36:529F $CB $37
    or   e                                        ;; 36:52A1 $B3
    ld   [hl+], a                                 ;; 36:52A2 $22
    ldh  a, [hMultiPurpose1]                      ;; 36:52A3 $F0 $D8
    and  $30                                      ;; 36:52A5 $E6 $30
    swap a                                        ;; 36:52A7 $CB $37
    ld   e, a                                     ;; 36:52A9 $5F
    ldh  a, [hMultiPurpose2]                      ;; 36:52AA $F0 $D9
    or   e                                        ;; 36:52AC $B3
    ld   [hl], a                                  ;; 36:52AD $77
    ld   a, $02                                   ;; 36:52AE $3E $02
    ld   [wPaletteDataFlags], a                   ;; 36:52B0 $EA $D1 $DD
    call func_036_51DF                            ;; 36:52B3 $CD $DF $51
    ld   hl, wEntitiesPrivateState3Table          ;; 36:52B6 $21 $D0 $C2
    add  hl, bc                                   ;; 36:52B9 $09
    ld   a, [hl]                                  ;; 36:52BA $7E
    cp   $20                                      ;; 36:52BB $FE $20
    ret  nz                                       ;; 36:52BD $C0

    ld   hl, wEntitiesPrivateState2Table          ;; 36:52BE $21 $C0 $C2
    add  hl, bc                                   ;; 36:52C1 $09
    ld   a, [hl]                                  ;; 36:52C2 $7E
    inc  a                                        ;; 36:52C3 $3C
    ld   [wTunicType], a                          ;; 36:52C4 $EA $0F $DC
    ld   hl, wEntitiesPrivateState3Table          ;; 36:52C7 $21 $D0 $C2
    add  hl, bc                                   ;; 36:52CA $09
    ld   e, [hl]                                  ;; 36:52CB $5E
    ld   d, $00                                   ;; 36:52CC $16 $00
    ld   hl, wEntitiesPrivateState1Table          ;; 36:52CE $21 $B0 $C2
    add  hl, de                                   ;; 36:52D1 $19
    ld   [hl], $01                                ;; 36:52D2 $36 $01
    call IncrementEntityState                     ;; 36:52D4 $CD $12 $3B
    ret                                           ;; 36:52D7 $C9

TunicFairyState7::
    ld   a, $02                                   ;; 36:52D8 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:52DA $E0 $A1
    ld   [wC167], a                               ;; 36:52DC $EA $67 $C1
    ld   a, [wDialogState]                        ;; 36:52DF $FA $9F $C1
    and  a                                        ;; 36:52E2 $A7
    ret  nz                                       ;; 36:52E3 $C0

    xor  a                                        ;; 36:52E4 $AF
    ldh  [hAnimatedTilesGroup], a                 ;; 36:52E5 $E0 $A4
    ld_dialog_low e, Dialog25B ; "got the Red Clothes" ;; 36:52E7 $1E $5B
    ld   a, [wTunicType]                          ;; 36:52E9 $FA $0F $DC
    cp   TUNIC_RED                                ;; 36:52EC $FE $01
    jr   z, .jr_52F2                              ;; 36:52EE $28 $02

    ld_dialog_low e, Dialog25A ; "got the Blue Clothes" ;; 36:52F0 $1E $5A

.jr_52F2
    ld   a, e                                     ;; 36:52F2 $7B
    call OpenDialogInTable2                       ;; 36:52F3 $CD $7C $23
    call IncrementEntityState                     ;; 36:52F6 $CD $12 $3B
    ret                                           ;; 36:52F9 $C9

TunicFairyState8::
    ld   a, $02                                   ;; 36:52FA $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:52FC $E0 $A1
    ld   [wC167], a                               ;; 36:52FE $EA $67 $C1
    ld   a, [wDialogState]                        ;; 36:5301 $FA $9F $C1
    and  a                                        ;; 36:5304 $A7
    ret  nz                                       ;; 36:5305 $C0

    ldh  a, [hFrameCounter]                       ;; 36:5306 $F0 $E7
    and  $03                                      ;; 36:5308 $E6 $03
    ret  nz                                       ;; 36:530A $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 36:530B $21 $B0 $C2
    add  hl, bc                                   ;; 36:530E $09
    push hl                                       ;; 36:530F $E5
    ld   a, $36                                   ;; 36:5310 $3E $36
    call func_020_6D52_trampoline                 ;; 36:5312 $CD $83 $0A
    pop  hl                                       ;; 36:5315 $E1
    inc  [hl]                                     ;; 36:5316 $34
    ld   a, [hl]                                  ;; 36:5317 $7E
    cp   $60                                      ;; 36:5318 $FE $60
    ret  nz                                       ;; 36:531A $C0

    xor  a                                        ;; 36:531B $AF
    ld   [hl], a                                  ;; 36:531C $77
    ldh  [hBaseScrollX], a                        ;; 36:531D $E0 $96
    ldh  [hBaseScrollY], a                        ;; 36:531F $E0 $97
    ld   [wBGOriginLow], a                        ;; 36:5321 $EA $2F $C1
    ld   [wBGOriginHigh], a                       ;; 36:5324 $EA $2E $C1
    ld   hl, wLCDControl                          ;; 36:5327 $21 $FD $D6
    res  LCDCB_WINON, [hl]                        ;; 36:532A $CB $AE
    call IncrementEntityState                     ;; 36:532C $CD $12 $3B
    ret                                           ;; 36:532F $C9

Data_036_5330::
    db   $98, $00, $53, $7F, $98, $20, $53, $7F, $98, $40, $53, $7F, $98, $60, $53, $7F
    db   $98, $80, $53, $7F, $98, $A0, $53, $7F, $98, $C0, $53, $7F, $98, $E0, $53, $7F
    db   $99, $00, $53, $7F, $99, $20, $53, $7F, $99, $40, $53, $7F, $99, $60, $53, $7F
    db   $99, $80, $53, $7F, $99, $A0, $53, $7F, $99, $C0, $53, $7F, $99, $E0, $53, $7F
    db   $9A, $00, $53, $7F, $9A, $20, $53, $7F

Data_036_5378::
    db   $98, $00, $53, $00, $98, $20, $53, $00, $98, $40, $53, $00, $98, $60, $53, $00
    db   $98, $80, $53, $00, $98, $A0, $53, $00, $98, $C0, $53, $00, $98, $E0, $53, $00
    db   $99, $00, $53, $00, $99, $20, $53, $00, $99, $40, $53, $00, $99, $60, $53, $00
    db   $99, $80, $53, $00, $99, $A0, $53, $00, $99, $C0, $53, $00, $99, $E0, $53, $00
    db   $9A, $00, $53, $00, $9A, $20, $53, $00

TunicFairyState9::
    call func_036_5153                            ;; 36:53C0 $CD $53 $51
    push bc                                       ;; 36:53C3 $C5
    ld   hl, wEntitiesPrivateState1Table          ;; 36:53C4 $21 $B0 $C2
    add  hl, bc                                   ;; 36:53C7 $09
    ld   c, [hl]                                  ;; 36:53C8 $4E
    sla  c                                        ;; 36:53C9 $CB $21
    sla  c                                        ;; 36:53CB $CB $21
    sla  c                                        ;; 36:53CD $CB $21
    ld   hl, Data_036_5330                        ;; 36:53CF $21 $30 $53

.jr_53D2
    add  hl, bc                                   ;; 36:53D2 $09
    ld   c, l                                     ;; 36:53D3 $4D
    ld   b, h                                     ;; 36:53D4 $44
    ld   a, [wDrawCommandsSize]                   ;; 36:53D5 $FA $00 $D6
    ld   e, a                                     ;; 36:53D8 $5F
    add  $08                                      ;; 36:53D9 $C6 $08
    ld   [wDrawCommandsSize], a                   ;; 36:53DB $EA $00 $D6
    ld   d, $00                                   ;; 36:53DE $16 $00
    ld   hl, wDrawCommand                         ;; 36:53E0 $21 $01 $D6
    add  hl, de                                   ;; 36:53E3 $19
    ld   e, $08                                   ;; 36:53E4 $1E $08

.loop_53E6
    ld   a, [bc]                                  ;; 36:53E6 $0A
    inc  bc                                       ;; 36:53E7 $03
    ld   [hl+], a                                 ;; 36:53E8 $22
    dec  e                                        ;; 36:53E9 $1D
    jr   nz, .loop_53E6                           ;; 36:53EA $20 $FA

    ld   [hl], $00                                ;; 36:53EC $36 $00
    pop  bc                                       ;; 36:53EE $C1
    push bc                                       ;; 36:53EF $C5
    ld   hl, wEntitiesPrivateState1Table          ;; 36:53F0 $21 $B0 $C2
    add  hl, bc                                   ;; 36:53F3 $09
    ld   c, [hl]                                  ;; 36:53F4 $4E
    sla  c                                        ;; 36:53F5 $CB $21
    sla  c                                        ;; 36:53F7 $CB $21
    sla  c                                        ;; 36:53F9 $CB $21
    ld   hl, Data_036_5378                        ;; 36:53FB $21 $78 $53
    add  hl, bc                                   ;; 36:53FE $09
    ld   c, l                                     ;; 36:53FF $4D
    ld   b, h                                     ;; 36:5400 $44
    ld   a, [wDrawCommandsVRAM1Size]              ;; 36:5401 $FA $90 $DC
    ld   e, a                                     ;; 36:5404 $5F
    add  $08                                      ;; 36:5405 $C6 $08
    ld   [wDrawCommandsVRAM1Size], a              ;; 36:5407 $EA $90 $DC
    ld   d, $00                                   ;; 36:540A $16 $00
    ld   hl, wDrawCommandVRAM1                    ;; 36:540C $21 $91 $DC
    add  hl, de                                   ;; 36:540F $19
    ld   e, $08                                   ;; 36:5410 $1E $08

.loop_5412
    ld   a, [bc]                                  ;; 36:5412 $0A
    inc  bc                                       ;; 36:5413 $03
    ld   [hl+], a                                 ;; 36:5414 $22
    dec  e                                        ;; 36:5415 $1D
    jr   nz, .loop_5412                           ;; 36:5416 $20 $FA

    ld   [hl], $00                                ;; 36:5418 $36 $00
    pop  bc                                       ;; 36:541A $C1
    ld   hl, wEntitiesPrivateState1Table          ;; 36:541B $21 $B0 $C2
    add  hl, bc                                   ;; 36:541E $09
    inc  [hl]                                     ;; 36:541F $34
    ld   a, [hl]                                  ;; 36:5420 $7E
    cp   $09                                      ;; 36:5421 $FE $09
    ret  nz                                       ;; 36:5423 $C0

    call IncrementEntityState                     ;; 36:5424 $CD $12 $3B
    ret                                           ;; 36:5427 $C9

TunicFairyStateA::
func_036_5428::
    ld   de, wBGPal2                              ;; 36:5428 $11 $18 $DC
    ld   hl, rSVBK                                ;; 36:542B $21 $70 $FF
    di                                            ;; 36:542E $F3

.loop_542F
    ld   [hl], $02                                ;; 36:542F $36 $02
    ld   a, [de]                                  ;; 36:5431 $1A
    ld   [hl], $00                                ;; 36:5432 $36 $00
    ld   [de], a                                  ;; 36:5434 $12
    inc  de                                       ;; 36:5435 $13
    ld   a, e                                     ;; 36:5436 $7B
    and  $07                                      ;; 36:5437 $E6 $07
    jr   nz, .loop_542F                           ;; 36:5439 $20 $F4

    ld   a, $01                                   ;; 36:543B $3E $01
    ld   [wPaletteDataFlags], a                   ;; 36:543D $EA $D1 $DD
    ei                                            ;; 36:5440 $FB
    ld   a, $3A                                   ;; 36:5441 $3E $3A
    ldh  [hLinkPositionY], a                      ;; 36:5443 $E0 $99
    call_open_dialog Dialog26C                    ;; 36:5445
    call IncrementEntityState                     ;; 36:544A $CD $12 $3B
    ret                                           ;; 36:544D $C9

TunicFairyStateB::
    call func_036_5153                            ;; 36:544E $CD $53 $51
    ld   a, [wDialogState]                        ;; 36:5451 $FA $9F $C1
    and  a                                        ;; 36:5454 $A7
    ret  nz                                       ;; 36:5455 $C0

    call UnloadEntity                             ;; 36:5456 $CD $8D $3F
    call disableMovementInTransition              ;; 36:5459 $CD $9E $0C
    ret                                           ;; 36:545C $C9

func_036_545D::
    ld   a, [wHasToadstool]                       ;; 36:545D $FA $4B $DB
    and  a                                        ;; 36:5460 $A7
    ret  nz                                       ;; 36:5461 $C0

    ld   e, $00                                   ;; 36:5462 $1E $00
    ld   d, e                                     ;; 36:5464 $53

jr_036_5465:
    ld   hl, wEntitiesTypeTable                   ;; 36:5465 $21 $A0 $C3
    add  hl, de                                   ;; 36:5468 $19
    ld   a, [hl]                                  ;; 36:5469 $7E
    cp   $86                                      ;; 36:546A $FE $86
    jr   nz, .jr_5475                             ;; 36:546C $20 $07

    ld   hl, wEntitiesStatusTable                 ;; 36:546E $21 $80 $C2
    add  hl, de                                   ;; 36:5471 $19
    ld   a, [hl]                                  ;; 36:5472 $7E
    and  a                                        ;; 36:5473 $A7
    ret  nz                                       ;; 36:5474 $C0

.jr_5475
    inc  de                                       ;; 36:5475 $13
    ld   a, e                                     ;; 36:5476 $7B
    and  $0F                                      ;; 36:5477 $E6 $0F
    jr   nz, jr_036_5465                          ;; 36:5479 $20 $EA

    ld   a, ENTITY_FLOATING_ITEM                  ;; 36:547B $3E $86
    call SpawnNewEntity_trampoline                ;; 36:547D $CD $86 $3B
    ret  c                                        ;; 36:5480 $D8

    ld   hl, wEntitiesPosXTable                   ;; 36:5481 $21 $00 $C2
    add  hl, de                                   ;; 36:5484 $19
    ld   [hl], $20                                ;; 36:5485 $36 $20
    call GetRandomByte                            ;; 36:5487 $CD $0D $28
    and  $01                                      ;; 36:548A $E6 $01
    jr   z, .jr_5490                              ;; 36:548C $28 $02

    ld   [hl], $88                                ;; 36:548E $36 $88

.jr_5490
    ld   a, [hl]                                  ;; 36:5490 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 36:5491 $21 $40 $C2
    add  hl, de                                   ;; 36:5494 $19
    ld   [hl], $0C                                ;; 36:5495 $36 $0C
    bit  7, a                                     ;; 36:5497 $CB $7F
    jr   z, .jr_549D                              ;; 36:5499 $28 $02

    ld   [hl], $F4                                ;; 36:549B $36 $F4

.jr_549D
    ld   hl, wEntitiesPosYTable                   ;; 36:549D $21 $10 $C2
    add  hl, de                                   ;; 36:54A0 $19
    ld   [hl], $18                                ;; 36:54A1 $36 $18
    ld   hl, wEntitiesSpeedYTable                 ;; 36:54A3 $21 $50 $C2
    add  hl, de                                   ;; 36:54A6 $19
    ld   [hl], $0C                                ;; 36:54A7 $36 $0C
    ld   hl, wEntitiesPosZTable                   ;; 36:54A9 $21 $10 $C3
    add  hl, de                                   ;; 36:54AC $19
    ld   [hl], $10                                ;; 36:54AD $36 $10
    ret                                           ;; 36:54AF $C9

func_036_54B0::
    ld   a, [wDialogState]                        ;; 36:54B0 $FA $9F $C1
    and  a                                        ;; 36:54B3 $A7
    ret  nz                                       ;; 36:54B4 $C0

    ld   a, [wHasToadstool]                       ;; 36:54B5 $FA $4B $DB
    and  a                                        ;; 36:54B8 $A7
    ret  z                                        ;; 36:54B9 $C8

    ld   a, [wInventoryItems.BButtonSlot]         ;; 36:54BA $FA $00 $DB
    cp   INVENTORY_MAGIC_POWDER                   ;; 36:54BD $FE $0C
    jr   nz, .noPowderB                           ;; 36:54BF $20 $07

    ldh  a, [hJoypadState]                        ;; 36:54C1 $F0 $CC
    and  J_B                                      ;; 36:54C3 $E6 $20
    ret  z                                        ;; 36:54C5 $C8

    jr   jr_036_54D3                              ;; 36:54C6 $18 $0B

.noPowderB
    ld   a, [wInventoryItems.AButtonSlot]         ;; 36:54C8 $FA $01 $DB
    cp   INVENTORY_MAGIC_POWDER                   ;; 36:54CB $FE $0C
    ret  nz                                       ;; 36:54CD $C0

    ldh  a, [hJoypadState]                        ;; 36:54CE $F0 $CC
    and  J_A                                      ;; 36:54D0 $E6 $10
    ret  z                                        ;; 36:54D2 $C8

jr_036_54D3:
    ld   hl, wEntitiesHealthTable                 ;; 36:54D3 $21 $60 $C3
    add  hl, bc                                   ;; 36:54D6 $09
    ld   [hl], $00                                ;; 36:54D7 $36 $00
    ld   hl, wEntitiesStatusTable                 ;; 36:54D9 $21 $80 $C2
    add  hl, bc                                   ;; 36:54DC $09
    ld   a, $01                                   ;; 36:54DD $3E $01
    ld   [hl], a                                  ;; 36:54DF $77
    pop  af                                       ;; 36:54E0 $F1
    ret                                           ;; 36:54E1 $C9

GiantBuzzBlobEntityHandler::
    call label_394D                               ;; 36:54E2 $CD $4D $39
    ld   a, c                                     ;; 36:54E5 $79
    ld   [wD202], a                               ;; 36:54E6 $EA $02 $D2
    call func_036_5844                            ;; 36:54E9 $CD $44 $58
    ldh  a, [hActiveEntityStatus]                 ;; 36:54EC $F0 $EA
    cp   $05                                      ;; 36:54EE $FE $05
    jp   nz, AnimateBossAgony_1836                ;; 36:54F0 $C2 $3C $5C

    ld   a, [wMagicPowderCount]                   ;; 36:54F3 $FA $4C $DB
    and  a                                        ;; 36:54F6 $A7
    jr   nz, .jr_54FE                             ;; 36:54F7 $20 $05

    push bc                                       ;; 36:54F9 $C5
    call func_036_545D                            ;; 36:54FA $CD $5D $54
    pop  bc                                       ;; 36:54FD $C1

.jr_54FE
    call BossIntro                                ;; 36:54FE $CD $E8 $3E
    call DecrementEntityIgnoreHitsCountdown       ;; 36:5501 $CD $56 $0C
    call ReturnIfNonInteractive_36                ;; 36:5504 $CD $40 $6A
    ldh  a, [hActiveEntityState]                  ;; 36:5507 $F0 $F0
    cp   $03                                      ;; 36:5509 $FE $03
    jr   c, .jr_5510                              ;; 36:550B $38 $03

    call func_036_54B0                            ;; 36:550D $CD $B0 $54

.jr_5510
    ldh  a, [hActiveEntityState]                  ;; 36:5510 $F0 $F0
    JP_TABLE                                      ;; 36:5512
._00 dw func_036_5537                             ;; 36:5513
._01 dw func_036_5561                             ;; 36:5515
._02 dw func_036_5575                             ;; 36:5517
._03 dw AvalaunchState1Handler                             ;; 36:5519
._04 dw func_036_558E                             ;; 36:551B
._05 dw func_036_55B1                             ;; 36:551D
._06 dw func_036_5721                             ;; 36:551F
._07 dw AvalaunchState1Handler                             ;; 36:5521
._08 dw func_036_573E                             ;; 36:5523
._09 dw func_036_578F                             ;; 36:5525
._0A dw func_036_57AF                             ;; 36:5527
._0B dw func_036_57C8                             ;; 36:5529

AvalaunchState1Handler::
    ld   a, $01                                   ;; 36:552B $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:552D $E0 $A1
    call GetEntityTransitionCountdown             ;; 36:552F $CD $05 $0C
    ret  nz                                       ;; 36:5532 $C0

    call IncrementEntityState                     ;; 36:5533 $CD $12 $3B
    ret                                           ;; 36:5536 $C9

func_036_5537::
    ld   a, [wC190]                               ;; 36:5537 $FA $90 $C1
    and  a                                        ;; 36:553A $A7
    ret  z                                        ;; 36:553B $C8

    xor  a                                        ;; 36:553C $AF
    ld   hl, wEntitiesPrivateState1Table          ;; 36:553D $21 $B0 $C2
    add  hl, bc                                   ;; 36:5540 $09
    ld   [hl], a                                  ;; 36:5541 $77
    ld   a, $02                                   ;; 36:5542 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:5544 $E0 $A1
    ld   [wC167], a                               ;; 36:5546 $EA $67 $C1
    ldh  a, [hFrameCounter]                       ;; 36:5549 $F0 $E7
    and  $07                                      ;; 36:554B $E6 $07
    ret  nz                                       ;; 36:554D $C0

    call PointHLToEntitySpriteVariant             ;; 36:554E $CD $02 $6C
    inc  [hl]                                     ;; 36:5551 $34
    ld   a, [hl]                                  ;; 36:5552 $7E
    cp   $04                                      ;; 36:5553 $FE $04
    ret  c                                        ;; 36:5555 $D8

    xor  a                                        ;; 36:5556 $AF
    ld   [hl], a                                  ;; 36:5557 $77
    ld   a, $20                                   ;; 36:5558 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:555A $CD $83 $6C
    call IncrementEntityState                     ;; 36:555D $CD $12 $3B
    ret                                           ;; 36:5560 $C9

func_036_5561::
    ld   a, $02                                   ;; 36:5561 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:5563 $E0 $A1
    ld   [wC167], a                               ;; 36:5565 $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 36:5568 $CD $05 $0C
    ret  nz                                       ;; 36:556B $C0

    call_open_dialog Dialog261                    ;; 36:556C
    call IncrementEntityState                     ;; 36:5571 $CD $12 $3B
    ret                                           ;; 36:5574 $C9

func_036_5575::
    ld   a, $02                                   ;; 36:5575 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:5577 $E0 $A1
    ld   [wC167], a                               ;; 36:5579 $EA $67 $C1
    ld   a, [wDialogState]                        ;; 36:557C $FA $9F $C1
    and  a                                        ;; 36:557F $A7
    ret  nz                                       ;; 36:5580 $C0

    ld   a, $20                                   ;; 36:5581 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:5583 $CD $83 $6C
    xor  a                                        ;; 36:5586 $AF
    ld   [wC167], a                               ;; 36:5587 $EA $67 $C1
    call IncrementEntityState                     ;; 36:558A $CD $12 $3B
    ret                                           ;; 36:558D $C9

func_036_558E::
    ld   a, $01                                   ;; 36:558E $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:5590 $E0 $A1
    ldh  a, [hFrameCounter]                       ;; 36:5592 $F0 $E7
    and  $03                                      ;; 36:5594 $E6 $03
    ret  nz                                       ;; 36:5596 $C0

    call PointHLToEntitySpriteVariant             ;; 36:5597 $CD $02 $6C
    inc  [hl]                                     ;; 36:559A $34
    ld   a, [hl]                                  ;; 36:559B $7E
    cp   $0B                                      ;; 36:559C $FE $0B
    ret  nz                                       ;; 36:559E $C0

    xor  a                                        ;; 36:559F $AF
    ld   [hl], a                                  ;; 36:55A0 $77
    call IncrementEntityState                     ;; 36:55A1 $CD $12 $3B
    ret                                           ;; 36:55A4 $C9

Data_036_55A5::
    db   $FA, $FC

Data_036_55A7::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

Data_036_55AF::
    db   $1C, $10

func_036_55B1::
    ld   a, [wDialogState]                        ;; 36:55B1 $FA $9F $C1
    and  a                                        ;; 36:55B4 $A7
    ret  nz                                       ;; 36:55B5 $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 36:55B6 $21 $B0 $C2
    add  hl, bc                                   ;; 36:55B9 $09
    ld   a, [hl]                                  ;; 36:55BA $7E
    and  a                                        ;; 36:55BB $A7
    jr   z, .jr_55E0                              ;; 36:55BC $28 $22

    call PointHLToEntitySpriteVariant             ;; 36:55BE $CD $02 $6C
    ld   a, [hl]                                  ;; 36:55C1 $7E
    and  $01                                      ;; 36:55C2 $E6 $01
    jr   nz, .jr_55E0                             ;; 36:55C4 $20 $1A

    ld   [hl], a                                  ;; 36:55C6 $77
    call PointHLToEntitySpeedX                    ;; 36:55C7 $CD $EE $6B
    ld   [hl], a                                  ;; 36:55CA $77
    call PointHLToEntitySpeedY                    ;; 36:55CB $CD $F3 $6B
    ld   [hl], a                                  ;; 36:55CE $77
    ld   hl, wEntitiesPrivateState3Table          ;; 36:55CF $21 $D0 $C2
    add  hl, bc                                   ;; 36:55D2 $09
    ld   [hl], $01                                ;; 36:55D3 $36 $01
    ld   a, $20                                   ;; 36:55D5 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:55D7 $CD $83 $6C
    ld   a, $07                                   ;; 36:55DA $3E $07
    call SetEntityState                           ;; 36:55DC $CD $07 $6C
    ret                                           ;; 36:55DF $C9

.jr_55E0
    call GetEntityTransitionCountdown             ;; 36:55E0 $CD $05 $0C
    jr   nz, .jr_5603                             ;; 36:55E3 $20 $1E

    call GetRandomByte                            ;; 36:55E5 $CD $0D $28
    and  $3F                                      ;; 36:55E8 $E6 $3F
    add  $30                                      ;; 36:55EA $C6 $30
    ld   [hl], a                                  ;; 36:55EC $77
    and  $07                                      ;; 36:55ED $E6 $07
    ld   e, a                                     ;; 36:55EF $5F
    ld   d, b                                     ;; 36:55F0 $50
    ld   hl, Data_036_55A7                        ;; 36:55F1 $21 $A7 $55
    add  hl, de                                   ;; 36:55F4 $19
    ld   a, [hl]                                  ;; 36:55F5 $7E
    call PointHLToEntitySpeedX                    ;; 36:55F6 $CD $EE $6B
    ld   [hl], a                                  ;; 36:55F9 $77
    ld   hl, Data_036_55A5                        ;; 36:55FA $21 $A5 $55
    add  hl, de                                   ;; 36:55FD $19
    ld   a, [hl]                                  ;; 36:55FE $7E
    call PointHLToEntitySpeedY                    ;; 36:55FF $CD $F3 $6B
    ld   [hl], a                                  ;; 36:5602 $77

.jr_5603
    call UpdateEntityPosWithSpeed_36              ;; 36:5603 $CD $62 $6A
    ld   de, Data_036_55AF                        ;; 36:5606 $11 $AF $55
    call func_036_6C90                            ;; 36:5609 $CD $90 $6C
    ld   hl, wEntitiesStateTable                  ;; 36:560C $21 $90 $C2
    add  hl, bc                                   ;; 36:560F $09
    ld   e, [hl]                                  ;; 36:5610 $5E
    ld   hl, wEntitiesHealthTable                 ;; 36:5611 $21 $60 $C3
    add  hl, bc                                   ;; 36:5614 $09
    ld   d, [hl]                                  ;; 36:5615 $56
    push de                                       ;; 36:5616 $D5
    ld   [hl], $0F                                ;; 36:5617 $36 $0F
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:5619 $CD $39 $3B
    pop  de                                       ;; 36:561C $D1
    ld   hl, wEntitiesHealthTable                 ;; 36:561D $21 $60 $C3
    add  hl, bc                                   ;; 36:5620 $09
    ld   [hl], d                                  ;; 36:5621 $72
    ld   hl, wEntitiesStateTable                  ;; 36:5622 $21 $90 $C2
    add  hl, bc                                   ;; 36:5625 $09
    ld   [hl], e                                  ;; 36:5626 $73
    ld   hl, wEntitiesStatusTable                 ;; 36:5627 $21 $80 $C2
    add  hl, bc                                   ;; 36:562A $09
    ld   [hl], $05                                ;; 36:562B $36 $05
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:562D $21 $20 $C4
    add  hl, bc                                   ;; 36:5630 $09
    ld   a, [hl]                                  ;; 36:5631 $7E
    and  a                                        ;; 36:5632 $A7
    jr   z, jr_036_5673                           ;; 36:5633 $28 $3E

    xor  a                                        ;; 36:5635 $AF
    ld   [hl], a                                  ;; 36:5636 $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:5637 $21 $10 $C4
    add  hl, bc                                   ;; 36:563A $09
    ld   [hl], a                                  ;; 36:563B $77
    ld   a, [wC16E]                               ;; 36:563C $FA $6E $C1
    ld   hl, wSwordAnimationState                 ;; 36:563F $21 $37 $C1
    or   [hl]                                     ;; 36:5642 $B6
    ld   hl, wActiveProjectileCount               ;; 36:5643 $21 $4D $C1
    or   [hl]                                     ;; 36:5646 $B6
    and  a                                        ;; 36:5647 $A7
    jr   nz, .jr_5652                             ;; 36:5648 $20 $08

    ld   hl, wEntitiesPrivateState1Table          ;; 36:564A $21 $B0 $C2
    add  hl, bc                                   ;; 36:564D $09
    ld   [hl], $01                                ;; 36:564E $36 $01
    jr   jr_036_5673                              ;; 36:5650 $18 $21

.jr_5652
    ld   hl, wEntitiesPrivateState3Table          ;; 36:5652 $21 $D0 $C2
    add  hl, bc                                   ;; 36:5655 $09
    ld   a, [hl]                                  ;; 36:5656 $7E
    and  a                                        ;; 36:5657 $A7
    jr   nz, .jr_5661                             ;; 36:5658 $20 $07

    ld   [hl], $01                                ;; 36:565A $36 $01
    call_open_dialog Dialog269                    ;; 36:565C

.jr_5661
    ld   a, $10                                   ;; 36:5661 $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 36:5663 $EA $3E $C1
    ld   a, $20                                   ;; 36:5666 $3E $20
    call GetVectorTowardsLink_trampoline          ;; 36:5668 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 36:566B $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 36:566D $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 36:566F $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 36:5671 $E0 $9A

jr_036_5673:
    ldh  a, [hFrameCounter]                       ;; 36:5673 $F0 $E7
    and  $0F                                      ;; 36:5675 $E6 $0F
    ret  nz                                       ;; 36:5677 $C0

    call PointHLToEntitySpriteVariant             ;; 36:5678 $CD $02 $6C
    inc  [hl]                                     ;; 36:567B $34
    ld   a, [hl]                                  ;; 36:567C $7E
    cp   $04                                      ;; 36:567D $FE $04
    ret  nz                                       ;; 36:567F $C0

    xor  a                                        ;; 36:5680 $AF
    ld   [hl], a                                  ;; 36:5681 $77
    call GetRandomByte                            ;; 36:5682 $CD $0D $28
    and  $03                                      ;; 36:5685 $E6 $03
    ret  nz                                       ;; 36:5687 $C0

    call IncrementEntityState                     ;; 36:5688 $CD $12 $3B
    ret                                           ;; 36:568B $C9

Data_036_568C::
    db   $F8, $00, $E0, $F4, $02, $10, $0C, $FC, $00, $06, $F8, $00, $12, $0C, $02, $E0
    db   $F4, $FC, $00, $06

Data_036_56A0::
    db   $10, $0C, $E2, $F4, $00, $10, $0C, $10, $0C, $04, $E0, $F4, $10, $0C, $00, $E0
    db   $F4, $E2, $F4, $04

func_036_56B4::
    ld   hl, wEntitiesPrivateState2Table          ;; 36:56B4 $21 $C0 $C2
    add  hl, bc                                   ;; 36:56B7 $09
    inc  [hl]                                     ;; 36:56B8 $34
    ld   a, [hl]                                  ;; 36:56B9 $7E
    ld   hl, Data_036_568C                        ;; 36:56BA $21 $8C $56
    and  $01                                      ;; 36:56BD $E6 $01
    jr   nz, .jr_56C4                             ;; 36:56BF $20 $03

    ld   hl, Data_036_56A0                        ;; 36:56C1 $21 $A0 $56

.jr_56C4
    call func_036_56CD                            ;; 36:56C4 $CD $CD $56
    call func_036_56CD                            ;; 36:56C7 $CD $CD $56
    call func_036_56CD                            ;; 36:56CA $CD $CD $56

func_036_56CD::
    push hl                                       ;; 36:56CD $E5
    ld   a, ENTITY_BOUNCING_BOULDER               ;; 36:56CE $3E $F5
    call SpawnNewEntity_trampoline                ;; 36:56D0 $CD $86 $3B
    pop  hl                                       ;; 36:56D3 $E1
    ret  c                                        ;; 36:56D4 $D8

    push hl                                       ;; 36:56D5 $E5
    ld   hl, wEntitiesStateTable                  ;; 36:56D6 $21 $90 $C2
    add  hl, de                                   ;; 36:56D9 $19
    ld   [hl], $02                                ;; 36:56DA $36 $02
    call PointHLToEntityPosX                      ;; 36:56DC $CD $23 $6C
    ld   a, [hl]                                  ;; 36:56DF $7E
    pop  hl                                       ;; 36:56E0 $E1
    add  [hl]                                     ;; 36:56E1 $86
    inc  hl                                       ;; 36:56E2 $23
    push hl                                       ;; 36:56E3 $E5
    ld   hl, wEntitiesPosXTable                   ;; 36:56E4 $21 $00 $C2
    add  hl, de                                   ;; 36:56E7 $19
    ld   [hl], a                                  ;; 36:56E8 $77
    pop  hl                                       ;; 36:56E9 $E1
    ld   a, [hl+]                                 ;; 36:56EA $2A
    push hl                                       ;; 36:56EB $E5
    ld   hl, wEntitiesSpeedXTable                 ;; 36:56EC $21 $40 $C2
    add  hl, de                                   ;; 36:56EF $19
    ld   [hl], a                                  ;; 36:56F0 $77
    call PointHLToEntityPosY                      ;; 36:56F1 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:56F4 $7E
    pop  hl                                       ;; 36:56F5 $E1
    add  [hl]                                     ;; 36:56F6 $86
    inc  hl                                       ;; 36:56F7 $23
    push hl                                       ;; 36:56F8 $E5
    ld   hl, wEntitiesPosYTable                   ;; 36:56F9 $21 $10 $C2
    add  hl, de                                   ;; 36:56FC $19
    ld   [hl], a                                  ;; 36:56FD $77
    pop  hl                                       ;; 36:56FE $E1
    ld   a, [hl+]                                 ;; 36:56FF $2A
    push hl                                       ;; 36:5700 $E5
    ld   hl, wEntitiesSpeedYTable                 ;; 36:5701 $21 $50 $C2
    add  hl, de                                   ;; 36:5704 $19
    ld   [hl], a                                  ;; 36:5705 $77
    pop  hl                                       ;; 36:5706 $E1
    ld   a, [hl+]                                 ;; 36:5707 $2A
    push hl                                       ;; 36:5708 $E5
    ld   hl, wEntitiesSpriteVariantTable          ;; 36:5709 $21 $B0 $C3
    add  hl, de                                   ;; 36:570C $19
    ld   [hl], a                                  ;; 36:570D $77
    ld   hl, wEntitiesPrivateState1Table          ;; 36:570E $21 $B0 $C2
    add  hl, de                                   ;; 36:5711 $19
    ld   [hl], a                                  ;; 36:5712 $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:5713 $21 $40 $C3
    add  hl, de                                   ;; 36:5716 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 36:5717 $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ;; 36:5719 $21 $50 $C3
    add  hl, de                                   ;; 36:571C $19
    set  7, [hl]                                  ;; 36:571D $CB $FE
    pop  hl                                       ;; 36:571F $E1
    ret                                           ;; 36:5720 $C9

func_036_5721::
    ldh  a, [hFrameCounter]                       ;; 36:5721 $F0 $E7
    and  $03                                      ;; 36:5723 $E6 $03
    ret  nz                                       ;; 36:5725 $C0

    call PointHLToEntitySpriteVariant             ;; 36:5726 $CD $02 $6C
    inc  [hl]                                     ;; 36:5729 $34
    ld   a, [hl]                                  ;; 36:572A $7E
    cp   $03                                      ;; 36:572B $FE $03
    jr   z, .jr_5736                              ;; 36:572D $28 $07

    and  $01                                      ;; 36:572F $E6 $01
    ret  z                                        ;; 36:5731 $C8

    call func_036_56B4                            ;; 36:5732 $CD $B4 $56
    ret                                           ;; 36:5735 $C9

.jr_5736
    xor  a                                        ;; 36:5736 $AF
    ld   [hl], a                                  ;; 36:5737 $77
    ld   a, $05                                   ;; 36:5738 $3E $05
    call SetEntityState                           ;; 36:573A $CD $07 $6C
    ret                                           ;; 36:573D $C9

func_036_573E::
    ldh  a, [hFrameCounter]                       ;; 36:573E $F0 $E7
    and  $03                                      ;; 36:5740 $E6 $03
    ret  nz                                       ;; 36:5742 $C0

    call PointHLToEntitySpriteVariant             ;; 36:5743 $CD $02 $6C
    inc  [hl]                                     ;; 36:5746 $34
    ld   a, [hl]                                  ;; 36:5747 $7E
    cp   $07                                      ;; 36:5748 $FE $07
    ret  nz                                       ;; 36:574A $C0

    xor  a                                        ;; 36:574B $AF
    ld   [hl], a                                  ;; 36:574C $77
    call IncrementEntityState                     ;; 36:574D $CD $12 $3B
    ld   a, $F0                                   ;; 36:5750 $3E $F0
    call SetEntityTransitionCountdown_36          ;; 36:5752 $CD $83 $6C
    ret                                           ;; 36:5755 $C9

func_036_5756::
    ld   de, Data_036_55AF                        ;; 36:5756 $11 $AF $55
    call func_036_6C90                            ;; 36:5759 $CD $90 $6C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:575C $CD $39 $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:575F $21 $20 $C4
    add  hl, bc                                   ;; 36:5762 $09
    ld   a, [hl]                                  ;; 36:5763 $7E
    and  a                                        ;; 36:5764 $A7
    ret  z                                        ;; 36:5765 $C8

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:5766 $21 $10 $C4
    add  hl, bc                                   ;; 36:5769 $09
    ld   a, [hl]                                  ;; 36:576A $7E
    and  a                                        ;; 36:576B $A7
    ret  nz                                       ;; 36:576C $C0

    call PointHLToEntitySpriteVariant             ;; 36:576D $CD $02 $6C
    ld   a, [hl]                                  ;; 36:5770 $7E
    and  a                                        ;; 36:5771 $A7
    ret  nz                                       ;; 36:5772 $C0

    ld   [hl], a                                  ;; 36:5773 $77
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:5774 $21 $20 $C4
    add  hl, bc                                   ;; 36:5777 $09
    ld   [hl], a                                  ;; 36:5778 $77

func_036_5779::
    xor  a                                        ;; 36:5779 $AF
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:577A $21 $10 $C4
    add  hl, bc                                   ;; 36:577D $09
    ld   [hl], a                                  ;; 36:577E $77
    ld   hl, wEntitiesPrivateState1Table          ;; 36:577F $21 $B0 $C2
    add  hl, bc                                   ;; 36:5782 $09
    ld   [hl], a                                  ;; 36:5783 $77
    ld   a, $20                                   ;; 36:5784 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:5786 $CD $83 $6C
    ld   a, $03                                   ;; 36:5789 $3E $03
    call SetEntityState                           ;; 36:578B $CD $07 $6C
    ret                                           ;; 36:578E $C9

func_036_578F::
    ldh  a, [hFrameCounter]                       ;; 36:578F $F0 $E7
    and  $07                                      ;; 36:5791 $E6 $07
    jr   nz, .jr_57AB                             ;; 36:5793 $20 $16

    call PointHLToEntitySpriteVariant             ;; 36:5795 $CD $02 $6C
    inc  [hl]                                     ;; 36:5798 $34
    ld   a, [hl]                                  ;; 36:5799 $7E
    cp   $02                                      ;; 36:579A $FE $02
    jr   nz, .jr_57AB                             ;; 36:579C $20 $0D

    ld   a, $08                                   ;; 36:579E $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 36:57A0 $CD $AA $3B
    call PointHLToEntitySpeedZ                    ;; 36:57A3 $CD $F8 $6B
    ld   [hl], $20                                ;; 36:57A6 $36 $20
    call IncrementEntityState                     ;; 36:57A8 $CD $12 $3B

.jr_57AB
    call func_036_5756                            ;; 36:57AB $CD $56 $57
    ret                                           ;; 36:57AE $C9

func_036_57AF::
    call UpdateEntityPosWithSpeed_36              ;; 36:57AF $CD $62 $6A
    call func_036_6AEC                            ;; 36:57B2 $CD $EC $6A
    call PointHLToEntitySpeedZ                    ;; 36:57B5 $CD $F8 $6B
    dec  [hl]                                     ;; 36:57B8 $35
    call PointHLToEntityPosZ                      ;; 36:57B9 $CD $2D $6C
    ld   a, [hl]                                  ;; 36:57BC $7E
    bit  7, a                                     ;; 36:57BD $CB $7F
    ret  z                                        ;; 36:57BF $C8

    call PointHLToEntitySpriteVariant             ;; 36:57C0 $CD $02 $6C
    inc  [hl]                                     ;; 36:57C3 $34
    call IncrementEntityState                     ;; 36:57C4 $CD $12 $3B
    ret                                           ;; 36:57C7 $C9

func_036_57C8::
    ldh  a, [hFrameCounter]                       ;; 36:57C8 $F0 $E7
    and  $07                                      ;; 36:57CA $E6 $07
    jr   nz, .jr_57E6                             ;; 36:57CC $20 $18

    call PointHLToEntitySpriteVariant             ;; 36:57CE $CD $02 $6C
    inc  [hl]                                     ;; 36:57D1 $34
    ld   a, [hl]                                  ;; 36:57D2 $7E
    cp   $04                                      ;; 36:57D3 $FE $04
    jr   nz, .jr_57E6                             ;; 36:57D5 $20 $0F

    xor  a                                        ;; 36:57D7 $AF
    ld   [hl], a                                  ;; 36:57D8 $77
    ld   a, $09                                   ;; 36:57D9 $3E $09
    call SetEntityState                           ;; 36:57DB $CD $07 $6C
    call GetEntityTransitionCountdown             ;; 36:57DE $CD $05 $0C
    jr   nz, .jr_57E6                             ;; 36:57E1 $20 $03

    call func_036_5779                            ;; 36:57E3 $CD $79 $57

.jr_57E6
    call func_036_5756                            ;; 36:57E6 $CD $56 $57
    ret                                           ;; 36:57E9 $C9

Data_036_57EA:
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950

Data_036_57F2:
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6980

Data_036_5808:
    dw   Data_020_6980
    dw   Data_020_6998
    dw   Data_020_6980
    dw   Data_020_69B0

Data_036_5810:
    dw   Data_020_6980
    dw   Data_020_69C8
    dw   Data_020_6980

Data_036_5816:
    dw   Data_020_6980
    dw   Data_020_6950
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950
    dw   Data_020_6938

Data_036_5824:
    dw   Data_020_6938
    dw   Data_020_6950
    dw   Data_020_6968
    dw   Data_020_6950

Data_036_582C::
    dw   Data_036_57EA
    dw   Data_036_57EA
    dw   Data_036_57EA
    dw   Data_036_57EA
    dw   Data_036_57F2
    dw   Data_036_5808
    dw   Data_036_5810
    dw   Data_036_5810
    dw   Data_036_5816
    dw   Data_036_5824
    dw   Data_036_5824
    dw   Data_036_5824

func_036_5844::
    ld   d, $00                                   ;; 36:5844 $16 $00
    ldh  a, [hActiveEntityState]                  ;; 36:5846 $F0 $F0
    sla  a                                        ;; 36:5848 $CB $27
    ld   e, a                                     ;; 36:584A $5F
    ld   hl, Data_036_582C                        ;; 36:584B $21 $2C $58
    call func_036_6C7E                            ;; 36:584E $CD $7E $6C
    push hl                                       ;; 36:5851 $E5
    call PointHLToEntitySpriteVariant             ;; 36:5852 $CD $02 $6C
    ld   e, [hl]                                  ;; 36:5855 $5E
    sla  e                                        ;; 36:5856 $CB $23
    pop  hl                                       ;; 36:5858 $E1
    call func_036_6C7E                            ;; 36:5859 $CD $7E $6C
    ld   c, $06                                   ;; 36:585C $0E $06
    ld   a, $36                                   ;; 36:585E $3E $36
    call func_A5F                                 ;; 36:5860 $CD $5F $0A
    ld   a, $06                                   ;; 36:5863 $3E $06
    call func_015_7964_trampoline                 ;; 36:5865 $CD $A0 $3D
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:5868 $21 $40 $C3
    add  hl, bc                                   ;; 36:586B $09
    ld   a, [hl]                                  ;; 36:586C $7E
    push af                                       ;; 36:586D $F5
    or   ENTITY_PHYSICS_SHADOW                    ;; 36:586E $F6 $10
    ld   [hl], a                                  ;; 36:5870 $77
    push hl                                       ;; 36:5871 $E5
    call label_3CD9                               ;; 36:5872 $CD $D9 $3C
    pop  hl                                       ;; 36:5875 $E1
    pop  af                                       ;; 36:5876 $F1
    ld   [hl], a                                  ;; 36:5877 $77
    ret                                           ;; 36:5878 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
; list overlapps with next list
;
; For this list:
; - Variant 0 is a single sprite, rendered by RenderActiveEntitySprite
; - Variant 1 is a double sprite, rendered by RenderActiveEntitySpritesPair
DungeonBookSpriteVariants::
.variant0
    db   $58, OAM_GBC_PAL_2 | OAMF_PAL0           ;; 36:5879 $58 $02
.variant1
    db   $5A, OAM_GBC_PAL_0 | OAMF_PAL0           ;; 36:587B $5A $00
    db   $5A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP ;; 36:587D $5A $20

ColorDungeonBookEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 36:587F $F0 $F1
    and  a                                        ;; 36:5881 $A7
    jr   z, .renderVariant0                       ;; 36:5882 $28 $08
    ; Variant 1: render a sprite pair
    ld   de, DungeonBookSpriteVariants - 2        ;; 36:5884 $11 $77 $58
    call RenderActiveEntitySpritesPair            ;; 36:5887 $CD $C0 $3B
    jr   .renderEnd                               ;; 36:588A $18 $06
.renderVariant0
    ; Variant 0: render a single sprite
    ld   de, DungeonBookSpriteVariants            ;; 36:588C $11 $79 $58
    call RenderActiveEntitySprite                 ;; 36:588F $CD $77 $3C
.renderEnd

    ldh  a, [hActiveEntityState]                  ;; 36:5892 $F0 $F0
    JP_TABLE                                      ;; 36:5894
._00 dw func_036_58A1                             ;; 36:5895
._01 dw func_036_58B9                             ;; 36:5897
._02 dw func_036_58B9                             ;; 36:5899
._03 dw func_036_58E4                             ;; 36:589B
._04 dw func_036_5912                             ;; 36:589D
._05 dw func_036_5930                             ;; 36:589F

func_036_58A1::
    ld   a, [wScreenShakeCountdown]               ;; 36:58A1 $FA $57 $C1
    and  a                                        ;; 36:58A4 $A7
    jr   z, .ret_58B8                             ;; 36:58A5 $28 $11

    cp   $05                                      ;; 36:58A7 $FE $05
    jr   nc, .ret_58B8                            ;; 36:58A9 $30 $0D

    call PointHLToEntitySpeedY                    ;; 36:58AB $CD $F3 $6B
    ld   [hl], $14                                ;; 36:58AE $36 $14
    call PointHLToEntitySpeedZ                    ;; 36:58B0 $CD $F8 $6B
    ld   [hl], $10                                ;; 36:58B3 $36 $10
    call IncrementEntityState                     ;; 36:58B5 $CD $12 $3B

.ret_58B8
    ret                                           ;; 36:58B8 $C9

func_036_58B9::
    call UpdateEntityPosWithSpeed_36              ;; 36:58B9 $CD $62 $6A
    call func_036_6AEC                            ;; 36:58BC $CD $EC $6A
    ldh  a, [hFrameCounter]                       ;; 36:58BF $F0 $E7
    and  $01                                      ;; 36:58C1 $E6 $01
    jr   z, .jr_58CD                              ;; 36:58C3 $28 $08

    call PointHLToEntitySpeedY                    ;; 36:58C5 $CD $F3 $6B
    ld   a, [hl]                                  ;; 36:58C8 $7E
    and  a                                        ;; 36:58C9 $A7
    jr   z, .jr_58CD                              ;; 36:58CA $28 $01

    dec  [hl]                                     ;; 36:58CC $35

.jr_58CD
    call PointHLToEntitySpeedZ                    ;; 36:58CD $CD $F8 $6B
    dec  [hl]                                     ;; 36:58D0 $35
    call PointHLToEntityPosZ                      ;; 36:58D1 $CD $2D $6C
    ld   a, [hl]                                  ;; 36:58D4 $7E
    bit  7, a                                     ;; 36:58D5 $CB $7F
    jr   z, .ret_58E3                             ;; 36:58D7 $28 $0A

    xor  a                                        ;; 36:58D9 $AF
    ld   [hl], a                                  ;; 36:58DA $77
    call PointHLToEntitySpeedZ                    ;; 36:58DB $CD $F8 $6B
    ld   [hl], $10                                ;; 36:58DE $36 $10
    call IncrementEntityState                     ;; 36:58E0 $CD $12 $3B

.ret_58E3
    ret                                           ;; 36:58E3 $C9

func_036_58E4::
    ld   a, [wDialogState]                        ;; 36:58E4 $FA $9F $C1
    and  a                                        ;; 36:58E7 $A7
    jr   nz, ret_036_5911                         ;; 36:58E8 $20 $27

    call func_036_6B8A                            ;; 36:58EA $CD $8A $6B
    cp   $07                                      ;; 36:58ED $FE $07
    jr   nc, ret_036_5911                         ;; 36:58EF $30 $20

    call func_036_6B9A                            ;; 36:58F1 $CD $9A $6B
    cp   $0B                                      ;; 36:58F4 $FE $0B
    jr   nc, ret_036_5911                         ;; 36:58F6 $30 $19

    ldh  a, [hLinkDirection]                      ;; 36:58F8 $F0 $9E

.jr_58FA
    cp   $02                                      ;; 36:58FA $FE $02
    jr   nz, ret_036_5911                         ;; 36:58FC $20 $13

    ld   hl, wItemUsageContext                    ;; 36:58FE $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 36:5901 $36 $01
    ldh  a, [hJoypadState]                        ;; 36:5903 $F0 $CC
    and  J_A                                      ;; 36:5905 $E6 $10
    jr   z, ret_036_5911                          ;; 36:5907 $28 $08

    call_open_dialog Dialog266                    ;; 36:5909
    call IncrementEntityState                     ;; 36:590E $CD $12 $3B

ret_036_5911:
    ret                                           ;; 36:5911 $C9

func_036_5912::
    ld   a, [wDialogState]                        ;; 36:5912 $FA $9F $C1
    and  a                                        ;; 36:5915 $A7
    ret  nz                                       ;; 36:5916 $C0

    ld   a, [wDialogAskSelectionIndex]            ;; 36:5917 $FA $77 $C1
    and  a                                        ;; 36:591A $A7
    jr   nz, .jr_592A                             ;; 36:591B $20 $0D

    call func_036_6C0D                            ;; 36:591D $CD $0D $6C
    call_open_dialog Dialog267                    ;; 36:5920
    call IncrementEntityState                     ;; 36:5925 $CD $12 $3B
    jr   ret_036_592F                             ;; 36:5928 $18 $05

.jr_592A
    ld   a, $03                                   ;; 36:592A $3E $03
    call SetEntityState                           ;; 36:592C $CD $07 $6C

ret_036_592F:
    ret                                           ;; 36:592F $C9

func_036_5930::
    ld   a, [wDialogState]                        ;; 36:5930 $FA $9F $C1
    and  a                                        ;; 36:5933 $A7
    jr   nz, .ret_593E                            ;; 36:5934 $20 $08

    call func_036_6C0D                            ;; 36:5936 $CD $0D $6C
    ld   a, $03                                   ;; 36:5939 $3E $03
    call SetEntityState                           ;; 36:593B $CD $07 $6C

.ret_593E
    ret                                           ;; 36:593E $C9

ColorGuardianBlueEntityHandler::
ColorGuardianRedEntityHandler::
    push bc                                       ;; 36:593F $C5
    sla  c                                        ;; 36:5940 $CB $21
    sla  c                                        ;; 36:5942 $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 36:5944 $21 $80 $D5
    add  hl, bc                                   ;; 36:5947 $09
    inc  hl                                       ;; 36:5948 $23
    inc  hl                                       ;; 36:5949 $23
    ld   a, $06                                   ;; 36:594A $3E $06
    ld   [hl+], a                                 ;; 36:594C $22
    ld   [hl+], a                                 ;; 36:594D $22
    pop  bc                                       ;; 36:594E $C1
    ld   hl, wEntitiesHealthTable                 ;; 36:594F $21 $60 $C3
    add  hl, bc                                   ;; 36:5952 $09
    ld   [hl], $FF                                ;; 36:5953 $36 $FF
    call func_036_5AC8                            ;; 36:5955 $CD $C8 $5A
    ld   a, [wDialogState]                        ;; 36:5958 $FA $9F $C1
    and  a                                        ;; 36:595B $A7
    jr   nz, .jr_5964                             ;; 36:595C $20 $06

    call PushLinkOutOfEntity_36                   ;; 36:595E $CD $5C $6B
    call CheckLinkCollisionWithEnemy_trampoline   ;; 36:5961 $CD $5A $3B

.jr_5964
    xor  a                                        ;; 36:5964 $AF
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:5965 $21 $20 $C4
    add  hl, bc                                   ;; 36:5968 $09
    ld   [hl], a                                  ;; 36:5969 $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:596A $21 $10 $C4
    add  hl, bc                                   ;; 36:596D $09
    ld   [hl], a                                  ;; 36:596E $77
    ld   a, [wGameplayType]                       ;; 36:596F $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 36:5972 $FE $0B
    ret  nz                                       ;; 36:5974 $C0

    ld   a, [wDialogState]                        ;; 36:5975 $FA $9F $C1
    and  a                                        ;; 36:5978 $A7
    ret  nz                                       ;; 36:5979 $C0

    ldh  a, [hActiveEntityState]                  ;; 36:597A $F0 $F0
    JP_TABLE                                      ;; 36:597C
._00 dw func_036_59C3                             ;; 36:597D
._01 dw func_036_5A0A                             ;; 36:597F
._02 dw func_036_5A3B                             ;; 36:5981
._03 dw func_036_5A40                             ;; 36:5983
._04 dw func_036_5A7D                             ;; 36:5985
._05 dw func_036_5A87                             ;; 36:5987

func_036_5989::
    ld   hl, wEntitiesTypeTable                   ;; 36:5989 $21 $A0 $C3
    add  hl, bc                                   ;; 36:598C $09
    ld   a, [hl]                                  ;; 36:598D $7E
    xor  $01                                      ;; 36:598E $EE $01
    ld   de, $FFFF                                ;; 36:5990 $11 $FF $FF

.loop_5993
    inc  de                                       ;; 36:5993 $13
    ld   hl, wEntitiesTypeTable                   ;; 36:5994 $21 $A0 $C3
    add  hl, de                                   ;; 36:5997 $19
    cp   [hl]                                     ;; 36:5998 $BE
    jr   nz, .loop_5993                           ;; 36:5999 $20 $F8

    ld   hl, wEntitiesStateTable                  ;; 36:599B $21 $90 $C2
    add  hl, de                                   ;; 36:599E $19
    ld   a, [hl]                                  ;; 36:599F $7E
    cp   $03                                      ;; 36:59A0 $FE $03
    ret  nz                                       ;; 36:59A2 $C0

    ld   hl, wEntitiesTypeTable                   ;; 36:59A3 $21 $A0 $C3
    add  hl, bc                                   ;; 36:59A6 $09
    ld   a, [hl]                                  ;; 36:59A7 $7E
    call PointHLToEntitySpeedX                    ;; 36:59A8 $CD $EE $6B
    ld   [hl], $FA                                ;; 36:59AB $36 $FA
    and  $01                                      ;; 36:59AD $E6 $01
    jr   nz, .jr_59B3                             ;; 36:59AF $20 $02

    ld   [hl], $06                                ;; 36:59B1 $36 $06

.jr_59B3
    ld   a, $04                                   ;; 36:59B3 $3E $04
    call SetEntitySpriteVariant                   ;; 36:59B5 $CD $0C $3B
    ld   a, $01                                   ;; 36:59B8 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:59BA $E0 $A1
    ld   a, $05                                   ;; 36:59BC $3E $05
    call SetEntityState                           ;; 36:59BE $CD $07 $6C
    pop  af                                       ;; 36:59C1 $F1
    ret                                           ;; 36:59C2 $C9

func_036_59C3::
    call func_036_5989                            ;; 36:59C3 $CD $89 $59
    call func_036_6B8A                            ;; 36:59C6 $CD $8A $6B
    cp   $04                                      ;; 36:59C9 $FE $04
    jr   nc, jr_036_5A00                          ;; 36:59CB $30 $33

    call func_036_6B9A                            ;; 36:59CD $CD $9A $6B
    cp   $0B                                      ;; 36:59D0 $FE $0B
    jr   nc, jr_036_5A00                          ;; 36:59D2 $30 $2C

    ld   a, e                                     ;; 36:59D4 $7B
    and  $04                                      ;; 36:59D5 $E6 $04
    jr   z, jr_036_5A00                           ;; 36:59D7 $28 $27

    ld   hl, wItemUsageContext                    ;; 36:59D9 $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 36:59DC $36 $01
    ldh  a, [hJoypadState]                        ;; 36:59DE $F0 $CC
    and  J_A                                      ;; 36:59E0 $E6 $10
    jr   z, jr_036_5A00                           ;; 36:59E2 $28 $1C

    ld   hl, wEntitiesPrivateState1Table          ;; 36:59E4 $21 $B0 $C2
    add  hl, bc                                   ;; 36:59E7 $09
    ld   a, $01                                   ;; 36:59E8 $3E $01
    ld   [hl], a                                  ;; 36:59EA $77
    ld_dialog_low e, Dialog260 ; "Our colors are never the same" ;; 36:59EB $1E $60
    ldh  a, [hIsGBC]                              ;; 36:59ED $F0 $FE
    and  a                                        ;; 36:59EF $A7
    jr   nz, .jr_59F9                             ;; 36:59F0 $20 $07

    call_open_dialog Dialog262 ; "I am sorry, no color" ;; 36:59F2
    jr   jr_036_5A00                              ;; 36:59F7 $18 $07

.jr_59F9
    ld   a, e                                     ;; 36:59F9 $7B
    call OpenDialogInTable2                       ;; 36:59FA $CD $7C $23
    call IncrementEntityState                     ;; 36:59FD $CD $12 $3B

jr_036_5A00:
    ldh  a, [hFrameCounter]                       ;; 36:5A00 $F0 $E7
    swap a                                        ;; 36:5A02 $CB $37
    and  $01                                      ;; 36:5A04 $E6 $01
    call SetEntitySpriteVariant                   ;; 36:5A06 $CD $0C $3B
    ret                                           ;; 36:5A09 $C9

func_036_5A0A::
    ldh  a, [hActiveEntityType]                   ;; 36:5A0A $F0 $EB
    sub  ENTITY_COLOR_GUARDIAN_BLUE               ;; 36:5A0C $D6 $F6
IF __PATCH_1__
    xor  $01
ENDC
    ld   e, a                                     ;; 36:5A0E $5F
    ld   a, [wDialogAskSelectionIndex]            ;; 36:5A0F $FA $77 $C1
    cp   e                                        ;; 36:5A12 $BB
    jr   nz, .jr_5A1E                             ;; 36:5A13 $20 $09

    call_open_dialog Dialog264                    ;; 36:5A15
    call IncrementEntityState                     ;; 36:5A1A $CD $12 $3B
    ret                                           ;; 36:5A1D $C9

.jr_5A1E
    call PointHLToEntitySpeedX                    ;; 36:5A1E $CD $EE $6B
    ld   [hl], $FA                                ;; 36:5A21 $36 $FA
    ld   a, e                                     ;; 36:5A23 $7B
    and  a                                        ;; 36:5A24 $A7
IF __PATCH_1__
    jr   nz, .jr_5A2B
ELSE
    jr   z, .jr_5A2B                              ;; 36:5A25 $28 $04
ENDC

    ld   a, [hl]                                  ;; 36:5A27 $7E
    cpl                                           ;; 36:5A28 $2F
    inc  a                                        ;; 36:5A29 $3C
    ld   [hl], a                                  ;; 36:5A2A $77

.jr_5A2B
    ld   a, $02                                   ;; 36:5A2B $3E $02
    call SetEntitySpriteVariant                   ;; 36:5A2D $CD $0C $3B
    call_open_dialog Dialog265                    ;; 36:5A30
    ld   a, $03                                   ;; 36:5A35 $3E $03
    call SetEntityState                           ;; 36:5A37 $CD $07 $6C
    ret                                           ;; 36:5A3A $C9

func_036_5A3B::
    xor  a                                        ;; 36:5A3B $AF
    call SetEntityState                           ;; 36:5A3C $CD $07 $6C
    ret                                           ;; 36:5A3F $C9

func_036_5A40::
    ld   a, $02                                   ;; 36:5A40 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:5A42 $E0 $A1
    ld   [wC167], a                               ;; 36:5A44 $EA $67 $C1
    call PointHLToEntityPosX                      ;; 36:5A47 $CD $23 $6C
    ld_dialog_low e, Dialog25F ; "Do you have the powder?" ;; 36:5A4A $1E $5F
    ld   a, [hl]                                  ;; 36:5A4C $7E
    cp   $3C                                      ;; 36:5A4D $FE $3C
    jr   z, .jr_5A57                              ;; 36:5A4F $28 $06

    ld_dialog_low e, Dialog25E ; "The fairy queen is waiting" ;; 36:5A51 $1E $5E
    cp   $63                                      ;; 36:5A53 $FE $63
    jr   nz, jr_036_5A6A                          ;; 36:5A55 $20 $13

.jr_5A57
    ld   a, [wGameplayType]                       ;; 36:5A57 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 36:5A5A $FE $0B
    jr   nz, jr_036_5A6A                          ;; 36:5A5C $20 $0C

    xor  a                                        ;; 36:5A5E $AF
    ld   [wC167], a                               ;; 36:5A5F $EA $67 $C1
    ld   a, e                                     ;; 36:5A62 $7B
    call OpenDialogInTable2                       ;; 36:5A63 $CD $7C $23
    call IncrementEntityState                     ;; 36:5A66 $CD $12 $3B
    ret                                           ;; 36:5A69 $C9

jr_036_5A6A:
    call UpdateEntityPosWithSpeed_36              ;; 36:5A6A $CD $62 $6A
    call PointHLToEntitySpriteVariant             ;; 36:5A6D $CD $02 $6C
    ldh  a, [hFrameCounter]                       ;; 36:5A70 $F0 $E7
    srl  a                                        ;; 36:5A72 $CB $3F
    srl  a                                        ;; 36:5A74 $CB $3F
    srl  a                                        ;; 36:5A76 $CB $3F
    and  $01                                      ;; 36:5A78 $E6 $01
    xor  [hl]                                     ;; 36:5A7A $AE
    ld   [hl], a                                  ;; 36:5A7B $77
    ret                                           ;; 36:5A7C $C9

func_036_5A7D::
    ldh  a, [hFrameCounter]                       ;; 36:5A7D $F0 $E7
    swap a                                        ;; 36:5A7F $CB $37
    and  $01                                      ;; 36:5A81 $E6 $01
    call SetEntitySpriteVariant                   ;; 36:5A83 $CD $0C $3B
    ret                                           ;; 36:5A86 $C9

func_036_5A87::
    call PointHLToEntityPosX                      ;; 36:5A87 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:5A8A $7E
    cp   $50                                      ;; 36:5A8B $FE $50
    jr   nz, jr_036_5A6A                          ;; 36:5A8D $20 $DB

    xor  a                                        ;; 36:5A8F $AF
    call SetEntityState                           ;; 36:5A90 $CD $07 $6C
    ret                                           ;; 36:5A93 $C9

Unknown077SpriteVariantsPartE:
    db   $40, $03
    db   $42, $03
    db   $42, $23
    db   $40, $23
    db   $48, $03
    db   $4A, $03
    db   $4C, $03
    db   $4E, $03
    db   $4A, $23
    db   $48, $23
    db   $4E, $23
    db   $4C, $23

Unknown077SpriteVariantsPartD:
    db   $40, $02
    db   $42, $02
    db   $42, $22
    db   $40, $22
    db   $4A, $22
    db   $48, $22
    db   $4E, $22
    db   $4C, $22
    db   $48, $02
    db   $4A, $02
    db   $4C, $02
    db   $4E, $02

Unknown077SpriteVariantsCombiner::
    dw   Unknown077SpriteVariantsPartE
    dw   Unknown077SpriteVariantsPartD

func_036_5AC8::
    ld   d, $00                                   ;; 36:5AC8 $16 $00
    ldh  a, [hActiveEntityType]                   ;; 36:5ACA $F0 $EB
    sub  ENTITY_COLOR_GUARDIAN_BLUE               ;; 36:5ACC $D6 $F6
    sla  a                                        ;; 36:5ACE $CB $27
    ld   e, a                                     ;; 36:5AD0 $5F
    ld   hl, Unknown077SpriteVariantsCombiner     ;; 36:5AD1 $21 $C4 $5A
    add  hl, de                                   ;; 36:5AD4 $19
    ld   e, [hl]                                  ;; 36:5AD5 $5E
    inc  hl                                       ;; 36:5AD6 $23
    ld   d, [hl]                                  ;; 36:5AD7 $56
    call RenderActiveEntitySpritesPair            ;; 36:5AD8 $CD $C0 $3B
    ret                                           ;; 36:5ADB $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown078SpriteVariants::
.variant0
    db $40, $01
    db $40, $21
.variant1
    db $42, $01
    db $42, $21

label_036_5AE4:
    ld   de, Unknown078SpriteVariants             ;; 36:5AE4 $11 $DC $5A
    call RenderActiveEntitySpritesPair            ;; 36:5AE7 $CD $C0 $3B
    call ReturnIfNonInteractive_36                ;; 36:5AEA $CD $40 $6A
    call DecrementEntityIgnoreHitsCountdown       ;; 36:5AED $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:5AF0 $CD $39 $3B
    call UpdateEntityPosWithSpeed_36              ;; 36:5AF3 $CD $62 $6A
    call func_036_6C15                            ;; 36:5AF6 $CD $15 $6C
    jp   label_036_5BE8                           ;; 36:5AF9 $C3 $E8 $5B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown079SpriteVariants::
.variant0
    db $74, $01
    db $76, $01
.variant1
    db $74, $04
    db $76, $04
.variant2
    db $70, $01
    db $72, $01
.variant3
    db $70, $04
    db $72, $04
.variant4
    db $76, $21
    db $74, $21
.variant5
    db $76, $24
    db $74, $24
.variant6
    db $78, $01
    db $7A, $01
.variant7
    db $78, $04
    db $7A, $04

jr_036_5B1C:
    ld   de, Unknown079SpriteVariants             ;; 36:5B1C $11 $FC $5A
    call RenderActiveEntitySpritesPair            ;; 36:5B1F $CD $C0 $3B
    call ReturnIfNonInteractive_36                ;; 36:5B22 $CD $40 $6A
    call DecrementEntityIgnoreHitsCountdown       ;; 36:5B25 $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:5B28 $CD $39 $3B
    call UpdateEntityPosWithSpeed_36              ;; 36:5B2B $CD $62 $6A
    ld   hl, wEntitiesPrivateState1Table          ;; 36:5B2E $21 $B0 $C2
    add  hl, bc                                   ;; 36:5B31 $09
    ldh  a, [hFrameCounter]                       ;; 36:5B32 $F0 $E7
    and  $04                                      ;; 36:5B34 $E6 $04
    srl  a                                        ;; 36:5B36 $CB $3F
    srl  a                                        ;; 36:5B38 $CB $3F
    or   [hl]                                     ;; 36:5B3A $B6
    call PointHLToEntitySpriteVariant             ;; 36:5B3B $CD $02 $6C
    ld   [hl], a                                  ;; 36:5B3E $77
    jp   label_036_5BE8                           ;; 36:5B3F $C3 $E8 $5B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BouncingBoulderSpriteVariants::
.variant0
    db $6C, $07
    db $6E, $07
.variant1
    db $6E, $27
    db $6C, $27
.variant2
    db $6E, $67
    db $6C, $67
.variant3
    db $6C, $47
    db $6E, $47

Data_036_5B52::
    db   $0C, $F4, $05, $FB

Data_036_5B56::
    db   $08, $0A, $06, $0C

Data_036_5B5A::
    db   $18, $20, $1C, $28

BouncingBoulderEntityHandler::
    ld   a, [wD202]                               ;; 36:5B5E $FA $02 $D2
    ld   e, a                                     ;; 36:5B61 $5F
    ld   d, $00                                   ;; 36:5B62 $16 $00
    ld   hl, wEntitiesStatusTable                 ;; 36:5B64 $21 $80 $C2
    add  hl, de                                   ;; 36:5B67 $19
    ld   a, [hl]                                  ;; 36:5B68 $7E
    cp   $01                                      ;; 36:5B69 $FE $01
    jr   nz, .jr_5B73                             ;; 36:5B6B $20 $06

    call ClearEntityStatus_36                     ;; 36:5B6D $CD $89 $6C
    call func_036_5CAB                            ;; 36:5B70 $CD $AB $5C

.jr_5B73
    ldh  a, [hActiveEntityState]                  ;; 36:5B73 $F0 $F0
    bit  1, a                                     ;; 36:5B75 $CB $4F
    jr   nz, jr_036_5B1C                          ;; 36:5B77 $20 $A3

    bit  2, a                                     ;; 36:5B79 $CB $57
    jp   nz, label_036_5AE4                       ;; 36:5B7B $C2 $E4 $5A

    ld   de, BouncingBoulderSpriteVariants        ;; 36:5B7E $11 $42 $5B
    call RenderActiveEntitySpritesPair            ;; 36:5B81 $CD $C0 $3B
    call ReturnIfNonInteractive_36                ;; 36:5B84 $CD $40 $6A
    call DecrementEntityIgnoreHitsCountdown       ;; 36:5B87 $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:5B8A $CD $39 $3B
    ldh  a, [hFrameCounter]                       ;; 36:5B8D $F0 $E7
    rra                                           ;; 36:5B8F $1F
    rra                                           ;; 36:5B90 $1F
    rra                                           ;; 36:5B91 $1F
    and  $03                                      ;; 36:5B92 $E6 $03
    call SetEntitySpriteVariant                   ;; 36:5B94 $CD $0C $3B
    call UpdateEntityPosWithSpeed_36              ;; 36:5B97 $CD $62 $6A
    ldh  a, [hActiveEntityState]                  ;; 36:5B9A $F0 $F0
    bit  3, a                                     ;; 36:5B9C $CB $5F
    jr   nz, label_036_5BE8                       ;; 36:5B9E $20 $48

    call func_036_6AEC                            ;; 36:5BA0 $CD $EC $6A
    call label_3CD9                               ;; 36:5BA3 $CD $D9 $3C
    call PointHLToEntitySpeedZ                    ;; 36:5BA6 $CD $F8 $6B
    dec  [hl]                                     ;; 36:5BA9 $35
    dec  [hl]                                     ;; 36:5BAA $35
    call PointHLToEntityPosZ                      ;; 36:5BAB $CD $2D $6C
    ld   a, [hl]                                  ;; 36:5BAE $7E
    and  $80                                      ;; 36:5BAF $E6 $80
    jr   z, label_036_5BE8                        ;; 36:5BB1 $28 $35

    ld   [hl], b                                  ;; 36:5BB3 $70
    call GetRandomByte                            ;; 36:5BB4 $CD $0D $28
    and  $03                                      ;; 36:5BB7 $E6 $03
    ld   e, a                                     ;; 36:5BB9 $5F
    ld   d, b                                     ;; 36:5BBA $50
    ld   hl, Data_036_5B52                        ;; 36:5BBB $21 $52 $5B
    add  hl, de                                   ;; 36:5BBE $19
    ld   a, [hl]                                  ;; 36:5BBF $7E
    call PointHLToEntitySpeedX                    ;; 36:5BC0 $CD $EE $6B
    ld   [hl], a                                  ;; 36:5BC3 $77
    call GetRandomByte                            ;; 36:5BC4 $CD $0D $28
    and  $03                                      ;; 36:5BC7 $E6 $03
    ld   e, a                                     ;; 36:5BC9 $5F
    ld   d, b                                     ;; 36:5BCA $50
    ld   hl, Data_036_5B56                        ;; 36:5BCB $21 $56 $5B
    add  hl, de                                   ;; 36:5BCE $19
    ld   a, [hl]                                  ;; 36:5BCF $7E
    call PointHLToEntitySpeedY                    ;; 36:5BD0 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:5BD3 $77
    call GetRandomByte                            ;; 36:5BD4 $CD $0D $28
    and  $03                                      ;; 36:5BD7 $E6 $03
    ld   e, a                                     ;; 36:5BD9 $5F
    ld   d, b                                     ;; 36:5BDA $50
    ld   hl, Data_036_5B5A                        ;; 36:5BDB $21 $5A $5B
    add  hl, de                                   ;; 36:5BDE $19
    ld   a, [hl]                                  ;; 36:5BDF $7E
    call PointHLToEntitySpeedZ                    ;; 36:5BE0 $CD $F8 $6B
    ld   [hl], a                                  ;; 36:5BE3 $77
    ld   a, JINGLE_BOUNCE                         ;; 36:5BE4 $3E $20
    ldh  [hJingle], a                             ;; 36:5BE6 $E0 $F2

label_036_5BE8:
    ldh  a, [hActiveEntityPosX]                   ;; 36:5BE8 $F0 $EE
    cp   $A8                                      ;; 36:5BEA $FE $A8
    jp   nc, ClearEntityStatus_36                 ;; 36:5BEC $D2 $89 $6C

    ldh  a, [hActiveEntityVisualPosY]             ;; 36:5BEF $F0 $EC
    cp   $84                                      ;; 36:5BF1 $FE $84
    jp   nc, ClearEntityStatus_36                 ;; 36:5BF3 $D2 $89 $6C

    ret                                           ;; 36:5BF6 $C9

; Note: this entity, unlike most others, use 3 spriteslots (out of 4 available).
;
; In usual gameplay, only 2 spriteslots are updated during a room transition.
; The map transition code is special-cased for the color-dungeon to handle this.
AvalaunchEntityHandler::
    call label_394D                               ;; 36:5BF7 $CD $4D $39
    ld   a, c                                     ;; 36:5BFA $79
    ld   [wD202], a                               ;; 36:5BFB $EA $02 $D2
    call func_036_5F75                            ;; 36:5BFE $CD $75 $5F
    call label_3CD9                               ;; 36:5C01 $CD $D9 $3C
    ldh  a, [hActiveEntityStatus]                 ;; 36:5C04 $F0 $EA
    cp   $05                                      ;; 36:5C06 $FE $05
    jr   nz, AnimateBossAgony_1836                ;; 36:5C08 $20 $32

    call BossIntro                                ;; 36:5C0A $CD $E8 $3E
    call ReturnIfNonInteractive_36                ;; 36:5C0D $CD $40 $6A
    ld   a, [wC190]                               ;; 36:5C10 $FA $90 $C1
    and  a                                        ;; 36:5C13 $A7
    ret  z                                        ;; 36:5C14 $C8

    ld   hl, wEntitiesFlashCountdownTable         ;; 36:5C15 $21 $20 $C4
    add  hl, bc                                   ;; 36:5C18 $09
    ld   a, [hl]                                  ;; 36:5C19 $7E
    and  a                                        ;; 36:5C1A $A7
    jr   nz, .jr_5C23                             ;; 36:5C1B $20 $06

    xor  a                                        ;; 36:5C1D $AF
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:5C1E $21 $10 $C4
    add  hl, bc                                   ;; 36:5C21 $09
    ld   [hl], a                                  ;; 36:5C22 $77

.jr_5C23
    ldh  a, [hActiveEntityState]                  ;; 36:5C23 $F0 $F0
    JP_TABLE                                      ;; 36:5C25
._00 dw AvalaunchState0Handler
._01 dw AvalaunchState1Handler
._02 dw AvalaunchState2Handler
._03 dw AvalaunchState3Handler
._04 dw AvalaunchState4Handler
._05 dw AvalaunchState5Handler
._06 dw AvalaunchState6Handler
._07 dw AvalaunchState7Handler
._08 dw AvalaunchState8Handler
._09 dw AvalaunchState9Handler
._0A dw AvalaunchStateAHandler

; Kill boss or mini-boss enemy with explosions
AnimateBossAgony_1836::
    ld   hl, wEntitiesPrivateState5Table          ;; 36:5C3C $21 $90 $C3
    add  hl, bc                                   ;; 36:5C3F $09
    ld   a, [hl]                                  ;; 36:5C40 $7E
    JP_TABLE                                      ;; 36:5C41
._00 dw func_036_5C48                             ;; 36:5C42
._01 dw func_036_5C59                             ;; 36:5C44
._02 dw func_036_5C69                             ;; 36:5C46

func_036_5C48::
    call GetEntityTransitionCountdown             ;; 36:5C48 $CD $05 $0C
    ld   [hl], $A0                                ;; 36:5C4B $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:5C4D $21 $20 $C4
    add  hl, bc                                   ;; 36:5C50 $09
    ld   [hl], $FF                                ;; 36:5C51 $36 $FF

func_036_5C53::
    ld   hl, wEntitiesPrivateState5Table          ;; 36:5C53 $21 $90 $C3
    add  hl, bc                                   ;; 36:5C56 $09
    inc  [hl]                                     ;; 36:5C57 $34
    ret                                           ;; 36:5C58 $C9

func_036_5C59::
    call GetEntityTransitionCountdown             ;; 36:5C59 $CD $05 $0C
    ret  nz                                       ;; 36:5C5C $C0

    ld   [hl], $C0                                ;; 36:5C5D $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:5C5F $21 $20 $C4
    add  hl, bc                                   ;; 36:5C62 $09
    ld   [hl], $FF                                ;; 36:5C63 $36 $FF
    call func_036_5C53                            ;; 36:5C65 $CD $53 $5C
    ret                                           ;; 36:5C68 $C9

func_036_5C69::
    call GetEntityTransitionCountdown             ;; 36:5C69 $CD $05 $0C
    jr   z, .jr_5C72                              ;; 36:5C6C $28 $04

    call func_036_5C8B                            ;; 36:5C6E $CD $8B $5C
    ret                                           ;; 36:5C71 $C9

.jr_5C72
    ld   a, NOISE_SFX_BOSS_EXPLOSION              ;; 36:5C72 $3E $1A
    ldh  [hNoiseSfx], a                           ;; 36:5C74 $E0 $F4
    call label_27DD                               ;; 36:5C76 $CD $DD $27
    call DidKillEnemy                             ;; 36:5C79 $CD $50 $3F
    xor  a                                        ;; 36:5C7C $AF
    ld   [wC167], a                               ;; 36:5C7D $EA $67 $C1
    ld   hl, wColorDungeonRoomStatus              ;; 36:5C80 $21 $E0 $DD
    ldh  a, [hMapRoom]                            ;; 36:5C83 $F0 $F6
    ld   e, a                                     ;; 36:5C85 $5F
    ld   d, b                                     ;; 36:5C86 $50
    add  hl, de                                   ;; 36:5C87 $19
    set  5, [hl]                                  ;; 36:5C88 $CB $EE
    ret                                           ;; 36:5C8A $C9

func_036_5C8B::
    and  $07                                      ;; 36:5C8B $E6 $07
    ret  nz                                       ;; 36:5C8D $C0

    call GetRandomByte                            ;; 36:5C8E $CD $0D $28
    and  $1F                                      ;; 36:5C91 $E6 $1F
    sub  $10                                      ;; 36:5C93 $D6 $10
    ld   e, a                                     ;; 36:5C95 $5F
    ld   hl, hActiveEntityPosX                    ;; 36:5C96 $21 $EE $FF
    add  [hl]                                     ;; 36:5C99 $86
    ld   [hl], a                                  ;; 36:5C9A $77
    call GetRandomByte                            ;; 36:5C9B $CD $0D $28
    and  $1F                                      ;; 36:5C9E $E6 $1F
    sub  $14                                      ;; 36:5CA0 $D6 $14
    ld   e, a                                     ;; 36:5CA2 $5F
    ld   hl, hActiveEntityVisualPosY              ;; 36:5CA3 $21 $EC $FF
    add  [hl]                                     ;; 36:5CA6 $86
    ld   [hl], a                                  ;; 36:5CA7 $77
    call ReturnIfNonInteractive_36.allowInactiveEntity ;; 36:5CA8 $CD $46 $6A

func_036_5CAB::
    ldh  a, [hActiveEntityPosX]                   ;; 36:5CAB $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 36:5CAD $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 36:5CAF $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 36:5CB1 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 36:5CB3 $3E $02
    call AddTranscientVfx                         ;; 36:5CB5 $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ;; 36:5CB8 $3E $13
    ldh  [hNoiseSfx], a                           ;; 36:5CBA $E0 $F4
    ret                                           ;; 36:5CBC $C9

func_036_5CBD::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:5CBD $CD $39 $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:5CC0 $21 $20 $C4
    add  hl, bc                                   ;; 36:5CC3 $09
    ld   a, [hl]                                  ;; 36:5CC4 $7E
    and  a                                        ;; 36:5CC5 $A7
    ret  z                                        ;; 36:5CC6 $C8

IF __PATCH_0__
    call func_036_6B8A
    ld d, $20
    cp d
    jr nc, .jr_5CD9

    call func_036_6B9A
    ld d, $20
    cp d
    jr nc, .jr_5CD9
ENDC

    ld   a, $10                                   ;; 36:5CC7 $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 36:5CC9 $EA $3E $C1
    ld   a, $20                                   ;; 36:5CCC $3E $20
    call GetVectorTowardsLink_trampoline          ;; 36:5CCE $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 36:5CD1 $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 36:5CD3 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 36:5CD5 $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 36:5CD7 $E0 $9A

.jr_5CD9
    ld   a, $30                                   ;; 36:5CD9 $3E $30
    call SetEntityTransitionCountdown_36          ;; 36:5CDB $CD $83 $6C
    ld   hl, wEntitiesPrivateState2Table          ;; 36:5CDE $21 $C0 $C2
    add  hl, bc                                   ;; 36:5CE1 $09
    ld   [hl], $06                                ;; 36:5CE2 $36 $06
    ld   a, $08                                   ;; 36:5CE4 $3E $08
    call SetEntityState                           ;; 36:5CE6 $CD $07 $6C
    and  a                                        ;; 36:5CE9 $A7
    ret                                           ;; 36:5CEA $C9

AvalaunchState0Handler::
    ld   a, $10                                   ;; 36:5CEB $3E $10
    call SetEntityTransitionCountdown_36          ;; 36:5CED $CD $83 $6C
    call IncrementEntityState                     ;; 36:5CF0 $CD $12 $3B
    ret                                           ;; 36:5CF3 $C9

AvalaunchState2Handler::
    call_open_dialog Dialog26A                    ;; 36:5CF4 $3E $6A $CD $7C $23
    call IncrementEntityState                     ;; 36:5CF9 $CD $12 $3B
    ret                                           ;; 36:5CFC $C9

    ld   a, [wDialogState]                        ;; 36:5CFD $FA $9F $C1
    and  a                                        ;; 36:5D00 $A7
    ret  nz                                       ;; 36:5D01 $C0

    ld   a, $10                                   ;; 36:5D02 $3E $10
    call SetEntityTransitionCountdown_36          ;; 36:5D04 $CD $83 $6C
    call IncrementEntityState                     ;; 36:5D07 $CD $12 $3B
    ret                                           ;; 36:5D0A $C9

AvalaunchState3Handler::
    call func_036_5CBD                            ;; 36:5D0B $CD $BD $5C
    ret  nz                                       ;; 36:5D0E $C0

    call GetEntityTransitionCountdown             ;; 36:5D0F $CD $05 $0C
    ret  nz                                       ;; 36:5D12 $C0

    xor  a                                        ;; 36:5D13 $AF
    call PointHLToEntitySpeedX                    ;; 36:5D14 $CD $EE $6B
    ld   [hl], a                                  ;; 36:5D17 $77
    call PointHLToEntitySpeedY                    ;; 36:5D18 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:5D1B $77
    ld   hl, wEntitiesPrivateState3Table          ;; 36:5D1C $21 $D0 $C2
    add  hl, bc                                   ;; 36:5D1F $09
    call GetRandomByte                            ;; 36:5D20 $CD $0D $28
    and  [hl]                                     ;; 36:5D23 $A6
    jr   nz, .jr_5D39                             ;; 36:5D24 $20 $13

    ld   [hl], $01                                ;; 36:5D26 $36 $01
    call PointHLToEntitySpeedZ                    ;; 36:5D28 $CD $F8 $6B
    ld   [hl], $18                                ;; 36:5D2B $36 $18
    ld   hl, wEntitiesPrivateState2Table          ;; 36:5D2D $21 $C0 $C2
    add  hl, bc                                   ;; 36:5D30 $09
    ld   [hl], $00                                ;; 36:5D31 $36 $00
    ld   a, $09                                   ;; 36:5D33 $3E $09
    call SetEntityState                           ;; 36:5D35 $CD $07 $6C
    ret                                           ;; 36:5D38 $C9

.jr_5D39
    ld   a, $20                                   ;; 36:5D39 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:5D3B $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ;; 36:5D3E $21 $B0 $C2
    add  hl, bc                                   ;; 36:5D41 $09
    ld   [hl], $06                                ;; 36:5D42 $36 $06
    call PointHLToEntityDirection                 ;; 36:5D44 $CD $FD $6B
    ld   [hl], $03                                ;; 36:5D47 $36 $03
    call IncrementEntityState                     ;; 36:5D49 $CD $12 $3B
    call GetRandomByte                            ;; 36:5D4C $CD $0D $28
    and  $01                                      ;; 36:5D4F $E6 $01
    jr   z, .jr_5D62                              ;; 36:5D51 $28 $0F

    ld   [hl], $06                                ;; 36:5D53 $36 $06
    call PointHLToEntitySpeedX                    ;; 36:5D55 $CD $EE $6B
    call GetRandomByte                            ;; 36:5D58 $CD $0D $28
    and  $01                                      ;; 36:5D5B $E6 $01
    jr   nz, jr_036_5D65                          ;; 36:5D5D $20 $06

    ld   [hl], $C0                                ;; 36:5D5F $36 $C0
    ret                                           ;; 36:5D61 $C9

.jr_5D62
    call PointHLToEntitySpeedY                    ;; 36:5D62 $CD $F3 $6B

jr_036_5D65:
    ld   [hl], $40                                ;; 36:5D65 $36 $40
    ret                                           ;; 36:5D67 $C9

AvalaunchState4Handler::
    call func_036_5CBD                            ;; 36:5D68 $CD $BD $5C
    ret  nz                                       ;; 36:5D6B $C0

    call GetEntityTransitionCountdown             ;; 36:5D6C $CD $05 $0C
    jr   nz, .ret_5D97                            ;; 36:5D6F $20 $26

    call UpdateEntityPosWithSpeed_36              ;; 36:5D71 $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:5D74 $CD $23 $3B
    call func_036_6C0D                            ;; 36:5D77 $CD $0D $6C
    ld   a, $20                                   ;; 36:5D7A $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:5D7C $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ;; 36:5D7F $21 $B0 $C2
    add  hl, bc                                   ;; 36:5D82 $09
    dec  [hl]                                     ;; 36:5D83 $35
    ld   a, [hl]                                  ;; 36:5D84 $7E
    and  a                                        ;; 36:5D85 $A7
    jr   nz, .ret_5D97                            ;; 36:5D86 $20 $0F

    ld   [hl], $06                                ;; 36:5D88 $36 $06
    call PointHLToEntitySpeedY                    ;; 36:5D8A $CD $F3 $6B
    ld   [hl], $C0                                ;; 36:5D8D $36 $C0
    ld   a, $30                                   ;; 36:5D8F $3E $30
    call SetEntityTransitionCountdown_36          ;; 36:5D91 $CD $83 $6C
    call IncrementEntityState                     ;; 36:5D94 $CD $12 $3B

.ret_5D97
    ret                                           ;; 36:5D97 $C9

AvalaunchState5Handler::
    call func_036_5CBD                            ;; 36:5D98 $CD $BD $5C
    ret  nz                                       ;; 36:5D9B $C0

    call GetEntityTransitionCountdown             ;; 36:5D9C $CD $05 $0C
    jr   nz, .ret_5DC2                            ;; 36:5D9F $20 $21

    call UpdateEntityPosWithSpeed_36              ;; 36:5DA1 $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:5DA4 $CD $23 $3B
    call func_036_6C0D                            ;; 36:5DA7 $CD $0D $6C
    ld   a, $20                                   ;; 36:5DAA $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:5DAC $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ;; 36:5DAF $21 $B0 $C2
    add  hl, bc                                   ;; 36:5DB2 $09
    dec  [hl]                                     ;; 36:5DB3 $35
    ld   a, [hl]                                  ;; 36:5DB4 $7E
    and  a                                        ;; 36:5DB5 $A7
    jr   nz, .ret_5DC2                            ;; 36:5DB6 $20 $0A

    ld   a, $30                                   ;; 36:5DB8 $3E $30
    call SetEntityTransitionCountdown_36          ;; 36:5DBA $CD $83 $6C
    ld   a, $03                                   ;; 36:5DBD $3E $03
    call SetEntityState                           ;; 36:5DBF $CD $07 $6C

.ret_5DC2
    ret                                           ;; 36:5DC2 $C9

AvalaunchState6Handler::
    call func_036_5CBD                            ;; 36:5DC3 $CD $BD $5C
    ret  nz                                       ;; 36:5DC6 $C0

    call GetEntityTransitionCountdown             ;; 36:5DC7 $CD $05 $0C
    ret  nz                                       ;; 36:5DCA $C0

    call UpdateEntityPosWithSpeed_36              ;; 36:5DCB $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:5DCE $CD $23 $3B
    call func_036_6C0D                            ;; 36:5DD1 $CD $0D $6C
    ld   a, $20                                   ;; 36:5DD4 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:5DD6 $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ;; 36:5DD9 $21 $B0 $C2
    add  hl, bc                                   ;; 36:5DDC $09
    dec  [hl]                                     ;; 36:5DDD $35
    ld   a, [hl]                                  ;; 36:5DDE $7E
    and  a                                        ;; 36:5DDF $A7
    ret  nz                                       ;; 36:5DE0 $C0

    ld   [hl], $06                                ;; 36:5DE1 $36 $06
    call PointHLToEntitySpeedX                    ;; 36:5DE3 $CD $EE $6B
    ld   a, [hl]                                  ;; 36:5DE6 $7E
    cpl                                           ;; 36:5DE7 $2F
    inc  a                                        ;; 36:5DE8 $3C
    ld   [hl], a                                  ;; 36:5DE9 $77
    ld   a, $30                                   ;; 36:5DEA $3E $30
    call SetEntityTransitionCountdown_36          ;; 36:5DEC $CD $83 $6C
    call IncrementEntityState                     ;; 36:5DEF $CD $12 $3B
    ret                                           ;; 36:5DF2 $C9

AvalaunchState7Handler::
    call func_036_5CBD                            ;; 36:5DF3 $CD $BD $5C
    ret  nz                                       ;; 36:5DF6 $C0

    call GetEntityTransitionCountdown             ;; 36:5DF7 $CD $05 $0C
    ret  nz                                       ;; 36:5DFA $C0

    call UpdateEntityPosWithSpeed_36              ;; 36:5DFB $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:5DFE $CD $23 $3B
    call func_036_6C0D                            ;; 36:5E01 $CD $0D $6C
    ld   a, $20                                   ;; 36:5E04 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:5E06 $CD $83 $6C
    ld   hl, wEntitiesPrivateState1Table          ;; 36:5E09 $21 $B0 $C2
    add  hl, bc                                   ;; 36:5E0C $09
    dec  [hl]                                     ;; 36:5E0D $35
    ld   a, [hl]                                  ;; 36:5E0E $7E
    and  a                                        ;; 36:5E0F $A7
    ret  nz                                       ;; 36:5E10 $C0

    ld   a, $30                                   ;; 36:5E11 $3E $30
    call SetEntityTransitionCountdown_36          ;; 36:5E13 $CD $83 $6C
    ld   a, $03                                   ;; 36:5E16 $3E $03
    call SetEntityState                           ;; 36:5E18 $CD $07 $6C
    ret                                           ;; 36:5E1B $C9

AvalaunchState8Handler::
    call GetEntityTransitionCountdown             ;; 36:5E1C $CD $05 $0C
    ret  nz                                       ;; 36:5E1F $C0

    call func_036_6C0D                            ;; 36:5E20 $CD $0D $6C
    ld   a, $08                                   ;; 36:5E23 $3E $08
    call SetEntityTransitionCountdown_36          ;; 36:5E25 $CD $83 $6C
    ld   hl, wEntitiesPrivateState2Table          ;; 36:5E28 $21 $C0 $C2
    add  hl, bc                                   ;; 36:5E2B $09
    dec  [hl]                                     ;; 36:5E2C $35
    ld   a, [hl]                                  ;; 36:5E2D $7E
    and  a                                        ;; 36:5E2E $A7
    ret  nz                                       ;; 36:5E2F $C0

    ld   [hl], $01                                ;; 36:5E30 $36 $01
    xor  a                                        ;; 36:5E32 $AF
    call PointHLToEntitySpeedX                    ;; 36:5E33 $CD $EE $6B
    ld   [hl], a                                  ;; 36:5E36 $77
    call PointHLToEntitySpeedY                    ;; 36:5E37 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:5E3A $77
    call PointHLToEntitySpeedZ                    ;; 36:5E3B $CD $F8 $6B
    ld   [hl], $18                                ;; 36:5E3E $36 $18
    call IncrementEntityState                     ;; 36:5E40 $CD $12 $3B
    call PointHLToEntityPosX                      ;; 36:5E43 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:5E46 $7E
    call PointHLToEntitySpeedX                    ;; 36:5E47 $CD $EE $6B
    cp   $50                                      ;; 36:5E4A $FE $50
    jr   z, .jr_5E53                              ;; 36:5E4C $28 $05

    jr   nc, jr_036_5E56                          ;; 36:5E4E $30 $06

    ld   [hl], $10                                ;; 36:5E50 $36 $10
    ret                                           ;; 36:5E52 $C9

.jr_5E53
    call PointHLToEntitySpeedY                    ;; 36:5E53 $CD $F3 $6B

jr_036_5E56:
    ld   [hl], $F0                                ;; 36:5E56 $36 $F0
    ret                                           ;; 36:5E58 $C9

AvalaunchState9Handler::
    call UpdateEntityPosWithSpeed_36              ;; 36:5E59 $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:5E5C $CD $23 $3B
    call PointHLToEntitySpeedX                    ;; 36:5E5F $CD $EE $6B
    ld   a, [hl]                                  ;; 36:5E62 $7E
    and  a                                        ;; 36:5E63 $A7
    jr   z, jr_036_5E81                           ;; 36:5E64 $28 $1B

    call PointHLToEntityPosX                      ;; 36:5E66 $CD $23 $6C
    and  $80                                      ;; 36:5E69 $E6 $80
    jr   nz, .jr_5E74                             ;; 36:5E6B $20 $07

    ld   a, [hl]                                  ;; 36:5E6D $7E
    cp   $50                                      ;; 36:5E6E $FE $50
    jr   c, jr_036_5E81                           ;; 36:5E70 $38 $0F

    jr   jr_036_5E79                              ;; 36:5E72 $18 $05

.jr_5E74
    ld   a, [hl]                                  ;; 36:5E74 $7E
    cp   $50                                      ;; 36:5E75 $FE $50
    jr   nc, jr_036_5E81                          ;; 36:5E77 $30 $08

jr_036_5E79:
    ld   a, $50                                   ;; 36:5E79 $3E $50
    ld   [hl], a                                  ;; 36:5E7B $77
    call PointHLToEntitySpeedX                    ;; 36:5E7C $CD $EE $6B
    xor  a                                        ;; 36:5E7F $AF
    ld   [hl], a                                  ;; 36:5E80 $77

jr_036_5E81:
    call PointHLToEntitySpeedZ                    ;; 36:5E81 $CD $F8 $6B
    dec  [hl]                                     ;; 36:5E84 $35
    call func_036_6AEC                            ;; 36:5E85 $CD $EC $6A
    ld   a, [hl]                                  ;; 36:5E88 $7E
    bit  7, a                                     ;; 36:5E89 $CB $7F
    jr   z, ret_036_5EC1                          ;; 36:5E8B $28 $34

    xor  a                                        ;; 36:5E8D $AF
    ld   [hl], a                                  ;; 36:5E8E $77
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:5E8F $21 $20 $C4
    add  hl, bc                                   ;; 36:5E92 $09
    ld   [hl], a                                  ;; 36:5E93 $77
    ld   a, $30                                   ;; 36:5E94 $3E $30
    ld   [wScreenShakeCountdown], a               ;; 36:5E96 $EA $57 $C1
    ld   a, $04                                   ;; 36:5E99 $3E $04
    ld   [wC158], a                               ;; 36:5E9B $EA $58 $C1
    call func_036_5EC2                            ;; 36:5E9E $CD $C2 $5E
    ld   hl, wEntitiesPrivateState2Table          ;; 36:5EA1 $21 $C0 $C2
    add  hl, bc                                   ;; 36:5EA4 $09
    ld   a, [hl]                                  ;; 36:5EA5 $7E
    and  a                                        ;; 36:5EA6 $A7
    jr   z, .jr_5EAC                              ;; 36:5EA7 $28 $03

    call func_036_5EC2                            ;; 36:5EA9 $CD $C2 $5E

.jr_5EAC
    call PointHLToEntitySpriteVariant             ;; 36:5EAC $CD $02 $6C
    ld   a, [hl]                                  ;; 36:5EAF $7E
    and  $01                                      ;; 36:5EB0 $E6 $01
    jr   nz, .jr_5EB6                             ;; 36:5EB2 $20 $02

    ld   a, $80                                   ;; 36:5EB4 $3E $80

.jr_5EB6
    and  $80                                      ;; 36:5EB6 $E6 $80
    ld   [hl], a                                  ;; 36:5EB8 $77
    ld   a, $20                                   ;; 36:5EB9 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:5EBB $CD $83 $6C
    call IncrementEntityState                     ;; 36:5EBE $CD $12 $3B

ret_036_5EC1:
    ret                                           ;; 36:5EC1 $C9

func_036_5EC2::
    xor  a                                        ;; 36:5EC2 $AF
    ld   e, a                                     ;; 36:5EC3 $5F
    ld   d, a                                     ;; 36:5EC4 $57
    ldh  [hMultiPurpose0], a                      ;; 36:5EC5 $E0 $D7

jr_036_5EC7:
    ld   hl, wEntitiesTypeTable                   ;; 36:5EC7 $21 $A0 $C3
    add  hl, de                                   ;; 36:5ECA $19
    ld   a, [hl]                                  ;; 36:5ECB $7E
    cp   $F5                                      ;; 36:5ECC $FE $F5
    jr   nz, .jr_5EDC                             ;; 36:5ECE $20 $0C

    ld   hl, wEntitiesStatusTable                 ;; 36:5ED0 $21 $80 $C2
    add  hl, de                                   ;; 36:5ED3 $19
    ld   a, [hl]                                  ;; 36:5ED4 $7E
    and  a                                        ;; 36:5ED5 $A7
    jr   z, .jr_5EDC                              ;; 36:5ED6 $28 $04

    ld   hl, hMultiPurpose0                       ;; 36:5ED8 $21 $D7 $FF
    inc  [hl]                                     ;; 36:5EDB $34

.jr_5EDC
    inc  de                                       ;; 36:5EDC $13
    ld   a, e                                     ;; 36:5EDD $7B
    and  $0F                                      ;; 36:5EDE $E6 $0F
    jr   nz, jr_036_5EC7                          ;; 36:5EE0 $20 $E5

    ldh  a, [hMultiPurpose0]                      ;; 36:5EE2 $F0 $D7
    cp   $06                                      ;; 36:5EE4 $FE $06
    ret  nc                                       ;; 36:5EE6 $D0

    ld   a, ENTITY_BOUNCING_BOULDER               ;; 36:5EE7 $3E $F5
    call SpawnNewEntity_trampoline                ;; 36:5EE9 $CD $86 $3B
    ret  c                                        ;; 36:5EEC $D8

    call GetRandomByte                            ;; 36:5EED $CD $0D $28
    rla                                           ;; 36:5EF0 $17
    rla                                           ;; 36:5EF1 $17
    rla                                           ;; 36:5EF2 $17
    rla                                           ;; 36:5EF3 $17
    and  $70                                      ;; 36:5EF4 $E6 $70
    add  $18                                      ;; 36:5EF6 $C6 $18
    ld   hl, wEntitiesPosXTable                   ;; 36:5EF8 $21 $00 $C2
    add  hl, de                                   ;; 36:5EFB $19
    ld   [hl], a                                  ;; 36:5EFC $77
    ld   hl, wEntitiesPosYTable                   ;; 36:5EFD $21 $10 $C2
    add  hl, de                                   ;; 36:5F00 $19
    ld   [hl], $10                                ;; 36:5F01 $36 $10
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:5F03 $21 $40 $C3
    add  hl, de                                   ;; 36:5F06 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 36:5F07 $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ;; 36:5F09 $21 $50 $C3
    add  hl, de                                   ;; 36:5F0C $19
    set  7, [hl]                                  ;; 36:5F0D $CB $FE
    ld   hl, wEntitiesStateTable                  ;; 36:5F0F $21 $90 $C2
    add  hl, de                                   ;; 36:5F12 $19
    inc  [hl]                                     ;; 36:5F13 $34
    ret                                           ;; 36:5F14 $C9

AvalaunchStateAHandler::
    ld   a, [wIsLinkInTheAir]                     ;; 36:5F15 $FA $46 $C1
    and  a                                        ;; 36:5F18 $A7
    jr   nz, .jr_5F26                             ;; 36:5F19 $20 $0B

    ld   a, $01                                   ;; 36:5F1B $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:5F1D $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ;; 36:5F1F $3E $6A
    ldh  [hLinkAnimationState], a                 ;; 36:5F21 $E0 $9D
    ld   [wC167], a                               ;; 36:5F23 $EA $67 $C1

.jr_5F26
    call GetEntityTransitionCountdown             ;; 36:5F26 $CD $05 $0C
    ret  nz                                       ;; 36:5F29 $C0

    xor  a                                        ;; 36:5F2A $AF
    ld   [wC167], a                               ;; 36:5F2B $EA $67 $C1
    ld   a, $04                                   ;; 36:5F2E $3E $04
    call SetEntityTransitionCountdown_36          ;; 36:5F30 $CD $83 $6C
    call PointHLToEntitySpriteVariant             ;; 36:5F33 $CD $02 $6C
    inc  [hl]                                     ;; 36:5F36 $34
    ld   a, [hl]                                  ;; 36:5F37 $7E
    and  $0F                                      ;; 36:5F38 $E6 $0F
    cp   $03                                      ;; 36:5F3A $FE $03
    jr   nz, .jr_5F43                             ;; 36:5F3C $20 $05

    push af                                       ;; 36:5F3E $F5
    call func_036_5EC2                            ;; 36:5F3F $CD $C2 $5E
    pop  af                                       ;; 36:5F42 $F1

.jr_5F43
    cp   $06                                      ;; 36:5F43 $FE $06
    jr   c, .ret_5F58                             ;; 36:5F45 $38 $11

    ld   a, [hl]                                  ;; 36:5F47 $7E
    swap a                                        ;; 36:5F48 $CB $37
    srl  a                                        ;; 36:5F4A $CB $3F
    srl  a                                        ;; 36:5F4C $CB $3F
    srl  a                                        ;; 36:5F4E $CB $3F
    and  $01                                      ;; 36:5F50 $E6 $01
    ld   [hl], a                                  ;; 36:5F52 $77
    ld   a, $03                                   ;; 36:5F53 $3E $03
    call SetEntityState                           ;; 36:5F55 $CD $07 $6C

.ret_5F58
    ret                                           ;; 36:5F58 $C9

Data_036_5F59::
    dw   Data_020_68B8
    dw   Data_020_68D8

Data_036_5F5D::
    dw   Data_020_6918
    dw   Data_020_68B8
    dw   Data_020_68D8
    dw   Data_020_68F8
    dw   Data_020_68D8
    dw   Data_020_68B8

Data_036_5F69::
    dw   Data_020_68F8
    dw   Data_020_68D8
    dw   Data_020_68B8
    dw   Data_020_6918
    dw   Data_020_68B8
    dw   Data_020_68D8

func_036_5F75::
    ld   d, $00                                   ;; 36:5F75 $16 $00
    call PointHLToEntitySpriteVariant             ;; 36:5F77 $CD $02 $6C
    ld   e, [hl]                                  ;; 36:5F7A $5E
    ldh  a, [hActiveEntityState]                  ;; 36:5F7B $F0 $F0
    cp   $0A                                      ;; 36:5F7D $FE $0A
    jr   c, .jr_5F8D                              ;; 36:5F7F $38 $0C

    ld   hl, Data_036_5F5D                        ;; 36:5F81 $21 $5D $5F
    sla  e                                        ;; 36:5F84 $CB $23
    jr   nc, jr_036_5F92                          ;; 36:5F86 $30 $0A

    ld   hl, Data_036_5F69                        ;; 36:5F88 $21 $69 $5F
    jr   jr_036_5F92                              ;; 36:5F8B $18 $05

.jr_5F8D
    sla  e                                        ;; 36:5F8D $CB $23
    ld   hl, Data_036_5F59                        ;; 36:5F8F $21 $59 $5F

jr_036_5F92:
    call func_036_6C7E                            ;; 36:5F92 $CD $7E $6C
    ld   c, $08                                   ;; 36:5F95 $0E $08
    ld   a, $36                                   ;; 36:5F97 $3E $36
    call func_A5F                                 ;; 36:5F99 $CD $5F $0A
    ld   a, $08                                   ;; 36:5F9C $3E $08
    call func_015_7964_trampoline                 ;; 36:5F9E $CD $A0 $3D
    ret                                           ;; 36:5FA1 $C9

FlyingHopperBombsEntityHandler::
HopperEntityHandler::
    call func_036_6219                            ;; 36:5FA2 $CD $19 $62
    call ReturnIfNonInteractive_36                ;; 36:5FA5 $CD $40 $6A
    call label_3B70                               ;; 36:5FA8 $CD $70 $3B
    call UpdateEntityPosWithSpeed_36              ;; 36:5FAB $CD $62 $6A
    call label_3CD9                               ;; 36:5FAE $CD $D9 $3C
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:5FB1 $21 $20 $C4
    add  hl, bc                                   ;; 36:5FB4 $09
    ld   a, [hl]                                  ;; 36:5FB5 $7E
    and  a                                        ;; 36:5FB6 $A7
    jr   nz, .jr_5FBF                             ;; 36:5FB7 $20 $06

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:5FB9 $21 $10 $C4
    add  hl, bc                                   ;; 36:5FBC $09
    ld   [hl], $00                                ;; 36:5FBD $36 $00

.jr_5FBF
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:5FBF $21 $10 $C4
    add  hl, bc                                   ;; 36:5FC2 $09
    ld   a, [hl]                                  ;; 36:5FC3 $7E
    push af                                       ;; 36:5FC4 $F5
    push hl                                       ;; 36:5FC5 $E5
    ld   [hl], $01                                ;; 36:5FC6 $36 $01

.jr_5FC8
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:5FC8 $CD $23 $3B
    pop  hl                                       ;; 36:5FCB $E1
    pop  af                                       ;; 36:5FCC $F1
    ld   [hl], a                                  ;; 36:5FCD $77
    ldh  a, [hActiveEntityState]                  ;; 36:5FCE $F0 $F0
    JP_TABLE                                      ;; 36:5FD0
._00 dw HopperState0Handler
._01 dw HopperState1Handler
._02 dw HopperState2Handler
._03 dw HopperState3Handler
._04 dw HopperState4Handler

HopperState4Handler::
    call PointHLToEntitySpeedZ                    ;; 36:5FDB $CD $F8 $6B
    dec  [hl]                                     ;; 36:5FDE $35
    ld   a, [hl]                                  ;; 36:5FDF $7E
    ldh  [hMultiPurpose0], a                      ;; 36:5FE0 $E0 $D7
    call func_036_6AEC                            ;; 36:5FE2 $CD $EC $6A
    ld   a, [hl]                                  ;; 36:5FE5 $7E
    bit  7, a                                     ;; 36:5FE6 $CB $7F
    jr   z, ret_036_604E                          ;; 36:5FE8 $28 $64

    ldh  a, [hMultiPurpose0]                      ;; 36:5FEA $F0 $D7
    bit  7, a                                     ;; 36:5FEC $CB $7F
    jr   z, ret_036_604E                          ;; 36:5FEE $28 $5E

    ld   e, $04                                   ;; 36:5FF0 $1E $04
    call GetRandomByte                            ;; 36:5FF2 $CD $0D $28
    and  $01                                      ;; 36:5FF5 $E6 $01
    jr   z, .jr_5FFB                              ;; 36:5FF7 $28 $02

    ld   e, $FC                                   ;; 36:5FF9 $1E $FC

.jr_5FFB
    call PointHLToEntitySpeedX                    ;; 36:5FFB $CD $EE $6B
    ld   [hl], e                                  ;; 36:5FFE $73
    call PointHLToEntityDirection                 ;; 36:5FFF $CD $FD $6B
    ld   [hl], $00                                ;; 36:6002 $36 $00
    bit  7, e                                     ;; 36:6004 $CB $7B
    jr   nz, .jr_6009                             ;; 36:6006 $20 $01

    inc  [hl]                                     ;; 36:6008 $34

.jr_6009
    ld   e, $03                                   ;; 36:6009 $1E $03
    call GetRandomByte                            ;; 36:600B $CD $0D $28
    and  $01                                      ;; 36:600E $E6 $01
    jr   z, .jr_6014                              ;; 36:6010 $28 $02

    ld   e, $FD                                   ;; 36:6012 $1E $FD

.jr_6014
    call PointHLToEntitySpeedY                    ;; 36:6014 $CD $F3 $6B
    ld   [hl], e                                  ;; 36:6017 $73
    call PointHLToEntitySpeedZ                    ;; 36:6018 $CD $F8 $6B
    ld   [hl], $14                                ;; 36:601B $36 $14
    ld   a, JINGLE_FEATHER_JUMP                   ;; 36:601D $3E $0D
    ldh  [hJingle], a                             ;; 36:601F $E0 $F2

func_036_6021::
    ld   d, $00                                   ;; 36:6021 $16 $00
    call PointHLToEntityDirection                 ;; 36:6023 $CD $FD $6B
    ld   e, [hl]                                  ;; 36:6026 $5E
    call PointHLToEntityPosX                      ;; 36:6027 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:602A $7E
    ldh  [hMultiPurpose0], a                      ;; 36:602B $E0 $D7
    call PointHLToEntityPosY                      ;; 36:602D $CD $28 $6C
    ld   a, [hl]                                  ;; 36:6030 $7E
    ldh  [hMultiPurpose1], a                      ;; 36:6031 $E0 $D8
    ld   a, $36                                   ;; 36:6033 $3E $36
    call func_020_4874_trampoline                 ;; 36:6035 $CD $DE $09
    ld   hl, wRoomObjects                         ;; 36:6038 $21 $11 $D7
    add  hl, de                                   ;; 36:603B $19
    ld   a, [hl]                                  ;; 36:603C $7E
    cp   $53                                      ;; 36:603D $FE $53
    jr   z, .jr_6049                              ;; 36:603F $28 $08

    cp   $55                                      ;; 36:6041 $FE $55
    jr   z, .jr_6049                              ;; 36:6043 $28 $04

    cp   $54                                      ;; 36:6045 $FE $54
    jr   nz, ret_036_604E                         ;; 36:6047 $20 $05

.jr_6049
    ld   a, $36                                   ;; 36:6049 $3E $36
    call func_020_4954_trampoline                 ;; 36:604B $CD $E9 $09

ret_036_604E:
    ret                                           ;; 36:604E $C9

HopperState3Handler::
    xor  a                                        ;; 36:604F $AF
    call PointHLToEntitySpeedX                    ;; 36:6050 $CD $EE $6B
    ld   [hl], a                                  ;; 36:6053 $77
    call PointHLToEntitySpeedY                    ;; 36:6054 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:6057 $77
    call PointHLToEntitySpriteVariant             ;; 36:6058 $CD $02 $6C
    ld   [hl], a                                  ;; 36:605B $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:605C $21 $10 $C4
    add  hl, bc                                   ;; 36:605F $09
    ld   [hl], a                                  ;; 36:6060 $77
    call IncrementEntityState                     ;; 36:6061 $CD $12 $3B
    ret                                           ;; 36:6064 $C9

func_036_6065::
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:6065 $21 $20 $C4
    add  hl, bc                                   ;; 36:6068 $09
    ld   a, [hl]                                  ;; 36:6069 $7E
    and  a                                        ;; 36:606A $A7
    jr   z, .jr_607A                              ;; 36:606B $28 $0D

    ld   a, $03                                   ;; 36:606D $3E $03
    call SetEntityState                           ;; 36:606F $CD $07 $6C
    ld   hl, wEntitiesHealthGroup                 ;; 36:6072 $21 $D0 $C4
    add  hl, bc                                   ;; 36:6075 $09
    ld   [hl], $00                                ;; 36:6076 $36 $00
    jr   ret_036_6083                             ;; 36:6078 $18 $09

.jr_607A
    ldh  a, [hFrameCounter]                       ;; 36:607A $F0 $E7
    and  $07                                      ;; 36:607C $E6 $07
    jr   nz, ret_036_6083                         ;; 36:607E $20 $03

    call func_036_6C0D                            ;; 36:6080 $CD $0D $6C

ret_036_6083:
    ret                                           ;; 36:6083 $C9

func_036_6084::
    call func_036_6B8A                            ;; 36:6084 $CD $8A $6B
    cp   $10                                      ;; 36:6087 $FE $10
    jr   nc, ret_036_60B2                         ;; 36:6089 $30 $27

    ldh  [hMultiPurpose0], a                      ;; 36:608B $E0 $D7
    ld   a, e                                     ;; 36:608D $7B
    ldh  [hMultiPurpose1], a                      ;; 36:608E $E0 $D8
    call func_036_6B9A                            ;; 36:6090 $CD $9A $6B
    cp   $10                                      ;; 36:6093 $FE $10
    jr   nc, ret_036_60B2                         ;; 36:6095 $30 $1B

    call PointHLToEntitySpeedY                    ;; 36:6097 $CD $F3 $6B
    ld   [hl], $10                                ;; 36:609A $36 $10
    bit  1, e                                     ;; 36:609C $CB $4B
    jr   z, .jr_60A2                              ;; 36:609E $28 $02

    ld   [hl], $F0                                ;; 36:60A0 $36 $F0

.jr_60A2
    call PointHLToEntitySpeedX                    ;; 36:60A2 $CD $EE $6B
    ld   [hl], $10                                ;; 36:60A5 $36 $10
    bit  0, e                                     ;; 36:60A7 $CB $43
    jr   z, .jr_60AD                              ;; 36:60A9 $28 $02

    ld   [hl], $F0                                ;; 36:60AB $36 $F0

.jr_60AD
    ld   a, $02                                   ;; 36:60AD $3E $02
    call SetEntityState                           ;; 36:60AF $CD $07 $6C

ret_036_60B2:
    ret                                           ;; 36:60B2 $C9

Data_036_60B3::
    db   $08, $0C, $F8, $F4, $02, $00, $FE, $00

HopperState0Handler::
    call func_036_6065                            ;; 36:60BB $CD $65 $60
    call GetRandomByte                            ;; 36:60BE $CD $0D $28
    and  $07                                      ;; 36:60C1 $E6 $07
    ld   e, a                                     ;; 36:60C3 $5F
    ld   d, $00                                   ;; 36:60C4 $16 $00
    ld   hl, Data_036_60B3                        ;; 36:60C6 $21 $B3 $60
    add  hl, de                                   ;; 36:60C9 $19
    ld   a, [hl]                                  ;; 36:60CA $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 36:60CB $21 $B0 $C2
    add  hl, bc                                   ;; 36:60CE $09
    ld   [hl], a                                  ;; 36:60CF $77
    call PointHLToEntityPosX                      ;; 36:60D0 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:60D3 $7E
    sub  $40                                      ;; 36:60D4 $D6 $40
    ld   hl, wEntitiesPrivateState1Table          ;; 36:60D6 $21 $B0 $C2
    add  hl, bc                                   ;; 36:60D9 $09
    bit  7, a                                     ;; 36:60DA $CB $7F
    jr   z, .jr_60EC                              ;; 36:60DC $28 $0E

    cp   $D0                                      ;; 36:60DE $FE $D0
    jr   nc, jr_036_60F8                          ;; 36:60E0 $30 $16

    ld   a, [hl]                                  ;; 36:60E2 $7E
    bit  7, a                                     ;; 36:60E3 $CB $7F
    jr   z, jr_036_60F8                           ;; 36:60E5 $28 $11

    cpl                                           ;; 36:60E7 $2F
    inc  a                                        ;; 36:60E8 $3C
    ld   [hl], a                                  ;; 36:60E9 $77
    jr   jr_036_60F8                              ;; 36:60EA $18 $0C

.jr_60EC
    cp   $30                                      ;; 36:60EC $FE $30
    jr   c, jr_036_60F8                           ;; 36:60EE $38 $08

    ld   a, [hl]                                  ;; 36:60F0 $7E
    bit  7, a                                     ;; 36:60F1 $CB $7F
    jr   nz, jr_036_60F8                          ;; 36:60F3 $20 $03

    cpl                                           ;; 36:60F5 $2F
    inc  a                                        ;; 36:60F6 $3C
    ld   [hl], a                                  ;; 36:60F7 $77

jr_036_60F8:
    ld   a, [hl]                                  ;; 36:60F8 $7E
    call PointHLToEntityDirection                 ;; 36:60F9 $CD $FD $6B
    ld   [hl], $00                                ;; 36:60FC $36 $00
    bit  7, a                                     ;; 36:60FE $CB $7F
    jr   nz, .jr_6103                             ;; 36:6100 $20 $01

    inc  [hl]                                     ;; 36:6102 $34

.jr_6103
    call GetRandomByte                            ;; 36:6103 $CD $0D $28
    and  $07                                      ;; 36:6106 $E6 $07
    ld   e, a                                     ;; 36:6108 $5F
    ld   d, $00                                   ;; 36:6109 $16 $00
    ld   hl, Data_036_60B3                        ;; 36:610B $21 $B3 $60
    add  hl, de                                   ;; 36:610E $19
    ld   a, [hl]                                  ;; 36:610F $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 36:6110 $21 $C0 $C2
    add  hl, bc                                   ;; 36:6113 $09
    ld   [hl], a                                  ;; 36:6114 $77
    call PointHLToEntityPosY                      ;; 36:6115 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:6118 $7E
    sub  $40                                      ;; 36:6119 $D6 $40
    ld   hl, wEntitiesPrivateState2Table          ;; 36:611B $21 $C0 $C2
    add  hl, bc                                   ;; 36:611E $09
    bit  7, a                                     ;; 36:611F $CB $7F
    jr   z, .jr_6131                              ;; 36:6121 $28 $0E

    cp   $E0                                      ;; 36:6123 $FE $E0
    jr   nc, jr_036_613D                          ;; 36:6125 $30 $16

    ld   a, [hl]                                  ;; 36:6127 $7E
    bit  7, a                                     ;; 36:6128 $CB $7F
    jr   z, jr_036_613D                           ;; 36:612A $28 $11

    cpl                                           ;; 36:612C $2F
    inc  a                                        ;; 36:612D $3C
    ld   [hl], a                                  ;; 36:612E $77
    jr   jr_036_613D                              ;; 36:612F $18 $0C

.jr_6131
    cp   $20                                      ;; 36:6131 $FE $20
    jr   c, jr_036_613D                           ;; 36:6133 $38 $08

    ld   a, [hl]                                  ;; 36:6135 $7E
    bit  7, a                                     ;; 36:6136 $CB $7F
    jr   nz, jr_036_613D                          ;; 36:6138 $20 $03

    cpl                                           ;; 36:613A $2F
    inc  a                                        ;; 36:613B $3C
    ld   [hl], a                                  ;; 36:613C $77

jr_036_613D:
    call IncrementEntityState                     ;; 36:613D $CD $12 $3B
    call func_036_6084                            ;; 36:6140 $CD $84 $60
    ret                                           ;; 36:6143 $C9

HopperState1Handler::
    call func_036_6065                            ;; 36:6144 $CD $65 $60
    ldh  a, [hFrameCounter]                       ;; 36:6147 $F0 $E7
    and  $01                                      ;; 36:6149 $E6 $01
    jr   z, jr_036_6181                           ;; 36:614B $28 $34

    ld   hl, wEntitiesPrivateState1Table          ;; 36:614D $21 $B0 $C2
    add  hl, bc                                   ;; 36:6150 $09
    ld   a, [hl]                                  ;; 36:6151 $7E
    ld   e, a                                     ;; 36:6152 $5F
    call PointHLToEntitySpeedX                    ;; 36:6153 $CD $EE $6B
    cp   [hl]                                     ;; 36:6156 $BE
    jr   z, .jr_6160                              ;; 36:6157 $28 $07

    dec  [hl]                                     ;; 36:6159 $35
    bit  7, a                                     ;; 36:615A $CB $7F
    jr   nz, .jr_6160                             ;; 36:615C $20 $02

    inc  [hl]                                     ;; 36:615E $34
    inc  [hl]                                     ;; 36:615F $34

.jr_6160
    ld   hl, wEntitiesPrivateState2Table          ;; 36:6160 $21 $C0 $C2
    add  hl, bc                                   ;; 36:6163 $09
    ld   a, [hl]                                  ;; 36:6164 $7E
    ld   d, a                                     ;; 36:6165 $57
    call PointHLToEntitySpeedY                    ;; 36:6166 $CD $F3 $6B
    cp   [hl]                                     ;; 36:6169 $BE
    jr   z, .jr_6173                              ;; 36:616A $28 $07

    dec  [hl]                                     ;; 36:616C $35
    bit  7, a                                     ;; 36:616D $CB $7F
    jr   nz, .jr_6173                             ;; 36:616F $20 $02

    inc  [hl]                                     ;; 36:6171 $34
    inc  [hl]                                     ;; 36:6172 $34

.jr_6173
    ld   a, [hl]                                  ;; 36:6173 $7E
    cp   d                                        ;; 36:6174 $BA
    jr   nz, jr_036_6181                          ;; 36:6175 $20 $0A

    call PointHLToEntitySpeedX                    ;; 36:6177 $CD $EE $6B
    ld   a, [hl]                                  ;; 36:617A $7E
    cp   e                                        ;; 36:617B $BB
    jr   nz, jr_036_6181                          ;; 36:617C $20 $03

    call IncrementEntityState                     ;; 36:617E $CD $12 $3B

jr_036_6181:
    call func_036_6084                            ;; 36:6181 $CD $84 $60
    ret                                           ;; 36:6184 $C9

HopperState2Handler::
    call func_036_6065                            ;; 36:6185 $CD $65 $60
    ldh  a, [hFrameCounter]                       ;; 36:6188 $F0 $E7
    and  $01                                      ;; 36:618A $E6 $01
    jr   z, jr_036_6205                           ;; 36:618C $28 $77

    call PointHLToEntitySpeedX                    ;; 36:618E $CD $EE $6B
    ld   a, [hl]                                  ;; 36:6191 $7E
    and  a                                        ;; 36:6192 $A7
    jr   z, .jr_619C                              ;; 36:6193 $28 $07

    inc  [hl]                                     ;; 36:6195 $34
    bit  7, a                                     ;; 36:6196 $CB $7F
    jr   nz, .jr_619C                             ;; 36:6198 $20 $02

    dec  [hl]                                     ;; 36:619A $35
    dec  [hl]                                     ;; 36:619B $35

.jr_619C
    call PointHLToEntitySpeedY                    ;; 36:619C $CD $F3 $6B
    ld   a, [hl]                                  ;; 36:619F $7E
    and  a                                        ;; 36:61A0 $A7
    jr   z, .jr_61AA                              ;; 36:61A1 $28 $07

    inc  [hl]                                     ;; 36:61A3 $34
    bit  7, a                                     ;; 36:61A4 $CB $7F
    jr   nz, .jr_61AA                             ;; 36:61A6 $20 $02

    dec  [hl]                                     ;; 36:61A8 $35
    dec  [hl]                                     ;; 36:61A9 $35

.jr_61AA
    ld   a, [hl]                                  ;; 36:61AA $7E
    and  a                                        ;; 36:61AB $A7
    jr   nz, jr_036_6205                          ;; 36:61AC $20 $57

    call PointHLToEntitySpeedX                    ;; 36:61AE $CD $EE $6B
    ld   a, [hl]                                  ;; 36:61B1 $7E
    and  a                                        ;; 36:61B2 $A7
    jr   nz, jr_036_6205                          ;; 36:61B3 $20 $50

    ld   a, $10                                   ;; 36:61B5 $3E $10
    call SetEntityTransitionCountdown_36          ;; 36:61B7 $CD $83 $6C
    xor  a                                        ;; 36:61BA $AF
    call SetEntityState                           ;; 36:61BB $CD $07 $6C
    ld   a, [wHasPlacedBomb]                      ;; 36:61BE $FA $4E $C1
    and  a                                        ;; 36:61C1 $A7
    jr   nz, jr_036_6205                          ;; 36:61C2 $20 $41

    call GetRandomByte                            ;; 36:61C4 $CD $0D $28
    and  $03                                      ;; 36:61C7 $E6 $03
    jr   nz, jr_036_6205                          ;; 36:61C9 $20 $3A

    ld   a, ENTITY_BOMB                           ;; 36:61CB $3E $02
    call SpawnNewEntity_trampoline                ;; 36:61CD $CD $86 $3B
    jr   c, jr_036_6205                           ;; 36:61D0 $38 $33

    ld   hl, wEntitiesOptions1Table               ;; 36:61D2 $21 $30 $C4
    add  hl, de                                   ;; 36:61D5 $19
    res  0, [hl]                                  ;; 36:61D6 $CB $86
    call PointHLToEntityPosX                      ;; 36:61D8 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:61DB $7E
    ld   hl, wEntitiesPosXTable                   ;; 36:61DC $21 $00 $C2
    add  hl, de                                   ;; 36:61DF $19
    ld   [hl], a                                  ;; 36:61E0 $77
    call PointHLToEntityPosY                      ;; 36:61E1 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:61E4 $7E
    ld   hl, wEntitiesPosYTable                   ;; 36:61E5 $21 $10 $C2
    add  hl, de                                   ;; 36:61E8 $19
    ld   [hl], a                                  ;; 36:61E9 $77
    call PointHLToEntityPosZ                      ;; 36:61EA $CD $2D $6C
    ld   a, [hl]                                  ;; 36:61ED $7E
    ld   hl, wEntitiesPosZTable                   ;; 36:61EE $21 $10 $C3
    add  hl, de                                   ;; 36:61F1 $19
    ld   [hl], a                                  ;; 36:61F2 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 36:61F3 $21 $20 $C3
    add  hl, de                                   ;; 36:61F6 $19
    ld   [hl], $08                                ;; 36:61F7 $36 $08
    ld   hl, wEntitiesTransitionCountdownTable    ;; 36:61F9 $21 $E0 $C2
    add  hl, de                                   ;; 36:61FC $19
    ld   [hl], $48                                ;; 36:61FD $36 $48
    ld   hl, wEntitiesPrivateState4Table          ;; 36:61FF $21 $40 $C4
    add  hl, de                                   ;; 36:6202 $19
    ld   [hl], $01                                ;; 36:6203 $36 $01

jr_036_6205:
    call func_036_6084                            ;; 36:6205 $CD $84 $60
    ret                                           ;; 36:6208 $C9

Data_036_6209::
    dw   Data_020_6838
    dw   Data_020_6848
    dw   Data_020_6858
    dw   Data_020_6868
    dw   Data_020_6878
    dw   Data_020_6888
    dw   Data_020_6898
    dw   Data_020_68A8

func_036_6219::
    ld   d, $00                                   ;; 36:6219 $16 $00
    call PointHLToEntitySpriteVariant             ;; 36:621B $CD $02 $6C
    ld   a, [hl]                                  ;; 36:621E $7E
    sla  a                                        ;; 36:621F $CB $27
    ld   e, a                                     ;; 36:6221 $5F
    ld   hl, Data_036_6209                        ;; 36:6222 $21 $09 $62
    add  hl, de                                   ;; 36:6225 $19
    push hl                                       ;; 36:6226 $E5
    call PointHLToEntityDirection                 ;; 36:6227 $CD $FD $6B
    ld   a, [hl]                                  ;; 36:622A $7E
    sla  a                                        ;; 36:622B $CB $27
    sla  a                                        ;; 36:622D $CB $27
    ld   e, a                                     ;; 36:622F $5F
    pop  hl                                       ;; 36:6230 $E1
    call func_036_6C7E                            ;; 36:6231 $CD $7E $6C
    ld   c, $04                                   ;; 36:6234 $0E $04
    ld   a, $36                                   ;; 36:6236 $3E $36
    call func_A5F                                 ;; 36:6238 $CD $5F $0A
    ld   a, $04                                   ;; 36:623B $3E $04
    call func_015_7964_trampoline                 ;; 36:623D $CD $A0 $3D
    ret                                           ;; 36:6240 $C9

include "code/entities/36_rotoswitch.asm"

ColorGhoulRedEntityHandler::
ColorGhoulGreenEntityHandler::
ColorGhoulBlueEntityHandler::
    call func_036_6629                            ;; 36:63C9 $CD $29 $66
    ldh  a, [hActiveEntityStatus]                 ;; 36:63CC $F0 $EA
    cp   $05                                      ;; 36:63CE $FE $05
    call ReturnIfNonInteractive_36                ;; 36:63D0 $CD $40 $6A
    call PointHLToEntitySpriteVariant             ;; 36:63D3 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:63D6 $7E
    and  a                                        ;; 36:63D7 $A7
    jr   z, .jr_63DD                              ;; 36:63D8 $28 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:63DA $CD $39 $3B

.jr_63DD
    ld   a, [wC190]                               ;; 36:63DD $FA $90 $C1
    and  a                                        ;; 36:63E0 $A7
    ret  z                                        ;; 36:63E1 $C8

    ldh  a, [hActiveEntityState]                  ;; 36:63E2 $F0 $F0
    JP_TABLE                                      ;; 36:63E4
._00 dw ColorGhoulState0Handler
._01 dw ColorGhoulState1Handler
._02 dw ColorGhoulState2Handler
._03 dw ColorGhoulState3Handler
._04 dw ColorGhoulCommonStateHandler
._05 dw ColorGhoulCommonStateHandler
._06 dw ColorGhoulCommonStateHandler
._07 dw ColorGhoulCommonStateHandler
._08 dw ColorGhoulCommonStateHandler
._09 dw ColorGhoulCommonStateHandler
._0A dw ColorGhoulCommonStateHandler
._0B dw ColorGhoulStateBHandler

ColorGhoulState0Handler::
    call IncrementEntityState
    ret                                           ;; 36:6400 $C9

ColorGhoulState1Handler::
    call PointHLToEntityDirection                 ;; 36:6401 $CD $FD $6B
    ld   [hl], $00                                ;; 36:6404 $36 $00
    call func_036_6B8A                            ;; 36:6406 $CD $8A $6B
    cp   $28                                      ;; 36:6409 $FE $28
    jp   nc, label_036_6423                       ;; 36:640B $D2 $23 $64

    ldh  a, [hLinkPositionX]                      ;; 36:640E $F0 $98
    call func_036_6C46                            ;; 36:6410 $CD $46 $6C
    call func_036_6B9A                            ;; 36:6413 $CD $9A $6B
    cp   $28                                      ;; 36:6416 $FE $28
    jp   nc, label_036_6423                       ;; 36:6418 $D2 $23 $64

    ldh  a, [hLinkPositionY]                      ;; 36:641B $F0 $99
    call func_036_6C54                            ;; 36:641D $CD $54 $6C
    call IncrementEntityState                     ;; 36:6420 $CD $12 $3B

label_036_6423:
    ret                                           ;; 36:6423 $C9

Data_036_6424::
    db   $10, $0C, $0E

ColorGhoulState2Handler::
    ld   hl, Data_036_6424
    ldh  a, [hActiveEntityType]                   ;; 36:642A $F0 $EB
    sub  ENTITY_COLOR_GHOUL_RED                   ;; 36:642C $D6 $EC
    ld   e, a                                     ;; 36:642E $5F
    ld   d, $00                                   ;; 36:642F $16 $00
    add  hl, de                                   ;; 36:6431 $19
    ld   a, [hl]                                  ;; 36:6432 $7E
    call PointHLToEntitySpeedX                    ;; 36:6433 $CD $EE $6B
    ld   [hl], a                                  ;; 36:6436 $77
    call PointHLToEntitySpeedY                    ;; 36:6437 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:643A $77
    call PointHLToEntityPosX                      ;; 36:643B $CD $23 $6C
    ld   e, [hl]                                  ;; 36:643E $5E
    call func_036_6C62                            ;; 36:643F $CD $62 $6C
    sub  e                                        ;; 36:6442 $93
    ldh  [hMultiPurpose0], a                      ;; 36:6443 $E0 $D7
    call PointHLToEntitySpeedX                    ;; 36:6445 $CD $EE $6B
    and  a                                        ;; 36:6448 $A7
    jr   nz, .jr_644C                             ;; 36:6449 $20 $01

    ld   [hl], a                                  ;; 36:644B $77

.jr_644C
    bit  7, a                                     ;; 36:644C $CB $7F
    jr   z, .jr_6454                              ;; 36:644E $28 $04

    ld   a, [hl]                                  ;; 36:6450 $7E
    cpl                                           ;; 36:6451 $2F
    inc  a                                        ;; 36:6452 $3C
    ld   [hl], a                                  ;; 36:6453 $77

.jr_6454
    call PointHLToEntityPosY                      ;; 36:6454 $CD $28 $6C
    ld   e, [hl]                                  ;; 36:6457 $5E
    call func_036_6C70                            ;; 36:6458 $CD $70 $6C
    sub  e                                        ;; 36:645B $93
    ldh  [hMultiPurpose1], a                      ;; 36:645C $E0 $D8
    call PointHLToEntitySpeedY                    ;; 36:645E $CD $F3 $6B
    and  a                                        ;; 36:6461 $A7
    jr   nz, .jr_6465                             ;; 36:6462 $20 $01

    ld   [hl], a                                  ;; 36:6464 $77

.jr_6465
    bit  7, a                                     ;; 36:6465 $CB $7F
    jr   z, .jr_646D                              ;; 36:6467 $28 $04

    ld   a, [hl]                                  ;; 36:6469 $7E
    cpl                                           ;; 36:646A $2F
    inc  a                                        ;; 36:646B $3C
    ld   [hl], a                                  ;; 36:646C $77

.jr_646D
    ldh  a, [hMultiPurpose0]                      ;; 36:646D $F0 $D7
    and  $FE                                      ;; 36:646F $E6 $FE
    ld   e, a                                     ;; 36:6471 $5F
    ldh  a, [hMultiPurpose1]                      ;; 36:6472 $F0 $D8
    and  $FE                                      ;; 36:6474 $E6 $FE
    push af                                       ;; 36:6476 $F5
    push de                                       ;; 36:6477 $D5
    call UpdateEntityPosWithSpeed_36              ;; 36:6478 $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:647B $CD $23 $3B
    pop  de                                       ;; 36:647E $D1
    pop  af                                       ;; 36:647F $F1
    or   e                                        ;; 36:6480 $B3
    jr   nz, .jr_64A4                             ;; 36:6481 $20 $21

    ld   a, $08                                   ;; 36:6483 $3E $08
    call SetEntityTransitionCountdown_36          ;; 36:6485 $CD $83 $6C
    ld   a, $01                                   ;; 36:6488 $3E $01
    call SetEntitySpriteVariant                   ;; 36:648A $CD $0C $3B
    call IncrementEntityState                     ;; 36:648D $CD $12 $3B
    call func_036_6B8A                            ;; 36:6490 $CD $8A $6B
    call PointHLToEntityDirection                 ;; 36:6493 $CD $FD $6B
    ld   a, e                                     ;; 36:6496 $7B
    xor  $01                                      ;; 36:6497 $EE $01
    ld   [hl], a                                  ;; 36:6499 $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:649A $21 $40 $C3
    add  hl, bc                                   ;; 36:649D $09
    ld   a, [hl]                                  ;; 36:649E $7E
    and  ~ENTITY_PHYSICS_MASK                     ;; 36:649F $E6 $0F
    ld   [hl], a                                  ;; 36:64A1 $77
    jr   ret_036_64B9                             ;; 36:64A2 $18 $15

.jr_64A4
    ld   hl, wEntitiesCollisionsTable             ;; 36:64A4 $21 $A0 $C2
    add  hl, bc                                   ;; 36:64A7 $09
    ld   a, [hl]                                  ;; 36:64A8 $7E
    and  a                                        ;; 36:64A9 $A7
    jr   z, ret_036_64B9                          ;; 36:64AA $28 $0D

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:64AC $21 $40 $C3
    add  hl, bc                                   ;; 36:64AF $09
    ld   a, [hl]                                  ;; 36:64B0 $7E
    and  ~ENTITY_PHYSICS_GRABBABLE                ;; 36:64B1 $E6 $DF
    ld   [hl], a                                  ;; 36:64B3 $77
    ld   a, $01                                   ;; 36:64B4 $3E $01
    call SetEntityState                           ;; 36:64B6 $CD $07 $6C

ret_036_64B9:
    ret                                           ;; 36:64B9 $C9

Data_036_64BA::
    db   $04, $00, $02

ColorGhoulState3Handler::
    call GetEntityTransitionCountdown             ;; 36:64BD $CD $05 $0C
    jr   nz, .ret_64E6                            ;; 36:64C0 $20 $24

    ld   a, $08                                   ;; 36:64C2 $3E $08
    call SetEntityTransitionCountdown_36          ;; 36:64C4 $CD $83 $6C
    call PointHLToEntitySpriteVariant             ;; 36:64C7 $CD $02 $6C
    inc  [hl]                                     ;; 36:64CA $34
    ld   a, [hl]                                  ;; 36:64CB $7E
    cp   $03                                      ;; 36:64CC $FE $03
    jr   nz, .ret_64E6                            ;; 36:64CE $20 $16

    ld   a, $10                                   ;; 36:64D0 $3E $10
    call SetEntityTransitionCountdown_36          ;; 36:64D2 $CD $83 $6C
    ld   hl, Data_036_64BA                        ;; 36:64D5 $21 $BA $64
    ldh  a, [hActiveEntityType]                   ;; 36:64D8 $F0 $EB
    sub  ENTITY_COLOR_GHOUL_RED                   ;; 36:64DA $D6 $EC
    ld   e, a                                     ;; 36:64DC $5F
    ld   d, $00                                   ;; 36:64DD $16 $00
    add  hl, de                                   ;; 36:64DF $19
    ld   a, [hl]                                  ;; 36:64E0 $7E
    call IncrementEntityState                     ;; 36:64E1 $CD $12 $3B
    add  [hl]                                     ;; 36:64E4 $86
    ld   [hl], a                                  ;; 36:64E5 $77

.ret_64E6
    ret                                           ;; 36:64E6 $C9

ColorGhoulCommonStateHandler::
    call GetEntityTransitionCountdown             ;; 36:64E7 $CD $05 $0C
    ret  nz                                       ;; 36:64EA $C0

    call IncrementEntityState                     ;; 36:64EB $CD $12 $3B
    call PointHLToEntityDirection                 ;; 36:64EE $CD $FD $6B
    ld   a, [hl]                                  ;; 36:64F1 $7E
    xor  $01                                      ;; 36:64F2 $EE $01
    ld   [hl], a                                  ;; 36:64F4 $77
    ld   a, $08                                   ;; 36:64F5 $3E $08
    call SetEntityTransitionCountdown_36          ;; 36:64F7 $CD $83 $6C
    ldh  a, [hActiveEntityState]                  ;; 36:64FA $F0 $F0
    cp   $0A                                      ;; 36:64FC $FE $0A
    jr   c, .jr_6504                              ;; 36:64FE $38 $04

    call PointHLToEntitySpriteVariant             ;; 36:6500 $CD $02 $6C
    dec  [hl]                                     ;; 36:6503 $35

.jr_6504
    ret                                           ;; 36:6504 $C9

; @FIXME Data disassembled as code
    ld   d, c                                     ;; 36:6505 $51
    ld   d, b                                     ;; 36:6506 $50
    ld   d, d                                     ;; 36:6507 $52

ColorGhoulStateBHandler::
    call GetEntityTransitionCountdown             ;; 36:6508 $CD $05 $0C
    jp   nz, label_036_6528                       ;; 36:650B $C2 $28 $65

    ld   a, $08                                   ;; 36:650E $3E $08
    call SetEntityTransitionCountdown_36          ;; 36:6510 $CD $83 $6C
    call PointHLToEntitySpriteVariant             ;; 36:6513 $CD $02 $6C
    dec  [hl]                                     ;; 36:6516 $35
    ld   a, [hl]                                  ;; 36:6517 $7E
    and  a                                        ;; 36:6518 $A7
    jr   nz, label_036_6528                       ;; 36:6519 $20 $0D

    ld   a, $01                                   ;; 36:651B $3E $01
    call SetEntityState                           ;; 36:651D $CD $07 $6C
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:6520 $21 $40 $C3
    add  hl, bc                                   ;; 36:6523 $09
    ld   a, [hl]                                  ;; 36:6524 $7E
    or   ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP | ENTITY_PHYSICS_SHADOW ;; 36:6525 $F6 $D0
    ld   [hl], a                                  ;; 36:6527 $77

label_036_6528:
    ret                                           ;; 36:6528 $C9

Data_036_6529::
    db   $00, $00, $60, $02, $00, $08, $60, $22   ;; 36:6529

Data_036_6531::
    db   $00, $00, $60, $00, $00, $08, $60, $20   ;; 36:6531

Data_036_6539::
    db   $00, $00, $60, $03, $00, $08, $60, $23   ;; 36:6539

Data_036_6541::
    db   $00, $00, $62, $02, $00, $08, $62, $22   ;; 36:6541

Data_036_6549::
    db   $00, $00, $62, $00, $00, $08, $62, $20   ;; 36:6549

Data_036_6551::
    db   $00, $00, $62, $03, $00, $08, $62, $23   ;; 36:6551

Data_036_6559::
    db   $00, $00, $6C, $02, $00, $08, $6E, $02   ;; 36:6559

Data_036_6561::
    db   $00, $08, $6C, $22, $00, $00, $6E, $22   ;; 36:6561

Data_036_6569::
    db   $00, $00, $6C, $00, $00, $08, $6E, $00   ;; 36:6569

Data_036_6571::
    db   $00, $08, $6C, $20, $00, $00, $6E, $20   ;; 36:6571

Data_036_6579::
    db   $00, $00, $6C, $03, $00, $08, $6E, $03   ;; 36:6579

Data_036_6581::
    db   $00, $08, $6C, $23, $00, $00, $6E, $23   ;; 36:6581

Data_036_6589::
    db   $F0, $00, $64, $02, $F0, $08, $66, $02   ;; 36:6589
    db   $00, $00, $68, $02, $00, $08, $6A, $02   ;; 36:6591

Data_036_6599::
    db   $F0, $00, $66, $22, $F0, $08, $64, $22   ;; 36:6599
    db   $00, $00, $6A, $22, $00, $08, $68, $22   ;; 36:65A1

Data_036_65A9::
    db   $F0, $00, $64, $00, $F0, $08, $66, $00   ;; 36:65A9
    db   $00, $00, $68, $00, $00, $08, $6A, $00   ;; 36:65B1

Data_036_65B9::
    db   $F0, $00, $66, $20, $F0, $08, $64, $20   ;; 36:65B9
    db   $00, $00, $6A, $20, $00, $08, $68, $20   ;; 36:65C1

Data_036_65C9::
    db   $F0, $00, $64, $03, $F0, $08, $66, $03   ;; 36:65C9
    db   $00, $00, $68, $03, $00, $08, $6A, $03   ;; 36:65D1

Data_036_65D9::
    db   $F0, $00, $66, $23, $F0, $08, $64, $23   ;; 36:65D9
    db   $00, $00, $6A, $23, $00, $08, $68, $23   ;; 36:65E1

Data_036_65E9::
    dw   Data_036_6529
    dw   Data_036_6541
    dw   Data_036_6559
    dw   Data_036_6589

Data_036_65F1::
    dw   Data_036_6531
    dw   Data_036_6549
    dw   Data_036_6569
    dw   Data_036_65A9

Data_036_65F9::
    dw   Data_036_6539
    dw   Data_036_6551
    dw   Data_036_6579
    dw   Data_036_65C9

Data_036_6601::
    dw   Data_036_6529
    dw   Data_036_6541
    dw   Data_036_6561
    dw   Data_036_6599

Data_036_6609::
    dw   Data_036_6531
    dw   Data_036_6549
    dw   Data_036_6571
    dw   Data_036_65B9

Data_036_6611::
    dw   Data_036_6539
    dw   Data_036_6551
    dw   Data_036_6581
    dw   Data_036_65D9

Data_036_6619::
    dw   Data_036_65E9
    dw   Data_036_65F1
    dw   Data_036_65F9

Data_036_661F::
    dw   Data_036_6601
    dw   Data_036_6609
    dw   Data_036_6611

Data_036_6625::
    dw   Data_036_661F
    dw   Data_036_6619

func_036_6629::
    push bc                                       ;; 36:6629 $C5
    ld   d, $00                                   ;; 36:662A $16 $00
    call PointHLToEntityDirection                 ;; 36:662C $CD $FD $6B
    ld   a, [hl]                                  ;; 36:662F $7E
    sla  a                                        ;; 36:6630 $CB $27
    ld   e, a                                     ;; 36:6632 $5F
    ld   hl, Data_036_6625                        ;; 36:6633 $21 $25 $66
    call func_036_6C7E                            ;; 36:6636 $CD $7E $6C
    ldh  a, [hActiveEntityType]                   ;; 36:6639 $F0 $EB
    sub  ENTITY_COLOR_GHOUL_RED                   ;; 36:663B $D6 $EC
    sla  a                                        ;; 36:663D $CB $27
    ld   e, a                                     ;; 36:663F $5F
    call func_036_6C7E                            ;; 36:6640 $CD $7E $6C
    push hl                                       ;; 36:6643 $E5
    call PointHLToEntitySpriteVariant             ;; 36:6644 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:6647 $7E
    sla  a                                        ;; 36:6648 $CB $27
    ld   e, a                                     ;; 36:664A $5F
    pop  hl                                       ;; 36:664B $E1
    call func_036_6C7E                            ;; 36:664C $CD $7E $6C
    push hl                                       ;; 36:664F $E5
    call PointHLToEntitySpriteVariant             ;; 36:6650 $CD $02 $6C
    ld   c, $02                                   ;; 36:6653 $0E $02
    ld   a, [hl]                                  ;; 36:6655 $7E
    cp   $03                                      ;; 36:6656 $FE $03
    jr   c, .jr_665C                              ;; 36:6658 $38 $02

    ld   c, $04                                   ;; 36:665A $0E $04

.jr_665C
    pop  hl                                       ;; 36:665C $E1
    push bc                                       ;; 36:665D $C5
    call RenderActiveEntitySpritesRect            ;; 36:665E $CD $E6 $3C
    pop  bc                                       ;; 36:6661 $C1
    ld   a, c                                     ;; 36:6662 $79
    call func_015_7964_trampoline                 ;; 36:6663 $CD $A0 $3D
    pop  bc                                       ;; 36:6666 $C1
    ret                                           ;; 36:6667 $C9

ColorShellRedEntityHandler::
ColorShellGreenEntityHandler::
ColorShellBlueEntityHandler::
    call func_036_69D9                            ;; 36:6668 $CD $D9 $69
    call ReturnIfNonInteractive_36                ;; 36:666B $CD $40 $6A
    ldh  a, [hActiveEntityState]                  ;; 36:666E $F0 $F0
    cp   $0C                                      ;; 36:6670 $FE $0C
    jr   z, .jr_6677                              ;; 36:6672 $28 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:6674 $CD $39 $3B

.jr_6677
    ldh  a, [hActiveEntityState]                  ;; 36:6677 $F0 $F0
     JP_TABLE                                      ;; 36:6679
._00 dw ColorShellState0Handler
._01 dw ColorShellState1Handler
._02 dw ColorShellState2Handler
._03 dw ColorShellState3Handler
._04 dw ColorShellState4Handler
._05 dw ColorShellState5Handler
._06 dw ColorShellState6Handler
._07 dw ColorShellState7Handler
._08 dw ColorShellState8Handler
._09 dw ColorShellState9Handler
._0A dw ColorShellStateAHandler
._0B dw ColorShellStateBHandler
._0C dw ColorShellStateCHandler
._0D dw ColorShellStateDHandler

ColorShellState0Handler::
    call GetEntityTransitionCountdown             ;; 36:6696 $CD $05 $0C
    jr   nz, .jr_66B0                             ;; 36:6699 $20 $15

    call GetRandomByte                            ;; 36:669B $CD $0D $28
    and  $06                                      ;; 36:669E $E6 $06
    srl  a                                        ;; 36:66A0 $CB $3F
    call PointHLToEntityDirection                 ;; 36:66A2 $CD $FD $6B
    ld   [hl], a                                  ;; 36:66A5 $77
    ld   a, $40                                   ;; 36:66A6 $3E $40
    call SetEntityTransitionCountdown_36          ;; 36:66A8 $CD $83 $6C
    ld   a, $01                                   ;; 36:66AB $3E $01
    call SetEntityState                           ;; 36:66AD $CD $07 $6C

.jr_66B0
    call func_036_6B8A                            ;; 36:66B0 $CD $8A $6B
    cp   $30                                      ;; 36:66B3 $FE $30
    jp   nc, label_036_66C5                       ;; 36:66B5 $D2 $C5 $66

    call func_036_6B9A                            ;; 36:66B8 $CD $9A $6B
    cp   $30                                      ;; 36:66BB $FE $30
    jp   nc, label_036_66C5                       ;; 36:66BD $D2 $C5 $66

    ld   a, $01                                   ;; 36:66C0 $3E $01
    call SetEntityState                           ;; 36:66C2 $CD $07 $6C

label_036_66C5:
    ret                                           ;; 36:66C5 $C9

func_036_66C6::
    call PointHLToEntityPosX                      ;; 36:66C6 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:66C9 $7E
    cp   $16                                      ;; 36:66CA $FE $16
    jr   nc, .jr_66D2                             ;; 36:66CC $30 $04

    ld   a, $16                                   ;; 36:66CE $3E $16
    jr   jr_036_66D8                              ;; 36:66D0 $18 $06

.jr_66D2
    cp   $89                                      ;; 36:66D2 $FE $89
    jr   c, jr_036_66D9                           ;; 36:66D4 $38 $03

    ld   a, $89                                   ;; 36:66D6 $3E $89

jr_036_66D8:
    ld   [hl], a                                  ;; 36:66D8 $77

jr_036_66D9:
    call PointHLToEntityPosY                      ;; 36:66D9 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:66DC $7E
    cp   $1E                                      ;; 36:66DD $FE $1E
    jr   nc, .jr_66E5                             ;; 36:66DF $30 $04

    ld   a, $1E                                   ;; 36:66E1 $3E $1E
    jr   jr_036_66EB                              ;; 36:66E3 $18 $06

.jr_66E5
    cp   $72                                      ;; 36:66E5 $FE $72
    jr   c, jr_036_66EC                           ;; 36:66E7 $38 $03

    ld   a, $72                                   ;; 36:66E9 $3E $72

jr_036_66EB:
    ld   [hl], a                                  ;; 36:66EB $77

jr_036_66EC:
    ret                                           ;; 36:66EC $C9

    call GetRandomByte                            ;; 36:66ED $CD $0D $28
    and  $0F                                      ;; 36:66F0 $E6 $0F
    ret  nz                                       ;; 36:66F2 $C0

    xor  a                                        ;; 36:66F3 $AF
    ldh  [hMultiPurpose0], a                      ;; 36:66F4 $E0 $D7
    ld   e, $00                                   ;; 36:66F6 $1E $00
    ld   d, e                                     ;; 36:66F8 $53

jr_036_66F9:
    ld   hl, wEntitiesTypeTable                   ;; 36:66F9 $21 $A0 $C3
    add  hl, de                                   ;; 36:66FC $19
    ld   a, [hl]                                  ;; 36:66FD $7E
    cp   $7D                                      ;; 36:66FE $FE $7D
    jr   nz, .jr_670D                             ;; 36:6700 $20 $0B

    ld   hl, wEntitiesStatusTable                 ;; 36:6702 $21 $80 $C2
    add  hl, de                                   ;; 36:6705 $19
    ld   a, [hl]                                  ;; 36:6706 $7E
    and  a                                        ;; 36:6707 $A7
    ret  nz                                       ;; 36:6708 $C0

    ld   hl, hMultiPurpose0                       ;; 36:6709 $21 $D7 $FF
    inc  [hl]                                     ;; 36:670C $34

.jr_670D
    inc  de                                       ;; 36:670D $13
    ld   a, e                                     ;; 36:670E $7B
    and  $0F                                      ;; 36:670F $E6 $0F
    jr   nz, jr_036_66F9                          ;; 36:6711 $20 $E6

    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ;; 36:6713 $3E $7D
    call SpawnNewEntity_trampoline                ;; 36:6715 $CD $86 $3B
    ret  c                                        ;; 36:6718 $D8

    call PointHLToEntityPosX                      ;; 36:6719 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:671C $7E
    ld   hl, wEntitiesPosXTable                   ;; 36:671D $21 $00 $C2
    add  hl, de                                   ;; 36:6720 $19
    ld   [hl], a                                  ;; 36:6721 $77
    call PointHLToEntityPosY                      ;; 36:6722 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:6725 $7E
    ld   hl, wEntitiesPosYTable                   ;; 36:6726 $21 $10 $C2
    add  hl, de                                   ;; 36:6729 $19
    ld   [hl], a                                  ;; 36:672A $77
    push bc                                       ;; 36:672B $C5
    ld   c, e                                     ;; 36:672C $4B
    ld   b, d                                     ;; 36:672D $42
    ld   a, $10                                   ;; 36:672E $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 36:6730 $CD $AA $3B
    pop  bc                                       ;; 36:6733 $C1
    ret                                           ;; 36:6734 $C9

Data_036_6735::
    db   $03, $FD, $00, $00

Data_036_6739::
    db   $00, $00, $FD, $03

ColorShellState1Handler::
    call PointHLToEntityDirection                 ;; 36:673D $CD $FD $6B
    ld   a, [hl]                                  ;; 36:6740 $7E
    ld   e, a                                     ;; 36:6741 $5F
    ld   d, $00                                   ;; 36:6742 $16 $00
    ld   hl, Data_036_6735                        ;; 36:6744 $21 $35 $67
    add  hl, de                                   ;; 36:6747 $19
    ld   a, [hl]                                  ;; 36:6748 $7E
    call PointHLToEntitySpeedX                    ;; 36:6749 $CD $EE $6B
    ld   [hl], a                                  ;; 36:674C $77
    ld   hl, Data_036_6739                        ;; 36:674D $21 $39 $67
    add  hl, de                                   ;; 36:6750 $19
    ld   a, [hl]                                  ;; 36:6751 $7E
    call PointHLToEntitySpeedY                    ;; 36:6752 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:6755 $77
    call UpdateEntityPosWithSpeed_36              ;; 36:6756 $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:6759 $CD $23 $3B
    call func_036_66C6                            ;; 36:675C $CD $C6 $66
    call GetEntityTransitionCountdown             ;; 36:675F $CD $05 $0C
    jr   nz, label_036_679F                       ;; 36:6762 $20 $3B

    ld   a, $10                                   ;; 36:6764 $3E $10
    call SetEntityTransitionCountdown_36          ;; 36:6766 $CD $83 $6C
    ld   a, $00                                   ;; 36:6769 $3E $00
    jr   .jr_677F                                 ;; 36:676B $18 $12

    call func_036_6B8A                            ;; 36:676D $CD $8A $6B
    cp   $30                                      ;; 36:6770 $FE $30
    jp   nc, label_036_679F                       ;; 36:6772 $D2 $9F $67

    call func_036_6B9A                            ;; 36:6775 $CD $9A $6B
    cp   $30                                      ;; 36:6778 $FE $30
    jp   nc, label_036_679F                       ;; 36:677A $D2 $9F $67

    ld   a, $01                                   ;; 36:677D $3E $01

.jr_677F
    call SetEntityState                           ;; 36:677F $CD $07 $6C
    call func_036_6B8A                            ;; 36:6782 $CD $8A $6B
    cp   $20                                      ;; 36:6785 $FE $20
    jr   nc, label_036_679F                       ;; 36:6787 $30 $16

    call func_036_6B9A                            ;; 36:6789 $CD $9A $6B
    cp   $20                                      ;; 36:678C $FE $20
    jr   nc, label_036_679F                       ;; 36:678E $30 $0F

    ld   a, $0E                                   ;; 36:6790 $3E $0E
    call ApplyVectorTowardsLink_trampoline        ;; 36:6792 $CD $AA $3B
    ld   a, $20                                   ;; 36:6795 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:6797 $CD $83 $6C
    ld   a, $02                                   ;; 36:679A $3E $02
    call SetEntityState                           ;; 36:679C $CD $07 $6C

label_036_679F:
    call func_036_6C15                            ;; 36:679F $CD $15 $6C
    ret                                           ;; 36:67A2 $C9

ColorShellState2Handler::
    call GetEntityTransitionCountdown             ;; 36:67A3 $CD $05 $0C
    jr   nz, jr_036_67D1                          ;; 36:67A6 $20 $29

    ld   [hl], $18                                ;; 36:67A8 $36 $18
    ld   a, $03                                   ;; 36:67AA $3E $03
    call SetEntityState                           ;; 36:67AC $CD $07 $6C
    jr   jr_036_67D1                              ;; 36:67AF $18 $20

Data_036_67B1::
    db   $02, $03, $01, $00

ColorShellState3Handler::
    call GetEntityTransitionCountdown             ;; 36:67B5 $CD $05 $0C
    jr   nz, .jr_67C8                             ;; 36:67B8 $20 $0E

    ld   a, $01                                   ;; 36:67BA $3E $01
    call SetEntityState                           ;; 36:67BC $CD $07 $6C
    xor  a                                        ;; 36:67BF $AF
    call PointHLToEntitySpeedX                    ;; 36:67C0 $CD $EE $6B
    ld   [hl], a                                  ;; 36:67C3 $77
    call PointHLToEntitySpeedY                    ;; 36:67C4 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:67C7 $77

.jr_67C8
    call UpdateEntityPosWithSpeed_36              ;; 36:67C8 $CD $62 $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:67CB $CD $23 $3B
    call func_036_66C6                            ;; 36:67CE $CD $C6 $66

jr_036_67D1:
    ldh  a, [hFrameCounter]                       ;; 36:67D1 $F0 $E7
    and  $01                                      ;; 36:67D3 $E6 $01
    jr   nz, .jr_67F1                             ;; 36:67D5 $20 $1A

    call PointHLToEntitySpriteVariant             ;; 36:67D7 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:67DA $7E
    inc  a                                        ;; 36:67DB $3C
    and  $01                                      ;; 36:67DC $E6 $01
    ld   [hl], a                                  ;; 36:67DE $77
    and  a                                        ;; 36:67DF $A7
    jr   nz, .jr_67F1                             ;; 36:67E0 $20 $0F

    call PointHLToEntityDirection                 ;; 36:67E2 $CD $FD $6B
    ld   a, [hl]                                  ;; 36:67E5 $7E
    push hl                                       ;; 36:67E6 $E5
    ld   e, a                                     ;; 36:67E7 $5F
    ld   d, $00                                   ;; 36:67E8 $16 $00
    ld   hl, Data_036_67B1                        ;; 36:67EA $21 $B1 $67
    add  hl, de                                   ;; 36:67ED $19
    ld   a, [hl]                                  ;; 36:67EE $7E
    pop  hl                                       ;; 36:67EF $E1
    ld   [hl], a                                  ;; 36:67F0 $77

.jr_67F1
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:67F1 $21 $10 $C4
    add  hl, bc                                   ;; 36:67F4 $09
    ld   a, [hl]                                  ;; 36:67F5 $7E
    and  a                                        ;; 36:67F6 $A7
    jr   z, .jr_6806                              ;; 36:67F7 $28 $0D

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:67F9 $21 $40 $C3
    add  hl, bc                                   ;; 36:67FC $09
    ld   a, [hl]                                  ;; 36:67FD $7E
    or   ENTITY_PHYSICS_HARMLESS                  ;; 36:67FE $F6 $80
    ld   [hl], a                                  ;; 36:6800 $77
    ld   a, $04                                   ;; 36:6801 $3E $04
    call SetEntityState                           ;; 36:6803 $CD $07 $6C

.jr_6806
    ret                                           ;; 36:6806 $C9

    ld   a, [hl]                                  ;; 36:6807 $7E
    bit  7, a                                     ;; 36:6808 $CB $7F
    jr   z, .jr_6813                              ;; 36:680A $28 $07

    add  d                                        ;; 36:680C $82
    bit  7, a                                     ;; 36:680D $CB $7F
    jr   nz, jr_036_6819                          ;; 36:680F $20 $08

    jr   jr_036_6818                              ;; 36:6811 $18 $05

.jr_6813
    sub  d                                        ;; 36:6813 $92
    bit  7, a                                     ;; 36:6814 $CB $7F
    jr   z, jr_036_6819                           ;; 36:6816 $28 $01

jr_036_6818:
    xor  a                                        ;; 36:6818 $AF

jr_036_6819:
    ld   [hl], a                                  ;; 36:6819 $77
    ret                                           ;; 36:681A $C9

ColorShellState4Handler::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:681B $21 $10 $C4
    add  hl, bc                                   ;; 36:681E $09
    ld   [hl], $00                                ;; 36:681F $36 $00
    call IncrementEntityState                     ;; 36:6821 $CD $12 $3B
    ret                                           ;; 36:6824 $C9

ColorShellState5Handler::
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:6825 $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:6828 $21 $10 $C4
    add  hl, bc                                   ;; 36:682B $09
    ld   a, [hl]                                  ;; 36:682C $7E
    and  a                                        ;; 36:682D $A7
    jr   z, .jr_683F                              ;; 36:682E $28 $0F

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:6830 $21 $40 $C3
    add  hl, bc                                   ;; 36:6833 $09
    ld   a, [hl]                                  ;; 36:6834 $7E
    or   ENTITY_PHYSICS_HARMLESS                  ;; 36:6835 $F6 $80
    ld   [hl], a                                  ;; 36:6837 $77
    ld   a, $04                                   ;; 36:6838 $3E $04
    call SetEntityState                           ;; 36:683A $CD $07 $6C
    jr   ret_036_6856                             ;; 36:683D $18 $17

.jr_683F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:683F $21 $40 $C3
    add  hl, bc                                   ;; 36:6842 $09
    ld   a, [hl]                                  ;; 36:6843 $7E
    or   ENTITY_PHYSICS_HARMLESS                  ;; 36:6844 $F6 $80
    ld   [hl], a                                  ;; 36:6846 $77
    ldh  a, [hActiveEntityStatus]                 ;; 36:6847 $F0 $EA
    cp   $06                                      ;; 36:6849 $FE $06
    jr   nc, ret_036_6856                         ;; 36:684B $30 $09

    ld   a, [hl]                                  ;; 36:684D $7E
    and  $7F                                      ;; 36:684E $E6 $7F
    ld   [hl], a                                  ;; 36:6850 $77
    ld   a, $01                                   ;; 36:6851 $3E $01
    call SetEntityState                           ;; 36:6853 $CD $07 $6C

ret_036_6856:
    ret                                           ;; 36:6856 $C9

ColorShellState6Handler::
    ld   e, $28                                   ;; 36:6857 $1E $28
    call PointHLToEntityPosX                      ;; 36:6859 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:685C $7E
    cp   $50                                      ;; 36:685D $FE $50
    jr   c, .jr_6863                              ;; 36:685F $38 $02

    ld   e, $78                                   ;; 36:6861 $1E $78

.jr_6863
    ld   [hl], e                                  ;; 36:6863 $73
    ld   e, $30                                   ;; 36:6864 $1E $30
    call PointHLToEntityPosY                      ;; 36:6866 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:6869 $7E
    cp   $48                                      ;; 36:686A $FE $48
    jr   c, .jr_6870                              ;; 36:686C $38 $02

    ld   e, $60                                   ;; 36:686E $1E $60

.jr_6870
    ld   [hl], e                                  ;; 36:6870 $73
    call PointHLToEntitySpeedZ                    ;; 36:6871 $CD $F8 $6B
    ld   [hl], $10                                ;; 36:6874 $36 $10
    jr   jr_036_688A                              ;; 36:6876 $18 $12

ColorShellState7Handler::
    call PointHLToEntitySpeedZ                    ;; 36:6878 $CD $F8 $6B
    dec  [hl]                                     ;; 36:687B $35
    call func_036_6AEC                            ;; 36:687C $CD $EC $6A
    ld   a, [hl]                                  ;; 36:687F $7E
    bit  7, a                                     ;; 36:6880 $CB $7F
    jr   z, ret_036_688D                          ;; 36:6882 $28 $09

    xor  a                                        ;; 36:6884 $AF
    ld   [hl], a                                  ;; 36:6885 $77
    call PointHLToEntitySpeedZ                    ;; 36:6886 $CD $F8 $6B
    ld   [hl], a                                  ;; 36:6889 $77

jr_036_688A:
    call IncrementEntityState                     ;; 36:688A $CD $12 $3B

ret_036_688D:
    ret                                           ;; 36:688D $C9

Data_036_688E::
    db   $5E, $59, $63

ColorShellState8Handler::
    ldh  a, [hActiveEntityType]                   ;; 36:6891 $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ;; 36:6893 $D6 $E9
    ld   e, a                                     ;; 36:6895 $5F
    ld   d, $00                                   ;; 36:6896 $16 $00
    ld   hl, Data_036_688E                        ;; 36:6898 $21 $8E $68
    add  hl, de                                   ;; 36:689B $19
    ld   a, [hl]                                  ;; 36:689C $7E
    push af                                       ;; 36:689D $F5
    call func_036_6BCF                            ;; 36:689E $CD $CF $6B
    pop  af                                       ;; 36:68A1 $F1
    dec  hl                                       ;; 36:68A2 $2B
    cp   [hl]                                     ;; 36:68A3 $BE
    jr   nz, .jr_68C3                             ;; 36:68A4 $20 $1D

    ld   a, $0C                                   ;; 36:68A6 $3E $0C
    call SetEntityState                           ;; 36:68A8 $CD $07 $6C
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:68AB $21 $40 $C3
    add  hl, bc                                   ;; 36:68AE $09
    ld   a, [hl]                                  ;; 36:68AF $7E
    or   ENTITY_PHYSICS_MASK                      ;; 36:68B0 $F6 $F0
    ld   [hl], a                                  ;; 36:68B2 $77
    call func_036_6BCF                            ;; 36:68B3 $CD $CF $6B
    ldh  a, [hActiveEntityType]                   ;; 36:68B6 $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ;; 36:68B8 $D6 $E9
    add  $67                                      ;; 36:68BA $C6 $67
    ld   [hl], a                                  ;; 36:68BC $77
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ;; 36:68BD $3E $04
    ldh  [hNoiseSfx], a                           ;; 36:68BF $E0 $F4
    jr   ret_036_68EB                             ;; 36:68C1 $18 $28

.jr_68C3
    ld   a, JINGLE_WRONG_ANSWER                   ;; 36:68C3 $3E $1D
    ldh  [hJingle], a                             ;; 36:68C5 $E0 $F2
    ld   e, $10                                   ;; 36:68C7 $1E $10
    call PointHLToEntityPosX                      ;; 36:68C9 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:68CC $7E
    cp   $50                                      ;; 36:68CD $FE $50
    jr   c, .jr_68D3                              ;; 36:68CF $38 $02

    ld   e, $F0                                   ;; 36:68D1 $1E $F0

.jr_68D3
    xor  a                                        ;; 36:68D3 $AF
    call PointHLToEntitySpeedY                    ;; 36:68D4 $CD $F3 $6B
    ld   [hl], a                                  ;; 36:68D7 $77
    call PointHLToEntitySpeedX                    ;; 36:68D8 $CD $EE $6B
    ld   [hl], e                                  ;; 36:68DB $73
    call PointHLToEntitySpeedZ                    ;; 36:68DC $CD $F8 $6B
    ld   [hl], $10                                ;; 36:68DF $36 $10
    ld   a, $18                                   ;; 36:68E1 $3E $18
    call SetEntityTransitionCountdown_36          ;; 36:68E3 $CD $83 $6C
    ld   a, $09                                   ;; 36:68E6 $3E $09
    call SetEntityState                           ;; 36:68E8 $CD $07 $6C

ret_036_68EB:
    ret                                           ;; 36:68EB $C9

ColorShellState9Handler::
    call GetEntityTransitionCountdown             ;; 36:68EC $CD $05 $0C
    jr   nz, ret_036_691E                         ;; 36:68EF $20 $2D

    call PointHLToEntitySpeedX                    ;; 36:68F1 $CD $EE $6B
    ld   a, [hl]                                  ;; 36:68F4 $7E
    and  a                                        ;; 36:68F5 $A7
    jr   z, .jr_68FB                              ;; 36:68F6 $28 $03

    call UpdateEntityPosWithSpeed_36              ;; 36:68F8 $CD $62 $6A

.jr_68FB
    call PointHLToEntitySpeedZ                    ;; 36:68FB $CD $F8 $6B
    dec  [hl]                                     ;; 36:68FE $35
    call func_036_6AEC                            ;; 36:68FF $CD $EC $6A
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:6902 $CD $23 $3B
    call PointHLToEntityPosZ                      ;; 36:6905 $CD $2D $6C
    ld   a, [hl]                                  ;; 36:6908 $7E
    bit  7, a                                     ;; 36:6909 $CB $7F
    jr   z, ret_036_691E                          ;; 36:690B $28 $11

    xor  a                                        ;; 36:690D $AF
    ld   [hl], a                                  ;; 36:690E $77
    call PointHLToEntitySpeedZ                    ;; 36:690F $CD $F8 $6B
    ld   [hl], $08                                ;; 36:6912 $36 $08
    call PointHLToEntitySpeedX                    ;; 36:6914 $CD $EE $6B
    sra  [hl]                                     ;; 36:6917 $CB $2E
    ld   a, $0A                                   ;; 36:6919 $3E $0A
    call SetEntityState                           ;; 36:691B $CD $07 $6C

ret_036_691E:
    ret                                           ;; 36:691E $C9

ColorShellStateAHandler::
    call UpdateEntityPosWithSpeed_36              ;; 36:691F $CD $62 $6A
    call PointHLToEntitySpeedZ                    ;; 36:6922 $CD $F8 $6B
    dec  [hl]                                     ;; 36:6925 $35
    call func_036_6AEC                            ;; 36:6926 $CD $EC $6A
    push bc                                       ;; 36:6929 $C5
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:692A $CD $23 $3B
    pop  bc                                       ;; 36:692D $C1
    call PointHLToEntityPosZ                      ;; 36:692E $CD $2D $6C
    ld   a, [hl]                                  ;; 36:6931 $7E
    bit  7, a                                     ;; 36:6932 $CB $7F
    jr   z, .ret_693E                             ;; 36:6934 $28 $08

    ld   a, $20                                   ;; 36:6936 $3E $20
    call SetEntityTransitionCountdown_36          ;; 36:6938 $CD $83 $6C
    call IncrementEntityState                     ;; 36:693B $CD $12 $3B

.ret_693E
    ret                                           ;; 36:693E $C9

ColorShellStateBHandler::
    call GetEntityTransitionCountdown             ;; 36:693F $CD $05 $0C
    jr   nz, .ret_695B                            ;; 36:6942 $20 $17

    xor  a                                        ;; 36:6944 $AF
    ld   [hl], a                                  ;; 36:6945 $77
    call PointHLToEntitySpeedZ                    ;; 36:6946 $CD $F8 $6B
    ld   [hl], a                                  ;; 36:6949 $77
    call PointHLToEntitySpeedX                    ;; 36:694A $CD $EE $6B
    ld   [hl], a                                  ;; 36:694D $77
    ld   a, $01                                   ;; 36:694E $3E $01
    call SetEntityState                           ;; 36:6950 $CD $07 $6C
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:6953 $21 $40 $C3
    add  hl, bc                                   ;; 36:6956 $09
    ld   a, [hl]                                  ;; 36:6957 $7E
    and  ~ENTITY_PHYSICS_HARMLESS                 ;; 36:6958 $E6 $7F
    ld   [hl], a                                  ;; 36:695A $77

.ret_695B
    ret                                           ;; 36:695B $C9

ColorShellStateCHandler::
    ld   e, $00                                   ;; 36:695C $1E $00
    ld   d, e                                     ;; 36:695E $53

jr_036_695F:
    ld   hl, wEntitiesTypeTable                   ;; 36:695F $21 $A0 $C3
    add  hl, de                                   ;; 36:6962 $19
    ld   a, [hl]                                  ;; 36:6963 $7E
    cp   $E9                                      ;; 36:6964 $FE $E9
    jr   z, .jr_6970                              ;; 36:6966 $28 $08

    cp   $EA                                      ;; 36:6968 $FE $EA
    jr   z, .jr_6970                              ;; 36:696A $28 $04

    cp   $EB                                      ;; 36:696C $FE $EB
    jr   nz, jr_036_6981                          ;; 36:696E $20 $11

.jr_6970
    ld   hl, wEntitiesStatusTable                 ;; 36:6970 $21 $80 $C2
    add  hl, de                                   ;; 36:6973 $19
    ld   a, [hl]                                  ;; 36:6974 $7E
    and  a                                        ;; 36:6975 $A7
    jr   z, jr_036_6981                           ;; 36:6976 $28 $09

    ld   hl, wEntitiesStateTable                  ;; 36:6978 $21 $90 $C2
    add  hl, de                                   ;; 36:697B $19
    ld   a, [hl]                                  ;; 36:697C $7E
    cp   $0C                                      ;; 36:697D $FE $0C
    jr   c, ret_036_6999                          ;; 36:697F $38 $18

jr_036_6981:
    inc  e                                        ;; 36:6981 $1C
    ld   a, e                                     ;; 36:6982 $7B
    cp   $10                                      ;; 36:6983 $FE $10
    jr   nz, jr_036_695F                          ;; 36:6985 $20 $D8

    ld   a, $18                                   ;; 36:6987 $3E $18
    call SetEntityTransitionCountdown_36          ;; 36:6989 $CD $83 $6C
    call IncrementEntityState                     ;; 36:698C $CD $12 $3B
    call func_036_6BCF                            ;; 36:698F $CD $CF $6B
    ldh  a, [hActiveEntityType]                   ;; 36:6992 $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ;; 36:6994 $D6 $E9
    add  $67                                      ;; 36:6996 $C6 $67
    ld   [hl], a                                  ;; 36:6998 $77

ret_036_6999:
    ret                                           ;; 36:6999 $C9

Data_036_699A::
    db   $5F, $5A, $64

ColorShellStateDHandler::
    call GetEntityTransitionCountdown             ;; 36:699D $CD $05 $0C
    jr   nz, .ret_69CC                            ;; 36:69A0 $20 $2A

    ldh  a, [hActiveEntityType]                   ;; 36:69A2 $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ;; 36:69A4 $D6 $E9
    ld   e, a                                     ;; 36:69A6 $5F
    ld   d, $00                                   ;; 36:69A7 $16 $00
    ld   hl, Data_036_699A                        ;; 36:69A9 $21 $9A $69
    add  hl, de                                   ;; 36:69AC $19
    ld   a, [hl]                                  ;; 36:69AD $7E
    push af                                       ;; 36:69AE $F5
    call func_036_6BCF                            ;; 36:69AF $CD $CF $6B
    pop  af                                       ;; 36:69B2 $F1
    ld   [hl], a                                  ;; 36:69B3 $77
    call PointHLToEntityPosX                      ;; 36:69B4 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:69B7 $7E
    ldh  [hMultiPurpose0], a                      ;; 36:69B8 $E0 $D7
    call PointHLToEntityPosY                      ;; 36:69BA $CD $28 $6C
    ld   a, [hl]                                  ;; 36:69BD $7E
    call PointHLToEntityPosZ                      ;; 36:69BE $CD $2D $6C
    sub  [hl]                                     ;; 36:69C1 $96
    ldh  [hMultiPurpose1], a                      ;; 36:69C2 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 36:69C4 $3E $02
    call AddTranscientVfx                         ;; 36:69C6 $CD $C7 $0C
    call DidKillEnemy.label_3F5E                  ;; 36:69C9 $CD $5E $3F

.ret_69CC
    ret                                           ;; 36:69CC $C9

Data_036_69CD::
    dw   Data_020_6688
    dw   Data_020_66E8
    dw   Data_020_6748

Data_036_69D3::
    dw   Data_020_67A8
    dw   Data_020_67D8
    dw   Data_020_6808

func_036_69D9::
    ldh  a, [hActiveEntityType]                   ;; 36:69D9 $F0 $EB
    sub  ENTITY_COLOR_SHELL_RED                   ;; 36:69DB $D6 $E9
    sla  a                                        ;; 36:69DD $CB $27
    ldh  [hMultiPurpose0], a                      ;; 36:69DF $E0 $D7
    ld   d, $00                                   ;; 36:69E1 $16 $00
    call PointHLToEntitySpriteVariant             ;; 36:69E3 $CD $02 $6C
    ldh  a, [hActiveEntityState]                  ;; 36:69E6 $F0 $F0
    cp   $06                                      ;; 36:69E8 $FE $06
    jr   nc, .jr_69F2                             ;; 36:69EA $30 $06

    ldh  a, [hActiveEntityStatus]                 ;; 36:69EC $F0 $EA
    cp   $05                                      ;; 36:69EE $FE $05
    jr   z, jr_036_6A0A                           ;; 36:69F0 $28 $18

.jr_69F2
    ld   a, [hl]                                  ;; 36:69F2 $7E
    ld   l, a                                     ;; 36:69F3 $6F
    sla  a                                        ;; 36:69F4 $CB $27
    add  l                                        ;; 36:69F6 $85
    sla  a                                        ;; 36:69F7 $CB $27
    sla  a                                        ;; 36:69F9 $CB $27
    ld   e, a                                     ;; 36:69FB $5F
    push de                                       ;; 36:69FC $D5
    ldh  a, [hMultiPurpose0]                      ;; 36:69FD $F0 $D7
    ld   e, a                                     ;; 36:69FF $5F
    ld   hl, Data_036_69D3                        ;; 36:6A00 $21 $D3 $69
    add  hl, de                                   ;; 36:6A03 $19
    ld   a, [hl+]                                 ;; 36:6A04 $2A
    ld   h, [hl]                                  ;; 36:6A05 $66
    ld   l, a                                     ;; 36:6A06 $6F
    pop  de                                       ;; 36:6A07 $D1
    jr   jr_036_6A32                              ;; 36:6A08 $18 $28

jr_036_6A0A:
    ld   a, [hl]                                  ;; 36:6A0A $7E
    ld   l, a                                     ;; 36:6A0B $6F
    sla  a                                        ;; 36:6A0C $CB $27
    add  l                                        ;; 36:6A0E $85
    sla  a                                        ;; 36:6A0F $CB $27
    sla  a                                        ;; 36:6A11 $CB $27
    ld   e, a                                     ;; 36:6A13 $5F
    push de                                       ;; 36:6A14 $D5
    ldh  a, [hMultiPurpose0]                      ;; 36:6A15 $F0 $D7
    ld   e, a                                     ;; 36:6A17 $5F
    ld   hl, Data_036_69CD                        ;; 36:6A18 $21 $CD $69
    add  hl, de                                   ;; 36:6A1B $19
    ld   a, [hl+]                                 ;; 36:6A1C $2A
    ld   h, [hl]                                  ;; 36:6A1D $66
    ld   l, a                                     ;; 36:6A1E $6F
    pop  de                                       ;; 36:6A1F $D1
Data_036_6A20::
    push hl                                       ;; 36:6A20 $E5
    call PointHLToEntityDirection                 ;; 36:6A21 $CD $FD $6B
    ld   a, [hl]                                  ;; 36:6A24 $7E
    ld   l, a                                     ;; 36:6A25 $6F
    sla  a                                        ;; 36:6A26 $CB $27
Data_036_6A28::
    add  l                                        ;; 36:6A28 $85
    sla  a                                        ;; 36:6A29 $CB $27
    sla  a                                        ;; 36:6A2B $CB $27
    sla  a                                        ;; 36:6A2D $CB $27
    pop  hl                                       ;; 36:6A2F $E1
    add  hl, de                                   ;; 36:6A30 $19
    ld   e, a                                     ;; 36:6A31 $5F

jr_036_6A32:
    add  hl, de                                   ;; 36:6A32 $19
    ld   c, $03                                   ;; 36:6A33 $0E $03
    ld   a, $36                                   ;; 36:6A35 $3E $36
    call func_A5F                                 ;; 36:6A37 $CD $5F $0A
    ld   a, $03                                   ;; 36:6A3A $3E $03
    call func_015_7964_trampoline                 ;; 36:6A3C $CD $A0 $3D
    ret                                           ;; 36:6A3F $C9

; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_36::
    ldh  a, [hActiveEntityStatus]                 ;; 36:6A40 $F0 $EA
    cp   $05                                      ;; 36:6A42 $FE $05
    jr   nz, .skip                                ;; 36:6A44 $20 $1A

.allowInactiveEntity
    ld   a, [wGameplayType]                       ;; 36:6A46 $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 36:6A49 $FE $07
    jr   z, .skip                                 ;; 36:6A4B $28 $13

    ld   a, [wDialogState]                        ;; 36:6A4D $FA $9F $C1
    ld   hl, wC1A8                                ;; 36:6A50 $21 $A8 $C1
    or   [hl]                                     ;; 36:6A53 $B6
    ld   hl, wInventoryAppearing                  ;; 36:6A54 $21 $4F $C1
    or   [hl]                                     ;; 36:6A57 $B6
    jr   nz, .skip                                ;; 36:6A58 $20 $06

    ld   a, [wRoomTransitionState]                ;; 36:6A5A $FA $24 $C1
    and  a                                        ;; 36:6A5D $A7
    jr   z, .return                               ;; 36:6A5E $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ;; 36:6A60 $F1

.return
    ret                                           ;; 36:6A61 $C9

UpdateEntityPosWithSpeed_36::
    call AddEntitySpeedToPos_36                   ;; 36:6A62 $CD $6F $6A
    push bc                                       ;; 36:6A65 $C5
    ld   a, c                                     ;; 36:6A66 $79
    add  $10                                      ;; 36:6A67 $C6 $10
    ld   c, a                                     ;; 36:6A69 $4F
    call AddEntitySpeedToPos_36                   ;; 36:6A6A $CD $6F $6A
    pop  bc                                       ;; 36:6A6D $C1
    ret                                           ;; 36:6A6E $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_36::
    call PointHLToEntitySpeedX                    ;; 36:6A6F $CD $EE $6B
    ld   a, [hl]                                  ;; 36:6A72 $7E
    and  a                                        ;; 36:6A73 $A7
    ; No need to update the position if it's not moving
    ret  z                                        ;; 36:6A74 $C8

    push af                                       ;; 36:6A75 $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ;; 36:6A76 $CB $37
    and  $F0                                      ;; 36:6A78 $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 36:6A7A $21 $60 $C2
    add  hl, bc                                   ;; 36:6A7D $09
    add  [hl]                                     ;; 36:6A7E $86
    ld   [hl], a                                  ;; 36:6A7F $77
    ; Save carry in bit 0 of d
    rl   d                                        ;; 36:6A80 $CB $12
    call PointHLToEntityPosX                      ;; 36:6A82 $CD $23 $6C
    pop  af                                       ;; 36:6A85 $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ;; 36:6A86 $1E $00
    bit  7, a                                     ;; 36:6A88 $CB $7F
    jr   z, .positive                             ;; 36:6A8A $28 $02

    ld   e, $F0                                   ;; 36:6A8C $1E $F0

.positive
    swap a                                        ;; 36:6A8E $CB $37
    and  $0F                                      ;; 36:6A90 $E6 $0F
    or   e                                        ;; 36:6A92 $B3
    ; Get carry back from d
    rr   d                                        ;; 36:6A93 $CB $1A
    adc  [hl]                                     ;; 36:6A95 $8E
    ld   [hl], a                                  ;; 36:6A96 $77
    ret                                           ;; 36:6A97 $C9

func_036_6A98::
    ld   e, $00                                   ;; 36:6A98 $1E $00
    ldh  a, [hLinkPositionY]                      ;; 36:6A9A $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 36:6A9C $21 $EF $FF
    sub  [hl]                                     ;; 36:6A9F $96
    add  $04                                      ;; 36:6AA0 $C6 $04
    cp   $08                                      ;; 36:6AA2 $FE $08
    jr   nc, jr_036_6AEA                          ;; 36:6AA4 $30 $44

    ldh  a, [hLinkPositionX]                      ;; 36:6AA6 $F0 $98
    ld   hl, hActiveEntityPosX                    ;; 36:6AA8 $21 $EE $FF
    sub  [hl]                                     ;; 36:6AAB $96
    add  $10                                      ;; 36:6AAC $C6 $10
    cp   $18                                      ;; 36:6AAE $FE $18
    jr   nc, jr_036_6AEA                          ;; 36:6AB0 $30 $38

    inc  e                                        ;; 36:6AB2 $1C
    ldh  a, [hActiveEntityType]                   ;; 36:6AB3 $F0 $EB
    cp   ENTITY_BEAR                              ;; 36:6AB5 $FE $B5
    jr   z, .jr_6AC5                              ;; 36:6AB7 $28 $0C

    push de                                       ;; 36:6AB9 $D5
    call func_036_6BAB                            ;; 36:6ABA $CD $AB $6B
    ldh  a, [hLinkDirection]                      ;; 36:6ABD $F0 $9E
    xor  $01                                      ;; 36:6ABF $EE $01
    cp   e                                        ;; 36:6AC1 $BB
    pop  de                                       ;; 36:6AC2 $D1
    jr   nz, jr_036_6AEA                          ;; 36:6AC3 $20 $25

.jr_6AC5
    ld   hl, wItemUsageContext                    ;; 36:6AC5 $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 36:6AC8 $36 $01
    ld   a, [wDialogState]                        ;; 36:6ACA $FA $9F $C1
    ld   hl, wInventoryAppearing                  ;; 36:6ACD $21 $4F $C1
    or   [hl]                                     ;; 36:6AD0 $B6
    ld   hl, wIsLinkInTheAir                      ;; 36:6AD1 $21 $46 $C1
    or   [hl]                                     ;; 36:6AD4 $B6
    ld   hl, wDialogCooldown                      ;; 36:6AD5 $21 $34 $C1
    or   [hl]                                     ;; 36:6AD8 $B6
    jr   nz, jr_036_6AEA                          ;; 36:6AD9 $20 $0F

    ld   a, [wWindowY]                            ;; 36:6ADB $FA $9A $DB
    cp   $80                                      ;; 36:6ADE $FE $80
    jr   nz, jr_036_6AEA                          ;; 36:6AE0 $20 $08

    ldh  a, [hJoypadState]                        ;; 36:6AE2 $F0 $CC
    and  J_A                                      ;; 36:6AE4 $E6 $10
    jr   z, jr_036_6AEA                           ;; 36:6AE6 $28 $02

    scf                                           ;; 36:6AE8 $37
    ret                                           ;; 36:6AE9 $C9

jr_036_6AEA:
    and  a                                        ;; 36:6AEA $A7
    ret                                           ;; 36:6AEB $C9

func_036_6AEC::
    call PointHLToEntitySpeedZ                    ;; 36:6AEC $CD $F8 $6B
    ld   a, [hl]                                  ;; 36:6AEF $7E
    and  a                                        ;; 36:6AF0 $A7
    ret  z                                        ;; 36:6AF1 $C8

    push af                                       ;; 36:6AF2 $F5
    swap a                                        ;; 36:6AF3 $CB $37
    and  $F0                                      ;; 36:6AF5 $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ;; 36:6AF7 $21 $30 $C3
    add  hl, bc                                   ;; 36:6AFA $09
    add  [hl]                                     ;; 36:6AFB $86
    ld   [hl], a                                  ;; 36:6AFC $77
    rl   d                                        ;; 36:6AFD $CB $12
    call PointHLToEntityPosZ                      ;; 36:6AFF $CD $2D $6C
    pop  af                                       ;; 36:6B02 $F1
    ld   e, $00                                   ;; 36:6B03 $1E $00
    bit  7, a                                     ;; 36:6B05 $CB $7F
    jr   z, .jr_6B0B                              ;; 36:6B07 $28 $02

    ld   e, $F0                                   ;; 36:6B09 $1E $F0

.jr_6B0B
    swap a                                        ;; 36:6B0B $CB $37
    and  $0F                                      ;; 36:6B0D $E6 $0F
    or   e                                        ;; 36:6B0F $B3
    rr   d                                        ;; 36:6B10 $CB $1A
    adc  [hl]                                     ;; 36:6B12 $8E
    ld   [hl], a                                  ;; 36:6B13 $77
    ret                                           ;; 36:6B14 $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_36::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:6B15 $21 $10 $C4
    add  hl, bc                                   ;; 36:6B18 $09
    ld   a, [hl]                                  ;; 36:6B19 $7E
    and  a                                        ;; 36:6B1A $A7
    jr   z, .return                               ;; 36:6B1B $28 $3E

    dec  a                                        ;; 36:6B1D $3D
    ld   [hl], a                                  ;; 36:6B1E $77

    call label_3E8E                               ;; 36:6B1F $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    call PointHLToEntitySpeedX                    ;; 36:6B22 $CD $EE $6B
    ld   a, [hl]                                  ;; 36:6B25 $7E
    push af                                       ;; 36:6B26 $F5

    call PointHLToEntitySpeedY                    ;; 36:6B27 $CD $F3 $6B
    ld   a, [hl]                                  ;; 36:6B2A $7E
    push af                                       ;; 36:6B2B $F5

    ld   hl, wEntitiesRecoilVelocityX             ;; 36:6B2C $21 $F0 $C3
    add  hl, bc                                   ;; 36:6B2F $09
    ld   a, [hl]                                  ;; 36:6B30 $7E
    call PointHLToEntitySpeedX                    ;; 36:6B31 $CD $EE $6B
    ld   [hl], a                                  ;; 36:6B34 $77

    ld   hl, wEntitiesRecoilVelocityY             ;; 36:6B35 $21 $00 $C4
    add  hl, bc                                   ;; 36:6B38 $09
    ld   a, [hl]                                  ;; 36:6B39 $7E
    call PointHLToEntitySpeedY                    ;; 36:6B3A $CD $F3 $6B
    ld   [hl], a                                  ;; 36:6B3D $77

    call UpdateEntityPosWithSpeed_36              ;; 36:6B3E $CD $62 $6A

    ld   hl, wEntitiesOptions1Table               ;; 36:6B41 $21 $30 $C4
    add  hl, bc                                   ;; 36:6B44 $09
    ld   a, [hl]                                  ;; 36:6B45 $7E
    and  $20                                      ;; 36:6B46 $E6 $20
    jr   nz, .restoreOriginalSpeed                ;; 36:6B48 $20 $03

    call ApplyEntityInteractionWithBackground_trampoline ;; 36:6B4A $CD $23 $3B

.restoreOriginalSpeed
    call PointHLToEntitySpeedY                    ;; 36:6B4D $CD $F3 $6B
    pop  af                                       ;; 36:6B50 $F1
    ld   [hl], a                                  ;; 36:6B51 $77
    call PointHLToEntitySpeedX                    ;; 36:6B52 $CD $EE $6B
    pop  af                                       ;; 36:6B55 $F1
    ld   [hl], a                                  ;; 36:6B56 $77
    pop  af                                       ;; 36:6B57 $F1

    call StopEntityRecoilOnCollision              ;; 36:6B58 $CD $AF $3E

.return
    ret                                           ;; 36:6B5B $C9

PushLinkOutOfEntity_36::
    call CheckLinkCollisionWithEnemy_trampoline   ;; 36:6B5C $CD $5A $3B
    jr   nc, jr_036_6B88                          ;; 36:6B5F $30 $27

    call CopyLinkFinalPositionToPosition          ;; 36:6B61 $CD $BE $0C
    ld   a, [wC1A6]                               ;; 36:6B64 $FA $A6 $C1
    and  a                                        ;; 36:6B67 $A7
    jr   z, .jr_6B7B                              ;; 36:6B68 $28 $11

    ld   e, a                                     ;; 36:6B6A $5F
    ld   d, b                                     ;; 36:6B6B $50
    ld   hl, wEntitiesPrivateState5Table+15       ;; 36:6B6C $21 $9F $C3
    add  hl, de                                   ;; 36:6B6F $19
    ld   a, [hl]                                  ;; 36:6B70 $7E
    cp   $03                                      ;; 36:6B71 $FE $03
    jr   nz, .jr_6B7B                             ;; 36:6B73 $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ;; 36:6B75 $21 $8F $C2
    add  hl, de                                   ;; 36:6B78 $19
    ld   [hl], $00                                ;; 36:6B79 $36 $00

.jr_6B7B
    ld   a, [wIsRunningWithPegasusBoots]          ;; 36:6B7B $FA $4A $C1
    ld   e, a                                     ;; 36:6B7E $5F
    call ResetPegasusBoots                        ;; 36:6B7F $CD $B6 $0C
    call ClearLinkPositionIncrement               ;; 36:6B82 $CD $8E $17
    ld   a, e                                     ;; 36:6B85 $7B
    scf                                           ;; 36:6B86 $37
    ret                                           ;; 36:6B87 $C9

jr_036_6B88:
    and  a                                        ;; 36:6B88 $A7
    ret                                           ;; 36:6B89 $C9

func_036_6B8A::
    ld   e, $00                                   ;; 36:6B8A $1E $00
    ldh  a, [hLinkPositionX]                      ;; 36:6B8C $F0 $98
    call PointHLToEntityPosX                      ;; 36:6B8E $CD $23 $6C
    sub  [hl]                                     ;; 36:6B91 $96
    bit  7, a                                     ;; 36:6B92 $CB $7F
    jr   z, .ret_6B99                             ;; 36:6B94 $28 $03

    inc  e                                        ;; 36:6B96 $1C
    cpl                                           ;; 36:6B97 $2F
    inc  a                                        ;; 36:6B98 $3C

.ret_6B99
    ret                                           ;; 36:6B99 $C9

func_036_6B9A::
    ld   e, $04                                   ;; 36:6B9A $1E $04
    ldh  a, [hLinkPositionY]                      ;; 36:6B9C $F0 $99
    call PointHLToEntityPosY                      ;; 36:6B9E $CD $28 $6C
    sub  [hl]                                     ;; 36:6BA1 $96
    bit  7, a                                     ;; 36:6BA2 $CB $7F
    jr   z, .ret_6BAA                             ;; 36:6BA4 $28 $04

    ld   e, $02                                   ;; 36:6BA6 $1E $02
    cpl                                           ;; 36:6BA8 $2F
    inc  a                                        ;; 36:6BA9 $3C

.ret_6BAA
    ret                                           ;; 36:6BAA $C9

func_036_6BAB::
    call func_036_6B8A                            ;; 36:6BAB $CD $8A $6B
    ld   d, a                                     ;; 36:6BAE $57
    push af                                       ;; 36:6BAF $F5
    ld   a, e                                     ;; 36:6BB0 $7B
    ldh  [hMultiPurpose0], a                      ;; 36:6BB1 $E0 $D7
    call func_036_6B9A                            ;; 36:6BB3 $CD $9A $6B
    ld   d, a                                     ;; 36:6BB6 $57
    ld   a, e                                     ;; 36:6BB7 $7B
    xor  $06                                      ;; 36:6BB8 $EE $06
    cp   $04                                      ;; 36:6BBA $FE $04
    jr   nz, .jr_6BC0                             ;; 36:6BBC $20 $02

    ld   a, $03                                   ;; 36:6BBE $3E $03

.jr_6BC0
    ldh  [hMultiPurpose1], a                      ;; 36:6BC0 $E0 $D8
    ld   a, d                                     ;; 36:6BC2 $7A
    pop  de                                       ;; 36:6BC3 $D1
    cp   d                                        ;; 36:6BC4 $BA
    jr   nc, .jr_6BCB                             ;; 36:6BC5 $30 $04

    ldh  a, [hMultiPurpose0]                      ;; 36:6BC7 $F0 $D7
    jr   jr_036_6BCD                              ;; 36:6BC9 $18 $02

.jr_6BCB
    ldh  a, [hMultiPurpose1]                      ;; 36:6BCB $F0 $D8

jr_036_6BCD:
    ld   e, a                                     ;; 36:6BCD $5F
    ret                                           ;; 36:6BCE $C9

func_036_6BCF::
    call PointHLToEntityPosX                      ;; 36:6BCF $CD $23 $6C
    ld   a, [hl]                                  ;; 36:6BD2 $7E
    sub  $01                                      ;; 36:6BD3 $D6 $01
    and  $F0                                      ;; 36:6BD5 $E6 $F0
    swap a                                        ;; 36:6BD7 $CB $37
    ld   e, a                                     ;; 36:6BD9 $5F
    call PointHLToEntityPosY                      ;; 36:6BDA $CD $28 $6C
    ld   a, [hl]                                  ;; 36:6BDD $7E
    sub  $07                                      ;; 36:6BDE $D6 $07
    and  $F0                                      ;; 36:6BE0 $E6 $F0
    or   e                                        ;; 36:6BE2 $B3
    ld   e, a                                     ;; 36:6BE3 $5F
    ld   d, $00                                   ;; 36:6BE4 $16 $00
    ld   hl, wRoomObjects                         ;; 36:6BE6 $21 $11 $D7
    ld   a, h                                     ;; 36:6BE9 $7C
    add  hl, de                                   ;; 36:6BEA $19
    ld   h, a                                     ;; 36:6BEB $67
    ld   a, [hl]                                  ;; 36:6BEC $7E
    ret                                           ;; 36:6BED $C9

PointHLToEntitySpeedX::
    ld   hl, wEntitiesSpeedXTable                 ;; 36:6BEE $21 $40 $C2
    add  hl, bc                                   ;; 36:6BF1 $09
    ret                                           ;; 36:6BF2 $C9

PointHLToEntitySpeedY::
    ld   hl, wEntitiesSpeedYTable                 ;; 36:6BF3 $21 $50 $C2
    add  hl, bc                                   ;; 36:6BF6 $09
    ret                                           ;; 36:6BF7 $C9

PointHLToEntitySpeedZ::
    ld   hl, wEntitiesSpeedZTable                 ;; 36:6BF8 $21 $20 $C3
    add  hl, bc                                   ;; 36:6BFB $09
    ret                                           ;; 36:6BFC $C9

PointHLToEntityDirection::
    ld   hl, wEntitiesDirectionTable              ;; 36:6BFD $21 $80 $C3
    add  hl, bc                                   ;; 36:6C00 $09
    ret                                           ;; 36:6C01 $C9

PointHLToEntitySpriteVariant::
    ld   hl, wEntitiesSpriteVariantTable          ;; 36:6C02 $21 $B0 $C3
    add  hl, bc                                   ;; 36:6C05 $09
    ret                                           ;; 36:6C06 $C9

SetEntityState::
    ld   hl, wEntitiesStateTable                  ;; 36:6C07 $21 $90 $C2
    add  hl, bc                                   ;; 36:6C0A $09
    ld   [hl], a                                  ;; 36:6C0B $77
    ret                                           ;; 36:6C0C $C9

func_036_6C0D::
    call PointHLToEntitySpriteVariant             ;; 36:6C0D $CD $02 $6C
    ld   a, [hl]                                  ;; 36:6C10 $7E
    xor  $01                                      ;; 36:6C11 $EE $01
    ld   [hl], a                                  ;; 36:6C13 $77
    ret                                           ;; 36:6C14 $C9

func_036_6C15::
    ldh  a, [hFrameCounter]                       ;; 36:6C15 $F0 $E7
    and  $07                                      ;; 36:6C17 $E6 $07
    ret  nz                                       ;; 36:6C19 $C0

    call PointHLToEntitySpriteVariant             ;; 36:6C1A $CD $02 $6C
    ld   a, [hl]                                  ;; 36:6C1D $7E
    inc  a                                        ;; 36:6C1E $3C
    and  $01                                      ;; 36:6C1F $E6 $01
    ld   [hl], a                                  ;; 36:6C21 $77
    ret                                           ;; 36:6C22 $C9

PointHLToEntityPosX::
    ld   hl, wEntitiesPosXTable                   ;; 36:6C23 $21 $00 $C2
    add  hl, bc                                   ;; 36:6C26 $09
    ret                                           ;; 36:6C27 $C9

PointHLToEntityPosY::
    ld   hl, wEntitiesPosYTable                   ;; 36:6C28 $21 $10 $C2
    add  hl, bc                                   ;; 36:6C2B $09
    ret                                           ;; 36:6C2C $C9

PointHLToEntityPosZ::
    ld   hl, wEntitiesPosZTable                   ;; 36:6C2D $21 $10 $C3
    add  hl, bc                                   ;; 36:6C30 $09
    ret                                           ;; 36:6C31 $C9

func_036_6C32::
    ld   hl, wD030                                ;; 36:6C32 $21 $30 $D0
    add  hl, bc                                   ;; 36:6C35 $09
    ret                                           ;; 36:6C36 $C9

func_036_6C37::
    ld   hl, wD040                                ;; 36:6C37 $21 $40 $D0
    add  hl, bc                                   ;; 36:6C3A $09
    ret                                           ;; 36:6C3B $C9

    ld   hl, wD050                                ;; 36:6C3C $21 $50 $D0
    add  hl, bc                                   ;; 36:6C3F $09
    ret                                           ;; 36:6C40 $C9

    ld   hl, wD060                                ;; 36:6C41 $21 $60 $D0
    add  hl, bc                                   ;; 36:6C44 $09
    ret                                           ;; 36:6C45 $C9

func_036_6C46::
    ld   hl, rSVBK                                ;; 36:6C46 $21 $70 $FF
    ld   [hl], $02                                ;; 36:6C49 $36 $02
    push hl                                       ;; 36:6C4B $E5
    call func_036_6C32                            ;; 36:6C4C $CD $32 $6C
    ld   [hl], a                                  ;; 36:6C4F $77
    pop  hl                                       ;; 36:6C50 $E1
    ld   [hl], $00                                ;; 36:6C51 $36 $00
    ret                                           ;; 36:6C53 $C9

func_036_6C54::
    ld   hl, rSVBK                                ;; 36:6C54 $21 $70 $FF
    ld   [hl], $02                                ;; 36:6C57 $36 $02
    push hl                                       ;; 36:6C59 $E5
    call func_036_6C37                            ;; 36:6C5A $CD $37 $6C
    ld   [hl], a                                  ;; 36:6C5D $77
    pop  hl                                       ;; 36:6C5E $E1
    ld   [hl], $00                                ;; 36:6C5F $36 $00
    ret                                           ;; 36:6C61 $C9

func_036_6C62::
    ld   hl, rSVBK                                ;; 36:6C62 $21 $70 $FF
    ld   [hl], $02                                ;; 36:6C65 $36 $02
    push hl                                       ;; 36:6C67 $E5
    call func_036_6C32                            ;; 36:6C68 $CD $32 $6C
    ld   a, [hl]                                  ;; 36:6C6B $7E
    pop  hl                                       ;; 36:6C6C $E1
    ld   [hl], $00                                ;; 36:6C6D $36 $00
    ret                                           ;; 36:6C6F $C9

func_036_6C70::
    ld   hl, rSVBK                                ;; 36:6C70 $21 $70 $FF
    ld   [hl], $02                                ;; 36:6C73 $36 $02
    push hl                                       ;; 36:6C75 $E5
    call func_036_6C37                            ;; 36:6C76 $CD $37 $6C
    ld   a, [hl]                                  ;; 36:6C79 $7E
    pop  hl                                       ;; 36:6C7A $E1
    ld   [hl], $00                                ;; 36:6C7B $36 $00
    ret                                           ;; 36:6C7D $C9

func_036_6C7E::
    add  hl, de                                   ;; 36:6C7E $19
    ld   a, [hl+]                                 ;; 36:6C7F $2A
    ld   h, [hl]                                  ;; 36:6C80 $66
    ld   l, a                                     ;; 36:6C81 $6F
    ret                                           ;; 36:6C82 $C9

SetEntityTransitionCountdown_36::
    ld   hl, wEntitiesTransitionCountdownTable    ;; 36:6C83 $21 $E0 $C2
    add  hl, bc                                   ;; 36:6C86 $09
    ld   [hl], a                                  ;; 36:6C87 $77
    ret                                           ;; 36:6C88 $C9

ClearEntityStatus_36::
    ld   hl, wEntitiesStatusTable                 ;; 36:6C89 $21 $80 $C2
    add  hl, bc                                   ;; 36:6C8C $09
    ld   [hl], $00                                ;; 36:6C8D $36 $00
    ret                                           ;; 36:6C8F $C9

func_036_6C90::
    ld   a, [de]                                  ;; 36:6C90 $1A
    ld   l, a                                     ;; 36:6C91 $6F
    inc  de                                       ;; 36:6C92 $13
    ld   a, [de]                                  ;; 36:6C93 $1A
    ld   d, a                                     ;; 36:6C94 $57
    ld   e, l                                     ;; 36:6C95 $5D
    call PointHLToEntityPosX                      ;; 36:6C96 $CD $23 $6C
    ld   a, [hl]                                  ;; 36:6C99 $7E
    cp   $1C                                      ;; 36:6C9A $FE $1C
    jr   nc, .jr_6CA2                             ;; 36:6C9C $30 $04

    ld   a, $1C                                   ;; 36:6C9E $3E $1C
    jr   jr_036_6CAA                              ;; 36:6CA0 $18 $08

.jr_6CA2
    add  e                                        ;; 36:6CA2 $83
    cp   $A0                                      ;; 36:6CA3 $FE $A0
    jr   c, jr_036_6CAB                           ;; 36:6CA5 $38 $04

    ld   a, $A0                                   ;; 36:6CA7 $3E $A0
    sub  e                                        ;; 36:6CA9 $93

jr_036_6CAA:
    ld   [hl], a                                  ;; 36:6CAA $77

jr_036_6CAB:
    call PointHLToEntityPosY                      ;; 36:6CAB $CD $28 $6C
    ld   a, [hl]                                  ;; 36:6CAE $7E
    cp   $20                                      ;; 36:6CAF $FE $20
    jr   nc, .jr_6CB7                             ;; 36:6CB1 $30 $04

    ld   a, $20                                   ;; 36:6CB3 $3E $20
    jr   jr_036_6CBF                              ;; 36:6CB5 $18 $08

.jr_6CB7
    add  e                                        ;; 36:6CB7 $83
    cp   $80                                      ;; 36:6CB8 $FE $80
    jr   c, ret_036_6CC0                          ;; 36:6CBA $38 $04

    ld   a, $80                                   ;; 36:6CBC $3E $80
    sub  e                                        ;; 36:6CBE $93

jr_036_6CBF:
    ld   [hl], a                                  ;; 36:6CBF $77

ret_036_6CC0:
    ret                                           ;; 36:6CC0 $C9

; Color Dungeon dynamic palettes

ColorDungeonBGPalette1:: ; BG7
    rgb   #F8F888, #C88818, #383000, #000000

ColorDungeonBGPalette2:: ; BG7, probably
    rgb   #606060, #20B048, #204828, #000000

ColorDungeonBGPalette3:: ; BG7
    rgb   #F8F888, #3860F8, #182078, #000000

ColorDungeonBGPalette4:: ; BG7: fairy water
    rgb   #6880E8, #2850F8, #202878, #000000

ColorDungeonOBJPalette1:: ; OBJ7: rock guy miniboss
    rgb   #9878A0, #000000, #685818, #B8C028

ColorDungeonOBJPalette2:: ; OBJ7: buzzblob miniboss
    rgb   #9878A0, #000000, #0000F8, #70A8F8

ColorDungeonOBJPalette3:: ; OBJ7
    rgb   #F8F888, #9878A0, #381850, #000000

ColorDungeonOBJPalette4:: ; OBJ7
    rgb   #F8F888, #9878A0, #381850, #000000

ColorDungeonBossBasePalette:: ; OBJ6 and OBJ7: boss
    rgb   #9878A0, #000000, #A06800, #F8F8F8
    rgb   #9878A0, #000000, #2828F8, #F8F8F8

Data_036_6D11:: ; indexed by hMapRoom
    db   $00, $04, $00, $00, $00, $00, $00, $03, $00, $03, $01, $01, $00, $01, $01, $00
    db   $01, $00, $00, $02, $00, $00

Data_036_6D27::
    db   $80, $00, $07, $06, $00, $00, $07, $00, $00, $00, $00, $00, $05, $00, $00, $00
    db   $00, $07, $00, $00

Data_036_6D3B::
    dw   $0000
    dw   ColorDungeonBGPalette1
    dw   ColorDungeonBGPalette2
    dw   ColorDungeonBGPalette3
    dw   ColorDungeonBGPalette4
    dw   ColorDungeonOBJPalette1
    dw   ColorDungeonOBJPalette2
    dw   ColorDungeonOBJPalette3
    dw   ColorDungeonOBJPalette4

func_036_6D4D::
    ldh  a, [hMapId]                              ;; 36:6D4D $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 36:6D4F $FE $FF
    ret  nz                                       ;; 36:6D51 $C0

    ld   d, $00                                   ;; 36:6D52 $16 $00
    ldh  a, [hMapRoom]                            ;; 36:6D54 $F0 $F6
    ld   e, a                                     ;; 36:6D56 $5F
    ld   hl, Data_036_6D11                        ;; 36:6D57 $21 $11 $6D
    add  hl, de                                   ;; 36:6D5A $19
    ld   a, [hl]                                  ;; 36:6D5B $7E
    and  a                                        ;; 36:6D5C $A7
    jr   z, .jr_6D78                              ;; 36:6D5D $28 $19

    sla  a                                        ;; 36:6D5F $CB $27
    ld   e, a                                     ;; 36:6D61 $5F
    ld   hl, Data_036_6D3B                        ;; 36:6D62 $21 $3B $6D
    add  hl, de                                   ;; 36:6D65 $19
    ld   a, [hl+]                                 ;; 36:6D66 $2A
    ld   h, [hl]                                  ;; 36:6D67 $66
    ld   l, a                                     ;; 36:6D68 $6F
    ld   de, wBGPal8                              ;; 36:6D69 $11 $48 $DC
    ld   bc, $08                                  ;; 36:6D6C $01 $08 $00
    call CopyData                                 ;; 36:6D6F $CD $14 $29
    ld   a, $01                                   ;; 36:6D72 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 36:6D74 $EA $D1 $DD
    ret                                           ;; 36:6D77 $C9

.jr_6D78
    ld   hl, Data_036_6D27                        ;; 36:6D78 $21 $27 $6D
    add  hl, de                                   ;; 36:6D7B $19
    ld   a, [hl]                                  ;; 36:6D7C $7E
    and  a                                        ;; 36:6D7D $A7
    ret  z                                        ;; 36:6D7E $C8

    bit  7, a                                     ;; 36:6D7F $CB $7F
    jr   z, .jr_6D8E                              ;; 36:6D81 $28 $0B

    ld   hl, ColorDungeonBossBasePalette          ;; 36:6D83 $21 $01 $6D
    ld   de, wObjPal7                             ;; 36:6D86 $11 $80 $DC
    ld   bc, $10                                  ;; 36:6D89 $01 $10 $00
    jr   jr_036_6D9E                              ;; 36:6D8C $18 $10

.jr_6D8E
    sla  a                                        ;; 36:6D8E $CB $27
    ld   e, a                                     ;; 36:6D90 $5F
    ld   hl, Data_036_6D3B                        ;; 36:6D91 $21 $3B $6D
    add  hl, de                                   ;; 36:6D94 $19
    ld   a, [hl+]                                 ;; 36:6D95 $2A
    ld   h, [hl]                                  ;; 36:6D96 $66
    ld   l, a                                     ;; 36:6D97 $6F
    ld   de, wObjPal8                             ;; 36:6D98 $11 $88 $DC
    ld   bc, $08                                  ;; 36:6D9B $01 $08 $00

jr_036_6D9E:
    call CopyData                                 ;; 36:6D9E $CD $14 $29
    ld   a, $02                                   ;; 36:6DA1 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 36:6DA3 $EA $D1 $DD
    ret                                           ;; 36:6DA6 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TileGlintSpriteVariants::
.variant0
    db $FF, $00
    db $FF, $20
.variant1
    db $3A, $00
    db $3A, $20
.variant2
    db $3C, $00
    db $3C, $20
.varint3
    db $3C, $00
    db $3C, $20

; All 4 differents glint puzzles
; (indexed by hTileGlintSequence)
TileGlintSequenceTable::
    db   $58, $78, $78, $28, $28,
    db   $28, $78, $58, $28, $78,
    db   $28, $78, $28, $78, $58,
    db   $58, $28, $78, $28, $78

Data_036_6DCB::
    db   $40, $30, $50, $50, $30, $30, $50, $40, $50, $30, $50, $50, $30, $30, $40, $40
    db   $50, $30, $30, $50

Data_036_6DDF::
    db   $F2, $00, $3A, $00, $F2, $08, $3A, $20, $0E, $00, $3A, $00, $0E, $08, $3A, $20
    db   $F6, $0A, $3A, $00, $F6, $12, $3A, $20, $0A, $F6, $3A, $00, $0A, $FE, $3A, $20
    db   $00, $0E, $3A, $00, $00, $16, $3A, $20, $00, $F2, $3A, $00, $00, $FA, $3A, $20
    db   $0A, $0A, $3A, $00, $0A, $12, $3A, $20, $F6, $F6, $3A, $00, $F6, $FE, $3A, $20

TileGlintHiddenEntityHandler::
TileGlintShownEntityHandler::
    ldh  a, [hActiveEntityState]                  ;; 36:6E1F $F0 $F0
    and  a                                        ;; 36:6E21 $A7
    jr   z, jr_036_6E3F                           ;; 36:6E22 $28 $1B

    call GetEntityTransitionCountdown             ;; 36:6E24 $CD $05 $0C
    jp   z, ClearEntityStatus_36                  ;; 36:6E27 $CA $89 $6C

    rla                                           ;; 36:6E2A $17
    rla                                           ;; 36:6E2B $17
    and  $30                                      ;; 36:6E2C $E6 $30
    ld   e, a                                     ;; 36:6E2E $5F
    ld   d, b                                     ;; 36:6E2F $50
    ld   hl, Data_036_6DDF                        ;; 36:6E30 $21 $DF $6D
    add  hl, de                                   ;; 36:6E33 $19
    ld   c, $04                                   ;; 36:6E34 $0E $04

.jr_6E36
    call RenderActiveEntitySpritesRect            ;; 36:6E36 $CD $E6 $3C

.jr_6E39
    ld   a, $02                                   ;; 36:6E39 $3E $02

.jr_6E3B
    call func_015_7964_trampoline                 ;; 36:6E3B $CD $A0 $3D
    ret                                           ;; 36:6E3E $C9

jr_036_6E3F:
    call ReturnIfNonInteractive_36                ;; 36:6E3F $CD $40 $6A

    ldh  a, [hActiveEntityType]                   ;; 36:6E42 $F0 $EB
    cp   ENTITY_TILE_GLINT_SHOWN                  ;; 36:6E44 $FE $8A
    jr   nz, .tileGlintShown                      ;; 36:6E46 $20 $0F

    ; Render the glint tile without visible sparkle
    ldh  a, [hFrameCounter]                       ;; 36:6E48 $F0 $E7
    rra                                           ;; 36:6E4A $1F
    rra                                           ;; 36:6E4B $1F
    and  $03                                      ;; 36:6E4C $E6 $03
    call SetEntitySpriteVariant                   ;; 36:6E4E $CD $0C $3B
    ld   de, TileGlintSpriteVariants              ;; 36:6E51 $11 $A7 $6D
    call RenderActiveEntitySpritesPair            ;; 36:6E54 $CD $C0 $3B

.tileGlintShown
    ; Render the glint tile with the sparkle

    ; wEntitiesInertiaTable stores the current index of the puzzle sequence
    ld   hl, wEntitiesInertiaTable                ;; 36:6E57 $21 $D0 $C3
    add  hl, bc                                   ;; 36:6E5A $09

    ; Lookup where is the glinting tile (from the active puzzle sequence)
    ; a = TileGlintSequenceTable[hTileGlintSequence * 5 + sequence index]
    ldh  a, [hTileGlintSequence]                  ;; 36:6E5B $F0 $B9
    ld   e, a                                     ;; 36:6E5D $5F
    sla  a                                        ;; 36:6E5E $CB $27
    sla  a                                        ;; 36:6E60 $CB $27
    add  e                                        ;; 36:6E62 $83
    add  [hl]                                     ;; 36:6E63 $86
    ld   e, a                                     ;; 36:6E64 $5F
    ld   d, b                                     ;; 36:6E65 $50
    ld   hl, TileGlintSequenceTable               ;; 36:6E66 $21 $B7 $6D
    add  hl, de                                   ;; 36:6E69 $19
    ld   a, [hl]                                  ;; 36:6E6A $7E

    ; Position the sparkle
    ld   hl, wEntitiesPosXTable                   ;; 36:6E6B $21 $00 $C2
    add  hl, bc                                   ;; 36:6E6E $09
    ld   [hl], a                                  ;; 36:6E6F $77
    ld   hl, Data_036_6DCB                        ;; 36:6E70 $21 $CB $6D
    add  hl, de                                   ;; 36:6E73 $19
    ld   a, [hl]                                  ;; 36:6E74 $7E
    ld   hl, wEntitiesPosYTable                   ;; 36:6E75 $21 $10 $C2
    add  hl, bc                                   ;; 36:6E78 $09
    ld   [hl], a                                  ;; 36:6E79 $77
    call CopyEntityPositionToActivePosition       ;; 36:6E7A $CD $8A $3D
    ld   hl, wEntitiesPrivateState1Table          ;; 36:6E7D $21 $B0 $C2
    add  hl, bc                                   ;; 36:6E80 $09
    ldh  a, [hObjectUnderLink]                    ;; 36:6E81 $F0 $B8
    cp   [hl]                                     ;; 36:6E83 $BE
    jr   z, .done                                 ;; 36:6E84 $28 $47

    cp   $8D                                      ;; 36:6E86 $FE $8D
    jr   nz, .done                                ;; 36:6E88 $20 $43

    call CheckLinkCollisionWithEnemy_trampoline   ;; 36:6E8A $CD $5A $3B
    jr   nc, .resetPuzzle                         ;; 36:6E8D $30 $39

    ; If the puzzle sequence progression reaches the end of the sequence,
    ; mark the puzzle as resolved.
    ld   hl, wEntitiesInertiaTable                ;; 36:6E8F $21 $D0 $C3
    add  hl, bc                                   ;; 36:6E92 $09
    ld   a, [hl]                                  ;; 36:6E93 $7E
    cp   $04                                      ;; 36:6E94 $FE $04
    jr   nz, .puzzleSolvedEnd                     ;; 36:6E96 $20 $08

    call ClearEntityStatus_36                     ;; 36:6E98 $CD $89 $6C
    call MarkTriggerAsResolved                    ;; 36:6E9B $CD $60 $0C
    jr   .done                                    ;; 36:6E9E $18 $2D
.puzzleSolvedEnd

    ; Otherwise, progress in the sequence, by incrementing wEntitiesInertiaTable…
    inc  [hl]                                     ;; 36:6EA0 $34

    ; play a sound cue…
    ld   a, JINGLE_VALIDATE                       ;; 36:6EA1 $3E $13
    ldh  [hJingle], a                             ;; 36:6EA3 $E0 $F2

    ; …and spawn a new glint.
    ld   a, ENTITY_TILE_GLINT_SHOWN               ;; 36:6EA5 $3E $8A
    call SpawnNewEntity_trampoline                ;; 36:6EA7 $CD $86 $3B
    jr   c, .jr_6EC6                              ;; 36:6EAA $38 $1A

    ldh  a, [hMultiPurpose0]                      ;; 36:6EAC $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 36:6EAE $21 $00 $C2
    add  hl, de                                   ;; 36:6EB1 $19
    ld   [hl], a                                  ;; 36:6EB2 $77
    ldh  a, [hMultiPurpose1]                      ;; 36:6EB3 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 36:6EB5 $21 $10 $C2
    add  hl, de                                   ;; 36:6EB8 $19
    ld   [hl], a                                  ;; 36:6EB9 $77
    push bc                                       ;; 36:6EBA $C5
    ld   c, e                                     ;; 36:6EBB $4B
    ld   b, d                                     ;; 36:6EBC $42
    call IncrementEntityState                     ;; 36:6EBD $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 36:6EC0 $CD $05 $0C
    ld   [hl], $18                                ;; 36:6EC3 $36 $18
    pop  bc                                       ;; 36:6EC5 $C1

.jr_6EC6
    jr   .done                                    ;; 36:6EC6 $18 $05

.resetPuzzle
    ld   hl, wEntitiesInertiaTable                ;; 36:6EC8 $21 $D0 $C3
    add  hl, bc                                   ;; 36:6ECB $09
    ld   [hl], b                                  ;; 36:6ECC $70

.done
    ldh  a, [hObjectUnderLink]                    ;; 36:6ECD $F0 $B8
    ld   hl, wEntitiesPrivateState1Table          ;; 36:6ECF $21 $B0 $C2
    add  hl, bc                                   ;; 36:6ED2 $09
    ld   [hl], a                                  ;; 36:6ED3 $77
    ret                                           ;; 36:6ED4 $C9

PiranhaPlantEntityHandler::
    ld   hl, wEntitiesRecoilVelocityX             ;; 36:6ED5 $21 $F0 $C3
    add  hl, bc                                   ;; 36:6ED8 $09
    ld   [hl], b                                  ;; 36:6ED9 $70
    ld   hl, wEntitiesRecoilVelocityY             ;; 36:6EDA $21 $00 $C4
    add  hl, bc                                   ;; 36:6EDD $09
    ld   [hl], b                                  ;; 36:6EDE $70
    call func_036_7022                            ;; 36:6EDF $CD $22 $70
    ld   a, [wGameplayType]                       ;; 36:6EE2 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 36:6EE5 $FE $0B
    ret  nz                                       ;; 36:6EE7 $C0

    ld   a, [wTransitionSequenceCounter]          ;; 36:6EE8 $FA $6B $C1
    cp   $04                                      ;; 36:6EEB $FE $04
    ret  nz                                       ;; 36:6EED $C0

    call ReturnIfNonInteractive_36                ;; 36:6EEE $CD $40 $6A
    ld   hl, wEntitiesPrivateState2Table          ;; 36:6EF1 $21 $C0 $C2
    add  hl, bc                                   ;; 36:6EF4 $09
    ld   a, [hl]                                  ;; 36:6EF5 $7E
    and  a                                        ;; 36:6EF6 $A7
    jr   nz, .jr_6F01                             ;; 36:6EF7 $20 $08

    inc  [hl]                                     ;; 36:6EF9 $34
    ldh  a, [hActiveEntityPosY]                   ;; 36:6EFA $F0 $EF
    ld   hl, wEntitiesPrivateState1Table          ;; 36:6EFC $21 $B0 $C2
    add  hl, bc                                   ;; 36:6EFF $09
    ld   [hl], a                                  ;; 36:6F00 $77

.jr_6F01
    call ApplyRecoilIfNeeded_36                   ;; 36:6F01 $CD $15 $6B
    ldh  a, [hActiveEntityState]                  ;; 36:6F04 $F0 $F0
    JP_TABLE                                      ;; 36:6F06
._00 dw PiranhaPlantState0Handler
._01 dw PiranhaPlantState1Handler
._02 dw PiranhaPlantState2Handler
._03 dw PiranhaPlantState3Handler

PiranhaPlantState0Handler::
    call GetEntityTransitionCountdown             ;; 36:6F0F $CD $05 $0C
    jr   nz, ret_036_6F2D                         ;; 36:6F12 $20 $19

    ld   [hl], $40                                ;; 36:6F14 $36 $40
    ld   e, $00                                   ;; 36:6F16 $1E $00
    ldh  a, [hLinkPositionX]                      ;; 36:6F18 $F0 $98
    call PointHLToEntityPosX                      ;; 36:6F1A $CD $23 $6C
    sub  [hl]                                     ;; 36:6F1D $96
    bit  7, a                                     ;; 36:6F1E $CB $7F
    jr   z, .jr_6F23                              ;; 36:6F20 $28 $01

    inc  e                                        ;; 36:6F22 $1C

.jr_6F23
    ld   d, a                                     ;; 36:6F23 $57
    add  $10                                      ;; 36:6F24 $C6 $10
    cp   $20                                      ;; 36:6F26 $FE $20
    jr   c, ret_036_6F2D                          ;; 36:6F28 $38 $03

    call IncrementEntityState                     ;; 36:6F2A $CD $12 $3B

ret_036_6F2D:
    ret                                           ;; 36:6F2D $C9

Data_036_6F2E::
    db   $04, $04, $03, $02, $01, $00, $00, $00

Data_036_6F36::
    db   $E0, $E0, $E8, $F0, $00, $00, $00, $00

PiranhaPlantState1Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:6F3E $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 36:6F41 $CD $05 $0C
    jr   nz, .jr_6F4C                             ;; 36:6F44 $20 $06

    ld   [hl], $80                                ;; 36:6F46 $36 $80
    call IncrementEntityState                     ;; 36:6F48 $CD $12 $3B
    ret                                           ;; 36:6F4B $C9

.jr_6F4C
    rra                                           ;; 36:6F4C $1F
    rra                                           ;; 36:6F4D $1F
    rra                                           ;; 36:6F4E $1F
    and  $07                                      ;; 36:6F4F $E6 $07
    ld   e, a                                     ;; 36:6F51 $5F
    ld   d, b                                     ;; 36:6F52 $50
    ld   hl, Data_036_6F2E                        ;; 36:6F53 $21 $2E $6F
    add  hl, de                                   ;; 36:6F56 $19
    ld   a, [hl]                                  ;; 36:6F57 $7E
    call SetEntitySpriteVariant                   ;; 36:6F58 $CD $0C $3B
    ld   hl, Data_036_6F36                        ;; 36:6F5B $21 $36 $6F
    add  hl, de                                   ;; 36:6F5E $19
    ld   a, [hl]                                  ;; 36:6F5F $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 36:6F60 $21 $B0 $C2
    add  hl, bc                                   ;; 36:6F63 $09
    add  [hl]                                     ;; 36:6F64 $86
    ld   hl, wEntitiesPosYTable                   ;; 36:6F65 $21 $10 $C2
    add  hl, bc                                   ;; 36:6F68 $09
    ld   [hl], a                                  ;; 36:6F69 $77
    ret                                           ;; 36:6F6A $C9

PiranhaPlantState2Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:6F6B $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 36:6F6E $CD $05 $0C
    jr   nz, .jr_6F78                             ;; 36:6F71 $20 $05

    ld   [hl], $40                                ;; 36:6F73 $36 $40
    call IncrementEntityState                     ;; 36:6F75 $CD $12 $3B

.jr_6F78
    ld   e, $04                                   ;; 36:6F78 $1E $04
    and  $10                                      ;; 36:6F7A $E6 $10
    jr   nz, .jr_6F7F                             ;; 36:6F7C $20 $01

    inc  e                                        ;; 36:6F7E $1C

.jr_6F7F
    ld   a, e                                     ;; 36:6F7F $7B
    call SetEntitySpriteVariant                   ;; 36:6F80 $CD $0C $3B
    ret                                           ;; 36:6F83 $C9

Data_036_6F84::
    db   $00, $00, $00, $00, $01, $02, $03, $05

Data_036_6F8C::
    db   $00, $00, $00, $00, $00, $F0, $E8, $E0

PiranhaPlantState3Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 36:6F94 $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 36:6F97 $CD $05 $0C
    jr   nz, .jr_6FA3                             ;; 36:6F9A $20 $07

    ld   [hl], $40                                ;; 36:6F9C $36 $40
    call IncrementEntityState                     ;; 36:6F9E $CD $12 $3B
    ld   [hl], b                                  ;; 36:6FA1 $70
    ret                                           ;; 36:6FA2 $C9

.jr_6FA3
    rra                                           ;; 36:6FA3 $1F
    rra                                           ;; 36:6FA4 $1F
    rra                                           ;; 36:6FA5 $1F
    and  $07                                      ;; 36:6FA6 $E6 $07
    ld   e, a                                     ;; 36:6FA8 $5F
    ld   d, b                                     ;; 36:6FA9 $50
    ld   hl, Data_036_6F84                        ;; 36:6FAA $21 $84 $6F
    add  hl, de                                   ;; 36:6FAD $19
    ld   a, [hl]                                  ;; 36:6FAE $7E
    call SetEntitySpriteVariant                   ;; 36:6FAF $CD $0C $3B
    ld   hl, Data_036_6F8C                        ;; 36:6FB2 $21 $8C $6F
    add  hl, de                                   ;; 36:6FB5 $19
    ld   a, [hl]                                  ;; 36:6FB6 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 36:6FB7 $21 $B0 $C2
    add  hl, bc                                   ;; 36:6FBA $09
    add  [hl]                                     ;; 36:6FBB $86
    ld   hl, wEntitiesPosYTable                   ;; 36:6FBC $21 $10 $C2
    add  hl, bc                                   ;; 36:6FBF $09
    ld   [hl], a                                  ;; 36:6FC0 $77
    ret                                           ;; 36:6FC1 $C9

Data_036_6FC2::
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F0, $00, $74, $02, $F0, $08, $74, $22, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $70, $02, $00, $08, $70, $22, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $70, $02, $00, $08, $70, $22, $08, $00, $76, $00, $08, $08, $76, $20
    db   $00, $00, $70, $02, $00, $08, $70, $22, $10, $00, $72, $00, $10, $08, $72, $20
    db   $00, $00, $78, $02, $00, $08, $78, $22, $10, $00, $72, $00, $10, $08, $72, $20

func_036_7022::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 36:7022 $F0 $F1
    rla                                           ;; 36:7024 $17
    rla                                           ;; 36:7025 $17
    rla                                           ;; 36:7026 $17
    rla                                           ;; 36:7027 $17
    and  $F0                                      ;; 36:7028 $E6 $F0
    ld   e, a                                     ;; 36:702A $5F
    ld   d, b                                     ;; 36:702B $50
    ld   hl, Data_036_6FC2                        ;; 36:702C $21 $C2 $6F
    add  hl, de                                   ;; 36:702F $19
    ld   c, $04                                   ;; 36:7030 $0E $04
    call RenderActiveEntitySpritesRect            ;; 36:7032 $CD $E6 $3C
    ret                                           ;; 36:7035 $C9

Data_036_7036::
    db   $FF, $47, $19, $14, $0A, $10, $00, $00

func_036_703E::
    ld   hl, wObjPal8                             ;; 36:703E $21 $88 $DC
    ld   de, Data_036_7036                        ;; 36:7041 $11 $36 $70

.loop_7044
    ld   a, [de]                                  ;; 36:7044 $1A
    ld   [hl+], a                                 ;; 36:7045 $22
    inc  de                                       ;; 36:7046 $13
    ld   a, l                                     ;; 36:7047 $7D
    and  $07                                      ;; 36:7048 $E6 $07
    jr   nz, .loop_7044                           ;; 36:704A $20 $F8

    ld   a, $02                                   ;; 36:704C $3E $02
    ld   [wPaletteDataFlags], a                   ;; 36:704E $EA $D1 $DD
    ret                                           ;; 36:7051 $C9

Data_036_7052::
    db   $08, $18, $08, $18

Data_036_7056::
    db   $10, $10, $20, $20

; Spawn 4 (in a 2x2 grid) rouble entitites at hIntersectedObjectLeft, hIntersectedObjectTop.
; Called when the giant skull is destroyed after Tarin with the bees.
Spawn2x2RubbleEntities::
    push bc                                       ;; 36:705A $C5
    ld   c, $03                                   ;; 36:705B $0E $03
    ld   b, $00                                   ;; 36:705D $06 $00

jr_036_705F:
    ld   a, ENTITY_LIFTABLE_ROCK                  ;; 36:705F $3E $05
    call SpawnNewEntity_trampoline                ;; 36:7061 $CD $86 $3B
    jr   c, jr_036_708E                           ;; 36:7064 $38 $28

    ld   hl, wEntitiesPrivateCountdown1Table      ;; 36:7066 $21 $F0 $C2
    add  hl, de                                   ;; 36:7069 $19
    ld   [hl], $0F                                ;; 36:706A $36 $0F
    ldh  a, [hIntersectedObjectLeft]              ;; 36:706C $F0 $CE
    ld   hl, Data_036_7052                        ;; 36:706E $21 $52 $70

.jr_7071
    add  hl, bc                                   ;; 36:7071 $09
    add  [hl]                                     ;; 36:7072 $86
    ld   hl, wEntitiesPosXTable                   ;; 36:7073 $21 $00 $C2
    add  hl, de                                   ;; 36:7076 $19
    ld   [hl], a                                  ;; 36:7077 $77
    ldh  a, [hIntersectedObjectTop]               ;; 36:7078 $F0 $CD

.jr_707A
    ld   hl, Data_036_7056                        ;; 36:707A $21 $56 $70
    add  hl, bc                                   ;; 36:707D $09
    add  [hl]                                     ;; 36:707E $86
    ld   hl, hMultiPurpose3                       ;; 36:707F $21 $DA $FF
    sub  [hl]                                     ;; 36:7082 $96
    ld   hl, wEntitiesPosYTable                   ;; 36:7083 $21 $10 $C2
    add  hl, de                                   ;; 36:7086 $19
    ld   [hl], a                                  ;; 36:7087 $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 36:7088 $21 $40 $C3
    add  hl, de                                   ;; 36:708B $19
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 36:708C $36 $C4

jr_036_708E:
    dec  c                                        ;; 36:708E $0D
    ld   a, c                                     ;; 36:708F $79
    cp   $FF                                      ;; 36:7090 $FE $FF
    jr   nz, jr_036_705F                          ;; 36:7092 $20 $CB

    pop  bc                                       ;; 36:7094 $C1
    ret                                           ;; 36:7095 $C9

InstrumentPalette::
    rgb  #00A048, #A8E0C0
    rgb  #008870, #A8D8D0
    rgb  #0068A0, #A8C8E0
    rgb  #4040F8, #C0C0F8
    rgb  #6828F0, #C8B8F8
    rgb  #8010B8, #D0B0E8
    rgb  #900080, #D8A8D0
    rgb  #A80060, #E0A8C8
    rgb  #B80028, #E8A8B8
    rgb  #B83008, #E8B8A8
    rgb  #B84808, #E8C0A8
    rgb  #B86010, #E8C8B0
    rgb  #A87810, #E0D0B0
    rgb  #808010, #D0D0B0
    rgb  #589008, #C8D8A8
    rgb  #00A800, #A8E0A8

cycleInstrumentItemColor::
    ld   a, [wPaletteUnknownE]                    ;; 36:70D6 $FA $D5 $DD
    ld   a, [wTransitionSequenceCounter]          ;; 36:70D9 $FA $6B $C1
    cp   $04                                      ;; 36:70DC $FE $04
    ret  nz                                       ;; 36:70DE $C0

IF __PATCH_0__
    xor  a
    ld   [wObjPal1 + 1*2], a
ENDC

    ldh  a, [hIsGBC]                              ;; 36:70DF $F0 $FE
    and  a                                        ;; 36:70E1 $A7
    ret  z                                        ;; 36:70E2 $C8

    ldh  a, [hFrameCounter]                       ;; 36:70E3 $F0 $E7
    srl  a                                        ;; 36:70E5 $CB $3F
    and  $3C                                      ;; 36:70E7 $E6 $3C
    ld   e, a                                     ;; 36:70E9 $5F
    ld   d, $00                                   ;; 36:70EA $16 $00
    ld   hl, InstrumentPalette                    ;; 36:70EC $21 $96 $70
    add  hl, de                                   ;; 36:70EF $19
    ld   de, wObjPal2 + 2*2                       ;; 36:70F0 $11 $5C $DC

.loop_70F3
    ld   a, [hl+]                                 ;; 36:70F3 $2A
    ld   [de], a                                  ;; 36:70F4 $12
    inc  de                                       ;; 36:70F5 $13
    ld   a, e                                     ;; 36:70F6 $7B
    and  $03                                      ;; 36:70F7 $E6 $03
    jr   nz, .loop_70F3                           ;; 36:70F9 $20 $F8

    ld   a, $02                                   ;; 36:70FB $3E $02
    ld   [wPaletteDataFlags], a                   ;; 36:70FD $EA $D1 $DD
    ret                                           ;; 36:7100 $C9

label_036_7101:
    ld   a, [wIsMarinFollowingLink]               ;; 36:7101 $FA $73 $DB
    and  a                                        ;; 36:7104 $A7
    jp   z, IsInteractiveMotionAllowed.allow      ;; 36:7105 $CA $88 $72

    ld   a, [wPhotos1]                            ;; 36:7108 $FA $0C $DC
    and  $02                                      ;; 36:710B $E6 $02
    jp   nz, IsInteractiveMotionAllowed.allow     ;; 36:710D $C2 $88 $72

    ldh  a, [hLinkPositionX]                      ;; 36:7110 $F0 $98
    cp   $24                                      ;; 36:7112 $FE $24
    jp   c, IsInteractiveMotionAllowed.allow      ;; 36:7114 $DA $88 $72

    cp   $2C                                      ;; 36:7117 $FE $2C
    jp   nc, IsInteractiveMotionAllowed.allow     ;; 36:7119 $D2 $88 $72

    ldh  a, [hLinkPositionY]                      ;; 36:711C $F0 $99
    cp   $4E                                      ;; 36:711E $FE $4E
    jp   c, IsInteractiveMotionAllowed.allow      ;; 36:7120 $DA $88 $72

    cp   $52                                      ;; 36:7123 $FE $52
    jp   nc, IsInteractiveMotionAllowed.allow     ;; 36:7125 $D2 $88 $72

    ld   e, $10                                   ;; 36:7128 $1E $10
    jp   label_036_728B                           ;; 36:712A $C3 $8B $72

label_036_712D:
    ld   a, [wIsMarinFollowingLink]               ;; 36:712D $FA $73 $DB
    and  a                                        ;; 36:7130 $A7
    jp   z, IsInteractiveMotionAllowed.allow      ;; 36:7131 $CA $88 $72

    ld   a, [wPhotos1]                            ;; 36:7134 $FA $0C $DC
    and  $08                                      ;; 36:7137 $E6 $08
    jp   nz, IsInteractiveMotionAllowed.allow     ;; 36:7139 $C2 $88 $72

    ldh  a, [hLinkPositionX]                      ;; 36:713C $F0 $98
    cp   $50                                      ;; 36:713E $FE $50
    jp   c, IsInteractiveMotionAllowed.allow      ;; 36:7140 $DA $88 $72

    cp   $60                                      ;; 36:7143 $FE $60
    jp   nc, IsInteractiveMotionAllowed.allow     ;; 36:7145 $D2 $88 $72

    ldh  a, [hLinkPositionY]                      ;; 36:7148 $F0 $99
    cp   $58                                      ;; 36:714A $FE $58
    jp   c, IsInteractiveMotionAllowed.allow      ;; 36:714C $DA $88 $72

    cp   $68                                      ;; 36:714F $FE $68
    jp   nc, IsInteractiveMotionAllowed.allow     ;; 36:7151 $D2 $88 $72

    ld   e, $12                                   ;; 36:7154 $1E $12
    jp   label_036_728B                           ;; 36:7156 $C3 $8B $72

; Unused data
Data_036_7159::
    db   $FF, $7F, $00, $00, $71, $44, $7F, $7D

; If needed, spawn a photographer entity in the current room.
SpawnPhotographer::
    ldh  a, [hMapRoom]                            ;; 36:7161 $F0 $F6
    cp   ROOM_OW_ULRIRA_HOUSE                     ;; 36:7163 $FE $B1
    ret  nz                                       ;; 36:7165 $C0

    ld   a, [wPhotos1]                            ;; 36:7166 $FA $0C $DC
    and  $01                                      ;; 36:7169 $E6 $01
    ret  z                                        ;; 36:716B $C8

    ld   a, [wPhotos1]                            ;; 36:716C $FA $0C $DC
    and  $10                                      ;; 36:716F $E6 $10
    ret  nz                                       ;; 36:7171 $C0

    ld   a, [wIsMarinFollowingLink]               ;; 36:7172 $FA $73 $DB
    ld   hl, wIsGhostFollowingLink                ;; 36:7175 $21 $79 $DB
    or   [hl]                                     ;; 36:7178 $B6
    ld   hl, wIsRoosterFollowingLink              ;; 36:7179 $21 $7B $DB
    or   [hl]                                     ;; 36:717C $B6
    ld   hl, wIsBowWowFollowingLink               ;; 36:717D $21 $56 $DB
    or   [hl]                                     ;; 36:7180 $B6
    and  LOW(~BOW_WOW_KIDNAPPED)                  ;; 36:7181 $E6 $7F
    ret  nz                                       ;; 36:7183 $C0

    push bc                                       ;; 36:7184 $C5
    ld   a, [wCurrentBank]                        ;; 36:7185 $FA $AF $DB
    push af                                       ;; 36:7188 $F5
    ld   a, $36                                   ;; 36:7189 $3E $36
    ld   [wCurrentBank], a                        ;; 36:718B $EA $AF $DB
    ld   a, ENTITY_PHOTOGRAPHER                   ;; 36:718E $3E $FA
    call SpawnNewEntity_trampoline                ;; 36:7190 $CD $86 $3B
    pop  af                                       ;; 36:7193 $F1
    ld   [wCurrentBank], a                        ;; 36:7194 $EA $AF $DB
    ld   hl, wEntitiesPosXTable                   ;; 36:7197 $21 $00 $C2
    add  hl, de                                   ;; 36:719A $19
    ld   [hl], $20                                ;; 36:719B $36 $20
    ld   a, [wRoomTransitionState]                ;; 36:719D $FA $24 $C1
    and  a                                        ;; 36:71A0 $A7
    jr   nz, .jr_71A5                             ;; 36:71A1 $20 $02

    ld   [hl], $E0                                ;; 36:71A3 $36 $E0

.jr_71A5
    ld   hl, wEntitiesPosYTable                   ;; 36:71A5 $21 $10 $C2
    add  hl, de                                   ;; 36:71A8 $19
    ld   [hl], $6A                                ;; 36:71A9 $36 $6A
    pop  bc                                       ;; 36:71AB $C1
    ret                                           ;; 36:71AC $C9

label_036_71AD:
    ld   a, [wPhotos1]                            ;; 36:71AD $FA $0C $DC
    and  $20                                      ;; 36:71B0 $E6 $20
    jp   nz, IsInteractiveMotionAllowed.allow     ;; 36:71B2 $C2 $88 $72

    ld   hl, wInventoryItems.BButtonSlot          ;; 36:71B5 $21 $00 $DB
    ld   e, INVENTORY_SLOT_COUNT                  ;; 36:71B8 $1E $0C

.loop_71BA
    ld   a, [hl+]                                 ;; 36:71BA $2A
    cp   INVENTORY_SWORD                          ;; 36:71BB $FE $01
    jr   z, .jr_71C7                              ;; 36:71BD $28 $08

    dec  e                                        ;; 36:71BF $1D
    ld   a, e                                     ;; 36:71C0 $7B
    and  a                                        ;; 36:71C1 $A7
    jr   nz, .loop_71BA                           ;; 36:71C2 $20 $F6

    jp   IsInteractiveMotionAllowed.allow         ;; 36:71C4 $C3 $88 $72

.jr_71C7
    ld   a, [wIsBowWowFollowingLink]              ;; 36:71C7 $FA $56 $DB
    and  a                                        ;; 36:71CA $A7
    jp   nz, IsInteractiveMotionAllowed.allow     ;; 36:71CB $C2 $88 $72

    ld   a, [wIsMarinFollowingLink]               ;; 36:71CE $FA $73 $DB
    ld   hl, wIsGhostFollowingLink                ;; 36:71D1 $21 $79 $DB
    or   [hl]                                     ;; 36:71D4 $B6
    ld   hl, wIsRoosterFollowingLink              ;; 36:71D5 $21 $7B $DB
    or   [hl]                                     ;; 36:71D8 $B6
    and  a                                        ;; 36:71D9 $A7
    jp   nz, IsInteractiveMotionAllowed.allow     ;; 36:71DA $C2 $88 $72

    ldh  a, [hLinkPositionX]                      ;; 36:71DD $F0 $98
    cp   $38                                      ;; 36:71DF $FE $38
    jp   c, IsInteractiveMotionAllowed.allow      ;; 36:71E1 $DA $88 $72

    cp   $58                                      ;; 36:71E4 $FE $58
    jp   nc, IsInteractiveMotionAllowed.allow     ;; 36:71E6 $D2 $88 $72

    ldh  a, [hLinkPositionY]                      ;; 36:71E9 $F0 $99
    cp   $50                                      ;; 36:71EB $FE $50
    jp   c, IsInteractiveMotionAllowed.allow      ;; 36:71ED $DA $88 $72

    cp   $60                                      ;; 36:71F0 $FE $60
    jp   nc, IsInteractiveMotionAllowed.allow     ;; 36:71F2 $D2 $88 $72

    ld   e, $14                                   ;; 36:71F5 $1E $14
    jp   label_036_728B                           ;; 36:71F7 $C3 $8B $72

label_036_71FA:
    ld   a, [wOverworldRoomStatus + $79]          ;; 36:71FA $FA $79 $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 36:71FD $E6 $10
    jp   nz, IsInteractiveMotionAllowed.allow     ;; 36:71FF $C2 $88 $72

    ld   a, [wPhotos2]                            ;; 36:7202 $FA $0D $DC
    and  $02                                      ;; 36:7205 $E6 $02
    jr   nz, IsInteractiveMotionAllowed.allow     ;; 36:7207 $20 $7F

    ld   a, [wGoldenLeavesCount]                  ;; 36:7209 $FA $15 $DB
    cp   GOLDEN_LEAVES_5                          ;; 36:720C $FE $05
    jr   nc, IsInteractiveMotionAllowed.allow     ;; 36:720E $30 $78

    ldh  a, [hLinkPositionX]                      ;; 36:7210 $F0 $98
    cp   $50                                      ;; 36:7212 $FE $50
    jr   c, IsInteractiveMotionAllowed.allow      ;; 36:7214 $38 $72

    cp   $60                                      ;; 36:7216 $FE $60
    jr   nc, IsInteractiveMotionAllowed.allow     ;; 36:7218 $30 $6E

    ld   e, $18                                   ;; 36:721A $1E $18
    ldh  a, [hLinkPositionY]                      ;; 36:721C $F0 $99
    cp   $38                                      ;; 36:721E $FE $38
    jr   c, IsInteractiveMotionAllowed.allow      ;; 36:7220 $38 $66

    cp   $40                                      ;; 36:7222 $FE $40
    jr   c, label_036_728B                        ;; 36:7224 $38 $65

    jr   IsInteractiveMotionAllowed.allow         ;; 36:7226 $18 $60

label_036_7228:
    ld   a, [wPhotos2]                            ;; 36:7228 $FA $0D $DC
    and  $04                                      ;; 36:722B $E6 $04
    jr   nz, IsInteractiveMotionAllowed.allow     ;; 36:722D $20 $59

    ld   a, [wGoldenLeavesCount]                  ;; 36:722F $FA $15 $DB
    cp   SLIME_KEY                                ;; 36:7232 $FE $06
    jr   nz, IsInteractiveMotionAllowed.allow     ;; 36:7234 $20 $52

    ld   hl, wIndoorARoomStatus                   ;; 36:7236 $21 $00 $D9
    ld   de, $E3                                  ;; 36:7239 $11 $E3 $00
    add  hl, de                                   ;; 36:723C $19
    ld   a, [hl]                                  ;; 36:723D $7E
    and  $40                                      ;; 36:723E $E6 $40
    jr   z, IsInteractiveMotionAllowed.allow      ;; 36:7240 $28 $46

    ldh  a, [hLinkPositionX]                      ;; 36:7242 $F0 $98
    cp   $25                                      ;; 36:7244 $FE $25
    jr   c, IsInteractiveMotionAllowed.allow      ;; 36:7246 $38 $40

    cp   $30                                      ;; 36:7248 $FE $30
    jr   nc, IsInteractiveMotionAllowed.allow     ;; 36:724A $30 $3C

    ld   e, $19                                   ;; 36:724C $1E $19
    ldh  a, [hLinkPositionY]                      ;; 36:724E $F0 $99
    cp   $68                                      ;; 36:7250 $FE $68
    jr   c, IsInteractiveMotionAllowed.allow      ;; 36:7252 $38 $34

    cp   $6E                                      ;; 36:7254 $FE $6E
    jr   c, label_036_728B                        ;; 36:7256 $38 $33

    jr   IsInteractiveMotionAllowed.allow         ;; 36:7258 $18 $2E

; Is Link interactive motion allowed?
;
; Returns:
;   a    0 (denied) or 1 (allowed)
IsInteractiveMotionAllowed::
    ld   a, [wRoomTransitionState]                ;; 36:725A $FA $24 $C1
    and  a                                        ;; 36:725D $A7
    jr   nz, .allow                               ;; 36:725E $20 $28

    ld   a, [wPhotos1]                            ;; 36:7260 $FA $0C $DC
    and  $01                                      ;; 36:7263 $E6 $01
    jr   z, .allow                                ;; 36:7265 $28 $21

    ld   a, [wIsIndoor]                           ;; 36:7267 $FA $A5 $DB
    and  a                                        ;; 36:726A $A7
    jr   nz, jr_036_729E                          ;; 36:726B $20 $31
    ; Photo locations freezing Link in place
    ldh  a, [hMapRoom]                            ;; 36:726D $F0 $F6
    cp   ROOM_OW_MARIN_CLIFF_PHOTO                ;; 36:726F $FE $F0
    jp   z, label_036_7101                        ;; 36:7271 $CA $01 $71
    cp   ROOM_OW_MABE_VILLAGE_SQUARE              ;; 36:7274 $FE $92
    jp   z, label_036_712D                        ;; 36:7276 $CA $2D $71
    cp   ROOM_OW_BOWWOW                           ;; 36:7279 $FE $A1
    jp   z, label_036_71AD                        ;; 36:727B $CA $AD $71
    cp   ROOM_OW_KANALET_GATE                     ;; 36:727E $FE $79
    jp   z, label_036_71FA                        ;; 36:7280 $CA $FA $71
    cp   ROOM_OW_GHOST_GRAVE                      ;; 36:7283 $FE $64
    jp   z, label_036_7228                        ;; 36:7285 $CA $28 $72

.allow
    ld   a, TRUE                                  ;; 36:7288 $3E $01
    ret                                           ;; 36:728A $C9

label_036_728B:
    ld   a, $02                                   ;; 36:728B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 36:728D $E0 $A1
    ld   a, e                                     ;; 36:728F $7B
    ld   [wGameplayType], a                       ;; 36:7290 $EA $95 $DB
    xor  a                                        ;; 36:7293 $AF
    ld   [wTransitionSequenceCounter], a          ;; 36:7294 $EA $6B $C1
    ld   [wC16C], a                               ;; 36:7297 $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 36:729A $EA $96 $DB
    ret                                           ;; 36:729D $C9

jr_036_729E:
    ldh  a, [hMapId]                              ;; 36:729E $F0 $F7
    cp   MAP_MINIGAME                             ;; 36:72A0 $FE $0F
    jr   nz, .jr_72A9                             ;; 36:72A2 $20 $05

    ldh  a, [hIsSideScrolling]                    ;; 36:72A4 $F0 $F9
    and  a                                        ;; 36:72A6 $A7
    jr   z, IsInteractiveMotionAllowed.allow      ;; 36:72A7 $28 $DF

.jr_72A9
    jr   IsInteractiveMotionAllowed.allow         ;; 36:72A9 $18 $DD

EntityInitGenie::
    xor  a                                        ;; 36:72AB $AF
    ld   hl, wEntitiesPrivateState5Table          ;; 36:72AC $21 $90 $C3
    add  hl, bc                                   ;; 36:72AF $09
    ld   [hl], a                                  ;; 36:72B0 $77
    ld   hl, wEntitiesPosXTable                   ;; 36:72B1 $21 $00 $C2
    add  hl, bc                                   ;; 36:72B4 $09
    ld   a, [hl]                                  ;; 36:72B5 $7E
    add  $08                                      ;; 36:72B6 $C6 $08
    ld   [hl], a                                  ;; 36:72B8 $77
    ret                                           ;; 36:72B9 $C9

IF __PATCH_3__
func_036_72D5:
    ldh  a, [hActiveEntityState]
    sub  $02
    JP_TABLE
._00 dw func_036_72e4
._01 dw func_036_72e4
._02 dw func_036_72eb
._03 dw func_036_72f3
._04 dw func_036_730a

func_036_72e4:
    ld   a, [wObjPal1 + 1*2]
    inc  a
    ret  nz

    jr   jr_036_7307

func_036_72eb:
    ld   a, [wDialogState]
    and  a
    jr   z, func_036_730a

    jr   jr_036_7307

func_036_72f3:
    ld   a, [wDialogState]
    and  a
    jr   nz, func_036_730a

    ld   hl, wObjPal3 + 2*2
    ld   a, $ff
    ld   [hl+], a
    ld   a, $7f
    ld   [hl], a
    ld   a, $02
    ld   [wPaletteDataFlags], a

jr_036_7307:
    call IncrementEntityState

func_036_730a:
    ld   a, $04
    ld   [wInvincibilityCounter], a
    ret
ENDC

; On Overworld, copy some palette data to OAM buffer
func_036_72BA::
    ld   a, [wPaletteDataFlags]                   ;; 36:72BA $FA $D1 $DD
    and  a                                        ;; 36:72BD $A7
    ret  nz                                       ;; 36:72BE $C0

    ldh  a, [hIsGBC]                              ;; 36:72BF $F0 $FE
    and  a                                        ;; 36:72C1 $A7
    ret  z                                        ;; 36:72C2 $C8

    ld   a, [wDE00]                               ;; 36:72C3 $FA $00 $DE
    and  a                                        ;; 36:72C6 $A7
    ret  z                                        ;; 36:72C7 $C8

    ld   a, [wGameplayType]                       ;; 36:72C8 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 36:72CB $FE $0B
    ret  nz                                       ;; 36:72CD $C0

    ld   a, [wGameplaySubtype]                    ;; 36:72CE $FA $96 $DB
    cp   GAMEPLAY_WORLD_INTERACTIVE               ;; 36:72D1 $FE $07
    ret  nz                                       ;; 36:72D3 $C0

    xor  a                                        ;; 36:72D4 $AF
    ld   [wDE00], a                               ;; 36:72D5 $EA $00 $DE

    ld   hl, wOAMBuffer                           ;; 36:72D8 $21 $00 $C0
    ld   de, wDynamicOAMBuffer+$6C                ;; 36:72DB $11 $9C $C0
    ld   b, $14                                   ;; 36:72DE $06 $14

    ; Swap the content of HL and DE for $14 * 4 bytes
    ; (the loop is partially unrolled)
.loop
    ld   c, [hl]                                  ;; 36:72E0 $4E
    ld   a, [de]                                  ;; 36:72E1 $1A
    ld   [hl+], a                                 ;; 36:72E2 $22
    ld   a, c                                     ;; 36:72E3 $79
    ld   [de], a                                  ;; 36:72E4 $12
    inc  de                                       ;; 36:72E5 $13

    ld   c, [hl]                                  ;; 36:72E6 $4E
    ld   a, [de]                                  ;; 36:72E7 $1A
    ld   [hl+], a                                 ;; 36:72E8 $22
    ld   a, c                                     ;; 36:72E9 $79
    ld   [de], a                                  ;; 36:72EA $12
    inc  de                                       ;; 36:72EB $13

    ld   c, [hl]                                  ;; 36:72EC $4E
    ld   a, [de]                                  ;; 36:72ED $1A
    ld   [hl+], a                                 ;; 36:72EE $22
    ld   a, c                                     ;; 36:72EF $79
    ld   [de], a                                  ;; 36:72F0 $12
    inc  de                                       ;; 36:72F1 $13

    ld   c, [hl]                                  ;; 36:72F2 $4E
    ld   a, [de]                                  ;; 36:72F3 $1A
    ld   [hl+], a                                 ;; 36:72F4 $22
    ld   a, c                                     ;; 36:72F5 $79
    ld   [de], a                                  ;; 36:72F6 $12

    ld   c, $07                                   ;; 36:72F7 $0E $07
    ld   a, e                                     ;; 36:72F9 $7B
    sub  c                                        ;; 36:72FA $91
    ld   e, a                                     ;; 36:72FB $5F

    dec  b                                        ;; 36:72FC $05
    jr   nz, .loop                                ;; 36:72FD $20 $E1

    ret                                           ;; 36:72FF $C9
