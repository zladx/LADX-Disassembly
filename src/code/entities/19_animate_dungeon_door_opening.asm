
Data_019_60B4::
    db   $98, $06, $89, $00, $04, $00, $04, $00   ; $60B4
    db   $04, $00, $04, $00, $10, $98, $07, $89   ; $60BC
    db   $01, $11, $01, $11, $01, $11, $01, $11   ; $60C4
    db   $01, $11, $98, $08, $89, $07, $06, $07   ; $60CC
    db   $06, $07, $06, $07, $06, $07, $06, $98   ; $60D4
    db   $08, $89, $07, $06, $07, $06, $07, $06   ; $60DC
    db   $07, $06, $07, $06                       ; $60E4

Data_019_60E8::
    db   $98, $09, $89, $06, $07, $06, $07, $06   ; $60E8
    db   $07, $06, $07, $06, $07, $98, $0A, $89   ; $60F0
    db   $07, $06, $07, $06, $07, $06, $07, $06   ; $60F8
    db   $07, $06, $98, $0B, $89, $06, $07, $06   ; $6100
    db   $07, $06, $07, $06, $07, $06, $07, $98   ; $6108
    db   $0B, $89, $06, $07, $06, $07, $06, $07   ; $6110
    db   $06, $07, $06, $07                       ; $6118

Data_019_611C::
    db   $98, $0C, $89, $07, $06, $07, $06, $07   ; $611C
    db   $06, $07, $06, $07, $06, $98, $0D, $89   ; $6124
    db   $06, $07, $06, $07, $06, $07, $06, $07   ; $612C
    db   $06, $07, $98, $0E, $89, $02, $12, $02   ; $6134
    db   $12, $02, $12, $02, $12, $02, $12, $98   ; $613C
    db   $0F, $89, $03, $05, $03, $05, $03, $05   ; $6144
    db   $03, $05, $03, $13                       ; $614C

Data_019_6150::
    db   $98, $06, $89, $04, $00, $04, $00, $04   ; $6150
    db   $00, $04, $00, $04, $14, $98, $07, $89   ; $6158
    db   $11, $01, $11, $01, $11, $01, $11, $01   ; $6160
    db   $11, $01, $98, $08, $89, $06, $07, $06   ; $6168
    db   $07, $06, $07, $06, $07, $06, $07, $98   ; $6170
    db   $08, $89, $06, $07, $06, $07, $06, $07   ; $6178
    db   $06, $07, $06, $07                       ; $6180

Data_019_6184::
    db   $98, $09, $89, $07, $06, $07, $06, $07   ; $6184
    db   $06, $07, $06, $07, $06, $98, $0A, $89   ; $618C
    db   $06, $07, $06, $07, $06, $07, $06, $07   ; $6194
    db   $06, $07, $98, $0B, $89, $07, $06, $07   ; $619C
    db   $06, $07, $06, $07, $06, $07, $06, $98   ; $61A4
    db   $0B, $89, $07, $06, $07, $06, $07, $06   ; $61AC
    db   $07, $06, $07, $06                       ; $61B4

Data_019_61B8::
    db   $98, $0C, $89, $06, $07, $06, $07, $06   ; $61B8
    db   $07, $06, $07, $06, $07, $98, $0D, $89   ; $61C0
    db   $07, $06, $07, $06, $07, $06, $07, $06   ; $61C8
    db   $07, $06, $98, $0E, $89, $12, $02, $12   ; $61D0
    db   $02, $12, $02, $12, $02, $12, $02, $98   ; $61D8
    db   $0F, $89, $05, $03, $05, $03, $05, $03   ; $61E0
    db   $05, $03, $05, $15                       ; $61E8

Data_019_61EC::
    dw   Data_019_6150
    dw   Data_019_60B4

Data_019_61F0::
    dw   Data_019_6184
    dw   Data_019_60E8

Data_019_61F4::
    dw   Data_019_61B8
    dw   Data_019_611C

AnimateEaglesTowerOpening:
    ld   a, $02                                   ; $61F8: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $61FA: $E0 $A1
    ld   [wC167], a                               ; $61FC: $EA $67 $C1
    call func_019_650F                            ; $61FF: $CD $0F $65
    ldh  a, [hActiveEntityState]                  ; $6202: $F0 $F0
    JP_TABLE                                      ; $6204
._00 dw EaglesTowerOpeningState0Handler
._01 dw EaglesTowerOpeningState1Handler
._02 dw EaglesTowerOpeningState2Handler
._03 dw EaglesTowerOpeningState3Handler
._04 dw EaglesTowerOpeningState4Handler
._05 dw EaglesTowerOpeningState5Handler
._06 dw EaglesTowerOpeningState6Handler

EaglesTowerOpeningState0Handler::
    call label_27F2                               ; $6213: $CD $F2 $27
    call GetEntityTransitionCountdown             ; $6216: $CD $05 $0C
    ld   [hl], $FF                                ; $6219: $36 $FF
    call IncrementEntityState                     ; $621B: $CD $12 $3B

EaglesTowerOpeningState1Handler::
    call GetEntityTransitionCountdown             ; $621E: $CD $05 $0C
    jr   nz, .jr_6230                             ; $6221: $20 $0D

    ld   [wScreenShakeHorizontal], a              ; $6223: $EA $55 $C1
    call SetEntitySpriteVariant                   ; $6226: $CD $0C $3B
    ld   a, JINGLE_EAGLES_TOWER_ROTATE            ; $6229: $3E $2E
    ldh  [hJingle], a                             ; $622B: $E0 $F2
    jp   IncrementEntityState                     ; $622D: $C3 $12 $3B

.jr_6230
    cp   $A0                                      ; $6230: $FE $A0
    jr   nz, .jr_6238                             ; $6232: $20 $04

    ld   a, NOISE_SFX_OPEN_D4_D7                  ; $6234: $3E $1D
    ldh  [hNoiseSfx], a                           ; $6236: $E0 $F4

.jr_6238
    jr   c, jr_019_6245                           ; $6238: $38 $0B

    and  $10                                      ; $623A: $E6 $10
    ld   a, $00                                   ; $623C: $3E $00
    jr   z, .jr_6242                              ; $623E: $28 $02

    ld   a, $FF                                   ; $6240: $3E $FF

.jr_6242
    jp   SetEntitySpriteVariant                   ; $6242: $C3 $0C $3B

jr_019_6245:
    ld   e, $01                                   ; $6245: $1E $01
    and  $04                                      ; $6247: $E6 $04
    jr   z, .jr_624D                              ; $6249: $28 $02

    ld   e, $FE                                   ; $624B: $1E $FE

.jr_624D
    ld   a, e                                     ; $624D: $7B
    ld   [wScreenShakeHorizontal], a              ; $624E: $EA $55 $C1
    ret                                           ; $6251: $C9

EaglesTowerOpeningState2Handler::
    call GetEntityTransitionCountdown             ; $6252: $CD $05 $0C
    and  a                                        ; $6255: $A7
    ret  nz                                       ; $6256: $C0

    jp   IncrementEntityState                     ; $6257: $C3 $12 $3B

EaglesTowerOpeningState3Handler::
    ld   hl, Data_019_61EC                        ; $625A: $21 $EC $61
    jr   func_019_6262                            ; $625D: $18 $03

EaglesTowerOpeningState4Handler::
    ld   hl, Data_019_61F0                        ; $625F: $21 $F0 $61

func_019_6262::
    push bc                                       ; $6262: $C5
    push hl                                       ; $6263: $E5
    ld   hl, wEntitiesPrivateState1Table          ; $6264: $21 $B0 $C2
    add  hl, bc                                   ; $6267: $09
    ld   a, [hl]                                  ; $6268: $7E
    rla                                           ; $6269: $17
    and  $02                                      ; $626A: $E6 $02
    ld   e, a                                     ; $626C: $5F
    ld   d, b                                     ; $626D: $50
    pop  hl                                       ; $626E: $E1
    add  hl, de                                   ; $626F: $19
    ld   a, [hl+]                                 ; $6270: $2A
    ld   d, [hl]                                  ; $6271: $56
    ld   e, a                                     ; $6272: $5F
    ld   c, $34                                   ; $6273: $0E $34
    ld   hl, wDrawCommand                         ; $6275: $21 $01 $D6

jr_019_6278:
    dec  de                                       ; $6278: $1B
    ld   a, [de]                                  ; $6279: $1A
    inc  de                                       ; $627A: $13
    cp   $98                                      ; $627B: $FE $98
    ld   a, [de]                                  ; $627D: $1A
    jr   nz, .jr_6288                             ; $627E: $20 $08

    ldh  a, [hBaseScrollX]                        ; $6280: $F0 $96
    and  a                                        ; $6282: $A7
    ld   a, [de]                                  ; $6283: $1A
    jr   z, .jr_6288                              ; $6284: $28 $02

    add  $0C                                      ; $6286: $C6 $0C

.jr_6288
    inc  de                                       ; $6288: $13
    ld   [hl+], a                                 ; $6289: $22
    dec  c                                        ; $628A: $0D
    jr   nz, jr_019_6278                          ; $628B: $20 $EB

    ld   [hl], $00                                ; $628D: $36 $00
    pop  bc                                       ; $628F: $C1
    jp   IncrementEntityState                     ; $6290: $C3 $12 $3B

EaglesTowerOpeningState5Handler::
    ld   hl, Data_019_61F4                        ; $6293: $21 $F4 $61
    call func_019_6262                            ; $6296: $CD $62 $62
    call GetEntityTransitionCountdown             ; $6299: $CD $05 $0C
    ld   [hl], $18                                ; $629C: $36 $18
    ld   hl, wEntitiesPrivateState1Table          ; $629E: $21 $B0 $C2
    add  hl, bc                                   ; $62A1: $09
    inc  [hl]                                     ; $62A2: $34
    ld   hl, wEntitiesInertiaTable                ; $62A3: $21 $D0 $C3
    add  hl, bc                                   ; $62A6: $09
    ld   a, [hl]                                  ; $62A7: $7E
    inc  a                                        ; $62A8: $3C
    ld   [hl], a                                  ; $62A9: $77
    cp   $0C                                      ; $62AA: $FE $0C
    jr   nz, .jr_62B4                             ; $62AC: $20 $06

    ldh  a, [hNextDefaultMusicTrack]              ; $62AE: $F0 $BF
    ld   [wMusicTrackToPlay], a                   ; $62B0: $EA $68 $D3
    ret                                           ; $62B3: $C9

.jr_62B4
    call IncrementEntityState                     ; $62B4: $CD $12 $3B
    ld   [hl], $02                                ; $62B7: $36 $02
    ret                                           ; $62B9: $C9

EaglesTowerOpeningState6Handler::
    call func_019_7F0E                            ; $62BA: $CD $0E $7F
    set  4, [hl]                                  ; $62BD: $CB $E6
    xor  a                                        ; $62BF: $AF
    ld   [wScreenShakeHorizontal], a              ; $62C0: $EA $55 $C1
    ld   [wC167], a                               ; $62C3: $EA $67 $C1
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $62C6: $3E $02
    ldh  [hJingle], a                             ; $62C8: $E0 $F2
    ld   hl, wRoomObjects + $25                   ; $62CA: $21 $36 $D7
    ld   a, $E1                                   ; $62CD: $3E $E1
    ld   [hl], a                                  ; $62CF: $77
    ld   a, $99                                   ; $62D0: $3E $99
    call BackupObjectInRAM2                       ; $62D2: $CD $2F $0B
    ld   hl, wRoomObjects + $35                   ; $62D5: $21 $46 $D7
    ld   a, $77                                   ; $62D8: $3E $77
    ld   [hl], a                                  ; $62DA: $77
    ld   a, $99                                   ; $62DB: $3E $99
    call BackupObjectInRAM2                       ; $62DD: $CD $2F $0B
    ld   hl, wRoomObjects + $45                   ; $62E0: $21 $56 $D7
    ld   a, $77                                   ; $62E3: $3E $77
    ld   [hl], a                                  ; $62E5: $77
    ld   a, $99                                   ; $62E6: $3E $99
    call BackupObjectInRAM2                       ; $62E8: $CD $2F $0B
    call func_019_6374                            ; $62EB: $CD $74 $63
    call func_019_63B5                            ; $62EE: $CD $B5 $63
    jp   ClearEntityStatus_19                     ; $62F1: $C3 $61 $7E

Data_019_62F4::
    db   $98, $4A, $87, $0C, $1C, $64, $66, $0F, $0F, $0F, $0F, $98, $4B, $87, $0D, $1D
    db   $65, $67, $1F, $1F, $1F, $1F, $98, $49, $81, $0B, $1B, $98, $4C, $81, $0E, $1E

Data_019_6314::
    db   $98, $56, $87, $0C, $1C, $64, $66, $0F, $0F, $0F, $0F, $98, $57, $87, $0D, $1D
    db   $65, $67, $1F, $1F, $1F, $1F, $98, $55, $81, $0B, $1B, $98, $58, $81, $0E, $1E

Data_019_6334::
    db   $98, $4A, $87, $0C, $1C, $64, $66, $0F, $0F, $0F, $0F, $98, $4B, $87, $0D, $1D
    db   $64, $66, $1F, $1F, $1F, $1F, $98, $49, $81, $0B, $1B, $98, $4C, $81, $0E, $1E

Data_019_6354::
    db   $98, $56, $87, $0C, $1C, $64, $66, $0F, $0F, $0F, $0F, $98, $57, $87, $0D, $1D
    db   $64, $66, $1F, $1F, $1F, $1F, $98, $55, $81, $0B, $1B, $98, $58, $81, $0E, $1E

func_019_6374::
    ld   a, $20                                   ; $6374: $3E $20
    ld   [wDrawCommandsSize], a                   ; $6376: $EA $00 $D6
    ld   hl, wDrawCommand                         ; $6379: $21 $01 $D6
    ld   de, Data_019_62F4                        ; $637C: $11 $F4 $62
    ldh  a, [hIsGBC]                              ; $637F: $F0 $FE
    and  a                                        ; $6381: $A7
    jr   z, .jr_6387                              ; $6382: $28 $03

    ld   de, Data_019_6334                        ; $6384: $11 $34 $63

.jr_6387
    ldh  a, [hBaseScrollX]                        ; $6387: $F0 $96
    and  a                                        ; $6389: $A7
    jr   z, .jr_6397                              ; $638A: $28 $0B

    ld   de, Data_019_6314                        ; $638C: $11 $14 $63
    ldh  a, [hIsGBC]                              ; $638F: $F0 $FE
    and  a                                        ; $6391: $A7
    jr   z, .jr_6397                              ; $6392: $28 $03

    ld   de, Data_019_6354                        ; $6394: $11 $54 $63

.jr_6397
    push bc                                       ; $6397: $C5
    ld   c, $20                                   ; $6398: $0E $20

.loop_639A
    ld   a, [de]                                  ; $639A: $1A
    inc  de                                       ; $639B: $13
    ld   [hl+], a                                 ; $639C: $22
    dec  c                                        ; $639D: $0D
    jr   nz, .loop_639A                           ; $639E: $20 $FA

    pop  bc                                       ; $63A0: $C1
    ld   [hl], b                                  ; $63A1: $70
    ret                                           ; $63A2: $C9

Data_019_63A3::
    db   $98, $8B, $85, $26, $26, $01, $01, $01, $01

Data_019_63AC::
    db   $98, $97, $85, $26, $26, $01, $01, $01, $01

func_019_63B5::
    ldh  a, [hIsGBC]                              ; $63B5: $F0 $FE
    and  a                                        ; $63B7: $A7
    jr   z, ret_019_63D8                          ; $63B8: $28 $1E

    ld   a, $05                                   ; $63BA: $3E $05
    ld   [wDrawCommandsAltSize], a                ; $63BC: $EA $90 $DC
    ld   hl, wDrawCommandAlt                      ; $63BF: $21 $91 $DC
    ld   de, Data_019_63A3                        ; $63C2: $11 $A3 $63
    ldh  a, [hBaseScrollX]                        ; $63C5: $F0 $96
    and  a                                        ; $63C7: $A7
    jr   z, .jr_63CD                              ; $63C8: $28 $03

    ld   de, Data_019_63AC                        ; $63CA: $11 $AC $63

.jr_63CD
    push bc                                       ; $63CD: $C5
    ld   c, $09                                   ; $63CE: $0E $09

.loop_63D0
    ld   a, [de]                                  ; $63D0: $1A
    inc  de                                       ; $63D1: $13
    ld   [hl+], a                                 ; $63D2: $22
    dec  c                                        ; $63D3: $0D
    jr   nz, .loop_63D0                           ; $63D4: $20 $FA

    pop  bc                                       ; $63D6: $C1
    ld   [hl], b                                  ; $63D7: $70

ret_019_63D8:
    ret                                           ; $63D8: $C9

Data_019_63D9::
    db   $50, $5C, $68, $70, $7A, $7E, $58, $32, $38, $38, $40, $44, $50

Data_019_63E6::
    db   $20, $20, $20, $20, $20, $1F, $1E, $1F, $20, $20, $20, $20, $20

Data_019_63F3::
    db   $03, $03, $04, $04, $05, $05, $06, $01, $01, $02, $02, $03, $03

Data_019_6400::
    db   $C0, $C0, $C0, $C0, $C0, $C0, $C0, $38, $3A, $3B, $44, $4C, $58

Data_019_640D::
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $2F, $30, $30, $30, $30, $30

Data_019_641A::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $04

Data_019_6427::
    db   $00, $00, $70, $06, $00, $00, $FF, $06, $00, $00, $FF, $06, $00, $00, $FF, $06
    db   $00, $00, $72, $06, $00, $08, $74, $06, $00, $00, $FF, $06, $00, $00, $FF, $06
    db   $00, $00, $76, $06, $00, $08, $78, $06, $00, $10, $7A, $06, $00, $00, $FF, $06
    db   $00, $00, $7C, $06, $00, $08, $7E, $06, $00, $10, $7E, $26, $00, $18, $7C, $26
    db   $00, $00, $7A, $26, $00, $08, $78, $26, $00, $10, $76, $26, $00, $00, $FF, $06
    db   $00, $00, $74, $26, $00, $08, $72, $26, $00, $00, $FF, $06, $00, $00, $FF, $06
    db   $00, $30, $70, $26, $00, $D8, $70, $06, $00, $00, $FF, $06, $00, $00, $FF, $06

Data_019_6497::
    db   $00, $00, $60, $15, $10, $00, $62, $06, $20, $00, $62, $06, $00, $00, $FF, $00
    db   $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $64, $15, $10, $00, $66, $06
    db   $20, $00, $66, $06, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $00, $02, $68, $15, $10, $02, $6A, $06, $20, $02, $6A, $06, $00, $05, $68, $35
    db   $10, $05, $6A, $26, $20, $05, $6A, $26, $00, $01, $68, $15, $10, $01, $6A, $06
    db   $20, $01, $6A, $06, $00, $07, $68, $35, $10, $07, $6A, $26, $20, $07, $6A, $26
    db   $00, $00, $68, $15, $10, $00, $6A, $06, $20, $00, $6A, $06, $00, $08, $68, $35
    db   $10, $08, $6A, $26, $20, $08, $6A, $26

func_019_650F::
    ld   hl, wEntitiesInertiaTable                ; $650F: $21 $D0 $C3
    add  hl, bc                                   ; $6512: $09
    ld   e, [hl]                                  ; $6513: $5E
    ld   d, b                                     ; $6514: $50

.jr_6515
    ld   hl, Data_019_63D9                        ; $6515: $21 $D9 $63
    add  hl, de                                   ; $6518: $19
    ld   a, [hl]                                  ; $6519: $7E
    ldh  [hActiveEntityPosX], a                   ; $651A: $E0 $EE
    ld   hl, Data_019_63E6                        ; $651C: $21 $E6 $63
    add  hl, de                                   ; $651F: $19
    ld   a, [hl]                                  ; $6520: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $6521: $E0 $EC
    ld   hl, Data_019_63F3                        ; $6523: $21 $F3 $63
    add  hl, de                                   ; $6526: $19
    ld   a, [hl]                                  ; $6527: $7E
    rla                                           ; $6528: $17
    rla                                           ; $6529: $17
    rla                                           ; $652A: $17
    rla                                           ; $652B: $17
    and  $F0                                      ; $652C: $E6 $F0
    ld   e, a                                     ; $652E: $5F
    ld   d, b                                     ; $652F: $50
    ld   hl, Data_019_6427                        ; $6530: $21 $27 $64
    add  hl, de                                   ; $6533: $19
    ld   c, $04                                   ; $6534: $0E $04
    call RenderActiveEntitySpritesRect            ; $6536: $CD $E6 $3C
    ld   a, $02                                   ; $6539: $3E $02
    call func_015_7964_trampoline                 ; $653B: $CD $A0 $3D
    ld   hl, wEntitiesInertiaTable                ; $653E: $21 $D0 $C3
    add  hl, bc                                   ; $6541: $09
    ld   e, [hl]                                  ; $6542: $5E
    ld   d, b                                     ; $6543: $50
    ld   hl, Data_019_6400                        ; $6544: $21 $00 $64
    add  hl, de                                   ; $6547: $19
    ld   a, [hl]                                  ; $6548: $7E
    ldh  [hActiveEntityPosX], a                   ; $6549: $E0 $EE
    ld   hl, Data_019_640D                        ; $654B: $21 $0D $64
    add  hl, de                                   ; $654E: $19
    ld   a, [hl]                                  ; $654F: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $6550: $E0 $EC
    ld   hl, Data_019_641A                        ; $6552: $21 $1A $64
    add  hl, de                                   ; $6555: $19
    ld   a, [hl]                                  ; $6556: $7E
    rla                                           ; $6557: $17
    rla                                           ; $6558: $17
    rla                                           ; $6559: $17
    and  $F8                                      ; $655A: $E6 $F8
    ld   e, a                                     ; $655C: $5F
    rla                                           ; $655D: $17
    and  $F0                                      ; $655E: $E6 $F0
    add  e                                        ; $6560: $83
    ld   e, a                                     ; $6561: $5F
    ld   d, b                                     ; $6562: $50
    ld   hl, Data_019_6497                        ; $6563: $21 $97 $64
    add  hl, de                                   ; $6566: $19
    ld   c, $06                                   ; $6567: $0E $06
    call RenderActiveEntitySpritesRect            ; $6569: $CD $E6 $3C
    ld   a, $04                                   ; $656C: $3E $04
    jp   func_015_7964_trampoline                 ; $656E: $C3 $A0 $3D

Data_019_6571::
    db   $98, $02, $09, $55, $56, $55, $56, $55   ; $6571
    db   $56, $55, $56, $55, $56, $98, $22, $09   ; $6579
    db   $55, $56, $55, $56, $55, $56, $55, $56   ; $6581
    db   $55, $56, $98, $42, $09, $0C, $0D, $0C   ; $6589
    db   $0D, $0C, $0D, $0C, $0D, $0C, $0D, $98   ; $6591
    db   $62, $09, $0E, $0F, $0E, $0F, $0E, $0F   ; $6599
    db   $0E, $0F, $0E, $0F                       ; $65A1

Data_019_65A5::
    db   $98, $02, $09, $55, $56, $55, $56, $55   ; $65A5
    db   $56, $55, $56, $55, $56, $98, $22, $09   ; $65AD
    db   $55, $56, $55, $56, $55, $56, $55, $56   ; $65B5
    db   $55, $56, $98, $42, $09, $0E, $0F, $0E   ; $65BD
    db   $0F, $0E, $0F, $0E, $0F, $0E, $0F, $98   ; $65C5
    db   $62, $09, $0F, $0E, $0F, $0E, $0F, $0E   ; $65CD
    db   $0F, $0E, $0F, $0E                       ; $65D5

Data_019_65D9::
    db   $98, $02, $09, $55, $56, $55, $56, $55   ; $65D9
    db   $56, $55, $56, $55, $56, $98, $22, $09   ; $65E1
    db   $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F   ; $65E9
    db   $0E, $0F, $98, $42, $09, $0F, $0E, $0F   ; $65F1
    db   $0E, $0F, $0E, $0F, $0E, $0F, $0E, $98   ; $65F9
    db   $62, $09, $0E, $0F, $0E, $0F, $0E, $0F   ; $6601
    db   $0E, $0F, $0E, $0F                       ; $6609

Data_019_660D::
    db   $98, $02, $09, $0E, $0F, $0E, $0F, $0E   ; $660D
    db   $0F, $0E, $0F, $0E, $0F, $98, $22, $09   ; $6615
    db   $0F, $0E, $0F, $0E, $0F, $0E, $0F, $0E   ; $661D
    db   $0F, $0E, $98, $42, $09, $0E, $0F, $0E   ; $6625
    db   $0F, $0E, $0F, $0E, $0F, $0E, $0F, $98   ; $662D
    db   $62, $09, $0F, $0E, $0F, $0E, $0F, $0E   ; $6635
    db   $0F, $0E, $0F, $0E                       ; $663D

Data_019_6641::
    db   $98, $82, $09, $0F, $0E, $0F, $0F, $0F   ; $6641
    db   $0E, $0F, $0E, $0F, $0E, $98, $A2, $09   ; $6649
    db   $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F   ; $6651
    db   $0E, $0F, $98, $C2, $09, $0F, $0E, $0F   ; $6659
    db   $0E, $0F, $0E, $0F, $0E, $0F, $0E, $98   ; $6661
    db   $E2, $09, $1E, $1E, $1E, $1E, $1E, $1E   ; $6669
    db   $1E, $1E, $1E, $1E                       ; $6671

Data_019_6675::
    db   $98, $82, $09, $0E, $0F, $0E, $0F, $0E   ; $6675
    db   $0F, $0E, $0F, $0E, $0F, $98, $A2, $09   ; $667D
    db   $0F, $0E, $0F, $0E, $0F, $0E, $0F, $0E   ; $6685
    db   $0F, $0E, $98, $C2, $09, $1E, $1E, $1E   ; $668D
    db   $1E, $1E, $1E, $1E, $1E, $1E, $1E, $98   ; $6695
    db   $E2, $09, $09, $08, $18, $09, $7E, $7E   ; $669D
    db   $09, $08, $18, $09                       ; $66A5

Data_019_66A9::
    db   $98, $82, $09, $0E, $0F, $0E, $0F, $0E   ; $66A9
    db   $0F, $0E, $0F, $0E, $0F, $98, $A2, $09   ; $66B1
    db   $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E   ; $66B9
    db   $1E, $1E, $98, $C2, $09, $09, $08, $18   ; $66C1
    db   $09, $7E, $7E, $09, $08, $18, $09, $98   ; $66C9
    db   $E2, $09, $09, $04, $05, $09, $7E, $7E   ; $66D1
    db   $09, $04, $05, $09                       ; $66D9

Data_019_66DD::
    db   $98, $82, $09, $1E, $1E, $1E, $1E, $1E   ; $66DD
    db   $1E, $1E, $1E, $1E, $1E, $98, $A2, $09   ; $66E5
    db   $09, $08, $18, $09, $7E, $7E, $09, $08   ; $66ED
    db   $18, $09, $98, $C2, $09, $09, $04, $05   ; $66F5
    db   $09, $7E, $7E, $09, $04, $05, $09, $98   ; $66FD
    db   $E2, $09, $19, $14, $15, $19, $1F, $1F   ; $6705
    db   $19, $14, $15, $19                       ; $670D

Data_019_6711::
    db   $98, $02, $49, $03, $98, $22, $49, $03   ; $6711
    db   $98, $42, $49, $05, $98, $62, $49, $02   ; $6719

Data_019_6721::
    db   $98, $02, $49, $03, $98, $22, $49, $03   ; $6721
    db   $98, $42, $49, $02, $98, $62, $49, $02   ; $6729

Data_019_6731::
    db   $98, $02, $49, $03, $98, $22, $49, $02   ; $6731
    db   $98, $42, $49, $02, $98, $62, $49, $02   ; $6739

Data_019_6741::
    db   $98, $02, $49, $02, $98, $22, $49, $02   ; $6741
    db   $98, $42, $49, $02, $98, $62, $49, $02   ; $6749

Data_019_6751::
    db   $98, $82, $09, $02, $02, $02, $02, $02   ; $6751
    db   $02, $02, $02, $02, $02, $98, $A2, $09   ; $6759
    db   $02, $02, $02, $02, $02, $02, $02, $02   ; $6761
    db   $02, $02, $98, $C2, $09, $02, $02, $02   ; $6769
    db   $02, $02, $02, $02, $02, $02, $02, $98   ; $6771
    db   $E2, $09, $01, $01, $01, $01, $01, $01   ; $6779
    db   $01, $01, $01, $01                       ; $6781

Data_019_6785::
    db   $98, $82, $09, $02, $02, $02, $02, $02   ; $6785
    db   $02, $02, $02, $02, $02, $98, $A2, $09   ; $678D
    db   $02, $02, $02, $02, $02, $02, $02, $02   ; $6795
    db   $02, $02, $98, $C2, $09, $01, $01, $01   ; $679D
    db   $01, $01, $01, $01, $01, $01, $01, $98   ; $67A5
    db   $E2, $09, $01, $00, $00, $01, $01, $01   ; $67AD
    db   $01, $00, $00, $01                       ; $67B5

Data_019_67B9::
    db   $98, $82, $09, $02, $02, $02, $02, $02   ; $67B9
    db   $02, $02, $02, $02, $02, $98, $A2, $09   ; $67C1
    db   $01, $01, $01, $01, $01, $01, $01, $01   ; $67C9
    db   $01, $01, $98, $C2, $09, $01, $00, $00   ; $67D1
    db   $01, $01, $01, $01, $00, $00, $01, $98   ; $67D9
    db   $E2, $09, $01, $00, $00, $01, $01, $01   ; $67E1
    db   $01, $00, $00, $01                       ; $67E9

Data_019_67ED::
    db   $98, $82, $09, $01, $01, $01, $01, $01   ; $67ED
    db   $01, $01, $01, $01, $01, $98, $A2, $09   ; $67F5
    db   $01, $00, $00, $01, $01, $01, $01, $00   ; $67FD
    db   $00, $01, $98, $C2, $09, $01, $00, $00   ; $6805
    db   $01, $01, $01, $01, $00, $00, $01, $98   ; $680D
    db   $E2, $09, $01, $00, $00, $01, $01, $01   ; $6815
    db   $01, $00, $00, $01                       ; $681D

Data_019_6821::
    dw   Data_019_6571
    dw   Data_019_65A5
    dw   Data_019_65D9
    dw   Data_019_660D

Data_019_6829::
    dw   Data_019_6641
    dw   Data_019_6675
    dw   Data_019_66A9
    dw   Data_019_66DD

Data_019_6831::
    dw   Data_019_6711
    dw   Data_019_6721
    dw   Data_019_6731
    dw   Data_019_6741

Data_019_6839::
    dw   Data_019_6751
    dw   Data_019_6785
    dw   Data_019_67B9
    dw   Data_019_67ED

AnimateDungeonDoorOpening:
    ldh  a, [hMapRoom]                            ; $6841: $F0 $F6
    cp   ROOM_OW_EAGLE_TOWER                      ; $6843: $FE $0E
    jp   z, AnimateEaglesTowerOpening             ; $6845: $CA $F8 $61

    ld   a, $02                                   ; $6848: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $684A: $E0 $A1
    ld   [wC167], a                               ; $684C: $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ; $684F: $F0 $F0
    JP_TABLE                                      ; $6851
._00 dw func_019_685A                             ; $6852
._01 dw func_019_686B                             ; $6854
._02 dw func_019_6894                             ; $6856
._03 dw func_019_68F9                             ; $6858

func_019_685A::
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ; $685A: $3E $04
    ldh  [hNoiseSfx], a                           ; $685C: $E0 $F4
    call GetEntityTransitionCountdown             ; $685E: $CD $05 $0C
    ld   [hl], $AC                                ; $6861: $36 $AC
    call GetEntityPrivateCountdown1               ; $6863: $CD $00 $0C
    ld   [hl], $AC                                ; $6866: $36 $AC
    call IncrementEntityState                     ; $6868: $CD $12 $3B

func_019_686B::
    call GetEntityTransitionCountdown             ; $686B: $CD $05 $0C
    cp   $A0                                      ; $686E: $FE $A0
    jr   nz, .jr_6877                             ; $6870: $20 $05

    ld   hl, hNoiseSfx                            ; $6872: $21 $F4 $FF
    ld   [hl], NOISE_SFX_OPEN_FACE_SHRINE         ; $6875: $36 $2E

.jr_6877
    and  a                                        ; $6877: $A7
    jr   nz, .jr_6881                             ; $6878: $20 $07

    ld   a, JINGLE_POOF                           ; $687A: $3E $2F
    ldh  [hJingle], a                             ; $687C: $E0 $F2
    call IncrementEntityState                     ; $687E: $CD $12 $3B

.jr_6881
    ld   e, $01                                   ; $6881: $1E $01
    and  $04                                      ; $6883: $E6 $04
    jr   z, .jr_6889                              ; $6885: $28 $02

    ld   e, $FE                                   ; $6887: $1E $FE

.jr_6889
    ld   a, e                                     ; $6889: $7B
    ld   [wScreenShakeHorizontal], a              ; $688A: $EA $55 $C1
    call GetEntityPrivateCountdown1               ; $688D: $CD $00 $0C
    ret  nz                                       ; $6890: $C0

    jp   label_019_6A4F                           ; $6891: $C3 $4F $6A

func_019_6894::
    ld   hl, wEntitiesPrivateState1Table          ; $6894: $21 $B0 $C2
    add  hl, bc                                   ; $6897: $09
    ld   a, [hl]                                  ; $6898: $7E
    push af                                       ; $6899: $F5
    rla                                           ; $689A: $17
    and  $06                                      ; $689B: $E6 $06
    ld   e, a                                     ; $689D: $5F
    ld   d, b                                     ; $689E: $50
    ld   hl, Data_019_6821                        ; $689F: $21 $21 $68
    add  hl, de                                   ; $68A2: $19
    ld   a, [hl+]                                 ; $68A3: $2A
    ld   d, [hl]                                  ; $68A4: $56
    ld   e, a                                     ; $68A5: $5F
    push bc                                       ; $68A6: $C5
    ld   c, $34                                   ; $68A7: $0E $34
    ld   hl, wDrawCommand                         ; $68A9: $21 $01 $D6

jr_019_68AC:
    ld   a, [de]                                  ; $68AC: $1A
    cp   $98                                      ; $68AD: $FE $98
    jr   nz, .jr_68BA                             ; $68AF: $20 $09

    ldh  a, [hBaseScrollY]                        ; $68B1: $F0 $97
    and  a                                        ; $68B3: $A7
    ld   a, $98                                   ; $68B4: $3E $98
    jr   z, .jr_68BA                              ; $68B6: $28 $02

    ld   a, $9A                                   ; $68B8: $3E $9A

.jr_68BA
    inc  de                                       ; $68BA: $13
    ld   [hl+], a                                 ; $68BB: $22
    dec  c                                        ; $68BC: $0D
    jr   nz, jr_019_68AC                          ; $68BD: $20 $ED

    ld   [hl], $00                                ; $68BF: $36 $00
    pop  bc                                       ; $68C1: $C1
    pop  af                                       ; $68C2: $F1
    push af                                       ; $68C3: $F5
    rla                                           ; $68C4: $17
    and  $06                                      ; $68C5: $E6 $06
    ld   e, a                                     ; $68C7: $5F
    ld   d, b                                     ; $68C8: $50
    ld   hl, Data_019_6831                        ; $68C9: $21 $31 $68
    add  hl, de                                   ; $68CC: $19
    ld   a, [hl+]                                 ; $68CD: $2A
    ld   d, [hl]                                  ; $68CE: $56
    ld   e, a                                     ; $68CF: $5F
    push bc                                       ; $68D0: $C5
    ld   c, $10                                   ; $68D1: $0E $10
    ld   hl, wDrawCommandAlt                      ; $68D3: $21 $91 $DC

jr_019_68D6:
    ld   a, [de]                                  ; $68D6: $1A
    cp   $98                                      ; $68D7: $FE $98
    jr   nz, .jr_68E4                             ; $68D9: $20 $09

    ldh  a, [hBaseScrollY]                        ; $68DB: $F0 $97
    and  a                                        ; $68DD: $A7
    ld   a, $98                                   ; $68DE: $3E $98
    jr   z, .jr_68E4                              ; $68E0: $28 $02

    ld   a, $9A                                   ; $68E2: $3E $9A

.jr_68E4
    inc  de                                       ; $68E4: $13
    ld   [hl+], a                                 ; $68E5: $22
    dec  c                                        ; $68E6: $0D
    jr   nz, jr_019_68D6                          ; $68E7: $20 $ED

    ld   [hl], $00                                ; $68E9: $36 $00
    pop  bc                                       ; $68EB: $C1
    pop  af                                       ; $68EC: $F1
    cp   $03                                      ; $68ED: $FE $03
    jr   nz, .jr_68F6                             ; $68EF: $20 $05

    ldh  a, [hNextDefaultMusicTrack]              ; $68F1: $F0 $BF
    ld   [wMusicTrackToPlay], a                   ; $68F3: $EA $68 $D3

.jr_68F6
    jp   IncrementEntityState                     ; $68F6: $C3 $12 $3B

func_019_68F9::
    push bc                                       ; $68F9: $C5
    ld   hl, wEntitiesPrivateState1Table          ; $68FA: $21 $B0 $C2
    add  hl, bc                                   ; $68FD: $09
    ld   a, [hl]                                  ; $68FE: $7E
    rla                                           ; $68FF: $17
    and  $06                                      ; $6900: $E6 $06
    ld   e, a                                     ; $6902: $5F
    ld   d, b                                     ; $6903: $50
    ld   hl, Data_019_6829                        ; $6904: $21 $29 $68
    add  hl, de                                   ; $6907: $19
    ld   a, [hl+]                                 ; $6908: $2A
    ld   d, [hl]                                  ; $6909: $56
    ld   e, a                                     ; $690A: $5F
    ld   c, $34                                   ; $690B: $0E $34
    ld   hl, wDrawCommand                         ; $690D: $21 $01 $D6

jr_019_6910:
    ld   a, [de]                                  ; $6910: $1A
    cp   $98                                      ; $6911: $FE $98
    jr   nz, .jr_691E                             ; $6913: $20 $09

    ldh  a, [hBaseScrollY]                        ; $6915: $F0 $97
    and  a                                        ; $6917: $A7
    ld   a, $98                                   ; $6918: $3E $98
    jr   z, .jr_691E                              ; $691A: $28 $02

    ld   a, $9A                                   ; $691C: $3E $9A

.jr_691E
    inc  de                                       ; $691E: $13
    ld   [hl+], a                                 ; $691F: $22
    dec  c                                        ; $6920: $0D
    jr   nz, jr_019_6910                          ; $6921: $20 $ED

    ld   [hl], $00                                ; $6923: $36 $00
    pop  bc                                       ; $6925: $C1
    push bc                                       ; $6926: $C5
    ld   hl, wEntitiesPrivateState1Table          ; $6927: $21 $B0 $C2
    add  hl, bc                                   ; $692A: $09
    ld   a, [hl]                                  ; $692B: $7E
    rla                                           ; $692C: $17
    and  $06                                      ; $692D: $E6 $06
    ld   e, a                                     ; $692F: $5F
    ld   d, b                                     ; $6930: $50
    ld   hl, Data_019_6839                        ; $6931: $21 $39 $68
    add  hl, de                                   ; $6934: $19
    ld   a, [hl+]                                 ; $6935: $2A
    ld   d, [hl]                                  ; $6936: $56
    ld   e, a                                     ; $6937: $5F
    ld   c, $34                                   ; $6938: $0E $34
    ld   hl, wDrawCommandAlt                      ; $693A: $21 $91 $DC

jr_019_693D:
    ld   a, [de]                                  ; $693D: $1A
    cp   $98                                      ; $693E: $FE $98
    jr   nz, .jr_694B                             ; $6940: $20 $09

    ldh  a, [hBaseScrollY]                        ; $6942: $F0 $97
    and  a                                        ; $6944: $A7
    ld   a, $98                                   ; $6945: $3E $98
    jr   z, .jr_694B                              ; $6947: $28 $02

    ld   a, $9A                                   ; $6949: $3E $9A

.jr_694B
    inc  de                                       ; $694B: $13
    ld   [hl+], a                                 ; $694C: $22
    dec  c                                        ; $694D: $0D
    jr   nz, jr_019_693D                          ; $694E: $20 $ED

    ld   [hl], $00                                ; $6950: $36 $00
    pop  bc                                       ; $6952: $C1
    ld   hl, wEntitiesPrivateState1Table          ; $6953: $21 $B0 $C2
    add  hl, bc                                   ; $6956: $09
    ld   a, [hl]                                  ; $6957: $7E
    inc  a                                        ; $6958: $3C
    ld   [hl], a                                  ; $6959: $77
    cp   $04                                      ; $695A: $FE $04
    jr   z, .jr_6961                              ; $695C: $28 $03

    jp   label_019_6A3C                           ; $695E: $C3 $3C $6A

.jr_6961
    ld   hl, wRoomObjects + $01                   ; $6961: $21 $12 $D7
    ld   a, $B3                                   ; $6964: $3E $B3
    ld   [hl+], a                                 ; $6966: $22
    ld   a, $B3                                   ; $6967: $3E $B3
    ld   [hl+], a                                 ; $6969: $22
    ld   a, $B3                                   ; $696A: $3E $B3
    ld   [hl+], a                                 ; $696C: $22
    ld   a, $B3                                   ; $696D: $3E $B3
    ld   [hl+], a                                 ; $696F: $22
    ld   a, $B3                                   ; $6970: $3E $B3
    ld   [hl+], a                                 ; $6972: $22
    ld   hl, wRoomObjects + $01                   ; $6973: $21 $12 $D7
    ld   a, $99                                   ; $6976: $3E $99
    call BackupObjectInRAM2                       ; $6978: $CD $2F $0B
    inc  hl                                       ; $697B: $23
    ld   a, $99                                   ; $697C: $3E $99
    call BackupObjectInRAM2                       ; $697E: $CD $2F $0B
    inc  hl                                       ; $6981: $23
    ld   a, $99                                   ; $6982: $3E $99
    call BackupObjectInRAM2                       ; $6984: $CD $2F $0B
    inc  hl                                       ; $6987: $23
    ld   a, $99                                   ; $6988: $3E $99
    call BackupObjectInRAM2                       ; $698A: $CD $2F $0B
    inc  hl                                       ; $698D: $23
    ld   a, $99                                   ; $698E: $3E $99
    call BackupObjectInRAM2                       ; $6990: $CD $2F $0B
    ld   hl, wRoomObjects + $11                   ; $6993: $21 $22 $D7
    ld   a, $B3                                   ; $6996: $3E $B3
    ld   [hl+], a                                 ; $6998: $22
    ld   a, $B3                                   ; $6999: $3E $B3
    ld   [hl+], a                                 ; $699B: $22
    ld   a, $B3                                   ; $699C: $3E $B3
    ld   [hl+], a                                 ; $699E: $22
    ld   a, $B3                                   ; $699F: $3E $B3
    ld   [hl+], a                                 ; $69A1: $22
    ld   a, $B3                                   ; $69A2: $3E $B3
    ld   [hl+], a                                 ; $69A4: $22
    ld   hl, wRoomObjects + $11                   ; $69A5: $21 $22 $D7
    ld   a, $99                                   ; $69A8: $3E $99
    call BackupObjectInRAM2                       ; $69AA: $CD $2F $0B
    inc  hl                                       ; $69AD: $23
    ld   a, $99                                   ; $69AE: $3E $99
    call BackupObjectInRAM2                       ; $69B0: $CD $2F $0B
    inc  hl                                       ; $69B3: $23
    ld   a, $99                                   ; $69B4: $3E $99
    call BackupObjectInRAM2                       ; $69B6: $CD $2F $0B
    inc  hl                                       ; $69B9: $23
    ld   a, $99                                   ; $69BA: $3E $99
    call BackupObjectInRAM2                       ; $69BC: $CD $2F $0B
    inc  hl                                       ; $69BF: $23
    ld   a, $99                                   ; $69C0: $3E $99
    call BackupObjectInRAM2                       ; $69C2: $CD $2F $0B
    ld   hl, wRoomObjects + $21                   ; $69C5: $21 $32 $D7
    ld   a, $AD                                   ; $69C8: $3E $AD
    ld   [hl+], a                                 ; $69CA: $22
    ld   a, $B1                                   ; $69CB: $3E $B1
    ld   [hl+], a                                 ; $69CD: $22
    ld   a, $E7                                   ; $69CE: $3E $E7
    ld   [hl+], a                                 ; $69D0: $22
    ld   a, $AD                                   ; $69D1: $3E $AD
    ld   [hl+], a                                 ; $69D3: $22
    ld   a, $B1                                   ; $69D4: $3E $B1
    ld   [hl+], a                                 ; $69D6: $22
    ld   hl, wRoomObjects + $21                   ; $69D7: $21 $32 $D7
    ld   a, $99                                   ; $69DA: $3E $99
    call BackupObjectInRAM2                       ; $69DC: $CD $2F $0B
    inc  hl                                       ; $69DF: $23
    ld   a, $99                                   ; $69E0: $3E $99
    call BackupObjectInRAM2                       ; $69E2: $CD $2F $0B
    inc  hl                                       ; $69E5: $23
    ld   a, $99                                   ; $69E6: $3E $99
    call BackupObjectInRAM2                       ; $69E8: $CD $2F $0B
    inc  hl                                       ; $69EB: $23
    ld   a, $99                                   ; $69EC: $3E $99
    call BackupObjectInRAM2                       ; $69EE: $CD $2F $0B
    inc  hl                                       ; $69F1: $23
    ld   a, $99                                   ; $69F2: $3E $99
    call BackupObjectInRAM2                       ; $69F4: $CD $2F $0B
    ld   hl, wRoomObjects + $31                   ; $69F7: $21 $42 $D7
    ld   a, $AE                                   ; $69FA: $3E $AE
    ld   [hl+], a                                 ; $69FC: $22
    ld   a, $B2                                   ; $69FD: $3E $B2
    ld   [hl+], a                                 ; $69FF: $22
    ld   a, $E3                                   ; $6A00: $3E $E3
    ld   [hl+], a                                 ; $6A02: $22
    ld   a, $AE                                   ; $6A03: $3E $AE
    ld   [hl+], a                                 ; $6A05: $22
    ld   a, $B2                                   ; $6A06: $3E $B2
    ld   [hl+], a                                 ; $6A08: $22
    ld   hl, wRoomObjects + $31                   ; $6A09: $21 $42 $D7
    ld   a, $99                                   ; $6A0C: $3E $99
    call BackupObjectInRAM2                       ; $6A0E: $CD $2F $0B
    inc  hl                                       ; $6A11: $23
    ld   a, $99                                   ; $6A12: $3E $99
    call BackupObjectInRAM2                       ; $6A14: $CD $2F $0B
    inc  hl                                       ; $6A17: $23
    ld   a, $99                                   ; $6A18: $3E $99
    call BackupObjectInRAM2                       ; $6A1A: $CD $2F $0B
    inc  hl                                       ; $6A1D: $23
    ld   a, $99                                   ; $6A1E: $3E $99
    call BackupObjectInRAM2                       ; $6A20: $CD $2F $0B
    inc  hl                                       ; $6A23: $23
    ld   a, $99                                   ; $6A24: $3E $99
    call BackupObjectInRAM2                       ; $6A26: $CD $2F $0B
    call func_019_7F0E                            ; $6A29: $CD $0E $7F
    set  4, [hl]                                  ; $6A2C: $CB $E6
    xor  a                                        ; $6A2E: $AF
    ld   [wScreenShakeHorizontal], a              ; $6A2F: $EA $55 $C1
    ld   [wC167], a                               ; $6A32: $EA $67 $C1
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $6A35: $3E $02
    ldh  [hJingle], a                             ; $6A37: $E0 $F2
    jp   ClearEntityStatus_19                     ; $6A39: $C3 $61 $7E

label_019_6A3C:
    call IncrementEntityState                     ; $6A3C: $CD $12 $3B
    ld   [hl], $01                                ; $6A3F: $36 $01
    call GetEntityTransitionCountdown             ; $6A41: $CD $05 $0C
    ld   [hl], $30                                ; $6A44: $36 $30
    ret                                           ; $6A46: $C9

Data_019_6A47::
    db   $18, $58, $28, $48, $38, $20, $50, $40

label_019_6A4F:
    ldh  a, [hFrameCounter]                       ; $6A4F: $F0 $E7
    and  $03                                      ; $6A51: $E6 $03
    jr   nz, ret_019_6A8C                         ; $6A53: $20 $37

    ld   a, ENTITY_SMASHABLE_PILLAR               ; $6A55: $3E $A7
    call SpawnNewEntity_trampoline                ; $6A57: $CD $86 $3B
    jr   c, ret_019_6A8C                          ; $6A5A: $38 $30

    push bc                                       ; $6A5C: $C5
    call GetRandomByte                            ; $6A5D: $CD $0D $28
    and  $07                                      ; $6A60: $E6 $07
    ld   c, a                                     ; $6A62: $4F
    ld   hl, Data_019_6A47                        ; $6A63: $21 $47 $6A
    add  hl, bc                                   ; $6A66: $09
    ld   a, [hl]                                  ; $6A67: $7E
    ld   hl, wEntitiesPosXTable                   ; $6A68: $21 $00 $C2
    add  hl, de                                   ; $6A6B: $19
    ld   [hl], a                                  ; $6A6C: $77

.jr_6A6D
    call GetRandomByte                            ; $6A6D: $CD $0D $28
    and  $07                                      ; $6A70: $E6 $07
    add  $47                                      ; $6A72: $C6 $47
    ld   hl, wEntitiesPosYTable                   ; $6A74: $21 $10 $C2
    add  hl, de                                   ; $6A77: $19
    ld   [hl], a                                  ; $6A78: $77
    pop  bc                                       ; $6A79: $C1
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6A7A: $21 $40 $C3
    add  hl, de                                   ; $6A7D: $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $6A7E: $36 $C2
    ld   hl, wEntitiesTransitionCountdownTable    ; $6A80: $21 $E0 $C2
    add  hl, de                                   ; $6A83: $19
    ld   [hl], $10                                ; $6A84: $36 $10
    ld   hl, wEntitiesPrivateState1Table          ; $6A86: $21 $B0 $C2
    add  hl, de                                   ; $6A89: $19
    ld   [hl], $01                                ; $6A8A: $36 $01

ret_019_6A8C:
    ret                                           ; $6A8C: $C9
