; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Bombite1SpriteVariants::
.variant0
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant2
    db $7E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0
.variant5
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Bombite2SpriteVariants::
.variant0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant2
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
.variant5
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

TimerBombiteEntityHandler::
    ld   de, Bombite1SpriteVariants               ;; 04:7D1F $11 $EF $7C
    ldh  a, [hMapId]                              ;; 04:7D22 $F0 $F7
    cp   MAP_TURTLE_ROCK                          ;; 04:7D24 $FE $07
    jr   nz, .render                              ;; 04:7D26 $20 $03

    ld   de, Bombite2SpriteVariants               ;; 04:7D28 $11 $07 $7D

.render
    call GetEntityPrivateCountdown1               ;; 04:7D2B $CD $00 $0C
    rla                                           ;; 04:7D2E $17
    rla                                           ;; 04:7D2F $17
    rla                                           ;; 04:7D30 $17
    and  OAMF_PAL1                                ;; 04:7D31 $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ;; 04:7D33 $E0 $ED
    call RenderActiveEntitySpritesPair            ;; 04:7D35 $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:7D38 $CD $A3 $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 04:7D3B $21 $10 $C4
    add  hl, bc                                   ;; 04:7D3E $09
    ld   a, [hl]                                  ;; 04:7D3F $7E
    cp   $08                                      ;; 04:7D40 $FE $08
    jr   nz, .skipIncrementState                  ;; 04:7D42 $20 $0D

    ldh  a, [hActiveEntityState]                  ;; 04:7D44 $F0 $F0
    and  a                                        ;; 04:7D46 $A7
    jr   nz, .skipIncrementState                  ;; 04:7D47 $20 $08

    call IncrementEntityState                     ;; 04:7D49 $CD $12 $3B
    call GetEntitySlowTransitionCountdown         ;; 04:7D4C $CD $FB $0B
    ld   [hl], $6F                                ;; 04:7D4F $36 $6F

.skipIncrementState
    call ApplyRecoilIfNeeded_04                   ;; 04:7D51 $CD $80 $6D
    call UpdateEntityPosWithSpeed_04              ;; 04:7D54 $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:7D57 $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ;; 04:7D5A $F0 $F0
    JP_TABLE                                      ;; 04:7D5C
._00 dw TimerBombiteWalkingHandler                ;; 04:7D5D
._01 dw TimerBombiteLitHandler                    ;; 04:7D5F

TimerBombiteSpeedXPerDirection::
    db   $08, $F8, $00, $00

TimerBombiteSpeedYPerDirection::
    db   $00, $00, $F8, $00

TimerBombiteWalkingHandler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:7D69 $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 04:7D6C $CD $05 $0C
    jr   nz, .chooseDirectionEnd                  ;; 04:7D6F $20 $20

    call GetRandomByte                            ;; 04:7D71 $CD $0D $28
    and  $1F                                      ;; 04:7D74 $E6 $1F
    add  $30                                      ;; 04:7D76 $C6 $30
    ld   [hl], a                                  ;; 04:7D78 $77
    and  $03                                      ;; 04:7D79 $E6 $03
    ld   e, a                                     ;; 04:7D7B $5F
    ld   d, b                                     ;; 04:7D7C $50
    ld   hl, TimerBombiteSpeedXPerDirection       ;; 04:7D7D $21 $61 $7D
    add  hl, de                                   ;; 04:7D80 $19
    ld   a, [hl]                                  ;; 04:7D81 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:7D82 $21 $40 $C2
    add  hl, bc                                   ;; 04:7D85 $09
    ld   [hl], a                                  ;; 04:7D86 $77
    ld   hl, TimerBombiteSpeedYPerDirection       ;; 04:7D87 $21 $65 $7D
    add  hl, de                                   ;; 04:7D8A $19
    ld   a, [hl]                                  ;; 04:7D8B $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:7D8C $21 $50 $C2
    add  hl, bc                                   ;; 04:7D8F $09
    ld   [hl], a                                  ;; 04:7D90 $77

.chooseDirectionEnd
    ldh  a, [hFrameCounter]                       ;; 04:7D91 $F0 $E7
    rra                                           ;; 04:7D93 $1F
    rra                                           ;; 04:7D94 $1F
    rra                                           ;; 04:7D95 $1F
    rra                                           ;; 04:7D96 $1F
    and  $01                                      ;; 04:7D97 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 04:7D99 $C3 $0C $3B

; Sprite variants for countdown animation
TimerBombiteCountdownAnimation::
    db   $05, $05, $04, $03, $02, $02, $02

TimerBombiteLitHandler::
    ld   a, [wIsRunningWithPegasusBoots]          ;; 04:7DA3 $FA $4A $C1
    and  a                                        ;; 04:7DA6 $A7
    jr   z, .linkNotRunning                       ;; 04:7DA7 $28 $05

    call IncrementEntityState                     ;; 04:7DA9 $CD $12 $3B
    ld   [hl], b                                  ;; 04:7DAC $70
    ret                                           ;; 04:7DAD $C9

.linkNotRunning
    call label_3B70                               ;; 04:7DAE $CD $70 $3B
    call GetEntityXDistanceToLink_04              ;; 04:7DB1 $CD $35 $6E
    add  $12                                      ;; 04:7DB4 $C6 $12
    cp   $24                                      ;; 04:7DB6 $FE $24
    jr   nc, .chaseLink                           ;; 04:7DB8 $30 $09

    call GetEntityYDistanceToLink_04              ;; 04:7DBA $CD $45 $6E
    add  $12                                      ;; 04:7DBD $C6 $12
    cp   $24                                      ;; 04:7DBF $FE $24
    jr   c, .chaseLinkEnd                         ;; 04:7DC1 $38 $0E

.chaseLink
    ldh  a, [hFrameCounter]                       ;; 04:7DC3 $F0 $E7
    xor  c                                        ;; 04:7DC5 $A9
    and  $03                                      ;; 04:7DC6 $E6 $03
    jr   nz, .skipUpdateSpeed                     ;; 04:7DC8 $20 $05

    ld   a, $0E                                   ;; 04:7DCA $3E $0E
    call ApplyVectorTowardsLink_trampoline        ;; 04:7DCC $CD $AA $3B

.skipUpdateSpeed
    jr   .skipClearSpeed                          ;; 04:7DCF $18 $03

.chaseLinkEnd
    call ClearEntitySpeed                         ;; 04:7DD1 $CD $7F $3D

.skipClearSpeed
    call GetEntitySlowTransitionCountdown         ;; 04:7DD4 $CD $FB $0B
    jp   z, BombiteExplodeAndDisappear            ;; 04:7DD7 $CA $BA $7E

    cp   $18                                      ;; 04:7DDA $FE $18
    jr   nz, .startFlashingEnd                    ;; 04:7DDC $20 $07

    ld   [hl], $0A                                ;; 04:7DDE $36 $0A
    call GetEntityPrivateCountdown1               ;; 04:7DE0 $CD $00 $0C
    ld   [hl], $30                                ;; 04:7DE3 $36 $30

.startFlashingEnd
    rra                                           ;; 04:7DE5 $1F
    rra                                           ;; 04:7DE6 $1F
    rra                                           ;; 04:7DE7 $1F
    rra                                           ;; 04:7DE8 $1F
    and  $07                                      ;; 04:7DE9 $E6 $07
    ld   e, a                                     ;; 04:7DEB $5F
    ld   d, b                                     ;; 04:7DEC $50
    ld   hl, TimerBombiteCountdownAnimation       ;; 04:7DED $21 $9C $7D
    add  hl, de                                   ;; 04:7DF0 $19
    ld   a, [hl]                                  ;; 04:7DF1 $7E
    jp   SetEntitySpriteVariant                   ;; 04:7DF2 $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BouncingBombite1SpriteVariants::
.variant0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BouncingBombite2SpriteVariants::
.variant0
    db $6A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_2 | OAMF_PAL0

BouncingBombiteSpeedXPerDirection::
    db   $08, $F8, $00, $00

BouncingBombiteSpeedYPerDirection::
    db   $00, $00, $F8, $08

BouncingBombiteEntityHandler::
    ld   de, BouncingBombite1SpriteVariants       ;; 04:7E0D $11 $F5 $7D
    ldh  a, [hMapId]                              ;; 04:7E10 $F0 $F7
    cp   MAP_TURTLE_ROCK                          ;; 04:7E12 $FE $07
    jr   nz, .render                              ;; 04:7E14 $20 $03

    ld   de, BouncingBombite2SpriteVariants       ;; 04:7E16 $11 $FD $7D

.render
    call RenderActiveEntitySpritesPair            ;; 04:7E19 $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:7E1C $CD $A3 $7F
    call ApplyRecoilIfNeeded_04                   ;; 04:7E1F $CD $80 $6D
    call GetEntityPrivateCountdown1               ;; 04:7E22 $CD $00 $0C
    jr   nz, .jr_7E2A                             ;; 04:7E25 $20 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:7E27 $CD $39 $3B

.jr_7E2A
    call UpdateEntityPosWithSpeed_04              ;; 04:7E2A $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:7E2D $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ;; 04:7E30 $F0 $F0
    JP_TABLE                                      ;; 04:7E32
._00 dw BouncingBombiteWalkingHandler             ;; 04:7E33
._01 dw BouncingBombiteTurningHandler             ;; 04:7E35
._02 dw BouncingBombiteLitHandler                 ;; 04:7E37

BouncingBombiteWalkingHandler::
    call GetEntityTransitionCountdown             ;; 04:7E39 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 04:7E3C $20 $03

    call IncrementEntityState                     ;; 04:7E3E $CD $12 $3B

.skipIncrementState
    ldh  a, [hFrameCounter]                       ;; 04:7E41 $F0 $E7
    rra                                           ;; 04:7E43 $1F
    rra                                           ;; 04:7E44 $1F
    rra                                           ;; 04:7E45 $1F
    rra                                           ;; 04:7E46 $1F
    and  $01                                      ;; 04:7E47 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 04:7E49 $C3 $0C $3B

BouncingBombiteTurningHandler::
    call GetRandomByte                            ;; 04:7E4C $CD $0D $28
    and  $03                                      ;; 04:7E4F $E6 $03
    jr   z, .getDirectionToLink                   ;; 04:7E51 $28 $07

    call GetRandomByte                            ;; 04:7E53 $CD $0D $28
    and  $03                                      ;; 04:7E56 $E6 $03
    jr   .getDirectionToLinkEnd                   ;; 04:7E58 $18 $03

.getDirectionToLink
    call GetEntityDirectionToLink_04              ;; 04:7E5A $CD $55 $6E

.getDirectionToLinkEnd
    ld   e, a                                     ;; 04:7E5D $5F
    ld   d, b                                     ;; 04:7E5E $50
    ld   hl, BouncingBombiteSpeedXPerDirection    ;; 04:7E5F $21 $05 $7E
    add  hl, de                                   ;; 04:7E62 $19
    ld   a, [hl]                                  ;; 04:7E63 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:7E64 $21 $40 $C2
    add  hl, bc                                   ;; 04:7E67 $09
    ld   [hl], a                                  ;; 04:7E68 $77
    ld   hl, BouncingBombiteSpeedYPerDirection    ;; 04:7E69 $21 $09 $7E
    add  hl, de                                   ;; 04:7E6C $19
    ld   a, [hl]                                  ;; 04:7E6D $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:7E6E $21 $50 $C2
    add  hl, bc                                   ;; 04:7E71 $09
    ld   [hl], a                                  ;; 04:7E72 $77
    call GetEntityTransitionCountdown             ;; 04:7E73 $CD $05 $0C
    call GetRandomByte                            ;; 04:7E76 $CD $0D $28
    and  $0F                                      ;; 04:7E79 $E6 $0F
    add  $20                                      ;; 04:7E7B $C6 $20
    ld   [hl], a                                  ;; 04:7E7D $77
    call IncrementEntityState                     ;; 04:7E7E $CD $12 $3B
    ld   [hl], b                                  ;; 04:7E81 $70
    ret                                           ;; 04:7E82 $C9

BouncingBombiteLitHandler::
    call label_3B7B                               ;; 04:7E83 $CD $7B $3B
    call GetEntityTransitionCountdown             ;; 04:7E86 $CD $05 $0C
    jr   z, BombiteExplodeAndDisappear            ;; 04:7E89 $28 $2F

    ld   hl, wEntitiesCollisionsTable             ;; 04:7E8B $21 $A0 $C2
    add  hl, bc                                   ;; 04:7E8E $09
    ld   a, [hl]                                  ;; 04:7E8F $7E
    and  $03                                      ;; 04:7E90 $E6 $03
    jr   nz, .horizontalCollision                 ;; 04:7E92 $20 $07

    ld   a, [hl]                                  ;; 04:7E94 $7E
    and  $0C                                      ;; 04:7E95 $E6 $0C
    jr   nz, .verticalCollision                   ;; 04:7E97 $20 $0C

    jr   .collisionEnd                            ;; 04:7E99 $18 $16

.horizontalCollision
    ld   hl, wEntitiesSpeedXTable                 ;; 04:7E9B $21 $40 $C2
    add  hl, bc                                   ;; 04:7E9E $09
    ld   a, [hl]                                  ;; 04:7E9F $7E
    cpl                                           ;; 04:7EA0 $2F
    inc  a                                        ;; 04:7EA1 $3C
    ld   [hl], a                                  ;; 04:7EA2 $77
    jr   .playBumpJingle                          ;; 04:7EA3 $18 $08

.verticalCollision
    ld   hl, wEntitiesSpeedYTable                 ;; 04:7EA5 $21 $50 $C2
    add  hl, bc                                   ;; 04:7EA8 $09
    ld   a, [hl]                                  ;; 04:7EA9 $7E
    cpl                                           ;; 04:7EAA $2F
    inc  a                                        ;; 04:7EAB $3C
    ld   [hl], a                                  ;; 04:7EAC $77

.playBumpJingle
    ld   a, JINGLE_BUMP                           ;; 04:7EAD $3E $09
    ldh  [hJingle], a                             ;; 04:7EAF $E0 $F2

.collisionEnd
    ldh  a, [hFrameCounter]                       ;; 04:7EB1 $F0 $E7
    rra                                           ;; 04:7EB3 $1F
    rra                                           ;; 04:7EB4 $1F
    and  $01                                      ;; 04:7EB5 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 04:7EB7 $C3 $0C $3B

BombiteExplodeAndDisappear:
    call BombiteExplode                           ;; 04:7EBA $CD $C0 $7E
    jp   ClearEntityStatusBank04                  ;; 04:7EBD $C3 $7A $6D

BombiteExplode::
    ld   a, ENTITY_BOMB                           ;; 04:7EC0 $3E $02
    call SpawnNewEntity_trampoline                ;; 04:7EC2 $CD $86 $3B
    jr   c, .return                               ;; 04:7EC5 $38 $1D

    call PlayBombExplosionSfx                     ;; 04:7EC7 $CD $4B $0C
    ldh  a, [hMultiPurpose0]                      ;; 04:7ECA $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 04:7ECC $21 $00 $C2
    add  hl, de                                   ;; 04:7ECF $19
    ld   [hl], a                                  ;; 04:7ED0 $77
    ldh  a, [hMultiPurpose1]                      ;; 04:7ED1 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:7ED3 $21 $10 $C2
    add  hl, de                                   ;; 04:7ED6 $19
    ld   [hl], a                                  ;; 04:7ED7 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 04:7ED8 $21 $E0 $C2
    add  hl, de                                   ;; 04:7EDB $19
    ld   [hl], $17                                ;; 04:7EDC $36 $17
    ld   hl, wEntitiesPrivateState4Table          ;; 04:7EDE $21 $40 $C4
    add  hl, de                                   ;; 04:7EE1 $19
    ld   [hl], $01                                ;; 04:7EE2 $36 $01

.return
    ret                                           ;; 04:7EE4 $C9
