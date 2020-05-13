;
; Constants for audio effects

; Values for wMusicTrackToPlay
 
MUSIC_NONE                                      equ $00 ; This value means: Don't play a different track.
MUSIC_TITLE_SCREEN_INTRODUCTION                 equ $01	; $0D's introduction section.
MUSIC_TRENDY_GAME                               equ $02
MUSIC_GAME_OVER                                 equ $03
MUSIC_MABE_VILLAGE                              equ $04
MUSIC_OVERWORLD                                 equ $05
MUSIC_MT_TAMARANCH                              equ $06	; Also Tal Tal Heights.
MUSIC_WITCH_HUT                                 equ $07	; Also used in the shop.
MUSIC_RAFT_RIDE_RAPIDS                          equ $08
MUSIC_MYSTERIOUS_FOREST                         equ $09
MUSIC_HOUSE                                     equ $0A	; Inside regular houses.
MUSIC_ANIMAL_VILLAGE                            equ $0B
MUSIC_FAIRY_FOUNTAIN                            equ $0C
MUSIC_TITLE_SCREEN                              equ $0D	; Plays when $01 has finished.
MUSIC_BOWWOW_KIDNAPPED                          equ $0E	; Plays when $3E has finished.
MUSIC_SWORD_ACQUIRED                            equ $0F ; Plays when you retrieve your sword on the beach.
MUSIC_TOOL_ACQUIRED                             equ $10
MUSIC_FILE_SELECT                               equ $11
MUSIC_EGG_MAZE                                  equ $12
MUSIC_KANALET_CASTLE                            equ $13
MUSIC_TAIL_CAVE                                 equ $14
MUSIC_BOTTLE_GROTTO                             equ $15
MUSIC_KEY_CAVERN                                equ $16
MUSIC_ANGLERS_TUNNEL                            equ $17
MUSIC_BOSS_DEFEATED                             equ $18	; Plays in boss rooms after the boss has been defeated.
MUSIC_BOSS_BATTLE                               equ $19
MUSIC_INTRO_CUTSCENE                            equ $1A
MUSIC_INSTRUMENT_ACQUIRED                       equ $1B
MUSIC_LINK_AWAKENS                              equ $1C	; Played in the house when you begin your game.
MUSIC_SWORD_SEARCH                              equ $1D	; First time on Koholint Island.
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
MUSIC_MANBO_MAMBO                               equ $30
MUSIC_OVERWORLD_INTRODUCTION                    equ $31	; Heroic introduction before $05. It only plays once; after retrieving your sword on the shore.
MUSIC_MR_WRITE_HOUSE                            equ $32
MUSIC_PHONE_BOOTH                               equ $33	; Also used in Ulrira's house.
MUSIC_TARIN_BEEHIVE                             equ $34 ; Used for Tarin's beehive cutscene.
MUSIC_MAMU_SONG                                 equ $35
MUSIC_MONKEYS_BUILDING_BRIDGE                   equ $36
MUSIC_CHRISTINE_HOUSE                           equ $37
MUSIC_TOTAKA_SONG                               equ $38	; Totaka's Song. Similar to the one played in Richard's mansion. Does not init instrument bank. Missing drums at the beginning. Perhaps the song parameters are modified in realtime, causing the change in instrument, rhythm, and note pitch? 
MUSIC_TURTLE_ROCK_ENTRANCE_BOSS                 equ $39
MUSIC_FISHING_UNDER_BRIDGE                      equ $3A ; The fishing pond plays $02 during the fishing minigame. This is a different fishing minigame.
;MUSIC_RECEIVED_ITEM                            equ $3B	; short item jingle IT IS THE CLASSIC LEGEND OF ZELDA ONE SO COLOR DUNGEON PERHAPS?
MUSIC_TOTAKEKE_NICKNAME_EASTER_EGG              equ $3C	; とたけけ nickname easter egg. Unused in EU/US versions. Similar to $60
MUSIC_ENDING                                    equ $3D	; During ending cutscene. Silence, then music. Plays staff roll theme when finished.
MUSIC_BOWWOW_KIDNAPPED_INTRODUCTION             equ $3E ; Plays during kidnapping related dialog and in the Moblin hideout.
MUSIC_WIND_FISH_AWAKENS                         equ $3F	; Plays during cutscene after defeating the final boss
MUSIC_RICHARD_MANSION                           equ $40
;MUSIC_UNKNOWN_BOTWF                            equ $41	; ballad of the wind fish, on horn and flute-like instruments.
;MUSIC_UNKNOWN_BOTWF                            equ $42	; ballad of the wind fish, has added marimba motif. more voices than $41
;MUSIC_UNKNOWN_BOTWF                            equ $43	; ballad of the wind fish, piano, more voices than $42
;MUSIC_UNKNOWN_BOTWF                            equ $44	; ballad of the wind fish, has high pitched ting. more voices than $43
;MUSIC_UNKNOWN_BOTWF                            equ $45	; ballad of the wind fish, has triangle rhythm. more voices than $44
;MUSIC_UNKNOWN_BOTWF                            equ $46	; ballad of the wind fish, has added horn. more voices than $45
;MUSIC_UNKNOWN_BOTWF                            equ $47	; ballad of the wind fish, drums, high ting. awakening tracks are not well described.
MUSIC_GHOST_HOUSE                               equ $48
MUSIC_ACTIVE_POWER_UP                           equ $49
MUSIC_LINK_MARIN_DUET                           equ $4A
MUSIC_CATFISH_MAW                               equ $4B
MUSIC_WATERFALL_DRAIN                           equ $4C ; Plays when you open the lock for the Angler's Tunnel.
MUSIC_MARIN_BEACH_TRANSITION                    equ $4D	; Plays during the fade to white, between the top-down view and the scenic view of Link and Marin sitting at the beach. The beginning is not used, as well for a couple of notes at the end.
MUSIC_MARIN_BEACH                               equ $4E
;MUSIC_UNKNOWN                                  equ $4F	; item jingle
MUSIC_MINIBOSS                                  equ $50
MUSIC_KANALET_CASTLE_COPY                       equ $51	; Copy of $13.
MUSIC_TAIL_CAVE_COPY                            equ $52	; Copy of $14.
MUSIC_DREAM_SHRINE                              equ $53
MUSIC_EAGLES_TOWER_BOSS_CUTSCENE                equ $54	; Plays when the boss comes into view. Switches to $19.
MUSIC_FLYING_ROOSTER_REVIVED                    equ $55
MUSIC_SEASHELL_MANSION_SPIRIT                   equ $56	; Plays $55 afterwards. Possibly left unused for resurrecting the rooster?
MUSIC_CUCCO_HOUSE                               equ $57
MUSIC_FACE_SHRINE                               equ $58
MUSIC_MEETING_WINDFISH                          equ $59	; When you climb the staircase and meet the Wind Fish.
MUSIC_TURTLE_ROCK                               equ $5A
MUSIC_EAGLE_TOWER                               equ $5B
MUSIC_GRIM_CREEPER_DIALOG                       equ $5C	; Plays during Grim Creeper's dialog before the boss. Switches to $54 after the dialog.
MUSIC_FINAL_BOSS_DIALOG                         equ $5D	; Plays during the final boss' dialog.
MUSIC_BOSS_WARNING                              equ $5E	; Plays during the dialogs where the bosses tell you not to wake the Wind Fish.
MUSIC_FINAL_BOSS_DEFEATED                       equ $5F
MUSIC_ZELDA_NICKNAME_EASTER_EGG                 equ $60	; ZELDA nickname easter egg.
MUSIC_COLOR_DUNGEON                             equ $61
;MUSIC_COLOR_DUNGEON_COPIES                     equ $62 to 6F	; Same as $61	
;MUSIC_GLITCHED                                 equ $70 to $FE	; Glitches the music that played before it.
MUSIC_SILENCE                                   equ $FF	; Seems to try to silence the voice channels. Does not always correctly silence the music. 

; Values for hJingle
JINGLE_NONE             equ $00;
JINGLE_TREASURE_FOUND   equ $01;treasure
JINGLE_PUZZLE_SOLVED    equ $02;
JINGLE_BOW_WOW_CHOMP    equ $03;damage
JINGLE_CHARGING_SWORD   equ $04;
JINGLE_POWDER           equ $05;powder
JINGlE_ENNEMY_MORPH_IN  equ $06;mario mushroom
JINGLE_SWORD_POKING     equ $07
JINGLE_JUMP_DOWN        equ $08
JINGLE_BUMP             equ $09
JINGLE_MOVE_SELECTION   equ $0A
JINGLE_HUGE_BUMP        equ $0B;huge bump
JINGLE_REVOLVING_DOOR   equ $0C
JINGLE_FEATHER_JUMP     equ $0D
JINGLE_WATER_DIVE       equ $0E
;JINGLE_UNKNOWN         equ $0F
;JINGLE_UNKNOWN         equ $10
JINGLE_OPEN_INVENTORY   equ $11
JINGLE_CLOSE_INVENTORY  equ $12
JINGLE_VALIDATE         equ $13
JINGLE_GOT_HEART        equ $14
JINGLE_DIALOG_BREAK     equ $15
JINGLE_SHIELD_TING      equ $16
JINGLE_GOT_POWER_UP     equ $17
JINGLE_ITEM_FALLING     equ $18
JINGLE_NEW_HEART        equ $19
;JINGLE_UNKNOWN         equ $1A
;JINGLE_UNKNOWN         equ $1B
;JINGLE_UNKNOWN         equ $1C
JINGLE_WRONG_ANSWER     equ $1D
JINGLE_FOREST_LOST      equ $1E
JINGLE_ENNEMY_MORPH_OUT equ $1F
JINGLE_BIG_BUMP         equ $20
JINGLE_SEAGULL          equ $21
JINGLE_DUNGEON_OPENED   equ $23
JINGLE_JUMP             equ $24
;JINGLE_UNKNOWN         equ $25
;JINGLE_UNKNOWN         equ $26
;JINGLE_UNKNOWN         equ $27
;JINGLE_UNKNOWN         equ $28
;JINGLE_UNKNOWN         equ $29
;JINGLE_UNKNOWN         equ $2A
JINGLE_INSTRUMENT_WARP  equ $2B
JINGLE_MANBO_WARP       equ $2C
JINGLE_GHOST_PRESENCE   equ $2D
;JINGLE_UNKNOWN         equ $2E
;JINGLE_UNKNOWN         equ $2F
;JINGLE_UNKNOWN         equ $30
;JINGLE_UNKNOWN         equ $31
;JINGLE_UNKNOWN         equ $32
;JINGLE_UNKNOWN         equ $33
;JINGLE_UNKNOWN         equ $34
;JINGLE_UNKNOWN         equ $35
;JINGLE_UNKNOWN         equ $36
;JINGLE_UNKNOWN         equ $37
;JINGLE_UNKNOWN         equ $38
;JINGLE_UNKNOWN         equ $39
;JINGLE_UNKNOWN         equ $3A
;JINGLE_UNKNOWN         equ $2B
JINGLE_ENNEMY_SHRIEK    equ $3C

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
WAVE_SFX_OCARINA_NOSONG  equ $15	; Off-key notes for when you have no songs available
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
NOISE_SFX_STAIRS                  equ $06;	Also used for doorways.
NOISE_SFX_FOOTSTEP                equ $07;	Landing after jump
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