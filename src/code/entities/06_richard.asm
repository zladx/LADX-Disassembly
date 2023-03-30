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
    ld   a, $21                                   ; $4020: $3E $21
    ldh  [hActiveEntityVisualPosY], a             ; $4022: $E0 $EC
    ld   de, RichardSpriteVariants                ; $4024: $11 $00 $40
    call RenderActiveEntitySpritesPair            ; $4027: $CD $C0 $3B
    call ReturnIfNonInteractive_06                ; $402A: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $402D: $F0 $E7
    and  $1F                                      ; $402F: $E6 $1F
    jr   nz, .jr_403B                             ; $4031: $20 $08

    call func_006_65B4                            ; $4033: $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ; $4036: $21 $80 $C3
    add  hl, bc                                   ; $4039: $09
    ld   [hl], e                                  ; $403A: $73

.jr_403B
    call SetEntitySpriteVariantForDirection       ; $403B: $CD $41 $64
    ld   hl, wEntitiesPrivateState1Table          ; $403E: $21 $B0 $C2
    add  hl, bc                                   ; $4041: $09
    ld   a, [hl]                                  ; $4042: $7E
    and  a                                        ; $4043: $A7
    jr   nz, .jr_4049                             ; $4044: $20 $03

    call PushLinkOutOfEntity_06                   ; $4046: $CD $1A $64

.jr_4049
    ldh  a, [hActiveEntityState]                  ; $4049: $F0 $F0
    JP_TABLE                                      ; $404B
._00 dw RichardState0Handler
._01 dw RichardState1Handler
._02 dw RichardState2Handler
._03 dw RichardState3Handler
._04 dw RichardState4Handler

RichardState0Handler::
    call IncrementEntityState                     ; $4056: $CD $12 $3B
    ld   a, [wGoldenLeavesCount]                  ; $4059: $FA $15 $DB
    cp   SLIME_KEY                                ; $405C: $FE $06
    ret  c                                        ; $405E: $D8

    ld   [hl], $04                                ; $405F: $36 $04
    ld   hl, wEntitiesPosXTable                   ; $4061: $21 $00 $C2
    add  hl, bc                                   ; $4064: $09
    ld   [hl], $58                                ; $4065: $36 $58
    ret                                           ; $4067: $C9

RichardState1Handler::
    call CheckLinkInteractionWithEntity_06        ; $4068: $CD $5D $64
    ret  nc                                       ; $406B: $D0

    ld   a, [wIsBowWowFollowingLink]              ; $406C: $FA $56 $DB
    and  a                                        ; $406F: $A7
    jr   z, .jr_4077                              ; $4070: $28 $05

    ld_dialog_low e, Dialog12D ; "Do not bring that beast here" ; $4072: $1E $2D
    jp   label_006_40C1                           ; $4074: $C3 $C1 $40

.jr_4077
    ldh  a, [hRoomStatus]                         ; $4077: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $4079: $E6 $10
    jr   z, .jr_4083                              ; $407B: $28 $06

    ld   a, [wGoldenLeavesCount]                  ; $407D: $FA $15 $DB
    and  a                                        ; $4080: $A7
    jr   nz, jr_006_40A0                          ; $4081: $20 $1D

.jr_4083
    ldh  a, [hRoomStatus]                         ; $4083: $F0 $F8
    or   $10                                      ; $4085: $F6 $10
    ldh  [hRoomStatus], a                         ; $4087: $E0 $F8
    ld   [wIndoorBRoomStatus + $C7], a            ; $4089: $EA $C7 $DA
    call_open_dialog Dialog13A                    ; $408C
    ld   a, [wRichardSpokenFlag]                  ; $4091: $FA $55 $DB
    cp   $02                                      ; $4094: $FE $02
    jr   nc, .jr_409D                             ; $4096: $30 $05

    ld   a, $02                                   ; $4098: $3E $02
    ld   [wRichardSpokenFlag], a                  ; $409A: $EA $55 $DB

.jr_409D
    jp   IncrementEntityState                     ; $409D: $C3 $12 $3B

jr_006_40A0:
    ld_dialog_low e, Dialog13F ; "You must find all the leaves" ; $40A0: $1E $3F
    cp   $05                                      ; $40A2: $FE $05
    jr   c, label_006_40C1                        ; $40A4: $38 $1B

    call IncrementEntityState                     ; $40A6: $CD $12 $3B
    ld   [hl], $03                                ; $40A9: $36 $03
    call GetEntityTransitionCountdown             ; $40AB: $CD $05 $0C
    ld   [hl], $20                                ; $40AE: $36 $20
    ld   hl, wEntitiesPrivateState1Table          ; $40B0: $21 $B0 $C2
    add  hl, bc                                   ; $40B3: $09
    ld   [hl], $01                                ; $40B4: $36 $01
    ; reset wGoldenLeavesCount ???
    ld   a, $FF                                   ; $40B6: $3E $FF
    ld   [wGoldenLeavesCount], a                  ; $40B8: $EA $15 $DB
    ld   a, REPLACE_TILES_GOLDEN_LEAF             ; $40BB: $3E $09
    ldh  [hReplaceTiles], a                       ; $40BD: $E0 $A5
    ld_dialog_low e, Dialog13D ; "You have recovered all of the leaves!" ; $40BF: $1E $3D

label_006_40C1:
    ld   a, e                                     ; $40C1: $7B
    jp   OpenDialogInTable1                       ; $40C2: $C3 $73 $23

RichardState2Handler::
    ld   a, [wDialogAskSelectionIndex]            ; $40C5: $FA $77 $C1
    and  a                                        ; $40C8: $A7
    ld_dialog_low a, Dialog13B ; "I am impressed" ; $40C9: $3E $3B
    jr   z, .jr_40CF                              ; $40CB: $28 $02

    ld_dialog_low a, Dialog13C ; "Just get out of there!" ; $40CD: $3E $3C

.jr_40CF
    call OpenDialogInTable1                       ; $40CF: $CD $73 $23
    call IncrementEntityState                     ; $40D2: $CD $12 $3B
    ld   [hl], $01                                ; $40D5: $36 $01
    ret                                           ; $40D7: $C9

RichardState3Handler::
    call GetEntityTransitionCountdown             ; $40D8: $CD $05 $0C
    jr   nz, .jr_40E0                             ; $40DB: $20 $03

    call IncrementEntityState                     ; $40DD: $CD $12 $3B

.jr_40E0
    ld   hl, wEntitiesSpeedXTable                 ; $40E0: $21 $40 $C2
    add  hl, bc                                   ; $40E3: $09
    ld   [hl], $F8                                ; $40E4: $36 $F8
    jp   AddEntitySpeedToPos_06                   ; $40E6: $C3 $4E $65

RichardState4Handler::
    call CheckLinkInteractionWithEntity_06        ; $40E9: $CD $5D $64
    jr   nc, jr_006_40FC                          ; $40EC: $30 $0E

    ld   a, [wGoldenLeavesCount]                  ; $40EE: $FA $15 $DB
    cp   SLIME_KEY                                ; $40F1: $FE $06
    ld_dialog_low a, Dialog13E ; "I am forever in your debt" ; $40F3: $3E $3E
    jr   z, .jr_40F9                              ; $40F5: $28 $02

    ld_dialog_low a, Dialog13D ; "You have recovered all of the leaves!" ; $40F7: $3E $3D

.jr_40F9
    call OpenDialogInTable1                       ; $40F9: $CD $73 $23

jr_006_40FC:
    ldh  a, [hLinkPositionX]                      ; $40FC: $F0 $98
    sub  $78                                      ; $40FE: $D6 $78
    add  $02                                      ; $4100: $C6 $02
    cp   $04                                      ; $4102: $FE $04
    ret  nc                                       ; $4104: $D0

    ldh  a, [hLinkPositionY]                      ; $4105: $F0 $99
    sub  $20                                      ; $4107: $D6 $20
    add  $05                                      ; $4109: $C6 $05
    cp   $0A                                      ; $410B: $FE $0A
    ret  nc                                       ; $410D: $D0

    ld   hl, wWarpStructs                         ; $410E: $21 $01 $D4
    ld   a, $01                                   ; $4111: $3E $01
    ld   [hl+], a                                 ; $4113: $22
    ld   a, $11                                   ; $4114: $3E $11
    ld   [hl+], a                                 ; $4116: $22
    ld   a, $D8                                   ; $4117: $3E $D8
    ld   [hl+], a                                 ; $4119: $22
    ld   a, $88                                   ; $411A: $3E $88
    ld   [hl+], a                                 ; $411C: $22
    ld   a, $70                                   ; $411D: $3E $70
    ld   [hl+], a                                 ; $411F: $22
    call ClearEntityStatus_06                     ; $4120: $CD $DB $65
    jp   ApplyMapFadeOutTransitionWithNoise       ; $4123: $C3 $7D $0C
