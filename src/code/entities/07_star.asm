; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
StarSpriteVariants::
.variant0
    db $74, $01
    db $74, $21
.variant1
    db $76, $01
    db $78, $01
.variant2
    db $7A, $01
    db $7A, $21
.variant3
    db $78, $21
    db $76, $21
.variant4
    db $7C, $01
    db $7C, $01

StarEntityHandler::
    ld   de, StarSpriteVariants                   ; $725B: $11 $47 $72
    call RenderActiveEntitySpritesPair            ; $725E: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $7261: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $7264: $CD $C3 $7D
    call DefaultEnemyDamageCollisionHandler_trampoline ; $7267: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $726A: $CD $0A $7E
    call DefaultEntityPhysics_trampoline          ; $726D: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7270: $21 $A0 $C2
    add  hl, bc                                   ; $7273: $09
    ld   a, [hl]                                  ; $7274: $7E
    and  $03                                      ; $7275: $E6 $03
    jr   nz, .jr_7280                             ; $7277: $20 $07

    ld   a, [hl]                                  ; $7279: $7E
    and  $0C                                      ; $727A: $E6 $0C
    jr   nz, jr_007_728A                          ; $727C: $20 $0C

    jr   jr_007_7291                              ; $727E: $18 $11

.jr_7280
    ld   hl, wEntitiesSpeedXTable                 ; $7280: $21 $40 $C2
    add  hl, bc                                   ; $7283: $09
    ld   a, [hl]                                  ; $7284: $7E
    cpl                                           ; $7285: $2F
    inc  a                                        ; $7286: $3C
    ld   [hl], a                                  ; $7287: $77
    jr   jr_007_7291                              ; $7288: $18 $07

jr_007_728A:
    call GetEntitySpeedYAddress                   ; $728A: $CD $05 $40
    ld   a, [hl]                                  ; $728D: $7E
    cpl                                           ; $728E: $2F
    inc  a                                        ; $728F: $3C
    ld   [hl], a                                  ; $7290: $77

jr_007_7291:
    ldh  a, [hFrameCounter]                       ; $7291: $F0 $E7
    rra                                           ; $7293: $1F
    rra                                           ; $7294: $1F
    rra                                           ; $7295: $1F
    and  $03                                      ; $7296: $E6 $03
    jp   SetEntitySpriteVariant                   ; $7298: $C3 $0C $3B
