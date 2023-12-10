; Mask for extracting the trigger from the event
DEF EVENT_TRIGGER_MASK EQU $1F
; Mask to extract the effect from the event
DEF EVENT_EFFECT_MASK  EQU $E0

DEF TRIGGER_NONE                 EQU $00
DEF TRIGGER_KILL_ALL_ENEMIES     EQU $01
DEF TRIGGER_PUSH_SINGLE_BLOCK    EQU $02 ; Push a single block (tile 0xA7).
DEF TRIGGER_STEP_ON_BUTTON       EQU $03 ; can only used once per dungeon
;TRIGGER_UNKNOWN             EQU $04 ; found at the end of the Color Dungeon with the fairy
DEF TRIGGER_LIGHT_TORCHES        EQU $05 ; light two torches
DEF TRIGGER_KILL_IN_ORDER        EQU $06 ; Kill enemies in order of their sprite/object ID (after killing three enemies, the ID is triggered. This is the Pols Voice/Keese/Stalfos puzzle from Bottle Grotto).
DEF TRIGGER_PUSH_BLOCKS          EQU $07 ; Push 2 blocks together. They don't both have to be tile A7 (meaning you don't have to push both), but their final position must be horizontal.
DEF TRIGGER_KILL_SPECIALS        EQU $08 ; Kill all "special" enemies (normally can't be killed).
DEF TRIGGER_SOLVE_GLOWING_TILES  EQU $09 ; This is the five-tile puzzle from Lv.4/Angler's Tunnel.
DEF TRIGGER_KILL_SIDESCROLL_BOSS EQU $0A ; Kill either Angler Fish (Level 4 boss) or Evil Eagle (Level 7 boss).
DEF TRIGGER_THROW_AT_DOOR        EQU $0B ; Throw something at a shut door.
DEF TRIGGER_HORSE_HEADS          EQU $0C ; Get both horse heads (sprite 0x98) to stand up.
DEF TRIGGER_THROW_POT_AT_CHEST   EQU $0D ; Throw a pot at a chest in position 23 to open it and obtain the Nightmare Key
DEF TRIGGER_FILL_LAVA_GAPS       EQU $0E ; Fill in the gaps with that rolling thing from Turtle Rock (sprite 0xB1).
DEF TRIGGER_SHOOT_STATUE_EYE     EQU $0F ; Shoot an arrow at the eye of a statue (tile 0xC0). You can have as many statues as you want; shooting any of them will work.
DEF TRIGGER_ANSWER_TUNICS        EQU $10 ; Answer the questions of the skeletons about their tunics colors. Only works on a room id $12.

DEF EFFECT_NONE              EQU $00
DEF EFFECT_OPEN_LOCKED_DOORS EQU $20
DEF EFFECT_KILL_ALL_ENEMIES  EQU $40
DEF EFFECT_REVEAL_CHEST      EQU $60
DEF EFFECT_DROP_KEY          EQU $80
DEF EFFECT_REVEAL_STAIRWAY   EQU $A0
DEF EFFECT_CLEAR_MIDBOSS     EQU $C0
DEF EFFECT_DROP_FAIRY        EQU $E0
