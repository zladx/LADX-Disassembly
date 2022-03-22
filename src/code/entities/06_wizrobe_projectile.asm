; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
WizrobeProjectileSpriteVariants::
.variant0
    db $6A, OAM_GBC_PAL_3 | OAM_DMG_PAL_0 | OAM_X_FLIP
    db $68, OAM_GBC_PAL_3 | OAM_DMG_PAL_0 | OAM_X_FLIP
.variant1
    db $68, OAM_GBC_PAL_3 | OAM_DMG_PAL_0
    db $6A, OAM_GBC_PAL_3 | OAM_DMG_PAL_0
.variant2
    db $6C, OAM_GBC_PAL_3 | OAM_DMG_PAL_0 | OAM_Y_FLIP
    db $6C, OAM_GBC_PAL_3 | OAM_DMG_PAL_0 | OAM_Y_FLIP | OAM_X_FLIP
.variant3
    db $6C, OAM_GBC_PAL_3 | OAM_DMG_PAL_0
    db $6C, OAM_GBC_PAL_3 | OAM_DMG_PAL_0 | OAM_X_FLIP

WizrobeProjectileEntityHandler::
    ; Flip palette every 8 frame
    ldh  a, [hFrameCounter]                       ; $65F1: $F0 $E7
    rla                                           ; $65F3: $17
    rla                                           ; $65F4: $17
    and  OAM_DMG_PAL_1                            ; $65F5: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $65F7: $E0 $ED

    ld   de, WizrobeProjectileSpriteVariants      ; $65F9: $11 $E1 $65
    call RenderActiveEntitySpritesPair            ; $65FC: $CD $C0 $3B
    call ReturnIfNonInteractive_06                ; $65FF: $CD $C6 $64
    call CheckLinkCollisionWithProjectile_trampoline ; $6602: $CD $4F $3B
    call UpdateEntityPosWithSpeed_06              ; $6605: $CD $41 $65
    call label_3B2E                               ; $6608: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $660B: $21 $A0 $C2
    add  hl, bc                                   ; $660E: $09
    ld   a, [hl]                                  ; $660F: $7E
    and  a                                        ; $6610: $A7
    ret  z                                        ; $6611: $C8

    jp   ClearEntityStatus_06                     ; $6612: $C3 $DB $65
