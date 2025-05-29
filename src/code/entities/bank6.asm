; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

include "code/entities/06_richard.asm"
include "code/entities/06_mad_bomber.asm"
include "code/entities/06_anti_kirby.asm"
include "code/entities/06_smasher.asm"
include "code/entities/06_three_of_a_kind.asm"
include "code/entities/06_stalfos_aggressive.asm"
include "code/entities/06_cue_ball.asm"
include "code/entities/06_raisable_block_unused.asm"
include "code/entities/06_hard_hat_beetle.asm"
include "code/entities/06_hinox.asm"
include "code/entities/06_armos_knight.asm"
include "code/entities/06_desert_lanmola.asm"
include "code/entities/06_yip_yip.asm"
include "code/entities/06_madam_meow_meow.asm"
include "code/entities/06_grandpa_ulrira.asm"
include "code/entities/06_crow.asm"
include "code/entities/06_crazy_tracy.asm"
include "code/entities/06_kid_71_72.asm"
include "code/entities/06_kid_70_73.asm"
include "code/entities/06_giant_goponga_flower.asm"
include "code/entities/06_goponga_projectile.asm"
include "code/entities/06_goponga_flower.asm"

; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

PushLinkOutOfEntity_06::
    call CheckLinkCollisionWithEnemy_trampoline   ;; 06:641A $CD $5A $3B
    jr   nc, ret_006_643C                         ;; 06:641D $30 $1D

.forcePush
    call CopyLinkFinalPositionToPosition          ;; 06:641F $CD $BE $0C
    call ResetPegasusBoots                        ;; 06:6422 $CD $B6 $0C
    ld   a, [wC1A6]                               ;; 06:6425 $FA $A6 $C1
    and  a                                        ;; 06:6428 $A7
    jr   z, ret_006_643C                          ;; 06:6429 $28 $11

    ld   e, a                                     ;; 06:642B $5F
    ld   d, b                                     ;; 06:642C $50
    ld   hl, wEntitiesPrivateState5Table+15       ;; 06:642D $21 $9F $C3
    add  hl, de                                   ;; 06:6430 $19
    ld   a, [hl]                                  ;; 06:6431 $7E
    cp   $03                                      ;; 06:6432 $FE $03
    jr   nz, ret_006_643C                         ;; 06:6434 $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ;; 06:6436 $21 $8F $C2
    add  hl, de                                   ;; 06:6439 $19
    ld   [hl], $00                                ;; 06:643A $36 $00

ret_006_643C:
    ret                                           ;; 06:643C $C9

EntityVariantForDirection_06::
.right db 6
.left  db 4
.up    db 2
.down  db 0

; Set the entity sprite variant to match the preset entity direction.
; Some inertia is added, so that after a direction change the entity waits for a bit before turning again.
;
; Inputs:
;   bc   entity index
SetEntityVariantForDirection_06::
    ld   hl, wEntitiesDirectionTable              ;; 06:6441 $21 $80 $C3
    add  hl, bc                                   ;; 06:6444 $09
    ld   e, [hl]                                  ;; 06:6445 $5E
    ld   d, b                                     ;; 06:6446 $50
    ld   hl, EntityVariantForDirection_06         ;; 06:6447 $21 $3D $64
    add  hl, de                                   ;; 06:644A $19
    push hl                                       ;; 06:644B $E5
    ld   hl, wEntitiesInertiaTable                ;; 06:644C $21 $D0 $C3
    add  hl, bc                                   ;; 06:644F $09
    inc  [hl]                                     ;; 06:6450 $34
    ld   a, [hl]                                  ;; 06:6451 $7E
    rra                                           ;; 06:6452 $1F
    rra                                           ;; 06:6453 $1F
    rra                                           ;; 06:6454 $1F
    rra                                           ;; 06:6455 $1F
    pop  hl                                       ;; 06:6456 $E1
    and  $01                                      ;; 06:6457 $E6 $01
    or   [hl]                                     ;; 06:6459 $B6
    jp   SetEntitySpriteVariant                   ;; 06:645A $C3 $0C $3B

; Should Link interact with Entity
CheckLinkInteractionWithEntity_06::
    ld   e, b                                     ;; 06:645D $58
    ldh  a, [hActiveEntityType]                   ;; 06:645E $F0 $EB
    cp   ENTITY_GRANDPA_ULRIRA                    ;; 06:6460 $FE $77
    jr   z, .jr_006_6468                          ;; 06:6462 $28 $04

    cp   ENTITY_CRAZY_TRACY                       ;; 06:6464 $FE $7B
    jr   nz, .jr_006_6474                         ;; 06:6466 $20 $0C

.jr_006_6468
    ldh  a, [hLinkPositionY]                      ;; 06:6468 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 06:646A $21 $EF $FF
    sub  [hl]                                     ;; 06:646D $96
    add  $14                                      ;; 06:646E $C6 $14
    cp   $2C                                      ;; 06:6470 $FE $2C
    jr   .label_006_647E                          ;; 06:6472 $18 $0A

.jr_006_6474
    ldh  a, [hLinkPositionY]                      ;; 06:6474 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 06:6476 $21 $EF $FF
    sub  [hl]                                     ;; 06:6479 $96
    add  $14                                      ;; 06:647A $C6 $14
    cp   $28                                      ;; 06:647C $FE $28

.label_006_647E
    jr   nc, .return                              ;; 06:647E $30 $44

    ldh  a, [hLinkPositionX]                      ;; 06:6480 $F0 $98
    ld   hl, hActiveEntityPosX                    ;; 06:6482 $21 $EE $FF
    sub  [hl]                                     ;; 06:6485 $96
    add  $10                                      ;; 06:6486 $C6 $10
    cp   $20                                      ;; 06:6488 $FE $20
    jr   nc, .return                              ;; 06:648A $30 $38

    inc  e                                        ;; 06:648C $1C
    ldh  a, [hActiveEntityType]                   ;; 06:648D $F0 $EB
    cp   ENTITY_YIP_YIP                           ;; 06:648F $FE $78
    jr   z, .jr_006_649F                          ;; 06:6491 $28 $0C

    push de                                       ;; 06:6493 $D5
    call GetEntityDirectionToLink_06              ;; 06:6494 $CD $B4 $65
    ldh  a, [hLinkDirection]                      ;; 06:6497 $F0 $9E
    xor  $01                                      ;; 06:6499 $EE $01
    cp   e                                        ;; 06:649B $BB
    pop  de                                       ;; 06:649C $D1
    jr   nz, .return                              ;; 06:649D $20 $25

.jr_006_649F
    ld   hl, wItemUsageContext                    ;; 06:649F $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 06:64A2 $36 $01
    ld   a, [wDialogState]                        ;; 06:64A4 $FA $9F $C1
    ld   hl, wInventoryAppearing                  ;; 06:64A7 $21 $4F $C1
    or   [hl]                                     ;; 06:64AA $B6
    ld   hl, wIsLinkInTheAir                      ;; 06:64AB $21 $46 $C1
    or   [hl]                                     ;; 06:64AE $B6
    ld   hl, wDialogCooldown                      ;; 06:64AF $21 $34 $C1
    or   [hl]                                     ;; 06:64B2 $B6
    jr   nz, .return                              ;; 06:64B3 $20 $0F

    ld   a, [wWindowY]                            ;; 06:64B5 $FA $9A $DB
    cp   $80                                      ;; 06:64B8 $FE $80
    jr   nz, .return                              ;; 06:64BA $20 $08

    ldh  a, [hJoypadState]                        ;; 06:64BC $F0 $CC
    and  J_A                                      ;; 06:64BE $E6 $10
    jr   z, .return                               ;; 06:64C0 $28 $02

    scf                                           ;; 06:64C2 $37
    ret                                           ;; 06:64C3 $C9

.return
    and  a                                        ;; 06:64C4 $A7
    ret                                           ;; 06:64C5 $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_06::
    ldh  a, [hActiveEntityStatus]                 ;; 06:64C6 $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ;; 06:64C8 $FE $05
    jr   nz, .skip                                ;; 06:64CA $20 $29

.allowInactiveEntity
    ld   a, [wGameplayType]                       ;; 06:64CC $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 06:64CF $FE $07
    jr   z, .skip                                 ;; 06:64D1 $28 $22

    cp   GAMEPLAY_CREDITS                         ;; 06:64D3 $FE $01
    jr   z, .creditsEnd                           ;; 06:64D5 $28 $0B

    cp   GAMEPLAY_WORLD                           ;; 06:64D7 $FE $0B
    jr   nz, .skip                                ;; 06:64D9 $20 $1A

    ld   a, [wTransitionSequenceCounter]          ;; 06:64DB $FA $6B $C1
    cp   $04                                      ;; 06:64DE $FE $04
    jr   nz, .skip                                ;; 06:64E0 $20 $13
.creditsEnd

    ld   hl, wC1A8                                ;; 06:64E2 $21 $A8 $C1
    ld   a, [wDialogState]                        ;; 06:64E5 $FA $9F $C1
    or   [hl]                                     ;; 06:64E8 $B6
    ld   hl, wInventoryAppearing                  ;; 06:64E9 $21 $4F $C1
    or   [hl]                                     ;; 06:64EC $B6
    jr   nz, .skip                                ;; 06:64ED $20 $06

    ld   a, [wRoomTransitionState]                ;; 06:64EF $FA $24 $C1
    and  a                                        ;; 06:64F2 $A7
    jr   z, .return                               ;; 06:64F3 $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ;; 06:64F5 $F1

.return
    ret                                           ;; 06:64F6 $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_06::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 06:64F7 $21 $10 $C4
    add  hl, bc                                   ;; 06:64FA $09
    ld   a, [hl]                                  ;; 06:64FB $7E
    and  a                                        ;; 06:64FC $A7
    jr   z, .return                               ;; 06:64FD $28 $41

    dec  a                                        ;; 06:64FF $3D
    ld   [hl], a                                  ;; 06:6500 $77

    call label_3E8E                               ;; 06:6501 $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ;; 06:6504 $21 $40 $C2
    add  hl, bc                                   ;; 06:6507 $09
    ld   a, [hl]                                  ;; 06:6508 $7E
    push af                                       ;; 06:6509 $F5

    ld   hl, wEntitiesSpeedYTable                 ;; 06:650A $21 $50 $C2
    add  hl, bc                                   ;; 06:650D $09
    ld   a, [hl]                                  ;; 06:650E $7E
    push af                                       ;; 06:650F $F5

    ld   hl, wEntitiesRecoilVelocityX             ;; 06:6510 $21 $F0 $C3
    add  hl, bc                                   ;; 06:6513 $09
    ld   a, [hl]                                  ;; 06:6514 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:6515 $21 $40 $C2
    add  hl, bc                                   ;; 06:6518 $09
    ld   [hl], a                                  ;; 06:6519 $77

    ld   hl, wEntitiesRecoilVelocityY             ;; 06:651A $21 $00 $C4
    add  hl, bc                                   ;; 06:651D $09
    ld   a, [hl]                                  ;; 06:651E $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:651F $21 $50 $C2
    add  hl, bc                                   ;; 06:6522 $09
    ld   [hl], a                                  ;; 06:6523 $77

    call UpdateEntityPosWithSpeed_06              ;; 06:6524 $CD $41 $65

    ld   hl, wEntitiesOptions1Table               ;; 06:6527 $21 $30 $C4
    add  hl, bc                                   ;; 06:652A $09
    ld   a, [hl]                                  ;; 06:652B $7E
    and  $20                                      ;; 06:652C $E6 $20
    jr   nz, .restoreOriginalSpeed                ;; 06:652E $20 $03

    call ApplyEntityInteractionWithBackground_trampoline ;; 06:6530 $CD $23 $3B

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ;; 06:6533 $21 $50 $C2
    add  hl, bc                                   ;; 06:6536 $09
    pop  af                                       ;; 06:6537 $F1
    ld   [hl], a                                  ;; 06:6538 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 06:6539 $21 $40 $C2
    add  hl, bc                                   ;; 06:653C $09
    pop  af                                       ;; 06:653D $F1
    ld   [hl], a                                  ;; 06:653E $77
    pop  af                                       ;; 06:653F $F1

.return
    ret                                           ;; 06:6540 $C9

UpdateEntityPosWithSpeed_06::
    call AddEntitySpeedToPos_06                   ;; 06:6541 $CD $4E $65
    push bc                                       ;; 06:6544 $C5
    ld   a, c                                     ;; 06:6545 $79
    add  $10                                      ;; 06:6546 $C6 $10
    ld   c, a                                     ;; 06:6548 $4F
    call AddEntitySpeedToPos_06                   ;; 06:6549 $CD $4E $65
    pop  bc                                       ;; 06:654C $C1
    ret                                           ;; 06:654D $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_06::
    ld   hl, wEntitiesSpeedXTable                 ;; 06:654E $21 $40 $C2
    add  hl, bc                                   ;; 06:6551 $09
    ld   a, [hl]                                  ;; 06:6552 $7E
    and  a                                        ;; 06:6553 $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ;; 06:6554 $28 $23

    push af                                       ;; 06:6556 $F5
    swap a                                        ;; 06:6557 $CB $37
    and  $F0                                      ;; 06:6559 $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 06:655B $21 $60 $C2
    add  hl, bc                                   ;; 06:655E $09
    add  [hl]                                     ;; 06:655F $86
    ld   [hl], a                                  ;; 06:6560 $77
    ; Save carry in bit 0 of d
    rl   d                                        ;; 06:6561 $CB $12
    ld   hl, wEntitiesPosXTable                   ;; 06:6563 $21 $00 $C2

.updatePosition
    add  hl, bc                                   ;; 06:6566 $09
    pop  af                                       ;; 06:6567 $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ;; 06:6568 $1E $00
    bit  7, a                                     ;; 06:656A $CB $7F
    jr   z, .positive                             ;; 06:656C $28 $02

    ld   e, $F0                                   ;; 06:656E $1E $F0

.positive
    swap a                                        ;; 06:6570 $CB $37
    and  $0F                                      ;; 06:6572 $E6 $0F
    or   e                                        ;; 06:6574 $B3
    ; Get carry back from d
    rr   d                                        ;; 06:6575 $CB $1A
    adc  [hl]                                     ;; 06:6577 $8E
    ld   [hl], a                                  ;; 06:6578 $77

.return
    ret                                           ;; 06:6579 $C9

AddEntityZSpeedToPos_06::
    ld   hl, wEntitiesSpeedZTable                 ;; 06:657A $21 $20 $C3
    add  hl, bc                                   ;; 06:657D $09
    ld   a, [hl]                                  ;; 06:657E $7E
    and  a                                        ;; 06:657F $A7
    jr   z, AddEntitySpeedToPos_06.return         ;; 06:6580 $28 $F7

    push af                                       ;; 06:6582 $F5
    swap a                                        ;; 06:6583 $CB $37
    and  $F0                                      ;; 06:6585 $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ;; 06:6587 $21 $30 $C3
    add  hl, bc                                   ;; 06:658A $09
    add  [hl]                                     ;; 06:658B $86
    ld   [hl], a                                  ;; 06:658C $77
    rl   d                                        ;; 06:658D $CB $12
    ld   hl, wEntitiesPosZTable                   ;; 06:658F $21 $10 $C3
    jr   AddEntitySpeedToPos_06.updatePosition    ;; 06:6592 $18 $D2

; Inputs:
;   bc   entity index
;
; Outputs:
;   d   x distance (Link's position - entity's position)
;   e   DIRECTION_LEFT if Link is to the left of the entity, DIRECTION_RIGHT otherwise
GetEntityXDistanceToLink_06::
    ld   e, DIRECTION_RIGHT                       ;; 06:6594 $1E $00
    ldh  a, [hLinkPositionX]                      ;; 06:6596 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 06:6598 $21 $00 $C2
    add  hl, bc                                   ;; 06:659B $09
    sub  [hl]                                     ;; 06:659C $96
    bit  7, a                                     ;; 06:659D $CB $7F
    jr   z, .positive                             ;; 06:659F $28 $01

    inc  e                                        ;; 06:65A1 $1C

.positive
    ld   d, a                                     ;; 06:65A2 $57
    ret                                           ;; 06:65A3 $C9

; Inputs:
;   bc   entity index
;
; Outputs:
;   d   y distance (Link's position - entity's position)
;   e   DIRECTION_UP if Link is above the entity, DIRECTION_DOWN otherwise
GetEntityYDistanceToLink_06::
    ld   e, DIRECTION_UP                          ;; 06:65A4 $1E $02
    ldh  a, [hLinkPositionY]                      ;; 06:65A6 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 06:65A8 $21 $10 $C2
    add  hl, bc                                   ;; 06:65AB $09
    sub  [hl]                                     ;; 06:65AC $96
    bit  7, a                                     ;; 06:65AD $CB $7F
    jr   nz, .negative                            ;; 06:65AF $20 $01

    inc  e                                        ;; 06:65B1 $1C

.negative
    ld   d, a                                     ;; 06:65B2 $57
    ret                                           ;; 06:65B3 $C9

; Inputs:
;   bc   entity index
;
; Outputs:
;   e   entity's direction to Link (see DIRECTION_* constants for possible values)
GetEntityDirectionToLink_06::
    call GetEntityXDistanceToLink_06              ;; 06:65B4 $CD $94 $65
    ld   a, e                                     ;; 06:65B7 $7B
    ldh  [hMultiPurpose0], a                      ;; 06:65B8 $E0 $D7
    ld   a, d                                     ;; 06:65BA $7A
    bit  7, a                                     ;; 06:65BB $CB $7F
    jr   z, .positiveX                            ;; 06:65BD $28 $02

    cpl                                           ;; 06:65BF $2F
    inc  a                                        ;; 06:65C0 $3C

.positiveX
    push af                                       ;; 06:65C1 $F5
    call GetEntityYDistanceToLink_06              ;; 06:65C2 $CD $A4 $65
    ld   a, e                                     ;; 06:65C5 $7B
    ldh  [hMultiPurpose1], a                      ;; 06:65C6 $E0 $D8
    ld   a, d                                     ;; 06:65C8 $7A
    bit  7, a                                     ;; 06:65C9 $CB $7F
    jr   z, .positiveY                            ;; 06:65CB $28 $02

    cpl                                           ;; 06:65CD $2F
    inc  a                                        ;; 06:65CE $3C

.positiveY
    pop  de                                       ;; 06:65CF $D1
    cp   d                                        ;; 06:65D0 $BA
    jr   nc, .vertical                            ;; 06:65D1 $30 $04

    ldh  a, [hMultiPurpose0]                      ;; 06:65D3 $F0 $D7
    jr   .verticalEnd                             ;; 06:65D5 $18 $02

.vertical
    ldh  a, [hMultiPurpose1]                      ;; 06:65D7 $F0 $D8

.verticalEnd
    ld   e, a                                     ;; 06:65D9 $5F
    ret                                           ;; 06:65DA $C9

; Reset the entity status to 0, thus removing the entity.
;
; Inputs:
;   bc   entity index
ClearEntityStatus_06::
    ld   hl, wEntitiesStatusTable                 ;; 06:65DB $21 $80 $C2
    add  hl, bc                                   ;; 06:65DE $09
    ld   [hl], b                                  ;; 06:65DF $70
    ret                                           ;; 06:65E0 $C9

include "code/entities/06_wizrobe_projectile.asm"
include "code/entities/06_spark.asm"
include "code/entities/06_keese.asm"
include "code/entities/06_owl_event.asm"
include "code/entities/06_telephone.asm"
include "code/entities/06_butterfly.asm"
include "code/entities/06_rolling_bones.asm"
include "code/entities/06_rolling_bones_bar.asm"

func_006_700A::
    and  $07                                      ;; 06:700A $E6 $07
    ret  nz                                       ;; 06:700C $C0

    call GetRandomByte                            ;; 06:700D $CD $0D $28
    and  $1F                                      ;; 06:7010 $E6 $1F
    sub  $10                                      ;; 06:7012 $D6 $10
    ld   e, a                                     ;; 06:7014 $5F
    ld   hl, hActiveEntityPosX                    ;; 06:7015 $21 $EE $FF
    add  [hl]                                     ;; 06:7018 $86
    ld   [hl], a                                  ;; 06:7019 $77
    call GetRandomByte                            ;; 06:701A $CD $0D $28
    and  $1F                                      ;; 06:701D $E6 $1F
    sub  $14                                      ;; 06:701F $D6 $14
    ld   e, a                                     ;; 06:7021 $5F
    ld   hl, hActiveEntityVisualPosY              ;; 06:7022 $21 $EC $FF
    add  [hl]                                     ;; 06:7025 $86
    ld   [hl], a                                  ;; 06:7026 $77
    jp   label_006_702A                           ;; 06:7027 $C3 $2A $70

label_006_702A:
    call ReturnIfNonInteractive_06.allowInactiveEntity ;; 06:702A $CD $CC $64
    ldh  a, [hActiveEntityPosX]                   ;; 06:702D $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 06:702F $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:7031 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 06:7033 $E0 $D8

label_006_7035:
    ld   a, TRANSCIENT_VFX_POOF                   ;; 06:7035 $3E $02
    call AddTranscientVfx                         ;; 06:7037 $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ;; 06:703A $3E $13
    ldh  [hNoiseSfx], a                           ;; 06:703C $E0 $F4
    ret                                           ;; 06:703E $C9

    ld   a, ENTITY_HEART_CONTAINER                ;; 06:703F $3E $36
    call SpawnNewEntity_trampoline                ;; 06:7041 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:7044 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 06:7046 $21 $00 $C2
    add  hl, de                                   ;; 06:7049 $19
    ld   [hl], a                                  ;; 06:704A $77
    ldh  a, [hMultiPurpose1]                      ;; 06:704B $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 06:704D $21 $10 $C2
    add  hl, de                                   ;; 06:7050 $19
    ld   [hl], a                                  ;; 06:7051 $77
    ldh  a, [hIsSideScrolling]                    ;; 06:7052 $F0 $F9
    and  a                                        ;; 06:7054 $A7
    jr   z, .jr_705F                              ;; 06:7055 $28 $08

    ld   hl, wEntitiesSpeedYTable                 ;; 06:7057 $21 $50 $C2
    add  hl, bc                                   ;; 06:705A $09
    ld   [hl], $F0                                ;; 06:705B $36 $F0
    jr   jr_006_706B                              ;; 06:705D $18 $0C

.jr_705F
    ld   hl, wEntitiesSpeedZTable                 ;; 06:705F $21 $20 $C3
    add  hl, de                                   ;; 06:7062 $19
    ld   [hl], $10                                ;; 06:7063 $36 $10
    ld   hl, wEntitiesPosZTable                   ;; 06:7065 $21 $10 $C3
    add  hl, de                                   ;; 06:7068 $19
    ld   [hl], $08                                ;; 06:7069 $36 $08

jr_006_706B:
    call ClearEntityStatus_06                     ;; 06:706B $CD $DB $65
    jp   PlayBombExplosionSfx                     ;; 06:706E $C3 $4B $0C

include "code/entities/06_big_fairy.asm"
include "code/entities/06_mr_write_bird.asm"
include "code/entities/06_pols_voice.asm"
include "code/entities/06_armos_statue.asm"
include "code/entities/06_spike_trap.asm"
include "code/entities/06_wizrobe.asm"

Data_006_773C::
    db   $00, $D8, $60, $00, $00, $E0, $60, $20, $00, $28, $60, $00, $00, $30, $60, $20
    db   $D8, $00, $62, $00, $D8, $08, $62, $20, $28, $00, $62, $00, $28, $08, $62, $20
    db   $F0, $F0, $6A, $00, $F0, $F8, $6A, $60, $F0, $10, $6A, $40, $F0, $18, $6A, $20
    db   $10, $F0, $6A, $40, $10, $F8, $6A, $20, $10, $10, $6A, $00, $10, $18, $6A, $60
    db   $00, $E8, $60, $00, $00, $F0, $60, $20, $00, $18, $60, $00, $00, $20, $60, $20
    db   $E8, $00, $62, $00, $E8, $08, $62, $20, $18, $00, $62, $00, $18, $08, $62, $20
    db   $F0, $F0, $FF, $00, $F0, $F8, $FF, $00, $F0, $10, $FF, $00, $F0, $18, $FF, $00
    db   $10, $F0, $FF, $00, $10, $F8, $FF, $00, $10, $10, $FF, $00, $10, $18, $FF, $00
    db   $E0, $E0, $68, $00, $E0, $E8, $68, $60, $20, $E0, $68, $40, $20, $E8, $68, $20
    db   $E0, $20, $68, $40, $E0, $28, $68, $20, $20, $20, $68, $00, $20, $28, $68, $60
    db   $00, $F0, $64, $00, $00, $F8, $64, $20, $F0, $00, $66, $00, $F0, $08, $66, $20
    db   $00, $10, $64, $00, $00, $18, $64, $20, $10, $00, $66, $00, $10, $08, $66, $20
    db   $E8, $E8, $68, $00, $E8, $F0, $68, $60, $18, $E8, $68, $40, $18, $F0, $68, $20
    db   $E8, $18, $68, $40, $E8, $20, $68, $20, $18, $18, $68, $00, $18, $20, $68, $60
    db   $00, $F0, $FF, $00, $00, $F8, $FF, $20, $F0, $00, $FF, $00, $F0, $08, $FF, $20
    db   $00, $10, $FF, $00, $00, $18, $FF, $20, $10, $00, $FF, $00, $10, $08, $FF, $20

; Helper called from bank 3
func_006_783C::
    call ReturnIfNonInteractive_06                ;; 06:783C $CD $C6 $64

.jr_783F
    ldh  a, [hFrameCounter]                       ;; 06:783F $F0 $E7
    rra                                           ;; 06:7841 $1F
    rra                                           ;; 06:7842 $1F
    rra                                           ;; 06:7843 $1F
    and  $03                                      ;; 06:7844 $E6 $03
    ld   e, a                                     ;; 06:7846 $5F
    ld   d, b                                     ;; 06:7847 $50
    sla  e                                        ;; 06:7848 $CB $23
    rl   d                                        ;; 06:784A $CB $12
    sla  e                                        ;; 06:784C $CB $23
    rl   d                                        ;; 06:784E $CB $12
    sla  e                                        ;; 06:7850 $CB $23
    rl   d                                        ;; 06:7852 $CB $12
    sla  e                                        ;; 06:7854 $CB $23
    rl   d                                        ;; 06:7856 $CB $12
    sla  e                                        ;; 06:7858 $CB $23
    rl   d                                        ;; 06:785A $CB $12
    sla  e                                        ;; 06:785C $CB $23
    rl   d                                        ;; 06:785E $CB $12
    ld   hl, Data_006_773C                        ;; 06:7860 $21 $3C $77
    add  hl, de                                   ;; 06:7863 $19
    ld   c, $10                                   ;; 06:7864 $0E $10
    call RenderActiveEntitySpritesRect            ;; 06:7866 $CD $E6 $3C
    ld   a, $10                                   ;; 06:7869 $3E $10
    jp   func_015_7964_trampoline                 ;; 06:786B $C3 $A0 $3D

include "code/entities/06_anti_fairy.asm"
include "code/entities/06_tektite.asm"
include "code/entities/06_boo_buddy.asm"
include "code/entities/06_floating_item.asm"
include "code/entities/06_zol.asm"
include "code/entities/06_like_like.asm"
include "code/entities/06_gibdo.asm"

; Helper used by the Like Like entity
func_006_7F05::
    ld   hl, wEntitiesPrivateState4Table          ;; 06:7F05 $21 $40 $C4
    add  hl, bc                                   ;; 06:7F08 $09
    ld   a, [hl]                                  ;; 06:7F09 $7E
    inc  [hl]                                     ;; 06:7F0A $34
    rra                                           ;; 06:7F0B $1F
    rra                                           ;; 06:7F0C $1F
    rra                                           ;; 06:7F0D $1F
    rra                                           ;; 06:7F0E $1F
    and  $01                                      ;; 06:7F0F $E6 $01
    jp   SetEntitySpriteVariant                   ;; 06:7F11 $C3 $0C $3B
