; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown011SpriteVariants::
.variant0
    db $6E, OAM_GBC_PAL_7 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $F8, OAM_GBC_PAL_7 | OAMF_PAL1
    db $FA, OAM_GBC_PAL_7 | OAMF_PAL1

Data_003_523D::
    db   $F8, $08, $00, $00

Data_003_5241::
    db   $00, $00, $08, $F8

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown010SpriteVariants::
.variant0
    db $7E, OAM_GBC_PAL_7 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP

PushedBlockEntityHandler::
    ld   a, [wIsIndoor]                           ; $5249: $FA $A5 $DB
    ldh  [hActiveEntitySpriteVariant], a          ; $524C: $E0 $F1
    ld   de, Unknown011SpriteVariants             ; $524E: $11 $35 $52
    and  a                                        ; $5251: $A7
    jr   nz, .render                              ; $5252: $20 $09

    ldh  a, [hMapRoom]                            ; $5254: $F0 $F6
    cp   ROOM_OW_COLOR_DUNGEON_ENTRANCE           ; $5256: $FE $77
    jr   nz, .render                              ; $5258: $20 $03

    ld   de, Unknown010SpriteVariants             ; $525A: $11 $45 $52

.render:
    call RenderActiveEntitySpritesPair            ; $525D: $CD $C0 $3B
    call ReturnIfNonInteractive_03                ; $5260: $CD $78 $7F
    call UpdateEntityPosWithSpeed_03              ; $5263: $CD $25 $7F
    call func_003_52D4                            ; $5266: $CD $D4 $52
    call CheckLinkCollisionWithEnemy.collisionEvenInTheAir ; $5269: $CD $77 $6C
    jr   nc, .jr_5276                             ; $526C: $30 $08

    call CopyLinkFinalPositionToPosition          ; $526E: $CD $BE $0C
    ld   a, $03                                   ; $5271: $3E $03
    ld   [wIsLinkPushing], a                      ; $5273: $EA $44 $C1

.jr_5276
    ldh  a, [hMapRoom]                            ; $5276: $F0 $F6
    cp   UNKNOWN_ROOM_C7                          ; $5278: $FE $C7
    jr   z, .jr_5282                              ; $527A: $28 $06

    ld   a, [wIsIndoor]                           ; $527C: $FA $A5 $DB
    and  a                                        ; $527F: $A7
    jr   nz, jr_003_5286                          ; $5280: $20 $04

.jr_5282
    ld   a, $02                                   ; $5282: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5284: $E0 $A1

jr_003_5286:
    ld   hl, wEntitiesInertiaTable                ; $5286: $21 $D0 $C3
    add  hl, bc                                   ; $5289: $09
    ld   a, [hl]                                  ; $528A: $7E
    inc  a                                        ; $528B: $3C
    ld   [hl], a                                  ; $528C: $77
    cp   $21                                      ; $528D: $FE $21
    ret  nz                                       ; $528F: $C0

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5290: $21 $10 $C4
    add  hl, bc                                   ; $5293: $09
    ld   [hl], a                                  ; $5294: $77
    call func_003_7893                            ; $5295: $CD $93 $78
    ld   hl, wEntitiesStatusTable                 ; $5298: $21 $80 $C2
    add  hl, bc                                   ; $529B: $09
    ld   a, [hl]                                  ; $529C: $7E
    and  a                                        ; $529D: $A7
    ret  z                                        ; $529E: $C8

    cp   $02                                      ; $529F: $FE $02
    ret  z                                        ; $52A1: $C8

    call UnloadEntity                             ; $52A2: $CD $8D $3F
    ld   de, Data_003_5162                        ; $52A5: $11 $62 $51
    ld   b, $C4                                   ; $52A8: $06 $C4
    ld   a, [wIsIndoor]                           ; $52AA: $FA $A5 $DB
    and  a                                        ; $52AD: $A7
    jr   z, .jr_52B5                              ; $52AE: $28 $05

    ld   de, Data_003_515E                        ; $52B0: $11 $5E $51
    ld   b, $A6                                   ; $52B3: $06 $A6

.jr_52B5
    call func_003_51C9                            ; $52B5: $CD $C9 $51
    ld   a, [wRoomEvent]                          ; $52B8: $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ; $52BB: $E6 $1F
    cp   TRIGGER_PUSH_SINGLE_BLOCK                ; $52BD: $FE $02
    jr   z, .jr_52D1                              ; $52BF: $28 $10

    cp   TRIGGER_PUSH_BLOCKS                      ; $52C1: $FE $07
    ret  nz                                       ; $52C3: $C0

    call func_003_7893                            ; $52C4: $CD $93 $78
    ld   a, [wC503]                               ; $52C7: $FA $03 $C5
    cp   $A7                                      ; $52CA: $FE $A7
    jr   z, .jr_52D1                              ; $52CC: $28 $03

    cp   $A6                                      ; $52CE: $FE $A6
    ret  nz                                       ; $52D0: $C0

.jr_52D1
    jp   MarkTriggerAsResolved                    ; $52D1: $C3 $60 $0C
