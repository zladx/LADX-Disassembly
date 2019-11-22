section "WRAM Bank0", wram0[$c000]

wram0Section EQU $C000

; Buffer for OAM data. Copied to OAM by DMA.
; Structure:
;  byte 0: Y position
;  byte 1: X position
;  byte 2: tile n°
;  byte 3: attribute
wOAMBuffer:: ; C000
wLinkOAMBuffer:: ; C000
  ; Area for Link OAM data
  ds 4 * 12
wDynamicOAMBuffer:: ; C030
  ; Area for dynamically allocated OAM elements
  ds 4 * 28

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

wMusicTrackTiming: ; C10B
  ; Music timing
  ; 0: normal
  ; 1: double-speed
  ; 2: half-speed
  ds 1

wC10C: ds 1
wC10D: ds 1

wNeedsUpdatingNPCTiles:: ; C10E
  ds 1

wC10F: ds 1
wC110: ds 1
wC111: ds 1
wDialogIndexHi: ds 1
wC113: ds 1

wNoiseSfxSeaWavesCounter::
  ; Delay for repeatin the NOISE_SFX_SEA_WAVES sound effect
  ; Plays when reaching $A0
  ds 1

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
  ; See DIRECTION_* constants for possible values
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

wPegasusBootsChargeMeter:: ; C14B
  ; Pegasus Boots charge meter
  ; 0:  not charged
  ; 1F: fully charged
  ds 1

wIsShootingArrow:: ; C14C
  ds 1

wActiveProjectileCount:: ; C14D
  ; Link's active projectiles.
  ; If ≥0x02, Link cannot shoot any more projectiles.
  ; Re-initialized to 0 at the end of each frame.
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

; Contains a DIRECTION_* value taken from Link's irection
wC15D: ds 1

wC15E: ds 1
wC15F: ds 1
wC160: ds 1
wC161: ds 1
wC162: ds 1
wC163: ds 1
wDialogCharacterIndexHi: ds 1
wC165: ds 1
wLinkPlayingOcarinaCountdown: ; C166
  ; While not zero, Link is shown playing the Ocarina
  ds 1
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
ds $C18E - $C181

wRoomEvent:: ; C18E
  ; Event for the current room
  ; A combination of trigger and effect values
  ; See TRIGGER_* and EFFECT_* constants for possible values
  ds 1

wRoomEventEffectExecuted:: ; C18F
  ; Has the event effect for the current room been executed already?
  ds 1

; Unlabeled
ds $C19F - $C190

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

; ---------------------------------------------------------
;
; Entities state
;
;----------------------------------------------------------

wEntitiesPosXTable:: ; C200
  ; X position of visible entities
  ds $10

wEntitiesPosYTable:: ; C210
  ; Y position of visible entities
  ds $10

wEntitiesPosXSignTable:: ; C220
  ; Controls the sign of the X position
  ; 00:  position is positive
  ; FF:  position is negative
  ds $10

wEntitiesPosYSignTable:: ; C230
  ; Controls the sign of the Y position
  ; 00:  position is positive
  ; FF:  position is negative
  ds $10

wEntitiesSpeedXTable:: ; C240
  ; X Velocity of visible entities
  ds $10

wEntitiesSpeedYTable:: ; C250
  ; X Velocity of visible entities
  ds $10

wEntitiesUnknowTableN:: ; C260
  ; Unlabeled entity attributes table
  ; Related to speed X: many code occurence do somethinkg like:
  ;   [wEntitiesUnknowTableN + entity index] = [wEntitiesUnknowTableN + entity index] + (EntitySpeedX * 16)
  ds $10

wEntitiesUnknowTableO:: ; C270
  ; Unlabeled entity attributes table
  ; Related to speed Y: many code occurence do somethinkg like:
  ;   [wEntitiesUnknowTableN + entity index] = [wEntitiesUnknowTableN + entity index] + (EntitySpeedY * 16)
  ds $10

wEntitiesStatusTable:: ; C280
  ; State of visible entities
  ; See ENTITY_STATUS_* constants
  ds $10

wEntitiesStateTable:: ; C290
  ; Store the main state of an entity. Meaning of values is entity-specific.
  ;
  ; For instance:
  ; Mabe fox:  1 when jumping around, and 0 when standing in place moving the tail.
  ; Cucoo: 1 when jumping around, and 0 when standing in place
  ; BowWow: 0 when standing still, 1 when bouncing lightly, 2 when making a big jump, 3 after a jump
  ; Village kids: 0 when standing still, 1 when bouncing
  ; Moblin: 0 when walking, 1 when standing still
  ; etc.
  ds $10

wEntitiesCollisionsTable:: ; C2A0
  ; Indicates if the entity is collisioning
  ; 0: no collisions
  ; 1: collision on the right
  ; 2: collision on the left
  ; 3: collision on the bottom
  ; 4: collision on the top
  ds $10

; Unknown. Maybe entity-specific IA state?
;
; Octorock: enumerates 1-2-3-0
; Moblin: enumerates 1-2-3-0
; Cucoo: stays to 0
; Butterfly: stores a delta X to move closer to Link
wEntitiesUnknownTableB:: ; C2B0
  ds $10

; Butterfly: stores a delta Y to move closer to Link
wEntitiesUnknownTableC:: ; C2C0
  ds $10

wEntitiesUnknownTableD:: ; C2D0
  ds $10

wEntitiesTransitionCountdownTable:: ; C2E0
  ; Frames before the next state transition of the entity
  ds $10

wEntitiesUnknowTableF:: ; C2F0
  ds $10

; Unlabeled
wEntitiesUnknowTableG:: ; C300
  ds $10

wEntitiesPosZTable:: ; C310
  ; When the altitude is higher than 0, the entity position is shifted vertically,
  ; and a shadow is displayed underneath.
  ds $10

wEntitiesSpeedZTable:: ; C320
  ; Positive numbers increase the altitude, negative numbers decrease it
  ds $10

wEntitiesUnknowTableK:: ; C330
  ds $10

wEntitiesUnknowTableL:: ; C340
  ; Physics attribute flags?
  ;
  ; 0000 0000: hurts links; flickers
  ; 0000 0010: left half semi-transparent?
  ;
  ;
  ;
  ;
  ;
  ; 1000 0000: doesn't hurt Link if set (Link's go through)

  ; Hen, Dog: $92
  ;
  ds $10

wEntitiesHitboxFlagsTable:: ; C350
  ; Type of hitbox (plus maybe other flags)
  ; - bit 0-4: hitbox type (see HitboxPositions)
  ; - bit 5:
  ; - bit 6:
  ; - bit 7: force collision (for some entities only)
  ds $10

wEntitiesHealthTable:: ; C360
  ds $10

wEntitiesUnusedTableA:: ; C370
  ; Unused value
  ds $10

wEntitiesDirectionTable:: ; C380
  ; Direction of the entity.
  ; See DIRECTION_* constants for possible values.
  ;
  ; This direction is always relevant for projectile-throwing entities
  ; (like Moblins or Octorocks). Other entities may not be as strict to
  ; update their direction.
  ds $10

wEntitiesUnknowTableR:: ; C390
  ds $10

wEntitiesTypeTable:: ; C3A0
  ; Type of the entity
  ds $10

wEntitiesSpriteVariantTable:: ; C3B0
  ; Index of an entity sprite variant, depending for instance on the direction,
  ; the tail waving, etc.
  ; A sprite variant may use entirerly different tiles, or change only some of them.
  ds $10

; Unlabeled
ds $C3CB - $C3C0

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
ds $C3D0 - $C3CE

wEntitiesUnknowTableY:: ; C3D0
  ds $10

wEntitiesRoomTable:: ; C3E0
  ; Room id of the entity
  ds $10

; Unlabeled
ds $10

wEntitiesUnknowTableS:: ; C400
  ds $10

wEntitiesUnknowTableT:: ; C410
  ds $10

wEntitiesUnknowTableU:: ; C420
  ds $10

wEntitiesUnknowTableH::  ; C430
  ds $10

wEntitiesUnknowTableP:: ; C440
  ds $10

wEntitiesDropTimerTable:: ; C450
  ; Number of frame before a dropped item disappears
  ds $10

wEntitiesLoadOrderTable:: ; C460
  ds $10

wEntitiesUnknowTableI:: ; C470
  ds $10

wEntitiesUnknowTableV:: ; C480
  ds $10

wEntitiesUnknowTableW:: ; C490
  ds $10

wEntitiesUnknowTableZ:: ; C4A0
  ds $10

; Unlabeled
ds $20

; Maybe the entities health group?
; See ConfigureNewEntity
wEntitiesHealthGroup:: ; C4D0
  ds $10

wEntitiesUnknowTableX:: ; C4E0
  ds $10

wEntitiesUnknowTableJ:: ; C4F0
  ds $10

wAlternateBackgroundEnabled:: ; C500
  ; If enabled, alternate between two Background position every frame.
  ds 1

; Unlabeled
ds $A6

wBossAgonySFXCountdown:: ; C5A7
  ; When reaching zero, play the WAVE_SFX_BOSS_AGONY sound effect
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

; Unlabeled
ds $CE80 - $C5B0

wRecentRoomsIndex:: ; CE80
  ; Index of the next slot to use in wRecentRooms
  ds 1

wRecentRooms:: ; CE81
  ; List of the 6 most recently loaded rooms.
  ds $6

; Unlabeled
ds $CF00 - $CE87

wEntitiesClearedRooms:: ; CF00
  ; For each room, store the number of entities not to load
  ; when entering the room next time.
  ; Used to avoid respawning enemies as soon as the player moves to
  ; the next room.
  ds $FF

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
ds $D00E - $D003

wCreditsSubscene:: ; D00E
  ds 1

; Unlabeled
ds $D219 - $D00F

wFinalNightmareForm:: ; D219
  ; Current form of the Final Nightmare (0-5)
  ds 1

; Unlabeled
ds $D300 - $D21A

; D300 (unlabeled, audio related)
ds $60

wActiveJingle:: ; D360
  ; The squareform jingle currently playing
  ds 1

; D361-D367: squareform jingle parameters
ds 7

wActiveMusicTrack:: ; D368
  ; The music track currently playing
  ds 1

; Unlabeled
ds 7

wActiveWaveSfx:: ; D370
  ; The waveform sound effect currently playing
  ds 1

; D371-D377: wave sound effect parameters
ds 7

wActiveNoiseSfx:: ; D378
  ; The noise generator sound effect currently playing
  ds 1

; D379-D???: noise sound effect parameters

; Unlabeled
ds $88

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
ds $D580 - $D4C0

wEntitiesHitboxPositionTable:: ; D580
  ds MAX_ENTITIES * 4

; Unlabeled
ds $D600 - $D5C0

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
;
; NB: this area is also used in RAM bank 2, where it contains
; the object attributes.
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
  ds 3

; $0111 means that the player has every song.
;   byte 0: has Ballad of the Wind Fish?
;   byte 1: has Manbo's Mambo?
;   byte 2: has Frog's Song of the Soul?
wOcarinaSongFlags:: ; DB49
  ds 1

; Unlabeled
wDB4A equ $DB4A
  ds 1

; 0 means that the player does not have the Toadstool
; 1 means that the player has the Toadstool
wHasToadstool:: ; DB4B
  ds 1

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
ds 1

wMapEntranceRoom:: ; DB9C
  ; Initial room of Link when loading a new map
  ds 1

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

wMinimapLayout ; DBB0
  ; Layout of the dungeon map in the inventory
  ; See INVENTORY_MINIMAP_* constants for values
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

; DC10: palette data?
; DC30: palette data?

wPaletteDataFlags:: ; DDD1
  ; Palette flags for copying palettes to hardware
  ; byte 0:   if enabled, palette data is for BG (otherwise for objects)
  ; byte 2:   unknown
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
