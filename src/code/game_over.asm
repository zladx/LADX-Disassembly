;
; Code for Link passing out when not health remains
;

LinkPassOut::
    ldh  a, [hFF9C]                               ; $41C2: $F0 $9C
    JP_TABLE                                      ; $41C4
._00 dw LinkPassOut0Handler
._01 dw LinkPassOut1Handler
._02 dw LinkPassOut2Handler
._03 dw LinkPassOut3Handler
._04 dw LinkPassOut4Handler

Data_001_41CF::
    db   $6A, $6A, $6A, $6A, $6A, $6A, $6A, $6A   ; $41CF
    db   $6A, $6A, $00, $00, $00, $0A, $04, $06   ; $41D7
    db   $00, $0A, $04, $06, $00, $0A, $04, $06   ; $41DF

Data_001_41E7::
    db   $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C   ; $41E7
    db   $1C, $1C, $1B, $1A, $19, $18, $17, $16   ; $41EF
    db   $15, $14, $13, $12, $11, $10, $10, $10   ; $41F7
    db   $10, $10, $10, $10                       ; $41FF

LinkPassOut0Handler::
    xor  a                                        ; $4203: $AF
    ld   [wScreenShakeHorizontal], a              ; $4204: $EA $55 $C1
    ld   [wScreenShakeVertical], a                ; $4207: $EA $56 $C1
    ldh  a, [$FFB7]                               ; $420A: $F0 $B7
    and  a                                        ; $420C: $A7

jr_001_420D::
    jr   nz, jr_001_4259                          ; $420D: $20 $4A

    ld   a, $10                                   ; $420F: $3E $10
    ldh  [$FFB7], a                               ; $4211: $E0 $B7
    ld   a, $01                                   ; $4213: $3E $01
    ldh  [hFF9C], a                               ; $4215: $E0 $9C
    ld   a, $0F                                   ; $4217: $3E $0F
    ld   [wTileMapToLoad], a                      ; $4219: $EA $FE $D6
    ld   a, $FF                                   ; $421C: $3E $FF
    ldh  [hLinkAnimationState], a                 ; $421E: $E0 $9D
    ld   a, [wDeathCount]                         ; $4220: $FA $57 $DB
    add  $01                                      ; $4223: $C6 $01
    daa                                           ; $4225: $27
    ld   [wDeathCount], a                         ; $4226: $EA $57 $DB
    ld   a, [$DB58]                               ; $4229: $FA $58 $DB
    adc  $00                                      ; $422C: $CE $00
    daa                                           ; $422E: $27
    ld   [$DB58], a                               ; $422F: $EA $58 $DB
    cp   $10                                      ; $4232: $FE $10
    jr   c, jr_001_4240                           ; $4234: $38 $0A

    ld   a, $99                                   ; $4236: $3E $99
    ld   [wDeathCount], a                         ; $4238: $EA $57 $DB
    ld   a, $09                                   ; $423B: $3E $09
    ld   [$DB58], a                               ; $423D: $EA $58 $DB

jr_001_4240::
    xor  a                                        ; $4240: $AF
    ld   [wScrollXOffset], a                      ; $4241: $EA $BF $C1
    ld   [wPieceOfPowerKillCount], a              ; $4244: $EA $15 $D4
    ld   [wActivePowerUp], a                      ; $4247: $EA $7C $D4
    ld   [wPowerUpHits], a                        ; $424A: $EA $7A $D4
    ld   [wObjectAffectingBGPalette], a           ; $424D: $EA $CB $C3
    ld   [wBGPaletteEffectAddress], a             ; $4250: $EA $CC $C3
    ld   [wC3CD], a                               ; $4253: $EA $CD $C3
    ldh  [rOBP0], a                               ; $4256: $E0 $48
    ret                                           ; $4258: $C9

jr_001_4259::
    rra                                           ; $4259: $1F
    rra                                           ; $425A: $1F
    rra                                           ; $425B: $1F
    and  $3F                                      ; $425C: $E6 $3F
    ld   e, a                                     ; $425E: $5F
    ld   d, $00                                   ; $425F: $16 $00
    ld   hl, Data_001_41CF                        ; $4261: $21 $CF $41
    add  hl, de                                   ; $4264: $19
    ld   a, [hl]                                  ; $4265: $7E
    ldh  [hLinkAnimationState], a                 ; $4266: $E0 $9D
    ldh  a, [$FFB7]                               ; $4268: $F0 $B7
    rra                                           ; $426A: $1F
    rra                                           ; $426B: $1F
    rra                                           ; $426C: $1F
    and  $1F                                      ; $426D: $E6 $1F
    ld   e, a                                     ; $426F: $5F
    ld   hl, Data_001_41E7                        ; $4270: $21 $E7 $41
    add  hl, de                                   ; $4273: $19
    ld   a, [hl]                                  ; $4274: $7E
    ld   [wC3CD], a                               ; $4275: $EA $CD $C3
    ld   a, $01                                   ; $4278: $3E $01
    ld   [wObjectAffectingBGPalette], a           ; $427A: $EA $CB $C3
    ld   a, $1C                                   ; $427D: $3E $1C
    ld   [wOBJ0Palette], a                        ; $427F: $EA $98 $DB
    ld   a, [wBGPalette]                          ; $4282: $FA $97 $DB
    ld   [wOBJ1Palette], a                        ; $4285: $EA $99 $DB
    ld   e, $08                                   ; $4288: $1E $08
    call func_020_6A30_trampoline                 ; $428A: $CD $D7 $08
    call CopyLinkTunicPalette_trampoline          ; $428D: $CD $0F $09
    ret                                           ; $4290: $C9

LinkPassOut1Handler::
    ld   a, $0D                                   ; $4291: $3E $0D
    ld   [wTileMapToLoad], a                      ; $4293: $EA $FE $D6
    ld   hl, hFF9C                                ; $4296: $21 $9C $FF
    inc  [hl]                                     ; $4299: $34
    ret                                           ; $429A: $C9

LinkPassOut2Handler::
    ld   a, $E4                                   ; $429B: $3E $E4
    ld   [wBGPalette], a                          ; $429D: $EA $97 $DB
    ld   a, $0A                                   ; $42A0: $3E $0A
    ld   [wBGMapToLoad], a                        ; $42A2: $EA $FF $D6
    ld   a, $FF                                   ; $42A5: $3E $FF
    ld   [wWindowY], a                            ; $42A7: $EA $9A $DB
    xor  a                                        ; $42AA: $AF
    ldh  [hBaseScrollX], a                        ; $42AB: $E0 $96
    ldh  [hBaseScrollY], a                        ; $42AD: $E0 $97
    ld   hl, hFF9C                                ; $42AF: $21 $9C $FF
    inc  [hl]                                     ; $42B2: $34
    call LoadFileMenuBG_trampoline                ; $42B3: $CD $05 $09
    call SynchronizeDungeonsItemFlags_trampoline  ; $42B6: $CD $02 $28
    ret                                           ; $42B9: $C9

; Unused data
Data_001_42BA::
    db   $00, $FE, $FD, $FE, $00, $02, $03, $02   ; $42BA
    db   $00, $04, $08, $0C, $10, $0C, $08, $04   ; $42C2

LinkPassOut3Handler::
    ldh  a, [$FFB7]
    and  a                                        ; $42CC: $A7
    jr   nz, jr_001_42D8                          ; $42CD: $20 $09

    ld   hl, hFF9C                                ; $42CF: $21 $9C $FF
    inc  [hl]                                     ; $42D2: $34
    ld   a, MUSIC_GAME_OVER                       ; $42D3: $3E $03
    ld   [wMusicTrackToPlay], a                   ; $42D5: $EA $68 $D3

jr_001_42D8::
    ret                                           ; $42D8: $C9

LinkPassOut4Handler::
    call func_001_4339                            ; $42D9: $CD $39 $43
    ldh  a, [hJoypadState]                        ; $42DC: $F0 $CC
    and  $B0                                      ; $42DE: $E6 $B0
    jr   z, jr_001_4335                           ; $42E0: $28 $53

    ld   a, [$C13F]                               ; $42E2: $FA $3F $C1
    cp   $01                                      ; $42E5: $FE $01
    jr   z, jr_001_432C                           ; $42E7: $28 $43

    cp   $00                                      ; $42E9: $FE $00
    jr   z, jr_001_42F2                           ; $42EB: $28 $05

    ld   [$DBD1], a                               ; $42ED: $EA $D1 $DB
    jr   jr_001_42F5                              ; $42F0: $18 $03

jr_001_42F2::
    call func_001_5DE6                            ; $42F2: $CD $E6 $5D

jr_001_42F5::
    xor  a                                        ; $42F5: $AF
    ld   hl, wEntitiesStatusTable                 ; $42F6: $21 $80 $C2
    ld   e, $10                                   ; $42F9: $1E $10

jr_001_42FB::
    ld   [hl+], a                                 ; $42FB: $22
    dec  e                                        ; $42FC: $1D
    jr   nz, jr_001_42FB                          ; $42FD: $20 $FC

    ld   [wOBJ0Palette], a                        ; $42FF: $EA $98 $DB
    ld   [wOBJ1Palette], a                        ; $4302: $EA $99 $DB
    ldh  [rOBP0], a                               ; $4305: $E0 $48
    ldh  [rOBP1], a                               ; $4307: $E0 $49
    ld   [wBGPalette], a                          ; $4309: $EA $97 $DB
    ldh  [rBGP], a                                ; $430C: $E0 $47
    ld   [$D6FB], a                               ; $430E: $EA $FB $D6
    ld   [$D475], a                               ; $4311: $EA $75 $D4
    ldh  a, [hLinkPositionX]                      ; $4314: $F0 $98
    ld   [wMapEntrancePositionX], a               ; $4316: $EA $9D $DB
    ldh  a, [hLinkPositionY]                      ; $4319: $F0 $99
    ld   [wMapEntrancePositionY], a               ; $431B: $EA $9E $DB
    call LoadSavedFile                            ; $431E: $CD $A4 $52
    ld   a, $01                                   ; $4321: $3E $01
    call ClearFileMenuBG_trampoline               ; $4323: $CD $FA $08
    ld   a, $80                                   ; $4326: $3E $80
    ld   [wInvincibilityCounter], a               ; $4328: $EA $C7 $DB
    ret                                           ; $432B: $C9

jr_001_432C::
    call func_001_5DE6                            ; $432C: $CD $E6 $5D
    xor  a                                        ; $432F: $AF
    ldh  [hActiveEntityTilesOffset], a            ; $4330: $E0 $F5
    call func_001_6162                            ; $4332: $CD $62 $61

jr_001_4335::
    ret                                           ; $4335: $C9

Data_001_4336::
    ld   d, b                                     ; $4336: $50
    ld   h, b                                     ; $4337: $60
    ld   [hl], b                                  ; $4338: $70

func_001_4339::
    ld   hl, $C13F                                ; $4339: $21 $3F $C1
    call func_001_6BA8                            ; $433C: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $433F: $F0 $CC
    and  $08                                      ; $4341: $E6 $08
    jr   z, jr_001_434D                           ; $4343: $28 $08

    ld   a, [hl]                                  ; $4345: $7E
    inc  a                                        ; $4346: $3C
    cp   $03                                      ; $4347: $FE $03
    jr   nz, jr_001_434C                          ; $4349: $20 $01

    xor  a                                        ; $434B: $AF

jr_001_434C::
    ld   [hl], a                                  ; $434C: $77

jr_001_434D::
    ldh  a, [hJoypadState]                        ; $434D: $F0 $CC
    and  $04                                      ; $434F: $E6 $04
    jr   z, jr_001_435C                           ; $4351: $28 $09

    ld   a, [hl]                                  ; $4353: $7E
    dec  a                                        ; $4354: $3D
    cp   $FF                                      ; $4355: $FE $FF
    jr   nz, jr_001_435B                          ; $4357: $20 $02

    ld   a, $02                                   ; $4359: $3E $02

jr_001_435B::
    ld   [hl], a                                  ; $435B: $77

jr_001_435C::
    ld   e, [hl]                                  ; $435C: $5E
    ld   d, $00                                   ; $435D: $16 $00
    ld   hl, Data_001_4336                        ; $435F: $21 $36 $43
    add  hl, de                                   ; $4362: $19
    ld   a, [hl]                                  ; $4363: $7E
    ld   hl, $C018                                ; $4364: $21 $18 $C0
    ld   [hl+], a                                 ; $4367: $22
    ld   a, $1C                                   ; $4368: $3E $24
    ld   [hl+], a                                 ; $436A: $22
    ld   a, $BE                                   ; $436B: $3E $BE
    ld   [hl+], a                                 ; $436D: $22
    ld   [hl], $00                                ; $436E: $36 $00
    ret                                           ; $4370: $C9
