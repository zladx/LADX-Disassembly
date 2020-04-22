Data_006_59A8::
    db   $70, $02, $72, $02, $74, $02, $76, $02, $72, $22, $70, $22, $76, $22, $74, $22
    db   $00, $02, $02, $02, $04, $02, $06, $02, $02, $22, $00, $22, $06, $22, $04, $22

Data_006_59C8::
    db   $78, $02, $7A, $02, $7C, $02, $7E, $02, $7A, $22, $78, $22, $7E, $22, $7C, $22
    db   $10, $02, $12, $02, $14, $02, $16, $02, $12, $22, $10, $22, $16, $22, $14, $22

YipYipEntityHandler::
    ld   a, [wDialogState]                        ; $59E8: $FA $9F $C1
    and  a                                        ; $59EB: $A7
    jr   z, jr_006_5A0D                           ; $59EC: $28 $1F

    ld   a, [wDialogIndex]                        ; $59EE: $FA $73 $C1
    cp   $82                                      ; $59F1: $FE $82
    jr   z, jr_006_5A0D                           ; $59F3: $28 $18

    call func_006_6594                            ; $59F5: $CD $94 $65
    ld   hl, wEntitiesDirectionTable              ; $59F8: $21 $80 $C3
    add  hl, bc                                   ; $59FB: $09
    ld   [hl], e                                  ; $59FC: $73
    call ClearEntitySpeed                         ; $59FD: $CD $7F $3D
    ld   a, [wDialogCharacterIndex]               ; $5A00: $FA $70 $C1
    ld   e, $00                                   ; $5A03: $1E $00
    and  $06                                      ; $5A05: $E6 $06
    jr   z, jr_006_5A0A                           ; $5A07: $28 $01

    inc  e                                        ; $5A09: $1C

jr_006_5A0A:
    ld   a, e                                     ; $5A0A: $7B
    ldh  [hActiveEntitySpriteVariant], a          ; $5A0B: $E0 $F1

jr_006_5A0D:
    ld   hl, wEntitiesDirectionTable              ; $5A0D: $21 $80 $C3
    add  hl, bc                                   ; $5A10: $09
    ld   a, [hl]                                  ; $5A11: $7E
    and  a                                        ; $5A12: $A7
    jr   nz, jr_006_5A1B                          ; $5A13: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ; $5A15: $F0 $F1
    add  $02                                      ; $5A17: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ; $5A19: $E0 $F1

jr_006_5A1B:
    ld   de, Data_006_59A8                        ; $5A1B: $11 $A8 $59
    ld   hl, wEntitiesPrivateState1Table          ; $5A1E: $21 $B0 $C2
    add  hl, bc                                   ; $5A21: $09
    ld   a, [hl]                                  ; $5A22: $7E
    and  a                                        ; $5A23: $A7
    jr   nz, jr_006_5A33                          ; $5A24: $20 $0D

    ldh  a, [hMapRoom]                            ; $5A26: $F0 $F6
    cp   $B2                                      ; Inside the dog house
    jr   nz, jr_006_5A36                          ; $5A2A: $20 $0A

    ld   a, [wTradeSequenceItem]                  ; $5A2C: $FA $0E $DB
    cp   TRADING_ITEM_DOG_FOOD                    ; $5A2F: $FE $03
    jr   c, jr_006_5A36                           ; $5A31: $38 $03

jr_006_5A33:
    ld   de, Data_006_59C8                        ; $5A33: $11 $C8 $59

jr_006_5A36:
    ld   a, [wGameplayType]                       ; $5A36: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $5A39: $FE $01
    jr   nz, jr_006_5A43                          ; $5A3B: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ; $5A3D: $F0 $F1
    add  $04                                      ; $5A3F: $C6 $04
    ldh  [hActiveEntitySpriteVariant], a          ; $5A41: $E0 $F1

jr_006_5A43:
    call RenderActiveEntitySpritesPair            ; $5A43: $CD $C0 $3B
    call func_006_64C6                            ; $5A46: $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ; $5A49: $CD $56 $0C
    call func_006_657A                            ; $5A4C: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $5A4F: $21 $20 $C3
    add  hl, bc                                   ; $5A52: $09
    dec  [hl]                                     ; $5A53: $35
    dec  [hl]                                     ; $5A54: $35
    ld   hl, wEntitiesPosZTable                   ; $5A55: $21 $10 $C3
    add  hl, bc                                   ; $5A58: $09
    ld   a, [hl]                                  ; $5A59: $7E
    and  $80                                      ; $5A5A: $E6 $80
    ldh  [hFFE8], a                               ; $5A5C: $E0 $E8
    jr   z, jr_006_5A67                           ; $5A5E: $28 $07

    xor  a                                        ; $5A60: $AF
    ld   [hl], a                                  ; $5A61: $77
    ld   hl, wEntitiesSpeedZTable                 ; $5A62: $21 $20 $C3
    add  hl, bc                                   ; $5A65: $09
    ld   [hl], a                                  ; $5A66: $77

jr_006_5A67:
    ldh  a, [hActiveEntityState]                  ; $5A67: $F0 $F0
    cp   $02                                      ; $5A69: $FE $02
    jr   nc, jr_006_5A98                          ; $5A6B: $30 $2B

    call func_006_645D                            ; $5A6D: $CD $5D $64
    jr   nc, jr_006_5A98                          ; $5A70: $30 $26

    ld   e, $23                                   ; $5A72: $1E $23
    ldh  a, [hMapRoom]                            ; $5A74: $F0 $F6
    cp   $B2                                      ; Inside the dog house
    jr   nz, jr_006_5A91                          ; $5A78: $20 $17

    ld   e, $80                                   ; $5A7A: $1E $80
    ld   a, [wTradeSequenceItem]                  ; $5A7C: $FA $0E $DB
    cp   TRADING_ITEM_RIBBON                      ; $5A7F: $FE $02
    jr   nz, jr_006_5A8A                          ; $5A81: $20 $07

    call IncrementEntityState                     ; $5A83: $CD $12 $3B
    ld   [hl], $02                                ; $5A86: $36 $02
    ld   e, $81                                   ; $5A88: $1E $81

jr_006_5A8A:
    ld   a, e                                     ; $5A8A: $7B
    call OpenDialogInTable1                       ; $5A8B: $CD $73 $23
    jp   func_006_5ACC                            ; $5A8E: $C3 $CC $5A

jr_006_5A91:
    ld   a, e                                     ; $5A91: $7B
    call OpenDialog                               ; $5A92: $CD $85 $23
    call func_006_5ACC                            ; $5A95: $CD $CC $5A

jr_006_5A98:
    ldh  a, [hActiveEntityState]                  ; $5A98: $F0 $F0
    JP_TABLE                                      ; $5A9A
._00 dw YipYipState0Handler
._01 dw YipYipState1Handler
._02 dw YipYipState2Handler
._03 dw YipYipState3Handler

YipYipState2Handler::
    ld   a, [wDialogState]                        ; $5AA3: $FA $9F $C1
    and  a                                        ; $5AA6: $A7
    jr   nz, jr_006_5AD0                          ; $5AA7: $20 $27

    ld   a, [wC177]                               ; $5AA9: $FA $77 $C1
    and  a                                        ; $5AAC: $A7
    jr   nz, jr_006_5AC3                          ; $5AAD: $20 $14

    ld   a, TRADING_ITEM_DOG_FOOD                 ; $5AAF: $3E $03
    ld   [wTradeSequenceItem], a                  ; $5AB1: $EA $0E $DB
    ld   a, $0D                                   ; $5AB4: $3E $0D
    ldh  [hFFA5], a                               ; $5AB6: $E0 $A5
    call_open_dialog $183                         ; $5AB8
    call func_006_5ACC                            ; $5ABD: $CD $CC $5A
    jp   IncrementEntityState                     ; $5AC0: $C3 $12 $3B

jr_006_5AC3:
    call IncrementEntityState                     ; $5AC3: $CD $12 $3B
    ld   [hl], b                                  ; $5AC6: $70
    call_open_dialog $184                         ; $5AC7

func_006_5ACC::
    ld   a, $18                                   ; $5ACC: $3E $18
    ldh  [hWaveSfx], a                            ; $5ACE: $E0 $F3

jr_006_5AD0:
    ret                                           ; $5AD0: $C9

YipYipState3Handler::
    ld   a, [wDialogState]                        ; $5AD1: $FA $9F $C1
    and  a                                        ; $5AD4: $A7
    jr   nz, jr_006_5ADE                          ; $5AD5: $20 $07

    call CreateTradingItemEntity                  ; $5AD7: $CD $0C $0C
    call IncrementEntityState                     ; $5ADA: $CD $12 $3B
    ld   [hl], b                                  ; $5ADD: $70

jr_006_5ADE:
    ret                                           ; $5ADE: $C9

Data_006_5ADF::
    db   $02, $08, $0C, $08, $FE, $F8, $F4, $F8

YipYipState0Handler::
    xor  a                                        ; $5AE7: $AF
    call SetEntitySpriteVariant                   ; $5AE8: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5AEB: $CD $05 $0C
    jr   nz, jr_006_5B27                          ; $5AEE: $20 $37

    call GetRandomByte                            ; $5AF0: $CD $0D $28
    and  $07                                      ; $5AF3: $E6 $07
    ld   e, a                                     ; $5AF5: $5F
    ld   d, b                                     ; $5AF6: $50
    ld   hl, Data_006_5ADF                        ; $5AF7: $21 $DF $5A
    add  hl, de                                   ; $5AFA: $19
    ld   a, [hl]                                  ; $5AFB: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5AFC: $21 $40 $C2
    add  hl, bc                                   ; $5AFF: $09
    ld   [hl], a                                  ; $5B00: $77
    ld   a, e                                     ; $5B01: $7B
    and  $04                                      ; $5B02: $E6 $04
    ld   hl, wEntitiesDirectionTable              ; $5B04: $21 $80 $C3
    add  hl, bc                                   ; $5B07: $09
    ld   [hl], a                                  ; $5B08: $77
    call GetRandomByte                            ; $5B09: $CD $0D $28
    and  $07                                      ; $5B0C: $E6 $07
    ld   e, a                                     ; $5B0E: $5F
    ld   hl, Data_006_5ADF                        ; $5B0F: $21 $DF $5A
    add  hl, de                                   ; $5B12: $19
    ld   a, [hl]                                  ; $5B13: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5B14: $21 $50 $C2
    add  hl, bc                                   ; $5B17: $09
    ld   [hl], a                                  ; $5B18: $77
    call GetEntityTransitionCountdown             ; $5B19: $CD $05 $0C
    call GetRandomByte                            ; $5B1C: $CD $0D $28
    and  $1F                                      ; $5B1F: $E6 $1F
    add  $30                                      ; $5B21: $C6 $30
    ld   [hl], a                                  ; $5B23: $77
    call IncrementEntityState                     ; $5B24: $CD $12 $3B

jr_006_5B27:
    jp   label_006_5B4C                           ; $5B27: $C3 $4C $5B

YipYipState1Handler::
    call func_006_6541                            ; $5B2A: $CD $41 $65
    call label_3B23                               ; $5B2D: $CD $23 $3B
    ldh  a, [hFFE8]                               ; $5B30: $F0 $E8
    and  a                                        ; $5B32: $A7
    jr   z, label_006_5B4C                        ; $5B33: $28 $17

    call GetEntityTransitionCountdown             ; $5B35: $CD $05 $0C
    jr   nz, jr_006_5B41                          ; $5B38: $20 $07

    ld   [hl], $30                                ; $5B3A: $36 $30
    call IncrementEntityState                     ; $5B3C: $CD $12 $3B
    ld   [hl], b                                  ; $5B3F: $70
    ret                                           ; $5B40: $C9

jr_006_5B41:
    ld   hl, wEntitiesSpeedZTable                 ; $5B41: $21 $20 $C3
    add  hl, bc                                   ; $5B44: $09
    ld   [hl], $08                                ; $5B45: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $5B47: $21 $10 $C3
    add  hl, bc                                   ; $5B4A: $09
    inc  [hl]                                     ; $5B4B: $34

label_006_5B4C:
    ldh  a, [hFrameCounter]                       ; $5B4C: $F0 $E7
    rra                                           ; $5B4E: $1F
    rra                                           ; $5B4F: $1F
    rra                                           ; $5B50: $1F
    and  $01                                      ; $5B51: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5B53: $C3 $0C $3B
