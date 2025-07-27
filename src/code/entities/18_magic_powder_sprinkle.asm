Data_018_795E::
    db   $6C, $74, $6D, $75

Data_018_7962::
    db   $64, $74, $65, $75

MagicPowderSprinkleEntityHandler::
    call func_018_7B02                            ;; 18:7966 $CD $02 $7B
    call ReturnIfNonInteractive_18                ;; 18:7969 $CD $E8 $7D
    ldh  a, [hActiveEntityState]                  ;; 18:796C $F0 $F0
    and  a                                        ;; 18:796E $A7
    jp   nz, label_018_7A5D                       ;; 18:796F $C2 $5D $7A

    call GetEntityTransitionCountdown             ;; 18:7972 $CD $05 $0C
    jp   z, label_018_7A48                        ;; 18:7975 $CA $48 $7A

    cp   $07                                      ;; 18:7978 $FE $07
    jp   nz, label_018_7A4B                       ;; 18:797A $C2 $4B $7A

    push bc                                       ;; 18:797D $C5
    ld   hl, wEntitiesPosXTable                   ;; 18:797E $21 $00 $C2
    add  hl, bc                                   ;; 18:7981 $09
    ld   a, [hl]                                  ;; 18:7982 $7E
    add  $07                                      ;; 18:7983 $C6 $07
    sub  $08                                      ;; 18:7985 $D6 $08
    and  $F0                                      ;; 18:7987 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 18:7989 $E0 $CE
    swap a                                        ;; 18:798B $CB $37
    ld   hl, wEntitiesPosYTable                   ;; 18:798D $21 $10 $C2
    add  hl, bc                                   ;; 18:7990 $09
    ld   c, a                                     ;; 18:7991 $4F
    ld   a, [hl]                                  ;; 18:7992 $7E
    add  $07                                      ;; 18:7993 $C6 $07
    sub  $10                                      ;; 18:7995 $D6 $10
    and  $F0                                      ;; 18:7997 $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 18:7999 $E0 $CD
    or   c                                        ;; 18:799B $B1
    ld   c, a                                     ;; 18:799C $4F
    ld   b, $00                                   ;; 18:799D $06 $00
    ld   hl, wRoomObjects                         ;; 18:799F $21 $11 $D7
    ld   a, h                                     ;; 18:79A2 $7C
    add  hl, bc                                   ;; 18:79A3 $09
    ld   e, c                                     ;; 18:79A4 $59
    ld   d, b                                     ;; 18:79A5 $50
    ld   h, a                                     ;; 18:79A6 $67
    pop  bc                                       ;; 18:79A7 $C1
    ld   a, [hl]                                  ;; 18:79A8 $7E
    ldh  [hObjectUnderEntity], a                  ;; 18:79A9 $E0 $AF
    cp   $D3                                      ;; 18:79AB $FE $D3
    jr   z, .jr_79B3                              ;; 18:79AD $28 $04

    cp   $5C                                      ;; 18:79AF $FE $5C
    jr   nz, jr_018_79CF                          ;; 18:79B1 $20 $1C

.jr_79B3
    ld   a, [wIsIndoor]                           ;; 18:79B3 $FA $A5 $DB
    and  a                                        ;; 18:79B6 $A7
    jr   nz, jr_018_79CF                          ;; 18:79B7 $20 $16

    call func_014_5526_trampoline                 ;; 18:79B9 $CD $78 $21
    ldh  a, [hActiveEntityPosX]                   ;; 18:79BC $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 18:79BE $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:79C0 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 18:79C2 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 18:79C4 $3E $02
    call AddTranscientVfx                         ;; 18:79C6 $CD $C7 $0C
    ld   a, JINGLE_POOF                           ;; 18:79C9 $3E $2F
    ldh  [hJingle], a                             ;; 18:79CB $E0 $F2
    jr   label_018_7A48                           ;; 18:79CD $18 $79

jr_018_79CF:
    ld   a, [wIsIndoor]                           ;; 18:79CF $FA $A5 $DB
    and  a                                        ;; 18:79D2 $A7
    jp   z, label_018_7A4B                        ;; 18:79D3 $CA $4B $7A

    ldh  a, [hObjectUnderEntity]                  ;; 18:79D6 $F0 $AF
    cp   $AB                                      ;; 18:79D8 $FE $AB
    ret  nz                                       ;; 18:79DA $C0

    ldh  a, [hIsGBC]                              ;; 18:79DB $F0 $FE
    and  a                                        ;; 18:79DD $A7
    jr   z, .jr_79F0                              ;; 18:79DE $28 $10

    ld   a, [wLinkMotionState]                    ;; 18:79E0 $FA $1C $C1
    cp   LINK_MOTION_REVOLVING_DOOR               ;; 18:79E3 $FE $05
    ret  z                                        ;; 18:79E5 $C8

    ld   a, [wBGPaletteTransitionEffect]          ;; 18:79E6 $FA $D6 $DD
    and  a                                        ;; 18:79E9 $A7
    ret  nz                                       ;; 18:79EA $C0

    ld   a, [wRoomTransitionState]                ;; 18:79EB $FA $24 $C1
    and  a                                        ;; 18:79EE $A7
    ret  nz                                       ;; 18:79EF $C0

.jr_79F0
    ld   a, $AC                                   ;; 18:79F0 $3E $AC
    ld   [hl], a                                  ;; 18:79F2 $77
    ld   [wDDD8], a                               ;; 18:79F3 $EA $D8 $DD
    ld   d, h                                     ;; 18:79F6 $54
    ld   e, l                                     ;; 18:79F7 $5D
    ld   hl, wEntitiesPrivateState1Table          ;; 18:79F8 $21 $B0 $C2
    add  hl, bc                                   ;; 18:79FB $09
    ld   [hl], d                                  ;; 18:79FC $72
    ld   hl, wEntitiesPrivateState2Table          ;; 18:79FD $21 $C0 $C2
    add  hl, bc                                   ;; 18:7A00 $09
    ld   [hl], e                                  ;; 18:7A01 $73
    ld   hl, wEntitiesStateTable                  ;; 18:7A02 $21 $90 $C2
    add  hl, bc                                   ;; 18:7A05 $09
    ld   [hl], $01                                ;; 18:7A06 $36 $01
    call GetEntitySlowTransitionCountdown         ;; 18:7A08 $CD $FB $0B
    ld   [hl], $80                                ;; 18:7A0B $36 $80
    ld   hl, wEntitiesPosXTable                   ;; 18:7A0D $21 $00 $C2
    add  hl, bc                                   ;; 18:7A10 $09
    ldh  a, [hIntersectedObjectLeft]              ;; 18:7A11 $F0 $CE
    ld   [hl], a                                  ;; 18:7A13 $77
    ld   hl, wEntitiesPosYTable                   ;; 18:7A14 $21 $10 $C2
    add  hl, bc                                   ;; 18:7A17 $09
    ldh  a, [hIntersectedObjectTop]               ;; 18:7A18 $F0 $CD
    ld   [hl], a                                  ;; 18:7A1A $77
    ld   hl, wC1A2                                ;; 18:7A1B $21 $A2 $C1
    inc  [hl]                                     ;; 18:7A1E $34
    ld   a, [wC3CD]                               ;; 18:7A1F $FA $CD $C3
    and  a                                        ;; 18:7A22 $A7
    jr   z, .jr_7A39                              ;; 18:7A23 $28 $14

    sub  $04                                      ;; 18:7A25 $D6 $04
    ld   [wC3CD], a                               ;; 18:7A27 $EA $CD $C3
    ldh  a, [hIsGBC]                              ;; 18:7A2A $F0 $FE
    and  a                                        ;; 18:7A2C $A7
    jr   z, .jr_7A39                              ;; 18:7A2D $28 $0A

    ld   a, $40                                   ;; 18:7A2F $3E $40
    ld   [wBGPaletteTransitionEffect], a          ;; 18:7A31 $EA $D6 $DD
    ld   a, $0B                                   ;; 18:7A34 $3E $0B
    ld   [wDDD7], a                               ;; 18:7A36 $EA $D7 $DD

.jr_7A39
    call GetEntityTransitionCountdown             ;; 18:7A39 $CD $05 $0C
    ld   [hl], b                                  ;; 18:7A3C $70
    ld   a, NOISE_SFX_BURSTING_FLAME              ;; 18:7A3D $3E $12
    ldh  [hNoiseSfx], a                           ;; 18:7A3F $E0 $F4
    ld   de, Data_018_795E                        ;; 18:7A41 $11 $5E $79
    push de                                       ;; 18:7A44 $D5
    jp   label_018_7B1D                           ;; 18:7A45 $C3 $1D $7B

label_018_7A48:
    jp   ClearEntityStatusBank18                  ;; 18:7A48 $C3 $08 $7F

label_018_7A4B:
    cp   $10                                      ;; 18:7A4B $FE $10
    ret  nc                                       ;; 18:7A4D $D0

    ld   hl, wEntitiesPrivateState4Table          ;; 18:7A4E $21 $40 $C4
    add  hl, bc                                   ;; 18:7A51 $09
    ld   a, [hl]                                  ;; 18:7A52 $7E
    and  a                                        ;; 18:7A53 $A7
    ret  nz                                       ;; 18:7A54 $C0

    ld   a, $09                                   ;; 18:7A55 $3E $09
    ld   [wC19E], a                               ;; 18:7A57 $EA $9E $C1
    jp   label_3B7B                               ;; 18:7A5A $C3 $7B $3B

label_018_7A5D:
    call GetEntitySlowTransitionCountdown         ;; 18:7A5D $CD $FB $0B
    jr   nz, ret_018_7AB9                         ;; 18:7A60 $20 $57

    ld   hl, wEntitiesPosXTable                   ;; 18:7A62 $21 $00 $C2
    add  hl, bc                                   ;; 18:7A65 $09
    ld   a, [hl]                                  ;; 18:7A66 $7E
    ldh  [hIntersectedObjectLeft], a              ;; 18:7A67 $E0 $CE
    ld   hl, wEntitiesPosYTable                   ;; 18:7A69 $21 $10 $C2
    add  hl, bc                                   ;; 18:7A6C $09
    ld   a, [hl]                                  ;; 18:7A6D $7E
    ldh  [hIntersectedObjectTop], a               ;; 18:7A6E $E0 $CD
    ld   hl, wEntitiesPrivateState1Table          ;; 18:7A70 $21 $B0 $C2
    add  hl, bc                                   ;; 18:7A73 $09
    ld   d, [hl]                                  ;; 18:7A74 $56
    ld   hl, wEntitiesPrivateState2Table          ;; 18:7A75 $21 $C0 $C2
    add  hl, bc                                   ;; 18:7A78 $09
    ld   e, [hl]                                  ;; 18:7A79 $5E
    ld   a, $AB                                   ;; 18:7A7A $3E $AB
    ld   [de], a                                  ;; 18:7A7C $12
    ld   [wDDD8], a                               ;; 18:7A7D $EA $D8 $DD
    call ClearEntityStatusBank18                  ;; 18:7A80 $CD $08 $7F
    ldh  a, [hMapRoom]                            ;; 18:7A83 $F0 $F6
    cp   UNKNOWN_ROOM_74                          ;; 18:7A85 $FE $74
    ret  z                                        ;; 18:7A87 $C8

    ld   hl, wC1A2                                ;; 18:7A88 $21 $A2 $C1
    dec  [hl]                                     ;; 18:7A8B $35
    ld   a, [wC3CD]                               ;; 18:7A8C $FA $CD $C3
    cp   $0C                                      ;; 18:7A8F $FE $0C
    jr   nc, .jr_7AB2                             ;; 18:7A91 $30 $1F

    add  $04                                      ;; 18:7A93 $C6 $04
    ld   [wC3CD], a                               ;; 18:7A95 $EA $CD $C3
    ldh  a, [hIsGBC]                              ;; 18:7A98 $F0 $FE
    and  a                                        ;; 18:7A9A $A7
    jr   z, .jr_7AB2                              ;; 18:7A9B $28 $15

    ld   a, [wLinkMotionState]                    ;; 18:7A9D $FA $1C $C1
    cp   $05                                      ;; 18:7AA0 $FE $05
    ret  z                                        ;; 18:7AA2 $C8

    ld   a, [wRoomTransitionState]                ;; 18:7AA3 $FA $24 $C1
    and  a                                        ;; 18:7AA6 $A7
    ret  nz                                       ;; 18:7AA7 $C0

    ld   a, $80                                   ;; 18:7AA8 $3E $80
    ld   [wBGPaletteTransitionEffect], a          ;; 18:7AAA $EA $D6 $DD
    ld   a, $0B                                   ;; 18:7AAD $3E $0B
    ld   [wDDD7], a                               ;; 18:7AAF $EA $D7 $DD

.jr_7AB2
    ld   de, Data_018_7962                        ;; 18:7AB2 $11 $62 $79
    push de                                       ;; 18:7AB5 $D5
    jp   label_018_7B1D                           ;; 18:7AB6 $C3 $1D $7B

ret_018_7AB9:
    ret                                           ;; 18:7AB9 $C9

Data_018_7ABA::
    db   $06, $FE, $24, $03, $03, $04, $24, $13, $05, $0A, $24, $03, $05, $FE, $24, $13
    db   $02, $04, $24, $03, $04, $0A, $24, $13, $03, $FF, $24, $03, $01, $04, $24, $13
    db   $02, $09, $24, $03, $01, $00, $24, $13, $FF, $04, $24, $03, $00, $06, $24, $13
    db   $00, $01, $24, $03, $FE, $03, $24, $13, $FF, $05, $24, $03, $FF, $01, $24, $13
    db   $FD, $03, $24, $03, $FE, $05, $24, $13

func_018_7B02::
    call GetEntityTransitionCountdown             ;; 18:7B02 $CD $05 $0C
    ret  z                                        ;; 18:7B05 $C8

    rra                                           ;; 18:7B06 $1F
    rra                                           ;; 18:7B07 $1F
    and  $07                                      ;; 18:7B08 $E6 $07
    sla  a                                        ;; 18:7B0A $CB $27
    sla  a                                        ;; 18:7B0C $CB $27
    ld   e, a                                     ;; 18:7B0E $5F
    sla  a                                        ;; 18:7B0F $CB $27
    add  e                                        ;; 18:7B11 $83
    ld   e, a                                     ;; 18:7B12 $5F
    ld   d, b                                     ;; 18:7B13 $50
    ld   hl, Data_018_7ABA                        ;; 18:7B14 $21 $BA $7A
    add  hl, de                                   ;; 18:7B17 $19
    ld   c, $03                                   ;; 18:7B18 $0E $03
    jp   RenderActiveEntitySpritesRect            ;; 18:7B1A $C3 $E6 $3C

label_018_7B1D:
    call label_2887                               ;; 18:7B1D $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 18:7B20 $F0 $FE
    and  a                                        ;; 18:7B22 $A7
    jr   z, .jr_7B2C                              ;; 18:7B23 $28 $07

    push bc                                       ;; 18:7B25 $C5
    ld   a, $18                                   ;; 18:7B26 $3E $18
    call func_91D                                 ;; 18:7B28 $CD $1D $09
    pop  bc                                       ;; 18:7B2B $C1

.jr_7B2C
    ld   a, [wDrawCommandsSize]                   ;; 18:7B2C $FA $00 $D6
    ld   e, a                                     ;; 18:7B2F $5F
    ld   d, $00                                   ;; 18:7B30 $16 $00
    ld   hl, wDrawCommand                         ;; 18:7B32 $21 $01 $D6
    add  hl, de                                   ;; 18:7B35 $19
    add  $0A                                      ;; 18:7B36 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 18:7B38 $EA $00 $D6
    pop  de                                       ;; 18:7B3B $D1
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 18:7B3C $F0 $CF
    ld   [hl+], a                                 ;; 18:7B3E $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:7B3F $F0 $D0
    ld   [hl+], a                                 ;; 18:7B41 $22
    ld   a, $81                                   ;; 18:7B42 $3E $81
    ld   [hl+], a                                 ;; 18:7B44 $22
    ld   a, [de]                                  ;; 18:7B45 $1A
    inc  de                                       ;; 18:7B46 $13
    ld   [hl+], a                                 ;; 18:7B47 $22
    ld   a, [de]                                  ;; 18:7B48 $1A
    inc  de                                       ;; 18:7B49 $13
    ld   [hl+], a                                 ;; 18:7B4A $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 18:7B4B $F0 $CF
    ld   [hl+], a                                 ;; 18:7B4D $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:7B4E $F0 $D0
    inc  a                                        ;; 18:7B50 $3C
    ld   [hl+], a                                 ;; 18:7B51 $22
    ld   a, $81                                   ;; 18:7B52 $3E $81
    ld   [hl+], a                                 ;; 18:7B54 $22
    ld   a, [de]                                  ;; 18:7B55 $1A
    inc  de                                       ;; 18:7B56 $13
    ld   [hl+], a                                 ;; 18:7B57 $22
    ld   a, [de]                                  ;; 18:7B58 $1A
    ld   [hl+], a                                 ;; 18:7B59 $22
    xor  a                                        ;; 18:7B5A $AF
    ld   [hl], a                                  ;; 18:7B5B $77
    ret                                           ;; 18:7B5C $C9
