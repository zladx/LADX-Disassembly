section "WRAM Bank0", wram0[$c000]

wram0Section EQU $C000

wOAMBuffer:: ; C000
  ; Buffer for OAM data. Copied to OAM by DMA
  ds 4 * 40

; Unlabeled
wC0A0:: ; C0A0
  ds $60

wScrollXOffsetForSection:: ; C100
  ; Table of the scrollX offset to add for each screen section being drawn
  ds $5

wLCDSectionIndex:: ; C105
  ; Portion of the screen being drawn (0 -> 4)
  ds 1

wIntroBGYOffset:: ; C106
  ; Offset for compensating the sea movement when drawing bottom screen section on intro sea
  ds 1


wC107: ds 1

wNameIndex:: ds 1

wC109: ds 1
wC10a: ds 1
wC10b: ds 1
wC10c: ds 1
wC10d: ds 1

wNeedsUpdatingNPCTiles:: ; C10E
  ds 1

wC10F: ds 1
wC110: ds 1
wC111: ds 1
wDialogueIndexHi: ds 1
wC113: ds 1
wC114: ds 1
wC115: ds 1
wC116: ds 1
wC117: ds 1
wC118: ds 1
wC119: ds 1
wC11A: ds 1
wC11B: ds 1
wC11C: ds 1
wC11D: ds 1
wC11E: ds 1
wC11F: ds 1
wC120: ds 1

wIsUsingSpinAttack:: ; C121
  ds 1

; Unlabeled
wC122 equ $C122
  ds 2

wMapSlideTransitionState:: ; C124
  ds 1

; Unlabeled
wC125 equ $C125
  ds $18

wRandomSeed:: ; C13D
  ; Seed for the Random Number Generator
  ds 1

; Unlabeled
wC140 equ $C13E
  ds $E

wIsShootingArrow:: ; C14C
  ds 1

wProjectileCount:: ; C14D
  ds 1

wHasPlacedBomb:: ; C14E
  ds 1

wInventoryAppearing:: ; C14F
  ds 1

; Unlabeled
wC150 equ $C150
  ds 5

wScreenShakeHorizontal:: ; C155
  ; background offset for shaking the screen vertically
  ds 1

wScreenShakeVertical:: ; C156
  ; background offset for shaking the screen vertically
  ds 1

; Unlabeled
wC157 equ $C157
  ds $2

wInventoryCursorFrameCounter:: ; C159
  ds 1

wHasMirrorShield:: ; C15A
  ds 1

wIsUsingShield:: ; C15B
  ds 1

wC15C: ds 1
wC15D: ds 1
wC15E: ds 1
wC15F: ds 1
wC160: ds 1
wC161: ds 1
wC162: ds 1
wC163: ds 1
wCharacterPositionHi: ds 1
wC165: ds 1
wC166: ds 1
wC167: ds 1
wC168: ds 1
wC169: ds 1
wC16A: ds 1

wTransitionSequenceCounter:: ; C16B
  ds 1

wC16C: ds 1
wC16D: ds 1
wC16E: ds 1
wC16F: ds 1
wCharacterPosition: ds 1
wC171: ds 1

wDialogScrollDelay:: ; C172
  ds 1

wDialogueIndex: ds 1
wC174: ds 1
wC175: ds 1
wC176: ds 1
wC177: ds 1
wC178: ds 1
wC179: ds 1
wC17a: ds 1

wFreeMovementMode:: ; C17B
  ; See https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening#Mono_Pausing_the_Engine_and_Mono.2FDX_Free-Movement_Mode
  ds 1

; Unlabeled
wC17C equ $C17C
  ds 3

wTransitionSfx:: ; C17F
  ; Special Background effect applied during some transitions or animations.
  ; See TRANSITION_SFX_* constants for possible values.
  ds 1

wTransitionSfxFrameCount:: ; C180
  ; Number of frames rendered during a warp transition.
  ds 1

; Unlabeled
wC181 equ $C181
  ds $1E

wDialogState:: ; C19F
  ; See DIALOG_* constants for possible values.
  ds 1

wC1A4 equ $C1A0
  ds $1F

wScrollXOffset:: ; C1BF
  ds 1

wC1C0 equ $C1C0 ; C1C0
  ds $40

wEntitiesPosXTable:: ; C200
  ; X position of visible entities

wEntity0PosX:: ; C200
  ds $1

wEntity1PosX:: ; C201
  ds $1

wEntity2PosX:: ; C202

wIntroShipPosX:: ; C202
  ; Position of the ship sprite during the intro sequence
  ds $1

wEntity3PosX:: ; C203
  ds $1

wEntity4PosX:: ; C204
  ds $1

wEntity5PosX:: ; C205
  ds $1

wEntity6PosX:: ; C206
  ds $1

wEntity7PosX:: ; C207
  ds $1

wEntity8PosX:: ; C208
  ds $1

wEntity9PosX:: ; C209
  ds $1

wEntity10PosX:: ; C20A
  ds $1

wEntity11PosX:: ; C20B
  ds $1

wEntity12PosX:: ; C20C
  ds $1

wEntity13PosX:: ; C20D
  ds $1

wEntity14PosX:: ; C20E
  ds $1

wEntity15PosX:: ; C20F
  ds $1

wEntitiesPosYTable:: ; C210
  ; Y position of visible entities
  ds $10

; Unlabeled
wC220 equ $C220
  ds $60

wEntitiesTypeTable:: ; C280
  ; type of visible entities
  ds $10

wEntitiesWalkingTable:: ; C290
  ; Indicate if the designated entity is walking (1) or standing in place (0).
  ; e.g. Mabe village dog has 1 when jumping around, and 0 when standing in place moving the tail.
  ds $10

wEntitiesUnknownTableA:: ; C2A0
  ds $10

wEntitiesUnknownTableB:: ; C2B0
  ds $10

wEntitiesUnknownTableC:: ; C2C0
  ds $10

wEntitiesUnknownTableD:: ; C2D0
  ds $10

wEntitiesFrameCounterTable:: ; C2E0
  ; Frames count of the current animation for the entity.
  ds $10

wEntitiesUnknowTableF:: ; C2F0
  ds $10

; Unlabeled
wC300 equ $C300 ; C300
  ds $200

wAlternateBackgroundEnabled:: ; C500
  ; If enabled, alternate between two Background position every frame.
  ds 1
  
ds $aa

wDialogueSFX:: ; C5ab
    ds 1

section "WRAM Bank1", wramx[$d000], bank[1]

; Unlabeled
wD000 equ $D000
  ds 1

wIntroTimer:: ; D001
  ds 1

wIntroSubTimer:: ; D002
  ds 1

; Unlabeled
wD003 equ $D003
  ds $365

wOverworldMusic:: ; D368
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
wD369 equ $D369
  ds $AC

wKillCount:: ; D415
  ds 1

; Unlabeled
wD416 equ $D416
  ds $68

wDidStealItem:: ; D47E
  ds 1

; Unlabeled
wD47F equ $D47F
  ds $27D

wEnginePaused:: ; D6FC
  ds 1

wLCDControl:: ; D6FD
  ds 1

wTileMapToLoad:: ; D6FE
  ds 1

wBGMapToLoad:: ; D6FF
  ds 1

wD700 equ $D700
  ds $11

wTileMap:: ; D711
  ds 1

; Unlabeled
wD712 equ $D712
  ds $EE

; Minimap Tile
; Values:
;   0:     not discovered yet
;   non-0: various statuses
wMinimapTiles:: ; D800
  ds $ff

; Unlabeled
wD900 equ $D900
  ds $201

wAButtonSlot:: ; DB00
  ds 1

wBButtonSlot:: ; DB01
  ds 1

wInventoryItem1:: ; DB02
  ds 1

wInventoryItem2:: ; DB03
  ds 1

wInventoryItem3:: ; DB04
  ds 1

wInventoryItem4:: ; DB05
  ds 1

wInventoryItem5:: ; DB06
  ds 1

wInventoryItem6:: ; DB07
  ds 1

wInventoryItem7:: ; DB08
  ds 1

wInventoryItem8:: ; DB09
  ds 1

wInventoryItem9:: ; DB0A
  ds 1

wInventoryItem10:: ; DB0B
  ds 1

wHasFlippers:: ; DB0C
  ds 1

wHasMedicine:: ; DB0D
  ds 1

wTradeSequenceItem:: ; DB0E
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

wSeashellsCount:: ; DB0F
  ds 1

; Unlabeled
wDB10 equ $DB10
  ds 1

wHasTailKey:: ; DB11
  ds 1

wHasAnglerKey:: ; DB12
  ds 1

wHasFaceKey:: ; DB13
  ds 1

wHasBirdKey:: ; DB14
  ds 1

; Golden Leaves count
; 0-5: number of Golden Leaves
; 6  : Slime Key
wGoldenLeavesCount:: ; DB15
  ds 1

; Unlabeled
wDB16 equ $DB16
  ds $2D

wPowerBraceletLevel:: ; DB43
  ds 1

wShieldLevel:: ; DB44
  ds 1

wArrowCount:: ; DB45
  ds 1

; Unlabeled
wDB46 equ $DB46
  ds 7

wBombCount:: ; DB4D
  ds 1

wMarinAndTarinAtHome:: ; DB4E
  ds 1

wName:: ; db4f
  ds NAME_LENGTH ; 5

wDB54:: ds 1
wDB55:: ds 1

wIsBowWowFollowingLink:: ; DB56
  ds 1

; Unlabeled
wDB57 equ $DB57
  ds $6

wRupeeCountHigh:: ; DB5D
  ; Higher digits of the player rupees count
  ds 1

wRupeeCountLow:: ; DB5E
  ; Lower digits of the player rupees count
  ds 1

; Unlabeled
wDB5F equ $DB5F
  ds $6

wHasInstrument1:: ; DB65
  ; 0: false, 2: true
  ds 1

wHasInstrument2:: ; DB66
  ; 0: false, 2: true
  ds 1

wHasInstrument3:: ; DB67
  ; 0: false, 2: true
  ds 1

wHasInstrument4:: ; DB68
  ; 0: false, 2: true
  ds 1

wHasInstrument5:: ; DB69
  ; 0: false, 2: true
  ds 1

wHasInstrument6:: ; DB6A
  ; 0: false, 2: true
  ds 1

wHasInstrument7:: ; DB6B
  ; 0: false, 2: true
  ds 1

wHasInstrument8:: ; DB6C
  ; 0: false, 2: true
  ds 1

wDB6D: ds 1

wIsThief:: ; DB6E
  ds 1

wDB6F: ds 1
wDB70: ds 1
wDB71: ds 1
wDB62: ds 1

wIsMarinFollowingLink:: ; DB73
  ds 1

; Unlabeled
wDB74 equ $DB74
  ds 5

wIsGhostFollowingLink:: ; DB79
  ds 1

wDB7A:: ; DB7A
  ds 1

wIsRoosterFollowingLink:: ; DB7B
  ds 1

; Unlabeled
wDB7C equ $DB7C
  ds $14

wAddRupeeBufferHigh:: ; DB90
  ; Higher digits of the amount of rupees to be added to your wallet (high digits)
  ds 1

wAddRupeeBufferLow:: ; DB91
  ; Amount of rupees to be added to your wallet (low digits)
  ds 1

wSubstractRupeeBufferHigh:: ; DB92
  ; Amount of rupees to be removed from your wallet (high digits)
  ds 1

wSubstractRupeeBufferLow:: ; DB93
  ; Amount of rupees to be removed from your wallet (low digits)
  ds 1

; Unlabeled
wDB94:: ; DB94
  ds 1

wGameplayType:: ; DB95
  ; See GAMEPLAY_* constants for possible values
  ds 1

wGameplaySubtype:: ; DB96
  ; Value depens on GameplayType: this can be a sequence index, or a frame counter.
  ds 1

wBGPalette:: ; DB97
  ds 1

wOBJ0Palette:: ; DB98
  ds 1

wOBJ1Palette:: ; DB99
  ds 1

wWindowY:: ; DB9A
  ds 1

; Unlabeled
wDB9B equ $DB9B
  ds $A

wActiveRoom:: ; $DBA5
  ; Current room?
  ds 1

wSaveSlot:: ; DBA6
  ds 1

; Unlabeled
wDBA7 equ $DBA7
  ds 8

wCurrentBank:: ; DBAF
  ds 1

; Unlabeled
wDBB0 equ $DBB0
  ds $5

wKillCount2:: ; DBB5
  ds 1

; Unlabeled
wDBB6 equ $DBB6
  ds $16

wHasDungeonMap:: ; DBCC
  ds 1

wHasDungeonCompass:: ; DBCD
  ds 1

wHasDungeonStoneSlab:: ; DBCE
  ds 1

wHasDungeonBossKey:: ; DBCF
  ds 1

; Unlabeled
wDBD0 equ $DBD0
  ds $3C

; Photos 1-8 (bitfield)
wPhotos1:: ; DC0C
  ds 1

; Photos 9-12 (bitfield)
wPhotos2:: ; DC0D
  ds 1

wDC0E::
  ds 1

; Tunic Type (GBC only)
; 0: green
; 1: red
; 2: blue
wTunicType:: ; DC0F
  ds 1
