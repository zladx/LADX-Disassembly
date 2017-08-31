section "HRAM", HRAM

hRomBank:: ; FF80
 ds 1

hTemp:: ; FF81
 ds 1

hCodeTemp:: ; FF82
 ds 1

; Unlabeled
hFF83:: ; FF83
 ds $D

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
  ds $17

hButtonsInactiveDelay:: ; FFB5
  ; Number of frames during which joypad is ignored
  ds 1

; Unlabeled
hFFB6:: ; hFFB6
  ds $15

hPressedButtonsMask:: ; FFCB
 ds 1

; Unlabeled
hFFCC:: ; hFFCC
  ds $5

hNeedsRenderingFrame:: ; FFD1
 ds 1

; Unlabeled
hFFD2:: ; hFFD2
  ds $15

hFrameCounter:: ; FFE7
  ; wraps around 00-FF
  ds 1

; Unlabeled
hFFE8:: ; hFFE8
  ds $E

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
