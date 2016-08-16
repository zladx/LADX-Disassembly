
hRomBank     equ $ff80
hTemp        equ $ff81
hCodeTemp    equ $ff82
hBaseScrollX equ $ff96
hBaseScrollY equ $ff97

hNeedsRenderingFrame equ $ffd1
hWaitingForNextFrame equ $fffd ; 0 = waiting for vblank, 1 = not waiting
hIsGBC               equ $fffe ; 0 = GB, 1 = GBC
