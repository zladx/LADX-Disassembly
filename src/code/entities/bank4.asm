; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

include "code/entities/04_genie.asm"
include "code/entities/04_slime_eye.asm"
include "code/entities/04_facade.asm"
include "code/entities/04_moldorm.asm"
include "code/entities/04_minimoldorm.asm"
include "code/entities/04_ghini.asm"
include "code/entities/04_pairodd.asm"
include "code/entities/04_fishinggame.asm"
include "code/entities/04_tractordevice.asm"
include "code/entities/04_knight.asm"
include "code/entities/04_laser.asm"

; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

ClearEntityStatusBank04::
    ld   hl, wEntitiesStatusTable                 ;; 04:6D7A $21 $80 $C2
    add  hl, bc                                   ;; 04:6D7D $09
    ld   [hl], b                                  ;; 04:6D7E $70
    ret                                           ;; 04:6D7F $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_04::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 04:6D80 $21 $10 $C4
    add  hl, bc                                   ;; 04:6D83 $09
    ld   a, [hl]                                  ;; 04:6D84 $7E
    and  a                                        ;; 04:6D85 $A7
    jr   z, .return                               ;; 04:6D86 $28 $41

    dec  a                                        ;; 04:6D88 $3D
    ld   [hl], a                                  ;; 04:6D89 $77

    call label_3E8E                               ;; 04:6D8A $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ;; 04:6D8D $21 $40 $C2
    add  hl, bc                                   ;; 04:6D90 $09
    ld   a, [hl]                                  ;; 04:6D91 $7E
    push af                                       ;; 04:6D92 $F5

    ld   hl, wEntitiesSpeedYTable                 ;; 04:6D93 $21 $50 $C2
    add  hl, bc                                   ;; 04:6D96 $09
    ld   a, [hl]                                  ;; 04:6D97 $7E
    push af                                       ;; 04:6D98 $F5

    ld   hl, wEntitiesRecoilVelocityX             ;; 04:6D99 $21 $F0 $C3
    add  hl, bc                                   ;; 04:6D9C $09
    ld   a, [hl]                                  ;; 04:6D9D $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:6D9E $21 $40 $C2
    add  hl, bc                                   ;; 04:6DA1 $09
    ld   [hl], a                                  ;; 04:6DA2 $77

    ld   hl, wEntitiesRecoilVelocityY             ;; 04:6DA3 $21 $00 $C4
    add  hl, bc                                   ;; 04:6DA6 $09
    ld   a, [hl]                                  ;; 04:6DA7 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:6DA8 $21 $50 $C2
    add  hl, bc                                   ;; 04:6DAB $09
    ld   [hl], a                                  ;; 04:6DAC $77

    call UpdateEntityPosWithSpeed_04              ;; 04:6DAD $CD $CA $6D

    ld   hl, wEntitiesOptions1Table               ;; 04:6DB0 $21 $30 $C4
    add  hl, bc                                   ;; 04:6DB3 $09
    ld   a, [hl]                                  ;; 04:6DB4 $7E
    and  $20                                      ;; 04:6DB5 $E6 $20
    jr   nz, .restoreOriginalVelocity             ;; 04:6DB7 $20 $03

    call ApplyEntityInteractionWithBackground_trampoline ;; 04:6DB9 $CD $23 $3B

.restoreOriginalVelocity
    ld   hl, wEntitiesSpeedYTable                 ;; 04:6DBC $21 $50 $C2
    add  hl, bc                                   ;; 04:6DBF $09
    pop  af                                       ;; 04:6DC0 $F1
    ld   [hl], a                                  ;; 04:6DC1 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 04:6DC2 $21 $40 $C2
    add  hl, bc                                   ;; 04:6DC5 $09
    pop  af                                       ;; 04:6DC6 $F1
    ld   [hl], a                                  ;; 04:6DC7 $77
    pop  af                                       ;; 04:6DC8 $F1

.return
    ret                                           ;; 04:6DC9 $C9

UpdateEntityPosWithSpeed_04::
    call AddEntitySpeedToPos_04                   ;; 04:6DCA $CD $D7 $6D

UpdateEntityYPosWithSpeed_04::
    push bc                                       ;; 04:6DCD $C5
    ld   a, c                                     ;; 04:6DCE $79
    add  $10                                      ;; 04:6DCF $C6 $10
    ld   c, a                                     ;; 04:6DD1 $4F
    call AddEntitySpeedToPos_04                   ;; 04:6DD2 $CD $D7 $6D
    pop  bc                                       ;; 04:6DD5 $C1
    ret                                           ;; 04:6DD6 $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_04::
    ld   hl, wEntitiesSpeedXTable                 ;; 04:6DD7 $21 $40 $C2
    add  hl, bc                                   ;; 04:6DDA $09
    ld   a, [hl]                                  ;; 04:6DDB $7E
    and  a                                        ;; 04:6DDC $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ;; 04:6DDD $28 $23

    push af                                       ;; 04:6DDF $F5
    swap a                                        ;; 04:6DE0 $CB $37
    and  $F0                                      ;; 04:6DE2 $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 04:6DE4 $21 $60 $C2
    add  hl, bc                                   ;; 04:6DE7 $09
    add  [hl]                                     ;; 04:6DE8 $86
    ld   [hl], a                                  ;; 04:6DE9 $77
    ; Save carry in bit 0 of d
    rl   d                                        ;; 04:6DEA $CB $12
    ld   hl, wEntitiesPosXTable                   ;; 04:6DEC $21 $00 $C2

.updatePosition
    add  hl, bc                                   ;; 04:6DEF $09
    pop  af                                       ;; 04:6DF0 $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ;; 04:6DF1 $1E $00
    bit  7, a                                     ;; 04:6DF3 $CB $7F
    jr   z, .positive                             ;; 04:6DF5 $28 $02

    ld   e, $F0                                   ;; 04:6DF7 $1E $F0

.positive
    swap a                                        ;; 04:6DF9 $CB $37
    and  $0F                                      ;; 04:6DFB $E6 $0F
    or   e                                        ;; 04:6DFD $B3
    ; Get carry back from d
    rr   d                                        ;; 04:6DFE $CB $1A
    adc  [hl]                                     ;; 04:6E00 $8E
    ld   [hl], a                                  ;; 04:6E01 $77

.return
    ret                                           ;; 04:6E02 $C9

AddEntityZSpeedToPos_04::
    ld   hl, wEntitiesSpeedZTable                 ;; 04:6E03 $21 $20 $C3
    add  hl, bc                                   ;; 04:6E06 $09
    ld   a, [hl]                                  ;; 04:6E07 $7E
    and  a                                        ;; 04:6E08 $A7
    jr   z, AddEntitySpeedToPos_04.return         ;; 04:6E09 $28 $F7

    push af                                       ;; 04:6E0B $F5
    swap a                                        ;; 04:6E0C $CB $37
    and  $F0                                      ;; 04:6E0E $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ;; 04:6E10 $21 $30 $C3
    add  hl, bc                                   ;; 04:6E13 $09
    add  [hl]                                     ;; 04:6E14 $86
    ld   [hl], a                                  ;; 04:6E15 $77
    rl   d                                        ;; 04:6E16 $CB $12
    ld   hl, wEntitiesPosZTable                   ;; 04:6E18 $21 $10 $C3
    jr   AddEntitySpeedToPos_04.updatePosition    ;; 04:6E1B $18 $D2

KnightAddIronBallSpeedToPos::
    ld   hl, wEntitiesPrivateState1Table          ;; 04:6E1D $21 $B0 $C2
    add  hl, bc                                   ;; 04:6E20 $09
    ld   a, [hl]                                  ;; 04:6E21 $7E
    push af                                       ;; 04:6E22 $F5
    swap a                                        ;; 04:6E23 $CB $37
    and  $F0                                      ;; 04:6E25 $E6 $F0
    ld   hl, wEntitiesPrivateState2Table          ;; 04:6E27 $21 $C0 $C2
    add  hl, bc                                   ;; 04:6E2A $09
    add  [hl]                                     ;; 04:6E2B $86
    ld   [hl], a                                  ;; 04:6E2C $77
    rl   d                                        ;; 04:6E2D $CB $12
    ld   hl, wEntitiesPrivateState3Table          ;; 04:6E2F $21 $D0 $C2
    jp   AddEntitySpeedToPos_04.updatePosition    ;; 04:6E32 $C3 $EF $6D

; Inputs:
;   bc   entity index
;
; Outputs:
;   d   x distance (Link's position - entity's position)
;   e   DIRECTION_LEFT if Link is to the left of the entity, DIRECTION_RIGHT otherwise
GetEntityXDistanceToLink_04::
    ld   e, DIRECTION_RIGHT                       ;; 04:6E35 $1E $00
    ldh  a, [hLinkPositionX]                      ;; 04:6E37 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 04:6E39 $21 $00 $C2
    add  hl, bc                                   ;; 04:6E3C $09
    sub  [hl]                                     ;; 04:6E3D $96
    bit  7, a                                     ;; 04:6E3E $CB $7F
    jr   z, .positive                             ;; 04:6E40 $28 $01

    inc  e                                        ;; 04:6E42 $1C

.positive
    ld   d, a                                     ;; 04:6E43 $57
    ret                                           ;; 04:6E44 $C9

; Inputs:
;   bc   entity index
;
; Outputs:
;   d   y distance (Link's position - entity's position)
;   e   DIRECTION_UP if Link is above the entity, DIRECTION_DOWN otherwise
GetEntityYDistanceToLink_04::
    ld   e, DIRECTION_UP                          ;; 04:6E45 $1E $02
    ldh  a, [hLinkPositionY]                      ;; 04:6E47 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 04:6E49 $21 $10 $C2
    add  hl, bc                                   ;; 04:6E4C $09
    sub  [hl]                                     ;; 04:6E4D $96
    bit  7, a                                     ;; 04:6E4E $CB $7F
    jr   nz, .negative                            ;; 04:6E50 $20 $01

    inc  e                                        ;; 04:6E52 $1C

.negative
    ld   d, a                                     ;; 04:6E53 $57
    ret                                           ;; 04:6E54 $C9

; Inputs:
;   bc   entity index
;
; Outputs:
;   e   entity's direction to Link (see DIRECTION_* constants for possible values)
GetEntityDirectionToLink_04::
    call GetEntityXDistanceToLink_04              ;; 04:6E55 $CD $35 $6E
    ld   a, e                                     ;; 04:6E58 $7B
    ldh  [hMultiPurpose0], a                      ;; 04:6E59 $E0 $D7
    ld   a, d                                     ;; 04:6E5B $7A
    bit  7, a                                     ;; 04:6E5C $CB $7F
    jr   z, .positiveX                            ;; 04:6E5E $28 $02

    cpl                                           ;; 04:6E60 $2F
    inc  a                                        ;; 04:6E61 $3C

.positiveX
    push af                                       ;; 04:6E62 $F5
    call GetEntityYDistanceToLink_04              ;; 04:6E63 $CD $45 $6E
    ld   a, e                                     ;; 04:6E66 $7B
    ldh  [hMultiPurpose1], a                      ;; 04:6E67 $E0 $D8
    ld   a, d                                     ;; 04:6E69 $7A
    bit  7, a                                     ;; 04:6E6A $CB $7F
    jr   z, .positiveY                            ;; 04:6E6C $28 $02

    cpl                                           ;; 04:6E6E $2F
    inc  a                                        ;; 04:6E6F $3C

.positiveY
    pop  de                                       ;; 04:6E70 $D1
    cp   d                                        ;; 04:6E71 $BA
    jr   nc, .vertical                            ;; 04:6E72 $30 $04

    ldh  a, [hMultiPurpose0]                      ;; 04:6E74 $F0 $D7
    jr   .verticalEnd                             ;; 04:6E76 $18 $02

.vertical
    ldh  a, [hMultiPurpose1]                      ;; 04:6E78 $F0 $D8

.verticalEnd
    ld   e, a                                     ;; 04:6E7A $5F
    ret                                           ;; 04:6E7B $C9

include "code/entities/04_trendy.asm"

Disabled4EEntityHandler::
    ret                                           ;; 04:76CA $C9

include "code/entities/04_shop.asm"

func_004_7C4B:: ; called only from fishing minigame
    ld   a, [wDialogState]                        ;; 04:7C4B $FA $9F $C1
    ld   hl, wInventoryAppearing                  ;; 04:7C4E $21 $4F $C1
    or   [hl]                                     ;; 04:7C51 $B6
    ld   hl, wIsLinkInTheAir                      ;; 04:7C52 $21 $46 $C1
    or   [hl]                                     ;; 04:7C55 $B6
    ld   hl, wDialogCooldown                      ;; 04:7C56 $21 $34 $C1
    or   [hl]                                     ;; 04:7C59 $B6
    jr   nz, .jr_7C92                             ;; 04:7C5A $20 $36

    ld   a, [wWindowY]                            ;; 04:7C5C $FA $9A $DB
    cp   $80                                      ;; 04:7C5F $FE $80
    jr   nz, .jr_7C92                             ;; 04:7C61 $20 $2F

    ldh  a, [hLinkPositionX]                      ;; 04:7C63 $F0 $98
    ld   hl, hActiveEntityPosX                    ;; 04:7C65 $21 $EE $FF
    sub  [hl]                                     ;; 04:7C68 $96
    add  $10                                      ;; 04:7C69 $C6 $10
    cp   $20                                      ;; 04:7C6B $FE $20
    jr   nc, .jr_7C92                             ;; 04:7C6D $30 $23

    ldh  a, [hLinkPositionY]                      ;; 04:7C6F $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 04:7C71 $21 $EF $FF
    sub  [hl]                                     ;; 04:7C74 $96
    add  $14                                      ;; 04:7C75 $C6 $14
    cp   $28                                      ;; 04:7C77 $FE $28
    jr   nc, .jr_7C92                             ;; 04:7C79 $30 $17

    call GetEntityDirectionToLink_04              ;; 04:7C7B $CD $55 $6E
    ldh  a, [hLinkDirection]                      ;; 04:7C7E $F0 $9E
    xor  $01                                      ;; 04:7C80 $EE $01
    cp   e                                        ;; 04:7C82 $BB
    jr   nz, .jr_7C92                             ;; 04:7C83 $20 $0D

    ld   hl, wItemUsageContext                    ;; 04:7C85 $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 04:7C88 $36 $01
    ldh  a, [hJoypadState]                        ;; 04:7C8A $F0 $CC
    and  J_A                                      ;; 04:7C8C $E6 $10
    jr   z, .jr_7C92                              ;; 04:7C8E $28 $02

    scf                                           ;; 04:7C90 $37
    ret                                           ;; 04:7C91 $C9

.jr_7C92
    and  a                                        ;; 04:7C92 $A7
    ret                                           ;; 04:7C93 $C9

EntityVariantForDirection_04::
.right db 6
.left  db 4
.up    db 2
.down  db 0

; Set the entity sprite variant to match the preset entity direction.
; Some inertia is added, so that after a direction change the entity waits for a bit before turning again.
;
; Inputs:
;   bc   entity index
SetEntityVariantForDirection_04::
    ld   hl, wEntitiesDirectionTable              ;; 04:7C98 $21 $80 $C3
    add  hl, bc                                   ;; 04:7C9B $09
    ld   e, [hl]                                  ;; 04:7C9C $5E
    ld   d, b                                     ;; 04:7C9D $50
    ld   hl, EntityVariantForDirection_04         ;; 04:7C9E $21 $94 $7C
    add  hl, de                                   ;; 04:7CA1 $19
    push hl                                       ;; 04:7CA2 $E5
    ld   hl, wEntitiesInertiaTable                ;; 04:7CA3 $21 $D0 $C3
    add  hl, bc                                   ;; 04:7CA6 $09
    inc  [hl]                                     ;; 04:7CA7 $34
    ld   a, [hl]                                  ;; 04:7CA8 $7E
    rra                                           ;; 04:7CA9 $1F
    rra                                           ;; 04:7CAA $1F
    rra                                           ;; 04:7CAB $1F
    pop  hl                                       ;; 04:7CAC $E1
    and  $01                                      ;; 04:7CAD $E6 $01
    or   [hl]                                     ;; 04:7CAF $B6
    jp   SetEntitySpriteVariant                   ;; 04:7CB0 $C3 $0C $3B


    ld   hl, wEntitiesSpeedXTable                 ;; 04:7CB3 $21 $40 $C2
    add  hl, bc                                   ;; 04:7CB6 $09
    ld   a, [hl]                                  ;; 04:7CB7 $7E
    push af                                       ;; 04:7CB8 $F5
    ld   [hl], $01                                ;; 04:7CB9 $36 $01
    ld   hl, wEntitiesSpeedYTable                 ;; 04:7CBB $21 $50 $C2
    add  hl, bc                                   ;; 04:7CBE $09
    ld   a, [hl]                                  ;; 04:7CBF $7E
    push af                                       ;; 04:7CC0 $F5
    ld   [hl], $01                                ;; 04:7CC1 $36 $01
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:7CC3 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 04:7CC6 $21 $A0 $C2
    add  hl, bc                                   ;; 04:7CC9 $09
    ld   a, [hl]                                  ;; 04:7CCA $7E
    push af                                       ;; 04:7CCB $F5
    ld   hl, wEntitiesSpeedXTable                 ;; 04:7CCC $21 $40 $C2
    add  hl, bc                                   ;; 04:7CCF $09
    ld   [hl], $FF                                ;; 04:7CD0 $36 $FF
    ld   hl, wEntitiesSpeedYTable                 ;; 04:7CD2 $21 $50 $C2
    add  hl, bc                                   ;; 04:7CD5 $09
    ld   [hl], $FF                                ;; 04:7CD6 $36 $FF
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:7CD8 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 04:7CDB $21 $A0 $C2
    add  hl, bc                                   ;; 04:7CDE $09
    pop  af                                       ;; 04:7CDF $F1
    or   [hl]                                     ;; 04:7CE0 $B6
    ld   [hl], a                                  ;; 04:7CE1 $77
    pop  af                                       ;; 04:7CE2 $F1
    ld   hl, wEntitiesSpeedYTable                 ;; 04:7CE3 $21 $50 $C2
    add  hl, bc                                   ;; 04:7CE6 $09
    ld   [hl], a                                  ;; 04:7CE7 $77
    pop  af                                       ;; 04:7CE8 $F1
    ld   hl, wEntitiesSpeedXTable                 ;; 04:7CE9 $21 $40 $C2
    add  hl, bc                                   ;; 04:7CEC $09
    ld   [hl], a                                  ;; 04:7CED $77
    ret                                           ;; 04:7CEE $C9

include "code/entities/04_bombite.asm"
include "code/entities/04_leever.asm"

GhiniUpdateFlipAttribute::
    ld   hl, wEntitiesSpeedXTable                 ;; 04:7F90 $21 $40 $C2
    add  hl, bc                                   ;; 04:7F93 $09
    ld   a, [hl]                                  ;; 04:7F94 $7E
    rl   a                                        ;; 04:7F95 $CB $17
    ld   a, OAM_NO_FLIP                           ;; 04:7F97 $3E $00
    jr   c, .negative                             ;; 04:7F99 $38 $02

    ld   a, OAMF_XFLIP                            ;; 04:7F9B $3E $20

.negative
    ld   hl, hActiveEntityFlipAttribute           ;; 04:7F9D $21 $ED $FF
    xor  [hl]                                     ;; 04:7FA0 $AE
    ld   [hl], a                                  ;; 04:7FA1 $77
    ret                                           ;; 04:7FA2 $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_04::
    ldh  a, [hActiveEntityStatus]                 ;; 04:7FA3 $F0 $EA
    cp   $05                                      ;; 04:7FA5 $FE $05
    jr   nz, .skip                                ;; 04:7FA7 $20 $25

.allowInactiveEntity
    ld   a, [wGameplayType]                       ;; 04:7FA9 $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 04:7FAC $FE $07
    jr   z, .skip                                 ;; 04:7FAE $28 $1E

    cp   GAMEPLAY_WORLD                           ;; 04:7FB0 $FE $0B
    jr   nz, .skip                                ;; 04:7FB2 $20 $1A

    ld   a, [wTransitionSequenceCounter]          ;; 04:7FB4 $FA $6B $C1
    cp   $04                                      ;; 04:7FB7 $FE $04
    jr   nz, .skip                                ;; 04:7FB9 $20 $13

    ld   hl, wC1A8                                ;; 04:7FBB $21 $A8 $C1
    ld   a, [wDialogState]                        ;; 04:7FBE $FA $9F $C1
    or   [hl]                                     ;; 04:7FC1 $B6
    ld   hl, wInventoryAppearing                  ;; 04:7FC2 $21 $4F $C1
    or   [hl]                                     ;; 04:7FC5 $B6
    jr   nz, .skip                                ;; 04:7FC6 $20 $06

    ld   a, [wRoomTransitionState]                ;; 04:7FC8 $FA $24 $C1
    and  a                                        ;; 04:7FCB $A7
    jr   z, .return                               ;; 04:7FCC $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ;; 04:7FCE $F1

.return
    ret                                           ;; 04:7FCF $C9

