;
; Constants for audio effects

; @TODO Are these correct? Some of these don't seem to match
; their actual in-game use (???)

; Values for hMusicTrack
 
MUSIC_NONE                                      equ $00
MUSIC_TITLE_SCREEN                              equ $01;probably correct
MUSIC_TRENDY_GAME                               equ $02
MUSIC_GAME_OVER                                 equ $03
MUSIC_MABE_VILLAGE                              equ $04
MUSIC_OVERWORLD                                 equ $05
MUSIC_TAL_TAL_HEIGHTS                           equ $06
MUSIC_VILLAGE_SHOP                              equ $07;	Witch hut. The shopkeeper also has magic, it's more of a magic theme in general.
;MUSIC_RAFT_RIDE_RAPIDS                         equ $08;don't remember where it is used; probably indeed raft minigame.
MUSIC_MYSTERIOUS_FOREST                         equ $09
MUSIC_HOUSE                                     equ $0A;	Inside most regular houses.
MUSIC_ANIMAL_VILLAGE                            equ $0B
MUSIC_FAIRY_FOUNTAIN                            equ $0C
;MUSIC_TITLE                                    equ $0D;classic zelda theme, used when acorn/triangle is collected?
;MUSIC_BOWWOW_KIDNAPPED                         equ $0E;don't remember where it is used. intense theme, probably correct
MUSIC_FOUND_LEVEL_1_SWORD                       equ $0F; Sword found. Not sure if specifically for the LVL2 sword.
MUSIC_FOUND_NEW_WEAPON                          equ $10;item received jingle. when finished, reloads the current maps music
MUSIC_FILE_SELECT                               equ $11
MUSIC_EGG_INSIDE                                equ $12; Plays inside the Wind Fish's Egg
;MUSIC_FINAL_NIGHTMARE_IN_EGG                   equ $13;unrecognized. Sounds dungeonlike
;MUSIC_DREAM_SHRINE_ENTRANCE                    equ $14;probably a dungeon theme
;MUSIC_FOUND_INSTRUMENT                         equ $15;dungeon theme.
;MUSIC_OVERWORLD_CAVE                           equ $16;don't know. Probably a dungeon
;MUSIC_COMMON_CAVE_FAST                         equ $17;Faster/higher version of common cave theme as heard at $26
;MUSIC_RECEIVED_HORN_INSTRUMENT                 equ $18;unknown item receive jingle
MUSIC_BOSS_BATTLE                               equ $19
MUSIC_INTRO_CUTSCENE                            equ $1A
;MUSIC_RECEIVED_XYLOPHONE_INSTRUMENT            equ $1B;item receive thing
;MUSIC_RECEIVED_UNKNOWN_INSTRUMENT              equ $1C;alternative house theme? not sure
MUSIC_SWORD_SEARCH                              equ $1D;	First time on Koholint Island.
;MUSIC_ENTERING_DREAM_WORLD                     equ $1E;bed sleeping dream world entering cutscene?
;MUSIC_MARIN_DUNGEON                            equ $1F;sounds like a dungeon, but has marin's song. Probably cutscene related
;MUSIC_BOTWF                                    equ $20; Marin melodic motif on violin-like instrument.
MUSIC_2D_UNDERGROUND                            equ $21
MUSIC_OWL                                       equ $22
;MUSIC_FINAL_BOSS                               equ $23
MUSIC_DREAM_SHRINE                              equ $24
MUSIC_COMPLETE_INSTRUMENTS_SONG_PART_1          equ $25;;;Item jingle
MUSIC_COMMON_CAVE                               equ $26;$17 is a variation on this theme.
MUSIC_POWERUP_ACQUIRED                          equ $27;	Powerup/acorn jingle. Then loops $49.
;MUSIC_BOTWF                                    equ $28; Marin melodic motif on horn-like instrument.
;MUSIC_PIECE_OF_POWER_PART_2                    equ $29;Sounds like annoying mobile ringtone. (Item?) jingle.
;MUSIC_MARIN_SINGING_LINKS_OCARINA              equ $2A;unknown. Incorrectly labeled.
;MUSIC_LEVEL_5                                  equ $2B;unknown jingle. 
;MUSIC_DUNGEON_ENTRANCE_UNLOCKING               equ $2C; Theme played on a triangle. Only uses one note in a rhythm.
;MUSIC_BOTWF                                    equ $2D; Marin melodic motif on a flute-like instrument.
;MUSIC_AT_BEACH_WITH_MARIN                      equ $2E;Funky bongo
MUSIC_MARIN_SINGING                             equ $2F;	Marin's singing the Ballad of the Wind Fish. Beautiful theme.
MUSIC_MANBOS_MAMBO                              equ $30
MUSIC_OVERWORLD_INTRODUCTION                    equ $31;    The overworld theme's introduction section.
MUSIC_MR_WRITE_HOUSE                            equ $32
MUSIC_PHONE_BOOTH                               equ $33;	Also Ulrira's house.
MUSIC_TARIN_ATTACKED_BY_BEES                    equ $34
MUSIC_MAMU_SONG                                 equ $35;	Mamu's/Wart's song.
MUSIC_MONKEYS_BUILDING_BRIDGE                   equ $36
;MUSIC_MR_WRITE_HOUSE_VERSION_2                 equ $37;	Mr Write House variant. Where is this used?
MUSIC_TOTAKAS_SONG                              equ $38;	Totaka's Song as played in Richard's mansion; does not init instrument bank.
;MUSIC_TURTLE_ROCK_ENTRANCE_BOSS                equ $39;Rumbling noise, cutscene, then a boss theme.
MUSIC_FISHING_GAME                              equ $3A;;; Mashup of Witch Hut and Trendy Game 
;MUSIC_RECEIVED_ITEM                            equ $3B; Short item jingle
MUSIC_TOTAKEKE_EASTER_EGG                       equ $3C;	とたけけ nickname easter egg. Unused in EU/US versions. Similar to $60
;MUSIC_BOTWF                                    equ $3D; Silence, then marin's theme. Probably from a cutscene.
;MUSIC_BOWWOW_STOLEN                            equ $3E;Chromatic introduction, then tense loop.
;MUSIC_ENDING                                   equ $3F; Not the theme that plays during the opening the egg cutscene.
MUSIC_RICHARDS_HOUSE                            equ $40
;MUSIC_BOTWF                                    equ $41; Awakening of egg, on horn and flute-like instruments.
;MUSIC_BOTWF                                    equ $42; Awakening, has added marimba motif. More voices than $41
;MUSIC_BOTWF                                    equ $43; Awakening, piano, more voices than $42
;MUSIC_BOTWF                                    equ $44; Awakening, has high pitched ting. more voices than $43
;MUSIC_BOTWF                                    equ $45; Awakening, has triangle rhythm. More voices than $44
;MUSIC_BOTWF                                    equ $46; Awakening, has added horn. More voices than $45
;MUSIC_BOTWF                                    equ $47; Awakening, drums, high ting. Awakening tracks are not well described.
MUSIC_GHOSTS_HOUSE                              equ $48;	Ghost's abandoned house by the bay. GHOSTS_HOUSE rather than GHOST_HOUSE to avoid confusion
MUSIC_ACTIVE_POWER_UP                           equ $49;
;MUSIC_SILENCE                                  equ $4A; More awakening...
;MUSIC_DUNGEON                                  equ $4B;dungeon-like
;MUSIC_GLITCHY                                  equ $4C;Orchestral, short jingle.
;MUSIC_SILENCE                                  equ $4D;harp jingle
MUSIC_MINI_BOSS                                 equ $50
;MUSIC_GLITCHY                                  equ $58; Unknown Dungeon. Sounds like Bach's prelude in C minor from WTC I.
;MUSIC_SILENCE                                  equ $59;magical jingles, loops.
;MUSIC_GLITCHY                                  equ $5A;dungeon?
;MUSIC_SILENCE                                  equ $5B;dungeon?
;MUSIC_SILENCE                                  equ $5C;intense 
MUSIC_FINAL_BOSS_DIALOG                         equ $5D;	Plays during the final boss' dialog.
;MUSIC_BEES                                     equ $5E; MORE BEE SOUNDS. Might be used in Tarin cutscene
;MUSIC_SILENCE                                  equ $5F;Magic. loops.
MUSIC_ZELDA_EASTER_EGG                          equ $60;	ZELDA nickname easter egg.
MUSIC_COLOR_DUNGEON                             equ $61;
;MUSIC_COLOR_DUNGEON                            equ $62-6F;	Same as $61	
;MUSIC_GLITCHED                                 equ $70-FE; Glitched version of the music that played before it.
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
