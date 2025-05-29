; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ThreeOfAKindSpriteVariants::
.variant0
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant5
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0
.variant7
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

ThreeOfAKindEntityHandler::
    ld   hl, wEntitiesHealthTable                 ;; 06:4931 $21 $60 $C3
    add  hl, bc                                   ;; 06:4934 $09
    ld   [hl], $20                                ;; 06:4935 $36 $20
    ld   de, ThreeOfAKindSpriteVariants           ;; 06:4937 $11 $11 $49
    call RenderActiveEntitySpritesPair            ;; 06:493A $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:493D $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ;; 06:4940 $CD $56 $0C
    call UpdateEntityPosWithSpeed_06              ;; 06:4943 $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:4946 $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ;; 06:4949 $F0 $F0
    JP_TABLE                                      ;; 06:494B
._00 dw ThreeOfAKindState0Handler
._01 dw ThreeOfAKindState1Handler
._02 dw ThreeOfAKindState2Handler

ThreeOfAKindState0Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline
    call GetEntityTransitionCountdown             ;; 06:4955 $CD $05 $0C
    jr   nz, .jr_4962                             ;; 06:4958 $20 $08

    ld   [hl], $20                                ;; 06:495A $36 $20
    call ClearEntitySpeed                         ;; 06:495C $CD $7F $3D
    call IncrementEntityState                     ;; 06:495F $CD $12 $3B

.jr_4962
    ld   hl, wEntitiesInertiaTable                ;; 06:4962 $21 $D0 $C3
    add  hl, bc                                   ;; 06:4965 $09
    inc  [hl]                                     ;; 06:4966 $34

jr_006_4967:
    ld   hl, wEntitiesDirectionTable              ;; 06:4967 $21 $80 $C3
    add  hl, bc                                   ;; 06:496A $09
    ldh  a, [hFrameCounter]                       ;; 06:496B $F0 $E7
    and  $0F                                      ;; 06:496D $E6 $0F
    jr   nz, .jr_4976                             ;; 06:496F $20 $05

    ld   a, [hl]                                  ;; 06:4971 $7E
    inc  a                                        ;; 06:4972 $3C
    and  $03                                      ;; 06:4973 $E6 $03
    ld   [hl], a                                  ;; 06:4975 $77

.jr_4976
    ld   e, [hl]                                  ;; 06:4976 $5E
    sla  e                                        ;; 06:4977 $CB $23
    ld   hl, wEntitiesInertiaTable                ;; 06:4979 $21 $D0 $C3
    add  hl, bc                                   ;; 06:497C $09
    ld   a, [hl]                                  ;; 06:497D $7E
    rra                                           ;; 06:497E $1F
    rra                                           ;; 06:497F $1F
    rra                                           ;; 06:4980 $1F
    and  $01                                      ;; 06:4981 $E6 $01
    or   e                                        ;; 06:4983 $B3
    call SetEntitySpriteVariant                   ;; 06:4984 $CD $0C $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 06:4987 $21 $10 $C4
    add  hl, bc                                   ;; 06:498A $09
    ld   a, [hl]                                  ;; 06:498B $7E
    and  a                                        ;; 06:498C $A7
    ret  z                                        ;; 06:498D $C8

    call IncrementEntityState                     ;; 06:498E $CD $12 $3B
    ld   [hl], $02                                ;; 06:4991 $36 $02
    call GetEntityTransitionCountdown             ;; 06:4993 $CD $05 $0C
    ld   [hl], $40                                ;; 06:4996 $36 $40
    jp   ClearEntitySpeed                         ;; 06:4998 $C3 $7F $3D

Data_006_499B::
    db   $0C, $F4, $00, $00

Data_006_499F::
    db   $00, $00, $F4, $0C

ThreeOfAKindState1Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:49A3 $CD $39 $3B

.jr_49A6
    call GetEntityTransitionCountdown             ;; 06:49A6 $CD $05 $0C
    jr   nz, .jr_49D2                             ;; 06:49A9 $20 $27

    call GetRandomByte                            ;; 06:49AB $CD $0D $28
    and  $1F                                      ;; 06:49AE $E6 $1F
    add  $20                                      ;; 06:49B0 $C6 $20
    ld   [hl], a                                  ;; 06:49B2 $77
    call IncrementEntityState                     ;; 06:49B3 $CD $12 $3B
    ld   [hl], b                                  ;; 06:49B6 $70
    call GetRandomByte                            ;; 06:49B7 $CD $0D $28
    and  $03                                      ;; 06:49BA $E6 $03
    ld   e, a                                     ;; 06:49BC $5F
    ld   d, b                                     ;; 06:49BD $50
    ld   hl, Data_006_499B                        ;; 06:49BE $21 $9B $49
    add  hl, de                                   ;; 06:49C1 $19
    ld   a, [hl]                                  ;; 06:49C2 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:49C3 $21 $40 $C2
    add  hl, bc                                   ;; 06:49C6 $09
    ld   [hl], a                                  ;; 06:49C7 $77
    ld   hl, Data_006_499F                        ;; 06:49C8 $21 $9F $49
    add  hl, de                                   ;; 06:49CB $19
    ld   a, [hl]                                  ;; 06:49CC $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:49CD $21 $50 $C2
    add  hl, bc                                   ;; 06:49D0 $09
    ld   [hl], a                                  ;; 06:49D1 $77

.jr_49D2
    jr   jr_006_4967                              ;; 06:49D2 $18 $93

ThreeOfAKindState2Handler::
    ld   hl, wEntitiesLoadOrderTable              ;; 06:49D4 $21 $60 $C4
    add  hl, bc                                   ;; 06:49D7 $09
    ld   a, [hl]                                  ;; 06:49D8 $7E
    and  a                                        ;; 06:49D9 $A7
    jp   nz, label_006_4AA7                       ;; 06:49DA $C2 $A7 $4A

    ldh  [hMultiPurpose0], a                      ;; 06:49DD $E0 $D7
    ld   e, $0F                                   ;; 06:49DF $1E $0F
    ld   d, b                                     ;; 06:49E1 $50

jr_006_49E2:
    ld   hl, wEntitiesStatusTable                 ;; 06:49E2 $21 $80 $C2
    add  hl, de                                   ;; 06:49E5 $19
    ld   a, [hl]                                  ;; 06:49E6 $7E
    and  a                                        ;; 06:49E7 $A7
    jr   z, .jr_4A09                              ;; 06:49E8 $28 $1F

    ld   hl, wEntitiesTypeTable                   ;; 06:49EA $21 $A0 $C3
    add  hl, de                                   ;; 06:49ED $19
    ld   a, [hl]                                  ;; 06:49EE $7E
    cp   $90                                      ;; 06:49EF $FE $90
    jr   nz, .jr_4A09                             ;; 06:49F1 $20 $16

    ld   hl, wEntitiesStateTable                  ;; 06:49F3 $21 $90 $C2
    add  hl, de                                   ;; 06:49F6 $19
    ld   a, [hl]                                  ;; 06:49F7 $7E
    cp   $02                                      ;; 06:49F8 $FE $02
    jr   nz, .jr_4A09                             ;; 06:49FA $20 $0D

    ld   hl, wEntitiesTransitionCountdownTable    ;; 06:49FC $21 $E0 $C2
    add  hl, de                                   ;; 06:49FF $19
    ld   a, [hl]                                  ;; 06:4A00 $7E
    and  a                                        ;; 06:4A01 $A7
    jr   nz, .jr_4A09                             ;; 06:4A02 $20 $05

    ldh  a, [hMultiPurpose0]                      ;; 06:4A04 $F0 $D7
    inc  a                                        ;; 06:4A06 $3C
    ldh  [hMultiPurpose0], a                      ;; 06:4A07 $E0 $D7

.jr_4A09
    dec  e                                        ;; 06:4A09 $1D
    ld   a, e                                     ;; 06:4A0A $7B
    cp   $FF                                      ;; 06:4A0B $FE $FF
    jr   nz, jr_006_49E2                          ;; 06:4A0D $20 $D3

    ldh  a, [hMultiPurpose0]                      ;; 06:4A0F $F0 $D7
    cp   $03                                      ;; 06:4A11 $FE $03
    jp   nz, label_006_4AA7                       ;; 06:4A13 $C2 $A7 $4A

    push bc                                       ;; 06:4A16 $C5
    ld   c, b                                     ;; 06:4A17 $48
    ld   e, $0F                                   ;; 06:4A18 $1E $0F
    ld   d, b                                     ;; 06:4A1A $50

jr_006_4A1B:
    ld   hl, wEntitiesStatusTable                 ;; 06:4A1B $21 $80 $C2
    add  hl, de                                   ;; 06:4A1E $19
    ld   a, [hl]                                  ;; 06:4A1F $7E
    and  a                                        ;; 06:4A20 $A7
    jr   z, .jr_4A37                              ;; 06:4A21 $28 $14

    ld   hl, wEntitiesTypeTable                   ;; 06:4A23 $21 $A0 $C3
    add  hl, de                                   ;; 06:4A26 $19
    ld   a, [hl]                                  ;; 06:4A27 $7E
    cp   $90                                      ;; 06:4A28 $FE $90
    jr   nz, .jr_4A37                             ;; 06:4A2A $20 $0B

    ld   hl, wEntitiesDirectionTable              ;; 06:4A2C $21 $80 $C3
    add  hl, de                                   ;; 06:4A2F $19
    ld   a, [hl]                                  ;; 06:4A30 $7E
    ld   hl, hMultiPurpose2                       ;; 06:4A31 $21 $D9 $FF
    add  hl, bc                                   ;; 06:4A34 $09
    ld   [hl], a                                  ;; 06:4A35 $77
    inc  bc                                       ;; 06:4A36 $03

.jr_4A37
    dec  e                                        ;; 06:4A37 $1D
    ld   a, e                                     ;; 06:4A38 $7B
    cp   $FF                                      ;; 06:4A39 $FE $FF
    jr   nz, jr_006_4A1B                          ;; 06:4A3B $20 $DE

    pop  bc                                       ;; 06:4A3D $C1
    call PlayWrongAnswerJingle                    ;; 06:4A3E $CD $20 $0C
    ld   e, $00                                   ;; 06:4A41 $1E $00
    ldh  a, [hMultiPurpose2]                      ;; 06:4A43 $F0 $D9
    ld   hl, hMultiPurpose3                       ;; 06:4A45 $21 $DA $FF
    cp   [hl]                                     ;; 06:4A48 $BE
    jr   nz, .jr_4A62                             ;; 06:4A49 $20 $17

    inc  hl                                       ;; 06:4A4B $23
    cp   [hl]                                     ;; 06:4A4C $BE
    jr   nz, .jr_4A62                             ;; 06:4A4D $20 $13

IF __PATCH_0__
    ld   hl, hJingle
    ld   [hl], JINGLE_PUZZLE_SOLVED
ENDC

    ld   e, $FF                                   ;; 06:4A4F $1E $FF
    cp   $02                                      ;; 06:4A51 $FE $02
    jr   nc, .jr_4A62                             ;; 06:4A53 $30 $0D

IF !__PATCH_0__
    ld   hl, hJingle                              ;; 06:4A55 $21 $F2 $FF
    ld   [hl], JINGLE_PUZZLE_SOLVED               ;; 06:4A58 $36 $02
ENDC

    ld   e, $2D                                   ;; 06:4A5A $1E $2D
    cp   $01                                      ;; 06:4A5C $FE $01
    jr   nz, .jr_4A62                             ;; 06:4A5E $20 $02

    ld   e, $2E                                   ;; 06:4A60 $1E $2E

.jr_4A62
    ld   a, e                                     ;; 06:4A62 $7B
    ldh  [hMultiPurposeG], a                      ;; 06:4A63 $E0 $E8
    ld   e, $0F                                   ;; 06:4A65 $1E $0F
    ld   d, b                                     ;; 06:4A67 $50

jr_006_4A68:
    ld   hl, wEntitiesStatusTable                 ;; 06:4A68 $21 $80 $C2
    add  hl, de                                   ;; 06:4A6B $19
    ld   a, [hl]                                  ;; 06:4A6C $7E
    and  a                                        ;; 06:4A6D $A7
    jr   z, jr_006_4AA1                           ;; 06:4A6E $28 $31

    ld   hl, wEntitiesTypeTable                   ;; 06:4A70 $21 $A0 $C3
    add  hl, de                                   ;; 06:4A73 $19
    ld   a, [hl]                                  ;; 06:4A74 $7E
    cp   $90                                      ;; 06:4A75 $FE $90
    jr   nz, jr_006_4AA1                          ;; 06:4A77 $20 $28

    ldh  a, [hMultiPurposeG]                      ;; 06:4A79 $F0 $E8
    and  a                                        ;; 06:4A7B $A7
    jr   nz, .jr_4A85                             ;; 06:4A7C $20 $07

    ld   hl, wEntitiesStateTable                  ;; 06:4A7E $21 $90 $C2
    add  hl, de                                   ;; 06:4A81 $19
    ld   [hl], d                                  ;; 06:4A82 $72
    jr   jr_006_4AA1                              ;; 06:4A83 $18 $1C

.jr_4A85
    ld   hl, wEntitiesDroppedItemTable            ;; 06:4A85 $21 $E0 $C4
    add  hl, de                                   ;; 06:4A88 $19
    ld   [hl], a                                  ;; 06:4A89 $77
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 06:4A8A $21 $80 $C4
    add  hl, de                                   ;; 06:4A8D $19
    ld   [hl], $1F                                ;; 06:4A8E $36 $1F
    ld   hl, wEntitiesStatusTable                 ;; 06:4A90 $21 $80 $C2
    add  hl, de                                   ;; 06:4A93 $19
    ld   [hl], $01                                ;; 06:4A94 $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:4A96 $21 $40 $C3
    add  hl, de                                   ;; 06:4A99 $19
    ld   [hl], 4                                  ;; 06:4A9A $36 $04
    ld   hl, hNoiseSfx                            ;; 06:4A9C $21 $F4 $FF
    ld   [hl], NOISE_SFX_ENEMY_DESTROYED          ;; 06:4A9F $36 $13

jr_006_4AA1:
    dec  e                                        ;; 06:4AA1 $1D
    ld   a, e                                     ;; 06:4AA2 $7B
    cp   $FF                                      ;; 06:4AA3 $FE $FF
    jr   nz, jr_006_4A68                          ;; 06:4AA5 $20 $C1

label_006_4AA7:
    ret                                           ;; 06:4AA7 $C9
