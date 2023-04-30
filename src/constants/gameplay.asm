; Gameplay-related enums values

; Constants

NAME_LENGTH                equ 5

; Values for wGameplayType
GAMEPLAY_INTRO             equ $00
GAMEPLAY_CREDITS           equ $01
GAMEPLAY_FILE_SELECT       equ $02
GAMEPLAY_FILE_NEW          equ $03
GAMEPLAY_FILE_DELETE       equ $04
GAMEPLAY_FILE_COPY         equ $05
GAMEPLAY_FILE_SAVE         equ $06
GAMEPLAY_WORLD_MAP         equ $07
GAMEPLAY_CUTSCENE          equ $08
GAMEPLAY_MARIN_BEACH       equ $09
GAMEPLAY_WF_MURAL          equ $0A
GAMEPLAY_WORLD             equ $0B
GAMEPLAY_INVENTORY         equ $0C
GAMEPLAY_PHOTO_ALBUM       equ $0D
GAMEPLAY_PHOTO_DIZZY_LINK  equ $0E
GAMEPLAY_PHOTO_NICE_LINK   equ $0F
GAMEPLAY_PHOTO_MARIN_CLIFF equ $10
GAMEPLAY_PHOTO_MARIN_WELL  equ $11
GAMEPLAY_PHOTO_MABE        equ $12
GAMEPLAY_PHOTO_ULRIRA      equ $13
GAMEPLAY_PHOTO_BOW_WOW     equ $14
GAMEPLAY_PHOTO_THIEF       equ $15
GAMEPLAY_PHOTO_FISHERMAN   equ $16
GAMEPLAY_PHOTO_ZORA        equ $17
GAMEPLAY_PHOTO_KANALET     equ $18
GAMEPLAY_PHOTO_GHOST       equ $19
GAMEPLAY_PHOTO_BRIDGE      equ $1A

; Values for wGameplaySubtype
; (depends on the gameplay type)
; GAMEPLAY_INTRO Subtype
GAMEPLAY_INTRO_SEA         equ $03
GAMEPLAY_INTRO_LINK_FACE   equ $04
GAMEPLAY_INTRO_LIGHTNING   equ $05
GAMEPLAY_INTRO_BEACH       equ $07
GAMEPLAY_INTRO_TITLE       equ $0B

; GAMEPLAY_FILE_SAVE Subtype
GAMEPLAY_FILE_SAVE_INITIAL      equ $00
GAMEPLAY_FILE_SAVE_MAP_FADE_OUT equ $01
GAMEPLAY_FILE_SAVE_DELAY1       equ $02
GAMEPLAY_FILE_SAVE_DELAY2       equ $03
GAMEPLAY_FILE_SAVE_VISIBLE      equ $04
GAMEPLAY_FILE_SAVE_INTERACTIVE  equ $05
GAMEPLAY_FILE_SAVE_FADE_OUT     equ $06

; GAMEPLAY_WORLD Subtype
GAMEPLAY_WORLD_LOAD_0           equ $00
GAMEPLAY_WORLD_LOAD_1           equ $01
GAMEPLAY_WORLD_LOAD_2           equ $02
GAMEPLAY_WORLD_LOAD_3           equ $03
GAMEPLAY_WORLD_LOAD_4           equ $04
GAMEPLAY_WORLD_LOAD_5           equ $05
GAMEPLAY_WORLD_LOAD_6           equ $06
GAMEPLAY_WORLD_INTERACTIVE      equ $07

; GAMEPLAY_INVENTORY Subtype
GAMEPLAY_INVENTORY_INITIAL      equ $00
GAMEPLAY_INVENTORY_MAP_FADE_OUT equ $01
GAMEPLAY_INVENTORY_DELAY1       equ $02
GAMEPLAY_INVENTORY_DELAY2       equ $03
GAMEPLAY_INVENTORY_DELAY3       equ $04
GAMEPLAY_INVENTORY_DELAY4       equ $05
GAMEPLAY_INVENTORY_DELAY5       equ $06
GAMEPLAY_INVENTORY_FADE_IN      equ $07
GAMEPLAY_INVENTORY_INTERACTIVE  equ $08
GAMEPLAY_INVENTORY_STATUS_IN    equ $09
GAMEPLAY_INVENTORY_STATUS       equ $0A
GAMEPLAY_INVENTORY_STATUS_OUT   equ $0B
GAMEPLAY_INVENTORY_FADE_OUT     equ $0C

; Identifiers of entities during Intro sequence
ENTITY_INTRO_SHIP          equ $05
ENTITY_INTRO_MARIN         equ $06
ENTITY_INTRO_INERT_LINK    equ $07
ENTITY_INTRO_SPARKLE       equ $08

; Values for wRoomTransitionState
ROOM_TRANSITION_NONE             equ $00
ROOM_TRANSITION_LOAD_ROOM        equ $01
ROOM_TRANSITION_LOAD_SPRITES     equ $02
ROOM_TRANSITION_CONFIGURE_SCROLL equ $03
ROOM_TRANSITION_FIRST_HALF       equ $04
ROOM_TRANSITION_SECOND_HALF      equ $05

; Cooldown time after closing photo album
PHOTO_ALBUM_COOLDOWN         equ $18

; Values for wLinkMotionState
; Only the first two values are interactive
LINK_MOTION_DEFAULT              equ $00 ; ground, flying with rooster, etc
LINK_MOTION_SWIMMING             equ $01
LINK_MOTION_TYPE_NON_INTERACTIVE equ $02
LINK_MOTION_UNSTUCKING           equ $02
LINK_MOTION_MAP_FADE_OUT         equ $03
LINK_MOTION_MAP_FADE_IN          equ $04
LINK_MOTION_REVOLVING_DOOR       equ $05
LINK_MOTION_FALLING_DOWN         equ $06
LINK_MOTION_PASS_OUT             equ $07
LINK_MOTION_RECOVER              equ $08
LINK_MOTION_TELEPORT             equ $09
LINK_MOTION_UNKNOWN_0A           equ $0A ; sliding? used with blaino

; Values for hLinkAnimationState
LINK_ANIMATION_STATE_STANDING_DOWN                     equ $00
LINK_ANIMATION_STATE_WALKING_DOWN                      equ $01
LINK_ANIMATION_STATE_UNKNOWN_02                        equ $02
LINK_ANIMATION_STATE_UNKNOWN_03                        equ $03
LINK_ANIMATION_STATE_STANDING_UP                       equ $04
LINK_ANIMATION_STATE_WALKING_UP                        equ $05
LINK_ANIMATION_STATE_STANDING_LEFT                     equ $06
LINK_ANIMATION_STATE_WALKING_LEFT                      equ $07
LINK_ANIMATION_STATE_UNKNOWN_08                        equ $08
LINK_ANIMATION_STATE_UNKNOWN_09                        equ $09
LINK_ANIMATION_STATE_STANDING_RIGHT                    equ $0A
LINK_ANIMATION_STATE_WALKING_RIGHT                     equ $0B
LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_DOWN               equ $0E
LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_UP                 equ $0F
LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_LEFT               equ $10
LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_RIGHT              equ $11
LINK_ANIMATION_STATE_UNKNOWN_12                        equ $12
LINK_ANIMATION_STATE_UNKNOWN_13                        equ $13
LINK_ANIMATION_STATE_UNKNOWN_14                        equ $14
LINK_ANIMATION_STATE_UNKNOWN_15                        equ $15
LINK_ANIMATION_STATE_UNKNOWN_16                        equ $16
LINK_ANIMATION_STATE_UNKNOWN_17                        equ $17
LINK_ANIMATION_STATE_UNKNOWN_18                        equ $18
LINK_ANIMATION_STATE_UNKNOWN_19                        equ $19
LINK_ANIMATION_STATE_STANDING_PUSHING_DOWN             equ $1A
LINK_ANIMATION_STATE_WALKING_PUSHING_DOWN              equ $1B
LINK_ANIMATION_STATE_STANDING_PUSHING_UP               equ $1C
LINK_ANIMATION_STATE_WALKING_PUSHING_UP                equ $1D
LINK_ANIMATION_STATE_STANDING_PUSHING_LEFT             equ $1E
LINK_ANIMATION_STATE_WALKING_PUSHING_LEFT              equ $1F
LINK_ANIMATION_STATE_STANDING_PUSHING_RIGHT            equ $20
LINK_ANIMATION_STATE_WALKING_PUSHING_RIGHT             equ $21
LINK_ANIMATION_STATE_STANDING_SHIELD_DOWN              equ $22
LINK_ANIMATION_STATE_WALKING_SHIELD_DOWN               equ $23
LINK_ANIMATION_STATE_STANDING_SHIELD_USE_DOWN          equ $24
LINK_ANIMATION_STATE_WALKING_SHIELD_USE_DOWN           equ $25
LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_USE_DOWN   equ $26
LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_USE_DOWN    equ $27
LINK_ANIMATION_STATE_STANDING_SHIELD_USE_LEFT          equ $28
LINK_ANIMATION_STATE_WALKING_SHIELD_USE_LEFT           equ $29
LINK_ANIMATION_STATE_STANDING_SHIELD_USE_RIGHT         equ $2A
LINK_ANIMATION_STATE_WALKING_SHIELD_USE_RIGHT          equ $2B
LINK_ANIMATION_STATE_STANDING_SHIELD_RIGHT             equ $2C
LINK_ANIMATION_STATE_WALKING_SHIELD_RIGHT              equ $2D
LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_RIGHT      equ $2E
LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_RIGHT       equ $2F
LINK_ANIMATION_STATE_STANDING_SHIELD_USE_UP            equ $30
LINK_ANIMATION_STATE_WALKING_SHIELD_USE_UP             equ $31
LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_USE_UP     equ $32
LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_USE_UP      equ $33
LINK_ANIMATION_STATE_STANDING_SHIELD_UP                equ $34
LINK_ANIMATION_STATE_WALKING_SHIELD_UP                 equ $35
LINK_ANIMATION_STATE_UNKNOWN_36                        equ $36
LINK_ANIMATION_STATE_UNKNOWN_38                        equ $38
LINK_ANIMATION_STATE_UNKNOWN_3A                        equ $3A
LINK_ANIMATION_STATE_UNKNOWN_3C                        equ $3C
LINK_ANIMATION_STATE_STANDING_LIFTING_RIGHT            equ $3E
LINK_ANIMATION_STATE_WALKING_LIFTING_RIGHT             equ $3F
LINK_ANIMATION_STATE_STANDING_LIFTING_LEFT             equ $40
LINK_ANIMATION_STATE_WALKING_LIFTING_LEFT              equ $41
LINK_ANIMATION_STATE_STANDING_LIFTING_UP               equ $42
LINK_ANIMATION_STATE_WALKING_LIFTING_UP                equ $43
LINK_ANIMATION_STATE_STANDING_LIFTING_DOWN             equ $44
LINK_ANIMATION_STATE_WALKING_LIFTING_DOWN              equ $45
LINK_ANIMATION_STATE_HOLD_SWIMMING_1_RIGHT             equ $46
LINK_ANIMATION_STATE_MOVING_SWIMMING_1_RIGHT           equ $47
LINK_ANIMATION_STATE_HOLD_SWIMMING_1_LEFT              equ $48
LINK_ANIMATION_STATE_MOVING_SWIMMING_1_LEFT            equ $49
LINK_ANIMATION_STATE_HOLD_SWIMMING_1_UP                equ $4A
LINK_ANIMATION_STATE_MOVING_SWIMMING_1_UP              equ $4B
LINK_ANIMATION_STATE_HOLD_SWIMMING_1_DOWN              equ $4C
LINK_ANIMATION_STATE_MOVING_SWIMMING_1_DOWN            equ $4D
LINK_ANIMATION_STATE_HOLD_SWIMMING_2                   equ $4E
LINK_ANIMATION_STATE_MOVING_SWIMMING_2                 equ $4F
LINK_ANIMATION_STATE_UNKNOWN_50                        equ $50
LINK_ANIMATION_STATE_UNKNOWN_51                        equ $51
LINK_ANIMATION_STATE_UNKNOWN_52                        equ $52
LINK_ANIMATION_STATE_UNKNOWN_53                        equ $53
LINK_ANIMATION_STATE_UNKNOWN_54                        equ $54
LINK_ANIMATION_STATE_UNKNOWN_55                        equ $55
LINK_ANIMATION_STATE_UNKNOWN_56                        equ $56
LINK_ANIMATION_STATE_UNKNOWN_57                        equ $57
LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_LEFT_DOWN    equ $58
LINK_ANIMATION_STATE_WALKING_SIDE_SCROLL_LEFT_DOWN     equ $59
LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_RIGHT_UP     equ $5B
LINK_ANIMATION_STATE_WALKING_SIDE_SCROLL_RIGHT_UP      equ $5C
LINK_ANIMATION_STATE_JUMPING_1                         equ $5E
LINK_ANIMATION_STATE_JUMPING_2                         equ $5F
LINK_ANIMATION_STATE_JUMPING_3                         equ $60
LINK_ANIMATION_STATE_UNKNOWN_61                        equ $61
LINK_ANIMATION_STATE_UNKNOWN_62                        equ $62
LINK_ANIMATION_STATE_UNKNOWN_63                        equ $63
LINK_ANIMATION_STATE_UNKNOWN_64                        equ $64
LINK_ANIMATION_STATE_UNKNOWN_65                        equ $65
LINK_ANIMATION_STATE_UNKNOWN_66                        equ $66
LINK_ANIMATION_STATE_UNKNOWN_67                        equ $67
LINK_ANIMATION_STATE_UNKNOWN_68                        equ $68
LINK_ANIMATION_STATE_UNKNOWN_69                        equ $69
LINK_ANIMATION_STATE_UNKNOWN_6A                        equ $6A
LINK_ANIMATION_STATE_UNKNOWN_6B                        equ $6B
LINK_ANIMATION_STATE_GOT_ITEM                          equ $6C
LINK_ANIMATION_STATE_UNKNOWN_75                        equ $75
LINK_ANIMATION_STATE_NO_UPDATE                         equ $FF

; Values for wSwordDirection
SWORD_DIRECTION_RIGHT        equ $00
SWORD_DIRECTION_RIGHT_BOTTOM equ $01
SWORD_DIRECTION_BOTTOM       equ $02
SWORD_DIRECTION_LEFT_BOTTOM  equ $03
SWORD_DIRECTION_LEFT         equ $04
SWORD_DIRECTION_LEFT_TOP     equ $05
SWORD_DIRECTION_TOP          equ $06
SWORD_DIRECTION_RIGHT_TOP    equ $07

; Values for wSwordAnimationState
SWORD_ANIMATION_STATE_NONE         equ $00
SWORD_ANIMATION_STATE_DRAW         equ $01
SWORD_ANIMATION_STATE_SWING_START  equ $02
SWORD_ANIMATION_STATE_SWING_MIDDLE equ $03
SWORD_ANIMATION_STATE_SWING_END    equ $04
SWORD_ANIMATION_STATE_HOLDING      equ $05

; Charge amount needed for spin attack
MAX_SWORD_CHARGE          equ $28
; using spin attack max value
USING_SPIN_ATTACK_MAX     equ $20

; Charge amount needed to run
MAX_PEGASUS_BOOTS_CHARGE  equ $20

; Values for wLinkGroundStatus
GROUND_STATUS_NORMAL  equ $00
GROUND_STATUS_STEPS   equ $01
GROUND_STATUS_SLOW    equ $03 ; wet or grassy
GROUND_STATUS_PIT     equ $07

; Maximum number of frames during which the player can
; slip over a pit without falling into it.
PIT_MAX_SLIPPING       equ 24

; Values for wTransitionGfx
TRANSITION_GFX_NONE         equ $00 ; no transition
TRANSITION_GFX_DREAM_SHRINE equ $01 ; wavy transition when sleeping in the Dream Shrine
TRANSITION_GFX_MANBO_IN     equ $02 ; wavy transition when departing using Manbo's Mambo
TRANSITION_GFX_MANBO_OUT    equ $03 ; wavy transition when arriving using Manbo's Mambo
TRANSITION_GFX_FLOATING     equ $FE ; slow up-and-down motion
TRANSITION_GFX_WIND_FISH    equ $FF ; wavy transition when the Wind Fish appears and disappears

; Chest content
; @TODO Some marked "unused" aren't used in actual chest tables,
; but may be used in other events
CHEST_POWER_BRACELET   equ $00
CHEST_SHIELD           equ $01
CHEST_BOW              equ $02 ; POI: Unused
CHEST_HOOKSHOT         equ $03 ; Unused?
CHEST_MAGIC_ROD        equ $04
CHEST_PEGASUS_BOOTS    equ $05
CHEST_OCARINA          equ $06
CHEST_FEATHER          equ $07
CHEST_SHOVEL           equ $08 ; POI: Unused
CHEST_MAGIC_POWDER_BAG equ $09 ; Unused?
CHEST_BOMB             equ $0A
CHEST_SWORD            equ $0B ; Unused?
CHEST_FLIPPERS         equ $0C
CHEST_MAGNIFYING_LENS  equ $0D ; Unused?
CHEST_MEDICINE         equ $10
CHEST_TAIL_KEY         equ $11
CHEST_ANGLER_KEY       equ $12 ; Unused?
CHEST_FACE_KEY         equ $13 ; Unused?
CHEST_BIRD_KEY         equ $14 ; Unused?
CHEST_GOLD_LEAF        equ $15 ; Unused?
; Dungeon items
CHEST_MAP              equ $16
CHEST_COMPASS          equ $17
CHEST_STONE_BEAK       equ $18
CHEST_NIGHTMARE_KEY    equ $19
CHEST_SMALL_KEY        equ $1A
; Treasure
CHEST_RUPEES_50        equ $1B
CHEST_RUPEES_20        equ $1C
CHEST_RUPEES_100       equ $1D
CHEST_RUPEES_200       equ $1E
CHEST_RUPEES_500       equ $1F ; POI: Unused
CHEST_SEASHELL         equ $20
; Miscellaneous
CHEST_MESSAGE          equ $21 ; used in Catfish's Maw
CHEST_ZOL              equ $22 ; green slime enemy

; Values for wTradeSequenceItem
TRADING_ITEM_NONE              equ $00
TRADING_ITEM_YOSHI_DOLL        equ $01
TRADING_ITEM_RIBBON            equ $02
TRADING_ITEM_DOG_FOOD          equ $03
TRADING_ITEM_BANANAS           equ $04
TRADING_ITEM_STICK             equ $05
TRADING_ITEM_HONEYCOMB         equ $06
TRADING_ITEM_PINEAPPLE         equ $07
TRADING_ITEM_HIBISCUS          equ $08
TRADING_ITEM_LETTER            equ $09
TRADING_ITEM_BROOM             equ $0A
TRADING_ITEM_FISHING_HOOK      equ $0B
TRADING_ITEM_NECKLACE          equ $0C
TRADING_ITEM_SCALE             equ $0D
TRADING_ITEM_MAGNIFYING_LENS   equ $0E

; Values for hRoomStatus and wOverworldRoomStatus
;
; Flags can be combined. For example, visiting the first dungeon's screen (80)
; and opening it with the key (10) would put that byte at 90.
ROOM_STATUS_NONE            equ $00
ROOM_STATUS_DOOR_OPEN_RIGHT equ $01
ROOM_STATUS_DOOR_OPEN_LEFT  equ $02
ROOM_STATUS_DOOR_OPEN_UP    equ $04
ROOM_STATUS_DOOR_OPEN_DOWN  equ $08
ROOM_STATUS_EVENT_1         equ $10
ROOM_STATUS_EVENT_2         equ $20
ROOM_STATUS_EVENT_3         equ $40
ROOM_STATUS_VISITED         equ $80

; Value for wOverworldRoomStatus (and similar constants)
;
; Flags can be combined. For example, visiting the first dungeon's screen (80)
; and opening it with the key (10) would put that byte at 90.
OW_ROOM_STATUS_UNVISITED    equ $00
OW_ROOM_STATUS_OPENED       equ $04 ; door or bombable entrance opened
OW_ROOM_STATUS_CHANGED      equ $10 ; e.g. sword taken on the beach
OW_ROOM_STATUS_OWL_TALKED   equ $20
OW_ROOM_STATUS_UNKNOWN      equ $40
OW_ROOM_STATUS_VISITED      equ $80

OW_ROOM_STATUS_FLAG_UNVISITED    equ 0
OW_ROOM_STATUS_FLAG_OPENED       equ 2 ; door or bombable entrance opened
OW_ROOM_STATUS_FLAG_CHANGED      equ 4 ; e.g. sword taken on the beach
OW_ROOM_STATUS_FLAG_OWL_TALKED   equ 5
OW_ROOM_STATUS_FLAG_UNKNOWN_6    equ 6
OW_ROOM_STATUS_FLAG_VISITED      equ 7

; Values for hStaircase
STAIRCASE_NONE     equ $00 ; no staircase in the room
STAIRCASE_INACTIVE equ $01 ; staircase in the room, but can't be used yet (e.g. when Link just landed on top of it)
STAIRCASE_ACTIVE   equ $02 ; staircase in the room, can be used

; Price to pay to play the Trendy game
TRENDY_GAME_PRICE         equ 10

; Price to pay to use the raft
RAFT_GAME_PRICE           equ 100

; Price to pay to play the fishing game
FISHING_GAME_PRICE        equ 10

; Fishing game rewards
FISHING_GAME_SMALL_REWARD equ 05
FISHING_GAME_LARGE_REWARD equ 20

; one heart equals XX health
ONE_HEART equ $08

LOW_MAX_HEALTH    equ $07
MEDIUM_MAX_HEALTH equ $0B
;HIGH_MAX_HEALTH   equ

MIN_HEARTS          equ $03
MAX_HEARTS          equ $0E

; how much time has to pass until the player can receive damage again
DAMAGE_COOLDOWN_TIME equ $A0

; power up values
POWER_UP_NONE             equ 0
POWER_UP_PIECE_OF_POWER   equ 1
POWER_UP_GUARDIAN_ACORN   equ 2

; arrow values
ARROW_MAX_ACTIVE_COUNT    equ 2 ; maximun amount of arrows in the air
BOMB_ARROW_COOLDOWN       equ 6 ; number of frames, until bomb / arrow can be used again

; speed of the hookshot in x or y direction
HOOKSHOT_CHAIN_SPEED      equ $30

; Values for wActivePowerUp
ACTIVE_POWER_UP_NONE            equ 0
ACTIVE_POWER_UP_PIECE_OF_POWER  equ 1
ACTIVE_POWER_UP_GUARDIAN_ACORN  equ 2

GUARDIAN_ACORN_COUNTER_MAX                   equ $0C ; defines after how many random drops a guardian acorn is dropped
PIECE_OF_POWER_COUNTER_MAX_LOW_MAX_HEALTH    equ $1E ; defines after how many random drops a piece of power is dropped
PIECE_OF_POWER_COUNTER_MAX_MEDIUM_MAX_HEALTH equ $23
PIECE_OF_POWER_COUNTER_MAX_HIGH_MAX_HEALTH   equ $28

; values for wGoldenLeavesCount
GOLDEN_LEAVES_5 equ 5
SLIME_KEY       equ 6

; values for wEntitiesDroppedItemTable
DROP_RANDOM   equ $00
DROP_POWER_UP equ $01

; drop chances
DROP_CHANCE_0_PERCENT  equ %00000000
DROP_CHANCE_50_PERCENT equ %00000001
DROP_CHANCE_25_PERCENT equ %00000011

DROP_DESPAWN_TIME   equ $80 ; frames until entity despawns
DROP_COUNTDOWN_TIME equ $18 ; frames dropped entity is blinking before despawn

; Recoil from sword hits
SWORD_RECOIL_GENIE_JAR_DEFAULT  equ $20
SWORD_RECOIL_GENIE_JAR_STRONGER equ $30
SWORD_RECOIL_DEFAULT            equ $30

; constants for wIsBowWowFollowingLink
;
; There exist code, where multiple checks are done.
; All values are combined with OR-operations and then masked once.
; To avoid collisions, the highest bit is used here for KIDNAPPED.
BOW_WOW_AT_HOME   equ $00
BOW_WOW_FOLLOWING equ $01
BOW_WOW_KIDNAPPED equ $80

; values for wTunicType
TUNIC_GREEN  equ $00
TUNIC_RED    equ $01
TUNIC_BLUE   equ $02

; Values for wItemUsageContext
ITEM_USAGE_NEAR_NPC     equ $01 ; set when near an NPC, to stop item usage
ITEM_USAGE_READING_TEXT equ $02 ; set when reading non-dialog text, to stop item usage
ITEM_USAGE_ON_RAFT      equ $80 ; set when on the raft, to freeze the raft when using an item
