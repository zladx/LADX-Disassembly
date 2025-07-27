; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
StarSpriteVariants::
.variant0
    db $74, OAM_GBC_PAL_1 | OAMF_PAL0
    db $74, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0
.variant2
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $76, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0

StarEntityHandler::
    ld   de, StarSpriteVariants                   ;; 07:725B $11 $47 $72
    call RenderActiveEntitySpritesPair            ;; 07:725E $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:7261 $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ;; 07:7264 $CD $C3 $7D
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:7267 $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:726A $CD $0A $7E
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:726D $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 07:7270 $21 $A0 $C2
    add  hl, bc                                   ;; 07:7273 $09
    ld   a, [hl]                                  ;; 07:7274 $7E
    and  $03                                      ;; 07:7275 $E6 $03
    jr   nz, .horizontalCollision                 ;; 07:7277 $20 $07

    ld   a, [hl]                                  ;; 07:7279 $7E
    and  $0C                                      ;; 07:727A $E6 $0C
    jr   nz, .verticalCollision                   ;; 07:727C $20 $0C

    jr   .collisionEnd                            ;; 07:727E $18 $11

.horizontalCollision
    ld   hl, wEntitiesSpeedXTable                 ;; 07:7280 $21 $40 $C2
    add  hl, bc                                   ;; 07:7283 $09
    ld   a, [hl]                                  ;; 07:7284 $7E
    cpl                                           ;; 07:7285 $2F
    inc  a                                        ;; 07:7286 $3C
    ld   [hl], a                                  ;; 07:7287 $77
    jr   .collisionEnd                            ;; 07:7288 $18 $07

.verticalCollision
    call GetEntitySpeedYAddress                   ;; 07:728A $CD $05 $40
    ld   a, [hl]                                  ;; 07:728D $7E
    cpl                                           ;; 07:728E $2F
    inc  a                                        ;; 07:728F $3C
    ld   [hl], a                                  ;; 07:7290 $77

.collisionEnd
    ldh  a, [hFrameCounter]                       ;; 07:7291 $F0 $E7
    rra                                           ;; 07:7293 $1F
    rra                                           ;; 07:7294 $1F
    rra                                           ;; 07:7295 $1F
    and  $03                                      ;; 07:7296 $E6 $03
    jp   SetEntitySpriteVariant                   ;; 07:7298 $C3 $0C $3B
