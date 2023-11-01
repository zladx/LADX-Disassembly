; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BlooperSpriteVariants::
.variant0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

BlooperEntityHandler::
    ld   de, BlooperSpriteVariants                ; $5BF9: $11 $F1 $5B
    call RenderActiveEntitySpritesPair            ; $5BFC: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $5BFF: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $5C02: $CD $C3 $7D
    call label_3B39                               ; $5C05: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $5C08: $CD $0A $7E

.jr_5C0B
    call label_3B23                               ; $5C0B: $CD $23 $3B
    ld   hl, wEntitiesGroundStatusTable           ; $5C0E: $21 $70 $C4
    add  hl, bc                                   ; $5C11: $09
    ld   a, [hl]                                  ; $5C12: $7E
    and  a                                        ; $5C13: $A7
    jr   nz, .jr_5C2A                             ; $5C14: $20 $14

    ld   hl, wEntitiesPrivateCountdown3Table      ; $5C16: $21 $80 $C4
    add  hl, bc                                   ; $5C19: $09
    ld   [hl], $10                                ; $5C1A: $36 $10
    ldh  a, [hActiveEntityPosX]                   ; $5C1C: $F0 $EE
    ld   hl, wEntitiesPosXTable                   ; $5C1E: $21 $00 $C2
    add  hl, bc                                   ; $5C21: $09
    ld   [hl], a                                  ; $5C22: $77
    ldh  a, [hActiveEntityPosY]                   ; $5C23: $F0 $EF
    ld   hl, wEntitiesPosYTable                   ; $5C25: $21 $10 $C2
    add  hl, bc                                   ; $5C28: $09
    ld   [hl], a                                  ; $5C29: $77

.jr_5C2A
    xor  a                                        ; $5C2A: $AF
    call SetEntitySpriteVariant                   ; $5C2B: $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ; $5C2E: $F0 $F0
    JP_TABLE                                      ; $5C30
._00 dw func_007_5C35                             ; $5C31
._01 dw func_007_5C79                             ; $5C33

func_007_5C35::
    call GetEntityTransitionCountdown             ; $5C35: $CD $05 $0C
    jr   nz, .jr_5C58                             ; $5C38: $20 $1E

    call EntityLinkPositionYDifference_07         ; $5C3A: $CD $6D $7E
    ld   a, e                                     ; $5C3D: $7B
    cp   $03                                      ; $5C3E: $FE $03
    jr   z, .jr_5C58                              ; $5C40: $28 $16

    call ClearEntitySpeed                         ; $5C42: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $5C45: $CD $05 $0C
    ld   [hl], $25                                ; $5C48: $36 $25
    call EntityLinkPositionXDifference_07         ; $5C4A: $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ; $5C4D: $21 $80 $C3
    add  hl, bc                                   ; $5C50: $09
    ld   [hl], e                                  ; $5C51: $73
    call IncrementEntityState                     ; $5C52: $CD $12 $3B
    ld   [hl], $01                                ; $5C55: $36 $01
    ret                                           ; $5C57: $C9

.jr_5C58
    call GetEntitySpeedYAddress                   ; $5C58: $CD $05 $40
    ld   a, [hl]                                  ; $5C5B: $7E
    sub  $04                                      ; $5C5C: $D6 $04

.jr_5C5E
    jr   z, jr_007_5C67                           ; $5C5E: $28 $07

    and  $80                                      ; $5C60: $E6 $80
    jr   z, .jr_5C66                              ; $5C62: $28 $02

    inc  [hl]                                     ; $5C64: $34
    inc  [hl]                                     ; $5C65: $34

.jr_5C66
    dec  [hl]                                     ; $5C66: $35

jr_007_5C67:
    ld   hl, wEntitiesSpeedXTable                 ; $5C67: $21 $40 $C2
    add  hl, bc                                   ; $5C6A: $09
    ld   a, [hl]                                  ; $5C6B: $7E
    and  a                                        ; $5C6C: $A7
    jr   z, ret_007_5C76                          ; $5C6D: $28 $07

    and  $80                                      ; $5C6F: $E6 $80
    jr   z, .jr_5C75                              ; $5C71: $28 $02

    inc  [hl]                                     ; $5C73: $34
    inc  [hl]                                     ; $5C74: $34

.jr_5C75
    dec  [hl]                                     ; $5C75: $35

ret_007_5C76:
    ret                                           ; $5C76: $C9

Data_007_5C77::
    db   $01, $FF

func_007_5C79::
    call GetEntityTransitionCountdown             ; $5C79: $CD $05 $0C
    jr   nz, .jr_5C85                             ; $5C7C: $20 $07

    ld   [hl], $40                                ; $5C7E: $36 $40
    call IncrementEntityState                     ; $5C80: $CD $12 $3B
    ld   [hl], b                                  ; $5C83: $70
    ret                                           ; $5C84: $C9

.jr_5C85
    ldh  a, [hFrameCounter]                       ; $5C85: $F0 $E7
    and  $01                                      ; $5C87: $E6 $01
    jr   nz, .jr_5CA0                             ; $5C89: $20 $15

    call GetEntitySpeedYAddress                   ; $5C8B: $CD $05 $40
    dec  [hl]                                     ; $5C8E: $35
    ld   hl, wEntitiesDirectionTable              ; $5C8F: $21 $80 $C3
    add  hl, bc                                   ; $5C92: $09
    ld   e, [hl]                                  ; $5C93: $5E
    ld   d, b                                     ; $5C94: $50
    ld   hl, Data_007_5C77                        ; $5C95: $21 $77 $5C
    add  hl, de                                   ; $5C98: $19
    ld   a, [hl]                                  ; $5C99: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5C9A: $21 $40 $C2
    add  hl, bc                                   ; $5C9D: $09
    add  [hl]                                     ; $5C9E: $86
    ld   [hl], a                                  ; $5C9F: $77

.jr_5CA0
    ld   a, $01                                   ; $5CA0: $3E $01
    jp   SetEntitySpriteVariant                   ; $5CA2: $C3 $0C $3B

func_007_5CA5::
    ldh  a, [hActiveEntitySpriteVariant]          ; $5CA5: $F0 $F1
    inc  a                                        ; $5CA7: $3C
    jr   z, jr_007_5CF3                           ; $5CA8: $28 $49

    push hl                                       ; $5CAA: $E5
    ld   a, [wOAMNextAvailableSlot]               ; $5CAB: $FA $C0 $C3
    ld   e, a                                     ; $5CAE: $5F
    ld   d, $00                                   ; $5CAF: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $5CB1: $21 $30 $C0
    add  hl, de                                   ; $5CB4: $19
    ld   e, l                                     ; $5CB5: $5D
    ld   d, h                                     ; $5CB6: $54
    pop  hl                                       ; $5CB7: $E1

jr_007_5CB8:
    ldh  a, [hActiveEntityVisualPosY]             ; $5CB8: $F0 $EC
    add  [hl]                                     ; $5CBA: $86
    cp   $7E                                      ; $5CBB: $FE $7E
    jr   c, .jr_5CC0                              ; $5CBD: $38 $01

    xor  a                                        ; $5CBF: $AF

.jr_5CC0
    ld   [de], a                                  ; $5CC0: $12
    inc  hl                                       ; $5CC1: $23
    inc  de                                       ; $5CC2: $13
    push bc                                       ; $5CC3: $C5
    ld   a, [wScreenShakeHorizontal]              ; $5CC4: $FA $55 $C1
    ld   c, a                                     ; $5CC7: $4F
    ldh  a, [hActiveEntityPosX]                   ; $5CC8: $F0 $EE
    add  [hl]                                     ; $5CCA: $86
    sub  c                                        ; $5CCB: $91
    ld   [de], a                                  ; $5CCC: $12
    inc  hl                                       ; $5CCD: $23
    inc  de                                       ; $5CCE: $13
    ldh  a, [hActiveEntityTilesOffset]            ; $5CCF: $F0 $F5
    ld   c, a                                     ; $5CD1: $4F
    ld   a, [hl+]                                 ; $5CD2: $2A
    push af                                       ; $5CD3: $F5
    add  c                                        ; $5CD4: $81
    ld   [de], a                                  ; $5CD5: $12
    pop  af                                       ; $5CD6: $F1
    cp   $FF                                      ; $5CD7: $FE $FF
    jr   nz, .jr_5CDF                             ; $5CD9: $20 $04

    dec  de                                       ; $5CDB: $1B
    xor  a                                        ; $5CDC: $AF
    ld   [de], a                                  ; $5CDD: $12
    inc  de                                       ; $5CDE: $13

.jr_5CDF
    pop  bc                                       ; $5CDF: $C1
    inc  de                                       ; $5CE0: $13
    ldh  a, [hActiveEntityFlipAttribute]          ; $5CE1: $F0 $ED
    xor  [hl]                                     ; $5CE3: $AE
    inc  hl                                       ; $5CE4: $23
    ld   [de], a                                  ; $5CE5: $12
    inc  de                                       ; $5CE6: $13
    dec  c                                        ; $5CE7: $0D
    jr   nz, jr_007_5CB8                          ; $5CE8: $20 $CE

    ld   a, [wActiveEntityIndex]                  ; $5CEA: $FA $23 $C1
    ld   c, a                                     ; $5CED: $4F
    ld   a, $0A                                   ; $5CEE: $3E $0A
    jp   func_015_7964_trampoline                 ; $5CF0: $C3 $A0 $3D

jr_007_5CF3:
    ld   a, [wActiveEntityIndex]                  ; $5CF3: $FA $23 $C1
    ld   c, a                                     ; $5CF6: $4F
    ret                                           ; $5CF7: $C9
