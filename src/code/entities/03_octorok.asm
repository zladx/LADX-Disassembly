OctorokEntityHandler::
    ld   de, OctorokSpriteVariants                ;; 03:57E9 $11 $FB $57
    ld   a, [wGameplayType]                       ;; 03:57EC $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 03:57EF $FE $01
    jr   z, .creditsEnd                           ;; 03:57F1 $28 $04

    ld   a, $30                                   ;; 03:57F3 $3E $30
    ldh  [hActiveEntityTilesOffset], a            ;; 03:57F5 $E0 $F5

.creditsEnd
    call AnimateRoamingEnemy                      ;; 03:57F7 $CD $3C $58
    ret                                           ;; 03:57FA $C9

OctorokSpriteVariants::
; Down
.variant0
    db   $30, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $30, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db   $32, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $32, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
; Up
.variant2
    db   $30, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db   $30, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant3
    db   $32, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db   $32, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
; Left
.variant4
    db   $34, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $36, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db   $38, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $3A, OAM_GBC_PAL_2 | OAMF_PAL0
; Right
.variant6
    db   $36, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $34, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db   $3A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $38, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
