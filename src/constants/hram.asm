section "HRAM", HRAM[$ff80]

hRomBank:: ; FF80
 ds 1

hTemp:: ; FF81
 ds 1

hCodeTemp:: ; FF82
 ds 1

; Unlabeled
hFF83:: ; FF83
 ds $D

; Beginning of the game-variables section of the HRAM
hGameValuesSection EQU $FF90

hNeedsUpdatingBGTiles:: ; FF90
 ; Commands for loading tiles into VRAM at the next vblank period (see label_5BC)
 ;
 ; Commands:
 ;   0:   do nothing
 ;   1:
 ;   2:   load dungeon minimap tiles
 ;   3:
 ;   4:
 ;   5:
 ;   6:
 ;   7:
 ds 1

hNeedsUpdatingEnnemiesTiles:: ; FF91
 ds 1

hBGTilesLoadingStage:: ; FF92
 ; Tiles are loaded in several passes. This stores the stage where the data loading
 ; function is at.
 ;
 ; Possible values: 0 -> $0B
 ds 1

hEnemiesTilesLoadingStage:: ; FF93
 ; Tiles are loaded in several passes. This stores the stage where the data loading
 ; function is at.
 ;
 ; Possible values: 0 -> $0B
 ds 1

; Unlabeled
ds 2

hBaseScrollX:: ; FF96
 ds 1

hBaseScrollY:: ; FF97
 ds 1

hLinkPositionX:: ; FF98
 ds 1

hLinkPositionY:: ; FF99
 ds 1

hLinkPositionXIncrement:: ; FF9A
 ; Increment applied to hLinkPositionX at the end of the frame
 ds 1

hLinkPositionYIncrement:: ; FF9B
 ; Increment applied to hLinkPositionY at the end of the frame
 ds 1

; Unlabeled
hFF9C:: ; hFF9C
 ds 1

hLinkAnimationState:: ; FF9D
 ds 1

hLinkDirection:: ; FF9E
  ; Direction Link is facing
  ; See DIRECTION_* constants for possible values
  ds 1

hLinkFinalPositionX:: ; FF9F
  ; Final computed position of Link, once every modifiers added
  ds 1

hLinkFinalPositionY:: ; FFA0
  ; Final computed position of Link, once every modifiers added
  ds 1

hLinkInteractiveMotionBlocked:: ; FFA1
  ; Whether the interactive motion of Link (i.e. responding to directionnal pad presses)
  ; is temporary blocked.
  ; For instance when grabbing an object with the Power Bracelet, giving
  ; a sword slash, or talking to some NPCs.
  ;
  ; Values:
  ;   0: interactive motion autorized
  ;   1: interactive motion locked (e.g. during grab or sword slash)
  ;   2: interactive motion locked (e.g. talking to Trendy game owner)
  ds 1

hLinkPositionZ:: ; FFA2
  ds 1

; Unlabeled
ds 1

hAnimatedTilesGroup:: ; FFA4
  ; Animated tiles are grouped by groups of 4 tiles.
  ; Each map can use one of these groups.
  ; See ANIMATED_TILES_* constants for possible values
  ds 1

; Unlabeled
hFFA5:: ; FFA5
  ds 1

hAnimatedTilesFrameCount:: ;FFA6
  ; Incremented every frame, wraps around $FF
  ds 1

hAnimatedTilesDataOffset:: ;FFA7
  ; Pointer to the animation data for the current
  ; frame (either 00, 40, 80 or C0).
  ds 1

; Unlabeled
hFFA8:: ; FFA8
  ds 1

; Unused (?) Window Y value
hWindowYUnused:: ; FFA9
  ds 1

; Unused (?) Window X value
hWindowXUnused:: ; FFAA
  ds 1

; Unlabeled
hFFAB:: ; hFFAB
  ds 4

hObjectUnderEntity:: ; FFAF
  ; Type of the object under the active entity
  ds 1

hMusicTrack:: ; FFB0
  ; Music track to play
  ; See MUSIC_* constants for possible values
  ds 1

; Next music to be played after room transition
hNextMusicTrack:: ; hFFB1
  ds 1

; Unlabeled
hFFB2:: ; hFFB2
  ds 3

hButtonsInactiveDelay:: ; FFB5
  ; Number of frames during which joypad is ignored
  ds 1

; Unlabeled
hFFB6:: ; FFB6
  ds $6

; Unknown; stores previous gameplay type before a transition?
; Related to fade-out/fade-in transitions
; Seems to affect whether a music track is restarted afer
; a transition
hFFBC:: ; FFBC
  ds 3

; Music track to be played after countdown
; See hNextMusicTrack and
hNextWorldMusicTrack:: ; FFBF
  ds 1

; DMA routine copied from ROM during initialization
; Copy the content of wOAMBuffer to the OAM memory
hDMARoutine:: ; FFC0
  ds $A

; Unlabeled
hFFCA:: ; FFCA
  ds 1

hPressedButtonsMask:: ; FFCB
 ds 1

; Unlabeled
hJoypadState:: ; FFCC
  ds 1

hSwordIntersectedAreaY:: ; FFCD
  ; Topmost corner of the area intercepted by Link's sword
  ; Vary from 00 to 80 by increments of 10
  ds 1

hSwordIntersectedAreaX:: ; FFCE
  ; Leftmost corner of the area intercepted by Link's sword
  ; Vary from 00 to A0 by increments of 10
  ds 1

; Unlabeled
ds $2

hNeedsRenderingFrame:: ; FFD1
 ds 1

hFFD2:: ; FFD2
  ds 5

; Scratch values, used for many different uses

hScratch0:: ; FFD7
  ds 1
hScratch1:: ; FFD8
  ds 1
hScratch2:: ; FFD9
  ds 1
hScratch3:: ; FFDA
  ds 1
hScratch4:: ; FFDB
  ds 1
hScratch5:: ; FFDC
  ds 1
hScratch6:: ; FFDD
  ds 1
hScratch7:: ; FFDE
  ds 1
hScratch8 ; FFDF
  ds 1
hScratch9          ; FFE0
hBGMapOffsetHigh:: ; FFE0
  ds 1
hScratchA          ; FFE1
hBGMapOffsetLow::  ; FFE1
  ds 1
hScratchB:: ; FFE2
  ds 1
hScratchC:: ; FFE3
  ds 1
hScratchD:: ; FFE4
  ds 1
hScratchE:: ; FFE5
  ds 1
hScratchF:: ; FFE6
hFreeWarpDataAddress ; FFE6
  ; Address of the first free warp data slot
  ds 1

hFrameCounter:: ; FFE7
  ; wraps around 00-FF
  ds 1

; This location has different uses
hFFE8                   ; FFE8
hRoomBank::             ; FFE8
hDialogBackgroundTile:: ; FFE8
  ds 1

; This location has diffent uses
hFFE9::                   ; FFE9
hDungeonFloorTile::       ; FFE9
hIndexOfObjectBelowLink:: ; FFE9
  ds 1

; Entity status
; See wEntitiesStatusTable
hActiveEntityStatus:: ; FFEA
  ds 1

hActiveEntityType:: ; FFEB
  ds 1

wActiveEntityPosY:: ; FFEC
  ds 1

; Unlabeled
ds 1 ; FFED

wActiveEntityPosX:: ; FFEE
  ds 1

; Unlabeled
ds 1 ; FFEF

hActiveEntityState:: ; FFF0
  ; The entity-specific state of the active entity
  ; See wEntitiesStateTable
  ds 1

hActiveEntitySpriteVariant:: ; FFF1
  ; See wEntitiesSpriteVariantTable
  ds 1

hJingle:: ; FFF2
  ; Start playing a jingle
  ; See JINGLE_* constants for possible values
  ds 1

hWaveSfx:: ; FFF3
  ; Start playing a waveform audio effect
  ; See WAVE_SFX_* constants for possible values
  ds 1

hNoiseSfx:: ; FFF4
  ; Play a noise-generated audio effect next
  ; See NOISE_SFX_* constants for possible values
  ds 1

hFFF5: ds 1

hMapRoom:: ; FFF6
  ; Room id on the active map
  ds 1

hMapId:: ; FFF7
  ; Id of the current indoor world map
  ; See MAP_* constants for values
  ds 1

hRoomStatus:: ; FFF8
  ; Status of the current room
  ; 00 : not visited
  ; 10 : special event occured
  ; 80 : visited
  ds 1

hIsSideScrolling:: ; FFF9
  ; 0  top view
  ; 1  Unknown
  ; 2  side-scrolling view
  ds 1

hLinkRoomPosition:: ; FFFA
  ; Position of Link in the current world room
  ; Value goes from 0 (top left) to $79 (bottom right)
  ; Not updated during room transitions
  ds 1

hLinkFinalRoomPosition:: ; FFFB
  ; Final position of Link in the room, once modifiers applied
  ds 1

; Unused?
hFFFC:: ; FFFC
  ds 1

hDidRenderFrame:: ; FFFD
 ds 1

hIsGBC:: ; FFFE
  ; 0 = GB, 1 = GBC
  ds 1
