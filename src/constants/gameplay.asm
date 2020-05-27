; Gameplay-related enums values

; Constants
; Size of a single tile in bytes
TILE_SIZE                  equ $10
TILES_PER_ROW              equ $0B
TILES_PER_MAP              equ $80

NAME_LENGTH                EQU 5

; Copy modes for CopyBackgroundData
; Copy the data from source to dest, progressing horizontally
BG_COPY_MODE_ROW                 equ $00
; Copy a single byte from source to dest, progressing horizontally
BG_COPY_MODE_ROW_SINGLE_VALUE    equ $40
; Copy the data from source to dest, progressing vertically
BG_COPY_MODE_COLUMN              equ $80
; Copy a single byte from source to dest, progressing vertically
BG_COPY_MODE_COLUMN_SINGLE_VALUE equ $C0

; Values for wGameplayType
GAMEPLAY_INTRO             equ $00
GAMEPLAY_CREDITS           equ $01
GAMEPLAY_FILE_SELECT       equ $02
GAMEPLAY_FILE_NEW          equ $03
GAMEPLAY_FILE_DELETE       equ $04
GAMEPLAY_FILE_COPY         equ $05
GAMEPLAY_FILE_SAVE         equ $06
GAMEPLAY_WORLD_MAP         equ $07
GAMEPLAY_PEACH_PIC         equ $08
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
GAMEPLAY_WORLD_SUBTYPE_0        equ $00
GAMEPLAY_WORLD_SUBTYPE_1        equ $01
GAMEPLAY_WORLD_SUBTYPE_2        equ $02
GAMEPLAY_WORLD_SUBTYPE_3        equ $03
GAMEPLAY_WORLD_SUBTYPE_4        equ $04
GAMEPLAY_WORLD_SUBTYPE_5        equ $05
GAMEPLAY_WORLD_SUBTYPE_6        equ $06
GAMEPLAY_WORLD_DEFAULT          equ $07

; GAMEPLAY_INVENTORY Subtype
GAMEPLAY_INVENTORY_INITIAL      equ $00
GAMEPLAY_INVENTORY_MAP_FADE_OUT equ $01
GAMEPLAY_INVENTORY_DELAY1       equ $02
GAMEPLAY_INVENTORY_DELAY2       equ $03
GAMEPLAY_INVENTORY_DELAY3       equ $04
GAMEPLAY_INVENTORY_DELAY4       equ $05
GAMEPLAY_INVENTORY_DELAY5       equ $06
GAMEPLAY_INVENTORY_FADE_IN      equ $06
GAMEPLAY_INVENTORY_VISIBLE      equ $07
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

; Values for wDialogState
DIALOG_CLOSED              equ $00
DIALOG_OPENING_1           equ $01
DIALOG_OPENING_2           equ $02
DIALOG_OPENING_3           equ $03
DIALOG_OPENING_4           equ $04
DIALOG_OPENING_5           equ $05
DIALOG_LETTER_IN_1         equ $06
DIALOG_LETTER_IN_2         equ $07
DIALOG_LETTER_IN_3         equ $08
DIALOG_BREAK               equ $09 ; press A to continue
DIALOG_SCROLLING_1         equ $0A
DIALOG_SCROLLING_2         equ $0B
DIALOG_END                 equ $0C ; press A to close
DIALOG_CHOICE              equ $0D ; press A to choose
DIALOG_CLOSING_1           equ $0E
DIALOG_CLOSING_2           equ $0F

; Tiles used as the dialog background color
DIALOG_BG_TILE_DARK        equ $7E
DIALOG_BG_TILE_LIGHT       equ $7F

; Values for wDialogGotItem
DIALOG_GOT_PIECE_OF_POWER equ $01
DIALOG_GOT_TOADSTOOL      equ $02
DIALOG_GOT_MAGIC_POWDER   equ $03
DIALOG_GOT_ROD            equ $04
DIALOG_GOT_GUARDIAN_ACORN equ $05

; Values for wLinkMotionState
LINK_MOTION_INTERACTIVE    equ $00
LINK_MOTION_SWIMMING       equ $01
LINK_MOTION_JUMPING        equ $02
LINK_MOTION_MAP_FADE_OUT   equ $03
LINK_MOTION_MAP_FADE_IN    equ $04
LINK_MOTION_REVOLVING_DOOR equ $05
LINK_MOTION_FALLING_DOWN   equ $06
LINK_MOTION_PASS_OUT       equ $07
LINK_MOTION_RECOVER        equ $08
LINK_MOTION_TELEPORT       equ $09
LINK_MOTION_UNKNOWN        equ $0F

; Values for wSwordDirection
SWORD_DIRECTION_RIGHT        equ $00
SWORD_DIRECTION_RIGHT_BOTTOM equ $01
SWORD_DIRECTION_BOTTOM       equ $02
SWORD_DIRECTION_LEFT_BOTTOM  equ $03
SWORD_DIRECTION_LEFT         equ $04
SWORD_DIRECTION_LEFT_TOP     equ $05
SWORD_DIRECTION_TOP          equ $06
SWORD_DIRECTION_RIGHT_TOP    equ $07

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
CHEST_GEL              equ $22 ; green slime enemy

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
TRADING_ITEM_MAGNIFIYING_GLASS equ $0E

; Price to pay to play the fishing game
FISHING_GAME_PRICE        equ 10

; Fishing game rewards
FISHING_GAME_SMALL_REWARD equ 05
FISHING_GAME_LARGE_REWARD equ 20
