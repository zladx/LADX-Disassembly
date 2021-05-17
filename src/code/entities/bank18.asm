; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis


; Note: this entity, unlike most others, use all 4 spriteslots.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
MamuAndFrogsEntityHandler::
    ld   a, [wC116]                               ; $4000: $FA $16 $C1
    and  a                                        ; $4003: $A7
    jr   nz, jr_018_400F                          ; $4004: $20 $09

    inc  a                                        ; $4006: $3C
    ld   [wC116], a                               ; $4007: $EA $16 $C1
    ld   a, $14                                   ; $400A: $3E $14
    ld   [wBGMapToLoad], a                        ; $400C: $EA $FF $D6

jr_018_400F:
    ldh  a, [hActiveEntityPosX]                   ; $400F: $F0 $EE
    cp   $48                                      ; $4011: $FE $48
    jp   nz, label_018_4373                       ; $4013: $C2 $73 $43

    call func_018_435A                            ; $4016: $CD $5A $43
    call func_018_7D36                            ; $4019: $CD $36 $7D
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
    ld   [$D201], a                               ; $402E: $EA $01 $D2
    ld   a, [wOcarinaSongFlags]                   ; $4031: $FA $49 $DB
    and  FROGS_SONG_OF_THE_SOUL_FLAG              ; $4034: $E6 $01
    jr   z, jr_018_404A                           ; $4036: $28 $12

    ldh  a, [hLinkPositionY]                      ; $4038: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $403A: $21 $EF $FF
    sub  [hl]                                     ; $403D: $96
    add  $28                                      ; $403E: $C6 $28
    cp   $50                                      ; $4040: $FE $50
    call func_018_7DA0                            ; $4042: $CD $A0 $7D
    jr   nc, func_018_407C                        ; $4045: $30 $35

    jp   label_018_42B2                           ; $4047: $C3 $B2 $42

jr_018_404A:
    ldh  a, [hLinkPositionY]                      ; $404A: $F0 $99
    cp   $4C                                      ; $404C: $FE $4C
    jr   nc, func_018_407C                        ; $404E: $30 $2C

    ld   a, $4C                                   ; $4050: $3E $4C
    ldh  [hLinkPositionY], a                      ; $4052: $E0 $99
    call ClearLinkPositionIncrement               ; $4054: $CD $8E $17
    call ResetSpinAttack                          ; $4057: $CD $AF $0C
    ld   e, INVENTORY_SLOT_COUNT -1               ; $405A: $1E $0B
    ld   hl, wBButtonSlot                         ; $405C: $21 $00 $DB

jr_018_405F:
    ld   a, [hl+]                                 ; $405F: $2A
    cp   INVENTORY_OCARINA                        ; $4060: $FE $09
    jr   z, jr_018_4074                           ; $4062: $28 $10

    dec  e                                        ; $4064: $1D
    ld   a, e                                     ; $4065: $7B
    cp   $FF                                      ; $4066: $FE $FF
    jr   nz, jr_018_405F                          ; $4068: $20 $F5

    ld   a, $DB                                   ; $406A: $3E $DB
    call func_018_4087                            ; $406C: $CD $87 $40
    call IncrementEntityState                     ; $406F: $CD $12 $3B
    ld   [hl], b                                  ; $4072: $70
    ret                                           ; $4073: $C9

jr_018_4074:
    ld   a, $DC                                   ; $4074: $3E $DC
    call func_018_4087                            ; $4076: $CD $87 $40
    call IncrementEntityState                     ; $4079: $CD $12 $3B

func_018_407C::
    ldh  a, [hFrameCounter]                       ; $407C: $F0 $E7
    rra                                           ; $407E: $1F
    rra                                           ; $407F: $1F
    rra                                           ; $4080: $1F
    rra                                           ; $4081: $1F
    and  $01                                      ; $4082: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4084: $C3 $0C $3B

func_018_4087::
    ld   e, a                                     ; $4087: $5F
    ldh  a, [hLinkPositionY]                      ; $4088: $F0 $99
    push af                                       ; $408A: $F5
    ld   a, $10                                   ; $408B: $3E $10
    ldh  [hLinkPositionY], a                      ; $408D: $E0 $99
    ld   a, e                                     ; $408F: $7B
    call OpenDialog                               ; $4090: $CD $85 $23
    pop  af                                       ; $4093: $F1
    ldh  [hLinkPositionY], a                      ; $4094: $E0 $99
    ret                                           ; $4096: $C9

MamuAndFrogsState1Handler::
    call func_018_407C                            ; $4097: $CD $7C $40
    ld   a, [wDialogState]                        ; $409A: $FA $9F $C1
    and  a                                        ; $409D: $A7
    jr   nz, jr_018_40D6                          ; $409E: $20 $36

    call IncrementEntityState                     ; $40A0: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]                               ; $40A3: $FA $77 $C1
    and  a                                        ; $40A6: $A7
    jr   z, jr_018_40AF                           ; $40A7: $28 $06

jr_018_40A9:
    ld   [hl], b                                  ; $40A9: $70
    ld   a, $DE                                   ; $40AA: $3E $DE
    jp   func_018_4087                            ; $40AC: $C3 $87 $40

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

jr_018_40D6:
    ret                                           ; $40D6: $C9

; Frogs start singing
MamuAndFrogsSingingHandler::
    ld   a, $02                                   ; $40D7: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $40D9: $E0 $A1
    ld   [wC167], a                               ; $40DB: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $40DE: $CD $05 $0C
    jr   nz, jr_018_40F0                          ; $40E1: $20 $0D

    ld   a, MUSIC_MAMU_SONG                       ; $40E3: $3E $35
    ld   [wMusicTrackToPlay], a                   ; $40E5: $EA $68 $D3
    ld   a, $01                                   ; $40E8: $3E $01
    ld   [$D215], a                               ; $40EA: $EA $15 $D2
    jp   IncrementEntityState                     ; $40ED: $C3 $12 $3B

jr_018_40F0:
    ret                                           ; $40F0: $C9

func_018_40F1::
    ld   a, $30                                   ; $40F1: $3E $30
    ldh  [hSwordIntersectedAreaY], a              ; $40F3: $E0 $CD
    ld   a, $18                                   ; $40F5: $3E $18
    ldh  [hSwordIntersectedAreaX], a              ; $40F7: $E0 $CE
    jp   label_018_449D                           ; $40F9: $C3 $9D $44

func_018_40FC::
    ld   a, $30                                   ; $40FC: $3E $30
    ldh  [hSwordIntersectedAreaY], a              ; $40FE: $E0 $CD
    ld   a, $68                                   ; $4100: $3E $68
    ldh  [hSwordIntersectedAreaX], a              ; $4102: $E0 $CE
    jp   label_018_449D                           ; $4104: $C3 $9D $44

func_018_4107::
    ld   a, $38                                   ; $4107: $3E $38
    ldh  [hSwordIntersectedAreaX], a              ; $4109: $E0 $CE
    ld   a, $08                                   ; $410B: $3E $08
    ldh  [hSwordIntersectedAreaY], a              ; $410D: $E0 $CD
    jp   label_018_4402                           ; $410F: $C3 $02 $44

func_018_4112::
    ld   a, $38                                   ; $4112: $3E $38
    ldh  [hSwordIntersectedAreaX], a              ; $4114: $E0 $CE
    ld   a, $08                                   ; $4116: $3E $08
    ldh  [hSwordIntersectedAreaY], a              ; $4118: $E0 $CD
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
    ld   a, [$D211]                               ; $41D3: $FA $11 $D2
    and  a                                        ; $41D6: $A7
    jr   nz, jr_018_41F9                          ; $41D7: $20 $20

    ld   a, [$D210]                               ; $41D9: $FA $10 $D2
    cp   $00                                      ; $41DC: $FE $00
    call z, func_018_4107                         ; $41DE: $CC $07 $41
    ld   a, [$D210]                               ; $41E1: $FA $10 $D2
    cp   $01                                      ; $41E4: $FE $01
    call z, func_018_4112                         ; $41E6: $CC $12 $41
    ld   a, [$D210]                               ; $41E9: $FA $10 $D2
    cp   $38                                      ; $41EC: $FE $38
    call z, func_018_40F1                         ; $41EE: $CC $F1 $40
    ld   a, [$D210]                               ; $41F1: $FA $10 $D2
    cp   $70                                      ; $41F4: $FE $70
    call z, func_018_40FC                         ; $41F6: $CC $FC $40

jr_018_41F9:
    ld   a, [$D210]                               ; $41F9: $FA $10 $D2
    add  $01                                      ; $41FC: $C6 $01
    ld   [$D210], a                               ; $41FE: $EA $10 $D2
    ld   e, a                                     ; $4201: $5F
    ld   a, [$D211]                               ; $4202: $FA $11 $D2
    adc  $00                                      ; $4205: $CE $00
    ld   [$D211], a                               ; $4207: $EA $11 $D2
    ld   d, a                                     ; $420A: $57
    cp   $06                                      ; $420B: $FE $06
    jr   nz, jr_018_4220                          ; $420D: $20 $11

    ld   a, e                                     ; $420F: $7B
    cp   $20                                      ; $4210: $FE $20
    jr   nz, jr_018_4220                          ; $4212: $20 $0C

    ld   a, $DD                                   ; $4214: $3E $DD
    call func_018_4087                            ; $4216: $CD $87 $40
    xor  a                                        ; $4219: $AF
    ld   [wAlternateBackgroundEnabled], a         ; $421A: $EA $00 $C5
    jp   IncrementEntityState                     ; $421D: $C3 $12 $3B

jr_018_4220:
    ld   a, [$D212]                               ; $4220: $FA $12 $D2
    inc  a                                        ; $4223: $3C
    cp   $1C                                      ; $4224: $FE $1C
    jr   nz, jr_018_4230                          ; $4226: $20 $08

    ld   a, [$D213]                               ; $4228: $FA $13 $D2
    inc  a                                        ; $422B: $3C
    ld   [$D213], a                               ; $422C: $EA $13 $D2
    xor  a                                        ; $422F: $AF

jr_018_4230:
    ld   [$D212], a                               ; $4230: $EA $12 $D2
    ld   a, [$D213]                               ; $4233: $FA $13 $D2
    ld   e, a                                     ; $4236: $5F
    ld   d, b                                     ; $4237: $50
    ld   hl, Data_018_411E                        ; $4238: $21 $1E $41
    add  hl, de                                   ; $423B: $19
    ld   a, [hl]                                  ; $423C: $7E
    call SetEntitySpriteVariant                   ; $423D: $CD $0C $3B
    ld   hl, Data_018_4158                        ; $4240: $21 $58 $41
    add  hl, de                                   ; $4243: $19
    ld   a, [hl]                                  ; $4244: $7E
    ld   [wEntitiesSpriteVariantTable+1], a                               ; $4245: $EA $B1 $C3
    ld   hl, Data_018_4192                        ; $4248: $21 $92 $41
    add  hl, de                                   ; $424B: $19
    ld   a, [hl]                                  ; $424C: $7E
    ld   [wEntitiesSpriteVariantTable+2], a                               ; $424D: $EA $B2 $C3
    ret                                           ; $4250: $C9

IF !__PATCH_0__
    ret                                           ; $4251: $C9
ENDC

; When you receive the Frog Song 'item'
MamuAndFrogsGrantSongHandler::
    ld   a, [wDialogState]                        ; $4252: $FA $9F $C1
    and  a                                        ; $4255: $A7
    jr   nz, jr_018_4268                          ; $4256: $20 $10

    ld   [$D215], a                               ; $4258: $EA $15 $D2
    call GetEntityTransitionCountdown             ; $425B: $CD $05 $0C
    ld   [hl], $70                                ; $425E: $36 $70
    ld   a, MUSIC_TOOL_ACQUIRED                 ; $4260: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $4262: $EA $68 $D3
    call IncrementEntityState                     ; $4265: $CD $12 $3B

jr_018_4268:
    jp   func_018_407C                            ; $4268: $C3 $7C $40

MamuAndFrogsState5Handler::
    call GetEntityTransitionCountdown             ; $426B: $CD $05 $0C
    jr   nz, jr_018_427D                          ; $426E: $20 $0D

    ld   a, $02                                   ; $4270: $3E $02
    ld   [wSelectedSongIndex], a                  ; $4272: $EA $4A $DB
    ld   hl, wOcarinaSongFlags                    ; $4275: $21 $49 $DB
    set  FROGS_SONG_OF_THE_SOUL_FLAG_BIT, [hl]    ; $4278: $CB $C6
    jp   IncrementEntityState                     ; $427A: $C3 $12 $3B

jr_018_427D:
    cp   $08                                      ; $427D: $FE $08
    jr   nz, jr_018_4287                          ; $427F: $20 $06

    dec  [hl]                                     ; $4281: $35
    ld   a, $DF                                   ; $4282: $3E $DF
    call func_018_4087                            ; $4284: $CD $87 $40

jr_018_4287:
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM       ; $4287: $3E $6C
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
    ld   a, $E0                                   ; $42B2: $3E $E0
    call func_018_4087                            ; $42B4: $CD $87 $40

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

jr_018_435F:
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
    jp   label_3DA0                               ; $4370: $C3 $A0 $3D

label_018_4373:
    ld   hl, wEntitiesPosYTable                   ; $4373: $21 $10 $C2
    add  hl, bc                                   ; $4376: $09
    ld   [hl], $4A                                ; $4377: $36 $4A
    ld   hl, wEntitiesHitboxFlagsTable            ; $4379: $21 $50 $C3
    add  hl, bc                                   ; $437C: $09
    ld   [hl], $98                                ; $437D: $36 $98
    call ConfigureEntityHitbox                    ; $437F: $CD $EA $3A
    call func_018_43E3                            ; $4382: $CD $E3 $43
    call func_018_7D36                            ; $4385: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $4388: $F0 $F0
    JP_TABLE                                      ; $438A
._00 dw func_018_438F                             ; $438B
._01 dw func_018_439A                             ; $438D

func_018_438F::
    call GetRandomByte                            ; $438F: $CD $0D $28
    ld   hl, wEntitiesUnknowTableY                ; $4392: $21 $D0 $C3
    add  hl, bc                                   ; $4395: $09
    ld   [hl], a                                  ; $4396: $77
    call IncrementEntityState                     ; $4397: $CD $12 $3B

func_018_439A::
    ld   a, [$D215]                               ; $439A: $FA $15 $D2
    and  a                                        ; $439D: $A7
    jp   nz, label_018_43B2                       ; $439E: $C2 $B2 $43

jr_018_43A1:
    ld   hl, wEntitiesUnknowTableY                ; $43A1: $21 $D0 $C3
    add  hl, bc                                   ; $43A4: $09
    inc  [hl]                                     ; $43A5: $34
    ld   a, [hl]                                  ; $43A6: $7E
    ld   e, $00                                   ; $43A7: $1E $00
    and  $30                                      ; $43A9: $E6 $30
    jr   z, jr_018_43AE                           ; $43AB: $28 $01

    inc  e                                        ; $43AD: $1C

jr_018_43AE:
    ld   a, e                                     ; $43AE: $7B
    jp   SetEntitySpriteVariant                   ; $43AF: $C3 $0C $3B

label_018_43B2:
    ret                                           ; $43B2: $C9

Data_018_43B3::
    db   $58, $00, $58, $20, $5A, $00, $5A, $20, $5C, $00, $5E, $00, $5E, $20, $5C, $20

Data_018_43C3::
    db   $F0, $00, $50, $00, $F0, $08, $52, $00, $00, $00, $54, $00, $00, $08, $56, $00
    db   $F0, $00, $52, $20, $F0, $08, $50, $20, $00, $00, $56, $20, $00, $08, $54, $20

func_018_43E3::
    ldh  a, [hActiveEntitySpriteVariant]          ; $43E3: $F0 $F1
    cp   $04                                      ; $43E5: $FE $04
    jr   nc, jr_018_43EF                          ; $43E7: $30 $06

    ld   de, Data_018_43B3                        ; $43E9: $11 $B3 $43
    jp   RenderActiveEntitySpritesPair            ; $43EC: $C3 $C0 $3B

jr_018_43EF:
    sub  $04                                      ; $43EF: $D6 $04
    rla                                           ; $43F1: $17
    rla                                           ; $43F2: $17
    rla                                           ; $43F3: $17
    rla                                           ; $43F4: $17
    and  $F0                                      ; $43F5: $E6 $F0
    ld   e, a                                     ; $43F7: $5F
    ld   d, b                                     ; $43F8: $50
    ld   hl, Data_018_43C3                        ; $43F9: $21 $C3 $43
    add  hl, de                                   ; $43FC: $19
    ld   c, $04                                   ; $43FD: $0E $04
    jp   RenderActiveEntitySpritesRect            ; $43FF: $C3 $E6 $3C

label_018_4402:
    call label_2887                               ; $4402: $CD $87 $28
    ld   a, $1B                                   ; $4405: $3E $1B
    ld   [wRequests], a                           ; $4407: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $440A: $21 $01 $D6
    ldh  a, [hFFCF]                               ; $440D: $F0 $CF
    add  $02                                      ; $440F: $C6 $02
    ld   e, a                                     ; $4411: $5F

jr_018_4412:
    ld   [hl+], a                                 ; $4412: $22
    ldh  a, [hFFD0]                               ; $4413: $F0 $D0
    ld   [hl+], a                                 ; $4415: $22
    ld   a, $85                                   ; $4416: $3E $85

jr_018_4418:
    ld   [hl+], a                                 ; $4418: $22
    xor  a                                        ; $4419: $AF
    ld   [hl+], a                                 ; $441A: $22
    ld   a, $04                                   ; $441B: $3E $04
    ld   [hl+], a                                 ; $441D: $22

jr_018_441E:
    ld   a, $7F                                   ; $441E: $3E $7F
    ld   [hl+], a                                 ; $4420: $22
    ld   [hl+], a                                 ; $4421: $22
    ld   a, $06                                   ; $4422: $3E $06
    ld   [hl+], a                                 ; $4424: $22
    ld   a, $0C                                   ; $4425: $3E $0C
    ld   [hl+], a                                 ; $4427: $22
    ld   a, e                                     ; $4428: $7B
    ld   [hl+], a                                 ; $4429: $22
    ldh  a, [hFFD0]                               ; $442A: $F0 $D0
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
    ldh  a, [hFFD0]                               ; $4440: $F0 $D0
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
    ld   [wRequests], a                           ; $4453: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $4456: $21 $01 $D6
    ldh  a, [hFFCF]                               ; $4459: $F0 $CF
    add  $02                                      ; $445B: $C6 $02
    ld   e, a                                     ; $445D: $5F
    ld   [hl+], a                                 ; $445E: $22
    ldh  a, [hFFD0]                               ; $445F: $F0 $D0
    add  $03                                      ; $4461: $C6 $03
    ld   [hl+], a                                 ; $4463: $22
    ld   a, $C5                                   ; $4464: $3E $C5
    ld   [hl+], a                                 ; $4466: $22
    ld   a, $7F                                   ; $4467: $3E $7F
    ld   [hl+], a                                 ; $4469: $22
    ld   a, e                                     ; $446A: $7B
    ld   [hl+], a                                 ; $446B: $22
    ldh  a, [hFFD0]                               ; $446C: $F0 $D0
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
    ldh  a, [hFFD0]                               ; $4482: $F0 $D0
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
    ld   [wRequests], a                           ; $44A2: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $44A5: $21 $01 $D6
    ldh  a, [hFFCF]                               ; $44A8: $F0 $CF
    add  $02                                      ; $44AA: $C6 $02
    ld   e, a                                     ; $44AC: $5F
    ld   [hl+], a                                 ; $44AD: $22
    ldh  a, [hFFD0]                               ; $44AE: $F0 $D0
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
    ldh  a, [hFFD0]                               ; $44C1: $F0 $D0
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
    ldh  a, [hFFD0]                               ; $44D5: $F0 $D0
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
    ldh  a, [hFFD0]                               ; $44E9: $F0 $D0
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

; Note: this entity, unlike most others, use all 4 spriteslots.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
ManboAndFishesEntityHandler::
    ldh  a, [hActiveEntityVisualPosY]             ; $4500: $F0 $EC
    cp   $50                                      ; $4502: $FE $50
    jp   nc, label_018_48C8                       ; $4504: $D2 $C8 $48

    ld   hl, wEntitiesPosYTable                   ; $4507: $21 $10 $C2
    add  hl, bc                                   ; $450A: $09
    ld   [hl], $3E                                ; $450B: $36 $3E
    ld   a, [$D214]                               ; $450D: $FA $14 $D2
    and  a                                        ; $4510: $A7
    jr   z, jr_018_4517                           ; $4511: $28 $04

    dec  a                                        ; $4513: $3D
    ld   [$D214], a                               ; $4514: $EA $14 $D2

jr_018_4517:
    ld   a, [$D218]                               ; $4517: $FA $18 $D2
    and  a                                        ; $451A: $A7
    jr   z, jr_018_4521                           ; $451B: $28 $04

    dec  a                                        ; $451D: $3D
    ld   [$D218], a                               ; $451E: $EA $18 $D2

jr_018_4521:
    call func_018_4833                            ; $4521: $CD $33 $48
    call func_018_7D36                            ; $4524: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $4527: $F0 $F0
    JP_TABLE                                      ; $4529
._00 dw ManboAndFishesState0Handler
._01 dw ManboAndFishesState1Handler
._02 dw ManboAndFishesSingHandler
._03 dw ManboAndFishesState3Handler
._04 dw ManboAndFishesGrantSongHandler
._05 dw ManboAndFishesState5Handler

ManboAndFishesState0Handler::
    ld   a, [wOcarinaSongFlags]                   ; $4536: $FA $49 $DB
    and  MANBO_MAMBO_FLAG                         ; $4539: $E6 $02
    jr   z, jr_018_4547                           ; $453B: $28 $0A

    call func_018_7D7C                            ; $453D: $CD $7C $7D
    jr   nc, func_018_455C                        ; $4540: $30 $1A

    jp_open_dialog $189                           ; $4542

jr_018_4547:
IF __PATCH_0__
    ld   a, $02
    ld   [wC167], a
ENDC
    ldh  a, [hLinkPositionX]                      ; $4547: $F0 $98
    cp   $30                                      ; $4549: $FE $30
    jr   c, func_018_455C                         ; $454B: $38 $0F

    ld   a, $2F                                   ; $454D: $3E $2F
    ldh  [hLinkPositionX], a                      ; $454F: $E0 $98
    call ClearLinkPositionIncrement               ; $4551: $CD $8E $17
    call_open_dialog $185                         ; $4554
    call IncrementEntityState                     ; $4559: $CD $12 $3B

func_018_455C::
    ldh  a, [hFrameCounter]                       ; $455C: $F0 $E7
    rra                                           ; $455E: $1F
    rra                                           ; $455F: $1F
    rra                                           ; $4560: $1F
    and  $01                                      ; $4561: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4563: $C3 $0C $3B

ManboAndFishesState1Handler::
    ld   a, [wDialogState]                        ; $4566: $FA $9F $C1
    and  a                                        ; $4569: $A7
    ret  nz                                       ; $456A: $C0

    ld   a, [wDialogAskSelectionIndex]                               ; $456B: $FA $77 $C1
    and  a                                        ; $456E: $A7
    jr   nz, jr_018_4581                          ; $456F: $20 $10

    ld   e, INVENTORY_SLOT_COUNT -1               ; $4571: $1E $0B
    ld   hl, wBButtonSlot                         ; $4573: $21 $00 $DB

jr_018_4576:
    ld   a, [hl+]                                 ; $4576: $2A
    cp   INVENTORY_OCARINA                        ; $4577: $FE $09
    jr   z, jr_018_458A                           ; $4579: $28 $0F

    dec  e                                        ; $457B: $1D
    ld   a, e                                     ; $457C: $7B
    cp   $FF                                      ; $457D: $FE $FF
    jr   nz, jr_018_4576                          ; $457F: $20 $F5

jr_018_4581:
    call IncrementEntityState                     ; $4581: $CD $12 $3B
    ld   [hl], b                                  ; $4584: $70
    jp_open_dialog $18A                           ; $4585

jr_018_458A:
    call IncrementEntityState                     ; $458A: $CD $12 $3B
    jp_open_dialog $187                           ; $458D

; Manbo singing his song
ManboAndFishesSingHandler::
    ld   a, [wDialogState]                        ; $4592: $FA $9F $C1
    and  a                                        ; $4595: $A7
    jr   nz, jr_018_45B6                          ; $4596: $20 $1E

    ld   a, MUSIC_MANBO_MAMBO                     ; $4598: $3E $30
    ld   [wMusicTrackToPlay], a                   ; $459A: $EA $68 $D3
    call IncrementEntityState                     ; $459D: $CD $12 $3B

func_018_45A0::
    xor  a                                        ; $45A0: $AF
    ld   [$D210], a                               ; $45A1: $EA $10 $D2
    ld   [$D211], a                               ; $45A4: $EA $11 $D2
    ld   [$D212], a                               ; $45A7: $EA $12 $D2
    ld   [$D213], a                               ; $45AA: $EA $13 $D2
    ld   [$D217], a                               ; $45AD: $EA $17 $D2
    ld   [$D214], a                               ; $45B0: $EA $14 $D2
    ld   [$D218], a                               ; $45B3: $EA $18 $D2

jr_018_45B6:
    ret                                           ; $45B6: $C9

Data_018_45B7::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00
    db   $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00, $00, $00

Data_018_4605::
    db   $02, $01, $02, $01, $02, $01, $02, $01, $00, $00, $00, $00, $00, $01, $00, $01
    db   $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $02, $01, $02, $01
    db   $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db   $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
    db   $02, $01, $02, $01, $02, $01, $02, $02, $02, $02, $02, $02, $02, $02

Data_018_4653::
    db   $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $02, $03, $02, $03
    db   $02, $03, $02, $03, $02, $03, $02, $02, $03, $04, $05, $06, $05, $06, $05, $06
    db   $05, $06, $05, $06, $05, $06, $05, $06, $05, $06, $04, $02, $03, $02, $03, $02
    db   $03, $02, $03, $02, $03, $02, $03, $02, $04, $05, $04, $05, $03, $02, $03, $02
    db   $03, $02, $03, $02, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

ManboAndFishesState3Handler::
    ld   a, $02                                   ; $46A1: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $46A3: $E0 $A1
    ld   [wC167], a                               ; $46A5: $EA $67 $C1
    ld   a, [$D210]                               ; $46A8: $FA $10 $D2
    add  $01                                      ; $46AB: $C6 $01
    ld   [$D210], a                               ; $46AD: $EA $10 $D2
    ld   a, [$D211]                               ; $46B0: $FA $11 $D2
    adc  $00                                      ; $46B3: $CE $00
    ld   [$D211], a                               ; $46B5: $EA $11 $D2
    ld   a, [$D211]                               ; $46B8: $FA $11 $D2
    cp   $05                                      ; $46BB: $FE $05
    jr   nz, jr_018_46CF                          ; $46BD: $20 $10

    ld   a, [$D210]                               ; $46BF: $FA $10 $D2
    cp   $F0                                      ; $46C2: $FE $F0
    jr   nz, jr_018_46CF                          ; $46C4: $20 $09

    call IncrementEntityState                     ; $46C6: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $46C9: $CD $05 $0C
    ld   [hl], $20                                ; $46CC: $36 $20
    ret                                           ; $46CE: $C9

jr_018_46CF:
    ld   a, [$D212]                               ; $46CF: $FA $12 $D2
    inc  a                                        ; $46D2: $3C
    cp   $14                                      ; $46D3: $FE $14
    jr   nz, jr_018_46DF                          ; $46D5: $20 $08

    ld   a, [$D213]                               ; $46D7: $FA $13 $D2
    inc  a                                        ; $46DA: $3C
    ld   [$D213], a                               ; $46DB: $EA $13 $D2
    xor  a                                        ; $46DE: $AF

jr_018_46DF:
    ld   [$D212], a                               ; $46DF: $EA $12 $D2
    ld   a, [$D213]                               ; $46E2: $FA $13 $D2
    ld   e, a                                     ; $46E5: $5F
    ld   d, b                                     ; $46E6: $50
    ld   hl, Data_018_4605                        ; $46E7: $21 $05 $46
    add  hl, de                                   ; $46EA: $19
    ld   a, [hl]                                  ; $46EB: $7E
    call SetEntitySpriteVariant                   ; $46EC: $CD $0C $3B
    ld   hl, Data_018_45B7                        ; $46EF: $21 $B7 $45
    add  hl, de                                   ; $46F2: $19
    ld   a, [hl]                                  ; $46F3: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $46F4: $21 $B0 $C2
    add  hl, bc                                   ; $46F7: $09
    ld   [hl], a                                  ; $46F8: $77
    ld   hl, Data_018_4653                        ; $46F9: $21 $53 $46
    add  hl, de                                   ; $46FC: $19
    ld   a, [hl]                                  ; $46FD: $7E
    ld   [$D215], a                               ; $46FE: $EA $15 $D2
    ld   a, [$D211]                               ; $4701: $FA $11 $D2
    ld   d, a                                     ; $4704: $57
    ld   a, [$D210]                               ; $4705: $FA $10 $D2
    ld   e, a                                     ; $4708: $5F
    cp   $CC                                      ; $4709: $FE $CC
    jr   nz, jr_018_4712                          ; $470B: $20 $05

    ld   a, d                                     ; $470D: $7A
    cp   $00                                      ; $470E: $FE $00
    jr   z, jr_018_4722                           ; $4710: $28 $10

jr_018_4712:
    ld   a, e                                     ; $4712: $7B
    cp   $BE                                      ; $4713: $FE $BE
    jr   nz, jr_018_471C                          ; $4715: $20 $05

    ld   a, d                                     ; $4717: $7A
    cp   $05                                      ; $4718: $FE $05
    jr   z, jr_018_471D                           ; $471A: $28 $01

jr_018_471C:
    ret                                           ; $471C: $C9

jr_018_471D:
    ld   a, $28                                   ; $471D: $3E $28
    ld   [$D214], a                               ; $471F: $EA $14 $D2

jr_018_4722:
    call GetEntityPrivateCountdown1               ; $4722: $CD $00 $0C
    ld   [hl], $28                                ; $4725: $36 $28
    ret                                           ; $4727: $C9

Data_018_4728::
    db   $00, $00, $40, $00, $00, $08, $42, $00, $00, $10, $44, $00

ManboAndFishesGrantSongHandler::
    call GetEntityTransitionCountdown             ; $4734: $CD $05 $0C
    jr   nz, jr_018_4746                          ; $4737: $20 $0D

    ld   [hl], $70                                ; $4739: $36 $70
    ld   a, MUSIC_TOOL_ACQUIRED                   ; $473B: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $473D: $EA $68 $D3
    ld   [wC167], a                               ; $4740: $EA $67 $C1
    call IncrementEntityState                     ; $4743: $CD $12 $3B

jr_018_4746:
    ld   a, $02                                   ; $4746: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4748: $E0 $A1
    jp   func_018_455C                            ; $474A: $C3 $5C $45

Data_018_474D::
    db   $90, $17

ManboAndFishesState5Handler::
    call func_018_455C                            ; $474F: $CD $5C $45
    call GetEntityTransitionCountdown             ; $4752: $CD $05 $0C
    jr   nz, jr_018_476A                          ; $4755: $20 $13

    ld   a, FROGS_SONG_OF_THE_SOUL_FLAG           ; $4757: $3E $01
    ld   [wSelectedSongIndex], a                  ; $4759: $EA $4A $DB
    ld   hl, wOcarinaSongFlags                    ; $475C: $21 $49 $DB
    set  MANBO_MAMBO_FLAG_BIT, [hl]               ; $475F: $CB $CE
    xor  a                                        ; $4761: $AF
    ld   [wC167], a                               ; $4762: $EA $67 $C1
    call IncrementEntityState                     ; $4765: $CD $12 $3B
    ld   [hl], b                                  ; $4768: $70
    ret                                           ; $4769: $C9

jr_018_476A:
    cp   $08                                      ; $476A: $FE $08
    jr   nz, jr_018_4774                          ; $476C: $20 $06

    dec  [hl]                                     ; $476E: $35
    call_open_dialog $188                         ; $476F

jr_018_4774:
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM       ; $4774: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4776: $E0 $9D
    ld   a, $02                                   ; $4778: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $477A: $E0 $A1
    ldh  a, [hLinkPositionX]                      ; $477C: $F0 $98
    ldh  [hActiveEntityPosX], a                   ; $477E: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $4780: $F0 $99
    sub  $0C                                      ; $4782: $D6 $0C
    ldh  [hActiveEntityVisualPosY], a             ; $4784: $E0 $EC
    ld   de, Data_018_474D                        ; $4786: $11 $4D $47
    xor  a                                        ; $4789: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $478A: $E0 $F1
    jp   RenderActiveEntitySprite                 ; $478C: $C3 $77 $3C

Data_018_478F::
    db   $00, $00, $50, $00, $00, $08, $52, $00, $10, $00, $54, $00, $10, $08, $56, $00
    db   $F8, $10, $58, $00, $08, $10, $5A, $00, $18, $10, $5C, $00, $00, $18, $5E, $00
    db   $10, $18, $5E, $40, $00, $00, $50, $00, $00, $08, $52, $00, $10, $00, $4A, $00
    db   $10, $08, $4C, $00, $F8, $10, $58, $00, $08, $10, $4E, $00, $18, $10, $5C, $00
    db   $00, $18, $5E, $00, $10, $18, $5E, $40, $00, $00, $50, $00, $00, $08, $52, $00
    db   $10, $00, $54, $00, $10, $08, $56, $00, $F8, $10, $60, $00, $08, $10, $5A, $00
    db   $18, $10, $62, $00, $00, $18, $5E, $00, $10, $18, $5E, $40, $00, $00, $46, $00
    db   $00, $08, $48, $00, $10, $00, $4A, $00, $10, $08, $4C, $00, $F8, $10, $60, $00
    db   $08, $10, $4E, $00, $18, $10, $62, $00, $00, $18, $5E, $00, $10, $18, $5E, $40

Data_018_481F::
    db   $FF, $FF, $FF, $FF, $64, $00, $66, $00, $64, $40, $66, $40, $66, $60, $64, $60
    db   $66, $20, $64, $20

func_018_4833::
    ld   hl, wEntitiesPrivateState1Table          ; $4833: $21 $B0 $C2
    add  hl, bc                                   ; $4836: $09
    ld   a, [hl]                                  ; $4837: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $4838: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $483A: $F0 $EC
    add  $03                                      ; $483C: $C6 $03
    ldh  [hActiveEntityVisualPosY], a             ; $483E: $E0 $EC
    ld   de, Data_018_481F                        ; $4840: $11 $1F $48
    call RenderActiveEntitySpritesPair            ; $4843: $CD $C0 $3B
    ld   a, $02                                   ; $4846: $3E $02
    call label_3DA0                               ; $4848: $CD $A0 $3D
    call CopyEntityPositionToActivePosition       ; $484B: $CD $8A $3D
    call GetEntityPrivateCountdown1               ; $484E: $CD $00 $0C
    jr   z, jr_018_4857                           ; $4851: $28 $04

    ld   a, $03                                   ; $4853: $3E $03

jr_018_4855:
    jr   jr_018_485C                              ; $4855: $18 $05

jr_018_4857:
    ld   hl, wEntitiesSpriteVariantTable          ; $4857: $21 $B0 $C3
    add  hl, bc                                   ; $485A: $09
    ld   a, [hl]                                  ; $485B: $7E

jr_018_485C:
    rla                                           ; $485C: $17
    rla                                           ; $485D: $17
    and  $FC                                      ; $485E: $E6 $FC
    ld   e, a                                     ; $4860: $5F
    rla                                           ; $4861: $17
    rla                                           ; $4862: $17
    rla                                           ; $4863: $17
    and  $E0                                      ; $4864: $E6 $E0
    add  e                                        ; $4866: $83
    ld   e, a                                     ; $4867: $5F
    ld   d, b                                     ; $4868: $50
    ld   hl, Data_018_478F                        ; $4869: $21 $8F $47
    add  hl, de                                   ; $486C: $19
    ld   c, $09                                   ; $486D: $0E $09
    call RenderActiveEntitySpritesRect            ; $486F: $CD $E6 $3C
    ld   a, $09                                   ; $4872: $3E $09
    call label_3DA0                               ; $4874: $CD $A0 $3D
    call GetEntityPrivateCountdown1               ; $4877: $CD $00 $0C
    ret  z                                        ; $487A: $C8

    ldh  a, [hActiveEntityPosX]                   ; $487B: $F0 $EE
    sub  $18                                      ; $487D: $D6 $18
    ldh  [hActiveEntityPosX], a                   ; $487F: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $4881: $F0 $EC
    sub  $10                                      ; $4883: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $4885: $E0 $EC
    ld   hl, Data_018_4728                        ; $4887: $21 $28 $47
    ld   c, $03                                   ; $488A: $0E $03
    call RenderActiveEntitySpritesRect            ; $488C: $CD $E6 $3C
    ld   a, $03                                   ; $488F: $3E $03
    jp   label_3DA0                               ; $4891: $C3 $A0 $3D

Data_018_4894::
    db   $00, $FC, $76, $00, $00, $04, $78, $00, $00, $0C, $7A, $00

Data_018_48A0::
    db   $00, $FC, $7C, $00

Data_018_48A4::
    db   $00, $04, $78, $00, $00, $0C, $7E, $00, $68, $00, $6A, $00, $6C, $00, $6E, $00
    db   $70, $00, $70, $20, $6A, $20, $68, $20, $6E, $20, $6C, $20, $72, $00, $74, $00
    db   $74, $20, $72, $20

label_018_48C8::
    call func_018_48DE
    ldh  a, [hFrameCounter]                       ; $48CB: $F0 $E7
    rra                                           ; $48CD: $1F
    rra                                           ; $48CE: $1F
    rra                                           ; $48CF: $1F
    rra                                           ; $48D0: $1F
    and  $01                                      ; $48D1: $E6 $01
    call SetEntitySpriteVariant                   ; $48D3: $CD $0C $3B
    ld   a, [$D215]                               ; $48D6: $FA $15 $D2
    and  a                                        ; $48D9: $A7
    ret  z                                        ; $48DA: $C8

    jp   SetEntitySpriteVariant                   ; $48DB: $C3 $0C $3B

func_018_48DE::
    ld   a, [$D214]                               ; $48DE: $FA $14 $D2
    and  a                                        ; $48E1: $A7
    jr   z, jr_018_4904                           ; $48E2: $28 $20

    ldh  a, [hActiveEntityPosX]                   ; $48E4: $F0 $EE
    sub  $18                                      ; $48E6: $D6 $18
    ldh  [hActiveEntityPosX], a                   ; $48E8: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $48EA: $F0 $EC
    sub  $10                                      ; $48EC: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $48EE: $E0 $EC
    ld   hl, Data_018_4728                        ; $48F0: $21 $28 $47
    ld   c, $03                                   ; $48F3: $0E $03
    call RenderActiveEntitySpritesRect            ; $48F5: $CD $E6 $3C
    ld   a, $03                                   ; $48F8: $3E $03
    call label_3DA0                               ; $48FA: $CD $A0 $3D
    call CopyEntityPositionToActivePosition       ; $48FD: $CD $8A $3D
    ld   a, $07                                   ; $4900: $3E $07
    ldh  [hActiveEntitySpriteVariant], a          ; $4902: $E0 $F1

jr_018_4904:
    ldh  a, [hActiveEntitySpriteVariant]          ; $4904: $F0 $F1
    cp   $02                                      ; $4906: $FE $02
    jr   nc, jr_018_491D                          ; $4908: $30 $13

    ld   hl, Data_018_4894                        ; $490A: $21 $94 $48
    dec  a                                        ; $490D: $3D
    jr   nz, jr_018_4913                          ; $490E: $20 $03

    ld   hl, Data_018_48A0                        ; $4910: $21 $A0 $48

jr_018_4913:
    ld   c, $03                                   ; $4913: $0E $03
    call RenderActiveEntitySpritesRect            ; $4915: $CD $E6 $3C
    ld   a, $03                                   ; $4918: $3E $03
    jp   label_3DA0                               ; $491A: $C3 $A0 $3D

jr_018_491D:
    ld   de, Data_018_48A4                        ; $491D: $11 $A4 $48
    call RenderActiveEntitySpritesPair            ; $4920: $CD $C0 $3B

jr_018_4923:
    ld   a, $02                                   ; $4923: $3E $02
    jp   label_3DA0                               ; $4925: $C3 $A0 $3D

Data_018_4928::
    db   $F0, $00, $70, $01, $F0, $08, $72, $01, $00, $00, $74, $01, $00, $08, $76, $01

MermaidStatueEntityHandler::
    ld   hl, Data_018_4928                        ; $4938: $21 $28 $49
    ld   c, $04                                   ; $493B: $0E $04
    call RenderActiveEntitySpritesRect            ; $493D: $CD $E6 $3C
    ldh  a, [hActiveEntityState]                  ; $4940: $F0 $F0
    JP_TABLE                                      ; $4942
._00 dw MermaidStatueState0Handler
._01 dw MermaidStatueState1Handler
._02 dw MermaidStatueState2Handler

MermaidStatueState0Handler::
    ldh  a, [hRoomStatus]                         ; $4949: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $494B: $E6 $20
    jr   z, jr_018_4957                           ; $494D: $28 $08

    ld   hl, wEntitiesPosXTable                   ; $494F: $21 $00 $C2
    add  hl, bc                                   ; $4952: $09
    ld   a, [hl]                                  ; $4953: $7E
    sub  $10                                      ; $4954: $D6 $10
    ld   [hl], a                                  ; $4956: $77

jr_018_4957:
    jp   IncrementEntityState                     ; $4957: $C3 $12 $3B

MermaidStatueState1Handler::
    call func_018_7D36                            ; $495A: $CD $36 $7D
    ld   a, [$DB7F]                               ; $495D: $FA $7F $DB
    and  a                                        ; $4960: $A7
    ret  nz                                       ; $4961: $C0

    call func_018_7D95                            ; $4962: $CD $95 $7D
    ret  nc                                       ; $4965: $D0

    ld   a, [wTradeSequenceItem]                  ; $4966: $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFIYING_GLASS           ; $4969: $FE $0E
    ret  z                                        ; If you have the magnifying glass, return

    cp   TRADING_ITEM_SCALE                       ; $496C: $FE $0D
    jr   nz, jr_018_498E                          ; If you don't have the mermaid scale, return

    ld   a, TRADING_ITEM_MAGNIFIYING_GLASS        ; $4970: $3E $0E
    ld   [wTradeSequenceItem], a                  ; $4972: $EA $0E $DB
    ld   a, $01                                   ; $4975: $3E $01
    ld   [$DB7F], a                               ; $4977: $EA $7F $DB
    ld   a, $04                                   ; $497A: $3E $04
    ldh  [hNoiseSfx], a                           ; $497C: $E0 $F4
    call GetEntityTransitionCountdown             ; $497E: $CD $05 $0C
    ld   [hl], $60                                ; $4981: $36 $60
    call SetRoomStatus20                            ; $4983: $CD $B9 $7F
    call_open_dialog $116                         ; $4986
    jp   IncrementEntityState                     ; $498B: $C3 $12 $3B

jr_018_498E:
    jp_open_dialog $19C                           ; $498E

MermaidStatueState2Handler::
    ld   a, $02                                   ; $4993: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4995: $E0 $A1
    ld   [wC167], a                               ; $4997: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $499A: $CD $05 $0C
    jr   nz, jr_018_49AD                          ; $499D: $20 $0E

    call IncrementEntityState                     ; $499F: $CD $12 $3B
    ld   [hl], $01                                ; $49A2: $36 $01
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $49A4: $3E $02
    ldh  [hJingle], a                             ; $49A6: $E0 $F2
    xor  a                                        ; $49A8: $AF
    ld   [wC167], a                               ; $49A9: $EA $67 $C1
    ret                                           ; $49AC: $C9

jr_018_49AD:
    cp   $40                                      ; $49AD: $FE $40
    jr   nz, jr_018_49B6                          ; $49AF: $20 $05

    ld   hl, hNoiseSfx                            ; $49B1: $21 $F4 $FF
    ld   [hl], $11                                ; $49B4: $36 $11

jr_018_49B6:
    ret  nc                                       ; $49B6: $D0

    ld   hl, wEntitiesSpeedXTable                 ; $49B7: $21 $40 $C2
    add  hl, bc                                   ; $49BA: $09
    ld   [hl], $FC                                ; $49BB: $36 $FC
    jp   AddEntitySpeedToPos_18                   ; $49BD: $C3 $6C $7E

Data_018_49C0::
    db   $FF, $FF, $FF, $FF, $54, $02, $54, $62, $54, $42, $54, $22, $56, $02, $56, $22
    db   $52, $02, $52, $22

ZoraEntityHandler::
    ld   de, Data_018_49C0                        ; $49D4: $11 $C0 $49
    call RenderActiveEntitySpritesPair            ; $49D7: $CD $C0 $3B
    ld   a, [wIsIndoor]                           ; $49DA: $FA $A5 $DB
    and  a                                        ; $49DD: $A7
    jr   z, jr_018_4A2A                           ; $49DE: $28 $4A

    ldh  a, [hMapRoom]                            ; $49E0: $F0 $F6
    cp   UNKNOWN_ROOM_DA                          ; $49E2: $FE $DA
    jr   nz, jr_018_4A2A                          ; $49E4: $20 $44

    ld   a, [wDialogState]                        ; $49E6: $FA $9F $C1
    and  a                                        ; $49E9: $A7
    ret  nz                                       ; $49EA: $C0

    ld   a, [wPhotos1]                            ; $49EB: $FA $0C $DC
    and  $01                                      ; $49EE: $E6 $01
    jp   z, ClearEntityStatusBank18               ; $49F0: $CA $08 $7F

    ld   a, [wTradeSequenceItem]                  ; $49F3: $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFIYING_GLASS           ; $49F6: $FE $0E
    jp   nz, ClearEntityStatusBank18              ; $49F8: $C2 $08 $7F

    ld   a, [$DB7F]                               ; $49FB: $FA $7F $DB
    and  a                                        ; $49FE: $A7
    jp   nz, ClearEntityStatusBank18              ; $49FF: $C2 $08 $7F

    ld   a, [wPhotos2]                            ; $4A02: $FA $0D $DC
    and  $01                                      ; $4A05: $E6 $01
    jr   nz, jr_018_4A0E                          ; $4A07: $20 $05

    ld   a, $18                                   ; $4A09: $3E $18
    jp   func_036_4A77_trampoline                 ; $4A0B: $C3 $DE $0A

jr_018_4A0E:
    call func_018_7D95                            ; $4A0E: $CD $95 $7D
    jr   nc, jr_018_4A18                          ; $4A11: $30 $05

    call_open_dialog $126                         ; $4A13

jr_018_4A18:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4A18: $21 $40 $C3
    add  hl, bc                                   ; $4A1B: $09
    ld   a, [hl]                                  ; $4A1C: $7E
    or   $80                                      ; $4A1D: $F6 $80
    ld   [hl], a                                  ; $4A1F: $77
    call CheckLinkCollisionWithEnemy_trampoline   ; $4A20: $CD $5A $3B
    ret  nc                                       ; $4A23: $D0

    call CopyLinkFinalPositionToPosition          ; $4A24: $CD $BE $0C
    jp   ResetPegasusBoots                        ; $4A27: $C3 $B6 $0C

jr_018_4A2A:
    call func_018_7DE8                            ; $4A2A: $CD $E8 $7D
    call func_018_7E15                            ; $4A2D: $CD $15 $7E
    ldh  a, [hActiveEntityState]                  ; $4A30: $F0 $F0
    JP_TABLE                                      ; $4A32
._00 dw ZoraState0Handler
._01 dw ZoraState1Handler
._02 dw ZoraState2Handler
._03 dw ZoraState3Handler

ZoraState0Handler::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4A3B: $21 $40 $C3
    add  hl, bc                                   ; $4A3E: $09
    set  6, [hl]                                  ; $4A3F: $CB $F6
    call GetRandomByte                            ; $4A41: $CD $0D $28
    and  $07                                      ; $4A44: $E6 $07
    ld   e, a                                     ; $4A46: $5F
    ld   d, b                                     ; $4A47: $50
    ld   hl, Data_018_6385                        ; $4A48: $21 $85 $63
    add  hl, de                                   ; $4A4B: $19
    ld   a, [hl]                                  ; $4A4C: $7E
    ld   hl, wEntitiesPosXTable                   ; $4A4D: $21 $00 $C2
    add  hl, bc                                   ; $4A50: $09
    ld   [hl], a                                  ; $4A51: $77
    ld   hl, Data_018_637D                        ; $4A52: $21 $7D $63
    add  hl, de                                   ; $4A55: $19
    ld   a, [hl]                                  ; $4A56: $7E
    ld   hl, wEntitiesPosYTable                   ; $4A57: $21 $10 $C2
    add  hl, bc                                   ; $4A5A: $09
    ld   [hl], a                                  ; $4A5B: $77
    call func_018_6493                            ; $4A5C: $CD $93 $64
    ldh  a, [hMultiPurpose3]                      ; $4A5F: $F0 $DA
    cp   $07                                      ; $4A61: $FE $07
    ret  nz                                       ; $4A63: $C0

    call GetEntityTransitionCountdown             ; $4A64: $CD $05 $0C
    call GetRandomByte                            ; $4A67: $CD $0D $28
    and  $7F                                      ; $4A6A: $E6 $7F
    or   $40                                      ; $4A6C: $F6 $40
    ld   [hl], a                                  ; $4A6E: $77
    jp   IncrementEntityState                     ; $4A6F: $C3 $12 $3B

ZoraState1Handler::
    call GetEntityTransitionCountdown             ; $4A72: $CD $05 $0C
    ret  nz                                       ; $4A75: $C0

    ld   [hl], $60                                ; $4A76: $36 $60
    jp   IncrementEntityState                     ; $4A78: $C3 $12 $3B

ZoraState2Handler::
    call GetEntityTransitionCountdown             ; $4A7B: $CD $05 $0C
    jr   nz, jr_018_4A90                          ; $4A7E: $20 $10

    ld   [hl], $60                                ; $4A80: $36 $60
    ld   hl, wEntitiesUnknowTableY                ; $4A82: $21 $D0 $C3
    add  hl, bc                                   ; $4A85: $09
    ld   [hl], b                                  ; $4A86: $70
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4A87: $21 $40 $C3
    add  hl, bc                                   ; $4A8A: $09
    res  6, [hl]                                  ; $4A8B: $CB $B6
    jp   IncrementEntityState                     ; $4A8D: $C3 $12 $3B

jr_018_4A90:
    and  $04                                      ; $4A90: $E6 $04
    ld   a, $01                                   ; $4A92: $3E $01
    jr   z, jr_018_4A97                           ; $4A94: $28 $01

    inc  a                                        ; $4A96: $3C

jr_018_4A97:
    jp   SetEntitySpriteVariant                   ; $4A97: $C3 $0C $3B

Data_018_4A9A::
    db   $00, $00, $01, $02, $02, $02, $01, $00

ZoraState3Handler::
    ld   hl, wEntitiesUnknowTableY                ; $4AA2: $21 $D0 $C3
    add  hl, bc                                   ; $4AA5: $09
    ld   a, [hl]                                  ; $4AA6: $7E
    inc  [hl]                                     ; $4AA7: $34
    rra                                           ; $4AA8: $1F
    rra                                           ; $4AA9: $1F
    rra                                           ; $4AAA: $1F
    and  $07                                      ; $4AAB: $E6 $07
    ld   e, a                                     ; $4AAD: $5F
    ld   d, b                                     ; $4AAE: $50
    ld   hl, Data_018_4A9A                        ; $4AAF: $21 $9A $4A
    add  hl, de                                   ; $4AB2: $19
    ld   a, [hl]                                  ; $4AB3: $7E
    ld   hl, wEntitiesPosZTable                   ; $4AB4: $21 $10 $C3
    add  hl, bc                                   ; $4AB7: $09
    ld   [hl], a                                  ; $4AB8: $77
    call label_3B39                               ; $4AB9: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $4ABC: $CD $05 $0C
    jr   nz, jr_018_4ADC                          ; $4ABF: $20 $1B

    call IncrementEntityState                     ; $4AC1: $CD $12 $3B
    ld   [hl], b                                  ; $4AC4: $70
    xor  a                                        ; $4AC5: $AF
    call SetEntitySpriteVariant                   ; $4AC6: $CD $0C $3B
    ld   a, JINGLE_WATER_DIVE                     ; $4AC9: $3E $0E
    ldh  [hJingle], a                             ; $4ACB: $E0 $F2
    ldh  a, [hActiveEntityPosX]                   ; $4ACD: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4ACF: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4AD1: $F0 $EC
    add  $00                                      ; $4AD3: $C6 $00
    ldh  [hMultiPurpose1], a                      ; $4AD5: $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $4AD7: $3E $01
    jp   AddTranscientVfx                         ; $4AD9: $C3 $C7 $0C

jr_018_4ADC:
    cp   $30                                      ; $4ADC: $FE $30
    jr   nz, jr_018_4B03                          ; $4ADE: $20 $23

    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ; $4AE0: $3E $7D
    call SpawnNewEntity_trampoline                ; $4AE2: $CD $86 $3B
    jr   c, jr_018_4B03                           ; $4AE5: $38 $1C

    ldh  a, [hMultiPurpose0]                      ; $4AE7: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4AE9: $21 $00 $C2
    add  hl, de                                   ; $4AEC: $19
    ld   [hl], a                                  ; $4AED: $77
    ldh  a, [hMultiPurpose1]                      ; $4AEE: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4AF0: $21 $10 $C2
    add  hl, de                                   ; $4AF3: $19
    ld   [hl], a                                  ; $4AF4: $77
    ld   hl, wEntitiesPrivateState1Table          ; $4AF5: $21 $B0 $C2
    add  hl, de                                   ; $4AF8: $19
    inc  [hl]                                     ; $4AF9: $34
    push bc                                       ; $4AFA: $C5
    ld   c, e                                     ; $4AFB: $4B
    ld   b, d                                     ; $4AFC: $42
    ld   a, $18                                   ; $4AFD: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $4AFF: $CD $AA $3B
    pop  bc                                       ; $4B02: $C1

jr_018_4B03:
    call GetEntityTransitionCountdown             ; $4B03: $CD $05 $0C
    ld   e, $03                                   ; $4B06: $1E $03
    cp   $50                                      ; $4B08: $FE $50
    jr   nc, jr_018_4B11                          ; $4B0A: $30 $05

    cp   $20                                      ; $4B0C: $FE $20
    jr   c, jr_018_4B11                           ; $4B0E: $38 $01

    inc  e                                        ; $4B10: $1C

jr_018_4B11:
    ld   a, e                                     ; $4B11: $7B
    jp   SetEntitySpriteVariant                   ; $4B12: $C3 $0C $3B

Data_018_4B15::
    db   $00, $00, $70, $01, $00, $08, $72, $01, $10, $00, $74, $01, $10, $08, $74, $21
    db   $00, $00, $72, $21, $00, $08, $70, $21, $10, $00, $74, $01, $10, $08, $74, $21
    db   $00, $00, $78, $21, $00, $08, $76, $21, $10, $00, $74, $01, $10, $08, $74, $21
    db   $00, $00, $76, $01, $00, $08, $78, $01, $10, $00, $74, $01, $10, $08, $74, $21

Data_018_4B55::
    db   $00, $00, $70, $00, $00, $08, $72, $00, $10, $00, $74, $00, $10, $08, $74, $20
    db   $00, $00, $72, $20, $00, $08, $70, $20, $10, $00, $74, $00, $10, $08, $74, $20
    db   $00, $00, $78, $20, $00, $08, $76, $20, $10, $00, $74, $00, $10, $08, $74, $20
    db   $00, $00, $76, $00, $00, $08, $78, $00, $10, $00, $74, $00, $10, $08, $74, $20

Data_018_4B95::
    db   $7A, $02, $7C, $02

Data_018_4B99::
    db   $7E, $02, $7E, $22

MrWriteEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $4B9D: $F0 $F1
    rla                                           ; $4B9F: $17
    rla                                           ; $4BA0: $17
    rla                                           ; $4BA1: $17
    rla                                           ; $4BA2: $17
    and  $F0                                      ; $4BA3: $E6 $F0
    ld   e, a                                     ; $4BA5: $5F
    ld   d, b                                     ; $4BA6: $50
    ldh  a, [hMapRoom]                            ; $4BA7: $F0 $F6
    cp   UNKNOWN_ROOM_A8                          ; $4BA9: $FE $A8
    jr   nz, jr_018_4BB2                          ; $4BAB: $20 $05

    ld   hl, Data_018_4B55                        ; $4BAD: $21 $55 $4B
    jr   jr_018_4BB5                              ; $4BB0: $18 $03

jr_018_4BB2:
    ld   hl, Data_018_4B15                        ; $4BB2: $21 $15 $4B

jr_018_4BB5:
    add  hl, de                                   ; $4BB5: $19
    ld   c, $04                                   ; $4BB6: $0E $04
    call RenderActiveEntitySpritesRect            ; $4BB8: $CD $E6 $3C
    ld   a, $04                                   ; $4BBB: $3E $04
    call label_3DA0                               ; $4BBD: $CD $A0 $3D
    ldh  a, [hFrameCounter]                       ; $4BC0: $F0 $E7
    rra                                           ; $4BC2: $1F
    rra                                           ; $4BC3: $1F
    rra                                           ; $4BC4: $1F
    rra                                           ; $4BC5: $1F
    rra                                           ; $4BC6: $1F
    and  $01                                      ; $4BC7: $E6 $01
    call SetEntitySpriteVariant                   ; $4BC9: $CD $0C $3B
    call func_018_7EC2                            ; $4BCC: $CD $C2 $7E
    add  $0C                                      ; $4BCF: $C6 $0C
    cp   $18                                      ; $4BD1: $FE $18
    jr   nc, jr_018_4BE4                          ; $4BD3: $30 $0F

    call func_018_7EB2                            ; $4BD5: $CD $B2 $7E
    add  $10                                      ; $4BD8: $C6 $10
    cp   $20                                      ; $4BDA: $FE $20
    jr   nc, jr_018_4BE4                          ; $4BDC: $30 $06

    ld   a, e                                     ; $4BDE: $7B
    add  $02                                      ; $4BDF: $C6 $02
    call SetEntitySpriteVariant                   ; $4BE1: $CD $0C $3B

jr_018_4BE4:
    call func_018_7D36                            ; $4BE4: $CD $36 $7D
    ldh  a, [hMapRoom]                            ; $4BE7: $F0 $F6
    cp   UNKNOWN_ROOM_A8                          ; $A8 = Mr. Write's house
    jp   z, label_018_4C75                        ; $4BEB: $CA $75 $4C

    ld   de, Data_018_4B95                        ; $4BEE: $11 $95 $4B
    ld   a, [wTradeSequenceItem]                  ; $4BF1: $FA $0E $DB
    cp   TRADING_ITEM_LETTER                      ; $4BF4: $FE $09
    jr   nc, jr_018_4BFB                          ; $4BF6: $30 $03

    ld   de, Data_018_4B99                        ; $4BF8: $11 $99 $4B

jr_018_4BFB:
    xor  a                                        ; $4BFB: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4BFC: $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ; $4BFE: $F0 $EE
    add  $18                                      ; $4C00: $C6 $18
    ldh  [hActiveEntityPosX], a                   ; $4C02: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $4C04: $F0 $EC
    add  $08                                      ; $4C06: $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ; $4C08: $E0 $EC
    call RenderActiveEntitySpritesPair            ; $4C0A: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4C0D: $CD $8A $3D
    call func_018_7DE8                            ; $4C10: $CD $E8 $7D
    ldh  a, [hActiveEntityState]                  ; $4C13: $F0 $F0
    JP_TABLE                                      ; $4C15
._00 dw MrWriteState0Handler
._01 dw MrWriteState1Handler
._02 dw MrWriteState2Handler

MrWriteState0Handler::
    ld   a, [wGameplayType]                       ; $4C1C: $FA $95 $DB
    cp   $0B                                      ; $4C1F: $FE $0B
    ret  nz                                       ; $4C21: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4C22: $FA $6B $C1
    cp   $04                                      ; $4C25: $FE $04
    ret  nz                                       ; $4C27: $C0

    call func_018_7D89                            ; $4C28: $CD $89 $7D
    ret  nc                                       ; $4C2B: $D0

    ld   a, [wTradeSequenceItem]                  ; $4C2C: $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ; $4C2F: $FE $08
    jr   nz, jr_018_4C3B                          ; $4C31: $20 $08

    call_open_dialog $167                         ; $4C33
    jp   IncrementEntityState                     ; $4C38: $C3 $12 $3B

jr_018_4C3B:
    ld   a, $66                                   ; $4C3B: $3E $66
    jr   c, jr_018_4C41                           ; $4C3D: $38 $02

    ld   a, $6B                                   ; $4C3F: $3E $6B

jr_018_4C41:
    jp   OpenDialogInTable1                       ; $4C41: $C3 $73 $23

MrWriteState1Handler::
    ld   a, [wDialogState]                        ; $4C44: $FA $9F $C1
    and  a                                        ; $4C47: $A7
    jr   nz, jr_018_4C58                          ; $4C48: $20 $0E

    call IncrementEntityState                     ; $4C4A: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]                               ; $4C4D: $FA $77 $C1
    and  a                                        ; $4C50: $A7
    jr   nz, jr_018_4C58                          ; $4C51: $20 $05

    jp_open_dialog $168                           ; $4C53

jr_018_4C58:
    ld   [hl], b                                  ; $4C58: $70
    jp_open_dialog $169                           ; $4C59

MrWriteState2Handler::
    ld   a, [wDialogState]                        ; $4C5E: $FA $9F $C1
    and  a                                        ; $4C61: $A7
    jr   nz, jr_018_4C74                          ; $4C62: $20 $10

    call IncrementEntityState                     ; $4C64: $CD $12 $3B
    ld   [hl], b                                  ; $4C67: $70
    call CreateTradingItemEntity                  ; $4C68: $CD $0C $0C
    ld   a, TRADING_ITEM_LETTER                   ; $4C6B: $3E $09
    ld   [wTradeSequenceItem], a                  ; $4C6D: $EA $0E $DB
    ld   a, $0D                                   ; $4C70: $3E $0D
    ldh  [hFFA5], a                               ; $4C72: $E0 $A5

jr_018_4C74:
    ret                                           ; $4C74: $C9

label_018_4C75:
    call func_018_7DE8                            ; $4C75: $CD $E8 $7D
    ldh  a, [hActiveEntityState]                  ; $4C78: $F0 $F0
    JP_TABLE                                      ; $4C7A
._00 dw func_018_4C87                             ; $4C7B
._01 dw func_018_4CA3                             ; $4C7D
._02 dw func_018_4CAB                             ; $4C7F
._03 dw func_018_4CBE                             ; $4C81
._04 dw func_018_4CD1                             ; $4C83
._05 dw func_018_4CF2                             ; $4C85

func_018_4C87::
    call func_018_7D89                            ; $4C87: $CD $89 $7D
    ret  nc                                       ; $4C8A: $D0

    ld   a, [wTradeSequenceItem]                  ; $4C8B: $FA $0E $DB
    cp   TRADING_ITEM_LETTER                      ; $4C8E: $FE $09
    jr   nz, jr_018_4C9A                          ; $4C90: $20 $08

    call_open_dialog $134                         ; $4C92
    jp   IncrementEntityState                     ; $4C97: $C3 $12 $3B

jr_018_4C9A:
    ld   a, $33                                   ; $4C9A: $3E $33
    jr   c, jr_018_4CA0                           ; $4C9C: $38 $02

    ld   a, $39                                   ; $4C9E: $3E $39

jr_018_4CA0:
    jp   OpenDialogInTable1                       ; $4CA0: $C3 $73 $23

func_018_4CA3::
    ld   a, [wDialogState]                        ; $4CA3: $FA $9F $C1
    and  a                                        ; $4CA6: $A7
    ret  nz                                       ; $4CA7: $C0

    jp   IncrementEntityState                     ; $4CA8: $C3 $12 $3B

func_018_4CAB::
    call IncrementEntityState                     ; $4CAB: $CD $12 $3B
    ld   a, $08                                   ; $4CAE: $3E $08

func_018_4CB0::
    ld   [wGameplayType], a                       ; $4CB0: $EA $95 $DB
    xor  a                                        ; $4CB3: $AF
    ld   [wTransitionSequenceCounter], a          ; $4CB4: $EA $6B $C1
    ld   [wC16C], a                               ; $4CB7: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $4CBA: $EA $96 $DB
    ret                                           ; $4CBD: $C9

func_018_4CBE::
    ld   a, [wTransitionSequenceCounter]          ; $4CBE: $FA $6B $C1
    cp   $04                                      ; $4CC1: $FE $04
    ret  nz                                       ; $4CC3: $C0

    ld   a, [wDialogState]                        ; $4CC4: $FA $9F $C1
    and  a                                        ; $4CC7: $A7
    ret  nz                                       ; $4CC8: $C0

    call IncrementEntityState                     ; $4CC9: $CD $12 $3B
    jp_open_dialog $135                           ; $4CCC

func_018_4CD1::
    ld   a, [wDialogState]                        ; $4CD1: $FA $9F $C1
    and  a                                        ; $4CD4: $A7
    ret  nz                                       ; $4CD5: $C0

    call IncrementEntityState                     ; $4CD6: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]                               ; $4CD9: $FA $77 $C1
    and  a                                        ; $4CDC: $A7
    jr   nz, jr_018_4CEC                          ; $4CDD: $20 $0D

    call CreateTradingItemEntity                  ; $4CDF: $CD $0C $0C
    ld   a, TRADING_ITEM_BROOM                    ; $4CE2: $3E $0A
    ld   [wTradeSequenceItem], a                  ; $4CE4: $EA $0E $DB
    ld   a, $0D                                   ; $4CE7: $3E $0D
    ldh  [hFFA5], a                               ; $4CE9: $E0 $A5
    ret                                           ; $4CEB: $C9

jr_018_4CEC:
    dec  [hl]                                     ; $4CEC: $35
    jp_open_dialog $137                           ; $4CED

func_018_4CF2::
    call func_018_7D89                            ; $4CF2: $CD $89 $7D
    ret  nc                                       ; $4CF5: $D0

    jp_open_dialog $138                           ; $4CF6

Data_018_4CFB::
    db   $62, $21, $60, $21, $66, $21, $64, $21, $6C, $01, $6E, $01

Data_018_4D07::
    db   $68, $01, $6A, $01, $6A, $21, $68, $21, $6C, $01, $6E, $01

Data_018_4D13::
    db   $9A, $14, $9C, $14

GrandmaUlriraEntityHandler::
    ld   hl, wEntitiesUnknowTableP                ; $4D17: $21 $40 $C4
    add  hl, bc                                   ; $4D1A: $09
    ld   a, [hl]                                  ; $4D1B: $7E
    and  a                                        ; $4D1C: $A7
    jr   nz, jr_018_4D36                          ; $4D1D: $20 $17

    inc  [hl]                                     ; $4D1F: $34
    ld   a, $18                                   ; $4D20: $3E $18
    call SpawnPhotographer_trampoline             ; $4D22: $CD $F6 $0A
    ld   a, [wHasInstrument5]                     ; $4D25: $FA $69 $DB
    ld   d, $B1                                   ; $4D28: $16 $B1
    and  $02                                      ; $4D2A: $E6 $02
    jr   z, jr_018_4D30                           ; $4D2C: $28 $02

    ld   d, $CD                                   ; $4D2E: $16 $CD

jr_018_4D30:
    ldh  a, [hMapRoom]                            ; $4D30: $F0 $F6
    cp   d                                        ; $4D32: $BA
    jp   nz, ClearEntityStatusBank18              ; $4D33: $C2 $08 $7F

jr_018_4D36:
    ld   de, Data_018_4CFB                        ; $4D36: $11 $FB $4C
    xor  a                                        ; $4D39: $AF
    ldh  [hMultiPurposeG], a                               ; $4D3A: $E0 $E8
    ld   a, [wTradeSequenceItem]                  ; $4D3C: $FA $0E $DB
    cp   TRADING_ITEM_FISHING_HOOK                ; $4D3F: $FE $0B
    jr   nc, jr_018_4D58                          ; $4D41: $30 $15

    ld   a, [wHasInstrument5]                     ; $4D43: $FA $69 $DB
    and  $02                                      ; $4D46: $E6 $02
    jr   nz, jr_018_4D51                          ; $4D48: $20 $07

    ld   a, [wTradeSequenceItem]                  ; $4D4A: $FA $0E $DB
    cp   TRADING_ITEM_BROOM                       ; $4D4D: $FE $0A
    jr   c, jr_018_4D58                           ; $4D4F: $38 $07

jr_018_4D51:
    ld   a, $01                                   ; $4D51: $3E $01
    ldh  [hMultiPurposeG], a                               ; $4D53: $E0 $E8
    ld   de, Data_018_4D07                        ; $4D55: $11 $07 $4D

jr_018_4D58:
    call RenderActiveEntitySpritesPair            ; $4D58: $CD $C0 $3B
    call func_018_7DE8                            ; $4D5B: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $4D5E: $F0 $E7
    rra                                           ; $4D60: $1F
    rra                                           ; $4D61: $1F
    rra                                           ; $4D62: $1F
    rra                                           ; $4D63: $1F
    and  $01                                      ; $4D64: $E6 $01
    call SetEntitySpriteVariant                   ; $4D66: $CD $0C $3B
    call func_018_7D36                            ; $4D69: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $4D6C: $F0 $F0
    JP_TABLE                                      ; $4D6E
._00 dw GrandmaUlriraState0Handler
._01 dw GrandmaUlriraState1Handler
._02 dw GrandmaUlriraState2Handler
._03 dw GrandmaUlriraState3Handler

GrandmaUlriraState0Handler::
    ld   a, [wGameplayType]                       ; $4D77: $FA $95 $DB
    cp   $0B                                      ; $4D7A: $FE $0B
    ret  nz                                       ; $4D7C: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4D7D: $FA $6B $C1
    cp   $04                                      ; $4D80: $FE $04
    ret  nz                                       ; $4D82: $C0

    call func_018_7D95                            ; $4D83: $CD $95 $7D
    ret  nc                                       ; $4D86: $D0

    ld   a, [wIsBowWowFollowingLink]              ; $4D87: $FA $56 $DB
    cp   $80                                      ; $4D8A: $FE $80
    ld   a, $78                                   ; $4D8C: $3E $78
    jr   z, jr_018_4DA0                           ; $4D8E: $28 $10

    ldh  a, [hMultiPurposeG]                               ; $4D90: $F0 $E8
    and  a                                        ; $4D92: $A7
    jr   nz, jr_018_4DA3                          ; $4D93: $20 $0E

    ld   a, [wTradeSequenceItem]                  ; $4D95: $FA $0E $DB
    cp   TRADING_ITEM_FISHING_HOOK                ; $4D98: $FE $0B
    ld   a, $5A                                   ; $4D9A: $3E $5A
    jr   c, jr_018_4DA0                           ; $4D9C: $38 $02

    ld   a, $5F                                   ; $4D9E: $3E $5F

jr_018_4DA0:
    jp   OpenDialogInTable1                       ; $4DA0: $C3 $73 $23

jr_018_4DA3:
    ld   a, [wTradeSequenceItem]                  ; $4DA3: $FA $0E $DB
    cp   TRADING_ITEM_BROOM                       ; $4DA6: $FE $0A
    jr   nz, jr_018_4DB5                          ; $4DA8: $20 $0B

    ld   [wC167], a                               ; $4DAA: $EA $67 $C1
    call_open_dialog $15C                         ; $4DAD
    jp   IncrementEntityState                     ; $4DB2: $C3 $12 $3B

jr_018_4DB5:
    jp_open_dialog $15B                           ; $4DB5

GrandmaUlriraState1Handler::
    ld   a, [wDialogAskSelectionIndex]                               ; $4DBA: $FA $77 $C1
    and  a                                        ; $4DBD: $A7
    jr   nz, jr_018_4DCF                          ; $4DBE: $20 $0F

    ld   a, JINGLE_TREASURE_FOUND                 ; $4DC0: $3E $01
    ldh  [hJingle], a                             ; $4DC2: $E0 $F2
    ld   [$DB7F], a                               ; $4DC4: $EA $7F $DB
    call GetEntityTransitionCountdown             ; $4DC7: $CD $05 $0C
    ld   [hl], $80                                ; $4DCA: $36 $80
    jp   IncrementEntityState                     ; $4DCC: $C3 $12 $3B

jr_018_4DCF:
    xor  a                                        ; $4DCF: $AF
    ld   [wC167], a                               ; $4DD0: $EA $67 $C1
    call_open_dialog $159                         ; $4DD3
    call IncrementEntityState                     ; $4DD8: $CD $12 $3B
    ld   [hl], b                                  ; $4DDB: $70
    ret                                           ; $4DDC: $C9

GrandmaUlriraState2Handler::
    call GetEntityTransitionCountdown             ; $4DDD: $CD $05 $0C
    jr   nz, jr_018_4DF3                          ; $4DE0: $20 $11

    ld   a, TRADING_ITEM_FISHING_HOOK             ; $4DE2: $3E $0B
    ld   [wTradeSequenceItem], a                  ; $4DE4: $EA $0E $DB
    ld   a, $0D                                   ; $4DE7: $3E $0D
    ldh  [hFFA5], a                               ; $4DE9: $E0 $A5
    call_open_dialog $15D                         ; $4DEB
    jp   IncrementEntityState                     ; $4DF0: $C3 $12 $3B

jr_018_4DF3:
    ld   a, $02                                   ; $4DF3: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4DF5: $E0 $A1
    ld   [wC167], a                               ; $4DF7: $EA $67 $C1
    xor  a                                        ; $4DFA: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4DFB: $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ; $4DFD: $F0 $EC
    sub  $0E                                      ; $4DFF: $D6 $0E
    ldh  [hActiveEntityVisualPosY], a             ; $4E01: $E0 $EC
    ldh  a, [hActiveEntityPosX]                   ; $4E03: $F0 $EE
    sub  $04                                      ; $4E05: $D6 $04
    ldh  [hActiveEntityPosX], a                   ; $4E07: $E0 $EE
    ld   de, Data_018_4D13                        ; $4E09: $11 $13 $4D
    call RenderActiveEntitySpritesPair            ; $4E0C: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4E0F: $CD $8A $3D
    ld   a, $02                                   ; $4E12: $3E $02
    jp   SetEntitySpriteVariant                   ; $4E14: $C3 $0C $3B

GrandmaUlriraState3Handler::
    ld   a, [wDialogState]                        ; $4E17: $FA $9F $C1
    and  a                                        ; $4E1A: $A7
    jr   nz, jr_018_4E2A                          ; $4E1B: $20 $0D

    ld   [$DB7F], a                               ; $4E1D: $EA $7F $DB
    ld   [wC167], a                               ; $4E20: $EA $67 $C1
    call CreateTradingItemEntity                  ; $4E23: $CD $0C $0C
    call IncrementEntityState                     ; $4E26: $CD $12 $3B
    ld   [hl], b                                  ; $4E29: $70

jr_018_4E2A:
    ret                                           ; $4E2A: $C9

Data_018_4E2B::
    db   $00, $F8, $60, $01, $00, $00, $62, $01, $00, $08, $64, $01, $00, $F8, $66, $01
    db   $00, $00, $68, $01, $00, $08, $6A, $01, $02, $00, $06, $04

PapahlsWifeEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $4E47: $F0 $F1
    sla  a                                        ; $4E49: $CB $27
    sla  a                                        ; $4E4B: $CB $27
    ld   e, a                                     ; $4E4D: $5F
    sla  a                                        ; $4E4E: $CB $27
    add  e                                        ; $4E50: $83
    ld   e, a                                     ; $4E51: $5F
    ld   d, b                                     ; $4E52: $50
    ld   hl, Data_018_4E2B                        ; $4E53: $21 $2B $4E
    add  hl, de                                   ; $4E56: $19
    ld   c, $03                                   ; $4E57: $0E $03
    call RenderActiveEntitySpritesRect            ; $4E59: $CD $E6 $3C
    ldh  a, [hFrameCounter]                       ; $4E5C: $F0 $E7
    rra                                           ; $4E5E: $1F
    rra                                           ; $4E5F: $1F
    rra                                           ; $4E60: $1F
    rra                                           ; $4E61: $1F
    and  $01                                      ; $4E62: $E6 $01
    call SetEntitySpriteVariant                   ; $4E64: $CD $0C $3B
    call func_018_7DE8                            ; $4E67: $CD $E8 $7D
    call func_018_7D36                            ; $4E6A: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $4E6D: $F0 $F0
    JP_TABLE                                      ; $4E6F
._00 dw PapahlsWifeState0Handler
._01 dw PapahlsWifeState1Handler
._02 dw PapahlsWifeState2Handler

PapahlsWifeState0Handler::
    call func_018_7D95                            ; $4E76: $CD $95 $7D
    ret  nc                                       ; $4E79: $D0

    ld   a, [wTradeSequenceItem]                  ; $4E7A: $FA $0E $DB
    cp   TRADING_ITEM_HIBISCUS                    ; $4E7D: $FE $08
    jr   nc, label_018_4E91                       ; $4E7F: $30 $10

    cp   TRADING_ITEM_YOSHI_DOLL                  ; $4E81: $FE $01
    jr   z, jr_018_4E9F                           ; $4E83: $28 $1A

    ld   a, [wHasInstrument3]                     ; $4E85: $FA $67 $DB
    and  $02                                      ; $4E88: $E6 $02
    jp   z, label_018_4E91                        ; $4E8A: $CA $91 $4E

    ld   e, $EE                                   ; $4E8D: $1E $EE
    jr   jr_018_4EA4                              ; $4E8F: $18 $13

label_018_4E91:
    ld   a, [wTradeSequenceItem]                  ; $4E91: $FA $0E $DB
    and  a                                        ; $4E94: $A7
    ld   e, $2A                                   ; $4E95: $1E $2A
    jr   z, jr_018_4EA4                           ; $4E97: $28 $0B

    ld   e, $2C                                   ; $4E99: $1E $2C
    cp   $01                                      ; $4E9B: $FE $01
    jr   nz, jr_018_4EA4                          ; $4E9D: $20 $05

jr_018_4E9F:
    call IncrementEntityState                     ; $4E9F: $CD $12 $3B
    ld   e, $2B                                   ; $4EA2: $1E $2B

jr_018_4EA4:
    ld   a, e                                     ; $4EA4: $7B
    jp   OpenDialogInTable1                       ; $4EA5: $C3 $73 $23

PapahlsWifeState1Handler::
    ld   a, [wDialogState]                        ; $4EA8: $FA $9F $C1
    and  a                                        ; $4EAB: $A7
    jr   nz, jr_018_4ECE                          ; $4EAC: $20 $20

    ld   a, [wDialogAskSelectionIndex]                               ; $4EAE: $FA $77 $C1
    and  a                                        ; $4EB1: $A7
    jr   nz, jr_018_4EC5                          ; $4EB2: $20 $11

    ld   a, TRADING_ITEM_RIBBON                   ; $4EB4: $3E $02
    ld   [wTradeSequenceItem], a                  ; $4EB6: $EA $0E $DB
    ld   a, $0D                                   ; $4EB9: $3E $0D
    ldh  [hFFA5], a                               ; $4EBB: $E0 $A5
    call_open_dialog $128                         ; $4EBD
    jp   IncrementEntityState                     ; $4EC2: $C3 $12 $3B

jr_018_4EC5:
    call_open_dialog $127                         ; $4EC5
    call IncrementEntityState                     ; $4ECA: $CD $12 $3B
    ld   [hl], b                                  ; $4ECD: $70

jr_018_4ECE:
    ret                                           ; $4ECE: $C9

PapahlsWifeState2Handler::
    ld   a, [wDialogState]                        ; $4ECF: $FA $9F $C1
    and  a                                        ; $4ED2: $A7
    jr   nz, jr_018_4EDC                          ; $4ED3: $20 $07

    call CreateTradingItemEntity                  ; $4ED5: $CD $0C $0C
    call IncrementEntityState                     ; $4ED8: $CD $12 $3B
    ld   [hl], b                                  ; $4EDB: $70

jr_018_4EDC:
    ret                                           ; $4EDC: $C9

MadBatterEntityHandler::
    ld   hl, wEntitiesUnknownTableD               ; $4EDD: $21 $D0 $C2
    add  hl, bc                                   ; $4EE0: $09
    ld   a, [hl]                                  ; $4EE1: $7E
    and  a                                        ; $4EE2: $A7
    jp   nz, label_018_50E2                       ; $4EE3: $C2 $E2 $50

    ldh  a, [hRoomStatus]                         ; $4EE6: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $4EE8: $E6 $20
    jp   nz, ClearEntityStatusBank18              ; $4EEA: $C2 $08 $7F

    call DecrementEntityIgnoreHitsCountdown       ; $4EED: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $4EF0: $F0 $F0
    JP_TABLE                                      ; $4EF2
._00 dw MadBatterState0Handler                    ; $4EF3
._01 dw MadBatterState1Handler                    ; $4EF5
._02 dw MadBatterState2Handler                    ; $4EF7
._03 dw MadBatterState3Handler                    ; $4EF9
._04 dw MadBatterState4Handler                    ; $4EFB
._05 dw MadBatterState5Handler                    ; $4EFD
._06 dw MadBatterState6Handler                    ; $4EFF
._07 dw MadBatterState7Handler                    ; $4F01
._08 dw MadBatterState8Handler                    ; $4F03

MadBatterState0Handler::
    ld   a, [wMaxMagicPowder]                     ; $4F05: $FA $76 $DB
    ld   hl, MadBatterUpgradedMaximumTable        ; $4F08: $21 $90 $4F
    cp   [hl]                                     ; $4F0B: $BE
    jr   nz, jr_018_4F1D                          ; $4F0C: $20 $0F

    inc  hl                                       ; $4F0E: $23
    ld   a, [wMaxBombs]                           ; $4F0F: $FA $77 $DB
    cp   [hl]                                     ; $4F12: $BE
    jr   nz, jr_018_4F1D                          ; $4F13: $20 $08

    inc  hl                                       ; $4F15: $23
    ld   a, [wMaxArrows]                          ; $4F16: $FA $78 $DB
    cp   [hl]                                     ; $4F19: $BE
    jp   z, ClearEntityStatusBank18               ; $4F1A: $CA $08 $7F

jr_018_4F1D:
    ret                                           ; $4F1D: $C9

MadBatterState1Handler::
    call GetEntityTransitionCountdown             ; $4F1E: $CD $05 $0C
    ld   [hl], $90                                ; $4F21: $36 $90
    ldh  a, [hActiveEntityPosX]                   ; $4F23: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4F25: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4F27: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $4F29: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $4F2B: $3E $02
    call AddTranscientVfx                         ; $4F2D: $CD $C7 $0C
    ld   a, JINGLE_ENEMY_MORPH_IN                 ; $4F30: $3E $06
    ldh  [hJingle], a                             ; $4F32: $E0 $F2
    jp   IncrementEntityState                     ; $4F34: $C3 $12 $3B

MadBatterState2Handler::
    call MadBatterRenderSmallSprite                            ; $4F37: $CD $C3 $50
    call GetEntityTransitionCountdown             ; $4F3A: $CD $05 $0C
    jr   nz, .jr_018_4F44                         ; $4F3D: $20 $05

    ld   [hl], $60                                ; $4F3F: $36 $60
    jp   IncrementEntityState                     ; $4F41: $C3 $12 $3B

.jr_018_4F44:
    ld   e, $FC                                   ; $4F44: $1E $FC
    sub  $08                                      ; $4F46: $D6 $08
    and  $10                                      ; $4F48: $E6 $10
    jr   z, .jr_018_4F4E                          ; $4F4A: $28 $02

    ld   e, $04                                   ; $4F4C: $1E $04

.jr_018_4F4E:
    ld   hl, wEntitiesSpeedXTable                 ; $4F4E: $21 $40 $C2
    add  hl, bc                                   ; $4F51: $09
    ld   [hl], e                                  ; $4F52: $73
    ld   hl, wEntitiesSpeedYTable                 ; $4F53: $21 $50 $C2
    add  hl, bc                                   ; $4F56: $09
    ld   [hl], $FC                                ; $4F57: $36 $FC
    jp   UpdateEntityPosWithSpeed_18              ; $4F59: $C3 $5F $7E

MadBatterState3Handler::
    call MadBatterRenderSmallSprite                            ; $4F5C: $CD $C3 $50
    call GetEntityTransitionCountdown             ; $4F5F: $CD $05 $0C
    ret  nz                                       ; $4F62: $C0

    ld   [hl], $48                                ; $4F63: $36 $48
    ld   a, ENTITY_BOMB                           ; $4F65: $3E $02
    call SpawnNewEntity_trampoline                ; $4F67: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $4F6A: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4F6C: $21 $00 $C2
    add  hl, de                                   ; $4F6F: $19
    ld   [hl], a                                  ; $4F70: $77
    ldh  a, [hMultiPurpose1]                      ; $4F71: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4F73: $21 $10 $C2
    add  hl, de                                   ; $4F76: $19
    ld   [hl], a                                  ; $4F77: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4F78: $21 $E0 $C2
    add  hl, de                                   ; $4F7B: $19
    ld   [hl], $20                                ; $4F7C: $36 $20
    jp   IncrementEntityState                     ; $4F7E: $C3 $12 $3B

MadBatterState4Handler::
    call RenderMadBatterSprite                    ; $4F81: $CD $A8 $50
    call GetEntityTransitionCountdown             ; $4F84: $CD $05 $0C
    ret  nz                                       ; $4F87: $C0

    ld   a, $E1                                   ; $4F88: $3E $E1
    call OpenDialogAtBottom                            ; $4F8A: $CD $80 $50
    jp   IncrementEntityState                     ; $4F8D: $C3 $12 $3B

MadBatterUpgradedMaximumTable::
    db   $40, $60, $60

Data_018_4F93::
    db   $E2, $E3, $E4

MadBatterState5Handler::
    call RenderMadBatterSprite                    ; $4F96: $CD $A8 $50
    ld   a, [wDialogState]                        ; $4F99: $FA $9F $C1
    and  a                                        ; $4F9C: $A7
    ret  nz                                       ; $4F9D: $C0

jr_018_4F9E:
    ld   hl, wEntitiesPrivateState1Table          ; $4F9E: $21 $B0 $C2
    add  hl, bc                                   ; $4FA1: $09
    ld   e, [hl]                                  ; $4FA2: $5E
    ld   d, $00                                   ; $4FA3: $16 $00
    ld   a, e                                     ; $4FA5: $7B
    ld   [$D201], a                               ; $4FA6: $EA $01 $D2
    inc  a                                        ; $4FA9: $3C
    cp   $03                                      ; $4FAA: $FE $03
    jr   nz, jr_018_4FAF                          ; $4FAC: $20 $01

    xor  a                                        ; $4FAE: $AF

jr_018_4FAF:
    ld   [hl], a                                  ; $4FAF: $77
    ld   hl, MadBatterUpgradedMaximumTable        ; $4FB0: $21 $90 $4F
    add  hl, de                                   ; $4FB3: $19
    ld   a, [hl]                                  ; $4FB4: $7E
    ld   hl, wMaxMagicPowder                      ; $4FB5: $21 $76 $DB
    add  hl, de                                   ; $4FB8: $19
    cp   [hl]                                     ; $4FB9: $BE
    jr   z, jr_018_4F9E                           ; $4FBA: $28 $E2

    ld   hl, Data_018_4F93                        ; $4FBC: $21 $93 $4F
    add  hl, de                                   ; $4FBF: $19
    ld   a, [hl]                                  ; $4FC0: $7E
    call OpenDialogAtBottom                            ; $4FC1: $CD $80 $50
    jp   IncrementEntityState                     ; $4FC4: $C3 $12 $3B

MadBatterState6Handler::
    call RenderMadBatterSprite                    ; $4FC7: $CD $A8 $50
    ld   a, [wDialogState]                        ; $4FCA: $FA $9F $C1
    and  a                                        ; $4FCD: $A7
    ret  nz                                       ; $4FCE: $C0

    call IncrementEntityState                     ; $4FCF: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]                               ; $4FD2: $FA $77 $C1
    and  a                                        ; $4FD5: $A7
    jr   nz, jr_018_5001                          ; $4FD6: $20 $29

    ld   a, ENTITY_MAD_BATTER                     ; $4FD8: $3E $CA
    call SpawnNewEntity_trampoline                ; $4FDA: $CD $86 $3B
    ld   a, $26                                   ; $4FDD: $3E $26
    ldh  [hNoiseSfx], a                           ; $4FDF: $E0 $F4
    ldh  a, [hMultiPurpose0]                      ; $4FE1: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4FE3: $21 $00 $C2
    add  hl, de                                   ; $4FE6: $19
    ld   [hl], a                                  ; $4FE7: $77
    ldh  a, [hMultiPurpose1]                      ; $4FE8: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4FEA: $21 $10 $C2
    add  hl, de                                   ; $4FED: $19
    ld   [hl], a                                  ; $4FEE: $77
    ld   hl, wEntitiesUnknownTableD               ; $4FEF: $21 $D0 $C2
    add  hl, de                                   ; $4FF2: $19
    ld   [hl], $01                                ; $4FF3: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $4FF5: $21 $E0 $C2
    add  hl, de                                   ; $4FF8: $19
    ld   [hl], $C0                                ; $4FF9: $36 $C0
    call GetEntityTransitionCountdown             ; $4FFB: $CD $05 $0C
    ld   [hl], $C0                                ; $4FFE: $36 $C0
    ret                                           ; $5000: $C9

jr_018_5001:
    dec  [hl]                                     ; $5001: $35
    dec  [hl]                                     ; $5002: $35
    ret                                           ; $5003: $C9

MadBatterState7Handler::
    ld   hl, Data_018_5090                        ; $5004: $21 $90 $50
    ld   c, $03                                   ; $5007: $0E $03
    call RenderActiveEntitySpritesRect            ; $5009: $CD $E6 $3C
    call func_018_50D2                            ; $500C: $CD $D2 $50
    call GetEntityTransitionCountdown             ; $500F: $CD $05 $0C
    ret  nz                                       ; $5012: $C0

    call ClearEntitySpeed                         ; $5013: $CD $7F $3D
    ld   a, $E5                                   ; $5016: $3E $E5
    call OpenDialogAtBottom                            ; $5018: $CD $80 $50
    call IncrementEntityState                     ; $501B: $CD $12 $3B
    ld   a, [$D201]                               ; $501E: $FA $01 $D2
    ld   e, a                                     ; $5021: $5F
    ld   d, b                                     ; $5022: $50
    ld   hl, MadBatterUpgradedMaximumTable        ; $5023: $21 $90 $4F
    add  hl, de                                   ; $5026: $19
    ld   a, [hl]                                  ; $5027: $7E
    ld   hl, wMaxMagicPowder                      ; $5028: $21 $76 $DB
    add  hl, de                                   ; $502B: $19
    ld   [hl], a                                  ; $502C: $77
    ld   d, a                                     ; $502D: $57
    ld   a, e                                     ; $502E: $7B
    and  a                                        ; $502F: $A7
    jr   nz, jr_018_5044                          ; $5030: $20 $12

    ld   hl, wMagicPowderCount                    ; $5032: $21 $4C $DB
    ld   [hl], d                                  ; $5035: $72
    ld   d, $0C                                   ; $5036: $16 $0C
    call GiveInventoryItem_trampoline                               ; $5038: $CD $6B $3E
    xor  a                                        ; $503B: $AF
    ld   [wHasToadstool], a                       ; $503C: $EA $4B $DB
    ld   a, $0B                                   ; $503F: $3E $0B
    ldh  [hFFA5], a                               ; $5041: $E0 $A5
    ret                                           ; $5043: $C9

jr_018_5044:
    cp   $01                                      ; $5044: $FE $01
    jr   nz, jr_018_504D                          ; $5046: $20 $05

    ld   hl, wBombCount                           ; $5048: $21 $4D $DB
    ld   [hl], d                                  ; $504B: $72
    ret                                           ; $504C: $C9

jr_018_504D:
    ld   hl, wArrowCount                          ; $504D: $21 $45 $DB
    ld   [hl], d                                  ; $5050: $72
    ret                                           ; $5051: $C9

MadBatterState8Handler::
    call RenderMadBatterSprite                    ; $5052: $CD $A8 $50
    ld   a, [wDialogState]                        ; $5055: $FA $9F $C1
    and  a                                        ; $5058: $A7
    ret  nz                                       ; $5059: $C0

    ld   hl, wEntitiesUnknowTableP                ; $505A: $21 $40 $C4
    add  hl, bc                                   ; $505D: $09
    ld   a, [hl]                                  ; $505E: $7E
    and  a                                        ; $505F: $A7
    jr   nz, jr_018_5067                          ; $5060: $20 $05

    inc  [hl]                                     ; $5062: $34
    ld   a, JINGLE_SWORD_BEAM                     ; $5063: $3E $3B
    ldh  [hJingle], a                             ; $5065: $E0 $F2

jr_018_5067:
    call UpdateEntityYPosWithSpeed_18             ; $5067: $CD $62 $7E
    ld   hl, wEntitiesSpeedYTable                 ; $506A: $21 $50 $C2
    add  hl, bc                                   ; $506D: $09
    dec  [hl]                                     ; $506E: $35
    dec  [hl]                                     ; $506F: $35
    dec  [hl]                                     ; $5070: $35
    ldh  a, [hActiveEntityVisualPosY]             ; $5071: $F0 $EC
    cp   $F0                                      ; $5073: $FE $F0
    ret  c                                        ; $5075: $D8

    call SetRoomStatus20                            ; $5076: $CD $B9 $7F
    xor  a                                        ; $5079: $AF
    ld   [wC167], a                               ; $507A: $EA $67 $C1
    jp   ClearEntityStatusBank18                  ; $507D: $C3 $08 $7F

OpenDialogAtBottom::
    ld   e, a                                     ; $5080: $5F
    ldh  a, [hLinkPositionY]                      ; $5081: $F0 $99
    push af                                       ; $5083: $F5
    ld   a, $20                                   ; $5084: $3E $20
    ldh  [hLinkPositionY], a                      ; $5086: $E0 $99
    ld   a, e                                     ; $5088: $7B
    call OpenDialog                               ; $5089: $CD $85 $23
    pop  af                                       ; $508C: $F1
    ldh  [hLinkPositionY], a                      ; $508D: $E0 $99
    ret                                           ; $508F: $C9

Data_018_5090::
    db   $00, $FC, $70, $03, $00, $04, $72, $03, $00, $0C, $70, $23

Data_018_509C::
    db   $00, $FC, $74, $03, $00, $04, $76, $03, $00, $0C, $74, $23

RenderMadBatterSprite::
    ld   hl, Data_018_5090                        ; $50A8: $21 $90 $50
    ldh  a, [hFrameCounter]                       ; $50AB: $F0 $E7
    and  $08                                      ; $50AD: $E6 $08
    jr   z, jr_018_50B4                           ; $50AF: $28 $03

    ld   hl, Data_018_509C                        ; $50B1: $21 $9C $50

jr_018_50B4:
    ld   c, $03                                   ; $50B4: $0E $03
    call RenderActiveEntitySpritesRect            ; $50B6: $CD $E6 $3C
    jr   func_018_50D2                            ; $50B9: $18 $17

Data_018_50BB::
    db   $7E, $03, $7E, $23, $7E, $43, $7E, $63

MadBatterRenderSmallSprite::
    ldh  a, [hFrameCounter]                       ; $50C3: $F0 $E7
    rra                                           ; $50C5: $1F
    rra                                           ; $50C6: $1F
    rra                                           ; $50C7: $1F
    and  $01                                      ; $50C8: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ; $50CA: $E0 $F1
    ld   de, Data_018_50BB                        ; $50CC: $11 $BB $50
    call RenderActiveEntitySpritesPair            ; $50CF: $CD $C0 $3B

func_018_50D2::
    ld   a, $02                                   ; $50D2: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $50D4: $E0 $A1
    ld   [wC167], a                               ; $50D6: $EA $67 $C1
    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ; $50D9: $3E $04
    ldh  [hLinkAnimationState], a                 ; $50DB: $E0 $9D
    xor  a                                        ; $50DD: $AF
    ld   [wC19B], a                               ; $50DE: $EA $9B $C1
    ret                                           ; $50E1: $C9

label_018_50E2:
    call func_018_5174                            ; $50E2: $CD $74 $51
    call GetEntityTransitionCountdown             ; $50E5: $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ; $50E8: $CA $08 $7F

    ld   d, a                                     ; $50EB: $57
    ldh  a, [hIsGBC]                              ; $50EC: $F0 $FE
    and  a                                        ; $50EE: $A7
    jr   nz, jr_018_50FE                          ; $50EF: $20 $0D

    ld   a, d                                     ; $50F1: $7A
    bit  1, a                                     ; $50F2: $CB $4F
    ld   a, $E4                                   ; $50F4: $3E $E4
    jr   z, jr_018_50FA                           ; $50F6: $28 $02

    ld   a, $44                                   ; $50F8: $3E $44

jr_018_50FA:
    ld   [wBGPalette], a                          ; $50FA: $EA $97 $DB
    ret                                           ; $50FD: $C9

jr_018_50FE:
    ld   hl, wFarcallParams                       ; $50FE: $21 $01 $DE
    ld   a, BANK(func_024_7B77)                   ; $5101: $3E $24
    ld   [hl+], a                                 ; $5103: $22
    ld   a, HIGH(func_024_7B77)                   ; $5104: $3E $7B
    ld   [hl+], a                                 ; $5106: $22
    ld   a, LOW(func_024_7B77)                    ; $5107: $3E $77
    ld   [hl+], a                                 ; $5109: $22
    ld   a, BANK(@)                               ; $510A: $3E $18
    ld   [hl], a                                  ; $510C: $77
    jp   Farcall                                  ; $510D: $C3 $D7 $0B

Data_018_5110::
    db   $10, $00, $7C, $07, $10, $08, $7C, $67, $20, $00, $7C, $07, $20, $08, $7C, $67
    db   $30, $F8, $78, $07, $30, $00, $7A, $07, $30, $08, $7A, $27, $30, $10, $78, $27
    db   $40, $F8, $78, $47, $40, $00, $7A, $47, $40, $08, $7A, $67, $40, $10, $78, $67

Data_018_5140::
    db   $10, $00, $7C, $54, $10, $08, $7C, $34, $20, $00, $7C, $54, $20, $08, $7C, $34
    db   $30, $F8, $78, $14, $30, $00, $7A, $14, $30, $08, $7A, $34, $30, $10, $78, $34
    db   $40, $F8, $78, $54, $40, $00, $7A, $54, $40, $08, $7A, $74, $40, $10, $78, $74

Data_018_5170::
    db   $0C, $0C, $04, $02

func_018_5174::
    ldh  a, [hActiveEntityVisualPosY]             ; $5174: $F0 $EC
    sub  $05                                      ; $5176: $D6 $05
    ldh  [hActiveEntityVisualPosY], a             ; $5178: $E0 $EC
    call GetEntityTransitionCountdown             ; $517A: $CD $05 $0C
    ld   c, $0C                                   ; $517D: $0E $0C
    cp   $B0                                      ; $517F: $FE $B0
    jr   c, jr_018_5190                           ; $5181: $38 $0D

    sub  $B0                                      ; $5183: $D6 $B0
    rra                                           ; $5185: $1F
    rra                                           ; $5186: $1F
    and  $03                                      ; $5187: $E6 $03
    ld   e, a                                     ; $5189: $5F
    ld   d, b                                     ; $518A: $50
    ld   hl, Data_018_5170                        ; $518B: $21 $70 $51
    add  hl, de                                   ; $518E: $19
    ld   c, [hl]                                  ; $518F: $4E

jr_018_5190:
    ld   hl, Data_018_5110                        ; $5190: $21 $10 $51
    ldh  a, [hFrameCounter]                       ; $5193: $F0 $E7
    and  $04                                      ; $5195: $E6 $04
    jr   z, jr_018_519C                           ; $5197: $28 $03

    ld   hl, Data_018_5140                        ; $5199: $21 $40 $51

jr_018_519C:
    call RenderActiveEntitySpritesRect            ; $519C: $CD $E6 $3C
    ld   a, $04                                   ; $519F: $3E $04
    jp   label_3DA0                               ; $51A1: $C3 $A0 $3D

label_018_51A4:
    call func_018_7D36                            ; $51A4: $CD $36 $7D
    call func_018_7D95                            ; $51A7: $CD $95 $7D
    ret  nc                                       ; $51AA: $D0

    jp_open_dialog $196                           ; $51AB

func_018_51B0::
    ld   a, [$DB74]                               ; $51B0: $FA $74 $DB
    and  a                                        ; $51B3: $A7
    jp   z, ClearEntityStatusBank18               ; $51B4: $CA $08 $7F

    ret                                           ; $51B7: $C9

Data_018_51B8::
    db   $50, $01, $52, $01, $52, $21, $50, $21, $54, $01, $56, $01, $56, $21, $54, $21
    db   $58, $01, $5A, $01, $58, $01, $5A, $01, $5A, $21, $58, $21, $5A, $21, $58, $21

BunnyD3EntityHandler::
    ld   a, [$DB74]                               ; $51D8: $FA $74 $DB
    and  a                                        ; $51DB: $A7
    jp   nz, ClearEntityStatusBank18              ; $51DC: $C2 $08 $7F

    ld   de, Data_018_51B8                        ; $51DF: $11 $B8 $51
    call RenderActiveEntitySpritesPair            ; $51E2: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $51E5: $F0 $E7
    and  $3F                                      ; $51E7: $E6 $3F
    jr   nz, jr_018_51F3                          ; $51E9: $20 $08

    call func_018_7EE1                            ; $51EB: $CD $E1 $7E
    ld   hl, wEntitiesDirectionTable              ; $51EE: $21 $80 $C3
    add  hl, bc                                   ; $51F1: $09
    ld   [hl], e                                  ; $51F2: $73

jr_018_51F3:
    call func_018_7D60                            ; $51F3: $CD $60 $7D
    call func_018_7DE8                            ; $51F6: $CD $E8 $7D
    call AddEntityZSpeedToPos_18                  ; $51F9: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $51FC: $21 $20 $C3
    add  hl, bc                                   ; $51FF: $09
    dec  [hl]                                     ; $5200: $35
    dec  [hl]                                     ; $5201: $35
    ld   hl, wEntitiesPosZTable                   ; $5202: $21 $10 $C3
    add  hl, bc                                   ; $5205: $09
    ld   a, [hl]                                  ; $5206: $7E
    and  a                                        ; $5207: $A7
    jr   z, jr_018_520E                           ; $5208: $28 $04

    and  $80                                      ; $520A: $E6 $80
    jr   z, jr_018_521C                           ; $520C: $28 $0E

jr_018_520E:
    ld   [hl], b                                  ; $520E: $70
    ld   hl, wEntitiesSpeedZTable                 ; $520F: $21 $20 $C3
    add  hl, bc                                   ; $5212: $09
    ld   [hl], b                                  ; $5213: $70
    ldh  a, [hFrameCounter]                       ; $5214: $F0 $E7
    and  $1F                                      ; $5216: $E6 $1F
    jr   nz, jr_018_521C                          ; $5218: $20 $02

    ld   [hl], $0C                                ; $521A: $36 $0C

jr_018_521C:
    ldh  a, [hActiveEntityPosY]                   ; $521C: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $521E: $E0 $EC
    call func_018_7D36                            ; $5220: $CD $36 $7D
    call CopyEntityPositionToActivePosition       ; $5223: $CD $8A $3D
    call func_018_7D95                            ; $5226: $CD $95 $7D
    ret  nc                                       ; $5229: $D0

    ld   e, $00                                   ; $522A: $1E $00
    ld   a, [wIsIndoor]                           ; $522C: $FA $A5 $DB
    and  a                                        ; $522F: $A7
    jr   nz, jr_018_523F                          ; $5230: $20 $0D

    inc  e                                        ; $5232: $1C
    ldh  a, [hMapRoom]                            ; $5233: $F0 $F6
    cp   UNKNOWN_ROOM_CC                          ; $5235: $FE $CC
    jr   z, jr_018_523F                           ; $5237: $28 $06
    inc  e                                        ; $5239: $1C
    cp   UNKNOWN_ROOM_CD                          ; $523A: $FE $CD
    jr   z, jr_018_523F                           ; $523C: $28 $01
    inc  e                                        ; $523E: $1C

jr_018_523F:
    ld   a, [wHasInstrument6]                     ; $523F: $FA $6A $DB
    and  $02                                      ; $5242: $E6 $02
    jr   z, jr_018_524A                           ; $5244: $28 $04

    ld   a, e                                     ; $5246: $7B
    add  $04                                      ; $5247: $C6 $04
    ld   e, a                                     ; $5249: $5F

jr_018_524A:
    ld   a, [wIsMarinFollowingLink]               ; $524A: $FA $73 $DB
    and  a                                        ; $524D: $A7
    jr   z, jr_018_5255                           ; $524E: $28 $05

    jp_open_dialog $252                           ; $5250

jr_018_5255:
    ld   a, e                                     ; $5255: $7B
    add  $4A                                      ; $5256: $C6 $4A
    jp   OpenDialogInTable2                       ; $5258: $C3 $7C $23

Data_018_525B::
    db   $78, $01, $7A, $01, $7C, $01, $7E, $01, $7A, $21, $78, $21, $7E, $21, $7C, $21

AnimalD2EntityHandler::
    call func_018_51B0                            ; $526B: $CD $B0 $51
    ld   de, Data_018_525B                        ; $526E: $11 $5B $52
    call RenderActiveEntitySpritesPair            ; $5271: $CD $C0 $3B
    ld   a, [wC50F]                               ; $5274: $FA $0F $C5
    ld   e, a                                     ; $5277: $5F
    ld   d, b                                     ; $5278: $50
    ld   hl, wEntitiesPosXTable                   ; $5279: $21 $00 $C2
    add  hl, de                                   ; $527C: $19
    ldh  a, [hActiveEntityPosX]                   ; $527D: $F0 $EE
    ld   e, $00                                   ; $527F: $1E $00
    cp   [hl]                                     ; $5281: $BE
    jr   nc, jr_018_5286                          ; $5282: $30 $02

    ld   e, $02                                   ; $5284: $1E $02

jr_018_5286:
    ldh  a, [hFrameCounter]                       ; $5286: $F0 $E7
    rra                                           ; $5288: $1F
    rra                                           ; $5289: $1F
    rra                                           ; $528A: $1F
    rra                                           ; $528B: $1F
    rra                                           ; $528C: $1F
    and  $01                                      ; $528D: $E6 $01
    add  e                                        ; $528F: $83
    call SetEntitySpriteVariant                   ; $5290: $CD $0C $3B
    jp   label_018_51A4                           ; $5293: $C3 $A4 $51

Data_018_5296::
    db   $5A, $21, $58, $21, $5E, $21, $5C, $21, $58, $01, $5A, $01, $5C, $01, $5E, $01

BunnyCallingMarinEntityHandler::
    ld   de, Data_018_5296                        ; $52A6: $11 $96 $52
    call RenderActiveEntitySpritesPair            ; $52A9: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $52AC: $F0 $E7
    rra                                           ; $52AE: $1F
    rra                                           ; $52AF: $1F
    rra                                           ; $52B0: $1F
    and  $01                                      ; $52B1: $E6 $01
    call SetEntitySpriteVariant                   ; $52B3: $CD $0C $3B
    ld   a, $02                                   ; $52B6: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $52B8: $E0 $A1
    ld   [wC167], a                               ; $52BA: $EA $67 $C1
    call AddEntityZSpeedToPos_18                  ; $52BD: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $52C0: $21 $20 $C3
    add  hl, bc                                   ; $52C3: $09
    dec  [hl]                                     ; $52C4: $35
    dec  [hl]                                     ; $52C5: $35
    ld   hl, wEntitiesPosZTable                   ; $52C6: $21 $10 $C3
    add  hl, bc                                   ; $52C9: $09
    ld   a, [hl]                                  ; $52CA: $7E
    and  $80                                      ; $52CB: $E6 $80
    ldh  [hMultiPurposeG], a                               ; $52CD: $E0 $E8
    jr   z, jr_018_52D7                           ; $52CF: $28 $06

    ld   [hl], b                                  ; $52D1: $70
    ld   hl, wEntitiesSpeedZTable                 ; $52D2: $21 $20 $C3
    add  hl, bc                                   ; $52D5: $09
    ld   [hl], b                                  ; $52D6: $70

jr_018_52D7:
    ldh  a, [hActiveEntityState]                  ; $52D7: $F0 $F0
    JP_TABLE                                      ; $52D9
._00 dw BunnyCallingMarinState0Handler
._01 dw BunnyCallingMarinState1Handler
._02 dw BunnyCallingMarinState2Handler
._03 dw BunnyCallingMarinState3Handler

BunnyCallingMarinState0Handler::
    call GetEntityTransitionCountdown             ; $52E2: $CD $05 $0C
    ret  nz                                       ; $52E5: $C0

    ld   hl, wEntitiesSpeedXTable                 ; $52E6: $21 $40 $C2
    add  hl, bc                                   ; $52E9: $09
    ld   [hl], $0C                                ; $52EA: $36 $0C
    call AddEntitySpeedToPos_18                   ; $52EC: $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ; $52EF: $F0 $EE
    cp   $20                                      ; $52F1: $FE $20
    jr   nz, jr_018_5304                          ; $52F3: $20 $0F

    ld   a, $01                                   ; $52F5: $3E $01
    call func_018_59AE                            ; $52F7: $CD $AE $59
    ld   a, $01                                   ; $52FA: $3E $01
    ldh  [hLinkDirection], a                      ; $52FC: $E0 $9E
    push bc                                       ; $52FE: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $52FF: $CD $F0 $0B
    pop  bc                                       ; $5302: $C1
    ret                                           ; $5303: $C9

jr_018_5304:
    cp   $48                                      ; $5304: $FE $48
    ret  nz                                       ; $5306: $C0

    call GetEntityTransitionCountdown             ; $5307: $CD $05 $0C
    ld   [hl], $40                                ; $530A: $36 $40
    jp   IncrementEntityState                     ; $530C: $C3 $12 $3B

BunnyCallingMarinState1Handler::
    call GetEntityTransitionCountdown             ; $530F: $CD $05 $0C
    jr   nz, func_018_5321                        ; $5312: $20 $0D

    call_open_dialog $1E3                         ; $5314
    call GetEntityTransitionCountdown             ; $5319: $CD $05 $0C
    ld   [hl], $10                                ; $531C: $36 $10
    call IncrementEntityState                     ; $531E: $CD $12 $3B

func_018_5321::
    ldh  a, [hMultiPurposeG]                               ; $5321: $F0 $E8
    and  a                                        ; $5323: $A7
    jr   z, jr_018_5337                           ; $5324: $28 $11

    ld   hl, wEntitiesUnknowTableP                ; $5326: $21 $40 $C4
    add  hl, bc                                   ; $5329: $09
    ld   a, [hl]                                  ; $532A: $7E
    dec  [hl]                                     ; $532B: $35
    and  a                                        ; $532C: $A7
    jr   nz, jr_018_5337                          ; $532D: $20 $08

    ld   [hl], $08                                ; $532F: $36 $08
    ld   hl, wEntitiesSpeedZTable                 ; $5331: $21 $20 $C3
    add  hl, bc                                   ; $5334: $09
    ld   [hl], $12                                ; $5335: $36 $12

jr_018_5337:
    ret                                           ; $5337: $C9

BunnyCallingMarinState2Handler::
    call func_018_5321                            ; $5338: $CD $21 $53
    ld   a, [wDialogState]                        ; $533B: $FA $9F $C1
    and  a                                        ; $533E: $A7
    ret  nz                                       ; $533F: $C0

    call GetEntityTransitionCountdown             ; $5340: $CD $05 $0C
    jr   nz, jr_018_534F                          ; $5343: $20 $0A

    ld   [hl], $10                                ; $5345: $36 $10
    call_open_dialog $1E5                         ; $5347
    jp   IncrementEntityState                     ; $534C: $C3 $12 $3B

jr_018_534F:
    ld   e, $02                                   ; $534F: $1E $02
    cp   $08                                      ; $5351: $FE $08
    jr   nc, jr_018_5357                          ; $5353: $30 $02

    ld   e, $00                                   ; $5355: $1E $00

jr_018_5357:
    ld   a, e                                     ; $5357: $7B
    jp   func_018_59AE                            ; $5358: $C3 $AE $59

BunnyCallingMarinState3Handler::
    call func_018_5321                            ; $535B: $CD $21 $53
    ld   a, [wDialogState]                        ; $535E: $FA $9F $C1
    and  a                                        ; $5361: $A7
    jr   nz, jr_018_53CD                          ; $5362: $20 $69

    call GetEntityTransitionCountdown             ; $5364: $CD $05 $0C
    jr   z, jr_018_5375                           ; $5367: $28 $0C

    ld   e, $01                                   ; $5369: $1E $01
    cp   $08                                      ; $536B: $FE $08
    jr   c, jr_018_5371                           ; $536D: $38 $02

    ld   e, $02                                   ; $536F: $1E $02

jr_018_5371:
    ld   a, e                                     ; $5371: $7B
    jp   func_018_59AE                            ; $5372: $C3 $AE $59

jr_018_5375:
    ldh  a, [hFrameCounter]                       ; $5375: $F0 $E7
    rra                                           ; $5377: $1F
    rra                                           ; $5378: $1F
    rra                                           ; $5379: $1F
    and  $01                                      ; $537A: $E6 $01
    add  $02                                      ; $537C: $C6 $02
    call SetEntitySpriteVariant                   ; $537E: $CD $0C $3B
    ld   hl, $DB74                                ; $5381: $21 $74 $DB
    ld   [hl], $01                                ; $5384: $36 $01
    ldh  a, [hActiveEntityPosX]                   ; $5386: $F0 $EE
    and  $FC                                      ; $5388: $E6 $FC
    cp   $E0                                      ; $538A: $FE $E0
    jr   z, jr_018_5397                           ; $538C: $28 $09

    ld   hl, wEntitiesSpeedXTable                 ; $538E: $21 $40 $C2
    add  hl, bc                                   ; $5391: $09
    ld   [hl], $EC                                ; $5392: $36 $EC
    call AddEntitySpeedToPos_18                   ; $5394: $CD $6C $7E

jr_018_5397:
    ld   a, [wC50F]                               ; $5397: $FA $0F $C5
    ld   e, a                                     ; $539A: $5F
    ld   d, b                                     ; $539B: $50
    ld   hl, wEntitiesSpeedXTable                 ; $539C: $21 $40 $C2
    add  hl, de                                   ; $539F: $19
    ld   [hl], $F4                                ; $53A0: $36 $F4
    ldh  a, [hFrameCounter]                       ; $53A2: $F0 $E7
    rra                                           ; $53A4: $1F
    rra                                           ; $53A5: $1F
    rra                                           ; $53A6: $1F
    and  $01                                      ; $53A7: $E6 $01
    add  $04                                      ; $53A9: $C6 $04
    ld   hl, wEntitiesSpriteVariantTable          ; $53AB: $21 $B0 $C3
    add  hl, de                                   ; $53AE: $19
    ld   [hl], a                                  ; $53AF: $77
    push de                                       ; $53B0: $D5
    push bc                                       ; $53B1: $C5
    ld   c, e                                     ; $53B2: $4B
    ld   b, d                                     ; $53B3: $42
    call AddEntitySpeedToPos_18                   ; $53B4: $CD $6C $7E
    pop  bc                                       ; $53B7: $C1
    pop  de                                       ; $53B8: $D1
    ld   hl, wEntitiesPosXTable                   ; $53B9: $21 $00 $C2
    add  hl, de                                   ; $53BC: $19
    ld   a, [hl]                                  ; $53BD: $7E
    cp   $F0                                      ; $53BE: $FE $F0
    jr   nz, jr_018_53CD                          ; $53C0: $20 $0B

    call ClearEntityStatusBank18                  ; $53C2: $CD $08 $7F
    xor  a                                        ; $53C5: $AF
    ld   [wIsMarinFollowingLink], a               ; $53C6: $EA $73 $DB
    xor  a                                        ; $53C9: $AF
    ld   [wC167], a                               ; $53CA: $EA $67 $C1

jr_018_53CD:
    ret                                           ; $53CD: $C9

MovingBlockMoverEntityHandler::
    call func_018_548A                            ; $53CE: $CD $8A $54
    call func_018_7DE8                            ; $53D1: $CD $E8 $7D
    ld   hl, hLinkPositionX                       ; $53D4: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $53D7: $F0 $EE
    sub  [hl]                                     ; $53D9: $96
    add  $04                                      ; $53DA: $C6 $04
    cp   $08                                      ; $53DC: $FE $08
    jr   nc, jr_018_53ED                          ; $53DE: $30 $0D

    ld   hl, hLinkPositionY                       ; $53E0: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $53E3: $F0 $EC
    add  $04                                      ; $53E5: $C6 $04
    sub  [hl]                                     ; $53E7: $96
    jr   c, jr_018_53ED                           ; $53E8: $38 $03

    call func_018_7D3B                            ; $53EA: $CD $3B $7D

jr_018_53ED:
    ld   hl, hLinkPositionX                       ; $53ED: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $53F0: $F0 $EE
    sub  [hl]                                     ; $53F2: $96
    add  $06                                      ; $53F3: $C6 $06
    cp   $0C                                      ; $53F5: $FE $0C
    jr   nc, jr_018_5466                          ; $53F7: $30 $6D

    ld   hl, hLinkPositionY                       ; $53F9: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $53FC: $F0 $EC
    sub  [hl]                                     ; $53FE: $96
    add  $08                                      ; $53FF: $C6 $08
    cp   $04                                      ; $5401: $FE $04
    jr   nc, jr_018_5466                          ; $5403: $30 $61

    ld   e, $20                                   ; $5405: $1E $20
    ld   a, [wBButtonSlot]                        ; $5407: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $540A: $FE $03
    jr   z, jr_018_5417                           ; $540C: $28 $09

    ld   e, $10                                   ; $540E: $1E $10
    ld   a, [wAButtonSlot]                        ; $5410: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $5413: $FE $03
    jr   nz, jr_018_5466                          ; $5415: $20 $4F

jr_018_5417:
IF __PATCH_0__
    ld   a, [wC3CF]
    and  a
    jr   nz, jr_018_5466
ENDC

    ldh  a, [hPressedButtonsMask]                 ; $5417: $F0 $CB
    and  e                                        ; $5419: $A3
    jr   z, jr_018_5466                           ; $541A: $28 $4A

    ld   a, $02                                   ; $541C: $3E $02
    ldh  [hFFBA], a                               ; $541E: $E0 $BA
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_3A       ; $5420: $3E $3A
    ldh  [hLinkAnimationState], a                 ; $5422: $E0 $9D
    ld   a, $02                                   ; $5424: $3E $02
    ldh  [hLinkDirection], a                      ; $5426: $E0 $9E
    ld   a, $01                                   ; $5428: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $542A: $E0 $A1
    call ResetSpinAttack                          ; $542C: $CD $AF $0C
    ldh  a, [hActiveEntityPosX]                   ; $542F: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $5431: $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ; $5433: $F0 $EC
    add  $08                                      ; $5435: $C6 $08
    ldh  [hLinkPositionY], a                      ; $5437: $E0 $99
    cp   $50                                      ; $5439: $FE $50
    jr   nc, jr_018_545F                          ; $543B: $30 $22

    ldh  a, [hPressedButtonsMask]                 ; $543D: $F0 $CB
    and  $08                                      ; $543F: $E6 $08
    jr   z, jr_018_545F                           ; $5441: $28 $1C

    ld   hl, wEntitiesUnknowTableY                ; $5443: $21 $D0 $C3
    add  hl, bc                                   ; $5446: $09
    ld   a, [hl]                                  ; $5447: $7E
    inc  [hl]                                     ; $5448: $34
    and  $18                                      ; $5449: $E6 $18
    jr   z, jr_018_545E                           ; $544B: $28 $11

    ld   hl, hLinkAnimationState                  ; $544D: $21 $9D $FF
    inc  [hl]                                     ; $5450: $34
    ld   hl, wEntitiesSpeedYTable                 ; $5451: $21 $50 $C2
    add  hl, bc                                   ; $5454: $09
    ld   [hl], $04                                ; $5455: $36 $04
    call UpdateEntityYPosWithSpeed_18             ; $5457: $CD $62 $7E
    ld   a, $01                                   ; $545A: $3E $01
    ldh  [hFFBA], a                               ; $545C: $E0 $BA

jr_018_545E:
    ret                                           ; $545E: $C9

jr_018_545F:
    ld   hl, wEntitiesUnknowTableY                ; $545F: $21 $D0 $C3
    add  hl, bc                                   ; $5462: $09
    ld   [hl], $08                                ; $5463: $36 $08
    ret                                           ; $5465: $C9

jr_018_5466:
    ldh  a, [hActiveEntityVisualPosY]             ; $5466: $F0 $EC
    cp   $1B                                      ; $5468: $FE $1B
    jr   c, jr_018_5479                           ; $546A: $38 $0D

    ld   hl, wEntitiesSpeedYTable                 ; $546C: $21 $50 $C2
    add  hl, bc                                   ; $546F: $09
    ld   [hl], $FD                                ; $5470: $36 $FD
    call UpdateEntityYPosWithSpeed_18             ; $5472: $CD $62 $7E

IF !__PATCH_0__
    ld   a, $00                                   ; $5475: $3E $00
    ldh  [hFFBA], a                               ; $5477: $E0 $BA
ENDC

jr_018_5479:
IF __PATCH_0__
    ldh  a, [hActiveEntityVisualPosY]
    cp   $1a
    ret  c
    xor  a
    ldh  [hFFBA], a
ENDC
    ret                                           ; $5479: $C9

Data_018_547A::
    db   $44, $01, $44, $21, $74, $01, $74, $21

Data_018_5482::
    db   $46, $01, $46, $21, $76, $01, $76, $21

func_018_548A::
    ldh  a, [hMapId]                              ; $548A: $F0 $F7
    cp   MAP_BOTTLE_GROTTO                        ; $548C: $FE $01
    jr   nz, jr_018_5492                          ; $548E: $20 $02

    ldh  [hActiveEntitySpriteVariant], a          ; $5490: $E0 $F1

jr_018_5492:
    ld   de, Data_018_547A                        ; $5492: $11 $7A $54
    call RenderActiveEntitySpritesPair            ; $5495: $CD $C0 $3B
    ld   hl, wEntitiesPrivateState2Table          ; $5498: $21 $C0 $C2
    add  hl, bc                                   ; $549B: $09
    ld   a, [hl]                                  ; $549C: $7E
    add  $FC                                      ; $549D: $C6 $FC
    cp   $F0                                      ; $549F: $FE $F0
    ret  nc                                       ; $54A1: $D0

    ldh  [hActiveEntityVisualPosY], a             ; $54A2: $E0 $EC

jr_018_54A4:
    ld   de, Data_018_5482                        ; $54A4: $11 $82 $54
    call RenderActiveEntitySpritesPair            ; $54A7: $CD $C0 $3B
    ldh  a, [hActiveEntityVisualPosY]             ; $54AA: $F0 $EC
    add  $10                                      ; $54AC: $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $54AE: $E0 $EC
    ld   hl, hActiveEntityPosY                    ; $54B0: $21 $EF $FF
    cp   [hl]                                     ; $54B3: $BE
    jr   c, jr_018_54A4                           ; $54B4: $38 $EE

    jp   CopyEntityPositionToActivePosition       ; $54B6: $C3 $8A $3D

Data_018_54B9::
    db   $24, $00, $3E, $00

label_018_54BD:
    ld   de, Data_018_54B9                        ; $54BD: $11 $B9 $54
    call RenderActiveEntitySprite                 ; $54C0: $CD $77 $3C
    call func_018_7DE8                            ; $54C3: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $54C6: $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ; $54C9: $CA $08 $7F

    ld   e, $01                                   ; $54CC: $1E $01
    cp   $40                                      ; $54CE: $FE $40
    jr   c, jr_018_54DF                           ; $54D0: $38 $0D

    jr   nz, jr_018_54DE                          ; $54D2: $20 $0A

    ld   hl, wEntitiesPosYTable                   ; $54D4: $21 $10 $C2
    add  hl, bc                                   ; $54D7: $09
    ld   a, [hl]                                  ; $54D8: $7E
    add  $04                                      ; $54D9: $C6 $04
    ld   [hl], a                                  ; $54DB: $77
    jr   jr_018_54DF                              ; $54DC: $18 $01

jr_018_54DE:
    dec  e                                        ; $54DE: $1D

jr_018_54DF:
    ld   a, e                                     ; $54DF: $7B
    call SetEntitySpriteVariant                   ; $54E0: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $54E3: $CD $05 $0C
    ld   e, $FE                                   ; $54E6: $1E $FE
    and  $20                                      ; $54E8: $E6 $20
    jr   z, jr_018_54EE                           ; $54EA: $28 $02

    ld   e, $FC                                   ; $54EC: $1E $FC

jr_018_54EE:
    ld   hl, wEntitiesSpeedYTable                 ; $54EE: $21 $50 $C2
    add  hl, bc                                   ; $54F1: $09
    ld   [hl], e                                  ; $54F2: $73
    ld   hl, wEntitiesSpeedXTable                 ; $54F3: $21 $40 $C2
    add  hl, bc                                   ; $54F6: $09
    ld   [hl], $FF                                ; $54F7: $36 $FF
    ldh  a, [hFrameCounter]                       ; $54F9: $F0 $E7
    and  $03                                      ; $54FB: $E6 $03
    ret  nz                                       ; $54FD: $C0

    jp   UpdateEntityPosWithSpeed_18              ; $54FE: $C3 $5F $7E

; Note: this entity, unlike most others, use 3 spriteslots:
; 2 spriteslots when sleeping, and then another one for Marin singing, so 3.
;
; It uses the same trick as the slime boss, so the walrus spriteslots are loaded
; one room before the actual walrus. So Marin's singing sprite can be loaded when
; entering the room with the walrus.
WalrusEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $5501: $21 $B0 $C2
    add  hl, bc                                   ; $5504: $09
    ld   a, [hl]                                  ; $5505: $7E
    and  a                                        ; $5506: $A7
    jp   nz, label_018_54BD                       ; $5507: $C2 $BD $54

    ld   a, [wOverworldRoomStatus + $FD]                               ; $550A: $FA $FD $D8
    and  $20                                      ; $550D: $E6 $20
    jp   nz, label_018_589A                       ; $550F: $C2 $9A $58

    call func_018_586B                            ; $5512: $CD $6B $58
    call func_018_7DE8                            ; $5515: $CD $E8 $7D
    call AddEntityZSpeedToPos_18                  ; $5518: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $551B: $21 $20 $C3
    add  hl, bc                                   ; $551E: $09
    dec  [hl]                                     ; $551F: $35
    ld   hl, wEntitiesPosZTable                   ; $5520: $21 $10 $C3
    add  hl, bc                                   ; $5523: $09
    ld   a, [hl]                                  ; $5524: $7E
    and  $80                                      ; $5525: $E6 $80
    jr   z, jr_018_552F                           ; $5527: $28 $06

    ld   [hl], b                                  ; $5529: $70
    ld   hl, wEntitiesSpeedZTable                 ; $552A: $21 $20 $C3
    add  hl, bc                                   ; $552D: $09
    ld   [hl], b                                  ; $552E: $70

jr_018_552F:
    call func_018_7D36                            ; $552F: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $5532: $F0 $F0
    JP_TABLE                                      ; $5534
._00 dw WalrusState0Handler                       ; $5535
._01 dw WalrusWakingUpHandler                     ; $5537
._02 dw WalrusState2Handler                       ; $5539
._03 dw WalrusState3Handler                       ; $553B
._04 dw WalrusState4Handler                       ; $553D
._05 dw WalrusState5Handler                       ; $553F
._06 dw WalrusDisappearHandler                    ; $5541
._07 dw WalrusState7Handler                       ; $5543
._08 dw WalrusState8Handler                       ; $5545

WalrusState0Handler::
    ld   hl, wEntitiesUnknowTableY                ; $5547: $21 $D0 $C3
    add  hl, bc                                   ; $554A: $09
    inc  [hl]                                     ; $554B: $34
    ld   a, $7F                                   ; $554C: $3E $7F
    and  [hl]                                     ; $554E: $A6
    jr   nz, jr_018_557B                          ; $554F: $20 $2A

    ld   a, ENTITY_WALRUS                         ; $5551: $3E $C4
    call SpawnNewEntity_trampoline                ; $5553: $CD $86 $3B
    jr   c, jr_018_557B                           ; $5556: $38 $23

    ldh  a, [hMultiPurpose0]                      ; $5558: $F0 $D7
    sub  $08                                      ; $555A: $D6 $08
    ld   hl, wEntitiesPosXTable                   ; $555C: $21 $00 $C2
    add  hl, de                                   ; $555F: $19
    ld   [hl], a                                  ; $5560: $77
    ldh  a, [hMultiPurpose1]                      ; $5561: $F0 $D8
    add  $02                                      ; $5563: $C6 $02
    ld   hl, wEntitiesPosYTable                   ; $5565: $21 $10 $C2
    add  hl, de                                   ; $5568: $19
    ld   [hl], a                                  ; $5569: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $556A: $21 $E0 $C2
    add  hl, de                                   ; $556D: $19
    ld   [hl], $60                                ; $556E: $36 $60
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5570: $21 $40 $C3
    add  hl, de                                   ; $5573: $19
    ld   [hl], $C1                                ; $5574: $36 $C1
    ld   hl, wEntitiesPrivateState1Table          ; $5576: $21 $B0 $C2
    add  hl, de                                   ; $5579: $19
    inc  [hl]                                     ; $557A: $34

jr_018_557B:
    ld   a, [wIsMarinFollowingLink]               ; $557B: $FA $73 $DB
    and  a                                        ; $557E: $A7
    jr   nz, jr_018_558A                          ; $557F: $20 $09

    call func_018_7D7C                            ; $5581: $CD $7C $7D
    ret  nc                                       ; $5584: $D0

    jp_open_dialog $1E0                           ; $5585

jr_018_558A:
    call func_018_7EB2                            ; $558A: $CD $B2 $7E
    add  $13                                      ; $558D: $C6 $13
    cp   $26                                      ; $558F: $FE $26
    ret  nc                                       ; $5591: $D0

    call func_018_7EC2                            ; $5592: $CD $C2 $7E
    add  $20                                      ; $5595: $C6 $20
    cp   $40                                      ; $5597: $FE $40
    ret  nc                                       ; $5599: $D0

    call ResetSpinAttack                          ; $559A: $CD $AF $0C
    call ClearLinkPositionIncrement               ; $559D: $CD $8E $17
    ld   a, [wIsLinkInTheAir]                     ; $55A0: $FA $46 $C1
    and  a                                        ; $55A3: $A7
    ret  nz                                       ; $55A4: $C0

    ld   a, [wC50F]                               ; $55A5: $FA $0F $C5
    ld   e, a                                     ; $55A8: $5F
    ld   d, b                                     ; $55A9: $50
    ld   hl, wEntitiesPosZTable                   ; $55AA: $21 $10 $C3
    add  hl, de                                   ; $55AD: $19
    ld   a, [hl]                                  ; $55AE: $7E
    and  a                                        ; $55AF: $A7
    ret  nz                                       ; $55B0: $C0

    call IncrementEntityState                     ; $55B1: $CD $12 $3B
    call_open_dialog $1E1                         ; $55B4
    jp   label_018_59AC                           ; $55B9: $C3 $AC $59

WalrusWakingUpHandler::
    ld   a, [wDialogState]                        ; $55BC: $FA $9F $C1
    and  a                                        ; $55BF: $A7
    ret  nz                                       ; $55C0: $C0

    call IncrementEntityState                     ; $55C1: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]                               ; $55C4: $FA $77 $C1
    and  a                                        ; $55C7: $A7
    jr   nz, jr_018_55D8                          ; $55C8: $20 $0E

    ld   a, MUSIC_MARIN_SINGING                   ; $55CA: $3E $2F
    ld   [wMusicTrackToPlay], a                   ; $55CC: $EA $68 $D3
    ld   [wC3C8], a                               ; $55CF: $EA $C8 $C3
    call GetEntityDropTimer                       ; $55D2: $CD $FB $0B
    ld   [hl], $50                                ; $55D5: $36 $50
    ret                                           ; $55D7: $C9

jr_018_55D8:
    ld   [hl], $08                                ; $55D8: $36 $08
    jp_open_dialog $1E4                           ; $55DA

WalrusState2Handler::
    ld   a, $01                                   ; $55DF: $3E $01
    ld   [wC167], a                               ; $55E1: $EA $67 $C1
    ld   a, $02                                   ; $55E4: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $55E6: $E0 $A1
    call GetEntityDropTimer                       ; $55E8: $CD $FB $0B
    jr   nz, jr_018_55F2                          ; $55EB: $20 $05

    ld   [hl], $C0                                ; $55ED: $36 $C0
    jp   IncrementEntityState                     ; $55EF: $C3 $12 $3B

jr_018_55F2:
    ld   e, $00                                   ; $55F2: $1E $00
    cp   $40                                      ; $55F4: $FE $40
    jr   nc, jr_018_5612                          ; $55F6: $30 $1A

    ld   e, $02                                   ; $55F8: $1E $02
    cp   $10                                      ; $55FA: $FE $10
    jr   c, jr_018_5612                           ; $55FC: $38 $14

    ld   e, $00                                   ; $55FE: $1E $00
    cp   $3C                                      ; $5600: $FE $3C
    jr   nc, jr_018_5610                          ; $5602: $30 $0C

    cp   $20                                      ; $5604: $FE $20
    jr   z, jr_018_5612                           ; $5606: $28 $0A

    cp   $21                                      ; $5608: $FE $21
    jr   z, jr_018_5612                           ; $560A: $28 $06

    cp   $22                                      ; $560C: $FE $22
    jr   z, jr_018_5612                           ; $560E: $28 $02

jr_018_5610:
    ld   e, $01                                   ; $5610: $1E $01

jr_018_5612:
    ld   a, e                                     ; $5612: $7B
    jp   SetEntitySpriteVariant                   ; $5613: $C3 $0C $3B

Data_018_5616::
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02

WalrusState3Handler::
    ld   a, $01                                   ; $5676: $3E $01
    ld   [wC167], a                               ; $5678: $EA $67 $C1
    ld   a, $02                                   ; $567B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $567D: $E0 $A1
    call GetEntityDropTimer                       ; $567F: $CD $FB $0B
    jr   nz, jr_018_5698                          ; $5682: $20 $14

    ld   [wC3C8], a                               ; $5684: $EA $C8 $C3
    ld   a, $11                                   ; $5687: $3E $11
    ldh  [hNoiseSfx], a                           ; $5689: $E0 $F4
    call GetEntityTransitionCountdown             ; $568B: $CD $05 $0C
    ld   [hl], $08                                ; $568E: $36 $08
    ld   a, $02                                   ; $5690: $3E $02
    call SetEntitySpriteVariant                   ; $5692: $CD $0C $3B
    jp   IncrementEntityState                     ; $5695: $C3 $12 $3B

jr_018_5698:
    ld   hl, wEntitiesUnknownTableD               ; $5698: $21 $D0 $C2
    add  hl, bc                                   ; $569B: $09
    ld   e, [hl]                                  ; $569C: $5E
    ld   d, b                                     ; $569D: $50
    ldh  a, [hFrameCounter]                       ; $569E: $F0 $E7
    and  $07                                      ; $56A0: $E6 $07
    jr   nz, jr_018_56B8                          ; $56A2: $20 $14

    inc  [hl]                                     ; $56A4: $34
    ld   a, [hl]                                  ; $56A5: $7E
    cp   $60                                      ; $56A6: $FE $60
    jr   nc, jr_018_56B8                          ; $56A8: $30 $0E

    and  $0F                                      ; $56AA: $E6 $0F
    jr   nz, jr_018_56B8                          ; $56AC: $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ; $56AE: $21 $20 $C3
    add  hl, bc                                   ; $56B1: $09
    ld   [hl], $10                                ; $56B2: $36 $10
    ld   a, JINGLE_JUMP                           ; $56B4: $3E $24
    ldh  [hJingle], a                             ; $56B6: $E0 $F2

jr_018_56B8:
    ld   hl, Data_018_5616                        ; $56B8: $21 $16 $56
    add  hl, de                                   ; $56BB: $19
    ld   a, [hl]                                  ; $56BC: $7E
    cp   $02                                      ; $56BD: $FE $02
    jr   nz, jr_018_56CE                          ; $56BF: $20 $0D

    ldh  a, [hFrameCounter]                       ; $56C1: $F0 $E7
    and  $3F                                      ; $56C3: $E6 $3F
    jr   nz, jr_018_56CC                          ; $56C5: $20 $05

    ld   hl, hJingle                              ; $56C7: $21 $F2 $FF
    ld   [hl], JINGLE_WALRUS                      ; $56CA: $36 $27

jr_018_56CC:
    ld   a, $02                                   ; $56CC: $3E $02

jr_018_56CE:
    call SetEntitySpriteVariant                   ; $56CE: $CD $0C $3B
    ld   hl, wEntitiesPosZTable                   ; $56D1: $21 $10 $C3
    add  hl, bc                                   ; $56D4: $09
    ld   a, [hl]                                  ; $56D5: $7E
    and  a                                        ; $56D6: $A7
    ret  z                                        ; $56D7: $C8

    ld   e, $01                                   ; $56D8: $1E $01
    ld   hl, wEntitiesSpeedZTable                 ; $56DA: $21 $20 $C3
    add  hl, bc                                   ; $56DD: $09
    ld   a, [hl]                                  ; $56DE: $7E
    sub  $F8                                      ; $56DF: $D6 $F8
    and  $80                                      ; $56E1: $E6 $80
    jr   nz, jr_018_56E6                          ; $56E3: $20 $01

    inc  e                                        ; $56E5: $1C

jr_018_56E6:
    ld   a, e                                     ; $56E6: $7B
    jp   SetEntitySpriteVariant                   ; $56E7: $C3 $0C $3B

WalrusState4Handler::
    ld   a, $02                                   ; $56EA: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $56EC: $E0 $A1
    call GetEntityTransitionCountdown             ; $56EE: $CD $05 $0C
    ret  nz                                       ; $56F1: $C0

    ld   [hl], $10                                ; $56F2: $36 $10
    ld   hl, wEntitiesPosYTable                   ; $56F4: $21 $10 $C2
    add  hl, bc                                   ; $56F7: $09
    ld   a, [hl]                                  ; $56F8: $7E
    add  $04                                      ; $56F9: $C6 $04
    ld   [hl], a                                  ; $56FB: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $56FC: $21 $B0 $C3
    add  hl, bc                                   ; $56FF: $09
    ld   a, [hl]                                  ; $5700: $7E
    inc  a                                        ; $5701: $3C
    ld   [hl], a                                  ; $5702: $77
    cp   $04                                      ; $5703: $FE $04
    ret  nz                                       ; $5705: $C0

    ld   hl, wEntitiesPosZTable                   ; $5706: $21 $10 $C3
    add  hl, bc                                   ; $5709: $09
    ld   [hl], $18                                ; $570A: $36 $18
    ld   hl, wEntitiesPosYTable                   ; $570C: $21 $10 $C2
    add  hl, bc                                   ; $570F: $09
    ld   a, [hl]                                  ; $5710: $7E
    add  $18                                      ; $5711: $C6 $18
    ld   [hl], a                                  ; $5713: $77
    ld   a, JINGLE_JUMP_DOWN                      ; $5714: $3E $08
    ldh  [hJingle], a                             ; $5716: $E0 $F2
    jp   IncrementEntityState                     ; $5718: $C3 $12 $3B

WalrusState5Handler::
    ld   a, $02                                   ; $571B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $571D: $E0 $A1
    ld   hl, wEntitiesPosZTable                   ; $571F: $21 $10 $C3
    add  hl, bc                                   ; $5722: $09
    ld   a, [hl]                                  ; $5723: $7E
    and  a                                        ; $5724: $A7
    ret  nz                                       ; $5725: $C0

    call IncrementEntityState                     ; $5726: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5729: $CD $05 $0C
    ld   [hl], $08                                ; $572C: $36 $08

; Walrus splash VFX
func_018_572E::
    ld   a, $24                                   ; $572E: $3E $24
    ldh  [hNoiseSfx], a                           ; $5730: $E0 $F4
    ldh  a, [hActiveEntityPosX]                   ; $5732: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $5734: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $5736: $F0 $EC
    add  $10                                      ; $5738: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $573A: $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $573C: $3E $01
    call AddTranscientVfx                         ; $573E: $CD $C7 $0C
    ldh  a, [hActiveEntityPosX]                   ; $5741: $F0 $EE
    add  $10                                      ; $5743: $C6 $10
    ldh  [hMultiPurpose0], a                      ; $5745: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $5747: $F0 $EC
    add  $10                                      ; $5749: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $574B: $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $574D: $3E $01
    jp   AddTranscientVfx                         ; $574F: $C3 $C7 $0C

; When the walrus disappears and Link looks down and the normal music resumes.
WalrusDisappearHandler::
    call GetEntityTransitionCountdown             ; $5752: $CD $05 $0C
    jr   nz, jr_018_5778                          ; $5755: $20 $21

    call IncrementEntityState                     ; $5757: $CD $12 $3B
    ; Resumes the normal music after the walrus has disappeared
    ldh  a, [hDefaultMusicTrack]                  ; $575A: $F0 $B0
    ld   [wMusicTrackToPlay], a                   ; $575C: $EA $68 $D3
    ld   a, $FF                                   ; $575F: $3E $FF
    call SetEntitySpriteVariant                   ; $5761: $CD $0C $3B
    call_open_dialog $1E2                         ; $5764
    ld   a, $03                                   ; $5769: $3E $03
    call func_018_59AE                            ; $576B: $CD $AE $59
    ld   a, DIRECTION_DOWN                        ; $576E: $3E $03
    ldh  [hLinkDirection], a                      ; $5770: $E0 $9E
    push bc                                       ; $5772: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $5773: $CD $F0 $0B
    pop  bc                                       ; $5776: $C1
    ret                                           ; $5777: $C9

jr_018_5778:
    ld   a, $05                                   ; $5778: $3E $05
    jp   SetEntitySpriteVariant                   ; $577A: $C3 $0C $3B

WalrusState7Handler::
    ld   a, ENTITY_BUNNY_CALLING_MARIN            ; $577D: $3E $C8
    call SpawnNewEntity_trampoline                ; $577F: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $5782: $21 $00 $C2
    add  hl, de                                   ; $5785: $19
    ld   [hl], $F8                                ; $5786: $36 $F8
    ld   hl, wEntitiesTransitionCountdownTable    ; $5788: $21 $E0 $C2
    add  hl, de                                   ; $578B: $19
    ld   [hl], $20                                ; $578C: $36 $20
    ld   hl, wEntitiesPosYTable                   ; $578E: $21 $10 $C2
    add  hl, de                                   ; $5791: $19
    ld   [hl], $48                                ; $5792: $36 $48
    call ClearEntityStatusBank18                  ; $5794: $CD $08 $7F
    jp   SetRoomStatus20                            ; $5797: $C3 $B9 $7F

WalrusState8Handler::
    ret                                           ; $579A: $C9

Data_018_579B::
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $579B
    db   $00, $10, $64, $01, $00, $18, $66, $01   ; $57A3
    db   $10, $00, $68, $01, $10, $08, $6A, $01   ; $57AB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ; $57B3
    db   $00, $00, $60, $01, $00, $08, $70, $01   ; $57BB
    db   $00, $10, $64, $01, $00, $18, $66, $01   ; $57C3
    db   $10, $00, $68, $01, $10, $08, $6A, $01   ; $57CB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ; $57D3
    db   $00, $00, $72, $01, $00, $08, $74, $01   ; $57DB
    db   $00, $10, $64, $01, $00, $18, $66, $01   ; $57E3
    db   $10, $00, $76, $01, $10, $08, $6A, $01   ; $57EB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ; $57F3
    db   $00, $00, $78, $01, $00, $08, $7A, $01   ; $57FB
    db   $00, $10, $7C, $01, $00, $18, $7E, $01   ; $5803
    db   $10, $00, $78, $41, $10, $08, $7A, $41   ; $580B
    db   $10, $10, $7C, $41, $10, $18, $7E, $41   ; $5813
    db   $00, $00, $68, $41, $00, $08, $6A, $41   ; $581B
    db   $00, $10, $6C, $41, $00, $18, $6E, $41   ; $5823
    db   $10, $00, $60, $41, $10, $08, $62, $41   ; $582B
    db   $10, $10, $64, $41, $10, $18, $66, $41   ; $5833
    db   $0E, $00, $68, $41, $0E, $08, $6A, $41   ; $583B
    db   $0E, $10, $6C, $41, $0E, $18, $6E, $41   ; $5843
    db   $10, $00, $FF, $41, $10, $08, $FF, $41   ; $584B
    db   $10, $10, $FF, $41, $10, $18, $FF, $41   ; $5853

Data_018_585B::
    db   $17, $03, $26, $00, $17, $09, $26, $00, $17, $0F, $26, $00, $17, $15, $26, $00

; Render Walrus?
func_018_586B::
    ldh  a, [hActiveEntitySpriteVariant]          ; $586B: $F0 $F1
    rla                                           ; $586D: $17
    rla                                           ; $586E: $17
    rla                                           ; $586F: $17
    rla                                           ; $5870: $17
    rla                                           ; $5871: $17
    and  $E0                                      ; $5872: $E6 $E0
    ld   e, a                                     ; $5874: $5F
    ld   d, b                                     ; $5875: $50
    ld   hl, Data_018_579B                        ; $5876: $21 $9B $57
    add  hl, de                                   ; $5879: $19
    ld   c, $08                                   ; $587A: $0E $08
    call RenderActiveEntitySpritesRect            ; $587C: $CD $E6 $3C
    ld   hl, wEntitiesPosZTable                   ; $587F: $21 $10 $C3
    add  hl, bc                                   ; $5882: $09
    ld   a, [hl]                                  ; $5883: $7E
    and  a                                        ; $5884: $A7
    ret  z                                        ; $5885: $C8

    ldh  a, [hActiveEntityPosY]                   ; $5886: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $5888: $E0 $EC
    ld   hl, Data_018_585B                        ; $588A: $21 $5B $58
    ld   c, $04                                   ; $588D: $0E $04
    call RenderActiveEntitySpritesRect            ; $588F: $CD $E6 $3C
    ld   a, $04                                   ; $5892: $3E $04
    call label_3DA0                               ; $5894: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $5897: $C3 $8A $3D

label_018_589A:
    call func_018_596B                            ; $589A: $CD $6B $59
    ld   a, [wRoomTransitionState]                ; $589D: $FA $24 $C1

jr_018_58A0:
    and  a                                        ; $58A0: $A7
    ret  nz                                       ; $58A1: $C0

    ldh  a, [hActiveEntityState]                  ; $58A2: $F0 $F0
    JP_TABLE                                      ; $58A4
._00 dw func_018_58AD                             ; $58A5
._01 dw func_018_58C1                             ; $58A7
._02 dw func_018_58DD                             ; $58A9
._03 dw func_018_58F1                             ; $58AB

func_018_58AD::
    ld   hl, wEntitiesPosYTable                   ; $58AD: $21 $10 $C2
    add  hl, bc                                   ; $58B0: $09
    ld   [hl], $68                                ; $58B1: $36 $68
    ld   hl, wEntitiesPosXTable                   ; $58B3: $21 $00 $C2
    add  hl, bc                                   ; $58B6: $09
    ld   [hl], $80                                ; $58B7: $36 $80
    call GetEntityTransitionCountdown             ; $58B9: $CD $05 $0C
    ld   [hl], $20                                ; $58BC: $36 $20
    jp   IncrementEntityState                     ; $58BE: $C3 $12 $3B

func_018_58C1::
    call GetEntityTransitionCountdown             ; $58C1: $CD $05 $0C
    ret  nz                                       ; $58C4: $C0

    ld   a, [wSelectedSongIndex]                               ; $58C5: $FA $4A $DB
    cp   $00                                      ; $58C8: $FE $00
    ret  nz                                       ; $58CA: $C0

    ld   a, [wLinkPlayingOcarinaCountdown]        ; $58CB: $FA $66 $C1
    and  a                                        ; $58CE: $A7
    cp   $40                                      ; $58CF: $FE $40
    ret  nz                                       ; $58D1: $C0

    call IncrementEntityState                     ; $58D2: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $58D5: $CD $05 $0C
    ld   [hl], $20                                ; $58D8: $36 $20
    jp   func_018_572E                            ; $58DA: $C3 $2E $57

func_018_58DD::
    call GetEntityTransitionCountdown             ; $58DD: $CD $05 $0C
    jr   nz, jr_018_58E7                          ; $58E0: $20 $05

    ld   [hl], $C8                                ; $58E2: $36 $C8
    jp   IncrementEntityState                     ; $58E4: $C3 $12 $3B

jr_018_58E7:
    cp   $10                                      ; $58E7: $FE $10
    ld   a, $01                                   ; $58E9: $3E $01
    jr   c, jr_018_58EE                           ; $58EB: $38 $01

    inc  a                                        ; $58ED: $3C

jr_018_58EE:
    jp   SetEntitySpriteVariant                   ; $58EE: $C3 $0C $3B

func_018_58F1::
    call GetEntityTransitionCountdown             ; $58F1: $CD $05 $0C
    jr   nz, jr_018_58FC                          ; $58F4: $20 $06

    call func_018_572E                            ; $58F6: $CD $2E $57
    jp   ClearEntityStatusBank18                  ; $58F9: $C3 $08 $7F

jr_018_58FC:
    cp   $B0                                      ; $58FC: $FE $B0
    jr   nz, jr_018_5900                          ; $58FE: $20 $00

jr_018_5900:
    call GetEntityTransitionCountdown             ; $5900: $CD $05 $0C
    cp   $80                                      ; $5903: $FE $80
    jr   nz, jr_018_590D                          ; $5905: $20 $06

    dec  [hl]                                     ; $5907: $35
    call_open_dialog $1E6                         ; $5908

jr_018_590D:
    call GetEntityTransitionCountdown             ; $590D: $CD $05 $0C
    ld   d, $00                                   ; $5910: $16 $00
    cp   $10                                      ; $5912: $FE $10
    ld   e, $02                                   ; $5914: $1E $02
    jr   c, jr_018_591E                           ; $5916: $38 $06

    dec  e                                        ; $5918: $1D
    cp   $20                                      ; $5919: $FE $20
    jr   c, jr_018_591E                           ; $591B: $38 $01

    inc  d                                        ; $591D: $14

jr_018_591E:
    ld   hl, wEntitiesUnknowTableR                ; $591E: $21 $90 $C3
    add  hl, bc                                   ; $5921: $09
    ld   [hl], d                                  ; $5922: $72
    ld   a, e                                     ; $5923: $7B
    jp   SetEntitySpriteVariant                   ; $5924: $C3 $0C $3B

Data_018_5927::
    db   $FF, $04, $FF, $00, $FF, $0C, $FF, $00, $FF, $04, $FF, $00, $FF, $0C, $FF, $00
    db   $FF, $14, $FF, $00, $FC, $04, $70, $01, $FC, $0C, $72, $01, $0C, $04, $74, $01
    db   $0C, $0C, $76, $01, $0C, $14, $78, $01, $0C, $04, $7A, $01, $0C, $0C, $7C, $01
    db   $0C, $14, $7E, $01, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

Data_018_5963::
    db   $00, $00, $01, $02, $03, $03, $02, $01

func_018_596B::
    ldh  a, [hFrameCounter]                       ; $596B: $F0 $E7
    rra                                           ; $596D: $1F
    rra                                           ; $596E: $1F
    rra                                           ; $596F: $1F
    rra                                           ; $5970: $1F
    nop                                           ; $5971: $00
    nop                                           ; $5972: $00
    and  $07                                      ; $5973: $E6 $07
    ld   e, a                                     ; $5975: $5F
    ld   d, b                                     ; $5976: $50
    ld   hl, Data_018_5963                        ; $5977: $21 $63 $59
    add  hl, de                                   ; $597A: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $597B: $F0 $EC
    add  [hl]                                     ; $597D: $86
    ldh  [hActiveEntityVisualPosY], a             ; $597E: $E0 $EC
    ld   hl, wEntitiesUnknowTableR                ; $5980: $21 $90 $C3
    add  hl, bc                                   ; $5983: $09
    ld   a, [hl]                                  ; $5984: $7E
    and  a                                        ; $5985: $A7
    jr   z, jr_018_5995                           ; $5986: $28 $0D

    ldh  a, [hFrameCounter]                       ; $5988: $F0 $E7
    rra                                           ; $598A: $1F
    rra                                           ; $598B: $1F
    rra                                           ; $598C: $1F
    rra                                           ; $598D: $1F
    rra                                           ; $598E: $1F
    rra                                           ; $598F: $1F
    and  $01                                      ; $5990: $E6 $01
    inc  a                                        ; $5992: $3C
    ldh  [hActiveEntitySpriteVariant], a          ; $5993: $E0 $F1

jr_018_5995:
    ldh  a, [hActiveEntitySpriteVariant]          ; $5995: $F0 $F1
    rla                                           ; $5997: $17
    rla                                           ; $5998: $17
    and  $FC                                      ; $5999: $E6 $FC
    ld   e, a                                     ; $599B: $5F
    rla                                           ; $599C: $17
    rla                                           ; $599D: $17
    and  $F0                                      ; $599E: $E6 $F0
    add  e                                        ; $59A0: $83
    ld   e, a                                     ; $59A1: $5F
    ld   d, b                                     ; $59A2: $50
    ld   hl, Data_018_5927                        ; $59A3: $21 $27 $59
    add  hl, de                                   ; $59A6: $19
    ld   c, $05                                   ; $59A7: $0E $05
    jp   RenderActiveEntitySpritesRect            ; $59A9: $C3 $E6 $3C

label_018_59AC:
    ld   a, $00                                   ; $59AC: $3E $00

func_018_59AE::
    ld   e, $10                                   ; $59AE: $1E $10
    ld   hl, wD1B5                                ; $59B0: $21 $B5 $D1

jr_018_59B3:
    ld   [hl+], a                                 ; $59B3: $22
    dec  e                                        ; $59B4: $1D
    jr   nz, jr_018_59B3                          ; $59B5: $20 $FC

    ret                                           ; $59B7: $C9

Data_018_59B8::
    db   $42, $21, $40, $21, $40, $01, $42, $01, $44, $01, $46, $01, $46, $21, $44, $21
    db   $48, $01, $4A, $01, $4C, $01, $4E, $01, $4A, $21, $48, $21, $4E, $21, $4C, $21
    db   $50, $01, $52, $01, $54, $01, $54, $21, $52, $21, $50, $21

Data_018_59E4::
    db   $06, $04, $02, $00

; Marin beach cutscene related.
label_018_59E8:
    ld   a, c                                     ; $59E8: $79
    ld   [wC50F], a                               ; $59E9: $EA $0F $C5
    call GetEntityTransitionCountdown             ; $59EC: $CD $05 $0C

    jr   z, jr_018_5A3F                           ; $59EF: $28 $4E

    cp   $10                                      ; $59F1: $FE $10
    jr   nz, jr_018_5A07                          ; $59F3: $20 $12

    dec  [hl]                                     ; $59F5: $35
    ldh  a, [hLinkPositionY]                      ; $59F6: $F0 $99
    push af                                       ; $59F8: $F5
    ld   a, $28                                   ; $59F9: $3E $28
    ldh  [hLinkPositionY], a                      ; $59FB: $E0 $99
    call_open_dialog $01F                         ; $59FD
    pop  af                                       ; $5A02: $F1
    ldh  [hLinkPositionY], a                      ; $5A03: $E0 $99
    ld   a, $0F                                   ; $5A05: $3E $0F

; Sword on beach music handling script
jr_018_5A07:
    cp   $01                                      ; $5A07: $FE $01
    jr   nz, jr_018_5A18                          ; $5A09: $20 $0D

    xor  a                                        ; $5A0B: $AF
    ld   [wC167], a                               ; $5A0C: $EA $67 $C1
    ld   a, MUSIC_OVERWORLD_INTRO                 ; $5A0F: $3E $31
    ld   [wMusicTrackToPlay], a                   ; $5A11: $EA $68 $D3
    ; Sets the area track to overworld, so that after the introduction section fanfare, the overworld music will play rather than the Koholint Island theme
    ld   a, MUSIC_OVERWORLD                       ; $5A14: $3E $05
    ldh  [hDefaultMusicTrack], a                  ; $5A16: $E0 $B0

jr_018_5A18:
    xor  a                                        ; $5A18: $AF
    ld   [wEntitiesSpriteVariantTable], a         ; $5A19: $EA $B0 $C3
    ld   de, Data_018_59B8                        ; $5A1C: $11 $B8 $59
    call RenderActiveEntitySpritesPair            ; $5A1F: $CD $C0 $3B
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM       ; $5A22: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $5A24: $E0 $9D
    ld   a, $02                                   ; $5A26: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5A28: $E0 $A1
    ld   a, $03                                   ; $5A2A: $3E $03
    ldh  [hLinkDirection], a                      ; $5A2C: $E0 $9E
    ldh  a, [hLinkPositionX]                      ; $5A2E: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $5A30: $21 $00 $C2
    add  hl, bc                                   ; $5A33: $09
    ld   [hl], a                                  ; $5A34: $77
    ldh  a, [hLinkPositionY]                      ; $5A35: $F0 $99
    sub  $10                                      ; $5A37: $D6 $10
    ld   hl, wEntitiesPosYTable                   ; $5A39: $21 $10 $C2
    add  hl, bc                                   ; $5A3C: $09
    ld   [hl], a                                  ; $5A3D: $77
    ret                                           ; $5A3E: $C9

; 'You got Marin!' joke
jr_018_5A3F:
    ld   hl, wEntitiesUnknowTableP                ; $5A3F: $21 $40 $C4
    add  hl, bc                                   ; $5A42: $09
    ld   a, [hl]                                  ; $5A43: $7E
    and  a                                        ; $5A44: $A7
    jr   nz, @+$47                                ; $5A45: $20 $45

    ld   a, [wTransitionSequenceCounter]          ; $5A47: $FA $6B $C1
    cp   $04                                      ; $5A4A: $FE $04
    jr   nz, jr_018_5A7F                          ; $5A4C: $20 $31

    inc  [hl]                                     ; $5A4E: $34
    call GetEntityTransitionCountdown             ; $5A4F: $CD $05 $0C
    ld   [hl], $70                                ; $5A52: $36 $70
    ld   a, MUSIC_TOOL_ACQUIRED                   ; $5A54: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $5A56: $EA $68 $D3
    ; Makes it so that no music plays after the 'item found' fanfare
    ld   a, MUSIC_SILENCE                         ; $5A59: $3E $FF
    ldh  [hNextDefaultMusicTrack], a              ; $5A5B: $E0 $BF

    ; Link lifting Marin animation
    ldh  a, [hLinkPositionX]                      ; $5A5D: $F0 $98
    ld   hl, $D155                                ; $5A5F: $21 $55 $D1
    call func_018_5A79                            ; $5A62: $CD $79 $5A
    ldh  a, [hLinkPositionY]                      ; $5A65: $F0 $99
    ld   hl, $D175                                ; $5A67: $21 $75 $D1
    call func_018_5A79                            ; $5A6A: $CD $79 $5A
    xor  a                                        ; $5A6D: $AF
    ld   hl, $D195                                ; $5A6E: $21 $95 $D1
    call func_018_5A79                            ; $5A71: $CD $79 $5A
    ldh  a, [hLinkDirection]                      ; $5A74: $F0 $9E
    ld   hl, wD1B5                                ; $5A76: $21 $B5 $D1

func_018_5A79::
    ld   e, $10                                   ; $5A79: $1E $10

jr_018_5A7B:
    ld   [hl+], a                                 ; $5A7B: $22
    dec  e                                        ; $5A7C: $1D
    jr   nz, jr_018_5A7B                          ; $5A7D: $20 $FC

jr_018_5A7F:
    ret                                           ; $5A7F: $C9

Data_018_5A80::
    db   $08, $08, $08, $09, $0A, $0A, $0A, $09

Data_018_5A88::
    db   $08, $F8

Data_018_5A8A::
    db   $06, $01, $FA, $C8, $C3, $A7, $28

func_018_5A91::
    ld   d, l                                     ; $5A91: $55
    ldh  a, [hFrameCounter]                       ; $5A92: $F0 $E7
    rra                                           ; $5A94: $1F
    rra                                           ; $5A95: $1F
    rra                                           ; $5A96: $1F
    rra                                           ; $5A97: $1F
    and  $07                                      ; $5A98: $E6 $07
    ld   e, a                                     ; $5A9A: $5F
    ld   d, b                                     ; $5A9B: $50
    ld   hl, Data_018_5A80                        ; $5A9C: $21 $80 $5A
    add  hl, de                                   ; $5A9F: $19
    ld   a, [hl]                                  ; $5AA0: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $5AA1: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $5AA3: $F0 $E7
    and  $1F                                      ; $5AA5: $E6 $1F
    jr   nz, jr_018_5AE7                          ; $5AA7: $20 $3E

    ld   a, ENTITY_MUSICAL_NOTE                   ; $5AA9: $3E $C9
    call SpawnNewEntity_trampoline                ; $5AAB: $CD $86 $3B
    jr   c, jr_018_5AE7                           ; $5AAE: $38 $37

    ldh  a, [hMultiPurpose1]                      ; $5AB0: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5AB2: $21 $10 $C2
    add  hl, de                                   ; $5AB5: $19
    sub  $08                                      ; $5AB6: $D6 $08
    ld   [hl], a                                  ; $5AB8: $77
    push bc                                       ; $5AB9: $C5
    ldh  a, [hFrameCounter]                       ; $5ABA: $F0 $E7
    rra                                           ; $5ABC: $1F
    rra                                           ; $5ABD: $1F
    rra                                           ; $5ABE: $1F
    rra                                           ; $5ABF: $1F
    rra                                           ; $5AC0: $1F
    and  $01                                      ; $5AC1: $E6 $01
    ld   c, a                                     ; $5AC3: $4F
    ld   hl, Data_018_5A88                        ; $5AC4: $21 $88 $5A
    add  hl, bc                                   ; $5AC7: $09
    ldh  a, [hMultiPurpose0]                      ; $5AC8: $F0 $D7
    add  [hl]                                     ; $5ACA: $86
    ld   hl, wEntitiesPosXTable                   ; $5ACB: $21 $00 $C2
    add  hl, de                                   ; $5ACE: $19
    ld   [hl], a                                  ; $5ACF: $77
    ld   hl, Data_018_5A8A                        ; $5AD0: $21 $8A $5A
    add  hl, bc                                   ; $5AD3: $09
    ld   a, [hl]                                  ; $5AD4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5AD5: $21 $40 $C2
    add  hl, de                                   ; $5AD8: $19
    ld   [hl], a                                  ; $5AD9: $77
    ld   hl, wEntitiesSpeedYTable                 ; $5ADA: $21 $50 $C2
    add  hl, de                                   ; $5ADD: $19
    ld   [hl], $FC                                ; $5ADE: $36 $FC
    ld   hl, wEntitiesUnknowTableY                ; $5AE0: $21 $D0 $C3
    add  hl, de                                   ; $5AE3: $19
    ld   [hl], $40                                ; $5AE4: $36 $40
    pop  bc                                       ; $5AE6: $C1

jr_018_5AE7:
    ld   de, Data_018_59B8                        ; $5AE7: $11 $B8 $59
    call RenderActiveEntitySpritesPair            ; $5AEA: $CD $C0 $3B
    ld   a, [wInventoryAppearing]                 ; $5AED: $FA $4F $C1
    and  a                                        ; $5AF0: $A7
    ret  nz                                       ; $5AF1: $C0

    ld   hl, wEntitiesUnknowTableV                ; $5AF2: $21 $80 $C4
    add  hl, bc                                   ; $5AF5: $09
    ld   a, [hl]                                  ; $5AF6: $7E
    and  a                                        ; $5AF7: $A7
    jr   z, jr_018_5B03                           ; $5AF8: $28 $09

    dec  a                                        ; $5AFA: $3D
    jr   nz, jr_018_5B03                          ; $5AFB: $20 $06

    dec  [hl]                                     ; $5AFD: $35
    call_open_dialog $27A                         ; $5AFE

jr_018_5B03:
    ld   hl, wEntitiesPrivateCountdown2Table      ; $5B03: $21 $00 $C3
    add  hl, bc                                   ; $5B06: $09
    ld   a, [wTransitionSequenceCounter]          ; $5B07: $FA $6B $C1
    cp   $04                                      ; $5B0A: $FE $04
    jr   z, jr_018_5B13                           ; $5B0C: $28 $05

    ld   a, [hl]                                  ; $5B0E: $7E
    and  a                                        ; $5B0F: $A7
    jr   z, jr_018_5B13                           ; $5B10: $28 $01

    dec  [hl]                                     ; $5B12: $35

jr_018_5B13:
    ld   a, [hl]                                  ; $5B13: $7E
    and  a                                        ; $5B14: $A7
    jr   z, jr_018_5B6A                           ; $5B15: $28 $53

    cp   $30                                      ; $5B17: $FE $30
    jr   nz, jr_018_5B55                          ; $5B19: $20 $3A

    xor  a                                        ; $5B1B: $AF
    ld   [wC167], a                               ; $5B1C: $EA $67 $C1
    ldh  a, [hLinkPositionX]                      ; $5B1F: $F0 $98
    sub  $58                                      ; $5B21: $D6 $58
    add  $03                                      ; $5B23: $C6 $03
    cp   $06                                      ; $5B25: $FE $06
    jr   nc, jr_018_5B33                          ; $5B27: $30 $0A

    ldh  a, [hLinkPositionY]                      ; $5B29: $F0 $99
    sub  $50                                      ; $5B2B: $D6 $50
    add  $03                                      ; $5B2D: $C6 $03
    cp   $06                                      ; $5B2F: $FE $06
    jr   c, jr_018_5B3B                           ; $5B31: $38 $08

jr_018_5B33:
    ld   [hl], b                                  ; $5B33: $70
    ld   hl, wEntitiesUnknowTableV                ; $5B34: $21 $80 $C4
    add  hl, bc                                   ; $5B37: $09
    ld   [hl], $1C                                ; $5B38: $36 $1C
    ret                                           ; $5B3A: $C9

jr_018_5B3B:
    ld   hl, hJingle                              ; $5B3B: $21 $F2 $FF
    ld   [hl], JINGLE_HUGE_BUMP                   ; $5B3E: $36 $0B
    ld   hl, hWaveSfx                             ; $5B40: $21 $F3 $FF
    ld   [hl], $03                                ; $5B43: $36 $03
    ld   hl, wC157                                ; $5B45: $21 $57 $C1
    ld   [hl], $18                                ; $5B48: $36 $18
    ld   hl, wC158                                ; $5B4A: $21 $58 $C1
    ld   [hl], $04                                ; $5B4D: $36 $04
    ld   hl, hLinkPositionX                       ; $5B4F: $21 $98 $FF
    inc  [hl]                                     ; $5B52: $34
    jr   jr_018_5B61                              ; $5B53: $18 $0C

jr_018_5B55:
    jr   nc, jr_018_5B6A                          ; $5B55: $30 $13

    cp   $10                                      ; $5B57: $FE $10
    jr   nz, jr_018_5B61                          ; $5B59: $20 $06

    dec  [hl]                                     ; $5B5B: $35
    call_open_dialog $27B                         ; $5B5C

jr_018_5B61:
    ld   a, $02                                   ; $5B61: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5B63: $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ; $5B65: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $5B67: $E0 $9D
    ret                                           ; $5B69: $C9

jr_018_5B6A:
    ld   a, [$DB74]                               ; $5B6A: $FA $74 $DB
    ld   hl, wLoadPreviousMapCountdown            ; $5B6D: $21 $BC $C1
    or   [hl]                                     ; $5B70: $B6
    ret  nz                                       ; $5B71: $C0

    ld   a, [$DB10]                               ; $5B72: $FA $10 $DB
    and  a                                        ; $5B75: $A7
    jp   z, label_018_5C6A                        ; $5B76: $CA $6A $5C

    call label_3B23                               ; $5B79: $CD $23 $3B
    ld   a, $02                                   ; $5B7C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5B7E: $E0 $A1
    ld   [wC167], a                               ; $5B80: $EA $67 $C1
    call func_018_7DE8                            ; $5B83: $CD $E8 $7D
    ld   a, [wD468]                               ; $5B86: $FA $68 $D4
    and  a                                        ; $5B89: $A7
    jr   z, jr_018_5B90                           ; $5B8A: $28 $04

    dec  a                                        ; $5B8C: $3D
    ld   [wD468], a                               ; $5B8D: $EA $68 $D4

jr_018_5B90:
    ldh  a, [hActiveEntityState]                  ; $5B90: $F0 $F0
    JP_TABLE                                      ; $5B92
._00 dw func_018_5B9D                             ; $5B93
._01 dw func_018_5BB4                             ; $5B95
._02 dw func_018_5BD0                             ; $5B97
._03 dw func_018_5C07                             ; $5B99
._04 dw func_018_5C39                             ; $5B9B

func_018_5B9D::
    ld   a, [wLinkMotionState]                    ; $5B9D: $FA $1C $C1
    cp   $03                                      ; $5BA0: $FE $03
    ret  z                                        ; $5BA2: $C8

    ld   a, $40                                   ; $5BA3: $3E $40
    ld   [wD468], a                               ; $5BA5: $EA $68 $D4
    ld   a, $0F                                   ; $5BA8: $3E $0F
    ldh  [hFFA5], a                               ; $5BAA: $E0 $A5
    ld   a, $01                                   ; $5BAC: $3E $01
    call SetEntitySpriteVariant                   ; $5BAE: $CD $0C $3B
    jp   IncrementEntityState                     ; $5BB1: $C3 $12 $3B

func_018_5BB4::
    ld   a, [wD468]                               ; $5BB4: $FA $68 $D4
    and  a                                        ; $5BB7: $A7
    ret  nz                                       ; $5BB8: $C0

    ld   a, $18                                   ; $5BB9: $3E $18
    ld   [wD468], a                               ; $5BBB: $EA $68 $D4
    ld   hl, wEntitiesDirectionTable              ; $5BBE: $21 $80 $C3
    add  hl, bc                                   ; $5BC1: $09
    ld   [hl], $01                                ; $5BC2: $36 $01
    ld   a, $04                                   ; $5BC4: $3E $04
    call SetEntitySpriteVariant                   ; $5BC6: $CD $0C $3B
    ld   a, $10                                   ; $5BC9: $3E $10
    ldh  [hFFA5], a                               ; $5BCB: $E0 $A5
    jp   IncrementEntityState                     ; $5BCD: $C3 $12 $3B

func_018_5BD0::
    ld   a, [wD468]                               ; $5BD0: $FA $68 $D4
    and  a                                        ; $5BD3: $A7
    ret  nz                                       ; $5BD4: $C0

    ld   hl, wEntitiesSpeedXTable                 ; $5BD5: $21 $40 $C2
    add  hl, bc                                   ; $5BD8: $09
    ld   [hl], $F4                                ; $5BD9: $36 $F4
    call AddEntitySpeedToPos_18                   ; $5BDB: $CD $6C $7E
    ldh  a, [hFrameCounter]                       ; $5BDE: $F0 $E7
    and  $08                                      ; $5BE0: $E6 $08
    ld   e, $04                                   ; $5BE2: $1E $04
    jr   z, jr_018_5BE7                           ; $5BE4: $28 $01

    inc  e                                        ; $5BE6: $1C

jr_018_5BE7:
    ld   a, e                                     ; $5BE7: $7B
    call SetEntitySpriteVariant                   ; $5BE8: $CD $0C $3B
    call func_018_7EB2                            ; $5BEB: $CD $B2 $7E
    add  $02                                      ; $5BEE: $C6 $02
    cp   $04                                      ; $5BF0: $FE $04
    ret  nc                                       ; $5BF2: $D0

    ld   hl, wEntitiesSpriteVariantTable          ; $5BF3: $21 $B0 $C3
    add  hl, bc                                   ; $5BF6: $09
    ld   [hl], $02                                ; $5BF7: $36 $02
    ld   hl, wEntitiesDirectionTable              ; $5BF9: $21 $80 $C3
    add  hl, bc                                   ; $5BFC: $09
    ld   [hl], $02                                ; $5BFD: $36 $02
    ld   a, $10                                   ; $5BFF: $3E $10
    ld   [wD468], a                               ; $5C01: $EA $68 $D4
    jp   IncrementEntityState                     ; $5C04: $C3 $12 $3B

func_018_5C07::
    ld   a, [wD468]                               ; $5C07: $FA $68 $D4
    and  a                                        ; $5C0A: $A7
    ret  nz                                       ; $5C0B: $C0

    ld   a, [$DB10]                               ; $5C0C: $FA $10 $DB
    dec  a                                        ; $5C0F: $3D
    ld   e, a                                     ; $5C10: $5F
    ld   a, [wIsOnLowHeath]                               ; $5C11: $FA $63 $C1
    cp   e                                        ; $5C14: $BB
    jr   z, jr_018_5C27                           ; $5C15: $28 $10

    and  a                                        ; $5C17: $A7
    jr   z, jr_018_5C27                           ; $5C18: $28 $0D

    ld   e, $1C                                   ; $5C1A: $1E $1C
    call GetRandomByte                            ; $5C1C: $CD $0D $28
    and  $3F                                      ; $5C1F: $E6 $3F
    jr   nz, jr_018_5C32                          ; $5C21: $20 $0F

    ld   e, $1E                                   ; $5C23: $1E $1E
    jr   jr_018_5C32                              ; $5C25: $18 $0B

jr_018_5C27:
    ld   e, $1B                                   ; $5C27: $1E $1B
    ld   a, [$DB47]                               ; $5C29: $FA $47 $DB
    cp   $80                                      ; $5C2C: $FE $80
    jr   nc, jr_018_5C32                          ; $5C2E: $30 $02

    ld   e, $1D                                   ; $5C30: $1E $1D

jr_018_5C32:
    ld   a, e                                     ; $5C32: $7B
    call OpenDialogInTable2                       ; $5C33: $CD $7C $23
    jp   IncrementEntityState                     ; $5C36: $C3 $12 $3B

func_018_5C39::
    xor  a                                        ; $5C39: $AF
    ld   [$DB10], a                               ; $5C3A: $EA $10 $DB
    ld   [wC167], a                               ; $5C3D: $EA $67 $C1
    call IncrementEntityState                     ; $5C40: $CD $12 $3B
    ld   [hl], b                                  ; $5C43: $70
    ld   hl, wEntitiesUnknowTableY                ; $5C44: $21 $D0 $C3
    add  hl, bc                                   ; $5C47: $09
    ld   [hl], $FF                                ; $5C48: $36 $FF
    ldh  a, [hActiveEntityPosX]                   ; $5C4A: $F0 $EE
    ld   hl, $D155                                ; $5C4C: $21 $55 $D1
    call func_018_5C63                            ; $5C4F: $CD $63 $5C
    ld   hl, $D175                                ; $5C52: $21 $75 $D1
    ldh  a, [hActiveEntityVisualPosY]             ; $5C55: $F0 $EC
    ld   e, $10                                   ; $5C57: $1E $10

jr_018_5C59:
    ld   [hl+], a                                 ; $5C59: $22
    dec  a                                        ; $5C5A: $3D
    dec  e                                        ; $5C5B: $1D
    jr   nz, jr_018_5C59                          ; $5C5C: $20 $FB

    ld   a, $02                                   ; $5C5E: $3E $02
    ld   hl, wD1B5                                ; $5C60: $21 $B5 $D1

func_018_5C63::
    ld   e, $10                                   ; $5C63: $1E $10

jr_018_5C65:
    ld   [hl+], a                                 ; $5C65: $22
    dec  e                                        ; $5C66: $1D
    jr   nz, jr_018_5C65                          ; $5C67: $20 $FC

    ret                                           ; $5C69: $C9

label_018_5C6A:
    ld   a, [wTransitionSequenceCounter]          ; $5C6A: $FA $6B $C1
    cp   $04                                      ; $5C6D: $FE $04
    ret  nz                                       ; $5C6F: $C0

    ldh  a, [hMapRoom]                            ; $5C70: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $5C72: $21 $E0 $C3
    add  hl, bc                                   ; $5C75: $09
    ld   [hl], a                                  ; $5C76: $77
    ld   hl, wEntitiesPosXSignTable               ; $5C77: $21 $20 $C2
    add  hl, bc                                   ; $5C7A: $09
    ld   [hl], b                                  ; $5C7B: $70
    ld   hl, wEntitiesPosYSignTable               ; $5C7C: $21 $30 $C2
    add  hl, bc                                   ; $5C7F: $09
    ld   [hl], b                                  ; $5C80: $70
    ld   hl, wEntitiesDirectionTable              ; $5C81: $21 $80 $C3
    add  hl, bc                                   ; $5C84: $09
    ld   e, [hl]                                  ; $5C85: $5E
    ld   d, b                                     ; $5C86: $50
    ld   hl, Data_018_59E4                        ; $5C87: $21 $E4 $59
    add  hl, de                                   ; $5C8A: $19
    push hl                                       ; $5C8B: $E5
    ld   a, [wConsecutiveStepsCount]              ; $5C8C: $FA $20 $C1
    rra                                           ; $5C8F: $1F
    rra                                           ; $5C90: $1F
    rra                                           ; $5C91: $1F
    pop  hl                                       ; $5C92: $E1
    and  $01                                      ; $5C93: $E6 $01
    or   [hl]                                     ; $5C95: $B6
    call SetEntitySpriteVariant                   ; $5C96: $CD $0C $3B
    ld   hl, wEntitiesUnknowTableY                ; $5C99: $21 $D0 $C3
    add  hl, bc                                   ; $5C9C: $09
    ld   a, [hl]                                  ; $5C9D: $7E
    ldh  [hMultiPurposeG], a                               ; $5C9E: $E0 $E8
    and  $0F                                      ; $5CA0: $E6 $0F
    ld   e, a                                     ; $5CA2: $5F
    ld   d, b                                     ; $5CA3: $50
    ld   hl, $D155                                ; $5CA4: $21 $55 $D1
    add  hl, de                                   ; $5CA7: $19
    ldh  a, [hLinkFinalPositionX]                 ; $5CA8: $F0 $9F
    ld   [hl], a                                  ; $5CAA: $77
    ldh  a, [hLinkFinalPositionY]                 ; $5CAB: $F0 $A0
    ld   hl, wC13B                                ; $5CAD: $21 $3B $C1
    add  [hl]                                     ; $5CB0: $86
    ld   hl, $D175                                ; $5CB1: $21 $75 $D1
    add  hl, de                                   ; $5CB4: $19
    ld   [hl], a                                  ; $5CB5: $77
    ld   hl, wD1B5                                ; $5CB6: $21 $B5 $D1
    add  hl, de                                   ; $5CB9: $19
    ldh  a, [hLinkDirection]                      ; $5CBA: $F0 $9E
    ld   [hl], a                                  ; $5CBC: $77
    ld   hl, wEntitiesPrivateState1Table          ; $5CBD: $21 $B0 $C2
    add  hl, bc                                   ; $5CC0: $09
    ld   a, [hl]                                  ; $5CC1: $7E
    ldh  [hMultiPurposeH], a                               ; $5CC2: $E0 $E9
    and  $0F                                      ; $5CC4: $E6 $0F
    ld   e, a                                     ; $5CC6: $5F
    ld   d, b                                     ; $5CC7: $50
    ld   hl, $D195                                ; $5CC8: $21 $95 $D1
    add  hl, de                                   ; $5CCB: $19
    ldh  a, [hLinkPositionZ]                      ; $5CCC: $F0 $A2
    ld   [hl], a                                  ; $5CCE: $77
    ld   a, [wLinkMotionState]                    ; $5CCF: $FA $1C $C1
    cp   $02                                      ; $5CD2: $FE $02
    jr   z, jr_018_5CEA                           ; $5CD4: $28 $14

    ld   a, [wRoomTransitionState]                ; $5CD6: $FA $24 $C1
    and  a                                        ; $5CD9: $A7
    jr   nz, jr_018_5CEA                          ; $5CDA: $20 $0E

    ld   a, [wDialogState]                        ; $5CDC: $FA $9F $C1
    and  a                                        ; $5CDF: $A7
    jr   nz, jr_018_5CEF                          ; $5CE0: $20 $0D

    ld   hl, hLinkSpeedX                          ; $5CE2: $21 $9A $FF
    ldh  a, [hLinkSpeedY]                         ; $5CE5: $F0 $9B
    or   [hl]                                     ; $5CE7: $B6
    jr   z, jr_018_5CEF                           ; $5CE8: $28 $05

jr_018_5CEA:
    ld   hl, wEntitiesUnknowTableY                ; $5CEA: $21 $D0 $C3
    add  hl, bc                                   ; $5CED: $09
    inc  [hl]                                     ; $5CEE: $34

jr_018_5CEF:
    ld   hl, wEntitiesPrivateState1Table          ; $5CEF: $21 $B0 $C2
    add  hl, bc                                   ; $5CF2: $09
    inc  [hl]                                     ; $5CF3: $34
    ldh  a, [hMultiPurposeG]                               ; $5CF4: $F0 $E8
    inc  a                                        ; $5CF6: $3C
    and  $0F                                      ; $5CF7: $E6 $0F
    ld   e, a                                     ; $5CF9: $5F
    ld   d, b                                     ; $5CFA: $50
    ld   hl, $D155                                ; $5CFB: $21 $55 $D1
    add  hl, de                                   ; $5CFE: $19
    ld   a, [hl]                                  ; $5CFF: $7E
    ld   hl, wEntitiesPosXTable                   ; $5D00: $21 $00 $C2
    add  hl, bc                                   ; $5D03: $09
    ld   [hl], a                                  ; $5D04: $77
    ld   hl, $D175                                ; $5D05: $21 $75 $D1
    add  hl, de                                   ; $5D08: $19
    ld   a, [hl]                                  ; $5D09: $7E
    ld   hl, wEntitiesPosYTable                   ; $5D0A: $21 $10 $C2
    add  hl, bc                                   ; $5D0D: $09
    ld   [hl], a                                  ; $5D0E: $77
    ld   hl, wD1B5                                ; $5D0F: $21 $B5 $D1
    add  hl, de                                   ; $5D12: $19
    ld   a, [hl]                                  ; $5D13: $7E
    ld   hl, wEntitiesDirectionTable              ; $5D14: $21 $80 $C3
    add  hl, bc                                   ; $5D17: $09
    ld   [hl], a                                  ; $5D18: $77
    ldh  a, [hMultiPurposeH]                               ; $5D19: $F0 $E9
    inc  a                                        ; $5D1B: $3C
    and  $0F                                      ; $5D1C: $E6 $0F
    ld   e, a                                     ; $5D1E: $5F
    ld   d, b                                     ; $5D1F: $50
    ld   hl, wEntitiesPosZTable                   ; $5D20: $21 $10 $C3
    add  hl, bc                                   ; $5D23: $09
    ld   a, [hl]                                  ; $5D24: $7E
    push af                                       ; $5D25: $F5
    ld   hl, $D195                                ; $5D26: $21 $95 $D1
    add  hl, de                                   ; $5D29: $19
    ld   e, [hl]                                  ; $5D2A: $5E
    ld   hl, wEntitiesPosZTable                   ; $5D2B: $21 $10 $C3
    add  hl, bc                                   ; $5D2E: $09
    ld   [hl], e                                  ; $5D2F: $73
    call GetEntityPrivateCountdown1               ; $5D30: $CD $00 $0C
    ld   hl, wRoomTransitionState                 ; $5D33: $21 $24 $C1
    or   [hl]                                     ; $5D36: $B6
    jr   nz, jr_018_5D7D                          ; $5D37: $20 $44

    pop  af                                       ; $5D39: $F1
    cp   e                                        ; $5D3A: $BB
    jr   z, jr_018_5D7A                           ; $5D3B: $28 $3D

    and  a                                        ; $5D3D: $A7
    jr   z, jr_018_5D6F                           ; $5D3E: $28 $2F

    ld   a, e                                     ; $5D40: $7B
    and  a                                        ; $5D41: $A7
    jr   nz, jr_018_5D7A                          ; $5D42: $20 $36

    call label_3B23                               ; $5D44: $CD $23 $3B
    ld   hl, wEntitiesStatusTable                 ; $5D47: $21 $80 $C2
    add  hl, bc                                   ; $5D4A: $09
    ld   a, [hl]                                  ; $5D4B: $7E
    cp   $02                                      ; $5D4C: $FE $02
    ret  z                                        ; $5D4E: $C8

    ld   hl, wEntitiesUnknowTableI                ; $5D4F: $21 $70 $C4
    add  hl, bc                                   ; $5D52: $09
    ld   a, [hl]                                  ; $5D53: $7E
    dec  a                                        ; $5D54: $3D
    cp   $02                                      ; $5D55: $FE $02
    jr   c, jr_018_5D5E                           ; $5D57: $38 $05

    ld   a, $07                                   ; $5D59: $3E $07
    ldh  [hNoiseSfx], a                           ; $5D5B: $E0 $F4
    ret                                           ; $5D5D: $C9

jr_018_5D5E:
    ldh  a, [hActiveEntityVisualPosY]             ; $5D5E: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $5D60: $E0 $D8
    ldh  a, [hActiveEntityPosX]                   ; $5D62: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $5D64: $E0 $D7
    ld   a, JINGLE_WATER_DIVE                     ; $5D66: $3E $0E
    ldh  [hJingle], a                             ; $5D68: $E0 $F2
    ld   a, TRANSCIENT_VFX_PEGASUS_SPLASH         ; $5D6A: $3E $0C
    jp   AddTranscientVfx                         ; $5D6C: $C3 $C7 $0C

jr_018_5D6F:
    ld   a, e                                     ; $5D6F: $7B
    cp   $08                                      ; $5D70: $FE $08
    ld   a, JINGLE_JUMP_DOWN                      ; $5D72: $3E $08
    jr   nc, jr_018_5D78                          ; $5D74: $30 $02

    ld   a, JINGLE_JUMP                           ; $5D76: $3E $24

jr_018_5D78:
    ldh  [hJingle], a                             ; $5D78: $E0 $F2

jr_018_5D7A:
    jp   label_3B23                               ; $5D7A: $C3 $23 $3B

jr_018_5D7D:
    pop  af                                       ; $5D7D: $F1
    ret                                           ; $5D7E: $C9

Data_018_5D7F::
    db   $00, $01, $FF

Data_018_5D82::
    db   $00, $10, $F0

TextDebuggerEntityHandler::                       ; POI: Text debugging tool
    call func_018_7DE8                            ; $5D85: $CD $E8 $7D
    ld   a, $01                                   ; $5D88: $3E $01
    ldh  [hAnimatedTilesGroup], a                 ; $5D8A: $E0 $A4
    inc  a                                        ; $5D8C: $3C
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5D8D: $E0 $A1
    ld   [wC167], a                               ; $5D8F: $EA $67 $C1
    ldh  a, [hJoypadState]                        ; $5D92: $F0 $CC
    and  J_RIGHT | J_LEFT                         ; $5D94: $E6 $03
    ld   e, a                                     ; $5D96: $5F
    ld   d, b                                     ; $5D97: $50
    ld   hl, Data_018_5D7F                        ; $5D98: $21 $7F $5D
    add  hl, de                                   ; $5D9B: $19
    ld   a, [wC109]                               ; $5D9C: $FA $09 $C1
    push af                                       ; $5D9F: $F5
    add  [hl]                                     ; $5DA0: $86
    and  $0F                                      ; $5DA1: $E6 $0F
    ld   e, a                                     ; $5DA3: $5F
    pop  af                                       ; $5DA4: $F1
    and  $F0                                      ; $5DA5: $E6 $F0
    or   e                                        ; $5DA7: $B3
    ld   [wC109], a                               ; $5DA8: $EA $09 $C1
    ldh  a, [hJoypadState]                        ; $5DAB: $F0 $CC
    rra                                           ; $5DAD: $1F
    rra                                           ; $5DAE: $1F
    and  (J_UP | J_DOWN) >> 2                     ; $5DAF: $E6 $03
    ld   e, a                                     ; $5DB1: $5F
    ld   d, b                                     ; $5DB2: $50
    ld   hl, Data_018_5D82                        ; $5DB3: $21 $82 $5D
    add  hl, de                                   ; $5DB6: $19
    ld   a, [wC109]                               ; $5DB7: $FA $09 $C1
    add  [hl]                                     ; $5DBA: $86
    ld   [wC109], a                               ; $5DBB: $EA $09 $C1
    ld   a, [wDialogState]                        ; $5DBE: $FA $9F $C1
    and  a                                        ; $5DC1: $A7
    jr   nz, jr_018_5DDC                          ; $5DC2: $20 $18

    ldh  a, [hJoypadState]                        ; $5DC4: $F0 $CC
    and  J_A                                      ; $5DC6: $E6 $10
    jr   z, jr_018_5DD0                           ; $5DC8: $28 $06

    ld   a, [wC109]                               ; $5DCA: $FA $09 $C1
    jp   OpenDialog                               ; $5DCD: $C3 $85 $23

jr_018_5DD0:
    ldh  a, [hJoypadState]                        ; $5DD0: $F0 $CC
    and  J_B                                      ; $5DD2: $E6 $20
    jr   z, jr_018_5DDC                           ; $5DD4: $28 $06

    ld   a, [wC109]                               ; $5DD6: $FA $09 $C1
    jp   OpenDialogInTable1                       ; $5DD9: $C3 $73 $23

jr_018_5DDC:
    ldh  a, [hJoypadState]                        ; $5DDC: $F0 $CC
    and  J_SELECT                                 ; $5DDE: $E6 $40
    jr   z, jr_018_5DE8                           ; $5DE0: $28 $06

    ld   a, [wC109]                               ; $5DE2: $FA $09 $C1
    jp   OpenDialogInTable2                       ; $5DE5: $C3 $7C $23

jr_018_5DE8:
    ret                                           ; $5DE8: $C9

SouthFaceShrineDoorEntityHandler::
    call func_018_7DE8                            ; $5DE9: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $5DEC: $F0 $E7
    and  $03                                      ; $5DEE: $E6 $03
    jr   nz, jr_018_5DF6                          ; $5DF0: $20 $04

    ld   hl, wScrollXOffset                       ; $5DF2: $21 $BF $C1
    inc  [hl]                                     ; $5DF5: $34

jr_018_5DF6:
    ret                                           ; $5DF6: $C9

Data_018_5DF7::
    db   $5E, $01, $5E, $21

Data_018_5DFB::
    db   $00, $F8, $50, $06, $00, $00, $52, $06, $00, $08, $54, $06, $00, $10, $56, $06

Data_018_5E0B::
    db   $00, $F8, $50, $03, $00, $00, $52, $03, $00, $08, $54, $03, $00, $10, $56, $03

OwlStatueSouthFaceShrine:
    ld   hl, Data_018_5DFB                        ; $5E1B: $21 $FB $5D
    ld   a, [wBGPaletteEffectAddress]             ; $5E1E: $FA $CC $C3
    and  a                                        ; $5E21: $A7
    jr   nz, jr_018_5E27                          ; $5E22: $20 $03

    ld   hl, Data_018_5E0B                        ; $5E24: $21 $0B $5E

jr_018_5E27:
    ld   c, $04                                   ; $5E27: $0E $04
    call RenderActiveEntitySpritesRect            ; $5E29: $CD $E6 $3C
    ld   a, $02                                   ; $5E2C: $3E $02
    call label_3DA0                               ; $5E2E: $CD $A0 $3D
    ldh  a, [hActiveEntityState]                  ; $5E31: $F0 $F0
    JP_TABLE                                      ; $5E33
._00 dw func_018_5E3A                             ; $5E34
._01 dw func_018_5E43                             ; $5E36
._02 dw func_018_5E5D                             ; $5E38

func_018_5E3A::
    ld   hl, wEntitiesPosXTable                   ; $5E3A: $21 $00 $C2
    add  hl, bc                                   ; $5E3D: $09
    ld   [hl], $50                                ; $5E3E: $36 $50
    jp   IncrementEntityState                     ; $5E40: $C3 $12 $3B

func_018_5E43::
    call func_018_7DE8                            ; $5E43: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $5E46: $CD $05 $0C
    ret  nz                                       ; $5E49: $C0

    call func_018_7D95                            ; $5E4A: $CD $95 $7D
    ret  nc                                       ; $5E4D: $D0

    ld   a, [wBGPalette]                          ; $5E4E: $FA $97 $DB
    cp   $E4                                      ; $5E51: $FE $E4
    jr   nz, jr_018_5E58                          ; $5E53: $20 $03

    jp   IncrementEntityState                     ; $5E55: $C3 $12 $3B

jr_018_5E58:
    jp_open_dialog $0E6                           ; $5E58

func_018_5E5D::
    call func_018_7DE8                            ; $5E5D: $CD $E8 $7D
    ld   a, [wDialogState]                        ; $5E60: $FA $9F $C1
    and  a                                        ; $5E63: $A7
    jr   nz, jr_018_5E79                          ; $5E64: $20 $13

    ld   a, GAMEPLAY_WF_MURAL                     ; $5E66: $3E $0A
    call func_018_4CB0                            ; $5E68: $CD $B0 $4C
    call GetEntityTransitionCountdown             ; $5E6B: $CD $05 $0C
    ld   [hl], $20                                ; $5E6E: $36 $20
    call IncrementEntityState                     ; $5E70: $CD $12 $3B
    ld   [hl], b                                  ; $5E73: $70
    ld   hl, wOverworldRoomStatus + $AC           ; $5E74: $21 $AC $D8
    set  4, [hl]                                  ; $5E77: $CB $E6

jr_018_5E79:
    ret                                           ; $5E79: $C9

OwlStatueEntityHandler::
    ldh  a, [hMapId]                              ; $5E7A: $F0 $F7
    cp   MAP_S_FACE_SHRINE                        ; $5E7C: $FE $16
    jp   z, OwlStatueSouthFaceShrine              ; $5E7E: $CA $1B $5E

IF __PATCH_0__
    ld   hl, hActiveEntityVisualPosY
    inc  [hl]
ELSE
    ldh  a, [hActiveEntityVisualPosY]             ; $5E81: $F0 $EC
    add  $01                                      ; $5E83: $C6 $01
    ldh  [hActiveEntityVisualPosY], a             ; $5E85: $E0 $EC
ENDC
    ld   de, Data_018_5DF7                        ; $5E87: $11 $F7 $5D
    call RenderActiveEntitySpritesPair            ; $5E8A: $CD $C0 $3B

IF __PATCH_0__
    call func_018_7DE8
    call func_018_7D36
ELSE
    call func_018_7D36                            ; $5E8D: $CD $36 $7D
    call func_018_7DE8                            ; $5E90: $CD $E8 $7D
ENDC

    call func_018_7D95                            ; $5E93: $CD $95 $7D
    ret  nc                                       ; $5E96: $D0

    ld   a, [wHasDungeonStoneSlab]                ; $5E97: $FA $CE $DB
    and  a                                        ; $5E9A: $A7
    ld   a, $10                                   ; $5E9B: $3E $10
    jr   nz, jr_018_5EA2                          ; $5E9D: $20 $03

    jp   OpenDialogInTable1                       ; $5E9F: $C3 $73 $23

jr_018_5EA2:
    ldh  a, [hMapId]                              ; $5EA2: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5EA4: $FE $FF
    jr   nz, jr_018_5EAD                          ; $5EA6: $20 $05

    jp_open_dialog $263                           ; $5EA8

jr_018_5EAD:
    ld   a, $18                                   ; $5EAD: $3E $18
    call func_036_4A4C_trampoline                 ; $5EAF: $CD $EA $0A
    ldh  a, [hMultiPurpose0]                      ; $5EB2: $F0 $D7
    jp   OpenDialogInTable2                       ; $5EB4: $C3 $7C $23

Data_018_5EB7::
    db   $60, $01, $62, $01, $62, $21, $60, $21, $64, $01, $66, $01, $66, $21, $64, $21
    db   $68, $01, $6A, $01, $6C, $01, $6E, $01, $6A, $21, $68, $21, $6E, $21, $6C, $21

MarinAtTalTalHeightsEntityHandler::
    ld   a, [wHasInstrument7]                     ; $5ED7: $FA $6B $DB
    and  $02                                      ; $5EDA: $E6 $02
    jp   z, ClearEntityStatusBank18               ; $5EDC: $CA $08 $7F

    ld   a, [wIsRoosterFollowingLink]             ; $5EDF: $FA $7B $DB
    and  a                                        ; $5EE2: $A7
    jp   nz, ClearEntityStatusBank18              ; $5EE3: $C2 $08 $7F

    ldh  a, [hRoomStatus]                         ; $5EE6: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $5EE8: $E6 $10
    jp   nz, ClearEntityStatusBank18              ; $5EEA: $C2 $08 $7F

    ld   hl, wEntitiesPrivateState2Table          ; $5EED: $21 $C0 $C2
    add  hl, bc                                   ; $5EF0: $09
    ld   a, [hl]                                  ; $5EF1: $7E
    and  a                                        ; $5EF2: $A7
    jp   nz, label_018_60F5                       ; $5EF3: $C2 $F5 $60

    ld   a, c                                     ; $5EF6: $79
    ld   [wC50F], a                               ; $5EF7: $EA $0F $C5
    ld   de, Data_018_5EB7                        ; $5EFA: $11 $B7 $5E
    call RenderActiveEntitySpritesPair            ; $5EFD: $CD $C0 $3B
    call func_018_7D60                            ; $5F00: $CD $60 $7D
    call AddEntityZSpeedToPos_18                  ; $5F03: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $5F06: $21 $20 $C3
    add  hl, bc                                   ; $5F09: $09
    dec  [hl]                                     ; $5F0A: $35
    dec  [hl]                                     ; $5F0B: $35
    ld   hl, wEntitiesPosZTable                   ; $5F0C: $21 $10 $C3
    add  hl, bc                                   ; $5F0F: $09
    ld   a, [hl]                                  ; $5F10: $7E
    and  a                                        ; $5F11: $A7
    ldh  [hMultiPurposeG], a                               ; $5F12: $E0 $E8
    jr   z, jr_018_5F1A                           ; $5F14: $28 $04

    and  $80                                      ; $5F16: $E6 $80
    jr   z, jr_018_5F20                           ; $5F18: $28 $06

jr_018_5F1A:
    ld   [hl], b                                  ; $5F1A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5F1B: $21 $20 $C3
    add  hl, bc                                   ; $5F1E: $09
    ld   [hl], b                                  ; $5F1F: $70

jr_018_5F20:
    ldh  a, [hActiveEntityState]                  ; $5F20: $F0 $F0
    JP_TABLE                                      ; $5F22
._00 dw MarinAtTalTalHeightsState0Handler
._01 dw MarinAtTalTalHeightsState1Handler
._02 dw MarinAtTalTalHeightsState2Handler
._03 dw MarinAtTalTalHeightsState3Handler
._04 dw MarinAtTalTalHeightsState4Handler
._05 dw MarinAtTalTalHeightsState5Handler
._06 dw MarinAtTalTalHeightsState6Handler
._07 dw MarinAtTalTalHeightsState7Handler
._08 dw MarinAtTalTalHeightsState8Handler
._09 dw MarinAtTalTalHeightsState9Handler
._0A dw MarinAtTalTalHeightsStateAHandler
._0B dw MarinAtTalTalHeightsStateBHandler
._0C dw MarinAtTalTalHeightsStateCHandler

func_018_5F3D::
    ld   hl, wEntitiesUnknowTableY                ; $5F3D: $21 $D0 $C3
    add  hl, bc                                   ; $5F40: $09
    ld   [hl], b                                  ; $5F41: $70
    ret                                           ; $5F42: $C9

MarinAtTalTalHeightsState0Handler::
    call func_018_5F5E                            ; $5F43: $CD $5E $5F
    call func_018_7DE8                            ; $5F46: $CD $E8 $7D
    call func_018_7EB2                            ; $5F49: $CD $B2 $7E
    ld   hl, wEntitiesDirectionTable              ; $5F4C: $21 $80 $C3
    add  hl, bc                                   ; $5F4F: $09
    ld   [hl], e                                  ; $5F50: $73
    ldh  a, [hLinkPositionX]                      ; $5F51: $F0 $98
    cp   $90                                      ; $5F53: $FE $90
    ret  nc                                       ; $5F55: $D0

    call_open_dialog $235                         ; $5F56
    jp   IncrementEntityState                     ; $5F5B: $C3 $12 $3B

func_018_5F5E::
    ldh  a, [hMultiPurposeG]                               ; $5F5E: $F0 $E8
    and  a                                        ; $5F60: $A7
    jr   z, jr_018_5F66                           ; $5F61: $28 $03

    and  $80                                      ; $5F63: $E6 $80
    ret  z                                        ; $5F65: $C8

jr_018_5F66:
    ldh  a, [hFrameCounter]                       ; $5F66: $F0 $E7
    and  $3F                                      ; $5F68: $E6 $3F
    jr   nz, jr_018_5F72                          ; $5F6A: $20 $06

    ld   hl, wEntitiesSpeedZTable                 ; $5F6C: $21 $20 $C3
    add  hl, bc                                   ; $5F6F: $09
    ld   [hl], $10                                ; $5F70: $36 $10

jr_018_5F72:
    ret                                           ; $5F72: $C9

MarinAtTalTalHeightsState1Handler::
    call func_018_5F5E                            ; $5F73: $CD $5E $5F
    call func_018_7DE8                            ; $5F76: $CD $E8 $7D
    call_open_dialog $236                         ; $5F79
    jp   IncrementEntityState                     ; $5F7E: $C3 $12 $3B

MarinAtTalTalHeightsState2Handler::
    call func_018_5F5E                            ; $5F81: $CD $5E $5F
    call func_018_7DE8                            ; $5F84: $CD $E8 $7D
    call func_018_7EB2                            ; $5F87: $CD $B2 $7E
    add  $08                                      ; $5F8A: $C6 $08
    cp   $10                                      ; $5F8C: $FE $10
    ret  nc                                       ; $5F8E: $D0

    call func_018_7EC2                            ; $5F8F: $CD $C2 $7E
    add  $10                                      ; $5F92: $C6 $10
    cp   $20                                      ; $5F94: $FE $20
    ret  nc                                       ; $5F96: $D0

    jp   IncrementEntityState                     ; $5F97: $C3 $12 $3B

MarinAtTalTalHeightsState3Handler::
    call func_018_5F3D                            ; $5F9A: $CD $3D $5F
    call func_018_7DE8                            ; $5F9D: $CD $E8 $7D
    call func_018_7EB2                            ; $5FA0: $CD $B2 $7E
    ld   hl, wEntitiesDirectionTable              ; $5FA3: $21 $80 $C3
    add  hl, bc                                   ; $5FA6: $09
    ld   [hl], e                                  ; $5FA7: $73
    ld   a, [wC1A4]                               ; $5FA8: $FA $A4 $C1
    and  a                                        ; $5FAB: $A7
    jr   z, jr_018_5FBF                           ; $5FAC: $28 $11

    ldh  a, [hLinkPositionX]                      ; $5FAE: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $5FB0: $21 $00 $C2
    add  hl, bc                                   ; $5FB3: $09
    add  $10                                      ; $5FB4: $C6 $10
    ld   [hl], a                                  ; $5FB6: $77
    ldh  a, [hLinkPositionY]                      ; $5FB7: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $5FB9: $21 $10 $C2
    add  hl, bc                                   ; $5FBC: $09
    ld   [hl], a                                  ; $5FBD: $77
    ret                                           ; $5FBE: $C9

jr_018_5FBF:
    xor  a                                        ; $5FBF: $AF
    ld   [wC19B], a                               ; $5FC0: $EA $9B $C1
    call GetEntityTransitionCountdown             ; $5FC3: $CD $05 $0C
    ld   [hl], $10                                ; $5FC6: $36 $10
    jp   IncrementEntityState                     ; $5FC8: $C3 $12 $3B

MarinAtTalTalHeightsState4Handler::
    call func_018_5F3D                            ; $5FCB: $CD $3D $5F
    call func_018_7DE8                            ; $5FCE: $CD $E8 $7D
    ld   a, $02                                   ; $5FD1: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5FD3: $E0 $A1
    ld   [wC167], a                               ; $5FD5: $EA $67 $C1
    ld   a, $00                                   ; $5FD8: $3E $00
    ldh  [hLinkDirection], a                      ; $5FDA: $E0 $9E
    push bc                                       ; $5FDC: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $5FDD: $CD $F0 $0B
    pop  bc                                       ; $5FE0: $C1
    call GetEntityTransitionCountdown             ; $5FE1: $CD $05 $0C
    ret  nz                                       ; $5FE4: $C0

    call_open_dialog $237                         ; $5FE5
    jp   IncrementEntityState                     ; $5FEA: $C3 $12 $3B

MarinAtTalTalHeightsState5Handler::
    call func_018_5F3D                            ; $5FED: $CD $3D $5F
    call func_018_7DE8                            ; $5FF0: $CD $E8 $7D
    ld   a, $02                                   ; $5FF3: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5FF5: $E0 $A1
    call_open_dialog $238                         ; $5FF7
    jp   IncrementEntityState                     ; $5FFC: $C3 $12 $3B

MarinAtTalTalHeightsState6Handler::
    call func_018_5F3D                            ; $5FFF: $CD $3D $5F
    ld   a, $02                                   ; $6002: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6004: $E0 $A1
    call func_018_7DE8                            ; $6006: $CD $E8 $7D
    call_open_dialog $239                         ; $6009
    ld   hl, wEntitiesPrivateState1Table          ; $600E: $21 $B0 $C2
    add  hl, bc                                   ; $6011: $09
    ld   [hl], b                                  ; $6012: $70
    jp   IncrementEntityState                     ; $6013: $C3 $12 $3B

MarinAtTalTalHeightsState7Handler::
    call func_018_5F3D                            ; $6016: $CD $3D $5F
    ld   a, $02                                   ; $6019: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $601B: $E0 $A1
    call func_018_7DE8                            ; $601D: $CD $E8 $7D
    ld   hl, wEntitiesPrivateState1Table          ; $6020: $21 $B0 $C2
    add  hl, bc                                   ; $6023: $09
    inc  [hl]                                     ; $6024: $34
    ld   a, [hl]                                  ; $6025: $7E
    cp   $A0                                      ; $6026: $FE $A0
    ret  nz                                       ; $6028: $C0

    jp   IncrementEntityState                     ; $6029: $C3 $12 $3B

MarinAtTalTalHeightsState8Handler::
    call func_018_5F3D                            ; $602C: $CD $3D $5F
    ld   a, $02                                   ; $602F: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6031: $E0 $A1
    call func_018_7DE8                            ; $6033: $CD $E8 $7D
    ld   a, ENTITY_MARIN_AT_TAL_TAL_HEIGHTS       ; $6036: $3E $C2
    call SpawnNewEntity_trampoline                ; $6038: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $603B: $21 $00 $C2
    add  hl, de                                   ; $603E: $19
    ld   [hl], $12                                ; $603F: $36 $12
    ld   hl, wEntitiesPosYTable                   ; $6041: $21 $10 $C2
    add  hl, de                                   ; $6044: $19
    ld   [hl], $88                                ; $6045: $36 $88
    ld   hl, wEntitiesPrivateState2Table          ; $6047: $21 $C0 $C2
    add  hl, de                                   ; $604A: $19
    inc  [hl]                                     ; $604B: $34
    jp   IncrementEntityState                     ; $604C: $C3 $12 $3B

MarinAtTalTalHeightsState9Handler::
    call func_018_5F3D                            ; $604F: $CD $3D $5F
    ld   a, $02                                   ; $6052: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6054: $E0 $A1
    ret                                           ; $6056: $C9

MarinAtTalTalHeightsStateAHandler::
    ld   a, $02                                   ; $6057: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6059: $E0 $A1
    ldh  a, [hActiveEntityVisualPosY]             ; $605B: $F0 $EC
    cp   $3E                                      ; $605D: $FE $3E
    jr   c, jr_018_6064                           ; $605F: $38 $03

    jp   IncrementEntityState                     ; $6061: $C3 $12 $3B

jr_018_6064:
    ld   hl, wEntitiesSpeedYTable                 ; $6064: $21 $50 $C2
    add  hl, bc                                   ; $6067: $09
    ld   [hl], $06                                ; $6068: $36 $06
    ld   hl, wEntitiesDirectionTable              ; $606A: $21 $80 $C3
    add  hl, bc                                   ; $606D: $09
    ld   [hl], $03                                ; $606E: $36 $03
    jp   UpdateEntityYPosWithSpeed_18             ; $6070: $C3 $62 $7E

MarinAtTalTalHeightsStateBHandler::
    ld   a, $02                                   ; $6073: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6075: $E0 $A1
    ld   hl, wEntitiesSpeedXTable                 ; $6077: $21 $40 $C2
    add  hl, bc                                   ; $607A: $09
    ld   [hl], $FA                                ; $607B: $36 $FA
    ld   hl, wEntitiesDirectionTable              ; $607D: $21 $80 $C3
    add  hl, bc                                   ; $6080: $09
    ld   [hl], $01                                ; $6081: $36 $01
    call AddEntitySpeedToPos_18                   ; $6083: $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ; $6086: $F0 $EE
    cp   $18                                      ; $6088: $FE $18
    ret  nc                                       ; $608A: $D0

    call GetEntityTransitionCountdown             ; $608B: $CD $05 $0C
    ld   [hl], $60                                ; $608E: $36 $60
    jp   IncrementEntityState                     ; $6090: $C3 $12 $3B

MarinAtTalTalHeightsStateCHandler::
    ld   a, $02                                   ; $6093: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6095: $E0 $A1
    call GetEntityTransitionCountdown             ; $6097: $CD $05 $0C
    jr   z, jr_018_60A3                           ; $609A: $28 $07

    ld   hl, wEntitiesDirectionTable              ; $609C: $21 $80 $C3
    add  hl, bc                                   ; $609F: $09
    ld   [hl], $02                                ; $60A0: $36 $02
    ret                                           ; $60A2: $C9

jr_018_60A3:
    ld   hl, wEntitiesSpeedXTable                 ; $60A3: $21 $40 $C2
    add  hl, bc                                   ; $60A6: $09
    ld   [hl], $F4                                ; $60A7: $36 $F4
    ld   hl, wEntitiesDirectionTable              ; $60A9: $21 $80 $C3
    add  hl, bc                                   ; $60AC: $09
    ld   [hl], $01                                ; $60AD: $36 $01
    call AddEntitySpeedToPos_18                   ; $60AF: $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ; $60B2: $F0 $EE
    cp   $F0                                      ; $60B4: $FE $F0
    jr   nz, jr_018_60C7                          ; $60B6: $20 $0F

    xor  a                                        ; $60B8: $AF
    ld   [wC167], a                               ; $60B9: $EA $67 $C1
IF __PATCH_0__
    ld   [$db74], a
ENDC
    ld   hl, wOverworldRoomStatus + $08                                ; $60BC: $21 $08 $D8
    set  4, [hl]                                  ; $60BF: $CB $E6
    ld   a, [hl]                                  ; $60C1: $7E
    ldh  [hRoomStatus], a                         ; $60C2: $E0 $F8
    jp   ClearEntityStatusBank18                  ; $60C4: $C3 $08 $7F

jr_018_60C7:
    call func_018_7EB2                            ; $60C7: $CD $B2 $7E
    ld   a, e                                     ; $60CA: $7B
    xor  $01                                      ; $60CB: $EE $01
    ldh  [hLinkDirection], a                      ; $60CD: $E0 $9E
    push bc                                       ; $60CF: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $60D0: $CD $F0 $0B
    pop  bc                                       ; $60D3: $C1
    ret                                           ; $60D4: $C9

Data_018_60D5::
    db   $50, $02, $52, $02, $52, $22, $50, $22, $54, $02, $56, $02, $56, $22, $54, $22
    db   $58, $02, $5A, $02, $5C, $02, $5E, $02, $5A, $22, $58, $22, $5E, $22, $5C, $22

label_018_60F5:
    ld   de, Data_018_60D5                        ; $60F5: $11 $D5 $60
    call RenderActiveEntitySpritesPair            ; $60F8: $CD $C0 $3B
    call func_018_7D60                            ; $60FB: $CD $60 $7D
    ldh  a, [hActiveEntityState]                  ; $60FE: $F0 $F0
    JP_TABLE                                      ; $6100
._00 dw func_018_6109                             ; $6101
._01 dw func_018_6139                             ; $6103
._02 dw func_018_614F                             ; $6105
._03 dw func_018_6173                             ; $6107

func_018_6109::
    ld   hl, wEntitiesDirectionTable              ; $6109: $21 $80 $C3
    add  hl, bc                                   ; $610C: $09
    ld   [hl], $02                                ; $610D: $36 $02
    ld   hl, wEntitiesSpeedYTable                 ; $610F: $21 $50 $C2
    add  hl, bc                                   ; $6112: $09
    ld   [hl], $F4                                ; $6113: $36 $F4
    call UpdateEntityYPosWithSpeed_18             ; $6115: $CD $62 $7E
    ldh  a, [hActiveEntityVisualPosY]             ; $6118: $F0 $EC
    cp   $70                                      ; $611A: $FE $70
    ret  nc                                       ; $611C: $D0

    call_open_dialog $23B                         ; $611D
    ld   a, $03                                   ; $6122: $3E $03
    ldh  [hLinkDirection], a                      ; $6124: $E0 $9E
    ld   a, [wC50F]                               ; $6126: $FA $0F $C5
    ld   e, a                                     ; $6129: $5F
    ld   d, b                                     ; $612A: $50
    ld   hl, wEntitiesDirectionTable              ; $612B: $21 $80 $C3
    add  hl, de                                   ; $612E: $19
    ld   [hl], $03                                ; $612F: $36 $03
    push bc                                       ; $6131: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $6132: $CD $F0 $0B
    pop  bc                                       ; $6135: $C1
    jp   IncrementEntityState                     ; $6136: $C3 $12 $3B

func_018_6139::
    ld   a, [wC50F]                               ; $6139: $FA $0F $C5
    ld   e, a                                     ; $613C: $5F
    ld   d, b                                     ; $613D: $50
    ld   hl, wEntitiesDirectionTable              ; $613E: $21 $80 $C3
    add  hl, de                                   ; $6141: $19
    ld   [hl], $03                                ; $6142: $36 $03
    call func_018_7DE8                            ; $6144: $CD $E8 $7D
    call_open_dialog $23A                         ; $6147
    jp   IncrementEntityState                     ; $614C: $C3 $12 $3B

func_018_614F::
    ld   a, [wC50F]                               ; $614F: $FA $0F $C5
    ld   e, a                                     ; $6152: $5F
    ld   d, b                                     ; $6153: $50
    ld   hl, wEntitiesDirectionTable              ; $6154: $21 $80 $C3
    add  hl, de                                   ; $6157: $19
    ld   [hl], $03                                ; $6158: $36 $03
    ld   a, [wDialogCharacterIndex]               ; $615A: $FA $70 $C1
    cp   $22                                      ; $615D: $FE $22
    jr   c, jr_018_6163                           ; $615F: $38 $02

    ld   [hl], $01                                ; $6161: $36 $01

jr_018_6163:
    call func_018_7DE8                            ; $6163: $CD $E8 $7D
    ld   a, [wC50F]                               ; $6166: $FA $0F $C5
    ld   e, a                                     ; $6169: $5F
    ld   d, b                                     ; $616A: $50
    ld   hl, wEntitiesStateTable                  ; $616B: $21 $90 $C2
    add  hl, de                                   ; $616E: $19
    inc  [hl]                                     ; $616F: $34
    jp   IncrementEntityState                     ; $6170: $C3 $12 $3B

func_018_6173::
    ld   hl, wEntitiesDirectionTable              ; $6173: $21 $80 $C3
    add  hl, bc                                   ; $6176: $09
    ld   [hl], $01                                ; $6177: $36 $01
    ld   hl, wEntitiesSpeedXTable                 ; $6179: $21 $40 $C2
    add  hl, bc                                   ; $617C: $09
    ld   [hl], $F8                                ; $617D: $36 $F8
    call AddEntitySpeedToPos_18                   ; $617F: $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ; $6182: $F0 $EE
    cp   $E0                                      ; $6184: $FE $E0
    ret  nz                                       ; $6186: $C0

    jp   ClearEntityStatusBank18                  ; $6187: $C3 $08 $7F

MarinAtTheShoreEntityHandler::
    ld   a, [wIsMarinFollowingLink]               ; $618A: $FA $73 $DB
    and  a                                        ; $618D: $A7
    jp   nz, label_018_59E8                       ; $618E: $C2 $E8 $59

    ld   a, [$DB74]                               ; $6191: $FA $74 $DB
    and  a                                        ; $6194: $A7
    ret  nz                                       ; $6195: $C0

    ld   a, [wOverworldRoomStatus + $FD]                               ; $6196: $FA $FD $D8
    and  $20                                      ; $6199: $E6 $20
    jp   nz, ClearEntityStatusBank18              ; $619B: $C2 $08 $7F

    ld   a, [wTradeSequenceItem]                  ; $619E: $FA $0E $DB
    cp   TRADING_ITEM_PINEAPPLE                   ; $61A1: $FE $07
    jp   c, ClearEntityStatusBank18               ; $61A3: $DA $08 $7F

    ld   de, Data_018_5EB7                        ; $61A6: $11 $B7 $5E
    call RenderActiveEntitySpritesPair            ; $61A9: $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ; $61AC: $FA $24 $C1
    and  a                                        ; $61AF: $A7
    ret  nz                                       ; $61B0: $C0

    call func_018_7D36                            ; $61B1: $CD $36 $7D
    ld   a, [wGameplayType]                       ; $61B4: $FA $95 $DB
    cp   $0B                                      ; $61B7: $FE $0B
    ret  nz                                       ; $61B9: $C0

    ld   a, [wTransitionSequenceCounter]          ; $61BA: $FA $6B $C1
    cp   $04                                      ; $61BD: $FE $04
    ret  nz                                       ; $61BF: $C0

    ldh  a, [hActiveEntityState]                  ; $61C0: $F0 $F0
    JP_TABLE                                      ; $61C2
._00 dw MarinAtTheShoreTransitionHandler
._01 dw MarinAtTheShoreState1Handler
._02 dw MarinAtTheShoreState2Handler
._03 dw MarinAtTheShoreState3Handler
._04 dw MarinAtTheShoreState4Handler
._05 dw MarinAtTheShoreState5Handler
._06 dw MarinAtTheShoreState6Handler

MarinAtTheShoreTransitionHandler::
    ld   a, MUSIC_MARIN_BEACH_TRANSITION          ; $61D1: $3E $4D
    ld   [wMusicTrackToPlay], a                   ; $61D3: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $61D6: $E0 $B0
    ldh  [hFFBD], a                               ; $61D8: $E0 $BD
    jp   IncrementEntityState                     ; $61DA: $C3 $12 $3B

MarinAtTheShoreState1Handler::
    ld   a, [wDialogState]                        ; $61DD: $FA $9F $C1
    and  a                                        ; $61E0: $A7
    ret  nz                                       ; $61E1: $C0

    call func_018_7EC2                            ; $61E2: $CD $C2 $7E
    add  $14                                      ; $61E5: $C6 $14
    cp   $28                                      ; $61E7: $FE $28
    ret  nc                                       ; $61E9: $D0

    ld   a, $01                                   ; $61EA: $3E $01
    ld   [wC167], a                               ; $61EC: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $61EF: $CD $05 $0C
    ld   [hl], $18                                ; $61F2: $36 $18
    jp   IncrementEntityState                     ; $61F4: $C3 $12 $3B

MarinAtTheShoreState2Handler::
    ld   a, [wDialogState]                        ; $61F7: $FA $9F $C1
    and  a                                        ; $61FA: $A7
    ret  nz                                       ; $61FB: $C0

    call GetEntityTransitionCountdown             ; $61FC: $CD $05 $0C
    jr   nz, jr_018_6209                          ; $61FF: $20 $08

    call_open_dialog $1D5                         ; $6201
    call IncrementEntityState                     ; $6206: $CD $12 $3B

jr_018_6209:
    ld   e, $02                                   ; $6209: $1E $02
    cp   $0C                                      ; $620B: $FE $0C
    jr   c, jr_018_6211                           ; $620D: $38 $02

    ld   e, $04                                   ; $620F: $1E $04

jr_018_6211:
    ld   a, e                                     ; $6211: $7B
    jp   SetEntitySpriteVariant                   ; $6212: $C3 $0C $3B

MarinAtTheShoreState3Handler::
    ld   a, [wDialogState]                        ; $6215: $FA $9F $C1
    and  a                                        ; $6218: $A7
    ret  nz                                       ; $6219: $C0

    call IncrementEntityState                     ; $621A: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]                               ; $621D: $FA $77 $C1
    and  a                                        ; $6220: $A7
    jr   nz, jr_018_623D                          ; $6221: $20 $1A

    ld   [hl], $06                                ; $6223: $36 $06
    xor  a                                        ; $6225: $AF
    ld   [wTransitionSequenceCounter], a          ; $6226: $EA $6B $C1
    ld   [wC16C], a                               ; $6229: $EA $6C $C1
    ld   [wActivePowerUp], a                      ; $622C: $EA $7C $D4
    ld   [wGameplaySubtype], a                    ; $622F: $EA $96 $DB
    ld   a, $09                                   ; $6232: $3E $09
    ld   [wGameplayType], a                       ; $6234: $EA $95 $DB
    ld   a, MUSIC_MARIN_BEACH                     ; $6237: $3E $4E
    ld   [wMusicTrackToPlay], a                   ; $6239: $EA $68 $D3
    ret                                           ; $623C: $C9

jr_018_623D:
    xor  a                                        ; $623D: $AF
    ld   [wC167], a                               ; $623E: $EA $67 $C1
    jp_open_dialog $1D6                           ; $6241

MarinAtTheShoreState4Handler::
    ld   a, [wDialogState]                        ; $6246: $FA $9F $C1
    and  a                                        ; $6249: $A7
    ret  nz                                       ; $624A: $C0

    call GetEntityTransitionCountdown             ; $624B: $CD $05 $0C
    ld   [hl], $60                                ; $624E: $36 $60
    jp   IncrementEntityState                     ; $6250: $C3 $12 $3B

MarinAtTheShoreState5Handler::
    call GetEntityTransitionCountdown             ; $6253: $CD $05 $0C
    jr   nz, jr_018_625B                          ; $6256: $20 $03

    call IncrementEntityState                     ; $6258: $CD $12 $3B

jr_018_625B:
    ld   e, $00                                   ; $625B: $1E $00
    cp   $54                                      ; $625D: $FE $54
    jr   c, jr_018_6263                           ; $625F: $38 $02

    ld   e, $04                                   ; $6261: $1E $04

jr_018_6263:
    ld   a, e                                     ; $6263: $7B
    jp   SetEntitySpriteVariant                   ; $6264: $C3 $0C $3B

MarinAtTheShoreState6Handler::
    ret                                           ; $6267: $C9

MazeSignpostEntityPosition::
    db   $65, $64, $54, $52, $22, $22, $32, $37, $37, $37, $57, $56, $26, $21

MazeSignpostEntityRoom::
    db   UNKNOWN_ROOM_C4, UNKNOWN_ROOM_C5
    db   UNKNOWN_ROOM_D5, UNKNOWN_ROOM_D4
    db   UNKNOWN_ROOM_C4, UNKNOWN_ROOM_C5
    db   UNKNOWN_ROOM_D5, UNKNOWN_ROOM_D5
    db   UNKNOWN_ROOM_C5, UNKNOWN_ROOM_C4
    db   UNKNOWN_ROOM_C4, UNKNOWN_ROOM_C5
    db   UNKNOWN_ROOM_D5, UNKNOWN_ROOM_D4

MazeSignpostEntityDialog::
    db   $AB, $A9, $AC, $AA, $AB, $A9, $AB, $AA, $AC, $A9, $AB, $A9, $AC, $AE

MazeSignpostEntityHandler::
    call func_018_7DE8
    ldh  a, [hMapRoom]
    cp   UNKNOWN_ROOM_B4                          ; are we in the starting room?
    jr   nz, .in_maze_proper

    xor  a                                        ; if so, then re-initialize
    ld   [wMazeSignpostGoal], a
    ld   [wMazeSignpostPos], a

.in_maze_proper:
    ld   a, [wMazeSignpostPos]                    ; $62A2: $FA $73 $D4
    and  a                                        ; $62A5: $A7
    jr   z, .skip

    ld   a, [wMazeSignpostGoal]                   ; $62A8: $FA $72 $D4
    ld   e, a                                     ; $62AB: $5F
    ld   d, b                                     ; $62AC: $50
    ld   hl, MazeSignpostEntityPosition           ; $62AD: $21 $68 $62
    add  hl, de                                   ; $62B0: $19
    ld   a, [wMazeSignpostPos]                    ; $62B1: $FA $73 $D4
    cp   [hl]                                     ; $62B4: $BE
    jr   nz, .wrong                               ; $62B5: $20 $2D

    ld   hl, MazeSignpostEntityRoom               ; $62B7: $21 $76 $62
    add  hl, de                                   ; $62BA: $19
    ldh  a, [hMapRoom]                            ; $62BB: $F0 $F6
    cp   [hl]                                     ; $62BD: $BE
    jr   nz, .wrong                               ; $62BE: $20 $24

    ; correct sign
    xor  a                                        ; $62C0: $AF
    ld   [wMazeSignpostPos], a                    ; $62C1: $EA $73 $D4
    ld   a, [wMazeSignpostGoal]                   ; $62C4: $FA $72 $D4
    inc  a                                        ; $62C7: $3C
    ld   [wMazeSignpostGoal], a                   ; $62C8: $EA $72 $D4
    cp   $0E                                      ; $62CB: $FE $0E
    jr   nz, .dialog                              ; $62CD: $20 $0D

    ; maze solved
    xor  a                                        ; $62CF: $AF
    ld   [wMazeSignpostGoal], a                   ; $62D0: $EA $72 $D4
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $62D3: $3E $02
    ldh  [hJingle], a                             ; $62D5: $E0 $F2
    push de                                       ; $62D7: $D5
    call RevealMamuCave                           ; $62D8: $CD $F5 $62
    pop  de                                       ; $62DB: $D1

.dialog:
    ld   hl, MazeSignpostEntityDialog             ; $62DC: $21 $84 $62
    add  hl, de                                   ; $62DF: $19
    ld   a, [hl]                                  ; $62E0: $7E
    jp   OpenDialogInTable1                       ; $62E1: $C3 $73 $23

.wrong:
    xor  a                                        ; $62E4: $AF
    ld   [wMazeSignpostGoal], a                   ; $62E5: $EA $72 $D4
    ld   [wMazeSignpostPos], a                    ; $62E8: $EA $73 $D4
    ld   a, JINGLE_WRONG_ANSWER                   ; $62EB: $3E $1D
    ldh  [hJingle], a                             ; $62ED: $E0 $F2
    call_open_dialog $1AD                         ; "try again from the start"

.skip:
    ret

RevealMamuCave::
    ld   hl, $D739                                ; $62F5: $21 $39 $D7
    ld   [hl], $C6                                ; $62F8: $36 $C6
    ld   a, $98                                   ; $62FA: $3E $98
    call func_2BF                                 ; $62FC: $CD $2F $0B
    ld   a, $28                                   ; $62FF: $3E $28
    ld   [wWarp0PositionTileIndex], a             ; $6301: $EA $16 $D4
    ld   a, $20                                   ; $6304: $3E $20
    ldh  [hSwordIntersectedAreaY], a              ; $6306: $E0 $CD
    add  $10                                      ; $6308: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $630A: $E0 $D8
    ld   a, $80                                   ; $630C: $3E $80
    ldh  [hSwordIntersectedAreaX], a              ; $630E: $E0 $CE
    add  $08                                      ; $6310: $C6 $08
    ldh  [hMultiPurpose0], a                      ; $6312: $E0 $D7
    ld   a, TRANSCIENT_VFX_POOF                   ; $6314: $3E $02
    call AddTranscientVfx                         ; $6316: $CD $C7 $0C
    call label_2887                               ; $6319: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $631C: $F0 $FE
    and  a                                        ; $631E: $A7
    jr   z, jr_018_632D                           ; $631F: $28 $0C

    push bc                                       ; $6321: $C5
    ld   a, $C6                                   ; $6322: $3E $C6
    ld   [wDDD8], a                               ; $6324: $EA $D8 $DD
    ld   a, $18                                   ; $6327: $3E $18
    call func_91D                                 ; $6329: $CD $1D $09
    pop  bc                                       ; $632C: $C1

jr_018_632D:
    ld   hl, wRequestDestinationHigh              ; $632D: $21 $01 $D6
    ld   a, [wRequests]                           ; $6330: $FA $00 $D6
    ld   e, a                                     ; $6333: $5F
    add  $0A                                      ; $6334: $C6 $0A
    ld   [wRequests], a                           ; $6336: $EA $00 $D6
    ld   d, $00                                   ; $6339: $16 $00
    add  hl, de                                   ; $633B: $19
    ldh  a, [hFFCF]                               ; $633C: $F0 $CF
    ld   [hl+], a                                 ; $633E: $22
    ldh  a, [hFFD0]                               ; $633F: $F0 $D0
    ld   [hl+], a                                 ; $6341: $22
    ld   a, $81                                   ; $6342: $3E $81
    ld   [hl+], a                                 ; $6344: $22
    ld   a, $68                                   ; $6345: $3E $68
    ld   [hl+], a                                 ; $6347: $22
    ld   a, $77                                   ; $6348: $3E $77
    ld   [hl+], a                                 ; $634A: $22
    ldh  a, [hFFCF]                               ; $634B: $F0 $CF
    ld   [hl+], a                                 ; $634D: $22
    ldh  a, [hFFD0]                               ; $634E: $F0 $D0
    inc  a                                        ; $6350: $3C
    ld   [hl+], a                                 ; $6351: $22
    ld   a, $81                                   ; $6352: $3E $81
    ld   [hl+], a                                 ; $6354: $22
    ld   a, $69                                   ; $6355: $3E $69
    ld   [hl+], a                                 ; $6357: $22
    ld   a, $4B                                   ; $6358: $3E $4B
    ld   [hl+], a                                 ; $635A: $22
    ld   [hl], $00                                ; $635B: $36 $00
    ld   a, STAIRCASE_INACTIVE                    ; $635D: $3E $01
    ldh  [hStaircase], a                          ; $635F: $E0 $AC
    ldh  a, [hSwordIntersectedAreaY]              ; $6361: $F0 $CD
    and  $F0                                      ; $6363: $E6 $F0
    add  $10                                      ; $6365: $C6 $10
    ldh  [hStaircasePosY], a                      ; $6367: $E0 $AE
    ldh  a, [hSwordIntersectedAreaX]              ; $6369: $F0 $CE
    and  $F0                                      ; $636B: $E6 $F0
    add  $08                                      ; $636D: $C6 $08
    ldh  [hStaircasePosX], a                      ; $636F: $E0 $AD
    ldh  a, [hMapRoom]                            ; $6371: $F0 $F6
    ld   e, a                                     ; $6373: $5F
    ld   d, $00                                   ; $6374: $16 $00
    ld   hl, wOverworldRoomStatus                 ; $6376: $21 $00 $D8
    add  hl, de                                   ; $6379: $19
    set  ROOM_STATUS_DOOR_OPEN_UP, [hl]            ; $637A: $CB $E6
    ret                                           ; $637C: $C9

Data_018_637D::
    db   $10, $20, $30, $40, $50, $60, $70, $80

Data_018_6385::
    db   $18, $28, $38, $48, $58, $68, $78, $88

ZombieEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $638D: $21 $B0 $C2
    add  hl, bc                                   ; $6390: $09
    ld   a, [hl]                                  ; $6391: $7E
    and  a                                        ; $6392: $A7
    jp   nz, label_018_640C                       ; $6393: $C2 $0C $64

    call func_018_7DE8                            ; $6396: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $6399: $CD $05 $0C
    jr   nz, jr_018_63F7                          ; $639C: $20 $59

    call GetRandomByte                            ; $639E: $CD $0D $28
    and  $07                                      ; $63A1: $E6 $07
    ld   e, a                                     ; $63A3: $5F
    ld   d, b                                     ; $63A4: $50
    ld   hl, Data_018_6385                        ; $63A5: $21 $85 $63
    add  hl, de                                   ; $63A8: $19
    ld   a, [hl]                                  ; $63A9: $7E
    ld   hl, wEntitiesPosXTable                   ; $63AA: $21 $00 $C2
    add  hl, bc                                   ; $63AD: $09
    ld   [hl], a                                  ; $63AE: $77

jr_018_63AF:
    ld   hl, Data_018_637D                        ; $63AF: $21 $7D $63
    add  hl, de                                   ; $63B2: $19
    ld   a, [hl]                                  ; $63B3: $7E
    ld   hl, wEntitiesPosYTable                   ; $63B4: $21 $10 $C2
    add  hl, bc                                   ; $63B7: $09
    ld   [hl], a                                  ; $63B8: $77
    call func_018_6493                            ; $63B9: $CD $93 $64
    ldh  a, [hMultiPurpose3]                      ; $63BC: $F0 $DA
    cp   $00                                      ; $63BE: $FE $00
    jr   z, jr_018_63C9                           ; $63C0: $28 $07

    cp   $06                                      ; $63C2: $FE $06
    jr   z, jr_018_63C9                           ; $63C4: $28 $03

    cp   $09                                      ; $63C6: $FE $09
    ret  nz                                       ; $63C8: $C0

jr_018_63C9:
    call GetEntityTransitionCountdown             ; $63C9: $CD $05 $0C
    call GetRandomByte                            ; $63CC: $CD $0D $28
    and  $3F                                      ; $63CF: $E6 $3F

jr_018_63D1:
    add  $40                                      ; $63D1: $C6 $40
    ld   [hl], a                                  ; $63D3: $77
    ld   a, $BF                                   ; $63D4: $3E $BF
    ld   e, $05                                   ; $63D6: $1E $05
    call SpawnNewEntityInRange_trampoline         ; $63D8: $CD $98 $3B
    jr   c, jr_018_63F7                           ; $63DB: $38 $1A

    ldh  a, [hMultiPurpose0]                      ; $63DD: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $63DF: $21 $00 $C2
    add  hl, de                                   ; $63E2: $19
    ld   [hl], a                                  ; $63E3: $77
    ldh  a, [hMultiPurpose1]                      ; $63E4: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $63E6: $21 $10 $C2
    add  hl, de                                   ; $63E9: $19
    ld   [hl], a                                  ; $63EA: $77
    ld   hl, wEntitiesPrivateState1Table          ; $63EB: $21 $B0 $C2
    add  hl, de                                   ; $63EE: $19
    ld   [hl], $01                                ; $63EF: $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ; $63F1: $21 $40 $C3
    add  hl, de                                   ; $63F4: $19
    res  6, [hl]                                  ; $63F5: $CB $B6

jr_018_63F7:
    ret                                           ; $63F7: $C9

Data_018_63F8::
    db   $FF, $FF, $FF, $FF, $6C, $02, $6C, $22, $68, $02, $6A, $02, $60, $02, $62, $02
    db   $64, $02, $66, $02

label_018_640C:
    ld   de, Data_018_63F8                        ; $640C: $11 $F8 $63
    call RenderActiveEntitySpritesPair            ; $640F: $CD $C0 $3B
    call func_018_7DE8                            ; $6412: $CD $E8 $7D
    call func_018_7E15                            ; $6415: $CD $15 $7E
    ldh  a, [hActiveEntityState]                  ; $6418: $F0 $F0
    JP_TABLE                                      ; $641A
._00 dw ZombieState0Handler
._01 dw ZombieState1Handler
._02 dw ZombieState2Handler
._03 dw ZombieState3Handler

ZombieState0Handler::
    call GetEntityTransitionCountdown             ; $6423: $CD $05 $0C
    ld   [hl], $30                                ; $6426: $36 $30
    jp   IncrementEntityState                     ; $6428: $C3 $12 $3B

ZombieState1Handler::
    call GetEntityTransitionCountdown             ; $642B: $CD $05 $0C
    jr   nz, jr_018_6445                          ; $642E: $20 $15

    call GetRandomByte                            ; $6430: $CD $0D $28
    and  $3F                                      ; $6433: $E6 $3F
    add  $70                                      ; $6435: $C6 $70
    ld   [hl], a                                  ; $6437: $77
    call GetRandomByte                            ; $6438: $CD $0D $28
    and  $07                                      ; $643B: $E6 $07
    add  $05                                      ; $643D: $C6 $05
    call ApplyVectorTowardsLink_trampoline        ; $643F: $CD $AA $3B
    call IncrementEntityState                     ; $6442: $CD $12 $3B

jr_018_6445:
    ld   e, $01                                   ; $6445: $1E $01
    cp   $18                                      ; $6447: $FE $18
    jr   nc, jr_018_644C                          ; $6449: $30 $01

    inc  e                                        ; $644B: $1C

jr_018_644C:
    ld   a, e                                     ; $644C: $7B
    jp   SetEntitySpriteVariant                   ; $644D: $C3 $0C $3B

ZombieState2Handler::
    call UpdateEntityPosWithSpeed_18              ; $6450: $CD $5F $7E
    call label_3B23                               ; $6453: $CD $23 $3B
    call label_3B39                               ; $6456: $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6459: $21 $A0 $C2
    add  hl, bc                                   ; $645C: $09
    ld   a, [hl]                                  ; $645D: $7E
    and  $0F                                      ; $645E: $E6 $0F
    jr   nz, jr_018_6467                          ; $6460: $20 $05

    call GetEntityTransitionCountdown             ; $6462: $CD $05 $0C
    jr   nz, jr_018_6475                          ; $6465: $20 $0E

jr_018_6467:
    call GetEntityTransitionCountdown             ; $6467: $CD $05 $0C
    ld   [hl], $30                                ; $646A: $36 $30
    call IncrementEntityState                     ; $646C: $CD $12 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $646F: $21 $40 $C3
    add  hl, bc                                   ; $6472: $09
    set  6, [hl]                                  ; $6473: $CB $F6

jr_018_6475:
    ldh  a, [hFrameCounter]                       ; $6475: $F0 $E7
    rra                                           ; $6477: $1F
    rra                                           ; $6478: $1F
    rra                                           ; $6479: $1F
    rra                                           ; $647A: $1F
    and  $01                                      ; $647B: $E6 $01
    add  $03                                      ; $647D: $C6 $03
    jp   SetEntitySpriteVariant                   ; $647F: $C3 $0C $3B

ZombieState3Handler::
    call GetEntityTransitionCountdown             ; $6482: $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ; $6485: $CA $08 $7F

    ld   e, $01                                   ; $6488: $1E $01
    cp   $18                                      ; $648A: $FE $18
    jr   c, jr_018_648F                           ; $648C: $38 $01

    inc  e                                        ; $648E: $1C

jr_018_648F:
    ld   a, e                                     ; $648F: $7B
    jp   SetEntitySpriteVariant                   ; $6490: $C3 $0C $3B

func_018_6493::
    push bc                                       ; $6493: $C5
    ld   hl, wEntitiesPosXTable                   ; $6494: $21 $00 $C2
    add  hl, bc                                   ; $6497: $09
    ld   a, [hl]                                  ; $6498: $7E
    sub  $01                                      ; $6499: $D6 $01
    ldh  [hMultiPurpose4], a                      ; $649B: $E0 $DB
    and  $F0                                      ; $649D: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $649F: $E0 $CE
    swap a                                        ; $64A1: $CB $37
    ld   hl, wEntitiesPosYTable                   ; $64A3: $21 $10 $C2
    add  hl, bc                                   ; $64A6: $09
    ld   c, a                                     ; $64A7: $4F
    ld   a, [hl]                                  ; $64A8: $7E
    sub  $07                                      ; $64A9: $D6 $07
    ldh  [hMultiPurpose5], a                      ; $64AB: $E0 $DC
    and  $F0                                      ; $64AD: $E6 $F0
    ldh  [hSwordIntersectedAreaY], a              ; $64AF: $E0 $CD
    or   c                                        ; $64B1: $B1
    ld   c, a                                     ; $64B2: $4F
    ld   b, $00                                   ; $64B3: $06 $00
    ld   hl, wRoomObjects                         ; $64B5: $21 $11 $D7
    ld   a, h                                     ; $64B8: $7C
    add  hl, bc                                   ; $64B9: $09
    ld   h, a                                     ; $64BA: $67
    pop  bc                                       ; $64BB: $C1
    ld   a, [hl]                                  ; $64BC: $7E
    ldh  [hObjectUnderEntity], a                  ; $64BD: $E0 $AF
    ld   e, a                                     ; $64BF: $5F
    ld   a, [wIsIndoor]                           ; $64C0: $FA $A5 $DB
    ld   d, a                                     ; $64C3: $57
    call GetObjectPhysicsFlags_trampoline         ; $64C4: $CD $26 $2A
    db   $E0                                      ; $64C7: $E0

Data_018_64C8::
    db   $DA, $C9, $EC, $14

BlainoEntityHandler::
    call func_018_68EA                            ; $64CC: $CD $EA $68
    ldh  a, [hActiveEntityStatus]                 ; $64CF: $F0 $EA
    cp   $01                                      ; $64D1: $FE $01
    jp   z, func_018_7F0F                         ; $64D3: $CA $0F $7F

    call func_018_7DE8                            ; $64D6: $CD $E8 $7D
    call BossIntro                                ; $64D9: $CD $E8 $3E
    ld   hl, wEntitiesPrivateState1Table          ; $64DC: $21 $B0 $C2
    add  hl, bc                                   ; $64DF: $09
    ld   a, [hl]                                  ; $64E0: $7E
    and  a                                        ; $64E1: $A7
    jr   nz, jr_018_64EA                          ; $64E2: $20 $06

    inc  [hl]                                     ; $64E4: $34
    call GetEntityDropTimer                       ; $64E5: $CD $FB $0B
    ld   [hl], $20                                ; $64E8: $36 $20

jr_018_64EA:
    call GetEntityPrivateCountdown1               ; $64EA: $CD $00 $0C
    jr   z, jr_018_650A                           ; $64ED: $28 $1B

    ld   a, [wIgnoreLinkCollisionsCountdown]      ; $64EF: $FA $3E $C1
    and  a                                        ; $64F2: $A7
    cp   $01                                      ; $64F3: $FE $01
    jr   nz, jr_018_64FC                          ; $64F5: $20 $05

    ld   hl, hJingle                              ; $64F7: $21 $F2 $FF
    ld   [hl], JINGLE_BLAINO_PUNCH                ; $64FA: $36 $33

jr_018_64FC:
    and  a                                        ; $64FC: $A7
    jr   nz, jr_018_650A                          ; $64FD: $20 $0B

    ld   a, $02                                   ; $64FF: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6501: $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ; $6503: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $6505: $E0 $9D
    call func_018_69C5                            ; $6507: $CD $C5 $69

jr_018_650A:
    call func_018_7E15                            ; $650A: $CD $15 $7E
    call label_3B65                               ; $650D: $CD $65 $3B
    ld   a, [wIgnoreLinkCollisionsCountdown]      ; $6510: $FA $3E $C1
    and  a                                        ; $6513: $A7
    jr   nz, jr_018_6519                          ; $6514: $20 $03

    call label_3B39                               ; $6516: $CD $39 $3B

jr_018_6519:
    call UpdateEntityPosWithSpeed_18              ; $6519: $CD $5F $7E
    call label_3B23                               ; $651C: $CD $23 $3B
    call AddEntityZSpeedToPos_18                  ; $651F: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $6522: $21 $20 $C3
    add  hl, bc                                   ; $6525: $09
    dec  [hl]                                     ; $6526: $35
    dec  [hl]                                     ; $6527: $35
    dec  [hl]                                     ; $6528: $35
    ld   hl, wEntitiesPosZTable                   ; $6529: $21 $10 $C3
    add  hl, bc                                   ; $652C: $09
    ld   a, [hl]                                  ; $652D: $7E
    and  $80                                      ; $652E: $E6 $80
    ldh  [hMultiPurposeG], a                               ; $6530: $E0 $E8
    and  a                                        ; $6532: $A7
    jr   z, jr_018_653E                           ; $6533: $28 $09

    ld   [hl], b                                  ; $6535: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6536: $21 $20 $C3
    add  hl, bc                                   ; $6539: $09
    ld   [hl], b                                  ; $653A: $70
    call ClearEntitySpeed                         ; $653B: $CD $7F $3D

jr_018_653E:
    call func_018_65CF                            ; $653E: $CD $CF $65
    call func_018_7EB2                            ; $6541: $CD $B2 $7E
    ld   hl, wEntitiesDirectionTable              ; $6544: $21 $80 $C3
    add  hl, bc                                   ; $6547: $09
    ld   [hl], e                                  ; $6548: $73
    call func_018_7EC2                            ; $6549: $CD $C2 $7E
    cp   $00                                      ; $654C: $FE $00
    jr   z, jr_018_655B                           ; $654E: $28 $0B

    ld   d, b                                     ; $6550: $50
    ld   hl, Data_018_64C8                        ; $6551: $21 $C8 $64
    add  hl, de                                   ; $6554: $19
    ld   a, [hl]                                  ; $6555: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $6556: $21 $50 $C2
    add  hl, bc                                   ; $6559: $09
    ld   [hl], a                                  ; $655A: $77

jr_018_655B:
    ldh  a, [hMultiPurposeG]                               ; $655B: $F0 $E8
    and  a                                        ; $655D: $A7
    jr   z, jr_018_6588                           ; $655E: $28 $28

    ld   hl, wEntitiesSpeedZTable                 ; $6560: $21 $20 $C3
    add  hl, bc                                   ; $6563: $09
    ld   [hl], $10                                ; $6564: $36 $10
    call GetRandomByte                            ; $6566: $CD $0D $28
    and  $0F                                      ; $6569: $E6 $0F
    sub  $08                                      ; $656B: $D6 $08
    ld   hl, wEntitiesSpeedXTable                 ; $656D: $21 $40 $C2
    add  hl, bc                                   ; $6570: $09
    ld   [hl], a                                  ; $6571: $77
    call func_018_7EB2                            ; $6572: $CD $B2 $7E
    add  $28                                      ; $6575: $C6 $28
    cp   $50                                      ; $6577: $FE $50
    jr   c, jr_018_6588                           ; $6579: $38 $0D

    ld   a, $08                                   ; $657B: $3E $08
    call GetVectorTowardsLink_trampoline          ; $657D: $CD $B5 $3B
    ldh  a, [hMultiPurpose1]                      ; $6580: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $6582: $21 $40 $C2
    add  hl, bc                                   ; $6585: $09
    add  [hl]                                     ; $6586: $86
    ld   [hl], a                                  ; $6587: $77

jr_018_6588:
    call func_018_6596                            ; $6588: $CD $96 $65
    ldh  a, [hFrameCounter]                       ; $658B: $F0 $E7
    rra                                           ; $658D: $1F
    rra                                           ; $658E: $1F
    rra                                           ; $658F: $1F
    rra                                           ; $6590: $1F
    and  $01                                      ; $6591: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6593: $C3 $0C $3B

func_018_6596::
    call GetEntityPrivateCountdown1               ; $6596: $CD $00 $0C
    jr   z, jr_018_659F                           ; $6599: $28 $04

    ld   a, $03                                   ; $659B: $3E $03
    jr   label_018_65B8                           ; $659D: $18 $19

jr_018_659F:
    call GetEntityDropTimer                       ; $659F: $CD $FB $0B
    jr   nz, jr_018_65CE                          ; $65A2: $20 $2A

    ld   hl, wEntitiesPrivateState1Table          ; $65A4: $21 $B0 $C2
    add  hl, bc                                   ; $65A7: $09
    ld   a, [hl]                                  ; $65A8: $7E
    cp   $05                                      ; $65A9: $FE $05
    jr   nc, jr_018_65B2                          ; $65AB: $30 $05

    inc  [hl]                                     ; $65AD: $34
    ld   a, $01                                   ; $65AE: $3E $01
    jr   label_018_65B8                           ; $65B0: $18 $06

jr_018_65B2:
    call GetRandomByte                            ; $65B2: $CD $0D $28
    and  $03                                      ; $65B5: $E6 $03
    inc  a                                        ; $65B7: $3C

label_018_65B8:
    ld   [$D205], a                               ; $65B8: $EA $05 $D2
    cp   $01                                      ; $65BB: $FE $01
    jr   nz, jr_018_65C3                          ; $65BD: $20 $04

    ld   a, $0A                                   ; $65BF: $3E $0A
    ldh  [hNoiseSfx], a                           ; $65C1: $E0 $F4

jr_018_65C3:
    call GetEntityTransitionCountdown             ; $65C3: $CD $05 $0C
    ld   [hl], $00                                ; $65C6: $36 $00
    ld   hl, wEntitiesUnknowTableY                ; $65C8: $21 $D0 $C3
    add  hl, bc                                   ; $65CB: $09
    ld   [hl], $00                                ; $65CC: $36 $00

jr_018_65CE:
    ret                                           ; $65CE: $C9

func_018_65CF::
    ld   a, [$D205]                               ; $65CF: $FA $05 $D2
    and  a                                        ; $65D2: $A7
    ret  z                                        ; $65D3: $C8

    pop  de                                       ; $65D4: $D1
    dec  a                                        ; $65D5: $3D
    JP_TABLE                                      ; $65D6
._00 dw func_018_65EC                             ; $65D7
._01 dw func_018_6643                             ; $65D9
._02 dw func_018_66CD                             ; $65DB
._03 dw func_018_65EC                             ; $65DD

Data_018_65DF::
    db   $01, $01, $01, $02, $02, $03, $03, $03, $03, $03, $02, $02, $01

func_018_65EC::
    call GetEntityTransitionCountdown             ; $65EC: $CD $05 $0C
    jr   nz, jr_018_660B                          ; $65EF: $20 $1A

    ld   hl, wEntitiesUnknowTableY                ; $65F1: $21 $D0 $C3
    add  hl, bc                                   ; $65F4: $09
    ld   a, [hl]                                  ; $65F5: $7E
    cp   $0D                                      ; $65F6: $FE $0D
    jp   z, label_018_660C                        ; $65F8: $CA $0C $66

    inc  [hl]                                     ; $65FB: $34
    ld   e, a                                     ; $65FC: $5F
    ld   d, b                                     ; $65FD: $50
    ld   hl, Data_018_65DF                        ; $65FE: $21 $DF $65
    add  hl, de                                   ; $6601: $19
    ld   a, [hl]                                  ; $6602: $7E
    call SetEntitySpriteVariant                   ; $6603: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6606: $CD $05 $0C
    ld   [hl], $01                                ; $6609: $36 $01

jr_018_660B:
    ret                                           ; $660B: $C9

label_018_660C:
    call GetRandomByte                            ; $660C: $CD $0D $28
    and  $03                                      ; $660F: $E6 $03
    jp   z, label_018_672A                        ; $6611: $CA $2A $67

    ld   a, $01                                   ; $6614: $3E $01
    jp   label_018_65B8                           ; $6616: $C3 $B8 $65

Data_018_6619::
    db   $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $06, $07, $08, $08, $08
    db   $08, $08, $07, $06, $01

Data_018_662E::
    db   $08, $10, $08, $08, $02, $00, $00, $00, $FC, $F8, $F0, $F8, $E0, $90, $A0, $00
    db   $00, $00, $00, $00, $00

func_018_6643::
    call GetEntityTransitionCountdown             ; $6643: $CD $05 $0C
    jr   nz, jr_018_6678                          ; $6646: $20 $30

    ld   hl, wEntitiesUnknowTableY                ; $6648: $21 $D0 $C3
    add  hl, bc                                   ; $664B: $09
    ld   a, [hl]                                  ; $664C: $7E
    cp   $15                                      ; $664D: $FE $15
    jp   z, label_018_672A                        ; $664F: $CA $2A $67

    inc  [hl]                                     ; $6652: $34
    ld   e, a                                     ; $6653: $5F
    ld   d, b                                     ; $6654: $50
    ld   hl, Data_018_6619                        ; $6655: $21 $19 $66
    add  hl, de                                   ; $6658: $19
    ld   a, [hl]                                  ; $6659: $7E
    call SetEntitySpriteVariant                   ; $665A: $CD $0C $3B
    ld   hl, Data_018_662E                        ; $665D: $21 $2E $66
    add  hl, de                                   ; $6660: $19
    ld   e, [hl]                                  ; $6661: $5E
    ld   hl, wEntitiesDirectionTable              ; $6662: $21 $80 $C3
    add  hl, bc                                   ; $6665: $09
    ld   a, [hl]                                  ; $6666: $7E
    and  a                                        ; $6667: $A7
    jr   nz, jr_018_666E                          ; $6668: $20 $04

    ld   a, e                                     ; $666A: $7B
    cpl                                           ; $666B: $2F
    inc  a                                        ; $666C: $3C
    ld   e, a                                     ; $666D: $5F

jr_018_666E:
    ld   hl, wEntitiesSpeedXTable                 ; $666E: $21 $40 $C2
    add  hl, bc                                   ; $6671: $09
    ld   [hl], e                                  ; $6672: $73
    call GetEntityTransitionCountdown             ; $6673: $CD $05 $0C
    ld   [hl], $03                                ; $6676: $36 $03

jr_018_6678:
    ret                                           ; $6678: $C9

Data_018_6679::
    db   $09, $09, $0A, $0A, $0B, $0B, $0C, $0C, $09, $09, $0A, $0A, $0B, $0B, $0C, $0C
    db   $09, $09, $0A, $0A, $0B, $0B, $0C, $0C, $09, $09, $09, $09, $09, $09, $09, $09
    db   $09, $09, $0D, $0E, $0F, $10, $11, $11, $11, $01

Data_018_66A3::
    db   $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $08, $08, $08, $08, $08, $08, $08, $08
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $F0, $E0, $D0, $C0, $C0, $E0, $F0, $00, $00, $00

func_018_66CD::
    call GetEntityTransitionCountdown             ; $66CD: $CD $05 $0C
    jr   nz, jr_018_6729                          ; $66D0: $20 $57

    ld   hl, wEntitiesUnknowTableY                ; $66D2: $21 $D0 $C3
    add  hl, bc                                   ; $66D5: $09
    ld   a, [hl]                                  ; $66D6: $7E
    cp   $2A                                      ; $66D7: $FE $2A
    jp   z, label_018_672A                        ; $66D9: $CA $2A $67

    ld   e, a                                     ; $66DC: $5F
    cp   $28                                      ; $66DD: $FE $28
    jr   nz, jr_018_66E8                          ; $66DF: $20 $07

    ld   a, [wLinkMotionState]                    ; $66E1: $FA $1C $C1
    cp   $0A                                      ; $66E4: $FE $0A
    jr   z, jr_018_66E9                           ; $66E6: $28 $01

jr_018_66E8:
    inc  [hl]                                     ; $66E8: $34

jr_018_66E9:
    ld   d, b                                     ; $66E9: $50
    ld   hl, Data_018_6679                        ; $66EA: $21 $79 $66
    add  hl, de                                   ; $66ED: $19
    ld   a, [hl]                                  ; $66EE: $7E
    call SetEntitySpriteVariant                   ; $66EF: $CD $0C $3B
    ld   hl, Data_018_66A3                        ; $66F2: $21 $A3 $66
    add  hl, de                                   ; $66F5: $19
    ld   e, [hl]                                  ; $66F6: $5E
    ld   hl, wEntitiesDirectionTable              ; $66F7: $21 $80 $C3
    add  hl, bc                                   ; $66FA: $09
    ld   a, [hl]                                  ; $66FB: $7E
    and  a                                        ; $66FC: $A7
    jr   nz, jr_018_6703                          ; $66FD: $20 $04

    ld   a, e                                     ; $66FF: $7B
    cpl                                           ; $6700: $2F
    inc  a                                        ; $6701: $3C
    ld   e, a                                     ; $6702: $5F

jr_018_6703:
    ld   hl, wEntitiesSpeedXTable                 ; $6703: $21 $40 $C2
    add  hl, bc                                   ; $6706: $09
    ld   [hl], e                                  ; $6707: $73
    call GetEntityPrivateCountdown1               ; $6708: $CD $00 $0C
    jr   z, jr_018_6724                           ; $670B: $28 $17

    call func_018_7EB2                            ; $670D: $CD $B2 $7E
    add  $30                                      ; $6710: $C6 $30
    cp   $60                                      ; $6712: $FE $60
    jr   c, jr_018_6724                           ; $6714: $38 $0E

    ld   hl, wEntitiesUnknowTableY                ; $6716: $21 $D0 $C3
    add  hl, bc                                   ; $6719: $09
    ld   a, [hl]                                  ; $671A: $7E
    cp   $18                                      ; $671B: $FE $18
    jr   nc, jr_018_6724                          ; $671D: $30 $05

    ld   a, $10                                   ; $671F: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $6721: $CD $AA $3B

jr_018_6724:
    call GetEntityTransitionCountdown             ; $6724: $CD $05 $0C
    ld   [hl], $03                                ; $6727: $36 $03

jr_018_6729:
    ret                                           ; $6729: $C9

label_018_672A:
    xor  a                                        ; $672A: $AF
    ld   [$D205], a                               ; $672B: $EA $05 $D2
    call GetEntityDropTimer                       ; $672E: $CD $FB $0B
    call GetRandomByte                            ; $6731: $CD $0D $28
    and  $0F                                      ; $6734: $E6 $0F
    add  $0C                                      ; $6736: $C6 $0C
    ld   [hl], a                                  ; $6738: $77
    ret                                           ; $6739: $C9

Data_018_673A::
    db   $00, $F8, $6C, $03, $00, $00, $6E, $03   ; $673A
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $6742
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $674A
    db   $FF, $F8, $6C, $03, $FF, $00, $6E, $03   ; $6752
    db   $00, $00, $64, $01, $00, $08, $66, $01   ; $675A
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $6762
    db   $00, $F8, $6E, $23, $00, $00, $6C, $23   ; $676A
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $6772
    db   $FD, $F8, $6C, $03, $FD, $00, $6E, $03   ; $677A
    db   $FD, $F0, $6C, $03, $FD, $F8, $6E, $03   ; $6782
    db   $00, $F8, $6E, $23, $00, $00, $6C, $23   ; $678A
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $6792
    db   $00, $00, $6E, $23, $00, $08, $6C, $23   ; $679A
    db   $00, $00, $64, $01, $00, $08, $66, $01   ; $67A2
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $67AA
    db   $FD, $08, $6E, $23, $FD, $10, $6C, $23   ; $67B2
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $67BA
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $67C2
    db   $00, $F8, $6C, $03, $00, $00, $6E, $03   ; $67CA
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $67D2
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $67DA
    db   $00, $F0, $6C, $03, $00, $F8, $6E, $03   ; $67E2
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $67EA
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $67F2
    db   $00, $E8, $6C, $03, $00, $F0, $6E, $03   ; $67FA
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $6802
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $680A
    db   $F8, $10, $6C, $03, $F8, $18, $6E, $03   ; $6812
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $681A
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $6822
    db   $F0, $08, $6C, $03, $F0, $10, $6E, $03   ; $682A
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $6832
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $683A
    db   $FC, $08, $6E, $23, $FC, $10, $6C, $23   ; $6842
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $684A
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $6852
    db   $00, $10, $6E, $23, $00, $18, $6C, $23   ; $685A
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $6862
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $686A
    db   $04, $08, $6E, $23, $04, $10, $6C, $23   ; $6872
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $687A
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $6882
    db   $08, $00, $6C, $03, $08, $08, $6E, $03   ; $688A
    db   $00, $00, $64, $01, $00, $08, $66, $01   ; $6892
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $689A
    db   $08, $F8, $6C, $03, $08, $00, $6E, $03   ; $68A2
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $68AA
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $68B2
    db   $05, $F0, $6C, $03, $05, $F8, $6E, $03   ; $68BA
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $68C2
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $68CA
    db   $F4, $F0, $6E, $23, $F4, $F8, $6C, $23   ; $68D2
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $68DA
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $68E2

func_018_68EA::
    ld   a, $80                                   ; $68EA: $3E $80
    ld   [wD5C0], a                               ; $68EC: $EA $C0 $D5
    ld   [wD5C2], a                               ; $68EF: $EA $C2 $D5
    ldh  a, [hActiveEntitySpriteVariant]          ; $68F2: $F0 $F1
    sla  a                                        ; $68F4: $CB $27
    sla  a                                        ; $68F6: $CB $27
    ld   d, b                                     ; $68F8: $50
    sla  a                                        ; $68F9: $CB $27
    ld   e, a                                     ; $68FB: $5F
    rl   d                                        ; $68FC: $CB $12
    sla  a                                        ; $68FE: $CB $27
    rl   d                                        ; $6900: $CB $12
    add  e                                        ; $6902: $83
    ld   e, a                                     ; $6903: $5F
    ld   a, d                                     ; $6904: $7A
    adc  $00                                      ; $6905: $CE $00
    ld   d, a                                     ; $6907: $57
    xor  a                                        ; $6908: $AF
    ldh  [hMultiPurposeG], a                      ; $6909: $E0 $E8
    ld   hl, wEntitiesDirectionTable              ; $690B: $21 $80 $C3
    add  hl, bc                                   ; $690E: $09
    ld   a, [hl]                                  ; $690F: $7E
    and  a                                        ; $6910: $A7
    jr   nz, jr_018_691B                          ; $6911: $20 $08

    inc  a                                        ; $6913: $3C
    ldh  [hMultiPurposeG], a                      ; $6914: $E0 $E8
    ld   hl, hActiveEntityFlipAttribute           ; $6916: $21 $ED $FF
    set  OAM_X_FLIP, [hl]                         ; $6919: $CB $EE

jr_018_691B:
    ld   hl, Data_018_673A                        ; $691B: $21 $3A $67
    add  hl, de                                   ; $691E: $19
    ld   c, $06                                   ; $691F: $0E $06
    push hl                                       ; $6921: $E5
    ld   a, [wOAMNextAvailableSlot]               ; $6922: $FA $C0 $C3
    ld   e, a                                     ; $6925: $5F
    ld   d, $00                                   ; $6926: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $6928: $21 $30 $C0
    add  hl, de                                   ; $692B: $19
    ld   e, l                                     ; $692C: $5D
    ld   d, h                                     ; $692D: $54
    pop  hl                                       ; $692E: $E1
    ld   a, c                                     ; $692F: $79
    ldh  [hMultiPurpose0], a                      ; $6930: $E0 $D7
    ld   a, [wActiveEntityIndex]                  ; $6932: $FA $23 $C1
    ld   c, a                                     ; $6935: $4F
    call SkipDisabledEntityDuringRoomTransition   ; $6936: $CD $57 $3D
    ldh  a, [hMultiPurpose0]                      ; $6939: $F0 $D7
    ld   c, a                                     ; $693B: $4F

jr_018_693C:
    ld   a, [wD5C2]                               ; $693C: $FA $C2 $D5
    cp   $80                                      ; $693F: $FE $80
    jr   nz, jr_018_6949                          ; $6941: $20 $06

    ld   a, [hl]                                  ; $6943: $7E
    add  $08                                      ; $6944: $C6 $08
    ld   [wD5C2], a                               ; $6946: $EA $C2 $D5

jr_018_6949:
    ldh  a, [hActiveEntityVisualPosY]             ; $6949: $F0 $EC
    add  [hl]                                     ; $694B: $86
    ld   [de], a                                  ; $694C: $12
    inc  hl                                       ; $694D: $23
    inc  de                                       ; $694E: $13
    push bc                                       ; $694F: $C5
    ld   a, [wScreenShakeHorizontal]              ; $6950: $FA $55 $C1
    ld   c, a                                     ; $6953: $4F
    ld   b, [hl]                                  ; $6954: $46
    ldh  a, [hMultiPurposeG]                               ; $6955: $F0 $E8
    and  a                                        ; $6957: $A7
    jr   z, jr_018_6960                           ; $6958: $28 $06

    ld   a, b                                     ; $695A: $78
    cpl                                           ; $695B: $2F
    inc  a                                        ; $695C: $3C
    add  $08                                      ; $695D: $C6 $08
    ld   b, a                                     ; $695F: $47

jr_018_6960:
    ld   a, [wD5C0]                               ; $6960: $FA $C0 $D5
    cp   $80                                      ; $6963: $FE $80
    jr   nz, jr_018_6972                          ; $6965: $20 $0B

    ldh  a, [hMultiPurposeG]                               ; $6967: $F0 $E8
    and  a                                        ; $6969: $A7
    ld   a, b                                     ; $696A: $78
    jr   nz, jr_018_696F                          ; $696B: $20 $02

    add  $08                                      ; $696D: $C6 $08

jr_018_696F:
    ld   [wD5C0], a                               ; $696F: $EA $C0 $D5

jr_018_6972:
    ldh  a, [hActiveEntityPosX]                   ; $6972: $F0 $EE
    add  b                                        ; $6974: $80
    sub  c                                        ; $6975: $91
    ld   [de], a                                  ; $6976: $12
    inc  hl                                       ; $6977: $23
    inc  de                                       ; $6978: $13
    pop  bc                                       ; $6979: $C1
    ld   a, [hl+]                                 ; $697A: $2A
    ld   [de], a                                  ; $697B: $12
    cp   $FF                                      ; $697C: $FE $FF
    jr   nz, jr_018_6984                          ; $697E: $20 $04

    dec  de                                       ; $6980: $1B
    xor  a                                        ; $6981: $AF
    ld   [de], a                                  ; $6982: $12
    inc  de                                       ; $6983: $13

jr_018_6984:
    inc  de                                       ; $6984: $13
    ldh  a, [hActiveEntityFlipAttribute]          ; $6985: $F0 $ED
    xor  [hl]                                     ; $6987: $AE
    ld   [de], a                                  ; $6988: $12
    ldh  a, [hIsGBC]                              ; $6989: $F0 $FE
    and  a                                        ; $698B: $A7
    jr   z, jr_018_699A                           ; $698C: $28 $0C

    ldh  a, [hActiveEntityFlipAttribute]          ; $698E: $F0 $ED
    bit  OAM_OBP_NUM , a                          ; $6990: $CB $67
    jr   z, jr_018_699A                           ; $6992: $28 $06

    ld   a, [de]                                  ; $6994: $1A
    and  $F8                                      ; $6995: $E6 $F8
    or   $04                                      ; $6997: $F6 $04
    ld   [de], a                                  ; $6999: $12

jr_018_699A:
    inc  hl                                       ; $699A: $23
    inc  de                                       ; $699B: $13
    dec  c                                        ; $699C: $0D
    jr   nz, jr_018_693C                          ; $699D: $20 $9D

    ld   a, $08                                   ; $699F: $3E $08
    ld   [wD5C0+1], a                               ; $69A1: $EA $C1 $D5
    ld   a, $04                                   ; $69A4: $3E $04
    ld   [wD5C2+1], a                               ; $69A6: $EA $C3 $D5
    ld   a, [wActiveEntityIndex]                  ; $69A9: $FA $23 $C1
    ld   c, a                                     ; $69AC: $4F
    ld   a, $06                                   ; $69AD: $3E $06
    call label_3DA0                               ; $69AF: $CD $A0 $3D
    jp   label_3CD9                               ; $69B2: $C3 $D9 $3C

Data_018_69B5::
    db   $00, $FE, $FD, $FE, $00, $02, $03, $02

Data_018_69BD::
    db   $00, $04, $08, $0C, $10, $0C, $08, $04

func_018_69C5::
    ld   hl, wOAMBuffer+$10                                ; $69C5: $21 $10 $C0
    ldh  a, [hFrameCounter]                       ; $69C8: $F0 $E7
    rra                                           ; $69CA: $1F
    rra                                           ; $69CB: $1F
    rra                                           ; $69CC: $1F
    push af                                       ; $69CD: $F5
    and  $07                                      ; $69CE: $E6 $07
    call func_018_69D8                            ; $69D0: $CD $D8 $69
    pop  af                                       ; $69D3: $F1
    add  $04                                      ; $69D4: $C6 $04
    and  $07                                      ; $69D6: $E6 $07

func_018_69D8::
    push bc                                       ; $69D8: $C5
    push hl                                       ; $69D9: $E5
    ld   e, a                                     ; $69DA: $5F
    ld   d, $00                                   ; $69DB: $16 $00
    ld   hl, Data_018_69B5                        ; $69DD: $21 $B5 $69
    add  hl, de                                   ; $69E0: $19
    ld   b, [hl]                                  ; $69E1: $46
    ld   hl, Data_018_69BD                        ; $69E2: $21 $BD $69
    add  hl, de                                   ; $69E5: $19
    ld   c, [hl]                                  ; $69E6: $4E
    pop  hl                                       ; $69E7: $E1
    ldh  a, [hLinkPositionY]                      ; $69E8: $F0 $99
    add  b                                        ; $69EA: $80
    add  $F6                                      ; $69EB: $C6 $F6
    ld   [hl+], a                                 ; $69ED: $22
    ldh  a, [hLinkPositionX]                      ; $69EE: $F0 $98
    add  c                                        ; $69F0: $81
    add  $FC                                      ; $69F1: $C6 $FC
    ld   [hl+], a                                 ; $69F3: $22
    ld   [hl], $24                                ; $69F4: $36 $24
    inc  hl                                       ; $69F6: $23
    ld   [hl], $00                                ; $69F7: $36 $00
    inc  hl                                       ; $69F9: $23
    pop  bc                                       ; $69FA: $C1
    ret                                           ; $69FB: $C9

VireEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $69FC: $21 $B0 $C2
    add  hl, bc                                   ; $69FF: $09
    ld   a, [hl]                                  ; $6A00: $7E
    cp   $02                                      ; $6A01: $FE $02
    jp   z, label_018_6F1F                        ; $6A03: $CA $1F $6F

    and  a                                        ; $6A06: $A7
    jp   nz, label_018_6F70                       ; $6A07: $C2 $70 $6F

    ldh  a, [hActiveEntityStatus]                 ; $6A0A: $F0 $EA
    cp   $01                                      ; $6A0C: $FE $01
    jr   nz, jr_018_6A71                          ; $6A0E: $20 $61

    ldh  a, [hActiveEntityPosX]                   ; $6A10: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $6A12: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $6A14: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $6A16: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $6A18: $3E $02
    call AddTranscientVfx                         ; $6A1A: $CD $C7 $0C
    ld   a, $0C                                   ; $6A1D: $3E $0C
    ldh  [hMultiPurposeG], a                               ; $6A1F: $E0 $E8
    call func_018_6A31                            ; $6A21: $CD $31 $6A
    ld   a, $F4                                   ; $6A24: $3E $F4
    ldh  [hMultiPurposeG], a                               ; $6A26: $E0 $E8
    call func_018_6A31                            ; $6A28: $CD $31 $6A
    call DidKillEnemy.label_3F5E                  ; $6A2B: $CD $5E $3F
    jp   ClearEntityStatusBank18                  ; $6A2E: $C3 $08 $7F

func_018_6A31::
    ld   a, ENTITY_VIRE                           ; $6A31: $3E $BD
    call SpawnNewEntity_trampoline                ; $6A33: $CD $86 $3B
    jr   c, jr_018_6A70                           ; $6A36: $38 $38

    ld   hl, wEntitiesLoadOrderTable              ; $6A38: $21 $60 $C4
    add  hl, bc                                   ; $6A3B: $09
    ld   a, [hl]                                  ; $6A3C: $7E
    ld   hl, wEntitiesLoadOrderTable              ; $6A3D: $21 $60 $C4
    add  hl, de                                   ; $6A40: $19
    ld   [hl], a                                  ; $6A41: $77
    ldh  a, [hMultiPurpose0]                      ; $6A42: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6A44: $21 $00 $C2
    add  hl, de                                   ; $6A47: $19
    ld   [hl], a                                  ; $6A48: $77
    ldh  a, [hMultiPurpose1]                      ; $6A49: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6A4B: $21 $10 $C2
    add  hl, de                                   ; $6A4E: $19
    ld   [hl], a                                  ; $6A4F: $77
    ldh  a, [hMultiPurpose3]                      ; $6A50: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $6A52: $21 $10 $C3
    add  hl, de                                   ; $6A55: $19
    ld   [hl], a                                  ; $6A56: $77
    ld   hl, wEntitiesPrivateState1Table          ; $6A57: $21 $B0 $C2
    add  hl, de                                   ; $6A5A: $19
    ld   [hl], $01                                ; $6A5B: $36 $01
    ldh  a, [hMultiPurposeG]                               ; $6A5D: $F0 $E8
    ld   hl, wEntitiesSpeedXTable                 ; $6A5F: $21 $40 $C2
    add  hl, de                                   ; $6A62: $19
    ld   [hl], a                                  ; $6A63: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $6A64: $21 $E0 $C2
    add  hl, de                                   ; $6A67: $19
    ld   [hl], $20                                ; $6A68: $36 $20
    ld   hl, wEntitiesHealthTable                 ; $6A6A: $21 $60 $C3
    add  hl, de                                   ; $6A6D: $19
    ld   [hl], $01                                ; $6A6E: $36 $01

jr_018_6A70:
    ret                                           ; $6A70: $C9

jr_018_6A71:
    call func_018_6EFB                            ; $6A71: $CD $FB $6E
    ldh  a, [hMapRoom]                            ; $6A74: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $6A76: $21 $E0 $C3
    add  hl, bc                                   ; $6A79: $09
    cp   [hl]                                     ; $6A7A: $BE
    jr   z, jr_018_6A8B                           ; $6A7B: $28 $0E

    ldh  a, [hActiveEntityPosX]                   ; $6A7D: $F0 $EE
    cp   $98                                      ; $6A7F: $FE $98
    jp   nc, ClearEntityStatusBank18              ; $6A81: $D2 $08 $7F

    ldh  a, [hActiveEntityVisualPosY]             ; $6A84: $F0 $EC
    cp   $70                                      ; $6A86: $FE $70
    jp   nc, ClearEntityStatusBank18              ; $6A88: $D2 $08 $7F

jr_018_6A8B:
    call func_018_7DE8                            ; $6A8B: $CD $E8 $7D
    call func_018_7E15                            ; $6A8E: $CD $15 $7E
    call UpdateEntityPosWithSpeed_18              ; $6A91: $CD $5F $7E
    call AddEntityZSpeedToPos_18                  ; $6A94: $CD $98 $7E
    ldh  a, [hActiveEntityState]                  ; $6A97: $F0 $F0
    JP_TABLE                                      ; $6A99
._00 dw VireState0Handler
._01 dw VireState1Handler
._02 dw VireState2Handler
._03 dw VireState3Handler
._04 dw VireState4Handler
._05 dw VireState5Handler
._06 dw VireState6Handler
._07 dw VireState7Handler

VireState0Handler::
    ld   hl, wEntitiesHealthTable                 ; $6AAA: $21 $60 $C3
    add  hl, bc                                   ; $6AAD: $09
    ld   [hl], $03                                ; $6AAE: $36 $03
    call GetEntityTransitionCountdown             ; $6AB0: $CD $05 $0C
    ld   [hl], $C0                                ; $6AB3: $36 $C0
    ld   hl, wEntitiesDropTimerTable              ; $6AB5: $21 $50 $C4
    add  hl, bc                                   ; $6AB8: $09
    ld   [hl], $80                                ; $6AB9: $36 $80
    call ClearEntitySpeed                         ; $6ABB: $CD $7F $3D
    ld   hl, wEntitiesSpeedXTable                 ; $6ABE: $21 $40 $C2
    add  hl, bc                                   ; $6AC1: $09
    ld   [hl], $08                                ; $6AC2: $36 $08
    jp   IncrementEntityState                     ; $6AC4: $C3 $12 $3B

Data_018_6AC7::
    db   $08

Data_018_6AC8::
    db   $F8, $08, $F8

VireState1Handler::
    call func_018_6E3B                            ; $6ACB: $CD $3B $6E
    call func_018_7EB2                            ; $6ACE: $CD $B2 $7E
    add  $1C                                      ; $6AD1: $C6 $1C
    cp   $38                                      ; $6AD3: $FE $38
    jr   nc, jr_018_6B02                          ; $6AD5: $30 $2B

    call func_018_7ED2                            ; $6AD7: $CD $D2 $7E
    add  $20                                      ; $6ADA: $C6 $20
    cp   $40                                      ; $6ADC: $FE $40
    jr   nc, jr_018_6B02                          ; $6ADE: $30 $22

    ld   a, $10                                   ; $6AE0: $3E $10
    call GetVectorTowardsLink_trampoline          ; $6AE2: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6AE5: $F0 $D7
    cpl                                           ; $6AE7: $2F
    inc  a                                        ; $6AE8: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $6AE9: $21 $50 $C2
    add  hl, bc                                   ; $6AEC: $09
    ld   [hl], a                                  ; $6AED: $77
    ldh  a, [hMultiPurpose1]                      ; $6AEE: $F0 $D8
    cpl                                           ; $6AF0: $2F
    inc  a                                        ; $6AF1: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $6AF2: $21 $40 $C2
    add  hl, bc                                   ; $6AF5: $09
    ld   [hl], a                                  ; $6AF6: $77
    call IncrementEntityState                     ; $6AF7: $CD $12 $3B
    ld   [hl], $03                                ; $6AFA: $36 $03
    ld   hl, wEntitiesPrivateState2Table          ; $6AFC: $21 $C0 $C2
    add  hl, bc                                   ; $6AFF: $09
    ld   [hl], $FF                                ; $6B00: $36 $FF

jr_018_6B02:
    ld   hl, wEntitiesDropTimerTable              ; $6B02: $21 $50 $C4
    add  hl, bc                                   ; $6B05: $09
    ld   a, [hl]                                  ; $6B06: $7E
    and  a                                        ; $6B07: $A7
    jr   nz, jr_018_6B15                          ; $6B08: $20 $0B

    call IncrementEntityState                     ; $6B0A: $CD $12 $3B
    ld   [hl], $02                                ; $6B0D: $36 $02
    call GetEntityTransitionCountdown             ; $6B0F: $CD $05 $0C
    ld   [hl], $20                                ; $6B12: $36 $20
    ret                                           ; $6B14: $C9

jr_018_6B15:
    ld   hl, wEntitiesSpeedZTable                 ; $6B15: $21 $20 $C3
    add  hl, bc                                   ; $6B18: $09
    ld   [hl], b                                  ; $6B19: $70
    ld   hl, wEntitiesPosZTable                   ; $6B1A: $21 $10 $C3
    add  hl, bc                                   ; $6B1D: $09
    ld   a, [hl]                                  ; $6B1E: $7E
    sub  $28                                      ; $6B1F: $D6 $28
    jr   z, jr_018_6B30                           ; $6B21: $28 $0D

    ld   e, $08                                   ; $6B23: $1E $08
    and  $80                                      ; $6B25: $E6 $80
    jr   nz, jr_018_6B2B                          ; $6B27: $20 $02

    ld   e, $F8                                   ; $6B29: $1E $F8

jr_018_6B2B:
    ld   hl, wEntitiesSpeedZTable                 ; $6B2B: $21 $20 $C3
    add  hl, bc                                   ; $6B2E: $09
    ld   [hl], e                                  ; $6B2F: $73

jr_018_6B30:
    ld   hl, wEntitiesCollisionsTable             ; $6B30: $21 $A0 $C2
    add  hl, bc                                   ; $6B33: $09
    ld   a, [hl]                                  ; $6B34: $7E
    and  $03                                      ; $6B35: $E6 $03
    jr   z, jr_018_6B4B                           ; $6B37: $28 $12

    ld   e, a                                     ; $6B39: $5F
    ld   d, b                                     ; $6B3A: $50
    ld   hl, Data_018_6AC8                        ; $6B3B: $21 $C8 $6A
    add  hl, de                                   ; $6B3E: $19
    ld   a, [hl]                                  ; $6B3F: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $6B40: $21 $50 $C2
    add  hl, bc                                   ; $6B43: $09
    ld   [hl], a                                  ; $6B44: $77
    ld   hl, wEntitiesSpeedXTable                 ; $6B45: $21 $40 $C2
    add  hl, bc                                   ; $6B48: $09
    ld   [hl], $00                                ; $6B49: $36 $00

jr_018_6B4B:
    ld   hl, wEntitiesCollisionsTable             ; $6B4B: $21 $A0 $C2
    add  hl, bc                                   ; $6B4E: $09
    ld   a, [hl]                                  ; $6B4F: $7E
    rra                                           ; $6B50: $1F
    rra                                           ; $6B51: $1F
    and  $03                                      ; $6B52: $E6 $03
    jr   z, jr_018_6B68                           ; $6B54: $28 $12

    ld   e, a                                     ; $6B56: $5F
    ld   d, b                                     ; $6B57: $50
    ld   hl, Data_018_6AC7 - 1                    ; $6B58: $21 $C6 $6A
    add  hl, de                                   ; $6B5B: $19
    ld   a, [hl]                                  ; $6B5C: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6B5D: $21 $40 $C2
    add  hl, bc                                   ; $6B60: $09
    ld   [hl], a                                  ; $6B61: $77
    ld   hl, wEntitiesSpeedYTable                 ; $6B62: $21 $50 $C2
    add  hl, bc                                   ; $6B65: $09
    ld   [hl], $00                                ; $6B66: $36 $00

jr_018_6B68:
    call GetEntityTransitionCountdown             ; $6B68: $CD $05 $0C
    jr   nz, jr_018_6B7B                          ; $6B6B: $20 $0E

    call GetRandomByte                            ; $6B6D: $CD $0D $28
    and  $7F                                      ; $6B70: $E6 $7F
    add  $40                                      ; $6B72: $C6 $40
    ld   [hl], a                                  ; $6B74: $77
    ld   hl, wEntitiesPrivateCountdown1Table      ; $6B75: $21 $F0 $C2
    add  hl, bc                                   ; $6B78: $09
    ld   [hl], $10                                ; $6B79: $36 $10

jr_018_6B7B:
    ld   hl, wEntitiesPrivateCountdown1Table      ; $6B7B: $21 $F0 $C2
    add  hl, bc                                   ; $6B7E: $09
    ld   a, [hl]                                  ; $6B7F: $7E
    and  a                                        ; $6B80: $A7
    jr   z, jr_018_6B8F                           ; $6B81: $28 $0C

    cp   $08                                      ; $6B83: $FE $08
    jr   nz, jr_018_6B8A                          ; $6B85: $20 $03

    call func_018_6D98                            ; $6B87: $CD $98 $6D

jr_018_6B8A:
    ld   a, $02                                   ; $6B8A: $3E $02
    jp   SetEntitySpriteVariant                   ; $6B8C: $C3 $0C $3B

jr_018_6B8F:
    call func_018_6E57                            ; $6B8F: $CD $57 $6E

label_018_6B92:
    ldh  a, [hFrameCounter]                       ; $6B92: $F0 $E7
    rra                                           ; $6B94: $1F
    rra                                           ; $6B95: $1F
    rra                                           ; $6B96: $1F
    and  $01                                      ; $6B97: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6B99: $C3 $0C $3B

VireState2Handler::
    call GetEntityTransitionCountdown             ; $6B9C: $CD $05 $0C
    jr   nz, jr_018_6BD4                          ; $6B9F: $20 $33

    call IncrementEntityState                     ; $6BA1: $CD $12 $3B
    ld   [hl], $03                                ; $6BA4: $36 $03
    ldh  a, [hLinkPositionY]                      ; $6BA6: $F0 $99
    push af                                       ; $6BA8: $F5
    sub  $14                                      ; $6BA9: $D6 $14
    ldh  [hLinkPositionY], a                      ; $6BAB: $E0 $99
    ld   a, $20                                   ; $6BAD: $3E $20
    call ApplyVectorTowardsLink_trampoline        ; $6BAF: $CD $AA $3B
    pop  af                                       ; $6BB2: $F1
    ldh  [hLinkPositionY], a                      ; $6BB3: $E0 $99
    ld   hl, wEntitiesSpeedZTable                 ; $6BB5: $21 $20 $C3
    add  hl, bc                                   ; $6BB8: $09
    ld   [hl], $EC                                ; $6BB9: $36 $EC
    ld   hl, wEntitiesDropTimerTable              ; $6BBB: $21 $50 $C4
    add  hl, bc                                   ; $6BBE: $09
    ld   [hl], $30                                ; $6BBF: $36 $30
    call GetRandomByte                            ; $6BC1: $CD $0D $28
    and  $03                                      ; $6BC4: $E6 $03
    ld   hl, wEntitiesPrivateState2Table          ; $6BC6: $21 $C0 $C2
    add  hl, bc                                   ; $6BC9: $09
    ld   [hl], a                                  ; $6BCA: $77
    and  a                                        ; $6BCB: $A7
    jr   nz, jr_018_6BD3                          ; $6BCC: $20 $05

    call GetEntityTransitionCountdown             ; $6BCE: $CD $05 $0C
    ld   [hl], $10                                ; $6BD1: $36 $10

jr_018_6BD3:
    ret                                           ; $6BD3: $C9

jr_018_6BD4:
    call func_018_6CD3                            ; $6BD4: $CD $D3 $6C
    ld   a, $02                                   ; $6BD7: $3E $02
    jp   SetEntitySpriteVariant                   ; $6BD9: $C3 $0C $3B

VireState3Handler::
    ld   hl, wEntitiesPrivateState2Table          ; $6BDC: $21 $C0 $C2
    add  hl, bc                                   ; $6BDF: $09
    ld   a, [hl]                                  ; $6BE0: $7E
    cp   $FF                                      ; $6BE1: $FE $FF
    jr   z, jr_018_6C27                           ; $6BE3: $28 $42

    call func_018_7EB2                            ; $6BE5: $CD $B2 $7E
    add  $18                                      ; $6BE8: $C6 $18
    cp   $30                                      ; $6BEA: $FE $30
    jr   nc, jr_018_6C27                          ; $6BEC: $30 $39

    call func_018_7ED2                            ; $6BEE: $CD $D2 $7E
    add  $18                                      ; $6BF1: $C6 $18
    cp   $30                                      ; $6BF3: $FE $30
    jr   nc, jr_018_6C27                          ; $6BF5: $30 $30

    ld   hl, wEntitiesFlashCountdownTable         ; $6BF7: $21 $20 $C4
    add  hl, bc                                   ; $6BFA: $09
    ld   a, [hl]                                  ; $6BFB: $7E
    and  a                                        ; $6BFC: $A7
    jr   nz, jr_018_6C27                          ; $6BFD: $20 $28
    ; if wSwordAnimationState == SWORD_ANIMATION_STATE_NONE jump to jr_018_6C27
    ld   a, [wSwordAnimationState]                ; $6BFF: $FA $37 $C1
    and  a                                        ; $6C02: $A7
    jr   z, jr_018_6C27                           ; $6C03: $28 $22

    ld   a, $20                                   ; $6C05: $3E $20
    call GetVectorTowardsLink_trampoline          ; $6C07: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6C0A: $F0 $D7
    cpl                                           ; $6C0C: $2F
    inc  a                                        ; $6C0D: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $6C0E: $21 $50 $C2
    add  hl, bc                                   ; $6C11: $09
    ld   [hl], a                                  ; $6C12: $77
    ldh  a, [hMultiPurpose1]                      ; $6C13: $F0 $D8
    cpl                                           ; $6C15: $2F
    inc  a                                        ; $6C16: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $6C17: $21 $40 $C2
    add  hl, bc                                   ; $6C1A: $09
    ld   [hl], a                                  ; $6C1B: $77
    call GetEntityTransitionCountdown             ; $6C1C: $CD $05 $0C
    ld   [hl], $0B                                ; $6C1F: $36 $0B
    call IncrementEntityState                     ; $6C21: $CD $12 $3B
    ld   [hl], $06                                ; $6C24: $36 $06
    ret                                           ; $6C26: $C9

jr_018_6C27:
    ld   hl, wEntitiesPrivateState2Table          ; $6C27: $21 $C0 $C2
    add  hl, bc                                   ; $6C2A: $09
    ld   a, [hl]                                  ; $6C2B: $7E
    cp   $FF                                      ; $6C2C: $FE $FF
    jr   z, jr_018_6C38                           ; $6C2E: $28 $08

    and  a                                        ; $6C30: $A7
    jr   nz, jr_018_6C63                          ; $6C31: $20 $30

    call GetEntityTransitionCountdown             ; $6C33: $CD $05 $0C
    jr   nz, jr_018_6C63                          ; $6C36: $20 $2B

jr_018_6C38:
    ld   a, $20                                   ; $6C38: $3E $20
    call GetVectorTowardsLink_trampoline          ; $6C3A: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6C3D: $F0 $D7
    cpl                                           ; $6C3F: $2F
    inc  a                                        ; $6C40: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $6C41: $21 $50 $C2
    add  hl, bc                                   ; $6C44: $09
    sub  [hl]                                     ; $6C45: $96
    and  $80                                      ; $6C46: $E6 $80
    jr   nz, jr_018_6C4E                          ; $6C48: $20 $04

    inc  [hl]                                     ; $6C4A: $34
    inc  [hl]                                     ; $6C4B: $34
    inc  [hl]                                     ; $6C4C: $34
    inc  [hl]                                     ; $6C4D: $34

jr_018_6C4E:
    dec  [hl]                                     ; $6C4E: $35
    dec  [hl]                                     ; $6C4F: $35
    ldh  a, [hMultiPurpose1]                      ; $6C50: $F0 $D8
    cpl                                           ; $6C52: $2F
    inc  a                                        ; $6C53: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $6C54: $21 $40 $C2
    add  hl, bc                                   ; $6C57: $09
    sub  [hl]                                     ; $6C58: $96
    and  $80                                      ; $6C59: $E6 $80
    jr   nz, jr_018_6C61                          ; $6C5B: $20 $04

    inc  [hl]                                     ; $6C5D: $34
    inc  [hl]                                     ; $6C5E: $34
    inc  [hl]                                     ; $6C5F: $34
    inc  [hl]                                     ; $6C60: $34

jr_018_6C61:
    dec  [hl]                                     ; $6C61: $35
    dec  [hl]                                     ; $6C62: $35

jr_018_6C63:
    ld   hl, wEntitiesPosZTable                   ; $6C63: $21 $10 $C3
    add  hl, bc                                   ; $6C66: $09
    ld   a, [hl]                                  ; $6C67: $7E
    cp   $40                                      ; $6C68: $FE $40
    jr   c, jr_018_6C78                           ; $6C6A: $38 $0C

    ld   hl, wEntitiesSpeedZTable                 ; $6C6C: $21 $20 $C3
    add  hl, bc                                   ; $6C6F: $09
    ld   a, [hl]                                  ; $6C70: $7E
    and  $80                                      ; $6C71: $E6 $80
    jr   nz, jr_018_6C78                          ; $6C73: $20 $03

    ld   [hl], b                                  ; $6C75: $70
    jr   jr_018_6C88                              ; $6C76: $18 $10

jr_018_6C78:
    ld   hl, wEntitiesSpeedZTable                 ; $6C78: $21 $20 $C3
    add  hl, bc                                   ; $6C7B: $09
    ldh  a, [hFrameCounter]                       ; $6C7C: $F0 $E7
    and  $01                                      ; $6C7E: $E6 $01
    jr   nz, jr_018_6C83                          ; $6C80: $20 $01

    inc  [hl]                                     ; $6C82: $34

jr_018_6C83:
    ld   a, [hl]                                  ; $6C83: $7E
    and  $80                                      ; $6C84: $E6 $80
    jr   nz, func_018_6CB8                        ; $6C86: $20 $30

jr_018_6C88:
    ld   hl, wEntitiesDropTimerTable              ; $6C88: $21 $50 $C4
    add  hl, bc                                   ; $6C8B: $09
    ld   a, [hl]                                  ; $6C8C: $7E
    and  a                                        ; $6C8D: $A7
    jr   z, jr_018_6CA0                           ; $6C8E: $28 $10

    ldh  a, [hActiveEntityPosX]                   ; $6C90: $F0 $EE
    cp   $A8                                      ; $6C92: $FE $A8
    jr   nc, jr_018_6CA0                          ; $6C94: $30 $0A

    ldh  a, [hActiveEntityVisualPosY]             ; $6C96: $F0 $EC
    cp   $90                                      ; $6C98: $FE $90
    jr   c, func_018_6CB8                         ; $6C9A: $38 $1C

    cp   $C0                                      ; $6C9C: $FE $C0
    jr   nc, func_018_6CB8                        ; $6C9E: $30 $18

jr_018_6CA0:
    call IncrementEntityState                     ; $6CA0: $CD $12 $3B
    ld   [hl], $04                                ; $6CA3: $36 $04
    call func_018_6CD3                            ; $6CA5: $CD $D3 $6C
    call GetEntityTransitionCountdown             ; $6CA8: $CD $05 $0C
    call GetRandomByte                            ; $6CAB: $CD $0D $28
    and  $3F                                      ; $6CAE: $E6 $3F
    add  $20                                      ; $6CB0: $C6 $20
    ld   [hl], a                                  ; $6CB2: $77
    ld   a, $FF                                   ; $6CB3: $3E $FF
    jp   SetEntitySpriteVariant                   ; $6CB5: $C3 $0C $3B

func_018_6CB8::
    call label_3B39                               ; $6CB8: $CD $39 $3B
    ld   hl, wEntitiesFlashCountdownTable         ; $6CBB: $21 $20 $C4
    add  hl, bc                                   ; $6CBE: $09
    ld   a, [hl]                                  ; $6CBF: $7E
    and  a                                        ; $6CC0: $A7
    jr   z, jr_018_6CCD                           ; $6CC1: $28 $0A

    call ClearEntitySpeed                         ; $6CC3: $CD $7F $3D
    ld   hl, wEntitiesPrivateState2Table          ; $6CC6: $21 $C0 $C2
    add  hl, bc                                   ; $6CC9: $09
    ld   [hl], $FF                                ; $6CCA: $36 $FF
    ret                                           ; $6CCC: $C9

jr_018_6CCD:
    call func_018_6E57                            ; $6CCD: $CD $57 $6E
    jp   label_018_6B92                           ; $6CD0: $C3 $92 $6B

func_018_6CD3::
    call ClearEntitySpeed                         ; $6CD3: $CD $7F $3D
    ld   hl, wEntitiesSpeedZTable                 ; $6CD6: $21 $20 $C3
    add  hl, bc                                   ; $6CD9: $09
    ld   [hl], b                                  ; $6CDA: $70
    ret                                           ; $6CDB: $C9

Data_018_6CDC::
    db   $00, $00, $D0, $D0, $40, $40, $80, $80

Data_018_6CE4::
    db   $08, $98, $38, $78, $F8, $A8, $F8, $A8

VireState4Handler::
    call GetEntityTransitionCountdown             ; $6CEC: $CD $05 $0C
    jr   nz, jr_018_6D17                          ; $6CEF: $20 $26

    ld   hl, wEntitiesPosZTable                   ; $6CF1: $21 $10 $C3
    add  hl, bc                                   ; $6CF4: $09
    ld   [hl], $28                                ; $6CF5: $36 $28
    call IncrementEntityState                     ; $6CF7: $CD $12 $3B
    ld   [hl], $05                                ; $6CFA: $36 $05
    call GetRandomByte                            ; $6CFC: $CD $0D $28
    and  $07                                      ; $6CFF: $E6 $07
    ld   e, a                                     ; $6D01: $5F
    ld   d, b                                     ; $6D02: $50
    ld   hl, Data_018_6CDC                        ; $6D03: $21 $DC $6C
    add  hl, de                                   ; $6D06: $19
    ld   a, [hl]                                  ; $6D07: $7E
    ld   hl, wEntitiesPosYTable                   ; $6D08: $21 $10 $C2
    add  hl, bc                                   ; $6D0B: $09
    ld   [hl], a                                  ; $6D0C: $77
    ld   hl, Data_018_6CE4                        ; $6D0D: $21 $E4 $6C
    add  hl, de                                   ; $6D10: $19
    ld   a, [hl]                                  ; $6D11: $7E
    ld   hl, wEntitiesPosXTable                   ; $6D12: $21 $00 $C2
    add  hl, bc                                   ; $6D15: $09
    ld   [hl], a                                  ; $6D16: $77

jr_018_6D17:
    ret                                           ; $6D17: $C9

VireState5Handler::
    ld   a, $08                                   ; $6D18: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6D1A: $CD $AA $3B
    ldh  a, [hActiveEntityPosX]                   ; $6D1D: $F0 $EE
    cp   $09                                      ; $6D1F: $FE $09
    jr   c, jr_018_6D52                           ; $6D21: $38 $2F

    cp   $97                                      ; $6D23: $FE $97
    jr   nc, jr_018_6D52                          ; $6D25: $30 $2B

    ldh  a, [hActiveEntityVisualPosY]             ; $6D27: $F0 $EC
    cp   $20                                      ; $6D29: $FE $20
    jr   c, jr_018_6D52                           ; $6D2B: $38 $25

    cp   $70                                      ; $6D2D: $FE $70
    jr   nc, jr_018_6D52                          ; $6D2F: $30 $21

    call IncrementEntityState                     ; $6D31: $CD $12 $3B
    ld   [hl], $01                                ; $6D34: $36 $01
    ld   hl, wEntitiesDropTimerTable              ; $6D36: $21 $50 $C4
    add  hl, bc                                   ; $6D39: $09
    call GetRandomByte                            ; $6D3A: $CD $0D $28
    and  $3F                                      ; $6D3D: $E6 $3F
    add  $20                                      ; $6D3F: $C6 $20
    ld   [hl], a                                  ; $6D41: $77
    ld   hl, wEntitiesSpeedXTable                 ; $6D42: $21 $40 $C2
    add  hl, bc                                   ; $6D45: $09
    ld   a, [hl]                                  ; $6D46: $7E
    cpl                                           ; $6D47: $2F
    inc  a                                        ; $6D48: $3C
    ld   [hl], a                                  ; $6D49: $77
    ld   hl, wEntitiesSpeedYTable                 ; $6D4A: $21 $50 $C2
    add  hl, bc                                   ; $6D4D: $09
    ld   a, [hl]                                  ; $6D4E: $7E
    cpl                                           ; $6D4F: $2F
    inc  a                                        ; $6D50: $3C
    ld   [hl], a                                  ; $6D51: $77

jr_018_6D52:
    jp   label_018_6B92                           ; $6D52: $C3 $92 $6B

Data_018_6D55::
    db   $00, $09, $12, $15

Data_018_6D59::
    db   $18, $15, $12, $09, $00, $F7, $EE, $EB, $E8, $EB, $EE, $F7, $00, $09, $12, $15

VireState6Handler::
    call GetEntityTransitionCountdown             ; $6D69: $CD $05 $0C
    jr   nz, jr_018_6D78                          ; $6D6C: $20 $0A

    ld   [hl], $20                                ; $6D6E: $36 $20

jr_018_6D70:
    call IncrementEntityState                     ; $6D70: $CD $12 $3B
    ld   [hl], $07                                ; $6D73: $36 $07
    jp   func_018_6CD3                            ; $6D75: $C3 $D3 $6C

jr_018_6D78:
    cp   $08                                      ; $6D78: $FE $08
    jr   c, jr_018_6D7F                           ; $6D7A: $38 $03

    call func_018_6CB8                            ; $6D7C: $CD $B8 $6C

jr_018_6D7F:
    jp   label_018_6B92                           ; $6D7F: $C3 $92 $6B

VireState7Handler::
    call GetEntityTransitionCountdown             ; $6D82: $CD $05 $0C
    jr   nz, jr_018_6D93                          ; $6D85: $20 $0C

    ld   hl, wEntitiesPrivateState2Table          ; $6D87: $21 $C0 $C2
    add  hl, bc                                   ; $6D8A: $09
    ld   [hl], $FF                                ; $6D8B: $36 $FF
    call IncrementEntityState                     ; $6D8D: $CD $12 $3B
    ld   [hl], $03                                ; $6D90: $36 $03
    ret                                           ; $6D92: $C9

jr_018_6D93:
    cp   $08                                      ; $6D93: $FE $08
    jp   nz, label_018_6E36                       ; $6D95: $C2 $36 $6E

func_018_6D98::
    ld   a, $0D                                   ; $6D98: $3E $0D
    ldh  [hNoiseSfx], a                           ; $6D9A: $E0 $F4
    ldh  a, [hLinkPositionY]                      ; $6D9C: $F0 $99
    push af                                       ; $6D9E: $F5
    sub  $08                                      ; $6D9F: $D6 $08
    ldh  [hLinkPositionY], a                      ; $6DA1: $E0 $99
    ld   a, $1F                                   ; $6DA3: $3E $1F
    call GetVectorTowardsLink_trampoline          ; $6DA5: $CD $B5 $3B
    pop  af                                       ; $6DA8: $F1
    ldh  [hLinkPositionY], a                      ; $6DA9: $E0 $99
    call func_018_7B9D                            ; $6DAB: $CD $9D $7B
    and  $0F                                      ; $6DAE: $E6 $0F
    ldh  [hMultiPurposeG], a                               ; $6DB0: $E0 $E8
    ld   e, $00                                   ; $6DB2: $1E $00
    call func_018_6DB9                            ; $6DB4: $CD $B9 $6D
    ld   e, $01                                   ; $6DB7: $1E $01

func_018_6DB9::
    ldh  a, [hMultiPurposeG]                               ; $6DB9: $F0 $E8
    add  e                                        ; $6DBB: $83
    and  $0F                                      ; $6DBC: $E6 $0F
    ldh  [hMultiPurposeG], a                               ; $6DBE: $E0 $E8
    ld   e, $0F                                   ; $6DC0: $1E $0F
    ld   d, b                                     ; $6DC2: $50

jr_018_6DC3:
    ld   hl, wEntitiesStatusTable                 ; $6DC3: $21 $80 $C2
    add  hl, de                                   ; $6DC6: $19
    ld   a, [hl]                                  ; $6DC7: $7E
    and  a                                        ; $6DC8: $A7
    jr   z, jr_018_6DDE                           ; $6DC9: $28 $13

    ld   hl, wEntitiesTypeTable                   ; $6DCB: $21 $A0 $C3
    add  hl, de                                   ; $6DCE: $19
    ld   a, [hl]                                  ; $6DCF: $7E
    cp   $BD                                      ; $6DD0: $FE $BD
    jr   nz, jr_018_6DDE                          ; $6DD2: $20 $0A

    ld   hl, wEntitiesPrivateState1Table          ; $6DD4: $21 $B0 $C2
    add  hl, de                                   ; $6DD7: $19
    ld   a, [hl]                                  ; $6DD8: $7E
    cp   $02                                      ; $6DD9: $FE $02
    jr   nz, jr_018_6DDE                          ; $6DDB: $20 $01

    inc  b                                        ; $6DDD: $04

jr_018_6DDE:
    dec  e                                        ; $6DDE: $1D
    ld   a, e                                     ; $6DDF: $7B
    cp   $FF                                      ; $6DE0: $FE $FF
    jr   nz, jr_018_6DC3                          ; $6DE2: $20 $DF

    ld   a, b                                     ; $6DE4: $78
    ld   b, $00                                   ; $6DE5: $06 $00
    cp   $03                                      ; $6DE7: $FE $03
    jr   nc, jr_018_6E35                          ; $6DE9: $30 $4A

    ld   a, ENTITY_VIRE                           ; $6DEB: $3E $BD
    call SpawnNewEntity_trampoline                ; $6DED: $CD $86 $3B
    jr   c, jr_018_6E35                           ; $6DF0: $38 $43

    ldh  a, [hMultiPurpose0]                      ; $6DF2: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6DF4: $21 $00 $C2
    add  hl, de                                   ; $6DF7: $19
    ld   [hl], a                                  ; $6DF8: $77
    ldh  a, [hMultiPurpose1]                      ; $6DF9: $F0 $D8
    ld   hl, hMultiPurpose3                            ; $6DFB: $21 $DA $FF
    sub  [hl]                                     ; $6DFE: $96
    ld   hl, wEntitiesPosYTable                   ; $6DFF: $21 $10 $C2
    add  hl, de                                   ; $6E02: $19
    ld   [hl], a                                  ; $6E03: $77
    ld   hl, wEntitiesPrivateState1Table          ; $6E04: $21 $B0 $C2
    add  hl, de                                   ; $6E07: $19
    ld   [hl], $02                                ; $6E08: $36 $02
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6E0A: $21 $40 $C3
    add  hl, de                                   ; $6E0D: $19
    ld   [hl], $02                                ; $6E0E: $36 $02
    ld   hl, wEntitiesHealthTable                 ; $6E10: $21 $60 $C3
    add  hl, de                                   ; $6E13: $19
    ld   [hl], $4C                                ; $6E14: $36 $4C
    push bc                                       ; $6E16: $C5
    ldh  a, [hMultiPurposeG]                               ; $6E17: $F0 $E8
    ld   c, a                                     ; $6E19: $4F
    ld   hl, Data_018_6D59                        ; $6E1A: $21 $59 $6D
    add  hl, bc                                   ; $6E1D: $09
    ld   a, [hl]                                  ; $6E1E: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6E1F: $21 $40 $C2
    add  hl, de                                   ; $6E22: $19
    ld   [hl], a                                  ; $6E23: $77
    ld   hl, Data_018_6D55                        ; $6E24: $21 $55 $6D
    add  hl, bc                                   ; $6E27: $09
    ld   a, [hl]                                  ; $6E28: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $6E29: $21 $50 $C2
    add  hl, de                                   ; $6E2C: $19
    ld   [hl], a                                  ; $6E2D: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $6E2E: $21 $E0 $C2
    add  hl, de                                   ; $6E31: $19
    ld   [hl], $20                                ; $6E32: $36 $20
    pop  bc                                       ; $6E34: $C1

jr_018_6E35:
    ret                                           ; $6E35: $C9

label_018_6E36:
    ld   a, $02                                   ; $6E36: $3E $02
    jp   SetEntitySpriteVariant                   ; $6E38: $C3 $0C $3B

func_018_6E3B::
    ld   hl, wEntitiesPosYTable                   ; $6E3B: $21 $10 $C2
    add  hl, bc                                   ; $6E3E: $09
    ld   a, [hl]                                  ; $6E3F: $7E
    sub  $28                                      ; $6E40: $D6 $28
    ld   [hl], a                                  ; $6E42: $77
    ldh  a, [hActiveEntityPosY]                   ; $6E43: $F0 $EF
    sub  $28                                      ; $6E45: $D6 $28
    ldh  [hActiveEntityPosY], a                   ; $6E47: $E0 $EF
    call label_3B23                               ; $6E49: $CD $23 $3B
    ld   hl, wEntitiesPosYTable                   ; $6E4C: $21 $10 $C2
    add  hl, bc                                   ; $6E4F: $09
    ld   a, [hl]                                  ; $6E50: $7E
    add  $28                                      ; $6E51: $C6 $28
    ld   [hl], a                                  ; $6E53: $77
    jp   CopyEntityPositionToActivePosition       ; $6E54: $C3 $8A $3D

func_018_6E57::
    ld   e, $0F                                   ; $6E57: $1E $0F

jr_018_6E59:
    ld   d, b                                     ; $6E59: $50
    ld   hl, wEntitiesStatusTable                 ; $6E5A: $21 $80 $C2
    add  hl, de                                   ; $6E5D: $19
    ld   a, [hl]                                  ; $6E5E: $7E
    cp   $05                                      ; $6E5F: $FE $05
    jr   nz, jr_018_6ED0                          ; $6E61: $20 $6D

    ld   hl, wEntitiesTypeTable                   ; $6E63: $21 $A0 $C3
    add  hl, de                                   ; $6E66: $19
    ld   a, [hl]                                  ; $6E67: $7E
    cp   $03                                      ; $6E68: $FE $03
    jr   z, jr_018_6E74                           ; $6E6A: $28 $08

    cp   $00                                      ; $6E6C: $FE $00
    jr   z, jr_018_6E74                           ; $6E6E: $28 $04

    cp   $02                                      ; $6E70: $FE $02
    jr   nz, jr_018_6ED0                          ; $6E72: $20 $5C

jr_018_6E74:
    ld   hl, wEntitiesPosXTable                   ; $6E74: $21 $00 $C2
    add  hl, de                                   ; $6E77: $19
    ldh  a, [hActiveEntityPosX]                   ; $6E78: $F0 $EE
    sub  [hl]                                     ; $6E7A: $96
    add  $18                                      ; $6E7B: $C6 $18
    cp   $30                                      ; $6E7D: $FE $30
    jr   nc, jr_018_6ED0                          ; $6E7F: $30 $4F

    ld   hl, wEntitiesPosYTable                   ; $6E81: $21 $10 $C2
    add  hl, de                                   ; $6E84: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $6E85: $F0 $EC
    sub  [hl]                                     ; $6E87: $96
    add  $20                                      ; $6E88: $C6 $20
    cp   $40                                      ; $6E8A: $FE $40
    jr   nc, jr_018_6ED0                          ; $6E8C: $30 $42

    ldh  a, [hLinkPositionY]                      ; $6E8E: $F0 $99
    push af                                       ; $6E90: $F5
    ldh  a, [hLinkPositionX]                      ; $6E91: $F0 $98
    push af                                       ; $6E93: $F5
    ld   a, [hl]                                  ; $6E94: $7E
    ldh  [hLinkPositionY], a                      ; $6E95: $E0 $99
    ld   hl, wEntitiesPosXTable                   ; $6E97: $21 $00 $C2
    add  hl, de                                   ; $6E9A: $19
    ld   a, [hl]                                  ; $6E9B: $7E
    ldh  [hLinkPositionX], a                      ; $6E9C: $E0 $98
    push de                                       ; $6E9E: $D5
    ld   a, $20                                   ; $6E9F: $3E $20
    call GetVectorTowardsLink_trampoline          ; $6EA1: $CD $B5 $3B
    pop  de                                       ; $6EA4: $D1
    ldh  a, [hMultiPurpose1]                      ; $6EA5: $F0 $D8
    cpl                                           ; $6EA7: $2F
    inc  a                                        ; $6EA8: $3C
    jr   nz, jr_018_6EAD                          ; $6EA9: $20 $02

    ld   a, $20                                   ; $6EAB: $3E $20

jr_018_6EAD:
    ld   hl, wEntitiesSpeedXTable                 ; $6EAD: $21 $40 $C2
    add  hl, bc                                   ; $6EB0: $09
    ld   [hl], a                                  ; $6EB1: $77
    ldh  a, [hMultiPurpose0]                      ; $6EB2: $F0 $D7
    cpl                                           ; $6EB4: $2F
    inc  a                                        ; $6EB5: $3C
    jr   nz, jr_018_6EBA                          ; $6EB6: $20 $02

    ld   a, $20                                   ; $6EB8: $3E $20

jr_018_6EBA:
    ld   hl, wEntitiesSpeedYTable                 ; $6EBA: $21 $50 $C2
    add  hl, bc                                   ; $6EBD: $09
    ld   [hl], a                                  ; $6EBE: $77
    pop  af                                       ; $6EBF: $F1
    ldh  [hLinkPositionX], a                      ; $6EC0: $E0 $98
    pop  af                                       ; $6EC2: $F1
    ldh  [hLinkPositionY], a                      ; $6EC3: $E0 $99
    call IncrementEntityState                     ; $6EC5: $CD $12 $3B
    ld   [hl], $03                                ; $6EC8: $36 $03
    ld   hl, wEntitiesPrivateState2Table          ; $6ECA: $21 $C0 $C2
    add  hl, bc                                   ; $6ECD: $09
    ld   [hl], $01                                ; $6ECE: $36 $01

jr_018_6ED0:
    dec  e                                        ; $6ED0: $1D
    ld   a, e                                     ; $6ED1: $7B
    cp   $FF                                      ; $6ED2: $FE $FF
    jr   nz, jr_018_6E59                          ; $6ED4: $20 $83

    ret                                           ; $6ED6: $C9

Data_018_6ED7::
    db   $00, $FC, $60, $02, $00, $04, $62, $02, $00, $0C, $60, $22, $00, $FC, $64, $02
    db   $00, $04, $66, $02, $00, $0C, $64, $22, $00, $FC, $68, $02, $00, $04, $6A, $02
    db   $00, $0C, $68, $22

func_018_6EFB::
    ldh  a, [hActiveEntitySpriteVariant]          ; $6EFB: $F0 $F1
    cp   $FF                                      ; $6EFD: $FE $FF
    ret  z                                        ; $6EFF: $C8

    rla                                           ; $6F00: $17
    rla                                           ; $6F01: $17
    and  $FC                                      ; $6F02: $E6 $FC
    ld   e, a                                     ; $6F04: $5F
    rla                                           ; $6F05: $17
    and  $F8                                      ; $6F06: $E6 $F8
    add  e                                        ; $6F08: $83
    ld   e, a                                     ; $6F09: $5F
    ld   d, b                                     ; $6F0A: $50
    ld   hl, Data_018_6ED7                        ; $6F0B: $21 $D7 $6E
    add  hl, de                                   ; $6F0E: $19
    ld   c, $03                                   ; $6F0F: $0E $03
    call RenderActiveEntitySpritesRect            ; $6F11: $CD $E6 $3C
    jp   label_3CD9                               ; $6F14: $C3 $D9 $3C

Data_018_6F17::
    db   $1E, $03, $1E, $63, $1E, $43, $1E, $23

label_018_6F1F:
    ld   de, Data_018_6F17                        ; $6F1F: $11 $17 $6F
    call RenderActiveEntitySpritesPair            ; $6F22: $CD $C0 $3B
    call func_018_7DE8                            ; $6F25: $CD $E8 $7D
    call DecrementEntityIgnoreHitsCountdown       ; $6F28: $CD $56 $0C
    ldh  a, [hFrameCounter]                       ; $6F2B: $F0 $E7
    rra                                           ; $6F2D: $1F
    rra                                           ; $6F2E: $1F
    and  $01                                      ; $6F2F: $E6 $01
    call SetEntitySpriteVariant                   ; $6F31: $CD $0C $3B
    call label_3B70                               ; $6F34: $CD $70 $3B
    call label_3B44                               ; $6F37: $CD $44 $3B
    jr   c, jr_018_6F51                           ; $6F3A: $38 $15

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6F3C: $21 $10 $C4
    add  hl, bc                                   ; $6F3F: $09
    ld   a, [hl]                                  ; $6F40: $7E
    and  a                                        ; $6F41: $A7
    jr   z, jr_018_6F54                           ; $6F42: $28 $10

    ldh  a, [hActiveEntityPosX]                   ; $6F44: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $6F46: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $6F48: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $6F4A: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $6F4C: $3E $02
    call AddTranscientVfx                         ; $6F4E: $CD $C7 $0C

jr_018_6F51:
    jp   ClearEntityStatusBank18                  ; $6F51: $C3 $08 $7F

jr_018_6F54:
    call UpdateEntityPosWithSpeed_18              ; $6F54: $CD $5F $7E
    call GetEntityTransitionCountdown             ; $6F57: $CD $05 $0C
    ret  nz                                       ; $6F5A: $C0

    call label_3B23                               ; $6F5B: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6F5E: $21 $A0 $C2
    add  hl, bc                                   ; $6F61: $09
    ld   a, [hl]                                  ; $6F62: $7E
    and  a                                        ; $6F63: $A7
    jp   nz, ClearEntityStatusBank18              ; $6F64: $C2 $08 $7F

    ret                                           ; $6F67: $C9

Data_018_6F68::
.variant0
    db   $6C, $00
    db   $6C, $20
.variant1
    db   $6E, $00
    db   $6E, $20

label_018_6F70:
    ld   de, Data_018_6F68
    call RenderActiveEntitySpritesPair            ; $6F73: $CD $C0 $3B
    call func_018_7DE8                            ; $6F76: $CD $E8 $7D
    call func_018_7E15                            ; $6F79: $CD $15 $7E
    call UpdateEntityPosWithSpeed_18              ; $6F7C: $CD $5F $7E
    ldh  a, [hFrameCounter]                       ; $6F7F: $F0 $E7
    and  $03                                      ; $6F81: $E6 $03
    jr   nz, jr_018_6F95                          ; $6F83: $20 $10

    ld   hl, wEntitiesPosZTable                   ; $6F85: $21 $10 $C3
    add  hl, bc                                   ; $6F88: $09
    ld   a, [hl]                                  ; $6F89: $7E
    sub  $10                                      ; $6F8A: $D6 $10
    jr   z, jr_018_6F95                           ; $6F8C: $28 $07

    and  $80                                      ; $6F8E: $E6 $80
    jr   z, jr_018_6F94                           ; $6F90: $28 $02

    inc  [hl]                                     ; $6F92: $34
    inc  [hl]                                     ; $6F93: $34

jr_018_6F94:
    dec  [hl]                                     ; $6F94: $35

jr_018_6F95:
    ldh  a, [hFrameCounter]                       ; $6F95: $F0 $E7
    rra                                           ; $6F97: $1F
    rra                                           ; $6F98: $1F
    rra                                           ; $6F99: $1F
    and  $01                                      ; $6F9A: $E6 $01
    call SetEntitySpriteVariant                   ; $6F9C: $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ; $6F9F: $F0 $F0
    JP_TABLE                                      ; $6FA1
._00 dw func_018_6FA8                             ; $6FA2
._01 dw func_018_6FB4                             ; $6FA4
._02 dw func_018_6FC2                             ; $6FA6

func_018_6FA8::
    call GetEntityTransitionCountdown
    ret  nz                                       ; $6FAB: $C0

    ld   [hl], $20                                ; $6FAC: $36 $20
    call ClearEntitySpeed                         ; $6FAE: $CD $7F $3D
    jp   IncrementEntityState                     ; $6FB1: $C3 $12 $3B

func_018_6FB4::
    call GetEntityTransitionCountdown             ; $6FB4: $CD $05 $0C
    ret  nz                                       ; $6FB7: $C0

    ld   [hl], $20                                ; $6FB8: $36 $20
    ld   a, $20                                   ; $6FBA: $3E $20
    call ApplyVectorTowardsLink_trampoline        ; $6FBC: $CD $AA $3B
    jp   IncrementEntityState                     ; $6FBF: $C3 $12 $3B

func_018_6FC2::
    call label_3B39                               ; $6FC2: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $6FC5: $CD $05 $0C
    ret  nz                                       ; $6FC8: $C0

    call label_3B23                               ; $6FC9: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6FCC: $21 $A0 $C2
    add  hl, bc                                   ; $6FCF: $09
    ld   a, [hl]                                  ; $6FD0: $7E
    and  a                                        ; $6FD1: $A7
    jp   nz, ClearEntityStatusBank18              ; $6FD2: $C2 $08 $7F

    ret                                           ; $6FD5: $C9

GrimCreeperEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $6FD6: $21 $B0 $C2
    add  hl, bc                                   ; $6FD9: $09
    ld   a, [hl]                                  ; $6FDA: $7E

jr_018_6FDB:
    and  a                                        ; $6FDB: $A7
    jp   nz, label_018_71A3                       ; $6FDC: $C2 $A3 $71

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6FDF: $21 $40 $C3
    add  hl, bc                                   ; $6FE2: $09
    set  6, [hl]                                  ; $6FE3: $CB $F6
    call func_018_7181                            ; $6FE5: $CD $81 $71
    call label_394D                               ; $6FE8: $CD $4D $39
    call BossIntro                                ; $6FEB: $CD $E8 $3E
    call func_018_7DE8                            ; $6FEE: $CD $E8 $7D
    ld   a, [wRoomEventEffectExecuted]            ; $6FF1: $FA $8F $C1
    and  a                                        ; $6FF4: $A7
    jr   z, jr_018_7028                           ; $6FF5: $28 $31

    ld   hl, wEntitiesUnknownTableD               ; $6FF7: $21 $D0 $C2
    add  hl, bc                                   ; $6FFA: $09
    ld   a, [hl]                                  ; $6FFB: $7E
    and  a                                        ; $6FFC: $A7
    jr   nz, jr_018_7008                          ; $6FFD: $20 $09

    inc  [hl]                                     ; $6FFF: $34
    call_open_dialog $025                         ; $7000
    jp   SetRoomStatus20                            ; $7005: $C3 $B9 $7F

jr_018_7008:
    cp   $01                                      ; $7008: $FE $01
    jr   nz, jr_018_7011                          ; $700A: $20 $05

    ld   a, $3F                                   ; $700C: $3E $3F
    ldh  [hNoiseSfx], a                           ; $700E: $E0 $F4
    inc  [hl]                                     ; $7010: $34

jr_018_7011:
    ld   hl, wEntitiesSpeedZTable                 ; $7011: $21 $20 $C3
    add  hl, bc                                   ; $7014: $09
    ld   [hl], $20                                ; $7015: $36 $20
    call AddEntityZSpeedToPos_18                  ; $7017: $CD $98 $7E
    ld   hl, wEntitiesPosZTable                   ; $701A: $21 $10 $C3
    add  hl, bc                                   ; $701D: $09
    ld   a, [hl]                                  ; $701E: $7E
    cp   $78                                      ; $701F: $FE $78
    ret  c                                        ; $7021: $D8

    call label_27DD                               ; $7022: $CD $DD $27
    jp   ClearEntityStatusBank18                  ; $7025: $C3 $08 $7F

jr_018_7028:
    ldh  a, [hActiveEntityState]                  ; $7028: $F0 $F0
    JP_TABLE                                      ; $702A
._00 dw GrimCreeperState0Handler
._01 dw GrimCreeperState1Handler
._02 dw GrimCreeperState2Handler
._03 dw GrimCreeperState3Handler
._04 dw GrimCreeperState4Handler
._05 dw GrimCreeperState5Handler
._06 dw GrimCreeperState6Handler

GrimCreeperState0Handler::
    ld   a, $07                                   ; $7039: $3E $07
    ld   [$D205], a                               ; $703B: $EA $05 $D2
    jp   IncrementEntityState                     ; $703E: $C3 $12 $3B

GrimCreeperState1Handler::
    call GetEntityTransitionCountdown             ; $7041: $CD $05 $0C
    ld   [hl], $80                                ; $7044: $36 $80
    xor  a                                        ; $7046: $AF
    ld   [$D201], a                               ; $7047: $EA $01 $D2
    ld   [$D202], a                               ; $704A: $EA $02 $D2
    ld   a, [$D205]                               ; $704D: $FA $05 $D2
    inc  a                                        ; $7050: $3C
    and  $07                                      ; $7051: $E6 $07
    ld   [$D205], a                               ; $7053: $EA $05 $D2
    jp   IncrementEntityState                     ; $7056: $C3 $12 $3B

GrimCreeperState2Handler::
    call GetEntityTransitionCountdown             ; $7059: $CD $05 $0C
    jr   nz, jr_018_7088                          ; $705C: $20 $2A

    ld   [hl], $FF                                ; $705E: $36 $FF
    ld   hl, wEntitiesOptions1Table               ; $7060: $21 $30 $C4
    add  hl, bc                                   ; $7063: $09
    res  ENTITY_OPT1_B_EXCLUDED_FROM_KILL_ALL, [hl]                                  ; $7064: $CB $8E
    ld   e, $0F                                   ; $7066: $1E $0F
    ld   d, b                                     ; $7068: $50

jr_018_7069:
    ld   hl, wEntitiesTypeTable                   ; $7069: $21 $A0 $C3
    add  hl, de                                   ; $706C: $19
    ld   a, [hl]                                  ; $706D: $7E
    cp   $BC                                      ; $706E: $FE $BC
    jr   nz, jr_018_707F                          ; $7070: $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ; $7072: $21 $B0 $C2
    add  hl, de                                   ; $7075: $19
    ld   a, [hl]                                  ; $7076: $7E
    and  a                                        ; $7077: $A7
    jr   z, jr_018_707F                           ; $7078: $28 $05

    ld   hl, wEntitiesStatusTable                 ; $707A: $21 $80 $C2
    add  hl, de                                   ; $707D: $19
    ld   [hl], b                                  ; $707E: $70

jr_018_707F:
    dec  e                                        ; $707F: $1D
    ld   a, e                                     ; $7080: $7B
    cp   $FF                                      ; $7081: $FE $FF
    jr   nz, jr_018_7069                          ; $7083: $20 $E4

    jp   IncrementEntityState                     ; $7085: $C3 $12 $3B

jr_018_7088:
    ret                                           ; $7088: $C9

Data_018_7089::
    db   $78, $68, $58, $48, $38, $28

Data_018_708F::
    db   $00, $00, $00, $00, $00, $00

GrimCreeperState3Handler::
    call GetEntityTransitionCountdown             ; $7095: $CD $05 $0C
    jr   nz, jr_018_70A4                          ; $7098: $20 $0A

    ld   hl, wEntitiesOptions1Table               ; $709A: $21 $30 $C4
    add  hl, bc                                   ; $709D: $09
    set  ENTITY_OPT1_B_EXCLUDED_FROM_KILL_ALL, [hl]                                  ; $709E: $CB $CE
    call IncrementEntityState                     ; $70A0: $CD $12 $3B
    xor  a                                        ; $70A3: $AF

jr_018_70A4:
    and  $1F                                      ; $70A4: $E6 $1F
    jr   nz, label_018_70FD                       ; $70A6: $20 $55

    ld   hl, wEntitiesUnknowTableY                ; $70A8: $21 $D0 $C3
    add  hl, bc                                   ; $70AB: $09
    ld   a, [hl]                                  ; $70AC: $7E
    cp   $06                                      ; $70AD: $FE $06
    jr   nc, label_018_70FD                       ; $70AF: $30 $4C

    ld   a, ENTITY_GRIM_CREEPER                   ; $70B1: $3E $BC
    call SpawnNewEntity_trampoline                ; $70B3: $CD $86 $3B
    jr   c, label_018_70FD                        ; $70B6: $38 $45

    ld   a, JINGLE_GRIM_CREEPER                   ; $70B8: $3E $31
    ldh  [hJingle], a                             ; $70BA: $E0 $F2
    ld   hl, wEntitiesUnknowTableY                ; $70BC: $21 $D0 $C3
    add  hl, bc                                   ; $70BF: $09
    push bc                                       ; $70C0: $C5
    ld   c, [hl]                                  ; $70C1: $4E
    inc  [hl]                                     ; $70C2: $34
    ld   hl, Data_018_7089                        ; $70C3: $21 $89 $70
    add  hl, bc                                   ; $70C6: $09
    ld   a, [hl]                                  ; $70C7: $7E
    ld   hl, wEntitiesPosXTable                   ; $70C8: $21 $00 $C2
    add  hl, de                                   ; $70CB: $19
    ld   [hl], a                                  ; $70CC: $77
    ld   hl, Data_018_708F                        ; $70CD: $21 $8F $70
    add  hl, bc                                   ; $70D0: $09
    ld   a, [hl]                                  ; $70D1: $7E
    ld   hl, wEntitiesPosYTable                   ; $70D2: $21 $10 $C2
    add  hl, de                                   ; $70D5: $19
    ld   [hl], a                                  ; $70D6: $77
    ld   hl, wEntitiesPosZTable                   ; $70D7: $21 $10 $C3
    add  hl, de                                   ; $70DA: $19
    ld   [hl], $1C                                ; $70DB: $36 $1C
    ld   hl, wEntitiesUnknowTableY                ; $70DD: $21 $D0 $C3
    add  hl, de                                   ; $70E0: $19
    ld   [hl], c                                  ; $70E1: $71
    ld   hl, wEntitiesOptions1Table               ; $70E2: $21 $30 $C4
    add  hl, de                                   ; $70E5: $19
    ld   a, [hl]                                  ; $70E6: $7E
    and  $7B                                      ; $70E7: $E6 $7B
    ld   [hl], a                                  ; $70E9: $77
    ld   hl, wEntitiesHealthTable                 ; $70EA: $21 $60 $C3
    add  hl, de                                   ; $70ED: $19
    ld   [hl], $01                                ; $70EE: $36 $01
    ld   hl, wEntitiesPrivateState1Table          ; $70F0: $21 $B0 $C2
    add  hl, de                                   ; $70F3: $19
    ld   [hl], $01                                ; $70F4: $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ; $70F6: $21 $40 $C3
    add  hl, de                                   ; $70F9: $19
    set  6, [hl]                                  ; $70FA: $CB $F6
    pop  bc                                       ; $70FC: $C1

label_018_70FD:
    ldh  a, [hFrameCounter]                       ; $70FD: $F0 $E7
    rra                                           ; $70FF: $1F
    rra                                           ; $7100: $1F
    rra                                           ; $7101: $1F
    rra                                           ; $7102: $1F
    rra                                           ; $7103: $1F
    and  $01                                      ; $7104: $E6 $01
    jp   SetEntitySpriteVariant                   ; $7106: $C3 $0C $3B

GrimCreeperState4Handler::
    ld   a, [$D201]                               ; $7109: $FA $01 $D2
    cp   $06                                      ; $710C: $FE $06
    jr   nz, jr_018_7121                          ; $710E: $20 $11

    ld   hl, wEntitiesUnknowTableY                ; $7110: $21 $D0 $C3
    add  hl, bc                                   ; $7113: $09
    ld   [hl], b                                  ; $7114: $70
    xor  a                                        ; $7115: $AF
    ld   [$D201], a                               ; $7116: $EA $01 $D2
    call GetEntityTransitionCountdown             ; $7119: $CD $05 $0C
    ld   [hl], $40                                ; $711C: $36 $40
    call IncrementEntityState                     ; $711E: $CD $12 $3B

jr_018_7121:
    jp   label_018_70FD                           ; $7121: $C3 $FD $70

GrimCreeperState5Handler::
    call GetEntityTransitionCountdown             ; $7124: $CD $05 $0C
    ret  nz                                       ; $7127: $C0

    ld   a, $FF                                   ; $7128: $3E $FF
    ld   [$D201], a                               ; $712A: $EA $01 $D2
    ld   hl, wEntitiesDropTimerTable              ; $712D: $21 $50 $C4
    add  hl, bc                                   ; $7130: $09
    ld   [hl], $40                                ; $7131: $36 $40
    jp   IncrementEntityState                     ; $7133: $C3 $12 $3B

GrimCreeperState6Handler::
    ld   hl, wEntitiesDropTimerTable              ; $7136: $21 $50 $C4
    add  hl, bc                                   ; $7139: $09
    ld   a, [hl]                                  ; $713A: $7E
    and  a                                        ; $713B: $A7
    jr   nz, jr_018_7157                          ; $713C: $20 $19

    ld   a, [wRoomEventEffectExecuted]            ; $713E: $FA $8F $C1
    and  a                                        ; $7141: $A7
    jr   nz, jr_018_7152                          ; $7142: $20 $0E

    ld   hl, wEntitiesPrivateState2Table          ; $7144: $21 $C0 $C2
    add  hl, bc                                   ; $7147: $09
    ld   a, [hl]                                  ; $7148: $7E
    and  a                                        ; $7149: $A7
    jr   nz, jr_018_7152                          ; $714A: $20 $06

    inc  [hl]                                     ; $714C: $34
    call_open_dialog $1DF                         ; $714D

jr_018_7152:
    call IncrementEntityState                     ; $7152: $CD $12 $3B
    ld   [hl], $01                                ; $7155: $36 $01

jr_018_7157:
    ld   a, $02                                   ; $7157: $3E $02
    jp   SetEntitySpriteVariant                   ; $7159: $C3 $0C $3B

    ret                                           ; $715C: $C9

Data_018_715D::
    db   $00, $F8, $60, $02, $00, $00, $62, $02, $00, $08, $64, $02, $00, $F8, $66, $02
    db   $00, $00, $62, $02, $00, $08, $64, $02, $10, $00, $68, $02, $00, $00, $62, $02
    db   $00, $08, $64, $02

func_018_7181::
    ldh  a, [hActiveEntitySpriteVariant]          ; $7181: $F0 $F1
    rla                                           ; $7183: $17
    rla                                           ; $7184: $17
    and  $FC                                      ; $7185: $E6 $FC
    ld   e, a                                     ; $7187: $5F
    sla  a                                        ; $7188: $CB $27
    add  e                                        ; $718A: $83
    ld   e, a                                     ; $718B: $5F
    ld   d, b                                     ; $718C: $50
    ld   hl, Data_018_715D                        ; $718D: $21 $5D $71
    add  hl, de                                   ; $7190: $19
    ld   c, $03                                   ; $7191: $0E $03
    call RenderActiveEntitySpritesRect            ; $7193: $CD $E6 $3C
    ld   a, $01                                   ; $7196: $3E $01
    jp   label_3DA0                               ; $7198: $C3 $A0 $3D

Data_018_719B::
    db   $6E, $00, $6E, $20, $6E, $40, $6E, $60

label_018_71A3:
    ld   de, Data_018_719B                        ; $71A3: $11 $9B $71
    call RenderActiveEntitySpritesPair            ; $71A6: $CD $C0 $3B
    call func_018_7DE8                            ; $71A9: $CD $E8 $7D
    call DecrementEntityIgnoreHitsCountdown       ; $71AC: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $71AF: $F0 $F0
    JP_TABLE                                      ; $71B1
._00 dw func_018_721C                             ; $71B2
._01 dw func_018_7288                             ; $71B4
._02 dw func_018_72A5                             ; $71B6
._03 dw func_018_72C8                             ; $71B8
._04 dw func_018_72F4                             ; $71BA

Data_018_71BC::
    db   $28, $38, $48, $58, $68, $78, $38, $68, $48, $58, $48, $58, $18, $88, $28, $78
    db   $60, $40, $28, $78, $78, $28, $60, $40, $28, $78, $28, $78, $50, $50, $38, $68
    db   $50, $50, $38, $68, $38, $68, $38, $68, $38, $68, $28, $78, $38, $48, $68, $58

Data_018_71EC::
    db   $20, $30, $40, $40, $30, $20, $60, $60, $50, $70, $70, $50, $38, $38, $58, $58
    db   $70, $70, $30, $30, $70, $70, $50, $50, $30, $70, $70, $30, $30, $70, $40, $60
    db   $70, $30, $60, $40, $30, $30, $50, $50, $70, $70, $40, $40, $50, $40, $50, $40

func_018_721C::
    ldh  a, [hLinkPositionX]                      ; $721C: $F0 $98

jr_018_721E:
    push af                                       ; $721E: $F5
    ldh  a, [hLinkPositionY]                      ; $721F: $F0 $99
    push af                                       ; $7221: $F5
    ld   a, [$D205]                               ; $7222: $FA $05 $D2
    rla                                           ; $7225: $17
    and  $FE                                      ; $7226: $E6 $FE
    ld   e, a                                     ; $7228: $5F
    rla                                           ; $7229: $17
    and  $FC                                      ; $722A: $E6 $FC

jr_018_722C:
    add  e                                        ; $722C: $83
    ld   hl, wEntitiesUnknowTableY                ; $722D: $21 $D0 $C3

jr_018_7230:
    add  hl, bc                                   ; $7230: $09
    add  [hl]                                     ; $7231: $86

jr_018_7232:
    ld   e, a                                     ; $7232: $5F

jr_018_7233:
    ld   d, b                                     ; $7233: $50
    ld   hl, Data_018_71BC                        ; $7234: $21 $BC $71
    add  hl, de                                   ; $7237: $19
    ld   a, [hl]                                  ; $7238: $7E

jr_018_7239:
    ldh  [hLinkPositionX], a                      ; $7239: $E0 $98
    ld   hl, Data_018_71EC                        ; $723B: $21 $EC $71
    add  hl, de                                   ; $723E: $19
    ld   a, [hl]                                  ; $723F: $7E
    ldh  [hLinkPositionY], a                      ; $7240: $E0 $99

jr_018_7242:
    ldh  a, [hFrameCounter]                       ; $7242: $F0 $E7

jr_018_7244:
    xor  c                                        ; $7244: $A9
    and  $03                                      ; $7245: $E6 $03
    jr   nz, jr_018_724E                          ; $7247: $20 $05

    ld   a, $10                                   ; $7249: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $724B: $CD $AA $3B

jr_018_724E:
    ld   hl, hActiveEntityPosX                    ; $724E: $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ; $7251: $F0 $98
    sub  [hl]                                     ; $7253: $96
    add  $03                                      ; $7254: $C6 $03
    cp   $06                                      ; $7256: $FE $06
    jr   nc, jr_018_726D                          ; $7258: $30 $13

    ld   hl, hActiveEntityVisualPosY                                ; $725A: $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ; $725D: $F0 $99
    sub  [hl]                                     ; $725F: $96

jr_018_7260:
    add  $03                                      ; $7260: $C6 $03
    cp   $06                                      ; $7262: $FE $06
    jr   nc, jr_018_726D                          ; $7264: $30 $07

    ld   hl, $D201                                ; $7266: $21 $01 $D2
    inc  [hl]                                     ; $7269: $34
    call IncrementEntityState                     ; $726A: $CD $12 $3B

jr_018_726D:
    pop  af                                       ; $726D: $F1
    ldh  [hLinkPositionY], a                      ; $726E: $E0 $99
    pop  af                                       ; $7270: $F1
    ldh  [hLinkPositionX], a                      ; $7271: $E0 $98

func_018_7273::
    call UpdateEntityPosWithSpeed_18              ; $7273: $CD $5F $7E

label_018_7276:
    ldh  a, [hFrameCounter]                       ; $7276: $F0 $E7
    rra                                           ; $7278: $1F
    rra                                           ; $7279: $1F
    rra                                           ; $727A: $1F
    and  $01                                      ; $727B: $E6 $01
    jp   SetEntitySpriteVariant                   ; $727D: $C3 $0C $3B

Data_018_7280::
    db   $04, $0C, $14, $1C, $24, $2C, $34, $3C

func_018_7288::
    ld   a, [$D201]                               ; $7288: $FA $01 $D2
    cp   $FF                                      ; $728B: $FE $FF
    jr   nz, jr_018_72A2                          ; $728D: $20 $13

    ld   hl, wEntitiesUnknowTableY                ; $728F: $21 $D0 $C3
    add  hl, bc                                   ; $7292: $09
    ld   e, [hl]                                  ; $7293: $5E
    ld   d, b                                     ; $7294: $50
    ld   hl, Data_018_7280                        ; $7295: $21 $80 $72
    add  hl, de                                   ; $7298: $19
    ld   a, [hl]                                  ; $7299: $7E
    ld   hl, wEntitiesDropTimerTable              ; $729A: $21 $50 $C4
    add  hl, bc                                   ; $729D: $09
    ld   [hl], a                                  ; $729E: $77
    call IncrementEntityState                     ; $729F: $CD $12 $3B

jr_018_72A2:
    jp   label_018_7276                           ; $72A2: $C3 $76 $72

func_018_72A5::
    ld   hl, wEntitiesDropTimerTable              ; $72A5: $21 $50 $C4
    add  hl, bc                                   ; $72A8: $09
    ld   a, [hl]                                  ; $72A9: $7E
    and  a                                        ; $72AA: $A7
    jr   nz, jr_018_72C5                          ; $72AB: $20 $18

    ld   hl, wEntitiesPhysicsFlagsTable           ; $72AD: $21 $40 $C3
    add  hl, bc                                   ; $72B0: $09
    res  6, [hl]                                  ; $72B1: $CB $B6
    ld   a, $20                                   ; $72B3: $3E $20
    call ApplyVectorTowardsLink_trampoline        ; $72B5: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $72B8: $21 $20 $C3
    add  hl, bc                                   ; $72BB: $09
    ld   [hl], $F4                                ; $72BC: $36 $F4
    ld   a, JINGLE_GRIM_CREEPER                   ; $72BE: $3E $31
    ldh  [hJingle], a                             ; $72C0: $E0 $F2
    call IncrementEntityState                     ; $72C2: $CD $12 $3B

jr_018_72C5:
    jp   label_018_7276                           ; $72C5: $C3 $76 $72

func_018_72C8::
    call label_3B39                               ; $72C8: $CD $39 $3B
    call func_018_7273                            ; $72CB: $CD $73 $72
    call AddEntityZSpeedToPos_18                  ; $72CE: $CD $98 $7E
    ldh  a, [hFrameCounter]                       ; $72D1: $F0 $E7
    and  $03                                      ; $72D3: $E6 $03
    jr   nz, jr_018_72E1                          ; $72D5: $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ; $72D7: $21 $20 $C3
    add  hl, bc                                   ; $72DA: $09
    ld   a, [hl]                                  ; $72DB: $7E
    cp   $0C                                      ; $72DC: $FE $0C
    jr   z, jr_018_72E1                           ; $72DE: $28 $01

    inc  [hl]                                     ; $72E0: $34

jr_018_72E1:
    ldh  a, [hActiveEntityVisualPosY]             ; $72E1: $F0 $EC
    cp   $88                                      ; $72E3: $FE $88
    jr   nc, jr_018_72EC                          ; $72E5: $30 $05

    ldh  a, [hActiveEntityPosX]                   ; $72E7: $F0 $EE
    cp   $A8                                      ; $72E9: $FE $A8
    ret  c                                        ; $72EB: $D8

jr_018_72EC:
    call IncrementEntityState                     ; $72EC: $CD $12 $3B
    ld   a, $FF                                   ; $72EF: $3E $FF
    jp   SetEntitySpriteVariant                   ; $72F1: $C3 $0C $3B

func_018_72F4::
    ret                                           ; $72F4: $C9

Data_018_72F5::
    db   $7A, $16, $7E, $36, $7A, $36, $7E, $16, $7C, $16, $7C, $36

TurtleRockHeadEntityHandler::
    ldh  a, [hRoomStatus]                         ; $7301: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $7303: $E6 $20
    jp   nz, ClearEntityStatusBank18              ; $7305: $C2 $08 $7F

    ld   hl, wEntitiesPrivateState1Table          ; $7308: $21 $B0 $C2
    add  hl, bc                                   ; $730B: $09
    ld   a, [hl]                                  ; $730C: $7E
    and  a                                        ; $730D: $A7
    jr   z, jr_018_7330                           ; $730E: $28 $20

    ld   de, Data_018_72F5                        ; $7310: $11 $F5 $72
    call RenderActiveEntitySprite                 ; $7313: $CD $77 $3C
    call func_018_7DE8                            ; $7316: $CD $E8 $7D
    call UpdateEntityPosWithSpeed_18              ; $7319: $CD $5F $7E
    call AddEntityZSpeedToPos_18                  ; $731C: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $731F: $21 $20 $C3
    add  hl, bc                                   ; $7322: $09
    dec  [hl]                                     ; $7323: $35
    dec  [hl]                                     ; $7324: $35
    ld   hl, wEntitiesPosZTable                   ; $7325: $21 $10 $C3
    add  hl, bc                                   ; $7328: $09
    ld   a, [hl]                                  ; $7329: $7E
    and  $80                                      ; $732A: $E6 $80
    jp   nz, ClearEntityStatusBank18              ; $732C: $C2 $08 $7F

    ret                                           ; $732F: $C9

jr_018_7330:
    ld   hl, wEntitiesFlashCountdownTable         ; $7330: $21 $20 $C4
    add  hl, bc                                   ; $7333: $09
    ld   a, [hl]                                  ; $7334: $7E
    and  a                                        ; $7335: $A7
    jr   z, jr_018_733C                           ; $7336: $28 $04

    ld   a, $07                                   ; $7338: $3E $07
    ldh  [hActiveEntitySpriteVariant], a          ; $733A: $E0 $F1

jr_018_733C:
    call func_018_766A                            ; $733C: $CD $6A $76
    ldh  a, [hActiveEntityState]                  ; $733F: $F0 $F0
    and  a                                        ; $7341: $A7
    jr   nz, jr_018_7363                          ; $7342: $20 $1F

    ld   a, [wSelectedSongIndex]                               ; $7344: $FA $4A $DB
    cp   $02                                      ; $7347: $FE $02
    jr   nz, jr_018_7363                          ; $7349: $20 $18

    ld   a, [wLinkPlayingOcarinaCountdown]        ; $734B: $FA $66 $C1
    and  a                                        ; $734E: $A7
    jr   z, jr_018_7363                           ; $734F: $28 $12

    call IncrementEntityState                     ; $7351: $CD $12 $3B
    ld   hl, wEntitiesOptions1Table               ; $7354: $21 $30 $C4
    add  hl, bc                                   ; $7357: $09
    set  ENTITY_OPT1_B_IS_BOSS, [hl]              ; $7358: $CB $FE
    set  2, [hl]                                  ; $735A: $CB $D6
    ld   hl, wEntitiesHealthTable                 ; $735C: $21 $60 $C3
    add  hl, bc                                   ; $735F: $09
    ld   [hl], $10                                ; $7360: $36 $10
    ret                                           ; $7362: $C9

jr_018_7363:
    ldh  a, [hActiveEntityStatus]                 ; $7363: $F0 $EA
    cp   $05                                      ; $7365: $FE $05
    jr   z, jr_018_737E                           ; $7367: $28 $15

    call func_018_7F0F                            ; $7369: $CD $0F $7F
    ld   hl, wEntitiesStatusTable                 ; $736C: $21 $80 $C2
    add  hl, bc                                   ; $736F: $09
    ld   a, [hl]                                  ; $7370: $7E
    and  a                                        ; $7371: $A7
    jr   nz, jr_018_737D                          ; $7372: $20 $09

    ld   hl, wOverworldRoomStatus + $10                                ; $7374: $21 $10 $D8
    set  5, [hl]                                  ; $7377: $CB $EE
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $7379: $3E $02
    ldh  [hJingle], a                             ; $737B: $E0 $F2

jr_018_737D:
    ret                                           ; $737D: $C9

jr_018_737E:
    call func_018_7DE8                            ; $737E: $CD $E8 $7D
    call DecrementEntityIgnoreHitsCountdown       ; $7381: $CD $56 $0C
    call label_3B70                               ; $7384: $CD $70 $3B
    ldh  a, [hActiveEntityState]                  ; $7387: $F0 $F0
    cp   $05                                      ; $7389: $FE $05
    jr   nc, jr_018_7392                          ; $738B: $30 $05

    call func_018_7D36                            ; $738D: $CD $36 $7D
    jr   jr_018_7395                              ; $7390: $18 $03

jr_018_7392:
    call label_3B44                               ; $7392: $CD $44 $3B

jr_018_7395:
    ldh  a, [hActiveEntityState]                  ; $7395: $F0 $F0
    JP_TABLE                                      ; $7397
._00 dw TurtleRockHeadState0Handler
._01 dw TurtleRockHeadState1Handler
._02 dw TurtleRockHeadState2Handler
._03 dw TurtleRockHeadState3Handler
._04 dw TurtleRockHeadState4Handler
._05 dw TurtleRockHeadState5Handler
._06 dw TurtleRockHeadState6Handler
._07 dw TurtleRockHeadState7Handler
._08 dw TurtleRockHeadState8Handler
._09 dw TurtleRockHeadState9Handler
._0A dw TurtleRockHeadStateAHandler
._0B dw TurtleRockHeadStateBHandler

TurtleRockHeadState0Handler::
    ret                                           ; $73B0: $C9

TurtleRockHeadState1Handler::
    call GetEntityTransitionCountdown             ; $73B1: $CD $05 $0C
    ld   [hl], $80                                ; $73B4: $36 $80
    ld   a, MUSIC_TURTLE_ROCK_ENTRANCE_BOSS       ; $73B6: $3E $39
    ld   [wMusicTrackToPlay], a                   ; $73B8: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $73BB: $E0 $B0
    ldh  [hFFBD], a                               ; $73BD: $E0 $BD
    ldh  [hNextDefaultMusicTrack], a              ; $73BF: $E0 $BF
    jp   IncrementEntityState                     ; $73C1: $C3 $12 $3B

TurtleRockHeadState2Handler::
    ldh  a, [hActiveEntityPosX]                   ; $73C4: $F0 $EE
    ld   hl, wEntitiesUnknowTableP                ; $73C6: $21 $40 $C4
    add  hl, bc                                   ; $73C9: $09
    ld   [hl], a                                  ; $73CA: $77
    ldh  a, [hActiveEntityVisualPosY]             ; $73CB: $F0 $EC
    ld   hl, wEntitiesUnknownTableD               ; $73CD: $21 $D0 $C2
    add  hl, bc                                   ; $73D0: $09
    sub  $14                                      ; $73D1: $D6 $14
    ld   [hl], a                                  ; $73D3: $77
    call GetEntityTransitionCountdown             ; $73D4: $CD $05 $0C
    jr   nz, jr_018_73DE                          ; $73D7: $20 $05

    ld   [hl], $FF                                ; $73D9: $36 $FF
    jp   IncrementEntityState                     ; $73DB: $C3 $12 $3B

jr_018_73DE:
    ld   e, $08                                   ; $73DE: $1E $08
    and  $04                                      ; $73E0: $E6 $04
    jr   z, jr_018_73E6                           ; $73E2: $28 $02

    ld   e, $F8                                   ; $73E4: $1E $F8

jr_018_73E6:
    ld   hl, wEntitiesSpeedXTable                 ; $73E6: $21 $40 $C2
    add  hl, bc                                   ; $73E9: $09
    ld   [hl], e                                  ; $73EA: $73
    jp   AddEntitySpeedToPos_18                   ; $73EB: $C3 $6C $7E

Data_018_73EE::
    db   $F8, $08, $10, $00, $00, $08

Data_018_73F4::
    db   $F0, $00, $F0, $00, $F0, $F0

Data_018_73FA::
    db   $F8, $08, $08, $F8, $F8, $08

Data_018_7400::
    db   $FC, $02, $FC, $02, $FC, $FC

Data_018_7406::
    db   $10, $10, $10, $10, $10, $10

TurtleRockHeadState3Handler::
    call GetEntityTransitionCountdown             ; $740C: $CD $05 $0C
    jr   nz, jr_018_7416                          ; $740F: $20 $05

    ld   [hl], $80                                ; $7411: $36 $80
    jp   IncrementEntityState                     ; $7413: $C3 $12 $3B

jr_018_7416:
    and  $1F                                      ; $7416: $E6 $1F
    jr   nz, jr_018_7479                          ; $7418: $20 $5F

    ldh  a, [hActiveEntitySpriteVariant]          ; $741A: $F0 $F1
    cp   $06                                      ; $741C: $FE $06
    jr   z, jr_018_746E                           ; $741E: $28 $4E

    ld   a, $13                                   ; $7420: $3E $13
    ldh  [hNoiseSfx], a                           ; $7422: $E0 $F4
    ld   a, ENTITY_TURTLE_ROCK_HEAD               ; $7424: $3E $7F
    call SpawnNewEntity_trampoline                ; $7426: $CD $86 $3B
    push bc                                       ; $7429: $C5
    ldh  a, [hActiveEntitySpriteVariant]          ; $742A: $F0 $F1
    ld   c, a                                     ; $742C: $4F
    ld   hl, wEntitiesSpriteVariantTable          ; $742D: $21 $B0 $C3
    add  hl, de                                   ; $7430: $19
    ld   [hl], a                                  ; $7431: $77
    ld   hl, Data_018_73EE                        ; $7432: $21 $EE $73
    add  hl, bc                                   ; $7435: $09
    ldh  a, [hMultiPurpose0]                      ; $7436: $F0 $D7
    add  [hl]                                     ; $7438: $86
    ld   hl, wEntitiesPosXTable                   ; $7439: $21 $00 $C2
    add  hl, de                                   ; $743C: $19
    ld   [hl], a                                  ; $743D: $77
    ld   hl, Data_018_73F4                        ; $743E: $21 $F4 $73
    add  hl, bc                                   ; $7441: $09
    ldh  a, [hMultiPurpose1]                      ; $7442: $F0 $D8
    add  [hl]                                     ; $7444: $86
    ld   hl, wEntitiesPosYTable                   ; $7445: $21 $10 $C2
    add  hl, de                                   ; $7448: $19
    ld   [hl], a                                  ; $7449: $77
    ld   hl, Data_018_73FA                        ; $744A: $21 $FA $73
    add  hl, bc                                   ; $744D: $09
    ld   a, [hl]                                  ; $744E: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $744F: $21 $40 $C2
    add  hl, de                                   ; $7452: $19
    ld   [hl], a                                  ; $7453: $77
    ld   hl, Data_018_7400                        ; $7454: $21 $00 $74
    add  hl, bc                                   ; $7457: $09
    ld   a, [hl]                                  ; $7458: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7459: $21 $50 $C2
    add  hl, de                                   ; $745C: $19
    ld   [hl], a                                  ; $745D: $77
    ld   hl, Data_018_7406                        ; $745E: $21 $06 $74
    add  hl, bc                                   ; $7461: $09
    ld   a, [hl]                                  ; $7462: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $7463: $21 $20 $C3
    add  hl, de                                   ; $7466: $19
    ld   [hl], a                                  ; $7467: $77
    ld   hl, wEntitiesPrivateState1Table          ; $7468: $21 $B0 $C2
    add  hl, de                                   ; $746B: $19
    ld   [hl], a                                  ; $746C: $77
    pop  bc                                       ; $746D: $C1

jr_018_746E:
    ld   hl, wEntitiesSpriteVariantTable          ; $746E: $21 $B0 $C3
    add  hl, bc                                   ; $7471: $09
    ld   a, [hl]                                  ; $7472: $7E
    cp   $07                                      ; $7473: $FE $07
    jr   z, jr_018_7479                           ; $7475: $28 $02

    inc  a                                        ; $7477: $3C
    ld   [hl], a                                  ; $7478: $77

jr_018_7479:
    ret                                           ; $7479: $C9

TurtleRockHeadState4Handler::
    call GetEntityTransitionCountdown             ; $747A: $CD $05 $0C
    jr   nz, jr_018_7484                          ; $747D: $20 $05

    ld   [hl], $80                                ; $747F: $36 $80
    jp   IncrementEntityState                     ; $7481: $C3 $12 $3B

jr_018_7484:
    ld   e, $07                                   ; $7484: $1E $07
    cp   $60                                      ; $7486: $FE $60
    jr   nc, jr_018_7496                          ; $7488: $30 $0C

    cp   $40                                      ; $748A: $FE $40
    jr   nc, jr_018_7497                          ; $748C: $30 $09

    cp   $30                                      ; $748E: $FE $30
    jr   c, jr_018_7496                           ; $7490: $38 $04

    cp   $20                                      ; $7492: $FE $20
    jr   c, jr_018_7497                           ; $7494: $38 $01

jr_018_7496:
    inc  e                                        ; $7496: $1C

jr_018_7497:
    ld   a, e                                     ; $7497: $7B
    jp   SetEntitySpriteVariant                   ; $7498: $C3 $0C $3B

TurtleRockHeadState5Handler::
    call GetEntityTransitionCountdown             ; $749B: $CD $05 $0C
    jr   nz, jr_018_74BC                          ; $749E: $20 $1C

    ld   [hl], $40                                ; $74A0: $36 $40
    ld   hl, wEntitiesPhysicsFlagsTable           ; $74A2: $21 $40 $C3
    add  hl, bc                                   ; $74A5: $09
    res  7, [hl]                                  ; $74A6: $CB $BE
    ld   hl, wEntitiesOptions1Table               ; $74A8: $21 $30 $C4
    add  hl, bc                                   ; $74AB: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $74AC: $CB $B6
    call IncrementEntityState                     ; $74AE: $CD $12 $3B
    ldh  a, [hActiveEntityPosX]                   ; $74B1: $F0 $EE
    ld   [$D201], a                               ; $74B3: $EA $01 $D2
    ldh  a, [hActiveEntityVisualPosY]             ; $74B6: $F0 $EC
    ld   [$D202], a                               ; $74B8: $EA $02 $D2
    ret                                           ; $74BB: $C9

jr_018_74BC:
    ld   hl, wEntitiesSpeedYTable                 ; $74BC: $21 $50 $C2
    add  hl, bc                                   ; $74BF: $09
    ld   [hl], $04                                ; $74C0: $36 $04
    jp   UpdateEntityYPosWithSpeed_18             ; $74C2: $C3 $62 $7E

TurtleRockHeadState6Handler::
    call GetEntityTransitionCountdown             ; $74C5: $CD $05 $0C
    ret  nz                                       ; $74C8: $C0

    ld   [hl], $20                                ; $74C9: $36 $20
    ld   hl, wEntitiesSpeedXTable                 ; $74CB: $21 $40 $C2
    add  hl, bc                                   ; $74CE: $09
    ld   [hl], $08                                ; $74CF: $36 $08
    jp   IncrementEntityState                     ; $74D1: $C3 $12 $3B

TurtleRockHeadState7Handler::
    call GetEntityTransitionCountdown             ; $74D4: $CD $05 $0C
    jr   nz, jr_018_74E7                          ; $74D7: $20 $0E

    call GetEntityTransitionCountdown             ; $74D9: $CD $05 $0C
    call GetRandomByte                            ; $74DC: $CD $0D $28
    and  $1F                                      ; $74DF: $E6 $1F
    add  $08                                      ; $74E1: $C6 $08
    ld   [hl], a                                  ; $74E3: $77
    call IncrementEntityState                     ; $74E4: $CD $12 $3B

jr_018_74E7:
    jp   AddEntitySpeedToPos_18                   ; $74E7: $C3 $6C $7E

TurtleRockHeadState8Handler::
    call GetEntityTransitionCountdown             ; $74EA: $CD $05 $0C
    jr   nz, jr_018_751E                          ; $74ED: $20 $2F

    ld   hl, wEntitiesUnknowTableR                ; $74EF: $21 $90 $C3
    add  hl, bc                                   ; $74F2: $09
    inc  [hl]                                     ; $74F3: $34
    ld   a, [hl]                                  ; $74F4: $7E
    cp   $03                                      ; $74F5: $FE $03
    jr   c, jr_018_750C                           ; $74F7: $38 $13

    call GetRandomByte                            ; $74F9: $CD $0D $28
    and  $01                                      ; $74FC: $E6 $01
    jr   nz, jr_018_750C                          ; $74FE: $20 $0C

    call IncrementEntityState                     ; $7500: $CD $12 $3B
    ld   a, $09                                   ; $7503: $3E $09
    ld   [hl], a                                  ; $7505: $77
    call GetEntityTransitionCountdown             ; $7506: $CD $05 $0C
    ld   [hl], $20                                ; $7509: $36 $20
    ret                                           ; $750B: $C9

jr_018_750C:
    call GetEntityTransitionCountdown             ; $750C: $CD $05 $0C
    ld   [hl], $40                                ; $750F: $36 $40
    call IncrementEntityState                     ; $7511: $CD $12 $3B
    dec  [hl]                                     ; $7514: $35
    dec  [hl]                                     ; $7515: $35
    ld   hl, wEntitiesSpeedXTable                 ; $7516: $21 $40 $C2
    add  hl, bc                                   ; $7519: $09
    ld   a, [hl]                                  ; $751A: $7E
    cpl                                           ; $751B: $2F
    inc  a                                        ; $751C: $3C
    ld   [hl], a                                  ; $751D: $77

jr_018_751E:
    ret                                           ; $751E: $C9

TurtleRockHeadState9Handler::
    call GetEntityTransitionCountdown             ; $751F: $CD $05 $0C
    ret  nz                                       ; $7522: $C0

    ld   [hl], $20                                ; $7523: $36 $20
    ld   a, $18                                   ; $7525: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $7527: $CD $AA $3B
    ld   hl, wEntitiesSpeedYTable                 ; $752A: $21 $50 $C2
    add  hl, bc                                   ; $752D: $09
    ld   a, [hl]                                  ; $752E: $7E
    bit  7, [hl]                                  ; $752F: $CB $7E
    jr   z, jr_018_7536                           ; $7531: $28 $03

    cpl                                           ; $7533: $2F
    inc  a                                        ; $7534: $3C
    ld   [hl], a                                  ; $7535: $77

jr_018_7536:
    jp   IncrementEntityState                     ; $7536: $C3 $12 $3B

TurtleRockHeadStateAHandler::
    ld   hl, wEntitiesFlashCountdownTable         ; $7539: $21 $20 $C4
    add  hl, bc                                   ; $753C: $09
    ld   a, [hl]                                  ; $753D: $7E
    and  a                                        ; $753E: $A7
    jr   nz, jr_018_7546                          ; $753F: $20 $05

    call GetEntityTransitionCountdown             ; $7541: $CD $05 $0C
    jr   nz, jr_018_7549                          ; $7544: $20 $03

jr_018_7546:
    call IncrementEntityState                     ; $7546: $CD $12 $3B

jr_018_7549:
    jp   UpdateEntityPosWithSpeed_18              ; $7549: $C3 $5F $7E

TurtleRockHeadStateBHandler::
    ldh  a, [hLinkPositionX]                      ; $754C: $F0 $98
    push af                                       ; $754E: $F5
    ldh  a, [hLinkPositionY]                      ; $754F: $F0 $99
    push af                                       ; $7551: $F5
    ld   a, [$D201]                               ; $7552: $FA $01 $D2
    ldh  [hLinkPositionX], a                      ; $7555: $E0 $98
    ld   a, [$D202]                               ; $7557: $FA $02 $D2
    ldh  [hLinkPositionY], a                      ; $755A: $E0 $99
    ld   a, $08                                   ; $755C: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $755E: $CD $AA $3B
    ld   a, [$D201]                               ; $7561: $FA $01 $D2
    ld   hl, hActiveEntityPosX                    ; $7564: $21 $EE $FF
    sub  [hl]                                     ; $7567: $96
    add  $01                                      ; $7568: $C6 $01
    cp   $02                                      ; $756A: $FE $02
    jr   nc, jr_018_7585                          ; $756C: $30 $17

    ld   a, [$D202]                               ; $756E: $FA $02 $D2
    ld   hl, hActiveEntityVisualPosY                                ; $7571: $21 $EC $FF
    sub  [hl]                                     ; $7574: $96
    add  $01                                      ; $7575: $C6 $01
    cp   $02                                      ; $7577: $FE $02
    jr   nc, jr_018_7585                          ; $7579: $30 $0A

    call IncrementEntityState                     ; $757B: $CD $12 $3B
    ld   [hl], $06                                ; $757E: $36 $06
    call GetEntityTransitionCountdown             ; $7580: $CD $05 $0C
    ld   [hl], $20                                ; $7583: $36 $20

jr_018_7585:
    pop  af                                       ; $7585: $F1
    ldh  [hLinkPositionY], a                      ; $7586: $E0 $99
    pop  af                                       ; $7588: $F1
    ldh  [hLinkPositionX], a                      ; $7589: $E0 $98
    jp   UpdateEntityPosWithSpeed_18              ; $758B: $C3 $5F $7E

Data_018_758E::
    db   $F0, $F8, $7A, $16, $F0, $00, $7C, $16, $F0, $08, $7C, $36, $F0, $10, $7A, $36
    db   $00, $00, $7E, $16, $00, $08, $7E, $36, $F0, $F8, $70, $07, $F0, $00, $7C, $16
    db   $F0, $08, $7C, $36, $F0, $10, $7A, $36, $00, $00, $7E, $16, $00, $08, $7E, $36
    db   $F0, $F8, $70, $07, $F0, $00, $7C, $16, $F0, $08, $7C, $36, $F0, $10, $7A, $36
    db   $00, $00, $7E, $16, $00, $08, $74, $27, $F0, $F8, $70, $07, $F0, $00, $7C, $16
    db   $F0, $08, $7C, $36, $F0, $10, $70, $27, $00, $00, $7E, $16, $00, $08, $74, $27
    db   $F0, $F8, $70, $07, $F0, $00, $7C, $16, $F0, $08, $7C, $36, $F0, $10, $70, $27
    db   $00, $00, $74, $07, $00, $08, $74, $27, $F0, $F8, $70, $07, $F0, $00, $78, $07
    db   $F0, $08, $7C, $36, $F0, $10, $70, $27, $00, $00, $74, $07, $00, $08, $74, $27
    db   $F0, $F8, $70, $07, $F0, $00, $78, $07, $F0, $08, $78, $27, $F0, $10, $70, $27
    db   $00, $00, $74, $07, $00, $08, $74, $27, $F0, $F8, $70, $07, $F0, $00, $78, $07
    db   $F0, $08, $78, $27, $F0, $10, $70, $27, $00, $00, $74, $07, $00, $08, $74, $27
    db   $F0, $F8, $70, $07, $F0, $00, $72, $07, $F0, $08, $72, $27, $F0, $10, $70, $27
    db   $00, $00, $74, $07, $00, $08, $74, $27

Data_018_7666::
    db   $76, $07, $76, $27

func_018_766A::
    ldh  a, [hActiveEntitySpriteVariant]          ; $766A: $F0 $F1
    rla                                           ; $766C: $17
    rla                                           ; $766D: $17
    rla                                           ; $766E: $17
    and  $F8                                      ; $766F: $E6 $F8
    ld   e, a                                     ; $7671: $5F
    rla                                           ; $7672: $17
    add  e                                        ; $7673: $83
    ld   e, a                                     ; $7674: $5F
    ld   d, b                                     ; $7675: $50
    ld   hl, Data_018_758E                        ; $7676: $21 $8E $75
    add  hl, de                                   ; $7679: $19
    ld   c, $06                                   ; $767A: $0E $06
    call RenderActiveEntitySpritesRect            ; $767C: $CD $E6 $3C
    ld   a, $06                                   ; $767F: $3E $06
    call label_3DA0                               ; $7681: $CD $A0 $3D
    ldh  a, [hActiveEntityStatus]                 ; $7684: $F0 $EA
    cp   $01                                      ; $7686: $FE $01
    jr   z, jr_018_7691                           ; $7688: $28 $07

    ldh  a, [hActiveEntityState]                  ; $768A: $F0 $F0
    cp   $05                                      ; $768C: $FE $05
    jp   c, label_018_7726                        ; $768E: $DA $26 $77

jr_018_7691:
    ld   hl, wEntitiesUnknowTableP                ; $7691: $21 $40 $C4
    add  hl, bc                                   ; $7694: $09
    ld   a, [hl]                                  ; $7695: $7E
    ldh  [hMultiPurposeG], a                               ; $7696: $E0 $E8
    ldh  a, [hActiveEntityPosX]                   ; $7698: $F0 $EE
    sub  [hl]                                     ; $769A: $96
    sra  a                                        ; $769B: $CB $2F
    ldh  [hBGMapOffsetLow], a                     ; $769D: $E0 $E1
    sra  a                                        ; $769F: $CB $2F
    ldh  [hMultiPurposeB], a                           ; $76A1: $E0 $E2
    sra  a                                        ; $76A3: $CB $2F
    ldh  [hMultiPurposeC], a                           ; $76A5: $E0 $E3
    sra  a                                        ; $76A7: $CB $2F
    ldh  [hMultiPurposeD], a                           ; $76A9: $E0 $E4
    sra  a                                        ; $76AB: $CB $2F
    ldh  [hMultiPurposeE], a                           ; $76AD: $E0 $E5
    sra  a                                        ; $76AF: $CB $2F
    ldh  [hFreeWarpDataAddress], a                ; $76B1: $E0 $E6
    ld   hl, wEntitiesUnknownTableD               ; $76B3: $21 $D0 $C2
    add  hl, bc                                   ; $76B6: $09
    ld   a, [hl]                                  ; $76B7: $7E
    ldh  [hMultiPurposeH], a                               ; $76B8: $E0 $E9
    ldh  a, [hActiveEntityVisualPosY]             ; $76BA: $F0 $EC
    sub  $20                                      ; $76BC: $D6 $20
    cp   [hl]                                     ; $76BE: $BE
    jr   c, label_018_7726                        ; $76BF: $38 $65

    ldh  [hActiveEntityVisualPosY], a             ; $76C1: $E0 $EC
    xor  a                                        ; $76C3: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $76C4: $E0 $F1
    ld   hl, hBGMapOffsetLow                      ; $76C6: $21 $E1 $FF

jr_018_76C9:
    ldh  a, [hMultiPurposeG]                               ; $76C9: $F0 $E8
    add  [hl]                                     ; $76CB: $86
    ldh  [hActiveEntityPosX], a                   ; $76CC: $E0 $EE
    inc  hl                                       ; $76CE: $23
    push hl                                       ; $76CF: $E5
    ld   de, Data_018_7666                        ; $76D0: $11 $66 $76
    call RenderActiveEntitySpritesPair            ; $76D3: $CD $C0 $3B
    ld   a, [wInvincibilityCounter]               ; $76D6: $FA $C7 $DB
    and  a                                        ; $76D9: $A7
    jr   nz, jr_018_7717                          ; $76DA: $20 $3B

    ld   hl, hActiveEntityVisualPosY                                ; $76DC: $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ; $76DF: $F0 $99
    sub  [hl]                                     ; $76E1: $96
    add  $0C                                      ; $76E2: $C6 $0C
    cp   $18                                      ; $76E4: $FE $18
    jr   nc, jr_018_7717                          ; $76E6: $30 $2F

    ld   hl, hActiveEntityPosX                    ; $76E8: $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ; $76EB: $F0 $98
    sub  [hl]                                     ; $76ED: $96
    ld   e, a                                     ; $76EE: $5F
    add  $0C                                      ; $76EF: $C6 $0C
    cp   $18                                      ; $76F1: $FE $18
    jr   nc, jr_018_7717                          ; $76F3: $30 $22

    ld   a, e                                     ; $76F5: $7B
    ld   e, $20                                   ; $76F6: $1E $20
    and  $80                                      ; $76F8: $E6 $80
    jr   z, jr_018_76FE                           ; $76FA: $28 $02

    ld   e, $E0                                   ; $76FC: $1E $E0

jr_018_76FE:
    ld   a, e                                     ; $76FE: $7B
    ldh  [hLinkSpeedX], a                         ; $76FF: $E0 $9A
    xor  a                                        ; $7701: $AF
    ldh  [hLinkSpeedY], a                         ; $7702: $E0 $9B
    ld   a, $18                                   ; $7704: $3E $18
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $7706: $EA $3E $C1
    ld   a, $10                                   ; $7709: $3E $10
    ld   [wInvincibilityCounter], a               ; $770B: $EA $C7 $DB
    ld   a, $08                                   ; $770E: $3E $08
    ld   [wSubtractHealthBuffer], a               ; $7710: $EA $94 $DB
    ld   a, $03                                   ; $7713: $3E $03
    ldh  [hWaveSfx], a                            ; $7715: $E0 $F3

jr_018_7717:
    pop  hl                                       ; $7717: $E1
    ldh  a, [hMultiPurposeH]                               ; $7718: $F0 $E9
    ld   e, a                                     ; $771A: $5F
    ldh  a, [hActiveEntityVisualPosY]             ; $771B: $F0 $EC
    sub  $10                                      ; $771D: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $771F: $E0 $EC
    sub  e                                        ; $7721: $93
    and  $80                                      ; $7722: $E6 $80
    jr   z, jr_018_76C9                           ; $7724: $28 $A3

label_018_7726:
    jp   CopyEntityPositionToActivePosition       ; $7726: $C3 $8A $3D

; Note: this entity, unlike most others, use 3 spriteslots (out of 4 available).
;
; In usual gameplay, only 2 spriteslots are updated during a room transition.
; The map transition code is special-cased for the color-dungeon to handle this.
Data_018_7729::
    db   $62, $00, $64, $00, $60, $00, $60, $20, $64, $20, $62, $20, $66, $00, $68, $00
    db   $60, $00, $60, $20, $68, $20, $66, $20, $6C, $00, $6E, $00, $6A, $00, $6A, $20
    db   $6E, $20, $6C, $20

Data_018_774D::
    db   $00, $01, $02, $01

Data_018_7751::
    db   $03, $04, $05, $04

Data_018_7755::
    db   $06, $07, $08, $07

BuzzBlobEntityHandler::
    ldh  a, [hMapId]                              ; $7759: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $775B: $FE $FF
    jr   nz, jr_018_7764                          ; $775D: $20 $05

    ld   a, $18                                   ; $775F: $3E $18
    jp   func_036_4F68_trampoline                 ; $7761: $C3 $77 $0A

jr_018_7764:
    ld   de, Data_018_7729                        ; $7764: $11 $29 $77
    call RenderActiveEntitySpritesPair            ; $7767: $CD $C0 $3B
    call func_018_7DE8                            ; $776A: $CD $E8 $7D
    call func_018_7E15                            ; $776D: $CD $15 $7E
    call label_3B39                               ; $7770: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $7773: $F0 $F0
    JP_TABLE                                      ; $7775
._00 dw BuzzBlobState0Handler
._01 dw BuzzBlobState1Handler

Data_018_777A::
    db   $FA, $FC

Data_018_777C::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

BuzzBlobState0Handler::
    call GetEntityTransitionCountdown             ; $7784: $CD $05 $0C
    jr   nz, jr_018_77A9                          ; $7787: $20 $20

    call GetRandomByte                            ; $7789: $CD $0D $28
    and  $3F                                      ; $778C: $E6 $3F
    add  $30                                      ; $778E: $C6 $30
    ld   [hl], a                                  ; $7790: $77
    and  $07                                      ; $7791: $E6 $07
    ld   e, a                                     ; $7793: $5F
    ld   d, b                                     ; $7794: $50
    ld   hl, Data_018_777C                        ; $7795: $21 $7C $77
    add  hl, de                                   ; $7798: $19
    ld   a, [hl]                                  ; $7799: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $779A: $21 $40 $C2
    add  hl, bc                                   ; $779D: $09
    ld   [hl], a                                  ; $779E: $77
    ld   hl, Data_018_777A                        ; $779F: $21 $7A $77
    add  hl, de                                   ; $77A2: $19
    ld   a, [hl]                                  ; $77A3: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $77A4: $21 $50 $C2
    add  hl, bc                                   ; $77A7: $09
    ld   [hl], a                                  ; $77A8: $77

jr_018_77A9:
    call UpdateEntityPosWithSpeed_18              ; $77A9: $CD $5F $7E
    call label_3B23                               ; $77AC: $CD $23 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $77AF: $21 $B0 $C2
    add  hl, bc                                   ; $77B2: $09
    ld   a, [hl]                                  ; $77B3: $7E
    ld   hl, Data_018_774D                        ; $77B4: $21 $4D $77
    and  a                                        ; $77B7: $A7

jr_018_77B8:
    jr   z, label_018_77CF                        ; $77B8: $28 $15

    call func_018_7D95                            ; $77BA: $CD $95 $7D
    jr   nc, jr_018_77CC                          ; $77BD: $30 $0D

    ld   hl, wEntitiesPrivateState2Table          ; $77BF: $21 $C0 $C2
    add  hl, bc                                   ; $77C2: $09
    ld   a, [hl]                                  ; $77C3: $7E
    and  $03                                      ; $77C4: $E6 $03
    add  $7C                                      ; $77C6: $C6 $7C
    inc  [hl]                                     ; $77C8: $34
    call OpenDialogInTable2                       ; $77C9: $CD $7C $23

jr_018_77CC:
    ld   hl, Data_018_7755                        ; $77CC: $21 $55 $77

label_018_77CF:
    ldh  a, [hFrameCounter]                       ; $77CF: $F0 $E7
    rra                                           ; $77D1: $1F
    rra                                           ; $77D2: $1F
    rra                                           ; $77D3: $1F
    and  $03                                      ; $77D4: $E6 $03
    ld   e, a                                     ; $77D6: $5F
    ld   d, b                                     ; $77D7: $50
    add  hl, de                                   ; $77D8: $19
    ld   a, [hl]                                  ; $77D9: $7E
    jp   SetEntitySpriteVariant                   ; $77DA: $C3 $0C $3B

BuzzBlobState1Handler::
    call GetEntityTransitionCountdown             ; $77DD: $CD $05 $0C
    jr   nz, jr_018_77E7                          ; $77E0: $20 $05

    call IncrementEntityState                     ; $77E2: $CD $12 $3B
    ld   [hl], b                                  ; $77E5: $70
    ret                                           ; $77E6: $C9

jr_018_77E7:
    ld   hl, Data_018_7751                        ; $77E7: $21 $51 $77
    jp   label_018_77CF                           ; $77EA: $C3 $CF $77

Data_018_77ED::
    db   $00, $FC, $70, $02, $00, $04, $72, $02, $00, $0C, $70, $22, $00, $FC, $74, $02
    db   $00, $04, $72, $02, $00, $0C, $74, $22, $00, $FC, $76, $02, $00, $04, $72, $02
    db   $00, $0C, $76, $22, $00, $FC, $74, $02, $00, $04, $72, $02, $00, $0C, $74, $22

Data_018_781D::
    db   $10, $11, $12, $11

BomberEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $7821: $F0 $F1
    rla                                           ; $7823: $17
    rla                                           ; $7824: $17
    and  $FC                                      ; $7825: $E6 $FC
    ld   e, a                                     ; $7827: $5F
    rla                                           ; $7828: $17
    and  $F8                                      ; $7829: $E6 $F8
    add  e                                        ; $782B: $83
    ld   e, a                                     ; $782C: $5F
    ld   d, b                                     ; $782D: $50
    ld   hl, Data_018_77ED                        ; $782E: $21 $ED $77
    add  hl, de                                   ; $7831: $19
    ld   c, $03                                   ; $7832: $0E $03
    call RenderActiveEntitySpritesRect            ; $7834: $CD $E6 $3C
    call func_018_7DE8                            ; $7837: $CD $E8 $7D
    call label_3CD9                               ; $783A: $CD $D9 $3C
    ld   hl, wEntitiesUnknowTableY                ; $783D: $21 $D0 $C3
    add  hl, bc                                   ; $7840: $09
    ld   a, [hl]                                  ; $7841: $7E
    rra                                           ; $7842: $1F
    rra                                           ; $7843: $1F
    rra                                           ; $7844: $1F
    and  $03                                      ; $7845: $E6 $03
    ld   e, a                                     ; $7847: $5F
    ld   d, b                                     ; $7848: $50
    ld   hl, Data_018_781D                        ; $7849: $21 $1D $78
    add  hl, de                                   ; $784C: $19
    ld   a, [hl]                                  ; $784D: $7E
    ld   hl, wEntitiesPosZTable                   ; $784E: $21 $10 $C3
    add  hl, bc                                   ; $7851: $09
    ld   [hl], a                                  ; $7852: $77
    call func_018_7E15                            ; $7853: $CD $15 $7E
    call UpdateEntityPosWithSpeed_18              ; $7856: $CD $5F $7E
    call label_3B23                               ; $7859: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $785C: $F0 $F0
    JP_TABLE                                      ; $785E
._00 dw BomberState0Handler
._01 dw BomberState1Handler
._02 dw BomberState2Handler

Data_018_7865::
    db   $F8, $FA

Data_018_7867::
    db   $00

func_018_7868::
    ld   b, $08                                   ; $7868: $06 $08
    ld   b, $00                                   ; $786A: $06 $00
    ld   a, [$FAF8]                               ; $786C: $FA $F8 $FA

BomberState0Handler::
    call GetEntityTransitionCountdown             ; $786F: $CD $05 $0C
    jr   nz, label_018_78A6                       ; $7872: $20 $32

    call GetRandomByte                            ; $7874: $CD $0D $28
    and  $1F                                      ; $7877: $E6 $1F
    add  $20                                      ; $7879: $C6 $20
    ld   [hl], a                                  ; $787B: $77
    and  $07                                      ; $787C: $E6 $07
    ld   e, a                                     ; $787E: $5F
    ld   d, b                                     ; $787F: $50
    ld   hl, Data_018_7867                        ; $7880: $21 $67 $78
    add  hl, de                                   ; $7883: $19
    ld   a, [hl]                                  ; $7884: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7885: $21 $40 $C2
    add  hl, bc                                   ; $7888: $09
    ld   [hl], a                                  ; $7889: $77
    ld   hl, Data_018_7865                        ; $788A: $21 $65 $78
    add  hl, de                                   ; $788D: $19
    ld   a, [hl]                                  ; $788E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $788F: $21 $50 $C2
    add  hl, bc                                   ; $7892: $09
    ld   [hl], a                                  ; $7893: $77
    ld   hl, wEntitiesPrivateState1Table          ; $7894: $21 $B0 $C2
    add  hl, bc                                   ; $7897: $09
    inc  [hl]                                     ; $7898: $34
    ld   a, [hl]                                  ; $7899: $7E
    and  $07                                      ; $789A: $E6 $07
    jr   nz, jr_018_78A3                          ; $789C: $20 $05

    ld   a, $0A                                   ; $789E: $3E $0A
    call ApplyVectorTowardsLink_trampoline        ; $78A0: $CD $AA $3B

jr_018_78A3:
    call IncrementEntityState                     ; $78A3: $CD $12 $3B

label_018_78A6:
    ld   hl, wEntitiesUnknowTableY                ; $78A6: $21 $D0 $C3
    add  hl, bc                                   ; $78A9: $09
    ld   a, [hl]                                  ; $78AA: $7E
    inc  [hl]                                     ; $78AB: $34
    and  $7F                                      ; $78AC: $E6 $7F
    jr   nz, jr_018_78F1                          ; $78AE: $20 $41

    ld   a, ENTITY_BOMB                           ; $78B0: $3E $02
    call SpawnNewEntity_trampoline                ; $78B2: $CD $86 $3B
    jr   c, jr_018_78F1                           ; $78B5: $38 $3A

    ld   hl, wEntitiesOptions1Table               ; $78B7: $21 $30 $C4
    add  hl, de                                   ; $78BA: $19
    res  0, [hl]                                  ; $78BB: $CB $86
    ldh  a, [hMultiPurpose0]                      ; $78BD: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $78BF: $21 $00 $C2
    add  hl, de                                   ; $78C2: $19
    ld   [hl], a                                  ; $78C3: $77
    ldh  a, [hMultiPurpose1]                      ; $78C4: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $78C6: $21 $10 $C2
    add  hl, de                                   ; $78C9: $19
    ld   [hl], a                                  ; $78CA: $77
    ldh  a, [hMultiPurpose3]                      ; $78CB: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $78CD: $21 $10 $C3
    add  hl, de                                   ; $78D0: $19
    ld   [hl], a                                  ; $78D1: $77
    ld   hl, wEntitiesSpeedZTable                 ; $78D2: $21 $20 $C3
    add  hl, de                                   ; $78D5: $19
    ld   [hl], $08                                ; $78D6: $36 $08
    ld   hl, wEntitiesTransitionCountdownTable    ; $78D8: $21 $E0 $C2
    add  hl, de                                   ; $78DB: $19
    ld   [hl], $40                                ; $78DC: $36 $40
    ld   hl, wEntitiesUnknowTableP                ; $78DE: $21 $40 $C4
    add  hl, de                                   ; $78E1: $19
    ld   [hl], $01                                ; $78E2: $36 $01
    push bc                                       ; $78E4: $C5
    ld   c, e                                     ; $78E5: $4B
    ld   b, d                                     ; $78E6: $42
    ld   a, $10                                   ; $78E7: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $78E9: $CD $AA $3B
    pop  bc                                       ; $78EC: $C1
    ld   a, JINGLE_JUMP_DOWN                      ; $78ED: $3E $08
    ldh  [hJingle], a                             ; $78EF: $E0 $F2

jr_018_78F1:
    call func_018_7EE1                            ; $78F1: $CD $E1 $7E
    ldh  a, [hLinkDirection]                      ; $78F4: $F0 $9E
    xor  $01                                      ; $78F6: $EE $01
    cp   e                                        ; $78F8: $BB
    jr   nz, jr_018_7935                          ; $78F9: $20 $3A

    call func_018_7EB2                            ; $78FB: $CD $B2 $7E
    add  $20                                      ; $78FE: $C6 $20
    cp   $40                                      ; $7900: $FE $40
    jr   nc, jr_018_7935                          ; $7902: $30 $31

    call func_018_7ED2                            ; $7904: $CD $D2 $7E
    add  $20                                      ; $7907: $C6 $20
    cp   $40                                      ; $7909: $FE $40
    jr   nc, jr_018_7935                          ; $790B: $30 $28
    ; if wSwordAnimationState == SWORD_ANIMATION_STATE_NONE jump to jr_018_7935
    ld   a, [wSwordAnimationState]                ; $790D: $FA $37 $C1
    and  a                                        ; $7910: $A7
    jr   z, jr_018_7935                           ; $7911: $28 $22

    call IncrementEntityState                     ; $7913: $CD $12 $3B
    ld   [hl], $02                                ; $7916: $36 $02
    call GetEntityTransitionCountdown             ; $7918: $CD $05 $0C
    ld   [hl], $12                                ; $791B: $36 $12
    ld   a, $20                                   ; $791D: $3E $20
    call GetVectorTowardsLink_trampoline          ; $791F: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $7922: $F0 $D7
    cpl                                           ; $7924: $2F
    inc  a                                        ; $7925: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $7926: $21 $50 $C2
    add  hl, bc                                   ; $7929: $09
    ld   [hl], a                                  ; $792A: $77
    ldh  a, [hMultiPurpose1]                      ; $792B: $F0 $D8
    cpl                                           ; $792D: $2F
    inc  a                                        ; $792E: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $792F: $21 $40 $C2
    add  hl, bc                                   ; $7932: $09
    ld   [hl], a                                  ; $7933: $77
    ret                                           ; $7934: $C9

jr_018_7935:
    call label_3B39                               ; $7935: $CD $39 $3B

label_018_7938:
    ldh  a, [hFrameCounter]                       ; $7938: $F0 $E7
    rra                                           ; $793A: $1F
    rra                                           ; $793B: $1F
    and  $03                                      ; $793C: $E6 $03
    jp   SetEntitySpriteVariant                   ; $793E: $C3 $0C $3B

BomberState1Handler::
    call GetEntityTransitionCountdown             ; $7941: $CD $05 $0C
    jr   nz, jr_018_794F                          ; $7944: $20 $09

    ld   [hl], $20                                ; $7946: $36 $20
    call IncrementEntityState                     ; $7948: $CD $12 $3B
    ld   [hl], b                                  ; $794B: $70
    call ClearEntitySpeed                         ; $794C: $CD $7F $3D

jr_018_794F:
    jp   label_018_78A6                           ; $794F: $C3 $A6 $78

BomberState2Handler::
    call GetEntityTransitionCountdown             ; $7952: $CD $05 $0C
    jr   nz, jr_018_795B                          ; $7955: $20 $04

    call IncrementEntityState                     ; $7957: $CD $12 $3B
    ld   [hl], b                                  ; $795A: $70

jr_018_795B:
    jp   label_018_7938                           ; $795B: $C3 $38 $79

Data_018_795E::
    db   $6C, $74, $6D, $75

Data_018_7962::
    db   $64, $74, $65, $75

MagicPowderSprinkleEntityHandler::
    call func_018_7B02                            ; $7966: $CD $02 $7B
    call func_018_7DE8                            ; $7969: $CD $E8 $7D
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
    ldh  [hSwordIntersectedAreaX], a              ; $7989: $E0 $CE
    swap a                                        ; $798B: $CB $37
    ld   hl, wEntitiesPosYTable                   ; $798D: $21 $10 $C2
    add  hl, bc                                   ; $7990: $09
    ld   c, a                                     ; $7991: $4F
    ld   a, [hl]                                  ; $7992: $7E
    add  $07                                      ; $7993: $C6 $07
    sub  $10                                      ; $7995: $D6 $10
    and  $F0                                      ; $7997: $E6 $F0
    ldh  [hSwordIntersectedAreaY], a              ; $7999: $E0 $CD
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
    jr   z, jr_018_79B3                           ; $79AD: $28 $04

    cp   $5C                                      ; $79AF: $FE $5C
    jr   nz, jr_018_79CF                          ; $79B1: $20 $1C

jr_018_79B3:
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
    jr   z, jr_018_79F0                           ; $79DE: $28 $10

    ld   a, [wLinkMotionState]                    ; $79E0: $FA $1C $C1
    cp   $05                                      ; $79E3: $FE $05
    ret  z                                        ; $79E5: $C8

    ld   a, [wDDD6]                               ; $79E6: $FA $D6 $DD
    and  a                                        ; $79E9: $A7
    ret  nz                                       ; $79EA: $C0

    ld   a, [wRoomTransitionState]                ; $79EB: $FA $24 $C1
    and  a                                        ; $79EE: $A7
    ret  nz                                       ; $79EF: $C0

jr_018_79F0:
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
    ldh  a, [hSwordIntersectedAreaX]              ; $7A11: $F0 $CE
    ld   [hl], a                                  ; $7A13: $77
    ld   hl, wEntitiesPosYTable                   ; $7A14: $21 $10 $C2
    add  hl, bc                                   ; $7A17: $09
    ldh  a, [hSwordIntersectedAreaY]              ; $7A18: $F0 $CD
    ld   [hl], a                                  ; $7A1A: $77
    ld   hl, wC1A2                                ; $7A1B: $21 $A2 $C1
    inc  [hl]                                     ; $7A1E: $34
    ld   a, [wC3CD]                               ; $7A1F: $FA $CD $C3
    and  a                                        ; $7A22: $A7
    jr   z, jr_018_7A39                           ; $7A23: $28 $14

    sub  $04                                      ; $7A25: $D6 $04
    ld   [wC3CD], a                               ; $7A27: $EA $CD $C3
    ldh  a, [hIsGBC]                              ; $7A2A: $F0 $FE
    and  a                                        ; $7A2C: $A7
    jr   z, jr_018_7A39                           ; $7A2D: $28 $0A

    ld   a, $40                                   ; $7A2F: $3E $40
    ld   [wDDD6], a                               ; $7A31: $EA $D6 $DD
    ld   a, $0B                                   ; $7A34: $3E $0B
    ld   [wDDD7], a                               ; $7A36: $EA $D7 $DD

jr_018_7A39:
    call GetEntityTransitionCountdown             ; $7A39: $CD $05 $0C
    ld   [hl], b                                  ; $7A3C: $70
    ld   a, $12                                   ; $7A3D: $3E $12
    ldh  [hNoiseSfx], a                           ; $7A3F: $E0 $F4
    ld   de, Data_018_795E                        ; $7A41: $11 $5E $79
    push de                                       ; $7A44: $D5
    jp   label_018_7B1D                           ; $7A45: $C3 $1D $7B

label_018_7A48:
    jp   ClearEntityStatusBank18                  ; $7A48: $C3 $08 $7F

label_018_7A4B:
    cp   $10                                      ; $7A4B: $FE $10
    ret  nc                                       ; $7A4D: $D0

    ld   hl, wEntitiesUnknowTableP                ; $7A4E: $21 $40 $C4
    add  hl, bc                                   ; $7A51: $09
    ld   a, [hl]                                  ; $7A52: $7E
    and  a                                        ; $7A53: $A7
    ret  nz                                       ; $7A54: $C0

    ld   a, $09                                   ; $7A55: $3E $09
    ld   [wC19E], a                               ; $7A57: $EA $9E $C1
    jp   label_3B7B                               ; $7A5A: $C3 $7B $3B

label_018_7A5D:
    call GetEntityDropTimer                       ; $7A5D: $CD $FB $0B
    jr   nz, jr_018_7AB9                          ; $7A60: $20 $57

    ld   hl, wEntitiesPosXTable                   ; $7A62: $21 $00 $C2
    add  hl, bc                                   ; $7A65: $09
    ld   a, [hl]                                  ; $7A66: $7E
    ldh  [hSwordIntersectedAreaX], a              ; $7A67: $E0 $CE
    ld   hl, wEntitiesPosYTable                   ; $7A69: $21 $10 $C2
    add  hl, bc                                   ; $7A6C: $09
    ld   a, [hl]                                  ; $7A6D: $7E
    ldh  [hSwordIntersectedAreaY], a              ; $7A6E: $E0 $CD
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
    jr   nc, jr_018_7AB2                          ; $7A91: $30 $1F

    add  $04                                      ; $7A93: $C6 $04
    ld   [wC3CD], a                               ; $7A95: $EA $CD $C3
    ldh  a, [hIsGBC]                              ; $7A98: $F0 $FE
    and  a                                        ; $7A9A: $A7
    jr   z, jr_018_7AB2                           ; $7A9B: $28 $15

    ld   a, [wLinkMotionState]                    ; $7A9D: $FA $1C $C1
    cp   $05                                      ; $7AA0: $FE $05
    ret  z                                        ; $7AA2: $C8

    ld   a, [wRoomTransitionState]                ; $7AA3: $FA $24 $C1
    and  a                                        ; $7AA6: $A7
    ret  nz                                       ; $7AA7: $C0

    ld   a, $80                                   ; $7AA8: $3E $80
    ld   [wDDD6], a                               ; $7AAA: $EA $D6 $DD
    ld   a, $0B                                   ; $7AAD: $3E $0B
    ld   [wDDD7], a                               ; $7AAF: $EA $D7 $DD

jr_018_7AB2:
    ld   de, Data_018_7962                        ; $7AB2: $11 $62 $79
    push de                                       ; $7AB5: $D5
    jp   label_018_7B1D                           ; $7AB6: $C3 $1D $7B

jr_018_7AB9:
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
    jr   z, jr_018_7B2C                           ; $7B23: $28 $07

    push bc                                       ; $7B25: $C5
    ld   a, $18                                   ; $7B26: $3E $18
    call func_91D                                 ; $7B28: $CD $1D $09
    pop  bc                                       ; $7B2B: $C1

jr_018_7B2C:
    ld   a, [wRequests]                           ; $7B2C: $FA $00 $D6
    ld   e, a                                     ; $7B2F: $5F
    ld   d, $00                                   ; $7B30: $16 $00
    ld   hl, wRequestDestinationHigh              ; $7B32: $21 $01 $D6
    add  hl, de                                   ; $7B35: $19
    add  $0A                                      ; $7B36: $C6 $0A
    ld   [wRequests], a                           ; $7B38: $EA $00 $D6
    pop  de                                       ; $7B3B: $D1
    ldh  a, [hFFCF]                               ; $7B3C: $F0 $CF
    ld   [hl+], a                                 ; $7B3E: $22
    ldh  a, [hFFD0]                               ; $7B3F: $F0 $D0
    ld   [hl+], a                                 ; $7B41: $22
    ld   a, $81                                   ; $7B42: $3E $81
    ld   [hl+], a                                 ; $7B44: $22
    ld   a, [de]                                  ; $7B45: $1A
    inc  de                                       ; $7B46: $13
    ld   [hl+], a                                 ; $7B47: $22
    ld   a, [de]                                  ; $7B48: $1A
    inc  de                                       ; $7B49: $13
    ld   [hl+], a                                 ; $7B4A: $22
    ldh  a, [hFFCF]                               ; $7B4B: $F0 $CF
    ld   [hl+], a                                 ; $7B4D: $22
    ldh  a, [hFFD0]                               ; $7B4E: $F0 $D0
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

Data_018_7B5D::
    db   $00, $00, $01, $01, $01, $02, $02, $02, $00, $00, $0F, $0F, $0F, $0E, $0E, $0E
    db   $08, $08, $07, $07, $07, $06, $06, $06, $08, $08, $09, $09, $09, $0A, $0A, $0A

Data_018_7B7D::
    db   $04, $04, $03, $03, $03, $02, $02, $02, $0C, $0C, $0D, $0D, $0D, $0E, $0E, $0E
    db   $04, $04, $05, $05, $05, $06, $06, $06, $0C, $0C, $0B, $0B, $0B, $0A, $0A, $0A

func_018_7B9D::
    ldh  a, [hMultiPurpose0]                      ; $7B9D: $F0 $D7
    rlca                                          ; $7B9F: $07
    and  $01                                      ; $7BA0: $E6 $01
    ld   e, a                                     ; $7BA2: $5F
    ldh  a, [hMultiPurpose1]                      ; $7BA3: $F0 $D8
    rlca                                          ; $7BA5: $07
    rla                                           ; $7BA6: $17
    and  $02                                      ; $7BA7: $E6 $02
    or   e                                        ; $7BA9: $B3
    rla                                           ; $7BAA: $17
    rla                                           ; $7BAB: $17
    rla                                           ; $7BAC: $17
    and  $18                                      ; $7BAD: $E6 $18
    ld   h, a                                     ; $7BAF: $67
    ldh  a, [hMultiPurpose1]                      ; $7BB0: $F0 $D8
    bit  7, a                                     ; $7BB2: $CB $7F
    jr   z, jr_018_7BB8                           ; $7BB4: $28 $02

    cpl                                           ; $7BB6: $2F
    inc  a                                        ; $7BB7: $3C

jr_018_7BB8:
    ld   d, a                                     ; $7BB8: $57
    ldh  a, [hMultiPurpose0]                      ; $7BB9: $F0 $D7
    bit  7, a                                     ; $7BBB: $CB $7F
    jr   z, jr_018_7BC1                           ; $7BBD: $28 $02

    cpl                                           ; $7BBF: $2F
    inc  a                                        ; $7BC0: $3C

jr_018_7BC1:
    cp   d                                        ; $7BC1: $BA
    jr   nc, jr_018_7BD1                          ; $7BC2: $30 $0D

    sra  a                                        ; $7BC4: $CB $2F
    sra  a                                        ; $7BC6: $CB $2F
    add  h                                        ; $7BC8: $84
    ld   e, a                                     ; $7BC9: $5F
    ld   d, b                                     ; $7BCA: $50
    ld   hl, Data_018_7B5D                        ; $7BCB: $21 $5D $7B
    add  hl, de                                   ; $7BCE: $19
    ld   a, [hl]                                  ; $7BCF: $7E
    ret                                           ; $7BD0: $C9

jr_018_7BD1:
    ld   a, d                                     ; $7BD1: $7A
    sra  a                                        ; $7BD2: $CB $2F
    sra  a                                        ; $7BD4: $CB $2F
    add  h                                        ; $7BD6: $84
    ld   e, a                                     ; $7BD7: $5F
    ld   d, b                                     ; $7BD8: $50
    ld   hl, Data_018_7B7D                        ; $7BD9: $21 $7D $7B
    add  hl, de                                   ; $7BDC: $19
    ld   a, [hl]                                  ; $7BDD: $7E
    ret                                           ; $7BDE: $C9

include "code/entities/hookshot_chain.asm"

Data_018_7CC4::
    db   $36, $00, $36, $20

func_018_7CC8::
    ld   de, Data_018_7CC4                        ; $7CC8: $11 $C4 $7C
    call RenderActiveEntitySpritesPair            ; $7CCB: $CD $C0 $3B
    ldh  a, [hActiveEntityPosX]                   ; $7CCE: $F0 $EE
    ld   hl, hLinkPositionX                       ; $7CD0: $21 $98 $FF
    sub  [hl]                                     ; $7CD3: $96
    sra  a                                        ; $7CD4: $CB $2F
    sra  a                                        ; $7CD6: $CB $2F
    ldh  [hMultiPurpose0], a                      ; $7CD8: $E0 $D7
    ldh  [hMultiPurpose2], a                      ; $7CDA: $E0 $D9
    ldh  a, [hActiveEntityPosY]                   ; $7CDC: $F0 $EF
    ld   hl, hLinkPositionY                       ; $7CDE: $21 $99 $FF
    sub  [hl]                                     ; $7CE1: $96
    sra  a                                        ; $7CE2: $CB $2F
    sra  a                                        ; $7CE4: $CB $2F
    ldh  [hMultiPurpose1], a                      ; $7CE6: $E0 $D8
    ldh  [hMultiPurpose3], a                      ; $7CE8: $E0 $DA
    ld   a, [wOAMNextAvailableSlot]               ; $7CEA: $FA $C0 $C3
    ld   e, a                                     ; $7CED: $5F
    ld   d, $00                                   ; $7CEE: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $7CF0: $21 $30 $C0
    add  hl, de                                   ; $7CF3: $19
    ld   e, l                                     ; $7CF4: $5D
    ld   d, h                                     ; $7CF5: $54
    ld   a, $03                                   ; $7CF6: $3E $03

jr_018_7CF8:
    ldh  [hMultiPurpose4], a                      ; $7CF8: $E0 $DB
    ld   hl, hFrameCounter                        ; $7CFA: $21 $E7 $FF
    xor  [hl]                                     ; $7CFD: $AE
    and  $01                                      ; $7CFE: $E6 $01
    jr   nz, jr_018_7D09                          ; $7D00: $20 $07

    ldh  a, [hLinkPositionY]                      ; $7D02: $F0 $99
    ld   hl, hMultiPurpose1                            ; $7D04: $21 $D8 $FF
    add  [hl]                                     ; $7D07: $86
    ld   [de], a                                  ; $7D08: $12

jr_018_7D09:
    inc  de                                       ; $7D09: $13
    ldh  a, [hLinkPositionX]                      ; $7D0A: $F0 $98
    ld   hl, hMultiPurpose0                            ; $7D0C: $21 $D7 $FF
    add  [hl]                                     ; $7D0F: $86
    add  $04                                      ; $7D10: $C6 $04
    ld   [de], a                                  ; $7D12: $12
    inc  de                                       ; $7D13: $13
    ld   a, $24                                   ; $7D14: $3E $24
    ld   [de], a                                  ; $7D16: $12
    inc  de                                       ; $7D17: $13
    ld   a, $00                                   ; $7D18: $3E $00
    ld   [de], a                                  ; $7D1A: $12
    inc  de                                       ; $7D1B: $13
    ldh  a, [hMultiPurpose0]                      ; $7D1C: $F0 $D7
    ld   hl, hMultiPurpose2                            ; $7D1E: $21 $D9 $FF
    add  [hl]                                     ; $7D21: $86
    ldh  [hMultiPurpose0], a                      ; $7D22: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $7D24: $F0 $D8
    ld   hl, hMultiPurpose3                            ; $7D26: $21 $DA $FF
    add  [hl]                                     ; $7D29: $86
    ldh  [hMultiPurpose1], a                      ; $7D2A: $E0 $D8
    ldh  a, [hMultiPurpose4]                      ; $7D2C: $F0 $DB
    dec  a                                        ; $7D2E: $3D
    jr   nz, jr_018_7CF8                          ; $7D2F: $20 $C7

    ld   a, $03                                   ; $7D31: $3E $03
    jp   label_3DA0                               ; $7D33: $C3 $A0 $3D

func_018_7D36::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7D36: $CD $5A $3B
    jr   nc, jr_018_7D5A                          ; $7D39: $30 $1F

func_018_7D3B::
    call CopyLinkFinalPositionToPosition          ; $7D3B: $CD $BE $0C
    call ResetPegasusBoots                        ; $7D3E: $CD $B6 $0C
    ld   a, [wC1A6]                               ; $7D41: $FA $A6 $C1
    and  a                                        ; $7D44: $A7
    jr   z, jr_018_7D58                           ; $7D45: $28 $11

    ld   e, a                                     ; $7D47: $5F
    ld   d, b                                     ; $7D48: $50
    ld   hl, wEntitiesUnknowTableR+15                                ; $7D49: $21 $9F $C3
    add  hl, de                                   ; $7D4C: $19
    ld   a, [hl]                                  ; $7D4D: $7E
    cp   $03                                      ; $7D4E: $FE $03
    jr   nz, jr_018_7D58                          ; $7D50: $20 $06

    ld   hl, wEntitiesStatusTable + $0F                        ; $7D52: $21 $8F $C2
    add  hl, de                                   ; $7D55: $19
    ld   [hl], $00                                ; $7D56: $36 $00

jr_018_7D58:
    scf                                           ; $7D58: $37
    ret                                           ; $7D59: $C9

jr_018_7D5A:
    and  a                                        ; $7D5A: $A7
    ret                                           ; $7D5B: $C9

Data_018_7D5C::
    db   $06, $04, $02, $00

func_018_7D60::
    ld   hl, wEntitiesDirectionTable              ; $7D60: $21 $80 $C3
    add  hl, bc                                   ; $7D63: $09
    ld   e, [hl]                                  ; $7D64: $5E
    ld   d, b                                     ; $7D65: $50
    ld   hl, Data_018_7D5C                        ; $7D66: $21 $5C $7D
    add  hl, de                                   ; $7D69: $19
    push hl                                       ; $7D6A: $E5
    ld   hl, wEntitiesUnknowTableY                ; $7D6B: $21 $D0 $C3
    add  hl, bc                                   ; $7D6E: $09
    inc  [hl]                                     ; $7D6F: $34
    ld   a, [hl]                                  ; $7D70: $7E
    rra                                           ; $7D71: $1F
    rra                                           ; $7D72: $1F
    rra                                           ; $7D73: $1F
    rra                                           ; $7D74: $1F
    pop  hl                                       ; $7D75: $E1
    and  $01                                      ; $7D76: $E6 $01
    or   [hl]                                     ; $7D78: $B6
    jp   SetEntitySpriteVariant                   ; $7D79: $C3 $0C $3B

func_018_7D7C::
    ld   e, b                                     ; $7D7C: $58
    ldh  a, [hLinkPositionY]                      ; $7D7D: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D7F: $21 $EF $FF
    sub  [hl]                                     ; $7D82: $96
    add  $18                                      ; $7D83: $C6 $18
    cp   $38                                      ; $7D85: $FE $38
    jr   func_018_7DA0                            ; $7D87: $18 $17

; A variant of ShouldLinkTalkToEntity
func_018_7D89::
    ldh  a, [hLinkPositionY]                      ; $7D89: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D8B: $21 $EF $FF
    sub  [hl]                                     ; $7D8E: $96
    add  $14                                      ; $7D8F: $C6 $14
    cp   $38                                      ; $7D91: $FE $38
    jr   func_018_7DA0                            ; $7D93: $18 $0B

func_018_7D95::
    ld   e, b                                     ; $7D95: $58
    ldh  a, [hLinkPositionY]                      ; $7D96: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D98: $21 $EF $FF
    sub  [hl]                                     ; $7D9B: $96
    add  $14                                      ; $7D9C: $C6 $14
    cp   $28                                      ; $7D9E: $FE $28

func_018_7DA0::
    jr   nc, jr_018_7DE6                          ; $7DA0: $30 $44

    ldh  a, [hLinkPositionX]                      ; $7DA2: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7DA4: $21 $EE $FF
    sub  [hl]                                     ; $7DA7: $96
    add  $10                                      ; $7DA8: $C6 $10
    cp   $20                                      ; $7DAA: $FE $20
    jr   nc, jr_018_7DE6                          ; $7DAC: $30 $38

    inc  e                                        ; $7DAE: $1C
    ldh  a, [hActiveEntityType]                   ; $7DAF: $F0 $EB
    cp   ENTITY_WALRUS                            ; $7DB1: $FE $C4
    jr   z, jr_018_7DC1                           ; $7DB3: $28 $0C

    push de                                       ; $7DB5: $D5
    call func_018_7EE1                            ; $7DB6: $CD $E1 $7E
    ldh  a, [hLinkDirection]                      ; $7DB9: $F0 $9E
    xor  $01                                      ; $7DBB: $EE $01
    cp   e                                        ; $7DBD: $BB
    pop  de                                       ; $7DBE: $D1
    jr   nz, jr_018_7DE6                          ; $7DBF: $20 $25

jr_018_7DC1:
    ld   hl, wC1AD                                ; $7DC1: $21 $AD $C1
    ld   [hl], $01                                ; $7DC4: $36 $01
    ld   a, [wDialogState]                        ; $7DC6: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7DC9: $21 $4F $C1
    or   [hl]                                     ; $7DCC: $B6
    ld   hl, wIsLinkInTheAir                      ; $7DCD: $21 $46 $C1
    or   [hl]                                     ; $7DD0: $B6
    ld   hl, wC134                                ; $7DD1: $21 $34 $C1
    or   [hl]                                     ; $7DD4: $B6
    jr   nz, jr_018_7DE6                          ; $7DD5: $20 $0F

    ld   a, [wWindowY]                            ; $7DD7: $FA $9A $DB
    cp   $80                                      ; $7DDA: $FE $80
    jr   nz, jr_018_7DE6                          ; $7DDC: $20 $08

    ldh  a, [hJoypadState]                        ; $7DDE: $F0 $CC
    and  J_A                                      ; $7DE0: $E6 $10
    jr   z, jr_018_7DE6                           ; $7DE2: $28 $02

    scf                                           ; $7DE4: $37
    ret                                           ; $7DE5: $C9

jr_018_7DE6:
    and  a                                        ; $7DE6: $A7
    ret                                           ; $7DE7: $C9

func_018_7DE8::
    ldh  a, [hActiveEntityStatus]                 ; $7DE8: $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ; $7DEA: $FE $05
    jr   nz, jr_018_7E13                          ; $7DEC: $20 $25

func_018_7DEE::
    ld   a, [wGameplayType]                       ; $7DEE: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $7DF1: $FE $07
    jr   z, jr_018_7E13                           ; $7DF3: $28 $1E

    cp   GAMEPLAY_WORLD                           ; $7DF5: $FE $0B
    jr   nz, jr_018_7E13                          ; $7DF7: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7DF9: $FA $6B $C1
    cp   $04                                      ; $7DFC: $FE $04
    jr   nz, jr_018_7E13                          ; $7DFE: $20 $13

    ld   hl, wC1A8                                ; $7E00: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7E03: $FA $9F $C1
    or   [hl]                                     ; $7E06: $B6
    ld   hl, wInventoryAppearing                  ; $7E07: $21 $4F $C1
    or   [hl]                                     ; $7E0A: $B6
    jr   nz, jr_018_7E13                          ; $7E0B: $20 $06

    ld   a, [wRoomTransitionState]                ; $7E0D: $FA $24 $C1
    and  a                                        ; $7E10: $A7
    jr   z, jr_018_7E14                           ; $7E11: $28 $01

jr_018_7E13:
    ; return from caller
    pop  af                                       ; $7E13: $F1

jr_018_7E14:
    ret                                           ; $7E14: $C9

func_018_7E15::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7E15: $21 $10 $C4
    add  hl, bc                                   ; $7E18: $09
    ld   a, [hl]                                  ; $7E19: $7E
    and  a                                        ; $7E1A: $A7
    jr   z, jr_018_7E5E                           ; $7E1B: $28 $41

    dec  a                                        ; $7E1D: $3D
    ld   [hl], a                                  ; $7E1E: $77
    call label_3E8E                               ; $7E1F: $CD $8E $3E
    ld   hl, wEntitiesSpeedXTable                 ; $7E22: $21 $40 $C2
    add  hl, bc                                   ; $7E25: $09
    ld   a, [hl]                                  ; $7E26: $7E
    push af                                       ; $7E27: $F5
    ld   hl, wEntitiesSpeedYTable                 ; $7E28: $21 $50 $C2
    add  hl, bc                                   ; $7E2B: $09
    ld   a, [hl]                                  ; $7E2C: $7E
    push af                                       ; $7E2D: $F5
    ld   hl, wC3F0                                ; $7E2E: $21 $F0 $C3
    add  hl, bc                                   ; $7E31: $09
    ld   a, [hl]                                  ; $7E32: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7E33: $21 $40 $C2
    add  hl, bc                                   ; $7E36: $09
    ld   [hl], a                                  ; $7E37: $77
    ld   hl, wEntitiesUnknowTableS                ; $7E38: $21 $00 $C4
    add  hl, bc                                   ; $7E3B: $09
    ld   a, [hl]                                  ; $7E3C: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7E3D: $21 $50 $C2
    add  hl, bc                                   ; $7E40: $09
    ld   [hl], a                                  ; $7E41: $77
    call UpdateEntityPosWithSpeed_18              ; $7E42: $CD $5F $7E
    ld   hl, wEntitiesOptions1Table               ; $7E45: $21 $30 $C4
    add  hl, bc                                   ; $7E48: $09
    ld   a, [hl]                                  ; $7E49: $7E
    and  $20                                      ; $7E4A: $E6 $20
    jr   nz, jr_018_7E51                          ; $7E4C: $20 $03

    call label_3B23                               ; $7E4E: $CD $23 $3B

jr_018_7E51:
    ld   hl, wEntitiesSpeedYTable                 ; $7E51: $21 $50 $C2
    add  hl, bc                                   ; $7E54: $09
    pop  af                                       ; $7E55: $F1
    ld   [hl], a                                  ; $7E56: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7E57: $21 $40 $C2
    add  hl, bc                                   ; $7E5A: $09
    pop  af                                       ; $7E5B: $F1
    ld   [hl], a                                  ; $7E5C: $77
    pop  af                                       ; $7E5D: $F1

jr_018_7E5E:
    ret                                           ; $7E5E: $C9

UpdateEntityPosWithSpeed_18::
    call AddEntitySpeedToPos_18                   ; $7E5F: $CD $6C $7E

UpdateEntityYPosWithSpeed_18::
    push bc                                       ; $7E62: $C5
    ld   a, c                                     ; $7E63: $79
    add  $10                                      ; $7E64: $C6 $10
    ld   c, a                                     ; $7E66: $4F
    call AddEntitySpeedToPos_18                   ; $7E67: $CD $6C $7E
    pop  bc                                       ; $7E6A: $C1
    ret                                           ; $7E6B: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_18::
    ld   hl, wEntitiesSpeedXTable                 ; $7E6C: $21 $40 $C2
    add  hl, bc                                   ; $7E6F: $09
    ld   a, [hl]                                  ; $7E70: $7E
    and  a                                        ; $7E71: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7E72: $28 $23

    push af                                       ; $7E74: $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ; $7E75: $CB $37
    and  $F0                                      ; $7E77: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7E79: $21 $60 $C2
    add  hl, bc                                   ; $7E7C: $09
    add  [hl]                                     ; $7E7D: $86
    ld   [hl], a                                  ; $7E7E: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7E7F: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7E81: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $7E84: $09
    pop  af                                       ; $7E85: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7E86: $1E $00
    bit  7, a                                     ; $7E88: $CB $7F
    jr   z, .positive                             ; $7E8A: $28 $02

    ld   e, $F0                                   ; $7E8C: $1E $F0

.positive
    swap a                                        ; $7E8E: $CB $37
    and  $0F                                      ; $7E90: $E6 $0F
    or   e                                        ; $7E92: $B3
    ; Get carry back from d
    rr   d                                        ; $7E93: $CB $1A
    adc  [hl]                                     ; $7E95: $8E
    ld   [hl], a                                  ; $7E96: $77

.return
    ret                                           ; $7E97: $C9

AddEntityZSpeedToPos_18::
    ld   hl, wEntitiesSpeedZTable                 ; $7E98: $21 $20 $C3
    add  hl, bc                                   ; $7E9B: $09
    ld   a, [hl]                                  ; $7E9C: $7E
    and  a                                        ; $7E9D: $A7
    jr   z, AddEntitySpeedToPos_18.return         ; $7E9E: $28 $F7

    push af                                       ; $7EA0: $F5
    swap a                                        ; $7EA1: $CB $37
    and  $F0                                      ; $7EA3: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $7EA5: $21 $30 $C3
    add  hl, bc                                   ; $7EA8: $09
    add  [hl]                                     ; $7EA9: $86
    ld   [hl], a                                  ; $7EAA: $77
    rl   d                                        ; $7EAB: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7EAD: $21 $10 $C3
    jr   AddEntitySpeedToPos_18.updatePosition    ; $7EB0: $18 $D2

func_018_7EB2::
    ld   e, $00                                   ; $7EB2: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7EB4: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7EB6: $21 $00 $C2
    add  hl, bc                                   ; $7EB9: $09
    sub  [hl]                                     ; $7EBA: $96
    bit  7, a                                     ; $7EBB: $CB $7F
    jr   z, jr_018_7EC0                           ; $7EBD: $28 $01

    inc  e                                        ; $7EBF: $1C

jr_018_7EC0:
    ld   d, a                                     ; $7EC0: $57
    ret                                           ; $7EC1: $C9

func_018_7EC2::
    ld   e, $02                                   ; $7EC2: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7EC4: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7EC6: $21 $10 $C2
    add  hl, bc                                   ; $7EC9: $09
    sub  [hl]                                     ; $7ECA: $96
    bit  7, a                                     ; $7ECB: $CB $7F
    jr   nz, jr_018_7ED0                          ; $7ECD: $20 $01

    inc  e                                        ; $7ECF: $1C

jr_018_7ED0:
    ld   d, a                                     ; $7ED0: $57
    ret                                           ; $7ED1: $C9

func_018_7ED2::
    ld   e, $02                                   ; $7ED2: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7ED4: $F0 $99
    ld   hl, hActiveEntityVisualPosY              ; $7ED6: $21 $EC $FF
    sub  [hl]                                     ; $7ED9: $96
    bit  7, a                                     ; $7EDA: $CB $7F
    jr   nz, jr_018_7EDF                          ; $7EDC: $20 $01

    inc  e                                        ; $7EDE: $1C

jr_018_7EDF:
    ld   d, a                                     ; $7EDF: $57
    ret                                           ; $7EE0: $C9

func_018_7EE1::
    call func_018_7EB2                            ; $7EE1: $CD $B2 $7E
    ld   a, e                                     ; $7EE4: $7B
    ldh  [hMultiPurpose0], a                      ; $7EE5: $E0 $D7
    ld   a, d                                     ; $7EE7: $7A
    bit  7, a                                     ; $7EE8: $CB $7F
    jr   z, jr_018_7EEE                           ; $7EEA: $28 $02

    cpl                                           ; $7EEC: $2F
    inc  a                                        ; $7EED: $3C

jr_018_7EEE:
    push af                                       ; $7EEE: $F5
    call func_018_7EC2                            ; $7EEF: $CD $C2 $7E
    ld   a, e                                     ; $7EF2: $7B
    ldh  [hMultiPurpose1], a                      ; $7EF3: $E0 $D8
    ld   a, d                                     ; $7EF5: $7A
    bit  7, a                                     ; $7EF6: $CB $7F
    jr   z, jr_018_7EFC                           ; $7EF8: $28 $02

    cpl                                           ; $7EFA: $2F
    inc  a                                        ; $7EFB: $3C

jr_018_7EFC:
    pop  de                                       ; $7EFC: $D1
    cp   d                                        ; $7EFD: $BA
    jr   nc, jr_018_7F04                          ; $7EFE: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $7F00: $F0 $D7
    jr   jr_018_7F06                              ; $7F02: $18 $02

jr_018_7F04:
    ldh  a, [hMultiPurpose1]                      ; $7F04: $F0 $D8

jr_018_7F06:
    ld   e, a                                     ; $7F06: $5F
    ret                                           ; $7F07: $C9

ClearEntityStatusBank18::
    ld   hl, wEntitiesStatusTable                 ; $7F08: $21 $80 $C2
    add  hl, bc                                   ; $7F0B: $09
    ld   [hl], $00                                ; $7F0C: $36 $00
    ret                                           ; $7F0E: $C9

func_018_7F0F::
    ld   hl, wEntitiesPrivateState2Table          ; $7F0F: $21 $C0 $C2
    add  hl, bc                                   ; $7F12: $09
    ld   a, [hl]                                  ; $7F13: $7E
    JP_TABLE                                      ; $7F14
._00 dw func_018_7F1B                             ; $7F15
._01 dw func_018_7F2C                             ; $7F17
._02 dw func_018_7F3B                             ; $7F19

func_018_7F1B::
    call GetEntityTransitionCountdown             ; $7F1B: $CD $05 $0C
    ld   [hl], $A0                                ; $7F1E: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7F20: $21 $20 $C4
    add  hl, bc                                   ; $7F23: $09
    ld   [hl], $FF                                ; $7F24: $36 $FF

label_018_7F26:
    ld   hl, wEntitiesPrivateState2Table          ; $7F26: $21 $C0 $C2
    add  hl, bc                                   ; $7F29: $09
    inc  [hl]                                     ; $7F2A: $34
    ret                                           ; $7F2B: $C9

func_018_7F2C::
    call GetEntityTransitionCountdown             ; $7F2C: $CD $05 $0C
    ret  nz                                       ; $7F2F: $C0

    ld   [hl], $C0                                ; $7F30: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7F32: $21 $20 $C4
    add  hl, bc                                   ; $7F35: $09
    ld   [hl], $FF                                ; $7F36: $36 $FF
    jp   label_018_7F26                           ; $7F38: $C3 $26 $7F

func_018_7F3B::
    call GetEntityTransitionCountdown             ; $7F3B: $CD $05 $0C
    jr   nz, jr_018_7F4C                          ; $7F3E: $20 $0C

    call PlayBombExplosionSfx                     ; $7F40: $CD $4B $0C
    call label_27DD                               ; $7F43: $CD $DD $27
    call SetRoomStatus20                            ; $7F46: $CD $B9 $7F
    jp   DidKillEnemy                             ; $7F49: $C3 $50 $3F

jr_018_7F4C:
    jp   label_018_7F4F                           ; $7F4C: $C3 $4F $7F

label_018_7F4F:
    and  $07                                      ; $7F4F: $E6 $07
    ret  nz                                       ; $7F51: $C0

    call GetRandomByte                            ; $7F52: $CD $0D $28
    and  $1F                                      ; $7F55: $E6 $1F
    sub  $10                                      ; $7F57: $D6 $10
    ld   e, a                                     ; $7F59: $5F
    ld   hl, hActiveEntityPosX                    ; $7F5A: $21 $EE $FF
    add  [hl]                                     ; $7F5D: $86
    ld   [hl], a                                  ; $7F5E: $77
    call GetRandomByte                            ; $7F5F: $CD $0D $28
    and  $1F                                      ; $7F62: $E6 $1F
    sub  $14                                      ; $7F64: $D6 $14
    ld   e, a                                     ; $7F66: $5F
    ld   hl, hActiveEntityVisualPosY                                ; $7F67: $21 $EC $FF
    add  [hl]                                     ; $7F6A: $86
    ld   [hl], a                                  ; $7F6B: $77
    jp   label_018_7F6F                           ; $7F6C: $C3 $6F $7F

label_018_7F6F:
    call func_018_7DEE                            ; $7F6F: $CD $EE $7D
    ldh  a, [hActiveEntityPosX]                   ; $7F72: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7F74: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7F76: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7F78: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $7F7A: $3E $02
    call AddTranscientVfx                         ; $7F7C: $CD $C7 $0C
    ld   a, $13                                   ; $7F7F: $3E $13
    ldh  [hNoiseSfx], a                           ; $7F81: $E0 $F4
    ret                                           ; $7F83: $C9

    ld   a, ENTITY_HEART_CONTAINER                ; $7F84: $3E $36
    call SpawnNewEntity_trampoline                ; $7F86: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7F89: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7F8B: $21 $00 $C2
    add  hl, de                                   ; $7F8E: $19
    ld   [hl], a                                  ; $7F8F: $77
    ldh  a, [hMultiPurpose1]                      ; $7F90: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7F92: $21 $10 $C2
    add  hl, de                                   ; $7F95: $19
    ld   [hl], a                                  ; $7F96: $77
    ldh  a, [hIsSideScrolling]                    ; $7F97: $F0 $F9
    and  a                                        ; $7F99: $A7
    jr   z, jr_018_7FA4                           ; $7F9A: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $7F9C: $21 $50 $C2
    add  hl, bc                                   ; $7F9F: $09
    ld   [hl], $F0                                ; $7FA0: $36 $F0
    jr   jr_018_7FB0                              ; $7FA2: $18 $0C

jr_018_7FA4:
    ld   hl, wEntitiesSpeedZTable                 ; $7FA4: $21 $20 $C3
    add  hl, de                                   ; $7FA7: $19
    ld   [hl], $10                                ; $7FA8: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7FAA: $21 $10 $C3
    add  hl, de                                   ; $7FAD: $19
    ld   [hl], $08                                ; $7FAE: $36 $08

jr_018_7FB0:
    call ClearEntityStatusBank18                  ; $7FB0: $CD $08 $7F
    ld   hl, hNoiseSfx                            ; $7FB3: $21 $F4 $FF
    ld   [hl], $1A                                ; $7FB6: $36 $1A
    ret                                           ; $7FB8: $C9

SetRoomStatus20::
    ld   hl, wOverworldRoomStatus                 ; $7FB9: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $7FBC: $F0 $F6
    ld   e, a                                     ; $7FBE: $5F
    ld   a, [wIsIndoor]                           ; $7FBF: $FA $A5 $DB
    ld   d, a                                     ; $7FC2: $57

    ; If the map uses rooms in the indoors_b rooms group…
    ldh  a, [hMapId]                              ; $7FC3: $F0 $F7
    cp   MAP_INDOORS_B_END                        ; $7FC5: $FE $1A
    jr   nc, .notIndoorB                          ; $7FC7: $30 $05
    cp   MAP_INDOORS_B_START                      ; $7FC9: $FE $06
    jr   c, .notIndoorB                           ; $7FCB: $38 $01
    inc  d                                        ; $7FCD: $14
.notIndoorB

    add  hl, de                                   ; $7FCE: $19
    ld   a, [hl]                                  ; $7FCF: $7E
    or   ROOM_STATUS_EVENT_2                      ; $7FD0: $F6 $20
    ld   [hl], a                                  ; $7FD2: $77
    ldh  [hRoomStatus], a                         ; $7FD3: $E0 $F8
    ret                                           ; $7FD5: $C9
