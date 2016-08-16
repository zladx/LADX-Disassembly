
hRomBank     equ $FF80
hTemp        equ $FF81
hCodeTemp    equ $FF82
hBaseScrollX equ $FF96
hBaseScrollY equ $FF97

hPressedButtonsMask  equ $FFCB
hNeedsRenderingFrame equ $FFD1
hFrameCounter        equ $FFE7 ; wraps around 00-FF
hWaitingForNextFrame equ $FFFD ; 0 = waiting for vblank, 1 = not waiting
hIsGBC               equ $FFFE ; 0 = GB, 1 = GBC
