Data_018_795E::
    db   $6C, $74, $6D, $75

Data_018_7962::
    db   $64, $74, $65, $75

MagicPowderSprinkleEntityHandler::
    call func_018_7B02                            ; $7966: $CD $02 $7B
    call ReturnIfNonInteractive_18                ; $7969: $CD $E8 $7D
    ldh  a, [hActiveEntityState]                  ; $796C: $F0 $F0
    and  a                                        ; $796E: $A7
    jp   nz, label_018_7A5D                       ; $796F: $C2 $5D $7A

    call GetEntityTransitionCountdown             ; $7972: $CD $05 $0C
    jp   z, label_018_7A48                        ; $7975: $CA $48 $7A

    cp   $07                                      ; $7978: $FE $07
    jp   nz, label_018_7A4B                       ; $797A: $C2 $4B $7A

    push bc                                       ; $797D: $C5
    ld   hl, wEntitiesPosXTable                   ; $797E: $21 $00 $C2
    add  hl, bc                                   ; $7981: $09
    ld   a, [hl]                                  ; $7982: $7E
    add  $07                                      ; $7983: $C6 $07
    sub  $08                                      ; $7985: $D6 $08
    and  $F0                                      ; $7987: $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ; $7989: $E0 $CE
    swap a                                        ; $798B: $CB $37
    ld   hl, wEntitiesPosYTable                   ; $798D: $21 $10 $C2
    add  hl, bc                                   ; $7990: $09
    ld   c, a                                     ; $7991: $4F
    ld   a, [hl]                                  ; $7992: $7E
    add  $07                                      ; $7993: $C6 $07
    sub  $10                                      ; $7995: $D6 $10
    and  $F0                                      ; $7997: $E6 $F0
    ldh  [hIntersectedObjectTop], a               ; $7999: $E0 $CD
    or   c                                        ; $799B: $B1
    ld   c, a                                     ; $799C: $4F
    ld   b, $00                                   ; $799D: $06 $00
    ld   hl, wRoomObjects                         ; $799F: $21 $11 $D7
    ld   a, h                                     ; $79A2: $7C
    add  hl, bc                                   ; $79A3: $09
    ld   e, c                                     ; $79A4: $59
    ld   d, b                                     ; $79A5: $50
    ld   h, a                                     ; $79A6: $67
    pop  bc                                       ; $79A7: $C1
    ld   a, [hl]                                  ; $79A8: $7E
    ldh  [hObjectUnderEntity], a                  ; $79A9: $E0 $AF
    cp   $D3                                      ; $79AB: $FE $D3
    jr   z, .jr_79B3                              ; $79AD: $28 $04

    cp   $5C                                      ; $79AF: $FE $5C
    jr   nz, jr_018_79CF                          ; $79B1: $20 $1C

.jr_79B3
    ld   a, [wIsIndoor]                           ; $79B3: $FA $A5 $DB
    and  a                                        ; $79B6: $A7
    jr   nz, jr_018_79CF                          ; $79B7: $20 $16

    call func_014_5526_trampoline                 ; $79B9: $CD $78 $21
    ldh  a, [hActiveEntityPosX]                   ; $79BC: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $79BE: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $79C0: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $79C2: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $79C4: $3E $02
    call AddTranscientVfx                         ; $79C6: $CD $C7 $0C
    ld   a, JINGLE_POOF                           ; $79C9: $3E $2F
    ldh  [hJingle], a                             ; $79CB: $E0 $F2
    jr   label_018_7A48                           ; $79CD: $18 $79

jr_018_79CF:
    ld   a, [wIsIndoor]                           ; $79CF: $FA $A5 $DB
    and  a                                        ; $79D2: $A7
    jp   z, label_018_7A4B                        ; $79D3: $CA $4B $7A

    ldh  a, [hObjectUnderEntity]                  ; $79D6: $F0 $AF
    cp   $AB                                      ; $79D8: $FE $AB
    ret  nz                                       ; $79DA: $C0

    ldh  a, [hIsGBC]                              ; $79DB: $F0 $FE
    and  a                                        ; $79DD: $A7
    jr   z, .jr_79F0                              ; $79DE: $28 $10

    ld   a, [wLinkMotionState]                    ; $79E0: $FA $1C $C1
    cp   LINK_MOTION_REVOLVING_DOOR               ; $79E3: $FE $05
    ret  z                                        ; $79E5: $C8

    ld   a, [wBGPaletteTransitionEffect]          ; $79E6: $FA $D6 $DD
    and  a                                        ; $79E9: $A7
    ret  nz                                       ; $79EA: $C0

    ld   a, [wRoomTransitionState]                ; $79EB: $FA $24 $C1
    and  a                                        ; $79EE: $A7
    ret  nz                                       ; $79EF: $C0

.jr_79F0
    ld   a, $AC                                   ; $79F0: $3E $AC
    ld   [hl], a                                  ; $79F2: $77
    ld   [wDDD8], a                               ; $79F3: $EA $D8 $DD
    ld   d, h                                     ; $79F6: $54
    ld   e, l                                     ; $79F7: $5D
    ld   hl, wEntitiesPrivateState1Table          ; $79F8: $21 $B0 $C2
    add  hl, bc                                   ; $79FB: $09
    ld   [hl], d                                  ; $79FC: $72
    ld   hl, wEntitiesPrivateState2Table          ; $79FD: $21 $C0 $C2
    add  hl, bc                                   ; $7A00: $09
    ld   [hl], e                                  ; $7A01: $73
    ld   hl, wEntitiesStateTable                  ; $7A02: $21 $90 $C2
    add  hl, bc                                   ; $7A05: $09
    ld   [hl], $01                                ; $7A06: $36 $01
    call GetEntityDropTimer                       ; $7A08: $CD $FB $0B
    ld   [hl], $80                                ; $7A0B: $36 $80
    ld   hl, wEntitiesPosXTable                   ; $7A0D: $21 $00 $C2
    add  hl, bc                                   ; $7A10: $09
    ldh  a, [hIntersectedObjectLeft]              ; $7A11: $F0 $CE
    ld   [hl], a                                  ; $7A13: $77
    ld   hl, wEntitiesPosYTable                   ; $7A14: $21 $10 $C2
    add  hl, bc                                   ; $7A17: $09
    ldh  a, [hIntersectedObjectTop]               ; $7A18: $F0 $CD
    ld   [hl], a                                  ; $7A1A: $77
    ld   hl, wC1A2                                ; $7A1B: $21 $A2 $C1
    inc  [hl]                                     ; $7A1E: $34
    ld   a, [wC3CD]                               ; $7A1F: $FA $CD $C3
    and  a                                        ; $7A22: $A7
    jr   z, .jr_7A39                              ; $7A23: $28 $14

    sub  $04                                      ; $7A25: $D6 $04
    ld   [wC3CD], a                               ; $7A27: $EA $CD $C3
    ldh  a, [hIsGBC]                              ; $7A2A: $F0 $FE
    and  a                                        ; $7A2C: $A7
    jr   z, .jr_7A39                              ; $7A2D: $28 $0A

    ld   a, $40                                   ; $7A2F: $3E $40
    ld   [wBGPaletteTransitionEffect], a          ; $7A31: $EA $D6 $DD
    ld   a, $0B                                   ; $7A34: $3E $0B
    ld   [wDDD7], a                               ; $7A36: $EA $D7 $DD

.jr_7A39
    call GetEntityTransitionCountdown             ; $7A39: $CD $05 $0C
    ld   [hl], b                                  ; $7A3C: $70
    ld   a, NOISE_SFX_BURSTING_FLAME              ; $7A3D: $3E $12
    ldh  [hNoiseSfx], a                           ; $7A3F: $E0 $F4
    ld   de, Data_018_795E                        ; $7A41: $11 $5E $79
    push de                                       ; $7A44: $D5
    jp   label_018_7B1D                           ; $7A45: $C3 $1D $7B

label_018_7A48:
    jp   ClearEntityStatusBank18                  ; $7A48: $C3 $08 $7F

label_018_7A4B:
    cp   $10                                      ; $7A4B: $FE $10
    ret  nc                                       ; $7A4D: $D0

    ld   hl, wEntitiesPrivateState4Table          ; $7A4E: $21 $40 $C4
    add  hl, bc                                   ; $7A51: $09
    ld   a, [hl]                                  ; $7A52: $7E
    and  a                                        ; $7A53: $A7
    ret  nz                                       ; $7A54: $C0

    ld   a, $09                                   ; $7A55: $3E $09
    ld   [wC19E], a                               ; $7A57: $EA $9E $C1
    jp   label_3B7B                               ; $7A5A: $C3 $7B $3B

label_018_7A5D:
    call GetEntityDropTimer                       ; $7A5D: $CD $FB $0B
    jr   nz, ret_018_7AB9                         ; $7A60: $20 $57

    ld   hl, wEntitiesPosXTable                   ; $7A62: $21 $00 $C2
    add  hl, bc                                   ; $7A65: $09
    ld   a, [hl]                                  ; $7A66: $7E
    ldh  [hIntersectedObjectLeft], a              ; $7A67: $E0 $CE
    ld   hl, wEntitiesPosYTable                   ; $7A69: $21 $10 $C2
    add  hl, bc                                   ; $7A6C: $09
    ld   a, [hl]                                  ; $7A6D: $7E
    ldh  [hIntersectedObjectTop], a               ; $7A6E: $E0 $CD
    ld   hl, wEntitiesPrivateState1Table          ; $7A70: $21 $B0 $C2
    add  hl, bc                                   ; $7A73: $09
    ld   d, [hl]                                  ; $7A74: $56
    ld   hl, wEntitiesPrivateState2Table          ; $7A75: $21 $C0 $C2
    add  hl, bc                                   ; $7A78: $09
    ld   e, [hl]                                  ; $7A79: $5E
    ld   a, $AB                                   ; $7A7A: $3E $AB
    ld   [de], a                                  ; $7A7C: $12
    ld   [wDDD8], a                               ; $7A7D: $EA $D8 $DD
    call ClearEntityStatusBank18                  ; $7A80: $CD $08 $7F
    ldh  a, [hMapRoom]                            ; $7A83: $F0 $F6
    cp   UNKNOWN_ROOM_74                          ; $7A85: $FE $74
    ret  z                                        ; $7A87: $C8

    ld   hl, wC1A2                                ; $7A88: $21 $A2 $C1
    dec  [hl]                                     ; $7A8B: $35
    ld   a, [wC3CD]                               ; $7A8C: $FA $CD $C3
    cp   $0C                                      ; $7A8F: $FE $0C
    jr   nc, .jr_7AB2                             ; $7A91: $30 $1F

    add  $04                                      ; $7A93: $C6 $04
    ld   [wC3CD], a                               ; $7A95: $EA $CD $C3
    ldh  a, [hIsGBC]                              ; $7A98: $F0 $FE
    and  a                                        ; $7A9A: $A7
    jr   z, .jr_7AB2                              ; $7A9B: $28 $15

    ld   a, [wLinkMotionState]                    ; $7A9D: $FA $1C $C1
    cp   $05                                      ; $7AA0: $FE $05
    ret  z                                        ; $7AA2: $C8

    ld   a, [wRoomTransitionState]                ; $7AA3: $FA $24 $C1
    and  a                                        ; $7AA6: $A7
    ret  nz                                       ; $7AA7: $C0

    ld   a, $80                                   ; $7AA8: $3E $80
    ld   [wBGPaletteTransitionEffect], a          ; $7AAA: $EA $D6 $DD
    ld   a, $0B                                   ; $7AAD: $3E $0B
    ld   [wDDD7], a                               ; $7AAF: $EA $D7 $DD

.jr_7AB2
    ld   de, Data_018_7962                        ; $7AB2: $11 $62 $79
    push de                                       ; $7AB5: $D5
    jp   label_018_7B1D                           ; $7AB6: $C3 $1D $7B

ret_018_7AB9:
    ret                                           ; $7AB9: $C9

Data_018_7ABA::
    db   $06, $FE, $24, $03, $03, $04, $24, $13, $05, $0A, $24, $03, $05, $FE, $24, $13
    db   $02, $04, $24, $03, $04, $0A, $24, $13, $03, $FF, $24, $03, $01, $04, $24, $13
    db   $02, $09, $24, $03, $01, $00, $24, $13, $FF, $04, $24, $03, $00, $06, $24, $13
    db   $00, $01, $24, $03, $FE, $03, $24, $13, $FF, $05, $24, $03, $FF, $01, $24, $13
    db   $FD, $03, $24, $03, $FE, $05, $24, $13

func_018_7B02::
    call GetEntityTransitionCountdown             ; $7B02: $CD $05 $0C
    ret  z                                        ; $7B05: $C8

    rra                                           ; $7B06: $1F
    rra                                           ; $7B07: $1F
    and  $07                                      ; $7B08: $E6 $07
    sla  a                                        ; $7B0A: $CB $27
    sla  a                                        ; $7B0C: $CB $27
    ld   e, a                                     ; $7B0E: $5F
    sla  a                                        ; $7B0F: $CB $27
    add  e                                        ; $7B11: $83
    ld   e, a                                     ; $7B12: $5F
    ld   d, b                                     ; $7B13: $50
    ld   hl, Data_018_7ABA                        ; $7B14: $21 $BA $7A
    add  hl, de                                   ; $7B17: $19
    ld   c, $03                                   ; $7B18: $0E $03
    jp   RenderActiveEntitySpritesRect            ; $7B1A: $C3 $E6 $3C

label_018_7B1D:
    call label_2887                               ; $7B1D: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $7B20: $F0 $FE
    and  a                                        ; $7B22: $A7
    jr   z, .jr_7B2C                              ; $7B23: $28 $07

    push bc                                       ; $7B25: $C5
    ld   a, $18                                   ; $7B26: $3E $18
    call func_91D                                 ; $7B28: $CD $1D $09
    pop  bc                                       ; $7B2B: $C1

.jr_7B2C
    ld   a, [wDrawCommandsSize]                   ; $7B2C: $FA $00 $D6
    ld   e, a                                     ; $7B2F: $5F
    ld   d, $00                                   ; $7B30: $16 $00
    ld   hl, wDrawCommand                         ; $7B32: $21 $01 $D6
    add  hl, de                                   ; $7B35: $19
    add  $0A                                      ; $7B36: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $7B38: $EA $00 $D6
    pop  de                                       ; $7B3B: $D1
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $7B3C: $F0 $CF
    ld   [hl+], a                                 ; $7B3E: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $7B3F: $F0 $D0
    ld   [hl+], a                                 ; $7B41: $22
    ld   a, $81                                   ; $7B42: $3E $81
    ld   [hl+], a                                 ; $7B44: $22
    ld   a, [de]                                  ; $7B45: $1A
    inc  de                                       ; $7B46: $13
    ld   [hl+], a                                 ; $7B47: $22
    ld   a, [de]                                  ; $7B48: $1A
    inc  de                                       ; $7B49: $13
    ld   [hl+], a                                 ; $7B4A: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $7B4B: $F0 $CF
    ld   [hl+], a                                 ; $7B4D: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $7B4E: $F0 $D0
    inc  a                                        ; $7B50: $3C
    ld   [hl+], a                                 ; $7B51: $22
    ld   a, $81                                   ; $7B52: $3E $81
    ld   [hl+], a                                 ; $7B54: $22
    ld   a, [de]                                  ; $7B55: $1A
    inc  de                                       ; $7B56: $13
    ld   [hl+], a                                 ; $7B57: $22
    ld   a, [de]                                  ; $7B58: $1A
    ld   [hl+], a                                 ; $7B59: $22
    xor  a                                        ; $7B5A: $AF
    ld   [hl], a                                  ; $7B5B: $77
    ret                                           ; $7B5C: $C9
