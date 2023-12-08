; Gameplay-related enums values

; Constants

def NAME_LENGTH                equ 5

; Values for wGameplayType
def GAMEPLAY_INTRO             equ $00
def GAMEPLAY_CREDITS           equ $01
def GAMEPLAY_FILE_SELECT       equ $02
def GAMEPLAY_FILE_NEW          equ $03
def GAMEPLAY_FILE_DELETE       equ $04
def GAMEPLAY_FILE_COPY         equ $05
def GAMEPLAY_FILE_SAVE         equ $06
def GAMEPLAY_WORLD_MAP         equ $07
def GAMEPLAY_CUTSCENE          equ $08
def GAMEPLAY_MARIN_BEACH       equ $09
def GAMEPLAY_WF_MURAL          equ $0A
def GAMEPLAY_WORLD             equ $0B
def GAMEPLAY_INVENTORY         equ $0C
def GAMEPLAY_PHOTO_ALBUM       equ $0D
def GAMEPLAY_PHOTO_DIZZY_LINK  equ $0E
def GAMEPLAY_PHOTO_NICE_LINK   equ $0F
def GAMEPLAY_PHOTO_MARIN_CLIFF equ $10
def GAMEPLAY_PHOTO_MARIN_WELL  equ $11
def GAMEPLAY_PHOTO_MABE        equ $12
def GAMEPLAY_PHOTO_ULRIRA      equ $13
def GAMEPLAY_PHOTO_BOW_WOW     equ $14
def GAMEPLAY_PHOTO_THIEF       equ $15
def GAMEPLAY_PHOTO_FISHERMAN   equ $16
def GAMEPLAY_PHOTO_ZORA        equ $17
def GAMEPLAY_PHOTO_KANALET     equ $18
def GAMEPLAY_PHOTO_GHOST       equ $19
def GAMEPLAY_PHOTO_BRIDGE      equ $1A

; Values for wGameplaySubtype
; (depends on the gameplay type)
; GAMEPLAY_INTRO Subtype
def GAMEPLAY_INTRO_SEA         equ $03
def GAMEPLAY_INTRO_LINK_FACE   equ $04
def GAMEPLAY_INTRO_LIGHTNING   equ $05
def GAMEPLAY_INTRO_BEACH       equ $07
def GAMEPLAY_INTRO_TITLE       equ $0B

; GAMEPLAY_FILE_SAVE Subtype
def GAMEPLAY_FILE_SAVE_INITIAL      equ $00
def GAMEPLAY_FILE_SAVE_MAP_FADE_OUT equ $01
def GAMEPLAY_FILE_SAVE_DELAY1       equ $02
def GAMEPLAY_FILE_SAVE_DELAY2       equ $03
def GAMEPLAY_FILE_SAVE_VISIBLE      equ $04
def GAMEPLAY_FILE_SAVE_INTERACTIVE  equ $05
def GAMEPLAY_FILE_SAVE_FADE_OUT     equ $06

; GAMEPLAY_WORLD Subtype
def GAMEPLAY_WORLD_LOAD_0           equ $00
def GAMEPLAY_WORLD_LOAD_1           equ $01
def GAMEPLAY_WORLD_LOAD_2           equ $02
def GAMEPLAY_WORLD_LOAD_3           equ $03
def GAMEPLAY_WORLD_LOAD_4           equ $04
def GAMEPLAY_WORLD_LOAD_5           equ $05
def GAMEPLAY_WORLD_LOAD_6           equ $06
def GAMEPLAY_WORLD_INTERACTIVE      equ $07

; GAMEPLAY_INVENTORY Subtype
def GAMEPLAY_INVENTORY_INITIAL      equ $00
def GAMEPLAY_INVENTORY_MAP_FADE_OUT equ $01
def GAMEPLAY_INVENTORY_DELAY1       equ $02
def GAMEPLAY_INVENTORY_DELAY2       equ $03
def GAMEPLAY_INVENTORY_DELAY3       equ $04
def GAMEPLAY_INVENTORY_DELAY4       equ $05
def GAMEPLAY_INVENTORY_DELAY5       equ $06
def GAMEPLAY_INVENTORY_FADE_IN      equ $07
def GAMEPLAY_INVENTORY_INTERACTIVE  equ $08
def GAMEPLAY_INVENTORY_STATUS_IN    equ $09
def GAMEPLAY_INVENTORY_STATUS       equ $0A
def GAMEPLAY_INVENTORY_STATUS_OUT   equ $0B
def GAMEPLAY_INVENTORY_FADE_OUT     equ $0C

; Identifiers of entities during Intro sequence
def ENTITY_INTRO_SHIP          equ $05
def ENTITY_INTRO_MARIN         equ $06
def ENTITY_INTRO_INERT_LINK    equ $07
def ENTITY_INTRO_SPARKLE       equ $08

; Values for wRoomTransitionState
def ROOM_TRANSITION_NONE             equ $00
def ROOM_TRANSITION_LOAD_ROOM        equ $01
def ROOM_TRANSITION_LOAD_SPRITES     equ $02
def ROOM_TRANSITION_CONFIGURE_SCROLL equ $03
def ROOM_TRANSITION_FIRST_HALF       equ $04
def ROOM_TRANSITION_SECOND_HALF      equ $05

; Cooldown time after closing photo album
def PHOTO_ALBUM_COOLDOWN         equ $18

; Values for wLinkMotionState
; Only the first two values are interactive
def LINK_MOTION_DEFAULT              equ $00 ; ground, flying with rooster, etc
def LINK_MOTION_SWIMMING             equ $01
def LINK_MOTION_TYPE_NON_INTERACTIVE equ $02
def LINK_MOTION_UNSTUCKING           equ $02
def LINK_MOTION_MAP_FADE_OUT         equ $03
def LINK_MOTION_MAP_FADE_IN          equ $04
def LINK_MOTION_REVOLVING_DOOR       equ $05
def LINK_MOTION_FALLING_DOWN         equ $06
def LINK_MOTION_PASS_OUT             equ $07
def LINK_MOTION_RECOVER              equ $08
def LINK_MOTION_TELEPORT             equ $09
def LINK_MOTION_UNKNOWN_0A           equ $0A ; sliding? used with blaino

; Values for hLinkAnimationState
def LINK_ANIMATION_STATE_STANDING_DOWN                     equ $00
def LINK_ANIMATION_STATE_WALKING_DOWN                      equ $01
def LINK_ANIMATION_STATE_UNKNOWN_02                        equ $02
def LINK_ANIMATION_STATE_UNKNOWN_03                        equ $03
def LINK_ANIMATION_STATE_STANDING_UP                       equ $04
def LINK_ANIMATION_STATE_WALKING_UP                        equ $05
def LINK_ANIMATION_STATE_STANDING_LEFT                     equ $06
def LINK_ANIMATION_STATE_WALKING_LEFT                      equ $07
def LINK_ANIMATION_STATE_UNKNOWN_08                        equ $08
def LINK_ANIMATION_STATE_UNKNOWN_09                        equ $09
def LINK_ANIMATION_STATE_STANDING_RIGHT                    equ $0A
def LINK_ANIMATION_STATE_WALKING_RIGHT                     equ $0B
def LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_DOWN               equ $0E
def LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_UP                 equ $0F
def LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_LEFT               equ $10
def LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_RIGHT              equ $11
def LINK_ANIMATION_STATE_UNKNOWN_12                        equ $12
def LINK_ANIMATION_STATE_UNKNOWN_13                        equ $13
def LINK_ANIMATION_STATE_UNKNOWN_14                        equ $14
def LINK_ANIMATION_STATE_UNKNOWN_15                        equ $15
def LINK_ANIMATION_STATE_UNKNOWN_16                        equ $16
def LINK_ANIMATION_STATE_UNKNOWN_17                        equ $17
def LINK_ANIMATION_STATE_UNKNOWN_18                        equ $18
def LINK_ANIMATION_STATE_UNKNOWN_19                        equ $19
def LINK_ANIMATION_STATE_STANDING_PUSHING_DOWN             equ $1A
def LINK_ANIMATION_STATE_WALKING_PUSHING_DOWN              equ $1B
def LINK_ANIMATION_STATE_STANDING_PUSHING_UP               equ $1C
def LINK_ANIMATION_STATE_WALKING_PUSHING_UP                equ $1D
def LINK_ANIMATION_STATE_STANDING_PUSHING_LEFT             equ $1E
def LINK_ANIMATION_STATE_WALKING_PUSHING_LEFT              equ $1F
def LINK_ANIMATION_STATE_STANDING_PUSHING_RIGHT            equ $20
def LINK_ANIMATION_STATE_WALKING_PUSHING_RIGHT             equ $21
def LINK_ANIMATION_STATE_STANDING_SHIELD_DOWN              equ $22
def LINK_ANIMATION_STATE_WALKING_SHIELD_DOWN               equ $23
def LINK_ANIMATION_STATE_STANDING_SHIELD_USE_DOWN          equ $24
def LINK_ANIMATION_STATE_WALKING_SHIELD_USE_DOWN           equ $25
def LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_USE_DOWN   equ $26
def LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_USE_DOWN    equ $27
def LINK_ANIMATION_STATE_STANDING_SHIELD_USE_LEFT          equ $28
def LINK_ANIMATION_STATE_WALKING_SHIELD_USE_LEFT           equ $29
def LINK_ANIMATION_STATE_STANDING_SHIELD_USE_RIGHT         equ $2A
def LINK_ANIMATION_STATE_WALKING_SHIELD_USE_RIGHT          equ $2B
def LINK_ANIMATION_STATE_STANDING_SHIELD_RIGHT             equ $2C
def LINK_ANIMATION_STATE_WALKING_SHIELD_RIGHT              equ $2D
def LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_RIGHT      equ $2E
def LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_RIGHT       equ $2F
def LINK_ANIMATION_STATE_STANDING_SHIELD_USE_UP            equ $30
def LINK_ANIMATION_STATE_WALKING_SHIELD_USE_UP             equ $31
def LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_USE_UP     equ $32
def LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_USE_UP      equ $33
def LINK_ANIMATION_STATE_STANDING_SHIELD_UP                equ $34
def LINK_ANIMATION_STATE_WALKING_SHIELD_UP                 equ $35
def LINK_ANIMATION_STATE_UNKNOWN_36                        equ $36
def LINK_ANIMATION_STATE_UNKNOWN_38                        equ $38
def LINK_ANIMATION_STATE_UNKNOWN_3A                        equ $3A
def LINK_ANIMATION_STATE_UNKNOWN_3C                        equ $3C
def LINK_ANIMATION_STATE_STANDING_LIFTING_RIGHT            equ $3E
def LINK_ANIMATION_STATE_WALKING_LIFTING_RIGHT             equ $3F
def LINK_ANIMATION_STATE_STANDING_LIFTING_LEFT             equ $40
def LINK_ANIMATION_STATE_WALKING_LIFTING_LEFT              equ $41
def LINK_ANIMATION_STATE_STANDING_LIFTING_UP               equ $42
def LINK_ANIMATION_STATE_WALKING_LIFTING_UP                equ $43
def LINK_ANIMATION_STATE_STANDING_LIFTING_DOWN             equ $44
def LINK_ANIMATION_STATE_WALKING_LIFTING_DOWN              equ $45
def LINK_ANIMATION_STATE_HOLD_SWIMMING_1_RIGHT             equ $46
def LINK_ANIMATION_STATE_MOVING_SWIMMING_1_RIGHT           equ $47
def LINK_ANIMATION_STATE_HOLD_SWIMMING_1_LEFT              equ $48
def LINK_ANIMATION_STATE_MOVING_SWIMMING_1_LEFT            equ $49
def LINK_ANIMATION_STATE_HOLD_SWIMMING_1_UP                equ $4A
def LINK_ANIMATION_STATE_MOVING_SWIMMING_1_UP              equ $4B
def LINK_ANIMATION_STATE_HOLD_SWIMMING_1_DOWN              equ $4C
def LINK_ANIMATION_STATE_MOVING_SWIMMING_1_DOWN            equ $4D
def LINK_ANIMATION_STATE_HOLD_SWIMMING_2                   equ $4E
def LINK_ANIMATION_STATE_MOVING_SWIMMING_2                 equ $4F
def LINK_ANIMATION_STATE_UNKNOWN_50                        equ $50
def LINK_ANIMATION_STATE_UNKNOWN_51                        equ $51
def LINK_ANIMATION_STATE_UNKNOWN_52                        equ $52
def LINK_ANIMATION_STATE_UNKNOWN_53                        equ $53
def LINK_ANIMATION_STATE_UNKNOWN_54                        equ $54
def LINK_ANIMATION_STATE_UNKNOWN_55                        equ $55
def LINK_ANIMATION_STATE_UNKNOWN_56                        equ $56
def LINK_ANIMATION_STATE_UNKNOWN_57                        equ $57
def LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_LEFT_DOWN    equ $58
def LINK_ANIMATION_STATE_WALKING_SIDE_SCROLL_LEFT_DOWN     equ $59
def LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_RIGHT_UP     equ $5B
def LINK_ANIMATION_STATE_WALKING_SIDE_SCROLL_RIGHT_UP      equ $5C
def LINK_ANIMATION_STATE_JUMPING_1                         equ $5E
def LINK_ANIMATION_STATE_JUMPING_2                         equ $5F
def LINK_ANIMATION_STATE_JUMPING_3                         equ $60
def LINK_ANIMATION_STATE_UNKNOWN_61                        equ $61
def LINK_ANIMATION_STATE_UNKNOWN_62                        equ $62
def LINK_ANIMATION_STATE_UNKNOWN_63                        equ $63
def LINK_ANIMATION_STATE_UNKNOWN_64                        equ $64
def LINK_ANIMATION_STATE_UNKNOWN_65                        equ $65
def LINK_ANIMATION_STATE_UNKNOWN_66                        equ $66
def LINK_ANIMATION_STATE_UNKNOWN_67                        equ $67
def LINK_ANIMATION_STATE_UNKNOWN_68                        equ $68
def LINK_ANIMATION_STATE_UNKNOWN_69                        equ $69
def LINK_ANIMATION_STATE_UNKNOWN_6A                        equ $6A
def LINK_ANIMATION_STATE_UNKNOWN_6B                        equ $6B
def LINK_ANIMATION_STATE_GOT_ITEM                          equ $6C
def LINK_ANIMATION_STATE_UNKNOWN_75                        equ $75
def LINK_ANIMATION_STATE_NO_UPDATE                         equ $FF

; Values for wSwordDirection
def SWORD_DIRECTION_RIGHT        equ $00
def SWORD_DIRECTION_RIGHT_BOTTOM equ $01
def SWORD_DIRECTION_BOTTOM       equ $02
def SWORD_DIRECTION_LEFT_BOTTOM  equ $03
def SWORD_DIRECTION_LEFT         equ $04
def SWORD_DIRECTION_LEFT_TOP     equ $05
def SWORD_DIRECTION_TOP          equ $06
def SWORD_DIRECTION_RIGHT_TOP    equ $07

; Values for wSwordAnimationState
def SWORD_ANIMATION_STATE_NONE         equ $00
def SWORD_ANIMATION_STATE_DRAW         equ $01
def SWORD_ANIMATION_STATE_SWING_START  equ $02
def SWORD_ANIMATION_STATE_SWING_MIDDLE equ $03
def SWORD_ANIMATION_STATE_SWING_END    equ $04
def SWORD_ANIMATION_STATE_HOLDING      equ $05

; Charge amount needed for spin attack
def MAX_SWORD_CHARGE          equ $28
; using spin attack max value
def USING_SPIN_ATTACK_MAX     equ $20

; Charge amount needed to run
def MAX_PEGASUS_BOOTS_CHARGE  equ $20

; Values for wLinkGroundStatus
def GROUND_STATUS_NORMAL  equ $00
def GROUND_STATUS_STEPS   equ $01
def GROUND_STATUS_SLOW    equ $03 ; wet or grassy
def GROUND_STATUS_PIT     equ $07

; Maximum number of frames during which the player can
; slip over a pit without falling into it.
def PIT_MAX_SLIPPING       equ 24

; Values for wTransitionGfx
def TRANSITION_GFX_NONE         equ $00 ; no transition
def TRANSITION_GFX_DREAM_SHRINE equ $01 ; wavy transition when sleeping in the Dream Shrine
def TRANSITION_GFX_MANBO_IN     equ $02 ; wavy transition when departing using Manbo's Mambo
def TRANSITION_GFX_MANBO_OUT    equ $03 ; wavy transition when arriving using Manbo's Mambo
def TRANSITION_GFX_FLOATING     equ $FE ; slow up-and-down motion
def TRANSITION_GFX_WIND_FISH    equ $FF ; wavy transition when the Wind Fish appears and disappears

; Chest content
; @TODO Some marked "unused" aren't used in actual chest tables,
; but may be used in other events
def CHEST_POWER_BRACELET   equ $00
def CHEST_SHIELD           equ $01
def CHEST_BOW              equ $02 ; POI: Unused
def CHEST_HOOKSHOT         equ $03 ; Unused?
def CHEST_MAGIC_ROD        equ $04
def CHEST_PEGASUS_BOOTS    equ $05
def CHEST_OCARINA          equ $06
def CHEST_FEATHER          equ $07
def CHEST_SHOVEL           equ $08 ; POI: Unused
def CHEST_MAGIC_POWDER_BAG equ $09 ; Unused?
def CHEST_BOMB             equ $0A
def CHEST_SWORD            equ $0B ; Unused?
def CHEST_FLIPPERS         equ $0C
def CHEST_MAGNIFYING_LENS  equ $0D ; Unused?
def CHEST_MEDICINE         equ $10
def CHEST_TAIL_KEY         equ $11
def CHEST_ANGLER_KEY       equ $12 ; Unused?
def CHEST_FACE_KEY         equ $13 ; Unused?
def CHEST_BIRD_KEY         equ $14 ; Unused?
def CHEST_GOLD_LEAF        equ $15 ; Unused?
; Dungeon items
def CHEST_MAP              equ $16
def CHEST_COMPASS          equ $17
def CHEST_STONE_BEAK       equ $18
def CHEST_NIGHTMARE_KEY    equ $19
def CHEST_SMALL_KEY        equ $1A
; Treasure
def CHEST_RUPEES_50        equ $1B
def CHEST_RUPEES_20        equ $1C
def CHEST_RUPEES_100       equ $1D
def CHEST_RUPEES_200       equ $1E
def CHEST_RUPEES_500       equ $1F ; POI: Unused
def CHEST_SEASHELL         equ $20
; Miscellaneous
def CHEST_MESSAGE          equ $21 ; used in Catfish's Maw
def CHEST_ZOL              equ $22 ; green slime enemy

; Values for wTradeSequenceItem
def TRADING_ITEM_NONE              equ $00
def TRADING_ITEM_YOSHI_DOLL        equ $01
def TRADING_ITEM_RIBBON            equ $02
def TRADING_ITEM_DOG_FOOD          equ $03
def TRADING_ITEM_BANANAS           equ $04
def TRADING_ITEM_STICK             equ $05
def TRADING_ITEM_HONEYCOMB         equ $06
def TRADING_ITEM_PINEAPPLE         equ $07
def TRADING_ITEM_HIBISCUS          equ $08
def TRADING_ITEM_LETTER            equ $09
def TRADING_ITEM_BROOM             equ $0A
def TRADING_ITEM_FISHING_HOOK      equ $0B
def TRADING_ITEM_NECKLACE          equ $0C
def TRADING_ITEM_SCALE             equ $0D
def TRADING_ITEM_MAGNIFYING_LENS   equ $0E

; Values for hRoomStatus and wOverworldRoomStatus
;
; Flags can be combined. For example, visiting the first dungeon's screen (80)
; and opening it with the key (10) would put that byte at 90.
def ROOM_STATUS_NONE            equ $00
def ROOM_STATUS_DOOR_OPEN_RIGHT equ $01
def ROOM_STATUS_DOOR_OPEN_LEFT  equ $02
def ROOM_STATUS_DOOR_OPEN_UP    equ $04
def ROOM_STATUS_DOOR_OPEN_DOWN  equ $08
def ROOM_STATUS_EVENT_1         equ $10
def ROOM_STATUS_EVENT_2         equ $20
def ROOM_STATUS_EVENT_3         equ $40
def ROOM_STATUS_VISITED         equ $80

; Value for wOverworldRoomStatus (and similar constants)
;
; Flags can be combined. For example, visiting the first dungeon's screen (80)
; and opening it with the key (10) would put that byte at 90.
def OW_ROOM_STATUS_UNVISITED    equ $00
def OW_ROOM_STATUS_OPENED       equ $04 ; door or bombable entrance opened
def OW_ROOM_STATUS_CHANGED      equ $10 ; e.g. sword taken on the beach
def OW_ROOM_STATUS_OWL_TALKED   equ $20
def OW_ROOM_STATUS_UNKNOWN      equ $40
def OW_ROOM_STATUS_VISITED      equ $80

def OW_ROOM_STATUS_FLAG_UNVISITED    equ 0
def OW_ROOM_STATUS_FLAG_OPENED       equ 2 ; door or bombable entrance opened
def OW_ROOM_STATUS_FLAG_CHANGED      equ 4 ; e.g. sword taken on the beach
def OW_ROOM_STATUS_FLAG_OWL_TALKED   equ 5
def OW_ROOM_STATUS_FLAG_UNKNOWN_6    equ 6
def OW_ROOM_STATUS_FLAG_VISITED      equ 7

; Values for hStaircase
def STAIRCASE_NONE     equ $00 ; no staircase in the room
def STAIRCASE_INACTIVE equ $01 ; staircase in the room, but can't be used yet (e.g. when Link just landed on top of it)
def STAIRCASE_ACTIVE   equ $02 ; staircase in the room, can be used

; Price to pay to play the Trendy game
def TRENDY_GAME_PRICE         equ 10

; Price to pay to use the raft
def RAFT_GAME_PRICE           equ 100

; Price to pay to play the fishing game
def FISHING_GAME_PRICE        equ 10

; Fishing game rewards
def FISHING_GAME_SMALL_REWARD equ 05
def FISHING_GAME_LARGE_REWARD equ 20

; one heart equals XX health
def ONE_HEART equ $08

def LOW_MAX_HEALTH    equ $07
def MEDIUM_MAX_HEALTH equ $0B
;HIGH_MAX_HEALTH   equ

def MIN_HEARTS          equ $03
def MAX_HEARTS          equ $0E

; how much time has to pass until the player can receive damage again
def DAMAGE_COOLDOWN_TIME equ $A0

; power up values
def POWER_UP_NONE             equ 0
def POWER_UP_PIECE_OF_POWER   equ 1
def POWER_UP_GUARDIAN_ACORN   equ 2

; arrow values
def ARROW_MAX_ACTIVE_COUNT    equ 2 ; maximun amount of arrows in the air
def BOMB_ARROW_COOLDOWN       equ 6 ; number of frames, until bomb / arrow can be used again

; speed of the hookshot in x or y direction
def HOOKSHOT_CHAIN_SPEED      equ $30

; Values for wActivePowerUp
def ACTIVE_POWER_UP_NONE            equ 0
def ACTIVE_POWER_UP_PIECE_OF_POWER  equ 1
def ACTIVE_POWER_UP_GUARDIAN_ACORN  equ 2

def GUARDIAN_ACORN_COUNTER_MAX                   equ $0C ; defines after how many random drops a guardian acorn is dropped
def PIECE_OF_POWER_COUNTER_MAX_LOW_MAX_HEALTH    equ $1E ; defines after how many random drops a piece of power is dropped
def PIECE_OF_POWER_COUNTER_MAX_MEDIUM_MAX_HEALTH equ $23
def PIECE_OF_POWER_COUNTER_MAX_HIGH_MAX_HEALTH   equ $28

; values for wGoldenLeavesCount
def GOLDEN_LEAVES_5 equ 5
def SLIME_KEY       equ 6

; values for wEntitiesDroppedItemTable
def DROP_RANDOM   equ $00
def DROP_POWER_UP equ $01

; drop chances
def DROP_CHANCE_0_PERCENT  equ %00000000
def DROP_CHANCE_50_PERCENT equ %00000001
def DROP_CHANCE_25_PERCENT equ %00000011

def DROP_DESPAWN_TIME   equ $80 ; frames until entity despawns
def DROP_COUNTDOWN_TIME equ $18 ; frames dropped entity is blinking before despawn

; Recoil from sword hits
def SWORD_RECOIL_GENIE_JAR_DEFAULT  equ $20
def SWORD_RECOIL_GENIE_JAR_STRONGER equ $30
def SWORD_RECOIL_DEFAULT            equ $30

; constants for wIsBowWowFollowingLink
;
; There exist code, where multiple checks are done.
; All values are combined with OR-operations and then masked once.
; To avoid collisions, the highest bit is used here for KIDNAPPED.
def BOW_WOW_AT_HOME   equ $00
def BOW_WOW_FOLLOWING equ $01
def BOW_WOW_KIDNAPPED equ $80

; values for wTunicType
def TUNIC_GREEN  equ $00
def TUNIC_RED    equ $01
def TUNIC_BLUE   equ $02

; Values for wItemUsageContext
def ITEM_USAGE_NEAR_NPC     equ $01 ; set when near an NPC, to stop item usage
def ITEM_USAGE_READING_TEXT equ $02 ; set when reading non-dialog text, to stop item usage
def ITEM_USAGE_ON_RAFT      equ $80 ; set when on the raft, to freeze the raft when using an item
