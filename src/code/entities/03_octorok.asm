OctorokEntityHandler::
    ld   de, OctorokSpriteVariants                ; $57E9: $11 $FB $57
    ld   a, [wGameplayType]                       ; $57EC: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $57EF: $FE $01
    jr   z, .creditsEnd                           ; $57F1: $28 $04

    ld   a, $30                                   ; $57F3: $3E $30
    ldh  [hActiveEntityTilesOffset], a            ; $57F5: $E0 $F5

.creditsEnd
    call AnimateRoamingEnemy                      ; $57F7: $CD $3C $58
    ret                                           ; $57FA: $C9
