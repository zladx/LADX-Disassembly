; Values for hMapId
;
; Sub-maps 0x0B to 0xFE all refer to individual rooms within the underworld maps,
; but they load different graphical tilesets.
; For example: House tileset, Kanalet Castle tileset, Cave tileset, etc.
MAP_TAIL_CAVE        equ $00
MAP_BOTTLE_GROTTO    equ $01
MAP_KEY_CAVERN       equ $02
MAP_ANGLERS_TUNNEL   equ $03
MAP_CATFISHS_MAW     equ $04
MAP_FACE_SHRINE      equ $05
MAP_EAGLES_TOWER     equ $06
MAP_TURTLE_ROCK      equ $07
MAP_WINDFISHS_EGG    equ $08
MAP_CAVE_A           equ $09
MAP_CAVE_B           equ $0A
MAP_DUNGEON_G1       equ $0B
MAP_EAGLES_TOWER_ALT equ $0C
MAP_DUNGEON_G3       equ $0D
MAP_DUNGEON_H        equ $0E
MAP_FISHING          equ $0F
MAP_HOUSE            equ $10
MAP_CAVE_C           equ $11
MAP_CAVE_D           equ $12
MAP_DREAM_SHRINE     equ $13
MAP_KANALET          equ $14
MAP_BOWWOW_HIDEOUT   equ $15
MAP_S_FACE_SHRINE    equ $16
MAP_UNKNOWN_17       equ $17
MAP_UNKNOWN_18       equ $18
MAP_UNKNOWN_19       equ $19
MAP_UNKNOWN_1A       equ $1A
MAP_UNKNOWN_1B       equ $1B
MAP_UNKNOWN_1C       equ $1C
MAP_LIBRARY          equ $1D
MAP_UNKNOWN_1E       equ $1E
MAP_CAVE_E           equ $1F
MAP_COLOR_DUNGEON    equ $FF

; Value for overworld room objects
OBJECT_SHORT_GRASS          equ $04
OBJECT_ROCKY_GROUND         equ $09
OBJECT_TALL_GRASS           equ $0A
OBJECT_PATH                 equ $0B
OBJECT_TILES                equ $0C
OBJECT_WATER_BANK_BOTTOM    equ $0F
OBJECT_WATER_BANK_TOP       equ $10
OBJECT_WATER_BANK_RIGHT     equ $11
OBJECT_WATER_BANK_CORNER_TL equ $13
OBJECT_WATER_BANK_CORNER_BR equ $16
OBJECT_WATER_BANK_BR        equ $17
OBJECT_WATER_BANK_BL        equ $18
OBJECT_WATER_BANK_TR        equ $19
OBJECT_WATER_BANK_TL        equ $1A
OBJECT_SHALLOW_WATER        equ $1B
OBJECT_LIFTABLE_ROCK        equ $20
OBJECT_CLIFF_CORNER_BL      equ $2E
OBJECT_CLIFF_BOTTOM         equ $2F
OBJECT_CLIFF_LEFT           equ $37
OBJECT_CLIFF_RIGHT          equ $38
OBJECT_CLIFF_CORNER_TL      equ $80
OBJECT_CLIFF_CORNER_TR      equ $81
OBJECT_ANIMATED_FLOWERS     equ $44
OBJECT_PHONE_BOOTH_TOP      equ $45
OBJECT_CLIFF_TOP            equ $4D
OBJECT_BUSH                 equ $5C
OBJECT_WEATHER_VANE_BASE    equ $5E
OBJECT_ROUNDED_BLOCK        equ $6E
OBJECT_OWN_STATUE           equ $6F
OBJECT_WEATHER_VANE_TOP     equ $91
OBJECT_BOMBABLE_CAVE_DOOR   equ $BA
OBJECT_FLAGELLO_KEYHOLE     equ $C0
OBJECT_CLOSED_GATE          equ $C2
OBJECT_GROUND_STAIRS        equ $C6
OBJECT_BUSH_GROUND_STAIRS   equ $D3
OBJECT_SIGNPOST             equ $D4
OBJECT_MONKEY_BRIDGE_TOP    equ $D8
OBJECT_MONKEY_BRIDGE_MIDDLE equ $D9
OBJECT_MONKEY_BRIDGE_BOTTOM equ $DA
OBJECT_MONKEY_BRIDGE_BUILT  equ $DB
OBJECT_WEATHER_VANE_ABOVE   equ $DC
OBJECT_STEPS                equ $E0
OBJECT_GROUND_HOLE          equ $E8
OBJECT_ROCKY_CAVE_DOOR      equ $E1
OBJECT_CAVE_DOOR            equ $E3
OBJECT_WATERFALL            equ $E9
; Overworld macros
OBJECT_MACRO_F5             equ $F5

; Values for indoor room objects
OBJECT_FLOOR_OD                    equ $0D
OBJECT_LIFTABLE_POT                equ $20
OBJECT_WALL_TOP                    equ $21
OBJECT_WALL_BOTTOM                 equ $22
OBJECT_WALL_LEFT                   equ $23
OBJECT_WALL_RIGHT                  equ $24
OBJECT_BOMBED_PASSAGE_VERTICAL     equ $3D
OBJECT_BOMBED_PASSAGE_HORIZONTAL   equ $3E
OBJECT_BOMBABLE_WALL_TOP           equ $3F
OBJECT_BOMBABLE_WALL_BOTTOM        equ $40
OBJECT_BOMBABLE_WALL_LEFT          equ $41
OBJECT_BOMBABLE_WALL_RIGHT         equ $42
OBJECT_HIDDEN_BOMBABLE_WALL_TOP    equ $47
OBJECT_HIDDEN_BOMBABLE_WALL_BOTTOM equ $48
OBJECT_HIDDEN_BOMBABLE_WALL_LEFT   equ $49
OBJECT_HIDDEN_BOMBABLE_WALL_RIGHT  equ $4A
OBJECT_POT_WITH_SWITCH             equ $8E
OBJECT_CHEST_CLOSED                equ $A0
OBJECT_CHEST_OPEN                  equ $A1
OBJECT_PUSHABLE_BLOCK              equ $A7
OBJECT_BOMBABLE_BLOCK              equ $A9
OBJECT_SWITCH_BUTTON               equ $AA
OBJECT_TORCH_UNLIT                 equ $AB
OBJECT_TORCH_LIT                   equ $AC
OBJECT_STAIRS_DOWN                 equ $BE
OBJECT_HIDDEN_STAIRS_DOWN          equ $BF
OBJECT_ONE_EYED_STATUE             equ $C0
OBJECT_STAIRS_UP                   equ $CB
OBJECT_CONVEYOR_BOTTOM             equ $CF
OBJECT_CONVEYOR_TOP                equ $D0
OBJECT_CONVEYOR_RIGHT              equ $D1
OBJECT_CONVEYOR_LEFT               equ $D2
OBJECT_TRENDY_GAME_BORDER          equ $D3
OBJECT_RAISED_FENCE_TOP            equ $D5
OBJECT_RAISED_FENCE_BOTTOM         equ $D6
OBJECT_RAISED_FENCE_LEFT           equ $D7
OBJECT_RAISED_FENCE_RIGHT          equ $D8
OBJECT_LOWERED_BLOCK               equ $DB
OBJECT_RAISED_BLOCK                equ $DC
OBJECT_KEYHOLE_BLOCK               equ $DE
OBJECT_KEY_DOOR_TOP                equ $EC
OBJECT_KEY_DOOR_BOTTOM             equ $ED
OBJECT_KEY_DOOR_LEFT               equ $EE
OBJECT_KEY_DOOR_RIGHT              equ $EF
OBJECT_CLOSED_DOOR_TOP             equ $F0
OBJECT_CLOSED_DOOR_BOTTOM          equ $F1
OBJECT_CLOSED_DOOR_LEFT            equ $F2
OBJECT_CLOSED_DOOR_RIGHT           equ $F3
OBJECT_OPEN_DOOR_TOP               equ $F4
OBJECT_OPEN_DOOR_BOTTOM            equ $F5
OBJECT_OPEN_DOOR_LEFT              equ $F6
OBJECT_OPEN_DOOR_RIGHT             equ $F7
OBJECT_BOSS_DOOR                   equ $F8
OBJECT_STAIRS_DOOR                 equ $F9
OBJECT_FLIP_WALL                   equ $FA
OBJECT_ONE_WAY_ARROW               equ $FB
OBJECT_DUNGEON_ENTRANCE            equ $FC
OBJECT_INDOOR_ENTRANCE             equ $FD

; Room header constants
ROOM_WARP                   equ $E0
ROOM_END                    equ $FE
ROOM_BORDER                 equ $FF

; Value for wOverworldRoomStatus (and similar constants)
;
; Flags can be combined. For example, visiting the first dungeon's screen (80)
; and opening it with the key (10) would put that byte at 90.
ROOM_STATUS_UNVISITED    equ $00
ROOM_STATUS_DOOR_OPENED  equ $04 ; door or bombable entrance opened
ROOM_STATUS_CHANGED      equ $10 ; e.g. sword taken on the beach
ROOM_STATUS_OWL_TALKED   equ $20
ROOM_STATUS_VISITED      equ $80

; Values for wRoomSwitchableObject
ROOM_SWITCHABLE_OBJECT_NONE          equ $0
ROOM_SWITCHABLE_OBJECT_SWITCH_BUTTON equ $1
ROOM_SWITCHABLE_OBJECT_MOBILE_BLOCK  equ $2
