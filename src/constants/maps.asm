; Values for hMapId
;
; Map rooms are by default stored in the indoors_a rooms group, except for maps
; between $06 and $19 (in indoors_b) and the color dungeon (in its own rooms group).

DEF MAP_TAIL_CAVE        EQU $00
DEF MAP_BOTTLE_GROTTO    EQU $01
DEF MAP_KEY_CAVERN       EQU $02
DEF MAP_ANGLERS_TUNNEL   EQU $03
DEF MAP_CATFISHS_MAW     EQU $04
DEF MAP_FACE_SHRINE      EQU $05

; Maps with rooms in indoors_b
DEF MAP_INDOORS_B_START  EQU $06

DEF MAP_EAGLES_TOWER     EQU $06
DEF MAP_TURTLE_ROCK      EQU $07
DEF MAP_WINDFISHS_EGG    EQU $08
DEF MAP_09_UNUSED        EQU $09
DEF MAP_CAVE_B           EQU $0A ; cave tileset A
DEF MAP_DUNGEON_G1       EQU $0B
DEF MAP_EAGLES_TOWER_ALT EQU $0C
DEF MAP_DUNGEON_G3       EQU $0D
DEF MAP_SHOP             EQU $0E
DEF MAP_MINIGAME         EQU $0F
DEF MAP_HOUSE            EQU $10
DEF MAP_CAVE_C           EQU $11 ; cave tileset B
DEF MAP_DOGHOUSE         EQU $12
DEF MAP_DREAM_SHRINE     EQU $13
DEF MAP_KANALET          EQU $14
DEF MAP_BOWWOW_HIDEOUT   EQU $15
DEF MAP_S_FACE_SHRINE    EQU $16
DEF MAP_UNKNOWN_17       EQU $17
DEF MAP_UNKNOWN_18       EQU $18
DEF MAP_UNKNOWN_19       EQU $19

; End of maps with rooms in indoors_b
DEF MAP_INDOORS_B_END    EQU $1A

DEF MAP_UNKNOWN_1A       EQU $1A
DEF MAP_UNKNOWN_1B       EQU $1B
DEF MAP_UNKNOWN_1C       EQU $1C
DEF MAP_LIBRARY          EQU $1D
DEF MAP_GHOST_HOUSE      EQU $1E
DEF MAP_CAVE_WATER       EQU $1F ; cave tileset C

; Map in special rooms group for color dungeon
DEF MAP_COLOR_DUNGEON    EQU $FF
