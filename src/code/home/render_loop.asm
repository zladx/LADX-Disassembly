;
; Main render loop.
;

; Game loop:
;  - apply shake effects,
;  - load new map,
;  - render screen transition,
;  - read joypad,
;  - execute gameplay dispatch handler,
;  - update palettes,
;  - render window,
;  - wait for next frame.
RenderLoop::
    ; Set DidRenderFrame
    ld   a, 1
    ldh  [hDidRenderFrame], a

.RenderLoop_setScrollY:
    ; If wAlternateBackgroundEnabled == 1...
    ld   a, [wAlternateBackgroundEnabled]
    and  a
    jr   z, .noSpecialCase
    ; and GameplayType == WORLD...
    ld   a, [wGameplayType]
    cp   GAMEPLAY_WORLD
    jr   nz, .noSpecialCase
    ; ... set scroll Y to $00 or $80 alternatively every other frame.
    ldh  a, [hFrameCounter]
    rrca
    and  $80
    jr   .setScrollY
.noSpecialCase

    ; Default case: add the base offset and the screen shake offset
    ld   hl, wScreenShakeVertical
    ldh  a, [hBaseScrollY]
    add  a, [hl]
.setScrollY
    ld   [rSCY], a

.RenderLoop_setScrollX:
    ; Add the base offset, the screen shake offset and an additionnal offset
    ldh  a, [hBaseScrollX]
    ld   hl, wScreenShakeHorizontal
    add  a, [hl]
    ld   hl, wScrollXOffset
    add  a, [hl]
    ld   [rSCX], a ; scrollX

.RenderLoop_loadNewMap:
    ; If wTileMapToLoad != 0 || wBGMapToLoad != 0,
    ; load new map data and return.
    ld   a, [wTileMapToLoad]
    and  a
    jr   nz, .loadNewMap
    ld   a, [wBGMapToLoad]
    cp   $00
    jr   z, .noNewMap

.loadNewMap
    ; Play audio samples before loading the map when:
    ; - in a menu (GameplayType <= GAMEPLAY_FILE_SAVE)
    ; - on the World in default mode (GAMEPLAY_WORLD_DEFAULT)
    ; - on the beach with Marin (GAMEPLAY_MARIN_BEACH)
    ; All other combinations skip this step.
    ld   a, [wGameplayType]
    cp   GAMEPLAY_MARIN_BEACH
    jr   z, .playAudioStep
    cp   GAMEPLAY_FILE_SAVE
    jr   c, .playAudioStep
    cp   GAMEPLAY_WORLD
    jr   nz, .skipAudio
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_WORLD_DEFAULT
    jr   nc, .skipAudio
.playAudioStep
    call PlayAudioStep
    call PlayAudioStep
.skipAudio

    ; Load new map tiles and background
    di
    call LoadMapData
    ei
    ; Play more audio
    call PlayAudioStep
    call PlayAudioStep
    ; And we're done for this frame.
    jp   WaitForNextFrame
.noNewMap

.RenderLoop_renderFrame:
    ; Apply LCD status flags
    ld   a, [wLCDControl]
    and  $7F
    ld   e, a
    ld   a, [rLCDC]
    and  $80
    or   e
    ld   [rLCDC], a

    ; Increment the global frame counter
    ld   hl, hFrameCounter
    inc  [hl]

    ; Special case for the intro screen sprites.
    ; If GameplayType == INTRO...
    ld   a, [wGameplayType]
    cp   GAMEPLAY_INTRO
    jr   nz, .titleScreenEnd
    ; ... and GameplaySubtype > INTRO_BEACH...
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INTRO_BEACH + 1
    jr   c, .titleScreenEnd
    callsb PositionTitleScreenSprites
.titleScreenEnd

.RenderLoop_TransitionSfx:
    ; If no transition special effect is active, go to the next step.
    ld   a, [wTransitionGfx]
    and  a
    jp   z, RenderInteractiveFrame

    ; There are two types of transition special effects:
    ;  - interactive: new gameplay frames are rendered while the effect is active ;
    ;  - non-interactive: no new frame is rendered while the effect is active.

    ; If TransitionSfx == TRANSITION_GFX_WIND_FISH
    ; use external code for interactive transitions.
    inc  a
    jr   nz, .elsif
.interactiveTransition
    ; Apply the transition effect...
    callsb ApplyWindFishVfx
    ; ... and continue rendering a new frame.
    jp   RenderInteractiveFrame
.elsif
    ; If TransitionSfx == TRANSITION_GFX_FLOATING,
    ; use the interactive transition code too.
    inc  a
    jr   z, .interactiveTransition

    ; Else, render a non-interactive transition effect.
    ; Select bank $14
    ld   a, $14
    ld   [MBC3SelectBank], a

    ; Increment frame count for the transition effect
    ld   a, [wTransitionGfxFrameCount]
    inc  a
    ld   [wTransitionGfxFrameCount], a

    ; If the frame count didn't reached $C0 yet, continue the transition.
    cp   $C0
    jr   nz, .renderTransitionSfx

    ; The transition is finished.
    ; If the transition was MANBO_IN...
    ld   a, [wTransitionGfx]
    cp   TRANSITION_GFX_MANBO_IN
    jr   nz, .finishTransition
    ; ... teleport to Manbo Pond.
    call TeleportToManboPond

.finishTransition
    ; Reset transition state
    xor  a
    ld   [wTransitionGfx], a
    ld   [$C3CA], a
    ; Resume rendering of interactive frames
    jp   RenderInteractiveFrame

.renderTransitionSfx

    ; If TransitionSfxFrameCount >= $60,
    ; start fading the screen to white.
    cp   $60
    jr   c, .transitionFadeOutEnd
   push af                                       ; $4FEB: $F5
    and  $07                                      ; $4FEC: $E6 $07
    jr   nz, .jr_014_4FFB                          ; $4FEE: $20 $0B

    ld   a, [$C3CA]                               ; $4FF0: $FA $CA $C3
    cp   $0C                                      ; $4FF3: $FE $0C
    jr   z, .jr_014_5036                           ; $4FF5: $28 $3F

    inc  a                                        ; $4FF7: $3C
    ld   [$C3CA], a                               ; $4FF8: $EA $CA $C3

.jr_014_4FFB:
    ld   a, [$C3CA]                               ; $4FFB: $FA $CA $C3
    ld   e, a                                     ; $4FFE: $5F
    ldh  a, [hFrameCounter]                       ; $4FFF: $F0 $E7
    and  $03                                      ; $5001: $E6 $03
    add  e                                        ; $5003: $83
    ld   e, a                                     ; $5004: $5F
    ld   d, $00                                   ; $5005: $16 $00
    ld   a, [wTransitionGfx]                      ; $5007: $FA $7F $C1
    cp   $03                                      ; $500A: $FE $03
    jr   z, .jr_014_5023                           ; $500C: $28 $15

    ld   hl, Data_014_4EA8                        ; $500E: $21 $A8 $4E
    add  hl, de                                   ; $5011: $19
    ld   a, [hl]                                  ; $5012: $7E
    ld   [wBGPalette], a                          ; $5013: $EA $97 $DB
    ld   [wOBJ1Palette], a                        ; $5016: $EA $99 $DB
    ld   hl, Data_014_4EB8                        ; $5019: $21 $B8 $4E
    add  hl, de                                   ; $501C: $19
    ld   a, [hl]                                  ; $501D: $7E
    ld   [wOBJ0Palette], a                        ; $501E: $EA $98 $DB
    jr   .jr_014_5036                              ; $5021: $18 $13

.jr_014_5023:
    ld   hl, Data_014_4EC8                        ; $5023: $21 $C8 $4E
    add  hl, de                                   ; $5026: $19
    ld   a, [hl]                                  ; $5027: $7E
    ld   [wBGPalette], a                          ; $5028: $EA $97 $DB
    ld   [wOBJ1Palette], a                        ; $502B: $EA $99 $DB
    ld   hl, Data_014_4ED8                        ; $502E: $21 $D8 $4E
    add  hl, de                                   ; $5031: $19
    ld   a, [hl]                                  ; $5032: $7E
    ld   [wOBJ0Palette], a                        ; $5033: $EA $98 $DB

.jr_014_5036:
    pop  af                                       ; $5036: $F1

.transitionFadeOutEnd

.transitionDone
    ; Render transition effect
    srl  a                                        ; $5038: $CB $3F
    srl  a                                        ; $503A: $CB $3F
    ldh  [hScratch0], a                           ; $503C: $E0 $D7
    ld   a, [wTransitionGfxFrameCount]            ; $503E: $FA $80 $C1
    nop                                           ; $5041: $00
    and  $E0                                      ; $5042: $E6 $E0
    ld   e, a                                     ; $5044: $5F
    ld   a, [wTransitionGfx]                      ; $5045: $FA $7F $C1
    cp   $03                                      ; $5048: $FE $03
    jr   nz, .jr_014_5050                          ; $504A: $20 $04

    ld   a, e                                     ; $504C: $7B
    xor  $E0                                      ; $504D: $EE $E0
    ld   e, a                                     ; $504F: $5F

.jr_014_5050:
    ld   a, e                                     ; $5050: $7B
    ldh  [hScratch1], a                           ; $5051: $E0 $D8
    ld   hl, $C17C                                ; $5053: $21 $7C $C1
    xor  a                                        ; $5056: $AF
    ld   [hl+], a                                 ; $5057: $22
    ld   [hl+], a                                 ; $5058: $22
    ld   [hl+], a                                 ; $5059: $22
.jr_000_02de
    ldh  a, [rSTAT]                               ; $5067: $F0 $41
    and  $03                                      ; $5069: $E6 $03
    jr   nz, .jr_000_02de                       ; $506B: $20 $FA

    ld   d, $00                                   ; $506D: $16 $00

.jr_014_506F:
    ld   a, [$C17E]                               ; $506F: $FA $7E $C1
    inc  a                                        ; $5072: $3C
    ld   [$C17E], a                               ; $5073: $EA $7E $C1
    and  $01                                      ; $5076: $E6 $01
    jr   nz, .jr_014_506F                          ; $5078: $20 $F5

    ld   a, [$C17C]                               ; $507A: $FA $7C $C1
    add  $01                                      ; $507D: $C6 $01
    ld   [$C17C], a                               ; $507F: $EA $7C $C1
    ld   a, [$C17D]                               ; $5082: $FA $7D $C1
    adc  $00                                      ; $5085: $CE $00
    ld   [$C17D], a                               ; $5087: $EA $7D $C1
    ld a, [$c17c]                                 ; $0301: $fa $7c $c1
    cp $58                                        ; $0304: $fe $58
    jp z, $033e                           ; $0306: $ca $3e $03

    ld   c, $00                                   ; $5091: $0E $00
    ld   a, [wTransitionGfx]                      ; $5093: $FA $7F $C1
    cp   $01                                      ; $5096: $FE $01
    jr   z, .jr_014_509B                           ; $5098: $28 $01

    inc  c                                        ; $509A: $0C

.jr_014_509B:
    ld hl, $c17c
    ldh  a, [hScratch0]                           ; $509B: $F0 $D7
    add  [hl]                                     ; $509D: $86
    and  $1F                                      ; $509E: $E6 $1F
    ld   hl, hScratch1                            ; $50A0: $21 $D8 $FF
    or   [hl]                                     ; $50A3: $B6
    ld   e, a                                     ; $50A4: $5F
    ld   hl, Data_014_4EE8                        ; $50A5: $21 $E8 $4E
    add  hl, de                                   ; $50A8: $19
    ld   a, [wTransitionGfxFrameCount]            ; $50A9: $FA $80 $C1
    and  c                                        ; $50AC: $A1
    ld   a, [hl]                                  ; $50AD: $7E
    jr   z, .jr_014_50B2                           ; $50AE: $28 $02

    cpl                                           ; $50B0: $2F
    inc  a                                        ; $50B1: $3C

.jr_014_50B2:
    push af                                       ; $50B2: $F5
    ld   hl, hBaseScrollX                         ; $50B3: $21 $96 $FF
    add  [hl]                                     ; $50B6: $86
    ldh  [rSCX], a                                ; $50B7: $E0 $43
    pop  af                                       ; $50B9: $F1
    ld   hl, hBaseScrollY                         ; $50BA: $21 $97 $FF
    add  [hl]                                     ; $50BD: $86
    ldh  [rSCY], a                                ; $50BE: $E0 $42
    jp   .jr_000_02de                           ; $50C0: $C3 $67 $50

.func_014_50C3::


    ; Play some audio
    call PlayAudioStep
    ; Apply pending palettes
    ld   a, [wBGPalette]
    ld   [rBGP], a
    ld   a, [wOBJ0Palette]
    ld   [rOBP0], a
    ld   a, [wOBJ1Palette]
    ld   [rOBP1], a
    ; This is a non-interactive transition: no new gameplay frame is rendered.
    ; Wait for the next V-Blank.
    jr   $3bd

RenderInteractiveFrame::
    ; Update graphics registers from game values
    ld   a, [wWindowY]
    ld   [rWY], a
    ld   a, [wBGPalette]
    ld   [rBGP], a
    ld   a, [wOBJ0Palette]
    ld   [rOBP0], a
    ld   a, [wOBJ1Palette]
    ld   [rOBP1], a

    call PlayAudioStep
    call ReadJoypadState

    ; If NeedsUpdatingBGTiles or NeedsUpdatingEnnemiesTiles or NeedsUpdatingNPCTiles…
    ldh  a, [hNeedsUpdatingBGTiles]
    ld   hl, hNeedsUpdatingEnnemiesTiles
    or   [hl]
    ld   hl, wNeedsUpdatingNPCTiles
    or   [hl]
    ; skip further rendering: the vblank interrupt will load the required data
    jr   nz, WaitForNextFrame

    ; Debug functions
    ld   a, [ROM_DebugTool1]
    and  a  ; Is debug mode disabled?
    jr   z, ResetSprites

    ld   a, [wEnginePaused]
    and  a  ; Is engine already paused?
    jr   nz, .engineIsPaused

    ldh  a, [hPressedButtonsMask]
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN ; Are none of the directional keys pressed?
    jr   z, .saveEngineStatus

.engineIsPaused
    ldh  a, [hJoypadState]
    and  J_SELECT  ; Was Select button just pressed?
    jr   z, .saveEngineStatus

    ; If Select button was just pressed,
    ; toogle engine paused status.
    ld   a, [wEnginePaused]
    xor  $01
    ld   [wEnginePaused], a

    ; If the engine was just paused, skip the rest of the render loop
    jr   nz, WaitForNextFrame

    ; If the engine was just unpaused,
    ; toggle Free-movement mode.
    ld   a, [wFreeMovementMode]
    xor  $10
    ld   [wFreeMovementMode], a
    jr   WaitForNextFrame

.saveEngineStatus
    ; If the engine is paused, skip the rest of the render loop
    ld   a, [wEnginePaused]
    and  a
    jr   nz, WaitForNextFrame

ResetSprites::
.resetSpritesVisibility
    callsw HideAllSprites

RenderGameplay::
    call ExecuteGameplayHandler

RenderPalettes::
    ; If isGBC…

WaitForNextFrame:
    ld a, $01
    ld [$2100], a
    call $5d03

    ld a, $1f
    ld [$2100], a
    call $7f80
    ld a, $0c
    ld [$2100], a

    ; Reset didRenderFrame flag
    xor  a
    ldh  [hDidRenderFrame], a

    ; Stop the CPU until the next interrupt
    db $76

    ; Loop until hNeedsRenderingFrame != 0
.pollNeedsRenderingFrame
    ldh  a, [hNeedsRenderingFrame]
    and  a
    jr   z, .pollNeedsRenderingFrame

    ; Clear hNeedsRenderingFrame
    xor  a
    ldh  [hNeedsRenderingFrame], a

    ; Jump to the top of the render loop
    jp   RenderLoop
