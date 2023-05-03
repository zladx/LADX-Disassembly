; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HorsePieceSpriteVariants::
.variant0 ; Upright sprite
    db $60, $03
    db $62, $03
.variant1 ; Laying on the floor
    db $64, $03
    db $66, $03
.variant2 ; Upside down tumbling
    db $62, $63
    db $60, $63
.variant3 ; Upside down, on floor sprite
    db $66, $63
    db $64, $63
.variant4 ; Laying on the floor, flipped
    db $66, $23
    db $64, $23

HorsePieceEntityHandler::
    ld   hl, wEntitiesLoadOrderTable              ; $75F2: $21 $60 $C4
    add  hl, bc                                   ; $75F5: $09
    ld   a, [hl]                                  ; $75F6: $7E
    and  a                                        ; $75F7: $A7
    jr   z, .firstHead                            ; $75F8: $28 $04
    ; Store our entity index in D201 if we are the 2nd horse head
    ld   a, c                                     ; $75FA: $79
    ld   [wD201], a                               ; $75FB: $EA $01 $D2
.firstHead
    ld   de, HorsePieceSpriteVariants             ; $75FE: $11 $DE $75
    call RenderActiveEntitySpritesPair            ; $7601: $CD $C0 $3B
    ; Note: ReturnIfNonInteractive_07 also exits this entity if we are being carried
    call ReturnIfNonInteractive_07                ; $7604: $CD $96 $7D
    call UpdateEntityPosWithSpeed_07              ; $7607: $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ; $760A: $CD $43 $7E
    ; Apply collision physics
    call label_3B23                               ; $760D: $CD $23 $3B
    ; Add gravity.
    ld   hl, wEntitiesSpeedZTable                 ; $7610: $21 $20 $C3
    add  hl, bc                                   ; $7613: $09
    dec  [hl]                                     ; $7614: $35
    dec  [hl]                                     ; $7615: $35
    ; Check if we are on the floor, and then bounce with half Z speed
    ld   hl, wEntitiesPosZTable                   ; $7616: $21 $10 $C3
    add  hl, bc                                   ; $7619: $09
    ld   a, [hl]                                  ; $761A: $7E
    ldh  [hMultiPurposeG], a                      ; $761B: $E0 $E8
    dec  a                                        ; $761D: $3D
    and  $80                                      ; $761E: $E6 $80
    jr   z, .noBounce                             ; $7620: $28 $11

    ld   [hl], b                                  ; $7622: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7623: $21 $20 $C3
    add  hl, bc                                   ; $7626: $09
    ld   a, [hl]                                  ; $7627: $7E
    ldh  [hMultiPurposeH], a                      ; $7628: $E0 $E9
    sra  a                                        ; $762A: $CB $2F
    cpl                                           ; $762C: $2F
    ; If new bounce speed is less then 7, set the speed to zero
    cp   $07                                      ; $762D: $FE $07
    jr   nc, .doBounce                            ; $762F: $30 $01
    xor  a                                        ; $7631: $AF
.doBounce
    ld   [hl], a                                  ; $7632: $77

.noBounce
    ldh  a, [hActiveEntityState]                  ; $7633: $F0 $F0
    JP_TABLE                                      ; $7635
._00 dw HorsePieceStateInit                       ; $7636
._01 dw HorsePieceStateInit                       ; $7638
._02 dw HorsePieceStateThrowing                   ; $763A
._03 dw HorsePieceStateWaitingForOther            ; $763C
._04 dw HorsePieceStateFinished                   ; $763E

HorsePieceStateInit::
    jp   HorsePieceCheckForPickup                 ; $7640: $C3 $33 $77

HorsePieceRandomBounceX::
    db   $00, $0C, $10, $0C, $00, $F4, $F0, $F4

HorsePieceRandomBounceY::
    db   $F0, $F4, $00, $0C, $10, $0C, $00, $F4

; One of these sprite variants is picked when throwing the horse heads. On variant 0 the head is considered upright, else it is not.
HorsePieceRandomVariant::
    db   $00, $01, $04, $00

HorsePieceStateThrowing:
    call GetEntityTransitionCountdown             ; $7657: $CD $05 $0C
    jr   nz, .stateNotEnded                       ; $765A: $20 $15

    ; End the throwing state, pick a random variant to show. If this is variant $00, then we are upright.
    call ClearEntitySpeed                         ; $765C: $CD $7F $3D
    call IncrementEntityState                     ; $765F: $CD $12 $3B
    call GetRandomByte                            ; $7662: $CD $0D $28
    and  $03                                      ; $7665: $E6 $03
    ld   e, a                                     ; $7667: $5F
    ld   d, b                                     ; $7668: $50
    ld   hl, HorsePieceRandomVariant              ; $7669: $21 $53 $76
    add  hl, de                                   ; $766C: $19
    ld   a, [hl]                                  ; $766D: $7E
    jp   SetEntitySpriteVariant                   ; $766E: $C3 $0C $3B

.stateNotEnded
    and  $07                                      ; $7671: $E6 $07
    jr   nz, .noVariantChange                     ; $7673: $20 $09

    ; Every 8 frames, change our variant for tumbling animation.
    ld   hl, wEntitiesSpriteVariantTable          ; $7675: $21 $B0 $C3
    add  hl, bc                                   ; $7678: $09
    ld   a, [hl]                                  ; $7679: $7E
    inc  a                                        ; $767A: $3C
    and  $03                                      ; $767B: $E6 $03
    ld   [hl], a                                  ; $767D: $77

.noVariantChange
    ldh  a, [hMultiPurposeG]                      ; $767E: $F0 $E8
    dec  a                                        ; $7680: $3D
    and  $80                                      ; $7681: $E6 $80
    jr   z, .jr_76C2                              ; $7683: $28 $3D

    call .func_76E7                               ; $7685: $CD $E7 $76
    ldh  a, [hMultiPurposeH]                      ; $7688: $F0 $E9
    sub  $FC                                      ; $768A: $D6 $FC
    and  $80                                      ; $768C: $E6 $80
    jr   nz, .jr_7696                             ; $768E: $20 $06

    ldh  a, [hFrameCounter]                       ; $7690: $F0 $E7
    and  $07                                      ; $7692: $E6 $07
    jr   nz, .jr_76C2                             ; $7694: $20 $2C

.jr_7696
    call GetRandomByte                            ; $7696: $CD $0D $28
    and  $01                                      ; $7699: $E6 $01
    ld   e, $01                                   ; $769B: $1E $01
    jr   z, .jr_76A1                              ; $769D: $28 $02

    ld   e, $FF                                   ; $769F: $1E $FF

.jr_76A1
    ld   hl, wEntitiesDirectionTable              ; $76A1: $21 $80 $C3
    add  hl, bc                                   ; $76A4: $09
    ld   a, [hl]                                  ; $76A5: $7E
    add  e                                        ; $76A6: $83
    and  $07                                      ; $76A7: $E6 $07
    ld   [hl], a                                  ; $76A9: $77
    ld   e, a                                     ; $76AA: $5F
    ld   d, b                                     ; $76AB: $50
    ld   hl, HorsePieceRandomBounceX              ; $76AC: $21 $43 $76
    add  hl, de                                   ; $76AF: $19
    ld   a, [hl]                                  ; $76B0: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $76B1: $21 $40 $C2
    add  hl, bc                                   ; $76B4: $09
    ld   [hl], a                                  ; $76B5: $77
    ld   hl, HorsePieceRandomBounceY              ; $76B6: $21 $4B $76
    add  hl, de                                   ; $76B9: $19
    ld   a, [hl]                                  ; $76BA: $7E
    call GetEntitySpeedYAddress                   ; $76BB: $CD $05 $40
    ld   [hl], a                                  ; $76BE: $77
    call .func_76E7                               ; $76BF: $CD $E7 $76

.jr_76C2:
    ld   hl, wEntitiesCollisionsTable             ; $76C2: $21 $A0 $C2
    add  hl, bc                                   ; $76C5: $09
    ld   a, [hl]                                  ; $76C6: $7E
    and  a                                        ; $76C7: $A7
    jr   z, .ret                                  ; $76C8: $28 $23

    ld   hl, wEntitiesDirectionTable              ; $76CA: $21 $80 $C3
    add  hl, bc                                   ; $76CD: $09
    ld   a, [hl]                                  ; $76CE: $7E
    xor  $04                                      ; $76CF: $EE $04
    ld   [hl], a                                  ; $76D1: $77
    call GetEntityTransitionCountdown             ; $76D2: $CD $05 $0C
    srl  [hl]                                     ; $76D5: $CB $3E
    ld   hl, wEntitiesSpeedXTable                 ; $76D7: $21 $40 $C2
    call .bounceSpeedAdjust                       ; $76DA: $CD $E0 $76
    ld   hl, wEntitiesSpeedYTable                 ; $76DD: $21 $50 $C2

    ; When bouncing, reduce the X/Y speed by half and flip them.
.bounceSpeedAdjust
    add  hl, bc                                   ; $76E0: $09
    ld   a, [hl]                                  ; $76E1: $7E
    cpl                                           ; $76E2: $2F
    sra  a                                        ; $76E3: $CB $2F
    inc  a                                        ; $76E5: $3C
    ld   [hl], a                                  ; $76E6: $77

.func_76E7
    ld   hl, wC5D0                                ; $76E7: $21 $D0 $C5
    add  hl, bc                                   ; $76EA: $09
    ld   [hl], $FF                                ; $76EB: $36 $FF

.ret
    ret                                           ; $76ED: $C9

HorsePieceStateWaitingForOther::
    ; If we are the 2nd horse piece, do nothing.
    ld   hl, wEntitiesLoadOrderTable              ; $76EE: $21 $60 $C4
    add  hl, bc                                   ; $76F1: $09
    ld   a, [hl]                                  ; $76F2: $7E
    and  a                                        ; $76F3: $A7
    ret  nz                                       ; $76F4: $C0

    ; Find the 2nd horse piece and check if it is also in "waiting for other" state.
    ld   a, [wD201]                               ; $76F5: $FA $01 $D2
    ld   e, a                                     ; $76F8: $5F
    ld   d, b                                     ; $76F9: $50
    ld   hl, wEntitiesStateTable                  ; $76FA: $21 $90 $C2
    add  hl, de                                   ; $76FD: $19
    ld   a, [hl]                                  ; $76FE: $7E
    cp   $03                                      ; $76FF: $FE $03
    ret  nz                                       ; $7701: $C0

    inc  [hl]                                     ; $7702: $34
    call IncrementEntityState                     ; $7703: $CD $12 $3B
    ldh  a, [hActiveEntitySpriteVariant]          ; $7706: $F0 $F1
    cp   $00                                      ; $7708: $FE $00
    jr   nz, .puzzleFailed                        ; $770A: $20 $0A

    ld   hl, wEntitiesSpriteVariantTable          ; $770C: $21 $B0 $C3
    add  hl, de                                   ; $770F: $19
    ld   a, [hl]                                  ; $7710: $7E
    cp   $00                                      ; $7711: $FE $00
    jp   z, MarkTriggerAsResolved                 ; $7713: $CA $60 $0C

.puzzleFailed
    ld   hl, wEntitiesTransitionCountdownTable    ; $7716: $21 $E0 $C2
    add  hl, de                                   ; $7719: $19
    ld   [hl], $40                                ; $771A: $36 $40
    call GetEntityTransitionCountdown             ; $771C: $CD $05 $0C
    ld   [hl], $40                                ; $771F: $36 $40
    jp   PlayWrongAnswerJingle                    ; $7721: $C3 $20 $0C

HorsePieceStateFinished::
    call GetEntityTransitionCountdown             ; $7724: $CD $05 $0C
    cp   $01                                      ; $7727: $FE $01
    jr   nz, .notFallDown                         ; $7729: $20 $05
    ; Reached finished without both upright, so fall down this one.
    ld   a, $01                                   ; $772B: $3E $01
    call SetEntitySpriteVariant                   ; $772D: $CD $0C $3B
.notFallDown
    jp   HorsePieceCheckForPickup                 ; $7730: $C3 $33 $77

HorsePieceCheckForPickup:
    call CheckLinkCollisionWithEnemy_trampoline   ; $7733: $CD $5A $3B
    jr   nc, .ret                                 ; $7736: $30 $4B

    ld   a, [wLinkAttackStepAnimationCountdown]   ; $7738: $FA $9B $C1
    and  a                                        ; $773B: $A7
    jr   nz, .ret                                 ; $773C: $20 $45

    ld   a, [wInventoryItems.BButtonSlot]         ; $773E: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $7741: $FE $03
    jr   nz, .noBraceletB                         ; $7743: $20 $08

    ldh  a, [hJoypadState]                        ; $7745: $F0 $CC
    and  J_B                                      ; $7747: $E6 $20
    jr   nz, .useBracelet                         ; $7749: $20 $0F

    jr   .ret                                     ; $774B: $18 $36

.noBraceletB
    ld   a, [wInventoryItems.AButtonSlot]         ; $774D: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $7750: $FE $03
    jr   nz, .ret                                 ; $7752: $20 $2F

    ldh  a, [hJoypadState]                        ; $7754: $F0 $CC
    and  J_A                                      ; $7756: $E6 $10
    jr   z, .ret                                  ; $7758: $28 $29

.useBracelet
    ld   a, [wC3CF]                               ; $775A: $FA $CF $C3
    and  a                                        ; $775D: $A7
    jr   nz, .ret                                 ; $775E: $20 $23

    inc  a                                        ; $7760: $3C
    ld   [wC3CF], a                               ; $7761: $EA $CF $C3
    call IncrementEntityState                     ; $7764: $CD $12 $3B
    ld   [hl], $02                                ; $7767: $36 $02
    ld   hl, wEntitiesStatusTable                 ; $7769: $21 $80 $C2
    add  hl, bc                                   ; $776C: $09
    ld   [hl], ENTITY_STATUS_LIFTED               ; $776D: $36 $07
    ld   hl, wEntitiesLiftedTable                 ; $776F: $21 $90 $C4
    add  hl, bc                                   ; $7772: $09
    ld   [hl], b                                  ; $7773: $70
    ldh  a, [hLinkDirection]                      ; $7774: $F0 $9E
    ld   [wC15D], a                               ; $7776: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $7779: $CD $05 $0C
    ld   [hl], $02                                ; $777C: $36 $02
    ld   hl, hWaveSfx                             ; $777E: $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ; $7781: $36 $02

.ret
    ret                                           ; $7783: $C9
