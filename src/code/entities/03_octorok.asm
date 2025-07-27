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
