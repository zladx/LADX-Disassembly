; constants for graphics

; pixel width of one tile
def TILE_WIDTH          equ 8
; pixel height of one tile
def TILE_HEIGHT         equ 8
; number of tiles in one row
def TILES_PER_ROW       equ SCRN_X/(TILE_WIDTH*2)
; number of tiles in one column
def TILES_PER_COLUMN    equ SCRN_Y/(TILE_HEIGHT*2)
; number of tiles per map
def TILES_PER_MAP       equ $80
; Size of a single tile in bytes
def TILE_SIZE           equ $10

; Number of game objects in one BG map row
def OBJECTS_PER_ROW    equ SCRN_X/(TILE_WIDTH*2)
; Number of game objects in one BG map column
def OBJECTS_PER_COLUMN equ SCRN_Y/(TILE_HEIGHT*2) - 1
; Number of game objects in a whole room BG map
def OBJECTS_PER_ROOM   equ OBJECTS_PER_ROW * OBJECTS_PER_COLUMN

; GBC palettes
DEF OAM_GBC_PAL_0     EQU 0         ; Palette 0 for GBC only
DEF OAM_GBC_PAL_1     EQU 1         ; Palette 1 for GBC only
DEF OAM_GBC_PAL_2     EQU 2         ; Palette 2 for GBC only
DEF OAM_GBC_PAL_3     EQU 3         ; Palette 3 for GBC only
DEF OAM_GBC_PAL_4     EQU 4         ; Palette 4 for GBC only
DEF OAM_GBC_PAL_5     EQU 5         ; Palette 5 for GBC only
DEF OAM_GBC_PAL_6     EQU 6         ; Palette 6 for GBC only
DEF OAM_GBC_PAL_7     EQU 7         ; Palette 7 for GBC only

DEF OAM_NO_FLIP       EQU 0

; Drawing modes for draw commands.
; See wDrawCommands
;
; Copy <length> bytes of data from source to dest, progressing horizontally
def DC_COPY_ROW                equ $00
; Copy a single byte of data to <length> bytes of dest, progressing horizontally
def DC_FILL_ROW                equ $40
; Copy <length> bytes of data from source to dest, progressing vertically
def DC_COPY_COLUMN             equ $80
; Copy a single byte of data to <length> bytes of dest, progressing vertically
def DC_FILL_COLUMN             equ $C0

; Values for wTilesetToLoad
def TILESET_ROOM_TILEMAP                  equ $01
def TILESET_CLEAR_TILEMAP                 equ $02
def TILESET_BASE                          equ $03
def TILESET_MENU                          equ $04
def TILESET_BASE_OVERWORLD                equ $05
def TILESET_INDOOR                        equ $06
def TILESET_BASE_OVERWORLD_DUP            equ $07 ; mapped to TILESET_BASE_OVERWORLD
def TILESET_FILL_TILEMAP                  equ $08
def TILESET_ROOM_SPECIFIC                 equ $09
def TILESET_0A                            equ $0A ; unused, returns from the map loading handler
def TILESET_WORLD_MAP                     equ $0B
def TILESET_0C                            equ $0C ; unused, returns from the map loading handler
def TILESET_SAVE_MENU                     equ $0D
def TILESET_WORLD_MAP_TILEMAP             equ $0E
def TILESET_0F                            equ $0F ; fade from white? used in menus
def TILESET_INTRO                         equ $10
def TILESET_TITLE                         equ $11
def TILESET_CHRISTINE                     equ $12
def TILESET_MARIN_BEACH                   equ $13
def TILESET_FACE_SHRINE_MURAL             equ $14
def TILESET_15                            equ $15 ; TODO: document
def TILESET_CREDITS_LINK_ON_SEA_LARGE     equ $16
def TILESET_CREDITS_SUN_ABOVE             equ $17
def TILESET_CREDITS_LINK_ON_SEA_CLOSE     equ $18
def TILESET_CREDITS_LINK_SEATED_ON_LOG    equ $19
def TILESET_CREDITS_LINK_FACE_CLOSEUP     equ $1A
def TILESET_CREDITS_ROLL                  equ $1B
def TILESET_1C                            equ $1C ; unused, mapped to TILESET_CREDITS_LINK_FACE_CLOSEUP
def TILESET_CREDITS_KOHOLINT_VIEWS        equ $1D
def TILESET_CREDITS_KOHOLINT_DISAPPEARING equ $1E
def TILESET_CREDITS_STAIRS                equ $1F
def TILESET_SCHULE_PAINTING               equ $20
def TILESET_EAGLES_TOWER_TOP              equ $21
def TILESET_CREDITS_MARIN_PORTRAIT        equ $22
def TILESET_THANKS_FOR_PLAYING            equ $23

; Values for hNeedsUpdatingBGTiles
def TILESET_LOAD_NONE              equ $00
def TILESET_LOAD_WORLD             equ $01
def TILESET_LOAD_DUNGEON_MINIMAP   equ $02
def TILESET_LOAD_PIECE_OF_HEART_1  equ $03
def TILESET_LOAD_PIECE_OF_HEART_2  equ $04
def TILESET_CLEAR_PIECE_OF_HEART_1 equ $05
def TILESET_CLEAR_PIECE_OF_HEART_2 equ $06
def TILESET_LOAD_INVENTORY         equ $07
def TILESET_LOAD_INVENTORY_SONG_1  equ $08
def TILESET_LOAD_INVENTORY_SONG_2  equ $09
def TILESET_LOAD_INVENTORY_SONG_3  equ $0A
def TILESET_LOAD_SHARED_GFX_1      equ $0B
def TILESET_LOAD_SHARED_GFX_2      equ $0C
def TILESET_LOAD_SHARED_GFX_3      equ $0D

; Values for wBGMapToLoad
def TILEMAP_NONE                         equ $00
def TILEMAP_CREDITS_ISLAND               equ $01
def TILEMAP_INVENTORY                    equ $02
def TILEMAP_MENU_FILE_SELECTION          equ $03
def TILEMAP_MENU_FILE_SELECTION_COMMANDS equ $04
def TILEMAP_MENU_FILE_CREATION           equ $05
def TILEMAP_MENU_FILE_ERASE              equ $06
def TILEMAP_MINIMAP                      equ $07
def TILEMAP_WORLD_MAP                    equ $08
def TILEMAP_EAGLES_TOWER_CLOUDS          equ $09
def TILEMAP_GAME_OVER                    equ $0A
def TILEMAP_INVENTORY_DEBUG              equ $0B
def TILEMAP_MENU_FILE_COPY               equ $0C
def TILEMAP_MENU_FILE_SAVE               equ $0D
def TILEMAP_INTRO_SEA_DMG                equ $0E
def TILEMAP_INTRO_LINK_FACE              equ $0F
def TILEMAP_INTRO_BEACH                  equ $10
def TILEMAP_TITLE                        equ $11
def TILEMAP_PEACH                        equ $12
def TILEMAP_MARIN_BEACH                  equ $13
def TILEMAP_MAMU                         equ $14
def TILEMAP_FACE_SHRINE_MURAL            equ $15
def TILEMAP_CREDITS_STAIRS               equ $16
def TILEMAP_CREDITS_LINK_ON_SEA_LARGE    equ $17
def TILEMAP_CREDITS_SUN_ABOVE            equ $18
def TILEMAP_CREDITS_LINK_ON_SEA_CLOSE    equ $19
def TILEMAP_CREDITS_LINK_SEATED_ON_LOG   equ $1A
def TILEMAP_CREDITS_LINK_FACE_CLOSE_UP   equ $1B
def TILEMAP_CREDITS_ROLL_1               equ $1C
def TILEMAP_CREDITS_ROLL_2               equ $1D
def TILEMAP_CREDITS_KIDS                 equ $1E
def TILEMAP_CREDITS_MARIN_SINGING        equ $1F
def TILEMAP_CREDITS_MRS_MEOW_MEOWS_HOUSE equ $20
def TILEMAP_CREDITS_TARIN                equ $21
def TILEMAP_CREDITS_BEACH                equ $22
def TILEMAP_SCHULE_PAINTING              equ $23
def TILEMAP_EAGLES_TOWER_COLLAPSE        equ $24
def TILEMAP_INTRO_SEA_CGB                equ $25

; Value for overworld room objects
def OBJECT_SHORT_GRASS          equ $04
def OBJECT_ROCKY_GROUND         equ $09
def OBJECT_TALL_GRASS           equ $0A
def OBJECT_PATH                 equ $0B
def OBJECT_TILES                equ $0C
def OBJECT_WATER_BANK_BOTTOM    equ $0F
def OBJECT_WATER_BANK_TOP       equ $10
def OBJECT_WATER_BANK_RIGHT     equ $11
def OBJECT_WATER_BANK_CORNER_TL equ $13
def OBJECT_WATER_BANK_CORNER_BR equ $16
def OBJECT_WATER_BANK_BR        equ $17
def OBJECT_WATER_BANK_BL        equ $18
def OBJECT_WATER_BANK_TR        equ $19
def OBJECT_WATER_BANK_TL        equ $1A
def OBJECT_SHALLOW_WATER        equ $1B
def OBJECT_LIFTABLE_ROCK        equ $20
def OBJECT_CLIFF_CORNER_BL      equ $2E
def OBJECT_CLIFF_BOTTOM         equ $2F
def OBJECT_CLIFF_LEFT           equ $37
def OBJECT_CLIFF_RIGHT          equ $38
def OBJECT_CLIFF_CORNER_TL      equ $80
def OBJECT_CLIFF_CORNER_TR      equ $81
def OBJECT_ANIMATED_FLOWERS     equ $44
def OBJECT_PHONE_BOOTH_TOP      equ $45
def OBJECT_CLIFF_TOP            equ $4D
def OBJECT_BUSH                 equ $5C
def OBJECT_WEATHER_VANE_BASE    equ $5E
def OBJECT_WELL                 equ $61
def OBJECT_HURT_TILE            equ $69 ; overworld: cactus
def OBJECT_ROUNDED_BLOCK        equ $6E
def OBJECT_OWL_STATUE           equ $6F
def OBJECT_WEATHER_VANE_TOP     equ $91
def OBJECT_BOMBABLE_CAVE_DOOR   equ $BA
def OBJECT_TAIL_KEYHOLE         equ $C0
def OBJECT_CLOSED_GATE          equ $C2
def OBJECT_GROUND_STAIRS        equ $C6
def OBJECT_BUSH_GROUND_STAIRS   equ $D3
def OBJECT_SIGNPOST             equ $D4
def OBJECT_MONKEY_BRIDGE_TOP    equ $D8
def OBJECT_MONKEY_BRIDGE_MIDDLE equ $D9
def OBJECT_MONKEY_BRIDGE_BOTTOM equ $DA
def OBJECT_MONKEY_BRIDGE_BUILT  equ $DB
def OBJECT_WEATHER_VANE_ABOVE   equ $DC
def OBJECT_STEPS                equ $E0
def OBJECT_GROUND_HOLE          equ $E8
def OBJECT_ROCKY_CAVE_DOOR      equ $E1
def OBJECT_CAVE_DOOR            equ $E3
def OBJECT_PIT                  equ $E8
def OBJECT_WATERFALL            equ $E9
; Overworld macros
def OBJECT_MACRO_F5             equ $F5

; Values for indoor room objects
def OBJECT_FLOOR_OD                    equ $0D
def OBJECT_LIFTABLE_POT                equ $20
def OBJECT_WALL_TOP                    equ $21
def OBJECT_WALL_BOTTOM                 equ $22
def OBJECT_WALL_LEFT                   equ $23
def OBJECT_WALL_RIGHT                  equ $24
def OBJECT_BOMBED_PASSAGE_VERTICAL     equ $3D
def OBJECT_BOMBED_PASSAGE_HORIZONTAL   equ $3E
def OBJECT_BOMBABLE_WALL_TOP           equ $3F
def OBJECT_BOMBABLE_WALL_BOTTOM        equ $40
def OBJECT_BOMBABLE_WALL_LEFT          equ $41
def OBJECT_BOMBABLE_WALL_RIGHT         equ $42
def OBJECT_HIDDEN_BOMBABLE_WALL_TOP    equ $47
def OBJECT_HIDDEN_BOMBABLE_WALL_BOTTOM equ $48
def OBJECT_HIDDEN_BOMBABLE_WALL_LEFT   equ $49
def OBJECT_HIDDEN_BOMBABLE_WALL_RIGHT  equ $4A
def OBJECT_SIDE_VIEW_SPIKES            equ $4C
def OBJECT_DASHABLE_ROCK_1             equ $4E
def OBJECT_DASHABLE_ROCK_2             equ $4F
;OBJECT_HURT_TILE                  equ $69 ; same ID as overworld. indoors: spikes
def OBJECT_POT_WITH_SWITCH             equ $8E
def OBJECT_DASHABLE_ROCK_3             equ $88
def OBJECT_CHEST_CLOSED                equ $A0
def OBJECT_CHEST_OPEN                  equ $A1
def OBJECT_PUSHABLE_BLOCK              equ $A7
def OBJECT_BOMBABLE_BLOCK              equ $A9
def OBJECT_SWITCH_BUTTON               equ $AA
def OBJECT_TORCH_UNLIT                 equ $AB
def OBJECT_TORCH_LIT                   equ $AC
def OBJECT_STAIRS_DOWN                 equ $BE
def OBJECT_HIDDEN_STAIRS_DOWN          equ $BF
def OBJECT_ONE_EYED_STATUE             equ $C0
def OBJECT_STAIRS_UP                   equ $CB
def OBJECT_CONVEYOR_BOTTOM             equ $CF
def OBJECT_CONVEYOR_TOP                equ $D0
def OBJECT_CONVEYOR_RIGHT              equ $D1
def OBJECT_CONVEYOR_LEFT               equ $D2
def OBJECT_TRENDY_GAME_BORDER          equ $D3
def OBJECT_RAISED_FENCE_TOP            equ $D5
def OBJECT_RAISED_FENCE_BOTTOM         equ $D6
def OBJECT_RAISED_FENCE_LEFT           equ $D7
def OBJECT_RAISED_FENCE_RIGHT          equ $D8
def OBJECT_LOWERED_BLOCK               equ $DB
def OBJECT_RAISED_BLOCK                equ $DC
def OBJECT_KEYHOLE_BLOCK               equ $DE
def OBJECT_KEY_DOOR_TOP                equ $EC
def OBJECT_KEY_DOOR_BOTTOM             equ $ED
def OBJECT_KEY_DOOR_LEFT               equ $EE
def OBJECT_KEY_DOOR_RIGHT              equ $EF
def OBJECT_CLOSED_DOOR_TOP             equ $F0
def OBJECT_CLOSED_DOOR_BOTTOM          equ $F1
def OBJECT_CLOSED_DOOR_LEFT            equ $F2
def OBJECT_CLOSED_DOOR_RIGHT           equ $F3
def OBJECT_OPEN_DOOR_TOP               equ $F4
def OBJECT_OPEN_DOOR_BOTTOM            equ $F5
def OBJECT_OPEN_DOOR_LEFT              equ $F6
def OBJECT_OPEN_DOOR_RIGHT             equ $F7
def OBJECT_BOSS_DOOR                   equ $F8
def OBJECT_STAIRS_DOOR                 equ $F9
def OBJECT_FLIP_WALL                   equ $FA
def OBJECT_ONE_WAY_ARROW               equ $FB
def OBJECT_DUNGEON_ENTRANCE            equ $FC
def OBJECT_INDOOR_ENTRANCE             equ $FD

; Room header constants
def ROOM_WARP                   equ $E0
def ROOM_END                    equ $FE
def ROOM_BORDER                 equ $FF

; Values for wRoomSwitchableObject
def ROOM_SWITCHABLE_OBJECT_NONE          equ $0
def ROOM_SWITCHABLE_OBJECT_SWITCH_BUTTON equ $1
def ROOM_SWITCHABLE_OBJECT_MOBILE_BLOCK  equ $2

; Values for the highest bit of wLinkAttackStepAnimationCountdown
def ATTACK_STEP_ITEM_ANY                 equ $00
def ATTACK_STEP_ITEM_MAGIC_ROD           equ $80
def ATTACK_STEP_DURATION_MASK            equ $7F ; extract the duration value, without the item type part

; height of the window on the top of the screen
def WINDOW_HEIGHT equ 2 ; number in tiles
