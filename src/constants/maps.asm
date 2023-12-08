; Values for hMapId
;
; Map rooms are by default stored in the indoors_a rooms group, except for maps
; between $06 and $19 (in indoors_b) and the color dungeon (in its own rooms group).

def MAP_TAIL_CAVE        equ $00
def MAP_BOTTLE_GROTTO    equ $01
def MAP_KEY_CAVERN       equ $02
def MAP_ANGLERS_TUNNEL   equ $03
def MAP_CATFISHS_MAW     equ $04
def MAP_FACE_SHRINE      equ $05

; Maps with rooms in indoors_b
def MAP_INDOORS_B_START  equ $06

def MAP_EAGLES_TOWER     equ $06
def MAP_TURTLE_ROCK      equ $07
def MAP_WINDFISHS_EGG    equ $08
def MAP_09_UNUSED        equ $09
def MAP_CAVE_B           equ $0A ; cave tileset A
def MAP_DUNGEON_G1       equ $0B
def MAP_EAGLES_TOWER_ALT equ $0C
def MAP_DUNGEON_G3       equ $0D
def MAP_SHOP             equ $0E
def MAP_MINIGAME         equ $0F
def MAP_HOUSE            equ $10
def MAP_CAVE_C           equ $11 ; cave tileset B
def MAP_DOGHOUSE         equ $12
def MAP_DREAM_SHRINE     equ $13
def MAP_KANALET          equ $14
def MAP_BOWWOW_HIDEOUT   equ $15
def MAP_S_FACE_SHRINE    equ $16
def MAP_UNKNOWN_17       equ $17
def MAP_UNKNOWN_18       equ $18
def MAP_UNKNOWN_19       equ $19

; End of maps with rooms in indoors_b
def MAP_INDOORS_B_END    equ $1A

def MAP_UNKNOWN_1A       equ $1A
def MAP_UNKNOWN_1B       equ $1B
def MAP_UNKNOWN_1C       equ $1C
def MAP_LIBRARY          equ $1D
def MAP_GHOST_HOUSE      equ $1E
def MAP_CAVE_WATER       equ $1F ; cave tileset C

; Map in special rooms group for color dungeon
def MAP_COLOR_DUNGEON    equ $FF
