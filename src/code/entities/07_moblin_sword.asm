Data_007_793D::
    db   $06, $04, $02, $00                       ;; 07:793D

MoblinSwordEntityHandler::
    ldh  a, [hMapId]                              ;; 07:7941 $F0 $F7
    cp   MAP_BOWWOW_HIDEOUT                       ;; 07:7943 $FE $15
    jr   nz, .jr_794F                             ;; 07:7945 $20 $08

    ld   a, [wIsBowWowFollowingLink]              ;; 07:7947 $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ;; 07:794A $FE $80
    jp   nz, ClearEntityStatus_07                 ;; 07:794C $C2 $A4 $7E

.jr_794F
    call func_007_7AB5                            ;; 07:794F $CD $B5 $7A
    call ReturnIfNonInteractive_07                ;; 07:7952 $CD $96 $7D
    ldh  a, [hMapId]                              ;; 07:7955 $F0 $F7
    cp   MAP_BOWWOW_HIDEOUT                       ;; 07:7957 $FE $15
    jr   z, .jr_7963                              ;; 07:7959 $28 $08

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 07:795B $21 $10 $C4
    add  hl, bc                                   ;; 07:795E $09
    ld   a, [hl]                                  ;; 07:795F $7E
    and  a                                        ;; 07:7960 $A7
    jr   z, jr_007_7966                           ;; 07:7961 $28 $03

.jr_7963
    call func_007_7A55                            ;; 07:7963 $CD $55 $7A

jr_007_7966:
    call ApplyRecoilIfNeeded_07                   ;; 07:7966 $CD $C3 $7D
    call label_3B65                               ;; 07:7969 $CD $65 $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:796C $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 07:796F $F0 $F0
    JP_TABLE                                      ;; 07:7971
._00 dw func_007_7980                             ;; 07:7972
._01 dw func_007_79B4                             ;; 07:7974
._02 dw func_007_79D7                             ;; 07:7976

Data_007_7978::
    db   $06, $FA, $00, $00

Data_007_797C::
    db   $00, $00, $FA, $06

func_007_7980::
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:7980 $CD $23 $3B
    ld   hl, wEntitiesInertiaTable                ;; 07:7983 $21 $D0 $C3
    add  hl, bc                                   ;; 07:7986 $09
    ld   [hl], $00                                ;; 07:7987 $36 $00
    call func_007_7A2D                            ;; 07:7989 $CD $2D $7A
    call GetEntityTransitionCountdown             ;; 07:798C $CD $05 $0C
    jr   nz, ret_007_79B3                         ;; 07:798F $20 $22

    ld   [hl], $80                                ;; 07:7991 $36 $80
    call IncrementEntityState                     ;; 07:7993 $CD $12 $3B

func_007_7996::
    ld   hl, wEntitiesDirectionTable              ;; 07:7996 $21 $80 $C3
    add  hl, bc                                   ;; 07:7999 $09
    ld   a, [hl]                                  ;; 07:799A $7E
    xor  $01                                      ;; 07:799B $EE $01
    ld   [hl], a                                  ;; 07:799D $77
    ld   e, a                                     ;; 07:799E $5F
    ld   d, b                                     ;; 07:799F $50
    ld   hl, Data_007_7978                        ;; 07:79A0 $21 $78 $79
    add  hl, de                                   ;; 07:79A3 $19
    ld   a, [hl]                                  ;; 07:79A4 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:79A5 $21 $40 $C2
    add  hl, bc                                   ;; 07:79A8 $09
    ld   [hl], a                                  ;; 07:79A9 $77
    ld   hl, Data_007_797C                        ;; 07:79AA $21 $7C $79
    add  hl, de                                   ;; 07:79AD $19
    ld   a, [hl]                                  ;; 07:79AE $7E
    call GetEntitySpeedYAddress                   ;; 07:79AF $CD $05 $40
    ld   [hl], a                                  ;; 07:79B2 $77

ret_007_79B3:
    ret                                           ;; 07:79B3 $C9

func_007_79B4::
    call func_007_7A2D                            ;; 07:79B4 $CD $2D $7A
    ld   hl, wEntitiesCollisionsTable             ;; 07:79B7 $21 $A0 $C2
    add  hl, bc                                   ;; 07:79BA $09
    ld   a, [hl]                                  ;; 07:79BB $7E
    and  a                                        ;; 07:79BC $A7
    jr   z, .jr_79C2                              ;; 07:79BD $28 $03

    call func_007_7996                            ;; 07:79BF $CD $96 $79

.jr_79C2
    call UpdateEntityPosWithSpeed_07              ;; 07:79C2 $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:79C5 $CD $23 $3B
    call SetEntityVariantForDirection_07          ;; 07:79C8 $CD $1A $7D
    call GetEntityTransitionCountdown             ;; 07:79CB $CD $05 $0C
    jr   nz, ret_007_79D6                         ;; 07:79CE $20 $06

    ld   [hl], $30                                ;; 07:79D0 $36 $30

func_007_79D2::
    call IncrementEntityState                     ;; 07:79D2 $CD $12 $3B
    ld   [hl], b                                  ;; 07:79D5 $70

ret_007_79D6:
    ret                                           ;; 07:79D6 $C9

func_007_79D7::
    call GetEntityPrivateCountdown1               ;; 07:79D7 $CD $00 $0C
    jr   z, .jr_79F9                              ;; 07:79DA $28 $1D

    ld   a, [wTransitionSequenceCounter]          ;; 07:79DC $FA $6B $C1
    cp   $04                                      ;; 07:79DF $FE $04
    jr   nz, .jr_79F9                             ;; 07:79E1 $20 $16

    ldh  a, [hMapId]                              ;; 07:79E3 $F0 $F7
    cp   MAP_BOWWOW_HIDEOUT                       ;; 07:79E5 $FE $15
    jr   nz, .jr_79F9                             ;; 07:79E7 $20 $10

    ld   hl, wEntitiesPrivateState3Table          ;; 07:79E9 $21 $D0 $C2
    add  hl, bc                                   ;; 07:79EC $09
    ld   a, [hl]                                  ;; 07:79ED $7E
    and  a                                        ;; 07:79EE $A7
    jr   nz, jr_007_7A1E                          ;; 07:79EF $20 $2D

    inc  [hl]                                     ;; 07:79F1 $34
    call_open_dialog Dialog190                    ;; 07:79F2
    jr   jr_007_7A1E                              ;; 07:79F7 $18 $25

.jr_79F9
    ld   a, [hl]                                  ;; 07:79F9 $7E
    and  a                                        ;; 07:79FA $A7
    jr   nz, jr_007_7A1E                          ;; 07:79FB $20 $21

    call GetEntityTransitionCountdown             ;; 07:79FD $CD $05 $0C
    jr   nz, .jr_7A07                             ;; 07:7A00 $20 $05

    ld   [hl], $18                                ;; 07:7A02 $36 $18
    call func_007_79D2                            ;; 07:7A04 $CD $D2 $79

.jr_7A07
    call SetEntityVariantForDirection_07          ;; 07:7A07 $CD $1A $7D
    call SetEntityVariantForDirection_07          ;; 07:7A0A $CD $1A $7D
    call UpdateEntityPosWithSpeed_07              ;; 07:7A0D $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:7A10 $CD $23 $3B
    ldh  a, [hFrameCounter]                       ;; 07:7A13 $F0 $E7
    xor  c                                        ;; 07:7A15 $A9
    and  $0F                                      ;; 07:7A16 $E6 $0F
    ret  nz                                       ;; 07:7A18 $C0

    ld   a, $0A                                   ;; 07:7A19 $3E $0A
    call ApplyVectorTowardsLink_trampoline        ;; 07:7A1B $CD $AA $3B

jr_007_7A1E:
    call GetEntityDirectionToLink_07              ;; 07:7A1E $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:7A21 $21 $80 $C3
    add  hl, bc                                   ;; 07:7A24 $09
    ld   [hl], a                                  ;; 07:7A25 $77
    jp   SetEntityVariantForDirection_07          ;; 07:7A26 $C3 $1A $7D

Data_007_7A29::
    db   $01, $00, $03, $02

func_007_7A2D::
    ld   a, [wC502]                               ;; 07:7A2D $FA $02 $C5
    and  a                                        ;; 07:7A30 $A7
    jr   nz, func_007_7A55                        ;; 07:7A31 $20 $22

    call GetEntityXDistanceToLink_07              ;; 07:7A33 $CD $5D $7E
    add  $30                                      ;; 07:7A36 $C6 $30
    cp   $60                                      ;; 07:7A38 $FE $60
    jr   nc, ret_007_7A6C                         ;; 07:7A3A $30 $30

    call GetEntityYDistanceToLink_07              ;; 07:7A3C $CD $6D $7E
    add  $30                                      ;; 07:7A3F $C6 $30
    cp   $60                                      ;; 07:7A41 $FE $60
    jr   nc, ret_007_7A6C                         ;; 07:7A43 $30 $27

    call GetEntityDirectionToLink_07              ;; 07:7A45 $CD $7D $7E
    ld   d, b                                     ;; 07:7A48 $50
    ld   hl, Data_007_7A29                        ;; 07:7A49 $21 $29 $7A
    add  hl, de                                   ;; 07:7A4C $19
    ld   a, [hl]                                  ;; 07:7A4D $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:7A4E $21 $80 $C3
    add  hl, bc                                   ;; 07:7A51 $09
    cp   [hl]                                     ;; 07:7A52 $BE
    jr   z, ret_007_7A6C                          ;; 07:7A53 $28 $17

func_007_7A55::
    ld   hl, wEntitiesStateTable                  ;; 07:7A55 $21 $90 $C2
    add  hl, bc                                   ;; 07:7A58 $09
    ld   a, [hl]                                  ;; 07:7A59 $7E
    cp   $02                                      ;; 07:7A5A $FE $02
    jr   z, .jr_7A65                              ;; 07:7A5C $28 $07

    push hl                                       ;; 07:7A5E $E5
    call GetEntityPrivateCountdown1               ;; 07:7A5F $CD $00 $0C
    ld   [hl], $10                                ;; 07:7A62 $36 $10
    pop  hl                                       ;; 07:7A64 $E1

.jr_7A65
    ld   [hl], $02                                ;; 07:7A65 $36 $02
    call GetEntityTransitionCountdown             ;; 07:7A67 $CD $05 $0C
    ld   [hl], $80                                ;; 07:7A6A $36 $80

ret_007_7A6C:
    ret                                           ;; 07:7A6C $C9

Data_007_7A6D::
    db   $00, $00, $F9, $F9, $F8, $F2, $08, $0E

Data_007_7A75::
    db   $08, $0E, $F8, $F2, $00, $00, $00, $00

Data_007_7A7D::
    db   $02, $02, $06, $06, $04, $04, $00, $00

Data_007_7A85::
    db   $0C, $0C, $04, $04, $FC, $FC, $14, $14

Data_007_7A8D::
    db   $14, $14, $FC, $FC, $0C, $0C, $0C, $0C

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown042SpriteVariants::
.variant0
    db $60, $03
    db $62, $03
.variant1
    db $62, $23
    db $60, $23
.variant2
    db $64, $03
    db $66, $03
.variant3
    db $66, $23
    db $64, $23
.variant4
    db $68, $03
    db $6A, $03
.variant5
    db $6C, $03
    db $6E, $03
.variant6
    db $6A, $23
    db $68, $23
.variant7
    db $6E, $23
    db $6C, $23

func_007_7AB5::
    call SkipDisabledEntityDuringRoomTransition   ;; 07:7AB5 $CD $57 $3D
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:7AB8 $F0 $F1
    cp   $02                                      ;; 07:7ABA $FE $02
    jr   nc, .jr_7AC1                             ;; 07:7ABC $30 $03

    call func_007_7B30                            ;; 07:7ABE $CD $30 $7B

.jr_7AC1
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:7AC1 $F0 $F1
    cp   $02                                      ;; 07:7AC3 $FE $02
    jr   z, .jr_7ACB                              ;; 07:7AC5 $28 $04

    cp   $03                                      ;; 07:7AC7 $FE $03
    jr   nz, jr_007_7AD1                          ;; 07:7AC9 $20 $06

.jr_7ACB
    ld   de, Unknown042SpriteVariants             ;; 07:7ACB $11 $95 $7A
    call RenderActiveEntitySpritesPair            ;; 07:7ACE $CD $C0 $3B

jr_007_7AD1:
    push bc                                       ;; 07:7AD1 $C5
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:7AD2 $F0 $EC
    ldh  [hMultiPurpose0], a                      ;; 07:7AD4 $E0 $D7
    ldh  a, [hActiveEntityPosX]                   ;; 07:7AD6 $F0 $EE
    ldh  [hMultiPurpose1], a                      ;; 07:7AD8 $E0 $D8
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:7ADA $F0 $F1
    ld   e, a                                     ;; 07:7ADC $5F
    ld   d, b                                     ;; 07:7ADD $50
    ld   hl, Data_007_7A85                        ;; 07:7ADE $21 $85 $7A
    add  hl, de                                   ;; 07:7AE1 $19
    ld   a, [hl]                                  ;; 07:7AE2 $7E
    ld   [wD5C0], a                               ;; 07:7AE3 $EA $C0 $D5
    ld   hl, Data_007_7A8D                        ;; 07:7AE6 $21 $8D $7A
    add  hl, de                                   ;; 07:7AE9 $19
    ld   a, [hl]                                  ;; 07:7AEA $7E
    ld   [wD5C2], a                               ;; 07:7AEB $EA $C2 $D5
    ld   a, $02                                   ;; 07:7AEE $3E $02
    ld   [wD5C0+1], a                             ;; 07:7AF0 $EA $C1 $D5
    ld   [wD5C2+1], a                             ;; 07:7AF3 $EA $C3 $D5
    ld   hl, Data_007_7A7D                        ;; 07:7AF6 $21 $7D $7A
    add  hl, de                                   ;; 07:7AF9 $19
    ld   a, [hl]                                  ;; 07:7AFA $7E
    ldh  [hMultiPurpose2], a                      ;; 07:7AFB $E0 $D9
    ld   hl, Data_007_7A75                        ;; 07:7AFD $21 $75 $7A
    add  hl, de                                   ;; 07:7B00 $19
    ld   a, [hl]                                  ;; 07:7B01 $7E
    ld   hl, Data_007_7A6D                        ;; 07:7B02 $21 $6D $7A
    add  hl, de                                   ;; 07:7B05 $19
    ld   l, [hl]                                  ;; 07:7B06 $6E
    ld   h, a                                     ;; 07:7B07 $67
    push hl                                       ;; 07:7B08 $E5
    ld   a, [wOAMNextAvailableSlot]               ;; 07:7B09 $FA $C0 $C3
    ld   e, a                                     ;; 07:7B0C $5F
    ld   d, $00                                   ;; 07:7B0D $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 07:7B0F $21 $30 $C0
    add  hl, de                                   ;; 07:7B12 $19
    ld   c, l                                     ;; 07:7B13 $4D
    ld   b, h                                     ;; 07:7B14 $44
    xor  a                                        ;; 07:7B15 $AF
    ldh  [hMultiPurpose3], a                      ;; 07:7B16 $E0 $DA
    pop  hl                                       ;; 07:7B18 $E1
    call func_1819                                ;; 07:7B19 $CD $19 $18
    ld   a, $02                                   ;; 07:7B1C $3E $02
    call func_015_7964_trampoline                 ;; 07:7B1E $CD $A0 $3D
    pop  bc                                       ;; 07:7B21 $C1
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:7B22 $F0 $F1
    cp   $02                                      ;; 07:7B24 $FE $02
    ret  z                                        ;; 07:7B26 $C8

    cp   $03                                      ;; 07:7B27 $FE $03
    ret  z                                        ;; 07:7B29 $C8

    ld   de, Unknown042SpriteVariants             ;; 07:7B2A $11 $95 $7A
    jp   RenderActiveEntitySpritesPair            ;; 07:7B2D $C3 $C0 $3B

func_007_7B30::
    xor  $01                                      ;; 07:7B30 $EE $01
    push af                                       ;; 07:7B32 $F5
    ld   a, [wOAMNextAvailableSlot]               ;; 07:7B33 $FA $C0 $C3
    ld   l, a                                     ;; 07:7B36 $6F
    ld   h, $00                                   ;; 07:7B37 $26 $00
    ld   de, wDynamicOAMBuffer                    ;; 07:7B39 $11 $30 $C0
    add  hl, de                                   ;; 07:7B3C $19
    pop  de                                       ;; 07:7B3D $D1
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:7B3E $F0 $EC
    add  d                                        ;; 07:7B40 $82
    add  $04                                      ;; 07:7B41 $C6 $04
    ld   [hl+], a                                 ;; 07:7B43 $22
    ldh  a, [hActiveEntityPosX]                   ;; 07:7B44 $F0 $EE
    add  $FE                                      ;; 07:7B46 $C6 $FE
    ld   [hl+], a                                 ;; 07:7B48 $22
    ld   a, $86                                   ;; 07:7B49 $3E $86
    ld   [hl+], a                                 ;; 07:7B4B $22
    ld   [hl], $16                                ;; 07:7B4C $36 $16
    ld   a, $01                                   ;; 07:7B4E $3E $01
    jp   func_015_7964_trampoline                 ;; 07:7B50 $C3 $A0 $3D
