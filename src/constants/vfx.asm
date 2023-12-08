
; Values for wTranscientVfxTypeTable
def TRANSCIENT_VFX_NONE           equ $00
def TRANSCIENT_VFX_WATER_SPLASH   equ $01
def TRANSCIENT_VFX_POOF           equ $02
def TRANSCIENT_VFX_CHEST_APPEARS  equ $03
def TRANSCIENT_VFX_STAIRS_APPEARS equ $04
def TRANSCIENT_VFX_SWORD_POKE     equ $05
def TRANSCIENT_VFX_LASER_BEAM     equ $06
def TRANSCIENT_VFX_MOVING_SPARKLE equ $07
def TRANSCIENT_VFX_SMOKE          equ $08
def TRANSCIENT_VFX_RUMBLE         equ $09
def TRANSCIENT_VFX_LAVA_SPLASH    equ $0A
def TRANSCIENT_VFX_PEGASUS_DUST   equ $0B
def TRANSCIENT_VFX_PEGASUS_SPLASH equ $0C
def TRANSCIENT_VFX_SWORD_BEAM     equ $0D
def TRANSCIENT_VFX_UNUSED_1       equ $0E
def TRANSCIENT_VFX_UNUSED_2       equ $0F

; Values for wLinkGroundVfx
; (maybe a better label would be wLinkGroundPhysics? But wLinkGroundStatus
; already exists.)
def GROUND_VFX_NONE          equ $00
def GROUND_VFX_SHALLOW_WATER equ $05
def GROUND_VFX_GRASS         equ $06
def GROUND_VFX_PIT           equ $50
def GROUND_VFX_51            equ $51
def GROUND_VFX_SPIKES        equ $E0 ; spikes?
def GROUND_VFX_F0            equ $F0
def GROUND_VFX_FF            equ $FF
