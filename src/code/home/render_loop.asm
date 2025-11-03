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
    ; Mark computing of a new frame as being started
    ld   a, TRUE                                  ;; 00:01DA $3E $01
    ldh  [hIsComputingFrame], a                   ;; 00:01DC $E0 $FD

    ;
    ; Set scroll Y
    ;

    ; If wAlternateBackgroundEnabled == 1...
    ld   a, [wAlternateBackgroundEnabled]         ;; 00:01DE $FA $00 $C5
    and  a                                        ;; 00:01E1 $A7
    jr   z, .noSpecialCase                        ;; 00:01E2 $28 $0E
    ; and GameplayType == WORLD...
    ld   a, [wGameplayType]                       ;; 00:01E4 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 00:01E7 $FE $0B
    jr   nz, .noSpecialCase                       ;; 00:01E9 $20 $07

IF __PATCH_0__
    ld   a, $00
ELSE
    ; ... set scroll Y to $00 or $80 alternatively every other frame.
    ldh  a, [hFrameCounter]                       ;; 00:01EB $F0 $E7
    rrca                                          ;; 00:01ED $0F
    and  $80                                      ;; 00:01EE $E6 $80
ENDC
    jr   .setScrollY                              ;; 00:01F0 $18 $06
.noSpecialCase

    ; Default case: add the base offset and the screen shake offset
    ld   hl, wScreenShakeVertical                 ;; 00:01F2 $21 $56 $C1
    ldh  a, [hBaseScrollY]                        ;; 00:01F5 $F0 $97
    add  a, [hl]                                  ;; 00:01F7 $86
.setScrollY
    ldh  [rSCY], a                                ;; 00:01F8 $E0 $42

    ;
    ; Set scroll X
    ;

    ; Add the base offset, the screen shake offset and an additionnal offset
    ldh  a, [hBaseScrollX]                        ;; 00:01FA $F0 $96
    ld   hl, wScreenShakeHorizontal               ;; 00:01FC $21 $55 $C1
    add  a, [hl]                                  ;; 00:01FF $86
    ld   hl, wScrollXOffset                       ;; 00:0200 $21 $BF $C1
    add  a, [hl]                                  ;; 00:0203 $86
    ldh  [rSCX], a ; scrollX                      ;; 00:0204 $E0 $43

    ;
    ; Load requested GFX (if needed)
    ;

    ; If wTilesetToLoad != 0 || wBGMapToLoad != 0,
    ; load new graphics data and return.
    ld   a, [wTilesetToLoad]                      ;; 00:0206 $FA $FE $D6
    and  a                                        ;; 00:0209 $A7
    jr   nz, .loadRequestedGfx                    ;; 00:020A $20 $07
    ld   a, [wBGMapToLoad]                        ;; 00:020C $FA $FF $D6
    cp   TILEMAP_NONE                             ;; 00:020F $FE $00
    jr   z, .noGfxToLoad                          ;; 00:0211 $28 $2A

.loadRequestedGfx
    ; Play audio samples before loading the map when:
    ; - in a menu (GameplayType <= GAMEPLAY_FILE_SAVE)
    ; - on the World (GAMEPLAY_WORLD_INTERACTIVE)
    ; - on the beach with Marin (GAMEPLAY_MARIN_BEACH)
    ; All other combinations skip this step.
    ld   a, [wGameplayType]                       ;; 00:0213 $FA $95 $DB
    cp   GAMEPLAY_MARIN_BEACH                     ;; 00:0216 $FE $09
    jr   z, .playAudioStep                        ;; 00:0218 $28 $0F
    cp   GAMEPLAY_FILE_SAVE                       ;; 00:021A $FE $06
    jr   c, .playAudioStep                        ;; 00:021C $38 $0B
    cp   GAMEPLAY_WORLD                           ;; 00:021E $FE $0B
    jr   nz, .skipAudio                           ;; 00:0220 $20 $0D
    ld   a, [wGameplaySubtype]                    ;; 00:0222 $FA $96 $DB
    cp   GAMEPLAY_WORLD_INTERACTIVE               ;; 00:0225 $FE $07
    jr   nc, .skipAudio                           ;; 00:0227 $30 $06
.playAudioStep
    call PlayAudioStep                            ;; 00:0229 $CD $A4 $08
    call PlayAudioStep                            ;; 00:022C $CD $A4 $08
.skipAudio

    ; Load the requested tileset or BG map
    di                                            ;; 00:022F $F3
    call LoadRequestedGfx                         ;; 00:0230 $CD $19 $04
    ei                                            ;; 00:0233 $FB
    ; Play more audio
    call PlayAudioStep                            ;; 00:0234 $CD $A4 $08
    call PlayAudioStep                            ;; 00:0237 $CD $A4 $08
    ; And we're done for this frame.
    jp   .waitForNextFrame                        ;; 00:023A $C3 $5F $03

.noGfxToLoad

    ;
    ; Start rendering the next frame
    ;

    ; Apply LCD status flags
    ld   a, [wLCDControl]                         ;; 00:023D $FA $FD $D6
    and  ~LCDCF_ON                                ;; 00:0240 $E6 $7F
    ld   e, a                                     ;; 00:0242 $5F
    ldh  a, [rLCDC]                               ;; 00:0243 $F0 $40
    and  LCDCF_ON                                 ;; 00:0245 $E6 $80
    or   e                                        ;; 00:0247 $B3
    ldh  [rLCDC], a                               ;; 00:0248 $E0 $40

    ; Increment the global frame counter
    ld   hl, hFrameCounter                        ;; 00:024A $21 $E7 $FF
    inc  [hl]                                     ;; 00:024D $34

    ; Special case for the intro screen sprites.
    ; If GameplayType == INTRO...
    ld   a, [wGameplayType]                       ;; 00:024E $FA $95 $DB
    cp   GAMEPLAY_INTRO                           ;; 00:0251 $FE $00
    jr   nz, .titleScreenEnd                      ;; 00:0253 $20 $0F
    ; ... and GameplaySubtype > INTRO_BEACH...
    ld   a, [wGameplaySubtype]                    ;; 00:0255 $FA $96 $DB
    cp   GAMEPLAY_INTRO_BEACH + 1                 ;; 00:0258 $FE $08
    jr   c, .titleScreenEnd                       ;; 00:025A $38 $08
    callsb PositionTitleScreenSprites             ;; 00:025C $3E $20 $EA $00 $21 $CD $57 $52
.titleScreenEnd

    ;
    ; Apply transition special effects
    ;

    ; If no transition special effect is active, go to the next step.
    ld   a, [wTransitionGfx]                      ;; 00:0264 $FA $7F $C1
    and  a                                        ;; 00:0267 $A7
    jp   z, .renderInteractiveFrame               ;; 00:0268 $CA $D5 $02

    ; There are two types of transition special effects:
    ;  - interactive: new gameplay frames are rendered while the effect is active ;
    ;  - non-interactive: no new frame is rendered while the effect is active.

    ; If TransitionSfx == TRANSITION_GFX_WIND_FISH
    ; use external code for interactive transitions.
    inc  a                                        ;; 00:026B $3C
    jr   nz, .elsif                               ;; 00:026C $20 $0B
.interactiveTransition
    ; Apply the transition effect...
    callsb ApplyWindFishVfx                       ;; 00:026E $3E $17 $EA $00 $21 $CD $DD $48
    ; ... and continue rendering a new frame.
    jp   .renderInteractiveFrame                  ;; 00:0276 $C3 $D5 $02
.elsif
    ; If TransitionSfx == TRANSITION_GFX_FLOATING,
    ; use the interactive transition code too.
    inc  a                                        ;; 00:0279 $3C
    jr   z, .interactiveTransition                ;; 00:027A $28 $F2

    ; Else, render a non-interactive transition effect.

    ld   a, BANK(ApplyFadeToWhite_DMG)            ;; 00:027C $3E $14
    ld   [rSelectROMBank], a                      ;; 00:027E $EA $00 $21

    ; Increment frame count for the transition effect
    ld   a, [wTransitionGfxFrameCount]            ;; 00:0281 $FA $80 $C1
    inc  a                                        ;; 00:0284 $3C
    ld   [wTransitionGfxFrameCount], a            ;; 00:0285 $EA $80 $C1

    ; If the frame count didn't reached $C0 yet, continue the transition.
    cp   $C0                                      ;; 00:0288 $FE $C0
    jr   nz, .renderTransitionSfx                 ;; 00:028A $20 $14

    ; The transition is finished.
    ; If the transition was MANBO_IN...
    ld   a, [wTransitionGfx]                      ;; 00:028C $FA $7F $C1
    cp   TRANSITION_GFX_MANBO_IN                  ;; 00:028F $FE $02
    jr   nz, .finishTransition                    ;; 00:0291 $20 $03
    ; ... teleport to Manbo Pond.
    call TeleportToManboPond                      ;; 00:0293 $CD $51 $4E

.finishTransition
    ; Reset transition state
    xor  a                                        ;; 00:0296 $AF
    ld   [wTransitionGfx], a                      ;; 00:0297 $EA $7F $C1
    ld   [wC3CA], a                               ;; 00:029A $EA $CA $C3
    ; Resume rendering of an interactive frame
    jp   .renderInteractiveFrame                  ;; 00:029D $C3 $D5 $02

.renderTransitionSfx

    ; If TransitionSfxFrameCount >= $60,
    ; start fading the screen to white.
    push af                                       ;; 00:02A0 $F5
    cp   $60                                      ;; 00:02A1 $FE $60
    jr   c, .transitionFadeOutEnd                 ;; 00:02A3 $38 $12
    ; If GBC...
    ldh  a, [hIsGBC]                              ;; 00:02A5 $F0 $FE
    and  a                                        ;; 00:02A7 $A7
    jr   z, .renderDMGFadeOut                     ;; 00:02A8 $28 $0A
    ; Render fade-to-white effect for GBC
    callsb ApplyFadeToWhite_GBC                   ;; 00:02AA $3E $20 $EA $00 $21 $CD $A7 $6C
    jr   .transitionDone                          ;; 00:02B2 $18 $03
.renderDMGFadeOut
    ; Render fade-to-white effect for DMG
    call ApplyFadeToWhite_DMG                     ;; 00:02B4 $CD $E8 $4F
.transitionFadeOutEnd

.transitionDone
    ; Render transition effect
    ld   a, BANK(RenderTransitionEffect)          ;; 00:02B7 $3E $14
    ld   [rSelectROMBank], a                      ;; 00:02B9 $EA $00 $21
    pop  af                                       ;; 00:02BC $F1
    call RenderTransitionEffect                   ;; 00:02BD $CD $38 $50

    ; Play some audio
    call PlayAudioStep                            ;; 00:02C0 $CD $A4 $08
    ; Apply pending palettes
    ld   a, [wBGPalette]                          ;; 00:02C3 $FA $97 $DB
    ldh  [rBGP], a                                ;; 00:02C6 $E0 $47
    ld   a, [wOBJ0Palette]                        ;; 00:02C8 $FA $98 $DB
    ldh  [rOBP0], a                               ;; 00:02CB $E0 $48
    ld   a, [wOBJ1Palette]                        ;; 00:02CD $FA $99 $DB
    ldh  [rOBP1], a                               ;; 00:02D0 $E0 $49
    ; This is a non-interactive transition: no new gameplay frame is rendered.
    ; Wait for the next V-Blank.
    jp   .waitForNextFrame                        ;; 00:02D2 $C3 $5F $03

    ;
    ; Render an interactive frame
    ;
.renderInteractiveFrame

    ; Update graphics registers from game values
    ld   a, [wWindowY]                            ;; 00:02D5 $FA $9A $DB
    ldh  [rWY], a                                 ;; 00:02D8 $E0 $4A
    ld   a, [wBGPalette]                          ;; 00:02DA $FA $97 $DB
    ldh  [rBGP], a                                ;; 00:02DD $E0 $47
    ld   a, [wOBJ0Palette]                        ;; 00:02DF $FA $98 $DB
    ldh  [rOBP0], a                               ;; 00:02E2 $E0 $48
    ld   a, [wOBJ1Palette]                        ;; 00:02E4 $FA $99 $DB
    ldh  [rOBP1], a                               ;; 00:02E7 $E0 $49

    call PlayAudioStep                            ;; 00:02E9 $CD $A4 $08
    call ReadJoypadState                          ;; 00:02EC $CD $1E $28

    ; If NeedsUpdatingBGTiles || NeedsUpdatingEnnemiesTiles || NeedsUpdatingNPCTiles…
    ldh  a, [hNeedsUpdatingBGTiles]               ;; 00:02EF $F0 $90
    ld   hl, hNeedsUpdatingEntityTilesA           ;; 00:02F1 $21 $91 $FF
    or   [hl]                                     ;; 00:02F4 $B6
    ld   hl, wNeedsUpdatingEntityTilesB           ;; 00:02F5 $21 $0E $C1
    or   [hl]                                     ;; 00:02F8 $B6
    ; skip further rendering: the vblank interrupt will load the required data
    jr   nz, .waitForNextFrame                    ;; 00:02F9 $20 $64

    ;
    ; Debug functions
    ;

    ld   a, [ROM_DebugTool1]                      ;; 00:02FB $FA $03 $00
    and  a  ; Is debug mode disabled?             ;; 00:02FE $A7
    jr   z, .debugEnd                             ;; 00:02FF $28 $2C

    ld   a, [wEnginePaused]                       ;; 00:0301 $FA $FC $D6
    and  a  ; Is engine already paused?           ;; 00:0304 $A7
    jr   nz, .engineIsPaused                      ;; 00:0305 $20 $06

    ldh  a, [hPressedButtonsMask]                 ;; 00:0307 $F0 $CB
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN ; Are none of the directional keys pressed? ;; 00:0309 $E6 $0F
    jr   z, .saveEngineStatus                     ;; 00:030B $28 $1A

.engineIsPaused
    ldh  a, [hJoypadState]                        ;; 00:030D $F0 $CC
    and  J_SELECT  ; Was Select button just pressed? ;; 00:030F $E6 $40
    jr   z, .saveEngineStatus                     ;; 00:0311 $28 $14

    ; If Select button was just pressed,
    ; toogle engine paused status.
    ld   a, [wEnginePaused]                       ;; 00:0313 $FA $FC $D6
    xor  $01                                      ;; 00:0316 $EE $01
    ld   [wEnginePaused], a                       ;; 00:0318 $EA $FC $D6

    ; If the engine was just paused, skip the rest of the render loop
    jr   nz, .waitForNextFrame                    ;; 00:031B $20 $42

    ; If the engine was just unpaused,
    ; toggle Free-movement mode.
    ld   a, [wFreeMovementMode]                   ;; 00:031D $FA $7B $C1
    xor  $10                                      ;; 00:0320 $EE $10
    ld   [wFreeMovementMode], a                   ;; 00:0322 $EA $7B $C1
    jr   .waitForNextFrame                        ;; 00:0325 $18 $38

.saveEngineStatus
    ; If the engine is paused, skip the rest of the render loop
    ld   a, [wEnginePaused]                       ;; 00:0327 $FA $FC $D6
    and  a                                        ;; 00:032A $A7
    jr   nz, .waitForNextFrame                    ;; 00:032B $20 $32

.debugEnd

    ;
    ; Reset sprites visibility
    ;

    ; If not in Inventory, initially hide all sprites
    ld   a, [wGameplayType]                       ;; 00:032D $FA $95 $DB
    cp   GAMEPLAY_INVENTORY                       ;; 00:0330 $FE $0C
    jr   nz, .resetSpritesVisibility              ;; 00:0332 $20 $07

    ; If Inventory is actually visible, leave sprites visible
    ld   a, [wGameplaySubtype]                    ;; 00:0334 $FA $96 $DB
    cp   GAMEPLAY_INVENTORY_DELAY1                ;; 00:0337 $FE $02
    jr   c, .spritesEnd                           ;; 00:0339 $38 $08

.resetSpritesVisibility
    callsw HideAllSprites                         ;; 00:033B $3E $01 $CD $0C $08 $CD $2E $5F
.spritesEnd

    ;
    ; Execute main gameplay code
    ;

    call ExecuteGameplayHandler                   ;; 00:0343 $CD $34 $0E

    ;
    ; Load color palettes
    ;

    ; If isGBC…
    ldh  a, [hIsGBC]                              ;; 00:0346 $F0 $FE
    and  a                                        ;; 00:0348 $A7
    jr   z, .clearPaletteToLoad                   ;; 00:0349 $28 $08
    ; load pending tilemap palette.
    callsw LoadPaletteForTilemap                  ;; 00:034B $3E $21 $CD $0C $08 $CD $6E $40

.clearPaletteToLoad
    ; Clear the palette to be loaded anyway
    xor  a                                        ;; 00:0353 $AF
    ld   [wPaletteToLoadForTileMap], a            ;; 00:0354 $EA $D2 $DD

    ; Hide any sprites that should be hidden
    ; (behind the window or dialog box)
    callsw HideSprites                            ;; 00:0357 $3E $01 $CD $0C $08 $CD $4B $5F

.waitForNextFrame
    ; Animate inventory window
    callsw func_01F_7F80                          ;; 00:035F $3E $1F $CD $0C $08 $CD $80 $7F

    ; Switch to first graphics bank ($0C on DMG, $2C on GBC)
    ld   a, $0C                                   ;; 00:0367 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:0369 $CD $0B $0B
    call SwitchBank                               ;; 00:036C $CD $0C $08

    ; Mark the frame as being ready
    xor  a                                        ;; 00:036F $AF
    ldh  [hIsComputingFrame], a                   ;; 00:0370 $E0 $FD

    ; Stop the CPU until the next interrupt
    halt                                          ;; 00:0372 $76
    nop                                           ;; 00:0373 $00

    ; An interrupt occured; but maybe it wasn't the V-Blank interrupt.
    ; Busy-loop until the V-Blank interrupt actually ran and finished.
.pollUntilVBlank
    ldh  a, [hVBlankOccurred]                     ;; 00:0374 $F0 $D1
    and  a                                        ;; 00:0376 $A7
    jr   z, .pollUntilVBlank                      ;; 00:0377 $28 $FB
    xor  a                                        ;; 00:0379 $AF
    ldh  [hVBlankOccurred], a                     ;; 00:037A $E0 $D1

    ; Start rendering the next frame
    jp   RenderLoop                               ;; 00:037C $C3 $DA $01
