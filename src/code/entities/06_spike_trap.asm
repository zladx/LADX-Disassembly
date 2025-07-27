; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SpikeTrapSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

Data_006_74FE::
    db   $20, $E0, $00, $00

Data_006_7502::
    db   $F8, $08, $00, $00

Data_006_7506::
    db   $00, $00, $E0, $20

Data_006_750A::
    db   $00, $00, $08, $F8, $30, $20

SpikeTrapEntityHandler::
    ld   a, $01                                   ;; 06:7510 $3E $01
    ldh  [hActiveEntityNoBGCollision], a          ;; 06:7512 $E0 $BE
    ld   de, SpikeTrapSpriteVariants              ;; 06:7514 $11 $FA $74
    call RenderActiveEntitySpritesPair            ;; 06:7517 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:751A $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ;; 06:751D $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:7520 $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 06:7523 $F0 $F0
    JP_TABLE                                      ;; 06:7525
._00 dw SpikeTrapState0Handler
._01 dw SpikeTrapState1Handler
._02 dw SpikeTrapState2Handler
._03 dw SpikeTrapState3Handler

SpikeTrapState0Handler::
    ldh  a, [hActiveEntityPosX]
    ld   hl, wEntitiesPrivateState1Table
    add  hl, bc
    ld   [hl], a

    ldh  a, [hActiveEntityVisualPosY]             ;; 06:7535 $F0 $EC
    ld   hl, wEntitiesPrivateState2Table          ;; 06:7537 $21 $C0 $C2
    add  hl, bc                                   ;; 06:753A $09
    ld   [hl], a                                  ;; 06:753B $77
    jp   IncrementEntityState                     ;; 06:753C $C3 $12 $3B

SpikeTrapState1Handler::
    call GetEntityTransitionCountdown             ;; 06:753F $CD $05 $0C
    jr   nz, ret_006_7599                         ;; 06:7542 $20 $55

    call ClearEntitySpeed                         ;; 06:7544 $CD $7F $3D
    call GetEntityYDistanceToLink_06              ;; 06:7547 $CD $A4 $65
    add  $12                                      ;; 06:754A $C6 $12
    cp   $24                                      ;; 06:754C $FE $24
    jr   nc, .jr_7567                             ;; 06:754E $30 $17

    call GetEntityXDistanceToLink_06              ;; 06:7550 $CD $94 $65
    ld   d, b                                     ;; 06:7553 $50
    ld   hl, Data_006_74FE                        ;; 06:7554 $21 $FE $74
    add  hl, de                                   ;; 06:7557 $19
    ld   a, [hl]                                  ;; 06:7558 $7E
    ld   hl, wEntitiesDirectionTable              ;; 06:7559 $21 $80 $C3
    add  hl, bc                                   ;; 06:755C $09
    ld   [hl], e                                  ;; 06:755D $73
    ld   hl, wEntitiesSpeedXTable                 ;; 06:755E $21 $40 $C2
    add  hl, bc                                   ;; 06:7561 $09
    ld   [hl], a                                  ;; 06:7562 $77
    ld   e, $18                                   ;; 06:7563 $1E $18
    jr   jr_006_7585                              ;; 06:7565 $18 $1E

.jr_7567
    call GetEntityXDistanceToLink_06              ;; 06:7567 $CD $94 $65
    add  $12                                      ;; 06:756A $C6 $12
    cp   $24                                      ;; 06:756C $FE $24
    jr   nc, ret_006_7599                         ;; 06:756E $30 $29

    call GetEntityYDistanceToLink_06              ;; 06:7570 $CD $A4 $65
    ld   d, b                                     ;; 06:7573 $50
    ld   hl, Data_006_7506                        ;; 06:7574 $21 $06 $75
    add  hl, de                                   ;; 06:7577 $19
    ld   a, [hl]                                  ;; 06:7578 $7E
    ld   hl, wEntitiesDirectionTable              ;; 06:7579 $21 $80 $C3
    add  hl, bc                                   ;; 06:757C $09
    ld   [hl], e                                  ;; 06:757D $73
    ld   hl, wEntitiesSpeedYTable                 ;; 06:757E $21 $50 $C2
    add  hl, bc                                   ;; 06:7581 $09
    ld   [hl], a                                  ;; 06:7582 $77
    ld   e, $10                                   ;; 06:7583 $1E $10

jr_006_7585:
    call GetEntityTransitionCountdown             ;; 06:7585 $CD $05 $0C
    ld   [hl], e                                  ;; 06:7588 $73
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:7589 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 06:758C $21 $A0 $C2
    add  hl, bc                                   ;; 06:758F $09
    ld   a, [hl]                                  ;; 06:7590 $7E
    and  $0F                                      ;; 06:7591 $E6 $0F
    jr   z, jr_006_759A                           ;; 06:7593 $28 $05

    call GetEntityTransitionCountdown             ;; 06:7595 $CD $05 $0C
    ld   [hl], b                                  ;; 06:7598 $70

ret_006_7599:
    ret                                           ;; 06:7599 $C9

jr_006_759A:
    ld   a, NOISE_SFX_WHOOSH                      ;; 06:759A $3E $0A
    ldh  [hNoiseSfx], a                           ;; 06:759C $E0 $F4
    jp   IncrementEntityState                     ;; 06:759E $C3 $12 $3B

SpikeTrapState2Handler::
    call UpdateEntityPosWithSpeed_06              ;; 06:75A1 $CD $41 $65
    call GetEntityTransitionCountdown             ;; 06:75A4 $CD $05 $0C
    jr   nz, jr_006_75B5                          ;; 06:75A7 $20 $0C

jr_006_75A9:
    ld   a, JINGLE_SWORD_POKING                   ;; 06:75A9 $3E $07
    ldh  [hJingle], a                             ;; 06:75AB $E0 $F2
    call GetEntityTransitionCountdown             ;; 06:75AD $CD $05 $0C
    ld   [hl], $20                                ;; 06:75B0 $36 $20
    jp   IncrementEntityState                     ;; 06:75B2 $C3 $12 $3B

jr_006_75B5:
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:75B5 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 06:75B8 $21 $A0 $C2
    add  hl, bc                                   ;; 06:75BB $09
    ld   a, [hl]                                  ;; 06:75BC $7E
    and  $0F                                      ;; 06:75BD $E6 $0F
    jr   nz, jr_006_75A9                          ;; 06:75BF $20 $E8

    ret                                           ;; 06:75C1 $C9

SpikeTrapState3Handler::
    call GetEntityTransitionCountdown             ;; 06:75C2 $CD $05 $0C
    ret  nz                                       ;; 06:75C5 $C0

    ld   hl, wEntitiesDirectionTable              ;; 06:75C6 $21 $80 $C3
    add  hl, bc                                   ;; 06:75C9 $09
    ld   e, [hl]                                  ;; 06:75CA $5E
    ld   d, b                                     ;; 06:75CB $50
    ld   hl, Data_006_7502                        ;; 06:75CC $21 $02 $75
    add  hl, de                                   ;; 06:75CF $19
    ld   a, [hl]                                  ;; 06:75D0 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:75D1 $21 $40 $C2
    add  hl, bc                                   ;; 06:75D4 $09
    ld   [hl], a                                  ;; 06:75D5 $77
    ld   hl, Data_006_750A                        ;; 06:75D6 $21 $0A $75
    add  hl, de                                   ;; 06:75D9 $19
    ld   a, [hl]                                  ;; 06:75DA $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:75DB $21 $50 $C2
    add  hl, bc                                   ;; 06:75DE $09
    ld   [hl], a                                  ;; 06:75DF $77
    call UpdateEntityPosWithSpeed_06              ;; 06:75E0 $CD $41 $65
    ld   hl, wEntitiesPrivateState1Table          ;; 06:75E3 $21 $B0 $C2
    add  hl, bc                                   ;; 06:75E6 $09
    ld   a, [hl]                                  ;; 06:75E7 $7E
    ld   hl, wEntitiesPosXTable                   ;; 06:75E8 $21 $00 $C2
    add  hl, bc                                   ;; 06:75EB $09
    cp   [hl]                                     ;; 06:75EC $BE
    ret  nz                                       ;; 06:75ED $C0

    ld   hl, wEntitiesPrivateState2Table          ;; 06:75EE $21 $C0 $C2
    add  hl, bc                                   ;; 06:75F1 $09
    ld   a, [hl]                                  ;; 06:75F2 $7E
    ld   hl, wEntitiesPosYTable                   ;; 06:75F3 $21 $10 $C2
    add  hl, bc                                   ;; 06:75F6 $09
    cp   [hl]                                     ;; 06:75F7 $BE
    ret  nz                                       ;; 06:75F8 $C0

    call GetEntityTransitionCountdown             ;; 06:75F9 $CD $05 $0C
    ld   [hl], $20                                ;; 06:75FC $36 $20
    call IncrementEntityState                     ;; 06:75FE $CD $12 $3B
    ld   [hl], $01                                ;; 06:7601 $36 $01
    ret                                           ;; 06:7603 $C9
