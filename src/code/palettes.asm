; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

; Copy object or background palettes to the hardware palette data
CopyPalettesToVRAM::
    ld   a, [wPaletteDataFlags]                   ;; 21:4000 $FA $D1 $DD
    and  a                                        ;; 21:4003 $A7
    ret  z                                        ;; 21:4004 $C8

    bit  7, a                                     ;; 21:4005 $CB $7F
    jr   nz, jr_021_402B                          ;; 21:4007 $20 $22

    and  $01                                      ;; 21:4009 $E6 $01
    jr   z, .jr_4016                              ;; 21:400B $28 $09

    ld   hl, wBGPal1                              ;; 21:400D $21 $10 $DC
    ld   de, rBCPS                                ;; 21:4010 $11 $68 $FF
    call func_021_4062                            ;; 21:4013 $CD $62 $40

.jr_4016
    ld   a, [wPaletteDataFlags]                   ;; 21:4016 $FA $D1 $DD
    and  $02                                      ;; 21:4019 $E6 $02
    jr   z, .jr_4026                              ;; 21:401B $28 $09

    ld   hl, wObjPal1                             ;; 21:401D $21 $50 $DC
    ld   de, rOCPS                                ;; 21:4020 $11 $6A $FF
    call func_021_4062                            ;; 21:4023 $CD $62 $40

.jr_4026
    xor  a                                        ;; 21:4026 $AF
    ld   [wPaletteDataFlags], a                   ;; 21:4027 $EA $D1 $DD
    ret                                           ;; 21:402A $C9

jr_021_402B:
    ld   a, $80                                   ;; 21:402B $3E $80
    ld   hl, wPalettePartialCopyColorIndexStart   ;; 21:402D $21 $D3 $DD
    ld   e, [hl]                                  ;; 21:4030 $5E
    sla  e                                        ;; 21:4031 $CB $23
    or   e                                        ;; 21:4033 $B3
    ld   b, a                                     ;; 21:4034 $47
    ld   a, [wPaletteDataFlags]                   ;; 21:4035 $FA $D1 $DD
    and  $01                                      ;; 21:4038 $E6 $01
    ld   a, b                                     ;; 21:403A $78
    jr   z, .jr_4047                              ;; 21:403B $28 $0A

    ldh  [rBCPS], a                               ;; 21:403D $E0 $68
    ld   bc, rBGPD                                ;; 21:403F $01 $69 $FF
    ld   hl, wBGPal1                              ;; 21:4042 $21 $10 $DC
    jr   jr_021_404F                              ;; 21:4045 $18 $08

.jr_4047
    ldh  [rOCPS], a                               ;; 21:4047 $E0 $6A
    ld   bc, rOBPD                                ;; 21:4049 $01 $6B $FF
    ld   hl, wObjPal1                             ;; 21:404C $21 $50 $DC

jr_021_404F:
    ld   d, $00                                   ;; 21:404F $16 $00
    add  hl, de                                   ;; 21:4051 $19
    ld   e, c                                     ;; 21:4052 $59
    ld   d, b                                     ;; 21:4053 $50
    ld   a, [wPalettePartialCopyColorCount]       ;; 21:4054 $FA $D4 $DD
    sla  a                                        ;; 21:4057 $CB $27
    ld   b, a                                     ;; 21:4059 $47
    call func_021_4068                            ;; 21:405A $CD $68 $40
    xor  a                                        ;; 21:405D $AF
    ld   [wPaletteDataFlags], a                   ;; 21:405E $EA $D1 $DD
    ret                                           ;; 21:4061 $C9

func_021_4062::
    ld   b, $40                                   ;; 21:4062 $06 $40
    ld   a, $80                                   ;; 21:4064 $3E $80
    ld   [de], a                                  ;; 21:4066 $12
    inc  de                                       ;; 21:4067 $13

func_021_4068::
.loop_4068
    ld   a, [hl+]                                 ;; 21:4068 $2A
    ld   [de], a                                  ;; 21:4069 $12
    dec  b                                        ;; 21:406A $05
    jr   nz, .loop_4068                           ;; 21:406B $20 $FB

    ret                                           ;; 21:406D $C9

LoadPaletteForTilemap::
    ld   a, [wPaletteToLoadForTileMap]            ;; 21:406E $FA $D2 $DD
    and  a                                        ;; 21:4071 $A7
    ret  z                                        ;; 21:4072 $C8

    bit  7, a                                     ;; 21:4073 $CB $7F
    jp   nz, label_021_425E                       ;; 21:4075 $C2 $5E $42

    ld   hl, Data_021_74F0                        ;; 21:4078 $21 $F0 $74
    ld   b, $00                                   ;; 21:407B $06 $00
    dec  a                                        ;; 21:407D $3D
    sla  a                                        ;; 21:407E $CB $27
    ld   c, a                                     ;; 21:4080 $4F
    add  hl, bc                                   ;; 21:4081 $09
    ld   a, [hl+]                                 ;; 21:4082 $2A
    ld   c, a                                     ;; 21:4083 $4F
    ld   b, [hl]                                  ;; 21:4084 $46
    or   b                                        ;; 21:4085 $B0
    jr   z, jr_021_40AE                           ;; 21:4086 $28 $26

    ld   h, b                                     ;; 21:4088 $60
    ld   l, c                                     ;; 21:4089 $69
    ld   de, wBGPal1                              ;; 21:408A $11 $10 $DC
    ld   bc, $80                                  ;; 21:408D $01 $80 $00
    ld   a, [wPaletteUnknownE]                    ;; 21:4090 $FA $D5 $DD
    and  a                                        ;; 21:4093 $A7
    jr   nz, .jr_409F                             ;; 21:4094 $20 $09

    push bc                                       ;; 21:4096 $C5
    push de                                       ;; 21:4097 $D5
    push hl                                       ;; 21:4098 $E5
    call CopyData                                 ;; 21:4099 $CD $14 $29
    pop  hl                                       ;; 21:409C $E1
    pop  de                                       ;; 21:409D $D1
    pop  bc                                       ;; 21:409E $C1

.jr_409F
    ld   a, $02                                   ;; 21:409F $3E $02
    ldh  [rSVBK], a                               ;; 21:40A1 $E0 $70
    call CopyData                                 ;; 21:40A3 $CD $14 $29
    xor  a                                        ;; 21:40A6 $AF
    ldh  [rSVBK], a                               ;; 21:40A7 $E0 $70
    ld   a, $03                                   ;; 21:40A9 $3E $03
    ld   [wPaletteDataFlags], a                   ;; 21:40AB $EA $D1 $DD

jr_021_40AE:
    xor  a                                        ;; 21:40AE $AF
    ld   [wPaletteToLoadForTileMap], a            ;; 21:40AF $EA $D2 $DD
    ret                                           ;; 21:40B2 $C9

LoadRoomPalettes::
    call func_021_5185                            ;; 21:40B3 $CD $85 $51
    ld   a, [wPaletteDataFlags]                   ;; 21:40B6 $FA $D1 $DD
    ld   b, a                                     ;; 21:40B9 $47
    ld   a, [wPaletteToLoadForTileMap]            ;; 21:40BA $FA $D2 $DD
    or   b                                        ;; 21:40BD $B0
    ret  nz                                       ;; 21:40BE $C0

    call func_021_5318                            ;; 21:40BF $CD $18 $53
    ld   a, [wBGPaletteTransitionEffect]          ;; 21:40C2 $FA $D6 $DD
    and  a                                        ;; 21:40C5 $A7
    ret  nz                                       ;; 21:40C6 $C0

    ld   a, [wGameplaySubtype]                    ;; 21:40C7 $FA $96 $DB
    cp   $07                                      ;; 21:40CA $FE $07
    jr   z, .jr_40D3                              ;; 21:40CC $28 $05

    ld   a, $01                                   ;; 21:40CE $3E $01
    ld   [wPaletteUnknownE], a                    ;; 21:40D0 $EA $D5 $DD

.jr_40D3
    call func_021_40DB                            ;; 21:40D3 $CD $DB $40
    xor  a                                        ;; 21:40D6 $AF
    ld   [wPaletteUnknownE], a                    ;; 21:40D7 $EA $D5 $DD
    ret                                           ;; 21:40DA $C9

func_021_40DB::
    ld   a, [wIsIndoor]                           ;; 21:40DB $FA $A5 $DB
    and  a                                        ;; 21:40DE $A7
    jr   nz, .jr_411A                             ;; 21:40DF $20 $39

    ldh  a, [hMapRoom]                            ;; 21:40E1 $F0 $F6
    ld   c, a                                     ;; 21:40E3 $4F
    ld   b, $00                                   ;; 21:40E4 $06 $00
    ld   hl, OverworldPaletteMap                  ;; 21:40E6 $21 $EF $42
    add  hl, bc                                   ;; 21:40E9 $09
    ld   a, [hl]                                  ;; 21:40EA $7E
    sla  a                                        ;; 21:40EB $CB $27
    ld   c, a                                     ;; 21:40ED $4F
    ld   hl, OverworldPalettes                    ;; 21:40EE $21 $B1 $42
    add  hl, bc                                   ;; 21:40F1 $09
    ld   a, [hl+]                                 ;; 21:40F2 $2A
    ld   b, [hl]                                  ;; 21:40F3 $46
    ld   h, b                                     ;; 21:40F4 $60
    ld   l, a                                     ;; 21:40F5 $6F
    call func_021_41B4                            ;; 21:40F6 $CD $B4 $41
    ldh  a, [hMapRoom]                            ;; 21:40F9 $F0 $F6
    cp   ROOM_OW_MABE_VILLAGE_SQUARE              ;; 21:40FB $FE $92
    ret  nz                                       ;; 21:40FD $C0

    ld   hl, wObjPal8 + 1*2                       ;; 21:40FE $21 $8A $DC
    ld   a, [Data_021_56C8 + 6]                   ;; 21:4101 $FA $CE $56
    ld   [hl+], a                                 ;; 21:4104 $22
    ld   a, [Data_021_56C8 + 7]                   ;; 21:4105 $FA $CF $56
    ld   [hl+], a                                 ;; 21:4108 $22
    ld   a, [Data_021_56C8 + 2]                   ;; 21:4109 $FA $CA $56
    ld   [hl+], a                                 ;; 21:410C $22
    ld   a, [Data_021_56C8 + 3]                   ;; 21:410D $FA $CB $56
    ld   [hl+], a                                 ;; 21:4110 $22
    ld   a, [Data_021_56C8]                       ;; 21:4111 $FA $C8 $56
    ld   [hl+], a                                 ;; 21:4114 $22
    ld   a, [Data_021_56C8 + 1]                   ;; 21:4115 $FA $C9 $56
    ld   [hl], a                                  ;; 21:4118 $77
    ret                                           ;; 21:4119 $C9

.jr_411A
    ld   a, [wRoomTransitionDirection]            ;; 21:411A $FA $25 $C1
    cp   $04                                      ;; 21:411D $FE $04
    ret  nz                                       ;; 21:411F $C0

    ldh  a, [hMapId]                              ;; 21:4120 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 21:4122 $FE $FF
    jr   nz, .jr_412C                             ;; 21:4124 $20 $06

    ld   hl, ColorDungeonPalette                  ;; 21:4126 $21 $D0 $67
    jp   label_021_41B4                           ;; 21:4129 $C3 $B4 $41

.jr_412C
    cp   $0A                                      ;; 21:412C $FE $0A
    jr   nc, jr_021_416C                          ;; 21:412E $30 $3C

    sla  a                                        ;; 21:4130 $CB $27
    ld   e, a                                     ;; 21:4132 $5F
    ld   d, $00                                   ;; 21:4133 $16 $00
    ld   hl, DungeonPalettesA                     ;; 21:4135 $21 $EF $43
    ldh  a, [hIsSideScrolling]                    ;; 21:4138 $F0 $F9
    and  a                                        ;; 21:413A $A7
    jr   z, jr_021_4165                           ;; 21:413B $28 $28

    ldh  a, [hMapId]                              ;; 21:413D $F0 $F7
    cp   MAP_TURTLE_ROCK                          ;; 21:413F $FE $07
    jr   nz, jr_021_4162                          ;; 21:4141 $20 $1F

    ldh  a, [hMapRoom]                            ;; 21:4143 $F0 $F6
    cp   UNKNOWN_ROOM_64                          ;; 21:4145 $FE $64
    jr   z, .jr_415D                              ;; 21:4147 $28 $14
    cp   UNKNOWN_ROOM_65                          ;; 21:4149 $FE $65
    jr   z, .jr_415D                              ;; 21:414B $28 $10
    cp   UNKNOWN_ROOM_66                          ;; 21:414D $FE $66
    jr   z, .jr_415D                              ;; 21:414F $28 $0C
    cp   UNKNOWN_ROOM_67                          ;; 21:4151 $FE $67
    jr   z, .jr_415D                              ;; 21:4153 $28 $08
    cp   UNKNOWN_ROOM_6A                          ;; 21:4155 $FE $6A
    jr   z, .jr_415D                              ;; 21:4157 $28 $04
    cp   UNKNOWN_ROOM_6B                          ;; 21:4159 $FE $6B
    jr   nz, jr_021_4162                          ;; 21:415B $20 $05

.jr_415D
    ld   hl, Data_021_6750                        ;; 21:415D $21 $50 $67
    jr   jr_021_416A                              ;; 21:4160 $18 $08

jr_021_4162:
    ld   hl, DungeonPalettesB                     ;; 21:4162 $21 $01 $44

jr_021_4165:
    add  hl, de                                   ;; 21:4165 $19
    ld   a, [hl+]                                 ;; 21:4166 $2A
    ld   b, [hl]                                  ;; 21:4167 $46
    ld   h, b                                     ;; 21:4168 $60
    ld   l, a                                     ;; 21:4169 $6F

jr_021_416A:
    jr   jr_021_41B4                              ;; 21:416A $18 $48

jr_021_416C:
    cp   $10                                      ;; 21:416C $FE $10
    jr   nz, jr_021_4191                          ;; 21:416E $20 $21

    ldh  a, [hMapRoom]                            ;; 21:4170 $F0 $F6
    cp   ROOM_INDOOR_B_MARIN_HOUSE                ;; 21:4172 $FE $A3
    jr   nz, jr_021_4191                          ;; 21:4174 $20 $1B

    ld   a, [wTarinFlag]                          ;; 21:4176 $FA $48 $DB
    cp   $01                                      ;; 21:4179 $FE $01
    jr   z, .jr_418C                              ;; 21:417B $28 $0F

    cp   $02                                      ;; 21:417D $FE $02
    jr   z, .jr_418C                              ;; 21:417F $28 $0B

    ld   a, [wShieldLevel]                        ;; 21:4181 $FA $44 $DB
    and  a                                        ;; 21:4184 $A7
    jr   nz, jr_021_4191                          ;; 21:4185 $20 $0A

    ld   hl, Data_021_73B0                        ;; 21:4187 $21 $B0 $73
    jr   jr_021_41B4                              ;; 21:418A $18 $28

.jr_418C
    ld   hl, Data_021_74A0                        ;; 21:418C $21 $A0 $74
    jr   jr_021_41B4                              ;; 21:418F $18 $23

jr_021_4191:
    ldh  a, [hMapId]                              ;; 21:4191 $F0 $F7
    sub  $0A                                      ;; 21:4193 $D6 $0A
    sla  a                                        ;; 21:4195 $CB $27
    ld   e, a                                     ;; 21:4197 $5F
    ld   d, $00                                   ;; 21:4198 $16 $00
    ld   hl, IndoorPaletteMaps                    ;; 21:419A $21 $13 $44
    add  hl, de                                   ;; 21:419D $19
    ld   a, [hl+]                                 ;; 21:419E $2A
    ld   b, [hl]                                  ;; 21:419F $46
    ld   h, b                                     ;; 21:41A0 $60
    ld   l, a                                     ;; 21:41A1 $6F
    ldh  a, [hMapRoom]                            ;; 21:41A2 $F0 $F6
    ld   e, a                                     ;; 21:41A4 $5F
    ld   d, $00                                   ;; 21:41A5 $16 $00
    add  hl, de                                   ;; 21:41A7 $19
    ld   a, [hl]                                  ;; 21:41A8 $7E
    sla  a                                        ;; 21:41A9 $CB $27
    ld   e, a                                     ;; 21:41AB $5F
    ld   hl, InteriorPalettes                     ;; 21:41AC $21 $3F $44
    add  hl, de                                   ;; 21:41AF $19
    ld   a, [hl+]                                 ;; 21:41B0 $2A
    ld   b, [hl]                                  ;; 21:41B1 $46
    ld   h, b                                     ;; 21:41B2 $60
    ld   l, a                                     ;; 21:41B3 $6F

func_021_41B4::
label_021_41B4:
jr_021_41B4:
    ld   a, [wPaletteUnknownE]                    ;; 21:41B4 $FA $D5 $DD
    and  a                                        ;; 21:41B7 $A7
    jr   nz, .jr_41D6                             ;; 21:41B8 $20 $1C

    push hl                                       ;; 21:41BA $E5
    ld   bc, $40                                  ;; 21:41BB $01 $40 $00
    ld   de, wBGPal1                              ;; 21:41BE $11 $10 $DC
    call CopyData                                 ;; 21:41C1 $CD $14 $29
    push hl                                       ;; 21:41C4 $E5
    ld   hl, ObjectPalettes                       ;; 21:41C5 $21 $18 $55
    ld   bc, $30                                  ;; 21:41C8 $01 $30 $00
    call CopyData                                 ;; 21:41CB $CD $14 $29
    pop  hl                                       ;; 21:41CE $E1
    ld   bc, $10                                  ;; 21:41CF $01 $10 $00
    call CopyData                                 ;; 21:41D2 $CD $14 $29
    pop  hl                                       ;; 21:41D5 $E1

.jr_41D6
    ld   bc, $40                                  ;; 21:41D6 $01 $40 $00
    ld   de, wBGPal1                              ;; 21:41D9 $11 $10 $DC
    ld   a, $02                                   ;; 21:41DC $3E $02
    ldh  [rSVBK], a                               ;; 21:41DE $E0 $70
    call CopyData                                 ;; 21:41E0 $CD $14 $29
    push hl                                       ;; 21:41E3 $E5
    ld   hl, ObjectPalettes                       ;; 21:41E4 $21 $18 $55
    ld   bc, $30                                  ;; 21:41E7 $01 $30 $00
    call CopyData                                 ;; 21:41EA $CD $14 $29
    pop  hl                                       ;; 21:41ED $E1
    ld   bc, $10                                  ;; 21:41EE $01 $10 $00
    call CopyData                                 ;; 21:41F1 $CD $14 $29
    xor  a                                        ;; 21:41F4 $AF
    ldh  [rSVBK], a                               ;; 21:41F5 $E0 $70
    ld   a, [wIsIndoor]                           ;; 21:41F7 $FA $A5 $DB
    and  a                                        ;; 21:41FA $A7
    jr   nz, jr_021_4222                          ;; 21:41FB $20 $25

    ldh  a, [hMapRoom]                            ;; 21:41FD $F0 $F6
    cp   ROOM_OW_EAGLES_TOWER                     ;; 21:41FF $FE $0E
    jr   nz, jr_021_4254                          ;; 21:4201 $20 $51

    ld   hl, Data_021_5548                        ;; 21:4203 $21 $48 $55
    ld   de, wObjPal6                             ;; 21:4206 $11 $78 $DC
    ld   c, $08                                   ;; 21:4209 $0E $08

jr_021_420B:
    ld   a, [wPaletteUnknownE]                    ;; 21:420B $FA $D5 $DD
    and  a                                        ;; 21:420E $A7
    jr   nz, .jr_4213                             ;; 21:420F $20 $02

    ld   a, [hl]                                  ;; 21:4211 $7E
    ld   [de], a                                  ;; 21:4212 $12

.jr_4213
    ld   a, $02                                   ;; 21:4213 $3E $02
    ldh  [rSVBK], a                               ;; 21:4215 $E0 $70
    ld   a, [hl+]                                 ;; 21:4217 $2A
    ld   [de], a                                  ;; 21:4218 $12
    inc  de                                       ;; 21:4219 $13
    xor  a                                        ;; 21:421A $AF
    ldh  [rSVBK], a                               ;; 21:421B $E0 $70
    dec  c                                        ;; 21:421D $0D
    jr   nz, jr_021_420B                          ;; 21:421E $20 $EB

    jr   jr_021_4254                              ;; 21:4220 $18 $32

jr_021_4222:
    ldh  a, [hMapRoom]                            ;; 21:4222 $F0 $F6
    cp   UNKNOWN_ROOM_AA                          ;; 21:4224 $FE $AA
    jr   nz, jr_021_4254                          ;; 21:4226 $20 $2C

    ld   a, [wTunicType]                          ;; 21:4228 $FA $0F $DC
    and  a                                        ;; 21:422B $A7
    jr   z, jr_021_4254                           ;; 21:422C $28 $26

    ld   hl, RedTunicPalette + 4                  ;; 21:422E $21 $2C $55
    cp   TUNIC_RED                                ;; 21:4231 $FE $01
    jr   z, .jr_4238                              ;; 21:4233 $28 $03

    ld   hl, BlueTunicPalette + 4                 ;; 21:4235 $21 $34 $55

.jr_4238
    ld   c, $02                                   ;; 21:4238 $0E $02
    ld   de, wObjPal8 + 2*2                       ;; 21:423A $11 $8C $DC

jr_021_423D:
    ld   a, [wPaletteUnknownE]                    ;; 21:423D $FA $D5 $DD
    and  a                                        ;; 21:4240 $A7
    jr   nz, .jr_4247                             ;; 21:4241 $20 $04

    ld   a, [hl]                                  ;; 21:4243 $7E
    ld   [wObjPal8 + 2*2], a                      ;; 21:4244 $EA $8C $DC

.jr_4247
    ld   a, $02                                   ;; 21:4247 $3E $02
    ldh  [rSVBK], a                               ;; 21:4249 $E0 $70
    ld   a, [hl+]                                 ;; 21:424B $2A
    ld   [de], a                                  ;; 21:424C $12
    inc  de                                       ;; 21:424D $13
    xor  a                                        ;; 21:424E $AF
    ldh  [rSVBK], a                               ;; 21:424F $E0 $70
    dec  c                                        ;; 21:4251 $0D
    jr   nz, jr_021_423D                          ;; 21:4252 $20 $E9

jr_021_4254:
    ld   a, $03                                   ;; 21:4254 $3E $03
    ld   [wPaletteDataFlags], a                   ;; 21:4256 $EA $D1 $DD
    xor  a                                        ;; 21:4259 $AF
    ld   [wPaletteToLoadForTileMap], a            ;; 21:425A $EA $D2 $DD
    ret                                           ;; 21:425D $C9

label_021_425E:
    ld   a, $01                                   ;; 21:425E $3E $01
    ld   [wPaletteDataFlags], a                   ;; 21:4260 $EA $D1 $DD
    ld   hl, TilemapPaletteTable                  ;; 21:4263 $21 $F6 $51
    ld   a, [wPaletteToLoadForTileMap]            ;; 21:4266 $FA $D2 $DD
    and  $3F                                      ;; 21:4269 $E6 $3F
    sla  a                                        ;; 21:426B $CB $27
    ld   c, a                                     ;; 21:426D $4F
    ld   b, $00                                   ;; 21:426E $06 $00
    add  hl, bc                                   ;; 21:4270 $09
    ld   a, [hl+]                                 ;; 21:4271 $2A
    ld   b, [hl]                                  ;; 21:4272 $46
    ld   h, b                                     ;; 21:4273 $60
    ld   l, a                                     ;; 21:4274 $6F
    ld   de, wBGPal1                              ;; 21:4275 $11 $10 $DC
    ld   bc, $40                                  ;; 21:4278 $01 $40 $00
    ld   a, [wGameplayType]                       ;; 21:427B $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 21:427E $FE $01
    jr   z, jr_021_429D                           ;; 21:4280 $28 $1B

    ld   a, [wPaletteToLoadForTileMap]            ;; 21:4282 $FA $D2 $DD
    bit  6, a                                     ;; 21:4285 $CB $77
    jr   z, .jr_4295                              ;; 21:4287 $28 $0C

    add  hl, bc                                   ;; 21:4289 $09
    ld   bc, $10                                  ;; 21:428A $01 $10 $00
    ld   de, wObjPal7                             ;; 21:428D $11 $80 $DC
    ld   a, $02                                   ;; 21:4290 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 21:4292 $EA $D1 $DD

.jr_4295
    call CopyData                                 ;; 21:4295 $CD $14 $29
    xor  a                                        ;; 21:4298 $AF
    ld   [wPaletteToLoadForTileMap], a            ;; 21:4299 $EA $D2 $DD
    ret                                           ;; 21:429C $C9

jr_021_429D:
    ld   a, $02                                   ;; 21:429D $3E $02
    ldh  [rSVBK], a                               ;; 21:429F $E0 $70
    call CopyData                                 ;; 21:42A1 $CD $14 $29
    xor  a                                        ;; 21:42A4 $AF
    ldh  [rSVBK], a                               ;; 21:42A5 $E0 $70
    ld   a, $01                                   ;; 21:42A7 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 21:42A9 $EA $D1 $DD
    xor  a                                        ;; 21:42AC $AF
    ld   [wPaletteToLoadForTileMap], a            ;; 21:42AD $EA $D2 $DD
    ret                                           ;; 21:42B0 $C9


include "data/palettes/tables.asm"


func_021_5185::
    ld   a, [wIsIndoor]                           ;; 21:5185 $FA $A5 $DB
    and  a                                        ;; 21:5188 $A7
    jr   z, jr_021_51D6                           ;; 21:5189 $28 $4B

    ld   b, $2D                                   ;; 21:518B $06 $2D
    ld   hl, IndoorSpritePaletteIndexData         ;; 21:518D $21 $3A $52

jr_021_5190:
    ldh  a, [hMapId]                              ;; 21:5190 $F0 $F7
    ld   e, a                                     ;; 21:5192 $5F
    ld   a, [hl+]                                 ;; 21:5193 $2A
    cp   e                                        ;; 21:5194 $BB
    jr   nz, .jr_51CF                             ;; 21:5195 $20 $38

    ldh  a, [hMapRoom]                            ;; 21:5197 $F0 $F6
    ld   e, a                                     ;; 21:5199 $5F
    ld   a, [hl+]                                 ;; 21:519A $2A
    cp   e                                        ;; 21:519B $BB
    jr   nz, jr_021_51D0                          ;; 21:519C $20 $32

    ld   a, [wRoomTransitionDirection]            ;; 21:519E $FA $25 $C1
    ld   e, a                                     ;; 21:51A1 $5F
    ld   a, [hl+]                                 ;; 21:51A2 $2A
    cp   e                                        ;; 21:51A3 $BB
    jr   nz, jr_021_51D1                          ;; 21:51A4 $20 $2B

    ld   a, [hl+]                                 ;; 21:51A6 $2A
    ld   [wPaletteToLoadForTileMap], a            ;; 21:51A7 $EA $D2 $DD
    ld   a, e                                     ;; 21:51AA $7B
    cp   $04                                      ;; 21:51AB $FE $04
    jr   nz, ret_021_51D5                         ;; 21:51AD $20 $26

    ld   a, $01                                   ;; 21:51AF $3E $01
    ld   [wPaletteUnknownE], a                    ;; 21:51B1 $EA $D5 $DD
    ld   hl, TilemapPaletteTable                  ;; 21:51B4 $21 $F6 $51
    ld   a, [wPaletteToLoadForTileMap]            ;; 21:51B7 $FA $D2 $DD
    and  $3F                                      ;; 21:51BA $E6 $3F
    sla  a                                        ;; 21:51BC $CB $27
    ld   e, a                                     ;; 21:51BE $5F
    ld   d, $00                                   ;; 21:51BF $16 $00
    add  hl, de                                   ;; 21:51C1 $19
    ld   a, [hl+]                                 ;; 21:51C2 $2A
    ld   b, [hl]                                  ;; 21:51C3 $46
    ld   h, b                                     ;; 21:51C4 $60
    ld   l, a                                     ;; 21:51C5 $6F
    call func_021_41B4                            ;; 21:51C6 $CD $B4 $41
    xor  a                                        ;; 21:51C9 $AF
    ld   [wPaletteUnknownE], a                    ;; 21:51CA $EA $D5 $DD
    jr   ret_021_51D5                             ;; 21:51CD $18 $06

.jr_51CF
    inc  hl                                       ;; 21:51CF $23

jr_021_51D0:
    inc  hl                                       ;; 21:51D0 $23

jr_021_51D1:
    inc  hl                                       ;; 21:51D1 $23
    dec  b                                        ;; 21:51D2 $05
    jr   nz, jr_021_5190                          ;; 21:51D3 $20 $BB

ret_021_51D5:
    ret                                           ;; 21:51D5 $C9

jr_021_51D6:
    ld   b, $0E                                   ;; 21:51D6 $06 $0E
    ld   hl, OverworldSpritePaletteIndexData      ;; 21:51D8 $21 $EE $52

jr_021_51DB:
    ldh  a, [hMapRoom]                            ;; 21:51DB $F0 $F6
    ld   e, a                                     ;; 21:51DD $5F
    ld   a, [hl+]                                 ;; 21:51DE $2A
    cp   e                                        ;; 21:51DF $BB
    jr   nz, .jr_51F0                             ;; 21:51E0 $20 $0E

    ld   a, [wRoomTransitionDirection]            ;; 21:51E2 $FA $25 $C1
    ld   e, a                                     ;; 21:51E5 $5F
    ld   a, [hl+]                                 ;; 21:51E6 $2A
    cp   e                                        ;; 21:51E7 $BB
    jr   nz, jr_021_51F1                          ;; 21:51E8 $20 $07

    ld   a, [hl+]                                 ;; 21:51EA $2A
    ld   [wPaletteToLoadForTileMap], a            ;; 21:51EB $EA $D2 $DD
    jr   ret_021_51F5                             ;; 21:51EE $18 $05

.jr_51F0
    inc  hl                                       ;; 21:51F0 $23

jr_021_51F1:
    inc  hl                                       ;; 21:51F1 $23
    dec  b                                        ;; 21:51F2 $05
    jr   nz, jr_021_51DB                          ;; 21:51F3 $20 $E6

ret_021_51F5:
    ret                                           ;; 21:51F5 $C9

; Array indexed by wPaletteToLoadForTileMap
TilemapPaletteTable::
    dw   TailCavePaletteA      ; 00
    dw   Data_021_6080         ; 01
    dw   KeyCavernPaletteA     ; 02
    dw   Data_021_6270         ; 03
    dw   CatfishsMawPaletteA   ; 04
    dw   Data_021_6450         ; 05
    dw   Data_021_64A0         ; 06
    dw   Data_021_65B0         ; 07
    dw   EaglesTowerPaletteA   ; 08
    dw   EaglesTowerPaletteB   ; 09
    dw   Data_021_60D0         ; 0A
    dw   AnglersTunnelPaletteA ; 0B
    dw   Data_021_6360         ; 0C
    dw   Data_021_6360         ; 0D
    dw   Data_021_64B0         ; 0E
    dw   TurtleRockPaletteA    ; 0F
    dw   Data_021_6180         ; 10
    dw   FaceShrinePaletteA    ; 11
    dw   Data_021_6510         ; 12
    dw   Data_021_6660         ; 13
    dw   OverworldPalette0E    ; 14
    dw   Data_021_5E60         ; 15
    dw   OverworldPalette0A    ; 16
    dw   Data_021_5DC0         ; 17
    dw   OverworldPalette08    ; 18
    dw   OverworldPalette10    ; 19
    dw   Data_021_5D70         ; 1A
    dw   OverworldPalette15    ; 1B
    dw   Data_021_6760         ; 1C
    dw   Data_021_6770         ; 1D
    dw   Data_021_6780         ; 1E
    dw   OverworldPalette01    ; 1F
    dw   OverworldPalette00    ; 20
    dw   OverworldPalette03    ; 21

IndoorSpritePaletteIndexData::
    ; This is a table with 4 byte records:
    ; hMapId, hRoomId, wTransitionDirection, wPaletteToLoadForTileMap
    db   MAP_TAIL_CAVE,      $17, DIRECTION_ENTER, $81 ; dungeon entrance
    db   MAP_TAIL_CAVE,      $13, DIRECTION_LEFT,  $80
    db   MAP_TAIL_CAVE,      $13, DIRECTION_RIGHT, $80
    db   MAP_TAIL_CAVE,      $13, DIRECTION_DOWN,  $81
    db   MAP_TAIL_CAVE,      $10, DIRECTION_RIGHT, $CA
    db   MAP_TAIL_CAVE,      $1C, DIRECTION_UP,    $C2
    db   MAP_BOTTLE_GROTTO,  $2D, DIRECTION_UP,    $D0
    db   MAP_KEY_CAVERN,     $52, DIRECTION_ENTER, $83 ; dungeon entrance
    db   MAP_KEY_CAVERN,     $51, DIRECTION_UP,    $82
    db   MAP_KEY_CAVERN,     $51, DIRECTION_DOWN,  $83
    db   MAP_ANGLERS_TUNNEL, $78, DIRECTION_LEFT,  $8B
    db   MAP_ANGLERS_TUNNEL, $78, DIRECTION_RIGHT, $8B
    db   MAP_ANGLERS_TUNNEL, $78, DIRECTION_DOWN,  $8C
    db   MAP_ANGLERS_TUNNEL, $EF, DIRECTION_DOWN,  $CD
    db   MAP_CATFISHS_MAW,   $A1, DIRECTION_ENTER, $85 ; dungeon entrance
    db   MAP_CATFISHS_MAW,   $9F, DIRECTION_UP,    $86
    db   MAP_CATFISHS_MAW,   $9F, DIRECTION_RIGHT, $85
    db   MAP_CATFISHS_MAW,   $9C, DIRECTION_UP,    $84
    db   MAP_CATFISHS_MAW,   $9C, DIRECTION_LEFT,  $84
    db   MAP_CATFISHS_MAW,   $9C, DIRECTION_RIGHT, $86
    db   MAP_CATFISHS_MAW,   $95, DIRECTION_RIGHT, $84
    db   MAP_CATFISHS_MAW,   $95, DIRECTION_DOWN,  $86
    db   MAP_CATFISHS_MAW,   $81, DIRECTION_ENTER, $86 ; stairs entrance
    db   MAP_CATFISHS_MAW,   $8B, DIRECTION_UP,    $CE
    db   MAP_CATFISHS_MAW,   $85, DIRECTION_DOWN,  $C4
    db   MAP_FACE_SHRINE,    $D2, DIRECTION_UP,    $D2
    db   MAP_FACE_SHRINE,    $CE, DIRECTION_UP,    $D1
    db   MAP_EAGLES_TOWER,   $2E, DIRECTION_ENTER, $89 ; stairs entrance
    db   MAP_EAGLES_TOWER,   $F8, DIRECTION_ENTER, $88 ; sidescrolling tower entrance
    db   MAP_EAGLES_TOWER,   $0E, DIRECTION_ENTER, $87 ; dungeon entrance
    db   MAP_EAGLES_TOWER,   $0D, DIRECTION_UP,    $89
    db   MAP_EAGLES_TOWER,   $0D, DIRECTION_RIGHT, $87
    db   MAP_EAGLES_TOWER,   $0F, DIRECTION_UP,    $89
    db   MAP_EAGLES_TOWER,   $0F, DIRECTION_RIGHT, $89
    db   MAP_EAGLES_TOWER,   $0F, DIRECTION_LEFT,  $87
    db   MAP_EAGLES_TOWER,   $17, DIRECTION_UP,    $D3
    db   MAP_EAGLES_TOWER,   $14, DIRECTION_LEFT,  $D3
    db   MAP_EAGLES_TOWER,   $13, DIRECTION_RIGHT, $C7
    db   MAP_TURTLE_ROCK,    $55, DIRECTION_LEFT,  $CA
    db   MAP_TURTLE_ROCK,    $54, DIRECTION_RIGHT, $CF
    db   MAP_TURTLE_ROCK,    $54, DIRECTION_DOWN,  $CF
    db   MAP_TURTLE_ROCK,    $54, DIRECTION_UP,    $CF
    db   MAP_S_FACE_SHRINE,  $6F, DIRECTION_UP,    $DC
    db   MAP_S_FACE_SHRINE,  $7F, DIRECTION_UP,    $DD
    db   MAP_S_FACE_SHRINE,  $8F, DIRECTION_DOWN,  $DE

OverworldSpritePaletteIndexData::
    ; This is table with 3 byte records:
    ; hRoomId, wTransitionDirection, wPaletteToLoadForTileMap
    db   $44, DIRECTION_DOWN,  $94
    db   $36, DIRECTION_RIGHT, $94
    db   $16, DIRECTION_UP,    $95
    db   $26, DIRECTION_DOWN,  $95
    db   $17, DIRECTION_UP,    $95
    db   $27, DIRECTION_DOWN,  $95
    db   $08, DIRECTION_UP,    $9B
    db   $17, DIRECTION_LEFT,  $9B
    db   $9C, DIRECTION_RIGHT, $96
    db   $9F, DIRECTION_UP,    $D7
    db   $9E, DIRECTION_RIGHT, $DA
    db   $2C, DIRECTION_RIGHT, $98
    db   $12, DIRECTION_RIGHT, $99
    db   $65, DIRECTION_UP,    $98

func_021_5318::
    ld   a, [wIsIndoor]                           ;; 21:5318 $FA $A5 $DB
    and  a                                        ;; 21:531B $A7
    jr   nz, ret_021_5342                         ;; 21:531C $20 $24

    ld   b, (OverworldBGPaletteTransitionData.end - OverworldBGPaletteTransitionData) / 3 ;; 21:531E $06 $06
    ld   hl, OverworldBGPaletteTransitionData     ;; 21:5320 $21 $43 $53

jr_021_5323:
    ldh  a, [hMapRoom]                            ;; 21:5323 $F0 $F6
    ld   e, a                                     ;; 21:5325 $5F
    ld   a, [hl+]                                 ;; 21:5326 $2A
    cp   e                                        ;; 21:5327 $BB
    jr   nz, .jr_533D                             ;; 21:5328 $20 $13

    ld   a, [wRoomTransitionDirection]            ;; 21:532A $FA $25 $C1
    ld   e, a                                     ;; 21:532D $5F
    ld   a, [hl+]                                 ;; 21:532E $2A
    cp   e                                        ;; 21:532F $BB
    jr   nz, jr_021_533E                          ;; 21:5330 $20 $0C

    ld   a, [hl+]                                 ;; 21:5332 $2A
    ld   [wBGPaletteTransitionEffect], a          ;; 21:5333 $EA $D6 $DD
    ld   a, $0B                                   ;; 21:5336 $3E $0B
    ld   [wDDD7], a                               ;; 21:5338 $EA $D7 $DD
    jr   ret_021_5342                             ;; 21:533B $18 $05

.jr_533D
    inc  hl                                       ;; 21:533D $23

jr_021_533E:
    inc  hl                                       ;; 21:533E $23
    dec  b                                        ;; 21:533F $05
    jr   nz, jr_021_5323                          ;; 21:5340 $20 $E1

ret_021_5342:
    ret                                           ;; 21:5342 $C9

OverworldBGPaletteTransitionData::
    ; Only used when going to/from the Mysterious Forest.
    ; This is a table with 3 byte records:
    ; hRoomId, wRoomTransitionDirection, wBGPaletteTransitionEffect
    db   $40, DIRECTION_DOWN,  $40
    db   $30, DIRECTION_UP,    $80
    db   $44, DIRECTION_RIGHT, $80
    db   $43, DIRECTION_LEFT,  $40
    db   $90, DIRECTION_DOWN,  $80
    db   $80, DIRECTION_UP,    $40
.end

func_021_5355::
    call func_021_5366                            ;; 21:5355 $CD $66 $53
    ld   a, [wBGPaletteEffectAddress]             ;; 21:5358 $FA $CC $C3
    and  $0E                                      ;; 21:535B $E6 $0E
    ret  z                                        ;; 21:535D $C8

    ld   a, $01                                   ;; 21:535E $3E $01
    ldh  [hBGMapOffsetLow], a                     ;; 21:5360 $E0 $E1
    call func_021_5432                            ;; 21:5362 $CD $32 $54
    ret                                           ;; 21:5365 $C9

func_021_5366::
    ldh  a, [hMapId]                              ;; 21:5366 $F0 $F7
    cp   MAP_CAVE_B                               ;; 21:5368 $FE $0A
    jr   nc, .jr_537B                             ;; 21:536A $30 $0F

    sla  a                                        ;; 21:536C $CB $27
    ld   e, a                                     ;; 21:536E $5F
    ld   d, $00                                   ;; 21:536F $16 $00
    ld   hl, DungeonPalettesA                     ;; 21:5371 $21 $EF $43
    add  hl, de                                   ;; 21:5374 $19
    ld   a, [hl+]                                 ;; 21:5375 $2A
    ld   b, [hl]                                  ;; 21:5376 $46
    ld   h, b                                     ;; 21:5377 $60
    ld   l, a                                     ;; 21:5378 $6F
    jr   jr_021_539C                              ;; 21:5379 $18 $21

.jr_537B
    sub  $0A                                      ;; 21:537B $D6 $0A
    sla  a                                        ;; 21:537D $CB $27
    ld   e, a                                     ;; 21:537F $5F
    ld   d, $00                                   ;; 21:5380 $16 $00
    ld   hl, IndoorPaletteMaps                    ;; 21:5382 $21 $13 $44
    add  hl, de                                   ;; 21:5385 $19
    ld   a, [hl+]                                 ;; 21:5386 $2A
    ld   b, [hl]                                  ;; 21:5387 $46
    ld   h, b                                     ;; 21:5388 $60
    ld   l, a                                     ;; 21:5389 $6F
    ldh  a, [hMapRoom]                            ;; 21:538A $F0 $F6
    ld   e, a                                     ;; 21:538C $5F
    ld   d, $00                                   ;; 21:538D $16 $00
    add  hl, de                                   ;; 21:538F $19
    ld   a, [hl]                                  ;; 21:5390 $7E
    sla  a                                        ;; 21:5391 $CB $27
    ld   e, a                                     ;; 21:5393 $5F
    ld   hl, InteriorPalettes                     ;; 21:5394 $21 $3F $44
    add  hl, de                                   ;; 21:5397 $19
    ld   a, [hl+]                                 ;; 21:5398 $2A
    ld   b, [hl]                                  ;; 21:5399 $46
    ld   h, b                                     ;; 21:539A $60
    ld   l, a                                     ;; 21:539B $6F

jr_021_539C:
    ld   de, wBGPal1                              ;; 21:539C $11 $10 $DC
    ld   bc, $40                                  ;; 21:539F $01 $40 $00
    push bc                                       ;; 21:53A2 $C5
    push de                                       ;; 21:53A3 $D5
    push hl                                       ;; 21:53A4 $E5
    call CopyData                                 ;; 21:53A5 $CD $14 $29
    pop  hl                                       ;; 21:53A8 $E1
    pop  de                                       ;; 21:53A9 $D1
    pop  bc                                       ;; 21:53AA $C1
    ld   a, $02                                   ;; 21:53AB $3E $02
    ldh  [rSVBK], a                               ;; 21:53AD $E0 $70
    call CopyData                                 ;; 21:53AF $CD $14 $29
    xor  a                                        ;; 21:53B2 $AF
    ldh  [rSVBK], a                               ;; 21:53B3 $E0 $70
    ret                                           ;; 21:53B5 $C9

func_021_53B6::
    call func_021_5366                            ;; 21:53B6 $CD $66 $53
    ld   a, $01                                   ;; 21:53B9 $3E $01
    ldh  [hBGMapOffsetLow], a                     ;; 21:53BB $E0 $E1
    call func_021_5440                            ;; 21:53BD $CD $40 $54

jr_021_53C0:
    xor  a                                        ;; 21:53C0 $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 21:53C1 $EA $D3 $DD
    ld   a, $20                                   ;; 21:53C4 $3E $20
    ld   [wPalettePartialCopyColorCount], a       ;; 21:53C6 $EA $D4 $DD
    ld   a, $81                                   ;; 21:53C9 $3E $81
    ld   [wPaletteDataFlags], a                   ;; 21:53CB $EA $D1 $DD
    ret                                           ;; 21:53CE $C9

func_021_53CF::
    call func_021_5366                            ;; 21:53CF $CD $66 $53
    ld   a, $01                                   ;; 21:53D2 $3E $01
    ldh  [hBGMapOffsetLow], a                     ;; 21:53D4 $E0 $E1
    call func_021_5432                            ;; 21:53D6 $CD $32 $54
    jr   jr_021_53C0                              ;; 21:53D9 $18 $E5

Data_021_53DB::
    db   $0B, $0D, $0D, $0D, $0B, $0B, $0B, $0B  ; $53DB |........|

Data_021_53E3::
    db   $07, $09, $09, $09, $07, $07, $07, $07  ; $53E3 |........|

Data_021_53EB::
    db   $04, $05, $05, $05, $04, $04, $04, $04  ; $53EB |........|

; Load palettes for room objects?
; Returns early when DBA5 is 0
func_021_53F3::
    xor  a                                        ;; 21:53F3 $AF
    ldh  [hBGMapOffsetLow], a                     ;; 21:53F4 $E0 $E1
    ldh  a, [hIsGBC]                              ;; 21:53F6 $F0 $FE
    and  a                                        ;; 21:53F8 $A7
    ret  z                                        ;; 21:53F9 $C8

    ld   a, [wIsIndoor]                           ;; 21:53FA $FA $A5 $DB
    and  a                                        ;; 21:53FD $A7
    ret  z                                        ;; 21:53FE $C8

    ld   hl, wBGPaletteEffectAddress              ;; 21:53FF $21 $CC $C3
    ld   a, [wC3CD]                               ;; 21:5402 $FA $CD $C3
    cp   [hl]                                     ;; 21:5405 $BE
    ret  z                                        ;; 21:5406 $C8

    ld   a, [wRoomTransitionState]                ;; 21:5407 $FA $24 $C1
    and  a                                        ;; 21:540A $A7
    ld   a, [wC3CD]                               ;; 21:540B $FA $CD $C3
    jr   z, jr_021_5435                           ;; 21:540E $28 $25

    ld   hl, wBGPaletteEffectAddress              ;; 21:5410 $21 $CC $C3
    ld   a, [wC3CD]                               ;; 21:5413 $FA $CD $C3
    cp   [hl]                                     ;; 21:5416 $BE
    jr   nc, .jr_541D                             ;; 21:5417 $30 $04

    ld   a, $40                                   ;; 21:5419 $3E $40
    jr   jr_021_541F                              ;; 21:541B $18 $02

.jr_541D
    ld   a, $80                                   ;; 21:541D $3E $80

jr_021_541F:
    ld   [wBGPaletteTransitionEffect], a          ;; 21:541F $EA $D6 $DD
    ldh  a, [hMapId]                              ;; 21:5422 $F0 $F7
    cp   MAP_TURTLE_ROCK                          ;; 21:5424 $FE $07
    jr   nz, .jr_542C                             ;; 21:5426 $20 $04

    ld   a, $17                                   ;; 21:5428 $3E $17
    jr   jr_021_542E                              ;; 21:542A $18 $02

.jr_542C
    ld   a, $0B                                   ;; 21:542C $3E $0B

jr_021_542E:
    ld   [wDDD7], a                               ;; 21:542E $EA $D7 $DD
    ret                                           ;; 21:5431 $C9

func_021_5432::
    ld   a, [wBGPaletteEffectAddress]             ;; 21:5432 $FA $CC $C3

jr_021_5435:
    ld   hl, Data_021_53EB                        ;; 21:5435 $21 $EB $53
    cp   $08                                      ;; 21:5438 $FE $08
    jr   z, jr_021_5448                           ;; 21:543A $28 $0C

    cp   $02                                      ;; 21:543C $FE $02
    jr   z, jr_021_5445                           ;; 21:543E $28 $05

func_021_5440::
    ld   hl, Data_021_53E3                        ;; 21:5440 $21 $E3 $53
    jr   jr_021_5448                              ;; 21:5443 $18 $03

jr_021_5445:
    ld   hl, Data_021_53DB                        ;; 21:5445 $21 $DB $53

jr_021_5448:
    ld   b, $00                                   ;; 21:5448 $06 $00

.loop_544A
    ld   a, [hl+]                                 ;; 21:544A $2A
    ld   c, a                                     ;; 21:544B $4F
    call func_021_5466                            ;; 21:544C $CD $66 $54
    inc  b                                        ;; 21:544F $04
    ld   a, b                                     ;; 21:5450 $78
    cp   $08                                      ;; 21:5451 $FE $08
    jr   nz, .loop_544A                           ;; 21:5453 $20 $F5

    ldh  a, [hBGMapOffsetLow]                     ;; 21:5455 $F0 $E1
    and  a                                        ;; 21:5457 $A7
    jr   nz, .jr_5460                             ;; 21:5458 $20 $06

    ld   a, [wRoomTransitionState]                ;; 21:545A $FA $24 $C1
    and  a                                        ;; 21:545D $A7
    jr   z, ret_021_5465                          ;; 21:545E $28 $05

.jr_5460
    ld   a, $01                                   ;; 21:5460 $3E $01
    ld   [wPaletteDataFlags], a                   ;; 21:5462 $EA $D1 $DD

ret_021_5465:
    ret                                           ;; 21:5465 $C9

func_021_5466::
    push bc                                       ;; 21:5466 $C5
    push hl                                       ;; 21:5467 $E5
    ld   hl, wBGPal1                              ;; 21:5468 $21 $10 $DC
    ld   a, b                                     ;; 21:546B $78
    sla  a                                        ;; 21:546C $CB $27
    sla  a                                        ;; 21:546E $CB $27
    sla  a                                        ;; 21:5470 $CB $27
    ld   e, a                                     ;; 21:5472 $5F
    ld   d, $00                                   ;; 21:5473 $16 $00
    add  hl, de                                   ;; 21:5475 $19

jr_021_5476:
    push hl                                       ;; 21:5476 $E5
    ldh  a, [hBGMapOffsetLow]                     ;; 21:5477 $F0 $E1
    and  a                                        ;; 21:5479 $A7
    jr   nz, .jr_548E                             ;; 21:547A $20 $12

    ld   a, [wRoomTransitionState]                ;; 21:547C $FA $24 $C1
    and  a                                        ;; 21:547F $A7
    jr   nz, .jr_548E                             ;; 21:5480 $20 $0C

    ld   a, $02                                   ;; 21:5482 $3E $02
    ldh  [rSVBK], a                               ;; 21:5484 $E0 $70
    ld   a, [hl+]                                 ;; 21:5486 $2A
    ld   e, a                                     ;; 21:5487 $5F
    ld   d, [hl]                                  ;; 21:5488 $56
    xor  a                                        ;; 21:5489 $AF
    ldh  [rSVBK], a                               ;; 21:548A $E0 $70
    jr   jr_021_5491                              ;; 21:548C $18 $03

.jr_548E
    ld   a, [hl+]                                 ;; 21:548E $2A
    ld   e, a                                     ;; 21:548F $5F
    ld   d, [hl]                                  ;; 21:5490 $56

jr_021_5491:
    ld   a, e                                     ;; 21:5491 $7B
    and  $1F                                      ;; 21:5492 $E6 $1F
    call func_021_54F9                            ;; 21:5494 $CD $F9 $54
    ldh  [hMultiPurpose8], a                      ;; 21:5497 $E0 $DF
    ld   a, e                                     ;; 21:5499 $7B
    and  $E0                                      ;; 21:549A $E6 $E0
    swap a                                        ;; 21:549C $CB $37
    srl  a                                        ;; 21:549E $CB $3F
    ld   b, a                                     ;; 21:54A0 $47
    ld   a, d                                     ;; 21:54A1 $7A
    and  $03                                      ;; 21:54A2 $E6 $03
    swap a                                        ;; 21:54A4 $CB $37
    srl  a                                        ;; 21:54A6 $CB $3F
    or   b                                        ;; 21:54A8 $B0
    call func_021_54F9                            ;; 21:54A9 $CD $F9 $54
    ldh  [hBGMapOffsetHigh], a                    ;; 21:54AC $E0 $E0
    ld   a, d                                     ;; 21:54AE $7A
    and  $7C                                      ;; 21:54AF $E6 $7C
    srl  a                                        ;; 21:54B1 $CB $3F
    srl  a                                        ;; 21:54B3 $CB $3F
    call func_021_54F9                            ;; 21:54B5 $CD $F9 $54
    sla  a                                        ;; 21:54B8 $CB $27
    sla  a                                        ;; 21:54BA $CB $27
    ld   d, a                                     ;; 21:54BC $57
    ldh  a, [hBGMapOffsetHigh]                    ;; 21:54BD $F0 $E0
    sla  a                                        ;; 21:54BF $CB $27
    swap a                                        ;; 21:54C1 $CB $37
    and  $03                                      ;; 21:54C3 $E6 $03
    or   d                                        ;; 21:54C5 $B2
    ld   d, a                                     ;; 21:54C6 $57
    ldh  a, [hBGMapOffsetHigh]                    ;; 21:54C7 $F0 $E0
    and  $07                                      ;; 21:54C9 $E6 $07
    swap a                                        ;; 21:54CB $CB $37
    sla  a                                        ;; 21:54CD $CB $27
    ld   e, a                                     ;; 21:54CF $5F
    ldh  a, [hMultiPurpose8]                      ;; 21:54D0 $F0 $DF
    or   e                                        ;; 21:54D2 $B3
    ld   e, a                                     ;; 21:54D3 $5F
    pop  hl                                       ;; 21:54D4 $E1
    ldh  a, [hBGMapOffsetLow]                     ;; 21:54D5 $F0 $E1
    and  a                                        ;; 21:54D7 $A7
    jr   nz, .jr_54ED                             ;; 21:54D8 $20 $13

    ld   a, [wRoomTransitionState]                ;; 21:54DA $FA $24 $C1
    and  a                                        ;; 21:54DD $A7
    jr   nz, .jr_54ED                             ;; 21:54DE $20 $0D

    ld   a, $02                                   ;; 21:54E0 $3E $02
    ldh  [rSVBK], a                               ;; 21:54E2 $E0 $70
    ld   a, e                                     ;; 21:54E4 $7B
    ld   [hl+], a                                 ;; 21:54E5 $22
    ld   a, d                                     ;; 21:54E6 $7A
    ld   [hl+], a                                 ;; 21:54E7 $22
    xor  a                                        ;; 21:54E8 $AF
    ldh  [rSVBK], a                               ;; 21:54E9 $E0 $70
    jr   jr_021_54F1                              ;; 21:54EB $18 $04

.jr_54ED
    ld   a, e                                     ;; 21:54ED $7B
    ld   [hl+], a                                 ;; 21:54EE $22
    ld   a, d                                     ;; 21:54EF $7A
    ld   [hl+], a                                 ;; 21:54F0 $22

jr_021_54F1:
    ld   a, l                                     ;; 21:54F1 $7D
    and  $07                                      ;; 21:54F2 $E6 $07
    jr   nz, jr_021_5476                          ;; 21:54F4 $20 $80

    pop  hl                                       ;; 21:54F6 $E1
    pop  bc                                       ;; 21:54F7 $C1
    ret                                           ;; 21:54F8 $C9

func_021_54F9::
    push de                                       ;; 21:54F9 $D5
    ld   b, a                                     ;; 21:54FA $47
    and  $0F                                      ;; 21:54FB $E6 $0F
    swap a                                        ;; 21:54FD $CB $37
    ld   e, a                                     ;; 21:54FF $5F
    ld   a, b                                     ;; 21:5500 $78
    swap a                                        ;; 21:5501 $CB $37
    and  $01                                      ;; 21:5503 $E6 $01
    ld   d, a                                     ;; 21:5505 $57
    xor  a                                        ;; 21:5506 $AF
    ld   h, a                                     ;; 21:5507 $67
    ld   l, a                                     ;; 21:5508 $6F
    ld   b, c                                     ;; 21:5509 $41

.loop_550A
    ld   a, l                                     ;; 21:550A $7D
    add  e                                        ;; 21:550B $83
    ld   l, a                                     ;; 21:550C $6F
    ld   a, h                                     ;; 21:550D $7C
    adc  $00                                      ;; 21:550E $CE $00
    add  d                                        ;; 21:5510 $82
    ld   h, a                                     ;; 21:5511 $67
    dec  b                                        ;; 21:5512 $05
    jr   nz, .loop_550A                           ;; 21:5513 $20 $F5

    ld   a, h                                     ;; 21:5515 $7C
    pop  de                                       ;; 21:5516 $D1
    ret                                           ;; 21:5517 $C9

include "data/palettes/default_sprites.asm"

Data_021_5548:: ; related to the Eagle Tower
    rgb   #F8F8F8, #608038, #204000, #000000

include "data/palettes/overworld.asm"
include "data/palettes/dungeons.asm"
include "data/palettes/interior.asm"


; Blocks of $40 bytes of data, copied to wBGPal1
Data_021_73B0::
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #F07888, #F81858, #700028, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000

    rgb   #F8F888, #000000, #8888A0, #F8F888
    rgb   #F8F888, #000000, #10A840, #F8F888 ; green tunic?

    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #F07888, #F81858, #700028, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000

    rgb   #F8F888, #000000, #8888A0, #F8F888
    rgb   #F8F888, #000000, #F80828, #F8F888 ; red tunic?

    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #F07888, #F81858, #700028, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000

    rgb   #F8F888, #000000, #8888A0, #F8F888
    rgb   #F8F888, #000000, #1880F8, #F8F888 ; blue tunic?

; Blocks of $40 bytes of data, copied to wBGPal1
Data_021_74A0::
    rgb   #F8F888, #E8B858, #A86828, #000000  ; $74A0 |.G......|
    rgb   #F8F888, #8888A0, #283050, #000000  ; $74A8 |.G1R.(..|
    rgb   #F8F888, #F81858, #700028, #000000  ; $74B0 |.G.,....|
    rgb   #F8F888, #C87020, #703020, #000000  ; $74B8 |.G......|
    rgb   #A07810, #F8F8F8, #A07810, #000000  ; $74C0 |........|
    rgb   #F07888, #F81858, #700028, #000000  ; $74C8 |.E.,....|
    rgb   #E8B858, #C87020, #703020, #000000  ; $74D0 |........|
    rgb   #E8B858, #F8F800, #987000, #000000  ; $74D8 |........|

    rgb   #E8B858, #C87020, #703020, #000000  ; $74E0 |........|
    rgb   #F8F888, #000000, #8888A0, #F8F888  ; $74E8 |.G..1R.G|

; Blocks of $80 bytes of data, copied to wBGPal1
Data_021_74F0::
    dw 0
    dw 0
    dw Data_021_7536
    dw Data_021_7536
    dw 0
    dw 0
    dw 0
    dw Data_021_75B6
    dw 0
    dw Data_021_7536
    dw WorldMapPalette
    dw Data_021_7536
    dw Data_021_75B6
    dw 0
    dw 0
    dw Data_021_7536
    dw Title_BG_Palettes
    dw Data_021_7696
    dw Data_021_7636
    dw Data_021_76D6
    dw Data_021_78EE
    dw Data_021_796E
    dw Data_021_79EE
    dw Data_021_7A6E
    dw Data_021_7AEE
    dw Data_021_7B6E
    dw Data_021_7BEE
    dw Data_021_7C6E
    dw Data_021_7C6E
    dw Data_021_7CEE
    dw Data_021_7D6E
    dw Data_021_772E
    dw Data_021_776E
    dw 0
    dw 0

Data_021_7536:
    rgb   #408860, #F0E820, #004060, #000000
    rgb   #A84030, #106860, #500090, #000000
    rgb   #A84030, #F8C090, #500090, #000000
    rgb   #A84030, #F8C090, #106860, #000000
    rgb   #F88020, #F0F848, #500090, #000000
    rgb   #F86840, #F8C090, #500090, #000000
    rgb   #0020A8, #506870, #385050, #183828
    rgb   #1878C0, #F8F8F8, #1820B8, #100068

    rgb   #0090F8, #000000, #109008, #F8B898
    rgb   #0090F8, #A0A0B0, #F8D028, #00B8F8
    rgb   #0090F8, #306090, #C0C8D8, #000850
    rgb   #0090F8, #000000, #C88830, #F8B898
    rgb   #F8F8F8, #903800, #C88050, #F8D028
    rgb   #F8F8F8, #582020, #C88050, #F8D028
    rgb   #000000, #000000, #000000, #000000
    rgb   #000000, #000000, #000000, #000000

Data_021_75B6:
    rgb   #F8F8F8, #58D878, #206018, #000000
    rgb   #F8F8F8, #7090D8, #284080, #000000
    rgb   #F8F8F8, #F81070, #901830, #000000
    rgb   #F8F8F8, #F8E050, #805000, #000000
    rgb   #F8F8F8, #F88858, #881800, #000000
    rgb   #F8F8F8, #A0A088, #305800, #000000
    rgb   #F8F8F8, #A89080, #680010, #000000
    rgb   #F8F8F8, #706818, #204818, #000000

    rgb   #0090F8, #000000, #109008, #F8B898
    rgb   #0090F8, #A0A0B0, #F8D028, #00B8F8
    rgb   #0090F8, #306090, #C0C8D8, #000850
    rgb   #0090F8, #000000, #C88830, #F8B898
    rgb   #F8F8F8, #903800, #C88050, #F8D028
    rgb   #F8F8F8, #582020, #C88050, #F8D028
    rgb   #000000, #000000, #000000, #000000
    rgb   #000000, #000000, #000000, #000000

Data_021_7636:
    rgb   #F8F8F8, #88B8E0, #0898C8, #000000
    rgb   #F8F888, #C89028, #684820, #000000
    rgb   #F8F8F8, #60B820, #306828, #000000
    rgb   #F8F8F8, #4058F8, #306828, #000000
    rgb   #60B820, #306828, #0898C8, #000000
    rgb   #C8E0E0, #88A0A0, #3880B8, #184068
    rgb   #C89028, #684820, #306828, #000000
    rgb   #F8F888, #E0A840, #000000, #000000

    rgb   #F8F888, #000000, #10A840, #F8B888
    rgb   #F8F888, #000000, #F87808, #F8B888
    rgb   #F8F8F8, #000000, #F80828, #F8B888
    rgb   #F8F8F8, #000000, #1880F8, #F8B888

Data_021_7696:
    rgb   #F8C090, #F05070, #A00038, #201008
    rgb   #F8C090, #E07058, #B83820, #201008
    rgb   #F8F8F8, #E8B018, #A00038, #201008
    rgb   #F8C090, #E8B018, #B83820, #201008
    rgb   #F8C090, #F05070, #6020C0, #201008
    rgb   #F8C090, #F05070, #B83820, #201008
    rgb   #F8F8F8, #E8B018, #6020C0, #201008
    rgb   #F8C090, #E07058, #70F040, #201008

Data_021_76D6:
    rgb   #F8F8F0, #888870, #283048, #080818
    rgb   #D8D898, #787020, #283008, #000000
    rgb   #F8F8F0, #888870, #681828, #080818
    rgb   #0000F8, #0000F8, #0000F8, #0000F8
    rgb   #0000F8, #0000F8, #0000F8, #0000F8
    rgb   #0000F8, #0000F8, #0000F8, #0000F8
    rgb   #0000F8, #0000F8, #0000F8, #0000F8
    rgb   #0000F8, #0000F8, #0000F8, #0000F8

    rgb   #F8F888, #000000, #10A840, #F8B888
    rgb   #F8F888, #000000, #F87808, #F8B888
    rgb   #F8F8F8, #000000, #F80828, #F8B888

Data_021_772E:
    rgb   #F8F8B0, #E88038, #888828, #201838
    rgb   #F8F8B0, #E8A850, #884028, #201838
    rgb   #F8F8B0, #D8C868, #485088, #201838
    rgb   #F8F8B0, #E06078, #485088, #201838
    rgb   #F8F8B0, #78E878, #485088, #201838
    rgb   #F8F8B0, #78E878, #9870C8, #201838
    rgb   #F8F8B0, #E06078, #C01048, #201838
    rgb   #F8F8B0, #D8C868, #E88038, #201838

Data_021_776E:
    rgb   #F8F8F8, #4058F8, #000000, #000000
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F888, #608038, #204000, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #182098, #000000, #608038, #F8F888

    rgb   #F8F8F8, #4058F8, #182098, #000000
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #608038, #204000, #000000
    rgb   #F8F8F8, #C87020, #703020, #000000
    rgb   #F8F8F8, #000000, #608038, #F8F888

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #C87020, #084828, #000000

    rgb   #F8F888, #000000, #10A840, #F8B888
    rgb   #F8F888, #000000, #F87808, #F8B888
    rgb   #F8F8F8, #000000, #F80828, #F8B888
    rgb   #F8F8F8, #000000, #1880F8, #F8B888
    rgb   #F8F8F8, #F8B030, #E81830, #000000
    rgb   #F8F8F8, #70A8F8, #0000F8, #000000
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

WorldMapPalette:
    rgb   #F8F888, #20B048, #282828, #000000
    rgb   #F8F888, #9878A0, #282828, #000000
    rgb   #F8F888, #B80028, #282828, #000000
    rgb   #F8F888, #C87020, #602010, #000000
    rgb   #F8F888, #4058F8, #602010, #000000
    rgb   #F8F888, #B80028, #602010, #000000
    rgb   #F8F888, #602010, #282828, #000000
    rgb   #F8F888, #4058F8, #282828, #000000

    rgb   #F8F888, #000000, #10A840, #F8B898
    rgb   #F8F888, #000000, #F87808, #F8B888
    rgb   #F8F8F8, #000000, #F80828, #F8B898
IF __PATCH_0__
    ; Palette used by the blinking "you are here"
    ; map marker (alternates with OAM palette 0)
    rgb   #F8F8F8, #F8B030, #D80000, #000000
ELSE
    ; Bug: In early revisions, the map marker only
    ; blinks on DMG, and this palette is unused
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
ENDC
    rgb   #F8F888, #606000, #10A840, #000000
    rgb   #F8F888, #F80828, #F80828, #F8F8F8
    rgb   #F8F888, #000000, #985020, #E0B050
    rgb   #F8F888, #000000, #1880F8, #F8F8F8

Data_021_78EE:
    rgb   #000000, #283098, #4058F8, #F8F8F8
    rgb   #000000, #101878, #2838D0, #B0B0B8
    rgb   #000000, #000040, #0000A0, #686868
    rgb   #000000, #7880C8, #B0B0D8, #F8F8F8
    rgb   #7880C8, #7880C8, #B0B0D8, #F8F8F8
    rgb   #6068B0, #7880C8, #B0B0D8, #F8F8F8
    rgb   #485098, #7880C8, #B0B0D8, #F8F8F8
    rgb   #000000, #000000, #000000, #000000

    rgb   #F8F888, #000000, #10A840, #F8B888
    rgb   #F8F888, #000000, #F87808, #F8B888
    rgb   #F8F8F8, #000000, #F80828, #F8B888
    rgb   #F8F8F8, #000000, #1880F8, #F8B888
    rgb   #000000, #F0F8D8, #F0F8D8, #F0F8D8
    rgb   #000000, #F0F8D8, #F0F8D8, #F0F8D8
    rgb   #000000, #F8F800, #989800, #707000
    rgb   #000000, #D8E030, #806088, #482860

Data_021_796E:
    rgb   #4058F8, #9090B8, #9090B8, #F8F8F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #3048F8, #8898F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #4058F8, #C88818, #F8F860, #F8F8F8

    rgb   #98A8F8, #000000, #4058F8, #F8F8F8
    rgb   #98A8F8, #000000, #408860, #F88020
    rgb   #98A8F8, #000000, #A84030, #F8C090
    rgb   #98A8F8, #000000, #A84030, #581808
    rgb   #98A8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #98A8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #98A8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #98A8F8, #F8F8F8, #F8F8F8, #F8F8F8

Data_021_79EE:
    rgb   #4058F8, #9090B8, #9090B8, #F8F8F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #3048F8, #8898F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #4058F8, #C88818, #F8F860, #F8F8F8

    rgb   #4058F8, #402058, #98C838, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #98A8F8, #000000, #F0F848, #F8F8F8

Data_021_7A6E:
    rgb   #4058F8, #9090B8, #9090B8, #F8F8F8
    rgb   #182098, #000000, #F88020, #A84030
    rgb   #581808, #000000, #A84030, #F8C090
    rgb   #182098, #000000, #408860, #F8C090
    rgb   #182098, #000000, #3048F8, #8898F8
    rgb   #A84030, #000000, #F86840, #F8C090
    rgb   #182098, #000000, #581808, #A84030
    rgb   #182098, #000000, #A84030, #F8C090

    rgb   #003800, #000000, #4058F8, #F8F8F8
    rgb   #003800, #004060, #F88020, #408860
    rgb   #003800, #408860, #F88020, #F0F848
    rgb   #003800, #182098, #F8F8F8, #F8F8F8
    rgb   #003800, #000000, #A84030, #F8C090
    rgb   #003800, #F86840, #F88020, #F8F8F8
    rgb   #003800, #A84030, #F88020, #F0F848
    rgb   #003800, #004060, #F86840, #408860

Data_021_7AEE:
    rgb   #4058F8, #9090B8, #9090B8, #F8F8F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #3048F8, #8898F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #4058F8, #C88818, #F8F860, #F8F8F8

    rgb   #283098, #F8F8F8, #58A8A8, #007880
    rgb   #98A8F8, #000000, #004060, #408860
    rgb   #98A8F8, #000000, #F88020, #F0F848
    rgb   #98A8F8, #000000, #F86840, #F8C090
    rgb   #98A8F8, #000000, #581808, #A84030
    rgb   #98A8F8, #000000, #A84030, #F8C090
    rgb   #98A8F8, #F8F8F8, #F8F8F8, #F8F8F8
    rgb   #98A8F8, #000000, #F0F848, #F8F8F8

Data_021_7B6E:
    rgb   #4058F8, #9090B8, #9090B8, #F8F8F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #3048F8, #8898F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #4058F8, #C88818, #F8F860, #F8F8F8

    rgb   #98A8F8, #000000, #183020, #584030
    rgb   #98A8F8, #000000, #583010, #381810
    rgb   #98A8F8, #000000, #381810, #200808
    rgb   #98A8F8, #000000, #183020, #001820
    rgb   #98A8F8, #000000, #582818, #584030
    rgb   #98A8F8, #000000, #381810, #183020
    rgb   #98A8F8, #000000, #001820, #584030
    rgb   #98A8F8, #000000, #001820, #381810

Data_021_7BEE:
    rgb   #4058F8, #9090B8, #9090B8, #F8F8F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #3048F8, #8898F8
    rgb   #182098, #000000, #000000, #000000
    rgb   #182098, #000000, #000000, #000000
    rgb   #4058F8, #C88818, #F8F860, #F8F8F8

    rgb   #283098, #000000, #408860, #F8F8F8
    rgb   #98A8F8, #F8C090, #004060, #408860
    rgb   #98A8F8, #000000, #F88020, #A84030
    rgb   #98A8F8, #000000, #F8C090, #A84030
    rgb   #98A8F8, #000000, #581808, #A84030
    rgb   #98A8F8, #000000, #007880, #F8F8F8
    rgb   #98A8F8, #7800F8, #F83070, #A8A800
    rgb   #98A8F8, #000000, #4058F8, #F8F8F8

Data_021_7C6E:
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #1830F8, #000058, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #A818F8, #380078, #000000

    rgb   #F8F888, #000000, #10A840, #F8B888
    rgb   #F8F888, #000000, #F87808, #F8B888
    rgb   #F8F8F8, #000000, #F80828, #F8B888
    rgb   #F8F8F8, #000000, #1880F8, #F8B888
    rgb   #F8F8F8, #F8B030, #E81830, #000000
    rgb   #F8F8F8, #70A8F8, #0000F8, #000000
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

Data_021_7CEE:
    rgb   #7898F8, #9090B8, #9090B8, #F8F8F8
    rgb   #7898F8, #000000, #000000, #000000
    rgb   #7898F8, #588098, #F0A8B8, #F8F8F8
    rgb   #7898F8, #306038, #588098, #F0A8B8
    rgb   #182098, #000000, #3048F8, #8898F8
    rgb   #7898F8, #000000, #000000, #000000
    rgb   #7898F8, #000000, #000000, #000000
    rgb   #7898F8, #000000, #000000, #000000

    rgb   #F8F888, #000000, #10A840, #F8B888
    rgb   #F8F888, #000000, #F87808, #F8B888
    rgb   #F8F8F8, #000000, #F80828, #F8B888
    rgb   #000000, #F0F8D8, #F0F8D8, #F0F8D8
    rgb   #000000, #F0F8D8, #F0F8D8, #F0F8D8
    rgb   #000000, #F0F8D8, #F0F8D8, #F0F8D8
    rgb   #000000, #F8F800, #989800, #707000
    rgb   #000000, #D8E030, #806088, #482860

Data_021_7D6E:
    rgb   #000000, #40B8C0, #407880, #F0F8E0
    rgb   #000000, #30C058, #089830, #F0F8E0
    rgb   #000000, #A8A800, #787828, #F0F8E0
    rgb   #000000, #F860A0, #A84060, #F0F8E0
    rgb   #000000, #D03088, #803058, #F0F8E0
    rgb   #000000, #B050C8, #783088, #F0F8E0
    rgb   #000000, #8060E0, #4840F8, #F0F8E0
    rgb   #000000, #F88830, #986020, #F0F8E0

    rgb   #F8F888, #000000, #10A840, #F8B888
    rgb   #F8F888, #000000, #F87808, #F8B888
    rgb   #F8F8F8, #000000, #F80828, #F8B888
    rgb   #F8F8F8, #000000, #1880F8, #F8B888
    rgb   #000000, #F0F8D8, #F0F8D8, #F0F8D8
    rgb   #000000, #F0F8D8, #F0F8D8, #F0F8D8
    rgb   #000000, #F8F800, #989800, #707000
    rgb   #000000, #D8E030, #806088, #482860

; palette data for the title screen, including the Marin part.
Title_BG_Palettes::
IF LANG_JP
    rgb   #F8F8F8, #E83028, #B80028, #000000 ; BG
    rgb   #F8F8F8, #F8C020, #F87020, #000000
ELSE
    rgb   #F8F8F8, #F84840, #B80028, #000000
    rgb   #482000, #287018, #002838, #000000
ENDC
    rgb   #F8F8F8, #60C850, #881010, #000000
    rgb   #F8F8F8, #6860F8, #002838, #E82098
    rgb   #F8F890, #E0B020, #606000, #000000
    rgb   #F8F890, #60C850, #002838, #000000
    rgb   #F8F8F8, #D89048, #A04880, #6860F8
    rgb   #F8F8F8, #6860F8, #002838, #000000

    rgb   #0090F8, #000000, #109008, #F8B898 ; OBJ
    rgb   #0090F8, #A0A0B0, #F8D028, #00B8F8
    rgb   #0090F8, #306090, #C0C8D8, #000850
    rgb   #0090F8, #000000, #C88830, #F8B898
    rgb   #A858F0, #F0D890, #A8A880, #787840
IF LANG_JP
    rgb   #A8B8F0, #E0B020, #505000, #000000
    rgb   #A8B8F0, #E0B020, #505000, #000000
ELSE
    rgb   #A8B8F0, #000000, #886840, #F8D078
    rgb   #A8B8F0, #000000, #886840, #F8D078
ENDC
    rgb   #A8B8F0, #F8F8F8, #282800, #F8F8F8
