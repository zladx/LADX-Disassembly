; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Urchin2SpriteVariants::
.variant0
    db $5C, $03
    db $5E, $03
.variant1
    db $5E, $23
    db $5C, $23
.variant2
    db $5E, $63
    db $5C, $63
.variant3
    db $5C, $43
    db $5E, $43

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Urchin1SpriteVariants::
.variant0
    db $2C, $03
    db $2E, $03
.variant1
    db $2E, $23
    db $2C, $23
.variant2
    db $2E, $63
    db $2C, $63
.variant3
    db $2C, $43
    db $2E, $43

Data_015_73A3::
    db   $FD, $03, $00, $00

Data_015_73A7::
    db   $00, $00, $03, $FD

UrchinEntityHandler::
    ld   de, Urchin2SpriteVariants                ; $73AB: $11 $83 $73
    ld   a, [wGameplayType]                       ; $73AE: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $73B1: $FE $01
    jr   nz, .render                              ; $73B3: $20 $03

    ld   de, Urchin1SpriteVariants                ; $73B5: $11 $93 $73

.render
    call RenderActiveEntitySpritesPair            ; $73B8: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $73BB: $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ; $73BE: $CD $3E $7B
    ldh  a, [hFrameCounter]                       ; $73C1: $F0 $E7
    rra                                           ; $73C3: $1F
    rra                                           ; $73C4: $1F
    rra                                           ; $73C5: $1F
    rra                                           ; $73C6: $1F
    and  $03                                      ; $73C7: $E6 $03
    call SetEntitySpriteVariant                   ; $73C9: $CD $0C $3B
    call func_015_7C0A                            ; $73CC: $CD $0A $7C
    ld   hl, wEntitiesDirectionTable              ; $73CF: $21 $80 $C3
    add  hl, bc                                   ; $73D2: $09
    ld   [hl], e                                  ; $73D3: $73
    ld   hl, wEntitiesPhysicsFlagsTable           ; $73D4: $21 $40 $C3
    add  hl, bc                                   ; $73D7: $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $73D8: $CB $BE
    ld   a, [wIsUsingShield]                      ; $73DA: $FA $5B $C1
    and  a                                        ; $73DD: $A7
    jr   z, .jr_73E9                              ; $73DE: $28 $09

    ldh  a, [hLinkDirection]                      ; $73E0: $F0 $9E
    xor  $01                                      ; $73E2: $EE $01
    cp   e                                        ; $73E4: $BB
    jr   nz, .jr_73E9                             ; $73E5: $20 $02

    set  7, [hl]                                  ; $73E7: $CB $FE

.jr_73E9
    call CheckLinkCollisionWithEnemy_trampoline   ; $73E9: $CD $5A $3B
    jr   nc, jr_015_7428                          ; $73EC: $30 $3A

    call CopyLinkFinalPositionToPosition          ; $73EE: $CD $BE $0C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $73F1: $21 $40 $C3
    add  hl, bc                                   ; $73F4: $09
    ld   a, [hl]                                  ; $73F5: $7E
    and  ENTITY_PHYSICS_HARMLESS                  ; $73F6: $E6 $80
    ret  z                                        ; $73F8: $C8

    ld   hl, wEntitiesDirectionTable              ; $73F9: $21 $80 $C3
    add  hl, bc                                   ; $73FC: $09
    ld   e, [hl]                                  ; $73FD: $5E
    ld   d, b                                     ; $73FE: $50
    ld   hl, Data_015_73A3                        ; $73FF: $21 $A3 $73
    add  hl, de                                   ; $7402: $19
    ld   a, [hl]                                  ; $7403: $7E
    ld   hl, wEntitiesVelocityXTable              ; $7404: $21 $40 $C2
    add  hl, bc                                   ; $7407: $09

.jr_7408
    ld   [hl], a                                  ; $7408: $77
    ld   hl, Data_015_73A7                        ; $7409: $21 $A7 $73
    add  hl, de                                   ; $740C: $19
    ld   a, [hl]                                  ; $740D: $7E
    ld   hl, wEntitiesVelocityYTable              ; $740E: $21 $50 $C2
    add  hl, bc                                   ; $7411: $09
    ld   [hl], a                                  ; $7412: $77
    ld   a, JINGLE_URCHIN_PUSH                    ; $7413: $3E $3E
    ldh  [hJingle], a                             ; $7415: $E0 $F2
    call UpdateEntityPosWithVelocity_15           ; $7417: $CD $88 $7B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $741A: $21 $10 $C4
    add  hl, bc                                   ; $741D: $09
    ld   [hl], $03                                ; $741E: $36 $03
    call DefaultEntityPhysics_trampoline          ; $7420: $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7423: $21 $10 $C4
    add  hl, bc                                   ; $7426: $09
    ld   [hl], b                                  ; $7427: $70

jr_015_7428:
    ld   a, [wC16A]                               ; $7428: $FA $6A $C1
    and  a                                        ; $742B: $A7
    jr   nz, .jr_7433                             ; $742C: $20 $05

    ld   a, [wIsUsingShield]                      ; $742E: $FA $5B $C1
    and  a                                        ; $7431: $A7
    ret  nz                                       ; $7432: $C0

.jr_7433
    jp   label_3B70                               ; $7433: $C3 $70 $3B
