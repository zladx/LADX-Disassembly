KnightEntityHandler::
    ldh  a, [hMapId]                              ; $69AE: $F0 $F7
    cp   MAP_KANALET                              ; $69B0: $FE $14
    jr   c, .jr_69C9                              ; $69B2: $38 $15

    ldh  a, [hRoomStatus]                         ; $69B4: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $69B6: $E6 $10
    jp   nz, ClearEntityStatusBank04              ; $69B8: $C2 $7A $6D

    ld   hl, wEntitiesLoadOrderTable              ; $69BB: $21 $60 $C4
    add  hl, bc                                   ; $69BE: $09
    ld   [hl], $FF                                ; $69BF: $36 $FF
    ld   hl, wEntitiesDroppedItemTable            ; $69C1: $21 $E0 $C4
    add  hl, bc                                   ; $69C4: $09
    ld   [hl], ENTITY_HIDING_SLIME_KEY            ; $69C5: $36 $3C
    jr   jr_004_69D5                              ; $69C7: $18 $0C

.jr_69C9
    ld   e, a                                     ; $69C9: $5F
    ld   d, b                                     ; $69CA: $50
    ld   hl, wHasInstrument1                      ; $69CB: $21 $65 $DB
    add  hl, de                                   ; $69CE: $19
    ld   a, [hl]                                  ; $69CF: $7E
    and  $01                                      ; $69D0: $E6 $01
    jp   nz, ClearEntityStatusBank04              ; $69D2: $C2 $7A $6D

jr_004_69D5:
    call func_004_6AC7                            ; $69D5: $CD $C7 $6A
    call CopyEntityPositionToActivePosition       ; $69D8: $CD $8A $3D
    call ReturnIfNonInteractive_04                ; $69DB: $CD $A3 $7F
    call ApplyRecoilIfNeeded_04                   ; $69DE: $CD $80 $6D
    ld   hl, wEntitiesOptions1Table               ; $69E1: $21 $30 $C4
    add  hl, bc                                   ; $69E4: $09
    ld   [hl], ENTITY_OPT1_NONE                   ; $69E5: $36 $00
    call label_3B39                               ; $69E7: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $69EA: $F0 $F0
    JP_TABLE                                      ; $69EC
._00 dw func_004_69F3                             ; $69ED
._01 dw func_004_6A3D                             ; $69EF
._02 dw func_004_6A6A                             ; $69F1

func_004_69F3::
    call GetEntityTransitionCountdown             ; $69F3: $CD $05 $0C
    jr   nz, jr_004_6A25                          ; $69F6: $20 $2D

    ldh  a, [hFrameCounter]                       ; $69F8: $F0 $E7
    xor  c                                        ; $69FA: $A9
    and  $07                                      ; $69FB: $E6 $07
    jr   nz, .jr_6A04                             ; $69FD: $20 $05

    ld   a, $04                                   ; $69FF: $3E $04
    call ApplyVectorTowardsLink_trampoline        ; $6A01: $CD $AA $3B

.jr_6A04
    call UpdateEntityPosWithSpeed_04              ; $6A04: $CD $CA $6D
    call label_3B23                               ; $6A07: $CD $23 $3B
    call func_004_6E35                            ; $6A0A: $CD $35 $6E
    add  $30                                      ; $6A0D: $C6 $30
    cp   $60                                      ; $6A0F: $FE $60
    jr   nc, jr_004_6A25                          ; $6A11: $30 $12

    call func_004_6E45                            ; $6A13: $CD $45 $6E
    add  $30                                      ; $6A16: $C6 $30
    cp   $60                                      ; $6A18: $FE $60
    jr   nc, jr_004_6A25                          ; $6A1A: $30 $09

    call GetEntityTransitionCountdown             ; $6A1C: $CD $05 $0C
    ld   [hl], $28                                ; $6A1F: $36 $28
    jp   IncrementEntityState                     ; $6A21: $C3 $12 $3B

ret_004_6A24:
    ret                                           ; $6A24: $C9

jr_004_6A25:
    ldh  a, [hFrameCounter]                       ; $6A25: $F0 $E7
    and  $01                                      ; $6A27: $E6 $01
    jr   nz, ret_004_6A24                         ; $6A29: $20 $F9

label_004_6A2B:
    ld   hl, wEntitiesInertiaTable                ; $6A2B: $21 $D0 $C3
    add  hl, bc                                   ; $6A2E: $09
    inc  [hl]                                     ; $6A2F: $34
    ld   a, [hl]                                  ; $6A30: $7E
    rra                                           ; $6A31: $1F
    rra                                           ; $6A32: $1F
    rra                                           ; $6A33: $1F
    and  $01                                      ; $6A34: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6A36: $C3 $0C $3B

Data_004_6A39::
    db   $04, $0C, $00, $08

func_004_6A3D::
    call GetEntityTransitionCountdown             ; $6A3D: $CD $05 $0C
    jr   nz, .jr_6A67                             ; $6A40: $20 $25

    call func_004_6E55                            ; $6A42: $CD $55 $6E
    ld   hl, wEntitiesDirectionTable              ; $6A45: $21 $80 $C3
    add  hl, bc                                   ; $6A48: $09
    ld   [hl], e                                  ; $6A49: $73
    ld   d, b                                     ; $6A4A: $50
    ld   hl, wEntitiesInertiaTable                ; $6A4B: $21 $D0 $C3
    add  hl, bc                                   ; $6A4E: $09
    ld   a, [hl]                                  ; $6A4F: $7E
    and  $0F                                      ; $6A50: $E6 $0F
    ld   hl, Data_004_6A39                        ; $6A52: $21 $39 $6A
    add  hl, de                                   ; $6A55: $19
    cp   [hl]                                     ; $6A56: $BE
    jr   nz, .jr_6A67                             ; $6A57: $20 $0E

    ld   hl, wEntitiesPrivateState1Table          ; $6A59: $21 $B0 $C2
    add  hl, bc                                   ; $6A5C: $09
    ld   [hl], $38                                ; $6A5D: $36 $38
    ld   hl, wEntitiesPrivateState4Table          ; $6A5F: $21 $40 $C4
    add  hl, bc                                   ; $6A62: $09
    ld   [hl], b                                  ; $6A63: $70
    call IncrementEntityState                     ; $6A64: $CD $12 $3B

.jr_6A67
    jp   label_004_6A2B                           ; $6A67: $C3 $2B $6A

func_004_6A6A::
    call func_004_6E1D                            ; $6A6A: $CD $1D $6E
    ld   hl, wEntitiesPrivateState1Table          ; $6A6D: $21 $B0 $C2
    add  hl, bc                                   ; $6A70: $09
    dec  [hl]                                     ; $6A71: $35
    dec  [hl]                                     ; $6A72: $35
    ldh  a, [hFrameCounter]                       ; $6A73: $F0 $E7
    and  $03                                      ; $6A75: $E6 $03
    jr   nz, .jr_6A7E                             ; $6A77: $20 $05

    ld   hl, wEntitiesPrivateState4Table          ; $6A79: $21 $40 $C4
    add  hl, bc                                   ; $6A7C: $09
    inc  [hl]                                     ; $6A7D: $34

.jr_6A7E
    ld   hl, wEntitiesPrivateState3Table          ; $6A7E: $21 $D0 $C2
    add  hl, bc                                   ; $6A81: $09
    ld   a, [hl]                                  ; $6A82: $7E
    and  a                                        ; $6A83: $A7
    jr   z, .jr_6A8A                              ; $6A84: $28 $04

    and  $80                                      ; $6A86: $E6 $80
    jr   z, ret_004_6AA6                          ; $6A88: $28 $1C

.jr_6A8A
    ld   [hl], b                                  ; $6A8A: $70
    call IncrementEntityState                     ; $6A8B: $CD $12 $3B
    ld   [hl], b                                  ; $6A8E: $70
    call GetEntityTransitionCountdown             ; $6A8F: $CD $05 $0C
    ld   [hl], $10                                ; $6A92: $36 $10
    ld   hl, wEntitiesDirectionTable              ; $6A94: $21 $80 $C3
    add  hl, bc                                   ; $6A97: $09
    ld   e, [hl]                                  ; $6A98: $5E
    ld   d, b                                     ; $6A99: $50
    ld   hl, Data_004_6A39                        ; $6A9A: $21 $39 $6A
    add  hl, de                                   ; $6A9D: $19
    ld   a, [hl]                                  ; $6A9E: $7E
    add  $08                                      ; $6A9F: $C6 $08
    ld   hl, wEntitiesInertiaTable                ; $6AA1: $21 $D0 $C3
    add  hl, bc                                   ; $6AA4: $09
    ld   [hl], a                                  ; $6AA5: $77

ret_004_6AA6:
    ret                                           ; $6AA6: $C9

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

Data_004_6AB3::
    db   $0A, $06, $03, $01

Data_004_6AB7::
    db   $00, $01, $03, $06, $0A, $0E, $11, $13, $14, $13, $11, $0E, $0A, $06, $03, $01

func_004_6AC7::
    ld   de, KnightSpriteVariants                 ; $6AC7: $11 $A7 $6A
    call RenderActiveEntitySpritesPair            ; $6ACA: $CD $C0 $3B
    ld   hl, wEntitiesPrivateState3Table          ; $6ACD: $21 $D0 $C2
    add  hl, bc                                   ; $6AD0: $09
    ld   a, [hl]                                  ; $6AD1: $7E
    and  a                                        ; $6AD2: $A7
    jr   z, jr_004_6B31                           ; $6AD3: $28 $5C

    xor  a                                        ; $6AD5: $AF
    ldh  [hMultiPurpose0], a                      ; $6AD6: $E0 $D7
    ld   hl, wEntitiesDirectionTable              ; $6AD8: $21 $80 $C3
    add  hl, bc                                   ; $6ADB: $09
    ld   a, [hl]                                  ; $6ADC: $7E
    ld   hl, wEntitiesPrivateState3Table          ; $6ADD: $21 $D0 $C2
    add  hl, bc                                   ; $6AE0: $09
    bit  1, a                                     ; $6AE1: $CB $4F
    jr   nz, jr_004_6B0B                          ; $6AE3: $20 $26

    cp   $01                                      ; $6AE5: $FE $01
    ld   a, [hl]                                  ; $6AE7: $7E
    jr   nz, .jr_6AF0                             ; $6AE8: $20 $06

    ld   hl, hMultiPurpose0                       ; $6AEA: $21 $D7 $FF
    inc  [hl]                                     ; $6AED: $34
    cpl                                           ; $6AEE: $2F
    inc  a                                        ; $6AEF: $3C

.jr_6AF0
    ld   hl, hActiveEntityPosX                    ; $6AF0: $21 $EE $FF
    add  [hl]                                     ; $6AF3: $86
    ld   [hl], a                                  ; $6AF4: $77
    ld   hl, wEntitiesPrivateState4Table          ; $6AF5: $21 $40 $C4
    add  hl, bc                                   ; $6AF8: $09
    ldh  a, [hMultiPurpose0]                      ; $6AF9: $F0 $D7
    and  a                                        ; $6AFB: $A7
    ld   a, [hl]                                  ; $6AFC: $7E
    jr   z, .jr_6B02                              ; $6AFD: $28 $03

    cpl                                           ; $6AFF: $2F
    and  $0F                                      ; $6B00: $E6 $0F

.jr_6B02
    ld   hl, hActiveEntityVisualPosY              ; $6B02: $21 $EC $FF
    add  [hl]                                     ; $6B05: $86
    add  $F3                                      ; $6B06: $C6 $F3
    ld   [hl], a                                  ; $6B08: $77
    jr   jr_004_6B51                              ; $6B09: $18 $46

jr_004_6B0B:
    cp   $02                                      ; $6B0B: $FE $02
    ld   a, [hl]                                  ; $6B0D: $7E
    jr   nz, .jr_6B16                             ; $6B0E: $20 $06

    ld   hl, hMultiPurpose0                       ; $6B10: $21 $D7 $FF
    inc  [hl]                                     ; $6B13: $34
    cpl                                           ; $6B14: $2F
    inc  a                                        ; $6B15: $3C

.jr_6B16
    ld   hl, hActiveEntityVisualPosY              ; $6B16: $21 $EC $FF
    add  [hl]                                     ; $6B19: $86
    ld   [hl], a                                  ; $6B1A: $77
    ld   hl, wEntitiesPrivateState4Table          ; $6B1B: $21 $40 $C4
    add  hl, bc                                   ; $6B1E: $09
    ldh  a, [hMultiPurpose0]                      ; $6B1F: $F0 $D7
    and  a                                        ; $6B21: $A7
    ld   a, [hl]                                  ; $6B22: $7E
    jr   nz, .jr_6B28                             ; $6B23: $20 $03

    cpl                                           ; $6B25: $2F
    and  $0F                                      ; $6B26: $E6 $0F

.jr_6B28
    ld   hl, hActiveEntityPosX                    ; $6B28: $21 $EE $FF
    add  [hl]                                     ; $6B2B: $86
    add  $F8                                      ; $6B2C: $C6 $F8
    ld   [hl], a                                  ; $6B2E: $77
    jr   jr_004_6B51                              ; $6B2F: $18 $20

jr_004_6B31:
    ld   hl, wEntitiesInertiaTable                ; $6B31: $21 $D0 $C3
    add  hl, bc                                   ; $6B34: $09
    ld   a, [hl]                                  ; $6B35: $7E
    and  $0F                                      ; $6B36: $E6 $0F
    ld   e, a                                     ; $6B38: $5F
    ld   d, $00                                   ; $6B39: $16 $00
    ld   hl, Data_004_6AB3                        ; $6B3B: $21 $B3 $6A
    add  hl, de                                   ; $6B3E: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $6B3F: $F0 $EC
    add  [hl]                                     ; $6B41: $86
    add  $F0                                      ; $6B42: $C6 $F0
    ldh  [hActiveEntityVisualPosY], a             ; $6B44: $E0 $EC
    ld   hl, Data_004_6AB7                        ; $6B46: $21 $B7 $6A
    add  hl, de                                   ; $6B49: $19
    ldh  a, [hActiveEntityPosX]                   ; $6B4A: $F0 $EE
    add  [hl]                                     ; $6B4C: $86
    add  $F3                                      ; $6B4D: $C6 $F3
    ldh  [hActiveEntityPosX], a                   ; $6B4F: $E0 $EE

jr_004_6B51:
    ld   a, $02                                   ; $6B51: $3E $02
    ldh  [hActiveEntitySpriteVariant], a          ; $6B53: $E0 $F1
    ld   de, KnightSpriteVariants                 ; $6B55: $11 $A7 $6A
    call RenderActiveEntitySpritesPair            ; $6B58: $CD $C0 $3B
    ld   hl, wEntitiesPrivateState4Table          ; $6B5B: $21 $40 $C4
    add  hl, bc                                   ; $6B5E: $09
    ld   a, [hl]                                  ; $6B5F: $7E
    and  a                                        ; $6B60: $A7
    ret  z                                        ; $6B61: $C8

    ld   hl, wEntitiesPrivateState1Table          ; $6B62: $21 $B0 $C2
    add  hl, bc                                   ; $6B65: $09
    ld   a, [hl]                                  ; $6B66: $7E
    and  $80                                      ; $6B67: $E6 $80
    jr   nz, .jr_6B7C                             ; $6B69: $20 $11

    call GetEntityPrivateCountdown1               ; $6B6B: $CD $00 $0C
    jr   nz, .jr_6B7C                             ; $6B6E: $20 $0C

    ld   hl, wEntitiesOptions1Table               ; $6B70: $21 $30 $C4
    add  hl, bc                                   ; $6B73: $09
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF        ; $6B74: $36 $40
    call label_3B39                               ; $6B76: $CD $39 $3B
    call func_004_6BE1                            ; $6B79: $CD $E1 $6B

.jr_6B7C
    ldh  a, [hActiveEntityPosX]                   ; $6B7C: $F0 $EE
    add  $04                                      ; $6B7E: $C6 $04
    ld   hl, wEntitiesPosXTable                   ; $6B80: $21 $00 $C2
    add  hl, bc                                   ; $6B83: $09
    sub  [hl]                                     ; $6B84: $96
    sra  a                                        ; $6B85: $CB $2F
    sra  a                                        ; $6B87: $CB $2F
    ldh  [hMultiPurpose0], a                      ; $6B89: $E0 $D7
    ldh  [hMultiPurpose2], a                      ; $6B8B: $E0 $D9
    ldh  a, [hActiveEntityVisualPosY]             ; $6B8D: $F0 $EC
    ld   hl, wEntitiesPosYTable                   ; $6B8F: $21 $10 $C2
    add  hl, bc                                   ; $6B92: $09
    sub  [hl]                                     ; $6B93: $96
    sra  a                                        ; $6B94: $CB $2F
    sra  a                                        ; $6B96: $CB $2F
    ldh  [hMultiPurpose1], a                      ; $6B98: $E0 $D8
    ldh  [hMultiPurpose3], a                      ; $6B9A: $E0 $DA
    ld   a, [wOAMNextAvailableSlot]               ; $6B9C: $FA $C0 $C3
    ld   e, a                                     ; $6B9F: $5F
    ld   d, $00                                   ; $6BA0: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $6BA2: $21 $30 $C0
    add  hl, de                                   ; $6BA5: $19
    ld   e, l                                     ; $6BA6: $5D
    ld   d, h                                     ; $6BA7: $54
    call CopyEntityPositionToActivePosition       ; $6BA8: $CD $8A $3D
    ld   a, $03                                   ; $6BAB: $3E $03

.loop_6BAD
    ldh  [hMultiPurpose4], a                      ; $6BAD: $E0 $DB
    ldh  a, [hActiveEntityVisualPosY]             ; $6BAF: $F0 $EC
    ld   hl, hMultiPurpose1                       ; $6BB1: $21 $D8 $FF
    add  [hl]                                     ; $6BB4: $86
    ld   [de], a                                  ; $6BB5: $12
    inc  de                                       ; $6BB6: $13
    ldh  a, [hActiveEntityPosX]                   ; $6BB7: $F0 $EE
    ld   hl, hMultiPurpose0                       ; $6BB9: $21 $D7 $FF
    add  [hl]                                     ; $6BBC: $86
    ld   [de], a                                  ; $6BBD: $12
    inc  de                                       ; $6BBE: $13
    ld   a, $24                                   ; $6BBF: $3E $24
    ld   [de], a                                  ; $6BC1: $12
    inc  de                                       ; $6BC2: $13
    ld   a, $00                                   ; $6BC3: $3E $00
    ld   [de], a                                  ; $6BC5: $12
    inc  de                                       ; $6BC6: $13
    ldh  a, [hMultiPurpose0]                      ; $6BC7: $F0 $D7
    ld   hl, hMultiPurpose2                       ; $6BC9: $21 $D9 $FF
    add  [hl]                                     ; $6BCC: $86
    ldh  [hMultiPurpose0], a                      ; $6BCD: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $6BCF: $F0 $D8
    ld   hl, hMultiPurpose3                       ; $6BD1: $21 $DA $FF
    add  [hl]                                     ; $6BD4: $86
    ldh  [hMultiPurpose1], a                      ; $6BD5: $E0 $D8
    ldh  a, [hMultiPurpose4]                      ; $6BD7: $F0 $DB
    dec  a                                        ; $6BD9: $3D
    jr   nz, .loop_6BAD                           ; $6BDA: $20 $D1

    ld   a, $03                                   ; $6BDC: $3E $03
    jp   func_015_7964_trampoline                 ; $6BDE: $C3 $A0 $3D

func_004_6BE1::
    ldh  a, [hActiveEntityPosX]                   ; $6BE1: $F0 $EE
    ldh  [hMultiPurpose4], a                      ; $6BE3: $E0 $DB
    swap a                                        ; $6BE5: $CB $37
    and  $0F                                      ; $6BE7: $E6 $0F
    ld   e, a                                     ; $6BE9: $5F
    ldh  a, [hActiveEntityVisualPosY]             ; $6BEA: $F0 $EC
    sub  $10                                      ; $6BEC: $D6 $10
    add  $04                                      ; $6BEE: $C6 $04
    ldh  [hMultiPurpose5], a                      ; $6BF0: $E0 $DC
    and  $F0                                      ; $6BF2: $E6 $F0
    or   e                                        ; $6BF4: $B3
    ld   e, a                                     ; $6BF5: $5F
    ld   d, $00                                   ; $6BF6: $16 $00
    ld   hl, wRoomObjects                         ; $6BF8: $21 $11 $D7
    ld   a, h                                     ; $6BFB: $7C
    add  hl, de                                   ; $6BFC: $19
    ld   h, a                                     ; $6BFD: $67
    ld   a, [hl]                                  ; $6BFE: $7E
    ldh  [hObjectUnderEntity], a                  ; $6BFF: $E0 $AF
    ld   e, a                                     ; $6C01: $5F
    ld   a, [wIsIndoor]                           ; $6C02: $FA $A5 $DB
    ld   d, a                                     ; $6C05: $57
    call GetObjectPhysicsFlags_trampoline         ; $6C06: $CD $26 $2A
    cp   $00                                      ; $6C09: $FE $00
    ret  z                                        ; $6C0B: $C8

    cp   $01                                      ; $6C0C: $FE $01
    ret  nz                                       ; $6C0E: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $6C0F: $21 $B0 $C2
    add  hl, bc                                   ; $6C12: $09
    ld   a, [hl]                                  ; $6C13: $7E
    cpl                                           ; $6C14: $2F
    inc  a                                        ; $6C15: $3C
    ld   [hl], a                                  ; $6C16: $77
    call GetEntityPrivateCountdown1               ; $6C17: $CD $00 $0C
    ld   [hl], $08                                ; $6C1A: $36 $08
    ld   a, JINGLE_SWORD_POKING                   ; $6C1C: $3E $07
    ldh  [hJingle], a                             ; $6C1E: $E0 $F2

label_004_6C20:
    ldh  a, [hActiveEntityPosX]                   ; $6C20: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $6C22: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $6C24: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $6C26: $E0 $D8
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ; $6C28: $3E $05
    jp   AddTranscientVfx                         ; $6C2A: $C3 $C7 $0C
