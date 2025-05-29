EntityInitMiniMoldorm::
    ld   hl, wEntitiesLoadOrderTable              ;; 04:5A1A $21 $60 $C4
    add  hl, bc                                   ;; 04:5A1D $09
    ld   e, [hl]                                  ;; 04:5A1E $5E
    sla  e                                        ;; 04:5A1F $CB $23
    sla  e                                        ;; 04:5A21 $CB $23
    sla  e                                        ;; 04:5A23 $CB $23
    sla  e                                        ;; 04:5A25 $CB $23
    sla  e                                        ;; 04:5A27 $CB $23
    ld   d, b                                     ;; 04:5A29 $50
    ld   hl, wEntitiesPositionXHistoryTable       ;; 04:5A2A $21 $00 $D0
    add  hl, de                                   ;; 04:5A2D $19
    push de                                       ;; 04:5A2E $D5
    ld   e, $20                                   ;; 04:5A2F $1E $20

.initXHistoryTableLoop    
    xor  a                                        ;; 04:5A31 $AF
    ld   [hl+], a                                 ;; 04:5A32 $22
    dec  e                                        ;; 04:5A33 $1D
    ld   a, e                                     ;; 04:5A34 $7B
    cp   $00                                      ;; 04:5A35 $FE $00
    jr   nz, .initXHistoryTableLoop               ;; 04:5A37 $20 $F8

    pop  de                                       ;; 04:5A39 $D1
    ld   hl, wEntitiesPositionYHistoryTable       ;; 04:5A3A $21 $00 $D1
    add  hl, de                                   ;; 04:5A3D $19
    ld   e, $20                                   ;; 04:5A3E $1E $20

.initYHistoryTableLoop    
    xor  a                                        ;; 04:5A40 $AF
    ld   [hl+], a                                 ;; 04:5A41 $22
    dec  e                                        ;; 04:5A42 $1D
    ld   a, e                                     ;; 04:5A43 $7B
    cp   $00                                      ;; 04:5A44 $FE $00
    jr   nz, .initYHistoryTableLoop               ;; 04:5A46 $20 $F8

    ret                                           ;; 04:5A48 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MiniMoldormSpriteVariants::
; Down
.variant0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Up
.variant1
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
; Left
.variant2
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
; Right
.variant3
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Down-left
.variant4
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0
; Down-right
.variant5
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Up-left
.variant6
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
; Up-right
.variant7
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
; 2nd segment
.variant8
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; 3rd segment
.variant9
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; Indexed by movement angle
MoldormHeadSpriteVariantIndexes::
    db   $03, $03, $05, $05, $00, $00, $04, $04, $02, $02, $06, $06, $01, $01, $07, $07

; Approximately 0x10 * sin(pi/8 * index)
MoldormYSpeeds::
    db   $00, $06, $0C, $0E

; Approximately 0x10 * cos(pi/8 * index)
MoldormXSpeeds::
    db   $10, $0E, $0C, $06, $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E

MiniMoldormEntityHandler::
    call RenderMiniMoldorm                        ;; 04:5A95 $CD $7F $5B
    ld   a, [wRoomTransitionState]                ;; 04:5A98 $FA $24 $C1
    and  a                                        ;; 04:5A9B $A7
    jr   nz, .resetTailPositions                  ;; 04:5A9C $20 $08

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 04:5A9E $21 $10 $C4
    add  hl, bc                                   ;; 04:5AA1 $09
    ld   a, [hl]                                  ;; 04:5AA2 $7E
    and  a                                        ;; 04:5AA3 $A7
    jr   z, .resetTailPositionsEnd                ;; 04:5AA4 $28 $03

.resetTailPositions
    call EntityInitMiniMoldorm                    ;; 04:5AA6 $CD $1A $5A

.resetTailPositionsEnd
    ; Add current position to position history
    call ReturnIfNonInteractive_04                ;; 04:5AA9 $CD $A3 $7F
    ld   hl, wEntitiesInertiaTable                ;; 04:5AAC $21 $D0 $C3
    add  hl, bc                                   ;; 04:5AAF $09
    ld   a, [hl]                                  ;; 04:5AB0 $7E
    inc  a                                        ;; 04:5AB1 $3C
    and  $1F                                      ;; 04:5AB2 $E6 $1F
    ld   [hl], a                                  ;; 04:5AB4 $77
    ldh  [hMultiPurpose0], a                      ;; 04:5AB5 $E0 $D7
    ld   hl, wEntitiesLoadOrderTable              ;; 04:5AB7 $21 $60 $C4
    add  hl, bc                                   ;; 04:5ABA $09
    ld   e, [hl]                                  ;; 04:5ABB $5E
    sla  e                                        ;; 04:5ABC $CB $23
    sla  e                                        ;; 04:5ABE $CB $23
    sla  e                                        ;; 04:5AC0 $CB $23
    sla  e                                        ;; 04:5AC2 $CB $23
    sla  e                                        ;; 04:5AC4 $CB $23
    ld   d, $00                                   ;; 04:5AC6 $16 $00
    push de                                       ;; 04:5AC8 $D5
    ld   hl, wEntitiesPositionXHistoryTable       ;; 04:5AC9 $21 $00 $D0
    add  hl, de                                   ;; 04:5ACC $19
    ldh  a, [hMultiPurpose0]                      ;; 04:5ACD $F0 $D7
    ld   e, a                                     ;; 04:5ACF $5F
    add  hl, de                                   ;; 04:5AD0 $19
    ldh  a, [hActiveEntityPosX]                   ;; 04:5AD1 $F0 $EE
    ld   [hl], a                                  ;; 04:5AD3 $77
    pop  de                                       ;; 04:5AD4 $D1
    ld   hl, wEntitiesPositionYHistoryTable       ;; 04:5AD5 $21 $00 $D1
    add  hl, de                                   ;; 04:5AD8 $19
    ldh  a, [hMultiPurpose0]                      ;; 04:5AD9 $F0 $D7
    ld   e, a                                     ;; 04:5ADB $5F
    add  hl, de                                   ;; 04:5ADC $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:5ADD $F0 $EC
    ld   [hl], a                                  ;; 04:5ADF $77
    call ApplyRecoilIfNeeded_04                   ;; 04:5AE0 $CD $80 $6D
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:5AE3 $CD $39 $3B

.sharedMoldormBehavior
    ; When flashing, don't update position
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:5AE6 $21 $20 $C4
    add  hl, bc                                   ;; 04:5AE9 $09
    ld   a, [hl]                                  ;; 04:5AEA $7E
    and  a                                        ;; 04:5AEB $A7
    jr   nz, .skipPosUpdate                       ;; 04:5AEC $20 $03

    call UpdateEntityPosWithSpeed_04              ;; 04:5AEE $CD $CA $6D

.skipPosUpdate
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:5AF1 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 04:5AF4 $21 $A0 $C2
    add  hl, bc                                   ;; 04:5AF7 $09
    ld   a, [hl]                                  ;; 04:5AF8 $7E
    and  a                                        ;; 04:5AF9 $A7
    jr   z, .collisionEnd                         ;; 04:5AFA $28 $2C

    ld   e, $08                                   ;; 04:5AFC $1E $08
    bit  DIRECTION_RIGHT, a                       ;; 04:5AFE $CB $47
    jr   nz, .collision                           ;; 04:5B00 $20 $0E

    ld   e, $00                                   ;; 04:5B02 $1E $00
    bit  DIRECTION_LEFT, a                        ;; 04:5B04 $CB $4F
    jr   nz, .collision                           ;; 04:5B06 $20 $08

    ld   e, $04                                   ;; 04:5B08 $1E $04
    bit  DIRECTION_UP, a                          ;; 04:5B0A $CB $57
    jr   nz, .collision                           ;; 04:5B0C $20 $02

    ld   e, $0C                                   ;; 04:5B0E $1E $0C

.collision
    ld   hl, wEntitiesPrivateState1Table          ;; 04:5B10 $21 $B0 $C2
    add  hl, bc                                   ;; 04:5B13 $09
    ld   [hl], e                                  ;; 04:5B14 $73
    call GetRandomByte                            ;; 04:5B15 $CD $0D $28
    rra                                           ;; 04:5B18 $1F
    jr   c, .changeTurningDirectionEnd            ;; 04:5B19 $38 $08

    ld   hl, wEntitiesPrivateState2Table          ;; 04:5B1B $21 $C0 $C2
    add  hl, bc                                   ;; 04:5B1E $09
    ld   a, [hl]                                  ;; 04:5B1F $7E
    cpl                                           ;; 04:5B20 $2F
    inc  a                                        ;; 04:5B21 $3C
    ld   [hl], a                                  ;; 04:5B22 $77

.changeTurningDirectionEnd
    call GetEntityTransitionCountdown             ;; 04:5B23 $CD $05 $0C
    ld   [hl], $10                                ;; 04:5B26 $36 $10

.collisionEnd
    call GetEntityPrivateCountdown1               ;; 04:5B28 $CD $00 $0C
    jr   nz, .angleUpdateEnd                      ;; 04:5B2B $20 $39
    
    ; The movement angle is updated every 4 frames (6 for Moldorm)
    ld   [hl], $04                                ;; 04:5B2D $36 $04
    ldh  a, [hActiveEntityType]                   ;; 04:5B2F $F0 $EB
    cp   ENTITY_MOLDORM                           ;; 04:5B31 $FE $59
    jr   nz, .moldormSpecialCaseEnd               ;; 04:5B33 $20 $02

    ld   [hl], $06                                ;; 04:5B35 $36 $06

.moldormSpecialCaseEnd
    ld   hl, wEntitiesPrivateState2Table          ;; 04:5B37 $21 $C0 $C2
    add  hl, bc                                   ;; 04:5B3A $09
    ld   a, [hl]                                  ;; 04:5B3B $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 04:5B3C $21 $B0 $C2
    add  hl, bc                                   ;; 04:5B3F $09
    add  [hl]                                     ;; 04:5B40 $86
    and  $0F                                      ;; 04:5B41 $E6 $0F
    ld   [hl], a                                  ;; 04:5B43 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 04:5B44 $21 $B0 $C2
    add  hl, bc                                   ;; 04:5B47 $09
    ld   e, [hl]                                  ;; 04:5B48 $5E
    ld   d, b                                     ;; 04:5B49 $50
    ld   hl, MoldormHeadSpriteVariantIndexes      ;; 04:5B4A $21 $71 $5A
    add  hl, de                                   ;; 04:5B4D $19
    ld   a, [hl]                                  ;; 04:5B4E $7E
    call SetEntitySpriteVariant                   ;; 04:5B4F $CD $0C $3B
    ld   hl, MoldormYSpeeds                       ;; 04:5B52 $21 $81 $5A
    add  hl, de                                   ;; 04:5B55 $19
    ld   a, [hl]                                  ;; 04:5B56 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:5B57 $21 $50 $C2
    add  hl, bc                                   ;; 04:5B5A $09
    ld   [hl], a                                  ;; 04:5B5B $77
    ld   hl, MoldormXSpeeds                       ;; 04:5B5C $21 $85 $5A
    add  hl, de                                   ;; 04:5B5F $19
    ld   a, [hl]                                  ;; 04:5B60 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:5B61 $21 $40 $C2
    add  hl, bc                                   ;; 04:5B64 $09
    ld   [hl], a                                  ;; 04:5B65 $77

.angleUpdateEnd
    call GetEntityTransitionCountdown             ;; 04:5B66 $CD $05 $0C
    jr   nz, .return                              ;; 04:5B69 $20 $13

    call GetRandomByte                            ;; 04:5B6B $CD $0D $28
    and  $1F                                      ;; 04:5B6E $E6 $1F
    add  $10                                      ;; 04:5B70 $C6 $10
    ld   [hl], a                                  ;; 04:5B72 $77
    call GetRandomByte                            ;; 04:5B73 $CD $0D $28
    and  $02                                      ;; 04:5B76 $E6 $02
    dec  a                                        ;; 04:5B78 $3D
    ld   hl, wEntitiesPrivateState2Table          ;; 04:5B79 $21 $C0 $C2
    add  hl, bc                                   ;; 04:5B7C $09
    ld   [hl], a                                  ;; 04:5B7D $77

.return
    ret                                           ;; 04:5B7E $C9

RenderMiniMoldorm::
    ld   de, MiniMoldormSpriteVariants            ;; 04:5B7F $11 $49 $5A
    call RenderActiveEntitySpritesPair            ;; 04:5B82 $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:5B85 $CD $A3 $7F
    ld   hl, wEntitiesInertiaTable                ;; 04:5B88 $21 $D0 $C3
    add  hl, bc                                   ;; 04:5B8B $09
    ld   a, [hl]                                  ;; 04:5B8C $7E
    ldh  [hMultiPurpose0], a                      ;; 04:5B8D $E0 $D7
    ld   hl, wEntitiesLoadOrderTable              ;; 04:5B8F $21 $60 $C4
    add  hl, bc                                   ;; 04:5B92 $09
    ld   e, [hl]                                  ;; 04:5B93 $5E
    sla  e                                        ;; 04:5B94 $CB $23
    sla  e                                        ;; 04:5B96 $CB $23
    sla  e                                        ;; 04:5B98 $CB $23
    sla  e                                        ;; 04:5B9A $CB $23
    sla  e                                        ;; 04:5B9C $CB $23
    ld   d, b                                     ;; 04:5B9E $50
    push de                                       ;; 04:5B9F $D5
    push de                                       ;; 04:5BA0 $D5
    ld   hl, wEntitiesPositionXHistoryTable       ;; 04:5BA1 $21 $00 $D0
    add  hl, de                                   ;; 04:5BA4 $19
    ldh  a, [hMultiPurpose0]                      ;; 04:5BA5 $F0 $D7
    sub  $09                                      ;; 04:5BA7 $D6 $09
    and  $1F                                      ;; 04:5BA9 $E6 $1F
    ld   e, a                                     ;; 04:5BAB $5F
    ld   d, b                                     ;; 04:5BAC $50
    add  hl, de                                   ;; 04:5BAD $19
    ld   a, [hl]                                  ;; 04:5BAE $7E
    ldh  [hActiveEntityPosX], a                   ;; 04:5BAF $E0 $EE
    pop  de                                       ;; 04:5BB1 $D1
    ld   hl, wEntitiesPositionYHistoryTable       ;; 04:5BB2 $21 $00 $D1
    add  hl, de                                   ;; 04:5BB5 $19
    ldh  a, [hMultiPurpose0]                      ;; 04:5BB6 $F0 $D7
    sub  $09                                      ;; 04:5BB8 $D6 $09
    and  $1F                                      ;; 04:5BBA $E6 $1F
    ld   e, a                                     ;; 04:5BBC $5F
    ld   d, b                                     ;; 04:5BBD $50
    add  hl, de                                   ;; 04:5BBE $19
    ld   a, [hl]                                  ;; 04:5BBF $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 04:5BC0 $E0 $EC
    ld   a, $08                                   ;; 04:5BC2 $3E $08
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:5BC4 $E0 $F1
    ld   de, MiniMoldormSpriteVariants            ;; 04:5BC6 $11 $49 $5A
    call RenderActiveEntitySpritesPair            ;; 04:5BC9 $CD $C0 $3B
    pop  de                                       ;; 04:5BCC $D1
    push de                                       ;; 04:5BCD $D5
    ld   hl, wEntitiesPositionXHistoryTable       ;; 04:5BCE $21 $00 $D0
    add  hl, de                                   ;; 04:5BD1 $19
    ldh  a, [hMultiPurpose0]                      ;; 04:5BD2 $F0 $D7
    sub  $10                                      ;; 04:5BD4 $D6 $10
    and  $1F                                      ;; 04:5BD6 $E6 $1F
    ld   e, a                                     ;; 04:5BD8 $5F
    ld   d, b                                     ;; 04:5BD9 $50
    add  hl, de                                   ;; 04:5BDA $19
    ld   a, [hl]                                  ;; 04:5BDB $7E
    ldh  [hActiveEntityPosX], a                   ;; 04:5BDC $E0 $EE
    pop  de                                       ;; 04:5BDE $D1
    ld   hl, wEntitiesPositionYHistoryTable       ;; 04:5BDF $21 $00 $D1
    add  hl, de                                   ;; 04:5BE2 $19
    ldh  a, [hMultiPurpose0]                      ;; 04:5BE3 $F0 $D7
    sub  $10                                      ;; 04:5BE5 $D6 $10
    and  $1F                                      ;; 04:5BE7 $E6 $1F
    ld   e, a                                     ;; 04:5BE9 $5F
    ld   d, b                                     ;; 04:5BEA $50
    add  hl, de                                   ;; 04:5BEB $19
    ld   a, [hl]                                  ;; 04:5BEC $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 04:5BED $E0 $EC
    ld   a, $09                                   ;; 04:5BEF $3E $09
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:5BF1 $E0 $F1
    ld   de, MiniMoldormSpriteVariants            ;; 04:5BF3 $11 $49 $5A
    call RenderActiveEntitySpritesPair            ;; 04:5BF6 $CD $C0 $3B
    jp   CopyEntityPositionToActivePosition       ;; 04:5BF9 $C3 $8A $3D
