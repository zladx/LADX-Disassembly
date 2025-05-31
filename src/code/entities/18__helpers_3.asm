;
; ENTITY COMMON HELPERS
; These helpers are defined (with small variants) in most entity banks.
;

PushLinkOutOfEntity_18::
    call CheckLinkCollisionWithEnemy_trampoline   ;; 18:7D36 $CD $5A $3B
    jr   nc, .jr_018_7D5A                         ;; 18:7D39 $30 $1F

.forcePush
    call CopyLinkFinalPositionToPosition          ;; 18:7D3B $CD $BE $0C
    call ResetPegasusBoots                        ;; 18:7D3E $CD $B6 $0C
    ld   a, [wC1A6]                               ;; 18:7D41 $FA $A6 $C1
    and  a                                        ;; 18:7D44 $A7
    jr   z, .jr_7D58                              ;; 18:7D45 $28 $11

    ld   e, a                                     ;; 18:7D47 $5F
    ld   d, b                                     ;; 18:7D48 $50
    ld   hl, wEntitiesPrivateState5Table+15       ;; 18:7D49 $21 $9F $C3
    add  hl, de                                   ;; 18:7D4C $19
    ld   a, [hl]                                  ;; 18:7D4D $7E
    cp   $03                                      ;; 18:7D4E $FE $03
    jr   nz, .jr_7D58                             ;; 18:7D50 $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ;; 18:7D52 $21 $8F $C2
    add  hl, de                                   ;; 18:7D55 $19
    ld   [hl], $00                                ;; 18:7D56 $36 $00

.jr_7D58
    scf                                           ;; 18:7D58 $37
    ret                                           ;; 18:7D59 $C9

.jr_018_7D5A
    and  a                                        ;; 18:7D5A $A7
    ret                                           ;; 18:7D5B $C9

EntityVariantForDirection_18::
.right db 6
.left  db 4
.up    db 2
.down  db 0

; Set the entity sprite variant to match the preset entity direction.
; Some inertia is added, so that after a direction change the entity waits for a bit before turning again.
;
; Inputs:
;   bc   entity index
SetEntityVariantForDirection_18::
    ; e = entity direction
    ld   hl, wEntitiesDirectionTable              ;; 18:7D60 $21 $80 $C3
    add  hl, bc                                   ;; 18:7D63 $09
    ld   e, [hl]                                  ;; 18:7D64 $5E

    ld   d, b                                     ;; 18:7D65 $50
    ld   hl, EntityVariantForDirection_18         ;; 18:7D66 $21 $5C $7D
    add  hl, de                                   ;; 18:7D69 $19
    push hl                                       ;; 18:7D6A $E5

    ld   hl, wEntitiesInertiaTable                ;; 18:7D6B $21 $D0 $C3
    add  hl, bc                                   ;; 18:7D6E $09
    inc  [hl]                                     ;; 18:7D6F $34
    ld   a, [hl]                                  ;; 18:7D70 $7E
    rra                                           ;; 18:7D71 $1F
    rra                                           ;; 18:7D72 $1F
    rra                                           ;; 18:7D73 $1F
    rra                                           ;; 18:7D74 $1F

    pop  hl                                       ;; 18:7D75 $E1
    and  $01                                      ;; 18:7D76 $E6 $01
    or   [hl]                                     ;; 18:7D78 $B6

    jp   SetEntitySpriteVariant                   ;; 18:7D79 $C3 $0C $3B

func_018_7D7C::
    ld   e, b                                     ;; 18:7D7C $58
    ldh  a, [hLinkPositionY]                      ;; 18:7D7D $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 18:7D7F $21 $EF $FF
    sub  [hl]                                     ;; 18:7D82 $96
    add  $18                                      ;; 18:7D83 $C6 $18
    cp   $38                                      ;; 18:7D85 $FE $38
    jr   func_018_7DA0                            ;; 18:7D87 $18 $17

ShouldLinkTalkToEntity_18::
    ldh  a, [hLinkPositionY]                      ;; 18:7D89 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 18:7D8B $21 $EF $FF
    sub  [hl]                                     ;; 18:7D8E $96
    add  $14                                      ;; 18:7D8F $C6 $14
    cp   $38                                      ;; 18:7D91 $FE $38
    jr   func_018_7DA0                            ;; 18:7D93 $18 $0B

func_018_7D95::
    ld   e, b                                     ;; 18:7D95 $58
    ldh  a, [hLinkPositionY]                      ;; 18:7D96 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 18:7D98 $21 $EF $FF
    sub  [hl]                                     ;; 18:7D9B $96
    add  $14                                      ;; 18:7D9C $C6 $14
    cp   $28                                      ;; 18:7D9E $FE $28

func_018_7DA0::
    jr   nc, jr_018_7DE6                          ;; 18:7DA0 $30 $44

    ldh  a, [hLinkPositionX]                      ;; 18:7DA2 $F0 $98
    ld   hl, hActiveEntityPosX                    ;; 18:7DA4 $21 $EE $FF
    sub  [hl]                                     ;; 18:7DA7 $96
    add  $10                                      ;; 18:7DA8 $C6 $10
    cp   $20                                      ;; 18:7DAA $FE $20
    jr   nc, jr_018_7DE6                          ;; 18:7DAC $30 $38

    inc  e                                        ;; 18:7DAE $1C
    ldh  a, [hActiveEntityType]                   ;; 18:7DAF $F0 $EB
    cp   ENTITY_WALRUS                            ;; 18:7DB1 $FE $C4
    jr   z, .jr_7DC1                              ;; 18:7DB3 $28 $0C

    push de                                       ;; 18:7DB5 $D5
    call func_018_7EE1                            ;; 18:7DB6 $CD $E1 $7E
    ldh  a, [hLinkDirection]                      ;; 18:7DB9 $F0 $9E
    xor  $01                                      ;; 18:7DBB $EE $01
    cp   e                                        ;; 18:7DBD $BB
    pop  de                                       ;; 18:7DBE $D1
    jr   nz, jr_018_7DE6                          ;; 18:7DBF $20 $25

.jr_7DC1
    ld   hl, wItemUsageContext                    ;; 18:7DC1 $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 18:7DC4 $36 $01
    ld   a, [wDialogState]                        ;; 18:7DC6 $FA $9F $C1
    ld   hl, wInventoryAppearing                  ;; 18:7DC9 $21 $4F $C1
    or   [hl]                                     ;; 18:7DCC $B6
    ld   hl, wIsLinkInTheAir                      ;; 18:7DCD $21 $46 $C1
    or   [hl]                                     ;; 18:7DD0 $B6
    ld   hl, wDialogCooldown                      ;; 18:7DD1 $21 $34 $C1
    or   [hl]                                     ;; 18:7DD4 $B6
    jr   nz, jr_018_7DE6                          ;; 18:7DD5 $20 $0F

    ld   a, [wWindowY]                            ;; 18:7DD7 $FA $9A $DB
    cp   $80                                      ;; 18:7DDA $FE $80
    jr   nz, jr_018_7DE6                          ;; 18:7DDC $20 $08

    ldh  a, [hJoypadState]                        ;; 18:7DDE $F0 $CC
    and  J_A                                      ;; 18:7DE0 $E6 $10
    jr   z, jr_018_7DE6                           ;; 18:7DE2 $28 $02

    scf                                           ;; 18:7DE4 $37
    ret                                           ;; 18:7DE5 $C9

jr_018_7DE6:
    and  a                                        ;; 18:7DE6 $A7
    ret                                           ;; 18:7DE7 $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_18::
    ldh  a, [hActiveEntityStatus]                 ;; 18:7DE8 $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ;; 18:7DEA $FE $05
    jr   nz, .skip                                ;; 18:7DEC $20 $25

.allowInactiveEntity
    ld   a, [wGameplayType]                       ;; 18:7DEE $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 18:7DF1 $FE $07
    jr   z, .skip                                 ;; 18:7DF3 $28 $1E

    cp   GAMEPLAY_WORLD                           ;; 18:7DF5 $FE $0B
    jr   nz, .skip                                ;; 18:7DF7 $20 $1A

    ld   a, [wTransitionSequenceCounter]          ;; 18:7DF9 $FA $6B $C1
    cp   $04                                      ;; 18:7DFC $FE $04
    jr   nz, .skip                                ;; 18:7DFE $20 $13

    ld   hl, wC1A8                                ;; 18:7E00 $21 $A8 $C1
    ld   a, [wDialogState]                        ;; 18:7E03 $FA $9F $C1
    or   [hl]                                     ;; 18:7E06 $B6
    ld   hl, wInventoryAppearing                  ;; 18:7E07 $21 $4F $C1
    or   [hl]                                     ;; 18:7E0A $B6
    jr   nz, .skip                                ;; 18:7E0B $20 $06

    ld   a, [wRoomTransitionState]                ;; 18:7E0D $FA $24 $C1
    and  a                                        ;; 18:7E10 $A7
    jr   z, .return                               ;; 18:7E11 $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ;; 18:7E13 $F1

.return
    ret                                           ;; 18:7E14 $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_18::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 18:7E15 $21 $10 $C4
    add  hl, bc                                   ;; 18:7E18 $09
    ld   a, [hl]                                  ;; 18:7E19 $7E
    and  a                                        ;; 18:7E1A $A7
    jr   z, .return                               ;; 18:7E1B $28 $41

    dec  a                                        ;; 18:7E1D $3D
    ld   [hl], a                                  ;; 18:7E1E $77

    call label_3E8E                               ;; 18:7E1F $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ;; 18:7E22 $21 $40 $C2
    add  hl, bc                                   ;; 18:7E25 $09
    ld   a, [hl]                                  ;; 18:7E26 $7E
    push af                                       ;; 18:7E27 $F5

    ld   hl, wEntitiesSpeedYTable                 ;; 18:7E28 $21 $50 $C2
    add  hl, bc                                   ;; 18:7E2B $09
    ld   a, [hl]                                  ;; 18:7E2C $7E
    push af                                       ;; 18:7E2D $F5

    ld   hl, wEntitiesRecoilVelocityX             ;; 18:7E2E $21 $F0 $C3
    add  hl, bc                                   ;; 18:7E31 $09
    ld   a, [hl]                                  ;; 18:7E32 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 18:7E33 $21 $40 $C2
    add  hl, bc                                   ;; 18:7E36 $09
    ld   [hl], a                                  ;; 18:7E37 $77

    ld   hl, wEntitiesRecoilVelocityY             ;; 18:7E38 $21 $00 $C4
    add  hl, bc                                   ;; 18:7E3B $09
    ld   a, [hl]                                  ;; 18:7E3C $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 18:7E3D $21 $50 $C2
    add  hl, bc                                   ;; 18:7E40 $09
    ld   [hl], a                                  ;; 18:7E41 $77

    call UpdateEntityPosWithSpeed_18              ;; 18:7E42 $CD $5F $7E

    ld   hl, wEntitiesOptions1Table               ;; 18:7E45 $21 $30 $C4
    add  hl, bc                                   ;; 18:7E48 $09
    ld   a, [hl]                                  ;; 18:7E49 $7E
    and  $20                                      ;; 18:7E4A $E6 $20
    jr   nz, .restoreOriginalSpeed                ;; 18:7E4C $20 $03

    call ApplyEntityInteractionWithBackground_trampoline ;; 18:7E4E $CD $23 $3B

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ;; 18:7E51 $21 $50 $C2
    add  hl, bc                                   ;; 18:7E54 $09
    pop  af                                       ;; 18:7E55 $F1
    ld   [hl], a                                  ;; 18:7E56 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 18:7E57 $21 $40 $C2
    add  hl, bc                                   ;; 18:7E5A $09
    pop  af                                       ;; 18:7E5B $F1
    ld   [hl], a                                  ;; 18:7E5C $77
    pop  af                                       ;; 18:7E5D $F1

.return
    ret                                           ;; 18:7E5E $C9

UpdateEntityPosWithSpeed_18::
    call AddEntitySpeedToPos_18                   ;; 18:7E5F $CD $6C $7E

UpdateEntityYPosWithSpeed_18::
    push bc                                       ;; 18:7E62 $C5
    ld   a, c                                     ;; 18:7E63 $79
    add  $10                                      ;; 18:7E64 $C6 $10
    ld   c, a                                     ;; 18:7E66 $4F
    call AddEntitySpeedToPos_18                   ;; 18:7E67 $CD $6C $7E
    pop  bc                                       ;; 18:7E6A $C1
    ret                                           ;; 18:7E6B $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_18::
    ld   hl, wEntitiesSpeedXTable                 ;; 18:7E6C $21 $40 $C2
    add  hl, bc                                   ;; 18:7E6F $09
    ld   a, [hl]                                  ;; 18:7E70 $7E
    and  a                                        ;; 18:7E71 $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ;; 18:7E72 $28 $23

    push af                                       ;; 18:7E74 $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ;; 18:7E75 $CB $37
    and  $F0                                      ;; 18:7E77 $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 18:7E79 $21 $60 $C2
    add  hl, bc                                   ;; 18:7E7C $09
    add  [hl]                                     ;; 18:7E7D $86
    ld   [hl], a                                  ;; 18:7E7E $77
    ; Save carry in bit 0 of d
    rl   d                                        ;; 18:7E7F $CB $12
    ld   hl, wEntitiesPosXTable                   ;; 18:7E81 $21 $00 $C2

.updatePosition
    add  hl, bc                                   ;; 18:7E84 $09
    pop  af                                       ;; 18:7E85 $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ;; 18:7E86 $1E $00
    bit  7, a                                     ;; 18:7E88 $CB $7F
    jr   z, .positive                             ;; 18:7E8A $28 $02

    ld   e, $F0                                   ;; 18:7E8C $1E $F0

.positive
    swap a                                        ;; 18:7E8E $CB $37
    and  $0F                                      ;; 18:7E90 $E6 $0F
    or   e                                        ;; 18:7E92 $B3
    ; Get carry back from d
    rr   d                                        ;; 18:7E93 $CB $1A
    adc  [hl]                                     ;; 18:7E95 $8E
    ld   [hl], a                                  ;; 18:7E96 $77

.return
    ret                                           ;; 18:7E97 $C9

AddEntityZSpeedToPos_18::
    ld   hl, wEntitiesSpeedZTable                 ;; 18:7E98 $21 $20 $C3
    add  hl, bc                                   ;; 18:7E9B $09
    ld   a, [hl]                                  ;; 18:7E9C $7E
    and  a                                        ;; 18:7E9D $A7
    jr   z, AddEntitySpeedToPos_18.return         ;; 18:7E9E $28 $F7

    push af                                       ;; 18:7EA0 $F5
    swap a                                        ;; 18:7EA1 $CB $37
    and  $F0                                      ;; 18:7EA3 $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ;; 18:7EA5 $21 $30 $C3
    add  hl, bc                                   ;; 18:7EA8 $09
    add  [hl]                                     ;; 18:7EA9 $86
    ld   [hl], a                                  ;; 18:7EAA $77
    rl   d                                        ;; 18:7EAB $CB $12
    ld   hl, wEntitiesPosZTable                   ;; 18:7EAD $21 $10 $C3
    jr   AddEntitySpeedToPos_18.updatePosition    ;; 18:7EB0 $18 $D2

func_018_7EB2::
    ld   e, $00                                   ;; 18:7EB2 $1E $00
    ldh  a, [hLinkPositionX]                      ;; 18:7EB4 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 18:7EB6 $21 $00 $C2
    add  hl, bc                                   ;; 18:7EB9 $09
    sub  [hl]                                     ;; 18:7EBA $96
    bit  7, a                                     ;; 18:7EBB $CB $7F
    jr   z, .jr_7EC0                              ;; 18:7EBD $28 $01

    inc  e                                        ;; 18:7EBF $1C

.jr_7EC0
    ld   d, a                                     ;; 18:7EC0 $57
    ret                                           ;; 18:7EC1 $C9

func_018_7EC2::
    ld   e, $02                                   ;; 18:7EC2 $1E $02
    ldh  a, [hLinkPositionY]                      ;; 18:7EC4 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 18:7EC6 $21 $10 $C2
    add  hl, bc                                   ;; 18:7EC9 $09
    sub  [hl]                                     ;; 18:7ECA $96
    bit  7, a                                     ;; 18:7ECB $CB $7F
    jr   nz, .jr_7ED0                             ;; 18:7ECD $20 $01

    inc  e                                        ;; 18:7ECF $1C

.jr_7ED0
    ld   d, a                                     ;; 18:7ED0 $57
    ret                                           ;; 18:7ED1 $C9

func_018_7ED2::
    ld   e, $02                                   ;; 18:7ED2 $1E $02
    ldh  a, [hLinkPositionY]                      ;; 18:7ED4 $F0 $99
    ld   hl, hActiveEntityVisualPosY              ;; 18:7ED6 $21 $EC $FF
    sub  [hl]                                     ;; 18:7ED9 $96
    bit  7, a                                     ;; 18:7EDA $CB $7F
    jr   nz, .jr_7EDF                             ;; 18:7EDC $20 $01

    inc  e                                        ;; 18:7EDE $1C

.jr_7EDF
    ld   d, a                                     ;; 18:7EDF $57
    ret                                           ;; 18:7EE0 $C9

func_018_7EE1::
    call func_018_7EB2                            ;; 18:7EE1 $CD $B2 $7E
    ld   a, e                                     ;; 18:7EE4 $7B
    ldh  [hMultiPurpose0], a                      ;; 18:7EE5 $E0 $D7
    ld   a, d                                     ;; 18:7EE7 $7A
    bit  7, a                                     ;; 18:7EE8 $CB $7F
    jr   z, .jr_7EEE                              ;; 18:7EEA $28 $02

    cpl                                           ;; 18:7EEC $2F
    inc  a                                        ;; 18:7EED $3C

.jr_7EEE
    push af                                       ;; 18:7EEE $F5
    call func_018_7EC2                            ;; 18:7EEF $CD $C2 $7E
    ld   a, e                                     ;; 18:7EF2 $7B
    ldh  [hMultiPurpose1], a                      ;; 18:7EF3 $E0 $D8
    ld   a, d                                     ;; 18:7EF5 $7A
    bit  7, a                                     ;; 18:7EF6 $CB $7F
    jr   z, .jr_7EFC                              ;; 18:7EF8 $28 $02

    cpl                                           ;; 18:7EFA $2F
    inc  a                                        ;; 18:7EFB $3C

.jr_7EFC
    pop  de                                       ;; 18:7EFC $D1
    cp   d                                        ;; 18:7EFD $BA
    jr   nc, .jr_7F04                             ;; 18:7EFE $30 $04

    ldh  a, [hMultiPurpose0]                      ;; 18:7F00 $F0 $D7
    jr   jr_018_7F06                              ;; 18:7F02 $18 $02

.jr_7F04
    ldh  a, [hMultiPurpose1]                      ;; 18:7F04 $F0 $D8

jr_018_7F06:
    ld   e, a                                     ;; 18:7F06 $5F
    ret                                           ;; 18:7F07 $C9

ClearEntityStatusBank18::
    ld   hl, wEntitiesStatusTable                 ;; 18:7F08 $21 $80 $C2
    add  hl, bc                                   ;; 18:7F0B $09
    ld   [hl], $00                                ;; 18:7F0C $36 $00
    ret                                           ;; 18:7F0E $C9

; Kill boss or mini-boss enemy with explosions animation
AnimateBossAgony_18::
    ld   hl, wEntitiesPrivateState2Table          ;; 18:7F0F $21 $C0 $C2
    add  hl, bc                                   ;; 18:7F12 $09
    ld   a, [hl]                                  ;; 18:7F13 $7E
    JP_TABLE                                      ;; 18:7F14
._00 dw func_018_7F1B                             ;; 18:7F15
._01 dw func_018_7F2C                             ;; 18:7F17
._02 dw func_018_7F3B                             ;; 18:7F19

func_018_7F1B::
    call GetEntityTransitionCountdown             ;; 18:7F1B $CD $05 $0C
    ld   [hl], $A0                                ;; 18:7F1E $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ;; 18:7F20 $21 $20 $C4
    add  hl, bc                                   ;; 18:7F23 $09
    ld   [hl], $FF                                ;; 18:7F24 $36 $FF

label_018_7F26:
    ld   hl, wEntitiesPrivateState2Table          ;; 18:7F26 $21 $C0 $C2
    add  hl, bc                                   ;; 18:7F29 $09
    inc  [hl]                                     ;; 18:7F2A $34
    ret                                           ;; 18:7F2B $C9

func_018_7F2C::
    call GetEntityTransitionCountdown             ;; 18:7F2C $CD $05 $0C
    ret  nz                                       ;; 18:7F2F $C0

    ld   [hl], $C0                                ;; 18:7F30 $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ;; 18:7F32 $21 $20 $C4
    add  hl, bc                                   ;; 18:7F35 $09
    ld   [hl], $FF                                ;; 18:7F36 $36 $FF
    jp   label_018_7F26                           ;; 18:7F38 $C3 $26 $7F

func_018_7F3B::
    call GetEntityTransitionCountdown             ;; 18:7F3B $CD $05 $0C
    jr   nz, .jr_7F4C                             ;; 18:7F3E $20 $0C

    call PlayBombExplosionSfx                     ;; 18:7F40 $CD $4B $0C
    call label_27DD                               ;; 18:7F43 $CD $DD $27
    call SetRoomStatus20                          ;; 18:7F46 $CD $B9 $7F
    jp   DidKillEnemy                             ;; 18:7F49 $C3 $50 $3F

.jr_7F4C
    jp   label_018_7F4F                           ;; 18:7F4C $C3 $4F $7F

label_018_7F4F:
    and  $07                                      ;; 18:7F4F $E6 $07
    ret  nz                                       ;; 18:7F51 $C0

    call GetRandomByte                            ;; 18:7F52 $CD $0D $28
    and  $1F                                      ;; 18:7F55 $E6 $1F
    sub  $10                                      ;; 18:7F57 $D6 $10
    ld   e, a                                     ;; 18:7F59 $5F
    ld   hl, hActiveEntityPosX                    ;; 18:7F5A $21 $EE $FF
    add  [hl]                                     ;; 18:7F5D $86
    ld   [hl], a                                  ;; 18:7F5E $77
    call GetRandomByte                            ;; 18:7F5F $CD $0D $28
    and  $1F                                      ;; 18:7F62 $E6 $1F
    sub  $14                                      ;; 18:7F64 $D6 $14
    ld   e, a                                     ;; 18:7F66 $5F
    ld   hl, hActiveEntityVisualPosY              ;; 18:7F67 $21 $EC $FF
    add  [hl]                                     ;; 18:7F6A $86
    ld   [hl], a                                  ;; 18:7F6B $77
    jp   label_018_7F6F                           ;; 18:7F6C $C3 $6F $7F

label_018_7F6F:
    call ReturnIfNonInteractive_18.allowInactiveEntity ;; 18:7F6F $CD $EE $7D
    ldh  a, [hActiveEntityPosX]                   ;; 18:7F72 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 18:7F74 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:7F76 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 18:7F78 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 18:7F7A $3E $02
    call AddTranscientVfx                         ;; 18:7F7C $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ;; 18:7F7F $3E $13
    ldh  [hNoiseSfx], a                           ;; 18:7F81 $E0 $F4
    ret                                           ;; 18:7F83 $C9

    ld   a, ENTITY_HEART_CONTAINER                ;; 18:7F84 $3E $36
    call SpawnNewEntity_trampoline                ;; 18:7F86 $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 18:7F89 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 18:7F8B $21 $00 $C2
    add  hl, de                                   ;; 18:7F8E $19
    ld   [hl], a                                  ;; 18:7F8F $77
    ldh  a, [hMultiPurpose1]                      ;; 18:7F90 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 18:7F92 $21 $10 $C2
    add  hl, de                                   ;; 18:7F95 $19
    ld   [hl], a                                  ;; 18:7F96 $77
    ldh  a, [hIsSideScrolling]                    ;; 18:7F97 $F0 $F9
    and  a                                        ;; 18:7F99 $A7
    jr   z, .jr_7FA4                              ;; 18:7F9A $28 $08

    ld   hl, wEntitiesSpeedYTable                 ;; 18:7F9C $21 $50 $C2
    add  hl, bc                                   ;; 18:7F9F $09
    ld   [hl], $F0                                ;; 18:7FA0 $36 $F0
    jr   jr_018_7FB0                              ;; 18:7FA2 $18 $0C

.jr_7FA4
    ld   hl, wEntitiesSpeedZTable                 ;; 18:7FA4 $21 $20 $C3
    add  hl, de                                   ;; 18:7FA7 $19
    ld   [hl], $10                                ;; 18:7FA8 $36 $10
    ld   hl, wEntitiesPosZTable                   ;; 18:7FAA $21 $10 $C3
    add  hl, de                                   ;; 18:7FAD $19
    ld   [hl], $08                                ;; 18:7FAE $36 $08

jr_018_7FB0:
    call ClearEntityStatusBank18                  ;; 18:7FB0 $CD $08 $7F
    ld   hl, hNoiseSfx                            ;; 18:7FB3 $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ;; 18:7FB6 $36 $1A
    ret                                           ;; 18:7FB8 $C9

SetRoomStatus20::
    ld   hl, wOverworldRoomStatus                 ;; 18:7FB9 $21 $00 $D8
    ldh  a, [hMapRoom]                            ;; 18:7FBC $F0 $F6
    ld   e, a                                     ;; 18:7FBE $5F
    ld   a, [wIsIndoor]                           ;; 18:7FBF $FA $A5 $DB
    ld   d, a                                     ;; 18:7FC2 $57

    ; If the map uses rooms in the indoors_b rooms group…
    ldh  a, [hMapId]                              ;; 18:7FC3 $F0 $F7
    cp   MAP_INDOORS_B_END                        ;; 18:7FC5 $FE $1A
    jr   nc, .notIndoorB                          ;; 18:7FC7 $30 $05
    cp   MAP_INDOORS_B_START                      ;; 18:7FC9 $FE $06
    jr   c, .notIndoorB                           ;; 18:7FCB $38 $01
    inc  d                                        ;; 18:7FCD $14
.notIndoorB

    add  hl, de                                   ;; 18:7FCE $19
    ld   a, [hl]                                  ;; 18:7FCF $7E
    or   ROOM_STATUS_EVENT_2                      ;; 18:7FD0 $F6 $20
    ld   [hl], a                                  ;; 18:7FD2 $77
    ldh  [hRoomStatus], a                         ;; 18:7FD3 $E0 $F8
    ret                                           ;; 18:7FD5 $C9
