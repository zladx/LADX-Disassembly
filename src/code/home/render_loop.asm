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
    ; Mark rendering of a new frame as being started
    ld   a, TRUE                                  ; $01DA: $3E $01
    ldh  [hIsRenderingFrame], a                   ; $01DC: $E0 $FD

    ;
    ; Set scroll Y
    ;

    ; If wAlternateBackgroundEnabled == 1...
    ld   a, [wAlternateBackgroundEnabled]         ; $01DE: $FA $00 $C5
    and  a                                        ; $01E1: $A7
    jr   z, .noSpecialCase                        ; $01E2: $28 $0E
    ; and GameplayType == WORLD...
    ld   a, [wGameplayType]                       ; $01E4: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $01E7: $FE $0B
    jr   nz, .noSpecialCase                       ; $01E9: $20 $07

IF __PATCH_0__
    ld   a, $00
ELSE
    ; ... set scroll Y to $00 or $80 alternatively every other frame.
    ldh  a, [hFrameCounter]                       ; $01EB: $F0 $E7
    rrca                                          ; $01ED: $0F
    and  $80                                      ; $01EE: $E6 $80
ENDC
    jr   .setScrollY                              ; $01F0: $18 $06
.noSpecialCase

    ; Default case: add the base offset and the screen shake offset
    ld   hl, wScreenShakeVertical                 ; $01F2: $21 $56 $C1
    ldh  a, [hBaseScrollY]                        ; $01F5: $F0 $97
    add  a, [hl]                                  ; $01F7: $86
.setScrollY
    ld   [rSCY], a                                ; $01F8: $E0 $42

    ;
    ; Set scroll X
    ;

    ; Add the base offset, the screen shake offset and an additionnal offset
    ldh  a, [hBaseScrollX]                        ; $01FA: $F0 $96
    ld   hl, wScreenShakeHorizontal               ; $01FC: $21 $55 $C1
    add  a, [hl]                                  ; $01FF: $86
    ld   hl, wScrollXOffset                       ; $0200: $21 $BF $C1
    add  a, [hl]                                  ; $0203: $86
    ld   [rSCX], a ; scrollX                      ; $0204: $E0 $43

    ;
    ; Load requested GFX (if needed)
    ;

    ; If wTilesetToLoad != 0 || wBGMapToLoad != 0,
    ; load new graphics data and return.
    ld   a, [wTilesetToLoad]                      ; $0206: $FA $FE $D6
    and  a                                        ; $0209: $A7
    jr   nz, .loadRequestedGfx                    ; $020A: $20 $07
    ld   a, [wBGMapToLoad]                        ; $020C: $FA $FF $D6
    cp   TILEMAP_NONE                             ; $020F: $FE $00
    jr   z, .noGfxToLoad                          ; $0211: $28 $2A

.loadRequestedGfx
    ; Play audio samples before loading the map when:
    ; - in a menu (GameplayType <= GAMEPLAY_FILE_SAVE)
    ; - on the World (GAMEPLAY_WORLD_INTERACTIVE)
    ; - on the beach with Marin (GAMEPLAY_MARIN_BEACH)
    ; All other combinations skip this step.
    ld   a, [wGameplayType]                       ; $0213: $FA $95 $DB
    cp   GAMEPLAY_MARIN_BEACH                     ; $0216: $FE $09
    jr   z, .playAudioStep                        ; $0218: $28 $0F
    cp   GAMEPLAY_FILE_SAVE                       ; $021A: $FE $06
    jr   c, .playAudioStep                        ; $021C: $38 $0B
    cp   GAMEPLAY_WORLD                           ; $021E: $FE $0B
    jr   nz, .skipAudio                           ; $0220: $20 $0D
    ld   a, [wGameplaySubtype]                    ; $0222: $FA $96 $DB
    cp   GAMEPLAY_WORLD_INTERACTIVE               ; $0225: $FE $07
    jr   nc, .skipAudio                           ; $0227: $30 $06
.playAudioStep
    call PlayAudioStep                            ; $0229: $CD $A4 $08
    call PlayAudioStep                            ; $022C: $CD $A4 $08
.skipAudio

    ; Load the requested tileset or BG map
    di                                            ; $022F: $F3
    call LoadRequestedGfx                         ; $0230: $CD $19 $04
    ei                                            ; $0233: $FB
    ; Play more audio
    call PlayAudioStep                            ; $0234: $CD $A4 $08
    call PlayAudioStep                            ; $0237: $CD $A4 $08
    ; And we're done for this frame.
    jp   .waitForNextFrame                        ; $023A: $C3 $5F $03

.noGfxToLoad

    ;
    ; Start rendering the next frame
    ;

    ; Apply LCD status flags
    ld   a, [wLCDControl]                         ; $023D: $FA $FD $D6
    and  ~LCDCF_ON                                ; $0240: $E6 $7F
    ld   e, a                                     ; $0242: $5F
    ld   a, [rLCDC]                               ; $0243: $F0 $40
    and  LCDCF_ON                                 ; $0245: $E6 $80
    or   e                                        ; $0247: $B3
    ld   [rLCDC], a                               ; $0248: $E0 $40

    ; Increment the global frame counter
    ld   hl, hFrameCounter                        ; $024A: $21 $E7 $FF
    inc  [hl]                                     ; $024D: $34

    ; Special case for the intro screen sprites.
    ; If GameplayType == INTRO...
    ld   a, [wGameplayType]                       ; $024E: $FA $95 $DB
    cp   GAMEPLAY_INTRO                           ; $0251: $FE $00
    jr   nz, .titleScreenEnd                      ; $0253: $20 $0F
    ; ... and GameplaySubtype > INTRO_BEACH...
    ld   a, [wGameplaySubtype]                    ; $0255: $FA $96 $DB
    cp   GAMEPLAY_INTRO_BEACH + 1                 ; $0258: $FE $08
    jr   c, .titleScreenEnd                       ; $025A: $38 $08
    callsb PositionTitleScreenSprites             ; $025C: $3E $20 $EA $00 $21 $CD $57 $52
.titleScreenEnd

    ;
    ; Apply transition special effects
    ;

    ; If no transition special effect is active, go to the next step.
    ld   a, [wTransitionGfx]                      ; $0264: $FA $7F $C1
    and  a                                        ; $0267: $A7
    jp   z, .renderInteractiveFrame               ; $0268: $CA $D5 $02

    ; There are two types of transition special effects:
    ;  - interactive: new gameplay frames are rendered while the effect is active ;
    ;  - non-interactive: no new frame is rendered while the effect is active.

    ; If TransitionSfx == TRANSITION_GFX_WIND_FISH
    ; use external code for interactive transitions.
    inc  a                                        ; $026B: $3C
    jr   nz, .elsif                               ; $026C: $20 $0B
.interactiveTransition
    ; Apply the transition effect...
    callsb ApplyWindFishVfx                       ; $026E: $3E $17 $EA $00 $21 $CD $DD $48
    ; ... and continue rendering a new frame.
    jp   .renderInteractiveFrame                  ; $0276: $C3 $D5 $02
.elsif
    ; If TransitionSfx == TRANSITION_GFX_FLOATING,
    ; use the interactive transition code too.
    inc  a                                        ; $0279: $3C
    jr   z, .interactiveTransition                ; $027A: $28 $F2

    ; Else, render a non-interactive transition effect.

    ld   a, BANK(ApplyFadeToWhite_DMG)            ; $027C: $3E $14
    ld   [rSelectROMBank], a                      ; $027E: $EA $00 $21

    ; Increment frame count for the transition effect
    ld   a, [wTransitionGfxFrameCount]            ; $0281: $FA $80 $C1
    inc  a                                        ; $0284: $3C
    ld   [wTransitionGfxFrameCount], a            ; $0285: $EA $80 $C1

    ; If the frame count didn't reached $C0 yet, continue the transition.
    cp   $C0                                      ; $0288: $FE $C0
    jr   nz, .renderTransitionSfx                 ; $028A: $20 $14

    ; The transition is finished.
    ; If the transition was MANBO_IN...
    ld   a, [wTransitionGfx]                      ; $028C: $FA $7F $C1
    cp   TRANSITION_GFX_MANBO_IN                  ; $028F: $FE $02
    jr   nz, .finishTransition                    ; $0291: $20 $03
    ; ... teleport to Manbo Pond.
    call TeleportToManboPond                      ; $0293: $CD $51 $4E

.finishTransition
    ; Reset transition state
    xor  a                                        ; $0296: $AF
    ld   [wTransitionGfx], a                      ; $0297: $EA $7F $C1
    ld   [wC3CA], a                               ; $029A: $EA $CA $C3
    ; Resume rendering of an interactive frame
    jp   .renderInteractiveFrame                  ; $029D: $C3 $D5 $02

.renderTransitionSfx

    ; If TransitionSfxFrameCount >= $60,
    ; start fading the screen to white.
    push af                                       ; $02A0: $F5
    cp   $60                                      ; $02A1: $FE $60
    jr   c, .transitionFadeOutEnd                 ; $02A3: $38 $12
    ; If GBC...
    ldh  a, [hIsGBC]                              ; $02A5: $F0 $FE
    and  a                                        ; $02A7: $A7
    jr   z, .renderDMGFadeOut                     ; $02A8: $28 $0A
    ; Render fade-to-white effect for GBC
    callsb ApplyFadeToWhite_GBC                   ; $02AA: $3E $20 $EA $00 $21 $CD $A7 $6C
    jr   .transitionDone                          ; $02B2: $18 $03
.renderDMGFadeOut
    ; Render fade-to-white effect for DMG
    call ApplyFadeToWhite_DMG                     ; $02B4: $CD $E8 $4F
.transitionFadeOutEnd

.transitionDone
    ; Render transition effect
    ld   a, BANK(RenderTransitionEffect)          ; $02B7: $3E $14
    ld   [rSelectROMBank], a                      ; $02B9: $EA $00 $21
    pop  af                                       ; $02BC: $F1
    call RenderTransitionEffect                   ; $02BD: $CD $38 $50

    ; Play some audio
    call PlayAudioStep                            ; $02C0: $CD $A4 $08
    ; Apply pending palettes
    ld   a, [wBGPalette]                          ; $02C3: $FA $97 $DB
    ld   [rBGP], a                                ; $02C6: $E0 $47
    ld   a, [wOBJ0Palette]                        ; $02C8: $FA $98 $DB
    ld   [rOBP0], a                               ; $02CB: $E0 $48
    ld   a, [wOBJ1Palette]                        ; $02CD: $FA $99 $DB
    ld   [rOBP1], a                               ; $02D0: $E0 $49
    ; This is a non-interactive transition: no new gameplay frame is rendered.
    ; Wait for the next V-Blank.
    jp   .waitForNextFrame                        ; $02D2: $C3 $5F $03

    ;
    ; Render an interactive frame
    ;
.renderInteractiveFrame

    ; Update graphics registers from game values
    ld   a, [wWindowY]                            ; $02D5: $FA $9A $DB
    ld   [rWY], a                                 ; $02D8: $E0 $4A
    ld   a, [wBGPalette]                          ; $02DA: $FA $97 $DB
    ld   [rBGP], a                                ; $02DD: $E0 $47
    ld   a, [wOBJ0Palette]                        ; $02DF: $FA $98 $DB
    ld   [rOBP0], a                               ; $02E2: $E0 $48
    ld   a, [wOBJ1Palette]                        ; $02E4: $FA $99 $DB
    ld   [rOBP1], a                               ; $02E7: $E0 $49

    call PlayAudioStep                            ; $02E9: $CD $A4 $08
    call ReadJoypadState                          ; $02EC: $CD $1E $28

    ; If NeedsUpdatingBGTiles || NeedsUpdatingEnnemiesTiles || NeedsUpdatingNPCTiles…
    ldh  a, [hNeedsUpdatingBGTiles]               ; $02EF: $F0 $90
    ld   hl, hNeedsUpdatingEntityTilesA           ; $02F1: $21 $91 $FF
    or   [hl]                                     ; $02F4: $B6
    ld   hl, wNeedsUpdatingEntityTilesB           ; $02F5: $21 $0E $C1
    or   [hl]                                     ; $02F8: $B6
    ; skip further rendering: the vblank interrupt will load the required data
    jr   nz, .waitForNextFrame                    ; $02F9: $20 $64

    ;
    ; Debug functions
    ;

    ld   a, [ROM_DebugTool1]                      ; $02FB: $FA $03 $00
    and  a  ; Is debug mode disabled?             ; $02FE: $A7
    jr   z, .debugEnd                             ; $02FF: $28 $2C

    ld   a, [wEnginePaused]                       ; $0301: $FA $FC $D6
    and  a  ; Is engine already paused?           ; $0304: $A7
    jr   nz, .engineIsPaused                      ; $0305: $20 $06

    ldh  a, [hPressedButtonsMask]                 ; $0307: $F0 $CB
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN ; Are none of the directional keys pressed? ; $0309: $E6 $0F
    jr   z, .saveEngineStatus                     ; $030B: $28 $1A

.engineIsPaused
    ldh  a, [hJoypadState]                        ; $030D: $F0 $CC
    and  J_SELECT  ; Was Select button just pressed? ; $030F: $E6 $40
    jr   z, .saveEngineStatus                     ; $0311: $28 $14

    ; If Select button was just pressed,
    ; toogle engine paused status.
    ld   a, [wEnginePaused]                       ; $0313: $FA $FC $D6
    xor  $01                                      ; $0316: $EE $01
    ld   [wEnginePaused], a                       ; $0318: $EA $FC $D6

    ; If the engine was just paused, skip the rest of the render loop
    jr   nz, .waitForNextFrame                    ; $031B: $20 $42

    ; If the engine was just unpaused,
    ; toggle Free-movement mode.
    ld   a, [wFreeMovementMode]                   ; $031D: $FA $7B $C1
    xor  $10                                      ; $0320: $EE $10
    ld   [wFreeMovementMode], a                   ; $0322: $EA $7B $C1
    jr   .waitForNextFrame                        ; $0325: $18 $38

.saveEngineStatus
    ; If the engine is paused, skip the rest of the render loop
    ld   a, [wEnginePaused]                       ; $0327: $FA $FC $D6
    and  a                                        ; $032A: $A7
    jr   nz, .waitForNextFrame                    ; $032B: $20 $32

.debugEnd

    ;
    ; Reset sprites visibility
    ;

    ; If not in Inventory, initially hide all sprites
    ld   a, [wGameplayType]                       ; $032D: $FA $95 $DB
    cp   GAMEPLAY_INVENTORY                       ; $0330: $FE $0C
    jr   nz, .resetSpritesVisibility              ; $0332: $20 $07

    ; If Inventory is actually visible, leave sprites visible
    ld   a, [wGameplaySubtype]                    ; $0334: $FA $96 $DB
    cp   GAMEPLAY_INVENTORY_DELAY1                ; $0337: $FE $02
    jr   c, .spritesEnd                           ; $0339: $38 $08

.resetSpritesVisibility
    callsw HideAllSprites                         ; $033B: $3E $01 $CD $0C $08 $CD $2E $5F
.spritesEnd

    ;
    ; Execute main gameplay code
    ;

    call ExecuteGameplayHandler                   ; $0343: $CD $34 $0E

    ;
    ; Load color palettes
    ;

    ; If isGBC…
    ldh  a, [hIsGBC]                              ; $0346: $F0 $FE
    and  a                                        ; $0348: $A7
    jr   z, .clearPaletteToLoad                   ; $0349: $28 $08
    ; load pending tilemap palette.
    callsw LoadPaletteForTilemap                  ; $034B: $3E $21 $CD $0C $08 $CD $6E $40

.clearPaletteToLoad
    ; Clear the palette to be loaded anyway
    xor  a                                        ; $0353: $AF
    ld   [wPaletteToLoadForTileMap], a            ; $0354: $EA $D2 $DD

    ; Hide any sprites that should be hidden
    ; (behind the window or dialog box)
    callsw HideSprites                            ; $0357: $3E $01 $CD $0C $08 $CD $4B $5F

.waitForNextFrame
    ; Animate inventory window
    callsw func_01F_7F80                          ; $035F: $3E $1F $CD $0C $08 $CD $80 $7F

    ; Switch to first graphics bank ($0C on DMG, $2C on GBC)
    ld   a, $0C                                   ; $0367: $3E $0C
    call AdjustBankNumberForGBC                   ; $0369: $CD $0B $0B
    call SwitchBank                               ; $036C: $CD $0C $08

    ; Mark the frame as being ready
    xor  a                                        ; $036F: $AF
    ldh  [hIsRenderingFrame], a                   ; $0370: $E0 $FD

    ; Stop the CPU until the next interrupt
    halt                                          ; $0372: $76 $00

    ; An interrupt occured; but maybe it wasn't the V-Blank interrupt.
    ; Busy-loop until the V-Blank interrupt actually ran and finished.
.pollNeedsRenderingFrame
    ldh  a, [hNeedsRenderingFrame]                ; $0374: $F0 $D1
    and  a                                        ; $0376: $A7
    jr   z, .pollNeedsRenderingFrame              ; $0377: $28 $FB

    ; Clear hNeedsRenderingFrame
    xor  a                                        ; $0379: $AF
    ldh  [hNeedsRenderingFrame], a                ; $037A: $E0 $D1

    ; Start rendering the next frame
    jp   RenderLoop                               ; $037C: $C3 $DA $01
