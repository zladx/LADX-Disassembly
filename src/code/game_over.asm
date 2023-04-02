;
; Code for Link passing out when not health remains
;

LinkPassOut::
    ldh  a, [hGameOverStage]                      ; $41C2: $F0 $9C ; $41C2: $F0 $9C
    JP_TABLE                                      ; $41C4 ; $41C4: $C7
._00 dw LinkPassOutHandler                        ; $41C5
._01 dw LoadGameOverStage1Handler                 ; $41C7
._02 dw LoadGameOverStage2Handler                 ; $41C9
._03 dw LoadGameOverStage3Handler                 ; $41CB
._04 dw GameOverInteractiveHandler                ; $41CD

Data_001_41CF::
    db   $6A, $6A, $6A, $6A, $6A, $6A, $6A, $6A   ; $41CF ; $41CF
    db   $6A, $6A, $00, $00, $00, $0A, $04, $06   ; $41D7 ; $41D7
    db   $00, $0A, $04, $06, $00, $0A, $04, $06   ; $41DF ; $41DF

Data_001_41E7::
    db   $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C   ; $41E7 ; $41E7
    db   $1C, $1C, $1B, $1A, $19, $18, $17, $16   ; $41EF ; $41EF
    db   $15, $14, $13, $12, $11, $10, $10, $10   ; $41F7 ; $41F7
    db   $10, $10, $10, $10                       ; $41FF ; $41FF

LinkPassOutHandler::
    xor  a                                        ; $4203: $AF ; $4203: $AF
    ld   [wScreenShakeHorizontal], a              ; $4204: $EA $55 $C1 ; $4204: $EA $55 $C1
    ld   [wScreenShakeVertical], a                ; $4207: $EA $56 $C1 ; $4207: $EA $56 $C1

    ; If the passing out animation is running, jump to it.
    ldh  a, [hLinkCountdown]                      ; $420A: $F0 $B7 ; $420A: $F0 $B7
    and  a                                        ; $420C: $A7 ; $420C: $A7
    jr   nz, .passingOutAnimation                 ; $420D: $20 $4A ; $420D: $20 $4A

    ;
    ; Passing out animation finished: start loading the Game Over screen
    ;

    ; Wait 16 frames before actually displaying the screen
    ld   a, 16                                    ; $420F: $3E $10 ; $420F: $3E $10
    ldh  [hLinkCountdown], a                      ; $4211: $E0 $B7 ; $4211: $E0 $B7
    ld   a, $01                                   ; $4213: $3E $01 ; $4213: $3E $01
    ldh  [hGameOverStage], a                      ; $4215: $E0 $9C ; $4215: $E0 $9C

    ld   a, TILESET_0F                            ; $4217: $3E $0F ; $4217: $3E $0F
    ld   [wTilesetToLoad], a                      ; $4219: $EA $FE $D6 ; $4219: $EA $FE $D6

    ld   a, LINK_ANIMATION_STATE_NO_UPDATE        ; $421C: $3E $FF ; $421C: $3E $FF
    ldh  [hLinkAnimationState], a                 ; $421E: $E0 $9D ; $421E: $E0 $9D

    ; Increment the death count
    ld   a, [wDeathCount]                         ; $4220: $FA $57 $DB ; $4220: $FA $57 $DB
    add  $01                                      ; $4223: $C6 $01 ; $4223: $C6 $01
    daa                                           ; $4225: $27 ; $4225: $27
    ld   [wDeathCount], a                         ; $4226: $EA $57 $DB ; $4226: $EA $57 $DB

    ld   a, [wDeathCount + 1]                     ; $4229: $FA $58 $DB ; $4229: $FA $58 $DB
    adc  $00                                      ; $422C: $CE $00 ; $422C: $CE $00
    daa                                           ; $422E: $27 ; $422E: $27
    ld   [wDeathCount + 1], a                     ; $422F: $EA $58 $DB ; $422F: $EA $58 $DB
    cp   $10                                      ; $4232: $FE $10 ; $4232: $FE $10
    jr   c, .maxDeathCountEnd                     ; $4234: $38 $0A ; $4234: $38 $0A

    ld   a, $99                                   ; $4236: $3E $99 ; $4236: $3E $99
    ld   [wDeathCount], a                         ; $4238: $EA $57 $DB ; $4238: $EA $57 $DB
    ld   a, $09                                   ; $423B: $3E $09 ; $423B: $3E $09
    ld   [wDeathCount + 1], a                     ; $423D: $EA $58 $DB ; $423D: $EA $58 $DB
.maxDeathCountEnd

    xor  a                                        ; $4240: $AF ; $4240: $AF
    ld   [wScrollXOffset], a                      ; $4241: $EA $BF $C1 ; $4241: $EA $BF $C1
    ld   [wPieceOfPowerKillCount], a              ; $4244: $EA $15 $D4 ; $4244: $EA $15 $D4
    ld   [wActivePowerUp], a                      ; $4247: $EA $7C $D4 ; $4247: $EA $7C $D4
    ld   [wPowerUpHits], a                        ; $424A: $EA $7A $D4 ; $424A: $EA $7A $D4
    ld   [wObjectAffectingBGPalette], a           ; $424D: $EA $CB $C3 ; $424D: $EA $CB $C3
    ld   [wBGPaletteEffectAddress], a             ; $4250: $EA $CC $C3 ; $4250: $EA $CC $C3
    ld   [wC3CD], a                               ; $4253: $EA $CD $C3 ; $4253: $EA $CD $C3
    ldh  [rOBP0], a                               ; $4256: $E0 $48 ; $4256: $E0 $48
    ret                                           ; $4258: $C9 ; $4258: $C9

.passingOutAnimation
    rra                                           ; $4259: $1F ; $4259: $1F
    rra                                           ; $425A: $1F ; $425A: $1F
    rra                                           ; $425B: $1F ; $425B: $1F
    and  $3F                                      ; $425C: $E6 $3F ; $425C: $E6 $3F
    ld   e, a                                     ; $425E: $5F ; $425E: $5F
    ld   d, $00                                   ; $425F: $16 $00 ; $425F: $16 $00
    ld   hl, Data_001_41CF                        ; $4261: $21 $CF $41 ; $4261: $21 $CF $41
    add  hl, de                                   ; $4264: $19 ; $4264: $19
    ld   a, [hl]                                  ; $4265: $7E ; $4265: $7E
    ldh  [hLinkAnimationState], a                 ; $4266: $E0 $9D ; $4266: $E0 $9D
    ldh  a, [hLinkCountdown]                      ; $4268: $F0 $B7 ; $4268: $F0 $B7
    rra                                           ; $426A: $1F ; $426A: $1F
    rra                                           ; $426B: $1F ; $426B: $1F
    rra                                           ; $426C: $1F ; $426C: $1F
    and  $1F                                      ; $426D: $E6 $1F ; $426D: $E6 $1F
    ld   e, a                                     ; $426F: $5F ; $426F: $5F
    ld   hl, Data_001_41E7                        ; $4270: $21 $E7 $41 ; $4270: $21 $E7 $41
    add  hl, de                                   ; $4273: $19 ; $4273: $19
    ld   a, [hl]                                  ; $4274: $7E ; $4274: $7E
    ld   [wC3CD], a                               ; $4275: $EA $CD $C3 ; $4275: $EA $CD $C3
    ld   a, $01                                   ; $4278: $3E $01 ; $4278: $3E $01
    ld   [wObjectAffectingBGPalette], a           ; $427A: $EA $CB $C3 ; $427A: $EA $CB $C3
    ld   a, $1C                                   ; $427D: $3E $1C ; $427D: $3E $1C
    ld   [wOBJ0Palette], a                        ; $427F: $EA $98 $DB ; $427F: $EA $98 $DB
    ld   a, [wBGPalette]                          ; $4282: $FA $97 $DB ; $4282: $FA $97 $DB
    ld   [wOBJ1Palette], a                        ; $4285: $EA $99 $DB ; $4285: $EA $99 $DB
    ld   e, $08                                   ; $4288: $1E $08 ; $4288: $1E $08
    call func_020_6A30_trampoline                 ; $428A: $CD $D7 $08 ; $428A: $CD $D7 $08
    call CopyLinkTunicPalette_trampoline          ; $428D: $CD $0F $09 ; $428D: $CD $0F $09
    ret                                           ; $4290: $C9 ; $4290: $C9

LoadGameOverStage1Handler::
    ld   a, TILESET_SAVE_MENU                     ; $4291: $3E $0D ; $4291: $3E $0D
    ld   [wTilesetToLoad], a                      ; $4293: $EA $FE $D6 ; $4293: $EA $FE $D6
    ld   hl, hGameOverStage                       ; $4296: $21 $9C $FF ; $4296: $21 $9C $FF
    inc  [hl]                                     ; $4299: $34 ; $4299: $34
    ret                                           ; $429A: $C9 ; $429A: $C9

LoadGameOverStage2Handler::
    ld   a, $E4                                   ; $429B: $3E $E4 ; $429B: $3E $E4
    ld   [wBGPalette], a                          ; $429D: $EA $97 $DB ; $429D: $EA $97 $DB

    ld   a, TILEMAP_GAME_OVER                     ; $42A0: $3E $0A ; $42A0: $3E $0A
    ld   [wBGMapToLoad], a                        ; $42A2: $EA $FF $D6 ; $42A2: $EA $FF $D6

    ld   a, $FF                                   ; $42A5: $3E $FF ; $42A5: $3E $FF
    ld   [wWindowY], a                            ; $42A7: $EA $9A $DB ; $42A7: $EA $9A $DB

    xor  a                                        ; $42AA: $AF ; $42AA: $AF
    ldh  [hBaseScrollX], a                        ; $42AB: $E0 $96 ; $42AB: $E0 $96
    ldh  [hBaseScrollY], a                        ; $42AD: $E0 $97 ; $42AD: $E0 $97
    ld   hl, hGameOverStage                       ; $42AF: $21 $9C $FF ; $42AF: $21 $9C $FF
    inc  [hl]                                     ; $42B2: $34 ; $42B2: $34
    call LoadFileMenuBG_trampoline                ; $42B3: $CD $05 $09 ; $42B3: $CD $05 $09
    call SynchronizeDungeonsItemFlags_trampoline  ; $42B6: $CD $02 $28 ; $42B6: $CD $02 $28
    ret                                           ; $42B9: $C9 ; $42B9: $C9

; Unused data
Data_001_42BA::
    db   $00, $FE, $FD, $FE, $00, $02, $03, $02   ; $42BA ; $42BA
    db   $00, $04, $08, $0C, $10, $0C, $08, $04   ; $42C2 ; $42C2

LoadGameOverStage3Handler::
    ; Wait until hLinkCountdown reaches 0…
    ldh  a, [hLinkCountdown]                      ; $42CA: $F0 $B7
    and  a                                        ; $42CC: $A7 ; $42CC: $A7
    jr   nz, .return                              ; $42CD: $20 $09 ; $42CD: $20 $09

    ; …then display the "Game Over" screen.
    ld   hl, hGameOverStage                       ; $42CF: $21 $9C $FF ; $42CF: $21 $9C $FF
    inc  [hl]                                     ; $42D2: $34 ; $42D2: $34
    ld   a, MUSIC_GAME_OVER                       ; $42D3: $3E $03 ; $42D3: $3E $03
    ld   [wMusicTrackToPlay], a                   ; $42D5: $EA $68 $D3 ; $42D5: $EA $68 $D3

.return
    ret                                           ; $42D8: $C9 ; $42D8: $C9

GameOverInteractiveHandler::
    call func_001_4339                            ; $42D9: $CD $39 $43 ; $42D9: $CD $39 $43
    ldh  a, [hJoypadState]                        ; $42DC: $F0 $CC ; $42DC: $F0 $CC
    and  J_A | J_B | J_START                      ; $42DE: $E6 $B0 ; $42DE: $E6 $B0
    jr   z, ret_001_4335                          ; $42E0: $28 $53 ; $42E0: $28 $53

    ld   a, [wC13F]                               ; $42E2: $FA $3F $C1 ; $42E2: $FA $3F $C1
    cp   $01                                      ; $42E5: $FE $01 ; $42E5: $FE $01
    jr   z, jr_001_432C                           ; $42E7: $28 $43 ; $42E7: $28 $43

    cp   $00                                      ; $42E9: $FE $00 ; $42E9: $FE $00
    jr   z, .jr_42F2                              ; $42EB: $28 $05 ; $42EB: $28 $05

    ld   [wDBD1], a                               ; $42ED: $EA $D1 $DB ; $42ED: $EA $D1 $DB
    jr   jr_001_42F5                              ; $42F0: $18 $03 ; $42F0: $18 $03

.jr_42F2::
    call SaveGameToFile                           ; $42F2: $CD $E6 $5D ; $42F2: $CD $E6 $5D

jr_001_42F5::
    xor  a                                        ; $42F5: $AF ; $42F5: $AF
    ld   hl, wEntitiesStatusTable                 ; $42F6: $21 $80 $C2 ; $42F6: $21 $80 $C2
    ld   e, $10                                   ; $42F9: $1E $10 ; $42F9: $1E $10

.loop_42FB
    ld   [hl+], a                                 ; $42FB: $22 ; $42FB: $22
    dec  e                                        ; $42FC: $1D ; $42FC: $1D
    jr   nz, .loop_42FB                           ; $42FD: $20 $FC ; $42FD: $20 $FC

    ld   [wOBJ0Palette], a                        ; $42FF: $EA $98 $DB ; $42FF: $EA $98 $DB
    ld   [wOBJ1Palette], a                        ; $4302: $EA $99 $DB ; $4302: $EA $99 $DB
    ldh  [rOBP0], a                               ; $4305: $E0 $48 ; $4305: $E0 $48
    ldh  [rOBP1], a                               ; $4307: $E0 $49 ; $4307: $E0 $49
    ld   [wBGPalette], a                          ; $4309: $EA $97 $DB ; $4309: $EA $97 $DB
    ldh  [rBGP], a                                ; $430C: $E0 $47 ; $430C: $E0 $47
    ld   [wSwitchBlocksState], a                  ; $430E: $EA $FB $D6 ; $430E: $EA $FB $D6
    ld   [wD475], a                               ; $4311: $EA $75 $D4 ; $4311: $EA $75 $D4
    ldh  a, [hLinkPositionX]                      ; $4314: $F0 $98 ; $4314: $F0 $98
    ld   [wMapEntrancePositionX], a               ; $4316: $EA $9D $DB ; $4316: $EA $9D $DB
    ldh  a, [hLinkPositionY]                      ; $4319: $F0 $99 ; $4319: $F0 $99
    ld   [wMapEntrancePositionY], a               ; $431B: $EA $9E $DB ; $431B: $EA $9E $DB
    call LoadSavedFile                            ; $431E: $CD $A4 $52 ; $431E: $CD $A4 $52
    ld   a, $01                                   ; $4321: $3E $01 ; $4321: $3E $01
    call ClearFileMenuBG_trampoline               ; $4323: $CD $FA $08 ; $4323: $CD $FA $08
    ld   a, $80                                   ; $4326: $3E $80 ; $4326: $3E $80
    ld   [wInvincibilityCounter], a               ; $4328: $EA $C7 $DB ; $4328: $EA $C7 $DB
    ret                                           ; $432B: $C9 ; $432B: $C9

jr_001_432C::
    call SaveGameToFile                           ; $432C: $CD $E6 $5D ; $432C: $CD $E6 $5D
    xor  a                                        ; $432F: $AF ; $432F: $AF
    ldh  [hActiveEntityTilesOffset], a            ; $4330: $E0 $F5 ; $4330: $E0 $F5
    call func_001_6162                            ; $4332: $CD $62 $61 ; $4332: $CD $62 $61

ret_001_4335::
    ret                                           ; $4335: $C9 ; $4335: $C9

Data_001_4336::
    db GAMEOVER_OPTION_SAVE_CONTINUE_Y + $10      ; $4336
    db GAMEOVER_OPTION_SAVE_QUIT_Y + $10          ; $4337
    db GAMEOVER_OPTION_CONTINUE_Y + $10           ; $4338

func_001_4339::
    ld   hl, wC13F                                ; $4339: $21 $3F $C1 ; $4339: $21 $3F $C1
    call MoveSelect                               ; $433C: $CD $A8 $6B
    ldh  a, [hJoypadState]                        ; $433F: $F0 $CC ; $433F: $F0 $CC
    and  J_DOWN                                   ; $4341: $E6 $08 ; $4341: $E6 $08
    jr   z, jr_001_434D                           ; $4343: $28 $08 ; $4343: $28 $08

    ld   a, [hl]                                  ; $4345: $7E ; $4345: $7E
    inc  a                                        ; $4346: $3C ; $4346: $3C
    cp   $03                                      ; $4347: $FE $03 ; $4347: $FE $03
    jr   nz, .jr_434C                             ; $4349: $20 $01 ; $4349: $20 $01

    xor  a                                        ; $434B: $AF ; $434B: $AF

.jr_434C::
    ld   [hl], a                                  ; $434C: $77 ; $434C: $77

jr_001_434D::
    ldh  a, [hJoypadState]                        ; $434D: $F0 $CC ; $434D: $F0 $CC
    and  J_UP                                     ; $434F: $E6 $04 ; $434F: $E6 $04
    jr   z, jr_001_435C                           ; $4351: $28 $09 ; $4351: $28 $09

    ld   a, [hl]                                  ; $4353: $7E ; $4353: $7E
    dec  a                                        ; $4354: $3D ; $4354: $3D
    cp   $FF                                      ; $4355: $FE $FF ; $4355: $FE $FF
    jr   nz, .jr_435B                             ; $4357: $20 $02 ; $4357: $20 $02

    ld   a, $02                                   ; $4359: $3E $02 ; $4359: $3E $02

.jr_435B::
    ld   [hl], a                                  ; $435B: $77 ; $435B: $77

jr_001_435C::
    ld   e, [hl]                                  ; $435C: $5E ; $435C: $5E
    ld   d, $00                                   ; $435D: $16 $00 ; $435D: $16 $00
    ld   hl, Data_001_4336                        ; $435F: $21 $36 $43 ; $435F: $21 $36 $43
    add  hl, de                                   ; $4362: $19 ; $4362: $19
    ld   a, [hl]                                  ; $4363: $7E ; $4363: $7E
    ld   hl, wOAMBuffer+$18                       ; $4364: $21 $18 $C0 ; $4364: $21 $18 $C0
    ld   [hl+], a                                 ; $4367: $22 ; $4367: $22
    ld   a, GAMEOVER_OPTION_X + $8                ; $4368: $3E $24 ; $4368: $3E $24
    ld   [hl+], a                                 ; $436A: $22 ; $436A: $22
    ld   a, $BE                                   ; $436B: $3E $BE ; $436B: $3E $BE
    ld   [hl+], a                                 ; $436D: $22 ; $436D: $22
    ld   [hl], $00                                ; $436E: $36 $00 ; $436E: $36 $00
    ret                                           ; $4370: $C9 ; $4370: $C9
