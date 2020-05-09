;
; Opening sequence and Title screen
;

IntroSeaPaletteTable::
    db $C6, $C2, $C0, $C2

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
    ld   a, [label_789B]
    ld   [wOBJ0Palette], a
    ld   a, [label_789F]
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
    ld   a, $0D
    ld   [wActiveMusicTrack], a
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

    ; Check $D000 counter value
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
    call label_27F2
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
    jr   .gbcEnd
.notGBC
    ld   a, $0E
.gbcEnd

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

Data_6F93::
    add  a, c
    ld   b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Data_6F9C::
    ld   [$808], sp
    inc  b
    nop
    nop
    nop
    nop
    nop

IntroShipOnSeaHandler::
    call RenderRain
    call RenderIntroEntities
    ld   a, [wIntroSubTimer]
    and  a
    jr   z, jr_001_7014

    inc  a
    ld   [wIntroSubTimer], a ; Increment subtimer
    cp   $18
    jr   c, .jp_7013
    sub  a, $18
    rra
    rra
    rra
    and  $0F
    ld   e, a
    ld   d, $00
    ld   hl, Data_6F93
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    ld   hl, Data_6F9C
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    call func_020_6A30_trampoline
    ld   a, e
    cp   $08
    jp   nz, .jp_7013
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

.jp_7013
    ret

jr_001_7014::
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
    jp   nz, label_001_70B1
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
    jr   z, jr_001_7068
    inc  c
    cp   $30
    jr   z, jr_001_7068
    inc  c
    cp   $38
    jr   z, jr_001_7068
    inc  c
    cp   $58
    jr   z, jr_001_7068
    inc  c
    cp   $5A
    jr   z, jr_001_7068
    inc  c
    cp   $69
    jr   nz, label_001_70B1

jr_001_7068::
    ld   e, $01
    ld   d, $00

jr_001_706C::
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, label_7087
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, jr_001_706C
    ret

label_707B::
    db $28, $78, $60, $38, $68
    db $58 ; X

label_7081::
    db 4, 2, 1, 4, 3, 1

label_7087::
    ld   b, 0
    ld   hl, label_7081
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   [hl], a
    ld   hl, label_707B
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], $30
    ld   hl, $C2E0
    add  hl, de
    ld   [hl], $20

func_001_70A9::
    ld   a, $1C
    ld   [$D000], a
    call PlayBombExplosionSfx

label_001_70B1::
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
    call func_001_70A9

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
    call func_001_70A9

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

label_7128::
    db 0, 0, 0, 0, $40, $40, $40, $80, $85, $85, $85, $C5, $C9, $C9, $C9, $C9

label_7138::
    db 0, 0, 0, 0, 4, 4, 4, 4, $18, $18, $18, $18, $1C, $1C, $1C, $1C

label_7148::
    db 0, 0, 0, 0, $40, $40, $40, $40, $90, $90, $90, $90

label_7154::
    ldh  [hScratch9], a
    ldh  [hScratch9], a

IntroStage6Handler::
    call func_001_71C7
    ld   a, [$D001]
    cp   $A0
    jr   nz, jr_001_7168
    push af
    ld   a, $02
    ld   [rLYC], a
    pop  af

jr_001_7168::
    dec  a
    ld   [$D001], a
    jr   nz, jr_001_7188
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

jr_001_7188::
    cp   $34
    jr   nc, jr_001_71C2
    and  $03
    jr   nz, jr_001_719B
    ld   a, [$D010]
    cp   $0C
    jr   z, jr_001_719B
    inc  a
    ld   [$D010], a

jr_001_719B::
    ldh  a, [hFrameCounter]
    and  $03
    ld   e, a
    ld   a, [$D010]
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, label_7128
    add  hl, de
    ld   a, [hl]
    ld   [wBGPalette], a
    ld   hl, label_7138
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    ld   hl, label_7148
    add  hl, de
    ld   a, [hl]
    ld   [wOBJ1Palette], a
    call func_020_6AC1_trampoline

jr_001_71C2::
    ret

IntroBeachHandler::
    call RenderIntroEntities
    ret

func_001_71C7::
    ld   a, [$C291]
    cp   $02
    jr   nc, jr_001_71DE
    ld   a, [$C114]
    inc  a
    cp   $A0
    jr   nz, jr_001_71DB
    ld   a, NOISE_SFX_SEA_WAVES
    ldh  [hNoiseSfx], a
    xor  a

jr_001_71DB::
    ld   [$C114], a

jr_001_71DE::
    ret

label_71DF::
    db $9A, $16, $F, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C
    db $8D, $8E, $8F, $9A, $36, $F, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99
    db $9A, $9B, $9C, $9D, $9E, $9F, $9A, $56, $F, $A0, $A1, $A2, $A3, $A4, $A5, $A6
    db $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF, $9A, $76, $F, $B0, $B1, $B2, $B3
    db $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, $9A, $96, $F, $C0
    db $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, $9A
    db $B6, $F, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD
    db $DE, $DF, $9A, $D6, $F, $E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA
    db $EB, $EC, $ED, $EE, $EF

label_7264::
    db $18, $72

label_7266::
    db 5, $72, $2B, $72, $F2, $71, $3E, $72, $DF, $71, $51

label_001_7271::
    ld   [hl], d

IntroStage8Handler::
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_7264
    add  hl, de
    ld   a, [hli]
    ld   d, [hl]
    ld   e, a
    ld   hl, $D601
    ld   c, $13

jr_001_7286::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, jr_001_7286
    ld   [hl], $00
    ldh  a, [hIsGBC]
    and  a
    jr   z, jr_001_7296
    call func_001_7338

jr_001_7296::
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    cp   $07
    jr   nz, jr_001_72A4
    call IncrementGameplaySubtype

jr_001_72A4::
    ret
    sbc  a, d
    ld   d, $0F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    ld   [hl], $0F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    ld   d, [hl]
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_001_72D8::
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    db $76, $0f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    sub  a, [hl]
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    or   [hl]
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc  a, d
    sub  a, $0F
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

label_732A::
    sbc  a, $72
    bit  6, d
    pop  af
    ld   [hl], d
    cp   b
    ld   [hl], d
    inc  b
    ld   [hl], e
    and  l
    ld   [hl], d
    rla
    ld   [hl], e

func_001_7338::
    ld   a, [$D002]
    sla  a
    ld   e, a
    ld   d, $00
    ld   hl, label_732A
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

label_7364::
    sbc  a, e
    or   a
    dec  c
    ld   h, l
    ld   h, [hl]
    ld   h, a
    ld   l, b
    ld   l, c
    ld   l, d
    ld   l, e
    ld   l, h
    ld   l, l
    ld   l, [hl]
    ld   l, a
    ld   [hl], b
    ld   [hl], c
    ld   [hl], d
    nop

IntroStageAHandler::
    ld   de, label_7364
    ld   hl, $D601
    ld   c, $12

jr_001_737E::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, jr_001_737E
    ldh  a, [hIsGBC]
    and  a
    jr   nz, jr_001_738E
    call func_001_79AE
    jr   jr_001_7395

jr_001_738E::
    xor  a
    call func_001_79C2
    call func_001_73B1

jr_001_7395::
    ld   a, $3C
    ld   [$D015], a
    call IncrementGameplaySubtype

ResetIntroTimers::
    ld   a, $A0
    ld   [wIntroTimer], a
    xor  a
    ld   [wIntroSubTimer], a
    ld   a, $FF
    ld   [$D003], a
    ret

label_73AC::
    sbc  a, e
    or   a
    ld   c, l
    rlca
    nop

func_001_73B1::
    ld   de, label_73AC
    ld   hl, $DC91
    ld   c, $12

jr_001_73B9::
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, jr_001_73B9
    ret

label_73C0::
    db $18, $18, $38, $40, $58, $60, $80, $88

label_73C8::
    db $20, $48, $44, $28, $44, $28, $28, $40

TitleScreenHandler::
    call RenderIntroEntities
    call func_001_7920
    ldh  a, [hFrameCounter]
    and  $3F
    jr   nz, jr_001_7418
    ld   e, $01
    ld   d, $00

jr_001_73E0::
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, jr_001_73F0
    dec  e
    ld   a, e
    cp   $FF
    jr   nz, jr_001_73E0
    jr   jr_001_7418

jr_001_73F0::
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

jr_001_7404::
    ld   hl, label_73C0
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ld   hl, label_73C8

jr_001_7411::
    add  hl, bc

jr_001_7412::
    ld   a, [hl]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a

jr_001_7418::
    ld   a, [$D002]
    inc  a
    ld   [$D002], a
    and  $0F
    jr   nz, jr_001_7439
    ld   a, [$D001]
    dec  a
    ld   [$D001], a
    jr   nz, jr_001_7439
    call IncrementGameplaySubtype
    xor  a
    ld   [$C16B], a
    ld   [$C16C], a
    call label_27EA

jr_001_7439::
    ret

IntroStageCHandler::
    call func_1A22
    ld   a, [$C16B]
    cp   $04
    jr   nz, jr_001_7447
    jp   func_001_6162

jr_001_7447::
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

label_74B8::
    db $99, $2B, $83, $1E, $20, $22, $24, $99, $2C, $83, $1F, $21, $23, $25, 0

IntroLinkScream::
    ld   de, $D601
    ld   hl, label_74B8
    ld   c, $0F

jr_001_74CF::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  c
    jr   nz, jr_001_74CF
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

data_7538::
    db 0, 0

label_753A::
    db $1C, 2, 0, 8, $1E, 2, $10, $F8, $20, 2, $10, 0

label_7546::
    db $22, 2, $10, 8, $24, 2, $10, $10, $26, 2

data_7550::
    db $F8, 4, $32, 1, $E8, 4, $32, 1, $D8, 4, $32, 1, $C8, 4, $32, 1

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
    ld   hl, data_7538
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
    ld   hl, data_7550
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

label_75CB::
    db 0, 0, $34, 1, 0, 8

jr_001_75D1::
    db $36, 1, $10, 0, $2C, 1, $20, $F8, $2C, 1, $28, 0, $2E, $21, $30, $F0
    db $2E, 1, 8, 0, $36, $21, 8, 8, $34, $21, $18, 0, $30, 1, $18, 8
    db $2C, $21, $28, $10, $2E, $21, $28, $10

jr_001_75F9::
    db $2E, $21, 0, 8, $34, $21, 0, 0, $36, $21, $10, 8, $2C, $21, $20, $10
    db $2C

label_7609::
    db $21, $28, 8, $2E, 1, $30, $18, $2E, $21, 8, 8, $36, 1, 8, 0, $34
    db 1, $18, 8, $30, $21, $18, 0

jr_001_7621::
    inc  l
    ld   bc, $F828
    ld   l, $01
    jr   z, jr_001_7621

jr_001_7629::
    ld   l, $01

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
    ld   hl, label_75CB

jr_001_7640::
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

label_77BD::
    jr   c, jr_001_77BF

jr_001_77BF::
    db $38, $20, $3a, $00, $3a, $20, $3a, $00
    db $3a, $20, $3c, $00, $3e, $00, $3c, $00
    db $3e, $00, $3a, $00, $3a, $20, $3a, $00
    db $3a, $20, $38, $00, $38, $20

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
    ld   de, label_77BD
    call RenderActiveEntitySpritesPair
    ld   a, [wOAMNextAvailableSlot]
    add  a, $08
    ld   [wOAMNextAvailableSlot], a
    ret

label_7808::
    db   $10, $18, $2e, $05, $00, $18, $2c, $05

jr_001_7810::
    db   $10, $10

jr_001_7812::
    db $2A, 5, 0, $10, $28, 5, $10, 8, $26, 5, 0, 8, $24, 5, $10, 0
    db $22, 5, 0, 0, $20, 5

label_7828::
    db 0, $28, $52, $16, 0

jr_001_782D::
    db $20, $50, $16, $10, $18, $4E, $16, 0, $18, $4C, $16, $10, $10, $4A

jr_001_783B::
    db $16, 0, $10, $48, $16, $10, 8, $46, $16, 0, 8, $44, $16, $10, 0, $42
    db $16, 0, 0, $40, $16

label_7850::
    db $10, $18, $2E, 5, 0, $18, $2C, 5, $10, $10, $2A, 5, 0, $10, $28, 5
    db $10, 8, $26, 5, 0, 8, $24, 5, $10, 0, $22, 5, 0, 0, $20, 5

label_7870::
    db 0, $28, $52, $16, 0

jr_001_7875::
    db $20, $50, $16, $10, $18, $4E, $16, 0

jr_001_787D::
    db $18, $4C

jr_001_787F::
    db $16, $10

jr_001_7881::
    db   $10, $4A ; Undefined instruction

jr_001_7883::
    db $16, 0, $10, $48, $16, $10, 8, $46, $16, 0, 8, $44, $16, $10, 0, $42
    db $16, 0, 0, $40, $16

label_7898::
    db $54, $58, $68

label_789B::
    db $1C

label_789C::
    db 0, 4

label_789E::
    db $18

label_789F::
    db $6C ; l

label_78A0::
    db $f5, $7a, $8d, $7d, $8d, $7d, $8d, $7d
    db $f5, $7a, $ff, $7f, $ff, $7f, $ff, $7f
    db $f5, $7a, $6c, $6d, $8d, $71, $cf, $75
    db $f5, $7a, $7b, $6f, $bd, $73, $ff, $77
    db $f5, $7a, $2a, $5d, $8e

jr_001_78C5::
    ld   h, l
    ld   [de], a

jr_001_78C7::
    ld   l, [hl]
    push af

jr_001_78C9::
    ld   a, d
    rst  $30

jr_001_78CB::
    db $5E, $5B, $67, $DF, $6F, $F5, $7A, $E8, $48, $8E, $59, $54, $66, $F5, $7A, $52
    db $4A, $19, $5B, $BF, $67, $F5, $7A, $C6, $38, $8F, $49, $97, $5A, $F5, $7A, $CE
    db $39, $B7, $4A, $BF, $5B, $F5, $7A, $84, $24, $8F, $3D, $D9, $52, $F5, $7A, $29
    db $25, $75, $3E, $9F, $53, $F5, $7A, $42, $14, $90, $31, $1C, $4B, $F5, $7A, $A5
    db $14

jr_001_790C::
    db $13, $32, $7F, $4B, $F5, $7A, 0, 0, $B1, $21, $5F, $3F, $F5, $7A, 0, 0
    db $B1, $21, $5F, $3F

func_001_7920::
    ld   hl, $D015
    ld   a, [hl]
    and  a
    jr   z, jr_001_7929
    dec  [hl]
    ret

jr_001_7929::
    ld   a, $78
    ldh  [hActiveEntityPosX], a
    ld   hl, $D018
    ld   a, $59
    add  a, [hl]
    ldh  [hActiveEntityVisualPosY], a
    ldh  a, [hIsGBC]
    and  a
    jr   nz, jr_001_795D
    ld   a, [$D013]
    cp   $04
    jr   z, jr_001_797D
    ld   hl, $D014
    inc  [hl]
    ld   a, [hl]
    cp   $0C
    jp   nz, label_001_7997
    xor  a
    ld   [hl], a
    ld   hl, $D013
    inc  [hl]
    ld   a, [hl]
    cp   $04
    jp   z, label_001_7997
    call func_001_79AE
    jp   label_001_7997

jr_001_795D::
    ld   a, [$D013]
    cp   $08
    jr   z, jr_001_797D
    ld   hl, $D014
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   nz, jr_001_797D
    xor  a
    ld   [hl], a
    ld   hl, $D013
    inc  [hl]
    ld   a, [hl]
    cp   $08
    jr   z, jr_001_797D
    call func_001_79C2
    jr   jr_001_797D

jr_001_797D::
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_001_7997
    ld   a, [$D013]
    cp   $08
    jr   z, jr_001_7990
    ld   hl, label_7850
    ld   c, $12
    jr   jr_001_79AA

jr_001_7990::
    ld   hl, label_7870
    ld   c, $0A
    jr   jr_001_79AA

label_001_7997::
    ld   a, [$D013]
    cp   $03
    jr   nc, jr_001_79A5
    ld   hl, label_7808
    ld   c, $12
    jr   jr_001_79AA

jr_001_79A5::
    ld   hl, label_7828
    ld   c, $0A

jr_001_79AA::
    call RenderActiveEntitySpritesRect
    ret

func_001_79AE::
    ld   b, $00
    ld   c, a
    ld   hl, label_7898
    add  hl, bc
    ld   a, [hl]
    ld   [wOBJ0Palette], a
    ld   hl, label_789C
    add  hl, bc
    ld   a, [hl]
    ld   [wOBJ1Palette], a
    ret

func_001_79C2::
    sla  a
    sla  a
    sla  a
    sla  a
    ld   b, $00
    ld   c, a
    ld   hl, label_78A0
    add  hl, bc
    ld   bc, $DC78
    ld   e, $10

jr_001_79D6::
    ld   a, [hli]
    ld   [bc], a
    inc  bc
    dec  e
    jr   nz, jr_001_79D6
    ld   a, $14
    ld   [$DDD3], a
    ld   a, $08
    ld   [$DDD4], a
    ld   a, $82
    ld   [$DDD1], a
    ret

label_79EC::
    sbc  a, b
    nop
    ld   b, e
    ld   a, l
    sbc  a, b
    jr   nz, jr_001_7A36
    ld   a, l
    sbc  a, b
    ld   b, b
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   h, b
    ld   b, e
    ld   a, l
    nop

label_79FD::
    sbc  a, b
    inc  b
    inc  bc
    ld   a, l
    ld   a, l
    ld   c, h
    ld   c, l
    sbc  a, b
    inc  h
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   b, h
    ld   b, e
    ld   a, l
    sbc  a, b
    ld   h, h
    ld   b, e
    ld   a, l
    nop

func_001_7A11::
    ld   hl, label_79FD
    jr   jr_001_7A19

func_001_7A16::
    ld   hl, label_79EC

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

data_7A27::
    stop
    ld   [de], a
    nop
    inc  d
    nop
    ld   d, $00

RenderIntroInertLink::
    ldh  a, [hActiveEntityPosX]
    cp   $F0
    jr   nc, jr_001_7A47
    xor  a

jr_001_7A36::
    ld   [wEntitiesPhysicsFlagsTable], a
    ld   de, data_7A27
    call RenderActiveEntitySpritesPair
    ld   a, [wOAMNextAvailableSlot]
    add  a, $08
    ld   [wOAMNextAvailableSlot], a

jr_001_7A47::
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
    ld   a, $01
    ld   [wActiveMusicTrack], a

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

label_7AE4::
    db $7c, $7c, $44, $45, $7d, $7d, $7d, $7d
    db $7d, $7d, $7d, $7d, $7d, $7d, $7d, $7d
    db $4c, $4d, $7c, $7c, $7c, $7c, $7c, $7c
    db $44, $45, $7d, $2d, $2e, $2d, $2e, $2d
    db $2e, $7d, $4c, $4d, $7c, $7c, $7c, $7c
    db $7c, $7c, $7c, $7c, $7c, $77, $46, $7e
    db $7e, $7e, $7e, $7e, $7e, $4b, $79, $7c
    db $7c, $7c, $7c, $7c, $7c, $7c, $7c, $77
    db $75, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $75, $78, $7c, $7c, $7c
    db $7c, $7c, $77, $7a, $7a, $74, $73, $74
    db $5c, $5d, $5e, $5f, $73, $74, $73, $7a
    db $7e, $78, $7c, $7c, $7c, $7c, $73, $75
    db $78, $77, $78, $79, $58, $59, $5a, $5b
    db $79, $79, $77, $75, $7e, $74, $7c, $7c
    db $7c, $7c, $7c, $73, $74, $76, $73, $7a
    db $54, $55, $56, $57, $7a, $74, $76, $73
    db $74, $7c, $7c, $7c, $77, $78, $7c, $79
    db $7c, $7c, $7c, $7c, $50, $51, $52, $53
    db $7c, $7c, $7c, $7c, $7c, $7c, $77, $78
    db $7e, $7e, $75, $7e, $78, $77, $75, $78
    db $79, $2b, $2c, $79, $79, $77, $75, $78
    db $77, $75, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e, $7e, $7e, $7e, $7e
    db $7e, $7e, $7e, $7e

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
    ld   hl, label_7AE4
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
    call func_7CCB

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

func_7CCB::
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

label_7CE1::
    db 0, $50, $80, $50, 0, $51, $80, $51

label_7CE9::
    db 0, $52, $80, $52, 0, $53, $80, $53

label_7CF1::
    db 0, 2, 4, 6, 6, 4, 2, 0

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
    jr   nz, jr_001_7D0B
    inc  [hl]

jr_001_7D0B::
    inc  hl
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, jr_001_7D13
    inc  [hl]

jr_001_7D13::
    inc  hl
    ldh  a, [hFrameCounter]
    and  $1F
    jr   nz, jr_001_7D1B
    inc  [hl]

jr_001_7D1B::
    inc  hl
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, jr_001_7D23
    inc  [hl]

jr_001_7D23::
    inc  hl
    ld   a, [$D004]
    add  a, $28
    ld   [$D004], a
    jr   nc, jr_001_7D2F
    inc  [hl]

jr_001_7D2F::
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
    ld   hl, label_7CF1
    add  hl, de
    ld   e, [hl]
    ld   hl, label_7CE1
    ld   a, [$D00F]
    and  a
    jr   z, jr_001_7D6A
    ld   hl, label_7CE9

jr_001_7D6A::
    add  hl, de
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    ld   de, $8900
    ld   a, [$D00F]
    and  a
    jr   z, jr_001_7D7A
    ld   de, $9300

jr_001_7D7A::
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
    jr   nz, jr_001_7DA6
    inc  [hl]

jr_001_7DA6::
    ld   hl, $C101
    ld   a, [$D004]
    add  a, $50
    ld   [$D004], a
    jr   nc, jr_001_7DB4
    inc  [hl]

jr_001_7DB4::
    inc  hl
    ld   a, [$D005]
    add  a, $58
    ld   [$D005], a
    jr   nc, jr_001_7DC0
    inc  [hl]

jr_001_7DC0::
    inc  hl
    ld   a, [$D00D]
    add  a, $B0
    ld   [$D00D], a
    jr   nc, jr_001_7DCC
    inc  [hl]

jr_001_7DCC::
    jp   func_001_7D46

func_001_7DCF::
    ld   hl, wScrollXOffsetForSection
    ldh  a, [hFrameCounter]
    and  $0F
    jr   nz, jr_001_7DD9
    inc  [hl]

jr_001_7DD9::
    ld   hl, $C101
    ld   a, [$D004]
    add  a, $28
    ld   [$D004], a
    jr   nc, jr_001_7DE7
    inc  [hl]

jr_001_7DE7::
    inc  hl
    ld   a, [$D005]
    add  a, $2C
    ld   [$D005], a
    jr   nc, jr_001_7DF3
    inc  [hl]

jr_001_7DF3::
    inc  hl
    ld   a, [$D00D]
    add  a, $58
    ld   [$D00D], a
    jr   nc, jr_001_7DFF
    inc  [hl]

jr_001_7DFF::
    jp   func_001_7D46
