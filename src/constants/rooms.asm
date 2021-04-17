; Values for hMapRoom

;
; Overworld rooms
;

ROOM_OW_RIGHT_OF_EGG                     equ $07
ROOM_OW_MARIN_BRIDGE                     equ $08
ROOM_OW_EAGLE_TOWER                      equ $0E

ROOM_SECTION_OW_SOUTH_OF_TAL_TAL_HEIGHTS equ $20

ROOM_OW_CAMERA_SHOP                      equ $37

ROOM_SECTION_OW_GHOST_TRIGGER            equ $40

ROOM_OW_KANALET_CASTLE_CROW              equ $58
ROOM_OW_KANALET_CASTLE_FIVE_PITS         equ $5A

ROOM_OW_ANGLERS_TUNNEL                   equ $69

ROOM_OW_COLOR_DUNGEON_ENTRANCE           equ $77
ROOM_OW_KANALET_MOAT                     equ $78
MOUNTAIN_CAVE_ROOM_1                     equ $7A
MOUNTAIN_CAVE_ROOM_2                     equ $7B
MOUNTAIN_CAVE_ROOM_3                     equ $7C ; is also Side-view room where the key drops ? double use ?
MOUNTAIN_CAVE_ROOM_4                     equ $7D

ROOM_SECTION_OW_SECOND_HALF              equ $80
ROOM_OW_FACE_SHRINE_ENTRANCE             equ $8C

ROOM_OW_GIANT_SKULL                      equ $97

ROOM_OW_ULRIRA_HOUSE                     equ $B1

ROOM_SECTION_OW_VILLAGES                 equ $C0
ROOM_OW_POTHOLE_FIELD_SLIME_KEY          equ $C6
ROOM_OW_YARNA_LANMOLA                    equ $CE

ROOM_OW_BEACH_WITH_SWORD                 equ $F2

;
; Indoor A rooms
;

ROOM_INDOOR_A_MASTER_STALFOS_FINAL       equ $80
ROOM_INDOOR_A_MASTER_STALFOS_3           equ $84

ROOM_INDOOR_A_MASTER_STALFOS_2           equ $92
ROOM_INDOOR_A_MASTER_STALFOS_1           equ $95

ROOM_INDOOR_A_WATER_HOLE                 equ $A3

ROOM_INDOOR_A_POWER_BRACELET_LV2         equ $CE

ROOM_INDOOR_A_WATER_FLOODED_GROTTO       equ $F2
ROOM_INDOOR_A_GORIYA                     equ $F5
ROOM_INDOOR_A_QUICKSAND_CAVE             equ $F8

;
; Indoor B rooms
;

ROOM_INDOOR_B_SHIELD_LV2                 equ $1A

ROOM_INDOOR_B_97                         equ $97
ROOM_INDOOR_B_98                         equ $98

ROOM_INDOOR_B_MARIN_HOUSE                equ $A3
ROOM_INDOOR_B_MRS_MEOW_MEOW              equ $A7

ROOM_INDOOR_B_FISHING_MINIGAME           equ $B1
ROOM_INDOOR_B_CAMERA_SHOP                equ $B5

ROOM_INDOOR_B_SCHULE_HOUSE               equ $DD

ROOM_INDOOR_B_EAGLE_TOWER_BOSS           equ $E8
ROOM_INDOOR_B_SEASHELL_MANSION           equ $E9

ROOM_INDOOR_B_FISHERMAN_UNDER_BRIDGE     equ $F5
ROOM_INDOOR_B_MANBO                      equ $FD

;
; Unlabeled rooms
;
; TODO: sort them into Overworld/Indoor A/Indoor B, and label them.
; See docs/rooms.png to help identification
;

UNKNOWN_ROOM_00                          equ $00
UNKNOWN_ROOM_01                          equ $01
UNKNOWN_ROOM_03                          equ $03
UNKNOWN_ROOM_04                          equ $04
UNKNOWN_ROOM_05                          equ $05
UNKNOWN_ROOM_06                          equ $06
UNKNOWN_ROOM_0A                          equ $0A
UNKNOWN_ROOM_0C                          equ $0C ; Tal-Tal Heights, 1N1E of the drainable water above Angler's Tunnel
UNKNOWN_ROOM_0D                          equ $0D

UNKNOWN_ROOM_11                          equ $11
UNKNOWN_ROOM_12                          equ $12
UNKNOWN_ROOM_16                          equ $16 ; One south of Wind Fish's Egg
UNKNOWN_ROOM_17                          equ $17 ; One south-east of Wind Fish's Egg
UNKNOWN_ROOM_1B                          equ $1B ; The drainable water above Angler's Tunnel
UNKNOWN_ROOM_1C                          equ $1C
UNKNOWN_ROOM_1E                          equ $1E

UNKNOWN_ROOM_24                          equ $24
UNKNOWN_ROOM_28                          equ $28
UNKNOWN_ROOM_29                          equ $29
UNKNOWN_ROOM_2B                          equ $2B
UNKNOWN_ROOM_2C                          equ $2C
UNKNOWN_ROOM_2F                          equ $2F

UNKNOWN_ROOM_32                          equ $32
UNKNOWN_ROOM_33                          equ $33
UNKNOWN_ROOM_36                          equ $36 ; 1 room east of Moblin Hideout
UNKNOWN_ROOM_3A                          equ $3A ; Overworld room with... no seashell?
UNKNOWN_ROOM_3B                          equ $3B
UNKNOWN_ROOM_3C                          equ $3C
UNKNOWN_ROOM_3D                          equ $3D
UNKNOWN_ROOM_3E                          equ $3E ; area for entering river rapids ?
UNKNOWN_ROOM_3F                          equ $3F

UNKNOWN_ROOM_40                          equ $40
UNKNOWN_ROOM_41                          equ $41 ; Tail Cave key chest
UNKNOWN_ROOM_45                          equ $45
UNKNOWN_ROOM_47                          equ $47
UNKNOWN_ROOM_4A                          equ $4A

UNKNOWN_ROOM_52                          equ $52
UNKNOWN_ROOM_53                          equ $53
UNKNOWN_ROOM_54                          equ $54
UNKNOWN_ROOM_5D                          equ $5D

UNKNOWN_ROOM_63                          equ $63
UNKNOWN_ROOM_64                          equ $64 ; maybe map screen where you take the ghost after the house
UNKNOWN_ROOM_65                          equ $65
UNKNOWN_ROOM_66                          equ $66
UNKNOWN_ROOM_67                          equ $67
UNKNOWN_ROOM_6A                          equ $6A
UNKNOWN_ROOM_6B                          equ $6B
UNKNOWN_ROOM_6F                          equ $6F

UNKNOWN_ROOM_71                          equ $71 ; egg room of wind fish?
UNKNOWN_ROOM_74                          equ $74 ; Overworld room one south of ghost's gravestone (w/zombies)
UNKNOWN_ROOM_75                          equ $75
UNKNOWN_ROOM_79                          equ $79
UNKNOWN_ROOM_7F                          equ $7F

UNKNOWN_ROOM_80                          equ $80 ; Mysterious Forest enterance from Mabe ?, Master Stalfos final room ?, could also be both
UNKNOWN_ROOM_83                          equ $83
UNKNOWN_ROOM_8A                          equ $8A
UNKNOWN_ROOM_8B                          equ $8B
UNKNOWN_ROOM_8D                          equ $8D
UNKNOWN_ROOM_8F                          equ $8F

UNKNOWN_ROOM_92                          equ $92
UNKNOWN_ROOM_93                          equ $93
UNKNOWN_ROOM_95                          equ $95
UNKNOWN_ROOM_96                          equ $96 ; Master Stalfos "screw you" letter chest ?
UNKNOWN_ROOM_98                          equ $98
UNKNOWN_ROOM_9A                          equ $9A
UNKNOWN_ROOM_9C                          equ $9C ; One south of Face Shrine dungeon
UNKNOWN_ROOM_9D                          equ $9D ; Room with staircase leading to Face Shrine dungeon passage

UNKNOWN_ROOM_A0                          equ $A0
UNKNOWN_ROOM_A1                          equ $A1
UNKNOWN_ROOM_A4                          equ $A4 ; 1 east of Mabe's big bush field
UNKNOWN_ROOM_A5                          equ $A5 ; Overworld room two east of Mabe bush field
UNKNOWN_ROOM_A8                          equ $A8 ; Overworld room northeast-ish of Pothole Field, Mr. Write's house
UNKNOWN_ROOM_A9                          equ $A9 ; Ulrira's house
UNKNOWN_ROOM_AA                          equ $AA
UNKNOWN_ROOM_AC                          equ $AC ; Southern Face Shrine

UNKNOWN_ROOM_B2                          equ $B2 ; Overworld room - Mabe village telephone booth (...no seashell???), Inside the dog house ?
UNKNOWN_ROOM_B4                          equ $B4 ; starting room ?
UNKNOWN_ROOM_B6                          equ $B6 ; One east of Key Cavern
UNKNOWN_ROOM_BB                          equ $BB
UNKNOWN_ROOM_BE                          equ $BE

UNKNOWN_ROOM_C0                          equ $C0
UNKNOWN_ROOM_C1                          equ $C1
UNKNOWN_ROOM_C3                          equ $C3
UNKNOWN_ROOM_C4                          equ $C4
UNKNOWN_ROOM_C5                          equ $C5

UNKNOWN_ROOM_C7                          equ $C7 ; Richard's Villa ?
UNKNOWN_ROOM_C9                          equ $C9
UNKNOWN_ROOM_CC                          equ $CC
UNKNOWN_ROOM_CD                          equ $CD
UNKNOWN_ROOM_CF                          equ $CF

UNKNOWN_ROOM_D2                          equ $D2 ; 1 west of Tail Cave
UNKNOWN_ROOM_D3                          equ $D3
UNKNOWN_ROOM_D4                          equ $D4
UNKNOWN_ROOM_D5                          equ $D5
UNKNOWN_ROOM_D7                          equ $D7
UNKNOWN_ROOM_D9                          equ $D9
UNKNOWN_ROOM_DA                          equ $DA ; Overworld room one north of fisherman under bridge
UNKNOWN_ROOM_DE                          equ $DE
UNKNOWN_ROOM_DF                          equ $DF

UNKNOWN_ROOM_E0                          equ $E0
UNKNOWN_ROOM_E1                          equ $E1
UNKNOWN_ROOM_E2                          equ $E2
UNKNOWN_ROOM_E3                          equ $E3 ; House by the Bay -> indoor or overworld?
UNKNOWN_ROOM_E4                          equ $E4
UNKNOWN_ROOM_EA                          equ $EA
UNKNOWN_ROOM_EB                          equ $EB
UNKNOWN_ROOM_EC                          equ $EC
UNKNOWN_ROOM_EE                          equ $EE ; Yarna Desert
UNKNOWN_ROOM_EF                          equ $EF

UNKNOWN_ROOM_F0                          equ $F0
UNKNOWN_ROOM_F4                          equ $F4
UNKNOWN_ROOM_F6                          equ $F6 ; ghost jingle is played in this room
UNKNOWN_ROOM_F8                          equ $F8
UNKNOWN_ROOM_FA                          equ $FA
UNKNOWN_ROOM_FD                          equ $FD
UNKNOWN_ROOM_FE                          equ $FE
UNKNOWN_ROOM_FF                          equ $FF
