
hRomBank     equ $FF80
hTemp        equ $FF81
hCodeTemp    equ $FF82
hBaseScrollX equ $FF96
hBaseScrollY equ $FF97

hNeedsRenderingFrame equ $FFD1
hWaitingForNextFrame equ $FFFD ; 0 = waiting for vblank, 1 = not waiting
hIsGBC               equ $FFFE ; 0 = GB, 1 = GBC
