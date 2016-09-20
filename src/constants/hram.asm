
hRomBank                    equ $FF80
hTemp                       equ $FF81
hCodeTemp                   equ $FF82
hNeedsUpdatingBGTiles       equ $FF90
hNeedsUpdatingSpriteTiles   equ $FF91
hBaseScrollX                equ $FF96
hBaseScrollY                equ $FF97
hLinkAnimationState         equ $FF9D

hButtonsInactiveDelay       equ $FFB5 ; Number of frames during which joypad is ignored
hPressedButtonsMask         equ $FFCB
;unknow                         $FFCC ; joypad-related?
hNeedsRenderingFrame        equ $FFD1
hFrameCounter               equ $FFE7 ; wraps around 00-FF
;hSpriteYOffset?            equ $FFEC 
;hSpriteXOffset?            equ $FFEE
hMapIndex                   equ $FFF6 ; currently loaded map
hMapTileset                 equ $FFF7 ; tileset index for the current map
hDidRenderFrame             equ $FFFD
hIsGBC                      equ $FFFE ; 0 = GB, 1 = GBC
