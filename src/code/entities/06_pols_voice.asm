; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PolsVoiceSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

PolsVoiceEntityHandler::
    ld   a, [wLinkPlayingOcarinaCountdown]        ;; 06:737B $FA $66 $C1
    cp   $01                                      ;; 06:737E $FE $01
    jr   nz, .jr_73AD                             ;; 06:7380 $20 $2B

    ld   a, [wOcarinaSongFlags]                   ;; 06:7382 $FA $49 $DB
    and  BALLAD_OF_THE_WIND_FISH_FLAG             ;; 06:7385 $E6 $04
    jr   z, .jr_73AD                              ;; 06:7387 $28 $24

    ld   a, [wSelectedSongIndex]                  ;; 06:7389 $FA $4A $DB
    and  a                                        ;; 06:738C $A7
    jr   nz, .jr_73AD                             ;; 06:738D $20 $1E

    ldh  a, [hActiveEntityStatus]                 ;; 06:738F $F0 $EA
    cp   $01                                      ;; 06:7391 $FE $01
    jr   z, .jr_73AD                              ;; 06:7393 $28 $18

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 06:7395 $21 $80 $C4
    add  hl, bc                                   ;; 06:7398 $09
    ld   [hl], $1F                                ;; 06:7399 $36 $1F
    ld   hl, wEntitiesStatusTable                 ;; 06:739B $21 $80 $C2
    add  hl, bc                                   ;; 06:739E $09
    ld   [hl], $01                                ;; 06:739F $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:73A1 $21 $40 $C3
    add  hl, bc                                   ;; 06:73A4 $09
    ld   [hl], 4                                  ;; 06:73A5 $36 $04
    ld   hl, hNoiseSfx                            ;; 06:73A7 $21 $F4 $FF
    ld   [hl], NOISE_SFX_ENEMY_DESTROYED          ;; 06:73AA $36 $13
    ret                                           ;; 06:73AC $C9

.jr_73AD
    ld   de, PolsVoiceSpriteVariants              ;; 06:73AD $11 $73 $73
    call RenderActiveEntitySpritesPair            ;; 06:73B0 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:73B3 $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:73B6 $CD $F7 $64
    call UpdateEntityPosWithSpeed_06              ;; 06:73B9 $CD $41 $65
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 06:73BC $21 $10 $C4
    add  hl, bc                                   ;; 06:73BF $09
    ld   [hl], $01                                ;; 06:73C0 $36 $01
    push hl                                       ;; 06:73C2 $E5
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:73C3 $CD $23 $3B
    pop  hl                                       ;; 06:73C6 $E1
    ld   [hl], b                                  ;; 06:73C7 $70
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:73C8 $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 06:73CB $F0 $F0
    and  $01                                      ;; 06:73CD $E6 $01
    JP_TABLE                                      ;; 06:73CF
._00 dw func_006_73E0                             ;; 06:73D0
._01 dw func_006_7423                             ;; 06:73D2

Data_006_73D4::
    db   $08, $08, $F8, $F8, $04, $FC

Data_006_73DA::
    db   $FC, $04, $FC, $04, $08, $F8

func_006_73E0::
    ld   hl, wEntitiesSpriteVariantTable          ;; 06:73E0 $21 $B0 $C3
    add  hl, bc                                   ;; 06:73E3 $09
    ld   [hl], $01                                ;; 06:73E4 $36 $01
    call GetEntityTransitionCountdown             ;; 06:73E6 $CD $05 $0C
    ret  nz                                       ;; 06:73E9 $C0

    call IncrementEntityState                     ;; 06:73EA $CD $12 $3B
    call GetRandomByte                            ;; 06:73ED $CD $0D $28
    and  $07                                      ;; 06:73F0 $E6 $07
    add  $10                                      ;; 06:73F2 $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ;; 06:73F4 $21 $20 $C3
    add  hl, bc                                   ;; 06:73F7 $09
    ld   [hl], a                                  ;; 06:73F8 $77
    call GetRandomByte                            ;; 06:73F9 $CD $0D $28
    and  $07                                      ;; 06:73FC $E6 $07
    cp   $06                                      ;; 06:73FE $FE $06
    jr   c, .jr_7409                              ;; 06:7400 $38 $07

    ld   a, $0A                                   ;; 06:7402 $3E $0A
    call ApplyVectorTowardsLink_trampoline        ;; 06:7404 $CD $AA $3B
    jr   jr_006_741F                              ;; 06:7407 $18 $16

.jr_7409
    ld   e, a                                     ;; 06:7409 $5F
    ld   d, b                                     ;; 06:740A $50
    ld   hl, Data_006_73D4                        ;; 06:740B $21 $D4 $73
    add  hl, de                                   ;; 06:740E $19
    ld   a, [hl]                                  ;; 06:740F $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7410 $21 $40 $C2
    add  hl, bc                                   ;; 06:7413 $09
    ld   [hl], a                                  ;; 06:7414 $77
    ld   hl, Data_006_73DA                        ;; 06:7415 $21 $DA $73
    add  hl, de                                   ;; 06:7418 $19
    ld   a, [hl]                                  ;; 06:7419 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:741A $21 $50 $C2
    add  hl, bc                                   ;; 06:741D $09
    ld   [hl], a                                  ;; 06:741E $77

jr_006_741F:
    xor  a                                        ;; 06:741F $AF
    jp   SetEntitySpriteVariant                   ;; 06:7420 $C3 $0C $3B

func_006_7423::
    call AddEntityZSpeedToPos_06                  ;; 06:7423 $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7426 $21 $20 $C3
    add  hl, bc                                   ;; 06:7429 $09
    dec  [hl]                                     ;; 06:742A $35
    ld   hl, wEntitiesPosZTable                   ;; 06:742B $21 $10 $C3
    add  hl, bc                                   ;; 06:742E $09
    ld   a, [hl]                                  ;; 06:742F $7E
    and  $80                                      ;; 06:7430 $E6 $80
    ret  z                                        ;; 06:7432 $C8

    xor  a                                        ;; 06:7433 $AF
    ld   [hl], a                                  ;; 06:7434 $77
    call IncrementEntityState                     ;; 06:7435 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 06:7438 $CD $05 $0C
    call GetRandomByte                            ;; 06:743B $CD $0D $28
    and  $0F                                      ;; 06:743E $E6 $0F
    add  $18                                      ;; 06:7440 $C6 $18
    ld   [hl], a                                  ;; 06:7442 $77
    jp   ClearEntitySpeed                         ;; 06:7443 $C3 $7F $3D
