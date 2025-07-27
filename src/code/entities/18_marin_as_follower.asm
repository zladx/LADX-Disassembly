; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MarinAsFollowerSpriteVariants::
.variant0
    db $42, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $40, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $40, OAM_GBC_PAL_1 | OAMF_PAL0
    db $42, OAM_GBC_PAL_1 | OAMF_PAL0
.variant2
    db $44, OAM_GBC_PAL_1 | OAMF_PAL0
    db $46, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $46, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $44, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $48, OAM_GBC_PAL_1 | OAMF_PAL0
    db $4A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant5
    db $4C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $4E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant6
    db $4A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $48, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $4E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $4C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant8
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0
.variant9
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant10
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

Data_018_59E4::
    db   $06, $04, $02, $00

; Handler for ENTITY_MARIN_AT_THE_SHORE when being spawned as an NPC follower.
;
; This probably used to be an entity of its own, but was then merged with the
; entity ID of ENTITY_MARIN_AT_THE_SHORE.
MarinAsFollowerHandler::
    ld   a, c                                     ;; 18:59E8 $79
    ld   [wMarinEntityIndex], a                   ;; 18:59E9 $EA $0F $C5
    call GetEntityTransitionCountdown             ;; 18:59EC $CD $05 $0C

    jr   z, jr_018_5A3F                           ;; 18:59EF $28 $4E

    cp   $10                                      ;; 18:59F1 $FE $10
    jr   nz, .jr_5A07                             ;; 18:59F3 $20 $12

    dec  [hl]                                     ;; 18:59F5 $35
    ldh  a, [hLinkPositionY]                      ;; 18:59F6 $F0 $99
    push af                                       ;; 18:59F8 $F5
    ld   a, $28                                   ;; 18:59F9 $3E $28
    ldh  [hLinkPositionY], a                      ;; 18:59FB $E0 $99
    call_open_dialog Dialog01F ; "Marin is joining you!" ;; 18:59FD
    pop  af                                       ;; 18:5A02 $F1
    ldh  [hLinkPositionY], a                      ;; 18:5A03 $E0 $99
    ld   a, $0F                                   ;; 18:5A05 $3E $0F

; Sword on beach music handling script
.jr_5A07
    cp   $01                                      ;; 18:5A07 $FE $01
    jr   nz, .jr_5A18                             ;; 18:5A09 $20 $0D

    xor  a                                        ;; 18:5A0B $AF
    ld   [wC167], a                               ;; 18:5A0C $EA $67 $C1
    ld   a, MUSIC_OVERWORLD_INTRO                 ;; 18:5A0F $3E $31
    ld   [wMusicTrackToPlay], a                   ;; 18:5A11 $EA $68 $D3
    ; Sets the area track to overworld, so that after the introduction section fanfare, the overworld music will play rather than the Koholint Island theme
    ld   a, MUSIC_OVERWORLD                       ;; 18:5A14 $3E $05
    ldh  [hDefaultMusicTrack], a                  ;; 18:5A16 $E0 $B0

.jr_5A18
    xor  a                                        ;; 18:5A18 $AF
    ld   [wEntitiesSpriteVariantTable], a         ;; 18:5A19 $EA $B0 $C3
    ld   de, MarinAsFollowerSpriteVariants        ;; 18:5A1C $11 $B8 $59
    call RenderActiveEntitySpritesPair            ;; 18:5A1F $CD $C0 $3B
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ;; 18:5A22 $3E $6C
    ldh  [hLinkAnimationState], a                 ;; 18:5A24 $E0 $9D
    ld   a, $02                                   ;; 18:5A26 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:5A28 $E0 $A1
    ld   a, $03                                   ;; 18:5A2A $3E $03
    ldh  [hLinkDirection], a                      ;; 18:5A2C $E0 $9E
    ldh  a, [hLinkPositionX]                      ;; 18:5A2E $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 18:5A30 $21 $00 $C2
    add  hl, bc                                   ;; 18:5A33 $09
    ld   [hl], a                                  ;; 18:5A34 $77
    ldh  a, [hLinkPositionY]                      ;; 18:5A35 $F0 $99
    sub  $10                                      ;; 18:5A37 $D6 $10
    ld   hl, wEntitiesPosYTable                   ;; 18:5A39 $21 $10 $C2
    add  hl, bc                                   ;; 18:5A3C $09
    ld   [hl], a                                  ;; 18:5A3D $77
    ret                                           ;; 18:5A3E $C9

; 'You got Marin!' joke
jr_018_5A3F:
    ld   hl, wEntitiesPrivateState4Table          ;; 18:5A3F $21 $40 $C4
    add  hl, bc                                   ;; 18:5A42 $09
    ld   a, [hl]                                  ;; 18:5A43 $7E
    and  a                                        ;; 18:5A44 $A7
    jr   nz, jr_018_5A8C                          ;; 18:5A45 $20 $45

    ld   a, [wTransitionSequenceCounter]          ;; 18:5A47 $FA $6B $C1
    cp   $04                                      ;; 18:5A4A $FE $04
    jr   nz, ret_018_5A7F                         ;; 18:5A4C $20 $31

    inc  [hl]                                     ;; 18:5A4E $34
    call GetEntityTransitionCountdown             ;; 18:5A4F $CD $05 $0C
    ld   [hl], $70                                ;; 18:5A52 $36 $70
    ld   a, MUSIC_OBTAIN_ITEM                     ;; 18:5A54 $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 18:5A56 $EA $68 $D3
    ; Makes it so that no music plays after the 'item found' fanfare
    ld   a, MUSIC_SILENCE                         ;; 18:5A59 $3E $FF
    ldh  [hNextDefaultMusicTrack], a              ;; 18:5A5B $E0 $BF

    ; Link lifting Marin animation
    ldh  a, [hLinkPositionX]                      ;; 18:5A5D $F0 $98
    ld   hl, wLinkPositionXHistory                ;; 18:5A5F $21 $55 $D1
    call func_018_5A79                            ;; 18:5A62 $CD $79 $5A
    ldh  a, [hLinkPositionY]                      ;; 18:5A65 $F0 $99
    ld   hl, wLinkPositionYHistory                ;; 18:5A67 $21 $75 $D1
    call func_018_5A79                            ;; 18:5A6A $CD $79 $5A
    xor  a                                        ;; 18:5A6D $AF
    ld   hl, wLinkPositionZHistory                ;; 18:5A6E $21 $95 $D1
    call func_018_5A79                            ;; 18:5A71 $CD $79 $5A
    ldh  a, [hLinkDirection]                      ;; 18:5A74 $F0 $9E
    ld   hl, wLinkDirectionHistory                ;; 18:5A76 $21 $B5 $D1

func_018_5A79::
    ld   e, $10                                   ;; 18:5A79 $1E $10
.loop
    ld   [hl+], a                                 ;; 18:5A7B $22
    dec  e                                        ;; 18:5A7C $1D
    jr   nz, .loop                                ;; 18:5A7D $20 $FC

ret_018_5A7F:
    ret                                           ;; 18:5A7F $C9

Data_018_5A80::
    db   $08, $08, $08, $09, $0A, $0A, $0A, $09

Data_018_5A88::
    db   $08, $F8

Data_018_5A8A::
    db   $06, $01

jr_018_5A8C::
    ld   a, [wIsMarinSinging]
    and  a
    jr   z, .jr_5AE7

    ldh  a, [hFrameCounter]                       ;; 18:5A92 $F0 $E7
    rra                                           ;; 18:5A94 $1F
    rra                                           ;; 18:5A95 $1F
    rra                                           ;; 18:5A96 $1F
    rra                                           ;; 18:5A97 $1F
    and  $07                                      ;; 18:5A98 $E6 $07
    ld   e, a                                     ;; 18:5A9A $5F
    ld   d, b                                     ;; 18:5A9B $50
    ld   hl, Data_018_5A80                        ;; 18:5A9C $21 $80 $5A
    add  hl, de                                   ;; 18:5A9F $19
    ld   a, [hl]                                  ;; 18:5AA0 $7E
    ldh  [hActiveEntitySpriteVariant], a          ;; 18:5AA1 $E0 $F1
    ldh  a, [hFrameCounter]                       ;; 18:5AA3 $F0 $E7
    and  $1F                                      ;; 18:5AA5 $E6 $1F
    jr   nz, .jr_5AE7                             ;; 18:5AA7 $20 $3E

    ld   a, ENTITY_MUSICAL_NOTE                   ;; 18:5AA9 $3E $C9
    call SpawnNewEntity_trampoline                ;; 18:5AAB $CD $86 $3B
    jr   c, .jr_5AE7                              ;; 18:5AAE $38 $37

    ldh  a, [hMultiPurpose1]                      ;; 18:5AB0 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 18:5AB2 $21 $10 $C2
    add  hl, de                                   ;; 18:5AB5 $19
    sub  $08                                      ;; 18:5AB6 $D6 $08
    ld   [hl], a                                  ;; 18:5AB8 $77
    push bc                                       ;; 18:5AB9 $C5
    ldh  a, [hFrameCounter]                       ;; 18:5ABA $F0 $E7
    rra                                           ;; 18:5ABC $1F
    rra                                           ;; 18:5ABD $1F
    rra                                           ;; 18:5ABE $1F
    rra                                           ;; 18:5ABF $1F
    rra                                           ;; 18:5AC0 $1F
    and  $01                                      ;; 18:5AC1 $E6 $01
    ld   c, a                                     ;; 18:5AC3 $4F
    ld   hl, Data_018_5A88                        ;; 18:5AC4 $21 $88 $5A
    add  hl, bc                                   ;; 18:5AC7 $09
    ldh  a, [hMultiPurpose0]                      ;; 18:5AC8 $F0 $D7
    add  [hl]                                     ;; 18:5ACA $86
    ld   hl, wEntitiesPosXTable                   ;; 18:5ACB $21 $00 $C2
    add  hl, de                                   ;; 18:5ACE $19
    ld   [hl], a                                  ;; 18:5ACF $77
    ld   hl, Data_018_5A8A                        ;; 18:5AD0 $21 $8A $5A
    add  hl, bc                                   ;; 18:5AD3 $09
    ld   a, [hl]                                  ;; 18:5AD4 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 18:5AD5 $21 $40 $C2
    add  hl, de                                   ;; 18:5AD8 $19
    ld   [hl], a                                  ;; 18:5AD9 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 18:5ADA $21 $50 $C2
    add  hl, de                                   ;; 18:5ADD $19
    ld   [hl], $FC                                ;; 18:5ADE $36 $FC
    ld   hl, wEntitiesInertiaTable                ;; 18:5AE0 $21 $D0 $C3
    add  hl, de                                   ;; 18:5AE3 $19
    ld   [hl], $40                                ;; 18:5AE4 $36 $40
    pop  bc                                       ;; 18:5AE6 $C1

.jr_5AE7
    ld   de, MarinAsFollowerSpriteVariants        ;; 18:5AE7 $11 $B8 $59
    call RenderActiveEntitySpritesPair            ;; 18:5AEA $CD $C0 $3B
    ld   a, [wInventoryAppearing]                 ;; 18:5AED $FA $4F $C1
    and  a                                        ;; 18:5AF0 $A7
    ret  nz                                       ;; 18:5AF1 $C0

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 18:5AF2 $21 $80 $C4
    add  hl, bc                                   ;; 18:5AF5 $09
    ld   a, [hl]                                  ;; 18:5AF6 $7E
    and  a                                        ;; 18:5AF7 $A7
    jr   z, .jr_5B03                              ;; 18:5AF8 $28 $09

    dec  a                                        ;; 18:5AFA $3D
    jr   nz, .jr_5B03                             ;; 18:5AFB $20 $06

    dec  [hl]                                     ;; 18:5AFD $35
    call_open_dialog Dialog27A ; "What a surprise!" ;; 18:5AFE

.jr_5B03
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 18:5B03 $21 $00 $C3
    add  hl, bc                                   ;; 18:5B06 $09
    ld   a, [wTransitionSequenceCounter]          ;; 18:5B07 $FA $6B $C1
    cp   $04                                      ;; 18:5B0A $FE $04
    jr   z, .jr_5B13                              ;; 18:5B0C $28 $05

    ld   a, [hl]                                  ;; 18:5B0E $7E
    and  a                                        ;; 18:5B0F $A7
    jr   z, .jr_5B13                              ;; 18:5B10 $28 $01

    dec  [hl]                                     ;; 18:5B12 $35

.jr_5B13
    ld   a, [hl]                                  ;; 18:5B13 $7E
    and  a                                        ;; 18:5B14 $A7
    jr   z, jr_018_5B6A                           ;; 18:5B15 $28 $53

    cp   $30                                      ;; 18:5B17 $FE $30
    jr   nz, jr_018_5B55                          ;; 18:5B19 $20 $3A

    xor  a                                        ;; 18:5B1B $AF
    ld   [wC167], a                               ;; 18:5B1C $EA $67 $C1
    ldh  a, [hLinkPositionX]                      ;; 18:5B1F $F0 $98
    sub  $58                                      ;; 18:5B21 $D6 $58
    add  $03                                      ;; 18:5B23 $C6 $03
    cp   $06                                      ;; 18:5B25 $FE $06
    jr   nc, .jr_5B33                             ;; 18:5B27 $30 $0A

    ldh  a, [hLinkPositionY]                      ;; 18:5B29 $F0 $99
    sub  $50                                      ;; 18:5B2B $D6 $50
    add  $03                                      ;; 18:5B2D $C6 $03
    cp   $06                                      ;; 18:5B2F $FE $06
    jr   c, jr_018_5B3B                           ;; 18:5B31 $38 $08

.jr_5B33
    ld   [hl], b                                  ;; 18:5B33 $70
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 18:5B34 $21 $80 $C4
    add  hl, bc                                   ;; 18:5B37 $09
    ld   [hl], $1C                                ;; 18:5B38 $36 $1C
    ret                                           ;; 18:5B3A $C9

jr_018_5B3B:
    ld   hl, hJingle                              ;; 18:5B3B $21 $F2 $FF
    ld   [hl], JINGLE_STRONG_BUMP                 ;; 18:5B3E $36 $0B
    ld   hl, hWaveSfx                             ;; 18:5B40 $21 $F3 $FF
    ld   [hl], WAVE_SFX_LINK_HURT                 ;; 18:5B43 $36 $03
    ld   hl, wScreenShakeCountdown                ;; 18:5B45 $21 $57 $C1
    ld   [hl], $18                                ;; 18:5B48 $36 $18
    ld   hl, wC158                                ;; 18:5B4A $21 $58 $C1
    ld   [hl], $04                                ;; 18:5B4D $36 $04
    ld   hl, hLinkPositionX                       ;; 18:5B4F $21 $98 $FF
    inc  [hl]                                     ;; 18:5B52 $34
    jr   jr_018_5B61                              ;; 18:5B53 $18 $0C

jr_018_5B55:
    jr   nc, jr_018_5B6A                          ;; 18:5B55 $30 $13

    cp   $10                                      ;; 18:5B57 $FE $10
    jr   nz, jr_018_5B61                          ;; 18:5B59 $20 $06

    dec  [hl]                                     ;; 18:5B5B $35
    call_open_dialog Dialog27B ; "Sorry, are you ok?" ;; 18:5B5C

jr_018_5B61:
    ld   a, $02                                   ;; 18:5B61 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:5B63 $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ;; 18:5B65 $3E $6A
    ldh  [hLinkAnimationState], a                 ;; 18:5B67 $E0 $9D
    ret                                           ;; 18:5B69 $C9

jr_018_5B6A:
    ld   a, [wIsMarinInAnimalVillage]             ;; 18:5B6A $FA $74 $DB
    ld   hl, wLoadPreviousMapCountdown            ;; 18:5B6D $21 $BC $C1
    or   [hl]                                     ;; 18:5B70 $B6
    ret  nz                                       ;; 18:5B71 $C0

    ld   a, [wDB10]                               ;; 18:5B72 $FA $10 $DB
    and  a                                        ;; 18:5B75 $A7
    jp   z, label_018_5C6A                        ;; 18:5B76 $CA $6A $5C

    call ApplyEntityInteractionWithBackground_trampoline ;; 18:5B79 $CD $23 $3B
    ld   a, $02                                   ;; 18:5B7C $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:5B7E $E0 $A1
    ld   [wC167], a                               ;; 18:5B80 $EA $67 $C1
    call ReturnIfNonInteractive_18                ;; 18:5B83 $CD $E8 $7D
    ld   a, [wD468]                               ;; 18:5B86 $FA $68 $D4
    and  a                                        ;; 18:5B89 $A7
    jr   z, .jr_5B90                              ;; 18:5B8A $28 $04

    dec  a                                        ;; 18:5B8C $3D
    ld   [wD468], a                               ;; 18:5B8D $EA $68 $D4

.jr_5B90
    ldh  a, [hActiveEntityState]                  ;; 18:5B90 $F0 $F0
    JP_TABLE                                      ;; 18:5B92
._00 dw func_018_5B9D                             ;; 18:5B93
._01 dw func_018_5BB4                             ;; 18:5B95
._02 dw func_018_5BD0                             ;; 18:5B97
._03 dw func_018_5C07                             ;; 18:5B99
._04 dw func_018_5C39                             ;; 18:5B9B

func_018_5B9D::
    ld   a, [wLinkMotionState]                    ;; 18:5B9D $FA $1C $C1
    cp   LINK_MOTION_MAP_FADE_OUT                 ;; 18:5BA0 $FE $03
    ret  z                                        ;; 18:5BA2 $C8

    ld   a, $40                                   ;; 18:5BA3 $3E $40
    ld   [wD468], a                               ;; 18:5BA5 $EA $68 $D4
    ld   a, REPLACE_TILES_MARIN_SITTING           ;; 18:5BA8 $3E $0F
    ldh  [hReplaceTiles], a                       ;; 18:5BAA $E0 $A5
    ld   a, $01                                   ;; 18:5BAC $3E $01
    call SetEntitySpriteVariant                   ;; 18:5BAE $CD $0C $3B
    jp   IncrementEntityState                     ;; 18:5BB1 $C3 $12 $3B

func_018_5BB4::
    ld   a, [wD468]                               ;; 18:5BB4 $FA $68 $D4
    and  a                                        ;; 18:5BB7 $A7
    ret  nz                                       ;; 18:5BB8 $C0

    ld   a, $18                                   ;; 18:5BB9 $3E $18
    ld   [wD468], a                               ;; 18:5BBB $EA $68 $D4
    ld   hl, wEntitiesDirectionTable              ;; 18:5BBE $21 $80 $C3
    add  hl, bc                                   ;; 18:5BC1 $09
    ld   [hl], $01                                ;; 18:5BC2 $36 $01
    ld   a, $04                                   ;; 18:5BC4 $3E $04
    call SetEntitySpriteVariant                   ;; 18:5BC6 $CD $0C $3B
    ld   a, REPLACE_TILES_MARIN_STANDING          ;; 18:5BC9 $3E $10
    ldh  [hReplaceTiles], a                       ;; 18:5BCB $E0 $A5
    jp   IncrementEntityState                     ;; 18:5BCD $C3 $12 $3B

func_018_5BD0::
    ld   a, [wD468]                               ;; 18:5BD0 $FA $68 $D4
    and  a                                        ;; 18:5BD3 $A7
    ret  nz                                       ;; 18:5BD4 $C0

    ld   hl, wEntitiesSpeedXTable                 ;; 18:5BD5 $21 $40 $C2
    add  hl, bc                                   ;; 18:5BD8 $09
    ld   [hl], $F4                                ;; 18:5BD9 $36 $F4
    call AddEntitySpeedToPos_18                   ;; 18:5BDB $CD $6C $7E
    ldh  a, [hFrameCounter]                       ;; 18:5BDE $F0 $E7
    and  $08                                      ;; 18:5BE0 $E6 $08
    ld   e, $04                                   ;; 18:5BE2 $1E $04
    jr   z, .jr_5BE7                              ;; 18:5BE4 $28 $01

    inc  e                                        ;; 18:5BE6 $1C

.jr_5BE7
    ld   a, e                                     ;; 18:5BE7 $7B
    call SetEntitySpriteVariant                   ;; 18:5BE8 $CD $0C $3B
    call func_018_7EB2                            ;; 18:5BEB $CD $B2 $7E
    add  $02                                      ;; 18:5BEE $C6 $02
    cp   $04                                      ;; 18:5BF0 $FE $04
    ret  nc                                       ;; 18:5BF2 $D0

    ld   hl, wEntitiesSpriteVariantTable          ;; 18:5BF3 $21 $B0 $C3
    add  hl, bc                                   ;; 18:5BF6 $09
    ld   [hl], $02                                ;; 18:5BF7 $36 $02
    ld   hl, wEntitiesDirectionTable              ;; 18:5BF9 $21 $80 $C3
    add  hl, bc                                   ;; 18:5BFC $09
    ld   [hl], $02                                ;; 18:5BFD $36 $02
    ld   a, $10                                   ;; 18:5BFF $3E $10
    ld   [wD468], a                               ;; 18:5C01 $EA $68 $D4
    jp   IncrementEntityState                     ;; 18:5C04 $C3 $12 $3B

func_018_5C07::
    ld   a, [wD468]                               ;; 18:5C07 $FA $68 $D4
    and  a                                        ;; 18:5C0A $A7
    ret  nz                                       ;; 18:5C0B $C0

    ld   a, [wDB10]                               ;; 18:5C0C $FA $10 $DB
    dec  a                                        ;; 18:5C0F $3D
    ld   e, a                                     ;; 18:5C10 $5F
    ld   a, [wIsOnLowHeath]                       ;; 18:5C11 $FA $63 $C1
    cp   e                                        ;; 18:5C14 $BB
    jr   z, .jr_5C27                              ;; 18:5C15 $28 $10

    and  a                                        ;; 18:5C17 $A7
    jr   z, .jr_5C27                              ;; 18:5C18 $28 $0D

    ld   e, $1C                                   ;; 18:5C1A $1E $1C
    call GetRandomByte                            ;; 18:5C1C $CD $0D $28
    and  $3F                                      ;; 18:5C1F $E6 $3F
    jr   nz, jr_018_5C32                          ;; 18:5C21 $20 $0F

    ld_dialog_low e, Dialog21E ; "Idiot, I told you this!" ;; 18:5C23 $1E $1E
    jr   jr_018_5C32                              ;; 18:5C25 $18 $0B

.jr_5C27
    ld_dialog_low e, Dialog21B ; "I thought you'd never come back!" ;; 18:5C27 $1E $1B
    ld   a, [wDB47]                               ;; 18:5C29 $FA $47 $DB
    cp   $80                                      ;; 18:5C2C $FE $80
    jr   nc, jr_018_5C32                          ;; 18:5C2E $30 $02

    ld_dialog_low e, Dialog21D ; "You're back! Are you hurt?" ;; 18:5C30 $1E $1D

jr_018_5C32:
    ld   a, e                                     ;; 18:5C32 $7B
    call OpenDialogInTable2                       ;; 18:5C33 $CD $7C $23
    jp   IncrementEntityState                     ;; 18:5C36 $C3 $12 $3B

func_018_5C39::
    xor  a                                        ;; 18:5C39 $AF
    ld   [wDB10], a                               ;; 18:5C3A $EA $10 $DB
    ld   [wC167], a                               ;; 18:5C3D $EA $67 $C1
    call IncrementEntityState                     ;; 18:5C40 $CD $12 $3B
    ld   [hl], b                                  ;; 18:5C43 $70
    ld   hl, wEntitiesInertiaTable                ;; 18:5C44 $21 $D0 $C3
    add  hl, bc                                   ;; 18:5C47 $09
    ld   [hl], $FF                                ;; 18:5C48 $36 $FF
    ldh  a, [hActiveEntityPosX]                   ;; 18:5C4A $F0 $EE
    ld   hl, wLinkPositionXHistory                ;; 18:5C4C $21 $55 $D1
    call func_018_5C63                            ;; 18:5C4F $CD $63 $5C
    ld   hl, wLinkPositionYHistory                ;; 18:5C52 $21 $75 $D1
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:5C55 $F0 $EC
    ld   e, $10                                   ;; 18:5C57 $1E $10

.loop_5C59
    ld   [hl+], a                                 ;; 18:5C59 $22
    dec  a                                        ;; 18:5C5A $3D
    dec  e                                        ;; 18:5C5B $1D
    jr   nz, .loop_5C59                           ;; 18:5C5C $20 $FB

    ld   a, $02                                   ;; 18:5C5E $3E $02
    ld   hl, wLinkDirectionHistory                ;; 18:5C60 $21 $B5 $D1

func_018_5C63::
    ld   e, $10                                   ;; 18:5C63 $1E $10

.loop_5C65
    ld   [hl+], a                                 ;; 18:5C65 $22
    dec  e                                        ;; 18:5C66 $1D
    jr   nz, .loop_5C65                           ;; 18:5C67 $20 $FC

    ret                                           ;; 18:5C69 $C9

label_018_5C6A:
    ld   a, [wTransitionSequenceCounter]          ;; 18:5C6A $FA $6B $C1
    cp   $04                                      ;; 18:5C6D $FE $04
    ret  nz                                       ;; 18:5C6F $C0

    ldh  a, [hMapRoom]                            ;; 18:5C70 $F0 $F6
    ld   hl, wEntitiesRoomTable                   ;; 18:5C72 $21 $E0 $C3
    add  hl, bc                                   ;; 18:5C75 $09
    ld   [hl], a                                  ;; 18:5C76 $77
    ld   hl, wEntitiesPosXSignTable               ;; 18:5C77 $21 $20 $C2
    add  hl, bc                                   ;; 18:5C7A $09
    ld   [hl], b                                  ;; 18:5C7B $70
    ld   hl, wEntitiesPosYSignTable               ;; 18:5C7C $21 $30 $C2
    add  hl, bc                                   ;; 18:5C7F $09
    ld   [hl], b                                  ;; 18:5C80 $70
    ld   hl, wEntitiesDirectionTable              ;; 18:5C81 $21 $80 $C3
    add  hl, bc                                   ;; 18:5C84 $09
    ld   e, [hl]                                  ;; 18:5C85 $5E
    ld   d, b                                     ;; 18:5C86 $50
    ld   hl, Data_018_59E4                        ;; 18:5C87 $21 $E4 $59
    add  hl, de                                   ;; 18:5C8A $19
    push hl                                       ;; 18:5C8B $E5
    ld   a, [wConsecutiveStepsCount]              ;; 18:5C8C $FA $20 $C1
    rra                                           ;; 18:5C8F $1F
    rra                                           ;; 18:5C90 $1F
    rra                                           ;; 18:5C91 $1F
    pop  hl                                       ;; 18:5C92 $E1
    and  $01                                      ;; 18:5C93 $E6 $01
    or   [hl]                                     ;; 18:5C95 $B6
    call SetEntitySpriteVariant                   ;; 18:5C96 $CD $0C $3B
    ld   hl, wEntitiesInertiaTable                ;; 18:5C99 $21 $D0 $C3
    add  hl, bc                                   ;; 18:5C9C $09
    ld   a, [hl]                                  ;; 18:5C9D $7E
    ldh  [hMultiPurposeG], a                      ;; 18:5C9E $E0 $E8
    and  $0F                                      ;; 18:5CA0 $E6 $0F
    ld   e, a                                     ;; 18:5CA2 $5F
    ld   d, b                                     ;; 18:5CA3 $50
    ld   hl, wLinkPositionXHistory                ;; 18:5CA4 $21 $55 $D1
    add  hl, de                                   ;; 18:5CA7 $19
    ldh  a, [hLinkFinalPositionX]                 ;; 18:5CA8 $F0 $9F
    ld   [hl], a                                  ;; 18:5CAA $77
    ldh  a, [hLinkFinalPositionY]                 ;; 18:5CAB $F0 $A0
    ld   hl, wC13B                                ;; 18:5CAD $21 $3B $C1
    add  [hl]                                     ;; 18:5CB0 $86
    ld   hl, wLinkPositionYHistory                ;; 18:5CB1 $21 $75 $D1
    add  hl, de                                   ;; 18:5CB4 $19
    ld   [hl], a                                  ;; 18:5CB5 $77
    ld   hl, wLinkDirectionHistory                ;; 18:5CB6 $21 $B5 $D1
    add  hl, de                                   ;; 18:5CB9 $19
    ldh  a, [hLinkDirection]                      ;; 18:5CBA $F0 $9E
    ld   [hl], a                                  ;; 18:5CBC $77
    ld   hl, wEntitiesPrivateState1Table          ;; 18:5CBD $21 $B0 $C2
    add  hl, bc                                   ;; 18:5CC0 $09
    ld   a, [hl]                                  ;; 18:5CC1 $7E
    ldh  [hMultiPurposeH], a                      ;; 18:5CC2 $E0 $E9
    and  $0F                                      ;; 18:5CC4 $E6 $0F
    ld   e, a                                     ;; 18:5CC6 $5F
    ld   d, b                                     ;; 18:5CC7 $50
    ld   hl, wLinkPositionZHistory                ;; 18:5CC8 $21 $95 $D1
    add  hl, de                                   ;; 18:5CCB $19
    ldh  a, [hLinkPositionZ]                      ;; 18:5CCC $F0 $A2
    ld   [hl], a                                  ;; 18:5CCE $77
    ld   a, [wLinkMotionState]                    ;; 18:5CCF $FA $1C $C1
    cp   LINK_MOTION_UNSTUCKING                   ;; 18:5CD2 $FE $02
    jr   z, .jr_5CEA                              ;; 18:5CD4 $28 $14

    ld   a, [wRoomTransitionState]                ;; 18:5CD6 $FA $24 $C1
    and  a                                        ;; 18:5CD9 $A7
    jr   nz, .jr_5CEA                             ;; 18:5CDA $20 $0E

    ld   a, [wDialogState]                        ;; 18:5CDC $FA $9F $C1
    and  a                                        ;; 18:5CDF $A7
    jr   nz, jr_018_5CEF                          ;; 18:5CE0 $20 $0D

    ld   hl, hLinkSpeedX                          ;; 18:5CE2 $21 $9A $FF
    ldh  a, [hLinkSpeedY]                         ;; 18:5CE5 $F0 $9B
    or   [hl]                                     ;; 18:5CE7 $B6
    jr   z, jr_018_5CEF                           ;; 18:5CE8 $28 $05

.jr_5CEA
    ld   hl, wEntitiesInertiaTable                ;; 18:5CEA $21 $D0 $C3
    add  hl, bc                                   ;; 18:5CED $09
    inc  [hl]                                     ;; 18:5CEE $34

jr_018_5CEF:
    ld   hl, wEntitiesPrivateState1Table          ;; 18:5CEF $21 $B0 $C2
    add  hl, bc                                   ;; 18:5CF2 $09
    inc  [hl]                                     ;; 18:5CF3 $34
    ldh  a, [hMultiPurposeG]                      ;; 18:5CF4 $F0 $E8
    inc  a                                        ;; 18:5CF6 $3C
    and  $0F                                      ;; 18:5CF7 $E6 $0F
    ld   e, a                                     ;; 18:5CF9 $5F
    ld   d, b                                     ;; 18:5CFA $50
    ld   hl, wLinkPositionXHistory                ;; 18:5CFB $21 $55 $D1
    add  hl, de                                   ;; 18:5CFE $19
    ld   a, [hl]                                  ;; 18:5CFF $7E
    ld   hl, wEntitiesPosXTable                   ;; 18:5D00 $21 $00 $C2
    add  hl, bc                                   ;; 18:5D03 $09
    ld   [hl], a                                  ;; 18:5D04 $77
    ld   hl, wLinkPositionYHistory                ;; 18:5D05 $21 $75 $D1
    add  hl, de                                   ;; 18:5D08 $19
    ld   a, [hl]                                  ;; 18:5D09 $7E
    ld   hl, wEntitiesPosYTable                   ;; 18:5D0A $21 $10 $C2
    add  hl, bc                                   ;; 18:5D0D $09
    ld   [hl], a                                  ;; 18:5D0E $77
    ld   hl, wLinkDirectionHistory                ;; 18:5D0F $21 $B5 $D1
    add  hl, de                                   ;; 18:5D12 $19
    ld   a, [hl]                                  ;; 18:5D13 $7E
    ld   hl, wEntitiesDirectionTable              ;; 18:5D14 $21 $80 $C3
    add  hl, bc                                   ;; 18:5D17 $09
    ld   [hl], a                                  ;; 18:5D18 $77
    ldh  a, [hMultiPurposeH]                      ;; 18:5D19 $F0 $E9
    inc  a                                        ;; 18:5D1B $3C
    and  $0F                                      ;; 18:5D1C $E6 $0F
    ld   e, a                                     ;; 18:5D1E $5F
    ld   d, b                                     ;; 18:5D1F $50
    ld   hl, wEntitiesPosZTable                   ;; 18:5D20 $21 $10 $C3
    add  hl, bc                                   ;; 18:5D23 $09
    ld   a, [hl]                                  ;; 18:5D24 $7E
    push af                                       ;; 18:5D25 $F5
    ld   hl, wLinkPositionZHistory                ;; 18:5D26 $21 $95 $D1
    add  hl, de                                   ;; 18:5D29 $19
    ld   e, [hl]                                  ;; 18:5D2A $5E
    ld   hl, wEntitiesPosZTable                   ;; 18:5D2B $21 $10 $C3
    add  hl, bc                                   ;; 18:5D2E $09
    ld   [hl], e                                  ;; 18:5D2F $73
    call GetEntityPrivateCountdown1               ;; 18:5D30 $CD $00 $0C
    ld   hl, wRoomTransitionState                 ;; 18:5D33 $21 $24 $C1
    or   [hl]                                     ;; 18:5D36 $B6
    jr   nz, jr_018_5D7D                          ;; 18:5D37 $20 $44

    pop  af                                       ;; 18:5D39 $F1
    cp   e                                        ;; 18:5D3A $BB
    jr   z, jr_018_5D7A                           ;; 18:5D3B $28 $3D

    and  a                                        ;; 18:5D3D $A7
    jr   z, jr_018_5D6F                           ;; 18:5D3E $28 $2F

    ld   a, e                                     ;; 18:5D40 $7B
    and  a                                        ;; 18:5D41 $A7
    jr   nz, jr_018_5D7A                          ;; 18:5D42 $20 $36

    call ApplyEntityInteractionWithBackground_trampoline ;; 18:5D44 $CD $23 $3B
    ld   hl, wEntitiesStatusTable                 ;; 18:5D47 $21 $80 $C2
    add  hl, bc                                   ;; 18:5D4A $09
    ld   a, [hl]                                  ;; 18:5D4B $7E
    cp   $02                                      ;; 18:5D4C $FE $02
    ret  z                                        ;; 18:5D4E $C8

    ld   hl, wEntitiesGroundStatusTable           ;; 18:5D4F $21 $70 $C4
    add  hl, bc                                   ;; 18:5D52 $09
    ld   a, [hl]                                  ;; 18:5D53 $7E
    dec  a                                        ;; 18:5D54 $3D
    cp   ENTITY_GROUND_STATUS_SHALLOW_WATER       ;; 18:5D55 $FE $02
    jr   c, .jr_5D5E                              ;; 18:5D57 $38 $05

    ld   a, NOISE_SFX_FOOTSTEP                    ;; 18:5D59 $3E $07
    ldh  [hNoiseSfx], a                           ;; 18:5D5B $E0 $F4
    ret                                           ;; 18:5D5D $C9

.jr_5D5E
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:5D5E $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 18:5D60 $E0 $D8
    ldh  a, [hActiveEntityPosX]                   ;; 18:5D62 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 18:5D64 $E0 $D7
    ld   a, JINGLE_WATER_SPLASH                   ;; 18:5D66 $3E $0E
    ldh  [hJingle], a                             ;; 18:5D68 $E0 $F2
    ld   a, TRANSCIENT_VFX_PEGASUS_SPLASH         ;; 18:5D6A $3E $0C
    jp   AddTranscientVfx                         ;; 18:5D6C $C3 $C7 $0C

jr_018_5D6F:
    ld   a, e                                     ;; 18:5D6F $7B
    cp   $08                                      ;; 18:5D70 $FE $08
    ld   a, JINGLE_FALL_DOWN                      ;; 18:5D72 $3E $08
    jr   nc, .jr_5D78                             ;; 18:5D74 $30 $02

    ld   a, JINGLE_JUMP                           ;; 18:5D76 $3E $24

.jr_5D78
    ldh  [hJingle], a                             ;; 18:5D78 $E0 $F2

jr_018_5D7A:
    jp   ApplyEntityInteractionWithBackground_trampoline ;; 18:5D7A $C3 $23 $3B

jr_018_5D7D:
    pop  af                                       ;; 18:5D7D $F1
    ret                                           ;; 18:5D7E $C9
