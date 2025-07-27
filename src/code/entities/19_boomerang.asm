; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BoomerangSpriteVariants:: ;; 19:4451
.variant0
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_XFLIP
.variant1
    db $A4, OAM_GBC_PAL_4 | OAMF_PAL1
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
.variant2
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_YFLIP
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_YFLIP | OAMF_XFLIP
.variant3
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
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
    ld   a, $08                                   ;; 19:4481 $3E $08
    ld   [wC19E], a                               ;; 19:4483 $EA $9E $C1
    call label_3B7B                               ;; 19:4486 $CD $7B $3B

.jr_4489
    call UpdateEntityPosWithSpeed_19              ;; 19:4489 $CD $B8 $7D
    call label_3B2E                               ;; 19:448C $CD $2E $3B
    call func_019_44CC                            ;; 19:448F $CD $CC $44
    ldh  a, [hActiveEntityState]                  ;; 19:4492 $F0 $F0
    JP_TABLE                                      ;; 19:4494
._00 dw func_019_4499                             ;; 19:4495
._01 dw func_019_44BA                             ;; 19:4497

func_019_4499::
    call GetEntityTransitionCountdown             ;; 19:4499 $CD $05 $0C
    jr   nz, .jr_44A6                             ;; 19:449C $20 $08

    ld   a, $08                                   ;; 19:449E $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 19:44A0 $CD $AA $3B
    jp   IncrementEntityState                     ;; 19:44A3 $C3 $12 $3B

.jr_44A6
    ld   hl, wEntitiesCollisionsTable             ;; 19:44A6 $21 $A0 $C2
    add  hl, bc                                   ;; 19:44A9 $09
    ld   a, [hl]                                  ;; 19:44AA $7E
    and  a                                        ;; 19:44AB $A7
    jr   z, .ret_44B9                             ;; 19:44AC $28 $0B

    call GetEntityTransitionCountdown             ;; 19:44AE $CD $05 $0C
    ld   [hl], b                                  ;; 19:44B1 $70
    call func_019_45A3                            ;; 19:44B2 $CD $A3 $45
    ld   a, JINGLE_SWORD_POKING                   ;; 19:44B5 $3E $07
    ldh  [hJingle], a                             ;; 19:44B7 $E0 $F2

.ret_44B9
    ret                                           ;; 19:44B9 $C9

func_019_44BA::
    ldh  a, [hFrameCounter]                       ;; 19:44BA $F0 $E7
    and  $03                                      ;; 19:44BC $E6 $03
    jr   nz, .jr_44C5                             ;; 19:44BE $20 $05

    ld   a, $20                                   ;; 19:44C0 $3E $20
    call ApplyVectorTowardsLink_trampoline        ;; 19:44C2 $CD $AA $3B

.jr_44C5
    call label_3B44                               ;; 19:44C5 $CD $44 $3B
    ret  nc                                       ;; 19:44C8 $D0

    jp   ClearEntityStatus_19                     ;; 19:44C9 $C3 $61 $7E

func_019_44CC::
    ld   a, [wIsIndoor]                           ;; 19:44CC $FA $A5 $DB
    and  a                                        ;; 19:44CF $A7
    ret  nz                                       ;; 19:44D0 $C0

.jr_44D1
    ldh  a, [hObjectUnderEntity]                  ;; 19:44D1 $F0 $AF
    cp   $D3                                      ;; 19:44D3 $FE $D3
    jr   z, .jr_44DA                              ;; 19:44D5 $28 $03

    cp   $5C                                      ;; 19:44D7 $FE $5C
    ret  nz                                       ;; 19:44D9 $C0

.jr_44DA
    ld   hl, wEntitiesCollisionsTable             ;; 19:44DA $21 $A0 $C2
    add  hl, bc                                   ;; 19:44DD $09
    ld   [hl], b                                  ;; 19:44DE $70
    ldh  a, [hDungeonFloorTile]                   ;; 19:44DF $F0 $E9
    ld   e, a                                     ;; 19:44E1 $5F
    ld   d, b                                     ;; 19:44E2 $50
    call func_014_5526_trampoline                 ;; 19:44E3 $CD $78 $21
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
