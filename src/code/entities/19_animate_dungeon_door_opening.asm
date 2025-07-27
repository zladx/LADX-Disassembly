
Data_019_60B4::
    db   $98, $06, $89, $00, $04, $00, $04, $00   ;; 19:60B4
    db   $04, $00, $04, $00, $10, $98, $07, $89   ;; 19:60BC
    db   $01, $11, $01, $11, $01, $11, $01, $11   ;; 19:60C4
    db   $01, $11, $98, $08, $89, $07, $06, $07   ;; 19:60CC
    db   $06, $07, $06, $07, $06, $07, $06, $98   ;; 19:60D4
    db   $08, $89, $07, $06, $07, $06, $07, $06   ;; 19:60DC
    db   $07, $06, $07, $06                       ;; 19:60E4

Data_019_60E8::
    db   $98, $09, $89, $06, $07, $06, $07, $06   ;; 19:60E8
    db   $07, $06, $07, $06, $07, $98, $0A, $89   ;; 19:60F0
    db   $07, $06, $07, $06, $07, $06, $07, $06   ;; 19:60F8
    db   $07, $06, $98, $0B, $89, $06, $07, $06   ;; 19:6100
    db   $07, $06, $07, $06, $07, $06, $07, $98   ;; 19:6108
    db   $0B, $89, $06, $07, $06, $07, $06, $07   ;; 19:6110
    db   $06, $07, $06, $07                       ;; 19:6118

Data_019_611C::
    db   $98, $0C, $89, $07, $06, $07, $06, $07   ;; 19:611C
    db   $06, $07, $06, $07, $06, $98, $0D, $89   ;; 19:6124
    db   $06, $07, $06, $07, $06, $07, $06, $07   ;; 19:612C
    db   $06, $07, $98, $0E, $89, $02, $12, $02   ;; 19:6134
    db   $12, $02, $12, $02, $12, $02, $12, $98   ;; 19:613C
    db   $0F, $89, $03, $05, $03, $05, $03, $05   ;; 19:6144
    db   $03, $05, $03, $13                       ;; 19:614C

Data_019_6150::
    db   $98, $06, $89, $04, $00, $04, $00, $04   ;; 19:6150
    db   $00, $04, $00, $04, $14, $98, $07, $89   ;; 19:6158
    db   $11, $01, $11, $01, $11, $01, $11, $01   ;; 19:6160
    db   $11, $01, $98, $08, $89, $06, $07, $06   ;; 19:6168
    db   $07, $06, $07, $06, $07, $06, $07, $98   ;; 19:6170
    db   $08, $89, $06, $07, $06, $07, $06, $07   ;; 19:6178
    db   $06, $07, $06, $07                       ;; 19:6180

Data_019_6184::
    db   $98, $09, $89, $07, $06, $07, $06, $07   ;; 19:6184
    db   $06, $07, $06, $07, $06, $98, $0A, $89   ;; 19:618C
    db   $06, $07, $06, $07, $06, $07, $06, $07   ;; 19:6194
    db   $06, $07, $98, $0B, $89, $07, $06, $07   ;; 19:619C
    db   $06, $07, $06, $07, $06, $07, $06, $98   ;; 19:61A4
    db   $0B, $89, $07, $06, $07, $06, $07, $06   ;; 19:61AC
    db   $07, $06, $07, $06                       ;; 19:61B4

Data_019_61B8::
    db   $98, $0C, $89, $06, $07, $06, $07, $06   ;; 19:61B8
    db   $07, $06, $07, $06, $07, $98, $0D, $89   ;; 19:61C0
    db   $07, $06, $07, $06, $07, $06, $07, $06   ;; 19:61C8
    db   $07, $06, $98, $0E, $89, $12, $02, $12   ;; 19:61D0
    db   $02, $12, $02, $12, $02, $12, $02, $98   ;; 19:61D8
    db   $0F, $89, $05, $03, $05, $03, $05, $03   ;; 19:61E0
    db   $05, $03, $05, $15                       ;; 19:61E8

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
    ld   a, $02                                   ;; 19:61F8 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:61FA $E0 $A1
    ld   [wC167], a                               ;; 19:61FC $EA $67 $C1
    call func_019_650F                            ;; 19:61FF $CD $0F $65
    ldh  a, [hActiveEntityState]                  ;; 19:6202 $F0 $F0
    JP_TABLE                                      ;; 19:6204
._00 dw EaglesTowerOpeningState0Handler
._01 dw EaglesTowerOpeningState1Handler
._02 dw EaglesTowerOpeningState2Handler
._03 dw EaglesTowerOpeningState3Handler
._04 dw EaglesTowerOpeningState4Handler
._05 dw EaglesTowerOpeningState5Handler
._06 dw EaglesTowerOpeningState6Handler

EaglesTowerOpeningState0Handler::
    call label_27F2                               ;; 19:6213 $CD $F2 $27
    call GetEntityTransitionCountdown             ;; 19:6216 $CD $05 $0C
    ld   [hl], $FF                                ;; 19:6219 $36 $FF
    call IncrementEntityState                     ;; 19:621B $CD $12 $3B

EaglesTowerOpeningState1Handler::
    call GetEntityTransitionCountdown             ;; 19:621E $CD $05 $0C
    jr   nz, .jr_6230                             ;; 19:6221 $20 $0D

    ld   [wScreenShakeHorizontal], a              ;; 19:6223 $EA $55 $C1
    call SetEntitySpriteVariant                   ;; 19:6226 $CD $0C $3B
    ld   a, JINGLE_EAGLES_TOWER_ROTATE            ;; 19:6229 $3E $2E
    ldh  [hJingle], a                             ;; 19:622B $E0 $F2
    jp   IncrementEntityState                     ;; 19:622D $C3 $12 $3B

.jr_6230
    cp   $A0                                      ;; 19:6230 $FE $A0
    jr   nz, .jr_6238                             ;; 19:6232 $20 $04

    ld   a, NOISE_SFX_OPEN_D4_D7                  ;; 19:6234 $3E $1D
    ldh  [hNoiseSfx], a                           ;; 19:6236 $E0 $F4

.jr_6238
    jr   c, jr_019_6245                           ;; 19:6238 $38 $0B

    and  $10                                      ;; 19:623A $E6 $10
    ld   a, $00                                   ;; 19:623C $3E $00
    jr   z, .jr_6242                              ;; 19:623E $28 $02

    ld   a, $FF                                   ;; 19:6240 $3E $FF

.jr_6242
    jp   SetEntitySpriteVariant                   ;; 19:6242 $C3 $0C $3B

jr_019_6245:
    ld   e, $01                                   ;; 19:6245 $1E $01
    and  $04                                      ;; 19:6247 $E6 $04
    jr   z, .jr_624D                              ;; 19:6249 $28 $02

    ld   e, $FE                                   ;; 19:624B $1E $FE

.jr_624D
    ld   a, e                                     ;; 19:624D $7B
    ld   [wScreenShakeHorizontal], a              ;; 19:624E $EA $55 $C1
    ret                                           ;; 19:6251 $C9

EaglesTowerOpeningState2Handler::
    call GetEntityTransitionCountdown             ;; 19:6252 $CD $05 $0C
    and  a                                        ;; 19:6255 $A7
    ret  nz                                       ;; 19:6256 $C0

    jp   IncrementEntityState                     ;; 19:6257 $C3 $12 $3B

EaglesTowerOpeningState3Handler::
    ld   hl, Data_019_61EC                        ;; 19:625A $21 $EC $61
    jr   func_019_6262                            ;; 19:625D $18 $03

EaglesTowerOpeningState4Handler::
    ld   hl, Data_019_61F0                        ;; 19:625F $21 $F0 $61

func_019_6262::
    push bc                                       ;; 19:6262 $C5
    push hl                                       ;; 19:6263 $E5
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6264 $21 $B0 $C2
    add  hl, bc                                   ;; 19:6267 $09
    ld   a, [hl]                                  ;; 19:6268 $7E
    rla                                           ;; 19:6269 $17
    and  $02                                      ;; 19:626A $E6 $02
    ld   e, a                                     ;; 19:626C $5F
    ld   d, b                                     ;; 19:626D $50
    pop  hl                                       ;; 19:626E $E1
    add  hl, de                                   ;; 19:626F $19
    ld   a, [hl+]                                 ;; 19:6270 $2A
    ld   d, [hl]                                  ;; 19:6271 $56
    ld   e, a                                     ;; 19:6272 $5F
    ld   c, $34                                   ;; 19:6273 $0E $34
    ld   hl, wDrawCommand                         ;; 19:6275 $21 $01 $D6

jr_019_6278:
    dec  de                                       ;; 19:6278 $1B
    ld   a, [de]                                  ;; 19:6279 $1A
    inc  de                                       ;; 19:627A $13
    cp   $98                                      ;; 19:627B $FE $98
    ld   a, [de]                                  ;; 19:627D $1A
    jr   nz, .jr_6288                             ;; 19:627E $20 $08

    ldh  a, [hBaseScrollX]                        ;; 19:6280 $F0 $96
    and  a                                        ;; 19:6282 $A7
    ld   a, [de]                                  ;; 19:6283 $1A
    jr   z, .jr_6288                              ;; 19:6284 $28 $02

    add  $0C                                      ;; 19:6286 $C6 $0C

.jr_6288
    inc  de                                       ;; 19:6288 $13
    ld   [hl+], a                                 ;; 19:6289 $22
    dec  c                                        ;; 19:628A $0D
    jr   nz, jr_019_6278                          ;; 19:628B $20 $EB

    ld   [hl], $00                                ;; 19:628D $36 $00
    pop  bc                                       ;; 19:628F $C1
    jp   IncrementEntityState                     ;; 19:6290 $C3 $12 $3B

EaglesTowerOpeningState5Handler::
    ld   hl, Data_019_61F4                        ;; 19:6293 $21 $F4 $61
    call func_019_6262                            ;; 19:6296 $CD $62 $62
    call GetEntityTransitionCountdown             ;; 19:6299 $CD $05 $0C
    ld   [hl], $18                                ;; 19:629C $36 $18
    ld   hl, wEntitiesPrivateState1Table          ;; 19:629E $21 $B0 $C2
    add  hl, bc                                   ;; 19:62A1 $09
    inc  [hl]                                     ;; 19:62A2 $34
    ld   hl, wEntitiesInertiaTable                ;; 19:62A3 $21 $D0 $C3
    add  hl, bc                                   ;; 19:62A6 $09
    ld   a, [hl]                                  ;; 19:62A7 $7E
    inc  a                                        ;; 19:62A8 $3C
    ld   [hl], a                                  ;; 19:62A9 $77
    cp   $0C                                      ;; 19:62AA $FE $0C
    jr   nz, .jr_62B4                             ;; 19:62AC $20 $06

    ldh  a, [hNextDefaultMusicTrack]              ;; 19:62AE $F0 $BF
    ld   [wMusicTrackToPlay], a                   ;; 19:62B0 $EA $68 $D3
    ret                                           ;; 19:62B3 $C9

.jr_62B4
    call IncrementEntityState                     ;; 19:62B4 $CD $12 $3B
    ld   [hl], $02                                ;; 19:62B7 $36 $02
    ret                                           ;; 19:62B9 $C9

EaglesTowerOpeningState6Handler::
    call func_019_7F0E                            ;; 19:62BA $CD $0E $7F
    set  4, [hl]                                  ;; 19:62BD $CB $E6
    xor  a                                        ;; 19:62BF $AF
    ld   [wScreenShakeHorizontal], a              ;; 19:62C0 $EA $55 $C1
    ld   [wC167], a                               ;; 19:62C3 $EA $67 $C1
    ld   a, JINGLE_PUZZLE_SOLVED                  ;; 19:62C6 $3E $02
    ldh  [hJingle], a                             ;; 19:62C8 $E0 $F2
    ld   hl, wRoomObjects + $25                   ;; 19:62CA $21 $36 $D7
    ld   a, $E1                                   ;; 19:62CD $3E $E1
    ld   [hl], a                                  ;; 19:62CF $77
    ld   a, $99                                   ;; 19:62D0 $3E $99
    call BackupObjectInRAM2                       ;; 19:62D2 $CD $2F $0B
    ld   hl, wRoomObjects + $35                   ;; 19:62D5 $21 $46 $D7
    ld   a, $77                                   ;; 19:62D8 $3E $77
    ld   [hl], a                                  ;; 19:62DA $77
    ld   a, $99                                   ;; 19:62DB $3E $99
    call BackupObjectInRAM2                       ;; 19:62DD $CD $2F $0B
    ld   hl, wRoomObjects + $45                   ;; 19:62E0 $21 $56 $D7
    ld   a, $77                                   ;; 19:62E3 $3E $77
    ld   [hl], a                                  ;; 19:62E5 $77
    ld   a, $99                                   ;; 19:62E6 $3E $99
    call BackupObjectInRAM2                       ;; 19:62E8 $CD $2F $0B
    call func_019_6374                            ;; 19:62EB $CD $74 $63
    call func_019_63B5                            ;; 19:62EE $CD $B5 $63
    jp   ClearEntityStatus_19                     ;; 19:62F1 $C3 $61 $7E

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
    ld   a, $20                                   ;; 19:6374 $3E $20
    ld   [wDrawCommandsSize], a                   ;; 19:6376 $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 19:6379 $21 $01 $D6
    ld   de, Data_019_62F4                        ;; 19:637C $11 $F4 $62
    ldh  a, [hIsGBC]                              ;; 19:637F $F0 $FE
    and  a                                        ;; 19:6381 $A7
    jr   z, .jr_6387                              ;; 19:6382 $28 $03

    ld   de, Data_019_6334                        ;; 19:6384 $11 $34 $63

.jr_6387
    ldh  a, [hBaseScrollX]                        ;; 19:6387 $F0 $96
    and  a                                        ;; 19:6389 $A7
    jr   z, .jr_6397                              ;; 19:638A $28 $0B

    ld   de, Data_019_6314                        ;; 19:638C $11 $14 $63
    ldh  a, [hIsGBC]                              ;; 19:638F $F0 $FE
    and  a                                        ;; 19:6391 $A7
    jr   z, .jr_6397                              ;; 19:6392 $28 $03

    ld   de, Data_019_6354                        ;; 19:6394 $11 $54 $63

.jr_6397
    push bc                                       ;; 19:6397 $C5
    ld   c, $20                                   ;; 19:6398 $0E $20

.loop_639A
    ld   a, [de]                                  ;; 19:639A $1A
    inc  de                                       ;; 19:639B $13
    ld   [hl+], a                                 ;; 19:639C $22
    dec  c                                        ;; 19:639D $0D
    jr   nz, .loop_639A                           ;; 19:639E $20 $FA

    pop  bc                                       ;; 19:63A0 $C1
    ld   [hl], b                                  ;; 19:63A1 $70
    ret                                           ;; 19:63A2 $C9

Data_019_63A3::
    db   $98, $8B, $85, $26, $26, $01, $01, $01, $01

Data_019_63AC::
    db   $98, $97, $85, $26, $26, $01, $01, $01, $01

func_019_63B5::
    ldh  a, [hIsGBC]                              ;; 19:63B5 $F0 $FE
    and  a                                        ;; 19:63B7 $A7
    jr   z, ret_019_63D8                          ;; 19:63B8 $28 $1E

    ld   a, $05                                   ;; 19:63BA $3E $05
    ld   [wDrawCommandsVRAM1Size], a              ;; 19:63BC $EA $90 $DC
    ld   hl, wDrawCommandVRAM1                    ;; 19:63BF $21 $91 $DC
    ld   de, Data_019_63A3                        ;; 19:63C2 $11 $A3 $63
    ldh  a, [hBaseScrollX]                        ;; 19:63C5 $F0 $96
    and  a                                        ;; 19:63C7 $A7
    jr   z, .jr_63CD                              ;; 19:63C8 $28 $03

    ld   de, Data_019_63AC                        ;; 19:63CA $11 $AC $63

.jr_63CD
    push bc                                       ;; 19:63CD $C5
    ld   c, $09                                   ;; 19:63CE $0E $09

.loop_63D0
    ld   a, [de]                                  ;; 19:63D0 $1A
    inc  de                                       ;; 19:63D1 $13
    ld   [hl+], a                                 ;; 19:63D2 $22
    dec  c                                        ;; 19:63D3 $0D
    jr   nz, .loop_63D0                           ;; 19:63D4 $20 $FA

    pop  bc                                       ;; 19:63D6 $C1
    ld   [hl], b                                  ;; 19:63D7 $70

ret_019_63D8:
    ret                                           ;; 19:63D8 $C9

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
    ld   hl, wEntitiesInertiaTable                ;; 19:650F $21 $D0 $C3
    add  hl, bc                                   ;; 19:6512 $09
    ld   e, [hl]                                  ;; 19:6513 $5E
    ld   d, b                                     ;; 19:6514 $50

.jr_6515
    ld   hl, Data_019_63D9                        ;; 19:6515 $21 $D9 $63
    add  hl, de                                   ;; 19:6518 $19
    ld   a, [hl]                                  ;; 19:6519 $7E
    ldh  [hActiveEntityPosX], a                   ;; 19:651A $E0 $EE
    ld   hl, Data_019_63E6                        ;; 19:651C $21 $E6 $63
    add  hl, de                                   ;; 19:651F $19
    ld   a, [hl]                                  ;; 19:6520 $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 19:6521 $E0 $EC
    ld   hl, Data_019_63F3                        ;; 19:6523 $21 $F3 $63
    add  hl, de                                   ;; 19:6526 $19
    ld   a, [hl]                                  ;; 19:6527 $7E
    rla                                           ;; 19:6528 $17
    rla                                           ;; 19:6529 $17
    rla                                           ;; 19:652A $17
    rla                                           ;; 19:652B $17
    and  $F0                                      ;; 19:652C $E6 $F0
    ld   e, a                                     ;; 19:652E $5F
    ld   d, b                                     ;; 19:652F $50
    ld   hl, Data_019_6427                        ;; 19:6530 $21 $27 $64
    add  hl, de                                   ;; 19:6533 $19
    ld   c, $04                                   ;; 19:6534 $0E $04
    call RenderActiveEntitySpritesRect            ;; 19:6536 $CD $E6 $3C
    ld   a, $02                                   ;; 19:6539 $3E $02
    call func_015_7964_trampoline                 ;; 19:653B $CD $A0 $3D
    ld   hl, wEntitiesInertiaTable                ;; 19:653E $21 $D0 $C3
    add  hl, bc                                   ;; 19:6541 $09
    ld   e, [hl]                                  ;; 19:6542 $5E
    ld   d, b                                     ;; 19:6543 $50
    ld   hl, Data_019_6400                        ;; 19:6544 $21 $00 $64
    add  hl, de                                   ;; 19:6547 $19
    ld   a, [hl]                                  ;; 19:6548 $7E
    ldh  [hActiveEntityPosX], a                   ;; 19:6549 $E0 $EE
    ld   hl, Data_019_640D                        ;; 19:654B $21 $0D $64
    add  hl, de                                   ;; 19:654E $19
    ld   a, [hl]                                  ;; 19:654F $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 19:6550 $E0 $EC
    ld   hl, Data_019_641A                        ;; 19:6552 $21 $1A $64
    add  hl, de                                   ;; 19:6555 $19
    ld   a, [hl]                                  ;; 19:6556 $7E
    rla                                           ;; 19:6557 $17
    rla                                           ;; 19:6558 $17
    rla                                           ;; 19:6559 $17
    and  $F8                                      ;; 19:655A $E6 $F8
    ld   e, a                                     ;; 19:655C $5F
    rla                                           ;; 19:655D $17
    and  $F0                                      ;; 19:655E $E6 $F0
    add  e                                        ;; 19:6560 $83
    ld   e, a                                     ;; 19:6561 $5F
    ld   d, b                                     ;; 19:6562 $50
    ld   hl, Data_019_6497                        ;; 19:6563 $21 $97 $64
    add  hl, de                                   ;; 19:6566 $19
    ld   c, $06                                   ;; 19:6567 $0E $06
    call RenderActiveEntitySpritesRect            ;; 19:6569 $CD $E6 $3C
    ld   a, $04                                   ;; 19:656C $3E $04
    jp   func_015_7964_trampoline                 ;; 19:656E $C3 $A0 $3D

Data_019_6571::
    db   $98, $02, $09, $55, $56, $55, $56, $55   ;; 19:6571
    db   $56, $55, $56, $55, $56, $98, $22, $09   ;; 19:6579
    db   $55, $56, $55, $56, $55, $56, $55, $56   ;; 19:6581
    db   $55, $56, $98, $42, $09, $0C, $0D, $0C   ;; 19:6589
    db   $0D, $0C, $0D, $0C, $0D, $0C, $0D, $98   ;; 19:6591
    db   $62, $09, $0E, $0F, $0E, $0F, $0E, $0F   ;; 19:6599
    db   $0E, $0F, $0E, $0F                       ;; 19:65A1

Data_019_65A5::
    db   $98, $02, $09, $55, $56, $55, $56, $55   ;; 19:65A5
    db   $56, $55, $56, $55, $56, $98, $22, $09   ;; 19:65AD
    db   $55, $56, $55, $56, $55, $56, $55, $56   ;; 19:65B5
    db   $55, $56, $98, $42, $09, $0E, $0F, $0E   ;; 19:65BD
    db   $0F, $0E, $0F, $0E, $0F, $0E, $0F, $98   ;; 19:65C5
    db   $62, $09, $0F, $0E, $0F, $0E, $0F, $0E   ;; 19:65CD
    db   $0F, $0E, $0F, $0E                       ;; 19:65D5

Data_019_65D9::
    db   $98, $02, $09, $55, $56, $55, $56, $55   ;; 19:65D9
    db   $56, $55, $56, $55, $56, $98, $22, $09   ;; 19:65E1
    db   $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F   ;; 19:65E9
    db   $0E, $0F, $98, $42, $09, $0F, $0E, $0F   ;; 19:65F1
    db   $0E, $0F, $0E, $0F, $0E, $0F, $0E, $98   ;; 19:65F9
    db   $62, $09, $0E, $0F, $0E, $0F, $0E, $0F   ;; 19:6601
    db   $0E, $0F, $0E, $0F                       ;; 19:6609

Data_019_660D::
    db   $98, $02, $09, $0E, $0F, $0E, $0F, $0E   ;; 19:660D
    db   $0F, $0E, $0F, $0E, $0F, $98, $22, $09   ;; 19:6615
    db   $0F, $0E, $0F, $0E, $0F, $0E, $0F, $0E   ;; 19:661D
    db   $0F, $0E, $98, $42, $09, $0E, $0F, $0E   ;; 19:6625
    db   $0F, $0E, $0F, $0E, $0F, $0E, $0F, $98   ;; 19:662D
    db   $62, $09, $0F, $0E, $0F, $0E, $0F, $0E   ;; 19:6635
    db   $0F, $0E, $0F, $0E                       ;; 19:663D

Data_019_6641::
    db   $98, $82, $09, $0F, $0E, $0F, $0F, $0F   ;; 19:6641
    db   $0E, $0F, $0E, $0F, $0E, $98, $A2, $09   ;; 19:6649
    db   $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F   ;; 19:6651
    db   $0E, $0F, $98, $C2, $09, $0F, $0E, $0F   ;; 19:6659
    db   $0E, $0F, $0E, $0F, $0E, $0F, $0E, $98   ;; 19:6661
    db   $E2, $09, $1E, $1E, $1E, $1E, $1E, $1E   ;; 19:6669
    db   $1E, $1E, $1E, $1E                       ;; 19:6671

Data_019_6675::
    db   $98, $82, $09, $0E, $0F, $0E, $0F, $0E   ;; 19:6675
    db   $0F, $0E, $0F, $0E, $0F, $98, $A2, $09   ;; 19:667D
    db   $0F, $0E, $0F, $0E, $0F, $0E, $0F, $0E   ;; 19:6685
    db   $0F, $0E, $98, $C2, $09, $1E, $1E, $1E   ;; 19:668D
    db   $1E, $1E, $1E, $1E, $1E, $1E, $1E, $98   ;; 19:6695
    db   $E2, $09, $09, $08, $18, $09, $7E, $7E   ;; 19:669D
    db   $09, $08, $18, $09                       ;; 19:66A5

Data_019_66A9::
    db   $98, $82, $09, $0E, $0F, $0E, $0F, $0E   ;; 19:66A9
    db   $0F, $0E, $0F, $0E, $0F, $98, $A2, $09   ;; 19:66B1
    db   $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E   ;; 19:66B9
    db   $1E, $1E, $98, $C2, $09, $09, $08, $18   ;; 19:66C1
    db   $09, $7E, $7E, $09, $08, $18, $09, $98   ;; 19:66C9
    db   $E2, $09, $09, $04, $05, $09, $7E, $7E   ;; 19:66D1
    db   $09, $04, $05, $09                       ;; 19:66D9

Data_019_66DD::
    db   $98, $82, $09, $1E, $1E, $1E, $1E, $1E   ;; 19:66DD
    db   $1E, $1E, $1E, $1E, $1E, $98, $A2, $09   ;; 19:66E5
    db   $09, $08, $18, $09, $7E, $7E, $09, $08   ;; 19:66ED
    db   $18, $09, $98, $C2, $09, $09, $04, $05   ;; 19:66F5
    db   $09, $7E, $7E, $09, $04, $05, $09, $98   ;; 19:66FD
    db   $E2, $09, $19, $14, $15, $19, $1F, $1F   ;; 19:6705
    db   $19, $14, $15, $19                       ;; 19:670D

Data_019_6711::
    db   $98, $02, $49, $03, $98, $22, $49, $03   ;; 19:6711
    db   $98, $42, $49, $05, $98, $62, $49, $02   ;; 19:6719

Data_019_6721::
    db   $98, $02, $49, $03, $98, $22, $49, $03   ;; 19:6721
    db   $98, $42, $49, $02, $98, $62, $49, $02   ;; 19:6729

Data_019_6731::
    db   $98, $02, $49, $03, $98, $22, $49, $02   ;; 19:6731
    db   $98, $42, $49, $02, $98, $62, $49, $02   ;; 19:6739

Data_019_6741::
    db   $98, $02, $49, $02, $98, $22, $49, $02   ;; 19:6741
    db   $98, $42, $49, $02, $98, $62, $49, $02   ;; 19:6749

Data_019_6751::
    db   $98, $82, $09, $02, $02, $02, $02, $02   ;; 19:6751
    db   $02, $02, $02, $02, $02, $98, $A2, $09   ;; 19:6759
    db   $02, $02, $02, $02, $02, $02, $02, $02   ;; 19:6761
    db   $02, $02, $98, $C2, $09, $02, $02, $02   ;; 19:6769
    db   $02, $02, $02, $02, $02, $02, $02, $98   ;; 19:6771
    db   $E2, $09, $01, $01, $01, $01, $01, $01   ;; 19:6779
    db   $01, $01, $01, $01                       ;; 19:6781

Data_019_6785::
    db   $98, $82, $09, $02, $02, $02, $02, $02   ;; 19:6785
    db   $02, $02, $02, $02, $02, $98, $A2, $09   ;; 19:678D
    db   $02, $02, $02, $02, $02, $02, $02, $02   ;; 19:6795
    db   $02, $02, $98, $C2, $09, $01, $01, $01   ;; 19:679D
    db   $01, $01, $01, $01, $01, $01, $01, $98   ;; 19:67A5
    db   $E2, $09, $01, $00, $00, $01, $01, $01   ;; 19:67AD
    db   $01, $00, $00, $01                       ;; 19:67B5

Data_019_67B9::
    db   $98, $82, $09, $02, $02, $02, $02, $02   ;; 19:67B9
    db   $02, $02, $02, $02, $02, $98, $A2, $09   ;; 19:67C1
    db   $01, $01, $01, $01, $01, $01, $01, $01   ;; 19:67C9
    db   $01, $01, $98, $C2, $09, $01, $00, $00   ;; 19:67D1
    db   $01, $01, $01, $01, $00, $00, $01, $98   ;; 19:67D9
    db   $E2, $09, $01, $00, $00, $01, $01, $01   ;; 19:67E1
    db   $01, $00, $00, $01                       ;; 19:67E9

Data_019_67ED::
    db   $98, $82, $09, $01, $01, $01, $01, $01   ;; 19:67ED
    db   $01, $01, $01, $01, $01, $98, $A2, $09   ;; 19:67F5
    db   $01, $00, $00, $01, $01, $01, $01, $00   ;; 19:67FD
    db   $00, $01, $98, $C2, $09, $01, $00, $00   ;; 19:6805
    db   $01, $01, $01, $01, $00, $00, $01, $98   ;; 19:680D
    db   $E2, $09, $01, $00, $00, $01, $01, $01   ;; 19:6815
    db   $01, $00, $00, $01                       ;; 19:681D

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
    ldh  a, [hMapRoom]                            ;; 19:6841 $F0 $F6
    cp   ROOM_OW_EAGLES_TOWER                     ;; 19:6843 $FE $0E
    jp   z, AnimateEaglesTowerOpening             ;; 19:6845 $CA $F8 $61

    ld   a, $02                                   ;; 19:6848 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:684A $E0 $A1
    ld   [wC167], a                               ;; 19:684C $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ;; 19:684F $F0 $F0
    JP_TABLE                                      ;; 19:6851
._00 dw func_019_685A                             ;; 19:6852
._01 dw func_019_686B                             ;; 19:6854
._02 dw func_019_6894                             ;; 19:6856
._03 dw func_019_68F9                             ;; 19:6858

func_019_685A::
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ;; 19:685A $3E $04
    ldh  [hNoiseSfx], a                           ;; 19:685C $E0 $F4
    call GetEntityTransitionCountdown             ;; 19:685E $CD $05 $0C
    ld   [hl], $AC                                ;; 19:6861 $36 $AC
    call GetEntityPrivateCountdown1               ;; 19:6863 $CD $00 $0C
    ld   [hl], $AC                                ;; 19:6866 $36 $AC
    call IncrementEntityState                     ;; 19:6868 $CD $12 $3B

func_019_686B::
    call GetEntityTransitionCountdown             ;; 19:686B $CD $05 $0C
    cp   $A0                                      ;; 19:686E $FE $A0
    jr   nz, .jr_6877                             ;; 19:6870 $20 $05

    ld   hl, hNoiseSfx                            ;; 19:6872 $21 $F4 $FF
    ld   [hl], NOISE_SFX_OPEN_FACE_SHRINE         ;; 19:6875 $36 $2E

.jr_6877
    and  a                                        ;; 19:6877 $A7
    jr   nz, .jr_6881                             ;; 19:6878 $20 $07

    ld   a, JINGLE_POOF                           ;; 19:687A $3E $2F
    ldh  [hJingle], a                             ;; 19:687C $E0 $F2
    call IncrementEntityState                     ;; 19:687E $CD $12 $3B

.jr_6881
    ld   e, $01                                   ;; 19:6881 $1E $01
    and  $04                                      ;; 19:6883 $E6 $04
    jr   z, .jr_6889                              ;; 19:6885 $28 $02

    ld   e, $FE                                   ;; 19:6887 $1E $FE

.jr_6889
    ld   a, e                                     ;; 19:6889 $7B
    ld   [wScreenShakeHorizontal], a              ;; 19:688A $EA $55 $C1
    call GetEntityPrivateCountdown1               ;; 19:688D $CD $00 $0C
    ret  nz                                       ;; 19:6890 $C0

    jp   label_019_6A4F                           ;; 19:6891 $C3 $4F $6A

func_019_6894::
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6894 $21 $B0 $C2
    add  hl, bc                                   ;; 19:6897 $09
    ld   a, [hl]                                  ;; 19:6898 $7E
    push af                                       ;; 19:6899 $F5
    rla                                           ;; 19:689A $17
    and  $06                                      ;; 19:689B $E6 $06
    ld   e, a                                     ;; 19:689D $5F
    ld   d, b                                     ;; 19:689E $50
    ld   hl, Data_019_6821                        ;; 19:689F $21 $21 $68
    add  hl, de                                   ;; 19:68A2 $19
    ld   a, [hl+]                                 ;; 19:68A3 $2A
    ld   d, [hl]                                  ;; 19:68A4 $56
    ld   e, a                                     ;; 19:68A5 $5F
    push bc                                       ;; 19:68A6 $C5
    ld   c, $34                                   ;; 19:68A7 $0E $34
    ld   hl, wDrawCommand                         ;; 19:68A9 $21 $01 $D6

jr_019_68AC:
    ld   a, [de]                                  ;; 19:68AC $1A
    cp   $98                                      ;; 19:68AD $FE $98
    jr   nz, .jr_68BA                             ;; 19:68AF $20 $09

    ldh  a, [hBaseScrollY]                        ;; 19:68B1 $F0 $97
    and  a                                        ;; 19:68B3 $A7
    ld   a, $98                                   ;; 19:68B4 $3E $98
    jr   z, .jr_68BA                              ;; 19:68B6 $28 $02

    ld   a, $9A                                   ;; 19:68B8 $3E $9A

.jr_68BA
    inc  de                                       ;; 19:68BA $13
    ld   [hl+], a                                 ;; 19:68BB $22
    dec  c                                        ;; 19:68BC $0D
    jr   nz, jr_019_68AC                          ;; 19:68BD $20 $ED

    ld   [hl], $00                                ;; 19:68BF $36 $00
    pop  bc                                       ;; 19:68C1 $C1
    pop  af                                       ;; 19:68C2 $F1
    push af                                       ;; 19:68C3 $F5
    rla                                           ;; 19:68C4 $17
    and  $06                                      ;; 19:68C5 $E6 $06
    ld   e, a                                     ;; 19:68C7 $5F
    ld   d, b                                     ;; 19:68C8 $50
    ld   hl, Data_019_6831                        ;; 19:68C9 $21 $31 $68
    add  hl, de                                   ;; 19:68CC $19
    ld   a, [hl+]                                 ;; 19:68CD $2A
    ld   d, [hl]                                  ;; 19:68CE $56
    ld   e, a                                     ;; 19:68CF $5F
    push bc                                       ;; 19:68D0 $C5
    ld   c, $10                                   ;; 19:68D1 $0E $10
    ld   hl, wDrawCommandVRAM1                    ;; 19:68D3 $21 $91 $DC

jr_019_68D6:
    ld   a, [de]                                  ;; 19:68D6 $1A
    cp   $98                                      ;; 19:68D7 $FE $98
    jr   nz, .jr_68E4                             ;; 19:68D9 $20 $09

    ldh  a, [hBaseScrollY]                        ;; 19:68DB $F0 $97
    and  a                                        ;; 19:68DD $A7
    ld   a, $98                                   ;; 19:68DE $3E $98
    jr   z, .jr_68E4                              ;; 19:68E0 $28 $02

    ld   a, $9A                                   ;; 19:68E2 $3E $9A

.jr_68E4
    inc  de                                       ;; 19:68E4 $13
    ld   [hl+], a                                 ;; 19:68E5 $22
    dec  c                                        ;; 19:68E6 $0D
    jr   nz, jr_019_68D6                          ;; 19:68E7 $20 $ED

    ld   [hl], $00                                ;; 19:68E9 $36 $00
    pop  bc                                       ;; 19:68EB $C1
    pop  af                                       ;; 19:68EC $F1
    cp   $03                                      ;; 19:68ED $FE $03
    jr   nz, .jr_68F6                             ;; 19:68EF $20 $05

    ldh  a, [hNextDefaultMusicTrack]              ;; 19:68F1 $F0 $BF
    ld   [wMusicTrackToPlay], a                   ;; 19:68F3 $EA $68 $D3

.jr_68F6
    jp   IncrementEntityState                     ;; 19:68F6 $C3 $12 $3B

func_019_68F9::
    push bc                                       ;; 19:68F9 $C5
    ld   hl, wEntitiesPrivateState1Table          ;; 19:68FA $21 $B0 $C2
    add  hl, bc                                   ;; 19:68FD $09
    ld   a, [hl]                                  ;; 19:68FE $7E
    rla                                           ;; 19:68FF $17
    and  $06                                      ;; 19:6900 $E6 $06
    ld   e, a                                     ;; 19:6902 $5F
    ld   d, b                                     ;; 19:6903 $50
    ld   hl, Data_019_6829                        ;; 19:6904 $21 $29 $68
    add  hl, de                                   ;; 19:6907 $19
    ld   a, [hl+]                                 ;; 19:6908 $2A
    ld   d, [hl]                                  ;; 19:6909 $56
    ld   e, a                                     ;; 19:690A $5F
    ld   c, $34                                   ;; 19:690B $0E $34
    ld   hl, wDrawCommand                         ;; 19:690D $21 $01 $D6

jr_019_6910:
    ld   a, [de]                                  ;; 19:6910 $1A
    cp   $98                                      ;; 19:6911 $FE $98
    jr   nz, .jr_691E                             ;; 19:6913 $20 $09

    ldh  a, [hBaseScrollY]                        ;; 19:6915 $F0 $97
    and  a                                        ;; 19:6917 $A7
    ld   a, $98                                   ;; 19:6918 $3E $98
    jr   z, .jr_691E                              ;; 19:691A $28 $02

    ld   a, $9A                                   ;; 19:691C $3E $9A

.jr_691E
    inc  de                                       ;; 19:691E $13
    ld   [hl+], a                                 ;; 19:691F $22
    dec  c                                        ;; 19:6920 $0D
    jr   nz, jr_019_6910                          ;; 19:6921 $20 $ED

    ld   [hl], $00                                ;; 19:6923 $36 $00
    pop  bc                                       ;; 19:6925 $C1
    push bc                                       ;; 19:6926 $C5
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6927 $21 $B0 $C2
    add  hl, bc                                   ;; 19:692A $09
    ld   a, [hl]                                  ;; 19:692B $7E
    rla                                           ;; 19:692C $17
    and  $06                                      ;; 19:692D $E6 $06
    ld   e, a                                     ;; 19:692F $5F
    ld   d, b                                     ;; 19:6930 $50
    ld   hl, Data_019_6839                        ;; 19:6931 $21 $39 $68
    add  hl, de                                   ;; 19:6934 $19
    ld   a, [hl+]                                 ;; 19:6935 $2A
    ld   d, [hl]                                  ;; 19:6936 $56
    ld   e, a                                     ;; 19:6937 $5F
    ld   c, $34                                   ;; 19:6938 $0E $34
    ld   hl, wDrawCommandVRAM1                    ;; 19:693A $21 $91 $DC

jr_019_693D:
    ld   a, [de]                                  ;; 19:693D $1A
    cp   $98                                      ;; 19:693E $FE $98
    jr   nz, .jr_694B                             ;; 19:6940 $20 $09

    ldh  a, [hBaseScrollY]                        ;; 19:6942 $F0 $97
    and  a                                        ;; 19:6944 $A7
    ld   a, $98                                   ;; 19:6945 $3E $98
    jr   z, .jr_694B                              ;; 19:6947 $28 $02

    ld   a, $9A                                   ;; 19:6949 $3E $9A

.jr_694B
    inc  de                                       ;; 19:694B $13
    ld   [hl+], a                                 ;; 19:694C $22
    dec  c                                        ;; 19:694D $0D
    jr   nz, jr_019_693D                          ;; 19:694E $20 $ED

    ld   [hl], $00                                ;; 19:6950 $36 $00
    pop  bc                                       ;; 19:6952 $C1
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6953 $21 $B0 $C2
    add  hl, bc                                   ;; 19:6956 $09
    ld   a, [hl]                                  ;; 19:6957 $7E
    inc  a                                        ;; 19:6958 $3C
    ld   [hl], a                                  ;; 19:6959 $77
    cp   $04                                      ;; 19:695A $FE $04
    jr   z, .jr_6961                              ;; 19:695C $28 $03

    jp   label_019_6A3C                           ;; 19:695E $C3 $3C $6A

.jr_6961
    ld   hl, wRoomObjects + $01                   ;; 19:6961 $21 $12 $D7
    ld   a, $B3                                   ;; 19:6964 $3E $B3
    ld   [hl+], a                                 ;; 19:6966 $22
    ld   a, $B3                                   ;; 19:6967 $3E $B3
    ld   [hl+], a                                 ;; 19:6969 $22
    ld   a, $B3                                   ;; 19:696A $3E $B3
    ld   [hl+], a                                 ;; 19:696C $22
    ld   a, $B3                                   ;; 19:696D $3E $B3
    ld   [hl+], a                                 ;; 19:696F $22
    ld   a, $B3                                   ;; 19:6970 $3E $B3
    ld   [hl+], a                                 ;; 19:6972 $22
    ld   hl, wRoomObjects + $01                   ;; 19:6973 $21 $12 $D7
    ld   a, $99                                   ;; 19:6976 $3E $99
    call BackupObjectInRAM2                       ;; 19:6978 $CD $2F $0B
    inc  hl                                       ;; 19:697B $23
    ld   a, $99                                   ;; 19:697C $3E $99
    call BackupObjectInRAM2                       ;; 19:697E $CD $2F $0B
    inc  hl                                       ;; 19:6981 $23
    ld   a, $99                                   ;; 19:6982 $3E $99
    call BackupObjectInRAM2                       ;; 19:6984 $CD $2F $0B
    inc  hl                                       ;; 19:6987 $23
    ld   a, $99                                   ;; 19:6988 $3E $99
    call BackupObjectInRAM2                       ;; 19:698A $CD $2F $0B
    inc  hl                                       ;; 19:698D $23
    ld   a, $99                                   ;; 19:698E $3E $99
    call BackupObjectInRAM2                       ;; 19:6990 $CD $2F $0B
    ld   hl, wRoomObjects + $11                   ;; 19:6993 $21 $22 $D7
    ld   a, $B3                                   ;; 19:6996 $3E $B3
    ld   [hl+], a                                 ;; 19:6998 $22
    ld   a, $B3                                   ;; 19:6999 $3E $B3
    ld   [hl+], a                                 ;; 19:699B $22
    ld   a, $B3                                   ;; 19:699C $3E $B3
    ld   [hl+], a                                 ;; 19:699E $22
    ld   a, $B3                                   ;; 19:699F $3E $B3
    ld   [hl+], a                                 ;; 19:69A1 $22
    ld   a, $B3                                   ;; 19:69A2 $3E $B3
    ld   [hl+], a                                 ;; 19:69A4 $22
    ld   hl, wRoomObjects + $11                   ;; 19:69A5 $21 $22 $D7
    ld   a, $99                                   ;; 19:69A8 $3E $99
    call BackupObjectInRAM2                       ;; 19:69AA $CD $2F $0B
    inc  hl                                       ;; 19:69AD $23
    ld   a, $99                                   ;; 19:69AE $3E $99
    call BackupObjectInRAM2                       ;; 19:69B0 $CD $2F $0B
    inc  hl                                       ;; 19:69B3 $23
    ld   a, $99                                   ;; 19:69B4 $3E $99
    call BackupObjectInRAM2                       ;; 19:69B6 $CD $2F $0B
    inc  hl                                       ;; 19:69B9 $23
    ld   a, $99                                   ;; 19:69BA $3E $99
    call BackupObjectInRAM2                       ;; 19:69BC $CD $2F $0B
    inc  hl                                       ;; 19:69BF $23
    ld   a, $99                                   ;; 19:69C0 $3E $99
    call BackupObjectInRAM2                       ;; 19:69C2 $CD $2F $0B
    ld   hl, wRoomObjects + $21                   ;; 19:69C5 $21 $32 $D7
    ld   a, $AD                                   ;; 19:69C8 $3E $AD
    ld   [hl+], a                                 ;; 19:69CA $22
    ld   a, $B1                                   ;; 19:69CB $3E $B1
    ld   [hl+], a                                 ;; 19:69CD $22
    ld   a, $E7                                   ;; 19:69CE $3E $E7
    ld   [hl+], a                                 ;; 19:69D0 $22
    ld   a, $AD                                   ;; 19:69D1 $3E $AD
    ld   [hl+], a                                 ;; 19:69D3 $22
    ld   a, $B1                                   ;; 19:69D4 $3E $B1
    ld   [hl+], a                                 ;; 19:69D6 $22
    ld   hl, wRoomObjects + $21                   ;; 19:69D7 $21 $32 $D7
    ld   a, $99                                   ;; 19:69DA $3E $99
    call BackupObjectInRAM2                       ;; 19:69DC $CD $2F $0B
    inc  hl                                       ;; 19:69DF $23
    ld   a, $99                                   ;; 19:69E0 $3E $99
    call BackupObjectInRAM2                       ;; 19:69E2 $CD $2F $0B
    inc  hl                                       ;; 19:69E5 $23
    ld   a, $99                                   ;; 19:69E6 $3E $99
    call BackupObjectInRAM2                       ;; 19:69E8 $CD $2F $0B
    inc  hl                                       ;; 19:69EB $23
    ld   a, $99                                   ;; 19:69EC $3E $99
    call BackupObjectInRAM2                       ;; 19:69EE $CD $2F $0B
    inc  hl                                       ;; 19:69F1 $23
    ld   a, $99                                   ;; 19:69F2 $3E $99
    call BackupObjectInRAM2                       ;; 19:69F4 $CD $2F $0B
    ld   hl, wRoomObjects + $31                   ;; 19:69F7 $21 $42 $D7
    ld   a, $AE                                   ;; 19:69FA $3E $AE
    ld   [hl+], a                                 ;; 19:69FC $22
    ld   a, $B2                                   ;; 19:69FD $3E $B2
    ld   [hl+], a                                 ;; 19:69FF $22
    ld   a, $E3                                   ;; 19:6A00 $3E $E3
    ld   [hl+], a                                 ;; 19:6A02 $22
    ld   a, $AE                                   ;; 19:6A03 $3E $AE
    ld   [hl+], a                                 ;; 19:6A05 $22
    ld   a, $B2                                   ;; 19:6A06 $3E $B2
    ld   [hl+], a                                 ;; 19:6A08 $22
    ld   hl, wRoomObjects + $31                   ;; 19:6A09 $21 $42 $D7
    ld   a, $99                                   ;; 19:6A0C $3E $99
    call BackupObjectInRAM2                       ;; 19:6A0E $CD $2F $0B
    inc  hl                                       ;; 19:6A11 $23
    ld   a, $99                                   ;; 19:6A12 $3E $99
    call BackupObjectInRAM2                       ;; 19:6A14 $CD $2F $0B
    inc  hl                                       ;; 19:6A17 $23
    ld   a, $99                                   ;; 19:6A18 $3E $99
    call BackupObjectInRAM2                       ;; 19:6A1A $CD $2F $0B
    inc  hl                                       ;; 19:6A1D $23
    ld   a, $99                                   ;; 19:6A1E $3E $99
    call BackupObjectInRAM2                       ;; 19:6A20 $CD $2F $0B
    inc  hl                                       ;; 19:6A23 $23
    ld   a, $99                                   ;; 19:6A24 $3E $99
    call BackupObjectInRAM2                       ;; 19:6A26 $CD $2F $0B
    call func_019_7F0E                            ;; 19:6A29 $CD $0E $7F
    set  4, [hl]                                  ;; 19:6A2C $CB $E6
    xor  a                                        ;; 19:6A2E $AF
    ld   [wScreenShakeHorizontal], a              ;; 19:6A2F $EA $55 $C1
    ld   [wC167], a                               ;; 19:6A32 $EA $67 $C1
    ld   a, JINGLE_PUZZLE_SOLVED                  ;; 19:6A35 $3E $02
    ldh  [hJingle], a                             ;; 19:6A37 $E0 $F2
    jp   ClearEntityStatus_19                     ;; 19:6A39 $C3 $61 $7E

label_019_6A3C:
    call IncrementEntityState                     ;; 19:6A3C $CD $12 $3B
    ld   [hl], $01                                ;; 19:6A3F $36 $01
    call GetEntityTransitionCountdown             ;; 19:6A41 $CD $05 $0C
    ld   [hl], $30                                ;; 19:6A44 $36 $30
    ret                                           ;; 19:6A46 $C9

Data_019_6A47::
    db   $18, $58, $28, $48, $38, $20, $50, $40

label_019_6A4F:
    ldh  a, [hFrameCounter]                       ;; 19:6A4F $F0 $E7
    and  $03                                      ;; 19:6A51 $E6 $03
    jr   nz, ret_019_6A8C                         ;; 19:6A53 $20 $37

    ld   a, ENTITY_SMASHABLE_PILLAR               ;; 19:6A55 $3E $A7
    call SpawnNewEntity_trampoline                ;; 19:6A57 $CD $86 $3B
    jr   c, ret_019_6A8C                          ;; 19:6A5A $38 $30

    push bc                                       ;; 19:6A5C $C5
    call GetRandomByte                            ;; 19:6A5D $CD $0D $28
    and  $07                                      ;; 19:6A60 $E6 $07
    ld   c, a                                     ;; 19:6A62 $4F
    ld   hl, Data_019_6A47                        ;; 19:6A63 $21 $47 $6A
    add  hl, bc                                   ;; 19:6A66 $09
    ld   a, [hl]                                  ;; 19:6A67 $7E
    ld   hl, wEntitiesPosXTable                   ;; 19:6A68 $21 $00 $C2
    add  hl, de                                   ;; 19:6A6B $19
    ld   [hl], a                                  ;; 19:6A6C $77

.jr_6A6D
    call GetRandomByte                            ;; 19:6A6D $CD $0D $28
    and  $07                                      ;; 19:6A70 $E6 $07
    add  $47                                      ;; 19:6A72 $C6 $47
    ld   hl, wEntitiesPosYTable                   ;; 19:6A74 $21 $10 $C2
    add  hl, de                                   ;; 19:6A77 $19
    ld   [hl], a                                  ;; 19:6A78 $77
    pop  bc                                       ;; 19:6A79 $C1
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 19:6A7A $21 $40 $C3
    add  hl, de                                   ;; 19:6A7D $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 19:6A7E $36 $C2
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:6A80 $21 $E0 $C2
    add  hl, de                                   ;; 19:6A83 $19
    ld   [hl], $10                                ;; 19:6A84 $36 $10
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6A86 $21 $B0 $C2
    add  hl, de                                   ;; 19:6A89 $19
    ld   [hl], $01                                ;; 19:6A8A $36 $01

ret_019_6A8C:
    ret                                           ;; 19:6A8C $C9
