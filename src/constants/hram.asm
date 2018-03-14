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

; Unlabeled
hFF9A:: ; hFF9A
  ds 3

hLinkAnimationState:: ; FF9D
 ds 1

; Unlabeled
hFF9E:: ; hFF9E
  ds $B

; Unused (?) Window Y value
hWindowYUnused:: ; FFA9
  ds 1

; Unused (?) Window X value
hWindowXUnused:: ; FFAA
  ds 1

; Unlabeled
hFFAB:: ; hFFAB
  ds $A

hButtonsInactiveDelay:: ; FFB5
  ; Number of frames during which joypad is ignored
  ds 1

; Unlabeled
hFFB6:: ; FFB6
  ds $A

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

; Unlabeled
hFFE8:: ; hFFE8
  ds $B

hSFX:: ; FFF3
  ; plays sfx immediately
  ds 1

hFFF4: ds 1
hFFF5: ds 1

hMapIndex:: ; FFF6
  ; currently loaded map
  ds 1

hMapTileset:: ; FFF7
  ; tileset index for the current map
  ds 1

; Unlabeled
hFFF8:: ; hFFF8
  ds $5

hDidRenderFrame:: ; FFFD
 ds 1

hIsGBC:: ; FFFE
  ; 0 = GB, 1 = GBC
  ds 1
