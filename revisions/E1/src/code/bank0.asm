; Code for bank 0 ("Home").
; Unlike other banks, this code is always adressable at `00:xxxx`, without
; the need to switch banks.

include "code/home/init.asm"
include "code/home/render_loop.asm"
include "code/home/interrupts.asm"

; Switch to the bank defined in a, and save the active bank
SwitchBank::
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    ret

; Switch to the bank defined in a, depending on GB or GBC mode
SwitchAdjustedBank::
    call AdjustBankNumberForGBC
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
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
    call AdjustBankNumberForGBC
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

;
; Palette-related code in bank $20
;

func_020_6A30_trampoline::
    callsb func_020_6A30

RestoreBankAndReturn::
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

func_020_6AC1_trampoline::
    callsb func_020_6AC1
    jr   RestoreBankAndReturn

func_020_6BA4_trampoline::
    callsb func_020_6BA4
    jr   RestoreBankAndReturn

ClearFileMenuBG_trampoline::
    push af
    callsb func_020_6BDC
    jr   RestoreStackedBankAndReturn

; Load file menu background and palette, then switch back to bank 1
LoadFileMenuBG_trampoline::
    callsb LoadFileMenuBG
    jr   LoadBank1AndReturn

CopyLinkTunicPalette_trampoline::
    callsb CopyLinkTunicPalette

LoadBank1AndReturn::
    ld   a, $01
    ld   [MBC3SelectBank], a
    ret

func_91D::
    push af
    ld   b, $00
    ld   a, [$DDD8]
    sla  a
    rl   b
    sla  a
    rl   b
    ld   c, a
    jr   .jp_92F

.jp_92E
    push af

.jp_92F
    callsb GetBGAttributesAddressForObject
    ldh  a, [hScratch8]
    ld   [MBC3SelectBank], a
    ld   hl, $DC91
    ld   a, [$DC90]
    ld   e, a
    add  a, $0A
    ld   [$DC90], a
    ld   d, $00
    add  hl, de
    ldh  a, [hScratch9]
    ld   d, a
    ldh  a, [hScratchA]
    ld   e, a
    ldh  a, [$FFCF]
    ldi  [hl], a
    ldh  a, [$FFD0]
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    inc  de
    inc  de
    ld   a, [de]
    ldi  [hl], a
    dec  de
    ldh  a, [$FFCF]
    ldi  [hl], a
    ldh  a, [$FFD0]
    inc  a
    ldi  [hl], a
    ld   a, $81
    ldi  [hl], a
    ld   a, [de]
    ldi  [hl], a
    inc  de
    inc  de
    ld   a, [de]
    ldi  [hl], a
    xor  a
    ldi  [hl], a

; Restore bank saved on stack and return
RestoreStackedBankAndReturn::
    pop  af
    ld   [MBC3SelectBank], a
    ret

func_020_6D0E_trampoline::
    push af
    callsb func_020_6D0E
    jr   RestoreStackedBankAndReturn

; Load palette data
; Inputs:
;   b   ???
;   de  ???
; Returns:
;   a   palette data
func_983::
    ; Retrieve and store palette data into hScratch9 and hScratchA
    callsb func_01A_6710

    ; Switch to the bank containing this room's palettes
    ldh  a, [hScratch8]
    ld   [MBC3SelectBank], a

    ; Read value from address [hScratchA hScratch9]
    ldh  a, [hScratch9]
    ld   h, a
    ldh  a, [hScratchA]
    ld   l, a
    ld   a, [hl]

    inc  de
    ret

; Inputs:
;   a   ???
;   b   ???
;   de  ???
func_999::
    push af
    push bc
    call func_983

    ldh  [hScratch0], a
    pop  bc
    call func_983
    ldh  [hScratch1], a
    ld   a, [$DC90]
    ld   c, a
    ld   b, $00
    add  a, $05
    ld   [$DC90], a
    ld   hl, $DC91
    add  hl, bc
    ldh  a, [$FFCF]
    ldi  [hl], a
    ldh  a, [$FFD0]
    ldi  [hl], a
    ld   a, $01
    ldi  [hl], a
    ldh  a, [hScratch0]
    ldi  [hl], a
    ldh  a, [hScratch1]
    ldi  [hl], a
    xor  a
    ldi  [hl], a
    jr   RestoreStackedBankAndReturn

GetEntityInitHandler_trampoline::
    push af
    ; Will lookup something in an entity id table
    callsb GetEntityInitHandler
    jr   RestoreStackedBankAndReturn

func_020_4874_trampoline::
    push af
    callsb func_020_4874
    jr   RestoreStackedBankAndReturn

func_020_4954_trampoline::
    push af
    callsb func_020_4954
    jp   RestoreStackedBankAndReturn

ReplaceObjects56and57_trampoline::
    push af
    callsb ReplaceObjects56and57
    jp   RestoreStackedBankAndReturn

;
; Specific data-copying routines
;

; Copy $100 bytes without DMA (used on DMG), then switch back to bank at h
; Inputs:
;  b   source address high byte
;  c   destination address high byte
;  h   bank to switch back after the transfert
Copy100Bytes_noDMA::
    ; Save h
    push hl

    ; Copy $100 bytes from "${b}00" to "${c}80"
    ld   l, $00
    ld   e, l
    ld   h, b
    ld   a, c
    add  a, $80
    ld   d, a
    ld   bc, $100
    call CopyData

    ; Switch back to the bank in h
    pop  hl
    jr   SelectBankAtHAndReturn

; Copy $100 bytes from bank at a, then switch back to bank at h
; Inputs:
;  a   bank to copy data from
;  b   source address high byte
;  c   destination address high byte
;  h   bank to switch back after the transfert
Copy100BytesFromBankAtA::
    ; Switch to bank in a
    ld   [MBC3SelectBank], a

    ; If running on DMG, use a loop to copy the data
    ldh  a, [hIsGBC]
    and  a
    jr   z, Copy100Bytes_noDMA

    ; On CGB, configure a DMA transfert
    ; to copy $0F bytes from "${b}00" to "${c}00"
    ld   a, b
    ld   [rHDMA1], a
    ld   a, $00
    ld   [rHDMA2], a
    ld   a, c
    ld   [rHDMA3], a
    ld   a, $00
    ld   [rHDMA4], a
    ld   a, $0F
    ld   [rHDMA5], a

    ; Fallthrough to switch back to the bank in h
SelectBankAtHAndReturn::
    ld   a, h
    ld   [MBC3SelectBank], a
    ret

; Copy Color Dungeon tiles?
CopyColorDungeonSymbols::
    push af
    ld   a, BANK(ColorDungeonNpcTiles)
    ld   [MBC3SelectBank], a
    ld   hl, ColorDungeonNpcTiles + $F00
    ld   de, $DCC0
    ld   bc, $20
    call CopyData
    jp   RestoreStackedBankAndReturn

;
; Various trampolines
;

func_036_505F_trampoline::
    push af
    callsb func_036_505F
    jp   RestoreStackedBankAndReturn

func_036_4F9B_trampoline::
    push af
    callsb func_036_4F9B
    jp   RestoreStackedBankAndReturn

func_A5F::
    push af
    ld   a, $20
    ld   [MBC3SelectBank], a
    call RenderActiveEntitySpritesRect
    jp   RestoreStackedBankAndReturn

func_003_5A2E_trampoline::
    push af
    callsb func_003_5A2E
    jp   RestoreStackedBankAndReturn

func_036_4F68_trampoline::
    push af
    callsb func_036_4F68
    jp   RestoreStackedBankAndReturn

func_020_6D52_trampoline::
    push af
    callsb func_020_6D52
    jp   RestoreStackedBankAndReturn

func_036_4BE8_trampoline::
    push af
    callsb func_036_4BE8
    jp   RestoreStackedBankAndReturn

func_A9B::
    push af
    ld   a, BANK(FontTiles)
    call SwitchBank
    call ExecuteDialog
    jp   RestoreStackedBankAndReturn

func_036_705A_trampoline::
    push af
    callsw func_036_705A

RestoreStackedBank::
    pop  af
    call SwitchBank
    ret

func_AB5::
    push af
    callsb func_024_5C1A
    ld   de, wRequest
    call ExecuteBackgroundCopyRequest
    jr   RestoreStackedBank

func_036_703E_trampoline::
    push af
    callsb func_036_703E
    jp   RestoreStackedBankAndReturn

func_036_70D6_trampoline::
    push af
    callsb func_036_70D6
    jp   RestoreStackedBankAndReturn

func_036_4A77_trampoline::
    push af
    callsw func_036_4A77
    jp   RestoreStackedBankAndReturn

func_036_4A4C_trampoline::
    push af
    callsb func_036_4A4C
    jp   RestoreStackedBankAndReturn

func_036_7161_trampoline::
    push af
    callsb func_036_7161
    jp   RestoreStackedBankAndReturn

; Load Background map and attributes for photo
LoadPhotoBgMap_trampoline::
    callsb LoadPhotoBgMap
    ret

unklabel:
    push af
    callsb fn_036_72d5
    jp RestoreStackedBankAndReturn

; Toogle an extra byte to the bank number on GBC (on DMG, does nothing)
; Input:  a: the bank number to adjust
; Output: a: the adjusted bank number
AdjustBankNumberForGBC::
    push bc
    ld   b, a
    ldh  a, [hIsGBC]
    and  a           ; if !isGBC
    jr   z, .notGBC  ;   handle standard GB
    ld   a, b        ; else
    or   $20         ;   set 6-th bit of `a` to 1
    pop  bc          ;   restore registers
    ret              ;   return a
.notGBC
    ld   a, b        ; return the original value of a
    pop  bc
    ret

; Copy a block of data from a given bank to a target address in WRAM2,
; then return to bank 20.
; Inputs:
;   hScratch0 : source bank
;   bc :        number of bytes to copy
;   de :        destination address
;   hl :        source address
CopyObjectsAttributesToWRAM2::
    ldh  a, [hScratch0]
    ld   [MBC3SelectBank], a
    ld   a, $02
    ld   [rSVBK], a
    call CopyData
    xor  a
    ld   [rSVBK], a
    ; Restore bank $20
    ld   a, $20
    ld   [MBC3SelectBank], a
    ret

; On GBC, copy some overworld objects to ram bank 2
func_2BF::
    ldh  [hScratch2], a
    ldh  a, [hIsGBC]
    and  a
    ret  z

    ld   a, [wIsIndoor]
    and  a
    ret  nz

    push bc
    ldh  a, [hScratch2]
    and  $80
    jr   nz, .else
    callsb func_020_6E50
    jr   c, .endIf
.else
    ld   b, [hl]
    ld   a, $02
    ld   [rSVBK], a
    ld   [hl], b
    xor  a
    ld   [rSVBK], a
.endIf

    ldh  a, [hScratch2]
    and  $7F
    ld   [MBC3SelectBank], a
    pop  bc
    ret

; Copy data from bank in a, then switch back to bank $28
CopyData_trampoline::
    ld   [MBC3SelectBank], a
    call CopyData
    ld   a, $28
    ld   [MBC3SelectBank], a
    ret

; Copy data to vBGMap0
; Inputs:
;   a           source bank
;   hl          source address
;   hhScratchF  return bank to restore
CopyBGMapFromBank::
    push hl
    ld   [MBC3SelectBank], a

    ; If on GBC…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .gbcEnd
    ; hl += $168
    ld   de, $168
    add  hl, de
    ; Switch to RAM bank 1
    ld   a, $01
    ld   [rVBK], a
    call CopyToBGMap0
    ; Switch back to RAM bank 0
    xor  a
    ld   [rVBK], a
.gbcEnd

    pop  hl
    push hl
    call CopyToBGMap0
    pop  hl

    ld   a, [wGameplayType]
    cp   GAMEPLAY_PHOTO_ALBUM
    jr   nz, .photoAlbumEnd
    call func_BB5
.photoAlbumEnd

    ldh  a, [hScratchF]
    ld   [MBC3SelectBank], a
    ret

CopyToBGMap0::
    ld   de, vBGMap0

.loop
    ld   a, [hli]
    ld   [de], a
    inc  e
    ld   a, e
    and  $1F
    cp   $14
    jr   nz, .loop
    ld   a, e
    add  a, $0C
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a
    cp   $9A
    jr   nz, .loop
    ld   a, e
    cp   $40
    jr   nz, .loop
    ret

func_BB5::
    ld   bc, $168
    ld   de, $D000
    jp   CopyData

LoadBaseTiles_trampoline::
    push af
    call LoadBaseTiles
    jp   RestoreStackedBankAndReturn

func_BC5::
    ld   a, [$D16A]
    ld   [MBC3SelectBank], a
.loop
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  b
    jr   nz, .loop

    ld   a, $28
    ld   [MBC3SelectBank], a
    ret

; Generic trampoline, for calling a function into another bank.
Farcall::
    ; Switch to bank wFarcallBank
    ld   a, [wFarcallBank]
    ld   [MBC3SelectBank], a
    ; Call the target function
    call Farcall_trampoline
    ; Switch back to bank wFarcallReturnBank
    ld   a, [wFarcallReturnBank]
    ld   [MBC3SelectBank], a
    ret

; Jump to address in wFarcallAdressHigh, wFarcallAdressLow
Farcall_trampoline::
    ld   a, [wFarcallAdressHigh]
    ld   h, a
    ld   a, [wFarcallAdressLow]
    ld   l, a
    jp   hl

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
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd
    ld   hl, ColorDungeonTilesetsTable
    jr   .readTilesetFromTable
.colorDungeonEnd

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

    ; If on prairie north, but not on the Camera Shoop room,
    ; treat the tileset as TILESET_KEEP: nothing to do.
    cp   W_TILESET_CAMERA_SHOP
    jr   nz, .cameraShopEnd
    ldh  a, [hMapRoom]
    cp   $37 ; camera shop room
    jr   nz, .tilesetEnd
    ld   a, [hl]
.cameraShopEnd

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
    jr   z, .label_DC1
    ldh  a, [hMapId]
    cp   MAP_HOUSE
    jr   nz, .label_DDB
    ldh  a, [hMapRoom]
    cp   $B5
    jr   nz, .label_DDB
    ld   e, $3D
    jr   .label_DDB

.label_DC1
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
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .label_DF1
    ld   a, $01
    ldh  [hNeedsUpdatingEnnemiesTiles], a
    jr   .return

.label_DF1
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

    ; If GameplayType > INVENTORY (i.e. photo album and pictures)
    ld   a, [wGameplayType]
    cp   GAMEPLAY_INVENTORY
    jr   nc, jumpToGameplayHandler

    ; If not all A + B + Start + Select buttons are pressed
    ldh  a, [hPressedButtonsMask]
    cp   J_A | J_B | J_START | J_SELECT
    jr   nz, jumpToGameplayHandler

    ; If $D474 != 0
    ld   a, [$D474]
    and  a
    jr   nz, jumpToGameplayHandler

    ; If $D464 != 0
    ld   a, [$D464]
    and  a
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
._0C dw InventoryHandler
._0D dw PhotoAlbumHandler
._0E dw PhotoPictureHandler ; Dizzy Link photo
._0F dw PhotoPictureHandler ; Good-looking Link photo
._10 dw PhotoPictureHandler ; Marin cliff photo (with cutscene)
._11 dw PhotoPictureHandler ; Marin well photo
._12 dw PhotoPictureHandler ; Mabe village photo (with cutscene)
._13 dw PhotoPictureHandler ; Ulrira photo
._14 dw PhotoPictureHandler ; Bow-wow photo (with cutscene)
._15 dw PhotoPictureHandler ; Thief photo
._16 dw PhotoPictureHandler ; Fisherman photo
._17 dw PhotoPictureHandler ; Zora photo
._18 dw PhotoPictureHandler ; Kanalet Castle photo (with cutscene)
._19 dw PhotoPictureHandler ; Ghost photo
._1A dw PhotoPictureHandler ; Bridge photo

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
    jpsw FileSaveEntryPoint

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

InventoryHandler::
    jpsw InventoryEntryPoint

PhotoAlbumHandler::
    callsw PhotoAlbumEntryPoint
    jp   returnFromGameplayHandler

PhotoPictureHandler::
    jpsw PhotosEntryPoint

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

    callsb func_20_4B1F

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
    callsb func_020_5C9C

label_1012::
    callsw func_014_54F8

returnFromGameplayHandler::
    ; Present dialog if needed
    ld   a, BANK(FontTiles)
    call SwitchBank
    call ExecuteDialog

    ; If on DMG, return now to the main game loop
    ldh  a, [hIsGBC]
    and  a
    ret  z

    ; Load Background palettes if needed
    ; (and then return to the main game loop)
    ld   a, BANK(LoadBGPalettes)
    call SwitchBank
    jp   LoadBGPalettes

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
    ld   a, [wDialogState]
    ld   hl, $C167
    or   [hl]
    ld   hl, wRoomTransitionState
    or   [hl]
    jr   nz, .jp_10DB
    ld   a, [$D464]
    and  a
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
    ld   [$DDD6], a
    ld   [$DDD7], a
    ld   [$D464], a
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
    callsb func_036_725A
    and  a
    ret  z

    jpsw label_002_4287

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
    ; Special code for the Color Dungeon
    callsb func_020_48CA
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
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

    call ResetPegasusBoots
    ld   a, $01
    ld   [$C1C7], a
    xor  a
    ld   [$C1C8], a
    ret

UseHookshot::
    ld   a, [$C1A4]
    and  a
    ret  nz
    jp   FireHookshot

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

SetShieldVals::
    ld   a, $01
    ld   [wIsUsingShield], a
    ld   a, [wShieldLevel]
    ld   [wHasMirrorShield], a
    ; fallthrough

func_020_4B4A_trampoline::
    callsb func_020_4B4A
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

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

func_1373::
    callsb func_020_4B81
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

UsePowerBracelet::
    ret

UseBoomerang::
    ld   a, [wActiveProjectileCount]
    and  a
    ret  nz

    ld   a, ENTITY_BOOMERANG
    call SpawnPlayerProjectile
    ret  c

    callsb func_020_4BFF
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

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
    callsb func_020_4C47
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

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
    jpsw CheckPositionForMapTransition

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

func_1819::
    callsb func_020_4AB3
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

func_1828::
    callsb func_020_49BA
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

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
    ld   [$DDD6], a
    ld   [$DDD7], a

    ld   e, $10
    ld   hl, wEntitiesStatusTable
.clearEntitiesStatusLoop
    ldi  [hl], a
    dec  e
    jr   nz, .clearEntitiesStatusLoop

    ld   a, [$C509]
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
    ld   a, [$DC0C]
    or   $40
    ld   [$DC0C], a
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
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd
    ld   hl, MapLayout11
    jr   .label_193C
.colorDungeonEnd

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
    cp   MAP_COLOR_DUNGEON
    jr   nz, .label_1993
    ld   hl, Data_014_4E3C
    jr   .label_19A4

.label_1993
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
    cp   MAP_COLOR_DUNGEON
    jr   nz, .label_19B7
    ld   a, $3A
    jr   .label_19BF

.label_19B7
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
    xor a
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
    ret nz

.label_1A06
    ld   a, [$D463]
    cp   $01
    jr   z, .label_1A0F
    ld   a, $00

.label_1A0F
    ld   [wLinkMotionState], a
    ld   a, [wDidStealItem]
    and  a
    ret z
    xor  a
    ld   [wDidStealItem], a
    ld   a, $36
    jp   OpenDialog

func_1A22::
    callsb func_020_6C4F
    callsb func_020_55CA
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

func_1A39::
    callsb func_020_6C7A
    callsb func_020_563B
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

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
    call AdjustBankNumberForGBC
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
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ret

label_1E69::
    ld   a, BANK(EndingTiles)
    call AdjustBankNumberForGBC
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
    call AdjustBankNumberForGBC
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
    call AdjustBankNumberForGBC
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
    call AdjustBankNumberForGBC
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
    push af
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    pop  af
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
    ret nz

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
    cp   $2D
    jr   z, .jr_2093

.jr_2088
    call OpenDialogInTable1
    jp   .specialCasesEnd

.jr_208E
    call OpenDialog
    jr   .specialCasesEnd

.jr_2093
    call OpenDialogInTable2
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
    callsb func_014_5900
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
    ret nz
    ldh  a, [hPressedButtonsMask]
    and  J_A
    ret z

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
    ret c
    xor  a
    ldh  [$FFE5], a
    ldh  a, [hScratch0]
    cp   $8E
    jr   z, .jr_2153
    cp   $20
    jr   z, .jr_2153
    ld   a, [wIsIndoor]
    and  a
     ret nz
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

func_014_5526_trampoline::
    callsb func_014_5526
    jp   ReloadSavedBank

label_2183::
    ld   a, ENTITY_ENTITY_LIFTABLE_ROCK
    call SpawnPlayerProjectile
    ret c

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

; Increment the BG map offset by this amount during room transition,
; depending on the transition direction.
BGRegionIncrement::
.right  db $10
.left   db $10
.top    db $01
.bottom db $01

; Update a region (row or column) of the BG map during room transition
UpdateBGRegion::
    ; Switch to Map Data bank
    ld   a, $08
    ld   [MBC3SelectBank], a
    call DoUpdateBGRegion
    ; Reload saved bank and return
    jp   ReloadSavedBank

IncrementBGMapSourceAndDestination_Vertical::
    ld   a, [wBGUpdateRegionOriginLow]
    and  $20
    jr   z, .noColumnEnd
    inc  hl
    inc  hl
.noColumnEnd

    ld   a, [hli]
    ld   [bc], a
    inc  bc
    ld   a, [hl]
    ld   [bc], a
    inc  bc
    ret

IncrementBGMapSourceAndDestination_Horizontal::
    ld   a, [wBGUpdateRegionOriginLow]
    and  $01
    jr   z, .noColumnEnd
    inc  hl
.noColumnEnd

    ld   a, [hli]
    ld   [bc], a
    inc  hl
    inc  bc
    ld   a, [hl]
    ld   [bc], a
    inc  bc
    ret

; Update a region (row or column) of the BG map during room transition
DoUpdateBGRegion::
    ; Configures an async data request to copy background tilemap
    callsb func_020_4A76

    ; Switch back to Map Data bank
    ld   a, $08
    ld   [MBC3SelectBank], a

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

    ; If running on GBC…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .ramSwitchEnd
    ; … and is indoor…
    ld   a, [wIsIndoor]
    and  a
    jr   nz, .ramSwitchEnd
    ; … switch to RAM Bank 2,
    ld   a, $02
    ld   [rSVBK], a
    ; read hl,
    ld   c, [hl]
    ; switch back to RAM Bank 0.
    xor  a
    ld   [rSVBK], a
.ramSwitchEnd

    sla  c
    rl   b
    sla  c
    rl   b

    ;
    ; Map base address selection
    ;

    ; If IsIndoor…
    ld   a, [wIsIndoor]
    and  a
    jr   z, .baseAddress_isOverworld
    ld   hl, IndoorObjectsTilemapDMG
    ; if IsGBC…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .palettesskipEntityLoad
    ; … hl = (MapId == MAP_COLOR_DUNGEON ? ColorDungeonObjectsTilemap : IndoorObjectsTilemapCGB)
    ld   hl, IndoorObjectsTilemapCGB
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .configurePalettes
    ld   hl, ColorDungeonObjectsTilemap
    jr   .configurePalettes

.baseAddress_isOverworld
    ; hl = (hIsGBC ? OverworldObjectsTilemapCGB : OverworldObjectsTilemapDMG)
    ld   hl, OverworldObjectsTilemapDMG
    ldh  a, [hIsGBC]
    and  a
    jr   z, .palettesskipEntityLoad
    ld   hl, OverworldObjectsTilemapCGB

    ;
    ; Palettes configuration (GBC only)
    ;

.configurePalettes
    ; Set the BG attributes bank in hScratch8,
    ; and the target BG attributes address in FFE0-FFE1
    callsb GetBGAttributesAddressForObject
.palettesskipEntityLoad

    ;
    ; BG map offset selection
    ;

    ; Switch to the bank containing the BG map
    call SwitchToMapDataBank
    ; hl = base map address + BG map offset
    add  hl, bc
    pop  de
    pop  bc

    ; If the Room transition is vertical…
    ld   a, [wRoomTransitionDirection]
    and  $02
    jr   z, .horizontalRoomTransition
    ; Increment the source and target destination
    call IncrementBGMapSourceAndDestination_Vertical

    ; If IsGBC, load BG palette data
    ldh  a, [hIsGBC]
    and  a
    jr   z, .verticalIncrementEnd
    push bc
    push de
    callsb func_020_49D9

    ; Select BG attributes bank
    ldh  a, [hScratch8]
    ld   [MBC3SelectBank], a
    ; Increment again the source and target destination
    call IncrementBGMapSourceAndDestination_Vertical
    ld   a, b
    ldh  [$FFE2], a
    ld   a, c
    ldh  [$FFE3], a
    ld   a, d
    ldh  [hScratchD], a
    ld   a, e
    ldh  [$FFE5], a
    ; Restore state
    call SwitchToMapDataBank
    pop  de
    pop  bc

.verticalIncrementEnd
    jr   .incrementEnd

.horizontalRoomTransition
    call IncrementBGMapSourceAndDestination_Horizontal
    ; If IsGBC…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .incrementEnd
    ; Load BG palette data
    push bc
    push de
    callsb func_020_49D9
    ; Select BG attributes bank
    ldh  a, [hScratch8]
    ld   [MBC3SelectBank], a
    call IncrementBGMapSourceAndDestination_Horizontal
    ld   a, b
    ldh  [$FFE2], a
    ld   a, c
    ldh  [$FFE3], a
    ld   a, d
    ldh  [hScratchD], a
    ld   a, e
    ldh  [$FFE5], a
    ; Cleanup
    call SwitchToMapDataBank
    pop  de
    pop  bc

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
    jp   nz, .loop

    ; Set next BG region origin, and decrement wRoomTransitionFramesBeforeMidScreen
    jpsb func_020_5570

include "code/home/dialog.asm"

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
    ld   hl, MBC3SRamBank
    ld   [hl], $00 ; Switch to RAM bank 0
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

    ld   a, [wGameplayType]
    cp   GAMEPLAY_WORLD
    jr   nz, .readState
    ld   a, [wGameplaySubtype]
    cp   GAMEPLAY_WORLD_DEFAULT
    jr   nz, .notWorld
    ld   a, [wLinkMotionState]
    cp   LINK_MOTION_PASS_OUT
    jr   nz, .linkNotPassingOut
    ldh  a, [$FF9C]
    cp   $04
    jr   z, .readState

.linkNotPassingOut
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    jr   nz, .notWorld
    ld   a, [$DDD5]
    and  a
    jr   z, .readState

.notWorld
    xor  a
    ldh  [hPressedButtonsMask], a
    ldh  [hJoypadState], a
    ret

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
    ld   [rIE], a   ; Disable all interrupts
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
    jpsw LoadTileset0F

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

include "code/home/clear_memory.asm"

GetChestsStatusForRoom_trampoline::
    callsb GetChestsStatusForRoom
    jp   ReloadSavedBank

; Play the boomerang sound effect, then reload the current bank
PlayBoomerangSfx_trampoline::
    callsb PlayBoomerangSfx
    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ret

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
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd
    ld   hl, Indoors1ObjectPhysicFlags
.colorDungeonEnd
    add  hl, de
    ld   a, [hl]
    ret

GetObjectPhysicsFlags_trampoline::
    call GetObjectPhysicsFlags
    jp   ReloadSavedBank

GetObjectPhysicsFlagsAndRestoreBank3::
    call GetObjectPhysicsFlags
    push af
    ld   a, $03
    ld   [MBC3SelectBank], a
    pop  af
    ret

LoadTileset1E::
    ld   a, BANK(EndingTiles)
    call AdjustBankNumberForGBC
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
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

    ld   hl, EndingTiles
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $180
    call CopyData

    ld   a, BANK(Overworld1Tiles)
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, Overworld1Tiles + $8E0 ; filler color
    ld   de, vTiles2 + $7F0
    ld   bc, TILE_SIZE
    call CopyData

    ld   a, BANK(Npc4Tiles)
    call AdjustBankNumberForGBC
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
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, Overworld1Tiles + $100
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   a, BANK(Npc3Tiles)
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, Npc3Tiles + $2000
    ld   de, $8000
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   a, BANK(Overworld2Tiles)
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, Overworld2Tiles + $600
    ld   de, $8800
    ld   bc, TILE_SIZE * $80
    jp   CopyData

LoadTileset18::
    ld   hl, EndingTiles
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2B01
    ld   hl, PhotoAlbumTiles
    ld   a, BANK(PhotoAlbumTiles)
    jr   label_2B06

LoadTileset17::
    ld   hl, EndingTiles + $800
    jr   label_2B01

LoadTileset16::
    ld   hl, EndingTiles + $2000

label_2B01::
    ld   a, BANK(EndingTiles)
    call AdjustBankNumberForGBC

label_2B06::
    ld   [MBC3SelectBank], a
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   a, BANK(EndingTiles)
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
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
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, Npc3Tiles + $2600
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $8
    call CopyData

    call PlayAudioStep

    ldh  a, [hIsGBC]
    and  a
    jr   nz, .cgbOnly

.dmgOnly
    ld   a, BANK(FontLargeTiles)
    ld   [MBC3SelectBank], a
    ld   hl, FontLargeTiles + $200
    ld   de, vTiles0 + $100
    ld   bc, TILE_SIZE * $70
    jp   CopyData

.cgbOnly
    ld   a, BANK(CgbMiscTiles)
    ld   [MBC3SelectBank], a
    ld   hl, CgbMiscTiles + $1000
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $80
    jp   CopyData

LoadTileset1A::
    ld   hl, EndingTiles + $3800
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2B90
    ld   hl, EndingCGBAltTiles
    ld   a, BANK(EndingCGBAltTiles)
    jr   label_2B95

LoadTileset19::
    ld   hl, EndingTiles + $800
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_2B90
    ld   hl, PhotoAlbumTiles + $800
    ld   a, BANK(PhotoAlbumTiles)
    jr   label_2B95

label_2B90::
    ld   a, BANK(EndingTiles)

func_2B92::
    call AdjustBankNumberForGBC

label_2B95::
    ld   [MBC3SelectBank], a
    ld   de, vTiles0
    ld   bc, TILE_SIZE * $80
    call CopyData

    ld   a, BANK(EndingTiles)
    call AdjustBankNumberForGBC
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
    callsb func_014_5838
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
    ld   hl, DungeonFloorTilesPointers

    ; If inside the Color Dungeon…
    ldh  a, [hMapId]
    ld   e, a
    ld   d, $00
    cp   MAP_COLOR_DUNGEON
    jr   nz, .notColorDungeon
    ld   a, BANK(ColorDungeonTiles)
    ld   [MBC3SelectBank], a
    ld   hl, ColorDungeonTiles + $200
    ld   de, vTiles2
    ld   bc, TILE_SIZE * $10
    call CopyData

    ld   e, $00
    ld   d, e
    ld   hl, ColorDungeonTiles
    push de
    jr   .endIf

.notColorDungeon
    ; Read a data pointer from DungeonFloorTilesPointers
    push de
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

    ld   a, BANK(DungeonsTiles)
    call SwitchAdjustedBank
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
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd
    ld   hl, ColorDungeonWallsTilesPointers
.colorDungeonEnd

    add  hl, de
    ld   h, [hl]
    ld   l, $00
    call ReloadSavedBank
    ld   de, vTiles2 + $200
    ld   bc, TILE_SIZE * $20
    call CopyData

    ld   a, BANK(Items1Tiles)
    call AdjustBankNumberForGBC
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

    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd2
    ld   hl, ColorDungeonTiles + $100
    ld   a, BANK(ColorDungeonTiles)
    ld   [MBC3SelectBank], a
.colorDungeonEnd2

    ld   de, vTiles1 + $700
    ld   bc, TILE_SIZE * $10
    call CopyData

    ;
    ; Load inventory items tiles for dungeon
    ;

    ld   a, [wCurrentBank]
    ld   [MBC3SelectBank], a
    ld   hl, InventoryDungeonItemsTiles

    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   z, .caveBOrColorDungeon
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
    cp   MAP_COLOR_DUNGEON
    jr   z, .jr_2D21
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

    ld   a, BANK(InventoryEquipmentItemsTiles)
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

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
    call CopyData

    ; Load tiles for large "DX" text
    ld   a, BANK(TitleDXTiles)
    call SwitchBank

    ldh  a, [hIsGBC]
    and  a
    jr   nz, .dxTilesDMG
    ld   hl, TitleDXTilesCGB
    jr   .dxTilesEnd
.dxTilesDMG
    ld   hl, TitleDXTilesDMG
.dxTilesEnd

    ld   de, vTiles0 + $400
    ld   bc, TILE_SIZE * $40
    call CopyData

    ; Load some title sprites
    ldh  a, [hIsGBC]
    and  a
    jr   nz, .else
    ld   hl, PhotoElementsTiles + $600
    jr   .endIf
.else
    ld   hl, PhotoElementsTiles + $500
.endIf

    ld   de, vTiles0 + $200
    ld   bc, TILE_SIZE * $10
    jp   CopyData

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
    call AdjustBankNumberForGBC
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
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd
    callsb func_020_475A
    jp   .oamTilesEnd
.colorDungeonEnd

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
    and  a
    jr   z, .copyskipEntityLoad
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
    and  a
    jr   z, .bankAdjustmentEnd
    call AdjustBankNumberForGBC
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
    jp   z, .loadOverworldBGTiles

    ld   a, BANK(DungeonsTiles)
    call AdjustBankNumberForGBC
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

    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .notColorDungeon
    ldh  a, [hMapRoom]
    cp   $12
    jr   nz, .skipBGLoading
.notColorDungeon

    ld   hl, Dungeons2Tiles
    ldh  a, [hWorldTileset]
    cp   W_TILESET_NO_UPDATE
    jr   z, .skipBGLoading

    add  a, $50
    ld   h, a
    ld   bc, TILE_SIZE * $10
    call CopyData
.skipBGLoading

    ; Hack: if inside the camera shop, load a specific tileset
    ldh  a, [hMapId]
    cp   MAP_HOUSE
    jr   nz, .cameraShopEnd
    ldh  a, [hMapRoom]
    cp   $B5 ; camera shop indoor room
    jr   nz, .cameraShopEnd
    ld   a, BANK(CameraShopIndoorTiles)
    ld   [MBC3SelectBank], a
    ld   hl, CameraShopIndoorTiles
    ld   de, vTiles1 + $700
    ld   bc, TILE_SIZE * $20
    call CopyData
    ret
.cameraShopEnd

    ; Hack: on GBC, load 2 tiles to a specific location
    ; TODO: find out which tiles

    ldh  a, [hIsGBC]
    and  a
    ret  z

    ldh  a, [hMapId]
    and  a
    ret  nz

    ld   a, BANK(PhotoAlbumTiles)
    ld   [MBC3SelectBank], a
    ld   hl, PhotoAlbumTiles + $600
    ld   de, vTiles2 + $690
    ld   bc, TILE_SIZE
    call CopyData

    ld   hl, PhotoAlbumTiles + $610
    ld   de, vTiles2 + $790
    ld   bc, TILE_SIZE
    call CopyData
    ret

.loadOverworldBGTiles
    ;
    ; Load 2 rows of tiles for the world BG tileset
    ;
    ld   a, BANK(Overworld2Tiles)
    call AdjustBankNumberForGBC
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

; Copy two bytes from hl to de
CopyWord::
    ld   a, [hli]
    ld   [de], a
    inc  de
    ld   a, [hli]
    ld   [de], a
    ret

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

    ; If on Color Dungeon, use the objects tilemap of the Color Dungeon
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   z, .ColorDungeonObjectsTilemap

    ; Hack: if on camera shop, also use the objects tilemap of the Color Dungeon
    cp   MAP_HOUSE
    jr   nz, .notCameraShop
    ldh  a, [hMapRoom]
    cp   $B5 ; camera shop indoors
    jr   nz, .notCameraShop
.ColorDungeonObjectsTilemap
    ld   hl, ColorDungeonObjectsTilemap
    jr   .readValueInTable

.notCameraShop
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

    ret

; Given an overworld object, retrieve its tiles indices and palettes (2x2),
; and copy them to the BG map
; (CGB only)
;
; Inputs:
;   hl   pointer to the object in the objects map (see wRoomObjects)
;   de   pointer to the target in the BG map (4 bytes will be written)
WriteOverworldObjectToBG::
    ; Switch to RAM bank 2 (object attributes?)
    ld   a, $02
    ld   [rSVBK], a
    ; ObjectAttributeValue = [hl]
    ld   c, [hl]
    ; Switch back to RAM bank 0
    xor  a
    ld   [rSVBK], a
    jr   doCopyObjectToBG

; Given an indoor object, retrieve its tiles indices and palettes (2x2),
; and copy them to the BG map
; (CGB only)
;
; Inputs:
;   hl   pointer to the object in the objects map (see wRoomObjects)
;   de   pointer to the target in the BG map (4 bytes will be written)
WriteIndoorObjectToBG::
    ld   c, [hl]

doCopyObjectToBG:
    ; bc = ObjectAttributeValue * 4
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b

    callsb GetBGAttributesAddressForObject

    call SwitchToMapDataBank

    ;
    ; Select the base address for the source tile map
    ;

    ; If IsIndoor…
    ld   a, [wIsIndoor]
    and  a
    jr   z, .isOverworld
    ; … set the default base address
    ld   hl, IndoorObjectsTilemapCGB

    ; If on Color Dungeon, use the objects tilemap of the Color Dungeon
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   z, .useColorDungeonTable

    ; Hack: if on camera shop, also use the objects tilemap of the Color Dungeon
    cp   MAP_HOUSE
    jr   nz, .baseAddressskipEntityLoad
    ldh  a, [hMapRoom]
    cp   $B5 ; camera shop indoor
    jr   nz, .baseAddressskipEntityLoad

.useColorDungeonTable
    ld   hl, ColorDungeonObjectsTilemap
    jr   .baseAddressskipEntityLoad

.isOverworld
    ld   hl, OverworldObjectsTilemapCGB
.baseAddressskipEntityLoad

    ; Copy tile numbers to BG map for tiles on the upper row
    push de
    add  hl, bc
    call CopyWord
    pop  de

    ; Copy tile attributes to BG map for tiles on the upper row
    push hl
    ldh  a, [hScratch8]
    ld   [MBC3SelectBank], a
    ldh  a, [hScratch9]
    ld   h, a
    ldh  a, [hScratchA]
    ld   l, a
    ld   a, $01
    ld   [rVBK], a
    call CopyWord

    ; Restore RAM and ROM banks
    xor  a
    ld   [rVBK], a
    call SwitchToMapDataBank

    ; Update palette offset
    ld   a, h
    ldh  [hScratch9], a
    ld   a, l
    ldh  [hScratchA], a
    pop  hl

    ; Move BG target down by one row
    ld   a, e
    add  a, $1F
    ld   e, a
    ld   a, d
    adc  a, $00
    ld   d, a

    ; Copy tile numbers for tiles on the lower row
    push de
    call CopyWord
    pop  de

    ; Copy palettes from WRAM1 for tiles on the lower row
    ldh  a, [hScratch8]
    ld   [MBC3SelectBank], a
    ldh  a, [hScratch9]
    ld   h, a
    ldh  a, [hScratchA]
    ld   l, a
    ld   a, $01
    ld   [rVBK], a
    call CopyWord

    ; Restore RAM and ROM banks
    xor  a
    ld   [rVBK], a
    call SwitchToMapDataBank

    ret

; Copy the tile map of a room to BG video memory.
;
; This is used when loading a map in one go (instead
; of having a sliding screen transition.)
; (called by LoadMapData)
LoadTileset1::
    call SwitchToMapDataBank
    call SwitchBank
    ld   de, vBGMap0
    ld   hl, wRoomObjects
    ld   c, $80

.loop
    push de
    push hl
    push bc

    ; If not running on GBC…
    ldh  a, [hIsGBC]
    and  a
    jr   nz, .copyObjectToBG
    ; … copy the object tiles (2x2 tiles) to the BG map
    call WriteObjectToBG_DMG
    jr   .objectCopyEnd

    ; Copy the object tiles and palettes (2x2 tiles) to the BG map
.copyObjectToBG
    ; If IsIndoor…
    ld   a, [wIsIndoor]
    and  a
    jr   z, .isOverworld
    ; then copy tiles for indoor room
    call WriteIndoorObjectToBG
    jr   .objectCopyEnd
.isOverworld
    ; else copy tiles for overworld room
    call WriteOverworldObjectToBG
.objectCopyEnd

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
    jr   nz, .loop

    jpsb UpdateMinimapEntranceArrowAndReturn

; Load room objects
LoadRoom::
    ; Disable all interrupts except VBlank
    ld   a, $01
    ld   [rIE], a

    ; Increment $D47F
    ld   hl, $D47F
    inc  [hl]

    callsb ResetRoomVariables

    ; If running on GBC…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .gbcEnd
    ; load palettes
    callsb LoadRoomPalettes
    ; load tile attributes
    callsb LoadRoomObjectsAttributes
.gbcEnd

    ;
    ; Load map pointers bank
    ;

    ld   a, BANK(OverworldRoomPointers)
    ld   [MBC3SelectBank], a
    ; If loading an indoor room…
    ld   a, [wIsIndoor]
    and  a
    jr   z, .indoorSpecialCodeEnd
    ; Do some stuff
    ld   a, BANK(func_014_5897)
    ld   [MBC3SelectBank], a
    ldh  [hRoomBank], a
    call func_014_5897
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
    cp   MAP_COLOR_DUNGEON
    jr   nz, .notColorDungeon
    ; … use the room status for color dungeon
    ld   hl, wColorDungeonRoomStatus
    jr   .roomStatusEnd
.notColorDungeon
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
    cp   MAP_COLOR_DUNGEON
    jr   nz, .colorDungeonEnd
    ; …use the map pointers table specific to the color dungeon.
    ld   hl, ColorDungeonRoomPointers ; color dungeon map pointers table
    jp   .fetchRoomAddress
.colorDungeonEnd

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

    ; Do stuff that returns early if end-of-room
    callsb func_036_6D4D

    ; Load palette for room objects?
    callsb func_021_53F3

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
    ; d = object type
    ld   a, [bc]
    ld   d, a
    ; e = object position
    dec  bc
    ld   a, [bc]
    ld   e, a
    ; (re-increment bc to be at the object type again)
    inc  bc
    ; Handle the macro
    callsb ApplyOverworldObjectMacro
    call SetBankForRoom
    ; Return early
    ret

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
    and  $03
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
    ; If not on GBC…
    ldh  a, [hIsGBC]
    and  a
    jr   nz, .dmgTorchesEnd
    ; …configure the transition counter that will dim the lights
    ; when entering the room.
    ld   a, $04
    ld   [wTransitionSequenceCounter], a
.dmgTorchesEnd
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

; On GBC, special case for some overworld objects
label_3500::
    cp   $04
    ret  z
    cp   $09
    jr   nz, label_350E
    ldh  a, [hMapRoom]
    cp   $97            ; Room with the giant bombable skull thing
    ret  nz
    jr   label_3527

label_350E::
    cp   $E1
    jr   nz, label_351D
    ldh  a, [hMapRoom]
    cp   $0E            ; Eagle's Tower room
    ret  z
    cp   $0C            ; Tal-Tal Heights, 1N1E of the drainable water above Angler's Tunnel
    ret  z
    cp   $1B            ; The drainable water above Angler's Tunnel
    ret  z

label_351D::
    ldh  a, [hMapRoom]
    cp   $80            ; Mysterious Forest enterance from Mabe (?)
    jr   nc, label_3527
    ld   a, $09
    jr   label_3529

label_3527::
    ld   a, $1A

label_3529::
    call func_2BF
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
    ; On GBC, do some special-case handling
    call label_3500
    ; Cleanup
    inc  bc
    ret

; Use the current overworld room to load the adequate bank
SetBankForRoom::
    ldh  a, [hMapRoom]
    ; If hMapRoom <= $80…
    cp   $80
    jr   nc, .moreThan80
    ; … a = $09
    ld   a, BANK(OverworldRoomsFirstHalf)
    jr   .fi
.moreThan80
    ; else a = $1A
    ld   a, BANK(OverworldRoomsSecondHalf)
.fi
    ; Load the bank $09 or $1A
    ld   [MBC3SelectBank], a
    ret

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
    and  $03
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
    call label_3500
    inc  de
    inc  bc
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, Func_354B
    pop  bc
    ret

Func_358B::
    push hl
    push de
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    add  hl, de
    pop  de
    ld   a, [de]
    cp   $E1
    jr   z, .label_35A0
    cp   $E2
    jr   z, .label_35A0
    cp   $E3
    jr   nz, .label_35BC

.label_35A0
    push af
    push hl
    push de
    ld   a, l
    sub  a, $11
    push af
    ld   a, [$C19C]
    ld   e, a
    inc  a
    and  $03
    ld   [$C19C], a
    ld   d, $00
    ld   hl, wWarpPositions
    add  hl, de
    pop  af
    ld   [hl], a
    pop  de
    pop  hl
    pop  af

.label_35BC
    ld   [hl], a
    call label_35CB
    inc  de
    inc  bc
    pop  hl
    ld   a, [bc]
    and  a
    cp   $FF
    jr   nz, Func_358B
    pop  bc
    ret

label_35CB::
    cp   $04
    ret  z
    cp   $09
    jr   nz, .label_35D9
    ldh  a, [hMapRoom]
    cp   $97
    ret  nz
    jr   label_35E8

.label_35D9
    cp   $E1
    jr   nz, label_35E8
    ldh  a, [hMapRoom]
    cp   $0E
    ret  z
    cp   $0C
    ret  z
    cp   $1B
    ret  z

label_35E8::
    ld   a, $24
    call func_2BF
    ret

label_35EE::
    dec  bc
    ld   a, [bc]
    ld   e, a
    ld   d, $00
    ld   hl, wRoomObjects
    add  hl, de
    ret

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
    ld   hl, wIndoorARoomStatus
    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, $00
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, label_36D8
    ld   hl, $DDE0
    jr   label_36E1

label_36D8::
    cp   $1A
    jr   nc, label_36E1
    cp   $06
    jr   c, label_36E1
    inc  d

label_36E1::
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
    cp   MAP_COLOR_DUNGEON
    jr   nz, .useIndoorsBTable
    ld   hl, ColorDungeonEntitiesPointersTable
    jr   .pointersTableEnd
.useIndoorsBTable
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
    callsb LoadTileset0E
    ret

SwitchToMapDataBank::
    ; mapBank = (IsIndoor ? $08 : $1A)
    ld   a, [wIsIndoor]
    and  a
    jr   nz, .indoor
    ld   a, BANK(OverworldObjectsTilemapDMG)
    jr   .end
.indoor
    ld   a, $08
.end
    ; Switch to map bank
    ld   [MBC3SelectBank], a
    ret

LoadTileset22_trampoline::
    jpsb LoadTileset22

LoadTileset23_trampoline::
    jpsb LoadTileset23

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

; Copy data to second half of tiles memory
LoadColorDungeonTiles::
    ; bank = hIsGBC ? $35 : $34
    ld   b, $34
    ldh  a, [hIsGBC]
    and  a
    jr   z, .gbcEnd
    inc  b
.gbcEnd

    ; Switch to bank $34 or $35
    ld   a, b
    ld   [MBC3SelectBank], a
    ld   hl, ColorDungeonNpcTiles
    ld   de, vTiles0 + $400
    ld   bc, TILE_SIZE * $40
    call CopyData
    ld   a, BANK(InventoryEntryPoint)
    ld   [MBC3SelectBank], a
    ret
