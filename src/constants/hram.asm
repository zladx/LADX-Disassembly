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
 ds 1

hNeedsUpdatingEnnemiesTiles:: ; FF91
 ds 1

; Unlabeled
hFF92:: ; hFF92
  ds 4

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
  ; 0 Right
  ; 1 Left
  ; 2 Top
  ; 3 Down
  ds 1

hLinkFinalPositionX:: ; FF9F
  ; Final computed position of Link, once every modifiers added
  ds 1

hLinkFinalPositionY:: ; FFA0
  ; Final computed position of Link, once every modifiers added
  ds 1

ds 3

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

; Related to ennemies IA state?
hFFAF:: ; FFAF
  ds 1

hMusicTrack:: ; FFB0
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
  ds 4

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
hFFCC:: ; hFFCC
  ds $5

hNeedsRenderingFrame:: ; FFD1
 ds 1

hFFD2:: ; FFD2
  ds 1

  ds $14

hFrameCounter:: ; FFE7
  ; wraps around 00-FF
  ds 1

; This location has different uses
hFFE8                   ; FFE8
hDialogBackgroundTile:: ; FFE8
  ds 1

hFFE9:: ; FFE9
  ds $9

hJingle:: ; FFF2
  ; Play a jingle immediately
  ; See JINGLE_* constants for possible values
  ds 1

hSFX:: ; FFF3
  ; Plays audio effect immediately
  ; See SFX_* constants for possible values
  ds 1

hFFF4: ds 1
hFFF5: ds 1

hMapRoom:: ; FFF6
  ; Room id on the active map
  ds 1

hMapId:: ; FFF7
  ; Id of the current indoor world map
  ; See MAP_* constants for values
  ds 1

hFFF8:: ; FFF8
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
