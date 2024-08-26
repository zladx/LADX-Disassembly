Data_019_4A50::
    db   $80, $26, $95, $63, $20, $3A, $75, $6B, $A0, $51, $35, $73, $08, $7D, $18, $7F
    db   $AD, $78, $F9, $7E, $50, $5C, $DA, $76, $12, $40, $BB, $6A, $15, $30, $BC, $66
    db   $17, $14, $BD, $5E, $D7, $04, $FD, $56, $37, $05, $1D, $57, $97, $09, $3D, $5B
    db   $F5, $09, $5C, $5B, $10, $0A, $5A, $5B, $4B, $06, $79, $57, $A0, $02, $95, $57

func_019_4A90::
    ldh  a, [hIsGBC]                              ;; 19:4A90 $F0 $FE
    and  a                                        ;; 19:4A92 $A7
    ret  z                                        ;; 19:4A93 $C8

    ld   a, [wPaletteUnknownE]                    ;; 19:4A94 $FA $D5 $DD
    ld   a, [wTransitionSequenceCounter]          ;; 19:4A97 $FA $6B $C1
    cp   $04                                      ;; 19:4A9A $FE $04
    ret  nz                                       ;; 19:4A9C $C0

    ldh  a, [hFrameCounter]                       ;; 19:4A9D $F0 $E7
    srl  a                                        ;; 19:4A9F $CB $3F
    and  $3C                                      ;; 19:4AA1 $E6 $3C
    ld   e, a                                     ;; 19:4AA3 $5F
    ld   d, $00                                   ;; 19:4AA4 $16 $00
    ld   hl, Data_019_4A50                        ;; 19:4AA6 $21 $50 $4A
    add  hl, de                                   ;; 19:4AA9 $19
    ld   de, wObjPal7 + 2*2                       ;; 19:4AAA $11 $84 $DC

.loop_4AAD
    ld   a, [hl+]                                 ;; 19:4AAD $2A
    ld   [de], a                                  ;; 19:4AAE $12
    inc  de                                       ;; 19:4AAF $13
    ld   a, e                                     ;; 19:4AB0 $7B
    and  $03                                      ;; 19:4AB1 $E6 $03
    jr   nz, .loop_4AAD                           ;; 19:4AB3 $20 $F8

    ld   a, $02                                   ;; 19:4AB5 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 19:4AB7 $EA $D1 $DD
    ret                                           ;; 19:4ABA $C9

Data_019_4ABB::
    db   $60, $78, $78, $60, $40, $28, $28, $40

Data_019_4AC3::
    db   $20, $38, $58, $78, $78, $58, $38, $20

EggSongEventEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 19:4ACB $21 $B0 $C2
    add  hl, bc                                   ;; 19:4ACE $09
    ld   a, [hl]                                  ;; 19:4ACF $7E
    and  a                                        ;; 19:4AD0 $A7
    jp   nz, label_019_4BCC                       ;; 19:4AD1 $C2 $CC $4B

    ld   a, c                                     ;; 19:4AD4 $79
    ld   [wD461], a                               ;; 19:4AD5 $EA $61 $D4
    ldh  a, [hRoomStatus]                         ;; 19:4AD8 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 19:4ADA $E6 $10
    jp   nz, ClearEntityStatus_19                 ;; 19:4ADC $C2 $61 $7E

    ldh  a, [hActiveEntityState]                  ;; 19:4ADF $F0 $F0
    JP_TABLE
._00 dw EggSongEventState0Handler
._01 dw EggSongEventState1Handler
._02 dw EggSongEventState2Handler
._03 dw EggSongEventState3Handler
._04 dw EggSongEventState4Handler

EggSongEventState0Handler::
    ld   a, [wOcarinaSongFlags]                   ;; 19:4AEC $FA $49 $DB
    and  BALLAD_OF_THE_WIND_FISH_FLAG             ;; 19:4AEF $E6 $04
    ret  z                                        ;; 19:4AF1 $C8

    ld   a, [wSelectedSongIndex]                  ;; 19:4AF2 $FA $4A $DB
    cp   $00                                      ;; 19:4AF5 $FE $00
    ret  nz                                       ;; 19:4AF7 $C0

    ld   a, [wLinkPlayingOcarinaCountdown]        ;; 19:4AF8 $FA $66 $C1
    cp   $01                                      ;; 19:4AFB $FE $01

.jr_4AFD
    ret  nz                                       ;; 19:4AFD $C0

    call label_27F2                               ;; 19:4AFE $CD $F2 $27
    call GetEntityTransitionCountdown             ;; 19:4B01 $CD $05 $0C
    ld   [hl], $30                                ;; 19:4B04 $36 $30
    xor  a                                        ;; 19:4B06 $AF
    ld   [wC5A3], a                               ;; 19:4B07 $EA $A3 $C5
    jp   IncrementEntityState                     ;; 19:4B0A $C3 $12 $3B

EggSongEventState1Handler::
    ld   a, $02                                   ;; 19:4B0D $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4B0F $E0 $A1
    ld   [wC167], a                               ;; 19:4B11 $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 19:4B14 $CD $05 $0C
    ret  nz                                       ;; 19:4B17 $C0

    jp   IncrementEntityState                     ;; 19:4B18 $C3 $12 $3B

EggSongEventState2Handler::
    ld   a, $02                                   ;; 19:4B1B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4B1D $E0 $A1
    call GetEntityTransitionCountdown             ;; 19:4B1F $CD $05 $0C
    ret  nz                                       ;; 19:4B22 $C0

    ld   hl, wEntitiesInertiaTable                ;; 19:4B23 $21 $D0 $C3
    add  hl, bc                                   ;; 19:4B26 $09
    ld   a, [hl]                                  ;; 19:4B27 $7E
    inc  [hl]                                     ;; 19:4B28 $34
    cp   $08                                      ;; 19:4B29 $FE $08
    jr   nz, .jr_4B36                             ;; 19:4B2B $20 $09

    ld   [hl], b                                  ;; 19:4B2D $70
    call GetEntityTransitionCountdown             ;; 19:4B2E $CD $05 $0C
    ld   [hl], $40                                ;; 19:4B31 $36 $40
    jp   IncrementEntityState                     ;; 19:4B33 $C3 $12 $3B

.jr_4B36
    call func_019_4B6E                            ;; 19:4B36 $CD $6E $4B
    call GetEntityTransitionCountdown             ;; 19:4B39 $CD $05 $0C
    ld   [hl], $20                                ;; 19:4B3C $36 $20
    ret                                           ;; 19:4B3E $C9

EggSongEventState3Handler::
    ld   a, $02                                   ;; 19:4B3F $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4B41 $E0 $A1
    call GetEntityTransitionCountdown             ;; 19:4B43 $CD $05 $0C
    ret  nz                                       ;; 19:4B46 $C0

    ld   e, MUSIC_EGG_BALLAD_DEFAULT              ;; 19:4B47 $1E $41
    ld   hl, wHasInstrument3                      ;; 19:4B49 $21 $67 $DB


.loop_4B4C
    ld   a, [hl+]                                 ;; 19:4B4C $2A
    and  $02                                      ;; 19:4B4D $E6 $02
    jr   z, .jr_4B57                              ;; 19:4B4F $28 $06

    inc  e                                        ;; 19:4B51 $1C
    ld   a, e                                     ;; 19:4B52 $7B
    cp   MUSIC_EGG_BALLAD_ALL                     ;; 19:4B53 $FE $47
    jr   nz, .loop_4B4C                           ;; 19:4B55 $20 $F5

.jr_4B57
    ld   a, e                                     ;; 19:4B57 $7B
    ld   [wMusicTrackToPlay], a                   ;; 19:4B58 $EA $68 $D3
    ld   [wD465], a                               ;; 19:4B5B $EA $65 $D4
    ld   a, $FF                                   ;; 19:4B5E $3E $FF
    ld   [wLinkPlayingOcarinaCountdown], a        ;; 19:4B60 $EA $66 $C1
    xor  a                                        ;; 19:4B63 $AF
    ld   [wD210], a                               ;; 19:4B64 $EA $10 $D2
    ld   [wD211], a                               ;; 19:4B67 $EA $11 $D2
    jp   IncrementEntityState                     ;; 19:4B6A $C3 $12 $3B

EggSongEventState4Handler::
    ret                                           ;; 19:4B6D $C9

func_019_4B6E::
    ldh  [hMultiPurposeG], a                      ;; 19:4B6E $E0 $E8
    ld   e, a                                     ;; 19:4B70 $5F
    ld   d, b                                     ;; 19:4B71 $50
    ld   hl, wHasInstrument1                      ;; 19:4B72 $21 $65 $DB
    add  hl, de                                   ;; 19:4B75 $19
    ld   a, [hl]                                  ;; 19:4B76 $7E
    and  $02                                      ;; 19:4B77 $E6 $02
    jr   z, .ret_4BAB                             ;; 19:4B79 $28 $30

    ld   a, ENTITY_EGG_SONG_EVENT                 ;; 19:4B7B $3E $DE
    call SpawnNewEntity_trampoline                ;; 19:4B7D $CD $86 $3B
    ret  c                                        ;; 19:4B80 $D8

    ld   a, NOISE_SFX_RUMBLE2                     ;; 19:4B81 $3E $2B
    ldh  [hNoiseSfx], a                           ;; 19:4B83 $E0 $F4
    push bc                                       ;; 19:4B85 $C5
    ldh  a, [hMultiPurposeG]                      ;; 19:4B86 $F0 $E8
    ld   c, a                                     ;; 19:4B88 $4F
    ld   hl, Data_019_4ABB                        ;; 19:4B89 $21 $BB $4A
    add  hl, bc                                   ;; 19:4B8C $09
    ld   a, [hl]                                  ;; 19:4B8D $7E
    ld   hl, wEntitiesPosXTable                   ;; 19:4B8E $21 $00 $C2
    add  hl, de                                   ;; 19:4B91 $19
    add  $08                                      ;; 19:4B92 $C6 $08
    ld   [hl], a                                  ;; 19:4B94 $77
    ld   hl, Data_019_4AC3                        ;; 19:4B95 $21 $C3 $4A
    add  hl, bc                                   ;; 19:4B98 $09
    ld   a, [hl]                                  ;; 19:4B99 $7E
    ld   hl, wEntitiesPosYTable                   ;; 19:4B9A $21 $10 $C2
    add  hl, de                                   ;; 19:4B9D $19
    ld   [hl], a                                  ;; 19:4B9E $77
    ld   a, c                                     ;; 19:4B9F $79
    ld   hl, wEntitiesSpriteVariantTable          ;; 19:4BA0 $21 $B0 $C3
    add  hl, de                                   ;; 19:4BA3 $19
    ld   [hl], a                                  ;; 19:4BA4 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 19:4BA5 $21 $B0 $C2
    add  hl, de                                   ;; 19:4BA8 $19
    inc  [hl]                                     ;; 19:4BA9 $34
    pop  bc                                       ;; 19:4BAA $C1

.ret_4BAB
    ret                                           ;; 19:4BAB $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown063SpriteVariants:: ;; 19:4BAC
.variant0
    db $50, $06
    db $52, $06
.variant1
    db $54, $06
    db $56, $06
.variant2
    db $58, $06
    db $5A, $06
.variant3
    db $5C, $06
    db $5E, $06
.variant4
    db $60, $06
    db $62, $06
.variant5
    db $64, $06
    db $66, $06
.variant6
    db $68, $06
    db $6A, $06
.variant7
    db $6C, $06
    db $6E, $06

label_019_4BCC::
    ld   hl, wEntitiesPrivateState1Table          ;; 19:4BCC $21 $B0 $C2
    add  hl, bc
    ld   a, [hl]                                  ;; 19:4BD0 $7E
    cp   $02                                      ;; 19:4BD1 $FE $02
    jp   z, label_019_4CFF                        ;; 19:4BD3 $CA $FF $4C

    ldh  a, [hActiveEntityState]                  ;; 19:4BD6 $F0 $F0
    and  a                                        ;; 19:4BD8 $A7
    jr   nz, jr_019_4C21                          ;; 19:4BD9 $20 $46

    call func_019_4A90                            ;; 19:4BDB $CD $90 $4A
    ld   a, [wC5A3]                               ;; 19:4BDE $FA $A3 $C5
    cp   $03                                      ;; 19:4BE1 $FE $03
    jr   z, .jr_4BF7                              ;; 19:4BE3 $28 $12

    ld   hl, hActiveEntitySpriteVariant           ;; 19:4BE5 $21 $F1 $FF
    ldh  a, [hFrameCounter]                       ;; 19:4BE8 $F0 $E7
    rra                                           ;; 19:4BEA $1F
    rra                                           ;; 19:4BEB $1F
    rra                                           ;; 19:4BEC $1F
    xor  [hl]                                     ;; 19:4BED $AE
    and  $03                                      ;; 19:4BEE $E6 $03
    ret  z                                        ;; 19:4BF0 $C8

    ld   de, Unknown063SpriteVariants             ;; 19:4BF1 $11 $AC $4B
    jp   RenderActiveEntitySpritesPair            ;; 19:4BF4 $C3 $C0 $3B

.jr_4BF7
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:4BF7 $F0 $F1
    cp   $07                                      ;; 19:4BF9 $FE $07
    jp   nz, ClearEntityStatus_19                 ;; 19:4BFB $C2 $61 $7E

    ld   e, $08                                   ;; 19:4BFE $1E $08
    ld   hl, wHasInstrument1                      ;; 19:4C00 $21 $65 $DB

.loop_4C03
    ld   a, [hl+]                                 ;; 19:4C03 $2A
    and  $02                                      ;; 19:4C04 $E6 $02
    jr   z, .jr_4C1A                              ;; 19:4C06 $28 $12

    dec  e                                        ;; 19:4C08 $1D
    jr   nz, .loop_4C03                           ;; 19:4C09 $20 $F8

    ldh  a, [hRoomStatus]                         ;; 19:4C0B $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 19:4C0D $E6 $10
    jp   nz, ClearEntityStatus_19                 ;; 19:4C0F $C2 $61 $7E

    call GetEntityTransitionCountdown             ;; 19:4C12 $CD $05 $0C
    ld   [hl], $A0                                ;; 19:4C15 $36 $A0
    jp   IncrementEntityState                     ;; 19:4C17 $C3 $12 $3B

.jr_4C1A
    xor  a                                        ;; 19:4C1A $AF
    ld   [wC5A3], a                               ;; 19:4C1B $EA $A3 $C5
    jp   ClearEntityStatus_19                     ;; 19:4C1E $C3 $61 $7E

jr_019_4C21:
    ld   a, $02                                   ;; 19:4C21 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4C23 $E0 $A1
    ld   [wC167], a                               ;; 19:4C25 $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 19:4C28 $CD $05 $0C
    jp   nz, label_019_4CEA                       ;; 19:4C2B $C2 $EA $4C

    ld   [wScreenShakeHorizontal], a              ;; 19:4C2E $EA $55 $C1
    ld   [wC5A3], a                               ;; 19:4C31 $EA $A3 $C5
    ld   hl, wRoomObjects + $25                   ;; 19:4C34 $21 $36 $D7
    ld   a, $C1                                   ;; 19:4C37 $3E $C1
    ld   [hl], a                                  ;; 19:4C39 $77
    ld   a, $99                                   ;; 19:4C3A $3E $99
    call BackupObjectInRAM2                       ;; 19:4C3C $CD $2F $0B
    ld   hl, wRoomObjects + $35                   ;; 19:4C3F $21 $46 $D7
    ld   a, $CB                                   ;; 19:4C42 $3E $CB
    ld   [hl], a                                  ;; 19:4C44 $77
    ld   a, $99                                   ;; 19:4C45 $3E $99
    call BackupObjectInRAM2                       ;; 19:4C47 $CD $2F $0B
    ld   a, $50                                   ;; 19:4C4A $3E $50
    ldh  [hIntersectedObjectLeft], a              ;; 19:4C4C $E0 $CE
    ld   a, $20                                   ;; 19:4C4E $3E $20
    ldh  [hIntersectedObjectTop], a               ;; 19:4C50 $E0 $CD
    call label_2887                               ;; 19:4C52 $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 19:4C55 $F0 $FE
    and  a                                        ;; 19:4C57 $A7
    jr   z, .jr_4C88                              ;; 19:4C58 $28 $2E

    push bc                                       ;; 19:4C5A $C5
    ld   a, $C1                                   ;; 19:4C5B $3E $C1
    ld   [wDDD8], a                               ;; 19:4C5D $EA $D8 $DD
    ld   a, $19                                   ;; 19:4C60 $3E $19
    call func_91D                                 ;; 19:4C62 $CD $1D $09
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:4C65 $F0 $CF
    ld   h, a                                     ;; 19:4C67 $67
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:4C68 $F0 $D0
    ld   l, a                                     ;; 19:4C6A $6F
    push hl                                       ;; 19:4C6B $E5
    ld   de, $40                                  ;; 19:4C6C $11 $40 $00
    add  hl, de                                   ;; 19:4C6F $19
    ld   a, h                                     ;; 19:4C70 $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 19:4C71 $E0 $CF
    ld   a, l                                     ;; 19:4C73 $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 19:4C74 $E0 $D0
    ld   a, $CB                                   ;; 19:4C76 $3E $CB
    ld   [wDDD8], a                               ;; 19:4C78 $EA $D8 $DD
    ld   a, $19                                   ;; 19:4C7B $3E $19
    call func_91D                                 ;; 19:4C7D $CD $1D $09
    pop  hl                                       ;; 19:4C80 $E1
    ld   a, h                                     ;; 19:4C81 $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 19:4C82 $E0 $CF
    ld   a, l                                     ;; 19:4C84 $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 19:4C85 $E0 $D0
    pop  bc                                       ;; 19:4C87 $C1

.jr_4C88
    ld   hl, wDrawCommand                         ;; 19:4C88 $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 19:4C8B $FA $00 $D6
    ld   e, a                                     ;; 19:4C8E $5F
    add  $07                                      ;; 19:4C8F $C6 $07
    ld   [wDrawCommandsSize], a                   ;; 19:4C91 $EA $00 $D6
    ld   d, $00                                   ;; 19:4C94 $16 $00
    add  hl, de                                   ;; 19:4C96 $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:4C97 $F0 $CF
    ld   [hl+], a                                 ;; 19:4C99 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:4C9A $F0 $D0
    ld   [hl+], a                                 ;; 19:4C9C $22
    ld   a, $83                                   ;; 19:4C9D $3E $83
    ld   [hl+], a                                 ;; 19:4C9F $22
    ld   a, $7F                                   ;; 19:4CA0 $3E $7F
    ld   [hl+], a                                 ;; 19:4CA2 $22
    ld   a, $0F                                   ;; 19:4CA3 $3E $0F
    ld   [hl+], a                                 ;; 19:4CA5 $22
    ld   a, $7E                                   ;; 19:4CA6 $3E $7E
    ld   [hl+], a                                 ;; 19:4CA8 $22
    ld   a, $1F                                   ;; 19:4CA9 $3E $1F
    ld   [hl+], a                                 ;; 19:4CAB $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:4CAC $F0 $CF
    ld   [hl+], a                                 ;; 19:4CAE $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:4CAF $F0 $D0
    inc  a                                        ;; 19:4CB1 $3C
    ld   [hl+], a                                 ;; 19:4CB2 $22
    ld   a, $83                                   ;; 19:4CB3 $3E $83
    ld   [hl+], a                                 ;; 19:4CB5 $22
    ld   a, $7F                                   ;; 19:4CB6 $3E $7F
    ld   [hl+], a                                 ;; 19:4CB8 $22
    ld   a, $0F                                   ;; 19:4CB9 $3E $0F
    ld   [hl+], a                                 ;; 19:4CBB $22
    ld   a, $7E                                   ;; 19:4CBC $3E $7E
    ld   [hl+], a                                 ;; 19:4CBE $22
    ld   a, $1F                                   ;; 19:4CBF $3E $1F
    ld   [hl+], a                                 ;; 19:4CC1 $22
    ld   [hl], b                                  ;; 19:4CC2 $70
    call label_27F2                               ;; 19:4CC3 $CD $F2 $27
    ld   a, JINGLE_DUNGEON_OPENED                 ;; 19:4CC6 $3E $23
    ldh  [hJingle], a                             ;; 19:4CC8 $E0 $F2
    call func_019_4D45                            ;; 19:4CCA $CD $45 $4D
    call PlayBombExplosionSfx                     ;; 19:4CCD $CD $4B $0C
    ld   de, wObjPal2 + 2*2                       ;; 19:4CD0 $11 $5C $DC
    ld   hl, rSVBK                                ;; 19:4CD3 $21 $70 $FF

.loop_4CD6
    ld   [hl], $02                                ;; 19:4CD6 $36 $02
    ld   a, [de]                                  ;; 19:4CD8 $1A
    ld   [hl], $00                                ;; 19:4CD9 $36 $00
    ld   [de], a                                  ;; 19:4CDB $12
    inc  e                                        ;; 19:4CDC $1C
    ld   a, e                                     ;; 19:4CDD $7B
    and  $03                                      ;; 19:4CDE $E6 $03
    jr   nz, .loop_4CD6                           ;; 19:4CE0 $20 $F4

    ld   a, $02                                   ;; 19:4CE2 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 19:4CE4 $EA $D1 $DD
    jp   ClearEntityStatus_19                     ;; 19:4CE7 $C3 $61 $7E

label_019_4CEA:
    ld   e, $01                                   ;; 19:4CEA $1E $01
    and  $04                                      ;; 19:4CEC $E6 $04
    jr   z, .jr_4CF2                              ;; 19:4CEE $28 $02

    ld   e, $FF                                   ;; 19:4CF0 $1E $FF

.jr_4CF2
    ld   a, e                                     ;; 19:4CF2 $7B
    ld   [wScreenShakeHorizontal], a              ;; 19:4CF3 $EA $55 $C1
    ret                                           ;; 19:4CF6 $C9

Data_019_4CF7::
    db   $16, $00, $16, $20, $16, $60, $16, $40

label_019_4CFF:
    ld   de, Data_019_4CF7                        ;; 19:4CFF $11 $F7 $4C
    call RenderActiveEntitySprite                 ;; 19:4D02 $CD $77 $3C
    call UpdateEntityPosWithSpeed_19              ;; 19:4D05 $CD $B8 $7D
    ld   hl, wEntitiesSpeedYTable                 ;; 19:4D08 $21 $50 $C2
    add  hl, bc                                   ;; 19:4D0B $09
    inc  [hl]                                     ;; 19:4D0C $34
    call GetEntityTransitionCountdown             ;; 19:4D0D $CD $05 $0C
    ld   [wC167], a                               ;; 19:4D10 $EA $67 $C1
    jr   z, .jr_4D1A                              ;; 19:4D13 $28 $05

    ld   a, $02                                   ;; 19:4D15 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4D17 $E0 $A1
    ret                                           ;; 19:4D19 $C9

.jr_4D1A
    ld   hl, wOverworldRoomStatus + $06           ;; 19:4D1A $21 $06 $D8
    set  OW_ROOM_STATUS_FLAG_CHANGED, [hl]        ;; 19:4D1D $CB $E6
    ld   a, [hl]                                  ;; 19:4D1F $7E
    ldh  [hRoomStatus], a                         ;; 19:4D20 $E0 $F8
    jp   ClearEntityStatus_19                     ;; 19:4D22 $C3 $61 $7E

Data_019_4D25::
    db   $00, $04, $08, $00, $08, $00, $04, $08

Data_019_4D2D::
    db   $00, $00, $00, $04, $04, $08, $08, $08

Data_019_4D35::
    db   $F0, $FC, $10, $F0, $10, $F0, $04, $10

Data_019_4D3D::
    db   $F0, $E8, $F0, $F8, $F8, $08, $0C, $08

func_019_4D45::
    xor  a                                        ;; 19:4D45 $AF

.loop_4D46
    ldh  [hMultiPurposeG], a                      ;; 19:4D46 $E0 $E8
    ld   a, ENTITY_EGG_SONG_EVENT                 ;; 19:4D48 $3E $DE
    call SpawnNewEntity_trampoline                ;; 19:4D4A $CD $86 $3B
    ret  c                                        ;; 19:4D4D $D8

    ld   hl, wEntitiesPrivateState1Table          ;; 19:4D4E $21 $B0 $C2
    add  hl, de                                   ;; 19:4D51 $19
    ld   [hl], $02                                ;; 19:4D52 $36 $02
    call GetRandomByte                            ;; 19:4D54 $CD $0D $28
    and  $1F                                      ;; 19:4D57 $E6 $1F
    add  $30                                      ;; 19:4D59 $C6 $30
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:4D5B $21 $E0 $C2
    add  hl, de                                   ;; 19:4D5E $19
    ld   [hl], a                                  ;; 19:4D5F $77
    push bc                                       ;; 19:4D60 $C5
    ldh  a, [hMultiPurposeG]                      ;; 19:4D61 $F0 $E8
    ld   c, a                                     ;; 19:4D63 $4F
    ld   hl, Data_019_4D25                        ;; 19:4D64 $21 $25 $4D
    add  hl, bc                                   ;; 19:4D67 $09
    ld   a, [hl]                                  ;; 19:4D68 $7E
    ld   hl, wEntitiesPosXTable                   ;; 19:4D69 $21 $00 $C2
    add  hl, de                                   ;; 19:4D6C $19
    add  $54                                      ;; 19:4D6D $C6 $54
    ld   [hl], a                                  ;; 19:4D6F $77
    ld   hl, Data_019_4D2D                        ;; 19:4D70 $21 $2D $4D
    add  hl, bc                                   ;; 19:4D73 $09
    ld   a, [hl]                                  ;; 19:4D74 $7E
    ld   hl, wEntitiesPosYTable                   ;; 19:4D75 $21 $10 $C2
    add  hl, de                                   ;; 19:4D78 $19
    add  $3C                                      ;; 19:4D79 $C6 $3C
    ld   [hl], a                                  ;; 19:4D7B $77
    ld   hl, Data_019_4D35                        ;; 19:4D7C $21 $35 $4D
    add  hl, bc                                   ;; 19:4D7F $09
    ld   a, [hl]                                  ;; 19:4D80 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:4D81 $21 $40 $C2
    add  hl, de                                   ;; 19:4D84 $19
    ld   [hl], a                                  ;; 19:4D85 $77
    ld   hl, Data_019_4D3D                        ;; 19:4D86 $21 $3D $4D
    add  hl, bc                                   ;; 19:4D89 $09
    ld   a, [hl]                                  ;; 19:4D8A $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:4D8B $21 $50 $C2
    add  hl, de                                   ;; 19:4D8E $19
    sub  $08                                      ;; 19:4D8F $D6 $08
    ld   [hl], a                                  ;; 19:4D91 $77
    pop  bc                                       ;; 19:4D92 $C1
    ldh  a, [hMultiPurposeG]                      ;; 19:4D93 $F0 $E8
    inc  a                                        ;; 19:4D95 $3C
    cp   $08                                      ;; 19:4D96 $FE $08
    jr   nz, .loop_4D46                           ;; 19:4D98 $20 $AC

    ret                                           ;; 19:4D9A $C9
