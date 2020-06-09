; Code for bank 0 ("Home").
; Unlike other banks, this code is always adressable at `00:xxxx`, without
; the need to switch banks.

include "code/home/init.asm"
include "code/home/render_loop.asm"
include "code/home/interrupts.asm"

; Switch to the bank defined in a, and save the active bank
SwitchBank::
SwitchAdjustedBank::
    ld   [MBC3SelectBank], a
    ld   [wCurrentBank], a
    ret

ReloadSavedBank::
    push af
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    pop  af
    ret

; Load the dungeon minimap tiles and palettes.
;
; The loading is done in several stages. hBGTilesLoadingStage controls which stage
; is to be executed. At the end of this function, hBGTilesLoadingStage is incremented by 1.
LoadDungeonMinimapTiles::
    ; Select the bank containing the dungeon minimap tiles
    ld   a, BANK(DungeonMinimapTiles)
    ld   [MBC3SelectBank], a

    ; If hBGTilesLoadingStage < 8, load the tiles
    ldh  a, [hBGTilesLoadingStage]
    cp   $08
    jr   c, .loadTiles

    ; If hBGTilesLoadingStage == 8, load the palette stage 1
    jr   nz, .paletteStage1End
    callsb CopyDungeonMinimapPalette
    ld   hl, hBGTilesLoadingStage
    inc  [hl]
    ret
.paletteStage1End

    ; If hBGTilesLoadingStage == 9, load the palette stage 2
    cp   $09
    jr   nz, .paletteStage2End
    callsb label_002_6827
    ld   hl, hBGTilesLoadingStage
    inc  [hl]
    ret
.paletteStage2End

    ; If hBGTilesLoadingStage == $0A, load the palette stage 3
    cp   $0A
    jr   nz, .paletteStage3End
    callsb label_002_680B
    ld   hl, hBGTilesLoadingStage
    inc  [hl]
    ret
.paletteStage3End

    ; else if hBGTilesLoadingStage >= $0B, load the palette stage 4…
    callsb label_002_67E5
    ; … and reset the loading stage to zero.
    xor  a
    ldh  [hNeedsUpdatingBGTiles], a
    ldh  [hBGTilesLoadingStage], a
    ret

.loadTiles
    ; tiles offset = [hBGTilesLoadingStage] * $40
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    ; destination = (vTiles1 + $500) + tiles offset
    ld   hl, vTiles1 + $500
    add  hl, bc
    ld   e, l
    ld   d, h
    ; origin = DungeonMinimapTiles + tiles offset
    ld   hl, DungeonMinimapTiles
    add  hl, bc
    ld   bc, $40
    ; Copy the tiles from ROM to tiles memory
    call CopyData
    ; Increment hBGTilesLoadingStage
    ldh  a, [hBGTilesLoadingStage]
    inc  a
    ldh  [hBGTilesLoadingStage], a
    ret

PlayAudioStep::
    callsw PlaySfx

    ; If a wave SFX is playing, return early
    ldh  a, [hWaveSfx]
    and  a
    jr   nz, .return

    ; If wMusicTrackTiming != 0…
    ld   a, [wMusicTrackTiming]
    and  a
    jr   z, .doAudioStep
    ; … and wMusicTrackTiming != 2…
    cp   $02
    ; … play two audio steps (double speed)
    jr   nz, .doAudioStepTwice
    ; Otherwise, play the audio step only on odd frames (half speed)
    ldh  a, [hFrameCounter]
    and  $01
    jr   nz, .return

    jr   .doAudioStep

.doAudioStepTwice
    call .doAudioStep
    ; Fallthrough to doAudioStep a second time

.doAudioStep
    ; TODO: clarify the respective purpose of these two functions
    callsw PlayMusicTrack_1B
    callsw PlayMusicTrack_1E

.return
    ret

    db $FF, $FF, $FF, $FF, $FF
; Palette-related code in bank $20
;

Farcall:
ClearFileMenuBG_trampoline:
CopyBGMapFromBank:
func_91D:
.jp_92E
func_036_4F68_trampoline
func_036_4A4C_trampoline
func_036_7161_trampoline
func_036_4A77_trampoline
func_036_4F9B_trampoline
func_036_505F_trampoline
func_036_4BE8_trampoline
func_036_703E_trampoline
func_036_705A_trampoline
func_036_70D6_trampoline
func_020_6D0E_trampoline
GetEntityInitHandler_trampoline
ReplaceObjects56and57_trampoline
CheckPushedTombStone_trampoline
func_999
func_020_6AC1_trampoline
func_020_6A30_trampoline
func_020_6BA4_trampoline
LoadFileMenuBG_trampoline
CopyLinkTunicPalette_trampoline
AdjustBankNumberForGBC

UpdateLinkWalkingAnimation_trampoline::
    ld   a, BANK(LinkAnimationsLists)
    ld   [MBC3SelectBank], a
    call UpdateLinkWalkingAnimation
    jp   ReloadSavedBank

; Retrieve the drop timer for the given entity.
; Input:
;   bc   entity index
; Output:
;   hl   address of the drop timer for this entity
;   a    value of the drop timer for this entity
;   z    whether the drop timer is zero
GetEntityDropTimer::
    ld   hl, wEntitiesDropTimerTable
    jr   IsZero

; Retrieve the private counter 1 for the given entity.
; Input:
;   bc   entity index
; Output:
;   hl   address of the private counter for this entity
;   a    value of the private counter for this entity
;   z    whether the private counter is zero
GetEntityPrivateCountdown1::
    ld   hl, wEntitiesPrivateCountdown1Table
    jr   IsZero

; Retrieve the transition counter for the given entity.
; Input:
;   bc   entity index
; Output:
;   hl   address of the transition counter for this entity
;   a    value of the transition counter for this entity
;   z    whether the transition counter is zero
GetEntityTransitionCountdown::
    ld   hl, wEntitiesTransitionCountdownTable

; Test if the value at given address is equal to zero
; Inputs:
;  - hl: an address
;  - bc: an offset
; Output:
;  - a: the value read
;  - z: whether the value equal to zero
IsZero::
    add  hl, bc
    ld   a, [hl]
    and  a
    ret

; Create a new temporary entity with the current trading item.
; Used when Link trades a new item.
CreateTradingItemEntity::
    ld   a, ENTITY_TRADING_ITEM
    call SpawnNewEntity_trampoline
    ldh  a, [hLinkPositionX]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionY]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a
    ret

PlayWrongAnswerJingle::
    ld   a, JINGLE_WRONG_ANSWER
    ldh  [hJingle], a
    ret

ReadTileValueFromAsciiTable::
    ld   hl, AsciiToTileMap
    jr   ReadValueInDialogsBank

ReadDialogBankFromTable::
    ld   hl, DialogBankTable

ReadValueInDialogsBank::
    ld   a, BANK(AsciiToTileMap) ; or BANK(DialogBankTable)
    ld   [MBC3SelectBank], a
    add  hl, bc
    ld   a, [hl]
    ld   hl, MBC3SelectBank
    ld   [hl], $01
    ret

; Copy 4 tiles from bank $0C, then return to bank 1.
; Inputs:
;   hl:  target address of the instrument tiles
CopySirenInstrumentTiles::
    ld   a, BANK(SirenInstrumentsTiles)
    ld   [MBC3SelectBank], a
    ld   bc, $40
    call CopyData
    ld   a, $01
    ld   [MBC3SelectBank], a
    ret

PlayBombExplosionSfx::
    ld   hl, hNoiseSfx
    ld   [hl], NOISE_SFX_BOMB_EXPLOSION

func_C50::
    ld   hl, $C502
    ld   [hl], $04
    ret

; Decrement the wEntitiesIgnoreHitsCountdownTable value for the given entity.
;
; Inputs:
;   bc   entity index
DecrementEntityIgnoreHitsCountdown::
    ld   hl, wEntitiesIgnoreHitsCountdownTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   z, .endIf
    dec  [hl]
.endIf
    ret

MarkTriggerAsResolved::
    push af

    ; If the event effect was already executed, return.
    ld   a, [wRoomEventEffectExecuted]
    and  a
    jr   nz, .return

    ; $C1CF = 0
    ld   [$C1CF], a
    ; wRoomEventEffectExecuted = $C5A6 = 1
    inc  a
    ld   [wRoomEventEffectExecuted], a
    ld   [$C5A6], a

    ; If $C19D == 0…
    ld   a, [$C19D]
    and  a
    jr   nz, .return
    ; play puzzle solved jingle
    ld   a, JINGLE_PUZZLE_SOLVED
    ldh  [hJingle], a
.return
    pop  af
    ret

ApplyMapFadeOutTransition::
    ld   a, $30
    ; Timer that counts down and ends when the track has completely faded out. *Might* be used for the visual effect when entering a house as well.
    ldh  [hMusicFadeOutTimer], a
    jr   label_C9A

label_C83::
    ld   a, $30
    ldh  [hMusicFadeOutTimer], a
    jr   label_C9E

label_C89::
    ld   a, [wWarp0MapCategory]
    cp   $01
    jr   nz, ApplyMapFadeOutTransition
    ld   a, [wIsIndoor]
    and  a
    jr   z, ApplyMapFadeOutTransition
    ld   a, $01
    ldh  [hFFBC], a

label_C9A::
    ld   a, NOISE_SFX_STAIRS
    ldh  [hNoiseSfx], a

label_C9E::
    ; Prevent Link from moving during the transition
    ld   a, LINK_MOTION_MAP_FADE_OUT
    ld   [wLinkMotionState], a

    ; Reset the transition variables
    xor  a
    ld   [wTransitionSequenceCounter], a
    ld   [$C16C], a
    ld   [$D478], a
    and  a
    ret

ResetSpinAttack::
    xor  a
    ld   [wIsUsingSpinAttack], a
    ld   [wSwordCharge], a

ResetPegasusBoots::
    xor  a
    ld   [wPegasusBootsChargeMeter], a
    ld   [wIsRunningWithPegasusBoots], a
    ret

CopyLinkFinalPositionToPosition::
    ldh  a, [hLinkFinalPositionX]
    ldh  [hLinkPositionX], a
    ldh  a, [hLinkFinalPositionY]
    ldh  [hLinkPositionY], a
    ret

; Display a temporary visual effect as a non-interacting sprite.
; The effect is automatically removed after a while.
;
; Inputs:
;   a           visual effect type
;   hScratch0   effect X position
;   hScratch1   effect Y position
AddTranscientVfx::
    push af
    ld   e, $0F
    ld   d, $00

    ; Find index of the last zero in the transcient VFXs table
.loop
    ld   hl, wTranscientVfxTypeTable
    add  hl, de
    ld   a, [hl]
    and  a
    jr   z, .jp_CEC
    dec  e
    ld   a, e
    cp   -1
    jr   nz, .loop

    ; If a zero value is not found, decrement $C5C0
    ld   hl, $C5C0
    dec  [hl]
    ; (wrap $C5C0 to $0F if it reached 0)
    ld   a, [hl]
    cp   -1
    jr   nz, .wrapEnd
    ld   a, $0F
    ld   [$C5C0], a
.wrapEnd

    ; e = $C5C0
    ld   a, [$C5C0]
    ld   e, a

.jp_CEC
    pop  af
    ld   hl, wTranscientVfxTypeTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hScratch1]
    ld   hl, wTranscientVfxPosYTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hScratch0]
    ld   hl, wTranscientVfxPosXTable
    add  hl, de
    ld   [hl], a
    ld   hl, wTranscientVfxCountdownTable
    add  hl, de
    ld   [hl], $0F
    ret

label_D07::
    ld   a, [$C140]
    sub  a, $08
    ldh  [hScratch0], a
    ld   a, [$C142]
    sub  a, $08
    ldh  [hScratch1], a

label_D15::
    ld   a, JINGLE_SWORD_POKING
    ldh  [hJingle], a
    ld   a, TRANSCIENT_VFX_SWORD_POKE
    jp   AddTranscientVfx

; Schedule the loading of the tilesets for the next room,
; (either during a map transition or a room transition).
;
; Actual loading will be done during the next vblank period.
LoadRoomTiles::
    ld   a, BANK(TilesetTables)
    ld   [MBC3SelectBank], a

    ; ------------------------------------------------------------
    ;
    ; Load Background tileset
    ;
    ; ------------------------------------------------------------

    ld   a, [wIsIndoor]
    and  a
    jr   z, .overworld

    ;
    ; Indoor BG tileset
    ;

    ; de = [hMapRoom]
    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, $00
    ld   hl, IndoorsTilesetsTable

    ; Use a special table for the Color Dungeon
    ldh  a, [hMapId]

    ; If 06 < mapId < MAP_UNKNOWN_1A, add $100 to the table address
    cp   MAP_UNKNOWN_1A
    jr   nc, .readTilesetFromTable
    cp   MAP_EAGLES_TOWER
    jr   c, .readTilesetFromTable
    inc  h

.readTilesetFromTable
    add  hl, de

    ; a = Table[hMapRoom]
    ; e = previous tileset
    ldh  a, [hWorldTileset]
    ld   e, a
    ld   a, [hl]

    ; If the tileset didn't change, nothing to do.
    cp   e
    jr   z, .indoorTilesetEnd

    ; Apply the new tileset
    ldh  [hWorldTileset], a

    ; Schedule the tiles loading operation for the next vblank
    ; (except if the tileset is W_TILESET_NO_UPDATE)
    cp   W_TILESET_NO_UPDATE
    jr   z, .indoorTilesetEnd
    ld   a, $01
    ldh  [hNeedsUpdatingBGTiles], a

.indoorTilesetEnd
    jr   .tilesetEnd

.overworld
    ;
    ; Overworld BG tileset
    ;

    ldh  a, [hMapRoom]
    ; hack: for overworld room $07 (right of the Egg), use tilset of the taramanch center
    cp   $07
    jr   nz, .eggHackEnd
    inc  a
.eggHackEnd

    ; de = hMapRoom / 4
    ld   d, a
    srl  a
    srl  a
    and  $F8
    ld   e, a
    ld   a, d
    srl  a
    and  $07
    or   e
    ld   e, a
    ld   d, $00

    ; a = OverworldTilesetsTable[hMapRoom / 4]
    ; e = previous tileset
    ld   hl, OverworldTilesetsTable
    add  hl, de
    ldh  a, [hWorldTileset]
    ld   e, a
    ld   a, [hl]

    ; If the tileset didn't change, nothing to do.
    cp   e
    jr   z, .tilesetEnd
    ; If the tileset is TILESET_KEEP, nothing to do.
    cp   W_TILESET_KEEP
    jr   z, .tilesetEnd

    ldh  [hWorldTileset], a
    ; Schedule the tiles loading operation for the next vblank
    ld   a, $01
    ldh  [hNeedsUpdatingBGTiles], a
.tilesetEnd

    ; ------------------------------------------------------------
    ;
    ; Load Sprites tileset
    ;
    ; ------------------------------------------------------------

    ; TODO: document this

    xor  a
    ldh  [hScratch0], a

    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, $00
    ld   hl, data_020_70D3

    ld   a, [wIsIndoor]
    ld   d, a
    ldh  a, [hMapId]
    cp   $1A
    jr   nc, .label_DAB
    cp   MAP_EAGLES_TOWER
    jr   c, .label_DAB
    inc  d

.label_DAB
    add  hl, de
    ld   e, [hl]
    ld   a, d
    and  a
  jr nz, .label_DDB
    ld   a, e
    cp   $23
    jr   nz, .label_DCE
    ld   a, [wOverworldRoomStatus + $C9]
    and  $20
    jr   z, .label_DCE
    inc  e

.label_DCE
    ld   a, e
    cp   $21
    jr   nz, .label_DDB
    ld   a, [wOverworldRoomStatus + $FD]
    and  $20
    jr   z, .label_DDB
    inc  e

.label_DDB
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, data_020_73F3
    ld   a, [wIsIndoor]
    and  a
    jr   z, .label_DFD
    ld   hl, data_020_763B

.label_DFD
    add  hl, de
    ld   d, $00
    ld   bc, $C193

.loop
    ld   e, [hl]
    ld   a, [bc]
    cp   e
    jr   z, .label_E29
    ld   a, e
    cp   $FF
    jr   z, .label_E29
    ld   [bc], a
    ldh  a, [hScratch0]
    and  a
    jr   z, .label_E1E
    ld   a, d
    ld   [$C10D], a
    ld   a, $01
    ld   [wNeedsUpdatingNPCTiles], a
    jr   .label_E29

.label_E1E
    inc  a
    ldh  [hScratch0], a
    ld   a, d
    ld   [$C197], a
    ld   a, $01
    ldh  [hNeedsUpdatingEnnemiesTiles], a

.label_E29
    inc  hl
    inc  bc
    inc  d
    ld   a, d
    cp   $04
    jr   nz, .loop

.return
    jp   ReloadSavedBank

ExecuteGameplayHandler::
    ld   a, [wGameplayType]
    cp   GAMEPLAY_WORLD_MAP; If GameplayType < MINI_MAP
    jr   c, jumpToGameplayHandler
    cp   GAMEPLAY_WORLD ; If GameplayType != World
    jr   nz, presentSaveScreenIfNeeded
    ; If GameplayType == WORLD
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_WORLD_DEFAULT ; If GameplaySubtype != 7 (standard overworld gameplay)
    jr   nz, jumpToGameplayHandler

presentSaveScreenIfNeeded::
    ; If a indoor/outdoor transition is running
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    jr   nz, jumpToGameplayHandler

    ; If a dialog is visible, or the screen is animating from one map to another
    ld   a, [wDialogState]
    ld   hl, $C167
    or   [hl]
    ld   hl, wRoomTransitionState
    or   [hl]
    jr   nz, jumpToGameplayHandler

    ; If not all A + B + Start + Select buttons are pressed
    ldh  a, [hPressedButtonsMask]
    cp   J_A | J_B | J_START | J_SELECT
    jr   nz, jumpToGameplayHandler

    ; Present save screen
    xor  a ; Clear variables
    ld   [wTransitionSequenceCounter], a
    ld   [$C16C], a
    ld   [wDialogState], a
    ld   [wGameplaySubtype], a
    ld   a, GAMEPLAY_FILE_SAVE ; Set GameplayType to FILE_SAVE
    ld   [wGameplayType], a

jumpToGameplayHandler::
    ld   a, [wGameplayType]
    JP_TABLE
._00 dw IntroHandler
._01 dw EndCreditsHandler
._02 dw FileSelectionHandler
._03 dw FileCreationHandler
._04 dw FileDeletionHandler
._05 dw FileCopyHandler
._06 dw FileSaveHandler
._07 dw WorldMapHandler
._08 dw PeachPictureHandler
._09 dw MarinBeachHandler
._0A dw FaceShrineMuralHandler
._0B dw WorldHandler

FaceShrineMuralHandler::
    call FaceShrineMuralEntryPoint
    jp   returnFromGameplayHandler

PeachPictureHandler::
    call PeachPictureEntryPoint
    jp   returnFromGameplayHandler

MarinBeachHandler::
    call MarineBeachEntryPoint
    jp   returnFromGameplayHandler

WorldMapHandler::
    call WorldMapEntryPoint
    jp   returnFromGameplayHandler

FileSaveHandler::
    jp   FileSaveEntryPoint

IntroHandler::
    jp   IntroHandlerEntryPoint

EndCreditsHandler::
    callsw EndCreditsEntryPoint
    jp   returnFromGameplayHandler

AnimateEntitiesAndRestoreBank17::
    ld   a, $03
    ld   [MBC3SelectBank], a
    ld   a, $17

; Call AnimateEntities, then restore bank in a
AnimateEntitiesAndRestoreBank::
    push af
    call AnimateEntities
    pop  af
    jp   SwitchBank

AnimateEntitiesAndRestoreBank01::
    ld   a, $03
    ld   [MBC3SelectBank], a
    ld   a, $01
    jr   AnimateEntitiesAndRestoreBank

AnimateEntitiesAndRestoreBank02::
    ld   a, $03
    ld   [MBC3SelectBank], a
    ld   a, $02
    jr   AnimateEntitiesAndRestoreBank

FileSelectionHandler::
    jp   FileSelectionEntryPoint

FileCreationHandler::
    jp   FileCreationEntryPoint

FileDeletionHandler::
    jp   FileDeletionEntryPoint

FileCopyHandler::
    jp   FileCopyEntryPoint

WorldHandler::
    callsb UpdatePaletteEffectForInteractiveObjects
    call PerformOverworldAudioTasks
    jpsw WorldHandlerEntryPoint

; World handler for GAMEPLAY_WORLD_DEFAULT (dispatched from WorldHandlerEntryPoint)
WorldDefaultHandler::
    ld   a, $02
    call SwitchBank
    ; If a dialog is already open, continue to the normal flow
    ld   a, [wDialogState]
    and  a
    jr   nz, .normalFlow

    ; If [$FFB4] != 0…
    ld   hl, $FFB4
    ld   a, [hl]
    and  a
    jr   z, .noDungeonName
    ; … and inventory window is not visible…
    ld   a, [wWindowY]
    cp   $80
    jr   nz, .noDungeonName
    ; … and inventory is not opening…
    ld   a, [wInventoryAppearing]
    and  a
    jr   nz, .noDungeonName
    ; … display the dungeon name.
    dec  [hl]
    jr   nz, .noDungeonName
    callsb OpenDungeonNameDialog
    call ReloadSavedBank
.noDungeonName

    ; If still no dialog is open…
    ld   a, [wDialogState]
    and  a
    jr   nz, .normalFlow

    ; … and a countdown to load the previous map is > 0…
    ld   a, [wLoadPreviousMapCountdown]
    and  a
    jr   z, .normalFlow

    ; … decrement the counter
    ld   hl, hLinkInteractiveMotionBlocked
    ld   [hl], $02
    dec  a
    ld   [wLoadPreviousMapCountdown], a

    ; If the countdown reached zero, apply the transition
    jr   nz, .normalFlow
    jp   ApplyMapFadeOutTransition

.normalFlow

    ; If wInvincibilityCounter > 0, decrement it
    ld   hl, wInvincibilityCounter
    ld   a, [hl]
    and  a
    jr   z, .wInvincibilityAtZero
    dec  [hl]
.wInvincibilityAtZero

    ; Copy Link's position into Link's final position
    ldh  a, [hLinkPositionX]
    ldh  [hLinkFinalPositionX], a
    ldh  a, [hLinkPositionY]
    ldh  [hLinkFinalPositionY], a

    ld   hl, hLinkPositionZ
    sub  a, [hl]
    ldh  [$FFB3], a
    call func_002_60E0

    xor  a
    ld   [$C140], a
    ld   [$C13C], a
    ld   [$C13B], a

    ld   hl, $C11D
    res  7, [hl]

    ld   hl, $C11E
    res  7, [hl]

    ; Execute room events
    call label_002_593B

    callsw ApplyRoomTransition

    call ApplyGotItem

    ld   a, [wIsCarryingLiftedObject]
    ld   [$C3CF], a

 xor a
    ld [wHasPlacedBomb], a
    ld [wActiveProjectileCount], a
    ld [$c1a4], a
    ld [wIsCarryingLiftedObject], a
    ld [$c1ae], a
    ld a, [wIsLinkPushing]
    and a
    jr z, jr_000_0bf5

    dec a
    ld [wIsLinkPushing], a

jr_000_0bf5:
    callsw func_019_7A9A

    call AnimateEntities
    callsw label_002_5487

    ld   hl, wRequestDestination
    ldh  a, [hFrameCounter]
    and  $03
    or   [hl]
    jr   nz, label_1012
    ld   a, [wLinkMotionState]
    cp   $02
    jr   nc, label_1012
    ld   c, $01
    ld   b, $00

label_1000::
    ld   e, $00
    ldh  a, [hFrameCounter]
    and  $04
    jr   z, .label_100A
    dec  c
    dec  e

.label_100A
    call func_020_5C9C

label_1012::
    callsw func_014_54F8

returnFromGameplayHandler::
    ; Present dialog if needed
    ld   a, BANK(FontTiles)
    call SwitchBank
    call ExecuteDialog
ret

; Dialog to open, indexed by wDialogGotItem value
DialogForItem::
.gotItem1 db $008 ; Piece of Power
.gotItem2 db $00E ; Toadstool
.gotItem3 db $099 ; Magic powder
.gotItem4 db $028 ; Break pots (?)
.gotItem5 db $0EC ; Guardian Acorn

ApplyGotItem::
    ldh  a, [hLinkPositionY]
    ld   hl, hLinkPositionZ
    sub  a, [hl]
    ld   [$C145], a
    ld   a, [wDialogGotItem]
    and  a
    jr   z, InitGotItemSequence
    ld   a, [wDialogState]
    and  a
    jr   nz, .dispatchItemType

    ; Did the "got item" dialog countdown reached the target value yet?
    ld   hl, wDialogGotItemCountdown
    dec  [hl]
    ld   a, [hl]
    cp   $02
    jr   nz, .countdownNotFinished

    ; Dialog countdown reached the target value: open the "Got item" dialog
    ld   a, [wDialogGotItem]
    ld   e, a
    ld   d, $00
    ld   hl, DialogForItem - $01
    add  hl, de
    ld   a, [hl]
    call OpenDialog
    ld   a, $01

.countdownNotFinished
    and  a
    jr   nz, .dispatchItemType
    xor  a
    ld   [wDialogGotItem], a
    ld   [$C1A8], a
    jr   InitGotItemSequence

.dispatchItemType
    ld   a, [wDialogGotItem]
    ld   [$C1A8], a
    dec  a
    JP_TABLE
._00 dw HandleGotItemA
._01 dw HandleGotItemB
._02 dw HandleGotItemB
._03 dw HandleGotItemB
._04 dw HandleGotItemA

InitGotItemSequence::
    ldh  a, [hPressedButtonsMask]
    and  $B0
    jr   nz, .jp_10DB
    ldh  a, [hPressedButtonsMask]
    and  $40
    jr   z, .jp_10DB
    ld   a, [$D45F]
    inc  a
    ld   [$D45F], a
    cp   $04
    jr   c, .jp_10DF
    ldh  a, [hLinkInteractiveMotionBlocked]
    cp   $02
    jr   z, .jp_10DB
    ldh  a, [hLinkAnimationState]
    cp   $FF
    jr   z, .jp_10DB
    ld   a, [wLinkMotionState]
    cp   $02
    jr   nc, .jp_10DB
    ld   hl, $C167
    ld   a, [wDialogState]
    or   [hl]
    jr   nz, .jp_10DB

    ; Show a location on the mini-map
    xor  a
    ld   [wTransitionSequenceCounter], a
    ld   [$C16C], a
    ld   [wGameplaySubtype], a
    ld   a, GAMEPLAY_WORLD_MAP
    ld   [wGameplayType], a
    callsb func_002_755B
    call DrawLinkSprite
    call AnimateEntities
    pop  af
    ret

.jp_10DB
    xor  a
    ld   [$D45F], a

.jp_10DF
    ldh  a, [$FFB7]
    and  a
    jr   z, .jp_10E7
    dec  a
    ldh  [$FFB7], a

.jp_10E7
    ldh  a, [$FFB6]
    and  a
    jr   z, .jp_10EF
    dec  a
    ldh  [$FFB6], a

.jp_10EF
    ld   a, [wDialogState]
    and  a
    jp   nz, ApplyLinkMotionState
    ld   a, [wRoomTransitionState]
    and  a
    jp   nz, label_114F
    ld   a, [wLinkMotionState]
    cp   LINK_MOTION_PASS_OUT
    jr   z, .linkMotionJumpTable
    ld   a, [wHealth]
    ld   hl, $C50A
    or   [hl]
    ld   hl, wInventoryAppearing
    or   [hl]
    jr   nz, .handleLinkMotion
    ld   a, $07
    ld   [wLinkMotionState], a
    ld   a, $BF
    ldh  [$FFB7], a
    ld   a, $10
    ld   [$C3CC], a
    xor  a
    ld   [wInvincibilityCounter], a
    ldh  [$FF9C], a
    call label_27F2
    ld   a, WAVE_SFX_LINK_DIES
    ldh  [hWaveSfx], a

.handleLinkMotion
    ld   a, [wLinkMotionState]
.linkMotionJumpTable
    JP_TABLE
._00 dw LinkMotionInteractiveHandler
._01 dw LinkMotionSwimmingHandler
._02 dw LinkMotionJumpingHandler
._03 dw LinkMotionMapFadeOutHandler
._04 dw LinkMotionMapFadeInHandler
._05 dw LinkMotionRevolvingDoorHandler
._06 dw LinkMotionFallingDownHandler
._07 dw LinkMotionPassOutHandler
._08 dw LinkMotionRecoverHandler
._09 dw LinkMotionTeleportUpHandler
._0F dw LinkMotionUnknownHandler

label_114F::
    call ApplyLinkMotionState
    jp   DrawLinkSpriteAndReturn

LinkMotionTeleportUpHandler::
    jpsw func_019_5D6A

LinkMotionPassOutHandler::
    jpsw LinkPassOut

LinkMotionInteractiveHandler::
    callsw label_002_4287
    ret

; Check if one of the inventory item should be used
CheckItemsToUse::
    ld   a, [$C50A]
    ld   hl, $C167
    or   [hl]
    ld   hl, $C1A4
    or   [hl]
    ret  nz

    ;
    ; Configure the sword and shield
    ;

    ld   a, [wIsRunningWithPegasusBoots]
    and  a
    jr   z, .notRunning

    ld   a, [wAButtonSlot]
    cp   INVENTORY_SWORD
    jr   z, .swordEquiped
    ld   a, [wBButtonSlot]
    cp   INVENTORY_SWORD
    jr   z, .swordEquiped
    ld   a, [wAButtonSlot]
    cp   INVENTORY_SHIELD
    jr   z, .shieldEquiped
    ld   a, [wBButtonSlot]
    cp   INVENTORY_SHIELD
    jr   nz, .shieldEnd

.shieldEquiped
    call SetShieldVals
    jr   .shieldEnd

.swordEquiped
    ld   a, [wSwordAnimationState]
    dec  a
    cp   $04
    jr   c, .shieldEnd
    ld   a, $05
    ld   [wSwordAnimationState], a
    ld   [$C16A], a

.shieldEnd
    jr   .swordShieldEnd

.notRunning
    xor  a
    ld   [wIsUsingShield], a
    ld   [wHasMirrorShield], a

.swordShieldEnd

    ld   a, [$C117]
    and  a
    jp   nz, UseItem.return
    ld   a, [wIsCarryingLiftedObject]
    and  a
    jp   nz, UseItem.return
    ld   a, [wSwordAnimationState]
    and  a
    jr   z, .jr_11E2
    cp   $03
    jr   nz, .jr_11E2
    ld   a, [$C138]
    cp   $03
    jr   nc, .jr_11E8

.jr_11E2
    ldh  a, [hLinkInteractiveMotionBlocked]
    and  a
    jp   nz, UseItem.return

.jr_11E8
    ld   a, [wBButtonSlot]
    cp   INVENTORY_PEGASUS_BOOTS
    jr   nz, .jr_11FE
    ldh  a, [hPressedButtonsMask]
    and  J_B
    jr   z, .jr_11FA
    call UsePegasusBoots
    jr   .jr_11FE

.jr_11FA
    xor  a
    ld   [wPegasusBootsChargeMeter], a

.jr_11FE
    ld   a, [wAButtonSlot]
    cp   INVENTORY_PEGASUS_BOOTS
    jr   nz, .jr_1214
    ldh  a, [hPressedButtonsMask]
    and  J_A
    jr   z, .jr_1210
    call UsePegasusBoots
    jr   .jr_1214

.jr_1210
    xor  a
    ld   [wPegasusBootsChargeMeter], a

.jr_1214

    ld   a, [wAButtonSlot]
    cp   INVENTORY_SHIELD
    jr   nz, .shieldBEnd
    ld   a, [wShieldLevel]
    ld   [wHasMirrorShield], a
    ldh  a, [hPressedButtonsMask]
    and  J_A
    jr   z, .shieldBEnd
    ld   a, [$C1AD]
    cp   $01
    jr   z, .shieldBEnd
    cp   $02
    jr   z, .shieldBEnd
    call SetShieldVals
.shieldBEnd

    ld   a, [wBButtonSlot]
    cp   INVENTORY_SHIELD
    jr   nz, .shieldAEnd
    ld   a, [wShieldLevel]
    ld   [wHasMirrorShield], a
    ldh  a, [hPressedButtonsMask]
    and  J_B
    jr   z, .shieldAEnd
    call SetShieldVals
.shieldAEnd

    ldh  a, [hJoypadState]
    and  J_B
    jr   z, .jr_125E
    ld   a, [$C1AD]
    cp   $02
    jr   z, .jr_125E

    ; Use item in B slot
    ld   a, [wBButtonSlot]
    call UseItem

.jr_125E
    ldh  a, [hJoypadState]
    and  J_A
    jr   z, .jr_1275
    ld   a, [$C1AD]
    cp   $01
    jr   z, .jr_1275
    cp   $02
    jr   z, .jr_1275

    ; Use item in A slot
    ld   a, [wAButtonSlot]
    call UseItem

.jr_1275
    ldh  a, [hPressedButtonsMask]
    and  J_B
    jr   z, .jr_1281
    ld   a, [wBButtonSlot]
    call label_1321

.jr_1281
    ldh  a, [hPressedButtonsMask]
    and  J_A
    jr   z, .jr_128D
    ld   a, [wAButtonSlot]
    call label_1321

.jr_128D
    ret

; Use an inventory item.
;
; Input:
;   a    inventory item to use
UseItem::
    ld   c, a
    cp   INVENTORY_SWORD
    jp   z, UseSword
    cp   INVENTORY_SHIELD
    jp   z, UseShield
    cp   INVENTORY_BOMBS
    jp   z, PlaceBomb
    cp   INVENTORY_POWER_BRACELET
    jp   z, UsePowerBracelet
    cp   INVENTORY_BOW
    jp   z, ShootArrow
    cp   INVENTORY_BOOMERANG
    jp   z, UseBoomerang
    cp   INVENTORY_HOOKSHOT
    jp   z, UseHookshot
    cp   INVENTORY_ROCS_FEATHER
    jp   z, UseRocsFeather
    cp   INVENTORY_OCARINA
    jp   z, UseOcarina
    cp   INVENTORY_MAGIC_POWDER
    jp   z, UseMagicPowder
    cp   INVENTORY_SHOVEL
    jp   z, UseShovel
    cp   INVENTORY_MAGIC_ROD
    jr   nz, .return

    ; Use Magic Rod
    ld   hl, wSwordAnimationState
    ld   a, [$C19B]
    or   [hl]
    jr   nz, .return
    ld   a, [wActiveProjectileCount]
    cp   $02
    jr   nc, .return
    ld   a, $8E
    ld   [$C19B], a

.return
    ret

UseShield::
    ld   a, [wIsLinkPushing]
    and  a
    ret  nz
    ld   a, NOISE_SFX_DRAW_SHIELD
    ldh  [hNoiseSfx], a
    ret

UseShovel::
    ld   a, [$C1C7]
    ld   hl, $C146
    or   [hl]
    ret  nz

    call func_002_4D20
    jr   nc, .notPoking

    ld   a, JINGLE_SWORD_POKING
    ldh  [hJingle], a
    jr   .endIf

.notPoking
    ld   a, NOISE_SFX_SHOWEL_DIG
    ldh  [hNoiseSfx], a
.endIf

    ld   a, $01
    ld   [$C1C7], a
    xor  a
    ld   [$C1C8], a
    ret

UseHookshot::
    ld   a, [$C1A4]
    and  a
    ret  nz
    call   FireHookshot
    ret

; Inputs:
;   a    inventory item
label_1321::
    cp   INVENTORY_SWORD
    ret  nz

    ld   hl, wSwordAnimationState
    ld   a, [$C1AD]
    and  $03
    or   [hl]
    ret  nz

    ld   a, [$C160]
    and  a
    ret  nz

    xor  a
    ld   [$C1AC], a
    ld   a, $05
    ld   [wSwordAnimationState], a
    ld   [$C5B0], a
    ret

data_dmg:
db  $10, $00, $08, $08, $03, $03, $08, $08, $08, $08, $00, $0d, $08, $08, $03, $04

SetShieldVals::
    ld   a, $01
    ld   [wIsUsingShield], a
    ld   a, [wShieldLevel]
    ld   [wHasMirrorShield], a

    ; fallthrough

func_020_4B4A_trampoline::
    ; includes func_020_4B4A
    ldh a, [hLinkDirection]
    ld e, a
    ld d, $00
    ld hl, data_dmg
    add hl, de
    ldh a, [hLinkPositionX]
    add [hl]
    ld [$c140], a
    ld hl, $0f28
    add hl, de
    ld a, [hl]
    ld [$c141], a
    ld hl, $0f2c
    add hl, de
    ld a, [$c145]
    add [hl]
    ld [$c142], a
    ld hl, $0f30
    add hl, de
    ld a, [hl]
    ld [wIsLinkInTheAir], a
    xor a
    ld [$c5b0], a
    ret

Data_020_4B79::
    db   $08, $F8, $00, $00

Data_020_4B7D::
    db   $00, $00, $FD, $04

PlaceBomb::
    ld   a, [wHasPlacedBomb]
    cp   $01
    ret  nc

    ld   a, [wBombCount]
    and  a
    jp   z, PlayWrongAnswerJingle

    sub  a, $01
    daa
    ld   [wBombCount], a
    ld   a, ENTITY_BOMB
    call SpawnPlayerProjectile
    ret  c
    ; fallthrough

;   func_020_4B81
    ld   hl, wEntitiesPrivateCountdown1Table      ; $4B81: $21 $F0 $C2
    add  hl, de                                   ; $4B84: $19
    ld   [hl], $10                                ; $4B85: $36 $10
    ld   a, [wBombArrowCooldown]                  ; $4B87: $FA $C0 $C1
    and  a                                        ; $4B8A: $A7
    jp   z, label_020_4B9E                        ; $4B8B: $CA $9E $4B

    xor  a                                        ; $4B8E: $AF
    ld   [wBombArrowCooldown], a                  ; $4B8F: $EA $C0 $C1
    ld   a, [$C1C2]                               ; $4B92: $FA $C2 $C1
    ld   c, a                                     ; $4B95: $4F
    ld   b, d                                     ; $4B96: $42
    ld   hl, wEntitiesStateTable                  ; $4B97: $21 $90 $C2
    add  hl, bc                                   ; $4B9A: $09
    ld   [hl], $01                                ; $4B9B: $36 $01
    ret                                           ; $4B9D: $C9

label_020_4B9E:
    ld   a, $06                                   ; $4B9E: $3E $06
    ld   [wBombArrowCooldown], a                  ; $4BA0: $EA $C0 $C1
    ld   a, e                                     ; $4BA3: $7B
    ld   [$C1C1], a                               ; $4BA4: $EA $C1 $C1
    ld   a, $0C                                   ; $4BA7: $3E $0C
    ld   [$C19B], a                               ; $4BA9: $EA $9B $C1
    ld   hl, wEntitiesTransitionCountdownTable    ; $4BAC: $21 $E0 $C2
    add  hl, de                                   ; $4BAF: $19
    ld   [hl], $A0                                ; $4BB0: $36 $A0
    ld   hl, wEntitiesSpriteVariantTable          ; $4BB2: $21 $B0 $C3
    add  hl, de                                   ; $4BB5: $19
    ld   [hl], d                                  ; $4BB6: $72
    ld   hl, wEntitiesUnknowTableV                ; $4BB7: $21 $80 $C4
    add  hl, de                                   ; $4BBA: $19
    ld   [hl], $03                                ; $4BBB: $36 $03
    ldh  a, [hIsSideScrolling]                    ; $4BBD: $F0 $F9
    and  a                                        ; $4BBF: $A7
    jr   nz, jr_020_4BC8                          ; $4BC0: $20 $06

    ld   a, JINGLE_BUMP                           ; $4BC2: $3E $09
    ldh  [hJingle], a                             ; $4BC4: $E0 $F2
    jr   jr_020_4BCD                              ; $4BC6: $18 $05

jr_020_4BC8:
    ld   hl, wEntitiesPosZTable                   ; $4BC8: $21 $10 $C3
    add  hl, de                                   ; $4BCB: $19
    ld   [hl], d                                  ; $4BCC: $72

jr_020_4BCD:
    ld   hl, wEntitiesSpeedXTable                 ; $4BCD: $21 $40 $C2
    add  hl, de                                   ; $4BD0: $19
    ld   [hl], d                                  ; $4BD1: $72
    ld   hl, wEntitiesSpeedYTable                 ; $4BD2: $21 $50 $C2
    add  hl, de                                   ; $4BD5: $19
    ld   [hl], d                                  ; $4BD6: $72
    ld   hl, wEntitiesSpeedZTable                 ; $4BD7: $21 $20 $C3
    add  hl, de                                   ; $4BDA: $19
    ld   [hl], d                                  ; $4BDB: $72
    ldh  a, [hLinkDirection]                      ; $4BDC: $F0 $9E
    ld   c, a                                     ; $4BDE: $4F
    ld   b, d                                     ; $4BDF: $42
    ld   hl, Data_020_4B79                        ; $4BE0: $21 $79 $4B

jr_020_4BE3:
    add  hl, bc                                   ; $4BE3: $09
    ldh  a, [hLinkPositionX]                      ; $4BE4: $F0 $98
    add  [hl]                                     ; $4BE6: $86
    ld   hl, wEntitiesPosXTable                   ; $4BE7: $21 $00 $C2
    add  hl, de                                   ; $4BEA: $19
    ld   [hl], a                                  ; $4BEB: $77
    ld   hl, Data_020_4B7D                        ; $4BEC: $21 $7D $4B
    add  hl, bc                                   ; $4BEF: $09
    ldh  a, [hLinkPositionY]                      ; $4BF0: $F0 $99
    add  [hl]                                     ; $4BF2: $86
    ld   hl, wEntitiesPosYTable                   ; $4BF3: $21 $10 $C2
    add  hl, de                                   ; $4BF6: $19
    ld   [hl], a                                  ; $4BF7: $77
    ret


UsePowerBracelet::
    ret


Data_020_4BF9::
    db   $18, -$18

Data_020_4BFB::
    db   $00, -$18, $18, $00

UseBoomerang::
    ld   a, [wActiveProjectileCount]
    and  a
    ret  nz

    ld   a, ENTITY_BOOMERANG
    call SpawnPlayerProjectile
    ret  c

; func_020_4BFF::
    ld   hl, wEntitiesTransitionCountdownTable    ; $4BFF: $21 $E0 $C2
    add  hl, de                                   ; $4C02: $19
    ld   [hl], $28                                ; $4C03: $36 $28
    ld   c, $04                                   ; $4C05: $0E $04
    ld   b, $00                                   ; $4C07: $06 $00
    ldh  a, [hPressedButtonsMask]                 ; $4C09: $F0 $CB

jr_020_4C0B:
    srl  a                                        ; $4C0B: $CB $3F
    jr   nc, jr_020_4C10                          ; $4C0D: $30 $01

    inc  b                                        ; $4C0F: $04

jr_020_4C10:
    dec  c                                        ; $4C10: $0D
    jr   nz, jr_020_4C0B                          ; $4C11: $20 $F8

    ld   a, b                                     ; $4C13: $78
    cp   $02                                      ; $4C14: $FE $02
    jr   c, jr_020_4C3E                           ; $4C16: $38 $26

    ldh  a, [hPressedButtonsMask]                 ; $4C18: $F0 $CB
    and  $03                                      ; $4C1A: $E6 $03
    ld   c, a                                     ; $4C1C: $4F
    ld   b, $00                                   ; $4C1D: $06 $00
    ld   hl, Data_020_4BF9 - 1                    ; $4C1F: $21 $F8 $4B
    add  hl, bc                                   ; $4C22: $09
    ld   a, [hl]                                  ; $4C23: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4C24: $21 $40 $C2
    add  hl, de                                   ; $4C27: $19
    ld   [hl], a                                  ; $4C28: $77
    ldh  a, [hPressedButtonsMask]                 ; $4C29: $F0 $CB
    srl  a                                        ; $4C2B: $CB $3F
    srl  a                                        ; $4C2D: $CB $3F
    and  $03                                      ; $4C2F: $E6 $03
    ld   c, a                                     ; $4C31: $4F
    ld   b, $00                                   ; $4C32: $06 $00
    ld   hl, Data_020_4BFB                        ; $4C34: $21 $FB $4B
    add  hl, bc                                   ; $4C37: $09
    ld   a, [hl]                                  ; $4C38: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4C39: $21 $50 $C2
    add  hl, de                                   ; $4C3C: $19
    ld   [hl], a                                  ; $4C3D: $77

jr_020_4C3E:
    ret                                           ; $4C3E: $C9


data_139D::
    db   0, 0, 0, 0

data_13A1::
    db   0, 0, 0, 0

data_13A5::
    db   $20, $E0, 0, 0

data_13A9::
    db   0, 0, $E0, $20

data_13AD::
    db   $30, $D0, 0, 0, $40, $C0, 0, 0

data_13B5::
    db   0, 0, $D0, $30, 0, 0, $C0, $40

ShootArrow::
    ld   a, [wIsShootingArrow]
    and  a
    ret  nz
    ld   a, [wActiveProjectileCount]
    cp   $02
    jr   nc, label_142E
    ld   a, $10
    ld   [wIsShootingArrow], a
    ld   a, [wArrowCount]
    and  a
    jp   z, PlayWrongAnswerJingle
    sub  a, $01
    daa
    ld   [wArrowCount], a
    call func_157C
    ld   a, ENTITY_ARROW
    call SpawnPlayerProjectile
    ret  c
    ld   a, e
    ld   [$C1C2], a
    ld   a, [wBombArrowCooldown]
    and  a
    jr   z, label_1401
    ld   a, [$C1C1]
    ld   c, a
    ld   b, d
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   [hl], b
    ld   hl, $C290
    add  hl, de
    ld   [hl], $01
    xor  a
    jr   label_1407

label_1401::
    ld   a, NOISE_SFX_SHOOT_ARROW
    ldh  [hNoiseSfx], a
    ld   a, $06

label_1407::
    ld   [wBombArrowCooldown], a
    ldh  a, [hLinkDirection]
    ld   c, a
    ld   b, $00

label_140F::
    ld   a, [wActivePowerUp]
    cp   $01
    jr   nz, label_141A
    ld   a, c
    add  a, $04
    ld   c, a

label_141A::
    ld   hl, data_13AD
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesSpeedXTable
    add  hl, de
    ld   [hl], a
    ld   hl, data_13B5
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesSpeedYTable
    add  hl, de
    ld   [hl], a

label_142E::
    ret

; Spawn a arrow, liftable rock, hookshot element…
; with the same X, Y, Z and speed than the player.
SpawnPlayerProjectile::
    call SpawnNewEntity_trampoline
    ret  c

    ld   a, $0C
    ld   [$C19B], a
    push bc
    ldh  a, [hLinkDirection]
    ld   c, a
    ld   b, $00
    ld   hl, data_139D
    add  hl, bc
    ldh  a, [hLinkPositionX]
    add  a, [hl]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ld   hl, data_13A1
    add  hl, bc
    ldh  a, [hLinkPositionY]
    add  a, [hl]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkPositionZ]
    inc  a
    ld   hl, wEntitiesPosZTable
    add  hl, de
    ld   [hl], a
    ld   hl, data_13A5
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesSpeedXTable
    add  hl, de
    ld   [hl], a
    ld   hl, data_13A9
    add  hl, bc
    ld   a, [hl]
    ld   hl, wEntitiesSpeedYTable
    add  hl, de
    ld   [hl], a
    ldh  a, [hLinkDirection]
    ld   hl, $C3B0
    add  hl, de
    ld   [hl], a
    ld   hl, wEntitiesDirectionTable
    add  hl, de
    ld   [hl], a
    ld   hl, $C5D0
    add  hl, de
    ld   [hl], a
    ld   hl, wEntitiesUnknowTableJ
    add  hl, de
    ld   [hl], $01
    pop  bc
    scf
    ccf
    ret


Data_020_4C3F::
    db   $0E, $F2, $00, $00

Data_020_4C43::
    db   $00, $00, $F4, $0C


UseMagicPowder::
    ld   a, [$C19B]
    and  a
    ret  nz
    ld   a, [wHasToadstool]
    and  a
    jr   z, .jr_14A7
    ldh  a, [hLinkPositionZ]
    and  a
    ret  nz
    ld   a, $02
    ld   [wDialogGotItem], a
    ld   a, $2A
    ld   [wDialogGotItemCountdown], a
    ret

.jr_14A7
    ld   a, [wMagicPowderCount]
    and  a
    jp   z, PlayWrongAnswerJingle

    ld   a, ENTITY_MAGIC_POWDER_SPRINKLE
    call SpawnNewEntity_trampoline
    ret  c

; func_020_4C47::
    ld   a, JINGLE_POWDER                         ; $4C47: $3E $05
    ldh  [hJingle], a                             ; $4C49: $E0 $F2
    ld   a, $0E                                   ; $4C4B: $3E $0E
    ld   [$C19B], a                               ; $4C4D: $EA $9B $C1
    ld   a, [wMagicPowderCount]                   ; $4C50: $FA $4C $DB
    sub  $01                                      ; $4C53: $D6 $01
    daa                                           ; $4C55: $27
    ld   [wMagicPowderCount], a                   ; $4C56: $EA $4C $DB
    jr   nz, jr_020_4C6D                          ; $4C59: $20 $12

    ld   hl, wBButtonSlot                         ; $4C5B: $21 $00 $DB
    ld   a, [hl]                                  ; $4C5E: $7E
    cp   $0C                                      ; $4C5F: $FE $0C
    jr   nz, jr_020_4C65                          ; $4C61: $20 $02

    ld   [hl], $00                                ; $4C63: $36 $00

jr_020_4C65:
    inc  hl                                       ; $4C65: $23
    ld   a, [hl]                                  ; $4C66: $7E
    cp   $0C                                      ; $4C67: $FE $0C
    jr   nz, jr_020_4C6D                          ; $4C69: $20 $02

    ld   [hl], $00                                ; $4C6B: $36 $00

jr_020_4C6D:
    push bc                                       ; $4C6D: $C5
    ldh  a, [hLinkDirection]                      ; $4C6E: $F0 $9E
    ld   c, a                                     ; $4C70: $4F
    ld   hl, Data_020_4C3F                        ; $4C71: $21 $3F $4C
    add  hl, bc                                   ; $4C74: $09
    ldh  a, [hLinkPositionX]                      ; $4C75: $F0 $98
    add  [hl]                                     ; $4C77: $86
    ld   hl, wEntitiesPosXTable                   ; $4C78: $21 $00 $C2
    add  hl, de                                   ; $4C7B: $19
    ld   [hl], a                                  ; $4C7C: $77
    ld   hl, Data_020_4C43                        ; $4C7D: $21 $43 $4C
    add  hl, bc                                   ; $4C80: $09
    ldh  a, [hLinkPositionY]                      ; $4C81: $F0 $99
    add  [hl]                                     ; $4C83: $86
    ld   hl, wEntitiesPosYTable                   ; $4C84: $21 $10 $C2
    add  hl, de                                   ; $4C87: $19
    ld   [hl], a                                  ; $4C88: $77
    ldh  a, [hLinkPositionZ]                      ; $4C89: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $4C8B: $21 $10 $C3
    add  hl, de                                   ; $4C8E: $19
    ld   [hl], a                                  ; $4C8F: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4C90: $21 $E0 $C2
    add  hl, de                                   ; $4C93: $19
    ld   [hl], $17                                ; $4C94: $36 $17
    pop  bc                                       ; $4C96: $C1
    ret                                           ; $4C97: $C9

data_14C3::
    db $1C, $E4, 0, 0

data_14C7::
    db 0, 0, $E4, $1C

UseRocsFeather::
    ld   a, [$C130]
    cp   $07
    ret  z
    ld   a, [$C146]
    and  a
    ret  nz
    ld   a, $01
    ld   [$C146], a
    xor  a
    ld   [$C152], a
    ld   [$C153], a
    ld   a, JINGLE_FEATHER_JUMP
    ldh  [hJingle], a
    ldh  a, [hIsSideScrolling]
    and  a
    jr   z, label_1508
    call label_1508
    ldh  a, [hPressedButtonsMask]
    and  J_LEFT | J_RIGHT
    ld   a, $EA
    jr   z, label_14F8
    ld   a, $E8

label_14F8::
    ldh  [hLinkPositionYIncrement], a
    xor  a
    ldh  [$FFA3], a
    call UpdateFinalLinkPosition
    callsw CheckPositionForMapTransition
    ret

label_1508::
    ld   a, $20
    ldh  [$FFA3], a
    ld   a, [wIsRunningWithPegasusBoots]
    and  a
    ret  z
    ldh  a, [hLinkDirection]
    ld   e, a
    ld   d, b
    ld   hl, data_14C3
    add  hl, de
    ld   a, [hl]
    ldh  [hLinkPositionXIncrement], a
    ld   hl, data_14C7
    add  hl, de
    ld   a, [hl]
    ldh  [hLinkPositionYIncrement], a

label_1523::
    ret

SwordRandomSfxTable::
    db   NOISE_SFX_SWORD_A, NOISE_SFX_SWORD_B, NOISE_SFX_SWORD_C, NOISE_SFX_SWORD_D

UseSword::
    ld   a, [$C16D]
    ld   hl, wIsUsingSpinAttack
    or   [hl]
    ret  nz
    ld   a, $03
    ld   [$C138], a

label_1535::
    ld   a, $01
    ld   [wSwordAnimationState], a
    ld   [$C5B0], a
    xor  a
    ld   [$C160], a
    ld   [$C1AC], a

    ; Play a random SFX
    call GetRandomByte
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, SwordRandomSfxTable
    add  hl, de
    ld   a, [hl]
    ldh  [hNoiseSfx], a

    call func_157C
    ld   a, [$C146]
    and  a
    jr   nz, label_1562
    call ResetSpinAttack
    call ClearLinkPositionIncrement

label_1562::
    ld   a, [wActiveProjectileCount]
    and  a
    ret  nz
    ld   a, [$C5A9]
    and  a
    ret  z
    ld   a, [wSwordLevel]
    cp   $02
    ret  nz
    ld   a, ENTITY_SWORD_BEAM
    call SpawnPlayerProjectile
    xor  a
    ld   [$C19B], a
    ret

func_157C::
    ldh  a, [hPressedButtonsMask]
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN
    ld   e, a
    ld   d, $00
    ld   hl, Data_002_4905
    add  hl, de
    ld   a, [hl]
    cp   $0F
    jr   z, .return
    ldh  [hLinkDirection], a
.return
    ret

SwordCollisionMapX::
    ; Single sword swing (right-left-top-bottom)
    db $16, $FA, $08, $08
    ; Spin attack (anti-clockwise from right)
    db $16, $16, $08, $FA, $FA, $FA, $08, $16

SwordCollisionMapY::
    ; Single sword swing (right-left-top-bottom)
    db $08, $08, $FA, $16
    ; Spin attack (anti-clockwise from right)
    db $08, $16, $16, $16, $08, $FA, $FA, $FA

; Check sword collisions with static elements and objects, then return to bank 2
CheckStaticSwordCollision_trampoline::
    call CheckStaticSwordCollision
    ld   a, $02
    jp   SwitchBank

; Check sword collision with static elements (bushes, grasses)
; and items lying on the floor.
CheckStaticSwordCollision::
    ld   a, [$C1C4]
    and  a
    ret  nz
    ld   a, [wIsRunningWithPegasusBoots]
    and  a
    jr   nz, .label_15C0
    ld   a, [$C16A]
    cp   $05
    ret  z
.label_15C0

    ; a = IsUsingSpinAttack ? (SwordDirection + 4) : LinkDirection
    ld   a, [wIsUsingSpinAttack]
    and  a
    jr   z, .notSpinning
    ld   a, [wSwordDirection]
    add  a, $04
    jr   .end
.notSpinning
    ldh  a, [hLinkDirection]
.end

    ; Compute the horizontal intersected area
    ld   e, a
    ld   d, $00
    ld   hl, SwordCollisionMapX
    add  hl, de
    ldh  a, [hLinkPositionX]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ldh  [hSwordIntersectedAreaX], a

    ; Compute the vertical intersected area
    swap a
    ld   c, a
    ld   hl, SwordCollisionMapY
    add  hl, de
    ldh  a, [hLinkPositionY]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ldh  [hSwordIntersectedAreaY], a
    or   c
    ld   e, a
    ld   hl, wRoomObjects
    add  hl, de
    ld   a, h
    cp   $D7
    ret  nz
    push de
    ld   a, [hl]
    ldh  [hObjectUnderEntity], a
    ld   e, a
    ld   a, [wIsIndoor]
    ld   d, a
    call GetObjectPhysicsFlags_trampoline
    pop  de

    cp   $D0
    jp   c, .label_1610

    cp   $D4
    jp   c, CheckItemsSwordCollision

.label_1610
    cp   $90
    jp   nc, CheckItemsSwordCollision

    cp   $01
    jp   z, CheckItemsSwordCollision

    ld   c, $00
    ld   a, [wIsIndoor]
    and  a
    ldh  a, [hObjectUnderEntity]
    jr   z, label_1629

    cp   $DD
    jr   z, label_1637

    ret

label_1629::
    inc  c
    cp   $D3
    jr   z, label_1637
    cp   $5C
    jr   z, label_1637
    cp   $0A
    ret  nz
    ld   c, $FF

label_1637::
    ld   a, c
    ldh  [hActiveEntitySpriteVariant], a
    call func_014_5526_trampoline
    ld   a, [wIsRunningWithPegasusBoots]
    and  a
    jr   nz, label_1653
    ld   a, [$C16A]
    cp   $05
    jr   nz, label_1653
    xor  a
    ld   [wSwordCharge], a
    ld   a, $0C
    ld   [$C16D], a

label_1653::
    ld   a, ENTITY_ENTITY_LIFTABLE_ROCK
    call SpawnPlayerProjectile
    jr   c, .dropRandomItem
    xor  a
    ld   [$C19B], a
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ldh  a, [hSwordIntersectedAreaX]
    add  a, $08
    ld   [hl], a
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ldh  a, [hSwordIntersectedAreaY]
    add  a, $10
    ld   [hl], a
    ld   hl, $C3B0
    add  hl, de
    ldh  a, [hActiveEntitySpriteVariant]
    ld   [hl], a
    ld   c, e
    ld   b, d
    call label_3942

.dropRandomItem
    ; In some random cases, don't drop anything.
    ; (~ 1/8 chance to drop an item)
    call GetRandomByte
    and  $07
    ret  nz

    ; If stairs are hiding behind the cut bush, don't drop anything.
    ldh  a, [hObjectUnderEntity]
    cp   OBJECT_BUSH_GROUND_STAIRS
    ret  z

    ; Randomly drop a rupee or heart
    call GetRandomByte
    rra
    ld   a, ENTITY_DROPPABLE_RUPEE
    jr   nc, .randomEnd
    ld   a, ENTITY_DROPPABLE_HEART
.randomEnd
    call SpawnNewEntity_trampoline
    ret  c

    ; Configure the dropped entity
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ldh  a, [hSwordIntersectedAreaX]
    add  a, $08
    ld   [hl], a
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ldh  a, [hSwordIntersectedAreaY]
    add  a, $10
    ld   [hl], a
    ld   hl, wEntitiesDropTimerTable
    add  hl, de
    ld   [hl], $80
    ld   hl, $C2F0
    add  hl, de
    ld   [hl], $18
    ld   hl, wEntitiesSpeedZTable
    add  hl, de
    ld   [hl], $10
    ret

data_16BA::
    db $12, $EE, $FC, 4

data_16BE::
    db 4, 4, $EE, $12

; Check sword collision with items lying on the ground
CheckItemsSwordCollision::
    ld   c, a
    ld   a, [$C16D]
    and  a
    ret  z
    ldh  a, [hLinkDirection]
    ld   e, a
    ld   d, $00
    ld   hl, data_16BA
    add  hl, de
    ldh  a, [hLinkPositionX]
    add  a, [hl]
    ldh  [hScratch0], a
    ld   hl, data_16BE
    add  hl, de
    ldh  a, [hLinkPositionY]
    add  a, [hl]
    ldh  [hScratch1], a
    ld   a, $04
    ld   [$C502], a
    call label_D15
    ld   a, $10
    ld   [$C1C4], a
    ld   a, c
    and  $F0
    cp   $90
    jr   z, .label_16F8
    ld   a, JINGLE_SWORD_POKING
    ldh  [hJingle], a
    ret

.label_16F8
    ld   a, $17
    ldh  [hNoiseSfx], a
    ret

data_16FD::
    db   $20, $E0, 0, 0

data_1701::
    db   0, 0, $E0, $20

UsePegasusBoots::
    ldh  a, [hIsSideScrolling]
    and  a
    jr   z, .label_1713
    ldh  a, [$FF9C]
    and  a
    ret  nz
    ldh  a, [hLinkDirection]
    and  $02
    ret  nz

.label_1713
    ld   a, [wIsRunningWithPegasusBoots]
    and  a
    ret  nz
    ldh  a, [hLinkPositionZ]
    ld   hl, $C146
    or   [hl]
    ret  nz
    ld   a, [wConsecutiveStepsCount]
    add  a, $02
    ld   [wConsecutiveStepsCount], a
    call func_1756
    ld   a, [wPegasusBootsChargeMeter]
    inc  a
    ld   [wPegasusBootsChargeMeter], a
    cp   $20
    ret  nz
    ld   [wIsRunningWithPegasusBoots], a
    xor  a
    ld   [wIsUsingSpinAttack], a
    ld   [wSwordCharge], a
    ldh  a, [hLinkDirection]
    ld   e, a
    ld   d, $00
    ld   hl, data_16FD
    add  hl, de
    ld   a, [hl]
    ldh  [hLinkPositionXIncrement], a
    ld   hl, data_1701
    add  hl, de
    ld   a, [hl]
    ldh  [hLinkPositionYIncrement], a
    xor  a
    ld   [$C1AC], a
    ret

func_1756::
    ldh  a, [hFrameCounter]
    and  $07
    ld   hl, hLinkPositionZ
    or   [hl]
    ld   hl, hLinkInteractiveMotionBlocked
    or   [hl]
    ld   hl, $C146
    or   [hl]
    ret  nz

    ldh  a, [hLinkPositionX]
    ldh  [hScratch0], a

    ld   a, [wLinkGroundVfx]
    cp   GROUND_VFX_SHALLOW_WATER
    jr   z, .shallowWater

    ld   a, NOISE_SFX_FOOTSTEP
    ldh  [hNoiseSfx], a
    ldh  a, [hLinkPositionY]
    add  a, $06
    ldh  [hScratch1], a
    ld   a, TRANSCIENT_VFX_PEGASUS_DUST
    jp   AddTranscientVfx

.shallowWater
    ldh  a, [hLinkPositionY]
    ldh  [hScratch1], a
    ld   a, JINGLE_WATER_DIVE
    ldh  [hJingle], a
    ld   a, TRANSCIENT_VFX_PEGASUS_SPLASH
    jp   AddTranscientVfx

ClearLinkPositionIncrement::
    xor  a
    ldh  [hLinkPositionXIncrement], a
    ldh  [hLinkPositionYIncrement], a
    ret

; Animate Link motion?
ApplyLinkMotionState::
    call func_002_753A
.skipInitialCall
    ld   a, [wLinkMotionState]
    cp   $01
    ret  z
    ld   a, [$C16A]
    and  a
    jr   z, .label_17DB
    ld   bc, $C010
    ld   a, [$C145]
    ld   hl, $C13B
    add  a, [hl]
    ldh  [hScratch0], a
    ldh  a, [hLinkPositionX]
    ldh  [hScratch1], a
    ld   hl, hScratch3
    ld   [hl], $00
    ld   a, [wSwordCharge]
    cp   $28
    jr   c, .label_17C6
    ldh  a, [hFrameCounter]
    rla
    rla
    and  $10
    ld   [hl], a

.label_17C6
    ld   a, [$C139]
    ld   h, a
    ld   a, [$C13A]
    ld   l, a
    ld   a, [wSwordDirection]
    ldh  [hScratch2], a
    ldh  a, [hLinkPositionY]
    cp   $88
    ret  nc
    jp   func_1819

.label_17DB
    ld   a, [$C19B]
    push af
    bit  7, a
    jp   z, .magicRodEnd
    callsw label_002_5310
    ld   a, [$C19B]
    and  $7F
    cp   $0C
    jr   nz, .magicRodEnd
    ld   hl, wDialogState
    ld   a, [wRoomTransitionState]
    or   [hl]
    jr   nz, .magicRodEnd
    call func_157C
    ld   a, ENTITY_HOOKSHOT_HIT
    call SpawnPlayerProjectile
    jr   c, .magicRodEnd
    ld   a, NOISE_SFX_MAGIC_ROD
    ldh  [hNoiseSfx], a
    callsw label_002_538B
.magicRodEnd

    pop  af
    ld   [$C19B], a
    ret


Data_020_4A93::
    db   $08

Data_020_4A94::
    db   $06, $0C, $0A, $FF, $04, $0A, $0C, $06, $08, $0A, $0C, $FF, $04, $0C, $0A

Data_020_4AA3::
    db   $20

Data_020_4AA4::
    db   $20, $60, $60, $00, $00, $40, $40, $00, $00, $00, $00, $40, $40, $20, $20

func_1819::

; func_020_4AB3::
    push hl                                       ; $4AB3: $E5
    ldh  a, [hScratch0]                           ; $4AB4: $F0 $D7
    add  h                                        ; $4AB6: $84
    ld   [bc], a                                  ; $4AB7: $02
    inc  bc                                       ; $4AB8: $03
    ldh  a, [hScratch1]                           ; $4AB9: $F0 $D8
    add  l                                        ; $4ABB: $85
    ld   [bc], a                                  ; $4ABC: $02
    inc  bc                                       ; $4ABD: $03
    ld   hl, Data_020_4A93                        ; $4ABE: $21 $93 $4A
    ldh  a, [hScratch2]                           ; $4AC1: $F0 $D9
    sla  a                                        ; $4AC3: $CB $27
    ld   e, a                                     ; $4AC5: $5F
    ld   d, $00                                   ; $4AC6: $16 $00
    add  hl, de                                   ; $4AC8: $19
    ld   a, [hl]                                  ; $4AC9: $7E
    ld   [bc], a                                  ; $4ACA: $02
    cp   $FF                                      ; $4ACB: $FE $FF
    jr   nz, jr_020_4AD4                          ; $4ACD: $20 $05

    dec  bc                                       ; $4ACF: $0B
    ld   a, $F0                                   ; $4AD0: $3E $F0
    ld   [bc], a                                  ; $4AD2: $02
    inc  bc                                       ; $4AD3: $03

jr_020_4AD4:
    inc  bc                                       ; $4AD4: $03
    ld   hl, Data_020_4AA3                        ; $4AD5: $21 $A3 $4A
    add  hl, de                                   ; $4AD8: $19
    ld   a, [hl]                                  ; $4AD9: $7E
    ld   hl, hScratch3                            ; $4ADA: $21 $DA $FF
    or   [hl]                                     ; $4ADD: $B6
    ld   [bc], a                                  ; $4ADE: $02

    inc  bc                                       ; $4AEF: $03
    pop  hl                                       ; $4AF0: $E1
    ldh  a, [hScratch0]                           ; $4AF1: $F0 $D7
    add  h                                        ; $4AF3: $84
    ld   [bc], a                                  ; $4AF4: $02
    inc  bc                                       ; $4AF5: $03
    ldh  a, [hScratch1]                           ; $4AF6: $F0 $D8
    add  l                                        ; $4AF8: $85
    add  $08                                      ; $4AF9: $C6 $08
    ld   [bc], a                                  ; $4AFB: $02
    inc  bc                                       ; $4AFC: $03
    ld   hl, Data_020_4A94                        ; $4AFD: $21 $94 $4A
    add  hl, de                                   ; $4B00: $19
    ld   a, [hl]                                  ; $4B01: $7E
    ld   [bc], a                                  ; $4B02: $02
    inc  bc                                       ; $4B03: $03
    ld   hl, Data_020_4AA4                        ; $4B04: $21 $A4 $4A
    add  hl, de                                   ; $4B07: $19
    ld   a, [hl]                                  ; $4B08: $7E
    ld   hl, hScratch3                            ; $4B09: $21 $DA $FF
    or   [hl]                                     ; $4B0C: $B6
    ld   [bc], a                                  ; $4B0D: $02

    ret                                           ; $4B1E: $C9


Data_020_49B2::
    db   $10, $F0, $08, $08

Data_020_49B6::
    db   $0C, $0C, $F0, $10


func_1828::
; func_020_49BA::
    ldh  a, [hLinkDirection]                      ; $49BA: $F0 $9E
    ld   e, a                                     ; $49BC: $5F
    ld   d, $00                                   ; $49BD: $16 $00
    ld   hl, Data_020_49B2                        ; $49BF: $21 $B2 $49
    add  hl, de                                   ; $49C2: $19
    ldh  a, [hLinkPositionX]                      ; $49C3: $F0 $98
    add  [hl]                                     ; $49C5: $86
    ld   [wC179], a                               ; $49C6: $EA $79 $C1
    ld   hl, Data_020_49B6                        ; $49C9: $21 $B6 $49
    add  hl, de                                   ; $49CC: $19
    ldh  a, [hLinkPositionY]                      ; $49CD: $F0 $99
    add  [hl]                                     ; $49CF: $86
    ld   [wC17a], a                               ; $49D0: $EA $7A $C1
    ld   a, $02                                   ; $49D3: $3E $02
    ld   [wC178], a                               ; $49D5: $EA $78 $C1
    ret                                           ; $49D8: $C9


LinkMotionMapFadeOutHandler::
    call func_002_754F
    ld   a, [$C3C9]
    and  a
    jr   z, .label_1847
    xor  a
    ld   [$C3C9], a
    jp   ApplyMapFadeOutTransition

.label_1847
    call func_1A22
    xor  a
    ld   [$C157], a
    inc  a
    ld   [$C1A8], a
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    jp   nz, SetSpawnLocation.return
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [hBaseScrollY], a
    ldh  [$FFB4], a

    ld   e, $10
    ld   hl, wEntitiesStatusTable
.clearEntitiesStatusLoop
    ldi  [hl], a
    dec  e
    jr   nz, .clearEntitiesStatusLoop

    ld   a, [wItemPickedUpInShop]
    and  a
    jr   z, .label_1898
    push af
    ld   a, BANK(label_004_7A5F)
    call SwitchBank
    pop  af
    call label_004_7A5F
    ld   hl, wIsThief
    inc  [hl]
    ld   hl, wHasStolenFromShop
    inc  [hl]
    ld   a, $01
    ld   [wDidStealItem], a
    xor  a
    ldh  [hLinkAnimationState], a

.label_1898
    ldh  a, [hIsSideScrolling]
    ldh  [hScratchD], a
    ld   a, GAMEPLAY_WORLD
    ld   [wGameplayType], a
    xor  a
    ld   [wGameplaySubtype], a
    ld   [wObjectAffectingBGPalette], a
    ldh  [hIsSideScrolling], a
    ld   hl, wWarpStructs
    ld   a, [wIsIndoor]
    ldh  [hFreeWarpDataAddress], a
    and  a
    jr   nz, .label_18DF
    ld   hl, wWarpPositions
    ld   c, $00

.loop
    ldh  a, [hLinkPositionX]
    swap a
    and  $0F
    ld   e, a
    ldh  a, [hLinkPositionY]
    sub  a, $08
    and  $F0
    or   e
    cp   [hl]
    jr   z, .break
    inc  hl
    inc  c
    ld   a, c
    cp   $04
    jr   nz, .loop

.break
    ld   a, c
    sla  a
    sla  a
    add  a, c
    ld   e, a
    ld   d, $00
    ld   hl, wWarp0MapCategory
    add  hl, de

.label_18DF
    push hl
    ld   a, [hli]
    ld   [wIsIndoor], a
    cp   $02
    jr   nz, .label_18F2
    ldh  [hIsSideScrolling], a
    dec  a
    ld   [wIsIndoor], a
    ld   a, $01
    ldh  [$FF9C], a

.label_18F2
    ld   a, [hli]
    ldh  [hMapId], a
    ld   a, [wIsIndoor]
    and  a
    ld   a, [hli]
    ldh  [hMapRoom], a
    jr   nz, .label_1909
    ldh  a, [hFreeWarpDataAddress]
    and  a
    jr   z, .label_1907
    xor  a
    ld   [wActivePowerUp], a            ; Clear any active powerup on room change

.label_1907
    jr   .label_196F

.label_1909
    ld   c, a
    ld   a, $14
    call SwitchBank
    push hl
    ldh  a, [hMapId]
    swap a
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, MapLayout0
    add  hl, de
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER           ; Is this Eagle's Tower?
    jr   nz, .label_193C            ; If not, skip this...
    ld   a, [wHasInstrument7]       ; Otherwise, check if the pillars have all been dunked...
    and  $04
    jr   z, .label_193C             ; If not, skip this...
    ld   hl, MapLayout12            ; Otherwise, swap to the alternate Eagle's Tower map (post-3F collapse)

.label_193C
    ld   e, $00

.loop_193E
    ld   a, [hli]
    cp   c
    jr   z, .break_1948
    inc  e
    ld   a, e
    cp   $40
    jr   nz, .loop_193E
.break_1948

    ld   a, e
    ld   [wIndoorRoom], a
    ldh  a, [hFreeWarpDataAddress]
    and  a
    jr   nz, .label_196E
    xor  a
    ld   [wActivePowerUp], a        ; Clear any active powerup
    ldh  a, [hMapId]
    cp   MAP_CAVE_B
    jr   nc, .label_196E
    callsw IsMapRoomE8              ; @TODO Either Eagle's Tower boss room bottom half or Yarna Desert quicksand pit
    ld   a, $30
    ldh  [$FFB4], a
    xor  a
    ld   [$D6FB], a
    ld   [$D6F8], a

.label_196E
    pop  hl

.label_196F
    ld   a, [hli]
    ld   [wMapEntrancePositionX], a
    ld   a, [hl]
    ld   [wMapEntrancePositionY], a
    pop  hl
    ldh  a, [hIsSideScrolling]
    and  a
    jr   nz, label_19DA
    ldh  a, [hScratchD]
    and  a
    jr   nz, SetSpawnLocation.return
    ld   a, [wIsIndoor]
    and  a
    jr   z, SetSpawnLocation
    ldh  a, [hMapId]

IF 0
    cp   MAP_COLOR_DUNGEON
    jr   nz, .label_1993
    ld   hl, Data_014_4E3C
    jr   .label_19A4
.label_1993
ENDC
    cp   $0A
    jr   nc, SetSpawnLocation
    ld   e, a
    sla  a
    sla  a
    add  a, e
    ld   e, a
    ld   d, $00
    ld   hl, Data_014_4DF1
    add  hl, de

.label_19A4
    ld   a, $14
    ld   [MBC3SelectBank], a
    call SetSpawnLocation
    push de
    ldh  a, [hMapId]
IF 0
    cp   MAP_COLOR_DUNGEON
    jr   nz, .label_19B7
    ld   a, $3A
    jr   .label_19BF

.label_19B7
ENDC
    ld   e, a
    ld   d, $00
    ld   hl, Data_014_4E41
    add  hl, de
    ld   a, [hl]

.label_19BF
    pop  de
    ld   [de], a
    ret

; Record Link's spawn point, that will be used when loading the save file
; or starting after a game over.
SetSpawnLocation::
    ; Initialize counter
    ld   a, $00
    ldh  [hScratch0], a
    ld   de, wSpawnLocationData

    ; Copy warp data (5 bytes) from wWarp1 to wSpawnLocationData
.loop
    ld   a, [hli]
    ld   [de], a
    inc  de
    ldh  a, [hScratch0]
    inc  a
    ldh  [hScratch0], a
    cp   $05
    jr   nz, .loop

    ; Save the indoor room
    ld   a, [wIndoorRoom]
    ld   [de], a

.return
    ret

label_19DA::
    xor  a
    ldh  [hLinkDirection], a
    ret

LinkMotionMapFadeInHandler::
    call func_002_754F
    ld   a, [$D474]
    and  a
    jr   z, .label_19FC
    xor  a
    ld   [$D474], a
    ld   a, $30
    ld   [$C180], a
    ld   a, TRANSITION_GFX_MANBO_OUT
    ld   [wTransitionGfx], a
    ld   a, $04
    ld   [wTransitionSequenceCounter], a
    jr   .label_1A06

.label_19FC
    call func_1A39
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    jr   nz, .return

.label_1A06
    ld   a, [$D463]
    cp   $01
    jr   z, .label_1A0F
    ld   a, $00

.label_1A0F
    ld   [wLinkMotionState], a
    ld   a, [wDidStealItem]
    and  a
    jr   z, .return
    xor  a
    ld   [wDidStealItem], a
    ld   a, $36
    call   OpenDialog

.return
    ret

func_1A22::
    ; callsb func_020_6C4F
    ; callsb func_020_55CA
    ; ld   a, [wCurrentBank]
    ; ld   [MBC3SelectBank], a
    ; ret

func_1A39::
    ; callsb func_020_6C7A
    ; callsb func_020_563B

; func_020_563B::
    ld   hl, wC16C                                ; $563B: $21 $6C $C1
    inc  [hl]                                     ; $563E: $34
    ld   a, [wC16C]                               ; $563F: $FA $6C $C1
    and  $03                                      ; $5642: $E6 $03
    jr   nz, jr_020_568A                          ; $5644: $20 $44

    ld   hl, wTransitionSequenceCounter           ; $5646: $21 $6B $C1

label_020_5649:
    ld   a, [hl]                                  ; $5649: $7E
    inc  [hl]                                     ; $564A: $34

func_020_564B::
    cp   $04                                      ; $564B: $FE $04
    jr   z, jr_020_568A                           ; $564D: $28 $3B

    xor  a                                        ; $564F: $AF
    ldh  [hScratch0], a                           ; $5650: $E0 $D7

jr_020_5652:
    ldh  a, [hScratch0]                           ; $5652: $F0 $D7
    cp   $03                                      ; $5654: $FE $03
    jr   z, jr_020_568A                           ; $5656: $28 $32

    ld   hl, wBGPalette                           ; $5658: $21 $97 $DB
    ld   e, a                                     ; $565B: $5F
    ld   d, $00                                   ; $565C: $16 $00
    add  hl, de                                   ; $565E: $19
    ld   a, [hl]                                  ; $565F: $7E
    ld   c, a                                     ; $5661: $4F
    ld   b, $00                                   ; $5662: $06 $00

jr_020_5664:
    ld   a, c                                     ; $5670: $79
    and  $03                                      ; $5671: $E6 $03
    jr   z, jr_020_5677                           ; $5674: $28 $01

    dec  c                                        ; $5676: $0C

jr_020_5677:
    rrc  c                                        ; $5677: $CB $09
    rrc  c                                        ; $5679: $CB $09
    inc  b                                        ; $567B: $04
    ld   a, b                                     ; $567C: $78
    cp   $04                                      ; $567D: $FE $04
    jr   nz, jr_020_5664                          ; $567F: $20 $E3

    ld   a, c                                     ; $5681: $79
    ld   [hl], a                                  ; $5683: $77
    ld   hl, hScratch0                            ; $5684: $21 $D7 $FF
    inc  [hl]                                     ; $5687: $34
    jr   jr_020_5652                              ; $5688: $18 $C8

jr_020_568A:
jr_000_17b6:
    ret                                           ; $568A: $C9

    ; ld   a, [wCurrentBank]
    ; ld   [MBC3SelectBank], a
    ; ret


Data_020_562F::
    db   $00, $01, $02, $03, $00, $03, $01, $00, $00, $01, $02, $03


Call_000_17c3:
    ld hl, wC16C                                  ; $17c3: $21 $6c $c1

    inc [hl]                                      ; $17c6: $34
    ld a, [wC16C]                                 ; $17c7: $fa $6c $c1
    and $03                                       ; $17ca: $e6 $03
    jr nz, jr_000_1812                            ; $17cc: $20 $44

    ld hl, wTransitionSequenceCounter             ; $17ce: $21 $6b $c1
    ld a, [hl]                                    ; $17d1: $7e

    inc [hl]                                      ; $17d2: $34
    cp $04                                        ; $17d3: $fe $04
    jr z, jr_000_17b6                             ; $17d5: $28 $df

    xor a                                         ; $17d7: $af
    ldh [hScratch0], a                            ; $17d8: $e0 $d7

jr_000_17da:
    ldh a, [hScratch0]                            ; $17da: $f0 $d7
    cp $03                                        ; $17dc: $fe $03
    jr z, jr_000_1812                             ; $17de: $28 $32

    ld hl, wBGPalette                             ; $17e0: $21 $97 $db
    ld e, a                                       ; $17e3: $5f
    ld d, $00                                     ; $17e4: $16 $00
    add hl, de                                    ; $17e6: $19
    ld a, [hl]                                    ; $17e7: $7e
    push hl                                       ; $17e8: $e5
    ld c, a                                       ; $17e9: $4f
    ld b, $00                                     ; $17ea: $06 $00

jr_000_17ec:
    ldh a, [hScratch0]                            ; $17ec: $f0 $d7
    sla a                                         ; $17ee: $cb $27
    sla a                                         ; $17f0: $cb $27
    or b                                          ; $17f2: $b0
    ld e, a                                       ; $17f3: $5f
    ld hl, $17b7                                  ; $17f4: $21 $b7 $17
    add hl, de                                    ; $17f7: $19

    ld a, c                                       ; $17f8: $79
    and $03                                       ; $17f9: $e6 $03
    cp [hl]                                       ; $17fb: $be
    jr z, jr_000_17ff                             ; $17fc: $28 $01

    inc c                                         ; $17fe: $0c

jr_000_17ff:
    rrc c                                         ; $17ff: $cb $09
    rrc c                                         ; $1801: $cb $09
    inc b                                         ; $1803: $04
    ld a, b                                       ; $1804: $78
    cp $04                                        ; $1805: $fe $04
    jr nz, jr_000_17ec                            ; $1807: $20 $e3

    ld a, c                                       ; $1809: $79

    pop hl                                        ; $180a: $e1
    ld [hl], a                                    ; $180b: $77
    ld hl, hScratch0                              ; $180c: $21 $d7 $ff
    inc [hl]                                      ; $180f: $34
    jr jr_000_17da                                ; $1810: $18 $c8

jr_000_1812:
    ret                                           ; $1812: $c9


LinkAnimationStateTable::
    db   $00, $02
    db   $02, $00
    db   $10, $02
    db   $12, $00
    db   $04, $06
    db   $06, $04
    db   $08, $0A
    db   $0C, $0E
    db   $18, $0A
    db   $1C, $0E
    db   $0A, $08
    db   $0E, $0C
    db   $0A, $18
    db   $0E, $1C
    db   $20, $22
    db   $24, $26
    db   $28, $2A
    db   $2A, $28
    db   $30, $32
    db   $20, $22
    db   $34, $36
    db   $24, $26
    db   $38, $3A
    db   $28, $2A
    db   $3A, $38
    db   $2A, $28
    db   $40, $40
    db   $42, $42
    db   $44, $46
    db   $48, $4A
    db   $4C, $4E
    db   $50, $52
    db   $4E, $4C
    db   $52, $50
    db   $80, $02
    db   $82, $00
    db   $84, $86
    db   $88, $8A
    db   $8C, $8E
    db   $90, $92
    db   $94, $96
    db   $98, $9A
    db   $9C, $9E
    db   $9A, $A2
    db   $A4, $08
    db   $A6, $0C
    db   $A8, $AA
    db   $AC, $AE
    db   $B0, $B2
    db   $B4, $B6
    db   $B0, $B2
    db   $B4, $B6
    db   $04, $C0
    db   $06, $C2
    db   $5A, $58
    db   $5E, $5C
    db   $58, $5A
    db   $5C, $5E
    db   $44, $46
    db   $6E, $6E
    db   $40, $40
    db   $56, $56
    db   $7A, $78
    db   $7E, $7C
    db   $78, $7A
    db   $7C, $7E
    db   $74, $76
    db   $76, $74
    db   $70, $72
    db   $72, $70
    db   $CA, $C8
    db   $D6, $D4
    db   $C8, $CA
    db   $D4, $D6
    db   $CC, $CE
    db   $D8, $DA
    db   $C4, $C4
    db   $C6, $C6
    db   $DC, $DC
    db   $DE, $DE
    db   $EA, $EC
    db   $EE, $F0
    db   $F2, $F4
    db   $F6, $F6
    db   $F8, $FA
    db   $E0, $E2
    db   $E4, $E6
    db   $E8, $E8
    db   $10, $12
    db   $14, $16
    db   $18, $1C
    db   $12, $10
    db   $16, $14
    db   $1C, $18
    db   $66, $68
    db   $6A, $6C
    db   $68, $66
    db   $68, $66
    db   $6C, $6A
    db   $66, $68
    db   $60, $60
    db   $62, $62
    db   $64, $64
    db   $62, $62
    db   $64, $64
    db   $60, $60
    db   $54, $54
    db   $3C, $3E
    db   $FE, $FE
    db   $18, $1A
    db   $1C, $1E
    db   $2C, $2E
    db   $B8, $BA
    db   $2E, $2C
    db   $BA, $B8
    db   $BC, $BE
    db   $D0, $D2
    db   $A0, $FC
    db   $FC, $A0


data_020_5407::
; Called from SkipTilesGroupAnimation
    db   $00, $00, $20, $20, $00, $00, $00, $20, $00, $00, $20, $20, $00, $00, $00, $00
    db   $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $00, $00
    db   $00, $00, $20, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $20, $20, $20, $20, $00, $20, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00
    db   $20, $20, $20, $20, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $20, $00, $00, $20, $00, $20, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $20, $20, $20, $20
    db   $00, $00, $00, $00, $00, $00, $00, $20, $00, $20, $00, $20, $20, $20, $20, $20
    db   $00, $00, $00, $00, $00, $00, $20, $20, $00, $00, $20, $20, $20, $20, $20, $20
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $20, $00, $20, $00, $20
    db   $00, $00, $00, $00, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $20
    db   $00, $00, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $00, $00, $00, $00
    db   $60, $60, $20, $20, $20, $20, $40, $40, $00, $20, $00, $20, $00, $20, $40, $60
    db   $40, $60, $40, $60, $00, $20, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00
    db   $00, $00, $20, $20, $20, $20, $00, $00, $00, $00, $00, $00, $20, $20

unklablasdas:

section "Main $19ef", rom0[$19ef]

; Update hLinkAnimationState with the correct walking animation id.
;
; It uses Link's state to tell if Link has its shield, is side-scrolling, etc,
; and uses the number of steps walked to alternate between different variants.
UpdateLinkWalkingAnimation::
    ; d = (wConsecutiveStepsCount / 8) % 2
    ld   a, [wConsecutiveStepsCount]
    sra  a
    sra  a
    sra  a
    and  $01
    ld   d, a

    ; bc = d + ([hLinkDirection] * 2
    ldh  a, [hLinkDirection]
    sla  a
    or   d
    ld   c, a
    ld   b, $00

    ld   hl, Data_002_4948
    ld   a, [wLinkMotionState]
    cp   LINK_MOTION_SWIMMING
    jr   nz, .notSwimming
    ldh  a, [$FF9C]
    and  a
    jr   z, .swimmingEnd
    ld   hl, Data_002_4950
.swimmingEnd
    jr   .done

.notSwimming
    ldh  a, [hIsSideScrolling]
    and  a
    jr   z, .notSideScrolling
    ldh  a, [$FF9C]
    cp   $02
    jr   nz, .notSideScrolling
    ld   hl, LinkAnimationsList_WalkSideScrolling
    jr   .done

.notSideScrolling
    ld   a, [wIsCarryingLiftedObject]
    cp   $01
    jr   z, .liftingObject
    ldh  a, [$FFB2]
    and  a
    jr   nz, .label_1A9A
    ld   a, [wIsLinkPushing]
    and  a
    jr   nz, .pushingObject

.label_1A9A
    ld   a, [wHasMirrorShield]
    and  a
    jr   nz, .hasShield
    ld   hl, LinkAnimationsList_WalkingNoShield
    jr   .done
.hasShield
    ld   hl, LinkAnimationsList_WalkCarryingDefaultShield
    cp   $02
    jr   nz, .shieldDone
    ld   hl, LinkAnimationsList_WalkCarryingMirrorShield
.shieldDone

    ; If the carried shield is actually being used, add 8 to the animation list address
    ld   a, [wIsUsingShield]
    and  a
    jr   z, .shieldNotUsed
    ld   a, l
    add  a, $08
    ld   l, a
    ld   a, h
    adc  a, $00
    ld   h, a
.shieldNotUsed
    jr   .done

.pushingObject
    ld   hl, LinkAnimationsList_PushingObject
    jr   .done

.liftingObject
    ld   hl, LinkAnimationsList_LiftingObject
.done

    ; Read the value in the animation list…
    add  hl, bc
    ld   a, [hl]
    ; … and set Link's animation state.
    ldh  [hLinkAnimationState], a
    ret

include "code/home/animated_tiles.asm"

ReplaceMagicPowderTilesByToadstool::
    ld   hl, LinkCharacter2Tiles + $10C0 ; toadstool tiles
    ld   de, $88E0
    jr   ReplaceTilesPairAndDrawLinkSprite

label_1E33::
    ld   a, BANK(Npc2Tiles)
    ld   [MBC3SelectBank], a
    ld   a, [$D000]
    swap a
    and  $F0
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, vTiles1 + $500
    add  hl, de
    push hl
    ld   hl, Npc2Tiles + $1000

label_1E55::
    add  hl, de
    pop  de
    ld   bc, $40
    call CopyData
    xor  a
    ldh  [$FFA5], a
    ld   a, $0C
    ld   [MBC3SelectBank], a
    ret

label_1E69::
    ld   a, BANK(EndingTiles)
    ld   [MBC3SelectBank], a
    ld   a, [$D000]
    swap a
    and  $F0
    ld   e, a
    ld   d, $00
    sla  e
    rl   d
    sla  e
    rl   d
    ld   hl, vTiles1 + $500
    add  hl, de
    push hl
    ld   hl, EndingTiles + $D00
    jr   label_1E55

label_1E8D::
    ld   hl, InventoryEquipmentItemsTiles + $E0
    ld   de, $88E0
    ld   a, BANK(InventoryEquipmentItemsTiles)
    ld   [MBC3SelectBank], a
    ld   bc, $20
    jp   CopyDataAndDrawLinkSprite

ReplaceSlimeKeyTilesByGoldenLeaf::
    ld   hl, LinkCharacter2Tiles + $10E0
    ld   de, vTiles1 + $4A0
    ; fallthrough to ReplaceTilesPairAndDrawLinkSprite

; Replace two tiles in VRAM by the content at hl, then
; draw link sprite.

; Inputs:
;   hl   tiles source address
;   de   tiles destination in VRAM
ReplaceTilesPairAndDrawLinkSprite::
    ld   a, BANK(LinkCharacter2Tiles)
    ld   [MBC3SelectBank], a
    ld   bc, TILE_SIZE * $2
    jp   CopyDataAndDrawLinkSprite

label_1EB5::
    ld   hl, DungeonMinimapTiles + $100
    ld   a, BANK(DungeonMinimapTiles)
    jr   label_1EC1

label_1EBC::
    ld   hl, DungeonsTiles + $C40
    ld   a, BANK(DungeonsTiles)

label_1EC1::
    ld   [MBC3SelectBank], a
    ld   de, vTiles2 + $140
    jp   label_1F38

data_1ECD::
    db $40, $68, $40, $68

data_1ED1::
    db 0, $68

data_1ED3::
    db $80, $68, 0, $68

label_1ED7::
    ld hl, $2100                                  ; $1dee: $21 $00 $21
    ld [hl], $0c                                  ; $1df1: $36 $0c
    ld   hl, hLinkInteractiveMotionBlocked
    ld   [hl], $01
    ld   hl, $D6FB
    ld   e, [hl]
    ld   d, $00
    inc  a
    cp   $03
    jr   nz, label_1EFB
    push af
    ld   a, [$D6FB]
    xor  $02
    ld   [$D6FB], a
    pop  af

label_1EFB::
    ld   [$D6F8], a
    cp   $04

label_1F00::
    jr   nz, label_1F07
    ld   hl, data_1ECD
    jr   label_1F0E

label_1F07::
    cp   $08
    jr   nz, label_1F14
    ld   hl, data_1ED1

label_1F0E::
    add  hl, de
    ld   de, $9040
    jr   label_1F2C

label_1F14::
    cp   $06
    jr   nz, label_1F1D
    ld   hl, data_1ECD
    jr   label_1F28

label_1F1D::
    cp   $0A
    jr   nz, label_1F35
    xor  a
    ld   [$D6F8], a
    ld   hl, data_1ED3

label_1F28::
    add  hl, de
    ld   de, $9080

label_1F2C::
    ld   bc, $40
    ld   a, [hli]
    ld   h, [hl]
    ld   l, a
    jp   CopyData

label_1F35::
    jp   DrawLinkSpriteAndReturn

label_1F38::
    ld   bc, $40

CopyDataAndDrawLinkSprite::
    call CopyData

.drawLinkSprite
    xor  a
    ldh  [$FFA5], a
    ld   a, BANK(LinkCharacterTiles)
    ld   [MBC3SelectBank], a
    jp   DrawLinkSpriteAndReturn

; Number of horizontal pixels the sword reaches in Link's direction when drawing the sword
SwordAreaXForDirection::
.right db $0C
.left  db $03
.up    db $08
.down  db $08

; Number of vertical pixels the sword reaches in Link's direction when drawing the sword
SwordAreaYForDirection::
.right db $0A
.left  db $0A
.up    db $05
.down  db $10

; Array of constants for Link animation state
data_1F51::
    db   $36, $38, $3A, $3C

data_1F55::
    db   2, 1, 8, 4

data_1F59::
    db   $FC, 4, 0, 0

data_1F5D::
    db   0, 0, 4, 0

; Call label_1F69, then restore bank 2
; (Only ever called from label_002_4287)
label_1F69_trampoline::
    call label_1F69
    ld   a, $02
    jp   SwitchBank

; Physics for Link interactive motion?
; (Only ever called from label_002_4287)
label_1F69::
    ; If running with pegagus boots, or hLinkPositionZ != 0, or Link's motion != LINK_MOTION_INTERACTIVE, return
    ld   hl, wIsRunningWithPegasusBoots
    ld   a, [wIsCarryingLiftedObject]
    or   [hl]
    ld   hl, hLinkPositionZ
    or   [hl]
    ld   hl, wLinkMotionState
    or   [hl]
    jp   nz, func_2165.return

    ; Update hSwordIntersectedAreaX according to Link's position and direction
    ldh  a, [hLinkDirection]
    ld   e, a
    ld   d, $00
    ld   hl, SwordAreaXForDirection
    add  hl, de

    ldh  a, [hLinkPositionX]
    add  a, [hl]
    sub  a, $08
    and  $F0
    ldh  [hSwordIntersectedAreaX], a

    ; Update hSwordIntersectedAreaY according to Link's position and direction
    swap a
    ld   c, a
    ld   hl, SwordAreaYForDirection
    add  hl, de
    ldh  a, [hLinkPositionY]
    add  a, [hl]
    sub  a, $10
    and  $F0
    ldh  [hSwordIntersectedAreaY], a

    ; hl = address of the room object that would intersect with the sword
    or   c
    ld   e, a
    ldh  [hScratch1], a
    ld   hl, wRoomObjects
    add  hl, de

    ; (Sanity check: if HIGH(hl) != $D7, then we're far out of bounds: return)
    ld   a, h
    cp   $D7
    jp   nz, .clearC15FAndReturn

    ; hScratch0 = id of room object under the sword
    ld   a, [hl]
    ldh  [hScratch0], a

    ; hScratch5 = unknown value read from the objects tilesets table
    ; d = map group id
    ; e = room object
    ld   e, a
    ld   a, [wIsIndoor]
    ld   d, a
    call GetObjectPhysicsFlags_trampoline
    ldh  [hScratch5], a

    ; If the object is $9A, skip this section

    ldh  a, [hScratch0]
    cp   $9A
    jr   z, .notObject9AEnd

    ldh  a, [hScratch5]
    cp   $00
    jp   z, .clearC15FAndReturn
    cp   $01
    jr   z, .jp_1FE6
    cp   $50
    jp   z, .clearC15FAndReturn
    cp   $51
    jp   z, .clearC15FAndReturn
    cp   $11
    jp  c, .clearC15FAndReturn
    cp   $D4
    jp   nc, .clearC15FAndReturn
    cp   $D0
    jr   nc, .jp_1FE6
    cp   $7C
    jp   nc, .clearC15FAndReturn

.jp_1FE6
    ldh  a, [hScratch0]
    ld   e, a
    cp   $6F
    jr   z, .jp_1FF6
    cp   $5E
    jr   z, .jp_1FF6
    cp   $D4
    jp   nz, .jp_2098

.jp_1FF6
    ld   a, [wIsIndoor]
    and  a

    ld   a, e
    jp   nz, .jp_2098
.notObject9AEnd

    ld   e, a

    ; If Link is facing up, handle some special cases.
    ldh  a, [hLinkDirection]
    cp   DIRECTION_UP
    jp   nz, .specialCasesEnd
    ; Set [$C1AD] = 2
    ld   a, $02
    ld   [$C1AD], a

    ; If A or B is pressed…
    ldh  a, [hJoypadState]
    and  J_A | J_B
    jp   z, .specialCasesEnd
    ld   a, e
    cp   OBJECT_WEATHER_VANE_BASE
    ld   a, $8E                     ; Dialog $18E "Here sleeps..."
    jr   z, .jr_2088
    ld   a, e
    cp   OBJECT_OWN_STATUE
    jr   z, .signpost
    cp   OBJECT_SIGNPOST
    jr   z, .signpost
    ld   a, [wIsMarinFollowingLink]
    and  a
    jr   z, .jr_2030
    ; Open Marin's "Do you look in people's drawers?" dialog
    call_open_dialog $278
    jp   .specialCasesEnd

.jr_2030
    ; If no sword yet…
    ld   a, [wSwordLevel]
    and  a
    ldh  a, [hMapRoom]
    jr   nz, .noSwordEnd
    ld   e, $FF
    cp   $A3                        ; Marin & Tarin's house
    jr   z, .jr_2046
.noSwordEnd

    ld   e, $FC
    cp   $FA
    jr   z, .jr_2046
    ld   e, $FD

.jr_2046
    ld   a, e
    jr   .jr_208E

.signpost
    ; Activating an OBJECT_SIGNPOST
    ; de = [hMapRoom]
    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, $00
    ld   a, $14
    ld   [MBC3SelectBank], a
    ld   hl, SignpostDialogTable
    add  hl, de
    ld   a, [wOcarinaSongFlags]
    ld   e, a
    ld   a, [hl]
    cp   $A9
    jr   nz, .jr_2066
    bit  0, e
    jr   z, .jr_2066
    ld   a, $AF

.jr_2066
    cp   $AF
    jr   nz, .jr_2080
    bit  0, e
    jr   nz, .jr_2080
    ldh  a, [hSwordIntersectedAreaX]
    swap a
    and  $0F
    ld   e, a
    ldh  a, [hSwordIntersectedAreaY]
    and  $F0
    or   e
    ld   [wMazeSignpostPos], a
    jp   .specialCasesEnd

.jr_2080
    ; Some other signpost (not part of the maze), or maze completed
    cp   $83
    jr   z, .jr_208E

.jr_2088
    call OpenDialogInTable1
    jp   .specialCasesEnd

.jr_208E
    call OpenDialog
    jr   .specialCasesEnd


.jp_2098

    ; When throwing a pot at a chest in the right room, open the chest
    cp   OBJECT_CHEST_CLOSED
    jr   nz, .specialCasesEnd
    ld   a, [wRoomEvent]
    and  EVENT_TRIGGER_MASK
    cp   TRIGGER_THROW_POT_AT_CHEST
    jr   z, .specialCasesEnd
    ldh  a, [hLinkDirection]
    cp   $02
    jr   nz, .specialCasesEnd
    ld   [$C1AD], a
    ldh  a, [hJoypadState]
    and  J_A | J_B
    jr   z, .specialCasesEnd
    ldh  a, [hIsSideScrolling]
    and  a
    jr   nz, .label_20BF
    ldh  a, [hLinkDirection]
    cp   $02
    jr   nz, .specialCasesEnd

.label_20BF
    ld a, $14                                     ; $1fc8: $3e $14
    ld [$2100], a                                 ; $1fca: $ea $00 $21
    ldh a, [hMapRoom]                             ; $1fcd: $f0 $f6
    ld e, a                                       ; $1fcf: $5f
    ld a, [wIsIndoor]                             ; $1fd0: $fa $a5 $db
    ld d, a                                       ; $1fd3: $57
    ldh a, [hMapId]                               ; $1fd4: $f0 $f7
    cp $1a                                        ; $1fd6: $fe $1a
    jr nc, .jr_000_1fdf                            ; $1fd8: $30 $05

    cp $06                                        ; $1fda: $fe $06
    jr c, .jr_000_1fdf                             ; $1fdc: $38 $01

    inc d                                         ; $1fde: $14

.jr_000_1fdf:
    ld hl, $4500                                  ; $1fdf: $21 $00 $45
    add hl, de                                    ; $1fe2: $19
    ld a, [hl]                                    ; $1fe3: $7e
    cp $20                                        ; $1fe4: $fe $20
    jr nz, .jr_000_1ff3                            ; $1fe6: $20 $0b

    ld a, [wSwordLevel]                           ; $1fe8: $fa $4e $db
    cp $02                                        ; $1feb: $fe $02
    ld a, $20                                     ; $1fed: $3e $20
    jr c, .jr_000_1ff3                             ; $1fef: $38 $02

    ld a, $1c                                     ; $1ff1: $3e $1c

.jr_000_1ff3:
    ldh [hScratch8], a
    callsb SpawnChestWithItem

.specialCasesEnd

    ld   a, [wBButtonSlot]
    cp   INVENTORY_POWER_BRACELET
    jr   nz, .jr_20DD
    ldh  a, [hPressedButtonsMask]
    and  J_B
    jr   nz, .jr_20EC
    ret

.jr_20DD
    ld   a, [wAButtonSlot]
    cp   INVENTORY_POWER_BRACELET
    jp   nz, func_2165.return
    ldh  a, [hPressedButtonsMask]
    and  J_A
    jp   z, func_2165.return

.jr_20EC
    callsb label_002_48B0
    ld   a, $01
    ldh  [hLinkInteractiveMotionBlocked], a
    ldh  a, [hLinkDirection]
    ld   e, a
    ld   d, $00
    ld   hl, data_1F51

    add  hl, de
    ld   a, [hl]
    ldh  [hLinkAnimationState], a
    ld   hl, data_1F55
    add  hl, de
    ldh  a, [hPressedButtonsMask]
    and  [hl]
    jr   z, .clearC15FAndReturn
    ld   hl, data_1F59
    add  hl, de
    ld   a, [hl]
    ld   [$C13C], a
    ld   hl, data_1F5D
    add  hl, de
    ld   a, [hl]
    ld   [$C13B], a
    ld   hl, hLinkAnimationState
    inc  [hl]
    ld   e, $08
    ld   a, [wActivePowerUp]
    cp   $01
    jr   nz, .jp_212C
    ld   e, $03

.jp_212C
    ld   hl, $C15F
    inc  [hl]
    ld   a, [hl]
    cp   e
    jr   c, .return
    xor  a
    ldh  [$FFE5], a
    ldh  a, [hScratch0]
    cp   $8E
    jr   z, .jr_2153
    cp   $20
    jr   z, .jr_2153
    ld   a, [wIsIndoor]
    and  a
    jr   nz, .return
    ldh  a, [hScratch0]
    cp   $5C
    jr   z, .jr_2161

.return
    ret

.clearC15FAndReturn
    xor  a
    ld   [$C15F], a
    ret

.jr_2153
    call func_2165
    callsb func_014_50C3
    jp   ReloadSavedBank

.jr_2161
    ld   a, $01
    ldh  [$FFE5], a

func_2165::
    ldh  a, [hScratch1]
    ld   e, a
    ldh  a, [hScratch0]
    ldh  [hObjectUnderEntity], a
    call func_014_5526_trampoline
    ldh  a, [hLinkDirection]
    ld   [$C15D], a
    jp   label_2183

.return
    ret

func_014_5526_trampoline::
    callsb func_014_5526
    jp   ReloadSavedBank

label_2183::
    ld   a, ENTITY_ENTITY_LIFTABLE_ROCK
    call SpawnPlayerProjectile
    jr   c, label_21A7

    ld   a, WAVE_SFX_ZIP
    ldh  [hWaveSfx], a

    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   [hl], $07
    ld   hl, $C3B0
    add  hl, de
    ldh  a, [$FFE5]
    ld   [hl], a
    ld   c, e
    ld   b, d
    ld   e, $01
    jpsw func_003_5795

label_21A7::
    ret

UpdateFinalLinkPosition::
    ; If inventory is appearing, return
    ld   a, [wInventoryAppearing]
    and  a
    ret  nz

    ; Compute next Link vertical position
    ld   c, $01
    call ComputeLinkPosition

.horizontal
   ; Compute next Link horizontal position
    ld   c, $00
    ldh  [hScratch0], a

; Inputs:
;   c : direction (0: horizontal ; 1: vertical)
ComputeLinkPosition::
    ; b = 0
    ld   b, $00
    ; a = [hLinkPositionXIncrement + direction]
    ld   hl, hLinkPositionXIncrement
    add  hl, bc
    ld   a, [hl]

    push af
    swap a
    and  $F0
    ld   hl, $C11A
    add  hl, bc
    add  a, [hl]
    ld   [hl], a

    rl   d
    ; hl = [hLinkPositionX + direction]
    ld   hl, hLinkPositionX
    add  hl, bc

    pop  af
    ld   e, $00
    bit  7, a
    jr   z, .label_21D7
    ld   e, $F0
.label_21D7

    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

func_21E1::
    ldh  a, [$FFA3]
    push af
    swap a
    and  $F0
    ld   hl, $C149
    add  a, [hl]
    ld   [hl], a
    rl   d
    ld   hl, hLinkPositionZ
    pop  af
    ld   e, $00
    bit  7, a
    jr   z, .label_21FB
    ld   e, $F0
.label_21FB
    swap a
    and  $0F
    or   e
    rr   d
    adc  a, [hl]
    ld   [hl], a
    ret

IF 0
ELSE
; UpdateBGRegion:
ENDC

include "code/home/dialog.asm"

Call_000_2655:
    ld a, $02                                     ; $2655: $3e $02
    call SwitchAdjustedBank                       ; $2657: $cd $b9 $07
    call $7b74                                    ; $265a: $cd $74 $7b
    ret                                           ; $265d: $c9

Data_020_49EC::
    db   $01, $01, $20, $20

Data_020_49F0::
    db   $93, $93, $13, $13

; Increment the BG map offset by this amount during room transition,
; depending on the transition direction.
BGRegionIncrement::
.right  db $10
.left   db $10
.top    db $01
.bottom db $01

Data_020_5560::
    db   $08, $08, $0A, $0A

Data_020_5564::
    db   $01, $FF, $F0, $10

Data_020_5568::
    db   $00, $00, $03, $00

Data_020_556C::
    db   $02, $1E, $C0, $40

; Update a region (row or column) of the BG map during room transition
UpdateBGRegion::
    ; Switch to Map Data bank
    ld   a, $08
    ld   [MBC3SelectBank], a
    call DoUpdateBGRegion
    ; Reload saved bank and return
    call   ReloadSavedBank
    ret


Call_000_2686:
    ld a, [$c12b]                                 ; $2686: $fa $2b $c1
    cp $00                                        ; $2689: $fe $00
    jr z, jr_000_2692                             ; $268b: $28 $05

    dec a                                         ; $268d: $3d
    ld [$c12b], a                                 ; $268e: $ea $2b $c1
    ret                                           ; $2691: $c9


jr_000_2692:
    ld a, [$c125]                                 ; $2692: $fa $25 $c1
    ld c, a                                       ; $2695: $4f
    ld b, $00                                     ; $2696: $06 $00
    ld a, $01                                     ; $2698: $3e $01
    ld [$c12b], a                                 ; $269a: $ea $2b $c1
    ld a, [$c12a]                                 ; $269d: $fa $2a $c1
    ldh [$d9], a                                  ; $26a0: $e0 $d9
    ld hl, $265e                                  ; $26a2: $21 $5e $26
    add hl, bc                                    ; $26a5: $09
    ld a, [$c127]                                 ; $26a6: $fa $27 $c1
    ld [$d602], a                                 ; $26a9: $ea $02 $d6
    add [hl]                                      ; $26ac: $86
    rl d                                          ; $26ad: $cb $12
    ld [$d619], a                                 ; $26af: $ea $19 $d6
    ld a, [$c126]                                 ; $26b2: $fa $26 $c1
    or $98                                        ; $26b5: $f6 $98
    ld [$d601], a                                 ; $26b7: $ea $01 $d6
    rr d                                          ; $26ba: $cb $1a
    adc $00                                       ; $26bc: $ce $00
    ld [$d618], a                                 ; $26be: $ea $18 $d6
    ld hl, $2662                                  ; $26c1: $21 $62 $26
    add hl, bc                                    ; $26c4: $09
    ld a, [hl]                                    ; $26c5: $7e
    ld [$d603], a                                 ; $26c6: $ea $03 $d6
    ld [$d61a], a                                 ; $26c9: $ea $1a $d6
    ld a, $00                                     ; $26cc: $3e $00
    ld [$d62f], a                                 ; $26ce: $ea $2f $d6
    ld a, $ee                                     ; $26d1: $3e $ee
    ld [$d614], a                                 ; $26d3: $ea $14 $d6
    ld [$d615], a                                 ; $26d6: $ea $15 $d6
    ld [$d616], a                                 ; $26d9: $ea $16 $d6
    ld [$d617], a                                 ; $26dc: $ea $17 $d6
    ld [$d62b], a                                 ; $26df: $ea $2b $d6
    ld [$d62c], a                                 ; $26e2: $ea $2c $d6
    ld [$d62d], a                                 ; $26e5: $ea $2d $d6
    ld [$d62e], a                                 ; $26e8: $ea $2e $d6
    ld b, $d6                                     ; $26eb: $06 $d6
    ld c, $04                                     ; $26ed: $0e $04
    ld d, $d6                                     ; $26ef: $16 $d6
    ld e, $1b                                     ; $26f1: $1e $1b

IncrementBGMapSourceAndDestination_Horizontal:
IncrementBGMapSourceAndDestination_Vertical:
DoUpdateBGRegion:
.loop
    push bc
    push de

    ; hl = wRoomObjects + hScratch2
    ldh  a, [hScratch2]
    ld   c, a
    ld   b, $00
    ld   hl, wRoomObjects
    add  hl, bc

    ; c = wRoomObjects[hScratch2]
    ld   b, $00
    ld   c, [hl]


    sla  c
    rl   b
    sla  c
    rl   b

    ;
    ; Map base address selection
    ;

    ; If IsIndoor…
    ld   hl, IndoorObjectsTilemapDMG
    ld   a, [wIsIndoor]
    and  a
    jr   z, .baseAddress_isOverworld

.baseAddress_isOverworld
    ; hl = (hIsGBC ? OverworldObjectsTilemapCGB : OverworldObjectsTilemapDMG)
    ld   hl, OverworldObjectsTilemapDMG
    ;
    ; BG map offset selection
    ;

    ; hl = base map address + BG map offset
    add  hl, bc
    pop  de
    pop  bc

    ; If the Room transition is vertical…
    ld   a, [wRoomTransitionDirection]
    and  $02
    jr   z, .horizontalRoomTransition

    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    inc de
    jr   .incrementEnd

.horizontalRoomTransition

    ld a, [hl+]
    ld [bc], a
    ld a, [hl+]
    ld [de], a
    inc bc
    inc de
    ld a, [hl+]
    ld [bc], a
    ld a, [hl]
    ld [de], a
    inc bc
    inc de

.incrementEnd

    push bc
    ; Increment BG destination address
    ; (by a column or by a row)
    ld   a, [wRoomTransitionDirection]
    ld   c, a
    ld   b, $00
    ld   hl, BGRegionIncrement
    add  hl, bc
    ldh  a, [hScratch2]
    add  a, [hl]
    ldh  [hScratch2], a
    pop  bc

    ; Decrement loop counter
    ld   a, [wBGUpdateRegionTilesCount]
    dec  a
    ld   [wBGUpdateRegionTilesCount], a

    ; Loop until BG map data for the whole region is copied
    jr   nz, .loop

    ; Set next BG region origin, and decrement wRoomTransitionFramesBeforeMidScreen
; Set next BG region origin, and decrement wRoomTransitionFramesBeforeMidScreen
; func_020_5570::
    ; ld   e, $FF                                   ; $5570: $1E $FF
    ld   a, [wRoomTransitionDirection]            ; $5572: $FA $25 $C1
    ld   c, a                                     ; $5575: $4F
    ld   b, $00                                   ; $5576: $06 $00
    ld   hl, Data_020_5560                        ; $557E: $21 $60 $55
    add  hl, bc                                   ; $5581: $09
    ld   a, [hl]                                  ; $5582: $7E
    ld   [wBGUpdateRegionTilesCount], a           ; $5583: $EA $28 $C1
    ld   hl, Data_020_5564                        ; $558D: $21 $64 $55
    add  hl, bc                                   ; $5590: $09
    ld   a, [$C12A]                               ; $5591: $FA $2A $C1
    add  [hl]                                     ; $5594: $86
    ld   [$C12A], a                               ; $5595: $EA $2A $C1
    ld   hl, Data_020_556C                        ; $5598: $21 $6C $55
    add  hl, bc                                   ; $559B: $09
    ld   a, [wBGUpdateRegionOriginLow]            ; $559C: $FA $27 $C1
    add  [hl]                                     ; $559F: $86
    rr   d                                        ; $55A0: $CB $1A
    and $df
    ld   [wBGUpdateRegionOriginLow], a            ; $55A3: $EA $27 $C1
    ld   hl, Data_020_5568                        ; $55A6: $21 $68 $55
    add  hl, bc                                   ; $55A9: $09
    ld   a, [wBGUpdateRegionOriginHigh]           ; $55AA: $FA $26 $C1
    rl   d                                        ; $55AD: $CB $12
    adc  [hl]                                     ; $55AF: $8E
    and  $03                                      ; $55B0: $E6 $03
    ld   [wBGUpdateRegionOriginHigh], a           ; $55B2: $EA $26 $C1
    ld   a, [wRoomTransitionFramesBeforeMidScreen]; $55B5: $FA $29 $C1
    dec  a                                        ; $55B8: $3D
    ld   [wRoomTransitionFramesBeforeMidScreen], a; $55B9: $EA $29 $C1
    jr   nz, jr_020_55C1                          ; $55BC: $20 $03

    jp   label_020_55C2                           ; $55BE: $C3 $C2 $55

jr_020_55C1:
    ret                                           ; $55C1: $C9

label_020_55C2:
    ld   a, [wRoomTransitionState]                ; $55C2: $FA $24 $C1
    inc  a                                        ; $55C5: $3C
    ld   [wRoomTransitionState], a                ; $55C6: $EA $24 $C1
    ret                                           ; $55C9: $C9


db "@@@@@@@@@"

; Set the music track to play on the world
; Input:
;   a:   soundtrack id to load
SetWorldMusicTrack::
    ld   [wMusicTrackToPlay], a
    ldh  [hNextDefaultMusicTrack], a
    ; Sets the music fade in timer to $38
    ld   a, $38
    ldh  [hMusicFadeInTimer], a
    ; Prematurely sets the timer to zero, to skip a tiny part of the fade at the end and skip straight to playing the new area's music track.
    xor  a
    ldh  [hMusicFadeOutTimer], a
    ret

EnableExternalRAMWriting::
    push hl
    ; ld   hl, MBC3SRamBank
    ; ld   [hl], $00 ; Switch to RAM bank 0
    ld   hl, $00
    ld   [hl], $0A ; Enable external RAM writing
    pop  hl
    ret

; Load soudtrack after map or gameplay transition
label_27DD::
    ld   a, BANK(SelectMusicTrackAfterTransition)
    ld   [MBC3SelectBank], a
    push bc
    call SelectMusicTrackAfterTransition
    pop  bc
    jp   ReloadSavedBank

label_27EA::
    ld   a, $38
    ldh  [hMusicFadeOutTimer], a
    xor  a
    ldh  [hMusicFadeInTimer], a
    ret

label_27F2::
    ldh  a, [hFFBC]
    and  a
    jr   nz, .skip
    callsb func_01F_4003
.skip
    jp   ReloadSavedBank

SynchronizeDungeonsItemFlags_trampoline::
    callsb SynchronizeDungeonsItemFlags
    jp   ReloadSavedBank

; Return a random number in `a`
GetRandomByte::
    push hl
    ldh  a, [hFrameCounter]
    ld   hl, wRandomSeed
    add  a, [hl]
    ld   hl, rLY
    add  a, [hl]
    rrca
    ld   [wRandomSeed], a ; wRandomSeed += FrameCounter + rrca(rLY)
    pop  hl
    ret

ReadJoypadState::
    ; Ignore joypad during map transitions
    ld   a, [wRoomTransitionState]
    and  a
    jr   nz, .return

.readState
    ld   a, $20
    ld   [rP1], a
    ld   a, [rP1]
    ld   a, [rP1]
    cpl
    and  $0F
    ld   b, a
    ld   a, $10
    ld   [rP1], a
    ld   a, [rP1]
    ld   a, [rP1]
    ld   a, [rP1]
    ld   a, [rP1]
    ld   a, [rP1]
    ld   a, [rP1]
    ld   a, [rP1]
    ld   a, [rP1]
    swap a
    cpl
    and  $F0
    or   b
    ld   c, a
    ldh  a, [hPressedButtonsMask]
    xor  c
    and  c
    ldh  [hJoypadState], a
    ld   a, c
    ldh  [hPressedButtonsMask], a
    ld   a, $30
    ld   [rP1], a

.return
    ret

label_2887::
    push bc
    ldh  a, [hSwordIntersectedAreaY]
    ld   hl, hBaseScrollY
    add  a, [hl]
    and  $F8
    srl  a
    srl  a
    srl  a
    ld   de, $00
    ld   e, a
    ld   hl, vBGMap0
    ld   b, $20

.loop
    add  hl, de
    dec  b
    jr   nz, .loop

    push hl
    ldh  a, [hSwordIntersectedAreaX]
    ld   hl, hBaseScrollX
    add  a, [hl]
    pop  hl
    and  $F8
    srl  a
    srl  a
    srl  a
    ld   de, $00
    ld   e, a
    add  hl, de
    ld   a, h
    ldh  [$FFCF], a
    ld   a, l
    ldh  [$FFD0], a
    pop  bc
    ret

; Jump to the routine defined at the given index in the jump table.
;
; Usage:
;   ld   a, <routine_index>
;   rst  0
;   dw   Func_0E00 ; jump address for index 0
;   dw   Func_0F00 ; jump address for index 1
;   ...
;
; Input:
;   a:  index of the routine address in the jump table
TableJump::
    ld   e, a    ; \
    ld   d, $00  ; | Multiply the index by 2, and store it in de
    sla  e       ; |
    rl   d       ; /
    pop  hl
    add  hl, de  ; Add the base address and the offset
    ld   e, [hl] ; Load the low byte of the target address
    inc  hl
    ld   d, [hl] ; Load the high byte of the target address
    ld   l, e
    ld   h, d
    jp   hl    ; Jump to the target address

; Turn off LCD at next vertical blanking
LCDOff::
    ld   a, [rIE]
    ldh  [$FFD2], a ; Save interrupts configuration
    res  0, a
    ; ld   [rIE], a   ; Disable all interrupts
.waitForEndOfLine
    ld   a, [rLY]
    cp   $91
    jr   nz, .waitForEndOfLine ; Wait for row 145
    ld   a, [rLCDC]  ; \
    and  $7F         ; | Switch off LCD screen
    ld   [rLCDC], a  ; /
    ldh  a, [$FFD2]
    ld   [rIE], a    ; Restore interrupts configuration
    ret

LoadTileset0F_trampoline::
    callsw LoadTileset0F
    ret

; Fill the Background Map with all 7Es
LoadTileset8::
    ld   a, $7E    ; value
    ld   bc, $400 ; count
    jr   FillBGMap

; Fill the Background Map with all 7Fs
ClearBGMap::
    ld   a, $7F    ; value
    ld   bc, $800 ; count

; Fill the Background map with a value
; Inputs:
;   a  : value to fill
;   bc : count
FillBGMap::
    ld   d, a
    ld   hl, vBGMap0
.loop
    ld   a, d
    ldi  [hl], a
    dec  bc
    ld   a, b
    or   c
    jr   nz, .loop
    ret

include "code/home/copy_data.asm"

include "src/code/home/clear_memory.asm"
db "@@@@@@@@@@"
db "@@@@@@@@@@"
db "@@@"

GetChestsStatusForRoom_trampoline::
    ld a, $14                                     ; $29b8: $3e $14
    ld [$2100], a                                 ; $29ba: $ea $00 $21
    ld hl, $4500                                  ; $29bd: $21 $00 $45
    add hl, de                                    ; $29c0: $19
    ld a, [hl]                                    ; $29c1: $7e
    jp   ReloadSavedBank

; Play the boomerang sound effect, then reload the current bank
PlayBoomerangSfx_trampoline::
    ld a, [$c5ac]                                 ; $29c5: $fa $ac $c5
    and a                                         ; $29c8: $a7
    jr nz, jr_000_29cf                            ; $29c9: $20 $04

    ld a, $2d                                     ; $29cb: $3e $2d
    ldh [hNoiseSfx], a                            ; $29cd: $e0 $f4

jr_000_29cf:
    ret                                           ; $29cf: $c9

label_2A07::
    callsb func_001_5A59
    jp   ReloadSavedBank

; Read the physics flags for a given static object.
; Inputs:
;   d    map group id
;   e    room object id
; Return:
;   a    physics flags for the object
GetObjectPhysicsFlags::
    ld   a, BANK(OverworldObjectPhysicFlags)
    ld   [MBC3SelectBank], a
    ld   hl, OverworldObjectPhysicFlags
    add  hl, de
    ld   a, [hl]
    jp   ReloadSavedBank

GetObjectPhysicsFlags_trampoline::

GetObjectPhysicsFlagsAndRestoreBank3::
    ld a, $08
    ld [$2100], a
    ld hl, $5110
    add hl, de
    ld a, [hl]
    push af
    ld a, $03
    ld [$2100], a
    pop af
    ret

LoadTileset1E::
    ld   a, BANK(EndingTiles)
    ld   [MBC3SelectBank], a

    ld   hl, EndingTiles + $2800
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   hl, EndingTiles + $3000
    ld   de, vTiles1
    ld   bc, TILE_SIZE * $80
    jp   CopyData

LoadTileset1F::
    call LoadTileset15
    ld   de, vTiles0 + $400
    ld   hl, EndingTiles + $3600
    ld   bc, TILE_SIZE * $10
    jp   CopyData

LoadTileset15::
    ld   a, BANK(EndingTiles)
    ld   [MBC3SelectBank], a

    ld   hl, EndingTiles
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $180
    call CopyData

    ld   a, BANK(Overworld1Tiles)
    ld   [MBC3SelectBank], a
    ld   hl, Overworld1Tiles + $8E0 ; filler color
    ld   de, vTiles2 + $7F0
    ld   bc, TILE_SIZE
    call CopyData

    ld   a, BANK(Npc4Tiles)
    ld   [MBC3SelectBank], a
    ld   hl, Npc4Tiles + $100
    ld   de, vTiles0
    ld   bc, TILE_SIZE * 4
    call CopyData

    ld   de, vTiles1 + $500
    ld   hl, Npc4Tiles + $100
    ld   bc, TILE_SIZE * $20
    jp   CopyData

LoadTileset1D::
    ld   a, BANK(Overworld1Tiles)
    ld   [MBC3SelectBank], a
    ld   hl, Overworld1Tiles + $100
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   a, BANK(Npc3Tiles)
    ld   [MBC3SelectBank], a
    ld   hl, Npc3Tiles + $2000
    ld   de, $8000
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   a, BANK(Overworld2Tiles)
    ld   [MBC3SelectBank], a
    ld   hl, Overworld2Tiles + $600
    ld   de, $8800
    ld   bc, TILE_SIZE * $80
    jp   CopyData

LoadTileset18::
    ld   hl, EndingTiles
    jr   label_2B01

LoadTileset17::
    ld   hl, EndingTiles + $800
    jr   label_2B01

LoadTileset16::
    ld   hl, EndingTiles + $2000

label_2B01::
    ld   a, BANK(EndingTiles)

label_2B06::
    ld   [MBC3SelectBank], a
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   hl, EndingTiles + $1800
    ld   de, vTiles0 + TILE_SIZE * $80
    ld   bc, TILE_SIZE * $100
    jp   CopyData

LoadTileset1B::
    call PlayAudioStep

    ld   hl, FontLargeTiles + $100
    ld   a, BANK(FontLargeTiles)
    call func_2B92

    call PlayAudioStep

    ld   a, BANK(Npc3Tiles)
    ld   [MBC3SelectBank], a
    ld   hl, Npc3Tiles + $2600
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $8
    call CopyData

    call PlayAudioStep

    ld   a, BANK(FontLargeTiles)
    ld   [MBC3SelectBank], a
    ld   hl, FontLargeTiles + $200
    ld   de, vTiles0 + $100
    ld   bc, TILE_SIZE * $70
    jp   CopyData

LoadTileset1A::
    ld   hl, EndingTiles + $3800
    jr label_2B90

LoadTileset19::
    ld   hl, EndingTiles + $800
label_2B90::
    ld   a, BANK(EndingTiles)

func_2B92::

label_2B95::
    ld   [MBC3SelectBank], a
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   a, BANK(EndingTiles)
    ld   [MBC3SelectBank], a
    ld   hl, EndingTiles + $3000
    ld   de, vTiles1
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   hl, EndingTiles + $2800
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $80
    jp   CopyData

label_2BC1::
    push bc
func_014_5838::
    ld a, $14                                     ; $2b26: $3e $14
    ld [$2100], a
    ld   hl, MapLayout11                          ; $5838: $21 $E0 $44
    ldh  a, [hMapId]                              ; $583B: $F0 $F7

    cp   $0B                                      ; $5841: $FE $0B
    jr   nc, jr_014_5883                          ; $5843: $30 $3E

    swap a                                        ; $5848: $CB $37
    ld   c, a                                     ; $584A: $4F
    ld   b, $00                                   ; $584B: $06 $00
    sla  c                                        ; $584D: $CB $21
    rl   b                                        ; $584F: $CB $10
    sla  c                                        ; $5851: $CB $21
    rl   b                                        ; $5853: $CB $10
    add  hl, bc                                   ; $5855: $09
    ldh  a, [hMapId]                              ; $5856: $F0 $F7
    cp   $06                                      ; $5858: $FE $06
    jr   nz, jr_014_5866                          ; $585A: $20 $0A

    ld   a, [wHasInstrument7]                     ; $585C: $FA $6B $DB
    and  $04                                      ; $585F: $E6 $04
    jr   z, jr_014_5866                           ; $5861: $28 $03

    ld   hl, MapLayout12                          ; $5863: $21 $20 $45

jr_014_5866:
    add  hl, de                                   ; $5866: $19
    ld   a, [hl]                                  ; $5867: $7E
    ld   e, a                                     ; $5868: $5F
    ld   d, $00                                   ; $5869: $16 $00
    ldh  a, [hMapId]                              ; $586E: $F0 $F7
    cp   $1A                                      ; $5879: $FE $1A
    jr   nc, jr_014_5882                          ; $587B: $30 $05

    cp   $06                                      ; $587D: $FE $06
    jr   c, jr_014_5882                           ; $587F: $38 $01

    inc  d                                        ; $5881: $14

jr_014_5882:
    ld hl, wIndoorARoomStatus                     ; $2b62: $21 $00 $d9
    add  hl, de                                   ; $5882: $19

jr_014_5883:
    call ReloadSavedBank
    pop  bc
    ret

; Load the basic tiles (Link's character, items icons) to tile memory
LoadBaseTiles::
    ; Select the tiles sheet bank ($0C on DMG, $2C on GBC)
    ld   a, BANK(LinkCharacterTiles)
    call SwitchAdjustedBank
    ; Copy $400 bytes from the link's tile sheet to Tiles map 0
    ld   hl, LinkCharacterTiles
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $40
    call CopyData

    ; Select the tiles sheet bank ($0C on DMG, $2C on GBC)
    ld   a, BANK(InventoryEquipmentItemsTiles)
    call SwitchAdjustedBank
    ; Copy $1000 bytes from the items tile sheet to Tiles Map 1
    ld   hl, InventoryEquipmentItemsTiles
    ld   de, vTiles1
    ld   bc, TILE_SIZE * $100
    call CopyData

    ; Copy two tiles from the times tile sheet to a portion of Tiles Map 1
    ld   hl, Items1Tiles + $3A0
    ld   de, vTiles1 + $600
    ld   bc, TILE_SIZE * $2
    call CopyData

    ; Switch back to bank 1
    ld   a, $01
    call SwitchBank
    ret

LoadInventoryTiles::
    call LoadBaseTiles

    ; Select the tiles sheet bank ($0F on DMG, $2F on GBC)
    ld   a, BANK(MenuTiles)
    call SwitchAdjustedBank
    ; Copy $400 bytes from the menu tile sheet to Tiles Map 1
    ld   hl, MenuTiles
    ld   de, vTiles1
    ld   bc, $400
    call CopyData

    ; Select the tiles sheet bank ($0F on DMG, $2F on GBC)
    ld   a, BANK(FontTiles)
    call SwitchAdjustedBank
    ; Copy $800 bytes from the menu tile sheet to Tiles Map 2
    ld   hl, FontTiles
    ld   de, vTiles2
    ld   bc, $800
    jp   CopyData ; tail-call

LoadDungeonTiles::
    ;
    ; Load floor tiles
    ;

    ld   a, BANK(DungeonFloorTilesPointers)
    call SwitchBank

    ; If inside the Color Dungeon…
    ldh  a, [hMapId]
    ld   e, a
    ld   d, $00
    ; Read a data pointer from DungeonFloorTilesPointers
    push de
    ld   hl, DungeonFloorTilesPointers
    add  hl, de
    ld   h, [hl]
    ld   l, $00
    ld   a, BANK(DungeonsTiles)
    call SwitchAdjustedBank
.endIf

    ld   de, vTiles2 + $100
    ld   bc, TILE_SIZE * $10
    call CopyData

    ;
    ; Load dungeon doors, stairs and torches
    ;

    ld   hl, DungeonsTiles
    ld   de, vTiles2 + $200
    ld   bc, TILE_SIZE * $60
    call CopyData

    ;
    ; Load dungeon walls
    ;

    ld   a, BANK(DungeonWallsTilesPointers)
    ld   [MBC3SelectBank], a
    pop  de
    push de
    ld   hl, DungeonWallsTilesPointers

    add  hl, de
    ld   h, [hl]
    ld   l, $00
    call ReloadSavedBank
    ld   de, vTiles2 + $200
    ld   bc, TILE_SIZE * $20
    call CopyData

    ld   a, BANK(Items1Tiles)
    ld   [MBC3SelectBank], a
    ld   hl, Items1Tiles + $3C0
    ld   de, $DCC0
    ld   bc, TILE_SIZE * $4
    call CopyData

    call func_2D50

    ;
    ; Load dungeon items tiles
    ;

    ld   a, BANK(DungeonItemsTilesPointers)
    ld   [MBC3SelectBank], a
    pop  de
    ld   hl, DungeonItemsTilesPointers
    add  hl, de
    ld   h, [hl]
    ld   l, $00

    ld   a, BANK(DungeonItemsTiles)
    call SwitchAdjustedBank

    ld   de, vTiles1 + $700
    ld   bc, TILE_SIZE * $10
    call CopyData

    ;
    ; Load inventory items tiles for dungeon
    ;

    ld   hl, InventoryDungeonItemsTiles

    ldh  a, [hMapId]
    cp   MAP_CAVE_B
    jr   c, .caveBOrColorDungeon
    ld   a, BANK(DungeonKeysTiles)
    call SwitchAdjustedBank
    ld   hl, DungeonKeysTiles
.caveBOrColorDungeon

    ld   de, vTiles1 + $400
    ld   bc, TILE_SIZE * $30
    call CopyData

.patchInventoryTiles

    ld   a, [wHasToadstool]
    and  a
    jr   z, .noToadstoolEnd
    call ReplaceMagicPowderTilesByToadstool
.noToadstoolEnd

    ld   a, [wIsIndoor]
    and  a
    jr   z, .jr_2D17
    ldh  a, [hMapId]
    cp   MAP_CAVE_B
    jr   c, .jr_2D21
.jr_2D17

    ld   a, [wGoldenLeavesCount]
    cp   $06 ; slime key
    jr   c, .jr_2D21
    call ReplaceSlimeKeyTilesByGoldenLeaf

.jr_2D21
    ld   a, [wTradeSequenceItem]
    cp   TRADING_ITEM_RIBBON
    jr   c, .return
    ld   a, $0D
    ldh  [$FFA5], a

.return
    ret

LoadTileset5::
    ;
    ; Load Overworld landscape
    ;

    ld   a, BANK(OverworldLandscapeTiles)
    call SwitchAdjustedBank
    ld   hl, OverworldLandscapeTiles
    ld   de, vTiles2 + $200
    ld   bc, TILE_SIZE * $60
    call CopyData

    ;
    ; Load dungeon keys
    ;

    ld   hl, DungeonKeysTiles
    ld   de, vTiles1 + $400
    ld   bc, TILE_SIZE * $40
    call CopyData

    call func_2D50

    jp   LoadDungeonTiles.patchInventoryTiles

func_2D50::
    xor  a
    ldh  [hAnimatedTilesFrameCount], a
    ldh  [hAnimatedTilesDataOffset], a
    call AnimateTiles.jumpTable

    ld   hl, InventoryEquipmentItemsTiles
    ld   de, vTiles1
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   hl, LinkCharacterTiles + $200
    ld   de, vTiles0 + $200
    ld   bc, TILE_SIZE * $10
    call CopyData
    ret

; Load Map n°10 (introduction sequence)
LoadIntroSequenceTiles::
    ; Load rain tiles
    ld   a, BANK(IntroRainTiles)
    call SwitchBank
    ld   hl, IntroRainTiles
    ld   de, vTiles0 + $700
    ld   bc, TILE_SIZE * $8
    call CopyData

    ; Load intro sequence misc tiles
    ld   a, BANK(IntroTiles)
    call SwitchAdjustedBank
    ld   hl, Intro3Tiles
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $60
    call CopyData

    ; Load intro sequence misc tiles
    ld   hl, Intro1Tiles
    ld   de, vTiles1
    ld   bc, TILE_SIZE * $100
    jp   CopyData

LoadTitleScreenTiles::
    ; Load title logo
    ld   a, BANK(TitleLogoTitles)
    call SwitchAdjustedBank
    ld   hl, TitleLogoTitles
    ld   de, vTiles1
    ld   bc, TILE_SIZE * $70
    jp CopyData


LoadTileset0B::
    ; Load world map tiles
    ld   a, BANK(WorldMapTiles)
    call SwitchAdjustedBank
    ld   hl, WorldMapTiles
    ld   de, vTiles1 + $700
    ld   bc, TILE_SIZE * $80
    call CopyData

    ; Load some overworld tiles
    ld   hl, Overworld1Tiles + $100
    ld   de, vTiles0 + $200
    ld   bc, TILE_SIZE * $10
    jp   CopyData

LoadFaceShrineReliefTiles::
    ld   hl, ReliefTiles
    jr   LoadStaticPictureTiles

LoadSchulePaintingTiles::
    ld   hl, PaintingTiles
    jr   LoadStaticPictureTiles

LoadChristinePortraitTiles::
    ld   hl, ChristineTiles
    ; fallthrough

; Load tiles for a static full-screen picture to vTiles2
; Inputs:
;   hl   tiles source address
LoadStaticPictureTiles::
    ld   a, BANK(StaticPicturesTiles)
    call SwitchAdjustedBank
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $80
    jp   CopyData

LoadEaglesTowerTopTiles::
    ld   a, BANK(EaglesTowerTop1Tiles)
    ld   [MBC3SelectBank], a
    ld   hl, EaglesTowerTop2Tiles
    ld   de, vTiles1 + $400
    ld   bc, TILE_SIZE * $40
    call CopyData

    ld   hl, EaglesTowerTop1Tiles
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $40
    jp   CopyData

LoadTileset13::
    ld   a, BANK(FontLargeTiles)
    call SwitchAdjustedBank

    ld   hl, FontLargeTiles
    ld   de, vTiles0 + $400
    ld   bc, TILE_SIZE * $40
    call CopyData

    ld   hl, MarinBeachTiles
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $60
    jp   CopyData

; Tiles for Saving and Game Over screens
LoadSaveMenuTiles::
    ld   a, BANK(SaveMenuTiles)
    call SwitchBank
    ld   hl, SaveMenuTiles
    ld   de, vTiles1
    ld   bc, TILE_SIZE * $50
    jp   CopyData

; NPC tiles banks
NpcTilesBankTable::
    db   $00, BANK(Npc2Tiles), BANK(Npc1Tiles), BANK(Npc3Tiles)

; Load lower section of OAM tiles (NPCs),
; and upper section of BG tiles
LoadTileset9::

    ;
    ; Load 4 rows of tiles (64 tiles) to NPCs tiles VRAM
    ;

    xor  a
    ; Copy a row of 16 tiles
.copyOAMTilesRow
    ldh  [hScratch0], a
    ld   hl, $C193
    ld   e, a
    ld   d, $00
    add  hl, de
    and  a
    jr   nz, .label_2ED3
    ld   a, [wIsIndoor]
    and  a
    jr   z, .label_2EB0
    ldh  a, [hIsSideScrolling]
    and  a
    jr   nz, .label_2ED3
    ldh  a, [hMapId]
    cp   MAP_KANALET
    jr   z, .label_2ED3
    cp   MAP_CAVE_B
    jr   c, .label_2ED3
    ldh  a, [hMapRoom]
    cp   $FD
    jr   z, .label_2ED3
    cp   $B1
    jr   z, .label_2ED3

.label_2EB0
    ld   a, [wIsBowWowFollowingLink]
    cp   $01
    ld   a, $A4
    jr   z, .label_2ED1
    ld   a, [wIsGhostFollowingLink]
    and  a
    ld   a, $D8
    jr   nz, .label_2ED1
    ld   a, [wIsRoosterFollowingLink]
    and  a
    ld   a, $DD
    jr   nz, .label_2ED1
    ld   a, [wIsMarinFollowingLink]
    and  a
    jr   z, .label_2ED3
    ld   a, $8F

.label_2ED1
    jr   .jr_2ED4

.label_2ED3
    ld   a, [hl]

.jr_2ED4
    push af
    and  $3F
    ld   b, a
    ld   c, $00
    pop  af
    swap a
    rra
    rra
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, NpcTilesBankTable
    add  hl, de
    ld   a, [hl]
.bankAdjustmentEnd

    ; Do the actual copy to OAM tiles
    ld   [MBC3SelectBank], a
    ldh  a, [hScratch0]
    ld   d, a
    ld   e, $00
    ; destination = Lower-half of the OAM tiles section (NPCs tiles)
    ld   hl, vTiles0 + $400
    add  hl, de
    ld   e, l
    ld   d, h
    ; Source: NpcTilesDataStart + bc
    ld   hl, NpcTilesDataStart
    add  hl, bc
    ld   bc, TILE_SIZE * $10
    call CopyData
.copyskipEntityLoad

    ; while hScratch0 < 4, copy the next row
    ldh  a, [hScratch0]
    inc  a
    cp   $04
    jp   nz, .copyOAMTilesRow
.oamTilesEnd

    ;
    ; Load 8 rows (128 tiles) to the BG-only tiles
    ;

    ld   de, vTiles2

    ld   a, [wIsIndoor]
    and  a
    jr   z, .loadOverworldBGTiles

    ld   a, BANK(DungeonsTiles)
    ld   [MBC3SelectBank], a

    ldh  a, [hIsSideScrolling]
    and  a
    jr   z, .loadTopViewTiles

    ;
    ; Load tiles for side-scrolling sections
    ;

    ld   hl, DungeonSideview1Tiles
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
    jr   z, .label_2F41
    cp   MAP_CAVE_B
    jr   nc, .label_2F3B

.label_2F36
    ld   hl, DungeonSideview2Tiles
    jr   .label_2F41

.label_2F3B
    ldh  a, [hMapRoom]
    cp   $E9
    jr   z, .label_2F36
.label_2F41

    ; Copy sideview tiles to the BG tiles
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $80
    call CopyData
    ret

.loadTopViewTiles
    ;
    ; Load tiles for top-view dungeon
    ;

    ld   hl, Dungeons2Tiles
    ldh  a, [hWorldTileset]
    cp   W_TILESET_NO_UPDATE
    jr   z, .skipBGLoading

    add  a, $50
    ld   h, a
    ld   bc, TILE_SIZE * $10
    call CopyData
.skipBGLoading

    ret
.cameraShopEnd

    ; Hack: on GBC, load 2 tiles to a specific location
    ; TODO: find out which tiles


.loadOverworldBGTiles
    ;
    ; Load 2 rows of tiles for the world BG tileset
    ;
    ld   a, BANK(Overworld2Tiles)
    ld   [MBC3SelectBank], a

    ; If the tileset is W_TILESET_KEEP, do nothing.
    ldh  a, [hWorldTileset]
    cp   W_TILESET_KEEP
    jr   z, .return

    ; hl = ($40 + hWorldTileset) * $100
    add  a, $40
    ld   h, a
    ld   l, $00
    ld   bc, TILE_SIZE * $20
    call CopyData

.return
    ret


CopyWord::


    ld a, $08                                     ; $2e6c: $3e $08
    call SwitchAdjustedBank                       ; $2e6e: $cd $b9 $07
    ld de, vBGMap0                                ; $2e71: $11 $00 $98
    ld hl, wRoomObjects                           ; $2e74: $21 $11 $d7
    ld c, $80                                     ; $2e77: $0e $80

jr_000_2e79:
    push de                                       ; $2e79: $d5
    push hl                                       ; $2e7a: $e5
    push bc                                       ; $2e7b: $c5

; Given an object (overworld or indoors), retrieve its tiles indices,
; and copy them to the BG map.
; (DMG only)
;
; Inputs:
;   hl   pointer to the object in the objects map (see wRoomObjects)
;   de   pointer to the target in the BG map (4 bytes will be written)
WriteObjectToBG_DMG::
    ; bc = [hl] * 4
    ld   a, [hl]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b

    ;
    ; Select the objects tilemap table to use
    ;

    ld   hl, OverworldObjectsTilemapDMG

    ; If indoors, use a special objects tilemap
    ld   a, [wIsIndoor]
    and  a
    jr   z, .readValueInTable
    ld   hl, IndoorObjectsTilemapDMG

.readValueInTable
    ; hl = address of the tilemap for the given object
    add  hl, bc

    ; Read the first 2 bytes of the object tilemap, and write them
    ; to the target address in the BG map
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a

    ; Add $1F to the target address (to move one row below in the BG map)
    ld   a, e
    add  a, $1F
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a

    ; Read the last 2 bytes of the object tilemap, and write them
    ; to the target address in the BG map
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hl]
    ld   [de], a


    pop  bc
    pop  hl
    pop  de

    inc  hl
    ld   a, l
    and  $0F
    cp   $0B
    jr   nz, .lEnd
    ld   a, l
    and  $F0
    add  a, $11
    ld   l, a
.lEnd

    ld   a, e
    add  a, $02
    ld   e, a
    and  $1F
    cp   $14
    jr   nz, .aEnd
    ld   a, e
    and  $E0
    add  a, $40
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
.aEnd

    ; Loop until all objects of the room are copied to the BG
    dec  c
    jr   nz, jr_000_2e79

    jpsb UpdateMinimapEntranceArrowAndReturn

LoadTileset1:

; Load room objects
LoadRoom::
    ; Disable all interrupts except VBlank
    ld   a, $01 ; 30F4
    ld   [rIE], a

    ; Increment $D47F
    ld   hl, $D47F
    inc  [hl]

    ld   a, BANK(OverworldRoomPointers)
    ld   [MBC3SelectBank], a
    ; callsb ResetRoomVariables
; ResetRoomVariables::
    xor  a                                        ; $4CA3: $AF
    ldh  [hFreeWarpDataAddress], a                ; $4CA4: $E0 $E6
    ld   [$C19C], a                               ; $4CA6: $EA $9C $C1
    ld   [$C504], a                               ; $4CA9: $EA $04 $C5
    ld   [$DBC8], a                               ; $4CAC: $EA $C8 $DB
    ld   [wTorchesCount], a                       ; $4CAF: $EA $C9 $DB
    ld   [$C1A2], a                               ; $4CB2: $EA $A2 $C1
    ld   [$C1C6], a                               ; $4CB5: $EA $C6 $C1
    ld   [wRoomSwitchableObject], a               ; $4CB8: $EA $FA $D6
    ld   [$C50A], a                               ; $4CBB: $EA $0A $C5
    ldh  [$FFAC], a                               ; $4CBE: $E0 $AC
    ld   [wC113], a                               ; $4CC0: $EA $13 $C1
    ld   [$D460], a                               ; $4CC3: $EA $60 $D4
    ld   [wInBossBattle], a                       ; $4CC6: $EA $BE $C1
    ld   [$C50E], a                               ; $4CC9: $EA $0E $C5
    ld   [$C3C8], a                               ; $4CCC: $EA $C8 $C3
    ld   [$C5A6], a                               ; $4CCF: $EA $A6 $C5
    ld   [wCompassSfxCountdown], a                ; $4CD2: $EA $62 $D4
    ld   [wC3CD], a                               ; $4CD5: $EA $CD $C3
    ld   a, $FF                                   ; $4CDB: $3E $FF
    ld   [wWarpStructs], a                        ; $4CDD: $EA $01 $D4
    ld   [$C50F], a                               ; $4CE0: $EA $0F $C5


    ;
    ; Load map pointers bank
    ;

    ; If loading an indoor room…
    ld   a, [wIsIndoor]
    and  a
    jr   z, $2f90
    ; Do some stuff
    ld   a, BANK(func_014_5897)
    ld   [MBC3SelectBank], a
    ldh  [hRoomBank], a
    ldh  a, [hMapId]                              ; $5897: $F0 $F7
    cp   $0B                                      ; $58A2: $FE $0B
    jr   nc, .jr_014_58D1                          ; $58A4: $30 $2B

    ld   hl, MapLayout0                           ; $58A6: $21 $20 $42
    swap a                                        ; $58A9: $CB $37
    ld   e, a                                     ; $58AB: $5F
    ld   d, $00                                   ; $58AC: $16 $00
    sla  e                                        ; $58AE: $CB $23
    rl   d                                        ; $58B0: $CB $12
    sla  e                                        ; $58B2: $CB $23
    rl   d                                        ; $58B4: $CB $12
    add  hl, de                                   ; $58B6: $19
    ldh  a, [hMapId]                              ; $58B7: $F0 $F7
    cp   $06                                      ; $58B9: $FE $06
    jr   nz, .jr_014_58C7                          ; $58BB: $20 $0A

    ld   a, [wHasInstrument7]                     ; $58BD: $FA $6B $DB
    and  $04                                      ; $58C0: $E6 $04
    jr   z, .jr_014_58C7                           ; $58C2: $28 $03

    ld   hl, MapLayout12                          ; $58C4: $21 $20 $45

.jr_014_58C7:
    ld   a, [wIndoorRoom]                         ; $58C7: $FA $AE $DB
    ld   e, a                                     ; $58CA: $5F
    ld   d, $00                                   ; $58CB: $16 $00
    add  hl, de                                   ; $58CD: $19
    ld   a, [hl]                                  ; $58CE: $7E
    ldh  [hMapRoom], a                            ; $58CF: $E0 $F6

.jr_014_58D1:
    ldh  a, [hMapRoom]                            ; $58D1: $F0 $F6
    ld   c, a                                     ; $58D3: $4F
    ld   b, $00                                   ; $58D4: $06 $00
    ldh  a, [hMapId]                              ; $58D6: $F0 $F7
    cp   $1A                                      ; $58E1: $FE $1A
    jr   nc, .jr_014_58EA                          ; $58E3: $30 $05

    cp   $06                                      ; $58E5: $FE $06
    jr   c, .jr_014_58EA                           ; $58E7: $38 $01

    inc  b                                        ; $58E9: $04

.jr_014_58EA:
    ld   hl, DungeonEventsTable                   ; $58EA: $21 $00 $40

.jr_014_58ED:
    add  hl, bc                                   ; $58ED: $09
    ld   a, [hl]                                  ; $58EE: $7E
    ld   [wRoomEvent], a                          ; $58EF: $EA $8E $C1
    xor  a                                        ; $58F2: $AF
    ld   [$C18A], a                               ; $58F3: $EA $8A $C1
    ld   [$C18B], a                               ; $58F6: $EA $8B $C1
    ld   [$C190], a                               ; $58F9: $EA $90 $C1
    ld   [wRoomEventEffectExecuted], a            ; $58FC: $EA $8F $C1

    ld   e, a
    ld   hl, wKillCount2
.loop
    xor  a
    ldi  [hl], a
    inc  e
    ld   a, e
    cp   $11
    jr   nz, .loop
.indoorSpecialCodeEnd

    ;
    ; Load the room status
    ;

    ; de = hMapRoom
    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, $00
    ; hl = wOverworldRoomStatus
    ld   hl, wOverworldRoomStatus
    ; If loading an indoor room…
    ld   a, [wIsIndoor]
    and  a
    jr   z, .roomStatusEnd
    ; … use the room status for indoor map A
    ld   hl, wIndoorARoomStatus
    ; If Color Dungeon…
    ldh  a, [hMapId]
    ; Unless on one of the special rooms, use the room status for the indoor map B
    cp   $1A
    jr   nc, .roomStatusEnd
    cp   $06
    jr   c, .roomStatusEnd
    ld   hl, wIndoorBRoomStatus
.roomStatusEnd

    ; a = RoomStatusTable[hMapRoom]
    add  hl, de
    ldh  a, [hIsSideScrolling]
    and  a
    ld   a, [hl]

    ; If the room status was zero (not visited yet), mark the room as visited
    jr   nz, .markVisitedRoomEnd
    or   ROOM_STATUS_VISITED
    ld   [hl], a
.markVisitedRoomEnd

    ; Set the room status as the current room status
    ldh  [hRoomStatus], a

    ;
    ; Select the bank and address for the map pointers table
    ;

    ; bc = hMapRoom
    ldh  a, [hMapRoom]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b

    ; If the room is indoor…
    ld   a, [wIsIndoor]
    and  a
    jr   z, .isIndoorEnd

    ; …use the bank for IndoorA map
    ld   a, BANK(IndoorsARoomPointers)
    ld   [MBC3SelectBank], a
    ldh  [hRoomBank], a

    ; If the room is in the Color Dungeon…
    ldh  a, [hMapId]
    ; If have the Magnifying Lens, load an alternate Goriya room (where the Goriya NPC is actually present)
    cp   MAP_CAVE_E
    jr   nz, .goriyaRoomEnd
    ldh  a, [hMapRoom]
    cp   $F5
    jr   nz, .goriyaRoomEnd
    ld   a, [wTradeSequenceItem]
    cp   $0E ; Magnifying Glass
    jr   nz, .goriyaRoomEnd
    ld   bc, IndoorsAF5Alt
    jp   .parseRoomHeader
.goriyaRoomEnd

    ; If the map is less than MAP_UNKNOWN_1A…
    ld   hl, IndoorsARoomPointers
    ldh  a, [hMapId]
    cp   MAP_UNKNOWN_1A
    jr   nc, .fetchRoomAddress
    ; …and the map is greater than the first 6 dungeons…
    cp   MAP_EAGLES_TOWER
    jr   c, .fetchRoomAddress
    ; …use the bank for IndoorB map.
    ld   a, BANK(IndoorsBRoomPointers)
    ld   [MBC3SelectBank], a
    ldh  [hRoomBank], a
    ld   hl, IndoorsBRoomPointers
    jr   .fetchRoomAddress

.isIndoorEnd

    ;
    ; Swap some Overworld rooms with alternative layouts
    ;

    ldh  a, [hMapRoom]
    cp   $0E
    jr   nz, .endEaglesTowerAlt
    ld   a, [wOverworldRoomStatus + $0E]
    and  ROOM_STATUS_CHANGED
    jr   z, .altRoomsEnd
    ld   bc, Overworld0EAlt ; Eagle's Tower open
    jr   .loadBankForOverworldRooms
.endEaglesTowerAlt

    cp   $8C
    jr   nz, .endSouthFaceShrineAlt
    ld   a, [wOverworldRoomStatus + $8C]
    and  ROOM_STATUS_CHANGED
    jr   z, .altRoomsEnd
    ld   bc, Overworld8CAlt ; South Face Shrine open
    jr   .loadBankForOverworldRooms
.endSouthFaceShrineAlt

    cp   $79
    jr   nz, .endUpperTalTalHeightsAlt
    ld   a, [wOverworldRoomStatus + $79]
    and  ROOM_STATUS_CHANGED
    jr   z, .altRoomsEnd
    ld   bc, Overworld79Alt ; Kanalet Castle open
    jr   .loadBankForOverworldRooms
.endUpperTalTalHeightsAlt

    cp   $06
    jr   nz, .endWindfishsEggAlt
    ld   a, [wOverworldRoomStatus + $06]
    and  ROOM_STATUS_CHANGED
    jr   z, .altRoomsEnd
    ld   bc, Overworld06Alt ; Windfish's Egg open
    jr   .loadBankForOverworldRooms
.endWindfishsEggAlt

    cp   $1B
    jr   nz, .endTalTalHeightsAlt
    ld   a, [wOverworldRoomStatus + $2B]
    and  ROOM_STATUS_CHANGED
    jr   z, .altRoomsEnd
    ld   bc, Overworld1BAlt ; Angler's Tunnel upper water dry
    jr   .loadBankForOverworldRooms
.endTalTalHeightsAlt

    cp   $2B
    jr   nz, .altRoomsEnd
    ld   a, [wOverworldRoomStatus + $2B]
    and  ROOM_STATUS_CHANGED
    jr   z, .altRoomsEnd
    ld   bc, Overworld2BAlt ; Angler's Tunnel open
    jr   .loadBankForOverworldRooms

.altRoomsEnd

    ;
    ; Get room address from index
    ;
    ; hl: rooms base address
    ; bc: room index
    ;

    ; Set the base address for resolving usual room pointers
    ; (except Color Dungeon)
    ld   hl, OverworldRoomPointers

.fetchRoomAddress
    ; b = hl[room index]
    ; c = hl[room index + 1]
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a

    ;
    ; Load proper bank for Overworld rooms
    ;

    ; If in Overworld…
    ld   a, [wIsIndoor]
    and  a
    jr   nz, .parseRoomHeader
.loadBankForOverworldRooms
    ; … and the overworld room index is >= $80…
    ldh  a, [hMapRoom]
    cp   $80
    jr   c, .parseRoomHeader
    ; … select bank for second half of Overworld rooms
    ld   a, BANK(OverworldRoomsSecondHalf)
    ld   [MBC3SelectBank], a

    ;
    ; Parse room header
    ; bc: address of room header data
    ;
.parseRoomHeader

    ; Parse header first byte (animated tiles group)
    ld   a, [bc]
    cp   ROOM_END
    jr   z, .endOfRoom
    ldh  [hAnimatedTilesGroup], a

    ; Parse header second byte
    inc  bc
    ld   a, [wIsIndoor]
    and  a
    jr   z, .parseOverworldSecondByte

.parseIndoorsSecondByte
    ; For indoor rooms, the lower nybble is the floor tile…
    ld   a, [bc]
    and  $0F
    call FillRoomMapWithObject
    ; … and the upper nybble is the room template
    ld   a, [bc]
    swap a
    and  $0F
    call LoadRoomTemplate_trampoline
    jr   .parseRoomObjectsLoop

.parseOverworldSecondByte
    ; For overworld rooms, the second byte is just the floor tile
    ld   a, [bc]
    call FillRoomMapWithObject

    ;
    ; Parse room objects
    ;

.parseRoomObjectsLoop
    ; Increment the current address
    inc  bc
    ; a = object type
    ld   a, [bc]

    ; If object is warp data…
    and  %11111100
    cp   ROOM_WARP
    jr   nz, .warpDataEnd
    ; …copy object to the first available warp data slot.
    ldh  a, [hFreeWarpDataAddress]
    ld   e, a
    ld   d, $00
    ld   hl, wWarpStructs
    add  hl, de
    ld   a, [bc]
    and  $03
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    inc  bc
    ld   a, [bc]
    ldi  [hl], a
    ; Increment the address of the first available warp data slot
    ld   a, e
    add  a, $05
    ldh  [hFreeWarpDataAddress], a
    jr   .parseRoomObjectsLoop
.warpDataEnd

    ; a = object type
    ld   a, [bc]
    ; If we reached the end of the room objects, exit the loop
    cp   ROOM_END
    jr   z, .endOfRoom

    call LoadRoomObject
    jr   .parseRoomObjectsLoop

.endOfRoom

    ; Surround the objects area defining a room by ROOM_BORDER values
    callsb PadRoomObjectsArea

    ; ; Do stuff that returns early if end-of-room
    ; callsb func_036_6D4D

    ; ; Load palette for room objects?
    ; callsb func_021_53F3

    ; Reload saved bank and return
    jp   ReloadSavedBank

; Read an individual room object, and write it to the unpacked room objects area.
; bc : start address of the object
;
; Objects can be 2-bytes objects or 3-bytes objects:
;
; twoBytesObject:
;   ds 1 ; location (YX)
;   ds 1 ; type
;
; threeBytesObject:
;   ds 1 ; direction and length (8X: horizontal + length ; CX: vertical + length)
;   ds 1 ; location (YX)
;   ds 1 ; type
;
LoadRoomObject::
    ; Clear hScratch0
    xor  a
    ldh  [hScratch0], a

    ; If object type first bit is 1…
    ld   a, [bc]
    bit  7, a
    jr   z, .threeBytesObjectEnd
    ; … and object type 4th bit is 0…
    bit  4, a
    jr   nz, .threeBytesObjectEnd
    ; … this is a three-bytes object, that spans more than one block.
    ; The first byte encodes the direction and length of the block:
    ; save it to hScratch0.
    ldh  [hScratch0], a
    ; Skip the parsed direction-and-length byte
    inc  bc
.threeBytesObjectEnd

    ; Increment read pointer to the object type
    inc  bc

    ; e = hRoomStatus
    ldh  a, [hRoomStatus]
    ld   e, a

    ; If currently on Overworld…
    ld   a, [wIsIndoor]
    and  a
    jr   nz, .loadIndoorObject

    ; Overworld objects with type >= $F5 are handled by code in another bank.

    ; If object is an Overworld macro…
    ld   a, [bc]
    sub  a, OBJECT_MACRO_F5
    jr   c, .loadOverworldObject

    JP_TABLE
._00 dw TreeMacroHandler
._01 dw TwoDoorsHouseMacroHandler
._02 dw LargeHouseMacroHandler
._03 dw CatfishMawMacroHandler
._04 dw PalaceDoorMacroHandler
._05 dw StonePigHeadMacroHandler
._06 dw PalmTreeMacroHandler
._07 dw func_024_76EA
._08 dw SmallHouseMacroHandler

.loadIndoorObject
    ; a = object type - OBJECT_KEY_DOOR_TOP
    ld   a, [bc]
    sub  a, OBJECT_KEY_DOOR_TOP
    ; If a >= OBJECT_KEY_DOOR_TOP, dispatch to the door object handlers
    jp  c, .loadNonDoorIndoorObject
    JP_TABLE
._EC dw LoadObject_KeyDoorTop
._ED dw LoadObject_KeyDoorBottom
._EE dw LoadObject_KeyDoorLeft
._EF dw LoadObject_KeyDoorRight
._F0 dw LoadObject_ClosedDoorTop
._F1 dw LoadObject_ClosedDoorBottom
._F2 dw LoadObject_ClosedDoorLeft
._F3 dw LoadObject_ClosedDoorRight
._F4 dw LoadObject_OpenDoorTop
._F5 dw LoadObject_OpenDoorBottom
._F6 dw LoadObject_OpenDoorLeft
._F7 dw LoadObject_OpenDoorRight
._F8 dw LoadObject_BossDoor
._F9 dw LoadObject_StairsDoor
._FA dw LoadObject_FlipWall
._FB dw LoadObject_OneWayArrow
._FC dw LoadObject_DungeonEntrance
._FD dw LoadObject_IndoorEntrance

; Load an Overworld object (that is not a macro)
.loadOverworldObject
    ; Re-increment a to be the object type
    add  a, $F5
    push af
    ; d = a
    ld   d, a

    cp   OBJECT_WATERFALL
    jr   nz, .waterfallEnd
    ld   [$C50E], a
.waterfallEnd

    ;
    ; If the Weather Vane is pushed open, shift it to the top
    ;

    cp   OBJECT_WEATHER_VANE_BASE
    jr   nz, .weatherVaneBottomEnd
    bit  5, e ; object position
    jr   nz, .replaceObjectByGroundStairs
.weatherVaneBottomEnd

    cp   OBJECT_WEATHER_VANE_TOP
    jr   nz, .weatherVaneTopEnd
    bit  5, e ; object position
    jr   z, .weatherVaneTopEnd
    ; replace the top by the vane base
    pop  af
    ld   a, OBJECT_WEATHER_VANE_BASE
    ld   d, a
    push af
.weatherVaneTopEnd

    cp   OBJECT_WEATHER_VANE_ABOVE
    jr   nz, .weatherVaneAboveEnd
    bit  5, e ; object position
    jr   z, .weatherVaneAboveEnd
    ; replace the grass above by the vane top
    pop  af
    ld   a, OBJECT_WEATHER_VANE_TOP
    ld   d, a
    push af
.weatherVaneAboveEnd

    ;
    ; If the Monkey Bridge is built yet, display it
    ;

    cp   OBJECT_MONKEY_BRIDGE_TOP
    jr   z, .loadMonkeyBridgeObject
    cp   OBJECT_MONKEY_BRIDGE_MIDDLE
    jr   z, .loadMonkeyBridgeObject
    cp   OBJECT_MONKEY_BRIDGE_BOTTOM
    jr   nz, .monkeyBridgeEnd

.loadMonkeyBridgeObject
    ; If the monkey bridge is built…
    bit  4, e
    jr   z, .monkeyBridgeEnd
    ; …replace the object by the monkey bridge
    pop  af
    ld   a, OBJECT_MONKEY_BRIDGE_BUILT
    ld   d, a
    push af
.monkeyBridgeEnd

    ; If a closed gate has been opened…
    cp   OBJECT_CLOSED_GATE
    jr   nz, .closedGateEnd
    bit  4, e
    jr   z, .closedGateEnd
    ; …replace the object by the open cave entrance
    pop  af
    ld   a, OBJECT_CAVE_DOOR
    ld   d, a
    push af
.closedGateEnd

    ; If a bombable cave door has been bombed…
    ld   a, d
    cp   OBJECT_BOMBABLE_CAVE_DOOR
    jr   nz, .bombableCaveDoorEnd
    bit  2, e
    jr   z, .bombableCaveDoorEnd
    ; …replace the object by the open rocky cave entrance
    pop  af
    ld   a, OBJECT_ROCKY_CAVE_DOOR
    ld   d, a
    push af
.bombableCaveDoorEnd

    ; If a bush masking a cave entrance has been cut…
    ld   a, d
    cp   OBJECT_BUSH_GROUND_STAIRS
    jr   nz, .bushGroundStairsEnd
    bit  4, e
    jr   z, .bushGroundStairsEnd
    ldh  a, [hMapRoom]
    cp   $75
    jr   z, .replaceObjectByGroundStairs
    cp   $07
    jr   z, .replaceObjectByGroundStairs
    cp   $AA
    jr   z, .replaceObjectByGroundStairs
    cp   $4A
    jr   nz, .bushGroundStairsEnd
.replaceObjectByGroundStairs
    pop  af
    ld   a, OBJECT_GROUND_STAIRS
    ld   d, a
    push af
.bushGroundStairsEnd

    ; hScratch9 = object type
    ld   a, d
    ldh  [hScratch9], a

    ; If object is an entrance to somewhere else…
    cp   OBJECT_CLOSED_GATE
    jr   z, .configureDoorWarpData
    cp   OBJECT_ROCKY_CAVE_DOOR
    jr   z, .configureDoorWarpData
    cp   $CB
    jr   z, .configureDoorWarpData
    cp   OBJECT_BOMBABLE_CAVE_DOOR
    jr   z, .configureDoorWarpData
    cp   $61
    jr   z, .configureDoorWarpData
    cp   OBJECT_GROUND_STAIRS
    jr   z, .configureDoorWarpData
    cp   $C5
    jr   z, .configureDoorWarpData
    cp   $E2
    jr   z, .configureDoorWarpData
    cp   OBJECT_CAVE_DOOR
    jr   nz, .overworldDoorEnd

.configureDoorWarpData
    ld   a, [$C19C]
    ld   e, a
    inc  a
    ld   [$C19C], a
    ld   d, $00
    ld   hl, wWarpPositions
    add  hl, de
    dec  bc
    ld   a, [bc]
    ld   [hl], a
    inc  bc
.overworldDoorEnd

    ; a = object type
    ldh  a, [hScratch9]

    cp   $C5
    jp   z, .configureStairs
    cp   OBJECT_GROUND_STAIRS
    jp   z, .configureStairs
    jp   .breakableObjectEnd

.loadNonDoorIndoorObject
    ; Re-increment a to be the object type
    add  a, OBJECT_KEY_DOOR_TOP
    ldh  [hScratch9], a

    ; If object type is a conveyor belt…
    push af
    cp   OBJECT_CONVEYOR_BOTTOM
    jr   c, .conveyorEnd
    cp   OBJECT_TRENDY_GAME_BORDER
    jr   nc, .conveyorEnd
    ; …increment the number of conveyor belts present on screen
    ld   hl, wConveyorBeltsCount
    inc  [hl]
.conveyorEnd

    ; If object is an unlit torch…
    cp   OBJECT_TORCH_UNLIT
    jr   nz, .torchEnd
    ; clear wObjectAffectingBGPalette
    xor  a
    ld   [wObjectAffectingBGPalette], a
    ; POI: Potential bug: Room $1C4 (IndoorA) is the Face Shrine pre-boss room
    ; where you can light two torches to trigger an event. However,
    ; room $2C4 (IndoorB) *also* has an unlit torch. This causes some
    ; weird palette flickering, though $2C4 and $2D4 are inaccessible
    ; (part of an old Kanalet Castle entry before the side-scrolling stuff)
    ; If the room is $C4…
    ldh  a, [hMapRoom]
    cp   $C4
    ; … and the object type is not zero…
    ldh  a, [hScratch9]
    jr   z, .torchEnd
    ; …then increment the number of torches in the room
    ld   hl, wTorchesCount
    inc  [hl]
    ; mark the torch as affecting the background palette
    ld   [wObjectAffectingBGPalette], a
    ; $C3CD += 4
    push af
    ld   a, [$C3CD]
    add  a, $04
    ld   [$C3CD], a
    ld   a, $04
    ld   [wTransitionSequenceCounter], a
    pop  af
.torchEnd

    ;
    ; Configure switches and movable blocks
    ;

    cp   OBJECT_POT_WITH_SWITCH
    jr   z, .configureSwitchButton
    cp   OBJECT_SWITCH_BUTTON
    jr   z, .configureSwitchButton

    cp   OBJECT_RAISED_BLOCK
    jr   z, .configureMovableBlock
    cp   OBJECT_LOWERED_BLOCK
    jr   nz, .switchableObjectsEnd

.configureMovableBlock
    ld   hl, wRoomSwitchableObject
    ld   [hl], ROOM_SWITCHABLE_OBJECT_MOBILE_BLOCK
    jr   .switchableObjectsEnd

.configureSwitchButton
    ld   hl, wRoomSwitchableObject
    ld   [hl], ROOM_SWITCHABLE_OBJECT_SWITCH_BUTTON
.switchableObjectsEnd

    ;
    ; Configure top and bottom bombable walls
    ;

    cp   OBJECT_BOMBABLE_WALL_TOP
    jr   z, .configureBombableWallTop
    cp   OBJECT_HIDDEN_BOMBABLE_WALL_TOP
    jr   nz, .bombableWallBottom
.configureBombableWallTop
    ; If a top bombable wall has been bombed…
    bit  2, e
    ; …replace the wall by a bombed passage
    jr   nz, .replaceByVerticalBombedPassage

.bombableWallBottom
    cp   OBJECT_BOMBABLE_WALL_BOTTOM
    jr   z, .configureBombableWallBottom
    cp   OBJECT_HIDDEN_BOMBABLE_WALL_BOTTOM
    jr   nz, .verticalBombableWallsEnd
.configureBombableWallBottom
    ; If a bottom bombable wall has been bombed…
    bit  3, e
    jr   z, .verticalBombableWallsEnd
    ; …replace the wall by a bombed passage

.replaceByVerticalBombedPassage
    pop  af
    ld   a, OBJECT_BOMBED_PASSAGE_VERTICAL
    push af
.verticalBombableWallsEnd

    ;
    ; Configure left and right bombable walls
    ;

    cp   OBJECT_BOMBABLE_WALL_LEFT
    jr   z, .configureBombableWallLeft
    cp   OBJECT_HIDDEN_BOMBABLE_WALL_LEFT
    jr   nz, .bombableWallRight

.configureBombableWallLeft
    ; If a left bombable wall has been bombed…
    bit  1, e
    ; …replace the wall by a bombed passage
    jr   nz, .replaceByHorizontalBombedPassage

.bombableWallRight
    cp   OBJECT_BOMBABLE_WALL_RIGHT
    jr   z, .configureBombableWallRight
    cp   OBJECT_HIDDEN_BOMBABLE_WALL_RIGHT
    jr   nz, .horizontalBombableWallsEnd
.configureBombableWallRight
    ; If a right bombable wall has been bombed…
    bit  0, e
    ; …replace the wall by a bombed passage
    jr   z, .horizontalBombableWallsEnd

.replaceByHorizontalBombedPassage
    pop  af
    ld   a, OBJECT_BOMBED_PASSAGE_HORIZONTAL
    push af
.horizontalBombableWallsEnd

    ;
    ; Configure chest
    ;

    ; If object is a chest…
    cp   OBJECT_CHEST_OPEN
    jr   nz, .chestEnd
    ; … and the chest has been opened…
    bit  4, e
    jr   nz, .chestEnd
    ; a = [$FFE9]
    pop  af
    ldh  a, [$FFE9]
    push af
.chestEnd

    ;
    ; Configure hidden stairs
    ;

    ; If the object is hidden stairs…
    cp   OBJECT_HIDDEN_STAIRS_DOWN
    jr   nz, .hiddenStairsEnd
    ; … and the stairs are not visible yet…
    bit  4, e
    jr   nz, .hiddenStairsEnd
    ; return without loading this object.
    pop  af
    ret
.hiddenStairsEnd

    ;
    ; Configure stairs
    ;

    cp   OBJECT_STAIRS_DOWN
    jr   z, .configureStairs
    cp   OBJECT_HIDDEN_STAIRS_DOWN
    jr   z, .configureStairs
    cp   OBJECT_STAIRS_UP
    jr   nz, .stairsEnd

.configureStairs
    dec  bc
    ld   a, $01
    ldh  [$FFAC], a
    ld   a, [bc]
    and  $F0
    add  a, $10
    ldh  [$FFAE], a
    ld   a, [bc]
    swap a
    and  $F0
    add  a, $08
    ldh  [$FFAD], a
    inc  bc
    jp   .breakableObjectEnd
.stairsEnd

    ;
    ; Configure raised fences
    ;
    ; Raised fences can be activated: they turn into a wall
    ; jumpable from the top.
    ;
    ; POI: NB: it seems these objects are not used in the final game.
    ;

    cp   OBJECT_RAISED_FENCE_BOTTOM
    jr   z, .configureVerticalFence
    cp   OBJECT_RAISED_FENCE_TOP
    jr   nz, .verticalFenceEnd
.configureVerticalFence
    ; If the fence has been lowered…
    bit  4, e
    jr   nz, .verticalFenceEnd
    ; … replace the fence by a jumpable wall
    pop  af
    ld   a, OBJECT_WALL_TOP
    push af
.verticalFenceEnd

    cp   OBJECT_RAISED_FENCE_LEFT
    jr   z, .configureHorizontalFence
    cp   OBJECT_RAISED_FENCE_RIGHT
    jr   nz, .horizontalFenceEnd

.configureHorizontalFence
    ; If the fence has been lowered…
    bit  4, e
    jr   nz, .horizontalFenceEnd
    ; … replace the fence by a jumpable wall
    pop  af
    ld   a, OBJECT_WALL_BOTTOM
    push af
.horizontalFenceEnd

    ;
    ; Configure breakable objects
    ;

    ldh  a, [hMapId]
    cp   MAP_CAVE_B
    ldh  a, [hScratch9]
    jr   c, .bombableBlockEnd
    cp   OBJECT_BOMBABLE_BLOCK
    jr   z, .configureBreakableObject
.bombableBlockEnd

    cp   OBJECT_KEYHOLE_BLOCK
    jr   nz, .breakableObjectEnd

.configureBreakableObject
    ; If the object has been broken or activated…
    bit  6, e
    jr   z, .breakableObjectEnd
    ; … replace it by an empty floor tile
    pop  af
    ld   a, OBJECT_FLOOR_OD
    push af
.breakableObjectEnd

    ;
    ; Configure chest
    ;

    ; If the object is an closed chest…
    cp   OBJECT_CHEST_CLOSED
    jr   nz, .closedChestEnd
    ; … and the chest has already been opened…
    bit  4, e
    jr   z, .closedChestEnd
    ; … replace it by an open chest
    pop  af
    ld   a, OBJECT_CHEST_OPEN
    push af
.closedChestEnd

    ; a = multiple-blocks object direction and length
    ld   d, $00
    ldh  a, [hScratch0]
    ; If there are no coordinates for a multiple-blocks object…
    and  a
    ; … this is a single-block object:
    ; copy the object to the unpacked map and return
    jr   z, CopyObjectToActiveRoomMap


    ; This is a multiple-blocks object.
    ; hl = initial position address
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   hl, wRoomObjects
    add  hl, de
    ; e = count
    ldh  a, [hScratch0]
    and  $0F
    ld   e, a
    ; d = object type
    pop  af
    ld   d, a
    ; fallthrough FillRoomWithConsecutiveObjects

; Fill the active room map with many consecutive objects
; Inputs:
;   d      object type
;   e      count
;   hl     destination address
;   hScratch0  object data (including the direction)
FillRoomWithConsecutiveObjects::
    ; Copy object type to the active room map
    ld   a, d
    ldi  [hl], a

    ; If the object direction is vertical…
    ldh  a, [hScratch0]
    and  $40
    jr   z, .verticalEnd
    ; … increment the target address to move to the next column
    ld   a, l
    add  a, $0F
    ld   l, a
.verticalEnd

    ; While the object count didn't reach 0, loop
    dec  e
    jr   nz, FillRoomWithConsecutiveObjects

    ; Cleanup
    inc  bc
    ret


; Copy an object from the room data to the active room
; Inputs:
;  bc        object object address + 1 ([room position, object value])
;  stack[0]  object value
CopyObjectToActiveRoomMap::
    ; Load the position of the object in the room
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   hl, wRoomObjects
    add  hl, de
    ; Pop the object value from the stack
    pop  af
    ; Copy the object to the active room
    ld   [hl], a
    ; Cleanup
    inc  bc
    ret


TreeMacroHandler::
    dec  bc                                       ; $759D: $0B
    ld a, [bc]                                    ; $3339: $0a
    add  $11                                      ; $759E: $C6 $11
    ld   e, a                                     ; $75A0: $5F
    and  $0F                                      ; $75A1: $E6 $0F
    jr   nz, jr_024_75A9                          ; $75A3: $20 $04

    ld   a, e                                     ; $75A5: $7B
    sub  $10                                      ; $75A6: $D6 $10
    ld   e, a                                     ; $75A8: $5F

jr_024_75A9:
    ld   d, $00                                   ; $75A9: $16 $00
    ld   hl, wRoomObjectsArea                     ; $75AB: $21 $00 $D7
    add  hl, de                                   ; $75AE: $19
    ldh  a, [hScratch0]                           ; $75AF: $F0 $D7
    and  a                                        ; $75B1: $A7
    jr   z, jr_024_75CD                           ; $75B2: $28 $19

    and  $0F                                      ; $75B4: $E6 $0F
    ld   e, a                                     ; $75B6: $5F

jr_024_75B7:
    call func_024_75CD                            ; $75B7: $CD $CD $75
    dec  bc                                       ; $75BA: $0B
    ldh  a, [hScratch0]                           ; $75BB: $F0 $D7
    and  $40                                      ; $75BD: $E6 $40
    ld   d, $F1                                   ; $75BF: $16 $F1
    jr   z, jr_024_75C5                           ; $75C1: $28 $02

    ld   d, $0F                                   ; $75C3: $16 $0F

jr_024_75C5:
    ld   a, l                                     ; $75C5: $7D
    add  d                                        ; $75C6: $82
    ld   l, a                                     ; $75C7: $6F
    dec  e                                        ; $75C8: $1D
    jr   nz, jr_024_75B7                          ; $75C9: $20 $EC

    inc  bc                                       ; $75CB: $03
    ret                                           ; $75CC: $C9

func_024_75CD::
jr_024_75CD:
    ld   a, [hl]                                  ; $75CD: $7E
    cp   $10                                      ; $75CE: $FE $10
    ld   a, $25                                   ; $75D0: $3E $25
    jr   c, jr_024_75D6                           ; $75D2: $38 $02

    add  $04                                      ; $75D4: $C6 $04

jr_024_75D6:
    ld   [hl+], a                                 ; $75D6: $22
    ld   a, [hl]                                  ; $75D7: $7E
    cp   $10                                      ; $75D8: $FE $10
    ld   a, $26                                   ; $75DA: $3E $26
    jr   c, jr_024_75E0                           ; $75DC: $38 $02

    add  $04                                      ; $75DE: $C6 $04

jr_024_75E0:
    ld   [hl-], a                                 ; $75E0: $32
    ld   a, l                                     ; $75E1: $7D
    add  $10                                      ; $75E2: $C6 $10
    ld   l, a                                     ; $75E4: $6F
    ld   a, [hl]                                  ; $75E5: $7E
    cp   $8A                                      ; $75E6: $FE $8A
    jr   nc, jr_024_75F4                          ; $75E8: $30 $0A

    cp   $10                                      ; $75EA: $FE $10
    ld   a, $27                                   ; $75EC: $3E $27
    jr   c, jr_024_75F6                           ; $75EE: $38 $06

    ld   a, $2A                                   ; $75F0: $3E $2A
    jr   jr_024_75F6                              ; $75F2: $18 $02

jr_024_75F4:
    ld   a, $82                                   ; $75F4: $3E $82

jr_024_75F6:
    ld   [hl+], a                                 ; $75F6: $22
    ld   a, [hl]                                  ; $75F7: $7E
    cp   $8A                                      ; $75F8: $FE $8A
    jr   nc, jr_024_7606                          ; $75FA: $30 $0A

    cp   $10                                      ; $75FC: $FE $10
    ld   a, $28                                   ; $75FE: $3E $28
    jr   c, jr_024_7608                           ; $7600: $38 $06

    ld   a, $29                                   ; $7602: $3E $29
    jr   jr_024_7608                              ; $7604: $18 $02

jr_024_7606:
    ld   a, $83                                   ; $7606: $3E $83

jr_024_7608:
    ld   [hl], a                                  ; $7608: $77

jr_024_7609:
    inc  bc                                       ; $7609: $03
    ret                                           ; $760A


; Load object or objects?
Func_354B::
    push hl
    push de
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [de]
    cp   $E1
    jr   z, .label_3560
    cp   $E2
    jr   z, .label_3560
    cp   $E3
    jr   nz, .label_357C

.label_3560
    push af
    push hl
    push de
    ld   a, l
    sub  a, $11
    push af
    ld   a, [$C19C]
    ld   e, a
    inc  a
    ld   [$C19C], a
    ld   d, $00
    ld   hl, wWarpPositions
    add  hl, de
    pop  af
    ld   [hl], a
    pop  de
    pop  hl
    pop  af

.label_357C
    ld   [hl], a
    inc  de
    inc  bc
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, Func_354B
    pop  bc
    ret


Data_024_760B::
    db $00, $01, $02, $10, $11, $12, $FF

Data_024_7612::
    db $B6, $B7, $66, $67, $E3, $68

CatfishMawMacroHandler::
    push bc                                       ; $7618: $C5
    call func_024_7625                            ; $7619: $CD $25 $76
    ld   bc, Data_024_760B                        ; $761C: $01 $0B $76
    ld   de, Data_024_7612                        ; $761F: $11 $12 $76
    jp   Func_358B                               ; $7622: $C3 $8B $35

func_024_7625::
    dec  bc                                       ; $7625: $0B
    ld a, [bc]
    ld   e, a                                     ; $7626: $5F
    ld   d, $00                                   ; $7627: $16 $00
    ld   hl, wRoomObjects                         ; $7629: $21 $11 $D7
    add  hl, de                                   ; $762C: $19
    ret                                           ; $762D: $C9

Data_024_762E::
    db $00, $01, $02, $03, $04, $10, $11, $12
    db $13, $14, $20, $21, $22, $23, $24, $FF

Data_024_763E::
    db $55, $5A, $5A, $5A, $56, $57, $59, $59
    db $59, $58, $5B, $E2, $5B, $E2, $5B

TwoDoorsHouseMacroHandler::
    push bc                                       ; $764D: $C5
    call func_024_7625                            ; $764E: $CD $25 $76
    ld   bc, Data_024_762E                        ; $7651: $01 $2E $76
    ld   de, Data_024_763E                        ; $7654: $11 $3E $76
    jp   Func_358B                               ; $7657: $C3 $8B $35

Data_024_765A::
    db $00, $01, $02, $10, $11, $12, $20, $21, $22, $FF

Data_024_7664::
    db $55, $5A, $56, $57, $59, $58, $5B, $E2, $5B

LargeHouseMacroHandler::
    push bc                                       ; $766D: $C5
    call func_024_7625                            ; $766E: $CD $25 $76
    ld   bc, Data_024_765A                        ; $7671: $01 $5A $76
    ld   de, Data_024_7664                        ; $7674: $11 $64 $76
    jp   Func_358B                               ; $7677: $C3 $8B $35

Data_024_767A::
    db $00, $01, $02, $10, $11, $12, $FF

Data_024_7681::
    db $A4, $A5, $A6, $A7, $E3, $A8

PalaceDoorMacroHandler::
    push bc                                       ; $7687: $C5
    call func_024_7625                            ; $7688: $CD $25 $76
    ld   bc, Data_024_767A                        ; $768B: $01 $7A $76
    ld   de, Data_024_7681                        ; $768E: $11 $81 $76
    jp   Func_358B                               ; $7691: $C3 $8B $35

Data_024_7694::
    db   $00, $01, $10, $11, $FF

Data_024_7699::
    db   $BB, $BC, $BD, $BE

Data_024_769D::
    db   $09, $09, $09, $09

StonePigHeadMacroHandler::
    push bc                                       ; $76A1: $C5
    call func_024_7625                            ; $76A2: $CD $25 $76
    ld   bc, Data_024_7694                        ; $76A5: $01 $94 $76
    ld   de, Data_024_7699                        ; $76A8: $11 $99 $76
    ldh  a, [hRoomStatus]                         ; $76AB: $F0 $F8
    and  $04                                      ; $76AD: $E6 $04
    jr   z, jr_024_76B4                           ; $76AF: $28 $03

    ld   de, Data_024_769D                        ; $76B1: $11 $9D $76

jr_024_76B4:
    jp   Func_358B                               ; $76B4: $C3 $8B $35

Data_024_76B7::
    db $00, $01, $10, $11, $FF

Data_024_76BC::
    db $B6, $B7, $CD, $CE

PalmTreeMacroHandler::
    push bc                                       ; $76C0: $C5
    call func_024_7625                            ; $76C1: $CD $25 $76
    ld   bc, Data_024_76B7                        ; $76C4: $01 $B7 $76
    ld   de, Data_024_76BC                        ; $76C7: $11 $BC $76
    jp   Func_358B                                ; $76CA: $C3 $8B $35

Data_024_76CD::
    db $00, $01, $02, $10, $11, $12, $1F, $20
    db $21, $22, $23, $30, $31, $32, $FF

Data_024_76DC::
    db $2B, $2C, $2D, $37, $E8, $38, $0A, $33
    db $2F, $34, $0A, $0A, $0A, $0A

func_024_76EA::
    push bc                                       ; $76EA: $C5
    call func_024_7625                            ; $76EB: $CD $25 $76
    ld   bc, Data_024_76CD                        ; $76EE: $01 $CD $76
    ld   de, Data_024_76DC                        ; $76F1: $11 $DC $76
    jp   Func_358B                               ; $76F4: $C3 $8B $35

Data_024_76F7::
    db $00, $01, $02, $10, $11, $12, $FF

Data_024_76FE::
    db $52, $52, $52, $5B, $E2, $5B

SmallHouseMacroHandler::
    push bc                                       ; $7704: $C5
    call func_024_7625                            ; $7705: $CD $25 $76
    ld   bc, Data_024_76F7                        ; $7708: $01 $F7 $76
    ld   de, Data_024_76FE                        ; $770B: $11 $FE $76
    jp   Func_358B                               ; $770E: $C3 $8B $35

; ; Palette data?
; Data_024_7711::

; ; Palette data?
; Data_024_7789::

; func_024_7801::
;     ld   a, [$D00C]                               ; $7801: $FA $0C $D0
;     cp   $22                                      ; $7804: $FE $22
;     ret  nc                                       ; $7806: $D0

;     sbc  $04                                      ; $7807: $DE $04
;     ld   b, a                                     ; $7809: $47
;     and  $01                                      ; $780A: $E6 $01
;     ret  nz                                       ; $780C: $C0

;     ld   a, b                                     ; $780D: $78
;     sla  a                                        ; $780E: $CB $27
;     sla  a                                        ; $7810: $CB $27
;     ld   c, a                                     ; $7812: $4F
;     ld   b, $00                                   ; $7813: $06 $00

; func_024_7815::
;     push bc                                       ; $7815: $C5
;     ld   hl, Data_024_7711                        ; $7816: $21 $11 $77
;     add  hl, bc                                   ; $7819: $09
;     ld   bc, $08                                  ; $781A: $01 $08 $00
;     ld   de, $DC10                                ; $781D: $11 $10 $DC
;     call CopyData                                 ; $7820: $CD $14 $29
;     pop  bc                                       ; $7823: $C1
;     ld   hl, Data_024_7789                        ; $7824: $21 $89 $77
;     add  hl, bc                                   ; $7827: $09
;     ld   bc, $08                                  ; $7828: $01 $08 $00
;     ld   de, $DC48                                ; $782B: $11 $48 $DC
;     call CopyData                                 ; $782E: $CD $14 $29
;     xor  a                                        ; $7831: $AF
;     ld   [wPaletteUnknownC], a                    ; $7832: $EA $D3 $DD
;     ld   a, $20                                   ; $7835: $3E $20
;     ld   [wPaletteUnknownD], a                    ; $7837: $EA $D4 $DD
;     ld   a, $81                                   ; $783A: $3E $81
;     ld   [wPaletteDataFlags], a                    ; $783C: $EA $D1 $DD
;     ret                                           ; $783F: $C9

; ; Palette data?
; Data_024_7840::

; func_024_7A40::
;     ldh  a, [hFrameCounter]                       ; $7A40: $F0 $E7
;     and  $07                                      ; $7A42: $E6 $07
;     ret  nz                                       ; $7A44: $C0

;     ld   hl, $D022                                ; $7A45: $21 $22 $D0
;     ld   a, [hl]                                  ; $7A48: $7E
;     cp   $07                                      ; $7A49: $FE $07
;     ret  z                                        ; $7A4B: $C8

;     inc  a                                        ; $7A4C: $3C
;     ld   [hl], a                                  ; $7A4D: $77
;     swap a                                        ; $7A4E: $CB $37
;     ld   c, a                                     ; $7A50: $4F
;     ld   b, $00                                   ; $7A51: $06 $00
;     sla  c                                        ; $7A53: $CB $21
;     rl   b                                        ; $7A55: $CB $10
;     sla  c                                        ; $7A57: $CB $21
;     rl   b                                        ; $7A59: $CB $10
;     ld   hl, Data_024_7840                        ; $7A5B: $21 $40 $78
;     add  hl, bc                                   ; $7A5E: $09
;     ld   bc, $40                                ; $7A5F: $01 $40 $00
;     ld   de, $DC50                                ; $7A62: $11 $50 $DC
;     call CopyData                                 ; $7A65: $CD $14 $29
;     xor  a                                        ; $7A68: $AF
;     ld   [wPaletteUnknownC], a                    ; $7A69: $EA $D3 $DD
;     ld   a, $20                                   ; $7A6C: $3E $20
;     ld   [wPaletteUnknownD], a                    ; $7A6E: $EA $D4 $DD
;     ld   a, $82                                   ; $7A71: $3E $82
;     ld   [wPaletteDataFlags], a                    ; $7A73: $EA $D1 $DD
;     ret                                           ; $7A76: $C9

; ; Palette data?
; Data_024_7A77::
; func_024_7B77::
;     push bc                                       ; $7B77: $C5
;     ld   hl, Data_024_7A77                        ; $7B78: $21 $77 $7A
;     ld   b, $00                                   ; $7B7B: $06 $00
;     ld   c, $80                                   ; $7B7D: $0E $80

;     ld   a, d                                     ; $7B7F: $7A
;     bit  1, a                                     ; $7B80: $CB $4F
;     jr   nz, .jr_024_7B85                         ; $7B82: $20 $01
;     add  hl, bc                                   ; $7B84: $09
; .jr_024_7B85

;     ldh  a, [hMapRoom]                            ; $7B85: $F0 $F6
;     cp   $A1                                      ; $7B87: $FE $A1
;     jr   z, .jr_024_7B8E                          ; $7B89: $28 $03
;     ld   c, $40                                   ; $7B8B: $0E $40
;     add  hl, bc                                   ; $7B8D: $09
; .jr_024_7B8E

;     ld   bc, $40                                ; $7B8E: $01 $40 $00
;     ld   de, $DC10                                ; $7B91: $11 $10 $DC
;     call CopyData                                 ; $7B94: $CD $14 $29

;     xor  a                                        ; $7B97: $AF
;     ld   [wPaletteUnknownC], a                    ; $7B98: $EA $D3 $DD
;     ld   a, $20                                   ; $7B9B: $3E $20
;     ld   [wPaletteUnknownD], a                    ; $7B9D: $EA $D4 $DD
;     ld   a, $81                                   ; $7BA0: $3E $81
;     ld   [wPaletteDataFlags], a                   ; $7BA2: $EA $D1 $DD
;     pop  bc                                       ; $7BA5: $C1
;     ret                                           ; $7BA6: $C9

; BGMapAttributes_20:

; BGMapAttributes_21:
func_024_7A40:
func_024_7801:
func_024_7B77:
label_35EE:
Func_358B:

; label_3500:

; ; Use the current overworld room to load the adequate bank
; SetBankForRoom::

; Func_358B::
;     push hl
;     push de
;     ld   a, [bc]
;     ld   e, a
;     ld   d, $00
;     add  hl, de
;     pop  de
;     ld   a, [de]
;     cp   $E1
;     jr   z, .label_35A0
;     cp   $E2
;     jr   z, .label_35A0
;     cp   $E3
;     jr   nz, .label_35BC

; .label_35A0
;     push af
;     push hl
;     push de
;     ld   a, l
;     sub  a, $11
;     push af
;     ld   a, [$C19C]
;     ld   e, a
;     inc  a
;     and  $03
;     ld   [$C19C], a
;     ld   d, $00
;     ld   hl, wWarpPositions
;     add  hl, de
;     pop  af
;     ld   [hl], a
;     pop  de
;     pop  hl
;     pop  af

; .label_35BC
;     ld   [hl], a
;     call label_35CB
;     inc  de
;     inc  bc
;     pop  hl
;     ld   a, [bc]
;     and  a
;     cp   $FF
;     jr   nz, Func_358B
;     pop  bc
;     ret

; label_35CB::
;     cp   $04
;     ret  z
;     cp   $09
;     jr   nz, .label_35D9
;     ldh  a, [hMapRoom]
;     cp   $97
;     ret  nz
;     jr   label_35E8

; .label_35D9
;     cp   $E1
;     jr   nz, label_35E8
;     ldh  a, [hMapRoom]
;     cp   $0E
;     ret  z
;     cp   $0C
;     ret  z
;     cp   $1B
;     ret  z

; label_35E8::
;     ld   a, $24
;     call func_2BF
;     ret

; label_35EE::
;     dec  bc
;     ld   a, [bc]
;     ld   e, a
;     ld   d, $00
;     ld   hl, wRoomObjects
;     add  hl, de
;     ret

data_35F8::
    db $2D, $2E

LoadObject_KeyDoorTop::
    ld   e, 0
    call func_373F
    ldh  a, [hRoomStatus]
    and  $04
    jp   nz, LoadObject_OpenDoorTop
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_35F8
    jp   Func_354B

data_3613::
    db   $2F, $30

LoadObject_KeyDoorBottom::
    ld   e, $01
    call func_373F
    ldh  a, [hRoomStatus]
    and  $08
    jp   nz, LoadObject_OpenDoorBottom

    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_3613
    jp   Func_354B

data_362E::
    db   $31, $32

LoadObject_KeyDoorLeft::
    ld   e, $02
    call func_373F
    ldh  a, [hRoomStatus]
    and  $02
    jp   nz, LoadObject_OpenDoorLeft

    push bc
    call label_35EE
    ld   bc, data_37E4
    ld   de, data_362E
    jp   Func_354B

data_3649::
    db   $33, $34

LoadObject_KeyDoorRight::
    ld   e, $03
    call func_373F
    ldh  a, [hRoomStatus]
    and  $01
    jp   nz, LoadObject_OpenDoorRight

    push bc
    call label_35EE
    ld   bc, data_37E4
    ld   de, data_3649
    jp   Func_354B

LoadObject_ClosedDoorTop::
    ld   e, $04
    call func_373F
    ld   a, [$C18A]
    or   $01
    ld   [$C18A], a
    ld   [$C18B], a
    jp   LoadObject_OpenDoorTop

LoadObject_ClosedDoorBottom::
    ld   e, $05
    call func_373F
    ld   a, [$C18A]
    or   $02
    ld   [$C18A], a
    ld   [$C18B], a
    jp   LoadObject_OpenDoorBottom

LoadObject_ClosedDoorLeft::
    ld   e, $06
    call func_373F
    ld   a, [$C18A]
    or   $04
    ld   [$C18A], a
    ld   [$C18B], a
    jp   LoadObject_OpenDoorLeft

LoadObject_ClosedDoorRight::
    ld   e, $07
    call func_373F
    ld   a, [$C18A]
    or   $08
    ld   [$C18A], a
    ld   [$C18B], a
    jp   LoadObject_OpenDoorRight

data_36B0::
    db   $43, $44

LoadObject_OpenDoorTop::
    ld   a, $04
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_36B0
    jp   Func_354B

; Set hRoomStatus depending on the map and room
label_36C4::
    push af
    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, $00
    ldh  a, [hMapId]
    cp   $1A
    jr   nc, label_36E1
    cp   $06
    jr   c, label_36E1
    inc  d

label_36E1::
    ld hl, wIndoorARoomStatus
    add  hl, de
    pop  af
    or   [hl]
    ld   [hl], a
    ldh  [hRoomStatus], a
    ret

data_36E8::
    db $8C, 8

LoadObject_OpenDoorBottom::
    ld   a, 8
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_36E8
    jp   Func_354B

data_36FC::
    db 9, $A

LoadObject_OpenDoorLeft::
    ld   a, $02
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E4
    ld   de, data_36FC
    jp   Func_354B

data_3710::
    db $B, $C

LoadObject_OpenDoorRight::
    ld   a, $01
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E4
    ld   de, data_3710
    jp   Func_354B

data_3724::
    db $A4, $A5

LoadObject_BossDoor::
    ld   e, $08
    call func_373F
    ldh  a, [hRoomStatus]
    and  $04
    jp   nz, LoadObject_OpenDoorTop
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_3724
    jp   Func_354B

func_373F::
    ld   d, $00
    ld   hl, $C1F0
    add  hl, de
    dec  bc
    ld   a, [bc]
    ld   [hl], a
    push af
    and  $F0
    ld   hl, $C1E0
    add  hl, de
    ld   [hl], a
    pop  af
    swap a
    and  $F0
    ld   hl, $C1D0
    add  hl, de
    ld   [hl], a
    inc  bc
    ret

data_375C::
    db   $AF, $B0

LoadObject_StairsDoor::
    push bc                                       ; $375E: $C5
    call label_35EE                               ; $375F: $CD $EE $35
    ld   bc, data_37E4                            ; $3762: $01 $E4 $37
    ld   de, data_375C                            ; $3765: $11 $5C $37
    jp   Func_354B                                ; $3768: $C3 $4B $35

data_376B::
    db   $B1, $B2

LoadObject_FlipWall::
    push bc                                       ; $376D: $C5
    call label_35EE                               ; $376E: $CD $EE $35
    ld   bc, data_37E1                            ; $3771: $01 $E1 $37
    ld   de, data_376B                            ; $3774: $11 $6B $37
    jp   Func_354B                                ; $3777: $C3 $4B $35

data_377A::
    db   $45, $46

LoadObject_OneWayArrow::
    push bc                                       ; $377C: $C5
    call label_35EE                               ; $377D: $CD $EE $35
    ld   bc, data_37E1                            ; $3780: $01 $E1 $37
    ld   de, data_377A                            ; $3783: $11 $7A $37
    jp   Func_354B                               ; $3786: $C3 $4B $35

data_3789::
    db   0, 1, 2, 3, $10, $11, $12, $13, $20, $21, $22, $23, $FF

data_3796::
    db   $B3, $B4, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD

LoadObject_DungeonEntrance::
    ld   a, $08                                   ; $37A2: $3E $08
    call label_36C4                               ; $37A4: $CD $C4 $36
    push bc                                       ; $37A7: $C5
    call label_35EE                               ; $37A8: $CD $EE $35
    ld   bc, data_3789                            ; $37AB: $01 $89 $37
    ld   de, data_3796                            ; $37AE: $11 $96 $37
    jp   Func_354B                               ; $37B1: $C3 $4B $35

data_37B4::
    db   $C1, $C2

LoadObject_IndoorEntrance::
    ; If MapId < $1A…
    ldh  a, [hMapId]
    cp   MAP_UNKNOWN_1A
    jr   nc, .end

    ; … and MapId >= MAP_EAGLES_TOWER…
    cp   MAP_EAGLES_TOWER
    jr   c, .end

    ; … and MapRoom == $D3…
    ldh  a, [hMapRoom]
    cp   $D3
    jr   nz, .end

    ; … and HasStolenFromShop != 0…
    ld   a, [wHasStolenFromShop]
    and  a
    jr   z, .end

    ; … handle special case.
    jp   LoadObject_ClosedDoorBottom

.end

    ld   a, $01
    call label_36C4
    push bc
    call label_35EE
    ld   bc, data_37E1
    ld   de, data_37B4
    ; tail-call jump
    jp   Func_354B

data_37E1::
    db   $00
    db   $01
    db   $FF

data_37E4::
    db   $00
    db   $10
    db   $FF

; Fill all the active room map with the same object
; Inputs:
;   a   the object type to fill the map with
FillRoomMapWithObject::
    ldh  [$FFE9], a
    ld   d, TILES_PER_MAP
    ld   hl, wRoomObjects
    ld   e, a

.loop
    ld   a, l
    and  $0F
    jr   z, .continue
    cp   $0B ; TILES_PER_ROW+1
    jr   nc, .continue
    ld   [hl], e

.continue
    inc  hl
    dec  d
    jr   nz, .loop
    ret

; Retrieve the entities list for this room, and load each entity from its definition.
LoadRoomEntities::
    callsb UpdateRecentRoomsList

    ld   a, BANK(OverworldEntitiesPointersTable)
    ld   [MBC3SelectBank], a

    ; Reset the entities load order
    xor  a
    ldh  [hScratchD], a

    ; bc = [hMapRoom] * 2
    ldh  a, [hMapRoom]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b

    ;
    ; Compute the proper entities pointers table for the room
    ;

    ; If on overworld, we're skipEntityLoad.
    ld   hl, OverworldEntitiesPointersTable
    ld   a, [wIsIndoor]
    and  a
    jr   z, .pointersTableEnd

    ; The room is indoors.

    ; If in Eagle's Tower…
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
    jr   nz, .eaglesTowerEnd
    ; … and [hMapRoom] == [wWreckingBallRoom]…
    ld   a, [wWreckingBallRoom]
    ld   hl, hMapRoom
    cp   [hl]
    jr   nz, .eaglesTowerEnd
    ; place the wrecking ball
    ld   a, ENTITY_WRECKING_BALL
    call SpawnNewEntity_trampoline
    ld   a, [wWreckingBallPosX]
    ld   hl, wEntitiesPosXTable
    add  hl, de
    ld   [hl], a
    ld   a, [wWreckingBallPosY]
    ld   hl, wEntitiesPosYTable
    add  hl, de
    ld   [hl], a
    call LoadEntityFromDefinition.didLoadEntity
    ld   hl, wEntitiesLoadOrderTable
    add  hl, de
    ld   [hl], $FF
    xor  a
    ldh  [hScratchD], a
.eaglesTowerEnd

    ; By default, use the IndoorsA pointers table
    ld   hl, IndoorsAEntitiesPointersTable

    ; If on the Color Dungeon, use ColorDungeonEntitiesPointersTable
    ldh  a, [hMapId]
    ; If on a map between $06 and $1A…
    cp   MAP_UNKNOWN_1A
    jr   nc, .pointersTableEnd
    cp   MAP_EAGLES_TOWER
    jr   c, .pointersTableEnd
    ; … use IndoorsBEntitiesPointersTable
    ; (by incrementing H from $42 to $44)
    inc  h
    inc  h
.pointersTableEnd

    ; Read the entities list address in the pointers table
    add  hl, bc
    ld   a, [hli]
    ld   c, a
    ld   a, [hl]
    ld   b, a

    ; For each entity definition in the target list…
.loop
    ; if the end of list is reached, break
    ld   a, [bc]
    cp   ENTITIES_END
    jr   z, .break
    ; otherwise load the entity definition.
    call LoadEntityFromDefinition
    jr   .loop
.break

    call ReloadSavedBank
    ret

; Array indexed by load order
EntityMask_387B::
    db   %00000001
    db   %00000010
    db   %00000100
    db   %00001000
    db   %00010000
    db   %00100000
    db   %01000000
    db   %10000000

; Load an entity for the current room from an entity definition.
; An entity definition is 2 bytes:
;   - vertical and horizontal position
;   - entity type
; See files in `data/entities/` for more infos.
;
; Inputs:
;   bc   address of the entity definition
LoadEntityFromDefinition::
    ; a = entity load order
    ldh  a, [hScratchD]

    ; If the load order < 8…
    cp   $08
    jr   nc, .skipClearedEntityEnd
    ; and EntityMask_387B[hScratchD] & wEntitiesClearedRooms[hMapRoom] != 0,
    ld   e, a
    ld   d, $00
    ld   hl, EntityMask_387B
    add  hl, de
    ldh  a, [hMapRoom]
    ld   e, a
    ld   a, [hl]
    ld   hl, wEntitiesClearedRooms
    add  hl, de
    and  [hl]
    ; … then the entity has been cleared previously: don't load it.
    jr   nz, .skipEntityLoad
.skipClearedEntityEnd

    ; de = $0000
    ld   e, $00
    ld   d, e
    ; Find the first available slot (i.e. ENTITY_STATUS_DISABLED)
.loop
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    cp   ENTITY_STATUS_DISABLED
    jr   z, .createEntityAndReturn
    ; If this slot is not available, try until we reach the last slot
    inc  e
    ld   a, e
    cp   $10
    jr   nz, .loop
    ; If all slots are unavailable, skip this entity

.skipEntityLoad
    ; Increment the entity load order anyway
    ld   hl, hScratchD
    inc  [hl]
    ; Increment the address to the next definition in the list
    inc  bc
    inc  bc
    ret

.createEntityAndReturn
    ; Mark the entity as being initialized
    ld   [hl], ENTITY_STATUS_INIT
    ; Set the entity horizontal position (lowest nybble of first byte)
    ld   a, [bc]
    and  $F0
    ld   hl, wEntitiesPosYTable
    add  hl, de
    add  a, $10
    ld   [hl], a
    ; Set the entity horizontal position (highest nybble of first byte)
    ld   a, [bc]
    inc  bc
    swap a
    and  $F0
    ld   hl, wEntitiesPosXTable
    add  hl, de
    add  a, $08
    ld   [hl], a
    ; Set the entity type
    ld   hl, wEntitiesTypeTable
    add  hl, de
    ld   a, [bc]
    inc  bc
    ld   [hl], a

.didLoadEntity
    callsb ConfigureNewEntity_helper
    callsb PrepareEntityPositionForRoomTransition
    ; Restore bank for entities placement data
    ld   a, BANK(OverworldEntitiesPointersTable)
    ld   [MBC3SelectBank], a
    ret

; Load the template for an indoor room
;   a: the template to use (see ROOM_TEMPLATE_* constants)
LoadRoomTemplate_trampoline::
    ; Load bank for LoadRoomTemplate
    ld   e, a
    ld   a, BANK(LoadRoomTemplate)
    ld   [MBC3SelectBank], a
    ld   a, e

    ; Call function
    push bc
    call LoadRoomTemplate
    pop  bc

    ; Restore previous bank
    ldh  a, [hRoomBank]
    ld   [MBC3SelectBank], a
    ret

LoadTileset0E_trampoline::
    ld a, $01                                     ; $37db: $3e $01
    ld [$2100], a                                 ; $37dd: $ea $00 $21
    call $7ee8                                    ; $37e0: $cd $e8 $7e
    ret                                           ; $37e3: $c9

    db "@@"


include "code/home/entities.asm"

label_3F93::
    ld   a, BANK(Data_005_59DE)
    ld   [MBC3SelectBank], a
    ld   hl, Data_005_59DE
    ld   de, vTiles0 + $460
    ld   bc, $10
    call CopyData
    ld   hl, Data_005_59EE
    jr   label_3FBD

label_3FA9::
    ld   a, BANK(Data_005_59FE)
    ld   [MBC3SelectBank], a
    ld   hl, Data_005_59FE
    ld   de, vTiles0 + $460
    ld   bc, $10
    call CopyData
    ld   hl, Data_005_5A0E

label_3FBD::
    ld   de, vTiles0 + $480
    ld   bc, $10
    call CopyData
    xor  a
    ldh  [$FFA5], a
    ld   a, BANK(LinkCharacterTiles)
    ld   [MBC3SelectBank], a
    jp   DrawLinkSpriteAndReturn
