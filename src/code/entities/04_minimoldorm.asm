; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MinimoldormSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant2
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0
.variant5
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
.variant7
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant8
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant9
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

Data_004_5A71::
    db   $03, $03, $05, $05, $00, $00, $04, $04, $02, $02, $06, $06, $01, $01, $07, $07

Data_004_5A81::
    db   $00, $06, $0C, $0E

Data_004_5A85::
    db   $10, $0E, $0C, $06, $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E

MiniMoldromEntityHandler::
    call func_004_5B7F                            ; $5A95: $CD $7F $5B
    ld   a, [wRoomTransitionState]                ; $5A98: $FA $24 $C1
    and  a                                        ; $5A9B: $A7
    jr   nz, .jr_5AA6                             ; $5A9C: $20 $08

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5A9E: $21 $10 $C4
    add  hl, bc                                   ; $5AA1: $09
    ld   a, [hl]                                  ; $5AA2: $7E
    and  a                                        ; $5AA3: $A7
    jr   z, jr_004_5AA9                           ; $5AA4: $28 $03

.jr_5AA6
    call func_004_5A1A                            ; $5AA6: $CD $1A $5A

jr_004_5AA9:
    call ReturnIfNonInteractive_04                ; $5AA9: $CD $A3 $7F
    ld   hl, wEntitiesInertiaTable                ; $5AAC: $21 $D0 $C3
    add  hl, bc                                   ; $5AAF: $09
    ld   a, [hl]                                  ; $5AB0: $7E
    inc  a                                        ; $5AB1: $3C
    and  $1F                                      ; $5AB2: $E6 $1F
    ld   [hl], a                                  ; $5AB4: $77
    ldh  [hMultiPurpose0], a                      ; $5AB5: $E0 $D7
    ld   hl, wEntitiesLoadOrderTable              ; $5AB7: $21 $60 $C4
    add  hl, bc                                   ; $5ABA: $09
    ld   e, [hl]                                  ; $5ABB: $5E
    sla  e                                        ; $5ABC: $CB $23
    sla  e                                        ; $5ABE: $CB $23
    sla  e                                        ; $5AC0: $CB $23
    sla  e                                        ; $5AC2: $CB $23
    sla  e                                        ; $5AC4: $CB $23
    ld   d, $00                                   ; $5AC6: $16 $00
    push de                                       ; $5AC8: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $5AC9: $21 $00 $D0
    add  hl, de                                   ; $5ACC: $19
    ldh  a, [hMultiPurpose0]                      ; $5ACD: $F0 $D7
    ld   e, a                                     ; $5ACF: $5F
    add  hl, de                                   ; $5AD0: $19
    ldh  a, [hActiveEntityPosX]                   ; $5AD1: $F0 $EE
    ld   [hl], a                                  ; $5AD3: $77
    pop  de                                       ; $5AD4: $D1
    ld   hl, wD100                                ; $5AD5: $21 $00 $D1
    add  hl, de                                   ; $5AD8: $19
    ldh  a, [hMultiPurpose0]                      ; $5AD9: $F0 $D7
    ld   e, a                                     ; $5ADB: $5F
    add  hl, de                                   ; $5ADC: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5ADD: $F0 $EC
    ld   [hl], a                                  ; $5ADF: $77
    call ApplyRecoilIfNeeded_04                   ; $5AE0: $CD $80 $6D
    call label_3B39                               ; $5AE3: $CD $39 $3B

func_004_5AE6::
    ld   hl, wEntitiesFlashCountdownTable         ; $5AE6: $21 $20 $C4
    add  hl, bc                                   ; $5AE9: $09
    ld   a, [hl]                                  ; $5AEA: $7E
    and  a                                        ; $5AEB: $A7
    jr   nz, .jr_5AF1                             ; $5AEC: $20 $03

    call UpdateEntityPosWithSpeed_04              ; $5AEE: $CD $CA $6D

.jr_5AF1
    call label_3B23                               ; $5AF1: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $5AF4: $21 $A0 $C2
    add  hl, bc                                   ; $5AF7: $09
    ld   a, [hl]                                  ; $5AF8: $7E
    and  a                                        ; $5AF9: $A7
    jr   z, jr_004_5B28                           ; $5AFA: $28 $2C

    ld   e, $08                                   ; $5AFC: $1E $08
    bit  0, a                                     ; $5AFE: $CB $47
    jr   nz, .jr_5B10                             ; $5B00: $20 $0E

    ld   e, $00                                   ; $5B02: $1E $00
    bit  1, a                                     ; $5B04: $CB $4F
    jr   nz, .jr_5B10                             ; $5B06: $20 $08

    ld   e, $04                                   ; $5B08: $1E $04
    bit  2, a                                     ; $5B0A: $CB $57
    jr   nz, .jr_5B10                             ; $5B0C: $20 $02

    ld   e, $0C                                   ; $5B0E: $1E $0C

.jr_5B10
    ld   hl, wEntitiesPrivateState1Table          ; $5B10: $21 $B0 $C2
    add  hl, bc                                   ; $5B13: $09
    ld   [hl], e                                  ; $5B14: $73
    call GetRandomByte                            ; $5B15: $CD $0D $28
    rra                                           ; $5B18: $1F
    jr   c, .jr_5B23                              ; $5B19: $38 $08

    ld   hl, wEntitiesPrivateState2Table          ; $5B1B: $21 $C0 $C2
    add  hl, bc                                   ; $5B1E: $09
    ld   a, [hl]                                  ; $5B1F: $7E
    cpl                                           ; $5B20: $2F
    inc  a                                        ; $5B21: $3C
    ld   [hl], a                                  ; $5B22: $77

.jr_5B23
    call GetEntityTransitionCountdown             ; $5B23: $CD $05 $0C
    ld   [hl], $10                                ; $5B26: $36 $10

jr_004_5B28:
    call GetEntityPrivateCountdown1               ; $5B28: $CD $00 $0C
    jr   nz, jr_004_5B66                          ; $5B2B: $20 $39

    ld   [hl], $04                                ; $5B2D: $36 $04
    ldh  a, [hActiveEntityType]                   ; $5B2F: $F0 $EB
    cp   ENTITY_MOLDORM                           ; $5B31: $FE $59
    jr   nz, .jr_5B37                             ; $5B33: $20 $02

    ld   [hl], $06                                ; $5B35: $36 $06

.jr_5B37
    ld   hl, wEntitiesPrivateState2Table          ; $5B37: $21 $C0 $C2
    add  hl, bc                                   ; $5B3A: $09
    ld   a, [hl]                                  ; $5B3B: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $5B3C: $21 $B0 $C2
    add  hl, bc                                   ; $5B3F: $09
    add  [hl]                                     ; $5B40: $86
    and  $0F                                      ; $5B41: $E6 $0F
    ld   [hl], a                                  ; $5B43: $77
    ld   hl, wEntitiesPrivateState1Table          ; $5B44: $21 $B0 $C2
    add  hl, bc                                   ; $5B47: $09
    ld   e, [hl]                                  ; $5B48: $5E
    ld   d, b                                     ; $5B49: $50
    ld   hl, Data_004_5A71                        ; $5B4A: $21 $71 $5A
    add  hl, de                                   ; $5B4D: $19
    ld   a, [hl]                                  ; $5B4E: $7E
    call SetEntitySpriteVariant                   ; $5B4F: $CD $0C $3B
    ld   hl, Data_004_5A81                        ; $5B52: $21 $81 $5A
    add  hl, de                                   ; $5B55: $19
    ld   a, [hl]                                  ; $5B56: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5B57: $21 $50 $C2
    add  hl, bc                                   ; $5B5A: $09
    ld   [hl], a                                  ; $5B5B: $77
    ld   hl, Data_004_5A85                        ; $5B5C: $21 $85 $5A
    add  hl, de                                   ; $5B5F: $19
    ld   a, [hl]                                  ; $5B60: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5B61: $21 $40 $C2
    add  hl, bc                                   ; $5B64: $09
    ld   [hl], a                                  ; $5B65: $77

jr_004_5B66:
    call GetEntityTransitionCountdown             ; $5B66: $CD $05 $0C
    jr   nz, .ret_5B7E                            ; $5B69: $20 $13

    call GetRandomByte                            ; $5B6B: $CD $0D $28
    and  $1F                                      ; $5B6E: $E6 $1F
    add  $10                                      ; $5B70: $C6 $10
    ld   [hl], a                                  ; $5B72: $77
    call GetRandomByte                            ; $5B73: $CD $0D $28
    and  $02                                      ; $5B76: $E6 $02
    dec  a                                        ; $5B78: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $5B79: $21 $C0 $C2
    add  hl, bc                                   ; $5B7C: $09
    ld   [hl], a                                  ; $5B7D: $77

.ret_5B7E
    ret                                           ; $5B7E: $C9

func_004_5B7F::
    ld   de, MinimoldormSpriteVariants            ; $5B7F: $11 $49 $5A
    call RenderActiveEntitySpritesPair            ; $5B82: $CD $C0 $3B
    call ReturnIfNonInteractive_04                ; $5B85: $CD $A3 $7F
    ld   hl, wEntitiesInertiaTable                ; $5B88: $21 $D0 $C3
    add  hl, bc                                   ; $5B8B: $09
    ld   a, [hl]                                  ; $5B8C: $7E
    ldh  [hMultiPurpose0], a                      ; $5B8D: $E0 $D7
    ld   hl, wEntitiesLoadOrderTable              ; $5B8F: $21 $60 $C4
    add  hl, bc                                   ; $5B92: $09
    ld   e, [hl]                                  ; $5B93: $5E
    sla  e                                        ; $5B94: $CB $23
    sla  e                                        ; $5B96: $CB $23
    sla  e                                        ; $5B98: $CB $23
    sla  e                                        ; $5B9A: $CB $23
    sla  e                                        ; $5B9C: $CB $23
    ld   d, b                                     ; $5B9E: $50
    push de                                       ; $5B9F: $D5
    push de                                       ; $5BA0: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $5BA1: $21 $00 $D0
    add  hl, de                                   ; $5BA4: $19
    ldh  a, [hMultiPurpose0]                      ; $5BA5: $F0 $D7
    sub  $09                                      ; $5BA7: $D6 $09
    and  $1F                                      ; $5BA9: $E6 $1F
    ld   e, a                                     ; $5BAB: $5F
    ld   d, b                                     ; $5BAC: $50
    add  hl, de                                   ; $5BAD: $19
    ld   a, [hl]                                  ; $5BAE: $7E
    ldh  [hActiveEntityPosX], a                   ; $5BAF: $E0 $EE
    pop  de                                       ; $5BB1: $D1
    ld   hl, wD100                                ; $5BB2: $21 $00 $D1
    add  hl, de                                   ; $5BB5: $19
    ldh  a, [hMultiPurpose0]                      ; $5BB6: $F0 $D7
    sub  $09                                      ; $5BB8: $D6 $09
    and  $1F                                      ; $5BBA: $E6 $1F
    ld   e, a                                     ; $5BBC: $5F
    ld   d, b                                     ; $5BBD: $50
    add  hl, de                                   ; $5BBE: $19
    ld   a, [hl]                                  ; $5BBF: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $5BC0: $E0 $EC
    ld   a, $08                                   ; $5BC2: $3E $08
    ldh  [hActiveEntitySpriteVariant], a          ; $5BC4: $E0 $F1
    ld   de, MinimoldormSpriteVariants            ; $5BC6: $11 $49 $5A
    call RenderActiveEntitySpritesPair            ; $5BC9: $CD $C0 $3B
    pop  de                                       ; $5BCC: $D1
    push de                                       ; $5BCD: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $5BCE: $21 $00 $D0
    add  hl, de                                   ; $5BD1: $19
    ldh  a, [hMultiPurpose0]                      ; $5BD2: $F0 $D7
    sub  $10                                      ; $5BD4: $D6 $10
    and  $1F                                      ; $5BD6: $E6 $1F
    ld   e, a                                     ; $5BD8: $5F
    ld   d, b                                     ; $5BD9: $50
    add  hl, de                                   ; $5BDA: $19
    ld   a, [hl]                                  ; $5BDB: $7E
    ldh  [hActiveEntityPosX], a                   ; $5BDC: $E0 $EE
    pop  de                                       ; $5BDE: $D1
    ld   hl, wD100                                ; $5BDF: $21 $00 $D1
    add  hl, de                                   ; $5BE2: $19
    ldh  a, [hMultiPurpose0]                      ; $5BE3: $F0 $D7
    sub  $10                                      ; $5BE5: $D6 $10
    and  $1F                                      ; $5BE7: $E6 $1F
    ld   e, a                                     ; $5BE9: $5F
    ld   d, b                                     ; $5BEA: $50
    add  hl, de                                   ; $5BEB: $19
    ld   a, [hl]                                  ; $5BEC: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $5BED: $E0 $EC
    ld   a, $09                                   ; $5BEF: $3E $09
    ldh  [hActiveEntitySpriteVariant], a          ; $5BF1: $E0 $F1
    ld   de, MinimoldormSpriteVariants            ; $5BF3: $11 $49 $5A
    call RenderActiveEntitySpritesPair            ; $5BF6: $CD $C0 $3B
    jp   CopyEntityPositionToActivePosition       ; $5BF9: $C3 $8A $3D
