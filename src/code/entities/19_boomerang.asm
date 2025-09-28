; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BoomerangSpriteVariants:: ;; 19:4451
.variant0
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_XFLIP
.variant1
    db $A4, OAM_GBC_PAL_4 | OAMF_PAL1
    db $FF, $FF
.variant2
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_YFLIP
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_YFLIP | OAMF_XFLIP
.variant3
    db $FF, $FF
    db $A4, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_XFLIP

BoomerangEntityHandler::
    ; wActiveProjectileCount = 1
    ld   a, $01                                   ;; 19:4461 $3E $01
    ld   [wActiveProjectileCount], a              ;; 19:4463 $EA $4D $C1

    ld   de, BoomerangSpriteVariants              ;; 19:4466 $11 $51 $44
    call RenderActiveEntitySpritesPair            ;; 19:4469 $CD $C0 $3B
    call ReturnIfNonInteractive_19                ;; 19:446C $CD $3D $7D
    call PlayBoomerangSfx_trampoline              ;; 19:446F $CD $F8 $29
    ldh  a, [hFrameCounter]                       ;; 19:4472 $F0 $E7
    and  $03                                      ;; 19:4474 $E6 $03
    jr   nz, .jr_4481                             ;; 19:4476 $20 $09

    ld   hl, wEntitiesSpriteVariantTable          ;; 19:4478 $21 $B0 $C3
    add  hl, bc                                   ;; 19:447B $09
    ld   a, [hl]                                  ;; 19:447C $7E
    inc  a                                        ;; 19:447D $3C
    and  $03                                      ;; 19:447E $E6 $03
    ld   [hl], a                                  ;; 19:4480 $77

.jr_4481
    ld   a, DAMAGE_TYPE_BOOMERANG                 ;; 19:4481 $3E $08
    ld   [wAttackDamageType], a                   ;; 19:4483 $EA $9E $C1
    call label_3B7B                               ;; 19:4486 $CD $7B $3B

.jr_4489
    call UpdateEntityPosWithSpeed_19              ;; 19:4489 $CD $B8 $7D
    call label_3B2E                               ;; 19:448C $CD $2E $3B
    call BoomerangDestroyBushIfNeeded             ;; 19:448F $CD $CC $44
    ldh  a, [hActiveEntityState]                  ;; 19:4492 $F0 $F0
    JP_TABLE                                      ;; 19:4494
._00 dw BoomerangGoingHandler                     ;; 19:4495
._01 dw BoomerangComingHandler                    ;; 19:4497

BoomerangGoingHandler::
    call GetEntityTransitionCountdown             ;; 19:4499 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 19:449C $20 $08

    ld   a, $08                                   ;; 19:449E $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 19:44A0 $CD $AA $3B
    jp   IncrementEntityState                     ;; 19:44A3 $C3 $12 $3B

.skipIncrementState
    ld   hl, wEntitiesCollisionsTable             ;; 19:44A6 $21 $A0 $C2
    add  hl, bc                                   ;; 19:44A9 $09
    ld   a, [hl]                                  ;; 19:44AA $7E
    and  a                                        ;; 19:44AB $A7
    jr   z, .return                               ;; 19:44AC $28 $0B

    call GetEntityTransitionCountdown             ;; 19:44AE $CD $05 $0C
    ld   [hl], b                                  ;; 19:44B1 $70
    call func_019_45A3                            ;; 19:44B2 $CD $A3 $45
    ld   a, JINGLE_SWORD_POKING                   ;; 19:44B5 $3E $07
    ldh  [hJingle], a                             ;; 19:44B7 $E0 $F2

.return
    ret                                           ;; 19:44B9 $C9

BoomerangComingHandler::
    ldh  a, [hFrameCounter]                       ;; 19:44BA $F0 $E7
    and  $03                                      ;; 19:44BC $E6 $03
    jr   nz, .skipUpdateSpeed                     ;; 19:44BE $20 $05

    ld   a, $20                                   ;; 19:44C0 $3E $20
    call ApplyVectorTowardsLink_trampoline        ;; 19:44C2 $CD $AA $3B

.skipUpdateSpeed
    ; If the returning boomerang touches Link, unload.
    call label_3B44                               ;; 19:44C5 $CD $44 $3B
    ret  nc                                       ;; 19:44C8 $D0

    jp   ClearEntityStatus_19                     ;; 19:44C9 $C3 $61 $7E

BoomerangDestroyBushIfNeeded::
    ld   a, [wIsIndoor]                           ;; 19:44CC $FA $A5 $DB
    and  a                                        ;; 19:44CF $A7
    ret  nz                                       ;; 19:44D0 $C0

    ldh  a, [hObjectUnderEntity]                  ;; 19:44D1 $F0 $AF
    cp   OBJECT_BUSH_GROUND_STAIRS                ;; 19:44D3 $FE $D3
    jr   z, .destroyBush                          ;; 19:44D5 $28 $03

    cp   OBJECT_BUSH                              ;; 19:44D7 $FE $5C
    ret  nz                                       ;; 19:44D9 $C0

.destroyBush
    ld   hl, wEntitiesCollisionsTable             ;; 19:44DA $21 $A0 $C2
    add  hl, bc                                   ;; 19:44DD $09
    ld   [hl], b                                  ;; 19:44DE $70
    ldh  a, [hIndexOfObjectBelowLink]             ;; 19:44DF $F0 $E9
    ld   e, a                                     ;; 19:44E1 $5F
    ld   d, b                                     ;; 19:44E2 $50
    call RevealObjectUnderObject_trampoline       ;; 19:44E3 $CD $78 $21
    ldh  a, [hIntersectedObjectLeft]              ;; 19:44E6 $F0 $CE
    add  $08                                      ;; 19:44E8 $C6 $08
    ldh  [hMultiPurpose0], a                      ;; 19:44EA $E0 $D7
    ldh  a, [hIntersectedObjectTop]               ;; 19:44EC $F0 $CD
    add  $10                                      ;; 19:44EE $C6 $10
    ldh  [hMultiPurpose1], a                      ;; 19:44F0 $E0 $D8
    ld   a, TRANSCIENT_VFX_SMOKE                  ;; 19:44F2 $3E $08
    call AddTranscientVfx                         ;; 19:44F4 $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ;; 19:44F7 $3E $13
    ldh  [hNoiseSfx], a                           ;; 19:44F9 $E0 $F4
    ret                                           ;; 19:44FB $C9
