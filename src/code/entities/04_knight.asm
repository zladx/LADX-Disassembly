KnightEntityHandler::
    ldh  a, [hMapId]                              ;; 04:69AE $F0 $F7
    cp   MAP_KANALET                              ;; 04:69B0 $FE $14
    jr   c, .unloadIfMinibossDefeated             ;; 04:69B2 $38 $15

    ldh  a, [hRoomStatus]                         ;; 04:69B4 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 04:69B6 $E6 $10
    jp   nz, ClearEntityStatusBank04              ;; 04:69B8 $C2 $7A $6D

    ld   hl, wEntitiesLoadOrderTable              ;; 04:69BB $21 $60 $C4
    add  hl, bc                                   ;; 04:69BE $09
    ld   [hl], $FF                                ;; 04:69BF $36 $FF
    ld   hl, wEntitiesDroppedItemTable            ;; 04:69C1 $21 $E0 $C4
    add  hl, bc                                   ;; 04:69C4 $09
    ld   [hl], ENTITY_HIDING_SLIME_KEY            ;; 04:69C5 $36 $3C
    jr   .unloadIfMinibossDefeatedEnd             ;; 04:69C7 $18 $0C

; If map id < Kanalet Castle, unload if dungeon miniboss has been defeated. Unused.
.unloadIfMinibossDefeated
    ld   e, a                                     ;; 04:69C9 $5F
    ld   d, b                                     ;; 04:69CA $50
    ld   hl, wHasInstrument1                      ;; 04:69CB $21 $65 $DB
    add  hl, de                                   ;; 04:69CE $19
    ld   a, [hl]                                  ;; 04:69CF $7E
    and  $01                                      ;; 04:69D0 $E6 $01
    jp   nz, ClearEntityStatusBank04              ;; 04:69D2 $C2 $7A $6D

.unloadIfMinibossDefeatedEnd
    call RenderKnightAndHandleIronBall            ;; 04:69D5 $CD $C7 $6A
    call CopyEntityPositionToActivePosition       ;; 04:69D8 $CD $8A $3D
    call ReturnIfNonInteractive_04                ;; 04:69DB $CD $A3 $7F
    call ApplyRecoilIfNeeded_04                   ;; 04:69DE $CD $80 $6D
    ld   hl, wEntitiesOptions1Table               ;; 04:69E1 $21 $30 $C4
    add  hl, bc                                   ;; 04:69E4 $09
    ld   [hl], ENTITY_OPT1_NONE                   ;; 04:69E5 $36 $00
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:69E7 $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 04:69EA $F0 $F0
    JP_TABLE                                      ;; 04:69EC
._00 dw KnightWalkingHandler                      ;; 04:69ED
._01 dw KnightWindingUpHandler                    ;; 04:69EF
._02 dw KnightAttackingHandler                    ;; 04:69F1

KnightWalkingHandler::
    call GetEntityTransitionCountdown             ;; 04:69F3 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 04:69F6 $20 $2D

    ldh  a, [hFrameCounter]                       ;; 04:69F8 $F0 $E7
    xor  c                                        ;; 04:69FA $A9
    and  $07                                      ;; 04:69FB $E6 $07
    jr   nz, .skipUpdateSpeed                     ;; 04:69FD $20 $05

    ld   a, $04                                   ;; 04:69FF $3E $04
    call ApplyVectorTowardsLink_trampoline        ;; 04:6A01 $CD $AA $3B

.skipUpdateSpeed
    call UpdateEntityPosWithSpeed_04              ;; 04:6A04 $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:6A07 $CD $23 $3B
    call GetEntityXDistanceToLink_04              ;; 04:6A0A $CD $35 $6E
    add  $30                                      ;; 04:6A0D $C6 $30
    cp   $60                                      ;; 04:6A0F $FE $60
    jr   nc, .skipIncrementState                  ;; 04:6A11 $30 $12

    call GetEntityYDistanceToLink_04              ;; 04:6A13 $CD $45 $6E
    add  $30                                      ;; 04:6A16 $C6 $30
    cp   $60                                      ;; 04:6A18 $FE $60
    jr   nc, .skipIncrementState                  ;; 04:6A1A $30 $09

    call GetEntityTransitionCountdown             ;; 04:6A1C $CD $05 $0C
    ld   [hl], $28                                ;; 04:6A1F $36 $28
    jp   IncrementEntityState                     ;; 04:6A21 $C3 $12 $3B

.return
    ret                                           ;; 04:6A24 $C9

.skipIncrementState
    ldh  a, [hFrameCounter]                       ;; 04:6A25 $F0 $E7
    and  $01                                      ;; 04:6A27 $E6 $01
    jr   nz, .return                              ;; 04:6A29 $20 $F9

.animate
    ; runs every two frames while walking around, and every frame while winding up for an attack
    ld   hl, wEntitiesInertiaTable                ;; 04:6A2B $21 $D0 $C3
    add  hl, bc                                   ;; 04:6A2E $09
    inc  [hl]                                     ;; 04:6A2F $34
    ld   a, [hl]                                  ;; 04:6A30 $7E
    rra                                           ;; 04:6A31 $1F
    rra                                           ;; 04:6A32 $1F
    rra                                           ;; 04:6A33 $1F
    and  $01                                      ;; 04:6A34 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 04:6A36 $C3 $0C $3B

; Angle the iron ball should have at the start of an attack, per attack direction
; 0x0 = left ... 0x4 = up ... 0x8 = right ... 0xC = down ...
KnightIronBallAttackStartingAngle::
    db   $04, $0C, $00, $08

KnightWindingUpHandler::
    call GetEntityTransitionCountdown             ;; 04:6A3D $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 04:6A40 $20 $25

    ; only start an attack if the iron ball is at the correct angle
    call GetEntityDirectionToLink_04              ;; 04:6A42 $CD $55 $6E
    ld   hl, wEntitiesDirectionTable              ;; 04:6A45 $21 $80 $C3
    add  hl, bc                                   ;; 04:6A48 $09
    ld   [hl], e                                  ;; 04:6A49 $73
    ld   d, b                                     ;; 04:6A4A $50
    ld   hl, wEntitiesInertiaTable                ;; 04:6A4B $21 $D0 $C3
    add  hl, bc                                   ;; 04:6A4E $09
    ld   a, [hl]                                  ;; 04:6A4F $7E
    and  $0F                                      ;; 04:6A50 $E6 $0F
    ld   hl, KnightIronBallAttackStartingAngle    ;; 04:6A52 $21 $39 $6A
    add  hl, de                                   ;; 04:6A55 $19
    cp   [hl]                                     ;; 04:6A56 $BE
    jr   nz, .skipIncrementState                  ;; 04:6A57 $20 $0E

    ld   hl, wEntitiesPrivateState1Table          ;; 04:6A59 $21 $B0 $C2
    add  hl, bc                                   ;; 04:6A5C $09
    ld   [hl], $38                                ;; 04:6A5D $36 $38
    ld   hl, wEntitiesPrivateState4Table          ;; 04:6A5F $21 $40 $C4
    add  hl, bc                                   ;; 04:6A62 $09
    ld   [hl], b                                  ;; 04:6A63 $70
    call IncrementEntityState                     ;; 04:6A64 $CD $12 $3B

.skipIncrementState
    jp   KnightWalkingHandler.animate             ;; 04:6A67 $C3 $2B $6A

KnightAttackingHandler::
    call KnightAddIronBallSpeedToPos              ;; 04:6A6A $CD $1D $6E
    ld   hl, wEntitiesPrivateState1Table          ;; 04:6A6D $21 $B0 $C2
    add  hl, bc                                   ;; 04:6A70 $09
    dec  [hl]                                     ;; 04:6A71 $35
    dec  [hl]                                     ;; 04:6A72 $35
    ldh  a, [hFrameCounter]                       ;; 04:6A73 $F0 $E7
    and  $03                                      ;; 04:6A75 $E6 $03
    jr   nz, .skipMoveIronBallSideways            ;; 04:6A77 $20 $05

    ld   hl, wEntitiesPrivateState4Table          ;; 04:6A79 $21 $40 $C4
    add  hl, bc                                   ;; 04:6A7C $09
    inc  [hl]                                     ;; 04:6A7D $34

.skipMoveIronBallSideways
    ld   hl, wEntitiesPrivateState3Table          ;; 04:6A7E $21 $D0 $C2
    add  hl, bc                                   ;; 04:6A81 $09
    ld   a, [hl]                                  ;; 04:6A82 $7E
    and  a                                        ;; 04:6A83 $A7
    jr   z, .incrementState                       ;; 04:6A84 $28 $04

    and  $80                                      ;; 04:6A86 $E6 $80
    jr   z, .return                               ;; 04:6A88 $28 $1C

.incrementState
    ld   [hl], b                                  ;; 04:6A8A $70
    call IncrementEntityState                     ;; 04:6A8B $CD $12 $3B
    ld   [hl], b                                  ;; 04:6A8E $70
    call GetEntityTransitionCountdown             ;; 04:6A8F $CD $05 $0C
    ld   [hl], $10                                ;; 04:6A92 $36 $10
    ld   hl, wEntitiesDirectionTable              ;; 04:6A94 $21 $80 $C3
    add  hl, bc                                   ;; 04:6A97 $09
    ld   e, [hl]                                  ;; 04:6A98 $5E
    ld   d, b                                     ;; 04:6A99 $50
    ld   hl, KnightIronBallAttackStartingAngle    ;; 04:6A9A $21 $39 $6A
    add  hl, de                                   ;; 04:6A9D $19
    ld   a, [hl]                                  ;; 04:6A9E $7E
    add  $08                                      ;; 04:6A9F $C6 $08
    ld   hl, wEntitiesInertiaTable                ;; 04:6AA1 $21 $D0 $C3
    add  hl, bc                                   ;; 04:6AA4 $09
    ld   [hl], a                                  ;; 04:6AA5 $77

.return
    ret                                           ;; 04:6AA6 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
KnightSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0
.variant2
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

; Approximately 0x0A - 0x0A * sin(pi/8 * index)
KnightIronBallSpinningYOffsets::
    db   $0A, $06, $03, $01

; Approximately 0x0A - 0x0A * cos(pi/8 * index)
KnightIronBallSpinningXOffsets::
    db   $00, $01, $03, $06, $0A, $0E, $11, $13, $14, $13, $11, $0E, $0A, $06, $03, $01

RenderKnightAndHandleIronBall::
    ; Draw Knight
    ld   de, KnightSpriteVariants                 ;; 04:6AC7 $11 $A7 $6A
    call RenderActiveEntitySpritesPair            ;; 04:6ACA $CD $C0 $3B

    ; Calculate iron ball position
    ld   hl, wEntitiesPrivateState3Table          ;; 04:6ACD $21 $D0 $C2
    add  hl, bc                                   ;; 04:6AD0 $09
    ld   a, [hl]                                  ;; 04:6AD1 $7E
    and  a                                        ;; 04:6AD2 $A7
    jr   z, .notAttacking                         ;; 04:6AD3 $28 $5C

    xor  a                                        ;; 04:6AD5 $AF
    ldh  [hMultiPurpose0], a                      ;; 04:6AD6 $E0 $D7
    ld   hl, wEntitiesDirectionTable              ;; 04:6AD8 $21 $80 $C3
    add  hl, bc                                   ;; 04:6ADB $09
    ld   a, [hl]                                  ;; 04:6ADC $7E
    ld   hl, wEntitiesPrivateState3Table          ;; 04:6ADD $21 $D0 $C2
    add  hl, bc                                   ;; 04:6AE0 $09
    bit  1, a                                     ;; 04:6AE1 $CB $4F
    jr   nz, .verticalAttack                      ;; 04:6AE3 $20 $26

    ; Horizontal attack (hMultiPurpose0 = 1 if attacking left, else 0)
    cp   DIRECTION_LEFT                           ;; 04:6AE5 $FE $01
    ld   a, [hl]                                  ;; 04:6AE7 $7E
    jr   nz, .attackingRight                      ;; 04:6AE8 $20 $06

    ld   hl, hMultiPurpose0                       ;; 04:6AEA $21 $D7 $FF
    inc  [hl]                                     ;; 04:6AED $34
    cpl                                           ;; 04:6AEE $2F
    inc  a                                        ;; 04:6AEF $3C

.attackingRight
    ld   hl, hActiveEntityPosX                    ;; 04:6AF0 $21 $EE $FF
    add  [hl]                                     ;; 04:6AF3 $86
    ld   [hl], a                                  ;; 04:6AF4 $77
    ld   hl, wEntitiesPrivateState4Table          ;; 04:6AF5 $21 $40 $C4
    add  hl, bc                                   ;; 04:6AF8 $09
    ldh  a, [hMultiPurpose0]                      ;; 04:6AF9 $F0 $D7
    and  a                                        ;; 04:6AFB $A7
    ld   a, [hl]                                  ;; 04:6AFC $7E
    jr   z, .ironBallMovingDown                   ;; 04:6AFD $28 $03

    cpl                                           ;; 04:6AFF $2F
    and  $0F                                      ;; 04:6B00 $E6 $0F

.ironBallMovingDown
    ld   hl, hActiveEntityVisualPosY              ;; 04:6B02 $21 $EC $FF
    add  [hl]                                     ;; 04:6B05 $86
    add  $F3                                      ;; 04:6B06 $C6 $F3
    ld   [hl], a                                  ;; 04:6B08 $77
    jr   .calcIronBallPosEnd                      ;; 04:6B09 $18 $46

.verticalAttack
    ; Vertical attack (hMultiPurpose0 = 1 if attacking up, else 0)
    cp   DIRECTION_UP                             ;; 04:6B0B $FE $02
    ld   a, [hl]                                  ;; 04:6B0D $7E
    jr   nz, .attackingDown                       ;; 04:6B0E $20 $06

    ld   hl, hMultiPurpose0                       ;; 04:6B10 $21 $D7 $FF
    inc  [hl]                                     ;; 04:6B13 $34
    cpl                                           ;; 04:6B14 $2F
    inc  a                                        ;; 04:6B15 $3C

.attackingDown
    ld   hl, hActiveEntityVisualPosY              ;; 04:6B16 $21 $EC $FF
    add  [hl]                                     ;; 04:6B19 $86
    ld   [hl], a                                  ;; 04:6B1A $77
    ld   hl, wEntitiesPrivateState4Table          ;; 04:6B1B $21 $40 $C4
    add  hl, bc                                   ;; 04:6B1E $09
    ldh  a, [hMultiPurpose0]                      ;; 04:6B1F $F0 $D7
    and  a                                        ;; 04:6B21 $A7
    ld   a, [hl]                                  ;; 04:6B22 $7E
    jr   nz, .ironBallMovingRight                 ;; 04:6B23 $20 $03

    cpl                                           ;; 04:6B25 $2F
    and  $0F                                      ;; 04:6B26 $E6 $0F

.ironBallMovingRight
    ld   hl, hActiveEntityPosX                    ;; 04:6B28 $21 $EE $FF
    add  [hl]                                     ;; 04:6B2B $86
    add  $F8                                      ;; 04:6B2C $C6 $F8
    ld   [hl], a                                  ;; 04:6B2E $77
    jr   .calcIronBallPosEnd                      ;; 04:6B2F $18 $20

.notAttacking
    ld   hl, wEntitiesInertiaTable                ;; 04:6B31 $21 $D0 $C3
    add  hl, bc                                   ;; 04:6B34 $09
    ld   a, [hl]                                  ;; 04:6B35 $7E
    and  $0F                                      ;; 04:6B36 $E6 $0F
    ld   e, a                                     ;; 04:6B38 $5F
    ld   d, $00                                   ;; 04:6B39 $16 $00
    ld   hl, KnightIronBallSpinningYOffsets       ;; 04:6B3B $21 $B3 $6A
    add  hl, de                                   ;; 04:6B3E $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:6B3F $F0 $EC
    add  [hl]                                     ;; 04:6B41 $86
    add  $F0                                      ;; 04:6B42 $C6 $F0
    ldh  [hActiveEntityVisualPosY], a             ;; 04:6B44 $E0 $EC
    ld   hl, KnightIronBallSpinningXOffsets       ;; 04:6B46 $21 $B7 $6A
    add  hl, de                                   ;; 04:6B49 $19
    ldh  a, [hActiveEntityPosX]                   ;; 04:6B4A $F0 $EE
    add  [hl]                                     ;; 04:6B4C $86
    add  $F3                                      ;; 04:6B4D $C6 $F3
    ldh  [hActiveEntityPosX], a                   ;; 04:6B4F $E0 $EE

.calcIronBallPosEnd
    ; Draw iron ball
    ld   a, $02                                   ;; 04:6B51 $3E $02
    ldh  [hActiveEntitySpriteVariant], a          ;; 04:6B53 $E0 $F1
    ld   de, KnightSpriteVariants                 ;; 04:6B55 $11 $A7 $6A
    call RenderActiveEntitySpritesPair            ;; 04:6B58 $CD $C0 $3B
    ld   hl, wEntitiesPrivateState4Table          ;; 04:6B5B $21 $40 $C4
    add  hl, bc                                   ;; 04:6B5E $09
    ld   a, [hl]                                  ;; 04:6B5F $7E
    and  a                                        ;; 04:6B60 $A7
    ret  z                                        ;; 04:6B61 $C8

    ld   hl, wEntitiesPrivateState1Table          ;; 04:6B62 $21 $B0 $C2
    add  hl, bc                                   ;; 04:6B65 $09
    ld   a, [hl]                                  ;; 04:6B66 $7E
    and  $80                                      ;; 04:6B67 $E6 $80
    jr   nz, .noSwordClink                        ;; 04:6B69 $20 $11

    call GetEntityPrivateCountdown1               ;; 04:6B6B $CD $00 $0C
    jr   nz, .noSwordClink                        ;; 04:6B6E $20 $0C

    ; Sword clinks off iron ball during the first half of an attack
    ld   hl, wEntitiesOptions1Table               ;; 04:6B70 $21 $30 $C4
    add  hl, bc                                   ;; 04:6B73 $09
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF        ;; 04:6B74 $36 $40
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:6B76 $CD $39 $3B
    call func_004_6BE1                            ;; 04:6B79 $CD $E1 $6B

.noSwordClink
    ; Draw chain
    ldh  a, [hActiveEntityPosX]                   ;; 04:6B7C $F0 $EE
    add  $04                                      ;; 04:6B7E $C6 $04
    ld   hl, wEntitiesPosXTable                   ;; 04:6B80 $21 $00 $C2
    add  hl, bc                                   ;; 04:6B83 $09
    sub  [hl]                                     ;; 04:6B84 $96
    sra  a                                        ;; 04:6B85 $CB $2F
    sra  a                                        ;; 04:6B87 $CB $2F
    ldh  [hMultiPurpose0], a                      ;; 04:6B89 $E0 $D7
    ldh  [hMultiPurpose2], a                      ;; 04:6B8B $E0 $D9

    ldh  a, [hActiveEntityVisualPosY]             ;; 04:6B8D $F0 $EC
    ld   hl, wEntitiesPosYTable                   ;; 04:6B8F $21 $10 $C2
    add  hl, bc                                   ;; 04:6B92 $09
    sub  [hl]                                     ;; 04:6B93 $96
    sra  a                                        ;; 04:6B94 $CB $2F
    sra  a                                        ;; 04:6B96 $CB $2F
    ldh  [hMultiPurpose1], a                      ;; 04:6B98 $E0 $D8
    ldh  [hMultiPurpose3], a                      ;; 04:6B9A $E0 $DA
    ld   a, [wOAMNextAvailableSlot]               ;; 04:6B9C $FA $C0 $C3
    ld   e, a                                     ;; 04:6B9F $5F
    ld   d, $00                                   ;; 04:6BA0 $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 04:6BA2 $21 $30 $C0
    add  hl, de                                   ;; 04:6BA5 $19
    ld   e, l                                     ;; 04:6BA6 $5D
    ld   d, h                                     ;; 04:6BA7 $54
    call CopyEntityPositionToActivePosition       ;; 04:6BA8 $CD $8A $3D
    ld   a, $03                                   ;; 04:6BAB $3E $03

.loop
    ldh  [hMultiPurpose4], a                      ;; 04:6BAD $E0 $DB
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:6BAF $F0 $EC
    ld   hl, hMultiPurpose1                       ;; 04:6BB1 $21 $D8 $FF
    add  [hl]                                     ;; 04:6BB4 $86
    ld   [de], a                                  ;; 04:6BB5 $12
    inc  de                                       ;; 04:6BB6 $13
    ldh  a, [hActiveEntityPosX]                   ;; 04:6BB7 $F0 $EE
    ld   hl, hMultiPurpose0                       ;; 04:6BB9 $21 $D7 $FF
    add  [hl]                                     ;; 04:6BBC $86
    ld   [de], a                                  ;; 04:6BBD $12
    inc  de                                       ;; 04:6BBE $13
    ld   a, $24                                   ;; 04:6BBF $3E $24
    ld   [de], a                                  ;; 04:6BC1 $12
    inc  de                                       ;; 04:6BC2 $13
    ld   a, OAM_GBC_PAL_0 | OAMF_PAL0             ;; 04:6BC3 $3E $00
    ld   [de], a                                  ;; 04:6BC5 $12
    inc  de                                       ;; 04:6BC6 $13
    ldh  a, [hMultiPurpose0]                      ;; 04:6BC7 $F0 $D7
    ld   hl, hMultiPurpose2                       ;; 04:6BC9 $21 $D9 $FF
    add  [hl]                                     ;; 04:6BCC $86
    ldh  [hMultiPurpose0], a                      ;; 04:6BCD $E0 $D7
    ldh  a, [hMultiPurpose1]                      ;; 04:6BCF $F0 $D8
    ld   hl, hMultiPurpose3                       ;; 04:6BD1 $21 $DA $FF
    add  [hl]                                     ;; 04:6BD4 $86
    ldh  [hMultiPurpose1], a                      ;; 04:6BD5 $E0 $D8
    ldh  a, [hMultiPurpose4]                      ;; 04:6BD7 $F0 $DB
    dec  a                                        ;; 04:6BD9 $3D
    jr   nz, .loop                                ;; 04:6BDA $20 $D1

    ld   a, $03                                   ;; 04:6BDC $3E $03
    jp   func_015_7964_trampoline                 ;; 04:6BDE $C3 $A0 $3D

func_004_6BE1::
    ldh  a, [hActiveEntityPosX]                   ;; 04:6BE1 $F0 $EE
    ldh  [hMultiPurpose4], a                      ;; 04:6BE3 $E0 $DB
    swap a                                        ;; 04:6BE5 $CB $37
    and  $0F                                      ;; 04:6BE7 $E6 $0F
    ld   e, a                                     ;; 04:6BE9 $5F
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:6BEA $F0 $EC
    sub  $10                                      ;; 04:6BEC $D6 $10
    add  $04                                      ;; 04:6BEE $C6 $04
    ldh  [hMultiPurpose5], a                      ;; 04:6BF0 $E0 $DC
    and  $F0                                      ;; 04:6BF2 $E6 $F0
    or   e                                        ;; 04:6BF4 $B3
    ld   e, a                                     ;; 04:6BF5 $5F
    ld   d, $00                                   ;; 04:6BF6 $16 $00
    ld   hl, wRoomObjects                         ;; 04:6BF8 $21 $11 $D7
    ld   a, h                                     ;; 04:6BFB $7C
    add  hl, de                                   ;; 04:6BFC $19
    ld   h, a                                     ;; 04:6BFD $67
    ld   a, [hl]                                  ;; 04:6BFE $7E
    ldh  [hObjectUnderEntity], a                  ;; 04:6BFF $E0 $AF
    ld   e, a                                     ;; 04:6C01 $5F
    ld   a, [wIsIndoor]                           ;; 04:6C02 $FA $A5 $DB
    ld   d, a                                     ;; 04:6C05 $57
    call GetObjectPhysicsFlags_trampoline         ;; 04:6C06 $CD $26 $2A
    cp   OBJ_PHYSICS_NONE                         ;; 04:6C09 $FE $00
    ret  z                                        ;; 04:6C0B $C8
    cp   OBJ_PHYSICS_SOLID                        ;; 04:6C0C $FE $01
    ret  nz                                       ;; 04:6C0E $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 04:6C0F $21 $B0 $C2
    add  hl, bc                                   ;; 04:6C12 $09
    ld   a, [hl]                                  ;; 04:6C13 $7E
    cpl                                           ;; 04:6C14 $2F
    inc  a                                        ;; 04:6C15 $3C
    ld   [hl], a                                  ;; 04:6C16 $77
    call GetEntityPrivateCountdown1               ;; 04:6C17 $CD $00 $0C
    ld   [hl], $08                                ;; 04:6C1A $36 $08
    ld   a, JINGLE_SWORD_POKING                   ;; 04:6C1C $3E $07
    ldh  [hJingle], a                             ;; 04:6C1E $E0 $F2

.createSwordPokeVfx
    ldh  a, [hActiveEntityPosX]                   ;; 04:6C20 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 04:6C22 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:6C24 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 04:6C26 $E0 $D8
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ;; 04:6C28 $3E $05
    jp   AddTranscientVfx                         ;; 04:6C2A $C3 $C7 $0C
