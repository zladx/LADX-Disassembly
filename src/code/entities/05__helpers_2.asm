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
    ldh  a, [hActiveEntityStatus]                 ;; 05:7A3A $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ;; 05:7A3C $FE $05
    jr   nz, .skip                                ;; 05:7A3E $20 $25

.allowInactiveEntity
    ld   a, [wGameplayType]                       ;; 05:7A40 $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 05:7A43 $FE $07
    jr   z, .skip                                 ;; 05:7A45 $28 $1E

    cp   GAMEPLAY_WORLD                           ;; 05:7A47 $FE $0B
    jr   nz, .skip                                ;; 05:7A49 $20 $1A

    ld   a, [wTransitionSequenceCounter]          ;; 05:7A4B $FA $6B $C1
    cp   $04                                      ;; 05:7A4E $FE $04
    jr   nz, .skip                                ;; 05:7A50 $20 $13

    ld   hl, wC1A8                                ;; 05:7A52 $21 $A8 $C1
    ld   a, [wDialogState]                        ;; 05:7A55 $FA $9F $C1
    or   [hl]                                     ;; 05:7A58 $B6
    ld   hl, wInventoryAppearing                  ;; 05:7A59 $21 $4F $C1
    or   [hl]                                     ;; 05:7A5C $B6
    jr   nz, .skip                                ;; 05:7A5D $20 $06

    ld   a, [wRoomTransitionState]                ;; 05:7A5F $FA $24 $C1
    and  a                                        ;; 05:7A62 $A7
    jr   z, .return                               ;; 05:7A63 $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ;; 05:7A65 $F1

.return
    ret                                           ;; 05:7A66 $C9

; If the entity is ignoring hits, apply its recoil velocity.
; (Unused in this bank)
ApplyRecoilIfNeeded_05::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 05:7A67 $21 $10 $C4
    add  hl, bc                                   ;; 05:7A6A $09
    ld   a, [hl]                                  ;; 05:7A6B $7E
    and  a                                        ;; 05:7A6C $A7
    jr   z, .return                               ;; 05:7A6D $28 $41

    dec  a                                        ;; 05:7A6F $3D
    ld   [hl], a                                  ;; 05:7A70 $77

    call label_3E8E                               ;; 05:7A71 $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ;; 05:7A74 $21 $40 $C2
    add  hl, bc                                   ;; 05:7A77 $09
    ld   a, [hl]                                  ;; 05:7A78 $7E
    push af                                       ;; 05:7A79 $F5

    ld   hl, wEntitiesSpeedYTable                 ;; 05:7A7A $21 $50 $C2
    add  hl, bc                                   ;; 05:7A7D $09
    ld   a, [hl]                                  ;; 05:7A7E $7E
    push af                                       ;; 05:7A7F $F5

    ld   hl, wEntitiesRecoilVelocityX             ;; 05:7A80 $21 $F0 $C3
    add  hl, bc                                   ;; 05:7A83 $09
    ld   a, [hl]                                  ;; 05:7A84 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7A85 $21 $40 $C2
    add  hl, bc                                   ;; 05:7A88 $09
    ld   [hl], a                                  ;; 05:7A89 $77

    ld   hl, wEntitiesRecoilVelocityY             ;; 05:7A8A $21 $00 $C4
    add  hl, bc                                   ;; 05:7A8D $09
    ld   a, [hl]                                  ;; 05:7A8E $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:7A8F $21 $50 $C2
    add  hl, bc                                   ;; 05:7A92 $09
    ld   [hl], a                                  ;; 05:7A93 $77

    call UpdateEntityPosWithSpeed_05              ;; 05:7A94 $CD $B1 $7A

    ld   hl, wEntitiesOptions1Table               ;; 05:7A97 $21 $30 $C4
    add  hl, bc                                   ;; 05:7A9A $09
    ld   a, [hl]                                  ;; 05:7A9B $7E
    and  $20                                      ;; 05:7A9C $E6 $20
    jr   nz, .restoreOriginalSpeed                ;; 05:7A9E $20 $03

    call ApplyEntityInteractionWithBackground_trampoline ;; 05:7AA0 $CD $23 $3B

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ;; 05:7AA3 $21 $50 $C2
    add  hl, bc                                   ;; 05:7AA6 $09
    pop  af                                       ;; 05:7AA7 $F1
    ld   [hl], a                                  ;; 05:7AA8 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7AA9 $21 $40 $C2
    add  hl, bc                                   ;; 05:7AAC $09
    pop  af                                       ;; 05:7AAD $F1
    ld   [hl], a                                  ;; 05:7AAE $77
    pop  af                                       ;; 05:7AAF $F1

.return
    ret                                           ;; 05:7AB0 $C9

UpdateEntityPosWithSpeed_05::
    call AddEntitySpeedToPos_05                   ;; 05:7AB1 $CD $BE $7A

UpdateEntityYPosWithSpeed_05::
    push bc                                       ;; 05:7AB4 $C5
    ld   a, c                                     ;; 05:7AB5 $79
    add  $10                                      ;; 05:7AB6 $C6 $10
    ld   c, a                                     ;; 05:7AB8 $4F
    call AddEntitySpeedToPos_05                   ;; 05:7AB9 $CD $BE $7A
    pop  bc                                       ;; 05:7ABC $C1
    ret                                           ;; 05:7ABD $C9

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
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7ABE $21 $40 $C2
    add  hl, bc                                   ;; 05:7AC1 $09
    ld   a, [hl]                                  ;; 05:7AC2 $7E
    and  a                                        ;; 05:7AC3 $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ;; 05:7AC4 $28 $23

    push af                                       ;; 05:7AC6 $F5
    swap a                                        ;; 05:7AC7 $CB $37
    and  $F0                                      ;; 05:7AC9 $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 05:7ACB $21 $60 $C2
    add  hl, bc                                   ;; 05:7ACE $09
    add  [hl]                                     ;; 05:7ACF $86
    ld   [hl], a                                  ;; 05:7AD0 $77
    ; Save carry in bit 0 of d
    rl   d                                        ;; 05:7AD1 $CB $12
    ld   hl, wEntitiesPosXTable                   ;; 05:7AD3 $21 $00 $C2

.updatePosition
    add  hl, bc                                   ;; 05:7AD6 $09
    pop  af                                       ;; 05:7AD7 $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ;; 05:7AD8 $1E $00
    bit  7, a                                     ;; 05:7ADA $CB $7F
    jr   z, .positive                             ;; 05:7ADC $28 $02

    ld   e, $F0                                   ;; 05:7ADE $1E $F0

.positive
    swap a                                        ;; 05:7AE0 $CB $37
    and  $0F                                      ;; 05:7AE2 $E6 $0F
    or   e                                        ;; 05:7AE4 $B3
    ; Get carry back from d
    rr   d                                        ;; 05:7AE5 $CB $1A
    adc  [hl]                                     ;; 05:7AE7 $8E
    ld   [hl], a                                  ;; 05:7AE8 $77

.return
    ret                                           ;; 05:7AE9 $C9

AddEntityZSpeedToPos_05::
    ld   hl, wEntitiesSpeedZTable                 ;; 05:7AEA $21 $20 $C3
    add  hl, bc                                   ;; 05:7AED $09
    ld   a, [hl]                                  ;; 05:7AEE $7E
    and  a                                        ;; 05:7AEF $A7
    jr   z, AddEntitySpeedToPos_05.return         ;; 05:7AF0 $28 $F7

    push af                                       ;; 05:7AF2 $F5
    swap a                                        ;; 05:7AF3 $CB $37
    and  $F0                                      ;; 05:7AF5 $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ;; 05:7AF7 $21 $30 $C3
    add  hl, bc                                   ;; 05:7AFA $09
    add  [hl]                                     ;; 05:7AFB $86
    ld   [hl], a                                  ;; 05:7AFC $77
    rl   d                                        ;; 05:7AFD $CB $12
    ld   hl, wEntitiesPosZTable                   ;; 05:7AFF $21 $10 $C3
    jr   AddEntitySpeedToPos_05.updatePosition    ;; 05:7B02 $18 $D2

GetEntityToLinkPositionDeltaX_05::
    ld   e, $00                                   ;; 05:7B04 $1E $00
    ldh  a, [hLinkPositionX]                      ;; 05:7B06 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 05:7B08 $21 $00 $C2
    add  hl, bc                                   ;; 05:7B0B $09
    sub  [hl]                                     ;; 05:7B0C $96
    bit  7, a                                     ;; 05:7B0D $CB $7F
    jr   z, .jr_7B12                              ;; 05:7B0F $28 $01

    inc  e                                        ;; 05:7B11 $1C

.jr_7B12
    ld   d, a                                     ;; 05:7B12 $57
    ret                                           ;; 05:7B13 $C9

GetEntityToLinkPositionDeltaY_05::
    ld   e, $02                                   ;; 05:7B14 $1E $02
    ldh  a, [hLinkPositionY]                      ;; 05:7B16 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 05:7B18 $21 $10 $C2
    add  hl, bc                                   ;; 05:7B1B $09
    sub  [hl]                                     ;; 05:7B1C $96
    bit  7, a                                     ;; 05:7B1D $CB $7F
    jr   nz, .jr_7B22                             ;; 05:7B1F $20 $01

    inc  e                                        ;; 05:7B21 $1C

.jr_7B22
    ld   d, a                                     ;; 05:7B22 $57
    ret                                           ;; 05:7B23 $C9

; Inputs:
;   bc   entity index
;
; Outputs:
;   e   entity's direction to Link (see DIRECTION_* constants for possible values)
GetEntityDirectionToLink_05::
    call GetEntityToLinkPositionDeltaX_05         ;; 05:7B24 $CD $04 $7B
    ld   a, e                                     ;; 05:7B27 $7B
    ldh  [hMultiPurpose0], a                      ;; 05:7B28 $E0 $D7
    ld   a, d                                     ;; 05:7B2A $7A
    bit  7, a                                     ;; 05:7B2B $CB $7F
    jr   z, .positiveX                            ;; 05:7B2D $28 $02

    cpl                                           ;; 05:7B2F $2F
    inc  a                                        ;; 05:7B30 $3C

.positiveX
    push af                                       ;; 05:7B31 $F5
    call GetEntityToLinkPositionDeltaY_05         ;; 05:7B32 $CD $14 $7B
    ld   a, e                                     ;; 05:7B35 $7B
    ldh  [hMultiPurpose1], a                      ;; 05:7B36 $E0 $D8
    ld   a, d                                     ;; 05:7B38 $7A
    bit  7, a                                     ;; 05:7B39 $CB $7F
    jr   z, .positiveY                            ;; 05:7B3B $28 $02

    cpl                                           ;; 05:7B3D $2F
    inc  a                                        ;; 05:7B3E $3C

.positiveY
    pop  de                                       ;; 05:7B3F $D1
    cp   d                                        ;; 05:7B40 $BA
    jr   nc, .vertical                            ;; 05:7B41 $30 $04

    ldh  a, [hMultiPurpose0]                      ;; 05:7B43 $F0 $D7
    jr   .verticalEnd                             ;; 05:7B45 $18 $02

.vertical
    ldh  a, [hMultiPurpose1]                      ;; 05:7B47 $F0 $D8

.verticalEnd
    ld   e, a                                     ;; 05:7B49 $5F
    ret                                           ;; 05:7B4A $C9

ClearEntityStatus_05::
    ld   hl, wEntitiesStatusTable                 ;; 05:7B4B $21 $80 $C2
    add  hl, bc                                   ;; 05:7B4E $09
    ld   [hl], b                                  ;; 05:7B4F $70
    ret                                           ;; 05:7B50 $C9
