ArrowEntityHandler::
    ; Increment the active projectiles count
    ld   hl, wActiveProjectileCount               ;; 03:6A34 $21 $4D $C1
    inc  [hl]                                     ;; 03:6A37 $34

    ; If hActiveEntityState == 1…
    ldh  a, [hActiveEntityState]                  ;; 03:6A38 $F0 $F0
    and  a                                        ;; 03:6A3A $A7
    ; call BombArrowHandler and return
    jr   nz, BombArrowHandler                     ;; 03:6A3B $20 $33

    ; If GetEntityTransitionCountdown != 0…
    call GetEntityTransitionCountdown             ;; 03:6A3D $CD $05 $0C
    ; call ArrowRenderAndMove and return
    jp   nz, ArrowRenderAndMove                   ;; 03:6A40 $C2 $D4 $6A

    ;
    ; hActiveEntityState == 0 and GetEntityTransitionCountdown == 0
    ;

    ld   a, DAMAGE_TYPE_ARROW                     ;; 03:6A43 $3E $05
    ld   [wAttackDamageType], a                   ;; 03:6A45 $EA $9E $C1
    call func_003_75A2                            ;; 03:6A48 $CD $A2 $75
    call ArrowRenderAndMove                       ;; 03:6A4B $CD $D4 $6A

    ;
    ; Allow shooting the Dungeon 8 statue in the eye
    ;

    ; If hActiveEntitySpriteVariant == 2…
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:6A4E $F0 $F1
    cp   DIRECTION_UP                             ;; 03:6A50 $FE $02
    ret  nz                                       ;; 03:6A52 $C0
    ; and the event trigger is TRIGGER_SHOOT_STATUE_EYE…
    ld   a, [wRoomEvent]                          ;; 03:6A53 $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ;; 03:6A56 $E6 $1F
    cp   TRIGGER_SHOOT_STATUE_EYE                 ;; 03:6A58 $FE $0F
    ret  nz                                       ;; 03:6A5A $C0
    ; and hObjectUnderEntity == OBJECT_ONE_EYED_STATUE…
    ldh  a, [hObjectUnderEntity]                  ;; 03:6A5B $F0 $AF
    cp   OBJECT_ONE_EYED_STATUE                   ;; 03:6A5D $FE $C0
    ret  nz                                       ;; 03:6A5F $C0
    ; call MarkTriggerAsResolved, and clear entity
    call MarkTriggerAsResolved                    ;; 03:6A60 $CD $60 $0C
    jp   UnloadEntityAndReturn                    ;; 03:6A63 $C3 $8D $3F

BombArrowBombSprite::
    db   $80, OAM_GBC_PAL_5 | OAMF_PAL1

BombArrowBombXOffsetPerDirection::
    db   +4, -4, 0, 0

BombArrowBombYOffsetPerDirection::
    db   -2, -2, -6, +4

BombArrowHandler::
    call GetEntityTransitionCountdown             ;; 03:6A70 $CD $05 $0C
    jr   z, .beforeExploding                      ;; 03:6A73 $28 $21

    ld   a, ENTITY_BOMB                           ;; 03:6A75 $3E $02
    call SpawnNewEntity                           ;; 03:6A77 $CD $CA $64
    jr   c, .unloadAndReturn                      ;; 03:6A7A $38 $17

    ldh  a, [hMultiPurpose0]                      ;; 03:6A7C $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 03:6A7E $21 $00 $C2
    add  hl, de                                   ;; 03:6A81 $19
    ld   [hl], a                                  ;; 03:6A82 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:6A83 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 03:6A85 $21 $10 $C2
    add  hl, de                                   ;; 03:6A88 $19
    ld   [hl], a                                  ;; 03:6A89 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 03:6A8A $21 $E0 $C2
    add  hl, de                                   ;; 03:6A8D $19
    ld   [hl], $17                                ;; 03:6A8E $36 $17
    call PlayBombExplosionSfx                     ;; 03:6A90 $CD $4B $0C

.unloadAndReturn
    jp   UnloadEntityAndReturn                    ;; 03:6A93 $C3 $8D $3F

.beforeExploding
    ; Render the bomb arrow's bomb.
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:6A96 $F0 $F1
    push af                                       ;; 03:6A98 $F5
    ld   e, a                                     ;; 03:6A99 $5F
    ld   d, b                                     ;; 03:6A9A $50
    xor  a                                        ;; 03:6A9B $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:6A9C $E0 $F1
    ld   hl, BombArrowBombXOffsetPerDirection     ;; 03:6A9E $21 $68 $6A
    add  hl, de                                   ;; 03:6AA1 $19
    ldh  a, [hActiveEntityPosX]                   ;; 03:6AA2 $F0 $EE
    add  [hl]                                     ;; 03:6AA4 $86
    ldh  [hActiveEntityPosX], a                   ;; 03:6AA5 $E0 $EE
    ld   hl, BombArrowBombYOffsetPerDirection     ;; 03:6AA7 $21 $6C $6A
    add  hl, de                                   ;; 03:6AAA $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 03:6AAB $F0 $EC
    add  [hl]                                     ;; 03:6AAD $86
    ldh  [hActiveEntityVisualPosY], a             ;; 03:6AAE $E0 $EC
    ld   de, BombArrowBombSprite                  ;; 03:6AB0 $11 $66 $6A
    call RenderActiveEntitySprite                 ;; 03:6AB3 $CD $77 $3C
    call CopyEntityPositionToActivePosition       ;; 03:6AB6 $CD $8A $3D
    pop  af                                       ;; 03:6AB9 $F1
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:6ABA $E0 $F1

    ; Render the arrow itself.
    ld   de, EntityArrowSpriteVariants            ;; 03:6ABC $11 $C6 $6B
    call RenderActiveEntitySpritesPair            ;; 03:6ABF $CD $C0 $3B

    ; Deal (no) damage to other entities before exploding.
    ld   a, DAMAGE_TYPE_BOMB_ARROW                ;; 03:6AC2 $3E $0C
    ld   [wAttackDamageType], a                   ;; 03:6AC4 $EA $9E $C1
    call func_003_75A2                            ;; 03:6AC7 $CD $A2 $75
    jr   ArrowRenderAndMove.skipRendering         ;; 03:6ACA $18 $0E

MoblinArrowEntityHandler::
    call GetEntityTransitionCountdown             ;; 03:6ACC $CD $05 $0C
    jr   nz, ArrowRenderAndMove                   ;; 03:6ACF $20 $03

    call CheckLinkCollisionWithProjectile         ;; 03:6AD1 $CD $DE $6B
    ; fallthrough

ArrowRenderAndMove::
    ld   de, EntityArrowSpriteVariants            ;; 03:6AD4 $11 $C6 $6B

.skipLoadingSprites
    call RenderActiveEntitySpritesPair            ;; 03:6AD7 $CD $C0 $3B

.skipRendering
    call ReturnIfNonInteractive_03                ;; 03:6ADA $CD $78 $7F
    call GetEntityTransitionCountdown             ;; 03:6ADD $CD $05 $0C
    jr   nz, ArrowRockAfterHittingWall            ;; 03:6AE0 $20 $6A

    call UpdateEntityPosWithSpeed_03              ;; 03:6AE2 $CD $25 $7F
    call ApplySwordIntersectionWithObjects        ;; 03:6AE5 $CD $AB $7C
    ld   hl, wEntitiesCollisionsTable             ;; 03:6AE8 $21 $A0 $C2
    add  hl, bc                                   ;; 03:6AEB $09
    ld   a, [hl]                                  ;; 03:6AEC $7E
    and  a                                        ;; 03:6AED $A7
    jr   z, EntityBounceOffWallX.return           ;; 03:6AEE $28 $52

    call GetEntityTransitionCountdown             ;; 03:6AF0 $CD $05 $0C

    ldh  a, [hActiveEntityType]                   ;; 03:6AF3 $F0 $EB
    cp   ENTITY_MAGIC_ROD_FIREBALL                ;; 03:6AF5 $FE $04
    jr   nz, .fireballEnd                         ;; 03:6AF7 $20 $06

    call GetEntityPrivateCountdown1               ;; 03:6AF9 $CD $00 $0C
    ld   [hl], $30                                ;; 03:6AFC $36 $30
    ret                                           ;; 03:6AFE $C9
.fireballEnd

    ld   [hl], $18                                ;; 03:6AFF $36 $18
    ld   hl, wEntitiesSpeedZTable                 ;; 03:6B01 $21 $20 $C3
    add  hl, bc                                   ;; 03:6B04 $09
    ld   [hl], $10                                ;; 03:6B05 $36 $10
    ld   hl, wEntitiesCollisionsTable             ;; 03:6B07 $21 $A0 $C2
    add  hl, bc                                   ;; 03:6B0A $09
    ld   a, [hl]                                  ;; 03:6B0B $7E
    inc  a                                        ;; 03:6B0C $3C
    jr   z, .skipSound                            ;; 03:6B0D $28 $04

    ; Skip making a poking sound if collided with shield.
    ld   a, JINGLE_SWORD_POKING                   ;; 03:6B0F $3E $07
    ldh  [hJingle], a                             ;; 03:6B11 $E0 $F2

.skipSound
    call AlertSwordMoblins                        ;; 03:6B13 $CD $50 $0C

    ldh  a, [hActiveEntityType]                   ;; 03:6B16 $F0 $EB
    cp   ENTITY_ARROW                             ;; 03:6B18 $FE $00
    jr   nz, .enemyProjectileBounce               ;; 03:6B1A $20 $15

    ; Player arrows bounce more off walls than Moblin arrows or Octorok rocks.
    call .playerArrowBounceY                      ;; 03:6B1C $CD $2C $6B
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6B1F $21 $40 $C2

.playerArrowBounce
    add  hl, bc                                   ;; 03:6B22 $09
    ld   a, [hl]                                  ;; 03:6B23 $7E
    cpl                                           ;; 03:6B24 $2F
    inc  a                                        ;; 03:6B25 $3C
    sra  a                                        ;; 03:6B26 $CB $2F
    sra  a                                        ;; 03:6B28 $CB $2F
    ld   [hl], a                                  ;; 03:6B2A $77
    ret                                           ;; 03:6B2B $C9

.playerArrowBounceY
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6B2C $21 $50 $C2
    jr   .playerArrowBounce                       ;; 03:6B2F $18 $F1

.enemyProjectileBounce
    call EntityBounceOffWallY                     ;; 03:6B31 $CD $43 $6BBo
    ; fallthrough

EntityBounceOffWallX::
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6B34 $21 $40 $C2

.updateSpeed
    add  hl, bc                                   ;; 03:6B37 $09
    ld   a, [hl]                                  ;; 03:6B38 $7E
    cpl                                           ;; 03:6B39 $2F
    inc  a                                        ;; 03:6B3A $3C
    sra  a                                        ;; 03:6B3B $CB $2F
    sra  a                                        ;; 03:6B3D $CB $2F
    sra  a                                        ;; 03:6B3F $CB $2F
    ld   [hl], a                                  ;; 03:6B41 $77

.return
    ret                                           ;; 03:6B42 $C9

EntityBounceOffWallY::
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6B43 $21 $50 $C2
    jr   EntityBounceOffWallX.updateSpeed         ;; 03:6B46 $18 $EF

ArrowSpinningSpriteVariantFrames::
    db   DIRECTION_RIGHT, DIRECTION_DOWN, DIRECTION_LEFT, DIRECTION_UP

ArrowRockAfterHittingWall:
    cp   $01                                      ;; 03:6B4C $FE $01
IF __OPTIMIZATIONS_3__
    jp   z, UnloadEntityAndReturn
ELSE
    jr   nz, .unloadEnd                             ;; 03:6B4E $20 $03
    jp   UnloadEntityAndReturn                    ;; 03:6B50 $C3 $8D $3F
ENDC

.unloadEnd
    ; Octorok rocks don't spin after hitting a wall, only arrows do.
    ldh  a, [hActiveEntityType]                   ;; 03:6B53 $F0 $EB
    cp   ENTITY_OCTOROK_ROCK                      ;; 03:6B55 $FE $0A
    jr   z, .spinningEnd                          ;; 03:6B57 $28 $15

    call GetEntityTransitionCountdown             ;; 03:6B59 $CD $05 $0C
    srl  a                                        ;; 03:6B5C $CB $3F
    srl  a                                        ;; 03:6B5E $CB $3F
    srl  a                                        ;; 03:6B60 $CB $3F
    and  $03                                      ;; 03:6B62 $E6 $03
    ld   e, a                                     ;; 03:6B64 $5F
    ld   d, b                                     ;; 03:6B65 $50
    ld   hl, ArrowSpinningSpriteVariantFrames     ;; 03:6B66 $21 $48 $6B
    add  hl, de                                   ;; 03:6B69 $19
    ld   a, [hl]                                  ;; 03:6B6A $7E
    call SetEntitySpriteVariant                   ;; 03:6B6B $CD $0C $3B
.spinningEnd

    call UpdateEntityPosWithSpeed_03              ;; 03:6B6E $CD $25 $7F
    jr   func_003_6B7B                            ;; 03:6B71 $18 $08
