; constants for graphics

; pixel width of one tile
TILE_WIDTH          equ 8
; pixel height of one tile
TILE_HEIGHT         equ 8
; number of tiles in one row
TILES_PER_ROW       equ SCRN_X/(TILE_WIDTH*2)
; number of tiles in one column
TILES_PER_COLUMN    equ SCRN_Y/(TILE_HEIGHT*2)
; number of tiles per map
TILES_PER_MAP       equ $80
; Size of a single tile in bytes
TILE_SIZE           equ $10

; Number of game objects in one BG map row
OBJECTS_PER_ROW    equ SCRN_X/(TILE_WIDTH*2)
; Number of game objects in one BG map column
OBJECTS_PER_COLUMN equ SCRN_Y/(TILE_HEIGHT*2) - 1
; Number of game objects in a whole room BG map
OBJECTS_PER_ROOM   equ OBJECTS_PER_ROW * OBJECTS_PER_COLUMN

; GBC palettes
OAM_GBC_PAL_0     EQU 0         ; Palette 0 for GBC only
OAM_GBC_PAL_1     EQU 1         ; Palette 1 for GBC only
OAM_GBC_PAL_2     EQU 2         ; Palette 2 for GBC only
OAM_GBC_PAL_3     EQU 3         ; Palette 3 for GBC only
OAM_GBC_PAL_4     EQU 4         ; Palette 4 for GBC only
OAM_GBC_PAL_5     EQU 5         ; Palette 5 for GBC only
OAM_GBC_PAL_6     EQU 6         ; Palette 6 for GBC only
OAM_GBC_PAL_7     EQU 7         ; Palette 7 for GBC only

OAM_NO_FLIP       EQU 0

; Drawing modes for draw commands.
; See wDrawCommands
;
; Copy <length> bytes of data from source to dest, progressing horizontally
DC_COPY_ROW                equ $00
; Copy a single byte of data to <length> bytes of dest, progressing horizontally
DC_FILL_ROW                equ $40
; Copy <length> bytes of data from source to dest, progressing vertically
DC_COPY_COLUMN             equ $80
; Copy a single byte of data to <length> bytes of dest, progressing vertically
DC_FILL_COLUMN             equ $C0

; Values for wTilesetToLoad
TILESET_ROOM_TILEMAP                  equ $01
TILESET_CLEAR_TILEMAP                 equ $02
TILESET_BASE                          equ $03
TILESET_MENU                          equ $04
TILESET_BASE_OVERWORLD                equ $05
TILESET_INDOOR                        equ $06
TILESET_BASE_OVERWORLD_DUP            equ $07 ; mapped to TILESET_BASE_OVERWORLD
TILESET_FILL_TILEMAP                  equ $08
TILESET_ROOM_SPECIFIC                 equ $09
TILESET_0A                            equ $0A ; unused, returns from the map loading handler
TILESET_WORLD_MAP                     equ $0B
TILESET_0C                            equ $0C ; unused, returns from the map loading handler
TILESET_SAVE_MENU                     equ $0D
TILESET_WORLD_MAP_TILEMAP             equ $0E
TILESET_0F                            equ $0F ; fade from white? used in menus
TILESET_INTRO                         equ $10
TILESET_TITLE                         equ $11
TILESET_CHRISTINE                     equ $12
TILESET_MARIN_BEACH                   equ $13
TILESET_FACE_SHRINE_MURAL             equ $14
TILESET_15                            equ $15 ; TODO: document
TILESET_CREDITS_LINK_ON_SEA_LARGE     equ $16
TILESET_CREDITS_SUN_ABOVE             equ $17
TILESET_CREDITS_LINK_ON_SEA_CLOSE     equ $18
TILESET_CREDITS_LINK_SEATED_ON_LOG    equ $19
TILESET_CREDITS_LINK_FACE_CLOSEUP     equ $1A
TILESET_CREDITS_ROLL                  equ $1B
TILESET_1C                            equ $1C ; unused, mapped to TILESET_CREDITS_LINK_FACE_CLOSEUP
TILESET_CREDITS_KOHOLINT_VIEWS        equ $1D
TILESET_CREDITS_KOHOLINT_DISAPPEARING equ $1E
TILESET_CREDITS_STAIRS                equ $1F
TILESET_SCHULE_PAINTING               equ $20
TILESET_EAGLES_TOWER_TOP              equ $21
TILESET_CREDITS_MARIN_PORTRAIT        equ $22
TILESET_THANKS_FOR_PLAYING            equ $23

; Values for hNeedsUpdatingBGTiles
TILESET_LOAD_NONE              equ $00
TILESET_LOAD_WORLD             equ $01
TILESET_LOAD_DUNGEON_MINIMAP   equ $02
TILESET_LOAD_PIECE_OF_HEART_1  equ $03
TILESET_LOAD_PIECE_OF_HEART_2  equ $04
TILESET_CLEAR_PIECE_OF_HEART_1 equ $05
TILESET_CLEAR_PIECE_OF_HEART_2 equ $06
TILESET_LOAD_INVENTORY         equ $07
TILESET_LOAD_INVENTORY_SONG_1  equ $08
TILESET_LOAD_INVENTORY_SONG_2  equ $09
TILESET_LOAD_INVENTORY_SONG_3  equ $0A
TILESET_LOAD_SHARED_GFX_1      equ $0B
TILESET_LOAD_SHARED_GFX_2      equ $0C
TILESET_LOAD_SHARED_GFX_3      equ $0D

; Values for wBGMapToLoad
TILEMAP_NONE                         equ $00
TILEMAP_CREDITS_ISLAND               equ $01
TILEMAP_INVENTORY                    equ $02
TILEMAP_MENU_FILE_SELECTION          equ $03
TILEMAP_MENU_FILE_SELECTION_COMMANDS equ $04
TILEMAP_MENU_FILE_CREATION           equ $05
TILEMAP_MENU_FILE_ERASE              equ $06
TILEMAP_MINIMAP                      equ $07
TILEMAP_WORLD_MAP                    equ $08
TILEMAP_EAGLES_TOWER_CLOUDS          equ $09
TILEMAP_GAME_OVER                    equ $0A
TILEMAP_INVENTORY_DEBUG              equ $0B
TILEMAP_MENU_FILE_COPY               equ $0C
TILEMAP_MENU_FILE_SAVE               equ $0D
TILEMAP_INTRO_SEA_DMG                equ $0E
TILEMAP_INTRO_LINK_FACE              equ $0F
TILEMAP_INTRO_BEACH                  equ $10
TILEMAP_TITLE                        equ $11
TILEMAP_PEACH                        equ $12
TILEMAP_MARIN_BEACH                  equ $13
TILEMAP_MAMU                         equ $14
TILEMAP_FACE_SHRINE_MURAL            equ $15
TILEMAP_CREDITS_STAIRS               equ $16
TILEMAP_CREDITS_LINK_ON_SEA_LARGE    equ $17
TILEMAP_CREDITS_SUN_ABOVE            equ $18
TILEMAP_CREDITS_LINK_ON_SEA_CLOSE    equ $19
TILEMAP_CREDITS_LINK_SEATED_ON_LOG   equ $1A
TILEMAP_CREDITS_LINK_FACE_CLOSE_UP   equ $1B
TILEMAP_CREDITS_ROLL_1               equ $1C
TILEMAP_CREDITS_ROLL_2               equ $1D
TILEMAP_CREDITS_KIDS                 equ $1E
TILEMAP_CREDITS_MARIN_SINGING        equ $1F
TILEMAP_CREDITS_MRS_MEOW_MEOWS_HOUSE equ $20
TILEMAP_CREDITS_TARIN                equ $21
TILEMAP_CREDITS_BEACH                equ $22
TILEMAP_SCHULE_PAINTING              equ $23
TILEMAP_EAGLES_TOWER_COLLAPSE        equ $24
TILEMAP_INTRO_SEA_CGB                equ $25

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
OBJECT_WELL                 equ $61
OBJECT_HURT_TILE            equ $69 ; overworld: cactus
OBJECT_ROUNDED_BLOCK        equ $6E
OBJECT_OWL_STATUE           equ $6F
OBJECT_WEATHER_VANE_TOP     equ $91
OBJECT_BOMBABLE_CAVE_DOOR   equ $BA
OBJECT_TAIL_KEYHOLE         equ $C0
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
OBJECT_PIT                  equ $E8
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
OBJECT_SIDE_VIEW_SPIKES            equ $4C
OBJECT_DASHABLE_ROCK_1             equ $4E
OBJECT_DASHABLE_ROCK_2             equ $4F
;OBJECT_HURT_TILE                  equ $69 ; same ID as overworld. indoors: spikes
OBJECT_POT_WITH_SWITCH             equ $8E
OBJECT_DASHABLE_ROCK_3             equ $88
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

; Values for wRoomSwitchableObject
ROOM_SWITCHABLE_OBJECT_NONE          equ $0
ROOM_SWITCHABLE_OBJECT_SWITCH_BUTTON equ $1
ROOM_SWITCHABLE_OBJECT_MOBILE_BLOCK  equ $2

; Values for the highest bit of wLinkAttackStepAnimationCountdown
ATTACK_STEP_ITEM_ANY                 equ $00
ATTACK_STEP_ITEM_MAGIC_ROD           equ $80
ATTACK_STEP_DURATION_MASK            equ $7F ; extract the duration value, without the item type part

; height of the window on the top of the screen
WINDOW_HEIGHT equ 2 ; number in tiles
