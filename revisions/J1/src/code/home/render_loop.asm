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
    ld a, $00
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
    push af
    cp   $60
    jr   c, .transitionFadeOutEnd
    ; If GBC...
    ldh  a, [hIsGBC]
    and  a
    jr   z, .renderDMGFadeOut
    ; Render fade-to-white effect for GBC
    callsb ApplyFadeToWhite_GBC
    jr   .transitionDone
.renderDMGFadeOut
    ; Render fade-to-white effect for DMG
    call ApplyFadeToWhite_DMG
.transitionFadeOutEnd

.transitionDone
    ; Render transition effect
    ld   a, BANK(RenderTransitionEffect)
    ld   [MBC3SelectBank], a
    pop  af
    call RenderTransitionEffect

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
    jp   WaitForNextFrame

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
    ; If not in Inventory, initially hide all sprites
    ld   a, [wGameplayType]
    cp   GAMEPLAY_INVENTORY
    jr   nz, .resetSpritesVisibility

    ; If Inventory is actually visible, leave sprites visible
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_INVENTORY_DELAY1
    jr   c, RenderGameplay

.resetSpritesVisibility
    callsw HideAllSprites

RenderGameplay::
    call ExecuteGameplayHandler

RenderPalettes::
    ; If isGBC…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .clearPaletteToLoad
    ; load pending tilemap palette.
    callsw LoadPaletteForTilemap

.clearPaletteToLoad
    ; Clear the palette to be loaded anyway
    xor  a
    ld   [wPaletteToLoadForTileMap], a

RenderWindow::
    callsw UpdateWindowPosition

WaitForNextFrame::
    ; Animate inventory window
    callsw func_01F_7F80

    ; Switch to first graphics bank ($0C on DMG, $2C on GBC)
    ld   a, $0C
    call AdjustBankNumberForGBC
    call SwitchBank

    ; Reset didRenderFrame flag
    xor  a
    ldh  [hDidRenderFrame], a

    ; Stop the CPU until the next interrupt
    halt

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
