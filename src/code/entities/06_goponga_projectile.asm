GopongaFlowerProjectileSpriteList::
.variant0
    db $1E, $02
    db $1E, $62
.variant1
    db $1E, $42
    db $1E, $22
.variant2
    db $32, $00
    db $32, $20
.variant3
    db $30, $00
    db $30, $20

GopongaProjectileEntityHandler::
    ; Make the projectile invicible, by setting its health
    ; to a large number every frame.
    ld   hl, wEntitiesHealthTable                 ; $639F: $21 $60 $C3
    add  hl, bc                                   ; $63A2: $09
    ld   [hl], $30                                ; $63A3: $36 $30

    ; If entity's private state 1 is != 0…
    ld   hl, wEntitiesPrivateState1Table          ; $63A5: $21 $B0 $C2
    add  hl, bc                                   ; $63A8: $09
    ld   a, [hl]                                  ; $63A9: $7E
    and  a                                        ; $63AA: $A7
    jr   z, .flashEnd                             ; $63AB: $28 $08
    ; Flip palette every 8 frames.
    ; (used during the Final Nightmare battle)
    ldh  a, [hFrameCounter]                       ; $63AD: $F0 $E7
    rla                                           ; $63AF: $17
    rla                                           ; $63B0: $17
    and  OAMF_PAL1                                ; $63B1: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $63B3: $E0 $ED
.flashEnd

    ; Render the projectile
    ld   de, GopongaFlowerProjectileSpriteList    ; $63B5: $11 $8F $63
    call RenderActiveEntitySpritesPair            ; $63B8: $CD $C0 $3B

    call GetEntityTransitionCountdown             ; $63BB: $CD $05 $0C
    jr   z, .jr_63CE                              ; $63BE: $28 $0E

    dec  a                                        ; $63C0: $3D
    jp   z, ClearEntityStatus_06                  ; $63C1: $CA $DB $65

    rra                                           ; $63C4: $1F
    rra                                           ; $63C5: $1F
    rra                                           ; $63C6: $1F
    and  $01                                      ; $63C7: $E6 $01
    add  $02                                      ; $63C9: $C6 $02
    jp   SetEntitySpriteVariant                   ; $63CB: $C3 $0C $3B

.jr_63CE

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $63CE: $21 $10 $C4
    add  hl, bc                                   ; $63D1: $09
    ld   a, [hl]                                  ; $63D2: $7E
    cp   $02                                      ; $63D3: $FE $02
    jr   c, .jr_63DD                              ; $63D5: $38 $06

    call GetEntityTransitionCountdown             ; $63D7: $CD $05 $0C
    ld   [hl], $10                                ; $63DA: $36 $10
    ret                                           ; $63DC: $C9

.jr_63DD
    ld   [hl], b                                  ; $63DD: $70
    call ReturnIfNonInteractive_06                ; $63DE: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $63E1: $F0 $E7
    rra                                           ; $63E3: $1F
    rra                                           ; $63E4: $1F
    rra                                           ; $63E5: $1F
    and  $01                                      ; $63E6: $E6 $01
    call SetEntitySpriteVariant                   ; $63E8: $CD $0C $3B
    call label_3B39                               ; $63EB: $CD $39 $3B
    call UpdateEntityPosWithSpeed_06              ; $63EE: $CD $41 $65
    jp   func_006_5E54                            ; $63F1: $C3 $54 $5E
