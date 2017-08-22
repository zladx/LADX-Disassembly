; Gameplay-related enums values

; Constants
TILES_PER_ROW              equ $0B
TILES_PER_MAP              equ $80

; Values for WR1_GameplayType
GAMEPLAY_INTRO             equ $00
GAMEPLAY_CREDITS           equ $01
GAMEPLAY_FILE_SELECT       equ $02
GAMEPLAY_FILE_NEW          equ $03
GAMEPLAY_FILE_DELETE       equ $04
GAMEPLAY_FILE_COPY         equ $05
GAMEPLAY_FILE_SAVE         equ $06
GAMEPLAY_MINI_MAP          equ $07
GAMEPLAY_PEACH_PIC         equ $08
GAMEPLAY_MARIN_BEACH       equ $09
GAMEPLAY_WF_MURAL          equ $0A
GAMEPLAY_OVERWORLD         equ $0B
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
GAMEPLAY_PHOTO_BRIDGE      equ $20

; Values for WR1_GameplaySubtype
; (depends on the gameplay type)
; GAMEPLAY_INTRO Subtype
GAMEPLAY_INTRO_SEA         equ $03
GAMEPLAY_INTRO_LINK_FACE   equ $04
GAMEPLAY_INTRO_BEACH       equ $07
GAMEPLAY_INTRO_TITLE       equ $0B

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
GAMEPLAY_INVENTORY_STATU        equ $0A
GAMEPLAY_INVENTORY_STATUS_OUT   equ $0B
GAMEPLAY_INVENTORY_FADE_OUT     equ $0C

; Identifiers of entities during Intro sequence
ENTITY_INTRO_SHIP          equ $05
ENTITY_INTRO_MARIN         equ $06
ENTITY_INTRO_INERT_LINK    equ $07
ENTITY_INTRO_SPARKLE       equ $08

; Values for WR0_DialogState
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

; Values for WR0_WarpTransition
WARP_TRANSITION_DREAM_SHRINE equ $01 ; wavy transition when sleeping in the Dream Shrine
WARP_TRANSITION_MANBO_IN     equ $02 ; wavy transition when departing using Manbo's Mambo
WARP_TRANSITION_MANBO_OUT    equ $03 ; wavy transition when arriving using Manbo's Mambo
