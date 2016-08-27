label_C000 equ $C000
label_C008 equ $C008
label_C010 equ $C010
label_C030 equ $C030
WR0_ScrollXOffsetForSection equ $C100 ; Table of the scrollX offset to add for each screen section being drawn
WR0_LCDSectionIndex         equ $C105 ; Portion of the screen being drawn (0 -> 4)
label_C106 equ $C106
label_C108 equ $C108
label_C10B equ $C10B
label_C10D equ $C10D
label_C10E equ $C10E
label_C10F equ $C10F
label_C111 equ $C111
label_C112 equ $C112
label_C113 equ $C113
label_C117 equ $C117
label_C11A equ $C11A
label_C11C equ $C11C
label_C11D equ $C11D
label_C11E equ $C11E
label_C120 equ $C120 ; link animation state?
label_C121 equ $C121
label_C122 equ $C122
label_C123 equ $C123
label_C124 equ $C124
label_C125 equ $C125
label_C127 equ $C127
label_C128 equ $C128
label_C12E equ $C12E
label_C12F equ $C12F
label_C130 equ $C130
label_C134 equ $C134
label_C136 equ $C136
label_C137 equ $C137
label_C138 equ $C138
label_C139 equ $C139
label_C13A equ $C13A
label_C13B equ $C13B
label_C13C equ $C13C
WR0_RandomSeed              equ $C13D
label_C140 equ $C140
label_C142 equ $C142
label_C144 equ $C144 ; Link sprite status (like is pushing something) ?
label_C145 equ $C145
label_C146 equ $C146
label_C149 equ $C149
label_C14A equ $C14A
label_C14B equ $C14B
label_C14C equ $C14C
label_C14D equ $C14D
label_C14E equ $C14E
label_C14F equ $C14F
label_C152 equ $C152
label_C153 equ $C153
label_C155 equ $C155
label_C156 equ $C156
label_C157 equ $C157
label_C15A equ $C15A
label_C15B equ $C15B
label_C15C equ $C15C
label_C15D equ $C15D
label_C15F equ $C15F
label_C160 equ $C160
label_C164 equ $C164
label_C165 equ $C165
label_C167 equ $C167
label_C16A equ $C16A
WR0_TransitionSequenceCounter equ $C16B ; ?
label_C16C equ $C16C
label_C16D equ $C16D
label_C16F equ $C16F
label_C170 equ $C170
label_C171 equ $C171
label_C172 equ $C172
label_C173 equ $C173
label_C175 equ $C175
label_C176 equ $C176
label_C177 equ $C177
WR0_DebugMode               equ $C17B ; See https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening#Mono_Pausing_the_Engine_and_Mono.2FDX_Free-Movement_Mode
label_C17F equ $C17F
label_C180 equ $C180
label_C181 equ $C181
label_C18A equ $C18A
label_C18B equ $C18B
label_C18E equ $C18E
label_C18F equ $C18F
label_C193 equ $C193
label_C197 equ $C197
label_C19B equ $C19B
label_C19C equ $C19C
label_C19D equ $C19D
label_C19F equ $C19F
label_C1A4 equ $C1A4
label_C1A5 equ $C1A5
label_C1A8 equ $C1A8
label_C1A9 equ $C1A9
label_C1AA equ $C1AA
label_C1AB equ $C1AB
label_C1AC equ $C1AC
label_C1AD equ $C1AD
label_C1BC equ $C1BC
label_C1BD equ $C1BD
label_C1BF equ $C1BF
label_C1C0 equ $C1C0
label_C1C1 equ $C1C1
label_C1C2 equ $C1C2
label_C1C4 equ $C1C4
label_C1C7 equ $C1C7
label_C1C8 equ $C1C8
label_C1CC equ $C1CC
label_C1CF equ $C1CF
label_C1D0 equ $C1D0
label_C1E0 equ $C1E0
label_C1F0 equ $C1F0
label_C200 equ $C200
label_C210 equ $C210
label_C220 equ $C220
label_C230 equ $C230
label_C240 equ $C240
label_C250 equ $C250
label_C280 equ $C280
label_C290 equ $C290
label_C2A0 equ $C2A0
label_C2E0 equ $C2E0
label_C2F0 equ $C2F0
label_C310 equ $C310
label_C320 equ $C320
label_C380 equ $C380
label_C3A0 equ $C3A0
label_C3B0 equ $C3B0
label_C3C0 equ $C3C0
label_C3C1 equ $C3C1
label_C3C3 equ $C3C3
label_C3C9 equ $C3C9
label_C3CA equ $C3CA
label_C3CB equ $C3CB
label_C3CC equ $C3CC
label_C3CD equ $C3CD
label_C3CF equ $C3CF
label_C3F0 equ $C3F0
label_C400 equ $C400
label_C410 equ $C410
label_C430 equ $C430
label_C450 equ $C450
label_C460 equ $C460
label_C4A0 equ $C4A0
label_C4F0 equ $C4F0
label_C500 equ $C500
label_C502 equ $C502
label_C509 equ $C509
label_C50A equ $C50A
label_C50E equ $C50E
label_C510 equ $C510
label_C520 equ $C520
label_C530 equ $C530
label_C540 equ $C540
label_C5A6 equ $C5A6
label_C5A7 equ $C5A7
label_C5A9 equ $C5A9
label_C5AB equ $C5AB
label_C5B0 equ $C5B0
label_C5C0 equ $C5C0
label_C5D0 equ $C5D0
label_CF00 equ $CF00

WR0_IsUsingSpinAttack equ $C121
WR0_IsShootingArrow   equ $C14C
WR0_ProjectileCount   equ $C14D
WR0_HasPlacedBomb     equ $C14E
WR0_ShieldLevel       equ $C15A
WR0_IsUsingShield     equ $C15B


label_D000 equ $D000
label_D006 equ $D006
label_D007 equ $D007
label_D008 equ $D008
label_D009 equ $D009
;label_D16A equ $D16A
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
WR1_OverworldMusic          equ $D368
label_D401 equ $D401
WR1_KillCount               equ $D415
label_D416 equ $D416
label_D45F equ $D45F
label_D463 equ $D463
label_D464 equ $D464
label_D473 equ $D473
label_D474 equ $D474
label_D478 equ $D478
label_D47C equ $D47C
WR1_DidStealItem            equ $D47E
label_D47F equ $D47F
label_D580 equ $D580
label_D600 equ $D600
label_D601 equ $D601
label_D602 equ $D602
label_D603 equ $D603
label_D604 equ $D604
label_D605 equ $D605
label_D6F8 equ $D6F8
label_D6FA equ $D6FA
label_D6FB equ $D6FB
label_D6FC equ $D6FC
label_D6FD equ $D6FD
label_D6FE equ $D6FE
label_D6FF equ $D6FF
WR1_TileMap                 equ $D711
; Minimap Tile
; $D800 -> $D8FF
; Values:
;   0:     not discovered yet
;   non-0: various statuses
WR1_MinimapTiles            equ $D800
label_D900 equ $D900
label_DA00 equ $DA00
WR1_AButtonSlot             equ $DB00
WR1_BButtonSlot             equ $DB01
WR1_InventoryItem1          equ $DB02
WR1_InventoryItem2          equ $DB03
WR1_InventoryItem3          equ $DB04
WR1_InventoryItem4          equ $DB05
WR1_InventoryItem5          equ $DB06
WR1_InventoryItem6          equ $DB07
WR1_InventoryItem7          equ $DB08
WR1_InventoryItem8          equ $DB09
WR1_InventoryItem9          equ $DB0A
WR1_InventoryItem10         equ $DB0B
WR1_HasFlippers             equ $DB0C
WR1_HasMedicine             equ $DB0D
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
WR1_TradeSequenceItem       equ $DB0E
WR1_SeashellsCount          equ $DB0F
label_DB10 equ $DB10
WR1_HasTailKey              equ $DB11
WR1_HasAnglerKey            equ $DB12
WR1_HasFaceKey              equ $DB13
WR1_HasBirdKey              equ $DB14
; Golden Leaves count
; 0-5: number of Golden Leaves
; 6  : Slime Key
WR1_GoldenLeavesCount       equ $DB15
WR1_ShieldLevel             equ $DB44
WR1_ArrowCount              equ $DB45
label_DB46                  equ $DB46
label_DB49                  equ $DB49
label_DB4B                  equ $DB4B
label_DB4C                  equ $DB4C
WR1_BombCount               equ $DB4D
WR1_MarinAndTarinAtHome     equ $DB4E
label_DB4F                  equ $DB4F
WR1_IsBowWowFollowingLink   equ $DB56
label_DB5A                  equ $DB5A
label_DB5F                  equ $DB5F
WR1_HasInstrument1          equ $DB65  ; 0: false, 2: true
WR1_HasInstrument2          equ $DB66  ; 0: false, 2: true
WR1_HasInstrument3          equ $DB67  ; 0: false, 2: true
WR1_HasInstrument4          equ $DB68  ; 0: false, 2: true
WR1_HasInstrument5          equ $DB69  ; 0: false, 2: true
WR1_HasInstrument6          equ $DB6A  ; 0: false, 2: true
WR1_HasInstrument7          equ $DB6B  ; 0: false, 2: true
WR1_HasInstrument8          equ $DB6C  ; 0: false, 2: true
label_DB6E                  equ $DB6E
label_DB6F                  equ $DB6F
label_DB70                  equ $DB70
label_DB71                  equ $DB71
WR1_IsMarinFollowingLink    equ $DB73
WR1_IsGhostFollowingLink    equ $DB79
WR1_IsRoosterFollowingLink  equ $DB7B
WR1_GameplayType            equ $DB95 ; See `GAMEPLAY_*` constants for possible values
WR1_GameplaySubtype         equ $DB96 ; Value depens on GameplayType: this can be a sequence index, or a frame counter.
WR1_BGPalette               equ $DB97
WR1_OBJ0Palette             equ $DB98
WR1_OBJ1Palette             equ $DB99
WR1_WindowY                 equ $DB9A
label_DB9D equ $DB9D
label_DB9E equ $DB9E
label_DBA5 equ $DBA5 ; current room?
WR1_SaveSlot                equ $DBA6
label_DBAE equ $DBAE
WR1_CurrentBank             equ $DBAF
label_DBB6 equ $DBB6
label_DBC7 equ $DBC7
label_DBC8 equ $DBC8 ; link position after room transition?
label_DBC9 equ $DBC9
WR1_HasDungeonMap           equ $DBCC
WR1_HasDungeonCompass       equ $DBCD
WR1_HasDungeonStoneSlab     equ $DBCE
WR1_HasDungeonBossKey       equ $DBCF
; Photos 1-8 (bitfield)
WR1_Photos1                 equ $DC0C
; Photos 9-12 (bitfield)
WR1_Photos2                 equ $DC0D
; Tunic Type (GBC only)
; 0: green
; 1: red
; 2: blue
WR1_TunicType               equ $DC0F
label_DC90 equ $DC90
label_DC91 equ $DC91
label_DCC0 equ $DCC0
label_DCDD equ $DCDD
label_DDD2 equ $DDD2
label_DDD5 equ $DDD5
label_DDD6 equ $DDD6
label_DDD7 equ $DDD7
label_DDD8 equ $DDD8
label_DDE0 equ $DDE0
label_DE01 equ $DE01
label_DE02 equ $DE02
label_DE03 equ $DE03
label_DE04 equ $DE04
label_DFFF equ $DFFF

WR1_RupeeCountHigh          equ $DB5D
WR1_RupeeCountLow           equ $DB5E
; This appears to be the amount of rupees being added to your wallet
WR1_AddRupeeBuffer          equ $DB90 
WR1_KillCount2              equ $DBB5

