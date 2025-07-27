; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RichardSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_3 | OAMF_PAL0
    db $52, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $54, OAM_GBC_PAL_3 | OAMF_PAL0
    db $56, OAM_GBC_PAL_3 | OAMF_PAL0
.variant2
    db $50, OAM_GBC_PAL_3 | OAMF_PAL0
    db $52, OAM_GBC_PAL_3 | OAMF_PAL0
.variant3
    db $54, OAM_GBC_PAL_3 | OAMF_PAL0
    db $56, OAM_GBC_PAL_3 | OAMF_PAL0
.variant4
    db $58, OAM_GBC_PAL_3 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_3 | OAMF_PAL0
.variant5
    db $5C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_3 | OAMF_PAL0
.variant6
    db $5A, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $5E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $5C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

RichardEntityHandler::
    ld   a, $21                                   ;; 06:4020 $3E $21
    ldh  [hActiveEntityVisualPosY], a             ;; 06:4022 $E0 $EC
    ld   de, RichardSpriteVariants                ;; 06:4024 $11 $00 $40
    call RenderActiveEntitySpritesPair            ;; 06:4027 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:402A $CD $C6 $64
    ldh  a, [hFrameCounter]                       ;; 06:402D $F0 $E7
    and  $1F                                      ;; 06:402F $E6 $1F
    jr   nz, .jr_403B                             ;; 06:4031 $20 $08

    call GetEntityDirectionToLink_06              ;; 06:4033 $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:4036 $21 $80 $C3
    add  hl, bc                                   ;; 06:4039 $09
    ld   [hl], e                                  ;; 06:403A $73

.jr_403B
    call SetEntityVariantForDirection_06          ;; 06:403B $CD $41 $64
    ld   hl, wEntitiesPrivateState1Table          ;; 06:403E $21 $B0 $C2
    add  hl, bc                                   ;; 06:4041 $09
    ld   a, [hl]                                  ;; 06:4042 $7E
    and  a                                        ;; 06:4043 $A7
    jr   nz, .jr_4049                             ;; 06:4044 $20 $03

    call PushLinkOutOfEntity_06                   ;; 06:4046 $CD $1A $64

.jr_4049
    ldh  a, [hActiveEntityState]                  ;; 06:4049 $F0 $F0
    JP_TABLE                                      ;; 06:404B
._00 dw RichardState0Handler
._01 dw RichardState1Handler
._02 dw RichardState2Handler
._03 dw RichardState3Handler
._04 dw RichardState4Handler

RichardState0Handler::
    call IncrementEntityState                     ;; 06:4056 $CD $12 $3B
    ld   a, [wGoldenLeavesCount]                  ;; 06:4059 $FA $15 $DB
    cp   SLIME_KEY                                ;; 06:405C $FE $06
    ret  c                                        ;; 06:405E $D8

    ld   [hl], $04                                ;; 06:405F $36 $04
    ld   hl, wEntitiesPosXTable                   ;; 06:4061 $21 $00 $C2
    add  hl, bc                                   ;; 06:4064 $09
    ld   [hl], $58                                ;; 06:4065 $36 $58
    ret                                           ;; 06:4067 $C9

RichardState1Handler::
    call CheckLinkInteractionWithEntity_06        ;; 06:4068 $CD $5D $64
    ret  nc                                       ;; 06:406B $D0

    ld   a, [wIsBowWowFollowingLink]              ;; 06:406C $FA $56 $DB
    and  a                                        ;; 06:406F $A7
    jr   z, .jr_4077                              ;; 06:4070 $28 $05

    ld_dialog_low e, Dialog12D ; "Do not bring that beast here" ;; 06:4072 $1E $2D
    jp   label_006_40C1                           ;; 06:4074 $C3 $C1 $40

.jr_4077
    ldh  a, [hRoomStatus]                         ;; 06:4077 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 06:4079 $E6 $10
    jr   z, .jr_4083                              ;; 06:407B $28 $06

    ld   a, [wGoldenLeavesCount]                  ;; 06:407D $FA $15 $DB
    and  a                                        ;; 06:4080 $A7
    jr   nz, jr_006_40A0                          ;; 06:4081 $20 $1D

.jr_4083
    ldh  a, [hRoomStatus]                         ;; 06:4083 $F0 $F8
    or   $10                                      ;; 06:4085 $F6 $10
    ldh  [hRoomStatus], a                         ;; 06:4087 $E0 $F8
    ld   [wIndoorBRoomStatus + $C7], a            ;; 06:4089 $EA $C7 $DA
    call_open_dialog Dialog13A                    ;; 06:408C
    ld   a, [wRichardSpokenFlag]                  ;; 06:4091 $FA $55 $DB
    cp   $02                                      ;; 06:4094 $FE $02
    jr   nc, .jr_409D                             ;; 06:4096 $30 $05

    ld   a, $02                                   ;; 06:4098 $3E $02
    ld   [wRichardSpokenFlag], a                  ;; 06:409A $EA $55 $DB

.jr_409D
    jp   IncrementEntityState                     ;; 06:409D $C3 $12 $3B

jr_006_40A0:
    ld_dialog_low e, Dialog13F ; "You must find all the leaves" ;; 06:40A0 $1E $3F
    cp   $05                                      ;; 06:40A2 $FE $05
    jr   c, label_006_40C1                        ;; 06:40A4 $38 $1B

    call IncrementEntityState                     ;; 06:40A6 $CD $12 $3B
    ld   [hl], $03                                ;; 06:40A9 $36 $03
    call GetEntityTransitionCountdown             ;; 06:40AB $CD $05 $0C
    ld   [hl], $20                                ;; 06:40AE $36 $20
    ld   hl, wEntitiesPrivateState1Table          ;; 06:40B0 $21 $B0 $C2
    add  hl, bc                                   ;; 06:40B3 $09
    ld   [hl], $01                                ;; 06:40B4 $36 $01
    ; reset wGoldenLeavesCount ???
    ld   a, $FF                                   ;; 06:40B6 $3E $FF
    ld   [wGoldenLeavesCount], a                  ;; 06:40B8 $EA $15 $DB
    ld   a, REPLACE_TILES_GOLDEN_LEAF             ;; 06:40BB $3E $09
    ldh  [hReplaceTiles], a                       ;; 06:40BD $E0 $A5
    ld_dialog_low e, Dialog13D ; "You have recovered all of the leaves!" ;; 06:40BF $1E $3D

label_006_40C1:
    ld   a, e                                     ;; 06:40C1 $7B
    jp   OpenDialogInTable1                       ;; 06:40C2 $C3 $73 $23

RichardState2Handler::
    ld   a, [wDialogAskSelectionIndex]            ;; 06:40C5 $FA $77 $C1
    and  a                                        ;; 06:40C8 $A7
    ld_dialog_low a, Dialog13B ; "I am impressed" ;; 06:40C9 $3E $3B
    jr   z, .jr_40CF                              ;; 06:40CB $28 $02

    ld_dialog_low a, Dialog13C ; "Just get out of there!" ;; 06:40CD $3E $3C

.jr_40CF
    call OpenDialogInTable1                       ;; 06:40CF $CD $73 $23
    call IncrementEntityState                     ;; 06:40D2 $CD $12 $3B
    ld   [hl], $01                                ;; 06:40D5 $36 $01
    ret                                           ;; 06:40D7 $C9

RichardState3Handler::
    call GetEntityTransitionCountdown             ;; 06:40D8 $CD $05 $0C
    jr   nz, .jr_40E0                             ;; 06:40DB $20 $03

    call IncrementEntityState                     ;; 06:40DD $CD $12 $3B

.jr_40E0
    ld   hl, wEntitiesSpeedXTable                 ;; 06:40E0 $21 $40 $C2
    add  hl, bc                                   ;; 06:40E3 $09
    ld   [hl], $F8                                ;; 06:40E4 $36 $F8
    jp   AddEntitySpeedToPos_06                   ;; 06:40E6 $C3 $4E $65

RichardState4Handler::
    call CheckLinkInteractionWithEntity_06        ;; 06:40E9 $CD $5D $64
    jr   nc, jr_006_40FC                          ;; 06:40EC $30 $0E

    ld   a, [wGoldenLeavesCount]                  ;; 06:40EE $FA $15 $DB
    cp   SLIME_KEY                                ;; 06:40F1 $FE $06
    ld_dialog_low a, Dialog13E ; "I am forever in your debt" ;; 06:40F3 $3E $3E
    jr   z, .jr_40F9                              ;; 06:40F5 $28 $02

    ld_dialog_low a, Dialog13D ; "You have recovered all of the leaves!" ;; 06:40F7 $3E $3D

.jr_40F9
    call OpenDialogInTable1                       ;; 06:40F9 $CD $73 $23

jr_006_40FC:
    ldh  a, [hLinkPositionX]                      ;; 06:40FC $F0 $98
    sub  $78                                      ;; 06:40FE $D6 $78
    add  $02                                      ;; 06:4100 $C6 $02
    cp   $04                                      ;; 06:4102 $FE $04
    ret  nc                                       ;; 06:4104 $D0

    ldh  a, [hLinkPositionY]                      ;; 06:4105 $F0 $99
    sub  $20                                      ;; 06:4107 $D6 $20
    add  $05                                      ;; 06:4109 $C6 $05
    cp   $0A                                      ;; 06:410B $FE $0A
    ret  nc                                       ;; 06:410D $D0

    ld   hl, wWarpStructs                         ;; 06:410E $21 $01 $D4
    ld   a, $01                                   ;; 06:4111 $3E $01
    ld   [hl+], a                                 ;; 06:4113 $22
    ld   a, $11                                   ;; 06:4114 $3E $11
    ld   [hl+], a                                 ;; 06:4116 $22
    ld   a, $D8                                   ;; 06:4117 $3E $D8
    ld   [hl+], a                                 ;; 06:4119 $22
    ld   a, $88                                   ;; 06:411A $3E $88
    ld   [hl+], a                                 ;; 06:411C $22
    ld   a, $70                                   ;; 06:411D $3E $70
    ld   [hl+], a                                 ;; 06:411F $22
    call ClearEntityStatus_06                     ;; 06:4120 $CD $DB $65
    jp   ApplyMapFadeOutTransitionWithNoise       ;; 06:4123 $C3 $7D $0C
