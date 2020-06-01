; Constants for music tracks and sound effects

; Values for wMusicTrackToPlay

MUSIC_NONE                                      equ $00 ; This value means: Don't play a different track.
MUSIC_TITLE_SCREEN_INTRO                        equ $01 ; $0D's introduction section.
MUSIC_MINIGAME                                  equ $02
MUSIC_GAME_OVER                                 equ $03
MUSIC_MABE_VILLAGE                              equ $04
MUSIC_OVERWORLD                                 equ $05
MUSIC_MT_TAMARANCH                              equ $06 ; Also Tal Tal Heights.
MUSIC_WITCH_HUT                                 equ $07 ; Also used in the shop.
MUSIC_RAFT_RIDE_RAPIDS                          equ $08
MUSIC_MYSTERIOUS_FOREST                         equ $09
MUSIC_HOUSE                                     equ $0A ; Inside regular houses.
MUSIC_ANIMAL_VILLAGE                            equ $0B
MUSIC_FAIRY_FOUNTAIN                            equ $0C
MUSIC_TITLE_SCREEN                              equ $0D ; Plays when $01 has finished.
MUSIC_BOWWOW_KIDNAPPED                          equ $0E ; Plays when $3E has finished.
MUSIC_SWORD_ACQUIRED                            equ $0F ; Plays when you retrieve your sword on the beach.
MUSIC_TOOL_ACQUIRED                             equ $10 ; Tool refers to many things here. Weapons, maps/compasses, etc.
MUSIC_FILE_SELECT                               equ $11
MUSIC_EGG_MAZE                                  equ $12
MUSIC_KANALET_CASTLE                            equ $13
MUSIC_TAIL_CAVE                                 equ $14
MUSIC_BOTTLE_GROTTO                             equ $15
MUSIC_KEY_CAVERN                                equ $16
MUSIC_ANGLERS_TUNNEL                            equ $17
MUSIC_BOSS_DEFEATED                             equ $18 ; Plays in boss rooms after the boss has been defeated.
MUSIC_BOSS_BATTLE                               equ $19
MUSIC_INTRO_CUTSCENE                            equ $1A
MUSIC_INSTRUMENT_ACQUIRED                       equ $1B
MUSIC_LINK_AWAKENS                              equ $1C ; Played in the house when you begin your game.
MUSIC_SWORD_SEARCH                              equ $1D ; First time on Koholint Island.
MUSIC_DREAMING                                  equ $1E ; Plays when you sleep in the bed in the upper Dream Shrine and the VFXplays.
MUSIC_SOUTHERN_SHRINE                           equ $1F
MUSIC_INSTRUMENT_FULL_MOON_CELLO                equ $20 ; When you obtain the Full Moon Cello and it plays its tune.
MUSIC_2D_UNDERGROUND                            equ $21
MUSIC_OWL                                       equ $22
MUSIC_FINAL_BOSS                                equ $23
MUSIC_DREAM_SHRINE_BED                          equ $24
MUSIC_HEART_CONTAINER_ACQUIRED                  equ $25
MUSIC_COMMON_CAVE                               equ $26
MUSIC_POWERUP_ACQUIRED                          equ $27
MUSIC_INSTRUMENT_CONCH_HORN                     equ $28 ; When you obtain the Conch Horn and it plays its tune.
MUSIC_INSTRUMENT_SEA_LILY_BELL                  equ $29 ; When you obtain Sea Lily's Bell and it plays its tune.
MUSIC_INSTRUMENT_SURF_HARP                      equ $2A ; When you obtain the Surf Harp and it plays its tune.
MUSIC_INSTRUMENT_WIND_MARIMBA                   equ $2B ; When you obtain the Wind Marimba and it plays its tune.
MUSIC_INSTRUMENT_CORAL_TRIANGLE                 equ $2C ; When you obtain the Coral Triangle and it plays its tune.
MUSIC_INSTRUMENT_ORGAN_OF_EVENING_CALM          equ $2D ; When you obtain the Organ of Evening Calm and it plays its tune.
MUSIC_INSTRUMENT_THUNDER_DRUM                   equ $2E ; When you obtain the Thunder Drum and it plays its tune.
MUSIC_MARIN_SINGING                             equ $2F
MUSIC_MANBO_MAMBO                               equ $30
MUSIC_OVERWORLD_INTRO                           equ $31 ; Heroic introduction before $05. It only plays once; after retrieving your sword on the shore.
MUSIC_MR_WRITE_HOUSE                            equ $32
MUSIC_PHONE_BOOTH                               equ $33 ; Also used in Ulrira's house.
MUSIC_TARIN_BEEHIVE                             equ $34 ; Used for Tarin's beehive cutscene.
MUSIC_MAMU_SONG                                 equ $35
MUSIC_MONKEYS_BUILDING_BRIDGE                   equ $36
MUSIC_CHRISTINE_HOUSE                           equ $37
MUSIC_TOTAKA_SONG_UNUSED                        equ $38 ; Unused. Where is the one that plays in Richard's mansion?
MUSIC_TURTLE_ROCK_ENTRANCE_BOSS                 equ $39
MUSIC_FISHING_UNDER_BRIDGE                      equ $3A ; The fishing pond plays $02 during the fishing minigame. This is a different fishing minigame.
MUSIC_CLASSIC_RECEIVED_ITEM                     equ $3B ; It is the classic Legend of Zelda item fanfare. I think it is in the Color Dungeon.
MUSIC_TOTAKEKE_NICKNAME_EASTER_EGG              equ $3C ; とたけけ nickname easter egg. Unused in EU/US versions. Similar to $60
MUSIC_ENDING                                    equ $3D ; During ending cutscene. Silence, then music. Plays staff roll theme when finished.
MUSIC_BOWWOW_KIDNAPPED_INTRODUCTION             equ $3E ; Plays during kidnapping related dialog and in the Moblin hideout.
MUSIC_WIND_FISH_AWAKENS                         equ $3F ; Plays during cutscene after defeating the final boss
MUSIC_RICHARD_MANSION                           equ $40
MUSIC_BALLAD_HORN                               equ $41 ; Played when breaking open the Wind Egg. The game cycles through these to showcase different instruments.
MUSIC_BALLAD_BELL                               equ $42 ; Played when breaking open the Wind Egg. The game cycles through these to showcase different instruments.
MUSIC_BALLAD_HARP                               equ $43 ; Played when breaking open the Wind Egg. The game cycles through these to showcase different instruments.
MUSIC_BALLAD_MARIMBA                            equ $44 ; Played when breaking open the Wind Egg. The game cycles through these to showcase different instruments.
MUSIC_BALLAD_TRIANGLE                           equ $45 ; Played when breaking open the Wind Egg. The game cycles through these to showcase different instruments.
MUSIC_BALLAD_ORGAN                              equ $46 ; When playing for the egg w
MUSIC_BALLAD_ALL                                equ $47 ; Played when breaking open the Wind Egg. The game cycles through these to showcase different instruments.
MUSIC_GHOST_HOUSE                               equ $48
MUSIC_ACTIVE_POWER_UP                           equ $49
MUSIC_LINK_MARIN_DUET                           equ $4A
MUSIC_CATFISH_MAW                               equ $4B
MUSIC_WATERFALL_DRAIN                           equ $4C ; Plays when you open the lock for the Angler's Tunnel.
MUSIC_MARIN_BEACH_TRANSITION                    equ $4D ; For the transition to the Link and Marin beach cutscene. The beginning and ending notes are skipped.
MUSIC_MARIN_BEACH                               equ $4E
;MUSIC_UNKNOWN                                  equ $4F ; Jingle, possible unused/possibly related to Marin
MUSIC_MINIBOSS                                  equ $50
MUSIC_KANALET_CASTLE_COPY                       equ $51 ; Copy of $13.
MUSIC_TAIL_CAVE_COPY                            equ $52 ; Copy of $14.
MUSIC_DREAM_SHRINE                              equ $53 ; Plays in the lower Dream Shrine. (After sleeping in the bed)
MUSIC_EAGLES_TOWER_BOSS_CUTSCENE                equ $54 ; Plays when the boss comes into view. Switches to $19.
MUSIC_ROOSTER_REVIVAL                           equ $55 ; Plays while the flying rooster's spirit reenters his remains.
MUSIC_SEASHELL_MANSION_SPIRIT                   equ $56 ; Plays $55 afterwards. Possibly left unused for resurrecting the rooster?
MUSIC_CUCCO_HOUSE                               equ $57
MUSIC_FACE_SHRINE                               equ $58
MUSIC_MEETING_WINDFISH                          equ $59 ; When you climb the staircase and meet the Wind Fish.
MUSIC_TURTLE_ROCK                               equ $5A
MUSIC_EAGLE_TOWER                               equ $5B
MUSIC_GRIM_CREEPER_DIALOG                       equ $5C ; Plays during Grim Creeper's dialog before the boss. Switches to $54 after the dialog.
MUSIC_FINAL_BOSS_DIALOG                         equ $5D ; Plays during the final boss' dialog.
MUSIC_BOSS_WARNING                              equ $5E ; Plays during the dialogs where the bosses tell you not to wake the Wind Fish.
MUSIC_FINAL_BOSS_DEFEATED                       equ $5F
MUSIC_ZELDA_NICKNAME_EASTER_EGG                 equ $60 ; ZELDA nickname easter egg.
MUSIC_COLOR_DUNGEON                             equ $61
;MUSIC_COLOR_DUNGEON_COPIES                     equ $62 to 6F   ; Same as $61
;MUSIC_GLITCHED                                 equ $70 to $FE  ; Glitches the music that played before it.
MUSIC_SILENCE                                   equ $FF ; Seems to try to silence the voice channels. Does not always correctly silence the music.

; Values for hJingle
JINGLE_NONE             equ $00;
JINGLE_TREASURE_FOUND   equ $01;treasure
JINGLE_PUZZLE_SOLVED    equ $02;
JINGLE_BOW_WOW_CHOMP    equ $03;damage
JINGLE_CHARGING_SWORD   equ $04;
JINGLE_POWDER           equ $05;powder
JINGLE_ENEMY_MORPH_IN   equ $06;mario mushroom
JINGLE_SWORD_POKING     equ $07
JINGLE_JUMP_DOWN        equ $08
JINGLE_BUMP             equ $09
JINGLE_MOVE_SELECTION   equ $0A
JINGLE_HUGE_BUMP        equ $0B;huge bump
JINGLE_REVOLVING_DOOR   equ $0C
JINGLE_FEATHER_JUMP     equ $0D
JINGLE_WATER_DIVE       equ $0E
JINGLE_WATER_SWIM       equ $0F
JINGLE_UNKNOWN_10       equ $10 ;produces no sound
JINGLE_OPEN_INVENTORY   equ $11
JINGLE_CLOSE_INVENTORY  equ $12
JINGLE_VALIDATE         equ $13
JINGLE_GOT_HEART        equ $14
JINGLE_DIALOG_BREAK     equ $15
JINGLE_SHIELD_TING      equ $16
JINGLE_GOT_POWER_UP     equ $17
JINGLE_ITEM_FALLING     equ $18
JINGLE_NEW_HEART        equ $19
JINGLE_FAIRY_HEALING    equ $1A
JINGLE_CLEAR_MIDBOSS    equ $1B
JINGLE_MIDBOSS_WARP     equ $1C
JINGLE_WRONG_ANSWER     equ $1D
JINGLE_FOREST_LOST      equ $1E
JINGLE_ENEMY_MORPH_OUT  equ $1F
JINGLE_BIG_BUMP         equ $20
JINGLE_SEAGULL          equ $21
JINGLE_HONEYCOMB        equ $22
JINGLE_DUNGEON_OPENED   equ $23
JINGLE_JUMP             equ $24
JINGLE_OVERWORLD_WARP   equ $25
JINGLE_DISAPPEAR        equ $26 ;great fairies + owl at the end of the game
JINGLE_WALRUS           equ $27
JINGLE_MASTER_STALFOS   equ $28
JINGLE_SLIME_EEL_PULL   equ $29
JINGLE_DODONGO_EAT_BOMB equ $2A
JINGLE_INSTRUMENT_WARP  equ $2B
JINGLE_MANBO_WARP       equ $2C
JINGLE_GHOST_PRESENCE   equ $2D
JINGLE_EAGLE_TOWER_OPEN equ $2E
JINGLE_POOF             equ $2F
JINGLE_EVIL_EAGLE       equ $30
JINGLE_GRIM_CREEPER     equ $31
JINGLE_HOT_HEAD_SPLASH  equ $32
JINGLE_BLAINO_PUNCH     equ $33
JINGLE_SHOW_INSTRUMENTS equ $34 ;during credits
JINGLE_SHADOW_NEXT      equ $35
JINGLE_SHADOW_2_DEFEAT  equ $36
JINGLE_SHADOW_1_HURT    equ $37
JINGLE_SHADOW_3_BG      equ $38
JINGLE_SHADOW_4_INTRO   equ $39
JINGLE_UNKNOWN_3A       equ $3A
JINGLE_SWORD_BEAM       equ $3B
JINGLE_ENEMY_SHRIEK     equ $3C
JINGLE_SHADOW_6_BG      equ $3D
JINGLE_URCHIN_PUSH      equ $3E ;also Hole Fillers
JINGLE_FLYING_TILE      equ $3F
JINGLE_FACADE_HOLE      equ $40
JINGLE_UNKNOWN_41       equ $41

; Values for hWaveSfx
WAVE_SFX_NONE            equ $00
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
;WAVE_SFX_UNKNOWN        equ $0D
;WAVE_SFX_UNKNOWN        equ $0E
WAVE_SFX_TYPEWRITER      equ $0F
WAVE_SFX_BOSS_AGONY      equ $10
;WAVE_SFX_UNKNOWN        equ $11
;WAVE_SFX_UNKNOWN        equ $12
WAVE_SFX_CUCCO_HURT      equ $13
;WAVE_SFX_UNKNOWN        equ $14
WAVE_SFX_OCARINA_NOSONG  equ $15    ; Off-key notes for when you have no songs available
WAVE_SFX_BOSS_HIT        equ $16
;WAVE_SFX_UNKNOWN        equ $17
WAVE_SFX_CHAIN_CHOMP     equ $18
WAVE_SFX_HOOT            equ $19
;WAVE_SFX_UNKNOWN        equ $1A
WAVE_SFX_COMPASS         equ $1B

; Values for hNoiseSfx and wActiveNoiseSfx
NOISE_SFX_NONE                    equ $00;
;NOISE_SFX_UNKNOWN                equ $01; Singular door sound, stairway?
NOISE_SFX_SWORD_A                 equ $02;
NOISE_SFX_SPIN_ATTACK             equ $03;
NOISE_SFX_DOOR_UNLOCKED           equ $04;opening of door likely
NOISE_SFX_CUT_GRASS               equ $05;
NOISE_SFX_STAIRS                  equ $06;  Also used for doorways.
NOISE_SFX_FOOTSTEP                equ $07;  Landing after jump
NOISE_SFX_POT_SMASHED             equ $09;hit/stun, perhaps pot
NOISE_SFX_SHOOT_ARROW             equ $0A;probs arrow
;NOISE_SFX_SHIELD_DEFLECT         equ $0B;shield sound but shorter
NOISE_SFX_BOMB_EXPLOSION          equ $0C; Used for the lightning sounds in the title screen intro cutscene
NOISE_SFX_MAGIC_ROD               equ $0D;electricity, but likely magic
NOISE_SFX_SHOWEL_DIG              equ $0E;digging
NOISE_SFX_SEA_WAVES               equ $0F;beach waves
NOISE_SFX_DOOR_CLOSED             equ $10;closing of door likely
NOISE_SFX_BLOCK_RUMBLE            equ $11;some rumble
NOISE_SFX_BURSTING_FLAME          equ $12;sounds like flame
NOISE_SFX_ENEMY_DESTROYED         equ $13;
NOISE_SFX_SWORD_B                 equ $14;
NOISE_SFX_SWORD_C                 equ $15;
NOISE_SFX_DRAW_SHIELD             equ $16;
;NOISE_SFX_UNKNOWN                equ $17;LVL2 shield?
NOISE_SFX_SWORD_D                 equ $18;
NOISE_SFX_TITLE_APPEARS           equ $19;probably correct
;NOISE_SFX_UNKNOWN                equ $1A
;NOISE_SFX_UNKNOWN                equ $1B
;NOISE_SFX_UNKNOWN                equ $1C
;NOISE_SFX_UNKNOWN                equ $1D
;NOISE_SFX_UNKNOWN                equ $1E
;NOISE_SFX_UNKNOWN                equ $1F
;NOISE_SFX_ELECTRICITY            equ $20;Electricity/Shopkeeper's magic
;NOISE_SFX_UNKNOWN                equ $21;silent?
;NOISE_SFX_UNKNOWN                equ $22;beach/explosion with fade out
;NOISE_SFX_UNKNOWN                equ $23;burning/explosion/rumbling
;NOISE_SFX_UNKNOWN                equ $24;beach/fire doused
;NOISE_SFX_UNKNOWN                equ $25;fire, definitely cutscene because timed hiccups
;NOISE_SFX_UNKNOWN                equ $26;more electricity
;NOISE_SFX_UNKNOWN                equ $27;breaking/fire/explosion
;NOISE_SFX_UNKNOWN                equ $28;stunned enemy?
;NOISE_SFX_UNKNOWN                equ $29;brick blocks break
NOISE_SFX_DOOR_RUMBLE             equ $2A;probably entrance opening
NOISE_SFX_ROCK_RUMBLE             equ $2B;ancient door sliding
;NOISE_SFX_UNKNOWN                equ $2C;fade out, intro?
NOISE_SFX_BOOMERANG               equ $2D;probably boomerang
;NOISE_SFX_UNKNOWN                equ $2E;burning... then small door opening
;NOISE_SFX_UNKNOWN                equ $2F;page of a book
NOISE_SFX_EAGLE_TOUCHDOWN         equ $30;probably eagle wings
NOISE_SFX_EAGLE_LIFT_UP           equ $31;also eagle probably
; entries to be added to at least $AA
