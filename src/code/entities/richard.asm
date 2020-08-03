Data_006_4000::
    db   $50, $03, $52, $03, $54, $03, $56, $03, $50, $03, $52, $03, $54, $03, $56, $03
    db   $58, $03, $5A, $03, $5C, $03, $5E, $03, $5A, $23, $58, $23, $5E, $23, $5C, $23

RichardEntityHandler::
    ld   a, $21                                   ; $4020: $3E $21
    ldh  [hActiveEntityVisualPosY], a             ; $4022: $E0 $EC
    ld   de, Data_006_4000                        ; $4024: $11 $00 $40
    call RenderActiveEntitySpritesPair            ; $4027: $CD $C0 $3B
    call func_006_64C6                            ; $402A: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $402D: $F0 $E7
    and  $1F                                      ; $402F: $E6 $1F
    jr   nz, jr_006_403B                          ; $4031: $20 $08

    call func_006_65B4                            ; $4033: $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ; $4036: $21 $80 $C3
    add  hl, bc                                   ; $4039: $09
    ld   [hl], e                                  ; $403A: $73

jr_006_403B:
    call SetEntitySpriteVariantForDirection                            ; $403B: $CD $41 $64
    ld   hl, wEntitiesPrivateState1Table          ; $403E: $21 $B0 $C2
    add  hl, bc                                   ; $4041: $09
    ld   a, [hl]                                  ; $4042: $7E
    and  a                                        ; $4043: $A7
    jr   nz, jr_006_4049                          ; $4044: $20 $03

    call func_006_641A                            ; $4046: $CD $1A $64

jr_006_4049:
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
    cp   $06                                      ; $405C: $FE $06
    ret  c                                        ; $405E: $D8

    ld   [hl], $04                                ; $405F: $36 $04
    ld   hl, wEntitiesPosXTable                   ; $4061: $21 $00 $C2
    add  hl, bc                                   ; $4064: $09
    ld   [hl], $58                                ; $4065: $36 $58
    ret                                           ; $4067: $C9

RichardState1Handler::
    call func_006_645D                            ; $4068: $CD $5D $64
    ret  nc                                       ; $406B: $D0

    ld   a, [wIsBowWowFollowingLink]              ; $406C: $FA $56 $DB
    and  a                                        ; $406F: $A7
    jr   z, jr_006_4077                           ; $4070: $28 $05

    ld   e, $2D                                   ; $4072: $1E $2D
    jp   label_006_40C1                           ; $4074: $C3 $C1 $40

jr_006_4077:
    ldh  a, [hRoomStatus]                         ; $4077: $F0 $F8
    and  $10                                      ; $4079: $E6 $10
    jr   z, jr_006_4083                           ; $407B: $28 $06

    ld   a, [wGoldenLeavesCount]                  ; $407D: $FA $15 $DB
    and  a                                        ; $4080: $A7
    jr   nz, jr_006_40A0                          ; $4081: $20 $1D

jr_006_4083:
    ldh  a, [hRoomStatus]                         ; $4083: $F0 $F8
    or   $10                                      ; $4085: $F6 $10
    ldh  [hRoomStatus], a                         ; $4087: $E0 $F8
    ld   [wIndoorBRoomStatus + $C7], a                               ; $4089: $EA $C7 $DA
    call_open_dialog $13A                         ; $408C
    ld   a, [wRichardSpokenFlag]                  ; $4091: $FA $55 $DB
    cp   $02                                      ; $4094: $FE $02
    jr   nc, jr_006_409D                          ; $4096: $30 $05

    ld   a, $02                                   ; $4098: $3E $02
    ld   [wRichardSpokenFlag], a                  ; $409A: $EA $55 $DB

jr_006_409D:
    jp   IncrementEntityState                     ; $409D: $C3 $12 $3B

jr_006_40A0:
    ld   e, $3F                                   ; $40A0: $1E $3F
    cp   $05                                      ; $40A2: $FE $05
    jr   c, label_006_40C1                        ; $40A4: $38 $1B

    call IncrementEntityState                     ; $40A6: $CD $12 $3B
    ld   [hl], $03                                ; $40A9: $36 $03
    call GetEntityTransitionCountdown             ; $40AB: $CD $05 $0C
    ld   [hl], $20                                ; $40AE: $36 $20
    ld   hl, wEntitiesPrivateState1Table          ; $40B0: $21 $B0 $C2
    add  hl, bc                                   ; $40B3: $09
    ld   [hl], $01                                ; $40B4: $36 $01
    ld   a, $FF                                   ; $40B6: $3E $FF
    ld   [wGoldenLeavesCount], a                  ; $40B8: $EA $15 $DB
    ld   a, $09                                   ; $40BB: $3E $09
    ldh  [hFFA5], a                               ; $40BD: $E0 $A5
    ld   e, $3D                                   ; $40BF: $1E $3D

label_006_40C1:
    ld   a, e                                     ; $40C1: $7B
    jp   OpenDialogInTable1                       ; $40C2: $C3 $73 $23

RichardState2Handler::
    ld   a, [wDialogAskSelectionIndex]                               ; $40C5: $FA $77 $C1
    and  a                                        ; $40C8: $A7
    ld   a, $3B                                   ; $40C9: $3E $3B
    jr   z, jr_006_40CF                           ; $40CB: $28 $02

    ld   a, $3C                                   ; $40CD: $3E $3C

jr_006_40CF:
    call OpenDialogInTable1                       ; $40CF: $CD $73 $23
    call IncrementEntityState                     ; $40D2: $CD $12 $3B
    ld   [hl], $01                                ; $40D5: $36 $01
    ret                                           ; $40D7: $C9

RichardState3Handler::
    call GetEntityTransitionCountdown             ; $40D8: $CD $05 $0C
    jr   nz, jr_006_40E0                          ; $40DB: $20 $03

    call IncrementEntityState                     ; $40DD: $CD $12 $3B

jr_006_40E0:
    ld   hl, wEntitiesSpeedXTable                 ; $40E0: $21 $40 $C2
    add  hl, bc                                   ; $40E3: $09
    ld   [hl], $F8                                ; $40E4: $36 $F8
    jp   AddEntitySpeedToPos_06                   ; $40E6: $C3 $4E $65

RichardState4Handler::
    call func_006_645D                            ; $40E9: $CD $5D $64
    jr   nc, jr_006_40FC                          ; $40EC: $30 $0E

    ld   a, [wGoldenLeavesCount]                  ; $40EE: $FA $15 $DB
    cp   $06                                      ; $40F1: $FE $06
    ld   a, $3E                                   ; $40F3: $3E $3E
    jr   z, jr_006_40F9                           ; $40F5: $28 $02

    ld   a, $3D                                   ; $40F7: $3E $3D

jr_006_40F9:
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
