; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MrWriteSpriteVariants::
.variant0
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
.variant2
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MrWriteBirdChristineHouseSpriteVariants::
.variant0
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
.variant2
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

MrWriteBirdEntityHandler::
    ld   hl, wEntitiesDirectionTable              ;; 06:723C $21 $80 $C3
    add  hl, bc                                   ;; 06:723F $09
    ldh  a, [hActiveEntitySpriteVariant]          ;; 06:7240 $F0 $F1
    add  [hl]                                     ;; 06:7242 $86
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:7243 $E0 $F1
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7245 $21 $40 $C2
    add  hl, bc                                   ;; 06:7248 $09
    ld   a, [hl]                                  ;; 06:7249 $7E
    and  a                                        ;; 06:724A $A7
    jr   z, jr_006_725A                           ;; 06:724B $28 $0D

    and  $80                                      ;; 06:724D $E6 $80
    ld   a, $00                                   ;; 06:724F $3E $00
    jr   nz, .jr_7255                             ;; 06:7251 $20 $02

    ld   a, $03                                   ;; 06:7253 $3E $03

.jr_7255
    ld   hl, wEntitiesDirectionTable              ;; 06:7255 $21 $80 $C3
    add  hl, bc                                   ;; 06:7258 $09
    ld   [hl], a                                  ;; 06:7259 $77

jr_006_725A:
    ld   de, MrWriteSpriteVariants                ;; 06:725A $11 $0C $72
    ldh  a, [hMapRoom]                            ;; 06:725D $F0 $F6
    cp   ROOM_INDOOR_B_CHRISTINE_HOUSE            ;; 06:725F $FE $D9
    jr   nz, .jr_7266                             ;; 06:7261 $20 $03

    ld   de, MrWriteBirdChristineHouseSpriteVariants ;; 06:7263 $11 $24 $72

.jr_7266
    call RenderActiveEntitySpritesPair            ;; 06:7266 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:7269 $CD $C6 $64
    ld   a, [wIsIndoor]                           ;; 06:726C $FA $A5 $DB
    and  a                                        ;; 06:726F $A7
    jp   z, label_006_7372                        ;; 06:7270 $CA $72 $73

    call AddEntityZSpeedToPos_06                  ;; 06:7273 $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7276 $21 $20 $C3
    add  hl, bc                                   ;; 06:7279 $09
    dec  [hl]                                     ;; 06:727A $35
    ld   hl, wEntitiesPosZTable                   ;; 06:727B $21 $10 $C3
    add  hl, bc                                   ;; 06:727E $09
    ld   a, [hl]                                  ;; 06:727F $7E
    and  $80                                      ;; 06:7280 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 06:7282 $E0 $E8
    jr   z, .jr_728C                              ;; 06:7284 $28 $06

    ld   [hl], b                                  ;; 06:7286 $70
    ld   hl, wEntitiesPosZTable                   ;; 06:7287 $21 $10 $C3
    add  hl, bc                                   ;; 06:728A $09
    ld   [hl], b                                  ;; 06:728B $70

.jr_728C
    ldh  a, [hActiveEntityState]                  ;; 06:728C $F0 $F0
    JP_TABLE                                      ;; 06:728E
._00 dw MrWriteBirdState0Handler
._01 dw MrWriteBirdState1Handler
._02 dw MrWriteBirdState2Handler

Data_006_7295::
    db   $02, $06, $08, $06, $FE, $FA, $F8, $FA

MrWriteBirdState0Handler::
    call func_006_7335                            ;; 06:729D $CD $35 $73
    xor  a                                        ;; 06:72A0 $AF
    call SetEntitySpriteVariant                   ;; 06:72A1 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 06:72A4 $CD $05 $0C

.jr_72A7
    jr   nz, .jr_72E0                             ;; 06:72A7 $20 $37

    call GetRandomByte                            ;; 06:72A9 $CD $0D $28
    and  $07                                      ;; 06:72AC $E6 $07
    ld   e, a                                     ;; 06:72AE $5F
    ld   d, b                                     ;; 06:72AF $50
    ld   hl, Data_006_7295                        ;; 06:72B0 $21 $95 $72
    add  hl, de                                   ;; 06:72B3 $19
    ld   a, [hl]                                  ;; 06:72B4 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:72B5 $21 $40 $C2
    add  hl, bc                                   ;; 06:72B8 $09
    ld   [hl], a                                  ;; 06:72B9 $77
    ld   a, e                                     ;; 06:72BA $7B
    and  $04                                      ;; 06:72BB $E6 $04
    ld   hl, wEntitiesDirectionTable              ;; 06:72BD $21 $80 $C3
    add  hl, bc                                   ;; 06:72C0 $09
    ld   [hl], a                                  ;; 06:72C1 $77
    call GetRandomByte                            ;; 06:72C2 $CD $0D $28
    and  $07                                      ;; 06:72C5 $E6 $07
    ld   e, a                                     ;; 06:72C7 $5F
    ld   hl, Data_006_7295                        ;; 06:72C8 $21 $95 $72
    add  hl, de                                   ;; 06:72CB $19
    ld   a, [hl]                                  ;; 06:72CC $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:72CD $21 $50 $C2
    add  hl, bc                                   ;; 06:72D0 $09
    ld   [hl], a                                  ;; 06:72D1 $77
    call GetEntityTransitionCountdown             ;; 06:72D2 $CD $05 $0C
    call GetRandomByte                            ;; 06:72D5 $CD $0D $28
    and  $1F                                      ;; 06:72D8 $E6 $1F
    add  $20                                      ;; 06:72DA $C6 $20
    ld   [hl], a                                  ;; 06:72DC $77
    call IncrementEntityState                     ;; 06:72DD $CD $12 $3B

.jr_72E0
    jp   label_006_7308                           ;; 06:72E0 $C3 $08 $73

MrWriteBirdState1Handler::
    call func_006_7335                            ;; 06:72E3 $CD $35 $73
    call UpdateEntityPosWithSpeed_06              ;; 06:72E6 $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:72E9 $CD $23 $3B
    ldh  a, [hMultiPurposeG]                      ;; 06:72EC $F0 $E8
    and  a                                        ;; 06:72EE $A7
    jr   z, label_006_7308                        ;; 06:72EF $28 $17

    call GetEntityTransitionCountdown             ;; 06:72F1 $CD $05 $0C
    jr   nz, .jr_72FD                             ;; 06:72F4 $20 $07

    ld   [hl], $30                                ;; 06:72F6 $36 $30
    call IncrementEntityState                     ;; 06:72F8 $CD $12 $3B
    ld   [hl], b                                  ;; 06:72FB $70
    ret                                           ;; 06:72FC $C9

.jr_72FD
    ld   hl, wEntitiesSpeedZTable                 ;; 06:72FD $21 $20 $C3
    add  hl, bc                                   ;; 06:7300 $09
    ld   [hl], $08                                ;; 06:7301 $36 $08
    ld   hl, wEntitiesPosZTable                   ;; 06:7303 $21 $10 $C3
    add  hl, bc                                   ;; 06:7306 $09
    inc  [hl]                                     ;; 06:7307 $34

label_006_7308:
    ldh  a, [hFrameCounter]                       ;; 06:7308 $F0 $E7
    rra                                           ;; 06:730A $1F
    rra                                           ;; 06:730B $1F
    rra                                           ;; 06:730C $1F
    and  $01                                      ;; 06:730D $E6 $01
    jp   SetEntitySpriteVariant                   ;; 06:730F $C3 $0C $3B

MrWriteBirdState2Handler::
    call UpdateEntityPosWithSpeed_06              ;; 06:7312 $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:7315 $CD $23 $3B
    ldh  a, [hFrameCounter]                       ;; 06:7318 $F0 $E7
    and  $01                                      ;; 06:731A $E6 $01
    jr   nz, .jr_7323                             ;; 06:731C $20 $05

    ld   hl, wEntitiesSpeedZTable                 ;; 06:731E $21 $20 $C3
    add  hl, bc                                   ;; 06:7321 $09
    inc  [hl]                                     ;; 06:7322 $34

.jr_7323
    ldh  a, [hMultiPurposeG]                      ;; 06:7323 $F0 $E8
    and  a                                        ;; 06:7325 $A7
    jr   z, .jr_732C                              ;; 06:7326 $28 $04

    call IncrementEntityState                     ;; 06:7328 $CD $12 $3B
    ld   [hl], b                                  ;; 06:732B $70

.jr_732C
    ldh  a, [hFrameCounter]                       ;; 06:732C $F0 $E7
    rra                                           ;; 06:732E $1F
    and  $02                                      ;; 06:732F $E6 $02
    call SetEntitySpriteVariant                   ;; 06:7331 $CD $0C $3B
    ret                                           ;; 06:7334 $C9

func_006_7335::
    ld   a, [wSwordAnimationState]                ;; 06:7335 $FA $37 $C1
    cp   SWORD_ANIMATION_STATE_SWING_START        ;; 06:7338 $FE $02
    jr   nz, .ret_7371                            ;; 06:733A $20 $35

    call GetEntityXDistanceToLink_06              ;; 06:733C $CD $94 $65
    add  $18                                      ;; 06:733F $C6 $18
    cp   $30                                      ;; 06:7341 $FE $30
    jr   nc, .ret_7371                            ;; 06:7343 $30 $2C

    call GetEntityYDistanceToLink_06              ;; 06:7345 $CD $A4 $65
    add  $18                                      ;; 06:7348 $C6 $18
    cp   $30                                      ;; 06:734A $FE $30
    jr   nc, .ret_7371                            ;; 06:734C $30 $23

    call IncrementEntityState                     ;; 06:734E $CD $12 $3B
    ld   [hl], $02                                ;; 06:7351 $36 $02
    ld   a, $10                                   ;; 06:7353 $3E $10
    call GetVectorTowardsLink_trampoline          ;; 06:7355 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:7358 $F0 $D7
    cpl                                           ;; 06:735A $2F
    inc  a                                        ;; 06:735B $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 06:735C $21 $50 $C2
    add  hl, bc                                   ;; 06:735F $09
    ld   [hl], a                                  ;; 06:7360 $77
    ldh  a, [hMultiPurpose1]                      ;; 06:7361 $F0 $D8
    cpl                                           ;; 06:7363 $2F
    inc  a                                        ;; 06:7364 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7365 $21 $40 $C2
    add  hl, bc                                   ;; 06:7368 $09
    ld   [hl], a                                  ;; 06:7369 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 06:736A $21 $20 $C3
    add  hl, bc                                   ;; 06:736D $09
    ld   [hl], $0C                                ;; 06:736E $36 $0C
    pop  af                                       ;; 06:7370 $F1

.ret_7371
    ret                                           ;; 06:7371 $C9

label_006_7372:
    ret                                           ;; 06:7372 $C9
