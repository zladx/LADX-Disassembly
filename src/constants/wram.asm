section "WRAM Bank0", wram0

WR0_C000 equ $C000
  ds $100

WR0_ScrollXOffsetForSection:: ; C100
  ; Table of the scrollX offset to add for each screen section being drawn
  ds $5

WR0_LCDSectionIndex:: ; C105
  ; Portion of the screen being drawn (0 -> 4)
  ds 1

WR0_IntroBGYOffset:: ; C106
  ; Offset for compensating the sea movement when drawing bottom screen section on intro sea
  ds 1

; Unlabeled
WR0_C108 equ $C108

  ds 7

WR0_needsUpdatingNPCTiles:: ; C10E
  ds 1

; Unlabeled
WR0_C10F equ $C10F
  ds $12

WR0_IsUsingSpinAttack:: ; C121
  ds 1

; Unlabeled
WR0_C122 equ $C122
  ds 2

WR0_MapSlideTransitionState:: ; C124
  ds 1

; Unlabeled
WR0_C125 equ $C125
  ds $18

WR0_RandomSeed:: ; C13D
  ; Seed for the Random Number Generator
  ds 1

; Unlabeled
WR0_C140 equ $C13E
  ds $E

WR0_IsShootingArrow:: ; C14C
  ds 1

WR0_ProjectileCount:: ; C14D
  ds 1

WR0_HasPlacedBomb:: ; C14E
  ds 1

WR0_InventoryAppearing:: ; C14F
  ds 1

; Unlabeled
WR0_C150 equ $C150
  ds 5

WR0_ScreenShakeHorizontal:: ; C155
  ; background offset for shaking the screen vertically
  ds 1

WR0_ScreenShakeVertical:: ; C156
  ; background offset for shaking the screen vertically
  ds 1

; Unlabeled
WR0_C157 equ $C157
  ds $2

WR0_InventoryCursorFrameCounter:: ; C159
  ds 1

WR0_HasMirrorShield:: ; C15A
  ds 1

WR0_IsUsingShield:: ; C15B
  ds 1

; Unlabeled
WR0_C15C equ $C15C
  ds $F

WR0_TransitionSequenceCounter:: ; C16B
  ds 1

; Unlabeled
WR0_C16C equ $C16C
  ds 6

WR0_DialogScrollDelay:: ; C172
  ds 1

; Unlabeled
WR0_C173 equ $C173
  ds 8

WR0_FreeMovementMode:: ; C17B
  ; See https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening#Mono_Pausing_the_Engine_and_Mono.2FDX_Free-Movement_Mode
  ds 1

; Unlabeled
WR0_C17C equ $C17C
  ds 3

WR0_WarpTransition:: ; C17F
  ; See WARP_TRANSITION_* constants for possible values
  ds 1

; Unlabeled
WR0_C180 equ $C180
  ds $1F

WR0_DialogState:: ; C19F
  ; See DIALOG_* constants for possible values
  ds 1

WR0_C1A4 equ $C1A0
  ds $60

WR0_EntitiesPosXTable:: ; C200
  ; X position of visible entities

WR0_Entity0PosX:: ; C200
  ds $1

WR0_Entity1PosX:: ; C201
  ds $1

WR0_Entity2PosX:: ; C202

WR0_IntroShipPosX:: ; C202
  ; Position of the ship sprite during the intro sequence
  ds $1

WR0_Entity3PosX:: ; C203
  ds $1

WR0_Entity4PosX:: ; C204
  ds $1

WR0_Entity5PosX:: ; C205
  ds $1

WR0_Entity6PosX:: ; C206
  ds $1

WR0_Entity7PosX:: ; C207
  ds $1

WR0_Entity8PosX:: ; C208
  ds $1

WR0_Entity9PosX:: ; C209
  ds $1

WR0_Entity10PosX:: ; C20A
  ds $1

WR0_Entity11PosX:: ; C20B
  ds $1

WR0_Entity12PosX:: ; C20C
  ds $1

WR0_Entity13PosX:: ; C20D
  ds $1

WR0_Entity14PosX:: ; C20E
  ds $1

WR0_Entity15PosX:: ; C20F
  ds $1

WR0_EntitiesPosYTable:: ; C210
  ; Y position of visible entities
  ds $10

; Unlabeled
WR0_C220 equ $C220
  ds $60

WR0_EntitiesTypeTable:: ; C280
  ; type of visible entities
  ds 1

section "WRAM Bank1", wramx, bank[1]

; Unlabeled
WR0_D000 equ $D000
  ds 1

WR0_IntroTimer:: ; D001
  ds 1

WR0_IntroSubTimer:: ; D002
  ds 1

; Unlabeled
WR0_D003 equ $D003
  ds $365

WR1_OverworldMusic:: ; D368
  ; Overworld Music Track
  ; 00: No music
  ; 01: Title music when zelda logo appears
  ; 02: Trendy game/Witch hut
  ; 03: Game Over screen
  ; 04: Mabe Village
  ; 05: Overworld music
  ; 06: Tal Tal Heights
  ; 07: Village Shop
  ; 08: Raft Ride Rapids
  ; 09: Mysterious Forest
  ; 0A: Home/trader house
  ; 0B: Animal Village
  ; 0C: Fairy House
  ; 0D: Title music
  ; 0E: BowWow kidnapped music
  ; 0F: Found level 2 sword
  ; 10: Found new weapon
  ; 11: 2D underground dungeon
  ; 12: Owl song
  ; 13: Final Knightmare in Egg song
  ; 14: Dream Shrine Entrance music
  ; 15: Found an instrument
  ; 16: Overworld cave
  ; 17: Piece of Power/Acorn
  ; 18: Received horn instrument
  ; 19: Received bell instrument
  ; 1A: Received harp instrument
  ; 1B: Received xylophone instrument
  ; 1C: Received ?? instrument
  ; 1D: Received ?? instrument
  ; 1E: Received thunder drum instrument
  ; 1F: Marin singing
  ; 20: Manbo's Mambo fish song
  ; 21: Received ?? instrument
  ; 22: Instruments song ??
  ; 23: Instruments song ??
  ; 24: Instruments song ??
  ; 25: Instruments song when opening Egg
  ; 26: Instruments song when opening Egg part 2
  ; 27: Instruments song ??
  ; 28: Lonely/ghost house
  ; 29: Piece of Power part 2
  ; 2A: Marin singing + Links ocarina
  ; 2B: Level 5
  ; 2C: Dungeon entrance Unlocking
  ; 2D: Dream sequence sound?
  ; 2E: At beach with Marin song
  ; 2F: Unknown
  ; 30: Dungeon sub-boss music
  ; 31: Received level 1 sword at beach
  ; 32: Mr Write's house
  ; 33: Ulrira's house
  ; 34: Tarin attacked by Bee's
  ; 35: Song of Soul by Mamu frogs
  ; 36: Monkey's building bridge
  ; 37: Mr Write's house version 2
  ; 38: Richard House Secret Song
  ; 39: Turtle Rock entrance boss
  ; 3A: Fishing/crane game
  ; 3B: Received item
  ; 3C: Hidden/Unused song!?
  ; 3D: Nothing
  ; 3E: BowWow stolen music
  ; 3F: Ending music
  ; 40: Richard's House
  ; 41: Glitched noise, possibly unfinished song or Sound effect
  ; 42: Glitched noise, possibly unfinished song or Sound effect
  ; 43: Glitched noise, possibly unfinished song or Sound effect
  ; 44: Glitchy music
  ; 45: Glitchy music
  ; 46: Glitchy music
  ; 47: Silence
  ; 48: Silence
  ; 49: Glitchy noise
  ; 4A: Silence
  ; 4B: Glitchy music
  ; 4C: Glitchy music
  ; 4D: - 4F Silence
  ; 50: - 57 Silence
  ; 58: Glitchy music
  ; 59: Silence
  ; 5A: Glitchy music
  ; 5B: Silence
  ; 5C: Silence
  ; 5D: Glitchy music
  ; 5E: Silence
  ; 5F: Silence
  ; 60: Silence
  ; 61: - 69 Color dungeon (DX only)
  ; 6A: - F9 Untested
  ; F0: Glitched music
  ; FF: Nothing
  ds 1

; Unlabeled
WR1_D369 equ $D369
  ds $AC

WR1_KillCount:: ; D415
  ds 1

; Unlabeled
WR0_D416 equ $D416
  ds $68

WR1_DidStealItem:: ; D47E
  ds 1

; Unlabeled
WR0_D47F equ $D47F
  ds $27D

WR1_EnginePaused:: ; D6FC
  ds 1

WR1_LCDControl:: ; D6FD
  ds 1

; Unlabeled
WR0_D6FE equ $D6FE
  ds $13

WR1_TileMap:: ; D711
  ds 1

; Unlabeled
WR0_D712 equ $D712
  ds $EE

; Minimap Tile
; Values:
;   0:     not discovered yet
;   non-0: various statuses
WR1_MinimapTiles:: ; D800
  ds $ff

; Unlabeled
WR0_D900 equ $D900
  ds $201

WR1_AButtonSlot:: ; DB00
  ds 1

WR1_BButtonSlot:: ; DB01
  ds 1

WR1_InventoryItem1:: ; DB02
  ds 1

WR1_InventoryItem2:: ; DB03
  ds 1

WR1_InventoryItem3:: ; DB04
  ds 1

WR1_InventoryItem4:: ; DB05
  ds 1

WR1_InventoryItem5:: ; DB06
  ds 1

WR1_InventoryItem6:: ; DB07
  ds 1

WR1_InventoryItem7:: ; DB08
  ds 1

WR1_InventoryItem8:: ; DB09
  ds 1

WR1_InventoryItem9:: ; DB0A
  ds 1

WR1_InventoryItem10:: ; DB0B
  ds 1

WR1_HasFlippers:: ; DB0C
  ds 1

WR1_HasMedicine:: ; DB0D
  ds 1

WR1_TradeSequenceItem:: ; DB0E
  ; Trade Sequence items:
  ; $00 Nothing
  ; $01 Yoshi Doll
  ; $02 Ribbon
  ; $03 Dog Food
  ; $04 Bananas
  ; $05 Stick
  ; $06 Honeycomb
  ; $07 Pineapple
  ; $08 Hibiscus
  ; $09 Letter
  ; $0A Broom
  ; $0B Fishing Hook
  ; $0C Necklace
  ; $0D Scale
  ; $0E Magnifying glass
  ds 1

WR1_SeashellsCount:: ; DB0F
  ds 1

; Unlabeled
WR0_DB10 equ $DB10
  ds 1

WR1_HasTailKey:: ; DB11
  ds 1

WR1_HasAnglerKey:: ; DB12
  ds 1

WR1_HasFaceKey:: ; DB13
  ds 1

WR1_HasBirdKey:: ; DB14
  ds 1

; Golden Leaves count
; 0-5: number of Golden Leaves
; 6  : Slime Key
WR1_GoldenLeavesCount:: ; DB15
  ds 1

; Unlabeled
WR0_DB16 equ $DB16
  ds $2D

WR1_PowerBraceletLevel:: ; DB43
  ds 1

WR1_ShieldLevel:: ; DB44
  ds 1

WR1_ArrowCount:: ; DB45
  ds 1

; Unlabeled
WR0_DB46 equ $DB46
  ds 7

WR1_BombCount:: ; DB4D
  ds 1

WR1_MarinAndTarinAtHome:: ; DB4E
  ds 1

; Unlabeled
WR0_DB4F equ $DB4F
  ds 7

WR1_IsBowWowFollowingLink:: ; DB56
  ds 1

; Unlabeled
WR0_DB57 equ $DB57
  ds $6

WR1_RupeeCountHigh:: ; DB5D
  ds 1

WR1_RupeeCountLow:: ; DB5E
  ds 1

; Unlabeled
WR0_DB5F equ $DB5F
  ds $6

WR1_HasInstrument1:: ; DB65
  ; 0: false, 2: true
  ds 1

WR1_HasInstrument2:: ; DB66
  ; 0: false, 2: true
  ds 1

WR1_HasInstrument3:: ; DB67
  ; 0: false, 2: true
  ds 1

WR1_HasInstrument4:: ; DB68
  ; 0: false, 2: true
  ds 1

WR1_HasInstrument5:: ; DB69
  ; 0: false, 2: true
  ds 1

WR1_HasInstrument6:: ; DB6A
  ; 0: false, 2: true
  ds 1

WR1_HasInstrument7:: ; DB6B
  ; 0: false, 2: true
  ds 1

WR1_HasInstrument8:: ; DB6C
  ; 0: false, 2: true
  ds 1

; Unlabeled
WR0_DB6E equ $DB6E
  ds 6

WR1_IsMarinFollowingLink:: ; DB73
  ds 1

; Unlabeled
WR0_DB74 equ $DB74
  ds 5

WR1_IsGhostFollowingLink:: ; DB79
  ds 1

WR1_DB7A:: ; DB7A
  ds 1

WR1_IsRoosterFollowingLink:: ; DB7B
  ds 1

; Unlabeled
WR0_DB7C equ $DB7C
  ds $14

; This appears to be the amount of rupees being added to your wallet
WR1_AddRupeeBuffer:: ; DB90
  ds 1

; Unlabeled
WR0_DB91 equ $DB91
  ds $4

WR1_GameplayType:: ; DB95
  ; See GAMEPLAY_* constants for possible values
  ds 1

WR1_GameplaySubtype:: ; DB96
  ; Value depens on GameplayType: this can be a sequence index, or a frame counter.
  ds 1

WR1_BGPalette:: ; DB97
  ds 1

WR1_OBJ0Palette:: ; DB98
  ds 1

WR1_OBJ1Palette:: ; DB99
  ds 1

WR1_WindowY:: ; DB9A
  ds 1

; Unlabeled
WR0_DB9B equ $DB9B
  ds $A

WR1_ActiveRoom:: ; $DBA5
  ; Current room?
  ds 1

WR1_SaveSlot:: ; DBA6
  ds 1

; Unlabeled
WR0_DBA7 equ $DBA7
  ds 8

WR1_CurrentBank:: ; DBAF
  ds 1

; Unlabeled
WR0_DBB0 equ $DBB0
  ds $5

WR1_KillCount2:: ; DBB5
  ds 1

; Unlabeled
WR0_DBB6 equ $DBB6
  ds $16

WR1_HasDungeonMap:: ; DBCC
  ds 1

WR1_HasDungeonCompass:: ; DBCD
  ds 1

WR1_HasDungeonStoneSlab:: ; DBCE
  ds 1

WR1_HasDungeonBossKey:: ; DBCF
  ds 1

; Unlabeled
WR0_DBD0 equ $DBD0
  ds $3C

; Photos 1-8 (bitfield)
WR1_Photos1:: ; DC0C
  ds 1

; Photos 9-12 (bitfield)
WR1_Photos2:: ; DC0D
  ds 1

WR1_DC0E::
  ds 1

; Tunic Type (GBC only)
; 0: green
; 1: red
; 2: blue
WR1_TunicType:: ; DC0F
  ds 1
