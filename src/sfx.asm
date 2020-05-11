;
; Constants for audio effects

; Values for hMusicTrack
 
MUSIC_NONE                                      equ $00
MUSIC_TITLE_SCREEN_INTRODUCTION                 equ $01;	The title screen's theme's introduction section.
MUSIC_TRENDY_GAME                               equ $02
MUSIC_GAME_OVER                                 equ $03
MUSIC_MABE_VILLAGE                              equ $04
MUSIC_OVERWORLD                                 equ $05
MUSIC_MT_TAMARANCH                              equ $06;	Also Tal Tal Height.
MUSIC_WITCH_HUT                                 equ $07;	Also used in the shop.
MUSIC_RAFT_RIDE_RAPIDS                          equ $08
MUSIC_MYSTERIOUS_FOREST                         equ $09
MUSIC_HOUSE                                     equ $0A;	Inside most regular houses.
MUSIC_ANIMAL_VILLAGE                            equ $0B
MUSIC_FAIRY_FOUNTAIN                            equ $0C
MUSIC_TITLE_SCREEN                              equ $0D;	Plays when $01 has finished.
MUSIC_BOWWOW_KIDNAPPED                          equ $0E;	Plays when $3E has finished.
MUSIC_SWORD_ACQUIRED                            equ $0F;	Possibly also for LVL2 sword
MUSIC_WEAPON_ACQUIRED                           equ $10; item received jingle. when finished, reloads the current area's music
MUSIC_FILE_SELECT                               equ $11
MUSIC_INSIDE_THE_WIND_EGG                       equ $12
MUSIC_KANALET_CASTLE                            equ $13
MUSIC_TAIL_CAVE                                 equ $14
MUSIC_BOTTLE_GROTTO                             equ $15
MUSIC_KEY_CAVERN                                equ $16
MUSIC_ANGLERS_TUNNEL                            equ $17
MUSIC_BOSS_DEFEATED                             equ $18;	Plays in boss rooms after the boss has been defeated.
MUSIC_BOSS_BATTLE                               equ $19
MUSIC_INTRO_CUTSCENE                            equ $1A
MUSIC_INSTRUMENT_ACQUIRED                       equ $1B
MUSIC_LINK_AWAKENS                              equ $1C;	Played in the house when you begin your game.
MUSIC_SWORD_SEARCH                              equ $1D;	First time on Koholint Island.
MUSIC_DREAMING                                  equ $1E
MUSIC_SOUTHERN_SHRINE                           equ $1F 
MUSIC_FULL_MOON_CELLO                           equ $20
MUSIC_2D_UNDERGROUND                            equ $21
MUSIC_OWL                                       equ $22
MUSIC_FINAL_BOSS                                equ $23
MUSIC_DREAM_SHRINE_BED                          equ $24
MUSIC_HEART_CONTAINER_ACQUIRED                  equ $25
MUSIC_COMMON_CAVE                               equ $26
MUSIC_POWERUP_ACQUIRED                          equ $27
MUSIC_INSTRUMENT_CONCH_HORN                     equ $28
MUSIC_INSTRUMENT_SEA_LILY_BELL                  equ $29
MUSIC_INSTRUMENT_SURF_HARP                      equ $2A
MUSIC_INSTRUMENT_WIND_MARIMBA                   equ $2B
MUSIC_INSTRUMENT_CORAL_TRIANGLE                 equ $2C
MUSIC_INSTRUMENT_ORGAN_OF_EVENING               equ $2D
MUSIC_THUNDER_DRUM                              equ $2E
MUSIC_MARIN_SINGING                             equ $2F
MUSIC_MANBOS_MAMBO                              equ $30
MUSIC_OVERWORLD_INTRODUCTION                    equ $31;    The overworld theme's introduction section.
MUSIC_MR_WRITE_HOUSE                            equ $32
MUSIC_PHONE_BOOTH                               equ $33;	Also Ulrira's house.
MUSIC_TARIN_ATTACKED_BY_BEES                    equ $34
MUSIC_MAMUS_SONG                                equ $35
MUSIC_MONKEYS_BUILDING_BRIDGE                   equ $36
;MUSIC_MR_WRITE_HOUSE_VERSION_2                 equ $37;	Mr Write House variant. Where is this used?
MUSIC_TOTAKAS_SONG                              equ $38;	Totaka's Song as played in Richard's mansion; does not init instrument bank. Missing drums(?)
MUSIC_TURTLE_ROCK_ENTRANCE_BOSS                 equ $39
MUSIC_FISHING_GAME                              equ $3A
;MUSIC_RECEIVED_ITEM                            equ $3B; Short item jingle
MUSIC_TOTAKEKE_NICKNAME_EASTER_EGG              equ $3C;	とたけけ nickname easter egg. Unused in EU/US versions. Similar to $60
MUSIC_ENDING                                    equ $3D;	During ending cutscene. Silence, then music. Plays staff roll theme when finished.
MUSIC_BOWWOW_KIDNAPPED_INTRODUCTION             equ $3E
MUSIC_WIND_FISH_AWAKENS                         equ $3F;	Plays during cutscene after defeating the final boss
MUSIC_RICHARDS_HOUSE                            equ $40
;MUSIC_BOTWF                                    equ $41; Ballad of the Wind Fish, on horn and flute-like instruments.
;MUSIC_BOTWF                                    equ $42; Ballad of the Wind Fish, has added marimba motif. More voices than $41
;MUSIC_BOTWF                                    equ $43; Ballad of the Wind Fish, piano, more voices than $42
;MUSIC_BOTWF                                    equ $44; Ballad of the Wind Fish, has high pitched ting. more voices than $43
;MUSIC_BOTWF                                    equ $45; Ballad of the Wind Fish, has triangle rhythm. More voices than $44
;MUSIC_BOTWF                                    equ $46; Ballad of the Wind Fish, has added horn. More voices than $45
;MUSIC_BOTWF                                    equ $47; Ballad of the Wind Fish, drums, high ting. Awakening tracks are not well described.
MUSIC_GHOSTS_HOUSE                              equ $48
MUSIC_ACTIVE_POWER_UP                           equ $49
;MUSIC_SILENCE                                  equ $4A; More awakening...
MUSIC_CATFISHS_MAW                              equ $4B
;MUSIC_GLITCHY                                  equ $4C; Orchestral, short jingle.
;MUSIC_SILENCE                                  equ $4D; harp jingle
;MUSIC_MARIN_BEACH                              equ $4E
;MUSIC_UNKNOWN                                  equ $4F; item jingle
MUSIC_MINI_BOSS                                 equ $50
;MUSIC_KANALET_CASTLE_COPY                      equ $51;	Copy of $13.
;MUSIC_TAIL_CAVE_COPY                           equ $52;	Copy of $14.
MUSIC_DREAM_SHRINE                              equ $53
;MUSIC_UNKNOWN                                  equ $54; intense arpeggio, pre boss music? Switches to $19.
MUSIC_FLYING_ROOSTER_REVIVED                    equ $55
;MUSIC_UNKNOWN                                  equ $56; punch noises in upwards chord progression, plays $55 afterwards
;MUSIC_CUCCO_HOUSE                              equ $57;	Is called 'Cucco House'
MUSIC_FACE_SHRINE                               equ $58
;MUSIC_WINDFISH                                 equ $59;	Is called 'The WindFish'
MUSIC_TURTLE_ROCK                               equ $5A
MUSIC_EAGLES_TOWER                              equ $5B
MUSIC_BEFORE_EAGLES_TOWER_BOSS                  equ $5C;    Plays before the boss at the top of Eagle's Tower is summon by Grim Creeper.
MUSIC_FINAL_BOSS_DIALOG                         equ $5D;	Plays during the final boss' dialog.
MUSIC_BOSS_WARNING                              equ $5E;	Plays when the bosses tell you not to wake the windfish after defeating them.
MUSIC_FINAL_BOSS_DEFEATED                       equ $5F
MUSIC_ZELDA_NICKNAME_EASTER_EGG                 equ $60;	ZELDA nickname easter egg.
MUSIC_COLOR_DUNGEON                             equ $61;
;MUSIC_COLOR_DUNGEON_COPIES                     equ $62 to 6F;	Same as $61	
;MUSIC_GLITCHED                                 equ $70 to $FE;	Glitches the music that played before it.
MUSIC_NOTHING                                   equ $FF;	Silence.

; Values for hJingle
JINGLE_TREASURE_FOUND   equ $01
JINGLE_PUZZLE_SOLVED    equ $02
JINGLE_BOW_WOW_CHOMP    equ $03
JINGLE_CHARGING_SWORD   equ $04
JINGLE_POWDER           equ $05
JINGlE_ENNEMY_MORPH_IN  equ $06
JINGLE_SWORD_POKING     equ $07
JINGLE_JUMP_DOWN        equ $08
JINGLE_BUMP             equ $09
JINGLE_MOVE_SELECTION   equ $0A
JINGLE_HUGE_BUMP        equ $0B
JINGLE_REVOLVING_DOOR   equ $0C
JINGLE_FEATHER_JUMP     equ $0D
JINGLE_WATER_DIVE       equ $0E
JINGLE_OPEN_INVENTORY   equ $11
JINGLE_CLOSE_INVENTORY  equ $12
JINGLE_VALIDATE         equ $13
JINGLE_GOT_HEART        equ $14
JINGLE_DIALOG_BREAK     equ $15
JINGLE_SHIELD_TING      equ $16
JINGLE_GOT_POWER_UP     equ $17
JINGLE_ITEM_FALLING     equ $18
JINGLE_NEW_HEART        equ $19
JINGLE_WRONG_ANSWER     equ $1D
JINGLE_FOREST_LOST      equ $1E
JINGLE_ENNEMY_MORPH_OUT equ $1F
JINGLE_BIG_BUMP         equ $20
JINGLE_SEAGULL          equ $21
JINGLE_DUNGEON_OPENED   equ $23
JINGLE_JUMP             equ $24
JINGLE_INSTRUMENT_WARP  equ $2B
JINGLE_MANBO_WARP       equ $2C
JINGLE_GHOST_PRESENCE   equ $2D
JINGLE_ENNEMY_SHRIEK    equ $3C

; Values for hWaveSfx
WAVE_SFX_SEASHELL        equ $01
WAVE_SFX_ZIP             equ $02
WAVE_SFX_LINK_HURT       equ $03
WAVE_SFX_LOW_HEARTS      equ $04
WAVE_SFX_RUPEE           equ $05
WAVE_SFX_HEART_PICKED_UP equ $06
WAVE_SFX_BOSS_GRAWL      equ $07
WAVE_SFX_LINK_DIES       equ $08
WAVE_SFX_OCARINA_BALLAD  equ $09
WAVE_SFX_OCARINA_FROG    equ $0A
WAVE_SFX_OCARINA_MAMBO   equ $0B
WAVE_SFX_LINK_FALLS      equ $0C
WAVE_SFX_TYPEWRITER      equ $0F
WAVE_SFX_BOSS_AGONY      equ $10
WAVE_SFX_CUCCO_HURT      equ $13
WAVE_SFX_OCARINA_NOSONG  equ $15	; Off-key notes for when you have no songs available
WAVE_SFX_BOSS_HIT        equ $16
WAVE_SFX_CHAIN_CHOMP     equ $18
WAVE_SFX_HOOT            equ $19
WAVE_SFX_COMPASS         equ $1B

; Values for hNoiseSfx
NOISE_SFX_SWORD_A         equ $02
NOISE_SFX_SPIN_ATTACK     equ $03
NOISE_SFX_DOOR_UNLOCKED   equ $04
NOISE_SFX_RUPEE           equ $05
NOISE_SFX_STAIRS          equ $06
NOISE_SFX_FOOTSTEP        equ $07
NOISE_SFX_POT_SMASHED     equ $09
NOISE_SFX_SHOOT_ARROW     equ $0A
NOISE_SFX_BOMB_EXPLOSION  equ $0C
NOISE_SFX_MAGIC_ROD       equ $0D
NOISE_SFX_SHOWEL_DIG      equ $0E
NOISE_SFX_SEA_WAVES       equ $0F
NOISE_SFX_DOOR_CLOSED     equ $10
NOISE_SFX_BLOCK_RUMBLE    equ $11
NOISE_SFX_BURSTING_FLAME  equ $12
NOISE_SFX_ENEMY_DESTROYED equ $13
NOISE_SFX_SWORD_B         equ $14
NOISE_SFX_SWORD_C         equ $15
NOISE_SFX_DRAW_SHIELD     equ $16
NOISE_SFX_SWORD_D         equ $18
NOISE_SFX_TITLE_APPEARS   equ $19
NOISE_SFX_DOOR_RUMBLE     equ $2A
NOISE_SFX_ROCK_RUMBLE     equ $2B
NOISE_SFX_BOOMERANG       equ $2D
NOISE_SFX_EAGLE_TOUCHDOWN equ $30
NOISE_SFX_EAGLE_LIFT_UP   equ $31
