
hRomBank equ $ff80
hTemp equ $ff81
hCodeTemp equ $ff82

hNeedsRenderingFrame equ $ffd1
hWaitingForNextFrame equ $fffd ; 0 = waiting for vblank, 1 = not waiting
hIsGBC               equ $fffe ; 0 = GB, 1 = GBC
