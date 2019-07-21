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
wC10A: ds 1
wC10B: ds 1
wC10C: ds 1
wC10D: ds 1

wNeedsUpdatingNPCTiles:: ; C10E
  ds 1

wC10F: ds 1
wC110: ds 1
wC111: ds 1
wDialogIndexHi: ds 1
wC113: ds 1
wC114: ds 1
wC115: ds 1
wC116: ds 1
wC117: ds 1
wC118: ds 1
wC119: ds 1
wC11A: ds 1
wC11B: ds 1

; See LINK_MOTION_* constants for possible values.
wLinkMotionState: ; C11C
  ds 1

wC11D: ds 1
wC11E: ds 1


wLinkGroundStatus:: ; C11F
  ; The condition of the ground Link is standing on
  ; 0:  dry ground
  ; 1:  steps (only when moving)
  ; 3:  wet or grassy
  ; 7:  pit
  ds 1

wC120: ds 1

wIsUsingSpinAttack:: ; C121
  ds 1

wSwordCharge:: ; C122
  ; Link's spin attack charging meter
  ; 0:     not charged
  ; 0x28:  fully charged
  ds 1

wLinkWalkingFrameCount:: ; C123
  ; Number of frames during which Link has been walking continuously
  ds 1

; See ROOM_TRANSITION_* constants for possible values.
wRoomTransitionState:: ; C124
  ds 1

wRoomTransitionDirection:: ; C125
  ; See ROOM_TRANSITION_DIR_* constants for possible values
  ds 1

wBGUpdateRegionOriginHigh:: ; C126
  ; Position of the first tile of a background region
  ; to be updated during a room transition (low byte)
  ds 1

wBGUpdateRegionOriginLow:: ; C127
  ; Position of the first tile of a background piece (row or colum)
  ; to update during a room transition (high byte)
  ds 1

wBGUpdateRegionTilesCount ; C128
  ; Number of tiles of a background piece (row or column) to be updated in a single batch
  ds 1

wRoomTransitionFramesBeforeMidScreen:: ; C129
  ; Number of frames remaining before reaching the mid-screen transition point
  ds 1

; Unlabeled
ds 2

wRoomTransitionTargetScrollX:: ; C12C
  ; Stop the room transition when reaching this value
  ds 1

wRoomTransitionTargetScrollY:: ; C12D
  ; Stop the room transition when reaching this value
  ds 1

wBGOriginHigh:: ; C12E
  ; Position of the first visible background tile (high byte)
  ds 1

wBGOriginLow:: ; C12F
  ; Position of the first visible background tile (low byte)
  ds 1

; Unlabeled
ds 3

wCollisionType:: ; C133
  ; 00  no collision
  ; 03  obstacle on top/bottom
  ; 04  unknown
  ; 08  unknown
  ; 0C  obstacle on left/right
  ds 1

; Unlabeled
ds $2

wSwordDirection:: ; C136
  ; Position of the sword during a sping attack
  ; See SWORD_DIRECTION_* constants for possible values
  ds 1

wSwordAnimationState:: ; C137
  ; State of the sword during a normal swing or a swing attack
  ; 00  none
  ; 01  swing start
  ; 02  swing middle
  ; 03  swing front
  ; 04  swing end
  ds 1

; Unlabeled
ds $5

wRandomSeed:: ; C13D
  ; Seed for the Random Number Generator
  ds 1

; Unlabeled
ds $5

wIsLinkInTheAir:: ; C143
  ; Is Link in the air (jumping with the feather, flying with roaster, etc)?
  ds 1

; Unlabeled
ds $6

wIsRunningWithPegasusBoots:: ; C14A
  ds 1

wPegagusBootsChargeMeter:: ; C14B
  ; Pegasus Boots charge meter
  ; 0:  not charged
  ; 1F: fully charged
  ds 1

wIsShootingArrow:: ; C14C
  ds 1

wProjectileCount:: ; C14D
  ; Link's active projectiles.
  ; If ≥0x02, Link cannot shoot any more projectiles.
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
wDialogCharacterIndexHi: ds 1
wC165: ds 1
wC166: ds 1
wC167: ds 1
wC168: ds 1
wNextJingle: ds 1 ; C169
wC16A: ds 1

wTransitionSequenceCounter:: ; C16B
  ds 1

wC16C: ds 1
wC16D: ds 1
wC16E: ds 1
; State of the dialog open or close animation.
; Values goes from 0 to 5.
wDialogOpenCloseAnimationFrame: ds 1 ; C16F
wDialogCharacterIndex ds 1 ; C170
wDialogNextCharPosition: ds 1 ; C171

wDialogScrollDelay:: ; C172
  ds 1

wDialogIndex: ds 1 ; C173
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

wTransitionGfx:: ; C17F
  ; Special Background effect applied during some transitions or animations.
  ; See TRANSITION_GFX_* constants for possible values.
  ds 1

wTransitionGfxFrameCount:: ; C180
  ; Number of frames rendered during a warp transition.
  ds 1

; Unlabeled
wC181 equ $C181
  ds $1E

wDialogState:: ; C19F
  ; Upper bit:    set if the dialog is displayed on bottom (instead of top)
  ; Lowest bits:  the dialog state (see DIALOG_* constants for possible values)
  ds 1

; Unlabeled
ds $5

wConveyorBeltsCount:: ; C1A5
  ; Number of conveyor belts on the current screen
  ds 1

; Unlabeled
ds 3

wDialogGotItem:: ; C1A9
  ; The "Got item" dialog to display
  ds 1

wDialogGotItemCountdown:: ; C1AA
  ; Number of frames to wait (while playing the "got item" sound effect)
  ; before displaying the dialog
  ds 1

; Unlabeled
ds $11

wLoadPreviousMapCountdown:: ; C1BC
  ; Number of frames to wait before loading the previous map and room
  ds 1

; Unlabeled
ds 2

wScrollXOffset:: ; C1BF
  ds 1

wBombArrowCooldown:: ; C1C0
  ; Gets set to 6 whenever Link uses the bow or drops a bomb,
  ; and then decrements by 1 each frame.
  ds 1

; Unlabeled
  ds $3F

wEntitiesPosXTable:: ; C200
  ; X position of visible entities
wEntity0PosX:: ds 1 ; C200
wEntity1PosX:: ds 1 ; C201
wEntity2PosX:: ds 1 ; C202
wEntity3PosX:: ds 1 ; C203
wEntity4PosX:: ds 1 ; C204
wEntity5PosX:: ds 1 ; C205
wEntity6PosX:: ds 1 ; C206
wEntity7PosX:: ds 1 ; C207
wEntity8PosX:: ds 1 ; C208
wEntity9PosX:: ds 1 ; C209
wEntityAPosX:: ds 1 ; C20A
wEntityBPosX:: ds 1 ; C20B
wEntityCPosX:: ds 1 ; C20C
wEntityDPosX:: ds 1 ; C20D
wEntityEPosX:: ds 1 ; C20E
wEntityFPosX:: ds 1 ; C20F

wEntitiesPosYTable:: ; C210
  ; Y position of visible entities
wEntity0PosY:: ds 1 ; C210
wEntity1PosY:: ds 1 ; C211
wEntity2PosY:: ds 1 ; C212
wEntity3PosY:: ds 1 ; C213
wEntity4PosY:: ds 1 ; C214
wEntity5PosY:: ds 1 ; C215
wEntity6PosY:: ds 1 ; C216
wEntity7PosY:: ds 1 ; C217
wEntity8PosY:: ds 1 ; C218
wEntity9PosY:: ds 1 ; C219
wEntityAPosY:: ds 1 ; C21A
wEntityBPosY:: ds 1 ; C21B
wEntityCPosY:: ds 1 ; C21C
wEntityDPosY:: ds 1 ; C21D
wEntityEPosY:: ds 1 ; C21E
wEntityFPosY:: ds 1 ; C21F

; Unlabeled entity attributes table
wC220 equ $C220
  ds $10

; Unlabeled entity attributes table
wC230 equ $C230
  ds $10

wEntitiesSpeedXTable:: ; C240
  ; X Velocity of visible entities
wEntity0SpeedX:: ds 1 ; C240
wEntity1SpeedX:: ds 1 ; C241
wEntity2SpeedX:: ds 1 ; C242
wEntity3SpeedX:: ds 1 ; C243
wEntity4SpeedX:: ds 1 ; C244
wEntity5SpeedX:: ds 1 ; C245
wEntity6SpeedX:: ds 1 ; C246
wEntity7SpeedX:: ds 1 ; C247
wEntity8SpeedX:: ds 1 ; C248
wEntity9SpeedX:: ds 1 ; C249
wEntityASpeedX:: ds 1 ; C24A
wEntityBSpeedX:: ds 1 ; C24B
wEntityCSpeedX:: ds 1 ; C24C
wEntityDSpeedX:: ds 1 ; C24D
wEntityESpeedX:: ds 1 ; C24E
wEntityFSpeedX:: ds 1 ; C24F

wEntitiesSpeedYTable:: ; C250
  ; X Velocity of visible entities
wEntity0SpeedY:: ds 1 ; C250
wEntity1SpeedY:: ds 1 ; C251
wEntity2SpeedY:: ds 1 ; C252
wEntity3SpeedY:: ds 1 ; C253
wEntity4SpeedY:: ds 1 ; C254
wEntity5SpeedY:: ds 1 ; C255
wEntity6SpeedY:: ds 1 ; C256
wEntity7SpeedY:: ds 1 ; C257
wEntity8SpeedY:: ds 1 ; C258
wEntity9SpeedY:: ds 1 ; C259
wEntityASpeedY:: ds 1 ; C25A
wEntityBSpeedY:: ds 1 ; C25B
wEntityCSpeedY:: ds 1 ; C25C
wEntityDSpeedY:: ds 1 ; C25D
wEntityESpeedY:: ds 1 ; C25E
wEntityFSpeedY:: ds 1 ; C25F

; Unlabeled entity attributes table
wC260 equ $C260
  ds $10

; Unlabeled entity attributes table
wC270 equ $C270
  ds $10

wEntitiesTypeTable:: ; C280
  ; Type of visible entities
  ; 0: entity not present
  ; 5: Link's ship in intro
  ; 6: Marin
wEntity0Type:: ds 1 ; C280
wEntity1Type:: ds 1 ; C281
wEntity2Type:: ds 1 ; C282
wEntity3Type:: ds 1 ; C283
wEntity4Type:: ds 1 ; C284
wEntity5Type:: ds 1 ; C285
wEntity6Type:: ds 1 ; C286
wEntity7Type:: ds 1 ; C287
wEntity8Type:: ds 1 ; C288
wEntity9Type:: ds 1 ; C289
wEntityAType:: ds 1 ; C28A
wEntityBType:: ds 1 ; C28B
wEntityCType:: ds 1 ; C28C
wEntityDType:: ds 1 ; C28D
wEntityEType:: ds 1 ; C28E
wEntityFType:: ds 1 ; C28F

wEntitiesWalkingTable:: ; C290
  ; Indicate if the designated entity is walking (1) or standing in place (0).
  ; e.g. Mabe village dog has 1 when jumping around, and 0 when standing in place moving the tail.
  ds $10

wEntitiesCollisionsTable:: ; C2A0
  ; Indicates if the entity is collisioning
  ; 0: no collisions
  ; 1: collision on the right
  ; 2: collision on the left
  ; 3: collision on the bottom
  ; 4: collision on the top
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
  ds $AF

wDroppedItem:: ; C3AF
  ; Status of one of the items that can be dropped by cutting herbs
  ds 1

wEntitiesUnknownTableG:: ; C3B0
  ; Entity custom state?

ds $1B

wObjectAffectingBGPalette:: ; C3CB
  ; Type of the object affecting the background palette
  ; (for instance a dark palette when torches are not lit)
  ds 1

wBGPaletteEffectAddress:: ; $C3CC
  ; Adress of a palette[frameCount] array
  ds 1

wC3CD:: ; C3CD
  ds 1

; Unlabeled
ds $8A

wDroppedItemsCountdown:: ; C458
  ; Number of frame before a dropped item disappears
  ds 8

; Unlabeled
ds $A0

wAlternateBackgroundEnabled:: ; C500
  ; If enabled, alternate between two Background position every frame.
  ds 1

; Unlabeled
ds $A6

wBossAgonySFXCountdown:: ; C5A7
  ; When reaching zero, play the SFX_BOSS_AGONY sound effect
  ds 1

; Unlabeled
ds 2

wEggMazeProgress:: ; C5AA
  ; Number of rooms progressed correctly in the Wind Fish's Egg maze
  ds 1

wDialogSFX:: ; C5AB
    ds 1

; Unlabeled
ds 3

wNextWorldMusicTrackCountdown:: ; C5AF
  ; When reaching zero, play wNextWorldMusicTrack
  ds 1

section "WRAM Bank1", wramx[$d000], bank[1]

wIsFileSelectionArrowShifted:: ; D000
  ; Is the arrow on the File Selection screen on the COPY item
  ; (May have other usages in other parts of the gameplay code)
  ds 1

wIntroTimer:: ; D001
  ds 1

wIntroSubTimer:: ; D002
  ds 1

; Unlabeled
wD003 equ $D003
  ds $365

wWorldMusicTrack:: ; D368
  ; World Music Track
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
ds $98

; Room warps
;
; Each room can have 4 warp points. The room warps destination are defined below,
; and the warp positions is defined at D416-D419.

wWarpStructs::

; Warp 0
wWarp0MapCategory:: ; D401
  ds 1
wWarp0Map:: ; D402
  ds 1
wWarp0Room:: ; D403
  ds 1
wWarp0DestinationX:: ; D404
  ds 1
wWarp0DestinationY:: ; D405
  ds 1

; Warp 1
wWarp1MapCategory:: ; D406
  ds 1
wWarp1Map:: ; D407
  ds 1
wWarp1Room:: ; D408
  ds 1
wWarp1DestinationX:: ; D409
  ds 1
wWarp1DestinationY:: ; D40A
  ds 1

; Warp 2
wWarp2MapCategory:: ; D40B
  ds 1
wWarp2Map:: ; D40C
  ds 1
wWarp2Room:: ; D40D
  ds 1
wWarp2DestinationX:: ; D40E
  ds 1
wWarp2DestinationY:: ; D40F
  ds 1

; Warp 3
wWarp3MapCategory:: ; D410
  ds 1
wWarp3Map:: ; D411
  ds 1
wWarp3Room:: ; D412
  ds 1
wWarp3DestinationX:: ; D413
  ds 1
wWarp3DestinationY:: ; D414
  ds 1

wPieceOfPowerKillCount:: ; D415
  ; Kill count, to tell if a Piece of Power should be dropped
  ds 1

wWarpPositions::
wWarp0PositionTileIndex:: ; D416
  ; Position of warp 0, as a tile index on the map
  ds 1

wWarp1PositionTileIndex:: ; D417
  ; Position of warp 1, as a tile index on the map
  ds 1

wWarp2PositionTileIndex:: ; D418
  ; Position of warp 2, as a tile index on the map
  ds 1

wWarp3PositionTileIndex:: ; D419
  ; Position of warp 3, as a tile index on the map
  ds 1

; Unlabeled
ds $48

wCompassSfxCountdown:: ; D462
  ; Each frame decrements the value.
  ; When reaching 0, play the compass sfx.
  ds 1

; Unlabeled
ds 9

wBossDefeated:: ; D46C
  ; A boss was just defeated
  ds 1

; Unlabeled
ds $D

wPowerUpHits:: ; D47A
  ; Power-ups are disabled after 3 hits are taken from ennemies
  ds 1

wForceFileSelectionScreenMusic:: ; D47B
  ; If not zero, force the music track to change when displaying the file selections screen
  ds 1

wActivePowerUp:: ; D47C
  ; 0:  No power-up
  ; 1:  Piece of Power
  ; 2:  Guardian Accorn
  ds 1

; Unlabeled
wD47D::
  ds 1

wDidStealItem:: ; D47E
  ds 1

; Unlabeled
ds 1 ; D47F

wDungeonMinimap:: ; D480
  ds $40

; Unlabeled
ds $D600 - $D4C0

; Data structures for copying data to vram during blanking times
wRequests::               ; D600
  ds 1

; Request destination address (big endian)
wRequest:                 ; D601
wRequestDestination:      ; D601
wRequestDestinationHigh:: ; D601
  ds 1
wRequestDestinationLow::  ; D602
  ds 1

; Request data length and mode
;   bits 0-6: data length
;   bits 7-8: copy mode (see BG_COPY_MODE_* constants)
wRequestLength:           ; D603
  ds 1

; Request data (variable length)
wRequestData:             ; D604
  ds $D6FA - $D604

wRoomSwitchableObject:: ; D6FA
  ; Is there one or more switchable objects in the room
  ; See ROOM_SWITCHABLE_OBJECT_* constants
  ds 1

; Unlabeled
ds 1

wEnginePaused:: ; D6FC
  ds 1

wLCDControl:: ; D6FD
  ds 1

wTileMapToLoad:: ; D6FE
  ds 1

wBGMapToLoad:: ; D6FF
  ds 1

; Memory region reserved for map objects of the active room.
; Actual objects are surrounded by FF values (see wRoomObjects)
;
; When loading a new room, room data is read and decoded into this
; area.
wRoomObjectsArea:: ; D700
  ; First section is FF values padding…
  ds $11

; Start of the actual map objects for the active room (ignoring the surrounding FF values)
wRoomObjects:: ; D711
  ds $EF

; World rooms status
; Each room is a byte combining ROOM_STATUS_* constants.
wOverworldRoomStatus:: ; D800
  ds $100

wIndoorARoomStatus:: ; D900
  ds $100

wIndoorBRoomStatus:: ; DA00
  ds $100

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

; Unlabeled - Spacing byte used to check for dungeon map during InventoryDisplayLoop
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

; Beginning of dungeon item flags.
; 5 bytes fo each dungeon.
; For each dungeon:
;   byte 0: has map?
;   byte 1: has compass?
;   byte 2: has stone slab?
;   byte 3: has boss key?
;   byte 4: small keys count
wDungeonItemFlags:: ; DB16
  ds $2D

wPowerBraceletLevel:: ; DB43
  ds 1

wShieldLevel:: ; DB44
  ds 1

wArrowCount:: ; DB45
  ds 1

; Unlabeled
wDB46 equ $DB46
  ds 6

wMagicPowderCount:: ; DB4C
  ds 1

wBombCount:: ; DB4D
  ds 1

wSwordLevel:: ; DB4E
  ; Set to 1 when Link retrieves his sword on the beach
  ds 1

wName:: ; DB4F
  ds NAME_LENGTH ; 5

wDB54:: ds 1
wDB55:: ds 1

wIsBowWowFollowingLink:: ; DB56
  ds 1

; Death count (one per save slot)
wDeathCount:: ; DB57
  ds $3

wHealth:: ; DB5A
  ; Number of hearts ($08 = 1 heart)
  ds 1

wMaxHealth:: ; DB5B
  ; Maximum number of hearts
  ds 1

wHeartPiecesCount:: ; DB5C
  ds 1

wRupeeCountHigh:: ; DB5D
  ; Higher digits of the player rupees count
  ds 1

wRupeeCountLow:: ; DB5E
  ; Lower digits of the player rupees count
  ds 1

; Define Link's spawn position
; Used when loading a save file or after a game over
wSpawnLocationData:: ; DB5F
wSpawnIsIndoor:: ; DB5F
  ds 1
wSpawnMapId:: ; DB60
  ds 1
wSpawnMapRoom:: ; DB61
  ds 1
wSpawnPositionX:: ; DB62
  ; If 0, will load the pre-defined save file
  ds 1
wSpawnPositionY:: ; DB63
  ds 1
wSpawnIndoorRoom:: ; DB64
  ds 1

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
wDB72: ds 1

wIsMarinFollowingLink:: ; DB73
  ds 1

; Unlabeled
wDB74 equ $DB74
  ds 2

wMaxMagicPowder:: ; DB76
  ds 1

wMaxBombs:: ; DB77
  ; Maximum number of bombs that Link can carry
  ds 1

wMaxArrows:: ; DB78
  ds 1

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
ds 2

wMapEntrancePositionX:: ; DB9D
  ; Initial position of Link when loading a new map
  ds 1

wMapEntrancePositionY:: ; DB9E
  ; Initial position of Link when loading a new map
  ds 1

; Unlabeled
ds 6

wIsIndoor:: ; DBA5
  ; 0 on the overworld
  ; 1 on interior maps (house, dungeons, etc)
  ds 1

wSaveSlot:: ; DBA6
  ds 1

wSaveFilesCount:: ; DBA7
  ds 1

; Unlabeled
ds 6

wIndoorRoom:: ; DBAE
  ds 1

wCurrentBank:: ; DBAF
  ds 1

; Unlabeled
wDBB0 equ $DBB0
  ds 1

wLinkMapEntryPositionX:: ; DBB1
  ; The position at which Link entered on a map
  ; (used for reseting Link's position after a fall)
  ds 1

wLinkMapEntryPositionY:: ; DBB2
  ; The position at which Link entered on a map
  ; (used for reseting Link's position after a fall)
  ds 1

; Unlabeled
ds 2

wKillCount2:: ; DBB5
  ds 1

; Unlabeled
wDBB6 equ $DBB6
  ds $13

wTorchesCount:: ; DBC9
  ds 1

; Unlabeled
ds 2

; A table of five items flags for the current dungeon
; See also: wDungeonItemFlags
wCurrentDungeonItemFlags:: ; DBCC
wHasDungeonMap::       ds 1 ; DBCC
wHasDungeonCompass::   ds 1 ; DBCD
wHasDungeonStoneSlab:: ds 1 ; DBCE
wHasDungeonBossKey::   ds 1 ; DBCF
wSmallKeysCount::      ds 1 ; DBD0

; Unlabeled
ds $2F

wFile1DeathCountHigh:: ; DC00
  ds 1

wFile1DeathCountLow:: ; DC01
  ds 1

wFile2DeathCountHigh:: ; DC02
  ds 1

wFile2DeathCountLow:: ; DC03
  ds 1

wFile3DeathCountHigh:: ; DC04
  ds 1

wFile3DeathCountLow:: ; DC05
  ds 1

; Unlabeled
ds 6

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

; Unlabeled
ds $DDD1 - $DC10

; Unknown palette-related value
wPaletteUnknownA:: ; DDD1
  ds 1

wPaletteToLoadForTileMap:: ; DDD2
  ; Indicates that the palette for the given tile map should
  ; be loaded on the next render loop
  ds 1

wPaletteUnknownC:: ; DDD3
  ds 1

wPaletteUnknownD:: ; DDD4
  ds 1

wPaletteUnknownE:: ; DDD5
  ds 1

; Unlabeled
ds $DDE0 - $DDD6

; Color dungeon rooms status
;
; See wOverworldRoomStatus
wColorDungeonRoomStatus:: ; DDE0
  ds $100

; E200 - E300: entities
; See https://github.com/Xkeeper0/emu-lua/blob/master/legacy/gbx/link's awakening.lua
