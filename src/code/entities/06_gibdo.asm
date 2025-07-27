; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GibdoSpriteVariants::
.variant0
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GibdoTurtleRockSpriteVariants::
.variant0
    db $44, OAM_GBC_PAL_2 | OAMF_PAL0
    db $46, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $46, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $44, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

LikeLikeGibdoSpeeds::
; X speeds
    db $00, $08, $F8, $00
; Y speeds (when X speed is zero)
    db $F8, $08

GibdoEntityHandler::
    ld   de, GibdoSpriteVariants                  ;; 06:7E85 $11 $6F $7E
    ldh  a, [hMapId]                              ;; 06:7E88 $F0 $F7
    cp   MAP_TURTLE_ROCK                          ;; 06:7E8A $FE $07
    jr   nz, .render                              ;; 06:7E8C $20 $03

    ld   de, GibdoTurtleRockSpriteVariants        ;; 06:7E8E $11 $77 $7E

.render:
    call RenderActiveEntitySpritesPair            ;; 06:7E91 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:7E94 $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ;; 06:7E97 $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:7E9A $CD $39 $3B

LikeLikeGibdoWalk:
    call UpdateEntityPosWithSpeed_06              ;; 06:7E9D $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:7EA0 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 06:7EA3 $21 $A0 $C2
    add  hl, bc                                   ;; 06:7EA6 $09
    ld   a, [hl]                                  ;; 06:7EA7 $7E
    and  $03                                      ;; 06:7EA8 $E6 $03
    jr   nz, .horizontalCollision                 ;; 06:7EAA $20 $0F

    ld   a, [hl]                                  ;; 06:7EAC $7E
    and  $0C                                      ;; 06:7EAD $E6 $0C
    jr   z, .noCollision                          ;; 06:7EAF $28 $12

    ld   hl, wEntitiesSpeedYTable                 ;; 06:7EB1 $21 $50 $C2
    add  hl, bc                                   ;; 06:7EB4 $09
    ld   a, [hl]                                  ;; 06:7EB5 $7E
    xor  $F0                                      ;; 06:7EB6 $EE $F0
    ld   [hl], a                                  ;; 06:7EB8 $77
    jr   .noCollision                             ;; 06:7EB9 $18 $08

.horizontalCollision
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7EBB $21 $40 $C2
    add  hl, bc                                   ;; 06:7EBE $09
    ld   a, [hl]                                  ;; 06:7EBF $7E
    xor  $F0                                      ;; 06:7EC0 $EE $F0
    ld   [hl], a                                  ;; 06:7EC2 $77

.noCollision
    ld   hl, wEntitiesStateTable                  ;; 06:7EC3 $21 $90 $C2
    add  hl, bc                                   ;; 06:7EC6 $09
    ld   a, [hl]                                  ;; 06:7EC7 $7E
    and  a                                        ;; 06:7EC8 $A7
    jr   nz, .chooseDirection                     ;; 06:7EC9 $20 $07

    call GetRandomByte                            ;; 06:7ECB $CD $0D $28
    and  $3F                                      ;; 06:7ECE $E6 $3F
    jr   nz, .chooseDirectionEnd                  ;; 06:7ED0 $20 $2D

.chooseDirection
    xor  a                                        ;; 06:7ED2 $AF
    ld   hl, wEntitiesSpeedYTable                 ;; 06:7ED3 $21 $50 $C2
    add  hl, bc                                   ;; 06:7ED6 $09
    ld   [hl], a                                  ;; 06:7ED7 $77
    call GetRandomByte                            ;; 06:7ED8 $CD $0D $28
    and  $03                                      ;; 06:7EDB $E6 $03
    ld   e, a                                     ;; 06:7EDD $5F
    ld   d, b                                     ;; 06:7EDE $50
    ld   hl, LikeLikeGibdoSpeeds                  ;; 06:7EDF $21 $7F $7E
    add  hl, de                                   ;; 06:7EE2 $19
    ld   a, [hl]                                  ;; 06:7EE3 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7EE4 $21 $40 $C2
    add  hl, bc                                   ;; 06:7EE7 $09
    ld   [hl], a                                  ;; 06:7EE8 $77
    and  a                                        ;; 06:7EE9 $A7
    jr   nz, .chooseDirectionEnd                  ;; 06:7EEA $20 $13

    call GetRandomByte                            ;; 06:7EEC $CD $0D $28
    and  $01                                      ;; 06:7EEF $E6 $01
    add  $04                                      ;; 06:7EF1 $C6 $04
    ld   e, a                                     ;; 06:7EF3 $5F
    ld   d, b                                     ;; 06:7EF4 $50
    ld   hl, LikeLikeGibdoSpeeds                  ;; 06:7EF5 $21 $7F $7E
    add  hl, de                                   ;; 06:7EF8 $19
    ld   a, [hl]                                  ;; 06:7EF9 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:7EFA $21 $50 $C2
    add  hl, bc                                   ;; 06:7EFD $09
    ld   [hl], a                                  ;; 06:7EFE $77

.chooseDirectionEnd
    ld   hl, wEntitiesStateTable                  ;; 06:7EFF $21 $90 $C2
    add  hl, bc                                   ;; 06:7F02 $09
    xor  a                                        ;; 06:7F03 $AF
    ld   [hl], a                                  ;; 06:7F04 $77
