; Constants for music tracks and sound effects

; Values for wMusicTrackToPlay

DEF MUSIC_NONE                              EQU $00 ; Unclear usage, needs looking into
DEF MUSIC_TITLE_SCREEN                      EQU $01 ; Plays after watching title cutscene
DEF MUSIC_MINIGAME                          EQU $02 ; Trendy Game, Fishing, Camera Shop
DEF MUSIC_GAME_OVER                         EQU $03
DEF MUSIC_MABE_VILLAGE                      EQU $04
DEF MUSIC_OVERWORLD                         EQU $05
DEF MUSIC_TAL_TAL_RANGE                     EQU $06
DEF MUSIC_SHOP                              EQU $07 ; Town Shop, Witch's Hut
DEF MUSIC_RAFT_RIDE_RAPIDS                  EQU $08
DEF MUSIC_MYSTERIOUS_FOREST                 EQU $09
DEF MUSIC_INSIDE_BUILDING                   EQU $0A ; Most residences, Village Library, Seashell Mansion
DEF MUSIC_ANIMAL_VILLAGE                    EQU $0B
DEF MUSIC_FAIRY_FOUNTAIN                    EQU $0C
DEF MUSIC_TITLE_SCREEN_NO_INTRO             EQU $0D ; If title cutscene is skipped with Start
DEF MUSIC_BOWWOW_KIDNAPPED                  EQU $0E
DEF MUSIC_OBTAIN_SWORD                      EQU $0F
DEF MUSIC_OBTAIN_ITEM                       EQU $10
DEF MUSIC_FILE_SELECT                       EQU $11
DEF MUSIC_EGG_MAZE                          EQU $12
DEF MUSIC_KANALET_CASTLE                    EQU $13
DEF MUSIC_TAIL_CAVE                         EQU $14
DEF MUSIC_BOTTLE_GROTTO                     EQU $15
DEF MUSIC_KEY_CAVERN                        EQU $16
DEF MUSIC_ANGLERS_TUNNEL                    EQU $17
DEF MUSIC_AFTER_BOSS                        EQU $18
DEF MUSIC_BOSS                              EQU $19
DEF MUSIC_TITLE_CUTSCENE                    EQU $1A
DEF MUSIC_OBTAIN_INSTRUMENT                 EQU $1B
DEF MUSIC_INTRO_WAKE_UP                     EQU $1C ; Marin & Tarin's House when starting a new game
DEF MUSIC_OVERWORLD_SWORDLESS               EQU $1D
DEF MUSIC_DREAM_SHRINE_SLEEP                EQU $1E
DEF MUSIC_SOUTHERN_SHRINE                   EQU $1F
DEF MUSIC_INSTRUMENT_FULL_MOON_CELLO        EQU $20 ; After obtaining
DEF MUSIC_2D_UNDERGROUND                    EQU $21
DEF MUSIC_OWL                               EQU $22
DEF MUSIC_FINAL_BOSS                        EQU $23
DEF MUSIC_DREAM_SHRINE_BED                  EQU $24
DEF MUSIC_HEART_CONTAINER                   EQU $25
DEF MUSIC_CAVE                              EQU $26
DEF MUSIC_OBTAIN_POWERUP                    EQU $27
DEF MUSIC_INSTRUMENT_CONCH_HORN             EQU $28 ;\
DEF MUSIC_INSTRUMENT_SEA_LILYS_BELL         EQU $29 ; \
DEF MUSIC_INSTRUMENT_SURF_HARP              EQU $2A ;  \
DEF MUSIC_INSTRUMENT_WIND_MARIMBA           EQU $2B ;   After obtaining
DEF MUSIC_INSTRUMENT_CORAL_TRIANGLE         EQU $2C ;  /
DEF MUSIC_INSTRUMENT_ORGAN_OF_EVENING_CALM  EQU $2D ; /
DEF MUSIC_INSTRUMENT_THUNDER_DRUM           EQU $2E ;/
DEF MUSIC_MARIN_SING                        EQU $2F
DEF MUSIC_MANBOS_MAMBO                      EQU $30
DEF MUSIC_OVERWORLD_INTRO                   EQU $31 ; After obtaining sword
DEF MUSIC_MR_WRITE_HOUSE                    EQU $32
DEF MUSIC_ULRIRA                            EQU $33 ; Ulrira's House, Phone Booths
DEF MUSIC_TARIN_BEES                        EQU $34
DEF MUSIC_MAMU_FROG_SONG                    EQU $35
DEF MUSIC_MONKEYS_BUILDING_BRIDGE           EQU $36
DEF MUSIC_CHRISTINE_HOUSE                   EQU $37
DEF MUSIC_TOTAKA_UNUSED                     EQU $38
DEF MUSIC_TURTLE_ROCK_ENTRANCE_BOSS         EQU $39
DEF MUSIC_FISHERMAN_UNDER_BRIDGE            EQU $3A
DEF MUSIC_OBTAIN_ITEM_UNUSED                EQU $3B
DEF MUSIC_FILE_SELECT_TOTAKA                EQU $3C ; Accessible only in German DX and Japanese versions. Enter file name MOYSE/とたけけ
DEF MUSIC_ENDING                            EQU $3D
DEF MUSIC_MOBLIN_HIDEOUT                    EQU $3E
DEF MUSIC_ISLAND_DISAPPEAR                  EQU $3F
DEF MUSIC_RICHARD_HOUSE                     EQU $40
DEF MUSIC_EGG_BALLAD_DEFAULT                EQU $41 ; Play at egg without instrument #3
DEF MUSIC_EGG_BALLAD_BELL                   EQU $42 ; Play at egg with instrument #3
DEF MUSIC_EGG_BALLAD_HARP                   EQU $43 ; Play at egg with instruments #3-4
DEF MUSIC_EGG_BALLAD_MARIMBA                EQU $44 ; Play at egg with instruments #3-5
DEF MUSIC_EGG_BALLAD_TRIANGLE               EQU $45 ; Play at egg with instruments #3-6
DEF MUSIC_EGG_BALLAD_ORGAN                  EQU $46 ; Play at egg with instruments #3-7
DEF MUSIC_EGG_BALLAD_ALL                    EQU $47 ; Play at egg with instruments #3-8
DEF MUSIC_GHOST_HOUSE                       EQU $48
DEF MUSIC_ACTIVE_POWER_UP                   EQU $49
DEF MUSIC_LEARN_BALLAD                      EQU $4A
DEF MUSIC_CATFISHS_MAW                      EQU $4B
DEF MUSIC_OPEN_ANGLERS_TUNNEL               EQU $4C
DEF MUSIC_MARIN_ON_BEACH                    EQU $4D
DEF MUSIC_MARIN_BEACH_TALK                  EQU $4E
DEF MUSIC_MARIN_UNUSED                      EQU $4F
DEF MUSIC_MINIBOSS                          EQU $50
DEF MUSIC_KANALET_CASTLE_COPY               EQU $51
DEF MUSIC_TAIL_CAVE_COPY                    EQU $52
DEF MUSIC_DREAM_SHRINE_DREAM                EQU $53
DEF MUSIC_EAGLE_BOSS_TRANSITION             EQU $54
DEF MUSIC_ROOSTER_REVIVAL                   EQU $55
DEF MUSIC_L2_SWORD                          EQU $56
DEF MUSIC_HENHOUSE                          EQU $57
DEF MUSIC_FACE_SHRINE                       EQU $58
DEF MUSIC_WIND_FISH                         EQU $59
DEF MUSIC_TURTLE_ROCK                       EQU $5A
DEF MUSIC_EAGLES_TOWER                      EQU $5B
DEF MUSIC_EAGLE_BOSS_LOOP                   EQU $5C ; Changes to $54 after dialog
DEF MUSIC_FINAL_BOSS_INTRO                  EQU $5D
DEF MUSIC_BOSS_DEFEAT                       EQU $5E
DEF MUSIC_FINAL_BOSS_DEFEAT                 EQU $5F
DEF MUSIC_FILE_SELECT_ZELDA                 EQU $60 ; Enter file name ZELDA
DEF MUSIC_COLOR_DUNGEON                     EQU $61
DEF MUSIC_SILENCE                           EQU $FF ; Silences the music. Seems to only work cleanly for certain tracks. Needs looking into

; Values for hJingle
DEF JINGLE_NONE                             EQU $00
DEF JINGLE_TREASURE_FOUND                   EQU $01
DEF JINGLE_PUZZLE_SOLVED                    EQU $02
DEF JINGLE_ENEMY_HIT                        EQU $03
DEF JINGLE_CHARGING_SWORD                   EQU $04
DEF JINGLE_POWDER                           EQU $05
DEF JINGLE_GENIE_APPEAR                     EQU $06 ; Mad Batter
DEF JINGLE_SWORD_POKING                     EQU $07
DEF JINGLE_FALL_DOWN                        EQU $08 ; Jumping from ledge, Slime Eye
DEF JINGLE_BUMP                             EQU $09 ; Some things hitting the ground, walls or Link's shield
DEF JINGLE_MOVE_SELECTION                   EQU $0A ; File Select, Map Screen
DEF JINGLE_STRONG_BUMP                      EQU $0B ; Spike bar, Boots wall bonk, Slime Eye, Blaino
DEF JINGLE_REVOLVING_DOOR                   EQU $0C
DEF JINGLE_FEATHER_JUMP                     EQU $0D
DEF JINGLE_WATER_SPLASH                     EQU $0E
DEF JINGLE_SWIM                             EQU $0F
DEF JINGLE_UNKNOWN_10                       EQU $10 ; Produces no sound, unused?
DEF JINGLE_OPEN_INVENTORY                   EQU $11
DEF JINGLE_CLOSE_INVENTORY                  EQU $12
DEF JINGLE_VALIDATE                         EQU $13 ; File Select, Map, Angler's Tunnel platforms
DEF JINGLE_GOT_HEART                        EQU $14 ; Also Rupee
DEF JINGLE_DIALOG_BREAK                     EQU $15
DEF JINGLE_SHIELD_TING                      EQU $16
DEF JINGLE_GOT_POWER_UP                     EQU $17
DEF JINGLE_ITEM_FALLING                     EQU $18
DEF JINGLE_NEW_HEART                        EQU $19
DEF JINGLE_FAIRY_HEAL                       EQU $1A
DEF JINGLE_DUNGEON_WARP_APPEAR              EQU $1B
DEF JINGLE_DUNGEON_WARP                     EQU $1C
DEF JINGLE_WRONG_ANSWER                     EQU $1D
DEF JINGLE_FOREST_LOST                      EQU $1E
DEF JINGLE_GENIE_DISAPPEAR                  EQU $1F
DEF JINGLE_BOUNCE                           EQU $20 ; Roller, Genie bottle, Slime Eye, Boulder, Shadow Zol
DEF JINGLE_SEAGULL                          EQU $21
DEF JINGLE_TARIN_BEE_BUZZ                   EQU $22
DEF JINGLE_DUNGEON_OPENED                   EQU $23
DEF JINGLE_JUMP                             EQU $24
DEF JINGLE_OVERWORLD_WARP_HOLE              EQU $25
DEF JINGLE_DISAPPEAR                        EQU $26 ; Great Fairy, ending Owl
DEF JINGLE_WALRUS                           EQU $27
DEF JINGLE_STALFOS_COLLAPSE                 EQU $28
DEF JINGLE_SLIME_EEL_PULL                   EQU $29
DEF JINGLE_DODONGO_EAT_BOMB                 EQU $2A
DEF JINGLE_INSTRUMENT_WARP                  EQU $2B
DEF JINGLE_MANBO_WARP                       EQU $2C
DEF JINGLE_GHOST_PRESENCE                   EQU $2D
DEF JINGLE_EAGLES_TOWER_ROTATE              EQU $2E
DEF JINGLE_POOF                             EQU $2F ; Pokey, Face Shrine opening, D8 Hole Filler
DEF JINGLE_EAGLE_SKID                       EQU $30
DEF JINGLE_GRIM_CREEPER_BATS                EQU $31
DEF JINGLE_HOT_HEAD_SPLASH                  EQU $32
DEF JINGLE_LINK_DAZED                       EQU $33 ; Used when hit by Blaino's fast wind up punch
DEF JINGLE_INSTRUMENTS_APPEAR               EQU $34 ; Wind Fish cutscene
DEF JINGLE_SHADOW_MOVE                      EQU $35
DEF JINGLE_SHADOW_AGAHNIM_DEFEAT            EQU $36
DEF JINGLE_SHADOW_ZOL_HURT                  EQU $37
DEF JINGLE_SHADOW_MOLDORM_ROAM              EQU $38
DEF JINGLE_GANON_TRIDENT_APPEAR             EQU $39
DEF JINGLE_UNKNOWN_3A                       EQU $3A ; Unused?
DEF JINGLE_SWORD_BEAM                       EQU $3B ; Mad Batter flying away
DEF JINGLE_PAIRODD_TELEPORT                 EQU $3C ; Key Cavern enemy
DEF JINGLE_DETHI_HANDS                      EQU $3D
DEF JINGLE_URCHIN_PUSH                      EQU $3E ; D8 Hole Filler
DEF JINGLE_FLYING_TILE                      EQU $3F
DEF JINGLE_FACADE_HOLE                      EQU $40 ; Holes spawned by D6 boss
DEF JINGLE_UNKNOWN_41                       EQU $41 ; Unused?

; Values for hWaveSfx
DEF WAVE_SFX_NONE                           EQU $00
DEF WAVE_SFX_SEASHELL                       EQU $01
DEF WAVE_SFX_LIFT_UP                        EQU $02
DEF WAVE_SFX_LINK_HURT                      EQU $03
DEF WAVE_SFX_LOW_HEARTS                     EQU $04
DEF WAVE_SFX_RUPEE                          EQU $05
DEF WAVE_SFX_HEART_PICKED_UP                EQU $06
DEF WAVE_SFX_BOSS_HURT                      EQU $07
DEF WAVE_SFX_LINK_DIES                      EQU $08
DEF WAVE_SFX_OCARINA_BALLAD                 EQU $09
DEF WAVE_SFX_OCARINA_FROG                   EQU $0A
DEF WAVE_SFX_OCARINA_MAMBO                  EQU $0B
DEF WAVE_SFX_LINK_FALL                      EQU $0C
DEF WAVE_SFX_ANGLER_DASH                    EQU $0D ; D4 Boss attack
DEF WAVE_SFX_FLOOR_SWITCH                   EQU $0E ; Also when stomping Goombas
DEF WAVE_SFX_TEXT_PRINT                     EQU $0F
DEF WAVE_SFX_BOSS_DEATH_CRY                 EQU $10
DEF WAVE_SFX_POWER_HIT                      EQU $11 ; Piece of Power, Red Clothes
DEF WAVE_SFX_UNKNOWN_12                     EQU $12 ; Some relation to power hit
DEF WAVE_SFX_CUCCO_HURT                     EQU $13
DEF WAVE_SFX_MONKEY                         EQU $14
DEF WAVE_SFX_OCARINA_NOSONG                 EQU $15 ; Off-key notes for when you have no songs available
DEF WAVE_SFX_BOSS_GROWL                     EQU $16
DEF WAVE_SFX_WIND_FISH_CRY                  EQU $17
DEF WAVE_SFX_CHAIN_CHOMP                    EQU $18
DEF WAVE_SFX_OWL_HOOT                       EQU $19
DEF WAVE_SFX_ROLLING_SPIKE_BAR              EQU $1A ; D1 Miniboss
DEF WAVE_SFX_COMPASS                        EQU $1B
DEF WAVE_SFX_ROVER_CRY                      EQU $1C ; D6 Miniboss
DEF WAVE_SFX_UNKNOWN_1D                     EQU $1D ; Unused?
DEF WAVE_SFX_L2_SWORD_APPEAR                EQU $1E
DEF WAVE_SFX_WIND_FISH_MORPH                EQU $1F
DEF WAVE_SFX_FLYING_WITH_SPOUT              EQU $20 ; Wind Fish cutscene
DEF WAVE_SFX_SHADOW_DISPERSE                EQU $21
DEF WAVE_SFX_AGAHNIM_CHARGE                 EQU $22
DEF WAVE_SFX_SHADOW_CHANGE_FORM             EQU $23

; Values for hNoiseSfx
DEF NOISE_SFX_NONE                          EQU $00
DEF NOISE_SFX_UNKNOWN_1                     EQU $01
DEF NOISE_SFX_SWORD_SWING_A                 EQU $02
DEF NOISE_SFX_SPIN_ATTACK                   EQU $03
DEF NOISE_SFX_DOOR_UNLOCKED                 EQU $04 ; Also chests
DEF NOISE_SFX_CUT_GRASS                     EQU $05
DEF NOISE_SFX_STAIRS                        EQU $06
DEF NOISE_SFX_FOOTSTEP                      EQU $07 ; Land from air, run with boots
DEF NOISE_SFX_BEAMOS_LASER                  EQU $08 ; Deflecting Shadow Agahnim's ball
DEF NOISE_SFX_POT_SMASHED                   EQU $09
DEF NOISE_SFX_WHOOSH                        EQU $0A ; Blade Trap, Arrow shot, Blaino's jabs
DEF NOISE_SFX_HOOKSHOT                      EQU $0B
DEF NOISE_SFX_EXPLOSION                     EQU $0C ; Bombs, intro lightning, big Slime Eye hitting ground, Mad Batter
DEF NOISE_SFX_MAGIC_ROD                     EQU $0D ; Vire
DEF NOISE_SFX_SHOVEL_DIG                    EQU $0E
DEF NOISE_SFX_SEA_WAVES                     EQU $0F
DEF NOISE_SFX_DOOR_CLOSED                   EQU $10
DEF NOISE_SFX_RUMBLE                        EQU $11 ; Block push, Walrus falls
DEF NOISE_SFX_BURSTING_FLAME                EQU $12 ; Flame shooter, burning enemy
DEF NOISE_SFX_ENEMY_DESTROYED               EQU $13
DEF NOISE_SFX_SWORD_SWING_B                 EQU $14
DEF NOISE_SFX_SWORD_SWING_C                 EQU $15
DEF NOISE_SFX_DRAW_SHIELD                   EQU $16
DEF NOISE_SFX_CLINK                         EQU $17 ; Falling key, poking bombable wall
DEF NOISE_SFX_SWORD_SWING_D                 EQU $18
DEF NOISE_SFX_PING                          EQU $19 ; Title logo, Ganon's trident
DEF NOISE_SFX_BOSS_EXPLOSION                EQU $1A
DEF NOISE_SFX_MOLDORM_ROAM                  EQU $1B ; D1 Boss
DEF NOISE_SFX_BUZZ_BLOB_ELECTROCUTE         EQU $1C
DEF NOISE_SFX_OPEN_D4_D7                    EQU $1D ; Angler's Tunnel, Eagle's Tower
DEF NOISE_SFX_UNKNOWN_1E                    EQU $1E ; Unused?
DEF NOISE_SFX_BLACK_HOLE_ACTIVE             EQU $1F
DEF NOISE_SFX_TRENDY_CRANE                  EQU $20
DEF NOISE_SFX_SILENT                        EQU $21 ; Trendy Crane
DEF NOISE_SFX_EVIL_EAGLE_FLY                EQU $22
DEF NOISE_SFX_LANMOLA_BURROW                EQU $23
DEF NOISE_SFX_WALRUS_SPLASH                 EQU $24
DEF NOISE_SFX_D7_PILLAR_COLLAPSE            EQU $25
DEF NOISE_SFX_ELECTRIC_BEAM                 EQU $26 ; Shopkeeper, Mad Batter
DEF NOISE_SFX_WEAPON_SWING                  EQU $27 ; Master Stalfos, Ganon's trident throw
DEF NOISE_SFX_GENIE_FIREBALL                EQU $28 ; Also Ganon's bats
DEF NOISE_SFX_BREAK                         EQU $29 ; Armos Knight, Elephant statues, Hot Head
DEF NOISE_SFX_OPEN_KEY_CAVERN               EQU $2A
DEF NOISE_SFX_RUMBLE2                       EQU $2B ; Floor crumble, instrument appearing for egg ballad
DEF NOISE_SFX_INSTRUMENT_WARP               EQU $2C
DEF NOISE_SFX_BOOMERANG                     EQU $2D
DEF NOISE_SFX_OPEN_FACE_SHRINE              EQU $2E
DEF NOISE_SFX_CUEBALL_SPLASH                EQU $2F
DEF NOISE_SFX_EAGLE_LANDING                 EQU $30
DEF NOISE_SFX_EAGLE_LIFT_UP                 EQU $31
DEF NOISE_SFX_EAGLE_FEATHERS                EQU $32
DEF NOISE_SFX_L2_SWORD_SPARKS               EQU $33 ; During cutscene
DEF NOISE_SFX_WATERSPOUT                    EQU $34 ; Wind Fish cutscene
DEF NOISE_SFX_ISLAND_DISAPPEAR              EQU $35 ; Ending cutscene
DEF NOISE_SFX_AGAHNIM_FAKE_BALL_EXPLODE     EQU $36
DEF NOISE_SFX_SHADOW_DISPERSE               EQU $37
DEF NOISE_SFX_AGAHNIM_BALL                  EQU $38
DEF NOISE_SFX_AGAHNIM_FAKE_BALL             EQU $39
DEF NOISE_SFX_GANON_FLYING_TRIDENT          EQU $3A
DEF NOISE_SFX_KIRBY_INHALE                  EQU $3B
DEF NOISE_SFX_UNKNOWN_3C                    EQU $3C ; Unused?
DEF NOISE_SFX_FINAL_BOSS_EXPLOSION          EQU $3D
DEF NOISE_SFX_SLIME_EEL_FLOOR_BREAK         EQU $3E
DEF NOISE_SFX_MINIBOSS_FLEE                 EQU $3F ; Master Stalfos, Grim Creeper
DEF NOISE_SFX_PHOTO                         EQU $40 ; Photographer taking photo

; values for wOcarinaSongFlags
DEF FROGS_SONG_OF_THE_SOUL_FLAG       EQU 1
DEF MANBO_MAMBO_FLAG                  EQU 2
DEF BALLAD_OF_THE_WIND_FISH_FLAG      EQU 4
DEF FROGS_SONG_OF_THE_SOUL_FLAG_BIT   EQU 0
DEF MANBO_MAMBO_FLAG_BIT              EQU 1
DEF BALLAD_OF_THE_WIND_FISH_FLAG_BIT  EQU 2

DEF LOW_HEALTH_SFX_PAUSE              EQU $30 ; pause beetween low health SFX beeps
DEF MUSIC_FADE_OUT_TIMER_MAX          EQU $38 ; reset value for hMusicFadeOutTimer
