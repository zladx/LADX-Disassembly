; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MadBomberSpriteVariants::
.variant0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0
.variant4
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

MadBomberPositionXValues::
    db   $28, $38, $58, $58, $78, $88, $28, $88

MadBomberPositionYValues::
    db   $40, $70, $20, $50, $70, $40, $40, $40

MadBomberEntityHandler::
    ldh  a, [hRoomStatus]                         ;; 06:414A $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 06:414C $E6 $10
    jp   nz, ClearEntityStatus_06                 ;; 06:414E $C2 $DB $65

    ld   hl, wEntitiesDroppedItemTable            ;; 06:4151 $21 $E0 $C4
    add  hl, bc                                   ;; 06:4154 $09
    ld   [hl], ENTITY_HIDING_SLIME_KEY            ;; 06:4155 $36 $3C
    ld   hl, wEntitiesLoadOrderTable              ;; 06:4157 $21 $60 $C4
    add  hl, bc                                   ;; 06:415A $09
    ld   [hl], $FF                                ;; 06:415B $36 $FF
    ld   de, MadBomberSpriteVariants              ;; 06:415D $11 $26 $41
    call RenderActiveEntitySpritesPair            ;; 06:4160 $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:4163 $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ;; 06:4166 $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 06:4169 $F0 $F0
    JP_TABLE                                      ;; 06:416B
._00 dw MadBomberState0Handler
._01 dw MadBomberState1Handler
._02 dw MadBomberState2Handler
._03 dw MadBomberState3Handler
._04 dw MadBomberState4Handler

MadBomberState0Handler::
    call GetEntityTransitionCountdown             ;; 06:4176 $CD $05 $0C
    ld   [hl], $40                                ;; 06:4179 $36 $40
    jp   IncrementEntityState                     ;; 06:417B $C3 $12 $3B

; Choose hole
MadBomberState1Handler::
    call GetEntityTransitionCountdown             ;; 06:417E $CD $05 $0C
    ret  nz                                       ;; 06:4181 $C0

    ; Randomly choose a hole to pop out from
    call GetRandomByte                            ;; 06:4182 $CD $0D $28
    and  $07                                      ;; 06:4185 $E6 $07
    ld   e, a                                     ;; 06:4187 $5F
    ld   d, b                                     ;; 06:4188 $50
    ld   hl, MadBomberPositionXValues             ;; 06:4189 $21 $3A $41
    add  hl, de                                   ;; 06:418C $19
    ld   a, [hl]                                  ;; 06:418D $7E
    ld   hl, wEntitiesPosXTable                   ;; 06:418E $21 $00 $C2
    add  hl, bc                                   ;; 06:4191 $09
    ld   [hl], a                                  ;; 06:4192 $77
    ld   hl, MadBomberPositionYValues             ;; 06:4193 $21 $42 $41
    add  hl, de                                   ;; 06:4196 $19
    ld   a, [hl]                                  ;; 06:4197 $7E
    ld   hl, wEntitiesPosYTable                   ;; 06:4198 $21 $10 $C2
    add  hl, bc                                   ;; 06:419B $09
    ld   [hl], a                                  ;; 06:419C $77

    call GetEntityXDistanceToLink_06              ;; 06:419D $CD $94 $65
    add  $20                                      ;; 06:41A0 $C6 $20
    cp   $40                                      ;; 06:41A2 $FE $40
    jr   nc, .incrementState                      ;; 06:41A4 $30 $08

    call GetEntityYDistanceToLink_06              ;; 06:41A6 $CD $A4 $65
    add  $20                                      ;; 06:41A9 $C6 $20
    cp   $40                                      ;; 06:41AB $FE $40
    ret  c                                        ;; 06:41AD $D8

.incrementState
    ; Only increment state if Link's more than 0x20 units away from the enemy (horizontally or vertically)
    call GetEntityTransitionCountdown             ;; 06:41AE $CD $05 $0C
    ld   [hl], $18                                ;; 06:41B1 $36 $18
    jp   IncrementEntityState                     ;; 06:41B3 $C3 $12 $3B

; Pop out
MadBomberState2Handler::
    call GetEntityTransitionCountdown             ;; 06:41B6 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 06:41B9 $20 $05

    ld   [hl], $30                                ;; 06:41BB $36 $30
    jp   IncrementEntityState                     ;; 06:41BD $C3 $12 $3B

.skipIncrementState
    cp   $0C                                      ;; 06:41C0 $FE $0C
    ld   a, $01                                   ;; 06:41C2 $3E $01
    jr   nc, .spriteVariant1                      ;; 06:41C4 $30 $01

    inc  a                                        ;; 06:41C6 $3C

.spriteVariant1
    jp   SetEntitySpriteVariant                   ;; 06:41C7 $C3 $0C $3B

; Wait and then try to throw bomb
MadBomberState3Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:41CA $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 06:41CD $CD $05 $0C
    jr   nz, .animate                             ;; 06:41D0 $20 $46

    ; If flashing, don't throw a bomb
    ld   [hl], $10                                ;; 06:41D2 $36 $10
    call IncrementEntityState                     ;; 06:41D4 $CD $12 $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 06:41D7 $21 $20 $C4
    add  hl, bc                                   ;; 06:41DA $09
    ld   a, [hl]                                  ;; 06:41DB $7E
    and  a                                        ;; 06:41DC $A7
    jr   nz, .return                              ;; 06:41DD $20 $38

    ld   a, ENTITY_BOMB                           ;; 06:41DF $3E $02
    call SpawnNewEntity_trampoline                ;; 06:41E1 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:41E4 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 06:41E6 $21 $00 $C2
    add  hl, de                                   ;; 06:41E9 $19
    ld   [hl], a                                  ;; 06:41EA $77
    ldh  a, [hMultiPurpose1]                      ;; 06:41EB $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 06:41ED $21 $10 $C2
    add  hl, de                                   ;; 06:41F0 $19
    ld   [hl], a                                  ;; 06:41F1 $77
    ld   hl, wEntitiesPosZTable                   ;; 06:41F2 $21 $10 $C3
    add  hl, de                                   ;; 06:41F5 $19
    ld   [hl], $04                                ;; 06:41F6 $36 $04

.throwBomb:
    ld   hl, wEntitiesSpeedZTable                 ;; 06:41F8 $21 $20 $C3
    add  hl, de                                   ;; 06:41FB $19
    ld   [hl], $18                                ;; 06:41FC $36 $18
    ld   hl, wEntitiesTransitionCountdownTable    ;; 06:41FE $21 $E0 $C2
    add  hl, de                                   ;; 06:4201 $19
    ld   [hl], $40                                ;; 06:4202 $36 $40
    ld   hl, wEntitiesPrivateState4Table          ;; 06:4204 $21 $40 $C4
    add  hl, de                                   ;; 06:4207 $19
    ld   [hl], $01                                ;; 06:4208 $36 $01
    push bc                                       ;; 06:420A $C5
    ld   c, e                                     ;; 06:420B $4B
    ld   b, d                                     ;; 06:420C $42
    ld   a, $10                                   ;; 06:420D $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 06:420F $CD $AA $3B
    pop  bc                                       ;; 06:4212 $C1
    ld   a, JINGLE_FALL_DOWN                      ;; 06:4213 $3E $08
    ldh  [hJingle], a                             ;; 06:4215 $E0 $F2

.return:
    ret                                           ;; 06:4217 $C9

.animate:
    and  $20                                      ;; 06:4218 $E6 $20
    ld   a, $03                                   ;; 06:421A $3E $03
    jr   nz, .spriteVariant3                      ;; 06:421C $20 $01

    inc  a                                        ;; 06:421E $3C

.spriteVariant3
    jp   SetEntitySpriteVariant                   ;; 06:421F $C3 $0C $3B

; Hide again
MadBomberState4Handler::
    call GetEntityTransitionCountdown             ;; 06:4222 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 06:4225 $20 $09

    call IncrementEntityState                     ;; 06:4227 $CD $12 $3B
    ld   [hl], b                                  ;; 06:422A $70
    ld   a, $FF                                   ;; 06:422B $3E $FF
    jp   SetEntitySpriteVariant                   ;; 06:422D $C3 $0C $3B

.skipIncrementState
    cp   $08                                      ;; 06:4230 $FE $08
    ld   a, $01                                   ;; 06:4232 $3E $01
    jr   c, .spriteVariant1                       ;; 06:4234 $38 $01

    inc  a                                        ;; 06:4236 $3C

.spriteVariant1
    jp   SetEntitySpriteVariant                   ;; 06:4237 $C3 $0C $3B
