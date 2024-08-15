
; Note: this entity, unlike most others, use all 4 spriteslots.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
MamuAndFrogsEntityHandler::
    ld   a, [wC116]                               ;; 18:4000 $FA $16 $C1
    and  a                                        ;; 18:4003 $A7
    jr   nz, .jr_400F                             ;; 18:4004 $20 $09

    inc  a                                        ;; 18:4006 $3C
    ld   [wC116], a                               ;; 18:4007 $EA $16 $C1
    ld   a, TILEMAP_MAMU                          ;; 18:400A $3E $14
    ld   [wBGMapToLoad], a                        ;; 18:400C $EA $FF $D6

.jr_400F
    ldh  a, [hActiveEntityPosX]                   ;; 18:400F $F0 $EE
    cp   $48                                      ;; 18:4011 $FE $48
    jp   nz, label_018_4373                       ;; 18:4013 $C2 $73 $43

    call func_018_435A                            ;; 18:4016 $CD $5A $43
    call PushLinkOutOfEntity_18                   ;; 18:4019 $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ;; 18:401C $F0 $F0
    JP_TABLE                                      ;; 18:401E
._00 dw MamuAndFrogsState0Handler
._01 dw MamuAndFrogsState1Handler
._02 dw MamuAndFrogsSingingHandler
._03 dw MamuAndFrogsState3Handler
._04 dw MamuAndFrogsGrantSongHandler
._05 dw MamuAndFrogsState5Handler
._06 dw MamuAndFrogsState6Handler

MamuAndFrogsState0Handler::
    xor  a                                        ;; 18:402D $AF
    ld   [wD201], a                               ;; 18:402E $EA $01 $D2
    ld   a, [wOcarinaSongFlags]                   ;; 18:4031 $FA $49 $DB
    and  FROGS_SONG_OF_THE_SOUL_FLAG              ;; 18:4034 $E6 $01
    jr   z, .jr_404A                              ;; 18:4036 $28 $12

    ldh  a, [hLinkPositionY]                      ;; 18:4038 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 18:403A $21 $EF $FF
    sub  [hl]                                     ;; 18:403D $96
    add  $28                                      ;; 18:403E $C6 $28
    cp   $50                                      ;; 18:4040 $FE $50
    call func_018_7DA0                            ;; 18:4042 $CD $A0 $7D
    jr   nc, func_018_407C                        ;; 18:4045 $30 $35

    jp   label_018_42B2                           ;; 18:4047 $C3 $B2 $42

.jr_404A
    ldh  a, [hLinkPositionY]                      ;; 18:404A $F0 $99
    cp   $4C                                      ;; 18:404C $FE $4C
    jr   nc, func_018_407C                        ;; 18:404E $30 $2C

    ld   a, $4C                                   ;; 18:4050 $3E $4C
    ldh  [hLinkPositionY], a                      ;; 18:4052 $E0 $99
    call ClearLinkPositionIncrement               ;; 18:4054 $CD $8E $17
    call ResetSpinAttack                          ;; 18:4057 $CD $AF $0C
    ld   e, INVENTORY_SLOT_COUNT - 1              ;; 18:405A $1E $0B
    ld   hl, wInventoryItems.BButtonSlot          ;; 18:405C $21 $00 $DB

.loop_405F
    ld   a, [hl+]                                 ;; 18:405F $2A
    cp   INVENTORY_OCARINA                        ;; 18:4060 $FE $09
    jr   z, .jr_4074                              ;; 18:4062 $28 $10

    dec  e                                        ;; 18:4064 $1D
    ld   a, e                                     ;; 18:4065 $7B
    cp   $FF                                      ;; 18:4066 $FE $FF
    jr   nz, .loop_405F                           ;; 18:4068 $20 $F5

    ld_dialog_low a, Dialog0DB                    ;; 18:406A $3E $DB
    call MamuOpenDialogAtBottom                   ;; 18:406C $CD $87 $40
    call IncrementEntityState                     ;; 18:406F $CD $12 $3B
    ld   [hl], b                                  ;; 18:4072 $70
    ret                                           ;; 18:4073 $C9

.jr_4074
    ld_dialog_low a, Dialog0DC                    ;; 18:4074 $3E $DC
    call MamuOpenDialogAtBottom                   ;; 18:4076 $CD $87 $40
    call IncrementEntityState                     ;; 18:4079 $CD $12 $3B

func_018_407C::
    ldh  a, [hFrameCounter]                       ;; 18:407C $F0 $E7
    rra                                           ;; 18:407E $1F
    rra                                           ;; 18:407F $1F
    rra                                           ;; 18:4080 $1F
    rra                                           ;; 18:4081 $1F
    and  $01                                      ;; 18:4082 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 18:4084 $C3 $0C $3B

MamuOpenDialogAtBottom::
    ld   e, a                                     ;; 18:4087 $5F
    ldh  a, [hLinkPositionY]                      ;; 18:4088 $F0 $99
    push af                                       ;; 18:408A $F5
    ld   a, $10                                   ;; 18:408B $3E $10
    ldh  [hLinkPositionY], a                      ;; 18:408D $E0 $99
    ld   a, e                                     ;; 18:408F $7B
    call OpenDialogInTable0                       ;; 18:4090 $CD $85 $23
    pop  af                                       ;; 18:4093 $F1
    ldh  [hLinkPositionY], a                      ;; 18:4094 $E0 $99
    ret                                           ;; 18:4096 $C9

MamuAndFrogsState1Handler::
    call func_018_407C                            ;; 18:4097 $CD $7C $40
    ld   a, [wDialogState]                        ;; 18:409A $FA $9F $C1
    and  a                                        ;; 18:409D $A7
    jr   nz, ret_018_40D6                         ;; 18:409E $20 $36

    call IncrementEntityState                     ;; 18:40A0 $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 18:40A3 $FA $77 $C1
    and  a                                        ;; 18:40A6 $A7
    jr   z, jr_018_40AF                           ;; 18:40A7 $28 $06

jr_018_40A9:
    ld   [hl], b                                  ;; 18:40A9 $70
    ld_dialog_low a, Dialog0DE                    ;; 18:40AA $3E $DE
    jp   MamuOpenDialogAtBottom                   ;; 18:40AC $C3 $87 $40

jr_018_40AF:
    ld   a, [wRupeeCountHigh]                     ;; 18:40AF $FA $5D $DB
    cp   $03                                      ;; 18:40B2 $FE $03
    jr   c, jr_018_40A9                           ;; 18:40B4 $38 $F3

    ld   a, [wSubstractRupeeBufferLow]            ;; 18:40B6 $FA $92 $DB
    add  $2C                                      ;; 18:40B9 $C6 $2C
    ld   [wSubstractRupeeBufferLow], a            ;; 18:40BB $EA $92 $DB
    ld   a, [wSubstractRupeeBufferHigh]           ;; 18:40BE $FA $91 $DB
    adc  $01                                      ;; 18:40C1 $CE $01
    ld   [wSubstractRupeeBufferHigh], a           ;; 18:40C3 $EA $91 $DB
    call GetEntityTransitionCountdown             ;; 18:40C6 $CD $05 $0C
    ld   [hl], $FF                                ;; 18:40C9 $36 $FF
    call label_27F2                               ;; 18:40CB $CD $F2 $27
    call func_018_45A0                            ;; 18:40CE $CD $A0 $45
    ld   a, $01                                   ;; 18:40D1 $3E $01
    ld   [wAlternateBackgroundEnabled], a         ;; 18:40D3 $EA $00 $C5

ret_018_40D6:
    ret                                           ;; 18:40D6 $C9

; Frogs start singing
MamuAndFrogsSingingHandler::
    ld   a, $02                                   ;; 18:40D7 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:40D9 $E0 $A1
    ld   [wC167], a                               ;; 18:40DB $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 18:40DE $CD $05 $0C
    jr   nz, .ret_40F0                            ;; 18:40E1 $20 $0D

    ld   a, MUSIC_MAMU_FROG_SONG                  ;; 18:40E3 $3E $35
    ld   [wMusicTrackToPlay], a                   ;; 18:40E5 $EA $68 $D3
    ld   a, $01                                   ;; 18:40E8 $3E $01
    ld   [wD215], a                               ;; 18:40EA $EA $15 $D2
    jp   IncrementEntityState                     ;; 18:40ED $C3 $12 $3B

.ret_40F0
    ret                                           ;; 18:40F0 $C9

func_018_40F1::
    ld   a, $30                                   ;; 18:40F1 $3E $30
    ldh  [hIntersectedObjectTop], a               ;; 18:40F3 $E0 $CD
    ld   a, $18                                   ;; 18:40F5 $3E $18
    ldh  [hIntersectedObjectLeft], a              ;; 18:40F7 $E0 $CE
    jp   label_018_449D                           ;; 18:40F9 $C3 $9D $44

func_018_40FC::
    ld   a, $30                                   ;; 18:40FC $3E $30
    ldh  [hIntersectedObjectTop], a               ;; 18:40FE $E0 $CD
    ld   a, $68                                   ;; 18:4100 $3E $68
    ldh  [hIntersectedObjectLeft], a              ;; 18:4102 $E0 $CE
    jp   label_018_449D                           ;; 18:4104 $C3 $9D $44

func_018_4107::
    ld   a, $38                                   ;; 18:4107 $3E $38
    ldh  [hIntersectedObjectLeft], a              ;; 18:4109 $E0 $CE
    ld   a, $08                                   ;; 18:410B $3E $08
    ldh  [hIntersectedObjectTop], a               ;; 18:410D $E0 $CD
    jp   label_018_4402                           ;; 18:410F $C3 $02 $44

func_018_4112::
    ld   a, $38                                   ;; 18:4112 $3E $38
    ldh  [hIntersectedObjectLeft], a              ;; 18:4114 $E0 $CE
    ld   a, $08                                   ;; 18:4116 $3E $08
    ldh  [hIntersectedObjectTop], a               ;; 18:4118 $E0 $CD
    jp   label_018_444E                           ;; 18:411A $C3 $4E $44

    ret                                           ;; 18:411D $C9

Data_018_411E::
    db   $03, $03, $03, $03, $03, $03, $03, $01, $02, $04, $03, $01, $02, $04, $03, $01
    db   $02, $04, $03, $01, $02, $04, $03, $01, $02, $04, $03, $03, $03, $03, $03, $04
    db   $03, $01, $02, $04, $03, $01, $02, $04, $03, $01, $02, $04, $03, $01, $02, $04
    db   $03, $01, $02, $02, $02, $02, $02, $02, $02, $02

Data_018_4158::
    db   $01, $01, $05, $05, $05, $05, $05, $05, $01, $01, $04, $01, $05, $01, $04, $01
    db   $05, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $05, $05, $05
    db   $01, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $01
    db   $04, $01, $05, $01, $04, $04, $04, $04, $04, $04

Data_018_4192::
    db   $01, $01, $01, $01, $05, $05, $05, $05, $01, $01, $01, $01, $04, $01, $05, $01
    db   $04, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $05
    db   $01, $01, $01, $01, $05, $01, $04, $01, $05, $01, $04, $01, $05, $01, $04, $01
    db   $05, $01, $04, $01, $05, $01, $04, $04, $04, $04

MamuAndFrogsState3Handler::
    ld   a, $02                                   ;; 18:41CC $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:41CE $E0 $A1
    ld   [wC167], a                               ;; 18:41D0 $EA $67 $C1
    ld   a, [wD211]                               ;; 18:41D3 $FA $11 $D2
    and  a                                        ;; 18:41D6 $A7
    jr   nz, .jr_41F9                             ;; 18:41D7 $20 $20

    ld   a, [wD210]                               ;; 18:41D9 $FA $10 $D2
    cp   $00                                      ;; 18:41DC $FE $00
    call z, func_018_4107                         ;; 18:41DE $CC $07 $41
    ld   a, [wD210]                               ;; 18:41E1 $FA $10 $D2
    cp   $01                                      ;; 18:41E4 $FE $01
    call z, func_018_4112                         ;; 18:41E6 $CC $12 $41
    ld   a, [wD210]                               ;; 18:41E9 $FA $10 $D2
    cp   $38                                      ;; 18:41EC $FE $38
    call z, func_018_40F1                         ;; 18:41EE $CC $F1 $40
    ld   a, [wD210]                               ;; 18:41F1 $FA $10 $D2
    cp   $70                                      ;; 18:41F4 $FE $70
    call z, func_018_40FC                         ;; 18:41F6 $CC $FC $40

.jr_41F9
    ld   a, [wD210]                               ;; 18:41F9 $FA $10 $D2
    add  $01                                      ;; 18:41FC $C6 $01
    ld   [wD210], a                               ;; 18:41FE $EA $10 $D2
    ld   e, a                                     ;; 18:4201 $5F
    ld   a, [wD211]                               ;; 18:4202 $FA $11 $D2
    adc  $00                                      ;; 18:4205 $CE $00
    ld   [wD211], a                               ;; 18:4207 $EA $11 $D2
    ld   d, a                                     ;; 18:420A $57
    cp   $06                                      ;; 18:420B $FE $06
    jr   nz, .jr_4220                             ;; 18:420D $20 $11

    ld   a, e                                     ;; 18:420F $7B
    cp   $20                                      ;; 18:4210 $FE $20
    jr   nz, .jr_4220                             ;; 18:4212 $20 $0C

    ld_dialog_low a, Dialog0DD                    ;; 18:4214 $3E $DD
    call MamuOpenDialogAtBottom                   ;; 18:4216 $CD $87 $40
    xor  a                                        ;; 18:4219 $AF
    ld   [wAlternateBackgroundEnabled], a         ;; 18:421A $EA $00 $C5
    jp   IncrementEntityState                     ;; 18:421D $C3 $12 $3B

.jr_4220
    ld   a, [wD212]                               ;; 18:4220 $FA $12 $D2
    inc  a                                        ;; 18:4223 $3C
    cp   $1C                                      ;; 18:4224 $FE $1C
    jr   nz, .jr_4230                             ;; 18:4226 $20 $08

    ld   a, [wD213]                               ;; 18:4228 $FA $13 $D2
    inc  a                                        ;; 18:422B $3C
    ld   [wD213], a                               ;; 18:422C $EA $13 $D2
    xor  a                                        ;; 18:422F $AF

.jr_4230
    ld   [wD212], a                               ;; 18:4230 $EA $12 $D2
    ld   a, [wD213]                               ;; 18:4233 $FA $13 $D2
    ld   e, a                                     ;; 18:4236 $5F
    ld   d, b                                     ;; 18:4237 $50
    ld   hl, Data_018_411E                        ;; 18:4238 $21 $1E $41
    add  hl, de                                   ;; 18:423B $19
    ld   a, [hl]                                  ;; 18:423C $7E
    call SetEntitySpriteVariant                   ;; 18:423D $CD $0C $3B
    ld   hl, Data_018_4158                        ;; 18:4240 $21 $58 $41
    add  hl, de                                   ;; 18:4243 $19
    ld   a, [hl]                                  ;; 18:4244 $7E
    ld   [wEntitiesSpriteVariantTable+1], a       ;; 18:4245 $EA $B1 $C3
    ld   hl, Data_018_4192                        ;; 18:4248 $21 $92 $41
    add  hl, de                                   ;; 18:424B $19
    ld   a, [hl]                                  ;; 18:424C $7E
    ld   [wEntitiesSpriteVariantTable+2], a       ;; 18:424D $EA $B2 $C3
    ret                                           ;; 18:4250 $C9

IF !__OPTIMIZATIONS_1__
    ret                                           ;; 18:4251 $C9
ENDC

; When you receive the Frog Song 'item'
MamuAndFrogsGrantSongHandler::
    ld   a, [wDialogState]                        ;; 18:4252 $FA $9F $C1
    and  a                                        ;; 18:4255 $A7
    jr   nz, .jr_4268                             ;; 18:4256 $20 $10

    ld   [wD215], a                               ;; 18:4258 $EA $15 $D2
    call GetEntityTransitionCountdown             ;; 18:425B $CD $05 $0C
    ld   [hl], $70                                ;; 18:425E $36 $70
    ld   a, MUSIC_OBTAIN_ITEM                     ;; 18:4260 $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 18:4262 $EA $68 $D3
    call IncrementEntityState                     ;; 18:4265 $CD $12 $3B

.jr_4268
    jp   func_018_407C                            ;; 18:4268 $C3 $7C $40

MamuAndFrogsState5Handler::
    call GetEntityTransitionCountdown             ;; 18:426B $CD $05 $0C
    jr   nz, .jr_427D                             ;; 18:426E $20 $0D

    ld   a, $02                                   ;; 18:4270 $3E $02
    ld   [wSelectedSongIndex], a                  ;; 18:4272 $EA $4A $DB
    ld   hl, wOcarinaSongFlags                    ;; 18:4275 $21 $49 $DB
    set  FROGS_SONG_OF_THE_SOUL_FLAG_BIT, [hl]    ;; 18:4278 $CB $C6
    jp   IncrementEntityState                     ;; 18:427A $C3 $12 $3B

.jr_427D
    cp   $08                                      ;; 18:427D $FE $08
    jr   nz, .jr_4287                             ;; 18:427F $20 $06

    dec  [hl]                                     ;; 18:4281 $35
    ld_dialog_low a, Dialog0DF                    ;; 18:4282 $3E $DF
    call MamuOpenDialogAtBottom                   ;; 18:4284 $CD $87 $40

.jr_4287
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ;; 18:4287 $3E $6C
    ldh  [hLinkAnimationState], a                 ;; 18:4289 $E0 $9D
    ld   a, $02                                   ;; 18:428B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:428D $E0 $A1
    ldh  a, [hLinkPositionX]                      ;; 18:428F $F0 $98
    ldh  [hActiveEntityPosX], a                   ;; 18:4291 $E0 $EE
    ldh  a, [hLinkPositionY]                      ;; 18:4293 $F0 $99
    sub  $0C                                      ;; 18:4295 $D6 $0C
    ldh  [hActiveEntityVisualPosY], a             ;; 18:4297 $E0 $EC
    ld   de, Data_018_474D                        ;; 18:4299 $11 $4D $47
    xor  a                                        ;; 18:429C $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 18:429D $E0 $F1
    call RenderActiveEntitySprite                 ;; 18:429F $CD $77 $3C
    jp   func_018_407C                            ;; 18:42A2 $C3 $7C $40

MamuAndFrogsState6Handler::
    ld   a, [wDialogState]                        ;; 18:42A5 $FA $9F $C1
    and  a                                        ;; 18:42A8 $A7
    jr   nz, jr_018_42B7                          ;; 18:42A9 $20 $0C

    ld   [wC167], a                               ;; 18:42AB $EA $67 $C1
    call IncrementEntityState                     ;; 18:42AE $CD $12 $3B
    ld   [hl], b                                  ;; 18:42B1 $70

label_018_42B2:
    ld_dialog_low a, Dialog0E0                    ;; 18:42B2 $3E $E0
    call MamuOpenDialogAtBottom                   ;; 18:42B4 $CD $87 $40

jr_018_42B7:
    jp   func_018_407C                            ;; 18:42B7 $C3 $7C $40

Data_018_42BA::
    db   $00, $00, $60, $00, $00, $08, $62, $00, $00, $10, $64, $00, $00, $18, $66, $00
    db   $10, $00, $68, $00, $10, $08, $6A, $00, $10, $10, $6C, $00, $10, $18, $6E, $00
    db   $00, $00, $70, $00, $00, $08, $72, $00, $00, $10, $74, $00, $00, $18, $76, $00
    db   $10, $00, $68, $00, $10, $08, $6A, $00, $10, $10, $6C, $00, $10, $18, $6E, $00
    db   $00, $00, $78, $00, $00, $08, $7A, $00, $00, $10, $7C, $00, $00, $18, $7E, $00
    db   $10, $00, $68, $00, $10, $08, $6A, $00, $10, $10, $6C, $00, $10, $18, $6E, $00
    db   $00, $00, $7E, $20, $00, $08, $7C, $20, $00, $10, $7A, $20, $00, $18, $78, $20
    db   $10, $00, $6E, $20, $10, $08, $6C, $20, $10, $10, $6A, $20, $10, $18, $68, $20
    db   $00, $00, $76, $20, $00, $08, $74, $20, $00, $10, $72, $20, $00, $18, $70, $20
    db   $10, $00, $6E, $20, $10, $08, $6C, $20, $10, $10, $6A, $20, $10, $18, $68, $20

func_018_435A::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 18:435A $F0 $F1
    rla                                           ;; 18:435C $17
    rla                                           ;; 18:435D $17
    rla                                           ;; 18:435E $17

.jr_435F
    rla                                           ;; 18:435F $17
    rla                                           ;; 18:4360 $17
    and  $E0                                      ;; 18:4361 $E6 $E0
    ld   e, a                                     ;; 18:4363 $5F
    ld   d, b                                     ;; 18:4364 $50
    ld   hl, Data_018_42BA                        ;; 18:4365 $21 $BA $42
    add  hl, de                                   ;; 18:4368 $19
    ld   c, $08                                   ;; 18:4369 $0E $08
    call RenderActiveEntitySpritesRect            ;; 18:436B $CD $E6 $3C
    ld   a, $04                                   ;; 18:436E $3E $04
    jp   func_015_7964_trampoline                 ;; 18:4370 $C3 $A0 $3D

label_018_4373:
    ld   hl, wEntitiesPosYTable                   ;; 18:4373 $21 $10 $C2
    add  hl, bc                                   ;; 18:4376 $09
    ld   [hl], $4A                                ;; 18:4377 $36 $4A
    ld   hl, wEntitiesHitboxFlagsTable            ;; 18:4379 $21 $50 $C3
    add  hl, bc                                   ;; 18:437C $09
    ld   [hl], $98                                ;; 18:437D $36 $98
    call ConfigureEntityHitbox                    ;; 18:437F $CD $EA $3A
    call func_018_43E3                            ;; 18:4382 $CD $E3 $43
    call PushLinkOutOfEntity_18                   ;; 18:4385 $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ;; 18:4388 $F0 $F0
    JP_TABLE                                      ;; 18:438A
._00 dw func_018_438F                             ;; 18:438B
._01 dw func_018_439A                             ;; 18:438D

func_018_438F::
    call GetRandomByte                            ;; 18:438F $CD $0D $28
    ld   hl, wEntitiesInertiaTable                ;; 18:4392 $21 $D0 $C3
    add  hl, bc                                   ;; 18:4395 $09
    ld   [hl], a                                  ;; 18:4396 $77
    call IncrementEntityState                     ;; 18:4397 $CD $12 $3B

func_018_439A::
    ld   a, [wD215]                               ;; 18:439A $FA $15 $D2
    and  a                                        ;; 18:439D $A7
    jp   nz, label_018_43B2                       ;; 18:439E $C2 $B2 $43

.jr_43A1
    ld   hl, wEntitiesInertiaTable                ;; 18:43A1 $21 $D0 $C3
    add  hl, bc                                   ;; 18:43A4 $09
    inc  [hl]                                     ;; 18:43A5 $34
    ld   a, [hl]                                  ;; 18:43A6 $7E
    ld   e, $00                                   ;; 18:43A7 $1E $00
    and  $30                                      ;; 18:43A9 $E6 $30
    jr   z, .jr_43AE                              ;; 18:43AB $28 $01

    inc  e                                        ;; 18:43AD $1C

.jr_43AE
    ld   a, e                                     ;; 18:43AE $7B
    jp   SetEntitySpriteVariant                   ;; 18:43AF $C3 $0C $3B

label_018_43B2:
    ret                                           ;; 18:43B2 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MamuAndFrogsSpriteVariants::
.variant0
    db $58, OAM_GBC_PAL_0 | OAMF_PAL0
    db $58, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5A, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $5E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $5C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

MamuAndFrogsSpriteList::
    ;  x    y    n°   OAM
    db $F0, $00, $50, OAM_GBC_PAL_0 | OAMF_PAL0
    db $F0, $08, $52, OAM_GBC_PAL_0 | OAMF_PAL0
    db $00, $00, $54, OAM_GBC_PAL_0 | OAMF_PAL0
    db $00, $08, $56, OAM_GBC_PAL_0 | OAMF_PAL0
    db $F0, $00, $52, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $F0, $08, $50, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $00, $00, $56, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $00, $08, $54, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

func_018_43E3::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 18:43E3 $F0 $F1
    cp   $04                                      ;; 18:43E5 $FE $04
    jr   nc, .jr_43EF                             ;; 18:43E7 $30 $06

    ld   de, MamuAndFrogsSpriteVariants           ;; 18:43E9 $11 $B3 $43
    jp   RenderActiveEntitySpritesPair            ;; 18:43EC $C3 $C0 $3B

.jr_43EF
    sub  $04                                      ;; 18:43EF $D6 $04
    rla                                           ;; 18:43F1 $17
    rla                                           ;; 18:43F2 $17
    rla                                           ;; 18:43F3 $17
    rla                                           ;; 18:43F4 $17
    and  $F0                                      ;; 18:43F5 $E6 $F0
    ld   e, a                                     ;; 18:43F7 $5F
    ld   d, b                                     ;; 18:43F8 $50
    ld   hl, MamuAndFrogsSpriteList               ;; 18:43F9 $21 $C3 $43
    add  hl, de                                   ;; 18:43FC $19
    ld   c, $04                                   ;; 18:43FD $0E $04
    jp   RenderActiveEntitySpritesRect            ;; 18:43FF $C3 $E6 $3C

label_018_4402:
    call label_2887                               ;; 18:4402 $CD $87 $28
    ld   a, $1B                                   ;; 18:4405 $3E $1B
    ld   [wDrawCommandsSize], a                   ;; 18:4407 $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 18:440A $21 $01 $D6
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 18:440D $F0 $CF
    add  $02                                      ;; 18:440F $C6 $02
    ld   e, a                                     ;; 18:4411 $5F

.jr_4412
    ld   [hl+], a                                 ;; 18:4412 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:4413 $F0 $D0
    ld   [hl+], a                                 ;; 18:4415 $22
    ld   a, $85                                   ;; 18:4416 $3E $85

.jr_4418
    ld   [hl+], a                                 ;; 18:4418 $22
    xor  a                                        ;; 18:4419 $AF
    ld   [hl+], a                                 ;; 18:441A $22
    ld   a, $04                                   ;; 18:441B $3E $04
    ld   [hl+], a                                 ;; 18:441D $22

.jr_441E
    ld   a, $7F                                   ;; 18:441E $3E $7F
    ld   [hl+], a                                 ;; 18:4420 $22
    ld   [hl+], a                                 ;; 18:4421 $22
    ld   a, $06                                   ;; 18:4422 $3E $06
    ld   [hl+], a                                 ;; 18:4424 $22
    ld   a, $0C                                   ;; 18:4425 $3E $0C
    ld   [hl+], a                                 ;; 18:4427 $22
    ld   a, e                                     ;; 18:4428 $7B
    ld   [hl+], a                                 ;; 18:4429 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:442A $F0 $D0
    add  $01                                      ;; 18:442C $C6 $01
    ld   [hl+], a                                 ;; 18:442E $22
    ld   a, $85                                   ;; 18:442F $3E $85
    ld   [hl+], a                                 ;; 18:4431 $22
    ld   a, $01                                   ;; 18:4432 $3E $01
    ld   [hl+], a                                 ;; 18:4434 $22
    ld   a, $7F                                   ;; 18:4435 $3E $7F
    ld   [hl+], a                                 ;; 18:4437 $22
    ld   [hl+], a                                 ;; 18:4438 $22
    ld   [hl+], a                                 ;; 18:4439 $22
    ld   [hl+], a                                 ;; 18:443A $22
    ld   a, $0D                                   ;; 18:443B $3E $0D
    ld   [hl+], a                                 ;; 18:443D $22
    ld   a, e                                     ;; 18:443E $7B
    ld   [hl+], a                                 ;; 18:443F $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:4440 $F0 $D0
    add  $02                                      ;; 18:4442 $C6 $02
    ld   [hl+], a                                 ;; 18:4444 $22
    ld   a, $C5                                   ;; 18:4445 $3E $C5
    ld   [hl+], a                                 ;; 18:4447 $22
    ld   a, $7F                                   ;; 18:4448 $3E $7F
    ld   [hl+], a                                 ;; 18:444A $22
    ld   [hl], $00                                ;; 18:444B $36 $00
    ret                                           ;; 18:444D $C9

label_018_444E:
    call label_2887                               ;; 18:444E $CD $87 $28
    ld   a, $1B                                   ;; 18:4451 $3E $1B
    ld   [wDrawCommandsSize], a                   ;; 18:4453 $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 18:4456 $21 $01 $D6
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 18:4459 $F0 $CF
    add  $02                                      ;; 18:445B $C6 $02
    ld   e, a                                     ;; 18:445D $5F
    ld   [hl+], a                                 ;; 18:445E $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:445F $F0 $D0
    add  $03                                      ;; 18:4461 $C6 $03
    ld   [hl+], a                                 ;; 18:4463 $22
    ld   a, $C5                                   ;; 18:4464 $3E $C5
    ld   [hl+], a                                 ;; 18:4466 $22
    ld   a, $7F                                   ;; 18:4467 $3E $7F
    ld   [hl+], a                                 ;; 18:4469 $22
    ld   a, e                                     ;; 18:446A $7B
    ld   [hl+], a                                 ;; 18:446B $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:446C $F0 $D0
    add  $04                                      ;; 18:446E $C6 $04
    ld   [hl+], a                                 ;; 18:4470 $22
    ld   a, $85                                   ;; 18:4471 $3E $85
    ld   [hl+], a                                 ;; 18:4473 $22
    ld   a, $02                                   ;; 18:4474 $3E $02
    ld   [hl+], a                                 ;; 18:4476 $22
    ld   a, $7F                                   ;; 18:4477 $3E $7F
    ld   [hl+], a                                 ;; 18:4479 $22
    ld   [hl+], a                                 ;; 18:447A $22
    ld   [hl+], a                                 ;; 18:447B $22
    ld   [hl+], a                                 ;; 18:447C $22
    ld   a, $0E                                   ;; 18:447D $3E $0E
    ld   [hl+], a                                 ;; 18:447F $22
    ld   a, e                                     ;; 18:4480 $7B
    ld   [hl+], a                                 ;; 18:4481 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:4482 $F0 $D0
    add  $05                                      ;; 18:4484 $C6 $05
    ld   [hl+], a                                 ;; 18:4486 $22
    ld   a, $85                                   ;; 18:4487 $3E $85
    ld   [hl+], a                                 ;; 18:4489 $22
    ld   a, $03                                   ;; 18:448A $3E $03
    ld   [hl+], a                                 ;; 18:448C $22
    ld   a, $05                                   ;; 18:448D $3E $05
    ld   [hl+], a                                 ;; 18:448F $22
    ld   a, $7F                                   ;; 18:4490 $3E $7F
    ld   [hl+], a                                 ;; 18:4492 $22
    ld   [hl+], a                                 ;; 18:4493 $22
    ld   a, $07                                   ;; 18:4494 $3E $07
    ld   [hl+], a                                 ;; 18:4496 $22
    ld   a, $0F                                   ;; 18:4497 $3E $0F
    ld   [hl+], a                                 ;; 18:4499 $22
    ld   [hl], $00                                ;; 18:449A $36 $00
    ret                                           ;; 18:449C $C9

label_018_449D:
    call label_2887                               ;; 18:449D $CD $87 $28
    ld   a, $15                                   ;; 18:44A0 $3E $15
    ld   [wDrawCommandsSize], a                   ;; 18:44A2 $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 18:44A5 $21 $01 $D6
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 18:44A8 $F0 $CF
    add  $02                                      ;; 18:44AA $C6 $02
    ld   e, a                                     ;; 18:44AC $5F
    ld   [hl+], a                                 ;; 18:44AD $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:44AE $F0 $D0
    ld   [hl+], a                                 ;; 18:44B0 $22
    ld   a, $83                                   ;; 18:44B1 $3E $83
    ld   [hl+], a                                 ;; 18:44B3 $22
    xor  a                                        ;; 18:44B4 $AF
    ld   [hl+], a                                 ;; 18:44B5 $22
    ld   a, $04                                   ;; 18:44B6 $3E $04
    ld   [hl+], a                                 ;; 18:44B8 $22
    ld   a, $06                                   ;; 18:44B9 $3E $06
    ld   [hl+], a                                 ;; 18:44BB $22
    ld   a, $0C                                   ;; 18:44BC $3E $0C
    ld   [hl+], a                                 ;; 18:44BE $22
    ld   a, e                                     ;; 18:44BF $7B
    ld   [hl+], a                                 ;; 18:44C0 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:44C1 $F0 $D0
    add  $01                                      ;; 18:44C3 $C6 $01
    ld   [hl+], a                                 ;; 18:44C5 $22
    ld   a, $83                                   ;; 18:44C6 $3E $83
    ld   [hl+], a                                 ;; 18:44C8 $22
    ld   a, $01                                   ;; 18:44C9 $3E $01
    ld   [hl+], a                                 ;; 18:44CB $22
    ld   a, $7F                                   ;; 18:44CC $3E $7F
    ld   [hl+], a                                 ;; 18:44CE $22
    ld   [hl+], a                                 ;; 18:44CF $22
    ld   a, $0D                                   ;; 18:44D0 $3E $0D
    ld   [hl+], a                                 ;; 18:44D2 $22
    ld   a, e                                     ;; 18:44D3 $7B
    ld   [hl+], a                                 ;; 18:44D4 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:44D5 $F0 $D0
    add  $02                                      ;; 18:44D7 $C6 $02
    ld   [hl+], a                                 ;; 18:44D9 $22
    ld   a, $83                                   ;; 18:44DA $3E $83
    ld   [hl+], a                                 ;; 18:44DC $22
    ld   a, $02                                   ;; 18:44DD $3E $02
    ld   [hl+], a                                 ;; 18:44DF $22
    ld   a, $7F                                   ;; 18:44E0 $3E $7F
    ld   [hl+], a                                 ;; 18:44E2 $22
    ld   [hl+], a                                 ;; 18:44E3 $22
    ld   a, $0E                                   ;; 18:44E4 $3E $0E
    ld   [hl+], a                                 ;; 18:44E6 $22
    ld   a, e                                     ;; 18:44E7 $7B
    ld   [hl+], a                                 ;; 18:44E8 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 18:44E9 $F0 $D0
    add  $03                                      ;; 18:44EB $C6 $03
    ld   [hl+], a                                 ;; 18:44ED $22
    ld   a, $83                                   ;; 18:44EE $3E $83
    ld   [hl+], a                                 ;; 18:44F0 $22
    ld   a, $03                                   ;; 18:44F1 $3E $03
    ld   [hl+], a                                 ;; 18:44F3 $22
    ld   a, $05                                   ;; 18:44F4 $3E $05
    ld   [hl+], a                                 ;; 18:44F6 $22
    ld   a, $07                                   ;; 18:44F7 $3E $07
    ld   [hl+], a                                 ;; 18:44F9 $22
    ld   a, $0F                                   ;; 18:44FA $3E $0F
    ld   [hl+], a                                 ;; 18:44FC $22
    ld   [hl], $00                                ;; 18:44FD $36 $00
    ret                                           ;; 18:44FF $C9
