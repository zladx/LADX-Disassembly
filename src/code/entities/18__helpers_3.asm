;
; ENTITY COMMON HELPERS
; These helpers are defined (with small variants) in most entity banks.
;

PushLinkOutOfEntity_18::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7D36: $CD $5A $3B
    jr   nc, .jr_018_7D5A                         ; $7D39: $30 $1F

.forcePush
    call CopyLinkFinalPositionToPosition          ; $7D3B: $CD $BE $0C
    call ResetPegasusBoots                        ; $7D3E: $CD $B6 $0C
    ld   a, [wC1A6]                               ; $7D41: $FA $A6 $C1
    and  a                                        ; $7D44: $A7
    jr   z, .jr_7D58                              ; $7D45: $28 $11

    ld   e, a                                     ; $7D47: $5F
    ld   d, b                                     ; $7D48: $50
    ld   hl, wEntitiesPrivateState5Table+15       ; $7D49: $21 $9F $C3
    add  hl, de                                   ; $7D4C: $19
    ld   a, [hl]                                  ; $7D4D: $7E
    cp   $03                                      ; $7D4E: $FE $03
    jr   nz, .jr_7D58                             ; $7D50: $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ; $7D52: $21 $8F $C2
    add  hl, de                                   ; $7D55: $19
    ld   [hl], $00                                ; $7D56: $36 $00

.jr_7D58
    scf                                           ; $7D58: $37
    ret                                           ; $7D59: $C9

.jr_018_7D5A
    and  a                                        ; $7D5A: $A7
    ret                                           ; $7D5B: $C9

Data_018_7D5C::
    db   $06, $04, $02, $00

func_018_7D60::
    ld   hl, wEntitiesDirectionTable              ; $7D60: $21 $80 $C3
    add  hl, bc                                   ; $7D63: $09
    ld   e, [hl]                                  ; $7D64: $5E
    ld   d, b                                     ; $7D65: $50
    ld   hl, Data_018_7D5C                        ; $7D66: $21 $5C $7D
    add  hl, de                                   ; $7D69: $19
    push hl                                       ; $7D6A: $E5
    ld   hl, wEntitiesInertiaTable                ; $7D6B: $21 $D0 $C3
    add  hl, bc                                   ; $7D6E: $09
    inc  [hl]                                     ; $7D6F: $34
    ld   a, [hl]                                  ; $7D70: $7E
    rra                                           ; $7D71: $1F
    rra                                           ; $7D72: $1F
    rra                                           ; $7D73: $1F
    rra                                           ; $7D74: $1F
    pop  hl                                       ; $7D75: $E1
    and  $01                                      ; $7D76: $E6 $01
    or   [hl]                                     ; $7D78: $B6
    jp   SetEntitySpriteVariant                   ; $7D79: $C3 $0C $3B

func_018_7D7C::
    ld   e, b                                     ; $7D7C: $58
    ldh  a, [hLinkPositionY]                      ; $7D7D: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D7F: $21 $EF $FF
    sub  [hl]                                     ; $7D82: $96
    add  $18                                      ; $7D83: $C6 $18
    cp   $38                                      ; $7D85: $FE $38
    jr   func_018_7DA0                            ; $7D87: $18 $17

ShouldLinkTalkToEntity_18::
    ldh  a, [hLinkPositionY]                      ; $7D89: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D8B: $21 $EF $FF
    sub  [hl]                                     ; $7D8E: $96
    add  $14                                      ; $7D8F: $C6 $14
    cp   $38                                      ; $7D91: $FE $38
    jr   func_018_7DA0                            ; $7D93: $18 $0B

func_018_7D95::
    ld   e, b                                     ; $7D95: $58
    ldh  a, [hLinkPositionY]                      ; $7D96: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D98: $21 $EF $FF
    sub  [hl]                                     ; $7D9B: $96
    add  $14                                      ; $7D9C: $C6 $14
    cp   $28                                      ; $7D9E: $FE $28

func_018_7DA0::
    jr   nc, jr_018_7DE6                          ; $7DA0: $30 $44

    ldh  a, [hLinkPositionX]                      ; $7DA2: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7DA4: $21 $EE $FF
    sub  [hl]                                     ; $7DA7: $96
    add  $10                                      ; $7DA8: $C6 $10
    cp   $20                                      ; $7DAA: $FE $20
    jr   nc, jr_018_7DE6                          ; $7DAC: $30 $38

    inc  e                                        ; $7DAE: $1C
    ldh  a, [hActiveEntityType]                   ; $7DAF: $F0 $EB
    cp   ENTITY_WALRUS                            ; $7DB1: $FE $C4
    jr   z, .jr_7DC1                              ; $7DB3: $28 $0C

    push de                                       ; $7DB5: $D5
    call func_018_7EE1                            ; $7DB6: $CD $E1 $7E
    ldh  a, [hLinkDirection]                      ; $7DB9: $F0 $9E
    xor  $01                                      ; $7DBB: $EE $01
    cp   e                                        ; $7DBD: $BB
    pop  de                                       ; $7DBE: $D1
    jr   nz, jr_018_7DE6                          ; $7DBF: $20 $25

.jr_7DC1
    ld   hl, wItemUsageContext                    ; $7DC1: $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ; $7DC4: $36 $01
    ld   a, [wDialogState]                        ; $7DC6: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7DC9: $21 $4F $C1
    or   [hl]                                     ; $7DCC: $B6
    ld   hl, wIsLinkInTheAir                      ; $7DCD: $21 $46 $C1
    or   [hl]                                     ; $7DD0: $B6
    ld   hl, wDialogCooldown                      ; $7DD1: $21 $34 $C1
    or   [hl]                                     ; $7DD4: $B6
    jr   nz, jr_018_7DE6                          ; $7DD5: $20 $0F

    ld   a, [wWindowY]                            ; $7DD7: $FA $9A $DB
    cp   $80                                      ; $7DDA: $FE $80
    jr   nz, jr_018_7DE6                          ; $7DDC: $20 $08

    ldh  a, [hJoypadState]                        ; $7DDE: $F0 $CC
    and  J_A                                      ; $7DE0: $E6 $10
    jr   z, jr_018_7DE6                           ; $7DE2: $28 $02

    scf                                           ; $7DE4: $37
    ret                                           ; $7DE5: $C9

jr_018_7DE6:
    and  a                                        ; $7DE6: $A7
    ret                                           ; $7DE7: $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_18::
    ldh  a, [hActiveEntityStatus]                 ; $7DE8: $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ; $7DEA: $FE $05
    jr   nz, .skip                                ; $7DEC: $20 $25

.allowInactiveEntity
    ld   a, [wGameplayType]                       ; $7DEE: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $7DF1: $FE $07
    jr   z, .skip                                 ; $7DF3: $28 $1E

    cp   GAMEPLAY_WORLD                           ; $7DF5: $FE $0B
    jr   nz, .skip                                ; $7DF7: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7DF9: $FA $6B $C1
    cp   $04                                      ; $7DFC: $FE $04
    jr   nz, .skip                                ; $7DFE: $20 $13

    ld   hl, wC1A8                                ; $7E00: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7E03: $FA $9F $C1
    or   [hl]                                     ; $7E06: $B6
    ld   hl, wInventoryAppearing                  ; $7E07: $21 $4F $C1
    or   [hl]                                     ; $7E0A: $B6
    jr   nz, .skip                                ; $7E0B: $20 $06

    ld   a, [wRoomTransitionState]                ; $7E0D: $FA $24 $C1
    and  a                                        ; $7E10: $A7
    jr   z, .return                               ; $7E11: $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ; $7E13: $F1

.return
    ret                                           ; $7E14: $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_18::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7E15: $21 $10 $C4
    add  hl, bc                                   ; $7E18: $09
    ld   a, [hl]                                  ; $7E19: $7E
    and  a                                        ; $7E1A: $A7
    jr   z, .return                               ; $7E1B: $28 $41

    dec  a                                        ; $7E1D: $3D
    ld   [hl], a                                  ; $7E1E: $77

    call label_3E8E                               ; $7E1F: $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ; $7E22: $21 $40 $C2
    add  hl, bc                                   ; $7E25: $09
    ld   a, [hl]                                  ; $7E26: $7E
    push af                                       ; $7E27: $F5

    ld   hl, wEntitiesSpeedYTable                 ; $7E28: $21 $50 $C2
    add  hl, bc                                   ; $7E2B: $09
    ld   a, [hl]                                  ; $7E2C: $7E
    push af                                       ; $7E2D: $F5

    ld   hl, wEntitiesRecoilVelocityX             ; $7E2E: $21 $F0 $C3
    add  hl, bc                                   ; $7E31: $09
    ld   a, [hl]                                  ; $7E32: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7E33: $21 $40 $C2
    add  hl, bc                                   ; $7E36: $09
    ld   [hl], a                                  ; $7E37: $77

    ld   hl, wEntitiesRecoilVelocityY             ; $7E38: $21 $00 $C4
    add  hl, bc                                   ; $7E3B: $09
    ld   a, [hl]                                  ; $7E3C: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7E3D: $21 $50 $C2
    add  hl, bc                                   ; $7E40: $09
    ld   [hl], a                                  ; $7E41: $77

    call UpdateEntityPosWithSpeed_18              ; $7E42: $CD $5F $7E

    ld   hl, wEntitiesOptions1Table               ; $7E45: $21 $30 $C4
    add  hl, bc                                   ; $7E48: $09
    ld   a, [hl]                                  ; $7E49: $7E
    and  $20                                      ; $7E4A: $E6 $20
    jr   nz, .restoreOriginalSpeed                ; $7E4C: $20 $03

    call label_3B23                               ; $7E4E: $CD $23 $3B

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ; $7E51: $21 $50 $C2
    add  hl, bc                                   ; $7E54: $09
    pop  af                                       ; $7E55: $F1
    ld   [hl], a                                  ; $7E56: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7E57: $21 $40 $C2
    add  hl, bc                                   ; $7E5A: $09
    pop  af                                       ; $7E5B: $F1
    ld   [hl], a                                  ; $7E5C: $77
    pop  af                                       ; $7E5D: $F1

.return
    ret                                           ; $7E5E: $C9

UpdateEntityPosWithSpeed_18::
    call AddEntitySpeedToPos_18                   ; $7E5F: $CD $6C $7E

UpdateEntityYPosWithSpeed_18::
    push bc                                       ; $7E62: $C5
    ld   a, c                                     ; $7E63: $79
    add  $10                                      ; $7E64: $C6 $10
    ld   c, a                                     ; $7E66: $4F
    call AddEntitySpeedToPos_18                   ; $7E67: $CD $6C $7E
    pop  bc                                       ; $7E6A: $C1
    ret                                           ; $7E6B: $C9

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
    ld   hl, wEntitiesSpeedXTable                 ; $7E6C: $21 $40 $C2
    add  hl, bc                                   ; $7E6F: $09
    ld   a, [hl]                                  ; $7E70: $7E
    and  a                                        ; $7E71: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7E72: $28 $23

    push af                                       ; $7E74: $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ; $7E75: $CB $37
    and  $F0                                      ; $7E77: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7E79: $21 $60 $C2
    add  hl, bc                                   ; $7E7C: $09
    add  [hl]                                     ; $7E7D: $86
    ld   [hl], a                                  ; $7E7E: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7E7F: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7E81: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $7E84: $09
    pop  af                                       ; $7E85: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7E86: $1E $00
    bit  7, a                                     ; $7E88: $CB $7F
    jr   z, .positive                             ; $7E8A: $28 $02

    ld   e, $F0                                   ; $7E8C: $1E $F0

.positive
    swap a                                        ; $7E8E: $CB $37
    and  $0F                                      ; $7E90: $E6 $0F
    or   e                                        ; $7E92: $B3
    ; Get carry back from d
    rr   d                                        ; $7E93: $CB $1A
    adc  [hl]                                     ; $7E95: $8E
    ld   [hl], a                                  ; $7E96: $77

.return
    ret                                           ; $7E97: $C9

AddEntityZSpeedToPos_18::
    ld   hl, wEntitiesSpeedZTable                 ; $7E98: $21 $20 $C3
    add  hl, bc                                   ; $7E9B: $09
    ld   a, [hl]                                  ; $7E9C: $7E
    and  a                                        ; $7E9D: $A7
    jr   z, AddEntitySpeedToPos_18.return         ; $7E9E: $28 $F7

    push af                                       ; $7EA0: $F5
    swap a                                        ; $7EA1: $CB $37
    and  $F0                                      ; $7EA3: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $7EA5: $21 $30 $C3
    add  hl, bc                                   ; $7EA8: $09
    add  [hl]                                     ; $7EA9: $86
    ld   [hl], a                                  ; $7EAA: $77
    rl   d                                        ; $7EAB: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7EAD: $21 $10 $C3
    jr   AddEntitySpeedToPos_18.updatePosition    ; $7EB0: $18 $D2

func_018_7EB2::
    ld   e, $00                                   ; $7EB2: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7EB4: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7EB6: $21 $00 $C2
    add  hl, bc                                   ; $7EB9: $09
    sub  [hl]                                     ; $7EBA: $96
    bit  7, a                                     ; $7EBB: $CB $7F
    jr   z, .jr_7EC0                              ; $7EBD: $28 $01

    inc  e                                        ; $7EBF: $1C

.jr_7EC0
    ld   d, a                                     ; $7EC0: $57
    ret                                           ; $7EC1: $C9

func_018_7EC2::
    ld   e, $02                                   ; $7EC2: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7EC4: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7EC6: $21 $10 $C2
    add  hl, bc                                   ; $7EC9: $09
    sub  [hl]                                     ; $7ECA: $96
    bit  7, a                                     ; $7ECB: $CB $7F
    jr   nz, .jr_7ED0                             ; $7ECD: $20 $01

    inc  e                                        ; $7ECF: $1C

.jr_7ED0
    ld   d, a                                     ; $7ED0: $57
    ret                                           ; $7ED1: $C9

func_018_7ED2::
    ld   e, $02                                   ; $7ED2: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7ED4: $F0 $99
    ld   hl, hActiveEntityVisualPosY              ; $7ED6: $21 $EC $FF
    sub  [hl]                                     ; $7ED9: $96
    bit  7, a                                     ; $7EDA: $CB $7F
    jr   nz, .jr_7EDF                             ; $7EDC: $20 $01

    inc  e                                        ; $7EDE: $1C

.jr_7EDF
    ld   d, a                                     ; $7EDF: $57
    ret                                           ; $7EE0: $C9

func_018_7EE1::
    call func_018_7EB2                            ; $7EE1: $CD $B2 $7E
    ld   a, e                                     ; $7EE4: $7B
    ldh  [hMultiPurpose0], a                      ; $7EE5: $E0 $D7
    ld   a, d                                     ; $7EE7: $7A
    bit  7, a                                     ; $7EE8: $CB $7F
    jr   z, .jr_7EEE                              ; $7EEA: $28 $02

    cpl                                           ; $7EEC: $2F
    inc  a                                        ; $7EED: $3C

.jr_7EEE
    push af                                       ; $7EEE: $F5
    call func_018_7EC2                            ; $7EEF: $CD $C2 $7E
    ld   a, e                                     ; $7EF2: $7B
    ldh  [hMultiPurpose1], a                      ; $7EF3: $E0 $D8
    ld   a, d                                     ; $7EF5: $7A
    bit  7, a                                     ; $7EF6: $CB $7F
    jr   z, .jr_7EFC                              ; $7EF8: $28 $02

    cpl                                           ; $7EFA: $2F
    inc  a                                        ; $7EFB: $3C

.jr_7EFC
    pop  de                                       ; $7EFC: $D1
    cp   d                                        ; $7EFD: $BA
    jr   nc, .jr_7F04                             ; $7EFE: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $7F00: $F0 $D7
    jr   jr_018_7F06                              ; $7F02: $18 $02

.jr_7F04
    ldh  a, [hMultiPurpose1]                      ; $7F04: $F0 $D8

jr_018_7F06:
    ld   e, a                                     ; $7F06: $5F
    ret                                           ; $7F07: $C9

ClearEntityStatusBank18::
    ld   hl, wEntitiesStatusTable                 ; $7F08: $21 $80 $C2
    add  hl, bc                                   ; $7F0B: $09
    ld   [hl], $00                                ; $7F0C: $36 $00
    ret                                           ; $7F0E: $C9

; Kill boss or mini-boss enemy with explosions animation
AnimateBossAgony_18::
    ld   hl, wEntitiesPrivateState2Table          ; $7F0F: $21 $C0 $C2
    add  hl, bc                                   ; $7F12: $09
    ld   a, [hl]                                  ; $7F13: $7E
    JP_TABLE                                      ; $7F14
._00 dw func_018_7F1B                             ; $7F15
._01 dw func_018_7F2C                             ; $7F17
._02 dw func_018_7F3B                             ; $7F19

func_018_7F1B::
    call GetEntityTransitionCountdown             ; $7F1B: $CD $05 $0C
    ld   [hl], $A0                                ; $7F1E: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7F20: $21 $20 $C4
    add  hl, bc                                   ; $7F23: $09
    ld   [hl], $FF                                ; $7F24: $36 $FF

label_018_7F26:
    ld   hl, wEntitiesPrivateState2Table          ; $7F26: $21 $C0 $C2
    add  hl, bc                                   ; $7F29: $09
    inc  [hl]                                     ; $7F2A: $34
    ret                                           ; $7F2B: $C9

func_018_7F2C::
    call GetEntityTransitionCountdown             ; $7F2C: $CD $05 $0C
    ret  nz                                       ; $7F2F: $C0

    ld   [hl], $C0                                ; $7F30: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7F32: $21 $20 $C4
    add  hl, bc                                   ; $7F35: $09
    ld   [hl], $FF                                ; $7F36: $36 $FF
    jp   label_018_7F26                           ; $7F38: $C3 $26 $7F

func_018_7F3B::
    call GetEntityTransitionCountdown             ; $7F3B: $CD $05 $0C
    jr   nz, .jr_7F4C                             ; $7F3E: $20 $0C

    call PlayBombExplosionSfx                     ; $7F40: $CD $4B $0C
    call label_27DD                               ; $7F43: $CD $DD $27
    call SetRoomStatus20                          ; $7F46: $CD $B9 $7F
    jp   DidKillEnemy                             ; $7F49: $C3 $50 $3F

.jr_7F4C
    jp   label_018_7F4F                           ; $7F4C: $C3 $4F $7F

label_018_7F4F:
    and  $07                                      ; $7F4F: $E6 $07
    ret  nz                                       ; $7F51: $C0

    call GetRandomByte                            ; $7F52: $CD $0D $28
    and  $1F                                      ; $7F55: $E6 $1F
    sub  $10                                      ; $7F57: $D6 $10
    ld   e, a                                     ; $7F59: $5F
    ld   hl, hActiveEntityPosX                    ; $7F5A: $21 $EE $FF
    add  [hl]                                     ; $7F5D: $86
    ld   [hl], a                                  ; $7F5E: $77
    call GetRandomByte                            ; $7F5F: $CD $0D $28
    and  $1F                                      ; $7F62: $E6 $1F
    sub  $14                                      ; $7F64: $D6 $14
    ld   e, a                                     ; $7F66: $5F
    ld   hl, hActiveEntityVisualPosY              ; $7F67: $21 $EC $FF
    add  [hl]                                     ; $7F6A: $86
    ld   [hl], a                                  ; $7F6B: $77
    jp   label_018_7F6F                           ; $7F6C: $C3 $6F $7F

label_018_7F6F:
    call ReturnIfNonInteractive_18.allowInactiveEntity ; $7F6F: $CD $EE $7D
    ldh  a, [hActiveEntityPosX]                   ; $7F72: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7F74: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7F76: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7F78: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $7F7A: $3E $02
    call AddTranscientVfx                         ; $7F7C: $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $7F7F: $3E $13
    ldh  [hNoiseSfx], a                           ; $7F81: $E0 $F4
    ret                                           ; $7F83: $C9

    ld   a, ENTITY_HEART_CONTAINER                ; $7F84: $3E $36
    call SpawnNewEntity_trampoline                ; $7F86: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7F89: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7F8B: $21 $00 $C2
    add  hl, de                                   ; $7F8E: $19
    ld   [hl], a                                  ; $7F8F: $77
    ldh  a, [hMultiPurpose1]                      ; $7F90: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7F92: $21 $10 $C2
    add  hl, de                                   ; $7F95: $19
    ld   [hl], a                                  ; $7F96: $77
    ldh  a, [hIsSideScrolling]                    ; $7F97: $F0 $F9
    and  a                                        ; $7F99: $A7
    jr   z, .jr_7FA4                              ; $7F9A: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $7F9C: $21 $50 $C2
    add  hl, bc                                   ; $7F9F: $09
    ld   [hl], $F0                                ; $7FA0: $36 $F0
    jr   jr_018_7FB0                              ; $7FA2: $18 $0C

.jr_7FA4
    ld   hl, wEntitiesSpeedZTable                 ; $7FA4: $21 $20 $C3
    add  hl, de                                   ; $7FA7: $19
    ld   [hl], $10                                ; $7FA8: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7FAA: $21 $10 $C3
    add  hl, de                                   ; $7FAD: $19
    ld   [hl], $08                                ; $7FAE: $36 $08

jr_018_7FB0:
    call ClearEntityStatusBank18                  ; $7FB0: $CD $08 $7F
    ld   hl, hNoiseSfx                            ; $7FB3: $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ; $7FB6: $36 $1A
    ret                                           ; $7FB8: $C9

SetRoomStatus20::
    ld   hl, wOverworldRoomStatus                 ; $7FB9: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $7FBC: $F0 $F6
    ld   e, a                                     ; $7FBE: $5F
    ld   a, [wIsIndoor]                           ; $7FBF: $FA $A5 $DB
    ld   d, a                                     ; $7FC2: $57

    ; If the map uses rooms in the indoors_b rooms group…
    ldh  a, [hMapId]                              ; $7FC3: $F0 $F7
    cp   MAP_INDOORS_B_END                        ; $7FC5: $FE $1A
    jr   nc, .notIndoorB                          ; $7FC7: $30 $05
    cp   MAP_INDOORS_B_START                      ; $7FC9: $FE $06
    jr   c, .notIndoorB                           ; $7FCB: $38 $01
    inc  d                                        ; $7FCD: $14
.notIndoorB

    add  hl, de                                   ; $7FCE: $19
    ld   a, [hl]                                  ; $7FCF: $7E
    or   ROOM_STATUS_EVENT_2                      ; $7FD0: $F6 $20
    ld   [hl], a                                  ; $7FD2: $77
    ldh  [hRoomStatus], a                         ; $7FD3: $E0 $F8
    ret                                           ; $7FD5: $C9
