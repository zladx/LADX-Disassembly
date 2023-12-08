; Mask for extracting the trigger from the event
def EVENT_TRIGGER_MASK equ $1F
; Mask to extract the effect from the event
def EVENT_EFFECT_MASK  equ $E0

def TRIGGER_NONE                 equ $00
def TRIGGER_KILL_ALL_ENEMIES     equ $01
def TRIGGER_PUSH_SINGLE_BLOCK    equ $02 ; Push a single block (tile 0xA7).
def TRIGGER_STEP_ON_BUTTON       equ $03 ; can only used once per dungeon
;TRIGGER_UNKNOWN             equ $04 ; found at the end of the Color Dungeon with the fairy
def TRIGGER_LIGHT_TORCHES        equ $05 ; light two torches
def TRIGGER_KILL_IN_ORDER        equ $06 ; Kill enemies in order of their sprite/object ID (after killing three enemies, the ID is triggered. This is the Pols Voice/Keese/Stalfos puzzle from Bottle Grotto).
def TRIGGER_PUSH_BLOCKS          equ $07 ; Push 2 blocks together. They don't both have to be tile A7 (meaning you don't have to push both), but their final position must be horizontal.
def TRIGGER_KILL_SPECIALS        equ $08 ; Kill all "special" enemies (normally can't be killed).
def TRIGGER_SOLVE_GLOWING_TILES  equ $09 ; This is the five-tile puzzle from Lv.4/Angler's Tunnel.
def TRIGGER_KILL_SIDESCROLL_BOSS equ $0A ; Kill either Angler Fish (Level 4 boss) or Evil Eagle (Level 7 boss).
def TRIGGER_THROW_AT_DOOR        equ $0B ; Throw something at a shut door.
def TRIGGER_HORSE_HEADS          equ $0C ; Get both horse heads (sprite 0x98) to stand up.
def TRIGGER_THROW_POT_AT_CHEST   equ $0D ; Throw a pot at a chest in position 23 to open it and obtain the Nightmare Key
def TRIGGER_FILL_LAVA_GAPS       equ $0E ; Fill in the gaps with that rolling thing from Turtle Rock (sprite 0xB1).
def TRIGGER_SHOOT_STATUE_EYE     equ $0F ; Shoot an arrow at the eye of a statue (tile 0xC0). You can have as many statues as you want; shooting any of them will work.
def TRIGGER_ANSWER_TUNICS        equ $10 ; Answer the questions of the skeletons about their tunics colors. Only works on a room id $12.

def EFFECT_NONE              equ $00
def EFFECT_OPEN_LOCKED_DOORS equ $20
def EFFECT_KILL_ALL_ENEMIES  equ $40
def EFFECT_REVEAL_CHEST      equ $60
def EFFECT_DROP_KEY          equ $80
def EFFECT_REVEAL_STAIRWAY   equ $A0
def EFFECT_CLEAR_MIDBOSS     equ $C0
def EFFECT_DROP_FAIRY        equ $E0
