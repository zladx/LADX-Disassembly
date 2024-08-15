; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
WizrobeProjectileSpriteVariants::
.variant0
    db $6A, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $68, OAM_GBC_PAL_3 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_3 | OAMF_PAL0
.variant2
    db $6C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP
    db $6C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant3
    db $6C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

WizrobeProjectileEntityHandler::
    ; Flip palette every 8 frame
    ldh  a, [hFrameCounter]                       ;; 06:65F1 $F0 $E7
    rla                                           ;; 06:65F3 $17
    rla                                           ;; 06:65F4 $17
    and  OAMF_PAL1                                ;; 06:65F5 $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ;; 06:65F7 $E0 $ED

    ld   de, WizrobeProjectileSpriteVariants      ;; 06:65F9 $11 $E1 $65
    call RenderActiveEntitySpritesPair            ;; 06:65FC $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:65FF $CD $C6 $64
    call CheckLinkCollisionWithProjectile_trampoline ;; 06:6602 $CD $4F $3B
    call UpdateEntityPosWithSpeed_06              ;; 06:6605 $CD $41 $65
    call label_3B2E                               ;; 06:6608 $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ;; 06:660B $21 $A0 $C2
    add  hl, bc                                   ;; 06:660E $09
    ld   a, [hl]                                  ;; 06:660F $7E
    and  a                                        ;; 06:6610 $A7
    ret  z                                        ;; 06:6611 $C8

    jp   ClearEntityStatus_06                     ;; 06:6612 $C3 $DB $65
