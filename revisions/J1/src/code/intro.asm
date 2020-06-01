;
; Opening sequence and Title screen
;

IntroSeaPaletteTable::
    db   $C6, $C2, $C0, $C2

IntroHandlerEntryPoint::
    ldh  a, [hButtonsInactiveDelay]
    and  a  ; if ButtonsInactiveDelay == 0
    jr   z, .checkJoypad
    ; ButtonsInactiveDelay != 0
    dec  a
    ldh  [hButtonsInactiveDelay], a
    jp   RenderIntroFrame

.checkJoypad
    ; If not pressing Start, render the next intro frame
    ldh  a, [hJoypadState]
    and  J_START
    jp   z, RenderIntroFrame

    ;
    ; Start button pressed
    ;

    call label_27F2

    ; If on Title Screen, transition to file menu
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INTRO_TITLE
    jr   z, .transitionToFileMenu

    ; else transition to Title screen
    ld   a, 40  ; Ignore joypad for the next 40 frames
    ldh  [hButtonsInactiveDelay], a
    ld   a, $11
    ld   [wBGMapToLoad], a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, .isGBC
    ; Not GBC
    ld   a, [Data_001_789B]
    ld   [wOBJ0Palette], a
    ld   a, [Data_001_789F]
    ld   [wOBJ1Palette], a
    ld   a, $04
    jr   .paletteEnd
.isGBC
    ld   a, $01
    call ClearFileMenuBG_trampoline
    xor  a
    ld   [$DDD5], a
    ld   a, $08
.paletteEnd

    ld   [$D013], a
    ld   a, $0D
    ld   [wGameplaySubtype], a
    xor  a
    ; Reset entities
    ld   [wEntitiesStatusTable + $00], a
    ld   [wEntitiesStatusTable + $01], a
    ld   [wEntitiesStatusTable + $02], a
    ld   [wEntitiesStatusTable + $03], a
    ld   [wEntitiesStatusTable + $04], a

    ld   [rBGP], a
    ld   [wBGPalette], a

    ld   a, $10
    ld   [$C17E], a

    call ResetIntroTimers
    ld   a, MUSIC_TITLE_SCREEN
    ld   [wMusicTrackToPlay], a
    ld   [$D00F], a
    call func_001_7D4E
    jr   .enableVBlankInterruptAndReturn

.transitionToFileMenu
    jp   TransitionToFileMenu

    ; POI: Jump to End Sequence (dead code, never reached)
    xor  a
    ld   [wGameplaySubtype], a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    ld   [rBGP], a
    ld   [wBGPalette], a
    ld   hl, wGameplayType
    inc  [hl]

.enableVBlankInterruptAndReturn
    ld   a, $01
    ld   [rIE], a ; Enable VBlank interrupt only
    ld   a, $4F
    ld   [rLYC], a
    ret

RenderIntroFrame::
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INTRO_SEA
    jr   c, .dispatchScene
    cp   GAMEPLAY_INTRO_LIGHTNING
    jr   nc, .dispatchScene

    ; Decrement $D000 if > 0
    ld   a, [$D000]
    and  a
    jr   z, .jp_6EC6
    dec  a
    ld   [$D000], a
.jp_6EC6

    rra
    nop
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, IntroSeaPaletteTable
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    call func_020_6BA4_trampoline ; Load BG palette

.dispatchScene
    ld   a, [wGameplaySubtype]
    JP_TABLE
._0 dw IntroSceneStage0Handler
._1 dw IntroSceneStage1Handler
._2 dw IntroSceneStage2Handler
._3 dw IntroShipOnSeaHandler
._4 dw IntroLinkFaceHandler
._5 dw IntroStage5Handler ; transition?
._6 dw IntroStage6Handler ; transition?
._7 dw IntroBeachHandler
._8 dw IntroStage8Handler ; title screen animation?
._9 dw TitleScreenSfxHandler
._A dw IntroStageAHandler ; title screen animation?
._B dw TitleScreenHandler
._C dw IntroStageCHandler
._D dw IntroStageDHandler

IntroSceneStage0Handler::
    call ClearLowerAndMiddleWRAM
    ld   a, $01
    ld [$dbaf], a
    call $27ee
    ld   a, $01
    call ClearFileMenuBG_trampoline
    ld   a, $1A
    call SetWorldMusicTrack
    ld   a, $02
    ld   [wTileMapToLoad], a
    xor  a
    ldh  [hFrameCounter], a
    ld   a, $A2
    ld   [$C13D], a
    ld   a, [$FF40]
    and  $DF
    ld   [wLCDControl], a
    ld   [rLCDC], a
    ld   a, $B4
    ld   [$D016], a
    xor  a
    ld   [$D017], a
    jp   IncrementGameplaySubtypeAndReturn

IntroSceneStage1Handler::
    ld   a, $10
    ld   [wTileMapToLoad], a
    xor  a
    ld   [$DDD5], a
    jp   IncrementGameplaySubtypeAndReturn

IntroSceneStage2Handler::
    call func_001_7D01

    ldh  a, [hIsGBC]
    and  a
    jr   z, .notGBC
    ld   a, $25
    jr   .gbc
.notGBC
    ld   a, $0E
.gbc

    ld   [wBGMapToLoad], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    ld   a, $E0
    ld   [wOBJ1Palette], a
    ld   a, $03
    ld   [rIE], a
    ld   a, $00
    ld   [rLYC], a
    ld   e, $11
    ld   hl, $D000
    xor  a

.loop
    ldi  [hl], a
    dec  e
    jr   nz, .loop

    ld   [wEntitiesStatusTable + $00], a
    ld   [wEntitiesStatusTable + $01], a
    ld   [$C3B0], a
    ld   [$C3B1], a
    ld   [$C3B2], a
    ldh  [hActiveEntityFlipAttribute], a

    ; Configure Link's ship entity
    ld   a, $05
    ld   [wEntitiesStatusTable + $02], a
    ld   a, $C0
    ld   [wEntitiesPosXTable + $02], a
    ld   a, $4E
    ld   [wEntitiesPosYTable + $02], a

    xor  a
    ld   [wEntitiesPhysicsFlagsTable], a
    ld   [$C341], a
    ld   [$C342], a
    ld   [$C343], a
    jp   IncrementGameplaySubtypeAndReturn

Data_001_6F93::
    db   $81, $40, $00, $00, $00, $00, $00, $00, $00

Data_001_6F9C::
    db   $08, $08, $08, $04, $00, $00, $00, $00, $00

IntroShipOnSeaHandler::
    call RenderRain
    call RenderIntroEntities
    ld   a, [wIntroSubTimer]
    and  a
    jr   z, .jr_001_7014

    inc  a
    ld   [wIntroSubTimer], a ; Increment subtimer
    cp   $18
    jr   c, .jp_001_7013
    sub  a, $18
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_6F93
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    ld   hl, Data_001_6F9C
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    call func_020_6A30_trampoline
    ld   a, e
    cp   $08
    jp   nz, .jp_001_7013
    xor  a
    ld   [wEntitiesStatusTable], a
    ld   [$C281], a
    ld   [$C282], a
    ld   [$C290], a
    ld   a, $05
    ld   [wGameplaySubtype], a
    ld   [$D00F], a
    call func_001_7D4E

    ld   a, $11
    ld   [wTileMapToLoad], a

    ld   a, $FF
    ld   [wIntroTimer], a

    xor  a
    ldh  [hBaseScrollX], a
    ld   [wScrollXOffsetForSection], a
    ld   [$C102], a
    ld   [$C103], a
    ld   a, $92
    ld   [$C101], a
    ld   a, $03
    ld   [rIE], a

.jp_001_7013
    ret

.jr_001_7014
    ; If Intro's ship X == $50…
    ld   a, [wEntitiesPosXTable + $02]
    cp   $50
    jr   nz, .transitionEnd

    ; Transition to next sequence
    ld   a, $FF
    ld   [rBGP], a
    ld   a, GAMEPLAY_INTRO_LINK_FACE
    ld   [wGameplaySubtype], a
    ld   a, $0F
    ld   [wBGMapToLoad], a
    ld   a, $01
    ld   [rIE], a
    xor  a
    ldh  [hBaseScrollX], a
    ret
.transitionEnd

    call func_001_7D01
    ldh  a, [hFrameCounter]
    and  $07
    jp   nz, IntroShipOnSeaReturn
    ld   hl, hBaseScrollX
    inc  [hl]
    ld   hl, wEntitiesPosXTable
    dec  [hl]
    inc  hl
    dec  [hl]
    inc  hl
    dec  [hl]
    ld   c, $00

    ldh  a, [hBaseScrollX]
    cp   $10
    jr   z, .jr_001_7068
    inc  c
    cp   $30
    jr   z, .jr_001_7068
    inc  c
    cp   $38
    jr   z, .jr_001_7068
    inc  c
    cp   $58
    jr   z, .jr_001_7068
    inc  c
    cp   $5A
    jr   z, .jr_001_7068
    inc  c
    cp   $69
    jr   nz, IntroShipOnSeaReturn
.jr_001_7068

    ld   e, $01
    ld   d, $00

.loop
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, RenderLightning
    dec  e
    ld   a, e
    cp   -1
    jr   nz, .loop
    ret

Data_001_707B::
    db $28, $78, $60, $38, $68, $58

Data_001_7081::
    db 4, 2, 1, 4, 3, 1

; Spark a lightning over the sea
RenderLightning::
    ld   b, 0

    ; Set lightning entity status
    ld   hl, Data_001_7081
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   [hl], a

    ; Set lightning X position
    ld   hl, Data_001_707B
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a

    ; Set lightning Y position
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], $30

    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20

.playSfx
    ld   a, $1C
    ld   [$D000], a

    call PlayBombExplosionSfx

IntroShipOnSeaReturn:
    ret

IntroLinkFaceHandler::
    call RenderRain
    ld   a, [wIntroTimer]
    inc  a
    ld   [wIntroTimer], a
    cp   128
    jr   nz, .continue
    ; If IntroTimer == 128 frames
    push af
    call IntroLinkScream
    pop  af

.continue
    cp   144
    jr   nz, .continue2
    ; If IntroTimer == 144 frames
    ; Lightning over Link's face
    call RenderLightning.playSfx

.continue2
    cp   160
    jr   nz, .continue4
    ; If FrameCounter == 160 frames
    ; Move back to sea sequence
    ld   a, GAMEPLAY_INTRO_SEA
    ld   [wGameplaySubtype], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, .notGBC
    ld   a, $25
    jr   .continue3

.notGBC
    ld   a, $0E

.continue3
    ld   [wBGMapToLoad], a
    call LoadTileMapZero_trampoline
    ld   a, $03
    ld   [rIE], a ; Enable interrupts on VBlank and LCDStat
    xor  a
    ld   [wEntitiesStatusTable], a
    ld   [$C281], a
    ld   a, $01
    ld   [wIntroSubTimer], a
    ret

.continue4
    ldh  a, [hFrameCounter]
    and  $7F
    jr   nz, .return
    ; FrameCounter == $7F
    call GetRandomByte
    and  $00
    jr   nz, .return ; always false
    call RenderLightning.playSfx

.return
    ret

LoadTileMapZero_trampoline::
    ld   hl, wFarcallParams
    ld   a, BANK(LoadMapData.LoadTileMapZero)
    ldi  [hl], a
    ld   a, HIGH(LoadMapData.LoadTileMapZero)
    ldi  [hl], a
    ld   a, LOW(LoadMapData.LoadTileMapZero)
    ldi  [hl], a
    ld   a, BANK(@)
    ld   [hl], a
    jp   Farcall

IntroStage5Handler::
    ld   a, $10
    ld   [wBGMapToLoad], a
    ld   a, $01
    ld   [$DDD5], a
    call IncrementGameplaySubtype
    ret

Data_001_7128::
    db 0, 0, 0, 0, $40, $40, $40, $80, $85, $85, $85, $C5, $C9, $C9, $C9, $C9

Data_001_7138::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C

Data_001_7148::
    db 0, 0, 0, 0, $40, $40, $40, $40, $90, $90, $90, $90

label_7154::
    ldh  [hScratch9], a
    ldh  [hScratch9], a

IntroStage6Handler::
    call func_001_71C7
    ld   a, [$D001]
    cp   $A0
    jr   nz, .jr_001_7168
    push af
    ld   a, $02
    ld   [rLYC], a
    pop  af

.jr_001_7168
    dec  a
    ld   [$D001], a
    jr   nz, .jr_001_7188
    ld   a, $07
    ld   [wGameplaySubtype], a
    ld   a, $06
    ld   [wEntitiesStatusTable], a
    ld   a, $B0
    ld   [wEntitiesPosXTable], a
    ld   a, $68
    ld   [wEntitiesPosYTable], a
    ld   a, $01
    ld   [wEntitiesUnknowTableY], a
    ret

.jr_001_7188
    cp   $34
    jr   nc, .return
    and  $03
    jr   nz, .jr_001_719B
    ld   a, [$D010]
    cp   $0C
    jr   z, .jr_001_719B
    inc  a
    ld   [$D010], a

.jr_001_719B
    ldh  a, [hFrameCounter]
    and  $03
    ld   e, a
    ld   a, [$D010]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_7128
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    ld   hl, Data_001_7138
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    ld   hl, Data_001_7148
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ1Palette], a
    call func_020_6AC1_trampoline

.return
    ret

IntroBeachHandler::
    call RenderIntroEntities
    ret

func_001_71C7::
    ld   a, [$C291]
    cp   $02
    jr   nc, .return
    ld   a, [$C114]
    inc  a
    cp   $A0
    jr   nz, .jr_001_71DB
    ld   a, NOISE_SFX_SEA_WAVES
    ldh  [hNoiseSfx], a
    xor  a

.jr_001_71DB
    ld   [$C114], a

.return
    ret

Data_001_71DF::
    db   $9A, $16, $0F, $80, $81, $82, $83, $84
    db   $85, $86, $87, $88, $89, $8A, $8B, $8C
    db   $8D, $8E, $8F

Data_001_71F2::
    db   $9A, $36, $0F, $90, $91
    db   $92, $93, $94, $95, $96, $97, $98, $99
    db   $9A, $9B, $9C, $9D, $9E, $9F

Data_001_7205::
    db   $9A, $56
    db   $0F, $A0, $A1, $A2, $A3, $A4, $A5, $A6
    db   $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE
    db   $AF

Data_001_7218::
    db   $9A, $76, $0F, $B0, $B1, $B2, $B3
    db   $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB
    db   $BC, $BD, $BE, $BF

Data_001_722B::
    db   $9A, $96, $0F, $C0
    db   $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8
    db   $C9, $CA, $CB, $CC, $CD, $CE, $CF

Data_001_723E::
    db   $9A
    db   $B6, $0F, $D0, $D1, $D2, $D3, $D4, $D5
    db   $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD
    db   $DE, $DF

Data_001_7251::
    db   $9A, $D6, $0F, $E0, $E1, $E2
    db   $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA
    db   $EB, $EC, $ED, $EE, $EF

Data_001_7264::
    dw Data_001_7218
    dw Data_001_7205
    dw Data_001_722B
    dw Data_001_71F2
    dw Data_001_723E
    dw Data_001_71DF
    dw Data_001_7251

IntroStage8Handler::
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_7264
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   hl, $D601
    ld   c, $13

.loop
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, .loop

    ld   [hl], $00
    ldh  a, [hIsGBC]
    and  a
    jr   z, .gbc
    call func_001_7338
.gbc

    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    cp   $07
    jr   nz, .return
    call IncrementGameplaySubtype

.return
    ret

Data_001_72A5::
    db   $9A, $16, $0F, $00, $00, $00, $00, $00   ; $72A5
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $72AD
    db   $00, $00, $00

Data_001_72B8::
    db   $9A, $36, $0F, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $72BD
    db   $00, $00, $00, $00, $00, $00

Data_001_72CB::
    db   $9A, $56
    db   $0F, $00, $00, $00, $00, $00, $00, $00   ; $72CD
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $72D5
    db   $00

BLANK_1 = $01
BLANK = $02

Data_001_72DE::
    db   $9A, $76, $0F, BLANK_1, BLANK_1, BLANK_1, BLANK_1
    db   BLANK_1, BLANK_1, BLANK_1, BLANK_1, BLANK_1, BLANK_1, BLANK_1, BLANK_1   ; $72E5
    db   BLANK_1, BLANK_1, BLANK_1, BLANK_1


Data_001_72F1::
    db   $9A, $96, $0F, BLANK
    db   BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK   ; $72F5
    db   BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK

Data_001_7304::
    db   $9A   ; $72FD
    db   $B6, $0F, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK   ; $7305
    db   BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK   ; $730D
    db   BLANK, BLANK

Data_001_7317::
    db   $9A, $D6, $0F, BLANK, BLANK, BLANK
    db   BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK
    db   BLANK, BLANK, BLANK, BLANK, BLANK

Data_001_732A::
    dw   Data_001_72DE
    dw   Data_001_72CB
    dw   Data_001_72F1
    dw   Data_001_72B8
    dw   Data_001_7304
    dw   Data_001_72A5
    dw   Data_001_7317

func_001_7338::
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_732A
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   hl, $DC91
    ld   c, $13

jr_001_734C::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, jr_001_734C
    ld   [hl], $00
    ret

TitleScreenSfxHandler::
    ; If $C17E != 10…
    ld   a, [$C17E]
    cp   $10
    jr   c, .return

    ld   a, NOISE_SFX_TITLE_APPEARS
    ldh  [hNoiseSfx], a
    call IncrementGameplaySubtype
.return
    ret

Data_001_7364::
    db   $9B, $B7, $0D, $65, $66, $67, $68, $69   ; $7364
    db   $6A, $6B, $6C, $6D, $6E, $6F, $70, $71   ; $736C
    db   $72, $00                                 ; $7374

IntroStageAHandler::
    ld   de, Data_001_7364
    ld   hl, $D601
    ld   c, $12

.loop
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, .loop

    ldh  a, [hIsGBC]
    and  a
    jr   nz, .gbc
    call func_001_79AE
    jr   .endIf
.gbc
    xor  a
    call func_001_79C2
    call func_001_73B1
.endIf

    ld   a, $3C
    ld   [$D015], a
    call IncrementGameplaySubtype
    ; fallthrough

ResetIntroTimers::
    ld   a, $A0
    ld   [wIntroTimer], a
    xor  a
    ld   [wIntroSubTimer], a
    ld   a, $FF
    ld   [$D003], a
    ret

Data_001_73AC::
    db   $9B, $B7, $4D, $07, $00

func_001_73B1::
    ld   de, Data_001_73AC
    ld   hl, $DC91
    ld   c, $12

.loop
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, .loop
    ret

Data_001_73C0::
    db $18, $18, $38, $40, $58, $60, $80, $88

Data_001_73C8::
    db $20, $48, $44, $28, $44, $28, $28, $40

TitleScreenHandler::
    call RenderIntroEntities
    call func_001_7920
    ldh  a, [hFrameCounter]
    and  $3F
    jr   nz, .jr_001_7418
    ld   e, $01
    ld   d, $00

.loop
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, .jr_001_73F0
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, .loop
    jr   .jr_001_7418

.jr_001_73F0
    ld   [hl], $08
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $3F
    ld   a, [$D003]
    inc  a
    ld   [$D003], a
    and  $07
    ld   c, a
    ld   b, $00

    ld   hl, Data_001_73C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ld   hl, Data_001_73C8
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a

.jr_001_7418
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    and  $0F
    jr   nz, .return
    ld   a, [$D001]
    dec  a
    ld   [$D001], a
    jr   nz, .return
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    call label_27EA

.return
    ret

IntroStageCHandler::
    call func_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, .return
    jp   func_001_6162

.return
    ret

IntroStageDHandler::
    ld   a, $11
    ld   [wTileMapToLoad], a
    ld   a, $0B
    ld   [wGameplaySubtype], a
    ld   a, $C9
    ld   [wBGPalette], a
    ld   a, $1C
    ld   [wOBJ0Palette], a
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [$FF97], a
    dec  a
    ld   [$D018], a
    ret

RenderRain::
    call GetRandomByte
    and  $18
    add  a, $10
    ldh  [hScratch1], a
    call GetRandomByte
    and  $18
    add  a, $10
    ldh  [hScratch0], a
    ld   hl, $C04C
    ; On the sea, limit the rain to the top section of the screen ($10)
    ld   c, $10
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INTRO_LINK_FACE ; if GameplaySubtype != LINK_FACE
    jr   nz, .loop
    ; On Link's face, the rain covers all the $15 rows of the screen
    ld   c, $15

.loop
    ldh  a, [hScratch1]
    ldi  [hl], a
    ldh  a, [hScratch0]
    ldi  [hl], a
    call GetRandomByte
    and  $01       ; if random(0,1) == 0
    ld   a, $28
    jr   z, .next  ;   jump to next
    call GetRandomByte
    and  $06
    add  a, $70

.next
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ldh  a, [hScratch0]
    add  a, $1C
    ldh  [hScratch0], a
    cp   $A0
    jr   c, .continue
    sub  a, $98
    ldh  [hScratch0], a
    ldh  a, [hScratch1]
    add  a, $25
    ldh  [hScratch1], a

.continue
    dec  c
    jr   nz, .loop
    ret

Data_001_74B8::
    db $99, $2B, $83, $1E, $20, $22, $24, $99, $2C, $83, $1F, $21, $23, $25, 0

IntroLinkScream::
    ld   de, $D601
    ld   hl, Data_001_74B8
    ld   c, $0F

.loop
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, .loop

    ret

RenderIntroEntities::
    xor  a
    ld   [wOAMNextAvailableSlot], a
    ld   c, $02  ; Entities count
    ld   b, $00

.loop
    ld   a, c
    ld   [wActiveEntityIndex], a

    ; a = EntityStatus[c]
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .continue ; If no entity at this table index, continue

    ; hActiveEntityPosX = wEntitiesPosXTable[c]
    ld   hl, wEntitiesPosXTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityPosX], a

    ; hActiveEntityVisualPosY = wEntitiesPosYTable[c]
    ld   hl, wEntitiesPosYTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityVisualPosY], a

    ; hActiveEntitySpriteVariant = wEntitiesSpriteVariantTable[c]
    ld   hl, wEntitiesSpriteVariantTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntitySpriteVariant], a

    ; hActiveEntityState = wEntitiesStateTable[c]
    ld   hl, wEntitiesStateTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityState], a
    call RenderIntroEntity

.continue
    dec  c
    ld   a, c
    cp   -1
    jr   nz, .loop
    ret

; Inputs:
;   bc: index of entity in entities table
RenderIntroEntity::
    ; a = wEntitiesStatusTable[bc]
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   a, [hl]

    cp   ENTITY_INTRO_SHIP
    jr   z, RenderIntroShip
    cp   ENTITY_INTRO_MARIN
    jp   z, RenderIntroMarin
    cp   ENTITY_INTRO_INERT_LINK
    jp   z, RenderIntroInertLink
    cp   ENTITY_INTRO_SPARKLE
    jp   z, RenderIntroSparkle
    call GetEntityTransitionCountdown
    jr   nz, .jp_7533
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   [hl], b
    ret

.jp_7533
    dec  [hl]
    call func_001_762B
    ret

Data_001_7538::
    db   $00, $00, $1C, $02, $00, $08, $1E, $02   ; $7538
    db   $10, $F8, $20, $02, $10, $00, $22, $02   ; $7540
    db   $10, $08, $24, $02, $10, $10, $26, $02   ; $7548

Data_001_7550::
    db $F8, $04, $32, $01, $E8, $04, $32, $01, $D8, $04, $32, $01, $C8, $04, $32, $01

ShipHeaveTable::
    db 2, 1, 0, 0, 0, 1, 2, 2

RenderIntroShip::
    ld   a, [wIntroSubTimer]
    and  a
    ld   a, $00
    jr   nz, .skip
    ldh  a, [hFrameCounter]
    add  a, $D0
    rra
    rra
    rra
    rra
    and  $07
.skip
    ld   e, a
    ld   d, $00
    ld   hl, ShipHeaveTable
    add  hl, de
    ld   a, [hl]
    ld   hl, hActiveEntityVisualPosY
    add  a, [hl]
    ld   [hl], a
    ld   hl, Data_001_7538
    ld   de, wOAMBuffer
    push bc
    ld   c, $06

.loop
    ldh  a, [hActiveEntityVisualPosY]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ldh  a, [hActiveEntityPosX]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, .loop

    ld   a, [wIntroSubTimer]
    cp   $10
    jr   c, .return
    ld   hl, Data_001_7550
    ld   de, $C018
    ld   c, $04
.loop2
    ldh  a, [hActiveEntityVisualPosY]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ldh  a, [hActiveEntityPosX]
    add  a, [hl]
    inc  hl
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, .loop2

.return
    pop  bc
    ret

Data_001_75CB::
    db   $00, $00, $34, $01, $00, $08, $36, $01   ; $75CB
    db   $10, $00, $2C, $01, $20, $F8, $2C, $01   ; $75D3
    db   $28, $00, $2E, $21, $30, $F0, $2E, $01   ; $75DB
    db   $08, $00, $36, $21, $08, $08, $34, $21   ; $75E3
    db   $18, $00, $30, $01, $18, $08, $2C, $21   ; $75EB
    db   $28, $10, $2E, $21, $28, $10, $2E, $21   ; $75F3
    db   $00, $08, $34, $21, $00, $00, $36, $21   ; $75FB
    db   $10, $08, $2C, $21, $20, $10, $2C, $21   ; $7603
    db   $28, $08, $2E, $01, $30, $18, $2E, $21   ; $760B
    db   $08, $08, $36, $01, $08, $00, $34, $01   ; $7613
    db   $18, $08, $30, $21, $18, $00, $2C, $01   ; $761B
    db   $28, $F8, $2E, $01, $28, $F8, $2E, $01   ; $7623

func_001_762B::
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   a, [hl]
    dec  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    sla  a
    add  a, e
    ld   e, a
    ld   d, b
    ld   hl, Data_001_75CB
    add  hl, de
    ld   c, $06
    call RenderActiveEntitySpritesRect
    ld   a, [wOAMNextAvailableSlot]
    add  a, $18
    ld   [wOAMNextAvailableSlot], a
    ret

IntroMarinSpriteVariants::
.variant0
    db $00, $03
    db $02, $03
.variant1
    db $04, $03
    db $06, $03
.variant2
    db $08, $03
    db $0A, $03
.variant3
    db $0C, $03
    db $0E, $03

RenderIntroMarin::
    call func_001_71C7
    xor  a
    ld   [wEntitiesPhysicsFlagsTable], a
    ld   de, IntroMarinSpriteVariants
    call RenderActiveEntitySpritesPair

    ld   a, [wOAMNextAvailableSlot]
    add  a, $08
    ld   [wOAMNextAvailableSlot], a
    ldh  a, [hActiveEntityState]

    JP_TABLE
._0 dw IntroMarinState0
._1 dw IntroMarinState1
._2 dw IntroMarinState2
._3 dw IntroMarinState3
._4 dw IntroMarinState4

IntroMarinState0::
    call func_001_7D9C
    ldh  a, [hFrameCounter]
    rra
    rra
    rra
    and  $01
    call SetEntitySpriteVariant
    ldh  a, [hActiveEntityPosX]
    cp   $48
    jr   nc, .jr_769C
    call GetEntityTransitionCountdown
    ld   [hl], $40
    call IncrementEntityState

.jr_769C
    ld   hl, wEntitiesUnknowTableY
    add  hl, bc
    dec  [hl]
    jr   nz, .jr_76AA
    ld   [hl], $04
    ld   hl, wEntitiesPosXTable
    add  hl, bc
    dec  [hl]

.jr_76AA
    ret

IntroMarinState1::
    call func_001_7D46
    ld   a, $01
    call SetEntitySpriteVariant
    call GetEntityTransitionCountdown
    jr   nz, .jr_76D4
    call IncrementEntityState
    ld   a, $07
    ld   [$C281], a
    ld   a, $FE
    ld   [$C201], a
    ld   a, $6E
    ld   [$C211], a
    xor  a
    ld   [$C291], a
    ld   [$C2E1], a
    ldh  [hFrameCounter], a
    ret

.jr_76D4
    dec  [hl]
    ret

IntroMarinState2::
    call func_001_7D9C
    ld   a, [$C201]
    dec  a
    ld   [$C201], a
    ldh  a, [hFrameCounter]
    and  $01
    jr   nz, .jr_7707
    ld   hl, hBaseScrollX
    inc  [hl]
    ld   a, [hl]
    cp   $30
    jr   nz, .jr_76F7
    call GetEntityTransitionCountdown
    ld   [hl], $40
    jp   IncrementEntityState

.jr_76F7
    cp   $20
    jr   nz, .jr_76FF
    call func_001_7A16
    xor  a

.jr_76FF
    cp   $22
    jr   nz, .jr_7707
    call func_001_7A11
    xor  a

.jr_7707
    ldh  a, [hFrameCounter]
    rra
    rra
    and  $01
    call SetEntitySpriteVariant
    ret

IntroMarinState3::
    call GetEntityTransitionCountdown
    jr   nz, .jr_7778
    call func_001_7DCF
    ldh  a, [hFrameCounter]
    and  $01
    jr   nz, .jr_776C
    ld   a, [$C201]
    dec  a
    ld   [$C201], a
    ldh  a, [hFrameCounter]
    and  $03
    jr   nz, .jr_776C
    ld   hl, hBaseScrollX
    inc  [hl]
    ld   a, [hl]
    cp   $40
    jr   z, .jr_7740
    cp   $3A
    jr   nz, .jr_7745
    call GetEntityTransitionCountdown
    ld   [hl], $30
    jr   .jr_7745

.jr_7740
    call GetEntityTransitionCountdown
    ld   [hl], $50

.jr_7745
    ldh  a, [hBaseScrollX]
    cp   $56
    jr   nz, .jr_775C
    ld   a, $A0
    ld   [hl], a
    ld   [rSCX], a
    ld   a, $01
    ld   [rIE], a
    call GetEntityTransitionCountdown
    ld   [hl], $E0
    jp   IncrementEntityState

.jr_775C
    cp   $20
    jr   nz, .jr_7764
    call func_001_7A16
    xor  a

.jr_7764
    cp   $22
    jr   nz, .jr_776C
    call func_001_7A11
    xor  a

.jr_776C
    ldh  a, [hFrameCounter]
    rra
    rra
    rra
    rra
    and  $01
    call SetEntitySpriteVariant
    ret

.jr_7778
    dec  [hl]
    call func_001_7D46
    ld   a, $01
    jp   SetEntitySpriteVariant

IntroMarinState4::
    call func_001_7D46
    ldh  a, [hFrameCounter]
    and  $01
    jr   nz, .return
    ld   a, $02
    call SetEntitySpriteVariant
    ld   a, $00
    ld   [$C3B1], a
    call GetEntityTransitionCountdown
    jr   z, .jr_779A
    dec  [hl]

.jr_779A
    cp   $A0
    jr   nc, .return
    cp   $90
    jr   nc, .jr_77B2
    cp   $50
    jr   nc, .return
    cp   $4A
    jr   nc, .jr_77B2
    cp   $3C
    jr   nc, .return
    cp   $36
    jr   c, .return

.jr_77B2
    ld   a, $03
    call SetEntitySpriteVariant
    ld   a, $01
    ld   [$C3B1], a

.return
    ret

Data_001_77BD::
    db   $38, $00, $38, $20
    db   $3A, $00, $3A, $20
    db   $3A, $00, $3A, $20
    db   $3C, $00, $3E, $00
    db   $3C, $00, $3E, $00
    db   $3A, $00, $3A, $20
    db   $3A, $00, $3A, $20
    db   $38, $00, $38, $20

RenderIntroSparkle::
    xor  a
    ld   [$C3C1], a

jr_001_77E1::
    call GetEntityTransitionCountdown
    dec  [hl]
    jr   nz, jr_001_77ED
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   [hl], b
    ret

jr_001_77ED::
    ld   a, [hl]
    rra
    rra
    rra
    and  $07
    ldh  [hActiveEntitySpriteVariant], a
    xor  a
    ld   [wEntitiesPhysicsFlagsTable], a
    ld   de, Data_001_77BD
    call RenderActiveEntitySpritesPair
    ld   a, [wOAMNextAvailableSlot]
    add  a, $08
    ld   [wOAMNextAvailableSlot], a
    ret

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

testsets:
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

Data_001_7850::
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
Data_001_7898:
    db   $AC, $AC, $6C

Data_001_789B:
    db   $1C
Data_001_789C:
    db   $00, $04, $18

Data_001_789F:
    db   $1C
Data_001_78A0:
    db   $F5, $7A, $00, $00
    db   $00, $00, $00, $00
    db   $F5, $7A, $FF, $7F
    db   $FF, $7F, $FF, $7F
    db   $F5, $7A, $FF, $7F
    db   $FF, $7F, $00, $00

unkasdasd:
    db   $F5, $7A, $84, $04
    db   $42, $00, $00, $00
    db   $F5, $7A, $BE, $6F
    db   $9C, $6B, $5A, $6B
    db   $F5, $7A, $FF, $7F
    db   $7B, $6B, $A5, $14
    db   $F5, $7A, $E8, $08
    db   $63, $00, $00, $00
    db   $F5, $7A, $9E, $5F
    db   $39, $5B, $D6, $5A
    db   $F5, $7A, $FF, $7F
    db   $F7, $5A, $29, $25
    db   $F5, $7A, $4C, $09
    db   $A5, $00, $00, $00
    db   $F5, $7A, $7D, $4F
    db   $D6, $46, $31, $46
    db   $F5, $7A, $FF, $7F
    db   $73, $46, $CE, $39
    db   $F5, $7A, $B0, $0D
    db   $C6, $00, $00, $00
    db   $F5, $7A, $3D, $3F
    db   $73, $36, $AD, $35
    db   $F5, $7A, $FF, $7F
    db   $10, $36, $52, $4A
    db   $F5, $7A, $14, $0E
    db   $08, $01, $00, $00
    db   $F5, $7A, $1C, $2F
    db   $10, $22, $08, $21
    db   $F5, $7A, $FF, $7F
    db   $8C, $21, $F7, $5E
    db   $F5, $7A, $78, $12
    db   $29, $01, $00, $00
    db   $F5, $7A, $FC, $1E
    db   $AD, $11, $84, $10
    db   $F5, $7A, $FF, $7F
    db   $08, $11, $7B, $6F
    db   $F5, $7A, $DC, $12
    db   $4A, $01, $00, $00
    db   $F5, $7A, $DC, $12
    db   $4A, $01, $00, $00
    db   $F5, $7A, $FF, $7F
    db   $A5, $00, $FF, $7F


func_001_7920::
    ld   hl, $D015
    ld   a, [hl]
    and  a
    jr   z, .jr_001_7929
    dec  [hl]
    ret

.jr_001_7929
    ld   a, $79
    ldh  [hActiveEntityPosX], a
    ld   hl, $D018
    ld   a, $46
    add  a, [hl]
    ldh  [hActiveEntityVisualPosY], a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, .jr_001_795D
    ld   a, [$D013]
    cp   $04
    jr   z, .jr_001_797D
    ld   hl, $D014
    inc  [hl]
    ld   a, [hl]
    cp   $0C
    jp   nz, .jr_001_7997
    xor  a
    ld   [hl], a
    ld   hl, $D013
    inc  [hl]
    ld   a, [hl]
    cp   $04
    jp   z, .jr_001_7997
    call func_001_79AE
    jp   .jr_001_7997

.jr_001_795D
    ld   a, [$D013]
    cp   $08
    jr   z, .jr_001_797D
    ld   hl, $D014
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   nz, .jr_001_7a9f
    xor  a
    ld   [hl], a
    ld   hl, $D013
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   z, .jr_001_7a9f
    call func_001_79C2
    jr   .jr_001_7a9f

.jr_001_797D
    ld hl, $d016                                  ; $7a50: $21 $16 $d0
    ld a, [hl+]                                   ; $7a53: $2a
    ld b, [hl]                                    ; $7a54: $46
    or b                                          ; $7a55: $b0
    jr z, func_001_7920.jr_001_7a63               ; $7a56: $28 $0b

    dec hl                                        ; $7a58: $2b
    ld a, [hl]                                    ; $7a59: $7e
    sub $01                                       ; $7a5a: $d6 $01
    ld [hl+], a                                   ; $7a5c: $22
    ld a, [hl]                                    ; $7a5d: $7e
    sbc $00                                       ; $7a5e: $de $00
    ld [hl], a                                    ; $7a60: $77
    jr .jr_001_7a9f                                ; $7a61: $18 $3c
.jr_001_7a63
    ld hl, $d012                                  ; $7a63: $21 $12 $d0
    inc [hl]                                      ; $7a66: $34
    ld a, [hl]                                    ; $7a67: $7e
    cp $06                                        ; $7a68: $fe $06
    jr nz, .jr_001_7a82                            ; $7a6a: $20 $16
    xor a                                         ; $7a6c: $af
    ld [hl], a                                    ; $7a6d: $77
    ld a, [$d011]                                 ; $7a6e: $fa $11 $d0
    inc a                                         ; $7a71: $3c
    cp $09                                        ; $7a72: $fe $09
    jr nz, .jr_001_7a7f                            ; $7a74: $20 $09
    call $7b14                            ; $7a76: $cd $10 $7b
    xor a                                         ; $7a79: $af
    ld   [$d011], a                                 ; $7a7a: $ea $11 $d0
    jr   .jr_001_7a9f                                ; $7a7d: $18 $20
.jr_001_7a7f
    ld   [$d011], a                                 ; $7a7f: $ea $11 $d0
.jr_001_7a82
    ld   hl, Data_001_7850                          ; $7a82: $21 $e3 $78
    ld   a, [$d011]                                 ; $7a85: $fa $11 $d0
    sla  a                                         ; $7a88: $cb $27
    sla  a                                         ; $7a8a: $cb $27
    sla  a                                         ; $7a8c: $cb $27
    ld   b, $00                                     ; $7a8e: $06 $00
    ld   c, a                                       ; $7a90: $4f
    add  hl, bc                                    ; $7a91: $09
    ld   c, $02                                     ; $7a92: $0e $02
    call RenderActiveEntitySpritesRect            ; $7a94: $cd $eb $3c
    ld   a, [wOAMNextAvailableSlot]                 ; $7a97: $fa $c0 $c3
    add  $08                                       ; $7a9a: $c6 $08
    ld   [wOAMNextAvailableSlot], a                 ; $7a9c: $ea $c0 $c3

.jr_001_7a9f
    ldh  a, [hIsGBC]
    and  a
    jr   z, .jr_001_7997
    ld   a, [$D013]
    cp   $08
    jr   z, .jr_001_7990
    ld   hl, testsets
    ld   c, $14
    jr   .render

.jr_001_7990
    ld   hl, Data_001_7870
    ld   c, 14
    jr   .render

.jr_001_7997
    ld   a, [$D013]
    cp   $04
    jr   z, .jr_001_79A5
    ld   hl, Data_001_7808
    ld   c, 15
    jr   .render

.jr_001_79A5
    ld   hl, Data_001_7828
    ld   c, 8

.render
    call RenderActiveEntitySpritesRect
    ret

func_001_79AE::
    ld   b, $00
    ld   c, a
    ld   hl, Data_001_7898
    add  hl, bc
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    ld   hl, Data_001_789C
    add  hl, bc
    ld   a, [hl]
    ld   [wOBJ1Palette], a
    ret

func_001_79C2::
    ld   b, a
    sla  a
    add  b
    sla  a
    sla  a
    sla  a
    ld   b, $00
    ld   c, a
    ld   hl, Data_001_78A0
    add  hl, bc
    ld   bc, $DC78
    ld   e, $18

.loop
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    dec  e
    jr   nz, .loop

    ld   a, $14
    ld   [$DDD3], a
    ld   a, $c
    ld   [$DDD4], a
    ld   a, $82
    ld   [$DDD1], a
    ret

     call GetRandomByte                            ; $7b10: $cd $12 $28
    or $20                                        ; $7b13: $f6 $20
    ld [$d016], a                                 ; $7b15: $ea $16 $d0
    ld a, $01                                     ; $7b18: $3e $01
    ld [$d017], a                                 ; $7b1a: $ea $17 $d0
    ret                                           ; $7b1d: $c9

Data_001_79EC::
    db   $98, $00, $43, $7D, $98, $20, $43, $7D   ; $79EC
    db   $98, $40, $43, $7D, $98, $60, $43, $7D   ; $79F4
    db   $00                                      ; $79FC

Data_001_79FD::
    db   $98, $04, $03, $7D, $7D, $4C, $4D, $98   ; $79FD
    db   $24, $43, $7D, $98, $44, $43, $7D, $98   ; $7A05
    db   $64, $43, $7D, $00                       ; $7A0D

func_001_7A11::
    ld   hl, Data_001_79FD
    jr   jr_001_7A19

func_001_7A16::
    ld   hl, Data_001_79EC

jr_001_7A19::
    ld   de, $D601
    push bc
    ld   c, $18

jr_001_7A1F::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, jr_001_7A1F
    pop  bc
    ret

Data_001_7A27::
    db   $10, $00, $12, $00, $14, $00, $16, $00   ; $7A27

RenderIntroInertLink::
    ldh  a, [hActiveEntityPosX]
    cp   $F0
    jr   nc, .jr_001_7A47
    xor  a
    ld   [wEntitiesPhysicsFlagsTable], a
    ld   de, Data_001_7A27
    call RenderActiveEntitySpritesPair
    ld   a, [wOAMNextAvailableSlot]
    add  a, $08
    ld   [wOAMNextAvailableSlot], a

.jr_001_7A47
    ldh  a, [hActiveEntityState]
    JP_TABLE
._00 dw InertLinkState0Handler
._01 dw InertLinkState1Handler
._02 dw InertLinkState2Handler
._03 dw InertLinkState3Handler

InertLinkState0Handler::
    call GetEntityTransitionCountdown
    dec  [hl]
    jr   nz, .return
    ld   [hl], $90
    call IncrementEntityState

.return
    ret

InertLinkState1Handler::
    ldh  a, [hFrameCounter]
    and  $03
    jr   nz, .return
    call GetEntityTransitionCountdown
    dec  [hl]
    jr   z, .nextState

.return
    ret

.nextState
    jp   IncrementEntityState

InertLinkState2Handler::
    ld   a, [$D00A]
    cp   $13
    jr   z, .jr_7AB3
    ld   a, [$D00E]
    inc  a
    ld   [$D00E], a
    and  $03
    jr   nz, .return
    ld   a, [wEntitiesPosYTable]
    cp   $A0
    jr   nc, .jr_7A8B
    inc  a
    ld   [wEntitiesPosYTable], a

.jr_7A8B
    ld   a, [$C211]
    cp   $A0
    jr   nc, .jr_7A96
    inc  a
    ld   [$C211], a

.jr_7A96
    ldh  a, [$FF97]
    push af
    dec  a
    ldh  [$FF97], a
    pop  af
    and  $07
    jr   nz, .return
    push bc
    call func_7C60
    pop  bc
    ld   a, [$D00A]
    cp   $0B
    jr   nz, .return
    ld   a, MUSIC_TITLE_SCREEN_INTRO
    ld   [wMusicTrackToPlay], a

.return
    ret

.jr_7AB3
    call IncrementEntityState
    call GetEntityTransitionCountdown
    ld   [hl], $17
    ld   a, $07
    ldh  [hWindowYUnused], a
    ld   a, $70
    ldh  [hWindowXUnused], a
    ret

InertLinkState3Handler::
    ldh  a, [hFrameCounter]
    and  $03
    jr   nz, .return
    call GetEntityTransitionCountdown
    dec  [hl]
    jr   nz, .return
    call IncrementGameplaySubtype
    xor  a
    ld   [$D002], a
    ld   [$D003], a
    ld   [$D004], a
    ld   [wEntitiesStatusTable], a
    ld   [$C281], a

.return
    ret

Data_001_7AE4::
    db   $7C, $7C, $44, $45, $7D, $7D, $7D, $7D
    db   $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D
    db   $4C, $4D, $7C, $7C, $7C, $7C, $7C, $7C
    db   $44, $45, $7D, $2D, $2E, $2D, $2E, $2D
    db   $2E, $7D, $4C, $4D, $7C, $7C, $7C, $7C
    db   $7C, $7C, $7C, $7C, $7C, $77, $46, $7E
    db   $7E, $7E, $7E, $7E, $7E, $4B, $79, $7C
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $77
    db   $75, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $75, $78, $7C, $7C, $7C
    db   $7C, $7C, $77, $7A, $7A, $74, $73, $74
    db   $5C, $5D, $5E, $5F, $73, $74, $73, $7A
    db   $7E, $78, $7C, $7C, $7C, $7C, $73, $75
    db   $78, $77, $78, $79, $58, $59, $5A, $5B
    db   $79, $79, $77, $75, $7E, $74, $7C, $7C
    db   $7C, $7C, $7C, $73, $74, $76, $73, $7A
    db   $54, $55, $56, $57, $7A, $74, $76, $73
    db   $74, $7C, $7C, $7C, $77, $78, $7C, $79
    db   $7C, $7C, $7C, $7C, $50, $51, $52, $53
    db   $7C, $7C, $7C, $7C, $7C, $7C, $77, $78
    db   $7E, $7E, $75, $7E, $78, $77, $75, $78
    db   $79, $2B, $2C, $79, $79, $77, $75, $78
    db   $77, $75, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    db   $7E, $7E, $7E, $7E

func_7C60::
    ld   a, [$D00A]
    and  a
    jr   nz, .jr_7C70
    ld   a, $F4
    ld   [$D00B], a
    ld   a, $9B
    ld   [$D00C], a

.jr_7C70::
    ld   a, [$D00A]
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   a, e
    sla  e
    rl   d
    sla  e
    rl   d
    add  a, e
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    ld   c, $00
    ld   hl, $D601
    ld   a, [$D00C]
    ldi  [hl], a
    ld   a, [$D00B]
    ldi  [hl], a
    ld   a, $13
    ldi  [hl], a

.loop
    push hl
    ld   hl, Data_001_7AE4
    add  hl, de
    ld   a, [hl]
    pop  hl
    ldi  [hl], a
    inc  de
    inc  c
    ld   a, c
    cp   $14
    jr   nz, .loop

    ld   [hl], $00
    ldh  a, [hIsGBC]
    and  a
    jr   z, .jr_7CB6
    call func_001_7CCB

.jr_7CB6
    ld   hl, $D00A
    inc  [hl]
    ld   a, [$D00B]
    sub  a, $20
    ld   [$D00B], a
    ld   a, [$D00C]
    sbc  a, $00
    ld   [$D00C], a
    ret

func_001_7CCB::
    ld   hl, $DC91
    ld   a, [$D00C]
    ldi  [hl], a
    ld   a, [$D00B]
    sub  a, $14
    ldi  [hl], a
    ld   a, $5F
    ldi  [hl], a
    ld   a, $03
    ldi  [hl], a
    ld   [hl], $00
    ret

Data_001_7CE1::
    db $00, $50, $80, $50, $00, $51, $80, $51

Data_001_7CE9::
    db $00, $52, $80, $52, $00, $53, $80, $53

Data_001_7CF1::
    db $00, $02, $04, $06, $06, $04, $02, $00

; During the Intro sea sequence, the sea tiles are animated vertically, to simulate waves
; passing behind each others.
; To keep the horizon at a constant level, this vertical motion needs to be compensated.
;
; This table defines by which amount the Background should be shifted vertically when
; drawing the bottom section of the screen, so that the horizon looks constant.
IntroBGVerticalOffsetTable::
    db 3, 2, 1, 0, 0, 1, 2, 3

func_001_7D01::
    ld   hl, wScrollXOffsetForSection
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, .jr_001_7D0B
    inc  [hl]

.jr_001_7D0B
    inc  hl
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, .jr_001_7D13
    inc  [hl]

.jr_001_7D13
    inc  hl
    ldh  a, [hFrameCounter]
    and  $1F
    jr   nz, .jr_001_7D1B
    inc  [hl]

.jr_001_7D1B
    inc  hl
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, .jr_001_7D23
    inc  [hl]

.jr_001_7D23
    inc  hl
    ld   a, [$D004]
    add  a, $28
    ld   [$D004], a
    jr   nc, .jr_001_7D2F
    inc  [hl]

.jr_001_7D2F
    ldh  a, [hFrameCounter]
    add  a, $FC
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, IntroBGVerticalOffsetTable
    add  hl, de
    ld   a, $00
    sub  a, [hl]
    ld   [wIntroBGYOffset], a

func_001_7D46::
    ldh  a, [hFrameCounter]
    and  $0F
    cp   $04
    jr   c, jr_001_7D9B

func_001_7D4E::
    ldh  a, [hFrameCounter]
    rra
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, Data_001_7CF1
    add  hl, de
    ld   e, [hl]
    ld   hl, Data_001_7CE1
    ld   a, [$D00F]
    and  a
    jr   z, .jr_001_7D6A
    ld   hl, Data_001_7CE9

.jr_001_7D6A
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $8900
    ld   a, [$D00F]
    and  a
    jr   z, .jr_001_7D7A
    ld   de, $9300

.jr_001_7D7A
    ldh  a, [hFrameCounter]
    and  $03
    sla  a
    sla  a
    sla  a
    sla  a
    sla  a
    ld   e, a
    add  a, l
    ld   l, a
    ld   a, l
    ld   [$D006], a
    ld   a, h
    ld   [$D007], a
    ld   a, e
    ld   [$D008], a
    ld   a, d
    ld   [$D009], a

jr_001_7D9B::
    ret

func_001_7D9C::
    ld   hl, wScrollXOffsetForSection
    ldh  a, [hFrameCounter]
    and  $07
    jr   nz, .jr_001_7DA6
    inc  [hl]

.jr_001_7DA6
    ld   hl, $C101
    ld   a, [$D004]
    add  a, $50
    ld   [$D004], a
    jr   nc, .jr_001_7DB4
    inc  [hl]

.jr_001_7DB4
    inc  hl
    ld   a, [$D005]
    add  a, $58
    ld   [$D005], a
    jr   nc, .jr_001_7DC0
    inc  [hl]

.jr_001_7DC0
    inc  hl
    ld   a, [$D00D]
    add  a, $B0
    ld   [$D00D], a
    jr   nc, .jr_001_7DCC
    inc  [hl]

.jr_001_7DCC
    jp   func_001_7D46

func_001_7DCF::
    ld   hl, wScrollXOffsetForSection
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, .jr_001_7DD9
    inc  [hl]

.jr_001_7DD9
    ld   hl, $C101
    ld   a, [$D004]
    add  a, $28
    ld   [$D004], a
    jr   nc, .jr_001_7DE7
    inc  [hl]

.jr_001_7DE7
    inc  hl
    ld   a, [$D005]
    add  a, $2C
    ld   [$D005], a
    jr   nc, .jr_001_7DF3
    inc  [hl]

.jr_001_7DF3
    inc  hl
    ld   a, [$D00D]
    add  a, $58
    ld   [$D00D], a
    jr   nc, .jr_001_7DFF
    inc  [hl]

.jr_001_7DFF
    jp   func_001_7D46
