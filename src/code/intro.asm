;
; Opening sequence and Title screen
;

IntroSeaPaletteTable::
    db   $C6, $C2, $C0, $C2                       ; $01:6E19

IntroHandlerEntryPoint::
    ldh  a, [hButtonsInactiveDelay]               ; $01:6E1D: $F0 $B5
    and  a  ; if ButtonsInactiveDelay == 0        ; $01:6E1F: $A7
    jr   z, .checkJoypad                          ; $01:6E20: $28 $06
    ; ButtonsInactiveDelay != 0
    dec  a                                        ; $01:6E22: $3D
    ldh  [hButtonsInactiveDelay], a               ; $01:6E23: $E0 $B5
    jp   RenderIntroFrame                         ; $01:6E25: $C3 $B1 $6E

.checkJoypad
    ; If not pressing Start, render the next intro frame
    ldh  a, [hJoypadState]                        ; $01:6E28: $F0 $CC
    and  J_START                                  ; $01:6E2A: $E6 $80
    jp   z, RenderIntroFrame                      ; $01:6E2C: $CA $B1 $6E

    ;
    ; Start button pressed
    ;

    call label_27F2                               ; $01:6E2F: $CD $F2 $27

    ; If on Title Screen, transition to file menu
    ld   a, [wGameplaySubtype]                    ; $01:6E32: $FA $96 $DB
    cp   GAMEPLAY_INTRO_TITLE                     ; $01:6E35: $FE $0B
    jr   z, .transitionToFileMenu                 ; $01:6E37: $28 $5B

    ; else transition to Title screen
    ld   a, 40  ; Ignore joypad for the next 40 frames ; $01:6E39: $3E $28
    ldh  [hButtonsInactiveDelay], a               ; $01:6E3B: $E0 $B5
    ld   a, TILEMAP_TITLE                         ; $01:6E3D: $3E $11
    ld   [wBGMapToLoad], a                        ; $01:6E3F: $EA $FF $D6
    ldh  a, [hIsGBC]                              ; $01:6E42: $F0 $FE
    and  a                                        ; $01:6E44: $A7
    jr   nz, .isGBC                               ; $01:6E45: $20 $10
    ; Not GBC
    ld   a, [Data_001_789B]                       ; $01:6E47: $FA $9B $78
    ld   [wOBJ0Palette], a                        ; $01:6E4A: $EA $98 $DB
    ld   a, [Data_001_789F]                       ; $01:6E4D: $FA $9F $78
    ld   [wOBJ1Palette], a                        ; $01:6E50: $EA $99 $DB
    ld   a, $04                                   ; $01:6E53: $3E $04
    jr   .paletteEnd                              ; $01:6E55: $18 $0B
.isGBC
    ld   a, $01                                   ; $01:6E57: $3E $01
    call ClearFileMenuBG_trampoline               ; $01:6E59: $CD $FA $08
    xor  a                                        ; $01:6E5C: $AF
    ld   [wPaletteUnknownE], a                    ; $01:6E5D: $EA $D5 $DD
    ld   a, $08                                   ; $01:6E60: $3E $08
.paletteEnd

    ld   [wD013], a                               ; $01:6E62: $EA $13 $D0
    ; Set the wGameplaySubtype to $0D, which is
    ; a value that's never checked by itself, but
    ; perhaps dispatched to and/or used to count
    ; down in a transition to $0B which is
    ; GAMEPLAY_INTRO_TITLE ?
    ld   a, $0D                                   ; $01:6E65: $3E $0D
    ld   [wGameplaySubtype], a                    ; $01:6E67: $EA $96 $DB
    xor  a                                        ; $01:6E6A: $AF
    ; Reset entities
    ld   [wEntitiesStatusTable + $00], a          ; $01:6E6B: $EA $80 $C2
    ld   [wEntitiesStatusTable + $01], a          ; $01:6E6E: $EA $81 $C2
    ld   [wEntitiesStatusTable + $02], a          ; $01:6E71: $EA $82 $C2
    ld   [wEntitiesStatusTable + $03], a          ; $01:6E74: $EA $83 $C2
    ld   [wEntitiesStatusTable + $04], a          ; $01:6E77: $EA $84 $C2

    ldh  [rBGP], a                                ; $01:6E7A: $E0 $47
    ld   [wBGPalette], a                          ; $01:6E7C: $EA $97 $DB

    ld   a, $10                                   ; $01:6E7F: $3E $10
    ld   [wC17E], a                               ; $01:6E81: $EA $7E $C1

    call ResetIntroTimers                         ; $01:6E84: $CD $9D $73
    ld   a, MUSIC_TITLE_SCREEN_NO_INTRO           ; $01:6E87: $3E $0D
    ld   [wMusicTrackToPlay], a                   ; $01:6E89: $EA $68 $D3
    ld   [wD00F], a                               ; $01:6E8C: $EA $0F $D0
    call func_001_7D4E                            ; $01:6E8F: $CD $4E $7D
    jr   .enableVBlankInterruptAndReturn          ; $01:6E92: $18 $14

.transitionToFileMenu
    jp   TransitionToFileMenu                     ; $01:6E94: $C3 $52 $45

    ; POI: Jump to End Sequence (dead code, never reached)
    xor  a                                        ; $01:6E97: $AF
    ld   [wGameplaySubtype], a                    ; $01:6E98: $EA $96 $DB
    ldh  [hBaseScrollX], a                        ; $01:6E9B: $E0 $96
    ldh  [hBaseScrollY], a                        ; $01:6E9D: $E0 $97
    ldh  [rBGP], a                                ; $01:6E9F: $E0 $47
    ld   [wBGPalette], a                          ; $01:6EA1: $EA $97 $DB
    ld   hl, wGameplayType                        ; $01:6EA4: $21 $95 $DB
    inc  [hl]                                     ; $01:6EA7: $34

.enableVBlankInterruptAndReturn
    ld   a, IEF_VBLANK                            ; $01:6EA8: $3E $01
    ldh  [rIE], a ; Enable VBlank interrupt only  ; $01:6EAA: $E0 $FF
    ld   a, $4F                                   ; $01:6EAC: $3E $4F
    ldh  [rLYC], a                                ; $01:6EAE: $E0 $45
    ret                                           ; $01:6EB0: $C9

RenderIntroFrame::
    ld   a, [wGameplaySubtype]                    ; $01:6EB1: $FA $96 $DB
    cp   GAMEPLAY_INTRO_SEA                       ; $01:6EB4: $FE $03
    jr   c, .dispatchScene                        ; $01:6EB6: $38 $20
    cp   GAMEPLAY_INTRO_LIGHTNING                 ; $01:6EB8: $FE $05
    jr   nc, .dispatchScene                       ; $01:6EBA: $30 $1C

    ; Decrement wIntroLightningVisibleCountdown if > 0
    ld   a, [wIntroLightningVisibleCountdown]     ; $01:6EBC: $FA $00 $D0
    and  a                                        ; $01:6EBF: $A7
    jr   z, .decrementEnd                         ; $01:6EC0: $28 $04
    dec  a                                        ; $01:6EC2: $3D
    ld   [wIntroLightningVisibleCountdown], a     ; $01:6EC3: $EA $00 $D0
.decrementEnd

    ; Compute the palette modifier during lightning
    ; e = (wIntroLightningVisibleCountdown / 2) % 3
    rra                                           ; $01:6EC6: $1F
    nop                                           ; $01:6EC7: $00
    and  $03                                      ; $01:6EC8: $E6 $03
    ld   e, a                                     ; $01:6ECA: $5F
    ld   d, $00                                   ; $01:6ECB: $16 $00

    ld   hl, IntroSeaPaletteTable                 ; $01:6ECD: $21 $19 $6E
    add  hl, de                                   ; $01:6ED0: $19
    ld   a, [hl]                                  ; $01:6ED1: $7E
    ld   [wBGPalette], a                          ; $01:6ED2: $EA $97 $DB
    call UpdateIntroSeaBGPalettes_trampoline      ; $01:6ED5: $CD $F0 $08

.dispatchScene
    ld   a, [wGameplaySubtype]                    ; $01:6ED8: $FA $96 $DB
    JP_TABLE                                      ; $01:6EDB: $C7
._0 dw IntroSceneStage0Handler                    ; $01:6EDC
._1 dw IntroSceneStage1Handler                    ; $01:6EDE
._2 dw IntroSceneStage2Handler                    ; $01:6EE0
._3 dw IntroShipOnSeaHandler                      ; $01:6EE2
._4 dw IntroLinkFaceHandler                       ; $01:6EE4
._5 dw IntroStage5Handler ; transition?           ; $01:6EE6
._6 dw IntroStage6Handler ; transition?           ; $01:6EE8
._7 dw IntroBeachHandler                          ; $01:6EEA
._8 dw IntroStage8Handler ; title screen animation? ; $01:6EEC
._9 dw TitleScreenSfxHandler                      ; $01:6EEE
._A dw IntroStageAHandler ; title screen animation? ; $01:6EF0
._B dw TitleScreenHandler                         ; $01:6EF2
._C dw IntroStageCHandler                         ; $01:6EF4
._D dw IntroStageDHandler                         ; $01:6EF6

IntroSceneStage0Handler::
    call ClearLowerAndMiddleWRAM                  ; $01:6EF8: $CD $C1 $29
IF __PATCH_8__
    ld   a, BANK(@)
    ld   [wCurrentBank], a
ENDC
    call label_27F2                               ; $01:6EFB: $CD $F2 $27
    ld   a, $01                                   ; $01:6EFE: $3E $01
    call ClearFileMenuBG_trampoline               ; $01:6F00: $CD $FA $08

    ld   a, $1A                                   ; $01:6F03: $3E $1A
    call SetWorldMusicTrack                       ; $01:6F05: $CD $C3 $27

    ld   a, TILESET_CLEAR_TILEMAP                 ; $01:6F08: $3E $02
    ld   [wTilesetToLoad], a                      ; $01:6F0A: $EA $FE $D6

    xor  a                                        ; $01:6F0D: $AF
    ldh  [hFrameCounter], a                       ; $01:6F0E: $E0 $E7
    ld   a, $A2                                   ; $01:6F10: $3E $A2
    ld   [wRandomSeed], a                         ; $01:6F12: $EA $3D $C1
    ; Disable window
    ldh  a, [rLCDC]                               ; $01:6F15: $F0 $40
    and  ~LCDCF_WINON                             ; $01:6F17: $E6 $DF
    ld   [wLCDControl], a                         ; $01:6F19: $EA $FD $D6
    ldh  [rLCDC], a                               ; $01:6F1C: $E0 $40
    ld   a, $B4                                   ; $01:6F1E: $3E $B4
    ld   [wD016], a                               ; $01:6F20: $EA $16 $D0
    xor  a                                        ; $01:6F23: $AF
    ld   [wD017], a                               ; $01:6F24: $EA $17 $D0
    jp   IncrementGameplaySubtypeAndReturn        ; $01:6F27: $C3 $D6 $44

IntroSceneStage1Handler::
    ld   a, TILESET_INTRO                         ; $01:6F2A: $3E $10
    ld   [wTilesetToLoad], a                      ; $01:6F2C: $EA $FE $D6
    xor  a                                        ; $01:6F2F: $AF
    ld   [wPaletteUnknownE], a                    ; $01:6F30: $EA $D5 $DD
    jp   IncrementGameplaySubtypeAndReturn        ; $01:6F33: $C3 $D6 $44

IntroSceneStage2Handler::
    call func_001_7D01                            ; $01:6F36: $CD $01 $7D

    ldh  a, [hIsGBC]                              ; $01:6F39: $F0 $FE
    and  a                                        ; $01:6F3B: $A7
    jr   z, .notGBC                               ; $01:6F3C: $28 $04
    ld   a, TILEMAP_INTRO_SEA_CGB                 ; $01:6F3E: $3E $25
    jr   .bgMapEnd                                ; $01:6F40: $18 $02
.notGBC
    ld   a, TILEMAP_INTRO_SEA_DMG                 ; $01:6F42: $3E $0E
.bgMapEnd
    ld   [wBGMapToLoad], a                        ; $01:6F44: $EA $FF $D6

    ld   a, $1C                                   ; $01:6F47: $3E $1C
    ld   [wOBJ0Palette], a                        ; $01:6F49: $EA $98 $DB
    ld   a, $E0                                   ; $01:6F4C: $3E $E0
    ld   [wOBJ1Palette], a                        ; $01:6F4E: $EA $99 $DB
    ld   a, IEF_STAT | IEF_VBLANK                 ; $01:6F51: $3E $03
    ldh  [rIE], a                                 ; $01:6F53: $E0 $FF
    ld   a, $00                                   ; $01:6F55: $3E $00
    ldh  [rLYC], a                                ; $01:6F57: $E0 $45
    ld   e, $11                                   ; $01:6F59: $1E $11
    ld   hl, wIntroLightningVisibleCountdown      ; $01:6F5B: $21 $00 $D0
    xor  a                                        ; $01:6F5E: $AF

.loop
    ldi  [hl], a                                  ; $01:6F5F: $22
    dec  e                                        ; $01:6F60: $1D
    jr   nz, .loop                                ; $01:6F61: $20 $FC

    ld   [wEntitiesStatusTable + $00], a          ; $01:6F63: $EA $80 $C2
    ld   [wEntitiesStatusTable + $01], a          ; $01:6F66: $EA $81 $C2
    ld   [wEntitiesSpriteVariantTable], a         ; $01:6F69: $EA $B0 $C3
    ld   [wEntitiesSpriteVariantTable+1], a       ; $01:6F6C: $EA $B1 $C3
    ld   [wEntitiesSpriteVariantTable+2], a       ; $01:6F6F: $EA $B2 $C3
    ldh  [hActiveEntityFlipAttribute], a          ; $01:6F72: $E0 $ED

    ; Configure Link's ship entity
    ld   a, $05                                   ; $01:6F74: $3E $05
    ld   [wEntitiesStatusTable + $02], a          ; $01:6F76: $EA $82 $C2
    ld   a, $C0                                   ; $01:6F79: $3E $C0
    ld   [wEntitiesPosXTable + $02], a            ; $01:6F7B: $EA $02 $C2
    ld   a, $4E                                   ; $01:6F7E: $3E $4E
    ld   [wEntitiesPosYTable + $02], a            ; $01:6F80: $EA $12 $C2

    xor  a                                        ; $01:6F83: $AF
    ld   [wEntitiesPhysicsFlagsTable], a          ; $01:6F84: $EA $40 $C3
    ld   [wEntitiesPhysicsFlagsTable+1], a        ; $01:6F87: $EA $41 $C3
    ld   [wEntitiesPhysicsFlagsTable+2], a        ; $01:6F8A: $EA $42 $C3
    ld   [wEntitiesPhysicsFlagsTable+3], a        ; $01:6F8D: $EA $43 $C3
    jp   IncrementGameplaySubtypeAndReturn        ; $01:6F90: $C3 $D6 $44

Data_001_6F93::
    db   $81, $40, $00, $00, $00, $00, $00, $00, $00 ; $01:6F93

Data_001_6F9C::
    db   $08, $08, $08, $04, $00, $00, $00, $00, $00 ; $01:6F9C

IntroShipOnSeaHandler::
    call RenderRain                               ; $01:6FA5: $CD $66 $74
    call RenderIntroEntities                      ; $01:6FA8: $CD $D6 $74
    ld   a, [wIntroSubTimer]                      ; $01:6FAB: $FA $02 $D0
    and  a                                        ; $01:6FAE: $A7
    jr   z, .jr_001_7014                          ; $01:6FAF: $28 $63

    inc  a                                        ; $01:6FB1: $3C
    ld   [wIntroSubTimer], a ; Increment subtimer ; $01:6FB2: $EA $02 $D0
    cp   $18                                      ; $01:6FB5: $FE $18
    jr   c, .jp_001_7013                          ; $01:6FB7: $38 $5A
    sub  a, $18                                   ; $01:6FB9: $D6 $18
    rra                                           ; $01:6FBB: $1F
    rra                                           ; $01:6FBC: $1F
    rra                                           ; $01:6FBD: $1F
    and  $0F                                      ; $01:6FBE: $E6 $0F
    ld   e, a                                     ; $01:6FC0: $5F
    ld   d, $00                                   ; $01:6FC1: $16 $00
    ld   hl, Data_001_6F93                        ; $01:6FC3: $21 $93 $6F
    add  hl, de                                   ; $01:6FC6: $19
    ld   a, [hl]                                  ; $01:6FC7: $7E
    ld   [wBGPalette], a                          ; $01:6FC8: $EA $97 $DB
    ld   hl, Data_001_6F9C                        ; $01:6FCB: $21 $9C $6F
    add  hl, de                                   ; $01:6FCE: $19
    ld   a, [hl]                                  ; $01:6FCF: $7E
    ld   [wOBJ0Palette], a                        ; $01:6FD0: $EA $98 $DB
    call func_020_6A30_trampoline                 ; $01:6FD3: $CD $D7 $08
    ld   a, e                                     ; $01:6FD6: $7B
    cp   $08                                      ; $01:6FD7: $FE $08
    jp   nz, .jp_001_7013                         ; $01:6FD9: $C2 $13 $70
    xor  a                                        ; $01:6FDC: $AF
    ld   [wEntitiesStatusTable], a                ; $01:6FDD: $EA $80 $C2
    ld   [wEntitiesStatusTable+1], a              ; $01:6FE0: $EA $81 $C2
    ld   [wEntitiesStatusTable+2], a              ; $01:6FE3: $EA $82 $C2
    ld   [wEntitiesStateTable], a                 ; $01:6FE6: $EA $90 $C2
    ld   a, GAMEPLAY_INTRO_LIGHTNING              ; $01:6FE9: $3E $05
    ld   [wGameplaySubtype], a                    ; $01:6FEB: $EA $96 $DB
    ld   [wD00F], a                               ; $01:6FEE: $EA $0F $D0
    call func_001_7D4E                            ; $01:6FF1: $CD $4E $7D

    ld   a, TILESET_TITLE                         ; $01:6FF4: $3E $11
    ld   [wTilesetToLoad], a                      ; $01:6FF6: $EA $FE $D6

    ld   a, $FF                                   ; $01:6FF9: $3E $FF
    ld   [wIntroTimer], a                         ; $01:6FFB: $EA $01 $D0

    xor  a                                        ; $01:6FFE: $AF
    ldh  [hBaseScrollX], a                        ; $01:6FFF: $E0 $96
    ld   [wScrollXOffsetForSection], a            ; $01:7001: $EA $00 $C1
    ld   [wScrollXOffsetForSection+2], a          ; $01:7004: $EA $02 $C1
    ld   [wScrollXOffsetForSection+3], a          ; $01:7007: $EA $03 $C1
    ld   a, $92                                   ; $01:700A: $3E $92
    ld   [wScrollXOffsetForSection+1], a          ; $01:700C: $EA $01 $C1
    ld   a, IEF_STAT | IEF_VBLANK                 ; $01:700F: $3E $03
    ldh  [rIE], a                                 ; $01:7011: $E0 $FF

.jp_001_7013
    ret                                           ; $01:7013: $C9

.jr_001_7014
    ; If Intro's ship X == $50…
    ld   a, [wEntitiesPosXTable + $02]            ; $01:7014: $FA $02 $C2
    cp   $50                                      ; $01:7017: $FE $50
    jr   nz, .transitionEnd                       ; $01:7019: $20 $16

    ; Transition to next sequence
    ld   a, $FF                                   ; $01:701B: $3E $FF
    ldh  [rBGP], a                                ; $01:701D: $E0 $47
    ld   a, GAMEPLAY_INTRO_LINK_FACE              ; $01:701F: $3E $04
    ld   [wGameplaySubtype], a                    ; $01:7021: $EA $96 $DB
    ld   a, TILEMAP_INTRO_LINK_FACE               ; $01:7024: $3E $0F
    ld   [wBGMapToLoad], a                        ; $01:7026: $EA $FF $D6
    ld   a, IEF_VBLANK                            ; $01:7029: $3E $01
    ldh  [rIE], a                                 ; $01:702B: $E0 $FF
    xor  a                                        ; $01:702D: $AF
    ldh  [hBaseScrollX], a                        ; $01:702E: $E0 $96
    ret                                           ; $01:7030: $C9
.transitionEnd

    call func_001_7D01                            ; $01:7031: $CD $01 $7D
    ldh  a, [hFrameCounter]                       ; $01:7034: $F0 $E7
    and  $07                                      ; $01:7036: $E6 $07
    jp   nz, IntroShipOnSeaReturn                 ; $01:7038: $C2 $B1 $70
    ld   hl, hBaseScrollX                         ; $01:703B: $21 $96 $FF
    inc  [hl]                                     ; $01:703E: $34
    ld   hl, wEntitiesPosXTable                   ; $01:703F: $21 $00 $C2
    dec  [hl]                                     ; $01:7042: $35
    inc  hl                                       ; $01:7043: $23
    dec  [hl]                                     ; $01:7044: $35
    inc  hl                                       ; $01:7045: $23
    dec  [hl]                                     ; $01:7046: $35
    ld   c, $00                                   ; $01:7047: $0E $00

    ldh  a, [hBaseScrollX]                        ; $01:7049: $F0 $96
    cp   $10                                      ; $01:704B: $FE $10
    jr   z, .jr_001_7068                          ; $01:704D: $28 $19
    inc  c                                        ; $01:704F: $0C
    cp   $30                                      ; $01:7050: $FE $30
    jr   z, .jr_001_7068                          ; $01:7052: $28 $14
    inc  c                                        ; $01:7054: $0C
    cp   $38                                      ; $01:7055: $FE $38
    jr   z, .jr_001_7068                          ; $01:7057: $28 $0F
    inc  c                                        ; $01:7059: $0C
    cp   $58                                      ; $01:705A: $FE $58
    jr   z, .jr_001_7068                          ; $01:705C: $28 $0A
    inc  c                                        ; $01:705E: $0C
    cp   $5A                                      ; $01:705F: $FE $5A
    jr   z, .jr_001_7068                          ; $01:7061: $28 $05
    inc  c                                        ; $01:7063: $0C
    cp   $69                                      ; $01:7064: $FE $69
    jr   nz, IntroShipOnSeaReturn                 ; $01:7066: $20 $49
.jr_001_7068

    ld   e, $01                                   ; $01:7068: $1E $01
    ld   d, $00                                   ; $01:706A: $16 $00

.loop
    ld   hl, wEntitiesStatusTable                 ; $01:706C: $21 $80 $C2
    add  hl, de                                   ; $01:706F: $19
    ld   a, [hl]                                  ; $01:7070: $7E
    and  a                                        ; $01:7071: $A7
    jr   z, RenderLightning                       ; $01:7072: $28 $13
    dec  e                                        ; $01:7074: $1D
    ld   a, e                                     ; $01:7075: $7B
    cp   -1                                       ; $01:7076: $FE $FF
    jr   nz, .loop                                ; $01:7078: $20 $F2
    ret                                           ; $01:707A: $C9

Data_001_707B::
    db $28, $78, $60, $38, $68, $58               ; $01:707B

Data_001_7081::
    db 4, 2, 1, 4, 3, 1                           ; $01:7081

; Spark a lightning over the sea
RenderLightning::
    ld   b, 0                                     ; $01:7087: $06 $00

    ; Set lightning entity status
    ld   hl, Data_001_7081                        ; $01:7089: $21 $81 $70
    add  hl, bc                                   ; $01:708C: $09
    ld   a, [hl]                                  ; $01:708D: $7E
    ld   hl, wEntitiesStatusTable                 ; $01:708E: $21 $80 $C2
    add  hl, de                                   ; $01:7091: $19
    ld   [hl], a                                  ; $01:7092: $77

    ; Set lightning X position
    ld   hl, Data_001_707B                        ; $01:7093: $21 $7B $70
    add  hl, bc                                   ; $01:7096: $09
    ld   a, [hl]                                  ; $01:7097: $7E
    ld   hl, wEntitiesPosXTable                   ; $01:7098: $21 $00 $C2
    add  hl, de                                   ; $01:709B: $19
    ld   [hl], a                                  ; $01:709C: $77

    ; Set lightning Y position
    ld   hl, wEntitiesPosYTable                   ; $01:709D: $21 $10 $C2
    add  hl, de                                   ; $01:70A0: $19
    ld   [hl], $30                                ; $01:70A1: $36 $30

    ld   hl, wEntitiesTransitionCountdownTable    ; $01:70A3: $21 $E0 $C2
    add  hl, de                                   ; $01:70A6: $19
    ld   [hl], $20                                ; $01:70A7: $36 $20

.playSfx
    ld   a, $1C                                   ; $01:70A9: $3E $1C
    ld   [wIntroLightningVisibleCountdown], a     ; $01:70AB: $EA $00 $D0

    call PlayBombExplosionSfx                     ; $01:70AE: $CD $4B $0C

IntroShipOnSeaReturn:
    ret                                           ; $01:70B1: $C9

IntroLinkFaceHandler::
    call RenderRain                               ; $01:70B2: $CD $66 $74
    ld   a, [wIntroTimer]                         ; $01:70B5: $FA $01 $D0
    inc  a                                        ; $01:70B8: $3C
    ld   [wIntroTimer], a                         ; $01:70B9: $EA $01 $D0
    cp   128                                      ; $01:70BC: $FE $80
    jr   nz, .continue                            ; $01:70BE: $20 $05
    ; If IntroTimer == 128 frames
    push af                                       ; $01:70C0: $F5
    call IntroLinkScream                          ; $01:70C1: $CD $C7 $74
    pop  af                                       ; $01:70C4: $F1

.continue
    cp   144                                      ; $01:70C5: $FE $90
    jr   nz, .continue2                           ; $01:70C7: $20 $03
    ; If IntroTimer == 144 frames
    ; Lightning over Link's face
    call RenderLightning.playSfx                  ; $01:70C9: $CD $A9 $70

.continue2
    cp   160                                      ; $01:70CC: $FE $A0
    jr   nz, .continue4                           ; $01:70CE: $20 $27
    ; If FrameCounter == 160 frames
    ; Move back to sea sequence
    ld   a, GAMEPLAY_INTRO_SEA                    ; $01:70D0: $3E $03
    ld   [wGameplaySubtype], a                    ; $01:70D2: $EA $96 $DB

    ldh  a, [hIsGBC]                              ; $01:70D5: $F0 $FE
    and  a                                        ; $01:70D7: $A7
    jr   z, .notGBC                               ; $01:70D8: $28 $04
    ld   a, TILEMAP_INTRO_SEA_CGB                 ; $01:70DA: $3E $25
    jr   .continue3                               ; $01:70DC: $18 $02
.notGBC
    ld   a, TILEMAP_INTRO_SEA_DMG                 ; $01:70DE: $3E $0E
.continue3
    ld   [wBGMapToLoad], a                        ; $01:70E0: $EA $FF $D6

    call LoadTileMapZero_trampoline               ; $01:70E3: $CD $08 $71
    ; Enable interrupts on VBlank and LCDStat
    ld   a, IEF_STAT | IEF_VBLANK                 ; $01:70E6: $3E $03
    ldh  [rIE], a                                 ; $01:70E8: $E0 $FF
    xor  a                                        ; $01:70EA: $AF
    ld   [wEntitiesStatusTable], a                ; $01:70EB: $EA $80 $C2
    ld   [wEntitiesStatusTable+1], a              ; $01:70EE: $EA $81 $C2
    ld   a, $01                                   ; $01:70F1: $3E $01
    ld   [wIntroSubTimer], a                      ; $01:70F3: $EA $02 $D0
    ret                                           ; $01:70F6: $C9

.continue4
    ldh  a, [hFrameCounter]                       ; $01:70F7: $F0 $E7
    and  $7F                                      ; $01:70F9: $E6 $7F
    jr   nz, .return                              ; $01:70FB: $20 $0A
    ; FrameCounter == $7F
    call GetRandomByte                            ; $01:70FD: $CD $0D $28
    and  $00                                      ; $01:7100: $E6 $00
    jr   nz, .return ; always false               ; $01:7102: $20 $03
    call RenderLightning.playSfx                  ; $01:7104: $CD $A9 $70

.return
    ret                                           ; $01:7107: $C9

LoadTileMapZero_trampoline::
    ld   hl, wFarcallParams                       ; $01:7108: $21 $01 $DE
    ld   a, BANK(LoadRequestedGfx.loadBGMap)      ; $01:710B: $3E $00
    ldi  [hl], a                                  ; $01:710D: $22
    ld   a, HIGH(LoadRequestedGfx.loadBGMap)      ; $01:710E: $3E $04
    ldi  [hl], a                                  ; $01:7110: $22
    ld   a, LOW(LoadRequestedGfx.loadBGMap)       ; $01:7111: $3E $3A
    ldi  [hl], a                                  ; $01:7113: $22
    ld   a, BANK(@)                               ; $01:7114: $3E $01
    ld   [hl], a                                  ; $01:7116: $77
    jp   Farcall                                  ; $01:7117: $C3 $D7 $0B

IntroStage5Handler::
    ld   a, TILEMAP_INTRO_BEACH                   ; $01:711A: $3E $10
    ld   [wBGMapToLoad], a                        ; $01:711C: $EA $FF $D6

    ld   a, $01                                   ; $01:711F: $3E $01
    ld   [wPaletteUnknownE], a                    ; $01:7121: $EA $D5 $DD

    call IncrementGameplaySubtype                 ; $01:7124: $CD $D6 $44
    ret                                           ; $01:7127: $C9

Data_001_7128::
    db 0, 0, 0, 0, $40, $40, $40, $80, $85, $85, $85, $C5, $C9, $C9, $C9, $C9 ; $01:7128

Data_001_7138::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C ; $01:7138

Data_001_7148::
    db 0, 0, 0, 0, $40, $40, $40, $40, $90, $90, $90, $90 ; $01:7148

label_7154::
    ldh  [hMultiPurpose9], a                      ; $01:7154: $E0 $E0
    ldh  [hMultiPurpose9], a                      ; $01:7156: $E0 $E0

IntroStage6Handler::
    call func_001_71C7                            ; $01:7158: $CD $C7 $71
    ld   a, [wIntroTimer]                         ; $01:715B: $FA $01 $D0
    cp   $A0                                      ; $01:715E: $FE $A0
    jr   nz, .jr_001_7168                         ; $01:7160: $20 $06
    push af                                       ; $01:7162: $F5
    ld   a, $02                                   ; $01:7163: $3E $02
    ldh  [rLYC], a                                ; $01:7165: $E0 $45
    pop  af                                       ; $01:7167: $F1

.jr_001_7168
    dec  a                                        ; $01:7168: $3D
    ld   [wIntroTimer], a                         ; $01:7169: $EA $01 $D0
    jr   nz, .jr_001_7188                         ; $01:716C: $20 $1A
    ld   a, GAMEPLAY_INTRO_BEACH                  ; $01:716E: $3E $07
    ld   [wGameplaySubtype], a                    ; $01:7170: $EA $96 $DB
    ld   a, $06                                   ; $01:7173: $3E $06
    ld   [wEntitiesStatusTable], a                ; $01:7175: $EA $80 $C2
    ld   a, $B0                                   ; $01:7178: $3E $B0
    ld   [wEntitiesPosXTable], a                  ; $01:717A: $EA $00 $C2
    ld   a, $68                                   ; $01:717D: $3E $68
    ld   [wEntitiesPosYTable], a                  ; $01:717F: $EA $10 $C2
    ld   a, $01                                   ; $01:7182: $3E $01
    ld   [wEntitiesInertiaTable], a               ; $01:7184: $EA $D0 $C3
    ret                                           ; $01:7187: $C9

.jr_001_7188
    cp   $34                                      ; $01:7188: $FE $34
    jr   nc, .return                              ; $01:718A: $30 $36
    and  $03                                      ; $01:718C: $E6 $03
    jr   nz, .jr_001_719B                         ; $01:718E: $20 $0B
    ld   a, [wD010]                               ; $01:7190: $FA $10 $D0
    cp   $0C                                      ; $01:7193: $FE $0C
    jr   z, .jr_001_719B                          ; $01:7195: $28 $04
    inc  a                                        ; $01:7197: $3C
    ld   [wD010], a                               ; $01:7198: $EA $10 $D0

.jr_001_719B
    ldh  a, [hFrameCounter]                       ; $01:719B: $F0 $E7
    and  $03                                      ; $01:719D: $E6 $03
    ld   e, a                                     ; $01:719F: $5F
    ld   a, [wD010]                               ; $01:71A0: $FA $10 $D0
    add  a, e                                     ; $01:71A3: $83
    ld   e, a                                     ; $01:71A4: $5F
    ld   d, $00                                   ; $01:71A5: $16 $00
    ld   hl, Data_001_7128                        ; $01:71A7: $21 $28 $71
    add  hl, de                                   ; $01:71AA: $19
    ld   a, [hl]                                  ; $01:71AB: $7E
    ld   [wBGPalette], a                          ; $01:71AC: $EA $97 $DB
    ld   hl, Data_001_7138                        ; $01:71AF: $21 $38 $71
    add  hl, de                                   ; $01:71B2: $19
    ld   a, [hl]                                  ; $01:71B3: $7E
    ld   [wOBJ0Palette], a                        ; $01:71B4: $EA $98 $DB
    ld   hl, Data_001_7148                        ; $01:71B7: $21 $48 $71
    add  hl, de                                   ; $01:71BA: $19
    ld   a, [hl]                                  ; $01:71BB: $7E
    ld   [wOBJ1Palette], a                        ; $01:71BC: $EA $99 $DB
    call func_020_6AC1_trampoline                 ; $01:71BF: $CD $E6 $08

.return
    ret                                           ; $01:71C2: $C9

IntroBeachHandler::
    call RenderIntroEntities                      ; $01:71C3: $CD $D6 $74
    ret                                           ; $01:71C6: $C9

func_001_71C7::
    ld   a, [wEntitiesStateTable+1]               ; $01:71C7: $FA $91 $C2
    cp   $02                                      ; $01:71CA: $FE $02
    jr   nc, .return                              ; $01:71CC: $30 $10
    ld   a, [wNoiseSfxSeaWavesCounter]            ; $01:71CE: $FA $14 $C1
    inc  a                                        ; $01:71D1: $3C
    cp   $A0                                      ; $01:71D2: $FE $A0
    jr   nz, .jr_001_71DB                         ; $01:71D4: $20 $05
    ld   a, NOISE_SFX_SEA_WAVES                   ; $01:71D6: $3E $0F
    ldh  [hNoiseSfx], a                           ; $01:71D8: $E0 $F4
    xor  a                                        ; $01:71DA: $AF

.jr_001_71DB
    ld   [wNoiseSfxSeaWavesCounter], a            ; $01:71DB: $EA $14 $C1

.return
    ret                                           ; $01:71DE: $C9

Data_001_71DF::
    db   $9A, $16, $0F, $80, $81, $82, $83, $84   ; $01:71DF
    db   $85, $86, $87, $88, $89, $8A, $8B, $8C   ; $01:71E7
    db   $8D, $8E, $8F                            ; $01:71EF

Data_001_71F2::
    db   $9A, $36, $0F, $90, $91                  ; $01:71F2
    db   $92, $93, $94, $95, $96, $97, $98, $99   ; $01:71F7
    db   $9A, $9B, $9C, $9D, $9E, $9F             ; $01:71FF

Data_001_7205::
    db   $9A, $56                                 ; $01:7205
    db   $0F, $A0, $A1, $A2, $A3, $A4, $A5, $A6   ; $01:7207
    db   $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE   ; $01:720F
    db   $AF                                      ; $01:7217

Data_001_7218::
    db   $9A, $76, $0F, $B0, $B1, $B2, $B3        ; $01:7218
    db   $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB   ; $01:721F
    db   $BC, $BD, $BE, $BF                       ; $01:7227

Data_001_722B::
    db   $9A, $96, $0F, $C0                       ; $01:722B
    db   $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8   ; $01:722F
    db   $C9, $CA, $CB, $CC, $CD, $CE, $CF        ; $01:7237

Data_001_723E::
    db   $9A                                      ; $01:723E
    db   $B6, $0F, $D0, $D1, $D2, $D3, $D4, $D5   ; $01:723F
    db   $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD   ; $01:7247
    db   $DE, $DF                                 ; $01:724F

Data_001_7251::
    db   $9A, $D6, $0F, $E0, $E1, $E2             ; $01:7251
    db   $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA   ; $01:7257
    db   $EB, $EC, $ED, $EE, $EF                  ; $01:725F

Data_001_7264::
    dw Data_001_7218                              ; $01:7264
    dw Data_001_7205                              ; $01:7266
    dw Data_001_722B                              ; $01:7268
    dw Data_001_71F2                              ; $01:726A
    dw Data_001_723E                              ; $01:726C
    dw Data_001_71DF                              ; $01:726E
    dw Data_001_7251                              ; $01:7270

IntroStage8Handler::
    ld   a, [wIntroSubTimer]                      ; $01:7272: $FA $02 $D0
    sla  a                                        ; $01:7275: $CB $27
    ld   e, a                                     ; $01:7277: $5F
    ld   d, $00                                   ; $01:7278: $16 $00
    ld   hl, Data_001_7264                        ; $01:727A: $21 $64 $72
    add  hl, de                                   ; $01:727D: $19
    ld   a, [hli]                                 ; $01:727E: $2A
    ld   d, [hl]                                  ; $01:727F: $56
    ld   e, a                                     ; $01:7280: $5F
    ld   hl, wDrawCommand                         ; $01:7281: $21 $01 $D6
    ld   c, $13                                   ; $01:7284: $0E $13

.loop
    ld   a, [de]                                  ; $01:7286: $1A
    inc  de                                       ; $01:7287: $13
    ldi  [hl], a                                  ; $01:7288: $22
    dec  c                                        ; $01:7289: $0D
    jr   nz, .loop                                ; $01:728A: $20 $FA

    ld   [hl], $00                                ; $01:728C: $36 $00
    ldh  a, [hIsGBC]                              ; $01:728E: $F0 $FE
    and  a                                        ; $01:7290: $A7
    jr   z, .gbc                                  ; $01:7291: $28 $03
    call func_001_7338                            ; $01:7293: $CD $38 $73
.gbc

    ld   a, [wIntroSubTimer]                      ; $01:7296: $FA $02 $D0
    inc  a                                        ; $01:7299: $3C
    ld   [wIntroSubTimer], a                      ; $01:729A: $EA $02 $D0
    cp   $07                                      ; $01:729D: $FE $07
    jr   nz, .return                              ; $01:729F: $20 $03
    call IncrementGameplaySubtype                 ; $01:72A1: $CD $D6 $44

.return
    ret                                           ; $01:72A4: $C9



; Title screen attribute map, encoded
; This controls the logo palette

TitleAttrMap1::
    db   $9A, $16, $0F
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
TitleAttrMap2::
    db   $9A, $36, $0F
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
TitleAttrMap3::
    db   $9A, $56, $0F
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

IF LANG_JP ;The JP version has a gradient in the logo

TitleAttrMap4::
    db   $9A, $76, $0F
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
TitleAttrMap5::
    db   $9A, $96, $0F
    db   $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
TitleAttrMap6::
    db   $9A, $B6, $0F
    db   $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
TitleAttrMap7::
    db   $9A, $D6, $0F
    db   $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02

ELSE

TitleAttrMap4::
    db   $9A, $76, $0F
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
TitleAttrMap5::
    db   $9A, $96, $0F
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
TitleAttrMap6::
    db   $9A, $B6, $0F
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
TitleAttrMap7::
    db   $9A, $D6, $0F
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

ENDC

TitleAttrMap::
    dw   TitleAttrMap4
    dw   TitleAttrMap3
    dw   TitleAttrMap5
    dw   TitleAttrMap2
    dw   TitleAttrMap6
    dw   TitleAttrMap1
    dw   TitleAttrMap7



func_001_7338::
    ld   a, [wIntroSubTimer]                      ; $01:7338: $FA $02 $D0
    sla  a                                        ; $01:733B: $CB $27
    ld   e, a                                     ; $01:733D: $5F
    ld   d, $00                                   ; $01:733E: $16 $00
    ld   hl, TitleAttrMap                         ; $01:7340: $21 $2A $73
    add  hl, de                                   ; $01:7343: $19
    ld   a, [hli]                                 ; $01:7344: $2A
    ld   d, [hl]                                  ; $01:7345: $56
    ld   e, a                                     ; $01:7346: $5F
    ld   hl, wDrawCommandAlt                      ; $01:7347: $21 $91 $DC
    ld   c, $13                                   ; $01:734A: $0E $13

.loop_734C
    ld   a, [de]                                  ; $01:734C: $1A
    inc  de                                       ; $01:734D: $13
    ldi  [hl], a                                  ; $01:734E: $22
    dec  c                                        ; $01:734F: $0D
    jr   nz, .loop_734C                           ; $01:7350: $20 $FA
    ld   [hl], $00                                ; $01:7352: $36 $00
    ret                                           ; $01:7354: $C9

TitleScreenSfxHandler::
    ; If wC17E != 10…
    ld   a, [wC17E]                               ; $01:7355: $FA $7E $C1
    cp   $10                                      ; $01:7358: $FE $10
    jr   c, .return                               ; $01:735A: $38 $07

    ld   a, NOISE_SFX_PING                        ; $01:735C: $3E $19
    ldh  [hNoiseSfx], a                           ; $01:735E: $E0 $F4
    call IncrementGameplaySubtype                 ; $01:7360: $CD $D6 $44
.return
    ret                                           ; $01:7363: $C9

TitleScreenCopyrightDrawCommand::
    db   $9B, $B7, $0D, $65, $66, $67, $68, $69   ; $7364 ; $01:7364
    db   $6A, $6B, $6C, $6D, $6E, $6F, $70, $71   ; $736C ; $01:736C
    db   $72, $00                                 ; $7374 ; $01:7374

IntroStageAHandler::
    ld   de, TitleScreenCopyrightDrawCommand      ; $01:7376: $11 $64 $73
    ld   hl, wDrawCommand                         ; $01:7379: $21 $01 $D6
    ld   c, $12                                   ; $01:737C: $0E $12

.loop
    ld   a, [de]                                  ; $01:737E: $1A
    inc  de                                       ; $01:737F: $13
    ldi  [hl], a                                  ; $01:7380: $22
    dec  c                                        ; $01:7381: $0D
    jr   nz, .loop                                ; $01:7382: $20 $FA

    ldh  a, [hIsGBC]                              ; $01:7384: $F0 $FE
    and  a                                        ; $01:7386: $A7
    jr   nz, .gbc                                 ; $01:7387: $20 $05
    call func_001_79AE                            ; $01:7389: $CD $AE $79
    jr   .endIf                                   ; $01:738C: $18 $07
.gbc
    xor  a                                        ; $01:738E: $AF
    call func_001_79C2                            ; $01:738F: $CD $C2 $79
    call func_001_73B1                            ; $01:7392: $CD $B1 $73
.endIf

    ld   a, $3C                                   ; $01:7395: $3E $3C
    ld   [wD015], a                               ; $01:7397: $EA $15 $D0
    call IncrementGameplaySubtype                 ; $01:739A: $CD $D6 $44
    ; fallthrough

ResetIntroTimers::
    ld   a, $A0                                   ; $01:739D: $3E $A0
    ld   [wIntroTimer], a                         ; $01:739F: $EA $01 $D0
    xor  a                                        ; $01:73A2: $AF
    ld   [wIntroSubTimer], a                      ; $01:73A3: $EA $02 $D0
    ld   a, $FF                                   ; $01:73A6: $3E $FF
    ld   [wD003], a                               ; $01:73A8: $EA $03 $D0
    ret                                           ; $01:73AB: $C9

Data_001_73AC::
    db   $9B, $B7, $4D, $07, $00                  ; $01:73AC

func_001_73B1::
    ld   de, Data_001_73AC                        ; $01:73B1: $11 $AC $73
    ld   hl, wDrawCommandAlt                      ; $01:73B4: $21 $91 $DC
    ld   c, $12                                   ; $01:73B7: $0E $12

.loop
    ld   a, [de]                                  ; $01:73B9: $1A
    inc  de                                       ; $01:73BA: $13
    ldi  [hl], a                                  ; $01:73BB: $22
    dec  c                                        ; $01:73BC: $0D
    jr   nz, .loop                                ; $01:73BD: $20 $FA
    ret                                           ; $01:73BF: $C9

Data_001_73C0::
    db $18, $18, $38, $40, $58, $60, $80, $88     ; $01:73C0

Data_001_73C8::
    db $20, $48, $44, $28, $44, $28, $28, $40     ; $01:73C8

TitleScreenHandler::
    call RenderIntroEntities                      ; $01:73D0: $CD $D6 $74
    call func_001_7920                            ; $01:73D3: $CD $20 $79
    ldh  a, [hFrameCounter]                       ; $01:73D6: $F0 $E7
    and  $3F                                      ; $01:73D8: $E6 $3F
    jr   nz, .jr_001_7418                         ; $01:73DA: $20 $3C
    ld   e, $01                                   ; $01:73DC: $1E $01
    ld   d, $00                                   ; $01:73DE: $16 $00

.loop
    ld   hl, wEntitiesStatusTable                 ; $01:73E0: $21 $80 $C2
    add  hl, de                                   ; $01:73E3: $19
    ld   a, [hl]                                  ; $01:73E4: $7E
    and  a                                        ; $01:73E5: $A7
    jr   z, .jr_001_73F0                          ; $01:73E6: $28 $08
    dec  e                                        ; $01:73E8: $1D
    ld   a, e                                     ; $01:73E9: $7B
    cp   $FF                                      ; $01:73EA: $FE $FF
    jr   nz, .loop                                ; $01:73EC: $20 $F2
    jr   .jr_001_7418                             ; $01:73EE: $18 $28

.jr_001_73F0
    ld   [hl], $08                                ; $01:73F0: $36 $08
    ld   hl, wEntitiesTransitionCountdownTable    ; $01:73F2: $21 $E0 $C2
    add  hl, de                                   ; $01:73F5: $19
    ld   [hl], $3F                                ; $01:73F6: $36 $3F
    ld   a, [wD003]                               ; $01:73F8: $FA $03 $D0
    inc  a                                        ; $01:73FB: $3C
    ld   [wD003], a                               ; $01:73FC: $EA $03 $D0
    and  $07                                      ; $01:73FF: $E6 $07
    ld   c, a                                     ; $01:7401: $4F
    ld   b, $00                                   ; $01:7402: $06 $00

    ld   hl, Data_001_73C0                        ; $01:7404: $21 $C0 $73
    add  hl, bc                                   ; $01:7407: $09
    ld   a, [hl]                                  ; $01:7408: $7E
    ld   hl, wEntitiesPosXTable                   ; $01:7409: $21 $00 $C2
    add  hl, de                                   ; $01:740C: $19
    ld   [hl], a                                  ; $01:740D: $77
    ld   hl, Data_001_73C8                        ; $01:740E: $21 $C8 $73
    add  hl, bc                                   ; $01:7411: $09
    ld   a, [hl]                                  ; $01:7412: $7E
    ld   hl, wEntitiesPosYTable                   ; $01:7413: $21 $10 $C2
    add  hl, de                                   ; $01:7416: $19
    ld   [hl], a                                  ; $01:7417: $77

.jr_001_7418
    ld   a, [wIntroSubTimer]                      ; $01:7418: $FA $02 $D0
    inc  a                                        ; $01:741B: $3C
    ld   [wIntroSubTimer], a                      ; $01:741C: $EA $02 $D0
    and  $0F                                      ; $01:741F: $E6 $0F
    jr   nz, .return                              ; $01:7421: $20 $16
    ld   a, [wIntroTimer]                         ; $01:7423: $FA $01 $D0
    dec  a                                        ; $01:7426: $3D
    ld   [wIntroTimer], a                         ; $01:7427: $EA $01 $D0
    jr   nz, .return                              ; $01:742A: $20 $0D
    call IncrementGameplaySubtype                 ; $01:742C: $CD $D6 $44
    xor  a                                        ; $01:742F: $AF
    ld   [wTransitionSequenceCounter], a          ; $01:7430: $EA $6B $C1
    ld   [wC16C], a                               ; $01:7433: $EA $6C $C1
    call ResetMusicFadeTimer                      ; $01:7436: $CD $EA $27

.return
    ret                                           ; $01:7439: $C9

IntroStageCHandler::
    call func_1A22                                ; $01:743A: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $01:743D: $FA $6B $C1
    cp   $04                                      ; $01:7440: $FE $04
    jr   nz, .return                              ; $01:7442: $20 $03
    jp   func_001_6162                            ; $01:7444: $C3 $62 $61

.return
    ret                                           ; $01:7447: $C9

IntroStageDHandler::
    ld   a, $11                                   ; $01:7448: $3E $11
    ld   [wTilesetToLoad], a                      ; $01:744A: $EA $FE $D6
    ld   a, GAMEPLAY_INTRO_TITLE                  ; $01:744D: $3E $0B
    ld   [wGameplaySubtype], a                    ; $01:744F: $EA $96 $DB
    ld   a, $C9                                   ; $01:7452: $3E $C9
    ld   [wBGPalette], a                          ; $01:7454: $EA $97 $DB
    ld   a, $1C                                   ; $01:7457: $3E $1C
    ld   [wOBJ0Palette], a                        ; $01:7459: $EA $98 $DB
    xor  a                                        ; $01:745C: $AF
    ldh  [hBaseScrollX], a                        ; $01:745D: $E0 $96
    ldh  [hBaseScrollY], a                        ; $01:745F: $E0 $97
    dec  a                                        ; $01:7461: $3D
    ld   [wD018], a                               ; $01:7462: $EA $18 $D0
    ret                                           ; $01:7465: $C9

RenderRain::
    call GetRandomByte                            ; $01:7466: $CD $0D $28
    and  $18                                      ; $01:7469: $E6 $18
    add  a, $10                                   ; $01:746B: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $01:746D: $E0 $D8
    call GetRandomByte                            ; $01:746F: $CD $0D $28
    and  $18                                      ; $01:7472: $E6 $18
    add  a, $10                                   ; $01:7474: $C6 $10
    ldh  [hMultiPurpose0], a                      ; $01:7476: $E0 $D7
    ld   hl, wDynamicOAMBuffer+$1C                ; $01:7478: $21 $4C $C0
    ; On the sea, limit the rain to the top section of the screen ($10)
    ld   c, $10                                   ; $01:747B: $0E $10
    ld   a, [wGameplaySubtype]                    ; $01:747D: $FA $96 $DB
    cp   GAMEPLAY_INTRO_LINK_FACE ; if GameplaySubtype != LINK_FACE ; $01:7480: $FE $04
    jr   nz, .loop                                ; $01:7482: $20 $02
    ; On Link's face, the rain covers all the $15 rows of the screen
    ld   c, $15                                   ; $01:7484: $0E $15

.loop
    ldh  a, [hMultiPurpose1]                      ; $01:7486: $F0 $D8
    ldi  [hl], a                                  ; $01:7488: $22
    ldh  a, [hMultiPurpose0]                      ; $01:7489: $F0 $D7
    ldi  [hl], a                                  ; $01:748B: $22
    call GetRandomByte                            ; $01:748C: $CD $0D $28
    and  $01       ; if random(0,1) == 0          ; $01:748F: $E6 $01
    ld   a, $28                                   ; $01:7491: $3E $28
    jr   z, .next  ;   jump to next               ; $01:7493: $28 $07
    call GetRandomByte                            ; $01:7495: $CD $0D $28
    and  $06                                      ; $01:7498: $E6 $06
    add  a, $70                                   ; $01:749A: $C6 $70

.next
    ldi  [hl], a                                  ; $01:749C: $22
    ld   a, $00                                   ; $01:749D: $3E $00
    ldi  [hl], a                                  ; $01:749F: $22
    ldh  a, [hMultiPurpose0]                      ; $01:74A0: $F0 $D7
    add  a, $1C                                   ; $01:74A2: $C6 $1C
    ldh  [hMultiPurpose0], a                      ; $01:74A4: $E0 $D7
    cp   $A0                                      ; $01:74A6: $FE $A0
    jr   c, .continue                             ; $01:74A8: $38 $0A
    sub  a, $98                                   ; $01:74AA: $D6 $98
    ldh  [hMultiPurpose0], a                      ; $01:74AC: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $01:74AE: $F0 $D8
    add  a, $25                                   ; $01:74B0: $C6 $25
    ldh  [hMultiPurpose1], a                      ; $01:74B2: $E0 $D8

.continue
    dec  c                                        ; $01:74B4: $0D
    jr   nz, .loop                                ; $01:74B5: $20 $CF
    ret                                           ; $01:74B7: $C9

Data_001_74B8::
    db $99, $2B, $83, $1E, $20, $22, $24, $99, $2C, $83, $1F, $21, $23, $25, 0 ; $01:74B8

IntroLinkScream::
    ld   de, wDrawCommand                         ; $01:74C7: $11 $01 $D6
    ld   hl, Data_001_74B8                        ; $01:74CA: $21 $B8 $74
    ld   c, $0F                                   ; $01:74CD: $0E $0F

.loop
    ld   a, [hli]                                 ; $01:74CF: $2A
    ld   [de], a                                  ; $01:74D0: $12
    inc  de                                       ; $01:74D1: $13
    dec  c                                        ; $01:74D2: $0D
    jr   nz, .loop                                ; $01:74D3: $20 $FA

    ret                                           ; $01:74D5: $C9

RenderIntroEntities::
    xor  a                                        ; $01:74D6: $AF
    ld   [wOAMNextAvailableSlot], a               ; $01:74D7: $EA $C0 $C3
    ld   c, $02  ; Entities count                 ; $01:74DA: $0E $02
    ld   b, $00                                   ; $01:74DC: $06 $00

.loop
    ld   a, c                                     ; $01:74DE: $79
    ld   [wActiveEntityIndex], a                  ; $01:74DF: $EA $23 $C1

    ; a = EntityStatus[c]
    ld   hl, wEntitiesStatusTable                 ; $01:74E2: $21 $80 $C2
    add  hl, bc                                   ; $01:74E5: $09
    ld   a, [hl]                                  ; $01:74E6: $7E
    and  a                                        ; $01:74E7: $A7
    jr   z, .continue ; If no entity at this table index, continue ; $01:74E8: $28 $1F

    ; hActiveEntityPosX = wEntitiesPosXTable[c]
    ld   hl, wEntitiesPosXTable                   ; $01:74EA: $21 $00 $C2
    add  hl, bc                                   ; $01:74ED: $09
    ld   a, [hl]                                  ; $01:74EE: $7E
    ldh  [hActiveEntityPosX], a                   ; $01:74EF: $E0 $EE

    ; hActiveEntityVisualPosY = wEntitiesPosYTable[c]
    ld   hl, wEntitiesPosYTable                   ; $01:74F1: $21 $10 $C2
    add  hl, bc                                   ; $01:74F4: $09
    ld   a, [hl]                                  ; $01:74F5: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $01:74F6: $E0 $EC

    ; hActiveEntitySpriteVariant = wEntitiesSpriteVariantTable[c]
    ld   hl, wEntitiesSpriteVariantTable          ; $01:74F8: $21 $B0 $C3
    add  hl, bc                                   ; $01:74FB: $09
    ld   a, [hl]                                  ; $01:74FC: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $01:74FD: $E0 $F1

    ; hActiveEntityState = wEntitiesStateTable[c]
    ld   hl, wEntitiesStateTable                  ; $01:74FF: $21 $90 $C2
    add  hl, bc                                   ; $01:7502: $09
    ld   a, [hl]                                  ; $01:7503: $7E
    ldh  [hActiveEntityState], a                  ; $01:7504: $E0 $F0
    call RenderIntroEntity                        ; $01:7506: $CD $10 $75

.continue
    dec  c                                        ; $01:7509: $0D
    ld   a, c                                     ; $01:750A: $79
    cp   -1                                       ; $01:750B: $FE $FF
    jr   nz, .loop                                ; $01:750D: $20 $CF
    ret                                           ; $01:750F: $C9

; Inputs:
;   bc: index of entity in entities table
RenderIntroEntity::
    ; a = wEntitiesStatusTable[bc]
    ld   hl, wEntitiesStatusTable                 ; $01:7510: $21 $80 $C2
    add  hl, bc                                   ; $01:7513: $09
    ld   a, [hl]                                  ; $01:7514: $7E

    cp   ENTITY_INTRO_SHIP                        ; $01:7515: $FE $05
    jr   z, RenderIntroShip                       ; $01:7517: $28 $4F
    cp   ENTITY_INTRO_MARIN                       ; $01:7519: $FE $06
    jp   z, RenderIntroMarin                      ; $01:751B: $CA $5F $76
    cp   ENTITY_INTRO_INERT_LINK                  ; $01:751E: $FE $07
    jp   z, RenderIntroInertLink                  ; $01:7520: $CA $2F $7A
    cp   ENTITY_INTRO_SPARKLE                     ; $01:7523: $FE $08
    jp   z, RenderIntroSparkle                    ; $01:7525: $CA $DD $77
    call GetEntityTransitionCountdown             ; $01:7528: $CD $05 $0C
    jr   nz, .jp_7533                             ; $01:752B: $20 $06
    ld   hl, wEntitiesStatusTable                 ; $01:752D: $21 $80 $C2
    add  hl, bc                                   ; $01:7530: $09
    ld   [hl], b                                  ; $01:7531: $70
    ret                                           ; $01:7532: $C9

.jp_7533
    dec  [hl]                                     ; $01:7533: $35
    call func_001_762B                            ; $01:7534: $CD $2B $76
    ret                                           ; $01:7537: $C9

Data_001_7538::
    db   $00, $00, $1C, $02, $00, $08, $1E, $02   ; $7538 ; $01:7538
    db   $10, $F8, $20, $02, $10, $00, $22, $02   ; $7540 ; $01:7540
    db   $10, $08, $24, $02, $10, $10, $26, $02   ; $7548 ; $01:7548

Data_001_7550::
    db $F8, $04, $32, $01, $E8, $04, $32, $01, $D8, $04, $32, $01, $C8, $04, $32, $01 ; $01:7550

ShipHeaveTable::
    db 2, 1, 0, 0, 0, 1, 2, 2                     ; $01:7560

RenderIntroShip::
    ld   a, [wIntroSubTimer]                      ; $01:7568: $FA $02 $D0
    and  a                                        ; $01:756B: $A7
    ld   a, $00                                   ; $01:756C: $3E $00
    jr   nz, .skip                                ; $01:756E: $20 $0A
    ldh  a, [hFrameCounter]                       ; $01:7570: $F0 $E7
    add  a, $D0                                   ; $01:7572: $C6 $D0
    rra                                           ; $01:7574: $1F
    rra                                           ; $01:7575: $1F
    rra                                           ; $01:7576: $1F
    rra                                           ; $01:7577: $1F
    and  $07                                      ; $01:7578: $E6 $07
.skip
    ld   e, a                                     ; $01:757A: $5F
    ld   d, $00                                   ; $01:757B: $16 $00
    ld   hl, ShipHeaveTable                       ; $01:757D: $21 $60 $75
    add  hl, de                                   ; $01:7580: $19
    ld   a, [hl]                                  ; $01:7581: $7E
    ld   hl, hActiveEntityVisualPosY              ; $01:7582: $21 $EC $FF
    add  a, [hl]                                  ; $01:7585: $86
    ld   [hl], a                                  ; $01:7586: $77
    ld   hl, Data_001_7538                        ; $01:7587: $21 $38 $75
    ld   de, wOAMBuffer                           ; $01:758A: $11 $00 $C0
    push bc                                       ; $01:758D: $C5
    ld   c, $06                                   ; $01:758E: $0E $06

.loop
    ldh  a, [hActiveEntityVisualPosY]             ; $01:7590: $F0 $EC
    add  a, [hl]                                  ; $01:7592: $86
    inc  hl                                       ; $01:7593: $23
    ld   [de], a                                  ; $01:7594: $12
    inc  de                                       ; $01:7595: $13
    ldh  a, [hActiveEntityPosX]                   ; $01:7596: $F0 $EE
    add  a, [hl]                                  ; $01:7598: $86
    inc  hl                                       ; $01:7599: $23
    ld   [de], a                                  ; $01:759A: $12
    inc  de                                       ; $01:759B: $13
    ld   a, [hli]                                 ; $01:759C: $2A
    ld   [de], a                                  ; $01:759D: $12
    inc  de                                       ; $01:759E: $13
    ld   a, [hli]                                 ; $01:759F: $2A
    ld   [de], a                                  ; $01:75A0: $12
    inc  de                                       ; $01:75A1: $13
    dec  c                                        ; $01:75A2: $0D
    jr   nz, .loop                                ; $01:75A3: $20 $EB

    ld   a, [wIntroSubTimer]                      ; $01:75A5: $FA $02 $D0
    cp   $10                                      ; $01:75A8: $FE $10
    jr   c, .return                               ; $01:75AA: $38 $1D
    ld   hl, Data_001_7550                        ; $01:75AC: $21 $50 $75
    ld   de, wOAMBuffer+$18                       ; $01:75AF: $11 $18 $C0
    ld   c, $04                                   ; $01:75B2: $0E $04
.loop2
    ldh  a, [hActiveEntityVisualPosY]             ; $01:75B4: $F0 $EC
    add  a, [hl]                                  ; $01:75B6: $86
    inc  hl                                       ; $01:75B7: $23
    ld   [de], a                                  ; $01:75B8: $12
    inc  de                                       ; $01:75B9: $13
    ldh  a, [hActiveEntityPosX]                   ; $01:75BA: $F0 $EE
    add  a, [hl]                                  ; $01:75BC: $86
    inc  hl                                       ; $01:75BD: $23
    ld   [de], a                                  ; $01:75BE: $12
    inc  de                                       ; $01:75BF: $13
    ld   a, [hli]                                 ; $01:75C0: $2A
    ld   [de], a                                  ; $01:75C1: $12
    inc  de                                       ; $01:75C2: $13
    ld   a, [hli]                                 ; $01:75C3: $2A
    ld   [de], a                                  ; $01:75C4: $12
    inc  de                                       ; $01:75C5: $13
    dec  c                                        ; $01:75C6: $0D
    jr   nz, .loop2                               ; $01:75C7: $20 $EB

.return
    pop  bc                                       ; $01:75C9: $C1
    ret                                           ; $01:75CA: $C9

Data_001_75CB::
    db   $00, $00, $34, $01, $00, $08, $36, $01   ; $75CB ; $01:75CB
    db   $10, $00, $2C, $01, $20, $F8, $2C, $01   ; $75D3 ; $01:75D3
    db   $28, $00, $2E, $21, $30, $F0, $2E, $01   ; $75DB ; $01:75DB
    db   $08, $00, $36, $21, $08, $08, $34, $21   ; $75E3 ; $01:75E3
    db   $18, $00, $30, $01, $18, $08, $2C, $21   ; $75EB ; $01:75EB
    db   $28, $10, $2E, $21, $28, $10, $2E, $21   ; $75F3 ; $01:75F3
    db   $00, $08, $34, $21, $00, $00, $36, $21   ; $75FB ; $01:75FB
    db   $10, $08, $2C, $21, $20, $10, $2C, $21   ; $7603 ; $01:7603
    db   $28, $08, $2E, $01, $30, $18, $2E, $21   ; $760B ; $01:760B
    db   $08, $08, $36, $01, $08, $00, $34, $01   ; $7613 ; $01:7613
    db   $18, $08, $30, $21, $18, $00, $2C, $01   ; $761B ; $01:761B
    db   $28, $F8, $2E, $01, $28, $F8, $2E, $01   ; $7623 ; $01:7623

func_001_762B::
    ld   hl, wEntitiesStatusTable                 ; $01:762B: $21 $80 $C2
    add  hl, bc                                   ; $01:762E: $09
    ld   a, [hl]                                  ; $01:762F: $7E
    dec  a                                        ; $01:7630: $3D
    sla  a                                        ; $01:7631: $CB $27
    sla  a                                        ; $01:7633: $CB $27
    sla  a                                        ; $01:7635: $CB $27
    ld   e, a                                     ; $01:7637: $5F
    sla  a                                        ; $01:7638: $CB $27
    add  a, e                                     ; $01:763A: $83
    ld   e, a                                     ; $01:763B: $5F
    ld   d, b                                     ; $01:763C: $50
    ld   hl, Data_001_75CB                        ; $01:763D: $21 $CB $75
    add  hl, de                                   ; $01:7640: $19
    ld   c, $06                                   ; $01:7641: $0E $06
    call RenderActiveEntitySpritesRect            ; $01:7643: $CD $E6 $3C
    ld   a, [wOAMNextAvailableSlot]               ; $01:7646: $FA $C0 $C3
    add  a, $18                                   ; $01:7649: $C6 $18
    ld   [wOAMNextAvailableSlot], a               ; $01:764B: $EA $C0 $C3
    ret                                           ; $01:764E: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
IntroMarinSpriteVariants:: ; $01:764F
.variant0
    db $00, OAM_GBC_PAL_3
    db $02, OAM_GBC_PAL_3
.variant1
    db $04, OAM_GBC_PAL_3
    db $06, OAM_GBC_PAL_3
.variant2
    db $08, OAM_GBC_PAL_3
    db $0A, OAM_GBC_PAL_3
.variant3
    db $0C, OAM_GBC_PAL_3
    db $0E, OAM_GBC_PAL_3

RenderIntroMarin::
    call func_001_71C7                            ; $01:765F: $CD $C7 $71
    xor  a                                        ; $01:7662: $AF
    ld   [wEntitiesPhysicsFlagsTable], a          ; $01:7663: $EA $40 $C3
    ld   de, IntroMarinSpriteVariants             ; $01:7666: $11 $4F $76
    call RenderActiveEntitySpritesPair            ; $01:7669: $CD $C0 $3B

    ld   a, [wOAMNextAvailableSlot]               ; $01:766C: $FA $C0 $C3
    add  a, $08                                   ; $01:766F: $C6 $08
    ld   [wOAMNextAvailableSlot], a               ; $01:7671: $EA $C0 $C3
    ldh  a, [hActiveEntityState]                  ; $01:7674: $F0 $F0

    JP_TABLE                                      ; $01:7676: $C7
._0 dw IntroMarinState0                           ; $01:7677
._1 dw IntroMarinState1                           ; $01:7679
._2 dw IntroMarinState2                           ; $01:767B
._3 dw IntroMarinState3                           ; $01:767D
._4 dw IntroMarinState4                           ; $01:767F

IntroMarinState0::
    call func_001_7D9C                            ; $01:7681: $CD $9C $7D
    ldh  a, [hFrameCounter]                       ; $01:7684: $F0 $E7
    rra                                           ; $01:7686: $1F
    rra                                           ; $01:7687: $1F
    rra                                           ; $01:7688: $1F
    and  $01                                      ; $01:7689: $E6 $01
    call SetEntitySpriteVariant                   ; $01:768B: $CD $0C $3B
    ldh  a, [hActiveEntityPosX]                   ; $01:768E: $F0 $EE
    cp   $48                                      ; $01:7690: $FE $48
    jr   nc, .jr_769C                             ; $01:7692: $30 $08
    call GetEntityTransitionCountdown             ; $01:7694: $CD $05 $0C
    ld   [hl], $40                                ; $01:7697: $36 $40
    call IncrementEntityState                     ; $01:7699: $CD $12 $3B

.jr_769C
    ; Every 4 frames, decrease the entity pos X by 1
    ld   hl, wEntitiesInertiaTable                ; $01:769C: $21 $D0 $C3
    add  hl, bc                                   ; $01:769F: $09
    dec  [hl]                                     ; $01:76A0: $35
    jr   nz, .return                              ; $01:76A1: $20 $07
    ld   [hl], $04                                ; $01:76A3: $36 $04
    ld   hl, wEntitiesPosXTable                   ; $01:76A5: $21 $00 $C2
    add  hl, bc                                   ; $01:76A8: $09
    dec  [hl]                                     ; $01:76A9: $35

.return
    ret                                           ; $01:76AA: $C9

IntroMarinState1::
    call func_001_7D46                            ; $01:76AB: $CD $46 $7D
    ld   a, $01                                   ; $01:76AE: $3E $01
    call SetEntitySpriteVariant                   ; $01:76B0: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $01:76B3: $CD $05 $0C
    jr   nz, .jr_76D4                             ; $01:76B6: $20 $1C
    call IncrementEntityState                     ; $01:76B8: $CD $12 $3B
    ld   a, $07                                   ; $01:76BB: $3E $07
    ld   [wEntitiesStatusTable+1], a              ; $01:76BD: $EA $81 $C2
    ld   a, $FE                                   ; $01:76C0: $3E $FE
    ld   [wEntitiesPosXTable+1], a                ; $01:76C2: $EA $01 $C2
    ld   a, $6E                                   ; $01:76C5: $3E $6E
    ld   [wEntitiesPosYTable+1], a                ; $01:76C7: $EA $11 $C2
    xor  a                                        ; $01:76CA: $AF
    ld   [wEntitiesStateTable+1], a               ; $01:76CB: $EA $91 $C2
    ld   [wEntitiesTransitionCountdownTable+1], a ; $01:76CE: $EA $E1 $C2
    ldh  [hFrameCounter], a                       ; $01:76D1: $E0 $E7
    ret                                           ; $01:76D3: $C9

.jr_76D4
    dec  [hl]                                     ; $01:76D4: $35
    ret                                           ; $01:76D5: $C9

IntroMarinState2::
    call func_001_7D9C                            ; $01:76D6: $CD $9C $7D
    ld   a, [wEntitiesPosXTable+1]                ; $01:76D9: $FA $01 $C2
    dec  a                                        ; $01:76DC: $3D
    ld   [wEntitiesPosXTable+1], a                ; $01:76DD: $EA $01 $C2
    ldh  a, [hFrameCounter]                       ; $01:76E0: $F0 $E7
    and  $01                                      ; $01:76E2: $E6 $01
    jr   nz, .jr_7707                             ; $01:76E4: $20 $21
    ld   hl, hBaseScrollX                         ; $01:76E6: $21 $96 $FF
    inc  [hl]                                     ; $01:76E9: $34
    ld   a, [hl]                                  ; $01:76EA: $7E
    cp   $30                                      ; $01:76EB: $FE $30
    jr   nz, .jr_76F7                             ; $01:76ED: $20 $08
    call GetEntityTransitionCountdown             ; $01:76EF: $CD $05 $0C
    ld   [hl], $40                                ; $01:76F2: $36 $40
    jp   IncrementEntityState                     ; $01:76F4: $C3 $12 $3B

.jr_76F7
    cp   $20                                      ; $01:76F7: $FE $20
    jr   nz, .jr_76FF                             ; $01:76F9: $20 $04
    call func_001_7A16                            ; $01:76FB: $CD $16 $7A
    xor  a                                        ; $01:76FE: $AF

.jr_76FF
    cp   $22                                      ; $01:76FF: $FE $22
    jr   nz, .jr_7707                             ; $01:7701: $20 $04
    call func_001_7A11                            ; $01:7703: $CD $11 $7A
    xor  a                                        ; $01:7706: $AF

.jr_7707
    ldh  a, [hFrameCounter]                       ; $01:7707: $F0 $E7
    rra                                           ; $01:7709: $1F
    rra                                           ; $01:770A: $1F
    and  $01                                      ; $01:770B: $E6 $01
    call SetEntitySpriteVariant                   ; $01:770D: $CD $0C $3B
    ret                                           ; $01:7710: $C9

IntroMarinState3::
    call GetEntityTransitionCountdown             ; $01:7711: $CD $05 $0C
    jr   nz, .jr_7778                             ; $01:7714: $20 $62
    call func_001_7DCF                            ; $01:7716: $CD $CF $7D
    ldh  a, [hFrameCounter]                       ; $01:7719: $F0 $E7
    and  $01                                      ; $01:771B: $E6 $01
    jr   nz, .jr_776C                             ; $01:771D: $20 $4D
    ld   a, [wEntitiesPosXTable+1]                ; $01:771F: $FA $01 $C2
    dec  a                                        ; $01:7722: $3D
    ld   [wEntitiesPosXTable+1], a                ; $01:7723: $EA $01 $C2
    ldh  a, [hFrameCounter]                       ; $01:7726: $F0 $E7
    and  $03                                      ; $01:7728: $E6 $03
    jr   nz, .jr_776C                             ; $01:772A: $20 $40
    ld   hl, hBaseScrollX                         ; $01:772C: $21 $96 $FF
    inc  [hl]                                     ; $01:772F: $34
    ld   a, [hl]                                  ; $01:7730: $7E
    cp   $40                                      ; $01:7731: $FE $40
    jr   z, .jr_7740                              ; $01:7733: $28 $0B
    cp   $3A                                      ; $01:7735: $FE $3A
    jr   nz, .jr_7745                             ; $01:7737: $20 $0C
    call GetEntityTransitionCountdown             ; $01:7739: $CD $05 $0C
    ld   [hl], $30                                ; $01:773C: $36 $30
    jr   .jr_7745                                 ; $01:773E: $18 $05

.jr_7740
    call GetEntityTransitionCountdown             ; $01:7740: $CD $05 $0C
    ld   [hl], $50                                ; $01:7743: $36 $50

.jr_7745
    ldh  a, [hBaseScrollX]                        ; $01:7745: $F0 $96
    cp   $56                                      ; $01:7747: $FE $56
    jr   nz, .jr_775C                             ; $01:7749: $20 $11
    ld   a, $A0                                   ; $01:774B: $3E $A0
    ld   [hl], a                                  ; $01:774D: $77
    ldh  [rSCX], a                                ; $01:774E: $E0 $43
    ld   a, IEF_VBLANK                            ; $01:7750: $3E $01
    ldh  [rIE], a                                 ; $01:7752: $E0 $FF
    call GetEntityTransitionCountdown             ; $01:7754: $CD $05 $0C
    ld   [hl], $E0                                ; $01:7757: $36 $E0
    jp   IncrementEntityState                     ; $01:7759: $C3 $12 $3B

.jr_775C
    cp   $20                                      ; $01:775C: $FE $20
    jr   nz, .jr_7764                             ; $01:775E: $20 $04
    call func_001_7A16                            ; $01:7760: $CD $16 $7A
    xor  a                                        ; $01:7763: $AF

.jr_7764
    cp   $22                                      ; $01:7764: $FE $22
    jr   nz, .jr_776C                             ; $01:7766: $20 $04
    call func_001_7A11                            ; $01:7768: $CD $11 $7A
    xor  a                                        ; $01:776B: $AF

.jr_776C
    ldh  a, [hFrameCounter]                       ; $01:776C: $F0 $E7
    rra                                           ; $01:776E: $1F
    rra                                           ; $01:776F: $1F
    rra                                           ; $01:7770: $1F
    rra                                           ; $01:7771: $1F
    and  $01                                      ; $01:7772: $E6 $01
    call SetEntitySpriteVariant                   ; $01:7774: $CD $0C $3B
    ret                                           ; $01:7777: $C9

.jr_7778
    dec  [hl]                                     ; $01:7778: $35
    call func_001_7D46                            ; $01:7779: $CD $46 $7D
    ld   a, $01                                   ; $01:777C: $3E $01
    jp   SetEntitySpriteVariant                   ; $01:777E: $C3 $0C $3B

IntroMarinState4::
    call func_001_7D46                            ; $01:7781: $CD $46 $7D
    ldh  a, [hFrameCounter]                       ; $01:7784: $F0 $E7
    and  $01                                      ; $01:7786: $E6 $01
    jr   nz, .return                              ; $01:7788: $20 $32
    ld   a, $02                                   ; $01:778A: $3E $02
    call SetEntitySpriteVariant                   ; $01:778C: $CD $0C $3B
    ld   a, $00                                   ; $01:778F: $3E $00
    ld   [wEntitiesSpriteVariantTable+1], a       ; $01:7791: $EA $B1 $C3
    call GetEntityTransitionCountdown             ; $01:7794: $CD $05 $0C
    jr   z, .jr_779A                              ; $01:7797: $28 $01
    dec  [hl]                                     ; $01:7799: $35

.jr_779A
    cp   $A0                                      ; $01:779A: $FE $A0
    jr   nc, .return                              ; $01:779C: $30 $1E
    cp   $90                                      ; $01:779E: $FE $90
    jr   nc, .jr_77B2                             ; $01:77A0: $30 $10
    cp   $50                                      ; $01:77A2: $FE $50
    jr   nc, .return                              ; $01:77A4: $30 $16
    cp   $4A                                      ; $01:77A6: $FE $4A
    jr   nc, .jr_77B2                             ; $01:77A8: $30 $08
    cp   $3C                                      ; $01:77AA: $FE $3C
    jr   nc, .return                              ; $01:77AC: $30 $0E
    cp   $36                                      ; $01:77AE: $FE $36
    jr   c, .return                               ; $01:77B0: $38 $0A

.jr_77B2
    ld   a, $03                                   ; $01:77B2: $3E $03
    call SetEntitySpriteVariant                   ; $01:77B4: $CD $0C $3B
    ld   a, $01                                   ; $01:77B7: $3E $01
    ld   [wEntitiesSpriteVariantTable+1], a       ; $01:77B9: $EA $B1 $C3

.return
    ret                                           ; $01:77BC: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown003SpriteVariants::
.variant0 ; $01:77BD
    db $38, OAMF_PAL0
    db $38, OAMF_PAL0 | OAMF_XFLIP
.variant1 ; $01:77C1
    db $3A, OAMF_PAL0
    db $3A, OAMF_PAL0 | OAMF_XFLIP
.variant2 ; $01:77C5
    db $3A, OAMF_PAL0
    db $3A, OAMF_PAL0 | OAMF_XFLIP
.variant3 ; $01:77C9
    db $3C, OAMF_PAL0
    db $3E, OAMF_PAL0
.variant4 ; $01:77CD
    db $3C, OAMF_PAL0
    db $3E, OAMF_PAL0
.variant5 ; $01:77D1
    db $3A, OAMF_PAL0
    db $3A, OAMF_PAL0 | OAMF_XFLIP
.variant6 ; $01:77D5
    db $3A, OAMF_PAL0
    db $3A, OAMF_PAL0 | OAMF_XFLIP
.variant7 ; $01:77D9
    db $38, OAMF_PAL0
    db $38, OAMF_PAL0 | OAMF_XFLIP

RenderIntroSparkle::
    xor  a                                        ; $01:77DD: $AF
    ld   [wC3C1], a                               ; $01:77DE: $EA $C1 $C3

.jr_77E1::
    call GetEntityTransitionCountdown             ; $01:77E1: $CD $05 $0C
    dec  [hl]                                     ; $01:77E4: $35
    jr   nz, .jr_77ED                             ; $01:77E5: $20 $06
    ld   hl, wEntitiesStatusTable                 ; $01:77E7: $21 $80 $C2
    add  hl, bc                                   ; $01:77EA: $09
    ld   [hl], b                                  ; $01:77EB: $70
    ret                                           ; $01:77EC: $C9

.jr_77ED::
    ld   a, [hl]                                  ; $01:77ED: $7E
    rra                                           ; $01:77EE: $1F
    rra                                           ; $01:77EF: $1F
    rra                                           ; $01:77F0: $1F
    and  $07                                      ; $01:77F1: $E6 $07
    ldh  [hActiveEntitySpriteVariant], a          ; $01:77F3: $E0 $F1
    xor  a                                        ; $01:77F5: $AF
    ld   [wEntitiesPhysicsFlagsTable], a          ; $01:77F6: $EA $40 $C3
    ld   de, Unknown003SpriteVariants             ; $01:77F9: $11 $BD $77
    call RenderActiveEntitySpritesPair            ; $01:77FC: $CD $C0 $3B
    ld   a, [wOAMNextAvailableSlot]               ; $01:77FF: $FA $C0 $C3
    add  a, $08                                   ; $01:7802: $C6 $08
    ld   [wOAMNextAvailableSlot], a               ; $01:7804: $EA $C0 $C3
    ret                                           ; $01:7807: $C9

IF LANG_JP
Data_001_7808::
    db   $00, $10, $2C, $05
    db   $10, $10, $2A, $05
    db   $00, $10, $28, $05
    db   $10, $08, $26, $05
    db   $00, $08, $24, $05
    db   $10, $00, $22, $05
    db   $00, $00, $20, $05

Data_001_7828::
    db   $10, $18, $4F, $16
    db   $00, $18, $4D, $16
    db   $10, $10, $4B, $16
    db   $00, $10, $49, $16
    db   $10, $08, $47, $16
    db   $00, $08, $45, $16
    db   $10, $00, $43, $16
    db   $00, $00, $41, $16
.end

Data_001_7850:
    db   $10, $10, $2A, $05
    db   $00, $10, $28, $05
    db   $10, $08, $26, $05
    db   $00, $08, $24, $05
    db   $10, $00, $22, $05
    db   $00, $00, $20, $05

Data_001_7870:
    db   $10, $15, $5A, $07
    db   $00, $15, $58, $07
    db   $10, $0D, $56, $07
    db   $00, $0D, $54, $07
    db   $10, $05, $52, $07
    db   $00, $05, $50, $07
    db   $10, $18, $4E, $16
    db   $00, $18, $4C, $16
    db   $10, $10, $4A, $16
    db   $00, $10, $48, $16
    db   $10, $08, $46, $16
    db   $00, $08, $44, $16
    db   $10, $00, $42, $16
    db   $00, $00, $40, $16
.end

Data_001_7850_alt:
    db   $10, $00, $5E, $14
    db   $00, $00, $5C, $14
    db   $10, $00, $62, $14
    db   $00, $60, $60, $14
    db   $10, $04, $66, $14
    db   $00, $04, $64, $14
    db   $10, $08, $6A, $14
    db   $00, $08, $68, $14
    db   $10, $0C, $6E, $14
    db   $00, $0C, $6C, $14
    db   $10, $10, $72, $14
    db   $00, $10, $70, $14
    db   $10, $14, $76, $14
    db   $00, $14, $74, $14
    db   $10, $18, $7A, $14
    db   $00, $18, $78, $14
    db   $10, $18, $7E, $14
    db   $00, $18, $7C, $14
ELSE
Data_001_7808::
    db   $10, $18, $2E, $05                       ; $01:7808
    db   $00, $18, $2C, $05                       ; $01:780C
    db   $10, $10, $2A, $05                       ; $01:7810
    db   $00, $10, $28, $05                       ; $01:7814
    db   $10, $08, $26, $05                       ; $01:7818
    db   $00, $08, $24, $05                       ; $01:781C
    db   $10, $00, $22, $05                       ; $01:7820
    db   $00, $00, $20, $05                       ; $01:7824

Data_001_7828::
    db   $00, $28, $52, $16                       ; $01:7828
    db   $00, $20, $50, $16                       ; $01:782C
    db   $10, $18, $4E, $16                       ; $01:7830
    db   $00, $18, $4C, $16                       ; $01:7834
    db   $10, $10, $4A, $16                       ; $01:7838
    db   $00, $10, $48, $16                       ; $01:783C
    db   $10, $08, $46, $16                       ; $01:7840
    db   $00, $08, $44, $16                       ; $01:7844
    db   $10, $00, $42, $16                       ; $01:7848
    db   $00, $00, $40, $16                       ; $01:784C
.end

Data_001_7850::
    db   $10, $18, $2E, $05                       ; $01:7850
    db   $00, $18, $2C, $05                       ; $01:7854
    db   $10, $10, $2A, $05                       ; $01:7858
    db   $00, $10, $28, $05                       ; $01:785C
    db   $10, $08, $26, $05                       ; $01:7860
    db   $00, $08, $24, $05                       ; $01:7864
    db   $10, $00, $22, $05                       ; $01:7868
    db   $00, $00, $20, $05                       ; $01:786C

Data_001_7870::
    db   $00, $28, $52, $16                       ; $01:7870
    db   $00, $20, $50, $16                       ; $01:7874
    db   $10, $18, $4E, $16                       ; $01:7878
    db   $00, $18, $4C, $16                       ; $01:787C
    db   $10, $10, $4A, $16                       ; $01:7880
    db   $00, $10, $48, $16                       ; $01:7884
    db   $10, $08, $46, $16                       ; $01:7888
    db   $00, $08, $44, $16                       ; $01:788C
    db   $10, $00, $42, $16                       ; $01:7890
    db   $00, $00, $40, $16                       ; $01:7894
.end
ENDC

Data_001_7898::
IF LANG_JP
    db   $AC, $AC, $6C
ELSE
    db   $54, $58, $68                            ; $01:7898
ENDC

Data_001_789B::
    db   $1C                                      ; $01:789B

Data_001_789C::
    db   $00, $04, $18                            ; $01:789C

Data_001_789F::
IF LANG_JP
    db   $1C
ELSE
    db   $6C                                      ; $01:789F
ENDC

Data_001_78A0::
IF LANG_JP
         ; Loaded in $18 byte chunks
    db   $F5, $7A, $00, $00, $00, $00, $00, $00
    db   $F5, $7A, $FF, $7F, $FF, $7F, $FF, $7F
    db   $F5, $7A, $FF, $7F, $FF, $7F, $00, $00

    db   $F5, $7A, $84, $04, $42, $00, $00, $00
    db   $F5, $7A, $BE, $6F, $9C, $6B, $5A, $6B
    db   $F5, $7A, $FF, $7F, $7B, $6B, $A5, $14

    db   $F5, $7A, $E8, $08, $63, $00, $00, $00
    db   $F5, $7A, $9E, $5F, $39, $5B, $D6, $5A
    db   $F5, $7A, $FF, $7F, $F7, $5A, $29, $25

    db   $F5, $7A, $4C, $09, $A5, $00, $00, $00
    db   $F5, $7A, $7D, $4F, $D6, $46, $31, $46
    db   $F5, $7A, $FF, $7F, $73, $46, $CE, $39

    db   $F5, $7A, $B0, $0D, $C6, $00, $00, $00
    db   $F5, $7A, $3D, $3F, $73, $36, $AD, $35
    db   $F5, $7A, $FF, $7F, $10, $36, $52, $4A

    db   $F5, $7A, $14, $0E, $08, $01, $00, $00
    db   $F5, $7A, $1C, $2F, $10, $22, $08, $21
    db   $F5, $7A, $FF, $7F, $8C, $21, $F7, $5E

    db   $F5, $7A, $78, $12, $29, $01, $00, $00
    db   $F5, $7A, $FC, $1E, $AD, $11, $84, $10
    db   $F5, $7A, $FF, $7F, $08, $11, $7B, $6F

    db   $F5, $7A, $DC, $12, $4A, $01, $00, $00
    db   $F5, $7A, $DC, $12, $4A, $01, $00, $00
    db   $F5, $7A, $FF, $7F, $A5, $00, $FF, $7F
ELSE
         ; Loaded in $10 byte chunks
    db   $F5, $7A, $8D, $7D, $8D, $7D, $8D, $7D   ; $01:78A0
    db   $F5, $7A, $FF, $7F, $FF, $7F, $FF, $7F   ; $01:78A8

    db   $F5, $7A, $6C, $6D, $8D, $71, $CF, $75   ; $01:78B0
    db   $F5, $7A, $7B, $6F, $BD, $73, $FF, $77   ; $01:78B8

    db   $F5, $7A, $2A, $5D, $8E, $65, $12, $6E   ; $01:78C0
    db   $F5, $7A, $F7, $5E, $5B, $67, $DF, $6F   ; $01:78C8

    db   $F5, $7A, $E8, $48, $8E, $59, $54, $66   ; $01:78D0
    db   $F5, $7A, $52, $4A, $19, $5B, $BF, $67   ; $01:78D8

    db   $F5, $7A, $C6, $38, $8F, $49, $97, $5A   ; $01:78E0
    db   $F5, $7A, $CE, $39, $B7, $4A, $BF, $5B   ; $01:78E8

    db   $F5, $7A, $84, $24, $8F, $3D, $D9, $52   ; $01:78F0
    db   $F5, $7A, $29, $25, $75, $3E, $9F, $53   ; $01:78F8

    db   $F5, $7A, $42, $14, $90, $31, $1C, $4B   ; $01:7900
    db   $F5, $7A, $A5, $14, $13, $32, $7F, $4B   ; $01:7908

    db   $F5, $7A, $00, $00, $B1, $21, $5F, $3F   ; $01:7910
    db   $F5, $7A, $00, $00, $B1, $21, $5F, $3F   ; $01:7918
ENDC

func_001_7920::
    ld   hl, wD015                                ; $01:7920: $21 $15 $D0
    ld   a, [hl]                                  ; $01:7923: $7E
    and  a                                        ; $01:7924: $A7
    jr   z, .jr_001_7929                          ; $01:7925: $28 $02
    dec  [hl]                                     ; $01:7927: $35
    ret                                           ; $01:7928: $C9

; Position of the DX logo

IF LANG_JP
X_POS = $79
Y_OFFSET = $46
ELSE
X_POS = $78
Y_OFFSET = $59
ENDC

.jr_001_7929
    ld   a, X_POS                                 ; $01:7929: $3E $78
    ldh  [hActiveEntityPosX], a                   ; $01:792B: $E0 $EE
    ld   hl, wD018                                ; $01:792D: $21 $18 $D0
    ld   a, Y_OFFSET                              ; $01:7930: $3E $59
    add  a, [hl]                                  ; $01:7932: $86
    ldh  [hActiveEntityVisualPosY], a             ; $01:7933: $E0 $EC
    ldh  a, [hIsGBC]                              ; $01:7935: $F0 $FE
    and  a                                        ; $01:7937: $A7
    jr   nz, .jr_001_795D                         ; $01:7938: $20 $23
    ld   a, [wD013]                               ; $01:793A: $FA $13 $D0
    cp   $04                                      ; $01:793D: $FE $04
    jr   z, .jr_001_797D_a                        ; $01:793F: $28 $3C
    ld   hl, wD014                                ; $01:7941: $21 $14 $D0
    inc  [hl]                                     ; $01:7944: $34
    ld   a, [hl]                                  ; $01:7945: $7E
    cp   $0C                                      ; $01:7946: $FE $0C
    jp   nz, .jr_001_7997                         ; $01:7948: $C2 $97 $79
    xor  a                                        ; $01:794B: $AF
    ld   [hl], a                                  ; $01:794C: $77
    ld   hl, wD013                                ; $01:794D: $21 $13 $D0
    inc  [hl]                                     ; $01:7950: $34
    ld   a, [hl]                                  ; $01:7951: $7E
    cp   $04                                      ; $01:7952: $FE $04
    jp   z, .jr_001_7997                          ; $01:7954: $CA $97 $79
    call func_001_79AE                            ; $01:7957: $CD $AE $79
    jp   .jr_001_7997                             ; $01:795A: $C3 $97 $79

.jr_001_795D
    ld   a, [wD013]                               ; $01:795D: $FA $13 $D0
    cp   $08                                      ; $01:7960: $FE $08
    jr   z, .jr_001_797D_a                        ; $01:7962: $28 $19
    ld   hl, wD014                                ; $01:7964: $21 $14 $D0
    inc  [hl]                                     ; $01:7967: $34
    ld   a, [hl]                                  ; $01:7968: $7E
    cp   $08                                      ; $01:7969: $FE $08
    jr   nz, .jr_001_797D                         ; $01:796B: $20 $10
    xor  a                                        ; $01:796D: $AF
    ld   [hl], a                                  ; $01:796E: $77
    ld   hl, wD013                                ; $01:796F: $21 $13 $D0
    inc  [hl]                                     ; $01:7972: $34
    ld   a, [hl]                                  ; $01:7973: $7E
    cp   $08                                      ; $01:7974: $FE $08
    jr   z, .jr_001_797D                          ; $01:7976: $28 $05
    call func_001_79C2                            ; $01:7978: $CD $C2 $79
    jr   .jr_001_797D                             ; $01:797B: $18 $00

.jr_001_797D_a
IF LANG_JP
    ld   hl, wD016
    ld   a, [hl+]
    ld   b, [hl]
    or   b
    jr   z, func_001_7920.jr_001_7a63

    dec  hl
    ld   a, [hl]
    sub  $01
    ld   [hl+], a
    ld   a, [hl]
    sbc  $00
    ld   [hl], a
    jr   .jr_001_797D
.jr_001_7a63
    ld   hl, wD012
    inc  [hl]
    ld   a, [hl]
    cp   $06
    jr   nz, .jr_001_7a82
    xor  a
    ld   [hl], a
    ld   a, [wD011]
    inc  a
    cp   $09
    jr   nz, .jr_001_7a7f
    call func_001_7BC3
    xor  a
    ld   [wD011], a
    jr   .jr_001_797D
.jr_001_7a7f
    ld   [wD011], a
.jr_001_7a82
    ld   hl, Data_001_7850_alt
    ld   a, [wD011]
    sla  a
    sla  a
    sla  a
    ld   b, $00
    ld   c, a
    add  hl, bc
    ld   c, $02
    call RenderActiveEntitySpritesRect
    ld   a, [wOAMNextAvailableSlot]
    add  $08
    ld   [wOAMNextAvailableSlot], a
ENDC

.jr_001_797D
    ldh  a, [hIsGBC]                              ; $01:797D: $F0 $FE
    and  a                                        ; $01:797F: $A7
    jr   z, .jr_001_7997                          ; $01:7980: $28 $15
    ld   a, [wD013]                               ; $01:7982: $FA $13 $D0
    cp   $08                                      ; $01:7985: $FE $08
    jr   z, .jr_001_7990                          ; $01:7987: $28 $07
    ; Renders both Data_001_7850 and Data_001_7870
    ld   hl, Data_001_7850                        ; $01:7989: $21 $50 $78
    ld   c, (Data_001_7870.end - Data_001_7850) / 4 ; $01:798C: $0E $12
    jr   .render                                  ; $01:798E: $18 $1A

.jr_001_7990
    ld   hl, Data_001_7870                        ; $01:7990: $21 $70 $78
    ld   c, (Data_001_7870.end - Data_001_7870) / 4 ; $01:7993: $0E $0A
    jr   .render                                  ; $01:7995: $18 $13

.jr_001_7997
    ld   a, [wD013]                               ; $01:7997: $FA $13 $D0
IF LANG_JP
    cp   $04
    jr   z, .jr_001_79A5
ELSE
    cp   $03                                      ; $01:799A: $FE $03
    jr   nc, .jr_001_79A5                         ; $01:799C: $30 $07
ENDC
    ld   hl, Data_001_7808                        ; $01:799E: $21 $08 $78
    ; renders both Data_001_7808 and Data_001_7828
    ld   c, (Data_001_7828.end - Data_001_7808) / 4 ; $01:79A1: $0E $12
    jr   .render                                  ; $01:79A3: $18 $05

.jr_001_79A5
    ld   hl, Data_001_7828                        ; $01:79A5: $21 $28 $78
    ld   c, (Data_001_7828.end - Data_001_7828) / 4 ; $01:79A8: $0E $0A

.render
    call RenderActiveEntitySpritesRect            ; $01:79AA: $CD $E6 $3C
    ret                                           ; $01:79AD: $C9

func_001_79AE::
    ld   b, $00                                   ; $01:79AE: $06 $00
    ld   c, a                                     ; $01:79B0: $4F
    ld   hl, Data_001_7898                        ; $01:79B1: $21 $98 $78
    add  hl, bc                                   ; $01:79B4: $09
    ld   a, [hl]                                  ; $01:79B5: $7E
    ld   [wOBJ0Palette], a                        ; $01:79B6: $EA $98 $DB
    ld   hl, Data_001_789C                        ; $01:79B9: $21 $9C $78
    add  hl, bc                                   ; $01:79BC: $09
    ld   a, [hl]                                  ; $01:79BD: $7E
    ld   [wOBJ1Palette], a                        ; $01:79BE: $EA $99 $DB
    ret                                           ; $01:79C1: $C9

func_001_79C2::
    ; bc = a * CHUNKSIZE
IF LANG_JP
CHUNKSIZE = $18
    ld   b, a
    sla  a
    add  b
    sla  a
    sla  a
    sla  a
ELSE
CHUNKSIZE = $10
    sla  a                                        ; $01:79C2: $CB $27
    sla  a                                        ; $01:79C4: $CB $27
    sla  a                                        ; $01:79C6: $CB $27
    sla  a                                        ; $01:79C8: $CB $27
ENDC
    ld   b, $00                                   ; $01:79CA: $06 $00
    ld   c, a                                     ; $01:79CC: $4F

    ld   hl, Data_001_78A0                        ; $01:79CD: $21 $A0 $78
    add  hl, bc                                   ; $01:79D0: $09
    ld   bc, wObjPal6                             ; $01:79D1: $01 $78 $DC
    ld   e, CHUNKSIZE                             ; $01:79D4: $1E $10

.loop
    ld   a, [hli]                                 ; $01:79D6: $2A
    ld   [bc], a                                  ; $01:79D7: $02
    inc  bc                                       ; $01:79D8: $03
    dec  e                                        ; $01:79D9: $1D
    jr   nz, .loop                                ; $01:79DA: $20 $FA

    ld   a, $14                                   ; $01:79DC: $3E $14
    ld   [wPalettePartialCopyColorIndexStart], a  ; $01:79DE: $EA $D3 $DD
    ld   a, CHUNKSIZE / 2                         ; $01:79E1: $3E $08
    ld   [wPalettePartialCopyColorCount], a       ; $01:79E3: $EA $D4 $DD
    ld   a, $82                                   ; $01:79E6: $3E $82
    ld   [wPaletteDataFlags], a                   ; $01:79E8: $EA $D1 $DD
    ret                                           ; $01:79EB: $C9

IF LANG_JP
func_001_7BC3:
    call GetRandomByte
    or   $20
    ld   [wD016], a
    ld   a, $01
    ld   [wD017], a
    ret
ENDC

Data_001_79EC::
    db   $98, $00, $43, $7D, $98, $20, $43, $7D   ; $79EC ; $01:79EC
    db   $98, $40, $43, $7D, $98, $60, $43, $7D   ; $79F4 ; $01:79F4
    db   $00                                      ; $79FC ; $01:79FC

Data_001_79FD::
    db   $98, $04, $03, $7D, $7D, $4C, $4D, $98   ; $79FD ; $01:79FD
    db   $24, $43, $7D, $98, $44, $43, $7D, $98   ; $7A05 ; $01:7A05
    db   $64, $43, $7D, $00                       ; $7A0D ; $01:7A0D

func_001_7A11::
    ld   hl, Data_001_79FD                        ; $01:7A11: $21 $FD $79
    jr   jr_001_7A19                              ; $01:7A14: $18 $03

func_001_7A16::
    ld   hl, Data_001_79EC                        ; $01:7A16: $21 $EC $79

jr_001_7A19::
    ld   de, wDrawCommand                         ; $01:7A19: $11 $01 $D6
    push bc                                       ; $01:7A1C: $C5
    ld   c, $18                                   ; $01:7A1D: $0E $18

.loop_7A1F
    ld   a, [hli]                                 ; $01:7A1F: $2A
    ld   [de], a                                  ; $01:7A20: $12
    inc  de                                       ; $01:7A21: $13
    dec  c                                        ; $01:7A22: $0D
    jr   nz, .loop_7A1F                           ; $01:7A23: $20 $FA
    pop  bc                                       ; $01:7A25: $C1
    ret                                           ; $01:7A26: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown004SpriteVariants::
.variant0 ; $01:7A27
    db $10, OAMF_PAL0
    db $12, OAMF_PAL0
.variant1 ; $01:7A2B
    db $14, OAMF_PAL0
    db $16, OAMF_PAL0

RenderIntroInertLink::
    ldh  a, [hActiveEntityPosX]                   ; $01:7A2F: $F0 $EE
    cp   $F0                                      ; $01:7A31: $FE $F0
    jr   nc, .jr_001_7A47                         ; $01:7A33: $30 $12
    xor  a                                        ; $01:7A35: $AF
    ld   [wEntitiesPhysicsFlagsTable], a          ; $01:7A36: $EA $40 $C3
    ld   de, Unknown004SpriteVariants             ; $01:7A39: $11 $27 $7A
    call RenderActiveEntitySpritesPair            ; $01:7A3C: $CD $C0 $3B
    ld   a, [wOAMNextAvailableSlot]               ; $01:7A3F: $FA $C0 $C3
    add  a, $08                                   ; $01:7A42: $C6 $08
    ld   [wOAMNextAvailableSlot], a               ; $01:7A44: $EA $C0 $C3

.jr_001_7A47
    ldh  a, [hActiveEntityState]                  ; $01:7A47: $F0 $F0
    JP_TABLE                                      ; $01:7A49: $C7
._00 dw InertLinkState0Handler                    ; $01:7A4A
._01 dw InertLinkState1Handler                    ; $01:7A4C
._02 dw InertLinkState2Handler                    ; $01:7A4E
._03 dw InertLinkState3Handler                    ; $01:7A50

InertLinkState0Handler::
    call GetEntityTransitionCountdown             ; $01:7A52: $CD $05 $0C
    dec  [hl]                                     ; $01:7A55: $35
    jr   nz, .return                              ; $01:7A56: $20 $05
    ld   [hl], $90                                ; $01:7A58: $36 $90
    call IncrementEntityState                     ; $01:7A5A: $CD $12 $3B

.return
    ret                                           ; $01:7A5D: $C9

InertLinkState1Handler::
    ldh  a, [hFrameCounter]                       ; $01:7A5E: $F0 $E7
    and  $03                                      ; $01:7A60: $E6 $03
    jr   nz, .return                              ; $01:7A62: $20 $06
    call GetEntityTransitionCountdown             ; $01:7A64: $CD $05 $0C
    dec  [hl]                                     ; $01:7A67: $35
    jr   z, .nextState                            ; $01:7A68: $28 $01

.return
    ret                                           ; $01:7A6A: $C9

.nextState
    jp   IncrementEntityState                     ; $01:7A6B: $C3 $12 $3B

InertLinkState2Handler::
    ld   a, [wD00A]                               ; $01:7A6E: $FA $0A $D0
    cp   $13                                      ; $01:7A71: $FE $13
    jr   z, .jr_7AB3                              ; $01:7A73: $28 $3E
    ld   a, [wCreditsSubscene]                    ; $01:7A75: $FA $0E $D0
    inc  a                                        ; $01:7A78: $3C
    ld   [wCreditsSubscene], a                    ; $01:7A79: $EA $0E $D0
    and  $03                                      ; $01:7A7C: $E6 $03
    jr   nz, .return                              ; $01:7A7E: $20 $32
    ld   a, [wEntitiesPosYTable]                  ; $01:7A80: $FA $10 $C2
    cp   $A0                                      ; $01:7A83: $FE $A0
    jr   nc, .jr_7A8B                             ; $01:7A85: $30 $04
    inc  a                                        ; $01:7A87: $3C
    ld   [wEntitiesPosYTable], a                  ; $01:7A88: $EA $10 $C2

.jr_7A8B
    ld   a, [wEntitiesPosYTable+1]                ; $01:7A8B: $FA $11 $C2
    cp   $A0                                      ; $01:7A8E: $FE $A0
    jr   nc, .jr_7A96                             ; $01:7A90: $30 $04
    inc  a                                        ; $01:7A92: $3C
    ld   [wEntitiesPosYTable+1], a                ; $01:7A93: $EA $11 $C2

.jr_7A96
    ldh  a, [hBaseScrollY]                        ; $01:7A96: $F0 $97
    push af                                       ; $01:7A98: $F5
    dec  a                                        ; $01:7A99: $3D
    ldh  [hBaseScrollY], a                        ; $01:7A9A: $E0 $97
    pop  af                                       ; $01:7A9C: $F1
    and  $07                                      ; $01:7A9D: $E6 $07
    jr   nz, .return                              ; $01:7A9F: $20 $11
    push bc                                       ; $01:7AA1: $C5
    call func_7C60                                ; $01:7AA2: $CD $60 $7C
    pop  bc                                       ; $01:7AA5: $C1
    ld   a, [wD00A]                               ; $01:7AA6: $FA $0A $D0
    cp   $0B                                      ; $01:7AA9: $FE $0B
    jr   nz, .return                              ; $01:7AAB: $20 $05
    ld   a, MUSIC_TITLE_SCREEN                    ; $01:7AAD: $3E $01
    ld   [wMusicTrackToPlay], a                   ; $01:7AAF: $EA $68 $D3

.return
    ret                                           ; $01:7AB2: $C9

.jr_7AB3
    call IncrementEntityState                     ; $01:7AB3: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $01:7AB6: $CD $05 $0C
    ld   [hl], $17                                ; $01:7AB9: $36 $17
    ld   a, $07                                   ; $01:7ABB: $3E $07
    ldh  [hVolumeRight], a                        ; $01:7ABD: $E0 $A9
    ld   a, $70                                   ; $01:7ABF: $3E $70
    ldh  [hVolumeLeft], a                         ; $01:7AC1: $E0 $AA
    ret                                           ; $01:7AC3: $C9

InertLinkState3Handler::
    ldh  a, [hFrameCounter]                       ; $01:7AC4: $F0 $E7
    and  $03                                      ; $01:7AC6: $E6 $03
    jr   nz, .return                              ; $01:7AC8: $20 $19
    call GetEntityTransitionCountdown             ; $01:7ACA: $CD $05 $0C
    dec  [hl]                                     ; $01:7ACD: $35
    jr   nz, .return                              ; $01:7ACE: $20 $13
    call IncrementGameplaySubtype                 ; $01:7AD0: $CD $D6 $44
    xor  a                                        ; $01:7AD3: $AF
    ld   [wIntroSubTimer], a                      ; $01:7AD4: $EA $02 $D0
    ld   [wD003], a                               ; $01:7AD7: $EA $03 $D0
    ld   [wD004], a                               ; $01:7ADA: $EA $04 $D0
    ld   [wEntitiesStatusTable], a                ; $01:7ADD: $EA $80 $C2
    ld   [wEntitiesStatusTable+1], a              ; $01:7AE0: $EA $81 $C2

.return
    ret                                           ; $01:7AE3: $C9

Data_001_7AE4::
    db   $7C, $7C, $44, $45, $7D, $7D, $7D, $7D   ; $01:7AE4
    db   $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D   ; $01:7AEC
    db   $4C, $4D, $7C, $7C, $7C, $7C, $7C, $7C   ; $01:7AF4
    db   $44, $45, $7D, $2D, $2E, $2D, $2E, $2D   ; $01:7AFC
    db   $2E, $7D, $4C, $4D, $7C, $7C, $7C, $7C   ; $01:7B04
    db   $7C, $7C, $7C, $7C, $7C, $77, $46, $7E   ; $01:7B0C
    db   $7E, $7E, $7E, $7E, $7E, $4B, $79, $7C   ; $01:7B14
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $77   ; $01:7B1C
    db   $75, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7B24
    db   $7E, $7E, $7E, $75, $78, $7C, $7C, $7C   ; $01:7B2C
    db   $7C, $7C, $77, $7A, $7A, $74, $73, $74   ; $01:7B34
    db   $5C, $5D, $5E, $5F, $73, $74, $73, $7A   ; $01:7B3C
    db   $7E, $78, $7C, $7C, $7C, $7C, $73, $75   ; $01:7B44
    db   $78, $77, $78, $79, $58, $59, $5A, $5B   ; $01:7B4C
    db   $79, $79, $77, $75, $7E, $74, $7C, $7C   ; $01:7B54
    db   $7C, $7C, $7C, $73, $74, $76, $73, $7A   ; $01:7B5C
    db   $54, $55, $56, $57, $7A, $74, $76, $73   ; $01:7B64
    db   $74, $7C, $7C, $7C, $77, $78, $7C, $79   ; $01:7B6C
    db   $7C, $7C, $7C, $7C, $50, $51, $52, $53   ; $01:7B74
    db   $7C, $7C, $7C, $7C, $7C, $7C, $77, $78   ; $01:7B7C
    db   $7E, $7E, $75, $7E, $78, $77, $75, $78   ; $01:7B84
    db   $79, $2B, $2C, $79, $79, $77, $75, $78   ; $01:7B8C
    db   $77, $75, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7B94
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7B9C
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BA4
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BAC
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BB4
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BBC
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BC4
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BCC
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BD4
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BDC
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BE4
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BEC
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BF4
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7BFC
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C04
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C0C
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C14
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C1C
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C24
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C2C
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C34
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C3C
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C44
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C4C
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E   ; $01:7C54
    db   $7E, $7E, $7E, $7E                       ; $01:7C5C

func_7C60::
    ld   a, [wD00A]                               ; $01:7C60: $FA $0A $D0
    and  a                                        ; $01:7C63: $A7
    jr   nz, .jr_7C70                             ; $01:7C64: $20 $0A
    ld   a, $F4                                   ; $01:7C66: $3E $F4
    ld   [wD00B], a                               ; $01:7C68: $EA $0B $D0
    ld   a, $9B                                   ; $01:7C6B: $3E $9B
    ld   [wD00C], a                               ; $01:7C6D: $EA $0C $D0

.jr_7C70::
    ld   a, [wD00A]                               ; $01:7C70: $FA $0A $D0
    ld   e, a                                     ; $01:7C73: $5F
    ld   d, $00                                   ; $01:7C74: $16 $00
    sla  e                                        ; $01:7C76: $CB $23
    rl   d                                        ; $01:7C78: $CB $12
    sla  e                                        ; $01:7C7A: $CB $23
    rl   d                                        ; $01:7C7C: $CB $12
    ld   a, e                                     ; $01:7C7E: $7B
    sla  e                                        ; $01:7C7F: $CB $23
    rl   d                                        ; $01:7C81: $CB $12
    sla  e                                        ; $01:7C83: $CB $23
    rl   d                                        ; $01:7C85: $CB $12
    add  a, e                                     ; $01:7C87: $83
    ld   e, a                                     ; $01:7C88: $5F
    ld   a, d                                     ; $01:7C89: $7A
    adc  a, $00                                   ; $01:7C8A: $CE $00
    ld   d, a                                     ; $01:7C8C: $57
    ld   c, $00                                   ; $01:7C8D: $0E $00
    ld   hl, wDrawCommand                         ; $01:7C8F: $21 $01 $D6
    ld   a, [wD00C]                               ; $01:7C92: $FA $0C $D0
    ldi  [hl], a                                  ; $01:7C95: $22
    ld   a, [wD00B]                               ; $01:7C96: $FA $0B $D0
    ldi  [hl], a                                  ; $01:7C99: $22
    ld   a, $13                                   ; $01:7C9A: $3E $13
    ldi  [hl], a                                  ; $01:7C9C: $22

.loop
    push hl                                       ; $01:7C9D: $E5
    ld   hl, Data_001_7AE4                        ; $01:7C9E: $21 $E4 $7A
    add  hl, de                                   ; $01:7CA1: $19
    ld   a, [hl]                                  ; $01:7CA2: $7E
    pop  hl                                       ; $01:7CA3: $E1
    ldi  [hl], a                                  ; $01:7CA4: $22
    inc  de                                       ; $01:7CA5: $13
    inc  c                                        ; $01:7CA6: $0C
    ld   a, c                                     ; $01:7CA7: $79
    cp   $14                                      ; $01:7CA8: $FE $14
    jr   nz, .loop                                ; $01:7CAA: $20 $F1

    ld   [hl], $00                                ; $01:7CAC: $36 $00
    ldh  a, [hIsGBC]                              ; $01:7CAE: $F0 $FE
    and  a                                        ; $01:7CB0: $A7
    jr   z, .jr_7CB6                              ; $01:7CB1: $28 $03
    call func_001_7CCB                            ; $01:7CB3: $CD $CB $7C

.jr_7CB6
    ld   hl, wD00A                                ; $01:7CB6: $21 $0A $D0
    inc  [hl]                                     ; $01:7CB9: $34
    ld   a, [wD00B]                               ; $01:7CBA: $FA $0B $D0
    sub  a, $20                                   ; $01:7CBD: $D6 $20
    ld   [wD00B], a                               ; $01:7CBF: $EA $0B $D0
    ld   a, [wD00C]                               ; $01:7CC2: $FA $0C $D0
    sbc  a, $00                                   ; $01:7CC5: $DE $00
    ld   [wD00C], a                               ; $01:7CC7: $EA $0C $D0
    ret                                           ; $01:7CCA: $C9

func_001_7CCB::
    ld   hl, wDrawCommandAlt                      ; $01:7CCB: $21 $91 $DC
    ld   a, [wD00C]                               ; $01:7CCE: $FA $0C $D0
    ldi  [hl], a                                  ; $01:7CD1: $22
    ld   a, [wD00B]                               ; $01:7CD2: $FA $0B $D0
    sub  a, $14                                   ; $01:7CD5: $D6 $14
    ldi  [hl], a                                  ; $01:7CD7: $22
    ld   a, $5F                                   ; $01:7CD8: $3E $5F
    ldi  [hl], a                                  ; $01:7CDA: $22
    ld   a, $03                                   ; $01:7CDB: $3E $03
    ldi  [hl], a                                  ; $01:7CDD: $22
    ld   [hl], $00                                ; $01:7CDE: $36 $00
    ret                                           ; $01:7CE0: $C9

Data_001_7CE1::
    db $00, $50, $80, $50, $00, $51, $80, $51     ; $01:7CE1

Data_001_7CE9::
    db $00, $52, $80, $52, $00, $53, $80, $53     ; $01:7CE9

Data_001_7CF1::
    db $00, $02, $04, $06, $06, $04, $02, $00     ; $01:7CF1

; During the Intro sea sequence, the sea tiles are animated vertically, to simulate waves
; passing behind each others.
; To keep the horizon at a constant level, this vertical motion needs to be compensated.
;
; This table defines by which amount the Background should be shifted vertically when
; drawing the bottom section of the screen, so that the horizon looks constant.
IntroBGVerticalOffsetTable::
    db 3, 2, 1, 0, 0, 1, 2, 3                     ; $01:7CF9

func_001_7D01::
    ld   hl, wScrollXOffsetForSection             ; $01:7D01: $21 $00 $C1
    ldh  a, [hFrameCounter]                       ; $01:7D04: $F0 $E7
    and  $07                                      ; $01:7D06: $E6 $07
    jr   nz, .jr_001_7D0B                         ; $01:7D08: $20 $01
    inc  [hl]                                     ; $01:7D0A: $34

.jr_001_7D0B
    inc  hl                                       ; $01:7D0B: $23
    ldh  a, [hFrameCounter]                       ; $01:7D0C: $F0 $E7
    and  $0F                                      ; $01:7D0E: $E6 $0F
    jr   nz, .jr_001_7D13                         ; $01:7D10: $20 $01
    inc  [hl]                                     ; $01:7D12: $34

.jr_001_7D13
    inc  hl                                       ; $01:7D13: $23
    ldh  a, [hFrameCounter]                       ; $01:7D14: $F0 $E7
    and  $1F                                      ; $01:7D16: $E6 $1F
    jr   nz, .jr_001_7D1B                         ; $01:7D18: $20 $01
    inc  [hl]                                     ; $01:7D1A: $34

.jr_001_7D1B
    inc  hl                                       ; $01:7D1B: $23
    ldh  a, [hFrameCounter]                       ; $01:7D1C: $F0 $E7
    and  $0F                                      ; $01:7D1E: $E6 $0F
    jr   nz, .jr_001_7D23                         ; $01:7D20: $20 $01
    inc  [hl]                                     ; $01:7D22: $34

.jr_001_7D23
    inc  hl                                       ; $01:7D23: $23
    ld   a, [wD004]                               ; $01:7D24: $FA $04 $D0
    add  a, $28                                   ; $01:7D27: $C6 $28
    ld   [wD004], a                               ; $01:7D29: $EA $04 $D0
    jr   nc, .jr_001_7D2F                         ; $01:7D2C: $30 $01
    inc  [hl]                                     ; $01:7D2E: $34

.jr_001_7D2F
    ldh  a, [hFrameCounter]                       ; $01:7D2F: $F0 $E7
    add  a, $FC                                   ; $01:7D31: $C6 $FC
    rra                                           ; $01:7D33: $1F
    rra                                           ; $01:7D34: $1F
    rra                                           ; $01:7D35: $1F
    rra                                           ; $01:7D36: $1F
    and  $07                                      ; $01:7D37: $E6 $07
    ld   e, a                                     ; $01:7D39: $5F
    ld   d, $00                                   ; $01:7D3A: $16 $00
    ld   hl, IntroBGVerticalOffsetTable           ; $01:7D3C: $21 $F9 $7C
    add  hl, de                                   ; $01:7D3F: $19
    ld   a, $00                                   ; $01:7D40: $3E $00
    sub  a, [hl]                                  ; $01:7D42: $96
    ld   [wIntroBGYOffset], a                     ; $01:7D43: $EA $06 $C1

func_001_7D46::
    ldh  a, [hFrameCounter]                       ; $01:7D46: $F0 $E7
    and  $0F                                      ; $01:7D48: $E6 $0F
    cp   $04                                      ; $01:7D4A: $FE $04
    jr   c, ret_001_7D9B                          ; $01:7D4C: $38 $4D

func_001_7D4E::
    ldh  a, [hFrameCounter]                       ; $01:7D4E: $F0 $E7
    rra                                           ; $01:7D50: $1F
    rra                                           ; $01:7D51: $1F
    rra                                           ; $01:7D52: $1F
    rra                                           ; $01:7D53: $1F
    and  $07                                      ; $01:7D54: $E6 $07
    ld   e, a                                     ; $01:7D56: $5F
    ld   d, $00                                   ; $01:7D57: $16 $00
    ld   hl, Data_001_7CF1                        ; $01:7D59: $21 $F1 $7C
    add  hl, de                                   ; $01:7D5C: $19
    ld   e, [hl]                                  ; $01:7D5D: $5E
    ld   hl, Data_001_7CE1                        ; $01:7D5E: $21 $E1 $7C
    ld   a, [wD00F]                               ; $01:7D61: $FA $0F $D0
    and  a                                        ; $01:7D64: $A7
    jr   z, .jr_001_7D6A                          ; $01:7D65: $28 $03
    ld   hl, Data_001_7CE9                        ; $01:7D67: $21 $E9 $7C

.jr_001_7D6A
    add  hl, de                                   ; $01:7D6A: $19
    ld   a, [hli]                                 ; $01:7D6B: $2A
    ld   h, [hl]                                  ; $01:7D6C: $66
    ld   l, a                                     ; $01:7D6D: $6F
    ld   de, $8900                                ; $01:7D6E: $11 $00 $89
    ld   a, [wD00F]                               ; $01:7D71: $FA $0F $D0
    and  a                                        ; $01:7D74: $A7
    jr   z, .jr_001_7D7A                          ; $01:7D75: $28 $03
    ld   de, $9300                                ; $01:7D77: $11 $00 $93

.jr_001_7D7A
    ldh  a, [hFrameCounter]                       ; $01:7D7A: $F0 $E7
    and  $03                                      ; $01:7D7C: $E6 $03
    sla  a                                        ; $01:7D7E: $CB $27
    sla  a                                        ; $01:7D80: $CB $27
    sla  a                                        ; $01:7D82: $CB $27
    sla  a                                        ; $01:7D84: $CB $27
    sla  a                                        ; $01:7D86: $CB $27
    ld   e, a                                     ; $01:7D88: $5F
    add  a, l                                     ; $01:7D89: $85
    ld   l, a                                     ; $01:7D8A: $6F
    ld   a, l                                     ; $01:7D8B: $7D
    ld   [wD006], a                               ; $01:7D8C: $EA $06 $D0
    ld   a, h                                     ; $01:7D8F: $7C
    ld   [wD007], a                               ; $01:7D90: $EA $07 $D0
    ld   a, e                                     ; $01:7D93: $7B
    ld   [wD008], a                               ; $01:7D94: $EA $08 $D0
    ld   a, d                                     ; $01:7D97: $7A
    ld   [wD009], a                               ; $01:7D98: $EA $09 $D0

ret_001_7D9B::
    ret                                           ; $01:7D9B: $C9

func_001_7D9C::
    ld   hl, wScrollXOffsetForSection             ; $01:7D9C: $21 $00 $C1
    ldh  a, [hFrameCounter]                       ; $01:7D9F: $F0 $E7
    and  $07                                      ; $01:7DA1: $E6 $07
    jr   nz, .jr_001_7DA6                         ; $01:7DA3: $20 $01
    inc  [hl]                                     ; $01:7DA5: $34

.jr_001_7DA6
    ld   hl, wScrollXOffsetForSection+1           ; $01:7DA6: $21 $01 $C1
    ld   a, [wD004]                               ; $01:7DA9: $FA $04 $D0
    add  a, $50                                   ; $01:7DAC: $C6 $50
    ld   [wD004], a                               ; $01:7DAE: $EA $04 $D0
    jr   nc, .jr_001_7DB4                         ; $01:7DB1: $30 $01
    inc  [hl]                                     ; $01:7DB3: $34

.jr_001_7DB4
    inc  hl                                       ; $01:7DB4: $23
    ld   a, [wD005]                               ; $01:7DB5: $FA $05 $D0
    add  a, $58                                   ; $01:7DB8: $C6 $58
    ld   [wD005], a                               ; $01:7DBA: $EA $05 $D0
    jr   nc, .jr_001_7DC0                         ; $01:7DBD: $30 $01
    inc  [hl]                                     ; $01:7DBF: $34

.jr_001_7DC0
    inc  hl                                       ; $01:7DC0: $23
    ld   a, [wD00D]                               ; $01:7DC1: $FA $0D $D0
    add  a, $B0                                   ; $01:7DC4: $C6 $B0
    ld   [wD00D], a                               ; $01:7DC6: $EA $0D $D0
    jr   nc, .jr_001_7DCC                         ; $01:7DC9: $30 $01
    inc  [hl]                                     ; $01:7DCB: $34

.jr_001_7DCC
    jp   func_001_7D46                            ; $01:7DCC: $C3 $46 $7D

func_001_7DCF::
    ld   hl, wScrollXOffsetForSection             ; $01:7DCF: $21 $00 $C1
    ldh  a, [hFrameCounter]                       ; $01:7DD2: $F0 $E7
    and  $0F                                      ; $01:7DD4: $E6 $0F
    jr   nz, .jr_001_7DD9                         ; $01:7DD6: $20 $01
    inc  [hl]                                     ; $01:7DD8: $34

.jr_001_7DD9
    ld   hl, wScrollXOffsetForSection+1           ; $01:7DD9: $21 $01 $C1
    ld   a, [wD004]                               ; $01:7DDC: $FA $04 $D0
    add  a, $28                                   ; $01:7DDF: $C6 $28
    ld   [wD004], a                               ; $01:7DE1: $EA $04 $D0
    jr   nc, .jr_001_7DE7                         ; $01:7DE4: $30 $01
    inc  [hl]                                     ; $01:7DE6: $34

.jr_001_7DE7
    inc  hl                                       ; $01:7DE7: $23
    ld   a, [wD005]                               ; $01:7DE8: $FA $05 $D0
    add  a, $2C                                   ; $01:7DEB: $C6 $2C
    ld   [wD005], a                               ; $01:7DED: $EA $05 $D0
    jr   nc, .jr_001_7DF3                         ; $01:7DF0: $30 $01
    inc  [hl]                                     ; $01:7DF2: $34

.jr_001_7DF3
    inc  hl                                       ; $01:7DF3: $23
    ld   a, [wD00D]                               ; $01:7DF4: $FA $0D $D0
    add  a, $58                                   ; $01:7DF7: $C6 $58
    ld   [wD00D], a                               ; $01:7DF9: $EA $0D $D0
    jr   nc, .jr_001_7DFF                         ; $01:7DFC: $30 $01
    inc  [hl]                                     ; $01:7DFE: $34

.jr_001_7DFF
    jp   func_001_7D46                            ; $01:7DFF: $C3 $46 $7D
