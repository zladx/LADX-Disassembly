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
    ld   a, [wIsIndoor]                           ;; 03:5249 $FA $A5 $DB
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:524C $E0 $F1
    ld   de, Unknown011SpriteVariants             ;; 03:524E $11 $35 $52
    and  a                                        ;; 03:5251 $A7
    jr   nz, .render                              ;; 03:5252 $20 $09

    ldh  a, [hMapRoom]                            ;; 03:5254 $F0 $F6
    cp   ROOM_OW_COLOR_DUNGEON_ENTRANCE           ;; 03:5256 $FE $77
    jr   nz, .render                              ;; 03:5258 $20 $03

    ld   de, Unknown010SpriteVariants             ;; 03:525A $11 $45 $52

.render:
    call RenderActiveEntitySpritesPair            ;; 03:525D $CD $C0 $3B
    call ReturnIfNonInteractive_03                ;; 03:5260 $CD $78 $7F
    call UpdateEntityPosWithSpeed_03              ;; 03:5263 $CD $25 $7F
    call func_003_52D4                            ;; 03:5266 $CD $D4 $52
    call CheckLinkCollisionWithEnemy.collisionEvenInTheAir ;; 03:5269 $CD $77 $6C
    jr   nc, .jr_5276                             ;; 03:526C $30 $08

    call CopyLinkFinalPositionToPosition          ;; 03:526E $CD $BE $0C
    ld   a, $03                                   ;; 03:5271 $3E $03
    ld   [wIsLinkPushing], a                      ;; 03:5273 $EA $44 $C1

.jr_5276
    ldh  a, [hMapRoom]                            ;; 03:5276 $F0 $F6
    cp   UNKNOWN_ROOM_C7                          ;; 03:5278 $FE $C7
    jr   z, .jr_5282                              ;; 03:527A $28 $06

    ld   a, [wIsIndoor]                           ;; 03:527C $FA $A5 $DB
    and  a                                        ;; 03:527F $A7
    jr   nz, jr_003_5286                          ;; 03:5280 $20 $04

.jr_5282
    ld   a, $02                                   ;; 03:5282 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 03:5284 $E0 $A1

jr_003_5286:
    ld   hl, wEntitiesInertiaTable                ;; 03:5286 $21 $D0 $C3
    add  hl, bc                                   ;; 03:5289 $09
    ld   a, [hl]                                  ;; 03:528A $7E
    inc  a                                        ;; 03:528B $3C
    ld   [hl], a                                  ;; 03:528C $77
    cp   $21                                      ;; 03:528D $FE $21
    ret  nz                                       ;; 03:528F $C0

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:5290 $21 $10 $C4
    add  hl, bc                                   ;; 03:5293 $09
    ld   [hl], a                                  ;; 03:5294 $77
    call ApplyEntityInteractionWithBackground     ;; 03:5295 $CD $93 $78
    ld   hl, wEntitiesStatusTable                 ;; 03:5298 $21 $80 $C2
    add  hl, bc                                   ;; 03:529B $09
    ld   a, [hl]                                  ;; 03:529C $7E
    and  a                                        ;; 03:529D $A7
    ret  z                                        ;; 03:529E $C8

    cp   $02                                      ;; 03:529F $FE $02
    ret  z                                        ;; 03:52A1 $C8

    call UnloadEntity                             ;; 03:52A2 $CD $8D $3F
    ld   de, Data_003_5162                        ;; 03:52A5 $11 $62 $51
    ld   b, $C4                                   ;; 03:52A8 $06 $C4
    ld   a, [wIsIndoor]                           ;; 03:52AA $FA $A5 $DB
    and  a                                        ;; 03:52AD $A7
    jr   z, .jr_52B5                              ;; 03:52AE $28 $05

    ld   de, Data_003_515E                        ;; 03:52B0 $11 $5E $51
    ld   b, $A6                                   ;; 03:52B3 $06 $A6

.jr_52B5
    call func_003_51C9                            ;; 03:52B5 $CD $C9 $51
    ld   a, [wRoomEvent]                          ;; 03:52B8 $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ;; 03:52BB $E6 $1F
    cp   TRIGGER_PUSH_SINGLE_BLOCK                ;; 03:52BD $FE $02
    jr   z, .jr_52D1                              ;; 03:52BF $28 $10

    cp   TRIGGER_PUSH_BLOCKS                      ;; 03:52C1 $FE $07
    ret  nz                                       ;; 03:52C3 $C0

    call ApplyEntityInteractionWithBackground     ;; 03:52C4 $CD $93 $78
    ld   a, [wEntityHorizontallyCollidedObject]   ;; 03:52C7 $FA $03 $C5
    cp   $A7                                      ;; 03:52CA $FE $A7
    jr   z, .jr_52D1                              ;; 03:52CC $28 $03

    cp   $A6                                      ;; 03:52CE $FE $A6
    ret  nz                                       ;; 03:52D0 $C0

.jr_52D1
    jp   MarkTriggerAsResolved                    ;; 03:52D1 $C3 $60 $0C
