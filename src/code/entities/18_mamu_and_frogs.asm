
; Note: this entity, unlike most others, use all 4 spriteslots.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
MamuAndFrogsEntityHandler::
    ld   a, [wC116]                               ; $4000: $FA $16 $C1
    and  a                                        ; $4003: $A7
    jr   nz, .jr_400F                             ; $4004: $20 $09

    inc  a                                        ; $4006: $3C
    ld   [wC116], a                               ; $4007: $EA $16 $C1
    ld   a, TILEMAP_MAMU                          ; $400A: $3E $14
    ld   [wBGMapToLoad], a                        ; $400C: $EA $FF $D6

.jr_400F
    ldh  a, [hActiveEntityPosX]                   ; $400F: $F0 $EE
    cp   $48                                      ; $4011: $FE $48
    jp   nz, label_018_4373                       ; $4013: $C2 $73 $43

    call func_018_435A                            ; $4016: $CD $5A $43
    call PushLinkOutOfEntity_18                   ; $4019: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $401C: $F0 $F0
    JP_TABLE                                      ; $401E
._00 dw MamuAndFrogsState0Handler
._01 dw MamuAndFrogsState1Handler
._02 dw MamuAndFrogsSingingHandler
._03 dw MamuAndFrogsState3Handler
._04 dw MamuAndFrogsGrantSongHandler
._05 dw MamuAndFrogsState5Handler
._06 dw MamuAndFrogsState6Handler

MamuAndFrogsState0Handler::
    xor  a                                        ; $402D: $AF
    ld   [wD201], a                               ; $402E: $EA $01 $D2
    ld   a, [wOcarinaSongFlags]                   ; $4031: $FA $49 $DB
    and  FROGS_SONG_OF_THE_SOUL_FLAG              ; $4034: $E6 $01
    jr   z, .jr_404A                              ; $4036: $28 $12

    ldh  a, [hLinkPositionY]                      ; $4038: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $403A: $21 $EF $FF
    sub  [hl]                                     ; $403D: $96
    add  $28                                      ; $403E: $C6 $28
    cp   $50                                      ; $4040: $FE $50
    call func_018_7DA0                            ; $4042: $CD $A0 $7D
    jr   nc, func_018_407C                        ; $4045: $30 $35

    jp   label_018_42B2                           ; $4047: $C3 $B2 $42

.jr_404A
    ldh  a, [hLinkPositionY]                      ; $404A: $F0 $99
    cp   $4C                                      ; $404C: $FE $4C
    jr   nc, func_018_407C                        ; $404E: $30 $2C

    ld   a, $4C                                   ; $4050: $3E $4C
    ldh  [hLinkPositionY], a                      ; $4052: $E0 $99
    call ClearLinkPositionIncrement               ; $4054: $CD $8E $17
    call ResetSpinAttack                          ; $4057: $CD $AF $0C
    ld   e, INVENTORY_SLOT_COUNT - 1              ; $405A: $1E $0B
    ld   hl, wInventoryItems.BButtonSlot          ; $405C: $21 $00 $DB

.loop_405F
    ld   a, [hl+]                                 ; $405F: $2A
    cp   INVENTORY_OCARINA                        ; $4060: $FE $09
    jr   z, .jr_4074                              ; $4062: $28 $10

    dec  e                                        ; $4064: $1D
    ld   a, e                                     ; $4065: $7B
    cp   $FF                                      ; $4066: $FE $FF
    jr   nz, .loop_405F                           ; $4068: $20 $F5

    ld_dialog_low a, Dialog0DB                    ; $406A: $3E $DB
    call MamuOpenDialogAtBottom                   ; $406C: $CD $87 $40
    call IncrementEntityState                     ; $406F: $CD $12 $3B
    ld   [hl], b                                  ; $4072: $70
    ret                                           ; $4073: $C9

.jr_4074
    ld_dialog_low a, Dialog0DC                    ; $4074: $3E $DC
    call MamuOpenDialogAtBottom                   ; $4076: $CD $87 $40
    call IncrementEntityState                     ; $4079: $CD $12 $3B

func_018_407C::
    ldh  a, [hFrameCounter]                       ; $407C: $F0 $E7
    rra                                           ; $407E: $1F
    rra                                           ; $407F: $1F
    rra                                           ; $4080: $1F
    rra                                           ; $4081: $1F
    and  $01                                      ; $4082: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4084: $C3 $0C $3B

MamuOpenDialogAtBottom::
    ld   e, a                                     ; $4087: $5F
    ldh  a, [hLinkPositionY]                      ; $4088: $F0 $99
    push af                                       ; $408A: $F5
    ld   a, $10                                   ; $408B: $3E $10
    ldh  [hLinkPositionY], a                      ; $408D: $E0 $99
    ld   a, e                                     ; $408F: $7B
    call OpenDialogInTable0                       ; $4090: $CD $85 $23
    pop  af                                       ; $4093: $F1
    ldh  [hLinkPositionY], a                      ; $4094: $E0 $99
    ret                                           ; $4096: $C9

MamuAndFrogsState1Handler::
    call func_018_407C                            ; $4097: $CD $7C $40
    ld   a, [wDialogState]                        ; $409A: $FA $9F $C1
    and  a                                        ; $409D: $A7
    jr   nz, ret_018_40D6                         ; $409E: $20 $36

    call IncrementEntityState                     ; $40A0: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ; $40A3: $FA $77 $C1
    and  a                                        ; $40A6: $A7
    jr   z, jr_018_40AF                           ; $40A7: $28 $06

jr_018_40A9:
    ld   [hl], b                                  ; $40A9: $70
    ld_dialog_low a, Dialog0DE                    ; $40AA: $3E $DE
    jp   MamuOpenDialogAtBottom                   ; $40AC: $C3 $87 $40

jr_018_40AF:
    ld   a, [wRupeeCountHigh]                     ; $40AF: $FA $5D $DB
    cp   $03                                      ; $40B2: $FE $03
    jr   c, jr_018_40A9                           ; $40B4: $38 $F3

    ld   a, [wSubstractRupeeBufferLow]            ; $40B6: $FA $92 $DB
    add  $2C                                      ; $40B9: $C6 $2C
    ld   [wSubstractRupeeBufferLow], a            ; $40BB: $EA $92 $DB
    ld   a, [wSubstractRupeeBufferHigh]           ; $40BE: $FA $91 $DB
    adc  $01                                      ; $40C1: $CE $01
    ld   [wSubstractRupeeBufferHigh], a           ; $40C3: $EA $91 $DB
    call GetEntityTransitionCountdown             ; $40C6: $CD $05 $0C
    ld   [hl], $FF                                ; $40C9: $36 $FF
    call label_27F2                               ; $40CB: $CD $F2 $27
    call func_018_45A0                            ; $40CE: $CD $A0 $45
    ld   a, $01                                   ; $40D1: $3E $01
    ld   [wAlternateBackgroundEnabled], a         ; $40D3: $EA $00 $C5

ret_018_40D6:
    ret                                           ; $40D6: $C9

; Frogs start singing
MamuAndFrogsSingingHandler::
    ld   a, $02                                   ; $40D7: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $40D9: $E0 $A1
    ld   [wC167], a                               ; $40DB: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $40DE: $CD $05 $0C
    jr   nz, .ret_40F0                            ; $40E1: $20 $0D

    ld   a, MUSIC_MAMU_FROG_SONG                  ; $40E3: $3E $35
    ld   [wMusicTrackToPlay], a                   ; $40E5: $EA $68 $D3
    ld   a, $01                                   ; $40E8: $3E $01
    ld   [wD215], a                               ; $40EA: $EA $15 $D2
    jp   IncrementEntityState                     ; $40ED: $C3 $12 $3B

.ret_40F0
    ret                                           ; $40F0: $C9

func_018_40F1::
    ld   a, $30                                   ; $40F1: $3E $30
    ldh  [hIntersectedObjectTop], a               ; $40F3: $E0 $CD
    ld   a, $18                                   ; $40F5: $3E $18
    ldh  [hIntersectedObjectLeft], a              ; $40F7: $E0 $CE
    jp   label_018_449D                           ; $40F9: $C3 $9D $44

func_018_40FC::
    ld   a, $30                                   ; $40FC: $3E $30
    ldh  [hIntersectedObjectTop], a               ; $40FE: $E0 $CD
    ld   a, $68                                   ; $4100: $3E $68
    ldh  [hIntersectedObjectLeft], a              ; $4102: $E0 $CE
    jp   label_018_449D                           ; $4104: $C3 $9D $44

func_018_4107::
    ld   a, $38                                   ; $4107: $3E $38
    ldh  [hIntersectedObjectLeft], a              ; $4109: $E0 $CE
    ld   a, $08                                   ; $410B: $3E $08
    ldh  [hIntersectedObjectTop], a               ; $410D: $E0 $CD
    jp   label_018_4402                           ; $410F: $C3 $02 $44

func_018_4112::
    ld   a, $38                                   ; $4112: $3E $38
    ldh  [hIntersectedObjectLeft], a              ; $4114: $E0 $CE
    ld   a, $08                                   ; $4116: $3E $08
    ldh  [hIntersectedObjectTop], a               ; $4118: $E0 $CD
    jp   label_018_444E                           ; $411A: $C3 $4E $44

    ret                                           ; $411D: $C9

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
    ld   a, $02                                   ; $41CC: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $41CE: $E0 $A1
    ld   [wC167], a                               ; $41D0: $EA $67 $C1
    ld   a, [wD211]                               ; $41D3: $FA $11 $D2
    and  a                                        ; $41D6: $A7
    jr   nz, .jr_41F9                             ; $41D7: $20 $20

    ld   a, [wD210]                               ; $41D9: $FA $10 $D2
    cp   $00                                      ; $41DC: $FE $00
    call z, func_018_4107                         ; $41DE: $CC $07 $41
    ld   a, [wD210]                               ; $41E1: $FA $10 $D2
    cp   $01                                      ; $41E4: $FE $01
    call z, func_018_4112                         ; $41E6: $CC $12 $41
    ld   a, [wD210]                               ; $41E9: $FA $10 $D2
    cp   $38                                      ; $41EC: $FE $38
    call z, func_018_40F1                         ; $41EE: $CC $F1 $40
    ld   a, [wD210]                               ; $41F1: $FA $10 $D2
    cp   $70                                      ; $41F4: $FE $70
    call z, func_018_40FC                         ; $41F6: $CC $FC $40

.jr_41F9
    ld   a, [wD210]                               ; $41F9: $FA $10 $D2
    add  $01                                      ; $41FC: $C6 $01
    ld   [wD210], a                               ; $41FE: $EA $10 $D2
    ld   e, a                                     ; $4201: $5F
    ld   a, [wD211]                               ; $4202: $FA $11 $D2
    adc  $00                                      ; $4205: $CE $00
    ld   [wD211], a                               ; $4207: $EA $11 $D2
    ld   d, a                                     ; $420A: $57
    cp   $06                                      ; $420B: $FE $06
    jr   nz, .jr_4220                             ; $420D: $20 $11

    ld   a, e                                     ; $420F: $7B
    cp   $20                                      ; $4210: $FE $20
    jr   nz, .jr_4220                             ; $4212: $20 $0C

    ld_dialog_low a, Dialog0DD                    ; $4214: $3E $DD
    call MamuOpenDialogAtBottom                   ; $4216: $CD $87 $40
    xor  a                                        ; $4219: $AF
    ld   [wAlternateBackgroundEnabled], a         ; $421A: $EA $00 $C5
    jp   IncrementEntityState                     ; $421D: $C3 $12 $3B

.jr_4220
    ld   a, [wD212]                               ; $4220: $FA $12 $D2
    inc  a                                        ; $4223: $3C
    cp   $1C                                      ; $4224: $FE $1C
    jr   nz, .jr_4230                             ; $4226: $20 $08

    ld   a, [wD213]                               ; $4228: $FA $13 $D2
    inc  a                                        ; $422B: $3C
    ld   [wD213], a                               ; $422C: $EA $13 $D2
    xor  a                                        ; $422F: $AF

.jr_4230
    ld   [wD212], a                               ; $4230: $EA $12 $D2
    ld   a, [wD213]                               ; $4233: $FA $13 $D2
    ld   e, a                                     ; $4236: $5F
    ld   d, b                                     ; $4237: $50
    ld   hl, Data_018_411E                        ; $4238: $21 $1E $41
    add  hl, de                                   ; $423B: $19
    ld   a, [hl]                                  ; $423C: $7E
    call SetEntitySpriteVariant                   ; $423D: $CD $0C $3B
    ld   hl, Data_018_4158                        ; $4240: $21 $58 $41
    add  hl, de                                   ; $4243: $19
    ld   a, [hl]                                  ; $4244: $7E
    ld   [wEntitiesSpriteVariantTable+1], a       ; $4245: $EA $B1 $C3
    ld   hl, Data_018_4192                        ; $4248: $21 $92 $41
    add  hl, de                                   ; $424B: $19
    ld   a, [hl]                                  ; $424C: $7E
    ld   [wEntitiesSpriteVariantTable+2], a       ; $424D: $EA $B2 $C3
    ret                                           ; $4250: $C9

IF !__OPTIMIZATIONS_1__
    ret                                           ; $4251: $C9
ENDC

; When you receive the Frog Song 'item'
MamuAndFrogsGrantSongHandler::
    ld   a, [wDialogState]                        ; $4252: $FA $9F $C1
    and  a                                        ; $4255: $A7
    jr   nz, .jr_4268                             ; $4256: $20 $10

    ld   [wD215], a                               ; $4258: $EA $15 $D2
    call GetEntityTransitionCountdown             ; $425B: $CD $05 $0C
    ld   [hl], $70                                ; $425E: $36 $70
    ld   a, MUSIC_OBTAIN_ITEM                     ; $4260: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $4262: $EA $68 $D3
    call IncrementEntityState                     ; $4265: $CD $12 $3B

.jr_4268
    jp   func_018_407C                            ; $4268: $C3 $7C $40

MamuAndFrogsState5Handler::
    call GetEntityTransitionCountdown             ; $426B: $CD $05 $0C
    jr   nz, .jr_427D                             ; $426E: $20 $0D

    ld   a, $02                                   ; $4270: $3E $02
    ld   [wSelectedSongIndex], a                  ; $4272: $EA $4A $DB
    ld   hl, wOcarinaSongFlags                    ; $4275: $21 $49 $DB
    set  FROGS_SONG_OF_THE_SOUL_FLAG_BIT, [hl]    ; $4278: $CB $C6
    jp   IncrementEntityState                     ; $427A: $C3 $12 $3B

.jr_427D
    cp   $08                                      ; $427D: $FE $08
    jr   nz, .jr_4287                             ; $427F: $20 $06

    dec  [hl]                                     ; $4281: $35
    ld_dialog_low a, Dialog0DF                    ; $4282: $3E $DF
    call MamuOpenDialogAtBottom                   ; $4284: $CD $87 $40

.jr_4287
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ; $4287: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4289: $E0 $9D
    ld   a, $02                                   ; $428B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $428D: $E0 $A1
    ldh  a, [hLinkPositionX]                      ; $428F: $F0 $98
    ldh  [hActiveEntityPosX], a                   ; $4291: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $4293: $F0 $99
    sub  $0C                                      ; $4295: $D6 $0C
    ldh  [hActiveEntityVisualPosY], a             ; $4297: $E0 $EC
    ld   de, Data_018_474D                        ; $4299: $11 $4D $47
    xor  a                                        ; $429C: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $429D: $E0 $F1
    call RenderActiveEntitySprite                 ; $429F: $CD $77 $3C
    jp   func_018_407C                            ; $42A2: $C3 $7C $40

MamuAndFrogsState6Handler::
    ld   a, [wDialogState]                        ; $42A5: $FA $9F $C1
    and  a                                        ; $42A8: $A7
    jr   nz, jr_018_42B7                          ; $42A9: $20 $0C

    ld   [wC167], a                               ; $42AB: $EA $67 $C1
    call IncrementEntityState                     ; $42AE: $CD $12 $3B
    ld   [hl], b                                  ; $42B1: $70

label_018_42B2:
    ld_dialog_low a, Dialog0E0                    ; $42B2: $3E $E0
    call MamuOpenDialogAtBottom                   ; $42B4: $CD $87 $40

jr_018_42B7:
    jp   func_018_407C                            ; $42B7: $C3 $7C $40

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
    ldh  a, [hActiveEntitySpriteVariant]          ; $435A: $F0 $F1
    rla                                           ; $435C: $17
    rla                                           ; $435D: $17
    rla                                           ; $435E: $17

.jr_435F
    rla                                           ; $435F: $17
    rla                                           ; $4360: $17
    and  $E0                                      ; $4361: $E6 $E0
    ld   e, a                                     ; $4363: $5F
    ld   d, b                                     ; $4364: $50
    ld   hl, Data_018_42BA                        ; $4365: $21 $BA $42
    add  hl, de                                   ; $4368: $19
    ld   c, $08                                   ; $4369: $0E $08
    call RenderActiveEntitySpritesRect            ; $436B: $CD $E6 $3C
    ld   a, $04                                   ; $436E: $3E $04
    jp   func_015_7964_trampoline                 ; $4370: $C3 $A0 $3D

label_018_4373:
    ld   hl, wEntitiesPosYTable                   ; $4373: $21 $10 $C2
    add  hl, bc                                   ; $4376: $09
    ld   [hl], $4A                                ; $4377: $36 $4A
    ld   hl, wEntitiesHitboxFlagsTable            ; $4379: $21 $50 $C3
    add  hl, bc                                   ; $437C: $09
    ld   [hl], $98                                ; $437D: $36 $98
    call ConfigureEntityHitbox                    ; $437F: $CD $EA $3A
    call func_018_43E3                            ; $4382: $CD $E3 $43
    call PushLinkOutOfEntity_18                   ; $4385: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $4388: $F0 $F0
    JP_TABLE                                      ; $438A
._00 dw func_018_438F                             ; $438B
._01 dw func_018_439A                             ; $438D

func_018_438F::
    call GetRandomByte                            ; $438F: $CD $0D $28
    ld   hl, wEntitiesInertiaTable                ; $4392: $21 $D0 $C3
    add  hl, bc                                   ; $4395: $09
    ld   [hl], a                                  ; $4396: $77
    call IncrementEntityState                     ; $4397: $CD $12 $3B

func_018_439A::
    ld   a, [wD215]                               ; $439A: $FA $15 $D2
    and  a                                        ; $439D: $A7
    jp   nz, label_018_43B2                       ; $439E: $C2 $B2 $43

.jr_43A1
    ld   hl, wEntitiesInertiaTable                ; $43A1: $21 $D0 $C3
    add  hl, bc                                   ; $43A4: $09
    inc  [hl]                                     ; $43A5: $34
    ld   a, [hl]                                  ; $43A6: $7E
    ld   e, $00                                   ; $43A7: $1E $00
    and  $30                                      ; $43A9: $E6 $30
    jr   z, .jr_43AE                              ; $43AB: $28 $01

    inc  e                                        ; $43AD: $1C

.jr_43AE
    ld   a, e                                     ; $43AE: $7B
    jp   SetEntitySpriteVariant                   ; $43AF: $C3 $0C $3B

label_018_43B2:
    ret                                           ; $43B2: $C9

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
    ldh  a, [hActiveEntitySpriteVariant]          ; $43E3: $F0 $F1
    cp   $04                                      ; $43E5: $FE $04
    jr   nc, .jr_43EF                             ; $43E7: $30 $06

    ld   de, MamuAndFrogsSpriteVariants           ; $43E9: $11 $B3 $43
    jp   RenderActiveEntitySpritesPair            ; $43EC: $C3 $C0 $3B

.jr_43EF
    sub  $04                                      ; $43EF: $D6 $04
    rla                                           ; $43F1: $17
    rla                                           ; $43F2: $17
    rla                                           ; $43F3: $17
    rla                                           ; $43F4: $17
    and  $F0                                      ; $43F5: $E6 $F0
    ld   e, a                                     ; $43F7: $5F
    ld   d, b                                     ; $43F8: $50
    ld   hl, MamuAndFrogsSpriteList               ; $43F9: $21 $C3 $43
    add  hl, de                                   ; $43FC: $19
    ld   c, $04                                   ; $43FD: $0E $04
    jp   RenderActiveEntitySpritesRect            ; $43FF: $C3 $E6 $3C

label_018_4402:
    call label_2887                               ; $4402: $CD $87 $28
    ld   a, $1B                                   ; $4405: $3E $1B
    ld   [wDrawCommandsSize], a                   ; $4407: $EA $00 $D6
    ld   hl, wDrawCommand                         ; $440A: $21 $01 $D6
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $440D: $F0 $CF
    add  $02                                      ; $440F: $C6 $02
    ld   e, a                                     ; $4411: $5F

.jr_4412
    ld   [hl+], a                                 ; $4412: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $4413: $F0 $D0
    ld   [hl+], a                                 ; $4415: $22
    ld   a, $85                                   ; $4416: $3E $85

.jr_4418
    ld   [hl+], a                                 ; $4418: $22
    xor  a                                        ; $4419: $AF
    ld   [hl+], a                                 ; $441A: $22
    ld   a, $04                                   ; $441B: $3E $04
    ld   [hl+], a                                 ; $441D: $22

.jr_441E
    ld   a, $7F                                   ; $441E: $3E $7F
    ld   [hl+], a                                 ; $4420: $22
    ld   [hl+], a                                 ; $4421: $22
    ld   a, $06                                   ; $4422: $3E $06
    ld   [hl+], a                                 ; $4424: $22
    ld   a, $0C                                   ; $4425: $3E $0C
    ld   [hl+], a                                 ; $4427: $22
    ld   a, e                                     ; $4428: $7B
    ld   [hl+], a                                 ; $4429: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $442A: $F0 $D0
    add  $01                                      ; $442C: $C6 $01
    ld   [hl+], a                                 ; $442E: $22
    ld   a, $85                                   ; $442F: $3E $85
    ld   [hl+], a                                 ; $4431: $22
    ld   a, $01                                   ; $4432: $3E $01
    ld   [hl+], a                                 ; $4434: $22
    ld   a, $7F                                   ; $4435: $3E $7F
    ld   [hl+], a                                 ; $4437: $22
    ld   [hl+], a                                 ; $4438: $22
    ld   [hl+], a                                 ; $4439: $22
    ld   [hl+], a                                 ; $443A: $22
    ld   a, $0D                                   ; $443B: $3E $0D
    ld   [hl+], a                                 ; $443D: $22
    ld   a, e                                     ; $443E: $7B
    ld   [hl+], a                                 ; $443F: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $4440: $F0 $D0
    add  $02                                      ; $4442: $C6 $02
    ld   [hl+], a                                 ; $4444: $22
    ld   a, $C5                                   ; $4445: $3E $C5
    ld   [hl+], a                                 ; $4447: $22
    ld   a, $7F                                   ; $4448: $3E $7F
    ld   [hl+], a                                 ; $444A: $22
    ld   [hl], $00                                ; $444B: $36 $00
    ret                                           ; $444D: $C9

label_018_444E:
    call label_2887                               ; $444E: $CD $87 $28
    ld   a, $1B                                   ; $4451: $3E $1B
    ld   [wDrawCommandsSize], a                   ; $4453: $EA $00 $D6
    ld   hl, wDrawCommand                         ; $4456: $21 $01 $D6
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $4459: $F0 $CF
    add  $02                                      ; $445B: $C6 $02
    ld   e, a                                     ; $445D: $5F
    ld   [hl+], a                                 ; $445E: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $445F: $F0 $D0
    add  $03                                      ; $4461: $C6 $03
    ld   [hl+], a                                 ; $4463: $22
    ld   a, $C5                                   ; $4464: $3E $C5
    ld   [hl+], a                                 ; $4466: $22
    ld   a, $7F                                   ; $4467: $3E $7F
    ld   [hl+], a                                 ; $4469: $22
    ld   a, e                                     ; $446A: $7B
    ld   [hl+], a                                 ; $446B: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $446C: $F0 $D0
    add  $04                                      ; $446E: $C6 $04
    ld   [hl+], a                                 ; $4470: $22
    ld   a, $85                                   ; $4471: $3E $85
    ld   [hl+], a                                 ; $4473: $22
    ld   a, $02                                   ; $4474: $3E $02
    ld   [hl+], a                                 ; $4476: $22
    ld   a, $7F                                   ; $4477: $3E $7F
    ld   [hl+], a                                 ; $4479: $22
    ld   [hl+], a                                 ; $447A: $22
    ld   [hl+], a                                 ; $447B: $22
    ld   [hl+], a                                 ; $447C: $22
    ld   a, $0E                                   ; $447D: $3E $0E
    ld   [hl+], a                                 ; $447F: $22
    ld   a, e                                     ; $4480: $7B
    ld   [hl+], a                                 ; $4481: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $4482: $F0 $D0
    add  $05                                      ; $4484: $C6 $05
    ld   [hl+], a                                 ; $4486: $22
    ld   a, $85                                   ; $4487: $3E $85
    ld   [hl+], a                                 ; $4489: $22
    ld   a, $03                                   ; $448A: $3E $03
    ld   [hl+], a                                 ; $448C: $22
    ld   a, $05                                   ; $448D: $3E $05
    ld   [hl+], a                                 ; $448F: $22
    ld   a, $7F                                   ; $4490: $3E $7F
    ld   [hl+], a                                 ; $4492: $22
    ld   [hl+], a                                 ; $4493: $22
    ld   a, $07                                   ; $4494: $3E $07
    ld   [hl+], a                                 ; $4496: $22
    ld   a, $0F                                   ; $4497: $3E $0F
    ld   [hl+], a                                 ; $4499: $22
    ld   [hl], $00                                ; $449A: $36 $00
    ret                                           ; $449C: $C9

label_018_449D:
    call label_2887                               ; $449D: $CD $87 $28
    ld   a, $15                                   ; $44A0: $3E $15
    ld   [wDrawCommandsSize], a                   ; $44A2: $EA $00 $D6
    ld   hl, wDrawCommand                         ; $44A5: $21 $01 $D6
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $44A8: $F0 $CF
    add  $02                                      ; $44AA: $C6 $02
    ld   e, a                                     ; $44AC: $5F
    ld   [hl+], a                                 ; $44AD: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $44AE: $F0 $D0
    ld   [hl+], a                                 ; $44B0: $22
    ld   a, $83                                   ; $44B1: $3E $83
    ld   [hl+], a                                 ; $44B3: $22
    xor  a                                        ; $44B4: $AF
    ld   [hl+], a                                 ; $44B5: $22
    ld   a, $04                                   ; $44B6: $3E $04
    ld   [hl+], a                                 ; $44B8: $22
    ld   a, $06                                   ; $44B9: $3E $06
    ld   [hl+], a                                 ; $44BB: $22
    ld   a, $0C                                   ; $44BC: $3E $0C
    ld   [hl+], a                                 ; $44BE: $22
    ld   a, e                                     ; $44BF: $7B
    ld   [hl+], a                                 ; $44C0: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $44C1: $F0 $D0
    add  $01                                      ; $44C3: $C6 $01
    ld   [hl+], a                                 ; $44C5: $22
    ld   a, $83                                   ; $44C6: $3E $83
    ld   [hl+], a                                 ; $44C8: $22
    ld   a, $01                                   ; $44C9: $3E $01
    ld   [hl+], a                                 ; $44CB: $22
    ld   a, $7F                                   ; $44CC: $3E $7F
    ld   [hl+], a                                 ; $44CE: $22
    ld   [hl+], a                                 ; $44CF: $22
    ld   a, $0D                                   ; $44D0: $3E $0D
    ld   [hl+], a                                 ; $44D2: $22
    ld   a, e                                     ; $44D3: $7B
    ld   [hl+], a                                 ; $44D4: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $44D5: $F0 $D0
    add  $02                                      ; $44D7: $C6 $02
    ld   [hl+], a                                 ; $44D9: $22
    ld   a, $83                                   ; $44DA: $3E $83
    ld   [hl+], a                                 ; $44DC: $22
    ld   a, $02                                   ; $44DD: $3E $02
    ld   [hl+], a                                 ; $44DF: $22
    ld   a, $7F                                   ; $44E0: $3E $7F
    ld   [hl+], a                                 ; $44E2: $22
    ld   [hl+], a                                 ; $44E3: $22
    ld   a, $0E                                   ; $44E4: $3E $0E
    ld   [hl+], a                                 ; $44E6: $22
    ld   a, e                                     ; $44E7: $7B
    ld   [hl+], a                                 ; $44E8: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $44E9: $F0 $D0
    add  $03                                      ; $44EB: $C6 $03
    ld   [hl+], a                                 ; $44ED: $22
    ld   a, $83                                   ; $44EE: $3E $83
    ld   [hl+], a                                 ; $44F0: $22
    ld   a, $03                                   ; $44F1: $3E $03
    ld   [hl+], a                                 ; $44F3: $22
    ld   a, $05                                   ; $44F4: $3E $05
    ld   [hl+], a                                 ; $44F6: $22
    ld   a, $07                                   ; $44F7: $3E $07
    ld   [hl+], a                                 ; $44F9: $22
    ld   a, $0F                                   ; $44FA: $3E $0F
    ld   [hl+], a                                 ; $44FC: $22
    ld   [hl], $00                                ; $44FD: $36 $00
    ret                                           ; $44FF: $C9
