; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_05::
    ldh  a, [hActiveEntityStatus]                 ; $7A3A: $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ; $7A3C: $FE $05
    jr   nz, .skip                                ; $7A3E: $20 $25

.allowInactiveEntity
    ld   a, [wGameplayType]                       ; $7A40: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $7A43: $FE $07
    jr   z, .skip                                 ; $7A45: $28 $1E

    cp   GAMEPLAY_WORLD                           ; $7A47: $FE $0B
    jr   nz, .skip                                ; $7A49: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7A4B: $FA $6B $C1
    cp   $04                                      ; $7A4E: $FE $04
    jr   nz, .skip                                ; $7A50: $20 $13

    ld   hl, wC1A8                                ; $7A52: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7A55: $FA $9F $C1
    or   [hl]                                     ; $7A58: $B6
    ld   hl, wInventoryAppearing                  ; $7A59: $21 $4F $C1
    or   [hl]                                     ; $7A5C: $B6
    jr   nz, .skip                                ; $7A5D: $20 $06

    ld   a, [wRoomTransitionState]                ; $7A5F: $FA $24 $C1
    and  a                                        ; $7A62: $A7
    jr   z, .return                               ; $7A63: $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ; $7A65: $F1

.return
    ret                                           ; $7A66: $C9

; If the entity is ignoring hits, apply its recoil velocity.
; (Unused in this bank)
ApplyRecoilIfNeeded_05::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7A67: $21 $10 $C4
    add  hl, bc                                   ; $7A6A: $09
    ld   a, [hl]                                  ; $7A6B: $7E
    and  a                                        ; $7A6C: $A7
    jr   z, .return                               ; $7A6D: $28 $41

    dec  a                                        ; $7A6F: $3D
    ld   [hl], a                                  ; $7A70: $77

    call label_3E8E                               ; $7A71: $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ; $7A74: $21 $40 $C2
    add  hl, bc                                   ; $7A77: $09
    ld   a, [hl]                                  ; $7A78: $7E
    push af                                       ; $7A79: $F5

    ld   hl, wEntitiesSpeedYTable                 ; $7A7A: $21 $50 $C2
    add  hl, bc                                   ; $7A7D: $09
    ld   a, [hl]                                  ; $7A7E: $7E
    push af                                       ; $7A7F: $F5

    ld   hl, wEntitiesRecoilVelocityX             ; $7A80: $21 $F0 $C3
    add  hl, bc                                   ; $7A83: $09
    ld   a, [hl]                                  ; $7A84: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7A85: $21 $40 $C2
    add  hl, bc                                   ; $7A88: $09
    ld   [hl], a                                  ; $7A89: $77

    ld   hl, wEntitiesRecoilVelocityY             ; $7A8A: $21 $00 $C4
    add  hl, bc                                   ; $7A8D: $09
    ld   a, [hl]                                  ; $7A8E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7A8F: $21 $50 $C2
    add  hl, bc                                   ; $7A92: $09
    ld   [hl], a                                  ; $7A93: $77

    call UpdateEntityPosWithSpeed_05              ; $7A94: $CD $B1 $7A

    ld   hl, wEntitiesOptions1Table               ; $7A97: $21 $30 $C4
    add  hl, bc                                   ; $7A9A: $09
    ld   a, [hl]                                  ; $7A9B: $7E
    and  $20                                      ; $7A9C: $E6 $20
    jr   nz, .restoreOriginalSpeed                ; $7A9E: $20 $03

    call label_3B23                               ; $7AA0: $CD $23 $3B

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ; $7AA3: $21 $50 $C2
    add  hl, bc                                   ; $7AA6: $09
    pop  af                                       ; $7AA7: $F1
    ld   [hl], a                                  ; $7AA8: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7AA9: $21 $40 $C2
    add  hl, bc                                   ; $7AAC: $09
    pop  af                                       ; $7AAD: $F1
    ld   [hl], a                                  ; $7AAE: $77
    pop  af                                       ; $7AAF: $F1

.return
    ret                                           ; $7AB0: $C9

UpdateEntityPosWithSpeed_05::
    call AddEntitySpeedToPos_05                   ; $7AB1: $CD $BE $7A

UpdateEntityYPosWithSpeed_05::
    push bc                                       ; $7AB4: $C5
    ld   a, c                                     ; $7AB5: $79
    add  $10                                      ; $7AB6: $C6 $10
    ld   c, a                                     ; $7AB8: $4F
    call AddEntitySpeedToPos_05                   ; $7AB9: $CD $BE $7A
    pop  bc                                       ; $7ABC: $C1
    ret                                           ; $7ABD: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_05::
    ld   hl, wEntitiesSpeedXTable                 ; $7ABE: $21 $40 $C2
    add  hl, bc                                   ; $7AC1: $09
    ld   a, [hl]                                  ; $7AC2: $7E
    and  a                                        ; $7AC3: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7AC4: $28 $23

    push af                                       ; $7AC6: $F5
    swap a                                        ; $7AC7: $CB $37
    and  $F0                                      ; $7AC9: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7ACB: $21 $60 $C2
    add  hl, bc                                   ; $7ACE: $09
    add  [hl]                                     ; $7ACF: $86
    ld   [hl], a                                  ; $7AD0: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7AD1: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7AD3: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $7AD6: $09
    pop  af                                       ; $7AD7: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7AD8: $1E $00
    bit  7, a                                     ; $7ADA: $CB $7F
    jr   z, .positive                             ; $7ADC: $28 $02

    ld   e, $F0                                   ; $7ADE: $1E $F0

.positive
    swap a                                        ; $7AE0: $CB $37
    and  $0F                                      ; $7AE2: $E6 $0F
    or   e                                        ; $7AE4: $B3
    ; Get carry back from d
    rr   d                                        ; $7AE5: $CB $1A
    adc  [hl]                                     ; $7AE7: $8E
    ld   [hl], a                                  ; $7AE8: $77

.return
    ret                                           ; $7AE9: $C9

AddEntityZSpeedToPos_05::
    ld   hl, wEntitiesSpeedZTable                 ; $7AEA: $21 $20 $C3
    add  hl, bc                                   ; $7AED: $09
    ld   a, [hl]                                  ; $7AEE: $7E
    and  a                                        ; $7AEF: $A7
    jr   z, AddEntitySpeedToPos_05.return         ; $7AF0: $28 $F7

    push af                                       ; $7AF2: $F5
    swap a                                        ; $7AF3: $CB $37
    and  $F0                                      ; $7AF5: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $7AF7: $21 $30 $C3
    add  hl, bc                                   ; $7AFA: $09
    add  [hl]                                     ; $7AFB: $86
    ld   [hl], a                                  ; $7AFC: $77
    rl   d                                        ; $7AFD: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7AFF: $21 $10 $C3
    jr   AddEntitySpeedToPos_05.updatePosition    ; $7B02: $18 $D2

func_005_7B04::
    ld   e, $00                                   ; $7B04: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7B06: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7B08: $21 $00 $C2
    add  hl, bc                                   ; $7B0B: $09
    sub  [hl]                                     ; $7B0C: $96
    bit  7, a                                     ; $7B0D: $CB $7F
    jr   z, jr_005_7B12                           ; $7B0F: $28 $01

    inc  e                                        ; $7B11: $1C

jr_005_7B12:
    ld   d, a                                     ; $7B12: $57
    ret                                           ; $7B13: $C9

func_005_7B14::
    ld   e, $02                                   ; $7B14: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7B16: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7B18: $21 $10 $C2
    add  hl, bc                                   ; $7B1B: $09
    sub  [hl]                                     ; $7B1C: $96
    bit  7, a                                     ; $7B1D: $CB $7F
    jr   nz, jr_005_7B22                          ; $7B1F: $20 $01

    inc  e                                        ; $7B21: $1C

jr_005_7B22:
    ld   d, a                                     ; $7B22: $57
    ret                                           ; $7B23: $C9

func_005_7B24::
    call func_005_7B04                            ; $7B24: $CD $04 $7B
    ld   a, e                                     ; $7B27: $7B
    ldh  [hMultiPurpose0], a                      ; $7B28: $E0 $D7
    ld   a, d                                     ; $7B2A: $7A
    bit  7, a                                     ; $7B2B: $CB $7F
    jr   z, jr_005_7B31                           ; $7B2D: $28 $02

    cpl                                           ; $7B2F: $2F
    inc  a                                        ; $7B30: $3C

jr_005_7B31:
    push af                                       ; $7B31: $F5
    call func_005_7B14                            ; $7B32: $CD $14 $7B
    ld   a, e                                     ; $7B35: $7B
    ldh  [hMultiPurpose1], a                      ; $7B36: $E0 $D8
    ld   a, d                                     ; $7B38: $7A
    bit  7, a                                     ; $7B39: $CB $7F
    jr   z, jr_005_7B3F                           ; $7B3B: $28 $02

    cpl                                           ; $7B3D: $2F
    inc  a                                        ; $7B3E: $3C

jr_005_7B3F:
    pop  de                                       ; $7B3F: $D1
    cp   d                                        ; $7B40: $BA
    jr   nc, jr_005_7B47                          ; $7B41: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $7B43: $F0 $D7
    jr   jr_005_7B49                              ; $7B45: $18 $02

jr_005_7B47:
    ldh  a, [hMultiPurpose1]                      ; $7B47: $F0 $D8

jr_005_7B49:
    ld   e, a                                     ; $7B49: $5F
    ret                                           ; $7B4A: $C9

ClearEntityStatus_05::
    ld   hl, wEntitiesStatusTable                 ; $7B4B: $21 $80 $C2
    add  hl, bc                                   ; $7B4E: $09
    ld   [hl], b                                  ; $7B4F: $70
    ret                                           ; $7B50: $C9
