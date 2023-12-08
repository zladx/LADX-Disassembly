; Constants for music tracks and sound effects

; Values for wMusicTrackToPlay

def MUSIC_NONE                              equ $00 ; Unclear usage, needs looking into
def MUSIC_TITLE_SCREEN                      equ $01 ; Plays after watching title cutscene
def MUSIC_MINIGAME                          equ $02 ; Trendy Game, Fishing, Camera Shop
def MUSIC_GAME_OVER                         equ $03
def MUSIC_MABE_VILLAGE                      equ $04
def MUSIC_OVERWORLD                         equ $05
def MUSIC_TAL_TAL_RANGE                     equ $06
def MUSIC_SHOP                              equ $07 ; Town Shop, Witch's Hut
def MUSIC_RAFT_RIDE_RAPIDS                  equ $08
def MUSIC_MYSTERIOUS_FOREST                 equ $09
def MUSIC_INSIDE_BUILDING                   equ $0A ; Most residences, Village Library, Seashell Mansion
def MUSIC_ANIMAL_VILLAGE                    equ $0B
def MUSIC_FAIRY_FOUNTAIN                    equ $0C
def MUSIC_TITLE_SCREEN_NO_INTRO             equ $0D ; If title cutscene is skipped with Start
def MUSIC_BOWWOW_KIDNAPPED                  equ $0E
def MUSIC_OBTAIN_SWORD                      equ $0F
def MUSIC_OBTAIN_ITEM                       equ $10
def MUSIC_FILE_SELECT                       equ $11
def MUSIC_EGG_MAZE                          equ $12
def MUSIC_KANALET_CASTLE                    equ $13
def MUSIC_TAIL_CAVE                         equ $14
def MUSIC_BOTTLE_GROTTO                     equ $15
def MUSIC_KEY_CAVERN                        equ $16
def MUSIC_ANGLERS_TUNNEL                    equ $17
def MUSIC_AFTER_BOSS                        equ $18
def MUSIC_BOSS                              equ $19
def MUSIC_TITLE_CUTSCENE                    equ $1A
def MUSIC_OBTAIN_INSTRUMENT                 equ $1B
def MUSIC_INTRO_WAKE_UP                     equ $1C ; Marin & Tarin's House when starting a new game
def MUSIC_OVERWORLD_SWORDLESS               equ $1D
def MUSIC_DREAM_SHRINE_SLEEP                equ $1E
def MUSIC_SOUTHERN_SHRINE                   equ $1F
def MUSIC_INSTRUMENT_FULL_MOON_CELLO        equ $20 ; After obtaining
def MUSIC_2D_UNDERGROUND                    equ $21
def MUSIC_OWL                               equ $22
def MUSIC_FINAL_BOSS                        equ $23
def MUSIC_DREAM_SHRINE_BED                  equ $24
def MUSIC_HEART_CONTAINER                   equ $25
def MUSIC_CAVE                              equ $26
def MUSIC_OBTAIN_POWERUP                    equ $27
def MUSIC_INSTRUMENT_CONCH_HORN             equ $28 ;\
def MUSIC_INSTRUMENT_SEA_LILYS_BELL         equ $29 ; \
def MUSIC_INSTRUMENT_SURF_HARP              equ $2A ;  \
def MUSIC_INSTRUMENT_WIND_MARIMBA           equ $2B ;   After obtaining
def MUSIC_INSTRUMENT_CORAL_TRIANGLE         equ $2C ;  /
def MUSIC_INSTRUMENT_ORGAN_OF_EVENING_CALM  equ $2D ; /
def MUSIC_INSTRUMENT_THUNDER_DRUM           equ $2E ;/
def MUSIC_MARIN_SING                        equ $2F
def MUSIC_MANBOS_MAMBO                      equ $30
def MUSIC_OVERWORLD_INTRO                   equ $31 ; After obtaining sword
def MUSIC_MR_WRITE_HOUSE                    equ $32
def MUSIC_ULRIRA                            equ $33 ; Ulrira's House, Phone Booths
def MUSIC_TARIN_BEES                        equ $34
def MUSIC_MAMU_FROG_SONG                    equ $35
def MUSIC_MONKEYS_BUILDING_BRIDGE           equ $36
def MUSIC_CHRISTINE_HOUSE                   equ $37
def MUSIC_TOTAKA_UNUSED                     equ $38
def MUSIC_TURTLE_ROCK_ENTRANCE_BOSS         equ $39
def MUSIC_FISHERMAN_UNDER_BRIDGE            equ $3A
def MUSIC_OBTAIN_ITEM_UNUSED                equ $3B
def MUSIC_FILE_SELECT_TOTAKA                equ $3C ; Accessible only in German DX and Japanese versions. Enter file name MOYSE/とたけけ
def MUSIC_ENDING                            equ $3D
def MUSIC_MOBLIN_HIDEOUT                    equ $3E
def MUSIC_ISLAND_DISAPPEAR                  equ $3F
def MUSIC_RICHARD_HOUSE                     equ $40
def MUSIC_EGG_BALLAD_DEFAULT                equ $41 ; Play at egg without instrument #3
def MUSIC_EGG_BALLAD_BELL                   equ $42 ; Play at egg with instrument #3
def MUSIC_EGG_BALLAD_HARP                   equ $43 ; Play at egg with instruments #3-4
def MUSIC_EGG_BALLAD_MARIMBA                equ $44 ; Play at egg with instruments #3-5
def MUSIC_EGG_BALLAD_TRIANGLE               equ $45 ; Play at egg with instruments #3-6
def MUSIC_EGG_BALLAD_ORGAN                  equ $46 ; Play at egg with instruments #3-7
def MUSIC_EGG_BALLAD_ALL                    equ $47 ; Play at egg with instruments #3-8
def MUSIC_GHOST_HOUSE                       equ $48
def MUSIC_ACTIVE_POWER_UP                   equ $49
def MUSIC_LEARN_BALLAD                      equ $4A
def MUSIC_CATFISHS_MAW                      equ $4B
def MUSIC_OPEN_ANGLERS_TUNNEL               equ $4C
def MUSIC_MARIN_ON_BEACH                    equ $4D
def MUSIC_MARIN_BEACH_TALK                  equ $4E
def MUSIC_MARIN_UNUSED                      equ $4F
def MUSIC_MINIBOSS                          equ $50
def MUSIC_KANALET_CASTLE_COPY               equ $51
def MUSIC_TAIL_CAVE_COPY                    equ $52
def MUSIC_DREAM_SHRINE_DREAM                equ $53
def MUSIC_EAGLE_BOSS_TRANSITION             equ $54
def MUSIC_ROOSTER_REVIVAL                   equ $55
def MUSIC_L2_SWORD                          equ $56
def MUSIC_HENHOUSE                          equ $57
def MUSIC_FACE_SHRINE                       equ $58
def MUSIC_WIND_FISH                         equ $59
def MUSIC_TURTLE_ROCK                       equ $5A
def MUSIC_EAGLES_TOWER                      equ $5B
def MUSIC_EAGLE_BOSS_LOOP                   equ $5C ; Changes to $54 after dialog
def MUSIC_FINAL_BOSS_INTRO                  equ $5D
def MUSIC_BOSS_DEFEAT                       equ $5E
def MUSIC_FINAL_BOSS_DEFEAT                 equ $5F
def MUSIC_FILE_SELECT_ZELDA                 equ $60 ; Enter file name ZELDA
def MUSIC_COLOR_DUNGEON                     equ $61
def MUSIC_SILENCE                           equ $FF ; Silences the music. Seems to only work cleanly for certain tracks. Needs looking into

; Values for hJingle
def JINGLE_NONE                             equ $00
def JINGLE_TREASURE_FOUND                   equ $01
def JINGLE_PUZZLE_SOLVED                    equ $02
def JINGLE_ENEMY_HIT                        equ $03
def JINGLE_CHARGING_SWORD                   equ $04
def JINGLE_POWDER                           equ $05
def JINGLE_GENIE_APPEAR                     equ $06 ; Mad Batter
def JINGLE_SWORD_POKING                     equ $07
def JINGLE_FALL_DOWN                        equ $08 ; Jumping from ledge, Slime Eye
def JINGLE_BUMP                             equ $09 ; Some things hitting the ground, walls or Link's shield
def JINGLE_MOVE_SELECTION                   equ $0A ; File Select, Map Screen
def JINGLE_STRONG_BUMP                      equ $0B ; Spike bar, Boots wall bonk, Slime Eye, Blaino
def JINGLE_REVOLVING_DOOR                   equ $0C
def JINGLE_FEATHER_JUMP                     equ $0D
def JINGLE_WATER_SPLASH                     equ $0E
def JINGLE_SWIM                             equ $0F
def JINGLE_UNKNOWN_10                       equ $10 ; Produces no sound, unused?
def JINGLE_OPEN_INVENTORY                   equ $11
def JINGLE_CLOSE_INVENTORY                  equ $12
def JINGLE_VALIDATE                         equ $13 ; File Select, Map, Angler's Tunnel platforms
def JINGLE_GOT_HEART                        equ $14 ; Also Rupee
def JINGLE_DIALOG_BREAK                     equ $15
def JINGLE_SHIELD_TING                      equ $16
def JINGLE_GOT_POWER_UP                     equ $17
def JINGLE_ITEM_FALLING                     equ $18
def JINGLE_NEW_HEART                        equ $19
def JINGLE_FAIRY_HEAL                       equ $1A
def JINGLE_DUNGEON_WARP_APPEAR              equ $1B
def JINGLE_DUNGEON_WARP                     equ $1C
def JINGLE_WRONG_ANSWER                     equ $1D
def JINGLE_FOREST_LOST                      equ $1E
def JINGLE_GENIE_DISAPPEAR                  equ $1F
def JINGLE_BOUNCE                           equ $20 ; Roller, Genie bottle, Slime Eye, Boulder, Shadow Zol
def JINGLE_SEAGULL                          equ $21
def JINGLE_TARIN_BEE_BUZZ                   equ $22
def JINGLE_DUNGEON_OPENED                   equ $23
def JINGLE_JUMP                             equ $24
def JINGLE_OVERWORLD_WARP_HOLE              equ $25
def JINGLE_DISAPPEAR                        equ $26 ; Great Fairy, ending Owl
def JINGLE_WALRUS                           equ $27
def JINGLE_STALFOS_COLLAPSE                 equ $28
def JINGLE_SLIME_EEL_PULL                   equ $29
def JINGLE_DODONGO_EAT_BOMB                 equ $2A
def JINGLE_INSTRUMENT_WARP                  equ $2B
def JINGLE_MANBO_WARP                       equ $2C
def JINGLE_GHOST_PRESENCE                   equ $2D
def JINGLE_EAGLES_TOWER_ROTATE              equ $2E
def JINGLE_POOF                             equ $2F ; Pokey, Face Shrine opening, D8 Hole Filler
def JINGLE_EAGLE_SKID                       equ $30
def JINGLE_GRIM_CREEPER_BATS                equ $31
def JINGLE_HOT_HEAD_SPLASH                  equ $32
def JINGLE_LINK_DAZED                       equ $33 ; Used when hit by Blaino's fast wind up punch
def JINGLE_INSTRUMENTS_APPEAR               equ $34 ; Wind Fish cutscene
def JINGLE_SHADOW_MOVE                      equ $35
def JINGLE_SHADOW_AGAHNIM_DEFEAT            equ $36
def JINGLE_SHADOW_ZOL_HURT                  equ $37
def JINGLE_SHADOW_MOLDORM_ROAM              equ $38
def JINGLE_GANON_TRIDENT_APPEAR             equ $39
def JINGLE_UNKNOWN_3A                       equ $3A ; Unused?
def JINGLE_SWORD_BEAM                       equ $3B ; Mad Batter flying away
def JINGLE_PAIRODD_TELEPORT                 equ $3C ; Key Cavern enemy
def JINGLE_DETHI_HANDS                      equ $3D
def JINGLE_URCHIN_PUSH                      equ $3E ; D8 Hole Filler
def JINGLE_FLYING_TILE                      equ $3F
def JINGLE_FACADE_HOLE                      equ $40 ; Holes spawned by D6 boss
def JINGLE_UNKNOWN_41                       equ $41 ; Unused?

; Values for hWaveSfx
def WAVE_SFX_NONE                           equ $00
def WAVE_SFX_SEASHELL                       equ $01
def WAVE_SFX_LIFT_UP                        equ $02
def WAVE_SFX_LINK_HURT                      equ $03
def WAVE_SFX_LOW_HEARTS                     equ $04
def WAVE_SFX_RUPEE                          equ $05
def WAVE_SFX_HEART_PICKED_UP                equ $06
def WAVE_SFX_BOSS_HURT                      equ $07
def WAVE_SFX_LINK_DIES                      equ $08
def WAVE_SFX_OCARINA_BALLAD                 equ $09
def WAVE_SFX_OCARINA_FROG                   equ $0A
def WAVE_SFX_OCARINA_MAMBO                  equ $0B
def WAVE_SFX_LINK_FALL                      equ $0C
def WAVE_SFX_ANGLER_DASH                    equ $0D ; D4 Boss attack
def WAVE_SFX_FLOOR_SWITCH                   equ $0E ; Also when stomping Goombas
def WAVE_SFX_TEXT_PRINT                     equ $0F
def WAVE_SFX_BOSS_DEATH_CRY                 equ $10
def WAVE_SFX_POWER_HIT                      equ $11 ; Piece of Power, Red Clothes
def WAVE_SFX_UNKNOWN_12                     equ $12 ; Some relation to power hit
def WAVE_SFX_CUCCO_HURT                     equ $13
def WAVE_SFX_MONKEY                         equ $14
def WAVE_SFX_OCARINA_NOSONG                 equ $15 ; Off-key notes for when you have no songs available
def WAVE_SFX_BOSS_GROWL                     equ $16
def WAVE_SFX_WIND_FISH_CRY                  equ $17
def WAVE_SFX_CHAIN_CHOMP                    equ $18
def WAVE_SFX_OWL_HOOT                       equ $19
def WAVE_SFX_ROLLING_SPIKE_BAR              equ $1A ; D1 Miniboss
def WAVE_SFX_COMPASS                        equ $1B
def WAVE_SFX_ROVER_CRY                      equ $1C ; D6 Miniboss
def WAVE_SFX_UNKNOWN_1D                     equ $1D ; Unused?
def WAVE_SFX_L2_SWORD_APPEAR                equ $1E
def WAVE_SFX_WIND_FISH_MORPH                equ $1F
def WAVE_SFX_FLYING_WITH_SPOUT              equ $20 ; Wind Fish cutscene
def WAVE_SFX_SHADOW_DISPERSE                equ $21
def WAVE_SFX_AGAHNIM_CHARGE                 equ $22
def WAVE_SFX_SHADOW_CHANGE_FORM             equ $23

; Values for hNoiseSfx
def NOISE_SFX_NONE                          equ $00
def NOISE_SFX_UNKNOWN_1                     equ $01
def NOISE_SFX_SWORD_SWING_A                 equ $02
def NOISE_SFX_SPIN_ATTACK                   equ $03
def NOISE_SFX_DOOR_UNLOCKED                 equ $04 ; Also chests
def NOISE_SFX_CUT_GRASS                     equ $05
def NOISE_SFX_STAIRS                        equ $06
def NOISE_SFX_FOOTSTEP                      equ $07 ; Land from air, run with boots
def NOISE_SFX_BEAMOS_LASER                  equ $08 ; Deflecting Shadow Agahnim's ball
def NOISE_SFX_POT_SMASHED                   equ $09
def NOISE_SFX_WHOOSH                        equ $0A ; Blade Trap, Arrow shot, Blaino's jabs
def NOISE_SFX_HOOKSHOT                      equ $0B
def NOISE_SFX_EXPLOSION                     equ $0C ; Bombs, intro lightning, big Slime Eye hitting ground, Mad Batter
def NOISE_SFX_MAGIC_ROD                     equ $0D ; Vire
def NOISE_SFX_SHOVEL_DIG                    equ $0E
def NOISE_SFX_SEA_WAVES                     equ $0F
def NOISE_SFX_DOOR_CLOSED                   equ $10
def NOISE_SFX_RUMBLE                        equ $11 ; Block push, Walrus falls
def NOISE_SFX_BURSTING_FLAME                equ $12 ; Flame shooter, burning enemy
def NOISE_SFX_ENEMY_DESTROYED               equ $13
def NOISE_SFX_SWORD_SWING_B                 equ $14
def NOISE_SFX_SWORD_SWING_C                 equ $15
def NOISE_SFX_DRAW_SHIELD                   equ $16
def NOISE_SFX_CLINK                         equ $17 ; Falling key, poking bombable wall
def NOISE_SFX_SWORD_SWING_D                 equ $18
def NOISE_SFX_PING                          equ $19 ; Title logo, Ganon's trident
def NOISE_SFX_BOSS_EXPLOSION                equ $1A
def NOISE_SFX_MOLDORM_ROAM                  equ $1B ; D1 Boss
def NOISE_SFX_BUZZ_BLOB_ELECTROCUTE         equ $1C
def NOISE_SFX_OPEN_D4_D7                    equ $1D ; Angler's Tunnel, Eagle's Tower
def NOISE_SFX_UNKNOWN_1E                    equ $1E ; Unused?
def NOISE_SFX_BLACK_HOLE_ACTIVE             equ $1F
def NOISE_SFX_TRENDY_CRANE                  equ $20
def NOISE_SFX_SILENT                        equ $21 ; Trendy Crane
def NOISE_SFX_EVIL_EAGLE_FLY                equ $22
def NOISE_SFX_LANMOLA_BURROW                equ $23
def NOISE_SFX_WALRUS_SPLASH                 equ $24
def NOISE_SFX_D7_PILLAR_COLLAPSE            equ $25
def NOISE_SFX_ELECTRIC_BEAM                 equ $26 ; Shopkeeper, Mad Batter
def NOISE_SFX_WEAPON_SWING                  equ $27 ; Master Stalfos, Ganon's trident throw
def NOISE_SFX_GENIE_FIREBALL                equ $28 ; Also Ganon's bats
def NOISE_SFX_BREAK                         equ $29 ; Armos Knight, Elephant statues, Hot Head
def NOISE_SFX_OPEN_KEY_CAVERN               equ $2A
def NOISE_SFX_RUMBLE2                       equ $2B ; Floor crumble, instrument appearing for egg ballad
def NOISE_SFX_INSTRUMENT_WARP               equ $2C
def NOISE_SFX_BOOMERANG                     equ $2D
def NOISE_SFX_OPEN_FACE_SHRINE              equ $2E
def NOISE_SFX_CUEBALL_SPLASH                equ $2F
def NOISE_SFX_EAGLE_LANDING                 equ $30
def NOISE_SFX_EAGLE_LIFT_UP                 equ $31
def NOISE_SFX_EAGLE_FEATHERS                equ $32
def NOISE_SFX_L2_SWORD_SPARKS               equ $33 ; During cutscene
def NOISE_SFX_WATERSPOUT                    equ $34 ; Wind Fish cutscene
def NOISE_SFX_ISLAND_DISAPPEAR              equ $35 ; Ending cutscene
def NOISE_SFX_AGAHNIM_FAKE_BALL_EXPLODE     equ $36
def NOISE_SFX_SHADOW_DISPERSE               equ $37
def NOISE_SFX_AGAHNIM_BALL                  equ $38
def NOISE_SFX_AGAHNIM_FAKE_BALL             equ $39
def NOISE_SFX_GANON_FLYING_TRIDENT          equ $3A
def NOISE_SFX_KIRBY_INHALE                  equ $3B
def NOISE_SFX_UNKNOWN_3C                    equ $3C ; Unused?
def NOISE_SFX_FINAL_BOSS_EXPLOSION          equ $3D
def NOISE_SFX_SLIME_EEL_FLOOR_BREAK         equ $3E
def NOISE_SFX_MINIBOSS_FLEE                 equ $3F ; Master Stalfos, Grim Creeper
def NOISE_SFX_PHOTO                         equ $40 ; Photographer taking photo

; values for wOcarinaSongFlags
def FROGS_SONG_OF_THE_SOUL_FLAG       equ 1
def MANBO_MAMBO_FLAG                  equ 2
def BALLAD_OF_THE_WIND_FISH_FLAG      equ 4
def FROGS_SONG_OF_THE_SOUL_FLAG_BIT   equ 0
def MANBO_MAMBO_FLAG_BIT              equ 1
def BALLAD_OF_THE_WIND_FISH_FLAG_BIT  equ 2

def LOW_HEALTH_SFX_PAUSE              equ $30 ; pause beetween low health SFX beeps
def MUSIC_FADE_OUT_TIMER_MAX          equ $38 ; reset value for hMusicFadeOutTimer
