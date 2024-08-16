; Used to choose the correct head sprite when X distance to Link is greater than Y distance
; Indexed by:
;  - Row: quadrant (relative to the enemy) where Link is located (down-right, up-right, down-left, up-left)
;  - Column: absolute value of the Y component of the vector towards Link with length 0x1F, divided by 4
HorizontalLungeDirections::
    db $00, $00, $01, $01, $01, $02, $02, $02
    db $00, $00, $0F, $0F, $0F, $0E, $0E, $0E
    db $08, $08, $07, $07, $07, $06, $06, $06
    db $08, $08, $09, $09, $09, $0A, $0A, $0A

; Used to choose the correct head sprite when Y distance to Link is greater than X distance
; Indexed by:
;  - Row: quadrant (relative to the enemy) where Link is located (down-right, up-right, down-left, up-left)
;  - Column: absolute value of the X component of the vector towards Link with length 0x1F, divided by 4
VerticalLungeDirections::
    db $04, $04, $03, $03, $03, $02, $02, $02
    db $0C, $0C, $0D, $0D, $0D, $0E, $0E, $0E
    db $04, $04, $05, $05, $05, $06, $06, $06
    db $0C, $0C, $0B, $0B, $0B, $0A, $0A, $0A

; 0x0 = right ... 0x4 = down ... 0x8 = left ... 0xC = up
PincerGetLungeDirection::
    ldh  a, [hMultiPurpose0]                      ;; 07:52E0 $F0 $D7
    rlca                                          ;; 07:52E2 $07
    and  $01                                      ;; 07:52E3 $E6 $01
    ld   e, a                                     ;; 07:52E5 $5F
    ldh  a, [hMultiPurpose1]                      ;; 07:52E6 $F0 $D8
    rlca                                          ;; 07:52E8 $07
    rla                                           ;; 07:52E9 $17
    and  $02                                      ;; 07:52EA $E6 $02
    or   e                                        ;; 07:52EC $B3
    rla                                           ;; 07:52ED $17
    rla                                           ;; 07:52EE $17
    rla                                           ;; 07:52EF $17
    and  $18                                      ;; 07:52F0 $E6 $18
    ld   h, a                                     ;; 07:52F2 $67
    ldh  a, [hMultiPurpose1]                      ;; 07:52F3 $F0 $D8
    bit  7, a                                     ;; 07:52F5 $CB $7F
    jr   z, .positiveX                            ;; 07:52F7 $28 $02

    cpl                                           ;; 07:52F9 $2F
    inc  a                                        ;; 07:52FA $3C

.positiveX
    ld   d, a                                     ;; 07:52FB $57
    ldh  a, [hMultiPurpose0]                      ;; 07:52FC $F0 $D7
    bit  7, a                                     ;; 07:52FE $CB $7F
    jr   z, .positiveY                            ;; 07:5300 $28 $02

    cpl                                           ;; 07:5302 $2F
    inc  a                                        ;; 07:5303 $3C

.positiveY
    cp   d                                        ;; 07:5304 $BA
    jr   nc, .vertical                            ;; 07:5305 $30 $0D

    sra  a                                        ;; 07:5307 $CB $2F
    sra  a                                        ;; 07:5309 $CB $2F
    add  h                                        ;; 07:530B $84
    ld   e, a                                     ;; 07:530C $5F
    ld   d, b                                     ;; 07:530D $50
    ld   hl, HorizontalLungeDirections            ;; 07:530E $21 $A0 $52
    add  hl, de                                   ;; 07:5311 $19
    ld   a, [hl]                                  ;; 07:5312 $7E
    ret                                           ;; 07:5313 $C9

.vertical
    ld   a, d                                     ;; 07:5314 $7A
    sra  a                                        ;; 07:5315 $CB $2F
    sra  a                                        ;; 07:5317 $CB $2F
    add  h                                        ;; 07:5319 $84
    ld   e, a                                     ;; 07:531A $5F
    ld   d, b                                     ;; 07:531B $50
    ld   hl, VerticalLungeDirections              ;; 07:531C $21 $C0 $52
    add  hl, de                                   ;; 07:531F $19
    ld   a, [hl]                                  ;; 07:5320 $7E
    ret                                           ;; 07:5321 $C9

PincerEntityHandler::
    ld   hl, wEntitiesGroundStatusTable           ;; 07:5322 $21 $70 $C4
    add  hl, bc                                   ;; 07:5325 $09
    ld   [hl], b                                  ;; 07:5326 $70
    ld   hl, wEntitiesRecoilVelocityX             ;; 07:5327 $21 $F0 $C3
    add  hl, bc                                   ;; 07:532A $09
    ld   [hl], b                                  ;; 07:532B $70
    ld   hl, wEntitiesRecoilVelocityY             ;; 07:532C $21 $00 $C4
    add  hl, bc                                   ;; 07:532F $09
    ld   [hl], b                                  ;; 07:5330 $70
    call RenderPincer                             ;; 07:5331 $CD $53 $54
    call ReturnIfNonInteractive_07                ;; 07:5334 $CD $96 $7D
    call DecrementEntityIgnoreHitsCountdown       ;; 07:5337 $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 07:533A $F0 $F0
    JP_TABLE                                      ;; 07:533C
._00 dw PincerState0Handler                       ;; 07:533D
._01 dw PincerState1Handler                       ;; 07:533F
._02 dw PincerState2Handler                       ;; 07:5341
._03 dw PincerState3Handler                       ;; 07:5343
._04 dw PincerState4Handler                       ;; 07:5345
._05 dw PincerState5Handler                       ;; 07:5347

PincerState0Handler::
    ldh  a, [hActiveEntityPosX]                   ;; 07:5349 $F0 $EE
    ld   hl, wEntitiesPrivateState1Table          ;; 07:534B $21 $B0 $C2
    add  hl, bc                                   ;; 07:534E $09
    ld   [hl], a                                  ;; 07:534F $77
    ldh  a, [hActiveEntityPosY]                   ;; 07:5350 $F0 $EF
    ld   hl, wEntitiesPrivateState2Table          ;; 07:5352 $21 $C0 $C2
    add  hl, bc                                   ;; 07:5355 $09
    ld   [hl], a                                  ;; 07:5356 $77
    jp   IncrementEntityState                     ;; 07:5357 $C3 $12 $3B

; Hiding
PincerState1Handler::
    call GetEntityTransitionCountdown             ;; 07:535A $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:535D $20 $20

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:535F $21 $40 $C3
    add  hl, bc                                   ;; 07:5362 $09
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 07:5363 $CB $F6
    call GetEntityXDistanceToLink_07              ;; 07:5365 $CD $5D $7E
    add  $20                                      ;; 07:5368 $C6 $20
    cp   $40                                      ;; 07:536A $FE $40
    jr   nc, .skipIncrementState                  ;; 07:536C $30 $11

    call GetEntityYDistanceToLink_07              ;; 07:536E $CD $6D $7E
    add  $20                                      ;; 07:5371 $C6 $20
    cp   $40                                      ;; 07:5373 $FE $40
    jr   nc, .skipIncrementState                  ;; 07:5375 $30 $08

    call GetEntityTransitionCountdown             ;; 07:5377 $CD $05 $0C
    ld   [hl], $30                                ;; 07:537A $36 $30
    call IncrementEntityState                     ;; 07:537C $CD $12 $3B

.skipIncrementState
    xor  a                                        ;; 07:537F $AF
    jp   SetEntitySpriteVariant                   ;; 07:5380 $C3 $0C $3B

; Preparing to lunge
PincerState2Handler::
    call GetEntityTransitionCountdown             ;; 07:5383 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:5386 $20 $16

    ld   hl, wEntitiesPrivateState3Table          ;; 07:5388 $21 $D0 $C2
    add  hl, bc                                   ;; 07:538B $09
    ld   a, [hl]                                  ;; 07:538C $7E
    call SetEntitySpriteVariant                   ;; 07:538D $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 07:5390 $CD $05 $0C
    ld   [hl], $18                                ;; 07:5393 $36 $18
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:5395 $21 $40 $C3
    add  hl, bc                                   ;; 07:5398 $09
    res  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 07:5399 $CB $B6
    jp   IncrementEntityState                     ;; 07:539B $C3 $12 $3B

.skipIncrementState
    cp   $10                                      ;; 07:539E $FE $10
    jr   nz, .initLungeEnd                        ;; 07:53A0 $20 $16

    ld   a, $1F                                   ;; 07:53A2 $3E $1F
    call ApplyVectorTowardsLink_trampoline        ;; 07:53A4 $CD $AA $3B
    call PincerGetLungeDirection                  ;; 07:53A7 $CD $E0 $52
    sra  a                                        ;; 07:53AA $CB $2F
    add  $02                                      ;; 07:53AC $C6 $02
    ld   hl, wEntitiesPrivateState3Table          ;; 07:53AE $21 $D0 $C2
    add  hl, bc                                   ;; 07:53B1 $09
    ld   [hl], a                                  ;; 07:53B2 $77
    ld   a, $18                                   ;; 07:53B3 $3E $18
    call ApplyVectorTowardsLink_trampoline        ;; 07:53B5 $CD $AA $3B

.initLungeEnd
    ld   a, $01                                   ;; 07:53B8 $3E $01
    jp   SetEntitySpriteVariant                   ;; 07:53BA $C3 $0C $3B

; Lunging
PincerState3Handler::
    call UpdateEntityPosWithSpeed_07              ;; 07:53BD $CD $0A $7E
    call GetEntityTransitionCountdown             ;; 07:53C0 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:53C3 $20 $05

    ld   [hl], $20                                ;; 07:53C5 $36 $20
    call IncrementEntityState                     ;; 07:53C7 $CD $12 $3B

.skipIncrementState
    jp   DefaultEnemyDamageCollisionHandler_trampoline ;; 07:53CA $C3 $39 $3B

; After lunging
PincerState4Handler::
    call GetEntityTransitionCountdown             ;; 07:53CD $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:53D0 $20 $03

    call IncrementEntityState                     ;; 07:53D2 $CD $12 $3B

.skipIncrementState
    jp   DefaultEnemyDamageCollisionHandler_trampoline ;; 07:53D5 $C3 $39 $3B

; Returning to hole
PincerState5Handler::
    ldh  a, [hLinkPositionX]                      ;; 07:53D8 $F0 $98
    push af                                       ;; 07:53DA $F5
    ldh  a, [hLinkPositionY]                      ;; 07:53DB $F0 $99
    push af                                       ;; 07:53DD $F5
    ld   hl, wEntitiesPrivateState1Table          ;; 07:53DE $21 $B0 $C2
    add  hl, bc                                   ;; 07:53E1 $09
    ld   a, [hl]                                  ;; 07:53E2 $7E
    ldh  [hLinkPositionX], a                      ;; 07:53E3 $E0 $98
    ld   hl, wEntitiesPrivateState2Table          ;; 07:53E5 $21 $C0 $C2
    add  hl, bc                                   ;; 07:53E8 $09
    ld   a, [hl]                                  ;; 07:53E9 $7E
    ldh  [hLinkPositionY], a                      ;; 07:53EA $E0 $99
    ld   a, $10                                   ;; 07:53EC $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 07:53EE $CD $AA $3B
    call GetEntityXDistanceToLink_07              ;; 07:53F1 $CD $5D $7E
    add  $02                                      ;; 07:53F4 $C6 $02
    cp   $04                                      ;; 07:53F6 $FE $04
    jr   nc, .skipIncrementState                  ;; 07:53F8 $30 $25

    call GetEntityYDistanceToLink_07              ;; 07:53FA $CD $6D $7E
    add  $02                                      ;; 07:53FD $C6 $02
    cp   $04                                      ;; 07:53FF $FE $04
    jr   nc, .skipIncrementState                  ;; 07:5401 $30 $1C

    ld   hl, wEntitiesPosXTable                   ;; 07:5403 $21 $00 $C2
    add  hl, bc                                   ;; 07:5406 $09
    ldh  a, [hLinkPositionX]                      ;; 07:5407 $F0 $98
    ld   [hl], a                                  ;; 07:5409 $77
    ld   hl, wEntitiesPosYTable                   ;; 07:540A $21 $10 $C2
    add  hl, bc                                   ;; 07:540D $09
    ldh  a, [hLinkPositionY]                      ;; 07:540E $F0 $99
    ld   [hl], a                                  ;; 07:5410 $77
    xor  a                                        ;; 07:5411 $AF
    call SetEntitySpriteVariant                   ;; 07:5412 $CD $0C $3B
    call IncrementEntityState                     ;; 07:5415 $CD $12 $3B
    ld   [hl], $01                                ;; 07:5418 $36 $01
    call GetEntityTransitionCountdown             ;; 07:541A $CD $05 $0C
    ld   [hl], $20                                ;; 07:541D $36 $20

.skipIncrementState
    pop  af                                       ;; 07:541F $F1
    ldh  [hLinkPositionY], a                      ;; 07:5420 $E0 $99
    pop  af                                       ;; 07:5422 $F1
    ldh  [hLinkPositionX], a                      ;; 07:5423 $E0 $98
    call UpdateEntityPosWithSpeed_07              ;; 07:5425 $CD $0A $7E
    jp   DefaultEnemyDamageCollisionHandler_trampoline ;; 07:5428 $C3 $39 $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PincerSpriteVariants::
; Hidden
.variant0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Eyes
.variant1
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
; Right
.variant2
    db $64, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $62, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
; Down-right
.variant3
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
; Down
.variant4
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
; Down-left
.variant5
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0
; Left
.variant6
    db $62, OAM_GBC_PAL_2 | OAMF_PAL0
    db $64, OAM_GBC_PAL_2 | OAMF_PAL0
; Up-left
.variant7
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
; Up
.variant8
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
; Up-right
.variant9
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

RenderPincer::
    ; Render head
    ld   de, PincerSpriteVariants                 ;; 07:5453 $11 $2B $54
    call RenderActiveEntitySpritesPair            ;; 07:5456 $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ;; 07:5459 $F0 $F0
    cp   $03                                      ;; 07:545B $FE $03
    ret  c                                        ;; 07:545D $D8

    ; Render body
    ldh  a, [hActiveEntityPosX]                   ;; 07:545E $F0 $EE
    ld   hl, wEntitiesPrivateState1Table          ;; 07:5460 $21 $B0 $C2
    add  hl, bc                                   ;; 07:5463 $09
    sub  [hl]                                     ;; 07:5464 $96
    sra  a                                        ;; 07:5465 $CB $2F
    sra  a                                        ;; 07:5467 $CB $2F
    ldh  [hMultiPurpose0], a                      ;; 07:5469 $E0 $D7
    ldh  [hMultiPurpose2], a                      ;; 07:546B $E0 $D9
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:546D $F0 $EC
    ld   hl, wEntitiesPrivateState2Table          ;; 07:546F $21 $C0 $C2
    add  hl, bc                                   ;; 07:5472 $09
    sub  [hl]                                     ;; 07:5473 $96
    sra  a                                        ;; 07:5474 $CB $2F
    sra  a                                        ;; 07:5476 $CB $2F
    ldh  [hMultiPurpose1], a                      ;; 07:5478 $E0 $D8
    ldh  [hMultiPurpose3], a                      ;; 07:547A $E0 $DA
    ld   a, [wOAMNextAvailableSlot]               ;; 07:547C $FA $C0 $C3
    ld   e, a                                     ;; 07:547F $5F
    ld   d, $00                                   ;; 07:5480 $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 07:5482 $21 $30 $C0
    add  hl, de                                   ;; 07:5485 $19
    ld   e, l                                     ;; 07:5486 $5D
    ld   d, h                                     ;; 07:5487 $54
    ld   a, $03                                   ;; 07:5488 $3E $03

.loop
    ldh  [hMultiPurpose4], a                      ;; 07:548A $E0 $DB
    ld   hl, wEntitiesPrivateState2Table          ;; 07:548C $21 $C0 $C2
    add  hl, bc                                   ;; 07:548F $09
    ldh  a, [hMultiPurpose1]                      ;; 07:5490 $F0 $D8
    add  [hl]                                     ;; 07:5492 $86
    ld   [de], a                                  ;; 07:5493 $12
    inc  de                                       ;; 07:5494 $13
    ld   hl, wEntitiesPrivateState1Table          ;; 07:5495 $21 $B0 $C2
    add  hl, bc                                   ;; 07:5498 $09
    ldh  a, [hMultiPurpose0]                      ;; 07:5499 $F0 $D7
    add  [hl]                                     ;; 07:549B $86
    add  $04                                      ;; 07:549C $C6 $04
    ld   [de], a                                  ;; 07:549E $12
    inc  de                                       ;; 07:549F $13
    ld   a, $6A                                   ;; 07:54A0 $3E $6A
    ld   [de], a                                  ;; 07:54A2 $12
    inc  de                                       ;; 07:54A3 $13
    ld   a, OAM_GBC_PAL_2 | OAMF_PAL0             ;; 07:54A4 $3E $02
    ld   [de], a                                  ;; 07:54A6 $12
    inc  de                                       ;; 07:54A7 $13
    ldh  a, [hMultiPurpose0]                      ;; 07:54A8 $F0 $D7
    ld   hl, hMultiPurpose2                       ;; 07:54AA $21 $D9 $FF
    add  [hl]                                     ;; 07:54AD $86
    ldh  [hMultiPurpose0], a                      ;; 07:54AE $E0 $D7
    ldh  a, [hMultiPurpose1]                      ;; 07:54B0 $F0 $D8
    ld   hl, hMultiPurpose3                       ;; 07:54B2 $21 $DA $FF
    add  [hl]                                     ;; 07:54B5 $86
    ldh  [hMultiPurpose1], a                      ;; 07:54B6 $E0 $D8
    ldh  a, [hMultiPurpose4]                      ;; 07:54B8 $F0 $DB
    dec  a                                        ;; 07:54BA $3D
    jr   nz, .loop                                ;; 07:54BB $20 $CD

    ld   a, $03                                   ;; 07:54BD $3E $03
    jp   func_015_7964_trampoline
