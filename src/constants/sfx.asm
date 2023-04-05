; Constants for music tracks and sound effects

; Values for wMusicTrackToPlay

MUSIC_NONE                              equ $00 ; Unclear usage, needs looking into
MUSIC_TITLE_SCREEN                      equ $01 ; Plays after watching title cutscene
MUSIC_MINIGAME                          equ $02 ; Trendy Game, Fishing, Camera Shop
MUSIC_GAME_OVER                         equ $03
MUSIC_MABE_VILLAGE                      equ $04
MUSIC_OVERWORLD                         equ $05
MUSIC_TAL_TAL_RANGE                     equ $06
MUSIC_SHOP                              equ $07 ; Town Shop, Witch's Hut
MUSIC_RAFT_RIDE_RAPIDS                  equ $08
MUSIC_MYSTERIOUS_FOREST                 equ $09
MUSIC_INSIDE_BUILDING                   equ $0A ; Most residences, Village Library, Seashell Mansion
MUSIC_ANIMAL_VILLAGE                    equ $0B
MUSIC_FAIRY_FOUNTAIN                    equ $0C
MUSIC_TITLE_SCREEN_NO_INTRO             equ $0D ; If title cutscene is skipped with Start
MUSIC_BOWWOW_KIDNAPPED                  equ $0E
MUSIC_OBTAIN_SWORD                      equ $0F
MUSIC_OBTAIN_ITEM                       equ $10
MUSIC_FILE_SELECT                       equ $11
MUSIC_EGG_MAZE                          equ $12
MUSIC_KANALET_CASTLE                    equ $13
MUSIC_TAIL_CAVE                         equ $14
MUSIC_BOTTLE_GROTTO                     equ $15
MUSIC_KEY_CAVERN                        equ $16
MUSIC_ANGLERS_TUNNEL                    equ $17
MUSIC_AFTER_BOSS                        equ $18
MUSIC_BOSS                              equ $19
MUSIC_TITLE_CUTSCENE                    equ $1A
MUSIC_OBTAIN_INSTRUMENT                 equ $1B
MUSIC_INTRO_WAKE_UP                     equ $1C ; Marin & Tarin's House when starting a new game
MUSIC_OVERWORLD_SWORDLESS               equ $1D
MUSIC_DREAM_SHRINE_SLEEP                equ $1E
MUSIC_SOUTHERN_SHRINE                   equ $1F
MUSIC_INSTRUMENT_FULL_MOON_CELLO        equ $20 ; After obtaining
MUSIC_2D_UNDERGROUND                    equ $21
MUSIC_OWL                               equ $22
MUSIC_FINAL_BOSS                        equ $23
MUSIC_DREAM_SHRINE_BED                  equ $24
MUSIC_HEART_CONTAINER                   equ $25
MUSIC_CAVE                              equ $26
MUSIC_OBTAIN_POWERUP                    equ $27
MUSIC_INSTRUMENT_CONCH_HORN             equ $28 ;\ 
MUSIC_INSTRUMENT_SEA_LILYS_BELL         equ $29 ; \ 
MUSIC_INSTRUMENT_SURF_HARP              equ $2A ;  \ 
MUSIC_INSTRUMENT_WIND_MARIMBA           equ $2B ;   After obtaining
MUSIC_INSTRUMENT_CORAL_TRIANGLE         equ $2C ;  /
MUSIC_INSTRUMENT_ORGAN_OF_EVENING_CALM  equ $2D ; /
MUSIC_INSTRUMENT_THUNDER_DRUM           equ $2E ;/
MUSIC_MARIN_SING                        equ $2F
MUSIC_MANBOS_MAMBO                      equ $30
MUSIC_OVERWORLD_INTRO                   equ $31 ; After obtaining sword
MUSIC_MR_WRITE_HOUSE                    equ $32
MUSIC_ULRIRA                            equ $33 ; Ulrira's House, Phone Booths
MUSIC_TARIN_BEES                        equ $34
MUSIC_MAMU_FROG_SONG                    equ $35
MUSIC_MONKEYS_BUILDING_BRIDGE           equ $36
MUSIC_CHRISTINE_HOUSE                   equ $37
MUSIC_TOTAKA_UNUSED                     equ $38
MUSIC_TURTLE_ROCK_ENTRANCE_BOSS         equ $39
MUSIC_FISHERMAN_UNDER_BRIDGE            equ $3A
MUSIC_OBTAIN_ITEM_UNUSED                equ $3B
MUSIC_FILE_SELECT_TOTAKA                equ $3C ; Accessible only in German DX and Japanese versions. Enter file name MOYSE/とたけけ
MUSIC_ENDING                            equ $3D
MUSIC_MOBLIN_HIDEOUT                    equ $3E
MUSIC_ISLAND_DISAPPEAR                  equ $3F
MUSIC_RICHARD_HOUSE                     equ $40
MUSIC_EGG_BALLAD_DEFAULT                equ $41 ; Play at egg without instrument #3
MUSIC_EGG_BALLAD_BELL                   equ $42 ; Play at egg with instrument #3
MUSIC_EGG_BALLAD_HARP                   equ $43 ; Play at egg with instruments #3-4
MUSIC_EGG_BALLAD_MARIMBA                equ $44 ; Play at egg with instruments #3-5
MUSIC_EGG_BALLAD_TRIANGLE               equ $45 ; Play at egg with instruments #3-6
MUSIC_EGG_BALLAD_ORGAN                  equ $46 ; Play at egg with instruments #3-7
MUSIC_EGG_BALLAD_ALL                    equ $47 ; Play at egg with instruments #3-8
MUSIC_GHOST_HOUSE                       equ $48
MUSIC_ACTIVE_POWER_UP                   equ $49
MUSIC_LEARN_BALLAD                      equ $4A
MUSIC_CATFISHS_MAW                      equ $4B
MUSIC_OPEN_ANGLERS_TUNNEL               equ $4C
MUSIC_MARIN_ON_BEACH                    equ $4D
MUSIC_MARIN_BEACH_TALK                  equ $4E
MUSIC_MARIN_UNUSED                      equ $4F
MUSIC_MINIBOSS                          equ $50
MUSIC_KANALET_CASTLE_COPY               equ $51
MUSIC_TAIL_CAVE_COPY                    equ $52
MUSIC_DREAM_SHRINE_DREAM                equ $53
MUSIC_EAGLE_BOSS_TRANSITION             equ $54
MUSIC_ROOSTER_REVIVAL                   equ $55
MUSIC_L2_SWORD                          equ $56
MUSIC_HENHOUSE                          equ $57
MUSIC_FACE_SHRINE                       equ $58
MUSIC_WIND_FISH                         equ $59
MUSIC_TURTLE_ROCK                       equ $5A
MUSIC_EAGLES_TOWER                      equ $5B
MUSIC_EAGLE_BOSS_LOOP                   equ $5C ; Changes to $54 after dialog
MUSIC_FINAL_BOSS_INTRO                  equ $5D
MUSIC_BOSS_DEFEAT                       equ $5E
MUSIC_FINAL_BOSS_DEFEAT                 equ $5F
MUSIC_FILE_SELECT_ZELDA                 equ $60 ; Enter file name ZELDA
MUSIC_COLOR_DUNGEON                     equ $61
MUSIC_SILENCE                           equ $FF ; Silences the music. Seems to only work cleanly for certain tracks. Needs looking into

; Values for hJingle
JINGLE_NONE                             equ $00
JINGLE_TREASURE_FOUND                   equ $01
JINGLE_PUZZLE_SOLVED                    equ $02
JINGLE_ENEMY_HIT                        equ $03
JINGLE_CHARGING_SWORD                   equ $04
JINGLE_POWDER                           equ $05
JINGLE_GENIE_APPEAR                     equ $06 ; Mad Batter
JINGLE_SWORD_POKING                     equ $07
JINGLE_FALL_DOWN                        equ $08 ; Jumping from ledge, Slime Eye
JINGLE_BUMP                             equ $09 ; Some things hitting the ground, walls or Link's shield
JINGLE_MOVE_SELECTION                   equ $0A ; File Select, Map Screen
JINGLE_STRONG_BUMP                      equ $0B ; Spike bar, Boots wall bonk, Slime Eye, Blaino
JINGLE_REVOLVING_DOOR                   equ $0C
JINGLE_FEATHER_JUMP                     equ $0D
JINGLE_WATER_SPLASH                     equ $0E
JINGLE_SWIM                             equ $0F
JINGLE_UNKNOWN_10                       equ $10 ; Produces no sound, unused?
JINGLE_OPEN_INVENTORY                   equ $11
JINGLE_CLOSE_INVENTORY                  equ $12
JINGLE_VALIDATE                         equ $13 ; File Select, Map, Angler's Tunnel platforms
JINGLE_GOT_HEART                        equ $14 ; Also Rupee
JINGLE_DIALOG_BREAK                     equ $15
JINGLE_SHIELD_TING                      equ $16
JINGLE_GOT_POWER_UP                     equ $17
JINGLE_ITEM_FALLING                     equ $18
JINGLE_NEW_HEART                        equ $19
JINGLE_FAIRY_HEAL                       equ $1A
JINGLE_DUNGEON_WARP_APPEAR              equ $1B
JINGLE_DUNGEON_WARP                     equ $1C
JINGLE_WRONG_ANSWER                     equ $1D
JINGLE_FOREST_LOST                      equ $1E
JINGLE_GENIE_DISAPPEAR                  equ $1F
JINGLE_BOUNCE                           equ $20 ; Roller, Genie bottle, Slime Eye, Boulder, Shadow Zol
JINGLE_SEAGULL                          equ $21
JINGLE_TARIN_BEE_BUZZ                   equ $22
JINGLE_DUNGEON_OPENED                   equ $23
JINGLE_JUMP                             equ $24
JINGLE_OVERWORLD_WARP_HOLE              equ $25
JINGLE_DISAPPEAR                        equ $26 ; Great Fairy, ending Owl
JINGLE_WALRUS                           equ $27
JINGLE_STALFOS_COLLAPSE                 equ $28
JINGLE_SLIME_EEL_PULL                   equ $29
JINGLE_DODONGO_EAT_BOMB                 equ $2A
JINGLE_INSTRUMENT_WARP                  equ $2B
JINGLE_MANBO_WARP                       equ $2C
JINGLE_GHOST_PRESENCE                   equ $2D
JINGLE_EAGLES_TOWER_ROTATE              equ $2E
JINGLE_POOF                             equ $2F ; Pokey, Face Shrine opening, D8 Hole Filler
JINGLE_EAGLE_SKID                       equ $30
JINGLE_GRIM_CREEPER_BATS                equ $31
JINGLE_HOT_HEAD_SPLASH                  equ $32
JINGLE_LINK_DAZED                       equ $33 ; Used when hit by Blaino's fast wind up punch
JINGLE_INSTRUMENTS_APPEAR               equ $34 ; Wind Fish cutscene
JINGLE_SHADOW_MOVE                      equ $35
JINGLE_SHADOW_AGAHNIM_DEFEAT            equ $36
JINGLE_SHADOW_ZOL_HURT                  equ $37
JINGLE_SHADOW_MOLDORM_ROAM              equ $38
JINGLE_GANON_TRIDENT_APPEAR             equ $39
JINGLE_UNKNOWN_3A                       equ $3A ; Unused?
JINGLE_SWORD_BEAM                       equ $3B ; Mad Batter flying away
JINGLE_PAIRODD_TELEPORT                 equ $3C ; Key Cavern enemy
JINGLE_DETHI_HANDS                      equ $3D
JINGLE_URCHIN_PUSH                      equ $3E ; D8 Hole Filler
JINGLE_FLYING_TILE                      equ $3F
JINGLE_FACADE_HOLE                      equ $40 ; Holes spawned by D6 boss
JINGLE_UNKNOWN_41                       equ $41 ; Unused?

; Values for hWaveSfx
WAVE_SFX_NONE                           equ $00
WAVE_SFX_SEASHELL                       equ $01
WAVE_SFX_LIFT_UP                        equ $02
WAVE_SFX_LINK_HURT                      equ $03
WAVE_SFX_LOW_HEARTS                     equ $04
WAVE_SFX_RUPEE                          equ $05
WAVE_SFX_HEART_PICKED_UP                equ $06
WAVE_SFX_BOSS_HURT                      equ $07
WAVE_SFX_LINK_DIES                      equ $08
WAVE_SFX_OCARINA_BALLAD                 equ $09
WAVE_SFX_OCARINA_FROG                   equ $0A
WAVE_SFX_OCARINA_MAMBO                  equ $0B
WAVE_SFX_LINK_FALL                      equ $0C
WAVE_SFX_ANGLER_DASH                    equ $0D ; D4 Boss attack
WAVE_SFX_FLOOR_SWITCH                   equ $0E ; Also when stomping Goombas
WAVE_SFX_TEXT_PRINT                     equ $0F
WAVE_SFX_BOSS_DEATH_CRY                 equ $10
WAVE_SFX_POWER_HIT                      equ $11 ; Piece of Power, Red Clothes
WAVE_SFX_UNKNOWN_12                     equ $12 ; Some relation to power hit
WAVE_SFX_CUCCO_HURT                     equ $13
WAVE_SFX_MONKEY                         equ $14
WAVE_SFX_OCARINA_NOSONG                 equ $15	; Off-key notes for when you have no songs available
WAVE_SFX_BOSS_GROWL                     equ $16
WAVE_SFX_WIND_FISH_CRY                  equ $17
WAVE_SFX_CHAIN_CHOMP                    equ $18
WAVE_SFX_OWL_HOOT                       equ $19
WAVE_SFX_ROLLING_SPIKE_BAR              equ $1A ; D1 Miniboss
WAVE_SFX_COMPASS                        equ $1B
WAVE_SFX_ROVER_CRY                      equ $1C ; D6 Miniboss
WAVE_SFX_UNKNOWN_1D                     equ $1D ; Unused?
WAVE_SFX_L2_SWORD_APPEAR                equ $1E
WAVE_SFX_WIND_FISH_MORPH                equ $1F
WAVE_SFX_FLYING_WITH_SPOUT              equ $20 ; Wind Fish cutscene
WAVE_SFX_SHADOW_DISPERSE                equ $21
WAVE_SFX_AGAHNIM_CHARGE                 equ $22
WAVE_SFX_SHADOW_CHANGE_FORM             equ $23

; Values for hNoiseSfx
NOISE_SFX_NONE                          equ $00
NOISE_SFX_UNKNOWN_1                     equ $01
NOISE_SFX_SWORD_SWING_A                 equ $02
NOISE_SFX_SPIN_ATTACK                   equ $03
NOISE_SFX_DOOR_UNLOCKED                 equ $04 ; Also chests
NOISE_SFX_CUT_GRASS                     equ $05
NOISE_SFX_STAIRS                        equ $06
NOISE_SFX_FOOTSTEP                      equ $07 ; Land from air, run with boots
NOISE_SFX_BEAMOS_LASER                  equ $08 ; Deflecting Shadow Agahnim's ball
NOISE_SFX_POT_SMASHED                   equ $09
NOISE_SFX_WHOOSH                        equ $0A ; Blade Trap, Arrow shot, Blaino's jabs
NOISE_SFX_HOOKSHOT                      equ $0B
NOISE_SFX_EXPLOSION                     equ $0C ; Bombs, intro lightning, big Slime Eye hitting ground, Mad Batter
NOISE_SFX_MAGIC_ROD                     equ $0D ; Vire
NOISE_SFX_SHOVEL_DIG                    equ $0E
NOISE_SFX_SEA_WAVES                     equ $0F
NOISE_SFX_DOOR_CLOSED                   equ $10
NOISE_SFX_RUMBLE                        equ $11 ; Block push, Walrus falls
NOISE_SFX_BURSTING_FLAME                equ $12 ; Flame shooter, burning enemy
NOISE_SFX_ENEMY_DESTROYED               equ $13
NOISE_SFX_SWORD_SWING_B                 equ $14
NOISE_SFX_SWORD_SWING_C                 equ $15
NOISE_SFX_DRAW_SHIELD                   equ $16
NOISE_SFX_CLINK                         equ $17 ; Falling key, poking bombable wall
NOISE_SFX_SWORD_SWING_D                 equ $18
NOISE_SFX_PING                          equ $19 ; Title logo, Ganon's trident
NOISE_SFX_BOSS_EXPLOSION                equ $1A
NOISE_SFX_MOLDORM_ROAM                  equ $1B ; D1 Boss
NOISE_SFX_BUZZ_BLOB_ELECTROCUTE         equ $1C
NOISE_SFX_OPEN_D4_D7                    equ $1D ; Angler's Tunnel, Eagle's Tower
NOISE_SFX_UNKNOWN_1E                    equ $1E ; Unused?
NOISE_SFX_BLACK_HOLE_ACTIVE             equ $1F
NOISE_SFX_TRENDY_CRANE                  equ $20
NOISE_SFX_SILENT                        equ $21 ; Trendy Crane
NOISE_SFX_EVIL_EAGLE_FLY                equ $22
NOISE_SFX_LANMOLA_BURROW                equ $23
NOISE_SFX_WALRUS_SPLASH                 equ $24
NOISE_SFX_D7_PILLAR_COLLAPSE            equ $25
NOISE_SFX_ELECTRIC_BEAM                 equ $26 ; Shopkeeper, Mad Batter
NOISE_SFX_WEAPON_SWING                  equ $27 ; Master Stalfos, Ganon's trident throw
NOISE_SFX_GENIE_FIREBALL                equ $28 ; Also Ganon's bats
NOISE_SFX_BREAK                         equ $29 ; Armos Knight, Elephant statues, Hot Head
NOISE_SFX_OPEN_KEY_CAVERN               equ $2A
NOISE_SFX_RUMBLE2                       equ $2B ; Floor crumble, instrument appearing for egg ballad
NOISE_SFX_INSTRUMENT_WARP               equ $2C
NOISE_SFX_BOOMERANG                     equ $2D
NOISE_SFX_OPEN_FACE_SHRINE              equ $2E
NOISE_SFX_CUEBALL_SPLASH                equ $2F
NOISE_SFX_EAGLE_LANDING                 equ $30
NOISE_SFX_EAGLE_LIFT_UP                 equ $31
NOISE_SFX_EAGLE_FEATHERS                equ $32
NOISE_SFX_L2_SWORD_SPARKS               equ $33 ; During cutscene
NOISE_SFX_WATERSPOUT                    equ $34 ; Wind Fish cutscene
NOISE_SFX_ISLAND_DISAPPEAR              equ $35 ; Ending cutscene
NOISE_SFX_AGAHNIM_FAKE_BALL_EXPLODE     equ $36
NOISE_SFX_SHADOW_DISPERSE               equ $37
NOISE_SFX_AGAHNIM_BALL                  equ $38
NOISE_SFX_AGAHNIM_FAKE_BALL             equ $39
NOISE_SFX_GANON_FLYING_TRIDENT          equ $3A
NOISE_SFX_KIRBY_INHALE                  equ $3B
NOISE_SFX_UNKNOWN_3C                    equ $3C ; Unused?
NOISE_SFX_FINAL_BOSS_EXPLOSION          equ $3D
NOISE_SFX_SLIME_EEL_FLOOR_BREAK         equ $3E
NOISE_SFX_MINIBOSS_FLEE                 equ $3F ; Master Stalfos, Grim Creeper
NOISE_SFX_PHOTO                         equ $40 ; Photographer taking photo

; values for wOcarinaSongFlags
FROGS_SONG_OF_THE_SOUL_FLAG       equ 1
MANBO_MAMBO_FLAG                  equ 2
BALLAD_OF_THE_WIND_FISH_FLAG      equ 4
FROGS_SONG_OF_THE_SOUL_FLAG_BIT   equ 0
MANBO_MAMBO_FLAG_BIT              equ 1
BALLAD_OF_THE_WIND_FISH_FLAG_BIT  equ 2

LOW_HEALTH_SFX_PAUSE              equ $30 ; pause beetween low health SFX beeps
MUSIC_FADE_OUT_TIMER_MAX          equ $38 ; reset value for hMusicFadeOutTimer
